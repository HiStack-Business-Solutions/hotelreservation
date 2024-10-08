<?php

namespace Botble\Hotel\Http\Requests;

use Botble\Support\Http\Requests\Request;

class CheckoutRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'room_id'          => $this->input('multiple_booking') ? 'nullable' : 'required',
            'start_date'       => 'required:date_format:d-m-Y',
            'end_date'         => 'required:date_format:d-m-Y',
            'nik'              => 'required',
            'first_name'       => 'required',
            'last_name'        => 'required',
            'email'            => 'required',
            'phone'            => 'required',
            'zip'              => 'max:10',
            'terms_conditions' => 'required',
            'discount'          => 'required',
        ];
    }
}
