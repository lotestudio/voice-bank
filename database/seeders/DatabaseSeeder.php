<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Run seeders in the correct order
        $this->call([
            FeatureSeeder::class,
            UserSeeder::class,
            VoiceSeeder::class,
            SampleSeeder::class,
            ReviewSeeder::class,
            FavoriteSeeder::class,
            OrderSeeder::class,
            PaymentSeeder::class,
        ]);
    }
}
