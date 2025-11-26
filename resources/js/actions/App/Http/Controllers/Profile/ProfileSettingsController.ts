import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::settings
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:11
* @route '/profile/settings'
*/
export const settings = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: settings.url(options),
    method: 'get',
})

settings.definition = {
    methods: ["get","head"],
    url: '/profile/settings',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::settings
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:11
* @route '/profile/settings'
*/
settings.url = (options?: RouteQueryOptions) => {
    return settings.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::settings
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:11
* @route '/profile/settings'
*/
settings.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: settings.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::settings
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:11
* @route '/profile/settings'
*/
settings.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: settings.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::password
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:20
* @route '/profile/password'
*/
export const password = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: password.url(options),
    method: 'get',
})

password.definition = {
    methods: ["get","head"],
    url: '/profile/password',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::password
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:20
* @route '/profile/password'
*/
password.url = (options?: RouteQueryOptions) => {
    return password.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::password
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:20
* @route '/profile/password'
*/
password.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: password.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::password
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:20
* @route '/profile/password'
*/
password.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: password.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::appearance
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:29
* @route '/profile/appearance'
*/
export const appearance = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: appearance.url(options),
    method: 'get',
})

appearance.definition = {
    methods: ["get","head"],
    url: '/profile/appearance',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::appearance
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:29
* @route '/profile/appearance'
*/
appearance.url = (options?: RouteQueryOptions) => {
    return appearance.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::appearance
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:29
* @route '/profile/appearance'
*/
appearance.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: appearance.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::appearance
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:29
* @route '/profile/appearance'
*/
appearance.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: appearance.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::avatar
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:38
* @route '/profile/avatar'
*/
export const avatar = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: avatar.url(options),
    method: 'get',
})

avatar.definition = {
    methods: ["get","head"],
    url: '/profile/avatar',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::avatar
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:38
* @route '/profile/avatar'
*/
avatar.url = (options?: RouteQueryOptions) => {
    return avatar.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::avatar
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:38
* @route '/profile/avatar'
*/
avatar.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: avatar.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::avatar
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:38
* @route '/profile/avatar'
*/
avatar.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: avatar.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::my_voices
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:47
* @route '/profile/voices'
*/
export const my_voices = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: my_voices.url(options),
    method: 'get',
})

my_voices.definition = {
    methods: ["get","head"],
    url: '/profile/voices',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::my_voices
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:47
* @route '/profile/voices'
*/
my_voices.url = (options?: RouteQueryOptions) => {
    return my_voices.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::my_voices
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:47
* @route '/profile/voices'
*/
my_voices.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: my_voices.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::my_voices
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:47
* @route '/profile/voices'
*/
my_voices.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: my_voices.url(options),
    method: 'head',
})

const ProfileSettingsController = { settings, password, appearance, avatar, my_voices }

export default ProfileSettingsController