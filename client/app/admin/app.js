// Generated by CoffeeScript 1.10.0
(function() {
  var myapp;

  myapp = angular.module('InterCityBus', ["ui.router", "ngCookies", "ngResource", "validation.match", "InterCityBus.services", "InterCityBus.controllers"]).config(function($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider) {
    $locationProvider.html5Mode(true);
    return $httpProvider.interceptors.push('authInterceptor');
  }).factory('authInterceptor', function($rootScope, $q, $cookies, $injector) {
    return {
      request: function(config) {
        config.headers = config.headers || {};
        if ($cookies.get('token')) {
          config.headers.Authorization = 'Bearer ' + $cookies.get('token');
        }
        return config;
      },
      responseError: function(response) {
        var state;
        if (response.status === 401) {
          (state || (state = $injector.get('$state'))).go('login');
          $cookies.remove('token');
          return $q.reject(response);
        } else {
          return $q.reject(response);
        }
      }
    };
  }).run(function($rootScope, $state, Auth) {
    return $rootScope.$on('$stateChangeStart', function(event, next) {
      if (next.url.indexOf("/admin") === 0 && next.name !== 'login') {
        return Auth.isLoggedIn(function(loggedIn) {
          if (!loggedIn) {
            event.preventDefault();
            return $state.go('login');
          }
        });
      }
    });
  });

  angular.module('InterCityBus.services', []).factory('City', function($resource) {
    return $resource('/api/cities/:id', {
      id: '@id'
    }, {
      update: {
        method: "PUT"
      }
    });
  }).factory('Busline', function($resource) {
    return $resource('/api/buslines/:id', {
      id: '@id'
    }, {
      update: {
        method: "PUT"
      }
    });
  }).factory('Company', function($resource) {
    return $resource('/api/companies/:id', {
      id: '@id'
    }, {
      update: {
        method: "PUT"
      }
    });
  }).factory('Phone', function($resource) {
    return $resource('/api/phones/:id', {
      id: '@id'
    }, {
      update: {
        method: "PUT"
      }
    });
  }).factory('Station', function($resource) {
    return $resource('/api/stations/:id', {
      id: '@id'
    }, {
      update: {
        method: "PUT"
      }
    });
  }).factory('Starttime', function($resource) {
    return $resource('/api/starttimes/:id', {
      id: '@id'
    }, {
      update: {
        method: "PUT"
      }
    });
  });

}).call(this);

//# sourceMappingURL=app.js.map
