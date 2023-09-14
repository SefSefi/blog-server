-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'wood work'),(2,'knitting'),(3,'painting'),(4,'blacksmith'),(5,'weave straw'),(6,'Flower arrangement'),(7,'Pottery');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'comment1',11,100),(2,'comment2',11,100),(3,'לל',11,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,'2023-05-29 12:03:04',2,14),(22,'2023-05-29 12:03:04',1,13),(23,'2023-05-29 12:03:04',3,12),(24,'2023-05-29 12:03:04',4,11);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (11,'Hello world','yesterday I heard about the opening of the blog','2023-05-29 11:33:04',1,NULL),(12,'Good Morning','Where is the best coffe shop in Tel-Aviv? ','2023-05-29 11:41:21',2,NULL),(13,'Wellcom','I welcome all new pepole in this blog','2023-05-29 11:41:21',3,NULL),(14,'technical help needed','I\'m having trouble figuring out how to like someone\'s post?','2023-05-29 11:41:21',1,NULL),(15,'new post title','new post body','2023-05-30 18:58:14',1,NULL),(16,'new post title','new post body','2023-05-30 19:02:19',1,NULL),(17,'ddsf','sdv','2023-06-26 13:20:37',NULL,NULL),(18,'jj','kjhh','2023-06-26 13:23:19',NULL,NULL),(19,'dsd','fdf','2023-06-26 13:24:59',NULL,NULL),(20,'ds','dd','2023-06-26 13:25:29',NULL,NULL),(21,'hello world','some content','2023-06-26 18:40:58',93,NULL),(22,'dd','vsdvf','2023-06-27 14:32:06',95,NULL),(23,'sefi title','sefi content!','2023-07-17 11:57:09',100,6),(24,'Hello world','yesterday I heard about the opening of the blog','2023-07-20 15:58:38',101,2);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (23,83,'23090d30-c759-431a-a251-c2b8c6add3aa'),(42,101,'64ba7e39-8625-4f46-85af-67c71c4b2e00'),(57,102,'8ea1558e-82c4-4d59-8e2d-efc05537d13d'),(69,100,'d3c08804-6e4a-423f-a16b-0b131fd07c53'),(70,102,'eb7d9b0c-13cc-4397-a430-c7f87cfb9000'),(71,100,'6f780502-5694-40b9-94dc-a6a97ef77250');
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Michael','2023-05-29 11:20:39','1234'),(2,'Michal','2023-05-29 11:22:33','1111'),(3,'Misha','2023-05-29 11:22:33','1040'),(4,'Moshit','2023-05-29 11:22:33','202020'),(5,'Miriam','2023-06-10 19:47:26','1400'),(6,'Meital','2023-06-10 22:01:11','3423'),(7,'Meny','2023-06-11 13:36:30','39953'),(8,'Marina','2023-06-14 20:14:33','$2b$12$5vCOvynnIK2TBrsAB5yjv.2C9J.mypdqAz2RbQy4ADer9flmQZ496'),(9,'user','2023-06-15 19:02:19','$2b$12$w7sIajSiLJzitofKUEJ/2ONjC9lX7YhuXTb4U7XiAB4vUZo8Ddio2'),(10,'Mimi','2023-06-15 22:15:19','$2b$12$d58fivLGNOpEvQ5Gk4fq4.S8vvBiawstMAG1N41cZQUz.mVfboRfC'),(11,'Haim','2023-06-17 21:31:20','$2b$12$4lc9q/kc6UxIlEn8DBgwmenWGKohKjTsQ7TpIHrSasDMVeRd8EEFO'),(12,'Becky','2023-06-18 06:26:49','$2b$12$FhAtIdmtGPPv.PCA9/VqGuXIOjOA3S3xssoVqNGMzUa1UjYwuTk1u'),(13,'user2','2023-06-20 17:31:43','$2b$12$V7KtNzaIfIG1kPSvTe8JG.xQmmYCafwtl/t3oew.75Ai7YpTigVgK'),(14,'user3','2023-06-20 17:38:01','$2b$12$r2JWL9EunFno3/cmhHcxguXVaIb42n8fnwKF8tuXwSGxdGI69RXIq'),(15,'user4','2023-06-20 17:44:41','$2b$12$DfFNUZrtVT5ZmXZkT0qeyeSkFAndh9DLAAaLhtC77FPc.FzZLXP5W'),(16,'user5','2023-06-20 17:51:52','$2b$12$osOExZoYYuzMygAX6iWdZu95xjaWpXlZwglJaUS0Wo36QT63KKfU6'),(17,'user6','2023-06-20 17:55:35','$2b$12$c1RLuZeSdObNr5OlK7opb.NJZ7M2mIpLUOSLMhToFPNE6SC5M5d36'),(18,'user7','2023-06-20 17:57:54','$2b$12$QyR4YG8oD3dZG4vnp.rnl.i9IC2rne0pL6SWwJ/PBh1HXhC8t/KEq'),(19,'user8','2023-06-20 18:00:27','$2b$12$t6Qs8KW79NAK6mlJ5.aRMuxknJLiW5iWEEbbsHAoiREJDGM.RCUjS'),(20,'user9','2023-06-20 18:16:21','$2b$12$p1YL4YdnxZIEKzTX/9DbReT7Novr07XjM6pygfIGw1IzONTElX8UC'),(21,'user11','2023-06-20 18:17:21','$2b$12$EZHhZWzwIBjslF2QSNEJmuaSxfdEc4MT.PX8ciQcm2ZV2WQ6F9e6e'),(22,'user12','2023-06-20 18:20:16','$2b$12$HdSDApy6KiKQKGf13Z3z7ewFe0gY0UHWVSNkhWiv/7BdLOEVmnzvC'),(23,'user13','2023-06-20 18:25:30','$2b$12$pBkwt6A91Vxh717iq3x0W.MlzTAyz8PC0n3Y4lygEsNLgL.29E3Du'),(24,'user14','2023-06-20 18:34:11','$2b$12$ymvVoqPjeul58GuQSfmMbOpQvRuwgDDxp9ptqOed3dv/NvauLjHCG'),(25,'user15','2023-06-20 18:37:06','$2b$12$/bsbUb9OGXtf2Gi6bGzNH.EG8aPtr3K03DqgDPGd5bKzeBjyGHuqi'),(26,'user16','2023-06-20 18:40:55','$2b$12$EcRnm146QpWo51CWwgPl6.6zORHrupg9rRriq9Aj6mZqY6spCBLHy'),(27,'user16','2023-06-20 18:46:44','$2b$12$6kvqf5kEAxs1OYLMgvzPOe0IU.Tn.4Rf2Pgpg7RS.DNHX/7IVac8C'),(28,'user17','2023-06-20 18:47:43','$2b$12$Y/0Wav3wuhNu5OdAX./aROGOdOpzkEUYaKuATyxsVs.UA0iD.oNuq'),(29,'user17','2023-06-20 18:49:05','$2b$12$eARZMg1EMGLCU9c0v.2QAOPs0eJtgLGbTqzbEIq1PmBW3dZ56ysR2'),(30,'user','2023-06-20 18:50:51','$2b$12$uhr98sSVJFNiYkfuwiwQe.YAiFBXFCIG9ame0IDvcaWK8iXFaajWq'),(31,'user19','2023-06-20 18:51:19','$2b$12$wwQC.8zVRqaInJSC9FCo4OL2/TlA1Wq6TDHRvHwBpGF8oDJI3W9K6'),(32,'user20','2023-06-20 18:59:30','$2b$12$Whotu01L2aeFzgfho.i5pOZ/N8cI7C/b6ABxYLQWYv5OT7avXJx32'),(33,'user21','2023-06-20 19:02:10','$2b$12$SI9Bt0/wpf62DwFi59rhN.W.E4EOW2Txw9.iZTNip8TcwulfHOtPy'),(34,'user22','2023-06-20 19:05:11','$2b$12$damEUzIRQ2eJIvETok2yIuh1gUPQo2aM6jayT1WScIjm5WDRjzFVq'),(35,'user23','2023-06-20 19:07:01','$2b$12$h/atxe5WtWPaBHFD8xHjdu9QL.S5yKmRz1gJpWPn.p2pupw.ZLMqq'),(36,'shunin','2023-06-20 20:21:58','$2b$12$8lw6hEaCP5XS5pqpjld.HePC33gpG/VJ9I9Z6l90CMoAEhh.Y/LBa'),(37,'natasha','2023-06-21 10:12:24','$2b$12$AvviBOzzQSu5GBbQSIjXC.QNeKCnaRA3rc7yb.eKFHXx5iAvXqwea'),(38,'hh','2023-06-21 14:06:34','$2b$12$IxkQJ6Xj7H8u67U.0nHGHe.0xGcnLBDXfNDOvU8/mIZ6mHFj04LL.'),(39,'mm','2023-06-21 14:09:06','$2b$12$FT60FKpC8Ri3BdPksNYFXOl/UWy1KPJ97tlCRggAmF4oVYTD5/u2C'),(40,'oo','2023-06-21 14:15:48','$2b$12$BmGI4bsiKkIfYgeP0Gh7MO8HqQjyXF36FGHRWDJalfjQqgjnJ5JJa'),(41,'lklk','2023-06-21 14:16:41','$2b$12$kej33IDMgIbQzhn.kbWWEe6CDPy5gaHhgoprYkbOFjbzJ0BSmRzE.'),(42,'user','2023-06-21 19:09:37','$2b$12$Vy8GAQqFOLtXdJ7MrMZw9emVq4AeoYoezaEAWcNplCeoImi0Oc3Ti'),(43,'jj','2023-06-21 20:58:52','$2b$12$vk41jWluMeGYgwkGId9YWO3rKvAuRm82IkApFCBd5Vyi/iI1EVQ4C'),(44,'ll','2023-06-21 22:05:50','$2b$12$NbyxJjZB1yYe1QI4O0sFfuuZ.VoVKje5CdUYyIwaQ4uOwWx4AgKCS'),(45,'ll','2023-06-21 22:06:42','$2b$12$G874lWpbxqawHqTR.aawFeuqYSbRLO7.6Odq6LSL1lKEtr7z2qaNu'),(46,'kk','2023-06-21 23:17:15','$2b$12$bux1EmYzMpDN3YaYkSbWLeEUbP4UlPQabJjJxQ98hRzd2llzrvVti'),(47,'ff','2023-06-22 00:44:38','$2b$12$b.SbUbmG.YHMj2gqzg8lzOtnn5zRqgrMO7i.lEmpD4RnqtIXD1yzG'),(48,'llpp','2023-06-22 01:07:08','$2b$12$3WFlzJ5wHvGNDjQtUzO7.OyPFVBqvrHIb2dU6ToW57Vm0NS9QPGya'),(49,'pak','2023-06-22 01:44:28','$2b$12$SM8.UasovKbzk9Mdi1QwSeh46JzFKM3uqaZaNTg3bo86rr1qzTEaC'),(50,'hh','2023-06-22 09:51:46','$2b$12$/a6.Onmokt8L2u92D0WijeGvyDg4xNAVK8VajA8Ygw2rXs1WAM1La'),(51,'rr','2023-06-22 10:05:05','$2b$12$oAYyRkIBgA4nIaxgfA2CWudh8prGUEFsaZVmaVV0NwO/vi.Ikhzv6'),(52,'jj','2023-06-22 10:22:42','$2b$12$xkoVZu4ppy.ivB1zTQFcAeqGBDo3aLKXaCkHzCsnhkrXvZthkcJ0W'),(53,'r','2023-06-22 10:24:52','$2b$12$u8ygRWW2mkRCRoopzSf13urzHHO32FYAUlkNHn0gLjN/6DuR08o22'),(54,'jjk','2023-06-22 10:33:09','$2b$12$2uUdMxiteRDS3gnTQCtgSuttjDFUF6/lSllpLSvtN2tZeAknYISMG'),(55,'kkl','2023-06-22 10:34:30','$2b$12$cAcXGdgUJnEd4TTGUfXcju/NDUZqJ7hQReRaYtYuXuo7AHR.aH67G'),(56,'ee','2023-06-22 10:41:54','$2b$12$t/RFzTIRRIqY5FAcRFN13.xHuymyn1V5aWzq8TqLxYXQ3ZSfG3aEO'),(57,'user50','2023-06-22 16:54:34','$2b$12$yJa.e7wsJXZD12GBZGQVh.aSa3gwurIh/YyNELZS9rcZCnms2b19i'),(58,'user51','2023-06-22 17:02:07','$2b$12$jc2nqnynMLdIrYxbDehswek1N6v6sy1TinKPFncXplD0FTZnMDuqi'),(59,'yy','2023-06-25 07:28:15','$2b$12$3WSxZg67/aUs8MEVStdsCem2OFZzj9Ye173zLbCKp07eBqQt0idaO'),(60,'3f','2023-06-25 07:34:30','$2b$12$msELRYTZbW24EWs7D7Z7XuPHuBNrtxb9q1rcAUHZkEUPdNFtXS.DK'),(61,'io','2023-06-25 07:36:04','$2b$12$.4Xbghw8NTido0Lzv/2VM.ZJc.z8T25OyyQ6gjR7ZFW7SIz0twJoe'),(62,'rr','2023-06-25 07:37:27','$2b$12$lZMOaJQxLMld3mESpaeCWeEn7iRKzATI/r/jX/FmKx4mzAszBE1AG'),(63,'ad','2023-06-25 07:39:32','$2b$12$twdWIL7zfaZnXizLYJ.eJuBWrgQ9nt3dwWyqS9Vsb4b/0ri0r/Uq6'),(64,'zv','2023-06-25 07:42:06','$2b$12$ee/wyWLnQQ7amsyRJFDMNOYm4D/iWvkRgrAH2Bkq9/RWtis/t89R6'),(65,'mn','2023-06-25 07:44:52','$2b$12$TrrVxxcAgL8k1yoULLmbxuYK.LkGX0v1QsCWYHoqDGtfTPe3XlvIK'),(66,'er','2023-06-25 07:54:15','$2b$12$.A7XcbP252kaCOfW6sgF/uc0XVN3wHGdoPaow5JDU7pnDNZPFan/q'),(67,'rt','2023-06-25 07:55:32','$2b$12$NUuVbvfzEGEUKUkmQVWznuOovN.lHMEVSfuzoQkxlpixuwval2tXq'),(68,'14','2023-06-25 07:57:16','$2b$12$WjKMzKQofMMj7Flmn1QBiOt3rlxNOvlDCG39iKncV8E0hMhHNIz5i'),(69,'1df','2023-06-25 08:00:40','$2b$12$/kxwvCPvVtH7Fly4thSVLOEZ/0jqGHaltVy/WcfiT9VEuuo21n4FS'),(70,'asd','2023-06-25 08:00:53','$2b$12$zqQh6LCClDC6DcTNcxFU0O5CCcxFnD.AXTzrAZov8ZNYcoYv8Zsx6'),(71,'asd','2023-06-25 08:02:23','$2b$12$WasYO/vRp4ef8dnTjNnV..dYVqZgjXSRWbsZxhlaFxV4IKr3Lycr2'),(72,'zcx','2023-06-25 08:05:56','$2b$12$lCCg6.QtT2iCEfKQnUlRRO/om2qp0x0PJLP4SNJFFGJrmd05XRrwK'),(73,'zvv','2023-06-25 08:09:49','$2b$12$dR9Wu77KeQHPgaA1kVKKTuoJ/QFix.HE/UHGO8IvJutsCiP6xbx/K'),(74,'mmn','2023-06-25 08:14:38','$2b$12$zMJbp8Gwe.qW3nw43sFfh.5eJ3QjScOefMXJQWfxel7MXMWpro9aG'),(75,'nnm','2023-06-25 08:16:09','$2b$12$2IYL6pM5BieVj398vQKnxuSwMOiczb26368sc8DDPnzR0wgyt2SR6'),(76,'bn','2023-06-25 08:17:05','$2b$12$4w2BwwD7/BHIRUTMuj1vV.LcbO/MdhWWOCgz/K66UnTDIkjg1fSMi'),(77,'uy','2023-06-25 08:19:49','$2b$12$0./Knb8/XJ0y/J3WLiccT.9Ih3.I9ZjJl/wPEzg7tpf1MWdcDrYtm'),(78,'iu','2023-06-25 08:21:20','$2b$12$999ghhg0mEqztQ769oPb1.MZpINl4mhPyXsCUsUsKkqastZZKgijC'),(79,'lk','2023-06-25 08:22:19','$2b$12$KhLIQ3p5jxBliO3P5vO3A.ZHEVmc8d9ZBGBex8/yulS0YUcmP7Vwu'),(80,'rtrtrt','2023-06-25 08:22:42','$2b$12$pPsgY9GjL/YJxICxM5KrM.c4zjP1aJwlIPavgkPKbyjNlsOOInEjW'),(81,'ty','2023-06-25 08:23:26','$2b$12$/3L3NH703Hs.golvXmKvEOINy68ioAViF/hZbxcfW99ALDq1OIERm'),(82,'lj','2023-06-25 08:40:01','$2b$12$mWqbBi7bsWJhj4xq0iXMbO8VVPJzOnEmSJSkAPyqe5jAuGCu20r8q'),(83,'','2023-06-25 08:40:04','$2b$12$MxHDVxTsQZKqcy0zCCIXBu1XgSBcogERSpWENs8KxTzVzHEaXgaca'),(84,'yr','2023-06-25 08:42:51','$2b$12$bCq9zflTR2wezR7SYNhI.ep35Ua95lsLnIqfcJhT78FuDKDXXnJ7C'),(85,'po','2023-06-25 08:57:11','$2b$12$x6EXEnvCBznEewRque.l7udXTAavSi/gvyEVWAOnJQ5mhHaS8UBTW'),(86,'wqwq','2023-06-26 11:59:49','$2b$12$3zSm9exUPLnK5u5uEZM8dus4teq3Z0lTJ3oAEMuoCtWeKMqdML3Ge'),(87,'ppff','2023-06-26 12:54:17','$2b$12$s.WQzZrDu.Ad1VVrPCE97egj5ivmbDbhqThbAVXDwcxoHknkIFpCu'),(88,'ooo','2023-06-26 13:05:15','$2b$12$sjUoSvPGZN56FNxlGg0FeeGCe7j4Zwz7xrfltwp1R1yhz2J2mx/jO'),(89,'hhh','2023-06-26 13:09:26','$2b$12$eXYIZ2MRKbf5xuWvxXpBv.pZL6/xuFocpFjA1q39NcqFs/NbBWLKO'),(90,'pp','2023-06-26 13:15:33','$2b$12$sexdDyMtCa1WUkiU74bZXOPGP4SuBb3D6KDwFv9FD5KQDVmTezwxS'),(91,'pkpk','2023-06-26 13:53:19','$2b$12$sdxlotlRU9f5xqI/LyTE9ObPiX6y/8lGu6PlCulh.DcrmmVx3baRy'),(92,'w2w','2023-06-26 15:26:50','$2b$12$/vOV2E7vwCDTsCrXh1I4LOWyoUN.WpPlxT4vBev/AZEoDGrug4zu.'),(93,'pukon','2023-06-26 18:40:33','$2b$12$1SxJ5UmTKRLhTq6TR4BPheEbfzqtixSPb/rUTC5DLM5nUpqHkkq5S'),(94,'yy','2023-06-27 14:26:34','$2b$12$ZZX9zRuNE3X2Z6jhIvsmGu8ocQ1VP7mjGLj5bKHpTSBRzzcdvoNZ6'),(95,'dsa','2023-06-27 14:31:51','$2b$12$eGr4fB0WRM1a5GErikdofOWFJEIwCvjF51ROXLnfHbcwSe5kBltRm'),(96,'cat','2023-07-16 10:18:54','cat'),(97,'dog','2023-07-16 10:19:16',''),(98,'hjag','2023-07-16 10:46:29','$2b$12$BSpvW1rbL6NrBqbOzzmXV.ztXhiG2dOUtQNTU1VedeWIWFvMG2PLm'),(99,'plsh','2023-07-16 10:48:18','$2b$12$w.5wA7CuwluRBZmCteh0n.3FGUbHtXAK5zyPYFpwvYESI.FGs3Lwa'),(100,'Sefi','2023-07-16 15:02:40','googleUser'),(101,'pck','2023-07-18 13:49:48','$2b$12$a43ILuuXcZH.uUkkE5mPn.2Oi/81P7WLE4/0ET2v2LVappU0uf5da'),(102,'shu','2023-09-13 18:15:24','$2b$12$OS4zPsWk9z8I0QgP/v7nFOqrj9E7aj1/lTkG8TxEG4JwOh.YGwui2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-14 22:27:37
