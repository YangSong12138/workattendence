# MySQL-Front 5.1  (Build 4.13)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: workattendence
# ------------------------------------------------------
# Server version 5.5.13

USE `workattendence`;

#
# Source for table apply
#

CREATE TABLE `apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(10) DEFAULT NULL,
  `applytype` int(1) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `applytime` datetime DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Dumping data for table apply
#

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (1,'manager1',2,'213','2014-01-08 15:25:25',3,NULL,'2014-01-01','2014-01-03');
INSERT INTO `apply` VALUES (2,'manager1',3,'ddd','2014-01-08 15:33:55',2,NULL,'2014-01-02','2014-01-03');
INSERT INTO `apply` VALUES (3,'manager1',3,'weee','2014-01-08 16:16:46',3,NULL,'2014-01-02','2014-01-04');
INSERT INTO `apply` VALUES (4,'clertz1',3,'asad','2014-01-08 16:46:22',0,NULL,'2014-01-01','2014-01-03');
INSERT INTO `apply` VALUES (5,'clertz1',2,'sadasd','2014-01-09 16:16:28',3,NULL,'2014-01-01','2014-01-03');
INSERT INTO `apply` VALUES (6,'clerty1',4,'lalalal','2014-01-10 17:08:14',0,NULL,'2014-01-10','2014-01-10');
INSERT INTO `apply` VALUES (7,'admin',4,'asda','2014-01-10 17:12:38',3,NULL,'2014-01-01','2014-01-03');
INSERT INTO `apply` VALUES (8,'admin',4,'asdasda阿斯达','2014-01-10 17:14:16',3,NULL,'2014-01-08','2014-01-08');
INSERT INTO `apply` VALUES (9,'admin',4,'hahaha','2014-01-10 17:19:30',3,NULL,'2014-01-01','2014-01-03');
INSERT INTO `apply` VALUES (10,'admin',4,'sdsdsfgggg','2014-01-10 17:22:42',3,NULL,'2014-01-07','2014-01-08');
INSERT INTO `apply` VALUES (11,'admin',2,'qqqqqqqqqqq','2014-01-09 17:26:27',0,NULL,'2014-01-07','2014-01-08');
INSERT INTO `apply` VALUES (12,'admin',2,'感冒','2014-01-10 21:38:06',0,NULL,'2014-01-01','2014-01-02');
INSERT INTO `apply` VALUES (13,'clertg1',3,'打几件','2014-01-10 10:25:01',3,NULL,'2014-01-01','2014-01-03');
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table attendance
#

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(10) DEFAULT NULL,
  `departmentid` int(11) DEFAULT NULL,
  `cometime` datetime DEFAULT NULL,
  `gotime` datetime DEFAULT NULL,
  `comestate` int(1) DEFAULT NULL,
  `gostate` int(1) DEFAULT NULL,
  `state` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8;

#
# Dumping data for table attendance
#

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'manager1',1,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (2,'manager2',2,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (3,'manager3',3,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (4,'manager4',4,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (5,'manager5',5,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (7,'admin',1,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (8,'clertz1',1,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (9,'clertz2',1,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (10,'clertg1',2,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (11,'clertg2',2,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (12,'clertc1',3,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (13,'clertc2',3,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (14,'clerts1',4,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (15,'clerts2',4,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (16,'clerty1',5,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (17,'clerty2',5,'2013-12-02 10:10:10','2013-12-02 10:10:10',0,0,0);
INSERT INTO `attendance` VALUES (18,'clerty1',5,'2014-01-06 09:00:00','2014-01-06 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (19,'clerty2',5,'2014-01-06 10:10:10','2014-01-06 18:10:10',1,0,0);
INSERT INTO `attendance` VALUES (20,'clerts2',4,'2014-01-06 09:04:10','2014-01-06 18:20:10',1,0,0);
INSERT INTO `attendance` VALUES (21,'clerts1',4,'2014-01-06 08:30:10','2014-01-06 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (22,'clertc1',3,'2014-01-06 08:10:10','2014-01-06 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (23,'clertc2',3,'2014-01-06 09:10:10','2014-01-06 18:10:10',1,0,0);
INSERT INTO `attendance` VALUES (24,'clertg1',2,'2014-01-06 08:50:10','2014-01-06 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (25,'clertg2',2,'2014-01-06 08:53:10','2014-01-06 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (26,'clertz1',1,'2014-01-06 08:50:10','2014-01-06 18:12:10',0,0,0);
INSERT INTO `attendance` VALUES (27,'clertz2',1,'2014-01-06 08:53:10','2014-01-06 19:10:10',0,0,0);
INSERT INTO `attendance` VALUES (28,'manager1',1,'2014-01-06 08:50:10','2014-01-06 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (29,'manager2',2,'2014-01-06 08:38:10','2014-01-06 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (30,'manager4',4,'2014-01-06 08:45:10','2014-01-06 18:30:10',0,0,0);
INSERT INTO `attendance` VALUES (31,'manager3',3,'2014-01-06 08:43:10','2014-01-06 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (32,'manager5',5,'2014-01-06 08:51:10','2014-01-06 18:14:10',0,0,0);
INSERT INTO `attendance` VALUES (33,'admin',1,'2014-01-06 08:57:10','2014-01-06 18:17:10',0,0,0);
INSERT INTO `attendance` VALUES (34,'clerts1',4,'2014-01-07 09:00:00','2014-01-07 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (35,'clerts2',4,'2014-01-07 10:10:10','2014-01-07 18:10:10',1,0,0);
INSERT INTO `attendance` VALUES (36,'clerty2',5,'2014-01-07 09:04:10','2014-01-07 18:20:10',1,0,0);
INSERT INTO `attendance` VALUES (37,'clerty1',5,'2014-01-07 08:30:10','2014-01-07 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (38,'clertz1',1,'2014-01-07 08:10:10','2014-01-07 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (39,'clertz2',1,'2014-01-07 09:10:10','2014-01-07 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (40,'clertc1',3,'2014-01-07 08:50:10','2014-01-07 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (41,'clertc2',3,'2014-01-07 08:53:10','2014-01-07 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (42,'clertg1',2,'2014-01-07 08:45:09','2014-01-07',0,-1,1);
INSERT INTO `attendance` VALUES (43,'clertg2',2,'2014-01-07 08:53:10','2014-01-07 15:10:10',0,1,0);
INSERT INTO `attendance` VALUES (44,'manager3',3,'2014-01-07 08:50:10','2014-01-07 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (45,'manager1',1,'2014-01-07 08:38:10','2014-01-07 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (46,'manager5',5,'2014-01-07 08:45:10','2014-01-07 18:30:10',0,0,0);
INSERT INTO `attendance` VALUES (47,'manager2',2,'2014-01-07 08:43:10','2014-01-07 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (48,'manager4',4,'2014-01-07 08:51:10','2014-01-07 18:14:10',0,0,0);
INSERT INTO `attendance` VALUES (49,'admin',1,'2014-01-07 08:50:20','2014-01-07 18:37:10',0,0,2);
INSERT INTO `attendance` VALUES (51,'clertg2',2,'2014-01-08 10:10:10','2014-01-08 18:10:10',1,0,0);
INSERT INTO `attendance` VALUES (52,'clertz2',1,'2014-01-08 09:04:10','2014-01-08 18:20:10',1,0,0);
INSERT INTO `attendance` VALUES (54,'clertc1',3,'2014-01-08 08:10:10','2014-01-08 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (55,'clertc2',3,'2014-01-08 09:10:10','2014-01-08 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (56,'clerts1',4,'2014-01-08 08:50:10','2014-01-08 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (57,'clerts2',4,'2014-01-08 08:53:10','2014-01-08 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (58,'clerty1',5,'2014-01-08 08:50:10','2014-01-08 15:12:10',0,1,0);
INSERT INTO `attendance` VALUES (59,'clerty2',5,'2014-01-08','2014-01-08',-1,-1,1);
INSERT INTO `attendance` VALUES (60,'manager3',3,'2014-01-08 08:50:10','2014-01-08 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (61,'manager2',2,'2014-01-08 08:38:10','2014-01-08 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (62,'manager4',4,'2014-01-08 08:45:10','2014-01-08 18:30:10',0,0,0);
INSERT INTO `attendance` VALUES (63,'manager5',5,'2014-01-08 08:43:10','2014-01-08 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (64,'manager1',1,'2014-01-08 08:51:10','2014-01-08 18:14:10',0,0,0);
INSERT INTO `attendance` VALUES (65,'admin',1,'2014-01-08 08:51:40','2014-01-08 18:21:10',0,0,2);
INSERT INTO `attendance` VALUES (66,'clerts1',4,'2014-01-09 08:10:10','2014-01-09 18:00:00',0,0,0);
INSERT INTO `attendance` VALUES (67,'clerts2',4,'2014-01-09 10:10:10','2014-01-09 18:10:10',1,0,0);
INSERT INTO `attendance` VALUES (68,'clertc2',3,'2014-01-09 09:04:10','2014-01-09 18:20:10',1,0,0);
INSERT INTO `attendance` VALUES (69,'clertc1',3,'2014-01-09 08:30:10','2014-01-09 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (71,'clertg2',2,'2014-01-09 09:10:10','2014-01-09 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (72,'clerty1',5,'2014-01-09 08:50:10','2014-01-09 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (73,'clerty2',5,'2014-01-09 08:53:10','2014-01-09 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (74,'clertz1',1,'2014-01-09 08:50:10','2014-01-09 15:12:10',0,1,0);
INSERT INTO `attendance` VALUES (75,'clertz2',1,'2014-01-09 08:53:10','2014-01-09 15:10:10',0,1,0);
INSERT INTO `attendance` VALUES (76,'manager1',1,'2014-01-09 08:50:10','2014-01-09 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (77,'manager2',2,'2014-01-09 08:38:10','2014-01-09 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (78,'manager5',5,'2014-01-09 08:45:10','2014-01-09 18:30:10',0,0,0);
INSERT INTO `attendance` VALUES (79,'manager3',3,'2014-01-09 08:43:10','2014-01-09 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (80,'manager4',4,'2014-01-09 08:51:10','2014-01-09 18:14:10',0,0,0);
INSERT INTO `attendance` VALUES (81,'admin',1,'2014-01-09','2014-01-09',-1,-1,1);
INSERT INTO `attendance` VALUES (130,'clertg1',2,'2014-01-09 09:10:00','2014-01-09 18:47:00',1,0,0);
INSERT INTO `attendance` VALUES (131,'clertz1',1,'2014-01-08 08:10:00','2014-01-08 08:10:00',0,0,0);
INSERT INTO `attendance` VALUES (132,'manager1',1,'2013-12-27 08:50:10','2013-12-27 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (133,'manager2',2,'2013-12-27 08:38:10','2013-12-27 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (134,'manager4',4,'2013-12-27 08:45:10','2013-12-27 18:30:10',0,0,0);
INSERT INTO `attendance` VALUES (135,'manager3',3,'2013-12-27 08:43:10','2013-12-27 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (136,'manager5',5,'2013-12-27 08:51:10','2013-12-27 18:14:10',0,0,0);
INSERT INTO `attendance` VALUES (137,'admin',1,'2013-12-27 08:57:10','2013-12-27 18:17:10',0,0,0);
INSERT INTO `attendance` VALUES (138,'clerts1',4,'2013-12-27 09:00:00','2013-12-27 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (139,'clerts2',4,'2013-12-27 10:10:10','2013-12-27 18:10:10',1,0,0);
INSERT INTO `attendance` VALUES (140,'clerty2',5,'2013-12-27 09:04:10','2013-12-27 18:20:10',1,0,0);
INSERT INTO `attendance` VALUES (141,'clerty1',5,'2013-12-27 08:30:10','2013-12-27 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (142,'clertz1',1,'2013-12-27 08:10:10','2013-12-27 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (143,'clertz2',1,'2013-12-27 09:10:10','2013-12-27 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (144,'clertc1',3,'2013-12-27 08:50:10','2013-12-27 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (145,'clertc2',3,'2013-12-27 08:53:10','2013-12-27 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (146,'clertg1',2,'2013-12-27 08:45:09','2013-12-27',0,-1,1);
INSERT INTO `attendance` VALUES (147,'clertg2',2,'2013-12-27 08:53:10','2013-12-27 15:10:10',0,1,0);
INSERT INTO `attendance` VALUES (148,'manager1',1,'2013-12-28 08:50:10','2013-12-28 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (149,'manager2',2,'2013-12-28 08:38:10','2013-12-28 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (151,'manager3',3,'2013-12-28 08:43:10','2013-12-28 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (152,'manager5',5,'2013-12-28 08:51:10','2013-12-28 18:14:10',0,0,0);
INSERT INTO `attendance` VALUES (153,'admin',1,'2013-12-28 08:57:10','2013-12-28 18:17:10',0,0,0);
INSERT INTO `attendance` VALUES (154,'clerts1',4,'2013-12-28 09:00:00','2013-12-28 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (155,'clerts2',4,'2013-12-28 10:10:10','2013-12-28 18:10:10',1,0,0);
INSERT INTO `attendance` VALUES (156,'clerty2',5,'2013-12-28 09:04:10','2013-12-28 18:20:10',1,0,0);
INSERT INTO `attendance` VALUES (157,'clerty1',5,'2013-12-28 08:30:10','2013-12-02 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (158,'clertz1',1,'2013-12-28 08:10:10','2013-12-28 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (159,'clertz2',1,'2013-12-28 09:10:10','2013-12-28 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (160,'clertc1',3,'2013-12-28 08:50:10','2013-12-28 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (161,'clertc2',3,'2013-12-28 08:53:10','2013-12-28 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (162,'clertg1',2,'2013-12-28 08:45:09','2013-12-28',0,-1,1);
INSERT INTO `attendance` VALUES (163,'clertg2',2,'2013-12-28 08:53:10','2013-12-28 15:10:10',0,1,0);
INSERT INTO `attendance` VALUES (164,'manager1',1,'2013-12-29 08:50:10','2013-12-29 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (165,'manager2',2,'2013-12-29 08:38:10','2013-12-29 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (166,'manager4',4,'2013-12-29 08:45:10','2013-12-29 18:30:10',0,0,0);
INSERT INTO `attendance` VALUES (167,'manager3',3,'2013-12-29 08:43:10','2013-12-29 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (168,'manager5',5,'2013-12-29 08:51:10','2013-12-29 18:14:10',0,0,0);
INSERT INTO `attendance` VALUES (169,'admin',1,'2013-12-29 08:57:10','2013-12-29 18:17:10',0,0,0);
INSERT INTO `attendance` VALUES (170,'clerts1',4,'2013-12-29 09:00:00','2013-12-29 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (171,'clerts2',4,'2013-12-29 10:10:10','2013-12-29 18:10:10',1,0,0);
INSERT INTO `attendance` VALUES (172,'clerty2',5,'2013-12-29 09:04:10','2013-12-29 18:20:10',1,0,0);
INSERT INTO `attendance` VALUES (173,'clerty1',5,'2013-12-29 08:30:10','2013-12-29 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (174,'clertz1',1,'2013-12-29 08:10:10','2013-12-29 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (175,'clertz2',1,'2013-12-29 09:10:10','2013-12-29 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (176,'clertc1',3,'2013-12-29 08:50:10','2013-12-29 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (177,'clertc2',3,'2013-12-29 08:53:10','2013-12-29 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (178,'clertg1',2,'2013-12-29 08:45:09','2013-12-29',0,-1,1);
INSERT INTO `attendance` VALUES (179,'clertg2',2,'2013-12-29 08:53:10','2013-12-29 15:10:10',0,1,0);
INSERT INTO `attendance` VALUES (180,'manager1',1,'2013-12-30 08:50:10','2013-12-30 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (181,'manager2',2,'2013-12-30 08:38:10','2013-12-30 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (182,'manager4',4,'2013-12-30 08:45:10','2013-12-30 18:30:10',0,0,0);
INSERT INTO `attendance` VALUES (183,'manager3',3,'2013-12-30 08:43:10','2013-12-30 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (184,'manager5',5,'2013-12-30 08:51:10','2013-12-30 18:14:10',0,0,0);
INSERT INTO `attendance` VALUES (185,'admin',1,'2013-12-30 08:57:10','2013-12-30 18:17:10',0,0,0);
INSERT INTO `attendance` VALUES (186,'clerts1',4,'2013-12-30 09:00:00','2013-12-30 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (187,'clerts2',4,'2013-12-30 10:10:10','2013-12-30 18:10:10',1,0,0);
INSERT INTO `attendance` VALUES (188,'clerty2',5,'2013-12-30 09:04:10','2013-12-30 18:20:10',1,0,0);
INSERT INTO `attendance` VALUES (189,'clerty1',5,'2013-12-30 08:30:10','2013-12-30 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (190,'clertz1',1,'2013-12-30 08:10:10','2013-12-30 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (191,'clertz2',1,'2013-12-30 09:10:10','2013-12-30 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (192,'clertc1',3,'2013-12-30 08:50:10','2013-12-30 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (193,'clertc2',3,'2013-12-30 08:53:10','2013-12-30 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (194,'clertg1',2,'2013-12-30 08:45:09','2013-12-30',-1,-1,1);
INSERT INTO `attendance` VALUES (195,'clertg2',2,'2013-12-30 08:53:10','2013-12-30 15:10:10',0,1,0);
INSERT INTO `attendance` VALUES (196,'manager1',1,'2013-12-31 08:50:10','2013-12-31 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (197,'manager2',2,'2013-12-31 08:38:10','2013-12-31 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (198,'manager4',4,'2013-12-31 08:45:10','2013-12-31 18:30:10',0,0,0);
INSERT INTO `attendance` VALUES (199,'manager3',3,'2013-12-31 08:43:10','2013-12-31 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (200,'manager5',5,'2013-12-31 08:51:10','2013-12-31 18:14:10',0,0,0);
INSERT INTO `attendance` VALUES (201,'admin',1,'2013-12-31 08:57:10','2013-12-31 18:17:10',0,0,0);
INSERT INTO `attendance` VALUES (202,'clerts1',4,'2013-12-31 09:00:00','2013-12-31 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (203,'clerts2',4,'2013-12-31 10:10:10','2013-12-31 18:10:10',1,0,0);
INSERT INTO `attendance` VALUES (204,'clerty2',5,'2013-12-31 09:04:10','2013-12-31 18:20:10',1,0,0);
INSERT INTO `attendance` VALUES (205,'clerty1',5,'2013-12-31 08:30:10','2013-12-31 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (206,'clertz1',1,'2013-12-31 08:10:10','2013-12-31 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (207,'clertz2',1,'2013-12-31 09:10:10','2013-12-31 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (208,'clertc1',3,'2013-12-31 08:50:10','2013-12-31 18:20:10',0,0,0);
INSERT INTO `attendance` VALUES (209,'clertc2',3,'2013-12-31 08:53:10','2013-12-31 18:10:10',0,0,0);
INSERT INTO `attendance` VALUES (210,'clertg1',2,'2013-12-31 08:45:09','2013-12-31',-1,-1,1);
INSERT INTO `attendance` VALUES (211,'clertg2',2,'2013-12-31 08:53:10','2013-12-31 15:10:10',0,1,0);
INSERT INTO `attendance` VALUES (350,'manager4',4,'2013-12-28 08:45:10','2013-12-28 18:30:10',0,0,0);
INSERT INTO `attendance` VALUES (500,'clertg1',2,'2014-01-08 08:00:00','2014-01-08 19:00:00',0,0,0);
INSERT INTO `attendance` VALUES (501,'admin',1,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (502,'manager1',1,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (503,'manager2',2,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (504,'manager3',3,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (505,'manager4',4,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (506,'manager5',5,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (507,'clertz1',1,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (508,'clertz2',1,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (509,'clertg1',2,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (510,'clertg2',2,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (511,'clertc1',3,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (512,'clertc2',3,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (513,'clerts1',4,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (514,'clerts2',4,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (515,'clerty1',5,'2014-01-10','2014-01-10',-1,-1,1);
INSERT INTO `attendance` VALUES (516,'clerty2',5,'2014-01-10','2014-01-10',-1,-1,1);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table department
#

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentid` int(11) DEFAULT NULL,
  `departmentname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Dumping data for table department
#

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,1,'总部');
INSERT INTO `department` VALUES (2,2,'公关部');
INSERT INTO `department` VALUES (3,3,'财务部');
INSERT INTO `department` VALUES (4,4,'市场部');
INSERT INTO `department` VALUES (5,5,'研究部');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table login
#

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Dumping data for table login
#

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'admin','123');
INSERT INTO `login` VALUES (2,'manager1','123');
INSERT INTO `login` VALUES (3,'manager2','123');
INSERT INTO `login` VALUES (4,'manager3','123');
INSERT INTO `login` VALUES (5,'manager4','123');
INSERT INTO `login` VALUES (6,'manager5','123');
INSERT INTO `login` VALUES (7,'clertz1','123');
INSERT INTO `login` VALUES (8,'clertz2','123');
INSERT INTO `login` VALUES (9,'clertg1','123');
INSERT INTO `login` VALUES (10,'clertg2','123');
INSERT INTO `login` VALUES (11,'clertc1','123');
INSERT INTO `login` VALUES (12,'clertc2','123');
INSERT INTO `login` VALUES (13,'clerts1','123');
INSERT INTO `login` VALUES (14,'clerts2','123');
INSERT INTO `login` VALUES (15,'clerty1','123');
INSERT INTO `login` VALUES (16,'clerty2','123');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user
#

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(10) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `departid` int(11) DEFAULT NULL,
  `power` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Dumping data for table user
#

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','管理员',1,2);
INSERT INTO `user` VALUES (2,'manager1','总部经理',1,1);
INSERT INTO `user` VALUES (3,'manager2','公关部经理',2,1);
INSERT INTO `user` VALUES (4,'manager3','财务部经理',3,1);
INSERT INTO `user` VALUES (5,'manager4','市场部经理',4,1);
INSERT INTO `user` VALUES (6,'manager5','研究部经理',5,1);
INSERT INTO `user` VALUES (7,'clertz1','刘嘉洋',1,0);
INSERT INTO `user` VALUES (8,'clertz2','张载钰',1,0);
INSERT INTO `user` VALUES (9,'clertg1','贺勇',2,0);
INSERT INTO `user` VALUES (10,'clertg2','余庆',2,0);
INSERT INTO `user` VALUES (11,'clertc1','张颌',3,0);
INSERT INTO `user` VALUES (12,'clertc2','贾羽',3,0);
INSERT INTO `user` VALUES (13,'clerts1','赵括',4,0);
INSERT INTO `user` VALUES (14,'clerts2','封子城',4,0);
INSERT INTO `user` VALUES (15,'clerty1','王子贺',5,0);
INSERT INTO `user` VALUES (16,'clerty2','贾珂',5,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table workday
#

CREATE TABLE `workday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workday` varchar(500) DEFAULT NULL,
  `worktype` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Dumping data for table workday
#

LOCK TABLES `workday` WRITE;
/*!40000 ALTER TABLE `workday` DISABLE KEYS */;
INSERT INTO `workday` VALUES (1,'01/03/2014',0);
/*!40000 ALTER TABLE `workday` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
