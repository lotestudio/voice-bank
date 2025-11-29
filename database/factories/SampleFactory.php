<?php

namespace Database\Factories;

use App\Models\Voice;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Sample>
 */
class SampleFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $englishTitle = fake()->sentence(3);
        $englishDescription = fake()->paragraph();
        $fileTypes = ['mp3', 'wav', 'ogg', 'm4a'];
        $duration = fake()->numberBetween(30, 300); // 30 seconds to 5 minutes
        $fileSize = fake()->numberBetween(1000000, 10000000); // 1MB to 10MB

        return [
            'voice_id' => Voice::factory(),
            'title' => [
                'en' => $englishTitle,
                'bg' => 'БГ: '.$englishTitle, // Placeholder for Bulgarian translation
            ],
            'description' => [
                'en' => $englishDescription,
                'bg' => 'БГ: '.$englishDescription, // Placeholder for Bulgarian translation
            ],
            'file_url' => 'sample_1.mp3',
            'file_type' => 'mp3',
            'duration' => $duration,
            'file_size' => $fileSize,
            'is_featured' => fake()->boolean(20), // 20% chance of being featured
            'sort_order' => fake()->numberBetween(0, 100),
        ];
    }

    /**
     * Indicate that the sample is featured.
     */
    public function featured(): static
    {
        return $this->state(fn (array $attributes) => [
            'is_featured' => true,
        ]);
    }

    /**
     * Indicate that the sample is not featured.
     */
    public function notFeatured(): static
    {
        return $this->state(fn (array $attributes) => [
            'is_featured' => false,
        ]);
    }

    /**
     * Indicate that the sample belongs to a specific voice.
     */
    public function forVoice(Voice $voice): static
    {
        return $this->state(fn (array $attributes) => [
            'voice_id' => $voice->id,
        ]);
    }

    /**
     * Set a specific sort order for the sample.
     */
    public function sortOrder(int $order): static
    {
        return $this->state(fn (array $attributes) => [
            'sort_order' => $order,
        ]);
    }
}
