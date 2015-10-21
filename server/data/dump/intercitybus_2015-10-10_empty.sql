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


/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
