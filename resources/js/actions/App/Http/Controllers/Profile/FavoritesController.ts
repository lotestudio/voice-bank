import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Profile\FavoritesController::index
* @see app/Http/Controllers/Profile/FavoritesController.php:11
* @route '/profile/favorites'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/profile/favorites',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\FavoritesController::index
* @see app/Http/Controllers/Profile/FavoritesController.php:11
* @route '/profile/favorites'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\FavoritesController::index
* @see app/Http/Controllers/Profile/FavoritesController.php:11
* @route '/profile/favorites'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::index
* @see app/Http/Controllers/Profile/FavoritesController.php:11
* @route '/profile/favorites'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::create
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/create'
*/
export const create = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

create.definition = {
    methods: ["get","head"],
    url: '/profile/favorites/create',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\FavoritesController::create
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/create'
*/
create.url = (options?: RouteQueryOptions) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\FavoritesController::create
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/create'
*/
create.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::create
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/create'
*/
create.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: create.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::store
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites'
*/
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/profile/favorites',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Profile\FavoritesController::store
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\FavoritesController::store
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::show
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
export const show = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

show.definition = {
    methods: ["get","head"],
    url: '/profile/favorites/{favorite}',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\FavoritesController::show
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
show.url = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { favorite: args }
    }

    if (Array.isArray(args)) {
        args = {
            favorite: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        favorite: args.favorite,
    }

    return show.definition.url
            .replace('{favorite}', parsedArgs.favorite.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\FavoritesController::show
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
show.get = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::show
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
show.head = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: show.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::edit
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}/edit'
*/
export const edit = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ["get","head"],
    url: '/profile/favorites/{favorite}/edit',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\FavoritesController::edit
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}/edit'
*/
edit.url = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { favorite: args }
    }

    if (Array.isArray(args)) {
        args = {
            favorite: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        favorite: args.favorite,
    }

    return edit.definition.url
            .replace('{favorite}', parsedArgs.favorite.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\FavoritesController::edit
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}/edit'
*/
edit.get = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::edit
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}/edit'
*/
edit.head = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: edit.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::update
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
export const update = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/profile/favorites/{favorite}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\Profile\FavoritesController::update
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
update.url = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { favorite: args }
    }

    if (Array.isArray(args)) {
        args = {
            favorite: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        favorite: args.favorite,
    }

    return update.definition.url
            .replace('{favorite}', parsedArgs.favorite.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\FavoritesController::update
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
update.put = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::update
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
update.patch = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

/**
* @see \App\Http\Controllers\Profile\FavoritesController::destroy
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
export const destroy = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

destroy.definition = {
    methods: ["delete"],
    url: '/profile/favorites/{favorite}',
} satisfies RouteDefinition<["delete"]>

/**
* @see \App\Http\Controllers\Profile\FavoritesController::destroy
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
destroy.url = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { favorite: args }
    }

    if (Array.isArray(args)) {
        args = {
            favorite: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        favorite: args.favorite,
    }

    return destroy.definition.url
            .replace('{favorite}', parsedArgs.favorite.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\FavoritesController::destroy
* @see app/Http/Controllers/Profile/FavoritesController.php:0
* @route '/profile/favorites/{favorite}'
*/
destroy.delete = (args: { favorite: string | number } | [favorite: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

const FavoritesController = { index, create, store, show, edit, update, destroy }

export default FavoritesController