<?php

namespace App\Providers;

use App\Models\User;
use App\Services\VoiceFilterService;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Gate;
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

        Gate::define('administrate', function (User $user) {
            return $user->isAdmin();
        });

        Gate::define('develop', function (User $user) {
            return $user->isDev();
        });

        Gate::define('act_as_artist', function (User $user) {
            return $user->isArtist() || $user->isAdmin() || $user->isDev();
        });

        Gate::define('act_as_client', function (User $user) {
            return $user->isClient() || $user->isAdmin() || $user->isDev();
        });
    }
}
