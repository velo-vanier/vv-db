CREATE DATABASE  IF NOT EXISTS `BikeShare` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `BikeShare`;
-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: bikesharemysql.cwf839dt8hxr.us-east-2.rds.amazonaws.com    Database: BikeShare
-- ------------------------------------------------------
-- Server version	5.7.23-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED='';

--
-- Table structure for table `Accessory`
--

DROP TABLE IF EXISTS `Accessory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accessory` (
  `ID_Accessory` int(32) NOT NULL AUTO_INCREMENT,
  `ID_Type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID_Status` tinyint(4) DEFAULT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` longtext COLLATE utf8mb4_unicode_ci,
  `CreateDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Accessory`),
  KEY `fk_Accessory_Status` (`ID_Status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AccessoryHistory`
--

DROP TABLE IF EXISTS `AccessoryHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessoryHistory` (
  `ID_AccHistory` int(32) NOT NULL AUTO_INCREMENT,
  `ID_Assce` int(32) NOT NULL,
  `ID_BikeHistory` int(32) NOT NULL,
  `Note` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID_AccHistory`),
  KEY `fk_AccessoryHistory_Accessory_idx` (`ID_Assce`),
  CONSTRAINT `fk_AccessoryHistory_Accessory` FOREIGN KEY (`ID_Assce`) REFERENCES `Accessory` (`ID_Accessory`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AccessoryType`
--

DROP TABLE IF EXISTS `AccessoryType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AccessoryType` (
  `ID_AccessoryType` int(32) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_AccessoryType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Bike`
--

DROP TABLE IF EXISTS `Bike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bike` (
  `ID_Bike` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Status` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BikeLabel` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SerialNumber` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GearCount` int(11) DEFAULT NULL,
  `TireMaxPSI` int(11) DEFAULT NULL,
  `TireSize` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Color` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Class` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Brand` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BellHorn` bit(1) DEFAULT NULL,
  `Reflectors` bit(1) DEFAULT NULL,
  `Lights` bit(1) DEFAULT NULL,
  `LastStatusChanged` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_Bike`),
  UNIQUE KEY `Label_UNIQUE` (`BikeLabel`),
  UNIQUE KEY `Serial_UNIQUE` (`SerialNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BikeHistory`
--

DROP TABLE IF EXISTS `BikeHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BikeHistory` (
  `ID_BikeHistory` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Bike` int(11) DEFAULT NULL,
  `ID_BikeUser` int(11) DEFAULT NULL,
  `ID_StaffUser` int(11) DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT NULL,
  `LoanDateTime` datetime DEFAULT NULL,
  `DueDateTime` datetime DEFAULT NULL,
  `ReturnDateTime` datetime DEFAULT NULL,
  `Notes` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ID_Status` tinyint(4) NOT NULL,
  PRIMARY KEY (`ID_BikeHistory`),
  KEY `fk_BikeHistory_BikeUser_idx` (`ID_BikeUser`),
  KEY `fk_BikeHistory_StaffUser_idx` (`ID_StaffUser`),
  KEY `fk_BikeHistory_Status` (`ID_Status`),
  KEY `fk_BikeHistory_Bike_idx` (`ID_Bike`),
  CONSTRAINT `fk_BikeHistory_Bike` FOREIGN KEY (`ID_Bike`) REFERENCES `Bike` (`ID_Bike`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BikeHistory_BikeUser` FOREIGN KEY (`ID_BikeUser`) REFERENCES `User` (`ID_User`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BikeHistory_StaffUser` FOREIGN KEY (`ID_StaffUser`) REFERENCES `User` (`ID_User`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BikeHistory_Status` FOREIGN KEY (`ID_Status`) REFERENCES `Status` (`ID_Status`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BikePart`
--

DROP TABLE IF EXISTS `BikePart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BikePart` (
  `ID_BPart` int(32) NOT NULL AUTO_INCREMENT,
  `PartName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_BPart`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BikePhoto`
--

DROP TABLE IF EXISTS `BikePhoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BikePhoto` (
  `ID_BikePhoto` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Bike` int(11) DEFAULT NULL,
  `ID_Photo` int(11) DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_BikePhoto`),
  UNIQUE KEY `uq_bike_photo` (`ID_Bike`,`ID_Photo`),
  KEY `fk_BikePhoto_Bike_idx` (`ID_Bike`),
  KEY `fk_BikePhoto_Photo_idx` (`ID_Photo`),
  CONSTRAINT `fk_BikePhoto_Bike` FOREIGN KEY (`ID_Bike`) REFERENCES `Bike` (`ID_Bike`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BikePhoto_Photo` FOREIGN KEY (`ID_Photo`) REFERENCES `Photo` (`ID_Photo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BikeRepair`
--

DROP TABLE IF EXISTS `BikeRepair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BikeRepair` (
  `ID_BRepair` int(32) NOT NULL AUTO_INCREMENT,
  `ID_Bike` int(32) NOT NULL,
  `ID_BPart` int(32) NOT NULL,
  `Note` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID_BRepair`),
  KEY `fk_BikeRepair_Bike` (`ID_Bike`),
  KEY `fk_BikeRepair_BikePart` (`ID_BPart`),
  CONSTRAINT `fk_BikeRepair_Bike` FOREIGN KEY (`ID_Bike`) REFERENCES `Bike` (`ID_Bike`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BikeRepair_BikePart` FOREIGN KEY (`ID_BPart`) REFERENCES `BikePart` (`ID_BPart`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Photo`
--

DROP TABLE IF EXISTS `Photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Photo` (
  `ID_Photo` int(32) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CreateDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Photo`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Status` (
  `ID_Status` tinyint(4) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `ID_User` int(32) NOT NULL AUTO_INCREMENT,
  `Role` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FirstName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LastName` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ParentID` int(32) DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `PostalCode` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PhotoConsent` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_User`),
  KEY `ID_User` (`ID_User`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UserPhoto`
--

DROP TABLE IF EXISTS `UserPhoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserPhoto` (
  `ID_UserPhoto` int(11) NOT NULL,
  `ID_User` int(11) DEFAULT NULL,
  `ID_Photo` int(11) DEFAULT NULL,
  `CreateDateTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_UserPhoto`),
  KEY `fk_UserPhoto_User_idx` (`ID_User`),
  KEY `fk_UserPhoto_Photo_idx` (`ID_Photo`),
  CONSTRAINT `fk_UserPhoto_Photo` FOREIGN KEY (`ID_Photo`) REFERENCES `Photo` (`ID_Photo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_UserPhoto_User` FOREIGN KEY (`ID_User`) REFERENCES `User` (`ID_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-14  9:52:37
