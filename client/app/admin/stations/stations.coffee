angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'stations',
        url: '/admin/stations'
        templateUrl: 'app/admin/stations/stations.html'
        controller: 'StationListCtrl'

    .state 'viewStation',
        url: '/admin/stations/:id/view'
        templateUrl: 'app/admin/stations/station-view.html'
        controller: 'StationViewCtrl'

    .state 'newStation',
        url: '/admin/stations/new'
        templateUrl: 'app/admin/stations/station-add.html'
        controller: 'StationCreateCtrl'

    .state 'editStation',
        url: '/admin/stations/:id/edit'
        templateUrl: 'app/admin/stations/station-edit.html'
        controller: 'StationEditCtrl'
