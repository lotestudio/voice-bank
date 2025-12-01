import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults, validateParameters } from './../wayfinder'
/**
* @see \App\Http\Controllers\MainController::home
* @see app/Http/Controllers/MainController.php:20
* @route '/'
*/
export const home = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: home.url(options),
    method: 'get',
})

home.definition = {
    methods: ["get","head"],
    url: '/',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\MainController::home
* @see app/Http/Controllers/MainController.php:20
* @route '/'
*/
home.url = (options?: RouteQueryOptions) => {
    return home.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\MainController::home
* @see app/Http/Controllers/MainController.php:20
* @route '/'
*/
home.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: home.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\MainController::home
* @see app/Http/Controllers/MainController.php:20
* @route '/'
*/
home.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: home.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Auth\UserAvatarController::__invoke
* @see app/Http/Controllers/Auth/UserAvatarController.php:19
* @route '/avatar_upload'
*/
export const avatar_upload = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: avatar_upload.url(options),
    method: 'post',
})

avatar_upload.definition = {
    methods: ["post"],
    url: '/avatar_upload',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Auth\UserAvatarController::__invoke
* @see app/Http/Controllers/Auth/UserAvatarController.php:19
* @route '/avatar_upload'
*/
avatar_upload.url = (options?: RouteQueryOptions) => {
    return avatar_upload.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Auth\UserAvatarController::__invoke
* @see app/Http/Controllers/Auth/UserAvatarController.php:19
* @route '/avatar_upload'
*/
avatar_upload.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: avatar_upload.url(options),
    method: 'post',
})

/**
* @see \Lab404\Impersonate\Controllers\ImpersonateController::impersonate
* @see vendor/lab404/laravel-impersonate/src/Controllers/ImpersonateController.php:32
* @route '/impersonate/take/{id}/{guardName?}'
*/
export const impersonate = (args: { id: string | number, guardName?: string | number } | [id: string | number, guardName: string | number ], options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: impersonate.url(args, options),
    method: 'get',
})

impersonate.definition = {
    methods: ["get","head"],
    url: '/impersonate/take/{id}/{guardName?}',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \Lab404\Impersonate\Controllers\ImpersonateController::impersonate
* @see vendor/lab404/laravel-impersonate/src/Controllers/ImpersonateController.php:32
* @route '/impersonate/take/{id}/{guardName?}'
*/
impersonate.url = (args: { id: string | number, guardName?: string | number } | [id: string | number, guardName: string | number ], options?: RouteQueryOptions) => {
    if (Array.isArray(args)) {
        args = {
            id: args[0],
            guardName: args[1],
        }
    }

    args = applyUrlDefaults(args)

    validateParameters(args, [
        "guardName",
    ])

    const parsedArgs = {
        id: args.id,
        guardName: args.guardName,
    }

    return impersonate.definition.url
            .replace('{id}', parsedArgs.id.toString())
            .replace('{guardName?}', parsedArgs.guardName?.toString() ?? '')
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \Lab404\Impersonate\Controllers\ImpersonateController::impersonate
* @see vendor/lab404/laravel-impersonate/src/Controllers/ImpersonateController.php:32
* @route '/impersonate/take/{id}/{guardName?}'
*/
impersonate.get = (args: { id: string | number, guardName?: string | number } | [id: string | number, guardName: string | number ], options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: impersonate.url(args, options),
    method: 'get',
})

/**
* @see \Lab404\Impersonate\Controllers\ImpersonateController::impersonate
* @see vendor/lab404/laravel-impersonate/src/Controllers/ImpersonateController.php:32
* @route '/impersonate/take/{id}/{guardName?}'
*/
impersonate.head = (args: { id: string | number, guardName?: string | number } | [id: string | number, guardName: string | number ], options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: impersonate.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\OrderStatusController::__invoke
* @see app/Http/Controllers/Admin/OrderStatusController.php:13
* @route '/admin/order_status'
*/
export const order_status = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: order_status.url(options),
    method: 'post',
})

order_status.definition = {
    methods: ["post"],
    url: '/admin/order_status',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Admin\OrderStatusController::__invoke
* @see app/Http/Controllers/Admin/OrderStatusController.php:13
* @route '/admin/order_status'
*/
order_status.url = (options?: RouteQueryOptions) => {
    return order_status.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\OrderStatusController::__invoke
* @see app/Http/Controllers/Admin/OrderStatusController.php:13
* @route '/admin/order_status'
*/
order_status.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: order_status.url(options),
    method: 'post',
})

/**
* @see routes/admin.php:51
* @route '/admin/dashboard'
*/
export const dashboard = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: dashboard.url(options),
    method: 'get',
})

dashboard.definition = {
    methods: ["get","head"],
    url: '/admin/dashboard',
} satisfies RouteDefinition<["get","head"]>

/**
* @see routes/admin.php:51
* @route '/admin/dashboard'
*/
dashboard.url = (options?: RouteQueryOptions) => {
    return dashboard.definition.url + queryParams(options)
}

/**
* @see routes/admin.php:51
* @route '/admin/dashboard'
*/
dashboard.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: dashboard.url(options),
    method: 'get',
})

/**
* @see routes/admin.php:51
* @route '/admin/dashboard'
*/
dashboard.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: dashboard.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Dev\TemplateController::__invoke
* @see app/Http/Controllers/Dev/TemplateController.php:12
* @route '/dev/template'
*/
export const template = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: template.url(options),
    method: 'get',
})

template.definition = {
    methods: ["get","head"],
    url: '/dev/template',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Dev\TemplateController::__invoke
* @see app/Http/Controllers/Dev/TemplateController.php:12
* @route '/dev/template'
*/
template.url = (options?: RouteQueryOptions) => {
    return template.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Dev\TemplateController::__invoke
* @see app/Http/Controllers/Dev/TemplateController.php:12
* @route '/dev/template'
*/
template.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: template.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Dev\TemplateController::__invoke
* @see app/Http/Controllers/Dev/TemplateController.php:12
* @route '/dev/template'
*/
template.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: template.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Dev\ServicePagesController::sideMenu
* @see app/Http/Controllers/Dev/ServicePagesController.php:12
* @route '/dev/template/side_menu'
*/
export const sideMenu = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: sideMenu.url(options),
    method: 'get',
})

sideMenu.definition = {
    methods: ["get","head"],
    url: '/dev/template/side_menu',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Dev\ServicePagesController::sideMenu
* @see app/Http/Controllers/Dev/ServicePagesController.php:12
* @route '/dev/template/side_menu'
*/
sideMenu.url = (options?: RouteQueryOptions) => {
    return sideMenu.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Dev\ServicePagesController::sideMenu
* @see app/Http/Controllers/Dev/ServicePagesController.php:12
* @route '/dev/template/side_menu'
*/
sideMenu.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: sideMenu.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Dev\ServicePagesController::sideMenu
* @see app/Http/Controllers/Dev/ServicePagesController.php:12
* @route '/dev/template/side_menu'
*/
sideMenu.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: sideMenu.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Dev\DataListTestController::__invoke
* @see app/Http/Controllers/Dev/DataListTestController.php:19
* @route '/dev/data-list-test'
*/
export const dataListTest = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: dataListTest.url(options),
    method: 'get',
})

dataListTest.definition = {
    methods: ["get","head"],
    url: '/dev/data-list-test',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Dev\DataListTestController::__invoke
* @see app/Http/Controllers/Dev/DataListTestController.php:19
* @route '/dev/data-list-test'
*/
dataListTest.url = (options?: RouteQueryOptions) => {
    return dataListTest.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Dev\DataListTestController::__invoke
* @see app/Http/Controllers/Dev/DataListTestController.php:19
* @route '/dev/data-list-test'
*/
dataListTest.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: dataListTest.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Dev\DataListTestController::__invoke
* @see app/Http/Controllers/Dev/DataListTestController.php:19
* @route '/dev/data-list-test'
*/
dataListTest.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: dataListTest.url(options),
    method: 'head',
})

/**
* @see routes/settings.php:18
* @route '/admin/settings/appearance'
*/
export const appearance = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: appearance.url(options),
    method: 'get',
})

appearance.definition = {
    methods: ["get","head"],
    url: '/admin/settings/appearance',
} satisfies RouteDefinition<["get","head"]>

/**
* @see routes/settings.php:18
* @route '/admin/settings/appearance'
*/
appearance.url = (options?: RouteQueryOptions) => {
    return appearance.definition.url + queryParams(options)
}

/**
* @see routes/settings.php:18
* @route '/admin/settings/appearance'
*/
appearance.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: appearance.url(options),
    method: 'get',
})

/**
* @see routes/settings.php:18
* @route '/admin/settings/appearance'
*/
appearance.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: appearance.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Auth\RegisteredUserController::register
* @see app/Http/Controllers/Auth/RegisteredUserController.php:23
* @route '/register'
*/
export const register = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: register.url(options),
    method: 'get',
})

register.definition = {
    methods: ["get","head"],
    url: '/register',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Auth\RegisteredUserController::register
* @see app/Http/Controllers/Auth/RegisteredUserController.php:23
* @route '/register'
*/
register.url = (options?: RouteQueryOptions) => {
    return register.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Auth\RegisteredUserController::register
* @see app/Http/Controllers/Auth/RegisteredUserController.php:23
* @route '/register'
*/
register.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: register.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Auth\RegisteredUserController::register
* @see app/Http/Controllers/Auth/RegisteredUserController.php:23
* @route '/register'
*/
register.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: register.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Auth\AuthenticatedSessionController::login
* @see app/Http/Controllers/Auth/AuthenticatedSessionController.php:21
* @route '/login'
*/
export const login = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: login.url(options),
    method: 'get',
})

login.definition = {
    methods: ["get","head"],
    url: '/login',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Auth\AuthenticatedSessionController::login
* @see app/Http/Controllers/Auth/AuthenticatedSessionController.php:21
* @route '/login'
*/
login.url = (options?: RouteQueryOptions) => {
    return login.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Auth\AuthenticatedSessionController::login
* @see app/Http/Controllers/Auth/AuthenticatedSessionController.php:21
* @route '/login'
*/
login.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: login.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Auth\AuthenticatedSessionController::login
* @see app/Http/Controllers/Auth/AuthenticatedSessionController.php:21
* @route '/login'
*/
login.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: login.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Auth\AuthenticatedSessionController::logout
* @see app/Http/Controllers/Auth/AuthenticatedSessionController.php:49
* @route '/logout'
*/
export const logout = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: logout.url(options),
    method: 'post',
})

logout.definition = {
    methods: ["post"],
    url: '/logout',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Auth\AuthenticatedSessionController::logout
* @see app/Http/Controllers/Auth/AuthenticatedSessionController.php:49
* @route '/logout'
*/
logout.url = (options?: RouteQueryOptions) => {
    return logout.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Auth\AuthenticatedSessionController::logout
* @see app/Http/Controllers/Auth/AuthenticatedSessionController.php:49
* @route '/logout'
*/
logout.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: logout.url(options),
    method: 'post',
})

