-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2024 at 06:24 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `petPet`
--

CREATE TABLE `petPet` (
  `petname` varchar(20) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `species` enum('M','F') DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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