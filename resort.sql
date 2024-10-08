-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2024 at 11:34 AM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `resort`
--

-- --------------------------------------------------------

--
-- Table structure for table `activations`
--

CREATE TABLE `activations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activations`
--

INSERT INTO `activations` (`id`, `user_id`, `code`, `completed`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, '068yMujYOpeJo4kmA4Qiv51qd7EccK0Y', 1, '2020-09-01 20:15:07', '2020-09-01 20:15:06', '2020-09-01 20:15:07'),
(2, 1, 'yH1V0D04GjlNceslIU91GHsyo1DLXYNS', 1, '2021-01-03 17:44:54', '2021-01-03 17:44:54', '2021-01-03 17:44:54'),
(3, 1, 'AHwoUIwvZ5rrYtXe84zwrnUjgYANzp9X', 1, '2021-01-03 17:45:59', '2021-01-03 17:45:59', '2021-01-03 17:45:59'),
(4, 1, 'U0kQv4TLrvDHUnEjWJGYxYbU5CLGRlWf', 1, '2021-01-05 03:29:59', '2021-01-05 03:29:59', '2021-01-05 03:29:59'),
(5, 2, 'k8CFST46WkiTGzniUmUiuBYbaugsl7wz', 1, '2024-08-17 01:22:08', '2024-08-17 01:22:08', '2024-08-17 01:22:08');

-- --------------------------------------------------------

--
-- Table structure for table `audit_histories`
--

CREATE TABLE `audit_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` int(10) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_histories`
--

INSERT INTO `audit_histories` (`id`, `user_id`, `module`, `request`, `action`, `user_agent`, `ip_address`, `reference_user`, `reference_id`, `reference_name`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2024-08-16 23:16:44', '2024-08-16 23:16:44'),
(2, 1, 'of the system', '[]', 'logged out', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'System Admin', 'info', '2024-08-16 23:48:00', '2024-08-16 23:48:00'),
(3, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2024-08-16 23:58:30', '2024-08-16 23:58:30'),
(4, 1, 'backup', '{\"name\":\"yguu\",\"description\":\"yury\"}', 'created', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 0, '', 'info', '2024-08-17 00:10:12', '2024-08-17 00:10:12'),
(5, 1, 'user', '{\"_token\":\"EP0xdsJHFFvugu4qlj7liwll5hNUtouRx6lEazWf\",\"first_name\":\"Superadmin\",\"last_name\":\"nabil\",\"username\":\"superadmin\",\"email\":\"admin1@gmail.com\",\"password\":\"superadmin\",\"password_confirmation\":\"superadmin\",\"submit\":\"save\",\"role_id\":null}', 'created', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 2, 'Superadmin Nabil', 'info', '2024-08-17 01:22:08', '2024-08-17 01:22:08'),
(6, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2024-08-17 07:17:11', '2024-08-17 07:17:11'),
(7, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2024-08-17 07:50:30', '2024-08-17 07:50:30'),
(8, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2024-08-17 07:54:04', '2024-08-17 07:54:04'),
(9, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Family Suite\",\"slug\":\"family-suite\",\"slug_id\":\"410\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"0\",\"content\":null,\"price\":\"117\",\"currency_id\":\"1\",\"number_of_rooms\":\"2\",\"number_of_beds\":\"3\",\"max_adults\":\"3\",\"max_children\":\"2\",\"size\":\"127\",\"images\":[null,\"rooms\\/05.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 5, 'Family Suite', 'primary', '2024-08-17 09:35:15', '2024-08-17 09:35:15'),
(10, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"2\",\"number_of_beds\":\"2\",\"max_adults\":\"4\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-17 09:59:07', '2024-08-17 09:59:07'),
(11, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"1\",\"number_of_beds\":\"2\",\"max_adults\":\"4\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-17 10:00:03', '2024-08-17 10:00:03'),
(12, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"5\",\"number_of_beds\":\"2\",\"max_adults\":\"4\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-17 10:00:26', '2024-08-17 10:00:26'),
(13, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"2\",\"number_of_beds\":\"2\",\"max_adults\":\"4\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-17 10:01:17', '2024-08-17 10:01:17'),
(14, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"2\",\"number_of_beds\":\"1\",\"max_adults\":\"4\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-17 10:02:06', '2024-08-17 10:02:06'),
(15, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"2\",\"number_of_beds\":\"2\",\"max_adults\":\"4\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-17 10:02:59', '2024-08-17 10:02:59'),
(16, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"2\",\"number_of_beds\":\"2\",\"max_adults\":\"2\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-17 10:04:18', '2024-08-17 10:04:18'),
(17, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"2\",\"number_of_beds\":\"2\",\"max_adults\":\"2\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-17 10:06:14', '2024-08-17 10:06:14'),
(18, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"10\",\"number_of_beds\":\"2\",\"max_adults\":\"2\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-17 10:13:16', '2024-08-17 10:13:16'),
(19, 1, 'hotel-room', '{\"_token\":\"Fwi84wn67Qfetyyj8Japls3q2tqh0GFBoaaX8cnB\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"10\",\"number_of_beds\":\"2\",\"max_adults\":\"2\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-17 10:59:19', '2024-08-17 10:59:19'),
(20, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2024-08-17 21:10:55', '2024-08-17 21:10:55'),
(21, 1, 'hotel-booking', '[]', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 4, '', 'danger', '2024-08-17 21:33:39', '2024-08-17 21:33:39'),
(22, 1, 'hotel-booking', '[]', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 3, '', 'danger', '2024-08-17 21:33:43', '2024-08-17 21:33:43'),
(23, 1, 'hotel-booking', '[]', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 2, '', 'danger', '2024-08-17 21:33:47', '2024-08-17 21:33:47'),
(24, 1, 'hotel-booking', '[]', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, '', 'danger', '2024-08-17 21:33:50', '2024-08-17 21:33:50'),
(25, 1, 'hotel-booking', '[]', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 5, '', 'danger', '2024-08-18 00:53:36', '2024-08-18 00:53:36'),
(26, 1, 'hotel-booking', '[]', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 6, '', 'danger', '2024-08-18 00:53:39', '2024-08-18 00:53:39'),
(27, 1, 'hotel-booking', '{\"_token\":\"rftQ5USwBxlroHJE4lyVcTKtPjyYthK32YdWpsFT\",\"submit\":\"save\",\"status\":\"completed\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 7, '', 'primary', '2024-08-18 00:54:08', '2024-08-18 00:54:08'),
(28, 1, 'hotel-room', '{\"_token\":\"rftQ5USwBxlroHJE4lyVcTKtPjyYthK32YdWpsFT\",\"name\":\"Pendora Fame\",\"slug\":\"pendora-fame\",\"slug_id\":\"407\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"126\",\"currency_id\":\"1\",\"number_of_rooms\":\"9\",\"number_of_beds\":\"4\",\"max_adults\":\"3\",\"max_children\":\"1\",\"size\":\"109\",\"images\":[null,\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 2, 'Pendora Fame', 'primary', '2024-08-18 02:05:48', '2024-08-18 02:05:48'),
(29, 1, 'hotel-booking', '{\"_token\":\"rftQ5USwBxlroHJE4lyVcTKtPjyYthK32YdWpsFT\",\"submit\":\"save\",\"status\":\"cancelled\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 8, '', 'primary', '2024-08-18 02:16:05', '2024-08-18 02:16:05'),
(30, 1, 'hotel-booking', '[]', 'deleted', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 8, '', 'danger', '2024-08-18 02:16:11', '2024-08-18 02:16:11'),
(31, 1, 'hotel-room', '{\"_token\":\"rftQ5USwBxlroHJE4lyVcTKtPjyYthK32YdWpsFT\",\"name\":\"Luxury Hall Of Fame\",\"slug\":\"luxury-hall-of-fame\",\"slug_id\":\"406\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"171\",\"currency_id\":\"1\",\"number_of_rooms\":\"10\",\"number_of_beds\":\"2\",\"max_adults\":\"2\",\"max_children\":\"1\",\"size\":\"181\",\"images\":[null,\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 1, 'Luxury Hall Of Fame', 'primary', '2024-08-18 02:16:46', '2024-08-18 02:16:46'),
(32, 1, 'hotel-room', '{\"_token\":\"rftQ5USwBxlroHJE4lyVcTKtPjyYthK32YdWpsFT\",\"name\":\"Pendora Fame\",\"slug\":\"pendora-fame\",\"slug_id\":\"407\",\"model\":\"Botble\\\\Hotel\\\\Models\\\\Room\",\"description\":\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.\",\"is_featured\":\"1\",\"content\":null,\"price\":\"126\",\"currency_id\":\"1\",\"number_of_rooms\":\"9\",\"number_of_beds\":\"4\",\"max_adults\":\"3\",\"max_children\":\"1\",\"size\":\"109\",\"images\":[null,\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"],\"amenities\":[\"1\",\"2\",\"3\",\"4\",\"6\",\"7\",\"9\",\"11\"],\"submit\":\"save\",\"status\":\"published\",\"room_category_id\":\"1\"}', 'updated', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 1, 2, 'Pendora Fame', 'primary', '2024-08-18 02:19:00', '2024-08-18 02:19:00'),
(33, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2024-08-18 05:26:24', '2024-08-18 05:26:24'),
(34, 1, 'to the system', NULL, 'logged in', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', '127.0.0.1', 0, 1, 'System Admin', 'info', '2024-08-18 22:24:06', '2024-08-18 22:24:06');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `description`, `status`, `author_id`, `author_type`, `icon`, `order`, `is_featured`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Travel', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 1, '2020-09-03 09:24:14', '2020-09-04 06:56:38'),
(2, 'Business', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2020-09-04 06:55:24', '2020-09-04 06:56:38'),
(3, 'Creative', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2020-09-04 06:55:49', '2020-09-04 06:56:38'),
(4, 'Technology', 0, NULL, 'published', 1, 'Botble\\ACL\\Models\\User', NULL, 0, 0, 0, '2020-09-04 06:56:15', '2020-09-04 06:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_replies`
--

CREATE TABLE `contact_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'widget_total_themes', '2020-09-01 20:29:01', '2020-09-01 20:29:01'),
(2, 'widget_total_users', '2020-09-01 20:29:01', '2020-09-01 20:29:01'),
(3, 'widget_total_pages', '2020-09-01 20:29:01', '2020-09-01 20:29:01'),
(4, 'widget_total_plugins', '2020-09-01 20:29:01', '2020-09-01 20:29:01'),
(5, 'widget_posts_recent', '2020-09-03 09:20:38', '2020-09-03 09:20:38'),
(6, 'widget_analytics_general', '2020-09-04 19:03:45', '2020-09-04 19:03:45'),
(7, 'widget_analytics_page', '2020-09-04 19:03:45', '2020-09-04 19:03:45'),
(8, 'widget_analytics_browser', '2020-09-04 19:03:45', '2020-09-04 19:03:45'),
(9, 'widget_analytics_referrer', '2020-09-04 19:03:45', '2020-09-04 19:03:45'),
(10, 'widget_audit_logs', '2020-09-04 19:03:45', '2020-09-04 19:03:45');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widget_settings`
--

CREATE TABLE `dashboard_widget_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `name`, `description`, `is_featured`, `order`, `image`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Duplex Restaurant', '--', 0, 0, 'galleries/01.jpg', 1, 'published', '2020-09-04 20:56:27', '2020-09-04 20:56:27'),
(2, 'Luxury room', '---', 0, 0, 'galleries/02.jpg', 1, 'published', '2020-09-04 20:56:55', '2020-09-04 20:56:55'),
(3, 'Pacific Room', '--', 0, 0, 'galleries/03.jpg', 1, 'published', '2020-09-04 20:57:42', '2020-09-04 20:57:42'),
(4, 'Family Room', '--', 0, 0, 'rooms/05.jpg', 1, 'published', '2020-09-04 21:21:02', '2020-09-04 21:21:02'),
(5, 'King Bed', '--', 0, 0, 'news/03-1.jpg', 1, 'published', '2020-09-04 21:21:53', '2020-09-04 21:21:53'),
(6, 'Special Foods', '--', 0, 0, 'galleries/06.jpg', 1, 'published', '2020-09-04 21:22:25', '2020-09-04 21:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `gallery_meta`
--

CREATE TABLE `gallery_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery_meta`
--

INSERT INTO `gallery_meta` (`id`, `reference_id`, `images`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 1, '[{\"img\":\"galleries/05.jpg\",\"description\":\"\"},{\"img\":\"galleries/08.jpg\",\"description\":\"\"},{\"img\":\"galleries/07.jpg\",\"description\":\"\"},{\"img\":\"galleries/06.jpg\",\"description\":\"\"},{\"img\":\"galleries/05.jpg\",\"description\":\"\"},{\"img\":\"galleries/04.jpg\",\"description\":\"\"},{\"img\":\"galleries/03.jpg\",\"description\":\"\"},{\"img\":\"galleries/02.jpg\",\"description\":\"\"},{\"img\":\"galleries/01.jpg\",\"description\":\"\"}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 20:56:27', '2020-09-04 20:56:27'),
(2, 2, '[{\"img\":\"galleries/08.jpg\",\"description\":\"\"},{\"img\":\"galleries/07.jpg\",\"description\":\"\"},{\"img\":\"galleries/06.jpg\",\"description\":\"\"},{\"img\":\"galleries/05.jpg\",\"description\":\"\"},{\"img\":\"galleries/04.jpg\",\"description\":\"\"},{\"img\":\"galleries/03.jpg\",\"description\":\"\"},{\"img\":\"galleries/02.jpg\",\"description\":\"\"},{\"img\":\"galleries/01.jpg\",\"description\":\"\"}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 20:56:55', '2020-09-04 20:56:55'),
(3, 3, '[{\"img\":\"galleries/08.jpg\",\"description\":\"\"},{\"img\":\"galleries/07.jpg\",\"description\":\"\"},{\"img\":\"galleries/06.jpg\",\"description\":\"\"},{\"img\":\"galleries/05.jpg\",\"description\":\"\"},{\"img\":\"galleries/04.jpg\",\"description\":\"\"},{\"img\":\"galleries/03.jpg\",\"description\":\"\"},{\"img\":\"galleries/02.jpg\",\"description\":\"\"},{\"img\":\"galleries/01.jpg\",\"description\":\"\"}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 20:57:42', '2020-09-04 20:57:42'),
(5, 5, NULL, 'Botble\\Page\\Models\\Page', '2020-09-04 21:04:11', '2020-09-04 21:04:11'),
(6, 4, '[{\"img\":\"rooms/06.jpg\",\"description\":\"\"},{\"img\":\"rooms/05.jpg\",\"description\":\"\"},{\"img\":\"rooms/04.jpg\",\"description\":\"\"},{\"img\":\"rooms/03.jpg\",\"description\":\"\"},{\"img\":\"rooms/02.jpg\",\"description\":\"\"},{\"img\":\"rooms/01.jpg\",\"description\":\"\"}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 21:21:03', '2020-09-04 21:21:03'),
(7, 5, '[{\"img\":\"news/03-1.jpg\",\"description\":\"\"},{\"img\":\"news/02-1.jpg\",\"description\":\"\"},{\"img\":\"news/01-1.jpg\",\"description\":\"\"},{\"img\":\"news/02.jpg\",\"description\":\"\"},{\"img\":\"news/03.jpg\",\"description\":\"\"},{\"img\":\"news/01.jpg\",\"description\":\"\"}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 21:21:53', '2020-09-04 21:21:53'),
(8, 6, '[{\"img\":\"foods\\/09.jpg\",\"description\":\"\"},{\"img\":\"foods\\/10.jpg\",\"description\":\"\"},{\"img\":\"foods\\/08.jpg\",\"description\":\"\"},{\"img\":\"foods\\/07.jpg\",\"description\":\"\"},{\"img\":\"foods\\/06.jpg\",\"description\":\"\"},{\"img\":\"foods\\/05.jpg\",\"description\":\"\"},{\"img\":\"foods\\/04.jpg\",\"description\":\"\"},{\"img\":\"foods\\/03.jpg\",\"description\":\"\"},{\"img\":\"foods\\/02.jpg\",\"description\":\"\"},{\"img\":\"foods\\/01.jpg\",\"description\":\"\"}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 21:22:25', '2020-09-04 21:22:46'),
(16, 6, NULL, 'Botble\\Page\\Models\\Page', '2020-09-05 02:21:38', '2020-09-05 02:21:38'),
(24, 7, NULL, 'Botble\\Page\\Models\\Page', '2020-09-09 04:37:20', '2020-09-09 04:37:20'),
(25, 1, NULL, 'Botble\\Page\\Models\\Page', '2021-01-03 17:32:01', '2021-01-03 17:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `ht_amenities`
--

CREATE TABLE `ht_amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_amenities`
--

INSERT INTO `ht_amenities` (`id`, `name`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Air conditioner', 'fal fa-bath', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(2, 'High speed WiFi', 'fal fa-wifi', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(3, 'Strong Locker', 'fal fa-key', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(4, 'Breakfast', 'fal fa-cut', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(5, 'Kitchen', 'fal fa-guitar', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(6, 'Smart Security', 'fal fa-lock', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(7, 'Cleaning', 'fal fa-broom', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(8, 'Shower', 'fal fa-shower', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(9, '24/7 Online Support', 'fal fa-headphones-alt', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(10, 'Grocery', 'fal fa-shopping-basket', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(11, 'Single bed', 'fal fa-bed', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(12, 'Expert Team', 'fal fa-users', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(13, 'Shop near', 'fal fa-shopping-cart', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(14, 'Towels', 'fal fa-bus', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `ht_bookings`
--

CREATE TABLE `ht_bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `requests` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `arrival_time` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `discount` decimal(20,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_booking_addresses`
--

CREATE TABLE `ht_booking_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_booking_rooms`
--

CREATE TABLE `ht_booking_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `number_of_rooms` int(11) NOT NULL DEFAULT 1,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_booking_services`
--

CREATE TABLE `ht_booking_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_booking_services`
--

INSERT INTO `ht_booking_services` (`id`, `booking_id`, `service_id`) VALUES
(1, 1, 4),
(2, 2, 1),
(3, 2, 2),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 3, 1),
(8, 3, 5),
(9, 3, 6),
(10, 4, 1),
(11, 4, 4),
(12, 4, 5),
(13, 4, 6),
(14, 6, 1),
(15, 6, 2),
(16, 6, 5),
(17, 7, 1),
(18, 7, 2),
(19, 7, 5),
(20, 8, 1),
(21, 8, 2),
(22, 8, 3),
(23, 8, 5),
(24, 8, 6);

-- --------------------------------------------------------

--
-- Table structure for table `ht_currencies`
--

CREATE TABLE `ht_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `decimals` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `exchange_rate` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_currencies`
--

INSERT INTO `ht_currencies` (`id`, `title`, `symbol`, `is_prefix_symbol`, `decimals`, `order`, `is_default`, `exchange_rate`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 1, 0, 0, 0, 1, '2021-01-05 03:29:34', '2024-08-16 23:44:29'),
(2, 'IDR', 'Rp', 1, 0, 1, 1, 1, '2024-08-16 23:44:29', '2024-08-18 09:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `ht_customers`
--

CREATE TABLE `ht_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_customers`
--

INSERT INTO `ht_customers` (`id`, `first_name`, `last_name`, `email`, `avatar`, `dob`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'Lolita', 'Rolfson', 'mavis09@example.com', NULL, NULL, '+2292930373774', '2021-01-05 03:29:52', '2021-01-05 03:29:52'),
(2, 'Vella', 'Tillman', 'nhahn@example.com', NULL, NULL, '+8377684679067', '2021-01-05 03:29:52', '2021-01-05 03:29:52'),
(3, 'Novella', 'Mitchell', 'olin62@example.com', NULL, NULL, '+4492465943011', '2021-01-05 03:29:52', '2021-01-05 03:29:52'),
(4, 'Corene', 'Kirlin', 'xkuhic@example.net', NULL, NULL, '+1767310097578', '2021-01-05 03:29:52', '2021-01-05 03:29:52'),
(5, 'Camden', 'Heathcote', 'erik63@example.com', NULL, NULL, '+8502127420621', '2021-01-05 03:29:52', '2021-01-05 03:29:52'),
(6, 'Will', 'Jenkins', 'litzy.schneider@example.org', NULL, NULL, '+3214734024825', '2021-01-05 03:29:52', '2021-01-05 03:29:52'),
(7, 'Genesis', 'Stanton', 'qdaugherty@example.com', NULL, NULL, '+4759329920245', '2021-01-05 03:29:52', '2021-01-05 03:29:52'),
(8, 'Marielle', 'O\'Hara', 'collin.ernser@example.net', NULL, NULL, '+1619507191217', '2021-01-05 03:29:52', '2021-01-05 03:29:52'),
(9, 'Paris', 'Koelpin', 'june31@example.com', NULL, NULL, '+3890014088775', '2021-01-05 03:29:52', '2021-01-05 03:29:52'),
(10, 'Hannah', 'Luettgen', 'daren.hamill@example.org', NULL, NULL, '+3490248838559', '2021-01-05 03:29:52', '2021-01-05 03:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `ht_features`
--

CREATE TABLE `ht_features` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_features`
--

INSERT INTO `ht_features` (`id`, `name`, `description`, `icon`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Have High Rating', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-rating', 1, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(2, 'Quiet Hours', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-clock', 1, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(3, 'Best Locations', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-location-pin', 1, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(4, 'Free Cancellation', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-clock-1', 0, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(5, 'Payment Options', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-credit-card', 0, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(6, 'Special Offers', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'flaticon-discount', 0, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `ht_foods`
--

CREATE TABLE `ht_foods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,0) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `food_type_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_foods`
--

INSERT INTO `ht_foods` (`id`, `name`, `description`, `price`, `currency_id`, `food_type_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Eggs & Bacon', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', '197', NULL, 1, 'foods/01.jpg', 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(2, 'Tea or Coffee', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', '147', NULL, 1, 'foods/02.jpg', 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(3, 'Chia Oatmeal', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', '142', NULL, 1, 'foods/03.jpg', 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(4, 'Juice', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', '182', NULL, 1, 'foods/04.jpg', 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(5, 'Chia Oatmeal', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', '147', NULL, 2, 'foods/05.jpg', 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(6, 'Fruit Parfait', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', '175', NULL, 2, 'foods/06.jpg', 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(7, 'Marmalade Selection', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', '136', NULL, 3, 'foods/07.jpg', 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(8, 'Cheese Platen', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', '122', NULL, 4, 'foods/08.jpg', 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(9, 'Avocado Toast', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', '184', NULL, 5, 'foods/09.jpg', 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(10, 'Avocado Toast', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', '169', NULL, 6, 'foods/10.jpg', 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `ht_food_types`
--

CREATE TABLE `ht_food_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_food_types`
--

INSERT INTO `ht_food_types` (`id`, `name`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Chicken', 'flaticon-boiled', 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(2, 'Italian', 'flaticon-pizza', 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(3, 'Coffee', 'flaticon-coffee', 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(4, 'Bake Cake', 'flaticon-cake', 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(5, 'Cookies', 'flaticon-cookie', 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(6, 'Cocktail', 'flaticon-cocktail', 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `ht_places`
--

CREATE TABLE `ht_places` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_places`
--

INSERT INTO `ht_places` (`id`, `name`, `distance`, `description`, `content`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'I never was so small as this is May it won\'t be raving mad after all! I almost wish I hadn\'t quite finished my tea when I was a general chorus of \'There goes Bill!\' then the puppy jumped into the garden with one elbow against the door, staring stupidly up into hers--she could hear the very middle of her voice, and the other bit. Her chin was pressed hard against it, that attempt proved a failure. Alice heard the Queen was silent. The Dormouse slowly opened his eyes were nearly out of their hearing her; and the whole thing, and she trembled till she had got its neck nicely straightened out, and was a general clapping of hands at this: it was all finished, the Owl, as a cushion, resting their elbows on it, and fortunately was just going to be, from one end to the Duchess: you\'d better leave off,\' said the Pigeon in a very hopeful tone though), \'I won\'t indeed!\' said the Pigeon. \'I\'m NOT a serpent!\' said Alice indignantly, and she told her sister, who was trembling down to look for her.', 'places/01.jpg', 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(2, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'Mock Turtle said: \'I\'m too stiff. And the moral of that is, but I can\'t be Mabel, for I know I do!\' said Alice angrily. \'It wasn\'t very civil of you to get hold of this rope--Will the roof was thatched with fur. It was the White Rabbit was no one could possibly hear you.\' And certainly there was enough of it had gone. \'Well! I\'ve often seen them so often, you know.\' \'Who is it twelve? I--\' \'Oh, don\'t talk about trouble!\' said the Pigeon; \'but I know I have to whisper a hint to Time, and round Alice, every now and then quietly marched off after the birds! Why, she\'ll eat a little wider. \'Come, it\'s pleased so far,\' said the Caterpillar. \'Well, perhaps you were down here with me! There are no mice in the newspapers, at the bottom of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you turned a back-somersault in at once.\' And in she went. Once more she found it.', 'places/02.jpg', 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(3, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'Alice, very earnestly. \'I\'ve had nothing else to say it over) \'--yes, that\'s about the whiting!\' \'Oh, as to prevent its undoing itself,) she carried it out again, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not talk!\' said Five. \'I heard every word you fellows were saying.\' \'Tell us a story.\' \'I\'m afraid I don\'t take this child away with me,\' thought Alice, \'it\'ll never do to ask: perhaps I shall only look up and walking away. \'You insult me by talking such nonsense!\' \'I didn\'t know it was too small, but at last came a little before she got up, and there stood the Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of its mouth and yawned once or twice, half hoping that the meeting adjourn, for the fan and gloves, and, as the large birds complained that they would go, and making quite a conversation of it in her life, and had no pictures or conversations in it, and very nearly carried it out to the door. \'Call the next verse,\' the.', 'places/03.jpg', 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(4, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'Mouse in the sand with wooden spades, then a great thistle, to keep back the wandering hair that curled all over crumbs.\' \'You\'re wrong about the same size: to be ashamed of yourself for asking such a curious dream, dear, certainly: but now run in to your tea; it\'s getting late.\' So Alice began in a moment. \'Let\'s go on crying in this affair, He trusts to you never to lose YOUR temper!\' \'Hold your tongue!\' said the King; \'and don\'t be particular--Here, Bill! catch hold of this ointment--one shilling the box-- Allow me to him: She gave me a good deal until she made it out to the jury. They were just beginning to end,\' said the Mock Turtle went on, taking first one side and up I goes like a telescope! I think I must sugar my hair.\" As a duck with its eyelids, so he with his whiskers!\' For some minutes it puffed away without being seen, when she was ready to ask any more questions about it, so she sat down again into its nest. Alice crouched down among the trees, a little pattering of.', 'places/04.jpg', 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(5, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'She took down a good deal: this fireplace is narrow, to be managed? I suppose Dinah\'ll be sending me on messages next!\' And she began nibbling at the Caterpillar\'s making such VERY short remarks, and she was always ready to ask his neighbour to tell them something more. \'You promised to tell me who YOU are, first.\' \'Why?\' said the Gryphon: \'I went to school in the other: he came trotting along in a hot tureen! Who for such a puzzled expression that she had expected: before she came suddenly upon an open place, with a smile. There was not a mile high,\' said Alice. \'I\'ve tried every way, and nothing seems to like her, down here, that I should understand that better,\' Alice said very politely, \'for I can\'t tell you how the Dodo in an impatient tone: \'explanations take such a curious dream, dear, certainly: but now run in to your places!\' shouted the Queen ordering off her unfortunate guests to execution--once more the shriek of the singers in the other: he came trotting along in a thick.', 'places/05.jpg', 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(6, 'Duplex Restaurant', '1,500m | 21 min. Walk', NULL, 'Alice said to Alice, very much what would be four thousand miles down, I think--\' (for, you see, because some of the water, and seemed to have any pepper in my size; and as Alice could not help thinking there MUST be more to be full of the court, she said to the Gryphon. \'Of course,\' the Mock Turtle in a day or two: wouldn\'t it be of any one; so, when the Rabbit say, \'A barrowful of WHAT?\' thought Alice \'without pictures or conversations?\' So she began thinking over other children she knew that were of the Gryphon, and all dripping wet, cross, and uncomfortable. The moment Alice felt a violent blow underneath her chin: it had entirely disappeared; so the King exclaimed, turning to the table for it, he was in the house till she shook the house, \"Let us both go to on the breeze that followed them, the melancholy words:-- \'Soo--oop of the jurors were writing down \'stupid things!\' on their slates, and then raised himself upon tiptoe, put his shoes on. \'--and just take his head.', 'places/06.jpg', 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `ht_rooms`
--

CREATE TABLE `ht_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,0) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `number_of_rooms` int(10) UNSIGNED DEFAULT 0,
  `number_of_beds` int(10) UNSIGNED DEFAULT 0,
  `size` int(10) UNSIGNED DEFAULT 0,
  `max_adults` int(11) DEFAULT 0,
  `max_children` int(11) DEFAULT 0,
  `room_category_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_rooms`
--

INSERT INTO `ht_rooms` (`id`, `name`, `description`, `content`, `is_featured`, `images`, `price`, `currency_id`, `number_of_rooms`, `number_of_beds`, `size`, `max_adults`, `max_children`, `room_category_id`, `status`, `created_at`, `updated_at`, `tax_id`) VALUES
(1, 'Luxury Hall Of Fame', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 1, '{\"1\":\"rooms\\/01.jpg\",\"2\":\"rooms\\/02.jpg\",\"3\":\"rooms\\/03.jpg\",\"4\":\"rooms\\/04.jpg\",\"5\":\"rooms\\/05.jpg\",\"6\":\"rooms\\/06.jpg\"}', '171', 1, 10, 2, 181, 2, 1, 1, 'published', '2021-01-05 03:29:40', '2024-08-17 10:13:16', 1),
(2, 'Pendora Fame', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 1, '{\"1\":\"rooms\\/02.jpg\",\"2\":\"rooms\\/01.jpg\",\"3\":\"rooms\\/03.jpg\",\"4\":\"rooms\\/04.jpg\",\"5\":\"rooms\\/05.jpg\",\"6\":\"rooms\\/06.jpg\"}', '126', 1, 9, 4, 109, 3, 1, 1, 'published', '2021-01-05 03:29:40', '2024-08-18 02:05:48', 1),
(3, 'Pacific Room', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 1, '[\"rooms\\/03.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]', '175', NULL, 9, 3, 179, 5, 1, 1, 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40', 1),
(4, 'Junior Suite', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 0, '[\"rooms\\/04.jpg\",\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]', '124', NULL, 9, 1, 164, 2, 1, 1, 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40', 1),
(5, 'Family Suite', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 0, '{\"1\":\"rooms\\/05.jpg\"}', '117', 1, 2, 3, 127, 3, 2, 1, 'published', '2021-01-05 03:29:40', '2024-08-17 09:35:15', 1),
(6, 'Relax Suite', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 0, '[\"rooms\\/06.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/01.jpg\"]', '134', NULL, 3, 3, 196, 2, 1, 4, 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40', 1),
(7, 'Luxury Suite', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 0, '[\"rooms\\/01.jpg\",\"rooms\\/02.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]', '121', NULL, 9, 4, 170, 3, 2, 2, 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40', 1),
(8, 'President Room', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, 0, '[\"rooms\\/02.jpg\",\"rooms\\/01.jpg\",\"rooms\\/03.jpg\",\"rooms\\/04.jpg\",\"rooms\\/05.jpg\",\"rooms\\/06.jpg\"]', '186', NULL, 8, 1, 178, 4, 1, 2, 'published', '2021-01-05 03:29:40', '2021-01-05 03:29:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ht_rooms_amenities`
--

CREATE TABLE `ht_rooms_amenities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amenity_id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_rooms_amenities`
--

INSERT INTO `ht_rooms_amenities` (`id`, `amenity_id`, `room_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL),
(5, 6, 1, NULL, NULL),
(6, 7, 1, NULL, NULL),
(7, 9, 1, NULL, NULL),
(8, 11, 1, NULL, NULL),
(9, 1, 2, NULL, NULL),
(10, 2, 2, NULL, NULL),
(11, 3, 2, NULL, NULL),
(12, 4, 2, NULL, NULL),
(13, 6, 2, NULL, NULL),
(14, 7, 2, NULL, NULL),
(15, 9, 2, NULL, NULL),
(16, 11, 2, NULL, NULL),
(17, 1, 3, NULL, NULL),
(18, 2, 3, NULL, NULL),
(19, 3, 3, NULL, NULL),
(20, 4, 3, NULL, NULL),
(21, 6, 3, NULL, NULL),
(22, 7, 3, NULL, NULL),
(23, 9, 3, NULL, NULL),
(24, 11, 3, NULL, NULL),
(25, 1, 4, NULL, NULL),
(26, 2, 4, NULL, NULL),
(27, 3, 4, NULL, NULL),
(28, 4, 4, NULL, NULL),
(29, 6, 4, NULL, NULL),
(30, 7, 4, NULL, NULL),
(31, 9, 4, NULL, NULL),
(32, 11, 4, NULL, NULL),
(33, 1, 5, NULL, NULL),
(34, 2, 5, NULL, NULL),
(35, 3, 5, NULL, NULL),
(36, 4, 5, NULL, NULL),
(37, 6, 5, NULL, NULL),
(38, 7, 5, NULL, NULL),
(39, 9, 5, NULL, NULL),
(40, 11, 5, NULL, NULL),
(41, 1, 6, NULL, NULL),
(42, 2, 6, NULL, NULL),
(43, 3, 6, NULL, NULL),
(44, 4, 6, NULL, NULL),
(45, 6, 6, NULL, NULL),
(46, 7, 6, NULL, NULL),
(47, 9, 6, NULL, NULL),
(48, 11, 6, NULL, NULL),
(49, 1, 7, NULL, NULL),
(50, 2, 7, NULL, NULL),
(51, 3, 7, NULL, NULL),
(52, 4, 7, NULL, NULL),
(53, 6, 7, NULL, NULL),
(54, 7, 7, NULL, NULL),
(55, 9, 7, NULL, NULL),
(56, 11, 7, NULL, NULL),
(57, 1, 8, NULL, NULL),
(58, 2, 8, NULL, NULL),
(59, 3, 8, NULL, NULL),
(60, 4, 8, NULL, NULL),
(61, 6, 8, NULL, NULL),
(62, 7, 8, NULL, NULL),
(63, 9, 8, NULL, NULL),
(64, 11, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ht_room_categories`
--

CREATE TABLE `ht_room_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_room_categories`
--

INSERT INTO `ht_room_categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Luxury', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(2, 'Family', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(3, 'Double Bed', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34'),
(4, 'Relax', 'published', '2021-01-05 03:29:34', '2021-01-05 03:29:34');

-- --------------------------------------------------------

--
-- Table structure for table `ht_room_dates`
--

CREATE TABLE `ht_room_dates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `price` decimal(15,0) DEFAULT NULL,
  `discount` decimal(20,0) NOT NULL,
  `max_guests` tinyint(4) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `note_to_customer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_to_admin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_rooms` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ht_services`
--

CREATE TABLE `ht_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,0) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_services`
--

INSERT INTO `ht_services` (`id`, `name`, `description`, `content`, `price`, `currency_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wifi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, '100', NULL, NULL, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(2, 'Car Rental', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, '30', NULL, NULL, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(3, 'Satellite TV', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, '50', NULL, NULL, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(4, 'Sea View', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, '10', NULL, NULL, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(5, 'Laundry', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, '10', NULL, NULL, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51'),
(6, 'Breakfast', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel molestie nisl. Duis ac mi leo.', NULL, '10', NULL, NULL, 'published', '2021-01-05 03:29:51', '2021-01-05 03:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `ht_taxes`
--

CREATE TABLE `ht_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ht_taxes`
--

INSERT INTO `ht_taxes` (`id`, `title`, `percentage`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VAT', 10.000000, 1, 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(2, 'None', 0.000000, 2, 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
--

CREATE TABLE `media_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `user_id`, `name`, `folder_id`, `mime_type`, `size`, `url`, `options`, `created_at`, `updated_at`, `deleted_at`) VALUES
(162, 0, '01', 29, 'image/jpeg', 2181, 'rooms/01.jpg', '[]', '2021-01-05 03:29:34', '2021-01-05 03:29:34', NULL),
(163, 0, '02', 29, 'image/jpeg', 2181, 'rooms/02.jpg', '[]', '2021-01-05 03:29:35', '2021-01-05 03:29:35', NULL),
(164, 0, '03', 29, 'image/jpeg', 2181, 'rooms/03.jpg', '[]', '2021-01-05 03:29:36', '2021-01-05 03:29:36', NULL),
(165, 0, '04', 29, 'image/jpeg', 2181, 'rooms/04.jpg', '[]', '2021-01-05 03:29:37', '2021-01-05 03:29:37', NULL),
(166, 0, '05', 29, 'image/jpeg', 2181, 'rooms/05.jpg', '[]', '2021-01-05 03:29:38', '2021-01-05 03:29:38', NULL),
(167, 0, '06', 29, 'image/jpeg', 2181, 'rooms/06.jpg', '[]', '2021-01-05 03:29:39', '2021-01-05 03:29:39', NULL),
(168, 0, '01', 30, 'image/jpeg', 2165, 'foods/01.jpg', '[]', '2021-01-05 03:29:40', '2021-01-05 03:29:40', NULL),
(169, 0, '02', 30, 'image/jpeg', 2165, 'foods/02.jpg', '[]', '2021-01-05 03:29:41', '2021-01-05 03:29:41', NULL),
(170, 0, '03', 30, 'image/jpeg', 2165, 'foods/03.jpg', '[]', '2021-01-05 03:29:42', '2021-01-05 03:29:42', NULL),
(171, 0, '04', 30, 'image/jpeg', 2165, 'foods/04.jpg', '[]', '2021-01-05 03:29:43', '2021-01-05 03:29:43', NULL),
(172, 0, '05', 30, 'image/jpeg', 2165, 'foods/05.jpg', '[]', '2021-01-05 03:29:45', '2021-01-05 03:29:45', NULL),
(173, 0, '06', 30, 'image/jpeg', 2165, 'foods/06.jpg', '[]', '2021-01-05 03:29:46', '2021-01-05 03:29:46', NULL),
(174, 0, '07', 30, 'image/jpeg', 2165, 'foods/07.jpg', '[]', '2021-01-05 03:29:47', '2021-01-05 03:29:47', NULL),
(175, 0, '08', 30, 'image/jpeg', 2165, 'foods/08.jpg', '[]', '2021-01-05 03:29:48', '2021-01-05 03:29:48', NULL),
(176, 0, '09', 30, 'image/jpeg', 2165, 'foods/09.jpg', '[]', '2021-01-05 03:29:49', '2021-01-05 03:29:49', NULL),
(177, 0, '10', 30, 'image/jpeg', 2165, 'foods/10.jpg', '[]', '2021-01-05 03:29:50', '2021-01-05 03:29:50', NULL),
(178, 0, '01', 31, 'image/jpeg', 2041, 'places/01.jpg', '[]', '2021-01-05 03:29:52', '2021-01-05 03:29:52', NULL),
(179, 0, '02', 31, 'image/jpeg', 2041, 'places/02.jpg', '[]', '2021-01-05 03:29:53', '2021-01-05 03:29:53', NULL),
(180, 0, '03', 31, 'image/jpeg', 2041, 'places/03.jpg', '[]', '2021-01-05 03:29:53', '2021-01-05 03:29:53', NULL),
(181, 0, '04', 31, 'image/jpeg', 2041, 'places/04.jpg', '[]', '2021-01-05 03:29:54', '2021-01-05 03:29:54', NULL),
(182, 0, '05', 31, 'image/jpeg', 2041, 'places/05.jpg', '[]', '2021-01-05 03:29:55', '2021-01-05 03:29:55', NULL),
(183, 0, '06', 31, 'image/jpeg', 2041, 'places/06.jpg', '[]', '2021-01-05 03:29:56', '2021-01-05 03:29:56', NULL),
(184, 0, '1', 32, 'image/jpeg', 2165, 'users/1.jpg', '[]', '2021-01-05 03:29:57', '2021-01-05 03:29:57', NULL),
(185, 0, '01', 33, 'image/jpeg', 2165, 'galleries/01.jpg', '[]', '2021-01-05 03:29:59', '2021-01-05 03:29:59', NULL),
(186, 0, '02', 33, 'image/jpeg', 2165, 'galleries/02.jpg', '[]', '2021-01-05 03:30:00', '2021-01-05 03:30:00', NULL),
(187, 0, '03', 33, 'image/jpeg', 2165, 'galleries/03.jpg', '[]', '2021-01-05 03:30:01', '2021-01-05 03:30:01', NULL),
(188, 0, '04', 33, 'image/jpeg', 2165, 'galleries/04.jpg', '[]', '2021-01-05 03:30:02', '2021-01-05 03:30:02', NULL),
(189, 0, '05', 33, 'image/jpeg', 2165, 'galleries/05.jpg', '[]', '2021-01-05 03:30:03', '2021-01-05 03:30:03', NULL),
(190, 0, '06', 33, 'image/jpeg', 2165, 'galleries/06.jpg', '[]', '2021-01-05 03:30:05', '2021-01-05 03:30:05', NULL),
(191, 0, '07', 33, 'image/jpeg', 2165, 'galleries/07.jpg', '[]', '2021-01-05 03:30:06', '2021-01-05 03:30:06', NULL),
(192, 0, '08', 33, 'image/jpeg', 2165, 'galleries/08.jpg', '[]', '2021-01-05 03:30:07', '2021-01-05 03:30:07', NULL),
(193, 0, '01', 34, 'image/jpeg', 984, 'general/01.jpg', '[]', '2021-01-05 03:30:08', '2021-01-05 03:30:08', NULL),
(194, 0, '02', 34, 'image/jpeg', 820, 'general/02.jpg', '[]', '2021-01-05 03:30:09', '2021-01-05 03:30:09', NULL),
(195, 0, '03', 34, 'image/jpeg', 1135, 'general/03.jpg', '[]', '2021-01-05 03:30:10', '2021-01-05 03:30:10', NULL),
(196, 0, '04', 34, 'image/jpeg', 4202, 'general/04.jpg', '[]', '2021-01-05 03:30:10', '2021-01-05 03:30:10', NULL),
(197, 0, 'banner-news', 34, 'image/jpeg', 3936, 'general/banner-news.jpg', '[]', '2021-01-05 03:30:12', '2021-01-05 03:30:12', NULL),
(198, 0, 'bg', 34, 'image/jpeg', 7963, 'general/bg.jpg', '[]', '2021-01-05 03:30:13', '2021-01-05 03:30:13', NULL),
(199, 0, 'favicon', 34, 'image/png', 2386, 'general/favicon.png', '[]', '2021-01-05 03:30:15', '2021-01-05 03:30:15', NULL),
(200, 0, 'logo-white', 34, 'image/png', 3052, 'general/logo-white.png', '[]', '2021-01-05 03:30:15', '2021-01-05 03:30:15', NULL),
(201, 0, 'logo', 34, 'image/png', 3017, 'general/logo.png', '[]', '2021-01-05 03:30:16', '2021-01-05 03:30:16', NULL),
(202, 0, 'video-background-02', 34, 'image/jpeg', 7834, 'general/video-background-02.jpg', '[]', '2021-01-05 03:30:17', '2021-01-05 03:30:17', NULL),
(203, 0, 'video-banner-01', 34, 'image/jpeg', 2294, 'general/video-banner-01.jpg', '[]', '2021-01-05 03:30:19', '2021-01-05 03:30:19', NULL),
(204, 0, '01-1', 35, 'image/jpeg', 2763, 'news/01-1.jpg', '[]', '2021-01-05 03:30:20', '2021-01-05 03:30:20', NULL),
(205, 0, '01', 35, 'image/jpeg', 2763, 'news/01.jpg', '[]', '2021-01-05 03:30:21', '2021-01-05 03:30:21', NULL),
(206, 0, '02-1', 35, 'image/jpeg', 2763, 'news/02-1.jpg', '[]', '2021-01-05 03:30:22', '2021-01-05 03:30:22', NULL),
(207, 0, '02', 35, 'image/jpeg', 2763, 'news/02.jpg', '[]', '2021-01-05 03:30:23', '2021-01-05 03:30:23', NULL),
(208, 0, '03-1', 35, 'image/jpeg', 2763, 'news/03-1.jpg', '[]', '2021-01-05 03:30:24', '2021-01-05 03:30:24', NULL),
(209, 0, '03', 35, 'image/jpeg', 2763, 'news/03.jpg', '[]', '2021-01-05 03:30:25', '2021-01-05 03:30:25', NULL),
(210, 0, '04', 36, 'image/jpeg', 8049, 'sliders/04.jpg', '[]', '2021-01-05 03:30:26', '2021-01-05 03:30:26', NULL),
(211, 0, '05', 36, 'image/jpeg', 8049, 'sliders/05.jpg', '[]', '2021-01-05 03:30:28', '2021-01-05 03:30:28', NULL),
(212, 0, '01', 37, 'image/png', 2165, 'testimonials/01.png', '[]', '2021-01-05 03:30:30', '2021-01-05 03:30:30', NULL),
(213, 0, '02', 37, 'image/png', 2165, 'testimonials/02.png', '[]', '2021-01-05 03:30:31', '2021-01-05 03:30:31', NULL),
(214, 0, '03', 37, 'image/png', 2165, 'testimonials/03.png', '[]', '2021-01-05 03:30:32', '2021-01-05 03:30:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_folders`
--

CREATE TABLE `media_folders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media_folders`
--

INSERT INTO `media_folders` (`id`, `user_id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(29, 0, 'rooms', 'rooms', 0, '2021-01-05 03:29:34', '2021-01-05 03:29:34', NULL),
(30, 0, 'foods', 'foods', 0, '2021-01-05 03:29:40', '2021-01-05 03:29:40', NULL),
(31, 0, 'places', 'places', 0, '2021-01-05 03:29:52', '2021-01-05 03:29:52', NULL),
(32, 0, 'users', 'users', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57', NULL),
(33, 0, 'galleries', 'galleries', 0, '2021-01-05 03:29:59', '2021-01-05 03:29:59', NULL),
(34, 0, 'general', 'general', 0, '2021-01-05 03:30:08', '2021-01-05 03:30:08', NULL),
(35, 0, 'news', 'news', 0, '2021-01-05 03:30:20', '2021-01-05 03:30:20', NULL),
(36, 0, 'sliders', 'sliders', 0, '2021-01-05 03:30:26', '2021-01-05 03:30:26', NULL),
(37, 0, 'testimonials', 'testimonials', 0, '2021-01-05 03:30:30', '2021-01-05 03:30:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `media_settings`
--

CREATE TABLE `media_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Header menu', 'header-menu', 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(2, 'Our pages', 'our-pages', 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(3, 'Services.', 'services', 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'header-menu', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(2, 2, 'side-menu', '2021-01-05 03:29:57', '2021-01-05 03:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nodes`
--

CREATE TABLE `menu_nodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reference_id` int(10) UNSIGNED DEFAULT 0,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_nodes`
--

INSERT INTO `menu_nodes` (`id`, `menu_id`, `parent_id`, `reference_id`, `reference_type`, `url`, `icon_font`, `position`, `title`, `css_class`, `target`, `has_child`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, NULL, '/', NULL, 0, 'Home', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(2, 1, 0, 0, NULL, '/rooms', NULL, 0, 'Rooms', NULL, '_self', 1, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(3, 1, 2, 0, NULL, '/rooms/luxury-hall-of-fame', NULL, 0, 'Luxury Hall Of Fame', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(4, 1, 2, 0, NULL, '/rooms/pendora-fame', NULL, 1, 'Pendora Fame', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(5, 1, 0, 2, 'Botble\\Page\\Models\\Page', '/news', NULL, 0, 'News', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(6, 1, 0, 3, 'Botble\\Page\\Models\\Page', '/contact', NULL, 0, 'Contact', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(7, 2, 0, 6, 'Botble\\Page\\Models\\Page', '/about-us', NULL, 0, 'About Us', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(8, 2, 0, 5, 'Botble\\Page\\Models\\Page', '/our-gallery', NULL, 0, 'Our Gallery', NULL, '_self', 1, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(9, 2, 8, 0, NULL, '/galleries/king-bed', NULL, 0, 'King Bed', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(10, 2, 8, 0, NULL, '/galleries/duplex-restaurant', NULL, 1, 'Duplex Restaurant', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(11, 2, 0, 4, 'Botble\\Page\\Models\\Page', '/restaurant', NULL, 0, 'Restaurant', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(12, 2, 0, 7, 'Botble\\Page\\Models\\Page', '/places', NULL, 0, 'Places', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(13, 2, 0, 8, 'Botble\\Page\\Models\\Page', '/our-offers', NULL, 0, 'Our Offers', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(14, 3, 0, 0, NULL, '#', NULL, 0, 'Restaurant & Bar', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(15, 3, 0, 0, NULL, '#', NULL, 0, 'Swimming Pool', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(16, 3, 0, 0, NULL, '#', NULL, 0, 'Restaurant', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(17, 3, 0, 0, NULL, '#', NULL, 0, 'Conference Room', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(18, 3, 0, 0, NULL, '#', NULL, 0, 'Cocktail Party Houses', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(19, 3, 0, 0, NULL, '#', NULL, 0, 'Gaming Zone', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(20, 3, 0, 0, NULL, '#', NULL, 0, 'Marriage Party', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(21, 3, 0, 0, NULL, '#', NULL, 0, 'Party Planning', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(22, 3, 0, 0, NULL, '#', NULL, 0, 'Tour Consultancy', NULL, '_self', 0, '2021-01-05 03:29:57', '2021-01-05 03:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `meta_boxes`
--

CREATE TABLE `meta_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `meta_boxes`
--

INSERT INTO `meta_boxes` (`id`, `reference_id`, `meta_key`, `meta_value`, `reference_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2020-09-03 09:24:14', '2020-09-03 09:24:14'),
(2, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2020-09-03 09:24:36', '2020-09-03 09:24:36'),
(3, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Tag', '2020-09-03 09:24:37', '2020-09-03 09:24:37'),
(4, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Tag', '2020-09-03 09:24:37', '2020-09-03 09:24:37'),
(5, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2020-09-03 09:25:13', '2020-09-03 09:25:13'),
(6, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2020-09-03 09:25:44', '2020-09-03 09:25:44'),
(7, 4, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Post', '2020-09-03 09:50:38', '2020-09-03 09:50:38'),
(10, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2020-09-04 06:55:24', '2020-09-04 06:55:24'),
(11, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2020-09-04 06:55:50', '2020-09-04 06:55:50'),
(12, 4, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Blog\\Models\\Category', '2020-09-04 06:56:15', '2020-09-04 06:56:15'),
(15, 1, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 20:56:27', '2020-09-04 20:56:27'),
(16, 2, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 20:56:55', '2020-09-04 20:56:55'),
(17, 3, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 20:57:42', '2020-09-04 20:57:42'),
(19, 4, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 21:21:02', '2020-09-04 21:21:02'),
(20, 5, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 21:21:53', '2020-09-04 21:21:53'),
(21, 6, 'seo_meta', '[{\"seo_title\":null,\"seo_description\":null}]', 'Botble\\Gallery\\Models\\Gallery', '2020-09-04 21:22:25', '2020-09-04 21:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_04_09_032329_create_base_tables', 1),
(2, '2013_04_09_062329_create_revisions_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2016_06_10_230148_create_acl_tables', 1),
(6, '2016_06_14_230857_create_menus_table', 1),
(7, '2016_06_28_221418_create_pages_table', 1),
(8, '2016_10_05_074239_create_setting_table', 1),
(9, '2016_11_28_032840_create_dashboard_widget_tables', 1),
(10, '2016_12_16_084601_create_widgets_table', 1),
(11, '2017_05_09_070343_create_media_tables', 1),
(12, '2017_11_03_070450_create_slug_table', 1),
(13, '2019_01_05_053554_create_jobs_table', 1),
(14, '2019_05_03_000001_create_customer_columns', 1),
(15, '2019_05_03_000002_create_subscriptions_table', 1),
(16, '2019_05_03_000003_create_subscription_items_table', 1),
(17, '2019_07_15_042406_change_site_title_from_settings_to_theme_options', 1),
(18, '2019_08_13_033145_remove_unused_columns_in_users_table', 1),
(19, '2019_08_19_000000_create_failed_jobs_table', 1),
(20, '2019_09_07_030654_update_menu_nodes_table', 1),
(21, '2019_09_07_045041_update_slugs_table', 1),
(22, '2019_09_07_050405_update_slug_reference_for_page', 1),
(23, '2019_09_08_014859_update_meta_boxes_table', 1),
(24, '2019_09_08_015629_update_meta_box_data_for_page', 1),
(25, '2019_09_12_073711_update_media_url', 1),
(26, '2019_09_12_073711_update_media_url_for_current_data', 1),
(27, '2019_10_20_002256_remove_parent_id_in_pages_table', 1),
(28, '2020_03_28_020724_make_column_user_id_nullable_table_revisions', 1),
(45, '2018_07_09_214610_create_testimonial_table', 3),
(46, '2018_07_09_221238_create_faq_table', 4),
(58, '2020_09_03_152245_add_company_to_testimonials_table', 8),
(59, '2020_09_03_153420_add_status_to_testimonials_table', 9),
(60, '2015_06_18_033822_create_blog_table', 10),
(61, '2019_09_07_035526_update_menu_node_reference_type_for_category', 10),
(62, '2019_09_07_050058_update_slug_reference_for_blog', 10),
(63, '2019_09_07_155716_update_language_meta_for_blog', 10),
(64, '2019_09_08_015552_update_meta_box_data_for_blog', 10),
(65, '2019_10_20_002342_remove_parent_id_in_tags_table', 10),
(68, '2016_06_17_091537_create_contacts_table', 12),
(69, '2015_06_29_025744_create_audit_history', 13),
(70, '2016_10_07_193005_create_translations_table', 14),
(71, '2020_09_05_021519_add_column_description_into_table_ht_foods', 15),
(72, '2016_10_13_150201_create_galleries_table', 16),
(73, '2019_09_07_050253_update_slug_reference_for_gallery', 16),
(74, '2019_09_07_155917_update_language_meta_for_gallery', 16),
(75, '2019_09_08_032534_update_gallery_meta_table', 16),
(96, '2020_09_02_033611_hotel_create_table', 17),
(97, '2017_05_18_080441_create_payment_tables', 18),
(98, '2020_02_03_144309_update_column_payment_channel', 18),
(99, '2020_02_11_133026_add_description_to_table_payments', 18),
(100, '2020_03_23_093053_update_payments_table', 18),
(101, '2020_10_05_030817_make_column_charge_id_nullable', 19),
(102, '2020_10_18_134416_fix_audit_logs_table', 20),
(104, '2020_10_20_031058_create_taxes_table', 21),
(105, '2021_02_16_092633_remove_default_value_for_author_type', 22),
(106, '2021_03_27_144913_add_customer_type_into_table_payments', 23);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(4) NOT NULL DEFAULT 0,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `content`, `user_id`, `image`, `template`, `is_featured`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Homepage', '<div>[home-banner][/home-banner]</div><div>[check-availability-form][/check-availability-form]</div><div>[hotel-about title=\"since 1994\" description=\"Situated In Prime Position At The Foot Of The Slopes Of Courchevel Moriond.\" block_icon_1=\"flaticon-coffee\" block_text_1=\"Breakfast\" block_icon_2=\"flaticon-air-freight\" block_text_2=\"Airport Pickup\" block_icon_3=\"flaticon-marker\" block_text_3=\"City Guide\" block_icon_4=\"flaticon-barbecue\" block_text_4=\"BBQ Party\" block_icon_5=\"flaticon-hotel\" block_text_5=\"Luxury Room\"][/hotel-about]</div><div>[room-categories title=\"Room Type\" sub_title=\"Inspired Loding\" background_image=\"general/bg.jpg\"][/room-categories]</div><div>[hotel-featured-features title=\"The Thin Escape\" description=\"Miranda has everything for your trip & every single things.\" button_text=\"Take a tour\" button_url=\"/rooms\"][/hotel-featured-features]</div><div>[rooms][/rooms]</div><div>[video-introduction title=\"Take a tour\" sub_title=\"Discover Our Underground.\" description=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\" background_image=\"general/video-background-02.jpg\" video_image=\"general/video-banner-01.jpg\" video_url=\"https://www.youtube.com/watch?v=EEJFMdfraVY\" button_text=\"Book Now\" button_url=\"/rooms\"][/video-introduction]</div><div>[testimonial title=\"testimonials\" description=\"Client Feedback\"][/testimonial]</div><div>[rooms-introduction title=\"Our rooms\" description=\"Each of our nine lovely double guest rooms feature a private bath, wi-fi, cable television and include full breakfast.\" background_image=\"general/bg.jpg\" first_image=\"general/01.jpg\" second_image=\"general/02.jpg\" third_image=\"general/03.jpg\" button_text=\"Take a tour\" button_url=\"/rooms\"][/rooms-introduction]</div><div>[featured-news title=\"Blog\" description=\"News Feeds\"][/featured-news]</div>', 1, NULL, 'homepage', 0, NULL, 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(2, 'News', '<p>--</p>', 1, NULL, 'default', 0, NULL, 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(3, 'Contact', '<div>[contact-info][/contact-info]</div><div>[google-map]19/A, Cirikon City hall Tower New York, NYC[/google-map]</div><div>[contact-form][/contact-form]</div>', 1, NULL, 'no-sidebar', 0, NULL, 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(4, 'Restaurant', '<div>[food-types][/food-types]</div><div>[foods title=\"Restaurant\" sub_title=\"Trending Menu\"][/foods]</div>', 1, NULL, 'no-sidebar', 0, NULL, 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(5, 'Our Gallery', '<div>[all-galleries title=\"Gallery\" sub_title=\"Our Rooms\"][/all-galleries]</div>', 1, NULL, 'no-sidebar', 0, NULL, 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(6, 'About us', '<div>[youtube-video url=\"https://www.youtube.com/watch?v=EEJFMdfraVY\" background_image=\"general/04.jpg\"][/youtube-video]</div><p>Hello. Our hotel has been present for over 20 years. We make the best or all our customers. Hello. Our hotel has been present for over 20 years. We make the best or all our customers. Hello. Our hotel has been present for over 20 years. We make the best or all our customers.</p><div>[hotel-core-features title=\"Facilities\" sub_title=\"Core Features\"][/hotel-core-features]</div><div>[featured-news title=\"Blog\" description=\"News Feeds\"][/featured-news]</div>', 1, NULL, 'no-sidebar', 0, NULL, 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(7, 'Places', '<div>[places][/places]</div>', 1, NULL, 'no-sidebar', 0, NULL, 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(8, 'Our Offers', '<div>[our-offers][/our-offers]</div>', 1, NULL, 'no-sidebar', 0, NULL, 'published', '2021-01-05 03:29:57', '2021-01-05 03:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(15,2) UNSIGNED NOT NULL,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `charge_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `refunded_amount` decimal(15,2) UNSIGNED DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `currency`, `user_id`, `charge_id`, `payment_channel`, `created_at`, `updated_at`, `description`, `order_id`, `status`, `payment_type`, `customer_id`, `refunded_amount`, `refund_note`, `customer_type`) VALUES
(5, '138.60', 'IDR', 0, 'HZHLTIWJD5', 'full_payment', '2024-08-17 22:09:47', '2024-08-18 00:54:24', NULL, 5, 'completed', 'confirm', NULL, NULL, NULL, NULL),
(6, '670.10', 'IDR', 0, 'HMSPJNY3BO', 'down_payment', '2024-08-17 22:20:33', '2024-08-17 22:20:33', NULL, 6, 'pending', 'confirm', NULL, NULL, NULL, NULL),
(7, '328.10', 'IDR', 0, 'BEXVGFGQKU', 'full_payment', '2024-08-18 00:52:37', '2024-08-18 00:55:07', NULL, 7, 'completed', 'confirm', NULL, NULL, NULL, NULL),
(8, '188.10', 'IDR', 0, 'AM9OLKCLYI', 'full_payment', '2024-08-18 01:25:31', '2024-08-18 01:25:31', NULL, 8, 'pending', 'confirm', NULL, NULL, NULL, NULL),
(9, '196.00', 'IDR', 0, 'JURRKNLSVR', 'full_payment', '2024-08-18 09:27:29', '2024-08-18 09:27:29', NULL, 9, 'pending', 'confirm', NULL, NULL, NULL, NULL),
(10, '291.37', 'IDR', 0, 'RVT03PKF59', 'full_payment', '2024-08-19 01:15:25', '2024-08-19 01:15:25', NULL, 11, 'pending', 'confirm', NULL, NULL, NULL, NULL),
(11, '291.37', 'IDR', 0, 'RTCXH7YAZN', 'full_payment', '2024-08-19 01:25:52', '2024-08-19 01:25:52', NULL, 12, 'pending', 'confirm', NULL, NULL, NULL, NULL),
(12, '291.37', 'IDR', 0, 'PYQNQ0NGVP', 'full_payment', '2024-08-19 02:12:20', '2024-08-19 02:12:20', NULL, 13, 'pending', 'confirm', NULL, NULL, NULL, NULL),
(13, '291.37', 'IDR', 0, 'AKAUKRQYTU', 'full_payment', '2024-08-19 02:28:17', '2024-08-19 02:28:17', NULL, 14, 'pending', 'confirm', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `name`, `description`, `content`, `status`, `author_id`, `author_type`, `is_featured`, `image`, `views`, `format_type`, `created_at`, `updated_at`) VALUES
(1, 'Each of our 8 double rooms has its own distinct.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/01-1.jpg', 4, NULL, '2020-09-03 09:24:36', '2020-09-04 06:39:31'),
(2, 'Each of our 8 double rooms has its own distinct.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/02.jpg', 4, NULL, '2020-09-03 09:25:13', '2020-09-04 06:39:31'),
(3, 'Each of our 8 double rooms has its own distinct.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/03.jpg', 4, NULL, '2020-09-03 09:25:44', '2020-09-04 06:39:31'),
(4, 'Each of our 8 double rooms has its own distinct.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>', 'published', 1, 'Botble\\ACL\\Models\\User', 1, 'news/01.jpg', 4, NULL, '2020-09-03 09:50:38', '2020-09-04 06:39:31');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `category_id`, `post_id`) VALUES
(2, 1, 2),
(3, 1, 3),
(5, 1, 4),
(6, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `tag_id`, `post_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 1, 2),
(4, 2, 2),
(5, 1, 3),
(6, 2, 3),
(7, 1, 4),
(8, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `revisions`
--

INSERT INTO `revisions` (`id`, `revisionable_type`, `revisionable_id`, `user_id`, `key`, `old_value`, `new_value`, `created_at`, `updated_at`) VALUES
(1, 'Botble\\Blog\\Models\\Post', 1, 1, 'is_featured', '0', '1', '2020-09-03 09:26:52', '2020-09-03 09:26:52'),
(2, 'Botble\\Blog\\Models\\Post', 1, 1, 'image', 'news/01.jpg', 'news/01-1.jpg', '2020-09-04 06:35:15', '2020-09-04 06:35:15'),
(3, 'Botble\\Page\\Models\\Page', 3, 1, 'template', 'default', 'full-width', '2020-09-04 10:03:26', '2020-09-04 10:03:26'),
(4, 'Botble\\Page\\Models\\Page', 3, 1, 'template', 'full-width', 'default', '2020-09-04 10:11:07', '2020-09-04 10:11:07'),
(5, 'Botble\\Page\\Models\\Page', 3, 1, 'template', 'default', 'no-sidebar', '2020-09-04 10:11:56', '2020-09-04 10:11:56'),
(6, 'Botble\\Page\\Models\\Page', 4, 1, 'template', 'default', 'no-sidebar', '2020-09-04 20:08:17', '2020-09-04 20:08:17'),
(7, 'Botble\\Page\\Models\\Page', 5, 1, 'template', 'default', 'no-sidebar', '2020-09-04 21:04:11', '2020-09-04 21:04:11'),
(8, 'Botble\\Page\\Models\\Page', 6, 1, 'template', 'default', 'no-sidebar', '2020-09-04 21:59:57', '2020-09-04 21:59:57'),
(9, 'Botble\\Page\\Models\\Page', 6, 1, 'template', 'no-sidebar', 'full-width', '2020-09-04 22:01:29', '2020-09-04 22:01:29'),
(10, 'Botble\\Page\\Models\\Page', 6, 1, 'template', 'full-width', 'no-sidebar', '2020-09-04 22:04:25', '2020-09-04 22:04:25'),
(11, 'Botble\\Page\\Models\\Page', 7, 1, 'name', 'Rooms', 'Our Rooms', '2020-09-05 02:24:54', '2020-09-05 02:24:54'),
(12, 'Botble\\Page\\Models\\Page', 1, 1, 'template', 'default', 'full-width', '2020-09-05 09:51:20', '2020-09-05 09:51:20'),
(13, 'Botble\\Page\\Models\\Page', 1, 1, 'template', 'full-width', 'homepage', '2020-09-05 09:55:26', '2020-09-05 09:55:26');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_by` int(10) UNSIGNED NOT NULL,
  `updated_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `permissions`, `description`, `is_default`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'Superadmin', '{\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"booking-address.index\":true,\"booking-address.create\":true,\"booking-address.edit\":true,\"booking-address.destroy\":true,\"booking-room.index\":true,\"booking-room.create\":true,\"booking-room.edit\":true,\"booking-room.destroy\":true,\"booking.index\":true,\"booking.edit\":true,\"booking.destroy\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"customer.index\":true,\"customer.create\":true,\"customer.edit\":true,\"customer.destroy\":true}', 'Untuk superadmin', 0, 1, 1, '2024-08-17 01:22:44', '2024-08-17 01:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'theme--site_title', 'Hotel Miranda', NULL, NULL),
(2, 'theme--show_site_name', '0', NULL, NULL),
(3, 'theme--seo_title', 'Hotel Miranda', NULL, NULL),
(4, 'theme--seo_description', '', NULL, NULL),
(5, 'membership_authorization_at', '2020-09-17 07:25:49', NULL, NULL),
(6, 'activated_plugins', '[\"hotel\",\"testimonial\",\"faq\",\"blog\",\"contact\",\"audit-log\",\"analytics\",\"backup\",\"captcha\",\"cookie-consent\",\"translation\",\"gallery\",\"payment\",\"paystack\",\"razorpay\"]', NULL, NULL),
(7, 'theme--seo_og_image', '', NULL, NULL),
(8, 'theme--copyright', '© 2020 Miranda. All right reserved.', NULL, NULL),
(9, 'theme--favicon', 'general/favicon.png', NULL, NULL),
(10, 'theme--logo', 'general/logo.png', NULL, NULL),
(11, 'theme--logo_white', 'general/logo-white.png', NULL, NULL),
(12, 'theme--about-us', 'Lorem ipsum dolor sit amet, consect etur adipisicing elit, sed doing eius mod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitat ion ullamco laboris nisi.', NULL, NULL),
(13, 'theme--hotline', '+908 987 877 09', NULL, NULL),
(14, 'theme--address', '14/A, Miranda City, NYC', NULL, NULL),
(15, 'theme--email', 'info@webmail.com', NULL, NULL),
(16, 'theme--facebook', 'https://www.facebook.com', NULL, NULL),
(17, 'theme--twitter', 'https://twitter.com', NULL, NULL),
(18, 'theme--youtube', 'https://youtube.com', NULL, NULL),
(19, 'theme--behance', 'https://www.behance.net', NULL, NULL),
(20, 'theme--traveloka', '', NULL, NULL),
(21, 'theme--linkedin', 'https://linkedin.com', NULL, NULL),
(22, 'theme--term_of_use_url', '#', NULL, NULL),
(23, 'theme--privacy_policy_url', '#', NULL, NULL),
(24, 'theme--slider-image-1', 'sliders/04.jpg', NULL, NULL),
(25, 'theme--slider-title-1', 'The ultimate luxury experience', NULL, NULL),
(26, 'theme--slider-description-1', '<p>The Perfect<br>\nBase For You</p>', NULL, NULL),
(27, 'theme--slider-primary-button-text-1', 'Take A tour', NULL, NULL),
(28, 'theme--slider-primary-button-url-1', '/rooms', NULL, NULL),
(29, 'theme--slider-secondary-button-text-1', 'Learn more', NULL, NULL),
(30, 'theme--slider-secondary-button-url-1', '/about-us', NULL, NULL),
(31, 'theme--slider-image-2', 'sliders/05.jpg', NULL, NULL),
(32, 'theme--slider-title-2', 'The ultimate luxury experience', NULL, NULL),
(33, 'theme--slider-description-2', '<p>The Perfect<br>\nBase For You</p>', NULL, NULL),
(34, 'theme--slider-primary-button-text-2', 'Take A tour', NULL, NULL),
(35, 'theme--slider-primary-button-url-2', '/rooms', NULL, NULL),
(36, 'theme--slider-secondary-button-text-2', 'Learn more', NULL, NULL),
(37, 'theme--slider-secondary-button-url-2', '/about-us', NULL, NULL),
(38, 'theme--news_banner', 'general/banner-news.jpg', NULL, NULL),
(39, 'theme--number_of_posts_in_a_category', '12', NULL, NULL),
(40, 'theme--number_of_posts_in_a_tag', '12', NULL, NULL),
(41, 'admin_email', 'admin@botble.com', NULL, NULL),
(42, 'time_zone', 'UTC', NULL, NULL),
(43, 'locale', 'en', NULL, NULL),
(44, 'enable_send_error_reporting_via_email', '0', NULL, NULL),
(47, 'admin_title', 'Botble Technologies', NULL, NULL),
(48, 'rich_editor', 'ckeditor', NULL, NULL),
(49, 'default_admin_theme', 'default', NULL, NULL),
(50, 'enable_change_admin_theme', '1', NULL, NULL),
(51, 'enable_multi_language_in_admin', '1', NULL, NULL),
(52, 'enable_cache', '0', NULL, NULL),
(53, 'cache_time', '10', NULL, NULL),
(54, 'cache_admin_menu_enable', '0', NULL, NULL),
(57, 'cache_time_site_map', '3600', NULL, NULL),
(58, 'show_admin_bar', '1', NULL, NULL),
(59, 'blog_page_id', '2', NULL, NULL),
(60, 'permalink-botble-page-models-page', '', NULL, NULL),
(61, 'permalink-botble-hotel-models-roomtype', 'rooms', NULL, NULL),
(62, 'permalink-botble-hotel-models-food', 'foods', NULL, NULL),
(63, 'permalink-botble-blog-models-post', 'news', NULL, NULL),
(64, 'permalink-botble-blog-models-category', 'news', NULL, NULL),
(65, 'permalink-botble-blog-models-tag', 'news', NULL, NULL),
(66, 'theme--rooms_banner', 'general/banner-news.jpg', NULL, NULL),
(67, 'theme--hotel_rules', '<ul><li>No smoking, parties or events.</li>\n	<li>Check-in time from 2 PM, check-out by 10 AM.</li>\n	<li>Time to time car parking</li>\n	<li>Download Our minimal app</li>\n	<li>Browse regular our website</li>\n</ul>', NULL, NULL),
(68, 'theme--cancellation', '<p>Phasellus volutpat neque a tellus venenatis, a euismod augue facilisis. Fusce ut metus mattis, consequat metus nec, luctus lectus. Pellentesque orci quis hendrerit sed eu dolor. <strong>Cancel up</strong> to <strong>14 days</strong> to get a full refund.</p>', NULL, NULL),
(71, 'show_on_front', '1', NULL, NULL),
(77, 'enable_captcha', '0', NULL, NULL),
(78, 'captcha_type', 'v2', NULL, NULL),
(79, 'theme--cookie_consent_enable', 'yes', NULL, NULL),
(80, 'theme--cookie_consent_message', 'Your experience on this site will be improved by allowing cookies.', NULL, NULL),
(81, 'theme--cookie_consent_button_text', 'Allow cookies', NULL, NULL),
(84, 'payment_cod_status', '1', NULL, NULL),
(85, 'payment_cod_description', 'As long as your reservation\'s schedule is under 7 days, you are required to make full payment', NULL, NULL),
(86, 'payment_bank_transfer_status', '1', NULL, NULL),
(87, 'payment_bank_transfer_description', 'As long as your reservation\'s schedule is more than 7 days, you are required to make full payment', NULL, NULL),
(88, 'currencies_is_default', '1', NULL, NULL),
(89, 'default_payment_method', 'paypal', NULL, NULL),
(90, 'payment_cod_name', 'Full Payment', NULL, NULL),
(91, 'payment_bank_transfer_name', 'Down Payment', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slugs`
--

CREATE TABLE `slugs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` int(10) UNSIGNED NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slugs`
--

INSERT INTO `slugs` (`id`, `key`, `reference_id`, `reference_type`, `prefix`, `created_at`, `updated_at`) VALUES
(3, 'banh-mi', 1, 'Botble\\Hotel\\Models\\Food', 'foods', '2020-09-02 03:10:36', '2020-09-04 03:42:07'),
(4, 'travel', 1, 'Botble\\Blog\\Models\\Category', 'news', '2020-09-03 09:24:14', '2021-01-05 03:29:59'),
(5, 'each-of-our-8-double-rooms-has-its-own-distinct', 1, 'Botble\\Blog\\Models\\Post', 'news', '2020-09-03 09:24:36', '2021-01-05 03:29:59'),
(6, 'hotel', 1, 'Botble\\Blog\\Models\\Tag', 'news', '2020-09-03 09:24:37', '2020-09-04 03:42:07'),
(7, 'booking', 2, 'Botble\\Blog\\Models\\Tag', 'news', '2020-09-03 09:24:37', '2020-09-04 03:42:07'),
(8, 'each-of-our-8-double-rooms-has-its-own-distinct-1', 2, 'Botble\\Blog\\Models\\Post', 'news', '2020-09-03 09:25:13', '2021-01-05 03:29:59'),
(9, 'each-of-our-8-double-rooms-has-its-own-distinct-2', 3, 'Botble\\Blog\\Models\\Post', 'news', '2020-09-03 09:25:44', '2021-01-05 03:29:59'),
(10, 'each-of-our-8-double-rooms-has-its-own-distinct-3', 4, 'Botble\\Blog\\Models\\Post', 'news', '2020-09-03 09:50:38', '2021-01-05 03:29:59'),
(13, 'business', 2, 'Botble\\Blog\\Models\\Category', 'news', '2020-09-04 06:55:24', '2021-01-05 03:29:59'),
(14, 'creative', 3, 'Botble\\Blog\\Models\\Category', 'news', '2020-09-04 06:55:50', '2021-01-05 03:29:59'),
(15, 'technology', 4, 'Botble\\Blog\\Models\\Category', 'news', '2020-09-04 06:56:15', '2021-01-05 03:29:59'),
(42, 'duplex-restaurant', 1, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2020-09-04 20:56:27', '2020-09-04 20:56:27'),
(43, 'luxury-room', 2, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2020-09-04 20:56:55', '2020-09-04 20:56:55'),
(44, 'pacific-room', 3, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2020-09-04 20:57:42', '2020-09-04 20:57:42'),
(46, 'family-room', 4, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2020-09-04 21:21:03', '2020-09-04 21:21:03'),
(47, 'king-bed', 5, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2020-09-04 21:21:53', '2020-09-04 21:21:53'),
(48, 'special-foods', 6, 'Botble\\Gallery\\Models\\Gallery', 'galleries', '2020-09-04 21:22:25', '2020-09-04 21:22:25'),
(406, 'luxury-hall-of-fame', 1, 'Botble\\Hotel\\Models\\Room', 'rooms', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(407, 'pendora-fame', 2, 'Botble\\Hotel\\Models\\Room', 'rooms', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(408, 'pacific-room', 3, 'Botble\\Hotel\\Models\\Room', 'rooms', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(409, 'junior-suite', 4, 'Botble\\Hotel\\Models\\Room', 'rooms', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(410, 'family-suite', 5, 'Botble\\Hotel\\Models\\Room', 'rooms', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(411, 'relax-suite', 6, 'Botble\\Hotel\\Models\\Room', 'rooms', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(412, 'luxury-suite', 7, 'Botble\\Hotel\\Models\\Room', 'rooms', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(413, 'president-room', 8, 'Botble\\Hotel\\Models\\Room', 'rooms', '2021-01-05 03:29:40', '2021-01-05 03:29:40'),
(414, 'duplex-restaurant', 1, 'Botble\\Hotel\\Models\\Place', 'places', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(415, 'duplex-restaurant', 2, 'Botble\\Hotel\\Models\\Place', 'places', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(416, 'duplex-restaurant', 3, 'Botble\\Hotel\\Models\\Place', 'places', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(417, 'duplex-restaurant', 4, 'Botble\\Hotel\\Models\\Place', 'places', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(418, 'duplex-restaurant', 5, 'Botble\\Hotel\\Models\\Place', 'places', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(419, 'duplex-restaurant', 6, 'Botble\\Hotel\\Models\\Place', 'places', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(420, 'homepage', 1, 'Botble\\Page\\Models\\Page', '', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(421, 'news', 2, 'Botble\\Page\\Models\\Page', '', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(422, 'contact', 3, 'Botble\\Page\\Models\\Page', '', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(423, 'restaurant', 4, 'Botble\\Page\\Models\\Page', '', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(424, 'our-gallery', 5, 'Botble\\Page\\Models\\Page', '', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(425, 'about-us', 6, 'Botble\\Page\\Models\\Page', '', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(426, 'places', 7, 'Botble\\Page\\Models\\Page', '', '2021-01-05 03:29:57', '2021-01-05 03:29:57'),
(427, 'our-offers', 8, 'Botble\\Page\\Models\\Page', '', '2021-01-05 03:29:57', '2021-01-05 03:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `author_id`, `author_type`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'hotel', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-09-03 09:24:36', '2020-09-03 09:24:36'),
(2, 'booking', 1, 'Botble\\ACL\\Models\\User', '', 'published', '2020-09-03 09:24:37', '2020-09-03 09:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `content`, `image`, `created_at`, `updated_at`, `company`, `status`) VALUES
(1, 'Donald H. Hilixer', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>', 'testimonials/01.png', '2020-09-03 08:18:53', '2020-09-03 08:25:18', 'Founder, Hilix', 'published'),
(2, 'Rosalina D. William', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>', 'testimonials/03.png', '2020-09-03 08:25:59', '2020-09-03 08:26:34', 'Founder, qux co.', 'published'),
(3, 'Browfish Dumble', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>', 'testimonials/02.png', '2020-09-03 08:27:04', '2020-09-03 08:27:04', 'Founder, Condo', 'published');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(2, 1, 'en', 'auth', 'password', 'The provided password is incorrect.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(3, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(4, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(5, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(6, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(7, 1, 'en', 'passwords', 'sent', 'We have emailed your password reset link!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(8, 1, 'en', 'passwords', 'throttled', 'Please wait before retrying.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(9, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(10, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that email address.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(11, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(12, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(13, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(14, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(15, 1, 'en', 'validation', 'alpha', 'The :attribute must only contain letters.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(16, 1, 'en', 'validation', 'alpha_dash', 'The :attribute must only contain letters, numbers, dashes and underscores.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(17, 1, 'en', 'validation', 'alpha_num', 'The :attribute must only contain letters and numbers.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(18, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(19, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(20, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(21, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(22, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(23, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(24, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(25, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(26, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(27, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(28, 1, 'en', 'validation', 'date_equals', 'The :attribute must be a date equal to :date.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(29, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(30, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(31, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(32, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(33, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(34, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(35, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(36, 1, 'en', 'validation', 'ends_with', 'The :attribute must end with one of the following: :values.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(37, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(38, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(39, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(40, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(41, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(42, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(43, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(44, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(45, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(46, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(47, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(48, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(49, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(50, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(51, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(52, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(53, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(54, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(55, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(56, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(57, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(58, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(59, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(60, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(61, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(62, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(63, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(64, 1, 'en', 'validation', 'max.numeric', 'The :attribute must not be greater than :max.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(65, 1, 'en', 'validation', 'max.file', 'The :attribute must not be greater than :max kilobytes.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(66, 1, 'en', 'validation', 'max.string', 'The :attribute must not be greater than :max characters.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(67, 1, 'en', 'validation', 'max.array', 'The :attribute must not have more than :max items.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(68, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(69, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(70, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(71, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(72, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(73, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(74, 1, 'en', 'validation', 'multiple_of', 'The :attribute must be a multiple of :value.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(75, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(76, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(77, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(78, 1, 'en', 'validation', 'password', 'The password is incorrect.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(79, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(80, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(81, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(82, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(83, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(84, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(85, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(86, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(87, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(88, 1, 'en', 'validation', 'prohibited', 'The :attribute field is prohibited.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(89, 1, 'en', 'validation', 'prohibited_if', 'The :attribute field is prohibited when :other is :value.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(90, 1, 'en', 'validation', 'prohibited_unless', 'The :attribute field is prohibited unless :other is in :values.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(91, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(92, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(93, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(94, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(95, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(96, 1, 'en', 'validation', 'starts_with', 'The :attribute must start with one of the following: :values.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(97, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(98, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(99, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(100, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(101, 1, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(102, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(103, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(104, 1, 'en', 'core/acl/auth', 'login.username', 'Email/Username', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(105, 1, 'en', 'core/acl/auth', 'login.email', 'Email', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(106, 1, 'en', 'core/acl/auth', 'login.password', 'Password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(107, 1, 'en', 'core/acl/auth', 'login.title', 'User Login', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(108, 1, 'en', 'core/acl/auth', 'login.remember', 'Remember me?', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(109, 1, 'en', 'core/acl/auth', 'login.login', 'Sign in', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(110, 1, 'en', 'core/acl/auth', 'login.placeholder.username', 'Please enter your username', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(111, 1, 'en', 'core/acl/auth', 'login.placeholder.email', 'Please enter your email', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(112, 1, 'en', 'core/acl/auth', 'login.success', 'Login successfully!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(113, 1, 'en', 'core/acl/auth', 'login.fail', 'Wrong username or password.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(114, 1, 'en', 'core/acl/auth', 'login.not_active', 'Your account has not been activated yet!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(115, 1, 'en', 'core/acl/auth', 'login.banned', 'This account is banned.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(116, 1, 'en', 'core/acl/auth', 'login.logout_success', 'Logout successfully!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(117, 1, 'en', 'core/acl/auth', 'login.dont_have_account', 'You don\'t have account on this system, please contact administrator for more information!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(118, 1, 'en', 'core/acl/auth', 'forgot_password.title', 'Forgot Password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(119, 1, 'en', 'core/acl/auth', 'forgot_password.message', '<p>Have you forgotten your password?</p><p>Please enter your email account. System will send a email with active link to reset your password.</p>', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(120, 1, 'en', 'core/acl/auth', 'forgot_password.submit', 'Submit', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(121, 1, 'en', 'core/acl/auth', 'reset.new_password', 'New password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(122, 1, 'en', 'core/acl/auth', 'reset.password_confirmation', 'Confirm new password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(123, 1, 'en', 'core/acl/auth', 'reset.email', 'Email', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(124, 1, 'en', 'core/acl/auth', 'reset.title', 'Reset your password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(125, 1, 'en', 'core/acl/auth', 'reset.update', 'Update', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(126, 1, 'en', 'core/acl/auth', 'reset.wrong_token', 'This link is invalid or expired. Please try using reset form again.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(127, 1, 'en', 'core/acl/auth', 'reset.user_not_found', 'This username is not exist.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(128, 1, 'en', 'core/acl/auth', 'reset.success', 'Reset password successfully!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(129, 1, 'en', 'core/acl/auth', 'reset.fail', 'Token is invalid, the reset password link has been expired!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(130, 1, 'en', 'core/acl/auth', 'reset.reset.title', 'Email reset password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(131, 1, 'en', 'core/acl/auth', 'reset.send.success', 'A email was sent to your email account. Please check and complete this action.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(132, 1, 'en', 'core/acl/auth', 'reset.send.fail', 'Can not send email in this time. Please try again later.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(133, 1, 'en', 'core/acl/auth', 'reset.new-password', 'New password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(134, 1, 'en', 'core/acl/auth', 'email.reminder.title', 'Email reset password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(135, 1, 'en', 'core/acl/auth', 'password_confirmation', 'Password confirm', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(136, 1, 'en', 'core/acl/auth', 'failed', 'Failed', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(137, 1, 'en', 'core/acl/auth', 'throttle', 'Throttle', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(138, 1, 'en', 'core/acl/auth', 'not_member', 'Not a member yet?', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(139, 1, 'en', 'core/acl/auth', 'register_now', 'Register now', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(140, 1, 'en', 'core/acl/auth', 'lost_your_password', 'Lost your password?', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(141, 1, 'en', 'core/acl/auth', 'login_title', 'Admin', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(142, 1, 'en', 'core/acl/auth', 'login_via_social', 'Login with social networks', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(143, 1, 'en', 'core/acl/auth', 'back_to_login', 'Back to login page', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(144, 1, 'en', 'core/acl/auth', 'sign_in_below', 'Sign In Below', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(145, 1, 'en', 'core/acl/auth', 'languages', 'Languages', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(146, 1, 'en', 'core/acl/auth', 'reset_password', 'Reset Password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(147, 1, 'en', 'core/acl/permissions', 'notices.role_in_use', 'Cannot delete this role, it is still in use!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(148, 1, 'en', 'core/acl/permissions', 'notices.role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(149, 1, 'en', 'core/acl/permissions', 'notices.role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(150, 1, 'en', 'core/acl/permissions', 'notices.delete_global_role', 'You are not allowed to delete global roles!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(151, 1, 'en', 'core/acl/permissions', 'notices.delete_success', 'The selected role was deleted successfully!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(152, 1, 'en', 'core/acl/permissions', 'notices.modified_success', 'The selected role was modified successfully!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(153, 1, 'en', 'core/acl/permissions', 'notices.create_success', 'The new role was successfully created', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(154, 1, 'en', 'core/acl/permissions', 'notices.duplicated_success', 'The selected role was duplicated successfully', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(155, 1, 'en', 'core/acl/permissions', 'notices.no_select', 'Please select at least one record to take this action!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(156, 1, 'en', 'core/acl/permissions', 'notices.not_found', 'Role not found', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(157, 1, 'en', 'core/acl/permissions', 'name', 'Name', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(158, 1, 'en', 'core/acl/permissions', 'current_role', 'Current Role', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(159, 1, 'en', 'core/acl/permissions', 'no_role_assigned', 'No role assigned', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(160, 1, 'en', 'core/acl/permissions', 'role_assigned', 'Assigned Role', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(161, 1, 'en', 'core/acl/permissions', 'create_role', 'Create New Role', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(162, 1, 'en', 'core/acl/permissions', 'role_name', 'Name', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(163, 1, 'en', 'core/acl/permissions', 'role_description', 'Description', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(164, 1, 'en', 'core/acl/permissions', 'permission_flags', 'Permission Flags', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(165, 1, 'en', 'core/acl/permissions', 'cancel', 'Cancel', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(166, 1, 'en', 'core/acl/permissions', 'reset', 'Reset', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(167, 1, 'en', 'core/acl/permissions', 'save', 'Save', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(168, 1, 'en', 'core/acl/permissions', 'global_role_msg', 'This is a global role and cannot be modified.  You can use the Duplicate button to make a copy of this role that you can then modify.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(169, 1, 'en', 'core/acl/permissions', 'details', 'Details', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(170, 1, 'en', 'core/acl/permissions', 'duplicate', 'Duplicate', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(171, 1, 'en', 'core/acl/permissions', 'all', 'All Permissions', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(172, 1, 'en', 'core/acl/permissions', 'list_role', 'List Roles', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(173, 1, 'en', 'core/acl/permissions', 'created_on', 'Created On', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(174, 1, 'en', 'core/acl/permissions', 'created_by', 'Created By', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(175, 1, 'en', 'core/acl/permissions', 'actions', 'Actions', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(176, 1, 'en', 'core/acl/permissions', 'role_in_use', 'Cannot delete this role, it is still in use!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(177, 1, 'en', 'core/acl/permissions', 'role_delete_belong_user', 'You are not able to delete this role; it belongs to someone else!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(178, 1, 'en', 'core/acl/permissions', 'delete_global_role', 'Can not delete global role', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(179, 1, 'en', 'core/acl/permissions', 'delete_success', 'Delete role successfully', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(180, 1, 'en', 'core/acl/permissions', 'no_select', 'Please select at least one role to take this action!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(181, 1, 'en', 'core/acl/permissions', 'not_found', 'No role found!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(182, 1, 'en', 'core/acl/permissions', 'role_edit_belong_user', 'You are not able to edit this role; it belongs to someone else!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(183, 1, 'en', 'core/acl/permissions', 'modified_success', 'Modified successfully', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(184, 1, 'en', 'core/acl/permissions', 'create_success', 'Create successfully', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(185, 1, 'en', 'core/acl/permissions', 'duplicated_success', 'Duplicated successfully', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(186, 1, 'en', 'core/acl/permissions', 'options', 'Options', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(187, 1, 'en', 'core/acl/permissions', 'access_denied_message', 'You are not allowed to do this action', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(188, 1, 'en', 'core/acl/permissions', 'roles', 'Roles', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(189, 1, 'en', 'core/acl/permissions', 'role_permission', 'Roles and Permissions', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(190, 1, 'en', 'core/acl/permissions', 'user_management', 'User Management', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(191, 1, 'en', 'core/acl/permissions', 'super_user_management', 'Super User Management', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(192, 1, 'en', 'core/acl/permissions', 'action_unauthorized', 'This action is unauthorized.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(193, 1, 'en', 'core/acl/reminders', 'password', 'Passwords must be at least six characters and match the confirmation.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(194, 1, 'en', 'core/acl/reminders', 'user', 'We can\'t find a user with that e-mail address.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(195, 1, 'en', 'core/acl/reminders', 'token', 'This password reset token is invalid.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(196, 1, 'en', 'core/acl/reminders', 'sent', 'Password reminder sent!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(197, 1, 'en', 'core/acl/reminders', 'reset', 'Password has been reset!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(198, 1, 'en', 'core/acl/users', 'delete_user_logged_in', 'Can\'t delete this user. This user is logged on!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(199, 1, 'en', 'core/acl/users', 'no_select', 'Please select at least one record to take this action!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(200, 1, 'en', 'core/acl/users', 'lock_user_logged_in', 'Can\'t lock this user. This user is logged on!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(201, 1, 'en', 'core/acl/users', 'update_success', 'Update status successfully!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(202, 1, 'en', 'core/acl/users', 'save_setting_failed', 'Something went wrong when save your setting', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(203, 1, 'en', 'core/acl/users', 'not_found', 'User not found', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(204, 1, 'en', 'core/acl/users', 'email_exist', 'That email address already belongs to an existing account', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(205, 1, 'en', 'core/acl/users', 'username_exist', 'That username address already belongs to an existing account', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(206, 1, 'en', 'core/acl/users', 'update_profile_success', 'Your profile changes were successfully saved', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(207, 1, 'en', 'core/acl/users', 'password_update_success', 'Password successfully changed', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(208, 1, 'en', 'core/acl/users', 'current_password_not_valid', 'Current password is not valid', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(209, 1, 'en', 'core/acl/users', 'user_exist_in', 'User is already a member', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(210, 1, 'en', 'core/acl/users', 'email', 'Email', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(211, 1, 'en', 'core/acl/users', 'role', 'Role', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(212, 1, 'en', 'core/acl/users', 'username', 'Username', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(213, 1, 'en', 'core/acl/users', 'last_name', 'Last Name', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(214, 1, 'en', 'core/acl/users', 'first_name', 'First Name', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(215, 1, 'en', 'core/acl/users', 'message', 'Message', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(216, 1, 'en', 'core/acl/users', 'cancel_btn', 'Cancel', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(217, 1, 'en', 'core/acl/users', 'change_password', 'Change password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(218, 1, 'en', 'core/acl/users', 'current_password', 'Current password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(219, 1, 'en', 'core/acl/users', 'new_password', 'New Password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(220, 1, 'en', 'core/acl/users', 'confirm_new_password', 'Confirm New Password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(221, 1, 'en', 'core/acl/users', 'password', 'Password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(222, 1, 'en', 'core/acl/users', 'save', 'Save', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(223, 1, 'en', 'core/acl/users', 'cannot_delete', 'User could not be deleted', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(224, 1, 'en', 'core/acl/users', 'deleted', 'User deleted', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(225, 1, 'en', 'core/acl/users', 'last_login', 'Last Login', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(226, 1, 'en', 'core/acl/users', 'error_update_profile_image', 'Error when update profile image', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(227, 1, 'en', 'core/acl/users', 'email_reminder_template', '<h3>Hello :name</h3><p>The system has received a request to restore the password for your account, to complete this task please click the link below.</p><p><a href=\":link\">Reset password now</a></p><p>If not you ask recover password, please ignore this email.</p><p>This email is valid for 60 minutes after receiving the email.</p>', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(228, 1, 'en', 'core/acl/users', 'change_profile_image', 'Change Profile Image', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(229, 1, 'en', 'core/acl/users', 'new_image', 'New Image', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(230, 1, 'en', 'core/acl/users', 'loading', 'Loading', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(231, 1, 'en', 'core/acl/users', 'close', 'Close', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(232, 1, 'en', 'core/acl/users', 'update', 'Update', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(233, 1, 'en', 'core/acl/users', 'read_image_failed', 'Failed to read the image file', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(234, 1, 'en', 'core/acl/users', 'users', 'Users', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(235, 1, 'en', 'core/acl/users', 'update_avatar_success', 'Update profile image successfully!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(236, 1, 'en', 'core/acl/users', 'info.title', 'User profile', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(237, 1, 'en', 'core/acl/users', 'info.first_name', 'First Name', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(238, 1, 'en', 'core/acl/users', 'info.last_name', 'Last Name', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(239, 1, 'en', 'core/acl/users', 'info.email', 'Email', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(240, 1, 'en', 'core/acl/users', 'info.second_email', 'Secondary Email', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(241, 1, 'en', 'core/acl/users', 'info.address', 'Address', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(242, 1, 'en', 'core/acl/users', 'info.second_address', 'Secondary Address', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(243, 1, 'en', 'core/acl/users', 'info.birth_day', 'Date of birth', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(244, 1, 'en', 'core/acl/users', 'info.job', 'Job Position', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(245, 1, 'en', 'core/acl/users', 'info.mobile_number', 'Mobile Number', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(246, 1, 'en', 'core/acl/users', 'info.second_mobile_number', 'Secondary Phone', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(247, 1, 'en', 'core/acl/users', 'info.interes', 'Interests', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(248, 1, 'en', 'core/acl/users', 'info.about', 'About', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(249, 1, 'en', 'core/acl/users', 'gender.title', 'Gender', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(250, 1, 'en', 'core/acl/users', 'gender.male', 'Male', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(251, 1, 'en', 'core/acl/users', 'gender.female', 'Female', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(252, 1, 'en', 'core/acl/users', 'total_users', 'Total users', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(253, 1, 'en', 'core/acl/users', 'statuses.activated', 'Activated', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(254, 1, 'en', 'core/acl/users', 'statuses.deactivated', 'Deactivated', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(255, 1, 'en', 'core/acl/users', 'make_super', 'Make super', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(256, 1, 'en', 'core/acl/users', 'remove_super', 'Remove super', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(257, 1, 'en', 'core/acl/users', 'is_super', 'Is super?', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(258, 1, 'en', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(259, 1, 'en', 'core/acl/users', 'password_confirmation', 'Re-type password', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(260, 1, 'en', 'core/acl/users', 'select_role', 'Select role', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(261, 1, 'en', 'core/acl/users', 'create_new_user', 'Create a new user', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(262, 1, 'en', 'core/acl/users', 'cannot_delete_super_user', 'Permission denied. Cannot delete a super user!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(263, 1, 'en', 'core/acl/users', 'assigned_role', 'Assigned Role', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(264, 1, 'en', 'core/acl/users', 'no_role_assigned', 'No role assigned', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(265, 1, 'en', 'core/acl/users', 'view_user_profile', 'View user\'s profile', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(266, 1, 'vi', 'core/acl/auth', 'login.username', 'Tên truy cập', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(267, 1, 'vi', 'core/acl/auth', 'login.password', 'Mật khẩu', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(268, 1, 'vi', 'core/acl/auth', 'login.title', 'Đăng nhập vào quản trị', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(269, 1, 'vi', 'core/acl/auth', 'login.remember', 'Nhớ mật khẩu?', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(270, 1, 'vi', 'core/acl/auth', 'login.login', 'Đăng nhập', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(271, 1, 'vi', 'core/acl/auth', 'login.placeholder.username', 'Vui lòng nhập tên truy cập', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(272, 1, 'vi', 'core/acl/auth', 'login.placeholder.email', 'Vui lòng nhập email', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(273, 1, 'vi', 'core/acl/auth', 'login.success', 'Đăng nhập thành công!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(274, 1, 'vi', 'core/acl/auth', 'login.fail', 'Sai tên truy cập hoặc mật khẩu.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(275, 1, 'vi', 'core/acl/auth', 'login.not_active', 'Tài khoản của bạn chưa được kích hoạt!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(276, 1, 'vi', 'core/acl/auth', 'login.banned', 'Tài khoản này đã bị khóa.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(277, 1, 'vi', 'core/acl/auth', 'login.logout_success', 'Đăng xuất thành công!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(278, 1, 'vi', 'core/acl/auth', 'login.dont_have_account', 'Bạn không có tài khoản trong hệ thống, vui lòng liên hệ quản trị viên!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(279, 1, 'vi', 'core/acl/auth', 'login.email', 'Email', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(280, 1, 'vi', 'core/acl/auth', 'forgot_password.title', 'Quên mật khẩu', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(281, 1, 'vi', 'core/acl/auth', 'forgot_password.message', '<p>Quên mật khẩu?</p><p>Vui lòng nhập email đăng nhập tài khoản của bạn để hệ thống gửi liên kết khôi phục mật khẩu.</p>', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(282, 1, 'vi', 'core/acl/auth', 'forgot_password.submit', 'Hoàn tất', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(283, 1, 'vi', 'core/acl/auth', 'reset.new_password', 'Mật khẩu mới', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(284, 1, 'vi', 'core/acl/auth', 'reset.password_confirmation', 'Xác nhận mật khẩu mới', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(285, 1, 'vi', 'core/acl/auth', 'reset.title', 'Khôi phục mật khẩu', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(286, 1, 'vi', 'core/acl/auth', 'reset.update', 'Cập nhật', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(287, 1, 'vi', 'core/acl/auth', 'reset.wrong_token', 'Liên kết này không chính xác hoặc đã hết hiệu lực, vui lòng yêu cầu khôi phục mật khẩu lại!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(288, 1, 'vi', 'core/acl/auth', 'reset.user_not_found', 'Tên đăng nhập không tồn tại.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(289, 1, 'vi', 'core/acl/auth', 'reset.success', 'Khôi phục mật khẩu thành công!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(290, 1, 'vi', 'core/acl/auth', 'reset.fail', 'Token không hợp lệ hoặc liên kết khôi phục mật khẩu đã hết thời gian hiệu lực!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(291, 1, 'vi', 'core/acl/auth', 'reset.reset.title', 'Email khôi phục mật khẩu', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(292, 1, 'vi', 'core/acl/auth', 'reset.send.success', 'Một email khôi phục mật khẩu đã được gửi tới email của bạn, vui lòng kiểm tra và hoàn tất yêu cầu.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(293, 1, 'vi', 'core/acl/auth', 'reset.send.fail', 'Không thể gửi email trong lúc này. Vui lòng thực hiện lại sau.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(294, 1, 'vi', 'core/acl/auth', 'reset.new-password', 'Mật khẩu mới', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(295, 1, 'vi', 'core/acl/auth', 'reset.email', 'Email', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(296, 1, 'vi', 'core/acl/auth', 'email.reminder.title', 'Email khôi phục mật khẩu', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(297, 1, 'vi', 'core/acl/auth', 'failed', 'Không thành công', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(298, 1, 'vi', 'core/acl/auth', 'password_confirmation', 'Xác nhận mật khẩu', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(299, 1, 'vi', 'core/acl/auth', 'throttle', 'Throttle', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(300, 1, 'vi', 'core/acl/auth', 'back_to_login', 'Quay lại trang đăng nhập', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(301, 1, 'vi', 'core/acl/auth', 'login_title', 'Đăng nhập vào quản trị', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(302, 1, 'vi', 'core/acl/auth', 'login_via_social', 'Đăng nhập thông qua mạng xã hội', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(303, 1, 'vi', 'core/acl/auth', 'lost_your_password', 'Quên mật khẩu?', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(304, 1, 'vi', 'core/acl/auth', 'not_member', 'Chưa là thành viên?', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(305, 1, 'vi', 'core/acl/auth', 'register_now', 'Đăng ký ngay', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(306, 1, 'vi', 'core/acl/auth', 'sign_in_below', 'Đăng nhập', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(307, 1, 'vi', 'core/acl/auth', 'languages', 'Ngôn ngữ', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(308, 1, 'vi', 'core/acl/auth', 'reset_password', 'Khôi phục mật khẩu', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(309, 1, 'vi', 'core/acl/permissions', 'notices.role_in_use', 'Không thể xóa quyền người dùng này vì nó đang được sử dụng!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(310, 1, 'vi', 'core/acl/permissions', 'notices.role_delete_belong_user', 'Không thể xóa quyền hạn này vì nó thuộc về người khác!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(311, 1, 'vi', 'core/acl/permissions', 'notices.role_edit_belong_user', 'Bạn không được phép sửa quyền này vì nó thuộc về người khác', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(312, 1, 'vi', 'core/acl/permissions', 'notices.delete_global_role', 'Bạn không thể xóa quyền người dùng hệ thống!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(313, 1, 'vi', 'core/acl/permissions', 'notices.delete_success', 'Quyền người dùng đã được xóa!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(314, 1, 'vi', 'core/acl/permissions', 'notices.modified_success', 'Quyền người dùng đã được cập nhật thành công!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(315, 1, 'vi', 'core/acl/permissions', 'notices.create_success', 'Quyền người dùng mới đã được tạo thành công!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(316, 1, 'vi', 'core/acl/permissions', 'notices.duplicated_success', 'Quyền người dùng đã được sao chép thành công!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(317, 1, 'vi', 'core/acl/permissions', 'notices.no_select', 'Hãy chọn ít nhất một quyền người dùng để thực hiện hành động này!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(318, 1, 'vi', 'core/acl/permissions', 'notices.not_found', 'Không tìm thấy quyền người dùng này', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(319, 1, 'vi', 'core/acl/permissions', 'list', 'Danh sách phân quyền', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(320, 1, 'vi', 'core/acl/permissions', 'name', 'Tên', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(321, 1, 'vi', 'core/acl/permissions', 'current_role', 'Quyền hiện tại', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(322, 1, 'vi', 'core/acl/permissions', 'no_role_assigned', 'Không có quyền hạn nào', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(323, 1, 'vi', 'core/acl/permissions', 'role_assigned', 'Quyền đã được gán', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(324, 1, 'vi', 'core/acl/permissions', 'create_role', 'Tạo quyền mới', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(325, 1, 'vi', 'core/acl/permissions', 'role_name', 'Tên', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(326, 1, 'vi', 'core/acl/permissions', 'role_description', 'Mô tả', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(327, 1, 'vi', 'core/acl/permissions', 'permission_flags', 'Cờ đánh dấu quyền hạn', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(328, 1, 'vi', 'core/acl/permissions', 'cancel', 'Hủy bỏ', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(329, 1, 'vi', 'core/acl/permissions', 'reset', 'Làm lại', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(330, 1, 'vi', 'core/acl/permissions', 'save', 'Lưu', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(331, 1, 'vi', 'core/acl/permissions', 'global_role_msg', 'Đây là một phân quyền toàn cục và không thể thay đổi.  Bạn có thể sử dụng nút \"Nhân bản\" để tạo một bản sao chép cho phân quyền này và chỉnh sửa.', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(332, 1, 'vi', 'core/acl/permissions', 'details', 'Chi tiết', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(333, 1, 'vi', 'core/acl/permissions', 'duplicate', 'Nhân bản', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(334, 1, 'vi', 'core/acl/permissions', 'all', 'Tất cả phân quyền', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(335, 1, 'vi', 'core/acl/permissions', 'list_role', 'Danh sách quyền', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(336, 1, 'vi', 'core/acl/permissions', 'created_on', 'Ngày tạo', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(337, 1, 'vi', 'core/acl/permissions', 'created_by', 'Được tạo bởi', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(338, 1, 'vi', 'core/acl/permissions', 'actions', 'Tác vụ', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(339, 1, 'vi', 'core/acl/permissions', 'create_success', 'Tạo thành công!', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(340, 1, 'vi', 'core/acl/permissions', 'delete_global_role', 'Không thể xóa quyền hệ thống', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(341, 1, 'vi', 'core/acl/permissions', 'delete_success', 'Xóa quyền thành công', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(342, 1, 'vi', 'core/acl/permissions', 'duplicated_success', 'Nhân bản thành công', '2021-05-08 21:17:51', '2021-05-08 21:17:51'),
(343, 1, 'vi', 'core/acl/permissions', 'modified_success', 'Sửa thành công', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(344, 1, 'vi', 'core/acl/permissions', 'no_select', 'Hãy chọn ít nhất một quyền để thực hiện hành động này!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(345, 1, 'vi', 'core/acl/permissions', 'not_found', 'Không tìm thấy quyền thành viên nào!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(346, 1, 'vi', 'core/acl/permissions', 'options', 'Tùy chọn', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(347, 1, 'vi', 'core/acl/permissions', 'role_delete_belong_user', 'Không thể xóa quyền hạn này vì nó thuộc về người khác!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(348, 1, 'vi', 'core/acl/permissions', 'role_edit_belong_user', 'Bạn không được phép sửa quyền này vì nó thuộc về người khác', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(349, 1, 'vi', 'core/acl/permissions', 'role_in_use', 'Không thể xóa quyền người dùng này vì nó đang được sử dụng!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(350, 1, 'vi', 'core/acl/permissions', 'access_denied_message', 'Bạn không có quyền sử dụng chức năng này!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(351, 1, 'vi', 'core/acl/permissions', 'roles', 'Quyền', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(352, 1, 'vi', 'core/acl/permissions', 'role_permission', 'Nhóm và phân quyền', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(353, 1, 'vi', 'core/acl/permissions', 'user_management', 'Quản lý người dùng hệ thống', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(354, 1, 'vi', 'core/acl/permissions', 'super_user_management', 'Quản lý người dùng cấp cao', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(355, 1, 'vi', 'core/acl/reminders', 'password', 'Mật khẩu phải ít nhất 6 kí tự và trùng khớp với mật khẩu xác nhận.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(356, 1, 'vi', 'core/acl/reminders', 'user', 'Hệ thống không thể tìm thấy tài khoản với email này.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(357, 1, 'vi', 'core/acl/reminders', 'token', 'Mã khôi phục mật khẩu này không hợp lệ.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(358, 1, 'vi', 'core/acl/reminders', 'sent', 'Liên kết khôi phục mật khẩu đã được gửi!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(359, 1, 'vi', 'core/acl/reminders', 'reset', 'Mật khẩu đã được thay đổi!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(360, 1, 'vi', 'core/acl/users', 'delete_user_logged_in', 'Không thể xóa người dùng đang đăng nhập hệ thống!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(361, 1, 'vi', 'core/acl/users', 'no_select', 'Hãy chọn ít nhất một trường để thực hiện hành động này!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(362, 1, 'vi', 'core/acl/users', 'lock_user_logged_in', 'Không thể khóa người dùng đang đăng nhập hệ thống!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(363, 1, 'vi', 'core/acl/users', 'update_success', 'Cập nhật trạng thái thành công!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(364, 1, 'vi', 'core/acl/users', 'save_setting_failed', 'Có lỗi xảy ra trong quá trình lưu cài đặt của người dùng', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(365, 1, 'vi', 'core/acl/users', 'not_found', 'Không tìm thấy người dùng', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(366, 1, 'vi', 'core/acl/users', 'email_exist', 'Email này đã được sử dụng bởi người dùng khác trong hệ thống', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(367, 1, 'vi', 'core/acl/users', 'username_exist', 'Tên đăng nhập này đã được sử dụng bởi người dùng khác trong hệ thống', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(368, 1, 'vi', 'core/acl/users', 'update_profile_success', 'Thông tin tài khoản của bạn đã được cập nhật thành công', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(369, 1, 'vi', 'core/acl/users', 'password_update_success', 'Cập nhật mật khẩu thành công', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(370, 1, 'vi', 'core/acl/users', 'current_password_not_valid', 'Mật khẩu hiện tại không chính xác', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(371, 1, 'vi', 'core/acl/users', 'user_exist_in', 'Người dùng đã là thành viên', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(372, 1, 'vi', 'core/acl/users', 'email', 'Email', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(373, 1, 'vi', 'core/acl/users', 'username', 'Tên đăng nhập', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(374, 1, 'vi', 'core/acl/users', 'role', 'Phân quyền', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(375, 1, 'vi', 'core/acl/users', 'first_name', 'Họ', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(376, 1, 'vi', 'core/acl/users', 'last_name', 'Tên', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(377, 1, 'vi', 'core/acl/users', 'message', 'Thông điệp', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(378, 1, 'vi', 'core/acl/users', 'cancel_btn', 'Hủy bỏ', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(379, 1, 'vi', 'core/acl/users', 'password', 'Mật khẩu', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(380, 1, 'vi', 'core/acl/users', 'new_password', 'Mật khẩu mới', '2021-05-08 21:17:52', '2021-05-08 21:17:52');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(381, 1, 'vi', 'core/acl/users', 'save', 'Lưu', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(382, 1, 'vi', 'core/acl/users', 'confirm_new_password', 'Xác nhận mật khẩu mới', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(383, 1, 'vi', 'core/acl/users', 'deleted', 'Xóa thành viên thành công', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(384, 1, 'vi', 'core/acl/users', 'cannot_delete', 'Không thể xóa thành viên', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(385, 1, 'vi', 'core/acl/users', 'list', 'Danh sách thành viên', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(386, 1, 'vi', 'core/acl/users', 'last_login', 'Lần cuối đăng nhập', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(387, 1, 'vi', 'core/acl/users', 'error_update_profile_image', 'Có lỗi trong quá trình đổi ảnh đại diện', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(388, 1, 'vi', 'core/acl/users', 'email_reminder_template', '<h3>Xin chào :name</h3><p>Hệ thống vừa nhận được yêu cầu khôi phục mật khẩu cho tài khoản của bạn, để hoàn tất tác vụ này vui lòng click vào đường link bên dưới.</p><p><a href=\":link\">Khôi phục mật khẩu</a></p><p>Nếu không phải bạn yêu cầu khôi phục mật khẩu, vui lòng bỏ qua email này.</p><p>Email này có giá trị trong vòng 60 phút kể từ lúc nhận được email.</p>', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(389, 1, 'vi', 'core/acl/users', 'change_profile_image', 'Thay đổi ảnh đại diện', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(390, 1, 'vi', 'core/acl/users', 'new_image', 'Ảnh mới', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(391, 1, 'vi', 'core/acl/users', 'loading', 'Đang tải', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(392, 1, 'vi', 'core/acl/users', 'close', 'Đóng', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(393, 1, 'vi', 'core/acl/users', 'update', 'Cập nhật', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(394, 1, 'vi', 'core/acl/users', 'read_image_failed', 'Không đọc được nội dung của hình ảnh', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(395, 1, 'vi', 'core/acl/users', 'update_avatar_success', 'Cập nhật ảnh đại diện thành công!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(396, 1, 'vi', 'core/acl/users', 'users', 'Quản trị viên', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(397, 1, 'vi', 'core/acl/users', 'info.title', 'Thông tin người dùng', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(398, 1, 'vi', 'core/acl/users', 'info.first_name', 'Họ', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(399, 1, 'vi', 'core/acl/users', 'info.last_name', 'Tên', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(400, 1, 'vi', 'core/acl/users', 'info.email', 'Email', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(401, 1, 'vi', 'core/acl/users', 'info.second_email', 'Email dự phòng', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(402, 1, 'vi', 'core/acl/users', 'info.address', 'Địa chỉ', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(403, 1, 'vi', 'core/acl/users', 'info.second_address', 'Địa chỉ dự phòng', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(404, 1, 'vi', 'core/acl/users', 'info.birth_day', 'Ngày sinh', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(405, 1, 'vi', 'core/acl/users', 'info.job', 'Nghề nghiệp', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(406, 1, 'vi', 'core/acl/users', 'info.mobile_number', 'Số điện thoại di động', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(407, 1, 'vi', 'core/acl/users', 'info.second_mobile_number', 'Số điện thoại dự phòng', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(408, 1, 'vi', 'core/acl/users', 'info.interes', 'Sở thích', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(409, 1, 'vi', 'core/acl/users', 'info.about', 'Giới thiệu', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(410, 1, 'vi', 'core/acl/users', 'gender.title', 'Giới tính', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(411, 1, 'vi', 'core/acl/users', 'gender.male', 'nam', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(412, 1, 'vi', 'core/acl/users', 'gender.female', 'nữ', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(413, 1, 'vi', 'core/acl/users', 'statuses.activated', 'Đang hoạt động', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(414, 1, 'vi', 'core/acl/users', 'statuses.deactivated', 'Đã khoá', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(415, 1, 'vi', 'core/acl/users', 'change_password', 'Thay đổi mật khẩu', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(416, 1, 'vi', 'core/acl/users', 'current_password', 'Mật khẩu hiện tại', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(417, 1, 'vi', 'core/acl/users', 'make_super', 'Thiết lập quyền cao nhất', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(418, 1, 'vi', 'core/acl/users', 'remove_super', 'Loại bỏ quyền cao nhất', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(419, 1, 'vi', 'core/acl/users', 'is_super', 'Quyền cao nhất?', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(420, 1, 'vi', 'core/acl/users', 'email_placeholder', 'Ex: example@gmail.com', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(421, 1, 'vi', 'core/acl/users', 'password_confirmation', 'Nhập lại mật khẩu', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(422, 1, 'vi', 'core/acl/users', 'select_role', 'Chọn nhóm', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(423, 1, 'vi', 'core/acl/users', 'create_new_user', 'Tạo tài khoản quản trị viên mới', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(424, 1, 'vi', 'core/acl/users', 'cannot_delete_super_user', 'Vượt quyền hạn, không thể xoá quản trị viên cấp cao nhất!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(425, 1, 'en', 'core/base/base', 'yes', 'Yes', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(426, 1, 'en', 'core/base/base', 'no', 'No', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(427, 1, 'en', 'core/base/base', 'is_default', 'Is default?', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(428, 1, 'en', 'core/base/base', 'proc_close_disabled_error', 'Function proc_close() is disabled. Please contact your hosting provider to enable\n    it. Or you can add to .env: CAN_EXECUTE_COMMAND=false to disable this feature.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(429, 1, 'en', 'core/base/base', 'email_template.header', 'Email template header', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(430, 1, 'en', 'core/base/base', 'email_template.footer', 'Email template footer', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(431, 1, 'en', 'core/base/base', 'email_template.site_title', 'Site title', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(432, 1, 'en', 'core/base/base', 'email_template.site_url', 'Site URL', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(433, 1, 'en', 'core/base/base', 'email_template.site_logo', 'Site Logo', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(434, 1, 'en', 'core/base/base', 'email_template.date_time', 'Current date time', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(435, 1, 'en', 'core/base/base', 'email_template.date_year', 'Current year', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(436, 1, 'en', 'core/base/base', 'email_template.site_admin_email', 'Site admin email', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(437, 1, 'en', 'core/base/base', 'change_image', 'Change image', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(438, 1, 'en', 'core/base/base', 'delete_image', 'Delete image', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(439, 1, 'en', 'core/base/base', 'preview_image', 'Preview image', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(440, 1, 'en', 'core/base/base', 'image', 'Image', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(441, 1, 'en', 'core/base/base', 'using_button', 'Using button', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(442, 1, 'en', 'core/base/base', 'select_image', 'Select image', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(443, 1, 'en', 'core/base/base', 'to_add_more_image', 'to add more images', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(444, 1, 'en', 'core/base/base', 'add_image', 'Add image', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(445, 1, 'en', 'core/base/cache', 'cache_management', 'Cache management', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(446, 1, 'en', 'core/base/cache', 'cache_commands', 'Clear cache commands', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(447, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.title', 'Clear all CMS cache', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(448, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.description', 'Clear CMS caching: database caching, static blocks... Run this command when you don\'t see the changes after updating data.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(449, 1, 'en', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Cache cleaned', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(450, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Refresh compiled views', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(451, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Clear compiled views to make views up to date.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(452, 1, 'en', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Cache view refreshed', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(453, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.title', 'Clear config cache', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(454, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.description', 'You might need to refresh the config caching when you change something on production environment.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(455, 1, 'en', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Config cache cleaned', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(456, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.title', 'Clear route cache', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(457, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.description', 'Clear cache routing.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(458, 1, 'en', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'The route cache has been cleaned', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(459, 1, 'en', 'core/base/cache', 'commands.clear_log.title', 'Clear log', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(460, 1, 'en', 'core/base/cache', 'commands.clear_log.description', 'Clear system log files', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(461, 1, 'en', 'core/base/cache', 'commands.clear_log.success_msg', 'The system log has been cleaned', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(462, 1, 'en', 'core/base/enums', 'statuses.draft', 'Draft', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(463, 1, 'en', 'core/base/enums', 'statuses.pending', 'Pending', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(464, 1, 'en', 'core/base/enums', 'statuses.published', 'Published', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(465, 1, 'en', 'core/base/errors', '401_title', 'Permission Denied', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(466, 1, 'en', 'core/base/errors', '401_msg', '<li>You have not been granted access to the section by the administrator.</li>\n	                <li>You may have the wrong account type.</li>\n	                <li>You are not authorized to view the requested resource.</li>\n	                <li>Your subscription may have expired.</li>', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(467, 1, 'en', 'core/base/errors', '404_title', 'Page could not be found', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(468, 1, 'en', 'core/base/errors', '404_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(469, 1, 'en', 'core/base/errors', '500_title', 'Page could not be loaded', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(470, 1, 'en', 'core/base/errors', '500_msg', '<li>The page you requested does not exist.</li>\n	                <li>The link you clicked is no longer.</li>\n	                <li>The page may have moved to a new location.</li>\n	                <li>An error may have occurred.</li>\n	                <li>You are not authorized to view the requested resource.</li>', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(471, 1, 'en', 'core/base/errors', 'reasons', 'This may have occurred because of several reasons', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(472, 1, 'en', 'core/base/errors', 'try_again', 'Please try again in a few minutes, or alternatively return to the homepage by <a href=\"http://miranda.local/admin\">clicking here</a>.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(473, 1, 'en', 'core/base/errors', 'not_found', 'Not Found', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(474, 1, 'en', 'core/base/forms', 'choose_image', 'Choose image', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(475, 1, 'en', 'core/base/forms', 'actions', 'Actions', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(476, 1, 'en', 'core/base/forms', 'save', 'Save', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(477, 1, 'en', 'core/base/forms', 'save_and_continue', 'Save & Edit', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(478, 1, 'en', 'core/base/forms', 'image', 'Image', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(479, 1, 'en', 'core/base/forms', 'image_placeholder', 'Insert path of image or click upload button', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(480, 1, 'en', 'core/base/forms', 'create', 'Create', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(481, 1, 'en', 'core/base/forms', 'edit', 'Edit', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(482, 1, 'en', 'core/base/forms', 'permalink', 'Permalink', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(483, 1, 'en', 'core/base/forms', 'ok', 'OK', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(484, 1, 'en', 'core/base/forms', 'cancel', 'Cancel', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(485, 1, 'en', 'core/base/forms', 'character_remain', 'character(s) remain', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(486, 1, 'en', 'core/base/forms', 'template', 'Template', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(487, 1, 'en', 'core/base/forms', 'choose_file', 'Choose file', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(488, 1, 'en', 'core/base/forms', 'file', 'File', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(489, 1, 'en', 'core/base/forms', 'content', 'Content', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(490, 1, 'en', 'core/base/forms', 'description', 'Description', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(491, 1, 'en', 'core/base/forms', 'name', 'Name', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(492, 1, 'en', 'core/base/forms', 'slug', 'Slug', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(493, 1, 'en', 'core/base/forms', 'title', 'Title', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(494, 1, 'en', 'core/base/forms', 'value', 'Value', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(495, 1, 'en', 'core/base/forms', 'name_placeholder', 'Name', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(496, 1, 'en', 'core/base/forms', 'alias_placeholder', 'Alias', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(497, 1, 'en', 'core/base/forms', 'description_placeholder', 'Short description', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(498, 1, 'en', 'core/base/forms', 'parent', 'Parent', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(499, 1, 'en', 'core/base/forms', 'icon', 'Icon', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(500, 1, 'en', 'core/base/forms', 'icon_placeholder', 'Ex: fa fa-home', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(501, 1, 'en', 'core/base/forms', 'order_by', 'Order by', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(502, 1, 'en', 'core/base/forms', 'order_by_placeholder', 'Order by', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(503, 1, 'en', 'core/base/forms', 'is_featured', 'Is featured?', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(504, 1, 'en', 'core/base/forms', 'is_default', 'Is default?', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(505, 1, 'en', 'core/base/forms', 'update', 'Update', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(506, 1, 'en', 'core/base/forms', 'publish', 'Publish', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(507, 1, 'en', 'core/base/forms', 'remove_image', 'Remove image', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(508, 1, 'en', 'core/base/forms', 'remove_file', 'Remove file', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(509, 1, 'en', 'core/base/forms', 'order', 'Order', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(510, 1, 'en', 'core/base/forms', 'alias', 'Alias', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(511, 1, 'en', 'core/base/forms', 'basic_information', 'Basic information', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(512, 1, 'en', 'core/base/forms', 'short_code', 'Shortcode', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(513, 1, 'en', 'core/base/forms', 'add_short_code', 'Add a shortcode', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(514, 1, 'en', 'core/base/forms', 'add', 'Add', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(515, 1, 'en', 'core/base/forms', 'link', 'Link', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(516, 1, 'en', 'core/base/forms', 'show_hide_editor', 'Show/Hide Editor', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(517, 1, 'en', 'core/base/forms', 'basic_info_title', 'Basic information', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(518, 1, 'en', 'core/base/layouts', 'platform_admin', 'Platform Administration', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(519, 1, 'en', 'core/base/layouts', 'dashboard', 'Dashboard', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(520, 1, 'en', 'core/base/layouts', 'widgets', 'Widgets', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(521, 1, 'en', 'core/base/layouts', 'plugins', 'Plugins', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(522, 1, 'en', 'core/base/layouts', 'settings', 'Settings', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(523, 1, 'en', 'core/base/layouts', 'setting_general', 'General', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(524, 1, 'en', 'core/base/layouts', 'setting_email', 'Email', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(525, 1, 'en', 'core/base/layouts', 'system_information', 'System information', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(526, 1, 'en', 'core/base/layouts', 'theme', 'Theme', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(527, 1, 'en', 'core/base/layouts', 'copyright', 'Copyright :year &copy; :company. Version: <span>:version</span>', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(528, 1, 'en', 'core/base/layouts', 'profile', 'Profile', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(529, 1, 'en', 'core/base/layouts', 'logout', 'Logout', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(530, 1, 'en', 'core/base/layouts', 'no_search_result', 'No results found, please try with different keywords.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(531, 1, 'en', 'core/base/layouts', 'home', 'Home', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(532, 1, 'en', 'core/base/layouts', 'search', 'Search', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(533, 1, 'en', 'core/base/layouts', 'add_new', 'Add new', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(534, 1, 'en', 'core/base/layouts', 'n_a', 'N/A', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(535, 1, 'en', 'core/base/layouts', 'page_loaded_time', 'Page loaded in', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(536, 1, 'en', 'core/base/layouts', 'view_website', 'View website', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(537, 1, 'en', 'core/base/mail', 'send-fail', 'Send email failed', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(538, 1, 'en', 'core/base/notices', 'create_success_message', 'Created successfully', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(539, 1, 'en', 'core/base/notices', 'update_success_message', 'Updated successfully', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(540, 1, 'en', 'core/base/notices', 'delete_success_message', 'Deleted successfully', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(541, 1, 'en', 'core/base/notices', 'success_header', 'Success!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(542, 1, 'en', 'core/base/notices', 'error_header', 'Error!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(543, 1, 'en', 'core/base/notices', 'no_select', 'Please select at least one record to perform this action!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(544, 1, 'en', 'core/base/notices', 'processing_request', 'We are processing your request.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(545, 1, 'en', 'core/base/notices', 'error', 'Error!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(546, 1, 'en', 'core/base/notices', 'success', 'Success!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(547, 1, 'en', 'core/base/notices', 'info', 'Info!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(548, 1, 'en', 'core/base/notices', 'enum.validate_message', 'The :attribute value you have entered is invalid.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(549, 1, 'en', 'core/base/system', 'no_select', 'Please select at least one record to take this action!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(550, 1, 'en', 'core/base/system', 'cannot_find_user', 'Unable to find specified user', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(551, 1, 'en', 'core/base/system', 'supper_revoked', 'Super user access revoked', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(552, 1, 'en', 'core/base/system', 'cannot_revoke_yourself', 'Can not revoke supper user access permission yourself!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(553, 1, 'en', 'core/base/system', 'cant_remove_supper', 'You don\'t has permission to remove this super user', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(554, 1, 'en', 'core/base/system', 'cant_find_user_with_email', 'Unable to find user with specified email address', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(555, 1, 'en', 'core/base/system', 'supper_granted', 'Super user access granted', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(556, 1, 'en', 'core/base/system', 'delete_log_success', 'Delete log file successfully!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(557, 1, 'en', 'core/base/system', 'get_member_success', 'Member list retrieved successfully', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(558, 1, 'en', 'core/base/system', 'error_occur', 'The following errors occurred', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(559, 1, 'en', 'core/base/system', 'user_management', 'User Management', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(560, 1, 'en', 'core/base/system', 'user_management_description', 'Manage users.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(561, 1, 'en', 'core/base/system', 'role_and_permission', 'Roles and Permissions', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(562, 1, 'en', 'core/base/system', 'role_and_permission_description', 'Manage the available roles.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(563, 1, 'en', 'core/base/system', 'user.list_super', 'List Super Users', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(564, 1, 'en', 'core/base/system', 'user.email', 'Email', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(565, 1, 'en', 'core/base/system', 'user.last_login', 'Last Login', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(566, 1, 'en', 'core/base/system', 'user.username', 'Username', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(567, 1, 'en', 'core/base/system', 'user.add_user', 'Add Super User', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(568, 1, 'en', 'core/base/system', 'user.cancel', 'Cancel', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(569, 1, 'en', 'core/base/system', 'user.create', 'Create', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(570, 1, 'en', 'core/base/system', 'options.features', 'Feature Access Control', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(571, 1, 'en', 'core/base/system', 'options.feature_description', 'Manage the available.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(572, 1, 'en', 'core/base/system', 'options.manage_super', 'Super User Management', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(573, 1, 'en', 'core/base/system', 'options.manage_super_description', 'Add/remove super users.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(574, 1, 'en', 'core/base/system', 'options.info', 'System information', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(575, 1, 'en', 'core/base/system', 'options.info_description', 'All information about current system configuration.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(576, 1, 'en', 'core/base/system', 'info.title', 'System information', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(577, 1, 'en', 'core/base/system', 'info.cache', 'Cache', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(578, 1, 'en', 'core/base/system', 'info.locale', 'Active locale', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(579, 1, 'en', 'core/base/system', 'info.environment', 'Environment', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(580, 1, 'en', 'core/base/system', 'disabled_in_demo_mode', 'You cannot do it in demo mode!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(581, 1, 'en', 'core/base/system', 'report_description', 'Please share this information for troubleshooting', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(582, 1, 'en', 'core/base/system', 'get_system_report', 'Get System Report', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(583, 1, 'en', 'core/base/system', 'system_environment', 'System Environment', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(584, 1, 'en', 'core/base/system', 'framework_version', 'Framework Version', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(585, 1, 'en', 'core/base/system', 'timezone', 'Timezone', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(586, 1, 'en', 'core/base/system', 'debug_mode', 'Debug Mode', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(587, 1, 'en', 'core/base/system', 'storage_dir_writable', 'Storage Dir Writable', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(588, 1, 'en', 'core/base/system', 'cache_dir_writable', 'Cache Dir Writable', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(589, 1, 'en', 'core/base/system', 'app_size', 'App Size', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(590, 1, 'en', 'core/base/system', 'server_environment', 'Server Environment', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(591, 1, 'en', 'core/base/system', 'php_version', 'PHP Version', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(592, 1, 'en', 'core/base/system', 'php_version_error', 'PHP must be >= :version', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(593, 1, 'en', 'core/base/system', 'server_software', 'Server Software', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(594, 1, 'en', 'core/base/system', 'server_os', 'Server OS', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(595, 1, 'en', 'core/base/system', 'database', 'Database', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(596, 1, 'en', 'core/base/system', 'ssl_installed', 'SSL Installed', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(597, 1, 'en', 'core/base/system', 'cache_driver', 'Cache Driver', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(598, 1, 'en', 'core/base/system', 'session_driver', 'Session Driver', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(599, 1, 'en', 'core/base/system', 'queue_connection', 'Queue Connection', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(600, 1, 'en', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(601, 1, 'en', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(602, 1, 'en', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(603, 1, 'en', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(604, 1, 'en', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(605, 1, 'en', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(606, 1, 'en', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(607, 1, 'en', 'core/base/system', 'extra_stats', 'Extra Stats', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(608, 1, 'en', 'core/base/system', 'installed_packages', 'Installed packages and their version numbers', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(609, 1, 'en', 'core/base/system', 'extra_information', 'Extra Information', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(610, 1, 'en', 'core/base/system', 'copy_report', 'Copy Report', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(611, 1, 'en', 'core/base/system', 'package_name', 'Package Name', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(612, 1, 'en', 'core/base/system', 'dependency_name', 'Dependency Name', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(613, 1, 'en', 'core/base/system', 'version', 'Version', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(614, 1, 'en', 'core/base/system', 'cms_version', 'CMS Version', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(615, 1, 'en', 'core/base/system', 'imagick_or_gd_ext', 'Imagick/GD Ext', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(616, 1, 'en', 'core/base/tables', 'id', 'ID', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(617, 1, 'en', 'core/base/tables', 'name', 'Name', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(618, 1, 'en', 'core/base/tables', 'slug', 'Slug', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(619, 1, 'en', 'core/base/tables', 'title', 'Title', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(620, 1, 'en', 'core/base/tables', 'order_by', 'Order By', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(621, 1, 'en', 'core/base/tables', 'order', 'Order', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(622, 1, 'en', 'core/base/tables', 'status', 'Status', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(623, 1, 'en', 'core/base/tables', 'created_at', 'Created At', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(624, 1, 'en', 'core/base/tables', 'updated_at', 'Updated At', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(625, 1, 'en', 'core/base/tables', 'description', 'Description', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(626, 1, 'en', 'core/base/tables', 'operations', 'Operations', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(627, 1, 'en', 'core/base/tables', 'url', 'URL', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(628, 1, 'en', 'core/base/tables', 'author', 'Author', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(629, 1, 'en', 'core/base/tables', 'notes', 'Notes', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(630, 1, 'en', 'core/base/tables', 'column', 'Column', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(631, 1, 'en', 'core/base/tables', 'origin', 'Origin', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(632, 1, 'en', 'core/base/tables', 'after_change', 'After changes', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(633, 1, 'en', 'core/base/tables', 'views', 'Views', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(634, 1, 'en', 'core/base/tables', 'browser', 'Browser', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(635, 1, 'en', 'core/base/tables', 'session', 'Session', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(636, 1, 'en', 'core/base/tables', 'activated', 'activated', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(637, 1, 'en', 'core/base/tables', 'deactivated', 'deactivated', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(638, 1, 'en', 'core/base/tables', 'is_featured', 'Is featured', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(639, 1, 'en', 'core/base/tables', 'edit', 'Edit', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(640, 1, 'en', 'core/base/tables', 'delete', 'Delete', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(641, 1, 'en', 'core/base/tables', 'restore', 'Restore', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(642, 1, 'en', 'core/base/tables', 'activate', 'Activate', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(643, 1, 'en', 'core/base/tables', 'deactivate', 'Deactivate', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(644, 1, 'en', 'core/base/tables', 'excel', 'Excel', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(645, 1, 'en', 'core/base/tables', 'export', 'Export', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(646, 1, 'en', 'core/base/tables', 'csv', 'CSV', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(647, 1, 'en', 'core/base/tables', 'pdf', 'PDF', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(648, 1, 'en', 'core/base/tables', 'print', 'Print', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(649, 1, 'en', 'core/base/tables', 'reset', 'Reset', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(650, 1, 'en', 'core/base/tables', 'reload', 'Reload', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(651, 1, 'en', 'core/base/tables', 'display', 'Display', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(652, 1, 'en', 'core/base/tables', 'all', 'All', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(653, 1, 'en', 'core/base/tables', 'add_new', 'Add New', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(654, 1, 'en', 'core/base/tables', 'action', 'Actions', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(655, 1, 'en', 'core/base/tables', 'delete_entry', 'Delete', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(656, 1, 'en', 'core/base/tables', 'view', 'View Detail', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(657, 1, 'en', 'core/base/tables', 'save', 'Save', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(658, 1, 'en', 'core/base/tables', 'show_from', 'Show from', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(659, 1, 'en', 'core/base/tables', 'to', 'to', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(660, 1, 'en', 'core/base/tables', 'in', 'in', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(661, 1, 'en', 'core/base/tables', 'records', 'records', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(662, 1, 'en', 'core/base/tables', 'no_data', 'No data to display', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(663, 1, 'en', 'core/base/tables', 'no_record', 'No record', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(664, 1, 'en', 'core/base/tables', 'confirm_delete', 'Confirm delete', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(665, 1, 'en', 'core/base/tables', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(666, 1, 'en', 'core/base/tables', 'confirm_delete_many_msg', 'Do you really want to delete selected record(s)?', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(667, 1, 'en', 'core/base/tables', 'cancel', 'Cancel', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(668, 1, 'en', 'core/base/tables', 'template', 'Template', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(669, 1, 'en', 'core/base/tables', 'email', 'Email', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(670, 1, 'en', 'core/base/tables', 'last_login', 'Last login', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(671, 1, 'en', 'core/base/tables', 'shortcode', 'Shortcode', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(672, 1, 'en', 'core/base/tables', 'image', 'Image', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(673, 1, 'en', 'core/base/tables', 'bulk_changes', 'Bulk changes', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(674, 1, 'en', 'core/base/tables', 'submit', 'Submit', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(675, 1, 'en', 'core/base/tables', 'please_select_record', 'Please select at least one record to perform this action!', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(676, 1, 'en', 'core/base/tabs', 'detail', 'Detail', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(677, 1, 'en', 'core/base/tabs', 'file', 'Files', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(678, 1, 'en', 'core/base/tabs', 'record_note', 'Record Note', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(679, 1, 'en', 'core/base/tabs', 'revision', 'Revision History', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(680, 1, 'vi', 'core/base/base', 'yes', 'Có', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(681, 1, 'vi', 'core/base/base', 'no', 'Không', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(682, 1, 'vi', 'core/base/base', 'is_default', 'Mặc định?', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(683, 1, 'vi', 'core/base/base', 'proc_close_disabled_error', 'Hàm proc_close() đã bị tắt. Vui lòng liên hệ nhà cung cấp hosting để mở hàm này. Hoặc có thể thêm vào .env: CAN_EXECUTE_COMMAND=false để tắt tính năng này.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(684, 1, 'vi', 'core/base/cache', 'cache_management', 'Quản lý bộ nhớ đệm', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(685, 1, 'vi', 'core/base/cache', 'cache_commands', 'Các lệnh xoá bộ nhớ đệm cơ bản', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(686, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.title', 'Xóa tất cả bộ đệm hiện có của ứng dụng', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(687, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.description', 'Xóa các bộ nhớ đệm của ứng dụng: cơ sở dữ liệu, nội dung tĩnh... Chạy lệnh này khi bạn thử cập nhật dữ liệu nhưng giao diện không thay đổi', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(688, 1, 'vi', 'core/base/cache', 'commands.clear_cms_cache.success_msg', 'Bộ đệm đã được xóa', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(689, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.title', 'Làm mới bộ đệm giao diện', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(690, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.description', 'Làm mới bộ đệm giao diện giúp phần giao diện luôn mới nhất', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(691, 1, 'vi', 'core/base/cache', 'commands.refresh_compiled_views.success_msg', 'Bộ đệm giao diện đã được làm mới', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(692, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.title', 'Xóa bộ nhớ đệm của phần cấu hình', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(693, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.description', 'Bạn cần làm mới bộ đệm cấu hình khi bạn tạo ra sự thay đổi nào đó ở môi trường thành phẩm.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(694, 1, 'vi', 'core/base/cache', 'commands.clear_config_cache.success_msg', 'Bộ đệm cấu hình đã được xóa', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(695, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.title', 'Xoá cache đường dẫn', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(696, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.description', 'Cần thực hiện thao tác này khi thấy không xuất hiện đường dẫn mới.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(697, 1, 'vi', 'core/base/cache', 'commands.clear_route_cache.success_msg', 'Bộ đệm điều hướng đã bị xóa', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(698, 1, 'vi', 'core/base/cache', 'commands.clear_log.description', 'Xoá lịch sử lỗi', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(699, 1, 'vi', 'core/base/cache', 'commands.clear_log.success_msg', 'Lịch sử lỗi đã được làm sạch', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(700, 1, 'vi', 'core/base/cache', 'commands.clear_log.title', 'Xoá lịch sử lỗi', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(701, 1, 'vi', 'core/base/enums', 'statuses.draft', 'Bản nháp', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(702, 1, 'vi', 'core/base/enums', 'statuses.pending', 'Đang chờ xử lý', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(703, 1, 'vi', 'core/base/enums', 'statuses.publish', 'Đã xuất bản', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(704, 1, 'vi', 'core/base/errors', '401_title', 'Bạn không có quyền truy cập trang này', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(705, 1, 'vi', 'core/base/errors', '401_msg', '<li>Bạn không được cấp quyền truy cập bởi quản trị viên.</li>\n	                <li>Bạn sử dụng sai loại tài khoản.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(706, 1, 'vi', 'core/base/errors', '404_title', 'Không tìm thấy trang yêu cầu', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(707, 1, 'vi', 'core/base/errors', '404_msg', '<li>Trang bạn yêu cầu không tồn tại.</li>\n	                <li>Liên kết bạn vừa nhấn không còn được sử dụng.</li>\n	                <li>Trang này có thể đã được chuyển sang vị trí khác.</li>\n	                <li>Có thể có lỗi xảy ra.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(708, 1, 'vi', 'core/base/errors', '500_title', 'Không thể tải trang', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(709, 1, 'vi', 'core/base/errors', '500_msg', '<li>Trang bạn yêu cầu không tồn tại.</li>\n	                <li>Liên kết bạn vừa nhấn không còn được sử dụng.</li>\n	                <li>Trang này có thể đã được chuyển sang vị trí khác.</li>\n	                <li>Có thể có lỗi xảy ra.</li>\n	                <li>Bạn không được cấp quyền để có thể truy cập trang này</li>', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(710, 1, 'vi', 'core/base/errors', 'reasons', 'Điều này có thể xảy ra vì nhiều lý do.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(711, 1, 'vi', 'core/base/errors', 'try_again', 'Vui lòng thử lại trong vài phút, hoặc quay trở lại trang chủ bằng cách <a href=\"http://cms.local/admin\"> nhấn vào đây </a>.', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(712, 1, 'vi', 'core/base/forms', 'choose_image', 'Chọn ảnh', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(713, 1, 'vi', 'core/base/forms', 'actions', 'Tác vụ', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(714, 1, 'vi', 'core/base/forms', 'save', 'Lưu', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(715, 1, 'vi', 'core/base/forms', 'save_and_continue', 'Lưu & chỉnh sửa', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(716, 1, 'vi', 'core/base/forms', 'image', 'Hình ảnh', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(717, 1, 'vi', 'core/base/forms', 'image_placeholder', 'Chèn đường dẫn hình ảnh hoặc nhấn nút để chọn hình', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(718, 1, 'vi', 'core/base/forms', 'create', 'Tạo mới', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(719, 1, 'vi', 'core/base/forms', 'edit', 'Sửa', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(720, 1, 'vi', 'core/base/forms', 'permalink', 'Đường dẫn', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(721, 1, 'vi', 'core/base/forms', 'ok', 'OK', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(722, 1, 'vi', 'core/base/forms', 'cancel', 'Hủy bỏ', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(723, 1, 'vi', 'core/base/forms', 'character_remain', 'kí tự còn lại', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(724, 1, 'vi', 'core/base/forms', 'template', 'Template', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(725, 1, 'vi', 'core/base/forms', 'choose_file', 'Chọn tập tin', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(726, 1, 'vi', 'core/base/forms', 'file', 'Tập tin', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(727, 1, 'vi', 'core/base/forms', 'content', 'Nội dung', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(728, 1, 'vi', 'core/base/forms', 'description', 'Mô tả', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(729, 1, 'vi', 'core/base/forms', 'name', 'Tên', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(730, 1, 'vi', 'core/base/forms', 'name_placeholder', 'Nhập tên', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(731, 1, 'vi', 'core/base/forms', 'description_placeholder', 'Mô tả ngắn', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(732, 1, 'vi', 'core/base/forms', 'parent', 'Cha', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(733, 1, 'vi', 'core/base/forms', 'icon', 'Biểu tượng', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(734, 1, 'vi', 'core/base/forms', 'order_by', 'Sắp xếp', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(735, 1, 'vi', 'core/base/forms', 'order_by_placeholder', 'Sắp xếp', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(736, 1, 'vi', 'core/base/forms', 'slug', 'Slug', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(737, 1, 'vi', 'core/base/forms', 'is_featured', 'Nổi bật?', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(738, 1, 'vi', 'core/base/forms', 'is_default', 'Mặc định?', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(739, 1, 'vi', 'core/base/forms', 'icon_placeholder', 'Ví dụ: fa fa-home', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(740, 1, 'vi', 'core/base/forms', 'update', 'Cập nhật', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(741, 1, 'vi', 'core/base/forms', 'publish', 'Xuất bản', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(742, 1, 'vi', 'core/base/forms', 'remove_image', 'Xoá ảnh', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(743, 1, 'vi', 'core/base/forms', 'add', 'Thêm', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(744, 1, 'vi', 'core/base/forms', 'add_short_code', 'Thêm shortcode', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(745, 1, 'vi', 'core/base/forms', 'alias', 'Mã thay thế', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(746, 1, 'vi', 'core/base/forms', 'alias_placeholder', 'Mã thay thế', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(747, 1, 'vi', 'core/base/forms', 'basic_information', 'Thông tin cơ bản', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(748, 1, 'vi', 'core/base/forms', 'link', 'Liên kết', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(749, 1, 'vi', 'core/base/forms', 'order', 'Thứ tự', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(750, 1, 'vi', 'core/base/forms', 'short_code', 'Shortcode', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(751, 1, 'vi', 'core/base/forms', 'title', 'Tiêu đề', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(752, 1, 'vi', 'core/base/forms', 'value', 'Giá trị', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(753, 1, 'vi', 'core/base/forms', 'show_hide_editor', 'Ẩn/Hiện trình soạn thảo', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(754, 1, 'vi', 'core/base/forms', 'basic_info_title', 'Thông tin cơ bản', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(755, 1, 'vi', 'core/base/layouts', 'platform_admin', 'Quản trị hệ thống', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(756, 1, 'vi', 'core/base/layouts', 'dashboard', 'Bảng điều khiển', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(757, 1, 'vi', 'core/base/layouts', 'appearance', 'Hiển thị', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(758, 1, 'vi', 'core/base/layouts', 'menu', 'Trình đơn', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(759, 1, 'vi', 'core/base/layouts', 'widgets', 'Tiện ích', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(760, 1, 'vi', 'core/base/layouts', 'theme_options', 'Tuỳ chọn giao diện', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(761, 1, 'vi', 'core/base/layouts', 'plugins', 'Tiện ích mở rộng', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(762, 1, 'vi', 'core/base/layouts', 'settings', 'Cài đặt', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(763, 1, 'vi', 'core/base/layouts', 'setting_general', 'Cơ bản', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(764, 1, 'vi', 'core/base/layouts', 'system_information', 'Thông tin hệ thống', '2021-05-08 21:17:52', '2021-05-08 21:17:52'),
(765, 1, 'vi', 'core/base/layouts', 'theme', 'Giao diện', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(766, 1, 'vi', 'core/base/layouts', 'copyright', 'Bản quyền :year &copy; :company. Phiên bản: <span>:version</span>', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(767, 1, 'vi', 'core/base/layouts', 'profile', 'Thông tin cá nhân', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(768, 1, 'vi', 'core/base/layouts', 'logout', 'Đăng xuất', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(769, 1, 'vi', 'core/base/layouts', 'no_search_result', 'Không có kết quả tìm kiếm, hãy thử lại với từ khóa khác.', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(770, 1, 'vi', 'core/base/layouts', 'home', 'Trang chủ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(771, 1, 'vi', 'core/base/layouts', 'search', 'Tìm kiếm', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(772, 1, 'vi', 'core/base/layouts', 'add_new', 'Thêm mới', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(773, 1, 'vi', 'core/base/layouts', 'n_a', 'N/A', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(774, 1, 'vi', 'core/base/layouts', 'page_loaded_time', 'Trang tải xong trong', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(775, 1, 'vi', 'core/base/layouts', 'view_website', 'Xem trang ngoài', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(776, 1, 'vi', 'core/base/layouts', 'setting_email', 'Email', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(777, 1, 'vi', 'core/base/mail', 'send-fail', 'Gửi email không thành công', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(778, 1, 'vi', 'core/base/mail', 'happy_birthday', 'Chúc mừng sinh nhật!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(779, 1, 'vi', 'core/base/notices', 'create_success_message', 'Tạo thành công', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(780, 1, 'vi', 'core/base/notices', 'update_success_message', 'Cập nhật thành công', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(781, 1, 'vi', 'core/base/notices', 'delete_success_message', 'Xóa thành công', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(782, 1, 'vi', 'core/base/notices', 'success_header', 'Thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(783, 1, 'vi', 'core/base/notices', 'error_header', 'Lỗi!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(784, 1, 'vi', 'core/base/notices', 'no_select', 'Chọn ít nhất 1 trường để thực hiện hành động này!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(785, 1, 'vi', 'core/base/notices', 'processing_request', 'Hệ thống đang xử lý yêu cầu.', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(786, 1, 'vi', 'core/base/notices', 'error', 'Lỗi!', '2021-05-08 21:17:53', '2021-05-08 21:17:53');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(787, 1, 'vi', 'core/base/notices', 'success', 'Thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(788, 1, 'vi', 'core/base/notices', 'info', 'Thông tin!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(789, 1, 'vi', 'core/base/system', 'no_select', 'Hãy chọn ít nhất 1 trường để thực hiện hành động này!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(790, 1, 'vi', 'core/base/system', 'cannot_find_user', 'Không thể tải được thông tin người dùng', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(791, 1, 'vi', 'core/base/system', 'supper_revoked', 'Quyền quản trị viên cao nhất đã được gỡ bỏ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(792, 1, 'vi', 'core/base/system', 'cannot_revoke_yourself', 'Không thể gỡ bỏ quyền quản trị cấp cao của chính bạn!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(793, 1, 'vi', 'core/base/system', 'cant_remove_supper', 'Bạn không có quyền xóa quản trị viên cấp cao', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(794, 1, 'vi', 'core/base/system', 'cant_find_user_with_email', 'Không thể tìm thấy người dùng với email này', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(795, 1, 'vi', 'core/base/system', 'supper_granted', 'Quyền quản trị cao nhất đã được gán', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(796, 1, 'vi', 'core/base/system', 'delete_log_success', 'Xóa tập tin log thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(797, 1, 'vi', 'core/base/system', 'get_member_success', 'Hiển thị danh sách thành viên thành công', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(798, 1, 'vi', 'core/base/system', 'error_occur', 'Có lỗi dưới đây', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(799, 1, 'vi', 'core/base/system', 'role_and_permission', 'Phân quyền hệ thống', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(800, 1, 'vi', 'core/base/system', 'role_and_permission_description', 'Quản lý những phân quyền trong hệ thống', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(801, 1, 'vi', 'core/base/system', 'user.list_super', 'Danh sách quản trị viên cấp cao', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(802, 1, 'vi', 'core/base/system', 'user.username', 'Tên đăng nhập', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(803, 1, 'vi', 'core/base/system', 'user.email', 'Email', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(804, 1, 'vi', 'core/base/system', 'user.last_login', 'Đăng nhập lần cuối	', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(805, 1, 'vi', 'core/base/system', 'user.add_user', 'Thêm quản trị viên cấp cao', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(806, 1, 'vi', 'core/base/system', 'user.cancel', 'Hủy bỏ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(807, 1, 'vi', 'core/base/system', 'user.create', 'Thêm', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(808, 1, 'vi', 'core/base/system', 'options.features', 'Kiểm soát truy cập các tính năng', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(809, 1, 'vi', 'core/base/system', 'options.feature_description', 'Bật/tắt các tính năng.', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(810, 1, 'vi', 'core/base/system', 'options.manage_super', 'Quản lý quản trị viên cấp cao', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(811, 1, 'vi', 'core/base/system', 'options.manage_super_description', 'Thêm/xóa quản trị viên cấp cao', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(812, 1, 'vi', 'core/base/system', 'options.info', 'Thông tin hệ thống', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(813, 1, 'vi', 'core/base/system', 'options.info_description', 'Những thông tin về cấu hình hiện tại của hệ thống.', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(814, 1, 'vi', 'core/base/system', 'info.title', 'Thông tin hệ thống', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(815, 1, 'vi', 'core/base/system', 'info.cache', 'Bộ nhớ đệm', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(816, 1, 'vi', 'core/base/system', 'info.environment', 'Môi trường', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(817, 1, 'vi', 'core/base/system', 'info.locale', 'Ngôn ngữ hệ thống', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(818, 1, 'vi', 'core/base/system', 'user_management', 'Quản lý thành viên', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(819, 1, 'vi', 'core/base/system', 'user_management_description', 'Quản lý người dùng trong hệ thống', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(820, 1, 'vi', 'core/base/system', 'app_size', 'Kích thước ứng dụng', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(821, 1, 'vi', 'core/base/system', 'cache_dir_writable', 'Có thể ghi bộ nhớ đệm', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(822, 1, 'vi', 'core/base/system', 'cache_driver', 'Loại lưu trữ bộ nhớ đệm', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(823, 1, 'vi', 'core/base/system', 'copy_report', 'Sao chép báo cáo', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(824, 1, 'vi', 'core/base/system', 'curl_ext', 'CURL Ext', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(825, 1, 'vi', 'core/base/system', 'database', 'Hệ thống dữ liệu', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(826, 1, 'vi', 'core/base/system', 'debug_mode', 'Chế độ sửa lỗi', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(827, 1, 'vi', 'core/base/system', 'dependency_name', 'Tên gói', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(828, 1, 'vi', 'core/base/system', 'exif_ext', 'Exif Ext', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(829, 1, 'vi', 'core/base/system', 'extra_information', 'Thông tin mở rộng', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(830, 1, 'vi', 'core/base/system', 'extra_stats', 'Thống kê thêm', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(831, 1, 'vi', 'core/base/system', 'file_info_ext', 'File info Ext', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(832, 1, 'vi', 'core/base/system', 'framework_version', 'Phiên bản framework', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(833, 1, 'vi', 'core/base/system', 'get_system_report', 'Lấy thông tin hệ thống', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(834, 1, 'vi', 'core/base/system', 'installed_packages', 'Các gói đã cài đặt và phiên bản', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(835, 1, 'vi', 'core/base/system', 'mbstring_ext', 'Mbstring Ext', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(836, 1, 'vi', 'core/base/system', 'openssl_ext', 'OpenSSL Ext', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(837, 1, 'vi', 'core/base/system', 'package_name', 'Tên gói', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(838, 1, 'vi', 'core/base/system', 'pdo_ext', 'PDO Ext', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(839, 1, 'vi', 'core/base/system', 'php_version', 'Phiên bản PHP', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(840, 1, 'vi', 'core/base/system', 'report_description', 'Vui lòng chia sẻ thông tin này nhằm mục đích điều tra nguyên nhân gây lỗi', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(841, 1, 'vi', 'core/base/system', 'server_environment', 'Môi trường máy chủ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(842, 1, 'vi', 'core/base/system', 'server_os', 'Hệ điều hành của máy chủ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(843, 1, 'vi', 'core/base/system', 'server_software', 'Phần mềm', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(844, 1, 'vi', 'core/base/system', 'session_driver', 'Loại lưu trữ phiên làm việc', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(845, 1, 'vi', 'core/base/system', 'ssl_installed', 'Đã cài đặt chứng chỉ SSL', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(846, 1, 'vi', 'core/base/system', 'storage_dir_writable', 'Có thể lưu trữ dữ liệu tạm', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(847, 1, 'vi', 'core/base/system', 'system_environment', 'Môi trường hệ thống', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(848, 1, 'vi', 'core/base/system', 'timezone', 'Múi giờ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(849, 1, 'vi', 'core/base/system', 'tokenizer_ext', 'Tokenizer Ext', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(850, 1, 'vi', 'core/base/system', 'version', 'Phiên bản', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(851, 1, 'vi', 'core/base/system', 'cms_version', 'Phiên bản CMS', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(852, 1, 'vi', 'core/base/tables', 'filter_enabled', 'Tìm kiếm nâng cao đã được kích hoạt', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(853, 1, 'vi', 'core/base/tables', 'id', 'ID', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(854, 1, 'vi', 'core/base/tables', 'name', 'Tên', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(855, 1, 'vi', 'core/base/tables', 'order_by', 'Thứ tự', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(856, 1, 'vi', 'core/base/tables', 'status', 'Trạng thái', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(857, 1, 'vi', 'core/base/tables', 'created_at', 'Ngày tạo', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(858, 1, 'vi', 'core/base/tables', 'updated_at', 'Ngày cập nhật', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(859, 1, 'vi', 'core/base/tables', 'operations', 'Tác vụ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(860, 1, 'vi', 'core/base/tables', 'loading_data', 'Đang tải dữ liệu từ server', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(861, 1, 'vi', 'core/base/tables', 'url', 'URL', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(862, 1, 'vi', 'core/base/tables', 'author', 'Người tạo', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(863, 1, 'vi', 'core/base/tables', 'column', 'Cột', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(864, 1, 'vi', 'core/base/tables', 'origin', 'Bản cũ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(865, 1, 'vi', 'core/base/tables', 'after_change', 'Sau khi thay đổi', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(866, 1, 'vi', 'core/base/tables', 'notes', 'Ghi chú', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(867, 1, 'vi', 'core/base/tables', 'activated', 'kích hoạt', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(868, 1, 'vi', 'core/base/tables', 'browser', 'Trình duyệt', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(869, 1, 'vi', 'core/base/tables', 'deactivated', 'hủy kích hoạt', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(870, 1, 'vi', 'core/base/tables', 'description', 'Mô tả', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(871, 1, 'vi', 'core/base/tables', 'session', 'Phiên', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(872, 1, 'vi', 'core/base/tables', 'views', 'Lượt xem', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(873, 1, 'vi', 'core/base/tables', 'restore', 'Khôi phục', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(874, 1, 'vi', 'core/base/tables', 'edit', 'Sửa', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(875, 1, 'vi', 'core/base/tables', 'delete', 'Xóa', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(876, 1, 'vi', 'core/base/tables', 'action', 'Hành động', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(877, 1, 'vi', 'core/base/tables', 'activate', 'Kích hoạt', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(878, 1, 'vi', 'core/base/tables', 'add_new', 'Thêm mới', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(879, 1, 'vi', 'core/base/tables', 'all', 'Tất cả', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(880, 1, 'vi', 'core/base/tables', 'cancel', 'Hủy bỏ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(881, 1, 'vi', 'core/base/tables', 'confirm_delete', 'Xác nhận xóa', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(882, 1, 'vi', 'core/base/tables', 'confirm_delete_msg', 'Bạn có chắc chắn muốn xóa bản ghi này?', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(883, 1, 'vi', 'core/base/tables', 'csv', 'CSV', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(884, 1, 'vi', 'core/base/tables', 'deactivate', 'Hủy kích hoạt', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(885, 1, 'vi', 'core/base/tables', 'delete_entry', 'Xóa bản ghi', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(886, 1, 'vi', 'core/base/tables', 'display', 'Hiển thị', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(887, 1, 'vi', 'core/base/tables', 'excel', 'Excel', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(888, 1, 'vi', 'core/base/tables', 'export', 'Xuất bản', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(889, 1, 'vi', 'core/base/tables', 'filter', 'Nhập từ khóa...', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(890, 1, 'vi', 'core/base/tables', 'filtered_from', 'được lọc từ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(891, 1, 'vi', 'core/base/tables', 'in', 'trong tổng số', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(892, 1, 'vi', 'core/base/tables', 'loading', 'Đang tải dữ liệu từ hệ thống', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(893, 1, 'vi', 'core/base/tables', 'no_data', 'Không có dữ liệu để hiển thị', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(894, 1, 'vi', 'core/base/tables', 'no_record', 'Không có dữ liệu', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(895, 1, 'vi', 'core/base/tables', 'pdf', 'PDF', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(896, 1, 'vi', 'core/base/tables', 'print', 'In', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(897, 1, 'vi', 'core/base/tables', 'records', 'bản ghi', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(898, 1, 'vi', 'core/base/tables', 'reload', 'Tải lại', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(899, 1, 'vi', 'core/base/tables', 'reset', 'Làm mới', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(900, 1, 'vi', 'core/base/tables', 'save', 'Lưu', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(901, 1, 'vi', 'core/base/tables', 'show_from', 'Hiển thị từ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(902, 1, 'vi', 'core/base/tables', 'template', 'Giao diện', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(903, 1, 'vi', 'core/base/tables', 'to', 'đến', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(904, 1, 'vi', 'core/base/tables', 'view', 'Xem chi tiết', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(905, 1, 'vi', 'core/base/tables', 'email', 'Email', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(906, 1, 'vi', 'core/base/tables', 'image', 'Hình ảnh', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(907, 1, 'vi', 'core/base/tables', 'is_featured', 'Nổi bật', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(908, 1, 'vi', 'core/base/tables', 'last_login', 'Lần cuối đăng nhập', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(909, 1, 'vi', 'core/base/tables', 'order', 'Thứ tự', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(910, 1, 'vi', 'core/base/tables', 'shortcode', 'Shortcode', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(911, 1, 'vi', 'core/base/tables', 'slug', 'Slug', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(912, 1, 'vi', 'core/base/tables', 'title', 'Tiêu đề', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(913, 1, 'vi', 'core/base/tabs', 'detail', 'Chi tiết', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(914, 1, 'vi', 'core/base/tabs', 'file', 'Tập tin', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(915, 1, 'vi', 'core/base/tabs', 'record_note', 'Ghi chú', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(916, 1, 'vi', 'core/base/tabs', 'revision', 'Lịch sử thay đổi', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(917, 1, 'en', 'core/dashboard/dashboard', 'update_position_success', 'Update widget position successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(918, 1, 'en', 'core/dashboard/dashboard', 'hide_success', 'Update widget successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(919, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide', 'Are you sure?', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(920, 1, 'en', 'core/dashboard/dashboard', 'hide_message', 'Do you really want to hide this widget? It will be disappear on Dashboard!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(921, 1, 'en', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Yes, hide this widget', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(922, 1, 'en', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Cancel', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(923, 1, 'en', 'core/dashboard/dashboard', 'collapse_expand', 'Collapse/Expand', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(924, 1, 'en', 'core/dashboard/dashboard', 'hide', 'Hide', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(925, 1, 'en', 'core/dashboard/dashboard', 'reload', 'Reload', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(926, 1, 'en', 'core/dashboard/dashboard', 'save_setting_success', 'Save widget settings successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(927, 1, 'en', 'core/dashboard/dashboard', 'widget_not_exists', 'Widget is not exits!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(928, 1, 'en', 'core/dashboard/dashboard', 'manage_widgets', 'Manage Widgets', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(929, 1, 'en', 'core/dashboard/dashboard', 'fullscreen', 'Full screen', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(930, 1, 'en', 'core/dashboard/dashboard', 'title', 'Dashboard', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(931, 1, 'vi', 'core/dashboard/dashboard', 'cancel_hide_btn', 'Hủy bỏ', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(932, 1, 'vi', 'core/dashboard/dashboard', 'collapse_expand', 'Mở rộng', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(933, 1, 'vi', 'core/dashboard/dashboard', 'confirm_hide', 'Bạn có chắc?', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(934, 1, 'vi', 'core/dashboard/dashboard', 'confirm_hide_btn', 'Vâng, ẩn tiện ích này', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(935, 1, 'vi', 'core/dashboard/dashboard', 'hide', 'Ẩn', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(936, 1, 'vi', 'core/dashboard/dashboard', 'hide_message', 'Bạn có chắc chắn muốn ẩn tiện ích này? Nó sẽ không được hiển thị trên trang chủ nữa!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(937, 1, 'vi', 'core/dashboard/dashboard', 'hide_success', 'Ẩn tiện ích thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(938, 1, 'vi', 'core/dashboard/dashboard', 'manage_widgets', 'Quản lý tiện ích', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(939, 1, 'vi', 'core/dashboard/dashboard', 'reload', 'Làm mới', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(940, 1, 'vi', 'core/dashboard/dashboard', 'save_setting_success', 'Lưu tiện ích thành công', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(941, 1, 'vi', 'core/dashboard/dashboard', 'update_position_success', 'Cập nhật vị trí tiện ích thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(942, 1, 'vi', 'core/dashboard/dashboard', 'widget_not_exists', 'Tiện ích này không tồn tại!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(943, 1, 'vi', 'core/dashboard/dashboard', 'fullscreen', 'Toàn màn hình', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(944, 1, 'vi', 'core/dashboard/dashboard', 'title', 'Trang quản trị', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(945, 1, 'en', 'core/media/media', 'filter', 'Filter', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(946, 1, 'en', 'core/media/media', 'everything', 'Everything', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(947, 1, 'en', 'core/media/media', 'image', 'Image', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(948, 1, 'en', 'core/media/media', 'video', 'Video', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(949, 1, 'en', 'core/media/media', 'document', 'Document', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(950, 1, 'en', 'core/media/media', 'view_in', 'View in', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(951, 1, 'en', 'core/media/media', 'all_media', 'All media', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(952, 1, 'en', 'core/media/media', 'trash', 'Trash', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(953, 1, 'en', 'core/media/media', 'recent', 'Recent', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(954, 1, 'en', 'core/media/media', 'favorites', 'Favorites', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(955, 1, 'en', 'core/media/media', 'upload', 'Upload', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(956, 1, 'en', 'core/media/media', 'create_folder', 'Create folder', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(957, 1, 'en', 'core/media/media', 'refresh', 'Refresh', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(958, 1, 'en', 'core/media/media', 'empty_trash', 'Empty trash', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(959, 1, 'en', 'core/media/media', 'search_file_and_folder', 'Search file and folder', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(960, 1, 'en', 'core/media/media', 'sort', 'Sort', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(961, 1, 'en', 'core/media/media', 'file_name_asc', 'File name - ASC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(962, 1, 'en', 'core/media/media', 'file_name_desc', 'File name - DESC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(963, 1, 'en', 'core/media/media', 'uploaded_date_asc', 'Uploaded date - ASC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(964, 1, 'en', 'core/media/media', 'uploaded_date_desc', 'Uploaded date - DESC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(965, 1, 'en', 'core/media/media', 'size_asc', 'Size - ASC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(966, 1, 'en', 'core/media/media', 'size_desc', 'Size - DESC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(967, 1, 'en', 'core/media/media', 'actions', 'Actions', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(968, 1, 'en', 'core/media/media', 'nothing_is_selected', 'Nothing is selected', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(969, 1, 'en', 'core/media/media', 'insert', 'Insert', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(970, 1, 'en', 'core/media/media', 'folder_name', 'Folder name', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(971, 1, 'en', 'core/media/media', 'create', 'Create', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(972, 1, 'en', 'core/media/media', 'rename', 'Rename', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(973, 1, 'en', 'core/media/media', 'close', 'Close', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(974, 1, 'en', 'core/media/media', 'save_changes', 'Save changes', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(975, 1, 'en', 'core/media/media', 'move_to_trash', 'Move items to trash', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(976, 1, 'en', 'core/media/media', 'confirm_trash', 'Are you sure you want to move these items to trash?', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(977, 1, 'en', 'core/media/media', 'confirm', 'Confirm', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(978, 1, 'en', 'core/media/media', 'confirm_delete', 'Delete item(s)', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(979, 1, 'en', 'core/media/media', 'confirm_delete_description', 'Your request cannot rollback. Are you sure you wanna delete these items?', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(980, 1, 'en', 'core/media/media', 'empty_trash_title', 'Empty trash', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(981, 1, 'en', 'core/media/media', 'empty_trash_description', 'Your request cannot rollback. Are you sure you wanna remove all items in trash?', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(982, 1, 'en', 'core/media/media', 'up_level', 'Up one level', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(983, 1, 'en', 'core/media/media', 'upload_progress', 'Upload progress', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(984, 1, 'en', 'core/media/media', 'folder_created', 'Folder is created successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(985, 1, 'en', 'core/media/media', 'gallery', 'Media gallery', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(986, 1, 'en', 'core/media/media', 'trash_error', 'Error when delete selected item(s)', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(987, 1, 'en', 'core/media/media', 'trash_success', 'Moved selected item(s) to trash successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(988, 1, 'en', 'core/media/media', 'restore_error', 'Error when restore selected item(s)', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(989, 1, 'en', 'core/media/media', 'restore_success', 'Restore selected item(s) successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(990, 1, 'en', 'core/media/media', 'copy_success', 'Copied selected item(s) successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(991, 1, 'en', 'core/media/media', 'delete_success', 'Deleted selected item(s) successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(992, 1, 'en', 'core/media/media', 'favorite_success', 'Favorite selected item(s) successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(993, 1, 'en', 'core/media/media', 'remove_favorite_success', 'Remove selected item(s) from favorites successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(994, 1, 'en', 'core/media/media', 'rename_error', 'Error when rename item(s)', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(995, 1, 'en', 'core/media/media', 'rename_success', 'Rename selected item(s) successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(996, 1, 'en', 'core/media/media', 'empty_trash_success', 'Empty trash successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(997, 1, 'en', 'core/media/media', 'invalid_action', 'Invalid action!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(998, 1, 'en', 'core/media/media', 'file_not_exists', 'File is not exists!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(999, 1, 'en', 'core/media/media', 'download_file_error', 'Error when downloading files!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1000, 1, 'en', 'core/media/media', 'missing_zip_archive_extension', 'Please enable ZipArchive extension to download file!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1001, 1, 'en', 'core/media/media', 'can_not_download_file', 'Can not download this file!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1002, 1, 'en', 'core/media/media', 'invalid_request', 'Invalid request!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1003, 1, 'en', 'core/media/media', 'add_success', 'Add item successfully!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1004, 1, 'en', 'core/media/media', 'file_too_big', 'File too big. Max file upload is :size bytes', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1005, 1, 'en', 'core/media/media', 'can_not_detect_file_type', 'File type is not allowed or can not detect file type!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1006, 1, 'en', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1007, 1, 'en', 'core/media/media', 'menu_name', 'Media', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1008, 1, 'en', 'core/media/media', 'add', 'Add media', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1009, 1, 'en', 'core/media/media', 'javascript.name', 'Name', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1010, 1, 'en', 'core/media/media', 'javascript.url', 'URL', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1011, 1, 'en', 'core/media/media', 'javascript.full_url', 'Full URL', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1012, 1, 'en', 'core/media/media', 'javascript.size', 'Size', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1013, 1, 'en', 'core/media/media', 'javascript.mime_type', 'Type', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1014, 1, 'en', 'core/media/media', 'javascript.created_at', 'Uploaded at', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1015, 1, 'en', 'core/media/media', 'javascript.updated_at', 'Modified at', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1016, 1, 'en', 'core/media/media', 'javascript.nothing_selected', 'Nothing is selected', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1017, 1, 'en', 'core/media/media', 'javascript.visit_link', 'Open link', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1018, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1019, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.title', 'Drop files and folders here', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1020, 1, 'en', 'core/media/media', 'javascript.no_item.all_media.message', 'Or use the upload button above', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1021, 1, 'en', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1022, 1, 'en', 'core/media/media', 'javascript.no_item.trash.title', 'There is nothing in your trash currently', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1023, 1, 'en', 'core/media/media', 'javascript.no_item.trash.message', 'Delete files to move them to trash automatically. Delete files from trash to remove them permanently', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1024, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1025, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.title', 'You have not added anything to your favorites yet', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1026, 1, 'en', 'core/media/media', 'javascript.no_item.favorites.message', 'Add files to favorites to easily find them later', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1027, 1, 'en', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1028, 1, 'en', 'core/media/media', 'javascript.no_item.recent.title', 'You did not opened anything yet', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1029, 1, 'en', 'core/media/media', 'javascript.no_item.recent.message', 'All recent files that you opened will be appeared here', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1030, 1, 'en', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1031, 1, 'en', 'core/media/media', 'javascript.no_item.default.title', 'No items', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1032, 1, 'en', 'core/media/media', 'javascript.no_item.default.message', 'This directory has no item', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1033, 1, 'en', 'core/media/media', 'javascript.clipboard.success', 'These file links has been copied to clipboard', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1034, 1, 'en', 'core/media/media', 'javascript.message.error_header', 'Error', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1035, 1, 'en', 'core/media/media', 'javascript.message.success_header', 'Success', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1036, 1, 'en', 'core/media/media', 'javascript.download.error', 'No files selected or cannot download these files', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1037, 1, 'en', 'core/media/media', 'javascript.actions_list.basic.preview', 'Preview', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1038, 1, 'en', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Copy link', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1039, 1, 'en', 'core/media/media', 'javascript.actions_list.file.rename', 'Rename', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1040, 1, 'en', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Make a copy', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1041, 1, 'en', 'core/media/media', 'javascript.actions_list.user.favorite', 'Add to favorite', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1042, 1, 'en', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Remove favorite', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1043, 1, 'en', 'core/media/media', 'javascript.actions_list.other.download', 'Download', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1044, 1, 'en', 'core/media/media', 'javascript.actions_list.other.trash', 'Move to trash', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1045, 1, 'en', 'core/media/media', 'javascript.actions_list.other.delete', 'Delete permanently', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1046, 1, 'en', 'core/media/media', 'javascript.actions_list.other.restore', 'Restore', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1047, 1, 'en', 'core/media/media', 'name_invalid', 'The folder name has invalid character(s).', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1048, 1, 'en', 'core/media/media', 'url_invalid', 'Please provide a valid URL', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1049, 1, 'en', 'core/media/media', 'path_invalid', 'Please provide a valid path', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1050, 1, 'vi', 'core/media/media', 'filter', 'Lọc', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1051, 1, 'vi', 'core/media/media', 'everything', 'Tất cả', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1052, 1, 'vi', 'core/media/media', 'image', 'Hình ảnh', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1053, 1, 'vi', 'core/media/media', 'video', 'Phim', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1054, 1, 'vi', 'core/media/media', 'document', 'Tài liệu', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1055, 1, 'vi', 'core/media/media', 'view_in', 'Chế độ xem', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1056, 1, 'vi', 'core/media/media', 'all_media', 'Tất cả tập tin', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1057, 1, 'vi', 'core/media/media', 'trash', 'Thùng rác', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1058, 1, 'vi', 'core/media/media', 'recent', 'Gần đây', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1059, 1, 'vi', 'core/media/media', 'favorites', 'Được gắn dấu sao', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1060, 1, 'vi', 'core/media/media', 'upload', 'Tải lên', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1061, 1, 'vi', 'core/media/media', 'create_folder', 'Tạo thư mục', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1062, 1, 'vi', 'core/media/media', 'refresh', 'Làm mới', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1063, 1, 'vi', 'core/media/media', 'empty_trash', 'Dọn thùng rác', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1064, 1, 'vi', 'core/media/media', 'search_file_and_folder', 'Tìm kiếm tập tin và thư mục', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1065, 1, 'vi', 'core/media/media', 'sort', 'Sắp xếp', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1066, 1, 'vi', 'core/media/media', 'file_name_asc', 'Tên tập tin - ASC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1067, 1, 'vi', 'core/media/media', 'file_name_desc', 'Tên tập tin - DESC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1068, 1, 'vi', 'core/media/media', 'created_date_asc', 'Ngày tạo - ASC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1069, 1, 'vi', 'core/media/media', 'created_date_desc', 'Ngày tạo - DESC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1070, 1, 'vi', 'core/media/media', 'uploaded_date_asc', 'Ngày tải lên - ASC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1071, 1, 'vi', 'core/media/media', 'uploaded_date_desc', 'Ngày tải lên - DESC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1072, 1, 'vi', 'core/media/media', 'size_asc', 'Kích thước - ASC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1073, 1, 'vi', 'core/media/media', 'size_desc', 'Kích thước - DESC', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1074, 1, 'vi', 'core/media/media', 'actions', 'Hành động', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1075, 1, 'vi', 'core/media/media', 'nothing_is_selected', 'Không có tập tin nào được chọn', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1076, 1, 'vi', 'core/media/media', 'insert', 'Chèn', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1077, 1, 'vi', 'core/media/media', 'folder_name', 'Tên thư mục', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1078, 1, 'vi', 'core/media/media', 'create', 'Tạo', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1079, 1, 'vi', 'core/media/media', 'rename', 'Đổi tên', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1080, 1, 'vi', 'core/media/media', 'close', 'Đóng', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1081, 1, 'vi', 'core/media/media', 'save_changes', 'Lưu thay đổi', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1082, 1, 'vi', 'core/media/media', 'move_to_trash', 'Đưa vào thùng rác', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1083, 1, 'vi', 'core/media/media', 'confirm_trash', 'Bạn có chắc chắn muốn bỏ những tập tin này vào thùng rác?', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1084, 1, 'vi', 'core/media/media', 'confirm', 'Xác nhận', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1085, 1, 'vi', 'core/media/media', 'confirm_delete', 'Xóa tập tin', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1086, 1, 'vi', 'core/media/media', 'confirm_delete_description', 'Hành động này không thể khôi phục. Bạn có chắc chắn muốn xóa các tập tin này?', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1087, 1, 'vi', 'core/media/media', 'empty_trash_title', 'Dọn sạch thùng rác', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1088, 1, 'vi', 'core/media/media', 'empty_trash_description', 'Hành động này không thể khôi phục. Bạn có chắc chắn muốn dọn sạch thùng rác?', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1089, 1, 'vi', 'core/media/media', 'up_level', 'Quay lại một cấp', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1090, 1, 'vi', 'core/media/media', 'upload_progress', 'Tiến trình tải lên', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1091, 1, 'vi', 'core/media/media', 'name_reserved', 'Tên này không được phép đặt', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1092, 1, 'vi', 'core/media/media', 'folder_created', 'Tạo thư mục thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1093, 1, 'vi', 'core/media/media', 'gallery', 'Thư viện tập tin', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1094, 1, 'vi', 'core/media/media', 'trash_error', 'Có lỗi khi xóa tập tin/thư mục', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1095, 1, 'vi', 'core/media/media', 'trash_success', 'Xóa tập tin/thư mục thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1096, 1, 'vi', 'core/media/media', 'restore_error', 'Có lỗi trong quá trình khôi phục', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1097, 1, 'vi', 'core/media/media', 'restore_success', 'Khôi phục thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1098, 1, 'vi', 'core/media/media', 'copy_success', 'Sao chép thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1099, 1, 'vi', 'core/media/media', 'delete_success', 'Xóa thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1100, 1, 'vi', 'core/media/media', 'favorite_success', 'Thêm dấu sao thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1101, 1, 'vi', 'core/media/media', 'remove_favorite_success', 'Bỏ dấu sao thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1102, 1, 'vi', 'core/media/media', 'rename_error', 'Có lỗi trong quá trình đổi tên', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1103, 1, 'vi', 'core/media/media', 'rename_success', 'Đổi tên thành công!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1104, 1, 'vi', 'core/media/media', 'invalid_action', 'Hành động không hợp lệ!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1105, 1, 'vi', 'core/media/media', 'file_not_exists', 'Tập tin không tồn tại!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1106, 1, 'vi', 'core/media/media', 'download_file_error', 'Có lỗi trong quá trình tải xuống tập tin!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1107, 1, 'vi', 'core/media/media', 'missing_zip_archive_extension', 'Hãy bật ZipArchive extension để tải tập tin!', '2021-05-08 21:17:53', '2021-05-08 21:17:53'),
(1108, 1, 'vi', 'core/media/media', 'can_not_download_file', 'Không thể tải tập tin!', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1109, 1, 'vi', 'core/media/media', 'invalid_request', 'Yêu cầu không hợp lệ!', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1110, 1, 'vi', 'core/media/media', 'add_success', 'Thêm thành công!', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1111, 1, 'vi', 'core/media/media', 'file_too_big', 'Tập tin quá lớn. Giới hạn tải lên là :size bytes', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1112, 1, 'vi', 'core/media/media', 'can_not_detect_file_type', 'Loại tập tin không hợp lệ hoặc không thể xác định loại tập tin!', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1113, 1, 'vi', 'core/media/media', 'upload_failed', 'The file is NOT uploaded completely. The server allows max upload file size is :size . Please check your file size OR try to upload again in case of having network errors', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1114, 1, 'vi', 'core/media/media', 'menu_name', 'Quản lý tập tin', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1115, 1, 'vi', 'core/media/media', 'add', 'Thêm tập tin', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1116, 1, 'vi', 'core/media/media', 'javascript.name', 'Tên', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1117, 1, 'vi', 'core/media/media', 'javascript.url', 'Đường dẫn', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1118, 1, 'vi', 'core/media/media', 'javascript.full_url', 'Đường dẫn tuyệt đối', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1119, 1, 'vi', 'core/media/media', 'javascript.size', 'Kích thước', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1120, 1, 'vi', 'core/media/media', 'javascript.mime_type', 'Loại', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1121, 1, 'vi', 'core/media/media', 'javascript.created_at', 'Được tải lên lúc', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1122, 1, 'vi', 'core/media/media', 'javascript.updated_at', 'Được chỉnh sửa lúc', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1123, 1, 'vi', 'core/media/media', 'javascript.nothing_selected', 'Bạn chưa chọn tập tin nào', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1124, 1, 'vi', 'core/media/media', 'javascript.visit_link', 'Mở liên kết', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1125, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.icon', 'fas fa-cloud-upload-alt', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1126, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.title', 'Bạn có thể kéo thả tập tin vào đây để tải lên', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1127, 1, 'vi', 'core/media/media', 'javascript.no_item.all_media.message', 'Hoặc có thể bấm nút Tải lên ở phía trên', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1128, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.icon', 'fas fa-trash-alt', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1129, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.title', 'Hiện tại không có tập tin nào trong thùng rác', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1130, 1, 'vi', 'core/media/media', 'javascript.no_item.trash.message', 'Xóa tập tin sẽ đem tập tin lưu vào thùng rác. Xóa tập tin trong thùng rác sẽ xóa vĩnh viễn.', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1131, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.icon', 'fas fa-star', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1132, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.title', 'Bạn chưa đặt tập tin nào vào mục yêu thích', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1133, 1, 'vi', 'core/media/media', 'javascript.no_item.favorites.message', 'Thêm tập tin vào mục yêu thích để tìm kiếm chúng dễ dàng sau này.', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1134, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.icon', 'far fa-clock', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1135, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.title', 'Bạn chưa mở tập tin nào.', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1136, 1, 'vi', 'core/media/media', 'javascript.no_item.recent.message', 'Mục này hiển thị các tập tin bạn đã xem gần đây.', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1137, 1, 'vi', 'core/media/media', 'javascript.no_item.default.icon', 'fas fa-sync', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1138, 1, 'vi', 'core/media/media', 'javascript.no_item.default.title', 'Thư mục trống', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1139, 1, 'vi', 'core/media/media', 'javascript.no_item.default.message', 'Thư mục này chưa có tập tin nào', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1140, 1, 'vi', 'core/media/media', 'javascript.clipboard.success', 'Đường dẫn của các tập tin đã được sao chép vào clipboard', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1141, 1, 'vi', 'core/media/media', 'javascript.message.error_header', 'Lỗi', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1142, 1, 'vi', 'core/media/media', 'javascript.message.success_header', 'Thành công', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1143, 1, 'vi', 'core/media/media', 'javascript.download.error', 'Bạn chưa chọn tập tin nào hoặc tập tin này không cho phép tải về', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1144, 1, 'vi', 'core/media/media', 'javascript.actions_list.basic.preview', 'Xem trước', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1145, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.copy_link', 'Sao chép đường dẫn', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1146, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.rename', 'Đổi tên', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1147, 1, 'vi', 'core/media/media', 'javascript.actions_list.file.make_copy', 'Nhân bản', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1148, 1, 'vi', 'core/media/media', 'javascript.actions_list.user.favorite', 'Yêu thích', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1149, 1, 'vi', 'core/media/media', 'javascript.actions_list.user.remove_favorite', 'Xóa khỏi mục yêu thích', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1150, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.download', 'Tải xuống', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1151, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.trash', 'Chuyển vào thùng rác', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1152, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.delete', 'Xóa hoàn toàn', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1153, 1, 'vi', 'core/media/media', 'javascript.actions_list.other.restore', 'Khôi phục', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1154, 1, 'vi', 'core/media/media', 'empty_trash_success', 'Dọn sạch thùng rác thành công', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1155, 1, 'vi', 'core/media/media', 'name_invalid', 'Tên thư mục chứa ký tự không hợp lệ', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1156, 1, 'en', 'core/setting/setting', 'title', 'Settings', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1157, 1, 'en', 'core/setting/setting', 'email_setting_title', 'Email settings', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1158, 1, 'en', 'core/setting/setting', 'general.theme', 'Theme', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1159, 1, 'en', 'core/setting/setting', 'general.description', 'Setting site information', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1160, 1, 'en', 'core/setting/setting', 'general.title', 'General', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1161, 1, 'en', 'core/setting/setting', 'general.general_block', 'General Information', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1162, 1, 'en', 'core/setting/setting', 'general.rich_editor', 'Rich Editor', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1163, 1, 'en', 'core/setting/setting', 'general.site_title', 'Site title', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1164, 1, 'en', 'core/setting/setting', 'general.admin_email', 'Admin Email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1165, 1, 'en', 'core/setting/setting', 'general.seo_block', 'SEO Configuration', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1166, 1, 'en', 'core/setting/setting', 'general.seo_title', 'SEO Title', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1167, 1, 'en', 'core/setting/setting', 'general.seo_description', 'SEO Description', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1168, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1169, 1, 'en', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1170, 1, 'en', 'core/setting/setting', 'general.placeholder.site_title', 'Site Title (maximum 120 characters)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1171, 1, 'en', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1172, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_title', 'SEO Title (maximum 120 characters)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1173, 1, 'en', 'core/setting/setting', 'general.placeholder.seo_description', 'SEO Description (maximum 120 characters)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1174, 1, 'en', 'core/setting/setting', 'general.placeholder.google_analytics', 'Google Analytics', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1175, 1, 'en', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Google Site Verification', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1176, 1, 'en', 'core/setting/setting', 'general.cache_admin_menu', 'Cache admin menu?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1177, 1, 'en', 'core/setting/setting', 'general.enable_send_error_reporting_via_email', 'Enable to send error reporting via email?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1178, 1, 'en', 'core/setting/setting', 'general.time_zone', 'Timezone', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1179, 1, 'en', 'core/setting/setting', 'general.default_admin_theme', 'Default admin theme', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1180, 1, 'en', 'core/setting/setting', 'general.enable_change_admin_theme', 'Enable change admin theme?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1181, 1, 'en', 'core/setting/setting', 'general.enable', 'Enable', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1182, 1, 'en', 'core/setting/setting', 'general.disable', 'Disable', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1183, 1, 'en', 'core/setting/setting', 'general.enable_cache', 'Enable cache?', '2021-05-08 21:17:54', '2021-05-08 21:17:54');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1184, 1, 'en', 'core/setting/setting', 'general.cache_time', 'Cache time (minutes)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1185, 1, 'en', 'core/setting/setting', 'general.cache_time_site_map', 'Cache Time Site map', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1186, 1, 'en', 'core/setting/setting', 'general.admin_logo', 'Admin logo', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1187, 1, 'en', 'core/setting/setting', 'general.admin_favicon', 'Admin favicon', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1188, 1, 'en', 'core/setting/setting', 'general.admin_title', 'Admin title', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1189, 1, 'en', 'core/setting/setting', 'general.admin_title_placeholder', 'Title show to tab of browser', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1190, 1, 'en', 'core/setting/setting', 'general.cache_block', 'Cache', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1191, 1, 'en', 'core/setting/setting', 'general.admin_appearance_title', 'Admin appearance', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1192, 1, 'en', 'core/setting/setting', 'general.admin_appearance_description', 'Setting admin appearance such as editor, language...', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1193, 1, 'en', 'core/setting/setting', 'general.seo_block_description', 'Setting site title, site meta description, site keyword for optimize SEO', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1194, 1, 'en', 'core/setting/setting', 'general.webmaster_tools_description', 'Google Webmaster Tools (GWT) is free software that helps you manage the technical side of your website', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1195, 1, 'en', 'core/setting/setting', 'general.cache_description', 'Config cache for system for optimize speed', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1196, 1, 'en', 'core/setting/setting', 'general.yes', 'Yes', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1197, 1, 'en', 'core/setting/setting', 'general.no', 'No', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1198, 1, 'en', 'core/setting/setting', 'general.show_on_front', 'Your homepage displays', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1199, 1, 'en', 'core/setting/setting', 'general.select', '— Select —', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1200, 1, 'en', 'core/setting/setting', 'general.show_site_name', 'Show site name after page title, separate with \"-\"?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1201, 1, 'en', 'core/setting/setting', 'general.locale', 'Site language', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1202, 1, 'en', 'core/setting/setting', 'general.locale_direction', 'Language direction', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1203, 1, 'en', 'core/setting/setting', 'general.admin_login_screen_backgrounds', 'Login screen backgrounds (~1366x768)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1204, 1, 'en', 'core/setting/setting', 'email.subject', 'Subject', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1205, 1, 'en', 'core/setting/setting', 'email.content', 'Content', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1206, 1, 'en', 'core/setting/setting', 'email.title', 'Setting for email template', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1207, 1, 'en', 'core/setting/setting', 'email.description', 'Email template using HTML & system variables.', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1208, 1, 'en', 'core/setting/setting', 'email.reset_to_default', 'Reset to default', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1209, 1, 'en', 'core/setting/setting', 'email.back', 'Back to settings', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1210, 1, 'en', 'core/setting/setting', 'email.reset_success', 'Reset back to default successfully', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1211, 1, 'en', 'core/setting/setting', 'email.confirm_reset', 'Confirm reset email template?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1212, 1, 'en', 'core/setting/setting', 'email.confirm_message', 'Do you really want to reset this email template to default?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1213, 1, 'en', 'core/setting/setting', 'email.continue', 'Continue', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1214, 1, 'en', 'core/setting/setting', 'email.sender_name', 'Sender name', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1215, 1, 'en', 'core/setting/setting', 'email.sender_name_placeholder', 'Name', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1216, 1, 'en', 'core/setting/setting', 'email.sender_email', 'Sender email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1217, 1, 'en', 'core/setting/setting', 'email.mailer', 'Mailer', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1218, 1, 'en', 'core/setting/setting', 'email.port', 'Port', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1219, 1, 'en', 'core/setting/setting', 'email.port_placeholder', 'Ex: 587', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1220, 1, 'en', 'core/setting/setting', 'email.host', 'Host', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1221, 1, 'en', 'core/setting/setting', 'email.host_placeholder', 'Ex: smtp.gmail.com', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1222, 1, 'en', 'core/setting/setting', 'email.username', 'Username', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1223, 1, 'en', 'core/setting/setting', 'email.username_placeholder', 'Username to login to mail server', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1224, 1, 'en', 'core/setting/setting', 'email.password', 'Password', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1225, 1, 'en', 'core/setting/setting', 'email.password_placeholder', 'Password to login to mail server', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1226, 1, 'en', 'core/setting/setting', 'email.encryption', 'Encryption', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1227, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain', 'Domain', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1228, 1, 'en', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Domain', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1229, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret', 'Secret', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1230, 1, 'en', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Secret', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1231, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint', 'Endpoint', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1232, 1, 'en', 'core/setting/setting', 'email.mail_gun_endpoint_placeholder', 'Endpoint', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1233, 1, 'en', 'core/setting/setting', 'email.log_channel', 'Log channel', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1234, 1, 'en', 'core/setting/setting', 'email.sendmail_path', 'Sendmail Path', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1235, 1, 'en', 'core/setting/setting', 'email.encryption_placeholder', 'Encryption: ssl or tls', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1236, 1, 'en', 'core/setting/setting', 'email.ses_key', 'Key', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1237, 1, 'en', 'core/setting/setting', 'email.ses_key_placeholder', 'Key', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1238, 1, 'en', 'core/setting/setting', 'email.ses_secret', 'Secret', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1239, 1, 'en', 'core/setting/setting', 'email.ses_secret_placeholder', 'Secret', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1240, 1, 'en', 'core/setting/setting', 'email.ses_region', 'Region', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1241, 1, 'en', 'core/setting/setting', 'email.ses_region_placeholder', 'Region', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1242, 1, 'en', 'core/setting/setting', 'email.postmark_token', 'Token', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1243, 1, 'en', 'core/setting/setting', 'email.postmark_token_placeholder', 'Token', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1244, 1, 'en', 'core/setting/setting', 'email.template_title', 'Email templates', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1245, 1, 'en', 'core/setting/setting', 'email.template_description', 'Base templates for all emails', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1246, 1, 'en', 'core/setting/setting', 'email.template_header', 'Email template header', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1247, 1, 'en', 'core/setting/setting', 'email.template_header_description', 'Template for header of emails', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1248, 1, 'en', 'core/setting/setting', 'email.template_footer', 'Email template footer', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1249, 1, 'en', 'core/setting/setting', 'email.template_footer_description', 'Template for footer of emails', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1250, 1, 'en', 'core/setting/setting', 'email.default', 'Default', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1251, 1, 'en', 'core/setting/setting', 'email.using_queue_to_send_mail', 'Using queue job to send emails (Must to setup Queue first https://laravel.com/docs/queues#supervisor-configuration)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1252, 1, 'en', 'core/setting/setting', 'media.title', 'Media', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1253, 1, 'en', 'core/setting/setting', 'media.driver', 'Driver', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1254, 1, 'en', 'core/setting/setting', 'media.description', 'Settings for media', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1255, 1, 'en', 'core/setting/setting', 'media.aws_access_key_id', 'AWS Access Key ID', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1256, 1, 'en', 'core/setting/setting', 'media.aws_secret_key', 'AWS Secret Key', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1257, 1, 'en', 'core/setting/setting', 'media.aws_default_region', 'AWS Default Region', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1258, 1, 'en', 'core/setting/setting', 'media.aws_bucket', 'AWS Bucket', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1259, 1, 'en', 'core/setting/setting', 'media.aws_url', 'AWS URL', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1260, 1, 'en', 'core/setting/setting', 'media.do_spaces_access_key_id', 'DO Spaces Access Key ID', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1261, 1, 'en', 'core/setting/setting', 'media.do_spaces_secret_key', 'DO Spaces Secret Key', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1262, 1, 'en', 'core/setting/setting', 'media.do_spaces_default_region', 'DO Spaces Default Region', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1263, 1, 'en', 'core/setting/setting', 'media.do_spaces_bucket', 'DO Spaces Bucket', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1264, 1, 'en', 'core/setting/setting', 'media.do_spaces_endpoint', 'DO Spaces Endpoint', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1265, 1, 'en', 'core/setting/setting', 'media.do_spaces_cdn_enabled', 'Is DO Spaces CDN enabled?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1266, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain', 'Do Spaces CDN custom domain', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1267, 1, 'en', 'core/setting/setting', 'media.media_do_spaces_cdn_custom_domain_placeholder', 'https://your-custom-domain.com', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1268, 1, 'en', 'core/setting/setting', 'media.enable_chunk', 'Enable chunk size upload?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1269, 1, 'en', 'core/setting/setting', 'media.chunk_size', 'Chunk size (Bytes)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1270, 1, 'en', 'core/setting/setting', 'media.chunk_size_placeholder', 'Default: 1048576 ~ 1MB', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1271, 1, 'en', 'core/setting/setting', 'media.max_file_size', 'Chunk max file size (MB)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1272, 1, 'en', 'core/setting/setting', 'media.max_file_size_placeholder', 'Default: 1048576 ~ 1GB', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1273, 1, 'en', 'core/setting/setting', 'media.enable_watermark', 'Enable watermark?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1274, 1, 'en', 'core/setting/setting', 'media.watermark_source', 'Watermark image', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1275, 1, 'en', 'core/setting/setting', 'media.watermark_size', 'Size of watermark (%)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1276, 1, 'en', 'core/setting/setting', 'media.watermark_size_placeholder', 'Default: 10 (%)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1277, 1, 'en', 'core/setting/setting', 'media.watermark_opacity', 'Watermark Opacity (%)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1278, 1, 'en', 'core/setting/setting', 'media.watermark_opacity_placeholder', 'Default: 70 (%)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1279, 1, 'en', 'core/setting/setting', 'media.watermark_position', 'Watermark position', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1280, 1, 'en', 'core/setting/setting', 'media.watermark_position_x', 'Watermark position X', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1281, 1, 'en', 'core/setting/setting', 'media.watermark_position_y', 'Watermark position Y', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1282, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_left', 'Top left', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1283, 1, 'en', 'core/setting/setting', 'media.watermark_position_top_right', 'Top right', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1284, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_left', 'Bottom left', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1285, 1, 'en', 'core/setting/setting', 'media.watermark_position_bottom_right', 'Bottom right', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1286, 1, 'en', 'core/setting/setting', 'media.watermark_position_center', 'Center', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1287, 1, 'en', 'core/setting/setting', 'license.purchase_code', 'Purchase code', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1288, 1, 'en', 'core/setting/setting', 'license.buyer', 'Buyer', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1289, 1, 'en', 'core/setting/setting', 'field_type_not_exists', 'This field type does not exist', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1290, 1, 'en', 'core/setting/setting', 'save_settings', 'Save settings', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1291, 1, 'en', 'core/setting/setting', 'template', 'Template', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1292, 1, 'en', 'core/setting/setting', 'description', 'Description', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1293, 1, 'en', 'core/setting/setting', 'enable', 'Enable', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1294, 1, 'en', 'core/setting/setting', 'send', 'Send', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1295, 1, 'en', 'core/setting/setting', 'test_email_description', 'To send test email, please make sure you are updated configuration to send mail!', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1296, 1, 'en', 'core/setting/setting', 'test_email_input_placeholder', 'Enter the email which you want to send test email.', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1297, 1, 'en', 'core/setting/setting', 'test_email_modal_title', 'Send a test email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1298, 1, 'en', 'core/setting/setting', 'test_send_mail', 'Send test mail', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1299, 1, 'en', 'core/setting/setting', 'test_email_send_success', 'Send email successfully!', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1300, 1, 'en', 'core/setting/setting', 'locale_direction_ltr', 'Left to Right', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1301, 1, 'en', 'core/setting/setting', 'locale_direction_rtl', 'Right to Left', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1302, 1, 'vi', 'core/setting/setting', 'title', 'Cài đặt', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1303, 1, 'vi', 'core/setting/setting', 'general.theme', 'Giao diện', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1304, 1, 'vi', 'core/setting/setting', 'general.description', 'Cấu hình những thông tin cài đặt website.', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1305, 1, 'vi', 'core/setting/setting', 'general.title', 'Thông tin chung', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1306, 1, 'vi', 'core/setting/setting', 'general.general_block', 'Thông tin chung', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1307, 1, 'vi', 'core/setting/setting', 'general.site_title', 'Tên trang', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1308, 1, 'vi', 'core/setting/setting', 'general.admin_email', 'Email quản trị viên', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1309, 1, 'vi', 'core/setting/setting', 'general.seo_block', 'Cấu hình SEO', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1310, 1, 'vi', 'core/setting/setting', 'general.seo_title', 'Tiêu đề SEO', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1311, 1, 'vi', 'core/setting/setting', 'general.seo_description', 'Mô tả SEO', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1312, 1, 'vi', 'core/setting/setting', 'general.seo_keywords', 'Từ khoá SEO', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1313, 1, 'vi', 'core/setting/setting', 'general.webmaster_tools_block', 'Google Webmaster Tools', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1314, 1, 'vi', 'core/setting/setting', 'general.google_site_verification', 'Google site verification', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1315, 1, 'vi', 'core/setting/setting', 'general.enable_captcha', 'Sử dụng Captcha?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1316, 1, 'vi', 'core/setting/setting', 'general.contact_block', 'Thông tin liên hệ', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1317, 1, 'vi', 'core/setting/setting', 'general.placeholder.site_title', 'Tên trang (tối đa 120 kí tự)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1318, 1, 'vi', 'core/setting/setting', 'general.placeholder.admin_email', 'Admin Email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1319, 1, 'vi', 'core/setting/setting', 'general.placeholder.google_analytics', 'Ví dụ: UA-42767940-2', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1320, 1, 'vi', 'core/setting/setting', 'general.placeholder.google_site_verification', 'Mã xác nhận trang web dùng cho Google Webmaster Tool', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1321, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_title', 'Tiêu đề SEO (tối đa 120 kí tự)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1322, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_description', 'Mô tả SEO (tối đa 120 kí tự)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1323, 1, 'vi', 'core/setting/setting', 'general.placeholder.seo_keywords', 'Từ khoá SEO (tối đa 60 kí tự, phân cách từ khóa bằng dấu phẩy)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1324, 1, 'vi', 'core/setting/setting', 'general.enable_change_admin_theme', 'Cho phép thay đổi giao diện quản trị?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1325, 1, 'vi', 'core/setting/setting', 'general.enable_multi_language_in_admin', 'Cho phép thay đổi ngôn ngữ trang quản trị?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1326, 1, 'vi', 'core/setting/setting', 'general.enable', 'Bật', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1327, 1, 'vi', 'core/setting/setting', 'general.disable', 'Tắt', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1328, 1, 'vi', 'core/setting/setting', 'general.enable_cache', 'Bật bộ nhớ đệm?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1329, 1, 'vi', 'core/setting/setting', 'general.cache_time', 'Thời gian lưu bộ nhớ đệm (phút)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1330, 1, 'vi', 'core/setting/setting', 'general.cache_time_site_map', 'Thời gian lưu sơ đồ trang trong bộ nhớ đệm', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1331, 1, 'vi', 'core/setting/setting', 'general.admin_logo', 'Logo trang quản trị', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1332, 1, 'vi', 'core/setting/setting', 'general.admin_title', 'Tiêu đề trang quản trị', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1333, 1, 'vi', 'core/setting/setting', 'general.admin_title_placeholder', 'Tiêu đề hiển thị trên thẻ trình duyệt', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1334, 1, 'vi', 'core/setting/setting', 'general.rich_editor', 'Bộ soạn thảo văn bản', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1335, 1, 'vi', 'core/setting/setting', 'general.cache_block', 'Bộ nhớ đệm', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1336, 1, 'vi', 'core/setting/setting', 'general.yes', 'Bật', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1337, 1, 'vi', 'core/setting/setting', 'general.no', 'Tắt', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1338, 1, 'vi', 'core/setting/setting', 'email.subject', 'Tiêu đề', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1339, 1, 'vi', 'core/setting/setting', 'email.content', 'Nội dung', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1340, 1, 'vi', 'core/setting/setting', 'email.title', 'Cấu hình email template', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1341, 1, 'vi', 'core/setting/setting', 'email.description', 'Cấu trúc file template sử dụng HTML và các biến trong hệ thống.', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1342, 1, 'vi', 'core/setting/setting', 'email.reset_to_default', 'Khôi phục về mặc định', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1343, 1, 'vi', 'core/setting/setting', 'email.back', 'Trở lại trang cài đặt', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1344, 1, 'vi', 'core/setting/setting', 'email.reset_success', 'Khôi phục mặc định thành công', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1345, 1, 'vi', 'core/setting/setting', 'email.confirm_reset', 'Xác nhận khôi phục mặc định?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1346, 1, 'vi', 'core/setting/setting', 'email.confirm_message', 'Bạn có chắc chắn muốn khôi phục về bản mặc định?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1347, 1, 'vi', 'core/setting/setting', 'email.continue', 'Tiếp tục', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1348, 1, 'vi', 'core/setting/setting', 'email.sender_name', 'Tên người gửi', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1349, 1, 'vi', 'core/setting/setting', 'email.sender_name_placeholder', 'Tên', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1350, 1, 'vi', 'core/setting/setting', 'email.sender_email', 'Email của người gửi', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1351, 1, 'vi', 'core/setting/setting', 'email.driver', 'Loại', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1352, 1, 'vi', 'core/setting/setting', 'email.port', 'Cổng', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1353, 1, 'vi', 'core/setting/setting', 'email.port_placeholder', 'Ví dụ: 587', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1354, 1, 'vi', 'core/setting/setting', 'email.host', 'Máy chủ', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1355, 1, 'vi', 'core/setting/setting', 'email.host_placeholder', 'Ví dụ: smtp.gmail.com', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1356, 1, 'vi', 'core/setting/setting', 'email.username', 'Tên đăng nhập', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1357, 1, 'vi', 'core/setting/setting', 'email.username_placeholder', 'Tên đăng nhập vào máy chủ mail', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1358, 1, 'vi', 'core/setting/setting', 'email.password', 'Mật khẩu', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1359, 1, 'vi', 'core/setting/setting', 'email.password_placeholder', 'Mật khẩu đăng nhập vào máy chủ mail', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1360, 1, 'vi', 'core/setting/setting', 'email.encryption', 'Mã hoá', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1361, 1, 'vi', 'core/setting/setting', 'email.mail_gun_domain', 'Tên miền', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1362, 1, 'vi', 'core/setting/setting', 'email.mail_gun_domain_placeholder', 'Tên miền', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1363, 1, 'vi', 'core/setting/setting', 'email.mail_gun_secret', 'Chuỗi bí mật', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1364, 1, 'vi', 'core/setting/setting', 'email.mail_gun_secret_placeholder', 'Chuỗi bí mật', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1365, 1, 'vi', 'core/setting/setting', 'email.template_title', 'Mẫu giao diện email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1366, 1, 'vi', 'core/setting/setting', 'email.template_description', 'Giao diện mặc định cho tất cả email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1367, 1, 'vi', 'core/setting/setting', 'email.template_header', 'Mẫu cho phần trên của email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1368, 1, 'vi', 'core/setting/setting', 'email.template_header_description', 'Phần trên của tất cả email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1369, 1, 'vi', 'core/setting/setting', 'email.template_footer', 'Mẫu cho phần dưới của email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1370, 1, 'vi', 'core/setting/setting', 'email.template_footer_description', 'Phần dưới của tất cả email', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1371, 1, 'vi', 'core/setting/setting', 'save_settings', 'Lưu cài đặt', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1372, 1, 'vi', 'core/setting/setting', 'template', 'Mẫu', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1373, 1, 'vi', 'core/setting/setting', 'description', 'Mô tả', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1374, 1, 'vi', 'core/setting/setting', 'enable', 'Bật', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1375, 1, 'vi', 'core/setting/setting', 'test_send_mail', 'Gửi thử nghiệm', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1376, 1, 'en', 'core/table/general', 'operations', 'Operations', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1377, 1, 'en', 'core/table/general', 'loading_data', 'Loading data from server', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1378, 1, 'en', 'core/table/general', 'display', 'Display', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1379, 1, 'en', 'core/table/general', 'all', 'All', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1380, 1, 'en', 'core/table/general', 'edit_entry', 'Edit', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1381, 1, 'en', 'core/table/general', 'delete_entry', 'Delete', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1382, 1, 'en', 'core/table/general', 'show_from', 'Showing from', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1383, 1, 'en', 'core/table/general', 'to', 'to', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1384, 1, 'en', 'core/table/general', 'in', 'in', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1385, 1, 'en', 'core/table/general', 'records', 'records', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1386, 1, 'en', 'core/table/general', 'no_data', 'No data to display', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1387, 1, 'en', 'core/table/general', 'no_record', 'No record', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1388, 1, 'en', 'core/table/general', 'loading', 'Loading data from server', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1389, 1, 'en', 'core/table/general', 'confirm_delete', 'Confirm delete', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1390, 1, 'en', 'core/table/general', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1391, 1, 'en', 'core/table/general', 'cancel', 'Cancel', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1392, 1, 'en', 'core/table/general', 'delete', 'Delete', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1393, 1, 'en', 'core/table/general', 'close', 'Close', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1394, 1, 'en', 'core/table/general', 'contains', 'Contains', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1395, 1, 'en', 'core/table/general', 'is_equal_to', 'Is equal to', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1396, 1, 'en', 'core/table/general', 'greater_than', 'Greater than', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1397, 1, 'en', 'core/table/general', 'less_than', 'Less than', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1398, 1, 'en', 'core/table/general', 'value', 'Value', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1399, 1, 'en', 'core/table/general', 'select_field', 'Select field', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1400, 1, 'en', 'core/table/general', 'reset', 'Reset', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1401, 1, 'en', 'core/table/general', 'add_additional_filter', 'Add additional filter', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1402, 1, 'en', 'core/table/general', 'apply', 'Apply', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1403, 1, 'en', 'core/table/general', 'filters', 'Filters', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1404, 1, 'en', 'core/table/general', 'bulk_change', 'Bulk changes', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1405, 1, 'en', 'core/table/general', 'select_option', 'Select option', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1406, 1, 'en', 'core/table/general', 'bulk_actions', 'Bulk Actions', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1407, 1, 'en', 'core/table/general', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1408, 1, 'en', 'core/table/general', 'please_select_record', 'Please select at least one record to perform this action!', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1409, 1, 'en', 'core/table/general', 'filtered', '(filtered from _MAX_ total records)', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1410, 1, 'en', 'core/table/general', 'search', 'Search...', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1411, 1, 'en', 'core/table/table', 'operations', 'Operations', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1412, 1, 'en', 'core/table/table', 'loading_data', 'Loading data from server', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1413, 1, 'en', 'core/table/table', 'display', 'Display', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1414, 1, 'en', 'core/table/table', 'all', 'All', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1415, 1, 'en', 'core/table/table', 'edit_entry', 'Edit', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1416, 1, 'en', 'core/table/table', 'delete_entry', 'Delete', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1417, 1, 'en', 'core/table/table', 'show_from', 'Showing from', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1418, 1, 'en', 'core/table/table', 'to', 'to', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1419, 1, 'en', 'core/table/table', 'in', 'in', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1420, 1, 'en', 'core/table/table', 'records', 'records', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1421, 1, 'en', 'core/table/table', 'no_data', 'No data to display', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1422, 1, 'en', 'core/table/table', 'no_record', 'No record', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1423, 1, 'en', 'core/table/table', 'loading', 'Loading data from server', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1424, 1, 'en', 'core/table/table', 'confirm_delete', 'Confirm delete', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1425, 1, 'en', 'core/table/table', 'confirm_delete_msg', 'Do you really want to delete this record?', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1426, 1, 'en', 'core/table/table', 'cancel', 'Cancel', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1427, 1, 'en', 'core/table/table', 'delete', 'Delete', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1428, 1, 'en', 'core/table/table', 'close', 'Close', '2021-05-08 21:17:54', '2021-05-08 21:17:54'),
(1429, 1, 'en', 'core/table/table', 'contains', 'Contains', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1430, 1, 'en', 'core/table/table', 'is_equal_to', 'Is equal to', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1431, 1, 'en', 'core/table/table', 'greater_than', 'Greater than', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1432, 1, 'en', 'core/table/table', 'less_than', 'Less than', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1433, 1, 'en', 'core/table/table', 'value', 'Value', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1434, 1, 'en', 'core/table/table', 'select_field', 'Select field', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1435, 1, 'en', 'core/table/table', 'reset', 'Reset', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1436, 1, 'en', 'core/table/table', 'add_additional_filter', 'Add additional filter', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1437, 1, 'en', 'core/table/table', 'apply', 'Apply', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1438, 1, 'en', 'core/table/table', 'filters', 'Filters', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1439, 1, 'en', 'core/table/table', 'bulk_change', 'Bulk changes', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1440, 1, 'en', 'core/table/table', 'select_option', 'Select option', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1441, 1, 'en', 'core/table/table', 'bulk_actions', 'Bulk Actions', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1442, 1, 'en', 'core/table/table', 'save_bulk_change_success', 'Update data for selected record(s) successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1443, 1, 'en', 'core/table/table', 'please_select_record', 'Please select at least one record to perform this action!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1444, 1, 'en', 'core/table/table', 'filtered', '(filtered from _MAX_ total records)', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1445, 1, 'en', 'core/table/table', 'search', 'Search...', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1446, 1, 'vi', 'core/table/general', 'operations', 'Hành động', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1447, 1, 'vi', 'core/table/general', 'loading_data', 'Đang tải dữ liệu từ hệ thống', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1448, 1, 'vi', 'core/table/general', 'display', 'Hiển thị', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1449, 1, 'vi', 'core/table/general', 'all', 'Tất cả', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1450, 1, 'vi', 'core/table/general', 'edit_entry', 'Sửa', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1451, 1, 'vi', 'core/table/general', 'delete_entry', 'Xoá', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1452, 1, 'vi', 'core/table/general', 'show_from', 'Hiển thị từ', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1453, 1, 'vi', 'core/table/general', 'to', 'đến', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1454, 1, 'vi', 'core/table/general', 'in', 'trong tổng số', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1455, 1, 'vi', 'core/table/general', 'records', 'bản ghi', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1456, 1, 'vi', 'core/table/general', 'no_data', 'Không có dữ liệu để hiển thị', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1457, 1, 'vi', 'core/table/general', 'no_record', 'không có bản ghi nào', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1458, 1, 'vi', 'core/table/general', 'loading', 'Đang tải dữ liệu từ hệ thống', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1459, 1, 'vi', 'core/table/general', 'confirm_delete', 'Xác nhận xoá', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1460, 1, 'vi', 'core/table/general', 'confirm_delete_msg', 'Bạn có chắc chắn muốn xoá bản ghi này?', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1461, 1, 'vi', 'core/table/general', 'cancel', 'Huỷ bỏ', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1462, 1, 'vi', 'core/table/general', 'delete', 'Xoá', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1463, 1, 'vi', 'core/table/general', 'close', 'Đóng', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1464, 1, 'vi', 'core/table/general', 'is_equal_to', 'Bằng với', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1465, 1, 'vi', 'core/table/general', 'greater_than', 'Lớn hơn', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1466, 1, 'vi', 'core/table/general', 'less_than', 'Nhỏ hơn', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1467, 1, 'vi', 'core/table/general', 'value', 'Giá trị', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1468, 1, 'vi', 'core/table/general', 'select_field', 'Chọn trường', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1469, 1, 'vi', 'core/table/general', 'reset', 'Làm mới', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1470, 1, 'vi', 'core/table/general', 'add_additional_filter', 'Thêm bộ lọc', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1471, 1, 'vi', 'core/table/general', 'apply', 'Áp dụng', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1472, 1, 'vi', 'core/table/general', 'select_option', 'Lựa chọn', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1473, 1, 'vi', 'core/table/general', 'filters', 'Lọc dữ liệu', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1474, 1, 'vi', 'core/table/general', 'bulk_change', 'Thay đổi hàng loạt', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1475, 1, 'vi', 'core/table/general', 'bulk_actions', 'Hành động', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1476, 1, 'vi', 'core/table/general', 'contains', 'Bao gồm', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1477, 1, 'vi', 'core/table/general', 'filtered', '(đã được lọc từ _MAX_ bản ghi)', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1478, 1, 'en', 'packages/menu/menu', 'name', 'Menus', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1479, 1, 'en', 'packages/menu/menu', 'key_name', 'Menu name (key: :key)', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1480, 1, 'en', 'packages/menu/menu', 'basic_info', 'Basic information', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1481, 1, 'en', 'packages/menu/menu', 'add_to_menu', 'Add to menu', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1482, 1, 'en', 'packages/menu/menu', 'custom_link', 'Custom link', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1483, 1, 'en', 'packages/menu/menu', 'add_link', 'Add link', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1484, 1, 'en', 'packages/menu/menu', 'structure', 'Menu structure', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1485, 1, 'en', 'packages/menu/menu', 'remove', 'Remove', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1486, 1, 'en', 'packages/menu/menu', 'cancel', 'Cancel', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1487, 1, 'en', 'packages/menu/menu', 'title', 'Title', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1488, 1, 'en', 'packages/menu/menu', 'icon', 'Icon', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1489, 1, 'en', 'packages/menu/menu', 'url', 'URL', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1490, 1, 'en', 'packages/menu/menu', 'target', 'Target', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1491, 1, 'en', 'packages/menu/menu', 'css_class', 'CSS class', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1492, 1, 'en', 'packages/menu/menu', 'self_open_link', 'Open link directly', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1493, 1, 'en', 'packages/menu/menu', 'blank_open_link', 'Open link in new tab', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1494, 1, 'en', 'packages/menu/menu', 'create', 'Create menu', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1495, 1, 'en', 'packages/menu/menu', 'edit', 'Edit menu', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1496, 1, 'en', 'packages/menu/menu', 'menu_settings', 'Menu settings', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1497, 1, 'en', 'packages/menu/menu', 'display_location', 'Display location', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1498, 1, 'vi', 'packages/menu/menu', 'name', 'Trình đơn', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1499, 1, 'vi', 'packages/menu/menu', 'cancel', 'Hủy bỏ', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1500, 1, 'vi', 'packages/menu/menu', 'add_link', 'Thêm liên kết', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1501, 1, 'vi', 'packages/menu/menu', 'add_to_menu', 'Thêm vào trình đơn', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1502, 1, 'vi', 'packages/menu/menu', 'basic_info', 'Thông tin cơ bản', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1503, 1, 'vi', 'packages/menu/menu', 'blank_open_link', 'Mở liên kết trong tab mới', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1504, 1, 'vi', 'packages/menu/menu', 'css_class', 'CSS class', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1505, 1, 'vi', 'packages/menu/menu', 'custom_link', 'Liên kết tùy chọn', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1506, 1, 'vi', 'packages/menu/menu', 'icon', 'Biểu tượng', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1507, 1, 'vi', 'packages/menu/menu', 'key_name', 'Tên menu (key::key)', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1508, 1, 'vi', 'packages/menu/menu', 'remove', 'Xóa', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1509, 1, 'vi', 'packages/menu/menu', 'self_open_link', 'Mở liên kết trong tab hiện tại', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1510, 1, 'vi', 'packages/menu/menu', 'structure', 'Cấu trúc trình đơn', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1511, 1, 'vi', 'packages/menu/menu', 'target', 'Target', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1512, 1, 'vi', 'packages/menu/menu', 'title', 'Tiêu đề', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1513, 1, 'vi', 'packages/menu/menu', 'url', 'URL', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1514, 1, 'vi', 'packages/menu/menu', 'create', 'Tạo trình đơn', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1515, 1, 'vi', 'packages/menu/menu', 'edit', 'Sửa trình đơn', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1516, 1, 'en', 'packages/optimize/optimize', 'settings.title', 'Optimize page speed', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1517, 1, 'en', 'packages/optimize/optimize', 'settings.description', 'Minify HTML output, inline CSS, remove comments...', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1518, 1, 'en', 'packages/optimize/optimize', 'settings.enable', 'Enable optimize page speed?', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1519, 1, 'vi', 'packages/optimize/optimize', 'settings.title', 'Optimize page speed', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1520, 1, 'vi', 'packages/optimize/optimize', 'settings.description', 'Minify HTML output, inline CSS, remove comments...', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1521, 1, 'vi', 'packages/optimize/optimize', 'settings.enable', 'Enable optimize page speed?', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1522, 1, 'en', 'packages/page/pages', 'create', 'Create new page', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1523, 1, 'en', 'packages/page/pages', 'edit', 'Edit page', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1524, 1, 'en', 'packages/page/pages', 'form.name', 'Name', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1525, 1, 'en', 'packages/page/pages', 'form.name_placeholder', 'Page\'s name (Maximum 120 characters)', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1526, 1, 'en', 'packages/page/pages', 'form.content', 'Content', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1527, 1, 'en', 'packages/page/pages', 'form.note', 'Note content', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1528, 1, 'en', 'packages/page/pages', 'notices.no_select', 'Please select at least one record to take this action!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1529, 1, 'en', 'packages/page/pages', 'notices.update_success_message', 'Update successfully', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1530, 1, 'en', 'packages/page/pages', 'cannot_delete', 'Page could not be deleted', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1531, 1, 'en', 'packages/page/pages', 'deleted', 'Page deleted', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1532, 1, 'en', 'packages/page/pages', 'pages', 'Pages', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1533, 1, 'en', 'packages/page/pages', 'menu', 'Pages', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1534, 1, 'en', 'packages/page/pages', 'menu_name', 'Pages', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1535, 1, 'en', 'packages/page/pages', 'edit_this_page', 'Edit this page', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1536, 1, 'en', 'packages/page/pages', 'total_pages', 'Total pages', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1537, 1, 'en', 'packages/page/pages', 'settings.show_on_front', 'Your homepage displays', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1538, 1, 'en', 'packages/page/pages', 'settings.select', '— Select —', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1539, 1, 'en', 'packages/page/pages', 'front_page', 'Front Page', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1540, 1, 'vi', 'packages/page/pages', 'model', 'Trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1541, 1, 'vi', 'packages/page/pages', 'models', 'Trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1542, 1, 'vi', 'packages/page/pages', 'list', 'Danh sách trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1543, 1, 'vi', 'packages/page/pages', 'create', 'Thêm trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1544, 1, 'vi', 'packages/page/pages', 'edit', 'Sửa trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1545, 1, 'vi', 'packages/page/pages', 'form.name', 'Tiêu đề trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1546, 1, 'vi', 'packages/page/pages', 'form.note', 'Nội dung ghi chú', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1547, 1, 'vi', 'packages/page/pages', 'form.name_placeholder', 'Tên trang (tối đa 120 kí tự)', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1548, 1, 'vi', 'packages/page/pages', 'form.content', 'Nội dung', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1549, 1, 'vi', 'packages/page/pages', 'notices.no_select', 'Chọn ít nhất 1 trang để thực hiện hành động này!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1550, 1, 'vi', 'packages/page/pages', 'notices.update_success_message', 'Cập nhật thành công', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1551, 1, 'vi', 'packages/page/pages', 'deleted', 'Xóa trang thành công', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1552, 1, 'vi', 'packages/page/pages', 'cannot_delete', 'Không thể xóa trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1553, 1, 'vi', 'packages/page/pages', 'menu', 'Trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1554, 1, 'vi', 'packages/page/pages', 'menu_name', 'Trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1555, 1, 'vi', 'packages/page/pages', 'edit_this_page', 'Sửa trang này', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1556, 1, 'vi', 'packages/page/pages', 'pages', 'Trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1557, 1, 'en', 'packages/plugin-management/plugin', 'enabled', 'Enabled', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1558, 1, 'en', 'packages/plugin-management/plugin', 'deactivated', 'Deactivated', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1559, 1, 'en', 'packages/plugin-management/plugin', 'activated', 'Activated', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1560, 1, 'en', 'packages/plugin-management/plugin', 'activate', 'Activate', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1561, 1, 'en', 'packages/plugin-management/plugin', 'deactivate', 'Deactivate', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1562, 1, 'en', 'packages/plugin-management/plugin', 'author', 'By', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1563, 1, 'en', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Update plugin successfully', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1564, 1, 'en', 'packages/plugin-management/plugin', 'plugins', 'Plugins', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1565, 1, 'en', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Please activate plugin(s): :plugins before activate this plugin!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1566, 1, 'en', 'packages/plugin-management/plugin', 'remove', 'Remove', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1567, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Remove plugin successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1568, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin', 'Remove plugin', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1569, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Do you really want to remove this plugin?', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1570, 1, 'en', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Yes, remove it!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1571, 1, 'en', 'packages/plugin-management/plugin', 'total_plugins', 'Total plugins', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1572, 1, 'en', 'packages/plugin-management/plugin', 'invalid_plugin', 'This plugin is not a valid plugin, please check it again!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1573, 1, 'en', 'packages/plugin-management/plugin', 'version', 'Version', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1574, 1, 'en', 'packages/plugin-management/plugin', 'invalid_json', 'Invalid plugin.json!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1575, 1, 'en', 'packages/plugin-management/plugin', 'activate_success', 'Activate plugin successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1576, 1, 'en', 'packages/plugin-management/plugin', 'activated_already', 'This plugin is activated already!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1577, 1, 'en', 'packages/plugin-management/plugin', 'plugin_not_exist', 'This plugin is not exists.', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1578, 1, 'en', 'packages/plugin-management/plugin', 'missing_json_file', 'Missing file plugin.json!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1579, 1, 'en', 'packages/plugin-management/plugin', 'plugin_invalid', 'Plugin is valid!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1580, 1, 'en', 'packages/plugin-management/plugin', 'published_assets_success', 'Publish assets for plugin :name successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1581, 1, 'en', 'packages/plugin-management/plugin', 'plugin_removed', 'Plugin has been removed!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1582, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_success', 'Deactivate plugin successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1583, 1, 'en', 'packages/plugin-management/plugin', 'deactivated_already', 'This plugin is deactivated already!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1584, 1, 'en', 'packages/plugin-management/plugin', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1585, 1, 'en', 'packages/plugin-management/plugin', 'plugin_is_not_ready', 'Plugin :name is not ready to use', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1586, 1, 'vi', 'packages/plugin-management/plugin', 'activate', 'Kích hoạt', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1587, 1, 'vi', 'packages/plugin-management/plugin', 'author', 'Tác giả', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1588, 1, 'vi', 'packages/plugin-management/plugin', 'version', 'Phiên bản', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1589, 1, 'vi', 'packages/plugin-management/plugin', 'activated', 'Đã kích hoạt', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1590, 1, 'vi', 'packages/plugin-management/plugin', 'deactivate', 'Hủy kích hoạt', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1591, 1, 'vi', 'packages/plugin-management/plugin', 'deactivated', 'Đã vô hiệu', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1592, 1, 'vi', 'packages/plugin-management/plugin', 'enabled', 'Kích hoạt', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1593, 1, 'vi', 'packages/plugin-management/plugin', 'invalid_plugin', 'Gói mở rộng không hợp lệ', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1594, 1, 'vi', 'packages/plugin-management/plugin', 'update_plugin_status_success', 'Cập nhật trạng thái gói mở rộng thành công', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1595, 1, 'vi', 'packages/plugin-management/plugin', 'missing_required_plugins', 'Vui lòng kích hoạt các gói mở rộng :plugins trước khi kích hoạt gói này', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1596, 1, 'vi', 'packages/plugin-management/plugin', 'plugins', 'Gói mở rộng', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1597, 1, 'vi', 'packages/plugin-management/plugin', 'remove', 'Xoá', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1598, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin_success', 'Xoá thành công!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1599, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin', 'Xoá gói mở rộng', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1600, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin_confirm_message', 'Bạn có chắc chắn muốn xoá plugin này?', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1601, 1, 'vi', 'packages/plugin-management/plugin', 'remove_plugin_confirm_yes', 'Có, xoá!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1602, 1, 'vi', 'packages/plugin-management/plugin', 'total_plugins', 'Tất cả plugins', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1603, 1, 'en', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Search Engine Optimize', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1604, 1, 'en', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Edit SEO meta', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1605, 1, 'en', 'packages/seo-helper/seo-helper', 'default_description', 'Setup meta title & description to make your site easy to discovered on search engines such as Google', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1606, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_title', 'SEO Title', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1607, 1, 'en', 'packages/seo-helper/seo-helper', 'seo_description', 'SEO description', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1608, 1, 'vi', 'packages/seo-helper/seo-helper', 'meta_box_header', 'Tối ưu hoá bộ máy tìm kiếm (SEO)', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1609, 1, 'vi', 'packages/seo-helper/seo-helper', 'edit_seo_meta', 'Chỉnh sửa SEO', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1610, 1, 'vi', 'packages/seo-helper/seo-helper', 'default_description', 'Thiết lập các thẻ mô tả giúp người dùng dễ dàng tìm thấy trên công cụ tìm kiếm như Google.', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1611, 1, 'vi', 'packages/seo-helper/seo-helper', 'seo_title', 'Tiêu đề trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1612, 1, 'vi', 'packages/seo-helper/seo-helper', 'seo_description', 'Mô tả trang', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1613, 1, 'en', 'packages/slug/slug', 'permalink_settings', 'Permalink', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1614, 1, 'en', 'packages/slug/slug', 'settings.title', 'Permalink settings', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1615, 1, 'en', 'packages/slug/slug', 'settings.description', 'Manage permalink for all modules.', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1616, 1, 'en', 'packages/slug/slug', 'settings.preview', 'Preview', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1617, 1, 'en', 'packages/slug/slug', 'settings.turn_off_automatic_url_translation_into_latin', 'Turn off automatic URL translation into Latin?', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1618, 1, 'en', 'packages/slug/slug', 'preview', 'Preview', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1619, 1, 'en', 'packages/theme/theme', 'name', 'Themes', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1620, 1, 'en', 'packages/theme/theme', 'theme', 'Theme', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1621, 1, 'en', 'packages/theme/theme', 'author', 'Author', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1622, 1, 'en', 'packages/theme/theme', 'version', 'Version', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1623, 1, 'en', 'packages/theme/theme', 'description', 'Description', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1624, 1, 'en', 'packages/theme/theme', 'active_success', 'Activate theme :name successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1625, 1, 'en', 'packages/theme/theme', 'active', 'Active', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1626, 1, 'en', 'packages/theme/theme', 'activated', 'Activated', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1627, 1, 'en', 'packages/theme/theme', 'appearance', 'Appearance', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1628, 1, 'en', 'packages/theme/theme', 'theme_options', 'Theme options', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1629, 1, 'en', 'packages/theme/theme', 'save_changes', 'Save Changes', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1630, 1, 'en', 'packages/theme/theme', 'developer_mode', 'Developer Mode Enabled', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1631, 1, 'en', 'packages/theme/theme', 'custom_css', 'Custom CSS', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1632, 1, 'en', 'packages/theme/theme', 'custom_js', 'Custom JS', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1633, 1, 'en', 'packages/theme/theme', 'custom_header_js', 'Header JS', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1634, 1, 'en', 'packages/theme/theme', 'custom_header_js_placeholder', 'JS in header of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1635, 1, 'en', 'packages/theme/theme', 'custom_body_js', 'Body JS', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1636, 1, 'en', 'packages/theme/theme', 'custom_body_js_placeholder', 'JS in body of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1637, 1, 'en', 'packages/theme/theme', 'custom_footer_js', 'Footer JS', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1638, 1, 'en', 'packages/theme/theme', 'custom_footer_js_placeholder', 'JS in footer of page, wrap it inside &#x3C;script&#x3E;&#x3C;/script&#x3E;', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1639, 1, 'en', 'packages/theme/theme', 'remove_theme_success', 'Remove theme successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1640, 1, 'en', 'packages/theme/theme', 'theme_is_not_existed', 'This theme is not existed!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1641, 1, 'en', 'packages/theme/theme', 'remove', 'Remove', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1642, 1, 'en', 'packages/theme/theme', 'remove_theme', 'Remove theme', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1643, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_message', 'Do you really want to remove this theme?', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1644, 1, 'en', 'packages/theme/theme', 'remove_theme_confirm_yes', 'Yes, remove it!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1645, 1, 'en', 'packages/theme/theme', 'total_themes', 'Total themes', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1646, 1, 'en', 'packages/theme/theme', 'show_admin_bar', 'Show admin bar (When admin logged in, still show admin bar in website)?', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1647, 1, 'en', 'packages/theme/theme', 'settings.title', 'Theme', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1648, 1, 'en', 'packages/theme/theme', 'settings.description', 'Setting for theme', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1649, 1, 'en', 'packages/theme/theme', 'add_new', 'Add new', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1650, 1, 'en', 'packages/theme/theme', 'theme_activated_already', 'Theme \":name\" is activated already!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1651, 1, 'en', 'packages/theme/theme', 'missing_json_file', 'Missing file theme.json!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1652, 1, 'en', 'packages/theme/theme', 'theme_invalid', 'Theme is valid!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1653, 1, 'en', 'packages/theme/theme', 'published_assets_success', 'Publish assets for :themes successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1654, 1, 'en', 'packages/theme/theme', 'cannot_remove_theme', 'Cannot remove activated theme, please activate another theme before removing \":name\"!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1655, 1, 'en', 'packages/theme/theme', 'theme_deleted', 'Theme \":name\" has been destroyed.', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1656, 1, 'en', 'packages/theme/theme', 'removed_assets', 'Remove assets of a theme :name successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1657, 1, 'en', 'packages/theme/theme', 'update_custom_css_success', 'Update custom CSS successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1658, 1, 'en', 'packages/theme/theme', 'update_custom_js_success', 'Update custom JS successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1659, 1, 'en', 'packages/theme/theme', 'go_to_dashboard', 'Go to dashboard', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1660, 1, 'en', 'packages/theme/theme', 'custom_css_placeholder', 'Using Ctrl + Space to autocomplete.', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1661, 1, 'en', 'packages/theme/theme', 'theme_option_general', 'General', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1662, 1, 'en', 'packages/theme/theme', 'theme_option_general_description', 'General settings', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1663, 1, 'en', 'packages/theme/theme', 'theme_option_seo_open_graph_image', 'SEO default Open Graph image', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1664, 1, 'en', 'packages/theme/theme', 'theme_option_logo', 'Logo', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1665, 1, 'en', 'packages/theme/theme', 'theme_option_favicon', 'favicon', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1666, 1, 'en', 'packages/theme/theme', 'folder_is_not_writeable', 'Cannot write files! Folder :name is not writable. Please chmod to make it writable!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1667, 1, 'vi', 'packages/theme/theme', 'name', 'Giao diện', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1668, 1, 'vi', 'packages/theme/theme', 'activated', 'Đã kích hoạt', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1669, 1, 'vi', 'packages/theme/theme', 'active', 'Kích hoạt', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1670, 1, 'vi', 'packages/theme/theme', 'active_success', 'Kích hoạt giao diện thành công!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1671, 1, 'vi', 'packages/theme/theme', 'author', 'Tác giả', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1672, 1, 'vi', 'packages/theme/theme', 'description', 'Mô tả', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1673, 1, 'vi', 'packages/theme/theme', 'theme', 'Giao diện', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1674, 1, 'vi', 'packages/theme/theme', 'theme_options', 'Tuỳ chọn giao diện', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1675, 1, 'vi', 'packages/theme/theme', 'version', 'Phiên bản', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1676, 1, 'vi', 'packages/theme/theme', 'save_changes', 'Lưu thay đổi', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1677, 1, 'vi', 'packages/theme/theme', 'developer_mode', 'Đang kích hoạt chế độ thử nghiệm', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1678, 1, 'vi', 'packages/theme/theme', 'custom_css', 'Tuỳ chỉnh CSS', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1679, 1, 'en', 'packages/widget/global', 'name', 'Widgets', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1680, 1, 'en', 'packages/widget/global', 'create', 'New widget', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1681, 1, 'en', 'packages/widget/global', 'edit', 'Edit widget', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1682, 1, 'en', 'packages/widget/global', 'delete', 'Delete', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1683, 1, 'en', 'packages/widget/global', 'available', 'Available Widgets', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1684, 1, 'en', 'packages/widget/global', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1685, 1, 'en', 'packages/widget/global', 'number_tag_display', 'Number tags will be display', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1686, 1, 'en', 'packages/widget/global', 'number_post_display', 'Number posts will be display', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1687, 1, 'en', 'packages/widget/global', 'select_menu', 'Select Menu', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1688, 1, 'en', 'packages/widget/global', 'widget_text', 'Text', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1689, 1, 'en', 'packages/widget/global', 'widget_text_description', 'Arbitrary text or HTML.', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1690, 1, 'en', 'packages/widget/global', 'widget_recent_post', 'Recent Posts', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1691, 1, 'en', 'packages/widget/global', 'widget_recent_post_description', 'Recent posts widget.', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1692, 1, 'en', 'packages/widget/global', 'widget_custom_menu', 'Custom Menu', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1693, 1, 'en', 'packages/widget/global', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1694, 1, 'en', 'packages/widget/global', 'widget_tag', 'Tags', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1695, 1, 'en', 'packages/widget/global', 'widget_tag_description', 'Popular tags', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1696, 1, 'en', 'packages/widget/global', 'save_success', 'Save widget successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1697, 1, 'en', 'packages/widget/global', 'delete_success', 'Delete widget successfully!', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1698, 1, 'en', 'packages/widget/widget', 'name', 'Widgets', '2021-05-08 21:17:55', '2021-05-08 21:17:55'),
(1699, 1, 'en', 'packages/widget/widget', 'create', 'New widget', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1700, 1, 'en', 'packages/widget/widget', 'edit', 'Edit widget', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1701, 1, 'en', 'packages/widget/widget', 'delete', 'Delete', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1702, 1, 'en', 'packages/widget/widget', 'available', 'Available Widgets', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1703, 1, 'en', 'packages/widget/widget', 'instruction', 'To activate a widget drag it to a sidebar or click on it. To deactivate a widget and delete its settings, drag it back.', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1704, 1, 'en', 'packages/widget/widget', 'number_tag_display', 'Number tags will be display', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1705, 1, 'en', 'packages/widget/widget', 'number_post_display', 'Number posts will be display', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1706, 1, 'en', 'packages/widget/widget', 'select_menu', 'Select Menu', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1707, 1, 'en', 'packages/widget/widget', 'widget_text', 'Text', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1708, 1, 'en', 'packages/widget/widget', 'widget_text_description', 'Arbitrary text or HTML.', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1709, 1, 'en', 'packages/widget/widget', 'widget_recent_post', 'Recent Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1710, 1, 'en', 'packages/widget/widget', 'widget_recent_post_description', 'Recent posts widget.', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1711, 1, 'en', 'packages/widget/widget', 'widget_custom_menu', 'Custom Menu', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1712, 1, 'en', 'packages/widget/widget', 'widget_custom_menu_description', 'Add a custom menu to your widget area.', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1713, 1, 'en', 'packages/widget/widget', 'widget_tag', 'Tags', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1714, 1, 'en', 'packages/widget/widget', 'widget_tag_description', 'Popular tags', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1715, 1, 'en', 'packages/widget/widget', 'save_success', 'Save widget successfully!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1716, 1, 'en', 'packages/widget/widget', 'delete_success', 'Delete widget successfully!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1717, 1, 'en', 'packages/widget/widget', 'primary_sidebar_name', 'Primary sidebar', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1718, 1, 'en', 'packages/widget/widget', 'primary_sidebar_description', 'Primary sidebar section', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1719, 1, 'vi', 'packages/widget/global', 'name', 'Widgets', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1720, 1, 'vi', 'packages/widget/global', 'create', 'New widget', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1721, 1, 'vi', 'packages/widget/global', 'edit', 'Edit widget', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1722, 1, 'vi', 'packages/widget/global', 'available', 'Tiện ích có sẵn', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1723, 1, 'vi', 'packages/widget/global', 'delete', 'Xóa', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1724, 1, 'vi', 'packages/widget/global', 'instruction', 'Để kích hoạt tiện ích, hãy kéo nó vào sidebar hoặc nhấn vào nó. Để hủy kích hoạt tiện ích và xóa các thiết lập của tiện ích, kéo nó quay trở lại.', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1725, 1, 'vi', 'packages/widget/global', 'number_post_display', 'Số bài viết sẽ hiển thị', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1726, 1, 'vi', 'packages/widget/global', 'number_tag_display', 'Số thẻ sẽ hiển thị', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1727, 1, 'vi', 'packages/widget/global', 'select_menu', 'Lựa chọn trình đơn', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1728, 1, 'vi', 'packages/widget/global', 'widget_custom_menu', 'Menu tùy chỉnh', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1729, 1, 'vi', 'packages/widget/global', 'widget_custom_menu_description', 'Thêm menu tùy chỉnh vào khu vực tiện ích của bạn', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1730, 1, 'vi', 'packages/widget/global', 'widget_recent_post', 'Bài viết gần đây', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1731, 1, 'vi', 'packages/widget/global', 'widget_recent_post_description', 'Tiện ích bài viết gần đây', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1732, 1, 'vi', 'packages/widget/global', 'widget_tag', 'Thẻ', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1733, 1, 'vi', 'packages/widget/global', 'widget_tag_description', 'Thẻ phổ biến, sử dụng nhiều', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1734, 1, 'vi', 'packages/widget/global', 'widget_text', 'Văn bản', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1735, 1, 'vi', 'packages/widget/global', 'widget_text_description', 'Văn bản tùy ý hoặc HTML.', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1736, 1, 'vi', 'packages/widget/global', 'delete_success', 'Xoá tiện ích thành công', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1737, 1, 'vi', 'packages/widget/global', 'save_success', 'Lưu tiện ích thành công!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1738, 1, 'en', 'plugins/analytics/analytics', 'sessions', 'Sessions', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1739, 1, 'en', 'plugins/analytics/analytics', 'visitors', 'Visitors', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1740, 1, 'en', 'plugins/analytics/analytics', 'pageviews', 'Pageviews', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1741, 1, 'en', 'plugins/analytics/analytics', 'bounce_rate', 'Bounce Rate', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1742, 1, 'en', 'plugins/analytics/analytics', 'page_session', 'Pages/Session', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1743, 1, 'en', 'plugins/analytics/analytics', 'avg_duration', 'Avg. Duration', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1744, 1, 'en', 'plugins/analytics/analytics', 'percent_new_session', 'Percent new session', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1745, 1, 'en', 'plugins/analytics/analytics', 'new_users', 'New visitors', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1746, 1, 'en', 'plugins/analytics/analytics', 'visits', 'visits', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1747, 1, 'en', 'plugins/analytics/analytics', 'views', 'views', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1748, 1, 'en', 'plugins/analytics/analytics', 'view_id_not_specified', 'You must provide a valid view id. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1749, 1, 'en', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Analytics credentials is not valid. The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1750, 1, 'en', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Start date :start_date cannot be after end date :end_date', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1751, 1, 'en', 'plugins/analytics/analytics', 'wrong_configuration', 'To view analytics you\'ll need to get a google analytics client id and add it to your settings. <br /> You also need JSON credential data. <br /> The document here: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1752, 1, 'en', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1753, 1, 'en', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1754, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking ID', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1755, 1, 'en', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1756, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1757, 1, 'en', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1758, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1759, 1, 'en', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1760, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_page', 'Top Most Visit Pages', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1761, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Top Browsers', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1762, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Top Referrers', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1763, 1, 'en', 'plugins/analytics/analytics', 'widget_analytics_general', 'Site Analytics', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1764, 1, 'vi', 'plugins/analytics/analytics', 'avg_duration', 'Trung bình', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1765, 1, 'vi', 'plugins/analytics/analytics', 'bounce_rate', 'Tỉ lệ thoát', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1766, 1, 'vi', 'plugins/analytics/analytics', 'page_session', 'Trang/Phiên', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1767, 1, 'vi', 'plugins/analytics/analytics', 'pageviews', 'Lượt xem', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1768, 1, 'vi', 'plugins/analytics/analytics', 'sessions', 'Phiên', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1769, 1, 'vi', 'plugins/analytics/analytics', 'views', 'lượt xem', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1770, 1, 'vi', 'plugins/analytics/analytics', 'visitors', 'Người truy cập', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1771, 1, 'vi', 'plugins/analytics/analytics', 'visits', 'lượt ghé thăm', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1772, 1, 'vi', 'plugins/analytics/analytics', 'credential_is_not_valid', 'Thông tin cài đặt không hợp lệ. Tài liệu hướng dẫn tại đây: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1773, 1, 'vi', 'plugins/analytics/analytics', 'new_users', 'Lượt khách mới', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1774, 1, 'vi', 'plugins/analytics/analytics', 'percent_new_session', 'Tỉ lệ khách mới', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1775, 1, 'vi', 'plugins/analytics/analytics', 'start_date_can_not_before_end_date', 'Ngày bắt đầu :start_date không thể sau ngày kết thúc :end_date', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1776, 1, 'vi', 'plugins/analytics/analytics', 'view_id_not_specified', 'Bạn phải cung cấp View ID hợp lê. Tài liệu hướng dẫn tại đây: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1777, 1, 'vi', 'plugins/analytics/analytics', 'wrong_configuration', 'Để xem dữ liệu thống kê Google Analytics, bạn cần lấy thông tin Client ID và thêm nó vào trong phần cài đặt. Bạn cũng cần thông tin xác thực dạng JSON. Tài liệu hướng dẫn tại đây: <a href=\"https://docs.botble.com/cms/:version/plugin-analytics\" target=\"_blank\">https://docs.botble.com/cms/:version/plugin-analytics</a>', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1778, 1, 'vi', 'plugins/analytics/analytics', 'settings.title', 'Google Analytics', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1779, 1, 'vi', 'plugins/analytics/analytics', 'settings.description', 'Config Credentials for Google Analytics', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1780, 1, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code', 'Tracking Code', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1781, 1, 'vi', 'plugins/analytics/analytics', 'settings.tracking_code_placeholder', 'Example: GA-12586526-8', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1782, 1, 'vi', 'plugins/analytics/analytics', 'settings.view_id', 'View ID', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1783, 1, 'vi', 'plugins/analytics/analytics', 'settings.view_id_description', 'Google Analytics View ID', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1784, 1, 'vi', 'plugins/analytics/analytics', 'settings.json_credential', 'Service Account Credentials', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1785, 1, 'vi', 'plugins/analytics/analytics', 'settings.json_credential_description', 'Service Account Credentials', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1786, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_browser', 'Trình duyệt truy cập nhiều', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1787, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_general', 'Thống kê truy cập', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1788, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_page', 'Trang được xem nhiều nhất', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1789, 1, 'vi', 'plugins/analytics/analytics', 'widget_analytics_referrer', 'Trang giới thiệu nhiều', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1790, 1, 'en', 'plugins/audit-log/history', 'name', 'Activities Logs', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1791, 1, 'en', 'plugins/audit-log/history', 'created', 'created', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1792, 1, 'en', 'plugins/audit-log/history', 'updated', 'updated', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1793, 1, 'en', 'plugins/audit-log/history', 'deleted', 'deleted', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1794, 1, 'en', 'plugins/audit-log/history', 'logged in', 'logged in', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1795, 1, 'en', 'plugins/audit-log/history', 'logged out', 'logged out', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1796, 1, 'en', 'plugins/audit-log/history', 'changed password', 'changed password', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1797, 1, 'en', 'plugins/audit-log/history', 'updated profile', 'updated profile', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1798, 1, 'en', 'plugins/audit-log/history', 'attached', 'attached', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1799, 1, 'en', 'plugins/audit-log/history', 'shared', 'shared', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1800, 1, 'en', 'plugins/audit-log/history', 'to the system', 'to the system', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1801, 1, 'en', 'plugins/audit-log/history', 'of the system', 'of the system', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1802, 1, 'en', 'plugins/audit-log/history', 'menu', 'menu', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1803, 1, 'en', 'plugins/audit-log/history', 'post', 'post', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1804, 1, 'en', 'plugins/audit-log/history', 'page', 'page', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1805, 1, 'en', 'plugins/audit-log/history', 'category', 'category', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1806, 1, 'en', 'plugins/audit-log/history', 'tag', 'tag', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1807, 1, 'en', 'plugins/audit-log/history', 'user', 'user', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1808, 1, 'en', 'plugins/audit-log/history', 'contact', 'contact', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1809, 1, 'en', 'plugins/audit-log/history', 'backup', 'backup', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1810, 1, 'en', 'plugins/audit-log/history', 'custom-field', 'custom field', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1811, 1, 'en', 'plugins/audit-log/history', 'widget_audit_logs', 'Activities Logs', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1812, 1, 'en', 'plugins/audit-log/history', 'action', 'Action', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1813, 1, 'en', 'plugins/audit-log/history', 'user_agent', 'User Agent', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1814, 1, 'en', 'plugins/audit-log/history', 'system', 'System', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1815, 1, 'en', 'plugins/audit-log/history', 'delete_all', 'Delete all records', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1816, 1, 'vi', 'plugins/audit-log/history', 'name', 'Lịch sử hoạt động', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1817, 1, 'vi', 'plugins/audit-log/history', 'created', ' đã tạo', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1818, 1, 'vi', 'plugins/audit-log/history', 'updated', ' đã cập nhật', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1819, 1, 'vi', 'plugins/audit-log/history', 'deleted', ' đã xóa', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1820, 1, 'vi', 'plugins/audit-log/history', 'attached', 'đính kèm', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1821, 1, 'vi', 'plugins/audit-log/history', 'backup', 'sao lưu', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1822, 1, 'vi', 'plugins/audit-log/history', 'category', 'danh mục', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1823, 1, 'vi', 'plugins/audit-log/history', 'changed password', 'thay đổi mật khẩu', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1824, 1, 'vi', 'plugins/audit-log/history', 'contact', 'liên hệ', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1825, 1, 'vi', 'plugins/audit-log/history', 'custom-field', 'khung mở rộng', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1826, 1, 'vi', 'plugins/audit-log/history', 'logged in', 'đăng nhập', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1827, 1, 'vi', 'plugins/audit-log/history', 'logged out', 'đăng xuất', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1828, 1, 'vi', 'plugins/audit-log/history', 'menu', 'trình đơn', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1829, 1, 'vi', 'plugins/audit-log/history', 'of the system', 'khỏi hệ thống', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1830, 1, 'vi', 'plugins/audit-log/history', 'page', 'trang', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1831, 1, 'vi', 'plugins/audit-log/history', 'post', 'bài viết', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1832, 1, 'vi', 'plugins/audit-log/history', 'shared', 'đã chia sẻ', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1833, 1, 'vi', 'plugins/audit-log/history', 'tag', 'thẻ', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1834, 1, 'vi', 'plugins/audit-log/history', 'to the system', 'vào hệ thống', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1835, 1, 'vi', 'plugins/audit-log/history', 'updated profile', 'cập nhật tài khoản', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1836, 1, 'vi', 'plugins/audit-log/history', 'user', 'thành viên', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1837, 1, 'vi', 'plugins/audit-log/history', 'widget_audit_logs', 'Lịch sử hoạt động', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1838, 1, 'vi', 'plugins/audit-log/history', 'system', 'Hệ thống', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1839, 1, 'en', 'plugins/backup/backup', 'name', 'Backup', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1840, 1, 'en', 'plugins/backup/backup', 'backup_description', 'Backup database and uploads folder.', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1841, 1, 'en', 'plugins/backup/backup', 'create_backup_success', 'Created backup successfully!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1842, 1, 'en', 'plugins/backup/backup', 'delete_backup_success', 'Delete backup successfully!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1843, 1, 'en', 'plugins/backup/backup', 'restore_backup_success', 'Restore backup successfully!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1844, 1, 'en', 'plugins/backup/backup', 'generate_btn', 'Generate backup', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1845, 1, 'en', 'plugins/backup/backup', 'create', 'Create a backup', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1846, 1, 'en', 'plugins/backup/backup', 'restore', 'Restore a backup', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1847, 1, 'en', 'plugins/backup/backup', 'create_btn', 'Create', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1848, 1, 'en', 'plugins/backup/backup', 'restore_btn', 'Restore', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1849, 1, 'en', 'plugins/backup/backup', 'restore_confirm_msg', 'Do you really want to restore this revision?', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1850, 1, 'en', 'plugins/backup/backup', 'download_uploads_folder', 'Download backup of uploads folder', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1851, 1, 'en', 'plugins/backup/backup', 'download_database', 'Download backup of database', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1852, 1, 'en', 'plugins/backup/backup', 'restore_tooltip', 'Restore this backup', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1853, 1, 'en', 'plugins/backup/backup', 'demo_alert', 'Hi guest, if you see demo site is destroyed, please help me <a href=\":link\">go here</a> and restore demo site to the latest revision! Thank you so much!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1854, 1, 'en', 'plugins/backup/backup', 'menu_name', 'Backups', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1855, 1, 'en', 'plugins/backup/backup', 'size', 'Size', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1856, 1, 'en', 'plugins/backup/backup', 'no_backups', 'There is no backup now!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1857, 1, 'vi', 'plugins/backup/backup', 'backup_description', 'Sao lưu cơ sở dữ liệu và thư mục /uploads', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1858, 1, 'vi', 'plugins/backup/backup', 'create', 'Tạo bản sao lưu', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1859, 1, 'vi', 'plugins/backup/backup', 'create_backup_success', 'Tạo bản sao lưu thành công!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1860, 1, 'vi', 'plugins/backup/backup', 'create_btn', 'Tạo', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1861, 1, 'vi', 'plugins/backup/backup', 'delete_backup_success', 'Xóa bản sao lưu thành công!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1862, 1, 'vi', 'plugins/backup/backup', 'generate_btn', 'Tạo sao lưu', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1863, 1, 'vi', 'plugins/backup/backup', 'name', 'Sao lưu', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1864, 1, 'vi', 'plugins/backup/backup', 'restore', 'Khôi phục bản sao lưu', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1865, 1, 'vi', 'plugins/backup/backup', 'restore_backup_success', 'Khôi phục bản sao lưu thành công', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1866, 1, 'vi', 'plugins/backup/backup', 'restore_btn', 'Khôi phục', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1867, 1, 'vi', 'plugins/backup/backup', 'restore_confirm_msg', 'Bạn có chắc chắn muốn khôi phục hệ thống về thời điểm tạo bản sao lưu này?', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1868, 1, 'vi', 'plugins/backup/backup', 'restore_tooltip', 'Khôi phục bản sao lưu này', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1869, 1, 'vi', 'plugins/backup/backup', 'download_database', 'Tải về bản sao lưu CSDL', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1870, 1, 'vi', 'plugins/backup/backup', 'download_uploads_folder', 'Tải về bản sao lưu thư mục uploads', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1871, 1, 'vi', 'plugins/backup/backup', 'menu_name', 'Sao lưu', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1872, 1, 'vi', 'plugins/backup/backup', 'demo_alert', 'Chào khách, nếu bạn thấy trang demo bị phá hoại, hãy tới <a href=\":link\">trang sao lưu</a> và khôi phục bản sao lưu cuối cùng. Cảm ơn bạn nhiều!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1873, 1, 'en', 'plugins/blog/base', 'menu_name', 'Blog', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1874, 1, 'en', 'plugins/blog/base', 'blog_page', 'Blog Page', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1875, 1, 'en', 'plugins/blog/base', 'select', '-- Select --', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1876, 1, 'en', 'plugins/blog/base', 'blog_page_id', 'Blog page', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1877, 1, 'en', 'plugins/blog/base', 'number_posts_per_page', 'Number posts per page', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1878, 1, 'en', 'plugins/blog/base', 'write_some_tags', 'Write some tags', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1879, 1, 'en', 'plugins/blog/base', 'short_code_name', 'Blog posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1880, 1, 'en', 'plugins/blog/base', 'short_code_description', 'Add blog posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1881, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_category', 'Number of posts per page in a category', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1882, 1, 'en', 'plugins/blog/base', 'number_posts_per_page_in_tag', 'Number of posts per page in a tag', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1883, 1, 'en', 'plugins/blog/categories', 'create', 'Create new category', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1884, 1, 'en', 'plugins/blog/categories', 'edit', 'Edit category', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1885, 1, 'en', 'plugins/blog/categories', 'menu', 'Categories', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1886, 1, 'en', 'plugins/blog/categories', 'edit_this_category', 'Edit this category', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1887, 1, 'en', 'plugins/blog/categories', 'menu_name', 'Categories', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1888, 1, 'en', 'plugins/blog/categories', 'none', 'None', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1889, 1, 'en', 'plugins/blog/member', 'dob', 'Born :date', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1890, 1, 'en', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1891, 1, 'en', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1892, 1, 'en', 'plugins/blog/member', 'published_posts', 'Published Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1893, 1, 'en', 'plugins/blog/member', 'posts', 'Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1894, 1, 'en', 'plugins/blog/member', 'write_post', 'Write a post', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1895, 1, 'en', 'plugins/blog/posts', 'create', 'Create new post', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1896, 1, 'en', 'plugins/blog/posts', 'edit', 'Edit post', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1897, 1, 'en', 'plugins/blog/posts', 'form.name', 'Name', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1898, 1, 'en', 'plugins/blog/posts', 'form.name_placeholder', 'Post\'s name (Maximum :c characters)', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1899, 1, 'en', 'plugins/blog/posts', 'form.description', 'Description', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1900, 1, 'en', 'plugins/blog/posts', 'form.description_placeholder', 'Short description for post (Maximum :c characters)', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1901, 1, 'en', 'plugins/blog/posts', 'form.categories', 'Categories', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1902, 1, 'en', 'plugins/blog/posts', 'form.tags', 'Tags', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1903, 1, 'en', 'plugins/blog/posts', 'form.tags_placeholder', 'Tags', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1904, 1, 'en', 'plugins/blog/posts', 'form.content', 'Content', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1905, 1, 'en', 'plugins/blog/posts', 'form.is_featured', 'Is featured?', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1906, 1, 'en', 'plugins/blog/posts', 'form.note', 'Note content', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1907, 1, 'en', 'plugins/blog/posts', 'form.format_type', 'Format', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1908, 1, 'en', 'plugins/blog/posts', 'cannot_delete', 'Post could not be deleted', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1909, 1, 'en', 'plugins/blog/posts', 'post_deleted', 'Post deleted', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1910, 1, 'en', 'plugins/blog/posts', 'posts', 'Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1911, 1, 'en', 'plugins/blog/posts', 'post', 'Post', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1912, 1, 'en', 'plugins/blog/posts', 'edit_this_post', 'Edit this post', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1913, 1, 'en', 'plugins/blog/posts', 'no_new_post_now', 'There is no new post now!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1914, 1, 'en', 'plugins/blog/posts', 'menu_name', 'Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1915, 1, 'en', 'plugins/blog/posts', 'widget_posts_recent', 'Recent Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1916, 1, 'en', 'plugins/blog/posts', 'categories', 'Categories', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1917, 1, 'en', 'plugins/blog/posts', 'category', 'Category', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1918, 1, 'en', 'plugins/blog/posts', 'author', 'Author', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1919, 1, 'en', 'plugins/blog/settings', 'select', '-- Select --', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1920, 1, 'en', 'plugins/blog/settings', 'blog_page_id', 'Blog page', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1921, 1, 'en', 'plugins/blog/tags', 'form.name', 'Name', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1922, 1, 'en', 'plugins/blog/tags', 'form.name_placeholder', 'Tag\'s name (Maximum 120 characters)', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1923, 1, 'en', 'plugins/blog/tags', 'form.description', 'Description', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1924, 1, 'en', 'plugins/blog/tags', 'form.description_placeholder', 'Short description for tag (Maximum 400 characters)', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1925, 1, 'en', 'plugins/blog/tags', 'form.categories', 'Categories', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1926, 1, 'en', 'plugins/blog/tags', 'notices.no_select', 'Please select at least one tag to take this action!', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1927, 1, 'en', 'plugins/blog/tags', 'create', 'Create new tag', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1928, 1, 'en', 'plugins/blog/tags', 'edit', 'Edit tag', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1929, 1, 'en', 'plugins/blog/tags', 'cannot_delete', 'Tag could not be deleted', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1930, 1, 'en', 'plugins/blog/tags', 'deleted', 'Tag deleted', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1931, 1, 'en', 'plugins/blog/tags', 'menu', 'Tags', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1932, 1, 'en', 'plugins/blog/tags', 'edit_this_tag', 'Edit this tag', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1933, 1, 'en', 'plugins/blog/tags', 'menu_name', 'Tags', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1934, 1, 'vi', 'plugins/blog/base', 'menu_name', 'Blog', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1935, 1, 'vi', 'plugins/blog/categories', 'model', 'Danh mục', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1936, 1, 'vi', 'plugins/blog/categories', 'models', 'Danh mục', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1937, 1, 'vi', 'plugins/blog/categories', 'list', 'Danh sách danh mục', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1938, 1, 'vi', 'plugins/blog/categories', 'create', 'Thêm danh mục mới', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1939, 1, 'vi', 'plugins/blog/categories', 'edit', 'Sửa danh mục', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1940, 1, 'vi', 'plugins/blog/categories', 'menu_name', 'Danh mục', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1941, 1, 'vi', 'plugins/blog/categories', 'edit_this_category', 'Sửa danh mục này', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1942, 1, 'vi', 'plugins/blog/categories', 'menu', 'Danh mục', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1943, 1, 'vi', 'plugins/blog/member', 'dob', 'Born :date', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1944, 1, 'vi', 'plugins/blog/member', 'draft_posts', 'Draft Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1945, 1, 'vi', 'plugins/blog/member', 'pending_posts', 'Pending Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1946, 1, 'vi', 'plugins/blog/member', 'published_posts', 'Published Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1947, 1, 'vi', 'plugins/blog/member', 'posts', 'Posts', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1948, 1, 'vi', 'plugins/blog/member', 'write_post', 'Write a post', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1949, 1, 'vi', 'plugins/blog/posts', 'model', 'Bài viết', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1950, 1, 'vi', 'plugins/blog/posts', 'models', 'Bài viết', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1951, 1, 'vi', 'plugins/blog/posts', 'list', 'Danh sách bài viết', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1952, 1, 'vi', 'plugins/blog/posts', 'create', 'Thêm bài viết', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1953, 1, 'vi', 'plugins/blog/posts', 'edit', 'Sửa bài viết', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1954, 1, 'vi', 'plugins/blog/posts', 'form.name', 'Tên', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1955, 1, 'vi', 'plugins/blog/posts', 'form.name_placeholder', 'Tên bài viết (Tối đa 120 kí tự)', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1956, 1, 'vi', 'plugins/blog/posts', 'form.description', 'Mô tả', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1957, 1, 'vi', 'plugins/blog/posts', 'form.description_placeholder', 'Mô tả ngắn cho bài viết (Tối đa 400 kí tự)', '2021-05-08 21:17:56', '2021-05-08 21:17:56');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1958, 1, 'vi', 'plugins/blog/posts', 'form.categories', 'Chuyên mục', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1959, 1, 'vi', 'plugins/blog/posts', 'form.tags', 'Từ khóa', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1960, 1, 'vi', 'plugins/blog/posts', 'form.tags_placeholder', 'Thêm từ khóa', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1961, 1, 'vi', 'plugins/blog/posts', 'form.content', 'Nội dung', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1962, 1, 'vi', 'plugins/blog/posts', 'form.featured', 'Bài viết nổi bật?', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1963, 1, 'vi', 'plugins/blog/posts', 'form.note', 'Nội dung ghi chú', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1964, 1, 'vi', 'plugins/blog/posts', 'form.format_type', 'Định dạng', '2021-05-08 21:17:56', '2021-05-08 21:17:56'),
(1965, 1, 'vi', 'plugins/blog/posts', 'post_deleted', 'Xóa bài viết thành công', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1966, 1, 'vi', 'plugins/blog/posts', 'cannot_delete', 'Không thể xóa bài viết', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1967, 1, 'vi', 'plugins/blog/posts', 'menu_name', 'Bài viết', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1968, 1, 'vi', 'plugins/blog/posts', 'edit_this_post', 'Sửa bài viết này', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1969, 1, 'vi', 'plugins/blog/posts', 'no_new_post_now', 'Hiện tại không có bài viết mới!', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1970, 1, 'vi', 'plugins/blog/posts', 'posts', 'Bài viết', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1971, 1, 'vi', 'plugins/blog/posts', 'widget_posts_recent', 'Bài viết gần đây', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1972, 1, 'vi', 'plugins/blog/posts', 'author', 'Tác giả', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1973, 1, 'vi', 'plugins/blog/settings', 'title', 'Blog', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1974, 1, 'vi', 'plugins/blog/settings', 'description', 'Settings for Blog plugin', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1975, 1, 'vi', 'plugins/blog/settings', 'select', '-- Select --', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1976, 1, 'vi', 'plugins/blog/settings', 'blog_page_id', 'Blog page', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1977, 1, 'vi', 'plugins/blog/tags', 'model', 'Thẻ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1978, 1, 'vi', 'plugins/blog/tags', 'models', 'Thẻ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1979, 1, 'vi', 'plugins/blog/tags', 'list', 'Danh sách thẻ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1980, 1, 'vi', 'plugins/blog/tags', 'create', 'Thêm thẻ mới', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1981, 1, 'vi', 'plugins/blog/tags', 'edit', 'Sửa thẻ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1982, 1, 'vi', 'plugins/blog/tags', 'form.name', 'Tên', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1983, 1, 'vi', 'plugins/blog/tags', 'form.name_placeholder', 'Tên thẻ (Tối đa 120 kí tự)', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1984, 1, 'vi', 'plugins/blog/tags', 'form.description', 'Mô tả', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1985, 1, 'vi', 'plugins/blog/tags', 'form.description_placeholder', 'Mô tả ngắn cho tag (Tối đa 400 kí tự)', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1986, 1, 'vi', 'plugins/blog/tags', 'form.categories', 'Chuyên mục', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1987, 1, 'vi', 'plugins/blog/tags', 'notices.no_select', 'Chọn ít nhất 1 bài viết để thực hiện hành động này!', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1988, 1, 'vi', 'plugins/blog/tags', 'cannot_delete', 'Không thể xóa thẻ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1989, 1, 'vi', 'plugins/blog/tags', 'deleted', 'Xóa thẻ thành công', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1990, 1, 'vi', 'plugins/blog/tags', 'menu_name', 'Thẻ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1991, 1, 'vi', 'plugins/blog/tags', 'edit_this_tag', 'Sửa thẻ này', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1992, 1, 'vi', 'plugins/blog/tags', 'menu', 'Thẻ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1993, 1, 'en', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1994, 1, 'en', 'plugins/captcha/captcha', 'settings.description', 'Settings for Google Captcha', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1995, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1996, 1, 'en', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1997, 1, 'en', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Enable Captcha?', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1998, 1, 'en', 'plugins/captcha/captcha', 'settings.helper', 'Go here to get credentials https://www.google.com/recaptcha/admin#list.', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(1999, 1, 'en', 'plugins/captcha/captcha', 'settings.hide_badge', 'Hide recaptcha badge (for v3)', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2000, 1, 'en', 'plugins/captcha/captcha', 'settings.type', 'Type', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2001, 1, 'en', 'plugins/captcha/captcha', 'settings.v2_description', 'V2 (Verify requests with a challenge)', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2002, 1, 'en', 'plugins/captcha/captcha', 'settings.v3_description', 'V3 (Verify requests with a score)', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2003, 1, 'en', 'plugins/captcha/captcha', 'failed_validate', 'Failed to validate the captcha.', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2004, 1, 'vi', 'plugins/captcha/captcha', 'settings.title', 'Captcha', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2005, 1, 'vi', 'plugins/captcha/captcha', 'settings.description', 'Cài đặt cho Google Captcha', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2006, 1, 'vi', 'plugins/captcha/captcha', 'settings.captcha_site_key', 'Captcha Site Key', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2007, 1, 'vi', 'plugins/captcha/captcha', 'settings.captcha_secret', 'Captcha Secret', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2008, 1, 'vi', 'plugins/captcha/captcha', 'settings.enable_captcha', 'Bật Captcha?', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2009, 1, 'vi', 'plugins/captcha/captcha', 'settings.helper', 'Truy cập https://www.google.com/recaptcha/admin#list để lấy thông tin về Site key và Secret.', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2010, 1, 'en', 'plugins/contact/contact', 'menu', 'Contact', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2011, 1, 'en', 'plugins/contact/contact', 'edit', 'View contact', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2012, 1, 'en', 'plugins/contact/contact', 'tables.phone', 'Phone', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2013, 1, 'en', 'plugins/contact/contact', 'tables.email', 'Email', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2014, 1, 'en', 'plugins/contact/contact', 'tables.full_name', 'Full Name', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2015, 1, 'en', 'plugins/contact/contact', 'tables.time', 'Time', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2016, 1, 'en', 'plugins/contact/contact', 'tables.address', 'Address', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2017, 1, 'en', 'plugins/contact/contact', 'tables.subject', 'Subject', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2018, 1, 'en', 'plugins/contact/contact', 'tables.content', 'Content', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2019, 1, 'en', 'plugins/contact/contact', 'contact_information', 'Contact information', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2020, 1, 'en', 'plugins/contact/contact', 'replies', 'Replies', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2021, 1, 'en', 'plugins/contact/contact', 'email.header', 'Email', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2022, 1, 'en', 'plugins/contact/contact', 'email.title', 'New contact from your site', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2023, 1, 'en', 'plugins/contact/contact', 'email.success', 'Send message successfully!', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2024, 1, 'en', 'plugins/contact/contact', 'email.failed', 'Can\'t send message on this time, please try again later!', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2025, 1, 'en', 'plugins/contact/contact', 'form.name.required', 'Name is required', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2026, 1, 'en', 'plugins/contact/contact', 'form.email.required', 'Email is required', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2027, 1, 'en', 'plugins/contact/contact', 'form.email.email', 'The email address is not valid', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2028, 1, 'en', 'plugins/contact/contact', 'form.content.required', 'Content is required', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2029, 1, 'en', 'plugins/contact/contact', 'contact_sent_from', 'This contact information sent from', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2030, 1, 'en', 'plugins/contact/contact', 'sender', 'Sender', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2031, 1, 'en', 'plugins/contact/contact', 'sender_email', 'Email', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2032, 1, 'en', 'plugins/contact/contact', 'sender_address', 'Address', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2033, 1, 'en', 'plugins/contact/contact', 'sender_phone', 'Phone', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2034, 1, 'en', 'plugins/contact/contact', 'message_content', 'Message content', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2035, 1, 'en', 'plugins/contact/contact', 'sent_from', 'Email sent from', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2036, 1, 'en', 'plugins/contact/contact', 'form_name', 'Name', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2037, 1, 'en', 'plugins/contact/contact', 'form_email', 'Email', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2038, 1, 'en', 'plugins/contact/contact', 'form_address', 'Address', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2039, 1, 'en', 'plugins/contact/contact', 'form_subject', 'Subject', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2040, 1, 'en', 'plugins/contact/contact', 'form_phone', 'Phone', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2041, 1, 'en', 'plugins/contact/contact', 'form_message', 'Message', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2042, 1, 'en', 'plugins/contact/contact', 'required_field', 'The field with (<span style=\"color: red\">*</span>) is required.', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2043, 1, 'en', 'plugins/contact/contact', 'send_btn', 'Send message', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2044, 1, 'en', 'plugins/contact/contact', 'new_msg_notice', 'You have <span class=\"bold\">:count</span> New Messages', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2045, 1, 'en', 'plugins/contact/contact', 'view_all', 'View all', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2046, 1, 'en', 'plugins/contact/contact', 'statuses.read', 'Read', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2047, 1, 'en', 'plugins/contact/contact', 'statuses.unread', 'Unread', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2048, 1, 'en', 'plugins/contact/contact', 'phone', 'Phone', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2049, 1, 'en', 'plugins/contact/contact', 'address', 'Address', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2050, 1, 'en', 'plugins/contact/contact', 'message', 'Message', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2051, 1, 'en', 'plugins/contact/contact', 'settings.email.title', 'Contact', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2052, 1, 'en', 'plugins/contact/contact', 'settings.email.description', 'Contact email configuration', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2053, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Send notice to administrator', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2054, 1, 'en', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new contact', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2055, 1, 'en', 'plugins/contact/contact', 'no_reply', 'No reply yet!', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2056, 1, 'en', 'plugins/contact/contact', 'reply', 'Reply', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2057, 1, 'en', 'plugins/contact/contact', 'send', 'Send', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2058, 1, 'en', 'plugins/contact/contact', 'shortcode_name', 'Contact form', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2059, 1, 'en', 'plugins/contact/contact', 'shortcode_description', 'Add a contact form', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2060, 1, 'en', 'plugins/contact/contact', 'shortcode_content_description', 'Add shortcode [contact-form][/contact-form] to editor?', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2061, 1, 'en', 'plugins/contact/contact', 'message_sent_success', 'Message sent successfully!', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2062, 1, 'vi', 'plugins/contact/contact', 'menu', 'Liên hệ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2063, 1, 'vi', 'plugins/contact/contact', 'model', 'Liên hệ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2064, 1, 'vi', 'plugins/contact/contact', 'models', 'Liên hệ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2065, 1, 'vi', 'plugins/contact/contact', 'list', 'Danh sách liên hệ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2066, 1, 'vi', 'plugins/contact/contact', 'edit', 'Xem liên hệ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2067, 1, 'vi', 'plugins/contact/contact', 'tables.phone', 'Điện thoại', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2068, 1, 'vi', 'plugins/contact/contact', 'tables.email', 'Email', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2069, 1, 'vi', 'plugins/contact/contact', 'tables.full_name', 'Họ tên', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2070, 1, 'vi', 'plugins/contact/contact', 'tables.time', 'Thời gian', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2071, 1, 'vi', 'plugins/contact/contact', 'tables.address', 'Địa địa chỉ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2072, 1, 'vi', 'plugins/contact/contact', 'tables.subject', 'Tiêu đề', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2073, 1, 'vi', 'plugins/contact/contact', 'tables.content', 'Nội dung', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2074, 1, 'vi', 'plugins/contact/contact', 'notices.no_select', 'Chọn ít nhất 1 liên hệ để thực hiện hành động này!', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2075, 1, 'vi', 'plugins/contact/contact', 'notices.update_success_message', 'Cập nhật thành công', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2076, 1, 'vi', 'plugins/contact/contact', 'cannot_delete', 'Không thể xóa liên hệ này', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2077, 1, 'vi', 'plugins/contact/contact', 'deleted', 'Liên hệ đã được xóa', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2078, 1, 'vi', 'plugins/contact/contact', 'contact_information', 'Thông tin liên hệ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2079, 1, 'vi', 'plugins/contact/contact', 'email.title', 'Thông tin liên hệ mới', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2080, 1, 'vi', 'plugins/contact/contact', 'email.success', 'Gửi tin nhắn thành công!', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2081, 1, 'vi', 'plugins/contact/contact', 'email.failed', 'Có lỗi trong quá trình gửi tin nhắn!', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2082, 1, 'vi', 'plugins/contact/contact', 'email.header', 'Email', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2083, 1, 'vi', 'plugins/contact/contact', 'form.name.required', 'Tên là bắt buộc', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2084, 1, 'vi', 'plugins/contact/contact', 'form.email.required', 'Email là bắt buộc', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2085, 1, 'vi', 'plugins/contact/contact', 'form.email.email', 'Địa chỉ email không hợp lệ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2086, 1, 'vi', 'plugins/contact/contact', 'form.content.required', 'Nội dung là bắt buộc', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2087, 1, 'vi', 'plugins/contact/contact', 'form.g-recaptcha-response.required', 'Hãy xác minh không phải là robot trước khi gửi tin nhắn.', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2088, 1, 'vi', 'plugins/contact/contact', 'form.g-recaptcha-response.captcha', 'Bạn chưa xác minh không phải là robot thành công.', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2089, 1, 'vi', 'plugins/contact/contact', 'confirm_not_robot', 'Xác nhận không phải người máy', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2090, 1, 'vi', 'plugins/contact/contact', 'contact_sent_from', 'Liên hệ này được gửi từ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2091, 1, 'vi', 'plugins/contact/contact', 'form_address', 'Địa chỉ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2092, 1, 'vi', 'plugins/contact/contact', 'form_email', 'Thư điện tử', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2093, 1, 'vi', 'plugins/contact/contact', 'form_message', 'Thông điệp', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2094, 1, 'vi', 'plugins/contact/contact', 'form_name', 'Họ tên', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2095, 1, 'vi', 'plugins/contact/contact', 'form_phone', 'Số điện thoại', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2096, 1, 'vi', 'plugins/contact/contact', 'message_content', 'Nội dung thông điệp', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2097, 1, 'vi', 'plugins/contact/contact', 'required_field', 'Những trường có dấu (<span style=\"color: red\">*</span>) là bắt buộc.', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2098, 1, 'vi', 'plugins/contact/contact', 'send_btn', 'Gửi tin nhắn', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2099, 1, 'vi', 'plugins/contact/contact', 'sender', 'Người gửi', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2100, 1, 'vi', 'plugins/contact/contact', 'sender_address', 'Địa chỉ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2101, 1, 'vi', 'plugins/contact/contact', 'sender_email', 'Thư điện tử', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2102, 1, 'vi', 'plugins/contact/contact', 'sender_phone', 'Số điện thoại', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2103, 1, 'vi', 'plugins/contact/contact', 'sent_from', 'Thư được gửi từ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2104, 1, 'vi', 'plugins/contact/contact', 'mark_as_read', 'Đánh dấu đã đọc', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2105, 1, 'vi', 'plugins/contact/contact', 'mark_as_unread', 'Đánh dấu chưa đọc', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2106, 1, 'vi', 'plugins/contact/contact', 'address', 'Địa chỉ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2107, 1, 'vi', 'plugins/contact/contact', 'message', 'Liên hệ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2108, 1, 'vi', 'plugins/contact/contact', 'new_msg_notice', 'Bạn có <span class=\"bold\">:count</span> tin nhắn mới', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2109, 1, 'vi', 'plugins/contact/contact', 'phone', 'Điện thoại', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2110, 1, 'vi', 'plugins/contact/contact', 'statuses.read', 'Đã đọc', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2111, 1, 'vi', 'plugins/contact/contact', 'statuses.unread', 'Chưa đọc', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2112, 1, 'vi', 'plugins/contact/contact', 'view_all', 'Xem tất cả', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2113, 1, 'vi', 'plugins/contact/contact', 'settings.email.title', 'Liên hệ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2114, 1, 'vi', 'plugins/contact/contact', 'settings.email.description', 'Cấu hình thông tin cho mục liên hệ', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2115, 1, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_title', 'Thông báo tới admin', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2116, 1, 'vi', 'plugins/contact/contact', 'settings.email.templates.notice_description', 'Mẫu nội dung email gửi tới admin khi có liên hệ mới', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2117, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.name', 'Cookie Consent', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2118, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.description', 'Cookie consent settings', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2119, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.enable', 'Enable cookie consent?', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2120, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.message', 'Message', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2121, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.button_text', 'Button text', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2122, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.max_width', 'Max width (px)', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2123, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.background_color', 'Background color', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2124, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.text_color', 'Text color', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2125, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_url', 'Learn more URL', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2126, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'theme_options.learn_more_text', 'Learn more text', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2127, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2128, 1, 'en', 'plugins/cookie-consent/cookie-consent', 'button_text', 'Allow cookies', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2129, 1, 'en', 'plugins/gallery/gallery', 'create', 'Create new gallery', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2130, 1, 'en', 'plugins/gallery/gallery', 'edit', 'Edit gallery', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2131, 1, 'en', 'plugins/gallery/gallery', 'galleries', 'Galleries', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2132, 1, 'en', 'plugins/gallery/gallery', 'item', 'Gallery item', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2133, 1, 'en', 'plugins/gallery/gallery', 'select_image', 'Select images', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2134, 1, 'en', 'plugins/gallery/gallery', 'reset', 'Reset gallery', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2135, 1, 'en', 'plugins/gallery/gallery', 'update_photo_description', 'Update photo\'s description', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2136, 1, 'en', 'plugins/gallery/gallery', 'update_photo_description_placeholder', 'Photo\'s description...', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2137, 1, 'en', 'plugins/gallery/gallery', 'delete_photo', 'Delete this photo', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2138, 1, 'en', 'plugins/gallery/gallery', 'gallery_box', 'Gallery images', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2139, 1, 'en', 'plugins/gallery/gallery', 'by', 'By', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2140, 1, 'en', 'plugins/gallery/gallery', 'menu_name', 'Galleries', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2141, 1, 'en', 'plugins/gallery/gallery', 'gallery_images', 'Gallery images', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2142, 1, 'en', 'plugins/gallery/gallery', 'add_gallery_short_code', 'Add a gallery', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2143, 1, 'en', 'plugins/gallery/gallery', 'shortcode_name', 'Gallery images', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2144, 1, 'en', 'plugins/gallery/gallery', 'limit_display', 'Limit number display', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2145, 1, 'en', 'plugins/hotel/amenity', 'name', 'Amenities', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2146, 1, 'en', 'plugins/hotel/amenity', 'create', 'New amenity', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2147, 1, 'en', 'plugins/hotel/amenity', 'edit', 'Edit amenity', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2148, 1, 'en', 'plugins/hotel/amenity', 'icon', 'Icon', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2149, 1, 'en', 'plugins/hotel/booking-address', 'name', 'Booking addresses', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2150, 1, 'en', 'plugins/hotel/booking-address', 'create', 'New booking address', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2151, 1, 'en', 'plugins/hotel/booking-address', 'edit', 'Edit booking address', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2152, 1, 'en', 'plugins/hotel/booking-room', 'name', 'Booking rooms', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2153, 1, 'en', 'plugins/hotel/booking-room', 'create', 'New booking room', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2154, 1, 'en', 'plugins/hotel/booking-room', 'edit', 'Edit booking room', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2155, 1, 'en', 'plugins/hotel/booking', 'name', 'Bookings', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2156, 1, 'en', 'plugins/hotel/booking', 'create', 'New booking', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2157, 1, 'en', 'plugins/hotel/booking', 'edit', 'Edit booking', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2158, 1, 'en', 'plugins/hotel/booking', 'statuses.pending', 'Pending', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2159, 1, 'en', 'plugins/hotel/booking', 'statuses.processing', 'Processing', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2160, 1, 'en', 'plugins/hotel/booking', 'statuses.completed', 'Completed', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2161, 1, 'en', 'plugins/hotel/booking', 'statuses.cancelled', 'Cancelled', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2162, 1, 'en', 'plugins/hotel/booking', 'amount', 'Amount', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2163, 1, 'en', 'plugins/hotel/booking', 'customer', 'Customer', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2164, 1, 'en', 'plugins/hotel/booking', 'room', 'Room', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2165, 1, 'en', 'plugins/hotel/booking', 'booking_information', 'Booking Information', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2166, 1, 'en', 'plugins/hotel/booking', 'time', 'Time', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2167, 1, 'en', 'plugins/hotel/booking', 'full_name', 'Full Name', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2168, 1, 'en', 'plugins/hotel/booking', 'email', 'Email', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2169, 1, 'en', 'plugins/hotel/booking', 'phone', 'Phone', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2170, 1, 'en', 'plugins/hotel/booking', 'address', 'Address', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2171, 1, 'en', 'plugins/hotel/booking', 'arrival_time', 'Arrival Time', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2172, 1, 'en', 'plugins/hotel/booking', 'start_date', 'Start Date', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2173, 1, 'en', 'plugins/hotel/booking', 'end_date', 'End Date', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2174, 1, 'en', 'plugins/hotel/booking', 'settings.email.title', 'Booking', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2175, 1, 'en', 'plugins/hotel/booking', 'settings.email.description', 'Booking email configuration', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2176, 1, 'en', 'plugins/hotel/booking', 'settings.email.templates.notice_title', 'Send notice to administrator', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2177, 1, 'en', 'plugins/hotel/booking', 'settings.email.templates.notice_description', 'Email template to send notice to administrator when system get new booking', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2178, 1, 'en', 'plugins/hotel/booking', 'settings.email.templates.booking_success_title', 'Send email to guest', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2179, 1, 'en', 'plugins/hotel/booking', 'settings.email.templates.booking_success_description', 'Email template to send email to guest to confirm booking', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2180, 1, 'en', 'plugins/hotel/booking', 'new_booking_notice', 'You have <span class=\"bold\">:count</span> new booking(s)', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2181, 1, 'en', 'plugins/hotel/booking', 'view_all', 'View all', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2182, 1, 'en', 'plugins/hotel/booking', 'payment_method', 'Payment method', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2183, 1, 'en', 'plugins/hotel/booking', 'payment_status_label', 'Payment status', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2184, 1, 'en', 'plugins/hotel/currency', 'currencies', 'Currencies', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2185, 1, 'en', 'plugins/hotel/currency', 'setting_description', 'List of currencies using on website', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2186, 1, 'en', 'plugins/hotel/currency', 'name', 'Name', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2187, 1, 'en', 'plugins/hotel/currency', 'symbol', 'Symbol', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2188, 1, 'en', 'plugins/hotel/currency', 'number_of_decimals', 'Number of decimals', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2189, 1, 'en', 'plugins/hotel/currency', 'exchange_rate', 'Exchange rate', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2190, 1, 'en', 'plugins/hotel/currency', 'is_prefix_symbol', 'Position of symbol', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2191, 1, 'en', 'plugins/hotel/currency', 'is_default', 'Is default?', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2192, 1, 'en', 'plugins/hotel/currency', 'remove', 'Remove', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2193, 1, 'en', 'plugins/hotel/currency', 'new_currency', 'Add a new currency', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2194, 1, 'en', 'plugins/hotel/currency', 'save_settings', 'Save settings', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2195, 1, 'en', 'plugins/hotel/currency', 'before_number', 'Before number', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2196, 1, 'en', 'plugins/hotel/currency', 'after_number', 'After number', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2197, 1, 'en', 'plugins/hotel/customer', 'name', 'Customers', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2198, 1, 'en', 'plugins/hotel/customer', 'create', 'New customer', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2199, 1, 'en', 'plugins/hotel/customer', 'edit', 'Edit customer', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2200, 1, 'en', 'plugins/hotel/customer', 'form.first_name', 'First Name', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2201, 1, 'en', 'plugins/hotel/customer', 'form.first_name_placeholder', 'First Name', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2202, 1, 'en', 'plugins/hotel/customer', 'form.last_name', 'Last Name', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2203, 1, 'en', 'plugins/hotel/customer', 'form.last_name_placeholder', 'Last Name', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2204, 1, 'en', 'plugins/hotel/customer', 'form.email', 'Email', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2205, 1, 'en', 'plugins/hotel/customer', 'form.email_placeholder', 'Ex: example@gmail.com', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2206, 1, 'en', 'plugins/hotel/customer', 'form.phone', 'Phone', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2207, 1, 'en', 'plugins/hotel/feature', 'menu', 'Hotel features', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2208, 1, 'en', 'plugins/hotel/feature', 'name', 'Features', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2209, 1, 'en', 'plugins/hotel/feature', 'create', 'New feature', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2210, 1, 'en', 'plugins/hotel/feature', 'edit', 'Edit feature', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2211, 1, 'en', 'plugins/hotel/feature', 'form.icon', 'Icon', '2021-05-08 21:17:57', '2021-05-08 21:17:57'),
(2212, 1, 'en', 'plugins/hotel/food-type', 'name', 'Food types', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2213, 1, 'en', 'plugins/hotel/food-type', 'create', 'New food type', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2214, 1, 'en', 'plugins/hotel/food-type', 'edit', 'Edit food type', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2215, 1, 'en', 'plugins/hotel/food-type', 'form.icon', 'Icon', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2216, 1, 'en', 'plugins/hotel/food', 'name', 'Foods', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2217, 1, 'en', 'plugins/hotel/food', 'create', 'New food', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2218, 1, 'en', 'plugins/hotel/food', 'edit', 'Edit food', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2219, 1, 'en', 'plugins/hotel/food', 'form.food_type', 'Food Type', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2220, 1, 'en', 'plugins/hotel/food', 'form.price', 'Price', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2221, 1, 'en', 'plugins/hotel/food', 'form.currency', 'Currency', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2222, 1, 'en', 'plugins/hotel/food', 'form.images', 'Images', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2223, 1, 'en', 'plugins/hotel/hotel', 'name', 'Hotel', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2224, 1, 'en', 'plugins/hotel/hotel', 'settings', 'Settings', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2225, 1, 'en', 'plugins/hotel/hotel', 'booking_name', 'Booking name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2226, 1, 'en', 'plugins/hotel/hotel', 'booking_email', 'Booking email', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2227, 1, 'en', 'plugins/hotel/hotel', 'booking_phone', 'Booking phone', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2228, 1, 'en', 'plugins/hotel/hotel', 'booking_address', 'Booking address', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2229, 1, 'en', 'plugins/hotel/hotel', 'booking_link', 'Booking link', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2230, 1, 'en', 'plugins/hotel/place', 'name', 'Places', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2231, 1, 'en', 'plugins/hotel/place', 'create', 'New place', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2232, 1, 'en', 'plugins/hotel/place', 'edit', 'Edit place', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2233, 1, 'en', 'plugins/hotel/place', 'form.distance', 'Distance', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2234, 1, 'en', 'plugins/hotel/place', 'form.distance_placeholder', 'Ex: 1,500m | 21 min. Walk', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2235, 1, 'en', 'plugins/hotel/room-category', 'name', 'Room categories', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2236, 1, 'en', 'plugins/hotel/room-category', 'create', 'New room category', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2237, 1, 'en', 'plugins/hotel/room-category', 'edit', 'Edit room category', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2238, 1, 'en', 'plugins/hotel/room', 'name', 'Rooms', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2239, 1, 'en', 'plugins/hotel/room', 'create', 'New room', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2240, 1, 'en', 'plugins/hotel/room', 'edit', 'Edit room', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2241, 1, 'en', 'plugins/hotel/room', 'images', 'Images', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2242, 1, 'en', 'plugins/hotel/room', 'amenities', 'Amenities', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2243, 1, 'en', 'plugins/hotel/room', 'form.price', 'Price', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2244, 1, 'en', 'plugins/hotel/room', 'form.currency', 'Currency', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2245, 1, 'en', 'plugins/hotel/room', 'form.max_children', 'Max children', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2246, 1, 'en', 'plugins/hotel/room', 'form.max_adults', 'Max adults', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2247, 1, 'en', 'plugins/hotel/room', 'form.category', 'Category', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2248, 1, 'en', 'plugins/hotel/room', 'form.size', 'Size (m2)', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2249, 1, 'en', 'plugins/hotel/room', 'form.number_of_rooms', 'Number of rooms (quantity)', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2250, 1, 'en', 'plugins/hotel/room', 'form.number_of_beds', 'Number of beds', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2251, 1, 'en', 'plugins/hotel/room', 'form.room_availability', 'Room Availability', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2252, 1, 'en', 'plugins/hotel/room', 'form.close', 'Close', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2253, 1, 'en', 'plugins/hotel/room', 'form.save_changes', 'Save changes', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2254, 1, 'en', 'plugins/hotel/room', 'form.is_available', 'Available for booking?', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2255, 1, 'en', 'plugins/hotel/room', 'blocked', 'Blocked', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2256, 1, 'en', 'plugins/hotel/room', 'full_book', 'Full Book', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2257, 1, 'en', 'plugins/hotel/service', 'name', 'Services', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2258, 1, 'en', 'plugins/hotel/service', 'create', 'New service', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2259, 1, 'en', 'plugins/hotel/service', 'edit', 'Edit service', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2260, 1, 'en', 'plugins/hotel/service', 'form.price', 'Price', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2261, 1, 'en', 'plugins/hotel/service', 'form.currency', 'Currency', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2262, 1, 'en', 'plugins/hotel/tax', 'name', 'Taxes', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2263, 1, 'en', 'plugins/hotel/tax', 'create', 'Create a tax', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2264, 1, 'en', 'plugins/hotel/tax', 'edit', 'Edit tax :title', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2265, 1, 'en', 'plugins/hotel/tax', 'title', 'Title', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2266, 1, 'en', 'plugins/hotel/tax', 'percentage', 'Percentage %', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2267, 1, 'en', 'plugins/hotel/tax', 'priority', 'Priority', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2268, 1, 'en', 'plugins/hotel/tax', 'select_tax', '-- select --', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2269, 1, 'en', 'plugins/payment/payment', 'payments', 'Payments', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2270, 1, 'en', 'plugins/payment/payment', 'checkout_success', 'Checkout successfully!', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2271, 1, 'en', 'plugins/payment/payment', 'view_payment', 'View payment #', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2272, 1, 'en', 'plugins/payment/payment', 'charge_id', 'Charge ID', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2273, 1, 'en', 'plugins/payment/payment', 'amount', 'Amount', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2274, 1, 'en', 'plugins/payment/payment', 'currency', 'Currency', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2275, 1, 'en', 'plugins/payment/payment', 'user', 'User', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2276, 1, 'en', 'plugins/payment/payment', 'stripe', 'Stripe', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2277, 1, 'en', 'plugins/payment/payment', 'paypal', 'PayPal', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2278, 1, 'en', 'plugins/payment/payment', 'action', 'Action', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2279, 1, 'en', 'plugins/payment/payment', 'payment_via_card', 'Payment via card', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2280, 1, 'en', 'plugins/payment/payment', 'card_number', 'Card number', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2281, 1, 'en', 'plugins/payment/payment', 'full_name', 'Full name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2282, 1, 'en', 'plugins/payment/payment', 'payment_via_paypal', 'Payment via PayPal', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2283, 1, 'en', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2284, 1, 'en', 'plugins/payment/payment', 'cvc', 'CVC', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2285, 1, 'en', 'plugins/payment/payment', 'details', 'Details', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2286, 1, 'en', 'plugins/payment/payment', 'payer_name', 'Payer Name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2287, 1, 'en', 'plugins/payment/payment', 'email', 'Email', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2288, 1, 'en', 'plugins/payment/payment', 'phone', 'Phone', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2289, 1, 'en', 'plugins/payment/payment', 'country', 'Country', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2290, 1, 'en', 'plugins/payment/payment', 'shipping_address', 'Shipping Address', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2291, 1, 'en', 'plugins/payment/payment', 'payment_details', 'Payment Details', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2292, 1, 'en', 'plugins/payment/payment', 'card', 'Card', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2293, 1, 'en', 'plugins/payment/payment', 'address', 'Address', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2294, 1, 'en', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Could not get Stripe token to make a charge.', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2295, 1, 'en', 'plugins/payment/payment', 'payment_id', 'Payment ID', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2296, 1, 'en', 'plugins/payment/payment', 'payment_methods', 'Payment methods', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2297, 1, 'en', 'plugins/payment/payment', 'transactions', 'Transactions', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2298, 1, 'en', 'plugins/payment/payment', 'payment_methods_description', 'Setup payment methods for website', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2299, 1, 'en', 'plugins/payment/payment', 'paypal_description', 'Customer can buy product and pay directly via PayPal', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2300, 1, 'en', 'plugins/payment/payment', 'use', 'Use', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2301, 1, 'en', 'plugins/payment/payment', 'stripe_description', 'Customer can buy product and pay directly using Visa, Credit card via Stripe', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2302, 1, 'en', 'plugins/payment/payment', 'edit', 'Edit', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2303, 1, 'en', 'plugins/payment/payment', 'settings', 'Settings', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2304, 1, 'en', 'plugins/payment/payment', 'activate', 'Activate', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2305, 1, 'en', 'plugins/payment/payment', 'deactivate', 'Deactivate', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2306, 1, 'en', 'plugins/payment/payment', 'update', 'Update', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2307, 1, 'en', 'plugins/payment/payment', 'configuration_instruction', 'Configuration instruction for :name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2308, 1, 'en', 'plugins/payment/payment', 'configuration_requirement', 'To use :name, you need', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2309, 1, 'en', 'plugins/payment/payment', 'service_registration', 'Register with :name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2310, 1, 'en', 'plugins/payment/payment', 'after_service_registration_msg', 'After registration at :name, you will have Client ID, Client Secret', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2311, 1, 'en', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Enter Client ID, Secret into the box in right hand', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2312, 1, 'en', 'plugins/payment/payment', 'method_name', 'Method name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2313, 1, 'en', 'plugins/payment/payment', 'please_provide_information', 'Please provide information', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2314, 1, 'en', 'plugins/payment/payment', 'client_id', 'Client ID', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2315, 1, 'en', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2316, 1, 'en', 'plugins/payment/payment', 'secret', 'Secret', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2317, 1, 'en', 'plugins/payment/payment', 'stripe_key', 'Stripe Public Key', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2318, 1, 'en', 'plugins/payment/payment', 'stripe_secret', 'Stripe Private Key', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2319, 1, 'en', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2320, 1, 'en', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2321, 1, 'en', 'plugins/payment/payment', 'pay_online_via', 'Pay online via :name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2322, 1, 'en', 'plugins/payment/payment', 'sandbox_mode', 'Sandbox mode', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2323, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method', 'Deactivate payment method', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2324, 1, 'en', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Do you really want to deactivate this payment method?', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2325, 1, 'en', 'plugins/payment/payment', 'agree', 'Agree', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2326, 1, 'en', 'plugins/payment/payment', 'name', 'Payments', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2327, 1, 'en', 'plugins/payment/payment', 'create', 'New payment', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2328, 1, 'en', 'plugins/payment/payment', 'go_back', 'Go back', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2329, 1, 'en', 'plugins/payment/payment', 'information', 'Information', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2330, 1, 'en', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2331, 1, 'en', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2332, 1, 'en', 'plugins/payment/payment', 'methods.cod', 'Cash on delivery (COD)', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2333, 1, 'en', 'plugins/payment/payment', 'methods.bank_transfer', 'Bank transfer', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2334, 1, 'en', 'plugins/payment/payment', 'statuses.pending', 'Pending', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2335, 1, 'en', 'plugins/payment/payment', 'statuses.completed', 'Completed', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2336, 1, 'en', 'plugins/payment/payment', 'statuses.refunding', 'Refunding', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2337, 1, 'en', 'plugins/payment/payment', 'statuses.refunded', 'Refunded', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2338, 1, 'en', 'plugins/payment/payment', 'statuses.fraud', 'Fraud', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2339, 1, 'en', 'plugins/payment/payment', 'statuses.failed', 'Failed', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2340, 1, 'en', 'plugins/payment/payment', 'payment_methods_instruction', 'Guide customers to pay directly. You can choose to pay by delivery or bank transfer', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2341, 1, 'en', 'plugins/payment/payment', 'payment_method_description', 'Payment guide - (Displayed on the notice of successful purchase and payment page)', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2342, 1, 'en', 'plugins/payment/payment', 'payment_via_cod', 'Cash on delivery (COD)', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2343, 1, 'en', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Bank transfer', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2344, 1, 'en', 'plugins/payment/payment', 'payment_pending', 'Checkout successfully. Your payment is pending and will be checked by our staff.', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2345, 1, 'en', 'plugins/payment/payment', 'created_at', 'Created At', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2346, 1, 'en', 'plugins/payment/payment', 'payment_channel', 'Payment Channel', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2347, 1, 'en', 'plugins/payment/payment', 'total', 'Total', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2348, 1, 'en', 'plugins/payment/payment', 'status', 'Status', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2349, 1, 'en', 'plugins/payment/payment', 'default_payment_method', 'Default payment method', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2350, 1, 'en', 'plugins/payment/payment', 'turn_off_success', 'Turn off payment method successfully!', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2351, 1, 'en', 'plugins/payment/payment', 'saved_payment_method_success', 'Saved payment method successfully!', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2352, 1, 'en', 'plugins/payment/payment', 'saved_payment_settings_success', 'Saved payment settings successfully!', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2353, 1, 'en', 'plugins/payment/payment', 'payment_name', 'Name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2354, 1, 'en', 'plugins/payment/payment', 'callback_url', 'Callback URL', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2355, 1, 'en', 'plugins/payment/payment', 'return_url', 'Return URL', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2356, 1, 'en', 'plugins/payment/payment', 'payment_not_found', 'Payment not found!', '2021-05-08 21:17:58', '2021-05-08 21:17:58');
INSERT INTO `translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2357, 1, 'vi', 'plugins/payment/payment', 'payments', 'Thanh toán', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2358, 1, 'vi', 'plugins/payment/payment', 'checkout_success', 'Thanh toán thành công!', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2359, 1, 'vi', 'plugins/payment/payment', 'view_payment', 'Xem thanh toán #', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2360, 1, 'vi', 'plugins/payment/payment', 'charge_id', 'Mã thanh toán', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2361, 1, 'vi', 'plugins/payment/payment', 'amount', 'Số tiền', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2362, 1, 'vi', 'plugins/payment/payment', 'currency', 'Loại tiền tệ', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2363, 1, 'vi', 'plugins/payment/payment', 'user', 'Người dùng', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2364, 1, 'vi', 'plugins/payment/payment', 'stripe', 'Stripe', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2365, 1, 'vi', 'plugins/payment/payment', 'paypal', 'PayPal', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2366, 1, 'vi', 'plugins/payment/payment', 'action', 'Hành động', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2367, 1, 'vi', 'plugins/payment/payment', 'payment_via_card', 'Thanh toán qua thẻ', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2368, 1, 'vi', 'plugins/payment/payment', 'card_number', 'Số thẻ', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2369, 1, 'vi', 'plugins/payment/payment', 'full_name', 'Họ tên', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2370, 1, 'vi', 'plugins/payment/payment', 'payment_via_paypal', 'Thanh toán qua PayPal', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2371, 1, 'vi', 'plugins/payment/payment', 'mm_yy', 'MM/YY', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2372, 1, 'vi', 'plugins/payment/payment', 'cvc', 'CVC', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2373, 1, 'vi', 'plugins/payment/payment', 'details', 'Chi tiết', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2374, 1, 'vi', 'plugins/payment/payment', 'payer_name', 'Tên người mua', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2375, 1, 'vi', 'plugins/payment/payment', 'email', 'Email', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2376, 1, 'vi', 'plugins/payment/payment', 'phone', 'Điện thoại', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2377, 1, 'vi', 'plugins/payment/payment', 'country', 'Quốc gia', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2378, 1, 'vi', 'plugins/payment/payment', 'shipping_address', 'Địa chỉ giao hàng', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2379, 1, 'vi', 'plugins/payment/payment', 'payment_details', 'Chi tiết thanh toán', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2380, 1, 'vi', 'plugins/payment/payment', 'card', 'Thẻ', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2381, 1, 'vi', 'plugins/payment/payment', 'address', 'Địa chỉ', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2382, 1, 'vi', 'plugins/payment/payment', 'could_not_get_stripe_token', 'Không thể lấy mã Stripe để thanh toán.', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2383, 1, 'vi', 'plugins/payment/payment', 'payment_id', 'Mã thanh toán', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2384, 1, 'vi', 'plugins/payment/payment', 'payment_methods', 'Phương thức thanh toán', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2385, 1, 'vi', 'plugins/payment/payment', 'transactions', 'Lịch sử giao dịch', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2386, 1, 'vi', 'plugins/payment/payment', 'payment_methods_description', 'Cài đặt các phương thức thanh toán cho website', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2387, 1, 'vi', 'plugins/payment/payment', 'paypal_description', 'Khách hàng có thể mua hàng và thanh toán trực tiếp thông qua cổng thanh toán PayPal', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2388, 1, 'vi', 'plugins/payment/payment', 'use', 'Dùng', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2389, 1, 'vi', 'plugins/payment/payment', 'stripe_description', 'Khách hàng có thể mua hàng và thanh toán bằng Visa, Credit card thông qua cổng thanh toán Stripe', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2390, 1, 'vi', 'plugins/payment/payment', 'edit', 'Chỉnh sửa', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2391, 1, 'vi', 'plugins/payment/payment', 'settings', 'Cài đặt', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2392, 1, 'vi', 'plugins/payment/payment', 'activate', 'Kích hoạt', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2393, 1, 'vi', 'plugins/payment/payment', 'deactivate', 'Huỷ kích hoạt', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2394, 1, 'vi', 'plugins/payment/payment', 'update', 'Cập nhật', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2395, 1, 'vi', 'plugins/payment/payment', 'configuration_instruction', 'Hướng dẫn cấu hình :name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2396, 1, 'vi', 'plugins/payment/payment', 'configuration_requirement', 'Để sử dụng :name bạn cần', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2397, 1, 'vi', 'plugins/payment/payment', 'service_registration', 'Đăng ký dịch vụ với :name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2398, 1, 'vi', 'plugins/payment/payment', 'after_service_registration_msg', 'Sau khi hoàn tất các bước đăng ký tại :name, bạn sẽ có các thông số Client ID, Client Secret', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2399, 1, 'vi', 'plugins/payment/payment', 'enter_client_id_and_secret', 'Nhập các thông số Client ID, Secret vào ô bên phải', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2400, 1, 'vi', 'plugins/payment/payment', 'method_name', 'Tên phương thức', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2401, 1, 'vi', 'plugins/payment/payment', 'please_provide_information', 'Xin vui lòng cung cấp thông tin', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2402, 1, 'vi', 'plugins/payment/payment', 'client_id', 'Client ID', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2403, 1, 'vi', 'plugins/payment/payment', 'client_secret', 'Client Secret', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2404, 1, 'vi', 'plugins/payment/payment', 'stripe_key', 'Stripe Key', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2405, 1, 'vi', 'plugins/payment/payment', 'stripe_secret', 'Stripe Secret', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2406, 1, 'vi', 'plugins/payment/payment', 'stripe_after_service_registration_msg', 'After registration at :name, you will have Public, Secret keys', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2407, 1, 'vi', 'plugins/payment/payment', 'stripe_enter_client_id_and_secret', 'Enter Public, Secret keys into the box in right hand', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2408, 1, 'vi', 'plugins/payment/payment', 'secret', 'Secret', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2409, 1, 'vi', 'plugins/payment/payment', 'pay_online_via', 'Thanh toán online qua :name', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2410, 1, 'vi', 'plugins/payment/payment', 'sandbox_mode', 'Chế độ thử nghiệm', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2411, 1, 'vi', 'plugins/payment/payment', 'deactivate_payment_method', 'Huỷ kích hoạt phương thức', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2412, 1, 'vi', 'plugins/payment/payment', 'deactivate_payment_method_description', 'Bạn có chắc chắn muốn huỷ phương thức thành toán này?', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2413, 1, 'vi', 'plugins/payment/payment', 'agree', 'Đồng ý', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2414, 1, 'vi', 'plugins/payment/payment', 'name', 'Thanh toán', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2415, 1, 'vi', 'plugins/payment/payment', 'create', 'Thêm thanh toán mới', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2416, 1, 'vi', 'plugins/payment/payment', 'go_back', 'Trở lại', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2417, 1, 'vi', 'plugins/payment/payment', 'information', 'Thông tin', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2418, 1, 'vi', 'plugins/payment/payment', 'methods.paypal', 'PayPal', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2419, 1, 'vi', 'plugins/payment/payment', 'methods.stripe', 'Stripe', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2420, 1, 'vi', 'plugins/payment/payment', 'methods.cod', 'Thanh toán khi giao hàng (COD)', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2421, 1, 'vi', 'plugins/payment/payment', 'methods.bank_transfer', 'Chuyển khoản qua ngân hàng', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2422, 1, 'vi', 'plugins/payment/payment', 'statuses.pending', 'Chưa hoàn tất', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2423, 1, 'vi', 'plugins/payment/payment', 'statuses.completed', 'Đã hoàn thành', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2424, 1, 'vi', 'plugins/payment/payment', 'statuses.refunding', 'Đang hoàn tiền', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2425, 1, 'vi', 'plugins/payment/payment', 'statuses.refunded', 'Đã hoàn tiền', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2426, 1, 'vi', 'plugins/payment/payment', 'statuses.fraud', 'Gian lận', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2427, 1, 'vi', 'plugins/payment/payment', 'statuses.failed', 'Thất bại', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2428, 1, 'vi', 'plugins/payment/payment', 'payment_methods_instruction', 'Hướng dẫn khách hàng thanh toán trực tiếp. Có thể chọn thanh toán khi giao hàng hoặc chuyển khoản', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2429, 1, 'vi', 'plugins/payment/payment', 'payment_method_description', 'Hướng dẫn thanh toán – (Hiển thị ở trang thông báo mua hàng thành công và trang thanh toán)', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2430, 1, 'vi', 'plugins/payment/payment', 'payment_via_cod', 'Thanh toán khi nhận hàng (COD)', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2431, 1, 'vi', 'plugins/payment/payment', 'payment_via_bank_transfer', 'Chuyển khoản qua ngân hàng', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2432, 1, 'vi', 'plugins/payment/payment', 'payment_pending', 'Thực hiện thành công. Thanh toán của bạn đang được xử lý và sẽ được xác nhận bởi nhân viên.', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2433, 1, 'vi', 'plugins/payment/payment', 'created_at', 'Ngày tạo', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2434, 1, 'vi', 'plugins/payment/payment', 'payment_channel', 'Phương thức thanh toán', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2435, 1, 'vi', 'plugins/payment/payment', 'total', 'Tổng cộng', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2436, 1, 'vi', 'plugins/payment/payment', 'status', 'Trạng thái', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2437, 1, 'vi', 'plugins/payment/payment', 'default_payment_method', 'Phương thức thanh toán mặc định', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2438, 1, 'en', 'plugins/testimonial/testimonial', 'name', 'Testimonials', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2439, 1, 'en', 'plugins/testimonial/testimonial', 'create', 'New testimonial', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2440, 1, 'en', 'plugins/testimonial/testimonial', 'edit', 'Edit testimonial', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2441, 1, 'en', 'plugins/testimonial/testimonial', 'company', 'Position/Company', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2442, 1, 'vi', 'plugins/testimonial/testimonial', 'name', 'Nhận xét của khách hàng', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2443, 1, 'vi', 'plugins/testimonial/testimonial', 'create', 'Thêm nhận xét mới', '2021-05-08 21:17:58', '2021-05-08 21:17:58'),
(2444, 1, 'vi', 'plugins/testimonial/testimonial', 'edit', 'Sửa nhận xét', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2445, 1, 'vi', 'plugins/testimonial/testimonial', 'company', 'Chức vụ/Công ty', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2446, 1, 'en', 'plugins/translation/translation', 'translations', 'Translations', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2447, 1, 'en', 'plugins/translation/translation', 'translations_description', 'Translate all words in system.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2448, 1, 'en', 'plugins/translation/translation', 'export_warning', 'Warning, translations are not visible until they are exported back to the resources/lang file, using \'php artisan cms:translations:export\' command or publish button.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2449, 1, 'en', 'plugins/translation/translation', 'import_done', 'Done importing, processed :counter items! Reload this page to refresh the groups!', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2450, 1, 'en', 'plugins/translation/translation', 'translation_manager', 'Translations Manager', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2451, 1, 'en', 'plugins/translation/translation', 'done_publishing', 'Done publishing the translations for group', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2452, 1, 'en', 'plugins/translation/translation', 'append_translation', 'Append new translations', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2453, 1, 'en', 'plugins/translation/translation', 'replace_translation', 'Replace existing translations', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2454, 1, 'en', 'plugins/translation/translation', 'import_group', 'Import group', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2455, 1, 'en', 'plugins/translation/translation', 'confirm_publish_group', 'Are you sure you want to publish the translations group \":group\"? This will overwrite existing language files.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2456, 1, 'en', 'plugins/translation/translation', 'publish_translations', 'Publish translations', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2457, 1, 'en', 'plugins/translation/translation', 'back', 'Back', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2458, 1, 'en', 'plugins/translation/translation', 'edit_title', 'Enter translation', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2459, 1, 'en', 'plugins/translation/translation', 'choose_group_msg', 'Choose a group to display the group translations. If no groups are visible, make sure you have imported the translations.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2460, 1, 'en', 'plugins/translation/translation', 'choose_a_group', 'Choose a group', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2461, 1, 'en', 'plugins/translation/translation', 'locales', 'Locales', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2462, 1, 'en', 'plugins/translation/translation', 'theme-translations', 'Theme translations', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2463, 1, 'en', 'plugins/translation/translation', 'admin-translations', 'Admin translations', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2464, 1, 'en', 'plugins/translation/translation', 'translate_from', 'Translate from', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2465, 1, 'en', 'plugins/translation/translation', 'to', 'to', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2466, 1, 'en', 'plugins/translation/translation', 'no_other_languages', 'No other language to translate!', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2467, 1, 'en', 'plugins/translation/translation', 'edit', 'Edit', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2468, 1, 'en', 'plugins/translation/translation', 'delete', 'Delete', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2469, 1, 'en', 'plugins/translation/translation', 'locale', 'Locale', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2470, 1, 'en', 'plugins/translation/translation', 'locale_placeholder', 'Ex: en', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2471, 1, 'en', 'plugins/translation/translation', 'name', 'Name', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2472, 1, 'en', 'plugins/translation/translation', 'default_locale', 'Default locale?', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2473, 1, 'en', 'plugins/translation/translation', 'actions', 'Actions', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2474, 1, 'en', 'plugins/translation/translation', 'choose_language', 'Choose language', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2475, 1, 'en', 'plugins/translation/translation', 'add_new_language', 'Add new language', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2476, 1, 'en', 'plugins/translation/translation', 'select_language', 'Select language', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2477, 1, 'en', 'plugins/translation/translation', 'flag', 'Flag', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2478, 1, 'en', 'plugins/translation/translation', 'confirm_delete_message', 'Do you really want to delete this locale? It will delete all files/folders for this local in /resources/lang!', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2479, 1, 'en', 'plugins/translation/translation', 'folder_is_not_writeable', 'Cannot write files! Folder /resources/lang is not writable. Please chmod to make it writable!', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2480, 1, 'vi', 'plugins/translation/translation', 'append_translation', 'Tiếp nối bản dịch', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2481, 1, 'vi', 'plugins/translation/translation', 'back', 'Quay lại', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2482, 1, 'vi', 'plugins/translation/translation', 'changed', 'thay đổi', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2483, 1, 'vi', 'plugins/translation/translation', 'choose_a_group', 'Chọn một nhóm', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2484, 1, 'vi', 'plugins/translation/translation', 'choose_group_msg', 'Chọn một nhóm để hiển thị nhóm dịch thuật. Nếu nhóm không có sẵn, hãy chắc chắn là bạn đã chạy migrations và nhập dữ liệu dịch thuật.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2485, 1, 'vi', 'plugins/translation/translation', 'confirm_publish_group', 'Bạn có chắc muốn xuất bản nhóm \":group\"? Điều này sẽ ghi đè tập tin ngôn ngữ hiện tại.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2486, 1, 'vi', 'plugins/translation/translation', 'done_publishing', 'Xuất bản nhóm dịch thuật thành công', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2487, 1, 'vi', 'plugins/translation/translation', 'edit_title', 'Nhập nội dung dịch', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2488, 1, 'vi', 'plugins/translation/translation', 'export_warning', 'Cảnh báo, bản dịch sẽ không có sẵn cho đến khi chúng được xuất bản lại vào thư mục /resources/lang, sử dụng lệnh \'php artisan cms:translations:export\' hoặc sử dụng nút xuất bản', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2489, 1, 'vi', 'plugins/translation/translation', 'import_done', 'Nhập hoàn thành, đã xử lý :counter bản ghi!  ', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2490, 1, 'vi', 'plugins/translation/translation', 'import_group', 'Nhập nhóm', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2491, 1, 'vi', 'plugins/translation/translation', 'publish_translations', 'Xuất bản dịch thuật', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2492, 1, 'vi', 'plugins/translation/translation', 'replace_translation', 'Thay thế bản dịch hiện tại', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2493, 1, 'vi', 'plugins/translation/translation', 'total', 'Tổng cộng', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2494, 1, 'vi', 'plugins/translation/translation', 'translation_manager', 'Quản lý dịch thuật', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2495, 1, 'vi', 'plugins/translation/translation', 'translations', 'Dịch thuật', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2496, 1, 'vi', 'plugins/translation/translation', 'translations_description', 'Dịch tất cả các từ trong hệ thống', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2497, 1, 'vi', 'auth', 'failed', 'Không tìm thấy thông tin đăng nhập hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2498, 1, 'vi', 'auth', 'throttle', 'Đăng nhập không đúng quá nhiều lần. Vui lòng thử lại sau :seconds giây.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2499, 1, 'vi', 'auth', 'password', 'Mật khẩu không chính xác', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2500, 1, 'vi', 'pagination', 'previous', '&laquo; Trước', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2501, 1, 'vi', 'pagination', 'next', 'Sau &raquo;', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2502, 1, 'vi', 'passwords', 'reset', 'Mật khẩu đã được cập nhật!', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2503, 1, 'vi', 'passwords', 'sent', 'Chúng tôi đã gửi cho bạn đường dẫn thay đổi mật khẩu!', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2504, 1, 'vi', 'passwords', 'token', 'Mã xác nhận mật khẩu không hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2505, 1, 'vi', 'passwords', 'user', 'Không tìm thấy thành viên với địa chỉ email này.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2506, 1, 'vi', 'validation', 'accepted', 'Trường :attribute phải được chấp nhận.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2507, 1, 'vi', 'validation', 'active_url', 'Trường :attribute không phải là một URL hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2508, 1, 'vi', 'validation', 'after', 'Trường :attribute phải là một ngày sau ngày :date.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2509, 1, 'vi', 'validation', 'after_or_equal', 'Trường :attribute phải là một ngày sau hoặc bằng ngày :date.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2510, 1, 'vi', 'validation', 'alpha', 'Trường :attribute chỉ có thể chứa các chữ cái.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2511, 1, 'vi', 'validation', 'alpha_dash', 'Trường :attribute chỉ có thể chứa chữ cái, số và dấu gạch ngang.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2512, 1, 'vi', 'validation', 'alpha_num', 'Trường :attribute chỉ có thể chứa chữ cái và số.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2513, 1, 'vi', 'validation', 'array', 'Kiểu dữ liệu của trường :attribute phải là dạng mảng.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2514, 1, 'vi', 'validation', 'before', 'Trường :attribute phải là một ngày trước ngày :date.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2515, 1, 'vi', 'validation', 'before_or_equal', 'Trường :attribute phải là một ngày trước hoặc bằng ngày :date.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2516, 1, 'vi', 'validation', 'between.numeric', 'Trường :attribute phải nằm trong khoảng :min - :max.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2517, 1, 'vi', 'validation', 'between.file', 'Dung lượng tập tin trong trường :attribute phải từ :min - :max kB.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2518, 1, 'vi', 'validation', 'between.string', 'Trường :attribute phải từ :min - :max ký tự.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2519, 1, 'vi', 'validation', 'between.array', 'Trường :attribute phải có từ :min - :max phần tử.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2520, 1, 'vi', 'validation', 'boolean', 'Trường :attribute phải là true hoặc false.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2521, 1, 'vi', 'validation', 'confirmed', 'Giá trị xác nhận trong trường :attribute không khớp.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2522, 1, 'vi', 'validation', 'date', 'Trường :attribute không phải là định dạng của ngày-tháng.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2523, 1, 'vi', 'validation', 'date_equals', 'Trường :attribute phải là một ngày bằng với :date.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2524, 1, 'vi', 'validation', 'date_format', 'Trường :attribute không giống với định dạng :format.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2525, 1, 'vi', 'validation', 'different', 'Trường :attribute và :other phải khác nhau.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2526, 1, 'vi', 'validation', 'digits', 'Độ dài của trường :attribute phải gồm :digits chữ số.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2527, 1, 'vi', 'validation', 'digits_between', 'Độ dài của trường :attribute phải nằm trong khoảng :min and :max chữ số.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2528, 1, 'vi', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2529, 1, 'vi', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2530, 1, 'vi', 'validation', 'email', 'Trường :attribute phải là một địa chỉ email hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2531, 1, 'vi', 'validation', 'ends_with', 'Trường :attribute phải kết thúc bằng một trong những giá trị sau: :values', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2532, 1, 'vi', 'validation', 'exists', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2533, 1, 'vi', 'validation', 'file', 'Trường :attribute phải là một tập tin.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2534, 1, 'vi', 'validation', 'filled', 'Trường :attribute không được bỏ trống.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2535, 1, 'vi', 'validation', 'gt.numeric', 'Trường :attribute phải lớn hơn :max.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2536, 1, 'vi', 'validation', 'gt.file', 'Dung lượng tập tin trong trường :attribute phải lớn hơn :max KB.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2537, 1, 'vi', 'validation', 'gt.string', 'Trường :attribute phải lớn hơn :max ký tự.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2538, 1, 'vi', 'validation', 'gt.array', 'Trường :attribute phải lớn hơn :max phần tử.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2539, 1, 'vi', 'validation', 'gte.numeric', 'Trường :attribute phải lớn hơn hoặc bằng :max.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2540, 1, 'vi', 'validation', 'gte.file', 'Dung lượng tập tin trong trường :attribute phải lớn hơn hoặc bằng :max KB.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2541, 1, 'vi', 'validation', 'gte.string', 'Trường :attribute phải lớn hơn hoặc bằng :max ký tự.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2542, 1, 'vi', 'validation', 'gte.array', 'Trường :attribute phải lớn hơn hoặc bằng :max phần tử.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2543, 1, 'vi', 'validation', 'image', 'Các tập tin trong trường :attribute phải là định dạng hình ảnh.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2544, 1, 'vi', 'validation', 'in', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2545, 1, 'vi', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2546, 1, 'vi', 'validation', 'integer', 'Trường :attribute phải là một số nguyên.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2547, 1, 'vi', 'validation', 'ip', 'Trường :attribute phải là một địa chỉa IP.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2548, 1, 'vi', 'validation', 'ipv4', 'Trường :attribute phải là địa chỉ IPv4 hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2549, 1, 'vi', 'validation', 'ipv6', 'Trường :attribute phải là địa chỉ IPv6 hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2550, 1, 'vi', 'validation', 'json', 'Trường :attribute phải là chuỗi JSON hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2551, 1, 'vi', 'validation', 'lt.numeric', 'Trường :attribute phải nhỏ hơn là :min.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2552, 1, 'vi', 'validation', 'lt.file', 'Dung lượng tập tin trong trường :attribute phải nhỏ hơn :min KB.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2553, 1, 'vi', 'validation', 'lt.string', 'Trường :attribute phải có nhỏ hơn :min ký tự.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2554, 1, 'vi', 'validation', 'lt.array', 'Trường :attribute phải có nhỏ hơn :min phần tử.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2555, 1, 'vi', 'validation', 'lte.numeric', 'Trường :attribute phải nhỏ hơn hoặc bằng là :min.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2556, 1, 'vi', 'validation', 'lte.file', 'Dung lượng tập tin trong trường :attribute phải nhỏ hơn hoặc bằng :min KB.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2557, 1, 'vi', 'validation', 'lte.string', 'Trường :attribute phải có nhỏ hơn hoặc bằng :min ký tự.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2558, 1, 'vi', 'validation', 'lte.array', 'Trường :attribute phải có nhỏ hơn hoặc bằng :min phần tử.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2559, 1, 'vi', 'validation', 'max.numeric', 'Trường :attribute không được lớn hơn :max.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2560, 1, 'vi', 'validation', 'max.file', 'Dung lượng tập tin trong trường :attribute không được lớn hơn :max KB.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2561, 1, 'vi', 'validation', 'max.string', 'Trường :attribute không được lớn hơn :max ký tự.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2562, 1, 'vi', 'validation', 'max.array', 'Trường :attribute không được lớn hơn :max phần tử.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2563, 1, 'vi', 'validation', 'mimes', 'Trường :attribute phải là một tập tin có định dạng: :values.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2564, 1, 'vi', 'validation', 'mimetypes', 'Trường :attribute phải là một tệp có định dạng là: :values.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2565, 1, 'vi', 'validation', 'min.numeric', 'Trường :attribute phải tối thiểu là :min.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2566, 1, 'vi', 'validation', 'min.file', 'Dung lượng tập tin trong trường :attribute phải tối thiểu :min KB.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2567, 1, 'vi', 'validation', 'min.string', 'Trường :attribute phải có tối thiểu :min ký tự.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2568, 1, 'vi', 'validation', 'min.array', 'Trường :attribute phải có tối thiểu :min phần tử.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2569, 1, 'vi', 'validation', 'not_in', 'Giá trị đã chọn trong trường :attribute không hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2570, 1, 'vi', 'validation', 'not_regex', 'Trường :attribute định dạng không hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2571, 1, 'vi', 'validation', 'numeric', 'Trường :attribute phải là một số.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2572, 1, 'vi', 'validation', 'password', 'Mật khẩu không đúng.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2573, 1, 'vi', 'validation', 'present', 'The :attribute field must be present.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2574, 1, 'vi', 'validation', 'regex', 'Định dạng trường :attribute không hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2575, 1, 'vi', 'validation', 'required', 'Trường :attribute không được bỏ trống.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2576, 1, 'vi', 'validation', 'required_if', 'Trường :attribute không được bỏ trống khi trường :other là :value.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2577, 1, 'vi', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2578, 1, 'vi', 'validation', 'required_with', 'Trường :attribute không được bỏ trống khi trường :values có giá trị.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2579, 1, 'vi', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2580, 1, 'vi', 'validation', 'required_without', 'Trường :attribute không được bỏ trống khi trường :values không có giá trị.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2581, 1, 'vi', 'validation', 'required_without_all', 'Trường :attribute không được bỏ trống khi tất cả :values không có giá trị.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2582, 1, 'vi', 'validation', 'same', 'Trường :attribute và :other phải giống nhau.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2583, 1, 'vi', 'validation', 'size.numeric', 'Trường :attribute phải bằng :size.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2584, 1, 'vi', 'validation', 'size.file', 'Dung lượng tập tin trong trường :attribute phải bằng :size kB.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2585, 1, 'vi', 'validation', 'size.string', 'Trường :attribute phải chứa :size ký tự.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2586, 1, 'vi', 'validation', 'size.array', 'Trường :attribute phải chứa :size phần tử.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2587, 1, 'vi', 'validation', 'starts_with', 'Trường :attribute phải được bắt đầu bằng một trong những giá trị sau: :values', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2588, 1, 'vi', 'validation', 'string', 'Trường :attribute phải là một chuỗi.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2589, 1, 'vi', 'validation', 'timezone', 'Trường :attribute phải là một múi giờ hợp lệ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2590, 1, 'vi', 'validation', 'unique', 'Trường :attribute đã có trong hệ thống.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2591, 1, 'vi', 'validation', 'uploaded', 'Trường :attribute không thể tải lên.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2592, 1, 'vi', 'validation', 'url', 'Trường :attribute không giống với định dạng một URL.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2593, 1, 'vi', 'validation', 'uuid', 'Trường :attribute không phải là một chuỗi UUID hợp lẹ.', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2594, 1, 'vi', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2595, 1, 'vi', 'validation', 'attributes.name', 'tên', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2596, 1, 'vi', 'validation', 'attributes.username', 'tên đăng nhập', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2597, 1, 'vi', 'validation', 'attributes.email', 'email', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2598, 1, 'vi', 'validation', 'attributes.first_name', 'tên', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2599, 1, 'vi', 'validation', 'attributes.last_name', 'họ', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2600, 1, 'vi', 'validation', 'attributes.password', 'mật khẩu', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2601, 1, 'vi', 'validation', 'attributes.password_confirmation', 'xác nhận mật khẩu', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2602, 1, 'vi', 'validation', 'attributes.city', 'thành phố', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2603, 1, 'vi', 'validation', 'attributes.country', 'quốc gia', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2604, 1, 'vi', 'validation', 'attributes.address', 'địa chỉ', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2605, 1, 'vi', 'validation', 'attributes.phone', 'số điện thoại', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2606, 1, 'vi', 'validation', 'attributes.mobile', 'di động', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2607, 1, 'vi', 'validation', 'attributes.age', 'tuổi', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2608, 1, 'vi', 'validation', 'attributes.sex', 'giới tính', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2609, 1, 'vi', 'validation', 'attributes.gender', 'giới tính', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2610, 1, 'vi', 'validation', 'attributes.year', 'năm', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2611, 1, 'vi', 'validation', 'attributes.month', 'tháng', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2612, 1, 'vi', 'validation', 'attributes.day', 'ngày', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2613, 1, 'vi', 'validation', 'attributes.hour', 'giờ', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2614, 1, 'vi', 'validation', 'attributes.minute', 'phút', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2615, 1, 'vi', 'validation', 'attributes.second', 'giây', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2616, 1, 'vi', 'validation', 'attributes.title', 'tiêu đề', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2617, 1, 'vi', 'validation', 'attributes.content', 'nội dung', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2618, 1, 'vi', 'validation', 'attributes.body', 'nội dung', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2619, 1, 'vi', 'validation', 'attributes.description', 'mô tả', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2620, 1, 'vi', 'validation', 'attributes.excerpt', 'trích dẫn', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2621, 1, 'vi', 'validation', 'attributes.date', 'ngày', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2622, 1, 'vi', 'validation', 'attributes.time', 'thời gian', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2623, 1, 'vi', 'validation', 'attributes.subject', 'tiêu đề', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2624, 1, 'vi', 'validation', 'attributes.message', 'lời nhắn', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2625, 1, 'vi', 'validation', 'attributes.available', 'có sẵn', '2021-05-08 21:17:59', '2021-05-08 21:17:59'),
(2626, 1, 'vi', 'validation', 'attributes.size', 'kích thước', '2021-05-08 21:17:59', '2021-05-08 21:17:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` int(10) UNSIGNED DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT 0,
  `manage_supers` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `permissions`, `last_login`, `first_name`, `last_name`, `username`, `avatar_id`, `super_user`, `manage_supers`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`) VALUES
(1, 'admin@botble.com', NULL, '$2y$10$Zz8AkwNWHNaMb7XjQhY0o.ihRqVbw1ldVVmWWMM/yWjKdafHZJXJ6', 'kdppcoRxNRaUV0D1GpdCJkkW0KjQ0u13wVzkNvbTGWzLhJz9GMWXhl8Fshfx', '2021-01-05 03:29:59', '2024-08-16 23:58:30', NULL, '2024-08-16 23:58:30', 'System', 'Admin', 'botble', 184, 1, 1, NULL, NULL, NULL, NULL),
(2, 'admin1@gmail.com', NULL, '$2y$10$Wh2SdC/gj2otEg2pt0i7zOpLn3mD1U3WMGe7OVwrOi9//q6cgROpK', NULL, '2024-08-17 01:22:08', '2024-08-17 01:23:26', NULL, NULL, 'Superadmin', 'nabil', 'superadmin', NULL, 1, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE `user_meta` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `widget_id`, `sidebar_id`, `theme`, `position`, `data`, `created_at`, `updated_at`) VALUES
(2, 'CustomMenuWidget', 'footer_sidebar', 'miranda', 0, '{\"id\":\"CustomMenuWidget\",\"name\":\"Services.\",\"menu_id\":\"services\"}', '2020-09-03 07:39:40', '2020-09-03 07:39:40'),
(19, 'RecentPostsWidget', 'primary_sidebar', 'miranda', 0, '{\"id\":\"RecentPostsWidget\",\"name\":\"Recent posts\",\"number_display\":\"5\"}', '2020-09-04 07:00:46', '2020-09-04 07:00:46'),
(20, 'BlogCategoriesWidget', 'primary_sidebar', 'miranda', 1, '{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\",\"number_display\":\"5\"}', '2020-09-04 07:00:46', '2020-09-04 07:00:46'),
(21, 'BlogTagsWidget', 'primary_sidebar', 'miranda', 2, '{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\",\"number_display\":\"5\"}', '2020-09-04 07:00:46', '2020-09-04 07:00:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activations`
--
ALTER TABLE `activations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activations_user_id_index` (`user_id`);

--
-- Indexes for table `audit_histories`
--
ALTER TABLE `audit_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_histories_user_id_index` (`user_id`),
  ADD KEY `audit_histories_module_index` (`module`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_replies`
--
ALTER TABLE `contact_replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  ADD KEY `dashboard_widget_settings_widget_id_index` (`widget_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_index` (`user_id`);

--
-- Indexes for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_meta_content_id_index` (`reference_id`);

--
-- Indexes for table `ht_amenities`
--
ALTER TABLE `ht_amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_bookings`
--
ALTER TABLE `ht_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_booking_addresses`
--
ALTER TABLE `ht_booking_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_booking_rooms`
--
ALTER TABLE `ht_booking_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_booking_services`
--
ALTER TABLE `ht_booking_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_currencies`
--
ALTER TABLE `ht_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_customers`
--
ALTER TABLE `ht_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ht_customers_email_unique` (`email`);

--
-- Indexes for table `ht_features`
--
ALTER TABLE `ht_features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_foods`
--
ALTER TABLE `ht_foods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_food_types`
--
ALTER TABLE `ht_food_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_places`
--
ALTER TABLE `ht_places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_rooms`
--
ALTER TABLE `ht_rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ht_rooms_name_unique` (`name`);

--
-- Indexes for table `ht_rooms_amenities`
--
ALTER TABLE `ht_rooms_amenities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ht_rooms_amenities_amenity_id_index` (`amenity_id`),
  ADD KEY `ht_rooms_amenities_room_id_index` (`room_id`);

--
-- Indexes for table `ht_room_categories`
--
ALTER TABLE `ht_room_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_room_dates`
--
ALTER TABLE `ht_room_dates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_services`
--
ALTER TABLE `ht_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ht_taxes`
--
ALTER TABLE `ht_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_files_user_id_index` (`user_id`);

--
-- Indexes for table `media_folders`
--
ALTER TABLE `media_folders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_folders_user_id_index` (`user_id`);

--
-- Indexes for table `media_settings`
--
ALTER TABLE `media_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_nodes_menu_id_index` (`menu_id`),
  ADD KEY `menu_nodes_parent_id_index` (`parent_id`),
  ADD KEY `menu_nodes_related_id_index` (`reference_id`);

--
-- Indexes for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_boxes_content_id_index` (`reference_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD KEY `roles_created_by_index` (`created_by`),
  ADD KEY `roles_updated_by_index` (`updated_by`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_users_user_id_index` (`user_id`),
  ADD KEY `role_users_role_id_index` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `slugs`
--
ALTER TABLE `slugs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_meta_user_id_index` (`user_id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activations`
--
ALTER TABLE `activations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `audit_histories`
--
ALTER TABLE `audit_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contact_replies`
--
ALTER TABLE `contact_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `dashboard_widget_settings`
--
ALTER TABLE `dashboard_widget_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gallery_meta`
--
ALTER TABLE `gallery_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `ht_amenities`
--
ALTER TABLE `ht_amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ht_bookings`
--
ALTER TABLE `ht_bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ht_booking_addresses`
--
ALTER TABLE `ht_booking_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ht_booking_rooms`
--
ALTER TABLE `ht_booking_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ht_booking_services`
--
ALTER TABLE `ht_booking_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `ht_currencies`
--
ALTER TABLE `ht_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ht_customers`
--
ALTER TABLE `ht_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ht_features`
--
ALTER TABLE `ht_features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ht_foods`
--
ALTER TABLE `ht_foods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ht_food_types`
--
ALTER TABLE `ht_food_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ht_places`
--
ALTER TABLE `ht_places`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ht_rooms`
--
ALTER TABLE `ht_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ht_rooms_amenities`
--
ALTER TABLE `ht_rooms_amenities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `ht_room_categories`
--
ALTER TABLE `ht_room_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ht_room_dates`
--
ALTER TABLE `ht_room_dates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ht_services`
--
ALTER TABLE `ht_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ht_taxes`
--
ALTER TABLE `ht_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `media_folders`
--
ALTER TABLE `media_folders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `media_settings`
--
ALTER TABLE `media_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_nodes`
--
ALTER TABLE `menu_nodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `meta_boxes`
--
ALTER TABLE `meta_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `slugs`
--
ALTER TABLE `slugs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=428;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2627;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
