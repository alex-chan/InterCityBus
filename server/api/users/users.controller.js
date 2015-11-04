// Generated by CoffeeScript 1.10.0
(function() {
  var _, config, handleEntityNotFound, handleError, jwt, model, removeEntity, responseWithResult, saveUpdates, validationError;

  config = require("../../config/config");

  model = require("../../lib/model");

  _ = require("underscore");

  jwt = require("jsonwebtoken");

  validationError = function(res, statusCode) {
    statusCode = statusCode || 422;
    return function(err) {
      return res.status(statusCode).json(err);
    };
  };

  handleError = function(res, statusCode) {
    statusCode = statusCode || 500;
    return function(err) {
      console.log("error:" + err);
      console.log("error stack:" + err.stack);
      return res.status(statusCode).send(err);
    };
  };

  handleEntityNotFound = function(res) {
    return function(entity) {
      if (!entity) {
        res.status(404).end();
        return null;
      }
      return entity;
    };
  };

  responseWithResult = function(res, statusCode) {
    statusCode = statusCode || 200;
    return function(entity) {
      if (entity) {
        return res.status(statusCode).json(entity);
      }
    };
  };

  saveUpdates = function(updates) {
    return function(entity) {
      return entity.updateAttributes(updates).then(function(updated) {
        return updated;
      });
    };
  };

  removeEntity = function(res) {
    return function(entity) {
      if (entity) {
        return entity.destroy().then(function() {
          return res.status(204).end();
        });
      }
    };
  };


  /*
   * Get list of users
   * restriction: 'admin'
   */

  module.exports.index = function(req, res) {
    return model.User.findAll({
      attributes: ['id', 'name', 'email', 'role', 'provider']
    }).then(function(users) {
      return res.status(200).json(users);
    })["catch"](handleError(res));
  };

  module.exports.show = function(req, res) {
    var userId;
    userId = req.params.id;
    return model.User.find({
      where: {
        id: userId
      }
    }).then(function(user) {
      if (!user) {
        return res.status(404).end();
      }
      return res.json(user.profile);
    })["catch"](function(err) {
      return next(err);
    });
  };

  module.exports.create = function(req, res) {
    var newUser;
    newUser = model.User.build(req.body);
    newUser.setDataValue('provider', 'local');
    newUser.setDataValue('role', 'user');
    return newUser.save().then(function(user) {
      var token;
      token = jwt.sign({
        id: user.id
      }, config.secrets.session, {
        expiresIn: 60 * 60 * 2
      });
      return res.json({
        token: token
      });
    })["catch"](validationError(res));
  };

  module.exports.destroy = function(req, res) {
    return model.User.destroy({
      id: req.params.id
    }).then(function() {
      return res.status(204).end();
    })["catch"](handleError(res));
  };

  module.exports.changePassword = function(req, res, next) {
    var newPass, oldPass, userId;
    userId = req.user.id;
    oldPass = String(req.body.oldPassword);
    newPass = String(req.body.newPassword);
    return model.User.find({
      where: {
        id: userId
      }
    }).then(function(user) {
      if (user.authenticate(oldPass)) {
        user.password = newPass;
        return user.save().then(function() {
          return res.status(204).end();
        })["catch"](validationError(res));
      } else {
        return res.status(403).end();
      }
    });
  };

  module.exports.me = function(req, res, next) {
    var userId;
    userId = req.user.id;
    return model.User.find({
      where: {
        id: userId
      },
      attributes: ['id', 'name', 'email', 'role', 'provider']
    }).then(function(user) {
      if (!user) {
        return res.status(401).end();
      }
      return res.json(user);
    })["catch"](function(err) {
      return next(err);
    });
  };

}).call(this);

//# sourceMappingURL=users.controller.js.map
