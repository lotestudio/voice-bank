<?php


use Inertia\Inertia;

Route::group(['middleware'=>['auth','can:administrate'],'prefix' => 'admin'], function () {
    Route::resource('voice', \App\Http\Controllers\Admin\VoiceController::class )
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

    Route::post('voice-feature-value/store', [\App\Http\Controllers\Admin\VoiceFeatureValueController::class, 'store'])->name('voice-feature-value.store');
    Route::post('voice-feature-value/update', [\App\Http\Controllers\Admin\VoiceFeatureValueController::class, 'update'])->name('voice-feature-value.update');

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


    Route::resource('sort', \App\Http\Controllers\Admin\SortController::class )
        ->only('index','store')
        ->names('sort');

    Route::get('dashboard', function () {
        return Inertia::render('admin/Dashboard');
    })->name('dashboard');

});
