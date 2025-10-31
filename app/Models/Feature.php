<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Str;
use Spatie\Translatable\HasTranslations;

class Feature extends Model
{
    use HasFactory, HasTranslations;

    /**
     * The attributes that are translatable.
     *
     * @var array<int, string>
     */
    public $translatable = ['display_name', 'description'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'display_name',
        'description',
        'is_featured',
        'sort_order',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'is_featured' => 'boolean',
        'sort_order' => 'integer',
    ];

    /**
     * Get the values for the feature.
     */
    public function values(): HasMany
    {
        return $this->hasMany(FeatureValue::class)->orderBy('sort_order');
    }

    /**
     * Scope a query to only include filterable features.
     */
    public function scopeFeatured($query)
    {
        return $query->where('is_featured', true);
    }

    /**
     * Scope a query to order by sort_order.
     */
    public function scopeOrdered($query)
    {
        return $query->orderBy('sort_order');
    }

    /**
     * Set the feature's name as a slug.
     */
    public function setNameAttribute($value): void
    {
        $this->attributes['name'] = Str::slug($value);
    }

    public static function forSelect($prepend_label='Choose feature')
    {

        $res = Feature::query()
            ->orderBy('name')
            ->pluck('display_name','id')
            ->map(function($name,$key){
                return [
                    'label' => $name,
                    'value' => $key
                ];
            });


        if($prepend_label){
            $res=$res->prepend(['label'=>$prepend_label,'value'=>null]);
        }

        return $res;
    }

    public function valuesForSelect($prepend=true)
    {

        $res = $this->values
            ->pluck('display_value','id')
            ->map(function($name,$key){
                return [
                    'label' => $name,
                    'value' => $key
                ];
            });


        if($prepend){
            $prepend_label = Str::ucfirst(\Lang::get('site.choose')).' '.$this->display_name;
            $res=$res->prepend(['label'=>$prepend_label,'value'=>null]);
        }

        return $res;
    }

}
