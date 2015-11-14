// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('InterCityBus').controller('BuslineController', function($scope, $window, $document, $stateParams, $http, $timeout, $interval, Busline, Utils) {
    $scope.finishBook = true;
    $scope.dial = function(phone) {
      $timeout(function() {
        return $scope.finishBook = true;
      }, 5000);
      return false;
    };
    $scope.purify = function(str) {
      return str.replace(/\s+/g, "");
    };
    $scope.busline = Busline.get({
      id: $stateParams.id
    });
    $scope.$on('$viewContentLoaded', function(event) {
      return $timeout(function() {
        return Utils.fixTooLongIssue();
      }, 100);
    });
    return $scope.closeit = function() {
      return $scope.finishBook = false;
    };
  });

}).call(this);

//# sourceMappingURL=busline.controller.js.map
