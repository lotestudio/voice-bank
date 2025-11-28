<?php

namespace App\Http\Controllers\Admin;

use Inertia\Inertia;
use App\Http\Controllers\Controller;
use App\Lote\Traits\HasReturnUrl;

class DashboardController extends Controller
{
    use HasReturnUrl;
    public function __invoke()
    {
        return Inertia::render('Dashboard');
    }
}
