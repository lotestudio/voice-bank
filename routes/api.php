<?php

use App\Http\Controllers\UI\FileUploadController;

// filepond upload
Route::middleware('auth:sanctum')->prefix('uploads')->group(function () {
    Route::post('process', [FileUploadController::class, 'process']);
    Route::post('remove', [FileUploadController::class, 'remove']);
});
