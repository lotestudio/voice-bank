<?php

namespace App\Services;

use App\Models\Voice;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Collection;

class VoiceFilterService
{
    /**
     * Filter voices based on the provided criteria.
     */
    public function filter(array $filters = []): Builder
    {
        $query = Voice::query()->with(['user', 'featureValues.feature'])->active();

        // Filter by artist
        if (! empty($filters['artist_id'])) {
            $query->where('user_id', $filters['artist_id']);
        }

        // Filter by search term (title or description)
        if (! empty($filters['search'])) {
            $search = $filters['search'];
            $query->where(function ($query) use ($search) {
                $query->where('title', 'like', "%{$search}%")
                    ->orWhere('description', 'like', "%{$search}%");
            });
        }

        // Filter by feature values
        if (! empty($filters['feature_values']) && is_array($filters['feature_values'])) {
            $query->withFeatureValues($filters['feature_values']);
        }

        // Filter by specific features
        foreach ($filters as $key => $value) {
            if (str_starts_with($key, 'feature_') && ! empty($value)) {
                $featureId = substr($key, 8); // Remove 'feature_' prefix

                if (is_array($value)) {
                    // Multiple values for the same feature (OR condition)
                    $query->whereHas('featureValues', function ($query) use ($featureId, $value) {
                        $query->whereIn('feature_values.id', $value)
                            ->whereHas('feature', function ($query) use ($featureId) {
                                $query->where('id', $featureId);
                            });
                    });
                } else {
                    // Single value for the feature
                    $query->whereHas('featureValues', function ($query) use ($value) {
                        $query->where('feature_values.id', $value);
                    });
                }
            }
        }

        return $query;
    }

    /**
     * Get all available features with their values for filtering.
     */
    public function getFilterableFeatures(): Collection
    {
        return \App\Models\Feature::filterable()
            ->ordered()
            ->with(['values' => function ($query) {
                $query->ordered();
            }])
            ->get();
    }

    /**
     * Get the most popular feature values based on voice count.
     */
    public function getPopularFeatureValues(int $limit = 10): Collection
    {
        return \App\Models\FeatureValue::withCount('voices')
            ->orderByDesc('voices_count')
            ->limit($limit)
            ->get();
    }
}
