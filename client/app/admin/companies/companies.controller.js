// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('InterCityBus.controllers').controller('CompanyListCtrl', function($scope, $state, $http, Company) {
    $scope.companies = Company.query();
    return $scope.deleteCompany = function(entity) {
      return entity.$remove(function() {
        return $state.go($state.current, {}, {
          reload: true
        });
      });
    };
  }).controller('CompanyViewCtrl', function($scope, $stateParams, Company) {
    return $scope.company = Company.get({
      id: $stateParams.id
    });
  }).controller('CompanyCreateCtrl', function($scope, $state, $stateParams, Company) {
    $scope.company = new Company();
    return $scope.addCompany = function() {
      return $scope.company.$save(function() {
        return $state.go("companies");
      });
    };
  }).controller('CompanyEditCtrl', function($scope, $state, $stateParams, Company) {
    $scope.updateCompany = function() {
      console.log($scope.company);
      return $scope.company.$update(function() {
        return $state.go("companies");
      });
    };
    $scope.loadCompany = function() {
      return $scope.company = Company.get({
        id: $stateParams.id
      });
    };
    return $scope.loadCompany();
  });

}).call(this);

//# sourceMappingURL=companies.controller.js.map
