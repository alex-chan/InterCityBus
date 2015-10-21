myapp = angular.module('InterCityBus', ["ui.router"])
myapp.config ($stateProvider, $urlRouterProvider)->

    # For any unmatched url, send to /route1

#    $urlRouterProvider.otherwise("route1")

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
