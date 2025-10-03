<?php

use Illuminate\Support\Facades\Route;
use Inertia\Inertia;



Route::group(['prefix' => LaravelLocalization::setLocale()], function () {
    Route::get('/', [\App\Http\Controllers\MainController::class, 'index'])->name('home');
    Route::get('/voices', [\App\Http\Controllers\VoicesController::class, 'index']);
    Route::get('/about', [\App\Http\Controllers\MainController::class, 'about']);
    Route::get('/contacts', [\App\Http\Controllers\MainController::class, 'contacts']);
});

Route::post('/send',[\App\Http\Controllers\MainController::class,'send']);
Route::get('sample/download/{id}',\App\Http\Controllers\SampleDownloaderController::class)->name('sample.download');

Route::group(['middleware'=>['auth'],'prefix' => 'admin'], function () {
    Route::resource('voice', \App\Http\Controllers\Admin\VoiceController::class )
        ->except('show')
        ->names('voice');

    Route::resource('user', \App\Http\Controllers\Admin\UserController::class )
        ->except('show')
        ->names('user');

    Route::resource('feature', \App\Http\Controllers\Admin\FeatureController::class )
        ->except('show')
        ->names('feature');


    Route::resource('feature-value', \App\Http\Controllers\Admin\FeatureValueController::class )
        ->except('show')
        ->names('feature-value');

    Route::resource('sample', \App\Http\Controllers\Admin\SampleController::class )
        ->except('show')
        ->names('sample');

    Route::resource('review', \App\Http\Controllers\Admin\ReviewController::class )
        ->except('show')
        ->names('review');

    Route::resource('order', \App\Http\Controllers\Admin\OrderController::class )
        ->except('show')
        ->names('order');

    Route::resource('payment', \App\Http\Controllers\Admin\PaymentController::class )
        ->except('show')
        ->names('payment');

    Route::resource('post', \App\Http\Controllers\Admin\PostController::class )
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
