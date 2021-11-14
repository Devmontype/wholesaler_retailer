-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2021 at 11:11 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wholesaler`
--

-- --------------------------------------------------------

--
-- Table structure for table `retailer`
--

CREATE TABLE `retailer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `retailer`
--

INSERT INTO `retailer` (`id`, `name`, `mobile_number`, `createdAt`, `updatedAt`) VALUES
(1, 'R1', '9874563214', '2021-11-14 11:05:22', '2021-11-14 11:05:22'),
(2, 'R2', '7896541236', '2021-11-14 11:05:22', '2021-11-14 11:05:22'),
(3, 'R3', '9874263214', '2021-11-14 11:05:22', '2021-11-14 11:05:22'),
(4, 'R4', '7896041236', '2021-11-14 11:05:22', '2021-11-14 11:05:22'),
(5, 'R5', '9874263214', '2021-11-14 11:05:22', '2021-11-14 11:05:22'),
(6, 'R6', '7896041236', '2021-11-14 11:05:22', '2021-11-14 11:05:22');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `wholesaler_id` int(11) DEFAULT NULL,
  `retailer_id` int(11) DEFAULT NULL,
  `stock_amount` decimal(10,3) DEFAULT NULL,
  `date` bigint(20) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `wholesaler_id`, `retailer_id`, `stock_amount`, `date`, `createdAt`, `updatedAt`) VALUES
(4, 2, 3, '1.000', 1634220090000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(5, 2, 1, '2.000', 1636898490000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(8, 2, 4, '3.000', 1639490490000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(16, 2, 3, '4.000', 1636898490000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(17, 2, 1, '5.000', 1610632890000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(18, 2, 4, '6.000', 1613311290000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(19, 2, 3, '7.000', 1615730490000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(20, 2, 1, '8.000', 1618408890000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(21, 2, 4, '9.000', 1623679290000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(22, 2, 3, '10.000', 1626271290000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(23, 2, 1, '11.000', 1628486928000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(24, 2, 4, '12.000', 1620106128000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(25, 2, 1, '13.000', 1631183328000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(26, 1, 3, '1.000', 1634220090000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(27, 1, 1, '2.000', 1636898490000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(28, 2, 4, '3.000', 1639490490000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(29, 1, 3, '74.000', 1634220090000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(30, 1, 1, '5.000', 1610632890000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(31, 1, 4, '6.000', 1613311290000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(32, 1, 3, '7.000', 1615730490000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(33, 1, 1, '8.000', 1618408890000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(34, 1, 4, '9.000', 1623679290000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(35, 1, 3, '10.000', 1626271290000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(36, 1, 1, '11.000', 1628486928000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(37, 1, 4, '12.000', 1620106128000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(38, 1, 1, '13.000', 1631183328000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(39, 1, 4, '3.000', 1639490490000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(40, 2, 5, '1.000', 1634220090000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(41, 2, 5, '2.000', 1636898490000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(42, 2, 6, '5.000', 1610632890000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(43, 2, 6, '6.000', 1613311290000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(44, 1, 5, '7.000', 1615730490000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(45, 1, 5, '8.000', 1618408890000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(46, 1, 6, '9.000', 1623679290000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(47, 1, 6, '10.000', 1626271290000, '2021-11-14 11:34:34', '2021-11-14 11:34:34'),
(48, 2, 2, '1.000', 1634220090000, '2021-11-14 11:34:34', '2021-11-14 11:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `wholesaler`
--

CREATE TABLE `wholesaler` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wholesaler`
--

INSERT INTO `wholesaler` (`id`, `name`, `mobile_number`, `createdAt`, `updatedAt`) VALUES
(1, 'W1', '7412589632', '2021-11-14 11:05:51', '2021-11-14 11:05:51'),
(2, 'w2', '7893216448', '2021-11-14 11:05:51', '2021-11-14 11:05:51'),
(3, 'w3', '7893216448', '2021-11-14 11:05:51', '2021-11-14 11:05:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `retailer`
--
ALTER TABLE `retailer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wholesaler_id` (`wholesaler_id`),
  ADD KEY `retailer_id` (`retailer_id`);

--
-- Indexes for table `wholesaler`
--
ALTER TABLE `wholesaler`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `retailer`
--
ALTER TABLE `retailer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `wholesaler`
--
ALTER TABLE `wholesaler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_366` FOREIGN KEY (`wholesaler_id`) REFERENCES `wholesaler` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_ibfk_367` FOREIGN KEY (`retailer_id`) REFERENCES `retailer` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
