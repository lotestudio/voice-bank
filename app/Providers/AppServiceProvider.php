<?php

namespace App\Providers;

use App\Services\VoiceFilterService;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{

    use \Mcamara\LaravelLocalization\Traits\LoadsTranslatedCachedRoutes;

    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->singleton(VoiceFilterService::class, function ($app) {
            return new VoiceFilterService();
        });
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        RouteServiceProvider::loadCachedRoutesUsing(fn() => $this->loadCachedRoutes());
    }
}
