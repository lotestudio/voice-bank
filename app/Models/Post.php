<?php

declare(strict_types=1);

namespace App\Models;

use App\Traits\HasTranslations;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasTranslations;

    protected $guarded = [];

    protected $translatable = ['title', 'excerpt', 'body'];

    protected $casts = [
        'is_published' => 'boolean',
    ];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($post): void {
            $post->slug = is_null($post->section) ? str($post->title['en'])->slug() : str($post->section)->slug();

            $originalSlug = $post->slug;
            $counter = 1;

            while (static::where('slug', $post->slug)->exists()) {
                $post->slug = $originalSlug.'-'.$counter++;
            }
        });
    }
}
