angular.module('InterCityBus')
.controller 'AdminCtrl', ($scope, $http, Auth, User)->

    # Use the User $resource to fetch all users
#    $scope.users = User.query();

#    $scope.delete = (user)->
#        User.remove({ id: user._id });
#        $scope.users.splice(this.$index, 1)


    $scope.isLoggedIn = Auth.isLoggedIn
    $scope.isAdmin = Auth.isAdmin
    $scope.getCurrentUser = Auth.getCurrentUser