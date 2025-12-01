import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../../../../wayfinder'
/**
* @see \App\Http\Controllers\Admin\OrderStatusController::__invoke
* @see app/Http/Controllers/Admin/OrderStatusController.php:13
* @route '/admin/order_status'
*/
const OrderStatusController = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: OrderStatusController.url(options),
    method: 'post',
})

OrderStatusController.definition = {
    methods: ["post"],
    url: '/admin/order_status',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Admin\OrderStatusController::__invoke
* @see app/Http/Controllers/Admin/OrderStatusController.php:13
* @route '/admin/order_status'
*/
OrderStatusController.url = (options?: RouteQueryOptions) => {
    return OrderStatusController.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\OrderStatusController::__invoke
* @see app/Http/Controllers/Admin/OrderStatusController.php:13
* @route '/admin/order_status'
*/
OrderStatusController.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: OrderStatusController.url(options),
    method: 'post',
})

export default OrderStatusController