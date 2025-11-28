import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../wayfinder'
/**
* @see \App\Http\Controllers\Admin\FeatureValueController::index
* @see app/Http/Controllers/Admin/FeatureValueController.php:19
* @route '/admin/feature-value'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/admin/feature-value',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::index
* @see app/Http/Controllers/Admin/FeatureValueController.php:19
* @route '/admin/feature-value'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::index
* @see app/Http/Controllers/Admin/FeatureValueController.php:19
* @route '/admin/feature-value'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::index
* @see app/Http/Controllers/Admin/FeatureValueController.php:19
* @route '/admin/feature-value'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::create
* @see app/Http/Controllers/Admin/FeatureValueController.php:30
* @route '/admin/feature-value/create'
*/
export const create = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

create.definition = {
    methods: ["get","head"],
    url: '/admin/feature-value/create',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::create
* @see app/Http/Controllers/Admin/FeatureValueController.php:30
* @route '/admin/feature-value/create'
*/
create.url = (options?: RouteQueryOptions) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::create
* @see app/Http/Controllers/Admin/FeatureValueController.php:30
* @route '/admin/feature-value/create'
*/
create.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::create
* @see app/Http/Controllers/Admin/FeatureValueController.php:30
* @route '/admin/feature-value/create'
*/
create.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: create.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::store
* @see app/Http/Controllers/Admin/FeatureValueController.php:37
* @route '/admin/feature-value'
*/
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/admin/feature-value',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::store
* @see app/Http/Controllers/Admin/FeatureValueController.php:37
* @route '/admin/feature-value'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::store
* @see app/Http/Controllers/Admin/FeatureValueController.php:37
* @route '/admin/feature-value'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::edit
* @see app/Http/Controllers/Admin/FeatureValueController.php:53
* @route '/admin/feature-value/{feature_value}/edit'
*/
export const edit = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ["get","head"],
    url: '/admin/feature-value/{feature_value}/edit',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::edit
* @see app/Http/Controllers/Admin/FeatureValueController.php:53
* @route '/admin/feature-value/{feature_value}/edit'
*/
edit.url = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { feature_value: args }
    }

    if (Array.isArray(args)) {
        args = {
            feature_value: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        feature_value: args.feature_value,
    }

    return edit.definition.url
            .replace('{feature_value}', parsedArgs.feature_value.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::edit
* @see app/Http/Controllers/Admin/FeatureValueController.php:53
* @route '/admin/feature-value/{feature_value}/edit'
*/
edit.get = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::edit
* @see app/Http/Controllers/Admin/FeatureValueController.php:53
* @route '/admin/feature-value/{feature_value}/edit'
*/
edit.head = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: edit.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::update
* @see app/Http/Controllers/Admin/FeatureValueController.php:45
* @route '/admin/feature-value/{feature_value}'
*/
export const update = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/admin/feature-value/{feature_value}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::update
* @see app/Http/Controllers/Admin/FeatureValueController.php:45
* @route '/admin/feature-value/{feature_value}'
*/
update.url = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { feature_value: args }
    }

    if (Array.isArray(args)) {
        args = {
            feature_value: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        feature_value: args.feature_value,
    }

    return update.definition.url
            .replace('{feature_value}', parsedArgs.feature_value.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::update
* @see app/Http/Controllers/Admin/FeatureValueController.php:45
* @route '/admin/feature-value/{feature_value}'
*/
update.put = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::update
* @see app/Http/Controllers/Admin/FeatureValueController.php:45
* @route '/admin/feature-value/{feature_value}'
*/
update.patch = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::destroy
* @see app/Http/Controllers/Admin/FeatureValueController.php:61
* @route '/admin/feature-value/{feature_value}'
*/
export const destroy = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

destroy.definition = {
    methods: ["delete"],
    url: '/admin/feature-value/{feature_value}',
} satisfies RouteDefinition<["delete"]>

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::destroy
* @see app/Http/Controllers/Admin/FeatureValueController.php:61
* @route '/admin/feature-value/{feature_value}'
*/
destroy.url = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { feature_value: args }
    }

    if (Array.isArray(args)) {
        args = {
            feature_value: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        feature_value: args.feature_value,
    }

    return destroy.definition.url
            .replace('{feature_value}', parsedArgs.feature_value.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\FeatureValueController::destroy
* @see app/Http/Controllers/Admin/FeatureValueController.php:61
* @route '/admin/feature-value/{feature_value}'
*/
destroy.delete = (args: { feature_value: string | number } | [feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

const featureValue = {
    index: Object.assign(index, index),
    create: Object.assign(create, create),
    store: Object.assign(store, store),
    edit: Object.assign(edit, edit),
    update: Object.assign(update, update),
    destroy: Object.assign(destroy, destroy),
}

export default featureValue