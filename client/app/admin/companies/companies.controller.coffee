angular.module('InterCityBus.controllers')
.controller 'CompanyListCtrl', ($scope, $state, $http, Company)->
    $scope.companies = Company.query()

    $scope.deleteCompany = (entity)->
        entity.$remove ->
            $state.go $state.current, {}, {reload: true}

.controller 'CompanyViewCtrl', ($scope, $stateParams, Company)->
    $scope.company = Company.get
        id: $stateParams.id


.controller 'CompanyCreateCtrl', ($scope, $state, $stateParams, Company)->

    $scope.company = new Company()
    $scope.addCompany = ->
        $scope.company.$save ->
            $state.go "companies"


.controller 'CompanyEditCtrl', ($scope, $state, $stateParams, Company)->

    $scope.updateCompany = ->

        console.log $scope.company

        $scope.company.$update ->
            $state.go "companies"


    $scope.loadCompany = ->
        $scope.company = Company.get
            id: $stateParams.id

    $scope.loadCompany()
