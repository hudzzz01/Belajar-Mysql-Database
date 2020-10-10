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
-- Database: `VapeStore2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(5) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `gaji` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `alamat`, `gaji`) VALUES
(1, 'samsul', 'ciputat', 50000),
(2, 'olla', 'cipularang', 50000),
(3, 'anna', 'depok', 50000),
(4, 'reja', 'parung', 50000),
(5, 'elsi', 'jakarta', 50000),
(6, 'midhat', 'bandung', 50000),
(7, 'sahid', 'jogja', 50000),
(8, 'alis', 'bogor', 50000),
(9, 'afif', 'bekasi', 50000),
(10, 'jano', 'ciputat', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE IF NOT EXISTS `distributor` (
  `id_distributor` int(5) NOT NULL,
  `nama_distributor` varchar(100) NOT NULL,
  `lokasi` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`id_distributor`, `nama_distributor`, `lokasi`) VALUES
(1, 'acaw', 'pamulang'),
(2, 'sahid', 'ciputat'),
(3, 'abil', 'jaktim'),
(4, 'junas', 'jakbar'),
(5, 'kuh', 'bogor'),
(6, 'zul', 'sukabumi'),
(7, 'ani', 'sumatra'),
(8, 'hani', 'pamulang'),
(9, 'yolan', 'bojong'),
(10, 'nadi', 'depok');

-- --------------------------------------------------------

--
-- Table structure for table `log_update_harga_vape`
--

CREATE TABLE IF NOT EXISTS `log_update_harga_vape` (
  `id_log` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `waktu` time DEFAULT NULL,
  `id_vape` int(13) DEFAULT NULL,
  `harga_jual_lama` int(13) DEFAULT NULL,
  `harga_jual_baru` int(13) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_update_harga_vape`
--

INSERT INTO `log_update_harga_vape` (`id_log`, `tanggal`, `waktu`, `id_vape`, `harga_jual_lama`, `harga_jual_baru`) VALUES
(4, '2020-06-30', '16:38:39', 1, 2900000, 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE IF NOT EXISTS `pembeli` (
  `id_pembeli` int(5) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `nama_pembeli`, `alamat`) VALUES
(1, 'adzano', 'pasarminggu'),
(2, 'afif', 'pasarminggu'),
(3, 'nadi', 'bogor'),
(4, 'solahudin', 'ciputat'),
(5, 'hani', 'ciputat'),
(6, 'royyan', 'pamulang'),
(7, 'yolanda', 'jonggol'),
(8, 'reza', 'pamulang'),
(9, 'faruq', 'bogor'),
(10, 'elis', 'bogor');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_costumer`
--

CREATE TABLE IF NOT EXISTS `pembelian_costumer` (
  `id_pembelian` int(5) NOT NULL,
  `id_admin` int(5) DEFAULT NULL,
  `id_pembeli` int(5) DEFAULT NULL,
  `id_vape` int(5) DEFAULT NULL,
  `tanggal_pembelian` date DEFAULT NULL,
  `jumlah_beli` int(5) DEFAULT NULL,
  `total_bayar` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_costumer`
--

INSERT INTO `pembelian_costumer` (`id_pembelian`, `id_admin`, `id_pembeli`, `id_vape`, `tanggal_pembelian`, `jumlah_beli`, `total_bayar`) VALUES
(1, 2, 3, 2, '2020-04-04', 2, 400000),
(2, 3, 3, 4, '2020-04-05', 1, 250000),
(3, 4, 1, 5, '2020-04-06', 4, 2000000),
(4, 4, 1, 6, '2020-04-06', 2, 240000),
(5, 5, 2, 8, '2020-04-07', 1, 180000),
(6, 1, 1, 10, '2020-04-07', 10, 2500000),
(7, 2, 8, 9, '2020-04-08', 1, 200000),
(8, 1, 8, 9, '2020-04-09', 2, 400000),
(9, 8, 1, 9, '2020-04-12', 2, 400000);

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_ke_distributor`
--

CREATE TABLE IF NOT EXISTS `pemesanan_ke_distributor` (
  `id_pemesan` int(5) NOT NULL,
  `id_admin` int(5) DEFAULT NULL,
  `id_distributor` int(5) DEFAULT NULL,
  `id_vape` int(5) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `waktu` time DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemesanan_ke_distributor`
--

INSERT INTO `pemesanan_ke_distributor` (`id_pemesan`, `id_admin`, `id_distributor`, `id_vape`, `tanggal`, `waktu`) VALUES
(1, 1, 2, 2, '2020-06-02', '02:11:11'),
(2, 4, 6, 8, '2020-06-17', '12:34:27'),
(3, 4, 2, 4, '2020-06-10', '13:28:37'),
(4, 6, 3, 10, '2020-06-17', '12:34:27'),
(5, 5, 3, 4, '2020-06-02', '13:28:37'),
(6, 5, 3, 8, '2020-06-17', '12:34:27'),
(7, 5, 7, 10, '2020-06-02', '02:11:11'),
(8, 7, 1, 7, '2020-06-17', '12:35:40'),
(9, 6, 4, 7, '2020-06-17', '13:26:00'),
(10, 8, 10, 10, '2020-06-17', '22:51:19');

-- --------------------------------------------------------

--
-- Table structure for table `vape`
--

CREATE TABLE IF NOT EXISTS `vape` (
  `id_vape` int(5) NOT NULL,
  `nama_vape` varchar(100) NOT NULL,
  `jumlah_stock` int(4) NOT NULL DEFAULT '0',
  `id_distributor` int(5) DEFAULT NULL,
  `harga_beli` int(20) NOT NULL,
  `harga_jual` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vape`
--

INSERT INTO `vape` (`id_vape`, `nama_vape`, `jumlah_stock`, `id_distributor`, `harga_beli`, `harga_jual`) VALUES
(1, 'SMOK Micro One 150 1900mAh Battry + Tank Minos sub Tank ', 10, 1, 80000, 5000000),
(2, 'GeekVape Blade 235W TC Kit with Aero Tank', 3, 2, 180000, 5000000),
(3, 'Geekvape Nova Kit 200W with Cerberus Tank', 12, 3, 100000, 130000),
(4, 'GeekVape Aegis Boost Pod Kit Built in 1500mAh battery 40W Output 3.7ml Cartridge MTL DTL Vape kit', 9, 4, 200000, 250000),
(5, 'GeekVape Aegis Boost Pod Kit Built in 1500mAh battery 40W Output 3.7ml Cartridge MTL DTL Vape kit ', 2, 5, 400000, 500000),
(6, 'Geekvape Aegis Boost 40W Pod Mod Kit 1500mAh 3.7ml Capacity for MTL & DTL vaping ', 4, 6, 100000, 120000),
(7, 'GEEKVAPE Aegis Boost POD MOD Kit ORIGINAL / SEALED BOX 1500 mAh Battery 40w vape kit  ', 7, 7, 450000, 480000),
(8, 'Big egq King yy35 Starter Kit 120W dengan Baterai 2200mAh Built-in ', 8, 8, 150000, 180000),
(9, 'Original VOOPOO VINCI Mod Pod Kit With 1500mah 5.5ml Capacity VW Vape Pod System fit 0.3ohm PnP coil', 5, 9, 150000, 200000),
(10, 'Rincoe Manto AIO 80W Pod Mod Kit powered by single 18650', 6, 10, 220000, 250000);

--
-- Triggers `vape`
--
DELIMITER $$
CREATE TRIGGER `update_harga_barang` BEFORE UPDATE ON `vape`
 FOR EACH ROW BEGIN
INSERT INTO log_update_harga_vape
SET id_vape = old.id_vape, 
harga_jual_lama = old.harga_jual, 
harga_jual_baru = new.harga_jual, 
tanggal = NOW(),
waktu = NOW();
end
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id_distributor`);

--
-- Indexes for table `log_update_harga_vape`
--
ALTER TABLE `log_update_harga_vape`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indexes for table `pembelian_costumer`
--
ALTER TABLE `pembelian_costumer`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `fk_id_admin` (`id_admin`),
  ADD KEY `fk_pembeli` (`id_pembeli`),
  ADD KEY `fk_id_vape` (`id_vape`);

--
-- Indexes for table `pemesanan_ke_distributor`
--
ALTER TABLE `pemesanan_ke_distributor`
  ADD PRIMARY KEY (`id_pemesan`),
  ADD KEY `id_distributor` (`id_distributor`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_vape` (`id_vape`);

--
-- Indexes for table `vape`
--
ALTER TABLE `vape`
  ADD PRIMARY KEY (`id_vape`),
  ADD KEY `id_distributor` (`id_distributor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `distributor`
--
ALTER TABLE `distributor`
  MODIFY `id_distributor` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `log_update_harga_vape`
--
ALTER TABLE `log_update_harga_vape`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id_pembeli` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `pembelian_costumer`
--
ALTER TABLE `pembelian_costumer`
  MODIFY `id_pembelian` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `pemesanan_ke_distributor`
--
ALTER TABLE `pemesanan_ke_distributor`
  MODIFY `id_pemesan` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `vape`
--
ALTER TABLE `vape`
  MODIFY `id_vape` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian_costumer`
--
ALTER TABLE `pembelian_costumer`
  ADD CONSTRAINT `fk_id_admin` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `fk_id_vape` FOREIGN KEY (`id_vape`) REFERENCES `vape` (`id_vape`),
  ADD CONSTRAINT `fk_pembeli` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`);

--
-- Constraints for table `pemesanan_ke_distributor`
--
ALTER TABLE `pemesanan_ke_distributor`
  ADD CONSTRAINT `pemesanan_ke_distributor_ibfk_1` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`),
  ADD CONSTRAINT `pemesanan_ke_distributor_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `pemesanan_ke_distributor_ibfk_3` FOREIGN KEY (`id_vape`) REFERENCES `vape` (`id_vape`);

--
-- Constraints for table `vape`
--
ALTER TABLE `vape`
  ADD CONSTRAINT `vape_ibfk_1` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
