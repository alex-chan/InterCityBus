moment = require "moment"
ejs = require "ejs"

console.log ejs.filters

ejs.filters.dateFormat = (obj, format)->
    if format == undefined
        format = 'YYYY-MM-DD HH:mm:ss'

    ret = moment obj
        .format format

    return (ret == 'Invalid date') ? '0000-00-00 00:00:00' : ret

