angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state('search', {
            url: '/search',
            templateUrl: 'app/search/search.html',
            controller: 'SearchController'

        })
