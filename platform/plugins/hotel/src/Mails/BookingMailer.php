<?php

namespace Botble\Hotel\Mails;

use Botble\Hotel\Enums\BookingStatusEnum;
use Botble\Hotel\Models\Booking;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\URL;

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
    public static function sendDownPaymentEmail($booking) 
    {
        Mail::to($booking->address->email)
            ->send(new DownPaymentMail($booking));
    }
    public static function sendBookingCancelEmail(Booking $booking, string $reason) 
    {
        Mail::to($booking->address->email)
            ->send(new BookingCancelMail($booking, $reason));
    }
}
class BookingCancelMail extends Mailable
{
    use Queueable, SerializesModels;

    public $booking;
    public $cancelReason;

    public function __construct(Booking $booking, string $reason)
    {
        $this->booking = $booking;
        $this->cancelReason = $reason;
    }

    public function build()
    {
        return $this->view('plugins/hotel::email-booking-cancel', ['booking' => $this->booking, 'cancelReason' => $this->cancelReason])
            ->subject('Booking Cancelled due to Payment Timeout - Transaction #' . $this->booking->transaction_id);
    }
}
class DownPaymentMail extends Mailable
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
        return $this->view('plugins/hotel::email-downpayment-info', compact('booking'))
            ->subject('Down Paid (Pending) - Transaction #' . $booking->transaction_id);
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
        return $this->view('plugins/hotel::email-booking-info', compact('booking'))
            ->subject('Payment Accepted - Transaction #' . $booking->transaction_id);
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
            ->subject('Your Booking Information - Order ID ' . $booking->transaction_id);
    }
}