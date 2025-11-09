<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Psy\Util\Str;

class SortController extends Controller
{
    public function index() {

        $model = request()->query('model');
        $groupBy = request()->query('groupBy');
        $groupValue = request()->query('groupValue');
        $order_column = request()->query('order_column') ?? 'sort_order';
        $display_value = request()->query('display_value') ?? 'name';

        $modelClass = "App\\Models\\{$model}";

        if (!class_exists($modelClass)) {
            throw new \RuntimeException("Model {$modelClass} not found");
        }

        $items = $modelClass::query()->when($groupBy, function ($query) use ($groupBy, $groupValue) {
            $query->where($groupBy, $groupValue);
        })->orderBy($order_column)->get(['id', $display_value, $order_column]);

        return Inertia::render('admin/Sort/index', [
            'items' => $items,
            'model' => $model,
            'display_value' => $display_value,
            'order_column' => $order_column,
        ]);

    }

    public function store(Request $request)
    {
        $request->validate([
            'items' => 'required|array',
            'items.*.id' => 'required',
            'items.*.'.$request->order_column => 'required|integer',
            'order_column' => 'required|string',
            'model' => 'required|string',
        ]);

        $modelClass = "App\\Models\\{$request->model}";

        if (!class_exists($modelClass)) {
            throw new \RuntimeException("Model {$modelClass} not found");
        }

        $modelClass::whereIn('id', collect($request->items)->pluck('id'))->update([
            $request->order_column => \DB::raw("CASE id ".
                collect($request->items)->map(fn($item
                ) => "WHEN {$item['id']} THEN {$item[$request->order_column]}")->join(' ')
                ." END")
        ]);

        return back();
    }
}
