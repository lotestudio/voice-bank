<?php

    namespace App\Transformers\DataTable;

    use App\Lote\DataTables2\Columns;

    use App\Lote\DataTables2\DataTableResource;
    use App\Models\Voice; // Променете, ако вашият модел е на друго място
    use Illuminate\Database\Eloquent\Builder;
    use Illuminate\Support\Collection;

    class VoicesSiteDataTable extends DataTableResource
    {

        public ?string $model = Voice::class;

        protected int $perPage = 6;
        public ?string $searchable = 'title';

    //  public string $defaultOrderField = 'order';

    //  public ?string $useDatabaseTablePrefix = '';

    //  public ?string $exportClass = EXPORTCLASS::class;

    //  public string $exportFileName = 'excel_name.xlsx';


        protected array $columns = [
            ['label'=>'Title','sort'=>'name'],
            ['label'=>'User']
        ];


        //Manipulate the columns or just right the array $columns manually. Delete if protected array $columns is enough
        public function getColumns():array
        {
            $columns = Columns::make($this->columns, ['defaultWidth'=>$this->defaultWidth]);
            return $columns->toArray();
        }

        // prebuild global where, with, etc. Delete if not needed
        public function preBuild(): void {
            $this->builder->withFeatureValues([])->with(['featureValues.feature','user','samples']);
        }


        protected function transform($item): array
        {
            return self::itemTransform($item);
        }

        public static function itemTransform($item):array
        {
            $res['id']=$item->id;
            $res['title']=$item->title;
            $res['user']=$item->user;
            $res['user_initials']=$item->user->initials;
            $res['sample']=$item->featuredSample();
            $res['favorites_count']=$item->favorites_count;
            $res['orders_count']=$item->orders_count;
            $res['features']=$item->featureValues?->groupBy('feature_id')->map(function($item,$key){
                return [
                    'id'=>$key,
                    'name'=>$item->first()->feature->display_name,
                    'values' => $item->pluck('display_value')->join(', ')
                ];
            });



            return $res;

        }

        //info or caption comes with data to table
        protected function info(Collection $collection): ?string
        {
            return null;
        }
    }
