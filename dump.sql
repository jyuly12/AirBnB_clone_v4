-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: hbnb_dev_db
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.1

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
-- Current Database: `hbnb_dev_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `hbnb_dev_db` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `hbnb_dev_db`;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES ('1a5f3827-05dd-43f2-bbcd-ce58942951a1','2021-09-20 21:32:29','2021-09-20 21:32:29','0b52f9a1-2770-4579-a857-69faf34884e5','Perro'),('317d5b39-7635-42c8-815c-50bb8d11857c','2021-09-19 07:30:01','2021-09-19 07:30:01','0b52f9a1-2770-4579-a857-69faf34884e5','San Francisco'),('44bffdbc-2fdb-487c-9501-17630993a1ec','2021-09-21 05:34:15','2021-09-21 05:34:15','544bee22-bbb7-445b-817f-41e392dd2158','Madrid'),('87b34100-bb26-4b82-8420-d79560db893b','2021-09-20 04:31:56','2021-09-20 04:31:56','0b52f9a1-2770-4579-a857-69faf34884e5','citytest3'),('95c29c2a-fa67-44f5-a301-b4ca5d5fd41b','2021-09-20 04:32:04','2021-09-20 04:32:04','0b52f9a1-2770-4579-a857-69faf34884e5','citytest4'),('dc3401fa-99dd-4255-b035-8acaa8570b89','2021-09-20 04:31:56','2021-09-20 04:31:56','0b52f9a1-2770-4579-a857-69faf34884e5','citytest2'),('ff9f38d9-1037-4c78-806a-85155b9543db','2021-09-20 04:31:22','2021-09-20 04:31:22','0b52f9a1-2770-4579-a857-69faf34884e5','citytest1');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_amenity`
--

DROP TABLE IF EXISTS `place_amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `place_amenity` (
  `place_id` varchar(60) NOT NULL,
  `amenity_id` varchar(60) NOT NULL,
  PRIMARY KEY (`place_id`,`amenity_id`),
  KEY `amenity_id` (`amenity_id`),
  CONSTRAINT `place_amenity_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `place_amenity_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_amenity`
--

LOCK TABLES `place_amenity` WRITE;
/*!40000 ALTER TABLE `place_amenity` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `city_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `number_rooms` int(11) NOT NULL,
  `number_bathrooms` int(11) NOT NULL,
  `max_guest` int(11) NOT NULL,
  `price_by_night` int(11) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `places_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `places_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES ('118ddff2-97e9-4caa-b442-e0a9b083d2af','2021-09-21 05:12:36','2021-09-21 05:12:36','1a5f3827-05dd-43f2-bbcd-ce58942951a1','6d198585-67bc-4735-9b9e-46f53c9f5035','NOMBRE DEL LUGARinsert description here','5',3,7,160,1,1,1),('422b9fff-a8b3-4207-a59b-09635ef2a992','2021-09-21 05:11:10','2021-09-21 05:11:10','1a5f3827-05dd-43f2-bbcd-ce58942951a1','6d198585-67bc-4735-9b9e-46f53c9f5035','NOMBRE DEL LUGARinsert description here','5',3,7,160,1,1,1),('592bfd4d-860e-4f19-9e59-d1c0a58426d5','2021-09-21 05:12:36','2021-09-21 05:12:36','1a5f3827-05dd-43f2-bbcd-ce58942951a1','6d198585-67bc-4735-9b9e-46f53c9f5035','NOMBRE DEL LUGARinsert description here','5',3,7,160,1,1,1),('9549f1a7-b11e-4de6-8af5-d4f11e873f33','2021-09-21 05:48:23','2021-09-21 05:48:23','44bffdbc-2fdb-487c-9501-17630993a1ec','2565faf0-1e7b-4bc7-8135-8a8d59e35429','OtroHotel','ghfdthfxcghvbk',89,89,100,788,1,2),('a46de986-067c-4b23-a3a9-09ddd1e1336d','2021-09-21 05:13:04','2021-09-21 05:13:04','1a5f3827-05dd-43f2-bbcd-ce58942951a1','6d198585-67bc-4735-9b9e-46f53c9f5035','NOMBRE DEL LUGARinsert description here','5',3,7,160,1,1,1),('c8fafb76-085a-45c9-8fbd-3fa2aebe9812','2021-09-21 05:13:02','2021-09-21 05:13:02','1a5f3827-05dd-43f2-bbcd-ce58942951a1','6d198585-67bc-4735-9b9e-46f53c9f5035','NOMBRE DEL LUGARinsert description here','5',3,7,160,1,1,1),('d98e253d-ba6c-457a-9881-66abb38a33ec','2021-09-21 05:46:03','2021-09-21 05:46:03','44bffdbc-2fdb-487c-9501-17630993a1ec','2565faf0-1e7b-4bc7-8135-8a8d59e35429','HotelKardashian','hexagonospalacio',89,89,100,788,1,2);
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `place_id` varchar(60) NOT NULL,
  `user_id` varchar(60) NOT NULL,
  `text` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `place_id` (`place_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES ('0932f2f8-ae59-4b53-849d-b8f1cb2fdec2','2021-09-20 01:16:04','2021-09-20 01:16:04','Shakira is so cool'),('0b52f9a1-2770-4579-a857-69faf34884e5','2021-09-19 07:30:01','2021-09-19 07:30:01','California'),('30c1f121-1c7e-41cc-a786-48217c95699d','2021-09-20 01:16:48','2021-09-20 01:16:48','California'),('544bee22-bbb7-445b-817f-41e392dd2158','2021-09-21 05:33:28','2021-09-21 05:33:28','Arizona'),('63854074-774a-4cd6-9da5-e6b1cab77cd0','2021-09-20 01:03:58','2021-09-20 01:03:58','California'),('6475291d-852d-47a5-8764-643ff531d4d0','2021-09-20 00:54:24','2021-09-20 00:54:24','California'),('b1896295-4e3d-46b6-9df9-e7b27caab7d6','2021-09-20 21:08:03','2021-09-20 21:08:03','Laciudadmaspro'),('c228187d-f635-47b2-ba60-ecbe60522782','2021-09-20 00:37:07','2021-09-20 00:37:07','California'),('f2bffcac-3af6-4b4d-91c8-b1511d6990c2','2021-09-19 07:28:38','2021-09-19 07:28:38','California');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `first_name` varchar(128) DEFAULT NULL,
  `last_name` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('2565faf0-1e7b-4bc7-8135-8a8d59e35429','2021-09-21 05:36:28','2021-09-21 05:36:28','p@m.com','973c2349e3a9c7ad19047ed7fe1f904a','Ter','xx'),('6d198585-67bc-4735-9b9e-46f53c9f5035','2021-09-21 04:18:47','2021-09-21 04:18:47','perro@mail.com','1a1dc91c907325c69271ddf0c944bc72','Afan','AHH'),('a9fbf6f6-7286-45fa-9898-b7593f2868a3','2021-09-19 07:21:05','2021-09-19 07:21:05','bob@hbtn.io','bobpwd','Bob','Dylan'),('d77657bb-8a1f-4392-9a58-7e81ff95a99f','2021-09-19 07:19:35','2021-09-19 07:19:35','gui@hbtn.io','guipwd','Guillaume','Snow');
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

-- Dump completed on 2021-09-24 19:24:03
