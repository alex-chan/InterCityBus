controller = require "./stations.controller"


module.exports = (router)->





    router.get "/stations", controller.index
    router.get "/stations/:id", controller.show
    router.post "/stations", controller.create
    router.put "/stations/:id", controller.update
    router.patch '/stations/:id', controller.update
    router.delete '/stations/:id', controller.destroy