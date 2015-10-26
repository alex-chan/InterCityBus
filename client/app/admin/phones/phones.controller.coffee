angular.module('InterCityBus.controllers')
.controller 'PhoneListCtrl', ($scope, $state, $http, Phone)->
    $scope.phones = Phone.query()

    $scope.deletePhone = (entity)->
        entity.$remove ->
            $state.go $state.current, {}, {reload: true}


.controller 'PhoneViewCtrl', ($scope, $stateParams, Phone)->
    $scope.phone = Phone.get
        id: $stateParams.id


.controller 'PhoneCreateCtrl', ($scope, $state, $stateParams, Phone)->

    $scope.phone = new Phone()
    $scope.addPhone = ->
        $scope.phone.$save ->
            $state.go "phones"


.controller 'PhoneEditCtrl', ($scope, $state, $stateParams, Phone)->

    $scope.updatePhone = ->

        console.log $scope.phone

        $scope.phone.$update ->
            $state.go "phones"


    $scope.loadPhone = ->
        $scope.phone = Phone.get
            id: $stateParams.id

    $scope.loadPhone()
