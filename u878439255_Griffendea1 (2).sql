-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 05, 2025 at 10:07 PM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u878439255_Griffendea1`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appointment_id` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `calendar_id` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT NULL,
  `appointment_status` varchar(255) DEFAULT NULL,
  `users` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `contact_id` varchar(255) DEFAULT NULL,
  `assigned_user_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_details`
--

CREATE TABLE `business_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `custom_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`custom_values`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `calendars`
--

CREATE TABLE `calendars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `calendar_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calendar_name` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_locations`
--

CREATE TABLE `company_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` varchar(255) NOT NULL,
  `company_id` varchar(255) NOT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `location_email` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `dnd` tinyint(1) DEFAULT NULL,
  `custom_fields` text DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `contact_id`, `location_id`, `name`, `email`, `phone`, `state`, `country`, `city`, `source`, `type`, `company`, `assigned_to`, `tags`, `dnd`, `custom_fields`, `date_added`, `date_updated`, `date_of_birth`, `company_id`, `postal_code`, `created_at`, `updated_at`) VALUES
(2, '1fb3cPh7qErFwunAwxJI', 'kiRfOKDyVWVbujuWVIdV', 'Roy James', 'royscarsalon@yahoo.com', '+14095994045', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3102First ave south Texas city Texas 77590, Texas, 77590\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Commercial\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-09 06:57:03', '2025-10-22 21:40:37', NULL, NULL, NULL, '2025-10-22 21:40:39', '2025-11-05 03:54:55'),
(3, 'PlGgUNM0R6zqvjqparQj', 'kiRfOKDyVWVbujuWVIdV', 'robert weed', 'weedrobert906@gmail.com', '+12177304639', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"932 Maple St. Carrollton, IL 62016, USA, IL, 62016\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-23 00:53:45', '2025-10-23 00:53:49', NULL, NULL, NULL, '2025-10-23 00:53:47', '2025-10-29 17:47:01'),
(4, 'aClH48WDSaWoC9wzjLbJ', 'kiRfOKDyVWVbujuWVIdV', 'Teri hancock', 'terihancock@msn.com', '+13039132773', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"6100 Bear Paw Rd, Golden, CO 80403, USA, CO, 80403\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-23 12:27:04', '2025-10-23 12:27:07', NULL, NULL, NULL, '2025-10-23 12:27:06', '2025-11-05 03:54:55'),
(5, 'uU0HMQoUktqm2WWXfG96', 'kiRfOKDyVWVbujuWVIdV', 'patricia wynn', 'pwynn1stplace@gmail.com', '+14049035706', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"430 Mary Erna Dr, GA, 30213\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-23 12:34:34', '2025-10-23 13:14:50', NULL, NULL, NULL, '2025-10-23 12:34:36', '2025-10-29 17:47:01'),
(6, '8Pxc4GKFD2kv9MC3whnb', 'kiRfOKDyVWVbujuWVIdV', 'I\'m Jess yates Yates', 'estatetrader@yahoo.com', '+19102329791', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1812 So-Hi Dr, Durham, NC 27703, USA, NC, 27703\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Tired Landlord\\\"}]\"', '2025-05-20 10:33:41', '2025-10-23 12:48:50', NULL, NULL, NULL, '2025-10-23 12:48:49', '2025-11-05 03:54:55'),
(7, 'iQK1rEKmhjDg9tERNy9z', 'kiRfOKDyVWVbujuWVIdV', 'diane salahuddin', 'dcsalahuddin12@gmail.com', '+12404415349', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"15406 Lady Lauren Ln, Brandywine, MD 20613, USA, MD, 20613\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-23 13:33:24', '2025-10-28 16:31:14', NULL, NULL, NULL, '2025-10-23 13:33:26', '2025-10-29 17:47:01'),
(8, 'aCCj1RMZZFRj9GgPnXLj', 'kiRfOKDyVWVbujuWVIdV', 'adrian johnson', 'afoundations24@outlook.com', '+14145505783', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2931 N 29th St, Milwaukee, WI 53210, USA, WI, 53210\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-23 13:57:48', '2025-10-23 13:57:51', NULL, NULL, NULL, '2025-10-23 13:57:49', '2025-10-29 17:47:01'),
(9, 'VbESR4nD4ypeCOdm6fwH', 'kiRfOKDyVWVbujuWVIdV', 'Keshya Boudreaux', 'keshyaboudreaux@aol.com', '+12485049665', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"19731 Hayes Ct, Northville, MI 48167, USA, MI, 48167\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-23 14:54:57', '2025-10-23 14:55:01', NULL, NULL, NULL, '2025-10-23 14:55:02', '2025-11-05 03:54:55'),
(10, 'SMv0Ys3J89hCwbDB7J1n', 'kiRfOKDyVWVbujuWVIdV', 'Bernetta Smiley', 'kysberlynn@gmail.com', '+13177464801', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"12092 Promenade Ave, Detroit, MI 48213, USA, MI, 48213\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Too Many Repairs\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-23 17:20:15', '2025-10-23 17:20:40', NULL, NULL, NULL, '2025-10-23 17:20:19', '2025-11-05 03:54:55'),
(11, '18N08oda7OtesmWqwrvu', 'kiRfOKDyVWVbujuWVIdV', 'Leonard Stafford', 'leonardstafford63@gmail.com', '+13048907220', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"106 Circleview Dr, Beckley, WV 25801, USA, WV, 25801\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-23 17:21:48', '2025-10-23 17:28:10', NULL, NULL, NULL, '2025-10-23 17:21:53', '2025-11-05 03:54:56'),
(12, 'sRn2SYs5Kdg8dgAmxdbc', 'kiRfOKDyVWVbujuWVIdV', 'wendell bryant', 'gamechangerent82@gmail.com', '+13144819728', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2401 Delmar Ave, Granite City, IL 62040, USA, IL, 62040\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Commercial\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-23 17:31:33', '2025-10-23 17:31:38', NULL, NULL, NULL, '2025-10-23 17:31:36', '2025-10-29 17:47:01'),
(13, 'QsBsCPu8TSICGzhXkKhm', 'kiRfOKDyVWVbujuWVIdV', 'Scott Estep', 'casaverdenrg@gmail.com', '+15054161946', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"62 Tomas H Romero Rd, Ranchos De Taos, NM 87557, USA, NM, 87557\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-23 18:19:41', '2025-10-24 14:27:48', NULL, NULL, NULL, '2025-10-23 18:19:44', '2025-10-31 17:04:22'),
(14, 'LU1mLkSJRHPv0ievv9Xz', 'kiRfOKDyVWVbujuWVIdV', 'jo childress', 'pennix@bellsouth.net', '+15029317298', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1704 Stratton Ct, Louisville, KY 40211, USA, KY, 40211\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-03 02:56:47', '2025-10-23 18:29:50', NULL, NULL, NULL, '2025-10-23 18:29:52', '2025-10-29 17:47:01'),
(15, '1P0TO9vkHyRmSALsyncS', 'kiRfOKDyVWVbujuWVIdV', 'Joel Taylor', 'moorerandil1178@gmail.com', '+18019402720', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1163 Rushton St, Ogden, UT 84401, USA, UT, 84401\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-23 19:35:37', '2025-10-23 19:35:40', NULL, NULL, NULL, '2025-10-23 19:35:39', '2025-11-05 03:54:56'),
(16, '5CHn4UErmlU24y2W4IoL', 'kiRfOKDyVWVbujuWVIdV', 'heather keisker', 'hkeisker77@gmail.com', '+14173402584', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2131 N Park Ave, Springfield, MO 65803, USA, MO, 65803\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-23 19:51:52', '2025-10-23 19:51:56', NULL, NULL, NULL, '2025-10-23 19:51:54', '2025-10-29 17:47:01'),
(17, 'cGOR8poGdBs6igPz63Y7', 'kiRfOKDyVWVbujuWVIdV', 'Anita Spence', 'a.spence@deltacounseling.org', '+18707236192', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"270 Avery Rd, Monticello, AR 71655, USA, AR, 71655\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-23 22:39:26', '2025-10-23 22:39:32', NULL, NULL, NULL, '2025-10-23 22:39:28', '2025-11-05 03:54:55'),
(18, 'xQNZGLD8MRqR1EqWAHMa', 'kiRfOKDyVWVbujuWVIdV', 'Jim Gormley', 'james.gormley5@gmail.com', '+18598064434', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"204 S Hanover Ave, Lexington, KY 40502, USA, KY, 40502\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-18 01:34:22', '2025-10-24 18:01:02', NULL, NULL, NULL, '2025-10-24 17:58:08', '2025-11-05 03:54:56'),
(19, 'KwcJqAvBkIx5WmbOlyEk', 'kiRfOKDyVWVbujuWVIdV', 'ruth lewis lay', 'llay@smyrnaga.gov', '+16785168001', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2103 Taylor Meadows Way, Marietta, GA 30008, USA, GA, 30008\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-24 18:25:46', '2025-10-24 18:25:46', NULL, NULL, NULL, '2025-10-24 18:25:49', '2025-10-29 17:47:01'),
(20, 'Wyu8YaFQG6omuxQeqUW6', 'kiRfOKDyVWVbujuWVIdV', 'James Williams', 'jcwtrip@gmail.com', '+13149330091', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"309 W Arlee Ave, MO, 63125-2714\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-09 12:21:32', '2025-10-25 00:21:16', NULL, NULL, NULL, '2025-10-25 00:21:18', '2025-11-05 03:54:56'),
(21, '9pjRFEUTyTJRaW3zaAC0', 'kiRfOKDyVWVbujuWVIdV', 'Bret Wright', 'bretsr1970@gmail.com', '+17082960756', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"253 W Country Ct, Bourbonnais, IL 60914, USA, IL, 60914\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-27 12:55:49', '2025-10-27 12:55:53', NULL, NULL, NULL, '2025-10-27 12:55:52', '2025-11-05 03:54:55'),
(22, 'STAc0HCFs0E8uPzkkvxt', 'kiRfOKDyVWVbujuWVIdV', 'Tamara Ricks', 'tinaturnertammy@gmail.com', '+19372418192', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3617 hwy 80 East, vicksburg mississippi 39180, Mississippi, 39180\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-27 12:57:39', '2025-10-27 12:57:43', NULL, NULL, NULL, '2025-10-27 12:57:41', '2025-11-05 03:54:55'),
(23, 'aAS7qsx5ESBFFpoGUAyp', 'kiRfOKDyVWVbujuWVIdV', 'dion slade', 'sladeabc@gmail.com', '+19147207700', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"414 E 5th St, Mt Vernon, NY 10553, USA, NY, 10553\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Tired Landlord\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-27 17:02:47', '2025-10-27 17:04:21', NULL, NULL, NULL, '2025-10-27 17:02:51', '2025-10-29 17:47:01'),
(24, '3D7Ob6T1UcpCcoCfnTdS', 'kiRfOKDyVWVbujuWVIdV', 'larry dusenbury !', 'uladyhaz@gmail.com', '+19127025709', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"111 Paradise Marsh Cir, GA, 31525-2139\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-27 17:59:33', '2025-10-27 17:59:33', NULL, NULL, NULL, '2025-10-27 17:59:36', '2025-10-29 17:47:01'),
(25, 'djNWGZuPbaIUdW4H9QUj', 'kiRfOKDyVWVbujuWVIdV', 'cheryle edwards-fowler', 'edwardscheryle@yahoo.com', '+19362343981', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"102 Piney Pt Ct, Wallisville, TX 77597, USA, Anahuac,Tx, 77514\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-01 04:49:37', '2025-10-27 18:33:23', NULL, NULL, NULL, '2025-10-27 18:33:26', '2025-10-29 17:47:01'),
(26, '93i6ETrMtdo8o5kiLVOm', 'kiRfOKDyVWVbujuWVIdV', 'David Popp', 'davidpopp715@gmail.com', '+7244130245', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"327 E Main St, Smithville, MO 64089, USA, MO, 64089\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-27 19:21:17', '2025-10-27 19:21:20', NULL, NULL, NULL, '2025-10-27 19:21:19', '2025-11-05 03:54:56'),
(27, '87pY48POZtU0RomIezIb', 'kiRfOKDyVWVbujuWVIdV', 'brenda edwards', 'brendaproctoredwards@gmail.com', '+19104906521', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3426 Surry Ln, Goldsboro, NC 27530, USA, NC, 27530\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Tired Landlord\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-28 12:56:02', '2025-10-28 12:56:06', NULL, NULL, NULL, '2025-10-28 12:56:05', '2025-10-29 17:47:01'),
(28, 'MoUp8a5M37HiI7isOhmh', 'kiRfOKDyVWVbujuWVIdV', 'Steve DeZell', 'sdezell5575@gmail.com', '+17138062904', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"414 Farm to Market Rd 2827, Warren, TX 77664, USA, TX, 77664\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-28 13:18:25', '2025-10-28 13:18:28', NULL, NULL, NULL, '2025-10-28 13:18:28', '2025-11-05 03:54:56'),
(29, 'cj7VEVCYKLBggh9c2XDX', 'kiRfOKDyVWVbujuWVIdV', 'Harold McGruther', 'pappysoo@aol.com', '+13528174950', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"8845 NW 130th St, Reddick, FL 32686, USA, FL, 32686\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-09 11:28:58', '2025-10-28 13:27:00', NULL, NULL, NULL, '2025-10-28 13:27:02', '2025-10-30 12:58:44'),
(30, 'MnIXuQ9BJWIsNJKJYcjT', 'kiRfOKDyVWVbujuWVIdV', 'Gloria Campoalegre', 'gloriacampoalegre@gmail.com', '+13053004152', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"20381 NE 30th Ave, Aventura, FL 33180, USA, FL, 33180\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-28 14:02:48', '2025-10-28 14:02:48', NULL, NULL, NULL, '2025-10-28 14:02:50', '2025-11-04 23:21:44'),
(31, 'SFTz4hlrAMf3X4hEM4yZ', 'kiRfOKDyVWVbujuWVIdV', 'Sheena Guidry', 'shnguidry@aol.com', '+12282653608', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"18247 Cardinal Ln, Gulfport, MS 39503, USA, MS, 39503\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-28 23:42:16', '2025-10-28 23:42:20', NULL, NULL, NULL, '2025-10-28 23:42:19', '2025-11-05 03:54:56'),
(32, 'Ss85AnYLjw44HvYzn5qG', 'kiRfOKDyVWVbujuWVIdV', 'elsie flores', 'flores_elvira46@yahoo.com', '+19196330287', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"104 Williams St, Princeville, NC 27886, USA, NC, 27886\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-29 12:33:25', '2025-10-29 12:33:25', NULL, NULL, NULL, '2025-10-29 12:33:27', '2025-10-29 17:47:01'),
(33, 'GmuJyQSeTZh5c8Lkbknk', 'kiRfOKDyVWVbujuWVIdV', 'melissa vest', 'wyattelsa77@gmail.com', '+15708467891', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"30 Decker Ct, Harford, PA 18823, USA, PA, 18823\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-29 12:43:47', '2025-10-29 12:43:52', NULL, NULL, NULL, '2025-10-29 12:43:51', '2025-10-29 17:47:01'),
(34, 'g8F6iMRGeerpfzegH7UF', 'kiRfOKDyVWVbujuWVIdV', 'ralph persuhn', 'mrwaterjet@gmail.com', '+13308423830', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"150 Charles Ct, Newton Falls, OH 44444, USA, OH, 44444\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-29 13:05:55', '2025-10-29 13:06:28', NULL, NULL, NULL, '2025-10-29 13:07:30', '2025-10-29 17:47:01'),
(35, 'D0NkAQ2UJUd8v4VwEP3I', 'kiRfOKDyVWVbujuWVIdV', 'Anna Brown', 'annambrown59@yahoo.com', '+18506374746', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4736 Richardson Rd, Molino, FL 32577, USA, FL, 32577\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-11 09:34:42', '2025-10-29 13:06:49', NULL, NULL, NULL, '2025-10-29 13:08:03', '2025-11-05 03:54:56'),
(36, 'odPfKiqu3wPQBWQxmKOn', 'kiRfOKDyVWVbujuWVIdV', 'marisa moerland', 'superitmom65@hotmail.com', '+19049947865', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1148 Candlebark Dr, Jacksonville, FL 32225, USA, FL, 32225\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-29 13:11:18', '2025-10-29 13:13:09', NULL, NULL, NULL, '2025-10-29 13:12:49', '2025-10-29 17:47:01'),
(37, '4pfktmhydmeiPVycxwJC', 'kiRfOKDyVWVbujuWVIdV', 'Penny Scott', 'pennyjscott62@gmail.com', '+16073764516', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"Pennyjscott62@gmail.com, NY, 13839\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-29 13:59:49', '2025-10-29 13:59:52', NULL, NULL, NULL, '2025-10-29 13:59:51', '2025-11-05 03:54:56'),
(38, 'V1wRMuYIIr5g2kirCiE2', 'kiRfOKDyVWVbujuWVIdV', 'Adua Verona', '917kennedy07002@gmail.com', '+12124610187', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"830 Avenue A, Bayonne, NJ 07002, USA, NJ, 07002\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 00:57:28', '2025-10-29 16:54:50', NULL, NULL, NULL, '2025-10-29 16:42:03', '2025-11-05 03:54:56'),
(39, 'lvMMHJNwDgzhOMKpyniB', 'kiRfOKDyVWVbujuWVIdV', 'donna mooradian', 'donnamooradian315@gmail.com', '+13136700149', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"15151 Pennsylvania Ave, Michigan, 48101-3700\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-22 19:52:13', '2025-10-22 19:52:13', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(40, 'VNGSzxwS37TizuGWwZbO', 'kiRfOKDyVWVbujuWVIdV', 'Rita Nugent', 'ryevanslegal@gmail.com', '+13185022096', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"173 Tucker St, Columbia, LA 71418, USA, LA, 71418\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-22 18:52:06', '2025-10-22 18:52:10', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(41, 'dbh92bp52X5IrIGaaVmn', 'kiRfOKDyVWVbujuWVIdV', 'Mchelle Goldsborough', 'mlgoldsborough@yahoo.com', '+15512320677', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"15567 Corona Del Mar Drive Wimauma, Fl, 33598\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-22 18:47:56', '2025-10-22 18:48:00', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(42, 'YgxGQBtS6X1SLf533gTV', 'kiRfOKDyVWVbujuWVIdV', 'douglas leaman', '1debraleaman@gmail.com', '+19788575093', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"721 Blossom Street, MA, 01420\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-22 18:24:30', '2025-10-22 18:24:30', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(43, '7Wu9DbQ2TBOLQHtmPwpx', 'kiRfOKDyVWVbujuWVIdV', 'Elizabeth Carver', 'ecarver2757@aol.com', '+18174955800', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"152 Richard Lane, Texas, 76020\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-22 17:44:55', '2025-10-22 17:44:59', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(44, 'QQrceCafQr6AKxzNbkYY', 'kiRfOKDyVWVbujuWVIdV', 'Willard Terry', 'willttau@yahoo.com', '+17708710623', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"6280 New Mill Trail, GA, 30102-1669\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-22 17:32:28', '2025-10-22 17:32:31', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(45, 'spwEKdrJxY19Cd0bhZ12', 'kiRfOKDyVWVbujuWVIdV', 'lora kimbrough-carpenter', 'kimbroughn07@gmail.com', '+12316424561', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1159 Pine Street, MI, 49442\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-22 16:56:41', '2025-10-22 16:56:41', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(46, 'fSI4r7SGBfwcwZIhkd1A', 'kiRfOKDyVWVbujuWVIdV', 'Brandon Reed', 'trojanram55@yahoo.com', '+12185763495', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"554 Pine Ridge, WI, 54021\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-22 16:08:30', '2025-10-25 17:26:01', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(47, 'IRsIVGw7yI6nWJGwvwZM', 'kiRfOKDyVWVbujuWVIdV', 'Debra Marshall', 'tiffanymarshall64@yahoo.com', '+13138174883', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"6009 McClellan, Michigan, 48213\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-22 15:45:51', '2025-10-22 15:45:56', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(48, '9ExAZO6EHFc9Sc4D4HtV', 'kiRfOKDyVWVbujuWVIdV', 'donna mcgee', 'donnaraemm@gmail.com', '+16509967160', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"donnaraemm@gmail.com, NY, 12065\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-22 13:23:00', '2025-10-22 13:23:00', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(49, '518aDUuwcYGvttl4miK4', 'kiRfOKDyVWVbujuWVIdV', 'albert roseboro', 'roseboroalbert3@gmail.com', '+17044199481', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2127cleveland Ave Grover, NC, 28073\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Too Many Repairs\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-22 12:39:24', '2025-10-22 12:39:24', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(50, '4MO0h94I4OA1QI24u8Ch', 'kiRfOKDyVWVbujuWVIdV', 'jackie reffitt', 'jackiereffitt@gmail.com', '+13212134938', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"10067 sw 81st ave, Fl, 34481\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-22 12:38:51', '2025-10-22 12:40:06', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(51, 'q235BYfI3YG4jApwSELV', 'kiRfOKDyVWVbujuWVIdV', 'John Watson', 'jpriestcollector17@gmail.com', '+18149370767', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1429 Everett rd, East Freedom, PA, 16637-8703\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-20 20:00:17', '2025-10-21 18:09:11', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(52, 'mw6ZffHBM9kSOPdNUft1', 'kiRfOKDyVWVbujuWVIdV', 'test 2', 'no-email-mw6ZffHBM9kSOPdNUft1', NULL, NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, NULL, '2025-10-19 08:35:28', '2025-10-19 08:35:30', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(53, '4KcTUhXzWzkZKbP1iZJK', 'kiRfOKDyVWVbujuWVIdV', 'test', 'no-email-4KcTUhXzWzkZKbP1iZJK', NULL, NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, NULL, '2025-10-19 08:34:54', '2025-10-19 08:34:55', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(54, '8m5LacbxY9nIpFjdS7aw', 'kiRfOKDyVWVbujuWVIdV', 'Charles Jennings', 'charlesjennings412@gmail.com', '+13862091319', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"12434 237th rd live oak, FL, 32060\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"}]\"', '2025-10-18 15:15:36', '2025-10-18 15:15:43', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(55, 'kKNnCt1Ms1Ru7b6jSsUs', 'kiRfOKDyVWVbujuWVIdV', 'devonna mccraw', 'devonnalm2469@gmail.com', '+13136516254', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"16250 Ardmore, Detroit, 48219\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"}]\"', '2025-10-18 11:52:47', '2025-10-18 11:52:49', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(56, '6NGpV8kAs5nEZsZ5s1K6', 'kiRfOKDyVWVbujuWVIdV', 'Jennifer Giesy', 'jennshicks@gmail.com', '+14236679693', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7238 Sims Road, TN, 37341-7942\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-18 00:12:29', '2025-10-20 18:10:29', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(57, 'vePBZznP5OKpBSuGeLOX', 'kiRfOKDyVWVbujuWVIdV', 'cathy satcher', 'maesurrett@gmail.com', '+15704921712', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"410 w spruce st, PA, 17872\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-17 20:53:48', '2025-10-17 20:53:48', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(58, 'kvrTxxZIGOd2dp37oHcP', 'kiRfOKDyVWVbujuWVIdV', 'Jeffrey Cunningham', 'lilbutchie8@gmail.com', '+19375143705', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"419kercher st, Oh, 45342\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-17 14:12:00', '2025-10-17 14:12:05', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(59, '3q0bQfyXJscq4JhDykGw', 'kiRfOKDyVWVbujuWVIdV', 'Walter Mitchum', 'mitchumdanny@gmail.com', '+17069108493', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4483 fulcher Road hephzibah ga, Georgia, 30815\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Tired Landlord\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-17 02:49:18', '2025-10-17 02:49:21', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(60, 'VjvPkbxD6HqiTBQjBUH2', 'kiRfOKDyVWVbujuWVIdV', 'ernest martinez', 'bigernie1111@yahoo.com', NULL, NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"108 Pennsylvania ave, TX, 77904\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-16 23:04:37', '2025-10-16 23:04:37', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(61, 'JjXSRmakbRiEGHLXJn7S', 'kiRfOKDyVWVbujuWVIdV', 'holly jewell', 'hollyjewell84@gmail.com', '+15173430966', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"205 S Ardmore ln, Mi, 49201\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Land\\\\\\/Lot\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"ddzBhdrxmdnrMAbZozAr\\\",\\\"value\\\":\\\"000-09-34-479-004-00\\\"}]\"', '2025-10-16 20:58:16', '2025-10-16 20:58:19', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(62, 'YfyIJivsNhp4yNOJMP6T', 'kiRfOKDyVWVbujuWVIdV', 'Robin Hodgeman', '2shantail@gmail.com', '+19282630314', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"Plot 261, Kingman, 96409\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Land\\\\\\/Lot\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"ddzBhdrxmdnrMAbZozAr\\\",\\\"value\\\":\\\"313-06-261\\\"}]\"', '2025-10-16 20:43:48', '2025-10-16 20:43:56', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(63, 'cJk1C3UcP7fCzLlzynoh', 'kiRfOKDyVWVbujuWVIdV', 'lakresha ellis', 'lakreshaellis143@gmail.com', '+12523999092', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2406 kauffman Court East Wilson, NC, 27893\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-16 19:20:45', '2025-10-16 20:36:55', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(64, 'ZAkPbptpDGn8OYGSI7Nf', 'kiRfOKDyVWVbujuWVIdV', 'Larry Phillips', 'phillipslarryf@gmail.com', '+17089490642', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1030 key largo Dr Romeoville, IL, 60446\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-16 19:07:32', '2025-10-16 19:07:35', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(65, '48yKqEy5MwCC9KmUl7I1', 'kiRfOKDyVWVbujuWVIdV', 'dileatha washington', 'dileathawashington@gmail.com', '+18034135284', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"119 Howell St., South Carolina, 29488\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-16 15:27:32', '2025-10-16 15:27:36', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01');
INSERT INTO `contacts` (`id`, `contact_id`, `location_id`, `name`, `email`, `phone`, `state`, `country`, `city`, `source`, `type`, `company`, `assigned_to`, `tags`, `dnd`, `custom_fields`, `date_added`, `date_updated`, `date_of_birth`, `company_id`, `postal_code`, `created_at`, `updated_at`) VALUES
(66, 'hm68OUTZMtp3itKC2qbK', 'kiRfOKDyVWVbujuWVIdV', 'norman meyerhoff', 'hank41018@yahoo.com', '+18599993366', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3239 Riggs Avenue, KY, 41018-1411\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-16 15:25:37', '2025-10-16 15:25:37', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(67, 'DeLGCuyK1lFYnANNXQLF', 'kiRfOKDyVWVbujuWVIdV', 'shawn woodby', 'swoodby1967@gmail.com', '+14104767410', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"518 S Bond Street, Maryland, 21231\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-16 12:42:54', '2025-10-16 12:42:57', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(68, 't20KV93zimMA0aw4iziD', 'kiRfOKDyVWVbujuWVIdV', 'Tony Crum', NULL, '+18636040929', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"6965. State. Road. 37. South, FL, 33860\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-16 10:46:38', '2025-10-16 10:46:42', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(69, 'bNlse3NgUUaqVYY7Ko90', 'kiRfOKDyVWVbujuWVIdV', 'Ronald Miller', 'millerronnie088@gmail.com', '+12545001966', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2906 Taft St, TX, 76543-4931\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-16 08:45:14', '2025-10-16 08:45:23', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(70, 'F8olo06NOlxVFxOMkLyZ', 'kiRfOKDyVWVbujuWVIdV', 'brian robinson', 'bornbadbam@gmail.com', '+18032909642', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2878 dragstrip Road, North, Sc, 29112\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-16 05:29:03', '2025-10-16 05:29:07', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(71, 'Ki5EgzSiYGVxHYmOVz7p', 'kiRfOKDyVWVbujuWVIdV', 'Ronnie Holcombe', 'holcomberonnie69@gmail.com', '+18302638511', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1417fm1116, Tx, 78629\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Too Many Repairs\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-16 04:41:36', '2025-10-23 03:41:26', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(72, 'ez5kjvDj2B4lHgCsKzlF', 'kiRfOKDyVWVbujuWVIdV', 'Eddie McEwen', 'marycarothers73@gmail.com', '+16628320034', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"105 gator road oxford, Mississippi, 38655\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Land\\\\\\/Lot\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"ddzBhdrxmdnrMAbZozAr\\\",\\\"value\\\":\\\"147X-26-003.00\\\"}]\"', '2025-10-16 04:32:19', '2025-10-16 04:32:23', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(73, 'psFShC8xrve6md2rxzPM', 'kiRfOKDyVWVbujuWVIdV', 'marcia glover', 'kysmimi11@gmail.com', '+18032959338', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"600 Old Whiskey Rd S New Ellenton, SC, 29809-2638\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-16 02:20:01', '2025-10-16 02:20:05', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(74, 'eMGVf2xOXhLCqjeuutao', 'kiRfOKDyVWVbujuWVIdV', 'Martha Gibson', 'martigbsn@yahoo.com', '+16013257771', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"33 Higgins Rd, Sumrall, MS, 39482\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-16 01:11:32', '2025-10-16 01:11:36', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(75, 'nGMwdEJ26wVuUTznqFSb', 'kiRfOKDyVWVbujuWVIdV', 'george sanders', 'georgesanders4482@gmail.com', '+12057048239', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"225 Kensington Lane, AL, 35007\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-15 23:49:55', '2025-10-15 23:49:55', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(76, 'HrKNeSwKmUQaVMchGNPx', 'kiRfOKDyVWVbujuWVIdV', 'ray armstrong', 'olsarge2659@gmail.com', '+14072421084', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"5239 gwnne ave. Orlando fla., FL, 32810\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-15 23:29:42', '2025-10-15 23:29:42', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(77, '0M5AaatB8cVf1lRx3pet', 'kiRfOKDyVWVbujuWVIdV', 'robert de la garza', 'pagerhospital@gmail.com', '+12106632507', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3624 commercial ave, Tx, 78212\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-15 21:42:06', '2025-10-15 21:42:11', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(78, 'lBQDLEIoKRvFQExDYfXH', 'kiRfOKDyVWVbujuWVIdV', 'Damien Hodge', 'damienphd23@aol.com', '+16155403531', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"602 Newhall Dr, Nashville, TN 37206, USA, TN, 37206\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-15 21:28:31', '2025-10-15 21:28:35', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-30 13:54:49'),
(79, 'X4wUpDWdIRfZgQeFjKRa', 'kiRfOKDyVWVbujuWVIdV', 'mike jenkins', 'mike401979@gmail.com', '+19378447241', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1558 Township Rd 204, OH, 43311-9645\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-15 21:15:14', '2025-10-15 21:45:59', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:55:15'),
(80, 'UFmQNnIcf5Gsc8602Ywq', 'kiRfOKDyVWVbujuWVIdV', 'Prent Castle', 'prentcastle2@att.net', '+12257729258', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"140 Eula Road,  Jena, Louisiana, 71342\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-15 21:10:04', '2025-10-15 21:10:07', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(81, 'gA0FxuoqzXlepcBYtu1o', 'kiRfOKDyVWVbujuWVIdV', 'randy chandler', 'rchandler0304@gmail.com', '+13343999724', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"595 jernigan Rd, AL, 36426\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-15 20:47:49', '2025-10-15 20:47:49', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(82, 'NuLLo5y7bhwXav8sNtLL', 'kiRfOKDyVWVbujuWVIdV', 'Charles Moore', 'tarheelblue1819@gmail.com', '+17046990300', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"316 Royal Windsor Dr, NC, 28107\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-15 20:15:16', '2025-10-15 20:15:20', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(83, 'ef32Sbmq6sHrtSIj0EXg', 'kiRfOKDyVWVbujuWVIdV', 'susan ohearn', 'susanohearn823@yahoo.com', '+13059009173', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"19552 Aztec street, FL, 33042\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-15 19:52:11', '2025-10-15 19:52:14', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(84, 'MNdxXCtyPEZ297kHByAu', 'kiRfOKDyVWVbujuWVIdV', 'paul ryan', 'pkr3719@gmail.com', '+14126543072', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"11 huff avenue ext greensburg, Pa, 15601\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-15 19:22:03', '2025-10-15 19:22:03', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(85, 'Wig4eTUfTckKFn0EWyfL', 'kiRfOKDyVWVbujuWVIdV', 'henry baggs', 'hbaggs1966@gmail.com', '+19043251693', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"74 King St, FL, 32084-4342\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-15 19:10:06', '2025-10-15 19:10:09', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(86, 'QzPNooQJaWOEKZuxDUvP', 'kiRfOKDyVWVbujuWVIdV', 'elaine givens', 'elainewgivens26@gmail.com', '+16013342898', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"207 Oakland Dr Natchez, MS, 39120\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-15 18:46:20', '2025-10-15 18:46:20', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(87, 'cH7sFk7ZOw4QY7Ypiv2O', 'kiRfOKDyVWVbujuWVIdV', 'mike templeton', 'mtempleton309@gmail.com', '+18705032528', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"309 Dandridge St, AR, 72473\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-15 18:25:44', '2025-10-15 18:25:44', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(88, '8DVyyGhlphlKkrJzI72e', 'kiRfOKDyVWVbujuWVIdV', 'EJ Flanigan', 'ejflanigan@elitelegacyllc.com', '+14043419541', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1915 Campbellton Rd SW, GA, 30311\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-15 18:18:09', '2025-10-15 18:18:13', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(89, 'KEIsxeBWF40iqqTyPxBi', 'kiRfOKDyVWVbujuWVIdV', 'tiffany croft', 'tiffanyncroft@gmail.com', NULL, NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"95014 acorn lane, Florida, 32034\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-15 18:05:58', '2025-10-15 18:05:58', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(90, 'JMlN9YsgevideexRoZg8', 'kiRfOKDyVWVbujuWVIdV', 'mary risley', 'maryrisley630@gmail.com', '+18129109287', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"106 E Carsile St. Edwardsport, Indiana, 47512\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Too Many Repairs\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-15 17:55:26', '2025-10-15 17:55:26', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(91, '3BuC7reuFnlisk33c2Dc', 'kiRfOKDyVWVbujuWVIdV', 'Alma Aguirre', 'gar224173@gmail.com', '+19142783371', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"19603 Huckleberry Branch Ct, Texas, 77388\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-15 17:53:40', '2025-10-18 03:42:24', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(92, 'lUpzulkBvOlV73x84xjg', 'kiRfOKDyVWVbujuWVIdV', 'Misty Sutton', 'suttonm46@gmail.com', '+19859519129', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"11212 Audubon Drive, Louisiana, 70403\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-15 16:00:19', '2025-10-15 16:18:47', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:55:15'),
(93, '4SvXg67eeBlLijSWrO9g', 'kiRfOKDyVWVbujuWVIdV', 'douglas kalie', 'dougkalie@gmail.com', '+18146513055', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1036 E 27th St, PA, 16504-2920\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-15 15:27:05', '2025-10-15 15:27:05', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(94, 'W5Od2b05ksewCbYFqhfp', 'kiRfOKDyVWVbujuWVIdV', 'Lalania Hollimon', 'lhollimon1978@gmail.com', '+18323666511', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7602 Crystal Isle Ln, Humble, TX 77396, USA, TX, 77396\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-15 14:23:29', '2025-10-15 14:23:33', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(95, 'p35x6hNr5CvtydrhMN99', 'kiRfOKDyVWVbujuWVIdV', 'Jacquline Grant', 'jackwoolin06@gmail.com', '+16186452250', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"207 Filmore street, IL, 62960\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-15 14:14:01', '2025-10-15 14:14:04', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(96, 'Tpr46huXYaRx3Ryg6HRK', 'kiRfOKDyVWVbujuWVIdV', 'Alijah Wright', 'alijahwright371@gmail.com', '+19126879961', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"806 Welch St SW, Atlanta, Georgia, 30310\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-11 13:27:39', '2025-10-11 13:27:45', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(97, '9tDjPFx75yOyWzLuEbZ1', 'kiRfOKDyVWVbujuWVIdV', 'Angel Sanders', 'angel7077@yahoo.com', '+18506614796', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"26 Merwyn Dr, Florida, 32327\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-11 07:40:32', '2025-10-16 16:29:16', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(98, 'zWbdtw7GCs0Zbmfqlq2z', 'kiRfOKDyVWVbujuWVIdV', 'Cynthia Arnold', 'cinarnold5@gmail.com', '+18645663249', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"5315 Mountain View rd. Taylors, SC, 29687\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-11 03:23:23', '2025-10-11 03:23:28', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(99, 'yvIuA2KePLC9O2ENkQWN', 'kiRfOKDyVWVbujuWVIdV', 'amy peters', 'alaskanred2020@gmail.com', '+19073479680', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"8830 Richardson Highway, AK, 99714\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 20:09:44', '2025-10-10 20:09:44', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(100, '52uDZCJPeYWElcxYV9HY', 'kiRfOKDyVWVbujuWVIdV', 'joseph grandstaff', 'joeygrandstaff1957@gmail.com', '+18452632240', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3837 route 32 saugerties, New york, 12477\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 19:55:21', '2025-10-10 19:55:21', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(101, 'EK4bzIYJmPs7C7LlZm53', 'kiRfOKDyVWVbujuWVIdV', 'Randy Wise', 'randydwise62@gmail.com', '+15414200549', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"16043 delpino dr, Oregon, 97739\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-10 19:12:53', '2025-10-10 19:12:57', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(102, 'oDpcJjtOBp5O6ffHvTOh', 'kiRfOKDyVWVbujuWVIdV', 'Richard Walton', 'turningleft4@gmail.com', '+13256278100', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3561 North 9th, Texas, 79603\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 18:10:30', '2025-10-15 20:50:03', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:55:15'),
(103, 'J0n3NsJpCyly3VVxcUw4', 'kiRfOKDyVWVbujuWVIdV', 'eric knowles', 'lottiepop225@gmail.com', '+17723025998', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1105 Kentucky Ave, FL, 34950\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 17:52:59', '2025-10-15 14:17:53', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(104, 'i3XBJcnb2waLLKc1aDnJ', 'kiRfOKDyVWVbujuWVIdV', 'griffen dearmond', 'griffen@zavroproperties.com', '+12392095989', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"12119 Grand Jardin Dr Apt 305, Florida, 33913\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-10 17:25:35', '2025-10-22 17:41:11', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(105, 'J02RtXrOWKWaqMqWm9sU', 'kiRfOKDyVWVbujuWVIdV', 'Connie Daniels', 'danielsconnie35@gmail.com', '+16562261806', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3813 alice dr, FL, 33543\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 17:25:33', '2025-10-10 17:25:36', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(106, 'FhkPsRDhFFgAwxXX52mF', 'kiRfOKDyVWVbujuWVIdV', 'casey stiles', 'caseystiles2021@gmail.com', '+12543834347', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1640 cr 219, TX, 76549\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 17:20:24', '2025-10-10 17:20:24', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(107, 'kkzjuk8zMkrNgKxyRwPx', 'kiRfOKDyVWVbujuWVIdV', 'hamza yaqoob', 'hamzayaqoob99sd5@gmail.com', '+103035877656', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"USA, Texas, 5001\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Land\\\\\\/Lot\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"ddzBhdrxmdnrMAbZozAr\\\",\\\"value\\\":\\\"sadasd\\\"}]\"', '2025-10-10 16:43:00', '2025-10-10 16:43:00', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(108, 'heHQzJkoE3NN20Zs3dgU', 'kiRfOKDyVWVbujuWVIdV', 'Linda Childress', 'linchill2012@gmail.com', '+18179803070', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"9302 s.longwood, Tx, 76049\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-10 14:47:17', '2025-10-10 14:47:22', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(109, 'km8ad3yFkAmt0CqVir6S', 'kiRfOKDyVWVbujuWVIdV', 'Miltonia Gary', 'tibgary62@gmail.com', '+18647452551', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"325 berea forest circle, SC, 29617\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 10:51:43', '2025-10-10 10:51:47', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(110, 'qycJS2V9E0Uc9iPV6WZQ', 'kiRfOKDyVWVbujuWVIdV', 'Shannon Fuentes', 'fuentesshannon964@gmail.com', '+14429986047', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"83105 Alvarado Ave, Ca, 92274-9124\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-10 08:49:02', '2025-10-10 08:51:11', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(111, 'E4bz7GpM3n4h5VmTz1wc', 'kiRfOKDyVWVbujuWVIdV', 'Mary Todd', 'maryellentodd730@gmail.com', '+18125175614', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1021 W Franklin St, Evansville IN, 47710-1157\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 04:30:19', '2025-10-10 16:24:53', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(112, 'HLz2XVkswExZmDzjrcwi', 'kiRfOKDyVWVbujuWVIdV', 'Angia Macomber', 'angia.macomber.phd@gmail.com', '+17655060414', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"616 W 6th St, IN, 46953\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-10 03:39:09', '2025-10-10 03:39:12', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(113, 'BIMFxFxMA8eSBBqZhTo2', 'kiRfOKDyVWVbujuWVIdV', 'Jeremy Jordan', 'jjordan1284@gmail.com', '+16015668269', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1747 Shady Lane Dr, MS, 39204\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 03:35:43', '2025-10-10 03:35:47', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(114, 'U1ZVeSIEk10CvUz08AEy', 'kiRfOKDyVWVbujuWVIdV', 'Jason Cole', 'jason38cole@gmail.com', '+1743442559', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"Jason Cole, PA, 15314\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 02:06:42', '2025-10-10 02:06:45', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(115, 'VfCiqhBj54A0psSF2BRr', 'kiRfOKDyVWVbujuWVIdV', 'mark crum', 'mscrum19@gmail.com', '+14072942873', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7123 Hiawassee Overlook Drive, FL, 32835\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-10 01:01:41', '2025-10-10 01:01:41', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(116, 'TZaG9xbLcvMzuaQmTo8a', 'kiRfOKDyVWVbujuWVIdV', 'deborah allen', 'reddtdebt@gmail.com', '+13465306743', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"49177 faybol street, AZ, 85325\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-10 00:49:35', '2025-10-10 00:49:35', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(117, 'BiSzMzWYxXmsfkv5zaJM', 'kiRfOKDyVWVbujuWVIdV', 'griffen dearmond', 'test@gmail.com', '+1239209569', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"12119 Grand Jardin Dr, Florida, 33913\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-09 23:53:00', '2025-10-22 17:31:19', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(118, 'VxlKQGQz7IOn66GCILs9', 'kiRfOKDyVWVbujuWVIdV', 'james coonrod', 'jamescoonrod1980@gmail.com', '+18066900216', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"906 prospect st bucyrus, OH, 44820\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-09 23:40:43', '2025-10-09 23:40:43', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(119, 'HDt9X70i8fbwr3jzaDNh', 'kiRfOKDyVWVbujuWVIdV', 'Victoria Frazier', 'qmxrb5@icloud.com', '+17408619588', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"173 High St., OH, 45694\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-09 19:55:47', '2025-10-09 19:55:50', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(120, 'xyCRP25PRcjFpiFoevl1', 'kiRfOKDyVWVbujuWVIdV', 'Kristieana Raley', 'krissyhanifen@gmail.com', '+19302569102', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2015 Indiana Ave, IN, 47150\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-09 19:50:31', '2025-10-09 20:09:55', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:55:15'),
(121, 'Xb2tnIw1MdevG6c7rBTR', 'kiRfOKDyVWVbujuWVIdV', 'Frank Clark', 'tony10tony@yahoo.com', '+12818325213', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"20102 Biscayne Hill Ct, TX, 77379\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-09 17:10:57', '2025-10-14 19:42:20', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(122, 'TTa2bSVQcAx2pJbj2soZ', 'kiRfOKDyVWVbujuWVIdV', 'Jennifer Barajas', 'jenlynnbarajas@gmail.com', '+12093310929', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"511 S California, TX, 76365\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-09 14:04:16', '2025-10-09 14:05:10', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(123, '5Ed49ChO9AzVLO9RGAgn', 'kiRfOKDyVWVbujuWVIdV', 'lisa williams', 'lglegl5654@gmail.com', '+126782558782', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7192 Pearsons Corner Road, DE, 19904\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-09 13:59:05', '2025-10-09 13:59:05', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(124, 'dT3h4Ke38UN7jT1VqLYE', 'kiRfOKDyVWVbujuWVIdV', 'JeriAnn Sloane', 'tytc61598@yahoo.com', '+17135015657', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"11310 cora lane, Texas, 77318\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-09 13:51:38', '2025-10-09 13:51:43', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(125, 'iORIBoc02B7i95nHJmy3', 'kiRfOKDyVWVbujuWVIdV', 'Darrell Moore', 'd.moore57265@gmail.com', '+12162372502', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"14509 Milverton Rd, OH, 44122\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-09 13:17:19', '2025-10-14 20:13:29', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:55:15'),
(126, 'cImw9CFHkq7XGYxIfQLh', 'kiRfOKDyVWVbujuWVIdV', 'jason muncie', 'jasonmuncie45@gmail.com', '+15134996059', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2636 Byrneside dr, OH, 45239\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-09 13:10:22', '2025-10-09 13:10:22', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(127, 'HaDBdls3JJl9BDRRSE65', 'kiRfOKDyVWVbujuWVIdV', 'abegail pingaron', 'abeping918@gmail.com', NULL, NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, NULL, '2025-10-09 13:02:10', '2025-10-09 13:02:11', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(128, 'EulV5iwzQD0vEONOkdr0', 'kiRfOKDyVWVbujuWVIdV', 'Ada Hall', 'adahall80@gmail.com', '+14192157329', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"5823 livingston dr.toledo oh.43513, Ohio, 43513\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Tired Landlord\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-09 08:36:50', '2025-10-09 08:36:53', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(129, 'gMLCGfgd3lQExYIKuWdJ', 'kiRfOKDyVWVbujuWVIdV', 'Tanya white', 'serco4783@gmail.com', '+16064015966', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2190 hwy 490, Ky, 40729\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-09 02:30:25', '2025-10-09 13:51:20', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:55:15');
INSERT INTO `contacts` (`id`, `contact_id`, `location_id`, `name`, `email`, `phone`, `state`, `country`, `city`, `source`, `type`, `company`, `assigned_to`, `tags`, `dnd`, `custom_fields`, `date_added`, `date_updated`, `date_of_birth`, `company_id`, `postal_code`, `created_at`, `updated_at`) VALUES
(130, 'T3G1RTR5t1aYdDCegcsM', 'kiRfOKDyVWVbujuWVIdV', 'Kelley Nichols', 'keldarnic@gmail.com', '+18324906215', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1805 Laurel Oaks Drive, TX, 77469\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-09 01:48:58', '2025-10-17 00:26:40', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(131, 'd94I1AtBZdt2tIcSGd7Q', 'kiRfOKDyVWVbujuWVIdV', 'Deshundaca King', 'deshundacaking@gmail.com', '+18708664533', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1201 Pershing Hwy, Smackover, AR 71762, USA, AR, 71762\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-09 00:42:12', '2025-10-22 20:06:29', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(132, 'hwysQujwYFYr5rnAi74h', 'kiRfOKDyVWVbujuWVIdV', 'gabe drapel', 'gabedrapel@gmail.com', '+17028579323', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2425 Avalanche tr. 89124, NV, 89124\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-09 00:20:55', '2025-10-09 00:21:00', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(133, 'ATnwfdOfGXScnCFxk9tn', 'kiRfOKDyVWVbujuWVIdV', 'terry mckinney', 'terrylmc@myyahoo.com', '+13194972356', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1922 9th St SW, IA, 52404\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-08 22:47:11', '2025-10-10 04:52:33', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(134, 'IO2WXLb5UBybeOLIQw5u', 'kiRfOKDyVWVbujuWVIdV', 'jose zaragoza', 'joezaragoza330@yahoo.com', '+19155499760', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4100 Tierra Keto pl El Paso, TX, 79938\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-08 22:16:29', '2025-10-08 22:16:29', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(135, '9b0s9vnro5WqTJ5hdacL', 'kiRfOKDyVWVbujuWVIdV', 'michael dunbar', 'mchldunb@aol.com', '+18144495402', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"247 west 29th street Erie, PA, 16508\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-08 20:37:46', '2025-10-08 20:37:46', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(136, 'CV2NiZi8sSBTASJxOikk', 'kiRfOKDyVWVbujuWVIdV', 'Raymie Lainhart', 'raymietena53@gmail.com', '+18508261049', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"5083 hibiscus avenue Crestview, FL, 32539\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-08 20:17:57', '2025-10-14 20:22:28', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:55:15'),
(137, '8qWzESHW0jzy2FNZvBCp', 'kiRfOKDyVWVbujuWVIdV', 'Laura Stark', 'laurastark850@gmail.com', '+14436182776', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7757 Everd Ave, MD, 21122\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-08 20:17:55', '2025-10-08 20:20:04', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(138, 'uRzChHhNJUwzxjy4AVPa', 'kiRfOKDyVWVbujuWVIdV', 'Gina Brooks', 'gekelgina@icloud.com', '+18503753548', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7150 Plantation Rd 426 , Pensacola Fl.32504, FL, 32504\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-08 20:03:13', '2025-10-08 20:03:17', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(139, 'Jp9vkHcy7eUdiuGWy2IO', 'kiRfOKDyVWVbujuWVIdV', 'Mark Chambers', 'm.chambers.csrg@gmail.com', '+18325802573', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"11714 Anders Ln, TX, 77510-8672\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-08 19:26:01', '2025-10-10 06:54:48', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(140, 'xjpZYjCvui2gr3pUanqH', 'kiRfOKDyVWVbujuWVIdV', 'tanisha wilcox', 'tanisha412wilcox@gmail.com', '+12026311891', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3250 Ryon Ct., MD, 20601-3601\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-03 10:56:10', '2025-10-03 10:56:10', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(141, 'kQcwG5AusjO2PGXx5thj', 'kiRfOKDyVWVbujuWVIdV', 'barbara hunter', 'hunterbarbara@bellsouth.net', '+13182357154', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2016 Hazel street, LA, 71001\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-03 05:21:39', '2025-10-03 05:21:39', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(142, 'KngTWNbUlKwGT57YyD1K', 'kiRfOKDyVWVbujuWVIdV', 'Ann Remmert', 'annremmert0@gmail.com', '+13096200649', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"145  Colburn Dr, FL, 32713\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-03 05:13:12', '2025-10-10 04:15:07', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(143, 'FcQkJRiKkkRDtPZVcir0', 'kiRfOKDyVWVbujuWVIdV', 'ruth mitchell', 'ruth.mitchell45@yahoo.com', '+12164847022', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1395 S Belvoir, OH, 44121\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-03 02:20:05', '2025-10-03 02:20:05', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(144, 'WgrKPyNXDXOzIl0EeKXF', 'kiRfOKDyVWVbujuWVIdV', 'amy goode', 'gamy06477@gmail.com', '+18125955921', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"50 S 3rd St, IN, 47170-1710\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-03 01:50:44', '2025-10-03 01:50:44', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(145, 'kZEzVRwsjGWTgqOdLjQn', 'kiRfOKDyVWVbujuWVIdV', 'shelia campbell', 'campbellshelia84@gmail.com', '+12513820370', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1498 Homestead Dr W, Semmes, 36575\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-03 01:44:44', '2025-10-03 01:44:44', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(146, 'VYhddh0If7AyVBMjUr6p', 'kiRfOKDyVWVbujuWVIdV', 'Jerri Sherrod', 'turnage1772@gmail.com', '+19035597838', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"169 Rotan St, TX, 75630-7681\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-03 01:28:47', '2025-10-09 01:34:41', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(147, 'MDDKER7kkafo6cnYOmQH', 'kiRfOKDyVWVbujuWVIdV', 'deborah coll', 'colldebbie57@gmail.com', '+19736478464', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"57 Pawnee Ave, NJ, 07035\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-03 01:20:02', '2025-10-03 01:20:02', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(148, 'DvILACu5rKdSr9OUpQvK', 'kiRfOKDyVWVbujuWVIdV', 'jacquline fink', 'jlfink51@gmail.com', '+17402441570', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"197 Franconia Ave, OH, 43302\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-03 01:11:42', '2025-10-16 23:26:59', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(149, 'ucBbOMqg9K0oQD4GeCxb', 'kiRfOKDyVWVbujuWVIdV', 'david trepainier', 'dtrep1974@gmail.com', '+19206722604', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3347 maple grove school road, WI, 54153\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-03 00:57:27', '2025-10-03 00:57:27', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(150, 'eJJo9XMy0uQ0b89mHEiN', 'kiRfOKDyVWVbujuWVIdV', 'arthur sanchez', 'artsanchez1947@gmail.com', '+19042633849', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1416 Randall St Starke Florida, FL, 32091-1443\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-03 00:13:18', '2025-10-03 00:13:18', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(151, '3Gxt3gC3gfZS5nknbTtY', 'kiRfOKDyVWVbujuWVIdV', 'stella ornelas', 'ornelas_estella@yahoo.com', '+14327554649', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1301 s. Cherry  st., TX, 79772\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-02 13:28:37', '2025-10-02 13:28:37', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(152, '42SqqorFS4yFt89hoDvj', 'kiRfOKDyVWVbujuWVIdV', 'james housewright', 'jhousewright26@outlook.com', '+18703510485', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"497 cr 780, Arkansas, 72401\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-02 11:24:33', '2025-10-02 11:24:33', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(153, 'ZrlLIkjXyMW3PPC7TGrt', 'kiRfOKDyVWVbujuWVIdV', 'Luann Kurfis', 'kurffl@aol.com', '+13868472460', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3128 Woodland Dr, Edgewater, FL 32141, USA, FL, 32141\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-02 08:39:17', '2025-10-02 08:41:25', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(154, 'ngncqcFIjo4sZSM9ERsM', 'kiRfOKDyVWVbujuWVIdV', 'mohammed hassan', 'h_hfurniture@yahoo.com', '+19174785376', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"13301 116 street south ozone queens, NY, 11420\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-02 05:56:43', '2025-10-02 05:56:43', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(155, 'kOEsKWxPlBuKISNl1tow', 'kiRfOKDyVWVbujuWVIdV', 'bobbiejo payne', 'jomorton316@gmail.com', '+17722748411', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1018 SW ESTAUGH AVE, FL, 34953\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-02 02:55:56', '2025-10-02 02:55:56', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(156, 'zDHUWeq7lpTu4mwGodOq', 'kiRfOKDyVWVbujuWVIdV', 'Petra Williams', 'ms_topdog_2447@yahoo.com', '+12293760803', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4815 Marlborough Ave, Albany, GA 31721, USA, GA, 31721\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-02 00:01:32', '2025-10-02 18:26:58', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(157, 'LVICZCnamVo8h1ztpI0I', 'kiRfOKDyVWVbujuWVIdV', 'Patricia Rolon', 'pattyrolonpaz@gmail.com', '+17067184502', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4034 Wooldridge road, GA, 31808\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-01 23:50:24', '2025-10-02 23:20:00', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:55:15'),
(158, 'ZErytk0OJEWw0pyFGZZ5', 'kiRfOKDyVWVbujuWVIdV', 'robert woodard', 'rwoodardfl@bellsouth.net', '+19542958517', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4330 Hillcrest Drive, Suite 1019, FL, 33021\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-01 23:34:36', '2025-10-01 23:34:36', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(159, 'VF9uKfAK91nNSdRWdv9T', 'kiRfOKDyVWVbujuWVIdV', 'carol donald', 'c.a.donald4@gmail.com', '+15702944021', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7653 Stoney hill drive, FL, 33545\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-01 22:51:07', '2025-10-01 22:51:07', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(160, 'PIQDFRLGm8CYZalkwBMY', 'kiRfOKDyVWVbujuWVIdV', 'debbie allen', 'debbiea628@gmail.com', '+18145165875', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1 Forest place Oil City, PA, 16301\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-01 22:43:06', '2025-10-11 12:36:43', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:56'),
(161, 'AruAqDqQZ9L7q6o0Jj0S', 'kiRfOKDyVWVbujuWVIdV', 'Melvin Smith', 'melsmith11911@gmail.com', '+19375155431', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"Melvin Smith, OH, 45697\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-01 21:52:28', '2025-10-15 22:40:16', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:54:55'),
(162, 'tIA3JEIFF2EC3vkgsqqP', 'kiRfOKDyVWVbujuWVIdV', 'helen dykes', 'helendykes48@gmail.com', '+18593002193', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2431 E Hwy 80 Russell Springs, Ky, 42642\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-01 20:51:47', '2025-10-17 14:00:43', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(163, 'PHZlU2ERQSzhAsWVYE1p', 'kiRfOKDyVWVbujuWVIdV', 'ramon gomez', 'isaiahgomezfeb2@gmail.com', '+14805873792', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7341 N 157th ave, Ariz, 85340\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-01 18:50:24', '2025-10-01 18:50:24', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(164, 'wXAZjygX0kQ5CUyhxoBh', 'kiRfOKDyVWVbujuWVIdV', 'thomas phelan', 'thomas.d.phelan34@gmail.com', '+19254508982', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"160 Wigeon Court, Bunker Hill, WV, 25413\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-01 18:03:58', '2025-10-01 18:03:58', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(165, 'j5TpVeE5DaREA8AtwU8j', 'kiRfOKDyVWVbujuWVIdV', 'david stanley', 'rudyrock47@yahoo.com', '+12288613153', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"492 Iak Ln, MS, 39507\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-01 15:07:05', '2025-10-01 15:07:05', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(166, 'JxTDXwvIVQTlHyhxCXWV', 'kiRfOKDyVWVbujuWVIdV', 'eva sip cich', 'evesipcich@gmail.com', '+17406413577', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"104 Seneca a st, Ohio, 43964\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-01 14:22:13', '2025-10-01 14:22:13', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(167, 'wgA8CNjNqi4Cq8UX5YXz', 'kiRfOKDyVWVbujuWVIdV', 'diane morse', 'dianemorse56@gmail.com', '+13306366289', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"116 Coulter St, OH, 44217\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-01 13:27:51', '2025-10-01 13:27:51', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(168, 'v50ttLLuQsIkQ1ufpqZf', 'kiRfOKDyVWVbujuWVIdV', 'edward stiles', 'edwardstiles3268@gmail.com', '+18506916706', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7810 Blacks Road SW Pataskala oh, Ohio, 43062\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-01 13:16:15', '2025-10-01 13:16:15', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(169, '2jg4E01X6kmYXierT38e', 'kiRfOKDyVWVbujuWVIdV', 'wyanda brumfield', 'brumfieldwyanda150@gmail.com', '+12253602693', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3815 Platt Dr, LA, 70814\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-01 12:57:04', '2025-10-01 12:57:04', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(170, 'rWj7w42Gs7AXkTG8B1B7', 'kiRfOKDyVWVbujuWVIdV', 'richard baker', 'richbaker1983@aol.com', '+13046505040', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"116 goudy lane, West virginia, 26041\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-01 10:31:19', '2025-10-15 21:40:50', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(171, 'kat4Gerezk8hhB8mLJP1', 'kiRfOKDyVWVbujuWVIdV', 'shirley a lyons', 'lyonsshirley94@gmail.com', '+15674408889', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"963 Wall Street Toledo ohio, OH, 43609\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-01 10:11:48', '2025-10-01 10:11:48', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(172, 'CSwDRUdPLuac5BFyzb5u', 'kiRfOKDyVWVbujuWVIdV', 'james fletcher', 'jimpfletcher4165@gmail.com', '+19043357320', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"304 mahan street Saint Marys, GA, 31558\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-01 09:12:50', '2025-10-01 09:12:50', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(173, 'j2ILwqtfABuDl6Ah2j7K', 'kiRfOKDyVWVbujuWVIdV', 'byron desue', 'biddesue@yahoo.com', '+19048887411', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"Biddesue@yahoo.com, FL, 32097\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-01 09:10:20', '2025-10-16 22:29:05', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(174, 'DZf5szpDrbUMvTLqLy5A', 'kiRfOKDyVWVbujuWVIdV', 'shanica vaughn', 'shanicavaughn@gmail.com', '+14128532348', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"Shanicavaughn@gmail.com, PA, 15136\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-01 08:20:16', '2025-10-01 08:20:16', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(175, 'xVaxqKJjdIjzNMIWat8b', 'kiRfOKDyVWVbujuWVIdV', 'brenda rozsa', 'rozsabrenda@gmail.com', '+16072870656', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"27 Main St, NY, 13849-2182\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-01 07:11:14', '2025-10-08 23:00:56', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(176, 'eOkgeyr9WiA2fkrzzVCI', 'kiRfOKDyVWVbujuWVIdV', 'josseth davis', 'davisjosseth75@hotmail.com', '+15615415401', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"11431 Sage Meadow Terrace, Florida, 33411\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-01 07:03:20', '2025-10-01 07:03:20', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(177, 'QsnNwtPedlcEz2dPZiTm', 'kiRfOKDyVWVbujuWVIdV', 'jon powell', 'jonpowell4996@gmail.com', '+13613193746', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4865 River Oaks Dr, TX, 78102-8777\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-01 05:31:57', '2025-10-01 05:31:57', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(178, 'XsbDJlBPpjJ74OO2y7s0', 'kiRfOKDyVWVbujuWVIdV', 'jared gish', 'jlgish747@gmail.com', '+18122703891', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"170 n nix avenue, IN, 47633\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-01 04:49:04', '2025-10-01 04:49:04', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(179, 'Cd7nfqqxQjEIV1CM2pQ6', 'kiRfOKDyVWVbujuWVIdV', 'shawntae thomas', 'shawntae35@hotmail.com', '+12602585357', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2029 Villa Dr, Fort Wayne, 46819\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-30 20:33:01', '2025-09-30 20:33:01', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(180, 'Wh1Yyqq7l6jDlgqwk0Rx', 'kiRfOKDyVWVbujuWVIdV', 'vicky laich', 'vickylaich07@gmail.com', '+18142010305', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"629 n 9th ave  Altoona, Pa, 16601\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-09-30 12:49:27', '2025-09-30 12:49:27', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(181, 'd8NEoQd3DpnVsNAIjfPc', 'kiRfOKDyVWVbujuWVIdV', 'charles newman', 'trivic55@aol.com', '+14406700666', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2024 Cleveland av, OH, 44055\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-30 06:02:20', '2025-09-30 06:02:20', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(182, 'UcrJYsUd4y3Up2pbBMr5', 'kiRfOKDyVWVbujuWVIdV', 'melissa mccoy', 'justmelalukah@gmail.com', '+13526023684', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"604 S Main St, TX, 75951\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-30 05:34:41', '2025-09-30 05:34:41', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(183, 'vpxkze6xAwMSzgFiGEaK', 'kiRfOKDyVWVbujuWVIdV', 'lavar boyd', 'lavarboyd11@gmail.com', '+12485952215', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"18907 russell, Michigan, 48203\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Tired Landlord\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-30 03:35:35', '2025-09-30 04:06:04', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(184, 'aARnkkxlzqfhLWqR40Wg', 'kiRfOKDyVWVbujuWVIdV', 'arnold lacour', 'frenche59@gmail.com', '+12107824654', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"9015 Whimsey Ridge, Fair Oaks Ranch, Boerne, TX, 78015\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-30 03:25:56', '2025-09-30 03:25:56', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(185, 'RN6JbaKUB48SQRUWGZJP', 'kiRfOKDyVWVbujuWVIdV', 'blaise olah', 'blaise18603@gmail.com', '+15708546970', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3808 Ridge Road Berwick PA, PA, 18603-5330\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Land\\\\\\/Lot\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"ddzBhdrxmdnrMAbZozAr\\\",\\\"value\\\":\\\"Unknown\\\"}]\"', '2025-09-30 02:26:33', '2025-09-30 02:26:33', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(186, '7S4IrxXDo8LS3InFDK5O', 'kiRfOKDyVWVbujuWVIdV', 'julie gross', 'julierishel@yahoo.com', '+15703378400', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"235 E 15th st, PA, 18603\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-24 20:38:32', '2025-09-30 04:05:06', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(187, 'GGvnDzGwUVoH4VEdYEKA', 'kiRfOKDyVWVbujuWVIdV', 'william waugh', 'waughwm@aol.com', '+13048404530', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"107 Iroquois Dr. D1, OH, 45750\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-24 20:30:53', '2025-09-24 20:30:53', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(188, 'Moxw8rSGKffTxPU5NzNp', 'kiRfOKDyVWVbujuWVIdV', 'amanda bee', 'beeamanda2323@gmail.com', '+13048440174', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"Beeamanda2323@gmail.com, WV, 26415\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-24 17:25:55', '2025-09-30 04:47:40', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(189, 'jWwQo4ja6H3ptpSnjpZe', 'kiRfOKDyVWVbujuWVIdV', 'cleve hearron', 'cleves2007usa@gmail.com', '+16017385059', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"718 third north street vicksburg,ms, ms, 39183\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-24 17:01:54', '2025-09-24 17:08:36', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(190, 'tokaUtDPc58QaqKJTseJ', 'kiRfOKDyVWVbujuWVIdV', 'Carol Ferguson', 'carol.ferguson@ymail.com', '+15133256542', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1157 Enbrook Loop, Florida, 34113\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-09-24 15:34:30', '2025-10-14 20:22:27', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-11-05 03:55:15'),
(191, 'yMeggLklYKV70ST7x3il', 'kiRfOKDyVWVbujuWVIdV', 'veda hunt', 'vdhunt1956@gmail.com', '+16140000000', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1220 Berkeley, Ohio, 43206\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-24 12:41:05', '2025-09-24 12:41:05', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(192, 'CJMOysaWwWoHR3fmDlih', 'kiRfOKDyVWVbujuWVIdV', 'nancy smith', 'fancy_56_1999@yahoo.com', '+12072636569', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"15 Birch Ln, Beals, ME 04611, USA, Maine, 04611\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-24 11:41:16', '2025-09-24 11:41:16', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(193, '1KpeIJI1nf3e62jz0Glt', 'kiRfOKDyVWVbujuWVIdV', 'matthew stanfield', 'matt.stanfield@hotmail.com', '+15675259748', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"123 N Todd St, Ohio, 45858\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-09-24 11:33:03', '2025-09-24 11:33:03', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01');
INSERT INTO `contacts` (`id`, `contact_id`, `location_id`, `name`, `email`, `phone`, `state`, `country`, `city`, `source`, `type`, `company`, `assigned_to`, `tags`, `dnd`, `custom_fields`, `date_added`, `date_updated`, `date_of_birth`, `company_id`, `postal_code`, `created_at`, `updated_at`) VALUES
(194, 'HOU6vIt6syhQCipNKJOL', 'kiRfOKDyVWVbujuWVIdV', 'donna pleasant', 'donnapleasant98@gmail.com', '+14235577909', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"410 Thired Ave Hampton, TN, 37658\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-24 10:19:28', '2025-09-24 10:19:28', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(195, 'CNdNRvMcY73waN4rBb1J', 'kiRfOKDyVWVbujuWVIdV', 'donnellwilcoxson20@gmail.com wilcoxson', 'donnellwilcoxson20@gmail.com', '+17347964891', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"13595 Wyoming Ave, Mi, 48238\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-09-24 03:34:38', '2025-09-24 03:34:38', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(196, 'JILI3aLmK5CarMVnihmP', 'kiRfOKDyVWVbujuWVIdV', 'candy perry', 'northparkqueen@gmail.com', '+17125795699', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"406Tarkington Street, Iowa, 51537\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-24 00:29:19', '2025-09-24 00:29:19', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(197, 'mYidWIDJz52TTOXBKOLz', 'kiRfOKDyVWVbujuWVIdV', 'eileen halle', 'dobbie809@roadrunner.com', '+13302743601', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"10255 WELLINGTON RD STREETSBORO, OHIO, 44241\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-23 21:55:42', '2025-09-23 21:57:51', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(198, 'zS8zElG1F0rGK6hIXed2', 'kiRfOKDyVWVbujuWVIdV', 'craig phillips', 'phillips.craig.alan@gmail.com', '+13043737362', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"646 speed rd, Wv, 25276\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-23 18:19:16', '2025-09-23 18:19:16', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(199, '8mB1sCLKwUOp5flgIPIf', 'kiRfOKDyVWVbujuWVIdV', 'christopher orozco 5042661976', 'broom_leisure0b@yahoo.com', '+15042661976', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3853 S Deerwood dr, LA, 70058\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-23 13:10:22', '2025-09-23 13:10:22', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(200, 't7IMD6ilz373bqOGyqwV', 'kiRfOKDyVWVbujuWVIdV', 'tabatha simmonds', 'tabathasimmonds454@gmail.com', '+17402250774', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"151 Ohio st, Mansfield, 44903\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-23 10:17:34', '2025-09-23 10:17:34', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(201, '3UgnlUE0CureHn8Y1W3M', 'kiRfOKDyVWVbujuWVIdV', 'william thomas', 'amitahs759@gmail.com', '+13139388593', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"19315 Spencer, MI, 48234\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-23 05:11:34', '2025-09-23 05:11:34', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(202, 'MzwhtfXzP2z64qfAoeVK', 'kiRfOKDyVWVbujuWVIdV', 'tim poole', 'trusteewma@gmail.com', '+14197563443', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1106 Rocky Creek Dr 78660, TX, 78660\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-23 03:24:10', '2025-09-23 03:24:10', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(203, 'IRNFCoFJEgsOVNYskAYH', 'kiRfOKDyVWVbujuWVIdV', 'lisa gilbert', 'lisaskylar17@gmail.com', '+19374300694', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"633 cambridge ave, OH, 45402\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-23 02:52:59', '2025-09-23 02:52:59', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(204, 't3Ql8TgjRU04PlK7HT2W', 'kiRfOKDyVWVbujuWVIdV', 'lisa belanger', 'lb83856469@gmail.com', '+14695150896', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"9504 Pittsburg st, TX, 76035\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-23 01:21:23', '2025-09-23 01:21:23', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(205, 'HSpsVZy4XFxh0Zmi1Obd', 'kiRfOKDyVWVbujuWVIdV', 'wallace strang', 'mugsy11513@gmail.com', '+18782634100', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"8337 Stanhope-Kelloggsville Rd, OH, 44093\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-23 01:05:29', '2025-09-23 01:05:29', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(206, 'x7Aqw99qFYxUKmPHvqpf', 'kiRfOKDyVWVbujuWVIdV', 'susie cooper mullins', 'susiecoopermullins@gmail.com', '+13366926581', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4791 Brown Mountain Road, VA, 24657\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-09-23 00:37:54', '2025-09-23 00:37:54', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(207, 'so2qiUNjcE03BFw7MiOC', 'kiRfOKDyVWVbujuWVIdV', 'akhoury g.', '1mogul37@gmail.com', '+12486700054', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"14481 Detroit, Michigan, 48224-2059\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-22 23:51:31', '2025-09-22 23:51:31', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(208, 'mTIRGuVx9V9JvLyhaWvW', 'kiRfOKDyVWVbujuWVIdV', 'amber stewart', 'shepherdamber@yahoo.com', '+14195518273', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"505 Stoney Creek Drive, GA, 30680\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-09-22 23:15:58', '2025-09-23 00:52:34', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(209, 'SeXOthIoadgyVwOA2FgZ', 'kiRfOKDyVWVbujuWVIdV', 'tera bush', 'mamasgirlforever1982@gmail.com', '+17402484432', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"131 York , Circleville, OH, 43113\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-22 22:26:19', '2025-09-22 22:26:19', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(210, 'erMk5NachWVtjXmtdXBa', 'kiRfOKDyVWVbujuWVIdV', 'chuck bell', 'celebritylimousine23@gmail.com', '+15869444722', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3437 Edison St, Detroit, Michigan, 48206\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-22 19:51:45', '2025-09-22 19:51:45', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(211, 'd7QehvCuYztL2W1NgwQl', 'kiRfOKDyVWVbujuWVIdV', 'r swint', 'happypappy65@yahoo.com', '+13343330787', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"6229 S County Road 95 Gordon, Al36343\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-22 16:05:56', '2025-09-22 16:05:56', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(212, 'e1GltgVEejU3A2cxdv6k', 'kiRfOKDyVWVbujuWVIdV', 'lauralee blattner', 'blattgirl60@gmail.com', '+17245616275', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"331 Hill Rd Georgetown PA 15043\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-22 15:16:03', '2025-09-22 15:16:03', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(213, 'MfVYxRRh97rR8uRz2oQC', 'kiRfOKDyVWVbujuWVIdV', 'julie bostick', 'bostickjulie156@yahoo.com', '+17402778809', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2666 Arcola Rd Columbus\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-22 15:08:56', '2025-09-22 15:08:56', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(214, 'Y46Mfy2uPm0yVbBfOwBj', 'kiRfOKDyVWVbujuWVIdV', 'robert cook', 'linkcook57@gmail.com', '+16183062546', NULL, 'US', NULL, NULL, 'lead', NULL, 'Aj2MHYg7hGlPYViIofn9', NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3oo burd street, Illinois, 6297o\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Tired Landlord\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-22 12:22:34', '2025-10-10 13:37:12', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(215, 'RWBw9A2YXAl5INVb3C6C', 'kiRfOKDyVWVbujuWVIdV', 'steve bobinski', 'smb0871@yahoo.com', '+14073763483', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"248 E. Magnolia St Groveland, FL\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-10 14:51:14', '2025-09-10 14:51:14', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(216, 'upJF9xLIAR8w4EFqkHK2', 'kiRfOKDyVWVbujuWVIdV', 'david ferris', 'daveyferris@gmail.com', '+13307014239', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"189 West Vista Ave\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-10 10:50:18', '2025-09-10 10:50:18', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(217, '5Ef9vzlgt3TFRIt3x93y', 'kiRfOKDyVWVbujuWVIdV', 'guadalupe rodriquez', 'traveler48708@gmail.com', '+19895294111', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1300 s Farragut St\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-10 10:40:57', '2025-09-10 10:40:57', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(218, 'gj34MbanWIf0H6vMOcgH', 'kiRfOKDyVWVbujuWVIdV', 'doug showalter', 'dshow500@aol.com', '+16144914556', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"5278 Glenbriar Ct\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-10 04:23:12', '2025-09-10 04:26:16', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(219, 'c2Br9Ux7hJPvKaxECMnd', 'kiRfOKDyVWVbujuWVIdV', 'joshua montazeri', 'josh@surveync.com', '+13365095769', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2.9 roca vista drive, lenoir nc\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Land\\\\\\/Lot\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"ddzBhdrxmdnrMAbZozAr\\\",\\\"value\\\":\\\"2835854516\\\"}]\"', '2025-09-10 02:19:25', '2025-09-10 02:19:25', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(220, 'RkZoB9rJJX4UiVLxS2x4', 'kiRfOKDyVWVbujuWVIdV', 'kimberly yoakem', 'kimyoakem276@gmail.com', '+17406488981', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"134 Sugar Run Rd. Piketon\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-10 01:59:24', '2025-09-10 01:59:24', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(221, 'XqrWL2ZPs71ebiI6cOTA', 'kiRfOKDyVWVbujuWVIdV', 'lashan bryant', 'lamontb718@gmail.com', '+13134334347', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"19928 Houghton detroit michigan 48219\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-10 01:23:47', '2025-09-10 01:23:47', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(222, 'Wp1VP6LKBaXV4cbmlf4T', 'kiRfOKDyVWVbujuWVIdV', 'claire decker', 'clairedeckerdesigns@yahoo.com', '+13373561273', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"Hyway 1 South Bypass, Natchitoches, LA 71457\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Commercial\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-10 00:03:58', '2025-09-10 14:47:33', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(223, 'ISB6rAxv58uh42jR1XsN', 'kiRfOKDyVWVbujuWVIdV', 'kimberly brock', 'angela_ann@yahoo.com', '+16062134878', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1065 Elkins Frk Belfry, KY 41514\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-09-09 23:38:00', '2025-09-09 23:38:00', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(224, 'ajZELE7sT5oKAV1LKwU4', 'kiRfOKDyVWVbujuWVIdV', 'lissa hughes', 'bluelacie@aol.com', '+12393257019', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2821 24th. Ave.N.E Naples  fl 34120\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-09 21:35:31', '2025-09-09 21:35:31', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(225, 'LL9aofMSSwk0vBuJhoNd', 'kiRfOKDyVWVbujuWVIdV', 'sean mckee', 'poolcue7904@yahoo.com', '+16082890212', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"948 harrison ave beloit wi\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-09 20:39:29', '2025-09-09 20:39:29', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(226, 'KHACzOwHjmCt9tZCjxps', 'kiRfOKDyVWVbujuWVIdV', 'ben bell', 'thebenbell@gmail.com', '+15865252488', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"25673 Ford St, Roseville, MI 48066\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-09 20:27:23', '2025-09-09 20:54:20', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(227, 'GTqj0oFGqJ1M8RYjdfIn', 'kiRfOKDyVWVbujuWVIdV', 'mark franklin', 'mark71611@gmail.com', '+18704611741', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1715 & 1717 South mulberry Pine Bluff Arkansas\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-09-09 19:46:46', '2025-09-09 20:46:05', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(228, '20IoRrF49YbBILKl99Nb', 'kiRfOKDyVWVbujuWVIdV', 'kelly spangler', 'kelly.spangler@mail.com', '+13609721234', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1308 Alder St SE Lacey WA\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-09 15:51:20', '2025-09-09 15:51:20', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(229, '6lQqI34v6IT7mId1gjDn', 'kiRfOKDyVWVbujuWVIdV', 'aryel williamson', 'icequeen420.larue@gmail.com', '+16416408899', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"208 3RD street northeast hampton iowa 50441\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Too Many Repairs\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-09-09 14:57:32', '2025-09-09 14:57:32', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(230, 'VOTpxU8GD9tOqiYWzg5m', 'kiRfOKDyVWVbujuWVIdV', 'randall lamb', 'scottlamb49@gmail.com', '+13254369739', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1645 locust street Colorado City Tx\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-09 13:56:40', '2025-09-09 13:56:40', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(231, 'jHTIuzEAwRATvGi37VSd', 'kiRfOKDyVWVbujuWVIdV', 'david pittman', 'pittman.david.dp@gmail.com', '+13044910255', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"873 Logan street East liverpool ohio 43920\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-09 12:46:12', '2025-09-09 12:46:12', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(232, 'WZXs0img5SheHzowlQY7', 'kiRfOKDyVWVbujuWVIdV', 'stephen hughes', 'hugh891@gmail.com', '+15139697306', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4246 Oakwood Ave Cincinnati. Oh\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-09 00:04:26', '2025-09-09 00:04:26', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(233, 'KBA6LMmEA7nxW9D0Dfqb', 'kiRfOKDyVWVbujuWVIdV', 'hanza tar', 'hamzayaqoob995da@gmail.com', '+11234567713', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"USA\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-08 18:55:32', '2025-09-08 18:55:32', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(234, 'v9UONarE7IAb4F8dDe1b', 'kiRfOKDyVWVbujuWVIdV', 'felicia grays', 'fkeys930@gmail.com', '+13136245277', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"14219 Corbett\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-08 17:00:42', '2025-09-08 17:00:42', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(235, 'FycfHy081jYkVSfxraQH', 'kiRfOKDyVWVbujuWVIdV', 'yvette wood', 'yvtwood@aol.com', '+15132370170', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"Yvtwood@aol.com\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-08 15:25:08', '2025-09-08 15:25:08', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(236, '9TYmlVGAii8JYAv68k5I', 'kiRfOKDyVWVbujuWVIdV', 'christina spofford', 'mamam00se@yahoo.com', '+17409724473', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"138-142 Park Blvd marion, Ohio 43302\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Tired Landlord\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Multi Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-09-08 14:33:07', '2025-09-08 14:33:07', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(237, 'DyKCri2eJTIoL9GOLJJD', 'kiRfOKDyVWVbujuWVIdV', 'tonya bragg', 'tonyab2010@outlook.com', '+19374512656', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1306 and 1308 South st Piqua Ohio 45356\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-08 11:36:41', '2025-09-08 11:36:41', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(238, 'uEecTrdov24wj6td5ZM8', 'kiRfOKDyVWVbujuWVIdV', 'terry blythe', 'nopressure120@gmail.com', '+15135703562', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"120 n Decker ave\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Tired Landlord\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-09-08 06:11:28', '2025-09-08 06:11:28', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(239, 'Uxwf7xLXvGK0Ir8jgUKi', 'kiRfOKDyVWVbujuWVIdV', 'gentrit hoxhaj', 'gentrithoxha78@gmail.com', '+1049251417', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"test address\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inherited Property\\\"},{\\\"id\\\":\\\"LOUvjs0yc2KsffNCrlk2\\\",\\\"value\\\":\\\"The Homeowner\\\"}]\"', '2025-06-25 19:38:41', '2025-06-25 19:38:41', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(240, 'nEQv8Jyh2TbXlRm3hjLS', 'kiRfOKDyVWVbujuWVIdV', 'dren b', 'b@gmail.com', '+1383940303', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"j\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Whithin 3 Months\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inharitance\\\"}]\"', '2025-06-24 23:38:09', '2025-06-24 23:38:09', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(241, '6xhfgLIHNU1ekewiiEF8', 'kiRfOKDyVWVbujuWVIdV', 'dren j', 'drenbilalli9@gmail.com', '+1383905040', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"j\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Whithin 3 Months\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inharitance\\\"}]\"', '2025-06-24 23:17:26', '2025-06-24 23:17:26', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(242, '2WtZJ4lZa6AhlPDTDC4j', 'kiRfOKDyVWVbujuWVIdV', 'cassondra liles', 'cassyliles@gmail.com', '+19195235065', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1009 Hanover St Wilmington NC\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Just Curious\\\"}]\"', '2025-06-20 20:42:03', '2025-06-20 20:42:03', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(243, 'lG86prHAhBa5c6ui7uuA', 'kiRfOKDyVWVbujuWVIdV', 'sandy bartholomew', 'bartholomews385@gmail.com', '+19198460714', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1901 Thorpshire Drivej\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"}]\"', '2025-06-20 14:30:13', '2025-06-20 20:09:13', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(244, 'T6tLcn6klgePDcvSBMcw', 'kiRfOKDyVWVbujuWVIdV', 'romo a carpenter', 'monycarpenter@gmail.com', '+16143955568', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"583 East Columbus Street Columbus Ohio 43206\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For a Quick Sale\\\"}]\"', '2025-05-31 16:52:30', '2025-05-31 16:52:30', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(245, 'MrNZhdpyVndm4VUjtYjX', 'kiRfOKDyVWVbujuWVIdV', 'jerome white', 'jerome.white.senior@gmail.com', '+12522038802', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7451 bartee bridge Rd stantonsburg \\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For a Quick Sale\\\"}]\"', '2025-05-30 20:32:14', '2025-05-30 20:32:14', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(246, 'zJ8cvfYoXrrmnEYWxAHs', 'kiRfOKDyVWVbujuWVIdV', 'victoria pirillo', 'victoria.j.pirillo@gmail.com', '+19285148889', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"303 w Martin Street benson nc 27504\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"}]\"', '2025-05-30 17:30:01', '2025-05-30 17:30:01', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(247, 'XVavi3GLciRGjjduw8MP', 'kiRfOKDyVWVbujuWVIdV', 'tim dillard', 'tim.dillard@outlook.com', '+14809695888', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"9506 S Beaver Creek Way\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Whithin 3 Months\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For a Quick Sale\\\"}]\"', '2025-05-27 18:11:31', '2025-05-27 18:11:31', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(248, 'YWEdI0oz75Rg5sEZ6k40', 'kiRfOKDyVWVbujuWVIdV', 'jason redmond', 'dreamstoreality192@gmail.com', '+19842457071', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2337 belvedere dr Jackson Mississippi 39204\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For a Quick Sale\\\"}]\"', '2025-05-22 18:28:38', '2025-05-22 18:28:38', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(249, 'NyNTiPdESdbdvtuQs0xE', 'kiRfOKDyVWVbujuWVIdV', 'hieu doan', 'beginy2k@hotmail.com', '+19192473415', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1505 Basewood Drive Raleigh, NC 27609\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"}]\"', '2025-05-18 13:40:29', '2025-05-18 13:40:29', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(250, 'lphDK5pwiJibN845b9J6', 'kiRfOKDyVWVbujuWVIdV', 'montez brown', 'montez@turtleislandinvestments.com', '+19196389400', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"82 crow field street, roxboro, nc\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For a Quick Sale\\\"}]\"', '2025-05-18 03:07:35', '2025-05-18 03:07:35', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(251, 'NTNI5Xd4ej93d99ECTzF', 'kiRfOKDyVWVbujuWVIdV', 'tracy mclean', 'tracyjmclean@yahoo.com', '+19199245575', NULL, 'US', NULL, NULL, 'lead', NULL, NULL, NULL, 0, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1007 Tingen Rd Apex NC \\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It Is Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inharitance\\\"}]\"', '2025-05-17 17:31:11', '2025-05-17 17:31:11', NULL, NULL, NULL, '2025-10-29 17:47:01', '2025-10-29 17:47:01'),
(252, 'zyuOufQ6VO0i9Bm8ODQH', 'kiRfOKDyVWVbujuWVIdV', 'Gregory⁷ Williams', 'greg96605@gmail.com', '+17579985992', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"219 Saddler Dr, Newport News, VA 23608, USA, VA, 23608\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-29 18:30:15', NULL, NULL, NULL, NULL, '2025-10-29 18:30:18', '2025-10-29 18:30:18'),
(253, 'SR3OtIUCmrllsO3DZ3jW', 'kiRfOKDyVWVbujuWVIdV', 'Melissa Mondor', 'lissaruthnana@gmail.com', '+12078328220', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"853 feylers corner rd, Maine, 04572\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-29 19:35:46', NULL, NULL, NULL, NULL, '2025-10-29 19:35:48', '2025-11-05 03:54:55'),
(254, 'jIiSFRvF4TUy9jAAM9WM', 'kiRfOKDyVWVbujuWVIdV', 'Holly Harris', 'hollywoodharris@outlook.com', '+18067592052', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"313 Chicago Dr, Lamesa, TX 79331, USA, TX, 79331\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-29 19:41:15', NULL, NULL, NULL, NULL, '2025-10-29 19:41:19', '2025-10-29 19:41:19'),
(255, 'oPp2xo8X9p0G17rjQ9rf', 'kiRfOKDyVWVbujuWVIdV', 'Clara Mineer', 'jamesmineer@yahoo.com', '+16064715071', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"900 Davella Rd, Debord, KY 41214, USA, KY, 41214\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Tired Landlord\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-29 20:15:01', NULL, NULL, NULL, NULL, '2025-10-29 20:15:03', '2025-10-29 20:15:09'),
(256, 'PHvIf5hfIsfp06Kei1Uc', 'kiRfOKDyVWVbujuWVIdV', NULL, NULL, '+19374414112', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-10-30 13:02:35', NULL, NULL, NULL, NULL, '2025-10-30 13:02:53', '2025-10-30 13:02:53'),
(257, '3tpeGa9louoWrDnvCDmD', 'kiRfOKDyVWVbujuWVIdV', 'Gregory Mosley', 'moslgreg146@gmail.com', '+18327383715', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"14518 Burleson Bend Drive, Houston, TX 77049, USA, TX, 77049\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-30 15:44:40', NULL, NULL, NULL, NULL, '2025-10-30 15:44:43', '2025-11-05 03:54:56'),
(258, '9QbNaFSYMS4oVkLq9vAi', '8gm7q9rR8M1dcm9kMsiq', 'Sajjad Ahmad', 'sajjadahmad3548@gmail.com', '+923446920207', NULL, 'PK', NULL, 'order form', 'ContactUpdate', NULL, NULL, '\"paid\"', NULL, '\"[{\\\"id\\\":\\\"aU21j46DLrdz9DwDCQBW\\\",\\\"value\\\":\\\"apiLead\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"connector@gmail.com\\\"}]\"', '2025-08-28 22:26:21', NULL, NULL, NULL, NULL, '2025-10-30 17:06:59', '2025-11-04 22:08:04');
INSERT INTO `contacts` (`id`, `contact_id`, `location_id`, `name`, `email`, `phone`, `state`, `country`, `city`, `source`, `type`, `company`, `assigned_to`, `tags`, `dnd`, `custom_fields`, `date_added`, `date_updated`, `date_of_birth`, `company_id`, `postal_code`, `created_at`, `updated_at`) VALUES
(259, 'hgM5fNtY9st8rFuJjIKD', 'kiRfOKDyVWVbujuWVIdV', 'Jeffrey Johnston', 'jeffjohnston96@gmail.com', '+14698670943', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2720 Crow Valley Trail, Plano, TX 75023, USA, TX, 75023\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-30 17:20:05', NULL, NULL, NULL, NULL, '2025-10-30 17:20:07', '2025-11-05 03:54:56'),
(260, 'MReI3zF4X04DTsMoVkkQ', 'kiRfOKDyVWVbujuWVIdV', 'Brenda Prince', 'brey1104@yahoo.com', '+14792760812', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3301 S 64th St, Fort Smith, AR 72903, USA, AR, 72903\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-30 18:15:32', NULL, NULL, NULL, NULL, '2025-10-30 18:15:35', '2025-10-30 18:15:35'),
(261, 'hEfITXRfYKQYsEuW4Z21', 'kiRfOKDyVWVbujuWVIdV', 'Matthew Yusko', 'matthewpatrickhsllc@gmail.com', '+19046251599', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3453 Pemberton St, Jacksonville, FL 32224, USA, FL, 32224\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Too Many Repairs\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-30 19:35:36', NULL, NULL, NULL, NULL, '2025-10-30 19:35:38', '2025-11-03 19:33:42'),
(262, 'zfR6e6lOb5BKDULJzAhV', 'kiRfOKDyVWVbujuWVIdV', 'Eric Sebade', 'sebadeeric69@gmail.com', '+15099758044', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"170 Morrel Rd, Ronald, WA 98940, USA, WA, 98940\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-30 19:56:54', NULL, NULL, NULL, NULL, '2025-10-30 19:56:56', '2025-11-05 03:54:56'),
(263, '0DA6PhLD5WfuoJ17YmKU', '8gm7q9rR8M1dcm9kMsiq', 'zafri test', 'zafritest@gmail.com', '+923356745362', NULL, 'PK', NULL, 'zulkifal hassan', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"M0EZvmLf2KBQ9ICcPy4W\\\",\\\"value\\\":\\\"Thursday, November 13, 2025 9:00 AM\\\"}]\"', '2025-10-30 21:25:38', NULL, NULL, NULL, NULL, '2025-10-30 21:25:40', '2025-10-30 21:25:42'),
(264, 'ZkiSGOE3tTxad4lZxgis', '8gm7q9rR8M1dcm9kMsiq', 'zaidi test', 'zaiditest@gmail.com', '+923456738293', NULL, 'PK', NULL, 'zulkifal hassan', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"M0EZvmLf2KBQ9ICcPy4W\\\",\\\"value\\\":\\\"Thursday, November 20, 2025 8:30 AM\\\"}]\"', '2025-10-30 21:30:11', NULL, NULL, NULL, NULL, '2025-10-30 21:30:12', '2025-10-30 21:30:16'),
(265, 'RTt7SQVYlrlIBowVPAWQ', 'kiRfOKDyVWVbujuWVIdV', 'Johnr Davis', 'johmr6969@mail.com', '+18062315086', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"924 South Lamar Street, TEXAS, 79102\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-30 22:21:43', NULL, NULL, NULL, NULL, '2025-10-30 22:21:45', '2025-10-30 22:21:46'),
(266, 'nmlMWKtAzGDCvwmwM7fq', 'kiRfOKDyVWVbujuWVIdV', 'Roberta Kuschel', 'bobbiedkuschel@gmail.com', '+16027580284', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"15483 Highlands Harbor Dr, Clearlake, CA 95422, USA, CA, 95422\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-30 23:27:32', NULL, NULL, NULL, NULL, '2025-10-30 23:27:34', '2025-10-30 23:27:34'),
(267, '2gbm3dDsOdBcu86LQhCF', 'kiRfOKDyVWVbujuWVIdV', 'Cecelia Lippert', 'legionmom12@gmail.com', '+13144521148', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1507 Saint Francios Rd, Bonne Terre Mo, 63628\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Too Many Repairs\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-31 04:07:58', NULL, NULL, NULL, NULL, '2025-10-31 04:08:00', '2025-10-31 04:08:00'),
(268, 'o0s46dl8XNsI7USCwIBU', 'kiRfOKDyVWVbujuWVIdV', 'C R', 'yeswematter2@gmail.com', '+15036019292', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"6510 Eleanor Dr, Port Richey, FL 34668, USA, FL, 34668\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Too Many Repairs\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-10-31 04:14:23', NULL, NULL, NULL, NULL, '2025-10-31 04:14:25', '2025-10-31 04:14:26'),
(269, 'OO3R592uIRirpXLV5haD', 'kiRfOKDyVWVbujuWVIdV', 'Alma Sanchez', 'sancheal56@yahoo.com', '+14078183106', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"52 York Ct, Kissimmee, FL 34758, USA, FL, 34758\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-31 04:18:00', NULL, NULL, NULL, NULL, '2025-10-31 04:18:35', '2025-11-05 03:54:55'),
(270, 'XfpCxCZHxQixUipt1wsr', 'kiRfOKDyVWVbujuWVIdV', 'john gerard', 'johnfromflint@gmail.com', '+18109646400', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"200 S Farragut St, Bay City, MI 48708, USA, MI, 48708\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-31 08:39:10', NULL, NULL, NULL, NULL, '2025-10-31 08:39:12', '2025-11-05 03:54:55'),
(271, 'pITiHSRiKlhD1r0B2PW7', 'kiRfOKDyVWVbujuWVIdV', 'Bryan Lafevers', 'bryanjude1972@yahoo.com', '+15014163991', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"615 Bowers Dr, Benton, AR 72015, USA, AR, 72015\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-31 09:27:15', NULL, NULL, NULL, NULL, '2025-10-31 09:27:17', '2025-11-05 03:54:55'),
(272, 'mM6YLGJaIg27B0Oir3FV', 'kiRfOKDyVWVbujuWVIdV', 'Jason Summers', 'jasonmsummers@gmail.com', '+18128871438', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"6658 N Memering Rd, Bicknell, IN 47512, USA, IN, 47512\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-31 16:55:46', NULL, NULL, NULL, NULL, '2025-10-31 16:55:49', '2025-10-31 16:55:49'),
(273, 'yAU4fkrlATpARTzcdUf0', 'kiRfOKDyVWVbujuWVIdV', 'Billy Lott', 'billylott879@gmail.com', '+16629802787', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2330 W Roane Ave, Eupora, MS 39744, USA, MS, 39744\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-31 16:56:09', NULL, NULL, NULL, NULL, '2025-10-31 16:56:11', '2025-11-05 03:54:56'),
(274, 'AkrVDaOm4OmfILIYLizB', 'kiRfOKDyVWVbujuWVIdV', 'Susan Bucci', 'buccisusan4@gmail.com', '+12019233295', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"8440 Alberata Vista Dr, Tampa, FL 33647, USA, FL, 33647\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-31 18:05:38', NULL, NULL, NULL, NULL, '2025-10-31 18:05:41', '2025-11-05 03:54:56'),
(275, 'PzTQgdL4M7OUP1vuNc7S', 'kiRfOKDyVWVbujuWVIdV', 'Sharon Akers', 'apluscmitchem@gmail.com', '+13048884558', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"5296 Rock River Rd, WV, 24747-9740\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Too Many Repairs\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-31 18:19:38', NULL, NULL, NULL, NULL, '2025-10-31 18:19:40', '2025-11-03 20:36:53'),
(276, 'rtvnJrZqKcpQe6fsx1iy', 'kiRfOKDyVWVbujuWVIdV', 'Jean Laurent Nkunda', 'jeannkunda1@gmail.com', '+19199866133', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"5121 Carnelian Dr, Raleigh, NC 27610, USA, NC, 27610\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-31 18:29:38', NULL, NULL, NULL, NULL, '2025-10-31 18:29:43', '2025-11-05 03:54:55'),
(277, 'aQqem0bpurFoTG0uRhCL', 'kiRfOKDyVWVbujuWVIdV', 'Jamey McQueen', 'jameylmcqueen@gmail.com', '+17655618694', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"27042 US-52, Laurel, IN 47024, USA, IN, 47024\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-31 18:37:46', NULL, NULL, NULL, NULL, '2025-10-31 18:37:56', '2025-11-05 03:54:55'),
(278, 'f5KoXTjenovku8xZfp2T', 'kiRfOKDyVWVbujuWVIdV', 'Angelia Powell', 'createdtoocare@gmail.com', '+13017475156', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2510 Tower Hill Rd, Kinston, NC 28501, USA, NC, 28501\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-31 19:20:45', NULL, NULL, NULL, NULL, '2025-10-31 19:20:48', '2025-11-05 03:54:55'),
(279, 'nrTwbnmSyUPSaz7GI1ex', 'kiRfOKDyVWVbujuWVIdV', 'Joshua Methric', 'blackbolt187@gmail.com', '+15862411003', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"20665 Piedmont Dr, Clinton Township, MI 48036, USA, MI, 48036\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-31 19:31:06', NULL, NULL, NULL, NULL, '2025-10-31 19:31:10', '2025-11-05 03:54:55'),
(280, '6jU3QghqrcioiTAUTgO0', 'kiRfOKDyVWVbujuWVIdV', 'Scott KeeblerKeebler', 'scottkeebler@yahoo.com', '+17178948109', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4098 Willow Ln, Columbia, PA 17512, USA, PA, 17512\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-10-31 19:57:26', NULL, NULL, NULL, NULL, '2025-10-31 19:57:29', '2025-10-31 19:57:29'),
(281, '5KWzZsPnn8aZ5YOnEY37', 'kiRfOKDyVWVbujuWVIdV', 'Ken Langdon', 'ken.inyerneck1@gmail.com', '+19706661647', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"20321 N Shore Ln, West Frankfort, IL 62896, USA, IL, 62896\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Land\\\\\\/Lot\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"ddzBhdrxmdnrMAbZozAr\\\",\\\"value\\\":\\\"1320426010\\\"}]\"', '2025-10-31 20:46:26', NULL, NULL, NULL, NULL, '2025-10-31 20:46:29', '2025-11-05 03:54:55'),
(283, 'eUa3iALaNfDYbHXZlNzB', 'kiRfOKDyVWVbujuWVIdV', 'Susan Youngerman', 'weezal81@me.com', '+17207656375', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"17030 Foxton Dr, Parker, CO 80134, USA, CO, 80134\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-31 21:00:40', NULL, NULL, NULL, NULL, '2025-10-31 21:00:41', '2025-11-05 03:54:56'),
(284, 'jXuFlHj2FPGz1nWj9pUX', 'kiRfOKDyVWVbujuWVIdV', 'Florida Schwestka', 'fschwestka@gmail.com', '+16198203491', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"29267 Summerset Dr, Menifee, CA 92586, USA, CA, 92586\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-10-31 22:27:45', NULL, NULL, NULL, NULL, '2025-10-31 22:27:47', '2025-11-05 03:54:56'),
(285, 'McKmpklwX3UHD6w5m0L8', 'kiRfOKDyVWVbujuWVIdV', 'Samantha Dillingham', 'sammyshafer643@gmail.com', '+16067700282', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"305 Slate Branch Rd, Crab Orchard, KY 40419, USA, KY, 40419\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-31 22:28:56', NULL, NULL, NULL, NULL, '2025-10-31 22:28:57', '2025-11-05 03:54:55'),
(286, 'q0Pm1haJXqiKP3enxy2j', 'kiRfOKDyVWVbujuWVIdV', 'Rich Allen', 'lmallen47@gmail.com', '+16202666276', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1885 Jade, KS, 67063\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 6 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-10-31 22:57:39', NULL, NULL, NULL, NULL, '2025-10-31 22:57:41', '2025-10-31 22:57:41'),
(287, 'fGTEUr6n3G7nU8MGvbWq', 'kiRfOKDyVWVbujuWVIdV', 'Brian Allen', 'cowboy.ba@gmail.com', '+19853481384', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"16555 Pine Ln, LA, 70462\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Divorce\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-01 00:03:59', NULL, NULL, NULL, NULL, '2025-11-01 00:04:04', '2025-11-01 00:04:04'),
(288, 'FdXQeNo1igOK3DDYq0Tp', 'kiRfOKDyVWVbujuWVIdV', 'Nathan Hart', 'nathandshart@gmail.com', '+15599164074', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"28889 Deep Forest Ct, Coarsegold, CA 93614, USA, CA, 93614\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-01 00:17:37', NULL, NULL, NULL, NULL, '2025-11-01 00:17:40', '2025-11-01 00:17:40'),
(290, 'Mb27Hj8wWpmZbJvlxGX9', 'kiRfOKDyVWVbujuWVIdV', 'Danny Moore', 'dannymoore20151@gmail.com', '+15734106752', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"91 Terra Ln, MO, 65326-2606\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-01 01:19:36', NULL, NULL, NULL, NULL, '2025-11-01 01:19:38', '2025-11-01 01:19:38'),
(291, 'AsIL6gJRr1WI3txZXQhe', 'kiRfOKDyVWVbujuWVIdV', 'Paula Brecher', 'pbcatalanotto@gmail.com', '+12253041199', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"25864 Sagewood Dr, Denham Springs, LA 70726, USA, LA, 70726\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-01 01:30:17', NULL, NULL, NULL, NULL, '2025-11-01 01:30:22', '2025-11-05 03:54:55'),
(292, 'gejQs8t5sffY8HiZKYqi', 'kiRfOKDyVWVbujuWVIdV', 'Kristin De Los santos', 'kristindelossantos@yahoo.com', '+12108482314', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"430 Pleasanton Spring, San Antonio, TX 78221, USA, TX, 78221\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-11-01 02:02:19', NULL, NULL, NULL, NULL, '2025-11-01 02:02:21', '2025-11-05 03:54:55'),
(293, 'X50uDYXJAAjz6wzjBYiA', 'kiRfOKDyVWVbujuWVIdV', 'Karen V Towns', 'unome1974@gmail.com', '+13344071335', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"901 L L Anderson Ave, Selma, AL 36701, USA, AL, 36701\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Commercial\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-01 09:09:49', NULL, NULL, NULL, NULL, '2025-11-01 09:09:51', '2025-11-05 03:54:55'),
(294, 'T3mj9rh4qOqsWuZLog51', 'kiRfOKDyVWVbujuWVIdV', 'Karis Brewington', 'soprano196@aol.com', '+19194918969', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2725 Spring Valley Dr, Creedmoor, NC 27522, USA, NC, 27522\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-11-01 13:08:39', NULL, NULL, NULL, NULL, '2025-11-01 13:09:12', '2025-11-05 03:54:55'),
(295, '2CYR53NsRXN1IYJhzr6h', 'kiRfOKDyVWVbujuWVIdV', 'Theresa Austin', 'theresaaustin850@yahoo.com', '+18502263948', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"5354 Shoffner Blvd, Crestview, FL 32539, USA, FL, 32539\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-01 14:44:11', NULL, NULL, NULL, NULL, '2025-11-01 14:44:14', '2025-11-05 03:54:55'),
(296, 'taHyTM3Rf1Tzef2XBSu7', 'kiRfOKDyVWVbujuWVIdV', 'Kevin R Sr', 'kevinregolfsr@gmail.com', '+16098787787', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"526 Bainbridge Ave, Mays Landing, NJ 08330, USA, NJ, 08330\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-01 15:13:06', NULL, NULL, NULL, NULL, '2025-11-01 15:13:09', '2025-11-05 03:54:56'),
(297, '7kjc0JZlTjEDgyWYORxY', 'kiRfOKDyVWVbujuWVIdV', 'Heath kindrick', 'heathkindrick67@gmail.com', '+18063869994', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"130 Ave C, Hereford, TX 79045, USA, TX, 79045\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-11-01 15:57:41', NULL, NULL, NULL, NULL, '2025-11-01 15:57:43', '2025-11-05 03:54:56'),
(298, 'QR4GRdsnECAjv9mRskdv', 'kiRfOKDyVWVbujuWVIdV', 'Jude Mabu', 'acqies@yahoo.com', '+12029089425', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"241 Maclay St, Harrisburg, PA 17110, USA, PA, 17110\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-01 19:38:31', NULL, NULL, NULL, NULL, '2025-11-01 19:38:33', '2025-11-05 03:54:55'),
(299, 'fCeBUMnznETQ97uiJL6M', 'kiRfOKDyVWVbujuWVIdV', 'Dominick charobee', 'domdabomb2504@gmail.com', '+19892579255', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1119 Esther Rd, MI, 48705-9768\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-01 21:21:54', NULL, NULL, NULL, NULL, '2025-11-01 21:21:56', '2025-11-05 03:54:55'),
(300, 'SJc2erYt4BpSM3HCYxmf', 'kiRfOKDyVWVbujuWVIdV', 'Lisa Monroe', 'bamagirl.grady@gmail.com', '+18135625533', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"13100 Serpentine Dr, FL, 34667-6925\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-01 22:35:02', NULL, NULL, NULL, NULL, '2025-11-01 22:35:05', '2025-11-01 22:35:05'),
(302, 'VvBXDddpRNSej4b29PLK', 'kiRfOKDyVWVbujuWVIdV', 'Aric Nicholson', 'aricnicholson@gmail.com', '+13046513750', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"324 Elk River Rd, Procious, WV 25164, USA, WV, 25164\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-01 23:51:54', NULL, NULL, NULL, NULL, '2025-11-01 23:51:56', '2025-11-05 03:54:55'),
(303, 'XrKfGPxTDKK7mDHzc2s4', 'kiRfOKDyVWVbujuWVIdV', 'Michael Mooney', 'wolfiroc@protonmail.com', '+15712365367', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"8928 Rolling Rd, Manassas, VA 20110, USA, VA, 20110\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-02 00:50:10', NULL, NULL, NULL, NULL, '2025-11-02 00:50:12', '2025-11-02 00:50:21'),
(304, 'QzkvDJN0bvJfQ7Q7WEew', 'kiRfOKDyVWVbujuWVIdV', 'Shelley Hebert', 'shelleygreerhebert@icloud.com', '+13372887514', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"325 Country Club Dr, New Iberia, LA 70563, USA, LA, 70563\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-02 01:21:26', NULL, NULL, NULL, NULL, '2025-11-02 01:21:28', '2025-11-05 03:54:56'),
(305, 'vjgZaUr3dXsWfPjulMgD', 'kiRfOKDyVWVbujuWVIdV', 'Katie Havenar', 'bugtwins@gmail.com', '+19188860658', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"108 W Vine Ave, Barnsdall, OK 74002, USA, OK, 74002\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-02 17:22:08', NULL, NULL, NULL, NULL, '2025-11-02 17:22:10', '2025-11-02 17:22:11'),
(306, 'pijmUqDyR472FiCDWnqW', 'kiRfOKDyVWVbujuWVIdV', 'Pedro Alvidrez', 'peterantonio817@gmail.com', '+18177504594', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"1733 Holt St, Fort Worth, TX 76103, USA, TX, 76103\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-03 13:30:56', NULL, NULL, NULL, NULL, '2025-11-03 13:31:02', '2025-11-05 03:54:56'),
(307, 'q7RlSKexz8OVZtNYVo1k', 'kiRfOKDyVWVbujuWVIdV', 'Barbara Trouten', 'troutenbarbara@yahoo.com', '+18649912215', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"430 Keltner Ave, Spartanburg, SC, 29302\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Avoid Realtor Fees\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-03 14:14:44', NULL, NULL, NULL, NULL, '2025-11-03 14:15:15', '2025-11-05 03:54:55'),
(308, 'uonGiVzAmLP2bb4Iht3x', 'kiRfOKDyVWVbujuWVIdV', 'James Gordonjr', 'jamesgordon1912@gmail.com', '+19542432422', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2540sw 5street, Florida, 33312\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-03 14:52:53', NULL, NULL, NULL, NULL, '2025-11-03 14:52:56', '2025-11-05 03:54:56'),
(310, '9WGPYsTnKSymxk5cv9Ii', 'kiRfOKDyVWVbujuWVIdV', 'Julie Johnson', 'scubaseagreen@yahoo.com', '+13212235978', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"450 Topeka Rd SW, Palm Bay, FL 32908, USA, FL, 32908\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-03 17:45:31', NULL, NULL, NULL, NULL, '2025-11-03 17:45:35', '2025-11-05 03:54:56'),
(311, 'MEy6nwUH8h5zS55azZQf', 'kiRfOKDyVWVbujuWVIdV', 'Ana Rodriguez Sanchez', 'ana.sanchez.91@outlook.com', '+18135254870', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2507 Garvin Ave, Arcadia, FL 34266, USA, FL, 34266\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-03 19:21:10', NULL, NULL, NULL, NULL, '2025-11-03 19:21:14', '2025-11-05 03:54:56'),
(313, 'VIJ8WfurCmxU7Z0tTuY8', 'kiRfOKDyVWVbujuWVIdV', 'Roberta Williams', 'williamsroberta1010@yahoo.com', '+15743210973', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"319 N Mishawaka St, Akron, IN 46910, USA, IN, 46910\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-03 19:43:34', NULL, NULL, NULL, NULL, '2025-11-03 19:43:37', '2025-11-03 19:43:37'),
(314, 'qo6bvfm6PzgzASfx0qwg', '8gm7q9rR8M1dcm9kMsiq', 'shoaib badshah-11', 'shoaib143alam143badshah143@gmail.com', '+923135833313', NULL, 'PK', NULL, 'user-information get', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 23:47:42', NULL, NULL, NULL, NULL, '2025-11-03 20:20:39', '2025-11-03 20:35:36'),
(315, 'CwHFHstU5JkJQhxsx9B6', '8gm7q9rR8M1dcm9kMsiq', 'apiLead connector', 'connector@gmail.com', '+923459292929', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral\"', NULL, '\"[]\"', '2025-09-30 21:05:16', NULL, NULL, NULL, NULL, '2025-11-03 20:22:48', '2025-11-03 20:22:48'),
(316, 'SaJdemUuhwFT1GnvxU2E', '8gm7q9rR8M1dcm9kMsiq', 'shoaib Last Name', 'connectorshoaib@gmail.com', '+923125677336', NULL, 'PK', NULL, 'Refral Calendar', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-10-02 21:14:13', NULL, NULL, NULL, NULL, '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(317, 'kjUSGfjG6qeU3k2fMiqe', '8gm7q9rR8M1dcm9kMsiq', 'public acccess', 'token@gmail.com', '+923463843434', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral\"', NULL, '\"[]\"', '2025-10-01 15:48:13', NULL, NULL, NULL, NULL, '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(318, 'hNqv85gy4sWsABddWc2X', '8gm7q9rR8M1dcm9kMsiq', 'locaitonid companyid', 'locaitonid@gmail.com', '+923757884943', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral\"', NULL, '\"[]\"', '2025-09-30 20:46:49', NULL, NULL, NULL, NULL, '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(319, 'cxecoAQfigzUm1dqCZGV', '8gm7q9rR8M1dcm9kMsiq', 'Awais Sajjad', 'awais256@gmail.com', '+923175576666', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral\"', NULL, '\"[]\"', '2025-09-30 20:24:50', NULL, NULL, NULL, NULL, '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(320, 'UNZbK4Y93s0L9PXSN7lr', '8gm7q9rR8M1dcm9kMsiq', 'Aslam Baig', 'aslambaig.xortlogix@gmail.com', '+923000022133', NULL, 'PK', NULL, 'Personal booking', 'ContactUpdate', NULL, NULL, '\"alibhai,bg-black,bg-#0000\"', NULL, '\"[{\\\"id\\\":\\\"27Wm3OmekPovleQhmrKR\\\",\\\"value\\\":{\\\"0cffb450-eeef-480a-9969-23cfc64d56c3\\\":{\\\"documentId\\\":\\\"GzldToWPTOMbPqPzWFef\\\",\\\"meta\\\":{\\\"deleted\\\":true,\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"27Wm3OmekPovleQhmrKR\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"Screenshot 2025-08-04 210802.png\\\",\\\"size\\\":69388,\\\"uuid\\\":\\\"0cffb450-eeef-480a-9969-23cfc64d56c3\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/GzldToWPTOMbPqPzWFef\\\"},\\\"a8791614-b6e1-44b2-abb3-40d82808295f\\\":{\\\"documentId\\\":\\\"fYDq8ogy7wD0DOL19UrL\\\",\\\"meta\\\":{\\\"deleted\\\":true,\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"27Wm3OmekPovleQhmrKR\\\",\\\"mimetype\\\":\\\"image\\\\\\/webp\\\",\\\"originalname\\\":\\\"hive-events-logo.webp\\\",\\\"size\\\":6878,\\\"uuid\\\":\\\"a8791614-b6e1-44b2-abb3-40d82808295f\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/fYDq8ogy7wD0DOL19UrL\\\"},\\\"d531e778-a901-48c9-88b9-75c91ff30bda\\\":{\\\"documentId\\\":\\\"T5lIXoPuMN9jOl6PtsnV\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"27Wm3OmekPovleQhmrKR\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"Usman1.jpg\\\",\\\"size\\\":573955,\\\"uuid\\\":\\\"d531e778-a901-48c9-88b9-75c91ff30bda\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/T5lIXoPuMN9jOl6PtsnV\\\"}}},{\\\"id\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"value\\\":{\\\"144aa4f0-1b29-4404-8f3c-9a7d67b2b8fa\\\":{\\\"documentId\\\":\\\"FFIRHterFVRKyFIRO3q8\\\",\\\"meta\\\":{\\\"deleted\\\":true,\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"Screenshot 2025-08-11 213315.png\\\",\\\"size\\\":8640,\\\"uuid\\\":\\\"144aa4f0-1b29-4404-8f3c-9a7d67b2b8fa\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/FFIRHterFVRKyFIRO3q8\\\"},\\\"240e3d89-3561-41b5-ad85-68d6b690a029\\\":{\\\"documentId\\\":\\\"cFMAVB3gsQUbY6JDq6O5\\\",\\\"meta\\\":{\\\"deleted\\\":true,\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"Screenshot 2025-08-04 210802.png\\\",\\\"size\\\":69388,\\\"uuid\\\":\\\"240e3d89-3561-41b5-ad85-68d6b690a029\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/cFMAVB3gsQUbY6JDq6O5\\\"},\\\"3248df68-cc64-4732-9f86-882893e57f6c\\\":{\\\"documentId\\\":\\\"0X6VeogjfVkU3TzTRvLw\\\",\\\"meta\\\":{\\\"deleted\\\":true,\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/webp\\\",\\\"originalname\\\":\\\"hive-events-logo.webp\\\",\\\"size\\\":6878,\\\"uuid\\\":\\\"3248df68-cc64-4732-9f86-882893e57f6c\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/0X6VeogjfVkU3TzTRvLw\\\"},\\\"36fe8a0c-1cc3-44b9-8c7e-250438f78fb7\\\":{\\\"documentId\\\":\\\"IRG8jRorofhKRqaxFkiD\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/avif\\\",\\\"originalname\\\":\\\"photo-1531384441138-2736e62e0919.avif\\\",\\\"size\\\":16962,\\\"uuid\\\":\\\"36fe8a0c-1cc3-44b9-8c7e-250438f78fb7\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/IRG8jRorofhKRqaxFkiD\\\"},\\\"a99a41f6-9c16-43a3-9131-656a09603076\\\":{\\\"documentId\\\":\\\"RCoyI99LDKH5eK8g5DcJ\\\",\\\"meta\\\":{\\\"deleted\\\":true,\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"Screenshot 2025-07-31 035827.png\\\",\\\"size\\\":1164646,\\\"uuid\\\":\\\"a99a41f6-9c16-43a3-9131-656a09603076\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/RCoyI99LDKH5eK8g5DcJ\\\"},\\\"ae1e167f-6b70-46c1-96c0-b1fa61603fea\\\":{\\\"documentId\\\":\\\"xv0tzBDB4CcfaXSSNOOd\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"Usman1.jpg\\\",\\\"size\\\":573955,\\\"uuid\\\":\\\"ae1e167f-6b70-46c1-96c0-b1fa61603fea\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/xv0tzBDB4CcfaXSSNOOd\\\"},\\\"e689ab04-5bab-4fa4-9184-de736f271edf\\\":{\\\"documentId\\\":\\\"8Zq719ZVR3fNFFftetPo\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"image.png\\\",\\\"size\\\":198482,\\\"uuid\\\":\\\"e689ab04-5bab-4fa4-9184-de736f271edf\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/8Zq719ZVR3fNFFftetPo\\\"}}}]\"', '2025-08-08 21:00:13', NULL, NULL, NULL, NULL, '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(321, 'kBdkjj0tt2gMue3fmWc0', '8gm7q9rR8M1dcm9kMsiq', 'appointment user', 'supesdfradmin@gmail.com', '+923124545656', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral\"', NULL, '\"[]\"', '2025-09-30 20:39:39', NULL, NULL, NULL, NULL, '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(322, '0JfRiACbsalIh0k6fRxn', '8gm7q9rR8M1dcm9kMsiq', NULL, NULL, NULL, NULL, 'PK', NULL, 'survey (document and information)', 'ContactUpdate', NULL, NULL, '\"second years,ahmad\"', NULL, '\"[{\\\"id\\\":\\\"vfHW3UXIvaRWa0ZFrhsx\\\",\\\"value\\\":\\\"2024-07-10\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":18},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":1}]\"', '2024-07-18 21:56:17', NULL, NULL, NULL, NULL, '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(323, 'tEfYBkH1ZPKvNOIsjAuE', '8gm7q9rR8M1dcm9kMsiq', 'baber shehzad', 'babbr@gmail.com', '+923183924784', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"faraz,fake,invoice sent,refral,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Baber\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 15:20:19', NULL, NULL, NULL, NULL, '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(324, 'sDwNj9mOI8HcDpUuVETe', '8gm7q9rR8M1dcm9kMsiq', 'save all data', 'save@gmail.com', '+923842983723', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"faraz,fake,refral,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Save\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 15:27:00', NULL, NULL, NULL, NULL, '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(325, 'lDAwRZCu3MYkChpS5Yp9', '8gm7q9rR8M1dcm9kMsiq', 'xortlogix', NULL, NULL, NULL, 'PK', NULL, 'employee equipment agreement survey : Partial Creation Toggle Enabled', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"K2bHgvPlUX8v6mAwzEHu\\\",\\\"value\\\":\\\"Marketing\\\"},{\\\"id\\\":\\\"ZErucprpwiSpOoE92cpx\\\",\\\"value\\\":\\\"dell\\\"},{\\\"id\\\":\\\"vdUdR5WkpERFXBkJ8Rat\\\",\\\"value\\\":[\\\"Mouse and Keyboard\\\",\\\"Headset\\\"]},{\\\"id\\\":\\\"f18agEaiE86UAqeMSkTT\\\",\\\"value\\\":\\\"I accept\\\"}]\"', '2025-05-23 23:52:02', NULL, NULL, NULL, NULL, '2025-11-03 20:23:16', '2025-11-03 20:23:16');
INSERT INTO `contacts` (`id`, `contact_id`, `location_id`, `name`, `email`, `phone`, `state`, `country`, `city`, `source`, `type`, `company`, `assigned_to`, `tags`, `dnd`, `custom_fields`, `date_added`, `date_updated`, `date_of_birth`, `company_id`, `postal_code`, `created_at`, `updated_at`) VALUES
(326, 'UjjHCVWTAJlyRrLBgg0C', '8gm7q9rR8M1dcm9kMsiq', 'basit g', 'hr@gmail.com', '+92512456147', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"alibhai,appiontment test\"', 0, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Satti\\\"},{\\\"id\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"value\\\":{\\\"616ea962-5fb4-423e-b640-c4ecfdfb7ffd\\\":{\\\"documentId\\\":\\\"FZN4w9ag9tK8FUDvwMMD\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"pexels-shvetsa-3986999.jpg\\\",\\\"size\\\":2628734,\\\"uuid\\\":\\\"616ea962-5fb4-423e-b640-c4ecfdfb7ffd\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/FZN4w9ag9tK8FUDvwMMD\\\"},\\\"b65f81ed-a827-4583-a226-877612686395\\\":{\\\"documentId\\\":\\\"vx0j3fsQ0b3OQ2IYPPkr\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"default-firstframe.jpg\\\",\\\"size\\\":74643,\\\"uuid\\\":\\\"b65f81ed-a827-4583-a226-877612686395\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/vx0j3fsQ0b3OQ2IYPPkr\\\"},\\\"cdc2661b-de6a-40b3-b4bd-822f581ace01\\\":{\\\"documentId\\\":\\\"fmNBHZTONgNd25Ri663j\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"4.png\\\",\\\"size\\\":67136,\\\"uuid\\\":\\\"cdc2661b-de6a-40b3-b4bd-822f581ace01\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/fmNBHZTONgNd25Ri663j\\\"}}},{\\\"id\\\":\\\"01auvpbxPefyL32kljSz\\\",\\\"value\\\":\\\"6424 Maplewood Dr, Falls Church, VA 22041, USA\\\"},{\\\"id\\\":\\\"88FPlZ4BRy4AWz9lBzhP\\\",\\\"value\\\":\\\"Ship To\\\"}]\"', '2025-04-29 17:17:12', NULL, NULL, NULL, NULL, '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(327, '3lB5QdW5aWb61NtzKFil', '8gm7q9rR8M1dcm9kMsiq', 'priya malhotra', 'priya@gmail.com', '+923104324334', NULL, 'PK', NULL, 'basit-appointment-form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"zohaib khan\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"zohaibswati84@gmail.com\\\"}]\"', '2025-03-19 16:53:14', NULL, NULL, NULL, NULL, '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(328, 'NXGBrnFMtziQXameNFdm', '8gm7q9rR8M1dcm9kMsiq', 'jphn krick', 'dsaf@gmail.com', '+923104354354', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-19 16:11:36', NULL, NULL, NULL, NULL, '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(329, 'WVwndO96SG0qRGnTiqGY', '8gm7q9rR8M1dcm9kMsiq', 'asass ffffff', 'ffffff@gmail.com', '+178909999999', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"ahmad\"', NULL, '\"[]\"', '2025-04-24 23:00:20', NULL, NULL, NULL, NULL, '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(330, 'eseu69L9Ky3du93mN8gq', '8gm7q9rR8M1dcm9kMsiq', 'jojjo zamami', 'gt@example.com', '+92180007830', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"dialtag\"', NULL, '\"[]\"', '2025-03-25 19:34:59', NULL, NULL, NULL, NULL, '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(331, 'SXNbf9pn5Ii9LsPAfMFe', '8gm7q9rR8M1dcm9kMsiq', 'Zulkifal Hassan', 'hassan@xortlogix.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-05-22 18:26:01', NULL, NULL, NULL, NULL, '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(332, 'fThgTJsbd7Qdf26eXSwn', '8gm7q9rR8M1dcm9kMsiq', 'Jana Galloway', 'vadikylon@mailinator.com', '+14092676349', 'Ut dolores maxime es', 'PK', 'Ullam irure et incid', 'survey 29', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"1jNSUkATqR7vkPHvBm0G\\\",\\\"value\\\":\\\"UN Married\\\"},{\\\"id\\\":\\\"ZQfnS3XpVVdS6HJUDN3b\\\",\\\"value\\\":\\\"Male\\\"},{\\\"id\\\":\\\"6N7a2LxuH8T23aA7fscZ\\\",\\\"value\\\":\\\"Yes\\\"},{\\\"id\\\":\\\"nmaLDHS4GXDqhb2LUqv4\\\",\\\"value\\\":\\\"16000$\\\"},{\\\"id\\\":\\\"QKaJ0GhrpejQUOMIQiH3\\\",\\\"value\\\":\\\"Option 1\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 21:25:05', NULL, '2025-03-12', NULL, 'Nisi excepturi quo u', '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(333, 'uoKfTCNUc6gFHua6mvld', '8gm7q9rR8M1dcm9kMsiq', 'Berk Hill', 'citewuw@mailinator.com', '+14155550132', 'Qui id voluptatem co', 'PK', 'Minima est enim nesc', 'employee equipment agreement survey', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"K2bHgvPlUX8v6mAwzEHu\\\",\\\"value\\\":\\\"Marketing\\\"},{\\\"id\\\":\\\"ZErucprpwiSpOoE92cpx\\\",\\\"value\\\":\\\"dell\\\"},{\\\"id\\\":\\\"vdUdR5WkpERFXBkJ8Rat\\\",\\\"value\\\":[\\\"Mouse and Keyboard\\\",\\\"Headset\\\"]},{\\\"id\\\":\\\"f18agEaiE86UAqeMSkTT\\\",\\\"value\\\":\\\"I accept\\\"},{\\\"id\\\":\\\"01auvpbxPefyL32kljSz\\\",\\\"value\\\":\\\"Ship To: Islamabad, Pakistan\\\"},{\\\"id\\\":\\\"z7ZmKndqaScWU8wXdSv5\\\",\\\"value\\\":\\\"Ship to\\\"},{\\\"id\\\":\\\"ZQfnS3XpVVdS6HJUDN3b\\\",\\\"value\\\":\\\"Male\\\"},{\\\"id\\\":\\\"QKaJ0GhrpejQUOMIQiH3\\\",\\\"value\\\":\\\"Option 1\\\"},{\\\"id\\\":\\\"1jNSUkATqR7vkPHvBm0G\\\",\\\"value\\\":\\\"Married\\\"},{\\\"id\\\":\\\"6N7a2LxuH8T23aA7fscZ\\\",\\\"value\\\":\\\"Yes\\\"},{\\\"id\\\":\\\"nmaLDHS4GXDqhb2LUqv4\\\",\\\"value\\\":\\\"500$\\\"}]\"', '2025-05-23 23:52:32', NULL, '1995-07-06', NULL, 'Lorem exercitation m', '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(334, 'ckBx09B7cR4rNfdOj5rZ', '8gm7q9rR8M1dcm9kMsiq', NULL, NULL, NULL, NULL, 'PK', NULL, 'survey 34', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-07-30 21:32:58', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(335, 'VwKJxkMbrVHjDiu7e10S', '8gm7q9rR8M1dcm9kMsiq', 'zubair hren', 'zubair@gmail.com', '+923243543535', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-20 18:43:32', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(336, '1kTehLmOe87b7Apge3w3', '8gm7q9rR8M1dcm9kMsiq', 'lead3', 'lead2@gmail.com', '+923419220712', NULL, 'PK', NULL, 'Refral Calendar', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"aU21j46DLrdz9DwDCQBW\\\",\\\"value\\\":\\\"Test\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"testaccount@example.com\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-25 21:44:40', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(337, 'abPpF7hCYIRh0JI6hFSa', '8gm7q9rR8M1dcm9kMsiq', NULL, NULL, NULL, NULL, 'PK', NULL, 'hvac system', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"IEgX3KX4NKScvJymtMwu\\\",\\\"value\\\":\\\"Both\\\"},{\\\"id\\\":\\\"LslgguVWWcPobMsrfIjW\\\",\\\"value\\\":\\\"Somewhat\\\"},{\\\"id\\\":\\\"b7G6kImhTE0lvGwN1wkN\\\",\\\"value\\\":\\\"Yes\\\"}]\"', '2025-07-29 16:32:44', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(338, 'ajyXhQWa9Ndyv2j9i9lW', '8gm7q9rR8M1dcm9kMsiq', 'shaad Ali', 'saaad@gmail.com', '+928354353592', NULL, 'PK', NULL, 'Referral_calender', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"Dj khan\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"dj@gmail.com\\\"}]\"', '2025-03-21 20:08:08', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(339, 'Luh8K5qiSw4oifBv5biS', '8gm7q9rR8M1dcm9kMsiq', 'testing refral', 'testingrefral@gmail.com', '+923858697085', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Testing\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 16:18:31', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(340, 'qIpjn83S7TlcfWl1ZWQc', '8gm7q9rR8M1dcm9kMsiq', 'bojh jo', 'bojh@example.com', '+921884567890', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-25 18:33:11', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(341, 'E3tSw7oz1V5nW2uJrBm6', '8gm7q9rR8M1dcm9kMsiq', 'test invoice', 'invoice@gmail.com', '+923112525556', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', 0, '\"[{\\\"id\\\":\\\"01auvpbxPefyL32kljSz\\\",\\\"value\\\":\\\"Ship to 912 Norris Ave, McCook, NE 69001, USA\\\"},{\\\"id\\\":\\\"z7ZmKndqaScWU8wXdSv5\\\",\\\"value\\\":\\\"Ship to\\\"},{\\\"id\\\":\\\"88FPlZ4BRy4AWz9lBzhP\\\",\\\"value\\\":\\\"Ship To\\\"}]\"', '2025-05-26 20:51:51', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(342, 'FpR8zImMOCYJCxa6mStT', '8gm7q9rR8M1dcm9kMsiq', 'appointment', 'app@gmail.com', '+923458934893', NULL, 'PK', NULL, 'refrral lead', 'ContactUpdate', NULL, NULL, '\"faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Appointment\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 20:37:26', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(343, 'k9cfzZVPbfGsgGzHYLjj', '8gm7q9rR8M1dcm9kMsiq', NULL, 'umair.577155@gmail.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-08-07 16:22:08', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(344, 'F65hEf4KQ2lPdWuQjIUE', '8gm7q9rR8M1dcm9kMsiq', 'asma khalid', 'as@example.com', '+921884567830', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-25 18:56:36', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(345, 'FitY2m9qGxDPlfZm4uwb', '8gm7q9rR8M1dcm9kMsiq', 'Vel corporis volupta Ut sint eum natus te', 'hopynecypo@mailinator.com', '+9276533556676', NULL, 'US', 'McCook  NE', NULL, 'ContactUpdate', NULL, NULL, '\"\"', 0, '\"[]\"', '2025-05-22 18:30:12', NULL, '2020-01-07', NULL, '69001', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(346, 'ZTOmjguxZjfdhDDZ2IVR', '8gm7q9rR8M1dcm9kMsiq', 'Sapiente nesciunt a Asperiores optio co', 'myjire@mailinator.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"invoice sent\"', 0, '\"[]\"', '2025-05-22 16:26:23', NULL, '2021-02-02', NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(347, '32iW2KonnETgFDEU1wiD', '8gm7q9rR8M1dcm9kMsiq', 'shoaib', 'sh@gmail.com', '+923464775477', NULL, 'PK', NULL, 'refrral lead', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 21:00:51', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(348, 'AeCiRoiaGl4q7nqpOSdg', '8gm7q9rR8M1dcm9kMsiq', 'Muhammad umair', 'jon123132746736@gmail.com', '+923454353454', NULL, 'PK', NULL, 'Refral Calendar', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"aU21j46DLrdz9DwDCQBW\\\",\\\"value\\\":\\\"name\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"concatenation@gmail.com\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 23:01:16', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(349, 'ObnUnDrMwuJLIdnddf2k', '8gm7q9rR8M1dcm9kMsiq', 'Dj khan', 'dj@gmail.com', '+923104101566', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-19 16:42:59', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(350, '5ni4dNSboGwXn9myjDxc', '8gm7q9rR8M1dcm9kMsiq', 'Demo Demo', 'demo@deos.com', '+1123456789', 'Demo', 'PK', 'Demo', 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-19 22:09:30', NULL, NULL, NULL, '78978789', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(351, 'WlTb41CPMZC7ju6qxAZy', '8gm7q9rR8M1dcm9kMsiq', 'test developer', NULL, NULL, NULL, 'US', 'Wichita', NULL, 'ContactUpdate', NULL, NULL, '\"\"', 0, '\"[]\"', '2025-07-16 17:26:44', NULL, NULL, NULL, '67211', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(352, 'Lguvq3WiLvQX1FQ6wV3s', '8gm7q9rR8M1dcm9kMsiq', 'joijjo zamuuami', 'gtmkl@example.com', '+9218000783000', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"dialtag\"', NULL, '\"[]\"', '2025-03-25 19:37:17', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(353, '7wCmUSUMSrOITnmLFAA3', '8gm7q9rR8M1dcm9kMsiq', 'Nam sed et id illo Dolorem itaque cillu', 'nutety@mailinator.com', '+92897986876856', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"appiontment test,bg-red,color-green\"', 0, '\"[]\"', '2025-05-22 18:39:31', NULL, '2020-01-06', NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(354, 'iXq5CK0pkZ5daAv62Um1', '8gm7q9rR8M1dcm9kMsiq', 'Tanisha Burt', 'pokos@mailinator.com', '+12644083991', NULL, 'PK', NULL, 'Dental Appointment Booking', 'ContactUpdate', 'dfg', NULL, '\"anwar\"', NULL, '\"[]\"', '2025-05-29 02:00:47', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(355, 'nVuXQ5XTUvVUF7CLT2pX', '8gm7q9rR8M1dcm9kMsiq', 'luqman hussaain', 'luqman@gmail.com', '+9298763543535', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"bg-aqua\"', NULL, '\"[]\"', '2025-04-03 22:35:09', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(356, 'QAzvUNC4vdHjLBoBQo6j', '8gm7q9rR8M1dcm9kMsiq', 'Badar Mushtaq', 'badar@test.com', '+923348844423', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"faraz,invoice sent,second years,fake\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Badar\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-22 23:11:35', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(357, 'R5lk2W3aUMaxx9eEEhq0', '8gm7q9rR8M1dcm9kMsiq', 'Yetta Harris', NULL, '+92234567889989', 'Islamabad Capital Territory', 'PK', 'Islamabad', 'self test eye', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 23:20:33', NULL, '2025-03-04', NULL, '44050', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(358, '8sCHqmMxgViGo7TaBSt8', '8gm7q9rR8M1dcm9kMsiq', 'retun', 'return@gmail.com', '+923458739573', NULL, 'PK', NULL, 'refrral lead', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"aU21j46DLrdz9DwDCQBW\\\",\\\"value\\\":\\\"name\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"concatenation@gmail.com\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 21:54:05', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(359, '46q67DUMt3x7a2kstntt', '8gm7q9rR8M1dcm9kMsiq', 'ali aaa', 'aaa@gmail.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"ahmad\"', NULL, '\"[]\"', '2025-04-24 22:38:21', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(360, 'vChltGzdNgeIm6sFYydD', '8gm7q9rR8M1dcm9kMsiq', 'Ratione consequuntur Est dolor nisi dolo', 'kyfa@mailinator.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"ahmad,bg-black\"', 0, '\"[]\"', '2025-04-25 23:52:54', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(361, 'mLvVcfvcP7GGKksphsJx', '8gm7q9rR8M1dcm9kMsiq', 'url_parms', 'params@gmail.com', '+923485685343', NULL, 'PK', NULL, 'refrral lead', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 21:38:08', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(362, 'QUlA5zxvM1EgRqY8NQqW', '8gm7q9rR8M1dcm9kMsiq', 'aa aa', 'aa@gmail.com', '+923103445234', NULL, 'PK', NULL, 'appiontment booked calendar', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-24 21:56:39', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(363, 'Nwfc24bkJm1yWmpFZzgO', '8gm7q9rR8M1dcm9kMsiq', 'Guest Visitor zkmye', 'as@gmail.coim', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"pil1,pil2,pil3\"', NULL, '\"[{\\\"id\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"value\\\":{\\\"239f7e1d-717b-4f2c-9278-816111f12b9a\\\":{\\\"documentId\\\":\\\"dcnobkP1rY1msBUEzTr4\\\",\\\"meta\\\":{\\\"deleted\\\":true,\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"Usman.jpg\\\",\\\"size\\\":603606,\\\"uuid\\\":\\\"239f7e1d-717b-4f2c-9278-816111f12b9a\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/dcnobkP1rY1msBUEzTr4\\\"},\\\"b29c5c7f-9036-4ca3-a709-1c94a7294055\\\":{\\\"documentId\\\":\\\"xlH8rdT8cnc9Q8OLyQjc\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"Usman.jpg\\\",\\\"size\\\":603606,\\\"uuid\\\":\\\"b29c5c7f-9036-4ca3-a709-1c94a7294055\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/xlH8rdT8cnc9Q8OLyQjc\\\"},\\\"b52631ad-4b8d-4da1-bf72-e83ba286b459\\\":{\\\"documentId\\\":\\\"ldKGXvoyEBM4VZzHCHYP\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"Corona-Elegant-and-Powerful-Dark-Theme.png\\\",\\\"size\\\":462382,\\\"uuid\\\":\\\"b52631ad-4b8d-4da1-bf72-e83ba286b459\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/ldKGXvoyEBM4VZzHCHYP\\\"},\\\"ca565018-9de1-437f-ac6d-83e3b04c6cdd\\\":{\\\"documentId\\\":\\\"23VQemi7kTipYWdrKzos\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/avif\\\",\\\"originalname\\\":\\\"photo-1531384441138-2736e62e0919.avif\\\",\\\"size\\\":16962,\\\"uuid\\\":\\\"ca565018-9de1-437f-ac6d-83e3b04c6cdd\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/23VQemi7kTipYWdrKzos\\\"},\\\"cd67a682-e3ff-4eb9-83fa-21b53c200e88\\\":{\\\"documentId\\\":\\\"GUJMavPSV1XsuEPERvaN\\\",\\\"meta\\\":{\\\"deleted\\\":true,\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"5UDLvZGdi6zdZtBSmoCK\\\",\\\"mimetype\\\":\\\"image\\\\\\/avif\\\",\\\"originalname\\\":\\\"photo-1531384441138-2736e62e0919.avif\\\",\\\"size\\\":16962,\\\"uuid\\\":\\\"cd67a682-e3ff-4eb9-83fa-21b53c200e88\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/GUJMavPSV1XsuEPERvaN\\\"}}},{\\\"id\\\":\\\"V3vEG1plw0Wo0CCA7E1Y\\\",\\\"value\\\":{\\\"0df480c8-f301-4e5d-b7b0-5efd1c8aee0f\\\":{\\\"documentId\\\":\\\"uYN4Xo2DBIELhIgKyaEQ\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"V3vEG1plw0Wo0CCA7E1Y\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"image.png\\\",\\\"size\\\":198482,\\\"uuid\\\":\\\"0df480c8-f301-4e5d-b7b0-5efd1c8aee0f\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/uYN4Xo2DBIELhIgKyaEQ\\\"}}},{\\\"id\\\":\\\"ucaTr0wgVYWiYNUMs2Rv\\\",\\\"value\\\":\\\"Muhammad Usman\\\"},{\\\"id\\\":\\\"GXde8QTvvAWM3Rz0GB7u\\\",\\\"value\\\":\\\"Test Appointment\\\"},{\\\"id\\\":\\\"8Rxyy4feMjUSM7CNegrX\\\",\\\"value\\\":\\\"Test Venue\\\"},{\\\"id\\\":\\\"eGXlhpI0EJTwfxzAQ4T4\\\",\\\"value\\\":\\\"3:98\\\"},{\\\"id\\\":\\\"ujTMLMzK1qOoA8mpuHhq\\\",\\\"value\\\":\\\"1:23\\\"},{\\\"id\\\":\\\"YFdjPPpTNOeeFTBtcfKf\\\",\\\"value\\\":\\\"2025-08-04\\\"},{\\\"id\\\":\\\"zMxwCMYrPUCU8vi2KcxZ\\\",\\\"value\\\":\\\"Test Appointment 1\\\"},{\\\"id\\\":\\\"83fAsJvs6eWHpQTSRNFH\\\",\\\"value\\\":\\\"Test Venue 1\\\"},{\\\"id\\\":\\\"JUMSUnvGiUrYu0m3O51D\\\",\\\"value\\\":\\\"3:98\\\"},{\\\"id\\\":\\\"QNfXzG8nF0ecXWSYRBr7\\\",\\\"value\\\":\\\"1:23\\\"},{\\\"id\\\":\\\"59hxpsjtakbQFoqUPhZh\\\",\\\"value\\\":\\\"Test Appointment 2\\\"},{\\\"id\\\":\\\"Mkl25UI59xznkKZrDL0w\\\",\\\"value\\\":\\\"Test Venue 2\\\"},{\\\"id\\\":\\\"Vcvsdr0y1LTS4uzHJnyf\\\",\\\"value\\\":\\\"2:32\\\"},{\\\"id\\\":\\\"wAdYHBjNLm5aXurVxdRH\\\",\\\"value\\\":\\\"4:23\\\"},{\\\"id\\\":\\\"B8yNw0DkPcVe0NCXUpoE\\\",\\\"value\\\":{\\\"db7ee0f4-0abe-439a-9b7f-36fbbbaed181\\\":{\\\"documentId\\\":\\\"moI3mqMuoDsBOpPZO4Oj\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"B8yNw0DkPcVe0NCXUpoE\\\",\\\"mimetype\\\":\\\"image\\\\\\/avif\\\",\\\"originalname\\\":\\\"photo-1531384441138-2736e62e0919.avif\\\",\\\"size\\\":16962,\\\"uuid\\\":\\\"db7ee0f4-0abe-439a-9b7f-36fbbbaed181\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/moI3mqMuoDsBOpPZO4Oj\\\"}}},{\\\"id\\\":\\\"Fu1IqBQmamvzqzzJLqxw\\\",\\\"value\\\":\\\"Home Bin\\\"}]\"', '2025-08-08 20:51:36', NULL, '1990-02-06', NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(364, 'm5BgciucIPubpjvaqhri', '8gm7q9rR8M1dcm9kMsiq', 'kashmir chaudry', 'kashmir2@gmail.com', '+923104101012', NULL, 'PK', NULL, 'basit-appointment-form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"zalim khan\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"zlm@gmail.com\\\"}]\"', '2025-03-19 17:00:56', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(365, 'Zxe49xQSTHk3gpB4Tf7I', '8gm7q9rR8M1dcm9kMsiq', 'Alea Haynes', 'jegekyv@mailinator.com', '+15853447681', 'Commodi magni offici', 'AF', 'Quis voluptatem alia', 'survey 30 : Partial Creation Toggle Enabled', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"u7nlbhbI0m9dT4Hk7Zcm\\\",\\\"value\\\":181},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"9AEWVW3NQ3pMvQq7kzjZ\\\",\\\"value\\\":\\\"Voluptatem quis ver\\\"},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 21:25:22', NULL, NULL, NULL, 'In et natus amet mo', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(366, 'S2RbMvEvpXV6YhePuuM0', '8gm7q9rR8M1dcm9kMsiq', 'Illum non eius Aliqua', 'colo@mailinator.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"ahmad,color-black\"', 0, '\"[{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"asass@gmail.com\\\"},{\\\"id\\\":\\\"F1ZohiF4Zlfr4GTlTsKo\\\",\\\"value\\\":4},{\\\"id\\\":\\\"LGECq4IuICKFzXXywx1R\\\",\\\"value\\\":\\\"2025-04-09\\\"},{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"eeeeeeeeee\\\"}]\"', '2025-04-28 15:26:23', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(367, 'j8HNmKjQmrnL74o6H1G8', '8gm7q9rR8M1dcm9kMsiq', 'muhammad umair', 'shyan@gmail.com', '+923007836345', NULL, 'PK', NULL, 'umair_test_form', 'ContactUpdate', 'ytjttu', NULL, '\"bg-black,bg-aqua,bg-#0000,appiontment test\"', NULL, '\"[]\"', '2025-08-05 21:23:19', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(368, 'cxccLaCLN9HSCpfivbAN', '8gm7q9rR8M1dcm9kMsiq', 'Quis consequat Quam Rerum sit magna vol', 'kanywatar@mailinator.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"new lead,appiontment test,ahmad\"', 0, '\"[]\"', '2025-04-25 20:55:43', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(369, 'zygjt3QX7wskoxKHvnLd', '8gm7q9rR8M1dcm9kMsiq', 'gora zamami', 'gr@example.com', '+9218847830', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-25 19:29:43', NULL, NULL, NULL, NULL, '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(370, 'C6RRgzhFnPo1k2L979Of', '8gm7q9rR8M1dcm9kMsiq', 'sadiq khan', 'sadiq@gmail.com', '+923104101236', NULL, 'PK', NULL, 'Referral_calender', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"Dj khan\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"dj@gmail.com\\\"}]\"', '2025-03-19 19:01:08', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(371, 'SPpITVFVtYKRltYQkaqz', '8gm7q9rR8M1dcm9kMsiq', 'Umair Ashraf', 'umairashraf@xortlogix.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-06-05 20:35:19', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(372, 'nr3lOA9nWCw95Spiio7x', '8gm7q9rR8M1dcm9kMsiq', 'Dilip Kumar', 'dlip@gmail.com', '+923104533443', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-19 16:26:23', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(373, 'GYgZRMy83KxmYmZ3daV1', '8gm7q9rR8M1dcm9kMsiq', 'jan khalid', 'ja@example.com', '+921484567830', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-25 19:02:44', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(374, '5phnTJsNsvCsfGZqFKeI', '8gm7q9rR8M1dcm9kMsiq', 'user assigned', 'userassigned@gmail.com', '+923423422323', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"User\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 15:41:08', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(375, 'y12dNg6y3Ei376bkd8qm', '8gm7q9rR8M1dcm9kMsiq', 'Olga Golden', 'lysalipylu@mailinator.com', NULL, NULL, 'WS', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"new lead,appiontment test,ahmad\"', 0, '\"[]\"', '2025-04-25 20:56:13', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(376, 'sTL2NIKzipPxvHCFjKHU', '8gm7q9rR8M1dcm9kMsiq', 'Aliquam et labore qu Distinctio Aut assu', 'qecanecoj@mailinator.com', '+92788888888', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"invoice sent\"', 0, '\"[]\"', '2025-05-22 16:24:19', NULL, '2021-02-03', NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(377, 'qAi79Wr1iU8EbGziNljJ', '8gm7q9rR8M1dcm9kMsiq', '______ ______', '______@gmail.com', '+923445553432', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"______\\\"},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 20:25:48', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(378, 'iYaVAQYy6XNTy13VHvfA', '8gm7q9rR8M1dcm9kMsiq', NULL, NULL, NULL, NULL, 'PK', NULL, 'energyadvisor', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"oXLX0Zky85TSX2jTPA4J\\\",\\\"value\\\":\\\"Yes\\\"},{\\\"id\\\":\\\"LcYk4aePxAyiGOJFh2kL\\\",\\\"value\\\":\\\"Yes\\\"},{\\\"id\\\":\\\"17DO5Ox42xcMqTJNKvTo\\\",\\\"value\\\":\\\"Yes\\\"},{\\\"id\\\":\\\"0GuimcNRmVeIdNXw9ptV\\\",\\\"value\\\":\\\"13\\\"},{\\\"id\\\":\\\"w5PRMaSE7avN2DgKcja0\\\",\\\"value\\\":\\\"Both\\\"},{\\\"id\\\":\\\"I7ufG9jQ06zP1lDcUkm3\\\",\\\"value\\\":\\\"54540\\\"},{\\\"id\\\":\\\"YIyzj0RwPRFsifbZP0ol\\\",\\\"value\\\":\\\"Yes\\\"},{\\\"id\\\":\\\"twCYjfnYZFC77xODCgVr\\\",\\\"value\\\":\\\"4k sq. ft. +\\\"},{\\\"id\\\":\\\"jyS0XDYA4JBeHRi4azUA\\\",\\\"value\\\":\\\"16\\\\u00b0 - 24\\\\u00b0\\\"},{\\\"id\\\":\\\"7qtlQwazErVtflTYftbd\\\",\\\"value\\\":\\\"15\\\"}]\"', '2025-07-16 18:05:25', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(379, 'ccUCS3vKyYpUHqkw1Baz', '8gm7q9rR8M1dcm9kMsiq', NULL, NULL, NULL, NULL, 'PK', NULL, 'quiz 1', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-08-08 20:49:59', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(380, '6EOlSJjPToonIBHG6VKt', '8gm7q9rR8M1dcm9kMsiq', 'Sajjad', 'sajjadtest@gmail.com', '+923445672837', NULL, 'PK', NULL, 'Referral_calender', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"Arslan\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"arsalan@gmail.com\\\"},{\\\"id\\\":\\\"tZw4Bq0PEmhMxPs6CRB3\\\",\\\"value\\\":3543535}]\"', '2025-03-18 22:28:18', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(381, 'XBCIfoyZ3ni6v2Loe885', '8gm7q9rR8M1dcm9kMsiq', 'Asad shah', 'asadshah@gmail.com', '+13018943278', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-04-24 20:48:23', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(382, 'UBOPLQ2rrHvga9cULulF', '8gm7q9rR8M1dcm9kMsiq', 'checkign userId', 'check@gmail.com', '+923458347342', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Checkign\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 16:12:51', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(383, 'PdEpZMDi6mwDi6ajvZ5r', '8gm7q9rR8M1dcm9kMsiq', 'first last', 'dev@gmail.com', '+923123344555', 'Texas', 'AS', 'TEXAS', 'survey 30 : Partial Creation Toggle Enabled', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"9AEWVW3NQ3pMvQq7kzjZ\\\",\\\"value\\\":\\\"dgdsfgfgfdg\\\"}]\"', '2025-07-22 18:23:49', NULL, NULL, NULL, '99501', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(384, 'M3WRaipQSvLj5SqSE5vh', '8gm7q9rR8M1dcm9kMsiq', 'thisappscript fromappscript', '325732testin03940349@gmail.com', '+923409871234', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"ahmad\"', NULL, '\"[]\"', '2025-04-25 20:10:44', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(385, 'nNOY4QwcicHSDqB4xcpj', '8gm7q9rR8M1dcm9kMsiq', 'zulkifal hassan', 'z@gmail.com', NULL, NULL, 'PK', NULL, 'form 59', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-07-25 17:53:57', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(386, 'XCXTL96impFgGm3ZLomR', '8gm7q9rR8M1dcm9kMsiq', 'Hassan', 'kashkul@gmail.com', '+923300563239', NULL, 'PK', NULL, 'Refral Calendar', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"aU21j46DLrdz9DwDCQBW\\\",\\\"value\\\":\\\"name\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"concatenation@gmail.com\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-24 15:45:58', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(387, 'MqQBvwcZsQxvkMmBVEFn', '8gm7q9rR8M1dcm9kMsiq', 'Provident cillum qu Et ex blanditiis ex', 'kujucupet@mailinator.com', '+92876879787988', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', 0, '\"[]\"', '2025-05-22 18:38:02', NULL, '2020-01-06', NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(388, 'AKXzv3GupMNO00mEDBxc', '8gm7q9rR8M1dcm9kMsiq', 'Zachary Juarez', 'pivi@mailinator.com', '+13015629780', NULL, 'PK', NULL, 'Dental Appointment Booking', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-05-29 03:59:39', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(389, 'N89Grsgdhq7GjB6I3h2g', '8gm7q9rR8M1dcm9kMsiq', 'import db', 'imprtdb@gmail.com', '+923523847983', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Import\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 15:28:25', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(390, 'knPRMG7EDWbLqswhxCoL', '8gm7q9rR8M1dcm9kMsiq', 'asd', 'asd@gmail.com', '+923454389483', NULL, 'PK', NULL, 'refrral lead', 'ContactUpdate', NULL, NULL, '\"faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"aU21j46DLrdz9DwDCQBW\\\",\\\"value\\\":\\\"refrall_lead lead_testing\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"refrral_lead_testing@gmail.com\\\"},{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Asd\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 19:03:32', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(391, 'wC5bULP055qVc3mkHYSX', '8gm7q9rR8M1dcm9kMsiq', 'umair Test appointmemnt', 'devetest@demo.com', '+923192343444', NULL, 'PK', 'Kansas City', 'umair test calender', 'ContactUpdate', NULL, NULL, '\"dialtag\"', NULL, '\"[]\"', '2025-04-03 18:38:57', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(392, 'pj2ZdDfFrUtv55NIGZ6F', '8gm7q9rR8M1dcm9kMsiq', 'name conca', 'concatenation@gmail.com', '+923567344234', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Name\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 20:27:57', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(393, 'k292Glf80UyPUJmTi9uz', '8gm7q9rR8M1dcm9kMsiq', 'Rosffan Deo', 'rosffan@deos.com', '+19888888888', 'AL', 'PK', 'Dolomite', NULL, 'ContactUpdate', NULL, NULL, '\"\"', 1, '\"[]\"', '2025-04-24 20:16:30', NULL, NULL, NULL, '35061', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(394, '9ERaA7hXgyd3jXbYvuOE', '8gm7q9rR8M1dcm9kMsiq', 'Asad Shah', 'asadfgffshah@gmail.com', '+1301894873278', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-04-24 20:50:40', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(395, 'ZAnVDVwo4mhKRl3v0JvA', '8gm7q9rR8M1dcm9kMsiq', 'contact id_Tesign', 'testing@gmail.com', '+923444824342', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 22:18:01', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(396, 'tJW6QzaoXyqQ7FRwNn43', '8gm7q9rR8M1dcm9kMsiq', 'alfa testing', 'test@example.com', '+923001234567', NULL, 'PK', NULL, 'property quote form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"hzAvoTV6zIOM2L4GN4P8\\\",\\\"value\\\":1300},{\\\"id\\\":\\\"Rr0R6eMMd3Y10XzY3V3p\\\",\\\"value\\\":3},{\\\"id\\\":\\\"fbu3h9i8fw89OePt1kJl\\\",\\\"value\\\":2},{\\\"id\\\":\\\"1gyMfgN6aOLMlRBIxOF3\\\",\\\"value\\\":200},{\\\"id\\\":\\\"Tg3me2ZcEKowl9RSTaYq\\\",\\\"value\\\":375000},{\\\"id\\\":\\\"K2bHgvPlUX8v6mAwzEHu\\\",\\\"value\\\":\\\"Marketing\\\"},{\\\"id\\\":\\\"ZErucprpwiSpOoE92cpx\\\",\\\"value\\\":\\\"123\\\"},{\\\"id\\\":\\\"vdUdR5WkpERFXBkJ8Rat\\\",\\\"value\\\":[\\\"Headset\\\",\\\"Additional Monitor\\\"]},{\\\"id\\\":\\\"f18agEaiE86UAqeMSkTT\\\",\\\"value\\\":\\\"I accept\\\"}]\"', '2025-04-21 16:49:57', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(397, 'owpQ07t5eyobX0f2vFRd', '8gm7q9rR8M1dcm9kMsiq', 'Consequatur eveniet Deleniti ut maiores', 'cuwyw@mailinator.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"new lead,appiontment test,ahmad\"', 0, '\"[]\"', '2025-04-25 20:54:56', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(398, 'a4yk3hcJVEK5YRARdVbJ', '8gm7q9rR8M1dcm9kMsiq', 'Hu Mathews', 'lokegugeja@mailinator.com', '+92644555555', 'Quia aliquid non vol', 'PK', 'Islamabad', 'user-information get', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"csLF8fjus3cSKyz4bdQx\\\",\\\"value\\\":\\\"Male\\\"},{\\\"id\\\":\\\"mv7gxEvlx2xJs2qpKTVQ\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"eHyif44u5mfcvmBcZ9oX\\\",\\\"value\\\":90},{\\\"id\\\":\\\"D0vBolwPLqDWOsKEmSx1\\\",\\\"value\\\":{\\\"documentId\\\":\\\"gEmrhDEDNxlCxBwpY6jl\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"D0vBolwPLqDWOsKEmSx1\\\",\\\"isSignature\\\":true,\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"sign-timestamp-1758660696.png\\\",\\\"size\\\":8884,\\\"timestamp\\\":\\\"1758660696\\\",\\\"uuid\\\":\\\"c8618014-725c-49b1-a7d9-809e0cdfe72a\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/gEmrhDEDNxlCxBwpY6jl\\\"}},{\\\"id\\\":\\\"uoI2YL7dFko0dATzrgc2\\\",\\\"value\\\":{\\\"bb491203-f056-4fae-862a-04650790d9d6\\\":{\\\"documentId\\\":\\\"EVwofxhvK0vOMZLUykha\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"uoI2YL7dFko0dATzrgc2\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"download.jpg\\\",\\\"size\\\":1501,\\\"uuid\\\":\\\"bb491203-f056-4fae-862a-04650790d9d6\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/EVwofxhvK0vOMZLUykha\\\"}}},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 20:52:01', NULL, '2025-09-09', NULL, '44050', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(399, 'x7kZ3JudYbdOb1EBpibp', '8gm7q9rR8M1dcm9kMsiq', 'xort logix', 'xort_logix@gmail.com', '+923198473492', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,faraz,invoice sent,second years,fake\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Xort\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-22 22:41:32', NULL, NULL, NULL, NULL, '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(400, 'zpdULdazIo85YDWm1Lhu', '8gm7q9rR8M1dcm9kMsiq', 'rahmatqureshi', 'rahmatqureshi6661@gmail.com', '+92555555555', NULL, 'PK', NULL, 'car rental', 'ContactUpdate', 'tset', NULL, '\"\"', NULL, '\"[]\"', '2025-08-08 16:36:40', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(401, 'avVdcNFKpCWFihexloDo', '8gm7q9rR8M1dcm9kMsiq', 'update date', 'date@gmail.com', '+923893447374', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Update\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 15:36:36', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(402, 'BMSvh3FB7JDaJEYcfvWc', '8gm7q9rR8M1dcm9kMsiq', 'asad', NULL, NULL, NULL, 'PK', NULL, 'survey 26', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"Ht7ZY2VdpfVyNJSLT0UD\\\",\\\"value\\\":\\\"Female\\\"},{\\\"id\\\":\\\"GBOETyexlkbocIEJvwxh\\\",\\\"value\\\":\\\"18-24\\\"},{\\\"id\\\":\\\"1EHG54cnkry1OEyOFJc0\\\",\\\"value\\\":[\\\"Every 6 months\\\",\\\"Once a year\\\",\\\"Only when needed\\\",\\\"This was my first visit\\\"]},{\\\"id\\\":\\\"LIGMQtp8mmpVIwcC3nWK\\\",\\\"value\\\":\\\"Very easy\\\"},{\\\"id\\\":\\\"dMVjp22Z2pxD6TmYeP6G\\\",\\\"value\\\":[\\\"Appointment availability\\\",\\\"Waiting time\\\",\\\"Communication with patients\\\"]},{\\\"id\\\":\\\"TB80MQdg3ZVywo3toQq7\\\",\\\"value\\\":\\\"Easy appointment booking\\\"},{\\\"id\\\":\\\"mJyrk2CH7gMJezNS5VR4\\\",\\\"value\\\":\\\"Filling\\\"},{\\\"id\\\":\\\"atPYKLRT5zJow84CdhmC\\\",\\\"value\\\":[\\\"Yes, everything was clearly explained and easy to understand\\\",\\\"Mostly clear, but I had a few questions\\\"]},{\\\"id\\\":\\\"z36pnYdi6QPRyNArtQ84\\\",\\\"value\\\":[\\\"Very Likely\\\"]},{\\\"id\\\":\\\"Z1C1tSf3pVzvdoYqggPU\\\",\\\"value\\\":[\\\"Yes, the information was clear and complete\\\"]},{\\\"id\\\":\\\"Ojn7ucrdo4teO3OrTyOc\\\",\\\"value\\\":\\\"yes\\\"},{\\\"id\\\":\\\"01auvpbxPefyL32kljSz\\\",\\\"value\\\":\\\"Islamabad Pakistan\\\"},{\\\"id\\\":\\\"YxXrKaKwuxGPDDoJ4mqz\\\",\\\"value\\\":\\\"Custom Address\\\"},{\\\"id\\\":\\\"z7ZmKndqaScWU8wXdSv5\\\",\\\"value\\\":\\\"Ship to\\\"}]\"', '2025-05-23 23:53:42', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(403, 'mfDJnh2FsN1e554TtiLO', '8gm7q9rR8M1dcm9kMsiq', 'zalim khan', 'zlm@gmail.com', '+923104101056', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-19 16:27:59', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(404, '8yXeJkON2z71Z4cNIAYV', '8gm7q9rR8M1dcm9kMsiq', 'Quam officia numquam Non eos impedit rer', 'wajusyresi@mailinator.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"ahmad\"', 0, '\"[{\\\"id\\\":\\\"Fv3ZrNeMJzbLeyBE0xnu\\\",\\\"value\\\":\\\"married\\\"}]\"', '2025-04-28 21:06:25', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(405, 'EpSl3iti2K1GNh9TggbH', '8gm7q9rR8M1dcm9kMsiq', 'lead4', 'lead4@gmail.com', '+923419222771', NULL, 'PK', NULL, 'Refral Calendar', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years,ready_for_payout\"', NULL, '\"[{\\\"id\\\":\\\"aU21j46DLrdz9DwDCQBW\\\",\\\"value\\\":\\\"Test\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"testaccount@example.com\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12},{\\\"id\\\":\\\"UyAlm3YOCZEsqchGXf0i\\\",\\\"value\\\":23}]\"', '2025-09-25 21:45:43', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(406, '0sKpqWf69VawZUNKsT8m', '8gm7q9rR8M1dcm9kMsiq', 'shoaib', NULL, NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"new lead,appiontment test,ahmad\"', 0, '\"[]\"', '2025-04-25 23:45:11', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(407, 'Tzn43OTOqHvq7fkNoEPX', '8gm7q9rR8M1dcm9kMsiq', 'hane last', 'text@gmail.com', '+923124677878', 'fdhfh', 'AF', 'dhdfh', 'survey 30 : Partial Creation Toggle Enabled', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"9AEWVW3NQ3pMvQq7kzjZ\\\",\\\"value\\\":\\\"dgdsfgfgfdg\\\"}]\"', '2025-07-22 18:17:46', NULL, NULL, NULL, 'fgjgj', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(408, 'PcVS37Jsj1LPkuydoTaA', '8gm7q9rR8M1dcm9kMsiq', 'submitting subbbb', 'sub@gmail.com', '+923421919292', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,invoice sent,faraz,second years,fake\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Submitting\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-22 22:12:36', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(409, '8IxADjW4SAxFCn3bCWaE', '8gm7q9rR8M1dcm9kMsiq', 'Jabir Khan', 'jabirkhanswati999@gmail.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-29 15:28:48', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(410, 'mEZCi0JHdCKbuY2ojwwC', '8gm7q9rR8M1dcm9kMsiq', 'Eum voluptate tempor Nihil non est invent', 'vesy@mailinator.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"ai bot,appiontment test,new lead,ahmad\"', 0, '\"[]\"', '2025-04-25 23:40:29', NULL, '2001-02-07', NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(411, 'gWSmvPNhUKz3RCrfBWDr', '8gm7q9rR8M1dcm9kMsiq', 'kareem hrem', 'rwer@gmail.com', '+92935435358', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-21 17:48:15', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19');
INSERT INTO `contacts` (`id`, `contact_id`, `location_id`, `name`, `email`, `phone`, `state`, `country`, `city`, `source`, `type`, `company`, `assigned_to`, `tags`, `dnd`, `custom_fields`, `date_added`, `date_updated`, `date_of_birth`, `company_id`, `postal_code`, `created_at`, `updated_at`) VALUES
(412, 'wMWBXkDz3aQ7TnRwvrjU', '8gm7q9rR8M1dcm9kMsiq', 'Sajjadasdasd Ahmadasdasd', 'sadsadsdas@gmail.com', '+923446920223', 'workingwhat', 'PK', 'workingwhat', 'Test Bookingworkingwhat workingwhat workingwhat workingwhat', 'ContactUpdate', 'bitbinarry', NULL, '\"ai bot,dialtag\"', 0, '\"[{\\\"id\\\":\\\"CnVAxbmqcO1c2E39wTmO\\\",\\\"value\\\":\\\"shoaib badshsah12\\\"},{\\\"id\\\":\\\"0djZi35DU8M8GDggjl29\\\",\\\"value\\\":\\\"shoaib badshsah123\\\"},{\\\"id\\\":\\\"QjT4WmF8xGJrAFzcAvQ8\\\",\\\"value\\\":\\\"Shingle Replacement\\\"},{\\\"id\\\":\\\"2gBHT7ASjmrgGPsS9RFB\\\",\\\"value\\\":-4},{\\\"id\\\":\\\"pGgET29ltkNcQNbhZAfa\\\",\\\"value\\\":\\\"shoaib badshsah1234\\\"},{\\\"id\\\":\\\"aHdMR4NB1nAlTv3VPQsg\\\",\\\"value\\\":\\\"shoaib badshsah12345\\\"},{\\\"id\\\":\\\"cl8CpvZWjaQGJToVfiMH\\\",\\\"value\\\":\\\"shoaib badshsah123456\\\"},{\\\"id\\\":\\\"HjdMYGP9bwxkoW9gGie4\\\",\\\"value\\\":\\\"shoaib badshsah123457\\\"},{\\\"id\\\":\\\"JJg5iIiIQlnxFNUVEZrY\\\",\\\"value\\\":\\\"window\\\"},{\\\"id\\\":\\\"mZHp1ye1QXmYnSG63kzW\\\",\\\"value\\\":\\\"roof top repair\\\"},{\\\"id\\\":\\\"EyQ54Nu15yWegjqJNYAg\\\",\\\"value\\\":\\\"shoaib badshsah123456\\\"},{\\\"id\\\":\\\"JHnoTrnxuQC2p1akeLYl\\\",\\\"value\\\":\\\"shoaib badshsah123456\\\"},{\\\"id\\\":\\\"6lYEk6cTdZVibvAAfhw6\\\",\\\"value\\\":\\\"shoaib badshsah1\\\"},{\\\"id\\\":\\\"mfOrKV5I7foRkDENobQ3\\\",\\\"value\\\":\\\"shoaib badshsah1234568\\\"},{\\\"id\\\":\\\"Dv5JAlBWGUOg8yta61RL\\\",\\\"value\\\":\\\"shoaib badshsah12345689\\\"},{\\\"id\\\":\\\"sRUVvHlrBHpAV965dRDg\\\",\\\"value\\\":\\\"shoaib badshsah1234568910\\\"},{\\\"id\\\":\\\"JVCEDgNzf92G84ceLxTm\\\",\\\"value\\\":\\\"working good one\\\"},{\\\"id\\\":\\\"Fu1IqBQmamvzqzzJLqxw\\\",\\\"value\\\":\\\"Home Bin\\\"},{\\\"id\\\":\\\"5n3w6BafW3LbQ7iUX9Bm\\\",\\\"value\\\":\\\"16ft\\\"},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":-3},{\\\"id\\\":\\\"S5AfbvgUraY7OV1i6z2C\\\",\\\"value\\\":\\\"How many trees need service?\\\"},{\\\"id\\\":\\\"FzrWkRQDwSnzmzngYl06\\\",\\\"value\\\":[\\\"Do you live in Texas?\\\"]},{\\\"id\\\":\\\"UVQt2hhBzgN5nvNlVkVU\\\",\\\"value\\\":\\\"How many trees need service?\\\"},{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"shaoiab\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"shoaib\\\"},{\\\"id\\\":\\\"0ZFNxwwOF8Es2qbcVjOh\\\",\\\"value\\\":\\\"Consistently high quality\\\"},{\\\"id\\\":\\\"OdRwdax2gJaITFBnhtFV\\\",\\\"value\\\":\\\"Not effective\\\"},{\\\"id\\\":\\\"bRDKdCoxR5IJvFmZgJ2H\\\",\\\"value\\\":\\\"Not effective\\\"},{\\\"id\\\":\\\"tZw4Bq0PEmhMxPs6CRB3\\\",\\\"value\\\":-3},{\\\"id\\\":\\\"hfyISJjgluA80gjnETct\\\",\\\"value\\\":\\\"bitbianarry agar ais gaya maI tlaab sab ma arraha han\\\"},{\\\"id\\\":\\\"XvfrTbAkisB3hRAdbMJk\\\",\\\"value\\\":[\\\"Clear and Blue\\\"]},{\\\"id\\\":\\\"tzL19cSp3awATGpUlEFY\\\",\\\"value\\\":[\\\"Clear and Blue\\\"]},{\\\"id\\\":\\\"10rZvNbwfl5ZbhWXohx8\\\",\\\"value\\\":\\\"last\\\"},{\\\"id\\\":\\\"37na8XkFrxzmNAwXoCas\\\",\\\"value\\\":[\\\"Fiberglass\\\"]},{\\\"id\\\":\\\"RmT2TrFuNfdZpbck0JmJ\\\",\\\"value\\\":[\\\"Salt\\\"]},{\\\"id\\\":\\\"LUzAcfnPNUAveYYeqcjN\\\",\\\"value\\\":[\\\"Pool Opening\\\"]},{\\\"id\\\":\\\"rgDRlr2D2KmOgQz7b1gv\\\",\\\"value\\\":\\\"Roof maintenance\\\"},{\\\"id\\\":\\\"RLT6TZygg2w70WR9Z0XH\\\",\\\"value\\\":-1},{\\\"id\\\":\\\"JvjAaT4hlsZsesYhx4nU\\\",\\\"value\\\":[\\\"agree\\\"]},{\\\"id\\\":\\\"jdSZlAruM9EImZtcmqF3\\\",\\\"value\\\":\\\"FARAZ\\\"},{\\\"id\\\":\\\"prrCShQqW4h6e0508fw9\\\",\\\"value\\\":\\\"SHAMEER\\\"},{\\\"id\\\":\\\"qmGInakZxHD1SqmyN89t\\\",\\\"value\\\":\\\"Frequent absenteeism\\\"},{\\\"id\\\":\\\"Nox5dz4yc6es0GVXV4HG\\\",\\\"value\\\":\\\"Very effective\\\"},{\\\"id\\\":\\\"Io3QzJQU2Y8M418OO9le\\\",\\\"value\\\":\\\"Often low quality\\\"},{\\\"id\\\":\\\"qW8jjvq6uzmScDn27gin\\\",\\\"value\\\":\\\"Very effective\\\"},{\\\"id\\\":\\\"0Eda5XL4oQCrXuF6YjiQ\\\",\\\"value\\\":[\\\"Apartment\\\\\\/Condo\\\"]},{\\\"id\\\":\\\"JQHDNfof5onMBxWwC654\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"t0Ah7XGVVi6ax4rFcKHz\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"tBb5Aot1lx49ruinCycN\\\",\\\"value\\\":\\\"As soon as possible\\\"},{\\\"id\\\":\\\"1VMs6pqStQRJKgI0RAW5\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"KlNqknlZInzv62ZDtCwJ\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"uoAatJ2e0ECrld7jg39k\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"pAvjaOFOUTqxwTIXmdKD\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"jzWubfSogBllKiFtWw0A\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"MXVJAA5V6OUN3TRCro5N\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"vJvBp4b9sddUoNnJtCoT\\\",\\\"value\\\":[\\\"Content Creation\\\"]},{\\\"id\\\":\\\"lI0DeMY1f670qJ6hWxEy\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"o5LWw9ce8jCu3x8aQ1Ug\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"eCLbHxuIC9XrO5AxvJYH\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"oHIDMZopu8DAVy04KhPD\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"1iKZsIVa3DPIrRVTRx2z\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"HciN9JgxJbPWPPIzyWmo\\\",\\\"value\\\":\\\"yes\\\"},{\\\"id\\\":\\\"CmDrhQClKYVRIZoAGOOu\\\",\\\"value\\\":1234},{\\\"id\\\":\\\"WirQgwsdn3VXpdHb5ikV\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"bEwrUKHbGbjf2pSoL8BC\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"lotWFFWuXRGBKa9AXwgu\\\",\\\"value\\\":\\\"vworkingwhat\\\"},{\\\"id\\\":\\\"5RJQQB6bQSFPQNWX88Jy\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"ysTWB1v6gDxWsrYHN5TY\\\",\\\"value\\\":\\\"2025-04-03\\\"},{\\\"id\\\":\\\"jEdvH8Wj6XgoK2N5AYmv\\\",\\\"value\\\":\\\"2025-04-01\\\"},{\\\"id\\\":\\\"6wECANXw9WLGO6KB8MUl\\\",\\\"value\\\":\\\"2025-04-03\\\"},{\\\"id\\\":\\\"Sp5JWz2vdjEkavCzDeLE\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"RnJIhYBNpHCDC4iIemtL\\\",\\\"value\\\":0},{\\\"id\\\":\\\"o1NsWg00nvKc7aX7tNLF\\\",\\\"value\\\":\\\"WEB DEVELOPER\\\"},{\\\"id\\\":\\\"GyxudMFbspuhYq7Dc4AU\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"qA7qbGdVc5FFJbjpWFQM\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"8oeUqdF0lKCOlwt3oYAW\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"cBiB31OXBVMOR9GLHr93\\\",\\\"value\\\":\\\"GM\\\"},{\\\"id\\\":\\\"s48PQw0Ieif7e7ka10I8\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"DaEL1FFppni5ArGOPeZz\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"Pq0iJesb8wQZfXh4DsNF\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"8tUceP217YwaGNhFigkQ\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"VAPmiSzU4COdtghXUai2\\\",\\\"value\\\":\\\"Test\\\"},{\\\"id\\\":\\\"gSf6TvdPunOUkcTq2Ryv\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"blqNUiOzyAgA3tNCAGDP\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"YlpLzWeWGLIy7KNj0DUj\\\",\\\"value\\\":\\\"workingwhat\\\"},{\\\"id\\\":\\\"JvEEoAZcIAVx7yotH0Bb\\\",\\\"value\\\":{\\\"59b4c84f-3f08-47dc-8c6f-c1eb4f549e68\\\":{\\\"documentId\\\":\\\"fKwqvsLaaD0GF0xFleZ0\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"JvEEoAZcIAVx7yotH0Bb\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"wp4456015-stranger-things-3-wallpapers.jpg\\\",\\\"size\\\":279790,\\\"uuid\\\":\\\"59b4c84f-3f08-47dc-8c6f-c1eb4f549e68\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/fKwqvsLaaD0GF0xFleZ0\\\"},\\\"6758446e-fb2c-4b75-8026-7c9299481081\\\":{\\\"documentId\\\":\\\"J5Tq2cDUUO5UzXBGWdOX\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"JvEEoAZcIAVx7yotH0Bb\\\",\\\"mimetype\\\":\\\"application\\\\\\/pdf\\\",\\\"originalname\\\":\\\"Contact_Sajjadasdasd_Ahmadasdasd (23).pdf\\\",\\\"size\\\":37929,\\\"uuid\\\":\\\"6758446e-fb2c-4b75-8026-7c9299481081\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/J5Tq2cDUUO5UzXBGWdOX\\\"}}},{\\\"id\\\":\\\"V83H1kfq4EAFx9Fa8UQ0\\\",\\\"value\\\":\\\"what ever\\\"},{\\\"id\\\":\\\"r2bW9WxhiPDMgngfhXiE\\\",\\\"value\\\":\\\"what ever\\\"},{\\\"id\\\":\\\"c4PtZNdHb0uf5fKs3fIR\\\",\\\"value\\\":{\\\"04186e48-e7c0-4116-8d63-6db91d6f2ce0\\\":\\\"what ever\\\",\\\"8db5ca89-2c8a-42b8-bcd4-14ed8a6381b2\\\":\\\"what ever\\\"}},{\\\"id\\\":\\\"KdhBougPpXkTTg24bjbm\\\",\\\"value\\\":\\\"male\\\"},{\\\"id\\\":\\\"0loIm37ST0bNSreta2FM\\\",\\\"value\\\":[\\\"what is your father name\\\"]},{\\\"id\\\":\\\"zQLrleqhmhYNo2WFYnhP\\\",\\\"value\\\":[\\\"In Progress\\\"]},{\\\"id\\\":\\\"xVuEos4AYDFEMJuyJOXZ\\\",\\\"value\\\":\\\"what ever\\\"},{\\\"id\\\":\\\"ximFpfv7eZ1L0KTThnIO\\\",\\\"value\\\":\\\"what ever\\\"},{\\\"id\\\":\\\"QWzfR31VzKS5WYOvaDOd\\\",\\\"value\\\":\\\"what ever\\\"},{\\\"id\\\":\\\"GNJOE7e6fM3gzGWBmTnF\\\",\\\"value\\\":[\\\"Brake Service\\\"]},{\\\"id\\\":\\\"vdrfrngKa9OWgbJLemMY\\\",\\\"value\\\":\\\"what ever\\\"},{\\\"id\\\":\\\"SOr2DTPGl4C6Z9HWkyZ2\\\",\\\"value\\\":\\\"what ever\\\"},{\\\"id\\\":\\\"woJPyuMDzBZrIP2i4gF8\\\",\\\"value\\\":[\\\"Tree Trimming\\\"]},{\\\"id\\\":\\\"YrROwgWhEhbwGz1xO16g\\\",\\\"value\\\":\\\"what ever\\\"},{\\\"id\\\":\\\"MyLNhfDLuFm5PZjtHlV1\\\",\\\"value\\\":\\\"what ever\\\"},{\\\"id\\\":\\\"3nYdR13o4GSRziY4cp1c\\\",\\\"value\\\":{\\\"3a60979d-ba78-422e-ade7-97ec2e3c5a2c\\\":{\\\"documentId\\\":\\\"mmFkCXMhBjv6nJlFD4X2\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"3nYdR13o4GSRziY4cp1c\\\",\\\"mimetype\\\":\\\"application\\\\\\/pdf\\\",\\\"originalname\\\":\\\"GHL_Sajjadasdasd_Ahmadasdasd_Details (3).pdf\\\",\\\"size\\\":15409,\\\"uuid\\\":\\\"3a60979d-ba78-422e-ade7-97ec2e3c5a2c\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/mmFkCXMhBjv6nJlFD4X2\\\"}}},{\\\"id\\\":\\\"RIMCrNpuBUP56jRvEklv\\\",\\\"value\\\":{\\\"384f89e4-9254-469f-b451-99ccf95d50bb\\\":{\\\"documentId\\\":\\\"EIIgz3Bqq9praKvK3CA2\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"RIMCrNpuBUP56jRvEklv\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"8b752163b8f78bb83d710f6cd76a79bd.jpg\\\",\\\"size\\\":91089,\\\"uuid\\\":\\\"384f89e4-9254-469f-b451-99ccf95d50bb\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/EIIgz3Bqq9praKvK3CA2\\\"},\\\"57e023b9-5069-4650-bf84-e3ddb81b5919\\\":{\\\"documentId\\\":\\\"5pN1vVAa1WunD27FYzuT\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"RIMCrNpuBUP56jRvEklv\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"4.png\\\",\\\"size\\\":67136,\\\"uuid\\\":\\\"57e023b9-5069-4650-bf84-e3ddb81b5919\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/5pN1vVAa1WunD27FYzuT\\\"},\\\"b11f9569-716e-492b-8120-fb058dff2ac8\\\":{\\\"documentId\\\":\\\"LIgfPsXBX7KYUsa1qaSd\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"RIMCrNpuBUP56jRvEklv\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"8b752163b8f78bb83d710f6cd76a79bd.jpg\\\",\\\"size\\\":91089,\\\"uuid\\\":\\\"b11f9569-716e-492b-8120-fb058dff2ac8\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/LIgfPsXBX7KYUsa1qaSd\\\"}}},{\\\"id\\\":\\\"fVUP586kxtPZcZupuXgJ\\\",\\\"value\\\":{\\\"45b2e189-09fb-46f9-8649-f0b07a75c39d\\\":{\\\"documentId\\\":\\\"ekguoZbUjuvbpQonufgF\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"fVUP586kxtPZcZupuXgJ\\\",\\\"mimetype\\\":\\\"image\\\\\\/webp\\\",\\\"originalname\\\":\\\"DALL\\\\u00c2\\\\u00b7E 2025-01-24 05.17.45 - A young man with medium-length dark brown hair styled neatly, fair skin tone, a light beard, and wearing a royal blue sweater. He is sitting in a form.webp\\\",\\\"size\\\":320878,\\\"uuid\\\":\\\"45b2e189-09fb-46f9-8649-f0b07a75c39d\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/ekguoZbUjuvbpQonufgF\\\"},\\\"c4ca33bd-1d62-41ea-b2c3-5a77c5cd91b1\\\":{\\\"documentId\\\":\\\"W61Hj0hKQd99jFbLzfSI\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"fVUP586kxtPZcZupuXgJ\\\",\\\"mimetype\\\":\\\"image\\\\\\/webp\\\",\\\"originalname\\\":\\\"DALL\\\\u00c2\\\\u00b7E 2025-01-24 05.17.45 - A young man with medium-length dark brown hair styled neatly, fair skin tone, a light beard, and wearing a royal blue sweater. He is sitting in a form.webp\\\",\\\"size\\\":320878,\\\"uuid\\\":\\\"c4ca33bd-1d62-41ea-b2c3-5a77c5cd91b1\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/W61Hj0hKQd99jFbLzfSI\\\"}}},{\\\"id\\\":\\\"MJZuH0S9Y9Uj13ontnmx\\\",\\\"value\\\":\\\"Good\\\"},{\\\"id\\\":\\\"0s2GID5UKSM8wH3N3XFL\\\",\\\"value\\\":\\\"G00D\\\"},{\\\"id\\\":\\\"Fvi2ucrJw369esRauBEa\\\",\\\"value\\\":\\\"Safian\\\"},{\\\"id\\\":\\\"SxNDEocSDZt06XBz3z31\\\",\\\"value\\\":\\\"No\\\"},{\\\"id\\\":\\\"sjFgZaT7bOcf5vRpsEn0\\\",\\\"value\\\":[\\\"Text Message\\\"]},{\\\"id\\\":\\\"LIestdsOCp2BzCM2LUpE\\\",\\\"value\\\":\\\"Option 2\\\"},{\\\"id\\\":\\\"JTEbwupk7rhSj0ynl3BY\\\",\\\"value\\\":[\\\"Green\\\"]},{\\\"id\\\":\\\"rvAfD5pkL08UCFTVsWK2\\\",\\\"value\\\":[\\\"Other\\\"]},{\\\"id\\\":\\\"YLPlock5OsY261wOoK4G\\\",\\\"value\\\":\\\"Green\\\"},{\\\"id\\\":\\\"sIbKV76KUgW20i5GLXtj\\\",\\\"value\\\":\\\"Week of September 30-October 4\\\"},{\\\"id\\\":\\\"Ug0Uotax0c9OvgWcLWFN\\\",\\\"value\\\":[\\\"Pool Closing Complete (Esp. if plaster is under 4 years of age) $45\\\\\\/\\\\u200b25,000 gallons\\\"]},{\\\"id\\\":\\\"yIIBkne31DDn65tCBU6Q\\\",\\\"value\\\":{\\\"8011cfb5-1689-4d9b-b3da-11d8635ad59e\\\":{\\\"documentId\\\":\\\"e2KtnPDkbSeXo41QKFJy\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"yIIBkne31DDn65tCBU6Q\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"4.png\\\",\\\"size\\\":67136,\\\"uuid\\\":\\\"8011cfb5-1689-4d9b-b3da-11d8635ad59e\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/e2KtnPDkbSeXo41QKFJy\\\"}}}]\"', '2025-04-09 21:41:10', NULL, '2021-02-03', NULL, 'workingwhat', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(413, 'VIcKptPOMQeUPUXqTRmg', '8gm7q9rR8M1dcm9kMsiq', 'dummy contact', NULL, '+12262401530', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"faraz,fake\"', 0, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Dummy\\\"}]\"', '2025-05-21 20:09:37', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(414, 't0KSsZYwEbXVNXhNxMZT', '8gm7q9rR8M1dcm9kMsiq', 'asas jhgjhfghg', 'fhgfgh@gmail.com', '+190798798', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-04-24 22:18:20', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(415, 'rOUEEyPblUbxeI2VgYhU', '8gm7q9rR8M1dcm9kMsiq', NULL, NULL, NULL, NULL, 'PK', NULL, 'refrral lead', 'ContactUpdate', NULL, NULL, '\"invoice sent,faraz,fake,second years\"', NULL, '\"[{\\\"id\\\":\\\"aU21j46DLrdz9DwDCQBW\\\",\\\"value\\\":\\\"umair\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"laravel@gmial.com\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 17:55:28', NULL, NULL, NULL, NULL, '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(416, 'uQh6HaE6FKEZVg5R2QzZ', '8gm7q9rR8M1dcm9kMsiq', 'haleem kumar', 'akumari@gmail.com', '+929873543535', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-04-03 22:36:51', NULL, NULL, NULL, NULL, '2025-11-03 20:23:20', '2025-11-03 20:23:20'),
(417, 'mqu39DMwAZXEMquz6QmD', '8gm7q9rR8M1dcm9kMsiq', 'cruise dena', 'cruise@gmail.com', '+923104101221', NULL, 'PK', NULL, 'basit-appointment-form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"zalim khan\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"zlm@gmail.com\\\"}]\"', '2025-03-19 17:01:42', NULL, NULL, NULL, NULL, '2025-11-03 20:23:20', '2025-11-03 20:23:20'),
(418, 'UhinQscvSo88yqU0zx20', '8gm7q9rR8M1dcm9kMsiq', 'Lamar Aguilar', 'pamuxut@mailinator.com', '+923018943278', 'Ea consequatur minu', 'PK', 'Non voluptatum et oc', 'agentsly test', 'ContactUpdate', 'Donovan', NULL, '\"ai bot,anwar,auto caller\"', 0, '\"[{\\\"id\\\":\\\"t0Ah7XGVVi6ax4rFcKHz\\\",\\\"value\\\":\\\"Vel dignissimos quas\\\"},{\\\"id\\\":\\\"1VMs6pqStQRJKgI0RAW5\\\",\\\"value\\\":\\\"Necessitatibus amet\\\"},{\\\"id\\\":\\\"KlNqknlZInzv62ZDtCwJ\\\",\\\"value\\\":\\\"Delectus fuga Inci\\\"},{\\\"id\\\":\\\"uoAatJ2e0ECrld7jg39k\\\",\\\"value\\\":\\\"Minus perspiciatis\\\"},{\\\"id\\\":\\\"pAvjaOFOUTqxwTIXmdKD\\\",\\\"value\\\":\\\"Quia molestias iste\\\"},{\\\"id\\\":\\\"jzWubfSogBllKiFtWw0A\\\",\\\"value\\\":\\\"Aspernatur adipisici\\\"},{\\\"id\\\":\\\"MXVJAA5V6OUN3TRCro5N\\\",\\\"value\\\":\\\"Aut voluptatem Dese\\\"},{\\\"id\\\":\\\"vJvBp4b9sddUoNnJtCoT\\\",\\\"value\\\":[\\\"Influencer Marketing\\\",\\\"Marketing Automation\\\",\\\"Other\\\"]},{\\\"id\\\":\\\"lI0DeMY1f670qJ6hWxEy\\\",\\\"value\\\":\\\"Et sit eos quibusda\\\"},{\\\"id\\\":\\\"o5LWw9ce8jCu3x8aQ1Ug\\\",\\\"value\\\":\\\"Illum culpa adipis\\\"},{\\\"id\\\":\\\"eCLbHxuIC9XrO5AxvJYH\\\",\\\"value\\\":\\\"Quae et vitae aut iu\\\"},{\\\"id\\\":\\\"oHIDMZopu8DAVy04KhPD\\\",\\\"value\\\":\\\"Omnis pariatur Sed\\\"},{\\\"id\\\":\\\"1iKZsIVa3DPIrRVTRx2z\\\",\\\"value\\\":\\\"Assumenda exercitati\\\"}]\"', '2024-11-14 16:26:18', NULL, '1994-12-10', NULL, 'Dolorem ducimus del', '2025-11-03 20:23:48', '2025-11-03 20:23:48'),
(419, 'tibyinb4Ry6ry3HRM765', '8gm7q9rR8M1dcm9kMsiq', 'hussain talat', 'hussain@gmail.com', '+923495678321', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Hussain\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 15:15:29', NULL, NULL, NULL, NULL, '2025-11-03 20:33:29', '2025-11-03 20:33:29'),
(420, 'yh4khenqwAmDki5ne20u', '8gm7q9rR8M1dcm9kMsiq', 'shah gai', 'shahgi@gmail.com', '+9217876767654', 'PK', 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"appiontment test\"', NULL, '\"[]\"', '2025-04-24 22:23:21', NULL, NULL, NULL, NULL, '2025-11-03 20:33:35', '2025-11-03 20:33:35'),
(421, 'gKHgdoglNDzPt4ceGMzr', '8gm7q9rR8M1dcm9kMsiq', 'Bin ameen', 'ameen@gmail.com', '+923145677788', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-18 18:33:12', NULL, NULL, NULL, NULL, '2025-11-03 20:34:03', '2025-11-03 20:34:03'),
(422, 'IvCq8DXi3uH7D8NEEwcT', '8gm7q9rR8M1dcm9kMsiq', 'firstlast khan', 'jabirkhan@xortlogix.com', '+923182334568', 'Texas', 'BS', 'TEXAS', 'survey 31', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"CnxlHqtFa7mfmCGd4IHy\\\",\\\"value\\\":\\\"no\\\"},{\\\"id\\\":\\\"AY3TxpfLXpFEF6R0KD0P\\\",\\\"value\\\":\\\"Male\\\"},{\\\"id\\\":\\\"6N7a2LxuH8T23aA7fscZ\\\",\\\"value\\\":\\\"No\\\"},{\\\"id\\\":\\\"nmaLDHS4GXDqhb2LUqv4\\\",\\\"value\\\":\\\"16000$\\\"},{\\\"id\\\":\\\"zAIKFB7vJKyUEWzaaXmo\\\",\\\"value\\\":\\\"female\\\"},{\\\"id\\\":\\\"zSwIAfWJoMONGrL4tw0d\\\",\\\"value\\\":\\\"09\\\\\\/09\\\\\\/1980\\\"},{\\\"id\\\":\\\"YsxBx3WfPPHWWfJC0UZ7\\\",\\\"value\\\":\\\"AIAMAN\\\"},{\\\"id\\\":\\\"fhoQeLZqccgsASenAPQg\\\",\\\"value\\\":\\\"KHAN\\\"},{\\\"id\\\":\\\"wjQKOoXuAonjvyLQDvXY\\\",\\\"value\\\":\\\"Premera Blue Cross Preferred Silver 4500\\\"},{\\\"id\\\":\\\"JvFDLOOu2regyJeXS1wc\\\",\\\"value\\\":\\\"PPO - Silver\\\"},{\\\"id\\\":\\\"MeQO0M2p0rWo2iTPaeql\\\",\\\"value\\\":\\\"Premera Blue Cross Blue Shield of Alaska\\\"},{\\\"id\\\":\\\"aE4WQzaV4oG0DAiYgDY4\\\",\\\"value\\\":\\\"38344AK1060002\\\"},{\\\"id\\\":\\\"U2iPyYKFGH984x1pwqon\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.premera.com\\\\\\/documents\\\\\\/031112_2025.pdf\\\"},{\\\"id\\\":\\\"y46ReZeqlpfc75rPxQji\\\",\\\"value\\\":\\\"1096\\\"},{\\\"id\\\":\\\"lX10yfyZsnwcAKRhfCWn\\\",\\\"value\\\":\\\"38344AK1100002\\\"},{\\\"id\\\":\\\"WcA9K33Wf2uCxOSeA2R6\\\",\\\"value\\\":\\\"Silver S: Aetna network + $0 walk-in clinic + $0 CVS Health Virtual Care 24\\\\\\/7\\\"},{\\\"id\\\":\\\"eFi20Zfr9MvJ2zPTHKu8\\\",\\\"value\\\":\\\"PPO\\\"},{\\\"id\\\":\\\"ff7Y9MYy0xTGvTbLRvek\\\",\\\"value\\\":\\\"Premera Blue Cross Blue Shield of Alaska\\\"},{\\\"id\\\":\\\"KHdZci9z5gRHMEA7kWVm\\\",\\\"value\\\":\\\"0.01\\\"},{\\\"id\\\":\\\"k5k0LnUxneqhDjzd7MUs\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.premera.com\\\\\\/documents\\\\\\/031040_2025.pdf\\\"},{\\\"id\\\":\\\"VvLUmqZCSWQ3gJj5LMeu\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.premera.com\\\\\\/documents\\\\\\/059177_2025.pdf\\\"},{\\\"id\\\":\\\"W5hteQhzJ4qJmbT7ZEQ5\\\",\\\"value\\\":\\\"38344AK1070002\\\"},{\\\"id\\\":\\\"qoWsy62S8hsTCjPat9JT\\\",\\\"value\\\":\\\"Premera Blue Cross Preferred Bronze 5800 HSA\\\"},{\\\"id\\\":\\\"aJtH0i31pNUYpIZfdCYz\\\",\\\"value\\\":\\\"Premera Blue Cross Blue Shield of Alaska\\\"},{\\\"id\\\":\\\"qqZDk472GHqo0jW3dZu6\\\",\\\"value\\\":\\\"725\\\"},{\\\"id\\\":\\\"XCnT0s5Nm4xmEOUPndcN\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.premera.com\\\\\\/documents\\\\\\/045646_2025.pdf\\\"},{\\\"id\\\":\\\"hLykupW4diXbbXjNS62r\\\",\\\"value\\\":\\\"1990-06-09\\\"},{\\\"id\\\":\\\"YWcgMOlWmF7HHDjHiEZA\\\",\\\"value\\\":{\\\"3d35d3e3-3931-4d7c-8b01-a4c633e6afe8\\\":{\\\"documentId\\\":\\\"pTyYKgJAqfK9dF3e5szy\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"YWcgMOlWmF7HHDjHiEZA\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"plan.png\\\",\\\"size\\\":58483,\\\"uuid\\\":\\\"3d35d3e3-3931-4d7c-8b01-a4c633e6afe8\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/pTyYKgJAqfK9dF3e5szy\\\"}}},{\\\"id\\\":\\\"ZQfnS3XpVVdS6HJUDN3b\\\",\\\"value\\\":\\\"Male\\\"},{\\\"id\\\":\\\"LW1zygASHfSFnD6w7Cqc\\\",\\\"value\\\":\\\"Option 1\\\"},{\\\"id\\\":\\\"1jNSUkATqR7vkPHvBm0G\\\",\\\"value\\\":\\\"Married\\\"},{\\\"id\\\":\\\"YxJtXhmOM58siQa6sdEi\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.premera.com\\\\\\/documents\\\\\\/045635_2025.pdf\\\"},{\\\"id\\\":\\\"RAARbahqYRFMeamwisov\\\",\\\"value\\\":\\\"https:\\\\\\/\\\\\\/www.premera.com\\\\\\/documents\\\\\\/031112_2025.pdf\\\"},{\\\"id\\\":\\\"hlW4WO9tCRPX8Yavu0Ou\\\",\\\"value\\\":{\\\"06caf8cf-892f-47d8-b455-e9a3c34bdfef\\\":{\\\"documentId\\\":\\\"kpAsByJOP5YsK5Vtxvam\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"hlW4WO9tCRPX8Yavu0Ou\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"plan.png\\\",\\\"size\\\":58552,\\\"uuid\\\":\\\"06caf8cf-892f-47d8-b455-e9a3c34bdfef\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/kpAsByJOP5YsK5Vtxvam\\\"}}},{\\\"id\\\":\\\"QKaJ0GhrpejQUOMIQiH3\\\",\\\"value\\\":\\\"Option 2\\\"},{\\\"id\\\":\\\"a43OS4FmxdCbWtqbtjd4\\\",\\\"value\\\":{\\\"4d76a957-94b8-4c95-bee8-f54bc01d31ce\\\":{\\\"documentId\\\":\\\"MoQW7tdPyk0kUhwGimCe\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"a43OS4FmxdCbWtqbtjd4\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"plan.png\\\",\\\"size\\\":65956,\\\"uuid\\\":\\\"4d76a957-94b8-4c95-bee8-f54bc01d31ce\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/MoQW7tdPyk0kUhwGimCe\\\"}}},{\\\"id\\\":\\\"9AEWVW3NQ3pMvQq7kzjZ\\\",\\\"value\\\":\\\"03825456677\\\"}]\"', '2025-06-26 15:44:03', NULL, '1986-07-13', NULL, '77591', '2025-11-03 20:34:54', '2025-11-03 20:34:54'),
(423, 'Zve6qTJlcYRX7qXKKKkh', '8gm7q9rR8M1dcm9kMsiq', 'John Doe', 'john.doe@example.com', '+123456789', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-24 20:18:58', NULL, NULL, NULL, NULL, '2025-11-03 20:34:54', '2025-11-03 20:34:54'),
(424, 'VxZIXUEKrL8GzlWgNvI7', '8gm7q9rR8M1dcm9kMsiq', 'newContact jabir', 'un123@gmail.com', '+92980398834', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-04-25 20:43:33', NULL, NULL, NULL, NULL, '2025-11-03 20:34:57', '2025-11-03 20:34:57'),
(425, 'H7OG1ytuuXLBLLr1DSB3', '8gm7q9rR8M1dcm9kMsiq', 'mayoo khan', 'kus@example.com', '+9218707890098', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-25 19:43:24', NULL, NULL, NULL, NULL, '2025-11-03 20:35:00', '2025-11-03 20:35:00'),
(426, '3fcWFFcch6PsOcXKV21J', '8gm7q9rR8M1dcm9kMsiq', 'qudratulain bemar', 'qudratulain@gmail.com', '+923104123456', NULL, 'PK', NULL, 'basit-appointment-form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"Dilip Kumar\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"dlip@gmail.com\\\"}]\"', '2025-03-19 17:05:15', NULL, NULL, NULL, NULL, '2025-11-03 20:35:02', '2025-11-03 20:35:02'),
(427, '3TfAQG0QYx8MshXylSsj', '8gm7q9rR8M1dcm9kMsiq', 'Pola Hafiz', 'pola@gmail.com', '+923893543535', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-21 17:34:38', NULL, NULL, NULL, NULL, '2025-11-03 20:35:02', '2025-11-03 20:35:02'),
(428, 'erChh5IDoECyiZ4oEyrB', '8gm7q9rR8M1dcm9kMsiq', 'aditya kapoor', 'aditya@gmail.com', '+923109878787', NULL, 'PK', NULL, 'basit-appointment-form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"Arsalan Khan\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"arsalan@gmail.com\\\"},{\\\"id\\\":\\\"tZw4Bq0PEmhMxPs6CRB3\\\",\\\"value\\\":923103454334}]\"', '2025-03-19 16:19:05', NULL, NULL, NULL, NULL, '2025-11-03 20:35:02', '2025-11-03 20:35:02'),
(429, 'GNGzft7v7ycC2TDxsdpl', '8gm7q9rR8M1dcm9kMsiq', 'klaesen tresen', 'klasen@gmail.com', '+92835435359', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-21 17:46:10', NULL, NULL, NULL, NULL, '2025-11-03 20:35:05', '2025-11-03 20:35:05'),
(430, 'F5JVTTJZsd1NH0Ittgp4', '8gm7q9rR8M1dcm9kMsiq', 'saleem malik', 'malik@gmail.com', '+130189543278', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-04-24 20:58:25', NULL, NULL, NULL, NULL, '2025-11-03 20:35:05', '2025-11-03 20:35:05'),
(431, 'og6yJSc4OFFRqu6EQ9CB', '8gm7q9rR8M1dcm9kMsiq', 'Sultidhah Shah', 'sul@gmial.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"faraz,invoice sent,second years,fake\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Sultidhah\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":16},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-19 18:22:33', NULL, NULL, NULL, NULL, '2025-11-03 20:35:05', '2025-11-03 20:35:05'),
(432, 'FqbirmoJfuZOatTVku1w', '8gm7q9rR8M1dcm9kMsiq', 'akil hussain', 'akki@gmail.com', '+923343543535', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-20 17:37:51', NULL, NULL, NULL, NULL, '2025-11-03 20:35:07', '2025-11-03 20:35:07'),
(433, 'BWmmn8BQaJxK3jeMtESM', '8gm7q9rR8M1dcm9kMsiq', 'Rocket Singh', 'rk@gmail.com', '+923123543509', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-20 18:53:44', NULL, NULL, NULL, NULL, '2025-11-03 20:35:07', '2025-11-03 20:35:07'),
(434, 'L0jRUag5WGxQ8p2ufXoQ', '8gm7q9rR8M1dcm9kMsiq', 'asass ssss', 'kuchsssskoolshahxortlogix@gmail.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"ahmad\"', 0, '\"[{\\\"id\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"value\\\":{\\\"3d330945-6105-429e-a019-2a670aed1bdc\\\":{\\\"documentId\\\":\\\"B90WXNoJSGlExMQglDYh\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"morskie-oko-tatry.jpg\\\",\\\"size\\\":21289688,\\\"uuid\\\":\\\"3d330945-6105-429e-a019-2a670aed1bdc\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/B90WXNoJSGlExMQglDYh\\\"},\\\"5931a0d2-9071-4488-a8f2-52003912c70e\\\":{\\\"documentId\\\":\\\"tjfomkJKSqyUX0ifzg1Q\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"luca-severin-BYAq1Nvr8dk-unsplash.jpg\\\",\\\"size\\\":3526642,\\\"uuid\\\":\\\"5931a0d2-9071-4488-a8f2-52003912c70e\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/tjfomkJKSqyUX0ifzg1Q\\\"},\\\"cff98375-ae75-4749-839e-511ce90ae0ed\\\":{\\\"documentId\\\":\\\"WYwzTIEXZWlTfhcZarR5\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"beautiful-wooden-pathway-going-breathtaking-colorful-trees-forest.jpg\\\",\\\"size\\\":13378226,\\\"uuid\\\":\\\"cff98375-ae75-4749-839e-511ce90ae0ed\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/WYwzTIEXZWlTfhcZarR5\\\"}}}]\"', '2025-04-25 20:51:34', NULL, '2000-01-11', NULL, NULL, '2025-11-03 20:35:08', '2025-11-03 20:35:08'),
(435, 'Trb0tN5fU4frkuusPo1y', '8gm7q9rR8M1dcm9kMsiq', 'Kasper Flores', 'tohy@mailinator.com', '+92434556565659', 'Velit ea debitis fug', 'PK', 'Asperiores ad ea ame', 'user-information get', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"01auvpbxPefyL32kljSz\\\",\\\"value\\\":\\\"Natus quas qui in ea\\\"},{\\\"id\\\":\\\"Dv5JAlBWGUOg8yta61RL\\\",\\\"value\\\":\\\"Mollit doloribus tem\\\"},{\\\"id\\\":\\\"jdSZlAruM9EImZtcmqF3\\\",\\\"value\\\":\\\"SHAYAN\\\"},{\\\"id\\\":\\\"prrCShQqW4h6e0508fw9\\\",\\\"value\\\":\\\"ZOHAIB\\\"},{\\\"id\\\":\\\"qmGInakZxHD1SqmyN89t\\\",\\\"value\\\":\\\"Frequent absenteeism\\\"},{\\\"id\\\":\\\"rgDRlr2D2KmOgQz7b1gv\\\",\\\"value\\\":\\\"Roof inspection\\\"},{\\\"id\\\":\\\"sRUVvHlrBHpAV965dRDg\\\",\\\"value\\\":\\\"Architecto et laboru\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"kuchkoolshahxortlogix@gmail.com\\\"},{\\\"id\\\":\\\"csLF8fjus3cSKyz4bdQx\\\",\\\"value\\\":\\\"Male\\\"},{\\\"id\\\":\\\"mv7gxEvlx2xJs2qpKTVQ\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"eHyif44u5mfcvmBcZ9oX\\\",\\\"value\\\":90},{\\\"id\\\":\\\"JvEEoAZcIAVx7yotH0Bb\\\",\\\"value\\\":{\\\"4d1e6b97-8edd-4213-98c5-836ed07d2780\\\":{\\\"documentId\\\":\\\"dQmd8rrHI00tHrATdvMQ\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"JvEEoAZcIAVx7yotH0Bb\\\",\\\"mimetype\\\":\\\"image\\\\\\/webp\\\",\\\"originalname\\\":\\\"2025-08-25.webp\\\",\\\"size\\\":47720,\\\"uuid\\\":\\\"4d1e6b97-8edd-4213-98c5-836ed07d2780\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/dQmd8rrHI00tHrATdvMQ\\\"}}},{\\\"id\\\":\\\"D0vBolwPLqDWOsKEmSx1\\\",\\\"value\\\":{\\\"documentId\\\":\\\"prJsxJDWiiyLxkOPqzzD\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"D0vBolwPLqDWOsKEmSx1\\\",\\\"isSignature\\\":true,\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"sign-timestamp-1758661295.png\\\",\\\"size\\\":5273,\\\"timestamp\\\":\\\"1758661295\\\",\\\"uuid\\\":\\\"da495954-6472-479b-b287-77bb88231adb\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/prJsxJDWiiyLxkOPqzzD\\\"}},{\\\"id\\\":\\\"uoI2YL7dFko0dATzrgc2\\\",\\\"value\\\":{\\\"5125abfd-97b1-42a4-8658-11beb458aaad\\\":{\\\"documentId\\\":\\\"M1vLEOtxbVcLlfSk9jXt\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"uoI2YL7dFko0dATzrgc2\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"7dea5015-bc6e-48d6-9ab7-7750af6ab6c0.jpg\\\",\\\"size\\\":38950,\\\"uuid\\\":\\\"5125abfd-97b1-42a4-8658-11beb458aaad\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/M1vLEOtxbVcLlfSk9jXt\\\"}}},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 21:02:23', NULL, '2025-09-09', NULL, 'Minima aperiam ipsa', '2025-11-03 20:35:08', '2025-11-03 20:35:08'),
(436, 'Fgknk4m6bDnTHIilav1S', '8gm7q9rR8M1dcm9kMsiq', 'led', 'genration@gmail.com', '+923457683483', NULL, 'PK', NULL, 'refrral lead', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"aU21j46DLrdz9DwDCQBW\\\",\\\"value\\\":\\\"name\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"concatenation@gmail.com\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 22:02:04', NULL, NULL, NULL, NULL, '2025-11-03 20:35:09', '2025-11-03 20:35:09'),
(437, '4VgTUaPzphcwltXOLXFG', '8gm7q9rR8M1dcm9kMsiq', 'heer veer', 'heer@gmail.com', '+923673543535', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-21 17:44:15', NULL, NULL, NULL, NULL, '2025-11-03 20:35:09', '2025-11-03 20:35:09'),
(438, 'ZS6b3K50FMtdqdqETxPY', '8gm7q9rR8M1dcm9kMsiq', 'Sajjad Ahmad', 'sajjadahmad32548@gmail.com', '+923446920204', 'test', 'PK', 'test', 'appiontment confirmation', 'ContactUpdate', 'test', NULL, '\"dialtag\"', NULL, '\"[{\\\"id\\\":\\\"mfOrKV5I7foRkDENobQ3\\\",\\\"value\\\":\\\"it\\\"},{\\\"id\\\":\\\"Dv5JAlBWGUOg8yta61RL\\\",\\\"value\\\":\\\"dev\\\"},{\\\"id\\\":\\\"sRUVvHlrBHpAV965dRDg\\\",\\\"value\\\":\\\"isb\\\"},{\\\"id\\\":\\\"JVCEDgNzf92G84ceLxTm\\\",\\\"value\\\":\\\"hello\\\"},{\\\"id\\\":\\\"rgDRlr2D2KmOgQz7b1gv\\\",\\\"value\\\":\\\"Roof installation\\\"},{\\\"id\\\":\\\"CnVAxbmqcO1c2E39wTmO\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"0djZi35DU8M8GDggjl29\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"QjT4WmF8xGJrAFzcAvQ8\\\",\\\"value\\\":\\\"Roof Repair\\\"},{\\\"id\\\":\\\"RLT6TZygg2w70WR9Z0XH\\\",\\\"value\\\":-1},{\\\"id\\\":\\\"JvEEoAZcIAVx7yotH0Bb\\\",\\\"value\\\":{\\\"1554b5cd-e6d0-496a-8745-fe6cfa19bcfd\\\":{\\\"documentId\\\":\\\"6OAoYszpCcONMEkBgb52\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"JvEEoAZcIAVx7yotH0Bb\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"2.png\\\",\\\"size\\\":67139,\\\"uuid\\\":\\\"1554b5cd-e6d0-496a-8745-fe6cfa19bcfd\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/6OAoYszpCcONMEkBgb52\\\"}}},{\\\"id\\\":\\\"2gBHT7ASjmrgGPsS9RFB\\\",\\\"value\\\":-1},{\\\"id\\\":\\\"V83H1kfq4EAFx9Fa8UQ0\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"r2bW9WxhiPDMgngfhXiE\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"c4PtZNdHb0uf5fKs3fIR\\\",\\\"value\\\":{\\\"04186e48-e7c0-4116-8d63-6db91d6f2ce0\\\":\\\"test\\\",\\\"8db5ca89-2c8a-42b8-bcd4-14ed8a6381b2\\\":\\\"test\\\"}},{\\\"id\\\":\\\"D7ZZrIYfXvkw4t6BCmQx\\\",\\\"value\\\":-1},{\\\"id\\\":\\\"Sp5JWz2vdjEkavCzDeLE\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"RnJIhYBNpHCDC4iIemtL\\\",\\\"value\\\":0},{\\\"id\\\":\\\"KdhBougPpXkTTg24bjbm\\\",\\\"value\\\":\\\"not specify\\\"},{\\\"id\\\":\\\"0loIm37ST0bNSreta2FM\\\",\\\"value\\\":[\\\"what is your name\\\"]},{\\\"id\\\":\\\"Nj93JoBsCZaySLOiJqkt\\\",\\\"value\\\":\\\"islamabad\\\"},{\\\"id\\\":\\\"JvjAaT4hlsZsesYhx4nU\\\",\\\"value\\\":[\\\"agree\\\"]},{\\\"id\\\":\\\"yIIBkne31DDn65tCBU6Q\\\",\\\"value\\\":{\\\"efaa51ac-055d-43c7-8cb7-c52463f054d5\\\":{\\\"documentId\\\":\\\"xVu9qDqjNMEGZgpJZfvt\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"yIIBkne31DDn65tCBU6Q\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"4.png\\\",\\\"size\\\":67136,\\\"uuid\\\":\\\"efaa51ac-055d-43c7-8cb7-c52463f054d5\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/xVu9qDqjNMEGZgpJZfvt\\\"}}},{\\\"id\\\":\\\"o1NsWg00nvKc7aX7tNLF\\\",\\\"value\\\":\\\"GO HIGH LEVEL\\\"},{\\\"id\\\":\\\"pGgET29ltkNcQNbhZAfa\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"aHdMR4NB1nAlTv3VPQsg\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"cl8CpvZWjaQGJToVfiMH\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"HjdMYGP9bwxkoW9gGie4\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"jdSZlAruM9EImZtcmqF3\\\",\\\"value\\\":\\\"FARAZ\\\"},{\\\"id\\\":\\\"prrCShQqW4h6e0508fw9\\\",\\\"value\\\":\\\"ZOHAIB\\\"},{\\\"id\\\":\\\"PimimJvf7FrlE9kjretT\\\",\\\"value\\\":\\\"ANWAR\\\"},{\\\"id\\\":\\\"qmGInakZxHD1SqmyN89t\\\",\\\"value\\\":\\\"Poor teamwork and collaboration\\\"},{\\\"id\\\":\\\"Nox5dz4yc6es0GVXV4HG\\\",\\\"value\\\":\\\"Not effective\\\"},{\\\"id\\\":\\\"Io3QzJQU2Y8M418OO9le\\\",\\\"value\\\":\\\"Consistently high quality\\\"},{\\\"id\\\":\\\"0ZFNxwwOF8Es2qbcVjOh\\\",\\\"value\\\":\\\"Not effective\\\"},{\\\"id\\\":\\\"OdRwdax2gJaITFBnhtFV\\\",\\\"value\\\":\\\"Often low quality\\\"},{\\\"id\\\":\\\"bRDKdCoxR5IJvFmZgJ2H\\\",\\\"value\\\":\\\"Not effective\\\"},{\\\"id\\\":\\\"qW8jjvq6uzmScDn27gin\\\",\\\"value\\\":\\\"Consistently high quality\\\"},{\\\"id\\\":\\\"JJg5iIiIQlnxFNUVEZrY\\\",\\\"value\\\":\\\"roof\\\"},{\\\"id\\\":\\\"mZHp1ye1QXmYnSG63kzW\\\",\\\"value\\\":\\\"roof top repair\\\"},{\\\"id\\\":\\\"sgQ4pmfXFe1UO3V7a55d\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"ZJ8wrcZl29oIc5tSI3Et\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"AY3TxpfLXpFEF6R0KD0P\\\",\\\"value\\\":\\\"Female\\\"},{\\\"id\\\":\\\"NdVTgspOD13eG8Dv49kB\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"EUAtx7UakmA8eRLAnJJL\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"eyLx9UzkYc48Z59vYyKk\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"3kwEbSKdpd4KqRLFetNV\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"OjK5XIUAcufewgj6nbbs\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"1jNSUkATqR7vkPHvBm0G\\\",\\\"value\\\":\\\"UN Married\\\"},{\\\"id\\\":\\\"RHvA0au2F37ksNP254ne\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"hL3w079gMaA5MKEkYDza\\\",\\\"value\\\":\\\"Hybird\\\"},{\\\"id\\\":\\\"839Q1E1AN0Ztn5x3cn6o\\\",\\\"value\\\":{\\\"90906d2c-9054-4318-a6ee-e7252468d6a6\\\":{\\\"documentId\\\":\\\"N7e1aJd6HIoYz5CAu50Y\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"839Q1E1AN0Ztn5x3cn6o\\\",\\\"mimetype\\\":\\\"application\\\\\\/pdf\\\",\\\"originalname\\\":\\\"Beta121_First_30_Fields_Data.pdf\\\",\\\"size\\\":4850,\\\"uuid\\\":\\\"90906d2c-9054-4318-a6ee-e7252468d6a6\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/N7e1aJd6HIoYz5CAu50Y\\\"}}},{\\\"id\\\":\\\"2Jezhg13cWRnV3Gf4HcQ\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"Erik6MnPKzKDvFQsCl9z\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"gA41SOVzyxUcVpklg0Cp\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"s2ERuQmRfAEbo6bISFUG\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"rSMdCAymbTin3vGv3UxK\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"wRaTkkshobzga2gvbRga\\\",\\\"value\\\":{\\\"6b415499-d9fd-49ff-b5e0-1ecc766e4ce9\\\":{\\\"documentId\\\":\\\"X9dGfpi4hbDs7uqLjunV\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"wRaTkkshobzga2gvbRga\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"default-firstframe.jpg\\\",\\\"size\\\":74643,\\\"uuid\\\":\\\"6b415499-d9fd-49ff-b5e0-1ecc766e4ce9\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/X9dGfpi4hbDs7uqLjunV\\\"}}},{\\\"id\\\":\\\"smjJJVe9MDyHhK3WKzCp\\\",\\\"value\\\":{\\\"5d039c0a-332f-46ca-9590-a5a1725b3fb3\\\":{\\\"documentId\\\":\\\"9CSSnIkwqitTFGbAEasq\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"smjJJVe9MDyHhK3WKzCp\\\",\\\"mimetype\\\":\\\"image\\\\\\/jpeg\\\",\\\"originalname\\\":\\\"pexels-shvetsa-3986999.jpg\\\",\\\"size\\\":2628734,\\\"uuid\\\":\\\"5d039c0a-332f-46ca-9590-a5a1725b3fb3\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/9CSSnIkwqitTFGbAEasq\\\"}}},{\\\"id\\\":\\\"kKwxQhD7eVyeO7dtT6jg\\\",\\\"value\\\":{\\\"7ec18fd9-3959-4191-8d2f-c8073a0206ab\\\":{\\\"documentId\\\":\\\"eJKvd3sE8TUeUdEkwjPi\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"kKwxQhD7eVyeO7dtT6jg\\\",\\\"mimetype\\\":\\\"application\\\\\\/pdf\\\",\\\"originalname\\\":\\\"first_30_custom_fields (2).pdf\\\",\\\"size\\\":8009,\\\"uuid\\\":\\\"7ec18fd9-3959-4191-8d2f-c8073a0206ab\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/eJKvd3sE8TUeUdEkwjPi\\\"}}},{\\\"id\\\":\\\"EyQ54Nu15yWegjqJNYAg\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"JHnoTrnxuQC2p1akeLYl\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"hrSwX2MbeTsGcwCko9Ol\\\",\\\"value\\\":\\\"Equal or Greater than 18\\\"},{\\\"id\\\":\\\"aMHs7CO4fr3un7vqahuA\\\",\\\"value\\\":\\\"Less than 2 years\\\"},{\\\"id\\\":\\\"3YIpMTyY9H4h7LysS41R\\\",\\\"value\\\":\\\"Less than 2 years\\\"},{\\\"id\\\":\\\"fgBoOm52gJTh1NwAfi8H\\\",\\\"value\\\":\\\"Under Graduation\\\"},{\\\"id\\\":\\\"MJZuH0S9Y9Uj13ontnmx\\\",\\\"value\\\":\\\"Excellent\\\"},{\\\"id\\\":\\\"0s2GID5UKSM8wH3N3XFL\\\",\\\"value\\\":\\\"G00D\\\"},{\\\"id\\\":\\\"Fvi2ucrJw369esRauBEa\\\",\\\"value\\\":\\\"Shayan\\\"},{\\\"id\\\":\\\"ZQfnS3XpVVdS6HJUDN3b\\\",\\\"value\\\":\\\"Male\\\"},{\\\"id\\\":\\\"8eq8SAy4hgErBGXV8Hom\\\",\\\"value\\\":4},{\\\"id\\\":\\\"2UdLV1xq8BqTQsRJTIsD\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"8vXZls57kBzBRy6UgCrE\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"7eg7UtOSNTqe9tAmdQ92\\\",\\\"value\\\":\\\"Married\\\"},{\\\"id\\\":\\\"FeItfXSnbIZ3zGUvyA2v\\\",\\\"value\\\":\\\"Onsite\\\"},{\\\"id\\\":\\\"3v6qVTolgefu0NxXuTzs\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"F1ZohiF4Zlfr4GTlTsKo\\\",\\\"value\\\":-1},{\\\"id\\\":\\\"CPTMkhaSLJuvIkQeBhdo\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"zQLrleqhmhYNo2WFYnhP\\\",\\\"value\\\":[\\\"Planning\\\"]},{\\\"id\\\":\\\"0Eda5XL4oQCrXuF6YjiQ\\\",\\\"value\\\":[\\\"Single-family Home\\\",\\\"Other\\\"]},{\\\"id\\\":\\\"xVuEos4AYDFEMJuyJOXZ\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"JQHDNfof5onMBxWwC654\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"L52DiWrlHivmjbUKYNX6\\\",\\\"value\\\":[\\\"Email\\\"]},{\\\"id\\\":\\\"t0Ah7XGVVi6ax4rFcKHz\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"ximFpfv7eZ1L0KTThnIO\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"QWzfR31VzKS5WYOvaDOd\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"GNJOE7e6fM3gzGWBmTnF\\\",\\\"value\\\":[\\\"Oil Change\\\"]},{\\\"id\\\":\\\"vdrfrngKa9OWgbJLemMY\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"GyxudMFbspuhYq7Dc4AU\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"SOr2DTPGl4C6Z9HWkyZ2\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"6lYEk6cTdZVibvAAfhw6\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"woJPyuMDzBZrIP2i4gF8\\\",\\\"value\\\":[\\\"Lawn Maintenance\\\"]},{\\\"id\\\":\\\"YrROwgWhEhbwGz1xO16g\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"MyLNhfDLuFm5PZjtHlV1\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"tBb5Aot1lx49ruinCycN\\\",\\\"value\\\":\\\"Within the next three months\\\"},{\\\"id\\\":\\\"1VMs6pqStQRJKgI0RAW5\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"KlNqknlZInzv62ZDtCwJ\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"uoAatJ2e0ECrld7jg39k\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"pAvjaOFOUTqxwTIXmdKD\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"jzWubfSogBllKiFtWw0A\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"ud7OkwvcJXzsW0fELHGd\\\",\\\"value\\\":[\\\"Less than $10,000\\\"]},{\\\"id\\\":\\\"MXVJAA5V6OUN3TRCro5N\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"vJvBp4b9sddUoNnJtCoT\\\",\\\"value\\\":[\\\"Social Media Management\\\"]},{\\\"id\\\":\\\"lI0DeMY1f670qJ6hWxEy\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"o5LWw9ce8jCu3x8aQ1Ug\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"eCLbHxuIC9XrO5AxvJYH\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"oHIDMZopu8DAVy04KhPD\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"1iKZsIVa3DPIrRVTRx2z\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"qoAm3gdNiV8qkLLRTnrJ\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"vypSxOdcLRqtimPDumiI\\\",\\\"value\\\":\\\"No\\\"},{\\\"id\\\":\\\"25rTWxeVUnNsh7thSXdF\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"xzsmGcbIEnYa9foo3rSc\\\",\\\"value\\\":-2},{\\\"id\\\":\\\"Fv3ZrNeMJzbLeyBE0xnu\\\",\\\"value\\\":\\\"singal\\\"},{\\\"id\\\":\\\"Ziseq1SXE7jbphiQvE3s\\\",\\\"value\\\":\\\"2\\\"},{\\\"id\\\":\\\"HciN9JgxJbPWPPIzyWmo\\\",\\\"value\\\":\\\"yes\\\"},{\\\"id\\\":\\\"dj309EqzVHDNDzVSGP41\\\",\\\"value\\\":\\\"Yes\\\"},{\\\"id\\\":\\\"SxNDEocSDZt06XBz3z31\\\",\\\"value\\\":\\\"Yes\\\"},{\\\"id\\\":\\\"qA7qbGdVc5FFJbjpWFQM\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"lOe1eScn4JlNj9r34M71\\\",\\\"value\\\":\\\"Business address\\\"},{\\\"id\\\":\\\"8oeUqdF0lKCOlwt3oYAW\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"zjcXNsEyMlDSpBRhbSai\\\",\\\"value\\\":\\\"Corporation\\\"},{\\\"id\\\":\\\"WirQgwsdn3VXpdHb5ikV\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"bEwrUKHbGbjf2pSoL8BC\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"cBiB31OXBVMOR9GLHr93\\\",\\\"value\\\":\\\"Director\\\"},{\\\"id\\\":\\\"s48PQw0Ieif7e7ka10I8\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"Fu1IqBQmamvzqzzJLqxw\\\",\\\"value\\\":\\\"Home Bin\\\"},{\\\"id\\\":\\\"5n3w6BafW3LbQ7iUX9Bm\\\",\\\"value\\\":\\\"16ft\\\"},{\\\"id\\\":\\\"sjFgZaT7bOcf5vRpsEn0\\\",\\\"value\\\":[\\\"Text Message\\\"]},{\\\"id\\\":\\\"LIestdsOCp2BzCM2LUpE\\\",\\\"value\\\":\\\"Option 3\\\"},{\\\"id\\\":\\\"lotWFFWuXRGBKa9AXwgu\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"5RJQQB6bQSFPQNWX88Jy\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"MKovHwcKiQb2BkyGcjnJ\\\",\\\"value\\\":1},{\\\"id\\\":\\\"DaEL1FFppni5ArGOPeZz\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"lHbbZkVXvz3B4uz2CB3N\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"Pq0iJesb8wQZfXh4DsNF\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"8tUceP217YwaGNhFigkQ\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":-1},{\\\"id\\\":\\\"VAPmiSzU4COdtghXUai2\\\",\\\"value\\\":\\\"Test 2\\\"},{\\\"id\\\":\\\"S5AfbvgUraY7OV1i6z2C\\\",\\\"value\\\":\\\"How many trees need service?\\\"},{\\\"id\\\":\\\"FzrWkRQDwSnzmzngYl06\\\",\\\"value\\\":[\\\"Do you live in Texas?\\\"]},{\\\"id\\\":\\\"UVQt2hhBzgN5nvNlVkVU\\\",\\\"value\\\":\\\"How many trees need service?\\\"},{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"3nYdR13o4GSRziY4cp1c\\\",\\\"value\\\":{\\\"c4ba8e11-ca97-4db3-b49a-94c63412b39d\\\":{\\\"documentId\\\":\\\"GTJrz9wDQPhSsjdggs0i\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"3nYdR13o4GSRziY4cp1c\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"1.png\\\",\\\"size\\\":34167,\\\"uuid\\\":\\\"c4ba8e11-ca97-4db3-b49a-94c63412b39d\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/GTJrz9wDQPhSsjdggs0i\\\"}}},{\\\"id\\\":\\\"gSf6TvdPunOUkcTq2Ryv\\\",\\\"value\\\":\\\"test\\\"},{\\\"id\\\":\\\"ysTWB1v6gDxWsrYHN5TY\\\",\\\"value\\\":\\\"2025-05-01\\\"},{\\\"id\\\":\\\"E3hZZqDzy2PFxR05UcDW\\\",\\\"value\\\":\\\"2025-02-01\\\"},{\\\"id\\\":\\\"9slp0zqxabeEv4et6QQS\\\",\\\"value\\\":\\\"2025-05-07\\\"},{\\\"id\\\":\\\"6wECANXw9WLGO6KB8MUl\\\",\\\"value\\\":\\\"2025-04-01\\\"},{\\\"id\\\":\\\"LGECq4IuICKFzXXywx1R\\\",\\\"value\\\":\\\"2025-04-02\\\"},{\\\"id\\\":\\\"vfHW3UXIvaRWa0ZFrhsx\\\",\\\"value\\\":\\\"2025-02-19\\\"},{\\\"id\\\":\\\"HirlIIGFaBLnGIBzEqMG\\\",\\\"value\\\":\\\"2025-04-16\\\"},{\\\"id\\\":\\\"jEdvH8Wj6XgoK2N5AYmv\\\",\\\"value\\\":\\\"2025-02-05\\\"}]\"', '2025-04-09 21:36:15', NULL, '2021-02-03', NULL, 'test', '2025-11-03 20:35:09', '2025-11-03 20:35:09'),
(439, 'XX3ubFLp7olhPA5VLWHk', '8gm7q9rR8M1dcm9kMsiq', 'jone cena', 'jon@gmail.com', '+923104453234', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-19 16:09:48', NULL, NULL, NULL, NULL, '2025-11-03 20:35:12', '2025-11-03 20:35:12'),
(440, 'O2ZdsNIYNVYuNKvKmGUb', '8gm7q9rR8M1dcm9kMsiq', 'Irure ex id voluptat Voluptatem optio a', 'xikuxyq@mailinator.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"new lead,ahmad,ai bot,bg-orange\"', 0, '\"[]\"', '2025-04-25 20:53:28', NULL, NULL, NULL, NULL, '2025-11-03 20:35:12', '2025-11-03 20:35:12'),
(441, 'dDmigXMhUETuhoupTUvq', '8gm7q9rR8M1dcm9kMsiq', 'first last', 'email@gmail.com', '+92242834835', 'TX', 'AF', 'TEXAS', 'survey 30 : Partial Creation Toggle Enabled', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"JVCEDgNzf92G84ceLxTm\\\",\\\"value\\\":\\\"sdfsafd\\\"}]\"', '2025-07-22 18:19:29', NULL, NULL, NULL, 'dsfgsdg', '2025-11-03 20:35:12', '2025-11-04 22:08:55'),
(442, 'eP4bnB0ajUnzK1N9JCDG', '8gm7q9rR8M1dcm9kMsiq', 'sdfsdf', 'super_admin@gmail.com', '+923422343434', NULL, 'PK', NULL, 'refrral lead', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"aU21j46DLrdz9DwDCQBW\\\",\\\"value\\\":\\\"refrall_lead lead_testing\\\"},{\\\"id\\\":\\\"BoXmm80iOckfjiaOxlMU\\\",\\\"value\\\":\\\"refrral_lead_testing@gmail.com\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 20:49:21', NULL, NULL, NULL, NULL, '2025-11-03 20:35:13', '2025-11-03 20:35:13');
INSERT INTO `contacts` (`id`, `contact_id`, `location_id`, `name`, `email`, `phone`, `state`, `country`, `city`, `source`, `type`, `company`, `assigned_to`, `tags`, `dnd`, `custom_fields`, `date_added`, `date_updated`, `date_of_birth`, `company_id`, `postal_code`, `created_at`, `updated_at`) VALUES
(443, 'oyJ9T0tFbKLKOTCNVh4Q', '8gm7q9rR8M1dcm9kMsiq', 'Jaber khan', 'jaber@gmail.com', '+923444789988', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-20 18:49:42', NULL, NULL, NULL, NULL, '2025-11-03 20:35:13', '2025-11-03 20:35:13'),
(444, 'FuCjW45gXFUZDkGR7FDY', '8gm7q9rR8M1dcm9kMsiq', 'Indigo Cleveland', 'penigyhizu@mailinator.com', '+13456565656', 'US', 'PK', 'Quam sapiente sapien', NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-06-30 21:53:56', NULL, NULL, NULL, 'Officiis sit ab vita', '2025-11-03 20:35:13', '2025-11-03 20:35:13'),
(445, 'U6QzkmPvrMI00ER8JVlb', '8gm7q9rR8M1dcm9kMsiq', 'refrall_lead lead_testing', 'refrral_lead_testing@gmail.com', '+923243443423', NULL, 'PK', NULL, 'contact form', 'ContactUpdate', NULL, NULL, '\"refral,faraz,fake,invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"O8Ebo2BN8sG4XVN0NijQ\\\",\\\"value\\\":\\\"Refrall_lead\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 19:00:18', NULL, NULL, NULL, NULL, '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(446, 'VwtlWXNUOuKHsbiFfSQf', '8gm7q9rR8M1dcm9kMsiq', 'Rosan Deo', 'rosan@deos.com', '+18888888888', 'AL', 'PK', 'Dolomite', NULL, 'ContactUpdate', NULL, NULL, '\"\"', 1, '\"[]\"', '2025-04-24 20:14:12', NULL, NULL, NULL, '35061', '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(447, 'qbU42jtHiMjBHAhrTjZw', '8gm7q9rR8M1dcm9kMsiq', 'Asfandiyar wali', 'wali@gmail.com', '+923443543535', NULL, 'PK', NULL, 'appiontment booked calendar', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-24 21:10:30', NULL, NULL, NULL, NULL, '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(448, 'MHKO0F5SLvMZWA1xMM5F', '8gm7q9rR8M1dcm9kMsiq', NULL, NULL, '+18479287858', 'In cumque ut totam c', 'PK', 'Ut debitis asperiore', 'survey 36', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"F0n1twqjlg9yfDwetzZg\\\",\\\"value\\\":\\\"Option 2\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 21:26:17', NULL, NULL, NULL, 'Voluptatem dolores q', '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(449, 'shsxqxjzqsxfjyeB6glL', '8gm7q9rR8M1dcm9kMsiq', NULL, NULL, NULL, NULL, 'PK', NULL, 'pharmacist survey', 'ContactUpdate', NULL, NULL, '\"invoice sent,faraz,fake,second years\"', NULL, '\"[{\\\"id\\\":\\\"LGZBJuFxN6p4WPOJJcjv\\\",\\\"value\\\":\\\"Albama\\\"},{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":15},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 20:10:08', NULL, NULL, NULL, NULL, '2025-11-03 20:35:16', '2025-11-03 20:35:16'),
(450, 'O8htEY4wqrXb3m7A4KTM', '8gm7q9rR8M1dcm9kMsiq', 'appoit', 'testappoint@gmail.com', '+923567442323', NULL, 'PK', NULL, 'refrral lead', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 21:21:53', NULL, NULL, NULL, NULL, '2025-11-03 20:35:18', '2025-11-03 20:35:18'),
(451, 'd0HR2qKLA1IFhOC0lTjf', '8gm7q9rR8M1dcm9kMsiq', 'Referral Test', 'admin@gmail.com', '+923104101343', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"bg-purple\"', 0, '\"[{\\\"id\\\":\\\"CcWqPDW0gnIOLs1Sleaw\\\",\\\"value\\\":\\\"zalim khan\\\"},{\\\"id\\\":\\\"ys9TwmVAwfydskGIWqFD\\\",\\\"value\\\":\\\"zlm@gmail.com\\\"}]\"', '2025-03-19 16:23:38', NULL, NULL, NULL, NULL, '2025-11-03 20:35:18', '2025-11-03 20:35:18'),
(452, 'UXd6fMZUEajCOvBCJ8wJ', '8gm7q9rR8M1dcm9kMsiq', 'testing', 'refrallead@gmail.com', '+923458569694', NULL, 'PK', NULL, 'refrral lead', 'ContactUpdate', NULL, NULL, '\"invoice sent,second years\"', NULL, '\"[{\\\"id\\\":\\\"xEieyndyEKQirZub49vg\\\",\\\"value\\\":12},{\\\"id\\\":\\\"xGvpXXQAiSnlYOOAzzu5\\\",\\\"value\\\":12}]\"', '2025-09-23 21:15:19', NULL, NULL, NULL, NULL, '2025-11-03 20:35:18', '2025-11-03 20:35:18'),
(453, 'ZX1yVe75BkatRF9r2OHS', '8gm7q9rR8M1dcm9kMsiq', 'Asad11 asassss', 'asadsssshah@gmail.com', '+130189478773278', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-04-24 20:58:25', NULL, NULL, NULL, NULL, '2025-11-03 20:35:18', '2025-11-03 20:35:18'),
(454, 'dkmL7urofzSUVTubVwi3', '8gm7q9rR8M1dcm9kMsiq', 'Brenda Brady', 'vukuha@mailinator.com', '+17876767676', 'BN', 'PK', 'Expedita veniam a e', NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-06-30 21:45:50', NULL, NULL, NULL, 'Eu sed magnam enim a', '2025-11-03 20:35:19', '2025-11-03 20:35:19'),
(455, 'l9b4JDp5aQaa8hg1jov5', '8gm7q9rR8M1dcm9kMsiq', 'shado khan', 'shado@gmail.com', '+923123543535', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-20 17:33:37', NULL, NULL, NULL, NULL, '2025-11-03 20:35:22', '2025-11-03 20:35:22'),
(456, 'Ns2cTzfqXH6dysudaTUm', '8gm7q9rR8M1dcm9kMsiq', 'Quam velit Dolorum illo totam a', 'vumu@mailinator.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"dnd,ahmad\"', 0, '\"[]\"', '2025-04-25 23:58:50', NULL, NULL, NULL, NULL, '2025-11-03 20:35:27', '2025-11-03 20:35:27'),
(457, 'MZubX7cxf9pvQiRu5R9t', '8gm7q9rR8M1dcm9kMsiq', 'tupY JmL', 'tp@gmail.com', '+923443543355', NULL, 'PK', NULL, 'user_form', 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-20 17:40:42', NULL, NULL, NULL, NULL, '2025-11-03 20:35:28', '2025-11-03 20:35:28'),
(458, '1Ugd6TpcimdlOoZTdKVc', '8gm7q9rR8M1dcm9kMsiq', 'kghjgj', 'kachkoolshah@gmail.com', '+929089796686', NULL, 'PK', NULL, 'userinformation35', 'ContactUpdate', NULL, NULL, '\"\"', 0, '\"[]\"', '2025-02-23 01:29:19', NULL, NULL, NULL, NULL, '2025-11-03 20:35:34', '2025-11-03 20:35:34'),
(459, 'AndVfV31Btzgw7MIlw0G', '8gm7q9rR8M1dcm9kMsiq', 'Elit laboriosam Et sint qui sapiente', 'xuwy@mailinator.com', NULL, NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"ahmad,newtag\"', 0, '\"[{\\\"id\\\":\\\"Fv3ZrNeMJzbLeyBE0xnu\\\",\\\"value\\\":\\\"singal\\\"},{\\\"id\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"value\\\":{\\\"5a9dda17-ed9c-482e-a194-e5bb2415478a\\\":{\\\"documentId\\\":\\\"AqXjiQhIgPuFs5r14c8V\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"3.png\\\",\\\"size\\\":47438,\\\"uuid\\\":\\\"5a9dda17-ed9c-482e-a194-e5bb2415478a\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/AqXjiQhIgPuFs5r14c8V\\\"},\\\"5aa61056-f6d1-466e-9b8c-eb5b093ab2d3\\\":{\\\"documentId\\\":\\\"20pUofhNwnyEa8hMohX0\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"2.png\\\",\\\"size\\\":67139,\\\"uuid\\\":\\\"5aa61056-f6d1-466e-9b8c-eb5b093ab2d3\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/20pUofhNwnyEa8hMohX0\\\"},\\\"9a05737e-6bff-4159-a3c6-956ddf1952af\\\":{\\\"documentId\\\":\\\"V2zQHY5XfsbjS6KJG1hq\\\",\\\"meta\\\":{\\\"encoding\\\":\\\"7bit\\\",\\\"fieldname\\\":\\\"wQdjYIufVZCQAzHoh0qF\\\",\\\"mimetype\\\":\\\"image\\\\\\/png\\\",\\\"originalname\\\":\\\"1.png\\\",\\\"size\\\":34167,\\\"uuid\\\":\\\"9a05737e-6bff-4159-a3c6-956ddf1952af\\\"},\\\"url\\\":\\\"https:\\\\\\/\\\\\\/services.leadconnectorhq.com\\\\\\/documents\\\\\\/download\\\\\\/V2zQHY5XfsbjS6KJG1hq\\\"}}}]\"', '2025-04-28 21:11:08', NULL, NULL, NULL, NULL, '2025-11-03 20:35:36', '2025-11-03 20:35:36'),
(460, 'wIEuyegXeYrjevcKDy4Q', '8gm7q9rR8M1dcm9kMsiq', 'khalid usman', 'khalid@example.com', '+123986789', NULL, 'PK', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-03-24 20:27:12', NULL, NULL, NULL, NULL, '2025-11-03 20:35:39', '2025-11-03 20:35:39'),
(461, 'tPvR8pJXNvQprBOqcCbK', 'kiRfOKDyVWVbujuWVIdV', 'Thomas Powell', 'tpmurcon0582@gmail.com', '+13038830180', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"427 Bell rd shawnee ,co,usa, Colorado, 80475\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-04 13:29:26', NULL, NULL, NULL, NULL, '2025-11-04 13:29:28', '2025-11-05 03:54:56'),
(462, 'kSrZMeDPLmZGbvwdG4EL', 'kiRfOKDyVWVbujuWVIdV', 'Finley Beach', 'finleybeach708@gmail.com', '+14234147421', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"307 Warren St, GA, 30741-2990\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-11-04 13:57:27', NULL, NULL, NULL, NULL, '2025-11-04 13:57:29', '2025-11-05 03:54:55'),
(463, 'H0B8MfHHSEj32YMBYt9j', 'kiRfOKDyVWVbujuWVIdV', 'Eva Owens', 'evaowens1951@gmail.com', '+18645652774', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"310 Hillandale Rd Spartanburg D C, S C, 29301\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-04 14:42:34', NULL, NULL, NULL, NULL, '2025-11-04 14:42:36', '2025-11-05 03:54:55'),
(464, 'LNP7vk36R4Wql4LhHKfi', 'kiRfOKDyVWVbujuWVIdV', 'Adrian Dobbs', 'dresautorepair@yahoo.com', '+18045864636', NULL, 'US', NULL, NULL, 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3901 Galena Ave, Hopewell, VA 23860, USA, VA, 23860\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"Within 3 Months\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-04 15:28:18', NULL, NULL, NULL, NULL, '2025-11-04 15:28:23', '2025-11-04 15:28:23'),
(465, '6ARUkATsxHtybsmkhY0W', 'kiRfOKDyVWVbujuWVIdV', 'Carrie Davis', 'carrieudavis@gmail.com', '+12528134923', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"125 Old Barn Lane, N. C., 27804\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-04 18:06:31', NULL, NULL, NULL, NULL, '2025-11-04 18:06:35', '2025-11-05 03:54:55'),
(466, '7eZmGzDsW35iNaEK9OcY', 'kiRfOKDyVWVbujuWVIdV', 'cj thurston', 'carlathurston1970@gmail.com', '+12512526116', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"7880 Sharon Dr, Mobile, AL 36619, USA, AL, 36619\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-04 18:27:44', NULL, NULL, NULL, NULL, '2025-11-04 18:27:46', '2025-11-05 03:54:56'),
(467, 'eRfO67UmKrmzEMCIrUpk', 'kiRfOKDyVWVbujuWVIdV', 'Lance Smith', 'pslindsey86@gmail.com', '+13252135798', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, 'Aj2MHYg7hGlPYViIofn9', '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2629 Obryan Ln, San Angelo, TX 76905, USA, TX, 76905\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Foreclosure\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-04 18:34:32', NULL, NULL, NULL, NULL, '2025-11-04 18:34:34', '2025-11-04 18:34:35'),
(468, '2X4c2ThOmK5cddjG56f4', 'kiRfOKDyVWVbujuWVIdV', 'Quanetta Clementson', 'queenmcknight2023@gmail.com', '+19102000510', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"4032 Cypress Frst Wy, Bolivia, NC 28422, USA, NC, 28422\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Excellent\\\"}]\"', '2025-11-04 18:39:55', NULL, NULL, NULL, NULL, '2025-11-04 18:39:56', '2025-11-05 03:54:55'),
(469, '2L3dQoOP9fr1aS3zaHKh', 'kiRfOKDyVWVbujuWVIdV', 'Robin Kerr', 'redbird8061@gmail.com', '+12103369667', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"8915 Tuscan Hills Dr, Garden Ridge, TX 78266, USA, TX, 78266\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Too Many Repairs\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-04 18:52:14', NULL, NULL, NULL, NULL, '2025-11-04 18:52:16', '2025-11-05 03:54:55'),
(470, 'Apu5MUZFUXdEdWSDrSE9', 'kiRfOKDyVWVbujuWVIdV', 'Toccara Putman', 'toccaraputman@gmail.com', '+19412438932', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"3709 Cedar St, Ellenton, FL 34222, USA, FL, 34222\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"}]\"', '2025-11-04 19:09:15', NULL, NULL, NULL, NULL, '2025-11-04 19:09:16', '2025-11-05 03:54:56'),
(471, '0Ut3FsxR3euF80RXiJoM', 'kiRfOKDyVWVbujuWVIdV', 'Robert Gray', 'robertgrayy217@gmail.com', '+13372001491', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"106 Michelle St, Church Point, LA 70525, USA, LA, 70525\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-04 19:15:24', NULL, NULL, NULL, NULL, '2025-11-04 19:15:26', '2025-11-05 03:54:55'),
(472, 'hjFfKJHPotMUPMUlTnZb', 'kiRfOKDyVWVbujuWVIdV', 'Anthony Schemm', 'schemmbenilda@yahoo.com', '+18434559277', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"473 Cotton Grass Dr, Loris, SC 29569, USA, SC, 29569\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Looking For A Quick Sale\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Poor\\\"}]\"', '2025-11-04 19:19:21', NULL, NULL, NULL, NULL, '2025-11-04 19:19:23', '2025-11-05 03:54:55'),
(473, 'QDmCxpUPAu2hA7IGQKTi', 'kiRfOKDyVWVbujuWVIdV', 'Larry McHale', 'larrysmchale@gmail.com', '+19362861818', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"201 Garrison St, Zavalla, TX 75980, USA, TX, 75980\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Inheritance\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Fair\\\"}]\"', '2025-11-04 19:22:50', NULL, NULL, NULL, NULL, '2025-11-04 19:22:53', '2025-11-05 03:54:56'),
(474, 'q62vmM8qdzF19DooYkw5', 'kiRfOKDyVWVbujuWVIdV', 'Norm Rolf', 'normrolf@gmail.com', '+15136334434', NULL, 'US', NULL, NULL, 'ContactUpdate', NULL, NULL, '\"\"', NULL, '\"[{\\\"id\\\":\\\"1mME48yBnjHXF0sf1lYZ\\\",\\\"value\\\":\\\"2004 Lily Ct, Sanford, FL 32771, USA, FL, 32771\\\"},{\\\"id\\\":\\\"QjYbaWV9ARhisAdHyURR\\\",\\\"value\\\":\\\"Single Family\\\"},{\\\"id\\\":\\\"z8Vuw1uSXKKfViDr3RRJ\\\",\\\"value\\\":\\\"Good\\\"},{\\\"id\\\":\\\"xn15xp58Ts6LlFbhcVQh\\\",\\\"value\\\":\\\"No, It\\\\u2019s Not Listed\\\"},{\\\"id\\\":\\\"pVhTeGGQuKGvAOUBwysi\\\",\\\"value\\\":\\\"ASAP\\\"},{\\\"id\\\":\\\"F9P1ZCSRdzjYZpAqjtee\\\",\\\"value\\\":\\\"Emergency Reason\\\"}]\"', '2025-11-04 20:17:26', NULL, NULL, NULL, NULL, '2025-11-04 20:17:29', '2025-11-05 03:54:56'),
(475, 'Ma8SoWrp6P3YMrkOEcIh', '8gm7q9rR8M1dcm9kMsiq', 'khancontinantal', 'continantal@gmail.com', '+923131433313', NULL, 'PK', NULL, 'Refral Calendar', 'ContactCreate', NULL, NULL, '\"\"', NULL, '\"[]\"', '2025-11-04 22:15:08', NULL, NULL, NULL, NULL, '2025-11-04 22:15:10', '2025-11-04 22:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `contact_custom_fields`
--

CREATE TABLE `contact_custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `custom_field_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_custom_fields`
--

INSERT INTO `contact_custom_fields` (`id`, `location_id`, `value`, `custom_field_id`, `contact_id`, `created_at`, `updated_at`) VALUES
(6, 'kiRfOKDyVWVbujuWVIdV', '219 Saddler Dr, Newport News, VA 23608, USA, VA, 23608', 918, 252, '2025-10-29 18:30:18', '2025-10-29 18:30:18'),
(7, 'kiRfOKDyVWVbujuWVIdV', 'Avoid Realtor Fees', 919, 252, '2025-10-29 18:30:18', '2025-10-29 18:30:18'),
(8, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 252, '2025-10-29 18:30:18', '2025-10-29 18:30:18'),
(9, 'kiRfOKDyVWVbujuWVIdV', 'Within 3 Months', 923, 252, '2025-10-29 18:30:18', '2025-10-29 18:30:18'),
(10, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 252, '2025-10-29 18:30:18', '2025-10-29 18:30:18'),
(11, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 252, '2025-10-29 18:30:18', '2025-10-29 18:30:18'),
(12, 'kiRfOKDyVWVbujuWVIdV', '853 feylers corner rd, Maine, 04572', 918, 253, '2025-10-29 19:35:48', '2025-10-29 19:35:48'),
(13, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 253, '2025-10-29 19:35:48', '2025-10-29 19:35:48'),
(14, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 253, '2025-10-29 19:35:48', '2025-10-29 19:35:48'),
(15, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 253, '2025-10-29 19:35:48', '2025-10-29 19:35:48'),
(16, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 253, '2025-10-29 19:35:48', '2025-10-29 19:35:48'),
(17, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 253, '2025-10-29 19:35:48', '2025-10-29 19:35:48'),
(18, 'kiRfOKDyVWVbujuWVIdV', '313 Chicago Dr, Lamesa, TX 79331, USA, TX, 79331', 918, 254, '2025-10-29 19:41:19', '2025-10-29 19:41:19'),
(19, 'kiRfOKDyVWVbujuWVIdV', 'Divorce', 919, 254, '2025-10-29 19:41:19', '2025-10-29 19:41:19'),
(20, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 254, '2025-10-29 19:41:19', '2025-10-29 19:41:19'),
(21, 'kiRfOKDyVWVbujuWVIdV', 'Within 6 Months', 923, 254, '2025-10-29 19:41:19', '2025-10-29 19:41:19'),
(22, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 254, '2025-10-29 19:41:19', '2025-10-29 19:41:19'),
(23, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 254, '2025-10-29 19:41:19', '2025-10-29 19:41:19'),
(24, 'kiRfOKDyVWVbujuWVIdV', '900 Davella Rd, Debord, KY 41214, USA, KY, 41214', 918, 255, '2025-10-29 20:15:03', '2025-10-29 20:15:03'),
(25, 'kiRfOKDyVWVbujuWVIdV', 'Tired Landlord', 919, 255, '2025-10-29 20:15:03', '2025-10-29 20:15:03'),
(26, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 255, '2025-10-29 20:15:03', '2025-10-29 20:15:03'),
(27, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 255, '2025-10-29 20:15:03', '2025-10-29 20:15:03'),
(28, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 255, '2025-10-29 20:15:03', '2025-10-29 20:15:03'),
(29, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 255, '2025-10-29 20:15:03', '2025-10-29 20:15:03'),
(30, 'kiRfOKDyVWVbujuWVIdV', '8845 NW 130th St, Reddick, FL 32686, USA, FL, 32686', 918, 29, '2025-10-30 12:58:44', '2025-10-30 12:58:44'),
(31, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 29, '2025-10-30 12:58:44', '2025-10-30 12:58:44'),
(32, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 29, '2025-10-30 12:58:44', '2025-10-30 12:58:44'),
(33, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 29, '2025-10-30 12:58:44', '2025-10-30 12:58:44'),
(34, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 29, '2025-10-30 12:58:44', '2025-10-30 12:58:44'),
(35, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 29, '2025-10-30 12:58:44', '2025-10-30 12:58:44'),
(36, 'kiRfOKDyVWVbujuWVIdV', '602 Newhall Dr, Nashville, TN 37206, USA, TN, 37206', 918, 78, '2025-10-30 13:54:49', '2025-10-30 13:54:49'),
(37, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 78, '2025-10-30 13:54:49', '2025-10-30 13:54:49'),
(38, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 78, '2025-10-30 13:54:49', '2025-10-30 13:54:49'),
(39, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 78, '2025-10-30 13:54:49', '2025-10-30 13:54:49'),
(40, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 78, '2025-10-30 13:54:49', '2025-10-30 13:54:49'),
(41, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 78, '2025-10-30 13:54:49', '2025-10-30 13:54:49'),
(42, 'kiRfOKDyVWVbujuWVIdV', '14518 Burleson Bend Drive, Houston, TX 77049, USA, TX, 77049', 918, 257, '2025-10-30 15:44:43', '2025-10-30 15:44:43'),
(43, 'kiRfOKDyVWVbujuWVIdV', 'Divorce', 919, 257, '2025-10-30 15:44:43', '2025-10-30 15:44:43'),
(44, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 257, '2025-10-30 15:44:43', '2025-10-30 15:44:43'),
(45, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 257, '2025-10-30 15:44:43', '2025-10-30 15:44:43'),
(46, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 257, '2025-10-30 15:44:43', '2025-10-30 15:44:43'),
(47, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 257, '2025-10-30 15:44:43', '2025-10-30 15:44:43'),
(48, 'kiRfOKDyVWVbujuWVIdV', '2720 Crow Valley Trail, Plano, TX 75023, USA, TX, 75023', 918, 259, '2025-10-30 17:20:07', '2025-10-30 17:20:07'),
(49, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 259, '2025-10-30 17:20:07', '2025-10-30 17:20:07'),
(50, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 259, '2025-10-30 17:20:07', '2025-10-30 17:20:07'),
(51, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 259, '2025-10-30 17:20:07', '2025-10-30 17:20:07'),
(52, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 259, '2025-10-30 17:20:07', '2025-10-30 17:20:07'),
(53, 'kiRfOKDyVWVbujuWVIdV', 'Poor', 925, 259, '2025-10-30 17:20:07', '2025-10-30 17:20:07'),
(54, 'kiRfOKDyVWVbujuWVIdV', '3301 S 64th St, Fort Smith, AR 72903, USA, AR, 72903', 918, 260, '2025-10-30 18:15:36', '2025-10-30 18:15:36'),
(55, 'kiRfOKDyVWVbujuWVIdV', 'Avoid Realtor Fees', 919, 260, '2025-10-30 18:15:36', '2025-10-30 18:15:36'),
(56, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 260, '2025-10-30 18:15:36', '2025-10-30 18:15:36'),
(57, 'kiRfOKDyVWVbujuWVIdV', 'Within 3 Months', 923, 260, '2025-10-30 18:15:36', '2025-10-30 18:15:36'),
(58, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 260, '2025-10-30 18:15:36', '2025-10-30 18:15:36'),
(59, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 260, '2025-10-30 18:15:36', '2025-10-30 18:15:36'),
(60, 'kiRfOKDyVWVbujuWVIdV', '3453 Pemberton St, Jacksonville, FL 32224, USA, FL, 32224', 918, 261, '2025-10-30 19:35:38', '2025-10-30 19:35:38'),
(61, 'kiRfOKDyVWVbujuWVIdV', 'Too Many Repairs', 919, 261, '2025-10-30 19:35:38', '2025-11-03 19:33:42'),
(62, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 261, '2025-10-30 19:35:38', '2025-10-30 19:35:38'),
(63, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 261, '2025-10-30 19:35:38', '2025-10-30 19:35:38'),
(64, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 261, '2025-10-30 19:35:38', '2025-10-30 19:35:38'),
(65, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 261, '2025-10-30 19:35:38', '2025-10-30 19:35:38'),
(66, 'kiRfOKDyVWVbujuWVIdV', '170 Morrel Rd, Ronald, WA 98940, USA, WA, 98940', 918, 262, '2025-10-30 19:56:56', '2025-10-30 19:56:56'),
(67, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 262, '2025-10-30 19:56:56', '2025-10-30 19:56:56'),
(68, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 262, '2025-10-30 19:56:56', '2025-10-30 19:56:56'),
(69, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 262, '2025-10-30 19:56:56', '2025-10-30 19:56:56'),
(70, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 262, '2025-10-30 19:56:56', '2025-10-30 19:56:56'),
(71, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 262, '2025-10-30 19:56:56', '2025-10-30 19:56:56'),
(72, 'kiRfOKDyVWVbujuWVIdV', '924 South Lamar Street, TEXAS, 79102', 918, 265, '2025-10-30 22:21:45', '2025-10-30 22:21:45'),
(73, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 265, '2025-10-30 22:21:45', '2025-10-30 22:21:45'),
(74, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 265, '2025-10-30 22:21:45', '2025-10-30 22:21:45'),
(75, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 265, '2025-10-30 22:21:45', '2025-10-30 22:21:45'),
(76, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 265, '2025-10-30 22:21:45', '2025-10-30 22:21:45'),
(77, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 265, '2025-10-30 22:21:45', '2025-10-30 22:21:45'),
(78, 'kiRfOKDyVWVbujuWVIdV', '15483 Highlands Harbor Dr, Clearlake, CA 95422, USA, CA, 95422', 918, 266, '2025-10-30 23:27:34', '2025-10-30 23:27:34'),
(79, 'kiRfOKDyVWVbujuWVIdV', 'Avoid Realtor Fees', 919, 266, '2025-10-30 23:27:34', '2025-10-30 23:27:34'),
(80, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 266, '2025-10-30 23:27:34', '2025-10-30 23:27:34'),
(81, 'kiRfOKDyVWVbujuWVIdV', 'Within 3 Months', 923, 266, '2025-10-30 23:27:34', '2025-10-30 23:27:34'),
(82, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 266, '2025-10-30 23:27:34', '2025-10-30 23:27:34'),
(83, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 266, '2025-10-30 23:27:34', '2025-10-30 23:27:34'),
(84, 'kiRfOKDyVWVbujuWVIdV', '616 W 6th St, IN, 46953', 918, 112, '2025-10-31 03:18:28', '2025-10-31 03:18:28'),
(85, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 112, '2025-10-31 03:18:28', '2025-10-31 03:18:28'),
(86, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 112, '2025-10-31 03:18:28', '2025-10-31 03:18:28'),
(87, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 112, '2025-10-31 03:18:28', '2025-10-31 03:18:28'),
(88, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 112, '2025-10-31 03:18:28', '2025-10-31 03:18:28'),
(89, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 112, '2025-10-31 03:18:28', '2025-10-31 03:18:28'),
(90, 'kiRfOKDyVWVbujuWVIdV', '1507 Saint Francios Rd, Bonne Terre Mo, 63628', 918, 267, '2025-10-31 04:08:00', '2025-10-31 04:08:00'),
(91, 'kiRfOKDyVWVbujuWVIdV', 'Too Many Repairs', 919, 267, '2025-10-31 04:08:00', '2025-10-31 04:08:00'),
(92, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 267, '2025-10-31 04:08:00', '2025-10-31 04:08:00'),
(93, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 267, '2025-10-31 04:08:00', '2025-10-31 04:08:00'),
(94, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 267, '2025-10-31 04:08:00', '2025-10-31 04:08:00'),
(95, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 267, '2025-10-31 04:08:00', '2025-10-31 04:08:00'),
(96, 'kiRfOKDyVWVbujuWVIdV', '6510 Eleanor Dr, Port Richey, FL 34668, USA, FL, 34668', 918, 268, '2025-10-31 04:14:25', '2025-10-31 04:14:25'),
(97, 'kiRfOKDyVWVbujuWVIdV', 'Too Many Repairs', 919, 268, '2025-10-31 04:14:25', '2025-10-31 04:14:25'),
(98, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 268, '2025-10-31 04:14:25', '2025-10-31 04:14:25'),
(99, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 268, '2025-10-31 04:14:25', '2025-10-31 04:14:25'),
(100, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 268, '2025-10-31 04:14:25', '2025-10-31 04:14:25'),
(101, 'kiRfOKDyVWVbujuWVIdV', 'Poor', 925, 268, '2025-10-31 04:14:25', '2025-10-31 04:14:25'),
(102, 'kiRfOKDyVWVbujuWVIdV', '52 York Ct, Kissimmee, FL 34758, USA, FL, 34758', 918, 269, '2025-10-31 04:18:35', '2025-10-31 04:18:35'),
(103, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 269, '2025-10-31 04:18:35', '2025-10-31 04:18:35'),
(104, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 269, '2025-10-31 04:18:35', '2025-10-31 04:18:35'),
(105, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 269, '2025-10-31 04:18:35', '2025-10-31 04:18:35'),
(106, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 269, '2025-10-31 04:18:35', '2025-10-31 04:18:35'),
(107, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 269, '2025-10-31 04:18:35', '2025-10-31 04:18:35'),
(108, 'kiRfOKDyVWVbujuWVIdV', '3128 Woodland Dr, Edgewater, FL 32141, USA, FL, 32141', 918, 153, '2025-10-31 04:34:46', '2025-10-31 04:34:46'),
(109, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 153, '2025-10-31 04:34:46', '2025-10-31 04:34:46'),
(110, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 153, '2025-10-31 04:34:46', '2025-10-31 04:34:46'),
(111, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 153, '2025-10-31 04:34:46', '2025-10-31 04:34:46'),
(112, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 153, '2025-10-31 04:34:46', '2025-10-31 04:34:46'),
(113, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 153, '2025-10-31 04:34:46', '2025-10-31 04:34:46'),
(114, 'kiRfOKDyVWVbujuWVIdV', '200 S Farragut St, Bay City, MI 48708, USA, MI, 48708', 918, 270, '2025-10-31 08:39:12', '2025-10-31 08:39:12'),
(115, 'kiRfOKDyVWVbujuWVIdV', 'Avoid Realtor Fees', 919, 270, '2025-10-31 08:39:12', '2025-10-31 08:39:12'),
(116, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 270, '2025-10-31 08:39:12', '2025-10-31 08:39:12'),
(117, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 270, '2025-10-31 08:39:12', '2025-10-31 08:39:12'),
(118, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 270, '2025-10-31 08:39:12', '2025-10-31 08:39:12'),
(119, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 270, '2025-10-31 08:39:12', '2025-10-31 08:39:12'),
(120, 'kiRfOKDyVWVbujuWVIdV', '615 Bowers Dr, Benton, AR 72015, USA, AR, 72015', 918, 271, '2025-10-31 09:27:17', '2025-10-31 09:27:17'),
(121, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 271, '2025-10-31 09:27:17', '2025-10-31 09:27:17'),
(122, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 271, '2025-10-31 09:27:17', '2025-10-31 09:27:17'),
(123, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 271, '2025-10-31 09:27:17', '2025-10-31 09:27:17'),
(124, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 271, '2025-10-31 09:27:17', '2025-10-31 09:27:17'),
(125, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 271, '2025-10-31 09:27:17', '2025-10-31 09:27:17'),
(126, 'kiRfOKDyVWVbujuWVIdV', '6658 N Memering Rd, Bicknell, IN 47512, USA, IN, 47512', 918, 272, '2025-10-31 16:55:49', '2025-10-31 16:55:49'),
(127, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 272, '2025-10-31 16:55:49', '2025-10-31 16:55:49'),
(128, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 272, '2025-10-31 16:55:49', '2025-10-31 16:55:49'),
(129, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 272, '2025-10-31 16:55:49', '2025-10-31 16:55:49'),
(130, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 272, '2025-10-31 16:55:49', '2025-10-31 16:55:49'),
(131, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 272, '2025-10-31 16:55:49', '2025-10-31 16:55:49'),
(132, 'kiRfOKDyVWVbujuWVIdV', '2330 W Roane Ave, Eupora, MS 39744, USA, MS, 39744', 918, 273, '2025-10-31 16:56:11', '2025-10-31 16:56:11'),
(133, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 273, '2025-10-31 16:56:11', '2025-10-31 16:56:11'),
(134, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 273, '2025-10-31 16:56:11', '2025-10-31 16:56:11'),
(135, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 273, '2025-10-31 16:56:11', '2025-10-31 16:56:11'),
(136, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 273, '2025-10-31 16:56:11', '2025-10-31 16:56:11'),
(137, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 273, '2025-10-31 16:56:11', '2025-10-31 16:56:11'),
(138, 'kiRfOKDyVWVbujuWVIdV', '62 Tomas H Romero Rd, Ranchos De Taos, NM 87557, USA, NM, 87557', 918, 13, '2025-10-31 17:04:22', '2025-10-31 17:04:22'),
(139, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 13, '2025-10-31 17:04:22', '2025-10-31 17:04:22'),
(140, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 13, '2025-10-31 17:04:22', '2025-10-31 17:04:22'),
(141, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 13, '2025-10-31 17:04:22', '2025-10-31 17:04:22'),
(142, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 13, '2025-10-31 17:04:22', '2025-10-31 17:04:22'),
(143, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 13, '2025-10-31 17:04:22', '2025-10-31 17:04:22'),
(144, 'kiRfOKDyVWVbujuWVIdV', '8440 Alberata Vista Dr, Tampa, FL 33647, USA, FL, 33647', 918, 274, '2025-10-31 18:05:41', '2025-10-31 18:05:41'),
(145, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 274, '2025-10-31 18:05:41', '2025-11-01 14:26:09'),
(146, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 274, '2025-10-31 18:05:41', '2025-10-31 18:05:41'),
(147, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 274, '2025-10-31 18:05:41', '2025-11-01 14:26:09'),
(148, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 274, '2025-10-31 18:05:41', '2025-10-31 18:05:41'),
(149, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 274, '2025-10-31 18:05:41', '2025-10-31 18:05:41'),
(150, 'kiRfOKDyVWVbujuWVIdV', '7602 Crystal Isle Ln, Humble, TX 77396, USA, TX, 77396', 918, 94, '2025-10-31 18:14:36', '2025-10-31 18:14:36'),
(151, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 94, '2025-10-31 18:14:36', '2025-10-31 18:14:36'),
(152, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 94, '2025-10-31 18:14:36', '2025-10-31 18:14:36'),
(153, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 94, '2025-10-31 18:14:36', '2025-10-31 18:14:36'),
(154, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 94, '2025-10-31 18:14:36', '2025-10-31 18:14:36'),
(155, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 94, '2025-10-31 18:14:36', '2025-10-31 18:14:36'),
(156, 'kiRfOKDyVWVbujuWVIdV', '5296 Rock River Rd, WV, 24747-9740', 918, 275, '2025-10-31 18:19:40', '2025-10-31 18:19:40'),
(157, 'kiRfOKDyVWVbujuWVIdV', 'Too Many Repairs', 919, 275, '2025-10-31 18:19:40', '2025-11-03 20:36:53'),
(158, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 275, '2025-10-31 18:19:40', '2025-10-31 18:19:40'),
(159, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 275, '2025-10-31 18:19:40', '2025-10-31 18:19:40'),
(160, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 275, '2025-10-31 18:19:40', '2025-10-31 18:19:40'),
(161, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 275, '2025-10-31 18:19:40', '2025-10-31 18:19:40'),
(162, 'kiRfOKDyVWVbujuWVIdV', '5121 Carnelian Dr, Raleigh, NC 27610, USA, NC, 27610', 918, 276, '2025-10-31 18:29:43', '2025-10-31 18:29:43'),
(163, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 276, '2025-10-31 18:29:43', '2025-10-31 18:29:43'),
(164, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 276, '2025-10-31 18:29:43', '2025-10-31 18:29:43'),
(165, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 276, '2025-10-31 18:29:43', '2025-10-31 18:29:43'),
(166, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 276, '2025-10-31 18:29:43', '2025-10-31 18:29:43'),
(167, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 276, '2025-10-31 18:29:43', '2025-10-31 18:29:43'),
(168, 'kiRfOKDyVWVbujuWVIdV', '27042 US-52, Laurel, IN 47024, USA, IN, 47024', 918, 277, '2025-10-31 18:37:56', '2025-10-31 18:37:56'),
(169, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 277, '2025-10-31 18:37:56', '2025-10-31 18:37:56'),
(170, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 277, '2025-10-31 18:37:56', '2025-10-31 18:37:56'),
(171, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 277, '2025-10-31 18:37:56', '2025-10-31 18:37:56'),
(172, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 277, '2025-10-31 18:37:56', '2025-10-31 18:37:56'),
(173, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 277, '2025-10-31 18:37:56', '2025-10-31 18:37:56'),
(174, 'kiRfOKDyVWVbujuWVIdV', '19731 Hayes Ct, Northville, MI 48167, USA, MI, 48167', 918, 9, '2025-10-31 18:45:13', '2025-10-31 18:45:13'),
(175, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 9, '2025-10-31 18:45:13', '2025-10-31 18:45:13'),
(176, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 9, '2025-10-31 18:45:13', '2025-10-31 18:45:13'),
(177, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 9, '2025-10-31 18:45:13', '2025-10-31 18:45:13'),
(178, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 9, '2025-10-31 18:45:13', '2025-10-31 18:45:13'),
(179, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 9, '2025-10-31 18:45:13', '2025-10-31 18:45:13'),
(180, 'kiRfOKDyVWVbujuWVIdV', '2510 Tower Hill Rd, Kinston, NC 28501, USA, NC, 28501', 918, 278, '2025-10-31 19:20:48', '2025-10-31 19:20:48'),
(181, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 278, '2025-10-31 19:20:48', '2025-10-31 19:20:48'),
(182, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 278, '2025-10-31 19:20:48', '2025-10-31 19:20:48'),
(183, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 278, '2025-10-31 19:20:48', '2025-10-31 19:20:48'),
(184, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 278, '2025-10-31 19:20:48', '2025-10-31 19:20:48'),
(185, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 278, '2025-10-31 19:20:48', '2025-10-31 19:20:48'),
(186, 'kiRfOKDyVWVbujuWVIdV', '20665 Piedmont Dr, Clinton Township, MI 48036, USA, MI, 48036', 918, 279, '2025-10-31 19:31:10', '2025-10-31 19:31:10'),
(187, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 279, '2025-10-31 19:31:10', '2025-10-31 19:31:10'),
(188, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 279, '2025-10-31 19:31:10', '2025-10-31 19:31:10'),
(189, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 279, '2025-10-31 19:31:10', '2025-10-31 19:31:10'),
(190, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 279, '2025-10-31 19:31:10', '2025-10-31 19:31:10'),
(191, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 279, '2025-10-31 19:31:10', '2025-10-31 19:31:10'),
(192, 'kiRfOKDyVWVbujuWVIdV', '4098 Willow Ln, Columbia, PA 17512, USA, PA, 17512', 918, 280, '2025-10-31 19:57:29', '2025-10-31 19:57:29'),
(193, 'kiRfOKDyVWVbujuWVIdV', 'Divorce', 919, 280, '2025-10-31 19:57:29', '2025-10-31 19:57:29'),
(194, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 280, '2025-10-31 19:57:29', '2025-10-31 19:57:29'),
(195, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 280, '2025-10-31 19:57:29', '2025-10-31 19:57:29'),
(196, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 280, '2025-10-31 19:57:29', '2025-10-31 19:57:29'),
(197, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 280, '2025-10-31 19:57:29', '2025-10-31 19:57:29'),
(198, 'kiRfOKDyVWVbujuWVIdV', '20321 N Shore Ln, West Frankfort, IL 62896, USA, IL, 62896', 918, 281, '2025-10-31 20:46:29', '2025-10-31 20:46:29'),
(199, 'kiRfOKDyVWVbujuWVIdV', 'Land/Lot', 921, 281, '2025-10-31 20:46:29', '2025-10-31 20:46:29'),
(200, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 281, '2025-10-31 20:46:29', '2025-10-31 20:46:29'),
(201, 'kiRfOKDyVWVbujuWVIdV', '1320426010', 927, 281, '2025-10-31 20:46:29', '2025-10-31 20:46:29'),
(202, 'kiRfOKDyVWVbujuWVIdV', '17030 Foxton Dr, Parker, CO 80134, USA, CO, 80134', 918, 283, '2025-10-31 21:00:41', '2025-10-31 21:00:41'),
(203, 'kiRfOKDyVWVbujuWVIdV', 'Divorce', 919, 283, '2025-10-31 21:00:41', '2025-10-31 21:00:41'),
(204, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 283, '2025-10-31 21:00:41', '2025-10-31 21:00:41'),
(205, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 283, '2025-10-31 21:00:41', '2025-10-31 21:00:41'),
(206, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 283, '2025-10-31 21:00:41', '2025-10-31 21:00:41'),
(207, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 283, '2025-10-31 21:00:41', '2025-10-31 21:00:41'),
(208, 'kiRfOKDyVWVbujuWVIdV', '29267 Summerset Dr, Menifee, CA 92586, USA, CA, 92586', 918, 284, '2025-10-31 22:27:47', '2025-10-31 22:27:47'),
(209, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 284, '2025-10-31 22:27:47', '2025-10-31 22:27:47'),
(210, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 284, '2025-10-31 22:27:47', '2025-10-31 22:27:47'),
(211, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 284, '2025-10-31 22:27:47', '2025-10-31 22:27:47'),
(212, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 284, '2025-10-31 22:27:47', '2025-10-31 22:27:47'),
(213, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 284, '2025-10-31 22:27:47', '2025-10-31 22:27:47'),
(214, 'kiRfOKDyVWVbujuWVIdV', '305 Slate Branch Rd, Crab Orchard, KY 40419, USA, KY, 40419', 918, 285, '2025-10-31 22:28:57', '2025-10-31 22:28:57'),
(215, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 285, '2025-10-31 22:28:57', '2025-10-31 22:28:57'),
(216, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 285, '2025-10-31 22:28:57', '2025-10-31 22:28:57'),
(217, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 285, '2025-10-31 22:28:57', '2025-10-31 22:28:57'),
(218, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 285, '2025-10-31 22:28:57', '2025-10-31 22:28:57'),
(219, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 285, '2025-10-31 22:28:57', '2025-10-31 22:28:57'),
(220, 'kiRfOKDyVWVbujuWVIdV', '1885 Jade, KS, 67063', 918, 286, '2025-10-31 22:57:41', '2025-10-31 22:57:41'),
(221, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 286, '2025-10-31 22:57:41', '2025-10-31 22:57:41'),
(222, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 286, '2025-10-31 22:57:41', '2025-10-31 22:57:41'),
(223, 'kiRfOKDyVWVbujuWVIdV', 'Within 6 Months', 923, 286, '2025-10-31 22:57:41', '2025-10-31 22:57:41'),
(224, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 286, '2025-10-31 22:57:41', '2025-10-31 22:57:41'),
(225, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 286, '2025-10-31 22:57:41', '2025-10-31 22:57:41'),
(226, 'kiRfOKDyVWVbujuWVIdV', '16555 Pine Ln, LA, 70462', 918, 287, '2025-11-01 00:04:04', '2025-11-01 00:04:04'),
(227, 'kiRfOKDyVWVbujuWVIdV', 'Divorce', 919, 287, '2025-11-01 00:04:04', '2025-11-01 00:04:04'),
(228, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 287, '2025-11-01 00:04:04', '2025-11-01 00:04:04'),
(229, 'kiRfOKDyVWVbujuWVIdV', 'Within 3 Months', 923, 287, '2025-11-01 00:04:04', '2025-11-01 00:04:04'),
(230, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 287, '2025-11-01 00:04:04', '2025-11-01 00:04:04'),
(231, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 287, '2025-11-01 00:04:04', '2025-11-01 00:04:04'),
(232, 'kiRfOKDyVWVbujuWVIdV', '28889 Deep Forest Ct, Coarsegold, CA 93614, USA, CA, 93614', 918, 288, '2025-11-01 00:17:40', '2025-11-01 00:17:40'),
(233, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 288, '2025-11-01 00:17:40', '2025-11-01 00:17:40'),
(234, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 288, '2025-11-01 00:17:40', '2025-11-01 00:17:40'),
(235, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 288, '2025-11-01 00:17:40', '2025-11-01 00:17:40'),
(236, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 288, '2025-11-01 00:17:40', '2025-11-01 00:17:40'),
(237, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 288, '2025-11-01 00:17:40', '2025-11-01 00:17:40'),
(238, 'kiRfOKDyVWVbujuWVIdV', '91 Terra Ln, MO, 65326-2606', 918, 290, '2025-11-01 01:19:38', '2025-11-01 01:19:38'),
(239, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 290, '2025-11-01 01:19:38', '2025-11-01 01:19:38'),
(240, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 290, '2025-11-01 01:19:38', '2025-11-01 01:19:38'),
(241, 'kiRfOKDyVWVbujuWVIdV', 'Within 3 Months', 923, 290, '2025-11-01 01:19:38', '2025-11-01 01:19:38'),
(242, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 290, '2025-11-01 01:19:38', '2025-11-01 01:19:38'),
(243, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 290, '2025-11-01 01:19:38', '2025-11-01 01:19:38'),
(244, 'kiRfOKDyVWVbujuWVIdV', '25864 Sagewood Dr, Denham Springs, LA 70726, USA, LA, 70726', 918, 291, '2025-11-01 01:30:22', '2025-11-01 01:30:22'),
(245, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 291, '2025-11-01 01:30:22', '2025-11-01 01:30:22'),
(246, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 291, '2025-11-01 01:30:22', '2025-11-01 01:30:22'),
(247, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 291, '2025-11-01 01:30:22', '2025-11-01 01:30:22'),
(248, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 291, '2025-11-01 01:30:22', '2025-11-01 01:30:22'),
(249, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 291, '2025-11-01 01:30:22', '2025-11-01 01:30:22'),
(250, 'kiRfOKDyVWVbujuWVIdV', '430 Pleasanton Spring, San Antonio, TX 78221, USA, TX, 78221', 918, 292, '2025-11-01 02:02:21', '2025-11-01 02:02:21'),
(251, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 292, '2025-11-01 02:02:21', '2025-11-01 02:02:21'),
(252, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 292, '2025-11-01 02:02:21', '2025-11-01 02:02:21'),
(253, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 292, '2025-11-01 02:02:21', '2025-11-01 02:02:21'),
(254, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 292, '2025-11-01 02:02:21', '2025-11-01 02:02:21'),
(255, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 292, '2025-11-01 02:02:21', '2025-11-01 02:02:21'),
(256, 'kiRfOKDyVWVbujuWVIdV', '901 L L Anderson Ave, Selma, AL 36701, USA, AL, 36701', 918, 293, '2025-11-01 09:09:51', '2025-11-01 09:09:51'),
(257, 'kiRfOKDyVWVbujuWVIdV', 'Inheritance', 919, 293, '2025-11-01 09:09:51', '2025-11-01 09:09:51'),
(258, 'kiRfOKDyVWVbujuWVIdV', 'Commercial', 921, 293, '2025-11-01 09:09:51', '2025-11-01 09:09:51'),
(259, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 293, '2025-11-01 09:09:51', '2025-11-01 09:09:51'),
(260, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 293, '2025-11-01 09:09:51', '2025-11-01 09:09:51'),
(261, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 293, '2025-11-01 09:09:51', '2025-11-01 09:09:51'),
(262, 'kiRfOKDyVWVbujuWVIdV', '2725 Spring Valley Dr, Creedmoor, NC 27522, USA, NC, 27522', 918, 294, '2025-11-01 13:09:12', '2025-11-01 13:09:12'),
(263, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 294, '2025-11-01 13:09:12', '2025-11-01 13:09:12'),
(264, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 294, '2025-11-01 13:09:12', '2025-11-01 13:09:12'),
(265, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 294, '2025-11-01 13:09:12', '2025-11-01 13:09:12'),
(266, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 294, '2025-11-01 13:09:12', '2025-11-01 13:09:12'),
(267, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 294, '2025-11-01 13:09:12', '2025-11-01 13:09:12'),
(268, 'kiRfOKDyVWVbujuWVIdV', '5354 Shoffner Blvd, Crestview, FL 32539, USA, FL, 32539', 918, 295, '2025-11-01 14:44:14', '2025-11-01 14:44:14'),
(269, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 295, '2025-11-01 14:44:14', '2025-11-04 19:44:50'),
(270, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 295, '2025-11-01 14:44:14', '2025-11-01 14:44:14'),
(271, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 295, '2025-11-01 14:44:14', '2025-11-01 14:44:14'),
(272, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 295, '2025-11-01 14:44:14', '2025-11-01 14:44:14'),
(273, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 295, '2025-11-01 14:44:14', '2025-11-01 14:44:14'),
(274, 'kiRfOKDyVWVbujuWVIdV', '526 Bainbridge Ave, Mays Landing, NJ 08330, USA, NJ, 08330', 918, 296, '2025-11-01 15:13:09', '2025-11-01 15:13:09'),
(275, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 296, '2025-11-01 15:13:09', '2025-11-01 15:13:09'),
(276, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 296, '2025-11-01 15:13:09', '2025-11-01 15:13:09'),
(277, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 296, '2025-11-01 15:13:09', '2025-11-01 15:13:09'),
(278, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 296, '2025-11-01 15:13:09', '2025-11-01 15:13:09'),
(279, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 296, '2025-11-01 15:13:09', '2025-11-01 15:13:09'),
(280, 'kiRfOKDyVWVbujuWVIdV', '130 Ave C, Hereford, TX 79045, USA, TX, 79045', 918, 297, '2025-11-01 15:57:43', '2025-11-01 15:57:43'),
(281, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 297, '2025-11-01 15:57:43', '2025-11-01 15:57:43'),
(282, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 297, '2025-11-01 15:57:43', '2025-11-01 15:57:43'),
(283, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 297, '2025-11-01 15:57:43', '2025-11-01 15:57:43'),
(284, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 297, '2025-11-01 15:57:43', '2025-11-01 15:57:43'),
(285, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 297, '2025-11-01 15:57:43', '2025-11-01 15:57:43'),
(286, 'kiRfOKDyVWVbujuWVIdV', '241 Maclay St, Harrisburg, PA 17110, USA, PA, 17110', 918, 298, '2025-11-01 19:38:33', '2025-11-01 19:38:33'),
(287, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 298, '2025-11-01 19:38:33', '2025-11-01 19:38:33'),
(288, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 298, '2025-11-01 19:38:33', '2025-11-01 19:38:33'),
(289, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 298, '2025-11-01 19:38:33', '2025-11-01 19:38:33'),
(290, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 298, '2025-11-01 19:38:33', '2025-11-01 19:38:33'),
(291, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 298, '2025-11-01 19:38:33', '2025-11-01 19:38:33'),
(292, 'kiRfOKDyVWVbujuWVIdV', '1119 Esther Rd, MI, 48705-9768', 918, 299, '2025-11-01 21:21:56', '2025-11-01 21:21:56'),
(293, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 299, '2025-11-01 21:21:56', '2025-11-01 21:21:56'),
(294, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 299, '2025-11-01 21:21:56', '2025-11-01 21:21:56'),
(295, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 299, '2025-11-01 21:21:56', '2025-11-01 21:21:56'),
(296, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 299, '2025-11-01 21:21:56', '2025-11-01 21:21:56'),
(297, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 299, '2025-11-01 21:21:56', '2025-11-01 21:21:56'),
(298, 'kiRfOKDyVWVbujuWVIdV', '13100 Serpentine Dr, FL, 34667-6925', 918, 300, '2025-11-01 22:35:05', '2025-11-01 22:35:05'),
(299, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 300, '2025-11-01 22:35:05', '2025-11-01 22:35:05'),
(300, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 300, '2025-11-01 22:35:05', '2025-11-01 22:35:05'),
(301, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 300, '2025-11-01 22:35:05', '2025-11-01 22:35:05'),
(302, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 300, '2025-11-01 22:35:05', '2025-11-01 22:35:05'),
(303, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 300, '2025-11-01 22:35:05', '2025-11-01 22:35:05'),
(304, 'kiRfOKDyVWVbujuWVIdV', '324 Elk River Rd, Procious, WV 25164, USA, WV, 25164', 918, 302, '2025-11-01 23:51:56', '2025-11-01 23:51:56'),
(305, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 302, '2025-11-01 23:51:56', '2025-11-01 23:51:56'),
(306, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 302, '2025-11-01 23:51:56', '2025-11-01 23:51:56'),
(307, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 302, '2025-11-01 23:51:56', '2025-11-01 23:51:56'),
(308, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 302, '2025-11-01 23:51:56', '2025-11-01 23:51:56'),
(309, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 302, '2025-11-01 23:51:56', '2025-11-01 23:51:56'),
(310, 'kiRfOKDyVWVbujuWVIdV', '8928 Rolling Rd, Manassas, VA 20110, USA, VA, 20110', 918, 303, '2025-11-02 00:50:12', '2025-11-02 00:50:12'),
(311, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 303, '2025-11-02 00:50:12', '2025-11-02 00:50:12'),
(312, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 303, '2025-11-02 00:50:12', '2025-11-02 00:50:12'),
(313, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 303, '2025-11-02 00:50:12', '2025-11-02 00:50:12'),
(314, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 303, '2025-11-02 00:50:12', '2025-11-02 00:50:12'),
(315, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 303, '2025-11-02 00:50:12', '2025-11-02 00:50:12'),
(316, 'kiRfOKDyVWVbujuWVIdV', '325 Country Club Dr, New Iberia, LA 70563, USA, LA, 70563', 918, 304, '2025-11-02 01:21:28', '2025-11-02 01:21:28'),
(317, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 304, '2025-11-02 01:21:28', '2025-11-02 01:21:28'),
(318, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 304, '2025-11-02 01:21:28', '2025-11-02 01:21:28'),
(319, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 304, '2025-11-02 01:21:28', '2025-11-02 01:21:28'),
(320, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 304, '2025-11-02 01:21:28', '2025-11-02 01:21:28'),
(321, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 304, '2025-11-02 01:21:28', '2025-11-02 01:21:28'),
(322, 'kiRfOKDyVWVbujuWVIdV', '1021 W Franklin St, Evansville IN, 47710-1157', 918, 111, '2025-11-02 03:50:11', '2025-11-02 03:50:11'),
(323, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 111, '2025-11-02 03:50:11', '2025-11-02 03:50:11'),
(324, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 111, '2025-11-02 03:50:11', '2025-11-02 03:50:11'),
(325, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 111, '2025-11-02 03:50:11', '2025-11-02 03:50:11'),
(326, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 111, '2025-11-02 03:50:11', '2025-11-02 03:50:11'),
(327, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 111, '2025-11-02 03:50:11', '2025-11-02 03:50:11'),
(328, 'kiRfOKDyVWVbujuWVIdV', '108 W Vine Ave, Barnsdall, OK 74002, USA, OK, 74002', 918, 305, '2025-11-02 17:22:10', '2025-11-02 17:22:10'),
(329, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 305, '2025-11-02 17:22:10', '2025-11-02 17:22:10'),
(330, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 305, '2025-11-02 17:22:10', '2025-11-02 17:22:10'),
(331, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 305, '2025-11-02 17:22:10', '2025-11-02 17:22:10'),
(332, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 305, '2025-11-02 17:22:10', '2025-11-02 17:22:10'),
(333, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 305, '2025-11-02 17:22:10', '2025-11-02 17:22:10'),
(334, 'kiRfOKDyVWVbujuWVIdV', '1733 Holt St, Fort Worth, TX 76103, USA, TX, 76103', 918, 306, '2025-11-03 13:31:02', '2025-11-03 13:31:02'),
(335, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 306, '2025-11-03 13:31:02', '2025-11-03 13:31:02'),
(336, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 306, '2025-11-03 13:31:02', '2025-11-03 13:31:02'),
(337, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 306, '2025-11-03 13:31:02', '2025-11-03 13:31:02'),
(338, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 306, '2025-11-03 13:31:02', '2025-11-03 13:31:02'),
(339, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 306, '2025-11-03 13:31:02', '2025-11-03 13:31:02'),
(340, 'kiRfOKDyVWVbujuWVIdV', '430 Keltner Ave, Spartanburg, SC, 29302', 918, 307, '2025-11-03 14:15:15', '2025-11-03 14:15:15'),
(341, 'kiRfOKDyVWVbujuWVIdV', 'Avoid Realtor Fees', 919, 307, '2025-11-03 14:15:15', '2025-11-03 14:15:15'),
(342, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 307, '2025-11-03 14:15:15', '2025-11-03 14:15:15'),
(343, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 307, '2025-11-03 14:15:15', '2025-11-03 14:15:15'),
(344, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 307, '2025-11-03 14:15:15', '2025-11-03 14:15:15'),
(345, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 307, '2025-11-03 14:15:15', '2025-11-03 14:15:15'),
(346, 'kiRfOKDyVWVbujuWVIdV', '2540sw 5street, Florida, 33312', 918, 308, '2025-11-03 14:52:56', '2025-11-03 14:52:56'),
(347, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 308, '2025-11-03 14:52:56', '2025-11-03 14:52:56'),
(348, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 308, '2025-11-03 14:52:56', '2025-11-03 14:52:56'),
(349, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 308, '2025-11-03 14:52:56', '2025-11-03 14:52:56'),
(350, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 308, '2025-11-03 14:52:56', '2025-11-03 14:52:56'),
(351, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 308, '2025-11-03 14:52:56', '2025-11-03 14:52:56'),
(352, 'kiRfOKDyVWVbujuWVIdV', '450 Topeka Rd SW, Palm Bay, FL 32908, USA, FL, 32908', 918, 310, '2025-11-03 17:45:35', '2025-11-03 17:45:35'),
(353, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 310, '2025-11-03 17:45:35', '2025-11-03 17:45:35'),
(354, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 310, '2025-11-03 17:45:35', '2025-11-03 17:45:35'),
(355, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 310, '2025-11-03 17:45:35', '2025-11-03 17:45:35'),
(356, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 310, '2025-11-03 17:45:35', '2025-11-03 17:45:35'),
(357, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 310, '2025-11-03 17:45:35', '2025-11-03 17:45:35'),
(358, 'kiRfOKDyVWVbujuWVIdV', '204 S Hanover Ave, Lexington, KY 40502, USA, KY, 40502', 918, 18, '2025-11-03 19:14:17', '2025-11-03 19:14:17'),
(359, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 18, '2025-11-03 19:14:17', '2025-11-03 19:14:17'),
(360, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 18, '2025-11-03 19:14:17', '2025-11-03 19:14:17'),
(361, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 18, '2025-11-03 19:14:17', '2025-11-03 19:14:17'),
(362, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 18, '2025-11-03 19:14:17', '2025-11-03 19:14:17'),
(363, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 18, '2025-11-03 19:14:17', '2025-11-03 19:14:17'),
(364, 'kiRfOKDyVWVbujuWVIdV', '2507 Garvin Ave, Arcadia, FL 34266, USA, FL, 34266', 918, 311, '2025-11-03 19:21:14', '2025-11-03 19:21:14'),
(365, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 311, '2025-11-03 19:21:14', '2025-11-03 19:21:14'),
(366, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 311, '2025-11-03 19:21:14', '2025-11-03 19:21:14'),
(367, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 311, '2025-11-03 19:21:14', '2025-11-03 19:21:14'),
(368, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 311, '2025-11-03 19:21:14', '2025-11-03 19:21:14'),
(369, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 311, '2025-11-03 19:21:14', '2025-11-03 19:21:14'),
(370, 'kiRfOKDyVWVbujuWVIdV', '319 N Mishawaka St, Akron, IN 46910, USA, IN, 46910', 918, 313, '2025-11-03 19:43:37', '2025-11-03 19:43:37'),
(371, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 313, '2025-11-03 19:43:37', '2025-11-03 19:43:37'),
(372, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 313, '2025-11-03 19:43:37', '2025-11-03 19:43:37'),
(373, 'kiRfOKDyVWVbujuWVIdV', 'Within 3 Months', 923, 313, '2025-11-03 19:43:37', '2025-11-03 19:43:37'),
(374, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 313, '2025-11-03 19:43:37', '2025-11-03 19:43:37'),
(375, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 313, '2025-11-03 19:43:37', '2025-11-03 19:43:37'),
(376, 'kiRfOKDyVWVbujuWVIdV', '427 Bell rd shawnee ,co,usa, Colorado, 80475', 918, 461, '2025-11-04 13:29:28', '2025-11-04 13:29:28'),
(377, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 461, '2025-11-04 13:29:28', '2025-11-04 13:29:28'),
(378, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 461, '2025-11-04 13:29:28', '2025-11-04 13:29:28'),
(379, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 461, '2025-11-04 13:29:28', '2025-11-04 13:29:28'),
(380, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 461, '2025-11-04 13:29:28', '2025-11-04 13:29:28'),
(381, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 461, '2025-11-04 13:29:28', '2025-11-04 13:29:28'),
(382, 'kiRfOKDyVWVbujuWVIdV', '307 Warren St, GA, 30741-2990', 918, 462, '2025-11-04 13:57:29', '2025-11-04 13:57:29'),
(383, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 462, '2025-11-04 13:57:29', '2025-11-04 13:57:29'),
(384, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 462, '2025-11-04 13:57:29', '2025-11-04 13:57:29'),
(385, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 462, '2025-11-04 13:57:29', '2025-11-04 13:57:29'),
(386, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 462, '2025-11-04 13:57:29', '2025-11-04 13:57:29'),
(387, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 462, '2025-11-04 13:57:29', '2025-11-04 13:57:29'),
(388, 'kiRfOKDyVWVbujuWVIdV', '310 Hillandale Rd Spartanburg D C, S C, 29301', 918, 463, '2025-11-04 14:42:36', '2025-11-04 14:45:03'),
(389, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 463, '2025-11-04 14:42:36', '2025-11-04 14:42:36'),
(390, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 463, '2025-11-04 14:42:36', '2025-11-04 14:42:36'),
(391, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 463, '2025-11-04 14:42:36', '2025-11-04 14:42:36'),
(392, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 463, '2025-11-04 14:42:36', '2025-11-04 14:42:36'),
(393, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 463, '2025-11-04 14:42:36', '2025-11-04 14:42:36'),
(394, 'kiRfOKDyVWVbujuWVIdV', '3901 Galena Ave, Hopewell, VA 23860, USA, VA, 23860', 918, 464, '2025-11-04 15:28:23', '2025-11-04 15:28:23'),
(395, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 464, '2025-11-04 15:28:23', '2025-11-04 15:28:23'),
(396, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 464, '2025-11-04 15:28:23', '2025-11-04 15:28:23'),
(397, 'kiRfOKDyVWVbujuWVIdV', 'Within 3 Months', 923, 464, '2025-11-04 15:28:23', '2025-11-04 15:28:23'),
(398, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 464, '2025-11-04 15:28:23', '2025-11-04 15:28:23'),
(399, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 464, '2025-11-04 15:28:23', '2025-11-04 15:28:23'),
(400, 'kiRfOKDyVWVbujuWVIdV', '125 Old Barn Lane, N. C., 27804', 918, 465, '2025-11-04 18:06:35', '2025-11-04 18:06:35'),
(401, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 465, '2025-11-04 18:06:35', '2025-11-04 18:06:35'),
(402, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 465, '2025-11-04 18:06:35', '2025-11-04 18:06:35'),
(403, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 465, '2025-11-04 18:06:35', '2025-11-04 18:06:35'),
(404, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 465, '2025-11-04 18:06:35', '2025-11-04 18:06:35'),
(405, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 465, '2025-11-04 18:06:35', '2025-11-04 18:06:35'),
(406, 'kiRfOKDyVWVbujuWVIdV', '7880 Sharon Dr, Mobile, AL 36619, USA, AL, 36619', 918, 466, '2025-11-04 18:27:46', '2025-11-04 18:27:46'),
(407, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 466, '2025-11-04 18:27:46', '2025-11-04 18:27:46'),
(408, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 466, '2025-11-04 18:27:46', '2025-11-04 18:27:46'),
(409, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 466, '2025-11-04 18:27:46', '2025-11-04 18:27:46'),
(410, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 466, '2025-11-04 18:27:46', '2025-11-04 18:27:46'),
(411, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 466, '2025-11-04 18:27:46', '2025-11-04 18:27:46'),
(412, 'kiRfOKDyVWVbujuWVIdV', '2629 Obryan Ln, San Angelo, TX 76905, USA, TX, 76905', 918, 467, '2025-11-04 18:34:34', '2025-11-04 18:34:34'),
(413, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 467, '2025-11-04 18:34:34', '2025-11-04 18:34:34'),
(414, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 467, '2025-11-04 18:34:34', '2025-11-04 18:34:34'),
(415, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 467, '2025-11-04 18:34:34', '2025-11-04 18:34:34'),
(416, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 467, '2025-11-04 18:34:34', '2025-11-04 18:34:34'),
(417, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 467, '2025-11-04 18:34:34', '2025-11-04 18:34:34'),
(418, 'kiRfOKDyVWVbujuWVIdV', '4032 Cypress Frst Wy, Bolivia, NC 28422, USA, NC, 28422', 918, 468, '2025-11-04 18:39:56', '2025-11-04 18:39:56'),
(419, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 468, '2025-11-04 18:39:56', '2025-11-04 18:39:56'),
(420, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 468, '2025-11-04 18:39:56', '2025-11-04 18:39:56'),
(421, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 468, '2025-11-04 18:39:56', '2025-11-04 18:39:56'),
(422, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 468, '2025-11-04 18:39:56', '2025-11-04 18:39:56'),
(423, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 468, '2025-11-04 18:39:56', '2025-11-04 18:39:56'),
(424, 'kiRfOKDyVWVbujuWVIdV', '8915 Tuscan Hills Dr, Garden Ridge, TX 78266, USA, TX, 78266', 918, 469, '2025-11-04 18:52:16', '2025-11-04 18:52:16'),
(425, 'kiRfOKDyVWVbujuWVIdV', 'Too Many Repairs', 919, 469, '2025-11-04 18:52:16', '2025-11-04 18:52:16'),
(426, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 469, '2025-11-04 18:52:16', '2025-11-04 18:52:16'),
(427, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 469, '2025-11-04 18:52:16', '2025-11-04 18:52:16'),
(428, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 469, '2025-11-04 18:52:16', '2025-11-04 18:52:16'),
(429, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 469, '2025-11-04 18:52:16', '2025-11-04 18:52:16'),
(430, 'kiRfOKDyVWVbujuWVIdV', '4815 Marlborough Ave, Albany, GA 31721, USA, GA, 31721', 918, 156, '2025-11-04 19:09:01', '2025-11-04 19:09:01'),
(431, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 156, '2025-11-04 19:09:01', '2025-11-04 19:09:01'),
(432, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 156, '2025-11-04 19:09:01', '2025-11-04 19:09:01'),
(433, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 156, '2025-11-04 19:09:01', '2025-11-04 19:09:01'),
(434, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 156, '2025-11-04 19:09:01', '2025-11-04 19:09:01'),
(435, 'kiRfOKDyVWVbujuWVIdV', 'Poor', 925, 156, '2025-11-04 19:09:01', '2025-11-04 19:09:01'),
(436, 'kiRfOKDyVWVbujuWVIdV', '3709 Cedar St, Ellenton, FL 34222, USA, FL, 34222', 918, 470, '2025-11-04 19:09:16', '2025-11-04 19:09:16'),
(437, 'kiRfOKDyVWVbujuWVIdV', 'Inheritance', 919, 470, '2025-11-04 19:09:16', '2025-11-04 19:09:16'),
(438, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 470, '2025-11-04 19:09:16', '2025-11-04 19:09:16'),
(439, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 470, '2025-11-04 19:09:16', '2025-11-04 19:09:16'),
(440, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 470, '2025-11-04 19:09:16', '2025-11-04 19:09:16'),
(441, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 470, '2025-11-04 19:09:16', '2025-11-04 19:09:16'),
(442, 'kiRfOKDyVWVbujuWVIdV', '106 Michelle St, Church Point, LA 70525, USA, LA, 70525', 918, 471, '2025-11-04 19:15:26', '2025-11-04 19:15:26'),
(443, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 471, '2025-11-04 19:15:26', '2025-11-04 19:15:26'),
(444, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 471, '2025-11-04 19:15:26', '2025-11-04 19:15:26'),
(445, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 471, '2025-11-04 19:15:26', '2025-11-04 19:15:26'),
(446, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 471, '2025-11-04 19:15:26', '2025-11-04 19:15:26'),
(447, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 471, '2025-11-04 19:15:26', '2025-11-04 19:15:26'),
(448, 'kiRfOKDyVWVbujuWVIdV', '473 Cotton Grass Dr, Loris, SC 29569, USA, SC, 29569', 918, 472, '2025-11-04 19:19:23', '2025-11-04 19:19:23'),
(449, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 472, '2025-11-04 19:19:23', '2025-11-04 19:19:23'),
(450, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 472, '2025-11-04 19:19:23', '2025-11-04 19:19:23'),
(451, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 472, '2025-11-04 19:19:23', '2025-11-04 19:19:23'),
(452, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 472, '2025-11-04 19:19:23', '2025-11-04 19:19:23'),
(453, 'kiRfOKDyVWVbujuWVIdV', 'Poor', 925, 472, '2025-11-04 19:19:23', '2025-11-04 19:19:23'),
(454, 'kiRfOKDyVWVbujuWVIdV', '201 Garrison St, Zavalla, TX 75980, USA, TX, 75980', 918, 473, '2025-11-04 19:22:53', '2025-11-04 19:22:53'),
(455, 'kiRfOKDyVWVbujuWVIdV', 'Inheritance', 919, 473, '2025-11-04 19:22:53', '2025-11-04 19:22:53'),
(456, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 473, '2025-11-04 19:22:53', '2025-11-04 19:22:53'),
(457, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 473, '2025-11-04 19:22:53', '2025-11-04 19:22:53'),
(458, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 473, '2025-11-04 19:22:53', '2025-11-04 19:22:53'),
(459, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 473, '2025-11-04 19:22:53', '2025-11-04 19:22:53'),
(460, 'kiRfOKDyVWVbujuWVIdV', '2004 Lily Ct, Sanford, FL 32771, USA, FL, 32771', 918, 474, '2025-11-04 20:17:29', '2025-11-04 20:17:29'),
(461, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 474, '2025-11-04 20:17:29', '2025-11-04 20:17:29'),
(462, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 474, '2025-11-04 20:17:29', '2025-11-04 20:17:29'),
(463, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 474, '2025-11-04 20:17:29', '2025-11-04 20:17:29'),
(464, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 474, '2025-11-04 20:17:29', '2025-11-04 20:17:29'),
(465, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 474, '2025-11-04 20:17:29', '2025-11-04 20:17:29'),
(466, 'kiRfOKDyVWVbujuWVIdV', '20381 NE 30th Ave, Aventura, FL 33180, USA, FL, 33180', 918, 30, '2025-11-04 23:21:44', '2025-11-04 23:21:44'),
(467, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 30, '2025-11-04 23:21:44', '2025-11-04 23:21:44'),
(468, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 30, '2025-11-04 23:21:44', '2025-11-04 23:21:44'),
(469, 'kiRfOKDyVWVbujuWVIdV', 'Within 6 Months', 923, 30, '2025-11-04 23:21:44', '2025-11-04 23:21:44'),
(470, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 30, '2025-11-04 23:21:44', '2025-11-04 23:21:44'),
(471, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 30, '2025-11-04 23:21:44', '2025-11-04 23:21:44'),
(472, 'kiRfOKDyVWVbujuWVIdV', '806 Welch St SW, Atlanta, Georgia, 30310', 918, 96, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(473, 'kiRfOKDyVWVbujuWVIdV', '6965. State. Road. 37. South, FL, 33860', 918, 68, '2025-11-05 03:54:55', '2025-11-05 03:54:55');
INSERT INTO `contact_custom_fields` (`id`, `location_id`, `value`, `custom_field_id`, `contact_id`, `created_at`, `updated_at`) VALUES
(474, 'kiRfOKDyVWVbujuWVIdV', '4483 fulcher Road hephzibah ga, Georgia, 30815', 918, 59, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(475, 'kiRfOKDyVWVbujuWVIdV', '5823 livingston dr.toledo oh.43513, Ohio, 43513', 918, 128, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(476, 'kiRfOKDyVWVbujuWVIdV', 'Melvin Smith, OH, 45697', 918, 161, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(477, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 96, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(478, 'kiRfOKDyVWVbujuWVIdV', '6100 Bear Paw Rd, Golden, CO 80403, USA, CO, 80403', 918, 4, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(479, 'kiRfOKDyVWVbujuWVIdV', '554 Pine Ridge, WI, 54021', 918, 46, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(480, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 68, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(481, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 161, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(482, 'kiRfOKDyVWVbujuWVIdV', 'Tired Landlord', 919, 59, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(483, 'kiRfOKDyVWVbujuWVIdV', '15567 Corona Del Mar Drive Wimauma, Fl, 33598', 918, 41, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(484, 'kiRfOKDyVWVbujuWVIdV', '3102First ave south Texas city Texas 77590, Texas, 77590', 918, 2, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(485, 'kiRfOKDyVWVbujuWVIdV', '7238 Sims Road, TN, 37341-7942', 918, 56, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(486, 'kiRfOKDyVWVbujuWVIdV', '12092 Promenade Ave, Detroit, MI 48213, USA, MI, 48213', 918, 10, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(487, 'kiRfOKDyVWVbujuWVIdV', '105 gator road oxford, Mississippi, 38655', 918, 72, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(488, 'kiRfOKDyVWVbujuWVIdV', '1429 Everett rd, East Freedom, PA, 16637-8703', 918, 51, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(489, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 68, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(490, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 96, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(491, 'kiRfOKDyVWVbujuWVIdV', '152 Richard Lane, Texas, 76020', 918, 43, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(492, 'kiRfOKDyVWVbujuWVIdV', 'Multi Family', 921, 161, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(493, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 4, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(494, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 46, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(495, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 68, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(496, 'kiRfOKDyVWVbujuWVIdV', '6009 McClellan, Michigan, 48213', 918, 47, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(497, 'kiRfOKDyVWVbujuWVIdV', 'Tired Landlord', 919, 128, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(498, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 96, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(499, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 59, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(500, 'kiRfOKDyVWVbujuWVIdV', '3813 alice dr, FL, 33543', 918, 105, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(501, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 46, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(502, 'kiRfOKDyVWVbujuWVIdV', '270 Avery Rd, Monticello, AR 71655, USA, AR, 71655', 918, 17, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(503, 'kiRfOKDyVWVbujuWVIdV', '3617 hwy 80 East, vicksburg mississippi 39180, Mississippi, 39180', 918, 22, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(504, 'kiRfOKDyVWVbujuWVIdV', 'Land/Lot', 921, 72, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(505, 'kiRfOKDyVWVbujuWVIdV', '12434 237th rd live oak, FL, 32060', 918, 54, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(506, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 59, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(507, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 47, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(508, 'kiRfOKDyVWVbujuWVIdV', '1812 So-Hi Dr, Durham, NC 27703, USA, NC, 27703', 918, 6, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(509, 'kiRfOKDyVWVbujuWVIdV', 'Too Many Repairs', 919, 10, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(510, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 96, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(511, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 46, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(512, 'kiRfOKDyVWVbujuWVIdV', '1417fm1116, Tx, 78629', 918, 71, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(513, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 17, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(514, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 59, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(515, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 6, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(516, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 54, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(517, 'kiRfOKDyVWVbujuWVIdV', '140 Eula Road,  Jena, Louisiana, 71342', 918, 80, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(518, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 43, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(519, 'kiRfOKDyVWVbujuWVIdV', 'Poor', 925, 96, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(520, 'kiRfOKDyVWVbujuWVIdV', '7757 Everd Ave, MD, 21122', 918, 137, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(521, 'kiRfOKDyVWVbujuWVIdV', 'Plot 261, Kingman, 96409', 918, 62, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(522, 'kiRfOKDyVWVbujuWVIdV', '19603 Huckleberry Branch Ct, Texas, 77388', 918, 91, '2025-11-05 03:54:55', '2025-11-05 03:54:55'),
(523, 'kiRfOKDyVWVbujuWVIdV', '511 S California, TX, 76365', 918, 122, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(524, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 47, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(525, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 105, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(526, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 10, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(527, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 17, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(528, 'kiRfOKDyVWVbujuWVIdV', 'Inheritance', 919, 22, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(529, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 68, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(530, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 6, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(531, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 54, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(532, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 128, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(533, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 72, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(534, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 47, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(535, 'kiRfOKDyVWVbujuWVIdV', '207 Filmore street, IL, 62960', 918, 95, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(536, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 59, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(537, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 10, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(538, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 17, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(539, 'kiRfOKDyVWVbujuWVIdV', 'Land/Lot', 921, 62, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(540, 'kiRfOKDyVWVbujuWVIdV', 'Too Many Repairs', 919, 71, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(541, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 68, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(542, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 54, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(543, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 6, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(544, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 128, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(545, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 46, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(546, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 47, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(547, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 43, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(548, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 105, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(549, 'kiRfOKDyVWVbujuWVIdV', '253 W Country Ct, Bourbonnais, IL 60914, USA, IL, 60914', 918, 21, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(550, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 71, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(551, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 54, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(552, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 122, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(553, 'kiRfOKDyVWVbujuWVIdV', '325 berea forest circle, SC, 29617', 918, 109, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(554, 'kiRfOKDyVWVbujuWVIdV', 'Jason Cole, PA, 15314', 918, 114, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(555, 'kiRfOKDyVWVbujuWVIdV', '33 Higgins Rd, Sumrall, MS, 39482', 918, 74, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(556, 'kiRfOKDyVWVbujuWVIdV', 'Inheritance', 919, 54, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(557, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 95, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(558, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 10, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(559, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 128, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(560, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 161, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(561, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 4, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(562, 'kiRfOKDyVWVbujuWVIdV', 'Divorce', 919, 56, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(563, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 47, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(564, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 71, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(565, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 46, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(566, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 128, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(567, 'kiRfOKDyVWVbujuWVIdV', 'Poor', 925, 10, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(568, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 62, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(569, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 161, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(570, 'kiRfOKDyVWVbujuWVIdV', '1805 Laurel Oaks Drive, TX, 77469', 918, 130, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(571, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 2, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(572, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 6, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(573, 'kiRfOKDyVWVbujuWVIdV', 'Avoid Realtor Fees', 919, 80, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(574, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 17, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(575, 'kiRfOKDyVWVbujuWVIdV', '20102 Biscayne Hill Ct, TX, 77379', 918, 121, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(576, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 130, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(577, 'kiRfOKDyVWVbujuWVIdV', '1030 key largo Dr Romeoville, IL, 60446', 918, 64, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(578, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 161, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(579, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 22, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(580, 'kiRfOKDyVWVbujuWVIdV', 'Poor', 925, 17, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(581, 'kiRfOKDyVWVbujuWVIdV', '173 Tucker St, Columbia, LA 71418, USA, LA, 71418', 918, 40, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(582, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 4, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(583, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 21, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(584, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 122, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(585, 'kiRfOKDyVWVbujuWVIdV', 'Avoid Realtor Fees', 919, 74, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(586, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 105, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(587, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 43, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(588, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 95, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(589, 'kiRfOKDyVWVbujuWVIdV', '26 Merwyn Dr, Florida, 32327', 918, 97, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(590, 'kiRfOKDyVWVbujuWVIdV', '11714 Anders Ln, TX, 77510-8672', 918, 139, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(591, 'kiRfOKDyVWVbujuWVIdV', '419kercher st, Oh, 45342', 918, 58, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(592, 'kiRfOKDyVWVbujuWVIdV', 'Inheritance', 919, 51, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(593, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 64, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(594, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 109, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(595, 'kiRfOKDyVWVbujuWVIdV', '169 Rotan St, TX, 75630-7681', 918, 146, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(596, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 95, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(597, 'kiRfOKDyVWVbujuWVIdV', '313-06-261', 927, 62, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(598, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 58, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(599, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 41, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(600, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 43, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(601, 'kiRfOKDyVWVbujuWVIdV', 'Commercial', 921, 2, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(602, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 95, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(603, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 109, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(604, 'kiRfOKDyVWVbujuWVIdV', 'Multi Family', 921, 58, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(605, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 122, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(606, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 71, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(607, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 139, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(608, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 58, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(609, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 105, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(610, 'kiRfOKDyVWVbujuWVIdV', '11310 cora lane, Texas, 77318', 918, 124, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(611, 'kiRfOKDyVWVbujuWVIdV', '316 Royal Windsor Dr, NC, 28107', 918, 82, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(612, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 91, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(613, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 4, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(614, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 21, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(615, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 40, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(616, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 95, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(617, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 105, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(618, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 43, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(619, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 4, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(620, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 2, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(621, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 21, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(622, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 114, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(623, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 2, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(624, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 130, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(625, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 121, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(626, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 2, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(627, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 41, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(628, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 56, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(629, 'kiRfOKDyVWVbujuWVIdV', 'Tired Landlord', 919, 6, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(630, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 139, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(631, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 64, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(632, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 40, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(633, 'kiRfOKDyVWVbujuWVIdV', 'Pennyjscott62@gmail.com, NY, 13839', 918, 37, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(634, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 80, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(635, 'kiRfOKDyVWVbujuWVIdV', '147X-26-003.00', 927, 72, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(636, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 109, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(637, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 74, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(638, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 41, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(639, 'kiRfOKDyVWVbujuWVIdV', '145  Colburn Dr, FL, 32713', 918, 142, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(640, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 124, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(641, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 109, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(642, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 22, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(643, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 74, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(644, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 41, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(645, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 80, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(646, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 137, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(647, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 124, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(648, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 109, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(649, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 22, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(650, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 74, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(651, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 41, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(652, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 80, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(653, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 137, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(654, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 130, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(655, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 124, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(656, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 22, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(657, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 74, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(658, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 97, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(659, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 122, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(660, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 80, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(661, 'kiRfOKDyVWVbujuWVIdV', '18247 Cardinal Ln, Gulfport, MS 39503, USA, MS, 39503', 918, 31, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(662, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 146, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(663, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 51, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(664, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 139, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(665, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 130, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(666, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 58, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(667, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 124, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(668, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 114, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(669, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 142, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(670, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 71, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(671, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 146, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(672, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 97, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(673, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 21, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(674, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 58, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(675, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 137, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(676, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 37, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(677, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 122, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(678, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 124, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(679, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 64, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(680, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 114, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(681, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 130, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(682, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 97, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(683, 'kiRfOKDyVWVbujuWVIdV', '16043 delpino dr, Oregon, 97739', 918, 101, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(684, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 142, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(685, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 40, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(686, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 146, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(687, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 101, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(688, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 97, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(689, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 31, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(690, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 142, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(691, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 56, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(692, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 139, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(693, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 114, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(694, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 101, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(695, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 21, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(696, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 97, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(697, 'kiRfOKDyVWVbujuWVIdV', '9302 s.longwood, Tx, 76049', 918, 108, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(698, 'kiRfOKDyVWVbujuWVIdV', '309 W Arlee Ave, MO, 63125-2714', 918, 20, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(699, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 82, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(700, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 142, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(701, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 37, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(702, 'kiRfOKDyVWVbujuWVIdV', '830 Avenue A, Bayonne, NJ 07002, USA, NJ, 07002', 918, 38, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(703, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 137, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(704, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 64, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(705, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 114, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(706, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 121, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(707, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 101, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(708, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 56, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(709, 'kiRfOKDyVWVbujuWVIdV', '173 High St., OH, 45694', 918, 119, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(710, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 31, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(711, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 146, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(712, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 20, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(713, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 82, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(714, 'kiRfOKDyVWVbujuWVIdV', '414 Farm to Market Rd 2827, Warren, TX 77664, USA, TX, 77664', 918, 28, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(715, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 37, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(716, 'kiRfOKDyVWVbujuWVIdV', '4736 Richardson Rd, Molino, FL 32577, USA, FL, 32577', 918, 35, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(717, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 142, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(718, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 139, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(719, 'kiRfOKDyVWVbujuWVIdV', 'Avoid Realtor Fees', 919, 38, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(720, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 101, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(721, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 119, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(722, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 91, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(723, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 51, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(724, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 108, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(725, 'kiRfOKDyVWVbujuWVIdV', '6280 New Mill Trail, GA, 30102-1669', 918, 44, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(726, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 20, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(727, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 64, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(728, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 40, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(729, 'kiRfOKDyVWVbujuWVIdV', '1 Forest place Oil City, PA, 16301', 918, 160, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(730, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 56, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(731, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 121, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(732, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 137, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(733, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 82, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(734, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 37, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(735, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 146, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(736, 'kiRfOKDyVWVbujuWVIdV', '5315 Mountain View rd. Taylors, SC, 29687', 918, 98, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(737, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 51, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(738, 'kiRfOKDyVWVbujuWVIdV', '1747 Shady Lane Dr, MS, 39204', 918, 113, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(739, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 108, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(740, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 20, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(741, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 101, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(742, 'kiRfOKDyVWVbujuWVIdV', '1201 Pershing Hwy, Smackover, AR 71762, USA, AR, 71762', 918, 131, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(743, 'kiRfOKDyVWVbujuWVIdV', '327 E Main St, Smithville, MO 64089, USA, MO, 64089', 918, 26, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(744, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 91, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(745, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 35, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(746, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 121, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(747, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 28, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(748, 'kiRfOKDyVWVbujuWVIdV', 'Divorce', 919, 44, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(749, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 38, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(750, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 37, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(751, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 82, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(752, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 113, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(753, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 98, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(754, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 20, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(755, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 51, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(756, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 121, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(757, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 108, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(758, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 131, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(759, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 26, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(760, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 113, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(761, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 35, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(762, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 91, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(763, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 28, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(764, 'kiRfOKDyVWVbujuWVIdV', '106 Circleview Dr, Beckley, WV 25801, USA, WV, 25801', 918, 11, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(765, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 131, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(766, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 82, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(767, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 119, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(768, 'kiRfOKDyVWVbujuWVIdV', '2425 Avalanche tr. 89124, NV, 89124', 918, 132, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(769, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 113, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(770, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 31, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(771, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 26, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(772, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 44, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(773, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 20, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(774, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 98, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(775, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 160, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(776, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 40, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(777, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 91, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(778, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 28, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(779, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 11, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(780, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 35, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(781, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 131, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(782, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 108, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(783, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 119, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(784, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 26, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(785, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 160, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(786, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 11, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(787, 'kiRfOKDyVWVbujuWVIdV', 'Looking For A Quick Sale', 919, 132, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(788, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 28, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(789, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 26, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(790, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 108, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(791, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 119, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(792, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 131, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(793, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 35, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(794, 'kiRfOKDyVWVbujuWVIdV', '1915 Campbellton Rd SW, GA, 30311', 918, 88, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(795, 'kiRfOKDyVWVbujuWVIdV', '1163 Rushton St, Ogden, UT 84401, USA, UT, 84401', 918, 15, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(796, 'kiRfOKDyVWVbujuWVIdV', '83105 Alvarado Ave, Ca, 92274-9124', 918, 110, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(797, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 98, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(798, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 28, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(799, 'kiRfOKDyVWVbujuWVIdV', '7150 Plantation Rd 426 , Pensacola Fl.32504, FL, 32504', 918, 138, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(800, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 131, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(801, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 26, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(802, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 119, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(803, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 44, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(804, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 132, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(805, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 113, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(806, 'kiRfOKDyVWVbujuWVIdV', '2906 Taft St, TX, 76543-4931', 918, 69, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(807, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 11, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(808, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 35, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(809, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 88, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(810, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 31, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(811, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 15, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(812, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 44, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(813, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 110, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(814, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 138, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(815, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 69, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(816, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 11, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(817, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 98, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(818, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 113, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(819, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 15, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(820, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 31, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(821, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 88, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(822, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 44, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(823, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 138, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(824, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 69, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(825, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 160, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(826, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 11, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(827, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 110, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(828, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 15, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(829, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 98, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(830, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 38, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(831, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 88, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(832, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 69, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(833, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 160, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(834, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 110, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(835, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 15, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(836, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 88, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(837, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 132, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(838, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 38, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(839, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 69, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(840, 'kiRfOKDyVWVbujuWVIdV', 'Poor', 925, 15, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(841, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 138, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(842, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 160, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(843, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 110, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(844, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 88, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(845, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 69, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(846, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 38, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(847, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 132, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(848, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 138, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(849, 'kiRfOKDyVWVbujuWVIdV', 'Poor', 925, 110, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(850, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 132, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(851, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 138, '2025-11-05 03:54:56', '2025-11-05 03:54:56'),
(852, 'kiRfOKDyVWVbujuWVIdV', '5083 hibiscus avenue Crestview, FL, 32539', 918, 136, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(853, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 136, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(854, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 136, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(855, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 136, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(856, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 136, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(857, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 136, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(858, 'kiRfOKDyVWVbujuWVIdV', '1157 Enbrook Loop, Florida, 34113', 918, 190, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(859, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 190, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(860, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 190, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(861, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 190, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(862, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 190, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(863, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 190, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(864, 'kiRfOKDyVWVbujuWVIdV', '1558 Township Rd 204, OH, 43311-9645', 918, 79, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(865, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 79, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(866, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 79, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(867, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 79, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(868, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 79, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(869, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 79, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(870, 'kiRfOKDyVWVbujuWVIdV', '11212 Audubon Drive, Louisiana, 70403', 918, 92, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(871, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 92, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(872, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 92, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(873, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 92, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(874, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 92, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(875, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 92, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(876, 'kiRfOKDyVWVbujuWVIdV', '4034 Wooldridge road, GA, 31808', 918, 157, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(877, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 157, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(878, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 157, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(879, 'kiRfOKDyVWVbujuWVIdV', '2015 Indiana Ave, IN, 47150', 918, 120, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(880, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 157, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(881, 'kiRfOKDyVWVbujuWVIdV', '14509 Milverton Rd, OH, 44122', 918, 125, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(882, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 120, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(883, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 157, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(884, 'kiRfOKDyVWVbujuWVIdV', 'Emergency Reason', 919, 125, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(885, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 157, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(886, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 120, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(887, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 125, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(888, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 120, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(889, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 125, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(890, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 120, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(891, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 125, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(892, 'kiRfOKDyVWVbujuWVIdV', 'Excellent', 925, 125, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(893, 'kiRfOKDyVWVbujuWVIdV', 'Fair', 925, 120, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(894, 'kiRfOKDyVWVbujuWVIdV', '2190 hwy 490, Ky, 40729', 918, 129, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(895, 'kiRfOKDyVWVbujuWVIdV', 'Foreclosure', 919, 129, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(896, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 129, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(897, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 129, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(898, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 129, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(899, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 129, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(900, 'kiRfOKDyVWVbujuWVIdV', '3561 North 9th, Texas, 79603', 918, 102, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(901, 'kiRfOKDyVWVbujuWVIdV', 'Divorce', 919, 102, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(902, 'kiRfOKDyVWVbujuWVIdV', 'Single Family', 921, 102, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(903, 'kiRfOKDyVWVbujuWVIdV', 'ASAP', 923, 102, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(904, 'kiRfOKDyVWVbujuWVIdV', 'No, It’s Not Listed', 924, 102, '2025-11-05 03:55:15', '2025-11-05 03:55:15'),
(905, 'kiRfOKDyVWVbujuWVIdV', 'Good', 925, 102, '2025-11-05 03:55:15', '2025-11-05 03:55:15');

-- --------------------------------------------------------

--
-- Table structure for table `contact_tags`
--

CREATE TABLE `contact_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_tags`
--

INSERT INTO `contact_tags` (`id`, `contact_id`, `tag`, `created_at`, `updated_at`) VALUES
(10, 258, 'paid', '2025-10-30 17:06:59', '2025-10-30 17:06:59'),
(11, 314, 'invoice sent', '2025-11-03 20:20:39', '2025-11-03 20:20:39'),
(12, 314, 'second years', '2025-11-03 20:20:39', '2025-11-03 20:20:39'),
(13, 315, 'refral', '2025-11-03 20:22:48', '2025-11-03 20:22:48'),
(14, 317, 'refral', '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(15, 318, 'refral', '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(16, 319, 'refral', '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(17, 320, 'alibhai', '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(18, 320, 'bg-black', '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(19, 320, 'bg-#0000', '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(20, 321, 'refral', '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(21, 322, 'second years', '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(22, 322, 'ahmad', '2025-11-03 20:22:49', '2025-11-03 20:22:49'),
(23, 323, 'faraz', '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(24, 323, 'fake', '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(25, 323, 'invoice sent', '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(26, 323, 'refral', '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(27, 323, 'second years', '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(28, 324, 'faraz', '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(29, 324, 'fake', '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(30, 324, 'refral', '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(31, 324, 'invoice sent', '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(32, 324, 'second years', '2025-11-03 20:22:50', '2025-11-03 20:22:50'),
(33, 326, 'alibhai', '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(34, 326, 'appiontment test', '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(35, 329, 'ahmad', '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(36, 330, 'dialtag', '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(37, 332, 'invoice sent', '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(38, 332, 'second years', '2025-11-03 20:23:16', '2025-11-03 20:23:16'),
(39, 336, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(40, 336, 'second years', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(41, 339, 'refral', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(42, 339, 'faraz', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(43, 339, 'fake', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(44, 339, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(45, 339, 'second years', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(46, 342, 'faraz', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(47, 342, 'fake', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(48, 342, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(49, 342, 'second years', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(50, 346, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(51, 347, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(52, 347, 'second years', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(53, 348, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(54, 348, 'second years', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(55, 352, 'dialtag', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(56, 353, 'appiontment test', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(57, 353, 'bg-red', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(58, 353, 'color-green', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(59, 354, 'anwar', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(60, 355, 'bg-aqua', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(61, 356, 'faraz', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(62, 356, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(63, 356, 'second years', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(64, 356, 'fake', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(65, 357, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(66, 357, 'second years', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(67, 358, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(68, 358, 'second years', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(69, 359, 'ahmad', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(70, 360, 'ahmad', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(71, 360, 'bg-black', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(72, 361, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(73, 361, 'second years', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(74, 363, 'pil1', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(75, 363, 'pil2', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(76, 363, 'pil3', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(77, 365, 'invoice sent', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(78, 365, 'second years', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(79, 366, 'ahmad', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(80, 366, 'color-black', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(81, 367, 'bg-black', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(82, 367, 'bg-aqua', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(83, 367, 'bg-#0000', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(84, 368, 'new lead', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(85, 367, 'appiontment test', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(86, 368, 'appiontment test', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(87, 368, 'ahmad', '2025-11-03 20:23:17', '2025-11-03 20:23:17'),
(88, 374, 'refral', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(89, 374, 'faraz', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(90, 374, 'fake', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(91, 374, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(92, 374, 'second years', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(93, 375, 'new lead', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(94, 375, 'appiontment test', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(95, 375, 'ahmad', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(96, 376, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(97, 377, 'refral', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(98, 377, 'faraz', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(99, 377, 'fake', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(100, 377, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(101, 377, 'second years', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(102, 382, 'refral', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(103, 382, 'faraz', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(104, 382, 'fake', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(105, 382, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(106, 382, 'second years', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(107, 384, 'ahmad', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(108, 386, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(109, 386, 'second years', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(110, 389, 'refral', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(111, 389, 'faraz', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(112, 389, 'fake', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(113, 389, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(114, 389, 'second years', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(115, 391, 'dialtag', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(116, 390, 'faraz', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(117, 390, 'fake', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(118, 390, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(119, 390, 'second years', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(120, 392, 'refral', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(121, 392, 'faraz', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(122, 392, 'fake', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(123, 392, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(124, 392, 'second years', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(125, 395, 'refral', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(126, 395, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(127, 395, 'second years', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(128, 397, 'new lead', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(129, 397, 'appiontment test', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(130, 397, 'ahmad', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(131, 398, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(132, 398, 'second years', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(133, 399, 'refral', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(134, 399, 'faraz', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(135, 399, 'invoice sent', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(136, 399, 'second years', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(137, 399, 'fake', '2025-11-03 20:23:18', '2025-11-03 20:23:18'),
(138, 401, 'refral', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(139, 401, 'faraz', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(140, 401, 'fake', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(141, 401, 'invoice sent', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(142, 401, 'second years', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(143, 404, 'ahmad', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(144, 405, 'invoice sent', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(145, 405, 'second years', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(146, 405, 'ready_for_payout', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(147, 406, 'new lead', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(148, 406, 'appiontment test', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(149, 406, 'ahmad', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(150, 408, 'refral', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(151, 408, 'invoice sent', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(152, 408, 'faraz', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(153, 408, 'second years', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(154, 408, 'fake', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(155, 409, 'invoice sent', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(156, 409, 'second years', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(157, 410, 'ai bot', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(158, 410, 'appiontment test', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(159, 410, 'new lead', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(160, 410, 'ahmad', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(161, 412, 'ai bot', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(162, 412, 'dialtag', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(163, 413, 'faraz', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(164, 413, 'fake', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(165, 415, 'invoice sent', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(166, 415, 'faraz', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(167, 415, 'fake', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(168, 415, 'second years', '2025-11-03 20:23:19', '2025-11-03 20:23:19'),
(169, 418, 'ai bot', '2025-11-03 20:23:48', '2025-11-03 20:23:48'),
(170, 418, 'anwar', '2025-11-03 20:23:48', '2025-11-03 20:23:48'),
(171, 418, 'auto caller', '2025-11-03 20:23:48', '2025-11-03 20:23:48'),
(172, 419, 'refral', '2025-11-03 20:33:29', '2025-11-03 20:33:29'),
(173, 419, 'faraz', '2025-11-03 20:33:29', '2025-11-03 20:33:29'),
(174, 419, 'fake', '2025-11-03 20:33:29', '2025-11-03 20:33:29'),
(175, 419, 'invoice sent', '2025-11-03 20:33:29', '2025-11-03 20:33:29'),
(176, 419, 'second years', '2025-11-03 20:33:29', '2025-11-03 20:33:29'),
(177, 420, 'appiontment test', '2025-11-03 20:33:35', '2025-11-03 20:33:35'),
(178, 431, 'faraz', '2025-11-03 20:35:05', '2025-11-03 20:35:05'),
(179, 431, 'invoice sent', '2025-11-03 20:35:05', '2025-11-03 20:35:05'),
(180, 431, 'second years', '2025-11-03 20:35:05', '2025-11-03 20:35:05'),
(181, 431, 'fake', '2025-11-03 20:35:05', '2025-11-03 20:35:05'),
(182, 434, 'ahmad', '2025-11-03 20:35:08', '2025-11-03 20:35:08'),
(183, 435, 'invoice sent', '2025-11-03 20:35:08', '2025-11-03 20:35:08'),
(184, 435, 'second years', '2025-11-03 20:35:08', '2025-11-03 20:35:08'),
(185, 436, 'invoice sent', '2025-11-03 20:35:09', '2025-11-03 20:35:09'),
(186, 436, 'second years', '2025-11-03 20:35:09', '2025-11-03 20:35:09'),
(187, 438, 'dialtag', '2025-11-03 20:35:09', '2025-11-03 20:35:09'),
(188, 440, 'new lead', '2025-11-03 20:35:12', '2025-11-03 20:35:12'),
(189, 440, 'ahmad', '2025-11-03 20:35:12', '2025-11-03 20:35:12'),
(190, 440, 'ai bot', '2025-11-03 20:35:12', '2025-11-03 20:35:12'),
(191, 440, 'bg-orange', '2025-11-03 20:35:12', '2025-11-03 20:35:12'),
(192, 442, 'invoice sent', '2025-11-03 20:35:13', '2025-11-03 20:35:13'),
(193, 442, 'second years', '2025-11-03 20:35:13', '2025-11-03 20:35:13'),
(194, 445, 'refral', '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(195, 445, 'faraz', '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(196, 445, 'fake', '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(197, 445, 'invoice sent', '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(198, 445, 'second years', '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(199, 448, 'invoice sent', '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(200, 448, 'second years', '2025-11-03 20:35:15', '2025-11-03 20:35:15'),
(201, 449, 'invoice sent', '2025-11-03 20:35:16', '2025-11-03 20:35:16'),
(202, 449, 'faraz', '2025-11-03 20:35:16', '2025-11-03 20:35:16'),
(203, 449, 'fake', '2025-11-03 20:35:16', '2025-11-03 20:35:16'),
(204, 449, 'second years', '2025-11-03 20:35:16', '2025-11-03 20:35:16'),
(205, 450, 'invoice sent', '2025-11-03 20:35:18', '2025-11-03 20:35:18'),
(206, 450, 'second years', '2025-11-03 20:35:18', '2025-11-03 20:35:18'),
(207, 451, 'bg-purple', '2025-11-03 20:35:18', '2025-11-03 20:35:18'),
(208, 452, 'invoice sent', '2025-11-03 20:35:18', '2025-11-03 20:35:18'),
(209, 452, 'second years', '2025-11-03 20:35:18', '2025-11-03 20:35:18'),
(210, 456, 'dnd', '2025-11-03 20:35:27', '2025-11-03 20:35:27'),
(211, 456, 'ahmad', '2025-11-03 20:35:27', '2025-11-03 20:35:27'),
(212, 459, 'ahmad', '2025-11-03 20:35:36', '2025-11-03 20:35:36'),
(213, 459, 'newtag', '2025-11-03 20:35:36', '2025-11-03 20:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `cf_id` varchar(255) DEFAULT NULL,
  `cf_name` varchar(255) DEFAULT NULL,
  `cf_value` varchar(255) DEFAULT NULL,
  `cf_key` varchar(255) DEFAULT NULL,
  `dataType` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `location_id`, `cf_id`, `cf_name`, `cf_value`, `cf_key`, `dataType`, `created_at`, `updated_at`) VALUES
(918, 'kiRfOKDyVWVbujuWVIdV', '1mME48yBnjHXF0sf1lYZ', 'Property Address', NULL, 'contact.property_address', 'TEXT', '2025-10-29 17:47:04', '2025-10-29 17:47:04'),
(919, 'kiRfOKDyVWVbujuWVIdV', 'F9P1ZCSRdzjYZpAqjtee', 'Why Are You Lookin To Sell?', NULL, 'contact.why_are_you_lookin_to_sell', 'TEXT', '2025-10-29 17:47:04', '2025-10-29 17:47:04'),
(920, 'kiRfOKDyVWVbujuWVIdV', 'MXyROk07TtMkWJ3IZalm', 'Subject:', NULL, 'contact.subject', 'TEXT', '2025-10-29 17:47:04', '2025-10-29 17:47:04'),
(921, 'kiRfOKDyVWVbujuWVIdV', 'QjYbaWV9ARhisAdHyURR', 'What Type Of Property Is It?', NULL, 'contact.what_type_of_property_is_it', 'TEXT', '2025-10-29 17:47:04', '2025-10-29 17:47:04'),
(922, 'kiRfOKDyVWVbujuWVIdV', 'VVP5as6Px81yxkSVw6b6', 'Message:', NULL, 'contact.message', 'LARGE_TEXT', '2025-10-29 17:47:04', '2025-10-29 17:47:04'),
(923, 'kiRfOKDyVWVbujuWVIdV', 'pVhTeGGQuKGvAOUBwysi', 'When Do You Want To Sell?', NULL, 'contact.when_do_you_want_to_sell', 'TEXT', '2025-10-29 17:47:04', '2025-10-29 17:47:04'),
(924, 'kiRfOKDyVWVbujuWVIdV', 'xn15xp58Ts6LlFbhcVQh', 'Is The Property Listed?', NULL, 'contact.is_the_property_listed', 'TEXT', '2025-10-29 17:47:04', '2025-10-29 17:47:04'),
(925, 'kiRfOKDyVWVbujuWVIdV', 'z8Vuw1uSXKKfViDr3RRJ', 'What\'s The Properties Condition?', NULL, 'contact.whats_the_properties_condition', 'TEXT', '2025-10-29 17:47:04', '2025-10-29 17:47:04'),
(926, 'kiRfOKDyVWVbujuWVIdV', 'LOUvjs0yc2KsffNCrlk2', 'property ownership status', NULL, 'contact.property_ownership_status', 'TEXT', '2025-10-29 17:47:04', '2025-10-29 17:47:04'),
(927, 'kiRfOKDyVWVbujuWVIdV', 'ddzBhdrxmdnrMAbZozAr', 'APN', NULL, 'contact.apn', 'TEXT', '2025-10-29 17:47:04', '2025-10-29 17:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `custom_values`
--

CREATE TABLE `custom_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_email` varchar(255) NOT NULL,
  `agent_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `ghl_auths`
--

CREATE TABLE `ghl_auths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `access_token` text NOT NULL,
  `refresh_token` text NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `location_id` varchar(190) DEFAULT NULL,
  `user_type` varchar(30) DEFAULT 'Location',
  `expires_in` varchar(6) DEFAULT NULL,
  `company_id` varchar(190) DEFAULT NULL,
  `crm_user_id` varchar(190) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ghl_auths`
--

INSERT INTO `ghl_auths` (`id`, `access_token`, `refresh_token`, `name`, `user_id`, `location_id`, `user_type`, `expires_in`, `company_id`, `crm_user_id`, `created_at`, `updated_at`) VALUES
(8, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRoQ2xhc3MiOiJMb2NhdGlvbiIsImF1dGhDbGFzc0lkIjoia2lSZk9LRHlWV1ZidWp1V1ZJZFYiLCJzb3VyY2UiOiJJTlRFR1JBVElPTiIsInNvdXJjZUlkIjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmLW1oMTB5NjN3IiwiY2hhbm5lbCI6Ik9BVVRIIiwicHJpbWFyeUF1dGhDbGFzc0lkIjoia2lSZk9LRHlWV1ZidWp1V1ZJZFYiLCJvYXV0aE1ldGEiOnsic2NvcGVzIjpbImNvbnRhY3RzLnJlYWRvbmx5IiwiY29udGFjdHMud3JpdGUiLCJsb2NhdGlvbnMucmVhZG9ubHkiLCJsb2NhdGlvbnMvY3VzdG9tVmFsdWVzLnJlYWRvbmx5IiwibG9jYXRpb25zL2N1c3RvbVZhbHVlcy53cml0ZSIsImxvY2F0aW9ucy9jdXN0b21GaWVsZHMucmVhZG9ubHkiLCJsb2NhdGlvbnMvY3VzdG9tRmllbGRzLndyaXRlIiwibG9jYXRpb25zL3RhZ3MucmVhZG9ubHkiLCJsb2NhdGlvbnMvdGFncy53cml0ZSIsIm9wcG9ydHVuaXRpZXMucmVhZG9ubHkiLCJvcHBvcnR1bml0aWVzLndyaXRlIiwidXNlcnMucmVhZG9ubHkiXSwiY2xpZW50IjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmIiwidmVyc2lvbklkIjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmIiwiY2xpZW50S2V5IjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmLW1oMTB5NjN3In0sImlhdCI6MTc2MTc1OTgxMi4yLCJleHAiOjE3NjE4NDYyMTIuMn0.gn8EBBIG0l4ibjAzV04VXE9jDvMOSrJu64hFNffvg_X0a6Z7kQ4KjJC4ff2SCi2-HnO7TfpezRc7OqlcCA3sWFdLlTl-v7imz-an994xU9-u8ycO9pJZCOhdi5CeEGIezpBVSmbkwx5XV4ltK0a0u3ifCwtETB8DttXVFBNy9uCyizS9xN9ddQD8y9tJyMCMLrk3WZfHa4pAdm77ca1RQrvZklZ4QB-z59_tc6lwU8064ylk2lwdZ7ufb3a85wUAEi7tv55qoJivFT_u5_Hcx02HB_eGerGg3kZ45mUjLfxx7xLYAUHxsT0kQG0G00DiaWgNQFNVFuxQTeJEzQ3d16Rs5QDbBWQHRA6o7UcWlDQ-SwlR6-dQnRdTggTQO6JdE4e2iAbBcqdG7d7amxdxaTh5cnyyUwZio5vSHm_C7UxkyeQSFYhziokOZIvgjJgGpJ1iuAXA6005wguEK3CWRa5dB2FQGyjn-4_SHfeLLUqcU3GPzQQq7g6XGOz9sGgQ9xwjbj1q8sSgj--MwK4nxZBsZaI9KLGxhODTjg63LoGmfB6_lTB787wpbtJ7ghRxkdsOgaKVNFPaQb6zsG4F5pgd8SuVedNWptfbenY1j8T58ahmbEETeJOLdgntsKOtXd4kMTFVQ6Ak5ovtOErc4QekLgT3iu_rup6ct3nceTY', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRoQ2xhc3MiOiJMb2NhdGlvbiIsImF1dGhDbGFzc0lkIjoia2lSZk9LRHlWV1ZidWp1V1ZJZFYiLCJzb3VyY2UiOiJJTlRFR1JBVElPTiIsInNvdXJjZUlkIjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmLW1oMTB5NjN3IiwiY2hhbm5lbCI6Ik9BVVRIIiwicHJpbWFyeUF1dGhDbGFzc0lkIjoia2lSZk9LRHlWV1ZidWp1V1ZJZFYiLCJvYXV0aE1ldGEiOnsic2NvcGVzIjpbImNvbnRhY3RzLnJlYWRvbmx5IiwiY29udGFjdHMud3JpdGUiLCJsb2NhdGlvbnMucmVhZG9ubHkiLCJsb2NhdGlvbnMvY3VzdG9tVmFsdWVzLnJlYWRvbmx5IiwibG9jYXRpb25zL2N1c3RvbVZhbHVlcy53cml0ZSIsImxvY2F0aW9ucy9jdXN0b21GaWVsZHMucmVhZG9ubHkiLCJsb2NhdGlvbnMvY3VzdG9tRmllbGRzLndyaXRlIiwibG9jYXRpb25zL3RhZ3MucmVhZG9ubHkiLCJsb2NhdGlvbnMvdGFncy53cml0ZSIsIm9wcG9ydHVuaXRpZXMucmVhZG9ubHkiLCJvcHBvcnR1bml0aWVzLndyaXRlIiwidXNlcnMucmVhZG9ubHkiXSwiY2xpZW50IjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmIiwidmVyc2lvbklkIjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmIiwiY2xpZW50S2V5IjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmLW1oMTB5NjN3In0sImlhdCI6MTc2MTc1OTgxMi4yMDcsImV4cCI6MTc5MzI5NTgxMi4yMDcsInVuaXF1ZUlkIjoiMDliYTRhMGQtOGJhNS00OTcwLThmODgtNmNkNjc3ZWRmYmUxIiwidiI6IjIifQ.LZY5ljnWCGpZnaX_zbCOCdjwvPJtiIGpAxs99QvYXNJWDosUczMuMnzbm1swPSVsG_TsrUHq9zCTZnmltkRDQNZTPRWKB7AcTV1iFk_IokJj8lCd8S0u5ILrADCLG5N2ClbkOWuHFB5wHFFV0cqwit-4ldPE3v_2M7yBtjcf4-kl8aE4532e-fNFf8g3qvFNnvz2d_ykzDsSCG3PChhMy8g7_ZDwQVzmpOOt_RamXg7aLsz0kDlMGd8QOAtHlUesNkVksXa5Rf_mBSBlIHkXdn1Paj4yYZJ3rquEwaIt8Mix33engk74v_Ws5gjkVmQQ3qzLlQklL_FQnT806I6ZHVGa64r1kLlzunvVQl3aktlQMrzlWiGa3qrn1Q16-BwuQMLJRd_tHoyBGCnSB3AJN2tbwK3kSWo19tjqJrGqMS1J2lhoYsu4uAjusF3-bHAkHNX2_R1aui2QTwCnyPkZdKxxzCQmB5OafkMIb2nHYBc0D3j9IEnYYHnkgfrWNuazNoHPi8PEGxPYeffANNCCqlrFHWNdMMuR16UsTRtgOniZBlQAhZR2C07bQXdXyTw8GoCt2_zB8EEs7aOXjjWU3Vpn5fJsa27tuEaEomW1uGe0hIE49bmRqgyV-FRVnsqS4s5pElKAuDdVKLYuak78SZRjg-vFtxlZm8R6e7bB5ak', NULL, 76, 'kiRfOKDyVWVbujuWVIdV', 'Location', '86399', 'IR572rE84fYmg4x4sOFL', '', '2025-10-21 21:52:24', '2025-10-29 17:43:32'),
(9, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRoQ2xhc3MiOiJMb2NhdGlvbiIsImF1dGhDbGFzc0lkIjoiOGdtN3E5clI4TTFkY205a01zaXEiLCJzb3VyY2UiOiJJTlRFR1JBVElPTiIsInNvdXJjZUlkIjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmLW1oMTB5NjN3IiwiY2hhbm5lbCI6Ik9BVVRIIiwicHJpbWFyeUF1dGhDbGFzc0lkIjoiOGdtN3E5clI4TTFkY205a01zaXEiLCJvYXV0aE1ldGEiOnsic2NvcGVzIjpbImNvbnRhY3RzLnJlYWRvbmx5IiwiY29udGFjdHMud3JpdGUiLCJsb2NhdGlvbnMucmVhZG9ubHkiLCJsb2NhdGlvbnMvY3VzdG9tVmFsdWVzLnJlYWRvbmx5IiwibG9jYXRpb25zL2N1c3RvbVZhbHVlcy53cml0ZSIsImxvY2F0aW9ucy9jdXN0b21GaWVsZHMucmVhZG9ubHkiLCJsb2NhdGlvbnMvY3VzdG9tRmllbGRzLndyaXRlIiwibG9jYXRpb25zL3RhZ3MucmVhZG9ubHkiLCJsb2NhdGlvbnMvdGFncy53cml0ZSIsIm9wcG9ydHVuaXRpZXMucmVhZG9ubHkiLCJvcHBvcnR1bml0aWVzLndyaXRlIiwidXNlcnMucmVhZG9ubHkiXSwiY2xpZW50IjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmIiwidmVyc2lvbklkIjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmIiwiY2xpZW50S2V5IjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmLW1oMTB5NjN3In0sImlhdCI6MTc2MTY4OTUwNi4yMDcsImV4cCI6MTc2MTc3NTkwNi4yMDd9.h5kS5uhbXH21o-nCH0kuLaLhbqhy62i5cexPpiOOXwP8fa7FLwmKwhKo70KoNYus8TKpf6MSFpaZdNKrAfYaVLmb-XrcbRQ3bw3tqqMEi8-780kGETtWSNzm2OdXZxq8K6LsWAYYfTf2xKp2aCDU8dFUkaYesPf1z2oiOe19dL6qgDvqUrB7gqVakBFKG66yoB7xBKAY8eVn57rpfKsAsHFqBXuVqxpP-Hrcw36VH4AmRcr67w15O8NXz_mwdY61k0TrnaN6xAY9h2guo4LfhzPVDq4wcDAnrUm94n68lxnOv8Z3L3YPIfFv2alQxIZ0hfwVdjqAixUswqCV4uagthB-DQG2M1dRrkUEYdj84IKm-bzUE4C4t6My7eyaeSvvGF-JS1zBUr1gf2oyNGhwxEggMhjHcjh3SeNemqzZ0r-GBY2wjJNBvQRc7zHh-tvcdDZER6iP2ZtNlK_Vy9Xh6e74YZRAP-iieyjRoEEEGoubY99IIea9erPwbEzeqIqvdh5J2nREuJ67zN80_59OS0I7PhSfQzhd-vR2IZ85qx-lB5S1ZOR5XETHa8hIOvgQafyRz7wiJ3EUkldozRetIFrSA6vA0LT3h4QhpczJ74r02CyuXjoqiGUlsut3TjgqO424mTDBCM-JBd-6KQGvVIxSVrzghd22VTsG1d025TM', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdXRoQ2xhc3MiOiJMb2NhdGlvbiIsImF1dGhDbGFzc0lkIjoiOGdtN3E5clI4TTFkY205a01zaXEiLCJzb3VyY2UiOiJJTlRFR1JBVElPTiIsInNvdXJjZUlkIjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmLW1oMTB5NjN3IiwiY2hhbm5lbCI6Ik9BVVRIIiwicHJpbWFyeUF1dGhDbGFzc0lkIjoiOGdtN3E5clI4TTFkY205a01zaXEiLCJvYXV0aE1ldGEiOnsic2NvcGVzIjpbImNvbnRhY3RzLnJlYWRvbmx5IiwiY29udGFjdHMud3JpdGUiLCJsb2NhdGlvbnMucmVhZG9ubHkiLCJsb2NhdGlvbnMvY3VzdG9tVmFsdWVzLnJlYWRvbmx5IiwibG9jYXRpb25zL2N1c3RvbVZhbHVlcy53cml0ZSIsImxvY2F0aW9ucy9jdXN0b21GaWVsZHMucmVhZG9ubHkiLCJsb2NhdGlvbnMvY3VzdG9tRmllbGRzLndyaXRlIiwibG9jYXRpb25zL3RhZ3MucmVhZG9ubHkiLCJsb2NhdGlvbnMvdGFncy53cml0ZSIsIm9wcG9ydHVuaXRpZXMucmVhZG9ubHkiLCJvcHBvcnR1bml0aWVzLndyaXRlIiwidXNlcnMucmVhZG9ubHkiXSwiY2xpZW50IjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmIiwidmVyc2lvbklkIjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmIiwiY2xpZW50S2V5IjoiNjhmN2VlMjVlMjkxZTg4ZjE0NGE1NmJmLW1oMTB5NjN3In0sImlhdCI6MTc2MTY4OTUwNi4yMTUsImV4cCI6MTc5MzIyNTUwNi4yMTUsInVuaXF1ZUlkIjoiNjMyNDJkZTItMWViNi00N2UwLWJiMDYtYjAxZTJhMDI2ZjcyIiwidiI6IjIifQ.LsEdC9xwzErj79OWCvDe3GyiuxnEgn0esuVKeCYGbEFyTKUyDgHaU0WgywLxqSU4soDWXUMBXjsD6d4_V9gNO9PpoIDALiy3lOkKavj6qSKsSL2i4btQJKBNA9LyWQcF-DRueybNOx_l2ELsxYqDLMGXo5l0pOmrPJpIsO4p7KIBb91TiOMBC9BLCuQ5NiTSamrwfdjHAzMIWqGH_84QJiXDXWhxd45TDLuDU5EnE_A0BUZXYSC0LzvnuO9VrSAEaiOExGEY_c0996Ht0f_Gh4-ZUM269GFuKlhN9d00ao7JR6z0feAvRZNDaJoLuaS7abgDYKP9uiqNavmExS6a4Z1-EwK3PAbohIWRqjEwr7oXwDLHhxDnm_gorSX1FKSoX24u9nJUP3JKis5Rz7mmLQ5xKhwyS-c1t8Ssboz4H4dgeGoVWYs1CIF2w6Yu1FFEznOwyE0IIhXSSt8_79mgXNRs-aWRU56-uDMjNH9Rf-5Aba_1fwjXH_gATgjnvOsrUNk0acLqLHv03i0qcbP6dMlF-nCntElXGuyt6kmaumG01m-wWH1xpHdPkfA31q11F-BeHOjyDK76HI-g0YhLdeY7RwuSQWKd_0ArIXY90N7PhkYE_hQFnWkTtWw25NQ3jo0F_BY6rgsZrKzHboW4FybrlDLroIchAtYJD34cmpE', NULL, 76, '8gm7q9rR8M1dcm9kMsiq', 'Location', '86399', 'iTN6zucBeUuSQtzGPJd9', '', '2025-10-28 22:11:46', '2025-10-28 22:11:46');

-- --------------------------------------------------------

--
-- Table structure for table `ghl_users`
--

CREATE TABLE `ghl_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `ghl_user_id` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `scopes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `scopes_assigned_to_only` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `profile_photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ghl_users`
--

INSERT INTO `ghl_users` (`id`, `company_id`, `first_name`, `last_name`, `email`, `password`, `phone`, `type`, `role`, `ghl_user_id`, `location_id`, `permissions`, `scopes`, `scopes_assigned_to_only`, `user_id`, `profile_photo`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Abegail', 'Pingaron', 'abeping918@gmail.com', NULL, NULL, 'account', 'user', 'Aj2MHYg7hGlPYViIofn9', 'kiRfOKDyVWVbujuWVIdV', NULL, '\"[\\\"adPublishing.readonly\\\",\\\"adPublishing.write\\\",\\\"blogs.write\\\",\\\"calendars.readonly\\\",\\\"calendars.write\\\",\\\"calendars\\\\\\/events.write\\\",\\\"calendars\\\\\\/groups.write\\\",\\\"campaigns.write\\\",\\\"certificates.readonly\\\",\\\"certificates.write\\\",\\\"communities.write\\\",\\\"contacts.write\\\",\\\"contacts\\\\\\/bulkActions.write\\\",\\\"contentAI.write\\\",\\\"conversations.readonly\\\",\\\"conversations.write\\\",\\\"conversations\\\\\\/message.readonly\\\",\\\"conversations\\\\\\/message.write\\\",\\\"dashboard\\\\\\/stats.readonly\\\",\\\"forms.write\\\",\\\"funnels.write\\\",\\\"gokollab.write\\\",\\\"invoices.readonly\\\",\\\"invoices.write\\\",\\\"invoices\\\\\\/schedule.readonly\\\",\\\"invoices\\\\\\/schedule.write\\\",\\\"invoices\\\\\\/template.readonly\\\",\\\"invoices\\\\\\/template.write\\\",\\\"launchpad.readonly\\\",\\\"launchpad.write\\\",\\\"locations\\\\\\/tags.readonly\\\",\\\"locations\\\\\\/tags.write\\\",\\\"marketing.write\\\",\\\"marketing\\\\\\/affiliate.write\\\",\\\"medias.readonly\\\",\\\"medias.write\\\",\\\"membership.write\\\",\\\"native-integrations.readonly\\\",\\\"native-integrations.write\\\",\\\"opportunities.write\\\",\\\"opportunities\\\\\\/bulkActions.write\\\",\\\"opportunities\\\\\\/leadValue.readonly\\\",\\\"payments.write\\\",\\\"payments\\\\\\/orders.collectPayment\\\",\\\"payments\\\\\\/orders.export\\\",\\\"payments\\\\\\/orders.import\\\",\\\"payments\\\\\\/orders.readonly\\\",\\\"payments\\\\\\/records.write\\\",\\\"payments\\\\\\/settings.configureReceipt\\\",\\\"payments\\\\\\/settings.configureSubscription\\\",\\\"payments\\\\\\/settings.readonly\\\",\\\"payments\\\\\\/subscriptions.export\\\",\\\"payments\\\\\\/subscriptions.pauseResumeCancel\\\",\\\"payments\\\\\\/subscriptions.readonly\\\",\\\"payments\\\\\\/subscriptions.sharePaymentMethod\\\",\\\"payments\\\\\\/subscriptions.update\\\",\\\"payments\\\\\\/subscriptions.write\\\",\\\"payments\\\\\\/taxesSettings.configureAutomatic\\\",\\\"payments\\\\\\/taxesSettings.manageRates\\\",\\\"payments\\\\\\/taxesSettings.readonly\\\",\\\"payments\\\\\\/taxesSettings.updateInclusiveExclusive\\\",\\\"payments\\\\\\/transactions.export\\\",\\\"payments\\\\\\/transactions.import\\\",\\\"payments\\\\\\/transactions.readonly\\\",\\\"payments\\\\\\/transactions.refund\\\",\\\"payments\\\\\\/transactions.viewReceipts\\\",\\\"products.bulkActions\\\",\\\"products.delete\\\",\\\"products.duplicate\\\",\\\"products.readonly\\\",\\\"products.write\\\",\\\"prospecting.readonly\\\",\\\"prospecting.write\\\",\\\"prospecting\\\\\\/auditReport.write\\\",\\\"prospecting\\\\\\/reports.readonly\\\",\\\"qrcodes.write\\\",\\\"quizzes.write\\\",\\\"reporting\\\\\\/adwords.readonly\\\",\\\"reporting\\\\\\/agent.readonly\\\",\\\"reporting\\\\\\/attributions.readonly\\\",\\\"reporting\\\\\\/facebookAds.readonly\\\",\\\"reporting\\\\\\/phone.readonly\\\",\\\"reporting\\\\\\/reports.readonly\\\",\\\"reporting\\\\\\/reports.write\\\",\\\"reputation\\\\\\/listing.write\\\",\\\"reputation\\\\\\/review.write\\\",\\\"settings.write\\\",\\\"socialplanner\\\\\\/account.readonly\\\",\\\"socialplanner\\\\\\/account.write\\\",\\\"socialplanner\\\\\\/category.readonly\\\",\\\"socialplanner\\\\\\/category.write\\\",\\\"socialplanner\\\\\\/csv.readonly\\\",\\\"socialplanner\\\\\\/csv.write\\\",\\\"socialplanner\\\\\\/facebook.readonly\\\",\\\"socialplanner\\\\\\/filters.readonly\\\",\\\"socialplanner\\\\\\/group.write\\\",\\\"socialplanner\\\\\\/hashtag.readonly\\\",\\\"socialplanner\\\\\\/hashtag.write\\\",\\\"socialplanner\\\\\\/linkedin.readonly\\\",\\\"socialplanner\\\\\\/medias.readonly\\\",\\\"socialplanner\\\\\\/medias.write\\\",\\\"socialplanner\\\\\\/metatag.readonly\\\",\\\"socialplanner\\\\\\/notification.readonly\\\",\\\"socialplanner\\\\\\/notification.write\\\",\\\"socialplanner\\\\\\/oauth.readonly\\\",\\\"socialplanner\\\\\\/oauth.write\\\",\\\"socialplanner\\\\\\/post.readonly\\\",\\\"socialplanner\\\\\\/post.write\\\",\\\"socialplanner\\\\\\/recurring.readonly\\\",\\\"socialplanner\\\\\\/recurring.write\\\",\\\"socialplanner\\\\\\/review.readonly\\\",\\\"socialplanner\\\\\\/review.write\\\",\\\"socialplanner\\\\\\/rss.readonly\\\",\\\"socialplanner\\\\\\/rss.write\\\",\\\"socialplanner\\\\\\/search.readonly\\\",\\\"socialplanner\\\\\\/setting.readonly\\\",\\\"socialplanner\\\\\\/setting.write\\\",\\\"socialplanner\\\\\\/snapshot.readonly\\\",\\\"socialplanner\\\\\\/snapshot.write\\\",\\\"socialplanner\\\\\\/stat.readonly\\\",\\\"socialplanner\\\\\\/tag.readonly\\\",\\\"socialplanner\\\\\\/tag.write\\\",\\\"socialplanner\\\\\\/twitter.readonly\\\",\\\"socialplanner\\\\\\/watermarks.readonly\\\",\\\"socialplanner\\\\\\/watermarks.write\\\",\\\"surveys.write\\\",\\\"text-ai-agent-goals.readonly\\\",\\\"text-ai-agent-goals.write\\\",\\\"text-ai-agent-training.write\\\",\\\"text-ai-agents-dashboard.readonly\\\",\\\"text-ai-agents.write\\\",\\\"triggers.write\\\",\\\"voice-ai-agent-goals.readonly\\\",\\\"voice-ai-agent-goals.write\\\",\\\"voice-ai-agents.readonly\\\",\\\"voice-ai-agents.write\\\",\\\"voice-ai-dashboard.readonly\\\",\\\"websites.write\\\",\\\"wordpress.read\\\",\\\"wordpress.write\\\",\\\"workflows.write\\\"]\"', NULL, 97, NULL, '2025-10-29 17:47:03', '2025-10-29 17:47:03'),
(2, NULL, 'Anas', 'Abid', 'anasabid078@gmail.com', NULL, NULL, 'account', 'admin', 'FexmiV2cwdlPPP7bbOKV', 'kiRfOKDyVWVbujuWVIdV', NULL, NULL, NULL, 98, NULL, '2025-10-29 17:47:03', '2025-10-29 17:47:03'),
(3, NULL, 'Hamza', 'Ya', 'developerhamza95@gmail.com', NULL, NULL, 'account', 'admin', '0TPBVGDswLTGn777djTu', 'kiRfOKDyVWVbujuWVIdV', NULL, NULL, NULL, 99, NULL, '2025-10-29 17:47:03', '2025-10-29 17:47:03'),
(4, NULL, 'Roynel', 'Poquiz', 'thoucallmestan@gmail.com', NULL, NULL, 'account', 'user', 'eo37GC6ZWB4tnZkZRsQR', 'kiRfOKDyVWVbujuWVIdV', NULL, '\"[\\\"calendars.readonly\\\",\\\"calendars.write\\\",\\\"calendars\\\\\\/events.write\\\",\\\"calendars\\\\\\/groups.write\\\",\\\"campaigns.write\\\",\\\"contacts.write\\\",\\\"contacts\\\\\\/bulkActions.write\\\",\\\"contentAI.write\\\",\\\"conversations.readonly\\\",\\\"conversations.write\\\",\\\"conversations\\\\\\/message.readonly\\\",\\\"conversations\\\\\\/message.write\\\",\\\"dashboard\\\\\\/stats.readonly\\\",\\\"forms.write\\\",\\\"locations\\\\\\/tags.readonly\\\",\\\"locations\\\\\\/tags.write\\\",\\\"opportunities.write\\\",\\\"opportunities\\\\\\/bulkActions.write\\\",\\\"opportunities\\\\\\/leadValue.readonly\\\",\\\"prospecting\\\\\\/auditReport.write\\\",\\\"reporting\\\\\\/adwords.readonly\\\",\\\"reporting\\\\\\/agent.readonly\\\",\\\"reporting\\\\\\/attributions.readonly\\\",\\\"reporting\\\\\\/facebookAds.readonly\\\",\\\"reporting\\\\\\/phone.readonly\\\",\\\"reporting\\\\\\/reports.readonly\\\",\\\"reporting\\\\\\/reports.write\\\",\\\"settings.write\\\",\\\"text-ai-agent-goals.readonly\\\",\\\"text-ai-agent-goals.write\\\",\\\"text-ai-agent-training.write\\\",\\\"text-ai-agents-dashboard.readonly\\\",\\\"text-ai-agents.write\\\",\\\"triggers.write\\\",\\\"voice-ai-agent-goals.readonly\\\",\\\"voice-ai-agent-goals.write\\\",\\\"voice-ai-agents.readonly\\\",\\\"voice-ai-agents.write\\\",\\\"voice-ai-dashboard.readonly\\\",\\\"workflows.write\\\"]\"', NULL, 100, NULL, '2025-10-29 17:47:03', '2025-10-29 17:47:03'),
(5, NULL, 'Xortlogix', 'Fiverr', 'Xortlogix@gmail.com', NULL, NULL, 'account', 'admin', '6zZqXsLoaQzyg1b1gqeU', 'kiRfOKDyVWVbujuWVIdV', NULL, NULL, NULL, 101, NULL, '2025-10-29 17:47:03', '2025-10-29 17:47:03');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('draft','sent','paid','overdue','cancelled') DEFAULT 'draft',
  `live_mode` tinyint(1) DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `invoice_number` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `currency` varchar(10) DEFAULT 'USD',
  `contact_id` varchar(100) DEFAULT NULL,
  `issue_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `discount_type` enum('percentage','fixed') DEFAULT 'fixed',
  `discount_value` decimal(10,2) DEFAULT 0.00,
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `total` decimal(10,2) DEFAULT 0.00,
  `amount_paid` decimal(10,2) DEFAULT 0.00,
  `amount_due` decimal(10,2) DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'USD',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `qty` int(11) DEFAULT 1,
  `amount` decimal(10,2) NOT NULL,
  `taxes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location_details`
--

CREATE TABLE `location_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` varchar(255) NOT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `business_logo_url` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `business` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `social` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `reseller` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `location_details`
--

INSERT INTO `location_details` (`id`, `location_id`, `company_id`, `name`, `domain`, `address`, `city`, `state`, `postal_code`, `country`, `website`, `timezone`, `logo_url`, `first_name`, `last_name`, `email`, `phone`, `business_logo_url`, `user_id`, `business`, `social`, `settings`, `reseller`, `created_at`, `updated_at`) VALUES
(1, 'kiRfOKDyVWVbujuWVIdV', 'IR572rE84fYmg4x4sOFL', 'Zavro Home Buyers LLC', '', '400 N Tampa St STE 1550 NUM 871027', 'Tampa', 'Florida', '33602', 'US', 'www.zavroproperties.com', 'America/New_York', '', 'Griffen', 'Dearmond', 'griffen@zavroproperties.com', '+12392095989', NULL, 76, '\"{\\\"name\\\":\\\"Zavro Home Buyers LLC\\\",\\\"address\\\":\\\"400 N Tampa St STE 1550 NUM 871027\\\",\\\"city\\\":\\\"Tampa\\\",\\\"state\\\":\\\"Florida\\\",\\\"country\\\":\\\"US\\\",\\\"postalCode\\\":\\\"33602\\\",\\\"website\\\":\\\"www.zavroproperties.com\\\",\\\"timezone\\\":\\\"America\\\\\\/New_York\\\",\\\"email\\\":\\\"griffen@zavroproperties.com\\\"}\"', '\"{\\\"facebookUrl\\\":\\\"\\\",\\\"googlePlus\\\":\\\"\\\",\\\"linkedIn\\\":\\\"\\\",\\\"foursquare\\\":\\\"\\\",\\\"twitter\\\":\\\"\\\",\\\"yelp\\\":\\\"\\\",\\\"instagram\\\":\\\"\\\",\\\"youtube\\\":\\\"\\\",\\\"pinterest\\\":\\\"\\\",\\\"blogRss\\\":\\\"\\\",\\\"googlePlacesId\\\":\\\"\\\"}\"', '\"{\\\"allowDuplicateContact\\\":false,\\\"allowDuplicateOpportunity\\\":false,\\\"allowFacebookNameMerge\\\":false,\\\"disableContactTimezone\\\":false,\\\"contactUniqueIdentifiers\\\":[\\\"email\\\",\\\"phone\\\"],\\\"crmSettings\\\":{\\\"deSyncOwners\\\":true,\\\"syncFollowers\\\":{\\\"contact\\\":true,\\\"opportunity\\\":true}},\\\"saasSettings\\\":{\\\"saasMode\\\":\\\"not_activated\\\",\\\"twilioRebilling\\\":{\\\"markup\\\":10,\\\"enabled\\\":false}}}\"', NULL, '2025-10-29 17:47:02', '2025-10-29 17:47:02');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ghl_call_id` varchar(255) DEFAULT NULL,
  `message_type` varchar(191) DEFAULT NULL,
  `location_id` varchar(191) DEFAULT NULL,
  `attachments` text DEFAULT NULL,
  `contact_id` varchar(191) DEFAULT NULL,
  `conversation_id` varchar(191) DEFAULT NULL,
  `direction` varchar(191) DEFAULT NULL,
  `source` varchar(191) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `date_added` timestamp NULL DEFAULT NULL,
  `date_updated` timestamp NULL DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `from_zip` varchar(255) DEFAULT NULL,
  `ghl_user_id` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `call_status` varchar(255) DEFAULT NULL,
  `call_duration` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `call_recording_url` varchar(255) DEFAULT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `delete_in_ghl` varchar(255) DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `conversation_provider_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chat_widget_id` varchar(255) DEFAULT NULL,
  `email_message_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `thread_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `from_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `to_email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
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
(4, '2025_04_09_231917_create_settings_table', 1),
(5, '2025_04_10_172420_create_ghl_auths_table', 1),
(6, '2025_04_18_161829_add_address_to_users_table', 1),
(7, '2025_05_19_212521_create_logs_table', 1),
(8, '2025_05_21_233025_create_contacts_table', 1),
(9, '2025_05_21_233239_create_pipelines_table', 1),
(10, '2025_05_21_233304_create_stages_table', 1),
(11, '2025_05_21_233332_create_custom_fields_table', 1),
(12, '2025_05_21_233352_create_contact_custom_fields_table', 1),
(13, '2025_05_22_160713_create_personal_access_tokens_table', 1),
(14, '2025_05_22_203041_create_pipeline_stages_table', 1),
(15, '2025_05_30_210310_create_ghl_users_table', 1),
(16, '2025_05_30_211143_create_company_locations_table', 1),
(17, '2025_05_30_211242_create_messages_table', 1),
(18, '2025_05_30_212842_create_opportunities_table', 1),
(19, '2025_05_30_213526_create_notes_table', 1),
(20, '2025_05_30_220738_create_location_details_table', 1),
(21, '2025_06_02_203542_create_appointments_table', 1),
(22, '2025_07_01_215727_create_user_module_permissions_table', 2),
(23, '2025_07_01_221828_create_user_script_permissions_table', 3),
(24, '2025_07_07_210617_create_renamed_menus_table', 4),
(25, '2025_08_20_200417_custom_values', 5),
(26, '2025_09_01_211237_create_stage_change_logs_table', 6),
(27, '2025_09_08_155556_create_business_details_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `opportunities`
--

CREATE TABLE `opportunities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opportunity_id` varchar(255) NOT NULL,
  `location_id` varchar(255) NOT NULL,
  `assigned_to` varchar(255) DEFAULT NULL,
  `contact_id` varchar(255) NOT NULL,
  `monetary_value` decimal(15,2) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `pipeline_id` varchar(255) NOT NULL,
  `pipeline_stage_id` varchar(255) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `last_status_change_at` datetime DEFAULT NULL,
  `last_stage_change_at` datetime DEFAULT NULL,
  `last_action_date` datetime DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `company_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `opportunities`
--

INSERT INTO `opportunities` (`id`, `opportunity_id`, `location_id`, `assigned_to`, `contact_id`, `monetary_value`, `name`, `pipeline_id`, `pipeline_stage_id`, `source`, `status`, `last_status_change_at`, `last_stage_change_at`, `last_action_date`, `date_added`, `company_id`, `user_id`, `created_at`, `updated_at`) VALUES
(244, 'LFJpY0AVKlba8lwIl2Hm', 'kiRfOKDyVWVbujuWVIdV', NULL, 'VbESR4nD4ypeCOdm6fwH', 0.00, 'Keshya Boudreaux', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', '2025-10-23 14:54:58', '2025-10-23 14:57:41', NULL, '2025-10-23 14:54:58', '2', 76, '2025-10-23 14:54:58', '2025-10-23 14:57:41'),
(245, 'j8HJ1YZEICjry9C7ejQK', 'kiRfOKDyVWVbujuWVIdV', NULL, 'aCCj1RMZZFRj9GgPnXLj', 0.00, 'Adrian Johnson', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-23 13:57:49', '2025-10-23 14:07:00', NULL, '2025-10-23 13:57:49', '2', 76, '2025-10-23 13:57:49', '2025-10-23 14:07:00'),
(246, 'tF5hlKmsjEjhcRVupZAR', 'kiRfOKDyVWVbujuWVIdV', NULL, 'iQK1rEKmhjDg9tERNy9z', 0.00, 'Diane Salahuddin', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-23 13:33:25', '2025-10-23 13:33:25', NULL, '2025-10-23 13:33:25', '2', 76, '2025-10-23 13:33:25', '2025-10-23 13:33:25'),
(247, 'o4TM2MHDNO2hch5Al9vw', 'kiRfOKDyVWVbujuWVIdV', NULL, '8Pxc4GKFD2kv9MC3whnb', 0.00, 'I\'M Jess Yates Yates', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-23 12:48:48', '2025-10-23 14:07:07', NULL, '2025-10-23 12:48:48', '2', 76, '2025-10-23 12:48:48', '2025-10-23 14:07:07'),
(248, 'ObbLAtDlo0Kd9rS6zEdS', 'kiRfOKDyVWVbujuWVIdV', NULL, 'uU0HMQoUktqm2WWXfG96', 0.00, 'Patricia Wynn', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', '2025-10-23 12:34:35', '2025-10-23 13:15:52', NULL, '2025-10-23 12:34:35', '2', 76, '2025-10-23 12:34:35', '2025-10-23 13:15:52'),
(249, '7xeHtxTqoUGmr0uvXNpR', 'kiRfOKDyVWVbujuWVIdV', NULL, 'aClH48WDSaWoC9wzjLbJ', 0.00, 'Teri Hancock', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', '2025-10-23 12:27:05', '2025-10-23 12:33:18', NULL, '2025-10-23 12:27:05', '2', 76, '2025-10-23 12:27:05', '2025-10-23 12:33:18'),
(250, 'REEKdMr3Ns8R1kiz9oJx', 'kiRfOKDyVWVbujuWVIdV', NULL, 'PlGgUNM0R6zqvjqparQj', NULL, 'Robert Weed', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-23 00:53:47', '2025-10-23 00:53:47', NULL, '2025-10-23 00:53:47', '2', 76, '2025-10-23 00:53:47', '2025-10-26 13:13:20'),
(251, 'rTFCM7x7HNgnnoWBajNM', 'kiRfOKDyVWVbujuWVIdV', NULL, '1fb3cPh7qErFwunAwxJI', NULL, 'Roy James', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-22 21:40:39', '2025-10-22 21:40:39', NULL, '2025-10-22 21:40:39', '2', 76, '2025-10-22 21:40:39', '2025-10-28 02:55:37'),
(252, '20QyB2dezbJPpjGCfQXy', 'kiRfOKDyVWVbujuWVIdV', NULL, 'd94I1AtBZdt2tIcSGd7Q', NULL, 'Deshundaca King', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', NULL, 'open', '2025-10-22 20:06:30', '2025-10-22 20:17:27', NULL, '2025-10-22 20:06:30', '2', 76, '2025-10-22 20:06:30', '2025-10-28 19:24:02'),
(253, 'qGoGOZoYT43jFiEOaSJ2', 'kiRfOKDyVWVbujuWVIdV', NULL, 'lvMMHJNwDgzhOMKpyniB', 0.00, 'Donna Mooradian', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-22 19:52:14', '2025-10-22 19:52:14', NULL, '2025-10-22 19:52:14', '2', 76, '2025-10-22 19:52:14', '2025-10-22 19:52:14'),
(254, 'IPG7jOVJeS3I5jLyrrNA', 'kiRfOKDyVWVbujuWVIdV', NULL, 'VNGSzxwS37TizuGWwZbO', NULL, 'Rita Nugent', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-22 18:52:08', '2025-10-22 18:52:08', NULL, '2025-10-22 18:52:08', '2', 76, '2025-10-22 18:52:08', '2025-10-25 20:14:29'),
(255, 'lSjoaleMLdtv3l91uj4f', 'kiRfOKDyVWVbujuWVIdV', NULL, 'dbh92bp52X5IrIGaaVmn', 0.00, 'Mchelle Goldsborough', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-22 18:47:59', '2025-10-22 19:26:34', NULL, '2025-10-22 18:47:59', '2', 76, '2025-10-22 18:47:59', '2025-10-22 19:26:34'),
(256, 'Bt0RziVEHB02pCRjpOZZ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'YgxGQBtS6X1SLf533gTV', 0.00, 'Douglas Leaman', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-22 18:24:32', '2025-10-22 18:24:32', NULL, '2025-10-22 18:24:32', '2', 76, '2025-10-22 18:24:32', '2025-10-22 18:24:32'),
(257, 'hTgIjqmqkRvrFl2PNqdr', 'kiRfOKDyVWVbujuWVIdV', NULL, '7Wu9DbQ2TBOLQHtmPwpx', NULL, 'Elizabeth Carver', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-22 17:44:58', '2025-10-22 17:44:58', NULL, '2025-10-22 17:44:58', '2', 76, '2025-10-22 17:44:58', '2025-10-25 19:08:11'),
(258, 'IPPmhJrhdmXtavFRUhjG', 'kiRfOKDyVWVbujuWVIdV', NULL, 'QQrceCafQr6AKxzNbkYY', 0.00, 'Willard Terry', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-22 17:32:29', '2025-10-22 18:26:18', NULL, '2025-10-22 17:32:29', '2', 76, '2025-10-22 17:32:29', '2025-10-22 18:26:18'),
(259, 'eN7irXudenWK82E4d1jI', 'kiRfOKDyVWVbujuWVIdV', NULL, 'spwEKdrJxY19Cd0bhZ12', 0.00, 'Lora Kimbrough-Carpenter', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-22 16:56:47', '2025-10-22 16:56:47', NULL, '2025-10-22 16:56:47', '2', 76, '2025-10-22 16:56:47', '2025-10-22 16:56:47'),
(260, 'kv3ERJxHZEqHxiNE67C4', 'kiRfOKDyVWVbujuWVIdV', NULL, 'fSI4r7SGBfwcwZIhkd1A', NULL, 'Brandon Reed', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-22 16:08:49', '2025-10-22 16:08:49', NULL, '2025-10-22 16:08:49', '2', 76, '2025-10-22 16:08:49', '2025-10-25 17:31:49'),
(261, 'fmwscSQOhkZEVwwDGH4f', 'kiRfOKDyVWVbujuWVIdV', NULL, 'IRsIVGw7yI6nWJGwvwZM', NULL, 'Debra Marshall', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-22 15:45:53', '2025-10-22 15:45:53', NULL, '2025-10-22 15:45:53', '2', 76, '2025-10-22 15:45:53', '2025-10-25 17:10:53'),
(262, 'vLxAgkmLhbgBGVwoEANS', 'kiRfOKDyVWVbujuWVIdV', NULL, '9ExAZO6EHFc9Sc4D4HtV', 0.00, 'Donna Mcgee', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-22 13:23:02', '2025-10-22 13:23:02', NULL, '2025-10-22 13:23:02', '2', 76, '2025-10-22 13:23:02', '2025-10-22 13:23:02'),
(263, 'cJBVfJvpRslpYgvnjZFZ', 'kiRfOKDyVWVbujuWVIdV', NULL, '518aDUuwcYGvttl4miK4', 0.00, 'Albert Roseboro', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-22 12:39:25', '2025-10-22 12:39:25', NULL, '2025-10-22 12:39:25', '2', 76, '2025-10-22 12:39:25', '2025-10-22 12:39:25'),
(264, 'mN2QShqPDIw5zXQaJj7L', 'kiRfOKDyVWVbujuWVIdV', NULL, '4MO0h94I4OA1QI24u8Ch', 0.00, 'Jackie Reffitt', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-22 12:38:52', '2025-10-22 12:38:52', NULL, '2025-10-22 12:38:52', '2', 76, '2025-10-22 12:38:52', '2025-10-22 12:38:52'),
(265, 'U4fELQarxYhMkdx1r9Xt', 'kiRfOKDyVWVbujuWVIdV', NULL, 'q235BYfI3YG4jApwSELV', 0.00, 'John Watson', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-21 18:09:25', '2025-10-22 14:09:17', NULL, '2025-10-21 18:09:25', '2', 76, '2025-10-21 18:09:25', '2025-10-22 14:09:17'),
(266, 'qnWZec1vyokCrjFG8Iyo', 'kiRfOKDyVWVbujuWVIdV', NULL, 'q235BYfI3YG4jApwSELV', 0.00, 'John Watson', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-20 20:00:18', '2025-10-20 20:17:09', NULL, '2025-10-20 20:00:18', '2', 76, '2025-10-20 20:00:18', '2025-10-20 20:17:09'),
(267, 'E4L3ZKDZNt9zzo3uot6O', 'kiRfOKDyVWVbujuWVIdV', NULL, 'mw6ZffHBM9kSOPdNUft1', 0.00, 'Test 2', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-19 08:35:47', '2025-10-19 08:40:50', NULL, '2025-10-19 08:35:47', '2', 76, '2025-10-19 08:35:47', '2025-10-19 08:40:50'),
(268, 'ugVSmRuosixarusyHs3U', 'kiRfOKDyVWVbujuWVIdV', NULL, '4KcTUhXzWzkZKbP1iZJK', 0.00, 'Test', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-19 08:35:03', '2025-10-22 14:41:37', NULL, '2025-10-19 08:35:03', '2', 76, '2025-10-19 08:35:03', '2025-10-22 14:41:37'),
(269, 'N4koSNS280UNvqXxydAM', 'kiRfOKDyVWVbujuWVIdV', NULL, '8m5LacbxY9nIpFjdS7aw', 0.00, 'Charles Jennings', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-18 15:15:39', '2025-10-20 16:21:49', NULL, '2025-10-18 15:15:39', '2', 76, '2025-10-18 15:15:39', '2025-10-20 16:21:49'),
(270, 'LB1NyzDGGfCtxid6xfHS', 'kiRfOKDyVWVbujuWVIdV', NULL, 'kKNnCt1Ms1Ru7b6jSsUs', 0.00, 'Devonna Mccraw', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-18 11:52:48', '2025-10-18 13:16:14', NULL, '2025-10-18 11:52:48', '2', 76, '2025-10-18 11:52:48', '2025-10-18 13:16:14'),
(271, 'FTpIfoZW80pn6O2BwG2D', 'kiRfOKDyVWVbujuWVIdV', NULL, '3BuC7reuFnlisk33c2Dc', 0.00, 'Alma Aguirre', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-18 03:42:22', '2025-10-23 13:12:10', NULL, '2025-10-18 03:42:22', '2', 76, '2025-10-18 03:42:22', '2025-10-23 13:12:10'),
(272, 'wbHhaGdo9kCjXA8fsv3s', 'kiRfOKDyVWVbujuWVIdV', NULL, 'xQNZGLD8MRqR1EqWAHMa', 0.00, 'Jim Gormley', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', '2025-10-18 01:34:24', '2025-10-18 01:39:23', NULL, '2025-10-18 01:34:24', '2', 76, '2025-10-18 01:34:24', '2025-10-18 01:39:23'),
(273, 'uXEmFyVCyXm3BIOxQaJh', 'kiRfOKDyVWVbujuWVIdV', NULL, '6NGpV8kAs5nEZsZ5s1K6', 0.00, 'Jennifer Giesy', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', '2025-10-18 00:12:30', '2025-10-20 18:11:23', NULL, '2025-10-18 00:12:30', '2', 76, '2025-10-18 00:12:30', '2025-10-20 18:11:23'),
(274, 'xaxmDNnFJi3jCW5HyXEI', 'kiRfOKDyVWVbujuWVIdV', NULL, 'vePBZznP5OKpBSuGeLOX', 0.00, 'Cathy Satcher', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-17 20:53:50', '2025-10-17 20:53:50', NULL, '2025-10-17 20:53:50', '2', 76, '2025-10-17 20:53:50', '2025-10-17 20:53:50'),
(275, 'Ixk34FcALQb8x5vwTVYQ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'kvrTxxZIGOd2dp37oHcP', 0.00, 'Jeffrey Cunningham', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-17 14:12:03', '2025-10-20 15:36:30', NULL, '2025-10-17 14:12:03', '2', 76, '2025-10-17 14:12:03', '2025-10-20 15:36:30'),
(276, 'p2ocpHm4xoalaMvFnV5e', 'kiRfOKDyVWVbujuWVIdV', NULL, 'd94I1AtBZdt2tIcSGd7Q', 0.00, 'Deshundaca King', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-17 13:21:29', '2025-10-22 14:09:18', NULL, '2025-10-17 13:21:29', '2', 76, '2025-10-17 13:21:29', '2025-10-22 14:09:18'),
(277, 'Jjsuu4IVlLE45c02PNb8', 'kiRfOKDyVWVbujuWVIdV', NULL, '3q0bQfyXJscq4JhDykGw', 0.00, 'Walter Mitchum', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-17 02:49:19', '2025-10-20 13:16:11', NULL, '2025-10-17 02:49:19', '2', 76, '2025-10-17 02:49:19', '2025-10-20 13:16:11'),
(278, 'JmCdq3LrmuToFVQPUuhD', 'kiRfOKDyVWVbujuWVIdV', NULL, 'T3G1RTR5t1aYdDCegcsM', 0.00, 'Kelley Nichols', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-17 00:26:41', '2025-10-22 14:09:26', NULL, '2025-10-17 00:26:41', '2', 76, '2025-10-17 00:26:41', '2025-10-22 14:09:26'),
(279, 'mBIr4LKpP1iU6ELqapjV', 'kiRfOKDyVWVbujuWVIdV', NULL, 'DvILACu5rKdSr9OUpQvK', 0.00, 'Jacquline Fink', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', '2025-10-16 23:26:57', '2025-10-20 14:55:04', NULL, '2025-10-16 23:26:57', '2', 76, '2025-10-16 23:26:57', '2025-10-20 14:55:04'),
(280, '8dkAnqOQ3VANwuEgMRm3', 'kiRfOKDyVWVbujuWVIdV', NULL, 'VjvPkbxD6HqiTBQjBUH2', 0.00, 'Ernest Martinez', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-16 23:04:39', '2025-10-16 23:04:39', NULL, '2025-10-16 23:04:39', '2', 76, '2025-10-16 23:04:39', '2025-10-16 23:04:39'),
(281, 'VjhOPEORnDCyAFGuqlWJ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'JjXSRmakbRiEGHLXJn7S', NULL, 'Holly Jewell', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 20:58:18', '2025-10-21 21:39:37', NULL, '2025-10-16 20:58:18', '2', 76, '2025-10-16 20:58:18', '2025-11-05 00:55:05'),
(282, 'KVXY7NufoMZrqEF1GqMX', 'kiRfOKDyVWVbujuWVIdV', NULL, 'YfyIJivsNhp4yNOJMP6T', NULL, 'Robin Hodgeman', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 20:43:50', '2025-10-17 14:08:18', NULL, '2025-10-16 20:43:50', '2', 76, '2025-10-16 20:43:50', '2025-11-05 00:55:06'),
(283, '0XNaC0P3VCCwLsP6TbDe', 'kiRfOKDyVWVbujuWVIdV', NULL, 'cJk1C3UcP7fCzLlzynoh', 0.00, 'Lakresha Ellis', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', '2025-10-16 19:20:47', '2025-10-16 20:37:35', NULL, '2025-10-16 19:20:47', '2', 76, '2025-10-16 19:20:47', '2025-10-16 20:37:35'),
(284, 'lSI8x8OwmiWBg0tmFm74', 'kiRfOKDyVWVbujuWVIdV', NULL, 'ZAkPbptpDGn8OYGSI7Nf', 0.00, 'Larry Phillips', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 19:07:33', '2025-10-19 20:30:07', NULL, '2025-10-16 19:07:33', '2', 76, '2025-10-16 19:07:33', '2025-10-19 20:30:07'),
(285, 'yihWp00f16RE7QXAac5v', 'kiRfOKDyVWVbujuWVIdV', NULL, '48yKqEy5MwCC9KmUl7I1', 0.00, 'Dileatha Washington', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 15:27:34', '2025-10-16 15:40:53', NULL, '2025-10-16 15:27:34', '2', 76, '2025-10-16 15:27:34', '2025-10-16 15:40:53'),
(286, 'Kt6E9cYarBW5UC7AhpY9', 'kiRfOKDyVWVbujuWVIdV', NULL, 'hm68OUTZMtp3itKC2qbK', 0.00, 'Norman Meyerhoff', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-16 15:25:39', '2025-10-16 15:25:39', NULL, '2025-10-16 15:25:39', '2', 76, '2025-10-16 15:25:39', '2025-10-16 15:25:39'),
(287, 'vfBd7ikMPAm4BipDMK5D', 'kiRfOKDyVWVbujuWVIdV', NULL, 'DeLGCuyK1lFYnANNXQLF', 0.00, 'Shawn Woodby', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', '2025-10-16 12:42:56', '2025-10-16 12:45:28', NULL, '2025-10-16 12:42:56', '2', 76, '2025-10-16 12:42:56', '2025-10-16 12:45:28'),
(288, 'voAtxqB1Wt2wqYlMQo6X', 'kiRfOKDyVWVbujuWVIdV', NULL, 't20KV93zimMA0aw4iziD', NULL, 'Tony Crum', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 10:46:39', '2025-10-21 21:40:09', NULL, '2025-10-16 10:46:39', '2', 76, '2025-10-16 10:46:39', '2025-11-05 00:55:09'),
(289, 'DhnFqEMDBbjVVdzWZYEy', 'kiRfOKDyVWVbujuWVIdV', NULL, 'bNlse3NgUUaqVYY7Ko90', 0.00, 'Ronald Miller', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 08:45:16', '2025-10-16 15:13:30', NULL, '2025-10-16 08:45:16', '2', 76, '2025-10-16 08:45:16', '2025-10-16 15:13:30'),
(290, '78qpGnPyHo1boskcPGmB', 'kiRfOKDyVWVbujuWVIdV', NULL, 'F8olo06NOlxVFxOMkLyZ', NULL, 'Brian Robinson', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 05:29:05', '2025-10-21 21:40:11', NULL, '2025-10-16 05:29:05', '2', 76, '2025-10-16 05:29:05', '2025-11-05 00:55:15'),
(291, 'fYbytHObWAtuwsNx47A7', 'kiRfOKDyVWVbujuWVIdV', NULL, 'V1wRMuYIIr5g2kirCiE2', NULL, 'Adua Verona', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', '2025-10-16 05:18:06', '2025-10-20 13:09:45', NULL, '2025-10-16 05:18:06', '2', 76, '2025-10-16 05:18:06', '2025-10-29 16:58:15'),
(292, 'BCg8eYZAQMvg7FeytoX1', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Ki5EgzSiYGVxHYmOVz7p', 0.00, 'Ronnie Holcombe', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 04:41:37', '2025-10-16 15:13:47', NULL, '2025-10-16 04:41:37', '2', 76, '2025-10-16 04:41:37', '2025-10-16 15:13:47'),
(293, 'TxR6AOuTFD0nSpsREcMN', 'kiRfOKDyVWVbujuWVIdV', NULL, 'ez5kjvDj2B4lHgCsKzlF', NULL, 'Eddie Mcewen', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 04:32:21', '2025-10-17 14:11:10', NULL, '2025-10-16 04:32:21', '2', 76, '2025-10-16 04:32:21', '2025-11-05 00:55:07'),
(294, 'BmRwnrZlmP6wS5QyNxSb', 'kiRfOKDyVWVbujuWVIdV', NULL, 'tIA3JEIFF2EC3vkgsqqP', 0.00, 'Helen Dykes', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', '2025-10-16 03:27:00', '2025-10-17 14:01:08', NULL, '2025-10-16 03:27:00', '2', 76, '2025-10-16 03:27:00', '2025-10-17 14:01:08'),
(295, 'P5fWH5cpyqKtuHDxxrmz', 'kiRfOKDyVWVbujuWVIdV', NULL, 'psFShC8xrve6md2rxzPM', 0.00, 'Marcia Glover', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 02:20:03', '2025-10-16 15:15:00', NULL, '2025-10-16 02:20:03', '2', 76, '2025-10-16 02:20:03', '2025-10-16 15:15:00'),
(296, 'jd8xqBcPXQ88KIgvrgr8', 'kiRfOKDyVWVbujuWVIdV', NULL, 'eMGVf2xOXhLCqjeuutao', 0.00, 'Martha Gibson', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-16 01:11:34', '2025-10-19 13:11:50', NULL, '2025-10-16 01:11:34', '2', 76, '2025-10-16 01:11:34', '2025-10-19 13:11:50'),
(297, 'Jn7FZGeSodfRzPUgqpyR', 'kiRfOKDyVWVbujuWVIdV', NULL, 'nGMwdEJ26wVuUTznqFSb', 0.00, 'George Sanders', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 23:49:57', '2025-10-15 23:49:57', NULL, '2025-10-15 23:49:57', '2', 76, '2025-10-15 23:49:57', '2025-10-15 23:49:57'),
(298, 'RxrvSPRXz2Ep3Wb1J8Hx', 'kiRfOKDyVWVbujuWVIdV', NULL, 'HrKNeSwKmUQaVMchGNPx', 0.00, 'Ray Armstrong', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 23:29:44', '2025-10-15 23:29:44', NULL, '2025-10-15 23:29:44', '2', 76, '2025-10-15 23:29:44', '2025-10-15 23:29:44'),
(299, 'N3Q2B90o9jMK71KtWtiG', 'kiRfOKDyVWVbujuWVIdV', NULL, 'AruAqDqQZ9L7q6o0Jj0S', 0.00, 'Melvin Smith', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 22:40:13', '2025-10-22 14:09:26', NULL, '2025-10-15 22:40:13', '2', 76, '2025-10-15 22:40:13', '2025-10-22 14:09:26'),
(300, 'rGS9FfTLRPaoCrNT89uR', 'kiRfOKDyVWVbujuWVIdV', NULL, '0M5AaatB8cVf1lRx3pet', 0.00, 'Robert De La Garza', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-15 21:42:08', '2025-10-15 22:05:12', NULL, '2025-10-15 21:42:08', '2', 76, '2025-10-15 21:42:08', '2025-10-15 22:05:12'),
(301, 'p5vdqFevFitQkgkDZvYn', 'kiRfOKDyVWVbujuWVIdV', NULL, 'rWj7w42Gs7AXkTG8B1B7', 0.00, 'Richard Baker', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-15 21:40:48', '2025-10-15 22:02:44', NULL, '2025-10-15 21:40:48', '2', 76, '2025-10-15 21:40:48', '2025-10-15 22:02:44'),
(302, '5oCsyiS26eVjiJqyikaj', 'kiRfOKDyVWVbujuWVIdV', NULL, 'X4wUpDWdIRfZgQeFjKRa', NULL, 'Mike Jenkins', 'bKzXACEFizwejXvHRDxo', '6a58fbde-5f3a-49b3-854c-2f16b6d066b2', NULL, 'open', '2025-10-15 21:15:16', '2025-10-20 16:33:55', NULL, '2025-10-15 21:15:16', '2', 76, '2025-10-15 21:15:16', '2025-10-30 13:05:05'),
(303, 'qDfcFYRiywv1unSyV93H', 'kiRfOKDyVWVbujuWVIdV', NULL, 'UFmQNnIcf5Gsc8602Ywq', 0.00, 'Prent Castle', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-15 21:10:05', '2025-10-15 21:46:19', NULL, '2025-10-15 21:10:05', '2', 76, '2025-10-15 21:10:05', '2025-10-15 21:46:19'),
(304, '8kwoFb20IHDlyZ7ZuceA', 'kiRfOKDyVWVbujuWVIdV', NULL, 'gA0FxuoqzXlepcBYtu1o', 0.00, 'Randy Chandler', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 20:47:50', '2025-10-15 20:47:50', NULL, '2025-10-15 20:47:50', '2', 76, '2025-10-15 20:47:50', '2025-10-15 20:47:50'),
(305, 'WAtOSIc0UcNTmfglZUpB', 'kiRfOKDyVWVbujuWVIdV', NULL, 'oDpcJjtOBp5O6ffHvTOh', NULL, 'Richard Walton', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', '2025-10-15 20:18:47', '2025-10-15 20:50:01', NULL, '2025-10-15 20:18:47', '2', 76, '2025-10-15 20:18:47', '2025-10-28 17:24:25'),
(306, 'lgsk2UnlpIrH0Vq3uiGv', 'kiRfOKDyVWVbujuWVIdV', NULL, 'NuLLo5y7bhwXav8sNtLL', 0.00, 'Charles Moore', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-15 20:15:18', '2025-10-19 13:11:42', NULL, '2025-10-15 20:15:18', '2', 76, '2025-10-15 20:15:18', '2025-10-19 13:11:42'),
(307, 'xuMw2HJ8k9icUOAbvmKh', 'kiRfOKDyVWVbujuWVIdV', NULL, 'ef32Sbmq6sHrtSIj0EXg', 0.00, 'Susan Ohearn', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-15 19:52:12', '2025-10-19 13:11:49', NULL, '2025-10-15 19:52:12', '2', 76, '2025-10-15 19:52:12', '2025-10-19 13:11:49'),
(308, 'SbUJbL306rMjdqpvicvb', 'kiRfOKDyVWVbujuWVIdV', NULL, 'MNdxXCtyPEZ297kHByAu', 0.00, 'Paul Ryan', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 19:22:05', '2025-10-15 19:22:05', NULL, '2025-10-15 19:22:05', '2', 76, '2025-10-15 19:22:05', '2025-10-15 19:22:05'),
(309, 'BkZbd4K4fHLBAlT13el6', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Wig4eTUfTckKFn0EWyfL', 0.00, 'Henry Baggs', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-15 19:10:07', '2025-10-16 15:17:24', NULL, '2025-10-15 19:10:07', '2', 76, '2025-10-15 19:10:07', '2025-10-16 15:17:24'),
(310, 'iade1lxs7NKNmRV3iIcq', 'kiRfOKDyVWVbujuWVIdV', NULL, 'QzPNooQJaWOEKZuxDUvP', 0.00, 'Elaine Givens', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 18:46:22', '2025-10-15 18:46:22', NULL, '2025-10-15 18:46:22', '2', 76, '2025-10-15 18:46:22', '2025-10-15 18:46:22'),
(311, 'uAOqmJsf1mAo0Z6jMTf6', 'kiRfOKDyVWVbujuWVIdV', NULL, 'cH7sFk7ZOw4QY7Ypiv2O', 0.00, 'Mike Templeton', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 18:25:46', '2025-10-15 18:25:46', NULL, '2025-10-15 18:25:46', '2', 76, '2025-10-15 18:25:46', '2025-10-15 18:25:46'),
(312, 'q4WfEAFKuDT368tp1GKf', 'kiRfOKDyVWVbujuWVIdV', NULL, '8DVyyGhlphlKkrJzI72e', 0.00, 'Ej Flanigan', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-15 18:18:11', '2025-10-15 22:04:03', NULL, '2025-10-15 18:18:11', '2', 76, '2025-10-15 18:18:11', '2025-10-15 22:04:03'),
(313, 'fkijaTxjqpCMTrKmM6uS', 'kiRfOKDyVWVbujuWVIdV', NULL, 'KEIsxeBWF40iqqTyPxBi', 0.00, 'Tiffany Croft', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 18:05:59', '2025-10-15 18:05:59', NULL, '2025-10-15 18:05:59', '2', 76, '2025-10-15 18:05:59', '2025-10-15 18:05:59'),
(314, 'hhhe4qD0TBSn24LjYhph', 'kiRfOKDyVWVbujuWVIdV', NULL, 'JMlN9YsgevideexRoZg8', 0.00, 'Mary Risley', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 17:55:28', '2025-10-15 17:55:28', NULL, '2025-10-15 17:55:28', '2', 76, '2025-10-15 17:55:28', '2025-10-15 17:55:28'),
(315, 'PYlrxwXeCICuTLt6u1rN', 'kiRfOKDyVWVbujuWVIdV', NULL, '3BuC7reuFnlisk33c2Dc', NULL, 'Alma Aguirre', 'bKzXACEFizwejXvHRDxo', 'ec794e72-1a29-44ea-8b1b-d3c21d6ada6b', NULL, 'open', '2025-10-15 17:53:42', '2025-10-15 18:36:56', NULL, '2025-10-15 17:53:42', '2', 76, '2025-10-15 17:53:42', '2025-10-27 14:00:13'),
(316, 'F4p1Uiid4y5BYnLcAzDg', 'kiRfOKDyVWVbujuWVIdV', NULL, 'lUpzulkBvOlV73x84xjg', NULL, 'Misty Sutton', 'bKzXACEFizwejXvHRDxo', 'd4a58506-3490-4ed8-8620-48f06365c5bc', NULL, 'open', '2025-10-15 16:00:21', '2025-10-20 16:33:59', NULL, '2025-10-15 16:00:21', '2', 76, '2025-10-15 16:00:21', '2025-10-24 11:29:07'),
(317, 'imeq4U8r3f8zTBlUGryf', 'kiRfOKDyVWVbujuWVIdV', NULL, '4SvXg67eeBlLijSWrO9g', 0.00, 'Douglas Kalie', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 15:27:07', '2025-10-15 15:27:07', NULL, '2025-10-15 15:27:07', '2', 76, '2025-10-15 15:27:07', '2025-10-15 15:27:07'),
(318, 'c42lS8R4kMgYKDCGFH5s', 'kiRfOKDyVWVbujuWVIdV', NULL, 'W5Od2b05ksewCbYFqhfp', 0.00, 'Lalania Hollimon', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', '2025-10-15 14:23:31', '2025-10-15 14:26:16', NULL, '2025-10-15 14:23:31', '2', 76, '2025-10-15 14:23:31', '2025-10-15 14:26:16'),
(319, 'fR8Sz5saFWMHa9lzU7nZ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'J0n3NsJpCyly3VVxcUw4', NULL, 'Eric Knowles', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-15 14:17:55', '2025-10-18 15:35:11', NULL, '2025-10-15 14:17:55', '2', 76, '2025-10-15 14:17:55', '2025-10-28 02:55:42'),
(320, '5rXv9ifDdk9ZaiAwRc0c', 'kiRfOKDyVWVbujuWVIdV', NULL, 'p35x6hNr5CvtydrhMN99', 0.00, 'Jacquline Grant', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-15 14:14:02', '2025-10-15 22:18:53', NULL, '2025-10-15 14:14:02', '2', 76, '2025-10-15 14:14:02', '2025-10-15 22:18:53'),
(321, 'TTrANluNR9tfEsdxIIfe', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Tpr46huXYaRx3Ryg6HRK', 0.00, 'Alijah Wright', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-11 13:27:44', '2025-10-15 22:13:21', NULL, '2025-10-11 13:27:44', '2', 76, '2025-10-11 13:27:44', '2025-10-15 22:13:21'),
(322, 'SQfqUfIJHmnNcXQTvhb2', 'kiRfOKDyVWVbujuWVIdV', NULL, 'D0NkAQ2UJUd8v4VwEP3I', NULL, 'Anna Brown', 'bKzXACEFizwejXvHRDxo', '6a58fbde-5f3a-49b3-854c-2f16b6d066b2', NULL, 'open', '2025-10-11 09:34:44', '2025-10-15 19:31:46', NULL, '2025-10-11 09:34:44', '2', 76, '2025-10-11 09:34:44', '2025-10-27 15:33:56'),
(323, '1Pvzo4ivFIuG46k30eMq', 'kiRfOKDyVWVbujuWVIdV', NULL, '9tDjPFx75yOyWzLuEbZ1', 0.00, 'Angel Sanders', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', '2025-10-11 07:40:34', '2025-10-16 16:36:14', NULL, '2025-10-11 07:40:34', '2', 76, '2025-10-11 07:40:34', '2025-10-16 16:36:14'),
(324, 'IGXn1wXxj1OJb3QJsfG4', 'kiRfOKDyVWVbujuWVIdV', NULL, 'zWbdtw7GCs0Zbmfqlq2z', 0.00, 'Cynthia Arnold', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-11 03:23:25', '2025-10-15 22:19:27', NULL, '2025-10-11 03:23:25', '2', 76, '2025-10-11 03:23:25', '2025-10-15 22:19:27'),
(325, 'KPJ9tWJm2jpdIefM0O9A', 'kiRfOKDyVWVbujuWVIdV', NULL, 'PIQDFRLGm8CYZalkwBMY', 0.00, 'Debbie Allen', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-10 22:34:16', '2025-10-22 14:09:36', NULL, '2025-10-10 22:34:16', '2', 76, '2025-10-10 22:34:16', '2025-10-22 14:09:36'),
(326, 'isf5YXTmY1cTmPI9dDpU', 'kiRfOKDyVWVbujuWVIdV', NULL, 'yvIuA2KePLC9O2ENkQWN', 0.00, 'Amy Peters', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-10 20:09:46', '2025-10-10 20:09:46', NULL, '2025-10-10 20:09:46', '2', 76, '2025-10-10 20:09:46', '2025-10-10 20:09:46'),
(327, 'YwAqw9kxYfn2quCluHdX', 'kiRfOKDyVWVbujuWVIdV', NULL, '52uDZCJPeYWElcxYV9HY', 0.00, 'Joseph Grandstaff', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-10 19:55:23', '2025-10-10 19:55:23', NULL, '2025-10-10 19:55:23', '2', 76, '2025-10-10 19:55:23', '2025-10-10 19:55:23'),
(328, '2qStt5I269Oy4LMT0ipx', 'kiRfOKDyVWVbujuWVIdV', NULL, 'EK4bzIYJmPs7C7LlZm53', 0.00, 'Randy Wise', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-10 19:12:55', '2025-10-15 22:20:06', NULL, '2025-10-10 19:12:55', '2', 76, '2025-10-10 19:12:55', '2025-10-15 22:20:06'),
(329, 'vBbqcZDzVh6ZyJBnoI83', 'kiRfOKDyVWVbujuWVIdV', NULL, 'oDpcJjtOBp5O6ffHvTOh', 0.00, 'Richard Walton', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-10 18:10:31', '2025-10-16 02:58:09', NULL, '2025-10-10 18:10:31', '2', 76, '2025-10-10 18:10:31', '2025-10-16 02:58:09'),
(330, 'yulrIwxpFNw9wWNxv0CO', 'kiRfOKDyVWVbujuWVIdV', NULL, 'J0n3NsJpCyly3VVxcUw4', 0.00, 'Eric Knowles', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-10 17:53:01', '2025-10-13 19:15:31', NULL, '2025-10-10 17:53:01', '2', 76, '2025-10-10 17:53:01', '2025-10-13 19:15:31'),
(332, '6yVruE7FpI8CBB3XLinF', 'kiRfOKDyVWVbujuWVIdV', NULL, 'J02RtXrOWKWaqMqWm9sU', 0.00, 'Connie Daniels', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-10 17:25:34', '2025-10-13 18:47:50', NULL, '2025-10-10 17:25:34', '2', 76, '2025-10-10 17:25:34', '2025-10-13 18:47:50'),
(333, 'Va5G0f0f5P7cmaLDLi9K', 'kiRfOKDyVWVbujuWVIdV', NULL, 'FhkPsRDhFFgAwxXX52mF', 0.00, 'Casey Stiles', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-10 17:20:26', '2025-10-10 17:20:26', NULL, '2025-10-10 17:20:26', '2', 76, '2025-10-10 17:20:26', '2025-10-10 17:20:26'),
(334, '7oj3g9z74uc5C2KAGo5T', 'kiRfOKDyVWVbujuWVIdV', NULL, 'kkzjuk8zMkrNgKxyRwPx', 0.00, 'Hamza Yaqoob', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-10 16:43:02', '2025-10-10 16:43:02', NULL, '2025-10-10 16:43:02', '2', 76, '2025-10-10 16:43:02', '2025-10-10 16:43:02'),
(335, '0jOz7Y5Mmj2uJIMeClp9', 'kiRfOKDyVWVbujuWVIdV', NULL, 'heHQzJkoE3NN20Zs3dgU', 0.00, 'Linda Childress', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-10 14:47:18', '2025-10-13 16:11:58', NULL, '2025-10-10 14:47:18', '2', 76, '2025-10-10 14:47:18', '2025-10-13 16:11:58'),
(336, 'dMJcEbJ3LfpNqpFXGIUM', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Y46Mfy2uPm0yVbBfOwBj', 0.00, 'Robert Cook', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-10 13:37:11', '2025-10-15 22:02:25', NULL, '2025-10-10 13:37:11', '2', 76, '2025-10-10 13:37:11', '2025-10-15 22:02:25'),
(337, 'd95Jow5b9mVL6TyZXFxK', 'kiRfOKDyVWVbujuWVIdV', NULL, 'km8ad3yFkAmt0CqVir6S', 0.00, 'Miltonia Gary', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', '2025-10-10 10:51:45', '2025-10-10 10:54:26', NULL, '2025-10-10 10:51:45', '2', 76, '2025-10-10 10:51:45', '2025-10-10 10:54:26'),
(338, 'PJJenGoiMQP2UKOqOgEX', 'kiRfOKDyVWVbujuWVIdV', NULL, 'qycJS2V9E0Uc9iPV6WZQ', 0.00, 'Shannon Fuentes', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-10 08:49:04', '2025-10-13 13:14:58', NULL, '2025-10-10 08:49:04', '2', 76, '2025-10-10 08:49:04', '2025-10-13 13:15:00'),
(339, 'xEmvXExjOcr6nQbuWZqi', 'kiRfOKDyVWVbujuWVIdV', NULL, 'E4bz7GpM3n4h5VmTz1wc', NULL, 'Mary Todd', 'bKzXACEFizwejXvHRDxo', '6a58fbde-5f3a-49b3-854c-2f16b6d066b2', NULL, 'open', '2025-10-10 04:30:22', '2025-10-14 20:31:44', NULL, '2025-10-10 04:30:22', '2', 76, '2025-10-10 04:30:22', '2025-11-02 03:50:12'),
(340, 'OqkiLv7v8nGRHCZkgxMC', 'kiRfOKDyVWVbujuWVIdV', NULL, 'KngTWNbUlKwGT57YyD1K', 0.00, 'Ann Remmert', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-10 04:15:03', '2025-10-15 22:02:27', NULL, '2025-10-10 04:15:03', '2', 76, '2025-10-10 04:15:03', '2025-10-15 22:02:27'),
(341, 'oVvmCD0VRke2E06h2VeQ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'HLz2XVkswExZmDzjrcwi', NULL, 'Angia Macomber', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-10 03:39:10', '2025-10-10 04:08:34', NULL, '2025-10-10 03:39:10', '2', 76, '2025-10-10 03:39:10', '2025-10-27 13:13:54'),
(342, 'aKPo84cjeJaO2GvPydkB', 'kiRfOKDyVWVbujuWVIdV', NULL, 'BIMFxFxMA8eSBBqZhTo2', 0.00, 'Jeremy Jordan', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-10 03:35:45', '2025-10-13 13:15:15', NULL, '2025-10-10 03:35:45', '2', 76, '2025-10-10 03:35:45', '2025-10-13 13:15:15'),
(343, 'qRzILyI3xIfvCWS6XHEm', 'kiRfOKDyVWVbujuWVIdV', NULL, 'U1ZVeSIEk10CvUz08AEy', 0.00, 'Jason Cole', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-10 02:06:43', '2025-10-13 13:15:17', NULL, '2025-10-10 02:06:43', '2', 76, '2025-10-10 02:06:43', '2025-10-13 13:15:17'),
(344, 'ZB9Ht9tblxSs3wBHxDhz', 'kiRfOKDyVWVbujuWVIdV', NULL, 'VfCiqhBj54A0psSF2BRr', 0.00, 'Mark Crum', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-10 01:01:43', '2025-10-10 01:01:43', NULL, '2025-10-10 01:01:43', '2', 76, '2025-10-10 01:01:43', '2025-10-10 01:01:43'),
(345, 'ROssoICuGw0mk6WqN4SQ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'V1wRMuYIIr5g2kirCiE2', 0.00, 'Adua Verona', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-10 00:57:34', '2025-10-13 13:14:46', NULL, '2025-10-10 00:57:34', '2', 76, '2025-10-10 00:57:34', '2025-10-13 13:14:46'),
(346, 'l2ZzfePKNcyq57LOYqA3', 'kiRfOKDyVWVbujuWVIdV', NULL, 'TZaG9xbLcvMzuaQmTo8a', 0.00, 'Deborah Allen', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-10 00:49:37', '2025-10-10 00:49:37', NULL, '2025-10-10 00:49:37', '2', 76, '2025-10-10 00:49:37', '2025-10-10 00:49:37'),
(347, '23lb9K1oCWkncLiD06G0', 'kiRfOKDyVWVbujuWVIdV', NULL, 'BiSzMzWYxXmsfkv5zaJM', 0.00, 'Griffen Dearmond', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-09 23:53:02', '2025-10-09 23:53:02', NULL, '2025-10-09 23:53:02', '2', 76, '2025-10-09 23:53:02', '2025-10-09 23:53:02'),
(348, 'VcFosVY8JRsJIMKmtvC0', 'kiRfOKDyVWVbujuWVIdV', NULL, 'VxlKQGQz7IOn66GCILs9', 0.00, 'James Coonrod', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-09 23:40:45', '2025-10-09 23:40:45', NULL, '2025-10-09 23:40:45', '2', 76, '2025-10-09 23:40:45', '2025-10-09 23:40:45'),
(349, 'LvEqhC9vDnSae4cGdjYY', 'kiRfOKDyVWVbujuWVIdV', NULL, 'HDt9X70i8fbwr3jzaDNh', 0.00, 'Victoria Frazier', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 19:55:48', '2025-10-13 13:15:15', NULL, '2025-10-09 19:55:48', '2', 76, '2025-10-09 19:55:48', '2025-10-13 13:15:15'),
(350, 's9Exy1J7XsqLH6NaYa0V', 'kiRfOKDyVWVbujuWVIdV', NULL, 'xyCRP25PRcjFpiFoevl1', NULL, 'Kristieana Raley', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', '2025-10-09 19:50:33', '2025-10-14 20:31:29', NULL, '2025-10-09 19:50:33', '2', 76, '2025-10-09 19:50:33', '2025-10-27 17:02:58'),
(351, '4ZtPPaPSPpNXwoclH9Fw', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Xb2tnIw1MdevG6c7rBTR', 0.00, 'Frank Clark', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 17:10:58', '2025-10-15 22:22:36', NULL, '2025-10-09 17:10:58', '2', 76, '2025-10-09 17:10:58', '2025-10-15 22:22:36'),
(352, 'XqbdX6XX0p6z2PtmhzqG', 'kiRfOKDyVWVbujuWVIdV', NULL, 'TTa2bSVQcAx2pJbj2soZ', 0.00, 'Jennifer Barajas', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 14:04:43', '2025-10-12 15:27:28', NULL, '2025-10-09 14:04:43', '2', 76, '2025-10-09 14:04:43', '2025-10-12 15:27:28'),
(353, 'yzpKW9v0T0Q0PgmrKddm', 'kiRfOKDyVWVbujuWVIdV', NULL, '5Ed49ChO9AzVLO9RGAgn', 0.00, 'Lisa Williams', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-09 13:59:08', '2025-10-09 13:59:08', NULL, '2025-10-09 13:59:08', '2', 76, '2025-10-09 13:59:08', '2025-10-09 13:59:08'),
(354, '7sTDXxKj38AOaVtFWZuB', 'kiRfOKDyVWVbujuWVIdV', NULL, 'dT3h4Ke38UN7jT1VqLYE', 0.00, 'Jeriann Sloane', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 13:51:41', '2025-10-09 15:40:06', NULL, '2025-10-09 13:51:41', '2', 76, '2025-10-09 13:51:41', '2025-10-09 15:40:06'),
(355, 'Azz1gsBi2GveXK3aYrSl', 'kiRfOKDyVWVbujuWVIdV', NULL, 'iORIBoc02B7i95nHJmy3', 0.00, 'Darrell Moore', 'bKzXACEFizwejXvHRDxo', '6a58fbde-5f3a-49b3-854c-2f16b6d066b2', NULL, 'open', '2025-10-09 13:17:21', '2025-10-16 19:13:50', NULL, '2025-10-09 13:17:21', '2', 76, '2025-10-09 13:17:21', '2025-10-16 19:13:50'),
(356, 'UzhXOyojTRLPWl2nf8F3', 'kiRfOKDyVWVbujuWVIdV', NULL, 'cImw9CFHkq7XGYxIfQLh', 0.00, 'Jason Muncie', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-09 13:10:23', '2025-10-09 13:10:23', NULL, '2025-10-09 13:10:23', '2', 76, '2025-10-09 13:10:23', '2025-10-09 13:10:23'),
(357, 'OrXxpcmqUpj0Exwgcb60', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Wyu8YaFQG6omuxQeqUW6', 0.00, 'James Williams', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 12:21:33', '2025-10-15 22:23:06', NULL, '2025-10-09 12:21:33', '2', 76, '2025-10-09 12:21:33', '2025-10-15 22:23:06'),
(358, '4KBmkQCwfOF3lYVBmx3H', 'kiRfOKDyVWVbujuWVIdV', NULL, 'cj7VEVCYKLBggh9c2XDX', 0.00, 'Harold Mcgruther', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 11:29:00', '2025-10-12 13:11:31', NULL, '2025-10-09 11:29:00', '2', 76, '2025-10-09 11:29:00', '2025-10-12 13:11:31'),
(359, 'G7P61lJR3MlRPqBsL0Nv', 'kiRfOKDyVWVbujuWVIdV', NULL, 'EulV5iwzQD0vEONOkdr0', 0.00, 'Ada Hall', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 08:36:51', '2025-10-12 13:10:47', NULL, '2025-10-09 08:36:51', '2', 76, '2025-10-09 08:36:51', '2025-10-12 13:10:56'),
(360, 'LIq8wVvrFKHiXn2jRp5J', 'kiRfOKDyVWVbujuWVIdV', NULL, '1fb3cPh7qErFwunAwxJI', 0.00, 'Roy James', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 06:57:05', '2025-10-09 13:43:48', NULL, '2025-10-09 06:57:05', '2', 76, '2025-10-09 06:57:05', '2025-10-09 13:43:48'),
(361, 'PWtAnEHczuXXRFcI3yOj', 'kiRfOKDyVWVbujuWVIdV', NULL, 'gMLCGfgd3lQExYIKuWdJ', 0.00, 'Tanya White', 'bKzXACEFizwejXvHRDxo', '6a58fbde-5f3a-49b3-854c-2f16b6d066b2', NULL, 'open', '2025-10-09 02:30:27', '2025-10-14 20:31:43', NULL, '2025-10-09 02:30:27', '2', 76, '2025-10-09 02:30:27', '2025-10-14 20:31:43'),
(362, 'G0ApFGB1XsPKCI4OGV3r', 'kiRfOKDyVWVbujuWVIdV', NULL, 'T3G1RTR5t1aYdDCegcsM', 0.00, 'Kelley Nichols', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 01:48:59', '2025-10-12 13:17:34', NULL, '2025-10-09 01:48:59', '2', 76, '2025-10-09 01:48:59', '2025-10-12 13:17:34'),
(363, 'n9CyKbxFseYgxLAkccLv', 'kiRfOKDyVWVbujuWVIdV', NULL, 'VYhddh0If7AyVBMjUr6p', 0.00, 'Jerri Sherrod', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-09 01:34:39', '2025-10-15 22:02:27', NULL, '2025-10-09 01:34:39', '2', 76, '2025-10-09 01:34:39', '2025-10-15 22:02:27'),
(364, 'LYIRy4pikZ85V0Q9ts52', 'kiRfOKDyVWVbujuWVIdV', NULL, 'd94I1AtBZdt2tIcSGd7Q', 0.00, 'Deshundaca King', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 00:42:14', '2025-10-09 02:56:02', NULL, '2025-10-09 00:42:14', '2', 76, '2025-10-09 00:42:14', '2025-10-09 02:56:02'),
(365, 'iiOxhrty8kaon67VwueT', 'kiRfOKDyVWVbujuWVIdV', NULL, 'tokaUtDPc58QaqKJTseJ', NULL, 'Carol Ferguson', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', '2025-10-09 00:26:32', '2025-10-14 20:22:25', NULL, '2025-10-09 00:26:32', '2', 76, '2025-10-09 00:26:32', '2025-10-24 15:07:27'),
(366, 'jWyTyAX8ym8akx3Chw1m', 'kiRfOKDyVWVbujuWVIdV', NULL, 'hwysQujwYFYr5rnAi74h', 0.00, 'Gabe Drapel', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-09 00:20:57', '2025-10-09 17:19:55', NULL, '2025-10-09 00:20:57', '2', 76, '2025-10-09 00:20:57', '2025-10-09 17:19:56'),
(367, 'D9YTbd2ILgwfh6D6t0Bt', 'kiRfOKDyVWVbujuWVIdV', NULL, 'xVaxqKJjdIjzNMIWat8b', 0.00, 'Brenda Rozsa', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-08 23:00:54', '2025-10-15 22:02:28', NULL, '2025-10-08 23:00:54', '2', 76, '2025-10-08 23:00:54', '2025-10-15 22:02:28'),
(368, 'KWt89hghCPUAadHX93AB', 'kiRfOKDyVWVbujuWVIdV', NULL, 'ATnwfdOfGXScnCFxk9tn', 0.00, 'Terry Mckinney', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-08 22:47:12', '2025-10-12 13:11:06', NULL, '2025-10-08 22:47:12', '2', 76, '2025-10-08 22:47:12', '2025-10-12 13:11:06'),
(369, 'Wx4C6qja3GAeuHR0AuMo', 'kiRfOKDyVWVbujuWVIdV', NULL, 'IO2WXLb5UBybeOLIQw5u', 0.00, 'Jose Zaragoza', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-08 22:16:30', '2025-10-08 22:16:30', NULL, '2025-10-08 22:16:30', '2', 76, '2025-10-08 22:16:30', '2025-10-08 22:16:30'),
(370, 'p8dlKX1CNKOiHTuL5yg0', 'kiRfOKDyVWVbujuWVIdV', NULL, '9b0s9vnro5WqTJ5hdacL', 0.00, 'Michael Dunbar', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-08 20:37:48', '2025-10-08 20:37:48', NULL, '2025-10-08 20:37:48', '2', 76, '2025-10-08 20:37:48', '2025-10-08 20:37:48'),
(371, 'iv2vUeVasVd9pEeIXjq4', 'kiRfOKDyVWVbujuWVIdV', NULL, 'CV2NiZi8sSBTASJxOikk', 0.00, 'Raymie Lainhart', 'bKzXACEFizwejXvHRDxo', 'ec794e72-1a29-44ea-8b1b-d3c21d6ada6b', NULL, 'open', '2025-10-08 20:17:59', '2025-10-22 16:19:04', NULL, '2025-10-08 20:17:59', '2', 76, '2025-10-08 20:17:59', '2025-10-22 16:19:04'),
(372, 'eqrZCzX45qJJQYqzn4Wv', 'kiRfOKDyVWVbujuWVIdV', NULL, '8qWzESHW0jzy2FNZvBCp', 0.00, 'Laura Stark', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-08 20:17:57', '2025-10-12 13:11:08', NULL, '2025-10-08 20:17:57', '2', 76, '2025-10-08 20:17:57', '2025-10-12 13:11:08'),
(373, 'R235bphF8wVnSdMXVgub', 'kiRfOKDyVWVbujuWVIdV', NULL, 'uRzChHhNJUwzxjy4AVPa', 0.00, 'Gina Brooks', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-08 20:03:15', '2025-10-12 13:18:06', NULL, '2025-10-08 20:03:15', '2', 76, '2025-10-08 20:03:15', '2025-10-12 13:18:06'),
(374, 'sgpVmiPZaN7LmoaDO4Nu', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Jp9vkHcy7eUdiuGWy2IO', 0.00, 'Mark Chambers', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', '2025-10-08 19:26:03', '2025-10-11 14:10:07', NULL, '2025-10-08 19:26:03', '2', 76, '2025-10-08 19:26:03', '2025-10-11 14:10:07'),
(375, 'yp2cvYvGOT48KTWhJtBD', 'kiRfOKDyVWVbujuWVIdV', NULL, 'xjpZYjCvui2gr3pUanqH', 0.00, 'Tanisha Wilcox', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-03 10:56:11', '2025-10-07 18:06:50', NULL, '2025-10-03 10:56:11', '2', 76, '2025-10-03 10:56:11', '2025-10-07 18:06:50'),
(376, '3Jc5g1sHVPLXbdoIZTSM', 'kiRfOKDyVWVbujuWVIdV', NULL, 'kQcwG5AusjO2PGXx5thj', 0.00, 'Barbara Hunter', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-03 05:21:41', '2025-10-06 13:19:25', NULL, '2025-10-03 05:21:41', '2', 76, '2025-10-03 05:21:41', '2025-10-06 13:19:25'),
(377, 'wue69cXWDXLA1xjyyypK', 'kiRfOKDyVWVbujuWVIdV', NULL, 'KngTWNbUlKwGT57YyD1K', 0.00, 'Ann Remmert', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-03 05:13:13', '2025-10-21 21:40:00', NULL, '2025-10-03 05:13:13', '2', 76, '2025-10-03 05:13:13', '2025-10-21 21:40:00'),
(378, 'cmKGtbQoI3SakmTu68cN', 'kiRfOKDyVWVbujuWVIdV', NULL, 'LU1mLkSJRHPv0ievv9Xz', 0.00, 'Jo Childress', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-03 02:56:48', '2025-10-03 02:56:48', NULL, '2025-10-03 02:56:48', '2', 76, '2025-10-03 02:56:48', '2025-10-03 02:56:48'),
(379, 'zeGaztmlxxyG9N6OHaZp', 'kiRfOKDyVWVbujuWVIdV', NULL, 'FcQkJRiKkkRDtPZVcir0', 0.00, 'Ruth Mitchell', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-03 02:20:08', '2025-10-06 13:16:59', NULL, '2025-10-03 02:20:08', '2', 76, '2025-10-03 02:20:08', '2025-10-06 13:16:59'),
(380, 'uhHQESzy76wH8t3WAYOh', 'kiRfOKDyVWVbujuWVIdV', NULL, 'WgrKPyNXDXOzIl0EeKXF', 0.00, 'Amy Goode', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-03 01:50:46', '2025-10-06 13:17:02', NULL, '2025-10-03 01:50:46', '2', 76, '2025-10-03 01:50:46', '2025-10-06 13:17:02'),
(381, 'iZi2hJdsoIME8h5eRqHN', 'kiRfOKDyVWVbujuWVIdV', NULL, 'kZEzVRwsjGWTgqOdLjQn', 0.00, 'Shelia Campbell', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-03 01:44:45', '2025-10-06 13:17:28', NULL, '2025-10-03 01:44:45', '2', 76, '2025-10-03 01:44:45', '2025-10-06 13:17:28'),
(382, 'RdkA8Wo54gZI7AzUMIGp', 'kiRfOKDyVWVbujuWVIdV', NULL, 'VYhddh0If7AyVBMjUr6p', 0.00, 'Jerri Sherrod', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-03 01:28:49', '2025-10-06 13:17:39', NULL, '2025-10-03 01:28:49', '2', 76, '2025-10-03 01:28:49', '2025-10-09 01:34:41'),
(383, 'LCmn9KXIHdYPHxPswRqk', 'kiRfOKDyVWVbujuWVIdV', NULL, 'MDDKER7kkafo6cnYOmQH', 0.00, 'Deborah Coll', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-03 01:20:08', '2025-10-03 01:20:08', NULL, '2025-10-03 01:20:08', '2', 76, '2025-10-03 01:20:08', '2025-10-03 01:20:08'),
(384, 'KSmBGIwyvjTUF5GgIs7O', 'kiRfOKDyVWVbujuWVIdV', NULL, 'DvILACu5rKdSr9OUpQvK', 0.00, 'Jacquline Fink', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-03 01:11:43', '2025-10-07 18:06:52', NULL, '2025-10-03 01:11:43', '2', 76, '2025-10-03 01:11:43', '2025-10-16 23:27:00'),
(385, 'cjvWaCunvA2xf1PVC4j8', 'kiRfOKDyVWVbujuWVIdV', NULL, 'ucBbOMqg9K0oQD4GeCxb', 0.00, 'David Trepainier', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-03 00:57:28', '2025-10-07 18:06:52', NULL, '2025-10-03 00:57:28', '2', 76, '2025-10-03 00:57:28', '2025-10-07 18:06:52'),
(386, 'qsy9zdiolmSAmqNJhtBi', 'kiRfOKDyVWVbujuWVIdV', NULL, 'eJJo9XMy0uQ0b89mHEiN', 0.00, 'Arthur Sanchez', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-03 00:13:20', '2025-10-03 00:13:20', NULL, '2025-10-03 00:13:20', '2', 76, '2025-10-03 00:13:20', '2025-10-03 00:13:20'),
(387, '3cisuQ9cEZy4Ph2INFoZ', 'kiRfOKDyVWVbujuWVIdV', NULL, '3Gxt3gC3gfZS5nknbTtY', 0.00, 'Stella Ornelas', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-02 13:28:39', '2025-10-05 14:51:51', NULL, '2025-10-02 13:28:39', '2', 76, '2025-10-02 13:28:39', '2025-10-05 14:51:51'),
(388, 'uyGNC6oRXAYnUfmrdBuG', 'kiRfOKDyVWVbujuWVIdV', NULL, '42SqqorFS4yFt89hoDvj', 0.00, 'James Housewright', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-02 11:24:35', '2025-10-02 11:24:35', NULL, '2025-10-02 11:24:35', '2', 76, '2025-10-02 11:24:35', '2025-10-02 11:24:35'),
(389, '7lnhxodcQMokRSbSSIJ8', 'kiRfOKDyVWVbujuWVIdV', NULL, 'ZrlLIkjXyMW3PPC7TGrt', NULL, 'Luann Kurfis', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-02 08:39:19', '2025-10-05 10:02:17', NULL, '2025-10-02 08:39:19', '2', 76, '2025-10-02 08:39:19', '2025-10-31 04:34:48'),
(390, 'jyzKZdj9A1wznE0PheUy', 'kiRfOKDyVWVbujuWVIdV', NULL, 'ngncqcFIjo4sZSM9ERsM', 0.00, 'Mohammed Hassan', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-02 05:56:45', '2025-10-07 18:06:55', NULL, '2025-10-02 05:56:45', '2', 76, '2025-10-02 05:56:45', '2025-10-07 18:06:55'),
(391, '3Y5OXm8XEJv7jdVPnD8u', 'kiRfOKDyVWVbujuWVIdV', NULL, 'kOEsKWxPlBuKISNl1tow', 0.00, 'Bobbiejo Payne', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-02 02:55:57', '2025-10-07 18:06:54', NULL, '2025-10-02 02:55:57', '2', 76, '2025-10-02 02:55:57', '2025-10-07 18:06:54'),
(392, 'Xqoo6zAnDoRDrJadW5kL', 'kiRfOKDyVWVbujuWVIdV', NULL, 'zDHUWeq7lpTu4mwGodOq', NULL, 'Petra Williams', 'bKzXACEFizwejXvHRDxo', 'ec794e72-1a29-44ea-8b1b-d3c21d6ada6b', NULL, 'open', '2025-10-02 00:01:33', '2025-10-09 15:08:21', NULL, '2025-10-02 00:01:33', '2', 76, '2025-10-02 00:01:33', '2025-11-04 19:09:03'),
(393, 'DTWoawXRHyVsZHjeZHoI', 'kiRfOKDyVWVbujuWVIdV', NULL, 'LVICZCnamVo8h1ztpI0I', 0.00, 'Patricia Rolon', 'bKzXACEFizwejXvHRDxo', 'ec794e72-1a29-44ea-8b1b-d3c21d6ada6b', NULL, 'open', '2025-10-01 23:50:25', '2025-10-09 15:08:22', NULL, '2025-10-01 23:50:25', '2', 76, '2025-10-01 23:50:25', '2025-10-09 15:08:22'),
(394, 'BH8TQBgC3X9Vf4IMcrac', 'kiRfOKDyVWVbujuWVIdV', NULL, 'ZErytk0OJEWw0pyFGZZ5', 0.00, 'Robert Woodard', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-01 23:34:37', '2025-10-01 23:34:37', NULL, '2025-10-01 23:34:37', '2', 76, '2025-10-01 23:34:37', '2025-10-01 23:34:37'),
(395, 'XsoOpjk6irqGgGTxbDv2', 'kiRfOKDyVWVbujuWVIdV', NULL, 'VF9uKfAK91nNSdRWdv9T', 0.00, 'Carol Donald', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 22:51:09', '2025-10-05 00:13:23', NULL, '2025-10-01 22:51:09', '2', 76, '2025-10-01 22:51:09', '2025-10-05 00:13:23'),
(396, 'PwFmyX6JjLibmvMccMAa', 'kiRfOKDyVWVbujuWVIdV', NULL, 'PIQDFRLGm8CYZalkwBMY', 0.00, 'Debbie Allen', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 22:43:08', '2025-10-07 18:06:54', NULL, '2025-10-01 22:43:08', '2', 76, '2025-10-01 22:43:08', '2025-10-10 22:34:19'),
(397, '7hK3kXhLgbzOuGxuL8hC', 'kiRfOKDyVWVbujuWVIdV', NULL, 'AruAqDqQZ9L7q6o0Jj0S', 0.00, 'Melvin Smith', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 21:52:31', '2025-10-07 18:06:57', NULL, '2025-10-01 21:52:31', '2', 76, '2025-10-01 21:52:31', '2025-10-15 22:40:16'),
(398, 'raGXwqYfniQiOLH9He3t', 'kiRfOKDyVWVbujuWVIdV', NULL, 'tIA3JEIFF2EC3vkgsqqP', 0.00, 'Helen Dykes', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 20:51:49', '2025-10-02 22:31:59', NULL, '2025-10-01 20:51:49', '2', 76, '2025-10-01 20:51:49', '2025-10-16 03:27:02'),
(399, 'UdhfUzywtlKxCXv8UfpY', 'kiRfOKDyVWVbujuWVIdV', NULL, 'PHZlU2ERQSzhAsWVYE1p', 0.00, 'Ramon Gomez', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-01 18:50:26', '2025-10-02 19:05:37', NULL, '2025-10-01 18:50:26', '2', 76, '2025-10-01 18:50:26', '2025-10-02 19:05:37'),
(400, 'qPa7nYWL4GfSR2vNp0Cl', 'kiRfOKDyVWVbujuWVIdV', NULL, 'wXAZjygX0kQ5CUyhxoBh', 0.00, 'Thomas Phelan', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 18:04:02', '2025-10-04 19:26:23', NULL, '2025-10-01 18:04:02', '2', 76, '2025-10-01 18:04:02', '2025-10-04 19:26:23'),
(401, 'qBZzid9ANirNrtrel0oo', 'kiRfOKDyVWVbujuWVIdV', NULL, 'j5TpVeE5DaREA8AtwU8j', 0.00, 'David Stanley', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 15:07:35', '2025-10-04 16:36:26', NULL, '2025-10-01 15:07:35', '2', 76, '2025-10-01 15:07:35', '2025-10-04 16:36:26'),
(402, 'RcSztIfeU0xTDxVF2DWV', 'kiRfOKDyVWVbujuWVIdV', NULL, 'JxTDXwvIVQTlHyhxCXWV', 0.00, 'Eva Sip Cich', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-01 14:22:15', '2025-10-01 14:22:15', NULL, '2025-10-01 14:22:15', '2', 76, '2025-10-01 14:22:15', '2025-10-01 14:22:15');
INSERT INTO `opportunities` (`id`, `opportunity_id`, `location_id`, `assigned_to`, `contact_id`, `monetary_value`, `name`, `pipeline_id`, `pipeline_stage_id`, `source`, `status`, `last_status_change_at`, `last_stage_change_at`, `last_action_date`, `date_added`, `company_id`, `user_id`, `created_at`, `updated_at`) VALUES
(403, 'UcigolgQ7zuMUaaJMf5j', 'kiRfOKDyVWVbujuWVIdV', NULL, 'wgA8CNjNqi4Cq8UX5YXz', 0.00, 'Diane Morse', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 13:27:53', '2025-10-02 20:27:54', NULL, '2025-10-01 13:27:53', '2', 76, '2025-10-01 13:27:53', '2025-10-02 20:27:54'),
(404, 'MRmVALTbtI97pktCZ2uo', 'kiRfOKDyVWVbujuWVIdV', NULL, 'v50ttLLuQsIkQ1ufpqZf', 0.00, 'Edward Stiles', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 13:16:16', '2025-10-04 14:38:32', NULL, '2025-10-01 13:16:16', '2', 76, '2025-10-01 13:16:16', '2025-10-04 14:38:32'),
(405, 'cZmar7AkNM7XTlMVNEE1', 'kiRfOKDyVWVbujuWVIdV', NULL, '2jg4E01X6kmYXierT38e', 0.00, 'Wyanda Brumfield', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 12:57:05', '2025-10-02 18:02:10', NULL, '2025-10-01 12:57:05', '2', 76, '2025-10-01 12:57:05', '2025-10-02 18:02:10'),
(406, '7JeIiyrGBnNszAw6PZ6e', 'kiRfOKDyVWVbujuWVIdV', NULL, 'rWj7w42Gs7AXkTG8B1B7', 0.00, 'Richard Baker', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-01 10:31:32', '2025-10-01 15:29:19', NULL, '2025-10-01 10:31:32', '2', 76, '2025-10-01 10:31:32', '2025-10-15 21:40:51'),
(407, 'JWXCQ4tM4KXu3N9zvyRT', 'kiRfOKDyVWVbujuWVIdV', NULL, 'kat4Gerezk8hhB8mLJP1', 0.00, 'Shirley A Lyons', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 10:11:49', '2025-10-04 11:34:04', NULL, '2025-10-01 10:11:49', '2', 76, '2025-10-01 10:11:49', '2025-10-04 11:34:04'),
(408, 'KM7lefcGniHoggtJflqw', 'kiRfOKDyVWVbujuWVIdV', NULL, 'CSwDRUdPLuac5BFyzb5u', 0.00, 'James Fletcher', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 09:12:51', '2025-10-07 18:06:57', NULL, '2025-10-01 09:12:51', '2', 76, '2025-10-01 09:12:51', '2025-10-07 18:06:57'),
(409, 'IpEgPobBc1HRinxt78TV', 'kiRfOKDyVWVbujuWVIdV', NULL, 'j2ILwqtfABuDl6Ah2j7K', 0.00, 'Byron Desue', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-01 09:10:22', '2025-10-01 09:10:22', NULL, '2025-10-01 09:10:22', '2', 76, '2025-10-01 09:10:22', '2025-10-01 09:10:22'),
(410, 'PAab25KZ0J1DyJyprJTw', 'kiRfOKDyVWVbujuWVIdV', NULL, 'DZf5szpDrbUMvTLqLy5A', 0.00, 'Shanica Vaughn', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-01 08:20:18', '2025-10-01 08:20:18', NULL, '2025-10-01 08:20:18', '2', 76, '2025-10-01 08:20:18', '2025-10-01 08:20:18'),
(411, 'mLmQjwC5E60aFJkJmpWQ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'xVaxqKJjdIjzNMIWat8b', 0.00, 'Brenda Rozsa', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 07:11:15', '2025-10-04 08:33:33', NULL, '2025-10-01 07:11:15', '2', 76, '2025-10-01 07:11:15', '2025-10-08 23:00:57'),
(412, 'rUJ7hiyCW0pQ6h36JN3V', 'kiRfOKDyVWVbujuWVIdV', NULL, 'eOkgeyr9WiA2fkrzzVCI', 0.00, 'Josseth Davis', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 07:03:24', '2025-10-07 18:07:02', NULL, '2025-10-01 07:03:24', '2', 76, '2025-10-01 07:03:24', '2025-10-07 18:07:02'),
(413, 'TdQlizXuSImPG2qEOnc2', 'kiRfOKDyVWVbujuWVIdV', NULL, 'QsnNwtPedlcEz2dPZiTm', 0.00, 'Jon Powell', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 05:31:59', '2025-10-01 15:26:55', NULL, '2025-10-01 05:31:59', '2', 76, '2025-10-01 05:31:59', '2025-10-01 15:26:55'),
(414, 'YX3tra0YoR68y4sBwFd8', 'kiRfOKDyVWVbujuWVIdV', NULL, 'djNWGZuPbaIUdW4H9QUj', 0.00, 'Cheryle Edwards Fowler', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-10-01 04:49:39', '2025-10-01 04:49:39', NULL, '2025-10-01 04:49:39', '2', 76, '2025-10-01 04:49:39', '2025-10-01 04:49:39'),
(415, 'PR4zXBTIPKF9lt9gjPRY', 'kiRfOKDyVWVbujuWVIdV', NULL, 'XsbDJlBPpjJ74OO2y7s0', 0.00, 'Jared Gish', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-10-01 04:49:06', '2025-10-07 18:07:00', NULL, '2025-10-01 04:49:06', '2', 76, '2025-10-01 04:49:06', '2025-10-07 18:07:00'),
(416, 'bK6jIgc074QiQAeswzxh', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Cd7nfqqxQjEIV1CM2pQ6', 0.00, 'Shawntae Thomas', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', '2025-09-30 20:33:02', '2025-09-30 20:33:02', NULL, '2025-09-30 20:33:02', '2', 76, '2025-09-30 20:33:02', '2025-09-30 20:33:02'),
(417, 'C4vwT6DrYYgKLsM0vAay', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Wh1Yyqq7l6jDlgqwk0Rx', 0.00, 'Vicky Laich', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-30 12:49:29', '2025-10-01 15:28:16', NULL, '2025-09-30 12:49:29', '2', 76, '2025-09-30 12:49:29', '2025-10-01 15:28:16'),
(418, '4budd2K78Fq5gQAzfhyN', 'kiRfOKDyVWVbujuWVIdV', NULL, 'd8NEoQd3DpnVsNAIjfPc', 0.00, 'Charles Newman', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-30 06:02:22', '2025-10-07 18:07:01', NULL, '2025-09-30 06:02:22', '2', 76, '2025-09-30 06:02:22', '2025-10-07 18:07:01'),
(419, 'GHknUTLqUuHzC5NLJYe4', 'kiRfOKDyVWVbujuWVIdV', NULL, 'UcrJYsUd4y3Up2pbBMr5', 0.00, 'Melissa Mccoy', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-30 05:34:43', '2025-10-02 18:12:09', NULL, '2025-09-30 05:34:43', '2', 76, '2025-09-30 05:34:43', '2025-10-02 18:12:09'),
(420, 'nCT7McCyyZIO4Yw6RGLa', 'kiRfOKDyVWVbujuWVIdV', NULL, 'vpxkze6xAwMSzgFiGEaK', 0.00, 'Lavar Boyd', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-30 03:35:36', '2025-09-30 04:16:27', NULL, '2025-09-30 03:35:36', '2', 76, '2025-09-30 03:35:36', '2025-09-30 04:16:27'),
(421, 'KulehhIK4hxXzoBGG6n4', 'kiRfOKDyVWVbujuWVIdV', NULL, 'aARnkkxlzqfhLWqR40Wg', 0.00, 'Arnold Lacour', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-30 03:25:58', '2025-10-03 04:48:12', NULL, '2025-09-30 03:25:58', '2', 76, '2025-09-30 03:25:58', '2025-10-03 04:48:12'),
(422, 'Hi6Lm73hwcZmiH9OqZkT', 'kiRfOKDyVWVbujuWVIdV', NULL, '7S4IrxXDo8LS3InFDK5O', 0.00, 'Julie Gross', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-24 20:38:33', '2025-09-29 17:08:24', NULL, '2025-09-24 20:38:33', '2', 76, '2025-09-24 20:38:33', '2025-09-29 17:08:24'),
(423, 'FMyWaJ8wjuYZjktvD1XA', 'kiRfOKDyVWVbujuWVIdV', NULL, 'GGvnDzGwUVoH4VEdYEKA', 0.00, 'William Waugh', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-24 20:30:54', '2025-09-29 17:08:29', NULL, '2025-09-24 20:30:54', '2', 76, '2025-09-24 20:30:54', '2025-09-29 17:08:29'),
(424, 'KfW4WprrN5ArFI0kNh19', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Moxw8rSGKffTxPU5NzNp', 0.00, 'Amanda Bee', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-24 17:25:56', '2025-09-29 17:08:08', NULL, '2025-09-24 17:25:56', '2', 76, '2025-09-24 17:25:56', '2025-09-29 17:08:08'),
(425, 'JBZ3Y1uScgs4X5bSzLKB', 'kiRfOKDyVWVbujuWVIdV', NULL, 'jWwQo4ja6H3ptpSnjpZe', 0.00, 'Cleve Hearron', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-24 17:03:02', '2025-09-29 17:08:07', NULL, '2025-09-24 17:03:02', '2', 76, '2025-09-24 17:03:02', '2025-09-29 17:08:07'),
(426, 'JOYVPgDsNhyNGJRnojJP', 'kiRfOKDyVWVbujuWVIdV', NULL, 'tokaUtDPc58QaqKJTseJ', 0.00, 'Carol Ferguson', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-24 15:34:32', '2025-09-29 02:05:18', NULL, '2025-09-24 15:34:32', '2', 76, '2025-09-24 15:34:32', '2025-10-14 20:22:27'),
(427, 'yomJlu7HOnklCr87J0M4', 'kiRfOKDyVWVbujuWVIdV', NULL, 'yMeggLklYKV70ST7x3il', 0.00, 'Veda Hunt', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-24 12:41:06', '2025-09-29 17:08:08', NULL, '2025-09-24 12:41:06', '2', 76, '2025-09-24 12:41:06', '2025-09-29 17:08:08'),
(428, 'qoLU7hZur1ztkofluzqY', 'kiRfOKDyVWVbujuWVIdV', NULL, 'CJMOysaWwWoHR3fmDlih', 0.00, 'Nancy Smith', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-24 11:41:18', '2025-09-29 02:05:24', NULL, '2025-09-24 11:41:18', '2', 76, '2025-09-24 11:41:18', '2025-09-29 02:05:24'),
(429, '9pcIQSmaQczRipTHJYBR', 'kiRfOKDyVWVbujuWVIdV', NULL, '1KpeIJI1nf3e62jz0Glt', 0.00, 'Matthew Stanfield', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-24 11:33:05', '2025-09-29 02:05:25', NULL, '2025-09-24 11:33:05', '2', 76, '2025-09-24 11:33:05', '2025-09-29 02:05:25'),
(430, 'M5U12zKigG4z7Q8NCWXY', 'kiRfOKDyVWVbujuWVIdV', NULL, 'HOU6vIt6syhQCipNKJOL', 0.00, 'Donna Pleasant', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-24 10:19:28', '2025-09-29 02:05:42', NULL, '2025-09-24 10:19:28', '2', 76, '2025-09-24 10:19:28', '2025-09-29 02:05:42'),
(431, 'RfTBmtCKAoz6RpDgZLOe', 'kiRfOKDyVWVbujuWVIdV', NULL, 'CNdNRvMcY73waN4rBb1J', 0.00, 'Donnellwilcoxson20@Gmail.Com Wilcoxson', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-24 03:34:39', '2025-09-29 02:05:47', NULL, '2025-09-24 03:34:39', '2', 76, '2025-09-24 03:34:39', '2025-09-29 02:05:47'),
(432, 'MB7DctBBSJbsa8wdd45b', 'kiRfOKDyVWVbujuWVIdV', '', 'JILI3aLmK5CarMVnihmP', 0.00, 'Candy Perry', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'lost', '2025-09-29 17:03:34', '2025-09-25 13:22:51', NULL, '2025-09-24 00:29:20', '2', 76, '2025-09-24 00:29:20', '2025-09-29 17:03:34'),
(433, 'X9i690z3RloGzhOThXlI', 'kiRfOKDyVWVbujuWVIdV', NULL, 'mYidWIDJz52TTOXBKOLz', 0.00, 'Eileen Halle', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-23 21:55:43', '2025-09-29 17:08:09', NULL, '2025-09-23 21:55:43', '2', 76, '2025-09-23 21:55:43', '2025-09-29 17:08:09'),
(434, 'UhLNjMncORdFK6GVeT2N', 'kiRfOKDyVWVbujuWVIdV', NULL, 'zS8zElG1F0rGK6hIXed2', 0.00, 'Craig Phillips', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-23 18:19:17', '2025-09-29 02:05:52', NULL, '2025-09-23 18:19:17', '2', 76, '2025-09-23 18:19:17', '2025-09-29 02:05:52'),
(435, 'jOxMBdkvjBsiqciEBMUK', 'kiRfOKDyVWVbujuWVIdV', NULL, '8mB1sCLKwUOp5flgIPIf', 0.00, 'Christopher Orozco ', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-23 13:10:23', '2025-09-29 17:08:40', NULL, '2025-09-23 13:10:23', '2', 76, '2025-09-23 13:10:23', '2025-09-29 17:08:40'),
(436, 'kdC7LVyToYKjmR05edsj', 'kiRfOKDyVWVbujuWVIdV', NULL, 't7IMD6ilz373bqOGyqwV', 0.00, 'Tabatha Simmonds', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-23 10:17:35', '2025-09-29 17:08:13', NULL, '2025-09-23 10:17:35', '2', 76, '2025-09-23 10:17:35', '2025-09-29 17:08:13'),
(437, 'lvuUZ7MAyzMFWEVkoQZ9', 'kiRfOKDyVWVbujuWVIdV', NULL, '3UgnlUE0CureHn8Y1W3M', 0.00, 'William Thomas', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-23 05:11:35', '2025-09-29 02:46:17', NULL, '2025-09-23 05:11:35', '2', 76, '2025-09-23 05:11:35', '2025-09-29 02:46:17'),
(438, 'wS42Sn7esImyPlW7GQSc', 'kiRfOKDyVWVbujuWVIdV', NULL, 'MzwhtfXzP2z64qfAoeVK', 0.00, 'Tim Poole', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-23 03:24:11', '2025-09-29 02:05:55', NULL, '2025-09-23 03:24:11', '2', 76, '2025-09-23 03:24:11', '2025-09-29 02:05:55'),
(439, '15CrwCQwdXp9EpHFofgj', 'kiRfOKDyVWVbujuWVIdV', NULL, 'IRNFCoFJEgsOVNYskAYH', 0.00, 'Lisa Gilbert', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-23 02:53:00', '2025-09-29 02:05:56', NULL, '2025-09-23 02:53:00', '2', 76, '2025-09-23 02:53:00', '2025-09-29 02:05:56'),
(440, 'mQBi7mAwUPOAWvsTCE1U', 'kiRfOKDyVWVbujuWVIdV', NULL, 't3Ql8TgjRU04PlK7HT2W', 0.00, 'Lisa Belanger', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-23 01:21:24', '2025-09-29 17:08:14', NULL, '2025-09-23 01:21:24', '2', 76, '2025-09-23 01:21:24', '2025-09-29 17:08:14'),
(441, 'Mi7cBUH4R9O1qP0Jwrjb', 'kiRfOKDyVWVbujuWVIdV', NULL, 'HSpsVZy4XFxh0Zmi1Obd', 0.00, 'Wallace Strang', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-23 01:05:30', '2025-09-29 02:46:20', NULL, '2025-09-23 01:05:30', '2', 76, '2025-09-23 01:05:30', '2025-09-29 02:46:20'),
(442, '3F1E3ZiVpjtzS4hwPo7X', 'kiRfOKDyVWVbujuWVIdV', NULL, 'x7Aqw99qFYxUKmPHvqpf', 0.00, 'Susie Cooper Mullins', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-23 00:37:55', '2025-09-29 02:06:02', NULL, '2025-09-23 00:37:55', '2', 76, '2025-09-23 00:37:55', '2025-09-29 02:06:02'),
(443, 'DK6tolCoc6VqjnbudNfe', 'kiRfOKDyVWVbujuWVIdV', NULL, 'so2qiUNjcE03BFw7MiOC', 0.00, 'Akhoury G.', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-22 23:51:32', '2025-09-29 02:06:05', NULL, '2025-09-22 23:51:32', '2', 76, '2025-09-22 23:51:32', '2025-09-29 02:06:05'),
(444, 'kTnvfrSH0alCGlY0X9bf', 'kiRfOKDyVWVbujuWVIdV', NULL, 'mTIRGuVx9V9JvLyhaWvW', 0.00, 'Amber Stewart', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-22 23:16:00', '2025-09-29 18:20:49', NULL, '2025-09-22 23:16:00', '2', 76, '2025-09-22 23:16:00', '2025-09-29 18:20:49'),
(445, 'i4IWfAkh3GIWE2eYo3QX', 'kiRfOKDyVWVbujuWVIdV', NULL, 'SeXOthIoadgyVwOA2FgZ', 0.00, 'Tera Bush', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-22 22:26:21', '2025-09-29 02:05:33', NULL, '2025-09-22 22:26:21', '2', 76, '2025-09-22 22:26:21', '2025-09-29 02:05:33'),
(446, 'VA9wD1Lml4SlWU7UAn0t', 'kiRfOKDyVWVbujuWVIdV', NULL, 'erMk5NachWVtjXmtdXBa', 0.00, 'Chuck Bell', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-22 19:51:46', '2025-09-29 02:06:19', NULL, '2025-09-22 19:51:46', '2', 76, '2025-09-22 19:51:46', '2025-09-29 02:06:19'),
(447, 'rUSFVInaVTEjqUzDFDod', 'kiRfOKDyVWVbujuWVIdV', NULL, 'd7QehvCuYztL2W1NgwQl', 0.00, 'R Swint', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-22 16:05:57', '2025-09-29 02:46:22', NULL, '2025-09-22 16:05:57', '2', 76, '2025-09-22 16:05:57', '2025-09-29 02:46:22'),
(448, '4ohcDCRJYsvFADQWOu6I', 'kiRfOKDyVWVbujuWVIdV', NULL, 'e1GltgVEejU3A2cxdv6k', 0.00, 'Lauralee Blattner', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-22 15:16:04', '2025-09-29 02:46:23', NULL, '2025-09-22 15:16:04', '2', 76, '2025-09-22 15:16:04', '2025-09-29 02:46:23'),
(449, 'B6cAEcavDF3D7vCY3U4m', 'kiRfOKDyVWVbujuWVIdV', NULL, 'MfVYxRRh97rR8uRz2oQC', 0.00, 'Julie Bostick', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-22 15:09:13', '2025-09-29 02:46:25', NULL, '2025-09-22 15:09:13', '2', 76, '2025-09-22 15:09:13', '2025-09-29 02:46:25'),
(450, 'rqL9slaf08DtOzW2K20K', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Y46Mfy2uPm0yVbBfOwBj', 0.00, 'Robert Cook', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', '2025-09-22 12:22:36', '2025-09-29 02:05:28', NULL, '2025-09-22 12:22:36', '2', 76, '2025-09-22 12:22:36', '2025-10-10 13:37:13'),
(451, 'aA9K4wlteh0EkzKXJBZw', 'kiRfOKDyVWVbujuWVIdV', NULL, 'QsBsCPu8TSICGzhXkKhm', NULL, 'Scott Estep', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-23 18:19:43', NULL, 76, '2025-10-23 18:19:45', '2025-10-23 18:28:41'),
(452, 'YYyX8fn49Vusa0sTW8fx', 'kiRfOKDyVWVbujuWVIdV', NULL, 'sRn2SYs5Kdg8dgAmxdbc', NULL, 'Wendell Bryant', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-23 17:31:35', NULL, 76, '2025-10-23 18:23:39', '2025-10-23 18:28:43'),
(453, '73mAsHogKRfIKMNZpOh1', 'kiRfOKDyVWVbujuWVIdV', NULL, '1P0TO9vkHyRmSALsyncS', NULL, 'Joel Taylor', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-23 19:35:38', NULL, 76, '2025-10-23 19:35:41', '2025-10-23 20:28:43'),
(454, '2fEIG8QIHeMGWCaIzgHk', 'kiRfOKDyVWVbujuWVIdV', NULL, '5CHn4UErmlU24y2W4IoL', NULL, 'Heather Keisker', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-23 19:51:54', NULL, 76, '2025-10-23 19:51:56', '2025-10-24 20:03:35'),
(455, 'FP86ecCDbFFVsf6lSxL8', 'kiRfOKDyVWVbujuWVIdV', NULL, 'cGOR8poGdBs6igPz63Y7', NULL, 'Anita Spence', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-23 22:39:27', NULL, 76, '2025-10-23 22:39:29', '2025-10-27 13:13:45'),
(456, 's4nKVMlAmlRQYy266yVG', 'kiRfOKDyVWVbujuWVIdV', NULL, 'QsBsCPu8TSICGzhXkKhm', NULL, 'Scott Estep', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-24 14:27:49', NULL, 76, '2025-10-24 14:27:51', '2025-10-28 02:55:34'),
(457, 'SJhlKXun8HxVI8qzyIAq', 'kiRfOKDyVWVbujuWVIdV', NULL, 'xQNZGLD8MRqR1EqWAHMa', NULL, 'Jim Gormley', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-24 17:58:08', NULL, 76, '2025-10-24 17:58:10', '2025-10-24 17:58:10'),
(458, 'M2XlL6DiCj4MffnIufre', 'kiRfOKDyVWVbujuWVIdV', NULL, 'KwcJqAvBkIx5WmbOlyEk', NULL, 'Ruth Lewis Lay', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-24 18:25:47', NULL, 76, '2025-10-24 18:25:50', '2025-10-24 18:25:50'),
(459, 'mk2RrEyMZXsIs5Y9YeCV', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Wyu8YaFQG6omuxQeqUW6', NULL, 'James Williams', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', NULL, 'open', NULL, NULL, NULL, '2025-10-25 00:21:17', NULL, 76, '2025-10-25 00:21:19', '2025-10-30 13:08:35'),
(460, '7yp9fanaEz3WivCWXKGf', 'kiRfOKDyVWVbujuWVIdV', NULL, '18N08oda7OtesmWqwrvu', NULL, 'Leonard Stafford', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-23 17:22:14', NULL, 76, '2025-10-26 18:39:29', '2025-10-26 18:44:31'),
(461, 'Aq8YwcKCzrxmZvMhIzCp', 'kiRfOKDyVWVbujuWVIdV', NULL, '9pjRFEUTyTJRaW3zaAC0', NULL, 'Bret Wright', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-27 12:55:51', NULL, 76, '2025-10-27 12:55:52', '2025-10-27 13:17:48'),
(462, 'Wmj4QDVx3hVL8v6lv2HE', 'kiRfOKDyVWVbujuWVIdV', NULL, 'STAc0HCFs0E8uPzkkvxt', NULL, 'Tamara Ricks', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-27 12:57:40', NULL, 76, '2025-10-27 12:57:42', '2025-10-30 14:21:36'),
(463, 'C6GlosWPNTbiG2IYTI6b', 'kiRfOKDyVWVbujuWVIdV', NULL, 'aAS7qsx5ESBFFpoGUAyp', NULL, 'Dion Slade', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-27 17:02:49', NULL, 76, '2025-10-27 17:02:51', '2025-10-27 17:02:51'),
(464, 'oC0MKduFjTMW2bS4wZ06', 'kiRfOKDyVWVbujuWVIdV', NULL, '3D7Ob6T1UcpCcoCfnTdS', NULL, 'Larry Dusenbury !', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-27 17:59:34', NULL, 76, '2025-10-27 17:59:37', '2025-10-27 17:59:37'),
(465, 'tD6D1j8QnxrHrKVDAfqm', 'kiRfOKDyVWVbujuWVIdV', NULL, '93i6ETrMtdo8o5kiLVOm', NULL, 'David Popp', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-27 19:21:18', NULL, 76, '2025-10-27 19:21:21', '2025-10-30 20:43:43'),
(466, 'laAAGHMs5fR0iZvBhOlQ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'i3XBJcnb2waLLKc1aDnJ', NULL, 'Griffen Dearmond', 'nl32t7MUfkhrOZN4sNeT', '4c73710f-edb2-4d7a-8403-56d1a0edd9e4', NULL, 'open', NULL, NULL, NULL, '2025-10-10 17:25:37', NULL, 76, '2025-10-28 02:51:39', '2025-10-28 02:51:39'),
(467, 'AoQcGDwkd2Dta80i3OAA', 'kiRfOKDyVWVbujuWVIdV', NULL, '87pY48POZtU0RomIezIb', NULL, 'Brenda Edwards', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-28 12:56:04', NULL, 76, '2025-10-28 12:56:06', '2025-10-31 14:18:36'),
(468, 'W9FfhdYeMoZcR5tpowsx', 'kiRfOKDyVWVbujuWVIdV', NULL, 'MoUp8a5M37HiI7isOhmh', NULL, 'Steve Dezell', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-28 13:18:26', NULL, 76, '2025-10-28 13:18:29', '2025-10-28 13:45:51'),
(469, 'h68aVSxfUGofC6d7I1ns', 'kiRfOKDyVWVbujuWVIdV', NULL, 'cj7VEVCYKLBggh9c2XDX', NULL, 'Harold Mcgruther', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', NULL, 'open', NULL, NULL, NULL, '2025-10-28 13:27:01', NULL, 76, '2025-10-28 13:27:03', '2025-10-31 14:50:33'),
(470, 'wcxuVmqN0XyRTuWjET2H', 'kiRfOKDyVWVbujuWVIdV', NULL, 'MnIXuQ9BJWIsNJKJYcjT', NULL, 'Gloria Campoalegre', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-28 14:02:55', NULL, 76, '2025-10-28 14:02:57', '2025-10-28 14:02:57'),
(471, 'dVbG3fS132ZiLtSo6lb0', 'kiRfOKDyVWVbujuWVIdV', NULL, 'SFTz4hlrAMf3X4hEM4yZ', NULL, 'Sheena Guidry', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-28 23:42:18', NULL, 76, '2025-10-28 23:42:20', '2025-11-01 13:17:03'),
(472, 'zAildDout3tQ5y3wkqQd', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Ss85AnYLjw44HvYzn5qG', NULL, 'Elsie Flores', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-29 12:33:27', NULL, 76, '2025-10-29 12:33:28', '2025-10-29 12:33:28'),
(473, '0IVqFnK1TwEivHbVMFQz', 'kiRfOKDyVWVbujuWVIdV', NULL, 'GmuJyQSeTZh5c8Lkbknk', NULL, 'Melissa Vest', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-29 12:43:48', NULL, 76, '2025-10-29 12:43:51', '2025-11-01 14:15:38'),
(474, 'e6VfX8PYx7j1Lu3WkHgi', 'kiRfOKDyVWVbujuWVIdV', NULL, 'D0NkAQ2UJUd8v4VwEP3I', NULL, 'Anna Brown', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-29 13:06:47', NULL, 76, '2025-10-29 13:06:58', '2025-11-01 14:29:08'),
(475, 'P94gxoEJzr3lt5CQBKNk', 'kiRfOKDyVWVbujuWVIdV', NULL, 'g8F6iMRGeerpfzegH7UF', NULL, 'Ralph Persuhn', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-29 13:06:26', NULL, 76, '2025-10-29 13:07:46', '2025-11-01 14:28:45'),
(476, 'fj9OhF2tIj9HOJRXJ5B9', 'kiRfOKDyVWVbujuWVIdV', NULL, 'odPfKiqu3wPQBWQxmKOn', NULL, 'Marisa Moerland', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-29 13:11:20', NULL, 76, '2025-10-29 13:12:49', '2025-10-29 13:12:49'),
(477, 'ABsnSa2OMOKP7k6e9AGl', 'kiRfOKDyVWVbujuWVIdV', NULL, '4pfktmhydmeiPVycxwJC', NULL, 'Penny Scott', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-10-29 13:59:50', NULL, 76, '2025-10-29 13:59:52', '2025-10-29 14:08:01'),
(478, 'QJc8SDElvOeQmP8psIQM', 'kiRfOKDyVWVbujuWVIdV', NULL, 'zyuOufQ6VO0i9Bm8ODQH', NULL, 'Gregory⁷ Williams', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-29 18:30:18', NULL, 76, '2025-10-29 18:30:21', '2025-10-29 18:30:21'),
(479, 'qHs8E30Fl6tHGnDr1gHi', 'kiRfOKDyVWVbujuWVIdV', NULL, 'SR3OtIUCmrllsO3DZ3jW', NULL, 'Melissa Mondor', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-29 19:35:47', NULL, 76, '2025-10-29 19:35:50', '2025-11-01 20:58:01'),
(480, 'LQ3PiBKWnGHpwsRn8KeG', 'kiRfOKDyVWVbujuWVIdV', NULL, 'jIiSFRvF4TUy9jAAM9WM', NULL, 'Holly Harris', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-29 19:41:16', NULL, 76, '2025-10-29 19:41:19', '2025-10-29 19:41:19'),
(481, 'QsXIKFz7dkPCg84RtSRR', 'kiRfOKDyVWVbujuWVIdV', NULL, 'oPp2xo8X9p0G17rjQ9rf', NULL, 'Clara Mineer', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-29 20:15:04', NULL, 76, '2025-10-29 20:15:05', '2025-11-02 14:15:39'),
(482, 'ViN2pu2BV25GBQQGr7TF', 'kiRfOKDyVWVbujuWVIdV', NULL, 'lBQDLEIoKRvFQExDYfXH', NULL, 'Damien Hodge', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', NULL, NULL, NULL, '2025-10-30 13:54:49', NULL, 76, '2025-10-30 13:54:51', '2025-10-30 14:24:09'),
(483, 'MegPzhT3922tdtcnIOVn', 'kiRfOKDyVWVbujuWVIdV', NULL, '3tpeGa9louoWrDnvCDmD', NULL, 'Gregory Mosley', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-30 15:44:41', NULL, 76, '2025-10-30 15:44:44', '2025-11-02 18:09:51'),
(484, 'UZmDBcFh1YIPBOYUGl2D', 'kiRfOKDyVWVbujuWVIdV', 'Aj2MHYg7hGlPYViIofn9', 'hgM5fNtY9st8rFuJjIKD', NULL, 'Jeffrey Johnston', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-30 17:20:07', NULL, 76, '2025-10-30 17:20:08', '2025-10-30 20:27:47'),
(485, 'sbo309AMWVFNHJ54jNOU', 'kiRfOKDyVWVbujuWVIdV', NULL, 'MReI3zF4X04DTsMoVkkQ', NULL, 'Brenda Prince', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-30 18:15:34', NULL, 76, '2025-10-30 18:15:37', '2025-10-30 18:15:37'),
(486, '8Me2DKBYpECarWspVHGP', 'kiRfOKDyVWVbujuWVIdV', NULL, 'hEfITXRfYKQYsEuW4Z21', NULL, 'Matthew Yusko', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-30 19:35:39', NULL, 76, '2025-10-30 19:35:41', '2025-10-31 18:28:39'),
(487, 'Gto7ZJtqwJiRRL6YfXMO', 'kiRfOKDyVWVbujuWVIdV', NULL, 'zfR6e6lOb5BKDULJzAhV', NULL, 'Eric Sebade', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-30 19:56:56', NULL, 76, '2025-10-30 19:56:57', '2025-11-03 14:16:56'),
(488, '9Z2qiu7GkPdusKfOfMUt', 'kiRfOKDyVWVbujuWVIdV', NULL, 'RTt7SQVYlrlIBowVPAWQ', NULL, 'Johnr Davis', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-10-30 22:21:45', NULL, 76, '2025-10-30 22:21:47', '2025-11-01 14:18:58'),
(489, '7cOpUVeNjW5E5mAaneEu', 'kiRfOKDyVWVbujuWVIdV', NULL, 'nmlMWKtAzGDCvwmwM7fq', NULL, 'Roberta Kuschel', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-30 23:27:34', NULL, 76, '2025-10-30 23:27:35', '2025-10-30 23:27:35'),
(490, 'd9Pg16pDbbF7qhynEve8', 'kiRfOKDyVWVbujuWVIdV', NULL, 'HLz2XVkswExZmDzjrcwi', NULL, 'Angia Macomber', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', NULL, 'open', NULL, NULL, NULL, '2025-10-31 03:18:28', NULL, 76, '2025-10-31 03:18:30', '2025-11-03 14:12:48'),
(491, 'TCf3Q5Gm8ZtG2ClII6ok', 'kiRfOKDyVWVbujuWVIdV', NULL, '2gbm3dDsOdBcu86LQhCF', NULL, 'Cecelia Lippert', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 04:08:00', NULL, 76, '2025-10-31 04:08:02', '2025-10-31 18:28:35'),
(492, 'pKNW1FXj7CTGj1i2iU7I', 'kiRfOKDyVWVbujuWVIdV', NULL, 'o0s46dl8XNsI7USCwIBU', NULL, 'C R', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 04:14:26', NULL, 76, '2025-10-31 04:14:27', '2025-11-03 14:13:34'),
(493, 'TYCEmLJZnQBR52HzkjMn', 'kiRfOKDyVWVbujuWVIdV', NULL, 'OO3R592uIRirpXLV5haD', NULL, 'A Sanchez', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 04:18:03', NULL, 76, '2025-10-31 04:18:52', '2025-11-03 14:17:26'),
(494, '37jTnw6oeqmg14eGpVT3', 'kiRfOKDyVWVbujuWVIdV', NULL, 'ZrlLIkjXyMW3PPC7TGrt', NULL, 'Luann Kurfis', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', NULL, 'open', NULL, NULL, NULL, '2025-10-31 04:34:46', NULL, 76, '2025-10-31 04:34:47', '2025-11-03 14:12:26'),
(495, 'DBL0vqmXJu9JaUyyxdVF', 'kiRfOKDyVWVbujuWVIdV', NULL, 'XfpCxCZHxQixUipt1wsr', NULL, 'John Gerard', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', NULL, NULL, NULL, '2025-10-31 08:39:12', NULL, 76, '2025-10-31 08:39:14', '2025-10-31 13:58:47'),
(496, 'rG9xGAj4v84wgVmF7Rnx', 'kiRfOKDyVWVbujuWVIdV', NULL, 'pITiHSRiKlhD1r0B2PW7', NULL, 'Bryan Lafevers', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-10-31 09:27:17', NULL, 76, '2025-10-31 09:27:19', '2025-10-31 09:45:48'),
(497, 'LZkIabgsQdWPXM69KxF6', 'kiRfOKDyVWVbujuWVIdV', NULL, 'mM6YLGJaIg27B0Oir3FV', NULL, 'Jason Summers', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 16:55:48', NULL, 76, '2025-10-31 16:55:51', '2025-10-31 18:28:32'),
(498, 'N72pvX64EanFgQyrnJWm', 'kiRfOKDyVWVbujuWVIdV', NULL, 'yAU4fkrlATpARTzcdUf0', NULL, 'Billy Lott', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 16:56:11', NULL, 76, '2025-10-31 16:56:13', '2025-10-31 19:56:41'),
(499, 'jdIWVbb6sTRZy7D44UZi', 'kiRfOKDyVWVbujuWVIdV', NULL, 'QsBsCPu8TSICGzhXkKhm', NULL, 'Scott Estep', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', NULL, 'open', NULL, NULL, NULL, '2025-10-31 17:04:20', NULL, 76, '2025-10-31 17:04:24', '2025-10-31 18:23:23'),
(500, 'oiU3FIgZ7hkLdO8xqjx2', 'kiRfOKDyVWVbujuWVIdV', NULL, 'AkrVDaOm4OmfILIYLizB', NULL, 'Susan Bucci', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-31 18:05:41', NULL, 76, '2025-10-31 18:05:43', '2025-10-31 18:05:43'),
(501, '0JDkaZC6MCRtbh2FDOvQ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'PzTQgdL4M7OUP1vuNc7S', NULL, 'Sharon Akers', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 18:19:40', NULL, 76, '2025-10-31 18:19:43', '2025-10-31 18:28:40'),
(502, 'gc4s7UeBNZw4SZam0C3Y', 'kiRfOKDyVWVbujuWVIdV', NULL, 'rtvnJrZqKcpQe6fsx1iy', NULL, 'Jean Laurent Nkunda', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 18:29:40', NULL, 76, '2025-10-31 18:29:42', '2025-11-03 20:52:15'),
(503, 'P0tQbtz6Xj1Kn0Dq912D', 'kiRfOKDyVWVbujuWVIdV', NULL, 'aQqem0bpurFoTG0uRhCL', NULL, 'Jamey Mcqueen', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 18:37:49', NULL, 76, '2025-10-31 18:37:57', '2025-11-03 21:02:38'),
(504, 'Dcb8wy6zF7jvuaKOiC6x', 'kiRfOKDyVWVbujuWVIdV', NULL, 'f5KoXTjenovku8xZfp2T', NULL, 'Angelia Powell', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 19:20:47', NULL, 76, '2025-10-31 19:20:49', '2025-11-03 21:43:06'),
(505, '0B2MLcjOScHk5V2nUnLU', 'kiRfOKDyVWVbujuWVIdV', NULL, 'nrTwbnmSyUPSaz7GI1ex', NULL, 'Joshua Methric', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 19:31:15', NULL, 76, '2025-10-31 19:31:18', '2025-10-31 20:06:04'),
(506, 'LdHYUTRuhndeSjtUNoDw', 'kiRfOKDyVWVbujuWVIdV', NULL, '6jU3QghqrcioiTAUTgO0', NULL, 'Scott Keeblerkeebler', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-10-31 19:57:28', NULL, 76, '2025-10-31 19:57:30', '2025-10-31 20:02:43'),
(507, 'YkdKmKJdqlNdkmeIKYh0', 'kiRfOKDyVWVbujuWVIdV', NULL, '5KWzZsPnn8aZ5YOnEY37', NULL, 'Ken Langdon', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 20:46:28', NULL, 76, '2025-10-31 20:46:30', '2025-10-31 20:55:45'),
(508, '7l2vxzrJo93IwzrN4MDz', 'kiRfOKDyVWVbujuWVIdV', NULL, 'eUa3iALaNfDYbHXZlNzB', NULL, 'Susan Youngerman', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-10-31 21:00:43', NULL, 76, '2025-10-31 21:00:45', '2025-11-03 14:46:30'),
(509, 'IUK2dSDRLLhMnidcIVAl', 'kiRfOKDyVWVbujuWVIdV', NULL, 'jXuFlHj2FPGz1nWj9pUX', NULL, 'Florida Schwestka', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-10-31 22:27:47', NULL, 76, '2025-10-31 22:27:48', '2025-10-31 22:27:48'),
(510, '8orrvCLlL4K1xVgGKYi2', 'kiRfOKDyVWVbujuWVIdV', NULL, 'McKmpklwX3UHD6w5m0L8', NULL, 'Samantha Dillingham', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-10-31 22:28:58', NULL, 76, '2025-10-31 22:29:00', '2025-10-31 22:29:00'),
(511, 'mk6B6BRoqRHBBpNZEI8a', 'kiRfOKDyVWVbujuWVIdV', NULL, 'q0Pm1haJXqiKP3enxy2j', NULL, 'Rich Allen', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-10-31 22:57:41', NULL, 76, '2025-10-31 22:57:42', '2025-10-31 22:57:42'),
(512, 'RxaeDtsO2pSXbmoMGDEm', 'kiRfOKDyVWVbujuWVIdV', NULL, 'fGTEUr6n3G7nU8MGvbWq', NULL, 'Brian Allen', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-11-01 00:04:04', NULL, 76, '2025-11-01 00:04:12', '2025-11-01 00:04:12'),
(513, 'EdCXgrDyjbXaVwzhMFjI', 'kiRfOKDyVWVbujuWVIdV', NULL, 'FdXQeNo1igOK3DDYq0Tp', NULL, 'Nathan Hart', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-01 00:17:39', NULL, 76, '2025-11-01 00:17:41', '2025-11-01 00:20:10'),
(514, 'EdCXgrDyjbXaVwzhMFjI', 'kiRfOKDyVWVbujuWVIdV', NULL, 'FdXQeNo1igOK3DDYq0Tp', NULL, 'Nathan Hart', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-11-01 00:17:39', NULL, 76, '2025-11-01 00:17:41', '2025-11-01 00:17:41'),
(515, '7x2BQ5MCQhHwogqcaZDO', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Mb27Hj8wWpmZbJvlxGX9', NULL, 'Danny Moore', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-11-01 01:19:38', NULL, 76, '2025-11-01 01:19:39', '2025-11-01 01:19:39'),
(516, '1mo1joh718oWnL04Ilaw', 'kiRfOKDyVWVbujuWVIdV', NULL, 'AsIL6gJRr1WI3txZXQhe', NULL, 'Paula Brecher', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-01 01:30:20', NULL, 76, '2025-11-01 01:30:24', '2025-11-01 01:48:42'),
(517, '1HrgBgyCDGy2OE4myhga', 'kiRfOKDyVWVbujuWVIdV', NULL, 'gejQs8t5sffY8HiZKYqi', NULL, 'Kristin De Los Santos', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-01 02:02:23', NULL, 76, '2025-11-01 02:02:24', '2025-11-03 14:16:22'),
(518, 'GraJF03Xg0Z3X5QBFIWu', 'kiRfOKDyVWVbujuWVIdV', NULL, 'X50uDYXJAAjz6wzjBYiA', NULL, 'Karen V Towns', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-11-01 09:09:52', NULL, 76, '2025-11-01 09:09:53', '2025-11-01 09:09:53'),
(519, '6i7cygwn4HdmCMkDfSu8', 'kiRfOKDyVWVbujuWVIdV', NULL, 'T3mj9rh4qOqsWuZLog51', NULL, 'Karis Brewington', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-01 13:08:57', NULL, 76, '2025-11-01 13:09:36', '2025-11-04 19:02:17'),
(520, 'Xwew487KoUXipVCetosh', 'kiRfOKDyVWVbujuWVIdV', NULL, 'AkrVDaOm4OmfILIYLizB', NULL, 'Susan Bucci', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', NULL, NULL, NULL, '2025-11-01 14:26:09', NULL, 76, '2025-11-01 14:26:11', '2025-11-03 15:23:14'),
(521, 'A6hXqELWEOOZ00U92eOQ', 'kiRfOKDyVWVbujuWVIdV', NULL, '2CYR53NsRXN1IYJhzr6h', NULL, 'Theresa Austin', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-01 14:44:14', NULL, 76, '2025-11-01 14:44:16', '2025-11-01 15:09:25'),
(522, 'x3tKcgNHCQli6jpqM0cZ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'taHyTM3Rf1Tzef2XBSu7', NULL, 'Kevin R Sr', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-11-01 15:13:09', NULL, 76, '2025-11-01 15:13:11', '2025-11-01 15:13:11'),
(523, 'v9zeoq5BHyPPnuNyQopV', 'kiRfOKDyVWVbujuWVIdV', NULL, '7kjc0JZlTjEDgyWYORxY', NULL, 'Heath Kindrick', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-01 15:57:43', NULL, 76, '2025-11-01 15:57:44', '2025-11-04 19:02:20'),
(524, 'BKN4LlT7XG3PVLGABqT4', 'kiRfOKDyVWVbujuWVIdV', NULL, 'QR4GRdsnECAjv9mRskdv', NULL, 'Jude Mabu', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-01 19:38:33', NULL, 76, '2025-11-01 19:38:35', '2025-11-03 18:43:54'),
(525, '05VQrI2ZspOQcpCQjGmx', 'kiRfOKDyVWVbujuWVIdV', NULL, 'fCeBUMnznETQ97uiJL6M', NULL, 'Dominick Charobee', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-01 21:21:56', NULL, 76, '2025-11-01 21:21:58', '2025-11-03 14:46:34'),
(526, 'HWkxcefUCxAVA6zOKras', 'kiRfOKDyVWVbujuWVIdV', NULL, 'SJc2erYt4BpSM3HCYxmf', NULL, 'Lisa Monroe', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-01 22:35:04', NULL, 76, '2025-11-01 22:35:07', '2025-11-03 18:43:23'),
(527, 'YjZzZNh2CtRjqmD0CV4y', 'kiRfOKDyVWVbujuWVIdV', NULL, 'VvBXDddpRNSej4b29PLK', NULL, 'Aric Nicholson', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-01 23:51:56', NULL, 76, '2025-11-01 23:51:57', '2025-11-03 15:10:01'),
(528, '8MCVeDeFh2uikx36s6ve', 'kiRfOKDyVWVbujuWVIdV', NULL, 'XrKfGPxTDKK7mDHzc2s4', NULL, 'Michael Mooney', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-02 00:50:22', NULL, 76, '2025-11-02 00:50:24', '2025-11-02 01:16:57'),
(529, 'yVrw9wCM7wNugKLSiuIE', 'kiRfOKDyVWVbujuWVIdV', NULL, 'QzkvDJN0bvJfQ7Q7WEew', NULL, 'Shelley Hebert', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-02 01:21:29', NULL, 76, '2025-11-02 01:21:30', '2025-11-03 15:09:48'),
(530, 'LEPyx8qPrEUuXl4kxq30', 'kiRfOKDyVWVbujuWVIdV', NULL, 'E4bz7GpM3n4h5VmTz1wc', NULL, 'Mary Todd', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-02 03:50:11', NULL, 76, '2025-11-02 03:50:13', '2025-11-02 04:29:49'),
(531, 'pMUN9TijRtYXgCidNrNg', 'kiRfOKDyVWVbujuWVIdV', NULL, 'vjgZaUr3dXsWfPjulMgD', NULL, 'Katie Havenar', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-02 17:22:10', NULL, 76, '2025-11-02 17:22:12', '2025-11-03 15:09:02'),
(532, '5CoHmEDmXy8YawUp3bfO', 'kiRfOKDyVWVbujuWVIdV', NULL, 'pijmUqDyR472FiCDWnqW', NULL, 'Pedro Alvidrez', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-11-03 13:30:58', NULL, 76, '2025-11-03 13:31:04', '2025-11-03 13:31:04'),
(533, 'CsO3xy1hsdTdOsZGLJPQ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'q7RlSKexz8OVZtNYVo1k', NULL, 'Barbara Trouten', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', NULL, NULL, NULL, '2025-11-03 14:14:47', NULL, 76, '2025-11-03 14:15:15', '2025-11-04 14:04:49'),
(534, 'zGH9dPks1We3AwtfQZR7', 'kiRfOKDyVWVbujuWVIdV', NULL, 'uonGiVzAmLP2bb4Iht3x', NULL, 'James Gordonjr', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-11-03 14:52:55', NULL, 76, '2025-11-03 14:52:58', '2025-11-03 14:52:58'),
(535, 'u9Zdnw6rf0h8gRHPgf5G', 'kiRfOKDyVWVbujuWVIdV', NULL, '9WGPYsTnKSymxk5cv9Ii', NULL, 'Julie Johnson', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-03 17:45:34', NULL, 76, '2025-11-03 17:45:36', '2025-11-03 18:40:45'),
(536, 'JsGjPPd8zkKtynjiZu0g', 'kiRfOKDyVWVbujuWVIdV', NULL, 'MEy6nwUH8h5zS55azZQf', NULL, 'Ana Rodriguez Sanchez', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-11-03 19:21:12', NULL, 76, '2025-11-03 19:21:14', '2025-11-03 19:21:14'),
(537, 'MvAqvLvGNPN98xxHkzhK', 'kiRfOKDyVWVbujuWVIdV', NULL, 'hEfITXRfYKQYsEuW4Z21', NULL, 'Matthew Yusko', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', NULL, 'open', NULL, NULL, NULL, '2025-11-03 19:33:43', NULL, 76, '2025-11-03 19:33:45', '2025-11-03 21:01:55'),
(538, 'gzxRoEyTek8VJqlLNF4S', 'kiRfOKDyVWVbujuWVIdV', NULL, 'VIJ8WfurCmxU7Z0tTuY8', NULL, 'Roberta Williams', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-11-03 19:43:36', NULL, 76, '2025-11-03 19:43:38', '2025-11-03 19:43:38'),
(539, 'G5UKw5jSYaLlPOFJrBCQ', 'kiRfOKDyVWVbujuWVIdV', NULL, 'PzTQgdL4M7OUP1vuNc7S', NULL, 'Sharon Akers', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-03 20:36:53', NULL, 76, '2025-11-03 20:36:55', '2025-11-03 20:39:16'),
(540, 'KDYgH5di2pV0hRWfdNAI', 'kiRfOKDyVWVbujuWVIdV', NULL, 'tPvR8pJXNvQprBOqcCbK', NULL, 'Thomas Powell', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-04 13:29:28', NULL, 76, '2025-11-04 13:29:30', '2025-11-04 18:58:17'),
(541, 'AnqtNcmSj9h3jPXEarNl', 'kiRfOKDyVWVbujuWVIdV', NULL, 'kSrZMeDPLmZGbvwdG4EL', NULL, 'Finley Beach', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-04 13:57:29', NULL, 76, '2025-11-04 13:57:31', '2025-11-04 14:00:13'),
(542, 'H7etUlscxNC5wdnoWbFR', 'kiRfOKDyVWVbujuWVIdV', NULL, 'H0B8MfHHSEj32YMBYt9j', NULL, 'Eva Owens', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-11-04 14:42:37', NULL, 76, '2025-11-04 14:42:39', '2025-11-04 14:42:39'),
(543, '7aeY7GWjPghhT3DnNUd2', 'kiRfOKDyVWVbujuWVIdV', NULL, 'LNP7vk36R4Wql4LhHKfi', NULL, 'Adrian Dobbs', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', NULL, 'open', NULL, NULL, NULL, '2025-11-04 15:28:19', NULL, 76, '2025-11-04 15:28:22', '2025-11-04 15:28:22'),
(544, '6ob9u0RAVp4SVwKhEpCt', 'kiRfOKDyVWVbujuWVIdV', NULL, '6ARUkATsxHtybsmkhY0W', NULL, 'Carrie Davis', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-11-04 18:06:34', NULL, 76, '2025-11-04 18:06:44', '2025-11-04 18:06:44'),
(545, 'ri15A0r5GqtnuGqSAlOi', 'kiRfOKDyVWVbujuWVIdV', NULL, '7eZmGzDsW35iNaEK9OcY', NULL, 'Cj Thurston', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', NULL, NULL, NULL, '2025-11-04 18:27:46', NULL, 76, '2025-11-04 18:27:48', '2025-11-04 18:44:22'),
(546, 'h8ROmtRHMnfI7mTpqp2c', 'kiRfOKDyVWVbujuWVIdV', NULL, 'eRfO67UmKrmzEMCIrUpk', NULL, 'Lance Smith', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-04 18:34:40', NULL, 76, '2025-11-04 18:34:42', '2025-11-04 19:05:33'),
(547, 'uFE2nBsGSuvlvP9M4CzL', 'kiRfOKDyVWVbujuWVIdV', NULL, '2X4c2ThOmK5cddjG56f4', NULL, 'Quanetta Clementson', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', NULL, 'open', NULL, NULL, NULL, '2025-11-04 18:39:57', NULL, 76, '2025-11-04 18:39:59', '2025-11-04 18:57:37'),
(548, 'du7nLgkN4hEw1WIWcLsZ', 'kiRfOKDyVWVbujuWVIdV', NULL, '2L3dQoOP9fr1aS3zaHKh', NULL, 'Robin Kerr', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-04 18:52:17', NULL, 76, '2025-11-04 18:52:19', '2025-11-05 14:20:53'),
(549, 't7NuvAqnudcHD870Blax', 'kiRfOKDyVWVbujuWVIdV', NULL, 'zDHUWeq7lpTu4mwGodOq', NULL, 'Petra Williams', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-04 19:09:02', NULL, 76, '2025-11-04 19:09:04', '2025-11-04 19:35:42'),
(550, 'uQSi6JrBGp3ffvHnNvxV', 'kiRfOKDyVWVbujuWVIdV', NULL, 'Apu5MUZFUXdEdWSDrSE9', NULL, 'Toccara Putman', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', NULL, 'open', NULL, NULL, NULL, '2025-11-04 19:09:17', NULL, 76, '2025-11-04 19:09:19', '2025-11-04 19:18:55'),
(551, 'N4mjms7DP39Kp3isLn0f', 'kiRfOKDyVWVbujuWVIdV', NULL, '0Ut3FsxR3euF80RXiJoM', NULL, 'Robert Gray', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-11-04 19:15:27', NULL, 76, '2025-11-04 19:15:29', '2025-11-04 19:15:29'),
(552, 'YBtg5CGctKeMwEFLnKfP', 'kiRfOKDyVWVbujuWVIdV', NULL, 'hjFfKJHPotMUPMUlTnZb', NULL, 'Anthony Schemm', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', NULL, 'open', NULL, NULL, NULL, '2025-11-04 19:19:23', NULL, 76, '2025-11-04 19:19:26', '2025-11-04 19:19:26'),
(553, 'DVJpl7vFa3Uhi55PxGtH', 'kiRfOKDyVWVbujuWVIdV', NULL, 'QDmCxpUPAu2hA7IGQKTi', NULL, 'Larry Mchale', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-04 19:22:52', NULL, 76, '2025-11-04 19:22:54', '2025-11-04 22:57:30'),
(554, 'HlNNJKasTJB6OA154YiI', 'kiRfOKDyVWVbujuWVIdV', NULL, 'q62vmM8qdzF19DooYkw5', NULL, 'Norm Rolf', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', NULL, 'open', NULL, NULL, NULL, '2025-11-04 20:17:28', NULL, 76, '2025-11-04 20:17:31', '2025-11-04 21:35:22');

-- --------------------------------------------------------

--
-- Table structure for table `opportunity_stage_logs`
--

CREATE TABLE `opportunity_stage_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `opportunity_id` varchar(255) NOT NULL,
  `pipeline_id` varchar(255) DEFAULT NULL,
  `stage_id` varchar(255) DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `logged_date` date DEFAULT NULL,
  `opportunity_count` int(11) DEFAULT 0,
  `source` varchar(255) DEFAULT 'webhook',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `opportunity_stage_logs`
--

INSERT INTO `opportunity_stage_logs` (`id`, `opportunity_id`, `pipeline_id`, `stage_id`, `location_id`, `logged_date`, `opportunity_count`, `source`, `created_at`, `updated_at`) VALUES
(1, 'FP86ecCDbFFVsf6lSxL8', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-23', 4, 'webhook', '2025-10-23 22:39:29', '2025-10-23 22:44:00'),
(2, 'F4p1Uiid4y5BYnLcAzDg', 'bKzXACEFizwejXvHRDxo', 'd4a58506-3490-4ed8-8620-48f06365c5bc', 'kiRfOKDyVWVbujuWVIdV', '2025-10-24', 2, 'webhook', '2025-10-24 11:29:07', '2025-10-24 11:29:07'),
(3, 's4nKVMlAmlRQYy266yVG', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-24', 8, 'webhook', '2025-10-24 14:27:51', '2025-10-24 14:58:28'),
(4, 'iiOxhrty8kaon67VwueT', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', 'kiRfOKDyVWVbujuWVIdV', '2025-10-24', 1, 'webhook', '2025-10-24 15:07:27', '2025-10-24 15:07:27'),
(5, 'SJhlKXun8HxVI8qzyIAq', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-24', 3, 'webhook', '2025-10-24 17:58:10', '2025-10-24 17:58:10'),
(7, '2fEIG8QIHeMGWCaIzgHk', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-24', 4, 'webhook', '2025-10-24 19:58:31', '2025-10-24 20:03:35'),
(8, 'mk2RrEyMZXsIs5Y9YeCV', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-25', 4, 'webhook', '2025-10-25 00:21:19', '2025-10-25 00:21:21'),
(9, 'fmwscSQOhkZEVwwDGH4f', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-25', 4, 'webhook', '2025-10-25 17:05:38', '2025-10-25 17:10:53'),
(10, 'kv3ERJxHZEqHxiNE67C4', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-25', 4, 'webhook', '2025-10-25 17:26:05', '2025-10-25 17:31:49'),
(11, 'FP86ecCDbFFVsf6lSxL8', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'kiRfOKDyVWVbujuWVIdV', '2025-10-25', 3, 'webhook', '2025-10-25 17:45:28', '2025-10-25 17:45:29'),
(12, 'hTgIjqmqkRvrFl2PNqdr', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-25', 5, 'webhook', '2025-10-25 19:03:08', '2025-10-25 19:08:11'),
(13, 'IPG7jOVJeS3I5jLyrrNA', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-25', 4, 'webhook', '2025-10-25 20:09:27', '2025-10-25 20:14:29'),
(14, 'rTFCM7x7HNgnnoWBajNM', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-26', 2, 'webhook', '2025-10-26 13:08:36', '2025-10-26 13:08:37'),
(15, 'REEKdMr3Ns8R1kiz9oJx', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-26', 4, 'webhook', '2025-10-26 13:09:08', '2025-10-26 13:13:20'),
(16, '7yp9fanaEz3WivCWXKGf', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-26', 4, 'webhook', '2025-10-26 18:39:29', '2025-10-26 18:44:31'),
(17, 'Aq8YwcKCzrxmZvMhIzCp', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-27', 11, 'webhook', '2025-10-27 12:55:52', '2025-10-27 13:17:48'),
(18, 'Wmj4QDVx3hVL8v6lv2HE', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-27', 4, 'webhook', '2025-10-27 12:57:42', '2025-10-27 12:57:45'),
(19, 'FP86ecCDbFFVsf6lSxL8', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-27', 4, 'webhook', '2025-10-27 13:03:25', '2025-10-27 13:13:45'),
(20, 'oVvmCD0VRke2E06h2VeQ', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-27', 4, 'webhook', '2025-10-27 13:04:50', '2025-10-27 13:13:55'),
(21, 'PYlrxwXeCICuTLt6u1rN', 'bKzXACEFizwejXvHRDxo', 'ec794e72-1a29-44ea-8b1b-d3c21d6ada6b', 'kiRfOKDyVWVbujuWVIdV', '2025-10-27', 2, 'webhook', '2025-10-27 14:00:13', '2025-10-27 14:00:13'),
(22, 'SQfqUfIJHmnNcXQTvhb2', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', 'kiRfOKDyVWVbujuWVIdV', '2025-10-27', 3, 'webhook', '2025-10-27 14:18:06', '2025-10-27 15:33:57'),
(23, 'C6GlosWPNTbiG2IYTI6b', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-27', 2, 'webhook', '2025-10-27 17:02:51', '2025-10-27 17:02:53'),
(24, 's9Exy1J7XsqLH6NaYa0V', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', 'kiRfOKDyVWVbujuWVIdV', '2025-10-27', 1, 'webhook', '2025-10-27 17:02:58', '2025-10-27 17:02:58'),
(25, 'oC0MKduFjTMW2bS4wZ06', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-27', 2, 'webhook', '2025-10-27 17:59:37', '2025-10-27 17:59:37'),
(26, 'tD6D1j8QnxrHrKVDAfqm', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-27', 4, 'webhook', '2025-10-27 19:21:21', '2025-10-27 19:21:23'),
(27, 's4nKVMlAmlRQYy266yVG', 'WRGbvJVUqUccggy5ZqF2', 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 6, 'webhook', '2025-10-28 02:50:32', '2025-10-28 02:55:34'),
(28, 'rTFCM7x7HNgnnoWBajNM', 'WRGbvJVUqUccggy5ZqF2', 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 6, 'webhook', '2025-10-28 02:50:33', '2025-10-28 02:55:37'),
(29, '20QyB2dezbJPpjGCfQXy', 'WRGbvJVUqUccggy5ZqF2', 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 8, 'webhook', '2025-10-28 02:50:36', '2025-10-28 19:24:02'),
(30, 'fR8Sz5saFWMHa9lzU7nZ', 'WRGbvJVUqUccggy5ZqF2', 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 6, 'webhook', '2025-10-28 02:50:39', '2025-10-28 02:55:42'),
(31, 'laAAGHMs5fR0iZvBhOlQ', 'nl32t7MUfkhrOZN4sNeT', '4c73710f-edb2-4d7a-8403-56d1a0edd9e4', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 1, 'webhook', '2025-10-28 02:51:39', '2025-10-28 02:51:39'),
(32, 'AoQcGDwkd2Dta80i3OAA', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 4, 'webhook', '2025-10-28 12:56:06', '2025-10-28 12:56:09'),
(33, 'W9FfhdYeMoZcR5tpowsx', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 10, 'webhook', '2025-10-28 13:18:29', '2025-10-28 13:45:52'),
(34, 'h68aVSxfUGofC6d7I1ns', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 4, 'webhook', '2025-10-28 13:27:03', '2025-10-28 13:27:05'),
(35, 'wcxuVmqN0XyRTuWjET2H', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 2, 'webhook', '2025-10-28 14:02:57', '2025-10-28 14:02:58'),
(36, 'WAtOSIc0UcNTmfglZUpB', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 1, 'webhook', '2025-10-28 17:24:25', '2025-10-28 17:24:25'),
(37, 's9Exy1J7XsqLH6NaYa0V', 'bKzXACEFizwejXvHRDxo', '751a24be-4e11-426f-8cf5-180ea573bbbf', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 1, 'webhook', '2025-10-28 17:25:26', '2025-10-28 17:25:26'),
(38, 'dVbG3fS132ZiLtSo6lb0', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-28', 4, 'webhook', '2025-10-28 23:42:20', '2025-10-28 23:42:22'),
(39, 'zAildDout3tQ5y3wkqQd', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 2, 'webhook', '2025-10-29 12:33:28', '2025-10-29 12:33:29'),
(40, '0IVqFnK1TwEivHbVMFQz', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 4, 'webhook', '2025-10-29 12:43:51', '2025-10-29 12:44:00'),
(41, 'e6VfX8PYx7j1Lu3WkHgi', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 5, 'webhook', '2025-10-29 13:06:58', '2025-10-29 13:08:41'),
(42, 'P94gxoEJzr3lt5CQBKNk', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 4, 'webhook', '2025-10-29 13:07:46', '2025-10-29 13:08:17'),
(43, 'SQfqUfIJHmnNcXQTvhb2', 'bKzXACEFizwejXvHRDxo', '6a58fbde-5f3a-49b3-854c-2f16b6d066b2', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 1, 'webhook', '2025-10-29 13:08:35', '2025-10-29 13:08:35'),
(44, 'fj9OhF2tIj9HOJRXJ5B9', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 2, 'webhook', '2025-10-29 13:12:49', '2025-10-29 13:12:51'),
(45, 'ABsnSa2OMOKP7k6e9AGl', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 7, 'webhook', '2025-10-29 13:59:52', '2025-10-29 14:08:26'),
(46, 'fYbytHObWAtuwsNx47A7', 'WRGbvJVUqUccggy5ZqF2', 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 4, 'webhook', '2025-10-29 16:58:13', '2025-10-29 16:58:15'),
(47, 'QJc8SDElvOeQmP8psIQM', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 2, 'webhook', '2025-10-29 18:30:21', '2025-10-29 18:30:23'),
(48, 'qHs8E30Fl6tHGnDr1gHi', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 4, 'webhook', '2025-10-29 19:35:50', '2025-10-29 19:35:52'),
(49, 'LQ3PiBKWnGHpwsRn8KeG', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 2, 'webhook', '2025-10-29 19:41:19', '2025-10-29 19:41:20'),
(50, 'QsXIKFz7dkPCg84RtSRR', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-29', 4, 'webhook', '2025-10-29 20:15:05', '2025-10-29 20:15:09'),
(51, '5oCsyiS26eVjiJqyikaj', 'bKzXACEFizwejXvHRDxo', '6a58fbde-5f3a-49b3-854c-2f16b6d066b2', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 1, 'webhook', '2025-10-30 13:05:05', '2025-10-30 13:05:05'),
(52, 'mk2RrEyMZXsIs5Y9YeCV', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 2, 'webhook', '2025-10-30 13:08:35', '2025-10-30 13:08:35'),
(53, 'ViN2pu2BV25GBQQGr7TF', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 15, 'webhook', '2025-10-30 13:54:51', '2025-10-30 14:24:09'),
(54, 'Wmj4QDVx3hVL8v6lv2HE', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 4, 'webhook', '2025-10-30 14:16:31', '2025-10-30 14:21:36'),
(55, 'MegPzhT3922tdtcnIOVn', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 4, 'webhook', '2025-10-30 15:44:44', '2025-10-30 15:44:46'),
(56, 'UZmDBcFh1YIPBOYUGl2D', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 17, 'webhook', '2025-10-30 17:20:08', '2025-10-30 20:27:47'),
(57, 'tD6D1j8QnxrHrKVDAfqm', 'WRGbvJVUqUccggy5ZqF2', '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 6, 'webhook', '2025-10-30 17:48:01', '2025-10-30 20:43:43'),
(58, 'sbo309AMWVFNHJ54jNOU', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 2, 'webhook', '2025-10-30 18:15:37', '2025-10-30 18:15:38'),
(59, '8Me2DKBYpECarWspVHGP', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 9, 'webhook', '2025-10-30 19:35:41', '2025-10-30 20:59:16'),
(60, 'Gto7ZJtqwJiRRL6YfXMO', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 4, 'webhook', '2025-10-30 19:56:57', '2025-10-30 19:56:59'),
(61, 'AoQcGDwkd2Dta80i3OAA', 'WRGbvJVUqUccggy5ZqF2', '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 2, 'webhook', '2025-10-30 20:23:04', '2025-10-30 20:23:04'),
(62, '9Z2qiu7GkPdusKfOfMUt', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 4, 'webhook', '2025-10-30 22:21:47', '2025-10-30 22:21:49'),
(63, '7cOpUVeNjW5E5mAaneEu', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-30', 2, 'webhook', '2025-10-30 23:27:35', '2025-10-30 23:27:36'),
(64, 'd9Pg16pDbbF7qhynEve8', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 4, 'webhook', '2025-10-31 03:18:30', '2025-10-31 03:18:32'),
(65, 'TCf3Q5Gm8ZtG2ClII6ok', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 14, 'webhook', '2025-10-31 04:08:02', '2025-10-31 18:28:35'),
(66, 'pKNW1FXj7CTGj1i2iU7I', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 4, 'webhook', '2025-10-31 04:14:27', '2025-10-31 04:14:29'),
(67, 'TYCEmLJZnQBR52HzkjMn', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 4, 'webhook', '2025-10-31 04:18:52', '2025-10-31 04:18:53'),
(68, '37jTnw6oeqmg14eGpVT3', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 4, 'webhook', '2025-10-31 04:34:47', '2025-10-31 04:34:50'),
(69, '7lnhxodcQMokRSbSSIJ8', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 1, 'webhook', '2025-10-31 04:34:48', '2025-10-31 04:34:48'),
(70, 'DBL0vqmXJu9JaUyyxdVF', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 11, 'webhook', '2025-10-31 08:39:14', '2025-10-31 13:58:48'),
(71, 'rG9xGAj4v84wgVmF7Rnx', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 6, 'webhook', '2025-10-31 09:27:19', '2025-10-31 09:45:48'),
(72, 'AoQcGDwkd2Dta80i3OAA', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 4, 'webhook', '2025-10-31 14:13:32', '2025-10-31 14:18:36'),
(73, 'h68aVSxfUGofC6d7I1ns', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 2, 'webhook', '2025-10-31 14:50:33', '2025-10-31 14:50:34'),
(74, 'LZkIabgsQdWPXM69KxF6', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 11, 'webhook', '2025-10-31 16:55:51', '2025-10-31 18:28:32'),
(75, 'N72pvX64EanFgQyrnJWm', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 11, 'webhook', '2025-10-31 16:56:13', '2025-10-31 19:56:42'),
(76, 'jdIWVbb6sTRZy7D44UZi', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 11, 'webhook', '2025-10-31 17:04:24', '2025-10-31 18:23:23'),
(77, 'oiU3FIgZ7hkLdO8xqjx2', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 2, 'webhook', '2025-10-31 18:05:43', '2025-10-31 18:05:43'),
(78, '0JDkaZC6MCRtbh2FDOvQ', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 12, 'webhook', '2025-10-31 18:19:43', '2025-10-31 18:28:41'),
(79, '8Me2DKBYpECarWspVHGP', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 4, 'webhook', '2025-10-31 18:23:35', '2025-10-31 18:28:39'),
(80, 'gc4s7UeBNZw4SZam0C3Y', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 4, 'webhook', '2025-10-31 18:29:42', '2025-10-31 18:29:48'),
(81, 'P0tQbtz6Xj1Kn0Dq912D', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 5, 'webhook', '2025-10-31 18:37:57', '2025-10-31 18:38:01'),
(82, 'Dcb8wy6zF7jvuaKOiC6x', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 4, 'webhook', '2025-10-31 19:20:49', '2025-10-31 19:20:51'),
(83, '0B2MLcjOScHk5V2nUnLU', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 11, 'webhook', '2025-10-31 19:31:18', '2025-10-31 20:06:04'),
(84, 'LdHYUTRuhndeSjtUNoDw', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 7, 'webhook', '2025-10-31 19:57:30', '2025-10-31 20:02:47'),
(85, 'YkdKmKJdqlNdkmeIKYh0', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 12, 'webhook', '2025-10-31 20:46:30', '2025-10-31 20:55:46'),
(86, '7l2vxzrJo93IwzrN4MDz', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 7, 'webhook', '2025-10-31 21:00:45', '2025-10-31 21:04:03'),
(87, 'IUK2dSDRLLhMnidcIVAl', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 4, 'webhook', '2025-10-31 22:27:48', '2025-10-31 22:27:51'),
(88, '8orrvCLlL4K1xVgGKYi2', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 4, 'webhook', '2025-10-31 22:29:00', '2025-10-31 22:29:02'),
(89, 'mk6B6BRoqRHBBpNZEI8a', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-10-31', 2, 'webhook', '2025-10-31 22:57:42', '2025-10-31 22:57:43'),
(90, 'RxaeDtsO2pSXbmoMGDEm', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 2, 'webhook', '2025-11-01 00:04:12', '2025-11-01 00:04:14'),
(91, 'EdCXgrDyjbXaVwzhMFjI', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 7, 'webhook', '2025-11-01 00:17:41', '2025-11-01 00:20:13'),
(92, '7x2BQ5MCQhHwogqcaZDO', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 2, 'webhook', '2025-11-01 01:19:39', '2025-11-01 01:19:40'),
(93, '1mo1joh718oWnL04Ilaw', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 6, 'webhook', '2025-11-01 01:30:24', '2025-11-01 01:48:42'),
(94, '1HrgBgyCDGy2OE4myhga', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 4, 'webhook', '2025-11-01 02:02:24', '2025-11-01 02:02:27'),
(95, 'GraJF03Xg0Z3X5QBFIWu', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 4, 'webhook', '2025-11-01 09:09:53', '2025-11-01 09:09:55'),
(96, '6i7cygwn4HdmCMkDfSu8', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 7, 'webhook', '2025-11-01 13:09:36', '2025-11-01 14:11:17'),
(97, 'dVbG3fS132ZiLtSo6lb0', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 4, 'webhook', '2025-11-01 13:10:07', '2025-11-01 13:17:04'),
(98, 'pKNW1FXj7CTGj1i2iU7I', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 3, 'webhook', '2025-11-01 13:13:55', '2025-11-01 13:14:24'),
(99, '0IVqFnK1TwEivHbVMFQz', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 4, 'webhook', '2025-11-01 14:09:38', '2025-11-01 14:15:38'),
(100, '9Z2qiu7GkPdusKfOfMUt', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 3, 'webhook', '2025-11-01 14:18:58', '2025-11-01 14:19:00'),
(101, 'P94gxoEJzr3lt5CQBKNk', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 5, 'webhook', '2025-11-01 14:23:42', '2025-11-01 14:28:45'),
(102, 'e6VfX8PYx7j1Lu3WkHgi', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 5, 'webhook', '2025-11-01 14:24:04', '2025-11-01 14:29:08'),
(103, 'oiU3FIgZ7hkLdO8xqjx2', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 1, 'webhook', '2025-11-01 14:26:11', '2025-11-01 14:26:11'),
(104, 'Xwew487KoUXipVCetosh', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 6, 'webhook', '2025-11-01 14:26:11', '2025-11-01 14:44:07'),
(105, 'A6hXqELWEOOZ00U92eOQ', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 6, 'webhook', '2025-11-01 14:44:16', '2025-11-01 15:09:25'),
(106, 'x3tKcgNHCQli6jpqM0cZ', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 4, 'webhook', '2025-11-01 15:13:11', '2025-11-01 15:13:13'),
(107, 'v9zeoq5BHyPPnuNyQopV', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 7, 'webhook', '2025-11-01 15:57:44', '2025-11-01 16:00:33'),
(108, 'BKN4LlT7XG3PVLGABqT4', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 6, 'webhook', '2025-11-01 19:38:35', '2025-11-01 19:58:56'),
(109, 'qHs8E30Fl6tHGnDr1gHi', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 4, 'webhook', '2025-11-01 20:53:00', '2025-11-01 20:58:02'),
(110, '05VQrI2ZspOQcpCQjGmx', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 7, 'webhook', '2025-11-01 21:21:58', '2025-11-01 21:25:46'),
(111, 'HWkxcefUCxAVA6zOKras', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 7, 'webhook', '2025-11-01 22:35:07', '2025-11-01 22:38:03'),
(112, 'YjZzZNh2CtRjqmD0CV4y', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-01', 7, 'webhook', '2025-11-01 23:51:57', '2025-11-01 23:54:23'),
(113, '8MCVeDeFh2uikx36s6ve', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-02', 6, 'webhook', '2025-11-02 00:50:24', '2025-11-02 01:16:57'),
(114, 'yVrw9wCM7wNugKLSiuIE', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-02', 6, 'webhook', '2025-11-02 01:21:30', '2025-11-02 01:47:51'),
(115, 'xEmvXExjOcr6nQbuWZqi', 'bKzXACEFizwejXvHRDxo', '6a58fbde-5f3a-49b3-854c-2f16b6d066b2', 'kiRfOKDyVWVbujuWVIdV', '2025-11-02', 1, 'webhook', '2025-11-02 03:50:12', '2025-11-02 03:50:12'),
(116, 'LEPyx8qPrEUuXl4kxq30', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-02', 6, 'webhook', '2025-11-02 03:50:13', '2025-11-02 04:29:49'),
(117, 'QsXIKFz7dkPCg84RtSRR', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-02', 4, 'webhook', '2025-11-02 14:09:22', '2025-11-02 14:15:39'),
(118, 'pMUN9TijRtYXgCidNrNg', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-02', 8, 'webhook', '2025-11-02 17:22:12', '2025-11-02 17:25:07'),
(119, 'MegPzhT3922tdtcnIOVn', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-02', 4, 'webhook', '2025-11-02 18:04:56', '2025-11-02 18:09:51'),
(120, '5CoHmEDmXy8YawUp3bfO', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 13:31:04', '2025-11-03 13:31:07'),
(121, 'pKNW1FXj7CTGj1i2iU7I', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 14:05:55', '2025-11-03 14:13:34'),
(122, '37jTnw6oeqmg14eGpVT3', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 2, 'webhook', '2025-11-03 14:12:26', '2025-11-03 14:12:26'),
(123, 'Gto7ZJtqwJiRRL6YfXMO', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 5, 'webhook', '2025-11-03 14:12:47', '2025-11-03 14:16:57'),
(124, 'd9Pg16pDbbF7qhynEve8', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 2, 'webhook', '2025-11-03 14:12:48', '2025-11-03 14:12:48'),
(125, 'TYCEmLJZnQBR52HzkjMn', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 14:13:08', '2025-11-03 14:17:26'),
(126, 'CsO3xy1hsdTdOsZGLJPQ', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 7, 'webhook', '2025-11-03 14:15:15', '2025-11-03 14:26:16'),
(127, '1HrgBgyCDGy2OE4myhga', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 3, 'webhook', '2025-11-03 14:16:22', '2025-11-03 14:16:29'),
(128, '7l2vxzrJo93IwzrN4MDz', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 14:41:26', '2025-11-03 14:46:30'),
(129, '05VQrI2ZspOQcpCQjGmx', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 14:41:33', '2025-11-03 14:46:34'),
(130, 'zGH9dPks1We3AwtfQZR7', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 14:52:58', '2025-11-03 14:53:00'),
(131, 'pMUN9TijRtYXgCidNrNg', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 15:00:15', '2025-11-03 15:09:02'),
(132, 'YjZzZNh2CtRjqmD0CV4y', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 5, 'webhook', '2025-11-03 15:01:28', '2025-11-03 15:10:01'),
(133, 'yVrw9wCM7wNugKLSiuIE', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 15:01:33', '2025-11-03 15:09:48'),
(134, 'Xwew487KoUXipVCetosh', 'WRGbvJVUqUccggy5ZqF2', 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 15:23:13', '2025-11-03 15:23:14'),
(135, 'u9Zdnw6rf0h8gRHPgf5G', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 11, 'webhook', '2025-11-03 17:45:36', '2025-11-03 18:40:45'),
(136, 'HWkxcefUCxAVA6zOKras', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 18:38:19', '2025-11-03 18:43:23'),
(137, 'BKN4LlT7XG3PVLGABqT4', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 18:38:49', '2025-11-03 18:43:54'),
(138, 'JsGjPPd8zkKtynjiZu0g', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 19:21:14', '2025-11-03 19:21:19'),
(139, 'MvAqvLvGNPN98xxHkzhK', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 9, 'webhook', '2025-11-03 19:33:45', '2025-11-03 21:01:55'),
(140, 'gzxRoEyTek8VJqlLNF4S', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 2, 'webhook', '2025-11-03 19:43:38', '2025-11-03 19:43:39'),
(141, 'G5UKw5jSYaLlPOFJrBCQ', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 7, 'webhook', '2025-11-03 20:36:55', '2025-11-03 20:39:18'),
(142, 'gc4s7UeBNZw4SZam0C3Y', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 20:47:13', '2025-11-03 20:52:15'),
(143, 'P0tQbtz6Xj1Kn0Dq912D', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 20:55:04', '2025-11-03 21:02:38'),
(144, 'Dcb8wy6zF7jvuaKOiC6x', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-03', 4, 'webhook', '2025-11-03 21:38:06', '2025-11-03 21:43:07'),
(145, 'KDYgH5di2pV0hRWfdNAI', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 11, 'webhook', '2025-11-04 13:29:30', '2025-11-04 18:58:17'),
(146, 'AnqtNcmSj9h3jPXEarNl', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 7, 'webhook', '2025-11-04 13:57:31', '2025-11-04 14:00:14'),
(147, 'CsO3xy1hsdTdOsZGLJPQ', 'WRGbvJVUqUccggy5ZqF2', 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 4, 'webhook', '2025-11-04 14:04:39', '2025-11-04 14:04:49'),
(148, 'H7etUlscxNC5wdnoWbFR', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 4, 'webhook', '2025-11-04 14:42:39', '2025-11-04 14:42:41'),
(149, '7aeY7GWjPghhT3DnNUd2', 'nl32t7MUfkhrOZN4sNeT', '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 2, 'webhook', '2025-11-04 15:28:22', '2025-11-04 15:28:23'),
(150, '6ob9u0RAVp4SVwKhEpCt', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 4, 'webhook', '2025-11-04 18:06:44', '2025-11-04 18:07:07'),
(151, 'ri15A0r5GqtnuGqSAlOi', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 11, 'webhook', '2025-11-04 18:27:48', '2025-11-04 18:44:22'),
(152, 'h8ROmtRHMnfI7mTpqp2c', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 7, 'webhook', '2025-11-04 18:34:42', '2025-11-04 19:05:34'),
(153, 'uFE2nBsGSuvlvP9M4CzL', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 11, 'webhook', '2025-11-04 18:39:59', '2025-11-04 18:57:37'),
(154, 'du7nLgkN4hEw1WIWcLsZ', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 4, 'webhook', '2025-11-04 18:52:19', '2025-11-04 18:52:21'),
(155, 'v9zeoq5BHyPPnuNyQopV', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 4, 'webhook', '2025-11-04 18:55:58', '2025-11-04 19:02:20'),
(156, '6i7cygwn4HdmCMkDfSu8', 'WRGbvJVUqUccggy5ZqF2', '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 4, 'webhook', '2025-11-04 18:56:15', '2025-11-04 19:02:17'),
(157, 'Xqoo6zAnDoRDrJadW5kL', 'bKzXACEFizwejXvHRDxo', 'ec794e72-1a29-44ea-8b1b-d3c21d6ada6b', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 1, 'webhook', '2025-11-04 19:09:03', '2025-11-04 19:09:03'),
(158, 't7NuvAqnudcHD870Blax', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 6, 'webhook', '2025-11-04 19:09:04', '2025-11-04 19:35:42'),
(159, 'uQSi6JrBGp3ffvHnNvxV', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 11, 'webhook', '2025-11-04 19:09:19', '2025-11-04 19:18:55'),
(160, 'N4mjms7DP39Kp3isLn0f', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 4, 'webhook', '2025-11-04 19:15:29', '2025-11-04 19:15:34'),
(161, 'YBtg5CGctKeMwEFLnKfP', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 4, 'webhook', '2025-11-04 19:19:26', '2025-11-04 19:19:28'),
(162, 'DVJpl7vFa3Uhi55PxGtH', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 8, 'webhook', '2025-11-04 19:22:54', '2025-11-04 22:57:32'),
(163, 'HlNNJKasTJB6OA154YiI', 'WRGbvJVUqUccggy5ZqF2', '1f2449f4-df33-4c88-8dec-a2631df0224d', 'kiRfOKDyVWVbujuWVIdV', '2025-11-04', 7, 'webhook', '2025-11-04 20:17:31', '2025-11-04 21:35:24'),
(164, 'VjhOPEORnDCyAFGuqlWJ', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kiRfOKDyVWVbujuWVIdV', '2025-11-05', 2, 'webhook', '2025-11-05 00:55:05', '2025-11-05 00:55:05'),
(165, 'KVXY7NufoMZrqEF1GqMX', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kiRfOKDyVWVbujuWVIdV', '2025-11-05', 3, 'webhook', '2025-11-05 00:55:06', '2025-11-05 00:55:07'),
(166, 'TxR6AOuTFD0nSpsREcMN', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kiRfOKDyVWVbujuWVIdV', '2025-11-05', 2, 'webhook', '2025-11-05 00:55:07', '2025-11-05 00:55:07'),
(167, 'voAtxqB1Wt2wqYlMQo6X', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kiRfOKDyVWVbujuWVIdV', '2025-11-05', 2, 'webhook', '2025-11-05 00:55:09', '2025-11-05 00:55:09'),
(168, '78qpGnPyHo1boskcPGmB', 'kaxdiIP8PvvJDHLAZiXB', '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kiRfOKDyVWVbujuWVIdV', '2025-11-05', 2, 'webhook', '2025-11-05 00:55:15', '2025-11-05 00:55:15'),
(169, 'du7nLgkN4hEw1WIWcLsZ', 'WRGbvJVUqUccggy5ZqF2', '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'kiRfOKDyVWVbujuWVIdV', '2025-11-05', 3, 'webhook', '2025-11-05 14:20:53', '2025-11-05 14:20:56');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pipelines`
--

CREATE TABLE `pipelines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pipeline_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pipelines`
--

INSERT INTO `pipelines` (`id`, `location_id`, `name`, `pipeline_id`, `created_at`, `updated_at`) VALUES
(46, 'kiRfOKDyVWVbujuWVIdV', '0. DISQUALIFIED LEADS (Remonetize)', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(47, 'kiRfOKDyVWVbujuWVIdV', '1. Lead Intake', 'WRGbvJVUqUccggy5ZqF2', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(48, 'kiRfOKDyVWVbujuWVIdV', '2. Lead Intake Follow Up (Low Priority)', 'nl32t7MUfkhrOZN4sNeT', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(49, 'kiRfOKDyVWVbujuWVIdV', '3. Acquisitions', 'bKzXACEFizwejXvHRDxo', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(50, 'kiRfOKDyVWVbujuWVIdV', '4. Acquisition Follow Ups', '2IXaqf5qnyJuEKZ9fX5X', '2025-10-21 21:56:31', '2025-10-21 21:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `pipeline_stages`
--

CREATE TABLE `pipeline_stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pipeline_id` bigint(20) UNSIGNED DEFAULT NULL,
  `pipeline_stage_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pipeline_stages`
--

INSERT INTO `pipeline_stages` (`id`, `location_id`, `position`, `name`, `pipeline_id`, `pipeline_stage_id`, `created_at`, `updated_at`) VALUES
(204, 'kiRfOKDyVWVbujuWVIdV', '0', 'Disqualified', 46, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(205, 'kiRfOKDyVWVbujuWVIdV', '1', 'Contacted', 46, '552cbead-4b3b-43da-b0ed-4404a59acf60', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(206, 'kiRfOKDyVWVbujuWVIdV', '2', 'Proposal Sent', 46, 'ce781f12-aacc-415a-8f63-d0aee1137164', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(207, 'kiRfOKDyVWVbujuWVIdV', '3', 'Closed', 46, '20d216b7-d04c-454f-ab47-955510abc598', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(208, 'kiRfOKDyVWVbujuWVIdV', '5', 'Disqualified', 47, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', '2025-10-21 21:56:31', '2025-10-29 17:47:04'),
(209, 'kiRfOKDyVWVbujuWVIdV', '4', 'Low Priority', 47, 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', '2025-10-21 21:56:31', '2025-10-29 17:47:04'),
(210, 'kiRfOKDyVWVbujuWVIdV', '1', 'New Lead', 47, '1f2449f4-df33-4c88-8dec-a2631df0224d', '2025-10-21 21:56:31', '2025-10-29 17:47:04'),
(211, 'kiRfOKDyVWVbujuWVIdV', '2', 'Lead Responded', 47, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', '2025-10-21 21:56:31', '2025-10-29 17:47:04'),
(212, 'kiRfOKDyVWVbujuWVIdV', '3', 'Qualified - NEEDS CALL', 47, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', '2025-10-21 21:56:31', '2025-10-29 17:47:04'),
(213, 'kiRfOKDyVWVbujuWVIdV', '0', 'Disqualified', 48, '4c73710f-edb2-4d7a-8403-56d1a0edd9e4', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(214, 'kiRfOKDyVWVbujuWVIdV', '1', 'Low Quality/Needs Nurturing', 48, '0da3f05b-d809-40b5-8f83-71913fc96dd1', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(215, 'kiRfOKDyVWVbujuWVIdV', '2', 'Responded To Message', 48, 'bc5d70d4-d05c-4e4e-9180-3b29288bb1f5', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(216, 'kiRfOKDyVWVbujuWVIdV', '3', 'Call Scheduled', 48, '81a4711b-bb97-4c2d-b15a-9007bdf7c782', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(217, 'kiRfOKDyVWVbujuWVIdV', '4', 'Call Now', 48, 'e20c1d42-43de-4546-b9bf-6ca141e64858', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(218, 'kiRfOKDyVWVbujuWVIdV', '0', 'Disqualified', 49, 'ec794e72-1a29-44ea-8b1b-d3c21d6ada6b', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(219, 'kiRfOKDyVWVbujuWVIdV', '1', 'CALL NOW', 49, 'c5ba7de4-b5da-4357-aa0b-fb283eebfc1a', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(220, 'kiRfOKDyVWVbujuWVIdV', '2', 'Call Scheduled', 49, '751a24be-4e11-426f-8cf5-180ea573bbbf', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(221, 'kiRfOKDyVWVbujuWVIdV', '3', 'Warm Lead - Needs Follow Up', 49, '6a58fbde-5f3a-49b3-854c-2f16b6d066b2', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(222, 'kiRfOKDyVWVbujuWVIdV', '4', 'Warm Lead - Follow Up Scheduled', 49, 'd6cd617b-70b2-45c4-b4bf-50a623649ac4', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(223, 'kiRfOKDyVWVbujuWVIdV', '5', 'Contract Sent (Awaiting Signature)', 49, 'd4a58506-3490-4ed8-8620-48f06365c5bc', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(224, 'kiRfOKDyVWVbujuWVIdV', '6', 'Contract Signed & Sent', 49, '11d51f7a-6afe-4a89-9dc6-3a806588cbd0', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(225, 'kiRfOKDyVWVbujuWVIdV', '0', 'New Lead', 50, '891da887-616c-4b8c-8d4c-3ff20d728cff', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(226, 'kiRfOKDyVWVbujuWVIdV', '1', 'Contacted', 50, 'ea536353-bf0d-4186-9ac0-f05bf08c4b3b', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(227, 'kiRfOKDyVWVbujuWVIdV', '2', 'Proposal Sent', 50, 'b10c52c0-e25f-4751-94e6-301d2b03d34a', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(228, 'kiRfOKDyVWVbujuWVIdV', '3', 'Closed', 50, '62d14ca5-16d1-42ed-8ada-2dca8af7a5ca', '2025-10-21 21:56:31', '2025-10-21 21:56:31'),
(229, 'kiRfOKDyVWVbujuWVIdV', '0', 'No Response', 47, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', '2025-10-29 17:47:04', '2025-10-29 17:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `rename_menus`
--

CREATE TABLE `rename_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `old_menu` varchar(255) NOT NULL,
  `renamed_menu` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

CREATE TABLE `responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` varchar(200) DEFAULT NULL,
  `assigned_user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `first_response` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
('qC7mRsXt9GkWe5jCMd4zXSJgSrLzjV8DkVqVBVe0', 76, '182.177.15.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMFY0aWEyWVNLd3QyOTFhbWR3ZTY1Z25uSUJIN1JQVjF3empBSHZ6NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHBzOi8vbGlnaHRzYWxtb24tYm9hci02NzM2MzYuaG9zdGluZ2Vyc2l0ZS5jb20vYWRtaW4vb3Bwb3J0dW5pdGllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjc2O3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTc2MjE4MjEyMzt9czoxMToic3VwZXJfYWRtaW4iO086MTU6IkFwcFxNb2RlbHNcVXNlciI6MzY6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6NToidXNlcnMiO3M6MTM6IgAqAHByaW1hcnlLZXkiO3M6MjoiaWQiO3M6MTA6IgAqAGtleVR5cGUiO3M6MzoiaW50IjtzOjEyOiJpbmNyZW1lbnRpbmciO2I6MTtzOjc6IgAqAHdpdGgiO2E6MDp7fXM6MTI6IgAqAHdpdGhDb3VudCI7YTowOnt9czoxOToicHJldmVudHNMYXp5TG9hZGluZyI7YjowO3M6MTA6IgAqAHBlclBhZ2UiO2k6MTU7czo2OiJleGlzdHMiO2I6MTtzOjE4OiJ3YXNSZWNlbnRseUNyZWF0ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToxNTp7czoyOiJpZCI7aTo3NTtzOjQ6Im5hbWUiO3M6NToiQWRtaW4iO3M6NToiZW1haWwiO3M6MjA6InN1cGVyYWRtaW5AZ21haWwuY29tIjtzOjE3OiJlbWFpbF92ZXJpZmllZF9hdCI7TjtzOjg6InBhc3N3b3JkIjtzOjYwOiIkMnkkMTIkUHgyLmc3ckxKQUZsL2FNN0E4LzVIdWtpZzVNa3J0Tk5mS3dUWXZ4OVFycVhDMElhbzFmck8iO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtzOjYwOiJaSGh6alhaYjJZNnJzeXdJazFhV3FOcXhacDMyNDVKcXplUTRZNHVKZ2Raak82dUhMUWJmbDRxQ1Z1VjEiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDgtMjggMTg6MDU6MTMiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDgtMjggMTg6MDU6MTMiO3M6MTE6ImdobF9hcGlfa2V5IjtOO3M6NDoicm9sZSI7aToxO3M6Njoic3RhdHVzIjtpOjE7czo1OiJpbWFnZSI7TjtzOjg6ImFkZGVkX2J5IjtOO3M6MTE6ImxvY2F0aW9uX2lkIjtzOjIwOiI4Z203cTlyUjhNMWRjbTlrTXNpcSI7czoxMToiYXNzaWduZWRfdG8iO047fXM6MTE6IgAqAG9yaWdpbmFsIjthOjE1OntzOjI6ImlkIjtpOjc1O3M6NDoibmFtZSI7czo1OiJBZG1pbiI7czo1OiJlbWFpbCI7czoyMDoic3VwZXJhZG1pbkBnbWFpbC5jb20iO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMiRQeDIuZzdyTEpBRmwvYU03QTgvNUh1a2lnNU1rcnROTmZLd1RZdng5UXJxWEMwSWFvMWZyTyI7czoxNDoicmVtZW1iZXJfdG9rZW4iO3M6NjA6IlpIaHpqWFpiMlk2cnN5d0lrMWFXcU5xeFpwMzI0NUpxemVRNFk0dUpnZFpqTzZ1SExRYmZsNHFDVnVWMSI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wOC0yOCAxODowNToxMyI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wOC0yOCAxODowNToxMyI7czoxMToiZ2hsX2FwaV9rZXkiO047czo0OiJyb2xlIjtpOjE7czo2OiJzdGF0dXMiO2k6MTtzOjU6ImltYWdlIjtOO3M6ODoiYWRkZWRfYnkiO047czoxMToibG9jYXRpb25faWQiO3M6MjA6IjhnbTdxOXJSOE0xZGNtOWtNc2lxIjtzOjExOiJhc3NpZ25lZF90byI7Tjt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6Mjp7czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO3M6ODoiZGF0ZXRpbWUiO3M6ODoicGFzc3dvcmQiO3M6NjoiaGFzaGVkIjt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjA6e31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjA6e31zOjEwOiIAKgB0b3VjaGVzIjthOjA6e31zOjI3OiIAKgByZWxhdGlvbkF1dG9sb2FkQ2FsbGJhY2siO047czoyNjoiACoAcmVsYXRpb25BdXRvbG9hZENvbnRleHQiO047czoxMDoidGltZXN0YW1wcyI7YjoxO3M6MTM6InVzZXNVbmlxdWVJZHMiO2I6MDtzOjk6IgAqAGhpZGRlbiI7YToyOntpOjA7czo4OiJwYXNzd29yZCI7aToxO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjt9czoxMDoiACoAdmlzaWJsZSI7YTowOnt9czoxMToiACoAZmlsbGFibGUiO2E6MTE6e2k6MDtzOjQ6Im5hbWUiO2k6MTtzOjU6ImVtYWlsIjtpOjI7czo4OiJwYXNzd29yZCI7aTozO3M6MTE6ImdobF9hcGlfa2V5IjtpOjQ7czo0OiJyb2xlIjtpOjU7czo2OiJzdGF0dXMiO2k6NjtzOjU6ImltYWdlIjtpOjc7czo4OiJhZGRlZF9ieSI7aTo4O3M6MTE6ImxvY2F0aW9uX2lkIjtpOjk7czoxMToiYXNzaWduZWRfdG8iO2k6MTA7czoxMDoiY29tcGFueV9pZCI7fXM6MTA6IgAqAGd1YXJkZWQiO2E6MTp7aTowO3M6MToiKiI7fXM6MTk6IgAqAGF1dGhQYXNzd29yZE5hbWUiO3M6ODoicGFzc3dvcmQiO3M6MjA6IgAqAHJlbWVtYmVyVG9rZW5OYW1lIjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7czoxNDoiACoAYWNjZXNzVG9rZW4iO047fX0=', 1762182300),
('shnB7yTZev5iawNHGZoXxxxdURuXNtO3ZTmiyTCF', NULL, '182.177.15.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidExmdVdQS1ZQWmtmR01WYXZBMVNaajh1QTN3ZllwMzNaVWREZERvQiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo4NDoiaHR0cHM6Ly9saWdodHNhbG1vbi1ib2FyLTY3MzYzNi5ob3N0aW5nZXJzaXRlLmNvbS9hZG1pbi9kYXNoYm9hcmQvb3Bwb3J0dW5pdGllc1RhYmxlIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vbGlnaHRzYWxtb24tYm9hci02NzM2MzYuaG9zdGluZ2Vyc2l0ZS5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762298925),
('XV48STbPC3klWbPOk6Okxf386mJU2fCh6xDEhsXW', NULL, '182.177.15.149', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVVRBUG5vZTNmN3pFUW9pbGhRcXV1NHQ1WENuckFicFJIVGRKNndKUSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo2OToiaHR0cHM6Ly9saWdodHNhbG1vbi1ib2FyLTY3MzYzNi5ob3N0aW5nZXJzaXRlLmNvbS9hZG1pbi9vcHBvcnR1bml0aWVzIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHBzOi8vbGlnaHRzYWxtb24tYm9hci02NzM2MzYuaG9zdGluZ2Vyc2l0ZS5jb20vbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1762187266);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `user_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(4, 75, 'crm_client_id', '68f7ee25e291e88f144a56bf-mh10y63w', '2025-08-28 18:10:38', '2025-10-21 21:35:41'),
(5, 75, 'crm_client_secret', '7937312f-defb-4527-8e56-e6a07a0cb0be', '2025-08-28 18:10:38', '2025-10-21 21:35:41'),
(6, 75, 'logo', '1757005894.png', '2025-09-04 12:09:28', '2025-09-04 12:11:34');

-- --------------------------------------------------------

--
-- Table structure for table `stage_change_logs`
--

CREATE TABLE `stage_change_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_id` char(36) NOT NULL,
  `opportunity_id` bigint(20) UNSIGNED NOT NULL,
  `pipeline_stage_id` char(36) NOT NULL,
  `pipeline_id` char(36) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stage_change_logs`
--

INSERT INTO `stage_change_logs` (`id`, `contact_id`, `opportunity_id`, `pipeline_stage_id`, `pipeline_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, '1fb3cPh7qErFwunAwxJI', 111, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-22 21:40:39', NULL, '2025-10-22 21:40:41', '2025-10-22 21:40:41'),
(2, 'PlGgUNM0R6zqvjqparQj', 232, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 00:53:47', NULL, '2025-10-23 00:53:49', '2025-10-23 00:53:49'),
(3, 'PlGgUNM0R6zqvjqparQj', 233, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 00:53:47', NULL, '2025-10-23 00:53:49', '2025-10-23 00:53:49'),
(4, 'aClH48WDSaWoC9wzjLbJ', 234, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 12:27:05', '2025-10-23 12:33:20', '2025-10-23 12:27:06', '2025-10-23 12:33:20'),
(5, 'aClH48WDSaWoC9wzjLbJ', 234, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 12:33:20', NULL, '2025-10-23 12:33:20', '2025-10-23 12:33:20'),
(6, 'aClH48WDSaWoC9wzjLbJ', 234, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 12:33:20', NULL, '2025-10-23 12:33:20', '2025-10-23 12:33:20'),
(7, 'uU0HMQoUktqm2WWXfG96', 235, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 12:34:35', '2025-10-23 12:37:02', '2025-10-23 12:34:37', '2025-10-23 12:37:02'),
(8, 'uU0HMQoUktqm2WWXfG96', 235, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 12:37:02', '2025-10-23 13:15:51', '2025-10-23 12:37:02', '2025-10-23 13:15:51'),
(9, '8Pxc4GKFD2kv9MC3whnb', 236, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 12:48:48', '2025-10-23 13:08:24', '2025-10-23 12:48:50', '2025-10-23 13:08:24'),
(10, '3BuC7reuFnlisk33c2Dc', 237, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-18 03:42:22', '2025-10-23 13:12:13', '2025-10-23 13:07:22', '2025-10-23 13:12:13'),
(11, '8Pxc4GKFD2kv9MC3whnb', 236, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 13:08:24', '2025-10-23 14:01:09', '2025-10-23 13:08:24', '2025-10-23 14:01:09'),
(12, '3BuC7reuFnlisk33c2Dc', 237, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-23 13:12:13', NULL, '2025-10-23 13:12:13', '2025-10-23 13:12:13'),
(13, 'uU0HMQoUktqm2WWXfG96', 235, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 13:15:51', '2025-10-23 13:15:55', '2025-10-23 13:15:51', '2025-10-23 13:15:55'),
(14, 'uU0HMQoUktqm2WWXfG96', 235, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-10-23 13:15:55', NULL, '2025-10-23 13:15:55', '2025-10-23 13:15:55'),
(15, 'iQK1rEKmhjDg9tERNy9z', 238, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-23 13:33:25', NULL, '2025-10-23 13:33:27', '2025-10-23 13:33:27'),
(16, 'aCCj1RMZZFRj9GgPnXLj', 239, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 13:57:49', '2025-10-23 14:00:20', '2025-10-23 13:57:51', '2025-10-23 14:00:20'),
(17, 'aCCj1RMZZFRj9GgPnXLj', 239, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 14:00:20', '2025-10-23 14:01:08', '2025-10-23 14:00:20', '2025-10-23 14:01:08'),
(18, 'aCCj1RMZZFRj9GgPnXLj', 239, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 14:01:08', '2025-10-23 14:07:11', '2025-10-23 14:01:08', '2025-10-23 14:07:11'),
(19, '8Pxc4GKFD2kv9MC3whnb', 236, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 14:01:09', '2025-10-23 14:07:17', '2025-10-23 14:01:09', '2025-10-23 14:07:17'),
(20, 'aCCj1RMZZFRj9GgPnXLj', 239, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-23 14:07:11', NULL, '2025-10-23 14:07:11', '2025-10-23 14:07:11'),
(21, '8Pxc4GKFD2kv9MC3whnb', 236, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-23 14:07:17', NULL, '2025-10-23 14:07:17', '2025-10-23 14:07:17'),
(22, 'VbESR4nD4ypeCOdm6fwH', 240, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 14:54:58', '2025-10-23 14:57:43', '2025-10-23 14:55:03', '2025-10-23 14:57:43'),
(23, 'VbESR4nD4ypeCOdm6fwH', 240, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 14:57:43', NULL, '2025-10-23 14:57:43', '2025-10-23 14:57:43'),
(24, 'SMv0Ys3J89hCwbDB7J1n', 241, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 17:20:38', '2025-10-23 17:44:06', '2025-10-23 17:20:43', '2025-10-23 17:44:06'),
(25, '18N08oda7OtesmWqwrvu', 242, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 17:22:14', NULL, '2025-10-23 17:22:16', '2025-10-23 17:22:16'),
(26, 'sRn2SYs5Kdg8dgAmxdbc', 243, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 17:31:35', '2025-10-23 17:35:30', '2025-10-23 17:31:38', '2025-10-23 17:35:30'),
(27, 'sRn2SYs5Kdg8dgAmxdbc', 243, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 17:35:30', NULL, '2025-10-23 17:35:30', '2025-10-23 17:35:30'),
(28, 'SMv0Ys3J89hCwbDB7J1n', 241, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 17:44:06', '2025-10-23 17:47:30', '2025-10-23 17:44:06', '2025-10-23 17:47:30'),
(29, 'SMv0Ys3J89hCwbDB7J1n', 241, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 17:44:06', '2025-10-23 17:47:30', '2025-10-23 17:44:06', '2025-10-23 17:47:30'),
(30, 'SMv0Ys3J89hCwbDB7J1n', 241, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 17:47:30', '2025-10-23 17:52:33', '2025-10-23 17:47:30', '2025-10-23 17:52:33'),
(31, 'SMv0Ys3J89hCwbDB7J1n', 241, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 17:47:30', '2025-10-23 17:52:33', '2025-10-23 17:47:30', '2025-10-23 17:52:33'),
(32, 'SMv0Ys3J89hCwbDB7J1n', 241, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-23 17:52:33', NULL, '2025-10-23 17:52:33', '2025-10-23 17:52:33'),
(33, 'QsBsCPu8TSICGzhXkKhm', 451, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 18:19:43', '2025-10-23 18:22:30', '2025-10-23 18:19:45', '2025-10-23 18:22:30'),
(34, 'QsBsCPu8TSICGzhXkKhm', 451, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 18:22:30', '2025-10-23 18:23:37', '2025-10-23 18:22:30', '2025-10-23 18:23:37'),
(35, 'QsBsCPu8TSICGzhXkKhm', 451, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 18:22:30', '2025-10-23 18:23:37', '2025-10-23 18:22:30', '2025-10-23 18:23:37'),
(36, 'QsBsCPu8TSICGzhXkKhm', 451, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 18:23:37', '2025-10-23 18:28:41', '2025-10-23 18:23:37', '2025-10-23 18:28:41'),
(37, 'sRn2SYs5Kdg8dgAmxdbc', 452, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 17:31:35', '2025-10-23 18:28:43', '2025-10-23 18:23:39', '2025-10-23 18:28:43'),
(38, 'QsBsCPu8TSICGzhXkKhm', 451, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-23 18:28:41', NULL, '2025-10-23 18:28:41', '2025-10-23 18:28:41'),
(39, 'sRn2SYs5Kdg8dgAmxdbc', 452, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-23 18:28:43', NULL, '2025-10-23 18:28:43', '2025-10-23 18:28:43'),
(40, '1P0TO9vkHyRmSALsyncS', 453, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 19:35:38', '2025-10-23 19:38:16', '2025-10-23 19:35:41', '2025-10-23 19:38:16'),
(41, '1P0TO9vkHyRmSALsyncS', 453, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 19:38:16', '2025-10-23 20:23:36', '2025-10-23 19:38:16', '2025-10-23 20:23:36'),
(42, '1P0TO9vkHyRmSALsyncS', 453, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 19:38:16', '2025-10-23 20:23:36', '2025-10-23 19:38:16', '2025-10-23 20:23:36'),
(43, '5CHn4UErmlU24y2W4IoL', 454, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 19:51:54', '2025-10-24 19:58:31', '2025-10-23 19:51:56', '2025-10-24 19:58:31'),
(44, '1P0TO9vkHyRmSALsyncS', 453, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 20:23:36', '2025-10-23 20:28:43', '2025-10-23 20:23:36', '2025-10-23 20:28:43'),
(45, '1P0TO9vkHyRmSALsyncS', 453, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 20:23:36', '2025-10-23 20:28:43', '2025-10-23 20:23:36', '2025-10-23 20:28:43'),
(46, '1P0TO9vkHyRmSALsyncS', 453, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-23 20:28:43', NULL, '2025-10-23 20:28:43', '2025-10-23 20:28:43'),
(47, 'cGOR8poGdBs6igPz63Y7', 455, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 22:39:27', '2025-10-25 17:45:28', '2025-10-23 22:39:29', '2025-10-25 17:45:28'),
(48, 'lUpzulkBvOlV73x84xjg', 316, 'd4a58506-3490-4ed8-8620-48f06365c5bc', 'bKzXACEFizwejXvHRDxo', '2025-10-24 11:29:07', NULL, '2025-10-24 11:29:07', '2025-10-24 11:29:07'),
(49, 'lUpzulkBvOlV73x84xjg', 316, 'd4a58506-3490-4ed8-8620-48f06365c5bc', 'bKzXACEFizwejXvHRDxo', '2025-10-24 11:29:07', NULL, '2025-10-24 11:29:07', '2025-10-24 11:29:07'),
(50, 'QsBsCPu8TSICGzhXkKhm', 456, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-24 14:27:49', '2025-10-24 14:56:14', '2025-10-24 14:27:51', '2025-10-24 14:56:14'),
(51, 'QsBsCPu8TSICGzhXkKhm', 456, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-24 14:56:14', '2025-10-24 14:58:27', '2025-10-24 14:56:14', '2025-10-24 14:58:27'),
(52, 'QsBsCPu8TSICGzhXkKhm', 456, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-24 14:56:14', '2025-10-24 14:58:27', '2025-10-24 14:56:14', '2025-10-24 14:58:27'),
(53, 'QsBsCPu8TSICGzhXkKhm', 456, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-24 14:58:27', '2025-10-28 02:50:32', '2025-10-24 14:58:27', '2025-10-28 02:50:32'),
(54, 'xQNZGLD8MRqR1EqWAHMa', 457, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-24 17:58:08', NULL, '2025-10-24 17:58:10', '2025-10-24 17:58:10'),
(55, 'KwcJqAvBkIx5WmbOlyEk', 458, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-24 18:25:47', NULL, '2025-10-24 18:25:50', '2025-10-24 18:25:50'),
(56, '5CHn4UErmlU24y2W4IoL', 454, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-24 19:58:31', '2025-10-24 20:03:35', '2025-10-24 19:58:31', '2025-10-24 20:03:35'),
(57, '5CHn4UErmlU24y2W4IoL', 454, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-24 19:58:31', '2025-10-24 20:03:35', '2025-10-24 19:58:31', '2025-10-24 20:03:35'),
(58, '5CHn4UErmlU24y2W4IoL', 454, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-24 20:03:35', NULL, '2025-10-24 20:03:35', '2025-10-24 20:03:35'),
(59, '5CHn4UErmlU24y2W4IoL', 454, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-24 20:03:35', NULL, '2025-10-24 20:03:35', '2025-10-24 20:03:35'),
(60, 'Wyu8YaFQG6omuxQeqUW6', 459, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-25 00:21:17', '2025-10-30 13:08:35', '2025-10-25 00:21:19', '2025-10-30 13:08:35'),
(61, 'IRsIVGw7yI6nWJGwvwZM', 261, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-25 17:05:38', '2025-10-25 17:10:53', '2025-10-25 17:05:38', '2025-10-25 17:10:53'),
(62, 'IRsIVGw7yI6nWJGwvwZM', 261, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-25 17:10:53', NULL, '2025-10-25 17:10:53', '2025-10-25 17:10:53'),
(63, 'IRsIVGw7yI6nWJGwvwZM', 261, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-25 17:10:53', NULL, '2025-10-25 17:10:53', '2025-10-25 17:10:53'),
(64, 'fSI4r7SGBfwcwZIhkd1A', 260, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-25 17:26:05', '2025-10-25 17:31:49', '2025-10-25 17:26:05', '2025-10-25 17:31:49'),
(65, 'fSI4r7SGBfwcwZIhkd1A', 260, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-25 17:26:05', '2025-10-25 17:31:49', '2025-10-25 17:26:05', '2025-10-25 17:31:49'),
(66, 'fSI4r7SGBfwcwZIhkd1A', 260, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-25 17:31:49', NULL, '2025-10-25 17:31:49', '2025-10-25 17:31:49'),
(67, 'fSI4r7SGBfwcwZIhkd1A', 260, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-25 17:31:49', NULL, '2025-10-25 17:31:49', '2025-10-25 17:31:49'),
(68, 'cGOR8poGdBs6igPz63Y7', 455, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-25 17:45:28', '2025-10-27 13:03:25', '2025-10-25 17:45:28', '2025-10-27 13:03:25'),
(69, 'cGOR8poGdBs6igPz63Y7', 455, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-25 17:45:28', '2025-10-27 13:03:25', '2025-10-25 17:45:28', '2025-10-27 13:03:25'),
(70, '7Wu9DbQ2TBOLQHtmPwpx', 257, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-25 19:03:08', '2025-10-25 19:08:11', '2025-10-25 19:03:08', '2025-10-25 19:08:11'),
(71, '7Wu9DbQ2TBOLQHtmPwpx', 257, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-25 19:03:08', '2025-10-25 19:08:11', '2025-10-25 19:03:08', '2025-10-25 19:08:11'),
(72, '7Wu9DbQ2TBOLQHtmPwpx', 257, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-25 19:08:11', NULL, '2025-10-25 19:08:11', '2025-10-25 19:08:11'),
(73, '7Wu9DbQ2TBOLQHtmPwpx', 257, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-25 19:08:11', NULL, '2025-10-25 19:08:11', '2025-10-25 19:08:11'),
(74, 'VNGSzxwS37TizuGWwZbO', 254, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-25 20:09:27', '2025-10-25 20:14:29', '2025-10-25 20:09:27', '2025-10-25 20:14:29'),
(75, 'VNGSzxwS37TizuGWwZbO', 254, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-25 20:09:27', '2025-10-25 20:14:29', '2025-10-25 20:09:27', '2025-10-25 20:14:29'),
(76, 'VNGSzxwS37TizuGWwZbO', 254, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-25 20:14:29', NULL, '2025-10-25 20:14:29', '2025-10-25 20:14:29'),
(77, '1fb3cPh7qErFwunAwxJI', 251, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-26 13:08:36', '2025-10-28 02:50:33', '2025-10-26 13:08:36', '2025-10-28 02:50:33'),
(78, 'PlGgUNM0R6zqvjqparQj', 250, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-26 13:09:08', '2025-10-26 13:13:20', '2025-10-26 13:09:08', '2025-10-26 13:13:20'),
(79, 'PlGgUNM0R6zqvjqparQj', 250, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-26 13:13:20', NULL, '2025-10-26 13:13:20', '2025-10-26 13:13:20'),
(80, '18N08oda7OtesmWqwrvu', 460, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-23 17:22:14', '2025-10-26 18:44:31', '2025-10-26 18:39:29', '2025-10-26 18:44:31'),
(81, '18N08oda7OtesmWqwrvu', 460, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-26 18:44:31', NULL, '2025-10-26 18:44:31', '2025-10-26 18:44:31'),
(82, '18N08oda7OtesmWqwrvu', 460, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-26 18:44:31', NULL, '2025-10-26 18:44:31', '2025-10-26 18:44:31'),
(83, '9pjRFEUTyTJRaW3zaAC0', 461, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-27 12:55:51', '2025-10-27 13:04:57', '2025-10-27 12:55:52', '2025-10-27 13:04:57'),
(84, 'STAc0HCFs0E8uPzkkvxt', 462, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-27 12:57:40', '2025-10-30 14:16:31', '2025-10-27 12:57:42', '2025-10-30 14:16:31'),
(85, 'cGOR8poGdBs6igPz63Y7', 455, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-27 13:03:25', '2025-10-27 13:13:45', '2025-10-27 13:03:25', '2025-10-27 13:13:45'),
(86, 'HLz2XVkswExZmDzjrcwi', 341, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-27 13:04:50', '2025-10-27 13:13:54', '2025-10-27 13:04:50', '2025-10-27 13:13:54'),
(87, '9pjRFEUTyTJRaW3zaAC0', 461, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-27 13:04:57', '2025-10-27 13:13:15', '2025-10-27 13:04:57', '2025-10-27 13:13:15'),
(88, '9pjRFEUTyTJRaW3zaAC0', 461, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-27 13:13:15', '2025-10-27 13:17:48', '2025-10-27 13:13:15', '2025-10-27 13:17:48'),
(89, '9pjRFEUTyTJRaW3zaAC0', 461, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-27 13:13:15', '2025-10-27 13:17:48', '2025-10-27 13:13:15', '2025-10-27 13:17:48'),
(90, 'cGOR8poGdBs6igPz63Y7', 455, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-27 13:13:45', NULL, '2025-10-27 13:13:45', '2025-10-27 13:13:45'),
(91, 'HLz2XVkswExZmDzjrcwi', 341, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-27 13:13:54', NULL, '2025-10-27 13:13:54', '2025-10-27 13:13:54'),
(92, '9pjRFEUTyTJRaW3zaAC0', 461, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-27 13:17:48', NULL, '2025-10-27 13:17:48', '2025-10-27 13:17:48'),
(93, '9pjRFEUTyTJRaW3zaAC0', 461, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-27 13:17:48', NULL, '2025-10-27 13:17:48', '2025-10-27 13:17:48'),
(94, '3BuC7reuFnlisk33c2Dc', 315, 'ec794e72-1a29-44ea-8b1b-d3c21d6ada6b', 'bKzXACEFizwejXvHRDxo', '2025-10-27 14:00:13', NULL, '2025-10-27 14:00:13', '2025-10-27 14:00:13'),
(95, 'D0NkAQ2UJUd8v4VwEP3I', 322, '6a58fbde-5f3a-49b3-854c-2f16b6d066b2', 'bKzXACEFizwejXvHRDxo', '2025-10-27 15:33:56', NULL, '2025-10-27 15:33:56', '2025-10-27 15:33:56'),
(96, 'aAS7qsx5ESBFFpoGUAyp', 463, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-27 17:02:49', NULL, '2025-10-27 17:02:51', '2025-10-27 17:02:51'),
(97, '3D7Ob6T1UcpCcoCfnTdS', 464, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-27 17:59:34', NULL, '2025-10-27 17:59:37', '2025-10-27 17:59:37'),
(98, '93i6ETrMtdo8o5kiLVOm', 465, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-27 19:21:18', '2025-10-30 17:48:01', '2025-10-27 19:21:21', '2025-10-30 17:48:01'),
(99, 'QsBsCPu8TSICGzhXkKhm', 456, 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 02:50:32', '2025-10-28 02:50:33', '2025-10-28 02:50:32', '2025-10-28 02:50:33'),
(100, 'QsBsCPu8TSICGzhXkKhm', 456, 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 02:50:32', '2025-10-28 02:50:33', '2025-10-28 02:50:32', '2025-10-28 02:50:33'),
(101, 'QsBsCPu8TSICGzhXkKhm', 456, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 02:50:33', '2025-10-28 02:55:34', '2025-10-28 02:50:33', '2025-10-28 02:55:34'),
(102, 'QsBsCPu8TSICGzhXkKhm', 456, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 02:50:33', '2025-10-28 02:55:34', '2025-10-28 02:50:33', '2025-10-28 02:55:34'),
(103, '1fb3cPh7qErFwunAwxJI', 251, 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 02:50:33', '2025-10-28 02:50:36', '2025-10-28 02:50:33', '2025-10-28 02:50:36'),
(104, 'd94I1AtBZdt2tIcSGd7Q', 252, 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 02:50:36', '2025-10-28 02:50:40', '2025-10-28 02:50:36', '2025-10-28 02:50:40'),
(105, '1fb3cPh7qErFwunAwxJI', 251, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 02:50:36', '2025-10-28 02:55:37', '2025-10-28 02:50:36', '2025-10-28 02:55:37'),
(106, 'J0n3NsJpCyly3VVxcUw4', 319, 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 02:50:39', '2025-10-28 02:50:41', '2025-10-28 02:50:39', '2025-10-28 02:50:41'),
(107, 'd94I1AtBZdt2tIcSGd7Q', 252, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 02:50:40', '2025-10-28 19:24:01', '2025-10-28 02:50:40', '2025-10-28 19:24:01'),
(108, 'J0n3NsJpCyly3VVxcUw4', 319, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 02:50:41', '2025-10-28 02:55:42', '2025-10-28 02:50:41', '2025-10-28 02:55:42'),
(109, 'i3XBJcnb2waLLKc1aDnJ', 466, '4c73710f-edb2-4d7a-8403-56d1a0edd9e4', 'nl32t7MUfkhrOZN4sNeT', '2025-10-10 17:25:37', NULL, '2025-10-28 02:51:39', '2025-10-28 02:51:39'),
(110, 'QsBsCPu8TSICGzhXkKhm', 456, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-28 02:55:34', NULL, '2025-10-28 02:55:34', '2025-10-28 02:55:34'),
(111, '1fb3cPh7qErFwunAwxJI', 251, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-28 02:55:37', NULL, '2025-10-28 02:55:37', '2025-10-28 02:55:37'),
(112, 'J0n3NsJpCyly3VVxcUw4', 319, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-28 02:55:42', NULL, '2025-10-28 02:55:42', '2025-10-28 02:55:42'),
(113, '87pY48POZtU0RomIezIb', 467, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 12:56:04', '2025-10-30 20:23:04', '2025-10-28 12:56:06', '2025-10-30 20:23:04'),
(114, 'MoUp8a5M37HiI7isOhmh', 468, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 13:18:26', '2025-10-28 13:37:46', '2025-10-28 13:18:29', '2025-10-28 13:37:46'),
(115, 'cj7VEVCYKLBggh9c2XDX', 469, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 13:27:01', '2025-10-31 14:50:33', '2025-10-28 13:27:03', '2025-10-31 14:50:33'),
(116, 'MoUp8a5M37HiI7isOhmh', 468, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 13:37:46', '2025-10-28 13:40:36', '2025-10-28 13:37:46', '2025-10-28 13:40:36'),
(117, 'MoUp8a5M37HiI7isOhmh', 468, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 13:40:36', '2025-10-28 13:45:51', '2025-10-28 13:40:36', '2025-10-28 13:45:51'),
(118, 'MoUp8a5M37HiI7isOhmh', 468, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-28 13:45:51', NULL, '2025-10-28 13:45:51', '2025-10-28 13:45:51'),
(119, 'MoUp8a5M37HiI7isOhmh', 468, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-28 13:45:52', NULL, '2025-10-28 13:45:52', '2025-10-28 13:45:52'),
(120, 'MnIXuQ9BJWIsNJKJYcjT', 470, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-28 14:02:55', NULL, '2025-10-28 14:02:57', '2025-10-28 14:02:57'),
(121, 'd94I1AtBZdt2tIcSGd7Q', 252, 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 19:24:01', '2025-10-28 19:24:02', '2025-10-28 19:24:01', '2025-10-28 19:24:02'),
(122, 'd94I1AtBZdt2tIcSGd7Q', 252, 'e96a42f3-d5c3-447d-ad03-934c9a89b92b', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 19:24:01', '2025-10-28 19:24:02', '2025-10-28 19:24:01', '2025-10-28 19:24:02'),
(123, 'd94I1AtBZdt2tIcSGd7Q', 252, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 19:24:02', NULL, '2025-10-28 19:24:02', '2025-10-28 19:24:02'),
(124, 'd94I1AtBZdt2tIcSGd7Q', 252, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 19:24:02', NULL, '2025-10-28 19:24:02', '2025-10-28 19:24:02'),
(125, 'SFTz4hlrAMf3X4hEM4yZ', 471, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-28 23:42:18', '2025-11-01 13:10:07', '2025-10-28 23:42:20', '2025-11-01 13:10:07'),
(126, 'Ss85AnYLjw44HvYzn5qG', 472, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-29 12:33:27', NULL, '2025-10-29 12:33:28', '2025-10-29 12:33:28'),
(127, 'GmuJyQSeTZh5c8Lkbknk', 473, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-29 12:43:48', '2025-11-01 14:09:38', '2025-10-29 12:43:51', '2025-11-01 14:09:38'),
(128, 'D0NkAQ2UJUd8v4VwEP3I', 474, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-29 13:06:47', '2025-11-01 14:24:04', '2025-10-29 13:06:58', '2025-11-01 14:24:04'),
(129, 'g8F6iMRGeerpfzegH7UF', 475, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-29 13:06:26', '2025-11-01 14:23:42', '2025-10-29 13:07:46', '2025-11-01 14:23:42'),
(130, 'odPfKiqu3wPQBWQxmKOn', 476, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-29 13:11:20', NULL, '2025-10-29 13:12:49', '2025-10-29 13:12:49'),
(131, '4pfktmhydmeiPVycxwJC', 477, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-29 13:59:50', '2025-10-29 14:08:01', '2025-10-29 13:59:52', '2025-10-29 14:08:01'),
(132, '4pfktmhydmeiPVycxwJC', 477, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-29 14:08:01', NULL, '2025-10-29 14:08:01', '2025-10-29 14:08:01'),
(133, 'V1wRMuYIIr5g2kirCiE2', 291, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-10-29 16:58:13', '2025-10-29 16:58:15', '2025-10-29 16:58:13', '2025-10-29 16:58:15'),
(134, 'V1wRMuYIIr5g2kirCiE2', 291, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-10-29 16:58:15', NULL, '2025-10-29 16:58:15', '2025-10-29 16:58:15'),
(135, 'zyuOufQ6VO0i9Bm8ODQH', 478, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-29 18:30:18', NULL, '2025-10-29 18:30:21', '2025-10-29 18:30:21'),
(136, 'SR3OtIUCmrllsO3DZ3jW', 479, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-29 19:35:47', '2025-11-01 20:53:00', '2025-10-29 19:35:50', '2025-11-01 20:53:00'),
(137, 'jIiSFRvF4TUy9jAAM9WM', 480, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-29 19:41:16', NULL, '2025-10-29 19:41:19', '2025-10-29 19:41:19'),
(138, 'oPp2xo8X9p0G17rjQ9rf', 481, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-29 20:15:04', '2025-11-02 14:09:22', '2025-10-29 20:15:05', '2025-11-02 14:09:22'),
(139, 'Wyu8YaFQG6omuxQeqUW6', 459, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 13:08:35', NULL, '2025-10-30 13:08:35', '2025-10-30 13:08:35'),
(140, 'lBQDLEIoKRvFQExDYfXH', 482, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 13:54:49', '2025-10-30 13:57:31', '2025-10-30 13:54:51', '2025-10-30 13:57:31'),
(141, 'lBQDLEIoKRvFQExDYfXH', 482, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 13:57:31', '2025-10-30 14:23:43', '2025-10-30 13:57:31', '2025-10-30 14:23:43'),
(142, 'STAc0HCFs0E8uPzkkvxt', 462, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 14:16:31', '2025-10-30 14:21:36', '2025-10-30 14:16:31', '2025-10-30 14:21:36'),
(143, 'STAc0HCFs0E8uPzkkvxt', 462, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 14:16:31', '2025-10-30 14:21:36', '2025-10-30 14:16:31', '2025-10-30 14:21:36'),
(144, 'STAc0HCFs0E8uPzkkvxt', 462, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-30 14:21:36', NULL, '2025-10-30 14:21:36', '2025-10-30 14:21:36'),
(145, 'STAc0HCFs0E8uPzkkvxt', 462, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-30 14:21:36', NULL, '2025-10-30 14:21:36', '2025-10-30 14:21:36'),
(146, 'lBQDLEIoKRvFQExDYfXH', 482, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 14:23:43', '2025-10-30 14:24:03', '2025-10-30 14:23:43', '2025-10-30 14:24:03'),
(147, 'lBQDLEIoKRvFQExDYfXH', 482, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-10-30 14:24:03', '2025-10-30 14:24:07', '2025-10-30 14:24:03', '2025-10-30 14:24:07'),
(148, 'lBQDLEIoKRvFQExDYfXH', 482, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-10-30 14:24:03', '2025-10-30 14:24:07', '2025-10-30 14:24:03', '2025-10-30 14:24:07'),
(149, 'lBQDLEIoKRvFQExDYfXH', 482, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 14:24:07', '2025-10-30 14:24:09', '2025-10-30 14:24:07', '2025-10-30 14:24:09'),
(150, 'lBQDLEIoKRvFQExDYfXH', 482, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 14:24:07', '2025-10-30 14:24:09', '2025-10-30 14:24:07', '2025-10-30 14:24:09'),
(151, 'lBQDLEIoKRvFQExDYfXH', 482, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-10-30 14:24:09', NULL, '2025-10-30 14:24:09', '2025-10-30 14:24:09'),
(152, 'lBQDLEIoKRvFQExDYfXH', 482, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-10-30 14:24:09', NULL, '2025-10-30 14:24:09', '2025-10-30 14:24:09'),
(153, '3tpeGa9louoWrDnvCDmD', 483, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 15:44:41', '2025-11-02 18:04:56', '2025-10-30 15:44:44', '2025-11-02 18:04:56'),
(154, 'hgM5fNtY9st8rFuJjIKD', 484, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 17:20:07', '2025-10-30 17:22:52', '2025-10-30 17:20:08', '2025-10-30 17:22:52'),
(155, 'hgM5fNtY9st8rFuJjIKD', 484, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 17:22:52', '2025-10-30 19:47:53', '2025-10-30 17:22:52', '2025-10-30 19:47:53'),
(156, '93i6ETrMtdo8o5kiLVOm', 465, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 17:48:01', '2025-10-30 20:38:37', '2025-10-30 17:48:01', '2025-10-30 20:38:37'),
(157, 'MReI3zF4X04DTsMoVkkQ', 485, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-30 18:15:34', NULL, '2025-10-30 18:15:37', '2025-10-30 18:15:37'),
(158, 'hEfITXRfYKQYsEuW4Z21', 486, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 19:35:39', '2025-10-30 20:58:27', '2025-10-30 19:35:41', '2025-10-30 20:58:27'),
(159, 'hgM5fNtY9st8rFuJjIKD', 484, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 19:47:53', '2025-10-30 20:22:43', '2025-10-30 19:47:53', '2025-10-30 20:22:43'),
(160, 'hgM5fNtY9st8rFuJjIKD', 484, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 19:47:53', '2025-10-30 20:22:43', '2025-10-30 19:47:53', '2025-10-30 20:22:43'),
(161, 'zfR6e6lOb5BKDULJzAhV', 487, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 19:56:56', '2025-11-03 14:12:47', '2025-10-30 19:56:57', '2025-11-03 14:12:47'),
(162, 'hgM5fNtY9st8rFuJjIKD', 484, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 20:22:43', '2025-10-30 20:27:47', '2025-10-30 20:22:43', '2025-10-30 20:27:47'),
(163, '87pY48POZtU0RomIezIb', 467, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 20:23:04', '2025-10-31 14:13:32', '2025-10-30 20:23:04', '2025-10-31 14:13:32'),
(164, 'hgM5fNtY9st8rFuJjIKD', 484, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-30 20:27:47', NULL, '2025-10-30 20:27:47', '2025-10-30 20:27:47'),
(165, 'hgM5fNtY9st8rFuJjIKD', 484, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-30 20:27:47', NULL, '2025-10-30 20:27:47', '2025-10-30 20:27:47'),
(166, '93i6ETrMtdo8o5kiLVOm', 465, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 20:38:37', '2025-10-30 20:43:43', '2025-10-30 20:38:37', '2025-10-30 20:43:43'),
(167, '93i6ETrMtdo8o5kiLVOm', 465, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 20:38:37', '2025-10-30 20:43:43', '2025-10-30 20:38:37', '2025-10-30 20:43:43'),
(168, '93i6ETrMtdo8o5kiLVOm', 465, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-30 20:43:43', NULL, '2025-10-30 20:43:43', '2025-10-30 20:43:43'),
(169, '93i6ETrMtdo8o5kiLVOm', 465, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-30 20:43:43', NULL, '2025-10-30 20:43:43', '2025-10-30 20:43:43'),
(170, 'hEfITXRfYKQYsEuW4Z21', 486, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 20:58:27', '2025-10-30 20:59:16', '2025-10-30 20:58:27', '2025-10-30 20:59:16'),
(171, 'hEfITXRfYKQYsEuW4Z21', 486, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 20:58:27', '2025-10-30 20:59:16', '2025-10-30 20:58:27', '2025-10-30 20:59:16'),
(172, 'hEfITXRfYKQYsEuW4Z21', 486, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 20:59:16', '2025-10-31 18:23:35', '2025-10-30 20:59:16', '2025-10-31 18:23:35'),
(173, 'hEfITXRfYKQYsEuW4Z21', 486, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 20:59:16', '2025-10-31 18:23:35', '2025-10-30 20:59:16', '2025-10-31 18:23:35'),
(174, 'RTt7SQVYlrlIBowVPAWQ', 488, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-30 22:21:45', '2025-11-01 14:18:58', '2025-10-30 22:21:47', '2025-11-01 14:18:58'),
(175, 'nmlMWKtAzGDCvwmwM7fq', 489, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-30 23:27:34', NULL, '2025-10-30 23:27:35', '2025-10-30 23:27:35'),
(176, 'HLz2XVkswExZmDzjrcwi', 490, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 03:18:28', '2025-11-03 14:12:48', '2025-10-31 03:18:30', '2025-11-03 14:12:48'),
(177, '2gbm3dDsOdBcu86LQhCF', 491, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 04:08:00', '2025-10-31 04:12:27', '2025-10-31 04:08:02', '2025-10-31 04:12:27'),
(178, '2gbm3dDsOdBcu86LQhCF', 491, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 04:12:27', '2025-10-31 15:47:00', '2025-10-31 04:12:27', '2025-10-31 15:47:00'),
(179, 'o0s46dl8XNsI7USCwIBU', 492, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 04:14:26', '2025-11-01 13:13:55', '2025-10-31 04:14:27', '2025-11-01 13:13:55'),
(180, 'OO3R592uIRirpXLV5haD', 493, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 04:18:03', '2025-11-03 14:13:08', '2025-10-31 04:18:52', '2025-11-03 14:13:08'),
(181, 'ZrlLIkjXyMW3PPC7TGrt', 494, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 04:34:46', '2025-11-03 14:12:26', '2025-10-31 04:34:47', '2025-11-03 14:12:26'),
(182, 'XfpCxCZHxQixUipt1wsr', 495, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 08:39:12', '2025-10-31 13:49:31', '2025-10-31 08:39:14', '2025-10-31 13:49:31'),
(183, 'pITiHSRiKlhD1r0B2PW7', 496, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 09:27:17', '2025-10-31 09:45:48', '2025-10-31 09:27:19', '2025-10-31 09:45:48'),
(184, 'pITiHSRiKlhD1r0B2PW7', 496, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 09:45:48', NULL, '2025-10-31 09:45:48', '2025-10-31 09:45:48'),
(185, 'pITiHSRiKlhD1r0B2PW7', 496, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 09:45:48', NULL, '2025-10-31 09:45:48', '2025-10-31 09:45:48'),
(186, 'XfpCxCZHxQixUipt1wsr', 495, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 13:49:31', '2025-10-31 13:58:45', '2025-10-31 13:49:31', '2025-10-31 13:58:45'),
(187, 'XfpCxCZHxQixUipt1wsr', 495, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 13:49:31', '2025-10-31 13:58:45', '2025-10-31 13:49:31', '2025-10-31 13:58:45'),
(188, 'XfpCxCZHxQixUipt1wsr', 495, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 13:58:45', '2025-10-31 13:58:47', '2025-10-31 13:58:45', '2025-10-31 13:58:47'),
(189, 'XfpCxCZHxQixUipt1wsr', 495, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 13:58:45', '2025-10-31 13:58:47', '2025-10-31 13:58:45', '2025-10-31 13:58:47'),
(190, 'XfpCxCZHxQixUipt1wsr', 495, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-10-31 13:58:47', NULL, '2025-10-31 13:58:47', '2025-10-31 13:58:47'),
(191, '87pY48POZtU0RomIezIb', 467, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 14:13:32', '2025-10-31 14:18:36', '2025-10-31 14:13:32', '2025-10-31 14:18:36'),
(192, '87pY48POZtU0RomIezIb', 467, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-31 14:18:36', NULL, '2025-10-31 14:18:36', '2025-10-31 14:18:36'),
(193, 'cj7VEVCYKLBggh9c2XDX', 469, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 14:50:33', NULL, '2025-10-31 14:50:33', '2025-10-31 14:50:33'),
(194, '2gbm3dDsOdBcu86LQhCF', 491, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 15:47:00', '2025-10-31 18:23:31', '2025-10-31 15:47:00', '2025-10-31 18:23:31'),
(195, '2gbm3dDsOdBcu86LQhCF', 491, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 15:47:00', '2025-10-31 18:23:31', '2025-10-31 15:47:00', '2025-10-31 18:23:31'),
(196, 'mM6YLGJaIg27B0Oir3FV', 497, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 16:55:48', '2025-10-31 17:02:19', '2025-10-31 16:55:51', '2025-10-31 17:02:19'),
(197, 'yAU4fkrlATpARTzcdUf0', 498, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 16:56:11', '2025-10-31 18:56:01', '2025-10-31 16:56:13', '2025-10-31 18:56:01'),
(198, 'mM6YLGJaIg27B0Oir3FV', 497, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 17:02:19', '2025-10-31 17:04:34', '2025-10-31 17:02:19', '2025-10-31 17:04:34'),
(199, 'mM6YLGJaIg27B0Oir3FV', 497, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 17:02:19', '2025-10-31 17:04:34', '2025-10-31 17:02:19', '2025-10-31 17:04:34'),
(200, 'QsBsCPu8TSICGzhXkKhm', 499, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 17:04:20', '2025-10-31 17:20:37', '2025-10-31 17:04:24', '2025-10-31 17:20:37'),
(201, 'mM6YLGJaIg27B0Oir3FV', 497, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 17:04:34', '2025-10-31 18:23:26', '2025-10-31 17:04:34', '2025-10-31 18:23:26'),
(202, 'QsBsCPu8TSICGzhXkKhm', 499, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 17:20:37', '2025-10-31 18:09:14', '2025-10-31 17:20:37', '2025-10-31 18:09:14'),
(203, 'QsBsCPu8TSICGzhXkKhm', 499, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 17:20:37', '2025-10-31 18:09:14', '2025-10-31 17:20:37', '2025-10-31 18:09:14'),
(204, 'AkrVDaOm4OmfILIYLizB', 500, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-31 18:05:41', NULL, '2025-10-31 18:05:43', '2025-10-31 18:05:43'),
(205, 'QsBsCPu8TSICGzhXkKhm', 499, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:09:14', '2025-10-31 18:23:23', '2025-10-31 18:09:14', '2025-10-31 18:23:23'),
(206, 'QsBsCPu8TSICGzhXkKhm', 499, '625479f4-8c94-46a1-a6a5-c2072d4a08e5', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:09:14', '2025-10-31 18:23:23', '2025-10-31 18:09:14', '2025-10-31 18:23:23'),
(207, 'PzTQgdL4M7OUP1vuNc7S', 501, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:19:40', '2025-10-31 18:22:11', '2025-10-31 18:19:43', '2025-10-31 18:22:11'),
(208, 'PzTQgdL4M7OUP1vuNc7S', 501, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:22:11', '2025-10-31 18:23:37', '2025-10-31 18:22:11', '2025-10-31 18:23:37'),
(209, 'PzTQgdL4M7OUP1vuNc7S', 501, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:22:11', '2025-10-31 18:23:37', '2025-10-31 18:22:11', '2025-10-31 18:23:37'),
(210, 'QsBsCPu8TSICGzhXkKhm', 499, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:23:23', NULL, '2025-10-31 18:23:23', '2025-10-31 18:23:23'),
(211, 'mM6YLGJaIg27B0Oir3FV', 497, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:23:26', '2025-10-31 18:28:32', '2025-10-31 18:23:26', '2025-10-31 18:28:32'),
(212, '2gbm3dDsOdBcu86LQhCF', 491, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:23:31', '2025-10-31 18:28:35', '2025-10-31 18:23:31', '2025-10-31 18:28:35'),
(213, '2gbm3dDsOdBcu86LQhCF', 491, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:23:31', '2025-10-31 18:28:35', '2025-10-31 18:23:31', '2025-10-31 18:28:35'),
(214, 'hEfITXRfYKQYsEuW4Z21', 486, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:23:35', '2025-10-31 18:28:39', '2025-10-31 18:23:35', '2025-10-31 18:28:39'),
(215, 'PzTQgdL4M7OUP1vuNc7S', 501, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:23:37', '2025-10-31 18:28:40', '2025-10-31 18:23:37', '2025-10-31 18:28:40'),
(216, 'mM6YLGJaIg27B0Oir3FV', 497, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-31 18:28:32', NULL, '2025-10-31 18:28:32', '2025-10-31 18:28:32'),
(217, '2gbm3dDsOdBcu86LQhCF', 491, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-31 18:28:35', NULL, '2025-10-31 18:28:35', '2025-10-31 18:28:35'),
(218, 'hEfITXRfYKQYsEuW4Z21', 486, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-31 18:28:39', NULL, '2025-10-31 18:28:39', '2025-10-31 18:28:39'),
(219, 'PzTQgdL4M7OUP1vuNc7S', 501, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-31 18:28:40', NULL, '2025-10-31 18:28:40', '2025-10-31 18:28:40'),
(220, 'rtvnJrZqKcpQe6fsx1iy', 502, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:29:40', '2025-11-03 20:47:13', '2025-10-31 18:29:42', '2025-11-03 20:47:13'),
(221, 'aQqem0bpurFoTG0uRhCL', 503, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:37:49', '2025-11-03 20:55:04', '2025-10-31 18:37:57', '2025-11-03 20:55:04'),
(222, 'yAU4fkrlATpARTzcdUf0', 498, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:56:01', '2025-10-31 19:51:39', '2025-10-31 18:56:01', '2025-10-31 19:51:39'),
(223, 'yAU4fkrlATpARTzcdUf0', 498, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 18:56:01', '2025-10-31 19:51:39', '2025-10-31 18:56:01', '2025-10-31 19:51:39'),
(224, 'f5KoXTjenovku8xZfp2T', 504, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 19:20:47', '2025-11-03 21:38:06', '2025-10-31 19:20:49', '2025-11-03 21:38:06'),
(225, 'nrTwbnmSyUPSaz7GI1ex', 505, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 19:31:15', '2025-10-31 19:43:35', '2025-10-31 19:31:18', '2025-10-31 19:43:35'),
(226, 'nrTwbnmSyUPSaz7GI1ex', 505, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 19:43:35', '2025-10-31 20:01:01', '2025-10-31 19:43:35', '2025-10-31 20:01:01'),
(227, 'nrTwbnmSyUPSaz7GI1ex', 505, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 19:43:35', '2025-10-31 20:01:01', '2025-10-31 19:43:35', '2025-10-31 20:01:01'),
(228, 'yAU4fkrlATpARTzcdUf0', 498, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 19:51:39', '2025-10-31 19:56:41', '2025-10-31 19:51:39', '2025-10-31 19:56:41'),
(229, 'yAU4fkrlATpARTzcdUf0', 498, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 19:51:39', '2025-10-31 19:56:41', '2025-10-31 19:51:39', '2025-10-31 19:56:41'),
(230, 'yAU4fkrlATpARTzcdUf0', 498, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-31 19:56:41', NULL, '2025-10-31 19:56:41', '2025-10-31 19:56:41'),
(231, '6jU3QghqrcioiTAUTgO0', 506, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 19:57:28', '2025-10-31 20:02:43', '2025-10-31 19:57:30', '2025-10-31 20:02:43'),
(232, 'nrTwbnmSyUPSaz7GI1ex', 505, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 20:01:01', '2025-10-31 20:06:04', '2025-10-31 20:01:01', '2025-10-31 20:06:04'),
(233, '6jU3QghqrcioiTAUTgO0', 506, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 20:02:43', NULL, '2025-10-31 20:02:43', '2025-10-31 20:02:43'),
(234, '6jU3QghqrcioiTAUTgO0', 506, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 20:02:43', NULL, '2025-10-31 20:02:43', '2025-10-31 20:02:43'),
(235, 'nrTwbnmSyUPSaz7GI1ex', 505, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-31 20:06:04', NULL, '2025-10-31 20:06:04', '2025-10-31 20:06:04'),
(236, 'nrTwbnmSyUPSaz7GI1ex', 505, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-31 20:06:04', NULL, '2025-10-31 20:06:04', '2025-10-31 20:06:04'),
(237, '5KWzZsPnn8aZ5YOnEY37', 507, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 20:46:28', '2025-10-31 20:48:58', '2025-10-31 20:46:30', '2025-10-31 20:48:58'),
(238, '5KWzZsPnn8aZ5YOnEY37', 507, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 20:48:58', '2025-10-31 20:50:43', '2025-10-31 20:48:58', '2025-10-31 20:50:43'),
(239, '5KWzZsPnn8aZ5YOnEY37', 507, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 20:50:43', '2025-10-31 20:55:45', '2025-10-31 20:50:43', '2025-10-31 20:55:45'),
(240, '5KWzZsPnn8aZ5YOnEY37', 507, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 20:50:43', '2025-10-31 20:55:45', '2025-10-31 20:50:43', '2025-10-31 20:55:45'),
(241, '5KWzZsPnn8aZ5YOnEY37', 507, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-10-31 20:55:45', NULL, '2025-10-31 20:55:45', '2025-10-31 20:55:45'),
(242, 'eUa3iALaNfDYbHXZlNzB', 508, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 21:00:43', '2025-10-31 21:04:01', '2025-10-31 21:00:45', '2025-10-31 21:04:01'),
(243, 'eUa3iALaNfDYbHXZlNzB', 508, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 21:04:01', '2025-11-03 14:41:26', '2025-10-31 21:04:01', '2025-11-03 14:41:26'),
(244, 'jXuFlHj2FPGz1nWj9pUX', 509, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 22:27:47', NULL, '2025-10-31 22:27:48', '2025-10-31 22:27:48'),
(245, 'McKmpklwX3UHD6w5m0L8', 510, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-10-31 22:28:58', NULL, '2025-10-31 22:29:00', '2025-10-31 22:29:00'),
(246, 'q0Pm1haJXqiKP3enxy2j', 511, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-10-31 22:57:41', NULL, '2025-10-31 22:57:42', '2025-10-31 22:57:42'),
(247, 'fGTEUr6n3G7nU8MGvbWq', 512, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-11-01 00:04:04', NULL, '2025-11-01 00:04:12', '2025-11-01 00:04:12'),
(248, 'FdXQeNo1igOK3DDYq0Tp', 513, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 00:17:39', '2025-11-01 00:20:10', '2025-11-01 00:17:41', '2025-11-01 00:20:10'),
(249, 'FdXQeNo1igOK3DDYq0Tp', 514, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 00:17:39', NULL, '2025-11-01 00:17:41', '2025-11-01 00:17:41'),
(250, 'FdXQeNo1igOK3DDYq0Tp', 513, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 00:20:10', NULL, '2025-11-01 00:20:10', '2025-11-01 00:20:10'),
(251, 'Mb27Hj8wWpmZbJvlxGX9', 515, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-11-01 01:19:38', NULL, '2025-11-01 01:19:39', '2025-11-01 01:19:39'),
(252, 'AsIL6gJRr1WI3txZXQhe', 516, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 01:30:20', '2025-11-01 01:48:42', '2025-11-01 01:30:24', '2025-11-01 01:48:42'),
(253, 'AsIL6gJRr1WI3txZXQhe', 516, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 01:48:42', NULL, '2025-11-01 01:48:42', '2025-11-01 01:48:42'),
(254, 'AsIL6gJRr1WI3txZXQhe', 516, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 01:48:42', NULL, '2025-11-01 01:48:42', '2025-11-01 01:48:42'),
(255, 'gejQs8t5sffY8HiZKYqi', 517, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 02:02:23', '2025-11-03 14:16:22', '2025-11-01 02:02:24', '2025-11-03 14:16:22'),
(256, 'X50uDYXJAAjz6wzjBYiA', 518, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 09:09:52', NULL, '2025-11-01 09:09:53', '2025-11-01 09:09:53'),
(257, 'T3mj9rh4qOqsWuZLog51', 519, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 13:08:57', '2025-11-01 14:11:16', '2025-11-01 13:09:36', '2025-11-01 14:11:16'),
(258, 'SFTz4hlrAMf3X4hEM4yZ', 471, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 13:10:07', '2025-11-01 13:17:03', '2025-11-01 13:10:07', '2025-11-01 13:17:03'),
(259, 'o0s46dl8XNsI7USCwIBU', 492, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 13:13:55', '2025-11-03 14:05:55', '2025-11-01 13:13:55', '2025-11-03 14:05:55'),
(260, 'SFTz4hlrAMf3X4hEM4yZ', 471, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-01 13:17:03', NULL, '2025-11-01 13:17:03', '2025-11-01 13:17:03'),
(261, 'GmuJyQSeTZh5c8Lkbknk', 473, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 14:09:38', '2025-11-01 14:15:38', '2025-11-01 14:09:38', '2025-11-01 14:15:38'),
(262, 'T3mj9rh4qOqsWuZLog51', 519, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 14:11:16', '2025-11-04 18:56:15', '2025-11-01 14:11:16', '2025-11-04 18:56:15'),
(263, 'GmuJyQSeTZh5c8Lkbknk', 473, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-01 14:15:38', NULL, '2025-11-01 14:15:38', '2025-11-01 14:15:38'),
(264, 'RTt7SQVYlrlIBowVPAWQ', 488, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 14:18:58', NULL, '2025-11-01 14:18:58', '2025-11-01 14:18:58'),
(265, 'g8F6iMRGeerpfzegH7UF', 475, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 14:23:42', '2025-11-01 14:28:45', '2025-11-01 14:23:42', '2025-11-01 14:28:45'),
(266, 'D0NkAQ2UJUd8v4VwEP3I', 474, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 14:24:04', '2025-11-01 14:29:08', '2025-11-01 14:24:04', '2025-11-01 14:29:08'),
(267, 'AkrVDaOm4OmfILIYLizB', 520, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 14:26:09', '2025-11-01 14:44:07', '2025-11-01 14:26:11', '2025-11-01 14:44:07'),
(268, 'g8F6iMRGeerpfzegH7UF', 475, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-01 14:28:45', NULL, '2025-11-01 14:28:45', '2025-11-01 14:28:45'),
(269, 'D0NkAQ2UJUd8v4VwEP3I', 474, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-01 14:29:08', NULL, '2025-11-01 14:29:08', '2025-11-01 14:29:08'),
(270, 'D0NkAQ2UJUd8v4VwEP3I', 474, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-01 14:29:08', NULL, '2025-11-01 14:29:08', '2025-11-01 14:29:08'),
(271, 'AkrVDaOm4OmfILIYLizB', 520, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 14:44:07', '2025-11-03 15:23:13', '2025-11-01 14:44:07', '2025-11-03 15:23:13');
INSERT INTO `stage_change_logs` (`id`, `contact_id`, `opportunity_id`, `pipeline_stage_id`, `pipeline_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(272, 'AkrVDaOm4OmfILIYLizB', 520, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 14:44:07', '2025-11-03 15:23:13', '2025-11-01 14:44:07', '2025-11-03 15:23:13'),
(273, '2CYR53NsRXN1IYJhzr6h', 521, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 14:44:14', '2025-11-01 15:09:25', '2025-11-01 14:44:16', '2025-11-01 15:09:25'),
(274, '2CYR53NsRXN1IYJhzr6h', 521, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 15:09:25', NULL, '2025-11-01 15:09:25', '2025-11-01 15:09:25'),
(275, '2CYR53NsRXN1IYJhzr6h', 521, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 15:09:25', NULL, '2025-11-01 15:09:25', '2025-11-01 15:09:25'),
(276, 'taHyTM3Rf1Tzef2XBSu7', 522, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 15:13:09', NULL, '2025-11-01 15:13:11', '2025-11-01 15:13:11'),
(277, '7kjc0JZlTjEDgyWYORxY', 523, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 15:57:43', '2025-11-01 16:00:30', '2025-11-01 15:57:44', '2025-11-01 16:00:30'),
(278, '7kjc0JZlTjEDgyWYORxY', 523, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 16:00:30', '2025-11-04 18:55:58', '2025-11-01 16:00:30', '2025-11-04 18:55:58'),
(279, 'QR4GRdsnECAjv9mRskdv', 524, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 19:38:33', '2025-11-01 19:58:56', '2025-11-01 19:38:35', '2025-11-01 19:58:56'),
(280, 'QR4GRdsnECAjv9mRskdv', 524, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 19:58:56', '2025-11-03 18:38:49', '2025-11-01 19:58:56', '2025-11-03 18:38:49'),
(281, 'QR4GRdsnECAjv9mRskdv', 524, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 19:58:56', '2025-11-03 18:38:49', '2025-11-01 19:58:56', '2025-11-03 18:38:49'),
(282, 'SR3OtIUCmrllsO3DZ3jW', 479, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 20:53:00', '2025-11-01 20:58:01', '2025-11-01 20:53:00', '2025-11-01 20:58:01'),
(283, 'SR3OtIUCmrllsO3DZ3jW', 479, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 20:53:00', '2025-11-01 20:58:01', '2025-11-01 20:53:00', '2025-11-01 20:58:01'),
(284, 'SR3OtIUCmrllsO3DZ3jW', 479, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-01 20:58:01', NULL, '2025-11-01 20:58:01', '2025-11-01 20:58:01'),
(285, 'fCeBUMnznETQ97uiJL6M', 525, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 21:21:56', '2025-11-01 21:25:44', '2025-11-01 21:21:58', '2025-11-01 21:25:44'),
(286, 'fCeBUMnznETQ97uiJL6M', 525, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 21:25:44', '2025-11-03 14:41:33', '2025-11-01 21:25:44', '2025-11-03 14:41:33'),
(287, 'fCeBUMnznETQ97uiJL6M', 525, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 21:25:44', '2025-11-03 14:41:33', '2025-11-01 21:25:44', '2025-11-03 14:41:33'),
(288, 'SJc2erYt4BpSM3HCYxmf', 526, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 22:35:04', '2025-11-01 22:38:01', '2025-11-01 22:35:07', '2025-11-01 22:38:01'),
(289, 'SJc2erYt4BpSM3HCYxmf', 526, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 22:38:01', '2025-11-03 18:38:19', '2025-11-01 22:38:01', '2025-11-03 18:38:19'),
(290, 'VvBXDddpRNSej4b29PLK', 527, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 23:51:56', '2025-11-01 23:54:21', '2025-11-01 23:51:57', '2025-11-01 23:54:21'),
(291, 'VvBXDddpRNSej4b29PLK', 527, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-01 23:54:21', '2025-11-03 15:01:28', '2025-11-01 23:54:21', '2025-11-03 15:01:28'),
(292, 'XrKfGPxTDKK7mDHzc2s4', 528, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 00:50:22', '2025-11-02 01:16:57', '2025-11-02 00:50:24', '2025-11-02 01:16:57'),
(293, 'XrKfGPxTDKK7mDHzc2s4', 528, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 01:16:57', NULL, '2025-11-02 01:16:57', '2025-11-02 01:16:57'),
(294, 'XrKfGPxTDKK7mDHzc2s4', 528, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 01:16:57', NULL, '2025-11-02 01:16:57', '2025-11-02 01:16:57'),
(295, 'QzkvDJN0bvJfQ7Q7WEew', 529, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 01:21:29', '2025-11-02 01:47:51', '2025-11-02 01:21:30', '2025-11-02 01:47:51'),
(296, 'QzkvDJN0bvJfQ7Q7WEew', 529, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 01:47:51', '2025-11-03 15:01:33', '2025-11-02 01:47:51', '2025-11-03 15:01:33'),
(297, 'QzkvDJN0bvJfQ7Q7WEew', 529, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 01:47:51', '2025-11-03 15:01:33', '2025-11-02 01:47:51', '2025-11-03 15:01:33'),
(298, 'E4bz7GpM3n4h5VmTz1wc', 530, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 03:50:11', '2025-11-02 04:29:49', '2025-11-02 03:50:13', '2025-11-02 04:29:49'),
(299, 'E4bz7GpM3n4h5VmTz1wc', 530, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 04:29:49', NULL, '2025-11-02 04:29:49', '2025-11-02 04:29:49'),
(300, 'E4bz7GpM3n4h5VmTz1wc', 530, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 04:29:49', NULL, '2025-11-02 04:29:49', '2025-11-02 04:29:49'),
(301, 'oPp2xo8X9p0G17rjQ9rf', 481, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 14:09:22', '2025-11-02 14:15:39', '2025-11-02 14:09:22', '2025-11-02 14:15:39'),
(302, 'oPp2xo8X9p0G17rjQ9rf', 481, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 14:09:22', '2025-11-02 14:15:39', '2025-11-02 14:09:22', '2025-11-02 14:15:39'),
(303, 'oPp2xo8X9p0G17rjQ9rf', 481, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-02 14:15:39', NULL, '2025-11-02 14:15:39', '2025-11-02 14:15:39'),
(304, 'oPp2xo8X9p0G17rjQ9rf', 481, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-02 14:15:39', NULL, '2025-11-02 14:15:39', '2025-11-02 14:15:39'),
(305, 'vjgZaUr3dXsWfPjulMgD', 531, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 17:22:10', '2025-11-02 17:25:06', '2025-11-02 17:22:12', '2025-11-02 17:25:06'),
(306, 'vjgZaUr3dXsWfPjulMgD', 531, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 17:25:06', '2025-11-03 15:00:15', '2025-11-02 17:25:06', '2025-11-03 15:00:15'),
(307, 'vjgZaUr3dXsWfPjulMgD', 531, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 17:25:06', '2025-11-03 15:00:15', '2025-11-02 17:25:06', '2025-11-03 15:00:15'),
(308, '3tpeGa9louoWrDnvCDmD', 483, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 18:04:56', '2025-11-02 18:09:51', '2025-11-02 18:04:56', '2025-11-02 18:09:51'),
(309, '3tpeGa9louoWrDnvCDmD', 483, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-02 18:04:56', '2025-11-02 18:09:51', '2025-11-02 18:04:56', '2025-11-02 18:09:51'),
(310, '3tpeGa9louoWrDnvCDmD', 483, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-02 18:09:51', NULL, '2025-11-02 18:09:51', '2025-11-02 18:09:51'),
(311, 'pijmUqDyR472FiCDWnqW', 532, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 13:30:58', NULL, '2025-11-03 13:31:04', '2025-11-03 13:31:04'),
(312, 'o0s46dl8XNsI7USCwIBU', 492, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:05:55', '2025-11-03 14:13:34', '2025-11-03 14:05:55', '2025-11-03 14:13:34'),
(313, 'ZrlLIkjXyMW3PPC7TGrt', 494, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:12:26', NULL, '2025-11-03 14:12:26', '2025-11-03 14:12:26'),
(314, 'ZrlLIkjXyMW3PPC7TGrt', 494, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:12:26', NULL, '2025-11-03 14:12:26', '2025-11-03 14:12:26'),
(315, 'zfR6e6lOb5BKDULJzAhV', 487, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:12:47', '2025-11-03 14:16:56', '2025-11-03 14:12:47', '2025-11-03 14:16:56'),
(316, 'HLz2XVkswExZmDzjrcwi', 490, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:12:48', NULL, '2025-11-03 14:12:48', '2025-11-03 14:12:48'),
(317, 'HLz2XVkswExZmDzjrcwi', 490, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:12:48', NULL, '2025-11-03 14:12:48', '2025-11-03 14:12:48'),
(318, 'OO3R592uIRirpXLV5haD', 493, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:13:08', '2025-11-03 14:17:26', '2025-11-03 14:13:08', '2025-11-03 14:17:26'),
(319, 'OO3R592uIRirpXLV5haD', 493, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:13:08', '2025-11-03 14:17:26', '2025-11-03 14:13:08', '2025-11-03 14:17:26'),
(320, 'o0s46dl8XNsI7USCwIBU', 492, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 14:13:34', NULL, '2025-11-03 14:13:34', '2025-11-03 14:13:34'),
(321, 'o0s46dl8XNsI7USCwIBU', 492, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 14:13:34', NULL, '2025-11-03 14:13:34', '2025-11-03 14:13:34'),
(322, 'q7RlSKexz8OVZtNYVo1k', 533, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:14:47', '2025-11-03 14:26:14', '2025-11-03 14:15:15', '2025-11-03 14:26:14'),
(323, 'gejQs8t5sffY8HiZKYqi', 517, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:16:22', NULL, '2025-11-03 14:16:22', '2025-11-03 14:16:22'),
(324, 'zfR6e6lOb5BKDULJzAhV', 487, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 14:16:56', NULL, '2025-11-03 14:16:56', '2025-11-03 14:16:56'),
(325, 'OO3R592uIRirpXLV5haD', 493, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 14:17:26', NULL, '2025-11-03 14:17:26', '2025-11-03 14:17:26'),
(326, 'OO3R592uIRirpXLV5haD', 493, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 14:17:26', NULL, '2025-11-03 14:17:26', '2025-11-03 14:17:26'),
(327, 'q7RlSKexz8OVZtNYVo1k', 533, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:26:14', '2025-11-04 14:04:39', '2025-11-03 14:26:14', '2025-11-04 14:04:39'),
(328, 'q7RlSKexz8OVZtNYVo1k', 533, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:26:14', '2025-11-04 14:04:39', '2025-11-03 14:26:14', '2025-11-04 14:04:39'),
(329, 'eUa3iALaNfDYbHXZlNzB', 508, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:41:26', '2025-11-03 14:46:30', '2025-11-03 14:41:26', '2025-11-03 14:46:30'),
(330, 'eUa3iALaNfDYbHXZlNzB', 508, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:41:26', '2025-11-03 14:46:30', '2025-11-03 14:41:26', '2025-11-03 14:46:30'),
(331, 'fCeBUMnznETQ97uiJL6M', 525, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:41:33', '2025-11-03 14:46:34', '2025-11-03 14:41:33', '2025-11-03 14:46:34'),
(332, 'eUa3iALaNfDYbHXZlNzB', 508, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 14:46:30', NULL, '2025-11-03 14:46:30', '2025-11-03 14:46:30'),
(333, 'fCeBUMnznETQ97uiJL6M', 525, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 14:46:34', NULL, '2025-11-03 14:46:34', '2025-11-03 14:46:34'),
(334, 'uonGiVzAmLP2bb4Iht3x', 534, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 14:52:55', NULL, '2025-11-03 14:52:58', '2025-11-03 14:52:58'),
(335, 'vjgZaUr3dXsWfPjulMgD', 531, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 15:00:15', '2025-11-03 15:09:02', '2025-11-03 15:00:15', '2025-11-03 15:09:02'),
(336, 'vjgZaUr3dXsWfPjulMgD', 531, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 15:00:15', '2025-11-03 15:09:02', '2025-11-03 15:00:15', '2025-11-03 15:09:02'),
(337, 'VvBXDddpRNSej4b29PLK', 527, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 15:01:28', '2025-11-03 15:10:01', '2025-11-03 15:01:28', '2025-11-03 15:10:01'),
(338, 'VvBXDddpRNSej4b29PLK', 527, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 15:01:28', '2025-11-03 15:10:01', '2025-11-03 15:01:28', '2025-11-03 15:10:01'),
(339, 'QzkvDJN0bvJfQ7Q7WEew', 529, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 15:01:33', '2025-11-03 15:09:48', '2025-11-03 15:01:33', '2025-11-03 15:09:48'),
(340, 'QzkvDJN0bvJfQ7Q7WEew', 529, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 15:01:33', '2025-11-03 15:09:48', '2025-11-03 15:01:33', '2025-11-03 15:09:48'),
(341, 'vjgZaUr3dXsWfPjulMgD', 531, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 15:09:02', NULL, '2025-11-03 15:09:02', '2025-11-03 15:09:02'),
(342, 'QzkvDJN0bvJfQ7Q7WEew', 529, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 15:09:48', NULL, '2025-11-03 15:09:48', '2025-11-03 15:09:48'),
(343, 'VvBXDddpRNSej4b29PLK', 527, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 15:10:01', NULL, '2025-11-03 15:10:01', '2025-11-03 15:10:01'),
(344, 'AkrVDaOm4OmfILIYLizB', 520, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 15:23:13', '2025-11-03 15:23:14', '2025-11-03 15:23:13', '2025-11-03 15:23:14'),
(345, 'AkrVDaOm4OmfILIYLizB', 520, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 15:23:13', '2025-11-03 15:23:14', '2025-11-03 15:23:13', '2025-11-03 15:23:14'),
(346, 'AkrVDaOm4OmfILIYLizB', 520, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-11-03 15:23:14', NULL, '2025-11-03 15:23:14', '2025-11-03 15:23:14'),
(347, '9WGPYsTnKSymxk5cv9Ii', 535, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 17:45:34', '2025-11-03 17:49:48', '2025-11-03 17:45:36', '2025-11-03 17:49:48'),
(348, '9WGPYsTnKSymxk5cv9Ii', 535, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 17:49:48', '2025-11-03 18:35:46', '2025-11-03 17:49:48', '2025-11-03 18:35:46'),
(349, '9WGPYsTnKSymxk5cv9Ii', 535, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 17:49:48', '2025-11-03 18:35:46', '2025-11-03 17:49:48', '2025-11-03 18:35:46'),
(350, '9WGPYsTnKSymxk5cv9Ii', 535, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 18:35:46', '2025-11-03 18:40:45', '2025-11-03 18:35:46', '2025-11-03 18:40:45'),
(351, '9WGPYsTnKSymxk5cv9Ii', 535, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 18:35:46', '2025-11-03 18:40:45', '2025-11-03 18:35:46', '2025-11-03 18:40:45'),
(352, 'SJc2erYt4BpSM3HCYxmf', 526, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 18:38:19', '2025-11-03 18:43:23', '2025-11-03 18:38:19', '2025-11-03 18:43:23'),
(353, 'QR4GRdsnECAjv9mRskdv', 524, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 18:38:49', '2025-11-03 18:43:54', '2025-11-03 18:38:49', '2025-11-03 18:43:54'),
(354, '9WGPYsTnKSymxk5cv9Ii', 535, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 18:40:45', NULL, '2025-11-03 18:40:45', '2025-11-03 18:40:45'),
(355, '9WGPYsTnKSymxk5cv9Ii', 535, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 18:40:45', NULL, '2025-11-03 18:40:45', '2025-11-03 18:40:45'),
(356, 'SJc2erYt4BpSM3HCYxmf', 526, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 18:43:23', NULL, '2025-11-03 18:43:23', '2025-11-03 18:43:23'),
(357, 'QR4GRdsnECAjv9mRskdv', 524, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 18:43:54', NULL, '2025-11-03 18:43:54', '2025-11-03 18:43:54'),
(358, 'QR4GRdsnECAjv9mRskdv', 524, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 18:43:54', NULL, '2025-11-03 18:43:54', '2025-11-03 18:43:54'),
(359, 'MEy6nwUH8h5zS55azZQf', 536, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 19:21:12', NULL, '2025-11-03 19:21:14', '2025-11-03 19:21:14'),
(360, 'hEfITXRfYKQYsEuW4Z21', 537, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 19:33:43', '2025-11-03 21:01:17', '2025-11-03 19:33:45', '2025-11-03 21:01:17'),
(361, 'VIJ8WfurCmxU7Z0tTuY8', 538, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-11-03 19:43:36', NULL, '2025-11-03 19:43:38', '2025-11-03 19:43:38'),
(362, 'PzTQgdL4M7OUP1vuNc7S', 539, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 20:36:53', '2025-11-03 20:39:16', '2025-11-03 20:36:55', '2025-11-03 20:39:16'),
(363, 'PzTQgdL4M7OUP1vuNc7S', 539, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 20:39:16', NULL, '2025-11-03 20:39:16', '2025-11-03 20:39:16'),
(364, 'rtvnJrZqKcpQe6fsx1iy', 502, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 20:47:13', '2025-11-03 20:52:15', '2025-11-03 20:47:13', '2025-11-03 20:52:15'),
(365, 'rtvnJrZqKcpQe6fsx1iy', 502, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 20:47:13', '2025-11-03 20:52:15', '2025-11-03 20:47:13', '2025-11-03 20:52:15'),
(366, 'rtvnJrZqKcpQe6fsx1iy', 502, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 20:52:15', NULL, '2025-11-03 20:52:15', '2025-11-03 20:52:15'),
(367, 'aQqem0bpurFoTG0uRhCL', 503, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 20:55:04', '2025-11-03 21:02:38', '2025-11-03 20:55:04', '2025-11-03 21:02:38'),
(368, 'hEfITXRfYKQYsEuW4Z21', 537, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 21:01:17', '2025-11-03 21:01:55', '2025-11-03 21:01:17', '2025-11-03 21:01:55'),
(369, 'hEfITXRfYKQYsEuW4Z21', 537, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 21:01:17', '2025-11-03 21:01:55', '2025-11-03 21:01:17', '2025-11-03 21:01:55'),
(370, 'hEfITXRfYKQYsEuW4Z21', 537, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 21:01:55', NULL, '2025-11-03 21:01:55', '2025-11-03 21:01:55'),
(371, 'aQqem0bpurFoTG0uRhCL', 503, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 21:02:38', NULL, '2025-11-03 21:02:38', '2025-11-03 21:02:38'),
(372, 'f5KoXTjenovku8xZfp2T', 504, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 21:38:06', '2025-11-03 21:43:06', '2025-11-03 21:38:06', '2025-11-03 21:43:06'),
(373, 'f5KoXTjenovku8xZfp2T', 504, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-03 21:38:06', '2025-11-03 21:43:06', '2025-11-03 21:38:06', '2025-11-03 21:43:06'),
(374, 'f5KoXTjenovku8xZfp2T', 504, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-03 21:43:06', NULL, '2025-11-03 21:43:06', '2025-11-03 21:43:06'),
(375, 'tPvR8pJXNvQprBOqcCbK', 540, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 13:29:28', '2025-11-04 13:41:52', '2025-11-04 13:29:30', '2025-11-04 13:41:52'),
(376, 'tPvR8pJXNvQprBOqcCbK', 540, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 13:41:52', '2025-11-04 18:53:12', '2025-11-04 13:41:52', '2025-11-04 18:53:12'),
(377, 'tPvR8pJXNvQprBOqcCbK', 540, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 13:41:53', '2025-11-04 18:53:12', '2025-11-04 13:41:53', '2025-11-04 18:53:12'),
(378, 'kSrZMeDPLmZGbvwdG4EL', 541, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 13:57:29', '2025-11-04 14:00:13', '2025-11-04 13:57:31', '2025-11-04 14:00:13'),
(379, 'kSrZMeDPLmZGbvwdG4EL', 541, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 14:00:13', NULL, '2025-11-04 14:00:13', '2025-11-04 14:00:13'),
(380, 'q7RlSKexz8OVZtNYVo1k', 533, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 14:04:39', '2025-11-04 14:04:49', '2025-11-04 14:04:39', '2025-11-04 14:04:49'),
(381, 'q7RlSKexz8OVZtNYVo1k', 533, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-11-04 14:04:49', NULL, '2025-11-04 14:04:49', '2025-11-04 14:04:49'),
(382, 'H0B8MfHHSEj32YMBYt9j', 542, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 14:42:37', NULL, '2025-11-04 14:42:39', '2025-11-04 14:42:39'),
(383, 'LNP7vk36R4Wql4LhHKfi', 543, '0da3f05b-d809-40b5-8f83-71913fc96dd1', 'nl32t7MUfkhrOZN4sNeT', '2025-11-04 15:28:19', NULL, '2025-11-04 15:28:22', '2025-11-04 15:28:22'),
(384, '6ARUkATsxHtybsmkhY0W', 544, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:06:34', NULL, '2025-11-04 18:06:44', '2025-11-04 18:06:44'),
(385, '7eZmGzDsW35iNaEK9OcY', 545, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:27:46', '2025-11-04 18:32:37', '2025-11-04 18:27:48', '2025-11-04 18:32:37'),
(386, '7eZmGzDsW35iNaEK9OcY', 545, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:32:37', '2025-11-04 18:44:20', '2025-11-04 18:32:37', '2025-11-04 18:44:20'),
(387, '7eZmGzDsW35iNaEK9OcY', 545, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:32:37', '2025-11-04 18:44:20', '2025-11-04 18:32:37', '2025-11-04 18:44:20'),
(388, 'eRfO67UmKrmzEMCIrUpk', 546, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:34:40', '2025-11-04 19:05:33', '2025-11-04 18:34:42', '2025-11-04 19:05:33'),
(389, '2X4c2ThOmK5cddjG56f4', 547, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:39:57', '2025-11-04 18:48:09', '2025-11-04 18:39:59', '2025-11-04 18:48:09'),
(390, '7eZmGzDsW35iNaEK9OcY', 545, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:44:20', '2025-11-04 18:44:22', '2025-11-04 18:44:20', '2025-11-04 18:44:22'),
(391, '7eZmGzDsW35iNaEK9OcY', 545, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-11-04 18:44:22', NULL, '2025-11-04 18:44:22', '2025-11-04 18:44:22'),
(392, '2X4c2ThOmK5cddjG56f4', 547, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:48:09', '2025-11-04 18:52:34', '2025-11-04 18:48:09', '2025-11-04 18:52:34'),
(393, '2L3dQoOP9fr1aS3zaHKh', 548, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:52:17', '2025-11-05 14:20:53', '2025-11-04 18:52:19', '2025-11-05 14:20:53'),
(394, '2X4c2ThOmK5cddjG56f4', 547, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:52:34', '2025-11-04 18:57:37', '2025-11-04 18:52:34', '2025-11-04 18:57:37'),
(395, 'tPvR8pJXNvQprBOqcCbK', 540, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:53:12', '2025-11-04 18:58:17', '2025-11-04 18:53:12', '2025-11-04 18:58:17'),
(396, 'tPvR8pJXNvQprBOqcCbK', 540, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:53:12', '2025-11-04 18:58:17', '2025-11-04 18:53:12', '2025-11-04 18:58:17'),
(397, '7kjc0JZlTjEDgyWYORxY', 523, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:55:58', '2025-11-04 19:02:20', '2025-11-04 18:55:58', '2025-11-04 19:02:20'),
(398, 'T3mj9rh4qOqsWuZLog51', 519, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:56:15', '2025-11-04 19:02:17', '2025-11-04 18:56:15', '2025-11-04 19:02:17'),
(399, 'T3mj9rh4qOqsWuZLog51', 519, '1d26e2b0-6fcf-4e1d-a2d8-91a67a953058', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 18:56:15', '2025-11-04 19:02:17', '2025-11-04 18:56:15', '2025-11-04 19:02:17'),
(400, '2X4c2ThOmK5cddjG56f4', 547, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-04 18:57:37', NULL, '2025-11-04 18:57:37', '2025-11-04 18:57:37'),
(401, 'tPvR8pJXNvQprBOqcCbK', 540, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-04 18:58:17', NULL, '2025-11-04 18:58:17', '2025-11-04 18:58:17'),
(402, 'tPvR8pJXNvQprBOqcCbK', 540, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-04 18:58:17', NULL, '2025-11-04 18:58:17', '2025-11-04 18:58:17'),
(403, 'T3mj9rh4qOqsWuZLog51', 519, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-04 19:02:17', NULL, '2025-11-04 19:02:17', '2025-11-04 19:02:17'),
(404, 'T3mj9rh4qOqsWuZLog51', 519, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-04 19:02:17', NULL, '2025-11-04 19:02:17', '2025-11-04 19:02:17'),
(405, '7kjc0JZlTjEDgyWYORxY', 523, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-04 19:02:20', NULL, '2025-11-04 19:02:20', '2025-11-04 19:02:20'),
(406, 'eRfO67UmKrmzEMCIrUpk', 546, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 19:05:33', NULL, '2025-11-04 19:05:33', '2025-11-04 19:05:33'),
(407, 'zDHUWeq7lpTu4mwGodOq', 549, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 19:09:02', '2025-11-04 19:35:42', '2025-11-04 19:09:04', '2025-11-04 19:35:42'),
(408, 'Apu5MUZFUXdEdWSDrSE9', 550, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 19:09:17', '2025-11-04 19:11:59', '2025-11-04 19:09:19', '2025-11-04 19:11:59'),
(409, 'Apu5MUZFUXdEdWSDrSE9', 550, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 19:11:59', '2025-11-04 19:18:52', '2025-11-04 19:11:59', '2025-11-04 19:18:52'),
(410, '0Ut3FsxR3euF80RXiJoM', 551, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 19:15:27', NULL, '2025-11-04 19:15:29', '2025-11-04 19:15:29'),
(411, 'Apu5MUZFUXdEdWSDrSE9', 550, 'cf5725aa-9e08-4bc8-87db-da8229e7c978', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 19:18:52', '2025-11-04 19:18:55', '2025-11-04 19:18:52', '2025-11-04 19:18:55'),
(412, 'Apu5MUZFUXdEdWSDrSE9', 550, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-11-04 19:18:55', NULL, '2025-11-04 19:18:55', '2025-11-04 19:18:55'),
(413, 'Apu5MUZFUXdEdWSDrSE9', 550, '751a24be-4e11-426f-8cf5-180ea573bbbf', 'bKzXACEFizwejXvHRDxo', '2025-11-04 19:18:55', NULL, '2025-11-04 19:18:55', '2025-11-04 19:18:55'),
(414, 'hjFfKJHPotMUPMUlTnZb', 552, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 19:19:23', NULL, '2025-11-04 19:19:26', '2025-11-04 19:19:26'),
(415, 'QDmCxpUPAu2hA7IGQKTi', 553, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 19:22:52', '2025-11-04 22:57:30', '2025-11-04 19:22:54', '2025-11-04 22:57:30'),
(416, 'zDHUWeq7lpTu4mwGodOq', 549, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 19:35:42', NULL, '2025-11-04 19:35:42', '2025-11-04 19:35:42'),
(417, 'zDHUWeq7lpTu4mwGodOq', 549, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 19:35:42', NULL, '2025-11-04 19:35:42', '2025-11-04 19:35:42'),
(418, 'q62vmM8qdzF19DooYkw5', 554, '1f2449f4-df33-4c88-8dec-a2631df0224d', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 20:17:28', '2025-11-04 21:35:22', '2025-11-04 20:17:31', '2025-11-04 21:35:22'),
(419, 'q62vmM8qdzF19DooYkw5', 554, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 21:35:22', NULL, '2025-11-04 21:35:22', '2025-11-04 21:35:22'),
(420, 'q62vmM8qdzF19DooYkw5', 554, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 21:35:22', NULL, '2025-11-04 21:35:22', '2025-11-04 21:35:22'),
(421, 'QDmCxpUPAu2hA7IGQKTi', 553, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 22:57:30', NULL, '2025-11-04 22:57:30', '2025-11-04 22:57:30'),
(422, 'QDmCxpUPAu2hA7IGQKTi', 553, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-04 22:57:30', NULL, '2025-11-04 22:57:30', '2025-11-04 22:57:30'),
(423, 'JjXSRmakbRiEGHLXJn7S', 281, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-05 00:55:05', NULL, '2025-11-05 00:55:05', '2025-11-05 00:55:05'),
(424, 'JjXSRmakbRiEGHLXJn7S', 281, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-05 00:55:05', NULL, '2025-11-05 00:55:05', '2025-11-05 00:55:05'),
(425, 'YfyIJivsNhp4yNOJMP6T', 282, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-05 00:55:06', NULL, '2025-11-05 00:55:06', '2025-11-05 00:55:06'),
(426, 'YfyIJivsNhp4yNOJMP6T', 282, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-05 00:55:06', NULL, '2025-11-05 00:55:06', '2025-11-05 00:55:06'),
(427, 'ez5kjvDj2B4lHgCsKzlF', 293, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-05 00:55:07', NULL, '2025-11-05 00:55:07', '2025-11-05 00:55:07'),
(428, 'ez5kjvDj2B4lHgCsKzlF', 293, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-05 00:55:07', NULL, '2025-11-05 00:55:07', '2025-11-05 00:55:07'),
(429, 't20KV93zimMA0aw4iziD', 288, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-05 00:55:09', NULL, '2025-11-05 00:55:09', '2025-11-05 00:55:09'),
(430, 'F8olo06NOlxVFxOMkLyZ', 290, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-05 00:55:15', NULL, '2025-11-05 00:55:15', '2025-11-05 00:55:15'),
(431, 'F8olo06NOlxVFxOMkLyZ', 290, '261d8f1e-6eb7-40f7-ab33-9b1e1039d451', 'kaxdiIP8PvvJDHLAZiXB', '2025-11-05 00:55:15', NULL, '2025-11-05 00:55:15', '2025-11-05 00:55:15'),
(432, '2L3dQoOP9fr1aS3zaHKh', 548, '881aa53d-ed8c-4a65-af1b-1c2e78f3f4ef', 'WRGbvJVUqUccggy5ZqF2', '2025-11-05 14:20:53', NULL, '2025-11-05 14:20:53', '2025-11-05 14:20:53');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag_name`, `location_id`, `created_at`, `updated_at`) VALUES
(234, 'paid', '8gm7q9rR8M1dcm9kMsiq', '2025-11-04 22:08:04', '2025-11-04 22:08:04');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `ghl_api_key` varchar(255) DEFAULT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 2,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `image` varchar(255) DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `location_id` varchar(255) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `ghl_api_key`, `role`, `status`, `image`, `added_by`, `location_id`, `assigned_to`) VALUES
(75, 'Admin', 'superadmin@gmail.com', NULL, '$2y$12$Px2.g7rLJAFl/aM7A8/5Hukig5MkrtNNfKwTYvx9QrqXC0Iao1frO', 'ZHhzjXZb2Y6rsywIk1aWqNqxZp3245JqzeQ4Y4uJgdZjO6uHLQbfl4qCVuV1', '2025-08-28 18:05:13', '2025-08-28 18:05:13', NULL, 1, 1, NULL, NULL, '8gm7q9rR8M1dcm9kMsiq', NULL),
(76, 'Griffendea', 'Griffendea@gmail.com', NULL, '$2y$12$VXCSY6KJEzsi.uKk0cNMEOO9Z7UKTo3u0o.f9Pu9sQSApTvu3ccDC', NULL, '2025-08-28 18:11:19', '2025-10-23 21:28:49', NULL, 2, 1, NULL, NULL, 'kiRfOKDyVWVbujuWVIdV', NULL),
(77, 'Abdul ', 'ch1881191@gmail.com', NULL, '$2y$12$wtTL2dWh5Xws9hz8Bw92/OJ5IhK0DU9VUj7uFQobgodIiP0hDciuK', NULL, '2025-09-01 18:18:37', '2025-09-12 12:44:02', NULL, 3, 1, NULL, NULL, NULL, 76),
(97, 'Abegail', 'abeping918@gmail.com', NULL, '$2y$12$/xVSXWjrPEMcghfo9lOUIOTRBA.ICfIZbuDhuli0bLVQBL06AGrRi', NULL, '2025-10-29 17:47:03', '2025-10-29 17:47:03', NULL, 3, 1, NULL, NULL, NULL, 76),
(98, 'Anas', 'anasabid078@gmail.com', NULL, '$2y$12$x5VI/SNrwpC1wtE3d2qJDeu.TlCBeewavM66RU62o2mJOePrwISo.', NULL, '2025-10-29 17:47:03', '2025-10-29 17:47:03', NULL, 3, 1, NULL, NULL, NULL, 76),
(99, 'Hamza', 'developerhamza95@gmail.com', NULL, '$2y$12$Gl6RjcLz9FdqU5LvJn6cnOZ5.jD1nRC9gOuUQDt/8vgoI8cMO.8YS', NULL, '2025-10-29 17:47:03', '2025-10-29 17:47:03', NULL, 3, 1, NULL, NULL, NULL, 76),
(100, 'Roynel', 'thoucallmestan@gmail.com', NULL, '$2y$12$3b0vWrx3nKkk4ZlbArLWCO0A9NaAjMFqBmY9qqHM/VhN8OzuuTao.', NULL, '2025-10-29 17:47:03', '2025-10-29 17:47:03', NULL, 3, 1, NULL, NULL, NULL, 76),
(101, 'Xortlogix', 'Xortlogix@gmail.com', NULL, '$2y$12$KeaFvIR5Mj2i0.yeX2FluOdlsuhmsAg2HEHzSRv5pGXYW/DgH0jhO', NULL, '2025-10-29 17:47:03', '2025-10-29 17:47:03', NULL, 3, 1, NULL, NULL, NULL, 76);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_details`
--
ALTER TABLE `business_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_details_invoice_id_foreign` (`invoice_id`);

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
-- Indexes for table `calendars`
--
ALTER TABLE `calendars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_locations`
--
ALTER TABLE `company_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contacts_email_unique` (`email`);

--
-- Indexes for table `contact_custom_fields`
--
ALTER TABLE `contact_custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_custom_fields_custom_field_id_foreign` (`custom_field_id`),
  ADD KEY `contact_custom_fields_contact_id_foreign` (`contact_id`);

--
-- Indexes for table `contact_tags`
--
ALTER TABLE `contact_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contact_tags_contact` (`contact_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_values`
--
ALTER TABLE `custom_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `ghl_auths`
--
ALTER TABLE `ghl_auths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ghl_auths_user_id_foreign` (`user_id`);

--
-- Indexes for table `ghl_users`
--
ALTER TABLE `ghl_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ghl_users_email_unique` (`email`),
  ADD KEY `ghl_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_items_invoice` (`invoice_id`);

--
-- Indexes for table `location_details`
--
ALTER TABLE `location_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `location_id` (`location_id`),
  ADD KEY `location_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opportunities`
--
ALTER TABLE `opportunities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opportunity_stage_logs`
--
ALTER TABLE `opportunity_stage_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_opportunity_per_day` (`opportunity_id`,`logged_date`),
  ADD KEY `pipeline_id_index` (`pipeline_id`),
  ADD KEY `stage_id_index` (`stage_id`),
  ADD KEY `logged_date_index` (`logged_date`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pipelines`
--
ALTER TABLE `pipelines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pipeline_stages`
--
ALTER TABLE `pipeline_stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pipeline_stages_pipeline_id_foreign` (`pipeline_id`);

--
-- Indexes for table `rename_menus`
--
ALTER TABLE `rename_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contact_id` (`contact_id`),
  ADD KEY `assigned_user_id` (`assigned_user_id`);

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
  ADD KEY `settings_user_id_foreign` (`user_id`);

--
-- Indexes for table `stage_change_logs`
--
ALTER TABLE `stage_change_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
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
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `business_details`
--
ALTER TABLE `business_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calendars`
--
ALTER TABLE `calendars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_locations`
--
ALTER TABLE `company_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=476;

--
-- AUTO_INCREMENT for table `contact_custom_fields`
--
ALTER TABLE `contact_custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=906;

--
-- AUTO_INCREMENT for table `contact_tags`
--
ALTER TABLE `contact_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=928;

--
-- AUTO_INCREMENT for table `custom_values`
--
ALTER TABLE `custom_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ghl_auths`
--
ALTER TABLE `ghl_auths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ghl_users`
--
ALTER TABLE `ghl_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location_details`
--
ALTER TABLE `location_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1847;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `opportunities`
--
ALTER TABLE `opportunities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=555;

--
-- AUTO_INCREMENT for table `opportunity_stage_logs`
--
ALTER TABLE `opportunity_stage_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pipelines`
--
ALTER TABLE `pipelines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `pipeline_stages`
--
ALTER TABLE `pipeline_stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `rename_menus`
--
ALTER TABLE `rename_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stage_change_logs`
--
ALTER TABLE `stage_change_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `business_details`
--
ALTER TABLE `business_details`
  ADD CONSTRAINT `business_details_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `contact_custom_fields`
--
ALTER TABLE `contact_custom_fields`
  ADD CONSTRAINT `contact_custom_fields_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contact_custom_fields_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_tags`
--
ALTER TABLE `contact_tags`
  ADD CONSTRAINT `fk_contact_tags_contact` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ghl_auths`
--
ALTER TABLE `ghl_auths`
  ADD CONSTRAINT `ghl_auths_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ghl_users`
--
ALTER TABLE `ghl_users`
  ADD CONSTRAINT `ghl_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `fk_items_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `location_details`
--
ALTER TABLE `location_details`
  ADD CONSTRAINT `location_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pipeline_stages`
--
ALTER TABLE `pipeline_stages`
  ADD CONSTRAINT `pipeline_stages_pipeline_id_foreign` FOREIGN KEY (`pipeline_id`) REFERENCES `pipelines` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
