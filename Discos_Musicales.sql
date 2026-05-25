-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: Discos_Musicales
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

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
-- Table structure for table `Canciones`
--

DROP TABLE IF EXISTS `Canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Canciones` (
  `id_cancion` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  PRIMARY KEY (`id_cancion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Canciones`
--

LOCK TABLES `Canciones` WRITE;
/*!40000 ALTER TABLE `Canciones` DISABLE KEYS */;
INSERT INTO `Canciones` VALUES (1,'Hips Dont Lie'),(2,'Moscow Mule'),(3,'Bohemian Rhapsody'),(4,'La Incondicional'),(5,'Hello');
/*!40000 ALTER TABLE `Canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cantante`
--

DROP TABLE IF EXISTS `Cantante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cantante` (
  `id_cantante` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cantante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cantante`
--

LOCK TABLES `Cantante` WRITE;
/*!40000 ALTER TABLE `Cantante` DISABLE KEYS */;
INSERT INTO `Cantante` VALUES (1,'Shakira','Colombia'),(2,'Bad Bunny','Puerto Rico'),(3,'Queen','Reino Unido'),(4,'Luis Miguel','Mexico'),(5,'Adele','Reino Unido');
/*!40000 ALTER TABLE `Cantante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contiene`
--

DROP TABLE IF EXISTS `Contiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contiene` (
  `id_disco` int NOT NULL,
  `id_cancion` int NOT NULL,
  `posicion` int NOT NULL,
  PRIMARY KEY (`id_disco`,`id_cancion`),
  KEY `id_cancion` (`id_cancion`),
  CONSTRAINT `Contiene_ibfk_1` FOREIGN KEY (`id_disco`) REFERENCES `Disco` (`id_disco`),
  CONSTRAINT `Contiene_ibfk_2` FOREIGN KEY (`id_cancion`) REFERENCES `Canciones` (`id_cancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contiene`
--

LOCK TABLES `Contiene` WRITE;
/*!40000 ALTER TABLE `Contiene` DISABLE KEYS */;
INSERT INTO `Contiene` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1);
/*!40000 ALTER TABLE `Contiene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disco`
--

DROP TABLE IF EXISTS `Disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Disco` (
  `id_disco` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `id_genero` int NOT NULL,
  `id_cantante` int NOT NULL,
  PRIMARY KEY (`id_disco`),
  KEY `id_genero` (`id_genero`),
  KEY `id_cantante` (`id_cantante`),
  CONSTRAINT `Disco_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `Genero_Musical` (`id_genero`),
  CONSTRAINT `Disco_ibfk_2` FOREIGN KEY (`id_cantante`) REFERENCES `Cantante` (`id_cantante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disco`
--

LOCK TABLES `Disco` WRITE;
/*!40000 ALTER TABLE `Disco` DISABLE KEYS */;
INSERT INTO `Disco` VALUES (1,'Laundry Service',15.99,2,1),(2,'Un Verano Sin Ti',20.50,3,2),(3,'A Night at the Opera',18.75,1,3),(4,'Romance',14.00,5,4),(5,'25',17.99,2,5);
/*!40000 ALTER TABLE `Disco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genero_Musical`
--

DROP TABLE IF EXISTS `Genero_Musical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genero_Musical` (
  `id_genero` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genero_Musical`
--

LOCK TABLES `Genero_Musical` WRITE;
/*!40000 ALTER TABLE `Genero_Musical` DISABLE KEYS */;
INSERT INTO `Genero_Musical` VALUES (1,'Rock'),(2,'Pop'),(3,'Reggaeton'),(4,'Jazz'),(5,'Salsa');
/*!40000 ALTER TABLE `Genero_Musical` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-25 12:46:31
