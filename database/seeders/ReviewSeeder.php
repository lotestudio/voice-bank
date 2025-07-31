<?php

namespace Database\Seeders;

use App\Models\Review;
use App\Models\User;
use App\Models\Voice;
use Illuminate\Database\Seeder;

class ReviewSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get all client users
        $clients = User::where('role', 'client')->get();

        // Get all active voices
        $voices = Voice::active()->get();

        // For each client, create 1-5 reviews for random voices
        foreach ($clients as $client) {
            $reviewCount = rand(1, 5);
            $randomVoices = $voices->random(min($reviewCount, $voices->count()));

            foreach ($randomVoices as $voice) {
                $englishComment = fake()->paragraph();

                Review::create([
                    'user_id' => $client->id,
                    'voice_id' => $voice->id,
                    'rating' => rand(3, 5), // Most reviews are positive (3-5 stars)
                    'comment' => [
                        'en' => $englishComment,
                        'bg' => 'БГ: ' . $englishComment // Placeholder for Bulgarian translation
                    ],
                    'is_approved' => rand(0, 10) > 2, // 80% chance of being approved
                ]);
            }
        }

        // Create some additional random reviews
        Review::factory()
            ->count(20)
            ->create();

        // Create some reviews with specific ratings to ensure we have a good distribution
        foreach (range(1, 5) as $rating) {
            Review::factory()
                ->count(5)
                ->rating($rating)
                ->approved()
                ->create();
        }
    }
}
