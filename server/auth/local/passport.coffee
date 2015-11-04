passport = require 'passport'
LocalStrategy = require('passport-local').Strategy

localAuthenticate = (User, name, password, done)->
    User.find
        where:
            name: name

    .then (user)->
        if (!user)
            return done(null, false, {
                message: 'Username does not exists or username/password mismatch'
            });

        user.authenticate password, (authError, authenticated)->

            return done(authError) if (authError)

            if !authenticated
                return done null, false,
                    message: 'Username does not exists or username/password mismatch'
            else
                return done(null, user)

    .catch (err)->
        return done(err)


exports.setup = (User, config)->
    passport.use( new LocalStrategy(
            usernameField: 'name',
            passwordField: 'password' # this is the virtual field on the model
         , (email, password, done)->
                return localAuthenticate(User, email, password, done)
        )
    )
