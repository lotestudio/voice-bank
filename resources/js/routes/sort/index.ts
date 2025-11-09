import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../wayfinder'
/**
* @see \App\Http\Controllers\Admin\SortController::index
* @see app/Http/Controllers/Admin/SortController.php:12
* @route '/admin/sort'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/admin/sort',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\SortController::index
* @see app/Http/Controllers/Admin/SortController.php:12
* @route '/admin/sort'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\SortController::index
* @see app/Http/Controllers/Admin/SortController.php:12
* @route '/admin/sort'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\SortController::index
* @see app/Http/Controllers/Admin/SortController.php:12
* @route '/admin/sort'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\Admin\SortController::store
* @see app/Http/Controllers/Admin/SortController.php:39
* @route '/admin/sort'
*/
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/admin/sort',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Admin\SortController::store
* @see app/Http/Controllers/Admin/SortController.php:39
* @route '/admin/sort'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\SortController::store
* @see app/Http/Controllers/Admin/SortController.php:39
* @route '/admin/sort'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

const sort = {
    index: Object.assign(index, index),
    store: Object.assign(store, store),
}

export default sort