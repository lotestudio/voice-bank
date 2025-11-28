import { queryParams, type RouteQueryOptions, type RouteDefinition } from './../../wayfinder'
/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::store
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:15
* @route '/admin/voice-feature-value/store'
*/
export const store = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

store.definition = {
    methods: ["post"],
    url: '/admin/voice-feature-value/store',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::store
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:15
* @route '/admin/voice-feature-value/store'
*/
store.url = (options?: RouteQueryOptions) => {
    return store.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::store
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:15
* @route '/admin/voice-feature-value/store'
*/
store.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: store.url(options),
    method: 'post',
})

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::update
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:32
* @route '/admin/voice-feature-value/update'
*/
export const update = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: update.url(options),
    method: 'post',
})

update.definition = {
    methods: ["post"],
    url: '/admin/voice-feature-value/update',
} satisfies RouteDefinition<["post"]>

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::update
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:32
* @route '/admin/voice-feature-value/update'
*/
update.url = (options?: RouteQueryOptions) => {
    return update.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\Admin\VoiceFeatureValueController::update
* @see app/Http/Controllers/Admin/VoiceFeatureValueController.php:32
* @route '/admin/voice-feature-value/update'
*/
update.post = (options?: RouteQueryOptions): RouteDefinition<'post'> => ({
    url: update.url(options),
    method: 'post',
})

const voiceFeatureValue = {
    store: Object.assign(store, store),
    update: Object.assign(update, update),
}

export default voiceFeatureValue