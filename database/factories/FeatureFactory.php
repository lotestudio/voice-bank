<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Feature>
 */
class FeatureFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = fake()->unique()->word();
        $englishDisplayName = ucfirst($name);
        $englishDescription = fake()->sentence();

        return [
            'name' => $name,
            'display_name' => [
                'en' => $englishDisplayName,
                'bg' => 'БГ: '.$englishDisplayName, // Placeholder for Bulgarian translation
            ],
            'description' => [
                'en' => $englishDescription,
                'bg' => 'БГ: '.$englishDescription, // Placeholder for Bulgarian translation
            ],
            'is_filterable' => true,
            'sort_order' => fake()->numberBetween(0, 100),
        ];
    }

    /**
     * Indicate that the feature is not filterable.
     */
    public function notFilterable(): static
    {
        return $this->state(fn (array $attributes) => [
            'is_filterable' => false,
        ]);
    }

    /**
     * Set a specific sort order for the feature.
     */
    public function sortOrder(int $order): static
    {
        return $this->state(fn (array $attributes) => [
            'sort_order' => $order,
        ]);
    }
}
