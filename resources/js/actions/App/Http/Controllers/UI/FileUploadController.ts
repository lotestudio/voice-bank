import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\UI\FileUploadController::process
* @see app/Http/Controllers/UI/FileUploadController.php:16
* @route '/api/uploads/process'
*/
export const process = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: process.url(options),
    method: 'post',
})

process.definition = {
    methods: ["post"],
    url: '/api/uploads/process',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\UI\FileUploadController::process
* @see app/Http/Controllers/UI/FileUploadController.php:16
* @route '/api/uploads/process'
*/
process.url = (options?: RouteQueryOptions) => {
    return process.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\UI\FileUploadController::process
* @see app/Http/Controllers/UI/FileUploadController.php:16
* @route '/api/uploads/process'
*/
process.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: process.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\UI\FileUploadController::remove
* @see app/Http/Controllers/UI/FileUploadController.php:58
* @route '/api/uploads/remove'
*/
export const remove = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: remove.url(options),
    method: 'post',
})

remove.definition = {
    methods: ["post"],
    url: '/api/uploads/remove',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\UI\FileUploadController::remove
* @see app/Http/Controllers/UI/FileUploadController.php:58
* @route '/api/uploads/remove'
*/
remove.url = (options?: RouteQueryOptions) => {
    return remove.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\UI\FileUploadController::remove
* @see app/Http/Controllers/UI/FileUploadController.php:58
* @route '/api/uploads/remove'
*/
remove.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: remove.url(options),
    method: 'post',
})

const FileUploadController = { process, remove }

export default FileUploadController