// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('InterCityBus').controller('IndexController', function($scope, $http) {
    $scope.cities = ['a', 'b', 'c'];
    return $scope.swapCity = function() {
      var tmp;
      tmp = this.startCity;
      this.startCity = this.endCity;
      return this.endCity = tmp;
    };
  });

}).call(this);

//# sourceMappingURL=index.controller.js.map
