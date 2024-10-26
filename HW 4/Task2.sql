-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2024 at 06:56 PM
-- Server version: 10.3.39-MariaDB
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `petEvent`
--

CREATE TABLE `petEvent` (
  `petname` varchar(20) NOT NULL,
  `eventdate` date NOT NULL,
  `eventtype` varchar(20) NOT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `petEvent`
--

INSERT INTO `petEvent` (`petname`, `eventdate`, `eventtype`, `remark`) VALUES
('Bowser', '1991-10-12', 'kennel', NULL),
('Chirpy', '1999-03-21', 'vet', 'needed beak straightened'),
('Claws', '1997-08-03', 'vet', 'broken rib'),
('Claws', '1998-03-17', 'birthday', 'Gave him a new flea collar'),
('Fang', '1991-10-12', 'kennel', NULL),
('Fang', '1998-08-28', 'birthday', 'Gave him a new chew toy'),
('Fluffy', '1995-05-15', 'litter', '5 kittens, 2 male'),
('Fluffy', '2020-10-15', 'vet', 'antibiotics'),
('Hammy', '2020-10-15', 'vet', 'antibiotics'),
('Slim', '1997-08-03', 'vet', 'broken rib'),
('Slim', '1997-10-04', 'vet', 'broken tooth'),
('Whistler', '1998-12-09', 'birthday', 'First birthday');

-- --------------------------------------------------------

--
-- Table structure for table `petPet`
--

CREATE TABLE `petPet` (
  `petname` varchar(20) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `species` varchar(45) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `petPet`
--

INSERT INTO `petPet` (`petname`, `owner`, `species`, `gender`, `birth`, `death`) VALUES
('Bowser', 'Diane', 'dog', 'M', '1979-08-31', '1995-07-29'),
('Chirpy', 'Gwen', 'bird', 'F', '1998-09-11', NULL),
('Claws', 'Gwen', 'cat', 'M', '1994-03-17', NULL),
('Fang', 'Benny', 'dog', 'M', '1990-08-27', NULL),
('Fluffy', 'Harold', 'cat', 'F', '1993-02-04', NULL),
('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL),
('Puffball', 'Diane', 'hamster', 'F', '1999-03-30', '2020-09-01'),
('Slim', 'Benny', 'snake', 'M', '1996-04-29', NULL),
('Whistler', 'Gwen', 'bird', NULL, '1997-12-09', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `petEvent`
--
ALTER TABLE `petEvent`
  ADD PRIMARY KEY (`petname`,`eventdate`,`eventtype`);

--
-- Indexes for table `petPet`
--
ALTER TABLE `petPet`
  ADD PRIMARY KEY (`petname`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `petEvent`
--
ALTER TABLE `petEvent`
  ADD CONSTRAINT `petEvent_ibfk_1` FOREIGN KEY (`petname`) REFERENCES `petPet` (`petname`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;