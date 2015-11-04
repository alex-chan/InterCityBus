angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'buslines',
        url: '/admin/buslines'
        templateUrl: 'app/admin/buslines/buslines.html'
        controller: 'BuslineListCtrl'
        authenticate: true

    .state 'viewBusline',
        url: '/admin/buslines/:id/view'
        templateUrl: 'app/admin/buslines/busline-view.html'
        controller: 'BuslineViewCtrl'

    .state 'newBusline',
        url: '/admin/buslines/new'
        templateUrl: 'app/admin/buslines/busline-add.html'
        controller: 'BuslineCreateCtrl'

    .state 'editBusline',
        url: '/admin/buslines/:id/edit'
        templateUrl: 'app/admin/buslines/busline-edit.html'
        controller: 'BuslineEditCtrl'
