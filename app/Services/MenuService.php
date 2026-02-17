<?php

declare(strict_types=1);

namespace App\Services;

use Illuminate\Support\Str;
use Mcamara\LaravelLocalization\Exceptions\UnsupportedLocaleException;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class MenuService
{
    /**
     * @throws UnsupportedLocaleException
     */
    public static function get(): array
    {
        $res = [
            'home' => ['title' => __('site.home'), 'href' => LaravelLocalization::localizeUrl('/')],
            'voice' => ['title' => __('site.voices'), 'href' => LaravelLocalization::localizeUrl('/voices')],
            'about' => ['title' => __('site.about'), 'href' => LaravelLocalization::localizeUrl('/about')],
            'contacts' => ['title' => __('site.contacts'), 'href' => LaravelLocalization::localizeUrl('/contacts')],
            // 'test'=>['title'=>'Test', 'href'=>url('/dev/redirect')],
        ];

        $res['profile'] = [
            'title' => 'Login',
            'icon' => 'i-user',
            'href' => url('login'),
        ];

        if (auth()->check()) {

            $profile_children = [];

            if (auth()->user()->isArtist()) {
                $profile_children['voices'] = ['title' => Str::ucfirst(__('site.my_voices')), 'href' => LaravelLocalization::localizeUrl('/profile/voices')];
            }

            $profile_children['orders'] = ['title' => Str::title(__('site.orders')), 'href' => LaravelLocalization::localizeUrl('/profile/orders')];

            if (auth()->user()->isClient()) {
                $profile_children['reviews'] = ['title' => Str::title(__('site.reviews')), 'href' => LaravelLocalization::localizeUrl('/profile/reviews')];
                $profile_children['favorites'] = ['title' => Str::title(__('site.favorites')), 'href' => LaravelLocalization::localizeUrl('/profile/favorites')];
            }

            $profile_children['settings'] = ['title' => Str::title(__('site.settings')), 'href' => LaravelLocalization::localizeUrl('/profile/settings')];
            $profile_children['password'] = ['title' => Str::title(__('site.password')), 'href' => LaravelLocalization::localizeUrl('/profile/password')];
            $profile_children['avatar'] = ['title' => Str::title(__('site.avatar')), 'href' => LaravelLocalization::localizeUrl('/profile/avatar')];
            $profile_children['appearance'] = ['title' => Str::title(__('site.appearance')), 'href' => LaravelLocalization::localizeUrl('/profile/appearance')];


            $res['profile'] = [
                'title' => 'Profile',
                'icon' => 'i-user_check',
                'href' => LaravelLocalization::localizeUrl('/profile/settings'),
                'children' => $profile_children,
            ];


            if (auth()->user()->isImpersonated()) {
                $res['profile']['icon'] = 'i-ghost';
            }
        }

        return $res;
    }
}
