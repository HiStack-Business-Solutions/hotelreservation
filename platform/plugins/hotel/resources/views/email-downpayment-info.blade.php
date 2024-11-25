<!doctype html>
<html lang="en">
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Natura Ecopark - {{ $booking->status == \Botble\Hotel\Enums\BookingStatusEnum::COMPLETED() ? 'PAYMENT SUCCESS' : 'Order Information' }}</title>
    <style media="all" type="text/css">
@media all {
  .btn-primary table td:hover {
    background-color: #ec0867 !important;
  }

  .btn-primary a:hover {
    background-color: #ec0867 !important;
    border-color: #ec0867 !important;
  }
}
@media only screen and (max-width: 640px) {
  .main p,
  .main td,
  .main span {
      font-size: 16px !important;
    }

  .wrapper {
    padding: 8px !important;
  }

  .content {
    padding: 0 !important;
  }

  .container {
    padding: 0 !important;
    padding-top: 8px !important;
    width: 100% !important;
  }

  .main {
    border-left-width: 0 !important;
    border-radius: 0 !important;
    border-right-width: 0 !important;
  }

  .btn table {
    max-width: 100% !important;
    width: 100% !important;
  }

  .btn a {
    font-size: 16px !important;
    max-width: 100% !important;
    width: 100% !important;
  }
}
@media all {
  .ExternalClass {
    width: 100%;
  }

  .ExternalClass,
.ExternalClass p,
.ExternalClass span,
.ExternalClass font,
.ExternalClass td,
.ExternalClass div {
    line-height: 100%;
  }

  .apple-link a {
    color: inherit !important;
    font-family: inherit !important;
    font-size: inherit !important;
    font-weight: inherit !important;
    line-height: inherit !important;
    text-decoration: none !important;
  }

  #MessageViewBody a {
    color: inherit;
    text-decoration: none;
    font-size: inherit;
    font-family: inherit;
    font-weight: inherit;
    line-height: inherit;
  }
}
</style>
  </head>
  <body style="font-family: Helvetica, sans-serif; -webkit-font-smoothing: antialiased; font-size: 16px; line-height: 1.3; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #f4f5f6; margin: 0; padding: 0;">
    <table role="presentation" border="0" cellpadding="0" cellspacing="0" class="body" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background-color: #f4f5f6; width: 100%;" width="100%" bgcolor="#f4f5f6">
      <tr>
        <td style="font-family: Helvetica, sans-serif; font-size: 16px; vertical-align: top;" valign="top">&nbsp;</td>
        <td class="container" style="font-family: Helvetica, sans-serif; font-size: 16px; vertical-align: top; max-width: 860px; padding: 0; padding-top: 24px; width: 860px; margin: 0 0;" width="600" valign="top">
          <div class="content" style="box-sizing: border-box; display: block; margin: 0 auto; max-width: 860px; padding: 0;">

            <!-- START CENTERED WHITE CONTAINER -->
            <span class="preheader" style="color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;">Natura Ecopark</span>
            <table role="presentation" border="0" cellpadding="0" cellspacing="0" class="main" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; background: #ffffff; border: 1px solid #eaebed; border-radius: 16px; width: 100%;" width="100%">

              <!-- START MAIN CONTENT AREA -->
              <tr>
                <td class="wrapper" style="font-family: Helvetica, sans-serif; font-size: 16px; vertical-align: top; box-sizing: border-box; padding: 24px;" valign="top">
                  <p style="font-family: Helvetica, sans-serif; font-size: 16px; font-weight: normal; margin: 0; margin-bottom: 16px;">Dear {{ $booking->address->first_name }} {{ $booking->address->last_name }},</p>

                  <p style="font-family: Helvetica, sans-serif; font-size: 16px; font-weight: normal; margin: 0; margin-bottom: 16px;">
                  Your DP (Down Payment) booking was accepted by our admin.
                  </p>
                  <p style="font-family: Helvetica, sans-serif; font-size: 16px; font-weight: normal; margin: 0; margin-bottom: 16px;">
                  We are pleased to confirm your booking with Natura Ecopark. Please find the details of your reservation below.
                  </p>
                  <div id="printableArea">
                      <center>
                          <div class="justify-content-center">
                              <div class="booking-form-body room-details">
                                  <h3 class="mb-20">Natura ECOPARK</h3>
                                  <br>
                              </div>
                          </div>
                      </center>

                      <div class="row">
                          <div class="col-md-6">
                              <strong><p>{{ __('Transaction ID') }}: <i><a href="{{ route('public.booking.information', $booking->transaction_id) }}">{{ $booking->transaction_id }}</a></i></strong></p>
                              <p>{{ __('Time') }}: <i>{{ $booking->created_at }}</i></p>
                              <p>{{ __('Full Name') }}: <i>{{ $booking->address->first_name }} {{ $booking->address->last_name }}</i></p>
                              <p>{{ __('Email') }}: <i><a href="mailto:{{ $booking->address->email }}">{{ $booking->address->email }}</a></i></p>
                              <p>{{ __('Phone') }}: <i>@if ($booking->address->phone) <a href="tel:{{ $booking->address->phone }}">{{ $booking->address->phone }}</a> @else N/A @endif</i></p>
                          </div>
                          <div class="col-md-6">
                              <p>{{ __('Address') }}: <i>{{ $booking->address->id ? $booking->address->address . ', ' . $booking->address->city . ', ' . $booking->address->state . ', ' . $booking->address->country . ', ' . $booking->address->zip : 'N/A' }}</i></p>
                              <p>{{ __('Room') }}: <i>@if ($booking->room->room->id) <a href="{{ $booking->room->room->url }}" target="_blank">{{ $booking->room->room->name }}</a> @else N/A @endif</i></p>
                              <p><strong>{{ __('Start Date') }}</strong>: <i>{{ $booking->room->start_date }}</i></p>
                              <p><strong>{{ __('End Date') }}</strong>: <i>{{ $booking->room->end_date }}</i></p>
                              <p><strong>{{ __('Arrival Time') }}</strong>: <i>{{ $booking->arrival_time }}</i></p>
                          </div>
                      </div>
                      <br>
                      @if ($booking->requests)
                          <p style="margin-bottom: 10px;"><strong>{{ __('Requests') }}</strong>: {{ $booking->requests }}</p>
                      @endif
                      <br>
                      <p><strong>{{ __('Discount') }}</strong>: <span class="text-danger">{{ $booking->discount}}% <i>(exclude Service)</i></span></p>
                      <p><strong class="text-info">{{ __('Down Payment') }}</strong>: <span class="text-danger">{{ format_price($booking->amount * 0.5) }}</span></p>
                      <p><strong>{{ __('Total Amount') }}</strong>: <span class="text-danger">{{ format_price($booking->amount) }}</span></p>
                      @if($booking->payment->dp_amount > 0)
                      <p><strong>{{ __('Paid DP Amount') }}</strong>: <span class="text-danger">{{ format_price($booking->payment->dp_amount) }}</span></p>
                      <p><strong>{{ __('Remaining Amount') }}</strong>: <span class="text-danger">{{ format_price($booking->amount - $booking->payment->dp_amount) }}</span></p>
                      @endif
                      <p><strong>{{ __('Payment method') }}</strong>: {{ $booking->payment->id ? $booking->payment->payment_channel->label() : 'N/A' }}</p>
                  </div>
                  
                  <p><strong>{{ __('Payment status') }}</strong>: {!! $booking->payment->id ? $booking->payment->status->toHtml() : \Botble\Payment\Enums\PaymentStatusEnum::PENDING()->toHtml() !!}</p>
                  
                  <p style="font-family: Helvetica, sans-serif; font-size: 16px; font-weight: normal; margin: 0; margin-bottom: 16px;">If you have any questions or need to make changes to your reservation, please do not hesitate to contact us at [Contact Information].</p>

                  <p style="font-family: Helvetica, sans-serif; font-size: 16px; font-weight: normal; margin: 0; margin-bottom: 16px;">We look forward to welcoming you to Natura Ecopark and hope you have a pleasant stay.</p>

                  <p style="font-family: Helvetica, sans-serif; font-size: 16px; font-weight: normal; margin: 0; margin-bottom: 16px;">Thank you for choosing us!</p>

                  <p style="font-family: Helvetica, sans-serif; font-size: 16px; font-weight: normal; margin: 0; margin-bottom: 16px;">Warm regards,</p>
                  <p style="font-family: Helvetica, sans-serif; font-size: 16px; font-weight: normal; margin: 0; margin-bottom: 16px;">Panorama Ecopark Team</p>
                </td>
              </tr>

              <!-- END MAIN CONTENT AREA -->
              </table>

            <!-- START FOOTER -->
            <div class="footer" style="clear: both; padding-top: 24px; text-align: center; width: 100%;">
              <table role="presentation" border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;" width="100%">
                <tr>
                  <td class="content-block" style="font-family: Helvetica, sans-serif; vertical-align: top; color: #9a9ea6; font-size: 16px; text-align: center;" valign="top" align="center">
                    <span class="apple-link" style="color: #9a9ea6; font-size: 16px; text-align: center;">Natura Ecopark, Cikarang</span>
                    <!-- <br> Don't like these emails? <a href="http://htmlemail.io/blog" style="text-decoration: underline; color: #9a9ea6; font-size: 16px; text-align: center;">Unsubscribe</a>. -->
                  </td>
                </tr>
                <tr>
                  <td class="content-block powered-by" style="font-family: Helvetica, sans-serif; vertical-align: top; color: #9a9ea6; font-size: 16px; text-align: center;" valign="top" align="center">
                    Powered by <a href="https://rumahkhitanputrabcl.com/companyprofile/home" style="color: #9a9ea6; font-size: 16px; text-align: center; text-decoration: none;">HiStack Business Solution</a>
                  </td>
                </tr>
              </table>
            </div>

            <!-- END FOOTER -->
            
<!-- END CENTERED WHITE CONTAINER --></div>
        </td>
        <td style="font-family: Helvetica, sans-serif; font-size: 16px; vertical-align: top;" valign="top">&nbsp;</td>
      </tr>
    </table>
  </body>
</html>