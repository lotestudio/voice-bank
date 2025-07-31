<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\Voice;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Favorite>
 */
class FavoriteFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory()->client(),
            'voice_id' => Voice::factory(),
        ];
    }

    /**
     * Indicate that the favorite belongs to a specific user.
     */
    public function forUser(User $user): static
    {
        return $this->state(fn (array $attributes) => [
            'user_id' => $user->id,
        ]);
    }

    /**
     * Indicate that the favorite is for a specific voice.
     */
    public function forVoice(Voice $voice): static
    {
        return $this->state(fn (array $attributes) => [
            'voice_id' => $voice->id,
        ]);
    }
}
