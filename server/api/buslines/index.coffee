controller = require "./buslines.controller"


module.exports = (router)->

    router.get "/test", (req, res, next)->
        res.send("test ok")



    router.get "/buslines", controller.index
    router.get "/buslines/:id", controller.show
    router.post "/buslines", controller.create
    router.put "/buslines/:id", controller.update
    router.patch '/buslines/:id', controller.update
    router.delete '/buslines/:id', controller.destroy