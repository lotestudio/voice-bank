import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../wayfinder'
/**
* @see \App\Http\Controllers\Admin\VoiceController::index
* @see app/Http/Controllers/Admin/VoiceController.php:24
* @route '/admin/voice'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/admin/voice',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\VoiceController::index
* @see app/Http/Controllers/Admin/VoiceController.php:24
* @route '/admin/voice'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceController::index
* @see app/Http/Controllers/Admin/VoiceController.php:24
* @route '/admin/voice'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::index
* @see app/Http/Controllers/Admin/VoiceController.php:24
* @route '/admin/voice'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::create
* @see app/Http/Controllers/Admin/VoiceController.php:35
* @route '/admin/voice/create'
*/
export const create = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

create.definition = {
    methods: ["get","head"],
    url: '/admin/voice/create',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\VoiceController::create
* @see app/Http/Controllers/Admin/VoiceController.php:35
* @route '/admin/voice/create'
*/
create.url = (options?: RouteQueryOptions) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceController::create
* @see app/Http/Controllers/Admin/VoiceController.php:35
* @route '/admin/voice/create'
*/
create.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::create
* @see app/Http/Controllers/Admin/VoiceController.php:35
* @route '/admin/voice/create'
*/
create.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: create.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::store
* @see app/Http/Controllers/Admin/VoiceController.php:79
* @route '/admin/voice'
*/
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/admin/voice',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Admin\VoiceController::store
* @see app/Http/Controllers/Admin/VoiceController.php:79
* @route '/admin/voice'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceController::store
* @see app/Http/Controllers/Admin/VoiceController.php:79
* @route '/admin/voice'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::show
* @see app/Http/Controllers/Admin/VoiceController.php:42
* @route '/admin/voice/{voice}'
*/
export const show = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

show.definition = {
    methods: ["get","head"],
    url: '/admin/voice/{voice}',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\VoiceController::show
* @see app/Http/Controllers/Admin/VoiceController.php:42
* @route '/admin/voice/{voice}'
*/
show.url = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice: args }
    }

    if (typeof args === 'object' && !Array.isArray(args) && 'id' in args) {
        args = { voice: args.id }
    }

    if (Array.isArray(args)) {
        args = {
            voice: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        voice: typeof args.voice === 'object'
        ? args.voice.id
        : args.voice,
    }

    return show.definition.url
            .replace('{voice}', parsedArgs.voice.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceController::show
* @see app/Http/Controllers/Admin/VoiceController.php:42
* @route '/admin/voice/{voice}'
*/
show.get = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::show
* @see app/Http/Controllers/Admin/VoiceController.php:42
* @route '/admin/voice/{voice}'
*/
show.head = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: show.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::edit
* @see app/Http/Controllers/Admin/VoiceController.php:95
* @route '/admin/voice/{voice}/edit'
*/
export const edit = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ["get","head"],
    url: '/admin/voice/{voice}/edit',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\VoiceController::edit
* @see app/Http/Controllers/Admin/VoiceController.php:95
* @route '/admin/voice/{voice}/edit'
*/
edit.url = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice: args }
    }

    if (typeof args === 'object' && !Array.isArray(args) && 'id' in args) {
        args = { voice: args.id }
    }

    if (Array.isArray(args)) {
        args = {
            voice: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        voice: typeof args.voice === 'object'
        ? args.voice.id
        : args.voice,
    }

    return edit.definition.url
            .replace('{voice}', parsedArgs.voice.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceController::edit
* @see app/Http/Controllers/Admin/VoiceController.php:95
* @route '/admin/voice/{voice}/edit'
*/
edit.get = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::edit
* @see app/Http/Controllers/Admin/VoiceController.php:95
* @route '/admin/voice/{voice}/edit'
*/
edit.head = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: edit.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::update
* @see app/Http/Controllers/Admin/VoiceController.php:87
* @route '/admin/voice/{voice}'
*/
export const update = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/admin/voice/{voice}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\Admin\VoiceController::update
* @see app/Http/Controllers/Admin/VoiceController.php:87
* @route '/admin/voice/{voice}'
*/
update.url = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice: args }
    }

    if (typeof args === 'object' && !Array.isArray(args) && 'id' in args) {
        args = { voice: args.id }
    }

    if (Array.isArray(args)) {
        args = {
            voice: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        voice: typeof args.voice === 'object'
        ? args.voice.id
        : args.voice,
    }

    return update.definition.url
            .replace('{voice}', parsedArgs.voice.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceController::update
* @see app/Http/Controllers/Admin/VoiceController.php:87
* @route '/admin/voice/{voice}'
*/
update.put = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::update
* @see app/Http/Controllers/Admin/VoiceController.php:87
* @route '/admin/voice/{voice}'
*/
update.patch = (args: { voice: number | { id: number } } | [voice: number | { id: number } ] | number | { id: number }, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

/**
* @see \App\Http\Controllers\Admin\VoiceController::destroy
* @see app/Http/Controllers/Admin/VoiceController.php:103
* @route '/admin/voice/{voice}'
*/
export const destroy = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

destroy.definition = {
    methods: ["delete"],
    url: '/admin/voice/{voice}',
} satisfies RouteDefinition<["delete"]>

/**
* @see \App\Http\Controllers\Admin\VoiceController::destroy
* @see app/Http/Controllers/Admin/VoiceController.php:103
* @route '/admin/voice/{voice}'
*/
destroy.url = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice: args }
    }

    if (Array.isArray(args)) {
        args = {
            voice: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        voice: args.voice,
    }

    return destroy.definition.url
            .replace('{voice}', parsedArgs.voice.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceController::destroy
* @see app/Http/Controllers/Admin/VoiceController.php:103
* @route '/admin/voice/{voice}'
*/
destroy.delete = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

const voice = {
    index: Object.assign(index, index),
    create: Object.assign(create, create),
    store: Object.assign(store, store),
    show: Object.assign(show, show),
    edit: Object.assign(edit, edit),
    update: Object.assign(update, update),
    destroy: Object.assign(destroy, destroy),
}

export default voice