
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES
('voice_bank_cache_info@lote.bg|127.0.0.1','i:1;',1753941581),
('voice_bank_cache_info@lote.bg|127.0.0.1:timer','i:1753941581;',1753941581);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `voice_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `favorites_user_id_voice_id_unique` (`user_id`,`voice_id`),
  KEY `favorites_voice_id_foreign` (`voice_id`),
  CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorites_voice_id_foreign` FOREIGN KEY (`voice_id`) REFERENCES `voices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES
(10,9,6,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(11,9,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(26,18,8,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(27,18,12,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(86,78,6,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(92,80,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(111,90,6,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(112,90,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(121,92,6,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(122,92,8,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(137,98,6,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(138,98,8,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(148,102,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(149,102,11,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(156,104,5,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(164,106,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(181,112,16,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(186,114,16,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(190,116,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(203,120,6,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(204,122,16,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(221,132,4,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(222,132,11,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(223,132,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(226,134,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(236,136,12,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(254,142,11,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(261,144,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(279,150,17,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(290,156,7,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(291,156,17,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(296,158,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(310,162,2,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(311,162,5,'2025-07-31 01:30:13','2025-07-31 01:30:13');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `feature_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `feature_id` bigint(20) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  `display_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`display_value`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `feature_values_feature_id_value_unique` (`feature_id`,`value`),
  CONSTRAINT `feature_values_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `feature_values` WRITE;
/*!40000 ALTER TABLE `feature_values` DISABLE KEYS */;
INSERT INTO `feature_values` VALUES
(1,1,'high','{\"en\":\"High\",\"bg\":\"Висок\"}','{\"en\":\"A high voice timbre\",\"bg\":\"Висок тембър на гласа\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(2,1,'medium','{\"en\":\"Medium\",\"bg\":\"Среден\"}','{\"en\":\"A medium voice timbre\",\"bg\":\"Среден тембър на гласа\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(3,1,'low','{\"en\":\"Low\",\"bg\":\"Нисък\"}','{\"en\":\"A low voice timbre\",\"bg\":\"Нисък тембър на гласа\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(4,1,'raspy','{\"en\":\"Raspy\",\"bg\":\"Дрезгав\"}','{\"en\":\"A raspy voice timbre\",\"bg\":\"Дрезгав тембър на гласа\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(5,1,'smooth','{\"en\":\"Smooth\",\"bg\":\"Гладък\"}','{\"en\":\"A smooth voice timbre\",\"bg\":\"Гладък тембър на гласа\"}',5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(6,1,'warm','{\"en\":\"Warm\",\"bg\":\"Топъл\"}','{\"en\":\"A warm voice timbre\",\"bg\":\"Топъл тембър на гласа\"}',6,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(7,1,'bright','{\"en\":\"Bright\",\"bg\":\"Ярък\"}','{\"en\":\"A bright voice timbre\",\"bg\":\"Ярък тембър на гласа\"}',7,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(8,2,'male','{\"en\":\"Male\",\"bg\":\"Мъжки\"}','{\"en\":\"A male voice\",\"bg\":\"Мъжки глас\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(9,2,'female','{\"en\":\"Female\",\"bg\":\"Женски\"}','{\"en\":\"A female voice\",\"bg\":\"Женски глас\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(10,2,'neutral','{\"en\":\"Neutral\",\"bg\":\"Неутрален\"}','{\"en\":\"A neutral voice\",\"bg\":\"Неутрален глас\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(11,3,'child','{\"en\":\"Child\",\"bg\":\"Дете\"}','{\"en\":\"A voice of a child\",\"bg\":\"Глас на Дете\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(12,3,'teen','{\"en\":\"Teen\",\"bg\":\"Тийнейджър\"}','{\"en\":\"A voice of a teen\",\"bg\":\"Глас на Тийнейджър\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(13,3,'young_adult','{\"en\":\"Young Adult\",\"bg\":\"Млад възрастен\"}','{\"en\":\"A voice of a young adult\",\"bg\":\"Глас на Млад възрастен\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(14,3,'adult','{\"en\":\"Adult\",\"bg\":\"Възрастен\"}','{\"en\":\"A voice of a adult\",\"bg\":\"Глас на Възрастен\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(15,3,'senior','{\"en\":\"Senior\",\"bg\":\"Възрастен човек\"}','{\"en\":\"A voice of a senior\",\"bg\":\"Глас на Възрастен човек\"}',5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(16,4,'american','{\"en\":\"American\",\"bg\":\"Американски\"}','{\"en\":\"A voice with american accent\",\"bg\":\"Глас с Американски акцент\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(17,4,'british','{\"en\":\"British\",\"bg\":\"Британски\"}','{\"en\":\"A voice with british accent\",\"bg\":\"Глас с Британски акцент\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(18,4,'australian','{\"en\":\"Australian\",\"bg\":\"Австралийски\"}','{\"en\":\"A voice with australian accent\",\"bg\":\"Глас с Австралийски акцент\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(19,4,'indian','{\"en\":\"Indian\",\"bg\":\"Индийски\"}','{\"en\":\"A voice with indian accent\",\"bg\":\"Глас с Индийски акцент\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(20,4,'spanish','{\"en\":\"Spanish\",\"bg\":\"Испански\"}','{\"en\":\"A voice with spanish accent\",\"bg\":\"Глас с Испански акцент\"}',5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(21,4,'french','{\"en\":\"French\",\"bg\":\"Френски\"}','{\"en\":\"A voice with french accent\",\"bg\":\"Глас с Френски акцент\"}',6,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(22,4,'german','{\"en\":\"German\",\"bg\":\"Немски\"}','{\"en\":\"A voice with german accent\",\"bg\":\"Глас с Немски акцент\"}',7,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(23,4,'italian','{\"en\":\"Italian\",\"bg\":\"Италиански\"}','{\"en\":\"A voice with italian accent\",\"bg\":\"Глас с Италиански акцент\"}',8,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(24,4,'russian','{\"en\":\"Russian\",\"bg\":\"Руски\"}','{\"en\":\"A voice with russian accent\",\"bg\":\"Глас с Руски акцент\"}',9,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(25,5,'conversational','{\"en\":\"Conversational\",\"bg\":\"Разговорен\"}','{\"en\":\"A conversational voice style\",\"bg\":\"Разговорен стил на гласа\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(26,5,'professional','{\"en\":\"Professional\",\"bg\":\"Професионален\"}','{\"en\":\"A professional voice style\",\"bg\":\"Професионален стил на гласа\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(27,5,'dramatic','{\"en\":\"Dramatic\",\"bg\":\"Драматичен\"}','{\"en\":\"A dramatic voice style\",\"bg\":\"Драматичен стил на гласа\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(28,5,'cheerful','{\"en\":\"Cheerful\",\"bg\":\"Весел\"}','{\"en\":\"A cheerful voice style\",\"bg\":\"Весел стил на гласа\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(29,5,'serious','{\"en\":\"Serious\",\"bg\":\"Сериозен\"}','{\"en\":\"A serious voice style\",\"bg\":\"Сериозен стил на гласа\"}',5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(30,5,'energetic','{\"en\":\"Energetic\",\"bg\":\"Енергичен\"}','{\"en\":\"A energetic voice style\",\"bg\":\"Енергичен стил на гласа\"}',6,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(31,5,'calm','{\"en\":\"Calm\",\"bg\":\"Спокоен\"}','{\"en\":\"A calm voice style\",\"bg\":\"Спокоен стил на гласа\"}',7,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(32,6,'english','{\"en\":\"English\",\"bg\":\"Английски\"}','{\"en\":\"Can speak English\",\"bg\":\"Може да говори Английски\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(33,6,'russian','{\"en\":\"Russian\",\"bg\":\"Руски\"}','{\"en\":\"Can speak Russian\",\"bg\":\"Може да говори Руски\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(34,6,'bulgarian','{\"en\":\"Bulgarian\",\"bg\":\"Български\"}','{\"en\":\"Can speak Bulgarian\",\"bg\":\"Може да говори Български\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(35,6,'spanish','{\"en\":\"Spanish\",\"bg\":\"Испански\"}','{\"en\":\"Can speak Spanish\",\"bg\":\"Може да говори Испански\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(36,6,'french','{\"en\":\"French\",\"bg\":\"Френски\"}','{\"en\":\"Can speak French\",\"bg\":\"Може да говори Френски\"}',5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(37,6,'german','{\"en\":\"German\",\"bg\":\"Немски\"}','{\"en\":\"Can speak German\",\"bg\":\"Може да говори Немски\"}',6,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(38,6,'italian','{\"en\":\"Italian\",\"bg\":\"Италиански\"}','{\"en\":\"Can speak Italian\",\"bg\":\"Може да говори Италиански\"}',7,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(39,6,'portuguese','{\"en\":\"Portuguese\",\"bg\":\"Португалски\"}','{\"en\":\"Can speak Portuguese\",\"bg\":\"Може да говори Португалски\"}',8,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(40,6,'chinese','{\"en\":\"Chinese\",\"bg\":\"Китайски\"}','{\"en\":\"Can speak Chinese\",\"bg\":\"Може да говори Китайски\"}',9,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(41,6,'japanese','{\"en\":\"Japanese\",\"bg\":\"Японски\"}','{\"en\":\"Can speak Japanese\",\"bg\":\"Може да говори Японски\"}',10,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(42,6,'korean','{\"en\":\"Korean\",\"bg\":\"Корейски\"}','{\"en\":\"Can speak Korean\",\"bg\":\"Може да говори Корейски\"}',11,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(43,7,'economy','{\"en\":\"Economy\",\"bg\":\"Икономичен\"}','{\"en\":\"Economy price range\",\"bg\":\"Икономичен ценови диапазон\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(44,7,'standard','{\"en\":\"Standard\",\"bg\":\"Стандартен\"}','{\"en\":\"Standard price range\",\"bg\":\"Стандартен ценови диапазон\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(45,7,'premium','{\"en\":\"Premium\",\"bg\":\"Премиум\"}','{\"en\":\"Premium price range\",\"bg\":\"Премиум ценови диапазон\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(46,7,'professional','{\"en\":\"Professional\",\"bg\":\"Професионален\"}','{\"en\":\"Professional price range\",\"bg\":\"Професионален ценови диапазон\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(47,7,'enterprise','{\"en\":\"Enterprise\",\"bg\":\"Корпоративен\"}','{\"en\":\"Enterprise price range\",\"bg\":\"Корпоративен ценови диапазон\"}',5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(48,8,'commercial','{\"en\":\"Commercial\",\"bg\":\"Реклама\"}','{\"en\":\"Voice for commercial\",\"bg\":\"Глас за Реклама\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(49,8,'narration','{\"en\":\"Narration\",\"bg\":\"Разказ\"}','{\"en\":\"Voice for narration\",\"bg\":\"Глас за Разказ\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(50,8,'audiobook','{\"en\":\"Audiobook\",\"bg\":\"Аудиокнига\"}','{\"en\":\"Voice for audiobook\",\"bg\":\"Глас за Аудиокнига\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(51,8,'animation','{\"en\":\"Animation\",\"bg\":\"Анимация\"}','{\"en\":\"Voice for animation\",\"bg\":\"Глас за Анимация\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(52,8,'video-game','{\"en\":\"Video Game\",\"bg\":\"Видео игра\"}','{\"en\":\"Voice for video game\",\"bg\":\"Глас за Видео игра\"}',5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(53,8,'documentary','{\"en\":\"Documentary\",\"bg\":\"Документален\"}','{\"en\":\"Voice for documentary\",\"bg\":\"Глас за Документален\"}',6,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(54,8,'e-learning','{\"en\":\"E-Learning\",\"bg\":\"Електронно обучение\"}','{\"en\":\"Voice for e-learning\",\"bg\":\"Глас за Електронно обучение\"}',7,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(55,8,'ivr','{\"en\":\"IVR/Phone System\",\"bg\":\"IVR/Телефонна система\"}','{\"en\":\"Voice for ivr/phone system\",\"bg\":\"Глас за IVR/Телефонна система\"}',8,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(56,8,'podcast','{\"en\":\"Podcast\",\"bg\":\"Подкаст\"}','{\"en\":\"Voice for podcast\",\"bg\":\"Глас за Подкаст\"}',9,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(57,8,'radio','{\"en\":\"Radio\",\"bg\":\"Радио\"}','{\"en\":\"Voice for radio\",\"bg\":\"Глас за Радио\"}',10,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(58,8,'tv','{\"en\":\"TV\",\"bg\":\"Телевизия\"}','{\"en\":\"Voice for tv\",\"bg\":\"Глас за Телевизия\"}',11,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(59,9,'24h','{\"en\":\"24 Hours\",\"bg\":\"24 часа\"}','{\"en\":\"Delivery within 24 hours\",\"bg\":\"Доставка в рамките на 24 часа\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(60,9,'48h','{\"en\":\"48 Hours\",\"bg\":\"48 часа\"}','{\"en\":\"Delivery within 48 hours\",\"bg\":\"Доставка в рамките на 48 часа\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(61,9,'3-5d','{\"en\":\"3-5 Days\",\"bg\":\"3-5 дни\"}','{\"en\":\"Delivery within 3-5 days\",\"bg\":\"Доставка в рамките на 3-5 дни\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(62,9,'1w','{\"en\":\"1 Week\",\"bg\":\"1 седмица\"}','{\"en\":\"Delivery within 1 week\",\"bg\":\"Доставка в рамките на 1 седмица\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(63,9,'custom','{\"en\":\"Custom\",\"bg\":\"По договаряне\"}','{\"en\":\"Delivery within custom\",\"bg\":\"Доставка в рамките на По договаряне\"}',5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(64,10,'5-star','{\"en\":\"5 Stars\",\"bg\":\"5 звезди\"}','{\"en\":\"Rated 5 stars\",\"bg\":\"Оценен с 5 звезди\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(65,10,'4-star','{\"en\":\"4 Stars\",\"bg\":\"4 звезди\"}','{\"en\":\"Rated 4 stars\",\"bg\":\"Оценен с 4 звезди\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(66,10,'3-star','{\"en\":\"3 Stars\",\"bg\":\"3 звезди\"}','{\"en\":\"Rated 3 stars\",\"bg\":\"Оценен с 3 звезди\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(67,10,'2-star','{\"en\":\"2 Stars\",\"bg\":\"2 звезди\"}','{\"en\":\"Rated 2 stars\",\"bg\":\"Оценен с 2 звезди\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(68,10,'1-star','{\"en\":\"1 Star\",\"bg\":\"1 звезда\"}','{\"en\":\"Rated 1 star\",\"bg\":\"Оценен с 1 звезда\"}',5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(69,11,'beginner','{\"en\":\"Beginner\",\"bg\":\"Начинаещ\"}','{\"en\":\"Beginner voice actor\",\"bg\":\"Начинаещ гласов актьор\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(70,11,'intermediate','{\"en\":\"Intermediate\",\"bg\":\"Среден\"}','{\"en\":\"Intermediate voice actor\",\"bg\":\"Среден гласов актьор\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(71,11,'experienced','{\"en\":\"Experienced\",\"bg\":\"Опитен\"}','{\"en\":\"Experienced voice actor\",\"bg\":\"Опитен гласов актьор\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(72,11,'professional','{\"en\":\"Professional\",\"bg\":\"Професионален\"}','{\"en\":\"Professional voice actor\",\"bg\":\"Професионален гласов актьор\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(73,11,'expert','{\"en\":\"Expert\",\"bg\":\"Експерт\"}','{\"en\":\"Expert voice actor\",\"bg\":\"Експерт гласов актьор\"}',5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(74,12,'available','{\"en\":\"Available\",\"bg\":\"Наличен\"}','{\"en\":\"Voice actor is available\",\"bg\":\"Гласовият актьор е Наличен\"}',1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(75,12,'limited','{\"en\":\"Limited Availability\",\"bg\":\"Ограничена наличност\"}','{\"en\":\"Voice actor is limited availability\",\"bg\":\"Гласовият актьор е Ограничена наличност\"}',2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(76,12,'busy','{\"en\":\"Busy\",\"bg\":\"Зает\"}','{\"en\":\"Voice actor is busy\",\"bg\":\"Гласовият актьор е Зает\"}',3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(77,12,'on-vacation','{\"en\":\"On Vacation\",\"bg\":\"В отпуск\"}','{\"en\":\"Voice actor is on vacation\",\"bg\":\"Гласовият актьор е В отпуск\"}',4,'2025-07-31 01:30:11','2025-07-31 01:30:11');
/*!40000 ALTER TABLE `feature_values` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `display_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`display_name`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `is_filterable` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `features_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES
(1,'timbre','{\"en\":\"Timbre\",\"bg\":\"Тембър\"}','{\"en\":\"The quality of the voice\",\"bg\":\"Качеството на гласа\"}',1,1,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(2,'gender','{\"en\":\"Gender\",\"bg\":\"Пол\"}','{\"en\":\"The gender of the voice\",\"bg\":\"Полът на гласа\"}',1,2,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(3,'age','{\"en\":\"Age\",\"bg\":\"Възраст\"}','{\"en\":\"The age range of the voice\",\"bg\":\"Възрастовият диапазон на гласа\"}',1,3,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(4,'accent','{\"en\":\"Accent\",\"bg\":\"Акцент\"}','{\"en\":\"The accent of the voice\",\"bg\":\"Акцентът на гласа\"}',1,4,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(5,'style','{\"en\":\"Style\",\"bg\":\"Стил\"}','{\"en\":\"The style of the voice\",\"bg\":\"Стилът на гласа\"}',1,5,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(6,'language','{\"en\":\"Language\",\"bg\":\"Език\"}','{\"en\":\"The language the voice actor can speak\",\"bg\":\"Езикът, на който гласовият актьор може да говори\"}',1,6,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(7,'price-range','{\"en\":\"Price Range\",\"bg\":\"Ценови диапазон\"}','{\"en\":\"The price range for the voice actor\",\"bg\":\"Ценовият диапазон за гласовия актьор\"}',1,7,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(8,'category','{\"en\":\"Category\",\"bg\":\"Категория\"}','{\"en\":\"The category of voice work\",\"bg\":\"Категорията на гласовата работа\"}',1,8,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(9,'delivery-time','{\"en\":\"Delivery Time\",\"bg\":\"Време за доставка\"}','{\"en\":\"The estimated delivery time\",\"bg\":\"Очакваното време за доставка\"}',1,9,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(10,'rating','{\"en\":\"Rating\",\"bg\":\"Рейтинг\"}','{\"en\":\"The rating of the voice actor\",\"bg\":\"Рейтингът на гласовия актьор\"}',1,10,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(11,'experience-level','{\"en\":\"Experience Level\",\"bg\":\"Ниво на опит\"}','{\"en\":\"The experience level of the voice actor\",\"bg\":\"Нивото на опит на гласовия актьор\"}',1,11,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(12,'availability','{\"en\":\"Availability\",\"bg\":\"Наличност\"}','{\"en\":\"The availability of the voice actor\",\"bg\":\"Наличността на гласовия актьор\"}',1,12,'2025-07-31 01:30:11','2025-07-31 01:30:11');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'0001_01_01_000000_create_users_table',1),
(2,'0001_01_01_000001_create_cache_table',1),
(3,'0001_01_01_000002_create_jobs_table',1),
(4,'2024_05_01_000000_add_role_to_users_table',1),
(5,'2024_05_01_000001_create_voices_table',1),
(6,'2024_05_01_000002_create_features_table',1),
(7,'2024_05_01_000003_create_feature_values_table',1),
(8,'2024_05_01_000004_create_voice_feature_values_table',1),
(9,'2024_07_29_000001_create_reviews_table',1),
(10,'2024_07_29_000002_create_favorites_table',1),
(11,'2024_07_29_000003_create_samples_table',1),
(12,'2024_07_29_000004_create_orders_table',1),
(13,'2024_07_29_000005_create_payments_table',1),
(14,'2025_07_28_052951_update_role_enum_in_users_table',1),
(15,'2025_08_26_110346_create_personal_access_tokens_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `voice_id` bigint(20) unsigned NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `status` enum('pending','accepted','in_progress','completed','cancelled','refunded') NOT NULL DEFAULT 'pending',
  `deadline` date DEFAULT NULL,
  `word_count` int(11) DEFAULT NULL,
  `script_url` varchar(255) DEFAULT NULL,
  `result_url` varchar(255) DEFAULT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`notes`)),
  `artist_notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`artist_notes`)),
  `accepted_at` timestamp NULL DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_voice_id_foreign` (`voice_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `orders_voice_id_foreign` FOREIGN KEY (`voice_id`) REFERENCES `voices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
(8,10,12,'ORD-20250731043013-0166F8','{\"en\":\"Quasi eum.\",\"bg\":\"БГ: Quasi eum.\"}','{\"en\":\"Id culpa ipsum explicabo qui. Ut aliquid culpa quia et ad. Soluta eum debitis et perspiciatis voluptate.\",\"bg\":\"БГ: Id culpa ipsum explicabo qui. Ut aliquid culpa quia et ad. Soluta eum debitis et perspiciatis voluptate.\"}',521.19,'EUR','completed','2025-08-20',4944,'https://example.com/scripts/596f4192-c498-3d09-92b9-ea5a2da5f5b8.pdf','https://example.com/results/47c94ad9-0a3b-3717-8df7-64fdba1d7c2c.mp3','{\"en\":\"Culpa ea numquam suscipit ullam alias eum quo accusantium. Consectetur est magni ad asperiores. Repellat ut animi non accusamus et vero est.\",\"bg\":\"БГ: Culpa ea numquam suscipit ullam alias eum quo accusantium. Consectetur est magni ad asperiores. Repellat ut animi non accusamus et vero est.\"}','{\"en\":\"Quia nemo animi molestiae repudiandae nihil. Unde minima eum aut aliquid.\",\"bg\":\"БГ: Quia nemo animi molestiae repudiandae nihil. Unde minima eum aut aliquid.\"}','2025-07-18 01:30:13','2025-07-24 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(9,10,12,'ORD-20250731043013-3D4608','{\"en\":\"Repudiandae placeat numquam.\",\"bg\":\"БГ: Repudiandae placeat numquam.\"}','{\"en\":\"Quo quisquam id aspernatur vel blanditiis voluptates voluptatum. Deleniti omnis provident id vero fugiat similique sed. Cupiditate cupiditate ex voluptatem numquam a. Sed vel sed maiores cupiditate odio et molestiae.\",\"bg\":\"БГ: Quo quisquam id aspernatur vel blanditiis voluptates voluptatum. Deleniti omnis provident id vero fugiat similique sed. Cupiditate cupiditate ex voluptatem numquam a. Sed vel sed maiores cupiditate odio et molestiae.\"}',940.58,'EUR','accepted','2025-08-29',786,'https://example.com/scripts/45529a41-e5a3-3c37-911e-bf4187117954.pdf',NULL,'{\"en\":\"Consequatur non deserunt quod maiores quis. Veritatis accusamus est voluptates. Praesentium excepturi autem molestiae quam id qui.\",\"bg\":\"БГ: Consequatur non deserunt quod maiores quis. Veritatis accusamus est voluptates. Praesentium excepturi autem molestiae quam id qui.\"}','{\"en\":\"Vel voluptas rem iusto atque numquam sed facilis nisi. Autem non vel nostrum ad.\",\"bg\":\"БГ: Vel voluptas rem iusto atque numquam sed facilis nisi. Autem non vel nostrum ad.\"}',NULL,NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(36,21,10,'ORD-20250731043013-0F6F6B','{\"en\":\"Est quo laboriosam in.\",\"bg\":\"БГ: Est quo laboriosam in.\"}','{\"en\":\"Dolorum in beatae commodi ea fuga qui saepe. Quos maiores ex optio distinctio tenetur aperiam sit. Praesentium sit dignissimos vero quia.\",\"bg\":\"БГ: Dolorum in beatae commodi ea fuga qui saepe. Quos maiores ex optio distinctio tenetur aperiam sit. Praesentium sit dignissimos vero quia.\"}',265.00,'GBP','completed','2025-08-04',714,NULL,'https://example.com/results/bcf3b8db-7d6d-3efc-8273-2595224d2d51.mp3','{\"en\":\"Assumenda soluta repellat excepturi perspiciatis. Repudiandae esse porro aliquid.\",\"bg\":\"БГ: Assumenda soluta repellat excepturi perspiciatis. Repudiandae esse porro aliquid.\"}','{\"en\":null}','2025-07-18 01:30:13','2025-07-21 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(41,22,1,'ORD-20250731043013-06AF33','{\"en\":\"Voluptatem tenetur ullam.\",\"bg\":\"БГ: Voluptatem tenetur ullam.\"}','{\"en\":\"Dolor ut exercitationem aliquid. Qui molestiae et molestias voluptas ad. Qui quia deleniti id ea ut aut assumenda.\",\"bg\":\"БГ: Dolor ut exercitationem aliquid. Qui molestiae et molestias voluptas ad. Qui quia deleniti id ea ut aut assumenda.\"}',170.09,'EUR','completed','2025-08-29',4110,NULL,'https://example.com/results/302d0f9d-fd2f-3edb-9980-06d6ed2e653d.mp3','{\"en\":\"Pariatur officia quis id odio voluptatibus eligendi sint. Doloremque consequuntur praesentium aut et.\",\"bg\":\"БГ: Pariatur officia quis id odio voluptatibus eligendi sint. Doloremque consequuntur praesentium aut et.\"}','{\"en\":null}','2025-07-23 01:30:13','2025-07-30 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(42,22,17,'ORD-20250731043013-39A9AC','{\"en\":\"Eveniet saepe ex voluptatum esse.\",\"bg\":\"БГ: Eveniet saepe ex voluptatum esse.\"}','{\"en\":\"Et eligendi est laboriosam aut omnis laudantium. Dicta facilis fugiat excepturi labore sequi est. Aperiam iusto ad debitis minus.\",\"bg\":\"БГ: Et eligendi est laboriosam aut omnis laudantium. Dicta facilis fugiat excepturi labore sequi est. Aperiam iusto ad debitis minus.\"}',131.40,'EUR','completed','2025-08-27',2776,'https://example.com/scripts/f16ad079-a700-3da4-9930-2fa4dce64c27.pdf','https://example.com/results/3b077a86-7181-36d6-939e-6f8cc4a91e63.mp3','{\"en\":\"Deleniti ut autem voluptatem et voluptatem voluptate. Culpa reprehenderit eos adipisci adipisci dolor. Et veritatis placeat consectetur laudantium esse dolores maiores.\",\"bg\":\"БГ: Deleniti ut autem voluptatem et voluptatem voluptate. Culpa reprehenderit eos adipisci adipisci dolor. Et veritatis placeat consectetur laudantium esse dolores maiores.\"}','{\"en\":null}','2025-07-22 01:30:13','2025-07-24 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(43,22,17,'ORD-20250731043013-73DEC0','{\"en\":\"Esse dolorem non mollitia.\",\"bg\":\"БГ: Esse dolorem non mollitia.\"}','{\"en\":\"Non nihil fugiat qui aliquam et. Quia nulla et eaque occaecati magni.\",\"bg\":\"БГ: Non nihil fugiat qui aliquam et. Quia nulla et eaque occaecati magni.\"}',920.43,'EUR','pending','2025-08-29',3207,NULL,NULL,'{\"en\":\"Cupiditate vero consequatur molestiae quod modi quibusdam et. Non alias et impedit doloribus. Maxime sed similique in sed similique perferendis et aut.\",\"bg\":\"БГ: Cupiditate vero consequatur molestiae quod modi quibusdam et. Non alias et impedit doloribus. Maxime sed similique in sed similique perferendis et aut.\"}','{\"en\":\"Sit voluptas quia ut dolores voluptas. Sint debitis necessitatibus qui repellat perspiciatis. Laborum id aut doloremque aut rerum dolor porro.\",\"bg\":\"БГ: Sit voluptas quia ut dolores voluptas. Sint debitis necessitatibus qui repellat perspiciatis. Laborum id aut doloremque aut rerum dolor porro.\"}','2025-07-12 01:30:13',NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(48,23,6,'ORD-20250731043013-3D528A','{\"en\":\"Tempore officia non.\",\"bg\":\"БГ: Tempore officia non.\"}','{\"en\":\"Voluptatum quia aut blanditiis id quisquam. Unde ea accusantium velit rerum et. Sit minus qui sapiente porro.\",\"bg\":\"БГ: Voluptatum quia aut blanditiis id quisquam. Unde ea accusantium velit rerum et. Sit minus qui sapiente porro.\"}',443.99,'USD','completed','2025-08-11',4189,NULL,'https://example.com/results/1c220ed2-1fbd-318b-ac04-d887dde13bd6.mp3','{\"en\":\"Tempore veritatis omnis sit labore nihil. Ut omnis fuga aliquam dolores porro repellendus omnis fuga.\",\"bg\":\"БГ: Tempore veritatis omnis sit labore nihil. Ut omnis fuga aliquam dolores porro repellendus omnis fuga.\"}','{\"en\":\"Aut nam eum officiis veniam. Earum est distinctio blanditiis ut pariatur beatae qui. Necessitatibus nulla cumque officia.\",\"bg\":\"БГ: Aut nam eum officiis veniam. Earum est distinctio blanditiis ut pariatur beatae qui. Necessitatibus nulla cumque officia.\"}','2025-07-18 01:30:13','2025-07-23 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(49,23,9,'ORD-20250731043013-C9CE7A','{\"en\":\"Placeat quia.\",\"bg\":\"БГ: Placeat quia.\"}','{\"en\":\"Nam sed at et dolorum perspiciatis. Molestias adipisci distinctio molestias possimus qui. In eius provident totam. Incidunt possimus quod alias quos aliquam qui ratione.\",\"bg\":\"БГ: Nam sed at et dolorum perspiciatis. Molestias adipisci distinctio molestias possimus qui. In eius provident totam. Incidunt possimus quod alias quos aliquam qui ratione.\"}',194.69,'USD','completed','2025-08-18',483,'https://example.com/scripts/27dfd0bf-6617-3627-a6b2-8131f4f08499.pdf','https://example.com/results/89625478-c33b-353c-9492-ae97a0e505f2.mp3','{\"en\":\"Et et vero et est. Consectetur tempore eaque id qui.\",\"bg\":\"БГ: Et et vero et est. Consectetur tempore eaque id qui.\"}','{\"en\":\"Quibusdam ex cupiditate et debitis odio ut et. Earum aspernatur natus pariatur porro nihil accusantium.\",\"bg\":\"БГ: Quibusdam ex cupiditate et debitis odio ut et. Earum aspernatur natus pariatur porro nihil accusantium.\"}','2025-07-20 01:30:13','2025-07-22 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(50,23,9,'ORD-20250731043013-7D1567','{\"en\":\"Voluptate magni et repellendus.\",\"bg\":\"БГ: Voluptate magni et repellendus.\"}','{\"en\":\"Laudantium debitis ut dicta necessitatibus. Ipsum voluptate possimus recusandae eaque. Alias qui nam nam rerum non sint.\",\"bg\":\"БГ: Laudantium debitis ut dicta necessitatibus. Ipsum voluptate possimus recusandae eaque. Alias qui nam nam rerum non sint.\"}',960.56,'EUR','accepted','2025-08-20',4193,NULL,NULL,'{\"en\":\"Corporis numquam laborum quis vel. Exercitationem possimus aspernatur deserunt neque. Eius id repellat aliquid ratione esse suscipit rerum modi.\",\"bg\":\"БГ: Corporis numquam laborum quis vel. Exercitationem possimus aspernatur deserunt neque. Eius id repellat aliquid ratione esse suscipit rerum modi.\"}','{\"en\":\"Ut laborum labore eligendi voluptatem. Consectetur eveniet quaerat sed aut occaecati quisquam et. Officiis labore itaque sed ex consequatur optio dolorum.\",\"bg\":\"БГ: Ut laborum labore eligendi voluptatem. Consectetur eveniet quaerat sed aut occaecati quisquam et. Officiis labore itaque sed ex consequatur optio dolorum.\"}',NULL,NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(51,23,10,'ORD-20250731043013-30CC41','{\"en\":\"Explicabo nemo repudiandae.\",\"bg\":\"БГ: Explicabo nemo repudiandae.\"}','{\"en\":\"Dolor et dolores ut nobis nihil ut asperiores. Corrupti repellat qui est accusantium. Magni dolorem non qui et provident. Corporis quibusdam dolor maxime repudiandae iusto.\",\"bg\":\"БГ: Dolor et dolores ut nobis nihil ut asperiores. Corrupti repellat qui est accusantium. Magni dolorem non qui et provident. Corporis quibusdam dolor maxime repudiandae iusto.\"}',305.92,'EUR','completed','2025-08-25',4344,'https://example.com/scripts/4ce46b88-d911-34bb-b6bb-358c5f7b99c2.pdf','https://example.com/results/f6d74e69-445d-3c50-bd9f-5e1b0e6ce904.mp3','{\"en\":\"Aut est ipsam molestias labore non inventore et. Debitis asperiores cumque autem et.\",\"bg\":\"БГ: Aut est ipsam molestias labore non inventore et. Debitis asperiores cumque autem et.\"}','{\"en\":\"Corporis iure deleniti aut aut. Quis et delectus qui numquam.\",\"bg\":\"БГ: Corporis iure deleniti aut aut. Quis et delectus qui numquam.\"}','2025-07-22 01:30:13','2025-07-23 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(52,23,10,'ORD-20250731043013-F0CE3D','{\"en\":\"Est quasi expedita et.\",\"bg\":\"БГ: Est quasi expedita et.\"}','{\"en\":\"Culpa vel autem non qui consequatur asperiores cum. Soluta molestiae hic ipsa consequatur exercitationem aut impedit. Doloribus odio nulla enim odit fuga. Voluptas porro quasi ipsum saepe.\",\"bg\":\"БГ: Culpa vel autem non qui consequatur asperiores cum. Soluta molestiae hic ipsa consequatur exercitationem aut impedit. Doloribus odio nulla enim odit fuga. Voluptas porro quasi ipsum saepe.\"}',552.57,'EUR','in_progress','2025-08-05',1546,NULL,NULL,'{\"en\":\"Eveniet amet magni quo. Ipsum et veniam labore qui. Facere deleniti perspiciatis et non.\",\"bg\":\"БГ: Eveniet amet magni quo. Ipsum et veniam labore qui. Facere deleniti perspiciatis et non.\"}','{\"en\":\"Voluptas atque et qui saepe. In incidunt laudantium rerum harum tenetur temporibus.\",\"bg\":\"БГ: Voluptas atque et qui saepe. In incidunt laudantium rerum harum tenetur temporibus.\"}',NULL,NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(68,80,16,'ORD-20250731043013-A8CCEF','{\"en\":\"Possimus quis culpa aut.\",\"bg\":\"БГ: Possimus quis culpa aut.\"}','{\"en\":\"Temporibus ipsum iusto quidem suscipit esse veniam officiis. Quia et mollitia eius quaerat. Qui enim esse molestiae molestiae dolorum quam.\",\"bg\":\"БГ: Temporibus ipsum iusto quidem suscipit esse veniam officiis. Quia et mollitia eius quaerat. Qui enim esse molestiae molestiae dolorum quam.\"}',720.28,'USD','completed','2025-08-13',4405,'https://example.com/scripts/9e73da0e-2255-3173-a493-b62d97d2a6ee.pdf','https://example.com/results/512e65fe-8be0-3cb4-944a-0258f6aabcd1.mp3','{\"en\":\"Corporis perspiciatis sed aut accusantium voluptates eaque saepe. Est rerum quas tempora commodi et voluptatem. Qui atque officiis consectetur quasi vel illum.\",\"bg\":\"БГ: Corporis perspiciatis sed aut accusantium voluptates eaque saepe. Est rerum quas tempora commodi et voluptatem. Qui atque officiis consectetur quasi vel illum.\"}','{\"en\":\"Quasi excepturi reiciendis aut. Laudantium suscipit voluptatem eum et eos et consequatur. Dolore quae dolor voluptatem est ea.\",\"bg\":\"БГ: Quasi excepturi reiciendis aut. Laudantium suscipit voluptatem eum et eos et consequatur. Dolore quae dolor voluptatem est ea.\"}','2025-07-20 01:30:13','2025-07-23 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(99,96,5,'ORD-20250731043013-F327F8','{\"en\":\"Facere officiis temporibus.\",\"bg\":\"БГ: Facere officiis temporibus.\"}','{\"en\":\"Quis aut dolores velit recusandae. Quibusdam nihil sed occaecati sed. Saepe qui veniam et laudantium.\",\"bg\":\"БГ: Quis aut dolores velit recusandae. Quibusdam nihil sed occaecati sed. Saepe qui veniam et laudantium.\"}',567.48,'EUR','completed','2025-08-06',1479,'https://example.com/scripts/35b58dae-24fc-3e29-a668-d330b8035c04.pdf','https://example.com/results/4a4a09d2-9128-370c-b356-b15546129804.mp3','{\"en\":\"Aspernatur dolorem eum eveniet aut voluptatibus omnis asperiores. Commodi libero molestiae autem.\",\"bg\":\"БГ: Aspernatur dolorem eum eveniet aut voluptatibus omnis asperiores. Commodi libero molestiae autem.\"}','{\"en\":\"Molestiae excepturi amet iusto delectus. Ducimus officia voluptates sapiente non et ipsam.\",\"bg\":\"БГ: Molestiae excepturi amet iusto delectus. Ducimus officia voluptates sapiente non et ipsam.\"}','2025-07-24 01:30:13','2025-07-26 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(100,96,8,'ORD-20250731043013-121469','{\"en\":\"Totam omnis qui nam.\",\"bg\":\"БГ: Totam omnis qui nam.\"}','{\"en\":\"Qui non officia cumque excepturi voluptates. Vero aut culpa neque officiis nihil. Enim cupiditate est qui ea. Libero et assumenda et sint.\",\"bg\":\"БГ: Qui non officia cumque excepturi voluptates. Vero aut culpa neque officiis nihil. Enim cupiditate est qui ea. Libero et assumenda et sint.\"}',167.31,'GBP','completed','2025-08-26',2606,'https://example.com/scripts/ce372d14-4634-37b7-864e-1e777be25a7a.pdf','https://example.com/results/a9862bc4-3404-35df-96dd-957021bfff41.mp3','{\"en\":\"Quia harum iste quia fugit assumenda ut. Fugiat modi consequuntur rerum ipsum rerum facere aut.\",\"bg\":\"БГ: Quia harum iste quia fugit assumenda ut. Fugiat modi consequuntur rerum ipsum rerum facere aut.\"}','{\"en\":\"Tenetur ut praesentium est quia iure iure ut. In aut necessitatibus esse aut sit ut voluptas numquam.\",\"bg\":\"БГ: Tenetur ut praesentium est quia iure iure ut. In aut necessitatibus esse aut sit ut voluptas numquam.\"}','2025-07-23 01:30:13','2025-07-27 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(101,96,8,'ORD-20250731043013-537732','{\"en\":\"Dolores cum sequi architecto.\",\"bg\":\"БГ: Dolores cum sequi architecto.\"}','{\"en\":\"Voluptatem totam rerum nihil inventore quasi sapiente quia. Qui eveniet ab eos ullam dignissimos ut non. Non praesentium quaerat tenetur tenetur dolorem porro.\",\"bg\":\"БГ: Voluptatem totam rerum nihil inventore quasi sapiente quia. Qui eveniet ab eos ullam dignissimos ut non. Non praesentium quaerat tenetur tenetur dolorem porro.\"}',290.59,'GBP','accepted','2025-08-27',3667,NULL,NULL,'{\"en\":\"Sint assumenda consequatur natus deserunt voluptatem aliquid ut. Qui voluptates nihil et ipsa quas est porro.\",\"bg\":\"БГ: Sint assumenda consequatur natus deserunt voluptatem aliquid ut. Qui voluptates nihil et ipsa quas est porro.\"}','{\"en\":null}',NULL,NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(108,98,11,'ORD-20250731043013-D8C5BA','{\"en\":\"Iste provident labore omnis qui.\",\"bg\":\"БГ: Iste provident labore omnis qui.\"}','{\"en\":\"Voluptas pariatur accusantium cum. Distinctio nihil culpa animi quidem amet quis laudantium suscipit. Quibusdam repellat corrupti modi necessitatibus nam. Eos hic labore temporibus vitae ipsa libero id ullam.\",\"bg\":\"БГ: Voluptas pariatur accusantium cum. Distinctio nihil culpa animi quidem amet quis laudantium suscipit. Quibusdam repellat corrupti modi necessitatibus nam. Eos hic labore temporibus vitae ipsa libero id ullam.\"}',80.57,'EUR','completed','2025-08-30',4614,'https://example.com/scripts/943f7da3-99e9-3df1-9002-1ad50f3736b4.pdf','https://example.com/results/d87e3559-fa81-3594-a1c5-17365abd5af0.mp3','{\"en\":\"A mollitia eaque sed molestias cum. Facilis optio nesciunt officia earum eius rerum. Sed sit sit ut facilis accusantium a aliquam.\",\"bg\":\"БГ: A mollitia eaque sed molestias cum. Facilis optio nesciunt officia earum eius rerum. Sed sit sit ut facilis accusantium a aliquam.\"}','{\"en\":\"Repudiandae inventore rerum est et facere quo. Et esse autem autem molestiae.\",\"bg\":\"БГ: Repudiandae inventore rerum est et facere quo. Et esse autem autem molestiae.\"}','2025-07-24 01:30:13','2025-07-30 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(109,98,11,'ORD-20250731043013-B2FF52','{\"en\":\"Quaerat qui molestiae.\",\"bg\":\"БГ: Quaerat qui molestiae.\"}','{\"en\":\"Corporis perspiciatis occaecati tempora et. Necessitatibus velit debitis at sunt natus. Ducimus sed rem architecto aliquid et quia non.\",\"bg\":\"БГ: Corporis perspiciatis occaecati tempora et. Necessitatibus velit debitis at sunt natus. Ducimus sed rem architecto aliquid et quia non.\"}',65.95,'USD','pending','2025-08-15',2331,'https://example.com/scripts/b0b00e70-9f2c-31dc-906b-2e69e1609bbb.pdf',NULL,'{\"en\":\"Culpa recusandae illo delectus esse. Ad fugiat placeat beatae qui.\",\"bg\":\"БГ: Culpa recusandae illo delectus esse. Ad fugiat placeat beatae qui.\"}','{\"en\":\"Quia inventore ut dolores qui ut est quaerat. Porro blanditiis eum praesentium quas velit rerum.\",\"bg\":\"БГ: Quia inventore ut dolores qui ut est quaerat. Porro blanditiis eum praesentium quas velit rerum.\"}',NULL,NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(127,108,1,'ORD-20250731043013-5A736B','{\"en\":\"Velit vitae.\",\"bg\":\"БГ: Velit vitae.\"}','{\"en\":\"Aut dolores iusto quia voluptatibus. Et velit praesentium quo ut. Vel dignissimos excepturi fugiat nam nihil eveniet animi. Beatae rerum veniam possimus laborum quia animi error dolor.\",\"bg\":\"БГ: Aut dolores iusto quia voluptatibus. Et velit praesentium quo ut. Vel dignissimos excepturi fugiat nam nihil eveniet animi. Beatae rerum veniam possimus laborum quia animi error dolor.\"}',959.84,'USD','completed','2025-08-14',4629,'https://example.com/scripts/3191db7c-0c5d-3396-a092-c921f7fea62b.pdf','https://example.com/results/e8adb209-37c0-3399-82f1-86030d16703e.mp3','{\"en\":\"Perspiciatis facere qui sit soluta voluptate doloremque. Magni explicabo delectus et aut odit.\",\"bg\":\"БГ: Perspiciatis facere qui sit soluta voluptate doloremque. Magni explicabo delectus et aut odit.\"}','{\"en\":\"Illo sapiente est sed occaecati laborum minima. Vitae doloremque omnis nulla ratione totam dolor ut. Voluptatem harum fugiat aut et.\",\"bg\":\"БГ: Illo sapiente est sed occaecati laborum minima. Vitae doloremque omnis nulla ratione totam dolor ut. Voluptatem harum fugiat aut et.\"}','2025-07-17 01:30:13','2025-07-24 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(128,108,1,'ORD-20250731043013-A74A20','{\"en\":\"Laboriosam culpa mollitia dolorem.\",\"bg\":\"БГ: Laboriosam culpa mollitia dolorem.\"}','{\"en\":\"Expedita occaecati culpa voluptate doloribus officiis. Ut dolore at quia veritatis. Temporibus laboriosam vitae accusamus reiciendis blanditiis.\",\"bg\":\"БГ: Expedita occaecati culpa voluptate doloribus officiis. Ut dolore at quia veritatis. Temporibus laboriosam vitae accusamus reiciendis blanditiis.\"}',455.42,'EUR','in_progress','2025-08-29',1343,'https://example.com/scripts/1718bf7d-4bc7-3afe-b6ac-a01aa4d403a4.pdf','https://example.com/results/d4a2e089-36c7-3473-9d70-f5a4efaee5ee.mp3','{\"en\":\"Sunt consequatur est suscipit quia at minus hic aut. Labore doloribus eos ab.\",\"bg\":\"БГ: Sunt consequatur est suscipit quia at minus hic aut. Labore doloribus eos ab.\"}','{\"en\":\"Ut amet quo similique magnam quo culpa. Nam sequi rerum dolores eaque nulla autem. Cumque magnam atque quia dolorum sed.\",\"bg\":\"БГ: Ut amet quo similique magnam quo culpa. Nam sequi rerum dolores eaque nulla autem. Cumque magnam atque quia dolorum sed.\"}','2025-07-02 01:30:13','2025-07-10 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(134,112,13,'ORD-20250731043013-48B36E','{\"en\":\"Esse omnis assumenda.\",\"bg\":\"БГ: Esse omnis assumenda.\"}','{\"en\":\"Consectetur pariatur id doloribus voluptatem non. Consequatur dignissimos beatae sint corporis nesciunt. Deserunt dolorem rem tempore quod magnam.\",\"bg\":\"БГ: Consectetur pariatur id doloribus voluptatem non. Consequatur dignissimos beatae sint corporis nesciunt. Deserunt dolorem rem tempore quod magnam.\"}',832.49,'USD','completed','2025-08-25',4115,'https://example.com/scripts/c1977a40-6c54-38fd-b804-79d84cc8099b.pdf','https://example.com/results/72a51bc0-fde2-3d89-a9e2-78ecdaadc4c9.mp3','{\"en\":\"Optio voluptas aspernatur expedita quisquam rerum voluptatem et. Qui veniam aut quia corrupti delectus quo voluptatem id. Dolore dolores ducimus commodi tenetur nesciunt.\",\"bg\":\"БГ: Optio voluptas aspernatur expedita quisquam rerum voluptatem et. Qui veniam aut quia corrupti delectus quo voluptatem id. Dolore dolores ducimus commodi tenetur nesciunt.\"}','{\"en\":\"Vero repudiandae aliquid et doloremque. Rem ipsam omnis deleniti alias placeat. Aut quo omnis in id.\",\"bg\":\"БГ: Vero repudiandae aliquid et doloremque. Rem ipsam omnis deleniti alias placeat. Aut quo omnis in id.\"}','2025-07-17 01:30:13','2025-07-24 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(135,112,13,'ORD-20250731043013-C987E6','{\"en\":\"In quis nobis.\",\"bg\":\"БГ: In quis nobis.\"}','{\"en\":\"Sequi consequuntur optio aliquid. Cum voluptatem nisi velit vero eius libero.\",\"bg\":\"БГ: Sequi consequuntur optio aliquid. Cum voluptatem nisi velit vero eius libero.\"}',794.33,'USD','in_progress','2025-08-10',4174,'https://example.com/scripts/f96935dd-73d2-3b2b-91ed-51c73900c9ac.pdf',NULL,'{\"en\":\"Similique facere ut accusantium vel commodi. Adipisci facere et sequi quis nulla.\",\"bg\":\"БГ: Similique facere ut accusantium vel commodi. Adipisci facere et sequi quis nulla.\"}','{\"en\":\"Deserunt et doloribus aspernatur eius exercitationem velit. Nesciunt aut voluptatem modi non ipsa consectetur. Eaque temporibus sit a ratione perspiciatis sit.\",\"bg\":\"БГ: Deserunt et doloribus aspernatur eius exercitationem velit. Nesciunt aut voluptatem modi non ipsa consectetur. Eaque temporibus sit a ratione perspiciatis sit.\"}','2025-07-11 01:30:13',NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(140,116,4,'ORD-20250731043013-CB203F','{\"en\":\"Consequatur iste.\",\"bg\":\"БГ: Consequatur iste.\"}','{\"en\":\"Corporis itaque deleniti quidem. Aut ea consequuntur eum molestiae quidem eos. Omnis dolor sed et voluptates amet fuga. Vel aperiam numquam repellat occaecati soluta quis. Quas et ex consequuntur error architecto sapiente harum.\",\"bg\":\"БГ: Corporis itaque deleniti quidem. Aut ea consequuntur eum molestiae quidem eos. Omnis dolor sed et voluptates amet fuga. Vel aperiam numquam repellat occaecati soluta quis. Quas et ex consequuntur error architecto sapiente harum.\"}',975.57,'USD','completed','2025-08-28',1062,'https://example.com/scripts/b50ec4a3-b808-3cad-9934-1968a610cdf9.pdf','https://example.com/results/03cf1919-dc8c-3030-831d-8369213457cb.mp3','{\"en\":\"Nam eos odit placeat molestiae. Esse exercitationem enim voluptate porro aut sint impedit.\",\"bg\":\"БГ: Nam eos odit placeat molestiae. Esse exercitationem enim voluptate porro aut sint impedit.\"}','{\"en\":null}','2025-07-20 01:30:13','2025-07-22 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(141,116,4,'ORD-20250731043013-28ED7C','{\"en\":\"Fugiat sed earum.\",\"bg\":\"БГ: Fugiat sed earum.\"}','{\"en\":\"Sed reprehenderit saepe qui et ex praesentium. Libero recusandae corrupti quos officiis id voluptatem praesentium. Omnis voluptate quia aut et earum maiores ipsum sint.\",\"bg\":\"БГ: Sed reprehenderit saepe qui et ex praesentium. Libero recusandae corrupti quos officiis id voluptatem praesentium. Omnis voluptate quia aut et earum maiores ipsum sint.\"}',926.34,'GBP','pending','2025-08-30',4258,'https://example.com/scripts/76029d0d-4356-3738-98db-9796b3109a85.pdf',NULL,'{\"en\":\"Autem quidem sed alias nobis dolorem. Quam ratione ut sed. Illo est deserunt non voluptas perspiciatis rerum voluptatem quia.\",\"bg\":\"БГ: Autem quidem sed alias nobis dolorem. Quam ratione ut sed. Illo est deserunt non voluptas perspiciatis rerum voluptatem quia.\"}','{\"en\":null}','2025-07-26 01:30:13',NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(176,132,2,'ORD-20250731043013-1B10B3','{\"en\":\"Est voluptas consequatur eligendi.\",\"bg\":\"БГ: Est voluptas consequatur eligendi.\"}','{\"en\":\"Ad quia eligendi consequatur est. Vitae repellat dicta aliquam nihil iste exercitationem. Possimus velit aut esse autem. Laudantium aut rerum tempora est sit itaque dolorem.\",\"bg\":\"БГ: Ad quia eligendi consequatur est. Vitae repellat dicta aliquam nihil iste exercitationem. Possimus velit aut esse autem. Laudantium aut rerum tempora est sit itaque dolorem.\"}',356.18,'GBP','completed','2025-08-29',225,'https://example.com/scripts/ae525493-501c-30dc-86ed-9a9e16553a13.pdf','https://example.com/results/3c749b96-aa2d-3de1-899e-e2f9649da635.mp3','{\"en\":\"Dolore error molestiae deserunt excepturi. Voluptates non voluptate sequi voluptate. Ut animi vitae rerum.\",\"bg\":\"БГ: Dolore error molestiae deserunt excepturi. Voluptates non voluptate sequi voluptate. Ut animi vitae rerum.\"}','{\"en\":\"Sunt et pariatur voluptas id. Consectetur dicta facilis dicta impedit quam aliquid voluptate.\",\"bg\":\"БГ: Sunt et pariatur voluptas id. Consectetur dicta facilis dicta impedit quam aliquid voluptate.\"}','2025-07-22 01:30:13','2025-07-25 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(177,132,2,'ORD-20250731043013-9FBDF1','{\"en\":\"Voluptatem ut nihil ut.\",\"bg\":\"БГ: Voluptatem ut nihil ut.\"}','{\"en\":\"Nihil officiis voluptatem consectetur. Impedit fuga doloribus sed quidem totam.\",\"bg\":\"БГ: Nihil officiis voluptatem consectetur. Impedit fuga doloribus sed quidem totam.\"}',598.24,'GBP','in_progress','2025-08-15',1677,'https://example.com/scripts/ebebb620-44c0-3045-9db1-8e5d1d5a36c6.pdf','https://example.com/results/0265d741-3a14-3300-9297-af19ba8b0e75.mp3','{\"en\":\"Natus iusto accusamus natus eum dolores hic. Mollitia adipisci illum ut quidem ea. Reprehenderit nihil autem modi cupiditate et dolores sed.\",\"bg\":\"БГ: Natus iusto accusamus natus eum dolores hic. Mollitia adipisci illum ut quidem ea. Reprehenderit nihil autem modi cupiditate et dolores sed.\"}','{\"en\":null}','2025-07-05 01:30:13','2025-07-11 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(182,134,12,'ORD-20250731043013-A87EF7','{\"en\":\"Neque sit labore omnis.\",\"bg\":\"БГ: Neque sit labore omnis.\"}','{\"en\":\"Cupiditate voluptatem ratione dolorem enim corrupti molestias aut. Quas sed eveniet consectetur et. Repellat numquam molestiae ut provident. Nihil in voluptas at non dolorum corrupti.\",\"bg\":\"БГ: Cupiditate voluptatem ratione dolorem enim corrupti molestias aut. Quas sed eveniet consectetur et. Repellat numquam molestiae ut provident. Nihil in voluptas at non dolorum corrupti.\"}',408.39,'EUR','completed','2025-08-16',1517,'https://example.com/scripts/d6e826a0-86cc-3f73-bc61-9b7d93c697b9.pdf','https://example.com/results/3ec597cf-34a0-388d-b2bb-705c9a70ba97.mp3','{\"en\":\"Quisquam similique quos commodi adipisci mollitia quia rerum laborum. Qui quae ducimus eveniet non ullam unde aut. Ab voluptates vel molestiae nostrum omnis unde.\",\"bg\":\"БГ: Quisquam similique quos commodi adipisci mollitia quia rerum laborum. Qui quae ducimus eveniet non ullam unde aut. Ab voluptates vel molestiae nostrum omnis unde.\"}','{\"en\":\"Nisi sed odio error nihil repellendus aliquid. Nesciunt repellat sit cum id.\",\"bg\":\"БГ: Nisi sed odio error nihil repellendus aliquid. Nesciunt repellat sit cum id.\"}','2025-07-19 01:30:13','2025-07-22 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(183,134,12,'ORD-20250731043013-2BEBDE','{\"en\":\"Perferendis sit vel rerum.\",\"bg\":\"БГ: Perferendis sit vel rerum.\"}','{\"en\":\"Sunt accusantium accusantium sint perferendis beatae eum commodi fugiat. Nulla at optio exercitationem nobis sed consequatur adipisci. In ut ut sunt. Placeat sit dignissimos rerum et minus eos.\",\"bg\":\"БГ: Sunt accusantium accusantium sint perferendis beatae eum commodi fugiat. Nulla at optio exercitationem nobis sed consequatur adipisci. In ut ut sunt. Placeat sit dignissimos rerum et minus eos.\"}',779.94,'USD','accepted','2025-08-08',4620,NULL,'https://example.com/results/737b1ae1-70f2-35a4-9beb-2776399ce7d5.mp3','{\"en\":\"Iste error praesentium deleniti molestiae placeat fugit. Sed dolorum molestias provident esse impedit. Tenetur ut facilis temporibus ut neque ullam fuga.\",\"bg\":\"БГ: Iste error praesentium deleniti molestiae placeat fugit. Sed dolorum molestias provident esse impedit. Tenetur ut facilis temporibus ut neque ullam fuga.\"}','{\"en\":\"Sapiente fuga aperiam est totam. Aperiam officiis hic odit hic. Et mollitia omnis minima dignissimos.\",\"bg\":\"БГ: Sapiente fuga aperiam est totam. Aperiam officiis hic odit hic. Et mollitia omnis minima dignissimos.\"}','2025-07-14 01:30:13','2025-07-18 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(206,144,2,'ORD-20250731043013-A2DA16','{\"en\":\"Est laborum ipsam a.\",\"bg\":\"БГ: Est laborum ipsam a.\"}','{\"en\":\"Accusamus est aut consectetur dolores aliquam amet autem. Est eos autem sed in repellat quia. Velit aut culpa ex. Vitae ut cumque voluptate dolores voluptatibus.\",\"bg\":\"БГ: Accusamus est aut consectetur dolores aliquam amet autem. Est eos autem sed in repellat quia. Velit aut culpa ex. Vitae ut cumque voluptate dolores voluptatibus.\"}',908.58,'GBP','completed','2025-08-27',2738,'https://example.com/scripts/dfe488b4-bd2f-3840-8a4b-cbd9b04192d3.pdf','https://example.com/results/6da4fa8f-4600-3914-9075-b79e2a060384.mp3','{\"en\":\"Sapiente autem dolorum aut voluptatem voluptatem omnis ratione vero. Doloremque est aliquid sit voluptas.\",\"bg\":\"БГ: Sapiente autem dolorum aut voluptatem voluptatem omnis ratione vero. Doloremque est aliquid sit voluptas.\"}','{\"en\":null}','2025-07-17 01:30:13','2025-07-18 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(207,144,2,'ORD-20250731043013-1B90F2','{\"en\":\"Maiores nisi eius aut.\",\"bg\":\"БГ: Maiores nisi eius aut.\"}','{\"en\":\"Aut magnam consequatur cupiditate aut exercitationem aperiam. Et quasi ut et inventore voluptate et doloribus. Quidem voluptatum non repudiandae porro. Et pariatur non non ab ducimus nam.\",\"bg\":\"БГ: Aut magnam consequatur cupiditate aut exercitationem aperiam. Et quasi ut et inventore voluptate et doloribus. Quidem voluptatum non repudiandae porro. Et pariatur non non ab ducimus nam.\"}',397.25,'EUR','pending','2025-08-06',412,NULL,'https://example.com/results/a8aef429-3d24-3a05-b6e5-5617fd5e1a16.mp3','{\"en\":\"Quia id laborum et ipsa similique cumque corrupti aut. Facilis ratione dolore odit odio in qui ab. Magni autem magni voluptate molestias quae fugiat ea.\",\"bg\":\"БГ: Quia id laborum et ipsa similique cumque corrupti aut. Facilis ratione dolore odit odio in qui ab. Magni autem magni voluptate molestias quae fugiat ea.\"}','{\"en\":null}','2025-07-06 01:30:13','2025-07-20 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(211,146,12,'ORD-20250731043013-3C0BE4','{\"en\":\"Aliquid fugit excepturi.\",\"bg\":\"БГ: Aliquid fugit excepturi.\"}','{\"en\":\"Et adipisci impedit corrupti sint. Aut impedit voluptas voluptatem dignissimos est. Harum reiciendis amet rerum architecto maiores voluptatum. Veniam blanditiis nihil modi rem. Eaque odio quis in iure repellat voluptatem.\",\"bg\":\"БГ: Et adipisci impedit corrupti sint. Aut impedit voluptas voluptatem dignissimos est. Harum reiciendis amet rerum architecto maiores voluptatum. Veniam blanditiis nihil modi rem. Eaque odio quis in iure repellat voluptatem.\"}',611.55,'GBP','completed','2025-08-28',3154,NULL,'https://example.com/results/bd5ed3e1-47f2-3543-91aa-3bb4dc241842.mp3','{\"en\":\"Suscipit earum itaque eum aut pariatur libero est. Hic provident qui ex qui beatae beatae. Aperiam non architecto nulla sunt sit laboriosam.\",\"bg\":\"БГ: Suscipit earum itaque eum aut pariatur libero est. Hic provident qui ex qui beatae beatae. Aperiam non architecto nulla sunt sit laboriosam.\"}','{\"en\":null}','2025-07-17 01:30:13','2025-07-19 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(222,150,4,'ORD-20250731043013-07F2B6','{\"en\":\"Repudiandae iste voluptatum amet.\",\"bg\":\"БГ: Repudiandae iste voluptatum amet.\"}','{\"en\":\"Magnam neque inventore animi et ratione esse. Aut earum enim deserunt exercitationem omnis. Odio molestias error quod inventore mollitia.\",\"bg\":\"БГ: Magnam neque inventore animi et ratione esse. Aut earum enim deserunt exercitationem omnis. Odio molestias error quod inventore mollitia.\"}',767.52,'USD','completed','2025-08-21',742,'https://example.com/scripts/b8dca59f-2e2c-34c0-8929-6f3a2751bdc9.pdf','https://example.com/results/840c039f-5cb2-38f3-83bd-e0e1ff7a6f4a.mp3','{\"en\":\"Quaerat distinctio consequuntur voluptas aperiam asperiores repudiandae. Provident culpa sint mollitia autem. Asperiores rerum molestiae sequi quam sint illum.\",\"bg\":\"БГ: Quaerat distinctio consequuntur voluptas aperiam asperiores repudiandae. Provident culpa sint mollitia autem. Asperiores rerum molestiae sequi quam sint illum.\"}','{\"en\":null}','2025-07-22 01:30:13','2025-07-25 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(223,152,12,'ORD-20250731043013-F461B6','{\"en\":\"Quae quia in.\",\"bg\":\"БГ: Quae quia in.\"}','{\"en\":\"Nesciunt illum officia est. Sit assumenda voluptas ut. Vitae reprehenderit ducimus quo excepturi nisi minus aut. Illum qui aliquam dolorem commodi.\",\"bg\":\"БГ: Nesciunt illum officia est. Sit assumenda voluptas ut. Vitae reprehenderit ducimus quo excepturi nisi minus aut. Illum qui aliquam dolorem commodi.\"}',772.70,'USD','completed','2025-08-26',4321,NULL,'https://example.com/results/5fd60b8a-9e58-362a-a17a-b6c3119a7c16.mp3','{\"en\":\"Nostrum deleniti quasi adipisci et quisquam provident expedita. Doloremque voluptatum esse cupiditate id veniam.\",\"bg\":\"БГ: Nostrum deleniti quasi adipisci et quisquam provident expedita. Doloremque voluptatum esse cupiditate id veniam.\"}','{\"en\":\"Vero inventore temporibus error et rem ipsa. Vel in quidem ullam facere odio quaerat. Et eos est similique labore dolor quidem.\",\"bg\":\"БГ: Vero inventore temporibus error et rem ipsa. Vel in quidem ullam facere odio quaerat. Et eos est similique labore dolor quidem.\"}','2025-07-22 01:30:13','2025-07-26 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(224,152,12,'ORD-20250731043013-90A546','{\"en\":\"Quia aut asperiores voluptas.\",\"bg\":\"БГ: Quia aut asperiores voluptas.\"}','{\"en\":\"Voluptatem cupiditate odit in deleniti odio iure. Autem dicta nihil et numquam repellendus doloribus est. Deserunt aut odit odit dolore ut itaque quo.\",\"bg\":\"БГ: Voluptatem cupiditate odit in deleniti odio iure. Autem dicta nihil et numquam repellendus doloribus est. Deserunt aut odit odit dolore ut itaque quo.\"}',336.28,'GBP','accepted','2025-08-18',3492,'https://example.com/scripts/31c89dad-8e94-3ce9-80b1-023f52f7ea11.pdf',NULL,'{\"en\":\"Aliquam ut voluptatem voluptas accusantium doloribus expedita voluptatum. Sunt aut optio perspiciatis sint enim ipsum.\",\"bg\":\"БГ: Aliquam ut voluptatem voluptas accusantium doloribus expedita voluptatum. Sunt aut optio perspiciatis sint enim ipsum.\"}','{\"en\":\"Dicta qui pariatur incidunt id nam qui. Ipsum voluptas occaecati repellendus quisquam.\",\"bg\":\"БГ: Dicta qui pariatur incidunt id nam qui. Ipsum voluptas occaecati repellendus quisquam.\"}',NULL,NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(232,158,9,'ORD-20250731043013-CCADD6','{\"en\":\"Voluptatem maiores voluptatum.\",\"bg\":\"БГ: Voluptatem maiores voluptatum.\"}','{\"en\":\"Omnis laudantium qui aut voluptates atque rem. Minus consectetur dolores et ut nulla totam dolorem pariatur.\",\"bg\":\"БГ: Omnis laudantium qui aut voluptates atque rem. Minus consectetur dolores et ut nulla totam dolorem pariatur.\"}',846.74,'GBP','completed','2025-08-20',530,'https://example.com/scripts/c6115548-b9a8-32c3-9773-ab9e4996d76d.pdf','https://example.com/results/b00a4718-33d8-312a-91fa-8e1cca9e4015.mp3','{\"en\":\"Quaerat et sunt tempora hic est officiis. Aut quidem quaerat blanditiis maxime est consequatur.\",\"bg\":\"БГ: Quaerat et sunt tempora hic est officiis. Aut quidem quaerat blanditiis maxime est consequatur.\"}','{\"en\":\"Soluta qui odit sint soluta. Libero deserunt voluptatem assumenda molestiae.\",\"bg\":\"БГ: Soluta qui odit sint soluta. Libero deserunt voluptatem assumenda molestiae.\"}','2025-07-22 01:30:13','2025-07-24 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(233,158,9,'ORD-20250731043013-A71F1D','{\"en\":\"Ab rem deserunt.\",\"bg\":\"БГ: Ab rem deserunt.\"}','{\"en\":\"Molestias sed ipsam rerum commodi et totam et. At et dolorem ipsum sit mollitia ut quis. Quia maiores quis voluptatem sed. Et rem consequatur facere qui et eum deserunt.\",\"bg\":\"БГ: Molestias sed ipsam rerum commodi et totam et. At et dolorem ipsum sit mollitia ut quis. Quia maiores quis voluptatem sed. Et rem consequatur facere qui et eum deserunt.\"}',86.71,'USD','in_progress','2025-08-06',1513,'https://example.com/scripts/2fe7c8ba-6bda-3ca7-b669-107cde8ee2a3.pdf',NULL,'{\"en\":\"Tempore qui harum rerum non. Quisquam pariatur delectus perferendis sit libero velit quis. Quia consequatur iusto laborum fugit.\",\"bg\":\"БГ: Tempore qui harum rerum non. Quisquam pariatur delectus perferendis sit libero velit quis. Quia consequatur iusto laborum fugit.\"}','{\"en\":null}','2025-07-13 01:30:13',NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(276,182,11,'ORD-20250731043013-27ABF0','{\"en\":\"Et maiores soluta.\",\"bg\":\"БГ: Et maiores soluta.\"}','{\"en\":\"Voluptatem quae quod et eveniet ut. Velit ea aut iure adipisci voluptatum sit. Et cupiditate culpa placeat sit. Consequatur ut et quo sit perferendis pariatur.\",\"bg\":\"БГ: Voluptatem quae quod et eveniet ut. Velit ea aut iure adipisci voluptatum sit. Et cupiditate culpa placeat sit. Consequatur ut et quo sit perferendis pariatur.\"}',919.44,'EUR','completed','2025-08-03',4659,NULL,'https://example.com/results/fc7b2137-ba47-388b-a1c1-3e8ef3e38f40.mp3','{\"en\":\"Velit quidem est rerum voluptas qui ea. Non excepturi aliquam possimus ut eaque tenetur. Ea pariatur dolor perferendis dolor qui.\",\"bg\":\"БГ: Velit quidem est rerum voluptas qui ea. Non excepturi aliquam possimus ut eaque tenetur. Ea pariatur dolor perferendis dolor qui.\"}','{\"en\":\"Cupiditate pariatur quia tempora vitae. Laborum iste harum esse aliquid eum unde hic.\",\"bg\":\"БГ: Cupiditate pariatur quia tempora vitae. Laborum iste harum esse aliquid eum unde hic.\"}','2025-07-22 01:30:13','2025-07-26 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(277,182,11,'ORD-20250731043013-A1F733','{\"en\":\"Ut deleniti.\",\"bg\":\"БГ: Ut deleniti.\"}','{\"en\":\"Ut placeat omnis omnis ratione. Aut optio consequatur ipsa qui aut odit. Est totam quia repellendus quidem ea assumenda exercitationem voluptatum.\",\"bg\":\"БГ: Ut placeat omnis omnis ratione. Aut optio consequatur ipsa qui aut odit. Est totam quia repellendus quidem ea assumenda exercitationem voluptatum.\"}',467.09,'USD','accepted','2025-08-23',3021,NULL,'https://example.com/results/57c0a027-24f2-3428-a3b8-79c0156be413.mp3','{\"en\":\"Eius optio nemo et qui. Consequatur suscipit quod est saepe labore velit id. Molestias et recusandae ullam dolorem voluptas.\",\"bg\":\"БГ: Eius optio nemo et qui. Consequatur suscipit quod est saepe labore velit id. Molestias et recusandae ullam dolorem voluptas.\"}','{\"en\":\"Sint dignissimos quam fuga iure distinctio. Vel fugit ad repellendus non molestiae.\",\"bg\":\"БГ: Sint dignissimos quam fuga iure distinctio. Vel fugit ad repellendus non molestiae.\"}','2025-07-13 01:30:13','2025-07-23 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(288,186,12,'ORD-20250731043013-A65348','{\"en\":\"Minus facere voluptatibus et.\",\"bg\":\"БГ: Minus facere voluptatibus et.\"}','{\"en\":\"Iusto animi aut quam et quidem. Adipisci sit et accusamus esse deleniti. Illum cumque ratione et quaerat molestiae animi veritatis. Iure voluptatem maiores officia rerum architecto.\",\"bg\":\"БГ: Iusto animi aut quam et quidem. Adipisci sit et accusamus esse deleniti. Illum cumque ratione et quaerat molestiae animi veritatis. Iure voluptatem maiores officia rerum architecto.\"}',555.09,'USD','completed','2025-08-17',2877,'https://example.com/scripts/83e7cc09-1745-39e3-841a-9689d653ed60.pdf','https://example.com/results/ea358aed-9009-309e-9ee7-b520cb4d824a.mp3','{\"en\":\"Dolor nesciunt aut et aut qui possimus iure reprehenderit. Perferendis est facere nostrum autem est. Quia nihil illo quas ipsam.\",\"bg\":\"БГ: Dolor nesciunt aut et aut qui possimus iure reprehenderit. Perferendis est facere nostrum autem est. Quia nihil illo quas ipsam.\"}','{\"en\":null}','2025-07-23 01:30:13','2025-07-24 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(289,186,12,'ORD-20250731043013-35455A','{\"en\":\"Consectetur qui qui.\",\"bg\":\"БГ: Consectetur qui qui.\"}','{\"en\":\"Ut sed assumenda ipsum dolore non. Commodi repellendus non dolorum rem dolores reprehenderit. Et corrupti consequatur voluptatem.\",\"bg\":\"БГ: Ut sed assumenda ipsum dolore non. Commodi repellendus non dolorum rem dolores reprehenderit. Et corrupti consequatur voluptatem.\"}',489.93,'EUR','pending','2025-08-30',1351,'https://example.com/scripts/4fe980c2-52ff-3f12-a8b4-f7a9ead68e7c.pdf','https://example.com/results/a90af9b9-ac9e-3e3c-9dbb-b7af2be8946f.mp3','{\"en\":\"Itaque odit tempora ad. Quae quisquam ut corporis. Officia aut sit doloribus doloribus doloremque.\",\"bg\":\"БГ: Itaque odit tempora ad. Quae quisquam ut corporis. Officia aut sit doloribus doloribus doloremque.\"}','{\"en\":\"Sint aliquid ab et officiis iste consectetur. Autem a consequuntur debitis accusantium sed et id. Quae incidunt neque molestiae quis.\",\"bg\":\"БГ: Sint aliquid ab et officiis iste consectetur. Autem a consequuntur debitis accusantium sed et id. Quae incidunt neque molestiae quis.\"}','2025-07-01 01:30:13','2025-07-12 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(304,194,10,'ORD-20250731043013-DFFCE4','{\"en\":\"Rerum libero ab unde.\",\"bg\":\"БГ: Rerum libero ab unde.\"}','{\"en\":\"Sit sequi eos adipisci impedit. Tempore quam quibusdam est necessitatibus dolore modi. Deserunt aut consequuntur deleniti inventore accusamus.\",\"bg\":\"БГ: Sit sequi eos adipisci impedit. Tempore quam quibusdam est necessitatibus dolore modi. Deserunt aut consequuntur deleniti inventore accusamus.\"}',851.49,'GBP','completed','2025-08-08',4439,'https://example.com/scripts/8aa56616-f6df-3d69-be9a-dcc9e41fb95b.pdf','https://example.com/results/e8a430ec-aa3c-3a2f-9aab-445f346c6c7e.mp3','{\"en\":\"Et esse vel consequatur id suscipit dolorem in expedita. Id illo consectetur eum debitis.\",\"bg\":\"БГ: Et esse vel consequatur id suscipit dolorem in expedita. Id illo consectetur eum debitis.\"}','{\"en\":null}','2025-07-20 01:30:13','2025-07-23 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(313,200,12,'ORD-20250731043013-720F07','{\"en\":\"Quo repudiandae.\",\"bg\":\"БГ: Quo repudiandae.\"}','{\"en\":\"Quia consequatur sint officia aut deleniti sed. Minus enim occaecati sed at et incidunt suscipit. Delectus quis quia animi non est voluptatem. Aut impedit mollitia et est sint fuga.\",\"bg\":\"БГ: Quia consequatur sint officia aut deleniti sed. Minus enim occaecati sed at et incidunt suscipit. Delectus quis quia animi non est voluptatem. Aut impedit mollitia et est sint fuga.\"}',882.84,'EUR','completed','2025-08-20',752,'https://example.com/scripts/d50ab609-1b1a-3857-b100-cd1b6a82d3e2.pdf','https://example.com/results/e1e87e47-b393-3555-83c3-0ff287902398.mp3','{\"en\":\"Voluptatum et commodi ipsa possimus. Et autem nostrum corporis. Natus sint qui eos dolor quia commodi quis.\",\"bg\":\"БГ: Voluptatum et commodi ipsa possimus. Et autem nostrum corporis. Natus sint qui eos dolor quia commodi quis.\"}','{\"en\":\"Ea ut sint mollitia in. Impedit et illo possimus itaque autem dignissimos assumenda.\",\"bg\":\"БГ: Ea ut sint mollitia in. Impedit et illo possimus itaque autem dignissimos assumenda.\"}','2025-07-21 01:30:13','2025-07-25 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(323,206,16,'ORD-20250731043013-253F67','{\"en\":\"Magnam omnis inventore.\",\"bg\":\"БГ: Magnam omnis inventore.\"}','{\"en\":\"Pariatur distinctio officiis quasi voluptas eaque. Impedit dolores est est sit. Distinctio autem in quidem quo voluptatem occaecati. Dicta fugit est vel cumque voluptatem.\",\"bg\":\"БГ: Pariatur distinctio officiis quasi voluptas eaque. Impedit dolores est est sit. Distinctio autem in quidem quo voluptatem occaecati. Dicta fugit est vel cumque voluptatem.\"}',955.10,'GBP','completed','2025-08-27',950,NULL,'https://example.com/results/c15d9d86-22c1-35ea-ba0a-091cf6a0b5cb.mp3','{\"en\":\"Et enim alias minima impedit laudantium. Repellendus molestiae repudiandae sunt enim et.\",\"bg\":\"БГ: Et enim alias minima impedit laudantium. Repellendus molestiae repudiandae sunt enim et.\"}','{\"en\":\"Velit cupiditate molestiae nesciunt ut. Sapiente autem et quam aut architecto a numquam rerum. Voluptatem voluptas ut id at et aliquid omnis nobis.\",\"bg\":\"БГ: Velit cupiditate molestiae nesciunt ut. Sapiente autem et quam aut architecto a numquam rerum. Voluptatem voluptas ut id at et aliquid omnis nobis.\"}','2025-07-21 01:30:13','2025-07-26 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(324,206,16,'ORD-20250731043013-443CF4','{\"en\":\"Enim eveniet autem.\",\"bg\":\"БГ: Enim eveniet autem.\"}','{\"en\":\"Accusamus quam aut ipsa itaque sed tempore et autem. Eos et nihil a. Inventore nihil et nemo qui omnis sit ut sit.\",\"bg\":\"БГ: Accusamus quam aut ipsa itaque sed tempore et autem. Eos et nihil a. Inventore nihil et nemo qui omnis sit ut sit.\"}',524.68,'EUR','pending','2025-08-11',2521,NULL,NULL,'{\"en\":\"Dicta nihil rerum aut. Adipisci id eos eligendi.\",\"bg\":\"БГ: Dicta nihil rerum aut. Adipisci id eos eligendi.\"}','{\"en\":\"Odio consequuntur laboriosam sed consequuntur quis maiores. Quod nulla voluptas nihil.\",\"bg\":\"БГ: Odio consequuntur laboriosam sed consequuntur quis maiores. Quod nulla voluptas nihil.\"}','2025-07-14 01:30:13',NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(331,210,10,'ORD-20250731043013-F873C3','{\"en\":\"Vel excepturi ipsam.\",\"bg\":\"БГ: Vel excepturi ipsam.\"}','{\"en\":\"Dolores nam velit quos qui aut assumenda eos. Quae perferendis ut distinctio ut enim. Autem cumque dolorem quia molestias in. Similique eos omnis aut quas non quos beatae quidem.\",\"bg\":\"БГ: Dolores nam velit quos qui aut assumenda eos. Quae perferendis ut distinctio ut enim. Autem cumque dolorem quia molestias in. Similique eos omnis aut quas non quos beatae quidem.\"}',856.07,'EUR','completed','2025-08-05',4941,NULL,'https://example.com/results/e2721510-95ff-3d15-a4aa-cb026b80c516.mp3','{\"en\":\"Deleniti voluptatem veniam commodi dicta optio. Officia hic esse debitis maiores aliquid illum.\",\"bg\":\"БГ: Deleniti voluptatem veniam commodi dicta optio. Officia hic esse debitis maiores aliquid illum.\"}','{\"en\":\"Est quae voluptas repellat eligendi. Autem exercitationem dolorem doloribus.\",\"bg\":\"БГ: Est quae voluptas repellat eligendi. Autem exercitationem dolorem doloribus.\"}','2025-07-22 01:30:13','2025-07-23 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(332,210,10,'ORD-20250731043013-50E729','{\"en\":\"A sit dolor.\",\"bg\":\"БГ: A sit dolor.\"}','{\"en\":\"Blanditiis ducimus delectus quaerat architecto. Facere quo eum eum sed repellendus possimus. Et animi repellendus amet.\",\"bg\":\"БГ: Blanditiis ducimus delectus quaerat architecto. Facere quo eum eum sed repellendus possimus. Et animi repellendus amet.\"}',401.31,'EUR','accepted','2025-08-15',3154,'https://example.com/scripts/6e5ac446-723b-3cfd-b58e-8cc5ca74afef.pdf',NULL,'{\"en\":\"Nesciunt aliquam quia nulla. Est vitae est voluptatem deserunt.\",\"bg\":\"БГ: Nesciunt aliquam quia nulla. Est vitae est voluptatem deserunt.\"}','{\"en\":\"Et corrupti voluptatem atque rerum ut. Quidem aut modi perferendis.\",\"bg\":\"БГ: Et corrupti voluptatem atque rerum ut. Quidem aut modi perferendis.\"}','2025-07-14 01:30:13',NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(350,216,2,'ORD-20250731043013-3A355B','{\"en\":\"Mollitia rerum ab.\",\"bg\":\"БГ: Mollitia rerum ab.\"}','{\"en\":\"Voluptas incidunt ab recusandae aspernatur et. Aliquam neque aut excepturi enim dolor cum. Occaecati distinctio perferendis numquam cum ratione cupiditate qui.\",\"bg\":\"БГ: Voluptas incidunt ab recusandae aspernatur et. Aliquam neque aut excepturi enim dolor cum. Occaecati distinctio perferendis numquam cum ratione cupiditate qui.\"}',728.85,'EUR','completed','2025-08-19',1065,'https://example.com/scripts/f974922f-6cf7-3989-a238-cdf42360284b.pdf','https://example.com/results/14157935-102f-3c28-ac0a-fcb3a3e0f882.mp3','{\"en\":\"Quibusdam inventore odio corrupti. Dolore consequuntur eligendi est architecto.\",\"bg\":\"БГ: Quibusdam inventore odio corrupti. Dolore consequuntur eligendi est architecto.\"}','{\"en\":\"Aut consequatur sunt eligendi nihil occaecati. Et sit adipisci tempora nihil quis nulla tempora. Nihil omnis aut inventore molestias quis animi.\",\"bg\":\"БГ: Aut consequatur sunt eligendi nihil occaecati. Et sit adipisci tempora nihil quis nulla tempora. Nihil omnis aut inventore molestias quis animi.\"}','2025-07-23 01:30:13','2025-07-27 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(351,216,2,'ORD-20250731043013-709EE1','{\"en\":\"Est id ea consequatur.\",\"bg\":\"БГ: Est id ea consequatur.\"}','{\"en\":\"Ducimus ut provident est ratione excepturi. Vero vitae et reiciendis modi facere magnam qui. Vel suscipit sed consectetur quia blanditiis. Incidunt accusantium dolores suscipit ratione nihil.\",\"bg\":\"БГ: Ducimus ut provident est ratione excepturi. Vero vitae et reiciendis modi facere magnam qui. Vel suscipit sed consectetur quia blanditiis. Incidunt accusantium dolores suscipit ratione nihil.\"}',361.23,'GBP','pending','2025-08-14',143,'https://example.com/scripts/2ac06ef1-6de1-3e25-a703-f5e81bde06e4.pdf',NULL,'{\"en\":\"Vel incidunt qui nostrum deleniti. Ut sit aliquam dolores ut.\",\"bg\":\"БГ: Vel incidunt qui nostrum deleniti. Ut sit aliquam dolores ut.\"}','{\"en\":\"Rerum aperiam accusamus laudantium ut similique vel. Veritatis et ut doloribus numquam et cupiditate.\",\"bg\":\"БГ: Rerum aperiam accusamus laudantium ut similique vel. Veritatis et ut doloribus numquam et cupiditate.\"}','2025-07-26 01:30:13',NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(371,224,8,'ORD-20250731043013-6D3060','{\"en\":\"Voluptas in accusantium.\",\"bg\":\"БГ: Voluptas in accusantium.\"}','{\"en\":\"Ipsam unde iure provident repellat perferendis eum nihil. Perspiciatis veritatis in id dolorem delectus sed qui. Hic aut deleniti optio nostrum saepe dolore.\",\"bg\":\"БГ: Ipsam unde iure provident repellat perferendis eum nihil. Perspiciatis veritatis in id dolorem delectus sed qui. Hic aut deleniti optio nostrum saepe dolore.\"}',64.50,'EUR','completed','2025-08-20',1474,'https://example.com/scripts/8d62a16a-5910-3ec3-bd3c-54c47e52635a.pdf','https://example.com/results/1ef4e0da-3b0f-3ef9-8fd3-8307abd8f9ca.mp3','{\"en\":\"Et culpa qui quis consequatur. Quisquam quod est distinctio voluptatem molestias repellat. Recusandae aliquam dolor aliquid quasi debitis quo.\",\"bg\":\"БГ: Et culpa qui quis consequatur. Quisquam quod est distinctio voluptatem molestias repellat. Recusandae aliquam dolor aliquid quasi debitis quo.\"}','{\"en\":null}','2025-07-18 01:30:13','2025-07-20 01:30:13','2025-07-31 01:30:13','2025-07-31 01:30:13');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) NOT NULL DEFAULT 'USD',
  `status` enum('pending','completed','failed','refunded') NOT NULL DEFAULT 'pending',
  `payment_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_details`)),
  `paid_at` timestamp NULL DEFAULT NULL,
  `refunded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_payment_id_unique` (`payment_id`),
  KEY `payments_order_id_foreign` (`order_id`),
  KEY `payments_user_id_foreign` (`user_id`),
  CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES
(7,8,10,'PAY-20250731043014-532F4B','google_pay',521.19,'EUR','completed','{\"transaction_id\":\"SZ6075BK0247\",\"payment_method_details\":{\"type\":\"google_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Dr. Chaim Beier MD\",\"email\":\"shanna.kuhn@herzog.biz\",\"address\":{\"line1\":\"72739 Camilla Valleys Apt. 839\",\"city\":\"Lake Albahaven\",\"country\":\"RU\",\"postal_code\":\"66008-1959\"}}}','2025-07-29 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(8,8,10,'PAY-20250731043014-719370','credit_card',521.19,'EUR','failed','{\"transaction_id\":\"CQ1328EA6710\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"1459\",\"brand\":\"amex\"},\"billing_details\":{\"name\":\"Miss Darby Aufderhar\",\"email\":\"wmoore@hotmail.com\",\"address\":{\"line1\":\"7229 Armstrong Dale\",\"city\":\"New Beverlyview\",\"country\":\"AZ\",\"postal_code\":\"27448\"}}}',NULL,NULL,'2025-08-01 01:30:13','2025-08-01 01:30:13'),
(9,9,10,'PAY-20250731043014-AD2D31','credit_card',940.58,'EUR','completed','{\"transaction_id\":\"ZM2783KO5125\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"7067\",\"brand\":\"discover\"},\"billing_details\":{\"name\":\"Trevion Rice IV\",\"email\":\"francesca44@runolfsson.com\",\"address\":{\"line1\":\"516 Sawayn Mission\",\"city\":\"East Hilton\",\"country\":\"PF\",\"postal_code\":\"15471\"}}}','2025-07-27 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(35,36,21,'PAY-20250731043014-63B14F','google_pay',265.00,'GBP','completed','{\"transaction_id\":\"BI7498HF0122\",\"payment_method_details\":{\"type\":\"google_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Armand Boyer Sr.\",\"email\":\"qkerluke@hotmail.com\",\"address\":{\"line1\":\"743 Klein Plaza Apt. 346\",\"city\":\"Port Harmonybury\",\"country\":\"AZ\",\"postal_code\":\"54163\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(42,41,22,'PAY-20250731043014-C9E70D','bank_transfer',170.09,'EUR','completed','{\"transaction_id\":\"ZC8721SH0896\",\"payment_method_details\":{\"type\":\"bank_transfer\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Jacinthe Nader\",\"email\":\"tracy94@kub.info\",\"address\":{\"line1\":\"64751 Summer Dale\",\"city\":\"South Jadenville\",\"country\":\"BW\",\"postal_code\":\"96181-2606\"}}}','2025-07-25 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(43,42,22,'PAY-20250731043014-D0F4FA','google_pay',131.40,'EUR','completed','{\"transaction_id\":\"VQ0389UH0780\",\"payment_method_details\":{\"type\":\"google_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Niko Thiel\",\"email\":\"judah.fritsch@homenick.com\",\"address\":{\"line1\":\"2158 Lionel Shores\",\"city\":\"North Oniechester\",\"country\":\"CU\",\"postal_code\":\"11467\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(47,48,23,'PAY-20250731043014-F53B00','apple_pay',443.99,'USD','completed','{\"transaction_id\":\"QS9959DP9879\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Lorine Brown\",\"email\":\"evans65@cummerata.org\",\"address\":{\"line1\":\"6655 Muller Ville\",\"city\":\"Effertzfort\",\"country\":\"ET\",\"postal_code\":\"64476-0332\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(48,49,23,'PAY-20250731043014-3D2BB9','stripe',194.69,'USD','completed','{\"transaction_id\":\"NC0035UK0627\",\"payment_method_details\":{\"type\":\"stripe\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Cleta Mitchell DVM\",\"email\":\"keeling.vallie@hotmail.com\",\"address\":{\"line1\":\"390 Jaskolski Track\",\"city\":\"Delaneybury\",\"country\":\"MQ\",\"postal_code\":\"18775\"}}}','2025-07-28 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(49,50,23,'PAY-20250731043014-452D2A','apple_pay',960.56,'EUR','completed','{\"transaction_id\":\"OG8465WA1770\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Jamal Tremblay PhD\",\"email\":\"joanie.pollich@gmail.com\",\"address\":{\"line1\":\"4064 Goyette Avenue Suite 651\",\"city\":\"Hilarioborough\",\"country\":\"BD\",\"postal_code\":\"35004\"}}}','2025-07-27 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(50,51,23,'PAY-20250731043014-46C6E9','google_pay',305.92,'EUR','completed','{\"transaction_id\":\"BO7419ZF6034\",\"payment_method_details\":{\"type\":\"google_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Jerad Kassulke\",\"email\":\"lucius.sawayn@senger.com\",\"address\":{\"line1\":\"98742 Dane Turnpike Apt. 414\",\"city\":\"North Kalebville\",\"country\":\"NC\",\"postal_code\":\"76735-8929\"}}}','2025-07-28 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(51,52,23,'PAY-20250731043014-7C6EDF','apple_pay',552.57,'EUR','completed','{\"transaction_id\":\"WC5957BJ9535\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Horace Grady\",\"email\":\"zaria26@hotmail.com\",\"address\":{\"line1\":\"23295 Huel Courts Apt. 504\",\"city\":\"Andersonfurt\",\"country\":\"NG\",\"postal_code\":\"69437-7487\"}}}','2025-07-29 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(70,68,80,'PAY-20250731043014-563756','credit_card',720.28,'USD','completed','{\"transaction_id\":\"IT2915PL2730\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"2261\",\"brand\":\"discover\"},\"billing_details\":{\"name\":\"Miss Assunta Robel II\",\"email\":\"allison11@gmail.com\",\"address\":{\"line1\":\"13340 Bernice Prairie\",\"city\":\"Lake Colby\",\"country\":\"AX\",\"postal_code\":\"50961-2401\"}}}','2025-07-24 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(100,99,96,'PAY-20250731043014-82744F','apple_pay',567.48,'EUR','completed','{\"transaction_id\":\"EQ5039HI1844\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Aida Block\",\"email\":\"madisyn92@yahoo.com\",\"address\":{\"line1\":\"60761 Morar Forest Suite 291\",\"city\":\"New Brice\",\"country\":\"GL\",\"postal_code\":\"59710-2425\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(101,99,96,'PAY-20250731043014-D1ECDB','credit_card',567.48,'EUR','failed','{\"transaction_id\":\"IX1261ME0787\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"6573\",\"brand\":\"discover\"},\"billing_details\":{\"name\":\"Prof. Mike Marks\",\"email\":\"lilla.russel@hotmail.com\",\"address\":{\"line1\":\"764 Legros Knoll Suite 079\",\"city\":\"New Geovanyport\",\"country\":\"MN\",\"postal_code\":\"09776-1118\"}}}',NULL,NULL,'2025-08-01 01:30:13','2025-08-01 01:30:13'),
(102,100,96,'PAY-20250731043014-AAFA2B','stripe',167.31,'GBP','completed','{\"transaction_id\":\"TK6046EN5993\",\"payment_method_details\":{\"type\":\"stripe\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Prof. Isadore Dickinson V\",\"email\":\"jast.deontae@hartmann.org\",\"address\":{\"line1\":\"90772 Spinka Lock Apt. 973\",\"city\":\"Kozeyland\",\"country\":\"CZ\",\"postal_code\":\"55260\"}}}','2025-07-25 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(103,101,96,'PAY-20250731043014-9C5D78','google_pay',290.59,'GBP','completed','{\"transaction_id\":\"ZJ4021NG8146\",\"payment_method_details\":{\"type\":\"google_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Mr. Miles Kilback\",\"email\":\"anthony.carter@mclaughlin.com\",\"address\":{\"line1\":\"4669 Antwan Loop\",\"city\":\"Mckenzieland\",\"country\":\"CG\",\"postal_code\":\"81878\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(109,108,98,'PAY-20250731043014-4F3337','credit_card',80.57,'EUR','completed','{\"transaction_id\":\"NP3979PD8600\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"2952\",\"brand\":\"mastercard\"},\"billing_details\":{\"name\":\"Jovan Smith\",\"email\":\"djenkins@shanahan.org\",\"address\":{\"line1\":\"554 Edwina Station Suite 819\",\"city\":\"North Dulceville\",\"country\":\"SZ\",\"postal_code\":\"79999\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(128,127,108,'PAY-20250731043014-CC63CE','stripe',959.84,'USD','completed','{\"transaction_id\":\"SZ4086QZ6976\",\"payment_method_details\":{\"type\":\"stripe\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Orlo Gleichner\",\"email\":\"kelvin61@simonis.com\",\"address\":{\"line1\":\"948 Andre Road Suite 826\",\"city\":\"New Tierra\",\"country\":\"LR\",\"postal_code\":\"40829\"}}}','2025-07-25 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(134,134,112,'PAY-20250731043014-441838','credit_card',832.49,'USD','completed','{\"transaction_id\":\"RV1978JD4053\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"6833\",\"brand\":\"visa\"},\"billing_details\":{\"name\":\"Daphney Farrell Jr.\",\"email\":\"rosenbaum.fidel@kessler.info\",\"address\":{\"line1\":\"6236 Josiah Place Apt. 079\",\"city\":\"West Tessieville\",\"country\":\"GA\",\"postal_code\":\"08389\"}}}','2025-07-29 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(140,140,116,'PAY-20250731043014-7F6C49','apple_pay',975.57,'USD','completed','{\"transaction_id\":\"VR0189QJ8025\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Lori Durgan\",\"email\":\"wlabadie@yahoo.com\",\"address\":{\"line1\":\"179 Douglas Unions\",\"city\":\"Lake Mathilde\",\"country\":\"CI\",\"postal_code\":\"48978-3588\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(141,141,116,'PAY-20250731043014-ED5745','credit_card',926.34,'GBP','pending','{\"transaction_id\":\"UA6606WT7974\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"8810\",\"brand\":\"discover\"},\"billing_details\":{\"name\":\"Frieda O\'Hara II\",\"email\":\"alvis56@yahoo.com\",\"address\":{\"line1\":\"45279 Kuhn Harbor\",\"city\":\"Muellerville\",\"country\":\"GP\",\"postal_code\":\"10040\"}}}',NULL,NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(172,176,132,'PAY-20250731043014-D2DE12','apple_pay',356.18,'GBP','completed','{\"transaction_id\":\"IG7948NK9556\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Millie Olson\",\"email\":\"eve49@oberbrunner.info\",\"address\":{\"line1\":\"79959 Gussie Gateway\",\"city\":\"Lake Emmetburgh\",\"country\":\"PK\",\"postal_code\":\"59671-7121\"}}}','2025-07-24 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(173,177,132,'PAY-20250731043014-FEC41A','stripe',598.24,'GBP','completed','{\"transaction_id\":\"UY4971XS9410\",\"payment_method_details\":{\"type\":\"stripe\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Cameron Rempel MD\",\"email\":\"stoltenberg.teresa@hotmail.com\",\"address\":{\"line1\":\"8473 Hirthe Walk\",\"city\":\"Natalieside\",\"country\":\"BI\",\"postal_code\":\"62228\"}}}','2025-07-28 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(177,182,134,'PAY-20250731043014-FA2E11','stripe',408.39,'EUR','completed','{\"transaction_id\":\"XE4496NG6033\",\"payment_method_details\":{\"type\":\"stripe\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Maudie Sporer\",\"email\":\"brown.collin@boehm.com\",\"address\":{\"line1\":\"787 Heidenreich Lodge Suite 953\",\"city\":\"West Vallie\",\"country\":\"SJ\",\"postal_code\":\"97889-9701\"}}}','2025-07-29 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(178,182,134,'PAY-20250731043014-5D7A95','apple_pay',408.39,'EUR','failed','{\"transaction_id\":\"XC7818BO5935\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Sharon Dach\",\"email\":\"milo.champlin@mante.com\",\"address\":{\"line1\":\"83615 Grady Villages\",\"city\":\"New Jennyfer\",\"country\":\"LS\",\"postal_code\":\"97310\"}}}',NULL,NULL,'2025-08-01 01:30:13','2025-08-01 01:30:13'),
(201,206,144,'PAY-20250731043014-1FFFF8','apple_pay',908.58,'GBP','completed','{\"transaction_id\":\"DL3429PZ9300\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Jazmin Schinner\",\"email\":\"consuelo.carroll@baumbach.com\",\"address\":{\"line1\":\"4539 Corwin Summit\",\"city\":\"North Aliborough\",\"country\":\"BI\",\"postal_code\":\"94606-8716\"}}}','2025-07-24 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(206,211,146,'PAY-20250731043014-E54B6B','bank_transfer',611.55,'GBP','completed','{\"transaction_id\":\"SW8723UQ4870\",\"payment_method_details\":{\"type\":\"bank_transfer\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Guillermo Hodkiewicz\",\"email\":\"yazmin.ledner@gmail.com\",\"address\":{\"line1\":\"58610 Ruecker Track\",\"city\":\"Port Justus\",\"country\":\"CU\",\"postal_code\":\"59244\"}}}','2025-07-28 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(214,222,150,'PAY-20250731043014-87E19B','apple_pay',767.52,'USD','completed','{\"transaction_id\":\"YL5889AQ7929\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Mr. Uriah Ledner\",\"email\":\"amaya.simonis@schmidt.com\",\"address\":{\"line1\":\"9284 Hirthe Fort\",\"city\":\"Waelchiside\",\"country\":\"MO\",\"postal_code\":\"38827\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(215,223,152,'PAY-20250731043014-14C1F2','credit_card',772.70,'USD','completed','{\"transaction_id\":\"AW3504XN3208\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"2668\",\"brand\":\"mastercard\"},\"billing_details\":{\"name\":\"Dr. Angelita Altenwerth\",\"email\":\"bruen.lonny@hand.com\",\"address\":{\"line1\":\"395 Mike Meadows Apt. 151\",\"city\":\"Lake Aryanna\",\"country\":\"GF\",\"postal_code\":\"01893\"}}}','2025-07-29 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(216,224,152,'PAY-20250731043014-9C9B6F','credit_card',336.28,'GBP','completed','{\"transaction_id\":\"IC5106UU7386\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"3961\",\"brand\":\"mastercard\"},\"billing_details\":{\"name\":\"Mrs. Corrine Schmidt Jr.\",\"email\":\"garrick87@gmail.com\",\"address\":{\"line1\":\"69802 Kulas Plains Suite 388\",\"city\":\"Nienowberg\",\"country\":\"AT\",\"postal_code\":\"48948\"}}}','2025-07-28 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(222,232,158,'PAY-20250731043014-2912BC','bank_transfer',846.74,'GBP','completed','{\"transaction_id\":\"ZT1618GD6565\",\"payment_method_details\":{\"type\":\"bank_transfer\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Kathleen Pacocha\",\"email\":\"allan.wisozk@kulas.org\",\"address\":{\"line1\":\"11399 Mann Hill Suite 775\",\"city\":\"Flatleystad\",\"country\":\"GD\",\"postal_code\":\"48005\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(223,233,158,'PAY-20250731043014-A587B4','paypal',86.71,'USD','completed','{\"transaction_id\":\"AZ9567XL4215\",\"payment_method_details\":{\"type\":\"paypal\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Jamaal Daniel\",\"email\":\"octavia.sanford@hotmail.com\",\"address\":{\"line1\":\"13506 Russ Drives\",\"city\":\"Lourdesmouth\",\"country\":\"LA\",\"postal_code\":\"55331-6166\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(270,276,182,'PAY-20250731043014-D3EA36','paypal',919.44,'EUR','completed','{\"transaction_id\":\"BV2213QU9084\",\"payment_method_details\":{\"type\":\"paypal\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Jocelyn Hessel\",\"email\":\"hstoltenberg@yahoo.com\",\"address\":{\"line1\":\"532 Cummings Square\",\"city\":\"Volkmanhaven\",\"country\":\"DK\",\"postal_code\":\"72391\"}}}','2025-07-28 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(280,288,186,'PAY-20250731043014-52166B','google_pay',555.09,'USD','completed','{\"transaction_id\":\"AH9983BJ2133\",\"payment_method_details\":{\"type\":\"google_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"America Marquardt\",\"email\":\"purdy.mckenna@yahoo.com\",\"address\":{\"line1\":\"2522 Conroy Prairie\",\"city\":\"Cassinview\",\"country\":\"GR\",\"postal_code\":\"97823-6751\"}}}','2025-07-27 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(281,289,186,'PAY-20250731043014-566B75','credit_card',489.93,'EUR','pending','{\"transaction_id\":\"JS2068LC8913\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"8517\",\"brand\":\"visa\"},\"billing_details\":{\"name\":\"Dr. Belle Wuckert DVM\",\"email\":\"omante@yahoo.com\",\"address\":{\"line1\":\"30605 Schamberger Alley\",\"city\":\"East Eusebio\",\"country\":\"ST\",\"postal_code\":\"33687\"}}}',NULL,NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(296,304,194,'PAY-20250731043014-9DE8A4','credit_card',851.49,'GBP','completed','{\"transaction_id\":\"BU5929MG6803\",\"payment_method_details\":{\"type\":\"credit_card\",\"last4\":\"2093\",\"brand\":\"amex\"},\"billing_details\":{\"name\":\"Dr. Robbie Fritsch Sr.\",\"email\":\"bwitting@yahoo.com\",\"address\":{\"line1\":\"54133 Percival Grove\",\"city\":\"Spinkahaven\",\"country\":\"TM\",\"postal_code\":\"85302-0761\"}}}','2025-07-28 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(306,313,200,'PAY-20250731043014-AE934D','apple_pay',882.84,'EUR','completed','{\"transaction_id\":\"DW5316YC9269\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"German Jakubowski\",\"email\":\"eoreilly@hotmail.com\",\"address\":{\"line1\":\"205 Sporer Summit\",\"city\":\"Ornmouth\",\"country\":\"KH\",\"postal_code\":\"34518\"}}}','2025-07-29 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(317,323,206,'PAY-20250731043014-984398','bank_transfer',955.10,'GBP','completed','{\"transaction_id\":\"YK5595YW5119\",\"payment_method_details\":{\"type\":\"bank_transfer\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Micah Labadie\",\"email\":\"bwalker@yahoo.com\",\"address\":{\"line1\":\"12591 Fay Turnpike Apt. 081\",\"city\":\"West Destini\",\"country\":\"SJ\",\"postal_code\":\"90921\"}}}','2025-07-25 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(325,331,210,'PAY-20250731043014-8F7AB3','stripe',856.07,'EUR','completed','{\"transaction_id\":\"IO7308UY8605\",\"payment_method_details\":{\"type\":\"stripe\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Olen Koelpin\",\"email\":\"barrows.bruce@bayer.biz\",\"address\":{\"line1\":\"11150 Schmeler Plains Apt. 988\",\"city\":\"Nathanielborough\",\"country\":\"KY\",\"postal_code\":\"71340-0180\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(326,332,210,'PAY-20250731043014-BF969C','stripe',401.31,'EUR','completed','{\"transaction_id\":\"KL8770RU1426\",\"payment_method_details\":{\"type\":\"stripe\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Prof. Milford Ward MD\",\"email\":\"steuber.juanita@yahoo.com\",\"address\":{\"line1\":\"113 Humberto Station\",\"city\":\"Jordistad\",\"country\":\"AW\",\"postal_code\":\"42917-6450\"}}}','2025-07-30 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(344,350,216,'PAY-20250731043014-0F65FF','bank_transfer',728.85,'EUR','completed','{\"transaction_id\":\"PZ5725UQ9116\",\"payment_method_details\":{\"type\":\"bank_transfer\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Makenna Sanford\",\"email\":\"aurelio.hill@feeney.com\",\"address\":{\"line1\":\"44076 Hollie Turnpike\",\"city\":\"Keeleyfort\",\"country\":\"MU\",\"postal_code\":\"22747-7629\"}}}','2025-07-24 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(345,351,216,'PAY-20250731043014-D525CA','apple_pay',361.23,'GBP','pending','{\"transaction_id\":\"UX2413YU4323\",\"payment_method_details\":{\"type\":\"apple_pay\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Triston Bode\",\"email\":\"lawrence.crist@ondricka.org\",\"address\":{\"line1\":\"76144 Kuhn River\",\"city\":\"North Carolineside\",\"country\":\"CG\",\"postal_code\":\"26074\"}}}',NULL,NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14'),
(362,371,224,'PAY-20250731043014-EDCD51','stripe',64.50,'EUR','completed','{\"transaction_id\":\"BT4113JU9421\",\"payment_method_details\":{\"type\":\"stripe\",\"last4\":null,\"brand\":null},\"billing_details\":{\"name\":\"Prof. Reanna Gibson III\",\"email\":\"cordelia91@johns.net\",\"address\":{\"line1\":\"17827 Kiley Spring Apt. 103\",\"city\":\"Watsicaberg\",\"country\":\"JM\",\"postal_code\":\"73743-2817\"}}}','2025-07-28 01:30:14',NULL,'2025-07-31 01:30:14','2025-07-31 01:30:14');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `voice_id` bigint(20) unsigned NOT NULL,
  `rating` tinyint(3) unsigned NOT NULL DEFAULT 5,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`comment`)),
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_user_id_voice_id_unique` (`user_id`,`voice_id`),
  KEY `reviews_voice_id_foreign` (`voice_id`),
  CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_voice_id_foreign` FOREIGN KEY (`voice_id`) REFERENCES `voices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES
(1,8,7,3,'{\"en\":\"Consequuntur accusamus fugit enim vero omnis in saepe. Commodi provident qui repellat. Itaque aspernatur aperiam harum debitis aliquam.\",\"bg\":\"БГ: Consequuntur accusamus fugit enim vero omnis in saepe. Commodi provident qui repellat. Itaque aspernatur aperiam harum debitis aliquam.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(12,16,11,3,'{\"en\":\"Sint saepe eum amet fugiat veniam asperiores asperiores. Ut nihil rerum vel quam nisi. Ut maiores ducimus laborum enim nesciunt assumenda nesciunt. Eaque unde modi iste excepturi adipisci minus deleniti.\",\"bg\":\"БГ: Sint saepe eum amet fugiat veniam asperiores asperiores. Ut nihil rerum vel quam nisi. Ut maiores ducimus laborum enim nesciunt assumenda nesciunt. Eaque unde modi iste excepturi adipisci minus deleniti.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(14,17,8,5,'{\"en\":\"Dolore incidunt officia esse est modi. Deleniti illum est laboriosam praesentium repudiandae. Vel vitae nostrum totam laudantium suscipit molestias. Amet et ut consequuntur dolore. Delectus impedit placeat vel vel ab amet.\",\"bg\":\"БГ: Dolore incidunt officia esse est modi. Deleniti illum est laboriosam praesentium repudiandae. Vel vitae nostrum totam laudantium suscipit molestias. Amet et ut consequuntur dolore. Delectus impedit placeat vel vel ab amet.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(23,19,11,5,'{\"en\":\"Qui dolorum rerum beatae neque deleniti quod. Et quia nam aut voluptatem itaque harum nostrum officia. Libero sit cupiditate deserunt magni quam fugiat.\",\"bg\":\"БГ: Qui dolorum rerum beatae neque deleniti quod. Et quia nam aut voluptatem itaque harum nostrum officia. Libero sit cupiditate deserunt magni quam fugiat.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(29,21,6,4,'{\"en\":\"Reprehenderit esse repudiandae odit. Ea autem error dolorem mollitia rerum. Sapiente quos ex dolorem qui. Quibusdam alias nihil quia est ipsa debitis soluta. Architecto pariatur officiis voluptas nobis.\",\"bg\":\"БГ: Reprehenderit esse repudiandae odit. Ea autem error dolorem mollitia rerum. Sapiente quos ex dolorem qui. Quibusdam alias nihil quia est ipsa debitis soluta. Architecto pariatur officiis voluptas nobis.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(38,24,4,3,'{\"en\":\"Enim quibusdam a quisquam cum rerum itaque. Quisquam earum animi velit aut. Quia debitis amet aut error iure quis.\",\"bg\":\"БГ: Enim quibusdam a quisquam cum rerum itaque. Quisquam earum animi velit aut. Quia debitis amet aut error iure quis.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(42,25,4,5,'{\"en\":\"Nam quis quia veniam autem quos. Cupiditate commodi magni occaecati ut repellat. Totam dolores autem et. Cupiditate ad nihil doloremque et sunt eos et.\",\"bg\":\"БГ: Nam quis quia veniam autem quos. Cupiditate commodi magni occaecati ut repellat. Totam dolores autem et. Cupiditate ad nihil doloremque et sunt eos et.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `samples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `samples` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `voice_id` bigint(20) unsigned NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `file_url` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL DEFAULT 'mp3',
  `duration` int(10) unsigned DEFAULT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `samples_voice_id_foreign` (`voice_id`),
  CONSTRAINT `samples_voice_id_foreign` FOREIGN KEY (`voice_id`) REFERENCES `voices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `samples` WRITE;
/*!40000 ALTER TABLE `samples` DISABLE KEYS */;
INSERT INTO `samples` VALUES
(1,1,'{\"en\":\"Dolorum laborum sint ut.\",\"bg\":\"БГ: Dolorum laborum sint ut.\"}','{\"en\":\"Sunt laboriosam voluptatem quod iusto sapiente labore. Ut autem sint accusamus quia.\",\"bg\":\"БГ: Sunt laboriosam voluptatem quod iusto sapiente labore. Ut autem sint accusamus quia.\"}','https://example.com/samples/6cbb9c17-3482-3c1e-a92c-87777913c470.mp3','mp3',245,2875938,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(2,1,'{\"en\":\"Quis quod tempore.\",\"bg\":\"БГ: Quis quod tempore.\"}','{\"en\":\"Pariatur et iusto ullam animi eos necessitatibus odit sunt. Omnis quasi at ea perspiciatis voluptas doloribus atque. Neque dolor non et maiores error. Tempore temporibus et nemo dolorum et.\",\"bg\":\"БГ: Pariatur et iusto ullam animi eos necessitatibus odit sunt. Omnis quasi at ea perspiciatis voluptas doloribus atque. Neque dolor non et maiores error. Tempore temporibus et nemo dolorum et.\"}','https://example.com/samples/34309fa2-3e88-3ba2-9821-a0051c39ac41.ogg','mp3',163,5419152,0,3,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(3,2,'{\"en\":\"Sapiente voluptatibus est.\",\"bg\":\"БГ: Sapiente voluptatibus est.\"}','{\"en\":\"Sint quis corporis repellat qui necessitatibus animi. Quo et dolore quam autem nesciunt a explicabo. Voluptate quo ea aut officiis a in.\",\"bg\":\"БГ: Sint quis corporis repellat qui necessitatibus animi. Quo et dolore quam autem nesciunt a explicabo. Voluptate quo ea aut officiis a in.\"}','https://example.com/samples/c919ea4e-cc4a-33e9-8537-fa9dcc2f4ed6.mp3','m4a',151,7414722,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(4,2,'{\"en\":\"Possimus rerum nihil excepturi.\",\"bg\":\"БГ: Possimus rerum nihil excepturi.\"}','{\"en\":\"Voluptatem vel et in quo amet odio nemo. Incidunt libero ut sit optio quas molestias ea. Animi consequatur aliquid veritatis enim ipsum fuga.\",\"bg\":\"БГ: Voluptatem vel et in quo amet odio nemo. Incidunt libero ut sit optio quas molestias ea. Animi consequatur aliquid veritatis enim ipsum fuga.\"}','https://example.com/samples/75e15fa3-2a6b-3332-b6b7-e1bc47c40522.mp3','mp3',188,5521276,0,58,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(5,2,'{\"en\":\"Architecto nihil aut.\",\"bg\":\"БГ: Architecto nihil aut.\"}','{\"en\":\"Dolore et necessitatibus placeat ut ut. Rem nisi odio suscipit aspernatur dignissimos id pariatur fuga. Fuga fugiat excepturi quibusdam voluptates ea doloribus cupiditate.\",\"bg\":\"БГ: Dolore et necessitatibus placeat ut ut. Rem nisi odio suscipit aspernatur dignissimos id pariatur fuga. Fuga fugiat excepturi quibusdam voluptates ea doloribus cupiditate.\"}','https://example.com/samples/4bfa595e-7e35-3d41-afea-774aea406b69.ogg','ogg',174,2637223,0,58,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(6,2,'{\"en\":\"In in vel dolor reiciendis.\",\"bg\":\"БГ: In in vel dolor reiciendis.\"}','{\"en\":\"Velit quasi quaerat sit. Sint nobis mollitia dignissimos id laboriosam. Numquam sit alias facere qui sint eligendi occaecati tempore. Ut voluptas dolores iusto adipisci tenetur dolorum omnis.\",\"bg\":\"БГ: Velit quasi quaerat sit. Sint nobis mollitia dignissimos id laboriosam. Numquam sit alias facere qui sint eligendi occaecati tempore. Ut voluptas dolores iusto adipisci tenetur dolorum omnis.\"}','https://example.com/samples/0f1269fb-6508-3490-80cc-16695d98bf9f.mp3','wav',106,1527600,0,37,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(7,2,'{\"en\":\"Ea temporibus cum.\",\"bg\":\"БГ: Ea temporibus cum.\"}','{\"en\":\"Dolorum voluptate est expedita deserunt. Vero aut aut odio aliquam aut et non. Eos ut sequi adipisci doloribus quos animi amet.\",\"bg\":\"БГ: Dolorum voluptate est expedita deserunt. Vero aut aut odio aliquam aut et non. Eos ut sequi adipisci doloribus quos animi amet.\"}','https://example.com/samples/1dc03f9a-599c-3171-bd92-9039e124b259.mp3','m4a',245,9244949,0,36,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(8,4,'{\"en\":\"Earum eius maxime.\",\"bg\":\"БГ: Earum eius maxime.\"}','{\"en\":\"Voluptas optio quia eum perferendis. Sed doloremque aut et consectetur vitae quia fugiat soluta. Eum sit in vero consequatur quam. Rerum omnis quia recusandae vel commodi expedita reprehenderit.\",\"bg\":\"БГ: Voluptas optio quia eum perferendis. Sed doloremque aut et consectetur vitae quia fugiat soluta. Eum sit in vero consequatur quam. Rerum omnis quia recusandae vel commodi expedita reprehenderit.\"}','https://example.com/samples/f7282f29-e97b-323b-8033-6403a5bfeccf.m4a','ogg',79,3566785,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(9,5,'{\"en\":\"Harum pariatur ut illo accusantium.\",\"bg\":\"БГ: Harum pariatur ut illo accusantium.\"}','{\"en\":\"Porro enim porro qui nulla ipsam. Sapiente sunt molestias maxime. Natus dolore labore rem quis. Et quaerat non asperiores architecto est.\",\"bg\":\"БГ: Porro enim porro qui nulla ipsam. Sapiente sunt molestias maxime. Natus dolore labore rem quis. Et quaerat non asperiores architecto est.\"}','https://example.com/samples/fd82623c-163e-3e70-8aad-239df73ba37f.m4a','m4a',274,1338560,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(10,5,'{\"en\":\"Eaque nesciunt nesciunt molestiae.\",\"bg\":\"БГ: Eaque nesciunt nesciunt molestiae.\"}','{\"en\":\"Voluptate provident molestiae deleniti doloremque porro. Architecto eos sed delectus. Dolore reiciendis eos minima nemo rerum dolorum ut libero.\",\"bg\":\"БГ: Voluptate provident molestiae deleniti doloremque porro. Architecto eos sed delectus. Dolore reiciendis eos minima nemo rerum dolorum ut libero.\"}','https://example.com/samples/410313f1-b2ca-32a4-ab99-6be59af73e20.wav','ogg',133,2393679,0,39,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(11,5,'{\"en\":\"Consequatur dignissimos fugiat.\",\"bg\":\"БГ: Consequatur dignissimos fugiat.\"}','{\"en\":\"Qui dolorem eveniet magnam id aut. Sunt doloremque nulla a minus ipsum. Qui expedita laborum exercitationem. Sit aliquid voluptatem est corporis.\",\"bg\":\"БГ: Qui dolorem eveniet magnam id aut. Sunt doloremque nulla a minus ipsum. Qui expedita laborum exercitationem. Sit aliquid voluptatem est corporis.\"}','https://example.com/samples/4c54039c-6ad1-3db2-a09f-bfafaa7dcb28.ogg','ogg',161,4232954,0,38,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(12,6,'{\"en\":\"Rerum numquam ut animi.\",\"bg\":\"БГ: Rerum numquam ut animi.\"}','{\"en\":\"Beatae eum voluptatem qui id voluptas voluptatum aliquid. Natus est laudantium quae. Dicta dolores quas impedit qui et expedita enim. Corporis quam commodi optio at provident voluptas.\",\"bg\":\"БГ: Beatae eum voluptatem qui id voluptas voluptatum aliquid. Natus est laudantium quae. Dicta dolores quas impedit qui et expedita enim. Corporis quam commodi optio at provident voluptas.\"}','https://example.com/samples/ac5963d0-1ec6-3159-ab0e-7b49d0e830e3.wav','m4a',275,7978387,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(13,6,'{\"en\":\"Et et aut.\",\"bg\":\"БГ: Et et aut.\"}','{\"en\":\"Harum est accusantium veritatis sed rem facilis iste velit. Ab eum sequi sint dicta beatae est quam. Neque dolores inventore laborum exercitationem iure ea et.\",\"bg\":\"БГ: Harum est accusantium veritatis sed rem facilis iste velit. Ab eum sequi sint dicta beatae est quam. Neque dolores inventore laborum exercitationem iure ea et.\"}','https://example.com/samples/3021b83f-839f-3278-bb6a-5d9de44dc9fd.ogg','mp3',212,3807271,0,63,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(14,6,'{\"en\":\"Similique dolore laborum.\",\"bg\":\"БГ: Similique dolore laborum.\"}','{\"en\":\"Quae sunt similique asperiores. Illum quae omnis ipsa soluta sit voluptatem. Laborum ipsum repellat ut natus possimus error. Quae nulla veniam voluptate. Eligendi reprehenderit ut pariatur.\",\"bg\":\"БГ: Quae sunt similique asperiores. Illum quae omnis ipsa soluta sit voluptatem. Laborum ipsum repellat ut natus possimus error. Quae nulla veniam voluptate. Eligendi reprehenderit ut pariatur.\"}','https://example.com/samples/a02c3922-ed58-3239-8c9a-77c323b9eb3c.m4a','m4a',222,1076738,0,4,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(15,7,'{\"en\":\"Nisi eius quam ullam.\",\"bg\":\"БГ: Nisi eius quam ullam.\"}','{\"en\":\"Ut minus enim eos delectus autem accusantium. Iure nostrum impedit doloribus in voluptates. Facilis illo dolor reprehenderit accusamus. Distinctio dolores et perferendis quia.\",\"bg\":\"БГ: Ut minus enim eos delectus autem accusantium. Iure nostrum impedit doloribus in voluptates. Facilis illo dolor reprehenderit accusamus. Distinctio dolores et perferendis quia.\"}','https://example.com/samples/cec42cc5-593d-3ee3-b3d4-21c3e556105a.ogg','ogg',112,7639834,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(16,7,'{\"en\":\"Aliquam ad veniam.\",\"bg\":\"БГ: Aliquam ad veniam.\"}','{\"en\":\"Sed sit neque id provident quaerat. Et aut in dolor et. Reprehenderit quis cumque ea quisquam iusto vel ut. Et eos quia dignissimos recusandae omnis et at distinctio.\",\"bg\":\"БГ: Sed sit neque id provident quaerat. Et aut in dolor et. Reprehenderit quis cumque ea quisquam iusto vel ut. Et eos quia dignissimos recusandae omnis et at distinctio.\"}','https://example.com/samples/e007589f-56c1-316b-a67c-155a84d821c7.wav','m4a',113,9909580,0,90,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(17,7,'{\"en\":\"Velit consequatur excepturi.\",\"bg\":\"БГ: Velit consequatur excepturi.\"}','{\"en\":\"Officia ut quia ut aut. Est eum repudiandae id culpa aut tempora ut. Consequatur dolorem dolore est natus eaque voluptatem.\",\"bg\":\"БГ: Officia ut quia ut aut. Est eum repudiandae id culpa aut tempora ut. Consequatur dolorem dolore est natus eaque voluptatem.\"}','https://example.com/samples/09374259-aae9-3c03-b5ac-53f6218cd3d8.ogg','mp3',37,2018889,0,16,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(18,7,'{\"en\":\"Sequi ea illo nesciunt.\",\"bg\":\"БГ: Sequi ea illo nesciunt.\"}','{\"en\":\"Quis corporis laudantium autem alias. Architecto et quidem sint cupiditate et dolores tempora. Et rerum eos modi et aspernatur.\",\"bg\":\"БГ: Quis corporis laudantium autem alias. Architecto et quidem sint cupiditate et dolores tempora. Et rerum eos modi et aspernatur.\"}','https://example.com/samples/cc68388d-1988-3497-9ca0-a2facc1436fe.wav','wav',68,6153395,0,51,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(19,8,'{\"en\":\"Quos sint neque.\",\"bg\":\"БГ: Quos sint neque.\"}','{\"en\":\"Sunt perspiciatis pariatur illo sapiente placeat et. Quis voluptatem quaerat modi totam dolorum consectetur.\",\"bg\":\"БГ: Sunt perspiciatis pariatur illo sapiente placeat et. Quis voluptatem quaerat modi totam dolorum consectetur.\"}','https://example.com/samples/c8a66800-af8b-3295-9185-4730265308ca.wav','m4a',61,3803553,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(20,9,'{\"en\":\"Cupiditate voluptatem.\",\"bg\":\"БГ: Cupiditate voluptatem.\"}','{\"en\":\"Omnis totam a laboriosam ipsa ullam ipsa. Deserunt veritatis distinctio quasi non autem sapiente. Repellendus omnis voluptas qui quidem. Consequuntur et aut ut quasi excepturi aut dignissimos. Repellendus tempore sunt odio dignissimos.\",\"bg\":\"БГ: Omnis totam a laboriosam ipsa ullam ipsa. Deserunt veritatis distinctio quasi non autem sapiente. Repellendus omnis voluptas qui quidem. Consequuntur et aut ut quasi excepturi aut dignissimos. Repellendus tempore sunt odio dignissimos.\"}','https://example.com/samples/b421d257-fd9b-38f4-bd29-fb31c1c3c1ce.wav','ogg',32,7626358,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(21,9,'{\"en\":\"Impedit asperiores recusandae quas.\",\"bg\":\"БГ: Impedit asperiores recusandae quas.\"}','{\"en\":\"Nesciunt impedit ipsum sint aut. Qui tempora autem eos nisi voluptates. Dolorem et unde unde doloribus optio. Optio vero exercitationem amet natus adipisci corporis. Harum qui quam sunt ullam et eum rerum.\",\"bg\":\"БГ: Nesciunt impedit ipsum sint aut. Qui tempora autem eos nisi voluptates. Dolorem et unde unde doloribus optio. Optio vero exercitationem amet natus adipisci corporis. Harum qui quam sunt ullam et eum rerum.\"}','https://example.com/samples/8b5a4af8-f441-30c9-9d3a-424c328ace41.ogg','m4a',147,2077783,0,98,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(22,9,'{\"en\":\"Labore saepe similique quasi.\",\"bg\":\"БГ: Labore saepe similique quasi.\"}','{\"en\":\"Ipsam at explicabo autem quod mollitia molestiae numquam velit. Aut reiciendis minus enim ea. Nemo vel ut et eligendi necessitatibus explicabo. Et quam quaerat eum odio quidem.\",\"bg\":\"БГ: Ipsam at explicabo autem quod mollitia molestiae numquam velit. Aut reiciendis minus enim ea. Nemo vel ut et eligendi necessitatibus explicabo. Et quam quaerat eum odio quidem.\"}','https://example.com/samples/2b7344e2-4a70-3caf-8361-1e3b2b753f03.wav','mp3',167,5141604,0,21,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(23,9,'{\"en\":\"Dignissimos illo aperiam.\",\"bg\":\"БГ: Dignissimos illo aperiam.\"}','{\"en\":\"Mollitia ut perspiciatis quia consequuntur. At possimus ut quisquam fugiat. Magnam voluptas numquam laudantium rerum. Aut dolores ullam fuga vel dolorum eos voluptatem. Qui enim illo omnis vel.\",\"bg\":\"БГ: Mollitia ut perspiciatis quia consequuntur. At possimus ut quisquam fugiat. Magnam voluptas numquam laudantium rerum. Aut dolores ullam fuga vel dolorum eos voluptatem. Qui enim illo omnis vel.\"}','https://example.com/samples/db60c757-8d75-3c3d-9d5d-f8b71feff76a.wav','m4a',208,9540723,0,54,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(24,9,'{\"en\":\"Omnis provident eaque eligendi.\",\"bg\":\"БГ: Omnis provident eaque eligendi.\"}','{\"en\":\"Reiciendis sit quas quia ducimus. Cupiditate id recusandae voluptas hic qui maiores alias. Aperiam eum recusandae omnis porro. Rem quasi sed aut rem.\",\"bg\":\"БГ: Reiciendis sit quas quia ducimus. Cupiditate id recusandae voluptas hic qui maiores alias. Aperiam eum recusandae omnis porro. Rem quasi sed aut rem.\"}','https://example.com/samples/84113ba4-7d9e-31a5-955a-2c9f429cfb55.wav','wav',134,6190106,0,93,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(25,10,'{\"en\":\"Perspiciatis pariatur laudantium.\",\"bg\":\"БГ: Perspiciatis pariatur laudantium.\"}','{\"en\":\"Magnam alias consequuntur amet tempora unde sunt id explicabo. Excepturi quia rem ut sed exercitationem commodi. Eveniet nemo quibusdam earum eum qui id explicabo.\",\"bg\":\"БГ: Magnam alias consequuntur amet tempora unde sunt id explicabo. Excepturi quia rem ut sed exercitationem commodi. Eveniet nemo quibusdam earum eum qui id explicabo.\"}','https://example.com/samples/363a5b1f-79d0-348a-990f-453d60baaa08.wav','ogg',262,3828257,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(26,11,'{\"en\":\"Natus aspernatur.\",\"bg\":\"БГ: Natus aspernatur.\"}','{\"en\":\"Est quo saepe cum autem sit ipsum nostrum. Architecto inventore nihil iusto voluptatibus facere. Laborum quaerat unde qui quia quia expedita. Voluptate atque omnis id.\",\"bg\":\"БГ: Est quo saepe cum autem sit ipsum nostrum. Architecto inventore nihil iusto voluptatibus facere. Laborum quaerat unde qui quia quia expedita. Voluptate atque omnis id.\"}','https://example.com/samples/57cc6af2-8251-3fee-b91c-3d1d03898f9c.m4a','mp3',181,6180477,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(27,11,'{\"en\":\"Delectus provident quidem.\",\"bg\":\"БГ: Delectus provident quidem.\"}','{\"en\":\"Qui dicta ea perspiciatis perspiciatis et in. Nisi sit aut dolores architecto natus. Excepturi ex deleniti nesciunt aut enim ut.\",\"bg\":\"БГ: Qui dicta ea perspiciatis perspiciatis et in. Nisi sit aut dolores architecto natus. Excepturi ex deleniti nesciunt aut enim ut.\"}','https://example.com/samples/c2236cb2-a434-33c9-b05b-3150d1d6d714.ogg','ogg',55,1093887,0,88,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(28,11,'{\"en\":\"Aut blanditiis omnis.\",\"bg\":\"БГ: Aut blanditiis omnis.\"}','{\"en\":\"Sapiente qui voluptatem voluptas praesentium molestiae. Aut dolore quis modi libero hic quam. Sequi autem aut occaecati deserunt est aut a.\",\"bg\":\"БГ: Sapiente qui voluptatem voluptas praesentium molestiae. Aut dolore quis modi libero hic quam. Sequi autem aut occaecati deserunt est aut a.\"}','https://example.com/samples/eb2fbe4d-4d8a-3a27-83f6-b57c63fcc179.wav','ogg',113,6802436,0,89,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(29,12,'{\"en\":\"Commodi iure quia voluptas.\",\"bg\":\"БГ: Commodi iure quia voluptas.\"}','{\"en\":\"Qui ea ut nemo sapiente in et. Sed non labore perferendis qui enim nostrum. Labore corporis mollitia quam modi fugiat qui.\",\"bg\":\"БГ: Qui ea ut nemo sapiente in et. Sed non labore perferendis qui enim nostrum. Labore corporis mollitia quam modi fugiat qui.\"}','https://example.com/samples/ab4d74e5-08e7-3d00-9b3c-b03acd6f570a.ogg','ogg',149,2803295,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(30,12,'{\"en\":\"Pariatur voluptas labore.\",\"bg\":\"БГ: Pariatur voluptas labore.\"}','{\"en\":\"Odio exercitationem enim ipsam eum ut ab nihil. Qui explicabo voluptatem consequuntur et eius soluta. Consequatur tempore maxime magni consequuntur voluptatibus. Totam praesentium quas ut impedit.\",\"bg\":\"БГ: Odio exercitationem enim ipsam eum ut ab nihil. Qui explicabo voluptatem consequuntur et eius soluta. Consequatur tempore maxime magni consequuntur voluptatibus. Totam praesentium quas ut impedit.\"}','https://example.com/samples/4a940520-99e0-3038-a55a-e4dfebc711f2.mp3','m4a',128,5302263,0,32,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(31,13,'{\"en\":\"Eum tempore qui laborum.\",\"bg\":\"БГ: Eum tempore qui laborum.\"}','{\"en\":\"Voluptas consequatur totam eius. Animi est ad blanditiis aut doloribus fugit voluptas corporis. Eveniet qui necessitatibus perferendis. Nihil eaque dicta dolor qui sit. Est sunt et vel fugit.\",\"bg\":\"БГ: Voluptas consequatur totam eius. Animi est ad blanditiis aut doloribus fugit voluptas corporis. Eveniet qui necessitatibus perferendis. Nihil eaque dicta dolor qui sit. Est sunt et vel fugit.\"}','https://example.com/samples/d729a511-a6dc-3c7a-951c-4dba0a289e21.wav','m4a',37,4512107,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(32,13,'{\"en\":\"Delectus ex eum molestiae.\",\"bg\":\"БГ: Delectus ex eum molestiae.\"}','{\"en\":\"Beatae eum et est. Et ut cumque doloribus delectus.\",\"bg\":\"БГ: Beatae eum et est. Et ut cumque doloribus delectus.\"}','https://example.com/samples/9954eee6-6347-326f-aead-7a0deca5e931.mp3','m4a',247,4756054,0,96,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(33,16,'{\"en\":\"Quidem nemo id.\",\"bg\":\"БГ: Quidem nemo id.\"}','{\"en\":\"Provident odit aperiam velit doloremque eveniet dignissimos. Cupiditate atque sed temporibus inventore. Et est ipsa et dolorem.\",\"bg\":\"БГ: Provident odit aperiam velit doloremque eveniet dignissimos. Cupiditate atque sed temporibus inventore. Et est ipsa et dolorem.\"}','https://example.com/samples/880e996e-b1f7-3d7e-b4df-dff971180912.m4a','m4a',195,9253735,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(34,16,'{\"en\":\"Quo amet veritatis et.\",\"bg\":\"БГ: Quo amet veritatis et.\"}','{\"en\":\"Sit et doloremque quos nemo doloribus ut. Provident fugiat debitis id eius eveniet quisquam. Ea tempore sunt quis ad inventore earum qui.\",\"bg\":\"БГ: Sit et doloremque quos nemo doloribus ut. Provident fugiat debitis id eius eveniet quisquam. Ea tempore sunt quis ad inventore earum qui.\"}','https://example.com/samples/f017e9ba-6206-3e7b-bd9d-392971fa67fc.wav','wav',60,5271659,0,43,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(35,16,'{\"en\":\"Omnis soluta et.\",\"bg\":\"БГ: Omnis soluta et.\"}','{\"en\":\"Quam et porro non harum excepturi quaerat aut. Tenetur consequuntur id asperiores ullam ex. Sit deserunt sunt laudantium a dolorum aut nostrum. Et deserunt sapiente nihil blanditiis necessitatibus et.\",\"bg\":\"БГ: Quam et porro non harum excepturi quaerat aut. Tenetur consequuntur id asperiores ullam ex. Sit deserunt sunt laudantium a dolorum aut nostrum. Et deserunt sapiente nihil blanditiis necessitatibus et.\"}','https://example.com/samples/3d1d1425-2068-399e-ac9f-48cd56dd3095.m4a','mp3',145,9273883,0,32,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(36,16,'{\"en\":\"Accusamus soluta eum illum.\",\"bg\":\"БГ: Accusamus soluta eum illum.\"}','{\"en\":\"Sed quo et repudiandae non dolore aperiam eaque. Omnis commodi modi qui sequi pariatur laudantium esse. Nostrum voluptates minus qui consequatur aut nihil. Dolores perferendis aut in repudiandae omnis.\",\"bg\":\"БГ: Sed quo et repudiandae non dolore aperiam eaque. Omnis commodi modi qui sequi pariatur laudantium esse. Nostrum voluptates minus qui consequatur aut nihil. Dolores perferendis aut in repudiandae omnis.\"}','https://example.com/samples/b2add7b3-1026-337f-b66b-244b5917d16b.m4a','mp3',89,6136061,0,98,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(37,16,'{\"en\":\"Quia odit atque voluptas.\",\"bg\":\"БГ: Quia odit atque voluptas.\"}','{\"en\":\"Corrupti explicabo et praesentium rerum dolore molestiae unde. Consequatur itaque praesentium aut voluptatem. Et numquam quisquam enim aperiam.\",\"bg\":\"БГ: Corrupti explicabo et praesentium rerum dolore molestiae unde. Consequatur itaque praesentium aut voluptatem. Et numquam quisquam enim aperiam.\"}','https://example.com/samples/b9bc0938-9fec-3980-8e04-ae5ae89cc19d.mp3','m4a',272,8899381,0,90,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(38,17,'{\"en\":\"Optio pariatur eos dolorum.\",\"bg\":\"БГ: Optio pariatur eos dolorum.\"}','{\"en\":\"Doloribus sint explicabo tempora quae odio. Nulla ut qui eos nihil est explicabo. Dolor error est ut possimus. Dolores in quidem quisquam sequi.\",\"bg\":\"БГ: Doloribus sint explicabo tempora quae odio. Nulla ut qui eos nihil est explicabo. Dolor error est ut possimus. Dolores in quidem quisquam sequi.\"}','https://example.com/samples/25dd1215-c1a2-3271-a00c-63b454738862.wav','m4a',200,3135086,1,1,'2025-07-31 01:30:13','2025-07-31 01:30:13');
/*!40000 ALTER TABLE `samples` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
('ZkflBFRA4U0Z0TSHUlZCJVGbDcNeOsC4G5bzuovw',1,'127.0.0.1','Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiY1YzbzIxeVhTZ0pzWDNKR0ZTYUpTTU9pRVIyRkRqQWtuSjdLTDVsciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vdm9pY2UudGVzdC9lbi92b2ljZXMiO31zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9',1756208512);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('artist','client','admin','dev') NOT NULL DEFAULT 'client',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Валентин Цанев','fireball70@gmail.com','dev',NULL,'$2y$12$5m5WHtSCK0kzDQpDw0zuGeCwXyImJ.gNXHvwAJ81roD3MPa5J12U.',NULL,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(2,'Красимир Дяков','lote.audio.project@gmail.com','admin',NULL,'$2y$12$PSN9CSVjm4lFuE9t2XegdOzqXBgd9MoUYB8zmTdWjpDvLIF.8y/Gy',NULL,'2025-07-31 01:30:11','2025-07-31 01:30:11'),
(3,'John Smith','john@example.com','artist',NULL,'$2y$12$TMTbmItPdzo6a7HYbaTOfeLP6Lx/YxOEWdL0iTGbB/LaMBpkE9zb2',NULL,'2025-07-31 01:30:12','2025-07-31 01:30:12'),
(4,'Jane Doe','jane@example.com','artist',NULL,'$2y$12$EjADyD/WBbhy0gPbru8DPePWd5k6g2Z7ia96H3k1lid3HciJIzuiO',NULL,'2025-07-31 01:30:12','2025-07-31 01:30:12'),
(5,'Michael Johnson','michael@example.com','artist',NULL,'$2y$12$4XZud7dJ2.J6J4utvikLpunfJWKlU2YbvnoxYRGtJAfP5odkh8DsG',NULL,'2025-07-31 01:30:12','2025-07-31 01:30:12'),
(6,'Emily Wilson','emily@example.com','artist',NULL,'$2y$12$y1t194P.cL.52UfpP8kJBeK7ga2qt8ho9j5jHiYw4UEyjHL5.hGVG',NULL,'2025-07-31 01:30:12','2025-07-31 01:30:12'),
(7,'David Brown','david@example.com','artist',NULL,'$2y$12$SEyOax7A6Ed7N3B1Q1pVqeMNW.S2MZ6J1r5Fu5qXcDPnbEDcez7WK',NULL,'2025-07-31 01:30:12','2025-07-31 01:30:12'),
(8,'Sarah Miller','sarah@example.com','client',NULL,'$2y$12$bGv7Ep7c2yZHrQcmda.Knu4catrqVX8tvGkm8ylErcC7vsek7As5e',NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(9,'Robert Davis','robert@example.com','client',NULL,'$2y$12$dwnK0KwkKlIRZThcibayiOZ0/KjNjrJCSctm9iuAQ60Fklr0jXmNy',NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(10,'Jennifer Garcia','jennifer@example.com','client',NULL,'$2y$12$eGmPDVEBNymypQgfyvlqiecSFmTr8PAs8eaEkwl3tk81tIui0ne36',NULL,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(11,'Miss Arlene Howe MD','mpollich@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','G1fjsvvgvl','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(12,'Vella Collins','mlebsack@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','4kt99c2hB6','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(13,'Mack Gutkowski','kaitlin.rutherford@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','uxcCEzHcRV','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(14,'Mr. Amparo Howe','uhintz@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','9hz9NFeAEA','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(15,'Peter Klein III','juston.skiles@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','8tbMdzQCH0','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(16,'Prof. Gabe O\'Keefe','wyman.vella@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','ARuNmWD8IK','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(17,'Mr. Armando McClure','zweimann@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','sOjGEcs4RA','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(18,'Fabian Hayes IV','orogahn@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','DFkiJTCeCb','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(19,'Asha Yundt','jast.jason@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','SLZxMWT6gK','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(20,'Dr. Jonathon Koss DVM','jefferey.pagac@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','JTAom4Px73','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(21,'Helmer Roberts','frieda.nikolaus@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Kp5ZxdGImk','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(22,'Dr. Alexys Nader III','alyson.orn@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','vOZpZXPcpg','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(23,'Jasen Bednar','zieme.peter@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Qo1PWlr80j','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(24,'Damien Farrell','alisha69@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','q9doKViQre','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(25,'Dr. Asha Satterfield','melyna.white@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','dY55lB8dwL','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(26,'Mr. Johnathon Runolfsdottir','kunde.westley@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','GDdXrRv44C','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(27,'Dr. Viva Veum','berge.patrick@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','DgnF2SGMDY','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(28,'Tabitha Pollich V','earmstrong@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','jYrBiYNS16','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(29,'Chaya Sawayn','bward@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','R9kmVeoCAy','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(30,'Miss Lulu Bahringer MD','ettie.howell@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Mgsg1qXlf3','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(31,'Kale Hyatt','hamill.sadie@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','usoTvzpE6D','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(32,'Dr. Rocio Kerluke DVM','candice.beatty@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','93xdELieqL','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(33,'Oswaldo Erdman','lhirthe@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','QkPbKDbIqN','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(34,'Garnett Rogahn','ernesto86@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','EbhRJ0fe6Q','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(35,'Andrew Legros','ihettinger@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','RtrC1xIpuj','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(36,'Dr. Mayra Lockman V','tyrel.friesen@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','b849zDhifR','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(37,'Elyssa Mueller','macejkovic.ila@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','5GAfhaFdzJ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(38,'Lorna Smith','ohara.grayson@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','mr0Opvh9pu','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(39,'Sheila Stehr','krau@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','xGt1x4gCx8','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(40,'Dr. Alysa McCullough IV','herzog.katherine@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','A1zxrTS7P1','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(41,'Ms. Ashlee Kuvalis','king.keebler@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','0EXYJ7KzLc','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(42,'Burdette Trantow DDS','armstrong.alessandro@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','UbegatiEef','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(43,'Shane Rodriguez','candido.leuschke@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','UQ73EOYNDN','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(44,'Dax Witting','kfritsch@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','8WXZ8c7f0C','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(45,'Enoch Metz','ferne.bartell@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','cudmIfnUEB','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(46,'Mr. Ephraim Wolff','karine38@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','lLniHqYR3g','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(47,'Mr. Taylor Leffler DVM','oauer@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Ucpq4ZML8X','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(48,'Peggie Daniel','alison.damore@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','UmIpDcRYwP','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(49,'Gay Stehr','asenger@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','IMbaLSjZtz','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(50,'Prof. Hillard Murazik','emmanuelle.cruickshank@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','hwDva5bbqk','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(51,'Breana Cassin MD','janick.miller@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','9ywcbEv7Vu','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(52,'Elmo Paucek','mertz.craig@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','AANdBXu8Ib','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(53,'Trudie Crist','mpredovic@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','EXseZXAXUK','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(54,'Vernon Lemke','xbraun@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','D9ZpRwbo7j','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(55,'Garret Brekke','stacy.mann@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','5vkSO6zZh4','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(56,'Prof. Josue Schmitt','feeney.shea@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','wI89ZAGK1n','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(57,'Howard Dickens','braden02@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Lzp5FP6VXx','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(58,'Bobby Harber','deonte51@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','vtFVNmlMRa','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(59,'Emelia Cassin','uriah81@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','jyVcAWhnkj','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(60,'Carlos Kling','crist.ila@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','vHKXWtbUJg','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(61,'Dr. Nigel Weissnat','wwyman@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','KREwlKbI9i','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(62,'Guy Heidenreich','ortiz.roel@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','sW8cMZiAEu','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(63,'Phyllis Murray','fdietrich@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','h3qCqtBVss','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(64,'Prof. Bernita Ruecker','oklein@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','D8fW6ui5gH','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(65,'Mr. Madison Ryan','bgislason@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','rywBriekni','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(66,'Micah Watsica','wade39@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','KFT82kIMMK','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(67,'Katelynn Pacocha','nschimmel@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','NPf8qQK9wh','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(68,'Shemar Hartmann','percival07@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','kj675xnE4X','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(69,'Travis Brakus','dayton.pouros@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','C6BHfY35W9','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(70,'Jeffrey Mitchell','upton.kaitlin@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','rPx2TetpiF','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(71,'Douglas Kub','kcormier@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Rn1CHloyIq','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(72,'Ms. Estrella Jast','schulist.jayne@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','wTgDwyYYdj','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(73,'Aileen Wuckert','gterry@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','6C48V6cuxi','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(74,'Rickey Fisher','opal53@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','X7LuXNONWb','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(75,'Ryley Streich','charvey@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','BOshVY9FIu','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(76,'Lexie McKenzie IV','jacobi.oleta@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Y8BJH6HycA','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(77,'Shanie Wisoky','casper.lafayette@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','NcmJDz9Hrt','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(78,'Ron Wehner','kerluke.alize@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','nJvcfkhGWX','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(79,'Miss Damaris Kling III','queen.herzog@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','jqSrt9oobf','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(80,'Nikita Reilly','libbie60@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','px242NpBj4','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(81,'Jaeden Hill','ryley.purdy@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','7hbGAdkkql','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(82,'Marlene Rogahn','frenner@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','nScv49hEYg','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(83,'Susanna Klein PhD','lenny.herman@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','hQU5T7GbbR','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(84,'Vidal Ruecker','henriette.mohr@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','K7gswPwPRw','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(85,'Elfrieda Weissnat','mia.nienow@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','BE9MkORrFp','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(86,'Jean Welch','zulauf.irwin@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','cBT1TUkqDv','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(87,'Jackie Crona','rlang@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','swo2Wp7oo6','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(88,'Prof. Chadrick Harber DVM','damon42@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','cZHHbim0pV','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(89,'Sister O\'Keefe','lucius82@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','GpHyFneeyN','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(90,'Alejandra Durgan','sarah.botsford@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','xoXWdSPNKo','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(91,'Craig Howell','swift.johnnie@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','OBvNMsbKKq','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(92,'Lauretta Waters DVM','hobart.smitham@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','8JX3NvDpfS','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(93,'Alfred Harber','ortiz.lucius@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Tw0s6o1HOm','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(94,'Willis Yost','harrison69@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','rPQydWjtac','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(95,'Prof. Darryl Deckow','shany.pfannerstill@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','qxQTvv05b4','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(96,'Selena Cremin','sean94@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','cEUWVuAvpx','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(97,'Ms. Bettye Hahn MD','schamberger.jaida@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','xmfX7g1pp8','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(98,'Dianna Thiel','sroob@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','ZBNvmAUGkR','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(99,'Dandre Gaylord','clarabelle.kilback@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','5jjlwPhfS9','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(100,'Janick Howell','chyna.ratke@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','vIxFvJ2pRv','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(101,'Darrin Bernhard V','asa01@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','3X7G3TKxgh','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(102,'Marjorie Brakus','kling.turner@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','dhsImUNqUL','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(103,'Hoyt Homenick','amitchell@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','J070BRyidl','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(104,'Savanna Torphy','dlockman@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','yWeP2C7d1g','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(105,'Suzanne Murazik','mcclure.frida@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','PVItDfpjRv','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(106,'Ruben Smith','lorine49@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','7YUA6OYbTv','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(107,'Leann Hahn','francisca.howe@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','iAQUi8VxC2','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(108,'Mrs. Petra Macejkovic MD','vfeest@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','pd6bWnqpPq','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(109,'Mr. Aaron Lockman','vickie.flatley@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','tl0tU6cj90','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(110,'Talia Mante','bradtke.jamie@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Cz9u3yqoDP','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(111,'Wilfred Leannon','bkub@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','FQUyXR2Onu','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(112,'Tate Ullrich','hank12@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','fCj41D3dBy','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(113,'Daryl Kuvalis PhD','helene.langosh@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','455bdnJhsz','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(114,'Aliyah Feeney','ondricka.efren@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','g7agMeQk8u','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(115,'Prof. Jeffery Mitchell MD','xschroeder@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','SSF3mwn9zM','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(116,'Leif Carter','gavin00@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','FN4nmmvkGA','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(117,'Dedric Stroman Jr.','crooks.valentine@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','TQuGGO2Ksw','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(118,'Raul Pouros','elroy.hessel@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','FFd0AvWDoT','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(119,'Ms. Reanna Langosh','schultz.frederic@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','7hY22yOMX4','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(120,'Amira Kuhn','omer.rogahn@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','e2L1AnhR86','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(121,'Ricky Mosciski','robel.shakira@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','eRbujeTLOd','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(122,'Mckenzie Rogahn','mateo16@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','oXOWH2vp83','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(123,'Catherine Herman Jr.','nienow.delbert@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','avMMw2wNVv','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(124,'Kaitlin Waters','king34@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','NATMLdq8MI','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(125,'Prof. Heather Schmidt V','sunny83@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','PG9viof0Iv','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(126,'Newton Hettinger DVM','florian.murazik@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Pcgjh9uAMZ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(127,'Prof. Price Schneider Jr.','emmanuel.wehner@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','6cNHBiejnS','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(128,'Ms. Carole Nolan V','kamille.gerhold@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','rpKa4QD3f2','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(129,'Brannon Franecki','irma73@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','x65AWK7uoU','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(130,'Mrs. Audie Green','shanny91@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','u9zwXGzipf','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(131,'Benny Medhurst','spencer.mathias@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','ObhGheX1f4','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(132,'Mr. Tristin Emmerich DVM','unique66@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','r3ojnSWibA','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(133,'Mrs. Brenda Abbott MD','susanna.borer@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','wjJQrrlIDK','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(134,'Francesco Hand','jast.ena@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','pI0HBuUn5Z','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(135,'Henry McCullough I','zruecker@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','zJAk6VC72g','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(136,'Blair Wolff','hhowe@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','WpQjwcj8AN','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(137,'Corine Mann','uchamplin@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','fZPySpdaFM','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(138,'Don Lynch','rosenbaum.anika@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','72jtuPDb3c','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(139,'Prof. Madisen Lehner','furman.wilderman@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','kY0byULDuQ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(140,'Bianka Effertz','gunner.mertz@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','isuoRORuHL','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(141,'Chris Gerhold','richie74@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','lQNs00E6Mc','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(142,'Meta Russel','anastasia.johnson@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','QzV16m7dpn','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(143,'Mrs. Jacklyn Cremin I','qdavis@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','qNwDrq6yNJ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(144,'Telly Terry','kohler.berta@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Gx01Z58sid','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(145,'Reyna Kihn','sofia94@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','6ac0UMMkgQ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(146,'Briana Harber III','ghansen@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','XTVyJI2kM7','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(147,'Wendy Reichel','oullrich@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','RVTzU9a5Vs','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(148,'Jared Skiles','botsford.gerald@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','NnCiE6lDEZ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(149,'Foster Effertz','vonrueden.waino@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','y3P6G7J3Fh','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(150,'Prof. Twila Gislason PhD','feeney.curt@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','J9zraRp5FQ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(151,'Jarrett Bergstrom','vgulgowski@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','aFzpLD1kyV','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(152,'Dr. Noah Senger MD','gbergstrom@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','U94CclyICl','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(153,'Dax Welch','ukuhn@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','QVqn2B7SLC','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(154,'Jarrod Weber DDS','bstanton@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','pe59svTvH9','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(155,'Dayana Nolan','cary.sanford@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','G3OY7wHl65','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(156,'Prof. Layla Ernser','piper.berge@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','sgjDbTt627','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(157,'Prof. Joey Williamson','hassie.pouros@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','9XlDmcg6CN','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(158,'Prof. Cristina Reilly','cjacobs@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','qzWixMychS','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(159,'Mariam Russel','alessia.jacobs@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','myPfpwuW2u','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(160,'Issac Kiehn','mitchell.devan@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','2jf6x18bD4','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(161,'Katharina Kutch PhD','gardner.durgan@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','RLsA7irUd2','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(162,'Dr. Tanya Bergnaum II','zoey04@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','MgdYMlPCb7','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(163,'Mr. Kayleigh Rau','nakia.emmerich@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','RXwVa5ZK2N','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(164,'Mrs. Eleanora Glover','sbarrows@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','DroIVma4Ze','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(165,'Teresa Dibbert','logan57@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','yfen0AvBCC','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(166,'Albert Walsh MD','maybelle00@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','dXjba3YGXy','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(167,'Carissa Macejkovic','leo.collins@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','xslFBSA9m4','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(168,'Jameson Heller','hans.ebert@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','o1z0O0sqig','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(169,'Dr. Amber Schoen Sr.','vernon88@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','bcKAbTq935','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(170,'Prof. Kristofer Zemlak PhD','vonrueden.vince@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','5A40Ivizju','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(171,'Lonzo Bayer','fay.deanna@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','ZTNSIdravv','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(172,'Elouise Weber','sbode@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','KDZjYmdV8c','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(173,'Nova Wuckert','schuppe.nyah@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','WIjQz1McFi','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(174,'Dr. Oswald Jakubowski DDS','corkery.leonardo@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','HA0quoVmJs','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(175,'Foster Renner','holly.okuneva@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','vxpEoWj1JW','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(176,'Alexzander Macejkovic','gkertzmann@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','m6w4HS1wQT','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(177,'Prof. Max Heller','schuppe.ryan@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','c4if9z55wb','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(178,'Celestino Feest Jr.','nedra.altenwerth@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','46Db00xmAH','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(179,'Prof. Gustave Armstrong','huel.danielle@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','6l0B3vZ6tK','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(180,'Dr. Lavina Effertz V','nikolas.gerhold@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','V5zbiqcdM9','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(181,'Mr. Milo Ondricka','lauryn.wiza@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','jkUm7mG6P9','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(182,'Erich Sporer','gdamore@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','TvejIaDwen','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(183,'Jazmin Cronin V','xterry@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','5jDnJQXKan','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(184,'Lynn Donnelly DVM','dillan34@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','hhe1tnucSE','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(185,'Alexandrine Howell','koss.sandrine@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','e9gvra7rHU','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(186,'Alycia Jacobs','lockman.edwin@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','RJQhZHRVAu','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(187,'Jermain Krajcik','clemens01@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','9NrVLJYpDv','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(188,'Jameson Cassin PhD','qmurphy@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','njfcDvOoPW','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(189,'Corene Greenfelder DVM','alessandra71@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','kL2theCjIr','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(190,'Miss Delfina Marquardt','annabell93@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','AAgMX4kVHE','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(191,'Alia Towne','colby15@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','CxzqYOWkB7','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(192,'Kellie Pagac','frederique10@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','VJLiNsJK26','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(193,'King Durgan','ophelia.satterfield@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','XP060TYnHH','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(194,'Myriam Larson Jr.','schimmel.chelsey@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','oG0wfMcwUx','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(195,'Dr. Lue Gutkowski','ldoyle@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','eMhWIQDfEj','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(196,'Halle Bogan PhD','amanda.stehr@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','UQaSP9EbGL','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(197,'Prof. Wade Steuber','xanderson@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','iSpACjWyc8','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(198,'Solon Graham','hulda14@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','pyPFW8CuAZ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(199,'Aliya Jenkins','willms.sheldon@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','kUPEgjdpPy','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(200,'Dr. Adrien Fritsch','koepp.nichole@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','AbuvpqZPYF','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(201,'Jayne Weissnat','emmett03@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','IqSgtaTzqZ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(202,'Wilson Davis','helene66@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','AKFn7bNtIU','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(203,'Abdul Dibbert DVM','molly.murray@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','QsENSkoILT','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(204,'Esta Pacocha','eve.aufderhar@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','VaHBUCvxtT','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(205,'Hazel Quigley IV','leonel47@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','R6amnkPsZF','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(206,'Howard Bradtke','bosco.dayana@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','IsGCjQP21s','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(207,'Clair Satterfield','awilliamson@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','hIDA0iM5aZ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(208,'Dr. Keshaun Stanton','kulas.melvin@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','m0Kqoo3CMQ','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(209,'Hellen Walter','camylle51@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','FH3dS6SQ5P','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(210,'Stefanie Wisozk','callie.jacobson@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','XRq6Ig8cAS','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(211,'Miss Kiana Auer III','heaney.kelli@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','t5lA0xC9cI','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(212,'Mireya Greenfelder','arnoldo.ledner@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','kUWn7qkB2G','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(213,'Rose Schowalter I','homenick.trey@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','fMFWiallkx','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(214,'Chance Walker MD','sunny.halvorson@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Bdx64gvrLh','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(215,'Samara Cartwright','pkeeling@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','vaKwj6y7ao','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(216,'Cordell Greenholt','xstehr@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','93dIjKq5uU','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(217,'Ron Mann','herzog.joelle@example.org','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','WwicVyGUKz','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(218,'Brandon Connelly','lane84@example.net','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','XzVrSBrT0c','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(219,'Cecilia Lehner','maggio.verona@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','B2V8AdT1S1','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(220,'Randal Abernathy','brent12@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','JAFzTEznNM','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(221,'Jarret Haley','ycummerata@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','p5ZMMzRrC9','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(222,'Gerda Kunze','virgil53@example.org','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','AM3Tkyt39R','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(223,'Rudy Braun','zoie.cremin@example.net','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','EmeMSVFHOi','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(224,'Annie Quigley','jovany.medhurst@example.com','client','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','XQ8y6b6u08','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(225,'Kyler Hodkiewicz','ihaag@example.com','artist','2025-07-31 01:30:13','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','qot4YfVGzh','2025-07-31 01:30:13','2025-07-31 01:30:13'),
(226,'Eric Feil','msauer@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','drtNW7oFRu','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(227,'Danika Hahn','alford37@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','2TsZUhHaMA','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(228,'Mr. Immanuel Rowe MD','nrodriguez@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','wmos67cf9G','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(229,'Rogelio Lubowitz','alexys58@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','OjaxIgZKTm','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(230,'Finn Lubowitz V','welch.bethany@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','TfEQQnQphL','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(231,'Mr. Claud Schroeder MD','rtorp@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','rhs00jex3Z','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(232,'Abbigail Reynolds','alia.terry@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','55e1fve6ma','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(233,'Prof. Marcelina Schaefer Sr.','johnson.hoeger@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','S07zYZmr9v','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(234,'Lillie Rau','dgutkowski@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','ixaCrgrgEk','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(235,'Marcelino Ratke','shuels@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','1LpRfvoRfD','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(236,'Prof. Emiliano Reinger','nhagenes@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','wNLf1q7hj3','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(237,'Adonis Fay','kuhic.vickie@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','KGFMQev9he','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(238,'Amaya Bode','larson.elisa@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','DlikkhRI4v','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(239,'Ebony McKenzie','igrant@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','dUsVnavkik','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(240,'Meggie Hickle DDS','simonis.davin@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','dLdpZpsgma','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(241,'Gabe Zboncak','marietta50@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','OcQP3e4sgH','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(242,'Keara Schiller','runolfsdottir.cecile@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Z62nP1DxdX','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(243,'Dr. Doyle Huel V','thurman64@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','z7x68sVLmk','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(244,'Jedediah Kautzer','klocko.dawn@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','JL9qljSkND','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(245,'Landen Schumm','marcelo.wiegand@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','RtE6OpDd7Q','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(246,'Napoleon McCullough','nikko.rippin@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Qewhl2DIfK','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(247,'Nova Quitzon II','emil.rowe@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','hqkhe0EMcg','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(248,'Dr. Abelardo Schiller','harry65@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','yB7oJ03n3Z','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(249,'Hertha Kutch','alford.friesen@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','62SC874lMz','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(250,'Teresa Green','raphaelle10@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','VfVpv5KfhG','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(251,'Margie Pacocha','thora.ward@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','jxANY8H1bc','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(252,'Sasha Davis','hailie16@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','q5rXqZRTme','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(253,'Royal Zieme','tauer@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','yaRmPCN95E','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(254,'Gisselle Stehr Sr.','dach.lilla@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','PjKCwTrhXG','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(255,'Jamarcus Bosco','efrain70@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','0YFVmgcjYz','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(256,'Mr. Jon Haley Jr.','leuschke.vincenzo@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','POmTOIJZz0','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(257,'Tristian Hamill','hans.hickle@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','VqOBXSk4Hy','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(258,'Prof. Davin Shanahan DDS','drosenbaum@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Jy3GbCypbj','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(259,'Ms. Elza Hackett','acrooks@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','sYJW7UzE1W','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(260,'Janae Langosh','terence.herman@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','EVUpY5E22i','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(261,'Cristal Wuckert','nwuckert@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','g1ORxznHMt','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(262,'Conrad Champlin','terrill.gulgowski@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','zVl1rZkJQ0','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(263,'Tatyana Wintheiser','spencer01@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','7iCnTuSmhW','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(264,'Christian Barrows','walter.juanita@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','C9G7bCz3df','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(265,'Javier O\'Hara','whodkiewicz@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','S8tv5GnYjQ','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(266,'Prof. Garrison Breitenberg Sr.','wwill@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','0PfQJRyxS0','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(267,'Bo Champlin','veda.christiansen@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','pK02v9cfRP','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(268,'Dr. Nicolette Goodwin','mohr.telly@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','DXpc3tztra','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(269,'Sabrina Kiehn I','qmonahan@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','ldRdKACUvF','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(270,'Pablo Senger','kwill@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','7YvJoPe4kP','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(271,'Carlee Wisoky','dina99@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','5ibyEhpKAG','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(272,'Fern Hoppe','ndietrich@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','D48kAtZTet','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(273,'Earnest Ferry','rosario.abernathy@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Uqtdj6Enex','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(274,'Garrett Auer IV','rodriguez.jaida@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','CIGi0nm1Oo','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(275,'Dr. Russell Bernhard','brekke.dayana@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','rVCWS9NrSG','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(276,'Johnathon Hudson','alfonso36@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','AiBNjO0VNu','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(277,'Maurine Jerde','cassidy73@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','dTbS3QIwjP','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(278,'Cindy Lebsack','mose.runolfsson@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','HCDZT582Kl','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(279,'Grayson Cremin','vernie.howell@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','TJdparUNCp','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(280,'Ernesto Schimmel','rodger71@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','rzUvPQoQtA','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(281,'Schuyler Roberts','creilly@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','HK9ipuvre1','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(282,'Lon Langosh','ryley.deckow@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','yq8qaNiBcn','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(283,'Miss Filomena Reichel','jerod81@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','G8xJUaUica','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(284,'Miss Jena Kunze Jr.','stone.sporer@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','mDXATEcBxv','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(285,'Clinton Greenholt','nader.cletus@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','NXmvBsAthG','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(286,'Vivienne Koepp','makenzie63@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','UznIDPqD0a','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(287,'Harvey Wisoky','jermey52@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','PuFLiTfRR2','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(288,'Jena Becker','lucienne03@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','KFzuqtVqS8','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(289,'Eloy Bergnaum DDS','hwisozk@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','MFh0C1QuvK','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(290,'Dr. Hermann Lindgren IV','vschoen@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','XXydknNhLW','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(291,'Mr. Darius Rowe','josie54@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','mVyV2oJj4h','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(292,'Daija VonRueden','lfeil@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','qfR98pXeO9','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(293,'Prof. Myriam Rice','pschimmel@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','XTacK3B0my','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(294,'Dane Sauer DVM','schimmel.elliot@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','obZWr9VQTF','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(295,'Aryanna Bauch','eichmann.vella@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','FRYgwk1cyo','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(296,'Vella Wuckert','dach.eloisa@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','uhu913pPZD','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(297,'Dr. Kiel Labadie','chelsey.skiles@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','VWdpuOtmPQ','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(298,'Prof. Zackery Bauch V','kziemann@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','MGVf7gcAnh','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(299,'Mozelle Moore','madisen.jerde@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','yjAsH4RgnK','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(300,'Leora Jacobs','buckridge.price@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','HY8O3Aa40h','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(301,'Kristy DuBuque','julia55@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','MBHG7gTS12','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(302,'Savanah Trantow','mwehner@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','OpUk7I6i2h','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(303,'Helga O\'Kon','spencer.louie@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','waeYQykUkR','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(304,'Mrs. Danika Daniel','acorwin@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','LaqAd32mW3','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(305,'Favian Lehner','dave61@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','KIVgR200qQ','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(306,'Magnus McKenzie II','maud00@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','PcXn94Pe3H','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(307,'Karianne Bednar','sherman92@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','ihUG5UW52p','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(308,'Elza Aufderhar I','arnold28@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','9GvCoJx2st','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(309,'Katherine Marvin','prohaska.craig@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','yvsx1V3d9n','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(310,'Mrs. Jaquelin Berge','antonette.lowe@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','4I2xj9a9FH','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(311,'Rosina Sporer','reffertz@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','BE583FQAaB','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(312,'Dr. Lucious Ziemann DVM','heller.obie@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','0dAMTXV2i9','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(313,'Herman Kuhlman','laisha.corwin@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','jlwfAiZe2X','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(314,'Ernesto Bailey','rusty99@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','W9j1U6Itot','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(315,'Reanna Macejkovic','julius61@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','HvEdmNMI1P','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(316,'Federico Kulas','eliane.cummerata@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','9cXTZufMH9','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(317,'Prof. Vicente Quitzon II','adrienne98@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','25w5zHCkz4','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(318,'Ms. Dora Hackett DVM','aebert@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','IvSODtI6ze','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(319,'Eddie White','albin61@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','heBsGFwrhF','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(320,'Mekhi Koepp','emmerich.lydia@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','VTMTBs73tV','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(321,'Aubree Rau','ihamill@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','wFpvE7q2Ou','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(322,'Mr. Willis Cummings IV','zbashirian@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','9CTVj39WtV','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(323,'Justus Mraz','hackett.zackery@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','6poPHHO3r8','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(324,'Olga Dibbert','renner.tierra@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','MgPnixmg2e','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(325,'Mozell Hermiston','arnulfo73@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','TsOc7Y9l1a','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(326,'Martin O\'Hara','fay.giovanny@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','BptLnvPnFL','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(327,'Tyrique Homenick','trolfson@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','TWka2xWX4b','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(328,'Gisselle Bode','crolfson@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','HaD9GcPGy1','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(329,'Lane Tillman','gsmitham@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','YmUsxzAigo','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(330,'Dr. Berenice Brakus Sr.','greyson.considine@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','300hp8mQXn','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(331,'Erik Ruecker','cpurdy@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','veWVJAkZDj','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(332,'Malvina Hahn','ybecker@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','SYNBN0b2wM','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(333,'Dr. Dixie Collins','aditya42@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','r43E57GsWZ','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(334,'Mr. Kennith Heidenreich','rogelio75@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','rTzlJhCXbJ','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(335,'Dr. Sydney Hintz','eward@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','brCNGIHjxg','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(336,'Triston Stamm','wbruen@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','cGoB5SjuD4','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(337,'Camila O\'Kon','johan45@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','5kPlqkCsne','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(338,'Mrs. Dena Schmidt DDS','erik53@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','A9BbERCuZh','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(339,'Prof. Clare Rice','collins.sherman@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','26zJUgXm5l','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(340,'Guido Borer','euna.oreilly@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','umY3WVqgP0','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(341,'Prof. Hilda Mosciski I','npouros@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','LASEwVv4Sc','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(342,'Mittie Bosco','hswift@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','nRGB3VJDdk','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(343,'Barry Kling','yundt.betsy@example.org','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','7BWzHOk15I','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(344,'Amanda Rohan III','clangosh@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','eRR5UtWlDC','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(345,'Bethany McLaughlin','karli.herzog@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','Ce4T39LhXQ','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(346,'Claude Howe IV','carroll.selmer@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','uH1GWliBbS','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(347,'Ward Pfeffer','shanel.jaskolski@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','jbYrQezjeD','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(348,'Mathew Altenwerth','vwalsh@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','x1npF4j73L','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(349,'Theo Emmerich V','nsauer@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','IwOIBb0wGt','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(350,'Amir Reichel I','jast.efrain@example.org','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','kXFCmRsJk4','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(351,'Prof. Anjali Kub','cecilia90@example.com','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','6yAXyVj5ML','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(352,'Brendon Kilback Jr.','alaina.beier@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','9Nhi6dQYeq','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(353,'Dr. Marta Schimmel','lucious37@example.net','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','M4oS9x2fEt','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(354,'Mrs. Sydnee Crona MD','ecorwin@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','T1c2mP8ObO','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(355,'Prof. Ida Kertzmann DVM','dtillman@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','GZpfhed0QG','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(356,'Ray Gerhold','marie.lesch@example.com','artist','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','uApwzBxnvx','2025-07-31 01:30:14','2025-07-31 01:30:14'),
(357,'Angelita Huel','aaron.maggio@example.net','client','2025-07-31 01:30:14','$2y$12$lOIpI.ETKQeWXHJBVyEuKu.M47PFzhb0WEyjvTeW9Jk.XP5wjQGcq','46WBcZBb3e','2025-07-31 01:30:14','2025-07-31 01:30:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `voice_feature_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voice_feature_values` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `voice_id` bigint(20) unsigned NOT NULL,
  `feature_value_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `voice_feature_values_voice_id_feature_value_id_unique` (`voice_id`,`feature_value_id`),
  KEY `voice_feature_values_feature_value_id_foreign` (`feature_value_id`),
  CONSTRAINT `voice_feature_values_feature_value_id_foreign` FOREIGN KEY (`feature_value_id`) REFERENCES `feature_values` (`id`) ON DELETE CASCADE,
  CONSTRAINT `voice_feature_values_voice_id_foreign` FOREIGN KEY (`voice_id`) REFERENCES `voices` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `voice_feature_values` WRITE;
/*!40000 ALTER TABLE `voice_feature_values` DISABLE KEYS */;
INSERT INTO `voice_feature_values` VALUES
(1,1,4,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(2,1,8,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(3,1,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(4,1,21,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(5,1,26,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(6,1,28,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(7,1,31,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(8,1,36,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(9,1,41,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(10,1,47,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(11,1,51,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(12,1,52,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(13,1,56,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(14,1,61,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(15,1,66,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(16,1,72,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(17,1,77,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(18,2,2,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(19,2,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(20,2,15,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(21,2,18,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(22,2,26,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(23,2,39,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(24,2,41,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(25,2,46,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(26,2,57,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(27,2,61,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(28,2,67,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(29,2,69,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(30,2,75,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(31,3,5,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(32,3,8,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(33,3,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(34,3,16,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(35,3,25,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(36,3,31,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(37,3,34,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(38,3,40,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(39,3,47,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(40,3,52,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(41,3,55,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(42,3,61,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(43,3,65,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(44,3,69,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(45,3,74,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(46,4,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(47,4,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(48,4,15,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(49,4,22,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(50,4,27,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(51,4,37,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(52,4,43,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(53,4,50,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(54,4,51,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(55,4,63,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(56,4,67,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(57,4,71,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(58,4,74,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(59,5,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(60,5,10,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(61,5,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(62,5,16,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(63,5,26,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(64,5,32,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(65,5,37,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(66,5,46,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(67,5,51,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(68,5,56,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(69,5,58,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(70,5,61,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(71,5,68,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(72,5,73,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(73,5,75,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(74,6,1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(75,6,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(76,6,12,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(77,6,22,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(78,6,26,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(79,6,41,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(80,6,47,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(81,6,49,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(82,6,55,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(83,6,60,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(84,6,66,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(85,6,70,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(86,6,76,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(87,7,2,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(88,7,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(89,7,15,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(90,7,24,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(91,7,26,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(92,7,27,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(93,7,29,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(94,7,34,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(95,7,45,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(96,7,48,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(97,7,54,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(98,7,55,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(99,7,63,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(100,7,68,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(101,7,69,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(102,7,76,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(103,8,5,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(104,8,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(105,8,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(106,8,23,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(107,8,25,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(108,8,27,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(109,8,30,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(110,8,36,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(111,8,38,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(112,8,46,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(113,8,52,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(114,8,56,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(115,8,63,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(116,8,67,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(117,8,73,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(118,8,74,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(119,9,6,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(120,9,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(121,9,11,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(122,9,24,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(123,9,26,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(124,9,29,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(125,9,34,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(126,9,40,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(127,9,45,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(128,9,49,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(129,9,62,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(130,9,66,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(131,9,73,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(132,9,76,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(133,10,6,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(134,10,10,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(135,10,15,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(136,10,17,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(137,10,27,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(138,10,29,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(139,10,39,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(140,10,46,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(141,10,50,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(142,10,58,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(143,10,63,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(144,10,67,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(145,10,69,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(146,10,74,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(147,11,4,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(148,11,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(149,11,14,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(150,11,21,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(151,11,30,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(152,11,33,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(153,11,35,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(154,11,43,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(155,11,48,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(156,11,62,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(157,11,68,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(158,11,73,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(159,11,77,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(160,12,5,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(161,12,10,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(162,12,11,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(163,12,23,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(164,12,26,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(165,12,30,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(166,12,38,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(167,12,46,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(168,12,53,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(169,12,56,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(170,12,60,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(171,12,65,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(172,12,70,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(173,12,75,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(174,13,7,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(175,13,10,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(176,13,11,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(177,13,16,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(178,13,26,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(179,13,27,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(180,13,29,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(181,13,39,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(182,13,44,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(183,13,53,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(184,13,61,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(185,13,65,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(186,13,73,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(187,13,75,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(188,14,6,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(189,14,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(190,14,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(191,14,18,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(192,14,25,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(193,14,39,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(194,14,45,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(195,14,48,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(196,14,49,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(197,14,54,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(198,14,62,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(199,14,67,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(200,14,71,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(201,14,76,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(202,15,3,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(203,15,9,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(204,15,14,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(205,15,22,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(206,15,26,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(207,15,28,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(208,15,41,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(209,15,44,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(210,15,50,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(211,15,51,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(212,15,63,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(213,15,64,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(214,15,71,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(215,15,75,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(216,16,5,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(217,16,10,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(218,16,14,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(219,16,24,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(220,16,25,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(221,16,27,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(222,16,30,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(223,16,34,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(224,16,45,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(225,16,53,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(226,16,58,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(227,16,60,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(228,16,68,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(229,16,71,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(230,16,76,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(231,17,7,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(232,17,8,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(233,17,13,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(234,17,16,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(235,17,26,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(236,17,31,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(237,17,33,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(238,17,39,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(239,17,46,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(240,17,49,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(241,17,52,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(242,17,54,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(243,17,62,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(244,17,68,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(245,17,73,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(246,17,77,'2025-07-31 01:30:13','2025-07-31 01:30:13');
/*!40000 ALTER TABLE `voice_feature_values` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `voices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`title`)),
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`description`)),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `voices_user_id_foreign` (`user_id`),
  CONSTRAINT `voices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `voices` WRITE;
/*!40000 ALTER TABLE `voices` DISABLE KEYS */;
INSERT INTO `voices` VALUES
(1,3,'{\"en\":\"Totam repudiandae quis.\",\"bg\":\"БГ: Totam repudiandae quis.\"}','{\"en\":\"Quasi est sunt aut culpa dignissimos et velit. Placeat quam qui ea porro id expedita perferendis. Nostrum blanditiis cum consequuntur tempora voluptatem saepe possimus. Fuga sequi neque debitis ut aut eligendi delectus.\",\"bg\":\"БГ: Quasi est sunt aut culpa dignissimos et velit. Placeat quam qui ea porro id expedita perferendis. Nostrum blanditiis cum consequuntur tempora voluptatem saepe possimus. Fuga sequi neque debitis ut aut eligendi delectus.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(2,4,'{\"en\":\"Nulla omnis minus omnis.\",\"bg\":\"БГ: Nulla omnis minus omnis.\"}','{\"en\":\"Illum a qui sit adipisci architecto officia. Eum deserunt adipisci quia impedit. Eligendi omnis omnis quod inventore ut non nobis. Soluta unde qui omnis vel ex et id.\",\"bg\":\"БГ: Illum a qui sit adipisci architecto officia. Eum deserunt adipisci quia impedit. Eligendi omnis omnis quod inventore ut non nobis. Soluta unde qui omnis vel ex et id.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(3,5,'{\"en\":\"Esse ratione rerum.\",\"bg\":\"БГ: Esse ratione rerum.\"}','{\"en\":\"Fugit consequatur quos ut laborum magnam officiis rerum. Nihil et in quaerat praesentium commodi accusamus accusamus.\",\"bg\":\"БГ: Fugit consequatur quos ut laborum magnam officiis rerum. Nihil et in quaerat praesentium commodi accusamus accusamus.\"}',0,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(4,5,'{\"en\":\"Alias aspernatur neque omnis aut.\",\"bg\":\"БГ: Alias aspernatur neque omnis aut.\"}','{\"en\":\"Atque facilis dolore corrupti tenetur ea voluptatem. Temporibus autem quia quod hic possimus fugit aut facere. Rerum laudantium adipisci illo quia esse dolores perspiciatis.\",\"bg\":\"БГ: Atque facilis dolore corrupti tenetur ea voluptatem. Temporibus autem quia quod hic possimus fugit aut facere. Rerum laudantium adipisci illo quia esse dolores perspiciatis.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(5,6,'{\"en\":\"Harum quia id.\",\"bg\":\"БГ: Harum quia id.\"}','{\"en\":\"Delectus fugiat corporis deserunt sint pariatur veritatis et. Similique eius rerum quidem ea. Est soluta possimus molestiae praesentium et facere.\",\"bg\":\"БГ: Delectus fugiat corporis deserunt sint pariatur veritatis et. Similique eius rerum quidem ea. Est soluta possimus molestiae praesentium et facere.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(6,7,'{\"en\":\"Est perspiciatis omnis.\",\"bg\":\"БГ: Est perspiciatis omnis.\"}','{\"en\":\"Accusantium corrupti qui sunt fuga provident saepe non. Nihil ipsum pariatur voluptatem explicabo adipisci sapiente eos. Quod laborum repellendus nihil eos in dicta.\",\"bg\":\"БГ: Accusantium corrupti qui sunt fuga provident saepe non. Nihil ipsum pariatur voluptatem explicabo adipisci sapiente eos. Quod laborum repellendus nihil eos in dicta.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(7,7,'{\"en\":\"Similique dolor quas.\",\"bg\":\"БГ: Similique dolor quas.\"}','{\"en\":\"Sit accusantium quibusdam velit ducimus amet. Rem atque itaque et quibusdam sint. Vel consequatur magnam et itaque tempora quam.\",\"bg\":\"БГ: Sit accusantium quibusdam velit ducimus amet. Rem atque itaque et quibusdam sint. Vel consequatur magnam et itaque tempora quam.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(8,11,'{\"en\":\"Rerum praesentium et.\",\"bg\":\"БГ: Rerum praesentium et.\"}','{\"en\":\"Non sapiente quod est doloribus. Non sit sed dolorem expedita harum modi. Nemo sunt consectetur ad aspernatur sint.\",\"bg\":\"БГ: Non sapiente quod est doloribus. Non sit sed dolorem expedita harum modi. Nemo sunt consectetur ad aspernatur sint.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(9,11,'{\"en\":\"Modi repellendus vel quae quod.\",\"bg\":\"БГ: Modi repellendus vel quae quod.\"}','{\"en\":\"Nobis hic veritatis est dicta. Consequatur consequatur est quia ut sit. Qui sint architecto aut.\",\"bg\":\"БГ: Nobis hic veritatis est dicta. Consequatur consequatur est quia ut sit. Qui sint architecto aut.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(10,11,'{\"en\":\"Ratione recusandae ea laboriosam.\",\"bg\":\"БГ: Ratione recusandae ea laboriosam.\"}','{\"en\":\"Placeat iusto qui et nihil quisquam sit molestiae. Sit ullam ea quidem voluptates.\",\"bg\":\"БГ: Placeat iusto qui et nihil quisquam sit molestiae. Sit ullam ea quidem voluptates.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(11,12,'{\"en\":\"Vitae accusantium laborum.\",\"bg\":\"БГ: Vitae accusantium laborum.\"}','{\"en\":\"Molestiae et repellat amet voluptates. Reprehenderit suscipit qui velit sunt. Et totam distinctio quaerat inventore.\",\"bg\":\"БГ: Molestiae et repellat amet voluptates. Reprehenderit suscipit qui velit sunt. Et totam distinctio quaerat inventore.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(12,12,'{\"en\":\"Eum sint molestiae ut.\",\"bg\":\"БГ: Eum sint molestiae ut.\"}','{\"en\":\"Officia libero aut aut. Ut accusantium consectetur rerum cumque aut. Nulla laborum voluptas deleniti iusto. In rerum maiores iure.\",\"bg\":\"БГ: Officia libero aut aut. Ut accusantium consectetur rerum cumque aut. Nulla laborum voluptas deleniti iusto. In rerum maiores iure.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(13,13,'{\"en\":\"Impedit et quidem voluptas.\",\"bg\":\"БГ: Impedit et quidem voluptas.\"}','{\"en\":\"Enim ducimus minima repellat sunt. In et et quisquam et dolorum ut aut molestias. Tempore nostrum et earum aliquam. Ipsam recusandae facilis laudantium ducimus adipisci sunt.\",\"bg\":\"БГ: Enim ducimus minima repellat sunt. In et et quisquam et dolorum ut aut molestias. Tempore nostrum et earum aliquam. Ipsam recusandae facilis laudantium ducimus adipisci sunt.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(14,14,'{\"en\":\"Et porro reiciendis.\",\"bg\":\"БГ: Et porro reiciendis.\"}','{\"en\":\"Voluptatem delectus tempore officia aut et. Debitis impedit ea sed est. Et itaque quod rerum et nesciunt. In est iure aspernatur.\",\"bg\":\"БГ: Voluptatem delectus tempore officia aut et. Debitis impedit ea sed est. Et itaque quod rerum et nesciunt. In est iure aspernatur.\"}',0,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(15,15,'{\"en\":\"Consequatur molestias dolorum et.\",\"bg\":\"БГ: Consequatur molestias dolorum et.\"}','{\"en\":\"Aut ea quaerat sit labore fugiat dolor voluptate. Consequuntur mollitia expedita at. Praesentium ut velit omnis itaque.\",\"bg\":\"БГ: Aut ea quaerat sit labore fugiat dolor voluptate. Consequuntur mollitia expedita at. Praesentium ut velit omnis itaque.\"}',0,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(16,15,'{\"en\":\"Quibusdam saepe.\",\"bg\":\"БГ: Quibusdam saepe.\"}','{\"en\":\"Ad mollitia ad ut enim excepturi est. Aut dolor enim excepturi pariatur commodi.\",\"bg\":\"БГ: Ad mollitia ad ut enim excepturi est. Aut dolor enim excepturi pariatur commodi.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13'),
(17,26,'{\"en\":\"Quas nihil ipsa asperiores.\",\"bg\":\"БГ: Quas nihil ipsa asperiores.\"}','{\"en\":\"Delectus voluptatibus eligendi praesentium. Nemo consequatur beatae eligendi qui sequi. Et cumque voluptatem qui facere quis. Repellendus libero debitis similique illum harum harum maiores.\",\"bg\":\"БГ: Delectus voluptatibus eligendi praesentium. Nemo consequatur beatae eligendi qui sequi. Et cumque voluptatem qui facere quis. Repellendus libero debitis similique illum harum harum maiores.\"}',1,'2025-07-31 01:30:13','2025-07-31 01:30:13');
/*!40000 ALTER TABLE `voices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

