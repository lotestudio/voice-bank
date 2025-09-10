<?php

namespace App\Transformers\DataTable;

use App\Lote\DataTables2\Columns;
use App\Lote\DataTables2\DataTableResource;
use App\Models\FeatureValue;

class FeatureValueDataTable extends DataTableResource
{
    public ?string $model = FeatureValue::class;

    public string $defaultOrderField = 'id';

    public array $searchableFields = array (0 => 'value',1 => 'display_value',2 => 'description',);
    // public ?string $useDatabaseTablePrefix = \"\";
    // public ?string $exportClass = ExportClass::class;

    public string $exportFileName = 'export.xlsx';

    protected string $defaultWidth = '200px';

    protected array $columns = [
        ['label' => 'Title', 'sort' => 'display_value'],
    ];

    public function getColumns(): array
    {
        $columns = Columns::make($this->columns, ['defaultWidth' => $this->defaultWidth]);
        return $columns->toArray();
    }

    public function preBuild(): void{
        $this->builder->with(['feature']);
    }

    protected function transform($item): array
    {
        $res = $item->toArray();
        $res['actions'] = [
            [
                'label' => 'Редакция',
                'href' => route('feature-value.edit', $item->id),
                'icon' => 'i-edit',
                'class' => 'btn btn-warning btn-xs',
            ],
        ];
        return $res;
    }
}
