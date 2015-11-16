path = require "path"

conf =
    dialect : 'mysql'

    maxHotlines: 6


    root : path.normalize __dirname + '/../..'


    userRoles: ['guest', 'user', 'merchant', 'admin']

    secrets:
        session: 'whatafuckingday!!'


module.exports = conf