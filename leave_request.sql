-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2018 at 01:28 PM
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

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00c2bccd36cf59131e4cca1704854eb2b9d6c31f7262dc3e34e1f5484fe6fea1692771e151355c0a', 1, 1, 'token', '[]', 0, '2018-05-18 03:29:28', '2018-05-18 03:29:28', '2019-05-18 10:29:28'),
('0bb4e309d4f8d69027dcb92b917b5d4468b928ebe02ad221d23a87ad4bbc966778ae449f921ae96c', 1, 1, 'token', '[]', 0, '2018-05-18 03:32:18', '2018-05-18 03:32:18', '2019-05-18 10:32:18'),
('0cf8b4fc4ff02076476f62ae3f5ba18855ebc3e22da7698a7ac78cd711c9e0278138879b7d06320a', 8, 1, 'token', '[]', 0, '2018-05-18 04:13:28', '2018-05-18 04:13:28', '2019-05-18 11:13:28'),
('1caef429d614c9a263b3069f2a28c8bbd1e990eb7b4f02e36fe9f08cbf4983bd01881a3312ee737d', 1, 1, 'token', '[]', 0, '2018-05-18 04:09:12', '2018-05-18 04:09:12', '2019-05-18 11:09:12'),
('1d6119d5405bce2f4a3a254c3989a650a55e488941cdc13c1f139c920232970195d0019f3f5f4eb2', 1, 1, 'token', '[]', 0, '2018-05-18 03:54:28', '2018-05-18 03:54:28', '2019-05-18 10:54:28'),
('1db716a923852de10af0e0fbb1ac1a2b02a4b7b15cd1757186661ac6855595862b9d1aa49e3252a2', 8, 1, 'token', '[]', 0, '2018-05-18 04:13:31', '2018-05-18 04:13:31', '2019-05-18 11:13:31'),
('1e72d8295723345f90ccc9fcc36686ea9aa2b8f97f672cf867954b03ac1ee905ea7e7ed12f6a7769', 1, 1, 'token', '[]', 0, '2018-05-18 21:57:29', '2018-05-18 21:57:29', '2019-05-19 04:57:29'),
('1f1427632983eb94e05012e1ea1c78da827ba10784e015ed1c0d99e02c2dfe6e71ed09a417e3b2b2', 1, 1, 'token', '[]', 0, '2018-05-18 21:58:43', '2018-05-18 21:58:43', '2019-05-19 04:58:43'),
('1f5861610e402541e4cd98dc63864687458639ac68fa985dc154fd0bb0b2271a1be0b22e72bbad94', 1, 1, 'token', '[]', 0, '2018-05-18 21:39:02', '2018-05-18 21:39:02', '2019-05-19 04:39:02'),
('1f9ddb9c6aa255b322e7c1095600a77d9f18e70c6bd7a34abf6b5d0857831584e61f58a17071422a', 1, 1, 'token', '[]', 0, '2018-05-18 02:59:41', '2018-05-18 02:59:41', '2019-05-18 09:59:41'),
('2653d661379d9e74ea59307ce732294bbdc834145d7d1d177afdc778705b98709a47e2ed0f782bf7', 1, 1, 'token', '[]', 0, '2018-05-18 21:18:03', '2018-05-18 21:18:03', '2019-05-19 04:18:03'),
('289c74fbfcfb6847fdec9c16e1f759eb964fe0773309398acf6b11e3d01438a7ba2004cea4f5210a', 1, 1, 'token', '[]', 0, '2018-05-18 04:21:21', '2018-05-18 04:21:21', '2019-05-18 11:21:21'),
('2bcdee6f0b2b675378521e0404a17a91a34ac76fd996da26f6223a34adab69899001dc1beb731384', 1, 1, 'token', '[]', 0, '2018-05-18 02:59:41', '2018-05-18 02:59:41', '2019-05-18 09:59:41'),
('2c0c7c62129f8cfed789fb5efea70a648fab18b42909e0702c9ebe6358751962c765d76180cbfdd5', 1, 1, 'token', '[]', 0, '2018-05-18 02:59:42', '2018-05-18 02:59:42', '2019-05-18 09:59:42'),
('2c19f6a090fd29509d5686a21ec632b6ecfc110073c1e9f715223a7b83eee2b2795a47abd581d158', 4, 1, 'token', '[]', 0, '2018-05-18 03:36:52', '2018-05-18 03:36:52', '2019-05-18 10:36:52'),
('2f78ca8d77d7675d03dd152888575fcd5bea7a9873bfdbd1e41052e3531010cd039288f90614478b', 1, 1, 'token', '[]', 0, '2018-05-18 21:06:58', '2018-05-18 21:06:58', '2019-05-19 04:06:58'),
('3642098dfa90c7f934cc3cc1473ee24100ffd4c447c5f0f884e6ad599f70233944cfa6f97525c89a', 1, 1, 'token', '[]', 0, '2018-05-18 04:19:39', '2018-05-18 04:19:39', '2019-05-18 11:19:39'),
('3e967802a4e894c6c67bc44b84f1138ff1fcc30fbb6940ac4f4bdda1c8e8a8d173bc61cc2581ca1e', 1, 1, 'token', '[]', 0, '2018-05-18 03:51:00', '2018-05-18 03:51:00', '2019-05-18 10:51:00'),
('41d71b14d20fb0d919df03697b5c8234d342735bf0ff9c39a3d6929df37adb40beeee87eac41f0bf', 1, 1, 'token', '[]', 0, '2018-05-18 04:17:03', '2018-05-18 04:17:03', '2019-05-18 11:17:03'),
('435f1929678dd7ff73ba9fd010cb9a620e540e3f79dc2dc0862ae16d4ae9914136965a277fe59735', 1, 1, 'token', '[]', 0, '2018-05-18 04:05:39', '2018-05-18 04:05:39', '2019-05-18 11:05:39'),
('45393d889710ad44c042b8d7625b4622cc265a90c32069d9bff8b704d91e74f17bd94dd7eb853762', 1, 1, 'token', '[]', 0, '2018-05-18 03:57:39', '2018-05-18 03:57:39', '2019-05-18 10:57:39'),
('4570081f0c1b44c185c110c2076ab8bd4277004a04a9c6844355f4520ed7c40a1d0d531044cc1816', 1, 1, 'token', '[]', 0, '2018-05-18 03:48:12', '2018-05-18 03:48:12', '2019-05-18 10:48:12'),
('46d71a596289223d92dd3a00dda483b555741d93b82d8e9793739d922390b170222b89d6bcebfa16', 19, 1, 'rrrrr', '[]', 0, '2018-05-19 04:27:13', '2018-05-19 04:27:13', '2019-05-19 11:27:13'),
('48e614c5ddd01752f55b77873666aef12ebcccb2292234dfb8b0b1dc569dfb245fb83d987a300981', 1, 1, 'jzrlza', '[]', 0, '2018-05-18 22:05:08', '2018-05-18 22:05:08', '2019-05-19 05:05:08'),
('4b7f521769bb70390054141543b2560b7393e4ab413a5f37e4882a554330a202eeb1dfadd25ac558', 1, 1, 'token', '[]', 0, '2018-05-18 21:38:53', '2018-05-18 21:38:53', '2019-05-19 04:38:53'),
('4e55b421e8eb9d14493dcaddda97aef71a5e95836e035841a05a1422c1b559b9ac1aa9d837d4e142', 1, 1, 'token', '[]', 0, '2018-05-18 03:58:21', '2018-05-18 03:58:21', '2019-05-18 10:58:21'),
('56f8ffebefa69b59119e6ce5f0967db5a0cf25af0513bf93d299fef4eeffd8d9ad300b46f0902cf8', 1, 1, 'token', '[]', 0, '2018-05-18 03:30:52', '2018-05-18 03:30:52', '2019-05-18 10:30:52'),
('6171b6f9bcc278ee2c724df9588b83884a4931fbf204bf53395dbc300e72664bcd4c19aa19186860', 1, 1, 'jzrlza', '[]', 0, '2018-05-18 22:00:11', '2018-05-18 22:00:11', '2019-05-19 05:00:11'),
('62c37376d48f02c69e509b16287b8a56303ff96f32f2770352bcdc6cfd5175b61759a939122b202a', 4, 1, 'token', '[]', 0, '2018-05-18 03:39:32', '2018-05-18 03:39:32', '2019-05-18 10:39:32'),
('65451d69d15ed2183a10d00e897b833611ae54452827873359df87662039d0bcee31d48f476ca6e6', 8, 1, 'token', '[]', 0, '2018-05-18 04:10:16', '2018-05-18 04:10:16', '2019-05-18 11:10:16'),
('6570e69d5e7ba7566f4e5ce5979855f7d15b3fdf25205dbb6baa880f7f8f4ebbb9edfc51951e1487', 19, 1, 'token', '[]', 0, '2018-05-18 04:20:22', '2018-05-18 04:20:22', '2019-05-18 11:20:22'),
('662bcb64b1b3b2a99d4be59bba63ae84559bf7c622865753e8d81906f022c3e6fda74eb613acf20f', 1, 1, 'token', '[]', 0, '2018-05-18 02:52:54', '2018-05-18 02:52:54', '2019-05-18 09:52:54'),
('6a291fd63c5786a1ffa74474facec2cb1b227fa5d6fee0d5d56321f1895858f3e29374aa0b35cdb2', 1, 1, 'token', '[]', 0, '2018-05-18 02:59:42', '2018-05-18 02:59:42', '2019-05-18 09:59:42'),
('710fd44452146eba6f99893d08d644d9d49530060ed4e29976562718b1607a48f95e28df8da314f5', 1, 1, 'token', '[]', 0, '2018-05-18 03:58:27', '2018-05-18 03:58:27', '2019-05-18 10:58:27'),
('7537126b31626a38e537b1f7ff5465aa413a80febc8ac4cbe44bd90aa7c034b1e3700567f6f2fcfd', 1, 1, 'jzrlza', '[]', 0, '2018-05-18 22:02:55', '2018-05-18 22:02:55', '2019-05-19 05:02:55'),
('7b8fbb3378c5f6ee4df03341962e34087a9d100c4a65bb8a1a8bc45a0ab66499a11d7bbfadf06294', 1, 1, 'token', '[]', 0, '2018-05-18 03:51:59', '2018-05-18 03:51:59', '2019-05-18 10:51:59'),
('7d5ee45423a0e9234bb12feb852ac585d4c5e8eec286b388d65241ac398c3f59aa5354bcc680f415', 8, 1, 'Hihon', '[]', 0, '2018-05-19 04:16:31', '2018-05-19 04:16:31', '2019-05-19 11:16:31'),
('7fdafb2139c2fa243190b9adde79a16d4ab426bd48ef4d7de11a6d320e8d25a00aac8a08350f19ca', 1, 1, 'token', '[]', 0, '2018-05-18 03:00:57', '2018-05-18 03:00:57', '2019-05-18 10:00:57'),
('834d0f562c67efdb01d54455624d5c801d54c76af40a21c26b367194cac9ed2471aba52e936a88d7', 1, 1, 'token', '[]', 0, '2018-05-18 04:01:02', '2018-05-18 04:01:02', '2019-05-18 11:01:02'),
('8ce4cb1db5524fb576d30a84b2215b8148ee01239ab88fbe3ae8171a71ab1675cabee8939de58396', 1, 1, 'token', '[]', 0, '2018-05-18 21:03:28', '2018-05-18 21:03:28', '2019-05-19 04:03:28'),
('97503875adfbc94bc75cf54c11dce001efb3278a10153780f756a818e3ea505017b4de5caa535423', 4, 1, 'token', '[]', 0, '2018-05-18 03:39:41', '2018-05-18 03:39:41', '2019-05-18 10:39:41'),
('981b66f3663d21f6d9d8475084c830fdf685dcea117372b2b535d24c6967655cec94b5c56d32e8a7', 1, 1, 'token', '[]', 0, '2018-05-18 03:32:33', '2018-05-18 03:32:33', '2019-05-18 10:32:33'),
('9e9b17147b44c5cf380b4e2988b9a5d8950d7ac2b87ff8bdaac6f55af216e6184231bda316966d85', 19, 1, 'token', '[]', 0, '2018-05-18 21:05:58', '2018-05-18 21:05:58', '2019-05-19 04:05:58'),
('9fa25fb022927c1b85b4f1178dfdad77835f4c494aa1197f7c3fa446d14faad3ddaa4796e6eb5213', 1, 1, 'token', '[]', 0, '2018-05-18 21:24:14', '2018-05-18 21:24:14', '2019-05-19 04:24:14'),
('a4f94f123778a403605c48d858738df70ff98ddfd69ce36a866678b1a4e86eea499016dd72135482', 1, 1, 'token', '[]', 0, '2018-05-18 02:59:30', '2018-05-18 02:59:30', '2019-05-18 09:59:30'),
('a9ef9ea485cf8a13dd5e06fe8c36ef05461b6d9ec369579a12a3329164134e8421d7c4d72cfb6450', 8, 1, 'token', '[]', 0, '2018-05-18 21:06:42', '2018-05-18 21:06:42', '2019-05-19 04:06:42'),
('ac443e3122b52eb527e281454a79616b6d6752c08b561b7334a0803c155c03d8e1b9eccccf89e152', 1, 1, 'token', '[]', 0, '2018-05-18 20:02:22', '2018-05-18 20:02:22', '2019-05-19 03:02:22'),
('b36ccc71dbbd2ac1398de0a5e02b19054f4dff5622be25255debd4c4bf98b7bc55961bd6b752c994', 1, 1, 'token', '[]', 0, '2018-05-18 03:40:43', '2018-05-18 03:40:43', '2019-05-18 10:40:43'),
('b4fcb3f62f39075b404970bc4f5bdd4c1cfddf5619f48216d5f37fa6121a848f66652ee7b75488d2', 1, 1, 'token', '[]', 0, '2018-05-18 02:59:41', '2018-05-18 02:59:41', '2019-05-18 09:59:41'),
('c6d75e26c8ec64c678be84745ccbe2052e72907cab4cf734824b87d86b5e461d33a143a6c8236b33', 1, 1, 'token', '[]', 0, '2018-05-18 03:31:44', '2018-05-18 03:31:44', '2019-05-18 10:31:44'),
('c6d7852cdebe92a64b2a380026ca82fc4f2ded053712c0eedbc623b2a04f0282a084a7350719389a', 19, 1, 'token', '[]', 0, '2018-05-18 04:14:06', '2018-05-18 04:14:06', '2019-05-18 11:14:06'),
('c98bb95d27656fcdea71e3450cdf83231f54d51af61f38b0179e663ef2ec308e2e5f060040504a99', 1, 1, 'token', '[]', 0, '2018-05-18 05:59:22', '2018-05-18 05:59:22', '2019-05-18 12:59:22'),
('ca95ed5d774b9110f2e7f55e165db1e94301d91aaeb8bdcd2df4d97b1aaeda996a375741fc637874', 1, 1, 'token', '[]', 0, '2018-05-18 21:26:25', '2018-05-18 21:26:25', '2019-05-19 04:26:25'),
('cd72a401e2c95da427ab2bf86abae6f450c8a9397c295297e82f2e758b52a3b074ed8406e39d7d6c', 1, 1, 'token', '[]', 0, '2018-05-18 03:42:19', '2018-05-18 03:42:19', '2019-05-18 10:42:19'),
('cd93d88483ce115a11b682444daa4df0d9c7d51797a8b8c49bad50214e7ca2294672e4c06e1bd5a9', 1, 1, 'token', '[]', 0, '2018-05-18 02:58:46', '2018-05-18 02:58:46', '2019-05-18 09:58:46'),
('d4d5c6a349c9e08c40b1907d076481f07ee9cbc87c4481c80bee347b5e6e81dc2ae68c5c2f272fad', 1, 1, 'token', '[]', 0, '2018-05-18 04:08:31', '2018-05-18 04:08:31', '2019-05-18 11:08:31'),
('dde0b295aa3b89125f52caf65e0b5e9ad64cab92934ed9577a738d7ed6f8db05c538a7aae5341a16', 1, 1, 'token', '[]', 0, '2018-05-18 21:49:04', '2018-05-18 21:49:04', '2019-05-19 04:49:04'),
('e1ac0618862e447917f31c972319dfc046576c33e2689b763473d25a27c0b50b5f1084850627e875', 1, 1, 'token', '[]', 0, '2018-05-18 04:11:30', '2018-05-18 04:11:30', '2019-05-18 11:11:30'),
('e582276d06d493347a63dc4694a9241cc939fac59d81899d19868623a6e7319b660a4b10296176c9', 1, 1, 'token', '[]', 0, '2018-05-18 20:52:48', '2018-05-18 20:52:48', '2019-05-19 03:52:48'),
('eb8d78ed4a37dfafd16a08e098d816c6fb4ec092b152fac098cd37575276b5a07a91961954f4a968', 1, 1, 'token', '[]', 0, '2018-05-18 02:59:42', '2018-05-18 02:59:42', '2019-05-18 09:59:42'),
('f12767861c2d48301f2830c6b639205b7a8ab5f2f75a236219feac58361fb201bf5e5137e2e14729', 19, 1, 'rrrrr', '[]', 0, '2018-05-18 22:03:41', '2018-05-18 22:03:41', '2019-05-19 05:03:41'),
('f5720e04be298b410b7447a509819ecbe3e817ae3e7acb3790be67a6ba5b694de0fcc4446bd7372c', 1, 1, 'token', '[]', 0, '2018-05-18 03:59:46', '2018-05-18 03:59:46', '2019-05-18 10:59:46'),
('f7d66e28719e9d558f2da3216a0300a94b8eb2ed0008191a91e9cfa0edee6b2c414225b81e193ba0', 2, 1, 'token', '[]', 0, '2018-05-18 04:09:50', '2018-05-18 04:09:50', '2019-05-18 11:09:50'),
('f84b69c99d3a19c8f584ab98ffbfe41d93a527396100263cd6c9f23a22b501809aa2e9707de68fa7', 1, 1, 'token', '[]', 0, '2018-05-18 03:30:22', '2018-05-18 03:30:22', '2019-05-18 10:30:22'),
('fdadd6719bad1ccab3da43bc045e73c589a9fbe45542a5dea21060acd28e3d6bc1083e9647ab6a18', 1, 1, 'token', '[]', 0, '2018-05-18 03:35:34', '2018-05-18 03:35:34', '2019-05-18 10:35:34'),
('ff9a0fbe78fef9b0fc3a7bbb426ee04e85fc1e6c6df76b813ea2fb06d07c08bfebff3bff99a50ddd', 1, 1, 'jzrlza', '[]', 0, '2018-05-18 22:03:33', '2018-05-18 22:03:33', '2019-05-19 05:03:33');

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
(2, NULL, 'Laravel Password Grant Client', 'FghyAk0guQC7Gm09wAoLcA0Uo3tnoYAQcLOy1SYV', 'http://localhost', 0, 1, 0, '2018-05-16 08:24:11', '2018-05-16 08:24:11'),
(3, 1, 'jzrlza', 'F01N7EJSpwrn6N7tsUcv7BAdP1mNXLvMDrgYIyQC', 'admin-users', 0, 0, 0, '2018-05-18 21:20:41', '2018-05-18 21:20:41');

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
(19, 'rrrrr', 'rrr@kkfdf.com', '', NULL, '2018-05-18 02:39:21', '2018-05-18 02:39:21', '', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(20, 'xzczxcc', 'zxzxczxz@dasdadas.com', '', NULL, '2018-05-18 20:31:17', '2018-05-18 20:31:17', '', '', '', '', '', '', 'Supervisor', 1, '', NULL),
(21, 'xzczxczxczxczxczxcxz', 'zcxzxczxc@czxczxc.com', '', NULL, '2018-05-18 21:07:14', '2018-05-18 21:07:14', '', '', '', '', '', '', 'Supervisor', 1, '', NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
