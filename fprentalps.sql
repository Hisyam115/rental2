-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2024 at 10:46 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25 

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------
-- Database: `fprentalps`
-- --------------------------------------------------------

-- Table structure for table `device`
CREATE TABLE `device` (
  `id_device` int(10) NOT NULL AUTO_INCREMENT,
  `device` enum('PS3','PS4','PS5') NOT NULL,
  `harga` int(10) NOT NULL,
  PRIMARY KEY (`id_device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `device`
INSERT INTO `device` (`id_device`, `device`, `harga`) VALUES
(1, 'PS3', 75000),
(2, 'PS4', 100000),
(3, 'PS5', 150000);

-- --------------------------------------------------------
-- Table structure for table `sewa`
CREATE TABLE `sewa` (
  `id_sewa` int(15) NOT NULL AUTO_INCREMENT,
  `tanggal_sewa` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `total_harga` int(10) NOT NULL,
  `device_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id_sewa`),
  KEY `device_id` (`device_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id_device`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------
-- Table structure for table `users`
CREATE TABLE `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_hp` varchar(12) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `role` enum('admin','member') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table `users`
INSERT INTO `users` (`id`, `username`, `password`, `nama`, `no_hp`, `alamat`, `role`) VALUES
(1, 'aking', 'password123', 'Krisna', '08123456789', 'Concat', 'admin'),
(2, 'Bedul', 'memberpass', 'Abdullah Azzam Azed', '08234567890', 'Wonosobo', 'member');

-- --------------------------------------------------------
-- AUTO_INCREMENT for dumped tables
ALTER TABLE `device`
  MODIFY `id_device` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `sewa`
  MODIFY `id_sewa` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
