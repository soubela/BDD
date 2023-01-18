-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : mer. 18 jan. 2023 à 15:43
-- Version du serveur : 5.7.39
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `creche_soso`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `idclasse` int(11) NOT NULL,
  `idenfant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `classe`
--

INSERT INTO `classe` (`idclasse`, `idenfant`) VALUES
(2, 1),
(1, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `creche`
--

CREATE TABLE `creche` (
  `idcreche` int(11) NOT NULL,
  `nomcreche` varchar(15) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `idclasse` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `creche`
--

INSERT INTO `creche` (`idcreche`, `nomcreche`, `adresse`, `contact`, `idclasse`) VALUES
(14252627, 'soso', 'paris', '0780571022', 3);

-- --------------------------------------------------------

--
-- Structure de la table `enfant`
--

CREATE TABLE `enfant` (
  `idenfant` int(11) NOT NULL,
  `nomenfant` varchar(30) NOT NULL,
  `prenomenfant` varchar(15) NOT NULL,
  `sexe` varchar(8) NOT NULL,
  `telephonetuteur` int(15) NOT NULL,
  `adresse` varchar(60) NOT NULL,
  `datedenaissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `enfant`
--

INSERT INTO `enfant` (`idenfant`, `nomenfant`, `prenomenfant`, `sexe`, `telephonetuteur`, `adresse`, `datedenaissance`) VALUES
(1, 'mayes', 'aghiles', 'm', 789675467, 'paris', '2020-01-08'),
(2, 'aris', 'lyes', 'm', 876445446, 'Paris', '2021-01-21'),
(3, 'paul', 'lina', 'f', 98786575, 'paris', '2021-01-13');

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `idenseignant` int(11) NOT NULL,
  `nomenseignant` varchar(30) NOT NULL,
  `prenomenseignant` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telephone` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`idenseignant`, `nomenseignant`, `prenomenseignant`, `email`, `telephone`) VALUES
(1234, 'sidali', 'samir', 'samirsidali24@gmail.com', 673534895),
(12345, 'idjeri', 'massine', 'massinidjeri@gmail.com', 675675234),
(123456, 'kaidi', 'rim', 'rimkaidi24@gmail.com', 876764643);

-- --------------------------------------------------------

--
-- Structure de la table `personnel`
--

CREATE TABLE `personnel` (
  `idsalarie` int(3) NOT NULL,
  `nomsalarie` varchar(20) NOT NULL,
  `grade` varchar(29) NOT NULL,
  `contact` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `personnel`
--

INSERT INTO `personnel` (`idsalarie`, `nomsalarie`, `grade`, `contact`) VALUES
(98, 'souad', 'directeur', 780571021),
(99, 'yasmine', 'atsem', 678656521),
(567, 'VIOLETTE', 'assistante', 987556715);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`idclasse`),
  ADD KEY `idenfant` (`idenfant`);

--
-- Index pour la table `creche`
--
ALTER TABLE `creche`
  ADD PRIMARY KEY (`idcreche`),
  ADD KEY `idclasse` (`idclasse`);

--
-- Index pour la table `enfant`
--
ALTER TABLE `enfant`
  ADD PRIMARY KEY (`idenfant`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`idenseignant`);

--
-- Index pour la table `personnel`
--
ALTER TABLE `personnel`
  ADD PRIMARY KEY (`idsalarie`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `classe_ibfk_2` FOREIGN KEY (`idenfant`) REFERENCES `enfant` (`idenfant`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `creche`
--
ALTER TABLE `creche`
  ADD CONSTRAINT `creche_ibfk_1` FOREIGN KEY (`idclasse`) REFERENCES `classe` (`idclasse`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
