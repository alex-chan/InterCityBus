angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state('busline', {
            url: '/busline',
            templateUrl: 'app/busline/busline.html',
            controller: 'BuslineController'

        })
