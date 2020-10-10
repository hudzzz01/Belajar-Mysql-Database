-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 10, 2020 at 10:14 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `willy_motor`
--

-- --------------------------------------------------------

--
-- Table structure for table `crew`
--

CREATE TABLE IF NOT EXISTS `crew` (
  `id_crew` int(13) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `ttl` date NOT NULL,
  `id_foto` int(13) DEFAULT NULL,
  `u_name` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `gaji` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crew`
--

INSERT INTO `crew` (`id_crew`, `jabatan`, `nama`, `ttl`, `id_foto`, `u_name`, `password`, `gaji`) VALUES
(43, 'owner', 'syahid', '2020-07-10', NULL, 'a', 'k', 0),
(46, 'ownerrr', 'syahid', '2020-07-01', NULL, 'hudzz', 'hudzzz', 10000000),
(47, 'owner', 'syahid', '2020-07-01', NULL, 'hudzz', 'a', 10000000),
(48, 'koko', 'joko', '2020-07-10', NULL, 'joko', 'joko', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE IF NOT EXISTS `foto` (
  `id_foto` int(13) NOT NULL,
  `nama_foto` varchar(100) NOT NULL,
  `ukuran` int(13) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE IF NOT EXISTS `mobil` (
  `id_mobil` int(13) NOT NULL,
  `id_pelanggan` int(13) NOT NULL,
  `plat_nomor` varchar(10) NOT NULL,
  `merek_mobil` varchar(20) NOT NULL,
  `nama_mobil` varchar(20) NOT NULL,
  `terakhir_service` date DEFAULT NULL,
  `tahun_dibuat` int(5) DEFAULT NULL,
  `id_foto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id_pelanggan` int(13) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `ttl` date NOT NULL,
  `alamat` text NOT NULL,
  `id_foto` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_transaksi` int(13) NOT NULL,
  `id_crew` int(13) NOT NULL,
  `id_pelanggan` int(13) NOT NULL,
  `id_mobil` int(13) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `keterangan transaksi` text NOT NULL,
  `biaya` int(13) NOT NULL,
  `pelunasan` varchar(5) NOT NULL,
  `tanggal_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `crew`
--
ALTER TABLE `crew`
  ADD PRIMARY KEY (`id_crew`),
  ADD KEY `id_foto` (`id_foto`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`),
  ADD KEY `id_foto` (`id_foto`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`),
  ADD KEY `id_foto` (`id_foto`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_crew` (`id_crew`),
  ADD KEY `id_mobil` (`id_mobil`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crew`
--
ALTER TABLE `crew`
  MODIFY `id_crew` int(13) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `id_foto` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(13) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(13) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `crew`
--
ALTER TABLE `crew`
  ADD CONSTRAINT `crew_ibfk_1` FOREIGN KEY (`id_foto`) REFERENCES `foto` (`id_foto`);

--
-- Constraints for table `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `mobil_ibfk_1` FOREIGN KEY (`id_foto`) REFERENCES `foto` (`id_foto`),
  ADD CONSTRAINT `mobil_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`id_foto`) REFERENCES `foto` (`id_foto`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_crew`) REFERENCES `crew` (`id_crew`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id_mobil`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
