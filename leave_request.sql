-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2018 at 11:48 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_request`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dept_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `name`) VALUES
(1, 'Engineering'),
(2, 'Agriculture'),
(3, 'Science'),
(4, 'Law and Ethics'),
(5, 'Fashion'),
(6, 'Zoology'),
(7, 'Industry'),
(8, 'Fishery');

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT 'Vacation_leave, Personal_Errand_leave,Sick_leave',
  `details` varchar(255) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true, false',
  `days_period_of_leave` float NOT NULL,
  `main_user_id` int(11) UNSIGNED NOT NULL,
  `sub_user_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_user_approve` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'true, false',
  `involved_task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `type`, `details`, `approved`, `days_period_of_leave`, `main_user_id`, `sub_user_id`, `sub_user_approve`, `involved_task_id`) VALUES
(1, 'Vacation', 'Yeah', 0, 5, 3, 4, 0, 1),
(2, 'Sick', 'flu', 0, 6, 3, 4, 1, 2),
(3, 'Sick', 'Ohhhhhhh', 1, 9, 4, 3, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '32OaEYkbcD4TALeE1F6Sg0adsXAAeO6UbKR4xpp8', 'http://localhost', 1, 0, 0, '2018-05-16 08:24:11', '2018-05-16 08:24:11'),
(2, NULL, 'Laravel Password Grant Client', 'FghyAk0guQC7Gm09wAoLcA0Uo3tnoYAQcLOy1SYV', 'http://localhost', 0, 1, 0, '2018-05-16 08:24:11', '2018-05-16 08:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2018-05-16 08:24:11', '2018-05-16 08:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `deadline` datetime NOT NULL,
  `user_id` int(255) NOT NULL,
  `done` tinyint(1) NOT NULL DEFAULT '0',
  `priority` varchar(255) DEFAULT NULL COMMENT 'low,mid,hi',
  `expected_date` datetime(6) DEFAULT NULL,
  `accepted` tinyint(1) NOT NULL DEFAULT '0',
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `title`, `detail`, `deadline`, `user_id`, `done`, `priority`, `expected_date`, `accepted`, `updated_at`, `created_at`) VALUES
(1, 'Get all the chicks', 'Eat some chickens', '2018-05-31 05:00:00', 3, 0, NULL, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Ride some horses', 'There are some small horses to ride nearby.', '2018-05-30 03:00:00', 4, 0, NULL, NULL, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Testing Now', 'testing testing', '2018-05-31 05:00:00', 3, 0, NULL, NULL, 0, '2018-05-18 05:25:12', '2018-05-18 05:25:12'),
(5, 'czxczxc', 'vzxczxc', '2018-05-30 13:00:00', 3, 0, NULL, NULL, 0, '2018-05-18 06:11:54', '2018-05-18 06:11:54'),
(6, 'Error', 'Cannot display details', '2018-05-29 14:00:00', 4, 0, NULL, NULL, 0, '2018-05-18 06:16:17', '2018-05-18 06:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `facebook` varchar(255) NOT NULL DEFAULT '',
  `lineid` varchar(255) NOT NULL DEFAULT '',
  `tel` varchar(255) NOT NULL DEFAULT '',
  `ig` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `dept_id` int(11) UNSIGNED DEFAULT NULL,
  `profile_image_src` varchar(255) DEFAULT NULL,
  `super_id` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `fullname`, `address`, `facebook`, `lineid`, `tel`, `ig`, `type`, `dept_id`, `profile_image_src`, `super_id`) VALUES
(1, 'jzrlza', 'jj@jj.com', 'abcdef', NULL, NULL, NULL, 'JJ Parinvut', 'Somewhere', 'JJParinvut', '', '', '', 'Administrator', NULL, '', NULL),
(2, 'randomware', 'random@ware.com', '12222', NULL, NULL, NULL, 'Random Big', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(3, 'Hally', 'Hall@riot.com', 'rrrroooo', NULL, NULL, NULL, 'Hallyware', '', '', '', '', '', 'Subordinate', 1, '', 2),
(4, 'Tallfilly', 'tall@filly.com', 'footer', NULL, NULL, NULL, 'Gallop Bana', '', '', '', '', '', 'Subordinate', 1, '', 2),
(5, 'Fricka', 'fffaaa@ka.com', 'erwfdsf', NULL, NULL, NULL, 'Ficka Fricka', '', '', '', '', '', 'Supervisor', 5, '', NULL),
(6, 'Zapper', 'zippy@zapper.com', '', NULL, '2018-05-17 23:37:31', '2018-05-17 23:37:31', '', '', '', '', '', '', 'Supervisor', 2, '', NULL),
(7, 'Hiho', 'hhh@hotmail.com', '', NULL, '2018-05-18 01:53:29', '2018-05-18 01:53:29', '', '', '', '', '', '', 'Supervisor', 2, '', NULL),
(8, 'Hihon', 'hack@hotmail.com', '', NULL, '2018-05-18 01:54:12', '2018-05-18 01:54:12', '', '', '', '', '', '', 'Subordinate', 3, '', NULL),
(9, 'Gunner', 'Gunny@gun.com', '', NULL, '2018-05-18 01:55:30', '2018-05-18 01:55:30', '', '', '', '', '', '', 'Supervisor', 4, '', 6),
(10, 'sssssssss', 'sssssx2@ssasa.com', '', NULL, '2018-05-18 02:00:24', '2018-05-18 02:00:24', '', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(11, 'asdasdawe', 'zxczxczxc@casdsf.com', '', NULL, '2018-05-18 02:02:55', '2018-05-18 02:02:55', '', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(12, 'yaranaika', 'takakazu@kirby.com', '', NULL, '2018-05-18 02:06:41', '2018-05-18 02:06:41', '', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(13, 'aragrgargrgghhh', 'gfaasd@jfdf.com', '', NULL, '2018-05-18 02:12:16', '2018-05-18 02:12:16', '', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(14, 'asdasdasd', 'aasdasdasd@sdzhcads.com', '', NULL, '2018-05-18 02:15:37', '2018-05-18 02:15:37', '', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(15, 'asdasdasda', 'sdsaasdasdsdas@dasdasd.com', '', NULL, '2018-05-18 02:20:04', '2018-05-18 02:20:04', '', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(16, 'cxzczxczxczxcz', 'zxczxczczx@ascads.com', '', NULL, '2018-05-18 02:21:38', '2018-05-18 02:21:38', '', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(17, 'zxczxc', 'zxczxczxczxccz@dcac.com', '', NULL, '2018-05-18 02:23:04', '2018-05-18 02:23:04', '', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(18, 'lllllllllllllllll', 'lllllllllll@llllllll.com', '', NULL, '2018-05-18 02:25:20', '2018-05-18 02:25:20', '', '', '', '', '', '', 'Subordinate', 1, '', 14),
(19, 'rrrrr', 'rrr@kkfdf.com', '', NULL, '2018-05-18 02:39:21', '2018-05-18 02:39:21', '', '', '', '', '', '', 'Supervisor', 1, '', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_main_user_id` (`main_user_id`),
  ADD KEY `foreign_sub_user_id` (`sub_user_id`),
  ADD KEY `foreign_involved_task_id` (`involved_task_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`);

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
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
