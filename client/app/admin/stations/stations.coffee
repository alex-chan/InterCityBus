angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'stations',
        url: 'stations'
        templateUrl: 'app/admin/stations/stations.html'
        controller: 'StationListCtrl'

    .state 'viewStation',
        url: 'stations/:id/view'
        templateUrl: 'app/admin/stations/station-view.html'
        controller: 'StationViewCtrl'

    .state 'newStation',
        url: 'stations/new'
        templateUrl: 'app/admin/stations/station-add.html'
        controller: 'StationCreateCtrl'

    .state 'editStation',
        url: 'stations/:id/edit'
        templateUrl: 'app/admin/stations/station-edit.html'
        controller: 'StationEditCtrl'