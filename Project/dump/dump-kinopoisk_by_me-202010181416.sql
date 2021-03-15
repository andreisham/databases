-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: kinopoisk_by_me
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `afisha`
--

DROP TABLE IF EXISTS `afisha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `afisha` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `film_id` bigint unsigned NOT NULL,
  `in_cinema_untill` date DEFAULT NULL COMMENT 'В кино до',
  `cinema_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `film_id` (`film_id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `afisha_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`),
  CONSTRAINT `afisha_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `cinemas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afisha`
--

LOCK TABLES `afisha` WRITE;
/*!40000 ALTER TABLE `afisha` DISABLE KEYS */;
INSERT INTO `afisha` VALUES (1,5,'2020-11-07',1),(2,5,'2020-11-07',2),(3,5,'2020-11-07',3),(4,6,'2020-11-07',1),(5,6,'2020-11-07',5),(6,8,'2020-11-07',3),(7,8,'2020-11-07',7),(8,8,'2020-11-07',8),(9,8,'2020-11-07',4),(10,18,'2020-11-07',1),(11,18,'2020-11-07',2),(12,18,'2020-11-07',3),(13,18,'2020-11-07',9),(14,18,'2020-11-07',5),(15,18,'2020-11-07',6),(16,18,'2020-11-07',7),(17,18,'2020-11-07',8),(18,18,'2020-11-07',10),(19,19,'2020-11-07',10);
/*!40000 ALTER TABLE `afisha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cinemas`
--

DROP TABLE IF EXISTS `cinemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinemas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Название кинотеатра',
  `adress` varchar(50) DEFAULT NULL COMMENT 'Адрес',
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cinemas`
--

LOCK TABLES `cinemas` WRITE;
/*!40000 ALTER TABLE `cinemas` DISABLE KEYS */;
INSERT INTO `cinemas` VALUES (1,'Киномакс','87013 Duke Circle','174-990-5345'),(2,'Облака','20 Kropf Hill','490-555-6570'),(3,'Gagarin Cinema','6558 Sachs Point','585-406-0210'),(4,'Magic Cinema','22183 Ryan Point','308-614-0555'),(5,'Алмаз','73317 Roxbury Lane','622-686-9533'),(6,'Люксор','12 Evergreen Center','976-327-8927'),(7,'Москино','89 Talmadge Junction','769-735-4497'),(8,'Формула Кино','0597 Mayer Avenue','401-518-7343'),(9,'Пять Звезд','541 Toban Alley','329-683-1513'),(10,'Щёлково','06 Northview Road','851-788-6453');
/*!40000 ALTER TABLE `cinemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT 'Название фильма',
  `genre` varchar(50) DEFAULT NULL COMMENT 'Жанр',
  `year` smallint DEFAULT NULL COMMENT 'Год выхода',
  `rating` float DEFAULT NULL COMMENT 'Рейтинг',
  `is_in_cinema` bit(1) NOT NULL COMMENT 'Идет в кино',
  `price` decimal(10,2) NOT NULL COMMENT 'Цена',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Побег из Шоушенка','Драма',1994,8.70732,_binary '\0',199.00),(2,'Зеленая миля','Драма',1999,8.83871,_binary '\0',199.00),(3,'Форрест Гамп','История',1994,7.875,_binary '\0',199.00),(4,'Список Шиндлера','Биография',1993,8.32,_binary '\0',199.00),(5,'1+1','Комедия',2011,8.36364,_binary '',249.00),(6,'Начало','Фантастика',2010,8.52381,_binary '',249.00),(7,'Леон','Боевик',1994,7.73913,_binary '\0',199.00),(8,'Король Лев','Мультфильм',1994,8.13043,_binary '',99.00),(9,'Бойцовский клуб','Триллер',1999,8.73684,_binary '\0',199.00),(10,'Иван Васильевич меняет профессию','Комедия',1973,8.19048,_binary '\0',1.00),(11,'Жизнь прекрасна','Драма',1997,7.84,_binary '\0',199.00),(12,'Достучаться до небес','Драма',1997,7.28571,_binary '\0',99.00),(13,'Крестный отец','Криминал',1972,8.13636,_binary '\0',99.00),(14,'Криминальное чтиво','Триллер',1994,7.72,_binary '\0',99.00),(15,'Операция «Ы» и другие приключения Шурика','Комедия',1965,8.52,_binary '\0',1.00),(16,'Престиж','Фантастика',2006,8.28571,_binary '\0',99.00),(17,'Игры разума','Биография',2001,8.13043,_binary '\0',199.00),(18,'Интерстеллар','Фантастика',2014,8.36842,_binary '',249.00),(19,'Властелин колец: Возвращение Короля','Фэнтези',2003,8,_binary '',99.00),(20,'Гладиатор','История',2000,8.82609,_binary '\0',199.00);
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned NOT NULL,
  `to_user_id` bigint unsigned NOT NULL,
  `body` text,
  `is_read` bit(1) DEFAULT b'0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,50,14,'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.',_binary '','2020-10-16 22:13:14'),(2,18,12,'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.',_binary '\0','2020-10-16 22:13:14'),(3,21,1,'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.',_binary '','2020-10-16 22:13:14'),(4,30,4,'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.',_binary '','2020-10-16 22:13:14'),(5,8,17,'Proin at turpis a pede posuere nonummy.',_binary '\0','2020-10-16 22:13:14'),(6,27,49,'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',_binary '','2020-10-16 22:13:14'),(7,39,18,'Nulla mollis molestie lorem. Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.',_binary '\0','2020-10-16 22:13:14'),(8,27,22,'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.',_binary '','2020-10-16 22:13:14'),(9,42,29,'Sed ante. Vivamus tortor. Duis mattis egestas metus.',_binary '\0','2020-10-16 22:13:15'),(10,22,10,'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.',_binary '\0','2020-10-16 22:13:15'),(11,2,7,'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',_binary '\0','2020-10-16 22:13:15'),(12,47,10,'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',_binary '','2020-10-16 22:13:15'),(13,36,39,'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.',_binary '\0','2020-10-16 22:13:15'),(14,28,8,'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.',_binary '\0','2020-10-16 22:13:15'),(15,45,11,'Donec ut dolor.',_binary '\0','2020-10-16 22:13:15'),(16,2,46,'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.',_binary '','2020-10-16 22:13:15'),(17,11,18,'Nam dui.',_binary '\0','2020-10-16 22:13:15'),(18,19,8,'Aliquam non mauris.',_binary '\0','2020-10-16 22:13:15'),(19,29,19,'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.',_binary '\0','2020-10-16 22:13:15'),(20,29,26,'Suspendisse accumsan tortor quis turpis.',_binary '','2020-10-16 22:13:15'),(21,35,36,'Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.',_binary '','2020-10-16 22:13:15'),(22,7,13,'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.',_binary '\0','2020-10-16 22:13:15'),(23,2,8,'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.',_binary '\0','2020-10-16 22:13:15'),(24,40,11,'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',_binary '\0','2020-10-16 22:13:15'),(25,28,49,'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',_binary '\0','2020-10-16 22:13:15'),(26,44,33,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',_binary '','2020-10-16 22:13:15'),(27,11,12,'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.',_binary '','2020-10-16 22:13:15'),(28,3,17,'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.',_binary '\0','2020-10-16 22:13:15'),(29,44,40,'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.',_binary '\0','2020-10-16 22:13:15'),(30,44,24,'Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.',_binary '\0','2020-10-16 22:13:15'),(31,8,26,'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.',_binary '','2020-10-16 22:13:15'),(32,36,5,'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.',_binary '','2020-10-16 22:13:15'),(33,38,8,'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.',_binary '','2020-10-16 22:13:15'),(34,47,38,'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.',_binary '','2020-10-16 22:13:15'),(35,16,6,'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.',_binary '','2020-10-16 22:13:15'),(36,19,18,'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.',_binary '\0','2020-10-16 22:13:15'),(37,41,14,'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.',_binary '\0','2020-10-16 22:13:15'),(38,27,1,'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.',_binary '\0','2020-10-16 22:13:15'),(39,12,28,'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.',_binary '','2020-10-16 22:13:15'),(40,22,39,'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',_binary '\0','2020-10-16 22:13:15'),(41,24,11,'Aliquam erat volutpat. In congue.',_binary '','2020-10-16 22:13:15'),(42,34,3,'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',_binary '\0','2020-10-16 22:13:15'),(43,32,36,'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.',_binary '','2020-10-16 22:13:15'),(44,38,35,'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.',_binary '\0','2020-10-16 22:13:15'),(45,16,8,'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',_binary '','2020-10-16 22:13:15'),(46,43,31,'Praesent blandit. Nam nulla.',_binary '\0','2020-10-16 22:13:15'),(47,49,15,'In quis justo. Maecenas rhoncus aliquam lacus.',_binary '\0','2020-10-16 22:13:15'),(48,8,50,'Nunc purus.',_binary '','2020-10-16 22:13:15'),(49,11,8,'Morbi a ipsum. Integer a nibh.',_binary '','2020-10-16 22:13:15'),(50,9,18,'Nulla tempus.',_binary '\0','2020-10-16 22:13:15'),(51,31,33,'Phasellus in felis. Donec semper sapien a libero.',_binary '\0','2020-10-16 22:13:15'),(52,15,20,'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.',_binary '','2020-10-16 22:13:15'),(53,20,27,'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.',_binary '','2020-10-16 22:13:15'),(54,41,43,'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',_binary '\0','2020-10-16 22:13:15'),(55,45,23,'Ut at dolor quis odio consequat varius. Integer ac leo.',_binary '\0','2020-10-16 22:13:15'),(56,38,27,'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',_binary '','2020-10-16 22:13:15'),(57,19,19,'Integer tincidunt ante vel ipsum.',_binary '','2020-10-16 22:13:15'),(58,10,10,'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.',_binary '\0','2020-10-16 22:13:15'),(59,39,22,'Vivamus tortor. Duis mattis egestas metus.',_binary '','2020-10-16 22:13:15'),(60,12,9,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.',_binary '\0','2020-10-16 22:13:15'),(61,18,42,'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.',_binary '\0','2020-10-16 22:13:15'),(62,1,24,'Sed vel enim sit amet nunc viverra dapibus.',_binary '','2020-10-16 22:13:15'),(63,43,13,'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.',_binary '','2020-10-16 22:13:15'),(64,21,40,'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.',_binary '','2020-10-16 22:13:15'),(65,20,43,'Quisque ut erat. Curabitur gravida nisi at nibh.',_binary '','2020-10-16 22:13:15'),(66,19,32,'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',_binary '','2020-10-16 22:13:15'),(67,42,22,'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.',_binary '\0','2020-10-16 22:13:15'),(68,17,21,'Fusce consequat.',_binary '\0','2020-10-16 22:13:15'),(69,19,47,'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.',_binary '','2020-10-16 22:13:15'),(70,13,49,'In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.',_binary '\0','2020-10-16 22:13:15'),(71,45,8,'Quisque ut erat.',_binary '','2020-10-16 22:13:15'),(72,39,12,'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.',_binary '','2020-10-16 22:13:15'),(73,48,21,'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.',_binary '','2020-10-16 22:13:15'),(74,14,3,'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',_binary '','2020-10-16 22:13:15'),(75,17,21,'In hac habitasse platea dictumst.',_binary '\0','2020-10-16 22:13:15'),(76,31,7,'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.',_binary '','2020-10-16 22:13:15'),(77,18,46,'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.',_binary '\0','2020-10-16 22:13:15'),(78,1,12,'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',_binary '','2020-10-16 22:13:15'),(79,1,20,'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.',_binary '','2020-10-16 22:13:15'),(80,48,10,'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',_binary '\0','2020-10-16 22:13:15'),(81,16,36,'Nunc purus.',_binary '\0','2020-10-16 22:13:15'),(82,1,36,'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.',_binary '\0','2020-10-16 22:13:15'),(83,12,21,'Nulla facilisi. Cras non velit nec nisi vulputate nonummy.',_binary '\0','2020-10-16 22:13:15'),(84,41,39,'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.',_binary '\0','2020-10-16 22:13:15'),(85,10,18,'Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.',_binary '','2020-10-16 22:13:16'),(86,8,13,'Integer tincidunt ante vel ipsum.',_binary '','2020-10-16 22:13:16'),(87,1,45,'Nulla suscipit ligula in lacus.',_binary '\0','2020-10-16 22:13:16'),(88,45,36,'Morbi porttitor lorem id ligula.',_binary '','2020-10-16 22:13:16'),(89,45,29,'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus.',_binary '','2020-10-16 22:13:16'),(90,5,5,'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',_binary '\0','2020-10-16 22:13:16'),(91,47,18,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',_binary '','2020-10-16 22:13:16'),(92,28,33,'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.',_binary '\0','2020-10-16 22:13:16'),(93,45,12,'Nunc nisl.',_binary '\0','2020-10-16 22:13:16'),(94,37,12,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.',_binary '\0','2020-10-16 22:13:16'),(95,1,4,'Mauris ullamcorper purus sit amet nulla.',_binary '','2020-10-16 22:13:16'),(96,9,29,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.',_binary '','2020-10-16 22:13:16'),(97,44,17,'Praesent blandit lacinia erat.',_binary '','2020-10-16 22:13:16'),(98,3,48,'Nullam molestie nibh in lectus. Pellentesque at nulla.',_binary '','2020-10-16 22:13:16'),(99,16,10,'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',_binary '','2020-10-16 22:13:16'),(100,46,30,'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.',_binary '\0','2020-10-16 22:13:16');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT 'Заголовок новости',
  `body` text COMMENT 'Текст новости',
  `film_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'pede lobortis ligula','In congue. Etiam justo. Etiam pretium iaculis justo.\n\nIn hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',7,'2020-10-16 21:49:44'),(2,'vulputate vitae','Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.',20,'2020-10-16 21:49:44'),(3,'lorem ipsum','Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.\n\nDuis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',17,'2020-10-16 21:49:44'),(4,'quisque erat eros','In congue. Etiam justo. Etiam pretium iaculis justo.',2,'2020-10-16 21:49:44'),(5,'potenti cras in purus','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.',1,'2020-10-16 21:49:44'),(6,'ante ipsum','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.',3,'2020-10-16 21:49:44'),(7,'at turpis donec posuere','Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',14,'2020-10-16 21:49:44'),(8,'ut erat curabitur gravida','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',9,'2020-10-16 21:49:45'),(9,'amet cursus id turpis','Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.',4,'2020-10-16 21:49:45'),(10,'accumsan felis','Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.\n\nSed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.',15,'2020-10-16 21:49:45'),(11,'faucibus orci luctus et','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.\n\nDuis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.',1,'2020-10-16 21:49:45'),(12,'primis in','Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',11,'2020-10-16 21:49:45'),(13,'metus','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',10,'2020-10-16 21:49:45'),(14,'placerat ante','Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.',7,'2020-10-16 21:49:45'),(15,'aliquet pulvinar sed nisl','Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.',15,'2020-10-16 21:49:45'),(16,'egestas','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',18,'2020-10-16 21:49:45'),(17,'mauris non ligula','Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',4,'2020-10-16 21:49:45'),(18,'duis consequat dui','Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',9,'2020-10-16 21:49:45'),(19,'amet justo','Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',15,'2020-10-16 21:49:45'),(20,'ut ultrices vel augue vestibulum','Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',7,'2020-10-16 21:49:45'),(21,'tristique','Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.',19,'2020-10-16 21:49:45'),(22,'aenean lectus pellentesque eget nunc','Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.',5,'2020-10-16 21:49:45'),(23,'justo lacinia eget tincidunt eget','Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.',20,'2020-10-16 21:49:45'),(24,'ultrices','Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.\n\nPraesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',15,'2020-10-16 21:49:45'),(25,'purus','Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',2,'2020-10-16 21:49:45'),(26,'neque aenean','Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.\n\nInteger tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',2,'2020-10-16 21:49:45'),(27,'velit','Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.',18,'2020-10-16 21:49:45'),(28,'mauris','Sed ante. Vivamus tortor. Duis mattis egestas metus.',5,'2020-10-16 21:49:45'),(29,'nibh in quis justo maecenas','Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',11,'2020-10-16 21:49:45'),(30,'praesent blandit lacinia','Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.\n\nCras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',18,'2020-10-16 21:49:45');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_films`
--

DROP TABLE IF EXISTS `order_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_films` (
  `order_id` bigint unsigned NOT NULL,
  `film_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`film_id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `order_films_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_films_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_films`
--

LOCK TABLES `order_films` WRITE;
/*!40000 ALTER TABLE `order_films` DISABLE KEYS */;
INSERT INTO `order_films` VALUES (1,1),(3,1),(7,1),(8,1),(10,1),(11,1),(1,2),(7,2),(10,2),(7,3),(9,3),(10,3),(1,4),(3,4),(5,4),(6,4),(7,4),(8,4),(7,5),(8,5),(10,5),(7,6),(3,7),(2,11),(10,11),(4,12),(3,14),(4,15),(10,15),(8,16),(10,16),(2,17),(5,18),(4,19),(10,19),(3,20),(10,20);
/*!40000 ALTER TABLE `order_films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `phone` (`phone`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`phone`) REFERENCES `users` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'615-693-2095','2020-10-18 11:18:36'),(2,5,'495-215-0247','2020-10-18 11:21:05'),(3,7,'448-184-4988','2020-10-18 11:21:05'),(4,12,'786-790-8997','2020-10-18 11:21:05'),(5,13,'727-544-4270','2020-10-18 11:21:05'),(6,25,'300-533-2757','2020-10-18 11:21:05'),(7,31,'938-243-0778','2020-10-18 11:21:05'),(8,32,'336-702-7935','2020-10-18 11:21:05'),(9,33,'469-239-4018','2020-10-18 11:21:05'),(10,47,'152-261-8623','2020-10-18 11:21:05'),(11,50,'149-431-7039','2020-10-18 11:21:05');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rated_films`
--

DROP TABLE IF EXISTS `rated_films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rated_films` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `film_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `rating` tinyint DEFAULT NULL COMMENT 'Поставленная оценка',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `rating_index` (`rating`),
  KEY `film_id` (`film_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `rated_films_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`),
  CONSTRAINT `rated_films_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rated_films`
--

LOCK TABLES `rated_films` WRITE;
/*!40000 ALTER TABLE `rated_films` DISABLE KEYS */;
INSERT INTO `rated_films` VALUES (1,1,29,10,'2020-10-16 21:20:31'),(2,5,37,8,'2020-10-16 21:20:31'),(3,8,9,10,'2020-10-16 21:20:31'),(4,19,9,6,'2020-10-16 21:20:31'),(5,1,21,10,'2020-10-16 21:20:31'),(6,15,21,10,'2020-10-16 21:20:31'),(7,2,32,9,'2020-10-16 21:20:31'),(8,14,32,7,'2020-10-16 21:20:31'),(9,14,34,6,'2020-10-16 21:20:31'),(10,16,34,9,'2020-10-16 21:20:31'),(11,13,36,8,'2020-10-16 21:20:31'),(12,5,36,5,'2020-10-16 21:20:31'),(13,3,11,7,'2020-10-16 21:20:31'),(14,6,11,8,'2020-10-16 21:20:31'),(15,19,11,9,'2020-10-16 21:20:31'),(16,9,28,10,'2020-10-16 21:20:31'),(17,11,28,6,'2020-10-16 21:20:31'),(18,20,28,7,'2020-10-16 21:20:31'),(19,5,47,9,'2020-10-16 21:36:20'),(20,19,47,7,'2020-10-16 21:36:20'),(21,15,47,10,'2020-10-16 21:36:20'),(22,1,12,9,'2020-10-16 21:36:20'),(23,16,12,8,'2020-10-16 21:36:20'),(24,12,12,6,'2020-10-16 21:36:20'),(25,4,12,9,'2020-10-16 21:36:20'),(26,7,33,6,'2020-10-16 21:36:20'),(27,10,33,8,'2020-10-16 21:36:20'),(28,19,33,7,'2020-10-16 21:36:20'),(29,20,33,10,'2020-10-16 21:36:20'),(30,1,20,10,'2020-10-16 21:36:20'),(31,5,20,6,'2020-10-16 21:36:20'),(32,13,20,8,'2020-10-16 21:36:20'),(33,20,20,9,'2020-10-16 21:36:20'),(34,14,20,7,'2020-10-16 21:36:20'),(35,1,26,8,'2020-10-16 21:36:20'),(36,3,26,9,'2020-10-16 21:36:20'),(37,16,26,8,'2020-10-16 21:36:20'),(38,15,26,6,'2020-10-16 21:36:20'),(39,14,26,10,'2020-10-16 21:36:20'),(40,1,38,10,'2020-10-16 21:36:20'),(41,2,38,6,'2020-10-16 21:36:20'),(42,13,38,8,'2020-10-16 21:36:20'),(43,15,38,7,'2020-10-16 21:36:20'),(44,20,38,10,'2020-10-16 21:36:20'),(45,4,38,8,'2020-10-16 21:36:20'),(46,5,43,10,'2020-10-16 21:36:20'),(47,3,43,6,'2020-10-16 21:36:20'),(48,1,43,8,'2020-10-16 21:36:20'),(49,15,43,10,'2020-10-16 21:36:20'),(50,18,43,7,'2020-10-16 21:36:20'),(51,14,43,9,'2020-10-16 21:36:20'),(52,2,45,9,'2020-10-16 21:36:20'),(53,7,45,7,'2020-10-16 21:36:20'),(54,12,45,8,'2020-10-16 21:36:20'),(55,20,45,7,'2020-10-16 21:36:20'),(56,13,45,10,'2020-10-16 21:36:20'),(57,1,45,10,'2020-10-16 21:36:20'),(58,1,48,10,'2020-10-16 21:36:20'),(59,3,48,6,'2020-10-16 21:36:20'),(60,4,48,8,'2020-10-16 21:36:20'),(61,8,48,7,'2020-10-16 21:36:20'),(62,6,48,8,'2020-10-16 21:36:20'),(63,18,48,9,'2020-10-16 21:36:20'),(64,1,17,6,'2020-10-16 21:36:20'),(65,5,17,10,'2020-10-16 21:36:20'),(66,6,17,6,'2020-10-16 21:36:20'),(67,2,17,8,'2020-10-16 21:36:20'),(68,16,17,10,'2020-10-16 21:36:20'),(69,17,17,8,'2020-10-16 21:36:21'),(70,20,17,9,'2020-10-16 21:36:21'),(71,11,18,8,'2020-10-16 21:36:21'),(72,1,18,8,'2020-10-16 21:36:21'),(73,5,18,10,'2020-10-16 21:36:21'),(74,3,18,6,'2020-10-16 21:36:21'),(75,12,18,8,'2020-10-16 21:36:21'),(76,15,18,7,'2020-10-16 21:36:21'),(77,17,18,8,'2020-10-16 21:36:21'),(78,20,18,9,'2020-10-16 21:36:21'),(79,19,19,8,'2020-10-16 21:36:21'),(80,2,19,6,'2020-10-16 21:36:21'),(81,5,19,10,'2020-10-16 21:36:21'),(82,10,19,6,'2020-10-16 21:36:21'),(83,11,19,8,'2020-10-16 21:36:21'),(84,13,19,10,'2020-10-16 21:36:21'),(85,16,19,8,'2020-10-16 21:36:21'),(86,20,19,9,'2020-10-16 21:36:21'),(87,1,3,8,'2020-10-16 21:36:21'),(88,3,3,6,'2020-10-16 21:36:21'),(89,5,3,10,'2020-10-16 21:36:21'),(90,4,3,6,'2020-10-16 21:36:21'),(91,11,3,9,'2020-10-16 21:36:21'),(92,12,3,10,'2020-10-16 21:36:21'),(93,17,3,6,'2020-10-16 21:36:21'),(94,19,3,7,'2020-10-16 21:36:21'),(95,20,3,8,'2020-10-16 21:36:21'),(96,1,15,7,'2020-10-16 21:36:21'),(97,3,15,6,'2020-10-16 21:36:21'),(98,5,15,9,'2020-10-16 21:36:21'),(99,4,15,6,'2020-10-16 21:36:21'),(100,11,15,7,'2020-10-16 21:36:21'),(101,12,15,8,'2020-10-16 21:36:21'),(102,17,15,7,'2020-10-16 21:36:21'),(103,19,15,7,'2020-10-16 21:36:21'),(104,20,15,8,'2020-10-16 21:36:21'),(105,18,15,7,'2020-10-16 21:36:21'),(106,17,15,9,'2020-10-16 21:36:21'),(107,1,24,10,'2020-10-16 21:36:21'),(108,2,24,9,'2020-10-16 21:36:21'),(109,3,24,8,'2020-10-16 21:36:21'),(110,5,24,6,'2020-10-16 21:36:21'),(111,6,24,9,'2020-10-16 21:36:21'),(112,9,24,8,'2020-10-16 21:36:21'),(113,10,24,7,'2020-10-16 21:36:21'),(114,12,24,6,'2020-10-16 21:36:21'),(115,13,24,9,'2020-10-16 21:36:21'),(116,15,24,6,'2020-10-16 21:36:21'),(117,17,24,10,'2020-10-16 21:36:21'),(118,1,25,8,'2020-10-16 21:36:21'),(119,2,25,6,'2020-10-16 21:36:21'),(120,5,25,10,'2020-10-16 21:36:21'),(121,7,25,6,'2020-10-16 21:36:21'),(122,8,25,9,'2020-10-16 21:36:21'),(123,10,25,7,'2020-10-16 21:36:21'),(124,11,25,9,'2020-10-16 21:36:21'),(125,17,25,8,'2020-10-16 21:36:21'),(126,18,25,9,'2020-10-16 21:36:21'),(127,19,25,6,'2020-10-16 21:36:21'),(128,20,25,10,'2020-10-16 21:36:21'),(129,1,30,8,'2020-10-16 21:36:21'),(130,3,30,6,'2020-10-16 21:36:21'),(131,5,30,8,'2020-10-16 21:36:21'),(132,7,30,6,'2020-10-16 21:36:21'),(133,8,30,9,'2020-10-16 21:36:21'),(134,9,30,9,'2020-10-16 21:36:21'),(135,11,30,6,'2020-10-16 21:36:21'),(136,12,30,6,'2020-10-16 21:36:21'),(137,16,30,8,'2020-10-16 21:36:21'),(138,17,30,7,'2020-10-16 21:36:21'),(139,19,30,8,'2020-10-16 21:36:21'),(140,1,49,8,'2020-10-16 21:36:21'),(141,2,49,9,'2020-10-16 21:36:21'),(142,4,49,10,'2020-10-16 21:36:21'),(143,7,49,10,'2020-10-16 21:36:21'),(144,11,49,9,'2020-10-16 21:36:21'),(145,13,49,10,'2020-10-16 21:36:22'),(146,14,49,6,'2020-10-16 21:36:22'),(147,15,49,9,'2020-10-16 21:36:22'),(148,16,49,8,'2020-10-16 21:36:22'),(149,17,49,7,'2020-10-16 21:36:22'),(150,19,49,6,'2020-10-16 21:36:22'),(151,1,10,8,'2020-10-16 21:36:22'),(152,2,10,9,'2020-10-16 21:36:22'),(153,3,10,8,'2020-10-16 21:36:22'),(154,5,10,9,'2020-10-16 21:36:22'),(155,7,10,9,'2020-10-16 21:36:22'),(156,11,10,10,'2020-10-16 21:36:22'),(157,14,10,6,'2020-10-16 21:36:22'),(158,15,10,9,'2020-10-16 21:36:22'),(159,16,10,8,'2020-10-16 21:36:22'),(160,17,10,7,'2020-10-16 21:36:22'),(161,18,10,8,'2020-10-16 21:36:22'),(162,20,10,9,'2020-10-16 21:36:22'),(163,1,22,8,'2020-10-16 21:36:22'),(164,2,22,9,'2020-10-16 21:36:22'),(165,3,22,7,'2020-10-16 21:36:22'),(166,4,22,6,'2020-10-16 21:36:22'),(167,5,22,9,'2020-10-16 21:36:22'),(168,6,22,9,'2020-10-16 21:36:22'),(169,7,22,8,'2020-10-16 21:36:22'),(170,8,22,7,'2020-10-16 21:36:22'),(171,9,22,8,'2020-10-16 21:36:22'),(172,18,22,8,'2020-10-16 21:36:22'),(173,19,22,9,'2020-10-16 21:36:22'),(174,20,22,9,'2020-10-16 21:36:22'),(175,1,41,7,'2020-10-16 21:36:22'),(176,2,41,9,'2020-10-16 21:36:22'),(177,3,41,8,'2020-10-16 21:36:22'),(178,9,41,10,'2020-10-16 21:36:22'),(179,8,41,9,'2020-10-16 21:36:22'),(180,10,41,9,'2020-10-16 21:36:22'),(181,11,41,6,'2020-10-16 21:36:22'),(182,15,41,9,'2020-10-16 21:36:22'),(183,16,41,8,'2020-10-16 21:36:22'),(184,17,41,9,'2020-10-16 21:36:22'),(185,19,41,8,'2020-10-16 21:36:22'),(186,20,41,10,'2020-10-16 21:36:22'),(187,1,39,10,'2020-10-16 21:36:22'),(188,2,39,9,'2020-10-16 21:36:22'),(189,3,39,8,'2020-10-16 21:36:22'),(190,7,39,9,'2020-10-16 21:36:22'),(191,6,39,9,'2020-10-16 21:36:22'),(192,10,39,9,'2020-10-16 21:36:22'),(193,11,39,6,'2020-10-16 21:36:22'),(194,12,39,8,'2020-10-16 21:36:22'),(195,16,39,8,'2020-10-16 21:36:22'),(196,17,39,9,'2020-10-16 21:36:22'),(197,18,39,7,'2020-10-16 21:36:22'),(198,19,39,10,'2020-10-16 21:36:22'),(199,20,39,9,'2020-10-16 21:36:22'),(200,1,13,10,'2020-10-16 21:36:22'),(201,2,13,9,'2020-10-16 21:36:22'),(202,3,13,7,'2020-10-16 21:36:22'),(203,4,13,9,'2020-10-16 21:36:22'),(204,5,13,9,'2020-10-16 21:36:22'),(205,7,13,6,'2020-10-16 21:36:22'),(206,14,13,6,'2020-10-16 21:36:22'),(207,13,13,8,'2020-10-16 21:36:22'),(208,17,13,8,'2020-10-16 21:36:22'),(209,18,13,9,'2020-10-16 21:36:22'),(210,19,13,7,'2020-10-16 21:36:22'),(211,20,13,7,'2020-10-16 21:36:22'),(212,8,13,9,'2020-10-16 21:36:22'),(213,9,13,9,'2020-10-16 21:36:22'),(214,1,14,9,'2020-10-16 21:36:22'),(215,2,14,9,'2020-10-16 21:36:22'),(216,3,14,8,'2020-10-16 21:36:22'),(217,4,14,10,'2020-10-16 21:36:22'),(218,5,14,9,'2020-10-16 21:36:22'),(219,6,14,9,'2020-10-16 21:36:22'),(220,7,14,6,'2020-10-16 21:36:22'),(221,13,14,7,'2020-10-16 21:36:22'),(222,14,14,8,'2020-10-16 21:36:22'),(223,15,14,9,'2020-10-16 21:36:22'),(224,16,14,7,'2020-10-16 21:36:22'),(225,18,14,10,'2020-10-16 21:36:22'),(226,19,14,6,'2020-10-16 21:36:23'),(227,20,14,7,'2020-10-16 21:36:23'),(228,1,16,10,'2020-10-16 21:36:23'),(229,2,16,10,'2020-10-16 21:36:23'),(230,3,16,9,'2020-10-16 21:36:23'),(231,4,16,7,'2020-10-16 21:36:23'),(232,5,16,6,'2020-10-16 21:36:23'),(233,6,16,8,'2020-10-16 21:36:23'),(234,8,16,6,'2020-10-16 21:36:23'),(235,9,16,8,'2020-10-16 21:36:23'),(236,10,16,9,'2020-10-16 21:36:23'),(237,11,16,10,'2020-10-16 21:36:23'),(238,12,16,7,'2020-10-16 21:36:23'),(239,13,16,6,'2020-10-16 21:36:23'),(240,14,16,8,'2020-10-16 21:36:23'),(241,18,16,9,'2020-10-16 21:36:23'),(242,1,31,7,'2020-10-16 21:36:23'),(243,2,31,10,'2020-10-16 21:36:23'),(244,3,31,9,'2020-10-16 21:36:23'),(245,4,31,9,'2020-10-16 21:36:23'),(246,5,31,6,'2020-10-16 21:36:23'),(247,6,31,8,'2020-10-16 21:36:23'),(248,7,31,8,'2020-10-16 21:36:23'),(249,8,31,8,'2020-10-16 21:36:23'),(250,10,31,9,'2020-10-16 21:36:23'),(251,13,31,8,'2020-10-16 21:36:23'),(252,14,31,7,'2020-10-16 21:36:23'),(253,16,31,6,'2020-10-16 21:36:23'),(254,17,31,8,'2020-10-16 21:36:23'),(255,19,31,6,'2020-10-16 21:36:23'),(256,1,40,8,'2020-10-16 21:36:23'),(257,2,40,9,'2020-10-16 21:36:23'),(258,3,40,8,'2020-10-16 21:36:23'),(259,4,40,9,'2020-10-16 21:36:23'),(260,5,40,9,'2020-10-16 21:36:23'),(261,6,40,10,'2020-10-16 21:36:23'),(262,8,40,6,'2020-10-16 21:36:23'),(263,9,40,8,'2020-10-16 21:36:23'),(264,10,40,9,'2020-10-16 21:36:23'),(265,11,40,9,'2020-10-16 21:36:23'),(266,14,40,7,'2020-10-16 21:36:23'),(267,15,40,6,'2020-10-16 21:36:23'),(268,16,40,9,'2020-10-16 21:36:23'),(269,17,40,9,'2020-10-16 21:36:23'),(270,1,46,8,'2020-10-16 21:36:23'),(271,2,46,9,'2020-10-16 21:36:23'),(272,3,46,9,'2020-10-16 21:36:23'),(273,4,46,8,'2020-10-16 21:36:23'),(274,5,46,7,'2020-10-16 21:36:23'),(275,9,46,9,'2020-10-16 21:36:23'),(276,11,46,6,'2020-10-16 21:36:23'),(277,13,46,8,'2020-10-16 21:36:23'),(278,14,46,8,'2020-10-16 21:36:23'),(279,15,46,10,'2020-10-16 21:36:23'),(280,16,46,9,'2020-10-16 21:36:23'),(281,18,46,8,'2020-10-16 21:36:23'),(282,19,46,9,'2020-10-16 21:36:23'),(283,20,46,9,'2020-10-16 21:36:23'),(284,1,1,9,'2020-10-16 21:36:23'),(285,2,1,9,'2020-10-16 21:36:23'),(286,3,1,8,'2020-10-16 21:36:23'),(287,4,1,8,'2020-10-16 21:36:23'),(288,5,1,9,'2020-10-16 21:36:23'),(289,6,1,9,'2020-10-16 21:36:23'),(290,7,1,9,'2020-10-16 21:36:23'),(291,8,1,8,'2020-10-16 21:36:23'),(292,10,1,10,'2020-10-16 21:36:23'),(293,11,1,9,'2020-10-16 21:36:23'),(294,12,1,9,'2020-10-16 21:36:23'),(295,13,1,10,'2020-10-16 21:36:23'),(296,14,1,9,'2020-10-16 21:36:23'),(297,15,1,9,'2020-10-16 21:36:23'),(298,18,1,8,'2020-10-16 21:36:23'),(299,1,5,9,'2020-10-16 21:36:23'),(300,2,5,10,'2020-10-16 21:36:23'),(301,3,5,7,'2020-10-16 21:36:23'),(302,5,5,9,'2020-10-16 21:36:23'),(303,6,5,9,'2020-10-16 21:36:23'),(304,7,5,8,'2020-10-16 21:36:23'),(305,8,5,6,'2020-10-16 21:36:23'),(306,10,5,8,'2020-10-16 21:36:23'),(307,11,5,10,'2020-10-16 21:36:23'),(308,12,5,7,'2020-10-16 21:36:23'),(309,13,5,7,'2020-10-16 21:36:23'),(310,14,5,9,'2020-10-16 21:36:23'),(311,15,5,9,'2020-10-16 21:36:23'),(312,16,5,10,'2020-10-16 21:36:23'),(313,19,5,9,'2020-10-16 21:36:24'),(314,1,7,9,'2020-10-16 21:36:24'),(315,2,7,8,'2020-10-16 21:36:24'),(316,3,7,7,'2020-10-16 21:36:24'),(317,4,7,9,'2020-10-16 21:36:24'),(318,6,7,9,'2020-10-16 21:36:24'),(319,7,7,10,'2020-10-16 21:36:24'),(320,8,7,6,'2020-10-16 21:36:24'),(321,9,7,8,'2020-10-16 21:36:24'),(322,12,7,7,'2020-10-16 21:36:24'),(323,10,7,7,'2020-10-16 21:36:24'),(324,13,7,7,'2020-10-16 21:36:24'),(325,14,7,8,'2020-10-16 21:36:24'),(326,15,7,9,'2020-10-16 21:36:24'),(327,17,7,10,'2020-10-16 21:36:24'),(328,20,7,9,'2020-10-16 21:36:24'),(329,1,35,8,'2020-10-16 21:36:24'),(330,2,35,10,'2020-10-16 21:36:24'),(331,3,35,9,'2020-10-16 21:36:24'),(332,4,35,9,'2020-10-16 21:36:24'),(333,5,35,7,'2020-10-16 21:36:24'),(334,6,35,9,'2020-10-16 21:36:24'),(335,7,35,6,'2020-10-16 21:36:24'),(336,8,35,9,'2020-10-16 21:36:24'),(337,9,35,8,'2020-10-16 21:36:24'),(338,10,35,9,'2020-10-16 21:36:24'),(339,11,35,7,'2020-10-16 21:36:24'),(340,12,35,6,'2020-10-16 21:36:24'),(341,13,35,9,'2020-10-16 21:36:24'),(342,14,35,8,'2020-10-16 21:36:24'),(343,15,35,10,'2020-10-16 21:36:24'),(344,1,50,8,'2020-10-16 21:36:24'),(345,2,50,9,'2020-10-16 21:36:24'),(346,3,50,8,'2020-10-16 21:36:24'),(347,4,50,8,'2020-10-16 21:36:24'),(348,5,50,9,'2020-10-16 21:36:24'),(349,7,50,9,'2020-10-16 21:36:24'),(350,8,50,9,'2020-10-16 21:36:24'),(351,9,50,8,'2020-10-16 21:36:24'),(352,10,50,6,'2020-10-16 21:36:24'),(353,11,50,9,'2020-10-16 21:36:24'),(354,12,50,7,'2020-10-16 21:36:24'),(355,15,50,7,'2020-10-16 21:36:24'),(356,16,50,9,'2020-10-16 21:36:24'),(357,17,50,8,'2020-10-16 21:36:24'),(358,19,50,9,'2020-10-16 21:36:24'),(359,1,6,9,'2020-10-16 21:36:24'),(360,2,6,10,'2020-10-16 21:36:24'),(361,3,6,9,'2020-10-16 21:36:24'),(362,4,6,8,'2020-10-16 21:36:24'),(363,5,6,7,'2020-10-16 21:36:24'),(364,6,6,9,'2020-10-16 21:36:24'),(365,7,6,8,'2020-10-16 21:36:24'),(366,8,6,9,'2020-10-16 21:36:24'),(367,9,6,8,'2020-10-16 21:36:24'),(368,10,6,7,'2020-10-16 21:36:24'),(369,14,6,7,'2020-10-16 21:36:24'),(370,15,6,8,'2020-10-16 21:36:24'),(371,16,6,9,'2020-10-16 21:36:24'),(372,17,6,8,'2020-10-16 21:36:24'),(373,18,6,9,'2020-10-16 21:36:24'),(374,19,6,10,'2020-10-16 21:36:24'),(375,1,23,10,'2020-10-16 21:36:24'),(376,2,23,9,'2020-10-16 21:36:24'),(377,3,23,9,'2020-10-16 21:36:24'),(378,4,23,8,'2020-10-16 21:36:24'),(379,5,23,9,'2020-10-16 21:36:24'),(380,7,23,8,'2020-10-16 21:36:24'),(381,8,23,7,'2020-10-16 21:36:24'),(382,9,23,10,'2020-10-16 21:36:24'),(383,10,23,9,'2020-10-16 21:36:24'),(384,11,23,9,'2020-10-16 21:36:24'),(385,12,23,6,'2020-10-16 21:36:24'),(386,13,23,7,'2020-10-16 21:36:24'),(387,14,23,9,'2020-10-16 21:36:24'),(388,15,23,9,'2020-10-16 21:36:24'),(389,19,23,8,'2020-10-16 21:36:24'),(390,20,23,10,'2020-10-16 21:36:24'),(391,1,4,9,'2020-10-16 21:36:24'),(392,2,4,9,'2020-10-16 21:36:24'),(393,3,4,9,'2020-10-16 21:36:24'),(394,4,4,10,'2020-10-16 21:36:24'),(395,5,4,7,'2020-10-16 21:36:24'),(396,6,4,9,'2020-10-16 21:36:24'),(397,7,4,9,'2020-10-16 21:36:24'),(398,8,4,9,'2020-10-16 21:36:24'),(399,9,4,8,'2020-10-16 21:36:24'),(400,10,4,7,'2020-10-16 21:36:24'),(401,11,4,6,'2020-10-16 21:36:25'),(402,12,4,8,'2020-10-16 21:36:25'),(403,13,4,9,'2020-10-16 21:36:25'),(404,14,4,9,'2020-10-16 21:36:25'),(405,18,4,9,'2020-10-16 21:36:25'),(406,19,4,10,'2020-10-16 21:36:25'),(407,20,4,9,'2020-10-16 21:36:25'),(408,1,27,7,'2020-10-16 21:36:25'),(409,2,27,9,'2020-10-16 21:36:25'),(410,3,27,9,'2020-10-16 21:36:25'),(411,4,27,8,'2020-10-16 21:36:25'),(412,5,27,9,'2020-10-16 21:36:25'),(413,6,27,8,'2020-10-16 21:36:25'),(414,8,27,9,'2020-10-16 21:36:25'),(415,9,27,10,'2020-10-16 21:36:25'),(416,10,27,9,'2020-10-16 21:36:25'),(417,11,27,9,'2020-10-16 21:36:25'),(418,12,27,8,'2020-10-16 21:36:25'),(419,13,27,7,'2020-10-16 21:36:25'),(420,14,27,7,'2020-10-16 21:36:25'),(421,15,27,9,'2020-10-16 21:36:25'),(422,16,27,8,'2020-10-16 21:36:25'),(423,17,27,9,'2020-10-16 21:36:25'),(424,18,27,9,'2020-10-16 21:36:25'),(425,1,42,10,'2020-10-16 21:36:25'),(426,2,42,10,'2020-10-16 21:36:25'),(427,3,42,9,'2020-10-16 21:36:25'),(428,4,42,8,'2020-10-16 21:36:25'),(429,5,42,8,'2020-10-16 21:36:25'),(430,6,42,8,'2020-10-16 21:36:25'),(431,7,42,7,'2020-10-16 21:36:25'),(432,8,42,10,'2020-10-16 21:36:25'),(433,10,42,9,'2020-10-16 21:36:25'),(434,11,42,6,'2020-10-16 21:36:25'),(435,12,42,6,'2020-10-16 21:36:25'),(436,13,42,7,'2020-10-16 21:36:25'),(437,14,42,8,'2020-10-16 21:36:25'),(438,15,42,9,'2020-10-16 21:36:25'),(439,17,42,8,'2020-10-16 21:36:25'),(440,18,42,9,'2020-10-16 21:36:25'),(441,19,42,10,'2020-10-16 21:36:25'),(442,1,2,10,'2020-10-16 21:36:25'),(443,2,2,9,'2020-10-16 21:36:25'),(444,3,2,9,'2020-10-16 21:36:25'),(445,4,2,9,'2020-10-16 21:36:25'),(446,5,2,9,'2020-10-16 21:36:25'),(447,6,2,8,'2020-10-16 21:36:25'),(448,7,2,9,'2020-10-16 21:36:25'),(449,8,2,8,'2020-10-16 21:36:25'),(450,9,2,9,'2020-10-16 21:36:25'),(451,10,2,9,'2020-10-16 21:36:25'),(452,11,2,9,'2020-10-16 21:36:25'),(453,12,2,7,'2020-10-16 21:36:25'),(454,14,2,7,'2020-10-16 21:36:25'),(455,15,2,9,'2020-10-16 21:36:25'),(456,16,2,7,'2020-10-16 21:36:25'),(457,17,2,9,'2020-10-16 21:36:25'),(458,18,2,9,'2020-10-16 21:36:25'),(459,19,2,10,'2020-10-16 21:36:25'),(460,1,8,6,'2020-10-16 21:36:25'),(461,2,8,9,'2020-10-16 21:36:25'),(462,3,8,9,'2020-10-16 21:36:25'),(463,4,8,8,'2020-10-16 21:36:25'),(464,5,8,9,'2020-10-16 21:36:25'),(465,6,8,8,'2020-10-16 21:36:25'),(466,7,8,7,'2020-10-16 21:36:25'),(467,8,8,10,'2020-10-16 21:36:25'),(468,9,8,9,'2020-10-16 21:36:25'),(469,11,8,6,'2020-10-16 21:36:25'),(470,12,8,7,'2020-10-16 21:36:25'),(471,13,8,7,'2020-10-16 21:36:25'),(472,14,8,10,'2020-10-16 21:36:25'),(473,15,8,9,'2020-10-16 21:36:25'),(474,16,8,8,'2020-10-16 21:36:25'),(475,17,8,9,'2020-10-16 21:36:25'),(476,18,8,8,'2020-10-16 21:36:25'),(477,20,8,9,'2020-10-16 21:36:25'),(478,1,44,10,'2020-10-16 21:36:25'),(479,2,44,9,'2020-10-16 21:36:25'),(480,3,44,9,'2020-10-16 21:36:25'),(481,4,44,10,'2020-10-16 21:36:25'),(482,5,44,9,'2020-10-16 21:36:25'),(483,6,44,9,'2020-10-16 21:36:25'),(484,7,44,7,'2020-10-16 21:36:25'),(485,8,44,7,'2020-10-16 21:36:25'),(486,9,44,9,'2020-10-16 21:36:26'),(487,10,44,9,'2020-10-16 21:36:26'),(488,11,44,7,'2020-10-16 21:36:26'),(489,12,44,8,'2020-10-16 21:36:26'),(490,13,44,9,'2020-10-16 21:36:26'),(491,14,44,7,'2020-10-16 21:36:26'),(492,15,44,8,'2020-10-16 21:36:26'),(493,16,44,9,'2020-10-16 21:36:26'),(494,17,44,6,'2020-10-16 21:36:26'),(495,18,44,7,'2020-10-16 21:36:26'),(496,19,44,8,'2020-10-16 21:36:26'),(497,20,44,10,'2020-10-16 21:36:26'),(498,1,9,10,'2020-10-18 12:50:27');
/*!40000 ALTER TABLE `rated_films` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_rating` AFTER INSERT ON `rated_films` FOR EACH ROW begin 
	update films set rating = rate_film(new.film_id) where id = new.film_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `film_id` bigint unsigned NOT NULL,
  `body` text COMMENT 'Текст рецензии',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,23,15,'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.','2020-10-16 22:11:14'),(2,26,9,'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.\n\nEtiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.','2020-10-16 22:11:14'),(3,7,1,'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.','2020-10-16 22:11:14'),(4,49,18,'Fusce consequat. Nulla nisl. Nunc nisl.','2020-10-16 22:11:14'),(5,6,4,'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.\n\nDonec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.','2020-10-16 22:11:14'),(6,22,11,'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.\n\nPhasellus in felis. Donec semper sapien a libero. Nam dui.','2020-10-16 22:11:14'),(7,37,13,'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.','2020-10-16 22:11:14'),(8,48,15,'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.','2020-10-16 22:11:14'),(9,42,13,'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.','2020-10-16 22:11:14'),(10,2,11,'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.\n\nCurabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.','2020-10-16 22:11:14'),(11,40,19,'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.','2020-10-16 22:11:14'),(12,20,18,'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.','2020-10-16 22:11:14'),(13,49,9,'Phasellus in felis. Donec semper sapien a libero. Nam dui.','2020-10-16 22:11:14'),(14,49,7,'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.\n\nIn quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.','2020-10-16 22:11:14'),(15,8,14,'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.\n\nVestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.','2020-10-16 22:11:14'),(16,30,20,'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.\n\nPraesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.','2020-10-16 22:11:14'),(17,5,11,'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.','2020-10-16 22:11:14'),(18,16,3,'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.\n\nNullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.','2020-10-16 22:11:14'),(19,48,20,'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.\n\nInteger ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.','2020-10-16 22:11:14'),(20,4,14,'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.\n\nNam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.\n\nCurabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.','2020-10-16 22:11:14'),(21,22,16,'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.\n\nMorbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.','2020-10-16 22:11:14'),(22,20,8,'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.\n\nNullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.','2020-10-16 22:11:14'),(23,10,19,'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.\n\nSuspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.\n\nMaecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.','2020-10-16 22:11:14'),(24,32,16,'Sed ante. Vivamus tortor. Duis mattis egestas metus.\n\nAenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.','2020-10-16 22:11:14'),(25,6,3,'Phasellus in felis. Donec semper sapien a libero. Nam dui.\n\nProin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.','2020-10-16 22:11:14'),(26,1,5,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.\n\nVestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.','2020-10-16 22:11:14'),(27,39,11,'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.','2020-10-16 22:11:14'),(28,20,2,'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.','2020-10-16 22:11:14'),(29,31,16,'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.','2020-10-16 22:11:14'),(30,32,4,'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.','2020-10-16 22:11:14');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_10`
--

DROP TABLE IF EXISTS `top_10`;
/*!50001 DROP VIEW IF EXISTS `top_10`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_10` AS SELECT 
 1 AS `Title`,
 1 AS `Genre`,
 1 AS `Year`,
 1 AS `Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `unordered_films`
--

DROP TABLE IF EXISTS `unordered_films`;
/*!50001 DROP VIEW IF EXISTS `unordered_films`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `unordered_films` AS SELECT 
 1 AS `Title`,
 1 AS `Price`,
 1 AS `Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(150) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `films_watched` int unsigned NOT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `phone` (`phone`),
  KEY `name` (`name`,`surname`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'ldani0@smugmug.com','jkrYqsn','Laurent','Dani','615-693-2095','M',15,'1985-11-16','2020-10-16 20:09:06'),(2,'jgabb1@mediafire.com','2Ti0iJN8CN','Justina','Gabb','471-314-5917','F',18,'1988-06-19','2020-10-16 20:09:06'),(3,'vricards2@surveymonkey.com','NZJqLX','Valdemar','Ricards','312-786-2855','M',9,'1997-07-11','2020-10-16 20:09:07'),(4,'amassow3@ucoz.com','TB6FTEI','Astrix','Massow','613-305-8707','F',17,'1986-07-11','2020-10-16 20:09:07'),(5,'strainor4@addthis.com','xXhNkbid','Scarlet','Trainor','495-215-0247','F',15,'1988-12-25','2020-10-16 20:09:07'),(6,'fdelacote5@biglobe.ne.jp','H71gPWjKjz','Farra','De La Cote','274-796-4647','F',16,'1999-11-03','2020-10-16 20:09:07'),(7,'otansley6@list-manage.com','7GmliwBs','Ollie','Tansley','448-184-4988','F',15,'1990-12-26','2020-10-16 20:09:07'),(8,'drosenbaum7@abc.net.au','0flEbJyYaKw','Dmitri','Rosenbaum','166-580-5605','M',18,'1992-07-15','2020-10-16 20:09:07'),(9,'blangstone8@rakuten.co.jp','s7ap9WRcHHUI','Barr','Langstone','504-841-6219','M',2,'1999-04-21','2020-10-16 20:09:07'),(10,'agarbert9@wikia.com','ljZsJ0ir','Aldo','Garbert','631-819-8310','M',12,'1999-09-27','2020-10-16 20:09:07'),(11,'ltzarkova@craigslist.org','cSlLJR','Lona','Tzarkov','531-200-1836','F',3,'1988-09-19','2020-10-16 20:09:07'),(12,'charnesb@wix.com','XFrnvh9Qo1F','Christoforo','Harnes','786-790-8997','M',4,'1996-02-16','2020-10-16 20:09:07'),(13,'smacconchiec@epa.gov','MXDHec2y','Skip','MacConchie','727-544-4270','M',14,'1989-11-17','2020-10-16 20:09:07'),(14,'gmaryetd@buzzfeed.com','M6RskaWa8','Gallagher','Maryet','696-756-3748','M',14,'1994-05-02','2020-10-16 20:09:07'),(15,'cbeddoese@bbc.co.uk','wLnpduxWsur','Celle','Beddoes','296-964-4373','F',11,'1985-03-13','2020-10-16 20:09:07'),(16,'fibbottf@google.co.uk','zfsHWQ1eDp','Felizio','Ibbott','754-136-4577','M',14,'1990-05-16','2020-10-16 20:09:07'),(17,'dkarmelg@symantec.com','ixv0se','Darren','Karmel','393-762-1844','M',7,'2000-10-13','2020-10-16 20:09:07'),(18,'tjeannessonh@omniture.com','Q24xgBDuQFmP','Trstram','Jeannesson','347-295-0859','M',8,'1999-01-24','2020-10-16 20:09:07'),(19,'aketteringhami@smugmug.com','LxnEo6z','Amata','Ketteringham','135-191-2670','F',8,'1984-11-05','2020-10-16 20:09:07'),(20,'rsutworthj@google.com.au','jgzbAt6aev','Rayna','Sutworth','767-131-9177','F',5,'1995-11-15','2020-10-16 20:09:07'),(21,'tivoryk@reuters.com','7UZ9RudaP','Theo','Ivory','412-119-6855','F',2,'1991-03-09','2020-10-16 20:09:07'),(22,'cemanuelil@multiply.com','9B1mx5HTHf','Cathi','Emanueli','484-780-9992','F',12,'1995-08-02','2020-10-16 20:09:07'),(23,'dlawtym@addthis.com','sf7owYPET5ax','Debor','Lawty','334-634-0099','F',16,'1998-04-05','2020-10-16 20:09:07'),(24,'phurticn@blogspot.com','klEXQ3ip0','Philbert','Hurtic','820-634-3774','M',11,'1990-03-11','2020-10-16 20:09:07'),(25,'dklimashevicho@freewebs.com','Vh9dDDsx','Donica','Klimashevich','300-533-2757','F',11,'1996-09-01','2020-10-16 20:09:07'),(26,'jhairsp@vinaora.com','BXj7Qpdp2','Jeffy','Hairs','163-106-0901','M',5,'1989-11-29','2020-10-16 20:09:07'),(27,'ptwaitsq@abc.net.au','5iZlCq','Price','Twaits','205-727-4902','M',17,'1984-11-26','2020-10-16 20:09:07'),(28,'wcluer@zimbio.com','WDz6uI','Willamina','Clue','719-551-9877','F',3,'1994-06-11','2020-10-16 20:09:07'),(29,'ftribbles@nbcnews.com','wdIy8gTR7Yw','Fredi','Tribble','749-145-5170','F',1,'1998-02-02','2020-10-16 20:09:07'),(30,'cdaelt@mapquest.com','MvgaOGn','Caresa','Dael','105-932-2978','F',11,'1999-11-24','2020-10-16 20:09:07'),(31,'kwylesu@hatena.ne.jp','ET0Lz6jBj','Keriann','Wyles','938-243-0778','F',14,'2000-09-06','2020-10-16 20:09:07'),(32,'wstefiv@dell.com','txJaXcRJw4','Wake','Stefi','336-702-7935','M',2,'1992-01-09','2020-10-16 20:09:07'),(33,'gdannielw@apple.com','cr8V4QUh','Gabriel','Danniel','469-239-4018','M',4,'1999-02-08','2020-10-16 20:09:07'),(34,'ayoudellx@unesco.org','KqItYNe','Ahmad','Youdell','254-904-6574','M',2,'1996-06-03','2020-10-16 20:09:07'),(35,'sgransdeny@sitemeter.com','7o5gTWDKbb','Sherm','Gransden','615-584-3183','M',15,'1991-11-06','2020-10-16 20:09:07'),(36,'etalz@bloglovin.com','B4uK6f','Edith','Tal','268-758-0322','F',2,'1999-08-31','2020-10-16 20:09:07'),(37,'hmacdonald10@studiopress.com','njuK6W','Herman','MacDonald','230-223-8583','M',1,'1990-05-24','2020-10-16 20:09:07'),(38,'ebeekman11@oaic.gov.au','ucwTFP','Elka','Beekman','270-536-2869','F',6,'1996-12-25','2020-10-16 20:09:07'),(39,'cstritton12@uol.com.br','keeeVTXyEj9','Cyrillus','Stritton','421-513-4875','M',13,'1999-08-05','2020-10-16 20:09:07'),(40,'hphilliphs13@google.com.hk','FsaJPhjngD','Harlen','Philliphs','680-658-5234','M',14,'1994-05-08','2020-10-16 20:09:07'),(41,'nizhaky14@discuz.net','48TSkR','Natka','Izhaky','318-564-9594','F',12,'1988-07-23','2020-10-16 20:09:07'),(42,'lredmayne15@weather.com','0SSeuZG','Lissy','Redmayne','154-587-1081','F',17,'1997-05-01','2020-10-16 20:09:07'),(43,'asopper16@examiner.com','i1kZ3A','Alisander','Sopper','226-957-2862','M',6,'1994-10-04','2020-10-16 20:09:07'),(44,'ppeinton17@sakura.ne.jp','GNHD44xB8Mge','Phylys','Peinton','339-293-4884','F',20,'1994-09-17','2020-10-16 20:09:07'),(45,'bdolligon18@sitemeter.com','dupAL5xxUfk','Barbra','Dolligon','429-714-9686','F',6,'1984-11-20','2020-10-16 20:09:07'),(46,'cdowey19@utexas.edu','uZxlXNqv','Carla','Dowey','522-700-0381','F',14,'1987-10-23','2020-10-16 20:09:07'),(47,'ctingey1a@arstechnica.com','u359k38BxZ6','Catina','Tingey','152-261-8623','F',3,'1987-08-31','2020-10-16 20:09:07'),(48,'vogavin1b@go.com','DKsuHgWg73m','Verna','O\'Gavin','438-406-9306','F',6,'2000-03-02','2020-10-16 20:09:07'),(49,'rpeeter1c@java.com','zZhlmEV8','Rodrick','Peeter','765-950-7401','M',11,'1996-03-11','2020-10-16 20:09:07'),(50,'hcunliffe1d@adobe.com','KFI9pn','Hayyim','Cunliffe','149-431-7039','M',15,'1993-04-09','2020-10-16 20:09:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'kinopoisk_by_me'
--
/*!50003 DROP FUNCTION IF EXISTS `rate_film` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `rate_film`(id_film int) RETURNS float
    READS SQL DATA
begin
	declare rate float;
	set rate = (select avg(rating) from rated_films rf where rf.film_id = id_film);
	return rate;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `rate_all_films` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `rate_all_films`(in num int)
BEGIN
  DECLARE i INT DEFAULT 1;
 if (num > 0) then
 	cycle: WHILE i <= num DO
 	IF i > num THEN LEAVE cycle;
  	END IF;
	-- select rate_film(i);
	update films set rating = rate_film(i) where id = i;
	SET i = i + 1;
  END while cycle;
  ELSE
	SELECT 'Ошибочное значение параметра';
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `top_10`
--

/*!50001 DROP VIEW IF EXISTS `top_10`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_10` (`Title`,`Genre`,`Year`,`Rating`) AS select `films`.`title` AS `title`,`films`.`genre` AS `genre`,`films`.`year` AS `year`,`films`.`rating` AS `rating` from `films` order by `films`.`rating` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unordered_films`
--

/*!50001 DROP VIEW IF EXISTS `unordered_films`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `unordered_films` (`Title`,`Price`,`Rating`) AS select `f`.`title` AS `title`,`f`.`price` AS `price`,`f`.`rating` AS `rating` from (`films` `f` left join (`orders` `o` join `order_films` `of3` on((`of3`.`order_id` = `o`.`id`))) on((`of3`.`film_id` = `f`.`id`))) where (`of3`.`order_id` is null) */;
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

-- Dump completed on 2020-10-18 14:16:10
