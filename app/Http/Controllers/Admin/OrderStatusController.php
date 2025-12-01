<?php

namespace App\Http\Controllers\Admin;

use App\Enums\OrderStatus;
use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class OrderStatusController extends Controller
{
    public function __invoke(Request $request)
    {
        $request->validate([
            'status' => ['required', Rule::enum(OrderStatus::class)],
            'order_id' => 'required|integer',
        ]);

        $order = Order::query()->findOrFail($request->order_id);
        $order->update(OrderStatus::getUpdateOrderStatusDates($request->status,$order));

        return back();
    }
}
