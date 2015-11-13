controller = require "./stations.controller"
auth = require '../../auth/auth.service'

module.exports = (router)->





    router.get "/stations", auth.hasRole('admin'),controller.index
    router.get "/stations/:id", auth.hasRole('admin'), controller.show
    router.post "/stations", auth.hasRole('admin'),controller.create
    router.put "/stations/:id", auth.hasRole('admin'),controller.update
    router.patch '/stations/:id', auth.hasRole('admin'),controller.update
    router.delete '/stations/:id',auth.hasRole('admin'), controller.destroy