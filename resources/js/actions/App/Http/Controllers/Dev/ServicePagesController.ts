import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Dev\ServicePagesController::side_menu
* @see app/Http/Controllers/Dev/ServicePagesController.php:12
* @route '/dev/template/side_menu'
*/
export const side_menu = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: side_menu.url(options),
    method: 'get',
})

side_menu.definition = {
    methods: ["get","head"],
    url: '/dev/template/side_menu',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Dev\ServicePagesController::side_menu
* @see app/Http/Controllers/Dev/ServicePagesController.php:12
* @route '/dev/template/side_menu'
*/
side_menu.url = (options?: RouteQueryOptions) => {
    return side_menu.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Dev\ServicePagesController::side_menu
* @see app/Http/Controllers/Dev/ServicePagesController.php:12
* @route '/dev/template/side_menu'
*/
side_menu.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: side_menu.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Dev\ServicePagesController::side_menu
* @see app/Http/Controllers/Dev/ServicePagesController.php:12
* @route '/dev/template/side_menu'
*/
side_menu.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: side_menu.url(options),
    method: 'head',
})

const ServicePagesController = { side_menu }

export default ServicePagesController