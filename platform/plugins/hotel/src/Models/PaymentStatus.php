<?php

namespace Botble\Hotel\Models;

use Botble\Base\Models\BaseModel;
use Botble\Base\Traits\EnumCastable;
use Botble\Payment\Enums\PaymentStatusEnum;

class PaymentStatus extends BaseModel
{
    use EnumCastable;

    protected $table = 'payment_status';

    protected $fillable = [
        'status_id',
        'name',
    ];

    /**
     * @var array
     */
    protected $casts = [
        'status_id' => PaymentStatusEnum::class,
    ];
    public static function allStatusEnums():array {
        return PaymentStatus::all()->map(function($x) { return $x->status_id; })->toArray();
    }
}
