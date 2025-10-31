<?php

namespace App\Transformers\DataTable;

use App\Lote\DataTables2\Columns;
use App\Lote\DataTables2\DataTableResource;
use App\Models\Feature;
use Illuminate\Support\Facades\DB;

class FeatureDataTable extends DataTableResource
{
    public ?string $model = Feature::class;

    public string $defaultOrderField = 'id';

    public array $searchableFields = array (0 => 'name',1 => 'display_name',2 => 'description',);
    // public ?string $useDatabaseTablePrefix = \"\";
    // public ?string $exportClass = ExportClass::class;

    public string $exportFileName = 'export.xlsx';

    protected string $defaultWidth = '200px';

    protected array $columns = [
        ['label' => 'Title', 'sort' => 'display_name'],
        ['label' => 'Slug(name)', 'sort' => 'name'],
        ['label' => 'Values count', 'sort' => 'values_count'],
        ['label' => 'Featured', 'sort' => 'is_featured'],
        ['label' => 'Order', 'sort' => 'sort_order'],
        ['label' => 'Actions'],
    ];

    public function getColumns(): array
    {
        $columns = Columns::make($this->columns, ['defaultWidth' => $this->defaultWidth]);
        return $columns->toArray();
    }

    public function preBuild(): void
    {
        $this->builder->withCount(['values']);
    }

    protected function transform($item): array
    {
        $res = $item->toArray();

        $res['actions'] = [
            [
                'label' => 'Редакция',
                'href' => route('feature.edit', $item->id),
                'icon' => 'i-edit',
                'class' => 'btn btn-warning btn-xs',
            ],
        ];
        return $res;
    }


//    public function sortQueryValues_count($orderDirection): void
//    {
//        $this->builder->orderBy('values_count', $orderDirection);
//    }

}
