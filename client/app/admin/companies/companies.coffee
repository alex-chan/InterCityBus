angular.module('InterCityBus')
.config ($stateProvider)->
    $stateProvider
    .state 'companies',
        url: 'companies'
        templateUrl: 'app/admin/companies/companies.html'
        controller: 'CompanyListCtrl'

    .state 'viewCompany',
        url: 'companies/:id/view'
        templateUrl: 'app/admin/companies/company-view.html'
        controller: 'CompanyViewCtrl'

    .state 'newCompany',
        url: 'companies/new'
        templateUrl: 'app/admin/companies/company-add.html'
        controller: 'CompanyCreateCtrl'

    .state 'editCompany',
        url: 'companies/:id/edit'
        templateUrl: 'app/admin/companies/company-edit.html'
        controller: 'CompanyEditCtrl'