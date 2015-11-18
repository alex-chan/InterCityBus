angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'requestlines',
        url: '/admin/requestlines'
        templateUrl: 'app/admin/requestlines/requestlines.html'
        controller: 'RequestLinesListCtrl'
