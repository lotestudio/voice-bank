import { queryParams, type QueryParams } from './../../../../wayfinder'
/**
* @see \App\Http\Controllers\MainController::index
* @see app/Http/Controllers/MainController.php:9
* @route '/'
*/
export const index = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: index.url(options),
    method: 'get',
})

index.definition = {
    methods: ['get','head'],
    url: '/',
}

/**
* @see \App\Http\Controllers\MainController::index
* @see app/Http/Controllers/MainController.php:9
* @route '/'
*/
index.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return index.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\MainController::index
* @see app/Http/Controllers/MainController.php:9
* @route '/'
*/
index.get = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: index.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\MainController::index
* @see app/Http/Controllers/MainController.php:9
* @route '/'
*/
index.head = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: index.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\MainController::about
* @see app/Http/Controllers/MainController.php:13
* @route '/about'
*/
export const about = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: about.url(options),
    method: 'get',
})

about.definition = {
    methods: ['get','head'],
    url: '/about',
}

/**
* @see \App\Http\Controllers\MainController::about
* @see app/Http/Controllers/MainController.php:13
* @route '/about'
*/
about.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return about.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\MainController::about
* @see app/Http/Controllers/MainController.php:13
* @route '/about'
*/
about.get = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: about.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\MainController::about
* @see app/Http/Controllers/MainController.php:13
* @route '/about'
*/
about.head = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: about.url(options),
    method: 'head',
})

/**
* @see \App\Http\Controllers\MainController::contacts
* @see app/Http/Controllers/MainController.php:16
* @route '/contacts'
*/
export const contacts = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: contacts.url(options),
    method: 'get',
})

contacts.definition = {
    methods: ['get','head'],
    url: '/contacts',
}

/**
* @see \App\Http\Controllers\MainController::contacts
* @see app/Http/Controllers/MainController.php:16
* @route '/contacts'
*/
contacts.url = (options?: { query?: QueryParams, mergeQuery?: QueryParams }) => {
    return contacts.definition.url + queryParams(options)
}

/**
* @see \App\Http\Controllers\MainController::contacts
* @see app/Http/Controllers/MainController.php:16
* @route '/contacts'
*/
contacts.get = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'get',
} => ({
    url: contacts.url(options),
    method: 'get',
})

/**
* @see \App\Http\Controllers\MainController::contacts
* @see app/Http/Controllers/MainController.php:16
* @route '/contacts'
*/
contacts.head = (options?: { query?: QueryParams, mergeQuery?: QueryParams }): {
    url: string,
    method: 'head',
} => ({
    url: contacts.url(options),
    method: 'head',
})

const MainController = { index, about, contacts }

export default MainController