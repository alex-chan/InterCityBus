
#mysql = require "mysql"
Sequelize = require('sequelize');
conf = require '../etc/config'


sequelize2 = new Sequelize 'intercitybus', 'root', '',
    host: 'localhost'
    dialect: "mysql"
#    dialect: 'sqlite'

    timezone: '+08:00'

    logging: true

    pool:
        max: 5
        min: 0
        idle: 10000

#    storage: 　'./database.sqite'


module.exports = sequelize2



