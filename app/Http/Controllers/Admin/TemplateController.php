<?php

namespace App\Http\Controllers\Admin;

use Inertia\Inertia;
use App\Http\Controllers\Controller;

class TemplateController extends Controller
{
    public function __invoke()
    {
        return Inertia::render('dev/Template');
    }
}
