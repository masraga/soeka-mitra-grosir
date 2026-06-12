-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 12, 2026 at 10:44 PM
-- Server version: 10.11.16-MariaDB-cll-lve
-- PHP Version: 8.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soes1896_soeka_mitra_grosir`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('soeka-mitra-grosir-cache-app_settings', 'a:8:{s:22:\"payment_deadline_hours\";s:1:\"1\";s:9:\"bank_name\";s:3:\"BCA\";s:19:\"bank_account_number\";s:10:\"1234567890\";s:17:\"bank_account_name\";s:18:\"Soeka Mitra Grosir\";s:10:\"store_name\";s:18:\"Soeka Mitra Grosir\";s:13:\"store_address\";s:128:\"Vanya Park Cluster Azura Blok C19/36, Desa/Kelurahan Pagedangan,Kec. Pagedangan, Kab. Tangerang, Provinsi Banten,Kode Pos: 15336\";s:11:\"store_phone\";s:13:\"0895600060506\";s:17:\"store_description\";s:54:\"Toko grosir sembako terpercaya dengan harga terjangkau\";}', 2092567265);

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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Beras & Gandum', 'beras-gandum', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(2, 'Minyak Goreng', 'minyak-goreng', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(3, 'Gula & Garam', 'gula-garam', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(4, 'Tepung', 'tepung', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(5, 'Mie & Pasta', 'mie-pasta', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(6, 'Susu & Olahan', 'susu-olahan', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(7, 'Kopi & Teh', 'kopi-teh', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(8, 'Bumbu Dapur', 'bumbu-dapur', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(9, 'Makanan Kaleng', 'makanan-kaleng', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(10, 'Sabun & Deterjen', 'sabun-deterjen', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07');

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
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_21_000001_add_role_to_users_table', 1),
(5, '2026_02_21_000002_create_settings_table', 1),
(6, '2026_02_21_000003_create_categories_table', 1),
(7, '2026_02_21_000004_create_products_table', 1),
(8, '2026_02_21_000005_create_shipping_services_table', 1),
(9, '2026_02_21_000006_create_orders_table', 1),
(10, '2026_02_21_000007_create_order_items_table', 1),
(11, '2026_02_21_000008_create_sliders_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `notes` text DEFAULT NULL,
  `shipping_service_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_service_name` varchar(255) NOT NULL,
  `shipping_cost` int(10) UNSIGNED NOT NULL,
  `subtotal` bigint(20) UNSIGNED NOT NULL,
  `total_price` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending_payment','payment_confirmed','processing','shipped','completed','cancelled') NOT NULL DEFAULT 'pending_payment',
  `payment_proof` varchar(255) DEFAULT NULL,
  `payment_deadline` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `customer_name`, `customer_phone`, `customer_address`, `notes`, `shipping_service_id`, `shipping_service_name`, `shipping_cost`, `subtotal`, `total_price`, `status`, `payment_proof`, `payment_deadline`, `created_at`, `updated_at`) VALUES
(1, 'ORD-20260221-00001', 'RAGA MULIA KUSUMA', '081258473521', 'JL BUKIT PASIR RT 003 RW 003\r\nTANGKERANG TIMUR, TENAYAN RAYA\r\nPEKANABARU RIAU', NULL, 1, 'Ambil di Toko', 0, 60000, 60000, 'pending_payment', NULL, '2026-02-21 03:39:27', '2026-02-21 02:39:27', '2026-02-21 02:39:27'),
(2, 'ORD-20260222-00001', 'Kjjsvbx', '09876521527', 'Bali', NULL, 4, 'Gosend / Grab Same Day', 20000, 230000, 250000, 'pending_payment', NULL, '2026-02-22 03:29:05', '2026-02-22 02:29:05', '2026-02-22 02:29:05'),
(3, 'ORD-20260222-00002', 'pp', '0976262', 'ppp', 'lll', 3, 'Gosend / Grab Instant', 15000, 7000, 22000, 'pending_payment', NULL, '2026-02-22 11:04:06', '2026-02-22 10:04:06', '2026-02-22 10:04:06'),
(4, 'ORD-20260222-00003', 'Iskandar Zulkarnaen', '087834950519', 'Tirto, Triharjo, Pandak', NULL, 3, 'Gosend / Grab Instant', 15000, 12000, 27000, 'pending_payment', NULL, '2026-02-22 12:26:14', '2026-02-22 11:26:14', '2026-02-22 11:26:14'),
(5, 'ORD-20260222-00004', 'dsdd', 'dsdd', 'sdsdsds', NULL, 1, 'Ambil di Toko', 0, 195000, 195000, 'pending_payment', NULL, '2026-02-22 12:28:11', '2026-02-22 11:28:11', '2026-02-22 11:28:11'),
(6, 'ORD-20260222-00005', 'kln', 'knk', 'kn', 'knk', 1, 'Ambil di Toko', 0, 25000, 25000, 'pending_payment', NULL, '2026-02-22 12:35:22', '2026-02-22 11:35:22', '2026-02-22 11:35:22'),
(7, 'ORD-20260222-00006', 'Djdnndn', '0373++3738', 'Jdjxjxjx', 'Jgkfjc', 4, 'Gosend / Grab Same Day', 20000, 135000, 155000, 'pending_payment', NULL, '2026-02-22 13:29:32', '2026-02-22 12:29:32', '2026-02-22 12:29:32'),
(8, 'ORD-20260222-00007', 'hahaha', '081718727117', 'jajaja', 'hahah', 1, 'Ambil di Toko', 0, 70000, 70000, 'pending_payment', NULL, '2026-02-22 14:00:25', '2026-02-22 13:00:25', '2026-02-22 13:00:25'),
(9, 'ORD-20260222-00008', 'Uu', '081274747483', 'Bogor', NULL, 2, 'Kurir Toko', 10000, 92000, 102000, 'pending_payment', NULL, '2026-02-22 14:30:34', '2026-02-22 13:30:34', '2026-02-22 13:30:34'),
(10, 'ORD-20260222-00009', 'Gilang Dira Prasetya', '0938383', 'JPMH+RC9\r\nJl. Jend.S.Parman IV\r\nKrajan Kulon', NULL, 4, 'Gosend / Grab Same Day', 20000, 150000, 170000, 'pending_payment', NULL, '2026-02-22 14:55:16', '2026-02-22 13:55:16', '2026-02-22 13:55:16'),
(11, 'ORD-20260222-00010', 'ssksks', '091234647', 'analslsn', 'dbsns', 3, 'Gosend / Grab Instant', 15000, 75000, 90000, 'pending_payment', NULL, '2026-02-22 15:12:05', '2026-02-22 14:12:05', '2026-02-22 14:12:05'),
(12, 'ORD-20260222-00011', 'y', '7784433', 'test', 'test', 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-02-22 15:28:29', '2026-02-22 14:28:29', '2026-02-22 14:28:29'),
(13, 'ORD-20260222-00012', 'Coba', '0873536363346', 'Coba', NULL, 2, 'Kurir Toko', 10000, 75000, 85000, 'pending_payment', NULL, '2026-02-22 15:50:04', '2026-02-22 14:50:04', '2026-02-22 14:50:04'),
(14, 'ORD-20260222-00013', 'Budi darwin', '081234567890', 'Jl. in aja dulu', NULL, 2, 'Kurir Toko', 10000, 12000, 22000, 'pending_payment', NULL, '2026-02-22 16:31:24', '2026-02-22 15:31:24', '2026-02-22 15:31:24'),
(15, 'ORD-20260222-00014', 'Bej', 'Ueuu', 'Uue', 'Bsbne', 2, 'Kurir Toko', 10000, 12000, 22000, 'pending_payment', NULL, '2026-02-22 16:42:55', '2026-02-22 15:42:55', '2026-02-22 15:42:55'),
(16, 'ORD-20260222-00015', 'Yy', 'Opp', 'Hj', 'H', 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-02-22 16:59:14', '2026-02-22 15:59:14', '2026-02-22 15:59:14'),
(17, 'ORD-20260222-00016', 'test', '080808080808', 'Test', 'Test', 1, 'Ambil di Toko', 0, 15000, 15000, 'pending_payment', NULL, '2026-02-22 17:02:27', '2026-02-22 16:02:27', '2026-02-22 16:02:27'),
(18, 'ORD-20260222-00017', 'df', '0812747488294', 'jdjdkdm', 'dmdmdsn', 3, 'Gosend / Grab Instant', 15000, 75000, 90000, 'pending_payment', NULL, '2026-02-22 17:22:53', '2026-02-22 16:22:53', '2026-02-22 16:22:53'),
(19, 'ORD-20260222-00018', 'Tahayasin Ramadhan', '081539882793', 'jln, kapt patimura, kelurahan kenali besar', NULL, 2, 'Kurir Toko', 10000, 56000, 66000, 'pending_payment', 'proofs/nXGDTdTp7w7vhD3KOZg2FwhUDnNqCSA7cexlKyX6.jpg', '2026-02-22 17:26:26', '2026-02-22 16:26:26', '2026-02-22 16:27:21'),
(20, 'ORD-20260223-00001', 'Barok', '081295942093', 'Jl h som', NULL, 4, 'Gosend / Grab Same Day', 20000, 5000, 25000, 'pending_payment', NULL, '2026-02-22 18:06:26', '2026-02-22 17:06:26', '2026-02-22 17:06:26'),
(21, 'ORD-20260223-00002', 'blabka', '088888888', 'planet mars ji', NULL, 2, 'Kurir Toko', 10000, 60000, 70000, 'pending_payment', NULL, '2026-02-22 18:27:14', '2026-02-22 17:27:14', '2026-02-22 17:27:14'),
(22, 'ORD-20260223-00003', 'bubuhu', '0822223333', 'jl in aja dulu', NULL, 3, 'Gosend / Grab Instant', 15000, 25000, 40000, 'pending_payment', NULL, '2026-02-22 18:39:30', '2026-02-22 17:39:30', '2026-02-22 17:39:30'),
(23, 'ORD-20260223-00004', 'Fcxs', '08654333', 'Dsasdgb', 'Ggwww', 4, 'Gosend / Grab Same Day', 20000, 36000, 56000, 'pending_payment', NULL, '2026-02-22 18:46:59', '2026-02-22 17:46:59', '2026-02-22 17:46:59'),
(24, 'ORD-20260223-00005', 'Rama', '081325365849', 'Jl.Angkasa, Mauliru', NULL, 2, 'Kurir Toko', 10000, 75000, 85000, 'pending_payment', NULL, '2026-02-22 19:02:25', '2026-02-22 18:02:25', '2026-02-22 18:02:25'),
(25, 'ORD-20260223-00006', 'Hh', 'Puh', 'Yg', 'Yg', 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-02-22 19:12:46', '2026-02-22 18:12:46', '2026-02-22 18:12:46'),
(26, 'ORD-20260223-00007', 'Hh', 'Bh', 'Hh', 'Hh', 2, 'Kurir Toko', 10000, 60000, 70000, 'pending_payment', NULL, '2026-02-22 19:13:54', '2026-02-22 18:13:54', '2026-02-22 18:13:54'),
(27, 'ORD-20260223-00008', 'anjay mabar', '081342217682', 'antartica', NULL, 3, 'Gosend / Grab Instant', 15000, 117000, 132000, 'pending_payment', NULL, '2026-02-22 19:14:05', '2026-02-22 18:14:05', '2026-02-22 18:14:05'),
(28, 'ORD-20260223-00009', 'tangerang', '085716385134', 'pamulang 2', NULL, 1, 'Ambil di Toko', 0, 60000, 60000, 'pending_payment', NULL, '2026-02-22 19:24:27', '2026-02-22 18:24:27', '2026-02-22 18:24:27'),
(29, 'ORD-20260223-00010', 'Andi Sukarno', '089645918375', 'Ds cibadang', NULL, 3, 'Gosend / Grab Instant', 15000, 60000, 75000, 'pending_payment', NULL, '2026-02-22 19:27:31', '2026-02-22 18:27:31', '2026-02-22 18:27:31'),
(30, 'ORD-20260223-00011', 'Bagas Sudiro', '0889365718294', 'Ds cibadak', NULL, 3, 'Gosend / Grab Instant', 15000, 25000, 40000, 'pending_payment', NULL, '2026-02-22 19:29:15', '2026-02-22 18:29:15', '2026-02-22 18:29:15'),
(31, 'ORD-20260223-00012', 'Maulana', '0881652314', 'Semarang', NULL, 1, 'Ambil di Toko', 0, 375000, 375000, 'pending_payment', 'proofs/JZM3hho3ow1yewFdkDNHA5oWLY3lggMDYkmKAq8k.jpg', '2026-02-22 19:30:58', '2026-02-22 18:30:58', '2026-02-22 18:33:37'),
(32, 'ORD-20260223-00013', 'yyyy', 'oooooi', 'bbbbb', 'tttyt', 4, 'Gosend / Grab Same Day', 20000, 600000, 620000, 'pending_payment', NULL, '2026-02-22 20:06:28', '2026-02-22 19:06:28', '2026-02-22 19:06:28'),
(33, 'ORD-20260223-00014', 'Y', '081256161', 'Bshsgs', NULL, 1, 'Ambil di Toko', 0, 160000, 160000, 'pending_payment', NULL, '2026-02-22 20:42:54', '2026-02-22 19:42:54', '2026-02-22 19:42:54'),
(34, 'ORD-20260223-00015', 'Dd', '0876588987', 'Jkrta', NULL, 1, 'Ambil di Toko', 0, 60000, 60000, 'pending_payment', NULL, '2026-02-22 20:43:41', '2026-02-22 19:43:41', '2026-02-22 19:43:41'),
(35, 'ORD-20260223-00016', 'Ursa Kim', '+1 (145) 427-3066', 'Sit quis expedita f', 'Laboris est dolor i', 3, 'Gosend / Grab Instant', 15000, 195000, 210000, 'pending_payment', NULL, '2026-02-22 20:47:42', '2026-02-22 19:47:42', '2026-02-22 19:47:42'),
(36, 'ORD-20260223-00017', 'Tes', '123456788', 'Tes', 'Testing', 1, 'Ambil di Toko', 0, 60000, 60000, 'pending_payment', NULL, '2026-02-22 21:33:43', '2026-02-22 20:33:43', '2026-02-22 20:33:43'),
(37, 'ORD-20260223-00018', 'Ghzbsb', '81382837', 'Nandbsbx', NULL, 2, 'Kurir Toko', 10000, 75000, 85000, 'pending_payment', NULL, '2026-02-22 21:43:15', '2026-02-22 20:43:15', '2026-02-22 20:43:15'),
(38, 'ORD-20260223-00019', 'Haha', '0873', 'Cek', NULL, 3, 'Gosend / Grab Instant', 15000, 75000, 90000, 'pending_payment', NULL, '2026-02-22 22:07:41', '2026-02-22 21:07:41', '2026-02-22 21:07:41'),
(39, 'ORD-20260223-00020', 'indira', '085265405929', 'batam', NULL, 2, 'Kurir Toko', 10000, 30000, 40000, 'pending_payment', NULL, '2026-02-22 22:10:48', '2026-02-22 21:10:48', '2026-02-22 21:10:48'),
(40, 'ORD-20260223-00021', 'D', 'X', 'D', 'D', 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-02-22 22:29:21', '2026-02-22 21:29:21', '2026-02-22 21:29:21'),
(41, 'ORD-20260223-00022', 'ooo', '000', 'KOKEO', 'EEE', 4, 'Gosend / Grab Same Day', 20000, 25000, 45000, 'pending_payment', NULL, '2026-02-22 22:35:15', '2026-02-22 21:35:15', '2026-02-22 21:35:15'),
(42, 'ORD-20260223-00023', 'jaja', '012932814929133', 'jakarta selatan', NULL, 4, 'Gosend / Grab Same Day', 20000, 49000, 69000, 'pending_payment', NULL, '2026-02-22 22:48:52', '2026-02-22 21:48:52', '2026-02-22 21:48:52'),
(43, 'ORD-20260223-00024', 'Hehejej', 'Kskekekekk', 'Kkskskek', NULL, 1, 'Ambil di Toko', 0, 150000, 150000, 'pending_payment', NULL, '2026-02-22 22:54:20', '2026-02-22 21:54:20', '2026-02-22 21:54:20'),
(44, 'ORD-20260223-00025', 'Tes', '08500000', 'Tes', NULL, 2, 'Kurir Toko', 10000, 35000, 45000, 'pending_payment', NULL, '2026-02-22 22:55:25', '2026-02-22 21:55:25', '2026-02-22 21:55:25'),
(45, 'ORD-20260223-00026', 'HerdianLp3i', '08228828', 'jsjskak', NULL, 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-02-22 22:56:02', '2026-02-22 21:56:02', '2026-02-22 21:56:02'),
(46, 'ORD-20260223-00027', 'Ayu', '0000000000000', 'Tangerang', NULL, 1, 'Ambil di Toko', 0, 21000, 21000, 'pending_payment', NULL, '2026-02-22 23:40:42', '2026-02-22 22:40:42', '2026-02-22 22:40:42'),
(47, 'ORD-20260223-00028', 'U', '0', 'S', NULL, 2, 'Kurir Toko', 10000, 60000, 70000, 'pending_payment', NULL, '2026-02-23 01:06:25', '2026-02-23 00:06:25', '2026-02-23 00:06:25'),
(48, 'ORD-20260223-00029', 'a', '0', 'a', NULL, 1, 'Ambil di Toko', 0, 60000, 60000, 'pending_payment', NULL, '2026-02-23 01:18:29', '2026-02-23 00:18:29', '2026-02-23 00:18:29'),
(49, 'ORD-20260223-00030', 'drowofnflenono', '74840449', 'fheosmxhurwoen', NULL, 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-02-23 01:31:30', '2026-02-23 00:31:30', '2026-02-23 00:31:30'),
(50, 'ORD-20260223-00031', 'Dony', '085385640178', 'Padegadang', 'Test aja', 1, 'Ambil di Toko', 0, 35000, 35000, 'pending_payment', NULL, '2026-02-23 02:26:55', '2026-02-23 01:26:55', '2026-02-23 01:26:55'),
(51, 'ORD-20260223-00032', 'Dony', '081122334455', 'Padegadang', 'Test', 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-02-23 02:29:38', '2026-02-23 01:29:38', '2026-02-23 01:29:38'),
(52, 'ORD-20260223-00033', 'EKA AHMAD WAHYUDI', '082272726633', 'Malang', 's', 2, 'Kurir Toko', 10000, 75000, 85000, 'pending_payment', NULL, '2026-02-23 03:06:11', '2026-02-23 02:06:11', '2026-02-23 02:06:11'),
(53, 'ORD-20260223-00034', 'A', '2', 'G', 'A', 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-02-23 04:11:00', '2026-02-23 03:11:00', '2026-02-23 03:11:00'),
(54, 'ORD-20260223-00035', 'Ysysys', '09992827272', 'Jalanjdndkslans', NULL, 4, 'Gosend / Grab Same Day', 20000, 25000, 45000, 'pending_payment', NULL, '2026-02-23 06:26:13', '2026-02-23 05:26:13', '2026-02-23 05:26:13'),
(55, 'ORD-20260223-00036', 'Muhammad Irfan', '0895611088149', 'Kos Mendas 79, Jalan Menteng Wadas Timur No. 79', NULL, 4, 'Gosend / Grab Same Day', 20000, 120000, 140000, 'pending_payment', NULL, '2026-02-23 06:37:02', '2026-02-23 05:37:02', '2026-02-23 05:37:02'),
(56, 'ORD-20260223-00037', 'Jess', '081233423311', 'Jl Jula Juli Niaga 5', NULL, 1, 'Ambil di Toko', 0, 8000, 8000, 'pending_payment', NULL, '2026-02-23 06:41:34', '2026-02-23 05:41:34', '2026-02-23 05:41:34'),
(57, 'ORD-20260223-00038', 'Oke', '083638373830', 'Malang', NULL, 2, 'Kurir Toko', 10000, 60000, 70000, 'pending_payment', NULL, '2026-02-23 10:21:36', '2026-02-23 09:21:36', '2026-02-23 09:21:36'),
(58, 'ORD-20260223-00039', 'Jhon die', '0000000000000', 'Test', NULL, 3, 'Gosend / Grab Instant', 15000, 95000, 110000, 'pending_payment', NULL, '2026-02-23 11:48:29', '2026-02-23 10:48:29', '2026-02-23 10:48:29'),
(59, 'ORD-20260223-00040', 'gg', '08286362', 'uxbsbzbdbbddx', NULL, 3, 'Gosend / Grab Instant', 15000, 90000, 105000, 'pending_payment', NULL, '2026-02-23 15:35:15', '2026-02-23 14:35:15', '2026-02-23 14:35:15'),
(60, 'ORD-20260223-00041', 'kaka', '081234567891', 'sini aja', NULL, 2, 'Kurir Toko', 10000, 225000, 235000, 'pending_payment', 'proofs/whhrslkzSzbvUlQdoplvditIZQPzDQhaqFvCKQEF.jpg', '2026-02-23 15:38:53', '2026-02-23 14:38:53', '2026-02-23 14:41:05'),
(61, 'ORD-20260223-00042', 'jkdsfds', '2341313123', 'dfsdfsdfasf', NULL, 1, 'Ambil di Toko', 0, 25000, 25000, 'pending_payment', NULL, '2026-02-23 15:51:00', '2026-02-23 14:51:00', '2026-02-23 14:51:00'),
(62, 'ORD-20260223-00043', 'jija', '08123456789', 'sdgdsgf', 'dsfds', 2, 'Kurir Toko', 10000, 35000, 45000, 'pending_payment', 'proofs/ecSXiuSt5od5UiLsZLdOyyJurjpamufT4kO1r9xi.jpg', '2026-02-23 15:52:24', '2026-02-23 14:52:24', '2026-02-23 14:54:43'),
(63, 'ORD-20260223-00044', 'asdasdasd', 'asdasdasd', 'asdasdasd', 'asdasdasd', 1, 'Ambil di Toko', 0, 5000, 5000, 'pending_payment', NULL, '2026-02-23 16:07:15', '2026-02-23 15:07:15', '2026-02-23 15:07:15'),
(64, 'ORD-20260223-00045', 'aassjj', '0899', '67A Gleason Hollow Suite 657', '-', 1, 'Ambil di Toko', 0, 118000, 118000, 'pending_payment', NULL, '2026-02-23 16:22:12', '2026-02-23 15:22:12', '2026-02-23 15:22:12'),
(65, 'ORD-20260224-00001', 'Ft', '45', 'Ff', 'Gt', 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-02-23 19:14:36', '2026-02-23 18:14:36', '2026-02-23 18:14:36'),
(66, 'ORD-20260224-00002', 'Cek', '0812345678', 'Cek aja kak', NULL, 2, 'Kurir Toko', 10000, 5000, 15000, 'pending_payment', NULL, '2026-02-23 19:40:52', '2026-02-23 18:40:52', '2026-02-23 18:40:52'),
(67, 'ORD-20260224-00003', 'Reinaldo Reinaldo', '089532001`212`2', 'Jl Pluit Permai 1 No 34', NULL, 1, 'Ambil di Toko', 0, 25000, 25000, 'pending_payment', NULL, '2026-02-23 20:16:53', '2026-02-23 19:16:53', '2026-02-23 19:16:53'),
(68, 'ORD-20260224-00004', 'Reinaldo Reinaldo', 'axsXSaxs7', 'Jl Pluit Permai 1 No 34', NULL, 4, 'Gosend / Grab Same Day', 20000, 25000, 45000, 'pending_payment', 'proofs/PM9uTq9gM1fQil3CQ28ZTjFbp1Ng8isEnOHTUwf7.jpg', '2026-02-23 20:17:21', '2026-02-23 19:17:21', '2026-02-23 19:18:07'),
(69, 'ORD-20260224-00005', 'Test', '08123213123213', 'Jl. Pahlawan No 10', NULL, 3, 'Gosend / Grab Instant', 15000, 60000, 75000, 'pending_payment', NULL, '2026-02-23 21:37:31', '2026-02-23 20:37:31', '2026-02-23 20:37:31'),
(70, 'ORD-20260224-00006', 'r', 'r', 'r', NULL, 1, 'Ambil di Toko', 0, 5000, 5000, 'pending_payment', NULL, '2026-02-24 00:45:43', '2026-02-23 23:45:43', '2026-02-23 23:45:43'),
(71, 'ORD-20260224-00007', 'test', '34546578790', 'Jln street', 'test', 1, 'Ambil di Toko', 0, 60000, 60000, 'pending_payment', NULL, '2026-02-24 01:11:18', '2026-02-24 00:11:18', '2026-02-24 00:11:18'),
(72, 'ORD-20260224-00008', 'Shuja', '085756087220', 'Wbhh', 'Ajhjah', 4, 'Gosend / Grab Same Day', 20000, 95000, 115000, 'pending_payment', NULL, '2026-02-24 02:13:36', '2026-02-24 01:13:36', '2026-02-24 01:13:36'),
(73, 'ORD-20260224-00009', 'Test', '081234567890', 'Test', 'Test', 1, 'Ambil di Toko', 0, 60000, 60000, 'pending_payment', NULL, '2026-02-24 04:17:24', '2026-02-24 03:17:24', '2026-02-24 03:17:24'),
(74, 'ORD-20260224-00010', '323', '2321321', '213213', '31231', 2, 'Kurir Toko', 10000, 14000, 24000, 'pending_payment', NULL, '2026-02-24 05:58:11', '2026-02-24 04:58:11', '2026-02-24 04:58:11'),
(75, 'ORD-20260224-00011', 'Fififkfk', '57848849493', 'F jgk jfjfkejdjhshshsj', 'Duhrjfifkfifif', 1, 'Ambil di Toko', 0, 150000, 150000, 'pending_payment', NULL, '2026-02-24 06:48:16', '2026-02-24 05:48:16', '2026-02-24 05:48:16'),
(76, 'ORD-20260224-00012', 'krio', '085711209770', 'Jl. Manggis No.45 Blok A 01,RT.1/RW.4', NULL, 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-02-24 07:54:56', '2026-02-24 06:54:56', '2026-02-24 06:54:56'),
(77, 'ORD-20260224-00013', 'Cihuy', '088812344478', 'Jalan merdeka no.11', NULL, 3, 'Gosend / Grab Instant', 15000, 35000, 50000, 'pending_payment', NULL, '2026-02-24 08:38:00', '2026-02-24 07:38:00', '2026-02-24 07:38:00'),
(78, 'ORD-20260224-00014', 'dad', '52525', 'asdasdas', NULL, 1, 'Ambil di Toko', 0, 60000, 60000, 'pending_payment', NULL, '2026-02-24 09:02:08', '2026-02-24 08:02:08', '2026-02-24 08:02:08'),
(79, 'ORD-20260224-00015', 'Testing', '081362549566', 'Testing', 'Hahahaha', 3, 'Gosend / Grab Instant', 15000, 83000, 98000, 'pending_payment', 'proofs/TKJmD2IFCRr3Xy1roPY0Cy9GJ0VD2sKatqoj9v4x.jpg', '2026-02-24 14:46:31', '2026-02-24 13:46:31', '2026-02-24 13:47:27'),
(80, 'ORD-20260224-00016', 'Cero', '08974636637337', 'Malang', NULL, 3, 'Gosend / Grab Instant', 15000, 60000, 75000, 'pending_payment', NULL, '2026-02-24 14:57:05', '2026-02-24 13:57:05', '2026-02-24 13:57:05'),
(81, 'ORD-20260224-00017', 'test', '0819999982', 'Depok', NULL, 3, 'Gosend / Grab Instant', 15000, 8000, 23000, 'pending_payment', NULL, '2026-02-24 16:13:14', '2026-02-24 15:13:14', '2026-02-24 15:13:14'),
(82, 'ORD-20260224-00018', 'Mamama', '085432123456', 'Haporsaa', NULL, 1, 'Ambil di Toko', 0, 7000, 7000, 'pending_payment', NULL, '2026-02-24 17:05:18', '2026-02-24 16:05:18', '2026-02-24 16:05:18'),
(83, 'ORD-20260225-00001', 'hshs', '083765349876', 'hshsha', 'jsjsjs', 1, 'Ambil di Toko', 0, 15000, 15000, 'pending_payment', NULL, '2026-02-24 21:54:32', '2026-02-24 20:54:32', '2026-02-24 20:54:32'),
(84, 'ORD-20260225-00002', 'sdfds', '08123456789', 'sdf', NULL, 1, 'Ambil di Toko', 0, 8000, 8000, 'pending_payment', NULL, '2026-02-24 22:37:46', '2026-02-24 21:37:46', '2026-02-24 21:37:46'),
(85, 'ORD-20260225-00003', 'Amos', '0858999109728', 'Jl. Inerbang I, No. 48F, Kel. tengah Kramat Jati', NULL, 2, 'Kurir Toko', 10000, 12000, 22000, 'pending_payment', NULL, '2026-02-25 06:13:17', '2026-02-25 05:13:17', '2026-02-25 05:13:17'),
(86, 'ORD-20260225-00004', 'Wha', '037363', 'Hsbbs', 'Vsbs', 2, 'Kurir Toko', 10000, 15000, 25000, 'pending_payment', NULL, '2026-02-25 07:32:20', '2026-02-25 06:32:20', '2026-02-25 06:32:20'),
(87, 'ORD-20260225-00005', 'RAGA MULIA KUSUMA', '085122694800', 'Vanya Park Cluster Azura Blok C19/36, Desa/Kelurahan Pagedangan, Kec. Pagedangan, Kab. Tangerang, Provinsi Banten, Kode Pos: 15336', 'Test', 4, 'Gosend / Grab Same Day', 20000, 34503000, 34523000, 'pending_payment', 'proofs/cXM6nH2VOofNbt25ZHHvaya23cVqyV7MT9vEZI2h.jpg', '2026-02-25 09:08:44', '2026-02-25 08:08:44', '2026-02-25 08:11:19'),
(88, 'ORD-20260225-00006', 'RAGA MULIA KUSUMA', '085122694800', 'Judol', 'Project judol', 4, 'Gosend / Grab Same Day', 20000, 12000, 32000, 'pending_payment', 'proofs/eOBhpoQydWoX6J4lwHLPBTr7pQo2MW1oIcKujjKl.jpg', '2026-02-25 09:14:38', '2026-02-25 08:14:38', '2026-02-25 08:15:37'),
(89, 'ORD-20260225-00007', 'Joko', '081361350849', 'Bali jakarta', NULL, 1, 'Ambil di Toko', 0, 12000, 12000, 'pending_payment', 'proofs/68mIpqbNVM7ZiwA32F1jIqAGKgkhJ5TnySNeNeyY.png', '2026-02-25 09:49:32', '2026-02-25 08:49:32', '2026-02-25 08:50:48'),
(90, 'ORD-20260225-00008', 'Aryo', '087754368124', 'Kota Solo', NULL, 2, 'Kurir Toko', 10000, 12000, 22000, 'pending_payment', NULL, '2026-02-25 10:26:46', '2026-02-25 09:26:46', '2026-02-25 09:26:46'),
(91, 'ORD-20260225-00009', 'adsfsdf', 'asdfasdf', 'sdafasdfasdf', 'sadf', 1, 'Ambil di Toko', 0, 12000, 12000, 'pending_payment', NULL, '2026-02-25 12:17:01', '2026-02-25 11:17:01', '2026-02-25 11:17:01'),
(92, 'ORD-20260225-00010', 'Garuda Muda', '08333835959', 'Kemana aja', 'Oke', 3, 'Gosend / Grab Instant', 15000, 12000, 27000, 'pending_payment', NULL, '2026-02-25 14:53:44', '2026-02-25 13:53:44', '2026-02-25 13:53:44'),
(93, 'ORD-20260225-00011', 'Andreas Xaviera', '07077047751', 'Acosta Engineering Solutions, PC', NULL, 3, 'Gosend / Grab Instant', 15000, 12000, 27000, 'pending_payment', NULL, '2026-02-25 16:38:23', '2026-02-25 15:38:23', '2026-02-25 15:38:23'),
(94, 'ORD-20260226-00001', 'Charissa Mcmillan', '+1 (552) 328-9569', 'Temporibus atque sae', 'Laboriosam cumque d', 1, 'Ambil di Toko', 0, 12000, 12000, 'pending_payment', NULL, '2026-02-25 18:49:01', '2026-02-25 17:49:01', '2026-02-25 17:49:01'),
(95, 'ORD-20260226-00002', 'Sydney Fisher', '+1 (801) 878-9364', 'Nostrud non fugit i', 'Nostrud elit laboru', 4, 'Gosend / Grab Same Day', 20000, 12000, 32000, 'pending_payment', NULL, '2026-02-25 18:50:54', '2026-02-25 17:50:54', '2026-02-25 17:50:54'),
(96, 'ORD-20260226-00003', 'Chelsea Pearson', '+1 (316) 897-5575', 'Voluptate eos pariat', 'Nulla quia qui assum', 3, 'Gosend / Grab Instant', 15000, 12000, 27000, 'pending_payment', 'proofs/oadAxJcP2N2MlNM7TJQ6vNB1ZIApvDAqEIiCEpf6.png', '2026-02-25 18:53:43', '2026-02-25 17:53:43', '2026-02-25 18:00:30'),
(97, 'ORD-20260226-00004', 'testing', '08112121212', 'jl a', NULL, 2, 'Kurir Toko', 10000, 12000, 22000, 'pending_payment', NULL, '2026-02-25 20:11:23', '2026-02-25 19:11:23', '2026-02-25 19:11:23'),
(98, 'ORD-20260226-00005', 'vgggvv', '081234567890', 'hshzvzv', 'hdbshsjsbzb', 1, 'Ambil di Toko', 0, 12000, 12000, 'pending_payment', NULL, '2026-02-26 02:42:58', '2026-02-26 01:42:58', '2026-02-26 01:42:58'),
(99, 'ORD-20260226-00006', 'm', '9', 'm', 'n', 4, 'Gosend / Grab Same Day', 20000, 48000, 68000, 'pending_payment', NULL, '2026-02-26 11:31:03', '2026-02-26 10:31:03', '2026-02-26 10:31:03'),
(100, 'ORD-20260227-00001', 'Test', '0811111112', 'Kalimantan', NULL, 4, 'Gosend / Grab Same Day', 20000, 24000, 44000, 'pending_payment', NULL, '2026-02-26 18:01:32', '2026-02-26 17:01:32', '2026-02-26 17:01:32'),
(101, 'ORD-20260227-00002', 'Rifqy Fakhry', '081222074013', 'Jalan sapan rt 03 rw 05 kecamatan Solokan jeruk\r\nJalan sapan rt 03 rw 05 kecamatan Solokan jeruk', '-', 4, 'Gosend / Grab Same Day', 20000, 12000, 32000, 'pending_payment', NULL, '2026-02-26 22:20:21', '2026-02-26 21:20:21', '2026-02-26 21:20:21'),
(102, 'ORD-20260227-00003', 'Beh', '0393', 'Jsnd', 'Snnf', 3, 'Gosend / Grab Instant', 15000, 12000, 27000, 'pending_payment', NULL, '2026-02-27 07:43:46', '2026-02-27 06:43:46', '2026-02-27 06:43:46'),
(103, 'ORD-20260228-00001', 'Aurya', '08737282228', 'JL rajawali jakarta', NULL, 3, 'Gosend / Grab Instant', 15000, 12000, 27000, 'pending_payment', NULL, '2026-02-28 02:51:14', '2026-02-28 01:51:14', '2026-02-28 01:51:14'),
(104, 'ORD-20260228-00002', 'Test', '081234567893', 'Jakarta', NULL, 1, 'Ambil di Toko', 0, 12000, 12000, 'pending_payment', NULL, '2026-02-28 05:16:57', '2026-02-28 04:16:57', '2026-02-28 04:16:57'),
(105, 'ORD-20260301-00001', 'h', '085525359645', 'ojannana\r\nojannana', NULL, 1, 'Ambil di Toko', 0, 12000, 12000, 'pending_payment', NULL, '2026-03-01 04:42:15', '2026-03-01 03:42:15', '2026-03-01 03:42:15'),
(106, 'ORD-20260303-00001', 'Rajih', '0867272663633', 'Perum muktisari', NULL, 4, 'Gosend / Grab Same Day', 20000, 12000, 32000, 'pending_payment', NULL, '2026-03-03 11:09:54', '2026-03-03 10:09:54', '2026-03-03 10:09:54'),
(107, 'ORD-20260303-00002', 'Geo', '085162640614', 'Jl. Kahuripan', NULL, 3, 'Gosend / Grab Instant', 15000, 24000, 39000, 'pending_payment', NULL, '2026-03-03 11:12:17', '2026-03-03 10:12:17', '2026-03-03 10:12:17'),
(108, 'ORD-20260304-00001', 'test', '0812346372827', 'Test', 'Test', 3, 'Gosend / Grab Instant', 15000, 12000, 27000, 'pending_payment', NULL, '2026-03-04 04:17:45', '2026-03-04 03:17:45', '2026-03-04 03:17:45'),
(109, 'ORD-20260304-00002', 'jkdksj', '0826638833', 'jdkisksn', 'jajsi', 2, 'Kurir Toko', 10000, 12000, 22000, 'pending_payment', NULL, '2026-03-04 05:12:20', '2026-03-04 04:12:20', '2026-03-04 04:12:20'),
(110, 'ORD-20260304-00003', 'KoderPedia', '081385690012', 'Jl. Sempurna Ujung Gg. Keluarga No. 1, Medan Denai, Kota Medan, Sumatera Utara. 20228', 'Testing', 4, 'Gosend / Grab Same Day', 20000, 12000, 32000, 'pending_payment', NULL, '2026-03-04 12:10:02', '2026-03-04 11:10:02', '2026-03-04 11:10:02'),
(111, 'ORD-20260306-00001', 'asu', '0867565', 'kidul', NULL, 4, 'Gosend / Grab Same Day', 20000, 72000, 92000, 'pending_payment', NULL, '2026-03-05 23:53:44', '2026-03-05 22:53:44', '2026-03-05 22:53:44'),
(112, 'ORD-20260307-00001', 'P', '08538372920', 'USA', '.', 1, 'Ambil di Toko', 0, 12000, 12000, 'pending_payment', NULL, '2026-03-06 19:44:49', '2026-03-06 18:44:49', '2026-03-06 18:44:49'),
(113, 'ORD-20260307-00002', 'Fufufafa', '0877851', 'Jawa', NULL, 1, 'Ambil di Toko', 0, 12000, 12000, 'pending_payment', NULL, '2026-03-07 01:15:29', '2026-03-07 00:15:29', '2026-03-07 00:15:29'),
(114, 'ORD-20260307-00003', 'Fufufafa', '08778512', 'Jawa', 'None', 2, 'Kurir Toko', 10000, 12000, 22000, 'pending_payment', NULL, '2026-03-07 01:20:16', '2026-03-07 00:20:16', '2026-03-07 00:20:16'),
(115, 'ORD-20260307-00004', 'Yusuf Nurhadi', '085810944926', 'Jl. Barokah 1, Gang. Wa Joni, no.78\r\nKel. Larangan Utara, Kec. Larangan', NULL, 2, 'Kurir Toko', 10000, 12000, 22000, 'pending_payment', NULL, '2026-03-07 02:23:49', '2026-03-07 01:23:49', '2026-03-07 01:23:49'),
(116, 'ORD-20260307-00005', 'j', 'h', 'h', NULL, 4, 'Gosend / Grab Same Day', 20000, 12000, 32000, 'pending_payment', NULL, '2026-03-07 10:49:20', '2026-03-07 09:49:20', '2026-03-07 09:49:20'),
(117, 'ORD-20260307-00006', 'tes', '089694567888', 'tes', 'tes', 2, 'Kurir Toko', 10000, 12000, 22000, 'pending_payment', 'proofs/n86j4XojnJIbzIMA3wKOGi6BGcSFkIKu5BkwX7YM.jpg', '2026-03-07 11:22:45', '2026-03-07 10:22:45', '2026-03-07 10:23:49'),
(118, 'ORD-20260410-00001', 'Demo', '0892625262727', 'Purwosari, Demak, 59563', NULL, 4, 'Gosend / Grab Same Day', 20000, 60000, 80000, 'pending_payment', NULL, '2026-04-09 21:34:16', '2026-04-09 20:34:16', '2026-04-09 20:34:16'),
(119, 'ORD-20260410-00002', 'test', '081271397917', 'test', NULL, 1, 'Ambil di Toko', 0, 14000, 14000, 'pending_payment', NULL, '2026-04-10 03:08:06', '2026-04-10 02:08:06', '2026-04-10 02:08:06'),
(120, 'ORD-20260410-00003', 'Dhdhdh', '3773737', 'Jsjsj', 'Jfb', 2, 'Kurir Toko', 10000, 60000, 70000, 'pending_payment', NULL, '2026-04-10 13:10:42', '2026-04-10 12:10:42', '2026-04-10 12:10:42'),
(121, 'ORD-20260411-00001', 'riski', '089546735412', 'Jalan Jendral Sudirman Jakarta', NULL, 2, 'Kurir Toko', 10000, 75000, 85000, 'pending_payment', NULL, '2026-04-11 04:33:13', '2026-04-11 03:33:13', '2026-04-11 03:33:13'),
(122, 'ORD-20260412-00001', 'Ahmad Faris', '083649463864', 'ds shsksiwysjsjwks', 'bdmsks', 4, 'Gosend / Grab Same Day', 20000, 75000, 95000, 'pending_payment', NULL, '2026-04-12 10:44:59', '2026-04-12 09:44:59', '2026-04-12 09:44:59'),
(123, 'ORD-20260414-00001', 'jjj', '09877', 'hhgggf', NULL, 4, 'Gosend / Grab Same Day', 20000, 14000, 34000, 'pending_payment', NULL, '2026-04-14 04:26:47', '2026-04-14 03:26:47', '2026-04-14 03:26:47'),
(124, 'ORD-20260419-00001', 'Hanif Izzudin Rahman', '085720176894', 'Surabaya, Jawa Timur', NULL, 2, 'Kurir Toko', 10000, 7000, 17000, 'pending_payment', NULL, '2026-04-19 11:05:57', '2026-04-19 10:05:57', '2026-04-19 10:05:57'),
(125, 'ORD-20260422-00001', 'Ted', '0088', 'Tes', NULL, 4, 'Gosend / Grab Same Day', 20000, 135000, 155000, 'pending_payment', NULL, '2026-04-22 08:18:10', '2026-04-22 07:18:10', '2026-04-22 07:18:10'),
(126, 'ORD-20260423-00001', 'Tes', '75555', 'Tes', NULL, 1, 'Ambil di Toko', 0, 150000, 150000, 'pending_payment', NULL, '2026-04-23 04:47:43', '2026-04-23 03:47:43', '2026-04-23 03:47:43'),
(127, 'ORD-20260423-00002', 'Dimas aji', '0851117197282', 'Jakarta Utara', NULL, 2, 'Kurir Toko', 10000, 12000, 22000, 'pending_payment', NULL, '2026-04-23 13:13:45', '2026-04-23 12:13:45', '2026-04-23 12:13:45'),
(128, 'ORD-20260424-00001', 'khkjh', '08080808088', 'kjhkjhkjh', 'kjhkjhkjhj', 4, 'Gosend / Grab Same Day', 20000, 135000, 155000, 'pending_payment', NULL, '2026-04-23 21:28:48', '2026-04-23 20:28:48', '2026-04-23 20:28:48'),
(129, 'ORD-20260424-00002', 'sad', '08080808', 'kjh', 'kjh', 4, 'Gosend / Grab Same Day', 20000, 135000, 155000, 'pending_payment', NULL, '2026-04-23 21:30:34', '2026-04-23 20:30:34', '2026-04-23 20:30:34'),
(130, 'ORD-20260427-00001', 'tes', '098888', 'tes', 'ts', 2, 'Kurir Toko', 10000, 75000, 85000, 'pending_payment', NULL, '2026-04-27 16:14:18', '2026-04-27 15:14:18', '2026-04-27 15:14:18'),
(131, 'ORD-20260504-00001', 'nama lengkap', '08123123213', 'alamat samping rumah', NULL, 1, 'Ambil di Toko', 0, 75000, 75000, 'pending_payment', NULL, '2026-05-04 06:13:48', '2026-05-04 05:13:48', '2026-05-04 05:13:48'),
(132, 'ORD-20260507-00001', '-', '0', '-', '-', 1, 'Ambil di Toko', 0, 120000, 120000, 'pending_payment', NULL, '2026-05-07 09:17:42', '2026-05-07 08:17:42', '2026-05-07 08:17:42'),
(133, 'ORD-20260508-00001', 'Udin', '081277779999', 'Jakrta', NULL, 1, 'Ambil di Toko', 0, 180000, 180000, 'pending_payment', NULL, '2026-05-08 05:33:55', '2026-05-08 04:33:55', '2026-05-08 04:33:55'),
(134, 'ORD-20260512-00001', 'Manse', '081234567890', 'Tirtayasa', NULL, 2, 'Kurir Toko', 10000, 15000, 25000, 'pending_payment', NULL, '2026-05-11 20:09:29', '2026-05-11 19:09:29', '2026-05-11 19:09:29'),
(135, 'ORD-20260517-00001', 'Fd', '5838', 'Fhjsjs', '74828', 3, 'Gosend / Grab Instant', 15000, 60000, 75000, 'pending_payment', NULL, '2026-05-17 02:44:56', '2026-05-17 01:44:56', '2026-05-17 01:44:56'),
(136, 'ORD-20260518-00001', 'H', '09797', 'J', NULL, 2, 'Kurir Toko', 10000, 80000, 90000, 'pending_payment', NULL, '2026-05-18 09:56:55', '2026-05-18 08:56:55', '2026-05-18 08:56:55'),
(137, 'ORD-20260527-00001', 'Dadang Supriatno', '082282129212', 'Apartment Casablanca East Residence', NULL, 4, 'Gosend / Grab Same Day', 20000, 60000, 80000, 'pending_payment', NULL, '2026-05-26 19:07:40', '2026-05-26 18:07:40', '2026-05-26 18:07:40'),
(138, 'ORD-20260528-00001', 'demotes', '081973613029', 'jalan kebon kacang 3 no.20, tanah abang, jakpus, dki Jakarta, 10240', NULL, 3, 'Gosend / Grab Instant', 15000, 60000, 75000, 'pending_payment', NULL, '2026-05-27 23:56:37', '2026-05-27 22:56:37', '2026-05-27 22:56:37'),
(139, 'ORD-20260601-00001', 'John doe', '123456', 'Lorem ipsum', NULL, 3, 'Gosend / Grab Instant', 15000, 75000, 90000, 'pending_payment', NULL, '2026-06-01 00:56:38', '2026-05-31 23:56:38', '2026-05-31 23:56:38'),
(140, 'ORD-20260602-00001', 'demotes', '081973613029', 'jalan kebon kacang 3 no.20, tanah abang, jakpus, dki Jakarta, 10240', NULL, 2, 'Kurir Toko', 10000, 60000, 70000, 'pending_payment', NULL, '2026-06-01 20:45:35', '2026-06-01 19:45:35', '2026-06-01 19:45:35'),
(141, 'ORD-20260602-00002', 'demotes', '081973613029', 'jalan kebon kacang 3 no.20, tanah abang, jakpus, dki Jakarta, 10240', NULL, 2, 'Kurir Toko', 10000, 25000, 35000, 'pending_payment', NULL, '2026-06-01 20:50:02', '2026-06-01 19:50:02', '2026-06-01 19:50:02'),
(142, 'ORD-20260604-00001', 'demotes', '081973613029', 'jalan kebon kacang 3 no.20, tanah abang, jakpus, dki Jakarta, 10240', NULL, 2, 'Kurir Toko', 10000, 8000, 18000, 'pending_payment', NULL, '2026-06-04 08:36:22', '2026-06-04 07:36:22', '2026-06-04 07:36:22'),
(143, 'ORD-20260608-00001', 'Pp', '0888888', 'Cek', NULL, 1, 'Ambil di Toko', 0, 90000, 90000, 'pending_payment', NULL, '2026-06-08 10:36:45', '2026-06-08 09:36:45', '2026-06-08 09:36:45'),
(144, 'ORD-20260611-00001', 'ABDILLAH UMAR', '083145744402', 'surabaya', NULL, 2, 'Kurir Toko', 10000, 75000, 85000, 'pending_payment', NULL, '2026-06-10 21:01:54', '2026-06-10 20:01:54', '2026-06-10 20:01:54'),
(145, 'ORD-20260612-00001', 'Alfa', '08123456789', 'Depok', NULL, 2, 'Kurir Toko', 10000, 20000, 30000, 'pending_payment', NULL, '2026-06-12 05:32:56', '2026-06-12 04:32:56', '2026-06-12 04:32:56');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `subtotal` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-21 02:39:27', '2026-02-21 02:39:27'),
(2, 2, 2, 'Beras Medium 5kg', 2, 60000, 120000, '2026-02-22 02:29:05', '2026-02-22 02:29:05'),
(3, 2, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 02:29:05', '2026-02-22 02:29:05'),
(4, 2, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-22 02:29:05', '2026-02-22 02:29:05'),
(5, 3, 12, 'Tepung Tapioka 500g', 1, 7000, 7000, '2026-02-22 10:04:06', '2026-02-22 10:04:06'),
(6, 4, 10, 'Tepung Terigu Segitiga Biru 1kg', 1, 12000, 12000, '2026-02-22 11:26:14', '2026-02-22 11:26:14'),
(7, 5, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 11:28:11', '2026-02-22 11:28:11'),
(8, 5, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-22 11:28:11', '2026-02-22 11:28:11'),
(9, 5, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-22 11:28:11', '2026-02-22 11:28:11'),
(10, 5, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 11:28:11', '2026-02-22 11:28:11'),
(11, 6, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-22 11:35:22', '2026-02-22 11:35:22'),
(12, 7, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 12:29:32', '2026-02-22 12:29:32'),
(13, 7, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 12:29:32', '2026-02-22 12:29:32'),
(14, 8, 4, 'Minyak Goreng Bimoli 2L', 2, 35000, 70000, '2026-02-22 13:00:25', '2026-02-22 13:00:25'),
(15, 9, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 13:30:34', '2026-02-22 13:30:34'),
(16, 9, 11, 'Tepung Beras Rose Brand 500g', 4, 8000, 32000, '2026-02-22 13:30:34', '2026-02-22 13:30:34'),
(17, 10, 1, 'Beras Premium 5kg', 2, 75000, 150000, '2026-02-22 13:55:16', '2026-02-22 13:55:16'),
(18, 11, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 14:12:05', '2026-02-22 14:12:05'),
(19, 12, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 14:28:29', '2026-02-22 14:28:29'),
(20, 13, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 14:50:04', '2026-02-22 14:50:04'),
(21, 14, 10, 'Tepung Terigu Segitiga Biru 1kg', 1, 12000, 12000, '2026-02-22 15:31:24', '2026-02-22 15:31:24'),
(22, 15, 10, 'Tepung Terigu Segitiga Biru 1kg', 1, 12000, 12000, '2026-02-22 15:42:55', '2026-02-22 15:42:55'),
(23, 16, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 15:59:14', '2026-02-22 15:59:14'),
(24, 17, 13, 'Indomie Goreng (5 pcs)', 1, 15000, 15000, '2026-02-22 16:02:27', '2026-02-22 16:02:27'),
(25, 18, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 16:22:53', '2026-02-22 16:22:53'),
(26, 19, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-22 16:26:26', '2026-02-22 16:26:26'),
(27, 19, 6, 'Minyak Goreng Curah 1L', 1, 14000, 14000, '2026-02-22 16:26:26', '2026-02-22 16:26:26'),
(28, 19, 12, 'Tepung Tapioka 500g', 1, 7000, 7000, '2026-02-22 16:26:26', '2026-02-22 16:26:26'),
(29, 20, 9, 'Garam Dapur Cap Kapal 250g', 1, 5000, 5000, '2026-02-22 17:06:26', '2026-02-22 17:06:26'),
(30, 21, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 17:27:14', '2026-02-22 17:27:14'),
(31, 22, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-22 17:39:30', '2026-02-22 17:39:30'),
(32, 23, 22, 'Kecap Manis ABC 600ml', 1, 22000, 22000, '2026-02-22 17:46:59', '2026-02-22 17:46:59'),
(33, 23, 23, 'Saos Sambal ABC 335ml', 1, 14000, 14000, '2026-02-22 17:46:59', '2026-02-22 17:46:59'),
(34, 24, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 18:02:25', '2026-02-22 18:02:25'),
(35, 25, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 18:12:46', '2026-02-22 18:12:46'),
(36, 26, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 18:13:54', '2026-02-22 18:13:54'),
(37, 27, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 18:14:05', '2026-02-22 18:14:05'),
(38, 27, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-22 18:14:05', '2026-02-22 18:14:05'),
(39, 27, 12, 'Tepung Tapioka 500g', 1, 7000, 7000, '2026-02-22 18:14:05', '2026-02-22 18:14:05'),
(40, 28, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 18:24:27', '2026-02-22 18:24:27'),
(41, 29, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 18:27:31', '2026-02-22 18:27:31'),
(42, 30, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-22 18:29:15', '2026-02-22 18:29:15'),
(43, 31, 1, 'Beras Premium 5kg', 5, 75000, 375000, '2026-02-22 18:30:58', '2026-02-22 18:30:58'),
(44, 32, 1, 'Beras Premium 5kg', 8, 75000, 600000, '2026-02-22 19:06:28', '2026-02-22 19:06:28'),
(45, 33, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 19:42:54', '2026-02-22 19:42:54'),
(46, 33, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 19:42:54', '2026-02-22 19:42:54'),
(47, 33, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-22 19:42:54', '2026-02-22 19:42:54'),
(48, 34, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 19:43:41', '2026-02-22 19:43:41'),
(49, 35, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 19:47:42', '2026-02-22 19:47:42'),
(50, 35, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-22 19:47:42', '2026-02-22 19:47:42'),
(51, 35, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-22 19:47:42', '2026-02-22 19:47:42'),
(52, 35, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 19:47:42', '2026-02-22 19:47:42'),
(53, 36, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-22 20:33:43', '2026-02-22 20:33:43'),
(54, 37, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 20:43:15', '2026-02-22 20:43:15'),
(55, 38, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 21:07:41', '2026-02-22 21:07:41'),
(56, 39, 10, 'Tepung Terigu Segitiga Biru 1kg', 1, 12000, 12000, '2026-02-22 21:10:48', '2026-02-22 21:10:48'),
(57, 39, 5, 'Minyak Goreng Tropical 1L', 1, 18000, 18000, '2026-02-22 21:10:48', '2026-02-22 21:10:48'),
(58, 40, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 21:29:21', '2026-02-22 21:29:21'),
(59, 41, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-22 21:35:15', '2026-02-22 21:35:15'),
(60, 42, 6, 'Minyak Goreng Curah 1L', 1, 14000, 14000, '2026-02-22 21:48:52', '2026-02-22 21:48:52'),
(61, 42, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-22 21:48:52', '2026-02-22 21:48:52'),
(62, 43, 1, 'Beras Premium 5kg', 2, 75000, 150000, '2026-02-22 21:54:20', '2026-02-22 21:54:20'),
(63, 44, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-22 21:55:25', '2026-02-22 21:55:25'),
(64, 45, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-22 21:56:02', '2026-02-22 21:56:02'),
(65, 46, 12, 'Tepung Tapioka 500g', 3, 7000, 21000, '2026-02-22 22:40:42', '2026-02-22 22:40:42'),
(66, 47, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-23 00:06:25', '2026-02-23 00:06:25'),
(67, 48, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-23 00:18:29', '2026-02-23 00:18:29'),
(68, 49, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-23 00:31:30', '2026-02-23 00:31:30'),
(69, 50, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-23 01:26:55', '2026-02-23 01:26:55'),
(70, 51, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-23 01:29:38', '2026-02-23 01:29:38'),
(71, 52, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-23 02:06:11', '2026-02-23 02:06:11'),
(72, 53, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-23 03:11:00', '2026-02-23 03:11:00'),
(73, 54, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-23 05:26:13', '2026-02-23 05:26:13'),
(74, 55, 11, 'Tepung Beras Rose Brand 500g', 15, 8000, 120000, '2026-02-23 05:37:02', '2026-02-23 05:37:02'),
(75, 56, 11, 'Tepung Beras Rose Brand 500g', 1, 8000, 8000, '2026-02-23 05:41:34', '2026-02-23 05:41:34'),
(76, 57, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-23 09:21:36', '2026-02-23 09:21:36'),
(77, 58, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-23 10:48:29', '2026-02-23 10:48:29'),
(78, 58, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-23 10:48:29', '2026-02-23 10:48:29'),
(79, 59, 7, 'Gula Pasir 1kg', 1, 15000, 15000, '2026-02-23 14:35:15', '2026-02-23 14:35:15'),
(80, 59, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-23 14:35:15', '2026-02-23 14:35:15'),
(81, 60, 1, 'Beras Premium 5kg', 3, 75000, 225000, '2026-02-23 14:38:53', '2026-02-23 14:38:53'),
(82, 61, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-23 14:51:00', '2026-02-23 14:51:00'),
(83, 62, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-23 14:52:24', '2026-02-23 14:52:24'),
(84, 63, 9, 'Garam Dapur Cap Kapal 250g', 1, 5000, 5000, '2026-02-23 15:07:15', '2026-02-23 15:07:15'),
(85, 64, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-23 15:22:12', '2026-02-23 15:22:12'),
(86, 64, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-23 15:22:12', '2026-02-23 15:22:12'),
(87, 64, 5, 'Minyak Goreng Tropical 1L', 1, 18000, 18000, '2026-02-23 15:22:12', '2026-02-23 15:22:12'),
(88, 65, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-23 18:14:36', '2026-02-23 18:14:36'),
(89, 66, 9, 'Garam Dapur Cap Kapal 250g', 1, 5000, 5000, '2026-02-23 18:40:52', '2026-02-23 18:40:52'),
(90, 67, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-23 19:16:53', '2026-02-23 19:16:53'),
(91, 68, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-02-23 19:17:21', '2026-02-23 19:17:21'),
(92, 69, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-23 20:37:31', '2026-02-23 20:37:31'),
(93, 70, 9, 'Garam Dapur Cap Kapal 250g', 1, 5000, 5000, '2026-02-23 23:45:43', '2026-02-23 23:45:43'),
(94, 71, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-24 00:11:18', '2026-02-24 00:11:18'),
(95, 72, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-24 01:13:36', '2026-02-24 01:13:36'),
(96, 72, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-24 01:13:36', '2026-02-24 01:13:36'),
(97, 73, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-24 03:17:24', '2026-02-24 03:17:24'),
(98, 74, 6, 'Minyak Goreng Curah 1L', 1, 14000, 14000, '2026-02-24 04:58:11', '2026-02-24 04:58:11'),
(99, 75, 1, 'Beras Premium 5kg', 2, 75000, 150000, '2026-02-24 05:48:16', '2026-02-24 05:48:16'),
(100, 76, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-24 06:54:56', '2026-02-24 06:54:56'),
(101, 77, 4, 'Minyak Goreng Bimoli 2L', 1, 35000, 35000, '2026-02-24 07:38:00', '2026-02-24 07:38:00'),
(102, 78, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-24 08:02:08', '2026-02-24 08:02:08'),
(103, 79, 11, 'Tepung Beras Rose Brand 500g', 1, 8000, 8000, '2026-02-24 13:46:31', '2026-02-24 13:46:31'),
(104, 79, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-02-24 13:46:31', '2026-02-24 13:46:31'),
(105, 80, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-02-24 13:57:05', '2026-02-24 13:57:05'),
(106, 81, 11, 'Tepung Beras Rose Brand 500g', 1, 8000, 8000, '2026-02-24 15:13:14', '2026-02-24 15:13:14'),
(107, 82, 12, 'Tepung Tapioka 500g', 1, 7000, 7000, '2026-02-24 16:05:18', '2026-02-24 16:05:18'),
(108, 83, 13, 'Indomie Goreng (5 pcs)', 1, 15000, 15000, '2026-02-24 20:54:32', '2026-02-24 20:54:32'),
(109, 84, 11, 'Tepung Beras Rose Brand 500g', 1, 8000, 8000, '2026-02-24 21:37:46', '2026-02-24 21:37:46'),
(110, 85, 10, 'Tepung Terigu Segitiga Biru 1kg', 1, 12000, 12000, '2026-02-25 05:13:17', '2026-02-25 05:13:17'),
(111, 86, 7, 'Gula Pasir 1kg', 1, 15000, 15000, '2026-02-25 06:32:20', '2026-02-25 06:32:20'),
(112, 87, 1, 'Beras Premium 5kg', 2, 75000, 150000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(113, 87, 2, 'Beras Medium 5kg', 56, 60000, 3360000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(114, 87, 3, 'Beras Merah 1kg', 18, 25000, 450000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(115, 87, 4, 'Minyak Goreng Bimoli 2L', 46, 35000, 1610000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(116, 87, 5, 'Minyak Goreng Tropical 1L', 98, 18000, 1764000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(117, 87, 6, 'Minyak Goreng Curah 1L', 117, 14000, 1638000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(118, 87, 7, 'Gula Pasir 1kg', 98, 15000, 1470000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(119, 87, 9, 'Garam Dapur Cap Kapal 250g', 146, 5000, 730000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(120, 87, 10, 'Tepung Terigu Segitiga Biru 1kg', 75, 12000, 900000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(121, 87, 11, 'Tepung Beras Rose Brand 500g', 37, 8000, 296000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(122, 87, 12, 'Tepung Tapioka 500g', 63, 7000, 441000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(123, 87, 13, 'Indomie Goreng (5 pcs)', 198, 15000, 2970000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(124, 87, 14, 'Indomie Kuah Soto (5 pcs)', 150, 15000, 2250000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(125, 87, 15, 'Sarimi Isi 2 (5 pcs)', 100, 13000, 1300000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(126, 87, 27, 'Deterjen Rinso Anti Noda 800g', 50, 20000, 1000000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(127, 87, 28, 'Sabun Cuci Piring Sunlight 800ml', 70, 16000, 1120000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(128, 87, 29, 'Sabun Mandi Lifebuoy 100g (4 pcs)', 60, 18000, 1080000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(129, 87, 25, 'Sarden ABC 425g', 40, 20000, 800000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(130, 87, 26, 'Kornet Pronas 200g', 35, 28000, 980000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(131, 87, 22, 'Kecap Manis ABC 600ml', 59, 22000, 1298000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(132, 87, 23, 'Saos Sambal ABC 335ml', 79, 14000, 1106000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(133, 87, 24, 'Royco Kaldu Ayam 230g', 90, 13000, 1170000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(134, 87, 21, 'Kopi ABC Susu isi 10 sachet', 80, 18000, 1440000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(135, 87, 19, 'Kopi Kapal Api Special 165g', 70, 15000, 1050000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(136, 87, 20, 'Teh Celup Sariwangi isi 25', 100, 8000, 800000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(137, 87, 16, 'Susu Kental Manis Frisian Flag 370g', 90, 12000, 1080000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(138, 87, 17, 'Susu UHT Indomilk 1L', 50, 18000, 900000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(139, 87, 18, 'Susu Bubuk Dancow 400g', 30, 45000, 1350000, '2026-02-25 08:08:44', '2026-02-25 08:08:44'),
(140, 88, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-25 08:14:38', '2026-02-25 08:14:38'),
(141, 89, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-25 08:49:32', '2026-02-25 08:49:32'),
(142, 90, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-25 09:26:46', '2026-02-25 09:26:46'),
(143, 91, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-25 11:17:01', '2026-02-25 11:17:01'),
(144, 92, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-25 13:53:44', '2026-02-25 13:53:44'),
(145, 93, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-25 15:38:23', '2026-02-25 15:38:23'),
(146, 94, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-25 17:49:01', '2026-02-25 17:49:01'),
(147, 95, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-25 17:50:54', '2026-02-25 17:50:54'),
(148, 96, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-25 17:53:43', '2026-02-25 17:53:43'),
(149, 97, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-25 19:11:23', '2026-02-25 19:11:23'),
(150, 98, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-26 01:42:58', '2026-02-26 01:42:58'),
(151, 99, 8, 'Gula Merah 500g', 4, 12000, 48000, '2026-02-26 10:31:03', '2026-02-26 10:31:03'),
(152, 100, 8, 'Gula Merah 500g', 2, 12000, 24000, '2026-02-26 17:01:32', '2026-02-26 17:01:32'),
(153, 101, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-26 21:20:21', '2026-02-26 21:20:21'),
(154, 102, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-27 06:43:46', '2026-02-27 06:43:46'),
(155, 103, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-28 01:51:14', '2026-02-28 01:51:14'),
(156, 104, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-02-28 04:16:57', '2026-02-28 04:16:57'),
(157, 105, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-01 03:42:15', '2026-03-01 03:42:15'),
(158, 106, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-03 10:09:54', '2026-03-03 10:09:54'),
(159, 107, 8, 'Gula Merah 500g', 2, 12000, 24000, '2026-03-03 10:12:17', '2026-03-03 10:12:17'),
(160, 108, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-04 03:17:45', '2026-03-04 03:17:45'),
(161, 109, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-04 04:12:20', '2026-03-04 04:12:20'),
(162, 110, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-04 11:10:02', '2026-03-04 11:10:02'),
(163, 111, 8, 'Gula Merah 500g', 6, 12000, 72000, '2026-03-05 22:53:44', '2026-03-05 22:53:44'),
(164, 112, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-06 18:44:49', '2026-03-06 18:44:49'),
(165, 113, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-07 00:15:29', '2026-03-07 00:15:29'),
(166, 114, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-07 00:20:16', '2026-03-07 00:20:16'),
(167, 115, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-07 01:23:49', '2026-03-07 01:23:49'),
(168, 116, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-07 09:49:20', '2026-03-07 09:49:20'),
(169, 117, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-03-07 10:22:45', '2026-03-07 10:22:45'),
(170, 118, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-04-09 20:34:16', '2026-04-09 20:34:16'),
(171, 119, 6, 'Minyak Goreng Curah 1L', 1, 14000, 14000, '2026-04-10 02:08:06', '2026-04-10 02:08:06'),
(172, 120, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-04-10 12:10:42', '2026-04-10 12:10:42'),
(173, 121, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-04-11 03:33:13', '2026-04-11 03:33:13'),
(174, 122, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-04-12 09:44:59', '2026-04-12 09:44:59'),
(175, 123, 6, 'Minyak Goreng Curah 1L', 1, 14000, 14000, '2026-04-14 03:26:47', '2026-04-14 03:26:47'),
(176, 124, 12, 'Tepung Tapioka 500g', 1, 7000, 7000, '2026-04-19 10:05:57', '2026-04-19 10:05:57'),
(177, 125, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-04-22 07:18:10', '2026-04-22 07:18:10'),
(178, 125, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-04-22 07:18:10', '2026-04-22 07:18:10'),
(179, 126, 1, 'Beras Premium 5kg', 2, 75000, 150000, '2026-04-23 03:47:43', '2026-04-23 03:47:43'),
(180, 127, 8, 'Gula Merah 500g', 1, 12000, 12000, '2026-04-23 12:13:45', '2026-04-23 12:13:45'),
(181, 128, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-04-23 20:28:48', '2026-04-23 20:28:48'),
(182, 128, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-04-23 20:28:48', '2026-04-23 20:28:48'),
(183, 129, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-04-23 20:30:34', '2026-04-23 20:30:34'),
(184, 129, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-04-23 20:30:34', '2026-04-23 20:30:34'),
(185, 130, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-04-27 15:14:18', '2026-04-27 15:14:18'),
(186, 131, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-05-04 05:13:48', '2026-05-04 05:13:48'),
(187, 132, 2, 'Beras Medium 5kg', 2, 60000, 120000, '2026-05-07 08:17:42', '2026-05-07 08:17:42'),
(188, 133, 2, 'Beras Medium 5kg', 3, 60000, 180000, '2026-05-08 04:33:55', '2026-05-08 04:33:55'),
(189, 134, 14, 'Indomie Kuah Soto (5 pcs)', 1, 15000, 15000, '2026-05-11 19:09:29', '2026-05-11 19:09:29'),
(190, 135, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-05-17 01:44:56', '2026-05-17 01:44:56'),
(191, 136, 9, 'Garam Dapur Cap Kapal 250g', 1, 5000, 5000, '2026-05-18 08:56:55', '2026-05-18 08:56:55'),
(192, 136, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-05-18 08:56:55', '2026-05-18 08:56:55'),
(193, 137, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-05-26 18:07:40', '2026-05-26 18:07:40'),
(194, 138, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-05-27 22:56:37', '2026-05-27 22:56:37'),
(195, 139, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-05-31 23:56:38', '2026-05-31 23:56:38'),
(196, 140, 2, 'Beras Medium 5kg', 1, 60000, 60000, '2026-06-01 19:45:35', '2026-06-01 19:45:35'),
(197, 141, 3, 'Beras Merah 1kg', 1, 25000, 25000, '2026-06-01 19:50:02', '2026-06-01 19:50:02'),
(198, 142, 11, 'Tepung Beras Rose Brand 500g', 1, 8000, 8000, '2026-06-04 07:36:22', '2026-06-04 07:36:22'),
(199, 143, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-06-08 09:36:45', '2026-06-08 09:36:45'),
(200, 143, 19, 'Kopi Kapal Api Special 165g', 1, 15000, 15000, '2026-06-08 09:36:45', '2026-06-08 09:36:45'),
(201, 144, 1, 'Beras Premium 5kg', 1, 75000, 75000, '2026-06-10 20:01:54', '2026-06-10 20:01:54'),
(202, 145, 10, 'Tepung Terigu Segitiga Biru 1kg', 1, 12000, 12000, '2026-06-12 04:32:56', '2026-06-12 04:32:56'),
(203, 145, 11, 'Tepung Beras Rose Brand 500g', 1, 8000, 8000, '2026-06-12 04:32:56', '2026-06-12 04:32:56');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `slug`, `description`, `price`, `stock`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Beras Premium 5kg', 'beras-premium-5kg', 'Beras premium kualitas terbaik, pulen dan wangi. Cocok untuk konsumsi sehari-hari keluarga.', 75000, 87, 'products/XSeii3L1oCo4cB3GNIi2cG9ayp9AcdE3dYa2qZjg.jpg', 1, '2026-02-21 01:13:07', '2026-06-10 20:01:54'),
(2, 1, 'Beras Medium 5kg', 'beras-medium-5kg', 'Beras medium dengan kualitas baik dan harga terjangkau untuk kebutuhan sehari-hari.', 60000, 86, 'products/DltD5dyREZfvobKI4KcU2KPusuQon7GtiiKIKh2l.jpg', 1, '2026-02-21 01:13:07', '2026-06-01 19:45:35'),
(3, 1, 'Beras Merah 1kg', 'beras-merah-1kg', 'Beras merah organik kaya serat dan nutrisi, baik untuk kesehatan.', 25000, 99, 'products/xS2jIKk75zwhqdEZZ9DlijUDEU4lxD5SsFHLAY9j.jpg', 1, '2026-02-21 01:13:07', '2026-06-01 19:50:02'),
(4, 2, 'Minyak Goreng Bimoli 2L', 'minyak-goreng-bimoli-2l', 'Minyak goreng berkualitas dari kelapa sawit pilihan, jernih dan tidak mudah berbusa.', 35000, 100, 'products/KuWaAfIxy9n79O4xJoHOM55gcRObTydKVBCWlGVe.png', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(5, 2, 'Minyak Goreng Tropical 1L', 'minyak-goreng-tropical-1l', 'Minyak goreng kemasan 1 liter, praktis untuk kebutuhan memasak sehari-hari.', 18000, 100, 'products/paHpfI9O3Fy87KSxCZPNUAB6I8qRuuyCfNq5EIrP.png', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(6, 2, 'Minyak Goreng Curah 1L', 'minyak-goreng-curah-1l', 'Minyak goreng curah ekonomis untuk kebutuhan rumah tangga.', 14000, 98, 'products/q6K7FEqPXyQkNKTNVNmfzK77PjO0DRu8zdMeml62.jpg', 1, '2026-02-21 01:13:07', '2026-04-14 03:26:47'),
(7, 3, 'Gula Pasir 1kg', 'gula-pasir-1kg', 'Gula pasir putih bersih berkualitas tinggi untuk kebutuhan memasak dan minuman.', 15000, 100, 'products/QVNF4opFqh9eRFvBjB7OpWPUNaQtfo0eXOmcJbt3.png', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(8, 3, 'Gula Merah 500g', 'gula-merah-500g', 'Gula merah asli dari tebu, cocok untuk bumbu masakan dan minuman tradisional.', 12000, 99, 'products/UWhTo5AbTqE7QwPkuxLTSltBgYl0xdi1hZlYWyLd.jpg', 1, '2026-02-21 01:13:07', '2026-04-23 12:13:45'),
(9, 3, 'Garam Dapur Cap Kapal 250g', 'garam-dapur-cap-kapal-250g', 'Garam beryodium berkualitas untuk kebutuhan dapur sehari-hari.', 5000, 99, 'products/gCF7ybyV2XMOHs1XRnVmLcmf8Mi8sQCcxWaXd5VA.jpg', 1, '2026-02-21 01:13:07', '2026-05-18 08:56:55'),
(10, 4, 'Tepung Terigu Segitiga Biru 1kg', 'tepung-terigu-segitiga-biru-1kg', 'Tepung terigu serbaguna cocok untuk membuat aneka kue dan gorengan.', 12000, 99, 'products/0gWxKdDxoCwjc0uzDNx90tglZkiLbqakMjhiB7Cg.jpg', 1, '2026-02-21 01:13:07', '2026-06-12 04:32:56'),
(11, 4, 'Tepung Beras Rose Brand 500g', 'tepung-beras-rose-brand-500g', 'Tepung beras premium untuk membuat kue tradisional dan jajanan pasar.', 8000, 98, 'products/2DgbWgBeQQmVv91107vRo9MCjPDfaFlkjinSG7ae.webp', 1, '2026-02-21 01:13:07', '2026-06-12 04:32:56'),
(12, 4, 'Tepung Tapioka 500g', 'tepung-tapioka-500g', 'Tepung tapioka berkualitas untuk membuat bakso, cireng, dan aneka makanan.', 7000, 99, 'products/XJdpCysahviizHUYKsKILMot3avsTmxO4LlhApjr.jpg', 1, '2026-02-21 01:13:07', '2026-04-19 10:05:57'),
(13, 5, 'Indomie Goreng (5 pcs)', 'indomie-goreng-5-pcs', 'Mie goreng instan favorit Indonesia, paket isi 5 bungkus.', 15000, 100, 'products/F11vg2jVXPJDfxVpzKUFwK5XcKFRwW7TUAwOzAvj.jpg', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(14, 5, 'Indomie Kuah Soto (5 pcs)', 'indomie-kuah-soto-5-pcs', 'Mie kuah rasa soto yang gurih dan lezat, paket isi 5 bungkus.', 15000, 99, 'products/xYWQXuJsYj90P91v5BTXlwugU4tUtD4GJqVuX6uU.jpg', 1, '2026-02-21 01:13:07', '2026-05-11 19:09:29'),
(15, 5, 'Sarimi Isi 2 (5 pcs)', 'sarimi-isi-2-5-pcs', 'Mie instan isi 2 dengan rasa gurih, paket hemat 5 bungkus.', 13000, 100, 'products/UHJc77VnOHzt6SxrbxczVqwnEwZlnSaDUxqBQzxC.jpg', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(16, 6, 'Susu Kental Manis Frisian Flag 370g', 'susu-kental-manis-frisian-flag-370g', 'Susu kental manis berkualitas untuk minuman dan olesan roti.', 12000, 100, 'products/eOlaB3Yzw94Yig8CyRjZV0HESDC0fBlXRPzCtaL9.jpg', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(17, 6, 'Susu UHT Indomilk 1L', 'susu-uht-indomilk-1l', 'Susu UHT full cream segar dan bergizi, kemasan 1 liter.', 18000, 100, 'products/iZcGtN3u7xpPrUImCpvjWgzrqGSX6tkRTH5Zyo81.jpg', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(18, 6, 'Susu Bubuk Dancow 400g', 'susu-bubuk-dancow-400g', 'Susu bubuk bergizi untuk seluruh keluarga, kemasan 400 gram.', 45000, 100, 'products/nZtziZZC4QibTqzrsv8Pw3XtdevLER6EZyeqQ1Mt.jpg', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(19, 7, 'Kopi Kapal Api Special 165g', 'kopi-kapal-api-special-165g', 'Kopi bubuk asli pilihan dengan aroma dan rasa khas yang nikmat.', 15000, 99, 'products/dk1pqiSqRktZkeb3KohhM1KOumV61xuxBMfdKtaI.png', 1, '2026-02-21 01:13:07', '2026-06-08 09:36:45'),
(20, 7, 'Teh Celup Sariwangi isi 25', 'teh-celup-sariwangi-isi-25', 'Teh celup berkualitas dengan cita rasa teh asli, isi 25 kantong.', 8000, 100, 'products/WInpkvTrZkQBLLOUpmABdkBs1AOLhvwGaTTmRQ1d.png', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(21, 7, 'Kopi ABC Susu isi 10 sachet', 'kopi-abc-susu-isi-10-sachet', 'Kopi instan 3in1 rasa susu yang creamy dan praktis, isi 10 sachet.', 18000, 100, 'products/H8vd8Rx4ntdO5mchXXMPCPBgTFqCXJ8bLkV2z7IL.png', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(22, 8, 'Kecap Manis ABC 600ml', 'kecap-manis-abc-600ml', 'Kecap manis berkualitas tinggi untuk masakan Indonesia yang lezat.', 22000, 100, 'products/6mhIsdQRsnhVCh1TfbUJbhl0GUWSLren5NMx63z8.jpg', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(23, 8, 'Saos Sambal ABC 335ml', 'saos-sambal-abc-335ml', 'Saos sambal pedas dengan cita rasa tomat asli yang nikmat.', 14000, 100, 'products/oJS77rQvLKSaKBx5M7nPdMTY9Ovy5EeLi6IW8rbl.png', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(24, 8, 'Royco Kaldu Ayam 230g', 'royco-kaldu-ayam-230g', 'Penyedap rasa kaldu ayam untuk menambah cita rasa masakan.', 13000, 100, 'products/if4RDMduPrrJREmosl0SfZFsM94de73X8XKLIpf7.jpg', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(25, 9, 'Sarden ABC 425g', 'sarden-abc-425g', 'Sarden dalam saus tomat yang lezat dan praktis untuk lauk keluarga.', 20000, 100, 'products/U6jaxHZB1kIv1KEct1AEibqeRsfzJRRqTd1MXvUA.png', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(26, 9, 'Kornet Pronas 200g', 'kornet-pronas-200g', 'Kornet sapi berkualitas dalam kemasan kaleng, siap saji dan praktis.', 28000, 100, 'products/8RRSa9t2QBiPyuljFOvxRf2W5WJYktRofW3B2v33.png', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(27, 10, 'Deterjen Rinso Anti Noda 800g', 'deterjen-rinso-anti-noda-800g', 'Deterjen bubuk dengan formula anti noda untuk cucian yang bersih dan wangi.', 20000, 100, 'products/QWd1etELdUOwzuMrbFiXRMsbG3Km2s9vzNRrBQxd.jpg', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(28, 10, 'Sabun Cuci Piring Sunlight 800ml', 'sabun-cuci-piring-sunlight-800ml', 'Sabun cuci piring yang efektif membersihkan lemak dan minyak membandel.', 16000, 100, 'products/MOS62dpalTdzAdcBzAebPmTETyTHV6iT1K6Lo0Di.jpg', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44'),
(29, 10, 'Sabun Mandi Lifebuoy 100g (4 pcs)', 'sabun-mandi-lifebuoy-100g-4-pcs', 'Sabun mandi antibakteri untuk perlindungan keluarga, paket isi 4.', 18000, 100, 'products/QrhntaTtJJ9yhs2O57mRCPIRfLokChONcEgzvBvE.jpg', 1, '2026-02-21 01:13:07', '2026-02-25 08:08:44');

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
('07JMPwJ9kZGwbDWaty31wKCM7dB9cMHWVqoshiFU', NULL, '2a14:7c1:40d1::1', 'Mozilla/5.0 (compatible; CT-WP-Scanner/1.0; +https://example.com/bot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEJQNlZCZHhobEFYV0s5U3ZIMkxremx0eE02S3pXUThSVXlERTdZUCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277353),
('1wFHQHnHllB4nxpOGbLOEpBqO1059QXpeEp3iMfI', NULL, '54.159.85.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.7632.6 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnQzWDN2Vm5qRHZ2dXplaTM1Tkw0N0wxUkxTMzJZU2xCeTh2b0x5USI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277461),
('21nXosnhCEIgtwiHaXxIuHH5CKJ0wCfuqJaya0JW', NULL, '2400:6180:100:d0::89e:2001', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmNuM1RXS0E4QXBFWkI0T2w1aWJrMnpVRFJIWTJHZGJlaGhXS1J4ZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277503),
('2p5IVunHo6tuoDvB4gw3NQy1aWbCDE2zM8uBow6u', NULL, '103.4.251.2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGhPZTVjdXVlSk85em5TOVVobzVGemNtTEl2clZPWG11c1k2QndodiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781278995),
('58O1z7Nf7D94T3zOl9fq9uQCPu98hH3M2xjZAsZ8', NULL, '80.94.92.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1d4VmozMWd4dlk5eE84cjh4Q0JxVGh3bXNhQzdidUdwQkdieXhmaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277351),
('6c48T9WABbAZO6AHDJeAYy666uMNyu8MB1uCY0Tk', NULL, '2402:8780:1061:18f7:5834:c5a5:7e19:e876', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkVDbklZUHVuaHdHUW5sTkYxZ1RhNUhIMXBJNnlPaXcxcjlPdGlRYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277526),
('7JFDJpzoQDeTBtKzzAUBm2esg6MAPlfZWThGYlWG', NULL, '2400:6180:0:d0::13e9:e001', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGxYYWdRRFd6SHNWbjdhV3NLR3JXbERjNDYyMVRFRkpTWFlyT1RTYyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277503),
('7qoIs6hLYWTIwr5RDPbGl2wypmvW9hUc3Mg2Vn3x', NULL, '164.92.107.174', 'Mozilla/5.0 (l9scan/2.0.7363e293e2537313e2330323; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnVVZ3FpVnBHdzlOWjcwWEV0OWgyRXhDOUsyWm1qa3R3cWRMN09seiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjI6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20vP3Jlc3Rfcm91dGU9JTJGd3AlMkZ2MiUyRnVzZXJzJTJGIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781277541),
('AS5bifbg8czDtzFHEt4nvIo20hccDdJ032mqH8Wp', NULL, '164.92.107.174', 'Mozilla/5.0 (l9scan/2.0.7363e293e2537313e2330323; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2ZVOU1aVWwwZE9HOG4zdHplalZheFpWSnBaNXM1c2R0UHByMGYyMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277514),
('BLFKuCx4Pmz9AI7vfSDDfgCuyrrN0V1GOAKVU8Lv', NULL, '104.164.173.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUs0UUZrZEM1bExxRkpPbExiVnZNNDk4cmtNM2ptZVFZaWhXNUdmZCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781278998),
('cWVkHFVGIm7XuocghDAuSSziAN0f6zcHubi8Tthu', NULL, '107.172.195.3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNW1rYzM0NlE3em50TGczd01zc3pZclpzTENXM3k3RWJxaVJvM0tqSSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277471),
('DNR8PrCjDpVQTI4vL8xMDCAPmyiSzl0fxhj7VzPo', NULL, '185.209.196.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:106.0) Gecko/20100101 Firefox/106.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzZEajU4YWZJSmxLZFNRdDFRVzhuTmxRd044dkJoWEVaQnNhTmMzQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781277767),
('EDIE0hC4evdtkuB0w4zbNB8vfQPm7a4hgMos7Jk7', NULL, '103.196.9.92', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjBFUUlOcHFOSW9teURDUWxWUHhRZ2p3NTA0a0tlM0hla3RRZGdkdyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781278994),
('eH6B0lwsBux00dEd3Kyzu21HuWUTFNbESrh9PEDF', NULL, '149.28.93.107', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEZDem9xVkIzeTNhcjhJQTl5cXJ0Y2RWQkw0ZE5hTjRXUEJLQUNVdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781278497),
('fAPdHXAlBgTH8ESvhtYDdHY0wGyr3eAJvsOnkAWU', NULL, '103.196.9.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0I0UXExenVnT3RQOEhhSGZwMlFNNVRDWHdkTlVVbFNBS3l2eEhaSCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTI6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20vcHJvZHVjdHMvZ3VsYS1wYXNpci0xa2ciO3M6NToicm91dGUiO3M6MTM6InByb2R1Y3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781279025),
('FcXLaP1YJB8Ah1dufOrOk73ghEu8LZocAl7G4WbD', NULL, '2400:6180:100:d0::97f:b001', 'Mozilla/5.0 (l9scan/2.0.93833343a326a3a323a303038373a3136646a313030323; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFZzbTRjOW1DUDVXMXcxem85YW1NWmN2UjNsU0ZNdDBaRWNTdGFFaiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277504),
('G633MFkkDjnHURXWAPCNPTd7qfnpdmp1eChQ9kb7', NULL, '34.239.116.82', 'Mozilla/5.0 (Linux; Android 16; SM-S921U) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.7632.6 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUd0U3lzUXVtSVhjY3JKYXBmcnFoQmUzS3VkM29BZnJLUDcwYXF6WCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277461),
('GfPHnQTXmTN7D8a4K4NiLxx5mmxAWNIW7IOjaSTx', NULL, '128.199.182.152', 'Mozilla/5.0 (l9scan/2.0.7363e293e2537313e2330323; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHMwRU9qVE1tWU5FMDZ5RnlmQXJyWU51cGUxdWEwUVlOU0lsdUhtQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjY6Imh0dHBzOi8vd3d3LnNvZWthbWl0cmFncm9zaXIuY29tLz9yZXN0X3JvdXRlPSUyRndwJTJGdjIlMkZ1c2VycyUyRiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781277533),
('GOiU0uNTz2FDtiqtmJJhJsNz8vryCIRC6assQjHW', NULL, '185.209.196.239', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.2 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0hHWkR2M1h4blNWRFBSVWFXb2ZRRnVidHBHeTlCNnZWajRzc1ZaVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3LnNvZWthbWl0cmFncm9zaXIuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781277843),
('Gs1l9lfa3sVin8KN3LePkhDK8mPdL5ukZ6BZoQvO', NULL, '103.4.251.11', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWNLU204djFxSjFSRG53a0dqbHlBSXNRNVNjWDhnQXdodVBqbkNPTyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDk6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbS9wcm9kdWN0cz9wYWdlPTIiO3M6NToicm91dGUiO3M6MTQ6InByb2R1Y3RzLmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781279016),
('gx9gVrEvWlY0JLXCTdg5o2vD1XW9abJgkt5qzEDn', NULL, '164.92.107.174', 'Mozilla/5.0 (l9scan/2.0.7363e293e2537313e2330323; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVpHYUNHWjh4MFpQazExalJXcElVSWpYQjJnaDNReUVPaU1zU2xTTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277505),
('IEgMzhZ1myhnBRhFhBc74rcEibUsVOB7COa8wDGW', NULL, '103.4.251.27', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjFGV3pUOGxlNVJkWURRZXBTeDFjT29LbDJDMTE0eXZwMG9JR1piNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277470),
('IvcStJStAn28dpTpjDbN9CjkRj8lMD8OdLljsBjk', NULL, '141.98.253.90', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWndqQTQ2VmZBa0JPdnpJT1hjUjFKQlJSeGhqSzRJVFNqSkNwcUlJMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277490),
('jCsHrFvBGba4TC7uyXzwQjRC9VlaRkmZRhWQikQf', NULL, '185.209.196.239', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:70.0) Gecko/20100101 Firefox/70.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHQyU0dLdzJsdWhTVE9IQlNSanpvdHNLM0ZUQkloN2xQUnNUZGNFMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277793),
('JRg52Y5iBwUoaR9jZKt2oGSF9E6eNu8xZxdPikiX', NULL, '2400:6180:100:d0::97f:b001', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1VlYU45a0hzWTdwSE5Yc0wzZmVjVGhwSjVWOXk3R09HSG1la1l3bCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277504),
('k3znQL4zSwrVJ6TtFnEjisW0GjgEWegNxgbUwXoW', NULL, '128.199.182.152', 'Mozilla/5.0 (l9scan/2.0.7363e293e2537313e2330323; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2gxUGgwcFVTYWVUZ1pJS2FBZ2d3d2IxQnV4SjhXSElnMEJoMEoyaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3LnNvZWthbWl0cmFncm9zaXIuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781277503),
('kGUyDB19jZKuT1rNzojyBcLnN0dmELWyY24WYtH8', NULL, '51.81.245.138', 'greedyhand/0.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjlMTm9wUnE3N1ZvUTk2TkN5OTM1d3Y3MTVLbGswbVNOR082SmJ5UCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781277465),
('MjfwmGrZnxfzU5ablTuCBhiqcCGFysJftQwupAQS', NULL, '65.21.124.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFNFSjllQ0JRMXhpVk9BV25NSlh6NmRBU21Xb1hFR2g1dEZZUk1rMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTA6Imh0dHBzOi8vd3d3LnNvZWthbWl0cmFncm9zaXIuY29tL2tldGVudHVhbi1wcml2YXNpIjtzOjU6InJvdXRlIjtzOjEzOiJ0ZXJtcy1wcml2YWN5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781277613),
('mpwxd3pl5LvEPxEREeCPjcljZwsAeOzA7scvX4ke', NULL, '103.158.102.6', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36 Edg/149.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHFHbVZJMjF0aENvWHZlVmVsQnM2TVpoTVNkWWJCMHRmazYzN0VQeSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277390),
('n4GcLozO7OhptFI7hywRmt1e0kjRQVVeWYczaPYS', NULL, '107.172.195.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlNCc2VqNWRrVGVqcHVvcE1ydkp5alFUbko2eWdsWWp4ck5vUjIxMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277485),
('nHRGbbSJK0ZvKKM9bnfq7UqYbIxm7QnEwKcmEe1R', NULL, '149.28.93.107', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakZWc0wyTzhNYzhTT0hXWVFqT0FHSGRUeGZISXhTUnpUdFA5MGJjeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3LnNvZWthbWl0cmFncm9zaXIuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781278499),
('p5f54ZkZo6qYhJSmtlJXuXfL1mQ9XnjiNOq65J4v', NULL, '154.28.229.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2x3OVV0VG51b0hIbndud3ZhVXBiUExORjJaVVRrR01DbGVoYnE2VCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781277473),
('pNzNjASEsxQfvgnWRNZ9B5fykIDw8lIq8QwuBnCy', NULL, '2402:8780:1061:18f7:5834:c5a5:7e19:e876', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlpBc09yclNsZ2NZd0pycDF6eVpFNTJrMHZGRk9CcUN1MTBmQk0xTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277136),
('QcbPrKTQsPBEYahNzzmqXNvqMIuUgxTs0PwhaH5u', NULL, '149.28.93.107', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWlaaDlvZGVrcEhQbDhBaW82S3ZBUm1vdWtkdkJwUExnU2lvdVdhcyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781278496),
('RijckyQxdbby6kaqdnMuEGFlvvOyMuUvkGprl2xg', NULL, '2a14:7c1:40d1::1', 'Mozilla/5.0 (compatible; CT-WP-Scanner/1.0; +https://example.com/bot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVJKOUlnWXdIUWo3NXF5RVZXTndoWUV3VWJQTXBQTUlXTUdNcmNMeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3LnNvZWthbWl0cmFncm9zaXIuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781277353),
('RzDbJ2ggBDFqMe6gc58XKVK5a5KAUj6LMiF7MpSs', NULL, '65.21.124.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWZtc1dwUmxTVnpzVnlvNXNPRk9XcmFRYm43NWtkUVhVR1IySlBicCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20vcHJvZHVjdHMvc2FidW4tbWFuZGktbGlmZWJ1b3ktMTAwZy00LXBjcyI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277615),
('S0YfKh8g8ol0uney34DrxgwcmqzGoWumJOX3ceLK', NULL, '103.4.251.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzlwNlZaQTV2dm1WYzUzWnBxWnh5NXlyU1V5V203ZW1nc2o5dlNQeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781278995),
('s5Tc4dXA29acZi07mdV3cUus3XXyFxUcXdDsYWnL', NULL, '80.94.92.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXBlUXlaamhnV2RwRUFrVTRiV2IweEVXRDNZZzBNeUJHdHcyS1FseCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3LnNvZWthbWl0cmFncm9zaXIuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781277351),
('SLyebm18fCEx0zHZlUiljA6Xa5BVeJwO9HSS75Zi', NULL, '128.199.182.152', 'Mozilla/5.0 (l9scan/2.0.7363e293e2537313e2330323; +https://leakix.net)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmpNYVdmTkR3bk1nTnBxaGNPU3hEUzZIWXdBaGNXdldQUW5RVTVmNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzI6Imh0dHBzOi8vd3d3LnNvZWthbWl0cmFncm9zaXIuY29tIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781277510),
('srAsQ1S3A9qZYMHX9iZuJs0dH4wpRXBkJlmCxDCs', NULL, '2604:a880:400:d0::24f2:4001', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaElNWnFNUVVHQ1d6S05tM3dCTXloRDdIUkNJWDdSclRsUGQzMDRpWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277503),
('UegYBZR22uqgKEJexXLpCZc1VID6y60jEMhhsHHw', NULL, '2a14:7c1:40d1::1', 'Mozilla/5.0 (compatible; CT-WP-Scanner/1.0; +https://example.com/bot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0gzRkJKYVl6RkRKOHJiNTRrVTMwRkg5emFGQWN5Y3BxNVNtM0ZLaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781277353),
('VgrWndHIzlelI9bkH9oFBVY8WeOIaMirhW97Yrhj', NULL, '104.252.191.43', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRElWbHlEcUVzRjN4WnptUmxiZDZnRlcycEh0V3JQeEVuNW81OExSMyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781277473),
('W4XkCHq825AYq6drLTyzafkDKMGPH8LQFskxOcxg', NULL, '65.21.124.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2Vwa3RjYjU3NlJRMkl5TzM2QUNqVjcwQTZFMzh4YVVmR0VEOFd5dyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjQ6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbS9wcm9kdWN0cy9rZWNhcC1tYW5pcy1hYmMtNjAwbWwiO3M6NToicm91dGUiO3M6MTM6InByb2R1Y3RzLnNob3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1781277615),
('XPjmR2cHT9idmEnoywvrLV3cBIYbvZwTMZvbed90', NULL, '2402:8780:1061:18f7:5834:c5a5:7e19:e876', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2R1VXFRemN4OTdDQWxrQUVIdkpHemp4OEtibmF3bWtNaTFZYlB3aCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277517),
('XxSr85wsX83xRlTJo24ipnWAPxS1NjWQfAMGHrhm', NULL, '154.28.229.247', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkpEbHJoUWtHczZLWmVVVlptNHlSNEtLYU4wODd1Q2lRM0lRUlV4WiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHBzOi8vbWFpbC5zb2VrYW1pdHJhZ3Jvc2lyLmNvbSI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1781277487),
('yJVyBjbL4UBgZkjxd1ylFizszpuvXk9MZVOXELLv', NULL, '2604:a880:800:10::a7c:b001', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWswZEF1c2U0ZVFNYnFSUXRCVDhvemdZcmdpUVdsYmR5Z0JDMFNRdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHBzOi8vc29la2FtaXRyYWdyb3Npci5jb20iO3M6NToicm91dGUiO3M6NDoiaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781277504);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'string',
  `group` varchar(255) NOT NULL DEFAULT 'general',
  `label` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `type`, `group`, `label`, `created_at`, `updated_at`) VALUES
(1, 'payment_deadline_hours', '1', 'integer', 'payment', 'Batas Waktu Pembayaran (Jam)', '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(2, 'bank_name', 'BCA', 'string', 'payment', 'Nama Bank', '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(3, 'bank_account_number', '1234567890', 'string', 'payment', 'Nomor Rekening', '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(4, 'bank_account_name', 'Soeka Mitra Grosir', 'string', 'payment', 'Atas Nama Rekening', '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(5, 'store_name', 'Soeka Mitra Grosir', 'string', 'store', 'Nama Toko', '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(6, 'store_address', 'Vanya Park Cluster Azura Blok C19/36, Desa/Kelurahan Pagedangan,Kec. Pagedangan, Kab. Tangerang, Provinsi Banten,Kode Pos: 15336', 'string', 'store', 'Alamat Toko', '2026-02-21 01:13:07', '2026-04-26 05:41:00'),
(7, 'store_phone', '0895600060506', 'string', 'store', 'Nomor Telepon Toko', '2026-02-21 01:13:07', '2026-04-26 05:41:00'),
(8, 'store_description', 'Toko grosir sembako terpercaya dengan harga terjangkau', 'string', 'store', 'Deskripsi Toko', '2026-02-21 01:13:07', '2026-02-21 01:13:07');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_services`
--

CREATE TABLE `shipping_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `cost` int(10) UNSIGNED NOT NULL,
  `estimated_delivery` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_services`
--

INSERT INTO `shipping_services` (`id`, `name`, `description`, `cost`, `estimated_delivery`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Ambil di Toko', 'Ambil pesanan langsung di toko kami', 0, 'Langsung', 1, 1, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(2, 'Kurir Toko', 'Diantar oleh kurir toko ke alamat Anda', 10000, '1-2 hari', 1, 2, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(3, 'Gosend / Grab Instant', 'Pengiriman cepat via ojek online', 15000, 'Hari ini', 1, 3, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(4, 'Gosend / Grab Same Day', 'Pengiriman dalam hari yang sama', 20000, 'Hari ini', 1, 4, '2026-02-21 01:13:07', '2026-02-21 01:13:07');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `subtitle`, `image`, `link`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 'Selamat Datang di Soeka Mitra Grosir', 'Belanja sembako lengkap dengan harga grosir terjangkau', '', '/products', 1, 1, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(2, 'Promo Minggu Ini', 'Dapatkan diskon spesial untuk beras dan minyak goreng', '', '/products', 1, 2, '2026-02-21 01:13:07', '2026-02-21 01:13:07'),
(3, 'Gratis Ongkir', 'Gratis ongkos kirim untuk pembelian di atas Rp 200.000', '', '/products', 1, 3, '2026-02-21 01:13:07', '2026-02-21 01:13:07');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@soekamitra.com', 'admin', NULL, '$2y$12$KjGSdsexx444pf0xWgoLCei1VEPc59D9dOf36bNhtnYi.xSv28tlW', NULL, '2026-02-21 01:13:07', '2026-02-21 01:13:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

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
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_shipping_service_id_foreign` (`shipping_service_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `shipping_services`
--
ALTER TABLE `shipping_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipping_services`
--
ALTER TABLE `shipping_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_service_id_foreign` FOREIGN KEY (`shipping_service_id`) REFERENCES `shipping_services` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
