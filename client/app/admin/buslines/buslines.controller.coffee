angular.module('InterCityBus')
.controller 'BuslinesCtrl', ($scope, $http)->

# Use the User $resource to fetch all users
#    $scope.users = User.query();

    $http.get "/api/buslines"
        .success (data)->
            $scope.buslines = data

#    $scope.delete = (user)->
#        User.remove({ id: user._id });
#        $scope.users.splice(this.$index, 1)
