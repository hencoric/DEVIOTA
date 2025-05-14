-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2025 at 12:32 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_deviota`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin123', '$2y$12$CUCtb3U9U8OgnXCHtJ.LGumtJIzK4o4zAPUnXGf...UrojQz40Kca');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(150) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `stok` int(11) DEFAULT 0,
  `lokasi` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `tipe` enum('Barang Dipinjam','Barang Diambil') DEFAULT NULL,
  `stok_minimum` int(11) DEFAULT NULL,
  `harga` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_kategori`, `stok`, `lokasi`, `deskripsi`, `tipe`, `stok_minimum`, `harga`) VALUES
(1, 'Laptop Lenovo', 1, 2, 'Gudang A', 'Laptop untuk keperluan kantor', 'Barang Dipinjam', 2, 12000000.00),
(2, 'Printer Epson', 1, 68, 'Gudang B', 'Printer warna untuk dokumen', 'Barang Dipinjam', 1, 3500000.00),
(4, 'Laptop Lenovo', 1, 460, 'Gudang A', 'Laptop untuk keperluan kantor', 'Barang Diambil', 2, 12000000.00),
(5, 'Printer Epson', 1, 4, 'Gudang B', 'Printer warna untuk dokumen', 'Barang Diambil', 1, 3500000.00),
(6, 'Kertas A5', 2, 154, 'Gudang C', 'Kertas untuk printer dan fotokopi', 'Barang Dipinjam', 10, 50000.00),
(7, 'NIKE ACD MPUNTAIN 1', 2, 40, 'Gudang A', 'Sepatu', 'Barang Dipinjam', 2, 40000.00),
(8, 'Sepatu Baru', 2, 30, 'Gudang A', 'Sepatu', 'Barang Dipinjam', 20, 40000.00),
(9, 'NIKE ACD MPUNTAIN 2', 2, 20, 'Gudang A', 'fg', 'Barang Dipinjam', 24, 40000.00),
(10, 'NIKE ACD MPUNTAIN 1', 3, 20, 'Gudang A', 'd', 'Barang Dipinjam', 34, 40000.00),
(11, 'NIKE ACD MPUNTAIN 1', 1, 20, 'Gudang A', 's', 'Barang Diambil', 34, 40000.00),
(12, 'NIKE ACD MPUNTAIN 1', 1, 420, 'Gudang A', 'd', 'Barang Dipinjam', 3, 40000.00),
(13, 'NIKE ACD MPUNTAIN 1', 1, 20, 'Gudang A', 'f', 'Barang Dipinjam', 4, 40000.00),
(14, 'Sepatu Baru Nih', 3, 170, 'Gudang Afg', 'g', 'Barang Dipinjam', 34, 40000.00),
(15, 'NIKE ACD MPUNTAIN 1', 2, 220, 'Gudang A', 'sfd', 'Barang Dipinjam', 3, 40000.00),
(24, 'Rose', 2, 250, 'Gudang A', 'hh', 'Barang Diambil', 6, 40000.00);

-- --------------------------------------------------------

--
-- Table structure for table `barang_foto`
--

CREATE TABLE `barang_foto` (
  `id_foto` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_foto`
--

INSERT INTO `barang_foto` (`id_foto`, `id_barang`, `foto`) VALUES
(1, 1, 'laptop_lenovo.jpg'),
(2, 2, 'printer_epson.jpg'),
(4, 1, 'laptop_lenovo.jpg'),
(5, 2, 'printer_epson.jpg'),
(7, 12, 'uploads/vKrjzkkGlrKQ1GhQWIZEoDsYxcvrCxHDFVfNaIaT.jpg'),
(8, 13, 'uploads/yMyQJBQ2fZxVJA4bGgfMGqChREHWnsnZrNzL6Tl6.jpg'),
(9, 13, 'uploads/NxaqtWG2xfnGyYzdsyFrdTnlspexBSPqdkMK0y2r.jpg'),
(10, 13, 'uploads/C0acKsLQCq7TTsqPT4KaCbGO8nhRsYcdyPfHOToM.jpg'),
(11, 13, 'uploads/5oZnHqAKCl7VBEOl3SrLtghOtEqRVnf2JPxmuzOV.jpg'),
(12, 13, 'uploads/qpogRcZhaHaonGP56hgbkckB8jVlGaMh4spvse2U.jpg'),
(13, 14, 'uploads/Gc7CdkA4jFVNUStDTJTE1Lxcli8ZUPmnjZXdoXwr.jpg'),
(14, 14, 'uploads/5HCiDIND8KbwVJRTkVDAwvC7hlRPseGNsN1qbSiN.jpg'),
(15, 14, 'uploads/AftobWwJ9WCyH0RO5FDinKPVGaCHBIkEHAhD0Ltx.jpg'),
(16, 14, 'uploads/yN3OukzatQA2FWch1fExvdRdBroT4dfvBpsjRVRw.jpg'),
(17, 15, 'uploads/nxjf3amxb1wmacm1M3hm6E09IGUD1JNLuwkHBGDu.jpg'),
(18, 15, 'uploads/bx0dkpXw3y5iifJIEvkXrDvP5TKnA8QkT2siKrgt.jpg'),
(32, 24, 'uploads/TLlCUm3pckP03rBblFlacGUUkTVGUr0qct5yNKwd.png'),
(33, 24, 'uploads/j7I6OodFS7aG1WuXbbs00tQS4B2We8Z5GXD8el7C.png');

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_masuk` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_masuk` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_masuk`, `id_barang`, `id_supplier`, `jumlah`, `tanggal_masuk`) VALUES
(1, 1, 1, 5, '2024-03-01 10:00:00'),
(2, 2, 2, 3, '2024-03-05 12:00:00'),
(4, 1, 1, 5, '2024-03-01 10:00:00'),
(5, 2, 2, 3, '2024-03-05 12:00:00'),
(7, 14, NULL, 20, '2025-03-26 17:20:17'),
(8, 14, NULL, 20, '2025-03-26 17:24:45'),
(9, 14, NULL, 90, '2025-03-26 17:24:57'),
(10, 14, NULL, 40, '2025-03-26 17:45:04'),
(11, 15, NULL, 20, '2025-03-27 01:56:57'),
(20, 2, NULL, 89, '2025-04-09 16:04:43'),
(27, 5, NULL, 9, '2025-04-21 12:05:28'),
(28, 7, NULL, 10, '2025-04-21 12:05:36'),
(29, 24, NULL, 200, '2025-04-21 16:55:31'),
(30, 24, NULL, 50, '2025-04-21 16:56:43');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Elektronik'),
(2, 'Peralatan Kantor'),
(3, 'Komponen');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `nama_mahasiswa` varchar(100) NOT NULL,
  `kontak` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nim`, `nama_mahasiswa`, `kontak`) VALUES
(1, '220001', 'Budi Santoso', '081234567890'),
(2, '220002', 'Siti Aminah', '081298765432'),
(3, '220003', 'Joko Widodo', '081376543210'),
(4, '220004', 'Ani Rahmawati', '081265432198'),
(5, '220005', 'Dedi Kusuma', '081278945612'),
(6, '23', 'KAKA', '098737'),
(7, '3', 'F', '4'),
(8, '2310978', 'Marco', '098737'),
(9, '2300001', 'Faiz', '098737'),
(10, '344444', 'Rauf', '098737'),
(11, '230109399', 'Alfi', '0888888'),
(12, '230199928', 'Alfi', '0888352'),
(13, '230303', 'Marco', '098737'),
(14, '234214', 'Rumah', '098737'),
(15, '2000000', 'Burung', '0999'),
(16, '12222', 'sadn', '09873744'),
(17, '23099999', 'Woko', '098737'),
(18, '2093901280', 'Woko', '104802747017240'),
(19, '2308080', 'Woko', '807659'),
(20, '2311175', 'Asep', '0812345678910'),
(21, '23019883', 'Marco', '098737'),
(22, '230000000', 'f', '09'),
(23, '14', 'R', '9'),
(24, '54', 'Haniel Septian', '4'),
(25, '1111', 'GTW', '6'),
(26, '5', '5', '5'),
(27, '7', '7', '7');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_pinjam` datetime DEFAULT current_timestamp(),
  `tanggal_kembali` datetime DEFAULT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_barang`, `id_mahasiswa`, `jumlah`, `tanggal_pinjam`, `tanggal_kembali`, `status`) VALUES
(1, 1, 1, 1, '2024-03-10 08:00:00', NULL, 'dipinjam'),
(2, 2, 2, 1, '2024-03-11 09:30:00', NULL, 'dipinjam'),
(3, 1, 3, 1, '2024-03-10 08:00:00', NULL, 'dipinjam'),
(4, 2, 3, 1, '2024-03-11 09:30:00', NULL, 'dipinjam'),
(5, 1, 3, 1, '2024-03-10 08:00:00', '2025-03-12 14:33:40', 'dikembalikan'),
(6, 2, 4, 2, '2024-03-11 09:30:00', NULL, 'dipinjam'),
(7, 2, 5, 1, '2025-03-12 14:32:22', NULL, 'dipinjam'),
(8, 12, 6, 13, '2025-03-20 00:00:00', '2025-03-26 00:00:00', 'dipinjam'),
(9, 14, 7, 13, '2025-03-19 00:00:00', '2025-03-19 00:00:00', 'Dipinjam'),
(10, 12, 8, 200, '2025-03-19 00:00:00', '2025-04-09 16:25:24', 'Dikembalikan'),
(11, 13, 9, 13, '2025-03-12 00:00:00', '2025-03-13 00:00:00', 'dipinjam'),
(12, 1, 12, 13, '2025-03-26 00:00:00', '2025-03-04 00:00:00', 'dipinjam'),
(14, 16, 13, 3, '2025-04-10 00:00:00', '2025-04-17 00:00:00', 'dipinjam'),
(15, 6, 8, 13, '2025-04-09 15:30:12', '2025-04-09 16:29:20', 'Dikembalikan'),
(16, 6, 8, 13, '2025-04-09 15:30:12', '2025-04-09 16:33:41', 'Dikembalikan'),
(17, 6, 8, 13, '2025-04-09 15:30:12', '2025-04-09 16:36:10', 'Dikembalikan'),
(18, 6, 8, 13, '2025-04-09 15:30:12', '2025-04-09 16:35:09', 'Dikembalikan'),
(19, 4, 14, 200, '2025-04-09 15:35:51', '2025-04-10 15:36:00', 'Dikembalikan'),
(20, 4, 14, 150, '2025-04-09 15:35:51', '2025-04-10 15:36:00', 'dipinjam'),
(21, 4, 14, 150, '2025-04-09 15:35:51', '2025-04-10 15:36:00', 'dipinjam'),
(22, 4, 14, 150, '2025-04-09 15:35:51', '2025-04-10 15:36:00', 'dipinjam'),
(23, 4, 14, 150, '2025-04-09 15:35:51', '2025-04-10 15:36:00', 'dipinjam'),
(24, 2, 8, 2, '2025-04-09 15:41:15', '2025-04-09 16:35:50', 'Dikembalikan'),
(25, 2, 8, 2, '2025-04-09 15:45:55', '2025-04-09 16:34:32', 'Dikembalikan'),
(26, 4, 15, 3, '2025-04-09 15:46:44', '2025-04-11 15:47:00', 'dipinjam'),
(27, 2, 8, 2, '2025-04-09 16:02:37', '2025-04-09 16:21:42', 'Dikembalikan'),
(28, 2, 18, 100, '2025-04-09 20:15:20', '2025-04-09 20:15:00', 'Dikembalikan'),
(29, 2, 8, 3, '2025-04-09 20:52:16', '2025-04-10 00:00:00', 'Dikembalikan'),
(30, 2, 8, 13, '2025-04-10 13:58:10', '2025-04-10 00:00:00', 'dipinjam'),
(31, 7, 20, 10, '2025-04-21 12:02:43', '2025-04-26 00:00:00', 'Dikembalikan'),
(32, 5, 1, 5, '2025-04-21 12:08:32', '2025-04-25 00:00:00', 'dipinjam'),
(33, 5, 20, 4, '2025-04-21 12:22:15', '2025-04-25 00:00:00', 'Dikembalikan'),
(34, 7, 20, 10, '2025-04-21 12:25:38', '2025-04-24 00:00:00', 'Dikembalikan'),
(35, 2, 21, 9, '2025-04-21 15:45:16', '2025-04-29 00:00:00', 'Dikembalikan'),
(36, 4, 21, 10, '2025-04-21 15:45:16', '2025-04-29 00:00:00', 'Dikembalikan'),
(37, 4, 7, 10, '2025-04-21 15:54:15', '2025-04-23 00:00:00', 'Dikembalikan'),
(38, 4, 23, 20, '2025-04-21 15:59:43', '2025-04-23 00:00:00', 'Dikembalikan'),
(39, 4, 24, 40, '2025-04-21 16:02:43', '2025-04-22 00:00:00', 'Dikembalikan'),
(40, 4, 25, 10, '2025-04-21 16:07:23', '2025-04-22 00:00:00', 'Dikembalikan'),
(41, 4, 26, 10, '2025-04-21 16:12:16', '2025-04-22 00:00:00', 'Dikembalikan'),
(42, 4, 27, 50, '2025-04-21 16:13:27', '2025-04-22 00:00:00', 'Dikembalikan'),
(43, 6, 27, 54, '2025-04-21 16:41:32', '2025-04-22 00:00:00', 'Dikembalikan');

--
-- Triggers `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `after_update_peminjaman` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
    -- Jika status berubah menjadi 'dikembalikan', tambahkan stok barang
    IF NEW.status = 'dikembalikan' AND OLD.status = 'dipinjam' THEN
        UPDATE barang
        SET stok = stok + NEW.jumlah
        WHERE id_barang = NEW.id_barang;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_peminjaman` BEFORE INSERT ON `peminjaman` FOR EACH ROW BEGIN
    DECLARE kategori_barang INT;

    -- Ambil id_kategori dari barang yang dipinjam
    SELECT id_kategori INTO kategori_barang FROM barang WHERE id_barang = NEW.id_barang;

    -- Jika kategori barang adalah 1 (misalnya kategori peminjaman), set status menjadi 'dipinjam'
    IF kategori_barang = 1 THEN
        SET NEW.status = 'dipinjam';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pengambilan`
--

CREATE TABLE `pengambilan` (
  `id_pengambilan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal_ambil` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengambilan`
--

INSERT INTO `pengambilan` (`id_pengambilan`, `id_barang`, `id_mahasiswa`, `jumlah`, `tanggal_ambil`) VALUES
(1, 3, 1, 5, '2025-03-12 14:21:32'),
(2, 7, 8, 2, '2025-03-26 00:00:00'),
(3, 3, 8, 3, '2025-03-26 18:51:19'),
(4, 1, 8, 3, '2025-03-27 01:56:25'),
(5, 2, 10, 234, '2025-03-27 13:46:43'),
(6, 1, 11, 3, '2025-03-27 13:51:09'),
(8, 9, 16, 3, '2025-04-09 15:56:10'),
(9, 2, 8, 2, '2025-04-09 16:04:12'),
(10, 2, 19, 100, '2025-04-09 20:18:00'),
(11, 2, 8, 23, '2025-04-10 14:19:41'),
(12, 7, 20, 10, '2025-04-21 12:48:16'),
(13, 5, 1, 5, '2025-04-21 13:33:29'),
(14, 2, 22, 10, '2025-04-21 15:47:26'),
(15, 4, 22, 10, '2025-04-21 15:47:26'),
(16, 4, 27, 40, '2025-04-21 16:39:26');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('A592ArLRdcatPohHwOnn6IloNyp56Pn1afnyYSA0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienlEcFR3Q3FqdWlGdTlWSm5wSUphbFZ0bE5DYTlWYkh1SkpabHpVaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9saXN0YmFyYW5nMj9rYXRlZ29yaT0mc2VhcmNoPSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1745230699);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(150) NOT NULL,
  `kontak` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `kontak`, `alamat`) VALUES
(1, 'PT. Teknologi Maju', '08123456789', 'Jakarta, Indonesia'),
(2, 'CV. Peralatan Sejahtera', '08198765432', 'Bandung, Indonesia'),
(3, 'PT. Teknologi Maju', '08123456789', 'Jakarta, Indonesia'),
(4, 'CV. Peralatan Sejahtera', '08198765432', 'Bandung, Indonesia');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indexes for table `barang_foto`
--
ALTER TABLE `barang_foto`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_masuk`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `mahasiswa_ibfk_1` (`id_mahasiswa`);

--
-- Indexes for table `pengambilan`
--
ALTER TABLE `pengambilan`
  ADD PRIMARY KEY (`id_pengambilan`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `mahasiswa_ibfk_2` (`id_mahasiswa`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `barang_foto`
--
ALTER TABLE `barang_foto`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `pengambilan`
--
ALTER TABLE `pengambilan`
  MODIFY `id_pengambilan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE;

--
-- Constraints for table `barang_foto`
--
ALTER TABLE `barang_foto`
  ADD CONSTRAINT `barang_foto_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE;

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE,
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
