<?php

declare(strict_types=1);

namespace App\Transformers\DataTable;

use App\Enums\Roles;
use App\Lote\DataTables2\Columns;
use App\Lote\DataTables2\DataTableResource;
use App\Models\User;

class UserDataTable extends DataTableResource
{
    public ?string $model = User::class;

    public string $defaultOrderField = 'id';

    public array $searchableFields = [0 => 'name', 1 => 'email'];

    // public ?string $useDatabaseTablePrefix = \"\";
    // public ?string $exportClass = ExportClass::class;

    public string $exportFileName = 'export.xlsx';

    protected string $defaultWidth = '200px';

    protected array $columns = [
        ['label' => 'Title', 'sort' => 'name'],
        ['label' => 'Voices',],
        ['label' => 'Orders',],
        ['label' => 'Actions'],
    ];

    public function getColumns(): array
    {
        $columns = Columns::make($this->columns, ['defaultWidth' => $this->defaultWidth]);
        $columns->getByLabel('Actions')->alignRight();
        $columns->getByLabel('Voices')->alignRight();
        $columns->getByLabel('Orders')->alignRight();

        return $columns->toArray();
    }


    public function preBuild(): void
    {
        $this->builder->withCount(['voices','orders','voiceOrders']);
    }

    protected function transform($item): array
    {
        $res = $item->toArray();

        $res['role'] = $item->role->label();
        $res['voices_count'] = $item->voices_count;
        $res['orders_count'] = $item->role===Roles::ARTIST ? $item->voice_orders_count :  $item->orders_count;

        $res['actions'] = [
            [
                'label' => 'View',
                'href' => route('user.show', $item->id),
                'icon' => 'i-eye',
                'class' => 'btn btn-warning btn-xs',
            ],
            [
                'label' => 'Edit',
                'href' => route('user.edit', $item->id),
                'icon' => 'i-edit',
                'class' => 'btn btn-warning btn-xs',
            ],
        ];

        return $res;
    }
}
