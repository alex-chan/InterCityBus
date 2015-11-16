angular.module('InterCityBus')
.controller 'SearchController', ($state, $scope, $window, $stateParams, $http, $timeout, City, Busline, Utils)->

    $scope.cities = City.query()
    $scope.startCityId = $stateParams.start
    $scope.endCityId = $stateParams.end

    $scope.buslines = Busline.query
        start: $stateParams.start
        end: $stateParams.end
    ,   ->
        $scope.showNoResult = $scope.buslines.length == 0


    $scope.viewDetailBusline = (id)->
        $state.go 'busline',
            id: id

    $scope.$on '$viewContentLoaded', (event)->
        $timeout ->
            Utils.fixTooLongIssue()
        , 100


    $scope.research = ->
        $state.go 'index'

    $scope.requestNewLine = ->
        start = $scope.cities[$scope.startCityId].name
        end = $scope.cities[$scope.endCityId].name
        msg = "您专属定制的#{start}-#{end}的路线小巴已经收到，将会尽快开通，届时将第一时间通知您！"
        alert(msg)
        $state.go 'index'


#    console.log $stateParams



# Use the User $resource to fetch all users
#    $scope.users = User.query();

#    $scope.delete = (user)->
#        User.remove({ id: user._id });
#        $scope.users.splice(this.$index, 1)


#    $scope.isLoggedIn = Auth.isLoggedIn
#    $scope.isAdmin = Auth.isAdmin
#    $scope.getCurrentUser = Auth.getCurrentUser