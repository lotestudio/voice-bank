<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Attributes\Scope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Collection;
use Spatie\Translatable\HasTranslations;

class Voice extends Model
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
        'user_id',
        'title',
        'description',
        'is_active',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'is_active' => 'boolean',
    ];

    /**
     * Get the user that owns the voice.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Get the feature values for the voice.
     */
    public function featureValues(): BelongsToMany
    {
        return $this->belongsToMany(FeatureValue::class, 'voice_feature_values');
    }

    /**
     * Scope a query to only include active voices.
     */
    public function scopeActive($query)
    {
        return $query->where('is_active', true);
    }

    /**
     * Scope a query to only include voices with specific feature values.
     */
    #[Scope]
    protected function withFeatureValues($query, array $featureValueIds)
    {
        foreach ($featureValueIds as $featureValueId) {
            $query->whereHas('featureValues', function ($query) use ($featureValueId) {
                $query->where('feature_values.id', $featureValueId);
            });
        }

        return $query;
    }

    /**
     * Get the reviews for the voice.
     */
    public function reviews(): HasMany
    {
        return $this->hasMany(Review::class);
    }

    /**
     * Get the average rating for the voice.
     */
    public function getAverageRatingAttribute(): float
    {
        return $this->reviews()->approved()->avg('rating') ?? 0;
    }

    /**
     * Get the total number of reviews for the voice.
     */
    public function getReviewsCountAttribute(): int
    {
        return $this->reviews()->approved()->count();
    }

    /**
     * Get the favorites for the voice.
     */
    public function favorites(): HasMany
    {
        return $this->hasMany(Favorite::class);
    }

    /**
     * Get the users who favorited this voice.
     */
    public function favoritedBy()
    {
        return $this->belongsToMany(User::class, 'favorites', 'voice_id', 'user_id')
            ->withTimestamps();
    }

    /**
     * Get the total number of favorites for the voice.
     */
    public function getFavoritesCountAttribute(): int
    {
        return $this->favorites()->count();
    }

    /**
     * Get the samples for the voice.
     */
    public function samples(): HasMany
    {
        return $this->hasMany(Sample::class);
    }

    /**
     * Get the featured sample for the voice.
     */
    public function featuredSample()
    {
        return $this->samples()->featured()->ordered()->first();
    }

    /**
     * Check if the voice has samples.
     */
    public function hasSamples(): bool
    {
        return $this->samples()->exists();
    }

    /**
     * Get the total number of samples for the voice.
     */
    public function getSamplesCountAttribute(): int
    {
        return $this->samples()->count();
    }

    /**
     * Orders that include this voice.
     */
    public function orders(): BelongsToMany
    {
        return $this->belongsToMany(Order::class, 'order_voice')
            ->withTimestamps();
    }

    /**
     * Get the active orders for the voice.
     */
    public function activeOrders()
    {
        return $this->orders()->active();
    }

    /**
     * Get the completed orders for the voice.
     */
    public function completedOrders()
    {
        return $this->orders()->completed();
    }

    /**
     * Get the total number of orders for the voice.
     */
    public function getOrdersCountAttribute(): int
    {
        return $this->orders()->count();
    }

    /**
     * Get the total earnings for the voice.
     */
    public function getTotalEarningsAttribute(): float
    {
        return $this->orders()->completed()->sum('amount');
    }

    public static function forSelect($prepend = true, $prepend_label = 'Choose voice'): Collection
    {
        $items = self::query()->orderBy('title')->get(['title', 'id'])->map(function ($item) {
            return [
                'label' => $item->title,
                'value' => $item->id,
            ];
        });

        if ($prepend) {
            $items = $items->prepend(['label' => $prepend_label, 'value' => null]);
        }

        return $items;

    }
}
