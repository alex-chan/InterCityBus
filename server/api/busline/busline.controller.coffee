Model = require "../../lib/model"

module.exports.index = (req, res)->
    Model.Busline.findAll()
        .then (buslines)->
            res.status 200
            .json buslines

