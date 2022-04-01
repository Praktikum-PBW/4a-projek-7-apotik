-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2022 at 06:58 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `jual`
--

CREATE TABLE `jual` (
  `resi` int(10) NOT NULL,
  `kd_obat` varchar(6) NOT NULL,
  `nama_obat` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `jum_item` int(5) NOT NULL,
  `total` int(10) NOT NULL,
  `bayar` int(10) NOT NULL,
  `kembalian` int(10) NOT NULL,
  `id_user` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategori obat`
--

CREATE TABLE `kategori obat` (
  `id_kategori` int(3) NOT NULL,
  `nama_kategori` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `kd_obat` varchar(6) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `harga` int(20) NOT NULL,
  `id_kategori` int(3) NOT NULL,
  `jum_stok` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(6) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `status` enum('Admin','User','Apoteker','') NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `username`, `password`, `status`) VALUES
(1, 'asep gunawan', 'asep019', '7110eda4d09e062aa5e4', 'Apoteker');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jual`
--
ALTER TABLE `jual`
  ADD KEY `kd_obat` (`kd_obat`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_user_2` (`id_user`);

--
-- Indexes for table `kategori obat`
--
ALTER TABLE `kategori obat`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`kd_obat`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jual`
--
ALTER TABLE `jual`
  ADD CONSTRAINT `jual_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jual_ibfk_2` FOREIGN KEY (`kd_obat`) REFERENCES `obat` (`kd_obat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `obat`
--
ALTER TABLE `obat`
  ADD CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori obat` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
