controller = require "./companies.controller"


module.exports = (router)->




    router.get "/companies", controller.index
    router.get "/companies/:id", controller.show
    router.post "/companies", controller.create
    router.put "/companies/:id", controller.update
    router.patch '/companies/:id', controller.update
    router.delete '/companies/:id', controller.destroy