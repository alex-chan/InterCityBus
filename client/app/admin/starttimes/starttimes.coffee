angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'starttimes',
        url: '/admin/starttimes'
        templateUrl: 'app/admin/starttimes/starttimes.html'
        controller: 'StarttimeListCtrl'

    .state 'viewStarttime',
        url: '/admin/starttimes/:id/view'
        templateUrl: 'app/admin/starttimes/starttime-view.html'
        controller: 'StarttimeViewCtrl'

    .state 'newStarttime',
        url: '/admin/starttimes/new'
        templateUrl: 'app/admin/starttimes/starttime-add.html'
        controller: 'StarttimeCreateCtrl'

    .state 'editStarttime',
        url: '/admin/starttimes/:id/edit'
        templateUrl: 'app/admin/starttimes/starttime-edit.html'
        controller: 'StarttimeEditCtrl'
