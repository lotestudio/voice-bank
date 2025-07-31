<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class VoiceFeatureValue extends Model
{
    use HasFactory;

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
