angular.module('InterCityBus')
.controller 'FeedbackController', ($scope, $http)->
    $scope.submitFeedback = ->

#        alert $scope.fbtype + $scope.fbcontent
        alert "您的反馈我们已经收到！"
        
