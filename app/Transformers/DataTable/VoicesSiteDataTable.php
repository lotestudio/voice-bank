<?php

declare(strict_types=1);

namespace App\Transformers\DataTable;

use App\Lote\DataTables2\Columns;
use App\Lote\DataTables2\DataTableResource;
use App\Models\Voice; // Променете, ако вашият модел е на друго място
use Illuminate\Support\Collection;

class VoicesSiteDataTable extends DataTableResource
{
    public ?string $model = Voice::class;

    protected int $perPage = 12;

    public ?string $searchable = 'title';

    //  public string $defaultOrderField = 'order';

    //  public ?string $useDatabaseTablePrefix = '';

    //  public ?string $exportClass = EXPORTCLASS::class;

    //  public string $exportFileName = 'excel_name.xlsx';

    protected array $columns = [
        ['label' => 'Title', 'sort' => 'name'],
        ['label' => 'User'],
    ];

    // Manipulate the columns or just right the array $columns manually. Delete if protected array $columns is enough
    public function getColumns(): array
    {
        $columns = Columns::make($this->columns, ['defaultWidth' => $this->defaultWidth]);

        return $columns->toArray();
    }

    // prebuild global where, with, etc. Delete if not needed
    public function preBuild(): void
    {
        $this->builder->withFeatureValues([])->with(['featureValues.feature', 'user', 'samples']);
    }

    protected function transform($item): array
    {
        return self::itemTransform($item);
    }

    public static function itemTransform($item): array
    {
        return ['id' => $item->id, 'title' => $item->title, 'user' => $item->user, 'sample' => $item->featuredSample(), 'favorites_count' => $item->favorites_count, 'orders_count' => $item->orders_count, 'average_rating' => $item->average_rating, 'availability' => $item->user->artist_status->label(), 'features' => $item->featureValues?->groupBy('feature_id')->map(function ($item, $key): array {
            return [
                'id' => $key,
                'name' => $item->first()->feature->display_name,
                'values' => $item->pluck('display_value')->join(', '),
            ];
        })];
    }

    // info or caption comes with data to table
    protected function info(Collection $collection): ?string
    {
        return null;
    }

    protected function filter(): void
    {
        $filtersInput = request()->get('filters') ?? [];

        if (! empty($filtersInput)) {

            foreach ($filtersInput as $field => $value) {

                if (in_array($field, $this->excludedFilters)) {
                    continue;
                }

                if (str_starts_with($field, 'feature_') && ! empty($value)) {
                    $featureId = substr($field, 8); // Remove 'feature_' prefix

                    if (is_array($value)) {
                        // Multiple values for the same feature (OR condition)
                        $this->builder->whereHas('featureValues', function ($query) use ($featureId, $value): void {
                            $query->whereIn('feature_values.id', $value)
                                ->whereHas('feature', function ($query) use ($featureId): void {
                                    $query->where('id', $featureId);
                                });
                        });
                    } else {
                        // Single value for the feature
                        $this->builder->whereHas('featureValues', function ($query) use ($value): void {
                            $query->where('feature_values.id', $value);
                        });
                    }

                    continue;
                }

                $filterQueryMethod = 'filterQuery'.ucfirst($field);

                if (method_exists($this, $filterQueryMethod)) {
                    $this->$filterQueryMethod($value);
                } elseif ($value === self::NULL_VALUE) {
                    $this->builder->whereNull($this->setDatabasePrefixToField($field));
                } else {
                    $this->builder->where($this->setDatabasePrefixToField($field), $value);
                }
            }

        }

    }
}
