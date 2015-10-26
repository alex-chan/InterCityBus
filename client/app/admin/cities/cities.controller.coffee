angular.module('InterCityBus.controllers',[])
.controller 'CityListCtrl', ($scope, $state, $window, $http, City)->
    $scope.cities = City.query()

    $scope.deleteCity = (city)->
        city.$remove ->
            $state.go $state.current, {}, {reload: true}

.controller 'CityViewCtrl', ($scope, $stateParams, City)->
    $scope.city = City.get
        id: $stateParams.id


.controller 'CityCreateCtrl', ($scope, $state, $stateParams, City)->

    $scope.city = new City()
    $scope.addCity = ->
        $scope.city.$save ->
            $state.go "cities"


.controller 'CityEditCtrl', ($scope, $state, $stateParams, City)->

    $scope.updateCity = ->

        console.log $scope.city

        $scope.city.$update ->
            $state.go "cities"


    $scope.loadCity = ->
        $scope.city = City.get
            id: $stateParams.id

    $scope.loadCity()
