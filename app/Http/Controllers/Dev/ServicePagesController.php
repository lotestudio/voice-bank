<?php

namespace App\Http\Controllers\Dev;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class ServicePagesController extends Controller
{
    public function side_menu()
    {
        return Inertia::render('dev/SideMenu');
    }

}
