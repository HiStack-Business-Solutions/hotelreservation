<?php

namespace Botble\Payment\Http\Controllers;

use Assets;
use Botble\Base\Events\DeletedContentEvent;
use Botble\Base\Http\Responses\BaseHttpResponse;
use Botble\Hotel\Models\PaymentStatus;
use Botble\Payment\Enums\PaymentMethodEnum;
use Botble\Payment\Enums\PaymentStatusEnum;
use Botble\Payment\Http\Requests\CheckoutRequest;
use Botble\Payment\Http\Requests\PaymentMethodRequest;
use Botble\Payment\Http\Requests\PayPalPaymentCallbackRequest;
use Botble\Payment\Http\Requests\UpdatePaymentRequest;
use Botble\Payment\Repositories\Interfaces\PaymentInterface;
use Botble\Payment\Services\Gateways\BankTransferPaymentService;
use Botble\Payment\Services\Gateways\CodPaymentService;
use Botble\Payment\Services\Gateways\PayPalPaymentService;
use Botble\Payment\Services\Gateways\StripePaymentService;
use Botble\Payment\Tables\PaymentTable;
use Botble\Setting\Supports\SettingStore;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Routing\Redirector;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;
use Throwable;

class PaymentController extends Controller
{
    /**
     * @var CodPaymentService
     */
    protected $codPaymentService;

    /**
     * @var BankTransferPaymentService
     */
    protected $bankTransferPaymentService;

    /**
     * @var PayPalPaymentService
     */
    protected $payPalService;

    /**
     * @var StripePaymentService
     */
    protected $stripePaymentService;

    /**
     * @var string
     */
    protected $returnUrl;

    /**
     * @var PaymentInterface
     */
    protected $paymentRepository;

    /**
     * PaymentController constructor.
     * @param PayPalPaymentService $payPalService
     * @param StripePaymentService $stripePaymentService
     * @param CodPaymentService $codPaymentService
     * @param BankTransferPaymentService $bankTransferPaymentService
     * @param PaymentInterface $paymentRepository
     */
    public function __construct(
        PayPalPaymentService $payPalService,
        StripePaymentService $stripePaymentService,
        CodPaymentService $codPaymentService,
        BankTransferPaymentService $bankTransferPaymentService,
        PaymentInterface $paymentRepository
    ) {
        $this->payPalService = $payPalService;

        $this->stripePaymentService = $stripePaymentService;
        $this->paymentRepository = $paymentRepository;

        $this->returnUrl = config('plugins.payment.payment.return_url_after_payment');
        $this->codPaymentService = $codPaymentService;
        $this->bankTransferPaymentService = $bankTransferPaymentService;
    }

    /**
     * @param PaymentTable $dataTable
     * @return Factory|View
     * @throws Throwable
     */
    public function index(PaymentTable $table)
    {
        page_title()->setTitle(trans('plugins/payment::payment.name'));

        return $table->renderTable();
    }


    /**
     * @param int $id
     * @param Request $request
     * @return BaseHttpResponse
     */
    public function destroy(Request $request, $id, BaseHttpResponse $response)
    {
        try {
            $payment = $this->paymentRepository->findOrFail($id);

            $this->paymentRepository->delete($payment);

            event(new DeletedContentEvent(PAYMENT_MODULE_SCREEN_NAME, $request, $payment));

            return $response->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $response
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Exception
     */
    public function deletes(Request $request, BaseHttpResponse $response)
    {
        $ids = $request->input('ids');
        if (empty($ids)) {
            return $response
                ->setError()
                ->setMessage(trans('core/base::notices.no_select'));
        }

        foreach ($ids as $id) {
            $payment = $this->paymentRepository->findOrFail($id);
            $this->paymentRepository->delete($payment);
            event(new DeletedContentEvent(PAYMENT_MODULE_SCREEN_NAME, $request, $payment));
        }

        return $response->setMessage(trans('core/base::notices.delete_success_message'));
    }

    /**
     * @param CheckoutRequest $request
     * @return \Illuminate\Contracts\Foundation\Application|RedirectResponse|Redirector
     */
    public function postCheckout(CheckoutRequest $request)
    {
        $returnUrl = $request->input('return_url');

        $currency = $request->input('currency', config('plugins.payment.payment.currency'));
        $currency = strtoupper($currency);

        $data = [
            'error'    => false,
            'message'  => false,
            'amount'   => $request->input('amount'),
            'currency' => $currency,
            'type'     => $request->input('payment_method'),
        ];

        switch ($request->input('payment_method')) {
            case PaymentMethodEnum::STRIPE:
                $result = $this->stripePaymentService->execute($request);
                if ($this->stripePaymentService->getErrorMessage()) {
                    $paymentData['error'] = true;
                    $paymentData['message'] = $this->stripePaymentService->getErrorMessage();
                }

                $paymentData['charge_id'] = $result;

                break;

            case PaymentMethodEnum::PAYPAL:
                $checkoutUrl = $this->payPalService->execute($request);
                if ($checkoutUrl) {
                    return redirect($checkoutUrl);
                }

                $data['error'] = true;
                $data['message'] = $this->payPalService->getErrorMessage();
                break;

            case PaymentMethodEnum::COD:
                $chargeId = $this->codPaymentService->execute($request);
                return redirect()->to($returnUrl . '?charge_id=' . $chargeId)->with('success_msg',
                    trans('plugins/payment::payment.payment_pending'));

            case PaymentMethodEnum::BANK_TRANSFER:
                $chargeId = $this->bankTransferPaymentService->execute($request);
                return redirect()->to($returnUrl . '?charge_id=' . $chargeId)->with('success_msg',
                    trans('plugins/payment::payment.payment_pending'));

            default:
                $data = apply_filters(PAYMENT_FILTER_AFTER_POST_CHECKOUT, $data, $request);
                break;
        }

        if ($data['error']) {
            return redirect()->back()->with('error_msg', $data['message'])->withInput($request->input());
        }

        $callbackUrl = $request->input('callback_url') . '?' . http_build_query($data);

        return redirect()->to($callbackUrl)->with('success_msg', trans('plugins/payment::payment.checkout_success'));
    }

    /**
     * @param PayPalPaymentCallbackRequest $request
     * @param PayPalPaymentService $palPaymentService
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     * @throws Throwable
     */
    public function getPayPalStatus(
        PayPalPaymentCallbackRequest $request,
        PayPalPaymentService $palPaymentService,
        BaseHttpResponse $response
    ) {
        $palPaymentService->afterMakePayment($request);

        return $response
            ->setNextUrl(url('/'))
            ->setMessage(__('Checkout successfully!'));
    }

    /**
     * @param int $id
     * @return Factory|View
     * @throws Exception
     * @throws Throwable
     */
    public function show($id)
    {
        $payment = $this->paymentRepository->findOrFail($id);

        $detail = null;
        switch ($payment->payment_channel) {
            case PaymentMethodEnum::PAYPAL:
                $paymentDetail = $this->payPalService->getPaymentDetails($payment->charge_id);
                $detail = view('plugins/payment::paypal.detail', ['payment' => $paymentDetail])->render();
                break;
            case PaymentMethodEnum::STRIPE:
                $paymentDetail = $this->stripePaymentService->getPaymentDetails($payment->charge_id);
                $detail = view('plugins/payment::stripe.detail', ['payment' => $paymentDetail])->render();
                break;
            case PaymentMethodEnum::COD:
            case PaymentMethodEnum::BANK_TRANSFER:
                break;
            default:
                $detail = apply_filters(PAYMENT_FILTER_PAYMENT_INFO_DETAIL, null, $payment);
                break;
        }

        // $paymentStatuses = PaymentStatusEnum::labels();
        $paymentStatuses = PaymentStatus::allStatusEnums();

        if ($payment->status != PaymentStatusEnum::PENDING) {
            Arr::forget($paymentStatuses, PaymentStatusEnum::PENDING);
        }

        $filePath = 'public/payment_proofs/' . $payment->payment_proof;
        $getImage = function($filePath) use($payment) {
            if (!$payment->payment_proof) {
                return null;
            }
            if (!Storage::exists($filePath)) {
                return null;
            }
            $fileContents = Storage::get($filePath);
            $base64 = base64_encode($fileContents);
            $mimeType = Storage::mimeType($filePath);
            
            // Pass base64 string and mime type to view
            return 'data:' . $mimeType . ';base64,' . $base64;
        };
        $payment->payment_proof_base64 = $getImage($filePath);
        $payment->payment_proof_dp_base64 = $getImage($filePath . '-downpayment');

        return view('plugins/payment::show', compact('payment', 'detail', 'paymentStatuses'));
    }

    /**
     * @return Factory|View
     */
    public function methods()
    {
        page_title()->setTitle(trans('plugins/payment::payment.payment_methods'));

        Assets::addStylesDirectly('vendor/core/plugins/payment/css/payment-methods.css')
            ->addScriptsDirectly('vendor/core/plugins/payment/js/payment-methods.js');

        return view('plugins/payment::settings.index');
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @param SettingStore $settingStore
     * @return BaseHttpResponse
     */
    public function updateSettings(Request $request, BaseHttpResponse $response, SettingStore $settingStore)
    {
        $data = $request->except(['_token']);
        foreach ($data as $settingKey => $settingValue) {
            $settingStore
                ->set($settingKey, $settingValue);
        }

        $settingStore->save();

        return $response->setMessage(trans('plugins/payment::payment.saved_payment_settings_success'));
    }

    /**
     * @param PaymentMethodRequest $request
     * @param BaseHttpResponse $response
     * @param SettingStore $settingStore
     * @return BaseHttpResponse
     */
    public function updateMethods(PaymentMethodRequest $request, BaseHttpResponse $response, SettingStore $settingStore)
    {
        $type = $request->input('type');
        $data = $request->except(['_token', 'type']);
        foreach ($data as $settingKey => $settingValue) {
            $settingStore
                ->set($settingKey, $settingValue);
        }

        $settingStore
            ->set('payment_' . $type . '_status', 1)
            ->save();

        return $response->setMessage(trans('plugins/payment::payment.saved_payment_method_success'));
    }

    /**
     * @param Request $request
     * @param BaseHttpResponse $response
     * @param SettingStore $settingStore
     * @return BaseHttpResponse
     */
    public function updateMethodStatus(Request $request, BaseHttpResponse $response, SettingStore $settingStore)
    {
        $settingStore
            ->set('payment_' . $request->input('type') . '_status', 0)
            ->save();

        return $response->setMessage(trans('plugins/payment::payment.turn_off_success'));
    }

    /**
     * @param $id
     * @param UpdatePaymentRequest $request
     * @param BaseHttpResponse $response
     * @return BaseHttpResponse
     */
    public function update($id, UpdatePaymentRequest $request, BaseHttpResponse $response)
    {
        $payment = $this->paymentRepository->findOrFail($id);

        $payment->status = $request->input('status');
        if ($payment->isLunas() && !$payment->payment_proof) {
            return $response
                ->setError(true)
                ->setMessage('Perlu Bukti Transfer');
        }
        $this->paymentRepository->createOrUpdate($payment);

        return $response
            ->setPreviousUrl(route('payment.show', $payment->id))
            ->setMessage(trans('core/base::notices.update_success_message'));
    }
}
