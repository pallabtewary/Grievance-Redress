-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: redress
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint` (
  `complid` int NOT NULL AUTO_INCREMENT,
  `compltime` datetime DEFAULT NULL,
  `subject` varchar(75) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `pid` int DEFAULT NULL,
  `ownid` int DEFAULT NULL,
  `techid` int DEFAULT NULL,
  `compl_status` int NOT NULL DEFAULT '0',
  `startprog` varchar(200) DEFAULT NULL,
  `ongoingprog` varchar(200) DEFAULT NULL,
  `endprog` varchar(200) DEFAULT NULL,
  `res_status` int NOT NULL DEFAULT '0',
  `feedback_status` int DEFAULT '0',
  PRIMARY KEY (`complid`),
  KEY `pid_idx` (`pid`),
  KEY `techId_idx` (`techid`),
  KEY `ownId_idx` (`ownid`),
  CONSTRAINT `ownId` FOREIGN KEY (`ownid`) REFERENCES `productowned` (`ownid`),
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `userinfo` (`pid`),
  CONSTRAINT `techId` FOREIGN KEY (`techid`) REFERENCES `technician` (`techid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='compl_status 0 - Initiated 1 - Accepted	2 - Rejected	res_status 0 - Initiated  1 - Unresolved   2 - Resolved';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (1,'2022-02-01 10:58:05','AC Problem','Our Ac has not been working for past 5 days',10,5,5,1,'Technician Assigned','','',1,0),(2,'2022-02-01 10:58:05','Fridge Problem','Fridge heating up',15,1,3,1,'Technician has been assigned','Support has been dispatched','Product is serviced and fixed ',1,0),(3,'2022-02-01 10:58:05','TV problems','TV is showing black screen',25,9,5,1,'Technician has been dispatched','Support is dispacthed','Product is not fixable',1,0),(4,'2022-02-01 10:58:05','blah bla bla','hahaha',14,10,2,1,NULL,NULL,NULL,1,0),(5,'2022-02-01 10:58:05','sa','asd',61,9,1,1,'Technician Assigned','Parts Dispatched','Closed',1,0),(6,'2022-02-01 10:58:05','saca','cssaac',61,9,1,1,'Technician Assigned','','',1,0),(7,'2022-02-01 10:58:05','ss','sa',61,9,14,1,'wwe','','Complaint closed',1,0),(8,'2022-02-01 10:58:05','test','tets',61,9,2,1,'Technician Assigned','','',0,0),(9,'2022-02-01 10:58:05','sa','sadas',61,9,4,1,'','','',0,0),(10,'2022-02-01 10:58:05','sd','ads',61,9,5,1,'','','',0,0),(11,'2022-02-01 10:58:05','asnj','xnjkcas',61,9,62,1,'Technician Assigned','','',0,0),(12,'2022-02-01 10:58:05','Hi','hshhshss',61,9,67,1,'Technician Assigned','','',0,0),(13,'2022-02-01 10:58:05','Ac Problem','some problem',69,1,2,1,'started','','',0,0),(14,'2022-02-01 10:58:05','sasas','assa',61,1,1,1,'Technician Assigned','','',0,0),(15,'2022-02-01 10:58:05','sdc','CS',61,1,8,1,'Technician Assigned','','',0,0),(16,'2022-02-01 10:58:05','dsa','sad',61,1,1,2,'','','',0,0),(17,'2022-02-01 11:02:11','dsa','sad',61,1,NULL,0,NULL,NULL,NULL,0,0),(18,'2022-02-01 13:55:52','testing again','testing',73,1,5,1,'','','Completed',1,1),(19,'2022-02-01 13:57:26','testing again','testing',73,1,4,1,'Technician Assigned','','',0,0),(20,'2022-02-01 13:58:01','testing again','testing',73,1,NULL,0,NULL,NULL,NULL,0,0),(21,'2022-02-02 14:22:34','Test Subject','Test Description',73,1,9,1,'Technician Assigned kore dilam chinta korben na..','','Closed',1,1),(22,'2022-02-09 20:09:58','Some Testing','Test',61,10,NULL,0,NULL,NULL,NULL,0,1),(23,'2022-02-25 09:35:23','testing again','some more test',73,15,1,1,'Technician Assigned','','Completed',1,0),(24,NULL,NULL,NULL,NULL,NULL,1,2,'','ongoing','',0,0),(25,'2022-02-25 09:52:00','once more testing','testing oncemore',73,14,NULL,0,NULL,NULL,NULL,0,0),(26,'2022-02-25 10:03:52','final testing','this is final testing',73,14,62,1,'Teschnical assigned','technician visited','progress end',1,1),(27,'2022-05-07 18:38:19','test','test',92,31,2,2,'','','',0,0),(28,'2022-06-07 20:25:14','testing again','www',94,41,4,1,'Technician Assigned','','Complaint closed',1,1);
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `sl` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phno` varchar(15) NOT NULL,
  `message` varchar(300) NOT NULL,
  `pid` int NOT NULL,
  `username` varchar(25) NOT NULL,
  PRIMARY KEY (`sl`),
  KEY `pid_idx` (`pid`),
  CONSTRAINT `contactPid` FOREIGN KEY (`pid`) REFERENCES `userinfo` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'DQ','WWWD@uma.com','55','sax',61,'lll'),(2,'Your name','youremail@email.com','9999999999','Type some message within 200 words.',61,'lll'),(3,'Your name','youremail@email.com','9999999999','Type some message within 200 words.',61,'lll'),(4,'Your name','youremail@email.com','9999999999','Type some message within 200 words.',61,'lll'),(5,'as','aa41@gmail.com','12','sa',61,'lll'),(6,'as','as@yahoo.com','1','as',61,'lll'),(7,'as','as@yahoo.com','1','as',61,'lll'),(8,'a','aa@umail.com','1','hello',61,'lll'),(9,'a','aa@umail.com','1','wwwwwwwwwwww',61,'lll'),(10,'new','user@gmail.com','1234567890','',73,'user'),(11,'new','user@gmail.com','1234567890','',73,'user'),(12,'new','user@gmail.com','1234567890','',73,'user'),(13,'new','user@gmail.com','1234567890','     ',73,'user'),(14,'new','user@gmail.com','1234567890','',73,'user'),(15,'new','user@gmail.com','1234567890','',73,'user'),(16,'Pallab','user@gmail.com','9636985203','ccc',73,'user'),(17,'Pallab','user@gmail.com','9636985203','...................................................',73,'user'),(18,'Pallab','user@gmail.com','9636985203','Hello',73,'user'),(19,'Pallab','user@gmail.com','9636985203','aaaa',73,'user'),(20,'Pallab','user@gmail.com','9636985203','aaaa',73,'user'),(21,'Pallab','user@gmail.com','9636985203','s',73,'user'),(22,'Pallab','user@gmail.com','9636985203','ssssss',73,'user'),(23,'Pallab','user@gmail.com','9636985203','ssssss',73,'user'),(24,'Pallab','user@gmail.com','9636985203','ss',73,'user'),(25,'Pallab','user@gmail.com','9636985203','aaa',73,'user'),(26,'Pallab','user@gmail.com','9636985203','sss',73,'user'),(27,'Pallab','user@gmail.com','9636985203','ssss',73,'user'),(28,'Pallab','user@gmail.com','9636985203','2222',73,'user'),(29,'Pallab','user@gmail.com','9636985203','again testing 123456',73,'user'),(30,'Isita','bjena128@gmail.com','9999999999','Helllo',94,'Isita'),(31,'Pallab','user@gmail.com','9636985203','aa',73,'user'),(32,'Pallab','user@gmail.com','9636985203','sssss',73,'user'),(33,'Pallab','user@gmail.com','9636985203','Just for testing purpose',73,'user'),(34,'Pallab','user@gmail.com','9636985203','dddd',73,'user'),(35,'Pallab','user@gmail.com','9636985203','Final Testing',73,'user'),(36,'Pallab','user@gmail.com','9636985203','Demo message',73,'user'),(37,'Pallab','user@gmail.com','9636985203','zzzzz',73,'user'),(38,'Pallab','user@gmail.com','9636985203','Demo Again Demo Check for both the method at 6.02PM',73,'user'),(39,'Pallab','user@gmail.com','9636985203','Checking at 6.20PM',73,'user'),(40,'Pallab','user@gmail.com','9636985203','Check',73,'user'),(41,'Pallab','user@gmail.com','9636985203','sssss',73,'user'),(42,'Pallab','user@gmail.com','9636985203','sss',73,'user'),(43,'Pallab','user@gmail.com','9636985203','ssss',73,'user'),(44,'Pallab','user@gmail.com','9636985203','ss',73,'user'),(45,'Pallab','user@gmail.com','9636985203','123',73,'user'),(46,'Pallab','user@gmail.com','9636985203','Final Check',73,'user'),(47,'Pallab','user@gmail.com','9636985203','For testing Purpose',73,'user'),(48,'Pallab','user@gmail.com','9636985203','ok',73,'user'),(49,'Pallab','user@gmail.com','9636985203','sddd',73,'user'),(50,'Pallab','user@gmail.com','9636985203','aaa',73,'user'),(51,'Pallab','user@gmail.com','9636985203','aaaaaaaaaaaaa',73,'user'),(52,'Pallab','user@gmail.com','9636985203','Yes Working!!',73,'user'),(53,'Pallab','user@gmail.com','9636985203','gjjhg',73,'user'),(54,'Pallab','user@gmail.com','9636985203','Once again testing',73,'user'),(55,'Pallab','user@gmail.com','9636985203','Good',73,'user'),(56,'Pallab','user@gmail.com','9636985203','xcccccccccccccc',73,'user');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerdefects`
--

DROP TABLE IF EXISTS `customerdefects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerdefects` (
  `cusdefid` int NOT NULL AUTO_INCREMENT,
  `ownid` int DEFAULT NULL,
  `cus_def` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cusdefid`),
  KEY `prodOwnId_idx` (`ownid`),
  CONSTRAINT `prodOwnId` FOREIGN KEY (`ownid`) REFERENCES `productowned` (`ownid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerdefects`
--

LOCK TABLES `customerdefects` WRITE;
/*!40000 ALTER TABLE `customerdefects` DISABLE KEYS */;
INSERT INTO `customerdefects` VALUES (1,2,'Broken Fan'),(2,4,'LCD broken'),(3,3,'Jammed valve'),(4,7,'Unauthorized part used'),(5,9,'Water damage');
/*!40000 ALTER TABLE `customerdefects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `deptid` int NOT NULL AUTO_INCREMENT,
  `deptname` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deptstatus` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'dolorems',1),(2,'accusamus',1),(3,'aut',0),(4,'porro',0),(5,'quae',0),(6,'sed',0),(7,'possimus',1),(8,'quis',1),(9,'AC',1),(10,'quo',1),(11,'Telivision',1),(14,'Mobiles',1),(15,'Refrigerator',1),(16,'ss',1),(17,'ss',1),(18,'ss',1),(19,'ss',1),(20,'some',0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `fbackid` int NOT NULL AUTO_INCREMENT,
  `complid` int DEFAULT NULL,
  `feedback` varchar(200) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  PRIMARY KEY (`fbackid`),
  KEY `compId_idx` (`complid`),
  CONSTRAINT `compId` FOREIGN KEY (`complid`) REFERENCES `complaint` (`complid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,2,'Very good service',8),(2,3,'Average service',6),(3,NULL,'sAS',0),(4,NULL,NULL,4),(5,NULL,NULL,4),(6,18,'Good job',5),(7,18,'Good job Guys!',5),(8,18,'Good job Guys!',5),(9,18,'Good job Guys!',5),(10,18,'Good job Guys!',5),(11,18,'Good job bondhura',18),(12,18,'Good job bondhura',18),(13,21,'sss',21),(19,21,'s',21),(20,18,'ab hui na baat',4),(21,18,'Nice work',4),(22,21,'final check',5),(23,18,'good',5),(24,18,'good',5),(25,18,'good',5),(26,18,'good',5),(27,18,'good',5),(28,18,'good',5),(29,18,'good',5),(30,18,'good',5),(31,18,'good',5),(32,18,'good',5),(33,18,'good',5),(34,18,'good',5),(35,18,'good',5),(36,26,'Quick service solved in one day',5),(37,26,'Quick service solved in one day',5),(38,28,'Awesome Service',5);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prodid` int NOT NULL AUTO_INCREMENT,
  `deptid` int DEFAULT NULL,
  `prodmodel` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prodname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `prodstatus` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`prodid`),
  KEY `pdeptid_idx` (`deptid`),
  CONSTRAINT `pdeptid` FOREIGN KEY (`deptid`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'R-6','Refrigerator',0),(2,5,'S-22','Samsung Galaxy',1),(3,6,'autem','placeat',0),(4,5,'est','fugiat',0),(5,1,'magni','quidem',0),(6,5,'rerum','perferendis',0),(7,5,'ab','eligendi',0),(8,5,'aspernatur','aspernatur',0),(9,5,'quia','repellendus',0),(10,5,'eos','porro',0),(11,2,'sapiente','similique',0),(12,10,'doloremque','itaque',0),(13,5,'repellendus','aut',0),(14,8,'Prod model','doloribus',0),(15,10,'cumque','soluta',0),(16,11,'architecto','laborum',1),(17,15,'quia','maiores',0),(18,3,'eos','perspiciatis',0),(19,5,'qui','quasi',0),(20,11,'rerum','neque',0),(21,5,'impedit','iste',1),(22,5,'ea','qui',1),(23,5,'corporis','voluptates',1),(24,5,'dolorum','nostrum',1),(25,5,'aliquam','aut',1),(26,5,'temporibus','ea',1),(27,2,'veritatis','ab',1),(28,5,'quos','molestiae',1),(29,9,'esse','natus',1),(30,5,'odio','enim',1),(31,3,'voluptatem','est',1),(32,5,'ipsam','voluptas',1),(33,8,'expedita','recusandae',1),(34,5,'voluptate','quam',1),(35,4,'incidunt','quia',1),(36,7,'delectus','eius',1),(37,7,'velit','quis',1),(38,9,'praesentium','et',1),(39,3,'ut','velit',1),(40,5,'sint','quas',1),(41,5,'quasi','quibusdam',1),(42,1,'nihil','doloremque',0),(43,5,'Cool XS','Godrej Air cooler',1),(44,1,'Ultra X1','Micromax Mobile',0),(45,4,'V91','Lenovo Laptop',1),(46,9,'N991','HP Laptop',1),(47,5,'consequatur','eos',1),(48,7,'aut','consequatur',1),(49,1,'Power XP','Nokia Mobile',1),(50,6,'EW23S','Dell Laptop',1),(51,3,'sm-102','Samsung Galaxy 1',1),(54,1,'Galaxy - S 21','Samsung',1),(55,2,'Galaxy - S 25','Samsung',1),(56,14,'Galaxy z5','Samsung',1),(57,4,'S32-5510','Samsung Television',1),(58,11,'S503','LG Television',1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productowned`
--

DROP TABLE IF EXISTS `productowned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productowned` (
  `ownid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `prodid` int NOT NULL,
  PRIMARY KEY (`ownid`),
  KEY `pid_idx` (`pid`),
  KEY `prodId_idx` (`prodid`),
  CONSTRAINT `prodOwnpid` FOREIGN KEY (`pid`) REFERENCES `userinfo` (`pid`),
  CONSTRAINT `prodOwnprodId` FOREIGN KEY (`prodid`) REFERENCES `product` (`prodid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productowned`
--

LOCK TABLES `productowned` WRITE;
/*!40000 ALTER TABLE `productowned` DISABLE KEYS */;
INSERT INTO `productowned` VALUES (1,2,45),(2,25,7),(3,14,21),(4,8,5),(5,14,8),(6,20,21),(7,13,21),(8,4,17),(9,10,5),(10,61,9),(11,61,5),(12,61,6),(13,61,7),(14,73,4),(15,73,5),(16,73,28),(22,55,51),(23,55,56),(30,55,42),(31,92,23),(32,55,46),(33,55,27),(34,55,54),(38,73,58),(40,93,58),(41,94,51);
/*!40000 ALTER TABLE `productowned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technician` (
  `techid` int NOT NULL AUTO_INCREMENT,
  `techname` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deptid` int DEFAULT NULL,
  `techstatus` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`techid`),
  KEY `deptid_idx` (`deptid`),
  CONSTRAINT `deptid` FOREIGN KEY (`deptid`) REFERENCES `department` (`deptid`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technician`
--

LOCK TABLES `technician` WRITE;
/*!40000 ALTER TABLE `technician` DISABLE KEYS */;
INSERT INTO `technician` VALUES (1,'Amit Pandey',2,0),(2,'Dr. Jason D',1,0),(3,'Holly Cummerata',2,0),(4,'Annamarie Effertz Jr.',1,1),(5,'Bobbie Jacobs IV',1,1),(6,'Dr. Keyshawn Brakus II',2,1),(7,'Beryl Wiegand II',2,1),(8,'Athena Rutherford III',2,1),(9,'Jeffry Mitchell',2,1),(10,'Dr. Tressa Altenwerth V',3,0),(11,'Miss Jude Rath',3,1),(12,'Arno Conroy',3,1),(13,'Ms. Elvie Hahn IV',5,0),(14,'Prof. Maegan Mohr I',5,0),(15,'Berry Dietrich',5,1),(16,'Anissa Crona',5,1),(17,'Mrs. Felicia Christiansen I',5,1),(18,'Antonietta Thompson DVM',5,1),(19,'Dr. Candido Weber Sr.',5,1),(20,'Antwan Russel',5,0),(21,'Peyton Reichert',5,1),(22,'Barney Marks Sr.',5,1),(23,'Samson Armstrong',5,1),(24,'Cathy Haag',5,1),(25,'Janis Watsica',5,1),(26,'Dr. Koby Wolf',5,1),(27,'Carroll Oberbrunner',5,1),(28,'Maryse Crooks',5,1),(29,'Cassandra Borer',5,1),(30,'Prof. Harmon Sanford',5,1),(31,'Brody Rowe',5,1),(32,'Freddie Romaguera DVM',5,1),(33,'Dixie Balistreri MD',5,1),(34,'Julian Abernathy',5,1),(35,'Prof. Jean Koss',5,1),(36,'Talon Stanton',5,1),(37,'Stanley Moen',5,1),(38,'Jarrett Prohaska',5,1),(39,'Miss Anjali Koelpin',5,1),(40,'Gust Hayes',5,1),(41,'Dr. Maximus Koelpin',5,1),(42,'Celestine Marks MD',5,1),(43,'Maddison Swift',5,1),(44,'Prof. Antone D\'Amore',5,1),(45,'Trey Heaney',5,1),(46,'Prof. Ibrahim Johns',5,1),(47,'Prof. Reed Bauch IV',5,1),(48,'Jennings Mayer',5,1),(49,'Mrs. Eliane Hermiston',5,1),(50,'Mr. Urban Mayer',5,1),(52,'suraj',5,1),(57,'qwet',5,1),(58,'weqe',5,1),(60,'jsmith',5,1),(61,'Pallab',1,1),(62,'Buddhadeb',1,1),(64,'wkw',1,1),(65,'jwjk',1,1),(66,'soham',1,1),(67,'soham',1,1),(68,'test',15,1),(69,'Buddhadeb',4,1),(70,'Buddhadeb Jena',11,0),(71,'tet',5,1);
/*!40000 ALTER TABLE `technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinfo` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phno` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` int DEFAULT NULL,
  `userstatus` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `tid_idx` (`roleid`),
  CONSTRAINT `tid` FOREIGN KEY (`roleid`) REFERENCES `usertype` (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='userstatus 0 - Inactive\n	  1 - Active';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (2,'christiansen.bria12','7681061a3758b376637647f66','Cade','Williamson','7219 Buckridge Lodge Suite 661Lonieland, VT 72611-6233','soledad.nolan@example.net','8589632520',2,0),(3,'upton.zula','9c296e689c418afedf6b8e256','Wellington','Schmidt','350 Lindsey InletLednerside, UT 66935-6924','tyrell85@example.net','7908563258',2,2),(4,'barrett41','3236453c1d3e0bb70db741c5b','Stephon','Bernier','146 Schmidt Point Apt. 974Fadelton, VA 19068','alanna15@example.com','8741025963',2,0),(5,'reta.zboncak','26c7a5f454d2b4708969e1b73','Kelsi','Abernathy','8232 Shanahan InletMalachiborough, ID 69571-4116','jedidiah61@example.net','9302589630',2,2),(6,'elmore62','azerty','Riju','Banerjee','Nefdgt, Kolkata 7001560','q@q.com','8963256963',2,2),(7,'williamson.alphonso','77286b22514446253c04fd873','Meagan','Schaden','4835 Aditya Island Suite 268\nSelmerchester, MS 72156','jarvis.schaefer@example.org','0',2,2),(8,'brenden.runolfsdottir','c6a9d35d696f4384fe65237e4','Jany','Farrell','44015 Zachary RestNorth Tomas, NM 46116','cwyman@example.com','3',2,1),(9,'pfeffer.ahmed00','4992ab418016eec3f6b76e5d4','Shayna','Anderson','726 Joey ForksEmardmouth, VT 27454-7340','dakota21@example.com','9025636585',3,0),(10,'Joaydep','qwerty','Jay','deep','fsefsf','dwedw@gmail.com','3',3,2),(11,'d\'amore.frederik','aa7fd825998af1c63c688fb44','Leo','Hayes','174 McKenzie Plains\nVernicebury, WA 83973','rroberts@example.com','5',3,2),(12,'alize77','a3f99ec4136909458c9f5de54','Omer','Gusikowski','88702 Becker Mills Apt. 195\nRippinton, LA 58320','xhoeger@example.net','6',3,2),(13,'andre.bernier','1c571a94e37362ce9aa52034b','Edna','Gaylord','810 Wilfrid Pass Apt. 249\nStrosinberg, NH 67860-3567','zjacobi@example.org','1',3,2),(14,'harvey.jeremy','6a3ef6df9090511c48d7a8234','Rowland','Hettinger','56174 Joe Unions\nNorth Garthmouth, KS 58836-0593','leda.torphy@example.org','7',3,2),(15,'mosciski.rosalia','d76ef99501411b862d14adad6','Cindy','Collins','835 Kuhn Ridge Apt. 236\nAniyamouth, IL 81349','beryl89@example.org','8',3,2),(16,'melody.wehner','1eb4b4c07019ebab0af72bd81','Harry','Aufderhar','7620 Davis Curve\nEast Otha, HI 52658-2116','frice@example.net','1',3,2),(17,'ilockman','4c5a1e28c83028e722107a897','Verdie','Schamberger','071 Eusebio Mount Apt. 815\nLynchborough, SD 06912-3840','kassandra.ratke@example.com','2',3,2),(18,'hwelch','c8869762e9ff9665b198e696d','Jordan','Wilderman','93134 Norwood Loaf Suite 772\nReingerside, IL 63767-0337','kerluke.charlie@example.net','3',3,2),(19,'aracely.o\'reilly','8c7183f626c39581b6cc060fa','Rebeca','Keeling','34218 Reinger Courts\nRafaelshire, PA 54067','jconroy@example.net','2',3,0),(20,'mrmon','21324234','234','wfsd','dsfdsf','gh@ggfh.com','3',3,0),(21,'ffsfsdfdsf','dfgdgdfg','dfgdfg','dfgdfg','wf@g.com','wf@g.com','4',3,0),(22,'hagenes.jamal','e772c404ffda29d262ea78e4f','Cade','Jakubowski','957 Cummerata Station\nWest Percivalberg, MI 29478','norberto70@example.net','7',3,0),(23,'lia.quigley','e7f259c85b010c37872d0b5f8','Moshe','Gusikowski','08216 Jarred Radial\nPort Reidhaven, AZ 40842-8028','jenkins.alejandrin@example.net','5',3,0),(24,'cary.tremblay','c77a1b19524c0e0ce44baf2c4','Yasmin','Brakus','818 Bauch Ports\nThielport, NH 92800','lindsay55@example.net','5',3,0),(25,'eadams','639376e726f970a1fbc415242','Myrna','Jenkins','64292 McKenzie Hills\nVerlafurt, KS 64505-6417','charlotte11@example.com','8',3,0),(26,'igreenholt','ad1a6d7624080e02c5d6fd69d','Danial','Becker','6216 Keyon Valleys Apt. 689\nDarbymouth, WY 62419','wzieme@example.com','2',3,0),(27,'lindgren.arnoldo','24b317b79ae2f0ec940860168','Alvera','Zulauf','774 Vandervort Pines Apt. 076\nLake D\'angelo, RI 03939','dgoyette@example.net','2',3,0),(28,'malcolm22','6fecd1358eb06a0d6d6a89407','Kamille','Torphy','3408 Jesse Alley Suite 593\nRutherfordburgh, HI 25676','torp.stephon@example.net','5',3,0),(29,'cmoore','d941c85946989451f6e2b8e19','Emmanuel','Fahey','7536 Cartwright Lodge\nPort Vickieton, WA 56302-1654','alene15@example.com','9',3,0),(30,'kling.ethel','9fb538374f255a7ecf780f194','Jeramy','VonRueden','6594 Senger Orchard Suite 238\nCatharinehaven, NH 01652','teagan.powlowski@example.org','6',3,0),(31,'iwunsch','29031b8d5bb303783b04ead8e','Alec','O\'Keefe','1247 Rutherford Street\nNorth Shyanntown, AZ 67444-9008','ellsworth64@example.org','1',3,0),(32,'daren.lang','097b7a2a4921c67b0e4782223','Talia','Dach','96113 Jessica Motorway\nNew Jakobview, NY 87503-8601','valentine.hettinger@example.org','5',3,0),(33,'jovanny72','8b21d47ac7c02acc34d8743f2','Rhett','Gerhold','274 Skiles Creek\nNew Pascaleburgh, ME 83868-3429','alexandrine93@example.com','2',3,0),(34,'jalon.green','16f68b9cb930d7946da84d6b6','Cortez','Dickinson','215 Heller Pike Suite 901\nCorkerychester, MT 95201','rice.elva@example.org','6',3,0),(35,'sonya.batz','656e47af4a7df39329edb83e2','Delia','McGlynn','9345 Meghan Light\nLake Delta, MD 87031','ehills@example.net','6',3,0),(36,'hermina28','b6a9421316071b160addd7616','Nicklaus','Orn','34415 Johathan Coves\nNicolasshire, MD 00767','grayce71@example.net','3',3,0),(37,'jailyn16','d2517d9bf1a732686a166fe3f','Alena','Jenkins','8792 Christiansen Hill\nLake Arthur, MI 42627-3808','zack.reichel@example.org','5',3,0),(38,'koepp.maddison','ad15b70595b73fd8dccf5c356','Florida','Anderson','3974 Hoeger Course\nGersonborough, WV 02139','jaydon.ullrich@example.net','9',3,0),(39,'mmarks','cd8d9041e7f1e76f25b392b10','Consuelo','Beahan','086 Sylvan Stream Apt. 708\nNew Chaya, CT 89151','kessler.maiya@example.net','0',3,0),(40,'jannie79','76fafdca9d9627440deb0b865','Helga','Lueilwitz','196 Larson Route\nGrimesborough, KY 58527-5583','lucie.renner@example.com','2',3,0),(41,'pamela09','6139054f026835f367517c10e','Eusebio','Spencer','95213 Watsica Stravenue\nNew Dino, WA 56955','nbayer@example.org','4',3,0),(42,'crist.raheem','46c4805151b34407df97359bf','Meaghan','Hagenes','049 Ashly Lake\nWest Willard, SC 28376','sipes.kasey@example.com','6',3,0),(43,'camron03','e68969f29f73d4d5ef8ec6fc9','Eldred','Bauch','7364 Ryan Drive Suite 368\nFadelhaven, AZ 09411','joelle73@example.net','6',3,0),(44,'jacey.bauch','eddbf4c68dfd071fd3f910a3a','Jadyn','Stoltenberg','24063 Russel Knolls Suite 105\nHirtheberg, NY 44338','mozelle.d\'amore@example.org','6',3,0),(45,'sally64','ebbc5c19ca89d79e1c9c59f9f','Javonte','Gislason','427 Metz Freeway Suite 663\nDonnellyton, AR 13207','lueilwitz.toni@example.com','6',3,0),(46,'cornell.bergnaum','1593da56ec92f7f155a6e83fd','Danny','Hettinger','981 General Run Apt. 541\nWest Maxime, RI 45391-2444','hlangworth@example.org','7',3,0),(47,'gus54','010307546f20e0e6502785812','Javonte','Orn','38443 Roxane Trail\nMariannaside, UT 56667-8163','pagac.vivien@example.com','7',3,0),(48,'tiffany70','87ba07835e81faf9e073850bb','Leif','Fay','6812 Erick Stream\nLuettgenfort, TX 32399','heathcote.domingo@example.org','1',3,0),(49,'lacey.hayes','7d7c430214d2573e9a7c1a919','Toney','Carroll','5204 Reggie Shoals Apt. 820\nTracehaven, MN 22169','annamarie11@example.com','9',3,0),(50,'istoltenberg','22e2b4707f7ff59a7e17a5aac','Benny','Johns','263 Becker Freeway Apt. 971\nNorth Jessie, PA 86557','ijohnston@example.org','5',3,0),(51,'abc','1234','xyz','qwe','asd','uio@fm.com','1213',3,0),(53,'wer','1234','123','23423','32432','324232','3',3,0),(54,'wew','23424','343','fd','dgdf','fgdf','4',3,0),(55,'pallab','$s0$b0801$GyhnjE0NdL02JXkAev56wg==$nuEOgIVXEonkBPjd7bTUuKUKRvl7V9O221DslGcCLDM=','Pallab','Tewary','Kolkata','p@yahoo.com','9625852551',1,1),(61,'lll','$s0$b0801$H6xFTapbymFA0MZMSno3Hw==$YY8ja1VlMROuQLIT1KIHuE+1BqjqhF0+w+iNvWCx1dI=','a','a','a','aa@umail.com','1',3,1),(63,'NewCsr','1234','Koi','Bhi',' shsdus','jajajaj@ooma.com','9658521258',2,2),(67,'newCustomer','0000','Customer','Customer','sanjkbsjakb','vvv@yahoo.com','9632585210',3,1),(68,'buddha','123456','Buddhadeb','Jana','Shibpur','buddhadeb@gmail.com','9863251014',3,1),(69,'testing1','0000','Test','Customer','Kolkata','test1@gmail.com','9656523696',3,1),(73,'user','$s0$b0801$OSFGWNGG7dmTXuP5AOmu6A==$V36aBS1RFfxX427VvzyYAT4Sj8ebYfFL8AgYqcssI30=','Pallab','users','kolkata','user@gmail.com','9636985203',3,1),(74,'newCustomer1','$s0$b0801$BKp8PUVKYmMprCeIKTAF6A==$fU4rIlFF9LIwjKKBFj9jn/H3vvt4uIn0g4rI57UEQB8=','new','customer','sjklas','new@gmail.com','3696525410',3,1),(75,'kgf','$s0$b0801$4w0VjVmSTIA3R5a4iFSzGQ==$Q0v/lo6OuurWyGjEO2P0XUVJWmZTbnkElyjPMr10CEc=','hsj','jkjk','kancskn','jj@yahoo.com','5236963652',3,0),(76,'csr','$s0$b0801$bx2QmjOrBZc/fT5U8aSjQg==$PlrAs6vRokIuYWvGWiRG3xwCpV/ErwBhWEhj3ecsgZY=','Buddha','Jena','Kolkata','csr.buddha@gmail.com','6369852148',2,1),(77,'ssssssss','$s0$b0801$vYOHhYi/si+hecctugsxqg==$3qLSOA71cJMYHdw0g64wgPBaU5TEcM8LeY7lLuhvaHA=','s','ss','kln','ss@y.com','9',3,0),(78,'iamUser','$s0$b0801$g+2ORwlbX38NH/3djJKpDA==$5HPXnqGvjqyD7Qt1EI5/ykBWkrkUnhHGmzEnWtm1qsY=','User','User','ww','user1@gmail.com','9090890909',3,0),(79,'','$s0$b0801$pEaCQQphoxgbP4BqxwxgMQ==$9mAIJFzHHdg8aAVRr/gWZvqdBjBR0SFVn403cHBwWD0=','','','','','',3,0),(86,'ssss','$s0$b0801$wo98z2H6jq+GXDxhCaNGVQ==$JIVf3sc2vHYF7eKRLZ07yhp7oeLluOLz1AD0nmPAPnI=','sss','ssss','sss','ssssssss@gmail.com','1',3,0),(88,'1111','$s0$b0801$D2l7EEe2DoFqZ8OaE6+ROg==$AReMUVJmrQ9jyaw1gU5s7l9uUWWIUmQJlJ5ex0WE9EM=','ddd','dddd','sdd','ddddddd@t.com','10',3,0),(89,'sss','$s0$b0801$FSz9EzHsS/AN1qyuLZ8Cbw==$0yZO0IR++qkxSDQHUc4UoEDnqpNmXx0ePBFJEQnmvQU=','f','f','xxx','pallabtewary243@gmail.com','3333333333',3,1),(91,'DemoCustomer','$s0$b0801$UthpwvPiZwwWmzzAXyUKYQ==$/MVQFC/9S7E/WjDUkU7zBFmsww5Zf2HOimxMIALRRz8=','Demo','Customer','assssss','pallabtewari618@gmail.com','9809898789',3,1),(92,'alombhai','$s0$b0801$9SUM2JZIzCgy3kDsSWNQNA==$F2kvBxZFcxx8Rg6/CY9HZOJTbWYAADjLComafTtjNRY=','Anirban','Chakraborty','Ghatal','alombhai@gmail.com','9862365896',3,1),(93,'newCustomer2','$s0$b0801$c113BuW1l0qHkrz8MuiQbA==$/LUgrY2ukuk1D5jqCB/ip2bDh2Pckra/euEXZFGSDzI=','New','Customer 2','Test adress','newcus@gmail.com','9632586963',3,1),(94,'Isita','$s0$b0801$PDr1Ct13jsl5xp+1l0fnDQ==$x8JaEyzAPpi0ozDzTVkxe1X+CHJf2ixtJOwDo+kE+lo=','Isita','Ghosh','Kolkata','bjena128@gmail.com','9999999999',3,1);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertype` (
  `roleid` int NOT NULL AUTO_INCREMENT,
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (1,'Admin'),(2,'CSR'),(3,'Customer');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-15 17:43:47
