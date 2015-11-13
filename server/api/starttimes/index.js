// Generated by CoffeeScript 1.10.0
(function() {
  var auth, controller;

  controller = require("./starttimes.controller");

  auth = require('../../auth/auth.service');

  module.exports = function(router) {
    router.get("/starttimes", controller.index);
    router.get("/starttimes/:id", controller.show);
    router.post("/starttimes", auth.hasRole('admin'), controller.create);
    router.put("/starttimes/:id", auth.hasRole('admin'), controller.update);
    router.patch('/starttimes/:id', auth.hasRole('admin'), controller.update);
    return router["delete"]('/starttimes/:id', auth.hasRole('admin'), controller.destroy);
  };

}).call(this);

//# sourceMappingURL=index.js.map
