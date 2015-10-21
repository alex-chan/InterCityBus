controller = require "./busline.controller"


module.exports = (router)->

    router.get "/test", (req, res, next)->
        res.send("test ok")



    router.get "/buslines", controller.index
