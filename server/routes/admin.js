// Generated by CoffeeScript 1.9.3
(function() {
  var Promise, _, config, express, model, path, router;

  express = require('express');

  router = express.Router();

  path = require("path");

  _ = require("underscore");

  Promise = require("sequelize").Promise;

  model = require("../lib/model");

  config = require("../config/config");

  router.all("/*", function(req, res, next) {
    return res.sendFile(path.join(config.root, 'client/app/admin/index.html'));
  });

  module.exports = router;

}).call(this);
