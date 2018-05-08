-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2018 at 08:31 AM
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
  `car_id` int(11) NOT NULL,
  `car_type` char(50) NOT NULL,
  `car_brand` char(50) NOT NULL,
  `value` int(11) NOT NULL,
  `plate_num` varchar(7) NOT NULL,
  `status` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `car_type`, `car_brand`, `value`, `plate_num`, `status`) VALUES
(1, 'car', 'honda', 15000, 'ays 123', 'Cancel'),
(2, 'van', 'toyota', 20000, 'aws 735', 'Rent');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `fname` char(120) NOT NULL,
  `lname` char(120) NOT NULL,
  `c_num` int(120) NOT NULL,
  `add` varchar(300) NOT NULL
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
(3, 'kups', '123', 'kups', 'Cas', '0', ''),
(6, 'ken', '123', 'dnfsdf', 'ssdbysdfus', '082739123', '23 sfnsfjksdkfs'),
(7, 'kenneth', 'castro', 'kenneth', 'castro', '02312381028310', '237829 snfslfjsdnfjsd'),
(8, 'tine', 'tine', 'tine', 'tine', '9372197391823', '238 auhdiuhiuahdywiasd');

--
-- Indexes for dumped tables
--

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
  MODIFY `id_no` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
