<?php

namespace App\Models;

use App\Enums\OrderStatus;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Order extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'user_id',
        'order_number',
        'title',
        'description',
        'amount',
        'currency',
        'status',
        'deadline',
        'word_count',
        'script_text',
        'notes',
        'artist_notes',
        'accepted_at',
        'completed_at',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'amount' => 'decimal:2',
        'deadline' => 'date',
        'word_count' => 'integer',
        'accepted_at' => 'datetime',
        'completed_at' => 'datetime',
        'status' => OrderStatus::class,
    ];

    /**
     * Get the user (client) that owns the order.
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Voices attached to this order.
     */
    public function voices(): BelongsToMany
    {
        return $this->belongsToMany(Voice::class, 'order_voice')
            ->withTimestamps();
    }

    /**
     * Get the artists (voice owners) for this order.
     */
    public function artists()
    {
        return $this->voices->map(fn (Voice $voice) => $voice->user)->unique('id')->values();
    }

    public function reviews(): HasMany
    {
        return $this->hasMany(Review::class);
    }

    /**
     * Scope a query to only include orders with a specific status.
     */
    public function scopeWithStatus($query, string $status)
    {
        return $query->where('status', $status);
    }

    /**
     * Scope a query to only include pending orders.
     */
    public function scopePending($query)
    {
        return $query->where('status', 'pending');
    }

    /**
     * Scope a query to only include accepted orders.
     */
    public function scopeAccepted($query)
    {
        return $query->where('status', 'accepted');
    }

    /**
     * Scope a query to only include in-progress orders.
     */
    public function scopeInProgress($query)
    {
        return $query->where('status', 'in_progress');
    }

    /**
     * Scope a query to only include completed orders.
     */
    public function scopeCompleted($query)
    {
        return $query->where('status', 'completed');
    }

    /**
     * Scope a query to only include cancelled orders.
     */
    public function scopeCancelled($query)
    {
        return $query->where('status', 'cancelled');
    }

    /**
     * Scope a query to only include refunded orders.
     */
    public function scopeRefunded($query)
    {
        return $query->where('status', 'refunded');
    }

    /**
     * Scope a query to only include active orders (pending, accepted, in_progress).
     */
    public function scopeActive($query)
    {
        return $query->whereIn('status', ['pending', 'accepted', 'in_progress']);
    }

    /**
     * Scope a query to only include inactive orders (completed, cancelled, refunded).
     */
    public function scopeInactive($query)
    {
        return $query->whereIn('status', ['completed', 'cancelled', 'refunded']);
    }

    /**
     * Check if the order is pending.
     */
    public function isPending(): bool
    {
        return $this->status === 'pending';
    }

    /**
     * Check if the order is accepted.
     */
    public function isAccepted(): bool
    {
        return $this->status === 'accepted';
    }

    /**
     * Check if the order is in progress.
     */
    public function isInProgress(): bool
    {
        return $this->status === 'in_progress';
    }

    /**
     * Check if the order is completed.
     */
    public function isCompleted(): bool
    {
        return $this->status === 'completed';
    }

    /**
     * Check if the order is cancelled.
     */
    public function isCancelled(): bool
    {
        return $this->status === 'cancelled';
    }

    /**
     * Check if the order is refunded.
     */
    public function isRefunded(): bool
    {
        return $this->status === 'refunded';
    }

    /**
     * Check if the order is active (pending, accepted, in_progress).
     */
    public function isActive(): bool
    {
        return in_array($this->status, ['pending', 'accepted', 'in_progress']);
    }

    /**
     * Check if the order is inactive (completed, cancelled, refunded).
     */
    public function isInactive(): bool
    {
        return in_array($this->status, ['completed', 'cancelled', 'refunded']);
    }

    /**
     * Generate a unique order number.
     */
    public static function generateOrderNumber(): string
    {
        $prefix = 'ORD';
        $timestamp = now()->format('YmdHis');
        $random = strtoupper(substr(md5(uniqid(mt_rand(), true)), 0, 6));

        return $prefix.'-'.$timestamp.'-'.$random;
    }

    /**
     * Get the payments for the order.
     */
    public function payments(): HasMany
    {
        return $this->hasMany(Payment::class);
    }

    /**
     * Get the latest payment for the order.
     */
    public function latestPayment()
    {
        return $this->payments()->latest()->first();
    }

    /**
     * Get the successful payment for the order.
     */
    public function successfulPayment()
    {
        return $this->payments()->completed()->latest()->first();
    }

    /**
     * Check if the order has been paid.
     */
    public function isPaid(): bool
    {
        return $this->payments()->completed()->exists();
    }

    /**
     * Check if the order has been refunded.
     */
    public function isPaymentRefunded(): bool
    {
        return $this->payments()->refunded()->exists();
    }
}
