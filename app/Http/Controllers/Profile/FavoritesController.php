<?php

namespace App\Http\Controllers\Profile;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class FavoritesController extends Controller
{
    public function index()
    {
        return Inertia::render('Profile/Favorites');
    }
}
