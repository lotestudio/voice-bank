<?php

declare(strict_types=1);

namespace App\Enums;

use App\Http\Resources\UserOrderResource;
use App\Lote\Traits\HasEnumUtilities;
use App\Models\Order;

enum OrderStatus: string
{
    use HasEnumUtilities;

    case PENDING = 'pending';

    case ACCEPTED = 'accepted';

    case IN_PROGRESS = 'in_progress';

    case COMPLETED = 'completed';

    case CANCELLED = 'cancelled';

    case REFUNDED = 'refunded';

    public function label(Order|UserOrderResource|null $order = null): string
    {
        $status_label = match ($this) {
            self::PENDING => __('site.pending'),
            self::ACCEPTED => __('site.accepted'),
            self::IN_PROGRESS => __('site.in_progress'),
            self::COMPLETED => __('site.completed'),
            self::CANCELLED => __('site.cancelled'),
            self::REFUNDED => __('site.refunded'),
        };

        if (! is_null($order)) {
            return $status_label.' '.$this->useDate($order);
        }

        return $status_label;
    }

    private function useDate(Order|UserOrderResource $order): string
    {

        return match ($this) {
            self::PENDING => __('site.since').' '.$order->created_at?->format('d-m-Y') ?? 'N/A',
            self::ACCEPTED => __('site.on').' '.$order->accepted_at?->format('d-m-Y') ?? 'N/A',
            self::IN_PROGRESS => __('site.since').' '.$order->accepted_at?->format('d-m-Y') ?? 'N/A',
            self::COMPLETED => __('site.on').' '.$order->completed_at?->format('d-m-Y') ?? 'N/A',
            self::CANCELLED => __('site.on').' '.$order->completed_at?->format('d-m-Y') ?? 'N/A',
            self::REFUNDED => __('site.on').' '.$order->completed_at?->format('d-m-Y') ?? 'N/A',
        };
    }


    public static function getUpdateOrderStatusDates(string $status, Order $order): array
    {

        return match ($status) {
            'pending' =>['status'=>$status, 'accepted_at'=>null, 'completed_at'=>null],
            'accepted' =>['status'=>$status, 'accepted_at'=>$order->accepted_at ?? now(), 'completed_at'=>null],
            'completed', 'cancelled', 'refunded' =>['status'=>$status, 'completed_at'=>now()],
            default =>[]
        };
    }
}
