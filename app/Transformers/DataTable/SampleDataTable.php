<?php

namespace App\Transformers\DataTable;

use App\Lote\DataTables2\Columns;
use App\Lote\DataTables2\DataTableResource;
use App\Models\Sample;

class SampleDataTable extends DataTableResource
{
    public ?string $model = Sample::class;

    public string $defaultOrderField = 'id';

    public array $searchableFields = [0 => 'title', 1 => 'description'];
    // public ?string $useDatabaseTablePrefix = \"\";
    // public ?string $exportClass = ExportClass::class;

    public string $exportFileName = 'export.xlsx';

    protected string $defaultWidth = '200px';

    protected array $columns = [
        ['label' => 'Title', 'sort' => 'title'],
        ['label' => 'Voice/User', 'sort' => 'voice_id'],
        ['label' => 'Is Featured', 'sort' => 'is_featured'],
        ['label' => 'Order', 'sort' => 'sort_order'],
        ['label' => 'Actions'],
    ];

    public function getColumns(): array
    {
        $columns = Columns::make($this->columns, ['defaultWidth' => $this->defaultWidth]);
        $columns->getByLabel('Actions')->alignRight();
        $columns->getByLabel('Order')->alignRight();

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

    public function filterQueryUser($value): void
    {
        $this->builder->whereHas('voice.user', function ($query) use ($value) {
            $query->where('id', $value);
        });
    }
}
