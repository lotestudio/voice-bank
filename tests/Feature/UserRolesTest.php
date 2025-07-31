<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class UserRolesTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function it_can_create_users_with_different_roles()
    {
        // Create users with different roles
        $artist = User::factory()->artist()->create();
        $client = User::factory()->client()->create();
        $admin = User::factory()->admin()->create();
        $dev = User::factory()->dev()->create();

        // Check if the roles are set correctly
        $this->assertEquals('artist', $artist->role);
        $this->assertEquals('client', $client->role);
        $this->assertEquals('admin', $admin->role);
        $this->assertEquals('dev', $dev->role);

        // Check if the role methods work correctly
        $this->assertTrue($artist->isArtist());
        $this->assertFalse($artist->isClient());
        $this->assertFalse($artist->isAdmin());
        $this->assertFalse($artist->isDev());

        $this->assertFalse($client->isArtist());
        $this->assertTrue($client->isClient());
        $this->assertFalse($client->isAdmin());
        $this->assertFalse($client->isDev());

        $this->assertFalse($admin->isArtist());
        $this->assertFalse($admin->isClient());
        $this->assertTrue($admin->isAdmin());
        $this->assertFalse($admin->isDev());

        $this->assertFalse($dev->isArtist());
        $this->assertFalse($dev->isClient());
        $this->assertFalse($dev->isAdmin());
        $this->assertTrue($dev->isDev());
    }
}
