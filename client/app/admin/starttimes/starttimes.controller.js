// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('InterCityBus.controllers').controller('StarttimeListCtrl', function($scope, $state, $http, Starttime) {
    $scope.starttimes = Starttime.query();
    return $scope.deleteStarttime = function(entity) {
      return entity.$remove(function() {
        return $state.go($state.current, {}, {
          reload: true
        });
      });
    };
  }).controller('StarttimeViewCtrl', function($scope, $stateParams, Starttime) {
    return $scope.starttime = Starttime.get({
      id: $stateParams.id
    });
  }).controller('StarttimeCreateCtrl', function($scope, $state, $stateParams, Starttime, City) {
    $scope.cities = City.query();
    $scope.starttime = new Starttime();
    return $scope.addStarttime = function() {
      return $scope.starttime.$save(function() {
        return $state.go("starttimes");
      });
    };
  }).controller('StarttimeEditCtrl', function($scope, $state, $stateParams, Starttime, City) {
    $scope.cities = City.query();
    $scope.updateStarttime = function() {
      return $scope.starttime.$update(function() {
        return $state.go("starttimes");
      });
    };
    $scope.loadStarttime = function() {
      return $scope.starttime = Starttime.get({
        id: $stateParams.id
      });
    };
    return $scope.loadStarttime();
  });

}).call(this);

//# sourceMappingURL=starttimes.controller.js.map
