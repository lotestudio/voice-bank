import { queryParams, type QueryParams } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\UI\FileUploadController::process
* @see app/Http/Controllers/UI/FileUploadController.php:16
* @route '/api/uploads/process'
*/
export const process = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'post',
} => ({
    url: process.url(options),
    method: 'post',
})

process.definition = {
    methods: ['post'],
    url: '/api/uploads/process',
}

/**
* @see \App\Http\Controllers\UI\FileUploadController::process
* @see app/Http/Controllers/UI/FileUploadController.php:16
* @route '/api/uploads/process'
*/
process.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return process.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\UI\FileUploadController::process
* @see app/Http/Controllers/UI/FileUploadController.php:16
* @route '/api/uploads/process'
*/
process.post = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'post',
} => ({
    url: process.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\UI\FileUploadController::remove
* @see app/Http/Controllers/UI/FileUploadController.php:60
* @route '/api/uploads/remove'
*/
export const remove = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'post',
} => ({
    url: remove.url(options),
    method: 'post',
})

remove.definition = {
    methods: ['post'],
    url: '/api/uploads/remove',
}

/**
* @see \App\Http\Controllers\UI\FileUploadController::remove
* @see app/Http/Controllers/UI/FileUploadController.php:60
* @route '/api/uploads/remove'
*/
remove.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return remove.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\UI\FileUploadController::remove
* @see app/Http/Controllers/UI/FileUploadController.php:60
* @route '/api/uploads/remove'
*/
remove.post = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'post',
} => ({
    url: remove.url(options),
    method: 'post',
})

const FileUploadController = { process, remove }

export default FileUploadController