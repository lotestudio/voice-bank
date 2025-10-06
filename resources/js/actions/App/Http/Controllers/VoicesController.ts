import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../../../wayfinder'
/**
* @see \App\Http\Controllers\VoicesController::index
* @see app/Http/Controllers/VoicesController.php:18
* @route '/voices'
*/
export const index = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ["get","head"],
    url: '/voices',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\VoicesController::index
* @see app/Http/Controllers/VoicesController.php:18
* @route '/voices'
*/
index.url = (options?: RouteQueryOptions) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\VoicesController::index
* @see app/Http/Controllers/VoicesController.php:18
* @route '/voices'
*/
index.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\VoicesController::index
* @see app/Http/Controllers/VoicesController.php:18
* @route '/voices'
*/
index.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: index.url(options),
    method: 'head',
})

const VoicesController = { index }

export default VoicesController