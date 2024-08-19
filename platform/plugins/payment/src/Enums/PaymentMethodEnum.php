<?php

namespace Botble\Payment\Enums;

use Botble\Base\Supports\Enum;

/**
 * @method static PaymentMethodEnum STRIPE()
 * @method static PaymentMethodEnum PAYPAL()
 * @method static PaymentMethodEnum COD()
 * @method static PaymentMethodEnum BANK_TRANSFER()
 */
class PaymentMethodEnum extends Enum
{
    public const STRIPE = 'stripe';
    public const PAYPAL = 'paypal';
    public const COD = 'full_payment';
    public const BANK_TRANSFER = 'down_payment';

    /**
     * @var string
     */
    public static $langPath = 'plugins/payment::payment.methods';
}
