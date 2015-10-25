myapp = angular.module('InterCityBus', ["ui.router","ngResource","InterCityBus.services","InterCityBus.controllers"])
myapp.config ($stateProvider, $urlRouterProvider)->

    # For any unmatched url, send to /route1

    $urlRouterProvider.otherwise("buslines")

    $stateProvider
    .state 'route1', {
        url: "/route1",
        templateUrl: "app/admin/route1.html"
    }

    .state 'route1.list', {
        url: "list",
        templateUrl: "app/admin/route1.list.html",
        controller: ($scope)->
            $scope.items = ["A", "List", "Of", "Items"]
    }

    .state('route2', {
            url: "route2",
            templateUrl: "app/admin/route2.html"
        })

    .state('route2.list', {
            url: "list",
            templateUrl: "app/admin/route2.list.html",
            controller:  ($scope)->
                $scope.things = ["A", "Set", "Of", "Things"]
        })


angular.module('InterCityBus.services',[])
.factory 'City', ($resource)->
    return $resource '/api/cities/:id' ,{id: '@id'}, update:
        method: "PUT"

.factory 'Busline', ($resource)->
    return $resource '/api/buslines/:id' ,{id: '@id'}, update:
                        method: "PUT"

.factory 'Company', ($resource)->
    return $resource '/api/companies/:id' ,{id: '@id'}, update:
        method: "PUT"

.factory 'Phone', ($resource)->
    return $resource '/api/phones/:id' ,{id: '@id'}, update:
        method: "PUT"

.factory 'Station', ($resource)->
    return $resource '/api/stations/:id' ,{id: '@id'}, update:
        method: "PUT"