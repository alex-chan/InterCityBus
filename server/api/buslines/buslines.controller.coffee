Model = require "../../lib/model"
config = require "../../config/config"
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

#createOrUpdate = (entity, updates)->
#
#    .then ->
#        entity.setStations []
#    .then ->
#        entity.setStartTime []
#    .then ->
#        entity.setPhones []
#
#    .then ->
#
#        ids = _.map updates.stations, (item)->item.id
#        ids2 = ids.join(",")
#        ids2 = "0" if ids2 == ""
#
#        Model.Station.findAll
#            where:
#                id:
#                    in: ids
#            order:
#                [ Sequelize.literal("FIELD(id, "+ids2+")") ]
#
#    .then (stations)->
#        console.log "stations length:"+stations.length
#        entity.setStations stations
#
#    .then ->
#
#        tids = _.map updates.StartTime, (item)->item.id
#        tids2 = tids.join ","
#        tids2 = "0" if tids2 == ""
#
#        Model.Starttime.findAll
#            where:
#                id:
#                    in: tids
#            order:
#                [ Sequelize.literal("FIELD(id, "+tids2+")") ]
#
#    .then (starttimes)->
#        entity.setStartTime starttimes
#
#        .then ->
#        pids = _.map updates.phones, (item)->item.id
#        pids2 = pids.join ","
#        pids2 = "0" if pids2 == ""
#
#        Model.Phone.findAll
#            where:
#                id:
#                    in: pids
#            order:
#                [ Sequelize.literal("FIELD(id, "+pids2+")") ]
#
#    .then (phones)->
#        entity.setPhones phones
#    .then ()->
#        entity.save()

createRelated = (updates)->
    (entity)->
        entity.setStations []
        .then ->
            entity.setStartTime []
        .then ->
            entity.setPhones []


        .then ->

            ids = _.map updates.stations, (item)->item.id
            ids2 = ids.join(",")
            ids2 = "0" if ids2 == ""

            Model.Station.findAll
                where:
                    id:
                        in: ids
                order:
                    [ Sequelize.literal("FIELD(id, "+ids2+")") ]

        .then (stations)->
            console.log "stations length:"+stations.length
            entity.setStations stations

        .then ->

            tids = _.map updates.StartTime, (item)->item.id
            tids2 = tids.join ","
            tids2 = "0" if tids2 == ""

            Model.Starttime.findAll
                where:
                    id:
                        in: tids
                order:
                    [ Sequelize.literal("FIELD(id, "+tids2+")") ]

        .then (starttimes)->
            entity.setStartTime starttimes

        .then ->
            pids = _.map updates.phones, (item)->item.id
            pids2 = pids.join ","
            pids2 = "0" if pids2 == ""

            Model.Phone.findAll
                where:
                    id:
                        in: pids
                order:
                    [ Sequelize.literal("FIELD(id, "+pids2+")") ]

        .then (phones)->
            entity.setPhones phones
        .then ()->
            entity.save()
        .then ->
            return updates

saveUpdates = (updates)->
    (entity)->
        updatedOut = 0
        entity.update(updates)
            .then (updated)->

                updatedOut = updated

            .then ->
                entity.setStations []
            .then ->
                entity.setStartTime []
            .then ->
                entity.setPhones []

            .then ->

                ids = _.map updates.stations, (item)->item.id
                ids2 = ids.join(",")
                ids2 = "0" if ids2 == ""

                Model.Station.findAll
                    where:
                        id:
                            in: ids
                    order:
                        [ Sequelize.literal("FIELD(id, "+ids2+")") ]

            .then (stations)->
                console.log "stations length:"+stations.length
                entity.setStations stations

            .then ->

                tids = _.map updates.StartTime, (item)->item.id
                tids2 = tids.join ","
                tids2 = "0" if tids2 == ""

                Model.Starttime.findAll
                    where:
                        id:
                            in: tids
                    order:
                        [ Sequelize.literal("FIELD(id, "+tids2+")") ]

            .then (starttimes)->
                entity.setStartTime starttimes

            .then ->
                pids = _.map updates.phones, (item)->item.id
                pids2 = pids.join ","
                pids2 = "0" if pids2 == ""

                Model.Phone.findAll
                    where:
                        id:
                            in: pids
                    order:
                        [ Sequelize.literal("FIELD(id, "+pids2+")") ]

            .then (phones)->
                entity.setPhones phones
            .then ()->
                entity.save()
            .then ->
                return updatedOut


removeEntity = (res) ->
    return (entity)->
        if entity
            entity.destroy()
            .then ->
                res.status(204).end()


module.exports.hotlines = (req, res)->
    Model.Hotline.findAll
        limit: config.maxHotlines
        include: [
            {
                model: Model.City
                as: 'startCity'
            }, {
                model: Model.City
                as: 'endCity'
            }

        ],
        order: [
            [ 'queryCount', 'DESC'],
        ]
    .then responseWithResult(res)
    .catch handleError(res)

module.exports.index = (req, res)->

    where = {}
    if req.query and req.query.start and req.query.end
        where =
            startCityId: req.query.start
            endCityId: req.query.end


        Model.Hotline.findOrCreate
            where:
                startCityId: req.query.start
                endCityId: req.query.end
        .spread( (hotline, created)->
            hotline.queryCount += 1
            hotline.save()
        )

    Model.Busline.findAll
        where: where
        include: [
            {
                model: Model.City
                as: 'startCity'
            }, {
                model: Model.City
                as: 'endCity'
            },{
                model: Model.Station
            },
            Model.Company,
            {
                model: Model.Starttime
                as: 'StartTime'
            }

        ],
        order: [
            [ Model.Station, Model.BusLineStation, 'id', 'ASC'],
        ]
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
            },{
                model: Model.Station
            },
             Model.Company, Model.Phone,
            {
                model: Model.Starttime
                as: 'StartTime'
            }
        ],
        order: [
            #       ref:     https://github.com/sequelize/sequelize/issues/1250
            [ Model.Station, Model.BusLineStation, 'id', 'ASC'],
            [ { model: Model.Starttime, as: 'StartTime'} , Model.BusLineStartTime, 'id', 'ASC'],

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
