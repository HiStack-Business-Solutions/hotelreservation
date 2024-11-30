<?php

namespace App\Console\Commands;

use Botble\Hotel\Enums\BookingStatusEnum;
use Botble\Hotel\Mails\BookingMailer;
use Botble\Hotel\Models\Booking;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Log;

class UpdateRecordStatus extends Command
{
    // Command name for scheduling
    protected $signature = 'update:record-status';

    // Command description
    protected $description = 'Update status of records after 1 hour of creation if no remaining time left';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        $durationInHours = 1;
        $thresholdTime = Carbon::now('UTC')->subHours($durationInHours);

        $query = Booking::where('created_at', '<=', $thresholdTime)
            ->where('status', BookingStatusEnum::PENDING());    
        $query->clone()->update(['status' => BookingStatusEnum::CANCELLED()]);
        $bookings = $query->clone()->get();
        foreach($bookings as $b) {
            BookingMailer::sendBookingCancelEmail($b, "the payment due is timeout.");
        }

        if ($bookings->count() > 0) {
            Log::info('Booking timeout cancelled successfully and emails were sent.');
        }
    }
}