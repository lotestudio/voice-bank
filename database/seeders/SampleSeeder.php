<?php

namespace Database\Seeders;

use App\Models\Sample;
use App\Models\Voice;
use Illuminate\Database\Seeder;

class SampleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get all active voices
        $voices = Voice::active()->get();

        // For each voice, create 1-5 samples
        foreach ($voices as $voice) {
            $sampleCount = rand(1, 5);

            // Ensure at least one featured sample
            Sample::factory()
                ->featured()
                ->forVoice($voice)
                ->sortOrder(1)
                ->create();

            // Create additional non-featured samples
            if ($sampleCount > 1) {
                Sample::factory()
                    ->count($sampleCount - 1)
                    ->notFeatured()
                    ->forVoice($voice)
                    ->create();
            }
        }

        // Create some additional random samples
        Sample::factory()
            ->count(20)
            ->create();

        // Create some samples with specific file types to ensure we have a good distribution
        $fileTypes = ['mp3', 'wav', 'ogg', 'm4a'];
        foreach ($fileTypes as $index => $fileType) {
            Sample::factory()
                ->count(5)
                ->state(function (array $attributes) use ($fileType) {
                    return [
                        'file_type' => $fileType,
                        'file_url' => 'https://example.com/samples/' . fake()->uuid() . '.' . $fileType,
                    ];
                })
                ->create();
        }
    }
}
