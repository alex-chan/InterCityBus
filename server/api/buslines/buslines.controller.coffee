Model = require "../../lib/model"
Sequelize = require "../../lib/dbconn"

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

createOrUpdate = (entity, updates)->

    ids = _.map updates.stations, (item)->item.id
    ids2 = ids.join(",")
    if ids2 == ""
        ids2 = "0"

    Model.Station.findAll
        where:
            id:
                in: ids
        order:
            [ Sequelize.literal("FIELD(id, "+ids2+")") ]

    .then (stations)->
        entity.setStations []
        return stations
    .then (stations)->
        entity.setStations stations

    .then ->

        tids = _.map updates.StartTime, (item)->item.id
        tids2 = tids.join ","
        if tids2 == ""
            tids2 = "0"
        Model.Starttime.findAll
            where:
                id:
                    in: tids
            order:
                [ Sequelize.literal("FIELD(id, "+tids2+")") ]

    .then (starttimes)->
        entity.setStartTime []
        return starttimes
    .then (starttimes)->
        entity.setStartTime starttimes

    .then ->
        pids = _.map updates.phones, (item)->item.id
        pids2 = pids.join ","


        if pids2 == ""
            pids2 = "0"

        Model.Phone.findAll
            where:
                id:
                    in: pids
            order:
                [ Sequelize.literal("FIELD(id, "+pids2+")") ]

    .then (phones)->
        entity.setPhones []
        return phones
    .then (phones)->
        entity.setPhones phones

        return updates

createRelated = (updates)->
    (entity)->

        createOrUpdate(entity, updates)

#        ids = _.map updates.stations, (item)->item.id
#        ids2 = ids.join(",")
#
#        Model.Station.findAll
#            where:
#                id:
#                    in: ids
#            order:
#                [ Sequelize.literal("FIELD(id, "+ids2+")") ]
#
#        .then (stations)->
#            entity.setStations stations
#
#        .then ->
#
#            tids = _.map updates.StartTime, (item)->itemd.id
#            tids2 = tids.join ","
#            Model.Starttime.findAll
#                where:
#                    id:
#                        in: tids
#                    order:
#                        [ Sequelize.literal("FIELD(id, "+tids2+")") ]
#
#        .then (starttimes)->
#            entity.setStartTime starttimes
        .then ->
            return updates

saveUpdates = (updates)->
    (entity)->
        updatedOut = 0
        entity.update(updates)
            .then (updated)->

                updatedOut = updated

                createOrUpdate entity, updated

            .then ->
                return updatedOut


removeEntity = (res) ->
    return (entity)->
        if entity
            entity.destroy()
            .then ->
                res.status(204).end()


module.exports.index = (req, res)->
    Model.Busline.findAll include: [
        {
            model: Model.City
            as: 'startCity',
        }, {
            model: Model.City
            as: 'endCity'
        },
            Model.Station, Model.Company ]
        .then responseWithResult(res)
        .catch handleError(res)


module.exports.show = (req, res)->
    Model.Busline.findOne
        where:
            id: req.params.id
        include: [
            {
                model: Model.City
                as: 'startCity',
            }, {
                model: Model.City
                as: 'endCity'
            },
            Model.Station, Model.Company, Model.Phone,
            {
                model: Model.Starttime
                as: 'StartTime'
            }
        ]
    .then handleEntityNotFound(res)
    .then responseWithResult(res)
    .catch handleError(res)


module.exports.update = (req, res)->

    Model.Busline.findOne
        where:
            id: req.params.id
        include: [
            {
                model: Model.City
                as: 'startCity',
            }, {
                model: Model.City
                as: 'endCity'
            },
            Model.Station, Model.Company,  Model.Phone,
            {
                model: Model.Starttime
                as: 'StartTime'
            }

        ]

    .then handleEntityNotFound(res)
    .then saveUpdates(req.body)
    .then responseWithResult(res)
    .catch handleError(res)


module.exports.create = (req, res)->



    Model.Busline.create(req.body)
    .then createRelated(req.body)
    .then (responseWithResult(res, 201))
    .catch(handleError(res))



module.exports.destroy = (req, res)->
    if (req.body.id)
        delete req.body.id


    Model.Busline.findOne
        where:
            id: req.params.id

    .then handleEntityNotFound(res)
    .then removeEntity(res)
    .catch handleError(res)
