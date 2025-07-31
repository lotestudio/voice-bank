<?php

namespace Database\Factories;

use App\Models\Order;
use App\Models\User;
use App\Models\Voice;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Order>
 */
class OrderFactory extends Factory
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
        $englishNotes = fake()->paragraph(2);
        $artistNotes = fake()->boolean(70) ? fake()->paragraph(2) : null; // 70% chance of having artist notes
        $amount = fake()->randomFloat(2, 50, 1000);
        $currencies = ['USD', 'EUR', 'GBP'];
        $statuses = ['pending', 'accepted', 'in_progress', 'completed', 'cancelled', 'refunded'];
        $status = $statuses[array_rand($statuses)];

        // Generate dates based on status
        $acceptedAt = null;
        $completedAt = null;

        if (in_array($status, ['accepted', 'in_progress', 'completed'])) {
            $acceptedAt = now()->subDays(rand(1, 30));
        }

        if ($status === 'completed') {
            $completedAt = $acceptedAt ? $acceptedAt->copy()->addDays(rand(1, 14)) : now()->subDays(rand(1, 14));
        }

        return [
            'user_id' => User::factory()->client(),
            'voice_id' => Voice::factory(),
            'order_number' => Order::generateOrderNumber(),
            'title' => [
                'en' => $englishTitle,
                'bg' => 'БГ: ' . $englishTitle // Placeholder for Bulgarian translation
            ],
            'description' => [
                'en' => $englishDescription,
                'bg' => 'БГ: ' . $englishDescription // Placeholder for Bulgarian translation
            ],
            'amount' => $amount,
            'currency' => $currencies[array_rand($currencies)],
            'status' => $status,
            'deadline' => now()->addDays(rand(3, 30)),
            'word_count' => fake()->numberBetween(100, 5000),
            'script_url' => fake()->boolean(80) ? 'https://example.com/scripts/' . fake()->uuid() . '.pdf' : null,
            'result_url' => $status === 'completed' ? 'https://example.com/results/' . fake()->uuid() . '.mp3' : null,
            'notes' => $englishNotes ? [
                'en' => $englishNotes,
                'bg' => 'БГ: ' . $englishNotes // Placeholder for Bulgarian translation
            ] : null,
            'artist_notes' => $artistNotes ? [
                'en' => $artistNotes,
                'bg' => 'БГ: ' . $artistNotes // Placeholder for Bulgarian translation
            ] : null,
            'accepted_at' => $acceptedAt,
            'completed_at' => $completedAt,
        ];
    }

    /**
     * Indicate that the order is pending.
     */
    public function pending(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'pending',
            'accepted_at' => null,
            'completed_at' => null,
        ]);
    }

    /**
     * Indicate that the order is accepted.
     */
    public function accepted(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'accepted',
            'accepted_at' => now()->subDays(rand(1, 7)),
            'completed_at' => null,
        ]);
    }

    /**
     * Indicate that the order is in progress.
     */
    public function inProgress(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'in_progress',
            'accepted_at' => now()->subDays(rand(1, 7)),
            'completed_at' => null,
        ]);
    }

    /**
     * Indicate that the order is completed.
     */
    public function completed(): static
    {
        $acceptedAt = now()->subDays(rand(7, 14));

        return $this->state(fn (array $attributes) => [
            'status' => 'completed',
            'accepted_at' => $acceptedAt,
            'completed_at' => $acceptedAt->copy()->addDays(rand(1, 7)),
            'result_url' => 'https://example.com/results/' . fake()->uuid() . '.mp3',
        ]);
    }

    /**
     * Indicate that the order is cancelled.
     */
    public function cancelled(): static
    {
        return $this->state(fn (array $attributes) => [
            'status' => 'cancelled',
            'accepted_at' => fake()->boolean(50) ? now()->subDays(rand(1, 7)) : null,
            'completed_at' => null,
        ]);
    }

    /**
     * Indicate that the order is refunded.
     */
    public function refunded(): static
    {
        $acceptedAt = now()->subDays(rand(7, 14));
        $completedAt = $acceptedAt->copy()->addDays(rand(1, 7));

        return $this->state(fn (array $attributes) => [
            'status' => 'refunded',
            'accepted_at' => $acceptedAt,
            'completed_at' => $completedAt,
        ]);
    }

    /**
     * Indicate that the order belongs to a specific user.
     */
    public function forUser(User $user): static
    {
        return $this->state(fn (array $attributes) => [
            'user_id' => $user->id,
        ]);
    }

    /**
     * Indicate that the order is for a specific voice.
     */
    public function forVoice(Voice $voice): static
    {
        return $this->state(fn (array $attributes) => [
            'voice_id' => $voice->id,
        ]);
    }
}
