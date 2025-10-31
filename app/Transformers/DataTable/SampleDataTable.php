<?php

namespace App\Transformers\DataTable;

use App\Lote\DataTables2\Columns;
use App\Lote\DataTables2\DataTableResource;
use App\Models\Sample;

class SampleDataTable extends DataTableResource
{
    public ?string $model = Sample::class;

    public string $defaultOrderField = 'id';

    public array $searchableFields = array (0 => 'title',1 => 'description',);
    // public ?string $useDatabaseTablePrefix = \"\";
    // public ?string $exportClass = ExportClass::class;

    public string $exportFileName = 'export.xlsx';

    protected string $defaultWidth = '200px';

    protected array $columns = [
        ['label' => 'Title', 'sort' => 'title'],
    ];

    public function getColumns(): array
    {
        $columns = Columns::make($this->columns, ['defaultWidth' => $this->defaultWidth]);
        return $columns->toArray();
    }

    public function preBuild(): void
    {
       $this->builder->with(['voice.user']);
    }

    protected function transform($item): array
    {
        $res = $item->toArray();
        $res['voice_user_name'] = $item->voice->title.'/'.$item->voice->user->name;
        $res['actions'] = [
            [
                'label' => 'Редакция',
                'href' => route('sample.edit', $item->id),
                'icon' => 'i-edit',
                'class' => 'btn btn-warning btn-xs',
            ],
        ];
        return $res;
    }
}
