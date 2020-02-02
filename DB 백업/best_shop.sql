-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: best_shop
-- ------------------------------------------------------
-- Server version	10.2.30-MariaDB

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` varchar(50) NOT NULL,
  `q_id` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `content` blob NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `answer_FK` (`q_id`),
  CONSTRAINT `answer_FK` FOREIGN KEY (`q_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `id` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  CONSTRAINT `authorities_FK` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baskets`
--

DROP TABLE IF EXISTS `baskets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baskets` (
  `u_id` varchar(50) NOT NULL,
  `p_id` varchar(50) NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`u_id`),
  KEY `basket_FK_p_id` (`p_id`),
  CONSTRAINT `basket_FK_p_id` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `basket_FK_u_id` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baskets`
--

LOCK TABLES `baskets` WRITE;
/*!40000 ALTER TABLE `baskets` DISABLE KEYS */;
/*!40000 ALTER TABLE `baskets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` varchar(50) NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `p_id` varchar(50) NOT NULL,
  `status` enum('ready','delivery','complete') NOT NULL,
  `ship_addr` varchar(50) DEFAULT NULL,
  `payment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `order_FK` (`u_id`),
  KEY `order_FK_1` (`p_id`),
  CONSTRAINT `order_FK` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_FK_1` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `CONSTRAINT_1` CHECK (json_valid(`payment`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` varchar(50) NOT NULL,
  `name` varchar(500) NOT NULL,
  `type` enum('top','bottom','bag','shoes','Accesorie') NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `description` varchar(2000) NOT NULL,
  `image` mediumblob NOT NULL,
  `status` enum('out_of_stock','in_stock','running_low') NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('Accesorie_01','sunglasses','Accesorie',30000,'Rainbow Color Sunglasses','[B@3b671974','in_stock','2020-02-01 16:12:36','2020-02-01 16:12:36'),('bag_01','bag1','bag',10000,'bag1','[B@556a1b45','in_stock','2020-02-01 16:10:20','2020-02-01 16:10:20'),('bottom_01','black long skirt','bottom',20000,'black long skirt','[B@579dc9f2','in_stock','2020-02-01 16:09:07','2020-02-01 16:09:07'),('bottom_02','mini skirt','bottom',14000,'white tennis mini skirt','[B@28993c56','in_stock','2020-02-01 16:17:02','2020-02-01 16:17:02'),('bottom_03','chiffon skirt','bottom',25000,'black flower chiffon skirt','[B@4b4c0005','in_stock','2020-02-01 16:18:48','2020-02-01 16:18:48'),('shoes_01','candy pink shoes','shoes',30000,'Ribbon Candy Pink Shoes','[B@564fe2b9','in_stock','2020-02-01 16:11:21','2020-02-01 16:11:21'),('test_upload_product','test_product001','top',14000,'test upload','[B@4f0734b1','in_stock','2020-02-02 14:45:06','2020-02-02 14:45:06'),('top_01','Cotton T-shirt','top',20000,'cottion_shirt','[B@393ba7d8','in_stock','2020-02-01 16:05:13','2020-02-01 16:05:13'),('top_02','lace blouse','top',24000,'lace blouse','[B@3be15944','in_stock','2020-02-01 16:14:30','2020-02-01 16:14:30'),('top_03','Hard Rock T-shirt','top',10000,'Hard Rock T-shirt','[B@6d92a4b4','in_stock','2020-02-01 16:15:55','2020-02-01 16:15:55'),('top_04','top4','top',40000,'top4','[B@27ccdecd','in_stock','2020-02-02 15:46:24','2020-02-02 15:46:24');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` varchar(50) NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `p_id` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `content` blob NOT NULL,
  `createTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `question_FK` (`u_id`),
  KEY `question_FK_1` (`p_id`),
  CONSTRAINT `question_FK` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `question_FK_1` FOREIGN KEY (`p_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` varchar(50) NOT NULL,
  `o_id` varchar(50) NOT NULL,
  `u_id` varchar(50) NOT NULL,
  `rev_price` double NOT NULL,
  `rev_quality` double NOT NULL,
  `rev_ship` double NOT NULL,
  `rev_agv` double NOT NULL,
  `content` blob NOT NULL,
  `image_1` mediumblob DEFAULT NULL,
  `image_2` mediumblob DEFAULT NULL,
  `image_3` mediumblob DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `review_FK` (`u_id`),
  KEY `review_FK_1` (`o_id`),
  CONSTRAINT `review_FK` FOREIGN KEY (`u_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_FK_1` FOREIGN KEY (`o_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(50) NOT NULL,
  `pwd` varchar(500) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `age` smallint(6) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `likeit` varchar(50) DEFAULT NULL,
  `agree` varchar(50) DEFAULT NULL,
  `agree2` varchar(50) DEFAULT NULL,
  `SESSIONKEY` varchar(50) DEFAULT NULL,
  `SESSIONLIMIT` varchar(50) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','admin','admin','woman',23,'010-0000-0000','seoul','admin@admin.com','top','yes','yes',NULL,NULL,'2020-02-01 16:03:54','2020-02-01 16:03:54'),('user01','user01','user01','man',23,'010-1010-0202','busan','user01@user.com','top','yes','yes',NULL,NULL,'2020-02-02 10:52:52','2020-02-02 10:52:52');
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

-- Dump completed on 2020-02-03  0:53:04
