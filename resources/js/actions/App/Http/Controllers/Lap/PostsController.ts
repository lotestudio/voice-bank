import { queryParams, type QueryParams } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Lap\PostsController::index
* @see [unknown]:0
* @route '/admin/post'
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
    url: '/admin/post',
}

/**
* @see \App\Http\Controllers\Lap\PostsController::index
* @see [unknown]:0
* @route '/admin/post'
*/
index.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\PostsController::index
* @see [unknown]:0
* @route '/admin/post'
*/
index.get = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Lap\PostsController::index
* @see [unknown]:0
* @route '/admin/post'
*/
index.head = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Lap\PostsController::create
* @see [unknown]:0
* @route '/admin/post/create'
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
    url: '/admin/post/create',
}

/**
* @see \App\Http\Controllers\Lap\PostsController::create
* @see [unknown]:0
* @route '/admin/post/create'
*/
create.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return create.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\PostsController::create
* @see [unknown]:0
* @route '/admin/post/create'
*/
create.get = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: create.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Lap\PostsController::create
* @see [unknown]:0
* @route '/admin/post/create'
*/
create.head = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: create.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Lap\PostsController::store
* @see [unknown]:0
* @route '/admin/post'
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
    url: '/admin/post',
}

/**
* @see \App\Http\Controllers\Lap\PostsController::store
* @see [unknown]:0
* @route '/admin/post'
*/
store.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\PostsController::store
* @see [unknown]:0
* @route '/admin/post'
*/
store.post = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'post',
} => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Lap\PostsController::edit
* @see [unknown]:0
* @route '/admin/post/{post}/edit'
*/
export const edit = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: edit.url(args, options),
    method: 'get',
})

edit.definition = {
    methods: ['get','head'],
    url: '/admin/post/{post}/edit',
}

/**
* @see \App\Http\Controllers\Lap\PostsController::edit
* @see [unknown]:0
* @route '/admin/post/{post}/edit'
*/
edit.url = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { post: args }
    }

    if (Array.isArray(args)) {
        args = {
            post: args[0],
        }
    }

    const parsedArgs = {
        post: args.post,
    }

    return edit.definition.url
            .replace('{post}', parsedArgs.post.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\PostsController::edit
* @see [unknown]:0
* @route '/admin/post/{post}/edit'
*/
edit.get = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: edit.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Lap\PostsController::edit
* @see [unknown]:0
* @route '/admin/post/{post}/edit'
*/
edit.head = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: edit.url(args, options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Lap\PostsController::update
* @see [unknown]:0
* @route '/admin/post/{post}'
*/
export const update = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'put',
} => ({
    url: update.url(args, options),
    method: 'put',
})

update.definition = {
    methods: ['put','patch'],
    url: '/admin/post/{post}',
}

/**
* @see \App\Http\Controllers\Lap\PostsController::update
* @see [unknown]:0
* @route '/admin/post/{post}'
*/
update.url = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { post: args }
    }

    if (Array.isArray(args)) {
        args = {
            post: args[0],
        }
    }

    const parsedArgs = {
        post: args.post,
    }

    return update.definition.url
            .replace('{post}', parsedArgs.post.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\PostsController::update
* @see [unknown]:0
* @route '/admin/post/{post}'
*/
update.put = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'put',
} => ({
    url: update.url(args, options),
    method: 'put',
})

/**
* @see \App\Http\Controllers\Lap\PostsController::update
* @see [unknown]:0
* @route '/admin/post/{post}'
*/
update.patch = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'patch',
} => ({
    url: update.url(args, options),
    method: 'patch',
})

/**
* @see \App\Http\Controllers\Lap\PostsController::destroy
* @see [unknown]:0
* @route '/admin/post/{post}'
*/
export const destroy = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'delete',
} => ({
    url: destroy.url(args, options),
    method: 'delete',
})

destroy.definition = {
    methods: ['delete'],
    url: '/admin/post/{post}',
}

/**
* @see \App\Http\Controllers\Lap\PostsController::destroy
* @see [unknown]:0
* @route '/admin/post/{post}'
*/
destroy.url = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { post: args }
    }

    if (Array.isArray(args)) {
        args = {
            post: args[0],
        }
    }

    const parsedArgs = {
        post: args.post,
    }

    return destroy.definition.url
            .replace('{post}', parsedArgs.post.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\Lap\PostsController::destroy
* @see [unknown]:0
* @route '/admin/post/{post}'
*/
destroy.delete = (args: { post: string | number } | [post: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'delete',
} => ({
    url: destroy.url(args, options),
    method: 'delete',
})

const PostsController = { index, create, store, edit, update, destroy }

export default PostsController