myapp = angular.module('InterCityBus',
    ["ui.router","ngCookies","ngResource","validation.match","InterCityBus.services","InterCityBus.controllers"])

    # For any unmatched url, send to /route1

    .config ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider)->
#        $urlRouterProvider
#            .otherwise('/admin');

        $locationProvider.html5Mode(true);
        $httpProvider.interceptors.push('authInterceptor')





    .factory 'authInterceptor', ($rootScope, $q, $cookies, $injector)->

        return {} =
            # Add authorization token to headers
            request: (config)->
                config.headers = config.headers || {};

                if ($cookies.get('token'))
                    config.headers.Authorization = 'Bearer ' + $cookies.get('token');

                return config;


            # Intercept 401s and redirect you to login
            responseError: (response)->
                if (response.status == 401)
                    (state || (state = $injector.get('$state'))).go('login')
                    # remove any stale tokens
                    $cookies.remove('token');
                    return $q.reject(response);

                else
                    return $q.reject(response)


    .run ($rootScope, $state, Auth)->
        # Redirect to login if route requires auth and the user is not logged in
        $rootScope.$on '$stateChangeStart', (event, next)->
#            console.log event
#            console.log next
            if next.url.indexOf("/admin") == 0 and next.name != 'login'
                Auth.isLoggedIn (loggedIn)->
                    if (!loggedIn)
                        event.preventDefault()
                        $state.go('login')


#            if (next.authenticate)
#                Auth.isLoggedIn (loggedIn)->
#                    if (!loggedIn)
#                        event.preventDefault()
#                        $state.go('login')

#    $urlRouterProvider.otherwise("buslines")
#
#    $stateProvider
#    .state 'route1', {
#        url: "/route1",
#        templateUrl: "app/admin/route1.html"
#    }
#
#    .state 'route1.list', {
#        url: "list",
#        templateUrl: "app/admin/route1.list.html",
#        controller: ($scope)->
#            $scope.items = ["A", "List", "Of", "Items"]
#    }
#
#    .state('route2', {
#            url: "route2",
#            templateUrl: "app/admin/route2.html"
#        })
#
#    .state('route2.list', {
#            url: "list",
#            templateUrl: "app/admin/route2.list.html",
#            controller:  ($scope)->
#                $scope.things = ["A", "Set", "Of", "Things"]
#        })

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

.factory 'Starttime', ($resource)->
    return $resource '/api/starttimes/:id' ,{id: '@id'}, update:
        method: "PUT"

.factory 'Hotline', ($resource)->
    return $resource '/api/hotlines/:id' ,{id: '@id'}, update:
        method: "PUT"
