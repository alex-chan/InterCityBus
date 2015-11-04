angular.module('InterCityBus')
    .config ($stateProvider)->
        $stateProvider
            .state('login', {
                    url: '/admin/login',
                    templateUrl: 'app/admin/account/login/login.html',
                    controller: 'AdminLoginCtrl'
                })
            .state('logout', {
                    url: '/admin/logout?referrer',
                    referrer: 'main',
                    template: '',
                    controller: ($state, Auth)->
                        referrer = $state.params.referrer ||
                        $state.current.referrer || 'main';
                        Auth.logout();
                        $state.go(referrer);

            })
            .state('signup', {
                url: '/signup',
                templateUrl: 'app/account/signup/signup.html',
                controller: 'SignupCtrl'
            })
            .state('settings', {
                url: '/settings',
                templateUrl: 'app/account/settings/settings.html',
                controller: 'SettingsCtrl',
                authenticate: true
            })

    .run ($rootScope)->
        $rootScope.$on '$stateChangeStart', (event, next, nextParams, current)->
            if (next.name == 'logout' && current && current.name && !current.authenticate)
                next.referrer = current.name

