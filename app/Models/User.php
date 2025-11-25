<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Enums\ArtistStatus;
use App\Enums\Roles;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Collection;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasApiTokens, HasFactory, Notifiable;

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
        'avatar',
        'artist_status',
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
            'artist_status' => ArtistStatus::class,
            'role' => Roles::class,
            'avatar' => 'array',
        ];
    }

    //protected $appends = ['initials','avatar'];

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
        return $this->role->value === 'artist';
    }

    /**
     * Check if the user is a client.
     */
    public function isClient(): bool
    {
        return $this->role->value === 'client';
    }

    /**
     * Check if the user is an admin.
     */
    public function isAdmin(): bool
    {
        return $this->role->value === 'admin' || $this->role->value === 'dev';
    }

    /**
     * Check if the user is a developer.
     */
    public function isDev(): bool
    {
        return $this->role->value === 'dev';
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
        if (! $this->isArtist()) {
            return collect();
        }

        // Orders that include any of this user's voices
        return Order::whereHas('voices', function ($q) {
            $q->whereIn('voices.id', $this->voices()->pluck('id'));
        });
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

    public function getRatingAttribute(): int
    {
        if (! $this->isArtist()) {
            return 0;
        }

        $voiceIds = $this->voices()->pluck('id');

        if ($voiceIds->isEmpty()) {
            return 0;
        }

        return (int) Review::whereIn('voice_id', $voiceIds)
            ->avg('rating') ?? 0;
    }

    /**
     * Get the total earnings for the user (for artists).
     */
    public function getTotalEarningsAttribute(): float
    {
        if (! $this->isArtist()) {
            return 0;
        }

        return $this->receivedOrders()->completed()->sum('amount');
    }

    protected function Initials(): Attribute
    {
        return Attribute::make(
            get: function(){
                $words = explode(' ', $this->name);

                if (count($words) >= 2) {
                    return mb_strtoupper(mb_substr($words[0], 0, 1).mb_substr($words[1], 0, 1));
                }

                return mb_strtoupper(mb_substr($this->name, 0, 2));
            },
            set: fn($value) => $value,
        );
    }

    protected function Avatar(): Attribute
    {
        return Attribute::make(
            get: function($value, array $attributes) {

                return [
                    'url'=>$value ? url('storage/avatars/'.$value) : '',
                    'path'=>$value ? public_path('storage/avatars/'.$value) : '',
                    'file_name'=>$value,
                    'initials'=>$this->initials
                ];

            },
            set: fn($value) => $value,
        );
    }


    public static function forSelectArtists($prepend = true, $prepend_label = 'Choose artist')
    {
        return self::forSelect($prepend, $prepend_label, 'artist');
    }

    public static function forSelectClients($prepend = true, $prepend_label = 'Choose client')
    {
        return self::forSelect($prepend, $prepend_label, 'client');
    }

    public static function forSelect($prepend = true, $prepend_label = 'Choose user', $role = null): Collection
    {
        $users = self::query()->when($role, function ($query) use ($role) {
            $query->where('role', $role);
        })->orderBy('name')->get(['name', 'id'])->map(function ($user) {
            return [
                'label' => $user->name,
                'value' => $user->id,
            ];
        });

        if ($prepend) {
            $users = $users->prepend(['label' => $prepend_label, 'value' => null]);
        }

        return $users;

    }
}
