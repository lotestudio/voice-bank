<?php

namespace App\Http\Controllers\Profile;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;

class OrdersController extends Controller
{
    public function index()
    {
        return Inertia::render('Profile/Orders');
    }


    public function create()
    {
        return Inertia::render('Orders/Create');
    }

    public function show()
    {
        return Inertia::render('Orders/Show');
    }
}
