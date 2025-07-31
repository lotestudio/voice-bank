<?php

namespace Database\Seeders;

use App\Models\Favorite;
use App\Models\User;
use App\Models\Voice;
use Illuminate\Database\Seeder;

class FavoriteSeeder extends Seeder
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

        // For each client, favorite 1-10 random voices
        foreach ($clients as $client) {
            $favoriteCount = rand(1, 10);
            $randomVoices = $voices->random(min($favoriteCount, $voices->count()));

            foreach ($randomVoices as $voice) {
                Favorite::create([
                    'user_id' => $client->id,
                    'voice_id' => $voice->id,
                ]);
            }
        }

        // Create some additional random favorites
        Favorite::factory()
            ->count(30)
            ->create();
    }
}
