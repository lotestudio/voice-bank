import { queryParams, type QueryParams } from './../../wayfinder'
/**
* @see \App\Http\Controllers\Lap\VoicesController::index
* @see [unknown]:0
* @route '/admin/voice'
*/
export const index = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ['get','head'],
    url: '/admin/voice',
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::index
* @see [unknown]:0
* @route '/admin/voice'
*/
index.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::index
* @see [unknown]:0
* @route '/admin/voice'
*/
index.get = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Lap\VoicesController::index
* @see [unknown]:0
* @route '/admin/voice'
*/
index.head = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Lap\VoicesController::create
* @see [unknown]:0
* @route '/admin/voice/create'
*/
export const create = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: create.url(options),
    method: 'get',
})

create.definition = {
    methods: ['get','head'],
    url: '/admin/voice/create',
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::create
* @see [unknown]:0
* @route '/admin/voice/create'
*/
create.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::create
* @see [unknown]:0
* @route '/admin/voice/create'
*/
create.get = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: create.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Lap\VoicesController::create
* @see [unknown]:0
* @route '/admin/voice/create'
*/
create.head = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: create.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Lap\VoicesController::store
* @see [unknown]:0
* @route '/admin/voice'
*/
export const store = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'post',
} => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ['post'],
    url: '/admin/voice',
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::store
* @see [unknown]:0
* @route '/admin/voice'
*/
store.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::store
* @see [unknown]:0
* @route '/admin/voice'
*/
store.post = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'post',
} => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Lap\VoicesController::edit
* @see [unknown]:0
* @route '/admin/voice/{voice}/edit'
*/
export const edit = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ['get','head'],
    url: '/admin/voice/{voice}/edit',
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::edit
* @see [unknown]:0
* @route '/admin/voice/{voice}/edit'
*/
edit.url = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice: args }
    }

    if (Array.isArray(args)) {
        args = {
            voice: args[0],
        }
    }

    const parsedArgs = {
        voice: args.voice,
    }

    return edit.definition.url
            .replace('{voice}', parsedArgs.voice.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::edit
* @see [unknown]:0
* @route '/admin/voice/{voice}/edit'
*/
edit.get = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: edit.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Lap\VoicesController::edit
* @see [unknown]:0
* @route '/admin/voice/{voice}/edit'
*/
edit.head = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: edit.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Lap\VoicesController::update
* @see [unknown]:0
* @route '/admin/voice/{voice}'
*/
export const update = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'put',
} => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ['put','patch'],
    url: '/admin/voice/{voice}',
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::update
* @see [unknown]:0
* @route '/admin/voice/{voice}'
*/
update.url = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice: args }
    }

    if (Array.isArray(args)) {
        args = {
            voice: args[0],
        }
    }

    const parsedArgs = {
        voice: args.voice,
    }

    return update.definition.url
            .replace('{voice}', parsedArgs.voice.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::update
* @see [unknown]:0
* @route '/admin/voice/{voice}'
*/
update.put = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'put',
} => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Lap\VoicesController::update
* @see [unknown]:0
* @route '/admin/voice/{voice}'
*/
update.patch = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'patch',
} => ({
    url: update.url(args, options),
    method: 'patch',
})

/**
* @see \App\Http\Controllers\Lap\VoicesController::destroy
* @see [unknown]:0
* @route '/admin/voice/{voice}'
*/
export const destroy = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'delete',
} => ({
    url: destroy.url(args, options),
    method: 'delete',
})

destroy.definition = {
    methods: ['delete'],
    url: '/admin/voice/{voice}',
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::destroy
* @see [unknown]:0
* @route '/admin/voice/{voice}'
*/
destroy.url = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { voice: args }
    }

    if (Array.isArray(args)) {
        args = {
            voice: args[0],
        }
    }

    const parsedArgs = {
        voice: args.voice,
    }

    return destroy.definition.url
            .replace('{voice}', parsedArgs.voice.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\VoicesController::destroy
* @see [unknown]:0
* @route '/admin/voice/{voice}'
*/
destroy.delete = (args: { voice: string | number } | [voice: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'delete',
} => ({
    url: destroy.url(args, options),
    method: 'delete',
})

const voice = {
    index,
    create,
    store,
    edit,
    update,
    destroy,
}

export default voice