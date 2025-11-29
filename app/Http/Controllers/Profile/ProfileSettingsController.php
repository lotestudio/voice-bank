<?php

declare(strict_types=1);

namespace App\Http\Controllers\Profile;

use App\Http\Controllers\Controller;
use Inertia\Inertia;

class ProfileSettingsController extends Controller
{
    public function settings()
    {
        return Inertia::render('Profile/Settings', [
            'heading' => [
                'title' => __('profile.settings_title'),
                'description' => __('profile.settings_description'),
            ],
        ]);
    }

    public function password()
    {
        return Inertia::render('Profile/Password', [
            'heading' => [
                'title' => __('profile.password_title'),
                'description' => __('profile.password_description'),
            ],
        ]);
    }

    public function appearance()
    {
        return Inertia::render('Profile/Appearance', [
            'heading' => [
                'title' => __('profile.appearance_title'),
                'description' => __('profile.appearance_description'),
            ],
        ]);
    }

    public function avatar()
    {
        return Inertia::render('Profile/Avatar', [
            'heading' => [
                'title' => __('profile.avatar_title'),
                'description' => __('profile.avatar_description'),
            ],
        ]);
    }

    public function my_voices()
    {
        return Inertia::render('Profile/Voices', [
            'heading' => [
                'title' => __('profile.my_voices_title'),
                'description' => __('profile.mu_voices_description'),
            ],
        ]);
    }
}
