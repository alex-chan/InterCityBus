# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.6.22)
# Database: intercitybus
# Generation Time: 2015-10-16 15:26:27 +0000
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
	(13,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,35),
	(14,'2015-10-09 01:31:00','2015-10-09 01:31:00',4,15),
	(15,'2015-10-09 01:31:00','2015-10-09 01:31:00',4,19),
	(16,'2015-10-09 01:31:00','2015-10-09 01:31:00',4,21),
	(17,'2015-10-09 01:31:00','2015-10-09 01:31:00',4,30),
	(18,'2015-10-09 01:31:00','2015-10-09 01:31:00',4,35),
	(19,'2015-10-09 01:31:00','2015-10-09 01:31:00',5,15),
	(20,'2015-10-09 01:31:00','2015-10-09 01:31:00',5,19),
	(21,'2015-10-09 01:31:00','2015-10-09 01:31:00',5,21),
	(22,'2015-10-09 01:31:00','2015-10-09 01:31:00',5,30),
	(23,'2015-10-09 01:31:00','2015-10-09 01:31:00',6,19),
	(24,'2015-10-09 01:31:00','2015-10-09 01:31:00',6,21),
	(25,'2015-10-09 01:31:00','2015-10-09 01:31:00',6,30),
	(26,'2015-10-09 01:31:00','2015-10-09 01:31:00',6,35),
	(27,'2015-10-09 01:31:00','2015-10-09 01:31:00',7,15),
	(28,'2015-10-09 01:31:00','2015-10-09 01:31:00',7,19),
	(29,'2015-10-09 01:31:00','2015-10-09 01:31:00',7,21),
	(30,'2015-10-09 01:31:00','2015-10-09 01:31:00',7,30),
	(31,'2015-10-10 01:31:00','2015-10-10 01:31:00',8,19),
	(32,'2015-10-09 01:31:00','2015-10-09 01:31:00',9,15),
	(33,'2015-10-09 01:31:00','2015-10-09 01:31:00',9,21),
	(34,'2015-10-09 01:31:00','2015-10-09 01:31:00',9,30),
	(35,'2015-10-09 01:31:00','2015-10-09 01:31:00',9,35),
	(36,'2015-10-09 01:31:00','2015-10-09 01:31:00',10,15),
	(37,'2015-10-09 01:31:00','2015-10-09 01:31:00',10,21),
	(38,'2015-10-09 01:31:00','2015-10-09 01:31:00',10,30),
	(39,'2015-10-09 01:31:00','2015-10-09 01:31:00',11,15),
	(40,'2015-10-09 01:31:00','2015-10-09 01:31:00',11,21),
	(41,'2015-10-09 01:31:00','2015-10-09 01:31:00',11,30),
	(42,'2015-10-09 01:31:00','2015-10-09 01:31:00',12,15),
	(43,'2015-10-09 01:31:00','2015-10-09 01:31:00',12,21),
	(44,'2015-10-09 01:31:00','2015-10-09 01:31:00',12,30),
	(45,'2015-10-09 01:31:00','2015-10-09 01:31:00',13,15),
	(46,'2015-10-09 01:31:00','2015-10-09 01:31:00',13,21),
	(47,'2015-10-09 01:31:00','2015-10-09 01:31:00',13,30),
	(48,'2015-10-09 01:31:00','2015-10-09 01:31:00',14,15),
	(49,'2015-10-09 01:31:00','2015-10-09 01:31:00',14,21),
	(50,'2015-10-09 01:31:00','2015-10-09 01:31:00',14,30);

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
	(26,'2015-10-09 01:31:00','2015-10-09 01:31:00',3,26),
	(27,'2015-10-10 01:31:00','2015-10-10 01:31:00',4,1),
	(28,'2015-10-11 01:31:00','2015-10-11 01:31:00',4,2),
	(29,'2015-10-12 01:31:00','2015-10-12 01:31:00',4,3),
	(30,'2015-10-13 01:31:00','2015-10-13 01:31:00',4,4),
	(31,'2015-10-14 01:31:00','2015-10-14 01:31:00',4,31),
	(32,'2015-10-15 01:31:00','2015-10-15 01:31:00',4,32),
	(33,'2015-10-16 01:31:00','2015-10-16 01:31:00',4,33),
	(34,'2015-10-17 01:31:00','2015-10-17 01:31:00',4,34),
	(35,'2015-10-18 01:31:00','2015-10-18 01:31:00',4,35),
	(36,'2015-10-19 01:31:00','2015-10-19 01:31:00',4,36),
	(37,'2015-10-20 01:31:00','2015-10-20 01:31:00',4,37),
	(38,'2015-10-21 01:31:00','2015-10-21 01:31:00',4,38),
	(39,'2015-10-22 01:31:00','2015-10-22 01:31:00',4,39),
	(40,'2015-10-23 01:31:00','2015-10-23 01:31:00',5,1),
	(41,'2015-10-24 01:31:00','2015-10-24 01:31:00',5,2),
	(42,'2015-10-25 01:31:00','2015-10-25 01:31:00',5,3),
	(43,'2015-10-26 01:31:00','2015-10-26 01:31:00',5,4),
	(44,'2015-10-27 01:31:00','2015-10-27 01:31:00',5,31),
	(45,'2015-10-28 01:31:00','2015-10-28 01:31:00',5,32),
	(46,'2015-10-29 01:31:00','2015-10-29 01:31:00',5,33),
	(47,'2015-10-29 01:31:00','2015-10-29 01:31:00',5,34),
	(48,'2015-10-29 01:31:00','2015-10-29 01:31:00',5,35),
	(49,'2015-10-29 01:31:00','2015-10-29 01:31:00',5,36),
	(50,'2015-10-29 01:31:00','2015-10-29 01:31:00',5,37),
	(51,'2015-10-29 01:31:00','2015-10-29 01:31:00',5,38),
	(52,'2015-10-29 01:31:00','2015-10-29 01:31:00',5,39),
	(53,'2015-10-29 01:31:00','2015-10-29 01:31:00',6,1),
	(54,'2015-10-29 01:31:00','2015-10-29 01:31:00',6,2),
	(55,'2015-10-29 01:31:00','2015-10-29 01:31:00',6,3),
	(56,'2015-10-29 01:31:00','2015-10-29 01:31:00',6,4),
	(57,'2015-10-29 01:31:00','2015-10-29 01:31:00',6,5),
	(58,'2015-10-29 01:31:00','2015-10-29 01:31:00',6,6),
	(59,'2015-10-29 01:31:00','2015-10-29 01:31:00',6,7),
	(60,'2015-10-29 01:31:00','2015-10-29 01:31:00',6,8),
	(61,'2015-10-29 01:31:00','2015-10-29 01:31:00',7,16),
	(62,'2015-10-29 01:31:00','2015-10-29 01:31:00',7,17),
	(63,'2015-10-29 01:31:00','2015-10-29 01:31:00',7,18),
	(64,'2015-10-29 01:31:00','2015-10-29 01:31:00',7,19),
	(65,'2015-10-29 01:31:00','2015-10-29 01:31:00',7,20),
	(66,'2015-10-29 01:31:00','2015-10-29 01:31:00',7,1),
	(67,'2015-10-29 01:31:00','2015-10-29 01:31:00',7,2),
	(68,'2015-10-29 01:31:00','2015-10-29 01:31:00',7,3),
	(69,'2015-10-29 01:31:00','2015-10-29 01:31:00',7,4),
	(70,'2015-10-29 01:31:00','2015-10-29 01:31:00',8,1),
	(71,'2015-10-29 01:31:00','2015-10-29 01:31:00',8,2),
	(72,'2015-10-29 01:31:00','2015-10-29 01:31:00',8,3),
	(73,'2015-10-29 01:31:00','2015-10-29 01:31:00',8,4),
	(74,'2015-10-29 01:31:00','2015-10-29 01:31:00',8,40),
	(75,'2015-10-29 01:31:00','2015-10-29 01:31:00',8,41),
	(76,'2015-10-29 01:31:00','2015-10-29 01:31:00',8,42),
	(77,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,15),
	(78,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,16),
	(79,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,17),
	(80,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,18),
	(81,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,19),
	(82,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,20),
	(83,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,21),
	(84,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,22),
	(85,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,24),
	(86,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,25),
	(87,'2015-10-29 01:31:00','2015-10-29 01:31:00',9,26),
	(88,'2015-10-29 01:31:00','2015-10-29 01:31:00',10,1),
	(89,'2015-10-29 01:31:00','2015-10-29 01:31:00',10,2),
	(90,'2015-10-29 01:31:00','2015-10-29 01:31:00',10,3),
	(91,'2015-10-29 01:31:00','2015-10-29 01:31:00',10,4),
	(92,'2015-10-29 01:31:00','2015-10-29 01:31:00',10,43),
	(93,'2015-10-29 01:31:00','2015-10-29 01:31:00',11,1),
	(94,'2015-10-29 01:31:00','2015-10-29 01:31:00',11,2),
	(95,'2015-10-29 01:31:00','2015-10-29 01:31:00',11,3),
	(96,'2015-10-29 01:31:00','2015-10-29 01:31:00',11,4),
	(97,'2015-10-29 01:31:00','2015-10-29 01:31:00',11,44),
	(98,'2015-10-29 01:31:00','2015-10-29 01:31:00',11,45),
	(99,'2015-10-29 01:31:00','2015-10-29 01:31:00',11,46),
	(100,'2015-10-29 01:31:00','2015-10-29 01:31:00',11,47),
	(101,'2015-10-29 01:31:00','2015-10-29 01:31:00',11,48),
	(102,'2015-10-29 01:31:00','2015-10-29 01:31:00',12,49),
	(103,'2015-10-29 01:31:00','2015-10-29 01:31:00',12,50),
	(104,'2015-10-29 01:31:00','2015-10-29 01:31:00',12,1),
	(105,'2015-10-29 01:31:00','2015-10-29 01:31:00',12,2),
	(106,'2015-10-29 01:31:00','2015-10-29 01:31:00',12,3),
	(107,'2015-10-29 01:31:00','2015-10-29 01:31:00',12,4),
	(108,'2015-10-29 01:31:00','2015-10-29 01:31:00',13,51),
	(109,'2015-10-29 01:31:00','2015-10-29 01:31:00',13,52),
	(110,'2015-10-29 01:31:00','2015-10-29 01:31:00',13,53),
	(111,'2015-10-29 01:31:00','2015-10-29 01:31:00',13,1),
	(112,'2015-10-29 01:31:00','2015-10-29 01:31:00',13,2),
	(113,'2015-10-29 01:31:00','2015-10-29 01:31:00',13,3),
	(114,'2015-10-29 01:31:00','2015-10-29 01:31:00',13,4),
	(115,'2015-10-29 01:31:00','2015-10-29 01:31:00',14,51),
	(116,'2015-10-29 01:31:00','2015-10-29 01:31:00',14,52),
	(117,'2015-10-29 01:31:00','2015-10-29 01:31:00',14,53),
	(118,'2015-10-29 01:31:00','2015-10-29 01:31:00',14,1),
	(119,'2015-10-29 01:31:00','2015-10-29 01:31:00',14,2),
	(120,'2015-10-29 01:31:00','2015-10-29 01:31:00',14,3),
	(121,'2015-10-29 01:31:00','2015-10-29 01:31:00',14,4);

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
	(3,'深圳-湛江','全程高速',80,'提前电话订票，上车再买票','2015-10-09 01:31:00','2015-10-09 01:31:00',3,6,3),
	(4,'广州-珠海','每天发车，全程高速',35,'提前电话订票，上车再买票','2015-10-09 01:31:00','2015-10-09 01:31:00',1,4,4),
	(5,'珠海-广州','每天发车，全程高速',35,'提前电话订票，上车再买票','2015-10-09 01:31:00','2015-10-09 01:31:00',4,1,5),
	(6,'东莞-广州','每个学校免费接送，即使只有您一人乘车亦照常发车，高额保险！',25,'提前电话订票，上车再买票','2015-10-09 01:31:00','2015-10-09 01:31:00',5,1,6),
	(7,'深圳-广州','每个学校免费接送，即使只有您一人乘车亦照常发车，高额保险！',50,'提前电话订票，上车再买票','2015-10-09 01:31:00','2015-10-09 01:31:00',3,1,7),
	(8,'河源-广州','每个学校免费接送，即使只有您一人乘车亦照常发车，高额保险！',50,'提前电话订票，上车再买票','2015-10-09 01:31:00','2015-10-09 01:31:00',2,1,8),
	(9,'湛江-深圳','全程高速',80,'提前电话订票，上车再买票','2015-10-09 01:31:00','2015-10-09 01:31:00',6,3,9),
	(10,'广州-潮州','各大高校均有上车点',80,'提前电话订票，上车再买票','2015-10-10 01:31:00','2015-10-10 01:31:00',1,9,10),
	(11,'惠州-广州','全程高速',50,'提前电话订票，上车再买票','2015-10-11 01:31:00','2015-10-11 01:31:00',10,1,11),
	(12,'江门-广州','豪华大巴，校园之旅，天天发车，全程高速直达',20,'提前电话订票，上车再买票，也支持微信订票哟','2015-10-12 01:31:00','2015-10-12 01:31:00',11,1,12),
	(13,'清远-广州','豪华大巴',15,'提前电话订票，上车再买票，也支持微信订票哟','2015-10-13 01:31:00','2015-10-13 01:31:00',7,1,13),
	(14,'广州-清远','豪华大巴',15,'提前电话订票，上车再买票，也支持微信订票哟','2015-10-14 01:31:00','2015-10-14 01:31:00',1,7,14);

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
	(2,'河源','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(3,'深圳','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(4,'珠海','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(5,'东莞','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(6,'湛江','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(7,'清远','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(8,'佛山','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(9,'潮州','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(10,'惠州','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(11,'江门','2015-10-09 01:31:00','2015-10-09 01:31:00');

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
	(1,'广莞线','广州分公司','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(2,'广深线','广州分公司','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(3,'深湛线','深圳分公司','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(4,'广珠线','广州分公司','2015-10-10 01:31:00','2015-10-10 01:31:00'),
	(5,'珠广线','珠海分公司','2015-10-11 01:31:00','2015-10-11 01:31:00'),
	(6,'莞广线','东莞分公司','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(7,'深广线','深圳分公司','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(8,'河广线','河源分公司','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(9,'湛深线','湛江分公司','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(10,'广潮线','广州分公司','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(11,'惠广线','惠州分公司','2015-10-10 01:31:00','2015-10-10 01:31:00'),
	(12,'江广线','江门分公司','2015-10-10 01:31:00','2015-10-10 01:31:00'),
	(13,'清广线','清远分公司','2015-10-11 01:31:00','2015-10-11 01:31:00'),
	(14,'广清线','广州分公司','2015-10-12 01:31:00','2015-10-12 01:31:00');

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
	(3,'020-32620729','2015-10-09 01:31:00','2015-10-09 01:31:00',1,1),
	(5,'13711945715','2015-10-09 01:31:00','2015-10-09 01:31:00',6,6),
	(6,'13728447748','2015-10-09 01:31:00','2015-10-09 01:31:00',6,6),
	(7,'13189098743','2015-10-09 01:31:00','2015-10-09 01:31:00',2,2),
	(8,'13189098742','2015-10-09 01:31:00','2015-10-09 01:31:00',2,2),
	(9,'13189098741','2015-10-09 01:31:00','2015-10-09 01:31:00',2,2),
	(10,'13723771001','2015-10-09 01:31:00','2015-10-09 01:31:00',7,7),
	(11,'13723728377','2015-10-09 01:31:00','2015-10-09 01:31:00',7,7),
	(12,'13728631669','2015-10-09 01:31:00','2015-10-09 01:31:00',7,7),
	(13,'157 6644 3671','2015-10-09 01:31:00','2015-10-09 01:31:00',3,3),
	(14,'157 6644 3672','2015-10-09 01:31:00','2015-10-09 01:31:00',3,3),
	(15,'188 9886 6960','2015-10-09 01:31:00','2015-10-09 01:31:00',9,9),
	(16,'188 9886 6961','2015-10-09 01:31:00','2015-10-09 01:31:00',9,9),
	(17,'137 1141 0100','2015-10-09 01:31:00','2015-10-09 01:31:00',4,4),
	(18,'150 1870 7013','2015-10-09 01:31:00','2015-10-09 01:31:00',4,4),
	(19,'153 6396 2108','2015-10-09 01:31:00','2015-10-09 01:31:00',5,5),
	(20,'153 6396 2208','2015-10-09 01:31:00','2015-10-09 01:31:00',5,5),
	(21,'135 3650 0498','2015-10-09 01:31:00','2015-10-09 01:31:00',5,5),
	(22,'158 0000 5615','2015-10-09 01:31:00','2015-10-09 01:31:00',8,8),
	(23,'158 0000 3715','2015-10-09 01:31:00','2015-10-09 01:31:00',8,8),
	(24,'020-32486693','2015-10-09 01:31:00','2015-10-09 01:31:00',10,10),
	(25,'13580407125','2015-10-09 01:31:00','2015-10-09 01:31:00',10,10),
	(26,'13828377077','2015-10-09 01:31:00','2015-10-09 01:31:00',10,10),
	(27,'158 2070 6911','2015-10-09 01:31:00','2015-10-09 01:31:00',11,11),
	(28,'158 2070 6933','2015-10-09 01:31:00','2015-10-09 01:31:00',11,11),
	(29,'133 5265 5296','2015-10-09 01:31:00','2015-10-09 01:31:00',11,11),
	(30,'134 2733 2922','2015-10-09 01:31:00','2015-10-09 01:31:00',12,12),
	(31,'134 2733 2932','2015-10-09 01:31:00','2015-10-09 01:31:00',12,12),
	(32,'130 8571 9166','2015-10-09 01:31:00','2015-10-09 01:31:00',13,13),
	(33,'130 8571 9177','2015-10-09 01:31:00','2015-10-09 01:31:00',13,13),
	(34,'132 3284 5751','2015-10-09 01:31:00','2015-10-09 01:31:00',13,13),
	(35,'150 1874 9449','2015-10-09 01:31:00','2015-10-09 01:31:00',14,14),
	(36,'159 1581 3883','2015-10-09 01:31:00','2015-10-09 01:31:00',14,14),
	(37,'159 1864 4450','2015-10-09 01:31:00','2015-10-09 01:31:00',14,14);

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
	(1,'00:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(2,'00:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(3,'01:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(4,'01:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(5,'02:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(6,'02:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(7,'03:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(8,'03:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(9,'04:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(10,'04:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(11,'05:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(12,'05:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(13,'06:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(14,'06:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(15,'07:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(16,'07:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(17,'08:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(18,'08:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(19,'09:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(20,'09:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(21,'10:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(22,'10:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(23,'11:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(24,'11:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(25,'12:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(26,'12:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(27,'13:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(28,'13:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(29,'14:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(30,'14:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(31,'15:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(32,'15:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(33,'16:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(34,'16:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(35,'17:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(36,'17:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(37,'18:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(38,'18:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(39,'19:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(40,'19:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(41,'20:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(42,'20:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(43,'21:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(44,'21:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(45,'22:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(46,'22:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(47,'23:00:00','2015-10-09 01:31:00','2015-10-09 01:31:00'),
	(48,'23:30:00','2015-10-09 01:31:00','2015-10-09 01:31:00');

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
	(26,'遂溪',NULL,NULL,NULL,'2015-10-09 01:31:00','2015-10-09 01:31:00',6),
	(27,'暨南大学西门',NULL,NULL,NULL,'2015-10-10 01:31:00','2015-10-10 01:31:00',1),
	(28,'大学城广大KFC',NULL,NULL,NULL,'2015-10-11 01:31:00','2015-10-11 01:31:00',1),
	(29,'龙洞广工门口',NULL,NULL,NULL,'2015-10-12 01:31:00','2015-10-12 01:31:00',1),
	(30,'岭南学院',NULL,NULL,NULL,'2015-10-13 01:31:00','2015-10-13 01:31:00',1),
	(31,'私立华联学院东门',NULL,NULL,NULL,'2015-10-14 01:31:00','2015-10-14 01:31:00',4),
	(32,'北师',NULL,NULL,NULL,'2015-10-15 01:31:00','2015-10-15 01:31:00',4),
	(33,'北理',NULL,NULL,NULL,'2015-10-16 01:31:00','2015-10-16 01:31:00',4),
	(34,'中大',NULL,NULL,NULL,'2015-10-17 01:31:00','2015-10-17 01:31:00',4),
	(35,'香洲梅华东',NULL,NULL,NULL,'2015-10-18 01:31:00','2015-10-18 01:31:00',4),
	(36,'拱北华侨宾馆',NULL,NULL,NULL,'2015-10-19 01:31:00','2015-10-19 01:31:00',4),
	(37,'湖心路口',NULL,NULL,NULL,'2015-10-20 01:31:00','2015-10-20 01:31:00',4),
	(38,'科干',NULL,NULL,NULL,'2015-10-21 01:31:00','2015-10-21 01:31:00',4),
	(39,'吉林大学',NULL,NULL,NULL,'2015-10-22 01:31:00','2015-10-22 01:31:00',4),
	(40,'城南收费站',NULL,NULL,NULL,'2015-10-22 01:31:00','2015-10-22 01:31:00',2),
	(41,'广晟百货',NULL,NULL,NULL,'2015-10-22 01:31:00','2015-10-22 01:31:00',2),
	(42,'河职院东门',NULL,NULL,NULL,'2015-10-22 01:31:00','2015-10-22 01:31:00',2),
	(43,'潮州（韩师、潮师）天河客运',NULL,NULL,NULL,'2015-10-22 01:31:00','2015-10-22 01:31:00',9),
	(44,'博罗',NULL,NULL,NULL,'2015-10-23 01:31:00','2015-10-23 01:31:00',10),
	(45,'江北',NULL,NULL,NULL,'2015-10-24 01:31:00','2015-10-24 01:31:00',10),
	(46,'惠大',NULL,NULL,NULL,'2015-10-25 01:31:00','2015-10-25 01:31:00',10),
	(47,'人人乐',NULL,NULL,NULL,'2015-10-25 01:31:00','2015-10-25 01:31:00',10),
	(48,'经济学院',NULL,NULL,NULL,'2015-10-25 01:31:00','2015-10-25 01:31:00',10),
	(49,'五邑大学',NULL,NULL,NULL,'2015-10-26 01:31:00','2015-10-26 01:31:00',11),
	(50,'江门职院',NULL,NULL,NULL,'2015-10-27 01:31:00','2015-10-27 01:31:00',11),
	(51,'义乌',NULL,NULL,NULL,'2015-10-27 01:31:00','2015-10-27 01:31:00',7),
	(52,'侨丰宾馆',NULL,NULL,NULL,'2015-10-27 01:31:00','2015-10-27 01:31:00',7),
	(53,'小市桥南',NULL,NULL,NULL,'2015-10-27 01:31:00','2015-10-27 01:31:00',7);

/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
