-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: soeka_mitra_grosir
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('soeka-mitra-grosir-cache-app_settings','a:8:{s:22:\"payment_deadline_hours\";s:1:\"1\";s:9:\"bank_name\";s:3:\"BCA\";s:19:\"bank_account_number\";s:10:\"1234567890\";s:17:\"bank_account_name\";s:18:\"Soeka Mitra Grosir\";s:10:\"store_name\";s:18:\"Soeka Mitra Grosir\";s:13:\"store_address\";s:27:\"Jl. Contoh No. 123, Jakarta\";s:11:\"store_phone\";s:11:\"08123456789\";s:17:\"store_description\";s:54:\"Toko grosir sembako terpercaya dengan harga terjangkau\";}',2087021898);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Beras & Gandum','beras-gandum',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(2,'Minyak Goreng','minyak-goreng',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(3,'Gula & Garam','gula-garam',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(4,'Tepung','tepung',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(5,'Mie & Pasta','mie-pasta',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(6,'Susu & Olahan','susu-olahan',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(7,'Kopi & Teh','kopi-teh',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(8,'Bumbu Dapur','bumbu-dapur',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(9,'Makanan Kaleng','makanan-kaleng',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(10,'Sabun & Deterjen','sabun-deterjen',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_02_21_000001_add_role_to_users_table',1),(5,'2026_02_21_000002_create_settings_table',1),(6,'2026_02_21_000003_create_categories_table',1),(7,'2026_02_21_000004_create_products_table',1),(8,'2026_02_21_000005_create_shipping_services_table',1),(9,'2026_02_21_000006_create_orders_table',1),(10,'2026_02_21_000007_create_order_items_table',1),(11,'2026_02_21_000008_create_sliders_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int unsigned NOT NULL,
  `price` int unsigned NOT NULL,
  `subtotal` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `shipping_service_id` bigint unsigned NOT NULL,
  `shipping_service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_cost` int unsigned NOT NULL,
  `subtotal` bigint unsigned NOT NULL,
  `total_price` bigint unsigned NOT NULL,
  `status` enum('pending_payment','payment_confirmed','processing','shipped','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending_payment',
  `payment_proof` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_deadline` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_shipping_service_id_foreign` (`shipping_service_id`),
  CONSTRAINT `orders_shipping_service_id_foreign` FOREIGN KEY (`shipping_service_id`) REFERENCES `shipping_services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` int unsigned NOT NULL,
  `stock` int unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Beras Premium 5kg','beras-premium-5kg','Beras premium kualitas terbaik, pulen dan wangi. Cocok untuk konsumsi sehari-hari keluarga.',75000,50,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(2,1,'Beras Medium 5kg','beras-medium-5kg','Beras medium dengan kualitas baik dan harga terjangkau untuk kebutuhan sehari-hari.',60000,80,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(3,1,'Beras Merah 1kg','beras-merah-1kg','Beras merah organik kaya serat dan nutrisi, baik untuk kesehatan.',25000,30,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(4,2,'Minyak Goreng Bimoli 2L','minyak-goreng-bimoli-2l','Minyak goreng berkualitas dari kelapa sawit pilihan, jernih dan tidak mudah berbusa.',35000,60,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(5,2,'Minyak Goreng Tropical 1L','minyak-goreng-tropical-1l','Minyak goreng kemasan 1 liter, praktis untuk kebutuhan memasak sehari-hari.',18000,100,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(6,2,'Minyak Goreng Curah 1L','minyak-goreng-curah-1l','Minyak goreng curah ekonomis untuk kebutuhan rumah tangga.',14000,120,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(7,3,'Gula Pasir 1kg','gula-pasir-1kg','Gula pasir putih bersih berkualitas tinggi untuk kebutuhan memasak dan minuman.',15000,100,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(8,3,'Gula Merah 500g','gula-merah-500g','Gula merah asli dari tebu, cocok untuk bumbu masakan dan minuman tradisional.',12000,40,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(9,3,'Garam Dapur Cap Kapal 250g','garam-dapur-cap-kapal-250g','Garam beryodium berkualitas untuk kebutuhan dapur sehari-hari.',5000,150,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(10,4,'Tepung Terigu Segitiga Biru 1kg','tepung-terigu-segitiga-biru-1kg','Tepung terigu serbaguna cocok untuk membuat aneka kue dan gorengan.',12000,80,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(11,4,'Tepung Beras Rose Brand 500g','tepung-beras-rose-brand-500g','Tepung beras premium untuk membuat kue tradisional dan jajanan pasar.',8000,60,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(12,4,'Tepung Tapioka 500g','tepung-tapioka-500g','Tepung tapioka berkualitas untuk membuat bakso, cireng, dan aneka makanan.',7000,70,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(13,5,'Indomie Goreng (5 pcs)','indomie-goreng-5-pcs','Mie goreng instan favorit Indonesia, paket isi 5 bungkus.',15000,200,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(14,5,'Indomie Kuah Soto (5 pcs)','indomie-kuah-soto-5-pcs','Mie kuah rasa soto yang gurih dan lezat, paket isi 5 bungkus.',15000,150,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(15,5,'Sarimi Isi 2 (5 pcs)','sarimi-isi-2-5-pcs','Mie instan isi 2 dengan rasa gurih, paket hemat 5 bungkus.',13000,100,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(16,6,'Susu Kental Manis Frisian Flag 370g','susu-kental-manis-frisian-flag-370g','Susu kental manis berkualitas untuk minuman dan olesan roti.',12000,90,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(17,6,'Susu UHT Indomilk 1L','susu-uht-indomilk-1l','Susu UHT full cream segar dan bergizi, kemasan 1 liter.',18000,50,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(18,6,'Susu Bubuk Dancow 400g','susu-bubuk-dancow-400g','Susu bubuk bergizi untuk seluruh keluarga, kemasan 400 gram.',45000,30,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(19,7,'Kopi Kapal Api Special 165g','kopi-kapal-api-special-165g','Kopi bubuk asli pilihan dengan aroma dan rasa khas yang nikmat.',15000,70,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(20,7,'Teh Celup Sariwangi isi 25','teh-celup-sariwangi-isi-25','Teh celup berkualitas dengan cita rasa teh asli, isi 25 kantong.',8000,100,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(21,7,'Kopi ABC Susu isi 10 sachet','kopi-abc-susu-isi-10-sachet','Kopi instan 3in1 rasa susu yang creamy dan praktis, isi 10 sachet.',18000,80,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(22,8,'Kecap Manis ABC 600ml','kecap-manis-abc-600ml','Kecap manis berkualitas tinggi untuk masakan Indonesia yang lezat.',22000,60,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(23,8,'Saos Sambal ABC 335ml','saos-sambal-abc-335ml','Saos sambal pedas dengan cita rasa tomat asli yang nikmat.',14000,80,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(24,8,'Royco Kaldu Ayam 230g','royco-kaldu-ayam-230g','Penyedap rasa kaldu ayam untuk menambah cita rasa masakan.',13000,90,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(25,9,'Sarden ABC 425g','sarden-abc-425g','Sarden dalam saus tomat yang lezat dan praktis untuk lauk keluarga.',20000,40,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(26,9,'Kornet Pronas 200g','kornet-pronas-200g','Kornet sapi berkualitas dalam kemasan kaleng, siap saji dan praktis.',28000,35,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(27,10,'Deterjen Rinso Anti Noda 800g','deterjen-rinso-anti-noda-800g','Deterjen bubuk dengan formula anti noda untuk cucian yang bersih dan wangi.',20000,50,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(28,10,'Sabun Cuci Piring Sunlight 800ml','sabun-cuci-piring-sunlight-800ml','Sabun cuci piring yang efektif membersihkan lemak dan minyak membandel.',16000,70,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(29,10,'Sabun Mandi Lifebuoy 100g (4 pcs)','sabun-mandi-lifebuoy-100g-4-pcs','Sabun mandi antibakteri untuk perlindungan keluarga, paket isi 4.',18000,60,NULL,1,'2026-02-21 01:13:07','2026-02-21 01:13:07');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('j1yzM0jAxLwb84crKFoua9OFVCNNX8ROcbLijIIp',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidkQ1aGhXYkZ1YUFFSnFManc2VlZ3cEJTQ2xkdVNkaEhTYzJ3WlRMeCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6OTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODA4MC8/aWQ9ZDE2YWY2YTctMGU1OC00M2FjLWJmY2QtMzQ1NTllMTIxODJiJnZzY29kZUJyb3dzZXJSZXFJZD0xNzcxNjYxODk4MTc2IjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1771661898),('kp8mJIkC683obZxP0rvZUVDxONc0xlUSSKWabbqU',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoic2pFd3NObWhpbmJlMWQwZlNsbkpiYTdaUENvcjB3M3d2QWJIR3BiUiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTAzOiJodHRwOi8vMTI3LjAuMC4xOjgwODAvcHJvZHVjdHM/aWQ9ZDE2YWY2YTctMGU1OC00M2FjLWJmY2QtMzQ1NTllMTIxODJiJnZzY29kZUJyb3dzZXJSZXFJZD0xNzcxNjYyMDUwMDM2IjtzOjU6InJvdXRlIjtzOjE0OiJwcm9kdWN0cy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1771662050),('slqATosbD9HULnNu68cCfpPV3IMqYyyChIEOszgS',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.108.0 Chrome/142.0.7444.235 Electron/39.2.7 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoia0doSWVzc1dNNWpON1U4b1VHdENPYmtza2l3TE00TTM2ZWNIak1tNCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MTA2OiJodHRwOi8vMTI3LjAuMC4xOjgwODAvYWRtaW4vbG9naW4/aWQ9ZDE2YWY2YTctMGU1OC00M2FjLWJmY2QtMzQ1NTllMTIxODJiJnZzY29kZUJyb3dzZXJSZXFJZD0xNzcxNjYyMDM1MzMwIjtzOjU6InJvdXRlIjtzOjExOiJhZG1pbi5sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1771662035);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'string',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'payment_deadline_hours','1','integer','payment','Batas Waktu Pembayaran (Jam)','2026-02-21 01:13:07','2026-02-21 01:13:07'),(2,'bank_name','BCA','string','payment','Nama Bank','2026-02-21 01:13:07','2026-02-21 01:13:07'),(3,'bank_account_number','1234567890','string','payment','Nomor Rekening','2026-02-21 01:13:07','2026-02-21 01:13:07'),(4,'bank_account_name','Soeka Mitra Grosir','string','payment','Atas Nama Rekening','2026-02-21 01:13:07','2026-02-21 01:13:07'),(5,'store_name','Soeka Mitra Grosir','string','store','Nama Toko','2026-02-21 01:13:07','2026-02-21 01:13:07'),(6,'store_address','Jl. Contoh No. 123, Jakarta','string','store','Alamat Toko','2026-02-21 01:13:07','2026-02-21 01:13:07'),(7,'store_phone','08123456789','string','store','Nomor Telepon Toko','2026-02-21 01:13:07','2026-02-21 01:13:07'),(8,'store_description','Toko grosir sembako terpercaya dengan harga terjangkau','string','store','Deskripsi Toko','2026-02-21 01:13:07','2026-02-21 01:13:07');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_services`
--

DROP TABLE IF EXISTS `shipping_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cost` int unsigned NOT NULL,
  `estimated_delivery` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_services`
--

LOCK TABLES `shipping_services` WRITE;
/*!40000 ALTER TABLE `shipping_services` DISABLE KEYS */;
INSERT INTO `shipping_services` VALUES (1,'Ambil di Toko','Ambil pesanan langsung di toko kami',0,'Langsung',1,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(2,'Kurir Toko','Diantar oleh kurir toko ke alamat Anda',10000,'1-2 hari',1,2,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(3,'Gosend / Grab Instant','Pengiriman cepat via ojek online',15000,'Hari ini',1,3,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(4,'Gosend / Grab Same Day','Pengiriman dalam hari yang sama',20000,'Hari ini',1,4,'2026-02-21 01:13:07','2026-02-21 01:13:07');
/*!40000 ALTER TABLE `shipping_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,'Selamat Datang di Soeka Mitra Grosir','Belanja sembako lengkap dengan harga grosir terjangkau','','/products',1,1,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(2,'Promo Minggu Ini','Dapatkan diskon spesial untuk beras dan minyak goreng','','/products',1,2,'2026-02-21 01:13:07','2026-02-21 01:13:07'),(3,'Gratis Ongkir','Gratis ongkos kirim untuk pembelian di atas Rp 200.000','','/products',1,3,'2026-02-21 01:13:07','2026-02-21 01:13:07');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator','admin@soekamitra.com','admin',NULL,'$2y$12$KjGSdsexx444pf0xWgoLCei1VEPc59D9dOf36bNhtnYi.xSv28tlW',NULL,'2026-02-21 01:13:07','2026-02-21 01:13:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'soeka_mitra_grosir'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-21 16:04:26
