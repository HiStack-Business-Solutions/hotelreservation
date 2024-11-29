<?php

namespace Botble\Hotel\Http\Controllers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Hotel\Enums\BookingStatusEnum;
use Botble\Hotel\Http\Requests\CheckoutRequest;
use Botble\Hotel\Mails\BookingMailer;
use Botble\Hotel\Models\Booking;
use Botble\Hotel\Models\Place;
use Botble\Hotel\Models\Room;
use Botble\Hotel\Repositories\Eloquent\RoomCategoryRepository;
use Botble\Hotel\Repositories\Interfaces\BookingAddressInterface;
use Botble\Hotel\Repositories\Interfaces\BookingInterface;
use Botble\Hotel\Repositories\Interfaces\BookingRoomInterface;
use Botble\Hotel\Repositories\Interfaces\PlaceInterface;
use Botble\Hotel\Repositories\Interfaces\RoomCategoryInterface;
use Botble\Hotel\Repositories\Interfaces\RoomInterface;
use Botble\Hotel\Repositories\Interfaces\ServiceInterface;
use Botble\Hotel\Services\BookingService;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Http\Requests\PayPalPaymentCallbackRequest;
use Botble\Payment\Repositories\Interfaces\PaymentInterface;
use Botble\Payment\Services\Gateways\BankTransferPaymentService;
use Botble\Payment\Services\Gateways\CodPaymentService;
use Botble\Payment\Services\Gateways\PayPalPaymentService;
use Botble\Payment\Services\Gateways\StripePaymentService;
use Botble\SeoHelper\SeoOpenGraph;
use Botble\Slug\Repositories\Interfaces\SlugInterface;
use Carbon\Carbon;
use DateTime;
use EmailHandler;
use Exception;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Arr;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Str;
use Response;
use RvMedia;
use SebastianBergmann\Environment\Console;
use SeoHelper;
use SlugHelper;
use Theme;
use Throwable;

class PublicController extends Controller
{
    function uuidv4()
    {
        $data = random_bytes(16);

        $data[6] = chr(ord($data[6]) & 0x0f | 0x40); // set version to 0100
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80); // set bits 6-7 to 10
            
        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }
    public function getMultiBookRoomItem($roomId, SlugInterface $slugRepository, RoomInterface $roomRepository, Request $request) {
        $room = $roomRepository->getFirstBy(
            ['id' => $roomId],
            ['*'],
        );

        if (!$room) {
            abort(404);
        }
        $request->headers->set('no_admin_bar', true);
        return view(Theme::getThemeNamespace() . '::views.hotel.includes.book-room-item', array_merge(['checkout' => false, 'bookings' => []], compact('room')))->render();
    }
    /**
     * @param Request $request
     * @param RoomInterface $roomRepository
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse|Response
     * @throws \Throwable
     */
    public function getRooms(Request $request, RoomInterface $roomRepository, RoomCategoryInterface $roomCategoryRepository, BaseHttpResponse $response)
    {
        SeoHelper::setTitle(__('Rooms'));

        if ($request->input('start_date') && $request->input('end_date')) {
            $startDate = Carbon::createFromFormat('d-m-Y', $request->input('start_date'));
            $endDate = Carbon::createFromFormat('d-m-Y', $request->input('end_date'));
        } else {
            $startDate = now();
            $endDate = now()->addDay();
        }

        $nights = $endDate->diffInDays($startDate);

        if ($request->ajax() && $request->wantsJson()) {
            if (strtotime($startDate->toDateString()) - strtotime($endDate->toDateString()) < 60 * 60 * 24) {
                return $response
                    ->setError(true)
                    ->setMessage(__('Dates are not valid'));
            }

            if ($nights > 30) {
                return $response
                    ->setError(true)
                    ->setMessage(__('Maximum day for booking is 30'));
            }
        }

        $filters = [
            'keyword' => $request->query('q'),
        ];

        $params = [
            'paginate' => [
                'per_page'      => 10,
                'current_paged' => (int)$request->input('page', 1),
            ],
        ];

        $allRooms = $roomRepository->getRooms($filters, $params);

        $condition = [
            'start_date' => $startDate->format('d-m-Y'),
            'end_date'   => $endDate->format('d-m-Y'),
            'adults'     => $request->input('adults', 1),
            'category'   => $request->input('category', empty($categories) ? 0 : $categories[0]->id)
        ];

        $rooms = $allRooms->all();

        $categories = $roomCategoryRepository->getModel()->all();

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(__('Rooms'), route('public.rooms'));

        if ($request->ajax() && $request->wantsJson()) {
            $data = '';
            foreach ($rooms as $room) {
                if ($room->isAvailableAt($condition)) {
                    $data .= view(Theme::getThemeNamespace() . '::views.hotel.includes.room-item',
                        compact('room'))->render();
                }
            }

            return $response->setData($data);
        }

        $numberOfRooms = [];
        foreach ($rooms as $r) {
            $numberOfRooms[$r->id] = 0;
        }
        return Theme::scope('hotel.rooms', compact('rooms', 'nights', 'categories', 'numberOfRooms'))->render();
    }

    /**
     * @param string $key
     * @param SlugInterface $slugRepository
     * @param RoomInterface $roomRepository
     * @return Response
     */
    public function getRoom(string $key, SlugInterface $slugRepository, RoomInterface $roomRepository)
    {
        $slug = $slugRepository->getFirstBy([
            'slugs.key'      => $key,
            'reference_type' => Room::class,
            'prefix'         => SlugHelper::getPrefix(Room::class),
        ]);

        if (!$slug) {
            abort(404);
        }

        $room = $roomRepository->getFirstBy(
            ['id' => $slug->reference_id],
            ['*'],
            ['amenities', 'currency', 'category']
        );

        if (!$room) {
            abort(404);
        }

        SeoHelper::setTitle($room->name)->setDescription(Str::words($room->description, 120));

        $meta = new SeoOpenGraph;
        if ($room->image) {
            $meta->setImage(RvMedia::getImageUrl($room->image));
        }
        $meta->setDescription($room->description);
        $meta->setUrl($room->url);
        $meta->setTitle($room->name);
        $meta->setType('article');

        SeoHelper::setSeoOpenGraph($meta);

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add($room->name, $room->url);

        $relatedRooms = $roomRepository->getRelatedRooms($room->id,
            theme_option('number_of_related_rooms', 2));

        do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, ROOM_MODULE_SCREEN_NAME, $room);

        $images = [];
        foreach ($room->images as $image) {
            $images[] = RvMedia::getImageUrl($image, null, false, RvMedia::getDefaultImage());
        }
        $roomBookings = []; // only calculate for maxRooms
        foreach ($relatedRooms as $r) {
            $roomBookings[$r->id] = [
                'maxRooms' => $r->number_of_rooms,
                'isAvailable' => true
            ];
        }
        return Theme::scope('hotel.room', compact('room', 'images', 'relatedRooms', 'roomBookings'))->render();
    }

    /**
     * @param string $key
     * @param SlugInterface $slugRepository
     * @param PlaceInterface $placeRepository
     * @return Response
     */
    public function getPlace(string $key, SlugInterface $slugRepository, PlaceInterface $placeRepository)
    {
        $slug = $slugRepository->getFirstBy([
            'slugs.key'      => $key,
            'reference_type' => Place::class,
            'prefix'         => SlugHelper::getPrefix(Place::class),
        ]);

        if (!$slug) {
            abort(404);
        }

        $place = $placeRepository->getFirstBy(
            ['id' => $slug->reference_id],
            ['*'],
            ['slugable']
        );

        if (!$place) {
            abort(404);
        }

        SeoHelper::setTitle($place->name)->setDescription(Str::words($place->description, 120));

        $meta = new SeoOpenGraph;
        if ($place->image) {
            $meta->setImage(RvMedia::getImageUrl($place->image));
        }
        $meta->setDescription($place->description);
        $meta->setUrl($place->url);
        $meta->setTitle($place->name);
        $meta->setType('article');

        SeoHelper::setSeoOpenGraph($meta);

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add($place->name, $place->url);

        $relatedPlaces = $placeRepository->getRelatedPlaces($place->id, 3);

        do_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, PLACE_MODULE_SCREEN_NAME, $place);

        return Theme::scope('hotel.place', compact('place', 'relatedPlaces'))->render();
    }

    /**
     * @param Request $request
     * @param RoomInterface $roomRepository
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function postBooking(Request $request, RoomInterface $roomRepository, BaseHttpResponse $response)
    {
        $request->validate([
            'start_date' => 'required:date_format:d-m-Y',
            'end_date'   => 'required:date_format:d-m-Y',
            'adults'     => 'required',
        ]);
        $multiBook = boolval($request["multiple_booking"]);
        if (!$multiBook) { 
            $room = $roomRepository->getFirstBy(
                ['id' => $request->input('room_id')],
                ['*'],
                ['currency', 'category']
            );
            
            if (!$room) {
                abort(404);
            }
        } else {
            $bookings = $request["numberOfRooms"];
            $roomIds = array_keys($bookings);
            $rooms = $roomRepository->getByWhereIn("id", $roomIds);
            if (count($rooms) != count($bookings)) {
                abort(404);
            }
        }

        $token = md5(Str::random(40));

        session([$token => $request->except(['_token'])]);

        return $response->setNextUrl(route('public.booking.form', $token));
    }
    private function createNightDates(string $startDate, int $nights) {
        $date = new DateTime($startDate);
        $nightDates = [];
        for ($i = 0; $i < $nights; $i++) {
            // Output the current date in d-m-Y format
            $nightDates[] = $date->format('d-m-Y');
        
            // Modify the date, e.g., add 1 day
            $date->modify('+1 day');
        }
        return $nightDates;
    }
    private function calculateRoomPrice(Room $room, string $nightDate) {
        $filteredRoomDates = $room->roomDatesTwo->filter(function($roomDate) use ($room, $nightDate) {
            return $roomDate->room_id == $room['id'] && Carbon::parse($roomDate->start_date)->format('d-m-Y') == $nightDate;
        })->first();
        
        // dd($room);
        if($filteredRoomDates != null){
            if (!$filteredRoomDates->active) {
                abort(404, 'Room ' . $room->name . ' is already fully booked.');
            }
            $roomDate = $filteredRoomDates;
            $room->price = $roomDate->price;
            $taxAmount = $room->tax->percentage * $room->price / 100;
            $price = $room->price;
            $discount = $roomDate['discount'];
            $available_rooms = $roomDate->number_of_rooms;
            if($discount > 0){
                $price = strval($price * (1 - $discount / 100));
                $discount_amount = $discount * $price;
                $taxAmount = $room->tax->percentage * $price / 100;
                $price = $price + $taxAmount;
            }
        }
        else{
            $discount = 0;
            $discount_amount = 0;
            $taxAmount = $room->tax->percentage * $room->price / 100;
            $price = $room->price + $taxAmount;
            $available_rooms = $room->number_of_rooms;
        }
        return [
            'discount' => $discount,
            'discount_amount' => $discount_amount,
            'taxAmount' => $taxAmount,
            'price' => $price,
            'available_rooms' => $available_rooms
        ];
    }
    
    private function getMultiBooking($sessionData, RoomInterface $roomRepository) {
        $numberOfRooms = Arr::get($sessionData, 'numberOfRooms');
        if (!$numberOfRooms) {
            $numberOfRooms = [Arr::get($sessionData, 'room_id') => 1];
        }
        $numberOfRooms = collect($numberOfRooms)->map(function ($x) { return intval($x); })->all();
        $rooms = new Collection();
        if ($numberOfRooms) {
            $roomIds = array_filter(array_keys($numberOfRooms), function($x) use($numberOfRooms) { return $numberOfRooms[$x] > 0; });
            $rooms = $roomRepository->getByWhereIn("id", $roomIds);
        }
        return [
            'numberOfRooms' => $numberOfRooms,
            'rooms' => $rooms
        ];
    }
    private function calculateBooking($sessionData, ServiceInterface $serviceRepository, RoomInterface $roomRepository) {
        $multiBook = boolval(Arr::get($sessionData, 'multiple_booking'));
        $startDate = Carbon::createFromFormat('d-m-Y', Arr::get($sessionData, 'start_date'));
        $endDate = Carbon::createFromFormat('d-m-Y', Arr::get($sessionData, 'end_date'));
        $nights = $endDate->diffInDays($startDate);
        $adults = Arr::get($sessionData, 'adults');
        $adults = $adults == 0 ? 1 : $adults;
        $room = $roomRepository->getFirstBy(
            ['id' => Arr::get($sessionData, 'room_id')],
            ['*'],
            ['currency', 'category']
        );
        ['numberOfRooms'=> $numberOfRooms, 'rooms' => $rooms] = $this->getMultiBooking($sessionData, $roomRepository);
        if (!$multiBook) {
            $numberOfRooms = new Collection();
            $rooms = new Collection();
        }
        if (!$room && !$rooms) {
            abort(404);
        }

        $nightDates = $this->createNightDates($startDate, $nights);
        $total = 0;
        $discount = 0;
        $discount_amount = 0;
        $taxAmount = 0;
        $maxRoomsBooking = [];
        
        $calcTotal = function(Room $room) use 
            ($nightDates,  
            &$total,                        
            &$discount,
            &$discount_amount,              
            &$taxAmount,
            $numberOfRooms
        ) {
            $roomBooking = ['total' => 0, 'discount' => 0, 'discount_amount' => 0, 'taxAmount' => 0, 'services' => new Collection(), 'maxRooms' => PHP_INT_MAX];
            foreach ($nightDates as $nightDate) {
                $roomPrice = $this->calculateRoomPrice($room, $nightDate);
                if ($numberOfRooms[$room->id] > $roomPrice['available_rooms']) {
                    abort(404, "Jumlah booking room melebihi available room untuk tipe " . $room->name);
                }
                $roomBooking['total'] += $roomPrice['price'];
                $roomBooking['discount'] = $discount > $roomPrice['discount'] ? $discount : $roomPrice['discount'];
                $roomBooking['discount_amount'] += $roomPrice['discount_amount'];
                $roomBooking['taxAmount'] += $roomPrice['taxAmount'];
                $roomBooking['maxRooms'] = min($roomPrice['available_rooms'], $roomBooking['maxRooms']); // use the minimum strategy across all dates
            }
            $total += $roomBooking['total'];
            $discount = max($discount, $roomBooking['discount']);
            $discount_amount += $roomBooking['discount_amount'];
            $taxAmount += $roomBooking['taxAmount'];

            return $roomBooking;
        };
        
        $max_caps = $rooms->map(function($room) use($numberOfRooms) {
            return [
                'max_adults' => $room->max_adults * $numberOfRooms[$room->id],
                'max_children' => $room->max_children * $numberOfRooms[$room->id], 
            ];
        })->reduce(function($carry, $item) {
            $carry['max_adults'] += $item['max_adults'];
            $carry['max_children'] += $item['max_children'];
            return $carry;
        }, ['max_adults'=>0, 'max_children'=>0]);
        $max_adults = $max_caps['max_adults'];
        $max_children = $max_caps['max_children'];

        if (!$multiBook) {
            $rooms->push($room);
            $numberOfRooms[$room->id] = 1;
        }
        $roomBookings = [];
        foreach($rooms as $r) {
            $number_of_rooms = $numberOfRooms[$r->id];
            for($qty = 0; $qty < $number_of_rooms; $qty++) {
                $roomBookings[$r->id] = $calcTotal($r);
            }
            $roomBookings[$r->id]['number_of_rooms'] = $number_of_rooms;
        }
        
        $services = $serviceRepository->allBy(['status' => BaseStatusEnum::PUBLISHED]);
        
        return [
            'discount' => $discount,
            'discount_amount' => $discount_amount,
            'room' => $room,
            'rooms' => $rooms,
            'services' => $services,
            'startDate' => $startDate,
            'endDate' => $endDate,
            'adults' => $adults,
            'max_adults' => $max_adults,
            'max_children' => $max_children,
            'total' => $total,
            'taxAmount' => $taxAmount,
            'multiBook' => $multiBook,
            'roomBookings' => $roomBookings
        ];
    }
    /**
     * @param string $token
     * @param RoomInterface $roomRepository
     * @param ServiceInterface $serviceRepository
     * @return Response
     */
    public function getBooking($token, RoomInterface $roomRepository, ServiceInterface $serviceRepository)
    {
        SeoHelper::setTitle(__('Booking'));

        $sessionData = [];
        if (session()->has($token)) {
            $sessionData = session($token);
        }

        if (empty($sessionData)) {
            abort(404);
        }

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(__('Booking'), route('public.booking'));

        Theme::asset()->add('card-css', asset('vendor/core/plugins/payment/libraries/card/card.css'), [], [], '1.0.0');
        Theme::asset()->add('payment-css', asset('vendor/core/plugins/payment/css/payment.css'), [], [], '1.0.0');

        Theme::asset()
            ->container('footer')
            ->add('card-js', asset('vendor/core/plugins/payment/libraries/card/card.js'), ['jquery'], [], '1.0.0');

        if (setting('payment_stripe_status') == 1) {
            Theme::asset()
                ->container('footer')
                ->add('stripe-js', asset('https://js.stripe.com/v2/'), [], [], '1.0.0');
        }

        Theme::asset()
            ->container('footer')
            ->add('payment-js', asset('vendor/core/plugins/payment/js/payment.js'), ['jquery'], [], '1.0.0');

        [
            'discount' => $discount,
            'discount_amount' => $discount_amount,
            'room' => $room,
            'rooms' => $rooms,
            'services' => $services,
            'startDate' => $startDate,
            'endDate' => $endDate,
            'adults' => $adults,
            'max_adults' => $max_adults,
            'max_children' => $max_children,
            'total' => $total,
            'taxAmount' => $taxAmount,
            'multiBook' => $multiBook,
            'roomBookings' => $roomBookings
        ] = $this->calculateBooking($sessionData, $serviceRepository, $roomRepository);
        
        return Theme::scope('hotel.booking', array_merge(['multiBook'=>$multiBook, 'checkout' => true], compact(
                'discount',
                'discount_amount',
                'room',
                'rooms',
                'services',
                'startDate',
                'endDate',
                'adults',
                'max_adults',
                'max_children',
                'total',
                'roomBookings',
                'taxAmount',
                'token'
            ))
        )->render();
    }

    /**
     * @param CheckoutRequest $request
     * @param BookingInterface $bookingRepository
     * @param RoomInterface $roomRepository
     * @param BookingAddressInterface $bookingAddressRepository
     * @param BookingRoomInterface $bookingRoomRepository
     * @param ServiceInterface $serviceRepository
     * @param PayPalPaymentService $payPalService
     * @param StripePaymentService $stripePaymentService
     * @param CodPaymentService $codPaymentService
     * @param BankTransferPaymentService $bankTransferPaymentService
     * @param BookingService $bookingService
     * @return \Illuminate\Http\RedirectResponse
     */
    public function postCheckout(
        CheckoutRequest $request,
        BookingInterface $bookingRepository,
        RoomInterface $roomRepository,
        BookingAddressInterface $bookingAddressRepository,
        BookingRoomInterface $bookingRoomRepository,
        ServiceInterface $serviceRepository,
        PayPalPaymentService $payPalService,
        StripePaymentService $stripePaymentService,
        CodPaymentService $codPaymentService,
        BankTransferPaymentService $bankTransferPaymentService,
        BookingService $bookingService
    ) {
        $booking = $bookingRepository->getModel();
        $booking->fill($request->except('nik'));
        
        [
            'discount' => $discount,
            'discount_amount' => $discount_amount,
            'room' => $room,
            'rooms' => $rooms,
            'services' => $services,
            'startDate' => $startDate,
            'endDate' => $endDate,
            'adults' => $adults,
            'max_adults' => $max_adults,
            'max_children' => $max_children,
            'total' => $total,
            'taxAmount' => $taxAmount,
            'multiBook' => $multiBook,
            'roomBookings' => $roomBookings
        ] = $this->calculateBooking($request->except(['_token']), $serviceRepository, $roomRepository);

        $booking->amount = $total;
        $booking->tax_amount = $taxAmount;
        $booking->discount = $discount;
        $booking->discount_amount = $discount_amount;
        $booking->transaction_id = strtoupper($this->uuidv4());

        if ($request->input('services')) {
            $services = $serviceRepository->getModel()
                ->whereIn('id', $request->input('services'))
                ->get();

            foreach ($services as $service) {
                $booking->amount += $service->price;
            }
        }

        $booking = $bookingRepository->createOrUpdate($booking);
        if ($request->input('services')) {
            $booking->services()->attach($request->input('services'));
        }

        foreach($rooms as $r) {
            $bookingRoomRepository->createOrUpdate([
                'room_id'           => $r->id,
                'booking_id'        => $booking->id,
                'price'             => $roomBookings[$r->id]['total'],
                'discount_amount'   => $roomBookings[$r->id]['discount_amount'],
                'tax_amount'        => $roomBookings[$r->id]['taxAmount'],
                'currency_id'       => $r->currency_id,
                'number_of_rooms'   => $roomBookings[$r->id]['number_of_rooms'],
                'start_date'        => $startDate->format('Y-m-d'),
                'end_date'          => $endDate->format('Y-m-d'),
            ]);
        }

        $bookingAddress = $bookingAddressRepository->getModel();
        $bookingAddress->fill($request->input());
        $bookingAddress->booking_id = $booking->id;
        $bookingAddressRepository->createOrUpdate($bookingAddress);

        $request->merge([
            'order_id' => $booking->id,
        ]);

        $paymentData = [
            'error'     => false,
            'message'   => false,
            'amount'    => $booking->amount,
            'currency'  => strtoupper(get_application_currency()->title),
            'type'      => $request->input('payment_method'),
            'charge_id' => null,
        ];

        switch ($request->input('payment_method')) {
            case PaymentMethodEnum::STRIPE:
                $result = $stripePaymentService->execute($request);
                if (!$result) {
                    $paymentData['error'] = true;
                    $paymentData['message'] = $stripePaymentService->getErrorMessage();
                } else {
                    $paymentData['charge_id'] = $result;
                }

                break;

            case PaymentMethodEnum::PAYPAL:
                $checkoutUrl = $payPalService->execute($request);
                if ($checkoutUrl) {
                    return redirect($checkoutUrl);
                }

                $paymentData['error'] = true;
                $paymentData['message'] = $payPalService->getErrorMessage();
                break;
            case PaymentMethodEnum::COD:
                $paymentData['charge_id'] = $codPaymentService->execute($request);
                break;

            case PaymentMethodEnum::BANK_TRANSFER:
                $paymentData['charge_id'] = $bankTransferPaymentService->execute($request);
                break;
            default:
                $paymentData = apply_filters(PAYMENT_FILTER_AFTER_POST_CHECKOUT, $paymentData, $request);
                break;
        }

        $bookingService->processBooking($booking->id, $paymentData['charge_id']);

        if ($request->input('token')) {
            session()->forget($request->input('token'));
        }

        return redirect()
            ->route('public.booking.information', $booking->transaction_id)
            ->with('success_msg', __('Checkout successfully!'));
    }

    /**
     * @param string $transactionId
     * @param BookingInterface $bookingRepository
     * @return \Illuminate\Http\RedirectResponse|Response
     */
    public function checkoutSuccess($transactionId, BookingInterface $bookingRepository)
    {
        $booking = $bookingRepository->getFirstBy(['transaction_id' => $transactionId]);

        if (!$booking) {
            abort(404);
        }
        try {
            if (!$booking->is_order_emailed) {
                BookingMailer::sendBookingInfoEmail($booking);
                $booking->is_order_emailed = true;
                $bookingRepository->update(['id'=> $booking->id], ['is_order_emailed' => true]);
            }
        } catch (Exception $err) {
            Log::error($err);
        }
            
        SeoHelper::setTitle(__('Booking Information'));

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(__('Booking'), route('public.booking.information', $transactionId));
        $fileName = $booking->id . '-' . $booking->transaction_id;
        $fileExists = Storage::exists('public/payment_proofs/' . $fileName);
        $showUploadForm = true;
        return Theme::scope('hotel.booking-information', compact('booking', 'fileExists', 'fileName', 'showUploadForm'))->render();
    }

    public function storePaymentProof(Request $request, BookingInterface $bookingRepository)
    {
        $request->validate([
            'payment_proof' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        // Retrieve the uploaded file
        $file = $request->file('payment_proof');

        // Define a unique file name and store the file
        
        $booking = Booking::find($request->booking_id);

        if (!$booking) {
            abort(404);
        }        
        $filename = $booking->id . '-' . $booking->transaction_id;
        $path = $file->storeAs('public/payment_proofs', $filename);

        // Store the file path in the database associated with the booking
        $booking->payment->payment_proof = $filename;
        $booking->payment->save();

        return back()->with('success', 'Payment proof uploaded successfully.');
    }
    /**
     * @param Request $request
     * 
     * @param BaseHttpResponse $response
     * @param RoomInterface $roomRepository
     * @param ServiceInterface $serviceRepository
     */
    public function ajaxCalculateBookingAmount(
        Request $request,
        BaseHttpResponse $response,
        RoomInterface $roomRepository,
        ServiceInterface $serviceRepository
    ) {
        $request->validate([
            'start_date' => 'required:date_format:d-m-Y',
            'end_date'   => 'required:date_format:d-m-Y',
            'room_id'    => 'required',
        ]);

        $sessionData = $request->except("_token");
        [
            'discount' => $discount,
            'discount_amount' => $discount_amount,
            'room' => $room,
            'rooms' => $rooms,
            'services' => $services,
            'startDate' => $startDate,
            'endDate' => $endDate,
            'adults' => $adults,
            'max_adults' => $max_adults,
            'max_children' => $max_children,
            'total' => $amount,
            'taxAmount' => $taxAmount,
            'multiBook' => $multiBook,
            'roomBookings' => $roomBookings
        ] = $this->calculateBooking($sessionData, $serviceRepository, $roomRepository);

        if ($request->input('services')) {
            $services = $serviceRepository->getModel()
                ->whereIn('id', $request->input('services'))
                ->get();

            foreach ($services as $service) {
                $amount += $service->price;
            }
        }

        return $response->setData([
            'amount'     => format_price($amount),
            'amount_raw' => $amount,
        ]);
    }

    /**
     * @param PayPalPaymentCallbackRequest $request
     * @param PayPalPaymentService $palPaymentService
     * @param BaseHttpResponse $response
     * @param BookingService $bookingService
     * @return BaseHttpResponse
     */
    public function getPayPalStatus(
        PayPalPaymentCallbackRequest $request,
        PayPalPaymentService $palPaymentService,
        BaseHttpResponse $response,
        BookingService $bookingService
    ) {
        $palPaymentService->afterMakePayment($request);

        $booking = $bookingService->processBooking($request->input('order_id'), $request->input('paymentId'));

        return $response
            ->setNextUrl(route('public.booking.information', $booking->transaction_id))
            ->setMessage(__('Checkout successfully!'));
    }
}
