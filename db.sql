CREATE DATABASE  IF NOT EXISTS `cricket` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cricket`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cricket
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) DEFAULT NULL,
  `AUTHOR` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_NAME` varchar(45) DEFAULT NULL,
  `STATE_ID` int(11) DEFAULT NULL,
  `STATUS` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `FK_1_idx` (`STATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csc_batting_style`
--

DROP TABLE IF EXISTS `csc_batting_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csc_batting_style` (
  `uuid` tinyint(4) unsigned NOT NULL,
  `batting_style_name` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csc_batting_style`
--

LOCK TABLES `csc_batting_style` WRITE;
/*!40000 ALTER TABLE `csc_batting_style` DISABLE KEYS */;
INSERT INTO `csc_batting_style` VALUES (1,'Right-handed',0),(2,'Left-handed',0);
/*!40000 ALTER TABLE `csc_batting_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csc_bowling_style`
--

DROP TABLE IF EXISTS `csc_bowling_style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csc_bowling_style` (
  `uuid` tinyint(4) unsigned NOT NULL,
  `bowling_style_name` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csc_bowling_style`
--

LOCK TABLES `csc_bowling_style` WRITE;
/*!40000 ALTER TABLE `csc_bowling_style` DISABLE KEYS */;
INSERT INTO `csc_bowling_style` VALUES (1,'Right-arm fast-medium',0),(2,'Right-arm medium-fast',0),(3,'Right-arm medium',0),(4,'Right-arm medium-slow',0),(5,'Right-arm slow-medium',0),(6,'Right-arm slow',0),(7,'Left-arm fast-medium',0),(8,'Left-arm medium-fast',0),(9,'Left-arm medium',0),(10,'Left-arm medium-slow',0),(11,'Left-arm slow-medium',0),(12,'Left-arm slow',0),(13,'Right-arm Off break',0),(14,'Right-arm leg break',0),(15,'Slow left-arm orthodox',0),(16,'Slow left-arm wrist spin',0);
/*!40000 ALTER TABLE `csc_bowling_style` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csc_player_role`
--

DROP TABLE IF EXISTS `csc_player_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csc_player_role` (
  `uuid` tinyint(4) unsigned NOT NULL,
  `player_role_name` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csc_player_role`
--

LOCK TABLES `csc_player_role` WRITE;
/*!40000 ALTER TABLE `csc_player_role` DISABLE KEYS */;
INSERT INTO `csc_player_role` VALUES (1,'Batsman',0),(2,'Bowler',0),(3,'WK-Batsman',0),(4,'Batting Allrounder',0),(5,'Bowling Allrounder',0);
/*!40000 ALTER TABLE `csc_player_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csn_match`
--

DROP TABLE IF EXISTS `csn_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csn_match` (
  `uuid` int(10) unsigned NOT NULL,
  `tournament_uuid` int(10) unsigned DEFAULT NULL,
  `team1_uuid` int(10) unsigned DEFAULT NULL,
  `team2_uuid` int(10) unsigned DEFAULT NULL,
  `group_uuid` int(10) unsigned DEFAULT NULL,
  `match_no` int(10) DEFAULT NULL,
  `toss_decision` varchar(20) DEFAULT NULL,
  `toss_winner_uuid` int(10) unsigned DEFAULT NULL,
  `match_winner_uuid` int(10) unsigned DEFAULT NULL,
  `umpires_1` varchar(45) DEFAULT NULL,
  `umpires_2` varchar(45) DEFAULT NULL,
  `umpires_3` varchar(45) DEFAULT NULL,
  `est_start_datetime` datetime DEFAULT NULL,
  `est_end_datetime` datetime DEFAULT NULL,
  `act_start_datetime` datetime DEFAULT NULL,
  `act_end_datetime` datetime DEFAULT NULL,
  `match_title` varchar(45) DEFAULT NULL,
  `scorer_uuid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `fk1_csn_match_idx` (`team1_uuid`),
  KEY `fk2_csn_match_idx` (`team2_uuid`),
  KEY `fk3_csn_match_idx` (`group_uuid`),
  KEY `fk4_csn_match_idx` (`toss_winner_uuid`),
  KEY `fk5_csn_match_idx` (`match_winner_uuid`),
  KEY `fk6_csn_match_idx` (`tournament_uuid`),
  CONSTRAINT `fk1_csn_match` FOREIGN KEY (`team1_uuid`) REFERENCES `csn_team` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2_csn_match` FOREIGN KEY (`team2_uuid`) REFERENCES `csn_team` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk3_csn_match` FOREIGN KEY (`group_uuid`) REFERENCES `csn_team_group` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk4_csn_match` FOREIGN KEY (`toss_winner_uuid`) REFERENCES `csn_team` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk5_csn_match` FOREIGN KEY (`match_winner_uuid`) REFERENCES `csn_team` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk6_csn_match` FOREIGN KEY (`tournament_uuid`) REFERENCES `csn_tournament` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csn_match`
--

LOCK TABLES `csn_match` WRITE;
/*!40000 ALTER TABLE `csn_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `csn_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csn_player`
--

DROP TABLE IF EXISTS `csn_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csn_player` (
  `uuid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_name` varchar(100) DEFAULT NULL,
  `adhaar_number` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `place` varchar(500) DEFAULT NULL,
  `player_role_uuid` tinyint(3) unsigned DEFAULT NULL,
  `batting_style_uuid` tinyint(3) unsigned DEFAULT NULL,
  `bowling_style_uuid` tinyint(3) unsigned DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '1',
  `creation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `mobile_no` int(10) DEFAULT NULL,
  `player_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `adhaar_number_UNIQUE` (`adhaar_number`),
  KEY `fk1_csn_player_idx` (`player_role_uuid`),
  KEY `fk2_csn_player_idx` (`batting_style_uuid`),
  KEY `fk3_csn_player_idx` (`bowling_style_uuid`),
  CONSTRAINT `fk1_csn_player` FOREIGN KEY (`player_role_uuid`) REFERENCES `csc_player_role` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2_csn_player` FOREIGN KEY (`batting_style_uuid`) REFERENCES `csc_batting_style` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk3_csn_player` FOREIGN KEY (`bowling_style_uuid`) REFERENCES `csc_bowling_style` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csn_player`
--

LOCK TABLES `csn_player` WRITE;
/*!40000 ALTER TABLE `csn_player` DISABLE KEYS */;
INSERT INTO `csn_player` VALUES (1,'SSS','23098309809',NULL,'Thane',1,1,1,NULL,'2020-09-02 00:09:48',NULL,NULL),(2,'lkjlkjlkjlk','5646564764',NULL,'T',1,1,1,NULL,'2020-09-02 00:09:48',NULL,NULL),(3,'SSS','937498327489',NULL,'Thane',2,1,1,NULL,'2020-09-02 00:09:48',NULL,NULL),(4,'Sarvesh','340958340598',NULL,'THane',1,1,1,NULL,'2020-09-02 00:09:48',NULL,NULL),(5,'dflkfdjlk','230492034',NULL,'tlkndgkln',1,1,1,NULL,'2020-09-02 00:09:48',NULL,NULL),(6,'ABBCC','546546',NULL,NULL,NULL,NULL,NULL,1,'2020-09-02 00:09:48',NULL,NULL),(7,'flkgmdkdm','234093248092',NULL,'dgkldfnkldfkl',1,1,1,1,'2020-09-02 00:09:48',NULL,NULL),(8,'dgdlgmgll','df;mddf;m','1989-06-29','Thane',1,1,1,1,'2020-09-02 00:09:48',NULL,NULL),(9,'lksdfjlds','9878009809','1989-06-29','Thhh',1,1,1,1,'2020-09-02 00:10:21',NULL,NULL),(10,'sfdlksdfmlk','128931893189','1989-06-29','THane',1,1,1,1,'2020-09-02 00:16:52',NULL,NULL),(11,'Sarvesh','6546-5466-5465','2020-09-02','Thane',3,1,1,1,'2020-09-06 12:34:18',NULL,NULL),(12,'ABC','7___-____-____',NULL,'',1,1,1,1,'2020-09-06 13:57:58',NULL,NULL),(13,'ABC','5654-5876-4646','2020-09-17','Mulund',4,1,14,1,'2020-09-06 14:00:02',NULL,NULL),(14,'Mobile','5445-5454-4545','2020-09-09','Vitwa',2,2,1,1,'2020-09-06 14:12:55',NULL,NULL);
/*!40000 ALTER TABLE `csn_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csn_team`
--

DROP TABLE IF EXISTS `csn_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csn_team` (
  `uuid` int(10) unsigned NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL,
  `creationdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csn_team`
--

LOCK TABLES `csn_team` WRITE;
/*!40000 ALTER TABLE `csn_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `csn_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csn_team_group`
--

DROP TABLE IF EXISTS `csn_team_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csn_team_group` (
  `uuid` int(10) unsigned NOT NULL,
  `tournament_uuid` int(10) unsigned DEFAULT NULL,
  `team_uuid` int(10) unsigned DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `fk1_csn_team_group_idx` (`team_uuid`),
  KEY `fk2_csn_team_group_idx` (`tournament_uuid`),
  CONSTRAINT `fk1_csn_team_group` FOREIGN KEY (`team_uuid`) REFERENCES `csn_team` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2_csn_team_group` FOREIGN KEY (`tournament_uuid`) REFERENCES `csn_tournament` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csn_team_group`
--

LOCK TABLES `csn_team_group` WRITE;
/*!40000 ALTER TABLE `csn_team_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `csn_team_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csn_team_players`
--

DROP TABLE IF EXISTS `csn_team_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csn_team_players` (
  `uuid` int(10) NOT NULL,
  `team_uuid` int(10) unsigned DEFAULT NULL,
  `player_uuid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `fk1_csn_team_players_idx` (`team_uuid`),
  KEY `csn_team_players_idx` (`player_uuid`),
  CONSTRAINT `fk1_csn_team_players` FOREIGN KEY (`player_uuid`) REFERENCES `csn_player` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2_csn_team_players` FOREIGN KEY (`team_uuid`) REFERENCES `csn_team` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csn_team_players`
--

LOCK TABLES `csn_team_players` WRITE;
/*!40000 ALTER TABLE `csn_team_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `csn_team_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csn_tournament`
--

DROP TABLE IF EXISTS `csn_tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csn_tournament` (
  `uuid` int(10) unsigned NOT NULL,
  `tournament_name` varchar(200) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `place` varchar(45) DEFAULT NULL,
  `creationdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `organiser` varchar(200) DEFAULT NULL,
  `tournament_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csn_tournament`
--

LOCK TABLES `csn_tournament` WRITE;
/*!40000 ALTER TABLE `csn_tournament` DISABLE KEYS */;
/*!40000 ALTER TABLE `csn_tournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `CUSTOMER_NAME` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(105) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `ZIPFILE` varchar(300) DEFAULT NULL,
  `CITY_ID` int(11) DEFAULT NULL,
  `CREATED_DATE` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5_idx` (`CITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_product`
--

DROP TABLE IF EXISTS `customer_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_product` (
  `ZIP_FILE` varchar(100) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_product`
--

LOCK TABLES `customer_product` WRITE;
/*!40000 ALTER TABLE `customer_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_scenario`
--

DROP TABLE IF EXISTS `customer_scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_scenario` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `SCENARIO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_scenario`
--

LOCK TABLES `customer_scenario` WRITE;
/*!40000 ALTER TABLE `customer_scenario` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_token`
--

DROP TABLE IF EXISTS `password_reset_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_token` (
  `ID` int(11) NOT NULL,
  `TOKEN` varchar(200) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_token`
--

LOCK TABLES `password_reset_token` WRITE;
/*!40000 ALTER TABLE `password_reset_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferences` (
  `username` varchar(100) NOT NULL,
  `theme` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(45) DEFAULT NULL,
  `PRODUCT_NO` varchar(45) DEFAULT NULL,
  `PRODUCT_TYPE` varchar(45) DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(200) DEFAULT NULL,
  `STATUS` int(1) NOT NULL,
  `PRODUCT_CODE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_city`
--

DROP TABLE IF EXISTS `product_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_city` (
  `PRODUCT_ID` int(11) NOT NULL,
  `CITY_ID` int(11) NOT NULL,
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  KEY `CITY_ID` (`CITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_city`
--

LOCK TABLES `product_city` WRITE;
/*!40000 ALTER TABLE `product_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_scenario`
--

DROP TABLE IF EXISTS `product_scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_scenario` (
  `PRODUCT_ID` int(11) NOT NULL,
  `SCENARIO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_scenario`
--

LOCK TABLES `product_scenario` WRITE;
/*!40000 ALTER TABLE `product_scenario` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_state`
--

DROP TABLE IF EXISTS `product_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_state` (
  `PRODUCT_ID` int(11) NOT NULL,
  `STATE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_state`
--

LOCK TABLES `product_state` WRITE;
/*!40000 ALTER TABLE `product_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario`
--

DROP TABLE IF EXISTS `scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scenario` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario`
--

LOCK TABLES `scenario` WRITE;
/*!40000 ALTER TABLE `scenario` DISABLE KEYS */;
/*!40000 ALTER TABLE `scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `ID` int(11) NOT NULL,
  `STATE_NAME` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `PHONE` varchar(20) NOT NULL,
  `EMPLOYEE_ID` varchar(45) DEFAULT NULL,
  `ROLE` varchar(50) DEFAULT NULL,
  `CITY_ID` int(11) DEFAULT NULL,
  `STATUS` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_4_idx` (`CITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$10$U2VwCltcmcaDCuKMG64etOEwyNR81KcUOZrirHt0VUalM87iWsTBu','vcrona@example.org','9928522816','5','ADMIN',NULL,1),(2,'abc','$2a$10$U2VwCltcmcaDCuKMG64etOEwyNR81KcUOZrirHt0VUalM87iWsTBu','vcrona@example.org','9928522816','5','ADMIN',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-10 23:19:13



/* modified the player table 12 SEPT 2020 @Rajesh*/
CREATE TABLE `csn_player` (
  `uuid` int(10) UNSIGNED NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `adhaar_number` varchar(50) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `place` varchar(500) DEFAULT NULL,
  `player_role` varchar(50) DEFAULT NULL,
  `batting_style` varchar(50) DEFAULT NULL,
  `bowling_style` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 1,
  `creation_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;