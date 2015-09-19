_ = require "underscore"

Sequelize = require "sequelize"

squelize = require "./dbconn"

Promise = require("sequelize").Promise




City = squelize.define 'city',
    name: Sequelize.STRING

,freezeTableName: true


Station = squelize.define 'station',
    name: Sequelize.STRING
    address: Sequelize.STRING

,freezeTableName: true


Company = squelize.define 'company',
    name: Sequelize.STRING
    phones:Sequelize.STRING
    address: Sequelize.TEXT(500)

, freezeTableName: true


Busline = squelize.define 'busline',
    name: Sequelize.STRING
    description: Sequelize.STRING
    price: Sequelize.INTEGER
    paymethod: Sequelize.STRING




User = squelize.define 'user',
    name: Sequelize.STRING
    realName: Sequelize.STRING
    salt: Sequelize.STRING
    password: Sequelize.STRING


,freezeTableName: true


BusLineStation = squelize.define 'busline_station'
,freezeTableName: true





Stime = squelize.define 'start_time',
    time: Sequelize.TIME
,freezeTableName: true



BusLineStartTime = squelize.define 'busline_starttime'
,freezeTableName: true


City.hasMany Station
Station.belongsTo City



#BusLine.hasMany Station
#Station.belongsTo BusLine

Busline.belongsToMany Station,
    through: BusLineStation

Station.belongsToMany Busline,
    through: BusLineStation

Busline.belongsToMany Stime,
    as: "StartTime"
    through: BusLineStartTime

Stime.belongsToMany Busline,
    through: BusLineStartTime




Busline.belongsTo City,
    as: 'startCity'
    foreignKey: 'startCityId'

Busline.belongsTo City,
    as: 'endCity'
    foreignKey: 'endCityId'


City.hasMany Busline,
    as: 'LinesAsStartCity'
    foreignKey: 'startCityId'

City.hasMany Busline,
    as: 'LinesAsEndCity'
    foreignKey: 'endCityId'

Company.hasMany Busline,
    as: 'Lines'
#BusLine.belongsTo Company






Stime.sync
    force: true
.then ->

    baseTime = new Date(2015,0,1,0,0,0)
    t = baseTime.getTime()

    timeSecList = _.range 0, 24 * 2

    timeMap = _.map timeSecList, (val, key, list)->
        return time: new Date( t + val * 1800e3 ) # half an hour


    Stime.bulkCreate timeMap
    .then (lst)->




BusLineStartTime.sync
    force: true

BusLineStation.sync
    force: true



Company.sync
    force: true


getDate = (timeString)->
    return new Date( "2015 1 1,"+ timeString + ":00")


City.sync(
    force: true
).then ->
    cityList = ["广州","深圳","珠海","佛山","惠州","湛江","梅州","汕头","汕尾"]

    cityMap = _.map cityList, (val, key, list)->
        return 'name': val


#    Promise.reduce cityList, (total, item)->
#        city = City.create
#            name: item
#    , 0

    City.bulkCreate cityMap
#        fields: ['name']
    .then (lst)->


        Busline.sync
            force: true
        .then ->
            Busline.create
                name: 'line one'
                price: 40

            .then (line)->

                line.startCityId = cityList.indexOf("广州")+1
                line.endCityId = cityList.indexOf("深圳")+1
                line.save().then ->


                    Station.sync
                        force: true
                    .then ->
                        stationList1 = ["暨南大学西门","广州大学城官洲地铁站"]

                        Promise.reduce stationList1, (total, item)->
                            Station.create
                                name: item
                            .then (sta)->
                                sta.setCity  cityList.indexOf("广州")+1
                        , 0

                        .then ->


                            stationList2 = ["深圳大学北门","世界之窗"]

                            Promise.reduce stationList2, (total, item)->
                                Station.create
                                    name: item
                                .then (sta)->
                                    sta.setCity  cityList.indexOf("深圳")+1
                            , 0

                            .then ->

                                Station.findAll().then (stations)->


                                    line.setStations stations

                                    Stime.findAll
                                        where:
                                            $or:
                                                [ time: getDate("08:30"),
                                                  time: getDate("10:00") ]

                                    .then (t)->
                                        line.setStartTime t

#                                    line.setStations stations
#                                    console.log stations











    #
    #                City.findById 1
    #                    .then (city)->

    #                        console.log city.get
    #                            plain: true
    #
    #                        console.log city.name
    #
    #                        city.getLinesAsStartCity().then (lines)->
    #                            console.log lines




#
#Person = squelize.define('Person', {})
#
#Person.hasOne(Person, {as: 'Father'})
#
#Person.sync
#    force:  true
#.then ->
#
#    Person.create().then (p)->
#        Person.create().then (p2)->
#
#            p.setFather p2
#            .then ->
#                p.getFather().then (father)->
#                    console.log father.get
#                        plain: true

#
#User = squelize.define('User', {})
#Project = squelize.define('Project', {})
#
#
#Project.hasMany(User, {as: 'Workers'})
#Project.sync
#    force:  true
#.then ->
#    Project.create().then (p)->
#        User.create().then (u)->
#            u.setWorkers [p]
#            console.log p.getWorkers()



module.exports.City = City
module.exports.User = User
module.exports.Busline = Busline




