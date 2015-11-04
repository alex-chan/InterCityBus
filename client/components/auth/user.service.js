// Generated by CoffeeScript 1.10.0
(function() {
  angular.module('InterCityBus.services').factory('User', function($resource) {
    return $resource('/api/users/:id/:controller', {
      id: '@id'
    }, {
      changePassword: {
        method: 'PUT',
        params: {
          controller: 'password'
        }
      },
      get: {
        method: 'GET',
        params: {
          id: 'me'
        }
      }
    });
  });

}).call(this);

//# sourceMappingURL=user.service.js.map
