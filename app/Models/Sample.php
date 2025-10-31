<?php

namespace App\Models;

use App\Traits\HasUploadedFile;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Storage;
use Spatie\Translatable\HasTranslations;

class Sample extends Model
{
    use HasFactory, HasTranslations, HasUploadedFile;

    /**
     * The attributes that are translatable.
     *
     * @var array<int, string>
     */
    public $translatable = ['title', 'description'];

    protected static function boot()
    {
        parent::boot();

        static::saving(function ($model) {
            if ($model->isDirty('file_url')) {
                $model->updateFileAttributes();
            }
        });
    }

    protected function updateFileAttributes(): void
    {
        $disk = Storage::disk('public');

        if (!$this->file_url || !$disk->exists('samples/'.$this->file_url)) {
            return;
        }

        $this->file_type = pathinfo($this->file_url, PATHINFO_EXTENSION);
        $this->file_size = $disk->size('samples/'.$this->file_url);

        // Get audio duration if it's an audio file
        if (str_starts_with($this->file_type, 'audio/')) {
            $getID3 = new \getID3();
            $fileInfo = $getID3->analyze($disk->path('samples/'.$this->file_url));
            $this->duration = isset($fileInfo['playtime_seconds']) ? (int) $fileInfo['playtime_seconds'] : 0;
        }
    }

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


    public static function forSelect($prepend = true, $prepend_label = 'Choose sample'): Collection
    {
        $items = self::query()->orderBy('title')->get(['title', 'id'])->map(function ($item) {
            return [
                'label' => $item->title,
                'value' => $item->id
            ];
        });

        if ($prepend) {
            $items = $items->prepend(['label' => $prepend_label, 'value' => null]);
        }

        return $items;

    }
}

