@php
    $booking = $options['booking'];
@endphp
<script>
    
    $('#is_manual_input').on('input', onManualInputCheck);
    function onStatusSelect() {
        const PROCESSING = "{{\Botble\Hotel\Enums\BookingStatusEnum::PROCESSING()}}";
        if ($('select[name="status"]').find(':selected').val() == PROCESSING) {
            $('#downpayment-widget').removeAttr("hidden");
        } else {
            $('#downpayment-widget').attr("hidden", "");
        }
    }
    function init() {
        $('select[name="status"]').on('change', onStatusSelect);

        var currencyInput = document.querySelector('#dp_amount_visible');

        onBlurDP({target:currencyInput});

        currencyInput.addEventListener('focus', onFocusDP);
        currencyInput.addEventListener('blur', onBlurDP);
        currencyInput.addEventListener('input', onChangeDP);
        let manualInputCheckbox = $('#is_manual_input');
        manualInputCheckbox.on('input', onManualInputCheck);
        manualInputCheckbox.attr("disabled", false);
    }
    function onManualInputCheck() {
        let isManualInput = $('#is_manual_input').get(0).checked;
        $('#dp_amount_visible').attr('disabled', !isManualInput);
        if (!isManualInput) {
            var currencyInput = document.querySelector('#dp_amount_visible');
            currencyInput.value = "{{($booking->payment->dp_amount > 0 ? $booking->payment->dp_amount : $booking->amount)}}";
            onBlurDP({target:currencyInput});
        }
    }
    function onFocusDP(e){
        var value = e.target.value;
        value = localStringToNumber(value);
        e.target.value = isNaN(value) ? 0 : value;
        $('#dp_amount').val(e.target.value);
    }

    function onBlurDP(e){
        var value = e.target.value;
        value = localStringToNumber(value);

        $('#dp_amount').val(value);
        e.target.value = IDRFormat.format(isNaN(value) ? 0 : value);
    }
    function onChangeDP(e){
        var value = e.target.value;
        e.target.value = localStringToNumber(value);
        const maxamount = Number("{{$booking->payment->amount}}");
        if (e.target.value > maxamount) {
            e.target.value = maxamount;
        }
        $('#dp_amount').val(e.target.value);
    }
    function localStringToNumber( s ){
        var numForm = String(s).replace(/[^0-9.,-]+/g,"");
        return parseLocaleNumber(numForm);
    }
    function parseLocaleNumber(stringNumber) {    
        var val = parseFloat(stringNumber
            .replace(thousandRegex, '')
            .replace(decimalRegex, '.')
        );
        return isNaN(val) ? 0 : val;
    }
    const IDRFormat = new Intl.NumberFormat('en', { style: 'currency', currency: 'IDR' });
    const thousandSeparator = IDRFormat.format(11111).match(/(.)\d{3}/)[1];
    const decimalSeparator = IDRFormat.format(1.1).match(/\d+(.)\d+$/)[1];
    const thousandRegex = new RegExp('\\' + thousandSeparator, 'g');
    const decimalRegex = new RegExp('\\' + decimalSeparator, 'g');
    document.addEventListener('DOMContentLoaded',init,false);
</script>
<hr/>
<input id="is_manual_input" disabled="true" type="checkbox" placeholder="Manual Input" value="false" />
<label for="is_manual_input">Manual Input</label>
<hr/>
<div class="row p-2">
    <span class="text-info col-sm justify-content-center align-self-center"><strong>Nilai Down Payment</strong></span>
    <input class="col-sm-6 form-control" placeholder="Down Payment" disabled="true" name="dp_amount_visible" type="currency" value="{{($booking->payment->dp_amount > 0 ? $booking->payment->dp_amount : $booking->amount)}}" id="dp_amount_visible" min="0" max="{{$booking->payment->amount}}">
</div>
<input hidden name="dp_amount" type="currency" value="0" id="dp_amount" min="0" max="{{$booking->payment->amount}}">