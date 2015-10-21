angular.module('InterCityBus')
.config ($stateProvider)->
        $stateProvider
            .state('admin', {
                url: '/admin',
                templateUrl: '/admin/admin.html',
                controller: 'AdminCtrl'
            })
