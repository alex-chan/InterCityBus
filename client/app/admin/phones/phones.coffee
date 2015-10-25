angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'phones',
        url: 'phones'
        templateUrl: 'app/admin/phones/phones.html'
        controller: 'PhoneListCtrl'

    .state 'viewPhone',
        url: 'phones/:id/view'
        templateUrl: 'app/admin/phones/phone-view.html'
        controller: 'PhoneViewCtrl'

    .state 'newPhone',
        url: 'phones/new'
        templateUrl: 'app/admin/phones/phone-add.html'
        controller: 'PhoneCreateCtrl'

    .state 'editPhone',
        url: 'phones/:id/edit'
        templateUrl: 'app/admin/phones/phone-edit.html'
        controller: 'PhoneEditCtrl'
