-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: entregable
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `id_club` int NOT NULL AUTO_INCREMENT,
  `nombre_club` varchar(35) DEFAULT NULL,
  `resultado_club` enum('W','P','N') NOT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_club`),
  KEY `fk_club_usuarios` (`id_usuario`),
  CONSTRAINT `fk_club_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,'comunicaciones','N',6),(2,'River Plate','N',8),(3,'Ferrocarril Oeste','N',7),(4,'SAG Ballester','N',9),(5,'CID Moreno','N',5),(6,'Social San Martín','N',2),(7,'Ward','N',4),(8,'Biblioteca Bell','N',3),(9,'Dorrego','N',1),(10,'Lanús','N',14),(11,'Campana Boat','N',13),(12,'Social Echagüe','N',15),(13,'Biblioteca Rivadavia','N',11),(14,'Villa Modelo','N',12),(15,'Huracán','N',10);
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_equipo`),
  KEY `fk_equipo_usuarios` (`id_usuario`),
  CONSTRAINT `fk_equipo_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `posicion_jugador` varchar(20) DEFAULT NULL,
  `categoria` varchar(15) DEFAULT NULL,
  `club` varchar(30) DEFAULT NULL,
  `numero_que_usa_jugador` int NOT NULL,
  PRIMARY KEY (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Lateral derecho','mayor','comunicaciones',26),(2,'Lateral izquierdo\n','mayor','comunicaciones',6),(3,'Extremo izquierdo\n','mayor','comunicaciones',24),(4,'Central','mayor','comunicaciones',11),(5,'Pivote','mayor','comunicaciones',15),(6,'Lateral derecho\n','mayor','comunicaciones',17),(7,'Arquero','mayor','comunicaciones',32),(8,'Pivote','mayor','comunicaciones',10),(9,'Extremo derecho','mayor','comunicaciones',22),(10,'Extremo izquierdo ','mayor','comunicaciones',23),(11,'Lateral derecho','mayor','comunicaciones',5),(12,'Extremo derecho','mayor','comunicaciones',7),(13,'Pivote\n','mayor','comunicaciones',9),(14,'Arquero\n','mayor','comunicaciones',16),(15,'Arquero','mayor','comunicaciones',12),(16,'Central','mayor','comunicaciones',14);
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores_datos`
--

DROP TABLE IF EXISTS `jugadores_datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores_datos` (
  `id_jugadores_datos` int NOT NULL AUTO_INCREMENT,
  `nombre_jugador` varchar(20) DEFAULT NULL,
  `apellido_jugador` varchar(20) DEFAULT NULL,
  `sexo` varchar(15) DEFAULT NULL,
  `id_jugador` int NOT NULL,
  PRIMARY KEY (`id_jugadores_datos`),
  KEY `fk_jugadores_datos_jugadores` (`id_jugador`),
  CONSTRAINT `fk_jugadores_datos_jugadores` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores_datos`
--

LOCK TABLES `jugadores_datos` WRITE;
/*!40000 ALTER TABLE `jugadores_datos` DISABLE KEYS */;
INSERT INTO `jugadores_datos` VALUES (1,' Juan Francisco','Sanfilippo ','masculino',1),(2,'Gabriel ','Longueira ','masculino',2),(3,'Felipe ','Parache ','masculino',3),(4,'Román ','Camacho ','masculino',4),(5,'Augusto ','Cotic ','masculino',5),(6,'Franco ','Quiroga ','masculino',6),(7,'Patricio ','Cotic ','masculino',7),(8,'Santiago ','Laborde ','masculino',8),(9,'Martin ','Vulcano ','masculino',9),(10,'Luciano ','Angeleri ','masculino',10),(11,'Franco ','Bordoni ','masculino',11),(12,'Esteban ','Panelo ','masculino',12),(13,'Nicolás ','Elena ','masculino',13),(14,'Martin ','Martinez ','masculino',14),(15,'Thiago ','Mucci ','masculino',15),(16,'Ramiro ','Wischñevsky ','masculino',16);
/*!40000 ALTER TABLE `jugadores_datos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores_puntos`
--

DROP TABLE IF EXISTS `jugadores_puntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores_puntos` (
  `id_jugadores_puntos` int NOT NULL AUTO_INCREMENT,
  `precio` int NOT NULL,
  `puntos_obtenidos_de_la_semana` int DEFAULT NULL,
  `jugador_de_la_semana` enum('s','n') NOT NULL,
  `id_jugador` int NOT NULL,
  PRIMARY KEY (`id_jugadores_puntos`),
  KEY `fk_jugadores_puntos_jugadores` (`id_jugador`),
  CONSTRAINT `fk_jugadores_puntos_jugadores` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores_puntos`
--

LOCK TABLES `jugadores_puntos` WRITE;
/*!40000 ALTER TABLE `jugadores_puntos` DISABLE KEYS */;
INSERT INTO `jugadores_puntos` VALUES (1,136,10,'n',1),(2,175,8,'n',2),(3,122,3,'n',3),(4,190,0,'n',4),(5,147,5,'n',5),(6,115,12,'n',6),(7,154,15,'n',7),(8,198,4,'s',8),(9,105,4,'n',9),(10,163,8,'n',10),(11,131,3,'n',11),(12,182,2,'n',12),(13,109,0,'n',13),(14,143,1,'n',14),(15,169,10,'n',15),(16,196,0,'n',16);
/*!40000 ALTER TABLE `jugadores_puntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores_seleccionados_por_usuario`
--

DROP TABLE IF EXISTS `jugadores_seleccionados_por_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores_seleccionados_por_usuario` (
  `id_equipo` int NOT NULL,
  `id_jugador` int NOT NULL,
  PRIMARY KEY (`id_equipo`,`id_jugador`),
  KEY `id_jugador` (`id_jugador`),
  CONSTRAINT `jugadores_seleccionados_por_usuario_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`),
  CONSTRAINT `jugadores_seleccionados_por_usuario_ibfk_2` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores_seleccionados_por_usuario`
--

LOCK TABLES `jugadores_seleccionados_por_usuario` WRITE;
/*!40000 ALTER TABLE `jugadores_seleccionados_por_usuario` DISABLE KEYS */;
INSERT INTO `jugadores_seleccionados_por_usuario` VALUES (1,1),(2,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(12,1),(13,1),(14,1),(15,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(11,6),(12,6),(13,6),(14,6),(15,6),(1,7),(3,7),(11,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(11,8),(12,8),(13,8),(14,8),(15,8),(1,9),(8,9),(1,10),(8,10),(2,11),(3,11),(4,11),(5,11),(6,11),(7,11),(9,11),(10,11),(11,11),(12,11),(13,11),(14,11),(15,11),(2,12),(3,12),(4,12),(5,12),(7,12),(9,12),(10,12),(11,12),(12,12),(15,12),(2,13),(3,13),(11,13),(4,14),(6,14),(7,14),(12,14),(13,14),(14,14),(5,15),(6,15),(8,15),(10,15),(13,15),(14,15),(9,16),(15,16);
/*!40000 ALTER TABLE `jugadores_seleccionados_por_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla`
--

DROP TABLE IF EXISTS `tabla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla` (
  `id_tabla` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `puntos_totales` int DEFAULT NULL,
  `puntos_de_la_semana` int DEFAULT NULL,
  PRIMARY KEY (`id_tabla`),
  KEY `fk_tabla_usuarios` (`id_usuario`),
  CONSTRAINT `fk_tabla_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla`
--

LOCK TABLES `tabla` WRITE;
/*!40000 ALTER TABLE `tabla` DISABLE KEYS */;
INSERT INTO `tabla` VALUES (1,1,0,0),(2,2,0,0),(3,3,0,0),(4,4,0,0),(5,5,0,0),(6,6,0,0),(7,7,0,0),(8,8,0,0),(9,9,0,0),(10,10,0,0),(11,11,0,0),(12,12,0,0),(13,13,0,0),(14,14,0,0),(15,15,0,0);
/*!40000 ALTER TABLE `tabla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `edad` int NOT NULL,
  `dni` int NOT NULL,
  `puntos_de_la_semana` int DEFAULT '0',
  `token` int DEFAULT '1600',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'mariano','panelo','123@gmail.com',25,36000000,0,1600),(2,'Juan','Pérez','juanperez@example.com',25,12345678,0,1600),(3,'María','García','mariag@example.com',30,23456789,0,1600),(4,'José','Rodríguez','jose@example.com',35,34567890,0,1600),(5,'Ana','Martínez','ana@example.com',28,45678901,0,1600),(6,'David','López','david@example.com',32,56789012,0,1600),(7,'Laura','Sánchez','laura@example.com',27,67890123,0,1600),(8,'Carlos','González','carlos@example.com',29,78901234,0,1600),(9,'Marta','Díaz','marta@example.com',33,89012345,0,1600),(10,'Pablo','Ruiz','pablo@example.com',31,90123456,0,1600),(11,'Isabel','Fernández','isabel@example.com',26,12345678,0,1600),(12,'Sergio','Jiménez','sergio@example.com',34,23456789,0,1600),(13,'Cristina','Pérez','cristina@example.com',29,34567890,0,1600),(14,'Manuel','García','manuel@example.com',36,45678901,0,1600),(15,'Elena','López','elena@example.com',30,56789012,0,1600);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-17 19:10:40
