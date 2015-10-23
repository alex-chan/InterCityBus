angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'buslines',
        url: 'buslines'
        templateUrl: 'app/admin/buslines/buslines.html'
        controller: 'BuslineListCtrl'

    .state 'viewBusline',
        url: 'buslines/:id/view'
        templateUrl: 'app/admin/buslines/busline-view.html'
        controller: 'BuslineViewCtrl'

    .state 'newBusline',
        url: 'buslines/new'
        templateUrl: 'app/admin/buslines/busline-add.html'
        controller: 'BuslineCreateCtrl'

    .state 'editBusline',
        url: 'buslines/:id/edit'
        templateUrl: 'app/admin/buslines/busline-edit.html'
        controller: 'BuslineEditCtrl'
