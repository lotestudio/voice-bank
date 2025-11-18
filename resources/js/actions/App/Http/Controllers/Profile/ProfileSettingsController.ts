import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::index
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:11
* @route '/profile/profile_settings'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/profile/profile_settings',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::index
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:11
* @route '/profile/profile_settings'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::index
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:11
* @route '/profile/profile_settings'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::index
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:11
* @route '/profile/profile_settings'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::edit
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:0
* @route '/profile/profile_settings/{profile_setting}/edit'
*/
export const edit = (args: { profile_setting: string | number } | [profile_setting: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ["get","head"],
    url: '/profile/profile_settings/{profile_setting}/edit',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::edit
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:0
* @route '/profile/profile_settings/{profile_setting}/edit'
*/
edit.url = (args: { profile_setting: string | number } | [profile_setting: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { profile_setting: args }
    }

    if (Array.isArray(args)) {
        args = {
            profile_setting: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        profile_setting: args.profile_setting,
    }

    return edit.definition.url
            .replace('{profile_setting}', parsedArgs.profile_setting.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::edit
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:0
* @route '/profile/profile_settings/{profile_setting}/edit'
*/
edit.get = (args: { profile_setting: string | number } | [profile_setting: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::edit
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:0
* @route '/profile/profile_settings/{profile_setting}/edit'
*/
edit.head = (args: { profile_setting: string | number } | [profile_setting: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: edit.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::update
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:0
* @route '/profile/profile_settings/{profile_setting}'
*/
export const update = (args: { profile_setting: string | number } | [profile_setting: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/profile/profile_settings/{profile_setting}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::update
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:0
* @route '/profile/profile_settings/{profile_setting}'
*/
update.url = (args: { profile_setting: string | number } | [profile_setting: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { profile_setting: args }
    }

    if (Array.isArray(args)) {
        args = {
            profile_setting: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        profile_setting: args.profile_setting,
    }

    return update.definition.url
            .replace('{profile_setting}', parsedArgs.profile_setting.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::update
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:0
* @route '/profile/profile_settings/{profile_setting}'
*/
update.put = (args: { profile_setting: string | number } | [profile_setting: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Profile\ProfileSettingsController::update
* @see app/Http/Controllers/Profile/ProfileSettingsController.php:0
* @route '/profile/profile_settings/{profile_setting}'
*/
update.patch = (args: { profile_setting: string | number } | [profile_setting: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

const ProfileSettingsController = { index, edit, update }

export default ProfileSettingsController