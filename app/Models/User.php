<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'role',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    /**
     * Get the voices for the user.
     */
    public function voices(): User|HasMany
    {
        return $this->hasMany(Voice::class);
    }

    /**
     * Check if the user is an artist.
     */
    public function isArtist(): bool
    {
        return $this->role === 'artist';
    }

    /**
     * Check if the user is a client.
     */
    public function isClient(): bool
    {
        return $this->role === 'client';
    }

    /**
     * Check if the user is an admin.
     */
    public function isAdmin(): bool
    {
        return $this->role === 'admin' || $this->role === 'dev';
    }

    /**
     * Check if the user is a developer.
     */
    public function isDev(): bool
    {
        return $this->role === 'dev';
    }

    /**
     * Get the reviews that the user has written.
     */
    public function reviews(): HasMany
    {
        return $this->hasMany(Review::class);
    }

    /**
     * Get the favorites that the user has created.
     */
    public function favorites(): HasMany
    {
        return $this->hasMany(Favorite::class);
    }

    /**
     * Get the voices that the user has favorited.
     */
    public function favoritedVoices()
    {
        return $this->belongsToMany(Voice::class, 'favorites', 'user_id', 'voice_id')
            ->withTimestamps();
    }

    /**
     * Check if the user has favorited a specific voice.
     */
    public function hasFavorited(Voice $voice): bool
    {
        return $this->favorites()->where('voice_id', $voice->id)->exists();
    }

    /**
     * Get the orders that the user has placed.
     */
    public function orders(): HasMany
    {
        return $this->hasMany(Order::class);
    }

    /**
     * Get the active orders for the user.
     */
    public function activeOrders()
    {
        return $this->orders()->active();
    }

    /**
     * Get the completed orders for the user.
     */
    public function completedOrders()
    {
        return $this->orders()->completed();
    }

    /**
     * Get the total number of orders for the user.
     */
    public function getOrdersCountAttribute(): int
    {
        return $this->orders()->count();
    }

    /**
     * Get the total spent by the user.
     */
    public function getTotalSpentAttribute(): float
    {
        return $this->orders()->completed()->sum('amount');
    }

    /**
     * Get the orders for the user's voices (for artists).
     */
    public function receivedOrders()
    {
        if (!$this->isArtist()) {
            return collect();
        }

        return Order::whereIn('voice_id', $this->voices()->pluck('id'));
    }

    /**
     * Get the active orders for the user's voices (for artists).
     */
    public function activeReceivedOrders()
    {
        return $this->receivedOrders()->active();
    }

    /**
     * Get the completed orders for the user's voices (for artists).
     */
    public function completedReceivedOrders()
    {
        return $this->receivedOrders()->completed();
    }

    /**
     * Get the total earnings for the user (for artists).
     */
    public function getTotalEarningsAttribute(): float
    {
        if (!$this->isArtist()) {
            return 0;
        }

        return $this->receivedOrders()->completed()->sum('amount');
    }

    public function getInitialsAttribute():string
    {
        $words = explode(' ', $this->name);

        if (count($words) >= 2) {
            return strtoupper(substr($words[0], 0, 1).substr($words[1], 0, 1));
        }

        return strtoupper(substr($this->name, 0, 2));
    }
}
