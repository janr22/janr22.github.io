-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2018 at 09:05 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(5) NOT NULL,
  `car_type` char(50) NOT NULL,
  `car_brand` char(50) NOT NULL,
  `days` int(3) NOT NULL,
  `value` int(11) NOT NULL,
  `plate_num` varchar(7) NOT NULL,
  `status` varchar(300) NOT NULL,
  `total` int(20) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_type`, `car_brand`, `days`, `value`, `plate_num`, `status`, `total`, `date`) VALUES
(0, 'car', 'Mitsubishi', 0, 5000, 'rst 123', 'Available', 0, '0000-00-00'),
(23121, 'van', 'toyota', 0, 20000, 'aws 735', 'Available', 0, '0000-00-00'),
(43251, 'car', 'honda', 0, 15000, 'ays 123', 'Available', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `id_no` int(11) NOT NULL,
  `car_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_no` int(7) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `password` varchar(120) NOT NULL,
  `firstname` char(50) NOT NULL,
  `lastname` char(120) NOT NULL,
  `contact_num` varchar(100) NOT NULL,
  `address` varchar(180) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_no`, `user_name`, `password`, `firstname`, `lastname`, `contact_num`, `address`) VALUES
(1, 'admin', 'admin', '', '', '0', ''),
(6, 'ken', '123', 'dnfsdf', 'ssdbysdfus', '082739123', '23 sfnsfjksdkfs'),
(7, 'kenneth', 'castro', 'kenneth', 'castro', '02312381028310', '237829 snfslfjsdnfjsd'),
(9, 'user', 'user', 'user', 'name', '09271526376', '099 lhufodshfu'),
(11, 'tine', 'tine', 'tine', 'mar', '09827361562', '97 baguio');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD KEY `car` (`car_id`),
  ADD KEY `user` (`id_no`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_no` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `car` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`id_no`) REFERENCES `user` (`id_no`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
