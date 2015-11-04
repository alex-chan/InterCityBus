angular.module('InterCityBus')
.config ($stateProvider)->
        $stateProvider
            .state('admin', {
                url: '/admin',
                templateUrl: '/admin/index.html',
                controller: 'AdminCtrl'

            })
