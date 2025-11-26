<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class VoiceFeatureValue extends Pivot
{
    use HasFactory;


    protected $table = 'voice_feature_values';
    public $timestamps = false;
    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'voice_id',
        'feature_value_id',
    ];

    /**
     * Get the voice that owns the voice feature value.
     */
    public function voice(): BelongsTo
    {
        return $this->belongsTo(Voice::class);
    }

    /**
     * Get the feature value that owns the voice feature value.
     */
    public function featureValue(): BelongsTo
    {
        return $this->belongsTo(FeatureValue::class);
    }

    /**
     * Get the feature through the feature value.
     */
    public function feature()
    {
        return $this->featureValue->feature();
    }
}
