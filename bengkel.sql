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
-- Database: `bengkel`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE IF NOT EXISTS `akun` (
  `id_akun` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `id_tingkatan` int(20) DEFAULT '4'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_akun`, `username`, `password`, `id_tingkatan`) VALUES
(2, 'hudzzz', 'hudzzz', 4);

-- --------------------------------------------------------

--
-- Table structure for table `body`
--

CREATE TABLE IF NOT EXISTS `body` (
  `id_body` int(20) NOT NULL,
  `nama_rangka` varchar(20) NOT NULL,
  `jumlah_panel` int(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `body`
--

INSERT INTO `body` (`id_body`, `nama_rangka`, `jumlah_panel`) VALUES
(1, 'sedan', 12),
(2, 'jeep', 15),
(3, 'coupe', 10),
(4, 'roadster', 10),
(5, 'CUV', 12),
(6, 'pickup', 18),
(7, 'minivan', 15),
(8, 'muscecar', 12),
(9, 'sportcar', 12),
(10, 'allbody', 100);

-- --------------------------------------------------------

--
-- Table structure for table `costumer`
--

CREATE TABLE IF NOT EXISTS `costumer` (
  `id_costumer` int(20) NOT NULL,
  `nama_costumer` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `nomor_telp` varchar(15) NOT NULL,
  `id_akun` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `elektrikal`
--

CREATE TABLE IF NOT EXISTS `elektrikal` (
  `id_elektrikal` int(20) NOT NULL,
  `kategoti_elektrikal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `elektrikal`
--

INSERT INTO `elektrikal` (`id_elektrikal`, `kategoti_elektrikal`) VALUES
(1, '3 eccu'),
(3001, '3 eccu'),
(3002, '3 eccu 1 airbag'),
(3003, '3 eccu 2 airbag'),
(3004, '1 eccu'),
(3005, '0 eccu'),
(3006, '4 eccu 8 airbag'),
(3007, '6 eccu 8 airbag 1 roof'),
(3008, '2 eccu'),
(3009, '4 eccu'),
(3010, '1 eccu 1 airbag');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE IF NOT EXISTS `jabatan` (
  `id_jabatan` int(20) NOT NULL,
  `nama_jabatan` varchar(30) NOT NULL,
  `gaji_bulanan` int(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2011 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`, `gaji_bulanan`) VALUES
(2001, 'montir', 3500000),
(2002, 'pemilik', 0),
(2003, 'las', 2800000),
(2004, 'ketok', 2500000),
(2005, 'cat', 3500000),
(2006, 'elektrikal', 3800000),
(2007, 'admin', 2800000),
(2008, 'magang', 2000000),
(2009, 'support', 1500000),
(2010, 'marketing', 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `jasa`
--

CREATE TABLE IF NOT EXISTS `jasa` (
  `id_jasa` int(20) NOT NULL,
  `nama_jasa` varchar(100) NOT NULL,
  `harga_jasa` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `keluarga_bengkel`
--

CREATE TABLE IF NOT EXISTS `keluarga_bengkel` (
  `id_keluarga` int(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nik` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_telph` varchar(15) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  `id_jabatan` int(20) DEFAULT NULL,
  `id_akun` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kepemilikan_mobil`
--

CREATE TABLE IF NOT EXISTS `kepemilikan_mobil` (
  `id_kepemilikan` int(20) NOT NULL,
  `id_costumer` int(20) NOT NULL,
  `id_mobil` int(20) NOT NULL,
  `detail_tahun_mobil` int(4) NOT NULL,
  `nomor_plat` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kontrak_kerja`
--

CREATE TABLE IF NOT EXISTS `kontrak_kerja` (
  `id_kontrak` int(20) NOT NULL,
  `id_keluarga` int(20) DEFAULT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_berakhir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mesin`
--

CREATE TABLE IF NOT EXISTS `mesin` (
  `id_mesin` int(20) NOT NULL,
  `kategori_mesin` varchar(30) DEFAULT NULL,
  `generasi` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE IF NOT EXISTS `mobil` (
  `id_mobil` int(20) NOT NULL,
  `nama_mobil` varchar(20) NOT NULL,
  `merek_mobil` varchar(20) NOT NULL,
  `type` varchar(10) NOT NULL,
  `tahun_kisaran` int(4) NOT NULL,
  `id_body` int(20) DEFAULT NULL,
  `id_mesin` int(20) DEFAULT NULL,
  `transmisi` varchar(10) DEFAULT NULL,
  `id_elektrikal` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id_pembayaran` int(20) NOT NULL,
  `id_transaksi` int(20) DEFAULT NULL,
  `tipe_pembayaran` varchar(10) DEFAULT NULL,
  `jumlah_bayar` int(100) NOT NULL,
  `waktu_pembayaran` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pengerjaan`
--

CREATE TABLE IF NOT EXISTS `pengerjaan` (
  `id_pengerjaan` int(20) NOT NULL,
  `id_costumer` int(20) DEFAULT NULL,
  `id_keluarga` int(20) DEFAULT NULL,
  `nama_pengerjaan` varchar(100) NOT NULL,
  `id_sukucadang` int(20) DEFAULT NULL,
  `id_jasa` int(20) DEFAULT NULL,
  `tanggal_pengerjaan` date NOT NULL,
  `status_pengerjaan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sukucadang`
--

CREATE TABLE IF NOT EXISTS `sukucadang` (
  `id_sukucadang` int(20) NOT NULL,
  `id_mesin` int(20) DEFAULT NULL,
  `nama_sukucadang` varchar(100) NOT NULL,
  `harga_suku_cadang` int(100) NOT NULL,
  `id_body` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tingkatan_akun`
--

CREATE TABLE IF NOT EXISTS `tingkatan_akun` (
  `id_tingkatan` int(20) NOT NULL,
  `jabatan_tingkatan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tingkatan_akun`
--

INSERT INTO `tingkatan_akun` (`id_tingkatan`, `jabatan_tingkatan`) VALUES
(1, 'pemilik'),
(2, 'pegawai'),
(3, 'admin'),
(4, 'costumer');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE IF NOT EXISTS `transaksi` (
  `id_transaksi` int(20) NOT NULL,
  `id_pengerjaan` int(20) DEFAULT NULL,
  `id_keluarga` int(20) DEFAULT NULL,
  `id_pembayaran` int(20) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`),
  ADD KEY `id_tingkatan` (`id_tingkatan`);

--
-- Indexes for table `body`
--
ALTER TABLE `body`
  ADD PRIMARY KEY (`id_body`);

--
-- Indexes for table `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`id_costumer`),
  ADD KEY `id_akun` (`id_akun`);

--
-- Indexes for table `elektrikal`
--
ALTER TABLE `elektrikal`
  ADD PRIMARY KEY (`id_elektrikal`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `jasa`
--
ALTER TABLE `jasa`
  ADD PRIMARY KEY (`id_jasa`);

--
-- Indexes for table `keluarga_bengkel`
--
ALTER TABLE `keluarga_bengkel`
  ADD PRIMARY KEY (`id_keluarga`),
  ADD KEY `id_jabatan` (`id_jabatan`),
  ADD KEY `id_akun` (`id_akun`);

--
-- Indexes for table `kepemilikan_mobil`
--
ALTER TABLE `kepemilikan_mobil`
  ADD PRIMARY KEY (`id_kepemilikan`),
  ADD KEY `id_costumer` (`id_costumer`),
  ADD KEY `id_mobil` (`id_mobil`);

--
-- Indexes for table `kontrak_kerja`
--
ALTER TABLE `kontrak_kerja`
  ADD PRIMARY KEY (`id_kontrak`),
  ADD KEY `id_keluarga` (`id_keluarga`);

--
-- Indexes for table `mesin`
--
ALTER TABLE `mesin`
  ADD PRIMARY KEY (`id_mesin`);

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`),
  ADD KEY `id_body` (`id_body`),
  ADD KEY `id_mesin` (`id_mesin`),
  ADD KEY `id_elektrikal` (`id_elektrikal`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indexes for table `pengerjaan`
--
ALTER TABLE `pengerjaan`
  ADD PRIMARY KEY (`id_pengerjaan`),
  ADD KEY `id_costumer` (`id_costumer`),
  ADD KEY `id_keluarga` (`id_keluarga`),
  ADD KEY `id_sukucadang` (`id_sukucadang`),
  ADD KEY `id_jasa` (`id_jasa`);

--
-- Indexes for table `sukucadang`
--
ALTER TABLE `sukucadang`
  ADD PRIMARY KEY (`id_sukucadang`),
  ADD KEY `id_mesin` (`id_mesin`),
  ADD KEY `id_body` (`id_body`);

--
-- Indexes for table `tingkatan_akun`
--
ALTER TABLE `tingkatan_akun`
  ADD PRIMARY KEY (`id_tingkatan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pengerjaan` (`id_pengerjaan`),
  ADD KEY `id_keluarga` (`id_keluarga`),
  ADD KEY `id_pembayaran` (`id_pembayaran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `body`
--
ALTER TABLE `body`
  MODIFY `id_body` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `costumer`
--
ALTER TABLE `costumer`
  MODIFY `id_costumer` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2011;
--
-- AUTO_INCREMENT for table `jasa`
--
ALTER TABLE `jasa`
  MODIFY `id_jasa` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keluarga_bengkel`
--
ALTER TABLE `keluarga_bengkel`
  MODIFY `id_keluarga` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kepemilikan_mobil`
--
ALTER TABLE `kepemilikan_mobil`
  MODIFY `id_kepemilikan` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kontrak_kerja`
--
ALTER TABLE `kontrak_kerja`
  MODIFY `id_kontrak` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mesin`
--
ALTER TABLE `mesin`
  MODIFY `id_mesin` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id_mobil` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pengerjaan`
--
ALTER TABLE `pengerjaan`
  MODIFY `id_pengerjaan` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sukucadang`
--
ALTER TABLE `sukucadang`
  MODIFY `id_sukucadang` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tingkatan_akun`
--
ALTER TABLE `tingkatan_akun`
  MODIFY `id_tingkatan` int(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `akun_ibfk_1` FOREIGN KEY (`id_tingkatan`) REFERENCES `tingkatan_akun` (`id_tingkatan`),
  ADD CONSTRAINT `akun_ibfk_2` FOREIGN KEY (`id_tingkatan`) REFERENCES `tingkatan_akun` (`id_tingkatan`);

--
-- Constraints for table `costumer`
--
ALTER TABLE `costumer`
  ADD CONSTRAINT `costumer_ibfk_1` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`);

--
-- Constraints for table `keluarga_bengkel`
--
ALTER TABLE `keluarga_bengkel`
  ADD CONSTRAINT `keluarga_bengkel_ibfk_1` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`),
  ADD CONSTRAINT `keluarga_bengkel_ibfk_2` FOREIGN KEY (`id_akun`) REFERENCES `akun` (`id_akun`);

--
-- Constraints for table `kepemilikan_mobil`
--
ALTER TABLE `kepemilikan_mobil`
  ADD CONSTRAINT `kepemilikan_mobil_ibfk_1` FOREIGN KEY (`id_costumer`) REFERENCES `costumer` (`id_costumer`),
  ADD CONSTRAINT `kepemilikan_mobil_ibfk_2` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id_mobil`);

--
-- Constraints for table `kontrak_kerja`
--
ALTER TABLE `kontrak_kerja`
  ADD CONSTRAINT `kontrak_kerja_ibfk_1` FOREIGN KEY (`id_keluarga`) REFERENCES `keluarga_bengkel` (`id_keluarga`);

--
-- Constraints for table `mobil`
--
ALTER TABLE `mobil`
  ADD CONSTRAINT `mobil_ibfk_1` FOREIGN KEY (`id_body`) REFERENCES `body` (`id_body`),
  ADD CONSTRAINT `mobil_ibfk_2` FOREIGN KEY (`id_mesin`) REFERENCES `mesin` (`id_mesin`),
  ADD CONSTRAINT `mobil_ibfk_3` FOREIGN KEY (`id_elektrikal`) REFERENCES `elektrikal` (`id_elektrikal`);

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Constraints for table `pengerjaan`
--
ALTER TABLE `pengerjaan`
  ADD CONSTRAINT `pengerjaan_ibfk_1` FOREIGN KEY (`id_costumer`) REFERENCES `costumer` (`id_costumer`),
  ADD CONSTRAINT `pengerjaan_ibfk_2` FOREIGN KEY (`id_keluarga`) REFERENCES `keluarga_bengkel` (`id_keluarga`),
  ADD CONSTRAINT `pengerjaan_ibfk_3` FOREIGN KEY (`id_sukucadang`) REFERENCES `sukucadang` (`id_sukucadang`),
  ADD CONSTRAINT `pengerjaan_ibfk_4` FOREIGN KEY (`id_jasa`) REFERENCES `jasa` (`id_jasa`);

--
-- Constraints for table `sukucadang`
--
ALTER TABLE `sukucadang`
  ADD CONSTRAINT `sukucadang_ibfk_1` FOREIGN KEY (`id_mesin`) REFERENCES `mesin` (`id_mesin`),
  ADD CONSTRAINT `sukucadang_ibfk_2` FOREIGN KEY (`id_body`) REFERENCES `body` (`id_body`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pengerjaan`) REFERENCES `pengerjaan` (`id_pengerjaan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_keluarga`) REFERENCES `pengerjaan` (`id_keluarga`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_pembayaran`) REFERENCES `pembayaran` (`id_pembayaran`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
