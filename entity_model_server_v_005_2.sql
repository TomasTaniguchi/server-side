-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: entity_model_server_v_005_2
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_name` varchar(15) DEFAULT NULL,
  `profile_img` varchar(50) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(40) NOT NULL,
  `state_account` tinyint(1) DEFAULT NULL,
  `entity` tinyint(1) DEFAULT NULL,
  `created` varchar(30) DEFAULT NULL,
  `edited` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_name` (`id_name`),
  CONSTRAINT `Account_chk_1` CHECK ((`state_account` in (0,1))),
  CONSTRAINT `Account_chk_2` CHECK ((`entity` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1,'.denisg',NULL,'denis german','denis123','denis@gmail.com',0,0,'2020-10-23 16:53:05.083240','2020-10-23 16:53:05.083240'),(2,'.sergio',NULL,'sergio','sergio123','sergio123@gmail.com',0,0,'2020-10-27 23:53:50.748932','2020-10-27 23:53:50.748932');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Area`
--

DROP TABLE IF EXISTS `Area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_id_entity` varchar(15) DEFAULT NULL,
  `name_area` varchar(15) DEFAULT NULL,
  `default_message` varchar(1000) DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `created` varchar(30) DEFAULT NULL,
  `edited` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_entity` (`fk_id_entity`),
  CONSTRAINT `Area_ibfk_1` FOREIGN KEY (`fk_id_entity`) REFERENCES `Entity` (`id_name`),
  CONSTRAINT `Area_chk_1` CHECK ((`private` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Area`
--

LOCK TABLES `Area` WRITE;
/*!40000 ALTER TABLE `Area` DISABLE KEYS */;
INSERT INTO `Area` VALUES (1,'@Cyberlink','#ventas','Bienvenidos al area #nombre del area, todos sus mensajes serán redirijidos a esta area',NULL,0,'2020-10-26 22:43:59.844747','2020-10-26 22:43:59.844747'),(2,'@Cyberlink','#servicio','Bienvenidos al area #nombre del area, todos sus mensajes serán redirijidos a esta area',NULL,0,'2020-10-26 22:44:09.052422','2020-10-26 22:44:09.052422');
/*!40000 ALTER TABLE `Area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Code`
--

DROP TABLE IF EXISTS `Code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone_id` varchar(50) DEFAULT NULL,
  `id_name_entity` varchar(15) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `code_entity` tinyint(1) DEFAULT NULL,
  `qrcode_url` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `status_login` tinyint(1) DEFAULT NULL,
  `id_product` varchar(60) DEFAULT NULL,
  `default_message` varchar(1000) DEFAULT NULL,
  `sent_area` tinyint(1) DEFAULT NULL,
  `created` varchar(30) DEFAULT NULL,
  `edited` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_id` (`phone_id`),
  KEY `id_name_entity` (`id_name_entity`),
  CONSTRAINT `Code_ibfk_1` FOREIGN KEY (`id_name_entity`) REFERENCES `Entity` (`id_name`),
  CONSTRAINT `Code_chk_1` CHECK ((`code_entity` in (0,1))),
  CONSTRAINT `Code_chk_2` CHECK ((`status` in (0,1))),
  CONSTRAINT `Code_chk_3` CHECK ((`status_login` in (0,1))),
  CONSTRAINT `Code_chk_4` CHECK ((`sent_area` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Code`
--

LOCK TABLES `Code` WRITE;
/*!40000 ALTER TABLE `Code` DISABLE KEYS */;
INSERT INTO `Code` VALUES (3,'6699','@Cyberlink','5493764921348',0,'http://localhost:5000/img_data/6699.png',NULL,NULL,NULL,'Bienvenido a Cyberlink',1,'2020-10-26 22:14:24.905791','2020-10-26 22:14:24.905791');
/*!40000 ALTER TABLE `Code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_account` int DEFAULT NULL,
  `id_contact` int DEFAULT NULL,
  `type_contact` varchar(10) DEFAULT NULL,
  `name_contact` varchar(30) DEFAULT NULL,
  `node2` varchar(15) DEFAULT NULL,
  `node3` varchar(15) DEFAULT NULL,
  `node4` varchar(15) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `created` varchar(30) DEFAULT NULL,
  `edited` varchar(30) DEFAULT NULL,
  `image_contact` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_account` (`id_account`),
  CONSTRAINT `Contact_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `Account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
INSERT INTO `Contact` VALUES (1,1,2,'entity','sergio','','','.sergio','','2020-11-09 20:50:19.845564','2020-11-09 20:50:19.845564',NULL);
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entity`
--

DROP TABLE IF EXISTS `Entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_name` varchar(15) DEFAULT NULL,
  `id_name_account` varchar(15) DEFAULT NULL,
  `profile_img` varchar(50) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `created` varchar(30) DEFAULT NULL,
  `edited` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_name` (`id_name`),
  KEY `id_name_account` (`id_name_account`),
  CONSTRAINT `Entity_ibfk_1` FOREIGN KEY (`id_name_account`) REFERENCES `Account` (`id_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entity`
--

LOCK TABLES `Entity` WRITE;
/*!40000 ALTER TABLE `Entity` DISABLE KEYS */;
INSERT INTO `Entity` VALUES (2,'@Cyberlink','.denisg',NULL,'Cyberlink srl','2020-10-26 21:23:57.339640','2020-10-26 21:23:57.339640');
/*!40000 ALTER TABLE `Entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Members`
--

DROP TABLE IF EXISTS `Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_name_entity` varchar(15) DEFAULT NULL,
  `fk_id_area` int DEFAULT NULL,
  `id_name_account_member` varchar(15) DEFAULT NULL,
  `subscriptions_id` int DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created` varchar(30) DEFAULT NULL,
  `edited` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_name_entity` (`id_name_entity`),
  KEY `fk_id_area` (`fk_id_area`),
  KEY `id_name_account_member` (`id_name_account_member`),
  KEY `subscriptions_id` (`subscriptions_id`),
  CONSTRAINT `Members_ibfk_1` FOREIGN KEY (`id_name_entity`) REFERENCES `Entity` (`id_name`),
  CONSTRAINT `Members_ibfk_2` FOREIGN KEY (`fk_id_area`) REFERENCES `Area` (`id`),
  CONSTRAINT `Members_ibfk_3` FOREIGN KEY (`id_name_account_member`) REFERENCES `Account` (`id_name`),
  CONSTRAINT `Members_ibfk_4` FOREIGN KEY (`subscriptions_id`) REFERENCES `Subscriptions` (`id`),
  CONSTRAINT `Members_chk_1` CHECK ((`admin` in (0,1))),
  CONSTRAINT `Members_chk_2` CHECK ((`active` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Members`
--

LOCK TABLES `Members` WRITE;
/*!40000 ALTER TABLE `Members` DISABLE KEYS */;
/*!40000 ALTER TABLE `Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Messages`
--

DROP TABLE IF EXISTS `Messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Messages` (
  `tickets_id` int DEFAULT NULL,
  `id` varchar(80) NOT NULL,
  `type` varchar(15) NOT NULL,
  `text` varchar(6000) DEFAULT NULL,
  `_serialized` varchar(80) DEFAULT NULL,
  `fromMe` tinyint(1) DEFAULT NULL,
  `mime` varchar(50) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `caption` varchar(200) DEFAULT NULL,
  `filename` varchar(150) DEFAULT NULL,
  `payload` varchar(100) DEFAULT NULL,
  `vcardList` varchar(1000) DEFAULT NULL,
  `timestamp` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tickets_id` (`tickets_id`),
  CONSTRAINT `Messages_ibfk_1` FOREIGN KEY (`tickets_id`) REFERENCES `Tickets` (`id`),
  CONSTRAINT `Messages_chk_1` CHECK ((`fromMe` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Messages`
--

LOCK TABLES `Messages` WRITE;
/*!40000 ALTER TABLE `Messages` DISABLE KEYS */;
INSERT INTO `Messages` VALUES (14,'9df99f9f-4a3d-4b5f-9bc6-ebf9763a8f33QWNjb3VudDoy','text','you can do it',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1603984527),(14,'cee91938-5973-4d90-b9f4-6592d258da18QWNjb3VudDoy','text','you can do it',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1603984808),(14,'de5e79c7-a7bf-4573-8f4d-27108d0c1169QWNjb3VudDoy','text','hola denis como estas?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1603845590),(11,'false_5493764548483@c.us_164B63967533D94FE9D973D4714CCA0A','text','Jgjfjfj','false_5493764548483@c.us_164B63967533D94FE9D973D4714CCA0A',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'false_5493764548483@c.us_A1A0FAA84056830FCFF62676AA4E4050','text','Hhhjjjf','false_5493764548483@c.us_A1A0FAA84056830FCFF62676AA4E4050',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'false_5493764548483@c.us_C0D1BBC95ED9BD0F9BC80E231184B930','text','ventas','false_5493764548483@c.us_C0D1BBC95ED9BD0F9BC80E231184B930',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'false_5493764548483@c.us_FE635A624D3015B57AE16C597A2A755E','text','Dvfg','false_5493764548483@c.us_FE635A624D3015B57AE16C597A2A755E',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subscriptions`
--

DROP TABLE IF EXISTS `Subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_name_account` varchar(10) DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `created` varchar(30) DEFAULT NULL,
  `edited` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_name_account` (`id_name_account`),
  CONSTRAINT `Subscriptions_ibfk_1` FOREIGN KEY (`id_name_account`) REFERENCES `Account` (`id_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subscriptions`
--

LOCK TABLES `Subscriptions` WRITE;
/*!40000 ALTER TABLE `Subscriptions` DISABLE KEYS */;
INSERT INTO `Subscriptions` VALUES (1,'.denisg','QRIW','.denisg','2020-10-23 16:53:05.083240','2020-10-23 16:53:05.083240'),(2,'.denisg','DGDF','@Cyberlink','2020-10-26 21:23:57.339640','2020-10-26 21:23:57.339640'),(3,'.denisg','7Y5R','@Cyberlink#ventas','2020-10-26 22:43:59.844747','2020-10-26 22:43:59.844747'),(4,'.denisg','7T7T','@Cyberlink#servicio','2020-10-26 22:44:09.052422','2020-10-26 22:44:09.052422'),(5,'.sergio','IPRO','.sergio','2020-10-27 23:53:50.748932','2020-10-27 23:53:50.748932');
/*!40000 ALTER TABLE `Subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tk` varchar(50) DEFAULT NULL,
  `product_id` varchar(50) DEFAULT NULL,
  `phone_id` varchar(50) DEFAULT NULL,
  `node2` varchar(30) DEFAULT NULL,
  `node3` varchar(30) DEFAULT NULL,
  `node4` varchar(30) DEFAULT NULL,
  `current` tinyint(1) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `count` int DEFAULT NULL,
  `last_id_msg` varchar(100) DEFAULT NULL,
  `timestamp` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Tickets_chk_1` CHECK ((`current` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
INSERT INTO `Tickets` VALUES (11,'5493764548483@c.us','339e74af-66bc-4221-9ab5-cf7d5ee3c57a','6699','@Cyberlink','','',0,'5493764548483','Denisdk','https://pps.whatsapp.net/v/t61.24694-24/95090526_255351992509216_3741466225912259072_n.jpg?oh=7d4bdde894587aca530bfcfd7724b321&oe=5F9C674A',3,'false_5493764548483@c.us_FE635A624D3015B57AE16C597A2A755E',1603752788),(12,'5493764548483@c.us','339e74af-66bc-4221-9ab5-cf7d5ee3c57a','6699','@Cyberlink','#ventas','',0,'5493764548483','Denisdk','https://pps.whatsapp.net/v/t61.24694-24/95090526_255351992509216_3741466225912259072_n.jpg?oh=7d4bdde894587aca530bfcfd7724b321&oe=5F9C674A',3,'false_5493764548483@c.us_C8711ED6146B6AD502FCA4E932B7D4EC',1603752869),(13,'5493764548483@c.us','339e74af-66bc-4221-9ab5-cf7d5ee3c57a','6699','@Cyberlink','#servicio','',1,'5493764548483','Denisdk','https://pps.whatsapp.net/v/t61.24694-24/95090526_255351992509216_3741466225912259072_n.jpg?oh=7d4bdde894587aca530bfcfd7724b321&oe=5F9C674A',1,'false_5493764548483@c.us_A6A83BED23682DC6A1F454D62172AE9C',1603752886),(14,'QWNjb3VudDoy',NULL,'','','','.denisg',1,NULL,'sergio',NULL,1,'cee91938-5973-4d90-b9f4-6592d258da18QWNjb3VudDoy',1603984808);
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'entity_model_server_v_005_2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-22 12:18:47
