<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Spatie\Translatable\HasTranslations;

class Sample extends Model
{
    use HasFactory, HasTranslations;

    /**
     * The attributes that are translatable.
     *
     * @var array<int, string>
     */
    public $translatable = ['title', 'description'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'voice_id',
        'title',
        'description',
        'file_url',
        'file_type',
        'duration',
        'file_size',
        'is_featured',
        'sort_order',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'duration' => 'integer',
        'file_size' => 'integer',
        'is_featured' => 'boolean',
        'sort_order' => 'integer',
    ];

    /**
     * Get the voice that owns the sample.
     */
    public function voice(): BelongsTo
    {
        return $this->belongsTo(Voice::class);
    }

    /**
     * Scope a query to only include featured samples.
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
     * Get the formatted duration of the sample.
     */
    public function getFormattedDurationAttribute(): string
    {
        if (!$this->duration) {
            return '0:00';
        }

        $minutes = floor($this->duration / 60);
        $seconds = $this->duration % 60;

        return $minutes . ':' . str_pad($seconds, 2, '0', STR_PAD_LEFT);
    }

    /**
     * Get the formatted file size of the sample.
     */
    public function getFormattedFileSizeAttribute(): string
    {
        if (!$this->file_size) {
            return '0 KB';
        }

        $units = ['B', 'KB', 'MB', 'GB'];
        $size = $this->file_size;
        $i = 0;

        while ($size >= 1024 && $i < count($units) - 1) {
            $size /= 1024;
            $i++;
        }

        return round($size, 2) . ' ' . $units[$i];
    }
}
