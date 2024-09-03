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
use Botble\Hotel\Tables\BookingTable;
use Botble\Payment\Enums\PaymentStatusEnum;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;
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

    /**
     * @param $id
     * @param BookingRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, BookingRequest $request, BaseHttpResponse $response, BookingInterface $bookingRepository)
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
        if ($booking->status == BookingStatusEnum::LUNAS() && $booking->payment->status != PaymentStatusEnum::COMPLETED()) {
            return $response
                ->setError(true)
                ->setMessage('Payment Status belum COMPLETED');
        }
        $this->bookingRepository->createOrUpdate($booking);
        $paymentProofPath = 'public/payment_proofs/' . $booking->payment->payment_proof;
        if ($booking->status == BookingStatusEnum::PROCESSING() && $booking->payment->payment_channel == 'down_payment') {
            Storage::move($paymentProofPath, $paymentProofPath . '-downpayment');
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
