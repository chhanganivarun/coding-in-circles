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
INSERT INTO `Languages` VALUES ('C',1),('C++',1),('C',2),('C++',2),('JAVA',2),('PYTHON',2),('C',3),('C++',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question`
--

LOCK TABLES `Question` WRITE;
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
INSERT INTO `Question` VALUES (1,'Dantre Loves Doughnuts','questions/1_text.txt',69,5,NULL),(2,'Question Contest 1-1','questions/2_text.txt',100,5,1),(3,'Question Contest 2-1','questions/3_text.txt',100,5,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Submission`
--

LOCK TABLES `Submission` WRITE;
/*!40000 ALTER TABLE `Submission` DISABLE KEYS */;
INSERT INTO `Submission` VALUES (2,'submissions/2_code.txt','2019-11-13 09:42:14','C'),(3,'submissions/3_code.txt','2019-11-13 09:46:34','JAVA'),(4,'submissions/4_code.txt','2019-11-13 09:47:08','C'),(5,'submissions/5_code.txt','2019-11-13 11:53:20','C++'),(6,'submissions/6_code.txt','2019-11-13 11:56:09','C');
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
INSERT INTO `Tags` VALUES ('',1),('ABC',1),('DP',2),('TEST',2),('TEMP',3);
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
  KEY `SubtaskID` (`SubtaskID`),
  CONSTRAINT `Testcases_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `Question` (`QuestionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Testcases`
--

LOCK TABLES `Testcases` WRITE;
/*!40000 ALTER TABLE `Testcases` DISABLE KEYS */;
INSERT INTO `Testcases` VALUES (1,'testcase/1_1_1_in.txt','testcase/1_1_1_out.txt',1,69,1),(1,'testcase/1_2_1_in.txt','testcase/1_2_1_out.txt',2,0,1),(1,'testcase/2_1_1_in.txt','testcase/2_1_1_out.txt',1,20,2),(1,'testcase/2_2_1_in.txt','testcase/2_2_1_out.txt',2,80,2),(1,'testcase/3_1_1_in.txt','testcase/3_1_1_out.txt',1,50,3),(1,'testcase/3_2_1_in.txt','testcase/3_2_1_out.txt',2,50,3),(2,'testcase/1_1_2_in.txt','testcase/1_1_2_out.txt',1,69,1),(2,'testcase/2_2_2_in.txt','testcase/2_2_2_out.txt',2,80,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'admin','','',1000,'2019-11-12 16:31:00','IIIT Hyd','2019-11-12 16:31:00','$2a$12$U24j/b.7hloSviayPSYSCeiTQXU.hAdxyWq9cDv50djNk9yUzqQk.',NULL,'admin@admin.com',1,1),(2,'Varun','','Chhangani',0,'2019-11-12 17:49:59','IIIT Hyd','2019-11-11 00:00:00','$2a$12$Pe5.l6sK9rfu1NKAiU892eVJ4lLrPpFmK05qXanyFBrptlG01wXbG',NULL,'adsf',0,NULL),(3,'Shivaan','','',0,'2019-11-12 17:59:58','IIIT Hyd','2019-11-11 00:00:00','$2a$12$koRPC4yR5.1oCIVcf/VMPekxGvOs9HzjIFTg8QIgqQ83DsLQemkj2',NULL,'shivaan@si.com',0,NULL),(4,'Varun','','',0,'2019-11-12 18:03:20','asdf','2019-11-11 00:00:00','$2a$12$dmOu.wq8BXelU9U7r5oisuvOlZ5rbTpDIQAtAPTR5ZkBjU0ofLWsq',NULL,'varun@test.cpmo',0,NULL),(5,'shivaan','','sehgal',269,'2019-11-12 18:35:03','iiit','2000-10-10 00:00:00','$2a$12$QGV7lhcBeo0X3.ovRncFIeuHe.bo3kF4C4P8QFU/eOIMORdQ2URMi',NULL,'shivaan@gmail.com',0,NULL);
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
INSERT INTO `UserParticipatesInContest` VALUES (5,1);
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
INSERT INTO `UserSolvesQuestion` VALUES (5,1,2),(5,2,5),(5,2,6);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest`
--

LOCK TABLES `contest` WRITE;
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
INSERT INTO `contest` VALUES (1,'Contest 1','2019-11-13 08:42:56',0,1000,'2019-11-11 23:12:12','2019-11-14 23:12:12',5);
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
  `SubtaskID` int(11) NOT NULL,
  `SubmissionID` int(11) NOT NULL,
  `Result` int(11) DEFAULT NULL,
  `EvaulationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`TestID`,`SubmissionID`,`SubtaskID`),
  KEY `result_ibfk_3` (`SubtaskID`),
  KEY `result_ibfk_2` (`SubmissionID`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`TestID`) REFERENCES `Testcases` (`TestID`) ON DELETE CASCADE,
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`SubmissionID`) REFERENCES `Submission` (`SubmissionID`) ON DELETE CASCADE,
  CONSTRAINT `result_ibfk_3` FOREIGN KEY (`SubtaskID`) REFERENCES `Testcases` (`SubtaskID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,1,2,1,'2019-11-13 09:42:15'),(1,2,2,1,'2019-11-13 09:42:15'),(1,1,3,1,'2019-11-13 09:46:34'),(1,2,3,1,'2019-11-13 09:46:34'),(1,1,4,0,'2019-11-13 09:47:08'),(1,2,4,1,'2019-11-13 09:47:08'),(1,1,5,1,'2019-11-13 11:53:20'),(1,2,5,1,'2019-11-13 11:53:20'),(1,1,6,1,'2019-11-13 11:56:09'),(1,2,6,1,'2019-11-13 11:56:09'),(2,1,2,1,'2019-11-13 09:42:15'),(2,2,3,1,'2019-11-13 09:46:34'),(2,2,5,1,'2019-11-13 11:53:20'),(2,2,6,1,'2019-11-13 11:56:09');
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

-- Dump completed on 2019-11-14 12:10:54
