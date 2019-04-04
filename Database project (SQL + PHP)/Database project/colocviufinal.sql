-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2019 at 09:17 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `colocviufinal`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_4a` ()  SELECT ap1.id_apartament as apartament1, ap2.id_apartament as apartament2, ap1.ID_PROPRIETAR as idprop
FROM Apartament ap1 JOIN Apartament ap2
ON (ap1.id_proprietar = ap2.id_proprietar)
WHERE ap1.id_apartament < ap2.id_apartament$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_ex6a` ()  SELECT ID_APARTAMENT, AN, AVG(CANTITATE) as cantitate
FROM Consum
GROUP BY ID_APARTAMENT, AN$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `apartament`
--

CREATE TABLE `apartament` (
  `id_apartament` double NOT NULL,
  `adresa` varchar(50) DEFAULT NULL,
  `nr_apartament` double DEFAULT NULL,
  `suprafata` double DEFAULT NULL,
  `id_proprietar` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apartament`
--

INSERT INTO `apartament` (`id_apartament`, `adresa`, `nr_apartament`, `suprafata`, `id_proprietar`) VALUES
(1, 'Turda Baita 17', 6, 70, 1),
(2, 'Turda Baita 20', 15, 55, 2),
(3, 'Turda Baita 17', 1, 72, 1),
(5, 'Turda Baita 99', 140, 90, 6),
(6, 'Turda Baita 100', 125, 60, 3),
(111, 'Turda Baita 30', 51, 63, 5);

-- --------------------------------------------------------

--
-- Table structure for table `chitanta`
--

CREATE TABLE `chitanta` (
  `numar` double NOT NULL,
  `data` datetime DEFAULT NULL,
  `id_apartament` double DEFAULT NULL,
  `valoare` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chitanta`
--

INSERT INTO `chitanta` (`numar`, `data`, `id_apartament`, `valoare`) VALUES
(1, '2017-09-21 00:00:00', 1, 120),
(2, '2019-05-18 00:00:00', 3, 60);

-- --------------------------------------------------------

--
-- Table structure for table `consum`
--

CREATE TABLE `consum` (
  `id_apartament` double NOT NULL,
  `an` double NOT NULL,
  `luna` double NOT NULL,
  `nr_persoane` double DEFAULT NULL,
  `cantitate` double DEFAULT NULL,
  `valoare` double DEFAULT NULL,
  `pret_apa` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consum`
--

INSERT INTO `consum` (`id_apartament`, `an`, `luna`, `nr_persoane`, `cantitate`, `valoare`, `pret_apa`) VALUES
(1, 2018, 8, 3, 100, 130, 20),
(2, 2018, 8, 5, 150, 120, 20),
(3, 2019, 2, 5, 150, 180, 20),
(5, 2018, 6, 3, 150, 200, 15),
(6, 2019, 7, 2, 120, 210, 20),
(111, 2018, 8, 2, NULL, NULL, 20);

-- --------------------------------------------------------

--
-- Table structure for table `proprietar`
--

CREATE TABLE `proprietar` (
  `id_proprietar` double NOT NULL,
  `nume` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telefon` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proprietar`
--

INSERT INTO `proprietar` (`id_proprietar`, `nume`, `email`, `telefon`) VALUES
(1, 'Raul Marchis', 'dan_mar_chis@yahoo.com', '0746263614'),
(2, 'Florea Ronaldo', 'ronnydflorea@gmail.com', '0758393921'),
(3, 'Neagoe Adrian Denis', 'adineagoe@gmail.com', '0757854672'),
(5, 'Borz Tina Adelina', 'tinaadelina@yahoo.com', '0755611980'),
(6, 'Hura Abel Jonathan', 'huraabel@yahoo.com', '0755263614');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartament`
--
ALTER TABLE `apartament`
  ADD PRIMARY KEY (`id_apartament`),
  ADD KEY `FK_id_prop` (`id_proprietar`);

--
-- Indexes for table `chitanta`
--
ALTER TABLE `chitanta`
  ADD PRIMARY KEY (`numar`),
  ADD KEY `FK_id_ap_chitanta` (`id_apartament`);

--
-- Indexes for table `consum`
--
ALTER TABLE `consum`
  ADD PRIMARY KEY (`id_apartament`,`an`,`luna`);

--
-- Indexes for table `proprietar`
--
ALTER TABLE `proprietar`
  ADD PRIMARY KEY (`id_proprietar`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apartament`
--
ALTER TABLE `apartament`
  ADD CONSTRAINT `FK_id_prop` FOREIGN KEY (`id_proprietar`) REFERENCES `proprietar` (`id_proprietar`);

--
-- Constraints for table `chitanta`
--
ALTER TABLE `chitanta`
  ADD CONSTRAINT `FK_id_ap_chitanta` FOREIGN KEY (`id_apartament`) REFERENCES `apartament` (`id_apartament`);

--
-- Constraints for table `consum`
--
ALTER TABLE `consum`
  ADD CONSTRAINT `FK_id_ap` FOREIGN KEY (`id_apartament`) REFERENCES `apartament` (`id_apartament`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
