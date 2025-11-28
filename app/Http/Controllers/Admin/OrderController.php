<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\OrderFormRequest;
use App\Lote\Traits\HasReturnUrl;
use App\Models\Order;
use App\Transformers\DataTable\OrderDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class OrderController extends Controller
{
    use HasReturnUrl;
    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return OrderDataTable::make()->get();
        }

        return Inertia::render('admin/Order/index', []);
    }

    public function create(): Response
    {
        return Inertia::render('admin/Order/form', []);
    }

    public function store(OrderFormRequest $request)
    {
        $data = $request->validated();
        order::query()->create($data);

        return $this->redirectAfterSave($request, to_route('order.index'));
    }

    public function update(order $order, OrderFormRequest $request)
    {
        $data = $request->validated();
        $order->update($data);

        return $this->redirectAfterSave($request, to_route('order.index'));
    }

    public function edit(order $order): Response
    {
        return Inertia::render('admin/Order/form', [
            'model' => $order,
        ]);
    }

    public function destroy($id)
    {
        order::destroy([$id]);
        return back();
    }
}
