-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: emaildb
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type_id` int(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `FK_Account_AccountType` (`type_id`),
  KEY `Account_account_id` (`account_id`),
  CONSTRAINT `FK_Account_AccountType` FOREIGN KEY (`type_id`) REFERENCES `accounttype` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (0,'123@qq.com','123456',0,NULL,NULL,NULL),(1,'2514632453@qq.com','123456',0,'马佳敏',NULL,'15397099886'),(2,'12345678@163.com','123456',1,NULL,NULL,NULL),(3,'987654321@126.com','123456',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounttype`
--

DROP TABLE IF EXISTS `accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounttype` (
  `type_id` int(11) NOT NULL,
  `typename` varchar(10) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `AccountType_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttype`
--

LOCK TABLES `accounttype` WRITE;
/*!40000 ALTER TABLE `accounttype` DISABLE KEYS */;
INSERT INTO `accounttype` VALUES (0,'@qq.com'),(1,'@163.com'),(2,'@126.com');
/*!40000 ALTER TABLE `accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachment` (
  `attachment_id` int(11) NOT NULL,
  `attachment_url` varchar(100) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `filesize` varchar(100) NOT NULL,
  PRIMARY KEY (`attachment_id`),
  KEY `Attachment_attachment_id` (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachment`
--

LOCK TABLES `attachment` WRITE;
/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` VALUES (0,'','无附件',''),(1,'D:\\','test1.doc','5M'),(2,'D:\\','test2.txt','2K');
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `card` (
  `card_id` int(11) NOT NULL,
  `receive_account` varchar(30) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `card_url` varchar(100) NOT NULL,
  `type_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`card_id`),
  KEY `FK_Card_CardType` (`type_id`),
  KEY `FK_Card_Account` (`account_id`),
  KEY `Card_card_id` (`card_id`),
  CONSTRAINT `FK_Card_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_Card_CardType` FOREIGN KEY (`type_id`) REFERENCES `cardtype` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
INSERT INTO `card` VALUES (0,'2514632453@qq.com','这是个主题1','这是个内容1','D:\\图片1.png',0,2),(1,'12345678@163.com','这是个主题2','这是个内容2','D:\\图片2.jpg',3,1),(2,'12345678@163.com','这是个主题3','这是个内容3','D:图片3.jpg',0,1);
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `card_view`
--

DROP TABLE IF EXISTS `card_view`;
/*!50001 DROP VIEW IF EXISTS `card_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `card_view` AS SELECT 
 1 AS `account_id`,
 1 AS `receive_account`,
 1 AS `subject`,
 1 AS `content`,
 1 AS `card_url`,
 1 AS `typename`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cardtype`
--

DROP TABLE IF EXISTS `cardtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cardtype` (
  `type_id` int(11) NOT NULL,
  `typename` varchar(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `CardType_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cardtype`
--

LOCK TABLES `cardtype` WRITE;
/*!40000 ALTER TABLE `cardtype` DISABLE KEYS */;
INSERT INTO `cardtype` VALUES (0,'普通贺卡'),(1,'友情卡'),(2,'祝福卡'),(3,'生日卡'),(4,'节日卡');
/*!40000 ALTER TABLE `cardtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `account_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`,`contact_id`),
  KEY `Contact_account_id` (`account_id`),
  KEY `FK_Contact_Account2` (`contact_id`),
  CONSTRAINT `FK_Contact_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_Contact_Account2` FOREIGN KEY (`contact_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,2),(2,1),(2,3),(3,2);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `contact_view`
--

DROP TABLE IF EXISTS `contact_view`;
/*!50001 DROP VIEW IF EXISTS `contact_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `contact_view` AS SELECT 
 1 AS `account_id`,
 1 AS `contact`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `file_id` int(11) NOT NULL,
  `file_url` varchar(100) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `filesize` varchar(100) NOT NULL,
  `upload_time` datetime NOT NULL,
  `overdue` int(11) NOT NULL,
  `folder_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `FK_File_Account` (`account_id`),
  KEY `FK_File_FileType` (`type_id`),
  KEY `FK_File_FileFolder` (`folder_id`),
  KEY `File_file_id` (`file_id`),
  CONSTRAINT `FK_File_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_File_FileFolder` FOREIGN KEY (`folder_id`) REFERENCES `filefolder` (`folder_id`),
  CONSTRAINT `FK_File_FileType` FOREIGN KEY (`type_id`) REFERENCES `filetype` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (0,'D:\\','file1.doc','1K','2021-11-29 15:43:30',0,0,2,1),(1,'D:\\','file2.zip','5M','2021-11-29 15:45:45',0,1,3,1),(2,'D:\\','file3.zip','5M','2021-10-29 15:45:45',1,1,3,1),(3,'D:\\','file4.zip','2M','2020-11-30 15:45:45',1,1,3,1);
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `file_view`
--

DROP TABLE IF EXISTS `file_view`;
/*!50001 DROP VIEW IF EXISTS `file_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `file_view` AS SELECT 
 1 AS `account_id`,
 1 AS `file_url`,
 1 AS `filename`,
 1 AS `filesize`,
 1 AS `upload_time`,
 1 AS `overdue`,
 1 AS `foldername`,
 1 AS `typename`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `filefolder`
--

DROP TABLE IF EXISTS `filefolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filefolder` (
  `folder_id` int(11) NOT NULL,
  `base_folder_id` int(11) NOT NULL,
  `foldername` varchar(20) NOT NULL,
  PRIMARY KEY (`folder_id`),
  KEY `FK_FileFolder_FileFoder` (`base_folder_id`),
  KEY `Filefolder_folder_id` (`folder_id`),
  CONSTRAINT `FK_FileFolder_FileFoder` FOREIGN KEY (`base_folder_id`) REFERENCES `filefolder` (`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filefolder`
--

LOCK TABLES `filefolder` WRITE;
/*!40000 ALTER TABLE `filefolder` DISABLE KEYS */;
INSERT INTO `filefolder` VALUES (0,0,'第一层文件夹1'),(1,0,'第一层文件夹2'),(2,1,'第二层文件夹1');
/*!40000 ALTER TABLE `filefolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filetype`
--

DROP TABLE IF EXISTS `filetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filetype` (
  `type_id` int(11) NOT NULL,
  `typename` varchar(10) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `Filetype_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filetype`
--

LOCK TABLES `filetype` WRITE;
/*!40000 ALTER TABLE `filetype` DISABLE KEYS */;
INSERT INTO `filetype` VALUES (0,'图片'),(1,'视频'),(2,'文档'),(3,'压缩包');
/*!40000 ALTER TABLE `filetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `send_account` varchar(30) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `receive_account` varchar(30) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `cc` varchar(30) DEFAULT NULL,
  `bcc` varchar(30) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `send_status` int(11) DEFAULT NULL,
  `read_status` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `FK_Mail_Account` (`account_id`),
  KEY `FK_Mail_Attachment` (`attachment_id`),
  KEY `FK_Mail_MailFolder` (`folder_id`),
  KEY `Mail_mail_id` (`mail_id`),
  KEY `Mail_tag_id` (`tag_id`),
  CONSTRAINT `FK_Mail_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_Mail_Attachment` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`attachment_id`),
  CONSTRAINT `FK_Mail_MailFolder` FOREIGN KEY (`folder_id`) REFERENCES `mailfolder` (`folder_id`),
  CONSTRAINT `FK_Mail_MailTag` FOREIGN KEY (`tag_id`) REFERENCES `mailtag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES (1,1,'12345678@163.com',1,'2514632453@qq.com','垃圾邮件','垃圾邮件',NULL,NULL,'2021-11-29 15:43:30',5,1,0,1,0),(2,1,'2514632453@qq.com',2,'12345678@163.com','这是个主题1','这是个内容1',NULL,NULL,'2021-11-29 21:20:45',3,1,0,0,0),(3,2,'2514632453@qq.com',2,'12345678@163.com','这是个主题1','这是个内容1',NULL,NULL,'2021-11-29 22:25:41',1,1,0,0,0),(8,1,'2514632453@qq.com',2,'12345678@163.com','这是个主题1','内容',NULL,NULL,'2021-11-30 18:28:43',3,1,0,0,0),(9,2,'2514632453@qq.com',2,'12345678@163.com','这是个主题1','内容',NULL,NULL,'2021-11-30 18:28:43',5,1,0,0,0);
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `mail_view`
--

DROP TABLE IF EXISTS `mail_view`;
/*!50001 DROP VIEW IF EXISTS `mail_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mail_view` AS SELECT 
 1 AS `account_id`,
 1 AS `send_account`,
 1 AS `receive_account`,
 1 AS `subject`,
 1 AS `content`,
 1 AS `cc`,
 1 AS `bcc`,
 1 AS `send_time`,
 1 AS `foldername`,
 1 AS `send_status`,
 1 AS `read_status`,
 1 AS `filename`,
 1 AS `tagname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mailfolder`
--

DROP TABLE IF EXISTS `mailfolder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailfolder` (
  `folder_id` int(11) NOT NULL,
  `foldername` varchar(20) NOT NULL,
  PRIMARY KEY (`folder_id`),
  KEY `Mailfolder_folder_id` (`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailfolder`
--

LOCK TABLES `mailfolder` WRITE;
/*!40000 ALTER TABLE `mailfolder` DISABLE KEYS */;
INSERT INTO `mailfolder` VALUES (0,'草稿箱'),(1,'收件箱'),(2,'星标邮件'),(3,'已发送'),(4,'已删除'),(5,'垃圾箱');
/*!40000 ALTER TABLE `mailfolder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailtag`
--

DROP TABLE IF EXISTS `mailtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailtag` (
  `tag_id` int(11) NOT NULL,
  `tagname` varchar(20) NOT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `Mailtag_tag_id` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailtag`
--

LOCK TABLES `mailtag` WRITE;
/*!40000 ALTER TABLE `mailtag` DISABLE KEYS */;
INSERT INTO `mailtag` VALUES (0,'普通邮件'),(1,'一般重要'),(2,'重要'),(3,'非常重要');
/*!40000 ALTER TABLE `mailtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `note_id` int(11) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `time` datetime NOT NULL,
  `star_status` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK_Note_Account` (`account_id`),
  KEY `Note_star_status` (`star_status`),
  KEY `Note_note_id` (`note_id`),
  CONSTRAINT `FK_Note_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (0,'这是个主题1','这是个内容1','2021-11-29 15:43:30',0,1),(1,'这是个主题2','这是个内容2','2021-11-29 15:43:30',1,1);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcard`
--

DROP TABLE IF EXISTS `postcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postcard` (
  `post_card_id` int(11) NOT NULL,
  `receive_account` varchar(30) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `card_url` varchar(100) NOT NULL,
  `music_url` varchar(100) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`post_card_id`),
  KEY `FK_PostCard_Account` (`account_id`),
  KEY `FK_PostCard_PostCardType` (`type_id`),
  KEY `Postcard_post_card_id` (`post_card_id`),
  CONSTRAINT `FK_PostCard_Account` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  CONSTRAINT `FK_PostCard_PostCardType` FOREIGN KEY (`type_id`) REFERENCES `postcardtype` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcard`
--

LOCK TABLES `postcard` WRITE;
/*!40000 ALTER TABLE `postcard` DISABLE KEYS */;
INSERT INTO `postcard` VALUES (0,'12345678@163.com','这是个主题1','这是个内容1','D:\\图片1.png','D:\\music1.mp3',0,1),(1,'12345678@163.com','这是个主题3','这是个内容3','D:图片3.jpg','D:music3.mp3',0,1);
/*!40000 ALTER TABLE `postcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `postcard_view`
--

DROP TABLE IF EXISTS `postcard_view`;
/*!50001 DROP VIEW IF EXISTS `postcard_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `postcard_view` AS SELECT 
 1 AS `account_id`,
 1 AS `receive_account`,
 1 AS `subject`,
 1 AS `content`,
 1 AS `card_url`,
 1 AS `music_url`,
 1 AS `typename`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `postcardtype`
--

DROP TABLE IF EXISTS `postcardtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postcardtype` (
  `type_id` int(11) NOT NULL,
  `typename` varchar(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `Postcardtype_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcardtype`
--

LOCK TABLES `postcardtype` WRITE;
/*!40000 ALTER TABLE `postcardtype` DISABLE KEYS */;
INSERT INTO `postcardtype` VALUES (0,'普通明信片'),(1,'热门推荐'),(2,'自定义明信片');
/*!40000 ALTER TABLE `postcardtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `card_view`
--

/*!50001 DROP VIEW IF EXISTS `card_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `card_view` AS select `card`.`account_id` AS `account_id`,`card`.`receive_account` AS `receive_account`,`card`.`subject` AS `subject`,`card`.`content` AS `content`,`card`.`card_url` AS `card_url`,`cardtype`.`typename` AS `typename` from (`card` join `cardtype`) where (`card`.`type_id` = `cardtype`.`type_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contact_view`
--

/*!50001 DROP VIEW IF EXISTS `contact_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_view` AS select `contact`.`account_id` AS `account_id`,`account`.`email` AS `contact` from (`account` join `contact`) where (`account`.`account_id` = `contact`.`contact_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `file_view`
--

/*!50001 DROP VIEW IF EXISTS `file_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `file_view` AS select `file`.`account_id` AS `account_id`,`file`.`file_url` AS `file_url`,`file`.`filename` AS `filename`,`file`.`filesize` AS `filesize`,`file`.`upload_time` AS `upload_time`,`file`.`overdue` AS `overdue`,`filefolder`.`foldername` AS `foldername`,`filetype`.`typename` AS `typename` from ((`file` join `filetype`) join `filefolder`) where ((`file`.`folder_id` = `filefolder`.`folder_id`) and (`file`.`type_id` = `filetype`.`type_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mail_view`
--

/*!50001 DROP VIEW IF EXISTS `mail_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mail_view` AS select `mail`.`account_id` AS `account_id`,`mail`.`send_account` AS `send_account`,`mail`.`receive_account` AS `receive_account`,`mail`.`subject` AS `subject`,`mail`.`content` AS `content`,`mail`.`cc` AS `cc`,`mail`.`bcc` AS `bcc`,`mail`.`send_time` AS `send_time`,`mailfolder`.`foldername` AS `foldername`,`mail`.`send_status` AS `send_status`,`mail`.`read_status` AS `read_status`,`attachment`.`filename` AS `filename`,`mailtag`.`tagname` AS `tagname` from (((`mail` join `mailfolder`) join `mailtag`) join `attachment`) where ((`mail`.`folder_id` = `mailfolder`.`folder_id`) and (`mail`.`attachment_id` = `attachment`.`attachment_id`) and (`mail`.`tag_id` = `mailtag`.`tag_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `postcard_view`
--

/*!50001 DROP VIEW IF EXISTS `postcard_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `postcard_view` AS select `postcard`.`account_id` AS `account_id`,`postcard`.`receive_account` AS `receive_account`,`postcard`.`subject` AS `subject`,`postcard`.`content` AS `content`,`postcard`.`card_url` AS `card_url`,`postcard`.`music_url` AS `music_url`,`postcardtype`.`typename` AS `typename` from (`postcard` join `postcardtype`) where (`postcard`.`type_id` = `postcardtype`.`type_id`) */;
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

-- Dump completed on 2021-12-08 13:39:06
