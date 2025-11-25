<?php

namespace App\Enums;

use App\Lote\Traits\HasEnumUtilities;

enum Roles: string
{
    use HasEnumUtilities;

    case DEV= 'dev';
    case ADMIN = 'admin';
    case ARTIST = 'artist';
    case CLIENT = 'client';

    public function label(): string
    {
        return match ($this) {
            self::DEV => __('site.dev'),
            self::ADMIN => __('site.admin'),
            self::ARTIST=> __('site.artist'),
            self::CLIENT => __('site.client'),
        };
    }
}
