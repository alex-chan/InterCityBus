angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'cities',
        url: 'cities'
        templateUrl: 'app/admin/cities/cities.html'
        controller: 'CityListCtrl'

    .state 'viewCity',
        url: 'cities/:id/view'
        templateUrl: 'app/admin/cities/city-view.html'
        controller: 'CityViewCtrl'

    .state 'newCity',
        url: 'cities/new'
        templateUrl: 'app/admin/cities/city-add.html'
        controller: 'CityCreateCtrl'

    .state 'editCity',
        url: 'cities/:id/edit'
        templateUrl: 'app/admin/cities/city-edit.html'
        controller: 'CityEditCtrl'
