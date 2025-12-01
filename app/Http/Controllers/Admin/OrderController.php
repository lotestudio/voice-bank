<?php

declare(strict_types=1);

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\OrderFormRequest;
use App\Http\Resources\OrderResource;
use App\Lote\Traits\HasReturnUrl;
use App\Models\Order;
use App\Models\User;
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

        $userNameOrders = $request->query('user_id')
            ? User::query()->findOrFail($request->query('user_id'))?->name
            : null;

        $breadcrumbs =[
            [
                'title' => 'Orders List',
                'href' => '/admin/order'
            ]
        ];

        $defaultUrlParams = [];
        $showUserFilter = true;

        if($userNameOrders){
            $breadcrumbs[] = [
                'title' => $userNameOrders. ' Orders List',
                'href' => ' ',
            ];

            $defaultUrlParams = [
                ['filters[user_id]'=> $request->query('user_id')]
            ];

            $showUserFilter = false;
        }

        return Inertia::render('admin/Order/index', [
            'usersSelect' => User::forSelect(),
            'breadcrumbs' => $breadcrumbs,
            'showUserFilter' => $showUserFilter,
            'defaultUrlParams' => $defaultUrlParams,
        ]);



    }

    public function create(): Response
    {
        return Inertia::render('admin/Order/form', []);
    }

    public function store(OrderFormRequest $orderFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $orderFormRequest->validated();
        order::query()->create($data);

        return $this->redirectAfterSave($orderFormRequest, to_route('order.index'));
    }

    public function update(order $order, OrderFormRequest $orderFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $orderFormRequest->validated();
        $order->update($data);

        return $this->redirectAfterSave($orderFormRequest, to_route('order.index'));
    }

    public function edit(Order $order): Response
    {
        return Inertia::render('admin/Order/form', [
            'model' => (new OrderResource($order))->toArray(request()),
        ]);
    }

    public function destroy($id): \Illuminate\Http\RedirectResponse
    {
        order::destroy([$id]);

        return back();
    }
}
