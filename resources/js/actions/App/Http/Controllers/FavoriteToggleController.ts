import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../../../wayfinder'
/**
* @see \App\Http\Controllers\FavoriteToggleController::__invoke
* @see app/Http/Controllers/FavoriteToggleController.php:12
* @route '/favorite_toggle'
*/
const FavoriteToggleController = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: FavoriteToggleController.url(options),
    method: 'post',
})

FavoriteToggleController.definition = {
    methods: ["post"],
    url: '/favorite_toggle',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\FavoriteToggleController::__invoke
* @see app/Http/Controllers/FavoriteToggleController.php:12
* @route '/favorite_toggle'
*/
FavoriteToggleController.url = (options?: RouteQueryOptions) => {
    return FavoriteToggleController.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\FavoriteToggleController::__invoke
* @see app/Http/Controllers/FavoriteToggleController.php:12
* @route '/favorite_toggle'
*/
FavoriteToggleController.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: FavoriteToggleController.url(options),
    method: 'post',
})

export default FavoriteToggleController