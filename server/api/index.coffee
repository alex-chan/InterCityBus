busline = require "./buslines"
city = require "./cities"
company = require "./companies"
phone = require "./phones"

station = require "./stations"


module.exports = (router)->

    busline(router)
    city(router)
    company(router)
    phone(router)
    station(router)

