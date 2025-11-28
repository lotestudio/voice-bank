<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\PaymentFormRequest;
use App\Lote\Traits\HasReturnUrl;
use App\Models\Payment;
use App\Transformers\DataTable\PaymentDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class PaymentController extends Controller
{
    use HasReturnUrl;
    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return PaymentDataTable::make()->get();
        }

        return Inertia::render('admin/Payment/index', []);
    }

    public function create(): Response
    {
        return Inertia::render('admin/Payment/form', []);
    }

    public function store(PaymentFormRequest $request)
    {
        $data = $request->validated();
        payment::query()->create($data);

        return $this->redirectAfterSave($request, to_route('payment.index'));
    }

    public function update(payment $payment, PaymentFormRequest $request)
    {
        $data = $request->validated();
        $payment->update($data);

        return $this->redirectAfterSave($request, to_route('payment.index'));
    }

    public function edit(payment $payment): Response
    {
        return Inertia::render('admin/Payment/form', [
            'model' => $payment,
        ]);
    }

    public function destroy($id)
    {
        payment::destroy([$id]);
        return back();
    }
}
