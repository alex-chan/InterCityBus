controller = require "./buslines.controller"
auth = require '../../auth/auth.service'

module.exports = (router)->




    router.get "/buslines", controller.index
    router.get "/buslines/:id", controller.show
    router.post "/buslines", auth.hasRole('admin'), controller.create
    router.put "/buslines/:id", auth.hasRole('admin'), controller.update
    router.patch '/buslines/:id',auth.hasRole('admin'),  controller.update
    router.delete '/buslines/:id', auth.hasRole('admin'), controller.destroy


    router.get "/hotlines", controller.hotlines
    router.post "/hotlines", controller.requestline
