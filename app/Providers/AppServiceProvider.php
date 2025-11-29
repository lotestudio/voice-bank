<?php

declare(strict_types=1);

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
        $this->app->singleton(VoiceFilterService::class, function ($app): \App\Services\VoiceFilterService {
            return new VoiceFilterService;
        });
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        RouteServiceProvider::loadCachedRoutesUsing(fn () => $this->loadCachedRoutes());

        Gate::define('administrate', function (User $user): bool {
            return $user->isAdmin();
        });

        Gate::define('develop', function (User $user): bool {
            return $user->isDev();
        });

        Gate::define('act_as_artist', function (User $user): bool {
            if ($user->isArtist()) {
                return true;
            }

            if ($user->isAdmin()) {
                return true;
            }

            return $user->isDev();
        });

        Gate::define('act_as_client', function (User $user): bool {
            if ($user->isClient()) {
                return true;
            }

            if ($user->isAdmin()) {
                return true;
            }

            return $user->isDev();
        });
    }
}
