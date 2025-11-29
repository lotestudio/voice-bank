<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

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
            OrderSeeder::class,
            ReviewSeeder::class,
            FavoriteSeeder::class,
            PaymentSeeder::class,
        ]);

        // Load posts from SQL dump file
        $sql = file_get_contents(database_path('seeders/posts.sql'));
        DB::unprepared($sql);

    }
}
