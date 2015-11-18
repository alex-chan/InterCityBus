angular.module('InterCityBus.controllers')
.controller 'RequestLinesListCtrl', ($scope, $state, $window, $http, City, Hotline)->

    $scope.cities = City.query()
    $scope.requestlines = Hotline.query()



