<?php

namespace Botble\Hotel\Http\Controllers;

use Botble\Base\Enums\BaseStatusEnum;
use Botble\Base\Http\Responses\BaseHttpResponse;
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

        $rooms = [];
        foreach ($allRooms as $allRoom) {
            if ($allRoom->isAvailableAt($condition)) {
                $rooms[] = $allRoom;
            }
        }

        $categories = $roomCategoryRepository->getModel()->all();

        Theme::breadcrumb()
            ->add(__('Home'), url('/'))
            ->add(__('Rooms'), route('public.rooms'));

        if ($request->ajax() && $request->wantsJson()) {
            foreach ($rooms as $room) {
                $data = view(Theme::getThemeNamespace() . '::views.hotel.includes.room-item',
                    compact('room'))->render();
            }

            return $response->setData($data);
        }

        return Theme::scope('hotel.rooms', compact('rooms', 'nights', 'categories'))->render();
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

        return Theme::scope('hotel.room', compact('room', 'images', 'relatedRooms'))->render();
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
            $bookings = $request["rooms"];
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
    private function calculateRoomPrice(Room $room, string $nightDate, ServiceInterface $serviceRepository) {
        $filteredRoomDates = $room->roomDatesTwo->filter(function($roomDate) use ($room, $nightDate) {
            return $roomDate->room_id == $room['id'] && Carbon::parse($roomDate->start_date)->format('d-m-Y') == $nightDate;
        })->first();
        
        // dd($room);
        if($filteredRoomDates != null){
            $roomDate = $filteredRoomDates;
            $room->price = $roomDate->price;
            $taxAmount = $room->tax->percentage * $room->price / 100;
            $price = $room->price;
            $services = $serviceRepository->allBy(['status' => BaseStatusEnum::PUBLISHED]);
            $discount = $roomDate['discount'];
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
            $services = $serviceRepository->allBy(['status' => BaseStatusEnum::PUBLISHED]);
        }
        return [
            'discount' => $discount,
            'discount_amount' => $discount_amount,
            'taxAmount' => $taxAmount,
            'services' => $services,
            'price' => $price
        ];
    }
    
    private function getMultiBooking($sessionData, RoomInterface $roomRepository) {
        $bookings = Arr::get($sessionData, 'rooms');
        if (!$bookings) {
            $bookings = [];
        }
        $bookings = collect($bookings)->map(function ($x) { return intval($x); })->all();
        $rooms = new Collection();
        if ($bookings) {
            $roomIds = array_filter(array_keys($bookings), function($x) use($bookings) { return $bookings[$x] > 0; });
            $rooms = $roomRepository->getByWhereIn("id", $roomIds);
        }
        return [
            'bookings' => $bookings,
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
        ['bookings'=> $bookings, 'rooms' => $rooms] = $this->getMultiBooking($sessionData, $roomRepository);
        if (!$room && !$rooms) {
            abort(404);
        }

        $nightDates = $this->createNightDates($startDate, $nights);
        $total = 0;
        $discount = 0;
        $discount_amount = 0;
        $taxAmount = 0;
        $services = new Collection();
        
        $calcTotal = function(Room $room) use 
            ($nightDates, 
            $serviceRepository, 
            &$total,                        
            &$discount,
            &$discount_amount,              
            &$taxAmount,                
            &$services                       
        ) {
            foreach ($nightDates as $nightDate) {
                $roomPrice = $this->calculateRoomPrice($room, $nightDate, $serviceRepository);
                $total += $roomPrice['price'];
                $discount = $discount > $roomPrice['discount'] ? $discount : $roomPrice['discount'];
                $discount_amount += $roomPrice['discount_amount'];
                $taxAmount += $roomPrice['taxAmount'];
                $services = $roomPrice['services'] ? $services->merge($roomPrice['services']) : $services;
            }
        };
        
        $max_caps = $rooms->map(function($room) use($bookings) {
            return [
                'max_adults' => $room->max_adults * $bookings[$room->id],
                'max_children' => $room->max_children * $bookings[$room->id], 
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
            $bookings[$room->id] = 1;
        }
        foreach($rooms as $r) {
            for($qty = 0; $qty < $bookings[$r->id]; $qty++) {
                $calcTotal($r);
            }
        }
        
        $services = $services->unique("id");
        
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
            'bookings' => $bookings,
            'taxAmount' => $taxAmount,
            'multiBook' => $multiBook
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
            'bookings' => $bookings,
            'taxAmount' => $taxAmount,
            'multiBook' => $multiBook
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
                'bookings',
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
        $room = $roomRepository->findOrFail($request->input('room_id'));
        $booking = $bookingRepository->getModel();
        $booking->fill($request->input());
        
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
            'bookings' => $bookings,
            'taxAmount' => $taxAmount,
            'multiBook' => $multiBook
        ] = $this->calculateBooking($request->except(['_token']), $serviceRepository, $roomRepository);
        

        // $taxAmount = $room->tax->percentage * $room->price / 100;
        // $booking->amount = $room->price * $nights + $taxAmount;
        // $booking->tax_amount = $taxAmount;
        $booking->transaction_id = $this->uuidv4();

        if ($services) {
            $services = $serviceRepository->getModel()
                ->whereIn('id', $services)
                ->get();

            foreach ($services as $service) {
                $booking->amount += $service->price;
            }
        }

        $booking = $bookingRepository->createOrUpdate($booking);
        if ($request->input('services')) {
            $booking->services()->attach($request->input('services'));
        }

        $bookingRoomRepository->createOrUpdate([
            'room_id'         => $room->id,
            'booking_id'      => $booking->id,
            'price'           => $room->price,
            'currency_id'     => $room->currency_id,
            'number_of_rooms' => 1,
            'start_date'      => $startDate->format('Y-m-d'),
            'end_date'        => $endDate->format('Y-m-d'),
        ]);

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
        $booking->payment_proof = $filename;
        $booking->save();

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

        $startDate = Carbon::createFromFormat('d-m-Y', $request->input('start_date'));
        $endDate = Carbon::createFromFormat('d-m-Y', $request->input('end_date'));
        $nights = $endDate->diffInDays($startDate);

        $room = $roomRepository->findOrFail($request->input('room_id'));
        $filteredRoomDates = $room->roomDatesTwo->filter(function($roomDate) use ($room, $request) {
            return $roomDate->room_id == $room['id'] && Carbon::parse($roomDate->start_date)->format('d-m-Y') == Arr::get($request, 'start_date');
        })->first();
        // dd($filteredRoomDates);

        if($filteredRoomDates != null){
            $roomDate = $filteredRoomDates;
            $room->price = $roomDate->price;
            $taxAmount = $room->tax->percentage * $room->price / 100;
            $amount = $room->price * $nights;
            $discount = $roomDate['discount'];
            if($discount > 0){
                $amount = strval($amount * (1 - $discount / 100));
                $taxAmount = $room->tax->percentage * $amount / 100;
                $amount = $amount + $taxAmount;
            }
        }
        else{
            $discount = 0;
            $taxAmount = $room->tax->percentage * $room->price / 100;
            $amount = $room->price * $nights + $taxAmount;
        }

        if ($request->input('services')) {
            $services = $serviceRepository->getModel()
                ->whereIn('id', $request->input('services'))
                ->get();

            foreach ($services as $service) {
                $amount += $service->price;
                // if($filteredRoomDates != null && $filteredRoomDates['discount'] > 0){
                //     $amount = $amount * (1 - $discount / 100);
                // }
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
