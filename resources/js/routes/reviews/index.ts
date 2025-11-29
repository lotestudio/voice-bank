import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../wayfinder'
/**
* @see \App\Http\Controllers\Profile\ReviewsController::index
* @see app/Http/Controllers/Profile/ReviewsController.php:14
* @route '/profile/reviews'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/profile/reviews',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ReviewsController::index
* @see app/Http/Controllers/Profile/ReviewsController.php:14
* @route '/profile/reviews'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ReviewsController::index
* @see app/Http/Controllers/Profile/ReviewsController.php:14
* @route '/profile/reviews'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::index
* @see app/Http/Controllers/Profile/ReviewsController.php:14
* @route '/profile/reviews'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::create
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/create'
*/
export const create = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

create.definition = {
    methods: ["get","head"],
    url: '/profile/reviews/create',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ReviewsController::create
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/create'
*/
create.url = (options?: RouteQueryOptions) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ReviewsController::create
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/create'
*/
create.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::create
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/create'
*/
create.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: create.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::store
* @see app/Http/Controllers/Profile/ReviewsController.php:19
* @route '/profile/reviews'
*/
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/profile/reviews',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Profile\ReviewsController::store
* @see app/Http/Controllers/Profile/ReviewsController.php:19
* @route '/profile/reviews'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ReviewsController::store
* @see app/Http/Controllers/Profile/ReviewsController.php:19
* @route '/profile/reviews'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::update
* @see app/Http/Controllers/Profile/ReviewsController.php:29
* @route '/profile/reviews/{review}'
*/
export const update = (args: { review: number | { id: number } } | [review: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/profile/reviews/{review}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\Profile\ReviewsController::update
* @see app/Http/Controllers/Profile/ReviewsController.php:29
* @route '/profile/reviews/{review}'
*/
update.url = (args: { review: number | { id: number } } | [review: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { review: args }
    }

    if (typeof args === 'object' && !Array.isArray(args) && 'id' in args) {
        args = { review: args.id }
    }

    if (Array.isArray(args)) {
        args = {
            review: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        review: typeof args.review === 'object'
        ? args.review.id
        : args.review,
    }

    return update.definition.url
            .replace('{review}', parsedArgs.review.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ReviewsController::update
* @see app/Http/Controllers/Profile/ReviewsController.php:29
* @route '/profile/reviews/{review}'
*/
update.put = (args: { review: number | { id: number } } | [review: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::update
* @see app/Http/Controllers/Profile/ReviewsController.php:29
* @route '/profile/reviews/{review}'
*/
update.patch = (args: { review: number | { id: number } } | [review: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

const reviews = {
    index: Object.assign(index, index),
    create: Object.assign(create, create),
    store: Object.assign(store, store),
    update: Object.assign(update, update),
}

export default reviews