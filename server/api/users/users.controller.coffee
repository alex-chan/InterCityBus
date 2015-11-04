config = require "../../config/config"
model = require "../../lib/model"
_ = require "underscore"
jwt = require "jsonwebtoken"

validationError = (res, statusCode)->
    statusCode = statusCode || 422;
    return (err)->
        res.status(statusCode).json(err)


handleError = (res, statusCode) ->
    statusCode = statusCode || 500
    return (err) ->
        console.log "error:"+err
        console.log "error stack:"+err.stack

        res.status(statusCode).send(err)


handleEntityNotFound = (res)->
    return (entity)->
        if (!entity)
            res.status(404).end();
            return null;

        return entity;



responseWithResult = (res, statusCode) ->
    statusCode = statusCode || 200;
    return (entity) ->

        if (entity)

            res.status(statusCode).json(entity)

saveUpdates = (updates)->
    (entity)->
        entity.updateAttributes(updates)
        .then (updated)->
            return updated


removeEntity = (res) ->
    (entity)->
        if entity
            entity.destroy()
            .then ->
                res.status(204).end()




###
 * Get list of users
 * restriction: 'admin'
###
module.exports.index = (req, res)->
    model.User.findAll
        attributes: [
            'id',
            'name',
            'email',
            'role',
            'provider'
        ]

    .then (users)->
        res.status(200).json(users)
    .catch(handleError(res))




module.exports.show = (req, res)->
    userId = req.params.id;

    model.User.find
        where:
            id: userId

    .then (user)->
        if (!user)
            return res.status(404).end();

        res.json(user.profile)

    .catch (err)->
        return next(err);






module.exports.create = (req, res)->
    newUser = model.User.build(req.body);
    newUser.setDataValue('provider', 'local');
    newUser.setDataValue('role', 'user');
    newUser.save()
    .then (user)->
        token = jwt.sign({ id: user.id }, config.secrets.session, {
            expiresIn: 60 * 60 * 2
        });
        res.json({ token: token })
    .catch(validationError(res))




module.exports.destroy = (req, res)->

    model.User.destroy({ id: req.params.id })
    .then ->
        res.status(204).end()
    .catch(handleError(res));




module.exports.changePassword = (req, res, next)->
    userId = req.user.id
    oldPass = String(req.body.oldPassword)
    newPass = String(req.body.newPassword)

    model.User.find
        where:
            id: userId
    .then (user)->
        if user.authenticate(oldPass)
            user.password = newPass
            return user.save()
                .then ->
                    res.status(204).end()
                .catch(validationError(res))
        else
            return res.status(403).end();


module.exports.me = (req, res, next)->
    userId = req.user.id;

    model.User.find
        where:
            id: userId
        attributes: [
            'id',
            'name',
            'email',
            'role',
            'provider'
        ]

    .then (user)->  # don't ever give out the password or salt
        if (!user)
            return res.status(401).end();

        res.json(user);

    .catch (err)->
        return next(err)
