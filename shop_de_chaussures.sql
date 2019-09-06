CREATE DATABASE `shoes_shop`;
use `shoes_shop`;
-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: shoes_shop
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `numero_de_rue` int(11) unsigned NOT NULL,
  `nom_de_la_voie` varchar(255) NOT NULL DEFAULT '',
  `complement_d_adresse` varchar(255) NOT NULL DEFAULT '',
  `code_postal` int(11) unsigned NOT NULL,
  `ville` varchar(255) NOT NULL DEFAULT '',
  `pays` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresse_client`
--

DROP TABLE IF EXISTS `adresse_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse_client` (
  `id_client` int(11) unsigned NOT NULL,
  `id_adresse` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_client`,`id_adresse`),
  KEY `fk_cc_from_adresse` (`id_adresse`),
  CONSTRAINT `fk_cc_from_adresse` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id`),
  CONSTRAINT `fk_cc_from_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse_client`
--

LOCK TABLES `adresse_client` WRITE;
/*!40000 ALTER TABLE `adresse_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `adresse_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chaussure`
--

DROP TABLE IF EXISTS `chaussure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chaussure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL DEFAULT '',
  `prix` int(11) unsigned NOT NULL,
  `id_marque` int(11) unsigned NOT NULL,
  `id_modele` int(11) unsigned NOT NULL,
  `id_pointure` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_marque` (`id_marque`),
  KEY `fk_modele` (`id_modele`),
  KEY `fk_pointure` (`id_pointure`),
  CONSTRAINT `fk_marque` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id`),
  CONSTRAINT `fk_modele` FOREIGN KEY (`id_modele`) REFERENCES `modele` (`id`),
  CONSTRAINT `fk_pointure` FOREIGN KEY (`id_pointure`) REFERENCES `pointure` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chaussure`
--

LOCK TABLES `chaussure` WRITE;
/*!40000 ALTER TABLE `chaussure` DISABLE KEYS */;
/*!40000 ALTER TABLE `chaussure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  `prenom` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_for_order` (`client_id`),
  CONSTRAINT `fk_client_for_order` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande_chaussure`
--

DROP TABLE IF EXISTS `commande_chaussure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande_chaussure` (
  `id_commande` int(11) unsigned NOT NULL,
  `id_chaussures` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_commande`,`id_chaussures`),
  KEY `fk_com_chauss_from_chaussure_for_commande` (`id_chaussures`),
  CONSTRAINT `fk_com_chauss_from_chaussure_for_commande` FOREIGN KEY (`id_chaussures`) REFERENCES `chaussure` (`id`),
  CONSTRAINT `fk_com_chauss_fromcommande` FOREIGN KEY (`id_commande`) REFERENCES `adresse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande_chaussure`
--

LOCK TABLES `commande_chaussure` WRITE;
/*!40000 ALTER TABLE `commande_chaussure` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande_chaussure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couleur_chaussure`
--

DROP TABLE IF EXISTS `couleur_chaussure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couleur_chaussure` (
  `id_chaussure` int(11) unsigned NOT NULL,
  `id_couleur` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id_couleur`,`id_chaussure`),
  KEY `fk_cc_from_chaussure` (`id_chaussure`),
  CONSTRAINT `fk_cc_from_chaussure` FOREIGN KEY (`id_chaussure`) REFERENCES `chaussure` (`id`),
  CONSTRAINT `fk_cc_from_couleur` FOREIGN KEY (`id_couleur`) REFERENCES `couleurs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couleur_chaussure`
--

LOCK TABLES `couleur_chaussure` WRITE;
/*!40000 ALTER TABLE `couleur_chaussure` DISABLE KEYS */;
/*!40000 ALTER TABLE `couleur_chaussure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `couleurs`
--

DROP TABLE IF EXISTS `couleurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couleurs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `couleur` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couleurs`
--

LOCK TABLES `couleurs` WRITE;
/*!40000 ALTER TABLE `couleurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `couleurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marque`
--

DROP TABLE IF EXISTS `marque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marque` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marque`
--

LOCK TABLES `marque` WRITE;
/*!40000 ALTER TABLE `marque` DISABLE KEYS */;
/*!40000 ALTER TABLE `marque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modele`
--

DROP TABLE IF EXISTS `modele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modele` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `genre` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modele`
--

LOCK TABLES `modele` WRITE;
/*!40000 ALTER TABLE `modele` DISABLE KEYS */;
/*!40000 ALTER TABLE `modele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pointure`
--

DROP TABLE IF EXISTS `pointure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pointure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `taille` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pointure`
--

LOCK TABLES `pointure` WRITE;
/*!40000 ALTER TABLE `pointure` DISABLE KEYS */;
/*!40000 ALTER TABLE `pointure` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-03 23:36:14
