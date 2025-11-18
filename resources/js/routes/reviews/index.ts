import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../wayfinder'
/**
* @see \App\Http\Controllers\Profile\ReviewsController::index
* @see app/Http/Controllers/Profile/ReviewsController.php:11
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
* @see app/Http/Controllers/Profile/ReviewsController.php:11
* @route '/profile/reviews'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ReviewsController::index
* @see app/Http/Controllers/Profile/ReviewsController.php:11
* @route '/profile/reviews'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::index
* @see app/Http/Controllers/Profile/ReviewsController.php:11
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
* @see app/Http/Controllers/Profile/ReviewsController.php:0
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
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ReviewsController::store
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::show
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
export const show = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

show.definition = {
    methods: ["get","head"],
    url: '/profile/reviews/{review}',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ReviewsController::show
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
show.url = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { review: args }
    }

    if (Array.isArray(args)) {
        args = {
            review: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        review: args.review,
    }

    return show.definition.url
            .replace('{review}', parsedArgs.review.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ReviewsController::show
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
show.get = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::show
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
show.head = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: show.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::edit
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}/edit'
*/
export const edit = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ["get","head"],
    url: '/profile/reviews/{review}/edit',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Profile\ReviewsController::edit
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}/edit'
*/
edit.url = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { review: args }
    }

    if (Array.isArray(args)) {
        args = {
            review: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        review: args.review,
    }

    return edit.definition.url
            .replace('{review}', parsedArgs.review.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ReviewsController::edit
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}/edit'
*/
edit.get = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::edit
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}/edit'
*/
edit.head = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: edit.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::update
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
export const update = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/profile/reviews/{review}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\Profile\ReviewsController::update
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
update.url = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { review: args }
    }

    if (Array.isArray(args)) {
        args = {
            review: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        review: args.review,
    }

    return update.definition.url
            .replace('{review}', parsedArgs.review.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ReviewsController::update
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
update.put = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::update
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
update.patch = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

/**
* @see \App\Http\Controllers\Profile\ReviewsController::destroy
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
export const destroy = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

destroy.definition = {
    methods: ["delete"],
    url: '/profile/reviews/{review}',
} satisfies RouteDefinition<["delete"]>

/**
* @see \App\Http\Controllers\Profile\ReviewsController::destroy
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
destroy.url = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { review: args }
    }

    if (Array.isArray(args)) {
        args = {
            review: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        review: args.review,
    }

    return destroy.definition.url
            .replace('{review}', parsedArgs.review.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Profile\ReviewsController::destroy
* @see app/Http/Controllers/Profile/ReviewsController.php:0
* @route '/profile/reviews/{review}'
*/
destroy.delete = (args: { review: string | number } | [review: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

const reviews = {
    index: Object.assign(index, index),
    create: Object.assign(create, create),
    store: Object.assign(store, store),
    show: Object.assign(show, show),
    edit: Object.assign(edit, edit),
    update: Object.assign(update, update),
    destroy: Object.assign(destroy, destroy),
}

export default reviews