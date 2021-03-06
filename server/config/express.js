// Generated by CoffeeScript 1.10.0
(function() {
  var admin, bodyParser, config, cookieParser, express, favicon, logger, path, routes, users;

  config = require("./config");

  express = require("express");

  path = require('path');

  favicon = require('serve-favicon');

  logger = require('morgan');

  cookieParser = require('cookie-parser');

  bodyParser = require('body-parser');

  routes = require('../routes/index');

  users = require('../routes/users');

  admin = require('../routes/admin');

  config = require("./config");

  module.exports = function(app) {
    app.set('views', path.join(__dirname, '../views'));
    app.set('view engine', 'ejs');
    app.set("appRoot", config.root);
    app.use(logger('dev'));
    app.use(bodyParser.json());
    app.use(bodyParser.urlencoded({
      extended: false
    }));
    app.use(cookieParser());
    app.use(require('less-middleware')(path.join(app.get("appRoot"), 'client')));
    app.use(express["static"](path.join(app.get("appRoot"), 'client')));
    app.use('/users', users);
    app.use('/admin', admin);
    app.use('/api', require("../routes/api"));
    app.use('/auth', require("../auth"));
    app.use('/', routes);
    app.use(function(req, res, next) {
      var err;
      err = new Error('Not Found');
      err.status = 404;
      return next(err);
    });
    if (app.get('env') === 'development') {
      app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        return res.render('error', {
          message: err.message,
          error: err
        });
      });
    }
    return app.use(function(err, req, res, next) {
      res.status(err.status || 500);
      return res.render('error', {
        message: err.message,
        error: {}
      });
    });
  };

}).call(this);

//# sourceMappingURL=express.js.map
