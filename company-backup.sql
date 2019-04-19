-- MySQL dump 10.13  Distrib 8.0.2-dmr, for Linux (x86_64)
--
-- Host: localhost    Database: company
-- ------------------------------------------------------
-- Server version	8.0.2-dmr

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `average_salary`
--

DROP TABLE IF EXISTS `average_salary`;
/*!50001 DROP VIEW IF EXISTS `average_salary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `average_salary` AS SELECT 
 1 AS `AVG`,
 1 AS `MAX`,
 1 AS `MIN`,
 1 AS `COUNT`,
 1 AS `sum`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `DNAME` varchar(30) DEFAULT NULL,
  `DNO` varchar(20) NOT NULL DEFAULT '',
  `MGRSSN` varchar(20) DEFAULT NULL,
  `MGRSTARTDATE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Development','DD001','00002','2010-04-01'),('Future Direction','FT002','00003','2009-01-01'),('Human Resource','HR000','00001','2014-05-01'),('Product Department','PR003','00004','2012-02-09'),('Safety Department','SF004','00005','2013-03-12');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `ENAME` varchar(10) DEFAULT NULL,
  `ESSN` varchar(20) NOT NULL DEFAULT '',
  `ADDRESS` varchar(50) DEFAULT NULL,
  `SALARY` double DEFAULT NULL,
  `SUPERSSN` varchar(20) DEFAULT NULL,
  `DNO` varchar(10) DEFAULT NULL,
  `HID` varchar(20) NOT NULL,
  PRIMARY KEY (`ESSN`),
  KEY `dno_index` (`DNO`),
  KEY `salary_index` (`SALARY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('John','00001','America',10000,NULL,'HR000','1'),('Mike','00002','America',10000,NULL,'DD001','1'),('Carpela','00003','PRC',20000,NULL,'FT002','1'),('张蔷','00004','PRC',8000,NULL,'PR003','1'),('李为','00005','PRC',12000,NULL,'SF004','1'),('Hover','00006','Italy',8000,'00001','HR000','1'),('Winter','00007','France',7000,'00006','HR000','1'),('John J','00008','PRC',8000,'00001','HR000','1'),('李从文','00009','PRC',900,'00001','HR000','1'),('张红','00010','PRC',6000,'00008','HR000','1'),('TJ','00011','Fenland',8000,'00002','DD001','1'),('张天佑','00012','PRC',8000,'00002','DD001','1'),('李天斯','00013','PRC',8000,'00012','DD001','1'),('Steve','00014','America',8000,'00012','DD001','1'),('Bill','00015','America',8000,'00012','DD001','1'),('Kelinton','00016','America',2000,'00012','DD001','1'),('Peter','00017','England',6000,'00010','HR000','2'),('Robert','00018','England',1000,'00004','PR003','1'),('Lee','00019','America',1000,'00004','PR003','1'),('Micheal','00020','India',1000,'00004','PR003','1'),('张一','00021','PRC',1000,'00004','SF004','2'),('张二','00022','PRC',1000,'00004','PR003','1'),('张三','00023','PRC',1000,'00004','HR000','1'),('李一','00024','PRC',1000,'00004','SF004','1'),('李二','00025','PRC',1000,'00004','PR003','1'),('李三','00026','PRC',1000,'00004','SF004','1'),('李四','00027','PRC',1000,'00004','PR003','1'),('李五','00028','PRC',1000,'00004','PR003','1'),('赵地','00029','PRC',1000,'00004','SF004','1'),('赵天','00030','PRC',1000,'00004','PR003','1'),('赵静','00031','PRC',1000,'00004','PR003','1'),('赵耀','00032','PRC',1000,'00004','SF004','1'),('赵群','00033','PRC',1000,'00004','PR003','1'),('赵天穹','00034','PRC',1000,'00004','SF004','1'),('钱松','00035','PRC',1000,'00004','SF004','1'),('钱前','00036','PRC',1000,'00004','FT002','1'),('钱由','00037','PRC',1000,'00004','PR003','1'),('钱德宝','00038','PRC',1000,'00004','PR003','1'),('孙大圣','00039','PRC',1000,'00004','SF004','1'),('孙小果','00040','PRC',1000,'00004','PR003','1'),('孙建','00041','PRC',1000,'00004','PR003','1'),('孙李','00042','PRC',1000,'00004','PR003','1'),('Alice','00043','America',1000,'00004','FT002','1'),('Bob','00044','America',1000,'00004','PR003','1'),('Candy','00045','America',1000,'00004','SF004','1'),('Herbert','00046','America',1000,'00004','SF004','1'),('Dijkstra','00047','America',1000,'00004','PR003','1'),('Ert','00048','America',1000,'00004','PR003','1'),('Jack','00049','America',1000,'00004','FT002','1'),('Mozart','00050','America',1000,'00004','FT002','1'),('Zed','00051','America',1000,'00004','FT002','1'),('tyul','00117','USA',20000,'NULL','HR000','1');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_on`
--

DROP TABLE IF EXISTS `friend_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `friend_on` (
  `EID1` varchar(20) NOT NULL,
  `EID2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_on`
--

LOCK TABLES `friend_on` WRITE;
/*!40000 ALTER TABLE `friend_on` DISABLE KEYS */;
INSERT INTO `friend_on` VALUES ('00001','00002'),('00001','00006'),('00001','00002'),('00002','00006'),('00003','00002'),('00001','00006');
/*!40000 ALTER TABLE `friend_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobby`
--

DROP TABLE IF EXISTS `hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hobby` (
  `LID` varchar(10) NOT NULL,
  `LCONTENT` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobby`
--

LOCK TABLES `hobby` WRITE;
/*!40000 ALTER TABLE `hobby` DISABLE KEYS */;
INSERT INTO `hobby` VALUES ('1','Travel'),('2','Swimming');
/*!40000 ALTER TABLE `hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hometown`
--

DROP TABLE IF EXISTS `hometown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hometown` (
  `HID` varchar(20) NOT NULL,
  `HNAME` varchar(20) NOT NULL,
  PRIMARY KEY (`HID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hometown`
--

LOCK TABLES `hometown` WRITE;
/*!40000 ALTER TABLE `hometown` DISABLE KEYS */;
INSERT INTO `hometown` VALUES ('1','上海'),('2','北京');
/*!40000 ALTER TABLE `hometown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `project` (
  `PNAME` varchar(30) DEFAULT NULL,
  `PNO` varchar(20) NOT NULL DEFAULT '',
  `PLOCATION` varchar(255) DEFAULT NULL,
  `DNO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('API Server','P1','Washington','FT002'),('Product Sales','P10','BEJ','PR003'),('Linux Project','P2','BEJ','DD001'),('SQL Project','P3','Harbin','DD001'),('OS Project','P4','Seattle','PR003'),('Internet Project','P5','New York','SF004'),('PL Project','P6','Hangzhou','DD001'),('Star Future','P7','BEJ','HR000'),('Resturant Center','P8','Shenzhen','PR003'),('Lujiazui','P9','Shanghai','FT002');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signature`
--

DROP TABLE IF EXISTS `signature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `signature` (
  `SID` varchar(10) NOT NULL,
  `SCONTENT` varchar(200) NOT NULL,
  KEY `SID` (`SID`),
  CONSTRAINT `signature_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `employee` (`essn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signature`
--

LOCK TABLES `signature` WRITE;
/*!40000 ALTER TABLE `signature` DISABLE KEYS */;
INSERT INTO `signature` VALUES ('00001','sig for testing'),('00002','sig for production');
/*!40000 ALTER TABLE `signature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `works_on` (
  `ESSN` varchar(20) NOT NULL DEFAULT '',
  `PNO` varchar(20) NOT NULL DEFAULT '',
  `HOURS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ESSN`,`PNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('00001','P1','40'),('00002','P1','40'),('00003','P1','40'),('00004','P1','40'),('00005','P1','40'),('00006','P1','40'),('00007','P1','40'),('00008','P1','40'),('00009','P1','40'),('00010','P1','40'),('00011','P1','120'),('00011','P10','21'),('00011','P2','60'),('00011','P3','40'),('00011','P4','40'),('00011','P5','40'),('00011','P6','40'),('00011','P7','40'),('00011','P8','20'),('00011','P9','35'),('00012','P1','40'),('00012','P2','80'),('00013','P1','40'),('00013','P3','10'),('00014','P1','40'),('00014','P3','30'),('00015','P1','40'),('00015','P3','110'),('00016','P1','40'),('00017','P1','40'),('00018','P1','40'),('00019','P1','40'),('00020','P1','40'),('00021','P1','40'),('00022','P1','40'),('00023','P1','40'),('00024','P1','40'),('00025','P1','40'),('00026','P1','40'),('00027','P1','40'),('00028','P1','40'),('00029','P1','40'),('00030','P1','40'),('00031','P1','40'),('00032','P1','40'),('00033','P1','40'),('00034','P1','40'),('00035','P1','40'),('00036','P1','40'),('00037','P1','40'),('00038','P1','40'),('00039','P1','40'),('00040','P1','40'),('00041','P1','40'),('00042','P1','40'),('00043','P1','40'),('00044','P1','40'),('00045','P1','40'),('00046','P1','40'),('00047','P1','40'),('00048','P1','40'),('00049','P1','40'),('00050','P1','40'),('00051','P1','40');
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `average_salary`
--

/*!50001 DROP VIEW IF EXISTS `average_salary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `average_salary` AS select round(avg(`employee`.`SALARY`),2) AS `AVG`,max(`employee`.`SALARY`) AS `MAX`,min(`employee`.`SALARY`) AS `MIN`,count(0) AS `COUNT`,sum(`employee`.`SALARY`) AS `sum` from `employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-19 15:19:39
