angular.module('InterCityBus')
.controller 'BuslineController', ($scope, $window, $document, $stateParams , $http, $timeout, $interval, Busline, Utils)->

#    $document[0].onoffline = ->
#        alert 'onoffline'
#    $scope.finishBook = true

    $scope.dial = (phone)->

        $timeout ->
            $scope.finishBook = true
        , 5000


#        console.log 'phone:' + phone
        handler = $window.open("tel:"+phone)
#        $scope.xx =  handler
#        handler.onbeforeunload = (event)->
#            $scope.xx =  'sb'
#            alert "onbeforeunload"
#
#        handler.addEventListener "close", (event)->
#            $scope.xx =  'sb2'
#            alert "close"
#
#        handler.addEventListener 'loadstart', ->
#             alert('start: ')
#
#        handler.addEventListener 'loadstop', ->
#                alert('stop: ');
#
#        handler.addEventListener 'exit', ->
#            alert("sb5")


        return false

#    angular.element($window).bind 'orientationchange', ->
#        $timeout ->
#            Utils.fixTooLongIssue()
#        ,100


#    lastFired = new Date().getTime();
#    $interval ->
#        now = new Date().getTime();
#        if(now - lastFired > 5000)
#            alert("onfocus");
#
#        lastFired = now;
#        $scope.xx += 1000
#    , 500


##    $document.on 'visibilitychange', (event)->
#    $document[0].addEventListener "visibilitychange", ->
#        console.log this.xx
#        console.log $scope.xx
#
#        this.xx += 100
#        $scope.xx += 100
#
#        console.log this.xx
#        console.log $scope.xx
#
#
#
#        console.log $document[0].visibilityState
##        if $window.document.visibilityState != 'hidden'
##            alert $window.document.visibilityState



    $scope.purify = (str)->
        return str.replace(/\s+/g,"")

    $scope.busline = Busline.get
        id: $stateParams.id

#    $window.onblur = ->
##        alert("sb")
#        $scope.xx += 10
#
#
#    $window.onfocus = ->
#        $scope.xx += 1





    $scope.$on '$viewContentLoaded', (event)->

        $timeout ->
            Utils.fixTooLongIssue()
        , 100

        $timeout ->
            Utils.fixTooLongIssue()
        , 500

        $timeout ->
            Utils.fixTooLongIssue()
        , 2000

    $scope.closeit = ->
        $scope.finishBook = false

    $scope.shareit = ->
        $scope.shareIt = true
        $timeout ->
            $scope.shareIt = false
        , 10000



# Use the User $resource to fetch all users
#    $scope.users = User.query();

#    $scope.delete = (user)->
#        User.remove({ id: user._id });
#        $scope.users.splice(this.$index, 1)


#    $scope.isLoggedIn = Auth.isLoggedIn
#    $scope.isAdmin = Auth.isAdmin
#    $scope.getCurrentUser = Auth.getCurrentUser