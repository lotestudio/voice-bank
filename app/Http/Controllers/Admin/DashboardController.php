<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Lote\Traits\HasReturnUrl;
use Inertia\Inertia;

class DashboardController extends Controller
{
    use HasReturnUrl;

    public function __invoke()
    {
        return Inertia::render('Dashboard');
    }
}
