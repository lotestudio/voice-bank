<?php

namespace App\Services;

use Mcamara\LaravelLocalization\Exceptions\UnsupportedLocaleException;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class MenuService
{


    /**
     * @throws UnsupportedLocaleException
     */
    public static function get():array
    {
        $res = [
            'home'=>['title'=>__('site.home'), 'href'=>LaravelLocalization::localizeUrl('/')],
            'voice'=>['title'=>__('site.voices'), 'href'=>LaravelLocalization::localizeUrl('/voices')],
            'about'=>['title'=>__('site.about'), 'href'=>LaravelLocalization::localizeUrl('/about')],
            'contacts'=>['title'=>__('site.contacts'), 'href'=>LaravelLocalization::localizeUrl('/contacts')],
        ];


        if(auth()->check()){
            $res['profile'] = [
                    'title'=>'Profile',
                    'icon'=>'i-user',
                    'href'=>LaravelLocalization::localizeUrl('/profile/profile_settings'),
                    'children'=>[
                        'settings'=>['title'=>__('site.Settings'), 'href'=>LaravelLocalization::localizeUrl('/profile/profile_settings'),],
                        'orders'=>['title'=>__('site.Orders'), 'href'=>LaravelLocalization::localizeUrl('/profile/orders'),],
                        'reviews'=>['title'=>__('site.Reviews'), 'href'=>LaravelLocalization::localizeUrl('/profile/reviews'),],
                        'favorites'=>['title'=>__('site.Favorites'), 'href'=>LaravelLocalization::localizeUrl('/profile/favorites'),],
                    ]
                ];
        }

        return $res;
    }
}
