import { queryParams, type QueryParams } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Admin\DashboardController::__invoke
* @see app/Http/Controllers/Admin/DashboardController.php:10
* @route '/dashboard'
*/
const DashboardController = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: DashboardController.url(options),
    method: 'get',
})

DashboardController.definition = {
    methods: ['get','head'],
    url: '/dashboard',
}

/**
* @see \App\Http\Controllers\Admin\DashboardController::__invoke
* @see app/Http/Controllers/Admin/DashboardController.php:10
* @route '/dashboard'
*/
DashboardController.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return DashboardController.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\DashboardController::__invoke
* @see app/Http/Controllers/Admin/DashboardController.php:10
* @route '/dashboard'
*/
DashboardController.get = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: DashboardController.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\Admin\DashboardController::__invoke
* @see app/Http/Controllers/Admin/DashboardController.php:10
* @route '/dashboard'
*/
DashboardController.head = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: DashboardController.url(options),
    method: 'head',
})

export default DashboardController