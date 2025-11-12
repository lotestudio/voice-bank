-- -------------------------------------------------------------
-- TablePlus 6.7.3(640)
--
-- https://tableplus.com/
--
-- Database: voicebank
-- Generation Time: 2025-11-12 14:06:37.7760
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`title`)),
  `slug` varchar(255) NOT NULL,
  `excerpt` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`excerpt`)),
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`body`)),
  `section` varchar(255) DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT 0,
  `is_published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `posts` (`id`, `title`, `slug`, `excerpt`, `body`, `section`, `position`, `is_published`, `created_at`, `updated_at`) VALUES
(1, '{\"bg\":\"Озвучаваме текстове и създаваме аудиореклами за всеки тип дигитална медия.\",\"en\":\"We voice texts and create audio advertisements for every type of digital media.\"}', 'home-hero', '{\"bg\":\"Радио, телевизия, интернет, подкасти, аудиокниги, пародии и вокални партии.\\nПишем сценарии и предлагаме професионална дикторско озвучаване.\",\"en\":\"Radio, TV, internet, podcasts, audiobooks, parodies and vocal parts.\\nWe write scripts and offer professional voiceover.\"}', '{\"bg\":\"<p></p>\",\"en\":\"<p></p>\"}', 'home.hero', 0, 1, '2025-10-03 06:09:01', '2025-10-03 07:03:27'),
(2, '{\"bg\":\"Оперативност\",\"en\":\"Efficiency\"}', 'homefeatures', '{\"bg\":\"Нашите артисти изпълняват записите в срок\",\"en\":\"Our artists perform the recordings on time\"}', NULL, 'home.features', 1, 0, '2025-10-03 07:34:54', '2025-10-03 07:34:54'),
(3, '{\"bg\":\"Документ за записа\",\"en\":\"Record Document\"}', 'homefeatures-1', '{\"bg\":\"Към всеки запис клиентът получава документ за авторски права\",\"en\":\"For each recording, the client receives a copyright document\"}', NULL, 'home.features', 2, 0, '2025-10-03 07:34:54', '2025-10-03 07:34:54'),
(4, '{\"bg\":\"Професионализъм\",\"en\":\"Professionalism\"}', 'homefeatures-2', '{\"bg\":\"Следим и контролираме нивото на артистите, като отчитаме мнението на нашите клиент\",\"en\":\"We monitor and control the level of the artists, taking into account the opinion of our clients\"}', NULL, 'home.features', 3, 0, '2025-10-03 07:34:54', '2025-10-03 07:34:54'),
(5, '{\"bg\":\"Поддръжка\",\"en\":\"Support\"}', 'homefeatures-3', '{\"bg\":\"Предоставяме консултации на всички етапи от пръчката\",\"en\":\"We provide consultations at all stages of the rod\"}', NULL, 'home.features', 4, 0, '2025-10-03 07:34:54', '2025-10-03 07:34:54'),
(6, '{\"bg\":\"Автоматизация\",\"en\":\"Automation\"}', 'homefeatures-4', '{\"bg\":\"Вашата намеса е сведена до минимум - плащане и получаване на поръчката стават автоматично\",\"en\":\"Your intervention is minimized - payment and receipt of the order are automatic\"}', NULL, 'home.features', 5, 0, '2025-10-03 07:34:54', '2025-10-03 07:34:54'),
(7, '{\"bg\":\"Избрани гласове\",\"en\":\"Featured voices\"}', 'homefeatured-voices', '{\"bg\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam harum magni porro repudiandae similique. Autem cumque, doloremque provident sequi tenetur voluptate voluptatem? Eos excepturi facilis iste nobis quia sint soluta.\",\"en\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam harum magni porro repudiandae similique. Autem cumque, doloremque provident sequi tenetur voluptate voluptatem? Eos excepturi facilis iste nobis quia sint soluta.\"}', NULL, 'home.featured_voices', 0, 0, '2025-10-03 07:48:44', '2025-10-03 07:48:44'),
(8, '{\"bg\":\"Последни поръчки!\",\"en\":\"Latest Orders!\"}', 'homelatest-orders', '{\"bg\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam harum magni porro repudiandae similique. Autem cumque, doloremque provident sequi tenetur voluptate voluptatem? Eos excepturi facilis iste nobis quia sint soluta.\",\"en\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam harum magni porro repudiandae similique. Autem cumque, doloremque provident sequi tenetur voluptate voluptatem? Eos excepturi facilis iste nobis quia sint soluta.\"}', NULL, 'home.latest_orders', 0, 0, '2025-10-03 07:48:10', '2025-10-03 07:48:10'),
(9, '{\"bg\":\"Включи се!\",\"en\":\"Get Involved!\"}', 'homeget-involved', '{\"bg\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam harum magni porro repudiandae similique. Autem cumque, doloremque provident sequi tenetur voluptate voluptatem? Eos excepturi facilis iste nobis quia sint soluta.\",\"en\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam harum magni porro repudiandae similique. Autem cumque, doloremque provident sequi tenetur voluptate voluptatem? Eos excepturi facilis iste nobis quia sint soluta.\"}', NULL, 'home.get_involved', 0, 0, '2025-10-03 07:47:40', '2025-10-03 07:47:40'),
(10, '{\"bg\":\"Изчисли стойността на поръчката\",\"en\":\"Order calculator\"}', 'homeorder-calculator', '{\"bg\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam harum magni porro repudiandae similique. Autem cumque, doloremque provident sequi tenetur voluptate voluptatem? Eos excepturi facilis iste nobis quia sint soluta.\",\"en\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam harum magni porro repudiandae similique. Autem cumque, doloremque provident sequi tenetur voluptate voluptatem? Eos excepturi facilis iste nobis quia sint soluta.\"}', NULL, 'home.order_calculator', 0, 0, '2025-10-03 07:46:36', '2025-10-03 07:46:36'),
(17, '{\"bg\":\"За нас\",\"en\":\"About us\"}', 'about', '{\"bg\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum eius illum ipsa mollitia officia omnis pariatur perferendis, repudiandae veniam voluptates? Alias animi asperiores ex in nihil, quo reprehenderit tempore veniam!\",\"en\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum eius illum ipsa mollitia officia omnis pariatur perferendis, repudiandae veniam voluptates? Alias animi asperiores ex in nihil, quo reprehenderit tempore veniam!\"}', '{\"bg\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum eius illum ipsa mollitia officia omnis pariatur perferendis, repudiandae veniam voluptates? Alias animi asperiores ex in nihil, quo reprehenderit tempore veniam!</p><p></p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum eius illum ipsa mollitia officia omnis pariatur perferendis, repudiandae veniam voluptates? Alias animi asperiores ex in nihil, quo reprehenderit tempore veniam!</p>\",\"en\":\"<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum eius illum ipsa mollitia officia omnis pariatur perferendis, repudiandae veniam voluptates? Alias animi asperiores ex in nihil, quo reprehenderit tempore veniam!</p><p></p><p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum eius illum ipsa mollitia officia omnis pariatur perferendis, repudiandae veniam voluptates? Alias animi asperiores ex in nihil, quo reprehenderit tempore veniam!</p>\"}', 'about', 1, 1, '2025-10-03 11:14:29', '2025-10-03 11:14:29');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;