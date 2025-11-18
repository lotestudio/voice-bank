<?php

use App\Http\Controllers\Profile\FavoritesController;
use App\Http\Controllers\Profile\OrdersController;
use App\Http\Controllers\Profile\ProfileSettingsController;
use App\Http\Controllers\Profile\ReviewsController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;


Route::group([
    'prefix' => LaravelLocalization::setLocale(),
    'middleware' => [
        'localeSessionRedirect',
        'localizationRedirect',
        'localeViewPath',
    ],
], function () {
    Route::get('/', [\App\Http\Controllers\MainController::class, 'index'])->name('home');
    Route::get('/voices', [\App\Http\Controllers\VoicesController::class, 'index']);
    Route::get('/about', [\App\Http\Controllers\MainController::class, 'about']);
    Route::get('/contacts', [\App\Http\Controllers\MainController::class, 'contacts']);
    Route::get('/artist/{id}', [\App\Http\Controllers\ArtistController::class, 'show']);


    //settings + avatar
    Route::resource('profile/profile_settings',ProfileSettingsController::class)
        ->only(['index','edit','update'])
        ->names('profile_settings')
        ->middleware('auth');
    //orders
    Route::get('profile/orders',[OrdersController::class,'index'])->name('orders.index')->middleware('auth');;
    Route::get('profile/orders/{order}',[OrdersController::class,'show'])->name('orders.show')->middleware('auth');;
    Route::resource('orders',OrdersController::class)->only(['create','store','update'])->middleware(['auth','can:act_as_client']);

    //reviews
    Route::resource('profile/reviews',ReviewsController::class)->middleware('auth');;
    //favorites
    Route::resource('profile/favorites',FavoritesController::class)->middleware('auth');;

});

Route::post('/send',[\App\Http\Controllers\MainController::class,'send']);
Route::get('sample/download/{id}',\App\Http\Controllers\SampleDownloaderController::class)->name('sample.download');




require __DIR__.'/admin.php';
require __DIR__.'/dev.php';
require __DIR__.'/settings.php';
require __DIR__.'/auth.php';
