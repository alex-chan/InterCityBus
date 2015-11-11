angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state('feedback', {
            url: '/feedback',
            templateUrl: 'app/feedback/feedback.html',
            controller: 'FeedbackController'

        })
