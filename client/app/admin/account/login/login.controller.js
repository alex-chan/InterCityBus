// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('InterCityBus').controller('AdminLoginCtrl', function($scope, Auth, $state) {
    $scope.user = {};
    $scope.errors = {};
    return $scope.login = function(form) {
      $scope.submitted = true;
      if (form.$valid) {
        return Auth.login({
          name: $scope.user.name,
          password: $scope.user.password
        }).then(function() {
          return $state.go('admin');
        })["catch"](function(err) {
          return $scope.errors.other = err.message;
        });
      }
    };
  });

}).call(this);

//# sourceMappingURL=login.controller.js.map
