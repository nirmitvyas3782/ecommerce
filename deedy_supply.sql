-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 22, 2025 at 05:59 AM
-- Server version: 8.0.42-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deedy_supply`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL DEFAULT '1',
  `price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `category_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `category_image`, `created_at`, `updated_at`) VALUES
(1, 'Furniture', NULL, 'upload/category_images/1747640052_682adef4353f2.jpg', '2025-05-01 04:35:57', '2025-05-19 02:04:12'),
(5, 'Chair', 1, 'upload/category_images/1747640102_682adf2671e9d.jpg', '2025-05-11 03:40:35', '2025-05-19 02:05:02'),
(6, 'Sofa', 1, 'upload/category_images/1747640116_682adf34358e0.jpg', '2025-05-11 03:40:44', '2025-05-19 02:05:16'),
(7, 'Table', 1, 'upload/category_images/1747640192_682adf803b7f7.jpg', '2025-05-11 03:40:52', '2025-05-19 02:06:32'),
(8, 'Dining Chair', 5, 'upload/category_images/1747646328_682af77823024.jpg', '2025-05-11 03:42:07', '2025-05-19 03:48:48'),
(9, 'Guest / Invitee', 5, 'upload/category_images/1747646569_682af869540bf.jpg', '2025-05-11 03:42:24', '2025-05-19 03:52:49'),
(10, 'Photobooth', 5, 'upload/category_images/1747646504_682af8282f7a9.jpg', '2025-05-11 03:42:34', '2025-05-19 03:51:44'),
(11, 'Wedding Chair', 5, 'upload/category_images/1747646631_682af8a724346.jpg', '2025-05-11 03:42:42', '2025-05-19 03:53:51'),
(12, 'Bar Chair', 5, 'upload/category_images/1747646717_682af8fdcd1fd.jpg', '2025-05-11 03:42:54', '2025-05-19 03:55:17'),
(13, 'Kids Chair', 5, '', '2025-05-11 03:43:08', '2025-05-11 03:43:08'),
(14, 'Others', 5, '', '2025-05-11 03:43:15', '2025-05-11 03:43:15'),
(16, 'Stage Sofa', 6, '', '2025-05-11 03:43:36', '2025-05-11 03:43:36'),
(17, 'Guest / Invitee', 6, '', '2025-05-11 03:43:48', '2025-05-11 03:43:48'),
(18, 'Photobooth', 6, '', '2025-05-11 03:43:56', '2025-05-11 03:43:56'),
(19, 'Corporate', 6, '', '2025-05-11 03:44:03', '2025-05-11 03:44:03'),
(20, 'Others', 6, '', '2025-05-11 03:44:10', '2025-05-11 03:44:10'),
(21, 'Fine Dine', 7, '', '2025-05-11 03:44:27', '2025-05-11 03:44:27'),
(22, 'Console', 7, '', '2025-05-11 03:44:41', '2025-05-11 03:44:41'),
(23, 'Centre', 7, '', '2025-05-11 03:44:53', '2025-05-11 03:44:53'),
(24, 'Coffee', 7, '', '2025-05-11 03:45:01', '2025-05-11 03:45:01'),
(25, 'Bar Table', 7, '', '2025-05-11 03:45:12', '2025-05-11 03:45:12'),
(26, 'Bar Counter', 7, '', '2025-05-11 03:45:21', '2025-05-11 03:45:21'),
(27, 'Others', 7, '', '2025-05-11 03:46:03', '2025-05-11 03:46:03'),
(28, 'Lights', NULL, 'upload/category_images/1747647746_682afd021b3e2.jpg', '2025-05-11 03:47:38', '2025-05-19 04:12:26'),
(29, 'Chandelier', 28, '', '2025-05-11 03:48:30', '2025-05-11 03:48:30'),
(30, 'Spot light', 29, '', '2025-05-11 03:48:45', '2025-05-11 03:48:45'),
(31, 'Wristbands', 29, '', '2025-05-11 03:48:54', '2025-05-11 03:48:54'),
(32, 'LED Screen', 29, '', '2025-05-11 03:49:06', '2025-05-11 03:49:06'),
(33, 'Popup', 29, '', '2025-05-11 03:49:19', '2025-05-11 03:49:19'),
(34, 'Standees', 29, '', '2025-05-11 03:49:29', '2025-05-11 03:49:29'),
(35, 'Others', 29, '', '2025-05-11 03:49:42', '2025-05-11 03:49:42'),
(36, 'Props', NULL, 'upload/category_images/1747647856_682afd7020f57.jpg', '2025-05-11 03:50:01', '2025-05-19 04:14:16'),
(37, 'Fine Dine Props', 36, '', '2025-05-11 03:50:17', '2025-05-11 03:50:17'),
(38, 'Hangings', 37, '', '2025-05-11 03:51:25', '2025-05-11 03:51:25'),
(39, 'Cutouts', 37, '', '2025-05-11 03:51:46', '2025-05-11 03:51:46'),
(40, 'Rugs & Curtain', 37, '', '2025-05-11 03:52:01', '2025-05-11 03:52:01'),
(41, 'Welcome Board', 37, '', '2025-05-11 03:52:20', '2025-05-11 03:52:20'),
(42, 'Others', 37, '', '2025-05-11 03:52:32', '2025-05-11 03:52:32'),
(43, 'Setup', NULL, 'upload/category_images/1747647905_682afda19612f.jpg', '2025-05-11 03:52:46', '2025-05-19 04:15:05'),
(44, 'Mehndi', 43, '', '2025-05-11 03:53:03', '2025-05-11 03:53:03'),
(45, 'Engagement', 44, '', '2025-05-11 03:53:14', '2025-05-11 03:53:14'),
(46, 'Birthday', 44, '', '2025-05-11 03:53:28', '2025-05-11 03:53:28'),
(47, 'Photo Booth', 44, '', '2025-05-11 03:53:40', '2025-05-11 03:53:40'),
(48, 'Eye wall', 44, '', '2025-05-11 03:53:54', '2025-05-11 03:53:54'),
(49, 'Others', 44, '', '2025-05-11 03:54:04', '2025-05-11 03:54:04'),
(50, 'Stage Effect', NULL, 'upload/category_images/1747647958_682afdd62386c.jpg', '2025-05-11 03:54:14', '2025-05-19 04:15:58'),
(51, 'Crackers', 50, '', '2025-05-11 03:54:27', '2025-05-11 03:54:27'),
(52, 'Smoke', 51, '', '2025-05-11 03:54:37', '2025-05-11 03:54:37'),
(53, 'Fog', 51, '', '2025-05-11 03:54:47', '2025-05-11 03:54:47'),
(54, 'Bubble', 51, '', '2025-05-11 03:54:57', '2025-05-11 03:54:57'),
(55, 'Wristbands', 51, '', '2025-05-11 03:55:06', '2025-05-11 03:55:06'),
(56, 'LED Screen', 51, '', '2025-05-11 03:55:15', '2025-05-11 03:55:15'),
(57, 'Spot light', 51, '', '2025-05-11 03:55:28', '2025-05-11 03:55:28'),
(58, 'Flower- Artificial', NULL, 'upload/category_images/1747648026_682afe1aed497.jpg', '2025-05-11 03:55:36', '2025-05-19 04:17:06'),
(59, 'Flower Wall', 58, '', '2025-05-11 03:55:47', '2025-05-11 03:55:47'),
(60, 'Table Bookey', 59, '', '2025-05-11 03:56:01', '2025-05-11 03:56:01'),
(61, 'Heater-Cooler', NULL, 'upload/category_images/1747648214_682afed62839e.jpeg', '2025-05-11 03:56:10', '2025-05-19 04:20:14'),
(110, 'Chair', 109, '', '2025-05-12 04:51:27', '2025-05-12 04:51:27'),
(111, 'Dining Chair', 110, '', '2025-05-12 04:51:27', '2025-05-12 04:51:27'),
(112, 'Wedding Chair', 110, '', '2025-05-12 04:51:27', '2025-05-12 04:51:27'),
(113, 'Bar Chair', 110, '', '2025-05-12 04:51:27', '2025-05-12 04:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` bigint UNSIGNED NOT NULL,
  `post_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_content` longtext COLLATE utf8mb4_unicode_ci,
  `post_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `post_title`, `post_name`, `post_content`, `post_type`, `post_status`, `parent_id`, `post_date`, `created_at`, `updated_at`) VALUES
(1, 'Banner Image - 1', 'banner-image-1', '<p>asdfsdfsdfsdfdfsdfdf</p><p>sdkfjsdklfjsdkfsdjkflsdklfj</p><p><br></p><p>sdfksdjfklsdjfkjsdklfjsdjflsdf</p>', 'banner', 'published', 0, '2025-05-11 03:38:37', '2025-05-11 03:38:37', '2025-05-12 01:18:06'),
(2, 'Banner Image - 2', 'banner-image-2', '<p>Banner', 'banner', 'published', 0, '2025-05-15 02:27:21', '2025-05-15 02:27:21', '2025-05-15 03:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `content_meta`
--

CREATE TABLE `content_meta` (
  `id` bigint UNSIGNED NOT NULL,
  `content_id` bigint UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_meta`
--

INSERT INTO `content_meta` (`id`, `content_id`, `meta_key`, `meta_value`, `created_at`, `updated_at`) VALUES
(1, 1, 'banner_image', 'upload/banners/1747464494_Untitled-2.jpeg', '2025-05-11 03:38:37', '2025-05-17 01:18:14'),
(2, 2, 'banner_image', 'upload/banners/1747299370_Black and Yellow Futuristic Photo Travel Website Banner.jpg', '2025-05-15 02:27:21', '2025-05-15 03:26:10');

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `id` int NOT NULL,
  `device_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `user_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `browser` varchar(255) DEFAULT NULL,
  `browser_version` varchar(255) DEFAULT NULL,
  `platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `platform_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `device`
--

INSERT INTO `device` (`id`, `device_type`, `device_name`, `user_id`, `user_type`, `created_at`, `updated_at`, `browser`, `browser_version`, `platform`, `platform_version`, `ip_address`) VALUES
(2, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:04:34', '2025-05-13 01:04:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(3, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:22:18', '2025-05-13 01:22:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(4, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:23:28', '2025-05-13 01:23:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(5, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:23:50', '2025-05-13 01:23:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(6, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:25:05', '2025-05-13 01:25:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(7, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:25:18', '2025-05-13 01:25:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(8, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:26:33', '2025-05-13 01:26:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(9, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:44:41', '2025-05-13 01:44:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(10, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:45:01', '2025-05-13 01:45:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(11, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:46:10', '2025-05-13 01:46:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(12, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:49:05', '2025-05-13 01:49:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(13, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:49:17', '2025-05-13 01:49:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(14, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:51:42', '2025-05-13 01:51:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(15, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:53:18', '2025-05-13 01:53:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(16, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:54:03', '2025-05-13 01:54:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(17, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:54:33', '2025-05-13 01:54:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(18, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:55:22', '2025-05-13 01:55:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(19, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:55:31', '2025-05-13 01:55:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(20, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:56:08', '2025-05-13 01:56:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(21, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:56:20', '2025-05-13 01:56:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(22, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:57:27', '2025-05-13 01:57:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(23, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:58:40', '2025-05-13 01:58:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(24, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 01:59:31', '2025-05-13 01:59:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(25, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:00:25', '2025-05-13 02:00:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(26, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:01:44', '2025-05-13 02:01:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(27, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:02:13', '2025-05-13 02:02:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(28, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:02:25', '2025-05-13 02:02:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(29, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:03:00', '2025-05-13 02:03:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(30, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:03:19', '2025-05-13 02:03:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(31, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:03:38', '2025-05-13 02:03:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(32, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:04:40', '2025-05-13 02:04:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(33, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:04:54', '2025-05-13 02:04:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(34, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:10:55', '2025-05-13 02:10:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(35, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:11:04', '2025-05-13 02:11:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(36, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 02:15:01', '2025-05-13 02:15:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(37, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:17:35', '2025-05-13 03:17:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(38, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:18:11', '2025-05-13 03:18:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(39, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:18:50', '2025-05-13 03:18:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(40, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:19:32', '2025-05-13 03:19:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(41, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:19:34', '2025-05-13 03:19:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(42, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:19:37', '2025-05-13 03:19:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(43, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:19:52', '2025-05-13 03:19:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(44, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:19:55', '2025-05-13 03:19:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(45, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:20:34', '2025-05-13 03:20:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(46, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:21:08', '2025-05-13 03:21:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(47, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:21:12', '2025-05-13 03:21:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(48, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:21:29', '2025-05-13 03:21:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(49, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:21:32', '2025-05-13 03:21:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(50, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:22:13', '2025-05-13 03:22:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(51, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:22:15', '2025-05-13 03:22:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(52, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:22:18', '2025-05-13 03:22:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(53, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:22:20', '2025-05-13 03:22:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(54, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:22:43', '2025-05-13 03:22:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(55, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:22:47', '2025-05-13 03:22:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(56, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:23:19', '2025-05-13 03:23:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(57, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:24:22', '2025-05-13 03:24:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(58, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:24:27', '2025-05-13 03:24:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(59, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:25:10', '2025-05-13 03:25:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(60, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:25:16', '2025-05-13 03:25:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(61, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:25:20', '2025-05-13 03:25:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(62, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:25:23', '2025-05-13 03:25:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(63, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:25:26', '2025-05-13 03:25:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(64, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:25:28', '2025-05-13 03:25:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(65, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:25:30', '2025-05-13 03:25:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(66, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:25:33', '2025-05-13 03:25:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(67, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:25:37', '2025-05-13 03:25:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(68, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:30:11', '2025-05-13 03:30:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(69, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:30:15', '2025-05-13 03:30:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(70, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:30:21', '2025-05-13 03:30:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(71, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:30:36', '2025-05-13 03:30:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(72, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:32:31', '2025-05-13 03:32:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(73, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:32:34', '2025-05-13 03:32:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(74, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:32:35', '2025-05-13 03:32:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(75, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:32:36', '2025-05-13 03:32:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(76, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:32:38', '2025-05-13 03:32:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(77, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:32:40', '2025-05-13 03:32:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(78, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:32:42', '2025-05-13 03:32:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(79, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:32:44', '2025-05-13 03:32:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(80, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:32:46', '2025-05-13 03:32:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(81, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:32:50', '2025-05-13 03:32:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(82, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:35:12', '2025-05-13 03:35:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(83, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:44:12', '2025-05-13 03:44:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(84, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:45:06', '2025-05-13 03:45:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(85, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:47:44', '2025-05-13 03:47:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(86, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:47:49', '2025-05-13 03:47:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(87, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:47:52', '2025-05-13 03:47:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(88, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:47:56', '2025-05-13 03:47:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(89, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:49:13', '2025-05-13 03:49:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(90, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:49:19', '2025-05-13 03:49:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(91, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:49:22', '2025-05-13 03:49:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(92, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:49:24', '2025-05-13 03:49:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(93, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:49:27', '2025-05-13 03:49:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(94, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:49:47', '2025-05-13 03:49:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(95, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:50:20', '2025-05-13 03:50:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(96, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:52:28', '2025-05-13 03:52:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(97, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:53:19', '2025-05-13 03:53:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(98, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:54:30', '2025-05-13 03:54:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(99, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:55:22', '2025-05-13 03:55:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(100, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:55:35', '2025-05-13 03:55:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(101, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 03:55:52', '2025-05-13 03:55:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(102, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:02:14', '2025-05-13 04:02:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(103, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:16:16', '2025-05-13 04:16:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(104, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:17:57', '2025-05-13 04:17:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(105, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:18:13', '2025-05-13 04:18:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(106, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:18:45', '2025-05-13 04:18:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(107, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:19:26', '2025-05-13 04:19:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(108, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:20:20', '2025-05-13 04:20:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(109, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:29:37', '2025-05-13 04:29:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(110, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:30:17', '2025-05-13 04:30:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(111, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:32:24', '2025-05-13 04:32:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(112, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:35:50', '2025-05-13 04:35:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(113, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:37:55', '2025-05-13 04:37:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(114, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:43:47', '2025-05-13 04:43:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(115, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:44:34', '2025-05-13 04:44:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(116, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:47:11', '2025-05-13 04:47:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(117, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:47:51', '2025-05-13 04:47:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(118, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:49:50', '2025-05-13 04:49:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(119, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:50:43', '2025-05-13 04:50:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(120, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:51:38', '2025-05-13 04:51:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(121, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:52:08', '2025-05-13 04:52:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(122, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:52:59', '2025-05-13 04:52:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(123, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:58:52', '2025-05-13 04:58:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(124, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 04:59:03', '2025-05-13 04:59:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(125, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:17:36', '2025-05-13 05:17:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(126, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:17:59', '2025-05-13 05:17:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(127, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:18:25', '2025-05-13 05:18:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(128, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:20:21', '2025-05-13 05:20:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(129, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:22:21', '2025-05-13 05:22:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(130, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:22:56', '2025-05-13 05:22:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(131, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:23:09', '2025-05-13 05:23:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(132, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:24:09', '2025-05-13 05:24:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(133, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:25:34', '2025-05-13 05:25:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(134, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:29:09', '2025-05-13 05:29:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(135, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:30:53', '2025-05-13 05:30:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(136, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:31:20', '2025-05-13 05:31:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(137, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:31:43', '2025-05-13 05:31:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(138, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:31:51', '2025-05-13 05:31:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(139, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:33:30', '2025-05-13 05:33:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(140, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:33:48', '2025-05-13 05:33:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(141, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:34:02', '2025-05-13 05:34:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(142, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:34:38', '2025-05-13 05:34:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(143, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:35:20', '2025-05-13 05:35:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(144, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:35:42', '2025-05-13 05:35:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(145, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:37:22', '2025-05-13 05:37:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(146, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:37:30', '2025-05-13 05:37:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(147, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:41:17', '2025-05-13 05:41:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(148, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:42:40', '2025-05-13 05:42:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(149, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:43:18', '2025-05-13 05:43:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(150, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:43:45', '2025-05-13 05:43:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(151, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:45:16', '2025-05-13 05:45:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(152, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:45:39', '2025-05-13 05:45:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(153, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:46:04', '2025-05-13 05:46:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(154, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 05:46:13', '2025-05-13 05:46:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(155, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:15:35', '2025-05-13 06:15:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(156, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:16:30', '2025-05-13 06:16:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(157, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:17:09', '2025-05-13 06:17:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(158, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:18:15', '2025-05-13 06:18:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(159, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:18:19', '2025-05-13 06:18:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(160, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:20:28', '2025-05-13 06:20:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(161, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:20:57', '2025-05-13 06:20:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(162, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:21:55', '2025-05-13 06:21:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(163, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:22:07', '2025-05-13 06:22:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(164, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:26:47', '2025-05-13 06:26:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(165, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:28:06', '2025-05-13 06:28:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(166, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:28:30', '2025-05-13 06:28:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(167, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:28:38', '2025-05-13 06:28:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(168, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:28:55', '2025-05-13 06:28:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(169, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:29:45', '2025-05-13 06:29:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(170, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:29:57', '2025-05-13 06:29:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(171, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:30:09', '2025-05-13 06:30:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(172, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:30:23', '2025-05-13 06:30:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(173, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:33:31', '2025-05-13 06:33:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(174, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:33:45', '2025-05-13 06:33:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(175, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:34:40', '2025-05-13 06:34:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(176, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:36:05', '2025-05-13 06:36:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(177, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:36:36', '2025-05-13 06:36:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(178, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:38:32', '2025-05-13 06:38:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(179, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:38:53', '2025-05-13 06:38:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(180, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:41:41', '2025-05-13 06:41:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(181, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:42:35', '2025-05-13 06:42:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(182, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:43:04', '2025-05-13 06:43:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(183, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:43:21', '2025-05-13 06:43:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(184, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:44:19', '2025-05-13 06:44:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(185, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:45:00', '2025-05-13 06:45:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(186, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:45:25', '2025-05-13 06:45:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(187, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:46:10', '2025-05-13 06:46:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(188, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:46:26', '2025-05-13 06:46:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(189, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:46:54', '2025-05-13 06:46:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(190, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:57:39', '2025-05-13 06:57:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(191, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:58:08', '2025-05-13 06:58:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(192, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:58:34', '2025-05-13 06:58:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(193, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 06:58:46', '2025-05-13 06:58:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(194, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:00:23', '2025-05-13 07:00:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(195, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:00:23', '2025-05-13 07:00:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(196, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:00:24', '2025-05-13 07:00:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(197, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:00:24', '2025-05-13 07:00:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(198, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:00:37', '2025-05-13 07:00:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(199, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:00:37', '2025-05-13 07:00:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(200, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:01:58', '2025-05-13 07:01:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(201, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:02:43', '2025-05-13 07:02:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(202, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:02:54', '2025-05-13 07:02:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(203, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:03:10', '2025-05-13 07:03:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(204, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:03:19', '2025-05-13 07:03:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(205, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:03:37', '2025-05-13 07:03:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(206, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:03:39', '2025-05-13 07:03:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(207, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:03:40', '2025-05-13 07:03:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(208, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:03:40', '2025-05-13 07:03:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(209, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:03:56', '2025-05-13 07:03:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(210, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:04:00', '2025-05-13 07:04:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(211, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:04:00', '2025-05-13 07:04:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(212, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:04:00', '2025-05-13 07:04:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(213, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:04:00', '2025-05-13 07:04:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(214, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:04:01', '2025-05-13 07:04:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(215, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:04:08', '2025-05-13 07:04:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(216, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:04:08', '2025-05-13 07:04:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(217, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:04:08', '2025-05-13 07:04:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(218, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:04:08', '2025-05-13 07:04:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(219, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:04:09', '2025-05-13 07:04:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(220, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:05:28', '2025-05-13 07:05:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(221, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:05:49', '2025-05-13 07:05:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(222, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:07:20', '2025-05-13 07:07:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(223, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:08:36', '2025-05-13 07:08:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(224, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:10:23', '2025-05-13 07:10:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(225, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:10:47', '2025-05-13 07:10:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(226, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:10:51', '2025-05-13 07:10:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(227, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:10:52', '2025-05-13 07:10:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(228, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:10:52', '2025-05-13 07:10:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(229, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:10:57', '2025-05-13 07:10:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(230, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:11:08', '2025-05-13 07:11:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(231, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:11:20', '2025-05-13 07:11:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(232, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:11:35', '2025-05-13 07:11:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(233, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:11:48', '2025-05-13 07:11:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(234, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:19:12', '2025-05-13 07:19:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(235, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:19:33', '2025-05-13 07:19:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(236, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:20:33', '2025-05-13 07:20:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(237, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:21:05', '2025-05-13 07:21:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(238, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:22:31', '2025-05-13 07:22:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(239, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:22:57', '2025-05-13 07:22:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(240, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:25:53', '2025-05-13 07:25:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(241, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:25:56', '2025-05-13 07:25:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(242, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:26:34', '2025-05-13 07:26:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(243, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:26:38', '2025-05-13 07:26:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(244, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 07:26:41', '2025-05-13 07:26:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(245, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:48:17', '2025-05-13 23:48:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(246, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:49:16', '2025-05-13 23:49:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(247, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:52:32', '2025-05-13 23:52:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(248, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:53:21', '2025-05-13 23:53:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(249, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:54:42', '2025-05-13 23:54:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(250, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:54:54', '2025-05-13 23:54:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(251, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:56:55', '2025-05-13 23:56:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(252, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:57:21', '2025-05-13 23:57:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(253, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:57:34', '2025-05-13 23:57:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(254, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:58:32', '2025-05-13 23:58:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(255, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:58:55', '2025-05-13 23:58:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(256, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:59:01', '2025-05-13 23:59:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(257, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:59:07', '2025-05-13 23:59:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(258, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:59:19', '2025-05-13 23:59:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(259, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:59:32', '2025-05-13 23:59:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(260, 'WebKit', 'Desktop', NULL, NULL, '2025-05-13 23:59:55', '2025-05-13 23:59:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(261, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:00:12', '2025-05-14 00:00:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(262, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:00:18', '2025-05-14 00:00:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(263, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:01:50', '2025-05-14 00:01:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(264, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:02:00', '2025-05-14 00:02:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(265, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:02:14', '2025-05-14 00:02:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(266, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:02:20', '2025-05-14 00:02:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(267, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:02:27', '2025-05-14 00:02:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(268, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:08:41', '2025-05-14 00:08:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(269, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:09:28', '2025-05-14 00:09:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(270, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:10:10', '2025-05-14 00:10:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(271, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:10:23', '2025-05-14 00:10:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(272, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:15:03', '2025-05-14 00:15:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(273, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:15:07', '2025-05-14 00:15:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(274, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:16:01', '2025-05-14 00:16:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(275, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:16:15', '2025-05-14 00:16:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(276, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:17:31', '2025-05-14 00:17:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(277, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:18:35', '2025-05-14 00:18:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(278, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:18:55', '2025-05-14 00:18:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(279, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:19:32', '2025-05-14 00:19:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(280, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:19:46', '2025-05-14 00:19:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(281, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:19:57', '2025-05-14 00:19:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(282, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:21:18', '2025-05-14 00:21:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(283, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:22:38', '2025-05-14 00:22:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(284, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:22:52', '2025-05-14 00:22:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(285, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:22:53', '2025-05-14 00:22:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(286, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:22:53', '2025-05-14 00:22:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(287, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:22:53', '2025-05-14 00:22:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(288, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:24:07', '2025-05-14 00:24:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(289, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:24:33', '2025-05-14 00:24:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(290, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:29:07', '2025-05-14 00:29:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(291, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:29:56', '2025-05-14 00:29:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(292, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:31:09', '2025-05-14 00:31:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(293, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:32:01', '2025-05-14 00:32:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(294, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:32:35', '2025-05-14 00:32:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(295, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:33:10', '2025-05-14 00:33:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(296, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:33:30', '2025-05-14 00:33:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(297, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:36:02', '2025-05-14 00:36:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(298, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:36:34', '2025-05-14 00:36:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(299, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:37:34', '2025-05-14 00:37:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(300, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:37:46', '2025-05-14 00:37:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(301, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:39:46', '2025-05-14 00:39:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(302, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:40:05', '2025-05-14 00:40:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(303, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:40:45', '2025-05-14 00:40:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(304, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:56:58', '2025-05-14 00:56:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(305, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:57:15', '2025-05-14 00:57:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(306, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:57:37', '2025-05-14 00:57:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(307, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 00:57:45', '2025-05-14 00:57:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(308, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:02:21', '2025-05-14 01:02:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(309, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:02:52', '2025-05-14 01:02:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(310, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:06:49', '2025-05-14 01:06:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(311, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:07:33', '2025-05-14 01:07:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(312, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:09:51', '2025-05-14 01:09:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(313, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:10:41', '2025-05-14 01:10:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(314, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:11:11', '2025-05-14 01:11:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(315, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:11:15', '2025-05-14 01:11:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(316, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:12:16', '2025-05-14 01:12:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(317, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:12:58', '2025-05-14 01:12:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(318, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:15:11', '2025-05-14 01:15:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(319, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:15:14', '2025-05-14 01:15:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(320, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:18:34', '2025-05-14 01:18:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(321, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:19:23', '2025-05-14 01:19:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(322, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:20:24', '2025-05-14 01:20:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(323, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:22:48', '2025-05-14 01:22:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(324, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:24:01', '2025-05-14 01:24:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(325, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:24:04', '2025-05-14 01:24:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(326, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:24:07', '2025-05-14 01:24:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(327, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:24:45', '2025-05-14 01:24:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(328, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:24:54', '2025-05-14 01:24:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(329, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:25:00', '2025-05-14 01:25:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(330, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:26:29', '2025-05-14 01:26:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(331, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:26:41', '2025-05-14 01:26:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(332, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:28:09', '2025-05-14 01:28:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(333, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:28:18', '2025-05-14 01:28:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(334, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:28:25', '2025-05-14 01:28:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(335, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:37:31', '2025-05-14 01:37:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(336, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:38:33', '2025-05-14 01:38:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(337, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:38:39', '2025-05-14 01:38:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(338, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:38:57', '2025-05-14 01:38:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(339, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:39:10', '2025-05-14 01:39:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(340, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:39:18', '2025-05-14 01:39:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(341, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:42:13', '2025-05-14 01:42:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(342, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:42:58', '2025-05-14 01:42:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(343, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 01:43:12', '2025-05-14 01:43:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(344, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:16:18', '2025-05-14 02:16:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(345, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:16:30', '2025-05-14 02:16:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(346, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:16:43', '2025-05-14 02:16:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(347, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:16:59', '2025-05-14 02:16:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(348, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:17:04', '2025-05-14 02:17:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(349, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:17:07', '2025-05-14 02:17:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(350, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:17:39', '2025-05-14 02:17:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(351, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:18:41', '2025-05-14 02:18:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(352, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:18:47', '2025-05-14 02:18:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(353, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:18:52', '2025-05-14 02:18:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(354, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:18:56', '2025-05-14 02:18:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(355, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:19:06', '2025-05-14 02:19:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(356, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:19:08', '2025-05-14 02:19:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(357, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:19:34', '2025-05-14 02:19:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(358, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:20:10', '2025-05-14 02:20:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(359, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:20:16', '2025-05-14 02:20:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(360, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:20:20', '2025-05-14 02:20:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(361, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:21:00', '2025-05-14 02:21:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(362, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:21:03', '2025-05-14 02:21:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(363, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:21:23', '2025-05-14 02:21:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(364, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:21:28', '2025-05-14 02:21:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(365, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:21:33', '2025-05-14 02:21:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(366, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:26:17', '2025-05-14 02:26:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(367, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:26:42', '2025-05-14 02:26:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(368, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:26:48', '2025-05-14 02:26:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(369, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:27:07', '2025-05-14 02:27:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(370, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:27:25', '2025-05-14 02:27:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(371, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:27:27', '2025-05-14 02:27:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(372, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:29:48', '2025-05-14 02:29:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(373, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:30:11', '2025-05-14 02:30:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1');
INSERT INTO `device` (`id`, `device_type`, `device_name`, `user_id`, `user_type`, `created_at`, `updated_at`, `browser`, `browser_version`, `platform`, `platform_version`, `ip_address`) VALUES
(374, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:30:14', '2025-05-14 02:30:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(375, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:30:14', '2025-05-14 02:30:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(376, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:30:31', '2025-05-14 02:30:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(377, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:30:42', '2025-05-14 02:30:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(378, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:30:48', '2025-05-14 02:30:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(379, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:31:44', '2025-05-14 02:31:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(380, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:32:01', '2025-05-14 02:32:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(381, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:32:01', '2025-05-14 02:32:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(382, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:32:12', '2025-05-14 02:32:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(383, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:33:03', '2025-05-14 02:33:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(384, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:33:10', '2025-05-14 02:33:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(385, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:33:50', '2025-05-14 02:33:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(386, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:36:02', '2025-05-14 02:36:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(387, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:36:50', '2025-05-14 02:36:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(388, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:37:12', '2025-05-14 02:37:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(389, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:37:18', '2025-05-14 02:37:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(390, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:37:29', '2025-05-14 02:37:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(391, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:37:37', '2025-05-14 02:37:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(392, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:37:41', '2025-05-14 02:37:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(393, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:37:49', '2025-05-14 02:37:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(394, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:38:29', '2025-05-14 02:38:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(395, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:42:22', '2025-05-14 02:42:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(396, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:42:40', '2025-05-14 02:42:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(397, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:46:38', '2025-05-14 02:46:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(398, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:47:06', '2025-05-14 02:47:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(399, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:47:33', '2025-05-14 02:47:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(400, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:47:50', '2025-05-14 02:47:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(401, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:48:12', '2025-05-14 02:48:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(402, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 02:55:36', '2025-05-14 02:55:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(403, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:00:38', '2025-05-14 03:00:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(404, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:00:41', '2025-05-14 03:00:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(405, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:02:26', '2025-05-14 03:02:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(406, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:02:30', '2025-05-14 03:02:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(407, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:02:57', '2025-05-14 03:02:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(408, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:11:53', '2025-05-14 03:11:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(409, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:11:53', '2025-05-14 03:11:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(410, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:11:55', '2025-05-14 03:11:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(411, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:12:00', '2025-05-14 03:12:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(412, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:12:07', '2025-05-14 03:12:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(413, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:15:33', '2025-05-14 03:15:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(414, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:15:39', '2025-05-14 03:15:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(415, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:15:42', '2025-05-14 03:15:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(416, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:15:43', '2025-05-14 03:15:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(417, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:15:47', '2025-05-14 03:15:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(418, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:15:53', '2025-05-14 03:15:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(419, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:15:57', '2025-05-14 03:15:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(420, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:18:39', '2025-05-14 03:18:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(421, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:19:03', '2025-05-14 03:19:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(422, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:20:38', '2025-05-14 03:20:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(423, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:20:40', '2025-05-14 03:20:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(424, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:21:53', '2025-05-14 03:21:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(425, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:23:45', '2025-05-14 03:23:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(426, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:24:39', '2025-05-14 03:24:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(427, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:25:31', '2025-05-14 03:25:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(428, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:27:30', '2025-05-14 03:27:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(429, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:27:31', '2025-05-14 03:27:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(430, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:27:39', '2025-05-14 03:27:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(431, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:28:22', '2025-05-14 03:28:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(432, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:28:24', '2025-05-14 03:28:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(433, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:29:19', '2025-05-14 03:29:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(434, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:36:32', '2025-05-14 03:36:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(435, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:37:04', '2025-05-14 03:37:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(436, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:37:31', '2025-05-14 03:37:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(437, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:37:43', '2025-05-14 03:37:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(438, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:38:05', '2025-05-14 03:38:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(439, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:38:06', '2025-05-14 03:38:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(440, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:38:31', '2025-05-14 03:38:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(441, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:38:51', '2025-05-14 03:38:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(442, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:39:52', '2025-05-14 03:39:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(443, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:40:10', '2025-05-14 03:40:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(444, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:40:32', '2025-05-14 03:40:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(445, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:40:56', '2025-05-14 03:40:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(446, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:41:25', '2025-05-14 03:41:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(447, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:41:37', '2025-05-14 03:41:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(448, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:41:46', '2025-05-14 03:41:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(449, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:42:06', '2025-05-14 03:42:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(450, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:42:14', '2025-05-14 03:42:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(451, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:44:29', '2025-05-14 03:44:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(452, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:44:31', '2025-05-14 03:44:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(453, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:44:44', '2025-05-14 03:44:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(454, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:44:55', '2025-05-14 03:44:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(455, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:01', '2025-05-14 03:46:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(456, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:03', '2025-05-14 03:46:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(457, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:04', '2025-05-14 03:46:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(458, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:08', '2025-05-14 03:46:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(459, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:18', '2025-05-14 03:46:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(460, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:23', '2025-05-14 03:46:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(461, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:26', '2025-05-14 03:46:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(462, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:27', '2025-05-14 03:46:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(463, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:30', '2025-05-14 03:46:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(464, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:39', '2025-05-14 03:46:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(465, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:46:40', '2025-05-14 03:46:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(466, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:47:37', '2025-05-14 03:47:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(467, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:47:39', '2025-05-14 03:47:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(468, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:47:39', '2025-05-14 03:47:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(469, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:47:42', '2025-05-14 03:47:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(470, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 03:48:00', '2025-05-14 03:48:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(471, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:15:27', '2025-05-14 04:15:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(472, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:15:30', '2025-05-14 04:15:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(473, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:19:49', '2025-05-14 04:19:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(474, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:34:14', '2025-05-14 04:34:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(475, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:34:49', '2025-05-14 04:34:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(476, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:35:02', '2025-05-14 04:35:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(477, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:35:27', '2025-05-14 04:35:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(478, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:35:32', '2025-05-14 04:35:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(479, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:35:37', '2025-05-14 04:35:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(480, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:35:47', '2025-05-14 04:35:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(481, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:36:48', '2025-05-14 04:36:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(482, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:36:59', '2025-05-14 04:36:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(483, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:37:07', '2025-05-14 04:37:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(484, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:37:13', '2025-05-14 04:37:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(485, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:37:16', '2025-05-14 04:37:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(486, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:38:44', '2025-05-14 04:38:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(487, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:39:09', '2025-05-14 04:39:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(488, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:49:18', '2025-05-14 04:49:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(489, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:49:39', '2025-05-14 04:49:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(490, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:49:52', '2025-05-14 04:49:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(491, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:50:37', '2025-05-14 04:50:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(492, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:51:14', '2025-05-14 04:51:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(493, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:51:42', '2025-05-14 04:51:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(494, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:52:21', '2025-05-14 04:52:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(495, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:52:52', '2025-05-14 04:52:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(496, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:54:25', '2025-05-14 04:54:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(497, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:54:50', '2025-05-14 04:54:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(498, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:56:11', '2025-05-14 04:56:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(499, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:56:19', '2025-05-14 04:56:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(500, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:56:40', '2025-05-14 04:56:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(501, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:56:51', '2025-05-14 04:56:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(502, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:56:54', '2025-05-14 04:56:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(503, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:57:01', '2025-05-14 04:57:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(504, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:57:35', '2025-05-14 04:57:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(505, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 04:59:51', '2025-05-14 04:59:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(506, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:00:16', '2025-05-14 05:00:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(507, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:00:37', '2025-05-14 05:00:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(508, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:02:52', '2025-05-14 05:02:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(509, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:03:07', '2025-05-14 05:03:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(510, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:03:27', '2025-05-14 05:03:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(511, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:04:01', '2025-05-14 05:04:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(512, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:04:07', '2025-05-14 05:04:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(513, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:04:24', '2025-05-14 05:04:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(514, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:04:48', '2025-05-14 05:04:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(515, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:05:09', '2025-05-14 05:05:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(516, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:06:08', '2025-05-14 05:06:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(517, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:06:44', '2025-05-14 05:06:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(518, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:08:38', '2025-05-14 05:08:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(519, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:08:51', '2025-05-14 05:08:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(520, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:09:09', '2025-05-14 05:09:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(521, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:09:22', '2025-05-14 05:09:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(522, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:09:35', '2025-05-14 05:09:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(523, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:09:50', '2025-05-14 05:09:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(524, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:10:33', '2025-05-14 05:10:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(525, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:10:37', '2025-05-14 05:10:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(526, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:10:54', '2025-05-14 05:10:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(527, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:10:56', '2025-05-14 05:10:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(528, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:11:15', '2025-05-14 05:11:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(529, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:11:30', '2025-05-14 05:11:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(530, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:11:39', '2025-05-14 05:11:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(531, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:11:58', '2025-05-14 05:11:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(532, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:13:26', '2025-05-14 05:13:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(533, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:13:38', '2025-05-14 05:13:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(534, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:15:11', '2025-05-14 05:15:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(535, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:15:42', '2025-05-14 05:15:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(536, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:17:12', '2025-05-14 05:17:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(537, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:17:22', '2025-05-14 05:17:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(538, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:17:36', '2025-05-14 05:17:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(539, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:17:39', '2025-05-14 05:17:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(540, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:17:43', '2025-05-14 05:17:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(541, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:17:44', '2025-05-14 05:17:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(542, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:17:54', '2025-05-14 05:17:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(543, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:35:53', '2025-05-14 05:35:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(544, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:36:02', '2025-05-14 05:36:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(545, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:36:55', '2025-05-14 05:36:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(546, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:37:43', '2025-05-14 05:37:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(547, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:38:22', '2025-05-14 05:38:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(548, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:39:11', '2025-05-14 05:39:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(549, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:39:31', '2025-05-14 05:39:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(550, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:39:46', '2025-05-14 05:39:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(551, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:40:37', '2025-05-14 05:40:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(552, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:40:52', '2025-05-14 05:40:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(553, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:46:29', '2025-05-14 05:46:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(554, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:49:41', '2025-05-14 05:49:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(555, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:49:56', '2025-05-14 05:49:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(556, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:50:53', '2025-05-14 05:50:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(557, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:51:40', '2025-05-14 05:51:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(558, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:51:40', '2025-05-14 05:51:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(559, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:52:28', '2025-05-14 05:52:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(560, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:52:32', '2025-05-14 05:52:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(561, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:52:32', '2025-05-14 05:52:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(562, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:53:37', '2025-05-14 05:53:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(563, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:53:38', '2025-05-14 05:53:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(564, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:54:17', '2025-05-14 05:54:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(565, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:54:17', '2025-05-14 05:54:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(566, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:15', '2025-05-14 05:56:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(567, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:17', '2025-05-14 05:56:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(568, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:21', '2025-05-14 05:56:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(569, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:23', '2025-05-14 05:56:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(570, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:23', '2025-05-14 05:56:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(571, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:25', '2025-05-14 05:56:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(572, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:28', '2025-05-14 05:56:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(573, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:31', '2025-05-14 05:56:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(574, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:32', '2025-05-14 05:56:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(575, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:44', '2025-05-14 05:56:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(576, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:48', '2025-05-14 05:56:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(577, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:56', '2025-05-14 05:56:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(578, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:56:56', '2025-05-14 05:56:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(579, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:57:37', '2025-05-14 05:57:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(580, 'WebKit', 'Desktop', NULL, NULL, '2025-05-14 05:57:50', '2025-05-14 05:57:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(581, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:37:09', '2025-05-15 00:37:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(582, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:37:29', '2025-05-15 00:37:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(583, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:37:42', '2025-05-15 00:37:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(584, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:39:27', '2025-05-15 00:39:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(585, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:40:45', '2025-05-15 00:40:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(586, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:40:48', '2025-05-15 00:40:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(587, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:42:11', '2025-05-15 00:42:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(588, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:43:05', '2025-05-15 00:43:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(589, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:43:27', '2025-05-15 00:43:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(590, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:43:35', '2025-05-15 00:43:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(591, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:43:39', '2025-05-15 00:43:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(592, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:43:47', '2025-05-15 00:43:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(593, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:44:41', '2025-05-15 00:44:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(594, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:44:49', '2025-05-15 00:44:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(595, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:44:53', '2025-05-15 00:44:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(596, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:46:21', '2025-05-15 00:46:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(597, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:46:25', '2025-05-15 00:46:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(598, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:46:39', '2025-05-15 00:46:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(599, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:46:44', '2025-05-15 00:46:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(600, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:47:39', '2025-05-15 00:47:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(601, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:47:52', '2025-05-15 00:47:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(602, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 00:49:35', '2025-05-15 00:49:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(603, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:24:52', '2025-05-15 01:24:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(604, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:25:07', '2025-05-15 01:25:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(605, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:25:37', '2025-05-15 01:25:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(606, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:26:27', '2025-05-15 01:26:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(607, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:26:42', '2025-05-15 01:26:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(608, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:26:52', '2025-05-15 01:26:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(609, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:27:07', '2025-05-15 01:27:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(610, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:30:30', '2025-05-15 01:30:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(611, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:30:33', '2025-05-15 01:30:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(612, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:30:48', '2025-05-15 01:30:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(613, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:31:23', '2025-05-15 01:31:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(614, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:31:28', '2025-05-15 01:31:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(615, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:31:35', '2025-05-15 01:31:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(616, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:31:59', '2025-05-15 01:31:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(617, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:35:46', '2025-05-15 01:35:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(618, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:35:58', '2025-05-15 01:35:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(619, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:36:20', '2025-05-15 01:36:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(620, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:36:26', '2025-05-15 01:36:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(621, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:36:34', '2025-05-15 01:36:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(622, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:36:55', '2025-05-15 01:36:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(623, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:36:55', '2025-05-15 01:36:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(624, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:37:01', '2025-05-15 01:37:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(625, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:37:15', '2025-05-15 01:37:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(626, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:37:22', '2025-05-15 01:37:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(627, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:37:26', '2025-05-15 01:37:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(628, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:37:38', '2025-05-15 01:37:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(629, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:37:43', '2025-05-15 01:37:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(630, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:37:48', '2025-05-15 01:37:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(631, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:37:56', '2025-05-15 01:37:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(632, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:38:55', '2025-05-15 01:38:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(633, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:41:31', '2025-05-15 01:41:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(634, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:41:41', '2025-05-15 01:41:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(635, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:43:18', '2025-05-15 01:43:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(636, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:43:41', '2025-05-15 01:43:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(637, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:43:56', '2025-05-15 01:43:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(638, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:44:25', '2025-05-15 01:44:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(639, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:45:06', '2025-05-15 01:45:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(640, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 01:45:30', '2025-05-15 01:45:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(641, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:09:01', '2025-05-15 02:09:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(642, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:09:02', '2025-05-15 02:09:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(643, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:09:22', '2025-05-15 02:09:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(644, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:10:31', '2025-05-15 02:10:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(645, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:11:00', '2025-05-15 02:11:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(646, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:12:10', '2025-05-15 02:12:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(647, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:12:31', '2025-05-15 02:12:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(648, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:13:18', '2025-05-15 02:13:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(649, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:13:59', '2025-05-15 02:13:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(650, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:15:59', '2025-05-15 02:15:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(651, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:16:02', '2025-05-15 02:16:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(652, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:16:37', '2025-05-15 02:16:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(653, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:16:58', '2025-05-15 02:16:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(654, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:20:19', '2025-05-15 02:20:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(655, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:28:36', '2025-05-15 02:28:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(656, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:28:37', '2025-05-15 02:28:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(657, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:28:58', '2025-05-15 02:28:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(658, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:29:08', '2025-05-15 02:29:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(659, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:31:12', '2025-05-15 02:31:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(660, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:33:46', '2025-05-15 02:33:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(661, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 02:34:12', '2025-05-15 02:34:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(662, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:00:11', '2025-05-15 03:00:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(663, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:00:29', '2025-05-15 03:00:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(664, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:02:48', '2025-05-15 03:02:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(665, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:03:10', '2025-05-15 03:03:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(666, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:03:25', '2025-05-15 03:03:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(667, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:03:37', '2025-05-15 03:03:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(668, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:03:47', '2025-05-15 03:03:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(669, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:04:08', '2025-05-15 03:04:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(670, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:05:57', '2025-05-15 03:05:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(671, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:06:45', '2025-05-15 03:06:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(672, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:09:37', '2025-05-15 03:09:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(673, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:09:44', '2025-05-15 03:09:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(674, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:10:14', '2025-05-15 03:10:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(675, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:10:34', '2025-05-15 03:10:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(676, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:11:18', '2025-05-15 03:11:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(677, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:11:46', '2025-05-15 03:11:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(678, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:11:58', '2025-05-15 03:11:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(679, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:12:25', '2025-05-15 03:12:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(680, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:26:13', '2025-05-15 03:26:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(681, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:26:35', '2025-05-15 03:26:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(682, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:27:42', '2025-05-15 03:27:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(683, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:27:50', '2025-05-15 03:27:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(684, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:32:12', '2025-05-15 03:32:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(685, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:32:28', '2025-05-15 03:32:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(686, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:33:14', '2025-05-15 03:33:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(687, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:34:48', '2025-05-15 03:34:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(688, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:49:01', '2025-05-15 03:49:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(689, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:59:08', '2025-05-15 03:59:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(690, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 03:59:10', '2025-05-15 03:59:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(691, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 04:58:42', '2025-05-15 04:58:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(692, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 04:58:55', '2025-05-15 04:58:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(693, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 04:59:20', '2025-05-15 04:59:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(694, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:00:05', '2025-05-15 05:00:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(695, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:00:52', '2025-05-15 05:00:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(696, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:01:15', '2025-05-15 05:01:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(697, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:01:16', '2025-05-15 05:01:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(698, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:02:11', '2025-05-15 05:02:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(699, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:02:31', '2025-05-15 05:02:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(700, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:02:39', '2025-05-15 05:02:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(701, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:02:49', '2025-05-15 05:02:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(702, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:03:18', '2025-05-15 05:03:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(703, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:03:23', '2025-05-15 05:03:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(704, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:03:40', '2025-05-15 05:03:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(705, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:04:10', '2025-05-15 05:04:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(706, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:04:20', '2025-05-15 05:04:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(707, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:04:22', '2025-05-15 05:04:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(708, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:04:26', '2025-05-15 05:04:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(709, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:04:36', '2025-05-15 05:04:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(710, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:04:41', '2025-05-15 05:04:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(711, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:04:52', '2025-05-15 05:04:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(712, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:04:56', '2025-05-15 05:04:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(713, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:06:43', '2025-05-15 05:06:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(714, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:06:44', '2025-05-15 05:06:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(715, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:07:06', '2025-05-15 05:07:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(716, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:12:37', '2025-05-15 05:12:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(717, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:27:31', '2025-05-15 05:27:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(718, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 05:27:40', '2025-05-15 05:27:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(719, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 06:19:54', '2025-05-15 06:19:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(720, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 06:19:54', '2025-05-15 06:19:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(721, 'WebKit', 'Desktop', NULL, NULL, '2025-05-15 06:23:00', '2025-05-15 06:23:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(722, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 02:07:36', '2025-05-16 02:07:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(723, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 02:07:40', '2025-05-16 02:07:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(724, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 02:09:32', '2025-05-16 02:09:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(725, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:10:42', '2025-05-16 03:10:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(726, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:11:02', '2025-05-16 03:11:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(727, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:11:39', '2025-05-16 03:11:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(728, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:11:42', '2025-05-16 03:11:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(729, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:14:41', '2025-05-16 03:14:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(730, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:14:44', '2025-05-16 03:14:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(731, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:14:56', '2025-05-16 03:14:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(732, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:15:01', '2025-05-16 03:15:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(733, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:15:04', '2025-05-16 03:15:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(734, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:15:16', '2025-05-16 03:15:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(735, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:15:22', '2025-05-16 03:15:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(736, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:16:28', '2025-05-16 03:16:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(737, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:16:32', '2025-05-16 03:16:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(738, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:16:36', '2025-05-16 03:16:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(739, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:16:50', '2025-05-16 03:16:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(740, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:17:02', '2025-05-16 03:17:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(741, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:17:14', '2025-05-16 03:17:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(742, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:17:56', '2025-05-16 03:17:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(743, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:18:37', '2025-05-16 03:18:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(744, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:18:50', '2025-05-16 03:18:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1');
INSERT INTO `device` (`id`, `device_type`, `device_name`, `user_id`, `user_type`, `created_at`, `updated_at`, `browser`, `browser_version`, `platform`, `platform_version`, `ip_address`) VALUES
(745, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:19:23', '2025-05-16 03:19:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(746, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:19:41', '2025-05-16 03:19:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(747, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:19:56', '2025-05-16 03:19:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(748, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:23:38', '2025-05-16 03:23:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(749, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:24:06', '2025-05-16 03:24:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(750, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:29:21', '2025-05-16 03:29:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(751, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:32:01', '2025-05-16 03:32:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(752, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:32:25', '2025-05-16 03:32:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(753, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:34:47', '2025-05-16 03:34:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(754, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:35:32', '2025-05-16 03:35:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(755, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:38:40', '2025-05-16 03:38:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(756, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:38:45', '2025-05-16 03:38:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(757, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:39:50', '2025-05-16 03:39:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(758, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:39:58', '2025-05-16 03:39:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(759, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:42:49', '2025-05-16 03:42:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(760, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:43:49', '2025-05-16 03:43:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(761, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:44:38', '2025-05-16 03:44:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(762, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:44:50', '2025-05-16 03:44:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(763, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:50:54', '2025-05-16 03:50:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(764, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:51:08', '2025-05-16 03:51:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(765, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:51:19', '2025-05-16 03:51:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(766, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:51:37', '2025-05-16 03:51:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(767, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:51:45', '2025-05-16 03:51:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(768, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:52:01', '2025-05-16 03:52:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(769, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:53:09', '2025-05-16 03:53:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(770, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:53:21', '2025-05-16 03:53:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(771, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:53:35', '2025-05-16 03:53:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(772, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:55:30', '2025-05-16 03:55:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(773, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:55:41', '2025-05-16 03:55:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(774, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:55:59', '2025-05-16 03:55:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(775, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:56:10', '2025-05-16 03:56:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(776, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:56:18', '2025-05-16 03:56:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(777, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:56:31', '2025-05-16 03:56:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(778, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:56:42', '2025-05-16 03:56:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(779, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:56:49', '2025-05-16 03:56:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(780, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:57:48', '2025-05-16 03:57:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(781, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:58:07', '2025-05-16 03:58:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(782, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:58:23', '2025-05-16 03:58:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(783, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:58:36', '2025-05-16 03:58:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(784, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:58:44', '2025-05-16 03:58:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(785, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:58:57', '2025-05-16 03:58:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(786, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:59:25', '2025-05-16 03:59:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(787, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:59:39', '2025-05-16 03:59:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(788, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 03:59:53', '2025-05-16 03:59:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(789, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:01:31', '2025-05-16 04:01:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(790, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:03:33', '2025-05-16 04:03:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(791, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:04:17', '2025-05-16 04:04:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(792, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:04:33', '2025-05-16 04:04:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(793, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:09:55', '2025-05-16 04:09:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(794, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:10:34', '2025-05-16 04:10:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(795, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:10:40', '2025-05-16 04:10:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(796, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:12:58', '2025-05-16 04:12:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(797, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:13:05', '2025-05-16 04:13:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(798, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:13:12', '2025-05-16 04:13:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(799, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:14:25', '2025-05-16 04:14:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(800, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:16:40', '2025-05-16 04:16:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(801, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:20:01', '2025-05-16 04:20:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(802, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:20:10', '2025-05-16 04:20:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(803, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:20:10', '2025-05-16 04:20:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(804, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:20:15', '2025-05-16 04:20:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(805, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:20:21', '2025-05-16 04:20:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(806, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:20:50', '2025-05-16 04:20:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(807, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:21:01', '2025-05-16 04:21:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(808, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:21:13', '2025-05-16 04:21:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(809, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:21:21', '2025-05-16 04:21:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(810, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:24:28', '2025-05-16 04:24:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(811, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:24:43', '2025-05-16 04:24:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(812, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:29:28', '2025-05-16 04:29:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(813, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:29:54', '2025-05-16 04:29:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(814, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:30:05', '2025-05-16 04:30:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(815, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:32:22', '2025-05-16 04:32:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(816, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:32:51', '2025-05-16 04:32:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(817, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:33:15', '2025-05-16 04:33:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(818, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:33:41', '2025-05-16 04:33:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(819, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:34:20', '2025-05-16 04:34:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(820, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:34:34', '2025-05-16 04:34:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(821, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:34:51', '2025-05-16 04:34:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(822, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:35:10', '2025-05-16 04:35:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(823, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:35:22', '2025-05-16 04:35:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(824, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 04:41:16', '2025-05-16 04:41:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(825, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:29:00', '2025-05-16 05:29:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(826, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:30:52', '2025-05-16 05:30:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(827, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:31:19', '2025-05-16 05:31:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(828, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:31:35', '2025-05-16 05:31:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(829, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:34:42', '2025-05-16 05:34:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(830, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:34:54', '2025-05-16 05:34:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(831, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:36:52', '2025-05-16 05:36:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(832, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:37:05', '2025-05-16 05:37:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(833, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:38:09', '2025-05-16 05:38:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(834, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:38:45', '2025-05-16 05:38:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(835, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:41:15', '2025-05-16 05:41:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(836, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:42:32', '2025-05-16 05:42:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(837, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:43:14', '2025-05-16 05:43:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(838, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:44:16', '2025-05-16 05:44:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(839, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:47:03', '2025-05-16 05:47:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(840, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:47:16', '2025-05-16 05:47:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(841, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:47:25', '2025-05-16 05:47:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(842, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:47:42', '2025-05-16 05:47:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(843, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:47:58', '2025-05-16 05:47:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(844, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:48:12', '2025-05-16 05:48:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(845, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:48:31', '2025-05-16 05:48:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(846, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:50:09', '2025-05-16 05:50:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(847, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:51:08', '2025-05-16 05:51:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(848, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:51:24', '2025-05-16 05:51:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(849, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:52:36', '2025-05-16 05:52:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(850, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:53:30', '2025-05-16 05:53:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(851, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:54:51', '2025-05-16 05:54:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(852, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:55:07', '2025-05-16 05:55:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(853, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:57:47', '2025-05-16 05:57:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(854, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:58:30', '2025-05-16 05:58:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(855, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:58:56', '2025-05-16 05:58:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(856, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:59:12', '2025-05-16 05:59:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(857, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 05:59:43', '2025-05-16 05:59:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(858, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:00:02', '2025-05-16 06:00:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(859, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:01:15', '2025-05-16 06:01:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(860, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:01:23', '2025-05-16 06:01:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(861, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:02:15', '2025-05-16 06:02:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(862, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:04:51', '2025-05-16 06:04:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(863, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:05:22', '2025-05-16 06:05:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(864, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:06:03', '2025-05-16 06:06:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(865, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:06:17', '2025-05-16 06:06:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(866, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:06:40', '2025-05-16 06:06:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(867, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:13:39', '2025-05-16 06:13:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(868, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:16:04', '2025-05-16 06:16:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(869, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:22:16', '2025-05-16 06:22:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(870, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:22:57', '2025-05-16 06:22:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(871, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:23:22', '2025-05-16 06:23:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(872, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:23:53', '2025-05-16 06:23:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(873, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:24:25', '2025-05-16 06:24:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(874, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:24:46', '2025-05-16 06:24:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(875, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:24:53', '2025-05-16 06:24:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(876, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:25:32', '2025-05-16 06:25:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(877, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:26:23', '2025-05-16 06:26:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(878, 'WebKit', 'Desktop', NULL, NULL, '2025-05-16 06:27:05', '2025-05-16 06:27:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(879, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 00:47:42', '2025-05-17 00:47:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(880, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 00:55:41', '2025-05-17 00:55:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(881, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 01:06:23', '2025-05-17 01:06:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(882, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 01:10:25', '2025-05-17 01:10:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(883, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 01:18:17', '2025-05-17 01:18:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(884, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 01:19:51', '2025-05-17 01:19:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(885, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 01:20:05', '2025-05-17 01:20:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(886, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 04:54:47', '2025-05-17 04:54:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(887, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 04:55:21', '2025-05-17 04:55:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(888, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 04:56:08', '2025-05-17 04:56:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(889, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 04:56:26', '2025-05-17 04:56:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(890, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:01:50', '2025-05-17 05:01:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(891, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:02:21', '2025-05-17 05:02:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(892, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:02:25', '2025-05-17 05:02:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(893, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:02:40', '2025-05-17 05:02:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(894, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:03:22', '2025-05-17 05:03:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(895, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:03:58', '2025-05-17 05:03:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(896, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:05:10', '2025-05-17 05:05:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(897, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:05:19', '2025-05-17 05:05:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(898, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:05:36', '2025-05-17 05:05:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(899, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:05:53', '2025-05-17 05:05:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(900, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:06:07', '2025-05-17 05:06:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(901, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:07:13', '2025-05-17 05:07:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(902, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:08:55', '2025-05-17 05:08:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(903, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:10:19', '2025-05-17 05:10:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(904, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:11:22', '2025-05-17 05:11:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(905, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:13:12', '2025-05-17 05:13:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(906, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:13:19', '2025-05-17 05:13:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(907, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:14:06', '2025-05-17 05:14:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(908, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:14:07', '2025-05-17 05:14:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(909, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:14:08', '2025-05-17 05:14:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(910, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:14:19', '2025-05-17 05:14:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(911, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:15:26', '2025-05-17 05:15:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(912, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:15:29', '2025-05-17 05:15:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(913, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:16:25', '2025-05-17 05:16:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(914, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:16:39', '2025-05-17 05:16:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(915, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:17:17', '2025-05-17 05:17:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(916, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:17:29', '2025-05-17 05:17:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(917, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:18:11', '2025-05-17 05:18:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(918, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:18:54', '2025-05-17 05:18:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(919, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:22:17', '2025-05-17 05:22:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(920, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:23:53', '2025-05-17 05:23:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(921, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:24:05', '2025-05-17 05:24:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(922, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:24:14', '2025-05-17 05:24:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(923, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:24:26', '2025-05-17 05:24:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(924, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:24:43', '2025-05-17 05:24:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(925, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:25:18', '2025-05-17 05:25:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(926, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:27:53', '2025-05-17 05:27:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(927, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:28:06', '2025-05-17 05:28:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(928, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:30:49', '2025-05-17 05:30:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(929, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:31:06', '2025-05-17 05:31:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(930, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:32:48', '2025-05-17 05:32:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(931, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:32:55', '2025-05-17 05:32:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(932, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:33:23', '2025-05-17 05:33:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(933, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:34:37', '2025-05-17 05:34:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(934, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:34:50', '2025-05-17 05:34:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(935, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:35:21', '2025-05-17 05:35:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(936, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:36:13', '2025-05-17 05:36:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(937, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:36:44', '2025-05-17 05:36:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(938, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:40:31', '2025-05-17 05:40:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(939, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:40:40', '2025-05-17 05:40:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(940, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:40:46', '2025-05-17 05:40:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(941, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:40:58', '2025-05-17 05:40:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(942, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:43:04', '2025-05-17 05:43:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(943, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:44:16', '2025-05-17 05:44:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(944, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:45:43', '2025-05-17 05:45:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(945, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:45:46', '2025-05-17 05:45:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(946, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:45:53', '2025-05-17 05:45:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(947, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:45:58', '2025-05-17 05:45:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(948, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:46:37', '2025-05-17 05:46:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(949, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:47:07', '2025-05-17 05:47:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(950, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:47:28', '2025-05-17 05:47:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(951, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:48:39', '2025-05-17 05:48:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(952, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:49:21', '2025-05-17 05:49:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(953, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:49:31', '2025-05-17 05:49:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(954, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:49:56', '2025-05-17 05:49:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(955, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:50:12', '2025-05-17 05:50:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(956, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:50:20', '2025-05-17 05:50:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(957, 'WebKit', 'Desktop', NULL, NULL, '2025-05-17 05:50:37', '2025-05-17 05:50:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(958, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:07:18', '2025-05-19 02:07:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(959, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:07:27', '2025-05-19 02:07:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(960, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:08:41', '2025-05-19 02:08:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(961, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:09:35', '2025-05-19 02:09:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(962, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:10:23', '2025-05-19 02:10:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(963, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:12:27', '2025-05-19 02:12:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(964, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:12:37', '2025-05-19 02:12:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(965, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:12:45', '2025-05-19 02:12:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(966, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:13:42', '2025-05-19 02:13:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(967, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:14:15', '2025-05-19 02:14:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(968, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:14:24', '2025-05-19 02:14:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(969, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:14:32', '2025-05-19 02:14:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(970, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:17:28', '2025-05-19 02:17:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(971, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:17:42', '2025-05-19 02:17:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(972, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:18:28', '2025-05-19 02:18:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(973, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:18:57', '2025-05-19 02:18:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(974, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:19:13', '2025-05-19 02:19:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(975, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:20:15', '2025-05-19 02:20:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(976, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:20:38', '2025-05-19 02:20:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(977, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:20:54', '2025-05-19 02:20:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(978, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:21:37', '2025-05-19 02:21:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(979, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:22:56', '2025-05-19 02:22:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(980, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:23:06', '2025-05-19 02:23:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(981, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:23:29', '2025-05-19 02:23:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(982, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:24:14', '2025-05-19 02:24:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(983, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:24:48', '2025-05-19 02:24:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(984, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:24:57', '2025-05-19 02:24:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(985, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:25:11', '2025-05-19 02:25:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(986, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:25:23', '2025-05-19 02:25:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(987, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:25:32', '2025-05-19 02:25:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(988, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:25:54', '2025-05-19 02:25:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(989, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:26:57', '2025-05-19 02:26:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(990, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:27:07', '2025-05-19 02:27:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(991, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:27:13', '2025-05-19 02:27:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(992, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:27:18', '2025-05-19 02:27:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(993, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:27:22', '2025-05-19 02:27:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(994, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:27:27', '2025-05-19 02:27:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(995, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:27:39', '2025-05-19 02:27:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(996, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 02:36:01', '2025-05-19 02:36:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(997, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:46:36', '2025-05-19 03:46:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(998, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:46:43', '2025-05-19 03:46:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(999, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:56:48', '2025-05-19 03:56:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1000, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:57:00', '2025-05-19 03:57:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1001, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:57:05', '2025-05-19 03:57:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1002, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:57:10', '2025-05-19 03:57:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1003, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:57:16', '2025-05-19 03:57:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1004, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:58:37', '2025-05-19 03:58:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1005, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:59:11', '2025-05-19 03:59:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1006, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:59:47', '2025-05-19 03:59:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1007, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 03:59:54', '2025-05-19 03:59:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1008, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:00:43', '2025-05-19 04:00:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1009, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:01:07', '2025-05-19 04:01:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1010, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:01:36', '2025-05-19 04:01:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1011, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:01:57', '2025-05-19 04:01:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1012, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:02:23', '2025-05-19 04:02:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1013, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:02:37', '2025-05-19 04:02:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1014, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:03:39', '2025-05-19 04:03:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1015, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:04:08', '2025-05-19 04:04:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1016, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:04:25', '2025-05-19 04:04:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1017, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:05:24', '2025-05-19 04:05:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1018, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:05:32', '2025-05-19 04:05:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1019, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:06:12', '2025-05-19 04:06:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1020, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:06:28', '2025-05-19 04:06:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1021, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:06:32', '2025-05-19 04:06:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1022, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:07:41', '2025-05-19 04:07:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1023, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:08:23', '2025-05-19 04:08:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1024, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:10:30', '2025-05-19 04:10:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1025, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:10:34', '2025-05-19 04:10:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1026, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:12:28', '2025-05-19 04:12:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1027, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:14:19', '2025-05-19 04:14:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1028, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:16:00', '2025-05-19 04:16:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1029, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:17:11', '2025-05-19 04:17:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1030, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:20:17', '2025-05-19 04:20:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1031, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:20:37', '2025-05-19 04:20:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1032, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:21:01', '2025-05-19 04:21:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1033, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:21:15', '2025-05-19 04:21:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1034, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:21:28', '2025-05-19 04:21:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1035, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:23:16', '2025-05-19 04:23:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1036, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:24:36', '2025-05-19 04:24:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1037, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:25:24', '2025-05-19 04:25:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1038, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:26:29', '2025-05-19 04:26:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1039, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:27:20', '2025-05-19 04:27:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1040, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:27:45', '2025-05-19 04:27:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1041, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:27:48', '2025-05-19 04:27:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1042, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:27:51', '2025-05-19 04:27:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1043, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:28:57', '2025-05-19 04:28:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1044, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:29:42', '2025-05-19 04:29:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1045, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:29:52', '2025-05-19 04:29:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1046, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:30:11', '2025-05-19 04:30:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1047, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:31:26', '2025-05-19 04:31:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1048, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:33:49', '2025-05-19 04:33:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1049, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:36:32', '2025-05-19 04:36:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1050, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:37:07', '2025-05-19 04:37:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1051, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:37:20', '2025-05-19 04:37:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1052, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:37:24', '2025-05-19 04:37:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1053, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:37:26', '2025-05-19 04:37:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1054, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:37:28', '2025-05-19 04:37:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1055, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:37:45', '2025-05-19 04:37:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1056, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:37:52', '2025-05-19 04:37:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1057, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:38:27', '2025-05-19 04:38:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1058, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:38:30', '2025-05-19 04:38:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1059, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:38:32', '2025-05-19 04:38:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1060, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:38:35', '2025-05-19 04:38:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1061, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:38:39', '2025-05-19 04:38:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1062, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:38:48', '2025-05-19 04:38:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1063, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:39:09', '2025-05-19 04:39:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1064, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:43:30', '2025-05-19 04:43:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1065, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:45:00', '2025-05-19 04:45:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1066, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:46:07', '2025-05-19 04:46:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1067, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 04:47:12', '2025-05-19 04:47:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1068, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:04:19', '2025-05-19 05:04:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1069, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:05:19', '2025-05-19 05:05:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1070, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:06:27', '2025-05-19 05:06:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1071, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:14:20', '2025-05-19 05:14:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1072, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:14:30', '2025-05-19 05:14:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1073, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:14:39', '2025-05-19 05:14:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1074, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:14:50', '2025-05-19 05:14:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1075, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:16:47', '2025-05-19 05:16:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1076, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:20:13', '2025-05-19 05:20:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1077, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:20:38', '2025-05-19 05:20:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1078, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:20:46', '2025-05-19 05:20:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1079, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:21:11', '2025-05-19 05:21:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1080, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:21:27', '2025-05-19 05:21:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1081, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:21:41', '2025-05-19 05:21:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1082, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:24:33', '2025-05-19 05:24:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1083, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:24:47', '2025-05-19 05:24:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1084, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:26:09', '2025-05-19 05:26:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1085, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:26:18', '2025-05-19 05:26:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1086, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:26:34', '2025-05-19 05:26:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1087, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:26:57', '2025-05-19 05:26:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1088, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:27:07', '2025-05-19 05:27:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1089, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:27:15', '2025-05-19 05:27:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1090, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:27:16', '2025-05-19 05:27:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1091, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:27:25', '2025-05-19 05:27:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1092, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:27:35', '2025-05-19 05:27:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1093, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:27:38', '2025-05-19 05:27:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1094, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:27:38', '2025-05-19 05:27:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1095, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:27:46', '2025-05-19 05:27:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1096, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:27:56', '2025-05-19 05:27:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1097, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:31:48', '2025-05-19 05:31:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1098, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:31:55', '2025-05-19 05:31:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1099, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:34:44', '2025-05-19 05:34:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1100, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:34:47', '2025-05-19 05:34:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1101, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:34:52', '2025-05-19 05:34:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1102, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:34:56', '2025-05-19 05:34:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1103, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:35:00', '2025-05-19 05:35:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1104, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:35:03', '2025-05-19 05:35:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1105, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:35:40', '2025-05-19 05:35:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1106, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:35:44', '2025-05-19 05:35:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1107, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:35:47', '2025-05-19 05:35:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1108, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:35:50', '2025-05-19 05:35:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1109, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:39:06', '2025-05-19 05:39:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1110, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:41:48', '2025-05-19 05:41:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1111, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:44:06', '2025-05-19 05:44:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1112, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:44:26', '2025-05-19 05:44:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1113, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:44:53', '2025-05-19 05:44:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1114, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:46:10', '2025-05-19 05:46:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1');
INSERT INTO `device` (`id`, `device_type`, `device_name`, `user_id`, `user_type`, `created_at`, `updated_at`, `browser`, `browser_version`, `platform`, `platform_version`, `ip_address`) VALUES
(1115, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:46:41', '2025-05-19 05:46:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1116, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:47:24', '2025-05-19 05:47:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1117, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:47:50', '2025-05-19 05:47:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1118, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:48:01', '2025-05-19 05:48:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1119, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:48:10', '2025-05-19 05:48:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1120, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:48:31', '2025-05-19 05:48:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1121, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:48:34', '2025-05-19 05:48:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1122, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:48:42', '2025-05-19 05:48:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1123, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:50:09', '2025-05-19 05:50:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1124, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:51:34', '2025-05-19 05:51:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1125, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:51:49', '2025-05-19 05:51:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1126, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:51:55', '2025-05-19 05:51:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1127, 'WebKit', 'Desktop', NULL, NULL, '2025-05-19 05:52:39', '2025-05-19 05:52:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1128, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:24:27', '2025-05-20 01:24:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1129, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:25:03', '2025-05-20 01:25:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1130, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:25:13', '2025-05-20 01:25:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1131, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:25:16', '2025-05-20 01:25:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1132, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:25:18', '2025-05-20 01:25:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1133, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:28:29', '2025-05-20 01:28:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1134, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:28:33', '2025-05-20 01:28:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1135, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:31:13', '2025-05-20 01:31:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1136, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:31:14', '2025-05-20 01:31:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1137, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:31:24', '2025-05-20 01:31:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1138, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:31:29', '2025-05-20 01:31:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1139, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:31:36', '2025-05-20 01:31:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1140, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:44:15', '2025-05-20 01:44:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1141, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:44:22', '2025-05-20 01:44:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1142, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:44:42', '2025-05-20 01:44:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1143, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:45:02', '2025-05-20 01:45:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1144, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:45:09', '2025-05-20 01:45:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1145, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:46:31', '2025-05-20 01:46:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1146, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:46:40', '2025-05-20 01:46:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1147, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:47:13', '2025-05-20 01:47:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1148, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:47:19', '2025-05-20 01:47:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1149, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:47:24', '2025-05-20 01:47:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1150, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:47:37', '2025-05-20 01:47:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1151, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:48:31', '2025-05-20 01:48:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1152, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:49:15', '2025-05-20 01:49:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1153, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:49:20', '2025-05-20 01:49:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1154, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:52:45', '2025-05-20 01:52:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1155, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:52:50', '2025-05-20 01:52:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1156, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:55:36', '2025-05-20 01:55:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1157, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 01:57:34', '2025-05-20 01:57:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1158, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:00:33', '2025-05-20 02:00:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1159, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:00:55', '2025-05-20 02:00:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1160, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:01:46', '2025-05-20 02:01:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1161, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:02:28', '2025-05-20 02:02:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1162, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:04:28', '2025-05-20 02:04:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1163, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:05:34', '2025-05-20 02:05:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1164, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:06:45', '2025-05-20 02:06:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1165, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:07:07', '2025-05-20 02:07:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1166, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:07:10', '2025-05-20 02:07:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1167, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:07:42', '2025-05-20 02:07:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1168, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:07:49', '2025-05-20 02:07:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1169, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:08:00', '2025-05-20 02:08:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1170, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:09:00', '2025-05-20 02:09:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1171, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:09:08', '2025-05-20 02:09:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1172, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:12:08', '2025-05-20 02:12:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1173, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:15:21', '2025-05-20 02:15:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1174, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:16:25', '2025-05-20 02:16:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1175, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:18:54', '2025-05-20 02:18:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1176, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:19:51', '2025-05-20 02:19:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1177, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:20:00', '2025-05-20 02:20:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1178, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:20:16', '2025-05-20 02:20:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1179, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:20:24', '2025-05-20 02:20:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1180, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:20:35', '2025-05-20 02:20:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1181, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:20:49', '2025-05-20 02:20:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1182, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:21:06', '2025-05-20 02:21:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1183, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:21:13', '2025-05-20 02:21:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1184, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:21:52', '2025-05-20 02:21:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1185, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:22:16', '2025-05-20 02:22:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1186, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:22:30', '2025-05-20 02:22:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1187, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:22:42', '2025-05-20 02:22:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1188, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:22:52', '2025-05-20 02:22:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1189, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:23:12', '2025-05-20 02:23:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1190, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:23:42', '2025-05-20 02:23:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1191, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:23:51', '2025-05-20 02:23:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1192, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:24:19', '2025-05-20 02:24:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1193, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:24:30', '2025-05-20 02:24:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1194, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:24:38', '2025-05-20 02:24:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1195, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:25:52', '2025-05-20 02:25:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1196, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:26:03', '2025-05-20 02:26:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1197, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:26:11', '2025-05-20 02:26:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1198, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:27:47', '2025-05-20 02:27:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1199, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:28:49', '2025-05-20 02:28:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1200, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:29:09', '2025-05-20 02:29:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1201, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:30:47', '2025-05-20 02:30:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1202, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:31:45', '2025-05-20 02:31:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1203, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:31:50', '2025-05-20 02:31:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1204, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:35:28', '2025-05-20 02:35:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1205, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:36:11', '2025-05-20 02:36:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1206, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:36:32', '2025-05-20 02:36:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1207, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:38:15', '2025-05-20 02:38:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1208, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:38:29', '2025-05-20 02:38:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1209, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:42:00', '2025-05-20 02:42:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1210, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:43:21', '2025-05-20 02:43:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1211, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:43:38', '2025-05-20 02:43:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1212, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:43:47', '2025-05-20 02:43:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1213, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:47:07', '2025-05-20 02:47:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1214, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:47:19', '2025-05-20 02:47:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1215, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:49:19', '2025-05-20 02:49:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1216, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:49:25', '2025-05-20 02:49:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1217, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:50:10', '2025-05-20 02:50:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1218, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:50:14', '2025-05-20 02:50:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1219, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:50:15', '2025-05-20 02:50:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1220, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:52:44', '2025-05-20 02:52:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1221, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:52:49', '2025-05-20 02:52:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1222, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:53:11', '2025-05-20 02:53:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1223, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:53:17', '2025-05-20 02:53:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1224, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:53:17', '2025-05-20 02:53:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1225, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:58:35', '2025-05-20 02:58:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1226, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:59:17', '2025-05-20 02:59:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1227, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:59:32', '2025-05-20 02:59:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1228, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 02:59:44', '2025-05-20 02:59:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1229, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:14:00', '2025-05-20 03:14:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1230, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:14:18', '2025-05-20 03:14:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1231, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:15:04', '2025-05-20 03:15:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1232, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:15:16', '2025-05-20 03:15:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1233, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:15:27', '2025-05-20 03:15:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1234, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:15:58', '2025-05-20 03:15:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1235, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:16:34', '2025-05-20 03:16:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1236, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:20:40', '2025-05-20 03:20:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1237, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:21:14', '2025-05-20 03:21:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1238, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:21:39', '2025-05-20 03:21:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1239, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:21:58', '2025-05-20 03:21:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1240, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:22:07', '2025-05-20 03:22:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1241, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:23:08', '2025-05-20 03:23:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1242, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:23:33', '2025-05-20 03:23:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1243, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:24:06', '2025-05-20 03:24:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1244, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:24:11', '2025-05-20 03:24:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1245, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:24:16', '2025-05-20 03:24:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1246, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:24:17', '2025-05-20 03:24:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1247, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:24:26', '2025-05-20 03:24:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1248, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:24:36', '2025-05-20 03:24:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1249, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:24:37', '2025-05-20 03:24:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1250, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:25:54', '2025-05-20 03:25:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1251, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:26:18', '2025-05-20 03:26:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1252, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:26:22', '2025-05-20 03:26:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1253, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:26:52', '2025-05-20 03:26:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1254, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:26:56', '2025-05-20 03:26:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1255, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:27:03', '2025-05-20 03:27:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1256, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:27:03', '2025-05-20 03:27:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1257, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:27:07', '2025-05-20 03:27:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1258, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:27:14', '2025-05-20 03:27:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1259, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:27:14', '2025-05-20 03:27:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1260, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:27:37', '2025-05-20 03:27:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1261, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:27:47', '2025-05-20 03:27:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1262, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:28:13', '2025-05-20 03:28:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1263, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:28:22', '2025-05-20 03:28:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1264, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:28:35', '2025-05-20 03:28:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1265, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:28:53', '2025-05-20 03:28:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1266, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:29:36', '2025-05-20 03:29:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1267, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:30:17', '2025-05-20 03:30:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1268, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 03:33:43', '2025-05-20 03:33:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1269, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:11:38', '2025-05-20 04:11:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1270, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:23:40', '2025-05-20 04:23:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1271, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:25:21', '2025-05-20 04:25:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1272, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:26:29', '2025-05-20 04:26:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1273, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:26:35', '2025-05-20 04:26:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1274, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:26:59', '2025-05-20 04:26:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1275, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:27:37', '2025-05-20 04:27:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1276, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:28:21', '2025-05-20 04:28:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1277, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:28:53', '2025-05-20 04:28:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1278, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:29:15', '2025-05-20 04:29:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1279, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:29:34', '2025-05-20 04:29:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1280, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:30:03', '2025-05-20 04:30:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1281, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:30:16', '2025-05-20 04:30:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1282, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:30:31', '2025-05-20 04:30:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1283, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:30:41', '2025-05-20 04:30:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1284, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:32:20', '2025-05-20 04:32:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1285, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:32:38', '2025-05-20 04:32:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1286, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:36:20', '2025-05-20 04:36:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1287, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:39:38', '2025-05-20 04:39:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1288, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:40:00', '2025-05-20 04:40:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1289, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:40:48', '2025-05-20 04:40:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1290, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:41:15', '2025-05-20 04:41:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1291, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:41:27', '2025-05-20 04:41:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1292, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:41:38', '2025-05-20 04:41:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1293, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:41:45', '2025-05-20 04:41:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1294, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:41:57', '2025-05-20 04:41:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1295, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:42:54', '2025-05-20 04:42:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1296, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:43:42', '2025-05-20 04:43:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1297, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:44:07', '2025-05-20 04:44:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1298, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:46:33', '2025-05-20 04:46:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1299, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:47:57', '2025-05-20 04:47:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1300, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:48:25', '2025-05-20 04:48:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1301, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:48:50', '2025-05-20 04:48:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1302, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:49:16', '2025-05-20 04:49:16', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1303, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:49:30', '2025-05-20 04:49:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1304, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:49:46', '2025-05-20 04:49:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1305, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:50:23', '2025-05-20 04:50:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1306, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:50:41', '2025-05-20 04:50:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1307, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 04:50:47', '2025-05-20 04:50:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1308, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:05:09', '2025-05-20 05:05:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1309, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:06:34', '2025-05-20 05:06:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1310, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:07:38', '2025-05-20 05:07:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1311, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:07:48', '2025-05-20 05:07:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1312, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:08:09', '2025-05-20 05:08:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1313, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:09:05', '2025-05-20 05:09:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1314, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:09:24', '2025-05-20 05:09:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1315, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:09:32', '2025-05-20 05:09:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1316, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:10:55', '2025-05-20 05:10:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1317, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:13:17', '2025-05-20 05:13:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1318, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:13:31', '2025-05-20 05:13:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1319, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:13:42', '2025-05-20 05:13:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1320, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:13:53', '2025-05-20 05:13:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1321, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:14:20', '2025-05-20 05:14:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1322, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:14:32', '2025-05-20 05:14:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1323, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:15:59', '2025-05-20 05:15:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1324, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:16:17', '2025-05-20 05:16:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1325, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:16:24', '2025-05-20 05:16:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1326, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:16:43', '2025-05-20 05:16:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1327, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:16:52', '2025-05-20 05:16:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1328, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:17:03', '2025-05-20 05:17:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1329, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:17:12', '2025-05-20 05:17:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1330, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:17:58', '2025-05-20 05:17:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1331, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:18:14', '2025-05-20 05:18:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1332, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:19:50', '2025-05-20 05:19:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1333, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:20:20', '2025-05-20 05:20:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1334, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:20:54', '2025-05-20 05:20:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1335, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:21:17', '2025-05-20 05:21:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1336, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:22:41', '2025-05-20 05:22:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1337, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:23:58', '2025-05-20 05:23:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1338, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:24:53', '2025-05-20 05:24:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1339, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:25:10', '2025-05-20 05:25:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1340, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:27:38', '2025-05-20 05:27:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1341, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:30:08', '2025-05-20 05:30:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1342, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:31:10', '2025-05-20 05:31:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1343, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:31:23', '2025-05-20 05:31:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1344, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:32:19', '2025-05-20 05:32:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1345, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:33:15', '2025-05-20 05:33:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1346, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:33:26', '2025-05-20 05:33:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1347, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:33:43', '2025-05-20 05:33:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1348, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:33:47', '2025-05-20 05:33:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1349, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:34:04', '2025-05-20 05:34:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1350, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:34:08', '2025-05-20 05:34:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1351, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:34:19', '2025-05-20 05:34:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1352, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:34:31', '2025-05-20 05:34:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1353, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:35:06', '2025-05-20 05:35:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1354, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:35:19', '2025-05-20 05:35:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1355, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:35:33', '2025-05-20 05:35:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1356, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:36:18', '2025-05-20 05:36:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1357, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:36:30', '2025-05-20 05:36:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1358, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:36:52', '2025-05-20 05:36:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1359, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:37:10', '2025-05-20 05:37:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1360, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:37:24', '2025-05-20 05:37:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1361, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:37:43', '2025-05-20 05:37:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1362, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:37:56', '2025-05-20 05:37:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1363, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:38:23', '2025-05-20 05:38:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1364, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:38:34', '2025-05-20 05:38:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1365, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:39:27', '2025-05-20 05:39:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1366, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:39:54', '2025-05-20 05:39:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1367, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:40:41', '2025-05-20 05:40:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1368, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:45:03', '2025-05-20 05:45:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1369, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:45:18', '2025-05-20 05:45:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1370, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:45:35', '2025-05-20 05:45:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1371, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:45:47', '2025-05-20 05:45:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1372, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:46:22', '2025-05-20 05:46:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1373, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:47:54', '2025-05-20 05:47:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1374, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:48:23', '2025-05-20 05:48:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1375, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:48:36', '2025-05-20 05:48:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1376, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:48:43', '2025-05-20 05:48:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1377, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:52:07', '2025-05-20 05:52:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1378, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:52:52', '2025-05-20 05:52:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1379, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:52:55', '2025-05-20 05:52:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1380, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:52:58', '2025-05-20 05:52:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1381, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:53:02', '2025-05-20 05:53:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1382, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:53:05', '2025-05-20 05:53:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1383, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:53:09', '2025-05-20 05:53:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1384, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 05:53:13', '2025-05-20 05:53:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1385, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:12:43', '2025-05-20 06:12:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1386, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:13:25', '2025-05-20 06:13:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1387, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:13:37', '2025-05-20 06:13:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1388, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:14:58', '2025-05-20 06:14:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1389, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:15:51', '2025-05-20 06:15:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1390, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:17:06', '2025-05-20 06:17:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1391, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:17:19', '2025-05-20 06:17:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1392, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:17:43', '2025-05-20 06:17:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1393, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:18:34', '2025-05-20 06:18:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1394, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:18:43', '2025-05-20 06:18:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1395, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:19:31', '2025-05-20 06:19:31', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1396, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:21:11', '2025-05-20 06:21:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1397, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:22:53', '2025-05-20 06:22:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1398, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:23:22', '2025-05-20 06:23:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1399, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:24:00', '2025-05-20 06:24:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1400, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:24:49', '2025-05-20 06:24:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1401, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:25:26', '2025-05-20 06:25:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1402, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:26:00', '2025-05-20 06:26:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1403, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:26:18', '2025-05-20 06:26:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1404, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:26:34', '2025-05-20 06:26:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1405, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:27:30', '2025-05-20 06:27:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1406, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:27:43', '2025-05-20 06:27:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1407, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:28:09', '2025-05-20 06:28:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1408, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:28:21', '2025-05-20 06:28:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1409, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:28:36', '2025-05-20 06:28:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1410, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:29:04', '2025-05-20 06:29:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1411, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:29:42', '2025-05-20 06:29:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1412, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:30:01', '2025-05-20 06:30:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1413, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:31:20', '2025-05-20 06:31:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1414, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:31:34', '2025-05-20 06:31:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1415, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:32:12', '2025-05-20 06:32:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1416, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:32:38', '2025-05-20 06:32:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1417, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:33:39', '2025-05-20 06:33:39', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1418, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:34:12', '2025-05-20 06:34:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1419, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:34:54', '2025-05-20 06:34:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1420, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:35:10', '2025-05-20 06:35:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1421, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:35:26', '2025-05-20 06:35:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1422, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:35:35', '2025-05-20 06:35:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1423, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:35:44', '2025-05-20 06:35:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1424, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:35:52', '2025-05-20 06:35:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1425, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:35:55', '2025-05-20 06:35:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1426, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:35:58', '2025-05-20 06:35:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1427, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:36:00', '2025-05-20 06:36:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1428, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:36:02', '2025-05-20 06:36:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1429, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:36:04', '2025-05-20 06:36:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1430, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:36:06', '2025-05-20 06:36:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1431, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:36:08', '2025-05-20 06:36:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1432, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:36:18', '2025-05-20 06:36:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1433, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:37:30', '2025-05-20 06:37:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1434, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:37:47', '2025-05-20 06:37:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1435, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:37:50', '2025-05-20 06:37:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1436, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:37:54', '2025-05-20 06:37:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1437, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:38:32', '2025-05-20 06:38:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1438, 'WebKit', 'Desktop', NULL, NULL, '2025-05-20 06:38:38', '2025-05-20 06:38:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1439, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 00:26:41', '2025-05-21 00:26:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1440, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 00:26:48', '2025-05-21 00:26:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1441, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 00:27:00', '2025-05-21 00:27:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1442, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 00:27:03', '2025-05-21 00:27:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1443, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 00:27:35', '2025-05-21 00:27:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1444, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 00:27:59', '2025-05-21 00:27:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1445, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 00:28:29', '2025-05-21 00:28:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1446, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 00:28:32', '2025-05-21 00:28:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1447, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 00:43:08', '2025-05-21 00:43:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1448, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:31:09', '2025-05-21 03:31:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1449, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:31:17', '2025-05-21 03:31:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1450, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:31:19', '2025-05-21 03:31:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1451, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:36:34', '2025-05-21 03:36:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1452, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:36:51', '2025-05-21 03:36:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1453, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:37:02', '2025-05-21 03:37:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1454, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:38:11', '2025-05-21 03:38:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1455, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:38:42', '2025-05-21 03:38:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1456, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:38:55', '2025-05-21 03:38:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1457, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:38:58', '2025-05-21 03:38:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1458, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:39:03', '2025-05-21 03:39:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1459, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:39:06', '2025-05-21 03:39:06', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1460, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:39:30', '2025-05-21 03:39:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1461, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:39:37', '2025-05-21 03:39:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1462, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:39:44', '2025-05-21 03:39:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1463, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:52:54', '2025-05-21 03:52:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1464, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:54:50', '2025-05-21 03:54:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1465, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:55:45', '2025-05-21 03:55:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1466, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:56:54', '2025-05-21 03:56:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1467, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:56:57', '2025-05-21 03:56:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1468, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:57:58', '2025-05-21 03:57:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1469, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 03:58:02', '2025-05-21 03:58:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1470, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:01:05', '2025-05-21 04:01:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1471, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:01:24', '2025-05-21 04:01:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1472, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:02:19', '2025-05-21 04:02:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1473, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:03:33', '2025-05-21 04:03:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1474, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:03:37', '2025-05-21 04:03:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1475, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:04:58', '2025-05-21 04:04:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1476, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:08:51', '2025-05-21 04:08:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1477, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:11:53', '2025-05-21 04:11:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1478, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:17:57', '2025-05-21 04:17:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1479, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:18:32', '2025-05-21 04:18:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1480, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:20:25', '2025-05-21 04:20:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1481, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:21:22', '2025-05-21 04:21:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1482, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:31:45', '2025-05-21 04:31:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1');
INSERT INTO `device` (`id`, `device_type`, `device_name`, `user_id`, `user_type`, `created_at`, `updated_at`, `browser`, `browser_version`, `platform`, `platform_version`, `ip_address`) VALUES
(1483, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:33:02', '2025-05-21 04:33:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1484, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:33:53', '2025-05-21 04:33:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1485, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:34:47', '2025-05-21 04:34:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1486, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:34:50', '2025-05-21 04:34:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1487, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:34:53', '2025-05-21 04:34:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1488, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:34:55', '2025-05-21 04:34:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1489, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:34:59', '2025-05-21 04:34:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1490, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:35:03', '2025-05-21 04:35:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1491, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:35:14', '2025-05-21 04:35:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1492, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:35:17', '2025-05-21 04:35:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1493, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:35:38', '2025-05-21 04:35:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1494, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:35:48', '2025-05-21 04:35:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1495, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:36:00', '2025-05-21 04:36:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1496, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:37:13', '2025-05-21 04:37:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1497, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:37:20', '2025-05-21 04:37:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1498, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:37:25', '2025-05-21 04:37:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1499, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:37:51', '2025-05-21 04:37:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1500, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:38:15', '2025-05-21 04:38:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1501, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:38:28', '2025-05-21 04:38:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1502, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:39:07', '2025-05-21 04:39:07', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1503, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:40:27', '2025-05-21 04:40:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1504, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:41:00', '2025-05-21 04:41:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1505, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:41:05', '2025-05-21 04:41:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1506, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:45:10', '2025-05-21 04:45:10', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1507, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:45:17', '2025-05-21 04:45:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1508, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:47:17', '2025-05-21 04:47:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1509, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:47:20', '2025-05-21 04:47:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1510, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:47:24', '2025-05-21 04:47:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1511, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:47:41', '2025-05-21 04:47:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1512, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:48:54', '2025-05-21 04:48:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1513, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:50:32', '2025-05-21 04:50:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1514, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:51:26', '2025-05-21 04:51:26', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1515, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:51:33', '2025-05-21 04:51:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1516, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:51:38', '2025-05-21 04:51:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1517, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:51:41', '2025-05-21 04:51:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1518, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:51:45', '2025-05-21 04:51:45', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1519, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:51:49', '2025-05-21 04:51:49', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1520, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:52:19', '2025-05-21 04:52:19', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1521, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:52:22', '2025-05-21 04:52:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1522, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:52:25', '2025-05-21 04:52:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1523, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:52:28', '2025-05-21 04:52:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1524, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:52:32', '2025-05-21 04:52:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1525, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:52:36', '2025-05-21 04:52:36', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1526, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:52:40', '2025-05-21 04:52:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1527, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:53:57', '2025-05-21 04:53:57', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1528, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:54:00', '2025-05-21 04:54:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1529, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:54:05', '2025-05-21 04:54:05', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1530, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:54:08', '2025-05-21 04:54:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1531, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:54:12', '2025-05-21 04:54:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1532, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:54:15', '2025-05-21 04:54:15', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1533, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:54:37', '2025-05-21 04:54:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1534, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:55:33', '2025-05-21 04:55:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1535, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:55:41', '2025-05-21 04:55:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1536, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:55:43', '2025-05-21 04:55:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1537, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:55:46', '2025-05-21 04:55:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1538, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:55:48', '2025-05-21 04:55:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1539, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:55:50', '2025-05-21 04:55:50', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1540, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:55:51', '2025-05-21 04:55:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1541, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:55:52', '2025-05-21 04:55:52', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1542, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:55:54', '2025-05-21 04:55:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1543, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:55:56', '2025-05-21 04:55:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1544, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:02', '2025-05-21 04:56:02', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1545, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:08', '2025-05-21 04:56:08', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1546, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:13', '2025-05-21 04:56:13', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1547, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:18', '2025-05-21 04:56:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1548, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:23', '2025-05-21 04:56:23', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1549, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:28', '2025-05-21 04:56:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1550, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:32', '2025-05-21 04:56:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1551, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:37', '2025-05-21 04:56:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1552, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:42', '2025-05-21 04:56:42', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1553, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:44', '2025-05-21 04:56:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1554, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:48', '2025-05-21 04:56:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1555, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:56:51', '2025-05-21 04:56:51', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1556, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 04:59:17', '2025-05-21 04:59:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1557, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:08:41', '2025-05-21 05:08:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1558, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:08:47', '2025-05-21 05:08:47', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1559, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:09:37', '2025-05-21 05:09:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1560, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:10:40', '2025-05-21 05:10:40', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1561, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:11:00', '2025-05-21 05:11:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1562, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:11:11', '2025-05-21 05:11:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1563, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:11:34', '2025-05-21 05:11:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1564, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:12:03', '2025-05-21 05:12:03', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1565, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:12:12', '2025-05-21 05:12:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1566, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:12:59', '2025-05-21 05:12:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1567, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:14:24', '2025-05-21 05:14:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1568, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:15:01', '2025-05-21 05:15:01', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1569, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:15:09', '2025-05-21 05:15:09', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1570, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:15:14', '2025-05-21 05:15:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1571, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:15:18', '2025-05-21 05:15:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1572, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:15:35', '2025-05-21 05:15:35', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1573, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:16:14', '2025-05-21 05:16:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1574, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:16:17', '2025-05-21 05:16:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1575, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:16:21', '2025-05-21 05:16:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1576, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:16:27', '2025-05-21 05:16:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1577, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:16:30', '2025-05-21 05:16:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1578, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:16:44', '2025-05-21 05:16:44', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1579, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:16:59', '2025-05-21 05:16:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1580, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:17:04', '2025-05-21 05:17:04', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1581, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:17:46', '2025-05-21 05:17:46', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1582, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:17:59', '2025-05-21 05:17:59', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1583, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:21:14', '2025-05-21 05:21:14', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1584, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:21:18', '2025-05-21 05:21:18', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1585, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:22:54', '2025-05-21 05:22:54', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1586, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:23:25', '2025-05-21 05:23:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1587, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:23:34', '2025-05-21 05:23:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1588, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:23:56', '2025-05-21 05:23:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1589, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:24:12', '2025-05-21 05:24:12', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1590, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:24:25', '2025-05-21 05:24:25', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1591, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:24:37', '2025-05-21 05:24:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1592, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:27:30', '2025-05-21 05:27:30', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1593, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:27:53', '2025-05-21 05:27:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1594, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:28:27', '2025-05-21 05:28:27', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1595, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:29:37', '2025-05-21 05:29:37', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1596, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:31:34', '2025-05-21 05:31:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1597, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:31:48', '2025-05-21 05:31:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1598, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:31:56', '2025-05-21 05:31:56', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1599, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 05:32:20', '2025-05-21 05:32:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1600, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:42:33', '2025-05-21 06:42:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1601, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:44:21', '2025-05-21 06:44:21', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1602, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:45:20', '2025-05-21 06:45:20', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1603, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:46:00', '2025-05-21 06:46:00', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1604, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:46:28', '2025-05-21 06:46:28', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1605, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:46:32', '2025-05-21 06:46:32', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1606, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:47:17', '2025-05-21 06:47:17', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1607, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:47:22', '2025-05-21 06:47:22', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1608, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:47:43', '2025-05-21 06:47:43', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1609, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:47:48', '2025-05-21 06:47:48', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1610, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:49:34', '2025-05-21 06:49:34', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1611, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:49:38', '2025-05-21 06:49:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1612, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:49:41', '2025-05-21 06:49:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1613, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:49:53', '2025-05-21 06:49:53', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1614, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:49:55', '2025-05-21 06:49:55', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1615, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:49:58', '2025-05-21 06:49:58', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1616, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:50:24', '2025-05-21 06:50:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1617, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:50:29', '2025-05-21 06:50:29', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1618, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:50:33', '2025-05-21 06:50:33', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1619, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:50:38', '2025-05-21 06:50:38', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1620, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:50:41', '2025-05-21 06:50:41', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1621, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:51:24', '2025-05-21 06:51:24', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1'),
(1622, 'WebKit', 'Desktop', NULL, NULL, '2025-05-21 06:52:11', '2025-05-21 06:52:11', 'Chrome', '136.0.0.0', 'Linux', '0', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `stock_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

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
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_activities`
--

CREATE TABLE `log_activities` (
  `id` int UNSIGNED NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `material_name`, `created_at`, `updated_at`) VALUES
(1, 'Wood', '2025-05-11 09:41:45', '2025-05-11 09:41:45'),
(2, 'Iron', '2025-05-11 09:41:45', '2025-05-11 09:41:45'),
(5, 'PC/Acrylic', '2025-05-11 09:42:26', '2025-05-11 09:42:26'),
(7, 'PP', '2025-05-11 09:43:01', '2025-05-11 09:43:01'),
(8, 'SS', '2025-05-11 09:43:31', '2025-05-11 09:43:31'),
(9, 'Aluminium', '2025-05-11 09:43:50', '2025-05-11 09:43:50'),
(10, 'Glass', '2025-05-11 09:43:58', '2025-05-11 09:43:58'),
(11, 'Fabric', '2025-05-11 09:44:07', '2025-05-11 09:44:07'),
(12, 'Others', '2025-05-11 09:44:15', '2025-05-11 09:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_02_111629_create_activity_log_table', 1),
(5, '2025_05_06_113004_add_event_column_to_activity_log_table', 1),
(6, '2025_05_06_113005_add_batch_uuid_column_to_activity_log_table', 1),
(7, '2025_05_09_110226_create_banners_table', 2),
(8, '2025_05_13_064427_create_carts_table', 3),
(9, '2025_05_13_064841_create_orders_table', 4),
(10, '2025_05_21_060708_create_popular_searches_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_email`, `user_phone`, `status`, `total`, `created_at`, `updated_at`) VALUES
(3, 1, NULL, '7046465601', 'processing', 585000.00, '2025-05-20 03:24:36', '2025-05-20 03:24:36'),
(4, 1, NULL, '7046465601', 'processing', 350000.00, '2025-05-20 03:27:14', '2025-05-20 03:27:14');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL DEFAULT '1',
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(6, 3, 222, 100, 2350.00, '2025-05-20 03:24:36', '2025-05-20 03:24:36'),
(7, 3, 218, 100, 3500.00, '2025-05-20 03:24:36', '2025-05-20 03:24:36'),
(8, 4, 218, 100, 3500.00, '2025-05-20 03:27:14', '2025-05-20 03:27:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `popular_searches`
--

CREATE TABLE `popular_searches` (
  `id` bigint UNSIGNED NOT NULL,
  `term` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `count` bigint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `popular_searches`
--

INSERT INTO `popular_searches` (`id`, `term`, `count`, `created_at`, `updated_at`) VALUES
(1, 'sofa', 14, '2025-05-21 05:24:25', '2025-05-21 06:50:24'),
(2, 'Heater', 8, '2025-05-21 05:31:56', '2025-05-21 06:49:58');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `product_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vendor_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `quantity_range` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(100) NOT NULL,
  `material` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `image_name`, `vendor_code`, `description`, `quantity_range`, `product_price`, `category`, `material`, `created_at`, `updated_at`) VALUES
(216, 'CHAIR', 'V13A.jpg', 'V13', 'BAR CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '2500, 2600, 2700, 2800, 2900, 3000', 'Furniture, Chair, Bar Chair', 'Iron', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(217, 'CHAIR', 'V27Q.jpg', 'V27', 'BAR CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '5000, 5100, 5200, 5300, 5400, 5500', 'Furniture, Chair, Bar Chair', 'SS', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(218, 'CHAIR', 'V15DK.jpg', 'V15', 'BAR CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '3100, 3200, 3300, 3400, 3500, 3600', 'Furniture, Chair, Bar Chair', 'Wood', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(219, 'CHAIR', 'V2B.jpg', 'V2', 'CHORME CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '2150, 2200, 2250, 2300, 2350, 2400', 'Furniture, Sofa, Dining Chair', 'Iron', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(220, 'CHAIR', 'V27P.jpg', 'V27', 'CHORME CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '3500, 3600, 3700, 3800, 3900, 4000', 'Furniture, Sofa, Dining Chair', 'Iron', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(221, 'CHAIR', 'V6CW.jpg', 'V6', 'CHORME CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '5000, 5100, 5200, 5300, 5400, 5500', 'Furniture, Sofa, Dining Chair', 'Iron', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(222, 'CHAIR', 'PB1.jpg', 'V2', 'PHOTOBOOTH CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '2150, 2200, 2250, 2300, 2350, 2400', 'Furniture, Chair, Photobooth', 'SS', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(223, 'CHAIR', 'PB2.jpg', 'V2', 'PHOTOBOOTH CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '2500, 2600, 2700, 2800, 2900, 3000', 'Furniture, Chair, Photobooth', 'SS', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(224, 'CHAIR', 'PB3.jpeg', 'V2', 'PHOTOBOOTH CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '2500, 2600, 2700, 2800, 2900, 3000', 'Furniture, Chair, Photobooth', 'SS', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(225, 'CHAIR', 'V6I.jpg', 'V6', 'PRIMIUM CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '5000, 5100, 5200, 5300, 5400, 5500', 'Furniture, Chair, Dining Chair', 'Aluminium', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(226, 'CHAIR', 'V6CU.jpg', 'V6', 'PRIMIUM CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '3100, 3200, 3300, 3400, 3500, 3600', 'Furniture, Chair, Dining Chair', 'Aluminium', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(227, 'CHAIR', 'V18D.jpg', 'V18', 'PRIMIUM CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '2150, 2200, 2250, 2300, 2350, 2400', 'Furniture, Chair, Dining Chair', 'Aluminium', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(228, 'CHAIR', 'V6BH.jpg', 'V6', 'WOOD CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '3500, 3600, 3700, 3800, 3900, 4000', 'Furniture, Chair, Guest / Invitee', 'Wood', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(229, 'CHAIR', 'V6D.png', 'V6', 'WOOD CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '5000, 5100, 5200, 5300, 5400, 5500', 'Furniture, Chair, Guest / Invitee', 'Wood', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(230, 'CHAIR', 'V6AQ.jpg', 'V6', 'WOOD CHAIR', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '2150, 2200, 2250, 2300, 2350, 2400', 'Furniture, Chair, Guest / Invitee', 'Wood', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(231, 'SOFA', 'ST01.jpg', 'V2', 'STAGE SOFA', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '2500, 2600, 2700, 2800, 2900, 3000', 'Furniture, Sofa, Stage Sofa', 'Fabric', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(232, 'SOFA', 'ST02.jpg', 'V2', 'STAGE SOFA', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '2150, 2200, 2250, 2300, 2350, 2400', 'Furniture, Sofa, Stage Sofa', 'Fabric', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(233, 'SOFA', 'V8H1.jpg', 'V8', 'ALLUMINIUM SOFA', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '3500, 3600, 3700, 3800, 3900, 4000', 'Furniture, Sofa, Guest / Invitee', 'Aluminium', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(234, 'SOFA', 'V8E1.jpg', 'V8', 'ALLUMINIUM SOFA', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '5000, 5100, 5200, 5300, 5400, 5500', 'Furniture, Sofa, Guest / Invitee', 'Aluminium', '2025-05-15 10:28:29', '2025-05-15 10:28:29'),
(235, 'HEATER', 'HE01.jpg', 'V2', 'PIRAMID HEATER', '500+, 400-499, 300-399, 200-299, 100-199, 001-099', '2500, 2600, 2700, 2800, 2900, 3000', 'Heater-Cooler, Chair, Others', 'SS', '2025-05-15 10:28:29', '2025-05-19 09:40:27');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('NREXPZsBTrnBRBIOsnwJRAzVgNCltuTPFoNPP2ku', 1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWDVINlZlWXZKek1VVEJPNzcwaGt4OU4wems4U0tUUzd6NVBxeUt0SCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoxNjoiY3VzdG9tX2F1dGhfdXNlciI7aToxO3M6OToidXNlcl90eXBlIjtzOjU6ImFkbWluIjtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ0OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvd2ViL3Byb2R1Y3RfZGV0YWlsLzIxNiI7fX0=', 1747830131);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, '$2y$12$kwfrKEZ3bacyM4PrCzi4We5MO02c9Ch0xeR./x1adoy0DPSQXLL62', NULL, 'admin', '2025-05-02 04:11:27', '2025-05-02 04:11:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

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
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_session_id_index` (`session_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_post_name_unique` (`post_name`);

--
-- Indexes for table `content_meta`
--
ALTER TABLE `content_meta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

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
-- Indexes for table `log_activities`
--
ALTER TABLE `log_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
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
  ADD KEY `orders_user_id_foreign` (`user_id`) USING BTREE;

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `popular_searches`
--
ALTER TABLE `popular_searches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `popular_searches_term_unique` (`term`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `content_meta`
--
ALTER TABLE `content_meta`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1623;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `popular_searches`
--
ALTER TABLE `popular_searches`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
