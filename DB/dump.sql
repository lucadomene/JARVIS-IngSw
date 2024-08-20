-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: ec2-3-71-80-94.eu-central-1.compute.amazonaws.com    Database: springboot
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.6-MariaDB-0+deb12u1

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
-- Current Database: `springboot`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `springboot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `springboot`;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `end_time` time(6) DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL,
  `ssn` varchar(16) NOT NULL,
  `venue_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoxvw27ybrq6bujd4kbobnmh1p` (`venue_id`),
  CONSTRAINT `FKoxvw27ybrq6bujd4kbobnmh1p` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2024-06-01','22:00:00.000000','18:00:00.000000','BRNSTF89A12H501E',1),(2,'2024-06-02','14:00:00.000000','11:00:00.000000','CLBGPP03A01H501E',2),(3,'2024-06-03','16:00:00.000000','09:00:00.000000','BRNSTF89A12H501E',3),(4,'2024-06-04','20:30:00.000000','18:30:00.000000','MASAMI78565957O',4),(7,'2024-06-07','22:00:00.000000','18:00:00.000000','GTTVLN05C41H501R',7),(8,'2024-05-16','18:00:00.000000','08:00:00.000000','CLBGPP03A01H501E',3),(9,'2024-05-20','18:00:00.000000','08:00:00.000000','PLTFRA02E58A952O',3),(11,'2024-06-11','14:30:00.000000','12:00:00.000000','MASAMI78565957O',11),(13,'2024-06-13','20:00:00.000000','17:00:00.000000','TRLSVV02B58D548U',3),(14,'2024-06-14','10:30:00.000000','12:30:00.000000','VRSSRA02E56A952Y',4),(15,'2024-06-15','20:00:00.000000','16:00:00.000000','NNNMRC95M01D548C',5),(16,'2024-06-16','17:30:00.000000','14:30:00.000000','DMNLCU93A14D548T',6),(17,'2024-06-17','11:00:00.000000','15:00:00.000000','RMNCHR88G18H501Z',12),(19,'2024-06-19','13:00:00.000000','10:00:00.000000','MASAMI78565957O',9),(20,'2024-06-20','18:30:00.000000','15:30:00.000000','PLTFRA02E58A952O',12),(21,'2024-06-08','10:30:00.000000','08:30:00.000000','DMNLCU93A14D548T',8),(22,'2024-06-09','21:00:00.000000','17:00:00.000000','PLTFRA02E58A952O',9),(25,'2025-01-31','18:12:49.000000','13:20:36.000000','NNNMRC95M01D548C',3),(26,'2025-04-20','21:31:38.000000','10:50:56.000000','PLTFRA02E58A952O',2),(27,'2024-10-23','17:49:10.000000','08:08:45.000000','VTLLCU89H23H501E',2),(28,'2024-12-15','17:44:40.000000','10:10:09.000000','VRSSRA02E56A952Y',2),(29,'2025-02-05','19:50:38.000000','12:35:49.000000','MASAMI78565957O',2),(30,'2025-02-05','19:50:38.000000','12:35:49.000000','MASAMI78565957O',3),(31,'2024-12-09','15:13:22.000000','08:12:52.000000','BRNSTF89A12H501E',2),(32,'2024-11-12','19:30:29.000000','08:14:37.000000','SNTRCH93P56H501Q',9),(46,'2025-02-16','15:34:18.000000','13:16:33.000000','GTTVLN05C41H501R',2),(48,'2025-08-05','18:19:35.000000','12:54:26.000000','FRRNNA90A41H501L',2),(54,'2024-10-16','16:47:47.000000','13:00:45.000000','GTTVLN05C41H501R',3),(154,'2025-04-09','19:09:53.000000','09:46:07.000000','SNTMRC86M15H501F',2),(155,'2025-04-09','19:09:53.000000','09:46:07.000000','SNTMRC86M15H501F',5),(156,'2025-07-17','20:47:07.000000','08:11:01.000000','SNTMRC86M15H501F',2),(157,'2025-03-03','19:52:26.000000','08:11:52.000000','RMNCHR88G18H501Z',4);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `closing_days`
--

DROP TABLE IF EXISTS `closing_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `closing_days` (
  `venue_id` bigint(20) NOT NULL,
  `closing_day` date DEFAULT NULL,
  KEY `venue_id` (`venue_id`),
  CONSTRAINT `venue_id` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closing_days`
--

LOCK TABLES `closing_days` WRITE;
/*!40000 ALTER TABLE `closing_days` DISABLE KEYS */;
INSERT INTO `closing_days` VALUES (3,'2024-12-25'),(3,'2024-12-31');
/*!40000 ALTER TABLE `closing_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel` (
  `name` varchar(255) NOT NULL,
  `weekday_close` time(6) DEFAULT NULL,
  `weekday_open` time(6) DEFAULT NULL,
  `hourly_cost` double NOT NULL,
  `weekend_close` time(6) DEFAULT NULL,
  `weekend_open` time(6) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES ('Armonia musicale','22:30:00.000000','11:00:00.000000',20,'23:00:00.000000','15:00:00.000000'),('Caleidoscopio Eventi','18:00:00.000000','09:00:00.000000',8,'20:00:00.000000','10:30:00.000000'),('Ciro Food','22:30:00.000000','08:30:00.000000',18,'23:00:00.000000','09:00:00.000000'),('Fulmine & Fuochi','23:00:00.000000','20:00:00.000000',25,'23:00:00.000000','20:30:00.000000'),('Magia Eventi Incantati','20:00:00.000000','11:00:00.000000',12,'21:30:00.000000','12:00:00.000000'),('MassimoEnterprise','19:14:24.000000','08:14:00.000000',10,'20:00:00.000000','10:00:00.000000'),('Nuvola Creativa','20:30:00.000000','10:00:00.000000',14,'20:30:00.000000','11:00:00.000000'),('Sogno Dorato','22:00:00.000000','10:00:00.000000',15,'23:30:00.000000','09:00:00.000000');
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectors` (
  `personnel_name` varchar(255) NOT NULL,
  `sector` varchar(255) DEFAULT NULL,
  KEY `personnel_name` (`personnel_name`),
  CONSTRAINT `personnel_name` FOREIGN KEY (`personnel_name`) REFERENCES `personnel` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
INSERT INTO `sectors` VALUES ('MassimoEnterprise','pulizie'),('MassimoEnterprise','catering'),('MassimoEnterprise','stalking'),('Magia Eventi Incantati','organizzazione'),('Fulmine & Fuochi','intrattenimento'),('Ciro Food','catering'),('Caleidoscopio Eventi','decorazioni'),('Nuvola Creativa','tecnologia'),('Armonia musicale','intrattenimento'),('Sogno Dorato','animazione');
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venues`
--

DROP TABLE IF EXISTS `venues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venues` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `max_capacity` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rent_cost` double NOT NULL,
  `weekday_close` time(6) DEFAULT NULL,
  `weekday_open` time(6) DEFAULT NULL,
  `weekend_close` time(6) DEFAULT NULL,
  `weekend_open` time(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venues`
--

LOCK TABLES `venues` WRITE;
/*!40000 ALTER TABLE `venues` DISABLE KEYS */;
INSERT INTO `venues` VALUES (1,'Via Roma 10, Milano, 20121',150,'Sala delle Meraviglie',1000,'22:00:00.000000','09:00:00.000000','23:00:00.000000','10:00:00.000000'),(2,'Piazza Duomo 5, Firenze, 50122',900,'Castello Smeraldo',1500,'21:00:00.000000','08:00:00.000000','22:00:00.000000','09:00:00.000000'),(3,'Via Saragat 1, Ferrara, 44121',800,'UniFe',100,'20:00:00.000000','08:00:00.000000','15:00:00.000000','10:00:00.000000'),(4,'Corso Italia 15, Napoli, 80138',250,'Palazzo delle stelle',1800,'20:00:00.000000','08:00:00.000000','21:00:00.000000','09:00:00.000000'),(5,'Via Mazzini 33, Roma, 00184',300,'Torre arcobaleno',2000,'21:30:00.000000','09:30:00.000000','22:30:00.000000','10:30:00.000000'),(6,'Viale Dante 50, Verona, 37122',120,'Dimora delle ninfee',900,'22:30:00.000000','10:00:00.000000','23:30:00.000000','11:00:00.000000'),(7,'Piazza San Marco 1, Venezia, 30124',180,'Palazzo delle gondole',1400,'21:00:00.000000','09:00:00.000000','22:00:00.000000','10:00:00.000000'),(8,'Via Verdi 75, Genova, 16121',220,'Parco delle sirene',1600,'20:30:00.000000','08:30:00.000000','21:30:00.000000','09:30:00.000000'),(9,'Via Leopardi 18, Bologna, 40121',170,'Dimora storica',1300,'22:00:00.000000','09:00:00.000000','23:00:00.000000','10:00:00.000000'),(10,'Via Manzoni 7, Bari, 70121',110,'Palazzo  dei sogni',950,'21:00:00.000000','08:00:00.000000','22:00:00.000000','09:00:00.000000'),(11,'Via Garibaldi 22, Berra, 44033',100,'Sala Verde',800,'23:00:00.000000','10:00:00.000000','00:00:00.000000','11:00:00.000000'),(12,'Piazza Domenicani 2, Bolzano, 39100',350,'Terrazza Duomo',2100,'22:00:00.000000','11:00:00.000000','23:59:59.000000','15:00:00.000000');
/*!40000 ALTER TABLE `venues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_for`
--

DROP TABLE IF EXISTS `work_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_for` (
  `booking_id` bigint(20) NOT NULL,
  `personnel_name` varchar(255) NOT NULL,
  PRIMARY KEY (`booking_id`,`personnel_name`),
  KEY `FKqu3o48aq9e02p2ik5i7qitot8` (`personnel_name`),
  CONSTRAINT `FK1ntnsx3ufe8a1wxxd6tai9unf` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  CONSTRAINT `FKqu3o48aq9e02p2ik5i7qitot8` FOREIGN KEY (`personnel_name`) REFERENCES `personnel` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_for`
--

LOCK TABLES `work_for` WRITE;
/*!40000 ALTER TABLE `work_for` DISABLE KEYS */;
INSERT INTO `work_for` VALUES (1,'Sogno Dorato'),(2,'Sogno Dorato'),(3,'Nuvola Creativa'),(4,'Nuvola Creativa'),(7,'Magia Eventi Incantati'),(8,'Fulmine & Fuochi'),(8,'MassimoEnterprise'),(9,'Fulmine & Fuochi'),(9,'MassimoEnterprise'),(11,'Ciro Food'),(13,'Ciro Food'),(14,'Caleidoscopio Eventi'),(15,'Caleidoscopio Eventi'),(16,'Armonia musicale'),(17,'Armonia musicale'),(19,'Ciro Food'),(20,'Ciro Food'),(21,'Ciro Food'),(22,'Ciro Food'),(25,'Sogno Dorato');
/*!40000 ALTER TABLE `work_for` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-20  9:18:00
