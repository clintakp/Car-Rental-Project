-- MySQL dump 10.13  Distrib 9.0.1, for Win64 (x86_64)
--
-- Host: localhost    Database: bularentalswebsite
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add vehicles',7,'add_vehicles'),(26,'Can change vehicles',7,'change_vehicles'),(27,'Can delete vehicles',7,'delete_vehicles'),(28,'Can view vehicles',7,'view_vehicles'),(29,'Can add contact_us',8,'add_contact_us'),(30,'Can change contact_us',8,'change_contact_us'),(31,'Can delete contact_us',8,'delete_contact_us'),(32,'Can view contact_us',8,'view_contact_us'),(33,'Can add contact',9,'add_contact'),(34,'Can change contact',9,'change_contact'),(35,'Can delete contact',9,'delete_contact'),(36,'Can view contact',9,'view_contact');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$jwtZptBzbgbskLc6nkEE06$d2Z2DmY7WDk4qVaSBAPEBcHK9O6+8t8pJsWCXP023xA=','2024-10-11 03:34:24.586998',1,'Group9','','','group9@uspisgroup9.com',1,1,'2024-09-19 22:42:59.681112'),(50,'pbkdf2_sha256$870000$zsNlhLnfM6SchXuCJhp2ZX$TOk4/+CBnLjDcOrYZdhivBDWgsaf9u/Pm8oSJt2ZSxQ=','2024-10-11 03:34:59.460603',0,'clintonakp1','Clinton','Akpometoba','s11199840@student.usp.ac.fj',0,1,'2024-10-11 03:33:23.793938');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bularentals_contact`
--

DROP TABLE IF EXISTS `bularentals_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bularentals_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `question` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bularentals_contact`
--

LOCK TABLES `bularentals_contact` WRITE;
/*!40000 ALTER TABLE `bularentals_contact` DISABLE KEYS */;
INSERT INTO `bularentals_contact` VALUES (5,'Clinton','S11199840@student.usp.ac.fj','2103122','What\'s up?'),(11,'Nathan','Nathanchan@yahoo.com','9312012','This site is looking good so far'),(12,'Clinton Eroh','coakpometoba@gmail.com','9032321','Hi'),(13,'Clinton Akpometoba','clintas1akpometoba@gmail.com','7319020','Hi, how are you??');
/*!40000 ALTER TABLE `bularentals_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bularentals_contact_us`
--

DROP TABLE IF EXISTS `bularentals_contact_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bularentals_contact_us` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `Feedback` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bularentals_contact_us`
--

LOCK TABLES `bularentals_contact_us` WRITE;
/*!40000 ALTER TABLE `bularentals_contact_us` DISABLE KEYS */;
/*!40000 ALTER TABLE `bularentals_contact_us` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (22,'2024-10-05 06:54:06.790014','18','aldoae',3,'',4,1),(23,'2024-10-05 06:54:06.791015','14','Clintakp',3,'',4,1),(24,'2024-10-05 06:54:06.791015','15','Clointakp',3,'',4,1),(25,'2024-10-05 06:54:06.791015','16','lara133',3,'',4,1),(26,'2024-10-05 06:54:06.791015','17','lorraineratudina123',3,'',4,1),(27,'2024-10-10 21:11:27.632728','22','aodoap',3,'',4,1),(28,'2024-10-10 21:11:27.632728','19','Clintakp',3,'',4,1),(29,'2024-10-10 21:11:27.632728','28','Clintonakp01',3,'',4,1),(30,'2024-10-10 21:11:27.632728','26','Clintonakp1',3,'',4,1),(31,'2024-10-10 21:11:27.632728','27','cltinf123',3,'',4,1),(32,'2024-10-10 21:11:27.632728','24','cnakp232',3,'',4,1),(33,'2024-10-10 21:11:27.632728','23','coakp',3,'',4,1),(34,'2024-10-10 21:11:27.632728','25','Iank',3,'',4,1),(35,'2024-10-10 21:11:27.632728','20','lorraineratudina123',3,'',4,1),(36,'2024-10-10 21:11:27.632728','21','lorratudina123',3,'',4,1),(37,'2024-10-10 22:08:29.188547','29','Clintakp',3,'',4,1),(38,'2024-10-10 22:17:32.930912','30','Clintonakp01',3,'',4,1),(39,'2024-10-10 22:22:51.626970','31','Clintonakp01',3,'',4,1),(40,'2024-10-10 22:22:51.626970','32','Clintonakp02',3,'',4,1),(41,'2024-10-10 22:29:07.857636','33','Clintonakp01',3,'',4,1),(42,'2024-10-10 22:36:48.132444','34','Clintonakp01',3,'',4,1),(43,'2024-10-10 22:40:42.584110','35','Clintonakp01',3,'',4,1),(44,'2024-10-10 22:45:37.455996','36','Clintonakp01',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),(45,'2024-10-10 22:47:19.624418','36','Clintonakp01',3,'',4,1),(46,'2024-10-11 00:13:31.382579','37','Clintonakp01',3,'',4,1),(47,'2024-10-11 00:21:19.902042','38','Clintonakp01',3,'',4,1),(48,'2024-10-11 00:24:18.651160','39','Clintonakp01',3,'',4,1),(49,'2024-10-11 00:27:18.075988','40','Clintonakp01',3,'',4,1),(50,'2024-10-11 00:39:04.134864','41','Clintonakp01',3,'',4,1),(51,'2024-10-11 00:49:01.281641','42','Clintonakp01',3,'',4,1),(52,'2024-10-11 01:07:43.432840','43','Clintonakp01',3,'',4,1),(53,'2024-10-11 01:10:07.779071','44','Clintonakp01',3,'',4,1),(54,'2024-10-11 01:16:45.322598','45','Clintonakp01',3,'',4,1),(55,'2024-10-11 03:14:14.772724','47','clinakp1',3,'',4,1),(56,'2024-10-11 03:16:43.671481','48','clinakp1',3,'',4,1),(57,'2024-10-11 03:32:08.202955','46','Clintonakp01',3,'',4,1),(58,'2024-10-11 03:32:15.268184','49','clintonakp1',3,'',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'Bularentals','contact'),(8,'Bularentals','contact_us'),(7,'Bularentals','vehicles'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-27 09:21:32.849342'),(2,'auth','0001_initial','2024-08-27 09:21:33.284287'),(3,'admin','0001_initial','2024-08-27 09:21:33.388176'),(4,'admin','0002_logentry_remove_auto_add','2024-08-27 09:21:33.393480'),(5,'admin','0003_logentry_add_action_flag_choices','2024-08-27 09:21:33.398513'),(6,'contenttypes','0002_remove_content_type_name','2024-08-27 09:21:33.464380'),(7,'auth','0002_alter_permission_name_max_length','2024-08-27 09:21:33.524210'),(8,'auth','0003_alter_user_email_max_length','2024-08-27 09:21:33.542183'),(9,'auth','0004_alter_user_username_opts','2024-08-27 09:21:33.547734'),(10,'auth','0005_alter_user_last_login_null','2024-08-27 09:21:33.591463'),(11,'auth','0006_require_contenttypes_0002','2024-08-27 09:21:33.593485'),(12,'auth','0007_alter_validators_add_error_messages','2024-08-27 09:21:33.598608'),(13,'auth','0008_alter_user_username_max_length','2024-08-27 09:21:33.650459'),(14,'auth','0009_alter_user_last_name_max_length','2024-08-27 09:21:33.703263'),(15,'auth','0010_alter_group_name_max_length','2024-08-27 09:21:33.719651'),(16,'auth','0011_update_proxy_permissions','2024-08-27 09:21:33.726523'),(17,'auth','0012_alter_user_first_name_max_length','2024-08-27 09:21:33.779926'),(18,'sessions','0001_initial','2024-08-27 09:21:33.803436'),(19,'Bularentals','0001_initial','2024-08-31 10:06:04.920887'),(20,'Bularentals','0002_contact_us','2024-09-20 00:42:05.601272'),(21,'Bularentals','0003_contact_us_feedback_alter_contact_us_phone','2024-09-20 01:37:33.866254'),(22,'Bularentals','0002_contact','2024-09-24 03:21:49.344854');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('42wctokysv7d2klejr8ti4g35dfyjsdd','.eJxVjMsOwiAQRf-FtSEDQ0tx6d5vIDM8pGogKe3K-O_apAvd3nPOfQlP21r81tPi5yjOYgBx-h2ZwiPVncQ71VuTodV1mVnuijxol9cW0_NyuH8HhXr51mA12EyBwaJSBFlHoyY3gka0jtNokKMCwwQqO0CGFIdEhDRh0FaJ9wfmxzdy:1sz6Qd:RLgDnac4DU49Yfg1DKF7XJ-lY0gavyY1GGEMbkbb_iE','2024-10-25 03:34:59.460603');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license_plate` varchar(20) NOT NULL,
  `status` enum('available','rented','maintenance') DEFAULT 'available',
  `daily_rate` decimal(10,2) DEFAULT NULL,
  `seating_capacity` int DEFAULT NULL,
  `description` text,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `size` enum('Small','Medium','Large') NOT NULL,
  `classes` enum('Economy','Premium','Hybrid','Luxury') NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `license_plate` (`license_plate`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,'XYZ5678','rented',75.00,4,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Honda','Civic','Small','Economy','images/honda_civic.JPG'),(2,'LMN9101','maintenance',60.00,7,'When you need a balance of performance, comfort, and space, premium cars offer the perfect solution. These vehicles are ideal for business professionals or vacationers who appreciate extra power and upgraded amenities. With premium cars, you can enjoy a smooth ride on both highways and city roads while benefiting from superior safety features and a spacious interior for passengers and luggage.','Ford','Explorer','Large','Premium','Images/ford_explorer.JPG'),(3,'DEF2345','available',55.00,5,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Chevrolet','Malibu','Small','Economy','images/Chevrolet_Malibu.JPG'),(4,'ABC123','available',45.99,5,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Toyota','Corolla','Small','Economy','images/toyota_corolla.JPG'),(5,'XYZ987','rented',65.50,7,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Honda','CR-V','Small','Economy','images/honda_crv.JPG'),(6,'LMN456','available',55.00,5,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Ford','Escape','Small','Economy','images/ford_escape.JPG'),(7,'PQR678','maintenance',80.75,5,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Chevrolet','Equinox','Small','Economy','images/chevrolet_equinox.JPG'),(8,'STU123','rented',100.00,8,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Chrysler','Pacifica','Small','Economy','images/chrysler_pacifica.JPG'),(9,'JKL789','available',40.25,5,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Nissan','Sentra','Small','Economy','images/nissan_sentra.JPG'),(10,'DEF456','rented',50.00,4,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Hyundai','Kona','Small','Economy','images/hyundai_kona.JPG'),(11,'VWX345','maintenance',90.50,5,'When you need a balance of performance, comfort, and space, premium cars offer the perfect solution. These vehicles are ideal for business professionals or vacationers who appreciate extra power and upgraded amenities. With premium cars, you can enjoy a smooth ride on both highways and city roads while benefiting from superior safety features and a spacious interior for passengers and luggage.','Kia','Sportage','Large','Premium','images/kia_sportage.JPG'),(12,'GHI789','available',75.00,7,'When you need a balance of performance, comfort, and space, premium cars offer the perfect solution. These vehicles are ideal for business professionals or vacationers who appreciate extra power and upgraded amenities. With premium cars, you can enjoy a smooth ride on both highways and city roads while benefiting from superior safety features and a spacious interior for passengers and luggage.','Toyota','Highlander','Large','Premium','images/toyota_highlander.JPG'),(13,'NOP234','rented',110.00,5,'When you need a balance of performance, comfort, and space, premium cars offer the perfect solution. These vehicles are ideal for business professionals or vacationers who appreciate extra power and upgraded amenities. With premium cars, you can enjoy a smooth ride on both highways and city roads while benefiting from superior safety features and a spacious interior for passengers and luggage.','Jeep','Cherokee','Large','Premium','images/jeep_cherokee.JPG'),(14,'XAZ123','available',350.00,5,'For those seeking elegance and superior comfort, luxury cars provide an unmatched driving experience. Ideal for business executives or travelers who value style and sophistication, these vehicles come equipped with top-tier features and plush interiors. Whether you?re arriving at an upscale event or want to enjoy a smooth, quiet ride during long-distance journeys, a luxury car rental ensures you travel in ultimate comfort and class.','Mercedes-Benz','S-Class','Large','Luxury','images/mercedessclass.webp'),(15,'RBX723','available',50.00,5,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Ford','Focus','Small','Economy','images/Ford focus.webp'),(16,'RXB753','available',82.00,5,'When you need a balance of performance, comfort, and space, premium cars offer the perfect solution. These vehicles are ideal for business professionals or vacationers who appreciate extra power and upgraded amenities. With premium cars, you can enjoy a smooth ride on both highways and city roads while benefiting from superior safety features and a spacious interior for passengers and luggage.','Lexus','LS460','Large','Premium','images/Lexus LS460.webp'),(17,'MRB333','available',250.00,5,'For those seeking elegance and superior comfort, luxury cars provide an unmatched driving experience. Ideal for business executives or travelers who value style and sophistication, these vehicles come equipped with top-tier features and plush interiors. Whether you?re arriving at an upscale event or want to enjoy a smooth, quiet ride during long-distance journeys, a luxury car rental ensures you travel in ultimate comfort and class.','Maserati','Ghibli','Large','Luxury','images/maserati ghibli.webp'),(18,'DSA203','available',150.00,5,'When you need a balance of performance, comfort, and space, premium cars offer the perfect solution. These vehicles are ideal for business professionals or vacationers who appreciate extra power and upgraded amenities. With premium cars, you can enjoy a smooth ride on both highways and city roads while benefiting from superior safety features and a spacious interior for passengers and luggage.','Mazda','Wagon','Large','Premium','images/Mazda6 Wagon.webp'),(19,'SSA243','available',80.00,5,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Mazda','Axela','Small','Economy','images/Mazda Axela.webp'),(20,'FBM433','available',200.00,5,'For eco-conscious drivers who don?t want to compromise on performance, hybrid cars offer the best of both worlds. These vehicles combine fuel efficiency with modern technology, making them perfect for both city commutes and longer drives. Whether you?re looking to reduce your carbon footprint or just want to save on fuel, hybrid car rentals give you the flexibility to drive sustainably without sacrificing comfort or space.','Tesla','X','Medium','Hybrid','images/Tesla ModelX.webp'),(21,'RGM583','available',250.00,5,'For eco-conscious drivers who don?t want to compromise on performance, hybrid cars offer the best of both worlds. These vehicles combine fuel efficiency with modern technology, making them perfect for both city commutes and longer drives. Whether you?re looking to reduce your carbon footprint or just want to save on fuel, hybrid car rentals give you the flexibility to drive sustainably without sacrificing comfort or space.','BMW','225xe','Large','Hybrid','images/BMW 2 SERIES 225xe.webp'),(22,'RPG891','available',350.00,5,'For those seeking elegance and superior comfort, luxury cars provide an unmatched driving experience. Ideal for business executives or travelers who value style and sophistication, these vehicles come equipped with top-tier features and plush interiors. Whether you?re arriving at an upscale event or want to enjoy a smooth, quiet ride during long-distance journeys, a luxury car rental ensures you travel in ultimate comfort and class.','BMW','7series','Large','Luxury','images/BMW 7series.webp'),(23,'FGA721','available',70.00,5,'For eco-conscious drivers who don?t want to compromise on performance, hybrid cars offer the best of both worlds. These vehicles combine fuel efficiency with modern technology, making them perfect for both city commutes and longer drives. Whether you?re looking to reduce your carbon footprint or just want to save on fuel, hybrid car rentals give you the flexibility to drive sustainably without sacrificing comfort or space.','Toyota','PriusV','Small','Hybrid','images/Toyota PriusV.webp'),(24,'FRZ213','available',150.00,5,'When you need a balance of performance, comfort, and space, premium cars offer the perfect solution. These vehicles are ideal for business professionals or vacationers who appreciate extra power and upgraded amenities. With premium cars, you can enjoy a smooth ride on both highways and city roads while benefiting from superior safety features and a spacious interior for passengers and luggage.','Volkswagen','Passant','Large','Premium','images/Volkswagen Passant.webp'),(25,'ROX943','available',40.00,5,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Volkswagen','Golf','Small','Economy','images/Volkswagen GolfR.webp'),(26,'IUA528','available',35.00,5,'Rent an economy car for navigating busy city streets, where parking is limited and traffic is heavy. These vehicles are known for their excellent fuel economy, making them ideal for urban driving. While compact, economy cars provide ample space for families and maintain the fuel efficiency of smaller cars. Whether you?re headed to a family gathering or need a reliable ride for a business trip from the airport, economy car rentals offer great value.','Toyota','Aygo','Small','Economy','images/Toyota Aygo.webp');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-11 19:12:44
