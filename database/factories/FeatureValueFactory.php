<?php

namespace Database\Factories;

use App\Models\Feature;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\FeatureValue>
 */
class FeatureValueFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $value = fake()->unique()->word();
        $englishDisplayValue = ucfirst($value);
        $englishDescription = fake()->sentence();

        return [
            'feature_id' => Feature::factory(),
            'value' => $value,
            'display_value' => [
                'en' => $englishDisplayValue,
                'bg' => 'БГ: ' . $englishDisplayValue // Placeholder for Bulgarian translation
            ],
            'description' => [
                'en' => $englishDescription,
                'bg' => 'БГ: ' . $englishDescription // Placeholder for Bulgarian translation
            ],
            'sort_order' => fake()->numberBetween(0, 100),
        ];
    }

    /**
     * Indicate that the feature value belongs to a specific feature.
     */
    public function forFeature(Feature $feature): static
    {
        return $this->state(fn (array $attributes) => [
            'feature_id' => $feature->id,
        ]);
    }

    /**
     * Set a specific sort order for the feature value.
     */
    public function sortOrder(int $order): static
    {
        return $this->state(fn (array $attributes) => [
            'sort_order' => $order,
        ]);
    }
}
