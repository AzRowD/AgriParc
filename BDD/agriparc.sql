-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 20, 2019 at 02:49 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `agriparc_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `agriculteur`
--

CREATE TABLE `agriculteur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `adresse` varchar(500) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `gaec_id` int(11) NOT NULL,
  `pret_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `agriculteur`
--

INSERT INTO `agriculteur` (`id`, `nom`, `prenom`, `adresse`, `telephone`, `gaec_id`, `pret_id`) VALUES
(1, 'FOURNIER', 'Jean-Michel', 'Route de la Motte, 67000 Strasbourg', '0696784884', 1, 1),
(2, 'LEROUX', 'Jean-Claude', 'Route de la Tour de Salvagny, 67000 Strasbourg', '0699784554', 1, 2),
(3, 'CAULIER', 'Jean-Yves', 'Route de la Charrue, 67000 Strasbourg', '0699734574', 1, 3),
(4, 'RICHARD', 'Jean-Bernard', 'Route de la petite Motte, 67000 Strasbourg', '0696884664', 2, 4),
(5, 'DURAND', 'Jean-Daniel', 'Chemin de Saulde, 67000 Strasbourg', '0675784534', 2, 5),
(6, 'LEROY', 'Jean-Eudes', 'Route de la Charrette, 67000 Strasbourg', '0693134574', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `gaec`
--

CREATE TABLE `gaec` (
  `id` int(11) NOT NULL,
  `nom_gaec` varchar(45) NOT NULL,
  `siret` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gaec`
--

INSERT INTO `gaec` (`id`, `nom_gaec`, `siret`) VALUES
(1, 'Gaec des Sables Rouges', '80295478500028'),
(2, 'Gaec du Rouillat', '80295628516067');

-- --------------------------------------------------------

--
-- Table structure for table `materiel`
--

CREATE TABLE `materiel` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `position_gps` varchar(45) NOT NULL,
  `statut` varchar(45) NOT NULL,
  `gaec_id` int(11) NOT NULL,
  `pret_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materiel`
--

INSERT INTO `materiel` (`id`, `nom`, `description`, `position_gps`, `statut`, `gaec_id`, `pret_id`) VALUES
(1, 'Tracteur Massey Ferguson', 'BARRE OSCILLANTE : Oui CHARGEUR FAUCHEUX PRETISGE 120 ANNEE 2008 CIRCUIT CENTRE : OUVERT DISTRIBUTEUR CDE MANUELLE : 2 ETAT MECANIQUE : MOYEN ETAT POSTE CONDUITE : BON INVERSEUR : HYDRAULIQUE NOMBRE CYLINDRE : 4 NOMBRE DE GAMME : 4 NOMBRE DE VITESSE : 6 PITON : Oui PRISE DE FORCE ARRIERE : 540/1000 RELEVAGE : ELECTRONIQUE SIEGE : PNEUMATIQUE SUSPENSION : MECANIQUE TRANSMISSION : SEMI POWER SHIFT TYPE JANTE ARRIERE : FIXE TYPE JANTE AVANT : PONTET', '7.7521113,48.5734053', 'DISPONIBLE', 1, 1),
(2, 'Suceuse à grains KongSkilde', 'Suceuse à grains 300T debit 15t/HR', '7.7521123,48.5734030', 'NON DISPONIBLE', 1, 2),
(3, 'Moissonneuse Batteuse New Holland', 'BATTEUR : + TIRE PAILLE\r\nBATTEUR REGIME : SIMPLE\r\nCAISSON A CORRECTION DE DEVERS : OUI\r\nCAPACITE DE TREMIE : 7200,00\r\nCROCHET REMORQUE : A BROCHE\r\nEQUIPEMENT MAIS SUR BATTEUR : OUI\r\nEQUIPEMENT MAIS SUR BROYEUR : OUI\r\nETAT COUPE : BON\r\nETAT GENERAL : BON\r\nETAT MECANIQUE : BON\r\nGRILLE A REGLAGE : MANUEL\r\nMARQUE CHARIOT : NEW HOLLAND\r\nMARQUE COUPE : NEW HOLLAND\r\nNOMBRE DE VITESSE : 4', '7.7521143,48.5734093', 'DISPONIBLE', 1, 3),
(4, 'Charrue Gregoire-Besson', 'LARGEUR TRAVAIL : VARILARGE MECANIQE\r\nROUE DE TRANSPORT : MIXTE LATERALE', '7.7521173,48.5734056', 'DISPONIBLE', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `pret`
--

CREATE TABLE `pret` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `duree` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pret`
--

INSERT INTO `pret` (`id`, `date`, `duree`) VALUES
(1, NULL, NULL),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL),
(6, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agriculteur`
--
ALTER TABLE `agriculteur`
  ADD PRIMARY KEY (`id`,`gaec_id`,`pret_id`),
  ADD KEY `fk_Agriculteur_gaec_idx` (`gaec_id`),
  ADD KEY `fk_agriculteur_pret1_idx` (`pret_id`);

--
-- Indexes for table `gaec`
--
ALTER TABLE `gaec`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`id`,`gaec_id`,`pret_id`),
  ADD KEY `fk_materiel_gaec1_idx` (`gaec_id`),
  ADD KEY `fk_materiel_pret1_idx` (`pret_id`);

--
-- Indexes for table `pret`
--
ALTER TABLE `pret`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agriculteur`
--
ALTER TABLE `agriculteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gaec`
--
ALTER TABLE `gaec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pret`
--
ALTER TABLE `pret`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agriculteur`
--
ALTER TABLE `agriculteur`
  ADD CONSTRAINT `fk_Agriculteur_gaec` FOREIGN KEY (`gaec_id`) REFERENCES `gaec` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_agriculteur_pret1` FOREIGN KEY (`pret_id`) REFERENCES `pret` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `fk_materiel_gaec1` FOREIGN KEY (`gaec_id`) REFERENCES `gaec` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materiel_pret1` FOREIGN KEY (`pret_id`) REFERENCES `pret` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
