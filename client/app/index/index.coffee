angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state('index', {
            url: '/index',
            templateUrl: 'app/index/index.html',
            controller: 'IndexController'

        })



angular.module('InterCityBus.services')
.factory 'City', ($resource)->
    return $resource '/api/cities/:id' ,{id: '@id'}, update:
        method: "PUT"
.factory 'Hotline', ($resource)->
    return $resource '/api/hotlines/:id' ,{id: '@id'}