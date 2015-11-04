angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'cities',
        url: '/admin/cities'
        templateUrl: 'app/admin/cities/cities.html'
        controller: 'CityListCtrl'

    .state 'viewCity',
        url: '/admin/cities/:id/view'
        templateUrl: 'app/admin/cities/city-view.html'
        controller: 'CityViewCtrl'

    .state 'newCity',
        url: '/admin/cities/new'
        templateUrl: 'app/admin/cities/city-add.html'
        controller: 'CityCreateCtrl'

    .state 'editCity',
        url: '/admin/cities/:id/edit'
        templateUrl: 'app/admin/cities/city-edit.html'
        controller: 'CityEditCtrl'
