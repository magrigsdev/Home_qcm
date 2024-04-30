-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 30 avr. 2024 à 19:43
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `home_qcm`
--

-- --------------------------------------------------------

--
-- Structure de la table `tirer`
--

DROP TABLE IF EXISTS `tirer`;
CREATE TABLE IF NOT EXISTS `tirer` (
  `num_passage` int NOT NULL AUTO_INCREMENT,
  `num_question` int NOT NULL,
  PRIMARY KEY (`num_passage`,`num_question`),
  KEY `num_question` (`num_question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tirer`
--
ALTER TABLE `tirer`
  ADD CONSTRAINT `tirer_ibfk_1` FOREIGN KEY (`num_passage`) REFERENCES `passage` (`num_passage`) ON DELETE CASCADE,
  ADD CONSTRAINT `tirer_ibfk_2` FOREIGN KEY (`num_question`) REFERENCES `question` (`num_question`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
