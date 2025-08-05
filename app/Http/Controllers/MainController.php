<?php

namespace App\Http\Controllers;

use Inertia\Inertia;

class MainController extends Controller
{
    public function index(){
        return Inertia::render('Welcome');
    }

    public function about(){
        return Inertia::render('About');
    }
    public function contacts(){
        return Inertia::render('Contacts');
    }
}
