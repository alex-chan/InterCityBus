angular.module('InterCityBus.controllers')
.controller 'StationListCtrl', ($scope, $http, Station)->
    $scope.stations = Station.query()



.controller 'StationViewCtrl', ($scope, $stateParams, Station)->
    $scope.station = Station.get
        id: $stateParams.id


.controller 'StationCreateCtrl', ($scope, $state, $stateParams, Station)->

    $scope.station = new Station()
    $scope.addStation = ->
        $scope.station.$save ->
            $state.go "stations"


.controller 'StationEditCtrl', ($scope, $state, $stateParams, Station)->

    $scope.updateStation = ->

        $scope.station.$update ->
            $state.go "stations"


    $scope.loadStation = ->
        $scope.station = Station.get
            id: $stateParams.id

    $scope.loadStation()
