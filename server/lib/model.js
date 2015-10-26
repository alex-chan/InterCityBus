// Generated by CoffeeScript 1.10.0
(function() {
  var BusLineStartTime, BusLineStation, Busline, City, Company, Hotline, Phone, Promise, Sequelize, Station, Stime, User, _, addRecords, addStartTime, getDate, squelize;

  _ = require("underscore");

  Sequelize = require("sequelize");

  squelize = require("./dbconn");

  Promise = require("sequelize").Promise;

  City = squelize.define('city', {
    name: Sequelize.STRING
  });

  Station = squelize.define('station', {
    name: Sequelize.STRING,
    address: Sequelize.STRING,
    latitude: Sequelize.DOUBLE,
    longitude: Sequelize.DOUBLE
  });

  Company = squelize.define('company', {
    name: Sequelize.STRING,
    address: Sequelize.STRING
  });

  Phone = squelize.define('phone', {
    phoneNumber: Sequelize.STRING
  });

  Busline = squelize.define('busline', {
    name: Sequelize.STRING,
    description: Sequelize.STRING,
    price: Sequelize.INTEGER,
    paymethod: Sequelize.STRING
  });

  User = squelize.define('user', {
    name: Sequelize.STRING,
    realName: Sequelize.STRING,
    salt: Sequelize.STRING,
    password: Sequelize.STRING
  });

  BusLineStation = squelize.define('busline_station', {
    id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true
    }
  });

  Stime = squelize.define('starttime', {
    time: Sequelize.TIME
  });

  BusLineStartTime = squelize.define('busline_starttime', {
    id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true
    }
  });

  Hotline = squelize.define('hotline', {
    id: {
      type: Sequelize.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    queryCount: {
      type: Sequelize.INTEGER,
      defaultValue: 0
    }
  });

  Hotline.belongsTo(City, {
    as: 'startCity',
    foreignKey: 'startCityId'
  });

  Hotline.belongsTo(City, {
    as: 'endCity',
    foreignKey: 'endCityId'
  });

  City.hasMany(Station);

  Station.belongsTo(City);

  Company.hasMany(Phone);

  Phone.belongsTo(Company);

  Busline.hasMany(Phone);

  Phone.belongsTo(Busline);

  Busline.belongsToMany(Station, {
    through: BusLineStation
  });

  Station.belongsToMany(Busline, {
    through: BusLineStation
  });

  Busline.belongsToMany(Stime, {
    as: "StartTime",
    through: BusLineStartTime
  });

  Stime.belongsToMany(Busline, {
    through: BusLineStartTime
  });

  Busline.belongsTo(City, {
    as: 'startCity',
    foreignKey: 'startCityId'
  });

  Busline.belongsTo(City, {
    as: 'endCity',
    foreignKey: 'endCityId'
  });

  City.hasMany(Busline, {
    as: 'LinesAsStartCity',
    foreignKey: 'startCityId'
  });

  City.hasMany(Busline, {
    as: 'LinesAsEndCity',
    foreignKey: 'endCityId'
  });

  Company.hasMany(Busline, {
    as: 'Lines'
  });

  Busline.belongsTo(Company);

  getDate = function(timeString) {
    return new Date("2015 1 1," + timeString + ":00");
  };

  squelize.query('SET FOREIGN_KEY_CHECKS = 0').spread(function(results, metadta) {
    return Stime.sync().then(function() {
      return Company.sync();
    }).then(function() {
      return City.sync();
    }).then(function() {
      return Busline.sync();
    }).then(function() {
      return Phone.sync();
    }).then(function() {
      return Station.sync();
    }).then(function() {
      return BusLineStation.sync();
    }).then(function() {
      return BusLineStartTime.sync();
    }).then(function() {
      return Hotline.sync();
    }).then(function() {});
  });

  addStartTime = function() {
    var baseTime, t, timeMap, timeSecList;
    baseTime = new Date(2015, 0, 1, 0, 0, 0);
    t = baseTime.getTime();
    timeSecList = _.range(0, 24 * 2);
    timeMap = _.map(timeSecList, function(val, key, list) {
      return {
        time: new Date(t + val * 1800e3)
      };
    });
    return Stime.bulkCreate(timeMap);
  };

  addRecords = function() {
    return addStartTime().then(function(lst) {
      var cityList, cityMap, gcities, gcomp, gline, gline2, gphone, gphone2, stationList1, stationList2;
      gcities = null;
      gcomp = null;
      gphone = null;
      gline = null;
      gline2 = null;
      gphone2 = null;
      cityList = ["广州", "深圳", "珠海", "佛山", "惠州", "湛江", "梅州", "汕头", "汕尾"];
      stationList1 = ["暨南大学西门", "广州大学城官洲地铁站", "广园汽车站", "不知道哪个站"];
      stationList2 = ["深圳大学北门", "世界之窗", "深圳大剧院", "西乡汽车站"];
      cityMap = _.map(cityList, function(val, key, list) {
        return {
          'name': val
        };
      });
      return City.bulkCreate(cityMap).then(function(cities) {
        gcities = cities;
        return Company.create({
          name: "Corp A",
          address: "xxx street"
        });
      }).then(function(comp) {
        gcomp = comp;
        return Phone.create({
          phoneNumber: "13800138000"
        });
      }).then(function(phone) {
        gphone = phone;
        return Busline.create({
          name: 'line one',
          price: 40,
          description: "no desc",
          paymethod: "no pay method"
        });
      }).then(function(line) {
        gline = line;
        line.startCityId = cityList.indexOf("广州") + 1;
        line.endCityId = cityList.indexOf("深圳") + 1;
        line.isHotline = true;
        line.setCompany(gcomp);
        line.addPhones(gphone);
        return line.save();
      }).then(function() {
        return Promise.reduce(stationList1, function(total, item) {
          return Station.create({
            name: item
          }).then(function(sta) {
            return sta.setCity(cityList.indexOf("广州") + 1);
          });
        }, 0);
      }).then(function() {
        return Promise.reduce(stationList2, function(total, item) {
          return Station.create({
            name: item
          }).then(function(sta) {
            return sta.setCity(cityList.indexOf("深圳") + 1);
          });
        }, 0);
      }).then(function() {
        return Station.findAll({
          where: {
            id: {
              $or: {
                $lt: 3,
                $gt: 5
              }
            }
          }
        });
      }).then(function(stations) {
        gline.setStations(stations);
        return Stime.findAll({
          where: {
            $or: [
              {
                time: getDate("08:30")
              }, {
                time: getDate("10:00")
              }
            ]
          }
        });
      }).then(function(t) {
        return gline.setStartTime(t);
      }).then(function() {
        return Phone.create({
          phoneNumber: "13800138001"
        });
      }).then(function(phone) {
        gphone2 = phone;
        return Busline.create({
          name: 'line two',
          price: 45,
          description: "no desc",
          paymethod: "no pay method"
        });
      }).then(function(line) {
        gline2 = line;
        line.startCityId = cityList.indexOf("广州") + 1;
        line.endCityId = cityList.indexOf("深圳") + 1;
        line.isHotline = true;
        line.setCompany(gcomp);
        line.addPhones(gphone2);
        return line.save();
      }).then(function() {
        return Station.findAll({
          where: {
            id: {
              $and: {
                $gt: 2,
                $lt: 7
              }
            }
          }
        });
      }).then(function(stations) {
        gline2.setStations(stations);
        return Stime.findAll({
          where: {
            $or: [
              {
                time: getDate("10:30")
              }, {
                time: getDate("12:00")
              }
            ]
          }
        });
      }).then(function(t) {
        return gline2.setStartTime(t);
      }).then(function() {
        return Hotline.create();
      }).then(function(line) {
        line.startCityId = cityList.indexOf("广州") + 1;
        line.endCityId = cityList.indexOf("深圳") + 1;
        line.queryCount = 3;
        return line.save();
      }).then(function() {
        return Hotline.create();
      }).then(function(line) {
        line.startCityId = cityList.indexOf("深圳") + 1;
        line.endCityId = cityList.indexOf("广州") + 1;
        line.queryCount = 2;
        return line.save();
      });
    });
  };

  module.exports.City = City;

  module.exports.User = User;

  module.exports.Busline = Busline;

  module.exports.Hotline = Hotline;

  module.exports.Station = Station;

  module.exports.Company = Company;

  module.exports.Phone = Phone;

  module.exports.Starttime = Stime;

  module.exports.BusLineStation = BusLineStation;

  module.exports.BusLineStartTime = BusLineStartTime;

}).call(this);

//# sourceMappingURL=model.js.map
