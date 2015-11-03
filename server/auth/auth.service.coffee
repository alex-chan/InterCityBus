jwt  = require 'jsonwebtoken';
expressJwt = require 'express-jwt'
compose = require 'composable-middleware';
User = require('../lib/model').User

secret = 'dsafsafas'

validateJwt = expressJwt
    secret: secret #config.secrets.session



isAuthenticated = ->
    return compose()
        # Validate jwt
        .use( (req, res, next)->
                # allow access_token to be passed through query parameter as well
            if (req.query && req.query.hasOwnProperty('access_token'))
                req.headers.authorization = 'Bearer ' + req.query.access_token

            validateJwt(req, res, next);
        )
        # Attach user to request
        .use (req, res, next)->
            User.find
                where:
                    id: req.user.id
            .then (user)->
                return res.status(401).end() if (!user)
                req.user = user
                next()

            .catch (err)->
                return next(err);

###
 * Checks if the user role meets the minimum requirements of the route
###
hasRole = (roleRequired)->
    if (!roleRequired)
        throw new Error('Required role needs to be set')


    return compose()
    .use(isAuthenticated())
    .use  meetsRequirements=(req, res, next)->
            if (config.userRoles.indexOf(req.user.role) >= config.userRoles.indexOf(roleRequired))
                next()

            else
                res.status(403).send('Forbidden')


###
 * Returns a jwt token signed by the app secret
###
signToken = (id, role)->
    return jwt.sign { id: id, role: role }, secret, #config.secrets.session,
        expiresInMinutes: 60 * 5


###
 * Set token cookie directly for oAuth strategies
###
setTokenCookie = (req, res)->
    if (!req.user)
        return res.status(404).send('Something went wrong, please try again.')

    token = signToken(req.user.id, req.user.role)
    res.cookie('token', token)
    res.redirect('/')


exports.isAuthenticated = isAuthenticated
exports.hasRole = hasRole
exports.signToken = signToken
exports.setTokenCookie = setTokenCookie
