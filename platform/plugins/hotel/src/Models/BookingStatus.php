<?php

namespace Botble\Hotel\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Botble\Hotel\Enums\BookingStatusEnum;

class BookingStatus extends BaseModel
{
    use EnumCastable;

    protected $table = 'ht_booking_status';

    protected $fillable = [
        'status_id',
        'name',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'status_id' => BookingStatusEnum::class,
    ];

}
