
#mysql = require "mysql"
Sequelize = require('sequelize');
#config = require '../config'


sequelize2 = new Sequelize 'database', 'czz', 'sb',
    host: 'localhost'
    dialect: 'sqlite'

#    timezone: '+08:00'

    logging: false

    pool:
        max: 5
        min: 0
        idle: 10000

    storage: 　'./database.sqite'


module.exports = sequelize2



