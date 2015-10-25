// Generated by CoffeeScript 1.10.0
(function() {
  var controller;

  controller = require("./phones.controller");

  module.exports = function(router) {
    router.get("/phones", controller.index);
    router.get("/phones/:id", controller.show);
    router.post("/phones", controller.create);
    router.put("/phones/:id", controller.update);
    router.patch('/phones/:id', controller.update);
    return router["delete"]('/phones/:id', controller.destroy);
  };

}).call(this);

//# sourceMappingURL=index.js.map
