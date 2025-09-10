<?php

namespace App\Transformers\DataTable;

use App\Lote\DataTables2\Columns;
use App\Lote\DataTables2\DataTableResource;
use App\Models\User;

class UserDataTable extends DataTableResource
{
    public ?string $model = User::class;

    public string $defaultOrderField = 'id';

    public array $searchableFields = array (0 => 'name',1 => 'email',);
    // public ?string $useDatabaseTablePrefix = \"\";
    // public ?string $exportClass = ExportClass::class;

    public string $exportFileName = 'export.xlsx';

    protected string $defaultWidth = '200px';

    protected array $columns = [
        ['label' => 'Title', 'sort' => 'name'],
    ];

    public function getColumns(): array
    {
        $columns = Columns::make($this->columns, ['defaultWidth' => $this->defaultWidth]);
        return $columns->toArray();
    }

    protected function transform($item): array
    {
        $res = $item->toArray();
        $res['actions'] = [
            [
                'label' => 'Редакция',
                'href' => route('user.edit', $item->id),
                'icon' => 'i-edit',
                'class' => 'btn btn-warning btn-xs',
            ],
        ];
        return $res;
    }
}
