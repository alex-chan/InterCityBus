controller = require "./users.controller"
auth = require '../../auth/auth.service'

module.exports = (router)->





    router.get "/users", auth.hasRole('admin'), controller.index
    router.delete "/users/:id", auth.hasRole('admin'), controller.destroy
    router.get "/users/me", auth.isAuthenticated(), controller.me
    router.put('/users/:id/password', auth.isAuthenticated(), controller.changePassword);
    router.get('/users/:id', auth.isAuthenticated(), controller.show);
    router.post('/users', auth.hasRole('admin'), controller.create);