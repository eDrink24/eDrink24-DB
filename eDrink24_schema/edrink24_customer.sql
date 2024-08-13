-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: edrink24
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) NOT NULL,
  `gender` enum('남','여') NOT NULL DEFAULT '남',
  `loginId` varchar(50) NOT NULL,
  `pw` varchar(100) NOT NULL,
  `birthdate` datetime NOT NULL,
  `phoneNum` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `postalCode` varchar(50) NOT NULL,
  `address1` varchar(20) NOT NULL,
  `address2` varchar(20) NOT NULL,
  `currentLocation` varchar(50) DEFAULT NULL,
  `currentStore` varchar(50) DEFAULT NULL,
  `totalPoint` int NOT NULL DEFAULT '0',
  `role` varchar(20) NOT NULL DEFAULT '일반회원',
  `linkedId` bigint DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `loginId` (`loginId`),
  UNIQUE KEY `pw` (`pw`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'김영신','남','bigfaith0301@kakao.com','$2a$10$p1DJd4aNSCStxTKUoMW.bu7f5FkQsPW4kbKfGfO.vvCIlE.8.qPLG','1999-03-01 00:00:00','01063875097','bigfaith0301@kakao.com','48500','부산 남구 용소로46번길 7-5','203호',NULL,NULL,0,'일반회원',3657419023);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-13 11:36:19
