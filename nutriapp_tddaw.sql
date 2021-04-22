CREATE DATABASE  IF NOT EXISTS `nutriapp_tddaw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `nutriapp_tddaw`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: nutriapp_tddaw
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividad_fisica`
--

DROP TABLE IF EXISTS `actividad_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `actividad_fisica` (
  `id` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `veces_por_semana` int(11) NOT NULL,
  `horas_por_semana` int(11) NOT NULL,
  `antiguedad` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_idx` (`id_usuario`),
  CONSTRAINT `usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividad_fisica`
--

LOCK TABLES `actividad_fisica` WRITE;
/*!40000 ALTER TABLE `actividad_fisica` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividad_fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adicionales`
--

DROP TABLE IF EXISTS `adicionales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `adicionales` (
  `id` int(11) NOT NULL,
  `estado_civil` varchar(45) NOT NULL,
  `no_hijos` int(11) DEFAULT NULL,
  `con_quien_vive` varchar(45) DEFAULT NULL,
  `escolaridad` varchar(45) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `razon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adicionales`
--

LOCK TABLES `adicionales` WRITE;
/*!40000 ALTER TABLE `adicionales` DISABLE KEYS */;
/*!40000 ALTER TABLE `adicionales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alimento`
--

DROP TABLE IF EXISTS `alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alimento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `id_porcion` int(11) NOT NULL,
  `id_tipo_porcion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_porcion_idx` (`id_porcion`),
  KEY `fk_tipo_porcion_idx` (`id_tipo_porcion`),
  CONSTRAINT `fk_porcion` FOREIGN KEY (`id_porcion`) REFERENCES `porcion` (`id`),
  CONSTRAINT `fk_tipo_porcion` FOREIGN KEY (`id_tipo_porcion`) REFERENCES `tipo_porcion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimento`
--

LOCK TABLES `alimento` WRITE;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
INSERT INTO `alimento` VALUES (425473333,'naranja','grande',1,1),(825767573,'prueba','prueba',1,1),(1325502557,'manzana','roja',2,1),(1419178633,'leche','blanca',1,1),(1423966423,'mandarina','verdes',2,1),(1502983943,'pera','vainilla',1,1),(1527745631,'pepino','grande',1,1),(1778633056,'papaya','grande',2,1);
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ct_tipo_enfermedad`
--

DROP TABLE IF EXISTS `ct_tipo_enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ct_tipo_enfermedad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ct_tipo_enfermedad`
--

LOCK TABLES `ct_tipo_enfermedad` WRITE;
/*!40000 ALTER TABLE `ct_tipo_enfermedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ct_tipo_enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribucion_grupo`
--

DROP TABLE IF EXISTS `distribucion_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `distribucion_grupo` (
  `id` int(11) NOT NULL,
  `ig_usuario_grupo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario_grupo_idx` (`ig_usuario_grupo`),
  CONSTRAINT `fk_id_usuario_grupo` FOREIGN KEY (`ig_usuario_grupo`) REFERENCES `usuario_grupo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribucion_grupo`
--

LOCK TABLES `distribucion_grupo` WRITE;
/*!40000 ALTER TABLE `distribucion_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `distribucion_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_alimento`
--

DROP TABLE IF EXISTS `grupo_alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `grupo_alimento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_alimento`
--

LOCK TABLES `grupo_alimento` WRITE;
/*!40000 ALTER TABLE `grupo_alimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_indicadores`
--

DROP TABLE IF EXISTS `historial_indicadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `historial_indicadores` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cintura` int(11) NOT NULL,
  `cadera` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `imc` int(11) NOT NULL,
  `gct_porciento` int(11) NOT NULL,
  `gct_kilogramos` int(11) NOT NULL,
  `musculo_porciento` int(11) NOT NULL,
  `musculo_kilogramos` int(11) NOT NULL,
  `kilocalolrias` int(11) NOT NULL,
  `edad_metabolica` int(11) NOT NULL,
  `grasa_visceral` int(11) NOT NULL,
  `presion` varchar(20) DEFAULT NULL,
  `pulso` int(11) NOT NULL,
  `observaciones` varchar(100) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario_ind_idx` (`id_usuario`),
  CONSTRAINT `fk_id_usuario_ind` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_indicadores`
--

LOCK TABLES `historial_indicadores` WRITE;
/*!40000 ALTER TABLE `historial_indicadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_indicadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratorios`
--

DROP TABLE IF EXISTS `laboratorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `laboratorios` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `imagen` longblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_lab_idx` (`id_usuario`),
  CONSTRAINT `fk_usuario_lab` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratorios`
--

LOCK TABLES `laboratorios` WRITE;
/*!40000 ALTER TABLE `laboratorios` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porcion`
--

DROP TABLE IF EXISTS `porcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `porcion` (
  `id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porcion`
--

LOCK TABLES `porcion` WRITE;
/*!40000 ALTER TABLE `porcion` DISABLE KEYS */;
INSERT INTO `porcion` VALUES (1,250),(2,500),(3,750),(4,1),(5,1),(6,2);
/*!40000 ALTER TABLE `porcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (0,'nutriologo','2018-11-23 03:54:51'),(1,'paciente','2018-11-23 03:54:51');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signos_clinicos`
--

DROP TABLE IF EXISTS `signos_clinicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `signos_clinicos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `nivel` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario_sc_idx` (`id_usuario`),
  CONSTRAINT `fk_id_usuario_sc` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signos_clinicos`
--

LOCK TABLES `signos_clinicos` WRITE;
/*!40000 ALTER TABLE `signos_clinicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `signos_clinicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_porcion`
--

DROP TABLE IF EXISTS `tipo_porcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_porcion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_porcion`
--

LOCK TABLES `tipo_porcion` WRITE;
/*!40000 ALTER TABLE `tipo_porcion` DISABLE KEYS */;
INSERT INTO `tipo_porcion` VALUES (1,'taza','250ml'),(2,'pieza','completa'),(3,'rebanada','completa'),(4,'cucharada','5ml'),(5,'gramos','gr');
/*!40000 ALTER TABLE `tipo_porcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_grupo`
--

DROP TABLE IF EXISTS `usuario_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario_grupo` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_grup_idx` (`id_usuario`),
  KEY `fk_id_grupo_grup_idx` (`id_grupo`),
  CONSTRAINT `fk_id_grupo_grup` FOREIGN KEY (`id_grupo`) REFERENCES `grupo_alimento` (`id`),
  CONSTRAINT `fk_usuario_grup` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_grupo`
--

LOCK TABLES `usuario_grupo` WRITE;
/*!40000 ALTER TABLE `usuario_grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_tipo_enfermedad_familiares`
--

DROP TABLE IF EXISTS `usuario_tipo_enfermedad_familiares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario_tipo_enfermedad_familiares` (
  `id` int(11) NOT NULL,
  `id_tipo_enfermedad` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `familiar` varchar(45) NOT NULL,
  `linea` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tipo_enfermedad_idx` (`id_tipo_enfermedad`),
  KEY `fk_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_tipo_enfermedad` FOREIGN KEY (`id_tipo_enfermedad`) REFERENCES `ct_tipo_enfermedad` (`id`),
  CONSTRAINT `fk_usuario_ef` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_tipo_enfermedad_familiares`
--

LOCK TABLES `usuario_tipo_enfermedad_familiares` WRITE;
/*!40000 ALTER TABLE `usuario_tipo_enfermedad_familiares` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_tipo_enfermedad_familiares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_tipo_enfermedad_personal`
--

DROP TABLE IF EXISTS `usuario_tipo_enfermedad_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario_tipo_enfermedad_personal` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_tipo_enfermedad` int(11) NOT NULL,
  `antiguedad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_ep_idx` (`id_usuario`),
  KEY `fk_tipo_enfermedad_p_idx` (`id_tipo_enfermedad`),
  CONSTRAINT `fk_tipo_enfermedad_p` FOREIGN KEY (`id_tipo_enfermedad`) REFERENCES `ct_tipo_enfermedad` (`id`),
  CONSTRAINT `fk_usuario_ep` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_tipo_enfermedad_personal`
--

LOCK TABLES `usuario_tipo_enfermedad_personal` WRITE;
/*!40000 ALTER TABLE `usuario_tipo_enfermedad_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_tipo_enfermedad_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido_paterno` varchar(45) NOT NULL,
  `apellido_materno` varchar(45) DEFAULT NULL,
  `edad` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `celular` int(11) NOT NULL,
  `estatura` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_rol_idx` (`id_rol`),
  CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Contiene los usuarios registrados en la plataforma, identificados por rol';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Jacqueline','Chagoya','Galvan',27,'yaqui_cg@icloud.com',553226,150,1,'2019-01-10 04:32:40'),(2,'Rosa','Amador','Lopez',45,'rosa@correo.com',523696,160,1,'2019-01-10 04:37:41'),(3,'Luis','Rizo','Izazaga',50,'luis@corrreo.com',894561,180,1,'2019-01-10 04:37:41'),(4,'Sebastian','Hernandez','Galvan',15,'sebastian@correo.com',123456,145,1,'2019-01-10 04:37:41'),(5,'Monserrat','Perez','Villa',26,'monse@correo.com',159874,158,1,'2019-01-10 04:37:41'),(1418326586,'Maria','Perez','Amador',63,'maria@correo.com',561234,165,1,'2019-01-10 08:54:36'),(2132289675,'Miriam','Lorenzo','Rios',41,'miriam@correo.com',512348,159,1,'2019-01-10 04:55:18');
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

-- Dump completed on 2019-01-10  3:20:15
