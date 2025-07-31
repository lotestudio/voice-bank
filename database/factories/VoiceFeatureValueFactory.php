<?php

namespace Database\Factories;

use App\Models\FeatureValue;
use App\Models\Voice;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\VoiceFeatureValue>
 */
class VoiceFeatureValueFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'voice_id' => Voice::factory(),
            'feature_value_id' => FeatureValue::factory(),
        ];
    }

    /**
     * Indicate that the voice feature value belongs to a specific voice.
     */
    public function forVoice(Voice $voice): static
    {
        return $this->state(fn (array $attributes) => [
            'voice_id' => $voice->id,
        ]);
    }

    /**
     * Indicate that the voice feature value has a specific feature value.
     */
    public function withFeatureValue(FeatureValue $featureValue): static
    {
        return $this->state(fn (array $attributes) => [
            'feature_value_id' => $featureValue->id,
        ]);
    }
}
