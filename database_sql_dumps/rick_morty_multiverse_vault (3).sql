-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2025 at 08:59 PM
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
-- Database: `rick_morty_multiverse_vault`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ADMIN_ID` int(5) NOT NULL,
  `PASSWORD` varchar(10) NOT NULL,
  `USERNAME` varchar(10) NOT NULL,
  `ROLE` text NOT NULL,
  `EMAIL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artefact`
--

CREATE TABLE `artefact` (
  `ARTEFACT_ID` int(5) NOT NULL,
  `NAME` text NOT NULL,
  `PRICE` int(4) NOT NULL,
  `COLLECTION_DATE` date NOT NULL,
  `DETAILS` text NOT NULL,
  `ORIGIN_UNIVERSE_ID` text NOT NULL,
  `ARTEFACT_TYPE` text NOT NULL,
  `A_ID` int(5) NOT NULL,
  `U_ID` int(5) NOT NULL,
  `AU_ID` int(5) NOT NULL,
  `RARE_ARTIFACT` text NOT NULL,
  `MAK_ID` int(5) NOT NULL,
  `COMMON_ARTIFACT` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auction`
--

CREATE TABLE `auction` (
  `AUCTION_ID` int(5) NOT NULL,
  `STARTING_BIDDING_PRICE` int(10) NOT NULL,
  `A_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add random event', 7, 'add_randomevent'),
(26, 'Can change random event', 7, 'change_randomevent'),
(27, 'Can delete random event', 7, 'delete_randomevent'),
(28, 'Can view random event', 7, 'view_randomevent'),
(29, 'Can add admin', 8, 'add_admin'),
(30, 'Can change admin', 8, 'change_admin'),
(31, 'Can delete admin', 8, 'delete_admin'),
(32, 'Can view admin', 8, 'view_admin'),
(33, 'Can add auction', 9, 'add_auction'),
(34, 'Can change auction', 9, 'change_auction'),
(35, 'Can delete auction', 9, 'delete_auction'),
(36, 'Can view auction', 9, 'view_auction'),
(37, 'Can add marketplace', 10, 'add_marketplace'),
(38, 'Can change marketplace', 10, 'change_marketplace'),
(39, 'Can delete marketplace', 10, 'delete_marketplace'),
(40, 'Can view marketplace', 10, 'view_marketplace'),
(41, 'Can add portal time scheduler', 11, 'add_portaltimescheduler'),
(42, 'Can change portal time scheduler', 11, 'change_portaltimescheduler'),
(43, 'Can delete portal time scheduler', 11, 'delete_portaltimescheduler'),
(44, 'Can view portal time scheduler', 11, 'view_portaltimescheduler'),
(45, 'Can add universe', 12, 'add_universe'),
(46, 'Can change universe', 12, 'change_universe'),
(47, 'Can delete universe', 12, 'delete_universe'),
(48, 'Can view universe', 12, 'view_universe'),
(49, 'Can add user', 13, 'add_user'),
(50, 'Can change user', 13, 'change_user'),
(51, 'Can delete user', 13, 'delete_user'),
(52, 'Can view user', 13, 'view_user'),
(53, 'Can add journey log', 14, 'add_journeylog'),
(54, 'Can change journey log', 14, 'change_journeylog'),
(55, 'Can delete journey log', 14, 'delete_journeylog'),
(56, 'Can view journey log', 14, 'view_journeylog'),
(57, 'Can add artefact', 15, 'add_artefact'),
(58, 'Can change artefact', 15, 'change_artefact'),
(59, 'Can delete artefact', 15, 'delete_artefact'),
(60, 'Can view artefact', 15, 'view_artefact'),
(61, 'Can add booking', 16, 'add_booking'),
(62, 'Can change booking', 16, 'change_booking'),
(63, 'Can delete booking', 16, 'delete_booking'),
(64, 'Can view booking', 16, 'view_booking');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$UnBrJBWH3XHFV9rk17LV2B$CCh48bbGQKFw+tHPqFTmHsOK4BN7ZRfunsXnfnITa24=', '2025-09-05 18:45:16.939964', 1, 'rick_morty', '', '', 'rick_morty.214@gmail.com', 1, 1, '2025-08-26 16:55:18.166425'),
(2, 'pbkdf2_sha256$390000$fbO1Q5rQ0HkH7bSdgZRrth$+jndZdWOWJrlyq4ujkJdtKLyq4qteVpDQ4Wd++8u6HM=', '2025-09-05 12:51:45.311975', 1, 'Rick', '', '', '', 1, 1, '2025-08-29 21:24:40.000000'),
(3, 'pbkdf2_sha256$390000$OeqbGIayCzn9HLPLKrsT1K$8MdIYUeYrjlv0SAGQ2Jorqd1miwwb8/1q/nUFMYHASI=', '2025-09-02 05:28:20.212889', 1, 'Morty', '', '', '', 1, 1, '2025-08-29 21:25:46.000000'),
(4, 'pbkdf2_sha256$390000$iB2xFSzPtqfLOKZPSm5C5H$zXI28ZCM18Mt1daxxG1KvCEPn+jrNe1prOs/W3NZIV4=', NULL, 0, '@Myshaahamed', '', '', '', 0, 1, '2025-08-31 17:33:08.313546'),
(5, 'pbkdf2_sha256$390000$VSptKZQVpknf4BEMXFsHdi$BNbA4arA0C7aBEScoqpmTWELQm641mtTOPtSlu9stbc=', '2025-09-05 18:47:14.631171', 0, 'usha_', '', '', '', 0, 1, '2025-09-01 12:41:51.439445'),
(6, 'pbkdf2_sha256$390000$4Y0UKUBYGB36PMdzOYY7H8$UhdGkbujszgMp5LtwdIJKgU2c3LUp9FInvN086J6q/s=', '2025-09-04 17:59:09.018017', 0, 'ritu', '', '', '', 0, 1, '2025-09-01 12:42:08.653202'),
(7, 'pbkdf2_sha256$390000$XVzUEbtEOogVoOUCHBae9f$MlCR0UwY/760KEwBy15zTeduYTkMSoKUX2JYBJxZT44=', '2025-09-04 20:29:03.854572', 0, 'mridha', '', '', '', 0, 1, '2025-09-01 12:42:35.770467'),
(8, 'pbkdf2_sha256$390000$uUXchkGMBqvYaEGWujoj30$VjJTx6Nqpi1FiRxOdP91QOcZZjpF8PBaRRO9tN35QzM=', NULL, 0, 'ruhin', '', '', '', 0, 1, '2025-09-01 12:42:48.760553'),
(9, 'pbkdf2_sha256$390000$GGO0K5v8C4ndPB85Q7tMvF$6pa2OoPYVM+vMIwj9ebspvzAgvSvydN0HC8JGAixX30=', NULL, 0, 'ramisha_', '', '', '', 0, 1, '2025-09-01 12:43:44.680876'),
(10, 'pbkdf2_sha256$390000$ENRd6ALAdJngohouQZy2j8$n7m39XqQVbmy9NO0sIJOOGuxliHMlwQdkXfI8f6Dzhs=', NULL, 0, 'rita', '', '', '', 0, 1, '2025-09-01 12:44:05.672997'),
(11, 'pbkdf2_sha256$390000$1hs0hbzlLAyGhYpFISiNcL$rRQb3vUt4Fa5NTZthAl9uPQyGkwzsKDNI1dc0uN/xYQ=', NULL, 0, 'onty', '', '', '', 0, 1, '2025-09-01 12:44:38.667829'),
(12, 'pbkdf2_sha256$390000$1HAh9KQlw6lSGLxuFrHoZk$cFOEICe2b5W7G5d6VgQAmi1gTwZuUkqWS/bm+JboHkk=', NULL, 0, 'alma', '', '', '', 0, 1, '2025-09-01 12:45:42.691041'),
(13, 'pbkdf2_sha256$390000$EesaTV0RvFqUm84heqAChO$kGnfV5DFPRfz7J4eQl/onTBcpb06JbWLBnw0WHOTwSs=', '2025-09-02 09:49:55.086907', 0, 'tabia', '', '', '', 0, 1, '2025-09-01 12:46:00.321450'),
(14, 'pbkdf2_sha256$390000$YcuAVH7sUatrcgahzrPrmp$UsGzsG+7gnqdInJue8gO83S2Bb7AqVzaQBPLxG6a/+A=', NULL, 0, 'tohsin', '', '', '', 0, 1, '2025-09-01 12:46:16.378509'),
(15, 'pbkdf2_sha256$390000$MTDyWPo1VU2b0jQIERhcSv$u0UbvGMVeBzKBFd5LaHnevJCJ9u3AX3MfJe/ZO+XaAo=', '2025-09-01 14:22:23.053191', 0, 'talha', '', '', '', 0, 1, '2025-09-01 14:22:07.934489'),
(16, 'pbkdf2_sha256$390000$O2Nnun2vnjvQqV4AYBLKM5$pN8xvdAkogizvHUi0tzSCjosZ8bHdWewBUXfBEN1oI8=', '2025-09-01 16:46:10.733286', 0, 'elsa', '', '', '', 0, 1, '2025-09-01 16:46:00.471973'),
(17, 'pbkdf2_sha256$390000$mrfVFQXT6doti4DBSm7eqN$7wTqgmsoepMPsmZHlciOIOvRaz1DbSnOKXFIbxK/iYg=', '2025-09-01 18:48:56.854495', 0, 'zarif', '', '', '', 0, 1, '2025-09-01 18:35:30.719046'),
(18, 'pbkdf2_sha256$390000$f7YRV4j61AXzcuWfIevi2L$sJEbTjp0+m/VSloUqwe3Ktm0cNQjOH/mBAiE9s3XN4E=', '2025-09-01 19:58:05.750126', 0, 'tithi', '', '', '', 0, 1, '2025-09-01 19:57:53.824107'),
(19, 'pbkdf2_sha256$390000$XONlk9wR5OvaCJyIcEU6CX$C3T8wrz93B6sewj6jbKlYnzUrbyYCTuffEHdDxcU3WI=', '2025-09-01 20:11:53.434777', 0, 'anfa', '', '', '', 0, 1, '2025-09-01 20:11:44.027811'),
(20, 'pbkdf2_sha256$390000$ExWlJU19FTun38Rm3KgHLo$vEWsJFxGI42JvOi31F32Mw8zEssoiZjMWkW+bCdYxKo=', '2025-09-01 20:20:51.592827', 0, 'mithi', '', '', '', 0, 1, '2025-09-01 20:20:41.388114'),
(21, 'pbkdf2_sha256$390000$zcx4nx8MaQDhVm3oumlc9b$A8vIVJjznXJyEUJjInVel1NI0DhQoouUeD2wW056ECk=', '2025-09-01 20:22:37.432997', 0, 'niloy', '', '', '', 0, 1, '2025-09-01 20:22:28.195480'),
(22, 'pbkdf2_sha256$390000$ohav6Zx6CADlL9qppZXcH3$t5KHWmMyrceLMqcrGQ+lmnjjeZdKK96sryzQV092RTU=', '2025-09-01 20:45:38.991211', 0, 'mita', '', '', '', 0, 1, '2025-09-01 20:45:31.284267'),
(23, 'pbkdf2_sha256$390000$7mEDGXYLJr255gNtLCkZP3$kE0dvQESQsqYBzZk4YuX+H4ghDY9Cqo8PV8GPfo02nI=', '2025-09-01 20:50:50.813890', 0, 'maisha', '', '', '', 0, 1, '2025-09-01 20:50:41.815849'),
(24, 'pbkdf2_sha256$390000$ZHiqwCs3ZMeXCIeD5eiWLn$ErjSz2z8EU6pBsEhVbU/4zel2MGt1F3M4ecDzsf4dlk=', '2025-09-02 05:31:12.430577', 0, 'usha', '', '', '', 0, 1, '2025-09-02 05:31:03.197143'),
(25, 'pbkdf2_sha256$390000$UQlFxksxXKXiG0VzTgGCzg$aycrRM2a77FTH5EH8TOzO3gWNkHAgma2THrowlGtPpg=', '2025-09-02 13:13:01.029754', 0, 'ramisa', '', '', '', 0, 1, '2025-09-02 13:12:52.085048'),
(26, 'pbkdf2_sha256$390000$g7PInhVoDBaBasFaJalzDn$nJtnOqiL2+eiN1YOwbUxksrKj231doZR72rBfxary7s=', '2025-09-02 22:43:54.458971', 0, 'rida', '', '', '', 0, 1, '2025-09-02 22:43:45.502096'),
(27, 'pbkdf2_sha256$390000$1he5tTOkcPUPUosgBG2uEp$xtX/YVl19BiOJ7w8K8suW8+EC1YiNjCTBTaxR5mMuCw=', '2025-09-02 22:51:31.294850', 0, 'lamisa', '', '', '', 0, 1, '2025-09-02 22:51:21.640193'),
(28, 'pbkdf2_sha256$390000$UCxnsMPv90U3u4TRSBtd5n$PIBiz59Awc5B8myzlIH46zF8deOl0M6s6bzwNgvz1ws=', '2025-09-03 05:37:01.803128', 0, 'adrita', '', '', '', 0, 1, '2025-09-03 05:34:42.035218'),
(29, 'pbkdf2_sha256$390000$NDDDaIL6zy0Z8MBRtASwlv$WTMCHq/iRd1AM/SocnN4+CYz3Am7CgxSA6S7t0Tx48I=', '2025-09-04 14:50:51.395121', 0, 'mithila', 'mithila', 'rahman', 'mithila@gmail.com', 0, 1, '2025-09-04 14:50:41.642123'),
(30, 'pbkdf2_sha256$390000$JiAwHJjdeP9xJIvtea9FCy$8z3ZKq0RGNYEhK8c5P4ipLiV7EjWJF+K2EtYhXjh6Hk=', '2025-09-04 16:14:53.766741', 0, 'mishti', 'mishti', 'rahman', 'mishti@gmail.com', 0, 1, '2025-09-04 16:14:42.636427'),
(31, 'pbkdf2_sha256$390000$o2aukP0u82HbkD7BCi20yr$u+9Eb5zpSXTKvieUOOb95D+1Z34JjT8aDinQd27U2+s=', '2025-09-05 12:48:27.449529', 0, 'ananna16', 'Zannatul Ferdous ', 'Ananna', 'zannatulo.ananna2@gmail.com', 0, 1, '2025-09-05 12:48:11.258043'),
(32, 'pbkdf2_sha256$390000$G0oIEzFEp4LxWZd8OXh0U9$UHXqNGTMSb/3O1ACzmzNb2CNFQ97baUPbiSTuW0zwZA=', '2025-09-05 18:43:10.674694', 0, 'ayesha', 'ayesha', 'fariha', 'ayesha@gmail.com', 0, 1, '2025-09-05 18:42:30.439831');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-08-28 13:34:20.817225', '1', 'MortyAdmin', 2, '[{\"changed\": {\"fields\": [\"Username\", \"Email\"]}}]', 8, 1),
(2, '2025-08-28 14:54:26.803899', '1', 'Universe-1', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(3, '2025-08-28 14:54:32.915676', '1', 'Universe-1', 2, '[]', 12, 1),
(4, '2025-08-28 14:54:45.273593', '2', 'Universe-2', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(5, '2025-08-28 14:54:54.677359', '3', 'Universe-3', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(6, '2025-08-28 14:55:01.492582', '4', 'Universe-4', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(7, '2025-08-28 14:55:11.603313', '5', 'Universe-5', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(8, '2025-08-28 14:55:19.562129', '5', 'Universe-5', 2, '[]', 12, 1),
(9, '2025-08-28 14:55:27.348604', '6', 'Universe-6', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(10, '2025-08-28 14:55:35.434921', '7', 'Universe-7', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(11, '2025-08-28 14:55:40.760907', '7', 'Universe-7', 2, '[]', 12, 1),
(12, '2025-08-28 14:55:48.471652', '8', 'Universe-8', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(13, '2025-08-28 14:55:53.896831', '8', 'Universe-8', 2, '[]', 12, 1),
(14, '2025-08-28 14:55:58.305330', '7', 'Universe-7', 2, '[]', 12, 1),
(15, '2025-08-28 14:56:03.780318', '8', 'Universe-8', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(16, '2025-08-28 14:56:11.231066', '9', 'Universe-9', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(17, '2025-08-28 14:56:19.279275', '10', 'Universe-10', 2, '[{\"changed\": {\"fields\": [\"Danger level\"]}}]', 12, 1),
(18, '2025-08-28 14:56:24.285374', '10', 'Universe-10', 2, '[]', 12, 1),
(19, '2025-08-28 15:00:17.454287', '1', 'Universe-1', 2, '[]', 12, 1),
(20, '2025-08-28 15:00:53.701429', '2', 'Universe-2', 2, '[{\"changed\": {\"fields\": [\"Universe type\"]}}]', 12, 1),
(21, '2025-08-28 15:01:14.379376', '3', 'Universe-3', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Danger level\"]}}]', 12, 1),
(22, '2025-08-28 15:02:34.101847', '2', 'Universe-2', 2, '[{\"changed\": {\"fields\": [\"Visit date\", \"Destroyed date\"]}}]', 12, 1),
(23, '2025-08-28 15:03:55.491897', '2', 'Universe-2', 2, '[]', 12, 1),
(24, '2025-08-28 15:07:06.021006', '4', 'Universe-4', 2, '[{\"changed\": {\"fields\": [\"Visit date\", \"Destroyed date\", \"Status\"]}}]', 12, 1),
(25, '2025-08-28 15:07:39.721904', '5', 'Universe-5', 2, '[{\"changed\": {\"fields\": [\"Visit date\"]}}]', 12, 1),
(26, '2025-08-28 15:08:02.600251', '6', 'Universe-6', 2, '[{\"changed\": {\"fields\": [\"Visit date\", \"Destroyed date\"]}}]', 12, 1),
(27, '2025-08-28 15:08:22.712539', '7', 'Universe-7', 2, '[]', 12, 1),
(28, '2025-08-28 15:09:28.432498', '8', 'Universe-8', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Visit date\", \"Destroyed date\", \"Status\"]}}]', 12, 1),
(29, '2025-08-28 15:10:03.063828', '9', 'Universe-9', 2, '[{\"changed\": {\"fields\": [\"Visit date\", \"Destroyed date\"]}}]', 12, 1),
(30, '2025-08-28 15:10:17.398018', '10', 'Universe-10', 2, '[{\"changed\": {\"fields\": [\"Visit date\", \"Status\"]}}]', 12, 1),
(31, '2025-08-28 15:13:41.662811', '1', 'Universe-1', 2, '[{\"changed\": {\"fields\": [\"Visit date\"]}}]', 12, 1),
(32, '2025-08-28 15:14:02.008202', '1', 'Log 1', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 14, 1),
(33, '2025-08-28 15:14:21.376803', '2', 'Log 2', 2, '[{\"changed\": {\"fields\": [\"Destination\", \"Date\"]}}]', 14, 1),
(34, '2025-08-28 15:14:39.747641', '3', 'Universe-3', 2, '[{\"changed\": {\"fields\": [\"Visit date\"]}}]', 12, 1),
(35, '2025-08-28 15:14:54.355301', '3', 'Log 3', 2, '[]', 14, 1),
(36, '2025-08-28 15:15:09.090911', '4', 'Log 4', 2, '[{\"changed\": {\"fields\": [\"Destination\", \"Date\"]}}]', 14, 1),
(37, '2025-08-28 15:15:22.231568', '5', 'Log 5', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 14, 1),
(38, '2025-08-28 15:15:56.831753', '6', 'Log 6', 2, '[{\"changed\": {\"fields\": [\"Destination\", \"Date\", \"Status\"]}}]', 14, 1),
(39, '2025-08-28 15:16:07.062116', '7', 'Log 7', 2, '[]', 14, 1),
(40, '2025-08-28 15:16:18.705059', '7', 'Universe-7', 2, '[{\"changed\": {\"fields\": [\"Visit date\"]}}]', 12, 1),
(41, '2025-08-28 15:16:52.863899', '8', 'Log 8', 2, '[{\"changed\": {\"fields\": [\"Destination\", \"Date\", \"Status\"]}}]', 14, 1),
(42, '2025-08-28 15:17:55.969456', '5', 'Log 5', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 14, 1),
(43, '2025-08-28 15:20:16.762768', '9', 'Log 9', 2, '[{\"changed\": {\"fields\": [\"Destination\", \"Date\"]}}]', 14, 1),
(44, '2025-08-28 15:20:48.009979', '10', 'Log 10', 2, '[]', 14, 1),
(45, '2025-08-28 15:21:25.514542', '1', 'User-1', 2, '[{\"changed\": {\"fields\": [\"Reg date\"]}}]', 13, 1),
(46, '2025-08-28 15:21:48.332927', '1', 'User-1', 2, '[{\"changed\": {\"fields\": [\"Reg date\"]}}]', 13, 1),
(47, '2025-08-28 15:22:28.138674', '2', 'User-2', 2, '[{\"changed\": {\"fields\": [\"Reg date\", \"U\", \"Tr\"]}}]', 13, 1),
(48, '2025-08-28 15:22:53.675462', '3', 'User-3', 2, '[{\"changed\": {\"fields\": [\"Reg date\", \"U\", \"Tr\"]}}]', 13, 1),
(49, '2025-08-28 15:24:04.316775', '1', 'Travel 1', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 11, 1),
(50, '2025-08-28 15:24:41.670438', '2', 'Travel 2', 2, '[{\"changed\": {\"fields\": [\"Date\", \"Max capacity\"]}}]', 11, 1),
(51, '2025-08-28 15:25:55.388756', '4', 'User-4', 2, '[{\"changed\": {\"fields\": [\"Reg date\", \"U\", \"Tr\"]}}]', 13, 1),
(52, '2025-08-28 15:26:22.590432', '5', 'User-5', 2, '[{\"changed\": {\"fields\": [\"Reg date\", \"U\", \"Tr\"]}}]', 13, 1),
(53, '2025-08-28 15:26:45.118929', '6', 'User-6', 2, '[{\"changed\": {\"fields\": [\"Reg date\", \"U\", \"Tr\"]}}]', 13, 1),
(54, '2025-08-28 15:27:26.479536', '7', 'User-7', 2, '[{\"changed\": {\"fields\": [\"Reg date\", \"U\", \"Tr\"]}}]', 13, 1),
(55, '2025-08-28 15:27:38.192344', '3', 'Travel 3', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 11, 1),
(56, '2025-08-28 15:29:49.511232', '1', 'Travel 1', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 11, 1),
(57, '2025-08-28 15:30:01.440608', '2', 'Travel 2', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 11, 1),
(58, '2025-08-28 15:30:09.186239', '3', 'Travel 3', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 11, 1),
(59, '2025-08-28 15:30:15.823777', '4', 'Travel 4', 2, '[]', 11, 1),
(60, '2025-08-28 15:30:27.314570', '5', 'Travel 5', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 11, 1),
(61, '2025-08-28 15:30:37.858891', '5', 'Travel 5', 2, '[]', 11, 1),
(62, '2025-08-28 15:30:44.463413', '6', 'Travel 6', 2, '[]', 11, 1),
(63, '2025-08-28 15:30:57.259509', '7', 'Travel 7', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 11, 1),
(64, '2025-08-28 15:31:09.234576', '8', 'Travel 8', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 11, 1),
(65, '2025-08-28 15:31:21.430945', '9', 'Travel 9', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 11, 1),
(66, '2025-08-28 15:31:37.105005', '10', 'Travel 10', 2, '[{\"changed\": {\"fields\": [\"Date\"]}}]', 11, 1),
(67, '2025-08-28 15:34:06.747399', '8', 'User-8', 2, '[{\"changed\": {\"fields\": [\"U\", \"Tr\"]}}]', 13, 1),
(68, '2025-08-28 15:34:15.652146', '9', 'User-9', 2, '[{\"changed\": {\"fields\": [\"U\", \"Tr\"]}}]', 13, 1),
(69, '2025-08-28 15:34:30.136402', '10', 'User-10', 2, '[{\"changed\": {\"fields\": [\"U\", \"Tr\"]}}]', 13, 1),
(70, '2025-08-28 15:35:13.603237', '1', 'Event-1', 2, '[{\"changed\": {\"fields\": [\"Date triggered\"]}}]', 7, 1),
(71, '2025-08-28 15:35:19.504086', '2', 'Event-2', 2, '[{\"changed\": {\"fields\": [\"Date triggered\"]}}]', 7, 1),
(72, '2025-08-28 15:35:29.715540', '3', 'Event-3', 2, '[{\"changed\": {\"fields\": [\"Date triggered\"]}}]', 7, 1),
(73, '2025-08-28 15:35:38.841547', '4', 'Event-4', 2, '[{\"changed\": {\"fields\": [\"Date triggered\"]}}]', 7, 1),
(74, '2025-08-28 15:35:46.344732', '5', 'Event-5', 2, '[]', 7, 1),
(75, '2025-08-28 15:35:54.415968', '6', 'Event-6', 2, '[{\"changed\": {\"fields\": [\"Date triggered\"]}}]', 7, 1),
(76, '2025-08-28 15:35:59.060221', '7', 'Event-7', 2, '[]', 7, 1),
(77, '2025-08-28 15:36:12.538483', '8', 'Event-8', 2, '[{\"changed\": {\"fields\": [\"Date triggered\"]}}]', 7, 1),
(78, '2025-08-28 15:36:19.251450', '9', 'Event-9', 2, '[{\"changed\": {\"fields\": [\"Date triggered\"]}}]', 7, 1),
(79, '2025-08-28 15:36:24.820852', '10', 'Event-10', 2, '[{\"changed\": {\"fields\": [\"Date triggered\"]}}]', 7, 1),
(80, '2025-08-28 15:59:08.962880', '1', 'Artefact-1', 2, '[{\"changed\": {\"fields\": [\"Collection date\", \"Artefact type\", \"Marketplace\", \"Rare artifact\"]}}]', 15, 1),
(81, '2025-08-28 16:00:13.947844', '2', 'Artefact-2', 2, '[{\"changed\": {\"fields\": [\"Price\", \"Collection date\", \"Artefact type\", \"Auction\", \"Rare artifact\", \"Common artifact\"]}}]', 15, 1),
(82, '2025-08-28 16:00:42.252738', '1', 'Marketplace 1', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(83, '2025-08-28 16:00:59.184186', '1', 'Auction 1', 2, '[{\"changed\": {\"fields\": [\"Starting bidding price\"]}}]', 9, 1),
(84, '2025-08-28 16:01:49.790490', '3', 'Artefact-3', 2, '[{\"changed\": {\"fields\": [\"Collection date\", \"Artefact type\", \"Marketplace\", \"Rare artifact\", \"Common artifact\"]}}]', 15, 1),
(85, '2025-08-28 16:02:06.753391', '2', 'Marketplace 2', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(86, '2025-08-28 16:02:46.726730', '4', 'Artefact-4', 2, '[{\"changed\": {\"fields\": [\"Collection date\", \"Artefact type\", \"Auction\", \"Rare artifact\", \"Common artifact\"]}}]', 15, 1),
(87, '2025-08-28 16:02:58.084721', '2', 'Auction 2', 2, '[{\"changed\": {\"fields\": [\"Starting bidding price\"]}}]', 9, 1),
(88, '2025-08-28 16:03:42.194947', '5', 'Artefact-5', 2, '[{\"changed\": {\"fields\": [\"Collection date\", \"Artefact type\", \"Marketplace\", \"Rare artifact\", \"Common artifact\"]}}]', 15, 1),
(89, '2025-08-28 16:03:50.289011', '3', 'Marketplace 3', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(90, '2025-08-28 16:04:31.391842', '6', 'Artefact-6', 2, '[{\"changed\": {\"fields\": [\"Collection date\", \"Artefact type\", \"Auction\", \"Rare artifact\", \"Common artifact\"]}}]', 15, 1),
(91, '2025-08-28 16:04:41.886850', '3', 'Auction 3', 2, '[{\"changed\": {\"fields\": [\"Starting bidding price\"]}}]', 9, 1),
(92, '2025-08-28 16:05:21.908482', '7', 'Artefact-7', 2, '[{\"changed\": {\"fields\": [\"Collection date\", \"Marketplace\", \"Rare artifact\", \"Common artifact\"]}}]', 15, 1),
(93, '2025-08-28 16:05:28.642897', '4', 'Marketplace 4', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(94, '2025-08-28 16:06:03.201792', '8', 'Artefact-8', 2, '[{\"changed\": {\"fields\": [\"Collection date\", \"Marketplace\", \"Rare artifact\", \"Common artifact\"]}}]', 15, 1),
(95, '2025-08-28 16:06:17.709976', '5', 'Marketplace 5', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(96, '2025-08-28 16:07:24.711097', '9', 'Artefact-9', 2, '[{\"changed\": {\"fields\": [\"Collection date\", \"Artefact type\", \"Auction\", \"Rare artifact\", \"Common artifact\"]}}]', 15, 1),
(97, '2025-08-28 16:07:37.443279', '4', 'Auction 4', 2, '[{\"changed\": {\"fields\": [\"Starting bidding price\"]}}]', 9, 1),
(98, '2025-08-28 16:08:19.976796', '10', 'Artefact-10', 2, '[{\"changed\": {\"fields\": [\"Collection date\", \"Artefact type\", \"Marketplace\", \"Rare artifact\", \"Common artifact\"]}}]', 15, 1),
(99, '2025-08-28 16:08:29.030762', '6', 'Marketplace 6', 2, '[{\"changed\": {\"fields\": [\"Price\"]}}]', 10, 1),
(100, '2025-08-29 12:56:28.583082', '1', 'Universe-1', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Admin\"]}}]', 12, 1),
(101, '2025-08-29 12:56:35.995877', '2', 'Universe-2', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Admin\"]}}]', 12, 1),
(102, '2025-08-29 12:56:41.831565', '3', 'Universe-3', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Admin\"]}}]', 12, 1),
(103, '2025-08-29 12:56:46.889111', '4', 'Universe-4', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Admin\"]}}]', 12, 1),
(104, '2025-08-29 12:56:52.711440', '5', 'Universe-5', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Admin\"]}}]', 12, 1),
(105, '2025-08-29 12:57:27.093899', '6', 'Universe-6', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Admin\"]}}]', 12, 1),
(106, '2025-08-29 12:57:32.644415', '7', 'Universe-7', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Admin\"]}}]', 12, 1),
(107, '2025-08-29 12:57:39.151976', '8', 'Universe-8', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Admin\"]}}]', 12, 1),
(108, '2025-08-29 12:57:43.821337', '9', 'Universe-9', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Admin\"]}}]', 12, 1),
(109, '2025-08-29 12:57:48.682361', '10', 'Universe-10', 2, '[{\"changed\": {\"fields\": [\"Universe type\", \"Admin\"]}}]', 12, 1),
(110, '2025-08-29 21:24:40.307024', '2', 'Rick', 1, '[{\"added\": {}}]', 4, 1),
(111, '2025-08-29 21:25:46.651465', '3', 'Morty', 1, '[{\"added\": {}}]', 4, 1),
(112, '2025-08-30 17:46:59.114362', '2', 'Rick', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 8, 1),
(113, '2025-08-30 17:47:03.175335', '3', 'Morty', 1, '[{\"added\": {}}]', 8, 1),
(114, '2025-08-31 03:07:54.856114', '8', 'Universe-11 → Universe-2 on 2025-10-01', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(115, '2025-08-31 03:08:23.014640', '2', 'Universe-9 → Universe-3 on 2025-08-28', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(116, '2025-08-31 03:08:32.534683', '3', 'Universe-4 → Universe-3 on 2025-08-30', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(117, '2025-08-31 03:08:38.149193', '4', 'Ultra_Super → Universe-6 on 2025-08-27', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(118, '2025-08-31 03:08:45.900581', '6', 'Universe-9 → Universe-4 on 2025-08-27', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 11, 1),
(119, '2025-08-31 05:29:42.302822', '1', 'Morty -> Universe-11 at 2025-08-31 05:29:42.290325+00:00', 1, '[{\"added\": {}}]', 14, 1),
(120, '2025-08-31 05:29:53.901158', '2', 'Rick -> Universe-2 at 2025-08-31 05:29:53.901158+00:00', 1, '[{\"added\": {}}]', 14, 1),
(121, '2025-08-31 05:30:04.828612', '3', 'rick_morty -> Universe-4 at 2025-08-31 05:30:04.824554+00:00', 1, '[{\"added\": {}}]', 14, 1),
(122, '2025-08-31 15:23:31.524739', '3', 'Morty', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 4, 1),
(123, '2025-08-31 15:24:18.708452', '2', 'Rick', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 4, 1),
(124, '2025-08-31 15:28:57.422858', '1', 'Universe-11', 2, '[{\"changed\": {\"fields\": [\"Admin\"]}}]', 12, 1),
(125, '2025-08-31 16:07:19.970211', '21', 'recent', 1, '[{\"added\": {}}]', 12, 1),
(126, '2025-08-31 16:07:45.547580', '22', 'most recent', 1, '[{\"added\": {}}]', 12, 1),
(127, '2025-08-31 17:33:08.600190', '4', '@Myshaahamed', 1, '[{\"added\": {}}]', 4, 1),
(128, '2025-09-01 12:41:51.738723', '5', 'usha_', 1, '[{\"added\": {}}]', 4, 1),
(129, '2025-09-01 12:42:08.961584', '6', 'ritu', 1, '[{\"added\": {}}]', 4, 1),
(130, '2025-09-01 12:42:36.068366', '7', 'mridha', 1, '[{\"added\": {}}]', 4, 1),
(131, '2025-09-01 12:42:49.050367', '8', 'ruhin', 1, '[{\"added\": {}}]', 4, 1),
(132, '2025-09-01 12:43:45.006637', '9', 'ramisha_', 1, '[{\"added\": {}}]', 4, 1),
(133, '2025-09-01 12:44:05.987509', '10', 'rita', 1, '[{\"added\": {}}]', 4, 1),
(134, '2025-09-01 12:44:38.952810', '11', 'onty', 1, '[{\"added\": {}}]', 4, 1),
(135, '2025-09-01 12:45:42.998815', '12', 'alma', 1, '[{\"added\": {}}]', 4, 1),
(136, '2025-09-01 12:46:00.641426', '13', 'tabia', 1, '[{\"added\": {}}]', 4, 1),
(137, '2025-09-01 12:46:16.678020', '14', 'tohsin', 1, '[{\"added\": {}}]', 4, 1),
(138, '2025-09-01 12:47:37.658677', '25', 'sparsa', 1, '[{\"added\": {}}]', 12, 1),
(139, '2025-09-01 13:00:54.128903', '26', 'Universe-3', 1, '[{\"added\": {}}]', 12, 1),
(140, '2025-09-01 13:01:18.177143', '21', 'Rick -> Universe-5 at 2025-09-01 13:01:18.176314+00:00', 1, '[{\"added\": {}}]', 14, 1),
(141, '2025-09-01 19:15:31.257098', '8', 'usha_ → Universe-11 → Universe-2 on 2025-10-01 (ID: 8)', 3, '', 16, 1),
(142, '2025-09-01 19:15:55.120368', '6', 'usha_ → Universe-3 → Universe-7 on 2025-09-10 (ID: 5)', 3, '', 16, 1),
(143, '2025-09-01 19:15:55.127355', '5', 'usha_ → Universe-3 → Universe-7 on 2025-09-10 (ID: 5)', 3, '', 16, 1),
(144, '2025-09-01 19:15:55.148743', '4', 'usha_ → Universe-3 → Universe-7 on 2025-09-10 (ID: 5)', 3, '', 16, 1),
(145, '2025-09-01 19:15:55.152735', '3', 'usha_ → Universe-3 → Universe-7 on 2025-09-10 (ID: 5)', 3, '', 16, 1),
(146, '2025-09-01 19:15:55.159743', '2', 'usha_ → Universe-3 → Universe-7 on 2025-09-10 (ID: 5)', 3, '', 16, 1),
(147, '2025-09-04 20:30:52.225533', '42', 'rick_morty → Universe-3 → Universe-10 on 2025-09-11 (ID: 17)', 3, '', 16, 1),
(148, '2025-09-04 20:31:12.017536', '1', 'rick_morty → Universe-3 → Universe-7 on 2025-09-10 (ID: 5)', 3, '', 16, 1),
(149, '2025-09-04 20:32:02.746896', '68', 'TransactionRecord object (68)', 3, '', 17, 1),
(150, '2025-09-04 20:33:08.823975', '70', 'Order 70 - rick_morty', 3, '', 20, 1),
(151, '2025-09-04 20:34:09.160996', '8', 'Cart(rick_morty)', 3, '', 19, 1),
(152, '2025-09-04 20:34:42.664045', '3', 'Morty', 3, '', 8, 1),
(153, '2025-09-04 20:34:42.673099', '2', 'Rick', 3, '', 8, 1),
(154, '2025-09-04 20:34:42.677022', '1', 'No User Assigned', 3, '', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'universe', 'admin'),
(15, 'universe', 'artefact'),
(9, 'universe', 'auction'),
(16, 'universe', 'booking'),
(19, 'universe', 'cart'),
(21, 'universe', 'cartitem'),
(14, 'universe', 'journeylog'),
(10, 'universe', 'marketplace'),
(20, 'universe', 'order'),
(18, 'universe', 'orderitem'),
(11, 'universe', 'portaltimescheduler'),
(7, 'universe', 'randomevent'),
(17, 'universe', 'transactionrecord'),
(12, 'universe', 'universe'),
(13, 'universe', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-08-26 15:33:20.147813'),
(2, 'auth', '0001_initial', '2025-08-26 15:33:20.982541'),
(3, 'admin', '0001_initial', '2025-08-26 15:33:21.189335'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-08-26 15:33:21.224233'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-08-26 15:33:21.251943'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-08-26 15:33:21.348914'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-08-26 15:33:21.440836'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-08-26 15:33:21.493809'),
(9, 'auth', '0004_alter_user_username_opts', '2025-08-26 15:33:21.519589'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-08-26 15:33:21.585891'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-08-26 15:33:21.596438'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-08-26 15:33:21.619483'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-08-26 15:33:21.649055'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-08-26 15:33:21.678502'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-08-26 15:33:21.711869'),
(16, 'auth', '0011_update_proxy_permissions', '2025-08-26 15:33:21.733693'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-08-26 15:33:21.763172'),
(18, 'sessions', '0001_initial', '2025-08-26 15:33:21.800524'),
(29, 'universe', '0001_initial', '2025-08-31 05:09:55.220231'),
(30, 'universe', '0002_auto_20250901_2209', '2025-09-01 16:09:28.111629');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketplace`
--

CREATE TABLE `marketplace` (
  `MARKETPLACE_ID` int(5) NOT NULL,
  `PRICE` int(4) NOT NULL,
  `A_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `portal_time_scheduler`
--

CREATE TABLE `portal_time_scheduler` (
  `TRAVEL_ID` int(5) NOT NULL,
  `SOURCE` text NOT NULL,
  `DATE` date NOT NULL,
  `DESTINATION` text NOT NULL,
  `MAX_CAPACITY` int(3) NOT NULL,
  `STATUS` text NOT NULL,
  `A_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `random_event`
--

CREATE TABLE `random_event` (
  `EVENT_ID` int(5) NOT NULL,
  `NAME` text NOT NULL,
  `EFFECT` varchar(50) NOT NULL,
  `DATE_TRIGGERED` date NOT NULL,
  `A_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `universe`
--

CREATE TABLE `universe` (
  `UNIVERSE_ID` int(5) NOT NULL,
  `UNIVERSE_TYPE` text NOT NULL,
  `NAME` text NOT NULL,
  `VISIT_DATE` date NOT NULL,
  `DESTROYED_DATE` date NOT NULL,
  `STATUS` text NOT NULL,
  `VISITED_INTERGALECTIC_BEINGS` text NOT NULL,
  `DANGER_LEVEL` int(1) NOT NULL,
  `A_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `universe_admin`
--

CREATE TABLE `universe_admin` (
  `admin_id` int(11) NOT NULL,
  `role` longtext NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `universe_artefact`
--

CREATE TABLE `universe_artefact` (
  `artefact_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `collection_date` date DEFAULT NULL,
  `details` text DEFAULT NULL,
  `origin_universe` varchar(200) DEFAULT NULL,
  `artefact_type` varchar(100) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `universe_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `is_common` tinyint(1) DEFAULT 1,
  `is_rare` tinyint(1) DEFAULT 0,
  `listed` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_artefact`
--

INSERT INTO `universe_artefact` (`artefact_id`, `name`, `price`, `collection_date`, `details`, `origin_universe`, `artefact_type`, `admin_id`, `universe_id`, `quantity`, `is_common`, `is_rare`, `listed`, `created_at`) VALUES
(1, 'Ancient Sword', 100.00, '2025-01-01', 'A sword from a forgotten realm.', 'Earth-616', 'Weapon', NULL, NULL, 1, 1, 0, 1, '2025-09-02 12:53:14'),
(2, 'Magic Potion', 25.50, '2025-02-15', 'Restores health instantly.', 'Earth-1610', 'Potion', NULL, NULL, 8, 1, 0, 1, '2025-09-02 12:53:14'),
(3, 'Golden Shield', 150.75, '2025-03-10', 'Shines bright and blocks attacks.', 'Earth-1999', 'Armor', NULL, NULL, 3, 1, 0, 1, '2025-09-02 12:53:14'),
(4, 'Ancient Scroll', 50.00, '2025-04-05', 'Contains lost knowledge.', 'Earth-2149', 'Scroll', NULL, NULL, 4, 1, 0, 1, '2025-09-02 12:53:14'),
(5, 'Ancient Sword', 100.00, '2025-01-01', 'A sword from a forgotten realm.', 'Earth-616', 'Weapon', NULL, NULL, 1, 1, 0, 1, '2025-09-02 12:54:57'),
(6, 'Magic Potion', 25.50, '2025-02-15', 'Restores health instantly.', 'Earth-1610', 'Potion', NULL, NULL, 0, 1, 0, 1, '2025-09-02 12:54:57'),
(7, 'Golden Shield', 150.75, '2025-03-10', 'Shines bright and blocks attacks.', 'Earth-1999', 'Armor', NULL, NULL, 1, 1, 0, 1, '2025-09-02 12:54:57'),
(8, 'Ancient Scroll', 50.00, '2025-04-05', 'Contains lost knowledge.', 'Earth-2149', 'Scroll', NULL, NULL, 0, 1, 0, 1, '2025-09-02 12:54:57'),
(9, 'Mystic Ring', 75.00, '2025-02-20', 'Grants minor magical powers.', 'Earth-1610', 'Accessory', NULL, NULL, 0, 1, 0, 1, '2025-09-02 12:54:57'),
(10, 'Enchanted Bow', 120.00, '2025-01-25', 'Fires arrows magically.', 'Earth-1999', 'Weapon', NULL, NULL, 0, 1, 0, 1, '2025-09-02 12:54:57'),
(11, 'Silver Dagger', 60.50, '2025-03-15', 'Lightweight and deadly.', 'Earth-616', 'Weapon', NULL, NULL, 7, 1, 0, 1, '2025-09-02 12:54:57'),
(12, 'Healing Herb', 15.25, '2025-04-10', 'Used in potions.', 'Earth-2149', 'Herb', NULL, NULL, 1, 1, 0, 1, '2025-09-02 12:54:57'),
(13, 'Crystal Amulet', 200.00, '2025-02-05', 'Protects from dark magic.', 'Earth-1610', 'Accessory', NULL, NULL, 0, 1, 0, 1, '2025-09-02 12:54:57'),
(14, 'Bronze Helmet', 80.00, '2025-03-01', 'Standard battle helmet.', 'Earth-1999', 'Armor', NULL, NULL, 7, 1, 0, 1, '2025-09-02 12:54:57'),
(15, 'Fire Elixir', 30.50, '2025-01-10', 'Grants temporary fire immunity.', 'Earth-616', 'Potion', NULL, NULL, 13, 1, 0, 1, '2025-09-02 12:54:57'),
(16, 'Ice Amulet', 55.75, '2025-02-12', 'Reduces ice damage.', 'Earth-2149', 'Accessory', NULL, NULL, 0, 1, 0, 1, '2025-09-02 12:54:57'),
(17, 'Mystic Cloak', 95.00, '2025-03-18', 'Increases stealth.', 'Earth-1610', 'Armor', NULL, NULL, 0, 1, 0, 1, '2025-09-02 12:54:57'),
(18, 'Thunder Hammer', 180.00, '2025-04-22', 'Strikes lightning upon impact.', 'Earth-1999', 'Weapon', NULL, NULL, 3, 1, 0, 1, '2025-09-02 12:54:57'),
(19, 'Healing Potion', 22.50, '2025-01-30', 'Restores health slowly.', 'Earth-616', 'Potion', NULL, NULL, 18, 1, 0, 1, '2025-09-02 12:54:57'),
(20, 'Golden Necklace', 130.00, '2025-02-28', 'Shines with wealth.', 'Earth-2149', 'Accessory', NULL, NULL, 6, 1, 0, 1, '2025-09-02 12:54:57'),
(21, 'Shadow Blade', 110.00, '2025-03-05', 'Absorbs light.', 'Earth-1610', 'Weapon', NULL, NULL, 4, 1, 0, 1, '2025-09-02 12:54:57'),
(22, 'Mana Crystal', 40.00, '2025-04-12', 'Used to recharge magic.', 'Earth-1999', 'Crystal', NULL, NULL, 18, 1, 0, 1, '2025-09-02 12:54:57'),
(23, 'Elven Boots', 65.00, '2025-01-18', 'Increases speed.', 'Earth-616', 'Armor', NULL, NULL, 5, 1, 0, 1, '2025-09-02 12:54:57'),
(24, 'Dragon Scale', 150.00, '2025-02-08', 'Rare crafting material.', 'Earth-2149', 'Material', NULL, NULL, 5, 1, 0, 1, '2025-09-02 12:54:57'),
(25, 'Phoenix Feather', 90.00, '2025-03-25', 'Used in potent spells.', 'Earth-1610', 'Material', NULL, NULL, 3, 1, 0, 1, '2025-09-02 12:54:57'),
(26, 'Silver Bracelet', 45.00, '2025-04-02', 'Simple enchanted jewelry.', 'Earth-1999', 'Accessory', NULL, NULL, 10, 1, 0, 1, '2025-09-02 12:54:57'),
(27, 'Battle Axe', 140.00, '2025-01-15', 'Heavy and powerful.', 'Earth-616', 'Weapon', NULL, NULL, 6, 1, 0, 1, '2025-09-02 12:54:57'),
(28, 'Magic Lamp', 75.50, '2025-02-18', 'Contains a spirit.', 'Earth-2149', 'Artifact', NULL, NULL, 8, 1, 0, 1, '2025-09-02 12:54:57'),
(29, 'Crystal Orb', 160.00, '2025-03-12', 'Shows visions of the future.', 'Earth-1610', 'Artifact', NULL, NULL, 0, 1, 0, 1, '2025-09-02 12:54:57'),
(30, 'Iron Gauntlets', 85.00, '2025-04-08', 'Provides hand protection.', 'Earth-1999', 'Armor', NULL, NULL, 9, 1, 0, 1, '2025-09-02 12:54:57'),
(31, 'Excalibur', 1000.00, '2025-01-01', 'Legendary sword of King Arthur.', 'Earth-616', 'Weapon', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(32, 'Philosopher\'s Stone', 1500.00, '2025-02-01', 'Grants immortality.', 'Earth-1610', 'Artifact', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(33, 'Infinity Gauntlet', 5000.00, '2025-03-01', 'Holds all Infinity Stones.', 'Earth-1999', 'Artifact', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(34, 'Cloak of Invisibility', 1200.00, '2025-04-01', 'Makes the wearer invisible.', 'Earth-2149', 'Armor', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(35, 'Dragonheart Amulet', 2000.00, '2025-05-01', 'Contains the heart of a dragon.', 'Earth-616', 'Accessory', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(36, 'Mjolnir', 4000.00, '2025-06-01', 'Hammer of Thor.', 'Asgard', 'Weapon', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(37, 'Elder Wand', 1800.00, '2025-07-01', 'Most powerful wand in existence.', 'Earth-1610', 'Weapon', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(38, 'Orb of Agamotto', 2200.00, '2025-08-01', 'Time-manipulating artifact.', 'Earth-616', 'Artifact', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(39, 'Heart of Tefnut', 2500.00, '2025-09-01', 'Ancient Egyptian magical stone.', 'Earth-616', 'Artifact', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(40, 'Crystal Skull', 1700.00, '2025-10-01', 'Mystical skull with psychic powers.', 'Earth-1610', 'Artifact', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(41, 'Spear of Destiny', 3000.00, '2025-11-01', 'Holy spear of immense power.', 'Earth-1999', 'Weapon', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(42, 'Necronomicon', 1600.00, '2025-12-01', 'Ancient book of forbidden knowledge.', 'Earth-616', 'Book', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(43, 'Ring of Solomon', 1400.00, '2025-01-15', 'Ring granting wisdom and control over demons.', 'Earth-1610', 'Accessory', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(44, 'Golden Fleece', 3200.00, '2025-02-15', 'Magical fleece of a golden ram.', 'Earth-616', 'Artifact', NULL, NULL, 0, 0, 1, 1, '2025-09-02 12:55:49'),
(45, 'Horn of Plenty', 900.00, '2025-03-15', 'Provides endless abundance.', 'Earth-1610', 'Artifact', NULL, NULL, 1, 0, 1, 1, '2025-09-02 12:55:49'),
(46, 'Phoenix Feather', 1100.00, '2025-04-15', 'Core of a wizard wand.', 'Earth-1610', 'Accessory', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(47, 'Crown of Ages', 3500.00, '2025-05-15', 'Grants ruler immense power.', 'Earth-1999', 'Armor', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(48, 'Tesseract', 4800.00, '2025-06-15', 'Cosmic Cube of unimaginable power.', 'Earth-616', 'Artifact', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(49, 'Eye of Agamotto', 2100.00, '2025-07-15', 'Artifact used to manipulate time.', 'Earth-616', 'Artifact', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(50, 'Ring of Power', 5000.00, '2025-08-15', 'One ring to rule them all.', 'Middle-earth', 'Accessory', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(51, 'Sword of Gryffindor', 1300.00, '2025-09-15', 'Goblin-forged sword.', 'Earth-1610', 'Weapon', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(52, 'Necklace of Harmonia', 1500.00, '2025-10-15', 'Brings luck and misfortune.', 'Earth-616', 'Accessory', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(53, 'Shield of Achilles', 2700.00, '2025-11-15', 'Legendary shield.', 'Earth-616', 'Armor', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(54, 'Amulet of Yendor', 1900.00, '2025-12-15', 'Powerful magical amulet.', 'Earth-616', 'Accessory', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(55, 'Book of Thoth', 1600.00, '2025-01-20', 'Ancient Egyptian magical tome.', 'Earth-616', 'Book', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(56, 'Cape of Levitation', 1400.00, '2025-02-20', 'Levitation cloak.', 'Earth-616', 'Armor', NULL, NULL, 1, 0, 1, 0, '2025-09-02 12:55:49'),
(57, 'Ancient Portal Key', 1000.00, NULL, NULL, NULL, 'Key', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(58, 'Time Crystal', 2000.00, NULL, NULL, NULL, 'Crystal', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(59, 'Dimensional Compass', 1500.00, NULL, NULL, NULL, 'Tool', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(60, 'Multiverse Map', 1200.00, NULL, NULL, NULL, 'Map', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(61, 'Quantum Blade', 1800.00, NULL, NULL, NULL, 'Weapon', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(62, 'Cosmic Amulet', 2200.00, NULL, NULL, NULL, 'Jewelry', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(63, 'Ethereal Cloak', 1300.00, NULL, NULL, NULL, 'Clothing', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(64, 'Void Lantern', 900.00, NULL, NULL, NULL, 'Artifact', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(65, 'Star Fragment', 2500.00, NULL, NULL, NULL, 'Gem', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(66, 'Celestial Orb', 2700.00, NULL, NULL, NULL, 'Orb', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(67, 'Dark Matter Capsule', 3000.00, NULL, NULL, NULL, 'Tech', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(68, 'Time Loop Device', 3500.00, NULL, NULL, NULL, 'Tech', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(69, 'Gravity Stone', 4000.00, NULL, NULL, NULL, 'Gem', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(70, 'Infinity Sand', 3200.00, NULL, NULL, NULL, 'Material', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(71, 'Spectral Blade', 2800.00, NULL, NULL, NULL, 'Weapon', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(72, 'Chrono Ring', 3600.00, NULL, NULL, NULL, 'Jewelry', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(73, 'Phase Amulet', 2100.00, NULL, NULL, NULL, 'Jewelry', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(74, 'Neutrino Core', 1900.00, NULL, NULL, NULL, 'Tech', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(75, 'Shadow Lantern', 1700.00, NULL, NULL, NULL, 'Artifact', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(76, 'Void Crystal', 2400.00, NULL, NULL, NULL, 'Crystal', NULL, NULL, 1, 0, 1, 0, '2025-09-02 13:10:25'),
(77, 'Common Artefact 1', 36.00, '2025-09-02', 'This is common artefact number 1.', 'Universe 5', 'Common', NULL, NULL, 2, 1, 0, 1, '2025-09-02 21:54:31'),
(78, 'Common Artefact 2', 53.00, '2025-09-02', 'This is common artefact number 2.', 'Universe 4', 'Common', NULL, NULL, 2, 1, 0, 1, '2025-09-02 21:54:31'),
(79, 'Common Artefact 3', 81.00, '2025-09-02', 'This is common artefact number 3.', 'Universe 4', 'Common', NULL, NULL, 1, 1, 0, 1, '2025-09-02 21:54:31'),
(80, 'Common Artefact 4', 14.00, '2025-09-02', 'This is common artefact number 4.', 'Universe 2', 'Common', NULL, NULL, 0, 1, 0, 1, '2025-09-02 21:54:31'),
(81, 'Common Artefact 5', 26.00, '2025-09-02', 'This is common artefact number 5.', 'Universe 2', 'Common', NULL, NULL, 1, 1, 0, 1, '2025-09-02 21:54:31'),
(82, 'Common Artefact 6', 20.00, '2025-09-02', 'This is common artefact number 6.', 'Universe 3', 'Common', NULL, NULL, 2, 1, 0, 1, '2025-09-02 21:54:31'),
(83, 'Common Artefact 7', 96.00, '2025-09-02', 'This is common artefact number 7.', 'Universe 5', 'Common', NULL, NULL, 8, 1, 0, 1, '2025-09-02 21:54:31'),
(84, 'Common Artefact 8', 46.00, '2025-09-02', 'This is common artefact number 8.', 'Universe 4', 'Common', NULL, NULL, 5, 1, 0, 1, '2025-09-02 21:54:31'),
(85, 'Common Artefact 9', 85.00, '2025-09-02', 'This is common artefact number 9.', 'Universe 4', 'Common', NULL, NULL, 5, 1, 0, 1, '2025-09-02 21:54:31'),
(86, 'Common Artefact 10', 38.00, '2025-09-02', 'This is common artefact number 10.', 'Universe 1', 'Common', NULL, NULL, 6, 1, 0, 1, '2025-09-02 21:54:31'),
(87, 'Common Artefact 11', 38.00, '2025-09-02', 'This is common artefact number 11.', 'Universe 4', 'Common', NULL, NULL, 5, 1, 0, 1, '2025-09-02 21:54:31'),
(88, 'Common Artefact 12', 70.00, '2025-09-02', 'This is common artefact number 12.', 'Universe 1', 'Common', NULL, NULL, 5, 1, 0, 1, '2025-09-02 21:54:31'),
(89, 'Common Artefact 13', 45.00, '2025-09-02', 'This is common artefact number 13.', 'Universe 3', 'Common', NULL, NULL, 9, 1, 0, 1, '2025-09-02 21:54:31'),
(90, 'Common Artefact 14', 84.00, '2025-09-02', 'This is common artefact number 14.', 'Universe 2', 'Common', NULL, NULL, 5, 1, 0, 1, '2025-09-02 21:54:31'),
(91, 'Common Artefact 15', 52.00, '2025-09-02', 'This is common artefact number 15.', 'Universe 3', 'Common', NULL, NULL, 3, 1, 0, 1, '2025-09-02 21:54:31'),
(92, 'Common Artefact 16', 73.00, '2025-09-02', 'This is common artefact number 16.', 'Universe 2', 'Common', NULL, NULL, 5, 1, 0, 1, '2025-09-02 21:54:31'),
(93, 'Common Artefact 17', 18.00, '2025-09-02', 'This is common artefact number 17.', 'Universe 2', 'Common', NULL, NULL, 7, 1, 0, 1, '2025-09-02 21:54:31'),
(94, 'Common Artefact 18', 12.00, '2025-09-02', 'This is common artefact number 18.', 'Universe 1', 'Common', NULL, NULL, 1, 1, 0, 1, '2025-09-02 21:54:31'),
(95, 'Common Artefact 19', 56.00, '2025-09-02', 'This is common artefact number 19.', 'Universe 4', 'Common', NULL, NULL, 1, 1, 0, 1, '2025-09-02 21:54:31'),
(96, 'Common Artefact 20', 74.00, '2025-09-02', 'This is common artefact number 20.', 'Universe 3', 'Common', NULL, NULL, 3, 1, 0, 1, '2025-09-02 21:54:31'),
(97, 'Common Artefact 21', 11.00, '2025-09-02', 'This is common artefact number 21.', 'Universe 3', 'Common', NULL, NULL, 4, 1, 0, 1, '2025-09-02 21:54:31'),
(98, 'Common Artefact 22', 18.00, '2025-09-02', 'This is common artefact number 22.', 'Universe 1', 'Common', NULL, NULL, 9, 1, 0, 1, '2025-09-02 21:54:31'),
(99, 'Common Artefact 23', 47.00, '2025-09-02', 'This is common artefact number 23.', 'Universe 4', 'Common', NULL, NULL, 3, 1, 0, 1, '2025-09-02 21:54:31'),
(100, 'Common Artefact 24', 87.00, '2025-09-02', 'This is common artefact number 24.', 'Universe 2', 'Common', NULL, NULL, 9, 1, 0, 1, '2025-09-02 21:54:31'),
(101, 'Common Artefact 25', 62.00, '2025-09-02', 'This is common artefact number 25.', 'Universe 5', 'Common', NULL, NULL, 9, 1, 0, 1, '2025-09-02 21:54:31'),
(102, 'Common Artefact 26', 94.00, '2025-09-02', 'This is common artefact number 26.', 'Universe 3', 'Common', NULL, NULL, 9, 1, 0, 1, '2025-09-02 21:54:31'),
(103, 'Common Artefact 27', 59.00, '2025-09-02', 'This is common artefact number 27.', 'Universe 1', 'Common', NULL, NULL, 3, 1, 0, 1, '2025-09-02 21:54:31'),
(104, 'Common Artefact 28', 30.00, '2025-09-02', 'This is common artefact number 28.', 'Universe 5', 'Common', NULL, NULL, 1, 1, 0, 1, '2025-09-02 21:54:31'),
(105, 'Common Artefact 29', 90.00, '2025-09-02', 'This is common artefact number 29.', 'Universe 5', 'Common', NULL, NULL, 2, 1, 0, 1, '2025-09-02 21:54:31'),
(106, 'Common Artefact 30', 92.00, '2025-09-02', 'This is common artefact number 30.', 'Universe 5', 'Common', NULL, NULL, 6, 1, 0, 1, '2025-09-02 21:54:31'),
(107, 'Common Artefact 31', 45.00, '2025-09-02', 'This is common artefact number 31.', 'Universe 2', 'Common', NULL, NULL, 3, 1, 0, 1, '2025-09-02 21:54:31'),
(108, 'Common Artefact 32', 51.00, '2025-09-02', 'This is common artefact number 32.', 'Universe 2', 'Common', NULL, NULL, 4, 1, 0, 1, '2025-09-02 21:54:31'),
(109, 'Common Artefact 33', 31.00, '2025-09-02', 'This is common artefact number 33.', 'Universe 3', 'Common', NULL, NULL, 9, 1, 0, 1, '2025-09-02 21:54:31'),
(110, 'Common Artefact 34', 38.00, '2025-09-02', 'This is common artefact number 34.', 'Universe 4', 'Common', NULL, NULL, 4, 1, 0, 1, '2025-09-02 21:54:31'),
(111, 'Common Artefact 35', 85.00, '2025-09-02', 'This is common artefact number 35.', 'Universe 2', 'Common', NULL, NULL, 2, 1, 0, 1, '2025-09-02 21:54:31'),
(112, 'Common Artefact 36', 100.00, '2025-09-02', 'This is common artefact number 36.', 'Universe 4', 'Common', NULL, NULL, 6, 1, 0, 1, '2025-09-02 21:54:31'),
(113, 'Common Artefact 37', 85.00, '2025-09-02', 'This is common artefact number 37.', 'Universe 3', 'Common', NULL, NULL, 4, 1, 0, 1, '2025-09-02 21:54:31'),
(114, 'Common Artefact 38', 52.00, '2025-09-02', 'This is common artefact number 38.', 'Universe 4', 'Common', NULL, NULL, 5, 1, 0, 1, '2025-09-02 21:54:31'),
(115, 'Common Artefact 39', 69.00, '2025-09-02', 'This is common artefact number 39.', 'Universe 2', 'Common', NULL, NULL, 8, 1, 0, 1, '2025-09-02 21:54:31'),
(116, 'Common Artefact 40', 16.00, '2025-09-02', 'This is common artefact number 40.', 'Universe 5', 'Common', NULL, NULL, 3, 1, 0, 1, '2025-09-02 21:54:31'),
(117, 'Rare Artefact 1', 871.00, '2025-09-02', 'This is rare artefact number 1.', 'Universe 5', 'Rare', NULL, NULL, 1, 0, 1, 1, '2025-09-02 21:54:33'),
(118, 'Rare Artefact 2', 361.00, '2025-09-02', 'This is rare artefact number 2.', 'Universe 3', 'Rare', NULL, NULL, 2, 0, 1, 1, '2025-09-02 21:54:33'),
(119, 'Rare Artefact 3', 796.00, '2025-09-02', 'This is rare artefact number 3.', 'Universe 3', 'Rare', NULL, NULL, 0, 0, 1, 1, '2025-09-02 21:54:33'),
(120, 'Rare Artefact 4', 949.00, '2025-09-02', 'This is rare artefact number 4.', 'Universe 5', 'Rare', NULL, NULL, 4, 0, 1, 1, '2025-09-02 21:54:33'),
(121, 'Rare Artefact 5', 427.00, '2025-09-02', 'This is rare artefact number 5.', 'Universe 1', 'Rare', NULL, NULL, 0, 0, 1, 1, '2025-09-02 21:54:33'),
(122, 'Rare Artefact 6', 736.00, '2025-09-02', 'This is rare artefact number 6.', 'Universe 1', 'Rare', NULL, NULL, 0, 0, 1, 1, '2025-09-02 21:54:33'),
(123, 'Rare Artefact 7', 943.00, '2025-09-02', 'This is rare artefact number 7.', 'Universe 1', 'Rare', NULL, NULL, 3, 0, 1, 1, '2025-09-02 21:54:33'),
(124, 'Rare Artefact 8', 642.00, '2025-09-02', 'This is rare artefact number 8.', 'Universe 5', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(125, 'Rare Artefact 9', 465.00, '2025-09-02', 'This is rare artefact number 9.', 'Universe 4', 'Rare', NULL, NULL, 4, 0, 1, 1, '2025-09-02 21:54:33'),
(126, 'Rare Artefact 10', 221.00, '2025-09-02', 'This is rare artefact number 10.', 'Universe 4', 'Rare', NULL, NULL, 2, 0, 1, 1, '2025-09-02 21:54:33'),
(127, 'Rare Artefact 11', 891.00, '2025-09-02', 'This is rare artefact number 11.', 'Universe 1', 'Rare', NULL, NULL, 4, 0, 1, 1, '2025-09-02 21:54:33'),
(128, 'Rare Artefact 12', 549.00, '2025-09-02', 'This is rare artefact number 12.', 'Universe 4', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(129, 'Rare Artefact 13', 701.00, '2025-09-02', 'This is rare artefact number 13.', 'Universe 3', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(130, 'Rare Artefact 14', 501.00, '2025-09-02', 'This is rare artefact number 14.', 'Universe 3', 'Rare', NULL, NULL, 2, 0, 1, 1, '2025-09-02 21:54:33'),
(131, 'Rare Artefact 15', 859.00, '2025-09-02', 'This is rare artefact number 15.', 'Universe 4', 'Rare', NULL, NULL, 1, 0, 1, 1, '2025-09-02 21:54:33'),
(132, 'Rare Artefact 16', 746.00, '2025-09-02', 'This is rare artefact number 16.', 'Universe 5', 'Rare', NULL, NULL, 2, 0, 1, 1, '2025-09-02 21:54:33'),
(133, 'Rare Artefact 17', 990.00, '2025-09-02', 'This is rare artefact number 17.', 'Universe 4', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(134, 'Rare Artefact 18', 495.00, '2025-09-02', 'This is rare artefact number 18.', 'Universe 2', 'Rare', NULL, NULL, 1, 0, 1, 1, '2025-09-02 21:54:33'),
(135, 'Rare Artefact 19', 726.00, '2025-09-02', 'This is rare artefact number 19.', 'Universe 2', 'Rare', NULL, NULL, 2, 0, 1, 1, '2025-09-02 21:54:33'),
(136, 'Rare Artefact 20', 278.00, '2025-09-02', 'This is rare artefact number 20.', 'Universe 5', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(137, 'Rare Artefact 21', 604.00, '2025-09-02', 'This is rare artefact number 21.', 'Universe 2', 'Rare', NULL, NULL, 4, 0, 1, 1, '2025-09-02 21:54:33'),
(138, 'Rare Artefact 22', 853.00, '2025-09-02', 'This is rare artefact number 22.', 'Universe 2', 'Rare', NULL, NULL, 3, 0, 1, 1, '2025-09-02 21:54:33'),
(139, 'Rare Artefact 23', 444.00, '2025-09-02', 'This is rare artefact number 23.', 'Universe 1', 'Rare', NULL, NULL, 4, 0, 1, 1, '2025-09-02 21:54:33'),
(140, 'Rare Artefact 24', 359.00, '2025-09-02', 'This is rare artefact number 24.', 'Universe 2', 'Rare', NULL, NULL, 4, 0, 1, 1, '2025-09-02 21:54:33'),
(141, 'Rare Artefact 25', 959.00, '2025-09-02', 'This is rare artefact number 25.', 'Universe 1', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(142, 'Rare Artefact 26', 456.00, '2025-09-02', 'This is rare artefact number 26.', 'Universe 3', 'Rare', NULL, NULL, 4, 0, 1, 1, '2025-09-02 21:54:33'),
(143, 'Rare Artefact 27', 720.00, '2025-09-02', 'This is rare artefact number 27.', 'Universe 5', 'Rare', NULL, NULL, 3, 0, 1, 1, '2025-09-02 21:54:33'),
(144, 'Rare Artefact 28', 787.00, '2025-09-02', 'This is rare artefact number 28.', 'Universe 3', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(145, 'Rare Artefact 29', 910.00, '2025-09-02', 'This is rare artefact number 29.', 'Universe 5', 'Rare', NULL, NULL, 4, 0, 1, 1, '2025-09-02 21:54:33'),
(146, 'Rare Artefact 30', 744.00, '2025-09-02', 'This is rare artefact number 30.', 'Universe 2', 'Rare', NULL, NULL, 3, 0, 1, 1, '2025-09-02 21:54:33'),
(147, 'Rare Artefact 31', 704.00, '2025-09-02', 'This is rare artefact number 31.', 'Universe 4', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(148, 'Rare Artefact 32', 578.00, '2025-09-02', 'This is rare artefact number 32.', 'Universe 4', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(149, 'Rare Artefact 33', 432.00, '2025-09-02', 'This is rare artefact number 33.', 'Universe 2', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(150, 'Rare Artefact 34', 741.00, '2025-09-02', 'This is rare artefact number 34.', 'Universe 4', 'Rare', NULL, NULL, 4, 0, 1, 1, '2025-09-02 21:54:33'),
(151, 'Rare Artefact 35', 521.00, '2025-09-02', 'This is rare artefact number 35.', 'Universe 4', 'Rare', NULL, NULL, 2, 0, 1, 1, '2025-09-02 21:54:33'),
(152, 'Rare Artefact 36', 703.00, '2025-09-02', 'This is rare artefact number 36.', 'Universe 5', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(153, 'Rare Artefact 37', 256.00, '2025-09-02', 'This is rare artefact number 37.', 'Universe 5', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33'),
(154, 'Rare Artefact 38', 724.00, '2025-09-02', 'This is rare artefact number 38.', 'Universe 1', 'Rare', NULL, NULL, 4, 0, 1, 1, '2025-09-02 21:54:33'),
(155, 'Rare Artefact 39', 978.00, '2025-09-02', 'This is rare artefact number 39.', 'Universe 5', 'Rare', NULL, NULL, 3, 0, 1, 1, '2025-09-02 21:54:33'),
(156, 'Rare Artefact 40', 363.00, '2025-09-02', 'This is rare artefact number 40.', 'Universe 3', 'Rare', NULL, NULL, 5, 0, 1, 1, '2025-09-02 21:54:33');

-- --------------------------------------------------------

--
-- Table structure for table `universe_auction`
--

CREATE TABLE `universe_auction` (
  `auction_id` int(11) NOT NULL,
  `artefact_id` int(11) DEFAULT NULL,
  `starting_price` decimal(12,2) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 0,
  `admin_id` int(11) DEFAULT NULL,
  `winner_id` int(11) DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_auction`
--

INSERT INTO `universe_auction` (`auction_id`, `artefact_id`, `starting_price`, `start_time`, `end_time`, `active`, `admin_id`, `winner_id`, `finalized`) VALUES
(1, 31, 1000.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(2, 32, 1500.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(3, 33, 5000.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(4, 34, 1200.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(5, 35, 2000.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(6, 36, 4000.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(7, 37, 1800.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(8, 38, 2200.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(9, 39, 2500.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(10, 40, 1700.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(11, 41, 3000.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(12, 42, 1600.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(13, 43, 1400.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(14, 44, 3200.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(15, 45, 900.00, '2025-09-02 12:57:04', '2025-09-02 13:57:04', 1, NULL, NULL, 0),
(16, 57, 1000.00, '2025-09-02 07:37:53', '2025-09-02 07:42:53', 1, NULL, NULL, 0),
(17, 58, 2000.00, '2025-09-02 07:38:21', '2025-09-02 07:43:21', 1, NULL, NULL, 0),
(18, 60, 1200.00, '2025-09-02 07:44:24', '2025-09-02 07:49:24', 1, NULL, NULL, 0),
(19, 59, 1500.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(20, 61, 1800.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(21, 62, 2200.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(22, 63, 1300.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(23, 64, 900.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(24, 65, 2500.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(25, 66, 2700.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(26, 67, 3000.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(27, 68, 3500.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(28, 69, 4000.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(29, 70, 3200.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(30, 71, 2800.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(31, 72, 3600.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(32, 73, 2100.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(33, 74, 1900.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(34, 75, 1700.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(35, 76, 2400.00, '2025-09-02 07:48:05', '2025-09-02 07:53:05', 1, NULL, NULL, 0),
(43, 53, 2700.00, '2025-09-02 08:12:39', '2025-09-02 08:17:39', 1, NULL, NULL, 0),
(44, 50, 5000.00, '2025-09-02 08:12:51', '2025-09-02 08:17:51', 1, NULL, NULL, 0),
(45, 56, 1400.00, '2025-09-02 09:48:24', '2025-09-02 09:53:24', 1, NULL, NULL, 0),
(46, 55, 1600.00, '2025-09-02 10:16:32', '2025-09-02 10:21:32', 1, NULL, NULL, 0),
(47, 54, 1900.00, '2025-09-02 12:43:48', '2025-09-02 12:48:48', 1, NULL, NULL, 0),
(48, 51, 1300.00, '2025-09-02 13:12:15', '2025-09-02 13:17:15', 1, NULL, NULL, 0),
(49, 49, 2100.00, '2025-09-02 14:17:06', '2025-09-02 14:22:06', 1, NULL, NULL, 0),
(50, 48, 4800.00, '2025-09-02 14:42:37', '2025-09-02 14:47:37', 1, 1, NULL, 0),
(51, 52, 1500.00, '2025-09-02 14:44:31', '2025-09-02 14:49:31', 1, 1, NULL, 0),
(52, 47, 3500.00, '2025-09-02 14:44:34', '2025-09-02 14:49:34', 1, 1, NULL, 0),
(53, 46, 1100.00, '2025-09-02 16:29:15', '2025-09-02 16:34:15', 1, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `universe_bid`
--

CREATE TABLE `universe_bid` (
  `id` int(11) NOT NULL,
  `auction_id` int(11) DEFAULT NULL,
  `bidder_id` int(11) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_bid`
--

INSERT INTO `universe_bid` (`id`, `auction_id`, `bidder_id`, `amount`, `created_at`) VALUES
(1, 53, 1, 1100.00, '2025-09-02 16:29:15');

-- --------------------------------------------------------

--
-- Table structure for table `universe_booking`
--

CREATE TABLE `universe_booking` (
  `id` bigint(20) NOT NULL,
  `canceled` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booked_at` datetime(6) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_booking`
--

INSERT INTO `universe_booking` (`id`, `canceled`, `user_id`, `booked_at`, `schedule_id`) VALUES
(7, 0, 5, '2025-09-01 17:16:42.786222', 5),
(9, 0, 17, '2025-09-01 18:35:50.896371', 8),
(10, 0, 5, '2025-09-01 19:07:40.050396', 16),
(11, 0, 5, '2025-09-01 19:36:13.789639', 14),
(12, 0, 5, '2025-09-01 19:36:30.964567', 8),
(13, 0, 5, '2025-09-01 19:38:13.293494', 15),
(15, 0, 5, '2025-09-01 19:51:58.358929', 18),
(16, 0, 5, '2025-09-01 19:56:57.148615', 17),
(17, 0, 18, '2025-09-01 19:58:34.892468', 17),
(18, 0, 18, '2025-09-01 19:59:39.724869', 5),
(20, 0, 19, '2025-09-01 20:12:53.853770', 5),
(21, 0, 19, '2025-09-01 20:13:43.212147', 16),
(22, 0, 19, '2025-09-01 20:13:55.096803', 21),
(24, 0, 21, '2025-09-01 20:23:55.667763', 5),
(25, 0, 23, '2025-09-01 20:51:16.491260', 5),
(28, 0, 24, '2025-09-02 05:31:49.506384', 8),
(29, 0, 24, '2025-09-02 05:32:07.871649', 5),
(31, 0, 25, '2025-09-02 13:22:24.322065', 17),
(34, 0, 27, '2025-09-02 22:52:01.233044', 15),
(35, 0, 27, '2025-09-02 22:52:09.240758', 17),
(37, 0, 28, '2025-09-03 05:41:06.016485', 30),
(38, 0, 28, '2025-09-03 05:41:32.202905', 25),
(39, 0, 28, '2025-09-03 05:41:42.026076', 16),
(40, 0, 30, '2025-09-04 16:23:56.704061', 14),
(41, 0, 30, '2025-09-04 16:32:39.684215', 13),
(43, 0, 7, '2025-09-04 20:29:53.310722', 17),
(44, 0, 31, '2025-09-05 12:49:06.959861', 18),
(45, 0, 31, '2025-09-05 12:49:38.458875', 5),
(46, 0, 31, '2025-09-05 12:49:59.019359', 8);

-- --------------------------------------------------------

--
-- Table structure for table `universe_cart`
--

CREATE TABLE `universe_cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_cart`
--

INSERT INTO `universe_cart` (`id`, `user_id`, `created_at`) VALUES
(1, 5, '2025-09-02 06:51:49'),
(2, 25, '2025-09-02 13:23:44'),
(3, 6, '2025-09-02 18:01:45'),
(4, 7, '2025-09-02 21:40:20'),
(5, 27, '2025-09-02 22:53:24'),
(6, 28, '2025-09-03 05:37:34'),
(7, 30, '2025-09-04 16:15:05'),
(9, 31, '2025-09-05 12:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `universe_cartitem`
--

CREATE TABLE `universe_cartitem` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `artefact_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_cartitem`
--

INSERT INTO `universe_cartitem` (`id`, `cart_id`, `artefact_id`, `quantity`) VALUES
(44, 3, 40, 2),
(45, 3, 32, 2),
(46, 3, 17, 3),
(47, 3, 37, 2),
(53, 1, 35, 2),
(56, 1, 33, 2),
(57, 1, 118, 2),
(61, 1, 119, 2),
(79, 6, 127, 1),
(84, 7, 78, 2),
(93, 9, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `universe_journeylog`
--

CREATE TABLE `universe_journeylog` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `universe_id` int(11) DEFAULT NULL,
  `travel_date` datetime NOT NULL DEFAULT current_timestamp(),
  `success` tinyint(1) NOT NULL DEFAULT 1,
  `manual_entry` tinyint(1) NOT NULL DEFAULT 0,
  `points_awarded` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_journeylog`
--

INSERT INTO `universe_journeylog` (`id`, `user_id`, `universe_id`, `travel_date`, `success`, `manual_entry`, `points_awarded`) VALUES
(1, 3, 1, '2025-08-31 05:29:42', 1, 1, 1),
(2, 2, 3, '2025-08-31 05:29:53', 1, 1, 1),
(4, 1, 1, '2025-08-31 05:54:58', 1, 1, 0),
(5, 2, 11, '2025-08-31 05:55:14', 1, 1, 4),
(6, 2, 2, '2025-08-31 06:19:36', 1, 1, -2),
(7, 3, 1, '2025-08-31 07:22:55', 1, 0, -1),
(8, 1, 2, '2025-08-31 14:42:39', 1, 0, 1),
(9, 1, 19, '2025-08-31 15:22:09', 1, 0, 5),
(10, 1, 20, '2025-08-31 15:25:31', 1, 0, 2),
(11, 1, 1, '2025-08-31 15:26:25', 1, 0, 0),
(12, 2, 1, '2025-08-31 15:28:57', 1, 0, 1),
(13, 1, 3, '2025-08-31 16:06:46', 1, 0, 1),
(14, 3, 21, '2025-08-31 16:07:19', 1, 0, 2),
(15, 2, 22, '2025-08-31 16:07:45', 1, 0, 5),
(16, 1, 23, '2025-08-31 16:08:27', 1, 0, 5),
(17, 1, 4, '2025-08-31 16:10:12', 1, 0, 2),
(19, 3, 25, '2025-09-01 12:47:37', 1, 0, 5),
(20, 3, 26, '2025-09-01 13:00:54', 1, 0, 5),
(21, 2, 6, '2025-09-01 13:01:18', 1, 0, 0),
(22, 1, 2, '2025-09-01 14:15:31', 1, 0, 0),
(23, 1, 27, '2025-09-01 20:10:33', 1, 0, 1),
(24, 1, NULL, '2025-09-01 20:49:12', 1, 0, 1),
(25, 1, NULL, '2025-09-02 05:29:31', 1, 0, 1),
(26, 2, 29, '2025-09-02 08:32:21', 1, 0, 5),
(27, 1, 2, '2025-09-02 08:33:06', 1, 0, 0),
(28, 2, 30, '2025-09-02 08:49:23', 1, 0, 5),
(29, 2, 31, '2025-09-02 09:36:06', 1, 0, 5),
(30, 1, 32, '2025-09-02 09:36:45', 1, 0, 2),
(31, 3, 33, '2025-09-02 09:37:24', 1, 0, 1),
(32, 2, 34, '2025-09-02 13:09:48', 1, 0, 5),
(33, 1, 35, '2025-09-02 19:03:01', 1, 0, 2),
(34, 1, 36, '2025-09-02 21:59:12', 1, 0, 5),
(35, 2, 37, '2025-09-02 21:59:12', 1, 0, 5),
(36, 2, 38, '2025-09-02 21:59:12', 1, 0, 1),
(37, 3, 39, '2025-09-02 21:59:12', 1, 0, 1),
(38, 1, 40, '2025-09-02 21:59:12', 1, 0, 1),
(39, 3, 41, '2025-09-02 21:59:12', 1, 0, 2),
(40, 3, 42, '2025-09-02 21:59:12', 1, 0, 5),
(41, 2, 43, '2025-09-02 21:59:12', 1, 0, 1),
(42, 2, 44, '2025-09-02 21:59:12', 1, 0, 5),
(43, 2, 45, '2025-09-02 21:59:12', 1, 0, 1),
(44, 2, 46, '2025-09-02 21:59:12', 1, 0, 2),
(45, 1, 47, '2025-09-02 21:59:12', 1, 0, 5),
(46, 2, 48, '2025-09-02 21:59:12', 1, 0, 5),
(47, 1, 49, '2025-09-02 21:59:12', 1, 0, 5),
(48, 3, 50, '2025-09-02 21:59:12', 1, 0, 5),
(49, 1, 51, '2025-09-02 21:59:12', 1, 0, 1),
(50, 2, 52, '2025-09-02 21:59:12', 1, 0, 1),
(51, 1, 53, '2025-09-02 21:59:12', 1, 0, 1),
(52, 3, 54, '2025-09-02 21:59:12', 1, 0, 1),
(53, 1, 55, '2025-09-02 21:59:12', 1, 0, 5),
(54, 3, 56, '2025-09-02 21:59:12', 1, 0, 1),
(55, 1, 57, '2025-09-02 21:59:12', 1, 0, 1),
(56, 2, 58, '2025-09-02 21:59:12', 1, 0, 1),
(57, 2, 59, '2025-09-02 21:59:12', 1, 0, 1),
(58, 2, 60, '2025-09-02 21:59:12', 1, 0, 1),
(59, 2, 61, '2025-09-02 21:59:12', 1, 0, 5),
(60, 1, 62, '2025-09-02 21:59:12', 1, 0, 2),
(61, 1, 63, '2025-09-02 21:59:12', 1, 0, 1),
(62, 3, 64, '2025-09-02 21:59:12', 1, 0, 2),
(63, 1, 65, '2025-09-02 21:59:12', 1, 0, 1),
(64, 2, 66, '2025-09-02 21:59:12', 1, 0, 2),
(65, 2, 67, '2025-09-02 21:59:12', 1, 0, 1),
(66, 1, 68, '2025-09-02 21:59:12', 1, 0, 1),
(67, 1, 69, '2025-09-02 21:59:12', 1, 0, 1),
(68, 1, 70, '2025-09-02 21:59:12', 1, 0, 2),
(69, 3, 71, '2025-09-02 21:59:12', 1, 0, 1),
(70, 2, 72, '2025-09-02 21:59:12', 1, 0, 1),
(71, 3, 73, '2025-09-02 21:59:12', 1, 0, 1),
(72, 1, 74, '2025-09-02 21:59:12', 1, 0, 1),
(73, 1, 75, '2025-09-02 21:59:12', 1, 0, 1),
(74, 1, 3, '2025-09-02 22:49:25', 1, 0, 5),
(75, 2, 76, '2025-09-02 22:49:53', 1, 0, 5),
(76, 1, 17, '2025-09-03 05:19:46', 1, 0, 5),
(77, 2, 30, '2025-09-03 05:20:00', 1, 0, 5),
(78, 2, 31, '2025-09-03 05:20:13', 1, 0, 5),
(79, 3, 39, '2025-09-03 05:20:26', 1, 0, 1),
(80, 2, 44, '2025-09-03 05:20:53', 1, 0, 5),
(81, 2, 48, '2025-09-03 05:21:11', 1, 0, 5),
(82, 1, 49, '2025-09-03 05:21:22', 1, 0, 5),
(83, 3, 50, '2025-09-03 05:21:36', 1, 0, 5),
(84, 1, 74, '2025-09-03 05:21:45', 1, 0, 1),
(85, 3, 71, '2025-09-03 05:21:54', 1, 0, 1),
(86, 3, 56, '2025-09-03 05:23:13', 1, 0, 1),
(87, 2, 45, '2025-09-03 05:23:48', 1, 0, 1),
(88, 2, 77, '2025-09-03 05:24:44', 1, 0, 5),
(89, 3, 78, '2025-09-03 05:25:40', 1, 0, 2),
(90, 2, 79, '2025-09-04 15:40:53', 1, 0, 5),
(91, 2, 80, '2025-09-04 16:12:16', 1, 0, 1),
(92, 2, 81, '2025-09-05 12:46:15', 1, 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `universe_notification`
--

CREATE TABLE `universe_notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `seen` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `universe_order`
--

CREATE TABLE `universe_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` decimal(12,2) DEFAULT 0.00,
  `status` varchar(20) DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_order`
--

INSERT INTO `universe_order` (`order_id`, `user_id`, `total`, `status`, `created_at`) VALUES
(1, 5, 200.00, 'paid', '2025-09-02 06:53:34'),
(2, 5, 200.00, 'paid', '2025-09-02 06:54:00'),
(3, 5, 100.00, 'paid', '2025-09-02 06:57:46'),
(4, 5, 200.00, 'paid', '2025-09-02 06:59:21'),
(5, 5, 200.00, 'paid', '2025-09-02 07:07:12'),
(6, 5, 51.00, 'paid', '2025-09-02 07:39:43'),
(7, 5, 30.50, 'paid', '2025-09-02 08:11:54'),
(8, 5, 51.00, 'paid', '2025-09-02 09:43:43'),
(9, 5, 320.00, 'paid', '2025-09-02 12:45:21'),
(10, 25, 51.00, 'paid', '2025-09-02 13:23:48'),
(11, 5, 51.00, 'paid', '2025-09-02 14:16:00'),
(12, 5, 301.50, 'paid', '2025-09-02 14:16:21'),
(13, 6, 51.00, 'paid', '2025-09-02 18:01:48'),
(14, 5, 150.00, 'paid', '2025-09-02 19:04:09'),
(15, 6, 100.00, 'paid', '2025-09-02 19:09:29'),
(16, 6, 400.00, 'paid', '2025-09-02 19:17:13'),
(17, 6, 150.00, 'paid', '2025-09-02 19:59:49'),
(18, 6, 100.00, 'paid', '2025-09-02 20:04:23'),
(19, 6, 30.50, 'paid', '2025-09-02 20:05:41'),
(20, 6, 150.00, 'paid', '2025-09-02 20:07:01'),
(21, 6, 130.00, 'paid', '2025-09-02 20:09:17'),
(22, 6, 100.00, 'paid', '2025-09-02 20:11:00'),
(23, 6, 240.00, 'paid', '2025-09-02 20:14:57'),
(33, 6, 100.00, 'paid', '2025-09-02 20:58:09'),
(34, 6, 240.00, 'paid', '2025-09-02 21:03:31'),
(35, 6, 61.00, 'paid', '2025-09-02 21:03:51'),
(36, 6, 121.00, 'paid', '2025-09-02 21:09:09'),
(37, 6, 278.75, 'paid', '2025-09-02 21:11:06'),
(38, 6, 190.00, 'paid', '2025-09-02 21:25:21'),
(39, 6, 76.25, 'paid', '2025-09-02 21:36:06'),
(40, 7, 100.00, 'paid', '2025-09-02 21:40:21'),
(41, 7, 320.00, 'paid', '2025-09-02 21:40:30'),
(42, 7, 51.00, 'paid', '2025-09-02 21:40:58'),
(43, 7, 190.00, 'paid', '2025-09-02 21:41:13'),
(44, 5, 30.50, 'paid', '2025-09-02 21:47:24'),
(45, 5, 854.00, 'paid', '2025-09-02 21:55:39'),
(46, 5, 2388.00, 'paid', '2025-09-02 22:02:31'),
(47, 5, 92.00, 'paid', '2025-09-02 22:02:55'),
(48, 5, 1472.00, 'paid', '2025-09-02 22:03:07'),
(49, 5, 106.00, 'paid', '2025-09-02 22:06:00'),
(50, 5, 106.00, 'paid', '2025-09-02 22:09:25'),
(51, 5, 152.00, 'paid', '2025-09-02 22:20:41'),
(52, 5, 106.00, 'paid', '2025-09-02 22:27:26'),
(53, 5, 990.00, 'paid', '2025-09-02 22:27:42'),
(54, 6, 796.00, 'paid', '2025-09-02 22:43:21'),
(55, 27, 370.00, 'paid', '2025-09-02 22:53:30'),
(56, 27, 859.00, 'paid', '2025-09-02 22:53:52'),
(57, 28, 51.00, 'paid', '2025-09-03 05:37:46'),
(58, 28, 871.00, 'paid', '2025-09-03 05:37:57'),
(59, 28, 1472.00, 'paid', '2025-09-03 05:38:47'),
(60, 28, 3200.00, 'paid', '2025-09-03 05:39:01'),
(61, 28, 36.00, 'paid', '2025-09-03 05:40:15'),
(62, 6, 46.00, 'paid', '2025-09-03 05:45:12'),
(63, 5, 1742.00, 'paid', '2025-09-03 06:38:14'),
(64, 30, 12.00, 'paid', '2025-09-04 16:28:09'),
(65, 30, 38.00, 'paid', '2025-09-04 16:39:04'),
(66, 30, 361.00, 'paid', '2025-09-04 16:51:27'),
(67, 5, 56.00, 'paid', '2025-09-04 18:17:49'),
(68, 5, 859.00, 'paid', '2025-09-04 18:18:09'),
(69, 5, 46.00, 'paid', '2025-09-04 18:34:18'),
(71, 7, 45.00, 'paid', '2025-09-04 20:29:19'),
(72, 7, 359.00, 'paid', '2025-09-04 20:29:29'),
(73, 7, 18.00, 'paid', '2025-09-04 20:29:34'),
(74, 31, 36.00, 'paid', '2025-09-05 12:50:52'),
(75, 31, 501.00, 'paid', '2025-09-05 12:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `universe_orderitem`
--

CREATE TABLE `universe_orderitem` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `artefact_id` int(11) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_orderitem`
--

INSERT INTO `universe_orderitem` (`id`, `order_id`, `artefact_id`, `price`, `quantity`) VALUES
(1, 1, 1, 100.00, 2),
(2, 2, 1, 100.00, 2),
(3, 3, 8, 50.00, 2),
(4, 4, 5, 100.00, 2),
(5, 5, 5, 100.00, 2),
(6, 6, 6, 25.50, 2),
(7, 7, 12, 15.25, 2),
(8, 8, 6, 25.50, 2),
(9, 9, 29, 160.00, 2),
(10, 10, 6, 25.50, 2),
(11, 11, 6, 25.50, 2),
(12, 12, 7, 150.75, 2),
(13, 13, 6, 25.50, 2),
(14, 14, 9, 75.00, 2),
(15, 15, 8, 50.00, 2),
(16, 16, 13, 200.00, 2),
(17, 17, 9, 75.00, 2),
(18, 18, 8, 50.00, 2),
(19, 19, 12, 15.25, 2),
(20, 20, 9, 75.00, 2),
(21, 21, 23, 65.00, 2),
(22, 22, 8, 50.00, 2),
(23, 23, 10, 120.00, 2),
(30, 33, 4, 50.00, 2),
(31, 34, 10, 120.00, 2),
(32, 35, 15, 30.50, 2),
(33, 36, 11, 60.50, 2),
(34, 37, 16, 55.75, 5),
(35, 38, 17, 95.00, 2),
(36, 39, 12, 15.25, 5),
(37, 40, 4, 50.00, 2),
(38, 41, 29, 160.00, 2),
(39, 42, 2, 25.50, 2),
(40, 43, 17, 95.00, 2),
(41, 44, 12, 15.25, 2),
(42, 45, 121, 427.00, 2),
(43, 46, 119, 796.00, 3),
(44, 47, 84, 46.00, 2),
(45, 48, 122, 736.00, 2),
(46, 49, 78, 53.00, 2),
(47, 50, 78, 53.00, 2),
(48, 51, 87, 38.00, 4),
(49, 52, 78, 53.00, 2),
(50, 53, 134, 495.00, 2),
(51, 54, 119, 796.00, 1),
(52, 55, 96, 74.00, 5),
(53, 56, 131, 859.00, 1),
(54, 57, 108, 51.00, 1),
(55, 58, 117, 871.00, 1),
(56, 59, 122, 736.00, 2),
(57, 60, 44, 3200.00, 1),
(58, 61, 77, 36.00, 1),
(59, 62, 84, 46.00, 1),
(60, 63, 117, 871.00, 2),
(61, 64, 94, 12.00, 1),
(62, 65, 86, 38.00, 1),
(63, 66, 118, 361.00, 1),
(64, 67, 80, 14.00, 4),
(65, 68, 131, 859.00, 1),
(66, 69, 84, 46.00, 1),
(68, 71, 19, 22.50, 2),
(69, 72, 140, 359.00, 1),
(70, 73, 93, 18.00, 1),
(71, 74, 77, 36.00, 1),
(72, 75, 130, 501.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `universe_portaltimescheduler`
--

CREATE TABLE `universe_portaltimescheduler` (
  `travel_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `max_capacity` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `destination_universe_id` int(11) DEFAULT NULL,
  `source_universe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_portaltimescheduler`
--

INSERT INTO `universe_portaltimescheduler` (`travel_id`, `date`, `max_capacity`, `admin_id`, `destination_universe_id`, `source_universe_id`) VALUES
(5, '2025-09-10', 7, NULL, 8, 4),
(8, '2025-10-01', 19, NULL, 3, 1),
(13, '2025-09-24', 10, 1, 5, 1),
(14, '2025-09-10', 10, 1, 4, 1),
(15, '2025-09-16', 10, 1, 8, 2),
(16, '2025-09-12', 10, 1, 14, 2),
(17, '2025-09-11', 6, 1, 11, 4),
(18, '2025-09-20', 10, 1, 8, 14),
(21, '2025-09-13', 10, 1, 4, 1),
(24, '2025-09-24', 10, 2, 6, 1),
(25, '2025-09-19', 6, 2, 53, 56),
(26, '2025-09-17', 10, 2, 53, 52),
(27, '2025-09-26', 14, 2, 68, 52),
(28, '2025-10-17', 4, 2, 52, 40),
(29, '2025-10-31', 7, 2, 67, 68),
(30, '2025-09-20', 8, 2, 40, 52),
(31, '2025-09-30', 10, 1, 2, 1),
(32, '2025-09-18', 10, 2, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `universe_transactionrecord`
--

CREATE TABLE `universe_transactionrecord` (
  `tx_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `artefact_id` int(11) DEFAULT NULL,
  `tx_type` varchar(20) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `auction_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_transactionrecord`
--

INSERT INTO `universe_transactionrecord` (`tx_id`, `user_id`, `artefact_id`, `tx_type`, `price`, `created_at`, `auction_id`) VALUES
(1, 5, 1, 'purchase', 200.00, '2025-09-02 06:53:34', NULL),
(2, 5, 1, 'purchase', 200.00, '2025-09-02 06:54:00', NULL),
(3, 5, 8, 'purchase', 100.00, '2025-09-02 06:57:46', NULL),
(4, 5, 5, 'purchase', 200.00, '2025-09-02 06:59:22', NULL),
(5, 5, 5, 'purchase', 200.00, '2025-09-02 07:07:12', NULL),
(6, 5, 6, 'purchase', 51.00, '2025-09-02 07:39:43', NULL),
(7, 5, 12, 'purchase', 30.50, '2025-09-02 08:11:54', NULL),
(8, 5, 6, 'purchase', 51.00, '2025-09-02 09:43:43', NULL),
(9, 5, 29, 'purchase', 320.00, '2025-09-02 12:45:21', NULL),
(10, 25, 6, 'purchase', 51.00, '2025-09-02 13:23:48', NULL),
(11, 5, 6, 'purchase', 51.00, '2025-09-02 14:16:00', NULL),
(12, 5, 7, 'purchase', 301.50, '2025-09-02 14:16:21', NULL),
(13, 6, 6, 'purchase', 51.00, '2025-09-02 18:01:48', NULL),
(14, 5, 9, 'purchase', 150.00, '2025-09-02 19:04:09', NULL),
(15, 6, 8, 'purchase', 100.00, '2025-09-02 19:09:29', NULL),
(16, 6, 13, 'purchase', 400.00, '2025-09-02 19:17:13', NULL),
(17, 6, 9, 'purchase', 150.00, '2025-09-02 19:59:49', NULL),
(18, 6, 8, 'purchase', 100.00, '2025-09-02 20:04:23', NULL),
(19, 6, 12, 'purchase', 30.50, '2025-09-02 20:05:41', NULL),
(20, 6, 9, 'purchase', 150.00, '2025-09-02 20:07:02', NULL),
(21, 6, 23, 'purchase', 130.00, '2025-09-02 20:09:17', NULL),
(22, 6, 8, 'purchase', 100.00, '2025-09-02 20:11:00', NULL),
(23, 6, 10, 'purchase', 240.00, '2025-09-02 20:14:57', NULL),
(31, 6, 4, 'purchase', 100.00, '2025-09-02 20:58:09', NULL),
(32, 6, 10, 'purchase', 240.00, '2025-09-02 21:03:31', NULL),
(33, 6, 15, 'purchase', 61.00, '2025-09-02 21:03:51', NULL),
(34, 6, 11, 'purchase', 121.00, '2025-09-02 21:09:09', NULL),
(35, 6, 16, 'purchase', 278.75, '2025-09-02 21:11:06', NULL),
(36, 6, 17, 'purchase', 190.00, '2025-09-02 21:25:21', NULL),
(37, 6, 12, 'purchase', 76.25, '2025-09-02 21:36:06', NULL),
(38, 7, 4, 'purchase', 100.00, '2025-09-02 21:40:21', NULL),
(39, 7, 29, 'purchase', 320.00, '2025-09-02 21:40:30', NULL),
(40, 7, 2, 'purchase', 51.00, '2025-09-02 21:40:58', NULL),
(41, 7, 17, 'purchase', 190.00, '2025-09-02 21:41:13', NULL),
(42, 5, 12, 'purchase', 30.50, '2025-09-02 21:47:24', NULL),
(43, 5, 121, 'purchase', 854.00, '2025-09-02 21:55:39', NULL),
(44, 5, 119, 'purchase', 2388.00, '2025-09-02 22:02:31', NULL),
(45, 5, 84, 'purchase', 92.00, '2025-09-02 22:02:55', NULL),
(46, 5, 122, 'purchase', 1472.00, '2025-09-02 22:03:07', NULL),
(47, 5, 78, 'purchase', 106.00, '2025-09-02 22:06:00', NULL),
(48, 5, 78, 'purchase', 106.00, '2025-09-02 22:09:25', NULL),
(49, 5, 87, 'purchase', 152.00, '2025-09-02 22:20:41', NULL),
(50, 5, 78, 'purchase', 106.00, '2025-09-02 22:27:26', NULL),
(51, 5, 134, 'purchase', 990.00, '2025-09-02 22:27:42', NULL),
(52, 6, 119, 'purchase', 796.00, '2025-09-02 22:43:21', NULL),
(53, 27, 96, 'purchase', 370.00, '2025-09-02 22:53:30', NULL),
(54, 27, 131, 'purchase', 859.00, '2025-09-02 22:53:52', NULL),
(55, 28, 108, 'purchase', 51.00, '2025-09-03 05:37:46', NULL),
(56, 28, 117, 'purchase', 871.00, '2025-09-03 05:37:57', NULL),
(57, 28, 122, 'purchase', 1472.00, '2025-09-03 05:38:47', NULL),
(58, 28, 44, 'purchase', 3200.00, '2025-09-03 05:39:01', NULL),
(59, 28, 77, 'purchase', 36.00, '2025-09-03 05:40:15', NULL),
(60, 6, 84, 'purchase', 46.00, '2025-09-03 05:45:12', NULL),
(61, 5, 117, 'purchase', 1742.00, '2025-09-03 06:38:14', NULL),
(62, 30, 94, 'purchase', 12.00, '2025-09-04 16:28:09', NULL),
(63, 30, 86, 'purchase', 38.00, '2025-09-04 16:39:04', NULL),
(64, 30, 118, 'purchase', 361.00, '2025-09-04 16:51:27', NULL),
(65, 5, 80, 'purchase', 56.00, '2025-09-04 18:17:49', NULL),
(66, 5, 131, 'purchase', 859.00, '2025-09-04 18:18:09', NULL),
(67, 5, 84, 'purchase', 46.00, '2025-09-04 18:34:18', NULL),
(69, 7, 19, 'purchase', 45.00, '2025-09-04 20:29:19', NULL),
(70, 7, 140, 'purchase', 359.00, '2025-09-04 20:29:29', NULL),
(71, 7, 93, 'purchase', 18.00, '2025-09-04 20:29:34', NULL),
(72, 31, 77, 'purchase', 36.00, '2025-09-05 12:50:52', NULL),
(73, 31, 130, 'purchase', 501.00, '2025-09-05 12:51:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `universe_travelwishlist`
--

CREATE TABLE `universe_travelwishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `added_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_travelwishlist`
--

INSERT INTO `universe_travelwishlist` (`id`, `user_id`, `schedule_id`, `added_at`) VALUES
(5, 17, 8, '2025-09-01 18:35:45'),
(11, 19, 14, '2025-09-01 20:13:32'),
(15, 23, 17, '2025-09-01 20:51:37'),
(16, 24, 13, '2025-09-02 05:31:36'),
(20, 25, 18, '2025-09-02 13:22:19'),
(26, 30, 17, '2025-09-04 16:32:15'),
(27, 7, 26, '2025-09-04 20:30:04'),
(28, 5, 31, '2025-09-04 20:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `universe_universe`
--

CREATE TABLE `universe_universe` (
  `universe_id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `universe_type` longtext NOT NULL,
  `visit_date` date DEFAULT NULL,
  `destroyed_date` date DEFAULT NULL,
  `status` longtext NOT NULL,
  `danger_level` int(11) NOT NULL,
  `visited_intergalactic_beings` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_universe`
--

INSERT INTO `universe_universe` (`universe_id`, `name`, `universe_type`, `visit_date`, `destroyed_date`, `status`, `danger_level`, `visited_intergalactic_beings`, `description`, `admin_id`) VALUES
(1, 'Universe-11', 'Fantasy', '2025-08-06', NULL, 'Safe', 0, '', '', 2),
(2, 'Universe-1', 'Cronenberg', '2025-07-12', NULL, 'Safe', 0, '', '', 1),
(3, 'Universe-2', 'Prime', '2025-08-20', '2025-08-26', 'Destroyed', 1, '', 'so harmful', 1),
(4, 'Universe-3', 'Post-Apocalyptic', '2025-07-23', NULL, 'Safe', 0, '', '', 1),
(5, 'Universe-4', 'Virtual', '2025-08-23', '2025-08-24', 'Destroyed', 1, '', '', 1),
(6, 'Universe-5', 'Fantasy', '2025-08-14', NULL, 'Safe', 0, '', '', 1),
(7, 'Universe-6', 'Cronenberg', '2025-08-11', '2025-08-12', 'Destroyed', 1, '', '', 1),
(8, 'Universe-7', 'Prime', '2025-08-21', NULL, 'Safe', 0, '', '', 1),
(9, 'Universe-8', 'Fantasy', '2025-08-12', '2025-08-15', 'Destroyed', 1, '', '', 1),
(10, 'Universe-9', 'Unknown', '2025-08-16', '2025-08-18', 'Destroyed', 1, '', '', 1),
(11, 'Universe-10', 'Cronenberg', '2025-08-10', NULL, 'Safe', 0, '', '', 1),
(12, 'Universe_12', 'Post-Apocalyptic', '2025-08-04', NULL, 'Unstable', 0, '', '', 1),
(13, 'Universe-10', 'Post-Apocalyptic', '2025-08-04', NULL, 'Unstable', 0, 'wizard', 'full of unique artifacts', 1),
(14, 'Mega_Star', 'Post-Apocalyptic', '2025-08-08', NULL, 'Safe', 0, 'Alien', 'The Alien were super friendly , Gifted us Some Artifacts', 1),
(15, 'Ultra_Super', 'Fantasy', '2025-06-03', NULL, 'Unstable', 0, 'Some unknown Creatures', 'The creatues were Just amazed seeing us. Got some common Artifacts.', 1),
(16, 'Run server', 'Virtual', '2025-07-29', '2025-08-13', 'Destroyed', 1, '', '', 1),
(17, 'Universe-3', 'Unknown', '2025-08-13', '2025-08-07', 'Destroyed', 1, '', '', 1),
(19, 'ricky arti', 'Cronenberg', '2025-08-05', '2025-08-15', 'Destroyed', 1, '', '', 1),
(20, 'naptune', 'Fantasy', '2025-08-13', NULL, 'Unstable', 0, '', '', 1),
(21, 'recent', 'Fantasy', '2025-08-31', NULL, 'Unstable', 0, '', '', 3),
(22, 'most recent', 'Unknown', '2025-08-30', '2025-08-31', 'Destroyed', 1, '', '', 2),
(23, 'current', 'Virtual', '2025-08-30', '2025-08-31', 'Destroyed', 1, '', '', 1),
(24, 'Universe_88', 'Fantasy', '2025-09-03', '2025-09-05', 'Destroyed', 1, '', '', 1),
(25, 'sparsa', 'Fantasy', '2025-09-16', '2025-08-24', 'Destroyed', 1, '', '', 3),
(26, 'Universe-3', 'Fantasy', '2025-08-12', '2025-08-18', 'Destroyed', 1, '', '', 3),
(27, 'Universe-10', 'Unknown', NULL, NULL, 'Unknown', 0, '', '', 1),
(29, 'Universe-10', 'Post-Apocalyptic', '2025-09-12', '2025-09-18', 'Destroyed', 1, '', '', 2),
(30, 'now_blur', 'Virtual', '2025-09-03', '2025-09-04', 'Destroyed', 1, '', '', 2),
(31, 'green', 'Cronenberg', '2025-09-25', '2025-09-27', 'Destroyed', 1, '', '', 2),
(32, 'red', 'Fantasy', '2025-09-05', NULL, 'Unstable', 0, '', '', 1),
(33, 'lal', 'Fantasy', '2025-09-04', NULL, 'Safe', 0, '', '', 3),
(34, 'auto', 'Cronenberg', '2025-09-04', '2025-09-19', 'Destroyed', 1, '', '', 2),
(35, 'Universe_88', 'Fantasy', '2025-09-05', NULL, 'Unstable', 0, '', '', 1),
(36, 'Cronenberg World', 'Prime', '2025-09-02', NULL, 'Destroyed', 1, 'Being 37', 'Description for Cronenberg World', 1),
(37, 'Mystic Realm', 'Cronenberg', '2025-09-02', '2025-09-02', 'Destroyed', 1, 'Being 30', 'Description for Mystic Realm', 2),
(38, 'Virtual Horizon', 'Prime', '2025-09-02', '2025-09-02', 'Unknown', 1, 'Being 88', 'Description for Virtual Horizon', 2),
(39, 'Post-Apocalyptic Zone', 'Prime', '2025-09-02', '2025-09-02', 'Safe', 0, 'Being 74', 'Description for Post-Apocalyptic Zone', 3),
(40, 'Prime Universe', 'Post-Apocalyptic', '2025-09-02', '2025-09-02', 'Safe', 0, 'Being 55', 'Description for Prime Universe', 1),
(41, 'Dark Dimension', 'Cronenberg', '2025-09-02', NULL, 'Unstable', 1, 'Being 23', 'Description for Dark Dimension', 3),
(42, 'Frozen Planet', 'Unknown', '2025-09-02', '2025-09-02', 'Destroyed', 1, 'Being 86', 'Description for Frozen Planet', 3),
(43, 'Lush Forests', 'Post-Apocalyptic', '2025-09-02', NULL, 'Unknown', 0, 'Being 46', 'Description for Lush Forests', 2),
(44, 'Desert Wastes', 'Post-Apocalyptic', '2025-09-02', NULL, 'Destroyed', 1, 'Being 79', 'Description for Desert Wastes', 2),
(45, 'Floating Cities', 'Post-Apocalyptic', '2025-09-02', '2025-09-02', 'Safe', 0, 'Being 2', 'Description for Floating Cities', 2),
(46, 'Skylands', 'Virtual', '2025-09-02', NULL, 'Unstable', 0, 'Being 66', 'Description for Skylands', 2),
(47, 'Crystal Caverns', 'Virtual', '2025-09-02', '2025-09-02', 'Destroyed', 1, 'Being 100', 'Description for Crystal Caverns', 1),
(48, 'Radiant Plains', 'Prime', '2025-09-02', NULL, 'Destroyed', 1, 'Being 18', 'Description for Radiant Plains', 2),
(49, 'Shadow Realm', 'Cronenberg', '2025-09-02', '2025-09-02', 'Destroyed', 1, 'Being 88', 'Description for Shadow Realm', 1),
(50, 'Stormy Oceans', 'Prime', '2025-09-02', '2025-09-02', 'Destroyed', 1, 'Being 99', 'Description for Stormy Oceans', 3),
(51, 'Molten Core', 'Unknown', '2025-09-02', NULL, 'Unknown', 0, 'Being 43', 'Description for Molten Core', 1),
(52, 'Ancient Ruins', 'Prime', '2025-09-02', NULL, 'Safe', 0, 'Being 45', 'Description for Ancient Ruins', 2),
(53, 'Neon Metropolis', 'Prime', '2025-09-02', NULL, 'Safe', 0, 'Being 7', 'Description for Neon Metropolis', 1),
(54, 'Time Rift', 'Cronenberg', '2025-09-02', '2025-09-02', 'Unknown', 1, 'Being 12', 'Description for Time Rift', 3),
(55, 'Parallel Earth', 'Post-Apocalyptic', '2025-09-02', NULL, 'Destroyed', 1, 'Being 74', 'Description for Parallel Earth', 1),
(56, 'Quantum Sector', 'Fantasy', '2025-09-02', NULL, 'Safe', 0, 'Being 98', 'Description for Quantum Sector', 3),
(57, 'Lost Colony', 'Fantasy', '2025-09-02', '2025-09-02', 'Unknown', 0, 'Being 66', 'Description for Lost Colony', 1),
(58, 'Bio-Dome', 'Post-Apocalyptic', '2025-09-02', NULL, 'Unknown', 1, 'Being 45', 'Description for Bio-Dome', 2),
(59, 'Volcanic Archipelago', 'Prime', '2025-09-02', NULL, 'Unknown', 1, 'Being 6', 'Description for Volcanic Archipelago', 2),
(60, 'Hidden Jungle', 'Prime', '2025-09-02', NULL, 'Unknown', 1, 'Being 42', 'Description for Hidden Jungle', 2),
(61, 'Abandoned Spaceport', 'Unknown', '2025-09-02', '2025-09-02', 'Destroyed', 1, 'Being 73', 'Description for Abandoned Spaceport', 2),
(62, 'Aurora Fields', 'Virtual', '2025-09-02', NULL, 'Unstable', 0, 'Being 57', 'Description for Aurora Fields', 1),
(63, 'Subterranean Labyrinth', 'Prime', '2025-09-02', NULL, 'Unknown', 1, 'Being 28', 'Description for Subterranean Labyrinth', 1),
(64, 'Frozen Tundra', 'Post-Apocalyptic', '2025-09-02', NULL, 'Unstable', 1, 'Being 4', 'Description for Frozen Tundra', 3),
(65, 'Mystic Mountains', 'Post-Apocalyptic', '2025-09-02', '2025-09-02', 'Unknown', 0, 'Being 24', 'Description for Mystic Mountains', 1),
(66, 'Cyber Nexus', 'Unknown', '2025-09-02', NULL, 'Unstable', 1, 'Being 80', 'Description for Cyber Nexus', 2),
(67, 'Toxic Wasteland', 'Cronenberg', '2025-09-02', NULL, 'Safe', 0, 'Being 67', 'Description for Toxic Wasteland', 2),
(68, 'Mirror World', 'Prime', '2025-09-02', '2025-09-02', 'Safe', 0, 'Being 37', 'Description for Mirror World', 1),
(69, 'Ethereal Realm', 'Unknown', '2025-09-02', NULL, 'Unknown', 1, 'Being 50', 'Description for Ethereal Realm', 1),
(70, 'Galactic Hub', 'Fantasy', '2025-09-02', '2025-09-02', 'Unstable', 1, 'Being 69', 'Description for Galactic Hub', 1),
(71, 'Twilight Meadows', 'Fantasy', '2025-09-02', '2025-09-02', 'Safe', 0, 'Being 57', 'Description for Twilight Meadows', 3),
(72, 'Inferno Realm', 'Post-Apocalyptic', '2025-09-02', NULL, 'Unknown', 1, 'Being 64', 'Description for Inferno Realm', 2),
(73, 'Shimmering Isles', 'Prime', '2025-09-02', NULL, 'Unknown', 1, 'Being 47', 'Description for Shimmering Isles', 3),
(74, 'Crystal Peaks', 'Fantasy', '2025-09-02', '2025-09-02', 'Safe', 0, 'Being 82', 'Description for Crystal Peaks', 1),
(75, 'Ancient Battlefield', 'Post-Apocalyptic', '2025-09-02', '2025-09-02', 'Unknown', 1, 'Being 80', 'Description for Ancient Battlefield', 1),
(76, 'Universe-3', 'Cronenberg', '2025-09-06', '2025-09-08', 'Destroyed', 1, '', '', 2),
(77, 'paradise', 'Post-Apocalyptic', '2025-09-05', '2025-09-13', 'Destroyed', 0, '', '', 2),
(78, 'saturn', 'Virtual', '2025-09-05', NULL, 'Unstable', 1, '', '', 3),
(79, 'starry night', 'Post-Apocalyptic', '2025-09-03', '2025-09-04', 'Destroyed', 1, '', '', 2),
(80, 'mars vault', 'Fantasy', '2025-09-05', NULL, 'Safe', 0, 'Monster python', '', 2),
(81, 'new uni', 'Fantasy', '2025-09-10', '2025-09-26', 'Destroyed', 1, '', '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `universe_universe_backup`
--

CREATE TABLE `universe_universe_backup` (
  `universe_id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `universe_type` longtext NOT NULL,
  `visit_date` date DEFAULT NULL,
  `destroyed_date` date DEFAULT NULL,
  `status` longtext NOT NULL,
  `danger_level` int(11) NOT NULL,
  `visited_intergalactic_beings` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universe_universe_backup`
--

INSERT INTO `universe_universe_backup` (`universe_id`, `name`, `universe_type`, `visit_date`, `destroyed_date`, `status`, `danger_level`, `visited_intergalactic_beings`, `description`, `admin_id`) VALUES
(0, 'Universe-11', 'Fantasy', '2025-08-06', NULL, 'Safe', 0, '', '', 1),
(1, 'Universe-1', 'Cronenberg', '2025-07-12', NULL, 'Safe', 0, '', '', 1),
(2, 'Universe-2', 'Prime', '2025-08-20', '2025-08-26', 'Destroyed', 1, '', '', 1),
(3, 'Universe-3', 'Post-Apocalyptic', '2025-07-23', NULL, 'Safe', 0, '', '', 1),
(4, 'Universe-4', 'Virtual', '2025-08-23', '2025-08-24', 'Destroyed', 1, '', '', 1),
(5, 'Universe-5', 'Fantasy', '2025-08-14', NULL, 'Safe', 0, '', '', 1),
(6, 'Universe-6', 'Cronenberg', '2025-08-11', '2025-08-12', 'Destroyed', 1, '', '', 1),
(7, 'Universe-7', 'Prime', '2025-08-21', NULL, 'Safe', 0, '', '', 1),
(8, 'Universe-8', 'Fantasy', '2025-08-12', '2025-08-15', 'Destroyed', 1, '', '', 1),
(9, 'Universe-9', 'Unknown', '2025-08-16', '2025-08-18', 'Destroyed', 1, '', '', 1),
(10, 'Universe-10', 'Cronenberg', '2025-08-10', NULL, 'Safe', 0, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `USER_ID` int(5) NOT NULL,
  `NAME` text NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `REG_DATE` date NOT NULL,
  `ADDRESS` varchar(30) NOT NULL,
  `A_ID` int(5) NOT NULL,
  `U_ID` int(5) NOT NULL,
  `TR_ID` int(5) NOT NULL,
  `M_ID` int(5) NOT NULL,
  `AU_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ADMIN_ID`);

--
-- Indexes for table `artefact`
--
ALTER TABLE `artefact`
  ADD PRIMARY KEY (`ARTEFACT_ID`),
  ADD KEY `A_ID` (`A_ID`),
  ADD KEY `U_ID` (`U_ID`),
  ADD KEY `MAK_ID` (`MAK_ID`),
  ADD KEY `AU_ID` (`AU_ID`);

--
-- Indexes for table `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`AUCTION_ID`),
  ADD KEY `A_ID` (`A_ID`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `marketplace`
--
ALTER TABLE `marketplace`
  ADD PRIMARY KEY (`MARKETPLACE_ID`),
  ADD KEY `A_ID` (`A_ID`);

--
-- Indexes for table `portal_time_scheduler`
--
ALTER TABLE `portal_time_scheduler`
  ADD PRIMARY KEY (`TRAVEL_ID`),
  ADD KEY `A_ID` (`A_ID`);

--
-- Indexes for table `random_event`
--
ALTER TABLE `random_event`
  ADD PRIMARY KEY (`EVENT_ID`),
  ADD KEY `A_ID` (`A_ID`);

--
-- Indexes for table `universe`
--
ALTER TABLE `universe`
  ADD PRIMARY KEY (`UNIVERSE_ID`),
  ADD KEY `A_ID` (`A_ID`);

--
-- Indexes for table `universe_admin`
--
ALTER TABLE `universe_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `universe_artefact`
--
ALTER TABLE `universe_artefact`
  ADD PRIMARY KEY (`artefact_id`);

--
-- Indexes for table `universe_auction`
--
ALTER TABLE `universe_auction`
  ADD PRIMARY KEY (`auction_id`),
  ADD UNIQUE KEY `artefact_id` (`artefact_id`),
  ADD KEY `winner_id` (`winner_id`);

--
-- Indexes for table `universe_bid`
--
ALTER TABLE `universe_bid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auction_id` (`auction_id`),
  ADD KEY `bidder_id` (`bidder_id`);

--
-- Indexes for table `universe_booking`
--
ALTER TABLE `universe_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `universe_booking_user_id_493f8a03_fk_auth_user_id` (`user_id`),
  ADD KEY `universe_booking_schedule_id_27efe9b7_fk_universe_` (`schedule_id`);

--
-- Indexes for table `universe_cart`
--
ALTER TABLE `universe_cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `user_id_2` (`user_id`);

--
-- Indexes for table `universe_cartitem`
--
ALTER TABLE `universe_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cart` (`cart_id`),
  ADD KEY `fk_artefact` (`artefact_id`);

--
-- Indexes for table `universe_journeylog`
--
ALTER TABLE `universe_journeylog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_journeylog_user` (`user_id`),
  ADD KEY `fk_journeylog_universe` (`universe_id`);

--
-- Indexes for table `universe_notification`
--
ALTER TABLE `universe_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `universe_order`
--
ALTER TABLE `universe_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `universe_orderitem`
--
ALTER TABLE `universe_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `artefact_id` (`artefact_id`);

--
-- Indexes for table `universe_portaltimescheduler`
--
ALTER TABLE `universe_portaltimescheduler`
  ADD PRIMARY KEY (`travel_id`),
  ADD KEY `universe_portaltimescheduler_admin_id_076416a5_fk_auth_user_id` (`admin_id`),
  ADD KEY `universe_portaltimes_destination_universe_07b934ca_fk_universe_` (`destination_universe_id`),
  ADD KEY `universe_portaltimes_source_universe_id_ac34def7_fk_universe_` (`source_universe_id`);

--
-- Indexes for table `universe_transactionrecord`
--
ALTER TABLE `universe_transactionrecord`
  ADD PRIMARY KEY (`tx_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `artefact_id` (`artefact_id`),
  ADD KEY `auction_id` (`auction_id`);

--
-- Indexes for table `universe_travelwishlist`
--
ALTER TABLE `universe_travelwishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wishlist_user` (`user_id`),
  ADD KEY `fk_wishlist_schedule` (`schedule_id`);

--
-- Indexes for table `universe_universe`
--
ALTER TABLE `universe_universe`
  ADD PRIMARY KEY (`universe_id`),
  ADD KEY `fk_universe_admin` (`admin_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`USER_ID`),
  ADD KEY `A_ID` (`A_ID`),
  ADD KEY `U_ID` (`U_ID`),
  ADD KEY `TR_ID` (`TR_ID`),
  ADD KEY `M_ID` (`M_ID`),
  ADD KEY `AU_ID` (`AU_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `universe_admin`
--
ALTER TABLE `universe_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `universe_artefact`
--
ALTER TABLE `universe_artefact`
  MODIFY `artefact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `universe_auction`
--
ALTER TABLE `universe_auction`
  MODIFY `auction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `universe_bid`
--
ALTER TABLE `universe_bid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `universe_booking`
--
ALTER TABLE `universe_booking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `universe_cart`
--
ALTER TABLE `universe_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `universe_cartitem`
--
ALTER TABLE `universe_cartitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `universe_journeylog`
--
ALTER TABLE `universe_journeylog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `universe_notification`
--
ALTER TABLE `universe_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `universe_order`
--
ALTER TABLE `universe_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `universe_orderitem`
--
ALTER TABLE `universe_orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `universe_portaltimescheduler`
--
ALTER TABLE `universe_portaltimescheduler`
  MODIFY `travel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `universe_transactionrecord`
--
ALTER TABLE `universe_transactionrecord`
  MODIFY `tx_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `universe_travelwishlist`
--
ALTER TABLE `universe_travelwishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `universe_universe`
--
ALTER TABLE `universe_universe`
  MODIFY `universe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artefact`
--
ALTER TABLE `artefact`
  ADD CONSTRAINT `artefact_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `admin` (`ADMIN_ID`),
  ADD CONSTRAINT `artefact_ibfk_2` FOREIGN KEY (`U_ID`) REFERENCES `universe` (`UNIVERSE_ID`),
  ADD CONSTRAINT `artefact_ibfk_3` FOREIGN KEY (`MAK_ID`) REFERENCES `marketplace` (`MARKETPLACE_ID`),
  ADD CONSTRAINT `artefact_ibfk_4` FOREIGN KEY (`AU_ID`) REFERENCES `auction` (`AUCTION_ID`);

--
-- Constraints for table `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `admin` (`ADMIN_ID`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketplace`
--
ALTER TABLE `marketplace`
  ADD CONSTRAINT `marketplace_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `admin` (`ADMIN_ID`);

--
-- Constraints for table `portal_time_scheduler`
--
ALTER TABLE `portal_time_scheduler`
  ADD CONSTRAINT `portal_time_scheduler_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `admin` (`ADMIN_ID`);

--
-- Constraints for table `random_event`
--
ALTER TABLE `random_event`
  ADD CONSTRAINT `random_event_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `artefact` (`ARTEFACT_ID`);

--
-- Constraints for table `universe`
--
ALTER TABLE `universe`
  ADD CONSTRAINT `universe_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `admin` (`ADMIN_ID`);

--
-- Constraints for table `universe_admin`
--
ALTER TABLE `universe_admin`
  ADD CONSTRAINT `universe_admin_user_id_731229b8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `universe_auction`
--
ALTER TABLE `universe_auction`
  ADD CONSTRAINT `universe_auction_ibfk_1` FOREIGN KEY (`artefact_id`) REFERENCES `universe_artefact` (`artefact_id`),
  ADD CONSTRAINT `universe_auction_ibfk_2` FOREIGN KEY (`winner_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `universe_bid`
--
ALTER TABLE `universe_bid`
  ADD CONSTRAINT `universe_bid_ibfk_1` FOREIGN KEY (`auction_id`) REFERENCES `universe_auction` (`auction_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `universe_bid_ibfk_2` FOREIGN KEY (`bidder_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `universe_booking`
--
ALTER TABLE `universe_booking`
  ADD CONSTRAINT `universe_booking_schedule_id_27efe9b7_fk_universe_` FOREIGN KEY (`schedule_id`) REFERENCES `universe_portaltimescheduler` (`travel_id`),
  ADD CONSTRAINT `universe_booking_user_id_493f8a03_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `universe_cartitem`
--
ALTER TABLE `universe_cartitem`
  ADD CONSTRAINT `fk_artefact` FOREIGN KEY (`artefact_id`) REFERENCES `universe_artefact` (`artefact_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cart` FOREIGN KEY (`cart_id`) REFERENCES `universe_cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `universe_cartitem_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `universe_cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `universe_cartitem_ibfk_2` FOREIGN KEY (`artefact_id`) REFERENCES `universe_artefact` (`artefact_id`) ON DELETE CASCADE;

--
-- Constraints for table `universe_journeylog`
--
ALTER TABLE `universe_journeylog`
  ADD CONSTRAINT `fk_journeylog_universe` FOREIGN KEY (`universe_id`) REFERENCES `universe_universe` (`universe_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_journeylog_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `universe_notification`
--
ALTER TABLE `universe_notification`
  ADD CONSTRAINT `universe_notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `universe_orderitem`
--
ALTER TABLE `universe_orderitem`
  ADD CONSTRAINT `universe_orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `universe_order` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `universe_orderitem_ibfk_2` FOREIGN KEY (`artefact_id`) REFERENCES `universe_artefact` (`artefact_id`) ON DELETE SET NULL;

--
-- Constraints for table `universe_portaltimescheduler`
--
ALTER TABLE `universe_portaltimescheduler`
  ADD CONSTRAINT `universe_portaltimes_destination_universe_07b934ca_fk_universe_` FOREIGN KEY (`destination_universe_id`) REFERENCES `universe_universe` (`universe_id`),
  ADD CONSTRAINT `universe_portaltimes_source_universe_id_ac34def7_fk_universe_` FOREIGN KEY (`source_universe_id`) REFERENCES `universe_universe` (`universe_id`),
  ADD CONSTRAINT `universe_portaltimescheduler_admin_id_076416a5_fk_auth_user_id` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `universe_transactionrecord`
--
ALTER TABLE `universe_transactionrecord`
  ADD CONSTRAINT `universe_transactionrecord_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `universe_transactionrecord_ibfk_2` FOREIGN KEY (`artefact_id`) REFERENCES `universe_artefact` (`artefact_id`),
  ADD CONSTRAINT `universe_transactionrecord_ibfk_3` FOREIGN KEY (`auction_id`) REFERENCES `universe_auction` (`auction_id`);

--
-- Constraints for table `universe_travelwishlist`
--
ALTER TABLE `universe_travelwishlist`
  ADD CONSTRAINT `fk_wishlist_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `universe_portaltimescheduler` (`travel_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wishlist_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `universe_universe`
--
ALTER TABLE `universe_universe`
  ADD CONSTRAINT `fk_universe_admin` FOREIGN KEY (`admin_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `admin` (`ADMIN_ID`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`U_ID`) REFERENCES `universe` (`UNIVERSE_ID`),
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`TR_ID`) REFERENCES `portal_time_scheduler` (`TRAVEL_ID`),
  ADD CONSTRAINT `user_ibfk_4` FOREIGN KEY (`M_ID`) REFERENCES `marketplace` (`MARKETPLACE_ID`),
  ADD CONSTRAINT `user_ibfk_5` FOREIGN KEY (`AU_ID`) REFERENCES `auction` (`AUCTION_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
