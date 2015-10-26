controller = require "./starttimes.controller"


module.exports = (router)->





    router.get "/starttimes", controller.index
    router.get "/starttimes/:id", controller.show
    router.post "/starttimes", controller.create
    router.put "/starttimes/:id", controller.update
    router.patch '/starttimes/:id', controller.update
    router.delete '/starttimes/:id', controller.destroy