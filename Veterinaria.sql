-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: Veterinaria
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
-- Table structure for table `Auxiliar`
--

DROP TABLE IF EXISTS `Auxiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Auxiliar` (
  `codigo` int NOT NULL,
  `base_cotizacion` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `Auxiliar_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `Personal` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Auxiliar`
--

LOCK TABLES `Auxiliar` WRITE;
/*!40000 ALTER TABLE `Auxiliar` DISABLE KEYS */;
INSERT INTO `Auxiliar` VALUES (4,850.00),(5,920.50);
/*!40000 ALTER TABLE `Auxiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Familiar_Contacto`
--

DROP TABLE IF EXISTS `Familiar_Contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Familiar_Contacto` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `cedula_propietario` varchar(10) NOT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE KEY `cedula_propietario` (`cedula_propietario`),
  CONSTRAINT `Familiar_Contacto_ibfk_1` FOREIGN KEY (`cedula_propietario`) REFERENCES `Propietario` (`cedula`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Familiar_Contacto`
--

LOCK TABLES `Familiar_Contacto` WRITE;
/*!40000 ALTER TABLE `Familiar_Contacto` DISABLE KEYS */;
INSERT INTO `Familiar_Contacto` VALUES ('1111111111','Pedro Garcia','0991111111','1234567890'),('2222222222','Sofia Martinez','0992222222','0987654321'),('3333333333','Elena Torres','0993333333','1122334455'),('4444444444','Diego Romero','0994444444','5544332211'),('5555555555','Laura Castro','0995555555','9988776655');
/*!40000 ALTER TABLE `Familiar_Contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mascota`
--

DROP TABLE IF EXISTS `Mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Mascota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `cedula_propietario` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cedula_propietario` (`cedula_propietario`),
  CONSTRAINT `Mascota_ibfk_1` FOREIGN KEY (`cedula_propietario`) REFERENCES `Propietario` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mascota`
--

LOCK TABLES `Mascota` WRITE;
/*!40000 ALTER TABLE `Mascota` DISABLE KEYS */;
INSERT INTO `Mascota` VALUES (1,'Firulais','2020-03-15','Perro','1234567890'),(2,'Michi','2019-07-22','Gato','0987654321'),(3,'Rocky','2021-01-10','Perro','1122334455'),(4,'Luna','2018-11-05','Conejo','5544332211'),(5,'Perico','2022-06-30','Ave','9988776655');
/*!40000 ALTER TABLE `Mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pasa_Consulta`
--

DROP TABLE IF EXISTS `Pasa_Consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pasa_Consulta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `diagnostico` varchar(255) DEFAULT NULL,
  `id_mascota` int NOT NULL,
  `codigo_veterinario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_mascota` (`id_mascota`),
  KEY `codigo_veterinario` (`codigo_veterinario`),
  CONSTRAINT `Pasa_Consulta_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `Mascota` (`id`),
  CONSTRAINT `Pasa_Consulta_ibfk_2` FOREIGN KEY (`codigo_veterinario`) REFERENCES `Veterinario` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pasa_Consulta`
--

LOCK TABLES `Pasa_Consulta` WRITE;
/*!40000 ALTER TABLE `Pasa_Consulta` DISABLE KEYS */;
INSERT INTO `Pasa_Consulta` VALUES (1,'2024-01-10','Infeccion leve',1,1),(2,'2024-02-15','Alergia cutanea',2,2),(3,'2024-03-20','Fractura de pata',3,1),(4,'2024-04-05','Control rutinario',4,3),(5,'2024-05-12','Infeccion respiratoria',5,2);
/*!40000 ALTER TABLE `Pasa_Consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personal`
--

DROP TABLE IF EXISTS `Personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Personal` (
  `codigo` int NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personal`
--

LOCK TABLES `Personal` WRITE;
/*!40000 ALTER TABLE `Personal` DISABLE KEYS */;
INSERT INTO `Personal` VALUES (1,'1231231230','Dr. Andres Vega'),(2,'3213213210','Dr. Carmen Rios'),(3,'4564564560','Dr. Roberto Paz'),(4,'7897897890','Aux. Lucia Mora'),(5,'6546546540','Aux. Mario Leon');
/*!40000 ALTER TABLE `Personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Propietario`
--

DROP TABLE IF EXISTS `Propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Propietario` (
  `cedula` varchar(10) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Propietario`
--

LOCK TABLES `Propietario` WRITE;
/*!40000 ALTER TABLE `Propietario` DISABLE KEYS */;
INSERT INTO `Propietario` VALUES ('0987654321','Martinez Ruiz','Maria','Av. Norte 45'),('1122334455','Torres Vega','Carlos','Calle Sur 8'),('1234567890','Garcia Lopez','Juan','Calle Rosa 12'),('5544332211','Romero Cruz','Ana','Av. Este 33'),('9988776655','Castro Mora','Luis','Calle Oeste 21');
/*!40000 ALTER TABLE `Propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefono_Propietario`
--

DROP TABLE IF EXISTS `Telefono_Propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Telefono_Propietario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula_propietario` varchar(10) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cedula_propietario` (`cedula_propietario`),
  CONSTRAINT `Telefono_Propietario_ibfk_1` FOREIGN KEY (`cedula_propietario`) REFERENCES `Propietario` (`cedula`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefono_Propietario`
--

LOCK TABLES `Telefono_Propietario` WRITE;
/*!40000 ALTER TABLE `Telefono_Propietario` DISABLE KEYS */;
INSERT INTO `Telefono_Propietario` VALUES (1,'1234567890','0991234567'),(2,'1234567890','0981234567'),(3,'0987654321','0976543210'),(4,'1122334455','0965432109'),(5,'5544332211','0954321098');
/*!40000 ALTER TABLE `Telefono_Propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Veterinario`
--

DROP TABLE IF EXISTS `Veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Veterinario` (
  `codigo` int NOT NULL,
  `fecha_alta` date DEFAULT NULL,
  `especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `Veterinario_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `Personal` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Veterinario`
--

LOCK TABLES `Veterinario` WRITE;
/*!40000 ALTER TABLE `Veterinario` DISABLE KEYS */;
INSERT INTO `Veterinario` VALUES (1,'2020-01-15','Cirugia'),(2,'2019-06-20','Dermatologia'),(3,'2021-03-10','Odontologia');
/*!40000 ALTER TABLE `Veterinario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 17:37:24
