import { queryParams, type RouteQueryOptions, type RouteDefinition, applyUrlDefaults } from './../../../../wayfinder'
/**
* @see \App\Http\Controllers\SampleDownloaderController::__invoke
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
const SampleDownloaderController = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: SampleDownloaderController.url(args, options),
    method: 'get',
})

SampleDownloaderController.definition = {
    methods: ["get","head"],
    url: '/sample/download/{id}',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\SampleDownloaderController::__invoke
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
SampleDownloaderController.url = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions) => {
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

    return SampleDownloaderController.definition.url
            .replace('{id}', parsedArgs.id.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\SampleDownloaderController::__invoke
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
SampleDownloaderController.get = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: SampleDownloaderController.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\SampleDownloaderController::__invoke
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
SampleDownloaderController.head = (args: { id: string | number } | [id: string | number ] | string | number, options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: SampleDownloaderController.url(args, options),
    method: 'head',
})

export default SampleDownloaderController