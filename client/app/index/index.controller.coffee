angular.module('InterCityBus')
.controller 'IndexController', ($state, $rootScope, $scope, $timeout, $http, City, Hotline)->

    $scope.$on '$stateChangeSuccess',  (ev, to, toParams, from, fromParams)->

        if to.name == 'index' and fromParams.start and fromParams.end

            $scope.cities.$promise.then ->
                $scope.startCity = $scope.cities[ fromParams.start - 1]
                $scope.endCity =  $scope.cities[  fromParams.end - 1]




    $scope.swapCity = ()->
        tmp = this.startCity
        this.startCity = this.endCity
        this.endCity =  tmp


    $scope.cities = City.query()

    $scope.hotlines = Hotline.query()

    $scope.search = (start, end)->
        $state.go 'search',
            start: start
            end: end


    $scope.searchBusline = ()->


        if !this.startCity or !this.endCity
            alert "必须选好出发和终点城市哦"
            return


        if this.startCity.id == this.endCity.id
            alert "出发地和终点地不能一样哦"
            return



        $state.go 'search',
            start: this.startCity.id
            end: this.endCity.id









#    showCities: ->


# Use the User $resource to fetch all users
#    $scope.users = User.query();

#    $scope.delete = (user)->
#        User.remove({ id: user._id });
#        $scope.users.splice(this.$index, 1)


#    $scope.isLoggedIn = Auth.isLoggedIn
#    $scope.isAdmin = Auth.isAdmin
#    $scope.getCurrentUser = Auth.getCurrentUser