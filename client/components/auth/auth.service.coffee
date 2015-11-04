
angular.module('InterCityBus.services')
.factory 'Auth',  Auth = ($http, User, $cookies, $q)->
        ###
         * Return a callback or noop function
         *
         * @param  {Function|*} cb - a 'potential' function
         * @return {Function}
        ###
        safeCb = (cb)->
            return if (angular.isFunction(cb)) then cb else angular.noop;


        currentUser = {}
        currentUser = User.get() if ($cookies.get('token'))

        return {} =
            ###
           * Authenticate user and save token
           *
           * @param  {Object}   user     - login info
           * @param  {Function} callback - optional, function(error, user)
           * @return {Promise}
            ###
            login: (user, callback) ->
                return $http.post '/auth/local', {
                    name: user.name,
                    password: user.password
                }
                .then (res)->
                    $cookies.put('token', res.data.token);
                    currentUser = User.get();
                    return currentUser.$promise

                .then (user)->
                    safeCb(callback)(null, user)
                    return user

                .catch ((err)->
                        this.logout()
                        safeCb(callback)(err.data)
                        return $q.reject(err.data)
                    ).bind(this)


            ###
                   * Delete access token and user info
            ###
            logout: () ->
                $cookies.remove('token')
                currentUser = {};


            ###
                   * Create a new user
                   *
                   * @param  {Object}   user     - user info
                   * @param  {Function} callback - optional, function(error, user)
                   * @return {Promise}
            ###
            createUser: (user, callback)->
                return User.save(user,
                    (data)->
                        $cookies.put('token', data.token)
                        currentUser = User.get()
                        return safeCb(callback)(null, user)
                , ( (err)->
                    this.logout()
                    return safeCb(callback)(err)

                    ).bind(this)
                ).$promise


            ###
                   * Change password
                   *
                   * @param  {String}   oldPassword
                   * @param  {String}   newPassword
                   * @param  {Function} callback    - optional, function(error, user)
                   * @return {Promise}
            ###
            changePassword: (oldPassword, newPassword, callback)->
                return User.changePassword({ id: currentUser.id }, {
                    oldPassword: oldPassword,
                    newPassword: newPassword
                }, ->
                    return safeCb(callback)(null)
                , (err)->
                    return safeCb(callback)(err)
                ).$promise;


            ###
                   * Gets all available info on a user
                   *   (synchronous|asynchronous)
                   *
                   * @param  {Function|*} callback - optional, funciton(user)
                   * @return {Object|Promise}
            ###
            getCurrentUser: (callback)->
                if (arguments.length == 0)
                    return currentUser;


                value = if (currentUser.hasOwnProperty('$promise')) then currentUser.$promise else currentUser
                return $q.when(value)
                .then (user)->
                    safeCb(callback)(user)
                    return user;
                , ->
                    safeCb(callback)({})
                    return {};


            ###
                   * Check if a user is logged in
                   *   (synchronous|asynchronous)
                   *
                   * @param  {Function|*} callback - optional, function(is)
                   * @return {Bool|Promise}
            ###
            isLoggedIn: (callback)->
                if (arguments.length == 0)
                    return currentUser.hasOwnProperty('role');


                return this.getCurrentUser(null)
                .then (user)->
                    itis = user.hasOwnProperty('role');
                    safeCb(callback)(itis)
                    return itis


            ###
                    * Check if a user is an admin
                    *   (synchronous|asynchronous)
                    *
                    * @param  {Function|*} callback - optional, function(is)
                    * @return {Bool|Promise}
            ###
            isAdmin: (callback)->
                if (arguments.length == 0)
                    return currentUser.role == 'admin'


                return this.getCurrentUser(null)
                .then (user)->
                    itis = user.role == 'admin'
                    safeCb(callback)(itis)
                    return itis


            ###
                   * Get auth token
                   *
                   * @return {String} - a token string used for authenticating
            ###
            getToken: ->
                return $cookies.get('token')
