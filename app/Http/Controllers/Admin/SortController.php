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
        ]);

    }

    public function store(Request $request)
    {

    }
}
