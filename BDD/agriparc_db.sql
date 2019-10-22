-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 22 oct. 2019 à 11:15
-- Version du serveur :  10.3.16-MariaDB
-- Version de PHP :  7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `agriparc_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `agriculteur`
--

CREATE TABLE `agriculteur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `adresse` varchar(500) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `gaec_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `agriculteur`
--

INSERT INTO `agriculteur` (`id`, `nom`, `prenom`, `adresse`, `telephone`, `gaec_id`) VALUES
(1, 'FOURNIER', 'Jean-Michel', 'Route de la Motte, 67000 Strasbourg', '0696784884', 1),
(2, 'LEROUX', 'Jean-Claude', 'Route de la Tour de Salvagny, 67000 Strasbourg', '0699784554', 1),
(3, 'CAULIER', 'Jean-Yves', 'Route de la Charrue, 67000 Strasbourg', '0699734574', 1);

-- --------------------------------------------------------

--
-- Structure de la table `gaec`
--

CREATE TABLE `gaec` (
  `id` int(11) NOT NULL,
  `nom_gaec` varchar(45) NOT NULL,
  `siret` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `gaec`
--

INSERT INTO `gaec` (`id`, `nom_gaec`, `siret`) VALUES
(1, 'Gaec des sables rouges', '80295478500028'),
(2, 'Gaec du Rouillat', '80295628516067');

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE `materiel` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `position_gps` varchar(45) NOT NULL,
  `statut` varchar(45) NOT NULL,
  `gaec_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`id`, `nom`, `description`, `position_gps`, `statut`, `gaec_id`) VALUES
(1, 'Tracteur Massey Ferguson', 'BARRE OSCILLANTE : Oui CHARGEUR FAUCHEUX PRETISGE 120 ANNEE 2008 CIRCUIT CENTRE : OUVERT DISTRIBUTEUR CDE MANUELLE : 2 ETAT MECANIQUE : MOYEN ETAT POSTE CONDUITE : BON INVERSEUR : HYDRAULIQUE NOMBRE CYLINDRE : 4 NOMBRE DE GAMME : 4 NOMBRE DE VITESSE : 6 PITON : Oui PRISE DE FORCE ARRIERE : 540/1000 RELEVAGE : ELECTRONIQUE SIEGE : PNEUMATIQUE SUSPENSION : MECANIQUE TRANSMISSION : SEMI POWER SHIFT TYPE JANTE ARRIERE : FIXE TYPE JANTE AVANT : PONTET', '7.7521113,48.5734053', 'DISPONIBLE', 1),
(2, 'Suceuse à grains KongSkilde', 'Suceuse à grains 300T debit 15t/HR', '7.7521123,48.5734030', 'NON DISPONIBLE', 1),
(3, 'Moissonneuse Batteuse New Holland', 'BATTEUR : + TIRE PAILLE\r\nBATTEUR REGIME : SIMPLE\r\nCAISSON A CORRECTION DE DEVERS : OUI\r\nCAPACITE DE TREMIE : 7200,00\r\nCROCHET REMORQUE : A BROCHE\r\nEQUIPEMENT MAIS SUR BATTEUR : OUI\r\nEQUIPEMENT MAIS SUR BROYEUR : OUI\r\nETAT COUPE : BON\r\nETAT GENERAL : BON\r\nETAT MECANIQUE : BON\r\nGRILLE A REGLAGE : MANUEL\r\nMARQUE CHARIOT : NEW HOLLAND\r\nMARQUE COUPE : NEW HOLLAND\r\nNOMBRE DE VITESSE : 4', '7.7521143,48.5734093', 'DISPONIBLE', 1),
(4, 'Charrue Gregoire-Besson', 'LARGEUR TRAVAIL : VARILARGE MECANIQE\r\nROUE DE TRANSPORT : MIXTE LATERALE', '7.7521173,48.5734056', 'DISPONIBLE', 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `materiel_id` int(11) NOT NULL,
  `agriculteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agriculteur`
--
ALTER TABLE `agriculteur`
  ADD PRIMARY KEY (`id`,`gaec_id`),
  ADD KEY `fk_Agriculteur_gaec_idx` (`gaec_id`);

--
-- Index pour la table `gaec`
--
ALTER TABLE `gaec`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`id`,`gaec_id`),
  ADD KEY `fk_materiel_gaec1_idx` (`gaec_id`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`,`materiel_id`,`agriculteur_id`),
  ADD KEY `fk_reservation_materiel1_idx` (`materiel_id`),
  ADD KEY `fk_reservation_agriculteur1_idx` (`agriculteur_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `agriculteur`
--
ALTER TABLE `agriculteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `gaec`
--
ALTER TABLE `gaec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `agriculteur`
--
ALTER TABLE `agriculteur`
  ADD CONSTRAINT `fk_Agriculteur_gaec` FOREIGN KEY (`gaec_id`) REFERENCES `gaec` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `fk_materiel_gaec1` FOREIGN KEY (`gaec_id`) REFERENCES `gaec` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_reservation_agriculteur1` FOREIGN KEY (`agriculteur_id`) REFERENCES `agriculteur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservation_materiel1` FOREIGN KEY (`materiel_id`) REFERENCES `materiel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
