express = require('express')
path = require "path"


router = express.Router()


_ = require "underscore"

Promise =  require("sequelize").Promise


model = require "../lib/model"
config = require "../config/config"

router.all "/", (req, res, next)->

    res.sendFile  path.join(config.root , 'client/desktop/index.html' )


router.all "/*", (req, res, next)->
    # TODO: use config path
    res.sendFile  path.join(config.root , 'client/app/index.html' )


fulfillHotlines = (hotline)->
    hotline.getStartCity()
    .then (city)->
        hotline.startCity =
            name: city.name
            id: city.id
        hotline.getEndCity()
    .then (city)->
        hotline.endCity =
            name: city.name
            id: city.id
        return hotline

#
## GET home page.
#router.get '/', (req, res, next)->
#
#    gcities = null
#    model.City.findAll()
#    .then (cities)->
#        gcities = cities
#        model.Hotline.findAll
#            limit: config.maxHotlines
#            order: [ ['queryCount', 'DESC']]
#    .then (hotlines)->
#
#        hotlines2 = _.map hotlines, (val,key,lst)->
#            fulfillHotlines val
#        Promise.all hotlines2
#
#    .then (hotlines)->
#
#        res.render 'index',
#            cities: gcities
#            hotlines: hotlines
#
#
#fulfillBusline = (busline)->
#    gbusline = busline
#
#    busline.getStartCity()
#    .then (city)->
#        gbusline.startCity =
#            id: city.id
#            name: city.name
#            stations: []
#        gbusline.getEndCity()
#    .then (city2)->
#        gbusline.endCity =
#            id: city2.id
#            name: city2.name
#            stations: []
#
#        gbusline.getStartTime()
#    .then (time)->
#        gbusline.starttimes = time
#        gbusline.getStations()
#    .then (stations)->
#        gbusline.stations = stations
#
#        _.each stations, (element, index, list)->
#            if element.cityId == gbusline.startCity.id
#                gbusline.startCity.stations.push element
#            else if element.cityId == gbusline.endCity.id
#                gbusline.endCity.stations.push element
#
#        return gbusline
#
#
#router.get '/busline/:id', (req, res, next)->
#
#    gbusline = null
#    model.Busline.findById req.params.id
#    .then (busline)->
#        fulfillBusline busline
#    .then (busline)->
#        gbusline = busline
#        busline.getPhones()
#    .then (phones)->
#        gbusline.phones = phones
#        return gbusline
#    .then (busline)->
#        res.render 'busline',
#            busline: busline
#
#
#
#router.get '/buslines', (req, res, next)->
#
#
#    model.Busline.findAll()
#    .then (buslines)->
#        buslines = _.map buslines, (val,key,lst)->
#            fulfillBusline val
#        Promise.all buslines
#
#    .then (buslines)->
#        res.render 'buslines',
#            buslines: buslines
#
#router.get '/search', (req, res, next)->
#
#
#
#    model.Hotline.findOrCreate
#        where:
#            startCityId: req.query.start
#            endCityId: req.query.end
#    .spread( (hotline, created)->
#        hotline.queryCount += 1
#        hotline.save()
#
#    ).then ->
#
#        model.Busline.findAll
#            where:
#                startCityId: req.query.start
#                endCityId: req.query.end
#
#
#    .then (buslines)->
#
#
#
#        buslines = _.map buslines, (val,key,lst)->
#            fulfillBusline val
#
#
#
#        Promise.all buslines
#
#    .then (buslines)->
##        if buslines.length == 0
##            res.render 'nobus'
##        else
#        res.render 'buslines',
#            buslines: buslines
#
#    .catch (err)->
#        res.end err.toString()
#
#router.get '/cities', (req, res, next)->
#    model.City.findAll().then (cities)->
#        res.render 'city',
#            cities: cities
#
#
#
#router.get '/info', (req, res, next)->
#    res.render 'info'
#
#router.get '/contact', (req, res, next)->
#    res.render 'contact'

module.exports = router
