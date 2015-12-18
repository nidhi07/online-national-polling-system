-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: onps
-- ------------------------------------------------------
-- Server version	5.6.15

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

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidate` (
  `cID` int(15) NOT NULL DEFAULT '0',
  `voterIdentityNumber` int(15) NOT NULL,
  `pCode` int(5) NOT NULL,
  `cityCode` int(5) NOT NULL,
  `currentPosition` varchar(30) NOT NULL,
  `votes` int(5) NOT NULL,
  `candidateStatus` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cID`),
  KEY `voterIdentityNumber` (`voterIdentityNumber`),
  KEY `cityCode` (`cityCode`),
  KEY `pCode` (`pCode`),
  CONSTRAINT `candidate_ibfk_1` FOREIGN KEY (`voterIdentityNumber`) REFERENCES `voter` (`voterIdentityNumber`),
  CONSTRAINT `candidate_ibfk_2` FOREIGN KEY (`cityCode`) REFERENCES `city` (`cityCode`),
  CONSTRAINT `candidate_ibfk_3` FOREIGN KEY (`pCode`) REFERENCES `politicalparty` (`pCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidatepromises`
--

DROP TABLE IF EXISTS `candidatepromises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candidatepromises` (
  `promID` int(15) NOT NULL AUTO_INCREMENT,
  `cID` int(15) DEFAULT NULL,
  `promises` text NOT NULL,
  PRIMARY KEY (`promID`),
  KEY `cID` (`cID`),
  CONSTRAINT `candidatepromises_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `candidate` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatepromises`
--

LOCK TABLES `candidatepromises` WRITE;
/*!40000 ALTER TABLE `candidatepromises` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidatepromises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `cityCode` int(5) NOT NULL DEFAULT '0',
  `cityName` varchar(30) NOT NULL,
  PRIMARY KEY (`cityCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Varanasi'),(2,'Bareilly'),(3,'Gorakhpur'),(4,'Lucknow'),(5,'Jaipur'),(6,'Delhi'),(7,'Ambala'),(8,'Haridwar'),(9,'Ghaziabad'),(10,'Sultanpur');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electionresult`
--

DROP TABLE IF EXISTS `electionresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `electionresult` (
  `resultID` int(15) NOT NULL AUTO_INCREMENT,
  `pCode` int(5) NOT NULL,
  `cityCode` int(5) NOT NULL,
  `candidateName` varchar(60) NOT NULL,
  `electionYear` int(5) NOT NULL,
  `totalVotes` int(10) NOT NULL,
  PRIMARY KEY (`resultID`),
  KEY `cityCode` (`cityCode`),
  KEY `pCode` (`pCode`),
  CONSTRAINT `electionresult_ibfk_1` FOREIGN KEY (`cityCode`) REFERENCES `city` (`cityCode`),
  CONSTRAINT `electionresult_ibfk_2` FOREIGN KEY (`pCode`) REFERENCES `politicalparty` (`pCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electionresult`
--

LOCK TABLES `electionresult` WRITE;
/*!40000 ALTER TABLE `electionresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `electionresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `politicalparty`
--

DROP TABLE IF EXISTS `politicalparty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `politicalparty` (
  `pCode` int(5) NOT NULL DEFAULT '0',
  `pName` varchar(30) NOT NULL,
  `emblem` blob,
  PRIMARY KEY (`pCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `politicalparty`
--

LOCK TABLES `politicalparty` WRITE;
/*!40000 ALTER TABLE `politicalparty` DISABLE KEYS */;
INSERT INTO `politicalparty` VALUES (1,'BJP',''),(2,'INC',''),(3,'AAP',''),(4,'TMC','');
/*!40000 ALTER TABLE `politicalparty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionanswer`
--

DROP TABLE IF EXISTS `questionanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionanswer` (
  `quesID` int(15) NOT NULL AUTO_INCREMENT,
  `voterIdentityNumber` int(15) NOT NULL,
  `cID` int(15) DEFAULT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`quesID`),
  KEY `cID` (`cID`),
  KEY `voterIdentityNumber` (`voterIdentityNumber`),
  CONSTRAINT `questionanswer_ibfk_1` FOREIGN KEY (`cID`) REFERENCES `candidate` (`cID`),
  CONSTRAINT `questionanswer_ibfk_2` FOREIGN KEY (`voterIdentityNumber`) REFERENCES `voter` (`voterIdentityNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionanswer`
--

LOCK TABLES `questionanswer` WRITE;
/*!40000 ALTER TABLE `questionanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(10) NOT NULL AUTO_INCREMENT,
  `voterIdentityNumber` int(15) DEFAULT NULL,
  `password` varchar(120) NOT NULL,
  `isActive` tinyint(1) DEFAULT '0',
  `accountType` varchar(5) NOT NULL,
  PRIMARY KEY (`userID`),
  KEY `voterIdentityNumber` (`voterIdentityNumber`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`voterIdentityNumber`) REFERENCES `voter` (`voterIdentityNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1001,'voter',1,'V'),(2,1002,'voter',1,'V'),(3,1003,'voter',1,'V'),(4,1004,'voter',1,'V'),(5,1005,'voter',1,'V'),(6,1006,'voter',1,'V'),(7,1007,'voter',1,'V'),(8,1008,'voter',1,'V'),(9,1009,'voter',1,'V'),(10,1010,'voter',1,'V');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voter`
--

DROP TABLE IF EXISTS `voter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voter` (
  `voterIdentityNumber` int(15) NOT NULL AUTO_INCREMENT,
  `fName` varchar(25) NOT NULL,
  `mName` varchar(25) NOT NULL,
  `lName` varchar(25) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `DOB` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `cityCode` int(5) NOT NULL,
  `fathersName` varchar(60) NOT NULL,
  `mothersName` varchar(60) NOT NULL,
  `voterIdentityCard` blob,
  `voterStatus` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`voterIdentityNumber`),
  KEY `cityCode` (`cityCode`),
  CONSTRAINT `voter_ibfk_1` FOREIGN KEY (`cityCode`) REFERENCES `city` (`cityCode`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voter`
--

LOCK TABLES `voter` WRITE;
/*!40000 ALTER TABLE `voter` DISABLE KEYS */;
INSERT INTO `voter` VALUES (1001,'Ankush','','Srivastava','M','1994-04-24','ankush@gmail.com',1,'Aman Srivastava','Ayushi Srivastava','',1),(1002,'Sumit','','Verma','M','1994-04-24','sumit@gmail.com',4,'Aman Verma','Ayushi Verma','',1),(1003,'Amit','','Kumar','M','1994-04-24','amit@gmail.com',3,'Aman Kumar','Ayushi Kumar','',1),(1004,'Nidhi','','Singh','F','1994-02-07','nidhi@gmail.com',2,'Hemendra Singh','Ranjana Singh','',1),(1005,'Neetiksha','','Sharma','F','1994-06-29','neetiksha@gmail.com',5,'Rajveer Sharma','Reena Sharma','',1),(1006,'Ekta','','Jaiswal','F','1994-02-07','ekta@gmail.com',6,'Hemendra Jaiswal','Ranjana Jaiswal','',1),(1007,'Prashant','','Sharma','M','1994-06-24','prakush@gmail.com',3,'Tarkeshwar Sharma','Manju Shamra','',1),(1008,'Amita','','Shukla','F','1994-06-09','amita@gmail.com',4,'Aman Shukla','Rita Shukla','',1),(1009,'Ujjwal','','Pandey','M','1994-10-22','ujjwal@gmail.com',1,'Hemendra Singh','Ranjana Singh','',1),(1010,'Priya','','Singh','F','1994-05-07','priya@gmail.com',2,'Hira Singh','Pariniti Singh','',1);
/*!40000 ALTER TABLE `voter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-25 17:19:47
