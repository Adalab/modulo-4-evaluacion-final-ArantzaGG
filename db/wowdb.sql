-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: wow
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `idcharacters` int NOT NULL AUTO_INCREMENT,
  `race` varchar(45) NOT NULL,
  `class` varchar(45) NOT NULL,
  `char_name` varchar(45) NOT NULL,
  `spec` varchar(45) NOT NULL,
  `kingdom` varchar(45) NOT NULL,
  `faction` varchar(45) NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`idcharacters`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Tauren','Druida','Pattronum','Equilibrio','C\'Thun','Horda',1),(2,'Elfa de sangre','Cazadora de demonios','Bellatrix','Venganza','C\'Thun','Horda',1),(3,'Elfa de sangre','Cazadora','Naginii','Puntería','C\'Thun','Horda',1),(4,'Vulpera','Maga','Crookshanks','Fuego','C\'Thun','Horda',2),(5,'Dracthyr ','Evocadora','Norbertaa','Devastación','C\'Thun','Horda',2),(6,'Huargen','Guerrero','Lunaticco','Protección','C\'Thun','Alianza',1),(7,'Tauren Monte Alto','Chamana','Nimphadora','Restauración','C\'Thun','Horda',8),(8,'Ciudadana de Kul Tiras','Druida','Miinerva','Feral','C\'Thun','Alianza',8),(9,'Humana','Cazadora','Leviosa','Bestias','C\'Thun','Alianza',7),(11,'No muerta','Bruja','Leggeremens','Aflicción','Sanguino','Horda',7);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idusers` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(1024) NOT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Multipolar','arantzag@hotmail.com','pepinillo'),(2,'Buba','bubabu@gmail.com','guabuba12'),(3,'Maricarmen','carmenmari@maricarmen.com','123554309'),(7,'Gati','holi@hotmail.com','$2b$10$VeFu5HDqfEQD8QQh9DYGk.QkubxoceRc7yIw8DvrQMWsdZnFHhNAe'),(8,'Lidiuski','marilidi@hotmail.com','$2b$10$8htvxpji6TzwgtwjQk05reW58qkM/lYUhyvUKaKx9U/TlRVtcLVxm'),(9,'SoyNuevo','unusernuevo@gmail.com','$2b$10$xRKFKKXT6lpYgiB43L5pR.oTf3zfK6nHg2mYP0ifHdpNfkzn7oDTi'),(10,'Miau','miamiau@miau.com','$2b$10$INdel6GTXbr0wP8Z/iMK7OCxkF3bNJnKJExGhjlOwpdU3KL99J.GS');
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

-- Dump completed on 2023-11-15 12:25:19
