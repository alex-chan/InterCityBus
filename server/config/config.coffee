path = require "path"

conf =
    dialect : 'mysql'

    maxHotlines: 6


    root : path.normalize __dirname + '/../..'


    secrets:
        session: 'whatafuckingday!!'


module.exports = conf