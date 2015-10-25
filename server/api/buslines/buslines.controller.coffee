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
#        console.log "entity:" + entity
#        console.log "entitystartCity:" + entity.startCity
#        console.log "entity startCity name:" + entity.startCity.name
        console.log  JSON.stringify(entity)

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


innerFulfillBusline = (busline)->

    console.log "innerFulfillBusline"

    gbusline = busline

    busline.getStartCity()
    .then (city)->
        gbusline.startCity =
            id: city.id
            name: city.name
            stations: []
        gbusline.getEndCity()
    .then (city2)->
        gbusline.setDataValue 'endCity',
            id: city2.id
            name: city2.name
            stations: []

#        gbusline.save()

#        console.sb("sb")

#        console "endCityObject:" + gbusline.getDataValue 'endCity'

#        gbusline.getCompany()
#
#    .then (company)->
#        gbusline.company =
#            id : company.id
#            name: company.name

        gbusline.getStartTime()

    .then (time)->
        gbusline.starttimes = time
        gbusline.getStations()
    .then (stations)->
        gbusline.stations = stations

        _.each stations, (element, index, list)->
            console.log "element:" + element
            if element.cityId == gbusline.startCity.id
                gbusline.startCity.stations.push element
#            else if element.cityId == gbusline.get('endCity').id
#                gbusline.endCity.stations.push element

        console.log "get stations:" + stations
        console.log "gbusline startCity:" + gbusline.startCity.name

        return gbusline

fulfillBusline = (res)->
    (busline)->

        if Array.isArray busline
            busline2 = _.map busline, (val,key,lst)->
                innerFulfillBusline val
            Promise.all busline2

        else
            innerFulfillBusline busline


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
            Model.Station, Model.Company, Model.Phone ]
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
            Model.Station, Model.Company,  Model.Phone ]

    .then handleEntityNotFound(res)
    .then(saveUpdates(req.body))
    .then responseWithResult(res)
    .catch handleError(res)


module.exports.create = (req, res)->



    Model.Busline.create(req.body)

    .then(responseWithResult(res, 201))
    .catch(handleError(res))



module.exports.destroy = (req, res)->
    if (req.body.id)
        delete req.body.id


    Model.Busline.findOne
        where:
            id: req.params.id

    .then(handleEntityNotFound(res))
    .then(removeEntity(req.body))
    .catch(handleError(res))
