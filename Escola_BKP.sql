-- MySQL dump 10.13  Distrib 5.7.20, for macos10.12 (x86_64)
--
-- Host: localhost    Database: ESCOLA
-- ------------------------------------------------------
-- Server version	5.7.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ALUNO`
--

DROP TABLE IF EXISTS `ALUNO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ALUNO` (
  `ID_ALUNO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME_ALUNO` varchar(50) DEFAULT NULL,
  `RG_ALUNO` varchar(45) DEFAULT NULL,
  `MATRICULA` varchar(45) DEFAULT NULL,
  `ENDERECO` varchar(45) DEFAULT NULL,
  `mail_Aluno` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_ALUNO`),
  KEY `IDX_ID_ALUNO` (`ID_ALUNO`),
  KEY `idx_idAluno` (`ID_ALUNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ALUNO`
--

LOCK TABLES `ALUNO` WRITE;
/*!40000 ALTER TABLE `ALUNO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ALUNO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAMPUS`
--

DROP TABLE IF EXISTS `CAMPUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAMPUS` (
  `ID_CAMPUS` int(11) NOT NULL AUTO_INCREMENT,
  `NOME_CAMPUS` varchar(50) DEFAULT NULL,
  `TIPO_CAMPUS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_CAMPUS`),
  KEY `idx_id_campus` (`ID_CAMPUS`),
  KEY `idx_idCampus` (`ID_CAMPUS`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAMPUS`
--

LOCK TABLES `CAMPUS` WRITE;
/*!40000 ALTER TABLE `CAMPUS` DISABLE KEYS */;
INSERT INTO `CAMPUS` VALUES (1,'SALVADOR','PRINCIPAL'),(2,'PAULO AFONSO','PRINCIPAL'),(3,'GLÓRIA','PRINCIPAL'),(4,'Paulo Afonso','Principal'),(5,'Glória','Avançado');
/*!40000 ALTER TABLE `CAMPUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CURSO`
--

DROP TABLE IF EXISTS `CURSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CURSO` (
  `ID_CURSO` int(11) NOT NULL AUTO_INCREMENT,
  `NOME_CURSO` varchar(50) NOT NULL,
  `DESCRICAO_CURSO` varchar(100) DEFAULT NULL,
  `TIPO_CURSO` varchar(50) NOT NULL,
  `ID_CAMPUS` int(11) NOT NULL,
  PRIMARY KEY (`ID_CURSO`),
  KEY `FK_IDCAMPUS_CURSO` (`ID_CAMPUS`),
  KEY `IDX_ID_CURSO` (`ID_CURSO`),
  KEY `idx_idCurso` (`ID_CURSO`),
  CONSTRAINT `FK_IDCAMPUS_CURSO` FOREIGN KEY (`ID_CAMPUS`) REFERENCES `CAMPUS` (`ID_CAMPUS`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CURSO`
--

LOCK TABLES `CURSO` WRITE;
/*!40000 ALTER TABLE `CURSO` DISABLE KEYS */;
INSERT INTO `CURSO` VALUES (1,'INFORMÁTICA','TESTE','SUBSEQUENTE',1),(2,'Biocombustíveis','Curso Técnico de Biocombustíveis','Subsequente',2),(3,'Informática','Curso Técnico em Informática','Subsequente',2);
/*!40000 ALTER TABLE `CURSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CURSODISCIPLINA`
--

DROP TABLE IF EXISTS `CURSODISCIPLINA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CURSODISCIPLINA` (
  `ID_CURSO` int(11) NOT NULL,
  `ID_DISCIPLINA` int(11) NOT NULL,
  PRIMARY KEY (`ID_CURSO`,`ID_DISCIPLINA`),
  KEY `IDX_ID_CURSO_CURSODISCIPLINA` (`ID_CURSO`),
  KEY `IDX_ID_DISCIPLINA_CURSODISCIPLINA` (`ID_DISCIPLINA`),
  CONSTRAINT `FK_IDCURSO_CURSODISCIPLINA` FOREIGN KEY (`ID_CURSO`) REFERENCES `CURSO` (`ID_CURSO`),
  CONSTRAINT `FK_IDDISCIPLINA_CURSODISCIPLINA` FOREIGN KEY (`ID_DISCIPLINA`) REFERENCES `DISCIPLINA` (`ID_DISCIPLINA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CURSODISCIPLINA`
--

LOCK TABLES `CURSODISCIPLINA` WRITE;
/*!40000 ALTER TABLE `CURSODISCIPLINA` DISABLE KEYS */;
/*!40000 ALTER TABLE `CURSODISCIPLINA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DISCIPLINA`
--

DROP TABLE IF EXISTS `DISCIPLINA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DISCIPLINA` (
  `ID_DISCIPLINA` int(11) NOT NULL AUTO_INCREMENT,
  `nome_Disciplina` varchar(100) NOT NULL,
  `DESCRICAO_DISCIPLINA` varchar(100) NOT NULL,
  `ID_PROFESSOR` int(11) NOT NULL,
  PRIMARY KEY (`ID_DISCIPLINA`),
  KEY `FK_IDPROFESSOR` (`ID_PROFESSOR`),
  KEY `IDX_ID_DISCIPLINA` (`ID_DISCIPLINA`),
  KEY `idx_idDisciplina` (`ID_DISCIPLINA`),
  CONSTRAINT `FK_IDPROFESSOR` FOREIGN KEY (`ID_PROFESSOR`) REFERENCES `PROFESSOR` (`ID_PROFESSOR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DISCIPLINA`
--

LOCK TABLES `DISCIPLINA` WRITE;
/*!40000 ALTER TABLE `DISCIPLINA` DISABLE KEYS */;
/*!40000 ALTER TABLE `DISCIPLINA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTAS`
--

DROP TABLE IF EXISTS `NOTAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NOTAS` (
  `ID_ALUNO` int(11) NOT NULL,
  `ID_DISCIPLINA` int(11) NOT NULL,
  `NOTAS` float DEFAULT NULL,
  PRIMARY KEY (`ID_ALUNO`,`ID_DISCIPLINA`),
  KEY `IDX_ID_ALUNO_NOTAS` (`ID_ALUNO`),
  KEY `IDX_ID_DISCIPLINA_NOTAS` (`ID_DISCIPLINA`),
  CONSTRAINT `FK_IDALUNO_NOTAS` FOREIGN KEY (`ID_ALUNO`) REFERENCES `ALUNO` (`ID_ALUNO`),
  CONSTRAINT `FK_IDDISCIPLINA_NOTAS` FOREIGN KEY (`ID_DISCIPLINA`) REFERENCES `DISCIPLINA` (`ID_DISCIPLINA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTAS`
--

LOCK TABLES `NOTAS` WRITE;
/*!40000 ALTER TABLE `NOTAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professor`
--

DROP TABLE IF EXISTS `Professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Professor` (
  `ID_PROFESSOR` int(11) NOT NULL AUTO_INCREMENT,
  `NOME_PROFESSOR` varchar(50) NOT NULL,
  `CPF_PROFESSOR` varchar(40) NOT NULL,
  `TELEFONE` varchar(40) NOT NULL,
  `RG_PROFESSOR` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID_PROFESSOR`),
  KEY `IDX_ID_PROFESSOR` (`ID_PROFESSOR`),
  KEY `idx_idProfessor` (`ID_PROFESSOR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professor`
--

LOCK TABLES `Professor` WRITE;
/*!40000 ALTER TABLE `Professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TELEFONE`
--

DROP TABLE IF EXISTS `TELEFONE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TELEFONE` (
  `ID_TELEFONE` int(11) NOT NULL AUTO_INCREMENT,
  `NUMERO_TELEFONE` varchar(30) DEFAULT NULL,
  `ID_ALUNO` int(11) NOT NULL,
  PRIMARY KEY (`ID_TELEFONE`),
  KEY `FK_IDALUNO_TELEFONE` (`ID_ALUNO`),
  CONSTRAINT `FK_IDALUNO_TELEFONE` FOREIGN KEY (`ID_ALUNO`) REFERENCES `ALUNO` (`ID_ALUNO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TELEFONE`
--

LOCK TABLES `TELEFONE` WRITE;
/*!40000 ALTER TABLE `TELEFONE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TELEFONE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ESCOLA'
--
/*!50003 DROP PROCEDURE IF EXISTS `Selecionar_Alunos3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Selecionar_Alunos3`(IN nome varchar(120), IN id int)
BEGIN
	update Aluno set nome_Aluno = nome where id_Aluno = id;
    SELECT * FROM ALUNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-02 10:40:10


