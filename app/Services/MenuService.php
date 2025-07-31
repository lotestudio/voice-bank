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
        return [
            ['title'=>__('site.home'), 'href'=>LaravelLocalization::localizeUrl('/'), 'isActive'=>true],
            ['title'=>__('site.voices'), 'href'=>LaravelLocalization::localizeUrl('/voices'), 'isActive'=>false],
            ['title'=>__('site.about'), 'href'=>LaravelLocalization::localizeUrl('/about'), 'isActive'=>false],
            ['title'=>__('site.contacts'), 'href'=>LaravelLocalization::localizeUrl('/contacts'), 'isActive'=>false],
        ];
    }
}
