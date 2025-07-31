<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Voice>
 */
class VoiceFactory extends Factory
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

        return [
            'user_id' => User::factory()->artist(),
            'title' => [
                'en' => $englishTitle,
                'bg' => 'БГ: ' . $englishTitle // Placeholder for Bulgarian translation
            ],
            'description' => [
                'en' => $englishDescription,
                'bg' => 'БГ: ' . $englishDescription // Placeholder for Bulgarian translation
            ],
            'is_active' => true,
        ];
    }

    /**
     * Indicate that the voice is inactive.
     */
    public function inactive(): static
    {
        return $this->state(fn (array $attributes) => [
            'is_active' => false,
        ]);
    }

    /**
     * Indicate that the voice belongs to a specific user.
     */
    public function forUser(User $user): static
    {
        return $this->state(fn (array $attributes) => [
            'user_id' => $user->id,
        ]);
    }
}
