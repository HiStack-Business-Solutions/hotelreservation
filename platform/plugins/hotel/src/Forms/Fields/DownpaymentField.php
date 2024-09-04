<?php

namespace Botble\Hotel\Forms\Fields;

use Kris\LaravelFormBuilder\Fields\InputType;

class DownpaymentField extends InputType
{

    /**
     * {@inheritDoc}
     */
    protected function getTemplate()
    {
        return 'plugins/hotel::downpayment-admin';
    }
}
