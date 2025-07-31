<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;



Route::group(['prefix' => LaravelLocalization::setLocale()], function () {
    Route::get('/', [\App\Http\Controllers\MainController::class, 'index'])->name('home');
    Route::get('/voices', [\App\Http\Controllers\MainController::class, 'voices']);
    Route::get('/about', [\App\Http\Controllers\MainController::class, 'about']);
    Route::get('/contacts', [\App\Http\Controllers\MainController::class, 'contacts']);
});

Route::get('dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

require __DIR__.'/settings.php';
require __DIR__.'/auth.php';
