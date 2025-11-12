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
    }
}
