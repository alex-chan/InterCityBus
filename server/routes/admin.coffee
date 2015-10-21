express = require('express')
router = express.Router()
path = require "path"

_ = require "underscore"

Promise =  require("sequelize").Promise


model = require "../lib/model"
config = require "../config/config"
#app = require "../config/express"

#console.log app
#console.log config
#console.log model
#console.log app.get("env")

router.all "/*", (req, res, next)->

    # TODO: use config path
    res.sendFile  path.join(config.root , 'client/app/admin/index.html' )


#router.all("/*")
#    .get (req,res)->
#
#        console.log(  path.resolve( app.get('appRoot') + '/client/admin/index.html' ) )
#
#        res.sendFile( path.resolve( app.get('appRoot') + '/client/admin/index.html' )  )

module.exports = router

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
#router.get '/cities', (req, res, next)->
#

