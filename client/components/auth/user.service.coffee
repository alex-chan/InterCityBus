angular.module('InterCityBus.services')
.factory 'User', ($resource)->
    return $resource '/api/users/:id/:controller', {
        id: '@id'
    },
    {
        changePassword:
            method: 'PUT',
            params:
                controller:'password'

        get:
            method: 'GET',
            params:
                id:'me'


    }
