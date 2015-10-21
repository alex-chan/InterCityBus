path = require "path"

conf =
    dialect : 'mysql'

    maxHotlines: 6


    root : path.normalize __dirname + '/../..'


module.exports = conf