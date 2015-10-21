# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.22)
# Database: intercitybus
# Generation Time: 2015-10-10 14:20:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table busline_starttimes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `busline_starttimes`;

CREATE TABLE `busline_starttimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `buslineId` int(11) DEFAULT NULL,
  `starttimeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `busline_starttimes_starttimeId_buslineId_unique` (`buslineId`,`starttimeId`),
  KEY `starttimeId` (`starttimeId`),
  CONSTRAINT `busline_starttimes_ibfk_1` FOREIGN KEY (`buslineId`) REFERENCES `buslines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `busline_starttimes_ibfk_2` FOREIGN KEY (`starttimeId`) REFERENCES `starttimes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `busline_starttimes` WRITE;
/*!40000 ALTER TABLE `busline_starttimes` DISABLE KEYS */;

INSERT INTO `busline_starttimes` (`id`, `createdAt`, `updatedAt`, `buslineId`, `starttimeId`)
VALUES
	(1,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,19),
	(2,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,25),
	(3,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,30),
	(4,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,34),
	(5,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,19),
	(6,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,15),
	(7,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,21),
	(8,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,30),
	(9,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,19),
	(10,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,15),
	(11,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,21),
	(12,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,30),
	(13,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,35);

/*!40000 ALTER TABLE `busline_starttimes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table busline_stations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `busline_stations`;

CREATE TABLE `busline_stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `buslineId` int(11) DEFAULT NULL,
  `stationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `busline_stations_stationId_buslineId_unique` (`buslineId`,`stationId`),
  KEY `stationId` (`stationId`),
  CONSTRAINT `busline_stations_ibfk_1` FOREIGN KEY (`buslineId`) REFERENCES `buslines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `busline_stations_ibfk_2` FOREIGN KEY (`stationId`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `busline_stations` WRITE;
/*!40000 ALTER TABLE `busline_stations` DISABLE KEYS */;

INSERT INTO `busline_stations` (`id`, `createdAt`, `updatedAt`, `buslineId`, `stationId`)
VALUES
	(1,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,1),
	(2,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,2),
	(3,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,3),
	(4,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,4),
	(5,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,5),
	(6,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,6),
	(7,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,7),
	(8,'2015-10-09 01:31:00','2015-10-09 01:31:00',1,8),
	(9,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,9),
	(10,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,10),
	(11,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,11),
	(12,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,12),
	(13,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,13),
	(14,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,14),
	(15,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,15),
	(16,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,16),
	(17,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,17),
	(18,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,18),
	(19,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,19),
	(20,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,20),
	(21,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,21),
	(22,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,22),
	(23,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,23),
	(24,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,24),
	(25,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,25),
	(26,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,26);

/*!40000 ALTER TABLE `busline_stations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table buslines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `buslines`;

CREATE TABLE `buslines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `paymethod` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `startCityId` int(11) DEFAULT NULL,
  `endCityId` int(11) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `startCityId` (`startCityId`),
  KEY `endCityId` (`endCityId`),
  KEY `companyId` (`companyId`),
  CONSTRAINT `buslines_ibfk_1` FOREIGN KEY (`startCityId`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `buslines_ibfk_2` FOREIGN KEY (`endCityId`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `buslines_ibfk_3` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `buslines` WRITE;
/*!40000 ALTER TABLE `buslines` DISABLE KEYS */;

INSERT INTO `buslines` (`id`, `name`, `description`, `price`, `paymethod`, `createdAt`, `updatedAt`, `startCityId`, `endCityId`, `companyId`)
VALUES
	(1,'广州-东莞','每个学校免费接送，即使只有您一人乘车亦照常发车，高额保险！',25,'提前电话订票，上车再买票','2015-10-09 01:31:00','2015-10-09 01:31:00',1,5,1),
	(2,'广州-深圳','每个学校免费接送，即使只有您一人乘车亦照常发车，高额保险！',50,'提前电话订票，上车再买票','2015-10-09 01:31:00','2015-10-09 01:31:00',1,3,2),
	(3,'深圳-湛江','全程高速',80,'提前电话订票，上车再买票','2015-10-09 01:31:00','2015-10-09 01:31:00',3,6,3);

/*!40000 ALTER TABLE `buslines` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cities`;

CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;

INSERT INTO `cities` (`id`, `name`, `createdAt`, `updatedAt`)
VALUES
	(1,'广州','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(2,'潮汕','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(3,'深圳','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(4,'珠海','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(5,'东莞','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(6,'湛江','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(7,'清远','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(8,'佛山','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(9,'汕尾','2015-10-10 22:13:37','2015-10-10 22:13:37');

/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;

INSERT INTO `companies` (`id`, `name`, `address`, `createdAt`, `updatedAt`)
VALUES
	(1,'广莞线','深圳XX街道','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(2,'广深线','深圳YY街道','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(3,'深湛线','深圳ZZ街道','2015-10-09 01:31:00','2015-10-09 01:31:00');

/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table hotlines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hotlines`;

CREATE TABLE `hotlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queryCount` int(11) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `startCityId` int(11) DEFAULT NULL,
  `endCityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `startCityId` (`startCityId`),
  KEY `endCityId` (`endCityId`),
  CONSTRAINT `hotlines_ibfk_1` FOREIGN KEY (`startCityId`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `hotlines_ibfk_2` FOREIGN KEY (`endCityId`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `hotlines` WRITE;
/*!40000 ALTER TABLE `hotlines` DISABLE KEYS */;

INSERT INTO `hotlines` (`id`, `queryCount`, `createdAt`, `updatedAt`, `startCityId`, `endCityId`)
VALUES
	(1,4,'2015-10-09 01:31:00','2015-10-10 22:18:53',1,2),
	(2,2,'2015-10-09 01:31:00','2015-10-09 01:31:00',2,1),
	(3,4,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,2),
	(4,5,'2015-10-09 01:31:00','2015-10-09 01:31:00',4,2),
	(5,1,'2015-10-10 22:19:08','2015-10-10 22:19:08',1,5);

/*!40000 ALTER TABLE `hotlines` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table phones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phones`;

CREATE TABLE `phones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `companyId` int(11) DEFAULT NULL,
  `buslineId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `companyId` (`companyId`),
  KEY `buslineId` (`buslineId`),
  CONSTRAINT `phones_ibfk_1` FOREIGN KEY (`companyId`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `phones_ibfk_2` FOREIGN KEY (`buslineId`) REFERENCES `buslines` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `phones` WRITE;
/*!40000 ALTER TABLE `phones` DISABLE KEYS */;

INSERT INTO `phones` (`id`, `phoneNumber`, `createdAt`, `updatedAt`, `companyId`, `buslineId`)
VALUES
	(1,'15920127234','2015-10-09 01:31:00','2015-10-09 01:31:00',1,1),
	(2,'020-32620728','2015-10-09 01:31:00','2015-10-09 01:31:00',1,1),
	(3,'32620729','2015-10-09 01:31:00','2015-10-09 01:31:00',1,1),
	(4,'0769-87873718','2015-10-09 01:31:00','2015-10-09 01:31:00',1,1),
	(5,'13713001442','2015-10-09 01:31:00','2015-10-09 01:31:00',1,1),
	(6,'15899618691','2015-10-09 01:31:00','2015-10-09 01:31:00',1,1),
	(7,'13189098743','2015-10-09 01:31:00','2015-10-09 01:31:00',2,2),
	(8,'13189098742','2015-10-09 01:31:00','2015-10-09 01:31:00',2,2),
	(9,'13189098741','2015-10-09 01:31:00','2015-10-09 01:31:00',2,2),
	(10,'13723771001','2015-10-09 01:31:00','2015-10-09 01:31:00',2,2),
	(11,'13723728377','2015-10-09 01:31:00','2015-10-09 01:31:00',2,2),
	(12,'13728631669','2015-10-09 01:31:00','2015-10-09 01:31:00',2,2),
	(13,'157 6644 3671','2015-10-09 01:31:00','2015-10-09 01:31:00',3,3),
	(14,'157 6644 3672','2015-10-09 01:31:00','2015-10-09 01:31:00',3,3),
	(15,'188 9886 6960','2015-10-09 01:31:00','2015-10-09 01:31:00',3,3),
	(16,'188 9886 6961','2015-10-09 01:31:00','2015-10-09 01:31:00',3,3);

/*!40000 ALTER TABLE `phones` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table starttimes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `starttimes`;

CREATE TABLE `starttimes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` time DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `starttimes` WRITE;
/*!40000 ALTER TABLE `starttimes` DISABLE KEYS */;

INSERT INTO `starttimes` (`id`, `time`, `createdAt`, `updatedAt`)
VALUES
	(1,'00:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(2,'00:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(3,'01:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(4,'01:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(5,'02:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(6,'02:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(7,'03:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(8,'03:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(9,'04:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(10,'04:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(11,'05:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(12,'05:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(13,'06:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(14,'06:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(15,'07:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(16,'07:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(17,'08:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(18,'08:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(19,'09:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(20,'09:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(21,'10:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(22,'10:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(23,'11:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(24,'11:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(25,'12:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(26,'12:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(27,'13:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(28,'13:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(29,'14:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(30,'14:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(31,'15:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(32,'15:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(33,'16:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(34,'16:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(35,'17:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(36,'17:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(37,'18:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(38,'18:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(39,'19:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(40,'19:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(41,'20:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(42,'20:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(43,'21:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(44,'21:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(45,'22:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(46,'22:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(47,'23:00:00','2015-10-10 22:13:37','2015-10-10 22:13:37'),
	(48,'23:30:00','2015-10-10 22:13:37','2015-10-10 22:13:37');

/*!40000 ALTER TABLE `starttimes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stations`;

CREATE TABLE `stations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cityId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cityId` (`cityId`),
  CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `cities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;

INSERT INTO `stations` (`id`, `name`, `address`, `latitude`, `longitude`, `createdAt`, `updatedAt`, `cityId`)
VALUES
	(1,'大学城各高校门口','校门正对面',NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',1),
	(2,'大学城北地铁站B出口','B出口',NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',1),
	(3,'华师西门地铁E出口','E出口',NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',1),
	(4,'五山地铁B出口','B出口',NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',1),
	(5,'总站',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',5),
	(6,'文化广场','广场对面',NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',5),
	(7,'广医','校门口',NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',5),
	(8,'理工','校门口',NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',5),
	(9,'大学城',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',1),
	(10,'华师大',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',1),
	(11,'体育中心',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',1),
	(12,'烈士陵园',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',1),
	(13,'火车站',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',1),
	(14,'同乐关',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',3),
	(15,'深大',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',3),
	(16,'世界之窗',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',3),
	(17,'岗夏',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',3),
	(18,'上海宾馆',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',3),
	(19,'高职院',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',3),
	(20,'西丽大学城',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',3),
	(21,'布吉',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',3),
	(22,'深圳大学',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',3),
	(23,'宝安（西乡）',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',3),
	(24,'霞山',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',6),
	(25,'赤坎',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',6),
	(26,'遂溪',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',6);

/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
