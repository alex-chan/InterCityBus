angular.module('InterCityBus.controllers')
.controller 'BuslineListCtrl', ($state, $scope, $http, $window, Busline)->
    $scope.buslines = Busline.query()


    $scope.deleteBusline = (busline)->
        busline.$remove ->
            $state.go $state.current, {}, {reload: true}


.controller 'BuslineViewCtrl', ($scope, $stateParams, Busline)->
    $scope.busline = Busline.get
        id: $stateParams.id


.controller 'BuslineCreateCtrl', ($scope, $state, $stateParams, Busline, City, Company, Station, Starttime, Phone)->

    # TODO: merge Create and Edit common functions

    $scope.cities = City.query()
    $scope.companies = Company.query()
    $scope.stations = Station.query()

    $scope.busline = new Busline()
    $scope.starttimes = Starttime.query()
    $scope.phones = Phone.query()


    $scope.addBusline = ->
        $scope.busline.$save ->
            $state.go "buslines"

    $scope.addPhone = (index)->
        $scope.busline.phones = [] if !$scope.busline.phones
        if $scope.busline.phones.indexOf(this.phoneToAdd[index]) == -1
            $scope.busline.phones.splice index, 0, this.phoneToAdd[index]


    $scope.addStarttime = (index)->
        if !$scope.busline.StartTime
            $scope.busline.StartTime = []

        if $scope.busline.StartTime.indexOf(this.starttimeToAdd[index]) == -1
            $scope.busline.StartTime.splice index, 0, this.starttimeToAdd[index]


    $scope.addStation = (index, isEndCity)->
        toInsertPos = index


        if isEndCity
            startStations = $scope.busline.stations.filter (item)->
                if item.cityId == $scope.busline.startCityId
                    return true
                else
                    return false

            toInsertPos +=  startStations.length
            toAddStation = this.stationToAdd2[index]

        else
            toAddStation = this.stationToAdd[index]

        if !$scope.busline.stations
            $scope.busline.stations = []

        if $scope.busline.stations.indexOf(toAddStation) == -1
            $scope.busline.stations.splice toInsertPos, 0, toAddStation

    $scope.delPhone = (index)->
        $scope.busline.phones.splice index, 1
    $scope.delStarttime = (index)->
        $scope.busline.StartTime.splice index, 1
    $scope.delStation = (index, isEndCity)->
        toInsertPos = index

        if isEndCity
            startStations = $scope.busline.stations.filter (item)->
                if item.cityId == $scope.busline.startCityId
                    return true
                else
                    return false

            toInsertPos +=  startStations.length


        $scope.busline.stations.splice toInsertPos, 1
        return

.controller 'BuslineEditCtrl', ($scope, $state, $stateParams, Busline, City, Company, Station, Starttime, Phone)->


    $scope.cities = City.query()
    $scope.companies = Company.query()
    $scope.stations = Station.query()
    $scope.starttimes = Starttime.query()
    $scope.phones = Phone.query()

    $scope.addPhone = (index)->
        if !$scope.busline.phones
            $scope.busline.phones = []

        if $scope.busline.phones.indexOf(this.phoneToAdd[index]) == -1
            $scope.busline.phones.splice index, 0, this.phoneToAdd[index]


    $scope.delPhone = (index)->
        $scope.busline.phones.splice index, 1

    $scope.addStarttime = (index)->
        if !$scope.busline.StartTime
            $scope.busline.StartTime = []

        if $scope.busline.StartTime.indexOf(this.starttimeToAdd[index]) == -1
            $scope.busline.StartTime.splice index, 0, this.starttimeToAdd[index]

    $scope.delStarttime = (index)->
        $scope.busline.StartTime.splice index, 1


    $scope.addStation = (index, isEndCity)->
        toInsertPos = index

        if isEndCity
            startStations = $scope.busline.stations.filter (item)->
                if item.cityId == $scope.busline.startCityId
                    return true
                else
                    return false

            toInsertPos +=  startStations.length
            toAddStation = this.stationToAdd2[index]

        else
            toAddStation = this.stationToAdd[index]

        if $scope.busline.stations.indexOf(toAddStation) == -1
            $scope.busline.stations.splice toInsertPos, 0, toAddStation


    $scope.delStation = (index, isEndCity)->
        toInsertPos = index

        if isEndCity
            startStations = $scope.busline.stations.filter (item)->
                if item.cityId == $scope.busline.startCityId
                    return true
                else
                    return false

            toInsertPos +=  startStations.length


        $scope.busline.stations.splice toInsertPos, 1
        return


    $scope.loadBusline = ->

            $scope.updateBusline = ->
                $scope.busline.$update ->
#                    $state.go "viewBusline({id:"+$scope.busline.id+"})"
                    $state.go "buslines"

            $scope.busline = Busline.get
                id: $stateParams.id



    $scope.loadBusline()

