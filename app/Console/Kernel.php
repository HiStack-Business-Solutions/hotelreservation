<?php

namespace App\Console;

use App\Console\Commands\UpdateRecordStatus;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Log;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        UpdateRecordStatus::class
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('update:record-status')
            ->runInBackground()
            ->withoutOverlapping()
            ->everyFiveMinutes()
            ->onFailure(function () {
                Log::error('Booking Cancellation Scheduler failed to execute.');
            });

        Log::info('Booking Canceller schedule is running at: ' . now());
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
