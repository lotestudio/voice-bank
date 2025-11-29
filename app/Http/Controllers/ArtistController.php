<?php

namespace App\Http\Controllers;

use App\Models\User;
use Inertia\Inertia;

class ArtistController extends Controller
{
    public function show($id)
    {
        $artist = User::with('voices')->find($id);

        return Inertia::render('Artist/Show', [
            'artist' => $artist,
        ]);
    }
}
