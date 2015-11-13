controller = require "./cities.controller"
auth = require '../../auth/auth.service'



module.exports = (router)->

    router.get "/test", (req, res, next)->
        res.send("test ok")



    router.get "/cities", controller.index
    router.get "/cities/:id", controller.show
    router.post "/cities", auth.hasRole('admin'), controller.create
    router.put "/cities/:id", auth.hasRole('admin'), controller.update
    router.patch '/cities/:id', auth.hasRole('admin'), controller.update
    router.delete '/cities/:id', auth.hasRole('admin'), controller.destroy