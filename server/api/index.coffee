busline = require "./buslines"
city = require "./cities"
company = require "./companies"
phone = require "./phones"
station = require "./stations"
starttimes = require "./starttimes"
users = require "./users"


module.exports = (router)->

    busline(router)
    city(router)
    company(router)
    phone(router)
    station(router)
    starttimes(router)
    users(router)

