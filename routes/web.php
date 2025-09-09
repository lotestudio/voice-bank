<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;



Route::group(['prefix' => LaravelLocalization::setLocale()], function () {
    Route::get('/', [\App\Http\Controllers\MainController::class, 'index'])->name('home');
    Route::get('/voices', [\App\Http\Controllers\VoicesController::class, 'index']);
    Route::get('/about', [\App\Http\Controllers\MainController::class, 'about']);
    Route::get('/contacts', [\App\Http\Controllers\MainController::class, 'contacts']);
});

Route::get('sample/download/{id}',\App\Http\Controllers\SampleDownloaderController::class)->name('sample.download');

Route::group(['middleware'=>['auth'],'prefix' => 'admin'], function () {
    Route::resource('voice', \App\Http\Controllers\Lap\VoicesController::class )
        ->except('show')
        ->names('voice');
    Route::resource('post', \App\Http\Controllers\Lap\PostsController::class )
        ->except('show')
        ->names('post');

    Route::get('dashboard', function () {
        return Inertia::render('admin/Dashboard');
    })->name('dashboard');

});


Route::get('template', \App\Http\Controllers\Admin\TemplateController::class)
    ->middleware(['auth', 'verified'])->name('template');

require __DIR__.'/settings.php';
require __DIR__.'/auth.php';
