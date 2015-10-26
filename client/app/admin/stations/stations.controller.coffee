angular.module('InterCityBus.controllers')
.controller 'StationListCtrl', ($scope, $state, $http, Station)->
    $scope.stations = Station.query()

    $scope.deleteStation = (entity)->
        entity.$remove ->
            $state.go $state.current, {}, {reload: true}


.controller 'StationViewCtrl', ($scope, $stateParams, Station)->
    $scope.station = Station.get
        id: $stateParams.id


.controller 'StationCreateCtrl', ($scope, $state, $stateParams, Station, City)->
    $scope.cities = City.query()
    $scope.station = new Station()
    $scope.addStation = ->
        $scope.station.$save ->
            $state.go "stations"


.controller 'StationEditCtrl', ($scope, $state, $stateParams, Station, City)->

    $scope.cities = City.query()

    $scope.updateStation = ->

        $scope.station.$update ->
            $state.go "stations"


    $scope.loadStation = ->
        $scope.station = Station.get
            id: $stateParams.id

    $scope.loadStation()
