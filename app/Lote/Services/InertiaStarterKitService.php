<?php

namespace App\Lote\Services;

class InertiaStarterKitService
{
    public static function isAdminRoute(): bool
    {
        $path = request()->path();

        return str($path)->startsWith(['dashboard', 'admin']);
    }
}
