@if ($booking)
    @if (isset($emailNotification))
        <div class="quote-info {{ $emailNotification['type'] }}">
            <blockquote>
            <i class="fas fa-info-circle"></i>
                {{ $emailNotification['message'] }}
            </blockquote>
        </div>
    @endif
    <div id="printableArea">
        <center>
            <div class="justify-content-center">
                <div class="booking-form-body room-details">
                    <h3 class="mb-20">NATURA ECOPARK</h3>
                    <br>
                </div>
            </div>
        </center>

        <div class="row">
            <div class="col-md-6">
                <strong><p>{{ __('Transaction ID') }}: <i>{{ $booking->transaction_id }}</i></strong></p>
                <p>{{ __('Time') }}: <i>{{ $booking->created_at }}</i></p>
                <p>{{ __('Full Name') }}: <i>{{ $booking->address->first_name }} {{ $booking->address->last_name }}</i></p>
                <p>{{ __('Email') }}: <i><a href="mailto:{{ $booking->address->email }}">{{ $booking->address->email }}</a></i></p>
                <p>{{ __('Phone') }}: <i>@if ($booking->address->phone) <a href="tel:{{ $booking->address->phone }}">{{ $booking->address->phone }}</a> @else N/A @endif</i></p>
            </div>
            <div class="col-md-6">
                <p>{{ __('Address') }}: <i>{{ $booking->address->id ? $booking->address->address . ', ' . $booking->address->city . ', ' . $booking->address->state . ', ' . $booking->address->country . ', ' . $booking->address->zip : 'N/A' }}</i></p>
                @if(count($booking->rooms) == 1)<p>{{ __('Room') }}: <i>@if ($booking->room->room->id) <a href="{{ $booking->room->room->url }}" target="_blank">{{ $booking->room->room->name }}</a> @else N/A @endif</i></p>@endif
                <p><strong>{{ __('Start Date') }}</strong>: <i>{{ $booking->room->start_date }}</i></p>
                <p><strong>{{ __('End Date') }}</strong>: <i>{{ $booking->room->end_date }}</i></p>
                <p><strong>{{ __('Arrival Time') }}</strong>: <i>{{ $booking->arrival_time }}</i></p>
            </div>
        </div>
        <br>
        @if ($booking->requests)
            <p style="margin-bottom: 10px;"><strong>{{ __('Requests') }}</strong>: {{ $booking->requests }}</p>
        @endif
        <p><strong>{{ __('Room(s)') }}</strong>:</p>
        <table class="table table-bordered">
            <thead>
            <tr>
                <!-- <th class="text-center">{{ __('Image') }}</th> -->
                <th>{{ __('Name') }}</th>
                <th class="text-center">{{ __('Checkin Date') }}</th>
                <th class="text-center">{{ __('Checkout Date') }}</th>
                <th class="text-center">{{ __('Number of rooms') }}</th>
                <th class="text-center">{{ __('Extra bed(s)') }}</th>
                <th class="text-center">{{ __('Price') }}</th>
                <th class="text-center">{{ __('Tax') }}</th>
            </tr>
            </thead>
            <tbody>
                @foreach($booking->rooms as $room)
                    <tr>
                        <td style="vertical-align: middle"><a href="{{ $room->room->url }}" target="_blank">{{ $room->room->name }}</a></td>
                        <td class="text-center" style="vertical-align: middle">{{ $room->start_date }}</td>
                        <td class="text-center" style="vertical-align: middle">{{ $room->end_date }}</td>
                        <td class="text-center" style="vertical-align: middle">{{ $room->number_of_rooms }}</td>
                        <td class="text-center" style="vertical-align: middle">{{ $room->extra_beds }}</td>
                        <td class="text-center" style="vertical-align: middle"><strong>{{ format_price($room->price) }}</strong></td>
                        <td class="text-center" style="vertical-align: middle"><strong>{{ format_price($room->tax_amount) }}</strong></td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <br>
        @if ($booking->services->count())
            <p><strong>{{ __('Services') }}</strong>:</p>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>{{ __('Name') }}</th>
                    <th class="text-center">{{ __('Price') }}</th>
                    <th class="text-center">{{ __('Total') }}</th>
                </tr>
                </thead>
                <tbody>
                @foreach($booking->services as $service)
                    <tr>
                        <td style="vertical-align: middle">
                            {{ $service->name }}
                        </td>
                        <td class="text-center" style="vertical-align: middle">{{ format_price($service->price) }} x {{ $booking->room->number_of_rooms }}</td>
                        <td class="text-center" style="vertical-align: middle">{{ format_price($service->price * $booking->room->number_of_rooms) }}</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
            <br>
        @endif
        <br>
        <p><strong>{{ __('Discount') }}</strong>: <span class="text-danger">{{ $booking->discount}}% <i>(exclude Service)</i></span></p>
        @if ($booking->payment->payment_channel == 'down_payment') 
        <p><strong class="text-info">{{ __('Down Payment Amount') }}</strong>: <span class="text-danger">{{ format_price($booking->amount * 0.5) }}</span></p>
        @endif
        <p><strong>{{ __('Total Amount') }}</strong>: <span class="text-danger">{{ format_price($booking->amount) }}</span></p>
        @if($booking->payment->dp_amount > 0)
        <p><strong>{{ __('Paid DP Amount') }}</strong>: <span class="text-danger">{{ format_price($booking->payment->dp_amount) }}</span></p>
        <p><strong>{{ __('Remaining Amount') }}</strong>: <span class="text-danger">{{ format_price($booking->amount - $booking->payment->dp_amount) }}</span></p>
        @endif

        <p><strong>{{ __('Payment method') }}</strong>: {{ $booking->payment->id ? $booking->payment->payment_channel->label() : 'N/A' }}</p>
        <p><strong>{{ __('Payment status') }}</strong>: <a @if(Auth::check()) href="{{route('payment.show', $booking->payment->id)}}"@endif>{!! $booking->payment->id ? $booking->payment->status->toHtml() : \Botble\Payment\Enums\PaymentStatusEnum::PENDING()->toHtml() !!}</a></p>
    </div>
    
    @if (!$fileExists)
    <div>
        <span><strong>Remaining time for payment due:</strong></span>
        @include('plugins/hotel::countdown-timer', ['timerDate' => $booking->createdAtUTCStr(), 'timerHours' => 1])
    </div>
    @endif
    <div style="display: flex; justify-content: flex-end;">
        <button onclick="printDiv('printableArea')" style="background-color: #007bff; color: white; border: none; padding: 8px 20px; border-radius: 5px; display: flex; align-items: center; margin-right: 10px;">
            <i class="fa fa-print" aria-hidden="true" style="margin-right: 5px;"></i> Print
        </button>
        <button onclick="printThermalPreview()" style="background-color: #ffc107; color: white; border: none; padding: 8px 20px; border-radius: 5px; display: flex; align-items: center;">
            <i class="fa fa-file-alt" aria-hidden="true" style="margin-right: 5px;"></i> Thermal Print Preview
        </button>
    </div>
    @if($showUploadForm && (!$booking->isCountdownTimeout() || !in_array($booking->status, ['pending', 'cancelled'])))
    <form action="{{ route('public.booking.storePaymentProof') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
            <input type="hidden" name="booking_id" value="{{ $booking->id }}">
            <label for="payment_proof">Payment Proof (Max 2MB, JPG/JPEG/PNG)</label>
            <input type="file" name="payment_proof" id="payment_proof" class="form-control" required>
            @if ($errors->has('payment_proof'))
                <div class="alert alert-danger mt-2">
                    {{ $errors->first('payment_proof') }}
                </div>
            @endif
        </div>
        @if ($fileExists)
            <p style="color: green;">File sudah di uploaded.@if (!Auth::check()) <br/>Mohon menunggu konfirmasi dari admin.@endif</p>
            <div style="display: flex; justify-content: flex-end;">
                <button type="submit" style="background-color: #28a745; color: white; border: none; padding: 8px 20px; border-radius: 5px; display: flex; align-items: center;">
                    <i class="fa fa-upload" aria-hidden="true" style="margin-right: 5px;"></i> @if(Auth::check()) {{ 'Timpa Bukti Transfer' }} @else {{ 'Reupload Ulang Bukti Transfer' }} @endif
                </button>
            </div>
        @else
            <div style="display: flex; justify-content: flex-end;">
                <button type="submit" style="background-color: #28a745; color: white; border: none; padding: 8px 20px; border-radius: 5px; display: flex; align-items: center;">
                    <i class="fa fa-upload" aria-hidden="true" style="margin-right: 5px;"></i> Upload Bukti Transfer
                </button>
            </div>
        @endif
    </form>
    @endif
@endif

<script>
    function printDiv(divId) {
        var printContents = document.getElementById(divId).innerHTML;
        var originalContents = document.body.innerHTML;

        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }

    function printThermalPreview() {
        // Membuka jendela baru untuk pratinjau thermal
        var printWindow = window.open('', '_blank', 'width=400,height=600');
        var printContents = document.getElementById('printableArea').innerHTML;

        // Menambahkan CSS khusus untuk thermal printer
        printWindow.document.write(`
            <html>
            <head>
                <style>
                    body { font-size: 12px; line-height: 1.2; }
                    .row { display: block; }
                    .col-md-6 { width: 100%; }
                    table { width: 100%; font-size: 10px; }
                    th, td { border: 0.1px solid black; padding: 0.5px; }
                </style>
            </head>
            <body>
                ${printContents}
            </body>
            </html>
        `);

        printWindow.document.close();
        printWindow.focus();
    }
</script>
