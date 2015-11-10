angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state('index', {
            url: '/index',
            templateUrl: 'app/index/index.html',
            controller: 'IndexController'

        })
