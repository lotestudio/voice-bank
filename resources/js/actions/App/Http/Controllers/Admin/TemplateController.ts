import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Admin\TemplateController::__invoke
* @see app/Http/Controllers/Admin/TemplateController.php:10
* @route '/template'
*/
const TemplateController = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: TemplateController.url(options),
    method: 'get',
})

TemplateController.definition = {
    methods: ["get","head"],
    url: '/template',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Admin\TemplateController::__invoke
* @see app/Http/Controllers/Admin/TemplateController.php:10
* @route '/template'
*/
TemplateController.url = (options?: RouteQueryOptions) => {
    return TemplateController.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\TemplateController::__invoke
* @see app/Http/Controllers/Admin/TemplateController.php:10
* @route '/template'
*/
TemplateController.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: TemplateController.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\TemplateController::__invoke
* @see app/Http/Controllers/Admin/TemplateController.php:10
* @route '/template'
*/
TemplateController.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: TemplateController.url(options),
    method: 'head',
})

export default TemplateController