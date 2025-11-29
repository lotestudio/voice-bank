import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../wayfinder'
/**
* @see \App\Http\Controllers\Admin\FeatureController::index
* @see app/Http/Controllers/Admin/FeatureController.php:22
* @route '/admin/feature'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/admin/feature',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\FeatureController::index
* @see app/Http/Controllers/Admin/FeatureController.php:22
* @route '/admin/feature'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureController::index
* @see app/Http/Controllers/Admin/FeatureController.php:22
* @route '/admin/feature'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\FeatureController::index
* @see app/Http/Controllers/Admin/FeatureController.php:22
* @route '/admin/feature'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\FeatureController::create
* @see app/Http/Controllers/Admin/FeatureController.php:31
* @route '/admin/feature/create'
*/
export const create = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

create.definition = {
    methods: ["get","head"],
    url: '/admin/feature/create',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\FeatureController::create
* @see app/Http/Controllers/Admin/FeatureController.php:31
* @route '/admin/feature/create'
*/
create.url = (options?: RouteQueryOptions) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureController::create
* @see app/Http/Controllers/Admin/FeatureController.php:31
* @route '/admin/feature/create'
*/
create.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\FeatureController::create
* @see app/Http/Controllers/Admin/FeatureController.php:31
* @route '/admin/feature/create'
*/
create.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: create.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\FeatureController::store
* @see app/Http/Controllers/Admin/FeatureController.php:36
* @route '/admin/feature'
*/
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/admin/feature',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Admin\FeatureController::store
* @see app/Http/Controllers/Admin/FeatureController.php:36
* @route '/admin/feature'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureController::store
* @see app/Http/Controllers/Admin/FeatureController.php:36
* @route '/admin/feature'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Admin\FeatureController::edit
* @see app/Http/Controllers/Admin/FeatureController.php:52
* @route '/admin/feature/{feature}/edit'
*/
export const edit = (args: { feature: number | { id: number } } | [feature: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ["get","head"],
    url: '/admin/feature/{feature}/edit',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\FeatureController::edit
* @see app/Http/Controllers/Admin/FeatureController.php:52
* @route '/admin/feature/{feature}/edit'
*/
edit.url = (args: { feature: number | { id: number } } | [feature: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { feature: args }
    }

    if (typeof args === 'object' && !Array.isArray(args) && 'id' in args) {
        args = { feature: args.id }
    }

    if (Array.isArray(args)) {
        args = {
            feature: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        feature: typeof args.feature === 'object'
        ? args.feature.id
        : args.feature,
    }

    return edit.definition.url
            .replace('{feature}', parsedArgs.feature.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureController::edit
* @see app/Http/Controllers/Admin/FeatureController.php:52
* @route '/admin/feature/{feature}/edit'
*/
edit.get = (args: { feature: number | { id: number } } | [feature: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\FeatureController::edit
* @see app/Http/Controllers/Admin/FeatureController.php:52
* @route '/admin/feature/{feature}/edit'
*/
edit.head = (args: { feature: number | { id: number } } | [feature: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: edit.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\FeatureController::update
* @see app/Http/Controllers/Admin/FeatureController.php:44
* @route '/admin/feature/{feature}'
*/
export const update = (args: { feature: number | { id: number } } | [feature: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/admin/feature/{feature}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\Admin\FeatureController::update
* @see app/Http/Controllers/Admin/FeatureController.php:44
* @route '/admin/feature/{feature}'
*/
update.url = (args: { feature: number | { id: number } } | [feature: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { feature: args }
    }

    if (typeof args === 'object' && !Array.isArray(args) && 'id' in args) {
        args = { feature: args.id }
    }

    if (Array.isArray(args)) {
        args = {
            feature: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        feature: typeof args.feature === 'object'
        ? args.feature.id
        : args.feature,
    }

    return update.definition.url
            .replace('{feature}', parsedArgs.feature.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureController::update
* @see app/Http/Controllers/Admin/FeatureController.php:44
* @route '/admin/feature/{feature}'
*/
update.put = (args: { feature: number | { id: number } } | [feature: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Admin\FeatureController::update
* @see app/Http/Controllers/Admin/FeatureController.php:44
* @route '/admin/feature/{feature}'
*/
update.patch = (args: { feature: number | { id: number } } | [feature: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

/**
* @see \App\Http\Controllers\Admin\FeatureController::destroy
* @see app/Http/Controllers/Admin/FeatureController.php:59
* @route '/admin/feature/{feature}'
*/
export const destroy = (args: { feature: string | number } | [feature: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

destroy.definition = {
    methods: ["delete"],
    url: '/admin/feature/{feature}',
} satisfies RouteDefinition<["delete"]>

/**
* @see \App\Http\Controllers\Admin\FeatureController::destroy
* @see app/Http/Controllers/Admin/FeatureController.php:59
* @route '/admin/feature/{feature}'
*/
destroy.url = (args: { feature: string | number } | [feature: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { feature: args }
    }

    if (Array.isArray(args)) {
        args = {
            feature: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        feature: args.feature,
    }

    return destroy.definition.url
            .replace('{feature}', parsedArgs.feature.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureController::destroy
* @see app/Http/Controllers/Admin/FeatureController.php:59
* @route '/admin/feature/{feature}'
*/
destroy.delete = (args: { feature: string | number } | [feature: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

const feature = {
    index: Object.assign(index, index),
    create: Object.assign(create, create),
    store: Object.assign(store, store),
    edit: Object.assign(edit, edit),
    update: Object.assign(update, update),
    destroy: Object.assign(destroy, destroy),
}

export default feature