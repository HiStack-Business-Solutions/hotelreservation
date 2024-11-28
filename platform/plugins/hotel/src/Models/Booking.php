<?php

namespace Botble\Hotel\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Botble\Hotel\Enums\BookingStatusEnum;
use Botble\Payment\Models\Payment;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Booking extends BaseModel
{
    use EnumCastable;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'ht_bookings';

    /**
     * @var array
     */
    protected $fillable = [
        'nik',
        'status',
        'amount',
        'currency_id',
        'requests',
        'arrival_time',
        'payment_id',
        'transaction_id',
        'tax_amount',
        'discount',
        'discount_amount'
    ];

    /**
     * @var array
     */
    protected $casts = [
        'status' => BookingStatusEnum::class,
    ];

    /**
     * @return BelongsTo
     */
    public function currency(): BelongsTo
    {
        return $this->belongsTo(Currency::class, 'currency_id')->withDefault();
    }

    /**
     * @return BelongsToMany
     */
    public function services(): BelongsToMany
    {
        return $this->belongsToMany(Service::class, 'ht_booking_services', 'booking_id', 'service_id');
    }

    /**
     * @return HasOne
     */
    public function address(): HasOne
    {
        return $this->hasOne(BookingAddress::class, 'booking_id')->withDefault();
    }

    /**
     * @return HasOne
     */
    public function room(): HasOne
    {
        return $this->hasOne(BookingRoom::class, 'booking_id')->withDefault();
    }
    /**
     * @return HasMany
     */
    public function rooms(): HasMany
    {
        return $this->hasMany(BookingRoom::class, 'booking_id');
    }
    /*
     * @return BelongsTo
     */
    public function payment()
    {
        return $this->belongsTo(Payment::class, 'payment_id')->withDefault();
    }
    public function createdAtUTCStr(): string {
        $date = Carbon::instance($this->created_at)->copy()->setTimezone('UTC'); // Create a Carbon instance in UTC
        return $date->toIso8601String(); 
    }
    public function isCountdownTimeout($maximumHours = 1): bool {
        $createdDate = Carbon::instance($this->created_at);
        $lastPaymentDate = $createdDate->copy()->addHours($maximumHours);
        return $lastPaymentDate->diffInSeconds(Carbon::now()) < 0;
        
    }
    public function getPaymentTimeAtLast(int $maxLastTimeHours = 1) {
        return Carbon::instance($this->created_at)->copy()->addHours($maxLastTimeHours);
    }
    public function getRemainingPaymentTime(int $maximumHours = 1): array {
        // Calculate the target date
        $targetDate = $this->getPaymentTimeAtLast($maximumHours);

        // Current time in UTC
        $now = Carbon::now('UTC');

        // Calculate the difference
        if ($now->lessThanOrEqualTo($targetDate)) {
            $diffInSeconds = $targetDate->diffInSeconds($now);
            $remainingHours = floor($diffInSeconds / 3600);
            $remainingMinutes = floor(($diffInSeconds % 3600) / 60);
            $remainingSeconds = $diffInSeconds % 60;
        } else {
            $remainingHours = $remainingMinutes = $remainingSeconds = 0;
        }
        
        return ['hours' => $remainingHours, 'minutes' => $remainingMinutes, 'seconds' => $remainingSeconds];
    }
}
