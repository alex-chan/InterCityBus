Model = require "../../lib/model"
_ = require "underscore"

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


module.exports.index = (req, res)->
    Model.City.findAll()
        .then responseWithResult(res)
        .catch handleError(res)


module.exports.show = (req, res)->
    Model.City.findOne
        where:
            id: req.params.id
    .then handleEntityNotFound(res)
    .then responseWithResult(res)
    .catch handleError(res)


module.exports.update = (req, res)->

    Model.City.findOne
        where:
            id: req.params.id

    .then handleEntityNotFound(res)
    .then(saveUpdates(req.body))
    .then responseWithResult(res)
    .catch handleError(res)


module.exports.create = (req, res)->



    Model.City.create(req.body)

    .then(responseWithResult(res, 201))
    .catch(handleError(res))



module.exports.destroy = (req, res)->
    if (req.body.id)
        delete req.body.id


    Model.City.findOne
        where:
            id: req.params.id

    .then(handleEntityNotFound(res))
    .then(removeEntity(res))
    .catch(handleError(res))
