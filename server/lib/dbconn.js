// Generated by CoffeeScript 1.9.3
(function() {
  var Sequelize, conf, sequelize2;

  Sequelize = require('sequelize');

  conf = require('../config/config');

  sequelize2 = new Sequelize('intercitybus', 'intercitybus', 'intercitybus123890', {
    host: 'localhost',
    dialect: "mysql",
    timezone: '+08:00',
    logging: true,
    pool: {
      max: 5,
      min: 0,
      idle: 10000
    }
  });

  module.exports = sequelize2;

}).call(this);