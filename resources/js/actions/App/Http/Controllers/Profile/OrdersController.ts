import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Profile\OrdersController::index
* @see app/Http/Controllers/Profile/OrdersController.php:18
* @route '/profile/orders'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/profile/orders',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\OrdersController::index
* @see app/Http/Controllers/Profile/OrdersController.php:18
* @route '/profile/orders'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\OrdersController::index
* @see app/Http/Controllers/Profile/OrdersController.php:18
* @route '/profile/orders'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\OrdersController::index
* @see app/Http/Controllers/Profile/OrdersController.php:18
* @route '/profile/orders'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\OrdersController::show
* @see app/Http/Controllers/Profile/OrdersController.php:63
* @route '/profile/orders/{id}'
*/
export const show = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

show.definition = {
    methods: ["get","head"],
    url: '/profile/orders/{id}',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\OrdersController::show
* @see app/Http/Controllers/Profile/OrdersController.php:63
* @route '/profile/orders/{id}'
*/
show.url = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { id: args }
    }

    if (Array.isArray(args)) {
        args = {
            id: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        id: args.id,
    }

    return show.definition.url
            .replace('{id}', parsedArgs.id.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\OrdersController::show
* @see app/Http/Controllers/Profile/OrdersController.php:63
* @route '/profile/orders/{id}'
*/
show.get = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\OrdersController::show
* @see app/Http/Controllers/Profile/OrdersController.php:63
* @route '/profile/orders/{id}'
*/
show.head = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: show.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\OrdersController::create
* @see app/Http/Controllers/Profile/OrdersController.php:33
* @route '/orders/create'
*/
export const create = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

create.definition = {
    methods: ["get","head"],
    url: '/orders/create',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\OrdersController::create
* @see app/Http/Controllers/Profile/OrdersController.php:33
* @route '/orders/create'
*/
create.url = (options?: RouteQueryOptions) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\OrdersController::create
* @see app/Http/Controllers/Profile/OrdersController.php:33
* @route '/orders/create'
*/
create.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\OrdersController::create
* @see app/Http/Controllers/Profile/OrdersController.php:33
* @route '/orders/create'
*/
create.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: create.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\OrdersController::store
* @see app/Http/Controllers/Profile/OrdersController.php:76
* @route '/orders'
*/
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/orders',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Profile\OrdersController::store
* @see app/Http/Controllers/Profile/OrdersController.php:76
* @route '/orders'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\OrdersController::store
* @see app/Http/Controllers/Profile/OrdersController.php:76
* @route '/orders'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Profile\OrdersController::update
* @see app/Http/Controllers/Profile/OrdersController.php:0
* @route '/orders/{order}'
*/
export const update = (args: { order: string | number } | [order: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/orders/{order}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\Profile\OrdersController::update
* @see app/Http/Controllers/Profile/OrdersController.php:0
* @route '/orders/{order}'
*/
update.url = (args: { order: string | number } | [order: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { order: args }
    }

    if (Array.isArray(args)) {
        args = {
            order: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        order: args.order,
    }

    return update.definition.url
            .replace('{order}', parsedArgs.order.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\OrdersController::update
* @see app/Http/Controllers/Profile/OrdersController.php:0
* @route '/orders/{order}'
*/
update.put = (args: { order: string | number } | [order: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Profile\OrdersController::update
* @see app/Http/Controllers/Profile/OrdersController.php:0
* @route '/orders/{order}'
*/
update.patch = (args: { order: string | number } | [order: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

const OrdersController = { index, show, create, store, update }

export default OrdersController