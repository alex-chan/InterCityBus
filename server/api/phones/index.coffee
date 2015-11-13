controller = require "./phones.controller"
auth = require '../../auth/auth.service'



module.exports = (router)->





    router.get "/phones", auth.hasRole('admin'), controller.index
    router.get "/phones/:id", auth.hasRole('admin'), controller.show
    router.post "/phones", auth.hasRole('admin'), controller.create
    router.put "/phones/:id", auth.hasRole('admin'), controller.update
    router.patch '/phones/:id', auth.hasRole('admin'), controller.update
    router.delete '/phones/:id', auth.hasRole('admin'), controller.destroy