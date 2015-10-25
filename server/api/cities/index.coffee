controller = require "./cities.controller"


module.exports = (router)->

    router.get "/test", (req, res, next)->
        res.send("test ok")



    router.get "/cities", controller.index
    router.get "/cities/:id", controller.show
    router.post "/cities", controller.create
    router.put "/cities/:id", controller.update
    router.patch '/cities/:id', controller.update
    router.delete '/cities/:id', controller.destroy