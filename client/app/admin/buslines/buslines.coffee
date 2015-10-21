angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state('buslines', {
            url: 'buslines',
            templateUrl: 'app/admin/buslines/buslines.html',
            controller: 'BuslinesCtrl'
        })
