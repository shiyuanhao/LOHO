-- MySQL dump 10.13  Distrib 8.0.12, for Linux (x86_64)
--
-- Host: localhost    Database: loho
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
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
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
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
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
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
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user',7,'add_user'),(20,'Can change user',7,'change_user'),(21,'Can delete user',7,'delete_user'),(22,'Can add wheel',8,'add_wheel'),(23,'Can change wheel',8,'change_wheel'),(24,'Can delete wheel',8,'delete_wheel'),(25,'Can add goods',9,'add_goods'),(26,'Can change goods',9,'change_goods'),(27,'Can delete goods',9,'delete_goods'),(28,'Can add cart',10,'add_cart'),(29,'Can change cart',10,'change_cart'),(30,'Can delete cart',10,'delete_cart'),(31,'Can add order',11,'add_order'),(32,'Can change order',11,'change_order'),(33,'Can delete order',11,'delete_order'),(34,'Can add order goods',12,'add_ordergoods'),(35,'Can change order goods',12,'change_ordergoods'),(36,'Can delete order goods',12,'delete_ordergoods');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
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
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'loho','cart'),(9,'loho','goods'),(11,'loho','order'),(12,'loho','ordergoods'),(7,'loho','user'),(8,'loho','wheel'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-10-29 09:14:39.865259'),(2,'auth','0001_initial','2018-10-29 09:14:41.201722'),(3,'admin','0001_initial','2018-10-29 09:14:41.616416'),(4,'admin','0002_logentry_remove_auto_add','2018-10-29 09:14:41.696007'),(5,'contenttypes','0002_remove_content_type_name','2018-10-29 09:14:41.849464'),(6,'auth','0002_alter_permission_name_max_length','2018-10-29 09:14:41.949832'),(7,'auth','0003_alter_user_email_max_length','2018-10-29 09:14:42.005473'),(8,'auth','0004_alter_user_username_opts','2018-10-29 09:14:42.048687'),(9,'auth','0005_alter_user_last_login_null','2018-10-29 09:14:42.136946'),(10,'auth','0006_require_contenttypes_0002','2018-10-29 09:14:42.142576'),(11,'auth','0007_alter_validators_add_error_messages','2018-10-29 09:14:42.164299'),(12,'auth','0008_alter_user_username_max_length','2018-10-29 09:14:42.329047'),(13,'sessions','0001_initial','2018-10-29 09:14:42.424834'),(14,'loho','0001_initial','2018-10-29 09:35:54.943200'),(15,'loho','0002_auto_20181029_0944','2018-10-29 09:44:37.993958'),(16,'loho','0003_wheel','2018-11-03 06:04:22.062001'),(17,'loho','0004_goods','2018-11-06 13:08:06.328603'),(18,'loho','0005_auto_20181107_0953','2018-11-07 09:53:19.468895'),(19,'loho','0006_cart','2018-11-08 13:04:32.147557'),(20,'loho','0007_order_ordergoods','2018-11-09 01:15:00.396502'),(21,'loho','0008_goods_yh_price','2018-11-09 05:13:06.995208'),(22,'loho','0009_cart_total','2018-11-10 00:54:26.332838'),(23,'loho','0010_auto_20181110_0313','2018-11-10 03:13:34.210474');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
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
INSERT INTO `django_session` VALUES ('0he0qbcwd7z9u25g39r1qsapi71ju4n3','NTAyOTJlODc1ZTFkN2E1NmU5ZWUzMTMwZjVjOWQ1OWEwNjhiOWIxNTp7InRva2VuIjoiOWUxMTExMDktNDY5Yi01YjA3LTg4OGItMmEyODk3MGRhOTBhIn0=','2018-11-24 06:04:21.748253'),('40bcpthcyec1y20dmewwv0mm6jq7watw','NTU5ZmZiZWRkZmI5ZjdmY2EyMGI0Yzk4NWE2MzY0NTVlYjZhYTM1Mzp7InRva2VuIjoiMTIwMmE5OGQtYTgwZS01YTkxLWIxOTQtY2JiYTRiZGRlN2M3In0=','2018-11-23 04:33:54.716492'),('69s6y0q5oukc88m2wn7r7qnajztgcacl','ZTlkMDhjMjA3YzY4OWI5M2Q1MzdmZmQ0ZTdjNTM4MWY5YjhmMTcxZTp7InRva2VuIjoiNmIxYzZiZTctZWUzYy01MDAzLTkwZWItZDdjN2MyMzBiNTc4In0=','2018-11-20 12:21:59.326990'),('f6e8a3xthnlrpwu6qfhrgqgdir1tm1py','M2FhY2ExMGRhNTVlNmZlNDA1Njk5MjQzMzc4ZDVhYjk2YWFiZDAxMDp7InRva2VuIjoiOWU3YmUwYjYtOGY2MS01NDZmLTk5OTUtNzVmY2IxMTEzYjAyIn0=','2018-11-23 11:37:12.279221'),('gi75nmzrf13pqhskf7l04522wkdtff2p','YWNiMDNkZTA5MWQ0MmQyODRkYjgxNTJjMGQzNmZlYjVmYTA3OGNjYzp7InZlcmlmeWNvZGUiOiJlY2VyIn0=','2018-11-15 08:02:33.370330'),('guihadvz91m3y4e74892vvqfi7t0nfnh','NDQyZGYwZjQzYzFmMmJiNzI0ODAzZWQ3Nzg4OTBiY2Y5ZDJjZTE3Mzp7InRva2VuIjoiODRmNzI5ZjAtZGE3MC01NjcxLWJjODItMDZjOTg2MDAzYTc1In0=','2018-11-23 03:25:43.492301'),('nfwucdrdedaq2mvlo39jjghwtp5yqmqx','YzRiN2RiMGM1ZjJiZDAyNGFmYjg4YTlkMTQwMTQ3N2M1YzQ5Zjk0Nzp7InRva2VuIjoiYzc5NDY1YjQtMTM3OC01ZDM2LWIzZTgtNGZhYWIyZmM1ODU3In0=','2018-11-23 03:40:03.905601'),('o3sztj5gyvy3n1dyc9p0onnwezkdu1hn','YzI5YTlmNmMwOWYwOWU3NjljYmU3MWIyMGVlMGNmZGVkYjA5YzEwODp7InZlcmlmeWNvZGUiOiJoMmppIn0=','2018-11-14 13:07:11.710849'),('tkeowudnej6kmnboebwlbkoic6xq2yu8','OTZlMGNiNDY4YzZlYzM3NDRkZGIxOTU0N2NiNzEyNTI5Zjk2MGJhNDp7InRva2VuIjoiODY0MDcxNzAtMGUwNS01YTRiLTllYmQtMjllYWRiMjU0Y2ZhIn0=','2018-11-23 03:45:02.625648'),('wlzkk8tzuj7r70pnmjqviq8ykcrtfmg0','YzFiYmEyYTIwYWJhYzNkMWE3NWMwZjE0MmQ2ZTAzZWYyOGY0OGZiMzp7InRva2VuIjoiYTk0NzE3NGMtYzgwNy01YTQyLWE1NTktODllYmRjZTliNWM5In0=','2018-11-24 01:23:31.292810'),('x14qyc4refsqey7dcru5an92a9c54ooy','YTg5ODE1ODBjMjMzZmM1MmNjZjNhZTg4MGEyYzkyYzYyODA5MzE3ZTp7InRva2VuIjoiZDQ0NzI5ZWItZjZmMS01MWFkLWFhMzMtOTI0NWU2MDE4ZTdkIn0=','2018-11-23 09:59:15.071533');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loho_cart`
--

DROP TABLE IF EXISTS `loho_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `loho_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loho_cart_goods_id_c8f39f62_fk_loho_goods_id` (`goods_id`),
  KEY `loho_cart_user_id_d9c68532_fk_loho_user_id` (`user_id`),
  CONSTRAINT `loho_cart_goods_id_c8f39f62_fk_loho_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `loho_goods` (`id`),
  CONSTRAINT `loho_cart_user_id_d9c68532_fk_loho_user_id` FOREIGN KEY (`user_id`) REFERENCES `loho_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loho_cart`
--

LOCK TABLES `loho_cart` WRITE;
/*!40000 ALTER TABLE `loho_cart` DISABLE KEYS */;
INSERT INTO `loho_cart` VALUES (64,2,1,4,20,1000),(65,2,1,3,20,600),(163,1,1,1,19,500),(164,2,1,4,19,1000);
/*!40000 ALTER TABLE `loho_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loho_goods`
--

DROP TABLE IF EXISTS `loho_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `loho_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bigImg` varchar(100) NOT NULL,
  `zhongImg1` varchar(100) NOT NULL,
  `zhongImg2` varchar(100) NOT NULL,
  `zhongImg3` varchar(100) NOT NULL,
  `price` varchar(10) NOT NULL,
  `yh_price` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loho_goods`
--

LOCK TABLES `loho_goods` WRITE;
/*!40000 ALTER TABLE `loho_goods` DISABLE KEYS */;
INSERT INTO `loho_goods` VALUES (1,'LOHO 光学镜架 金属 枪色金属+玳瑁色 复古款 GX9034-C2','img/1506507493610664.jpg','img/zhong1-1.jpg','img/zhong1-2.jpg','img/zhong1-3.jpg','599','500'),(2,'LOHO 光学镜架 金属 枪色金属+玳瑁色 时尚款 GX9034-C1','img/1506507516457263.jpg','img/zhong2-1.jpg','img/zhong2-2.jpg','img/zhong2-3.jpg','399','300'),(3,'LOHO 太阳镜 金属 碳黑色 时尚款 LH8011-C1','img/1506507510124942.jpg','img/zhong3-1.jpg','img/zhong3-2.jpg','img/zhong3-3.jpg','399','300'),(4,'LOHO 太阳镜 金属 黑蓝花色+金色 时尚款 LH06601-C26','img/1506507503746971.jpg','img/zhong4-1.jpg','img/zhong4-2.jpg','img/zhong4-3.jpg','599','500');
/*!40000 ALTER TABLE `loho_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loho_order`
--

DROP TABLE IF EXISTS `loho_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `loho_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime(6) NOT NULL,
  `status` int(11) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loho_order_user_id_acb6ee43_fk_loho_user_id` (`user_id`),
  CONSTRAINT `loho_order_user_id_acb6ee43_fk_loho_user_id` FOREIGN KEY (`user_id`) REFERENCES `loho_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loho_order`
--

LOCK TABLES `loho_order` WRITE;
/*!40000 ALTER TABLE `loho_order` DISABLE KEYS */;
INSERT INTO `loho_order` VALUES (1,'2018-11-09 11:55:03.265301',1,'154176450396834',19),(2,'2018-11-09 11:55:11.409545',1,'154176451158661',19),(3,'2018-11-09 11:55:14.458625',1,'154176451431375',19),(4,'2018-11-09 11:56:48.615929',1,'154176460893566',19),(5,'2018-11-09 11:56:59.325633',1,'154176461994350',19),(6,'2018-11-09 11:57:10.477431',1,'154176463025217',19),(7,'2018-11-09 11:57:11.854383',1,'154176463129618',19),(8,'2018-11-09 11:57:12.957159',1,'154176463245331',19),(9,'2018-11-09 12:10:54.929794',1,'154176545483270',19),(10,'2018-11-09 12:12:23.145218',1,'154176554358598',19),(11,'2018-11-09 12:28:09.472990',1,'154176648942820',19),(12,'2018-11-09 12:38:11.828685',1,'154176709169587',19),(13,'2018-11-09 13:01:29.352000',1,'154176848951864',19),(14,'2018-11-09 13:04:19.325996',1,'154176865976163',19),(15,'2018-11-09 13:04:33.729342',1,'154176867331170',19),(16,'2018-11-09 13:05:35.167336',1,'154176873522782',19),(17,'2018-11-09 13:05:36.851035',1,'154176873630981',19),(18,'2018-11-09 13:05:40.036015',1,'154176874099271',19),(19,'2018-11-09 13:05:41.972879',1,'154176874134997',19),(20,'2018-11-09 13:06:43.721138',1,'154176880396022',19),(21,'2018-11-09 13:06:47.623112',1,'154176880795911',19),(22,'2018-11-09 13:06:55.427618',1,'154176881593443',19),(23,'2018-11-10 00:31:10.623637',1,'154180987044058',19),(24,'2018-11-10 00:34:20.537697',1,'154181006028854',19),(25,'2018-11-10 00:34:33.264148',1,'154181007354648',19),(26,'2018-11-10 00:34:39.650568',1,'154181007992393',19),(27,'2018-11-10 00:34:49.671336',1,'154181008964156',19),(28,'2018-11-10 00:46:14.806020',1,'154181077436648',19),(29,'2018-11-10 00:46:55.076688',1,'154181081540316',19),(30,'2018-11-10 03:40:31.358121',1,'154182123178983',20),(31,'2018-11-10 07:06:07.223934',1,'154183356756796',19),(32,'2018-11-10 07:06:20.836496',1,'154183358094700',19),(33,'2018-11-10 10:06:46.602846',1,'154184440628007',19),(34,'2018-11-10 10:07:30.503889',1,'154184445023345',19),(35,'2018-11-11 07:10:55.005594',1,'154192025544863',19),(36,'2018-11-11 07:11:37.299826',1,'154192029717439',19),(37,'2018-11-11 07:31:30.732045',1,'154192149060032',19),(38,'2018-11-11 07:31:45.799652',1,'154192150596443',19),(39,'2018-11-11 07:31:52.368137',1,'154192151225809',19),(40,'2018-11-11 08:52:40.454535',1,'154192636068582',19),(41,'2018-11-11 08:52:48.427802',1,'154192636827671',19);
/*!40000 ALTER TABLE `loho_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loho_ordergoods`
--

DROP TABLE IF EXISTS `loho_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `loho_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loho_ordergoods_goods_id_a55b5f7e_fk_loho_goods_id` (`goods_id`),
  KEY `loho_ordergoods_order_id_2450294b_fk_loho_order_id` (`order_id`),
  CONSTRAINT `loho_ordergoods_goods_id_a55b5f7e_fk_loho_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `loho_goods` (`id`),
  CONSTRAINT `loho_ordergoods_order_id_2450294b_fk_loho_order_id` FOREIGN KEY (`order_id`) REFERENCES `loho_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loho_ordergoods`
--

LOCK TABLES `loho_ordergoods` WRITE;
/*!40000 ALTER TABLE `loho_ordergoods` DISABLE KEYS */;
INSERT INTO `loho_ordergoods` VALUES (1,1,3,1),(2,2,1,1),(3,3,1,9),(4,2,1,11),(5,2,3,11),(6,3,3,12),(7,3,4,12),(8,3,4,13),(9,3,2,13),(10,1,2,16),(11,1,4,16),(12,2,2,22),(13,1,1,23),(14,2,1,24),(15,1,2,27),(16,3,2,28),(17,1,2,29),(18,1,1,30),(19,1,4,30),(20,1,3,31),(21,1,1,31),(22,1,2,31),(23,2,4,34),(24,3,1,34),(25,1,1,35),(26,1,2,35),(27,2,3,35),(28,1,3,36),(29,2,4,36),(30,5,1,37),(31,2,3,38),(32,1,4,39),(33,6,1,41),(34,1,2,41);
/*!40000 ALTER TABLE `loho_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loho_user`
--

DROP TABLE IF EXISTS `loho_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `loho_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(20) NOT NULL,
  `password` varchar(256) NOT NULL,
  `invitation` varchar(256) NOT NULL,
  `token` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loho_user_tel_3b6c4429_uniq` (`tel`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loho_user`
--

LOCK TABLES `loho_user` WRITE;
/*!40000 ALTER TABLE `loho_user` DISABLE KEYS */;
INSERT INTO `loho_user` VALUES (19,'13800138000','bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a','loho1314','9e111109-469b-5b07-888b-2a28970da90a'),(20,'15826952400','bcb15f821479b4d5772bd0ca866c00ad5f926e3580720659cc80d39c9d09802a','loho1314','bdb62cd1-6950-587b-affb-3a50db4d4f8b'),(21,'13600000000','91b4d142823f7d20c5f08df69122de43f35f057a988d9619f6d3138485c9a203','loho1314','a947174c-c807-5a42-a559-89ebdce9b5c9');
/*!40000 ALTER TABLE `loho_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loho_wheel`
--

DROP TABLE IF EXISTS `loho_wheel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
CREATE TABLE `loho_wheel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loho_wheel`
--

LOCK TABLES `loho_wheel` WRITE;
/*!40000 ALTER TABLE `loho_wheel` DISABLE KEYS */;
INSERT INTO `loho_wheel` VALUES (1,'img/20170916163153_91818.jpg'),(2,'img/20170911185441_83175.jpg'),(3,'img/20170818150250_63464.jpg'),(4,'img/20170915164204_22747.jpg');
/*!40000 ALTER TABLE `loho_wheel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-11 18:17:34
