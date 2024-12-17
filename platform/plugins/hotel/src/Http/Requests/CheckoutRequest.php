<?php

namespace Botble\Hotel\Http\Requests;

use Botble\Hotel\Models\Room;
use Botble\Support\Http\Requests\Request;
use Exception;
use Illuminate\Contracts\Validation\Rule;
use Throwable;

class CheckoutRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [
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
        if (!empty($this->input('extra_bed_room'))) {
            $rules['extra_bed_room'] = new ExtraBedRule();
        }
        return $rules;
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

class ExtraBedRule implements Rule 
{
    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    private string $roomFail = "";
    private int $roomNumFail = 0;
    private int $roomMaxFail = 0;
    public function passes($attribute, $value)
    {
        // check supaya jangan melebihi max_extra_beds
        try {
            $extraBeds = (array) $value;
            $ids = array_keys($extraBeds);
            $rooms = Room::whereIn('id', $ids)->get();
            if (count($rooms) != count($value)) {
                return false;
            }
            foreach($rooms as $r) {
                $max = $r->max_extra_beds ?? 0;
                $val = $extraBeds[$r->id];
                if ($val > $max) {
                    $this->roomFail = $r->name;
                    $this->roomNumFail = $val;
                    $this->roomMaxFail = $max;
                    return false;
                }
            }
        } catch(Throwable $e) {
            return false;
        }
        
        return true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'Extra bed tidak boleh melebihi jumlah maximum yang telah disediakan. ' . $this->roomFail . ' : ' . $this->roomNumFail . ' beds (max. of ' . $this->roomMaxFail . ')';
    }
}