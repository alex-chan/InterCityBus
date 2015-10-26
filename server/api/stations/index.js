// Generated by CoffeeScript 1.10.0
(function() {
  var controller;

  controller = require("./stations.controller");

  module.exports = function(router) {
    router.get("/stations", controller.index);
    router.get("/stations/:id", controller.show);
    router.post("/stations", controller.create);
    router.put("/stations/:id", controller.update);
    router.patch('/stations/:id', controller.update);
    return router["delete"]('/stations/:id', controller.destroy);
  };

}).call(this);

//# sourceMappingURL=index.js.map