<?php

declare(strict_types=1);

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Lote\Traits\HasReturnUrl;
use Illuminate\Http\Request;
use Inertia\Inertia;

class SortController extends Controller
{
    use HasReturnUrl;

    public function index()
    {

        $model = request()->query('model');
        $groupBy = request()->query('groupBy');
        $groupValue = request()->query('groupValue');
        $order_column = request()->query('order_column') ?? 'sort_order';
        $display_value = request()->query('display_value') ?? 'name';

        $modelClass = 'App\Models\\'.$model;

        if (! class_exists($modelClass)) {
            throw new \RuntimeException(sprintf('Model %s not found', $modelClass));
        }

        $items = $modelClass::query()->when($groupBy, function ($query) use ($groupBy, $groupValue): void {
            $query->where($groupBy, $groupValue);
        })->orderBy($order_column)->get(['id', $display_value, $order_column]);

        return Inertia::render('admin/Sort/index', [
            'items' => $items,
            'model' => $model,
            'display_value' => $display_value,
            'order_column' => $order_column,
        ]);

    }

    public function store(Request $request): \Illuminate\Http\RedirectResponse
    {
        $request->validate([
            'items' => 'required|array',
            'items.*.id' => 'required',
            'items.*.'.$request->order_column => 'required|integer',
            'order_column' => 'required|string',
            'model' => 'required|string',
        ]);

        $modelClass = 'App\Models\\'.$request->model;

        if (! class_exists($modelClass)) {
            throw new \RuntimeException(sprintf('Model %s not found', $modelClass));
        }

        $modelClass::whereIn('id', collect($request->items)->pluck('id'))->update([
            $request->order_column => \DB::raw('CASE id '.
                collect($request->items)->map(fn ($item
                ): string => sprintf('WHEN %s THEN %s', $item['id'], $item[$request->order_column]))->join(' ')
                .' END'),
        ]);

        return $this->redirectAfterSave($request, back());
    }
}
