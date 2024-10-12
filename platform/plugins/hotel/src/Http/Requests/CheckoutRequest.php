<?php

namespace Botble\Hotel\Http\Requests;

use Botble\Support\Http\Requests\Request;
use Illuminate\Contracts\Validation\Rule;

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
            'nik'              => ['required', new NIKRule()],
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

class NIKRule implements Rule 
{
    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        return preg_match("/^\d{16}$/", strval($value));
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Input :attribute harus berupa angka dengan 16 digit.';
    }
}
