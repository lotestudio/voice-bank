<?php

namespace Database\Seeders;

use App\Models\Order;
use App\Models\User;
use App\Models\Voice;
use Illuminate\Database\Seeder;

class OrderSeeder extends Seeder
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

        // For each client, create 1-5 orders for random voices
        foreach ($clients as $client) {
            $orderCount = rand(1, 5);
            $randomVoices = $voices->random(min($orderCount, $voices->count()));

            foreach ($randomVoices as $voice) {
                // Create a completed order
                Order::factory()
                    ->completed()
                    ->forUser($client)
                    ->forVoice($voice)
                    ->create();

                // 50% chance to create an additional active order
                if (fake()->boolean(50)) {
                    $status = fake()->randomElement(['pending', 'accepted', 'in_progress']);

                    Order::factory()
                        ->state(['status' => $status])
                        ->forUser($client)
                        ->forVoice($voice)
                        ->create();
                }
            }
        }

        // Create some additional orders with specific statuses to ensure we have a good distribution
        $statuses = ['pending', 'accepted', 'in_progress', 'completed', 'cancelled', 'refunded'];
        foreach ($statuses as $status) {
            Order::factory()
                ->count(5)
                ->state(['status' => $status])
                ->create();
        }

        // Create some orders with high amounts
        Order::factory()
            ->count(3)
            ->state(['amount' => fake()->randomFloat(2, 1000, 5000)])
            ->completed()
            ->create();
    }
}
