_ = require "underscore"

Sequelize = require "sequelize"

squelize = require "./dbconn"

Promise = require("sequelize").Promise

User = squelize.import '../api/users/user.model'


City = squelize.define 'city',
    name: Sequelize.STRING


Station = squelize.define 'station',
    name: Sequelize.STRING
    address: Sequelize.STRING
    latitude: Sequelize.DOUBLE
    longitude: Sequelize.DOUBLE



Company = squelize.define 'company',
    name: Sequelize.STRING
    address: Sequelize.STRING

Phone = squelize.define 'phone',
    phoneNumber: Sequelize.STRING


Busline = squelize.define 'busline',
    name: Sequelize.STRING
    description: Sequelize.STRING
    price: Sequelize.INTEGER
    paymethod: Sequelize.STRING









BusLineStation = squelize.define 'busline_station',
    id:
        type: Sequelize.INTEGER
        autoIncrement: true
        primaryKey: true





Stime = squelize.define 'starttime',
    time: Sequelize.TIME




BusLineStartTime = squelize.define 'busline_starttime',
    id:
        type: Sequelize.INTEGER
        autoIncrement: true
        primaryKey: true



Hotline = squelize.define 'hotline',
    id:
        type: Sequelize.INTEGER
        autoIncrement: true
        primaryKey: true

    queryCount:
        type: Sequelize.INTEGER
        defaultValue: 0







Hotline.belongsTo City,
    as: 'startCity'
    foreignKey: 'startCityId'

Hotline.belongsTo City,
    as: 'endCity'
    foreignKey: 'endCityId'


City.hasMany Station
Station.belongsTo City

Company.hasMany Phone
Phone.belongsTo Company


#BusLine.hasMany Station
#Station.belongsTo BusLine

Busline.hasMany Phone
Phone.belongsTo Busline

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

Busline.belongsTo Company












getDate = (timeString)->
    return new Date( "2015 1 1,"+ timeString + ":00")


#Promise.reduce cityList, (total, item)->
#    city = City.create
#        name: item
#, 0



squelize.query('SET FOREIGN_KEY_CHECKS = 0').spread (results,metadta)->

    Stime.sync()
#        force: true
    .then ->
        Company.sync()
#            force: true
    .then ->
        City.sync()
#            force: true
    .then ->
        Busline.sync()
#            force: true
    .then ->
        Phone.sync()
#            force: true
    .then ->
        Station.sync()
#            force: true
    .then ->
        BusLineStation.sync()
#            force: true
    .then ->
        BusLineStartTime.sync()
#            force: true
    .then ->
        Hotline.sync()
#            force: true
    .then ->
        User.sync()
    .then ->
        User.findOne
            where:
                name: 'root'

    .then (root)->
        if !root
            console.log 'create new root user'

            User.create
                provider: 'local'
                name: 'root'
                role: 'admin'
                nickName: '系统管理员'
                password: 'roothehebus123'


    .then (root)->
        console.log 'root exists or created'

#    .catch (err)->
#        console.log 'error: ' + err

#        addRecords()



addStartTime = ->
    baseTime = new Date(2015,0,1,0,0,0)
    t = baseTime.getTime()

    timeSecList = _.range 0, 24 * 2

    timeMap = _.map timeSecList, (val, key, list)->
        return time: new Date( t + val * 1800e3 ) # half an hour

    Stime.bulkCreate timeMap





addRecords = ->
    addStartTime().then (lst)->


        gcities = null
        gcomp = null
        gphone = null
        gline = null
        gline2 = null
        gphone2 = null

        cityList = ["广州","深圳","珠海","佛山","惠州","湛江","梅州","汕头","汕尾"]
        stationList1 = ["暨南大学西门","广州大学城官洲地铁站","广园汽车站","不知道哪个站"]
        stationList2 = ["深圳大学北门","世界之窗","深圳大剧院","西乡汽车站"]



        cityMap = _.map cityList, (val, key, list)->
            return 'name': val

        City.bulkCreate cityMap
        .then (cities)->
            gcities = cities
            Company.create
                name: "Corp A"
                address: "xxx street"

        .then (comp)->
            gcomp = comp
            Phone.create
                phoneNumber: "13800138000"

        .then (phone)->
            gphone = phone
            Busline.create
                name: 'line one'
                price: 40
                description: "no desc"
                paymethod: "no pay method"

        .then (line)->
            gline = line
            line.startCityId = cityList.indexOf("广州")+1
            line.endCityId = cityList.indexOf("深圳")+1
            line.isHotline = true
            line.setCompany gcomp
            line.addPhones gphone

            line.save()

        .then ->
            Promise.reduce stationList1, (total, item)->
                Station.create
                    name: item
                .then (sta)->
                    sta.setCity  cityList.indexOf("广州")+1
            , 0

        .then ->
            Promise.reduce stationList2, (total, item)->
                Station.create
                    name: item
                .then (sta)->
                    sta.setCity  cityList.indexOf("深圳")+1
            , 0

        .then ->
            Station.findAll
                where:
                    id:
                        $or:
                            $lt: 3
                            $gt: 5


        .then (stations)->
            gline.setStations stations
            Stime.findAll
                where:
                    $or:
                        [ time: getDate("08:30"),
                            time: getDate("10:00") ]

        .then (t)->
            gline.setStartTime t


        # create busline 2
        .then ->
            Phone.create
                phoneNumber: "13800138001"

        .then (phone)->
            gphone2 = phone
            Busline.create
                name: 'line two'
                price: 45
                description: "no desc"
                paymethod: "no pay method"

        .then (line)->
            gline2 = line
            line.startCityId = cityList.indexOf("广州")+1
            line.endCityId = cityList.indexOf("深圳")+1
            line.isHotline = true
            line.setCompany gcomp
            line.addPhones gphone2
            line.save()

        .then ->
            Station.findAll
                where:
                    id:
                        $and:
                            $gt: 2
                            $lt: 7

        .then (stations)->
            gline2.setStations stations
            Stime.findAll
                where:
                    $or:
                        [ time: getDate("10:30"),
                            time: getDate("12:00") ]

        .then (t)->
            gline2.setStartTime t


        .then ->
            Hotline.create()

        .then (line)->
            line.startCityId = cityList.indexOf("广州")+1
            line.endCityId = cityList.indexOf("深圳")+1
            line.queryCount = 3
            line.save()

        .then ->
            Hotline.create()

        .then (line)->
            line.startCityId = cityList.indexOf("深圳")+1
            line.endCityId = cityList.indexOf("广州")+1
            line.queryCount = 2
            line.save()

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




#    Promise.reduce cityList, (total, item)->
#        city = City.create
#            name: item
#    , 0


module.exports.City = City
module.exports.User = User
module.exports.Busline = Busline
module.exports.Hotline = Hotline
module.exports.Station = Station
module.exports.Company = Company
module.exports.Phone = Phone
module.exports.Starttime = Stime
module.exports.BusLineStation = BusLineStation
module.exports.BusLineStartTime = BusLineStartTime
module.exports.User = User



