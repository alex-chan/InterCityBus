controller = require "./phones.controller"


module.exports = (router)->





    router.get "/phones", controller.index
    router.get "/phones/:id", controller.show
    router.post "/phones", controller.create
    router.put "/phones/:id", controller.update
    router.patch '/phones/:id', controller.update
    router.delete '/phones/:id', controller.destroy