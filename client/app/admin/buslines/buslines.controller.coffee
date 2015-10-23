angular.module('InterCityBus.controllers',[])
.controller 'BuslineListCtrl', ($scope, $http, Busline)->
    $scope.buslines = Busline.query()

# Use the User $resource to fetch all users
#    $scope.users = User.query();

#    entry = Busline.get
#        id: $scope.id, ->
#            console.log entry


#
#    entries = Busline.query ->
#        console.log entries
#        $scope.buslines = entries



#    $http.get "/api/buslines"
#        .success (data)->
#            $scope.buslines = data

#    $scope.delete = (user)->
#        User.remove({ id: user._id });
#        $scope.users.splice(this.$index, 1)

.controller 'BuslineViewCtrl', ($scope, $stateParams, Busline)->
    $scope.busline = Busline.get
        id: $stateParams.id


.controller 'BuslineCreateCtrl', ($scope, $state, $stateParams, Busline)->

    $scope.busline = new Busline()
    $scope.addBusline = ->
        $scope.busline.$save ->
            $state.go "buslines"


.controller 'BuslineEditCtrl', ($scope, $state, $stateParams, Busline)->

    $scope.updateBusline = ->

        console.log $scope.busline

        $scope.busline.$update ->
            $state.go "buslines"


    $scope.loadBusline = ->
        $scope.busline = Busline.get
            id: $stateParams.id

    $scope.loadBusline()
