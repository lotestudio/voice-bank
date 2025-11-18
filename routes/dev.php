<?php


use App\Http\Controllers\Dev\DataListTestController;
use App\Http\Controllers\Dev\ServicePagesController;
use App\Http\Controllers\Dev\TemplateController;

Route::group(['middleware'=>['auth'],'prefix' => 'dev'], function () {
    Route::get('template', TemplateController::class)->name('template');
    Route::get('template/side_menu', [ServicePagesController::class,'side_menu'])->name('side-menu');
    Route::get('data-list-test', DataListTestController::class)->name('data-list-test');
});
