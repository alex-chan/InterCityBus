// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('InterCityBus').controller('SearchController', function($state, $scope, $window, $stateParams, $http, $timeout, City, Busline, Utils) {
    $scope.cities = City.query();
    $scope.startCityId = $stateParams.start;
    $scope.endCityId = $stateParams.end;
    $scope.buslines = Busline.query({
      start: $stateParams.start,
      end: $stateParams.end
    });
    $scope.viewDetailBusline = function(id) {
      return $state.go('busline', {
        id: id
      });
    };
    $scope.$on('$viewContentLoaded', function(event) {
      return $timeout(function() {
        return Utils.fixTooLongIssue();
      }, 100);
    });
    $scope.research = function() {
      return $state.go('index');
    };
    return $scope.requestNewLine = function() {
      var end, msg, start;
      start = $scope.cities[$scope.startCityId].name;
      end = $scope.cities[$scope.endCityId].name;
      msg = "您专属定制的" + start + "-" + end + "的路线小巴已经收到，将会尽快开通，届时将第一时间通知您！";
      alert(msg);
      return $state.go('index');
    };
  });

}).call(this);

//# sourceMappingURL=search.controller.js.map
