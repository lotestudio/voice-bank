import { queryParams, type QueryParams } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Admin\TemplateController::__invoke
* @see app/Http/Controllers/Admin/TemplateController.php:10
* @route '/template'
*/
const TemplateController = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: TemplateController.url(options),
    method: 'get',
})

TemplateController.definition = {
    methods: ['get','head'],
    url: '/template',
}

/**
* @see \App\Http\Controllers\Admin\TemplateController::__invoke
* @see app/Http/Controllers/Admin/TemplateController.php:10
* @route '/template'
*/
TemplateController.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return TemplateController.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\TemplateController::__invoke
* @see app/Http/Controllers/Admin/TemplateController.php:10
* @route '/template'
*/
TemplateController.get = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: TemplateController.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\TemplateController::__invoke
* @see app/Http/Controllers/Admin/TemplateController.php:10
* @route '/template'
*/
TemplateController.head = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: TemplateController.url(options),
    method: 'head',
})

export default TemplateController