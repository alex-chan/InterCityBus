angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state('busline', {
            url: '/busline/:id',
            templateUrl: 'app/busline/busline.html',
            controller: 'BuslineController'

        })


angular.module('InterCityBus.services')
.factory 'Busline', ($resource)->
    return $resource '/api/buslines/:id' ,{id: '@id'}, update:
        method: "PUT"

