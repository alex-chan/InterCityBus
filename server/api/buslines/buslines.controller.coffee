Model = require "../../lib/model"

handleError = (res, statusCode) ->
    statusCode = statusCode || 500
    return (err) ->
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



module.exports.index = (req, res)->
    Model.Busline.findAll()
        .then (buslines)->
            res.status 200
            .json buslines


module.exports.show = (req, res)->
    Model.Busline.findOne
        where:
            id: req.params.id

    .then handleEntityNotFound(res)
    .then responseWithResult(res)
    .catch handleError(res)


module.exports.update = (req, res)->

    Model.Busline.findOne
        where:
            id: req.params.id

    .then handleEntityNotFound(res)
    .then responseWithResult(res)
    .catch handleError(res)


module.exports.update = (req, res)->
    if (req.body._id)
        delete req.body.id


    Model.Busline.findOne
        where:
            id: req.params.id

    .then(handleEntityNotFound(res))
    .then(saveUpdates(req.body))
    .then(responseWithResult(res))
    .catch(handleError(res))
