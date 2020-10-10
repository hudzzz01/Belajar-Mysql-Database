-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 10, 2020 at 10:13 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_invenotry`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `pass` varchar(70) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `uname`, `pass`, `foto`) VALUES
(8, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'letris.png'),
(9, 'syahid', 'hudzaifah', 'ajnaj');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `id_barang` char(5) NOT NULL,
  `nama_barang` text NOT NULL,
  `spesifikasi` text NOT NULL,
  `lokasi` text NOT NULL,
  `kondisi` text NOT NULL,
  `jumlah_barang` char(10) NOT NULL,
  `sumber_dana` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `spesifikasi`, `lokasi`, `kondisi`, `jumlah_barang`, `sumber_dana`) VALUES
('BR001', 'wulandari', 'Biru', 'Koperasi', 'Baik', '5', 'Sekolah'),
('BR002', 'Sendal', 'Biru', 'Pamulang', 'Baik', '4', 'Sekolah'),
('BR003', 'sepatu', 'Kuning', 'Koperasi', 'bagus', '3', 'Sekolah');

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE IF NOT EXISTS `barang_masuk` (
  `id_barang` char(5) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `jml_masuk` varchar(20) NOT NULL,
  `id_supplier` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjam_barang`
--

CREATE TABLE IF NOT EXISTS `pinjam_barang` (
  `id_pinjam` char(5) NOT NULL,
  `peminjaman` varchar(20) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `id_barang` char(5) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `jml_barang` int(20) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `kondisi` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjam_barang`
--

INSERT INTO `pinjam_barang` (`id_pinjam`, `peminjaman`, `tgl_pinjam`, `id_barang`, `nama_barang`, `jml_barang`, `tgl_kembali`, `kondisi`) VALUES
('PJ001', 'dede', '2019-03-29', '', 'Sendal', 2, '2019-03-30', 'baik');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE IF NOT EXISTS `stok` (
  `id_barang` char(5) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `jml_masuk` char(20) NOT NULL,
  `jml_keluar` char(20) NOT NULL,
  `total_barang` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `id_supplier` char(5) NOT NULL,
  `nama_supplier` varchar(30) NOT NULL,
  `alamat_supplier` varchar(30) NOT NULL,
  `telp` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`, `telp`) VALUES
('SP001', 'tes', 'tesssss', '081223028558'),
('SP002', '', 'kjxgjldnld', '082122340367');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `pinjam_barang`
--
ALTER TABLE `pinjam_barang`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD UNIQUE KEY `id_barang` (`id_barang`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
