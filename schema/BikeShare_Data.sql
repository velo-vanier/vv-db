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
-- Dumping data for table `Accessory`
--

LOCK TABLES `Accessory` WRITE;
/*!40000 ALTER TABLE `Accessory` DISABLE KEYS */;
INSERT INTO `Accessory` VALUES (1,'1',1,'Update','Adult helmet, loren ipsum.','0000-00-00 00:00:00'),(2,'2',3,'Kryptonite U Evolution Mini-7 Heavy Duty Bicycle','Bike lock, loren ipsum','0000-00-00 00:00:00'),(3,'3',3,'Bike Light','Bike light loren ipsum','0000-00-00 00:00:00'),(4,'1',3,'Bolle Kids','Kids helmet notes ...','0000-00-00 00:00:00'),(5,'1',3,'Bolle Kids ','Kids helmet, loren ipsum','0000-00-00 00:00:00'),(6,'1',1,'Test',NULL,NULL),(7,'1',1,'Test',NULL,NULL),(8,'1',1,'Test',NULL,'2018-10-14 02:12:48');
/*!40000 ALTER TABLE `Accessory` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `AccessoryHistory`
--

LOCK TABLES `AccessoryHistory` WRITE;
/*!40000 ALTER TABLE `AccessoryHistory` DISABLE KEYS */;
INSERT INTO `AccessoryHistory` VALUES (1,1,1,'Accessory note - helmet, loren ipsum'),(2,2,1,'Lock history note, loren ipsum'),(3,3,1,'Light history note'),(4,4,2,'Kids helmet notes ...'),(5,5,3,'Kids helmet new note');
/*!40000 ALTER TABLE `AccessoryHistory` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `AccessoryType`
--

LOCK TABLES `AccessoryType` WRITE;
/*!40000 ALTER TABLE `AccessoryType` DISABLE KEYS */;
INSERT INTO `AccessoryType` VALUES (1,'Helmet'),(2,'Lock'),(3,'Lights');
/*!40000 ALTER TABLE `AccessoryType` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `Bike`
--

LOCK TABLES `Bike` WRITE;
/*!40000 ALTER TABLE `Bike` DISABLE KEYS */;
INSERT INTO `Bike` VALUES (1,'2','C01','SNHTJ15L48605','BlackBlueYellow Huffy Rockit',1,30,'18 X 1.5','black blue yellow','C','huffy rockit',_binary '',_binary '\0',_binary '\0',NULL),(2,'2','C02','PRM03122402','Firehawk Magic',1,35,'16 X 1.75','','C','Firehawk Magic',NULL,_binary '\0',_binary '\0',NULL),(3,'2','C03','YPC2024107    ','sweet   blue',1,80,'20 X 2.125','blue','C','sweet',NULL,_binary '\0',_binary '\0',NULL),(4,'2','C04','L8G1010263','blue Louis Garneau',6,35,'20 X 1.95','blue','C','louis garneau',NULL,_binary '\0',_binary '\0',NULL),(5,'2','C05',' TR423957LS','Blue Diva Tech Team',6,30,'20 X 2.0','blue','C','diva tech team',NULL,_binary '\0',_binary '\0',NULL),(6,'2','C06','BCI2239222','yellow Cherokee',1,35,'16X 2.125','yellow','C','cherokee',NULL,_binary '\0',_binary '\0',NULL),(7,'2','C07','WY01100336 ','Little Tykes pink',1,33,'18 X 2.125','pink','C','little tykes',NULL,_binary '\0',_binary '\0',NULL),(8,'2','C08','null','Red BMX',1,70,'20 X 1.95','red','C','bmx',NULL,_binary '\0',_binary '\0',NULL),(9,'2','C09','AB15A102475','Illusion Super Cycle pink',1,31,'16 X 2,125','pink','C','illusion super cycle',NULL,_binary '\0',_binary '\0',NULL),(10,'2','C10','DCT146064219','red Hyper  ',6,35,'20 X 2.25','red','C','hyper',NULL,_binary '\0',_binary '\0',NULL),(11,'2','C11','L6C0212475','Black/yellow Supercycle Impulse',5,55,'20 X 2.0','black yellow','C','supercycle impulse',NULL,_binary '\0',_binary '\0',NULL),(12,'2','C12','LWEA104203','Quest Rocket  red',1,30,'16 X 2.125','red','C','quest rocket',NULL,_binary '\0',_binary '\0',NULL),(13,'2','C13','WY1749881','Tribal Foxi  blue',6,60,'20 X 2.0','blue','C','tribal foxi',NULL,_binary '\0',_binary '\0',NULL),(14,'2','C14','L2Z0316488E','Sportex OST Ground Breaker blue',5,50,'20 X 2.0','blue','C','sportex ost ground breaker',NULL,_binary '\0',_binary '\0',NULL),(15,'2','C15','WTU081 P03130','Trek Mystic pink',0,85,'20X1.95','pink','C','trek mystic',NULL,_binary '\0',_binary '\0',NULL),(16,'2','C16','AB15L05056​5','Bleu-orang​e Supercycle',1,35,'16X​2.125','','C','Bleu-orang​e Supercycle',NULL,_binary '\0',_binary '\0',NULL),(17,'2','C17','AH15M09170​9','Bleu-orang​e Supercycle  ',1,35,'16X​2.125','','C','Bleu-orang​e Supercycle  ',NULL,_binary '\0',_binary '\0',NULL),(18,'2','C18','AL00004149​0','Black red Illusion',1,40,'16x1.95 2.125','black red','C','illusion',NULL,_binary '\0',_binary '\0',NULL),(19,'2','C19','BBC88C2724','Pink DisneyPrincess',1,35,'16x2.125','pink','C','disneyprincess',NULL,_binary '\0',_binary '\0',NULL),(20,'2','C20','PY00002190','Pink Intrepid Shadow',1,35,'20X 2.125','pink','C','intrepid shadow',NULL,_binary '\0',_binary '\0',NULL),(21,'2','C21','WTU131P0831B','Blue silver Trek',1,30,'16x2.125','blue silver','C','trek',NULL,_binary '\0',_binary '\0',NULL),(22,'2','C22','G1010040578','Orange Stoneridge Rocki Sport',1,30,'16 X 2.125 ','orange','C','stoneridge rocki sport',NULL,_binary '\0',_binary '\0',NULL),(23,'2','C23','GSO81114416','thrasher NaKaMuRa Green',1,45,'18 X 1.95','green','C','thrasher nakamura',NULL,_binary '\0',_binary '\0',NULL),(24,'2','C24',' SL03882695','Pink Barbie',1,35,'16x2.0','pink','C','barbie',NULL,_binary '\0',_binary '\0',NULL),(25,'2','C25','BCI2407941','Purple Sportek',1,40,'16 X 2.125','purple','C','sportek',NULL,_binary '\0',_binary '\0',NULL),(26,'2','C26','L981101339','blue_red Supercycle Illusion',0,60,'16X1.75','blue red','C','supercycle illusion',NULL,_binary '\0',_binary '\0',NULL),(27,'2','C27','BC-07','Norco grey',1,35,'16 X 2.125','grey','C','norco',NULL,_binary '\0',_binary '\0',NULL),(28,'2','C28','YF054492','Orange Raleigh Rock',6,60,'20 X 2.0','orange','C','raleigh rock',NULL,_binary '\0',_binary '\0',NULL),(29,'2','C29',' G060516556','Blue Quasar ',1,50,'16 X 2.0','blue','C','quasar',NULL,_binary '\0',_binary '\0',NULL),(30,'2','C30','18890534','Infinity Trouper  yellow',1,35,'16 X 2.125','yellow','C','infinity trouper',NULL,_binary '\0',_binary '\0',NULL),(31,'2','C31','RCG1058693',' Black Zoom ',6,50,'20 X 2.0','black','C','zoom',NULL,_binary '\0',_binary '\0',NULL),(32,'2','C32','AH180006212','Supercycle blue',1,35,'18 X 1.95','blue','C','supercycle',NULL,_binary '\0',_binary '\0',NULL),(33,'2','C33','SR101','Supercycle Red',0,10,'20 x 2,00','red','C','supercycle',NULL,_binary '\0',_binary '\0',NULL),(35,'2','C35','L7C1204722','Purple Cream Soda',14,60,'20 X 1.95','purple','C','cream soda',NULL,_binary '\0',_binary '\0',NULL),(36,'2','M01','5H08397','Black Citation  ',0,85,'27 x 1.125','black','M','citation',NULL,_binary '\0',_binary '\0',NULL),(37,'2','M02','L3c0117220','CCM black  Jeshua',0,60,'26 X 1.95','black','M','ccm   jeshua',NULL,_binary '\0',_binary '\0',NULL),(38,'2','M03','AV07A2465','Raleigh grey/black',24,75,'700 X 38C','black grey','M','raleigh',NULL,_binary '\0',_binary '\0',NULL),(39,'2','M04','EA151107539 ','Nakamura black green ',18,55,'700 X 38C','black green','M','nakamura',NULL,_binary '\0',_binary '\0',NULL),(40,'2','M05','F711F974   ','Nishiki aqua',18,35,'26 X 1.9','aqua','M','nishiki',NULL,_binary '\0',_binary '\0',NULL),(41,'2','M06','Check the seat post','Violet Venture MountainTour ',18,40,'26 X 2.0','violet','M','venture mountaintour',NULL,_binary '\0',_binary '\0',NULL),(42,'2','M07','00K0003545','Grey red black Norco Storm',21,60,'26 X 2.1','black grey red','M','norco storm',NULL,_binary '\0',_binary '\0',NULL),(43,'2','M08',' HXD04017','M08 Black/red Supercycle',12,85,'27X1.25','black red','M','m08   supercycle',NULL,_binary '\0',_binary '\0',NULL),(44,'2','M09','G070602485',' blk SportTek ',21,60,'26x1.75','','M',' blk SportTek ',NULL,_binary '\0',_binary '\0',NULL),(45,'2','M10','RB984805','Raleigh sprite brown',5,35,'27 X 1.25','brown','M','raleigh sprite',NULL,_binary '\0',_binary '\0',NULL),(46,'2','M11','Snfsd12cn0570','Blueblack supercycle',18,45,'26 X 1.95','black blue','M','supercycle',NULL,_binary '\0',_binary '\0',NULL),(47,'2','M12','K002757','Burgundy Free Spirit  ',6,60,'26 x 2.125','','M','Burgundy Free Spirit  ',NULL,_binary '\0',_binary '\0',NULL),(48,'2','M13','TH86072751​#0','Supercycle Sierra',15,45,'26 X 2.125','','M','Supercycle Sierra',NULL,_binary '\0',_binary '\0',NULL),(49,'2','M14',' S8010430','Blue/white Kuwahara',18,60,' 26 x 1.5','blue white','M','kuwahara',NULL,_binary '\0',_binary '\0',NULL),(51,'2','M16','LOC0503604','Supercycle SC1800 Blue',18,50,'26 X 1.95','blue','M','supercycle sc1800',NULL,_binary '\0',_binary '\0',NULL),(52,'2','M17','00020265S','Orange - Gary Fisher',10,50,'26 X 1.95','orange','M','gary fisher',NULL,_binary '\0',_binary '\0',NULL),(53,'2','M18','RCB40962','Raleigh Sport blue/white',18,55,'700 C 38C','blue white','M','raleigh sport',NULL,_binary '\0',_binary '\0',NULL),(54,'2','M19','BI1411 U4YY40319','Burgundy K2',7,60,'26 X 1.95','','M','Burgundy K2',NULL,_binary '\0',_binary '\0',NULL),(55,'2','M20','A9601096','MountainTour- Turquoise',0,60,'26 x 1.75','turquoise','M','mountaintour',NULL,_binary '\0',_binary '\0',NULL),(56,'2','M21','6K86272','Tempest Tourist Six',6,50,'26 X 1 3/8','','M','Tempest Tourist Six',NULL,_binary '\0',_binary '\0',NULL),(57,'2','M22','TK91200040','Iron Horse usa',21,55,'26 X 47/54','','M','Iron Horse usa',NULL,_binary '\0',_binary '\0',NULL),(58,'2','M23','J9  (by left pedal)','Supercycle Ascent EBO  red',12,35,'26X 1.75','red','M','supercycle ascent ebo',NULL,_binary '\0',_binary '\0',NULL),(59,'2','M24','003489598L','Narcos Streamer- Yellow',0,60,'26 X 1.90','silver','M','nakamura circuit',NULL,_binary '\0',_binary '\0',NULL),(61,'2','M25','P78Y','Apollo racer red ',0,85,'27 x 1 ¼','red','M','apollo racer',NULL,_binary '\0',_binary '\0',NULL),(63,'2','M27','1CC07C25714','M27 Infinity grey',18,60,'26 X 1.95','grey','M','m27 infinity',NULL,_binary '\0',_binary '\0',NULL),(64,'2','M28','AV07A27211','Diamondback  red grey',18,80,'700 X 38C','grey red','M','diamondback',NULL,_binary '\0',_binary '\0',NULL),(65,'2','M29','XV000802225','Action-Velo-Plus ',21,60,'700 X 38C','','M','Action-Velo-Plus ',NULL,_binary '\0',_binary '\0',NULL),(66,'2','M30','RE765891','Supercycle SC1800 Blue',18,60,'26 X 1.95','blue','M','supercycle sc1800',NULL,_binary '\0',_binary '\0',NULL),(68,'2','M32 ','MAR0014705','Supercycle vert',7,40,'26 X 2,125','','M','Supercycle vert',NULL,_binary '\0',_binary '\0',NULL),(69,'2','M33','RB004934','Raleigh Grand Prix Noir',10,75,'27 x 1,25','','M','Raleigh Grand Prix Noir',NULL,_binary '\0',_binary '\0',NULL),(71,'2','M35','RN923372','Red Raleigh Javelin',14,65,'27 x 1. 25','red','M','raleigh javelin',NULL,_binary '\0',_binary '\0',NULL),(72,'2','M36','G508121095','Nakamura Circuit silver',18,60,'26 x 1.95','silver','M','nakamura circuit',NULL,_binary '\0',_binary '\0',NULL),(73,'2','T01','LH04040093​0','Pink Barbie',1,25,'14 X 2.125','pink','T','barbie',NULL,_binary '\0',_binary '\0',NULL),(74,'2','T02','S99​120663','Bleu Arashi',1,35,'12.5X2.25','','T','Bleu Arashi',NULL,_binary '\0',_binary '\0',NULL),(76,'2','T04','84027870','Red/yellow Hotwheels racing team',1,35,'12.5X2.5','red yellow','T','hotwheels racing team',NULL,_binary '\0',_binary '\0',NULL),(77,'2','T05','PM03080086','Bleu Next Guppy',1,0,'12.5 x 2 1/4','','T','Bleu Next Guppy',NULL,_binary '\0',_binary '\0',NULL),(78,'2','T06','VS2001649','Gold Dragonfly',0,35,'14 X 2.125','gold','T','dragonfly',NULL,_binary '\0',_binary '\0',NULL),(79,'2','T07','AY02F012​49','Bleu Specialized',1,35,'12 X 2 1/4','','T','Bleu Specialized',NULL,_binary '\0',_binary '\0',NULL),(80,'2','T08','87258331','blue HotWheels ',1,35,'14x2.125','blue','T','hotwheels',NULL,_binary '\0',_binary '\0',NULL),(81,'2','T09','E05122015','Supercycle Dream  white/pink',1,30,'14 x 2.125','pink white','T','supercycle dream',NULL,_binary '\0',_binary '\0',NULL),(82,'2','T10','LS0301139','Burgundy Kidcool',1,30,'12 x 2.125','','T','Burgundy Kidcool',NULL,_binary '\0',_binary '\0',NULL),(83,'2','T11','DJFBO56755','PinkBarbie ',1,35,'14 X 2.125','pink','T','barbie',NULL,_binary '\0',_binary '\0',NULL),(84,'2','T12','AL00','Backyardigans vert',1,25,'12.5 X 2.25','','T','Backyardigans vert',NULL,_binary '\0',_binary '\0',NULL),(85,'2','T13','SNHTC17A7287','Finding Dory blue ',1,30,'14 1.95','blue','T','finding dory',NULL,_binary '\0',_binary '\0',NULL),(86,'2','T14','SNHC28L26610','Huffy Ariel turqoise',1,30,'14 X 1.75','','T','Huffy Ariel turqoise',NULL,_binary '\0',_binary '\0',NULL),(87,'2','W01','GJ91917','Purple SupercycleAscent ',12,35,'26X1.75','purple','W','supercycleascent',NULL,_binary '\0',_binary '\0',NULL),(88,'2','W02','B503000','RedGrey Next',18,50,'26 X 2.00','grey red','W','next',NULL,_binary '\0',_binary '\0',NULL),(89,'2','W03','A940106687','Bleu\\ Voyageur',12,35,'26 X 1.75','','W','Bleu Voyageur',NULL,_binary '\0',_binary '\0',NULL),(90,'2','W04','1106150087','Blue - Velosport',21,70,'700 X 38C','blue','W','velosport',NULL,_binary '\0',_binary '\0',NULL),(91,'2','W05','P9A86581','white turquoise Supercycle Ascent ',15,50,'26 X 1.75','turquoise white','W','supercycle ascent',NULL,_binary '\0',_binary '\0',NULL),(92,'2','W06','A054562','Supercycle 1500 Grey   ',15,40,'26 X 1.95','grey','W','supercycle 1500',NULL,_binary '\0',_binary '\0',NULL),(93,'2','W07','147277670','Blue Free Spirit  ',1,50,'26X 1 3/8','blue','W','free spirit',NULL,_binary '\0',_binary '\0',NULL),(94,'2','W08','238215982','Sekine blanc         ',5,65,'27 X 1.25','','W','Sekine blanc         ',NULL,_binary '\0',_binary '\0',NULL),(95,'2','W09','R5528178','Mountain tour Roadrunner   ',6,35,'24 X 1.75”','','W','Mountain tour Roadrunner   ',NULL,_binary '\0',_binary '\0',NULL),(96,'2','W10','7B515921LV ','Sportek Reven Black/white ',21,4065,'24 X 1.95','black white','W','sportek reven',NULL,_binary '\0',_binary '\0',NULL),(98,'2','W12','RH113538','Raleigh Campus blue    ',5,47,'26 x 1 3/8','blue','W','raleigh campus',NULL,_binary '\0',_binary '\0',NULL),(99,'2','W13','CS509129','Miele blue     ',6,80,'No number','blue','W','miele',NULL,_binary '\0',_binary '\0',NULL),(100,'2','W14','GB14E03753','Babboe cargo black',7,60,'26 x 1.75 20 x2.1','black','W','babboe cargo',NULL,_binary '\0',_binary '\0',NULL),(101,'2','W15','SNFSD12FD9681','Supercycle rose / noir',18,45,'26 X 1.95','','W','Supercycle rose / noir',NULL,_binary '\0',_binary '\0',NULL),(102,'2','W16','WY970103328 ','Vagabond purple',18,60,'26x1.95 ','purple','W','vagabond',NULL,_binary '\0',_binary '\0',NULL),(103,'2','W17','HSBK01438','Norco Arctic turquoise',0,75,'700 X 38C','turquoise','W','norco arctic',NULL,_binary '\0',_binary '\0',NULL),(105,'2','W19','C911110103','Minelli gris-noir',75,50,'700 X 38C','','W','Minelli gris-noir',NULL,_binary '\0',_binary '\0',NULL),(106,'2','W20','WTU1256244P','Trek 700 Blue',21,60,'700 x 38C','blue','W','trek 700',NULL,_binary '\0',_binary '\0',NULL),(107,'2','XM01','WSBC602 309646F','brown Global ',14,95,'700X35C','brown','XM','global',NULL,_binary '\0',_binary '\0',NULL),(108,'2','XM02','WSBC602 309649F','brown Global ',14,95,'700X35C','brown','XM','global',NULL,_binary '\0',_binary '\0',NULL),(109,'2','XM03','WSBC602 309650F','brown Global ',14,95,'700X35C','brown','XM','global',NULL,_binary '\0',_binary '\0',NULL),(110,'2','XM04','CD125197','Specialized black',14,85,'700X28C','black','XM','specialized',NULL,_binary '\0',_binary '\0',NULL),(111,'2','XM05','RCY1001479​0','Diamondbac​k black  ',21,80,'700 x 45C','black','XM','diamondbac​k',NULL,_binary '\0',_binary '\0',NULL),(112,'2','XM06','XV0137260','Blue-rust Action Velo-Plus',21,53,'26.1.95','blue','XM','rust action velo plus',NULL,_binary '\0',_binary '\0',NULL),(113,'2','XM07','S15MAMJKE 0012','Stevens S8 Elite',0,53,'29 X 2.0','','XM','Stevens S8 Elite',NULL,_binary '\0',_binary '\0',NULL),(114,'2','XM08','S15MAMJKE 0039','Stevens S8 Elite',0,53,'29 X 2.0','','XM','Stevens S8 Elite',NULL,_binary '\0',_binary '\0',NULL),(115,'2','XM09','S15MAMJKE 0064','Stevens S8 Elite',0,53,'29 X 2.0','','XM','Stevens S8 Elite',NULL,_binary '\0',_binary '\0',NULL),(116,'2','XM10','PRE0425147','Miele Verona',21,70,'700X38C','','XM','Miele Verona',NULL,_binary '\0',_binary '\0',NULL),(117,'2','XM11','IC0011H02278','Opus Ivan grey 76 Augusta',7,60,'26 X 2.0','grey','XM','opus ivan  76 augusta',NULL,_binary '\0',_binary '\0',NULL),(118,'2','XM13','IC0G11J02719','Opus Ivan grey 78 Besserer',7,60,'26 X 2.0','grey','XM','opus ivan  78 besserer',NULL,_binary '\0',_binary '\0',NULL),(119,'2','XM14','IC0G11J02725','Opus Ivan grey 79 Stewart',7,60,'26 X 2.0','grey','XM','opus ivan  79 stewart',NULL,_binary '\0',_binary '\0',NULL),(120,'2','XM15','IC0G11J02737','Opus Ivan grey 80 Chapel',7,60,'26 X 2.0','grey','XM','opus ivan  80 chapel',NULL,_binary '\0',_binary '\0',NULL),(121,'2','XM16','IB0011J02713','Opus Ivan grey 81 Nelson',7,60,'26 X 2.0','grey','XM','opus ivan  81 nelson',NULL,_binary '\0',_binary '\0',NULL),(122,'2','XM17','IC0G11J02715','Opus Ivan grey 82 Range',7,60,'26 X 2.0','grey','XM','opus ivan  82 range',NULL,_binary '\0',_binary '\0',NULL),(123,'2','XM18','IC0611H02265','Opus Ivan grey 83 Russell',7,60,'26 X 2.0','grey','XM','opus ivan  83 russell',NULL,_binary '\0',_binary '\0',NULL),(124,'2','XM19','IC0611H02287','Opus Ivan grey 84 Sweetland',7,60,'26 X 2.0','grey','XM','opus ivan  84 sweetland',NULL,_binary '\0',_binary '\0',NULL),(125,'2','XM20','IC0811HO2305','Opus Gris',65,40,'26 X 2.0','','XM','Opus Gris',NULL,_binary '\0',_binary '\0',NULL),(126,'2','XW01','WSBC602 309678F','Women\'s burgundy Global ',14,95,'700X35C','','XW','Women\'s burgundy Global ',NULL,_binary '\0',_binary '\0',NULL),(127,'2','XW02','WSBC606 051633F','W red Global ',1,80,'700X35C','red','XW','w  global',NULL,_binary '\0',_binary '\0',NULL),(128,'2','XW03','WSBC602 242440F','Women\'s burgundy Global ',14,95,'700X35C','','XW','Women\'s burgundy Global ',NULL,_binary '\0',_binary '\0',NULL),(129,'2','XW04',' C78C0563','Giant Cyprus blue/white',21,70,'700X38C','blue white','XW','giant cyprus',NULL,_binary '\0',_binary '\0',NULL),(130,'2','XW05','P3BH34691','Blue/silver Specialized ',21,95,'700X38C','blue silver','XW','specialized',NULL,_binary '\0',_binary '\0',NULL),(131,'2','XWO6','C911110117','Minelli Silhouette',21,80,'28 x 1 ⅝ x 1 ½','','XW','Minelli Silhouette',NULL,_binary '\0',_binary '\0',NULL),(132,'2','Y01','RD603707','Purple Next ',18,50,'26x1.95','purple','Y','next',NULL,_binary '\0',_binary '\0',NULL),(133,'2','Y02','HG10834','blue CCM ECCO',18,60,'24 X 1.95','blue','Y','ccm ecco',NULL,_binary '\0',_binary '\0',NULL),(134,'2','Y03','Y26125099','youth\'s Bonelli blue white',15,40,'24X2 ','blue white','Y','youth\'s bonelli',NULL,_binary '\0',_binary '\0',NULL),(135,'2','Y04','AL12C1550','CCM Static black    ',21,45,'F 24 X 2.10 R 24X1.95','black','Y','ccm static',NULL,_binary '\0',_binary '\0',NULL),(136,'2','Y05','BC70841355','Free Spirit   turqoise  ',18,45,'24 X 1.95','','Y','Free Spirit   turqoise  ',NULL,_binary '\0',_binary '\0',NULL),(137,'2','Y06','RG1210713    ','Next Challenger  mauve/yellow',18,40,'24 X 1.95','yellow','Y','next challenger  mauve',NULL,_binary '\0',_binary '\0',NULL),(138,'2','Y07','Snfsd12387931','blueblack supercycle  ',18,45,'24 X 1.95','black blue','Y','supercycle',NULL,_binary '\0',_binary '\0',NULL),(139,'2','Y08','Snfsd120l9712','blueblack supercycle 24\"  \"',18,45,'24 X 1.95','black blue','Y','supercycle 24\"',NULL,_binary '\0',_binary '\0',NULL),(140,'2','Y09','L3c0136696','Purple supercycle 24\"  \"',18,60,'24 X 1.95','purple','Y','supercycle 24\"',NULL,_binary '\0',_binary '\0',NULL),(141,'2','Y10','AH14K08492​6','Silver and blue Supercycle 1800  ',18,55,'26 X 1.95','blue silver','Y','supercycle 1800',NULL,_binary '\0',_binary '\0',NULL),(142,'2','Y11','R0900163','Raleigh_Hotfoot_grey-yellow',15,45,'24 X 2.00','grey yellow','Y','raleigh hotfoot',NULL,_binary '\0',_binary '\0',NULL),(143,'2','Y12','BI-0415','Trek Mountain Track white',18,75,'26 x 2.0','white','Y','trek mountain track',NULL,_binary '\0',_binary '\0',NULL),(144,'2','Y13','SNMN609AZ7638','Schwinn kicker pro',21,60,'F:24 X 2.125 et R:24 X 1.95','','Y','Schwinn kicker pro',NULL,_binary '\0',_binary '\0',NULL),(145,'2','Y14','D819755','Velosport 50 mauve',18,55,'24X1.95','','Y','Velosport 50 mauve',NULL,_binary '\0',_binary '\0',NULL),(146,'2','Y15','002Y2023  ','Giant turquoise ',18,60,'24 X 1.95','turquoise','Y','giant',NULL,_binary '\0',_binary '\0',NULL),(147,'2','Y16','RB07012435','Y16 Supercycle SC1800 purple',18,60,'24X1.95','purple','Y','y16 supercycle sc1800',NULL,_binary '\0',_binary '\0',NULL),(148,'2','Y17','JD01010','Grey  CCM ',18,60,'24X2.1','grey','Y','ccm',NULL,_binary '\0',_binary '\0',NULL),(149,'2','Y18','RE438314','black Triumph',15,45,'24 X2.0','black','Y','triumph',NULL,_binary '\0',_binary '\0',NULL),(150,'2','Y19','BB05C03787','Red West Coast Chopper  ',1,35,'20 x 3.0','red','Y','west coast chopper',NULL,_binary '\0',_binary '\0',NULL),(151,'2','Y20','SM406283LV','Carrera Warrior  red grey',18,60,'24 X 1.95','grey red','Y','carrera warrior',NULL,_binary '\0',_binary '\0',NULL),(167,'2','Fraser04','FR-04','Fraser Test - Norco grey',1,35,'16 X 2.125',NULL,'Fraser',NULL,NULL,_binary '\0',_binary '\0',NULL),(169,'2','Fraser05','FR-05','Fraser Test - Norco grey',1,35,'16 X 2.125',NULL,'Fraser',NULL,NULL,_binary '\0',_binary '\0',NULL),(171,'2','Fraser06','FR-06','Fraser Test - Norco grey',1,35,'16 X 2.125',NULL,'Fraser',NULL,NULL,_binary '\0',_binary '\0',NULL),(173,'2','U-172','12345','Fraser Test - Norco grey',1,35,'16 X 2.125',NULL,NULL,NULL,NULL,_binary '\0',_binary '\0',NULL),(174,'2','C-174','123456','Fraser Test - Norco grey',1,35,'16 X 2.125',NULL,'C',NULL,NULL,_binary '\0',_binary '\0',NULL),(175,'5','Y-175','09870987','best damn bike',3,123,'15','Rainbow','Y','BMX',NULL,_binary '\0',_binary '\0',NULL),(177,'2','C-176','1233456','Fraser Test - Norco grey',1,35,'16 X 2.125',NULL,'C',NULL,_binary '\0',_binary '\0',_binary '\0',NULL),(178,'2','C-178','12356','Fraser Test - Norco grey',1,35,'16 X 2.125',NULL,'C',NULL,_binary '\0',_binary '\0',_binary '\0',NULL),(180,'6','C-179','123516','Fraser Test - Norco grey',1,35,'16 X 2.125',NULL,'C',NULL,_binary '\0',_binary '\0',_binary '','2018-10-14 16:17:49'),(183,'2','C-181','123576','Fraser Test - Norco grey',1,35,'16 X 2.125',NULL,'C',NULL,_binary '\0',_binary '\0',_binary '\0',NULL),(184,'2','C-184','1235768','Fraser Test - Norco grey',1,35,'16 X 2.125',NULL,'C',NULL,_binary '\0',_binary '',_binary '','2018-10-14 02:28:42'),(186,'2','W-185','90870987','Sharon\'s bike',3,999,'26 inches','Rainbow','W','Raleigh',_binary '',_binary '',_binary '','2018-10-14 02:50:21');
/*!40000 ALTER TABLE `Bike` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BikeHistory`
--

LOCK TABLES `BikeHistory` WRITE;
/*!40000 ALTER TABLE `BikeHistory` DISABLE KEYS */;
INSERT INTO `BikeHistory` VALUES (1,1,3,2,'2018-02-01 00:00:00','2018-03-01 00:00:00','2018-03-01 00:00:00',NULL,'Notes, loren ipsum',0),(2,2,4,2,NULL,NULL,NULL,NULL,'Kid1 notes',0),(3,3,5,2,NULL,NULL,NULL,NULL,'kid2 notes',0),(4,4,NULL,1,NULL,NULL,NULL,NULL,'notes, staff user',0),(5,5,3,3,'2018-03-01 00:00:00','2018-04-01 00:00:00','2018-04-01 00:00:00',NULL,NULL,0),(6,180,1,2,'2018-03-01 00:00:00','2018-05-01 00:00:00','2018-06-01 00:00:00',NULL,NULL,6),(7,180,NULL,NULL,'2018-05-01 00:00:00',NULL,NULL,NULL,NULL,2),(8,180,NULL,NULL,'2018-10-14 01:14:03',NULL,'2018-09-01 00:00:00','2018-10-14 01:39:14',NULL,3),(9,180,NULL,NULL,'2018-10-14 01:39:15',NULL,NULL,NULL,NULL,5),(10,180,NULL,NULL,'2018-10-14 01:39:25',NULL,'2018-09-01 00:00:00',NULL,NULL,6),(11,180,NULL,NULL,'2018-10-14 02:26:49',NULL,'2018-11-01 00:00:00',NULL,NULL,5),(12,180,10,NULL,'2018-10-14 16:17:49',NULL,NULL,NULL,NULL,6);
/*!40000 ALTER TABLE `BikeHistory` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `BikePart`
--

LOCK TABLES `BikePart` WRITE;
/*!40000 ALTER TABLE `BikePart` DISABLE KEYS */;
INSERT INTO `BikePart` VALUES (1,'Seat'),(2,'Gears'),(3,'Wheels'),(4,'Brakes'),(5,'Handlebars'),(6,'Pedals'),(7,'Other');
/*!40000 ALTER TABLE `BikePart` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BikePhoto`
--

LOCK TABLES `BikePhoto` WRITE;
/*!40000 ALTER TABLE `BikePhoto` DISABLE KEYS */;
INSERT INTO `BikePhoto` VALUES (96,73,210,NULL),(97,136,211,NULL),(98,127,212,NULL),(99,30,213,NULL),(100,124,214,NULL),(101,106,215,NULL),(102,38,216,NULL),(103,45,217,NULL),(104,14,218,NULL),(105,48,219,NULL),(106,108,220,NULL),(107,113,221,NULL),(108,95,222,NULL),(109,135,223,NULL),(110,22,224,NULL),(111,99,225,NULL),(112,76,226,NULL),(113,36,227,NULL),(114,10,228,NULL),(115,115,229,NULL),(116,85,230,NULL),(117,74,231,NULL),(118,55,232,NULL),(119,24,233,NULL),(120,18,234,NULL),(121,130,235,NULL),(122,23,236,NULL),(123,44,237,NULL),(124,128,238,NULL),(125,66,239,NULL),(126,148,240,NULL),(127,4,241,NULL),(128,129,242,NULL),(129,78,243,NULL),(130,81,244,NULL),(131,137,245,NULL),(132,118,246,NULL),(133,89,247,NULL),(134,134,248,NULL),(135,143,249,NULL),(136,41,250,NULL),(137,119,251,NULL),(138,110,252,NULL),(139,100,253,NULL),(140,105,254,NULL),(141,103,255,NULL),(142,72,256,NULL),(143,116,257,NULL),(144,54,258,NULL),(145,65,259,NULL),(146,77,260,NULL),(147,32,261,NULL),(148,92,262,NULL),(149,101,263,NULL),(150,35,264,NULL),(151,13,265,NULL),(152,139,266,NULL),(153,122,267,NULL),(154,27,268,NULL),(155,28,269,NULL),(156,11,270,NULL),(157,123,271,NULL),(158,1,272,NULL),(159,125,273,NULL),(160,88,274,NULL),(161,107,275,NULL),(162,17,276,NULL),(163,3,277,NULL),(164,46,278,NULL),(165,138,279,NULL),(166,112,280,NULL),(167,102,281,NULL),(168,131,282,NULL),(169,12,283,NULL),(170,53,284,NULL),(171,147,285,NULL),(172,111,286,NULL),(173,83,287,NULL),(174,121,288,NULL),(175,2,289,NULL),(176,51,290,NULL),(177,151,291,NULL),(178,63,292,NULL),(179,144,293,NULL),(180,42,294,NULL),(181,109,295,NULL),(182,98,296,NULL),(183,126,297,NULL),(184,68,298,NULL),(185,120,299,NULL),(186,6,300,NULL),(187,140,301,NULL),(188,26,302,NULL),(189,39,303,NULL),(190,47,304,NULL);
/*!40000 ALTER TABLE `BikePhoto` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `BikeRepair`
--

LOCK TABLES `BikeRepair` WRITE;
/*!40000 ALTER TABLE `BikeRepair` DISABLE KEYS */;
/*!40000 ALTER TABLE `BikeRepair` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Photo`
--

LOCK TABLES `Photo` WRITE;
/*!40000 ALTER TABLE `Photo` DISABLE KEYS */;
INSERT INTO `Photo` VALUES (210,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/T01++Pink+Barbie++LH04040093​0++25++14+X+2.125_00002633.jpg','2018-10-14 16:14:14'),(211,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y05++Free+Spirit+turquoise+BC70841355++45++24+X+1.95_00001317.jpg','2018-10-14 16:14:15'),(212,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XW02++red+Global+++WSBC606+051633F++80++700X35C_00000705.jpg','2018-10-14 16:14:15'),(213,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C30+Infinity+Trouper+yellow+18890534+25+1+16+X+2.125_130126.jpg','2018-10-14 16:14:15'),(214,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM19+Opus+Ivan+grey+84+Sweetland+IC0611H02287+60+7+26+X+2.0_142219.jpg','2018-10-14 16:14:16'),(215,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W20+Trek+700+Blue+WTU1256244P+60+21+700+x+38C_121937.jpg','2018-10-14 16:14:16'),(216,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M03++Raleigh+greyblack++AV07A2465++75++700+X+38C_00002926.jpg','2018-10-14 16:14:17'),(217,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M10++Raleigh+sprite+brown++RB984805++35++27+X+1.25_00001036.jpg','2018-10-14 16:14:17'),(218,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C14++Sportex+OST+Ground+Breaker+blue++L2Z0316488E++50++20+X+2.0_00002799.jpg','2018-10-14 16:14:17'),(219,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M13++Supercycle+Sierra++TH86072751​#0++45++26+X+2.125_00001943.jpg','2018-10-14 16:14:19'),(220,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM02_brown+Global_WSBC602+309649F_++95_+++700X35C_113002.jpg','2018-10-14 16:14:19'),(221,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM07_Stevens+s8+Elite+noire+S15MAMJKE+0012+53+29x2.0+0711_084831.jpg','2018-10-14 16:14:19'),(222,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W09+++Mountain+tour+Roadrunner+++++R5528178++35++24+X+1.75_00001508.jpg','2018-10-14 16:14:20'),(223,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y04++CCM+Static+black+AL12C1550++45++F+24+X+2.10+R+24X1.95_00001654.jpg','2018-10-14 16:14:20'),(224,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C22+orange+RockiSport__30_+16X2.125__164042.jpg','2018-10-14 16:14:20'),(225,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W13+Miele+blue+CS509129++80___429.jpg','2018-10-14 16:14:21'),(226,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/T04++Redyellow+Hotwheels+racing+team++84027870++35++12.5X2.5_00002510.jpg','2018-10-14 16:14:21'),(227,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M01++Black+Citation++++5H08397++85++27x1.125+_00002992.jpg','2018-10-14 16:14:22'),(228,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C10++red+Hyper++++DCT146064219++35++20+X+2.25_00001655.jpg','2018-10-14 16:14:22'),(229,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM09_Stevens+S8+Elite+noire+S15MAMJKE+0064+53+29x2.0+0711_085839.jpg','2018-10-14 16:14:22'),(230,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/T13+Huffy+Finding+Dory+blue+SNHTC17A7287+30+1+14+X+1.95_153413.jpg','2018-10-14 16:14:23'),(231,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/T02+Bleu+Arashi++S99​120663++35++12.5X2.25_00002995.jpg','2018-10-14 16:14:23'),(232,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M20+MountainTourtrquise+A9601096+60+25X1.75+223011.jpg','2018-10-14 16:14:24'),(233,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C24++Pink+Barbie+SL03882695+35+16x2.0_142708.jpg','2018-10-14 16:14:24'),(234,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C18+Black+red+Illusion+AL00004149​0+35_16x1.95+2.125_153645.jpg','2018-10-14 16:14:24'),(235,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XW05+Bluesilver+Specialized+P3BH34691++95++700X38C_00002990.jpg','2018-10-14 16:14:25'),(236,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C23+thasher+Nakamura_Vert_GS081114416_45_18+X+1.95+_102249.jpg','2018-10-14 16:14:25'),(237,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M09+blk+SportTek+G070602485+60+21+26x1.75_00000184.jpg','2018-10-14 16:14:25'),(238,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XW03++burgundy+Global+++WSBC602+242440F++95++700X35C_00000703.jpg','2018-10-14 16:14:26'),(239,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M30+Supercycle+SC1800+Blue+RE765891+60+18+26+X+1.95_135809.jpg','2018-10-14 16:14:26'),(240,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y17+GreyCCM+JD01010+60+18+24X2.1_155130.jpg','2018-10-14 16:14:27'),(241,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C04+blue+Louis+Garneau++L8G1010263++35++20+X+1.95_00001480.jpg','2018-10-14 16:14:27'),(242,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XW04+Giant+Cyprus+bluewhite++C78C0563++70++700X38C_00002049.jpg','2018-10-14 16:14:27'),(243,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/T06++Gold+Dragonfly++VS2001649++35++14+X+2.125_00003013.jpg','2018-10-14 16:14:28'),(244,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/T09+SupercycleDream+whitepink_30_14x2.125_00000050.jpg','2018-10-14 16:14:28'),(245,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y06++Next+Challenger++mauveyellow++RG1210713++++++40++24+X+1.95_00002061.jpg','2018-10-14 16:14:28'),(246,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM13+Opus+Ivan+grey78+Besserer+IC0G11J02719+60+7+26+X+2.0.jpg','2018-10-14 16:14:29'),(247,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W03+Bleu+Voyageur+A940106687+35_12+26X1.75_00000200.jpg','2018-10-14 16:14:29'),(248,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y03++Bonelli+blue+white++Y26125099++40++24X2+_00001936.jpg','2018-10-14 16:14:29'),(249,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y12+Trek+Mountain+Track+white+75+26+x+2.0+BI-0415+Y12_00000054.jpg','2018-10-14 16:14:30'),(250,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M06+Violet+MountainTour_na_40','2018-10-14 16:14:30'),(251,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM14+Opus+Ivan+grey79+Stewart+IC0G11J02725+60+7+26+X+2.0+151723.jpg','2018-10-14 16:14:31'),(252,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM04+Specialized+black+CD125197++85++700X28C_00001987.jpg','2018-10-14 16:14:31'),(253,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W14+Babboe+cargo+blk+GB14E03753+60+7+26+x+1.75+20+x2.1_172824.jpg','2018-10-14 16:14:31'),(254,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W19+Minelli+gris-noir+C911110103++50+70++700+X+38C_0793.jpg','2018-10-14 16:14:32'),(255,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W17+Norco+Arctic+turquoise+HSBK01438+75+21+700+X+38C_122019.jpg.jpg','2018-10-14 16:14:32'),(256,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M36+Nakamura+Circuit+silver+G508121095+60+18+26+x+1.95_121402.jpg','2018-10-14 16:14:32'),(257,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM10+Miele+Verona+PRE0425147_70_700X38C_115036.jpg','2018-10-14 16:14:33'),(258,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M19+++Burgundy+K2++BI1411+U4YY40319++60++26+X+1.95_00001947.jpg','2018-10-14 16:14:33'),(259,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M29+Action-Velo-Plus++XV000802225+60+21+700+38C_444.jpg','2018-10-14 16:14:34'),(260,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/T05+Bleu+Next+Guppy++PM03080086++​35++12.5+x+2+1.125_00003009.jpg','2018-10-14 16:14:34'),(261,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C32+Supercycle+blue+AH180006212+35+1+18+X+1.95+174831.jpg','2018-10-14 16:14:34'),(262,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W06++Supercycle+1500+Grey+++++A054562+++++26+X+1.95_00000034.jpg','2018-10-14 16:14:35'),(263,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/w15++Supercycle_Rose_noir+SNFSD12FD9681_45_26+X+1.95_100313.jpg','2018-10-14 16:14:35'),(264,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C35+purple+Cream+Soda+L7C1204722++60+1+20+X+1.95_162256.jpg','2018-10-14 16:14:35'),(265,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C13++Tribal+Foxi++blue++WY1749881++60++20+X+2.0_00002797.jpg','2018-10-14 16:14:36'),(266,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y08++blueblack+supercycle+Snfsd120l9712++45++24+X+1.95_00000620.jpg','2018-10-14 16:14:36'),(267,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM17+greyOpusIvan+82Range+IC0G11J02715+60+7+26+X+2.0+_142520.jpg','2018-10-14 16:14:36'),(268,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C27+Norco+grey+BC-07+35+1+16+X+2.125+_145002.jpg','2018-10-14 16:14:37'),(269,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C28+Orange+Raleigh+Rock+YF054492+60+6+20+X+2.0_130050.jpg','2018-10-14 16:14:37'),(270,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C11+Blackyellow+Supercycle+Impulse++L6C0212475++55++20+X+2.0_152223.jpg','2018-10-14 16:14:38'),(271,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM18+Opus+Ivan+grey+83+Russell+IC0611H02265+60+7+26+X+2.0_151351.jpg','2018-10-14 16:14:38'),(272,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C01+blue+black+yellow+Huffy++SNHTJI5L48605+30+18X1.5_162317.jpg','2018-10-14 16:14:38'),(273,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM20_132153.jpg','2018-10-14 16:14:39'),(274,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W02+Redgrey+Next+B503000+50+26x2.00_131358.jpg','2018-10-14 16:14:39'),(275,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM01++brown+Global+++WSBC602+309646F++95++700X35C+_00000709.jpg','2018-10-14 16:14:39'),(276,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C17+bleu-orange+AH15M091709_35_16X​2.125_20170531_104913.jpg','2018-10-14 16:14:40'),(277,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C03+sweet_blue_YPC2024107+80_20+X+2.125_00000950.jpg','2018-10-14 16:14:40'),(278,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M11+++Blueblack+supercycle+++Snfsd12cn0571++45++26+X+1.95__00000067.jpg','2018-10-14 16:14:40'),(279,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y07+++blueblack+supercycle++++Snfsd12387931++45++24+X+1.95_00000616.jpg','2018-10-14 16:14:41'),(280,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM06BluRst+ActnVeloPlus+XV0137260+53+26x1.95_130639.jpg','2018-10-14 16:14:41'),(281,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W16+prple+Vagabond+WY970103328+60++26x1.95+31644.jpg','2018-10-14 16:14:42'),(282,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XWO6+Minelli+Silhouette_C911110117_80_28x1⅝x1½_114751.jpg','2018-10-14 16:14:42'),(283,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C12++Quest+Rocketred+LWEA104203++30++16+X+2.125_00002628.jpg','2018-10-14 16:14:42'),(284,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M18+Raleigh+Sport+bluwht+RCB40962+55+18+700X38c_210043.jpg','2018-10-14 16:14:43'),(285,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y16+Supercycle+SC1800+purple+RB07012435+60+18+24+X+1.95_131207.jpg','2018-10-14 16:14:43'),(286,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM05+Diamondbac​k+black++++RCY1001479​0++80++700+x+45C_332.jpg','2018-10-14 16:14:43'),(287,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/T11+PinkBarbie_DJFBO56755_35_14x2.125_153153.jpg','2018-10-14 16:14:44'),(288,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM16+Opus+Ivan+grey81+Nelson+IB0011J02713+60+7+26+X+2.0+_151442.jpg','2018-10-14 16:14:45'),(289,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C02+Firehawk+Magic++PRM03122402++35++16+X+1.75_102545.jpg','2018-10-14 16:14:45'),(290,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M16+Supercycle+SC1800+Blue+LOC0503604+50+18+26+X+1.95+110546.jpg','2018-10-14 16:14:46'),(291,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y20+Carrera+Warrior++red+grey+SM406283LV+60+18+24+X+1.95_153721.jpg','2018-10-14 16:14:46'),(292,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M27+Infinity+grey+1CC07C25714+60+18+26x1.95+162857.jpg','2018-10-14 16:14:47'),(293,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y13+Schwinn+kicker+pro_grey_Snmn609az7638_60_24+x+2.125_+24+x+1.95_103155.jpg','2018-10-14 16:14:47'),(294,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M07+Grey+red+black+Norco+Storm++00K0003545++60++26+X+2.1_00002961.jpg','2018-10-14 16:14:48'),(295,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM03++brown+Global+++WSBC602+309650F++95++700X35C_00000700.jpg','2018-10-14 16:14:48'),(296,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/W12+WRaleigh+blue+RH113538++47++26+x+1+3_8_331.jpg','2018-10-14 16:14:48'),(297,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XW01++burgundy+Global+++WSBC602+309678F++95++700X35C_00000711.jpg','2018-10-14 16:14:49'),(298,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M32+vert+MAR0014705++40+X+2','2018-10-14 16:14:49'),(299,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/XM15+Opus+Ivan+grey80+Chapel+IC0G11J02737+60+7+26+X+2.0.jpg','2018-10-14 16:14:50'),(300,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C06+yellow+Cherokee++BCI2239222++35++16X+2.125_00000772.jpg','2018-10-14 16:14:50'),(301,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/Y09++Purple+supercycle+L3c0136696++60++24+X+1.95_00000628.jpg','2018-10-14 16:14:51'),(302,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/C26+blue_red+Supercycle+Illusion+L981101339+60+1+16X1.75_103147.jpg','2018-10-14 16:14:51'),(303,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M04+Nakamura+blckgrn+EA151107539+55+700x38C+151621.jpg','2018-10-14 16:14:51'),(304,'https://s3.amazonaws.com/velo-vanier/images/bikeImages/M12++Burgundy+Free+Spirit++++K002757++60++26+x+2.125_00002616.jpg','2018-10-14 16:14:52');
/*!40000 ALTER TABLE `Photo` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
INSERT INTO `Status` VALUES (2,'Available'),(3,'Onloan'),(4,'Onhold'),(5,'Intest'),(6,'Inrepair'),(7,'Mia'),(8,'Scrapped'),(9,'Givenaway');
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Staff','Staff FirstName','Staff LastName','staff@domain.com','613-123-4567','sdfsdfsdf',NULL,NULL,NULL,NULL),(2,'Volunteer','Volunteer FirstName','Volunteer LastName','volunteer@domain.com','613-234-2344','df,jghdfjghksdjfhg4',NULL,NULL,NULL,NULL),(3,'Borrower','Borrower3 FirstName','Borrower3 LastName','borrower3@otherdomain.com','613-675-4444','3453534v34vv',NULL,NULL,'K1L3B5',NULL),(4,'Borrower','Kid1 FirstName','Kid1 LastName','','',NULL,3,NULL,NULL,NULL),(5,'Borrower','Kid2 FirstName','Kid2 LastName','','',NULL,3,NULL,NULL,NULL),(6,'Borrower','Borrower6 FirstName','Borrower6 LastName','borrower6@yahoo.com','613-435-3455','334rfwefafaf',NULL,NULL,NULL,NULL),(7,'Borrower','Borrower3 FirstName','Borrower3 LastName','borrower3@otherdomain.com','613-675-5677','3453534v34vv',NULL,NULL,NULL,NULL),(8,'Borrower','Borrower3 FirstName','Borrower3 LastName','borrower3@otherdomain.com','613-675-5677','3453534v34vv',3,NULL,NULL,NULL),(9,'Borrower','Borrower3 FirstName','Borrower3 LastName','borrower3@otherdomain.com','613-675-5677','3453534v34vv',3,NULL,NULL,NULL),(10,'Borrower','Borrower3 FirstName','Borrower3 LastName','borrower3@otherdomain.com','613-675-5677','3453534v34vv',3,NULL,'K1L3B5',NULL),(11,'Borrower','','','aadeparusi@yahoo.co.uk ','438 925 1174',NULL,NULL,NULL,NULL,NULL),(12,'Borrower','','','AALLAGOUMA@GMAIL.COM ','613 302-0430',NULL,NULL,NULL,NULL,NULL),(13,'Borrower','','','aallagoumak.ka@gmail.com','613 302 0430',NULL,NULL,NULL,NULL,NULL),(14,'Borrower','','','Adebolaoye804@gmail.com','',NULL,NULL,NULL,NULL,NULL),(15,'Borrower','','','ahmedahmedhoussein93@gmail.com','613 219 4338',NULL,NULL,NULL,NULL,NULL),(16,'Borrower','','','Alain Lauzon  262 St Jacques Street','613 897 0747',NULL,NULL,NULL,NULL,NULL),(17,'Borrower','','','alanna c <alannabegg@gmail.com>','',NULL,NULL,NULL,NULL,NULL),(18,'Borrower','','','aminat512014@yahoo.com','514-604-6500',NULL,NULL,NULL,NULL,NULL),(19,'Borrower','','','amuyango@gmail.com','613 862 0934',NULL,NULL,NULL,NULL,NULL),(20,'Borrower','','','andrelauzon427@gmail.com','613 413 6980',NULL,NULL,NULL,NULL,NULL),(21,'Borrower','','','Ashley.leahy123@gmail.com','',NULL,NULL,NULL,NULL,NULL),(22,'Borrower','Béatrice','Shirambere  ','bshir1@ocdsb.ca','613 642-3035',NULL,NULL,NULL,NULL,NULL),(23,'Borrower','','','BThiom@cscvanier.com','',NULL,NULL,NULL,NULL,NULL),(24,'Borrower','','','ceallagouma@gmail.com','',NULL,NULL,NULL,NULL,NULL),(25,'Borrower','','','cgirincuti@yahoo.com','',NULL,NULL,NULL,NULL,NULL),(26,'Borrower','TUYISENIGE','DIEUMERCI  ','CHRISBRADIRICK@GMAIL.COM   ','613 608-7753',NULL,NULL,NULL,NULL,NULL),(27,'Borrower','','','CKISAIG@GMAIL.COM','',NULL,NULL,NULL,NULL,NULL),(28,'Borrower','','','ckisang@ymail.com','438 826-7877',NULL,NULL,NULL,NULL,NULL),(29,'Borrower','','','cmajor492@gmail.com','613 807-1914',NULL,NULL,NULL,NULL,NULL),(30,'Borrower','','','Daniel.shema@yahoo.com','613 410-3695',NULL,NULL,NULL,NULL,NULL),(31,'Borrower','','','dianeceant@gmail.com','',NULL,NULL,NULL,NULL,NULL),(32,'Borrower','','','edouardniyimbona@yahoo.fr','',NULL,NULL,NULL,NULL,NULL),(33,'Borrower','','','endikumana2000@gmail.com','613 700 3966',NULL,NULL,NULL,NULL,NULL),(34,'Borrower','','','espemugisha@yahoo.com','',NULL,NULL,NULL,NULL,NULL),(35,'Borrower','','','esther.adhobandro@gmail.com','',NULL,NULL,NULL,NULL,NULL),(36,'Borrower','','','Fawad@hotmail.com','',NULL,NULL,NULL,NULL,NULL),(37,'Borrower','','','flath066@uottawa.ca','',NULL,NULL,NULL,NULL,NULL),(38,'Borrower','','','flawlesslawless2005@hotmail.com','',NULL,NULL,NULL,NULL,NULL),(39,'Borrower','','','Gerry_1954@hotmail.com','',NULL,NULL,NULL,NULL,NULL),(40,'Borrower','','','gmurga@cscvanier.com ','',NULL,NULL,NULL,NULL,NULL),(41,'Borrower','','','hilda.ogbegie@gmail.com','',NULL,NULL,NULL,NULL,NULL),(42,'Borrower','','','info@lecpc.ca','',NULL,NULL,NULL,NULL,NULL),(43,'Borrower','','','jasonjuneau84@gmail.com','613 619 0190',NULL,NULL,NULL,NULL,NULL),(44,'Borrower','','','jbizimana20@gmail.com','',NULL,NULL,NULL,NULL,NULL),(45,'Borrower','','','Jeshuasarmales18@gmail.com','',NULL,NULL,NULL,NULL,NULL),(46,'Borrower','','','jkamargi5@gmail.com','',NULL,NULL,NULL,NULL,NULL),(47,'Borrower','','','jngahuguru@yahoo.fr','',NULL,NULL,NULL,NULL,NULL),(48,'Borrower','','','jocelynentunkwenimana@yahoo.com','',NULL,NULL,NULL,NULL,NULL),(49,'Borrower','','','josephkamanzi11@gmail.com','',NULL,NULL,NULL,NULL,NULL),(50,'Borrower','','','jtoussaint@cscvanier.com','',NULL,NULL,NULL,NULL,NULL),(51,'Borrower','','','Kisamaata@gmail.com','613 879-8241',NULL,NULL,NULL,NULL,NULL),(52,'Borrower','','','latheo@hotmail.ca','613 712-8493',NULL,NULL,NULL,NULL,NULL),(53,'Borrower','','','Leokadiam@gmail.com','613 415-6107',NULL,NULL,NULL,NULL,NULL),(54,'Borrower','','','LLemarquis2015@gmail.com','613 745-0495',NULL,NULL,NULL,NULL,NULL),(55,'Borrower','','','lshan013@jottawa.ca','',NULL,NULL,NULL,NULL,NULL),(56,'Borrower','','','m_aboudeeb@yahoo.com','',NULL,NULL,NULL,NULL,NULL),(57,'Borrower','','','maguymudioko@gmail.com','613 808-2716',NULL,NULL,NULL,NULL,NULL),(58,'Borrower','','','marydiane@gmail.com','',NULL,NULL,NULL,NULL,NULL),(59,'Borrower','','','Mbarak@bujra.com','613 882-0700',NULL,NULL,NULL,NULL,NULL),(60,'Borrower','','','mcbidley@gmail.com','',NULL,NULL,NULL,NULL,NULL),(61,'Borrower','','','michaelkoffi26@gmail.com','',NULL,NULL,NULL,NULL,NULL),(62,'Borrower','','','MichaelNsenga@gmail.com ','',NULL,NULL,NULL,NULL,NULL),(63,'Borrower','Emery ','Ndikumagenge  ','ndikemery@yahoo.fr','613-262-6240',NULL,NULL,NULL,NULL,NULL),(64,'Borrower','','','ngalimkelcie@gmail.com','',NULL,NULL,NULL,NULL,NULL),(65,'Borrower','Astère ','Mayango ','','613 862 0934',NULL,NULL,NULL,NULL,NULL),(66,'Borrower','ALI ','MOHAMED  ','','613-762-4921',NULL,NULL,NULL,NULL,NULL),(67,'Borrower','Béatrice','','','613 700-7377',NULL,NULL,NULL,NULL,NULL),(68,'Borrower','Victor ','Lacroix ','','613-746-6104',NULL,NULL,NULL,NULL,NULL),(69,'Borrower','Ruben ','DeOlivera ','','613 745-5330',NULL,NULL,NULL,NULL,NULL),(70,'Borrower','Soo ','Thomson  ','','613 795-1107',NULL,NULL,NULL,NULL,NULL),(71,'Borrower','Tsiaro ','Rakototiana   ','','819 329-2578',NULL,NULL,NULL,NULL,NULL),(72,'Borrower','Alain ','Lauzon ','','613 897 0747',NULL,NULL,NULL,NULL,NULL),(73,'Borrower','','','ohiugo14@gmail.com','',NULL,NULL,NULL,NULL,NULL),(74,'Borrower','','','olufunmilayomorafa@gmail.com','',NULL,NULL,NULL,NULL,NULL),(75,'Borrower','Oriana ','Ngabirano ','oriana.nga@gmail.com','613 286-3783',NULL,NULL,NULL,NULL,NULL),(76,'Borrower','','','qfawad@hotmail.com','',NULL,NULL,NULL,NULL,NULL),(77,'Borrower','','','rebeccaevajoy@gmail.com','',NULL,NULL,NULL,NULL,NULL),(78,'Borrower','Rianky ','Richmond ','ricria23@ecolecatholique.ca','613 501-5688',NULL,NULL,NULL,NULL,NULL),(79,'Borrower','','','robynnrich@gmail.com','',NULL,NULL,NULL,NULL,NULL),(80,'Borrower','','','sandrichez@gmail.com','',NULL,NULL,NULL,NULL,NULL),(81,'Borrower','Serge ','Twizere ','Sergetwizere','613 608-7543',NULL,NULL,NULL,NULL,NULL),(82,'Borrower','Silas ','Ikechukwu ','silas_ike20@yahoo.com','438 925 4203',NULL,NULL,NULL,NULL,NULL),(83,'Borrower','','','skylarnichol1999@hotmail.com','',NULL,NULL,NULL,NULL,NULL),(84,'Borrower','','','solangefortin@bell.net ','',NULL,NULL,NULL,NULL,NULL),(85,'Borrower','','','Starletico@gmail.com','',NULL,NULL,NULL,NULL,NULL),(86,'Borrower','','','sunnyagodi@outlook.com','',NULL,NULL,NULL,NULL,NULL),(87,'Borrower','Sylvie ','Bazizane ','Sylvie_vien44@hotmail.com',' ',NULL,NULL,NULL,NULL,NULL),(88,'Borrower','','','Tarek.Moustafa@hotmail.com','613  513  8905',NULL,NULL,NULL,NULL,NULL),(89,'Borrower','','','tosinbellar@gmail.com','',NULL,NULL,NULL,NULL,NULL),(90,'Borrower','','','vclepine@hotmail.com','',NULL,NULL,NULL,NULL,NULL),(91,'Borrower','','','Virginiesynie@hotmail.com','613 502-0132',NULL,NULL,NULL,NULL,NULL),(92,'Borrower','','','walaatunen@gmail.com','613 746 2302',NULL,NULL,NULL,NULL,NULL),(93,'Borrower','Sharon','Kennedy','sharonkennedy100@gmail.com','6478981710',NULL,NULL,'2018-10-14 15:45:29','K1LL0L',NULL),(94,'Borrower','Sharon','Kennedy','sharon@nomadiclabs.ca','6478981710',NULL,NULL,'2018-10-14 15:59:53','K1L5N8',NULL),(95,'Borrower','Sharon','Kennedy','sharon+test@nomadiclabs.ca','6478981710',NULL,NULL,'2018-10-14 16:01:17','K1L5N8',NULL),(96,'Borrower','Sharon','Kennedy','sharon@nomadiclabs.ca','6478981710',NULL,NULL,'2018-10-14 16:01:59','K1L0L0',NULL),(97,'Borrower','Sharon','Kennedy','sharon@nomadiclabs.ca','6478981710',NULL,NULL,'2018-10-14 16:02:53','K1L5N8',NULL),(98,'Borrower','Sharon','Kennedy','sharon@nomadiclabs.ca','6478981710',NULL,NULL,'2018-10-14 16:03:30','K1L5N8',NULL),(99,'Borrower','Majid','AkbariSterabadi','majid.akbari@outlook.com','6132940023',NULL,NULL,'2018-10-14 16:12:08','K1L6N2',NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `UserPhoto`
--

LOCK TABLES `UserPhoto` WRITE;
/*!40000 ALTER TABLE `UserPhoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserPhoto` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-14 12:28:35
