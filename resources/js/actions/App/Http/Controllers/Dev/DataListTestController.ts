import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Dev\DataListTestController::__invoke
* @see app/Http/Controllers/Dev/DataListTestController.php:19
* @route '/dev/data-list-test'
*/
const DataListTestController = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: DataListTestController.url(options),
    method: 'get',
})

DataListTestController.definition = {
    methods: ["get","head"],
    url: '/dev/data-list-test',
} satisfies RouteDefinition<["get","head"]>

/**
* @see \App\Http\Controllers\Dev\DataListTestController::__invoke
* @see app/Http/Controllers/Dev/DataListTestController.php:19
* @route '/dev/data-list-test'
*/
DataListTestController.url = (options?: RouteQueryOptions) => {
    return DataListTestController.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Dev\DataListTestController::__invoke
* @see app/Http/Controllers/Dev/DataListTestController.php:19
* @route '/dev/data-list-test'
*/
DataListTestController.get = (options?: RouteQueryOptions): RouteDefinition<'get'> => ({
    url: DataListTestController.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Dev\DataListTestController::__invoke
* @see app/Http/Controllers/Dev/DataListTestController.php:19
* @route '/dev/data-list-test'
*/
DataListTestController.head = (options?: RouteQueryOptions): RouteDefinition<'head'> => ({
    url: DataListTestController.url(options),
    method: 'head',
})

export default DataListTestController