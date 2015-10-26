angular.module('InterCityBus.controllers')
.controller 'StarttimeListCtrl', ($scope, $state, $http, Starttime)->
    $scope.starttimes = Starttime.query()

    $scope.deleteStarttime = (entity)->
        entity.$remove ->
            $state.go $state.current, {}, {reload: true}


.controller 'StarttimeViewCtrl', ($scope, $stateParams, Starttime)->
    $scope.starttime = Starttime.get
        id: $stateParams.id


.controller 'StarttimeCreateCtrl', ($scope, $state, $stateParams, Starttime, City)->
    $scope.cities = City.query()
    $scope.starttime = new Starttime()
    $scope.addStarttime = ->
        $scope.starttime.$save ->
            $state.go "starttimes"


.controller 'StarttimeEditCtrl', ($scope, $state, $stateParams, Starttime, City)->

    $scope.cities = City.query()

    $scope.updateStarttime = ->

        $scope.starttime.$update ->
            $state.go "starttimes"


    $scope.loadStarttime = ->
        $scope.starttime = Starttime.get
            id: $stateParams.id

    $scope.loadStarttime()
