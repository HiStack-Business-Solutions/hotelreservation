<?php

namespace Botble\Hotel\Mails;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use Theme;

class BookingMailer extends Mailable
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
    public function sendEmail() 
    {
        // $booking = $this->booking;
        // $emailContent = Theme::scope('templates.email-booking-info', compact('booking'))->render()->content();
        
        // Mail::raw($emailContent, function ($message) use ($booking) {
        //     $message->to($this->booking->address->email)
        //             ->subject('Your Booking Information - Order ID ' . $booking->id);
        // });
        // Mail::send([], [], function ($message) use ($emailContent, $booking) {
        //     $message->to($this->booking->address->email)
        //             ->subject('Your Booking Information - Order ID ' . $booking->id)
        //             ->setBody($emailContent, 'text/html');
        // });
        Mail::to($this->booking->address->email)
            ->send($this);
    }
}