// Generated by CoffeeScript 1.10.0
(function() {
  var config, express, model, router;

  express = require('express');

  model = require('../lib/model');

  router = express.Router();

  config = null;

  require('./local/passport').setup(model.User, config);

  router.use('local', require('./local'));

  module.exports = router;

}).call(this);

//# sourceMappingURL=index.js.map
