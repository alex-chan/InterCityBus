// Generated by CoffeeScript 1.10.0
(function() {
  var Model, _, handleEntityNotFound, handleError, removeEntity, responseWithResult, saveUpdates;

  Model = require("../../lib/model");

  _ = require("underscore");

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
    (function(entity) {});
    if (entity) {
      return entity.destroy().then(function() {
        return res.status(204).end();
      });
    }
  };

  module.exports.index = function(req, res) {
    return Model.Station.findAll().then(responseWithResult(res))["catch"](handleError(res));
  };

  module.exports.show = function(req, res) {
    return Model.Station.findOne({
      where: {
        id: req.params.id
      }
    }).then(handleEntityNotFound(res)).then(responseWithResult(res))["catch"](handleError(res));
  };

  module.exports.update = function(req, res) {
    return Model.Station.findOne({
      where: {
        id: req.params.id
      }
    }).then(handleEntityNotFound(res)).then(saveUpdates(req.body)).then(responseWithResult(res))["catch"](handleError(res));
  };

  module.exports.create = function(req, res) {
    return Model.Station.create(req.body).then(responseWithResult(res, 201))["catch"](handleError(res));
  };

  module.exports.destroy = function(req, res) {
    if (req.body.id) {
      delete req.body.id;
    }
    return Model.Station.findOne({
      where: {
        id: req.params.id
      }
    }).then(handleEntityNotFound(res)).then(removeEntity(req.body))["catch"](handleError(res));
  };

}).call(this);

//# sourceMappingURL=stations.controller.js.map
