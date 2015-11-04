
angular.module('InterCityBus')
.controller 'AdminLoginCtrl', ($scope, Auth, $state)->
    $scope.user = {};
    $scope.errors = {};

    $scope.login = (form)->
        $scope.submitted = true;

        if (form.$valid)
            Auth.login({
                name: $scope.user.name,
                password: $scope.user.password
            })
            .then ()->
                # Logged in, redirect to home
                $state.go('admin')
            .catch (err)->
                $scope.errors.other = err.message;


