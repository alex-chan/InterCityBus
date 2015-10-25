angular.module('InterCityBus.controllers')
.controller 'PhoneListCtrl', ($scope, $http, Phone)->
    $scope.phones = Phone.query()



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
