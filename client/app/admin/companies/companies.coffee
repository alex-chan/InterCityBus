angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'companies',
        url: '/admin/companies'
        templateUrl: 'app/admin/companies/companies.html'
        controller: 'CompanyListCtrl'

    .state 'viewCompany',
        url: '/admin/companies/:id/view'
        templateUrl: 'app/admin/companies/company-view.html'
        controller: 'CompanyViewCtrl'

    .state 'newCompany',
        url: '/admin/companies/new'
        templateUrl: 'app/admin/companies/company-add.html'
        controller: 'CompanyCreateCtrl'

    .state 'editCompany',
        url: '/admin/companies/:id/edit'
        templateUrl: 'app/admin/companies/company-edit.html'
        controller: 'CompanyEditCtrl'
