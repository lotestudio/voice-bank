<?php

declare(strict_types=1);

namespace App\Transformers\DataTable;

use App\Lote\DataTables2\Columns;
use App\Lote\DataTables2\DataTableResource;
use App\Models\Order;

class OrderDataTable extends DataTableResource
{
    public ?string $model = Order::class;

    public string $defaultOrderField = 'id';

    public array $searchableFields = [0 => 'order_number', 1 => 'title', 2 => 'description'];

    // public ?string $useDatabaseTablePrefix = \"\";
    // public ?string $exportClass = ExportClass::class;

    public string $exportFileName = 'export.xlsx';

    protected string $defaultWidth = '200px';

    protected array $columns = [
        ['label' => 'Title', 'sort' => 'order_number'],
        ['label' => 'Status', 'sort' => 'status'],
        ['label' => 'Deadline', 'sort' => 'deadline'],
        ['label' => 'Voices'],
        ['label' => 'Actions'],
    ];

    public function getColumns(): array
    {
        $columns = Columns::make($this->columns, ['defaultWidth' => $this->defaultWidth]);
        $columns->getByLabel('Actions')->alignRight();
        $columns->getByLabel('Voices')->alignRight();
        $columns->getByLabel('Deadline')->alignRight();

        return $columns->toArray();
    }

    public function preBuild(): void
    {
        $this->builder->with(['voices.user']);
    }

    protected function transform($item): array
    {
        $res = $item->toArray();

        $res['voices_count'] = $item->voices->count();
        $res['artists'] = $item->voices->pluck('user.name','user_id');
        $res['status'] = $item->status->value;
        $res['status_label'] = $item->status->label($item);

        $res['deadline'] = $item->deadline->format('d.m.Y');

        $res['actions'] = [
            [
                'label' => 'Edit',
                'href' => route('order.edit', $item->id),
                'icon' => 'i-edit',
                'class' => 'btn btn-warning btn-xs',
            ],
        ];

        return $res;
    }

    public function filterQueryUser_id($value): void{
        $this->builder->where(function ($q) use ($value){
            $q->whereHas('voices.user', function ($query) use ($value): void {
                $query->where('id', $value);
            })->orWhere('user_id', $value);
        });
    }
}
