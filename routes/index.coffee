express = require('express')
router = express.Router()

_ = require "underscore"

Promise =  require("sequelize").Promise


model = require "../lib/model"

# GET home page.
router.get '/', (req, res, next)->
    res.render 'index',
            title: 'InterCity Bus!'



router.get '/buslines', (req, res, next)->

    model.Busline.findAll().then (buslines)->

        bus = _.map buslines, (val,key,lst)->

            val.getStartCity().then (city)->
                lst[key].startCity = city.name

                val.getEndCity().then (city2)->
                    lst[key].endCity = city2.name

                    val.getStartTime().then (tm)->
                        lst[key].startTime = tm

                        return Promise.resolve()



        Promise.all bus
        .then ->
            console.log buslines[0].startCity
            res.render 'busline',
                buslines: buslines



router.get '/cities', (req, res, next)->
    model.City.findAll().then (cities)->


        res.render 'city',
            cities: cities


module.exports = router
