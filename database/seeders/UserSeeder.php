<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {

        // Create dev user
        User::create([
            'name' => 'Валентин Цанев',
            'email' => 'fireball70@gmail.com',
            'password' => Hash::make('password'),
            'role' => 'dev',
        ]);

        // Create admin user
        User::create([
            'name' => 'Красимир Дяков',
            'email' => 'lote.audio.project@gmail.com',
            'password' => Hash::make('password'),
            'role' => 'admin',
        ]);

        // Create sample artists
        $artists = [
            [
                'name' => 'John Smith',
                'email' => 'john@example.com',
            ],
            [
                'name' => 'Jane Doe',
                'email' => 'jane@example.com',
            ],
            [
                'name' => 'Michael Johnson',
                'email' => 'michael@example.com',
            ],
            [
                'name' => 'Emily Wilson',
                'email' => 'emily@example.com',
            ],
            [
                'name' => 'David Brown',
                'email' => 'david@example.com',
            ],
        ];

        foreach ($artists as $artist) {
            User::create([
                'name' => $artist['name'],
                'email' => $artist['email'],
                'password' => Hash::make('password'),
                'role' => 'artist',
            ]);
        }

        // Create sample clients
        $clients = [
            [
                'name' => 'Sarah Miller',
                'email' => 'sarah@example.com',
            ],
            [
                'name' => 'Robert Davis',
                'email' => 'robert@example.com',
            ],
            [
                'name' => 'Jennifer Garcia',
                'email' => 'jennifer@example.com',
            ],
        ];

        foreach ($clients as $client) {
            User::create([
                'name' => $client['name'],
                'email' => $client['email'],
                'password' => Hash::make('password'),
                'role' => 'client',
            ]);
        }

        // Create additional random users
        User::factory()->artist()->count(5)->create();
        User::factory()->client()->count(10)->create();
    }
}
