-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: Camiones
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
-- Table structure for table `Camion`
--

DROP TABLE IF EXISTS `Camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Camion` (
  `matricula` varchar(20) NOT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `potencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camion`
--

LOCK TABLES `Camion` WRITE;
/*!40000 ALTER TABLE `Camion` DISABLE KEYS */;
INSERT INTO `Camion` VALUES ('MAT001','Volvo FH16','Articulado','540 CV'),('MAT002','Mercedes Actros','Rigido','480 CV'),('MAT003','Scania R500','Articulado','500 CV'),('MAT004','MAN TGX','Rigido','460 CV'),('MAT005','DAF XF','Articulado','530 CV');
/*!40000 ALTER TABLE `Camion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Camionero`
--

DROP TABLE IF EXISTS `Camionero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Camionero` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `poblacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Camionero`
--

LOCK TABLES `Camionero` WRITE;
/*!40000 ALTER TABLE `Camionero` DISABLE KEYS */;
INSERT INTO `Camionero` VALUES ('C001','Juan Perez','0991234567','Calle Luna 12',1800.00,'Madrid'),('C002','Maria Lopez','0987654321','Av. Sol 45',2100.50,'Barcelona'),('C003','Carlos Ruiz','0976543210','Calle Estrella 8',1950.75,'Valencia'),('C004','Ana Garcia','0965432109','Av. Mar 33',2300.00,'Sevilla'),('C005','Luis Martinez','0954321098','Calle Rio 21',1750.25,'Bilbao');
/*!40000 ALTER TABLE `Camionero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conduce`
--

DROP TABLE IF EXISTS `Conduce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Conduce` (
  `cedula_camionero` varchar(15) NOT NULL,
  `matricula_camion` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`cedula_camionero`,`matricula_camion`,`fecha`),
  KEY `matricula_camion` (`matricula_camion`),
  CONSTRAINT `Conduce_ibfk_1` FOREIGN KEY (`cedula_camionero`) REFERENCES `Camionero` (`cedula`),
  CONSTRAINT `Conduce_ibfk_2` FOREIGN KEY (`matricula_camion`) REFERENCES `Camion` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conduce`
--

LOCK TABLES `Conduce` WRITE;
/*!40000 ALTER TABLE `Conduce` DISABLE KEYS */;
INSERT INTO `Conduce` VALUES ('C001','MAT001','2024-01-10'),('C001','MAT002','2024-02-15'),('C002','MAT003','2024-03-20'),('C003','MAT004','2024-04-05'),('C004','MAT005','2024-05-12');
/*!40000 ALTER TABLE `Conduce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paquete`
--

DROP TABLE IF EXISTS `Paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paquete` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` text,
  `destinatario` varchar(100) DEFAULT NULL,
  `direccion_destinatario` varchar(200) DEFAULT NULL,
  `cedula_camionero` varchar(20) NOT NULL,
  `codigo_provincia` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cedula_camionero` (`cedula_camionero`),
  KEY `codigo_provincia` (`codigo_provincia`),
  CONSTRAINT `Paquete_ibfk_1` FOREIGN KEY (`cedula_camionero`) REFERENCES `Camionero` (`cedula`),
  CONSTRAINT `Paquete_ibfk_2` FOREIGN KEY (`codigo_provincia`) REFERENCES `Provincia` (`codigo_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paquete`
--

LOCK TABLES `Paquete` WRITE;
/*!40000 ALTER TABLE `Paquete` DISABLE KEYS */;
INSERT INTO `Paquete` VALUES (1,'Electrodomesticos','Pedro Sanchez','Calle Mayor 10','C001','P001'),(2,'Ropa y calzado','Laura Torres','Av. Central 25','C002','P002'),(3,'Libros y papeleria','Sofia Mendez','Calle Norte 8','C003','P003'),(4,'Informatica','Diego Romero','Av. Sur 44','C004','P004'),(5,'Alimentos secos','Elena Castro','Calle Oeste 17','C005','P005');
/*!40000 ALTER TABLE `Paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provincia`
--

DROP TABLE IF EXISTS `Provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Provincia` (
  `codigo_provincia` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provincia`
--

LOCK TABLES `Provincia` WRITE;
/*!40000 ALTER TABLE `Provincia` DISABLE KEYS */;
INSERT INTO `Provincia` VALUES ('P001','Madrid'),('P002','Barcelona'),('P003','Valencia'),('P004','Sevilla'),('P005','Bilbao');
/*!40000 ALTER TABLE `Provincia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 17:37:33
