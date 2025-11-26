import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../wayfinder'
/**
* @see \App\Http\Controllers\SampleDownloaderController::__invoke
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
export const download = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: download.url(args, options),
    method: 'get',
})

download.definition = {
    methods: ["get","head"],
    url: '/sample/download/{id}',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\SampleDownloaderController::__invoke
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
download.url = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions) => {
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

    return download.definition.url
            .replace('{id}', parsedArgs.id.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\SampleDownloaderController::__invoke
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
download.get = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: download.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\SampleDownloaderController::__invoke
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
download.head = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: download.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\SampleController::index
* @see app/Http/Controllers/Admin/SampleController.php:23
* @route '/admin/sample'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/admin/sample',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\SampleController::index
* @see app/Http/Controllers/Admin/SampleController.php:23
* @route '/admin/sample'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\SampleController::index
* @see app/Http/Controllers/Admin/SampleController.php:23
* @route '/admin/sample'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\SampleController::index
* @see app/Http/Controllers/Admin/SampleController.php:23
* @route '/admin/sample'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\SampleController::create
* @see app/Http/Controllers/Admin/SampleController.php:35
* @route '/admin/sample/create'
*/
export const create = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

create.definition = {
    methods: ["get","head"],
    url: '/admin/sample/create',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\SampleController::create
* @see app/Http/Controllers/Admin/SampleController.php:35
* @route '/admin/sample/create'
*/
create.url = (options?: RouteQueryOptions) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\SampleController::create
* @see app/Http/Controllers/Admin/SampleController.php:35
* @route '/admin/sample/create'
*/
create.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\SampleController::create
* @see app/Http/Controllers/Admin/SampleController.php:35
* @route '/admin/sample/create'
*/
create.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: create.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\SampleController::store
* @see app/Http/Controllers/Admin/SampleController.php:42
* @route '/admin/sample'
*/
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/admin/sample',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Admin\SampleController::store
* @see app/Http/Controllers/Admin/SampleController.php:42
* @route '/admin/sample'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\SampleController::store
* @see app/Http/Controllers/Admin/SampleController.php:42
* @route '/admin/sample'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Admin\SampleController::edit
* @see app/Http/Controllers/Admin/SampleController.php:63
* @route '/admin/sample/{sample}/edit'
*/
export const edit = (args: { sample: number | { id: number } } | [sample: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ["get","head"],
    url: '/admin/sample/{sample}/edit',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\SampleController::edit
* @see app/Http/Controllers/Admin/SampleController.php:63
* @route '/admin/sample/{sample}/edit'
*/
edit.url = (args: { sample: number | { id: number } } | [sample: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { sample: args }
    }

    if (typeof args === 'object' && !Array.isArray(args) && 'id' in args) {
        args = { sample: args.id }
    }

    if (Array.isArray(args)) {
        args = {
            sample: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        sample: typeof args.sample === 'object'
        ? args.sample.id
        : args.sample,
    }

    return edit.definition.url
            .replace('{sample}', parsedArgs.sample.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\SampleController::edit
* @see app/Http/Controllers/Admin/SampleController.php:63
* @route '/admin/sample/{sample}/edit'
*/
edit.get = (args: { sample: number | { id: number } } | [sample: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\SampleController::edit
* @see app/Http/Controllers/Admin/SampleController.php:63
* @route '/admin/sample/{sample}/edit'
*/
edit.head = (args: { sample: number | { id: number } } | [sample: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: edit.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\SampleController::update
* @see app/Http/Controllers/Admin/SampleController.php:51
* @route '/admin/sample/{sample}'
*/
export const update = (args: { sample: number | { id: number } } | [sample: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/admin/sample/{sample}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\Admin\SampleController::update
* @see app/Http/Controllers/Admin/SampleController.php:51
* @route '/admin/sample/{sample}'
*/
update.url = (args: { sample: number | { id: number } } | [sample: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { sample: args }
    }

    if (typeof args === 'object' && !Array.isArray(args) && 'id' in args) {
        args = { sample: args.id }
    }

    if (Array.isArray(args)) {
        args = {
            sample: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        sample: typeof args.sample === 'object'
        ? args.sample.id
        : args.sample,
    }

    return update.definition.url
            .replace('{sample}', parsedArgs.sample.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\SampleController::update
* @see app/Http/Controllers/Admin/SampleController.php:51
* @route '/admin/sample/{sample}'
*/
update.put = (args: { sample: number | { id: number } } | [sample: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Admin\SampleController::update
* @see app/Http/Controllers/Admin/SampleController.php:51
* @route '/admin/sample/{sample}'
*/
update.patch = (args: { sample: number | { id: number } } | [sample: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

/**
* @see \App\Http\Controllers\Admin\SampleController::destroy
* @see app/Http/Controllers/Admin/SampleController.php:71
* @route '/admin/sample/{sample}'
*/
export const destroy = (args: { sample: string | number } | [sample: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

destroy.definition = {
    methods: ["delete"],
    url: '/admin/sample/{sample}',
} satisfies RouteDefinition<["delete"]>

/**
* @see \App\Http\Controllers\Admin\SampleController::destroy
* @see app/Http/Controllers/Admin/SampleController.php:71
* @route '/admin/sample/{sample}'
*/
destroy.url = (args: { sample: string | number } | [sample: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { sample: args }
    }

    if (Array.isArray(args)) {
        args = {
            sample: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        sample: args.sample,
    }

    return destroy.definition.url
            .replace('{sample}', parsedArgs.sample.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\SampleController::destroy
* @see app/Http/Controllers/Admin/SampleController.php:71
* @route '/admin/sample/{sample}'
*/
destroy.delete = (args: { sample: string | number } | [sample: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

const sample = {
    download: Object.assign(download, download),
    index: Object.assign(index, index),
    create: Object.assign(create, create),
    store: Object.assign(store, store),
    edit: Object.assign(edit, edit),
    update: Object.assign(update, update),
    destroy: Object.assign(destroy, destroy),
}

export default sample