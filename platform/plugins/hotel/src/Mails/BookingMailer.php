<?php

namespace Botble\Hotel\Mails;

use Botble\Hotel\Enums\BookingStatusEnum;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class BookingMailer
{
    public static function sendBookingInfoEmail($booking) 
    {
        Mail::to($booking->address->email)
            ->send(new BookingInfoMail($booking));
    }
    public static function sendFullPaymentEmail($booking) 
    {
        Mail::to($booking->address->email)
            ->send(new FullPaymentMail($booking));
    }
}
class FullPaymentMail extends Mailable
{
    use Queueable, SerializesModels;

    public $booking;

    public function __construct($booking)
    {
        $this->booking = $booking;
    }

    public function build()
    {
        $booking = $this->booking;
        $booking->status = BookingStatusEnum::COMPLETED;
        return $this->view('plugins/hotel::email-booking-info', compact('booking'))
            ->subject('Your Booking Information - Order ID ' . $booking->id);
    }
}

class BookingInfoMail extends Mailable
{
    use Queueable, SerializesModels;

    public $booking;

    public function __construct($booking)
    {
        $this->booking = $booking;
    }

    public function build()
    {
        $booking = $this->booking;
        return $this->view('plugins/hotel::email-booking-info', compact('booking'))
            ->subject('Your Booking Information - Order ID ' . $booking->id);
    }
}