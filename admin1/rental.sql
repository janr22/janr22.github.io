-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2018 at 09:05 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_no` int(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `contactNumber` bigint(12) NOT NULL,
  `address` varchar(50) NOT NULL,
  `role` enum('Admin','SuperAdmin') NOT NULL DEFAULT 'Admin',
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_no`, `firstName`, `lastName`, `email`, `password`, `contactNumber`, `address`, `role`, `status`) VALUES
(216223, 'camille', 'tungcul', 'camille@gmail.com', '12345', 9096758765, 'Balungao Pangasinan', 'SuperAdmin', 'Active'),
(216435, 'jm', 'jor', 'jm@gmail.com', '12345', 9091367576, 'Tondo, Manila', 'Admin', 'Active'),
(216863, 'yz', 'cacho', 'yz@gmail.com', '12345', 9097263518, 'Baguio, Bakakeng', 'Admin', 'Active'),
(216425, 'ken', 'castro', 'ken@gmail.com', '12345', 9657654567, 'Session Road, Baguio City', 'Admin', 'Active'),
(216875, 'Rey', 'Balinag', 'rey@gmail.com', '12345', 9097281902, 'Marcos Road, Baguio City', 'Admin', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `plate_number` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `transmission` varchar(255) DEFAULT NULL,
  `capacity` int(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE IF NOT EXISTS `rent` (
  `id_no` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  KEY `car` (`car_id`),
  KEY `user` (`id_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_provider`
--

CREATE TABLE IF NOT EXISTS `service_provider` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `availability` enum('online','offline') DEFAULT 'offline',
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `request` enum('Approved','Blocked','Pending') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `service_provider`
--

INSERT INTO `service_provider` (`id`, `username`, `email`, `first_name`, `last_name`, `address`, `contact`, `availability`, `image`, `password`, `status`, `request`) VALUES
(1, 'janr22', 'balinagrey@gmail.com', 'John Rey', 'Balinag', 'Baguio City', '9266726247', '', 'image-1527183905480.jpg', '$2b$10$Q7ZzACQngGf9IoVzDlk6YuQ.O7qr1kg9l2Pmt0y6QmGlUoeVR7UZK', 'Active', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_no` int(7) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL,
  `password` varchar(120) NOT NULL,
  `firstname` char(50) NOT NULL,
  `lastname` char(120) NOT NULL,
  `contact_num` bigint(11) NOT NULL,
  `address` varchar(180) NOT NULL,
  `email` varchar(50) NOT NULL,
  `availability` enum('online','offline') NOT NULL DEFAULT 'offline',
  `status` enum('Active','Inactive') NOT NULL,
  `request` enum('Approved','Blocked','Pending') NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`id_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1236 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_no`, `user_name`, `password`, `firstname`, `lastname`, `contact_num`, `address`, `email`, `availability`, `status`, `request`) VALUES
(1, 'camille', '12345', 'camille', 'tungcul', 9097654567, 'Balungao, Pangasinan', 'camille@gmail.com', 'offline', 'Inactive', 'Pending'),
(6, 'janmae', 'balinag', 'janmae', 'jorquia', 9097654555, 'Balungao, Pangasinan', 'janmae@gmail.com', 'offline', 'Active', 'Approved'),
(7, 'kenneth', 'rakista', 'kenneth', 'castro', 9097623567, 'Balungao, Pangasinan', 'kenneth@gmail.com', 'online', 'Active', 'Pending'),
(9, 'yz', 'nhelli', 'yz', 'cacho', 9876654567, 'Balungao, Pangasinan', 'yz@gmail.com', 'offline', 'Inactive', 'Pending'),
(11, 'ralph', 'hatred', 'ralph', 'bince', 9097654123, 'Balungao, Pangasinan', 'ralph@gmail.com', 'online', 'Inactive', 'Pending'),
(12, 'juraima', 'kagawad', 'juraima', 'baniqued', 9097659967, 'Balungao, Pangasinan', 'juraima@gmail.com', 'offline', 'Inactive', 'Approved'),
(13, 'jolli', 'bee', 'jolli', 'mcdo', 9097654512, 'Balungao, Pangasinan', 'jolli@gmail.com', 'offline', 'Inactive', 'Blocked'),
(14, 'mark', 'villanos', 'maki', 'villanos', 9097654765, 'Balungao, Pangasinan', 'maki@gmail.com', 'online', 'Inactive', 'Approved'),
(1234, 'rey', 'balinag', 'john', 'balinag', 9097654111, 'Balungao, Pangasinan', 'balinag@gmail.com', 'online', 'Active', 'Approved'),
(1235, 'tine', 'tine', 'tine', 'fat', 9097654098, 'Balungao, Pangasinan', 'tine@gmail.com', 'offline', 'Active', 'Pending');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
