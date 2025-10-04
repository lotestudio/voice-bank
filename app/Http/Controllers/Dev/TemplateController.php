<?php

namespace App\Http\Controllers\Dev;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class TemplateController extends Controller
{
    public function __invoke()
    {
        return Inertia::render('dev/Template');
    }
}
