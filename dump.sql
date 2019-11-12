-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: OJ
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `Languages`
--

DROP TABLE IF EXISTS `Languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Languages` (
  `LanguageName` varchar(255) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  PRIMARY KEY (`LanguageName`,`QuestionID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `Languages_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`QuestionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Languages`
--

LOCK TABLES `Languages` WRITE;
/*!40000 ALTER TABLE `Languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `Languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `QuestionID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) DEFAULT NULL,
  `Text` varchar(255) DEFAULT NULL,
  `Score` int(11) DEFAULT NULL,
  `Creator` int(11) DEFAULT NULL,
  `ContestID` int(11) DEFAULT NULL,
  PRIMARY KEY (`QuestionID`),
  KEY `Creator` (`Creator`),
  KEY `ContestID` (`ContestID`),
  CONSTRAINT `Question_ibfk_1` FOREIGN KEY (`Creator`) REFERENCES `User` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `Question_ibfk_2` FOREIGN KEY (`ContestID`) REFERENCES `contest` (`ContestID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question`
--

LOCK TABLES `Question` WRITE;
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SecondaryEmails`
--

DROP TABLE IF EXISTS `SecondaryEmails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SecondaryEmails` (
  `UserID` int(11) NOT NULL,
  `MailID` varchar(255) NOT NULL,
  PRIMARY KEY (`UserID`,`MailID`),
  CONSTRAINT `SecondaryEmails_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SecondaryEmails`
--

LOCK TABLES `SecondaryEmails` WRITE;
/*!40000 ALTER TABLE `SecondaryEmails` DISABLE KEYS */;
/*!40000 ALTER TABLE `SecondaryEmails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Submission`
--

DROP TABLE IF EXISTS `Submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Submission` (
  `SubmissionID` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `SubmissionTime` datetime DEFAULT NULL,
  `LanguageName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SubmissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Submission`
--

LOCK TABLES `Submission` WRITE;
/*!40000 ALTER TABLE `Submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `Submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tags` (
  `Tag` varchar(255) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  PRIMARY KEY (`Tag`,`QuestionID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `Tags_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`QuestionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tags`
--

LOCK TABLES `Tags` WRITE;
/*!40000 ALTER TABLE `Tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Testcases`
--

DROP TABLE IF EXISTS `Testcases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Testcases` (
  `TestID` int(11) NOT NULL,
  `Input` varchar(255) DEFAULT NULL,
  `ExpectedOutput` varchar(255) DEFAULT NULL,
  `SubtaskID` int(11) NOT NULL,
  `Score` int(11) DEFAULT NULL,
  `QuestionID` int(11) NOT NULL,
  PRIMARY KEY (`TestID`,`QuestionID`,`SubtaskID`),
  KEY `QuestionID` (`QuestionID`),
  CONSTRAINT `Testcases_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`QuestionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Testcases`
--

LOCK TABLES `Testcases` WRITE;
/*!40000 ALTER TABLE `Testcases` DISABLE KEYS */;
/*!40000 ALTER TABLE `Testcases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `JoinDate` datetime DEFAULT NULL,
  `Institute` varchar(255) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `PasswordHash` varchar(255) DEFAULT NULL,
  `PasswordSalt` varchar(255) DEFAULT NULL,
  `PrimaryMailID` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `Category` int(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `PrimaryMailID` (`PrimaryMailID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'admin','','',1000,'2019-11-12 13:14:35','IIIT Hyd','2019-11-12 13:14:35','$2a$12$U24j/b.7hloSviayPSYSCeiTQXU.hAdxyWq9cDv50djNk9yUzqQk.',NULL,'admin@admin.com',1,1);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserParticipatesInContest`
--

DROP TABLE IF EXISTS `UserParticipatesInContest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserParticipatesInContest` (
  `UserID` int(11) NOT NULL,
  `ContestID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`ContestID`),
  KEY `ContestID` (`ContestID`),
  CONSTRAINT `UserParticipatesInContest_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `UserParticipatesInContest_ibfk_2` FOREIGN KEY (`ContestID`) REFERENCES `contest` (`ContestID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserParticipatesInContest`
--

LOCK TABLES `UserParticipatesInContest` WRITE;
/*!40000 ALTER TABLE `UserParticipatesInContest` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserParticipatesInContest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserSolvesQuestion`
--

DROP TABLE IF EXISTS `UserSolvesQuestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSolvesQuestion` (
  `UserID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `SubmissionID` int(11) NOT NULL,
  PRIMARY KEY (`UserID`,`QuestionID`,`SubmissionID`),
  KEY `QuestionID` (`QuestionID`),
  KEY `SubmissionID` (`SubmissionID`),
  CONSTRAINT `UserSolvesQuestion_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `UserSolvesQuestion_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`QuestionID`) ON DELETE CASCADE,
  CONSTRAINT `UserSolvesQuestion_ibfk_3` FOREIGN KEY (`SubmissionID`) REFERENCES `Submission` (`SubmissionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserSolvesQuestion`
--

LOCK TABLES `UserSolvesQuestion` WRITE;
/*!40000 ALTER TABLE `UserSolvesQuestion` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserSolvesQuestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest` (
  `ContestID` int(11) NOT NULL AUTO_INCREMENT,
  `contestname` varchar(255) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `MinScoreAllowed` int(11) DEFAULT NULL,
  `MaxScoreAllowed` int(11) DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Creator` int(11) DEFAULT NULL,
  PRIMARY KEY (`ContestID`),
  KEY `Creator` (`Creator`),
  CONSTRAINT `contest_ibfk_1` FOREIGN KEY (`Creator`) REFERENCES `User` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest`
--

LOCK TABLES `contest` WRITE;
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
/*!40000 ALTER TABLE `contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `TestID` int(11) NOT NULL,
  `SubmissionID` int(11) NOT NULL,
  `Result` int(11) DEFAULT NULL,
  `EvaulationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`TestID`,`SubmissionID`),
  KEY `SubmissionID` (`SubmissionID`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`TestID`) REFERENCES `Testcases` (`TestID`) ON DELETE CASCADE,
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`SubmissionID`) REFERENCES `Submission` (`SubmissionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-12 13:39:17
