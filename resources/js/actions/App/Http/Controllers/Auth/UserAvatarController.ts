import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Auth\UserAvatarController::__invoke
* @see app/Http/Controllers/Auth/UserAvatarController.php:11
* @route '/avatar_upload'
*/
const UserAvatarController = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: UserAvatarController.url(options),
    method: 'post',
})

UserAvatarController.definition = {
    methods: ["post"],
    url: '/avatar_upload',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Auth\UserAvatarController::__invoke
* @see app/Http/Controllers/Auth/UserAvatarController.php:11
* @route '/avatar_upload'
*/
UserAvatarController.url = (options?: RouteQueryOptions) => {
    return UserAvatarController.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Auth\UserAvatarController::__invoke
* @see app/Http/Controllers/Auth/UserAvatarController.php:11
* @route '/avatar_upload'
*/
UserAvatarController.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: UserAvatarController.url(options),
    method: 'post',
})

export default UserAvatarController