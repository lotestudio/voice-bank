<?php

namespace App\Enums;

use App\Lote\Traits\HasEnumUtilities;

enum ArtistStatus: string
{
    use HasEnumUtilities;

    case AVAILABLE = 'available';
    case LIMITED = 'limited';
    case BUSY = 'busy';
    case VACATION = 'vacation';

    public function label(): string
    {
        return match ($this) {
            self::AVAILABLE => __('site.Available'),
            self::LIMITED => __('site.Limited'),
            self::BUSY => __('site.Busy'),
            self::VACATION => __('site.Vacation'),
        };
    }
}
