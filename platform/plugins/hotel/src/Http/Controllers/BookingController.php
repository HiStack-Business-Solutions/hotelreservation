<?php

namespace Botble\Hotel\Http\Controllers;

use Botble\Base\Events\BeforeEditContentEvent;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Events\UpdatedContentEvent;
use Botble\Base\Forms\FormBuilder;
use Botble\Base\Http\Controllers\BaseController;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Hotel\Enums\BookingStatusEnum;
use Botble\Hotel\Forms\BookingForm;
use Botble\Hotel\Http\Requests\BookingRequest;
use Botble\Hotel\Mails\BookingMailer;
use Botble\Hotel\Repositories\Interfaces\BookingInterface;
use Botble\Hotel\Repositories\Interfaces\BookingRoomInterface;
use Botble\Hotel\Repositories\Interfaces\RoomDateInterface;
use Botble\Hotel\Tables\BookingTable;
use Botble\Payment\Enums\PaymentStatusEnum;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;
use NumberFormatter;
use Throwable;

class BookingController extends BaseController
{
    /**
     * @var BookingInterface
     */
    protected $bookingRepository;

    /**
     * @param BookingInterface $bookingRepository
     */
    public function __construct(BookingInterface $bookingRepository)
    {
        $this->bookingRepository = $bookingRepository;
    }

    /**
     * @param BookingTable $table
     * @return Factory|View
     * @throws Throwable
     */
    public function index(BookingTable $table)
    {
        page_title()->setTitle(trans('plugins/hotel::booking.name'));

        return $table->renderTable();
    }

    /**
     * @param $id
     * @param Request $request
     * @param FormBuilder $formBuilder
     * @return string
     */
    public function edit($id, FormBuilder $formBuilder, Request $request)
    {
        $booking = $this->bookingRepository->findOrFail($id);

        event(new BeforeEditContentEvent($request, $booking));

        page_title()->setTitle(trans('plugins/hotel::booking.edit') . ' "' . $booking->room->room->name . '"');

        return $formBuilder->create(BookingForm::class, ['model' => $booking])->renderForm();
    }
    function localStringToNumber($s, $thousandRegex, $decimalRegex) {
        
    }
    
    function parseLocaleNumber($stringNumber, $thousandRegex, $decimalRegex) {
        
    }
    private function getIDRAmount(string $value) {
        $formatter = new NumberFormatter('en', NumberFormatter::CURRENCY);

        // Format the number to get the thousand separator
        $thousandFormatted = $formatter->formatCurrency(11111, 'IDR');
        preg_match('/(.)\d{3}/', $thousandFormatted, $thousandMatches);
        $thousandSeparator = $thousandMatches[1];

        // Format the number to get the decimal separator
        $decimalFormatted = $formatter->formatCurrency(1.1, 'IDR');
        preg_match('/\d+(.)\d+$/', $decimalFormatted, $decimalMatches);
        $decimalSeparator = $decimalMatches[1];

        // Create regular expressions for thousand and decimal separators
        $thousandRegex = '/' . preg_quote($thousandSeparator, '/') . '/';
        $decimalRegex = '/' . preg_quote($decimalSeparator, '/') . '/';
        
        // Remove all characters except digits, dot, comma, and minus sign
        $numForm = preg_replace('/[^0-9.,-]+/', '', (string)$value);
        // Remove thousand separators and replace decimal separator with a dot
        $val = floatval(
            preg_replace($decimalRegex, '.', 
                preg_replace($thousandRegex, '', $numForm)
            )
        );
    
        // If the resulting value is not a number, return 0
        return is_nan($val) ? 0 : $val;
    }
    /**
     * @param $id
     * @param BookingRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, BookingRequest $request, BaseHttpResponse $response, BookingInterface $bookingRepository, RoomDateInterface $roomDateRepository, BookingRoomInterface $bookingRoomRepository)
    {
        $booking = $this->bookingRepository->findOrFail($id);

        $booking->fill($request->input());
        if (!$booking->payment->payment_proof && !in_array($booking->status, [BookingStatusEnum::PENDING(), BookingStatusEnum::PROCESSING(), BookingStatusEnum::CANCELLED()]) ) 
        {
            return $response
                ->setError(true)
                ->setMessage('Perlu Bukti Transfer');
        }
        if (!$booking->payment->payment_proof && $booking->status == BookingStatusEnum::PROCESSING() && $booking->payment->payment_channel == 'down_payment') {
            return $response
                ->setError(true)
                ->setMessage('Perlu Bukti Transfer DP');
        }
        $dp_amount = $this->getIDRAmount($request->input('dp_amount'));
        if ($dp_amount > $booking->payment->amount) {
            return $response
                ->setError(true)
                ->setMessage('Down payment amount melebihi batas nilai total payment');
        }
        if ($dp_amount <= 0 && $booking->status == BookingStatusEnum::PROCESSING() && $booking->payment->payment_channel == 'down_payment') {
            return $response
                ->setError(true)
                ->setMessage('Down payment tidak boleh kurang dari nol');
        }
        if (in_array($booking->status, [
            BookingStatusEnum::LUNAS(), 
            BookingStatusEnum::COMPLETED(),
            BookingStatusEnum::CHECKIN()]) 
            && $booking->payment->status != PaymentStatusEnum::COMPLETED()) {
            return $response
                ->setError(true)
                ->setMessage('Payment Status belum COMPLETED');
        }
        $this->bookingRepository->createOrUpdate($booking);
        if ($dp_amount > 0 && $booking->status == BookingStatusEnum::PROCESSING() && $booking->payment->payment_channel == 'down_payment') {
            $booking->payment->dp_amount = $dp_amount;
            $booking->payment->save();
        }
        $paymentProofPath = 'public/payment_proofs/' . $booking->payment->payment_proof;
        if ($booking->status == BookingStatusEnum::PROCESSING() && $booking->payment->payment_channel == 'down_payment' && Storage::exists($paymentProofPath)) {
            Storage::move($paymentProofPath, $paymentProofPath . '-downpayment');
        }

        if (!$booking->room_num_reduced && ($booking->status == BookingStatusEnum::PROCESSING() || $booking->status == BookingStatusEnum::LUNAS())) {
            $bookingRooms = $bookingRoomRepository->allBy(['booking_id'=>$booking->id]);
            $updated = [];
            foreach($bookingRooms as $bRoom) {
                for ($i = strtotime($bRoom->start_date); $i <= strtotime($bRoom->end_date); $i += 60 * 60 * 24) {
                    $roomDate = $roomDateRepository->getFirstBy([
                        'start_date' => date('Y-m-d', $i),
                        'room_id'    => $bRoom->room_id
                    ]);
                    if (!empty($roomDate) && array_key_exists($roomDate->id, $updated)) {
                        continue;
                    }
                    if (empty($roomDate)) {
                        $roomDate = $roomDateRepository->getModel();
                        $roomDate->room_id = $id;
                        $room = $bRoom->room;
                        $roomDate->price = $room->price;
                        $roomDate->discount = $room->discount ? $room->discount : 0;
                        $roomDate->number_of_rooms = $room->number_of_rooms;
                        $roomDate->active = true;
                        $roomDate->start_date = date('Y-m-d H:i:s', $i);
                        $roomDate->end_date = date('Y-m-d H:i:s', $i);
                    }
                    
                    $roomDate->number_of_rooms -= $bRoom->number_of_rooms;
                    $roomDate->note_to_admin .= "\n Automatic pengurangan total room yang tersedia dari transaction ID #" . $booking->transaction_id . ".";
        
                    $roomDate = $roomDateRepository->createOrUpdate($roomDate);
                    $updated[$roomDate->id] = true;
                }
            }
            $bookingRepository->update(['id'=> $booking->id], ['room_num_reduced' => true]);
        }

        try {
            if (!$booking->is_payment_emailed && $booking->status == BookingStatusEnum::LUNAS()) {
                BookingMailer::sendFullPaymentEmail($booking);
                $booking->is_payment_emailed = true;
                $bookingRepository->update(['id'=> $booking->id], ['is_payment_emailed' => true]);
            }
            if (!$booking->is_dp_payment_emailed && $booking->payment->payment_channel == 'down_payment' && $booking->status == BookingStatusEnum::PROCESSING()) {
                BookingMailer::sendDownPaymentEmail($booking);
                $booking->is_dp_payment_emailed = true;
                $bookingRepository->update(['id'=> $booking->id], ['is_dp_payment_emailed' => true]);
            }
        } catch (Exception $err) {
            Log::error($err);
        }

        event(new UpdatedContentEvent(BOOKING_MODULE_SCREEN_NAME, $request, $booking));

        return $response
            ->setPreviousUrl(route('booking.index'))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }

    /**
     * @param $id
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function destroy(Request $request, $id, BaseHttpResponse $response)
    {
        try {
            $booking = $this->bookingRepository->findOrFail($id);

            $this->bookingRepository->delete($booking);

            event(new DeletedContentEvent(BOOKING_MODULE_SCREEN_NAME, $request, $booking));

            return $response->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Exception
     */
    public function deletes(Request $request, BaseHttpResponse $response)
    {
        $ids = $request->input('ids');
        if (empty($ids)) {
            return $response
                ->setError()
                ->setMessage(trans('core/base::notices.no_select'));
        }

        foreach ($ids as $id) {
            $booking = $this->bookingRepository->findOrFail($id);
            $this->bookingRepository->delete($booking);
            event(new DeletedContentEvent(BOOKING_MODULE_SCREEN_NAME, $request, $booking));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }
}
