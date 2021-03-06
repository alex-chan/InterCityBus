// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('InterCityBus.controllers').controller('PhoneListCtrl', function($scope, $state, $http, Phone) {
    $scope.phones = Phone.query();
    return $scope.deletePhone = function(entity) {
      return entity.$remove(function() {
        return $state.go($state.current, {}, {
          reload: true
        });
      });
    };
  }).controller('PhoneViewCtrl', function($scope, $stateParams, Phone) {
    return $scope.phone = Phone.get({
      id: $stateParams.id
    });
  }).controller('PhoneCreateCtrl', function($scope, $state, $stateParams, Phone) {
    $scope.phone = new Phone();
    return $scope.addPhone = function() {
      return $scope.phone.$save(function() {
        return $state.go("phones");
      });
    };
  }).controller('PhoneEditCtrl', function($scope, $state, $stateParams, Phone) {
    $scope.updatePhone = function() {
      console.log($scope.phone);
      return $scope.phone.$update(function() {
        return $state.go("phones");
      });
    };
    $scope.loadPhone = function() {
      return $scope.phone = Phone.get({
        id: $stateParams.id
      });
    };
    return $scope.loadPhone();
  });

}).call(this);

//# sourceMappingURL=phones.controller.js.map
