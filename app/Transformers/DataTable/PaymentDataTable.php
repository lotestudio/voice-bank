<?php

declare(strict_types=1);

namespace App\Transformers\DataTable;

use App\Lote\DataTables2\Columns;
use App\Lote\DataTables2\DataTableResource;
use App\Models\Payment;

class PaymentDataTable extends DataTableResource
{
    public ?string $model = Payment::class;

    public string $defaultOrderField = 'id';

    public array $searchableFields = [0 => 'payment_id'];

    // public ?string $useDatabaseTablePrefix = \"\";
    // public ?string $exportClass = ExportClass::class;

    public string $exportFileName = 'export.xlsx';

    protected string $defaultWidth = '200px';

    protected array $columns = [
        ['label' => 'Title', 'sort' => 'payment_id'],
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
                'href' => route('payment.edit', $item->id),
                'icon' => 'i-edit',
                'class' => 'btn btn-warning btn-xs',
            ],
        ];

        return $res;
    }
}
