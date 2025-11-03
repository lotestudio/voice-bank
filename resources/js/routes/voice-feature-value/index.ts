import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../wayfinder'
/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::index
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/admin/voice-feature-value',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::index
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::index
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::index
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::create
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/create'
*/
export const create = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

create.definition = {
    methods: ["get","head"],
    url: '/admin/voice-feature-value/create',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::create
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/create'
*/
create.url = (options?: RouteQueryOptions) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::create
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/create'
*/
create.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: create.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::create
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/create'
*/
create.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: create.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::store
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:15
* @route '/admin/voice-feature-value'
*/
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/admin/voice-feature-value',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::store
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:15
* @route '/admin/voice-feature-value'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::store
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:15
* @route '/admin/voice-feature-value'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::show
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
export const show = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

show.definition = {
    methods: ["get","head"],
    url: '/admin/voice-feature-value/{voice_feature_value}',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::show
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
show.url = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice_feature_value: args }
    }

    if (Array.isArray(args)) {
        args = {
            voice_feature_value: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        voice_feature_value: args.voice_feature_value,
    }

    return show.definition.url
            .replace('{voice_feature_value}', parsedArgs.voice_feature_value.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::show
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
show.get = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: show.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::show
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
show.head = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: show.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::edit
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/{voice_feature_value}/edit'
*/
export const edit = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ["get","head"],
    url: '/admin/voice-feature-value/{voice_feature_value}/edit',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::edit
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/{voice_feature_value}/edit'
*/
edit.url = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice_feature_value: args }
    }

    if (Array.isArray(args)) {
        args = {
            voice_feature_value: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        voice_feature_value: args.voice_feature_value,
    }

    return edit.definition.url
            .replace('{voice_feature_value}', parsedArgs.voice_feature_value.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::edit
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/{voice_feature_value}/edit'
*/
edit.get = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: edit.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::edit
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:0
* @route '/admin/voice-feature-value/{voice_feature_value}/edit'
*/
edit.head = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: edit.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::update
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:29
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
export const update = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ["put","patch"],
    url: '/admin/voice-feature-value/{voice_feature_value}',
} satisfies RouteDefinition<["put","patch"]>

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::update
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:29
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
update.url = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice_feature_value: args }
    }

    if (Array.isArray(args)) {
        args = {
            voice_feature_value: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        voice_feature_value: args.voice_feature_value,
    }

    return update.definition.url
            .replace('{voice_feature_value}', parsedArgs.voice_feature_value.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::update
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:29
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
update.put = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'put'> => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::update
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:29
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
update.patch = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'patch'> => ({
    url: update.url(args, options),
    method: 'patch',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::destroy
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:37
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
export const destroy = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

destroy.definition = {
    methods: ["delete"],
    url: '/admin/voice-feature-value/{voice_feature_value}',
} satisfies RouteDefinition<["delete"]>

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::destroy
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:37
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
destroy.url = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice_feature_value: args }
    }

    if (Array.isArray(args)) {
        args = {
            voice_feature_value: args[0],
        }
    }

    args = applyUrlDefaults(args)

    const parsedArgs = {
        voice_feature_value: args.voice_feature_value,
    }

    return destroy.definition.url
            .replace('{voice_feature_value}', parsedArgs.voice_feature_value.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::destroy
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:37
* @route '/admin/voice-feature-value/{voice_feature_value}'
*/
destroy.delete = (args: { voice_feature_value: string | number } | [voice_feature_value: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'delete'> => ({
    url: destroy.url(args, options),
    method: 'delete',
})

const voiceFeatureValue = {
    index: Object.assign(index, index),
    create: Object.assign(create, create),
    store: Object.assign(store, store),
    show: Object.assign(show, show),
    edit: Object.assign(edit, edit),
    update: Object.assign(update, update),
    destroy: Object.assign(destroy, destroy),
}

export default voiceFeatureValue