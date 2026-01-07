-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 05 jan. 2026 à 22:14
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `portfolio`
--

-- --------------------------------------------------------

--
-- Structure de la table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
CREATE TABLE IF NOT EXISTS `experiences` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `societe` varchar(255) NOT NULL,
  `periode` varchar(255) DEFAULT NULL,
  `fonction` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `experiences`
--

INSERT INTO `experiences` (`id`, `societe`, `periode`, `fonction`) VALUES
(1, 'Amaris Consulting LUXEMBOURG', 'Janvier 2012 - Aujourd\'hui', 'Développeur dans le domaine de la logistique'),
(2, 'Partenaires Sociaux S.A. RODANGE', 'octobre 2010 - avril 2011', 'Analyste programmeur dans le domaine de la paie '),
(3, 'BALCER & CO SCS (FreeLance)', 'octobre 2008 - janvier 2012', 'Analyste programmeur FreeLance'),
(4, 'AD S.A. ', 'mars 2003 à avril 2009', 'Développeur et intégrateur Open Source'),
(5, 'E-consult', 'septembre 2001 à Juillet 2002', ''),
(6, 'IBM Global Services à Lille', 'septembre 1997 à septembre 2001', 'Analyste-programmeur sur mainframe IBM');

-- --------------------------------------------------------

--
-- Structure de la table `realisations`
--

DROP TABLE IF EXISTS `realisations`;
CREATE TABLE IF NOT EXISTS `realisations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `experience_id` bigint NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpj015piecjkbu347dov33cxh8` (`experience_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `realisations`
--

INSERT INTO `realisations` (`id`, `experience_id`, `description`) VALUES
(1, 1, 'Migration du WMS interne du client vers une solution Backend - Frontend'),
(2, 1, 'Lot pilote de migration du WMS vers Symfony'),
(3, 1, 'Support, Développement, Maintenance et Optimisation du  WMS interne du client'),
(6, 2, 'Support utilisateurs : assistance logicielle et législation HR Luxembourgeoise'),
(5, 2, 'Maintenance et évolution des logiciels de paie KEYPAY et KEYTEMPO '),
(7, 3, 'Développement d’un logiciel de Gestion Electronique de Documents intégrant des fonctions d’OCR'),
(8, 3, 'Développement d’une application Java de Gestion de dossiers d’expertise en assurance automobile'),
(9, 3, 'Développement d’un logiciel de Gestion d’entrée de club avec lecture de la carte d’identité électronique belge (BeID)'),
(10, 3, 'Développement d’un logiciel de gestion logistique pour un grossiste en négoce de sapins de noël'),
(11, 3, 'Développement d’un plugin de gestion de support autour du logiciel Winbooks-Logistics'),
(12, 4, 'Développement interne de logiciels de Gestion de Comptoir (POS) en C++ sous Linux'),
(13, 4, 'Installation de serveurs et de stations de travail sous Linux '),
(14, 4, 'Développements à la demande en C++, PHP et Java'),
(15, 5, 'Développement de modules pour l’application FASTNET (Crédit Agricole Indosuez Luxemboug – banque d’affaires)'),
(16, 6, 'Migration et qualification pour l’an 2000 et l\'Euro d’anciennes applications Cobol et RPG sur mainframe'),
(17, 6, '80000 programmes cobol, analysés, migrés, corrigés à 12 en 2 ans !'),
(18, 6, 'Développement en RPG IV ILE d\'un module d\'intégration du progiciel PRODSTAR');

-- --------------------------------------------------------

--
-- Structure de la table `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `skills`
--

INSERT INTO `skills` (`id`, `nom`) VALUES
(1, 'REACT'),
(2, 'SPRING BOOT'),
(3, 'SYMFONY'),
(4, 'PHP'),
(5, 'GLPI'),
(6, 'FOXPRO'),
(7, 'UNIX SCO'),
(8, 'SQL'),
(9, 'PERL'),
(10, 'WINDEV'),
(11, 'Législation HR LUXEMBOURG '),
(12, 'J2SE'),
(13, 'J2EE'),
(14, 'C++'),
(15, 'Linux'),
(16, 'MySQL'),
(17, 'SAMBA'),
(18, 'POSTFIX'),
(19, 'COBOL'),
(20, 'IDEAL/DATACOM'),
(21, 'MVS'),
(22, 'RPG III'),
(23, 'RPG IV ILE'),
(24, 'CL');

-- --------------------------------------------------------

--
-- Structure de la table `skill_usage`
--

DROP TABLE IF EXISTS `skill_usage`;
CREATE TABLE IF NOT EXISTS `skill_usage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `duree` varchar(255) DEFAULT NULL,
  `realisation_id` bigint DEFAULT NULL,
  `skill_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `skill_usages`
--

DROP TABLE IF EXISTS `skill_usages`;
CREATE TABLE IF NOT EXISTS `skill_usages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `realisation_id` bigint NOT NULL,
  `skill_id` bigint NOT NULL,
  `duree` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKirv7erdncad5hyd62ef01sqs1` (`realisation_id`),
  KEY `FKh2ol26hhs0rvhmktnf4nj3yju` (`skill_id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `skill_usages`
--

INSERT INTO `skill_usages` (`id`, `realisation_id`, `skill_id`, `duree`) VALUES
(1, 1, 1, '12 mois'),
(2, 1, 2, '12 mois'),
(3, 2, 4, '3 mois'),
(4, 2, 3, '3 mois'),
(5, 3, 5, '12 ans'),
(6, 3, 6, '12 ans'),
(7, 3, 7, '12 ans'),
(8, 3, 8, '12 ans'),
(9, 3, 9, '12 ans'),
(10, 5, 10, '6 mois'),
(11, 6, 11, '6 mois'),
(12, 6, 10, '6 mois'),
(13, 7, 12, '18 mois'),
(14, 7, 13, '18 mois'),
(15, 8, 4, '24 mois'),
(16, 8, 8, '24 mois'),
(17, 8, 12, '24 mois'),
(18, 8, 13, '24 mois'),
(19, 9, 12, '3 mois'),
(20, 10, 14, '6 mois'),
(21, 11, 6, '3 mois'),
(22, 12, 15, '24 mois'),
(23, 12, 16, '24 mois'),
(24, 13, 14, '48 mois'),
(25, 13, 15, '48 mois'),
(26, 13, 16, '48 mois'),
(27, 13, 17, '48 mois'),
(28, 13, 18, '48 mois'),
(29, 14, 4, '48 mois'),
(30, 14, 12, '48 mois'),
(31, 14, 14, '48 mois'),
(32, 15, 19, '8 mois'),
(33, 15, 20, '8 mois'),
(34, 15, 21, '8 mois'),
(35, 17, 19, '48 mois'),
(36, 17, 20, '48 mois'),
(37, 17, 21, '48 mois'),
(38, 18, 22, '8 mois'),
(39, 18, 23, '8 mois'),
(40, 18, 24, '8 mois');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
