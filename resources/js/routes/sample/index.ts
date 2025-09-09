import { queryParams, type QueryParams } from './../../wayfinder'
/**
* @see \App\Http\Controllers\SampleDownloaderController::download
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
export const download = (args: { id: string | number } | [id: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: download.url(args, options),
    method: 'get',
})

download.definition = {
    methods: ['get','head'],
    url: '/sample/download/{id}',
}

/**
* @see \App\Http\Controllers\SampleDownloaderController::download
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
download.url = (args: { id: string | number } | [id: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    if (typeof args === 'string' || typeof args === 'number') {
        args = { id: args }
    }

    if (Array.isArray(args)) {
        args = {
            id: args[0],
        }
    }

    const parsedArgs = {
        id: args.id,
    }

    return download.definition.url
            .replace('{id}', parsedArgs.id.toString())
            .replace(/\/+$/, '') + queryParams(options)
}

/**
* @see \App\Http\Controllers\SampleDownloaderController::download
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
download.get = (args: { id: string | number } | [id: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: download.url(args, options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\SampleDownloaderController::download
* @see app/Http/Controllers/SampleDownloaderController.php:12
* @route '/sample/download/{id}'
*/
download.head = (args: { id: string | number } | [id: string | number ] | string | number, options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: download.url(args, options),
    method: 'head',
})

const sample = {
    download,
}

export default sample