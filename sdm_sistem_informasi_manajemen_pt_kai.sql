-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 06:27 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdm sistem informasi manajemen pt kai`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `kode_absensi` varchar(5) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  `jam masuk` datetime NOT NULL,
  `jam_istirahat` datetime NOT NULL,
  `jam pulang` datetime NOT NULL,
  `tanggal_kerja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `id_gaji` varchar(5) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  `id_tunjangan` varchar(5) NOT NULL,
  `gaji perbulan` int(10) NOT NULL,
  `tanggal` datetime NOT NULL,
  `tahun` year(4) NOT NULL,
  `total_gaji_dan_tunjangan` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis ijin`
--

CREATE TABLE `jenis ijin` (
  `kode_ijin` varchar(5) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  `alasan_ijin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `posisi` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `id_pendidikan` varchar(5) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  `lulusan` varchar(25) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `masa pendidikan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan ijin`
--

CREATE TABLE `pengajuan ijin` (
  `kode_pengajuan` varchar(5) NOT NULL,
  `kode_ijin` varchar(5) NOT NULL,
  `jenis_ijin` varchar(10) NOT NULL,
  `bukti_ijin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengembangan diri`
--

CREATE TABLE `pengembangan diri` (
  `id_promosi` varchar(5) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  `kode_absen` varchar(5) NOT NULL,
  `Ketentuan Promosi` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` varchar(5) NOT NULL,
  `id_pegawai` varchar(5) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `posisi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tunjangan`
--

CREATE TABLE `tunjangan` (
  `id_tunjangan` varchar(5) NOT NULL,
  `jenis_tunjangan` varchar(50) NOT NULL,
  `total tunjangan` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`kode_absensi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id_gaji`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_tunjangan` (`id_tunjangan`);

--
-- Indexes for table `jenis ijin`
--
ALTER TABLE `jenis ijin`
  ADD PRIMARY KEY (`kode_ijin`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `pengajuan ijin`
--
ALTER TABLE `pengajuan ijin`
  ADD PRIMARY KEY (`kode_pengajuan`),
  ADD KEY `kode_ijin` (`kode_ijin`);

--
-- Indexes for table `pengembangan diri`
--
ALTER TABLE `pengembangan diri`
  ADD PRIMARY KEY (`id_promosi`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `kode_absen` (`kode_absen`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tunjangan`
--
ALTER TABLE `tunjangan`
  ADD PRIMARY KEY (`id_tunjangan`),
  ADD KEY `id_gaji` (`jenis_tunjangan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`),
  ADD CONSTRAINT `gaji_ibfk_2` FOREIGN KEY (`id_tunjangan`) REFERENCES `tunjangan` (`id_tunjangan`);

--
-- Constraints for table `jenis ijin`
--
ALTER TABLE `jenis ijin`
  ADD CONSTRAINT `jenis ijin_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD CONSTRAINT `pendidikan_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `pengajuan ijin`
--
ALTER TABLE `pengajuan ijin`
  ADD CONSTRAINT `pengajuan ijin_ibfk_1` FOREIGN KEY (`kode_ijin`) REFERENCES `jenis ijin` (`kode_ijin`);

--
-- Constraints for table `pengembangan diri`
--
ALTER TABLE `pengembangan diri`
  ADD CONSTRAINT `pengembangan diri_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`),
  ADD CONSTRAINT `pengembangan diri_ibfk_2` FOREIGN KEY (`kode_absen`) REFERENCES `absensi` (`kode_absensi`);

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
