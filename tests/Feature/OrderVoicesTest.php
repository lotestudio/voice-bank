<?php

use App\Models\Order;
use App\Models\User;
use App\Models\Voice;

it('allows attaching multiple voices to an order via pivot', function (): void {
    $client = User::factory()->client()->create();
    $voiceA = Voice::factory()->create();
    $voiceB = Voice::factory()->create();

    /** @var Order $order */
    $order = Order::factory()->forUser($client)->create();

    $order->voices()->sync([$voiceA->id, $voiceB->id]);

    expect($order->voices)->toHaveCount(2)
        ->and($order->voices->pluck('id')->sort()->values()->all())
        ->toEqual([$voiceA->id, $voiceB->id]);
});

it('aggregates artists from attached voices', function (): void {
    $artist1 = User::factory()->artist()->create();
    $artist2 = User::factory()->artist()->create();

    $voiceA = Voice::factory()->create(['user_id' => $artist1->id]);
    $voiceB = Voice::factory()->create(['user_id' => $artist2->id]);

    $order = Order::factory()->create();
    $order->voices()->sync([$voiceA->id, $voiceB->id]);

    $artists = $order->artists();

    expect($artists)->toHaveCount(2)
        ->and($artists->pluck('id')->sort()->values()->all())
        ->toEqual([$artist1->id, $artist2->id])
        ->and($order->artist()?->id)->toBeIn([$artist1->id, $artist2->id]);
});

it('lets artists retrieve received orders via voices', function (): void {
    $artist = User::factory()->artist()->create();
    $otherArtist = User::factory()->artist()->create();

    $voiceA = Voice::factory()->create(['user_id' => $artist->id]);
    $voiceB = Voice::factory()->create(['user_id' => $otherArtist->id]);

    $order1 = Order::factory()->create();
    $order2 = Order::factory()->create();

    $order1->voices()->sync([$voiceA->id]);
    $order2->voices()->sync([$voiceB->id]);

    $received = $artist->receivedOrders()->pluck('id')->all();

    expect($received)->toContain($order1->id)
        ->and($received)->not->toContain($order2->id);
});
