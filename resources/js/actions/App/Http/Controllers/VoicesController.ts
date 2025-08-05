import { queryParams, type QueryParams } from './../../../../wayfinder'
/**
* @see \App\Http\Controllers\VoicesController::index
* @see app/Http/Controllers/VoicesController.php:14
* @route '/voices'
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
    url: '/voices',
}

/**
* @see \App\Http\Controllers\VoicesController::index
* @see app/Http/Controllers/VoicesController.php:14
* @route '/voices'
*/
index.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\VoicesController::index
* @see app/Http/Controllers/VoicesController.php:14
* @route '/voices'
*/
index.get = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\VoicesController::index
* @see app/Http/Controllers/VoicesController.php:14
* @route '/voices'
*/
index.head = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: index.url(options),
    method: 'head',
})

const VoicesController = { index }

export default VoicesController