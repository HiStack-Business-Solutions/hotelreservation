<?php

namespace Botble\Hotel\Forms;

use Botble\Base\Forms\FormAbstract;
use Botble\Hotel\Enums\BookingStatusEnum;
use Botble\Hotel\Forms\Fields\DownpaymentField;
use Botble\Hotel\Http\Requests\BookingRequest;
use Botble\Hotel\Models\Booking;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class BookingForm extends FormAbstract
{

    /**
     * {@inheritDoc}
     */
    public function buildForm()
    {
        $booking = $this->getModel();
        $payment = $booking->payment;
        $fileExists = Storage::exists('public/payment_proofs/' . $payment->payment_proof);
        $showUploadForm = false;
        $dp_widget_style = ['id' => 'downpayment-widget'];
        if ($booking->status != BookingStatusEnum::PROCESSING()) {
            $dp_widget_style['hidden'] = '';
        }
        $this
            ->setupModel(new Booking)
            ->setValidatorClass(BookingRequest::class);
        if (!$this->formHelper->hasCustomField('downpayment')) {
            $this->addCustomField('downpayment', DownpaymentField::class);
        }
        $this
            ->withCustomFields()
            ->add('status', 'customSelect', [
                'label'      => trans('core/base::tables.status'),
                'label_attr' => ['class' => 'control-label required'],
                'attr'       => [
                    'class' => 'form-control select-full',
                ],
                'choices'    => BookingStatusEnum::labels(),
            ])
            ->setBreakFieldPoint('status')
            ->add('Down Payment Amount', 'downpayment', [
                'booking' => $booking,
                'label_attr' => ['class' => 'control-label required'],
                'widget_attr' => $dp_widget_style
            ])
            ->addMetaBoxes([
                'information' => [
                    'title'      => trans('plugins/hotel::booking.booking_information'),
                    'content'    => view('plugins/hotel::booking-info', compact('booking', 'fileExists', 'showUploadForm'))->render(),
                    'attributes' => [
                        'style' => 'margin-top: 0',
                    ],
                ],
            ]);
    }
}
