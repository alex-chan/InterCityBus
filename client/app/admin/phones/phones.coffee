angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'phones',
        url: '/admin/phones'
        templateUrl: 'app/admin/phones/phones.html'
        controller: 'PhoneListCtrl'

    .state 'viewPhone',
        url: '/admin/phones/:id/view'
        templateUrl: 'app/admin/phones/phone-view.html'
        controller: 'PhoneViewCtrl'

    .state 'newPhone',
        url: '/admin/phones/new'
        templateUrl: 'app/admin/phones/phone-add.html'
        controller: 'PhoneCreateCtrl'

    .state 'editPhone',
        url: '/admin/phones/:id/edit'
        templateUrl: 'app/admin/phones/phone-edit.html'
        controller: 'PhoneEditCtrl'
