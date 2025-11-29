<?php

namespace Database\Factories;

use App\Models\Order;
use App\Models\User;
use App\Models\Voice;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Review>
 */
class ReviewFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $englishComment = fake()->paragraph();

        $client = User::factory()->client();
        $voice = Voice::factory();
        $order = Order::factory()->for($client)->for($voice)->create();

        return [
            'user_id' => $client,
            'voice_id' => $voice,
            'order_id' => $order,
            'rating' => fake()->numberBetween(1, 5),
            'comment' => [
                'en' => $englishComment,
                'bg' => 'БГ: '.$englishComment, // Placeholder for Bulgarian translation
            ],
            'is_approved' => fake()->boolean(80), // 80% chance of being approved
        ];
    }

    /**
     * Indicate that the review is approved.
     */
    public function approved(): static
    {
        return $this->state(fn (array $attributes) => [
            'is_approved' => true,
        ]);
    }

    /**
     * Indicate that the review is not approved.
     */
    public function notApproved(): static
    {
        return $this->state(fn (array $attributes) => [
            'is_approved' => false,
        ]);
    }

    /**
     * Indicate that the review has a specific rating.
     */
    public function rating(int $rating): static
    {
        return $this->state(fn (array $attributes) => [
            'rating' => $rating,
        ]);
    }

    /**
     * Indicate that the review belongs to a specific user.
     */
    public function forUser(User $user): static
    {
        return $this->state(fn (array $attributes) => [
            'user_id' => $user->id,
        ]);
    }

    /**
     * Indicate that the review is for a specific voice.
     */
    public function forVoice(Voice $voice): static
    {
        return $this->state(fn (array $attributes) => [
            'voice_id' => $voice->id,
        ]);
    }
}
