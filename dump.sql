-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: divesong
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
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albums` (
  `album_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rdate` date DEFAULT NULL,
  `num_tracks` int(11) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticate`
--

DROP TABLE IF EXISTS `authenticate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticate` (
  `uid` bigint(20) NOT NULL,
  `auth_token` varchar(511) NOT NULL,
  `mac` varchar(255) NOT NULL,
  `user_agent` varchar(511) DEFAULT NULL,
  `tme` datetime DEFAULT NULL,
  KEY `uid` (`uid`),
  CONSTRAINT `authenticate_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticate`
--

LOCK TABLES `authenticate` WRITE;
/*!40000 ALTER TABLE `authenticate` DISABLE KEYS */;
INSERT INTO `authenticate` VALUES (1,'05a9da3e06a87300a2470d455815b5b9959f6727119e78590eb3a3a857997383209c8c794d8a4fee7bad0248a36749aac228d3ec0377e8ae5b6031c96d42fe2a821fd12d2e07c6b0666f88f2d10f0507cd8c3d3ac9d284f70d2693f68aa04871b12805ad7d80e28493d6bf5b5000c5a1aaa41ad990fc2f5d148d5a032ac648a8','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-02-01 14:58:29'),(1,'5cb2df033d22232c7d0dc6453818442c83947df41ff9e3c7d8cc86a9b75f2a4368f0be32ef3b390121f9fd087210ad8320b916cbda23db8145d18a398e7114ccfbef61b06b4f68607fd6adc67f71366f0f7ce4986b701d736759deb57ca29d2e857b63568686226bb4d2cf5fe23921adf074e2186e42518d7e05b10fa5c8cf60','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-02-01 15:03:26'),(1,'67ce8f14f5df1d4a32178c5f9c313be888135eca6c036c199d51f35c64994fc4323fe079192d50e87922372a1bbc6d66e1a5d41c0bbec5f36f4b7ba42ccbae03a98c43ddeecbf27baf18634c82312fa18da5dcd14c50d44189fc1a300458a721069d8748bb54b514e35e8dc74f5705da1a88ae88c3d1fbb3365b1ef983d907d8','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-02-02 11:33:46'),(3,'60770ea128991cf8fab0fdf14aad1380e6ccbc6b6e224270b4e94f21d062725ddf52fe22e208c718eabd1c3c554f1b6bd0863b38a129b5d91cbac09746a1ac01126e1ff360e21748aab8b3514dde72fa7ebf7fa7b406c4d6c1be5310290acd1614ed9b034780fd9bab963698e06fd1be0628de7e092241c31253ec5cdb5cca9c','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-02-02 11:39:11'),(3,'88ecd231ff80c0b36e7ce2e9c5dc6ad9676a0eff5df9940a94e6a15b6b48b6c21984bd8ee29e239f42f417ae6328db2e818b70523fc13d11776617f3f3eb8becea72b14d980482ac099b697cc310fe879a0ae7766d050961bab0061fc16d5a93f782084d9585f677c4fed996a224c38ea613717e1eaf4a89a19efdb150b2905a','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-02-02 11:42:03'),(1,'ebe21266985ede3e0c45b9487588150c77cf3a51685b64f1f83d33f74b3f45f96be32c0b26527bc50c8cb0d3d8d95a26265cd399b5f4f6465ef5d71daadffb03ffbc7aa2bccef519fb72417cead9f338bd5febe341984dcc6da1366826536294e5eea4229e70234ceb107218f7c5fb694f39deeb302b678904c3d7c626c6c380','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-02-02 11:42:11'),(1,'c8f24a4912b71ac746170da770ab71326b56fa390d0787ed0b4299cd3155b92e81dd931213649ae62868b8b7f341edd5647fc0e160ebed79e5a031018a374415aa2f69c18d9dc0f00e77fe4efca40be771931d8202cc70757a7ce6778dd22ad10677696806e9f3a78e28da933aa99ac339e7c9711b24154ebfff70cadf724abc','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-02-02 12:17:54'),(1,'02d67d3d9832fb548b69736438c18c0e98fec7474068532e5fb72274036370c422621356c31d3c8ad46d336657d60d2e6c02c8d8c2f48a0611e1b9db281afba7f33e24b8643775b077e0c4cd308567236aaefbcecc4de43f18cd29d7199e4d6466feec12b8097ed21eecbd34f1c8a5656796593e98e0182e3610ff65bbf4320a','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-02-02 13:29:15'),(1,'b61ff3dd2a6f0b8213b7f6d577211718dc52244ee51f6dc65ec19df28251209841d5eb9ee3b640f34e70d3b1aaa39916eeb45fa2b42e3130b1361c29d018b5cfd5ade514507ff7a84d750cf525b3e0c33499e29b0071c0210fffabaf60a03d7f642ed898ade4c8ee6525e9c2543d98a52622533ce0b65e27c126fe4ca9e48b59','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-02-02 13:33:31'),(5,'8594df92e86d3f6d4d9a63b20950db11191b231b423d3764ba606a723dc289e2b3af0c24b96a60734347322d58b71bd3c8c4842682dbd52763cd9dda534839bb7ed477b073fd21739879a293cbb74b2b9ad5cf08ff65b8f1b379ccf3c20339b559e3fae621c46a827d1afb839becff04123ec7f9e4eff51c1fe6e05253f8b2d6','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-04-18 05:41:57'),(5,'c2b0a3cd44ddf774b8d775ee478314f403c53bb7e5ae41c4ca5575582779ebb179839618c2a05c09f46c379b11081e7682696cfd4fb0a3cd596a68d892a2ebf55844cb93a6255d3831f93b1bed404b5b84bf254282541ac8f652974ae811cdc6457f1fe9d381bcf5b53e0e5920c8b9dbe71541c85ffff1c76a407056871b4f8a','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-04-18 05:44:13'),(5,'42d7d5bd7b651c8fb89384ddc5eee17bedd0d35108c12c7b85c2bac958267de4fc23af5a64897cd6919ed14ff4daf0fe12b8ac12af27c77a9f2328e7982e92758332bf9b3e8ceeadced69cebb5ac3c3b51a350729f6e54637fd158182fe60df97654e57173dc480e33626e4afc1dafb82dc7d6c39c8c75eba20d4f1a8e3e97f1','test_mac','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:63.0) Gecko/20100101 Firefox/63.0','2019-04-18 05:47:54');
/*!40000 ALTER TABLE `authenticate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `next_tracks`
--

DROP TABLE IF EXISTS `next_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `next_tracks` (
  `tid` bigint(20) NOT NULL,
  `ind` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  CONSTRAINT `next_tracks_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `req_list` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `next_tracks`
--

LOCK TABLES `next_tracks` WRITE;
/*!40000 ALTER TABLE `next_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `next_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pass`
--

DROP TABLE IF EXISTS `pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pass` (
  `uid` bigint(20) NOT NULL,
  `passhash` varchar(257) DEFAULT NULL,
  `salt` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  CONSTRAINT `pass_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pass`
--

LOCK TABLES `pass` WRITE;
/*!40000 ALTER TABLE `pass` DISABLE KEYS */;
INSERT INTO `pass` VALUES (1,'100f72720d07cedc912aea4c9450f4f9219bc8b144cbc4542f8458de78684574911dc7d6c6630672d3ebce354309f61a84dd343e56b3f5819be90c78650f0f21','b7117704'),(3,'c5ea8b21ad5e36f3eb6f952baec38ee20c25f86661b97ee94acaae6cc500046698fbc9588dcf3c727219b4bca69cd9a7e3a23b961d5744a901a9a4f68d53eddc','b9ca9caa'),(5,'780847b3e79b370a178f43e48583db9d99f5afe1fb8c4816dc7d1cee23847f4949f964014b0b3e358c0b1b34e86ba74521e79da04b7fb331b406b2101cda5bc4','18b5e005');
/*!40000 ALTER TABLE `pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `req_list`
--

DROP TABLE IF EXISTS `req_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `req_list` (
  `rtime` datetime NOT NULL,
  `tid` bigint(20) NOT NULL,
  `num_req` bigint(20) DEFAULT NULL,
  KEY `tid` (`tid`),
  CONSTRAINT `req_list_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `track` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `req_list`
--

LOCK TABLES `req_list` WRITE;
/*!40000 ALTER TABLE `req_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `req_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `search`
--

DROP TABLE IF EXISTS `search`;
/*!50001 DROP VIEW IF EXISTS `search`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `search` AS SELECT 
 1 AS `artists`,
 1 AS `genre`,
 1 AS `album_name`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `thistory`
--

DROP TABLE IF EXISTS `thistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thistory` (
  `tid` bigint(20) DEFAULT NULL,
  `lplayed` datetime DEFAULT NULL,
  KEY `tid` (`tid`),
  CONSTRAINT `thistory_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `track` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thistory`
--

LOCK TABLES `thistory` WRITE;
/*!40000 ALTER TABLE `thistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `thistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `tpath` varchar(511) DEFAULT NULL,
  `imgpath` varchar(511) DEFAULT NULL,
  `album_id` bigint(20) DEFAULT NULL,
  `aname` varchar(511) DEFAULT NULL,
  `artists` varchar(511) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `track_no` int(11) DEFAULT NULL,
  `duration` bigint(20) DEFAULT NULL,
  `bitrate` bigint(20) DEFAULT NULL,
  `exist` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `tpath` (`tpath`),
  UNIQUE KEY `imgpath` (`imgpath`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `track_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

LOCK TABLES `track` WRITE;
/*!40000 ALTER TABLE `track` DISABLE KEYS */;
/*!40000 ALTER TABLE `track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_status`
--

DROP TABLE IF EXISTS `track_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_status` (
  `tid` bigint(20) NOT NULL,
  `num_played` bigint(20) DEFAULT NULL,
  `likes` bigint(20) DEFAULT NULL,
  `dislikes` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`tid`),
  CONSTRAINT `track_status_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `track` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_status`
--

LOCK TABLES `track_status` WRITE;
/*!40000 ALTER TABLE `track_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uhistory`
--

DROP TABLE IF EXISTS `uhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uhistory` (
  `uid` bigint(20) NOT NULL,
  `to_oper` int(11) NOT NULL,
  `tid` bigint(20) NOT NULL,
  `odate` date DEFAULT NULL,
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  CONSTRAINT `uhistory_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `track` (`tid`),
  CONSTRAINT `uhistory_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uhistory`
--

LOCK TABLES `uhistory` WRITE;
/*!40000 ALTER TABLE `uhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `uhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `email` varchar(511) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `everify` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname` (`uname`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'varunchhangani','xituputenu@shop4mail.net','Varun','Chhangani',1),(3,'asdfasdf','asdf@asdf.com','asdf','asdf',1),(5,'Varun','varunchhangani@gmail.com','Varun','Chhangani',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `search`
--

/*!50001 DROP VIEW IF EXISTS `search`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `search` AS select `track`.`artists` AS `artists`,`track`.`genre` AS `genre`,`albums`.`name` AS `album_name`,`track`.`name` AS `name` from (`track` left join `albums` on((`track`.`album_id` = `albums`.`album_id`))) */;
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

-- Dump completed on 2019-11-11  1:05:58
