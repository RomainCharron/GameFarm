-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  ven. 06 avr. 2018 à 10:01
-- Version du serveur :  10.1.28-MariaDB
-- Version de PHP :  5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bd_wit_gaia`
--
CREATE DATABASE IF NOT EXISTS `bd_wit_gaia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd_wit_gaia`;

-- --------------------------------------------------------

--
-- Structure de la table `exploitation`
--

DROP TABLE IF EXISTS `exploitation`;
CREATE TABLE IF NOT EXISTS `exploitation` (
  `IDExploitation` int(11) NOT NULL AUTO_INCREMENT,
  `IDJoueur` int(11) NOT NULL,
  `IDPartie` int(11) NOT NULL,
  `IDRessource` int(11) NOT NULL,
  `Statut` int(11) NOT NULL,
  `QtR` int(11) NOT NULL,
  PRIMARY KEY (`IDExploitation`),
  KEY `exploitation_Joueur` (`IDJoueur`),
  KEY `exploitation_Ressours` (`IDRessource`),
  KEY `exploitation_Partie` (`IDPartie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
CREATE TABLE IF NOT EXISTS `joueur` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Pseudo` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `partie`
--

DROP TABLE IF EXISTS `partie`;
CREATE TABLE IF NOT EXISTS `partie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(40) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `refressours`
--

DROP TABLE IF EXISTS `refressours`;
CREATE TABLE IF NOT EXISTS `refressours` (
  `IDJoueur` int(11) NOT NULL,
  `IDPartie` int(11) NOT NULL,
  `IDRessource` int(11) NOT NULL,
  `QtR` int(11) NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `refressours_Joueur` (`IDJoueur`),
  KEY `refressours_ressours` (`IDRessource`),
  KEY `refressours_Partie` (`IDPartie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Qt Quantitée de Ressource';

-- --------------------------------------------------------

--
-- Structure de la table `refjoueur`
--

DROP TABLE IF EXISTS `refjoueur`;
CREATE TABLE IF NOT EXISTS `refjoueur` (
  `IDJoueur` int(11) NOT NULL,
  `IDPartie` int(11) NOT NULL,
  KEY `refjoueur_Joueur` (`IDJoueur`),
  KEY `refjoueur_Partie` (`IDPartie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `typeressource`
--

DROP TABLE IF EXISTS `typeressource`;
CREATE TABLE IF NOT EXISTS `typeressource` (
  `IDTR` int(4) NOT NULL AUTO_INCREMENT,
  `Libelle` varchar(40) DEFAULT NULL,
  `Type` int(3) DEFAULT NULL,
  PRIMARY KEY (`IDTR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `exploitation`
--
ALTER TABLE `exploitation`
  ADD CONSTRAINT `exploitation_Joueur` FOREIGN KEY (`IDJoueur`) REFERENCES `joueur` (`ID`),
  ADD CONSTRAINT `exploitation_Partie` FOREIGN KEY (`IDPartie`) REFERENCES `partie` (`ID`),
  ADD CONSTRAINT `exploitation_Ressours` FOREIGN KEY (`IDRessource`) REFERENCES `typeressource` (`IDTR`);

--
-- Contraintes pour la table `refressours`
--
ALTER TABLE `refressours`
  ADD CONSTRAINT `refressours_Joueur` FOREIGN KEY (`IDJoueur`) REFERENCES `joueur` (`ID`),
  ADD CONSTRAINT `refressours_Partie` FOREIGN KEY (`IDPartie`) REFERENCES `partie` (`ID`),
  ADD CONSTRAINT `refressours_ressours` FOREIGN KEY (`IDRessource`) REFERENCES `typeressource` (`IDTR`);

--
-- Contraintes pour la table `refjoueur`
--
ALTER TABLE `refjoueur`
  ADD CONSTRAINT `refjoueur_Joueur` FOREIGN KEY (`IDJoueur`) REFERENCES `joueur` (`ID`),
  ADD CONSTRAINT `refjoueur_Partie` FOREIGN KEY (`IDPartie`) REFERENCES `partie` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
