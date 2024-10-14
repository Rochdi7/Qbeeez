-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2024 at 06:14 PM
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
-- Database: `qbeeez`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_departmenthead`
--

CREATE TABLE `accounts_departmenthead` (
  `id` bigint(20) NOT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_parent`
--

CREATE TABLE `accounts_parent` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(120) NOT NULL,
  `last_name` varchar(120) NOT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `relation_ship` longtext NOT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_student`
--

CREATE TABLE `accounts_student` (
  `id` bigint(20) NOT NULL,
  `level` varchar(25) DEFAULT NULL,
  `program_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_student`
--

INSERT INTO `accounts_student` (`id`, `level`, `program_id`, `student_id`) VALUES
(21, 'Bachelor', 3, 25),
(22, 'Bachelor', 3, 36),
(23, 'Bachelor', 3, 37),
(24, 'Bachelor', 3, 39),
(25, 'Bachelor', 3, 40),
(26, 'Bachelor', 3, 42),
(27, 'Bachelor', 3, 43),
(28, 'Bachelor', 3, 44),
(29, 'Bachelor', 3, 45),
(30, 'Bachelor', 3, 46),
(31, 'Bachelor', 3, 47),
(32, 'Bachelor', 3, 48),
(33, 'Bachelor', 3, 49),
(34, 'Bachelor', 3, 50),
(35, 'Bachelor', 3, 51),
(36, '', 3, 52);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user`
--

CREATE TABLE `accounts_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_student` tinyint(1) NOT NULL,
  `is_lecturer` tinyint(1) NOT NULL,
  `is_parent` tinyint(1) NOT NULL,
  `is_dep_head` tinyint(1) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_user`
--

INSERT INTO `accounts_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `is_student`, `is_lecturer`, `is_parent`, `is_dep_head`, `gender`, `phone`, `address`, `picture`, `email`) VALUES
(1, 'pbkdf2_sha256$600000$SuOF2B9qXAEfOwIu29U6nf$AXtbWkIYojFExp2mugXBI98CQ8nBV6tnJ4QOEOQi7es=', '2024-10-13 23:27:34.532194', 1, 'outlaw', 'Rochdi', 'Karouali', 1, 1, '2024-10-01 13:15:56.607430', 0, 0, 0, 0, 'M', '0632582096', 'Sidi abad 2 n36', 'profile_pictures/24/10/09/1718323184850.jpg', 'rochdi.karouali1234@gmail.com'),
(25, 'pbkdf2_sha256$600000$bF1Cl32daJ2Gw7H6MabuCl$RwUs1+8WU4yN8EHBTq5jC+K2B4IXTayHzmQSzc1kfTY=', '2024-10-13 22:12:45.639515', 0, 'ugr-2024-1', 'Rochdi', 'Karouali', 0, 1, '2024-10-01 21:10:50.918526', 1, 0, 0, 0, 'M', '0632582096', 'Sidi abad 2 n36', 'default.png', '314aef69ea@emailfoxi.pro'),
(35, '!G4hLpLn1TUaHeaPvF98xEjObdNHtWmWaFuFegPxY', '2024-10-11 21:34:05.048737', 0, 'moussabe.karouali1234', 'mossab', 'karouali', 0, 1, '2024-10-11 21:34:04.966156', 1, 0, 0, 0, NULL, NULL, NULL, 'default.png', 'moussabe.karouali1234@gmail.com'),
(36, 'pbkdf2_sha256$600000$B5mvkbzcyXPgxjpwxir2ZA$Lg0Z/kDwvsr2nDVIftnjFYKHAFr9y8tj6ImF/6+FwIs=', NULL, 0, 'ugr-2024-3', 'njerbo', 'njerbo2', 0, 1, '2024-10-11 21:36:09.428204', 1, 0, 0, 0, 'M', '0632582096', 'Sidi abad 2 n36', 'default.png', '1bd6fcd165@emailfoxi.pro'),
(37, 'pbkdf2_sha256$600000$kPuN0YtlMFZI2JV72JV1bc$bsq4Yje9mTLRwIoyem4Q/wHdgNnCJhGBCofI925adUE=', '2024-10-11 21:36:56.212730', 0, 'ugr-2024-4', 'njerbo', 'njerbo2', 0, 1, '2024-10-11 21:36:29.632481', 1, 0, 0, 0, 'M', '0632582096', 'Sidi abad 2 n36', 'default.png', '21cb1e208c@emailfoxi.pro'),
(38, '!evx4WlXCyWpnz06pFECEypPKngCP0l2udkD9KPvj', '2024-10-13 12:16:46.571794', 0, 'businessoutlaw007', 'Rochdi', 'KArouali', 0, 1, '2024-10-12 14:38:43.379704', 1, 0, 0, 0, NULL, NULL, NULL, 'default.png', 'businessoutlaw007@gmail.com'),
(39, 'pbkdf2_sha256$600000$F0vLbeVsbRvrwsqvRiyawx$q0cKCkLFHW8qCIOZ9NnRvC9fMM6aVGPESue+H/ByqeU=', '2024-10-12 19:16:10.734105', 0, 'ugr-2024-6', 'Rochdi', 'Karouali', 0, 1, '2024-10-12 19:15:47.874181', 1, 0, 0, 0, 'M', '0632582096', 'Sidi abad 2 n36', 'default.png', '7160bd502f@emailfoxi.pro'),
(40, 'pbkdf2_sha256$600000$ovclZk8uatP1PBb6dYLsQ4$YAJEyRe+U4JAcNti4TdWjW9Jqc6ArsF84CVQGT/EQ40=', '2024-10-13 12:10:08.038351', 0, 'ugr-2024-7', 'asdasdddd', 'asdas', 0, 1, '2024-10-13 12:06:15.090793', 1, 0, 0, 0, 'M', '324345', 'asdasfsd', 'default.png', '574f69115a@emailfoxi.pro'),
(41, '!uuJkbUvqzDbV56hYAegBoHsBXjtSWvVO7yEFw9A9', '2024-10-13 12:09:04.702075', 0, 'rochdi.el1234', 'rochdi', 'el', 0, 1, '2024-10-13 12:09:04.661773', 1, 0, 0, 0, NULL, NULL, NULL, 'default.png', 'rochdi.el1234@gmail.com'),
(42, 'pbkdf2_sha256$600000$Jo5sc9z8OtGV0toTa2x9Yh$cY/uQlhsxG2XQrOhcmgqeqVnqOPSZxOmh4PMQjYVn2k=', '2024-10-13 12:26:03.404875', 0, 'ugr-2024-9', 'asddddddddddddddddddddd', 'Karouali', 0, 1, '2024-10-13 12:25:39.418752', 1, 0, 0, 0, 'M', '0632582096', '3174 Masonic Hill Road', 'default.png', '49040a5df1@emailfoxi.pro'),
(43, 'pbkdf2_sha256$600000$xLWPgneOs4jaysT02plFsF$tfacJe2g620xa4nIz4FAXOQtdkz+6HGqaSqqmV7cMz4=', '2024-10-13 12:42:12.329250', 0, 'ugr-2024-10', 'dasd', 'dasd', 0, 1, '2024-10-13 12:40:30.180308', 1, 0, 0, 0, 'M', 'das', 'asd', 'default.png', 'd56d586097@emailfoxi.pro'),
(44, 'pbkdf2_sha256$600000$FvytWv7xljdj4GVZDeacZL$3p8FlNrK2zdVkpqyypPTQbExSVhpmH9WgbOSZBZxBxY=', NULL, 0, 'ugr-2024-11', 'dasd', 'dasd', 0, 1, '2024-10-13 12:40:57.170470', 1, 0, 0, 0, 'M', 'das', 'asd', 'default.png', 'd56d586097@emailfoxi.pro'),
(45, 'pbkdf2_sha256$600000$bAmdkmVopKCNuAbuwd2Fr9$+0lktWQnooPFLNahveHyGroX9LNJ1XOBE/vQx3yDND0=', NULL, 0, 'ugr-2024-12', 'dasd', 'dasd', 0, 1, '2024-10-13 12:41:07.647521', 1, 0, 0, 0, 'M', 'das', 'asd', 'default.png', 'd56d586097@emailfoxi.pro'),
(46, 'pbkdf2_sha256$600000$zkfS6evIN4rnRBn6ksQZw8$gu2RnOPXC2BP7vhGT1gkysqDu0QI0U1v7OIJ+Sf3Wr0=', NULL, 0, 'ugr-2024-13', 'dasd', 'dasd', 0, 1, '2024-10-13 12:41:47.171111', 1, 0, 0, 0, 'M', 'das', 'asd', 'default.png', 'd56d586097@emailfoxi.pro'),
(47, 'pbkdf2_sha256$600000$W9TU5Fpw5xGswCva6W8Wzw$yIVD3Zd94sGLUiSGBPbUrp96f4gVkZwYOMzSa/8ny/0=', '2024-10-13 13:45:17.665126', 0, 'ugr-2024-14', 'karim', 'el', 0, 1, '2024-10-13 13:40:46.020091', 1, 0, 0, 0, 'M', 'fdsf', 'asdasd', 'default.png', '8dda10a52f@emailfoxi.pro'),
(48, 'pbkdf2_sha256$600000$lXwRSX6X8bYMuY3P72cv0M$D3huWUz04IpkkwclaZhhKsc2TyyGKmjmby+duIFqPAI=', '2024-10-13 21:47:18.328509', 0, 'ugr-2024-15', 'Rochdi', 'Karouali', 0, 1, '2024-10-13 21:46:54.186893', 1, 0, 0, 0, 'M', '234534534', '301 S Colorado Ave', 'default.png', '905eafe576@emailfoxi.pro'),
(49, 'pbkdf2_sha256$600000$oGdmHXXzZQy4c0ExtnhV4T$b0dBGzi4gTyhZp9LL2b99D/+wxUIFPtNVR9tOfEdWWI=', NULL, 0, 'ugr-2024-16', 'Rochdi', 'Karouali', 0, 1, '2024-10-13 21:50:40.412748', 1, 0, 0, 0, 'M', '4353', '3174 Masonic Hill Road', 'default.png', '63e7461e47@emailfoxi.pro'),
(50, 'pbkdf2_sha256$600000$EAfJJFfzgv68OIIdjU90eJ$r/Nqcix+LZYlYXIeDrtTcXsGEM3LcANRMs8NGS2x1a0=', NULL, 0, 'ugr-2024-17', 'Rochdi', 'Karouali', 0, 1, '2024-10-13 21:54:20.320781', 1, 0, 0, 0, 'M', '546456', '301 S Colorado Ave', 'default.png', '792fdfe36d@emailfoxi.pro'),
(51, 'pbkdf2_sha256$600000$wcRXzPGJIW2y1hmBBPLOa2$t7n1HBHft0VHRZOKBTDtBorAspiScuGcbKfv6rdAD4w=', NULL, 0, 'ugr-2024-18', 'Rochdi', 'Karouali', 0, 1, '2024-10-13 21:54:55.382666', 1, 0, 0, 0, 'M', '546456', '301 S Colorado Ave', 'default.png', '792fdfe36d@emailfoxi.pro'),
(52, 'pbkdf2_sha256$600000$X0gbLLxlbWSmKvhIOmyG5N$7gta+tDcrXPByg2cm+1slE18jUDIY3x6hJiM1YfsYAk=', NULL, 0, 'ugr-2024-19', 'Rochdi', 'Karouali', 0, 1, '2024-10-13 21:55:06.875897', 1, 0, 0, 0, 'M', '546456', '301 S Colorado Ave', 'default.png', '792fdfe36d@emailfoxi.pro');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_groups`
--

CREATE TABLE `accounts_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_user_permissions`
--

CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
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
(1, 'Can add user dashboard module', 1, 'add_userdashboardmodule'),
(2, 'Can change user dashboard module', 1, 'change_userdashboardmodule'),
(3, 'Can delete user dashboard module', 1, 'delete_userdashboardmodule'),
(4, 'Can view user dashboard module', 1, 'view_userdashboardmodule'),
(5, 'Can add bookmark', 2, 'add_bookmark'),
(6, 'Can change bookmark', 2, 'change_bookmark'),
(7, 'Can delete bookmark', 2, 'delete_bookmark'),
(8, 'Can view bookmark', 2, 'view_bookmark'),
(9, 'Can add pinned application', 3, 'add_pinnedapplication'),
(10, 'Can change pinned application', 3, 'change_pinnedapplication'),
(11, 'Can delete pinned application', 3, 'delete_pinnedapplication'),
(12, 'Can view pinned application', 3, 'view_pinnedapplication'),
(13, 'Can add log entry', 4, 'add_logentry'),
(14, 'Can change log entry', 4, 'change_logentry'),
(15, 'Can delete log entry', 4, 'delete_logentry'),
(16, 'Can view log entry', 4, 'view_logentry'),
(17, 'Can add permission', 5, 'add_permission'),
(18, 'Can change permission', 5, 'change_permission'),
(19, 'Can delete permission', 5, 'delete_permission'),
(20, 'Can view permission', 5, 'view_permission'),
(21, 'Can add group', 6, 'add_group'),
(22, 'Can change group', 6, 'change_group'),
(23, 'Can delete group', 6, 'delete_group'),
(24, 'Can view group', 6, 'view_group'),
(25, 'Can add content type', 7, 'add_contenttype'),
(26, 'Can change content type', 7, 'change_contenttype'),
(27, 'Can delete content type', 7, 'delete_contenttype'),
(28, 'Can view content type', 7, 'view_contenttype'),
(29, 'Can add session', 8, 'add_session'),
(30, 'Can change session', 8, 'change_session'),
(31, 'Can delete session', 8, 'delete_session'),
(32, 'Can view session', 8, 'view_session'),
(33, 'Can add activity log', 9, 'add_activitylog'),
(34, 'Can change activity log', 9, 'change_activitylog'),
(35, 'Can delete activity log', 9, 'delete_activitylog'),
(36, 'Can view activity log', 9, 'view_activitylog'),
(37, 'Can add news and events', 10, 'add_newsandevents'),
(38, 'Can change news and events', 10, 'change_newsandevents'),
(39, 'Can delete news and events', 10, 'delete_newsandevents'),
(40, 'Can view news and events', 10, 'view_newsandevents'),
(41, 'Can add session', 11, 'add_session'),
(42, 'Can change session', 11, 'change_session'),
(43, 'Can delete session', 11, 'delete_session'),
(44, 'Can view session', 11, 'view_session'),
(45, 'Can add semester', 12, 'add_semester'),
(46, 'Can change semester', 12, 'change_semester'),
(47, 'Can delete semester', 12, 'delete_semester'),
(48, 'Can view semester', 12, 'view_semester'),
(49, 'Can add user', 13, 'add_user'),
(50, 'Can change user', 13, 'change_user'),
(51, 'Can delete user', 13, 'delete_user'),
(52, 'Can view user', 13, 'view_user'),
(53, 'Can add department head', 14, 'add_departmenthead'),
(54, 'Can change department head', 14, 'change_departmenthead'),
(55, 'Can delete department head', 14, 'delete_departmenthead'),
(56, 'Can view department head', 14, 'view_departmenthead'),
(57, 'Can add parent', 15, 'add_parent'),
(58, 'Can change parent', 15, 'change_parent'),
(59, 'Can delete parent', 15, 'delete_parent'),
(60, 'Can view parent', 15, 'view_parent'),
(61, 'Can add student', 16, 'add_student'),
(62, 'Can change student', 16, 'change_student'),
(63, 'Can delete student', 16, 'delete_student'),
(64, 'Can view student', 16, 'view_student'),
(65, 'Can add course', 17, 'add_course'),
(66, 'Can change course', 17, 'change_course'),
(67, 'Can delete course', 17, 'delete_course'),
(68, 'Can view course', 17, 'view_course'),
(69, 'Can add program', 18, 'add_program'),
(70, 'Can change program', 18, 'change_program'),
(71, 'Can delete program', 18, 'delete_program'),
(72, 'Can view program', 18, 'view_program'),
(73, 'Can add upload video', 19, 'add_uploadvideo'),
(74, 'Can change upload video', 19, 'change_uploadvideo'),
(75, 'Can delete upload video', 19, 'delete_uploadvideo'),
(76, 'Can view upload video', 19, 'view_uploadvideo'),
(77, 'Can add upload', 20, 'add_upload'),
(78, 'Can change upload', 20, 'change_upload'),
(79, 'Can delete upload', 20, 'delete_upload'),
(80, 'Can view upload', 20, 'view_upload'),
(81, 'Can add course offer', 21, 'add_courseoffer'),
(82, 'Can change course offer', 21, 'change_courseoffer'),
(83, 'Can delete course offer', 21, 'delete_courseoffer'),
(84, 'Can view course offer', 21, 'view_courseoffer'),
(85, 'Can add course allocation', 22, 'add_courseallocation'),
(86, 'Can change course allocation', 22, 'change_courseallocation'),
(87, 'Can delete course allocation', 22, 'delete_courseallocation'),
(88, 'Can view course allocation', 22, 'view_courseallocation'),
(89, 'Can add taken course', 23, 'add_takencourse'),
(90, 'Can change taken course', 23, 'change_takencourse'),
(91, 'Can delete taken course', 23, 'delete_takencourse'),
(92, 'Can view taken course', 23, 'view_takencourse'),
(93, 'Can add result', 24, 'add_result'),
(94, 'Can change result', 24, 'change_result'),
(95, 'Can delete result', 24, 'delete_result'),
(96, 'Can view result', 24, 'view_result'),
(97, 'Can add Question', 25, 'add_question'),
(98, 'Can change Question', 25, 'change_question'),
(99, 'Can delete Question', 25, 'delete_question'),
(100, 'Can view Question', 25, 'view_question'),
(101, 'Can add Quiz', 26, 'add_quiz'),
(102, 'Can change Quiz', 26, 'change_quiz'),
(103, 'Can delete Quiz', 26, 'delete_quiz'),
(104, 'Can view Quiz', 26, 'view_quiz'),
(105, 'Can add Essay style question', 27, 'add_essayquestion'),
(106, 'Can change Essay style question', 27, 'change_essayquestion'),
(107, 'Can delete Essay style question', 27, 'delete_essayquestion'),
(108, 'Can view Essay style question', 27, 'view_essayquestion'),
(109, 'Can add Multiple Choice Question', 28, 'add_mcquestion'),
(110, 'Can change Multiple Choice Question', 28, 'change_mcquestion'),
(111, 'Can delete Multiple Choice Question', 28, 'delete_mcquestion'),
(112, 'Can view Multiple Choice Question', 28, 'view_mcquestion'),
(113, 'Can add sitting', 29, 'add_sitting'),
(114, 'Can change sitting', 29, 'change_sitting'),
(115, 'Can delete sitting', 29, 'delete_sitting'),
(116, 'Can view sitting', 29, 'view_sitting'),
(117, 'Can see completed exams.', 29, 'view_sittings'),
(118, 'Can add User Progress', 30, 'add_progress'),
(119, 'Can change User Progress', 30, 'change_progress'),
(120, 'Can delete User Progress', 30, 'delete_progress'),
(121, 'Can view User Progress', 30, 'view_progress'),
(122, 'Can add Choice', 31, 'add_choice'),
(123, 'Can change Choice', 31, 'change_choice'),
(124, 'Can delete Choice', 31, 'delete_choice'),
(125, 'Can view Choice', 31, 'view_choice'),
(126, 'Can add invoice', 32, 'add_invoice'),
(127, 'Can change invoice', 32, 'change_invoice'),
(128, 'Can delete invoice', 32, 'delete_invoice'),
(129, 'Can view invoice', 32, 'view_invoice');

-- --------------------------------------------------------

--
-- Table structure for table `core_activitylog`
--

CREATE TABLE `core_activitylog` (
  `id` bigint(20) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_activitylog`
--

INSERT INTO `core_activitylog` (`id`, `message`, `created_at`) VALUES
(1, 'The program \'test\' has been created.', '2024-10-01 13:17:31.156808'),
(2, 'The program \'Anatomie I\' has been created.', '2024-10-01 13:52:54.394280'),
(3, 'The program \'Anatomie I\' has been deleted.', '2024-10-01 13:53:18.502202'),
(4, 'The program \'test\' has been deleted.', '2024-10-01 13:53:20.653038'),
(5, 'The program \'Semestre 1 (FMPC)\' has been created.', '2024-10-01 13:53:23.615533'),
(6, 'The course \'Anatomie I (5234)\' has been created.', '2024-10-01 13:53:48.176685'),
(7, 'The course \'Anatomie I (5234)\' has been updated.', '2024-10-01 14:13:28.187701'),
(8, 'The course \'Anatomie I (5234)\' has been updated.', '2024-10-01 14:14:05.883864'),
(9, 'The course \'myologie (2)\' has been created.', '2024-10-01 14:23:03.913772'),
(10, 'The course \'myolo (123)\' has been created.', '2024-10-01 17:10:04.980145'),
(11, 'The course \'myolo (123912)\' has been created.', '2024-10-01 17:11:13.876693'),
(12, 'The course \'None (2)\' has been deleted.', '2024-10-01 17:36:51.948038'),
(13, 'The course \'None (5234)\' has been deleted.', '2024-10-01 17:36:51.949274'),
(14, 'The course \'myolo (123)\' has been deleted.', '2024-10-01 17:47:59.177738'),
(15, 'The course \'myolo (123912)\' has been deleted.', '2024-10-01 17:48:01.131630'),
(16, 'The course \'Anatomie I (1)\' has been created.', '2024-10-01 17:52:41.713728'),
(17, 'The course \'asd (123)\' has been created.', '2024-10-01 18:02:58.225296'),
(18, 'The course \'kkk (045)\' has been created.', '2024-10-01 18:10:25.898662'),
(19, 'The course \'Myologie (QCMs) (12345)\' has been created.', '2024-10-01 18:15:03.880392'),
(20, 'The course \'Chimie-Biochimie (99)\' has been created.', '2024-10-01 18:21:47.066797'),
(21, 'The course \'Santé publique et Biostatistiques (734)\' has been created.', '2024-10-01 18:28:29.238592'),
(22, 'The course \'askdasdka (03)\' has been created.', '2024-10-01 18:30:13.278447'),
(23, 'The course \'lalalll (012)\' has been created.', '2024-10-01 18:33:52.373281'),
(24, 'The course \'asdddddddddddddddd (222)\' has been created.', '2024-10-01 18:39:25.174044'),
(25, 'The course \'kkk (045)\' has been deleted.', '2024-10-01 18:43:58.623428'),
(26, 'The course \'asd (123)\' has been deleted.', '2024-10-01 18:44:05.930759'),
(27, 'The course \'askdasdka (03)\' has been deleted.', '2024-10-01 18:44:09.806198'),
(28, 'The course \'lalalll (012)\' has been deleted.', '2024-10-01 18:44:12.924971'),
(29, 'The course \'aslsssssssss (5343)\' has been created.', '2024-10-01 18:53:43.403094'),
(30, 'The course \'aslsssssssss (53436)\' has been created.', '2024-10-01 18:55:21.959822'),
(31, 'The course \'Biologie-Génétique fondamentale  2 (0234)\' has been created.', '2024-10-01 18:59:37.935066'),
(32, 'The course \'Organe (69721)\' has been created.', '2024-10-01 19:04:13.028806'),
(33, 'The course \'Myologie (QCMs) (02342)\' has been created.', '2024-10-01 19:09:14.079516'),
(34, 'The course \'Tice et Anglais Médical (324231)\' has been created.', '2024-10-01 19:11:18.452403'),
(35, 'The course \'öalödasd (324211)\' has been created.', '2024-10-01 19:15:29.304479'),
(36, 'The course \'öalödasd (324211)\' has been deleted.', '2024-10-01 19:21:33.665341'),
(37, 'The course \'Tice et Anglais Médical (324231)\' has been deleted.', '2024-10-01 19:21:33.666340'),
(38, 'The course \'Myologie (QCMs) (02342)\' has been deleted.', '2024-10-01 19:21:33.667334'),
(39, 'The course \'Organe (69721)\' has been deleted.', '2024-10-01 19:21:33.667334'),
(40, 'The course \'Biologie-Génétique fondamentale  2 (0234)\' has been deleted.', '2024-10-01 19:21:33.668438'),
(41, 'The course \'aslsssssssss (53436)\' has been deleted.', '2024-10-01 19:21:33.668438'),
(42, 'The course \'aslsssssssss (5343)\' has been deleted.', '2024-10-01 19:21:33.669530'),
(43, 'The course \'asdddddddddddddddd (222)\' has been deleted.', '2024-10-01 19:21:33.670534'),
(44, 'The course \'Santé publique et Biostatistiques (734)\' has been deleted.', '2024-10-01 19:21:33.671534'),
(45, 'The course \'Chimie-Biochimie (99)\' has been deleted.', '2024-10-01 19:21:33.672538'),
(46, 'The course \'Myologie (QCMs) (12345)\' has been deleted.', '2024-10-01 19:21:33.672538'),
(47, 'The course \'Anatomie I (1)\' has been deleted.', '2024-10-01 19:21:33.673549'),
(48, 'The course \'Anatomie I (1)\' has been created.', '2024-10-01 19:22:42.790974'),
(49, 'The course \'Chimie-Biochimie (2)\' has been created.', '2024-10-01 19:23:36.636479'),
(50, 'The course \'Anatomie 2 (1)\' has been updated.', '2024-10-01 20:46:45.611745'),
(51, 'The course \'Anatomie I (1)\' has been updated.', '2024-10-01 20:47:28.136840'),
(52, 'The program \'Semestre 10 (FMPC)\' has been created.', '2024-10-01 20:56:25.627623'),
(53, 'The program \'Semestre 1 (FMPC)\' has been updated.', '2024-10-01 21:07:54.947950'),
(54, 'The program \'Semestre 1 (FMPC)\' has been updated.', '2024-10-01 21:08:05.921902'),
(55, 'The program \'Semestre 10 (FMPC)\' has been updated.', '2024-10-01 21:08:27.743302'),
(56, 'The program \'Semestre 1 (FMPC)\' has been updated.', '2024-10-01 21:09:29.796722'),
(57, 'The program \'Semestre 1 (FMPC)\' has been updated.', '2024-10-02 09:55:33.715507'),
(58, 'The program \'Semestre 2 (FMPC)\' has been created.', '2024-10-02 10:01:46.233929'),
(59, 'The course \'alsdlasöd (03459)\' has been created.', '2024-10-02 14:02:21.053039'),
(60, 'The course \'Anatomie I (session) (01232)\' has been created.', '2024-10-02 14:21:42.860787'),
(61, 'The course \'anatomie 2 session (01232)\' has been updated.', '2024-10-02 16:12:39.614049'),
(62, 'The course \'None (03459)\' has been deleted.', '2024-10-02 16:13:00.677259'),
(63, 'The course \'Chimie-Biochimie (2)\' has been updated.', '2024-10-02 16:13:17.684226'),
(64, 'The course \'Chimie-Biochimie (2)\' has been deleted.', '2024-10-02 16:13:29.703692'),
(65, 'The course \'anatomie 2 session (01232)\' has been deleted.', '2024-10-02 16:13:40.939127'),
(66, 'The course \'Anatomie I session (01293)\' has been created.', '2024-10-02 16:14:41.266077'),
(67, 'The course \'Anatomie I session (01293)\' has been updated.', '2024-10-02 16:14:58.459842'),
(68, 'The course \'Anatomie I session (01293)\' has been deleted.', '2024-10-02 16:15:03.627580'),
(69, 'The course \'Anatomie I session (0234)\' has been created.', '2024-10-02 16:15:49.482380'),
(70, 'The program \'Semestre 10 (FMPC)\' has been updated.', '2024-10-02 19:14:13.027597'),
(71, 'The program \'Semestre 2 (FMPC)\' has been updated.', '2024-10-02 19:14:19.919665'),
(72, 'The program \'test\' has been created.', '2024-10-02 19:15:48.266031'),
(73, 'The program \'test\' has been deleted.', '2024-10-02 19:15:55.527109'),
(74, 'The program \'test34\' has been created.', '2024-10-02 19:20:28.926055'),
(75, 'The program \'l2q23e\' has been created.', '2024-10-02 19:20:49.920374'),
(76, 'The program \'lasd\' has been created.', '2024-10-02 19:33:35.587996'),
(77, 'The program \'lasd\' has been updated.', '2024-10-02 19:33:56.951379'),
(78, 'The program \'klasdas\' has been created.', '2024-10-02 19:40:47.133060'),
(79, 'The program \'asöldlas\' has been created.', '2024-10-02 19:52:11.812712'),
(80, 'The program \'Semestre 1 (FMPC)\' has been updated.', '2024-10-02 20:01:35.495204'),
(81, 'The program \'Semestre 2 (FMPC)\' has been updated.', '2024-10-02 20:04:53.999688'),
(82, 'The program \'asöldlas\' has been deleted.', '2024-10-02 20:04:57.278732'),
(83, 'The program \'zero\' has been created.', '2024-10-02 20:06:29.473745'),
(84, 'The program \'ntesti\' has been created.', '2024-10-03 20:51:28.188449'),
(85, 'The program \'lkasdasdas\' has been created.', '2024-10-03 20:51:44.817298'),
(86, 'The course \'anatomie 3 (6123)\' has been created.', '2024-10-08 15:43:05.898441'),
(87, 'The course \'anatomie 3 (6123)\' has been updated.', '2024-10-08 15:44:07.397784'),
(88, 'The course \'anatomie4 (0231)\' has been created.', '2024-10-08 15:45:18.572828'),
(89, 'The course \'asdlas (01231)\' has been created.', '2024-10-08 15:54:32.980738'),
(90, 'The course \'anatomie 3 (6123)\' has been updated.', '2024-10-08 16:00:42.658310'),
(91, 'The course \'anatomie5 (09312)\' has been created.', '2024-10-08 16:01:45.388358'),
(92, 'The course \'asdklaskd (2394089359)\' has been created.', '2024-10-08 16:06:17.001745'),
(93, 'The course \'anatomie5 (09312)\' has been updated.', '2024-10-08 16:15:43.140704'),
(94, 'The course \'ilas (23004923)\' has been created.', '2024-10-08 16:16:11.784206'),
(95, 'The course \'asdklaskd (2394089359)\' has been updated.', '2024-10-08 16:57:27.389244'),
(96, 'The course \'ilas (23004923)\' has been deleted.', '2024-10-08 17:00:46.329679'),
(97, 'The course \'asdklaskd (2394089359)\' has been updated.', '2024-10-08 17:01:02.060311'),
(98, 'The course \'asdklaskd (2394089359)\' has been updated.', '2024-10-08 17:01:21.269560'),
(99, 'The video \'test\' has been uploaded to the course Anatomie I (1).', '2024-10-10 12:06:27.011166'),
(100, 'The video \'test\' of the course \'Anatomie I (1)\' has been updated.', '2024-10-10 12:06:53.574731'),
(101, 'The video \'test\' of the course \'Anatomie I (1)\' has been deleted.', '2024-10-10 12:06:53.581751'),
(102, 'The video \'ilyas\' has been uploaded to the course \'Anatomie I (1)\'.', '2024-10-10 14:18:52.329530'),
(103, 'The video \'ilyas\' of the course \'Anatomie I (1)\' has been updated.', '2024-10-10 14:20:05.249870'),
(104, 'The video \'test\' has been uploaded to the course \'Anatomie I (1)\'.', '2024-10-10 14:30:57.035385'),
(105, 'The file \'pdf\' has been uploaded to the course \'Anatomie I (1)\'.', '2024-10-10 15:28:29.480981'),
(106, 'The video \'test\' of the course \'Anatomie I (1)\' has been updated.', '2024-10-10 15:46:30.537142'),
(107, 'The video \'test\' of the course \'Anatomie I (1)\' has been deleted.', '2024-10-10 15:46:30.546203'),
(108, 'The file \'pdf\' of the course \'Anatomie I (1)\' has been updated.', '2024-10-10 15:46:32.435470'),
(109, 'The file \'pdf\' of the course \'Anatomie I (1)\' has been deleted.', '2024-10-10 15:46:32.439676'),
(110, 'The program \'zero\' has been updated.', '2024-10-10 17:24:50.424434'),
(111, 'The course \'gggg (8445)\' has been created.', '2024-10-13 02:09:39.370341'),
(112, 'The course \'Anatomie I (1)\' has been updated.', '2024-10-13 22:26:42.691301'),
(113, 'The course \'bio chimie 5 (94564)\' has been created.', '2024-10-13 22:30:28.223099'),
(114, 'The course \'Anatomie I (1)\' has been updated.', '2024-10-13 22:34:28.207827');

-- --------------------------------------------------------

--
-- Table structure for table `core_newsandevents`
--

CREATE TABLE `core_newsandevents` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `posted_as` varchar(10) NOT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `upload_time` datetime(6) DEFAULT NULL,
  `summary_en` longtext DEFAULT NULL,
  `summary_ru` longtext DEFAULT NULL,
  `title_en` varchar(200) DEFAULT NULL,
  `title_ru` varchar(200) DEFAULT NULL,
  `summary_es` longtext DEFAULT NULL,
  `summary_fr` longtext DEFAULT NULL,
  `title_es` varchar(200) DEFAULT NULL,
  `title_fr` varchar(200) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_newsandevents`
--

INSERT INTO `core_newsandevents` (`id`, `title`, `summary`, `posted_as`, `updated_date`, `upload_time`, `summary_en`, `summary_ru`, `title_en`, `title_ru`, `summary_es`, `summary_fr`, `title_es`, `title_fr`, `image`) VALUES
(1, 'test', 'bseeeeha', 'News', '2024-10-08 18:30:52.318509', '2024-10-08 18:30:52.318509', 'bseeeeha', NULL, 'test', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'New Library Opening', 'We are excited to announce the grand opening of our new library! Join us on October 15, 2024, at 10 AM for a special ceremony featuring guest speakers, guided tours, and refreshments. This state-of-th', 'News', '2024-10-13 22:40:14.670672', '2024-10-08 18:55:47.506311', 'We are excited to announce the grand opening of our new library! Join us on October 15, 2024, at 10 AM for a special ceremony featuring guest speakers, guided tours, and refreshments. This state-of-th', NULL, 'New Library Opening', NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `core_semester`
--

CREATE TABLE `core_semester` (
  `id` bigint(20) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `is_current_semester` tinyint(1) DEFAULT NULL,
  `next_semester_begins` date DEFAULT NULL,
  `session_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_semester`
--

INSERT INTO `core_semester` (`id`, `semester`, `is_current_semester`, `next_semester_begins`, `session_id`) VALUES
(1, 'First', 1, '2024-10-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `core_session`
--

CREATE TABLE `core_session` (
  `id` bigint(20) NOT NULL,
  `session` varchar(200) NOT NULL,
  `is_current_session` tinyint(1) DEFAULT NULL,
  `next_session_begins` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_session`
--

INSERT INTO `core_session` (`id`, `session`, `is_current_session`, `next_session_begins`) VALUES
(1, '2024', 1, '2024-10-02');

-- --------------------------------------------------------

--
-- Table structure for table `course_course`
--

CREATE TABLE `course_course` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `summary` longtext DEFAULT NULL,
  `level` varchar(25) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `semester` varchar(200) NOT NULL,
  `is_elective` tinyint(1) DEFAULT NULL,
  `program_id` bigint(20) NOT NULL,
  `summary_en` longtext DEFAULT NULL,
  `summary_ru` longtext DEFAULT NULL,
  `title_en` varchar(200) DEFAULT NULL,
  `title_ru` varchar(200) DEFAULT NULL,
  `summary_es` longtext DEFAULT NULL,
  `summary_fr` longtext DEFAULT NULL,
  `title_es` varchar(200) DEFAULT NULL,
  `title_fr` varchar(200) DEFAULT NULL,
  `course_type` varchar(20) DEFAULT 'qcm_course'
) ;

--
-- Dumping data for table `course_course`
--

INSERT INTO `course_course` (`id`, `slug`, `title`, `code`, `credit`, `summary`, `level`, `year`, `semester`, `is_elective`, `program_id`, `summary_en`, `summary_ru`, `title_en`, `title_ru`, `summary_es`, `summary_fr`, `title_es`, `title_fr`, `course_type`) VALUES
(21, 'anatomie-i', 'Anatomie I', '1', 1, 'Anatomie I', NULL, 1, '', 0, 3, 'Anatomie I', NULL, 'Anatomie I', NULL, NULL, NULL, NULL, NULL, 'qcm_course'),
(26, 'anatomie-i-session', 'Anatomie I session', '0234', 0, 'Anatomie I session', 'Bachelor', 1, 'First', 0, 3, 'Anatomie I session', NULL, 'Anatomie I session', NULL, NULL, NULL, NULL, NULL, 'qcm_session'),
(27, 'anatomie-3', 'anatomie 3', '6123', 0, NULL, 'Bachelor', 1, 'First', 0, 3, NULL, NULL, 'anatomie 3', NULL, NULL, NULL, NULL, NULL, 'qcm_course'),
(28, 'anatomie4', 'anatomie4', '0231', 0, NULL, 'Bachelor', 1, 'First', 0, 3, NULL, NULL, 'anatomie4', NULL, NULL, NULL, NULL, NULL, 'qcm_course'),
(29, 'asdlas', 'asdlas', '01231', 0, NULL, 'Bachelor', 1, 'First', 0, 3, NULL, NULL, 'asdlas', NULL, NULL, NULL, NULL, NULL, 'qcm_course'),
(30, 'anatomie5-t526', 'anatomie5', '09312', 0, NULL, 'Bachelor', 1, 'Second', 0, 3, NULL, NULL, 'anatomie5', NULL, NULL, NULL, NULL, NULL, 'qcm_course'),
(31, 'asdklaskd-c5e1', 'asdklaskd', '2394089359', 0, NULL, 'Bachelor', 1, 'First', 0, 3, NULL, NULL, 'asdklaskd', NULL, NULL, NULL, NULL, NULL, 'qcm_course'),
(33, 'gggg', 'gggg', '8445', 0, NULL, 'Bachelor', 1, 'First', 0, 3, NULL, NULL, 'gggg', NULL, NULL, NULL, NULL, NULL, 'qcm_course'),
(34, 'bio-chimie-5', 'bio chimie 5', '94564', 0, 'asdasd', NULL, 1, '', 0, 3, 'asdasd', NULL, 'bio chimie 5', NULL, NULL, NULL, NULL, NULL, 'qcm_course');

-- --------------------------------------------------------

--
-- Table structure for table `course_courseallocation`
--

CREATE TABLE `course_courseallocation` (
  `id` bigint(20) NOT NULL,
  `lecturer_id` bigint(20) NOT NULL,
  `session_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_courseallocation_courses`
--

CREATE TABLE `course_courseallocation_courses` (
  `id` bigint(20) NOT NULL,
  `courseallocation_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_courseoffer`
--

CREATE TABLE `course_courseoffer` (
  `id` bigint(20) NOT NULL,
  `dep_head_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_program`
--

CREATE TABLE `course_program` (
  `id` bigint(20) NOT NULL,
  `title` varchar(150) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `summary_en` longtext DEFAULT NULL,
  `summary_ru` longtext DEFAULT NULL,
  `title_en` varchar(150) DEFAULT NULL,
  `title_ru` varchar(150) DEFAULT NULL,
  `summary_es` longtext DEFAULT NULL,
  `summary_fr` longtext DEFAULT NULL,
  `title_es` varchar(150) DEFAULT NULL,
  `title_fr` varchar(150) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_program`
--

INSERT INTO `course_program` (`id`, `title`, `summary`, `summary_en`, `summary_ru`, `title_en`, `title_ru`, `summary_es`, `summary_fr`, `title_es`, `title_fr`, `price`, `image`) VALUES
(3, 'Semestre 1 (FMPC)', 'Semestre 1 (FMPC)', 'Semestre 1 (FMPC)', NULL, 'Semestre 1 (FMPC)', NULL, NULL, NULL, NULL, NULL, 70.36, 'program_images/eHJgGj98ZxiCeZWEixFuITscsz1XSUK9Bt6la0Pl.gif'),
(4, 'Semestre 10 (FMPC)', 'Semestre 10 (FMPC)', 'Semestre 10 (FMPC)', NULL, 'Semestre 10 (FMPC)', NULL, NULL, NULL, NULL, NULL, 100.00, 'program_images/Nr1YxqJyKWsKqTSDcWsfS4NT9KQdKgbTv0OPDyt7_drxx99i.gif'),
(5, 'Semestre 2 (FMPC)', 'Semestre 2 (FMPC)', 'Semestre 2 (FMPC)', NULL, 'Semestre 2 (FMPC)', NULL, NULL, NULL, NULL, NULL, 100.00, 'program_images/TEcO6Rrz2VUiQ4aJOyOkQvScuSNC9hVfK19pNXEU.gif'),
(12, 'zero', NULL, NULL, NULL, 'zero', NULL, NULL, NULL, NULL, NULL, 0.00, 'program_images/uyQo2DVmmq99c6ss6jz6tSVVhxG9KuZNglTMY53z.gif');

-- --------------------------------------------------------

--
-- Table structure for table `course_subcourse`
--

CREATE TABLE `course_subcourse` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `course_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_subcourse`
--

INSERT INTO `course_subcourse` (`id`, `title`, `description`, `course_id`) VALUES
(29, 'Myologie (QCMs)', 'Myologie (QCMs)', 21),
(30, ' Organe', ' Organe', 21),
(40, 'Rattrapages', 'Rattrapages', 26),
(41, 'Normales', 'Normales', 26),
(42, 'ok', 'ok', 29),
(43, 'ok3', 'ok3', 30),
(44, 'ok4', 'ok4', 30),
(45, 'ok5', 'ok5', 31);

-- --------------------------------------------------------

--
-- Table structure for table `course_upload`
--

CREATE TABLE `course_upload` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `updated_date` datetime(6) DEFAULT NULL,
  `upload_time` datetime(6) DEFAULT NULL,
  `course_id` bigint(20) NOT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `title_ru` varchar(100) DEFAULT NULL,
  `title_es` varchar(100) DEFAULT NULL,
  `title_fr` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_uploadvideo`
--

CREATE TABLE `course_uploadvideo` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `video` varchar(100) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `course_id` bigint(20) NOT NULL,
  `summary_en` longtext DEFAULT NULL,
  `summary_ru` longtext DEFAULT NULL,
  `title_en` varchar(100) DEFAULT NULL,
  `title_ru` varchar(100) DEFAULT NULL,
  `summary_es` longtext DEFAULT NULL,
  `summary_fr` longtext DEFAULT NULL,
  `title_es` varchar(100) DEFAULT NULL,
  `title_fr` varchar(100) DEFAULT NULL,
  `youtube_link` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_uploadvideo`
--

INSERT INTO `course_uploadvideo` (`id`, `title`, `slug`, `video`, `summary`, `timestamp`, `course_id`, `summary_en`, `summary_ru`, `title_en`, `title_ru`, `summary_es`, `summary_fr`, `title_es`, `title_fr`, `youtube_link`) VALUES
(2, 'ilyas', 'ilyas', '', NULL, '2024-10-10 14:18:52.323495', 21, NULL, NULL, 'ilyas', NULL, NULL, NULL, NULL, NULL, 'https://www.youtube.com/watch?v=WMIn57isLUs');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_userdashboardmodule`
--

CREATE TABLE `dashboard_userdashboardmodule` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `app_label` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `column` int(10) UNSIGNED NOT NULL CHECK (`column` >= 0),
  `order` int(11) NOT NULL,
  `settings` longtext NOT NULL,
  `children` longtext NOT NULL,
  `collapsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dashboard_userdashboardmodule`
--

INSERT INTO `dashboard_userdashboardmodule` (`id`, `title`, `module`, `app_label`, `user_id`, `column`, `order`, `settings`, `children`, `collapsed`) VALUES
(7, 'Application models', 'jet.dashboard.modules.ModelList', 'accounts', 1, 0, 0, '{\"models\": [\"accounts.*\"], \"exclude\": null}', '', 0),
(8, 'Recent Actions', 'jet.dashboard.modules.RecentActions', 'accounts', 1, 1, 0, '{\"limit\": 10, \"include_list\": [\"accounts.*\"], \"exclude_list\": null, \"user\": null}', '', 0),
(9, 'Application models', 'jet.dashboard.modules.ModelList', 'course', 1, 0, 0, '{\"models\": [\"course.*\"], \"exclude\": null}', '', 0),
(10, 'Recent Actions', 'jet.dashboard.modules.RecentActions', 'course', 1, 1, 0, '{\"limit\": 10, \"include_list\": [\"course.*\"], \"exclude_list\": null, \"user\": null}', '', 0),
(11, 'Application models', 'jet.dashboard.modules.ModelList', 'quiz', 1, 0, 0, '{\"models\": [\"quiz.*\"], \"exclude\": null}', '', 0),
(12, 'Recent Actions', 'jet.dashboard.modules.RecentActions', 'quiz', 1, 1, 0, '{\"limit\": 10, \"include_list\": [\"quiz.*\"], \"exclude_list\": null, \"user\": null}', '', 0),
(13, 'Application models', 'jet.dashboard.modules.ModelList', 'payments', 1, 0, 0, '{\"models\": [\"payments.*\"], \"exclude\": null}', '', 0),
(14, 'Recent Actions', 'jet.dashboard.modules.RecentActions', 'payments', 1, 1, 0, '{\"limit\": 10, \"include_list\": [\"payments.*\"], \"exclude_list\": null, \"user\": null}', '', 0),
(15, 'Application models', 'jet.dashboard.modules.ModelList', 'social_django', 1, 0, 0, '{\"models\": [\"social_django.*\"], \"exclude\": null}', '', 0),
(16, 'Recent Actions', 'jet.dashboard.modules.RecentActions', 'social_django', 1, 1, 0, '{\"limit\": 10, \"include_list\": [\"social_django.*\"], \"exclude_list\": null, \"user\": null}', '', 0),
(17, 'Application models', 'jet.dashboard.modules.ModelList', 'core', 1, 0, 0, '{\"models\": [\"core.*\"], \"exclude\": null}', '', 0),
(18, 'Recent Actions', 'jet.dashboard.modules.RecentActions', 'core', 1, 1, 0, '{\"limit\": 10, \"include_list\": [\"core.*\"], \"exclude_list\": null, \"user\": null}', '', 0),
(19, 'Application models', 'jet.dashboard.modules.ModelList', 'auth', 1, 0, 0, '{\"models\": [\"auth.*\"], \"exclude\": null}', '', 0),
(20, 'Recent Actions', 'jet.dashboard.modules.RecentActions', 'auth', 1, 1, 0, '{\"limit\": 10, \"include_list\": [\"auth.*\"], \"exclude_list\": null, \"user\": null}', '', 0),
(21, 'Application models', 'jet.dashboard.modules.ModelList', 'result', 1, 0, 0, '{\"models\": [\"result.*\"], \"exclude\": null}', '', 0),
(22, 'Recent Actions', 'jet.dashboard.modules.RecentActions', 'result', 1, 1, 0, '{\"limit\": 10, \"include_list\": [\"result.*\"], \"exclude_list\": null, \"user\": null}', '', 0),
(78, 'Quick links', 'jet.dashboard.modules.LinkList', NULL, 1, 0, 0, '{\"draggable\": false, \"deletable\": false, \"collapsible\": false, \"layout\": \"inline\"}', '[{\"title\": \"Return to site\", \"url\": \"/\"}, {\"title\": \"Change password\", \"url\": \"/admin/password_change/\"}, {\"title\": \"Log out\", \"url\": \"/admin/logout/\"}]', 0),
(79, 'Applications', 'jet.dashboard.modules.AppList', NULL, 1, 1, 0, '{\"models\": null, \"exclude\": [\"auth.*\"]}', '', 0),
(80, 'Administration', 'jet.dashboard.modules.AppList', NULL, 1, 2, 0, '{\"models\": [\"auth.*\"], \"exclude\": null}', '', 0),
(81, 'Recent Actions', 'jet.dashboard.modules.RecentActions', NULL, 1, 0, 1, '{\"limit\": 10, \"include_list\": null, \"exclude_list\": null, \"user\": null}', '', 0),
(82, 'Latest Django News', 'jet.dashboard.modules.Feed', NULL, 1, 1, 1, '{\"feed_url\": \"http://www.djangoproject.com/rss/weblog/\", \"limit\": 5}', '', 0),
(83, 'Support', 'jet.dashboard.modules.LinkList', NULL, 1, 2, 1, '{\"draggable\": true, \"deletable\": true, \"collapsible\": true, \"layout\": \"stacked\"}', '[{\"title\": \"\", \"url\": \"\", \"external\": true}, {\"title\": \"\", \"url\": \"\", \"external\": true}, {\"title\": \"\", \"url\": \"\", \"external\": true}]', 0);

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
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-10-01 16:39:21.074149', '13', 'ugr-2024-12 (Rochdi Karouali)', 3, '', 13, 1),
(2, '2024-10-01 16:39:21.077169', '12', 'ugr-2024-11 (Rochdi Karouali)', 3, '', 13, 1),
(3, '2024-10-01 16:39:21.081151', '11', 'ugr-2024-10 (Rochdi Karouali)', 3, '', 13, 1),
(4, '2024-10-01 16:39:21.085163', '10', 'ugr-2024-9 (Rochdi Karouali)', 3, '', 13, 1),
(5, '2024-10-01 16:39:21.089153', '9', 'ugr-2024-8 (Rochdi Karouali)', 3, '', 13, 1),
(6, '2024-10-01 16:39:21.091169', '8', 'ugr-2024-7 (Rochdi Karouali)', 3, '', 13, 1),
(7, '2024-10-01 16:39:21.094159', '7', 'ugr-2024-6 (Rochdi Karouali)', 3, '', 13, 1),
(8, '2024-10-01 16:39:21.096166', '6', 'ugr-2024-5 (Rochdi Karouali)', 3, '', 13, 1),
(9, '2024-10-01 16:39:21.099174', '5', 'ugr-2024-4 (Rochdi Karouali)', 3, '', 13, 1),
(10, '2024-10-01 16:55:54.154529', '24', 'ugr-2024-8 (Rochdi Karouali)', 3, '', 13, 1),
(11, '2024-10-01 16:55:54.156531', '23', 'ugr-2024-7 (Rochdi Karouali)', 3, '', 13, 1),
(12, '2024-10-01 16:55:54.158531', '22', 'ugr-2024-6 (Rochdi Karouali)', 3, '', 13, 1),
(13, '2024-10-01 16:55:54.161533', '21', 'ugr-2024-5 (Rochdi Karouali)', 3, '', 13, 1),
(14, '2024-10-01 16:55:54.177531', '20', 'ugr-2024-4 (Rochdi Karouali)', 3, '', 13, 1),
(15, '2024-10-01 16:55:54.183539', '19', 'ugr-2024-3 (Rochdi Karouali)', 3, '', 13, 1),
(16, '2024-10-01 16:55:54.187531', '18', 'ugr-2024-2 (Rochdi Karouali)', 3, '', 13, 1),
(17, '2024-10-01 16:55:54.189532', '17', 'ugr-2024-1 (Rochdi Karouali)', 3, '', 13, 1),
(18, '2024-10-01 17:36:51.923881', '2', 'None (2)', 3, '', 17, 1),
(19, '2024-10-01 17:36:51.929061', '1', 'None (5234)', 3, '', 17, 1),
(20, '2024-10-01 19:21:33.591205', '20', 'öalödasd (324211)', 3, '', 17, 1),
(21, '2024-10-01 19:21:33.597387', '19', 'Tice et Anglais Médical (324231)', 3, '', 17, 1),
(22, '2024-10-01 19:21:33.601613', '18', 'Myologie (QCMs) (02342)', 3, '', 17, 1),
(23, '2024-10-01 19:21:33.609330', '17', 'Organe (69721)', 3, '', 17, 1),
(24, '2024-10-01 19:21:33.612331', '16', 'Biologie-Génétique fondamentale  2 (0234)', 3, '', 17, 1),
(25, '2024-10-01 19:21:33.616328', '15', 'aslsssssssss (53436)', 3, '', 17, 1),
(26, '2024-10-01 19:21:33.619904', '14', 'aslsssssssss (5343)', 3, '', 17, 1),
(27, '2024-10-01 19:21:33.624471', '13', 'asdddddddddddddddd (222)', 3, '', 17, 1),
(28, '2024-10-01 19:21:33.628467', '10', 'Santé publique et Biostatistiques (734)', 3, '', 17, 1),
(29, '2024-10-01 19:21:33.631476', '9', 'Chimie-Biochimie (99)', 3, '', 17, 1),
(30, '2024-10-01 19:21:33.634464', '8', 'Myologie (QCMs) (12345)', 3, '', 17, 1),
(31, '2024-10-01 19:21:33.637912', '5', 'Anatomie I (1)', 3, '', 17, 1),
(32, '2024-10-02 12:31:03.422945', '42', 'l\'angle strenal', 2, '[{\"changed\": {\"fields\": [\"Figure\", \"Question type\"]}}]', 28, 1),
(33, '2024-10-02 12:31:28.687710', '41', 'le sternum', 2, '[{\"changed\": {\"fields\": [\"Question type\"]}}]', 28, 1),
(34, '2024-10-13 12:48:03.255436', '30', 'dasd dasd', 2, '[]', 16, 1),
(35, '2024-10-13 12:58:45.212298', '30', 'dasd dasd', 2, '[]', 16, 1),
(36, '2024-10-13 22:40:14.673788', '2', 'New Library Opening', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1);

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
(14, 'accounts', 'departmenthead'),
(15, 'accounts', 'parent'),
(16, 'accounts', 'student'),
(13, 'accounts', 'user'),
(4, 'admin', 'logentry'),
(6, 'auth', 'group'),
(5, 'auth', 'permission'),
(7, 'contenttypes', 'contenttype'),
(9, 'core', 'activitylog'),
(10, 'core', 'newsandevents'),
(12, 'core', 'semester'),
(11, 'core', 'session'),
(17, 'course', 'course'),
(22, 'course', 'courseallocation'),
(21, 'course', 'courseoffer'),
(18, 'course', 'program'),
(20, 'course', 'upload'),
(19, 'course', 'uploadvideo'),
(1, 'dashboard', 'userdashboardmodule'),
(2, 'jet', 'bookmark'),
(3, 'jet', 'pinnedapplication'),
(35, 'payments', 'facture'),
(32, 'payments', 'invoice'),
(33, 'payments', 'salespointfacture'),
(31, 'quiz', 'choice'),
(27, 'quiz', 'essayquestion'),
(28, 'quiz', 'mcquestion'),
(30, 'quiz', 'progress'),
(25, 'quiz', 'question'),
(26, 'quiz', 'quiz'),
(29, 'quiz', 'sitting'),
(24, 'result', 'result'),
(23, 'result', 'takencourse'),
(8, 'sessions', 'session'),
(34, 'social_django', 'usersocialauth');

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
(1, 'core', '0001_initial', '2024-10-01 13:15:23.866276'),
(2, 'accounts', '0001_initial', '2024-10-01 13:15:23.944401'),
(3, 'course', '0001_initial', '2024-10-01 13:15:24.911403'),
(4, 'contenttypes', '0001_initial', '2024-10-01 13:15:24.942648'),
(5, 'contenttypes', '0002_remove_content_type_name', '2024-10-01 13:15:25.005152'),
(6, 'auth', '0001_initial', '2024-10-01 13:15:25.341100'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-10-01 13:15:25.403597'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-10-01 13:15:25.419223'),
(9, 'auth', '0004_alter_user_username_opts', '2024-10-01 13:15:25.419223'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-10-01 13:15:25.434848'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-10-01 13:15:25.434848'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-10-01 13:15:25.450473'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-10-01 13:15:25.518152'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-10-01 13:15:25.530744'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-10-01 13:15:25.543354'),
(16, 'auth', '0011_update_proxy_permissions', '2024-10-01 13:15:25.577256'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-10-01 13:15:25.580966'),
(18, 'accounts', '0002_initial', '2024-10-01 13:15:26.414134'),
(19, 'admin', '0001_initial', '2024-10-01 13:15:26.695391'),
(20, 'admin', '0002_logentry_remove_auto_add', '2024-10-01 13:15:26.711008'),
(21, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-01 13:15:26.726746'),
(22, 'core', '0002_newsandevents_summary_en_newsandevents_summary_ru_and_more', '2024-10-01 13:15:26.773517'),
(23, 'core', '0003_newsandevents_summary_es_newsandevents_summary_fr_and_more', '2024-10-01 13:15:26.820399'),
(24, 'course', '0002_course_summary_en_course_summary_ru_course_title_en_and_more', '2024-10-01 13:15:27.118394'),
(25, 'course', '0003_course_summary_es_course_summary_fr_course_title_es_and_more', '2024-10-01 13:15:27.428426'),
(26, 'dashboard', '0001_initial', '2024-10-01 13:15:27.451875'),
(27, 'dashboard', '0002_auto_20201228_1929', '2024-10-01 13:15:28.213247'),
(28, 'jet', '0001_initial', '2024-10-01 13:15:28.384055'),
(29, 'jet', '0002_delete_userdashboardmodule', '2024-10-01 13:15:28.399680'),
(30, 'jet', '0003_auto_20201228_1540', '2024-10-01 13:15:28.399680'),
(31, 'jet', '0004_auto_20201228_1802', '2024-10-01 13:15:28.399680'),
(32, 'payments', '0001_initial', '2024-10-01 13:15:28.509052'),
(33, 'quiz', '0001_initial', '2024-10-01 13:15:29.452724'),
(34, 'quiz', '0002_choice_choice_en_choice_choice_ru_and_more', '2024-10-01 13:15:29.640223'),
(35, 'quiz', '0003_choice_choice_es_choice_choice_fr_and_more', '2024-10-01 13:15:29.827724'),
(36, 'result', '0001_initial', '2024-10-01 13:15:30.155853'),
(37, 'sessions', '0001_initial', '2024-10-01 13:15:30.202723'),
(38, 'jet', '0001_squashed_0004_auto_20201228_1802', '2024-10-01 13:15:30.202723'),
(39, 'course', '0004_alter_course_parent_course', '2024-10-01 13:51:33.604472'),
(40, 'dashboard', '0003_alter_userdashboardmodule_id', '2024-10-01 13:51:33.683050'),
(41, 'jet', '0005_alter_bookmark_id_alter_pinnedapplication_id', '2024-10-01 13:51:33.910217');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9s7b1c9jl1l8913pc05xh3nmhm2n7g0l', '.eJxVjEEOgkAMRe8yazNhSqHUpXvPMCnTIqhhEgZWxrsrCQvd_vfef7ko2zrGrdgSJ3VnB407_Y69pIfNO9G7zLfsU57XZer9rviDFn_Nas_L4f4djFLGb81IINxYx1bRkIgThpoqsJq54mEIrQirhYaw5a4VVSIwqwF7BAzJvT_u7zdr:1szyxM:QiQbOi-MFicNfdhdXpDc-A6DbkYdYABlcCxhaQzgxUI', '2024-10-27 13:48:24.650072'),
('l1ys81xrdhgyr36056ibxavgivpmfxc2', 'eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoiVm5PQTdCbndoZzZuZk5HVHZGc1hwWnVtQXA5NlFFd1YifQ:1szMeN:u7gPmm5rSMV3r47x0G0CFKyzg5NaxLDzNXLt7tjif8Q', '2024-10-25 20:54:15.435593'),
('lydnt3pd1yrzko4koaa5pgr1bpsgdshz', 'eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoialgzczVpZ0NoZXZlcnNURDJUMUV4RXhMcGZ0SmNnaXoifQ:1szMgs:yjSb7AORsf6zBVUsfwrKRw2jmpyCXd4ERGmZHuinA2I', '2024-10-25 20:56:50.542393'),
('myysaxf4x397fje5bvsunzpnyoi76dgl', 'eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoiNGNxVjFTQkE1bklxM0kzSGNuRHZ2UTliRFBHOG5VVDgifQ:1szMca:irdBzB7j_bbM7zwpqOQL-VBXjTo5TJxDX3yH8GGBPb0', '2024-10-25 20:52:24.808748'),
('qr5nzbubsolc63zwhwc36z7h0c60cpv0', 'eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoiTHE3R2lTenFOeEpRcXJBZ1EyOEs4VFZYZVl1SlpqdEcifQ:1szLmG:PbsaSnqK6MqgbqVON5bqNDZmUbn83xTmpjWE48mI2qg', '2024-10-25 19:58:20.163917'),
('xd3isd8fihk0wmiv65lssl0h67q9bsre', '.eJxVjDkOwjAUBe_iGln-Jt4o6XOG6C8WDiBbipMKcXeIlALaNzPvpSbc1jJtPS_TLOqiQJ1-N0J-5LoDuWO9Nc2trstMelf0Qbsem-Tn9XD_Dgr28q2DiTaggYFcGkRInCQ2PhAJWGHvc3DZoaToKIKxjj0QwBn9QJ45qPcH3U83xg:1szyHT:rBU8MlBPB5FrfE0A_Oy0SDNX-vOsbfKKPqYmDP0qUd0', '2024-10-27 13:05:07.725760');

-- --------------------------------------------------------

--
-- Table structure for table `jet_bookmark`
--

CREATE TABLE `jet_bookmark` (
  `id` bigint(20) NOT NULL,
  `url` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_add` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jet_bookmark`
--

INSERT INTO `jet_bookmark` (`id`, `url`, `title`, `user_id`, `date_add`) VALUES
(1, 'http://127.0.0.1:8000/admin/course/', 'Course administration', 1, '2024-10-01 19:18:42.573800'),
(2, 'http://127.0.0.1:8000/admin/course/', 'Modules', 1, '2024-10-13 22:50:05.694210');

-- --------------------------------------------------------

--
-- Table structure for table `jet_pinnedapplication`
--

CREATE TABLE `jet_pinnedapplication` (
  `id` bigint(20) NOT NULL,
  `app_label` varchar(255) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_add` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments_activeabonnement`
--

CREATE TABLE `payments_activeabonnement` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `program_id` bigint(20) NOT NULL,
  `abonnement_type` varchar(50) NOT NULL,
  `status` varchar(10) DEFAULT 'active',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments_activeabonnement`
--

INSERT INTO `payments_activeabonnement` (`id`, `user_id`, `program_id`, `abonnement_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'facture', 'active', '2024-10-03 14:36:48', '2024-10-03 14:36:48'),
(2, 25, 3, 'facture', 'active', '2024-10-03 14:46:07', '2024-10-03 14:46:07'),
(3, 25, 12, 'facture', 'active', '2024-10-03 15:04:21', '2024-10-03 15:04:21'),
(4, 25, 4, 'facture', 'active', '2024-10-03 20:18:21', '2024-10-03 20:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `payments_facture`
--

CREATE TABLE `payments_facture` (
  `id` bigint(20) NOT NULL,
  `program_id` bigint(20) NOT NULL,
  `document1` varchar(100) DEFAULT NULL,
  `document2` varchar(100) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(10) DEFAULT 'pending',
  `reviewed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments_facture`
--

INSERT INTO `payments_facture` (`id`, `program_id`, `document1`, `document2`, `user_id`, `created_at`, `updated_at`, `status`, `reviewed_at`) VALUES
(1, 3, 'documents/cv_jemmari_nadia_1_8jSlVe7.pdf', 'documents/CarteVisiteNadiaBack_1_oJ29lZ9.pdf', 1, '2024-10-03 13:45:35', '2024-10-03 14:48:50', 'Paid', '2024-10-03 13:48:50'),
(2, 3, 'documents/1690055859160.jpg', 'documents/CarteVisiteNadiaBack.pdf', 1, '2024-10-03 14:34:55', '2024-10-03 15:36:48', 'Paid', '2024-10-03 14:36:48'),
(3, 3, 'documents/CarteVisiteNadiaBack_1_CW9lbTO.pdf', 'documents/CarteVisiteNadiaBack_1_wp2EWyX.pdf', 25, '2024-10-03 14:45:16', '2024-10-03 15:46:07', 'Paid', '2024-10-03 14:46:07'),
(4, 12, 'documents/cv_jemmari_nadia_1_1.pdf', 'documents/CarteVisiteNadiaBack_1_bpw39sL.pdf', 25, '2024-10-03 14:53:46', '2024-10-03 16:04:21', 'Paid', '2024-10-03 15:04:21'),
(5, 3, 'documents/cv_jemmari_nadia_1_1_yS2OhJQ.pdf', 'documents/cv_jemmari_nadia_1_8oi2mo4.pdf', 25, '2024-10-03 19:56:20', '2024-10-03 20:57:54', 'Rejected', '2024-10-03 19:57:54'),
(6, 4, 'documents/CarteVisiteNadiaBack_1_0aWwK6s.pdf', 'documents/CarteVisiteNadiaBack_1_JuTY56C.pdf', 25, '2024-10-03 20:17:41', '2024-10-03 21:18:21', 'Paid', '2024-10-03 20:18:21'),
(7, 4, 'documents/Screenshot_2024-10-09_190411.png', 'documents/Screenshot_2024-10-09_190411_3uLCTug.png', 25, '2024-10-10 15:57:48', '2024-10-10 15:57:48', 'pending', NULL),
(8, 3, 'documents/téléchargement.png', 'documents/téléchargement_UEVolJ2.png', 25, '2024-10-10 16:46:58', '2024-10-10 16:46:58', 'pending', NULL),
(9, 3, 'documents/1690055859160_K4do7RE.jpg', 'documents/1690055859160_jORJKuP.jpg', 38, '2024-10-13 11:59:28', '2024-10-13 13:00:12', 'Paid', '2024-10-13 12:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `payments_invoice`
--

CREATE TABLE `payments_invoice` (
  `id` bigint(20) NOT NULL,
  `total` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `payment_complete` tinyint(1) NOT NULL,
  `invoice_code` varchar(200) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments_pospayment`
--

CREATE TABLE `payments_pospayment` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `program_id` bigint(20) NOT NULL,
  `pos_code` varchar(20) NOT NULL,
  `student_card` varchar(255) NOT NULL,
  `status` enum('pending','accepted','rejected') DEFAULT 'pending',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments_salespointfacture`
--

CREATE TABLE `payments_salespointfacture` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `program_id` bigint(20) NOT NULL,
  `pos_code` varchar(100) NOT NULL,
  `document1` varchar(255) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reviewed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments_salespointfacture`
--

INSERT INTO `payments_salespointfacture` (`id`, `user_id`, `program_id`, `pos_code`, `document1`, `status`, `created_at`, `updated_at`, `reviewed_at`) VALUES
(1, 25, 5, '34534', 'cv jemmari nadia 1.pdf', 'Paid', '2024-10-03 20:22:42', '2024-10-03 21:26:04', '2024-10-03 20:26:04'),
(2, 1, 5, '091', 'cv jemmari nadia 1.pdf', 'Paid', '2024-10-03 20:49:48', '2024-10-03 21:50:17', '2024-10-03 20:50:17'),
(4, 1, 3, 'asdas', 'téléchargement.png', 'Pending', '2024-10-10 18:31:39', '2024-10-10 18:31:39', NULL),
(5, 1, 3, 'asdasd', 'téléchargement.png', 'Pending', '2024-10-10 18:59:38', '2024-10-10 18:59:38', NULL),
(6, 1, 3, 'dfsfs', 'téléchargement (1).png', 'Pending', '2024-10-10 19:38:41', '2024-10-10 19:38:41', NULL),
(7, 1, 3, 'ggggg', 'téléchargement.png', 'Pending', '2024-10-10 20:02:56', '2024-10-10 20:02:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_choice`
--

CREATE TABLE `quiz_choice` (
  `id` bigint(20) NOT NULL,
  `choice` varchar(1000) NOT NULL,
  `correct` tinyint(1) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `choice_en` varchar(1000) DEFAULT NULL,
  `choice_ru` varchar(1000) DEFAULT NULL,
  `choice_es` varchar(1000) DEFAULT NULL,
  `choice_fr` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_choice`
--

INSERT INTO `quiz_choice` (`id`, `choice`, `correct`, `question_id`, `choice_en`, `choice_ru`, `choice_es`, `choice_fr`) VALUES
(87, 'a', 1, 63, 'a', NULL, NULL, NULL),
(88, 'c', 0, 63, 'c', NULL, NULL, NULL),
(89, 'e', 0, 64, 'e', NULL, NULL, NULL),
(90, 'q', 1, 64, 'q', NULL, NULL, NULL),
(91, 'a', 1, 65, 'a', NULL, NULL, NULL),
(92, 'b', 0, 65, 'b', NULL, NULL, NULL),
(93, 'karim', 1, 66, 'karim', NULL, NULL, NULL),
(94, 'ahmed', 0, 66, 'ahmed', NULL, NULL, NULL),
(95, 'a', 1, 67, 'a', NULL, NULL, NULL),
(96, 'bv', 0, 67, 'bv', NULL, NULL, NULL),
(97, 'a', 1, 68, 'a', NULL, NULL, NULL),
(98, 'bv', 0, 68, 'bv', NULL, NULL, NULL),
(99, 'asd', 1, 69, 'asd', NULL, NULL, NULL),
(100, 'as', 0, 69, 'as', NULL, NULL, NULL),
(101, 'mohal', 1, 70, 'mohal', NULL, NULL, NULL),
(102, 'asd', 0, 70, 'asd', NULL, NULL, NULL),
(103, 'askd', 0, 71, 'askd', NULL, NULL, NULL),
(104, 'lqwe', 1, 71, 'lqwe', NULL, NULL, NULL),
(105, 'askd', 0, 72, 'askd', NULL, NULL, NULL),
(106, 'lqwe', 1, 72, 'lqwe', NULL, NULL, NULL),
(107, 'askd', 0, 73, 'askd', NULL, NULL, NULL),
(108, 'lqwe', 1, 73, 'lqwe', NULL, NULL, NULL),
(109, 'mostafa', 1, 74, 'mostafa', NULL, NULL, NULL),
(110, 'amin', 0, 74, 'amin', NULL, NULL, NULL),
(111, 'laskd', 0, 75, 'laskd', NULL, NULL, NULL),
(112, 'amin', 1, 75, 'amin', NULL, NULL, NULL),
(113, 'sad', 0, 75, 'sad', NULL, NULL, NULL),
(114, 'rochdi', 1, 77, 'rochdi', NULL, NULL, NULL),
(115, 'd', 0, 77, 'd', NULL, NULL, NULL),
(116, 'dasd', 0, 78, 'dasd', NULL, NULL, NULL),
(117, 'asd', 1, 78, 'asd', NULL, NULL, NULL),
(118, 'mostafa', 1, 79, 'mostafa', NULL, NULL, NULL),
(119, 'ahmed', 0, 79, 'ahmed', NULL, NULL, NULL),
(120, 'mostafa', 1, 80, 'mostafa', NULL, NULL, NULL),
(121, 'ahmed', 0, 80, 'ahmed', NULL, NULL, NULL),
(122, 'ab', 1, 81, 'ab', NULL, NULL, NULL),
(123, 'amin', 0, 81, 'amin', NULL, NULL, NULL),
(124, 'a', 0, 82, 'a', NULL, NULL, NULL),
(125, 's', 1, 82, 's', NULL, NULL, NULL),
(126, 's', 1, 83, 's', NULL, NULL, NULL),
(127, 's', 0, 83, 's', NULL, NULL, NULL),
(128, 'a', 0, 84, 'a', NULL, NULL, NULL),
(129, 'asss', 1, 84, 'asss', NULL, NULL, NULL),
(130, 'khoaa', 1, 85, 'khoaa', NULL, NULL, NULL),
(131, 'laa', 0, 85, 'laa', NULL, NULL, NULL),
(132, 'ok', 1, 86, 'ok', NULL, NULL, NULL),
(133, 'ok', 0, 86, 'ok', NULL, NULL, NULL),
(134, 'a', 1, 87, 'a', NULL, NULL, NULL),
(135, 's', 0, 87, 's', NULL, NULL, NULL),
(136, 's', 1, 88, 's', NULL, NULL, NULL),
(137, 'd', 0, 88, 'd', NULL, NULL, NULL),
(138, 'f', 0, 88, 'f', NULL, NULL, NULL),
(139, 'f', 1, 89, 'f', NULL, NULL, NULL),
(140, 'd', 0, 89, 'd', NULL, NULL, NULL),
(141, 'r', 0, 89, 'r', NULL, NULL, NULL),
(142, 'f', 1, 90, 'f', NULL, NULL, NULL),
(143, 's', 0, 90, 's', NULL, NULL, NULL),
(144, 'd', 0, 90, 'd', NULL, NULL, NULL),
(145, 'mostafa', 1, 91, 'mostafa', NULL, NULL, NULL),
(146, 'b', 0, 91, 'b', NULL, NULL, NULL),
(147, 'asd', 1, 92, 'asd', NULL, NULL, NULL),
(148, 'as', 0, 92, 'as', NULL, NULL, NULL),
(149, 'mostafa', 1, 93, 'mostafa', NULL, NULL, NULL),
(150, 'amin', 0, 93, 'amin', NULL, NULL, NULL),
(151, 'karim', 1, 94, 'karim', NULL, NULL, NULL),
(152, 'asd', 0, 94, 'asd', NULL, NULL, NULL),
(153, 'alsldasd', 1, 95, 'alsldasd', NULL, NULL, NULL),
(154, 'asd', 0, 95, 'asd', NULL, NULL, NULL),
(155, 'a', 0, 96, 'a', NULL, NULL, NULL),
(156, 'b', 1, 96, 'b', NULL, NULL, NULL),
(157, 'asd', 1, 97, 'asd', NULL, NULL, NULL),
(158, 'ac', 0, 97, 'ac', NULL, NULL, NULL),
(159, 'd', 1, 98, 'd', NULL, NULL, NULL),
(160, 'ac', 0, 98, 'ac', NULL, NULL, NULL),
(161, 'mostafa', 0, 99, 'mostafa', NULL, NULL, NULL),
(162, 'amin', 1, 99, 'amin', NULL, NULL, NULL),
(163, 'mostafa', 1, 100, 'mostafa', NULL, NULL, NULL),
(164, 'ahmed', 0, 100, 'ahmed', NULL, NULL, NULL),
(165, 'a', 1, 101, 'a', NULL, NULL, NULL),
(166, 'b', 0, 101, 'b', NULL, NULL, NULL),
(167, 'mostafa', 1, 102, 'mostafa', NULL, NULL, NULL),
(168, 'ahmed', 0, 102, 'ahmed', NULL, NULL, NULL),
(169, 'mostafa', 1, 103, 'mostafa', NULL, NULL, NULL),
(170, 'ahmed', 0, 103, 'ahmed', NULL, NULL, NULL),
(171, 'ab', 1, 104, 'ab', NULL, NULL, NULL),
(172, 'amin', 0, 104, 'amin', NULL, NULL, NULL),
(173, 'd', 1, 105, 'd', NULL, NULL, NULL),
(174, 'amin', 0, 105, 'amin', NULL, NULL, NULL),
(175, 'karim', 1, 106, 'karim', NULL, NULL, NULL),
(176, 'ac', 0, 106, 'ac', NULL, NULL, NULL),
(177, 'asd', 0, 107, 'asd', NULL, NULL, NULL),
(178, 'rochdi', 1, 107, 'rochdi', NULL, NULL, NULL),
(179, '1', 1, 108, '1', NULL, NULL, NULL),
(180, '2', 0, 108, '2', NULL, NULL, NULL),
(181, '3', 1, 109, '3', NULL, NULL, NULL),
(182, '4', 0, 109, '4', NULL, NULL, NULL),
(183, '5', 1, 110, '5', NULL, NULL, NULL),
(184, '6', 0, 110, '6', NULL, NULL, NULL),
(185, '7', 1, 111, '7', NULL, NULL, NULL),
(186, '8', 0, 111, '8', NULL, NULL, NULL),
(187, '9', 1, 112, '9', NULL, NULL, NULL),
(188, '10', 0, 112, '10', NULL, NULL, NULL),
(189, '11', 1, 113, '11', NULL, NULL, NULL),
(190, '12', 0, 113, '12', NULL, NULL, NULL),
(191, 'ok1', 1, 114, 'ok1', NULL, NULL, NULL),
(192, 'ok2', 0, 114, 'ok2', NULL, NULL, NULL),
(193, 'njerbo1', 1, 115, 'njerbo1', NULL, NULL, NULL),
(194, 'njerbo2', 0, 115, 'njerbo2', NULL, NULL, NULL),
(195, 'njerbo3', 1, 116, 'njerbo3', NULL, NULL, NULL),
(196, 'njerbo4', 0, 116, 'njerbo4', NULL, NULL, NULL),
(197, 'njerbo5', 1, 117, 'njerbo5', NULL, NULL, NULL),
(198, 'njerbo6', 0, 117, 'njerbo6', NULL, NULL, NULL),
(199, 'ok1', 1, 118, 'ok1', NULL, NULL, NULL),
(200, 'ok2', 0, 118, 'ok2', NULL, NULL, NULL),
(201, 'karim', 1, 119, 'karim', NULL, NULL, NULL),
(202, 'ahmed', 0, 119, 'ahmed', NULL, NULL, NULL),
(203, 'a', 1, 120, 'a', NULL, NULL, NULL),
(204, 'b', 0, 120, 'b', NULL, NULL, NULL),
(205, 'a', 1, 121, 'a', NULL, NULL, NULL),
(206, 'ac', 0, 121, 'ac', NULL, NULL, NULL),
(207, 'ab', 1, 122, 'ab', NULL, NULL, NULL),
(208, 'amin', 0, 122, 'amin', NULL, NULL, NULL),
(209, 'asd', 1, 123, 'asd', NULL, NULL, NULL),
(210, 'asd', 0, 123, 'asd', NULL, NULL, NULL),
(211, 'a', 1, 124, 'a', NULL, NULL, NULL),
(212, 'b', 0, 124, 'b', NULL, NULL, NULL),
(213, 'mostafa', 1, 125, 'mostafa', NULL, NULL, NULL),
(214, 'b', 0, 125, 'b', NULL, NULL, NULL),
(215, 'a', 1, 126, 'a', NULL, NULL, NULL),
(216, 'b', 0, 126, 'b', NULL, NULL, NULL),
(217, 'mostafa', 0, 127, 'mostafa', NULL, NULL, NULL),
(218, 'b', 1, 127, 'b', NULL, NULL, NULL),
(219, 'ab', 1, 128, 'ab', NULL, NULL, NULL),
(220, 'amin', 0, 128, 'amin', NULL, NULL, NULL),
(221, 'ab', 1, 129, 'ab', NULL, NULL, NULL),
(222, 'amin', 0, 129, 'amin', NULL, NULL, NULL),
(223, 'expalnatation', 1, 130, 'expalnatation', NULL, NULL, NULL),
(224, 'expalnatation', 0, 130, 'expalnatation', NULL, NULL, NULL),
(225, 'expalnatation', 1, 131, 'expalnatation', NULL, NULL, NULL),
(226, 'expalnatation', 0, 131, 'expalnatation', NULL, NULL, NULL),
(227, 'expalnatation', 1, 132, 'expalnatation', NULL, NULL, NULL),
(228, 'expalnatation', 0, 132, 'expalnatation', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_comment`
--

CREATE TABLE `quiz_comment` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `is_anonymous` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_comment`
--

INSERT INTO `quiz_comment` (`id`, `user_id`, `question_id`, `content`, `created_at`, `is_anonymous`) VALUES
(1, 1, 114, 'test1 ok', '2024-10-08 21:55:05', 0),
(2, 25, 108, 'test1 njerbo1', '2024-10-08 21:57:24', 0),
(3, 25, 109, 'test1 njerbo2', '2024-10-08 21:57:52', 0),
(4, 25, 110, 'test njerbo3', '2024-10-08 21:58:06', 0),
(5, 1, 112, 'testnjerbo5', '2024-10-08 22:30:41', 0),
(7, 1, 114, 'anon', '2024-10-08 22:44:23', 0),
(8, 1, 114, 'an', '2024-10-08 22:44:36', 0),
(9, NULL, 114, 'ano', '2024-10-08 22:47:09', 1),
(10, NULL, 114, 'anonyme', '2024-10-08 22:47:17', 1),
(11, 1, 114, 'Noneasdasd', '2024-10-08 23:42:58', 0),
(12, 1, 114, 'test2', '2024-10-08 23:43:27', 0),
(19, NULL, 114, 'ou hada', '2024-10-09 00:33:27', 1),
(20, 1, 114, 'ssssssssssss', '2024-10-09 00:42:33', 0),
(21, 1, 106, 'test', '2024-10-09 12:57:12', 0),
(22, NULL, 120, 'gg', '2024-10-10 02:09:49', 1),
(23, 1, 120, 'test', '2024-10-10 02:28:00', 0),
(24, 1, 120, 'ggggggg', '2024-10-10 02:35:28', 0),
(25, NULL, 120, 'fffffff', '2024-10-10 02:37:17', 1),
(26, 1, 124, 'test', '2024-10-10 13:37:39', 0),
(27, NULL, 124, 'gg', '2024-10-10 13:48:28', 1),
(28, 25, 108, 'test', '2024-10-12 14:52:04', 0),
(29, 25, 108, 'test', '2024-10-12 14:52:04', 0),
(30, 25, 131, 'test', '2024-10-13 19:13:20', 0),
(31, NULL, 131, 'ggg', '2024-10-13 19:13:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_essayquestion`
--

CREATE TABLE `quiz_essayquestion` (
  `question_ptr_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_mcquestion`
--

CREATE TABLE `quiz_mcquestion` (
  `question_ptr_id` bigint(20) NOT NULL,
  `choice_order` varchar(30) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `question_type` enum('normales','rattrapage') DEFAULT NULL,
  `correction_type` enum('O','No') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_mcquestion`
--

INSERT INTO `quiz_mcquestion` (`question_ptr_id`, `choice_order`, `year`, `question_type`, `correction_type`) VALUES
(63, NULL, 2024, '', 'O'),
(64, NULL, 2024, '', 'O'),
(65, NULL, 2024, '', 'O'),
(66, NULL, 2024, 'rattrapage', 'O'),
(67, 'content', 2024, '', 'O'),
(68, 'content', 2024, '', 'O'),
(69, NULL, 2024, '', 'O'),
(70, NULL, 2024, '', 'O'),
(71, NULL, 2025, 'rattrapage', 'No'),
(72, NULL, 2025, 'rattrapage', 'No'),
(73, NULL, 2025, 'rattrapage', 'No'),
(74, NULL, 2024, 'rattrapage', 'O'),
(75, NULL, 2025, 'rattrapage', 'No'),
(77, NULL, 2023, '', ''),
(78, NULL, 2023, '', 'O'),
(79, NULL, 2032, '', ''),
(80, 'content', 20321, '', ''),
(81, NULL, 222, '', ''),
(82, NULL, 1, '', ''),
(83, NULL, 1, '', ''),
(84, NULL, 1, '', ''),
(85, NULL, 1, '', ''),
(86, NULL, -1, '', ''),
(87, NULL, 1, '', ''),
(88, NULL, 1, '', ''),
(89, NULL, 1, '', ''),
(90, NULL, 1, '', ''),
(91, NULL, 1, '', ''),
(92, NULL, 1, '', ''),
(93, NULL, 1, '', ''),
(94, NULL, 1, '', ''),
(95, NULL, 1, '', ''),
(96, NULL, 1, '', ''),
(97, NULL, 1, '', ''),
(98, NULL, 1, '', ''),
(99, NULL, 1, '', ''),
(100, NULL, 2, '', ''),
(101, NULL, 1, '', ''),
(102, NULL, 12, '', ''),
(103, NULL, 12, '', ''),
(104, NULL, 1, '', ''),
(105, NULL, 1, '', ''),
(106, NULL, 1, '', ''),
(107, NULL, 3, '', ''),
(108, NULL, 1, '', ''),
(109, NULL, 1, '', ''),
(110, NULL, 1, '', ''),
(111, NULL, 1, '', ''),
(112, NULL, 1, '', ''),
(113, NULL, 1, '', ''),
(114, 'content', 1, '', ''),
(115, NULL, 1, '', ''),
(116, NULL, 1, '', ''),
(117, NULL, 1, '', ''),
(118, NULL, 1, '', ''),
(119, NULL, 2024, '', 'O'),
(120, NULL, 2024, 'rattrapage', 'No'),
(121, NULL, 2027, '', 'O'),
(122, NULL, 1099, '', 'O'),
(123, NULL, 1098, '', ''),
(124, NULL, 1097, '', 'O'),
(125, NULL, 2999, 'normales', 'O'),
(126, NULL, 0, 'rattrapage', 'O'),
(127, NULL, 2030, 'normales', 'No'),
(128, NULL, 2090, '', 'O'),
(129, NULL, 2090, 'normales', 'O'),
(130, NULL, 2025, 'normales', 'O'),
(131, NULL, 2025, 'rattrapage', 'No'),
(132, NULL, 2025, 'normales', 'O');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_note`
--

CREATE TABLE `quiz_note` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `quiz_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `notes` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_note`
--

INSERT INTO `quiz_note` (`id`, `user_id`, `quiz_id`, `question_id`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 67, 124, 'aa', '2024-10-11 17:21:13', '2024-10-11 17:42:56'),
(4, 1, 68, 130, 'ss', '2024-10-11 17:42:44', '2024-10-11 17:42:44'),
(5, 1, 66, 121, 'gg', '2024-10-11 17:43:06', '2024-10-11 17:43:06'),
(8, 25, 67, 122, 'Time management is a crucial skill that everyone ', '2024-10-13 14:15:03', '2024-10-13 14:28:51'),
(9, 25, 66, 121, 'laaaaaaaaaaa', '2024-10-13 14:15:12', '2024-10-13 14:15:12');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_progress`
--

CREATE TABLE `quiz_progress` (
  `id` bigint(20) NOT NULL,
  `score` varchar(1024) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_progress`
--

INSERT INTO `quiz_progress` (`id`, `score`, `user_id`) VALUES
(5, 'quiz.Quiz.None,57,89,', 25),
(6, 'quiz.Quiz.None,200,374,', 1),
(7, '', 38),
(8, '', 40),
(9, '', 47);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question`
--

CREATE TABLE `quiz_question` (
  `id` bigint(20) NOT NULL,
  `figure` varchar(100) DEFAULT NULL,
  `content` varchar(1000) NOT NULL,
  `explanation` longtext NOT NULL,
  `content_en` varchar(1000) DEFAULT NULL,
  `content_ru` varchar(1000) DEFAULT NULL,
  `explanation_en` longtext DEFAULT NULL,
  `explanation_ru` longtext DEFAULT NULL,
  `content_es` varchar(1000) DEFAULT NULL,
  `content_fr` varchar(1000) DEFAULT NULL,
  `explanation_es` longtext DEFAULT NULL,
  `explanation_fr` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_question`
--

INSERT INTO `quiz_question` (`id`, `figure`, `content`, `explanation`, `content_en`, `content_ru`, `explanation_en`, `explanation_ru`, `content_es`, `content_fr`, `explanation_es`, `explanation_fr`) VALUES
(63, '', 'exam1', '<', 'exam1', NULL, '<', NULL, NULL, NULL, NULL, NULL),
(64, '', 'exam2', 'exam2', 'exam2', NULL, 'exam2', NULL, NULL, NULL, NULL, NULL),
(65, '', 'le sternum', '', 'le sternum', NULL, '', NULL, NULL, NULL, NULL, NULL),
(66, '', 'chkoun hada', 'asdk', 'chkoun hada', NULL, 'asdk', NULL, NULL, NULL, NULL, NULL),
(67, '', 'test', 'asdkas', 'test', NULL, 'asdkas', NULL, NULL, NULL, NULL, NULL),
(68, '', 'test', 'asdkas', 'test', NULL, 'asdkas', NULL, NULL, NULL, NULL, NULL),
(69, '', 'lasdlas', 'asd', 'lasdlas', NULL, 'asd', NULL, NULL, NULL, NULL, NULL),
(70, '', 'mohal', 'asd', 'mohal', NULL, 'asd', NULL, NULL, NULL, NULL, NULL),
(71, '', '3ellah', '', '3ellah', NULL, '', NULL, NULL, NULL, NULL, NULL),
(72, '', '3ellah', '', '3ellah', NULL, '', NULL, NULL, NULL, NULL, NULL),
(73, '', '3ellah', '', '3ellah', NULL, '', NULL, NULL, NULL, NULL, NULL),
(74, '', 'okasd', 'asdas', 'okasd', NULL, 'asdas', NULL, NULL, NULL, NULL, NULL),
(75, '', 'asldasdklas', 'asdklaskld', 'asldasdklas', NULL, 'asdklaskld', NULL, NULL, NULL, NULL, NULL),
(77, '', 'asdas', '', 'asdas', NULL, '', NULL, NULL, NULL, NULL, NULL),
(78, '', 'asdlasdklaskld', '', 'asdlasdklaskld', NULL, '', NULL, NULL, NULL, NULL, NULL),
(79, '', 'asdaskd', '', 'asdaskd', NULL, '', NULL, NULL, NULL, NULL, NULL),
(80, '', 'asdlasld', 'asd', 'asdlasld', NULL, 'asd', NULL, NULL, NULL, NULL, NULL),
(81, '', 'asdasda', '', 'asdasda', NULL, '', NULL, NULL, NULL, NULL, NULL),
(82, '', 'as,das,l', '', 'as,das,l', NULL, '', NULL, NULL, NULL, NULL, NULL),
(83, '', 's', '', 's', NULL, '', NULL, NULL, NULL, NULL, NULL),
(84, '', 'asdddddddddd', '', 'asdddddddddd', NULL, '', NULL, NULL, NULL, NULL, NULL),
(85, '', 'test', 'khoa', 'test', NULL, 'khoa', NULL, NULL, NULL, NULL, NULL),
(86, '', 'ok', 'ok', 'ok', NULL, 'ok', NULL, NULL, NULL, NULL, NULL),
(87, '', 'asldaskld', '', 'asldaskld', NULL, '', NULL, NULL, NULL, NULL, NULL),
(88, '', 's', '', 's', NULL, '', NULL, NULL, NULL, NULL, NULL),
(89, '', 'f', '', 'f', NULL, '', NULL, NULL, NULL, NULL, NULL),
(90, '', 'f', '', 'f', NULL, '', NULL, NULL, NULL, NULL, NULL),
(91, '', 'asdla', 'as', 'asdla', NULL, 'as', NULL, NULL, NULL, NULL, NULL),
(92, '', 'asd', '', 'asd', NULL, '', NULL, NULL, NULL, NULL, NULL),
(93, '', 'dasklkdas', 'das', 'dasklkdas', NULL, 'das', NULL, NULL, NULL, NULL, NULL),
(94, '', 'askll', '', 'askll', NULL, '', NULL, NULL, NULL, NULL, NULL),
(95, '', 'asd', '', 'asd', NULL, '', NULL, NULL, NULL, NULL, NULL),
(96, '', 'sad', '', 'sad', NULL, '', NULL, NULL, NULL, NULL, NULL),
(97, '', 'chkoun shih', '', 'chkoun shih', NULL, '', NULL, NULL, NULL, NULL, NULL),
(98, '', 'qweqwerw', '', 'qweqwerw', NULL, '', NULL, NULL, NULL, NULL, NULL),
(99, '', '1323', '', '1323', NULL, '', NULL, NULL, NULL, NULL, NULL),
(100, '', 'asdasd2342', '', 'asdasd2342', NULL, '', NULL, NULL, NULL, NULL, NULL),
(101, '', 'asöldölasöldaöls', '', 'asöldölasöldaöls', NULL, '', NULL, NULL, NULL, NULL, NULL),
(102, '', 'll', '', 'll', NULL, '', NULL, NULL, NULL, NULL, NULL),
(103, '', 'll', '', 'll', NULL, '', NULL, NULL, NULL, NULL, NULL),
(104, '', 'chkoun shih', '', 'chkoun shih', NULL, '', NULL, NULL, NULL, NULL, NULL),
(105, '', 'aslls', '', 'aslls', NULL, '', NULL, NULL, NULL, NULL, NULL),
(106, '', 'asd', '', 'asd', NULL, '', NULL, NULL, NULL, NULL, NULL),
(107, '', 'asldasl', '', 'asldasl', NULL, '', NULL, NULL, NULL, NULL, NULL),
(108, '', 'njerbo1', '', 'njerbo1', NULL, '', NULL, NULL, NULL, NULL, NULL),
(109, '', 'njerbo2', '', 'njerbo2', NULL, '', NULL, NULL, NULL, NULL, NULL),
(110, '', 'njerbo3', '', 'njerbo3', NULL, '', NULL, NULL, NULL, NULL, NULL),
(111, '', 'njerbo4', '', 'njerbo4', NULL, '', NULL, NULL, NULL, NULL, NULL),
(112, '', 'njerbo5', '', 'njerbo5', NULL, '', NULL, NULL, NULL, NULL, NULL),
(113, '', 'njerbo6', '', 'njerbo6', NULL, '', NULL, NULL, NULL, NULL, NULL),
(114, '', 'ok', '', 'ok', NULL, '', NULL, NULL, NULL, NULL, NULL),
(115, '', 'njerbo', '', 'njerbo', NULL, '', NULL, NULL, NULL, NULL, NULL),
(116, '', 'njerbo2', '', 'njerbo2', NULL, '', NULL, NULL, NULL, NULL, NULL),
(117, '', 'njerbo3', '', 'njerbo3', NULL, '', NULL, NULL, NULL, NULL, NULL),
(118, '', 'ok', '', 'ok', NULL, '', NULL, NULL, NULL, NULL, NULL),
(119, '', 'chkoun hada', '', 'chkoun hada', NULL, '', NULL, NULL, NULL, NULL, NULL),
(120, '', 'chkoun shih', '', 'chkoun shih', NULL, '', NULL, NULL, NULL, NULL, NULL),
(121, '', 'aaaaaaaa', '', 'aaaaaaaa', NULL, '', NULL, NULL, NULL, NULL, NULL),
(122, '', 'aaaaaaaaaaaaa', '', 'aaaaaaaaaaaaa', NULL, '', NULL, NULL, NULL, NULL, NULL),
(123, '', 'asdklökldasökldöas', '', 'asdklökldasökldöas', NULL, '', NULL, NULL, NULL, NULL, NULL),
(124, '', 'lödasdäöasdöa', '', 'lödasdäöasdöa', NULL, '', NULL, NULL, NULL, NULL, NULL),
(125, '', 'le sternum', 'asd', 'le sternum', NULL, 'asd', NULL, NULL, NULL, NULL, NULL),
(126, '', 'asdasasdas', '', 'asdasasdas', NULL, '', NULL, NULL, NULL, NULL, NULL),
(127, '', 'le sternum', '', 'le sternum', NULL, '', NULL, NULL, NULL, NULL, NULL),
(128, '', 'asd', '', 'asd', NULL, '', NULL, NULL, NULL, NULL, NULL),
(129, '', 'laösd', '', 'laösd', NULL, '', NULL, NULL, NULL, NULL, NULL),
(130, '', 'expalnatation', 'expalnatation expalnatation', 'expalnatation', NULL, 'expalnatation expalnatation', NULL, NULL, NULL, NULL, NULL),
(131, '', 'expalnatation 2', 'expalnatation', 'expalnatation 2', NULL, 'expalnatation', NULL, NULL, NULL, NULL, NULL),
(132, '', 'expalnatation 3', 'expalnatation expalnatation expalnatation expalnatation expalnatation expalnatation', 'expalnatation 3', NULL, 'expalnatation expalnatation expalnatation expalnatation expalnatation expalnatation', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_question_quiz`
--

CREATE TABLE `quiz_question_quiz` (
  `id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `quiz_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_question_quiz`
--

INSERT INTO `quiz_question_quiz` (`id`, `question_id`, `quiz_id`) VALUES
(64, 101, 53),
(65, 102, 53),
(66, 103, 53),
(67, 104, 53),
(68, 105, 54),
(69, 106, 55),
(70, 107, 56),
(71, 108, 58),
(72, 109, 58),
(73, 110, 58),
(74, 111, 58),
(75, 112, 58),
(76, 113, 58),
(77, 114, 59),
(78, 115, 60),
(79, 116, 60),
(80, 117, 60),
(81, 118, 64),
(82, 119, 65),
(83, 120, 65),
(84, 121, 66),
(85, 122, 67),
(86, 123, 67),
(87, 124, 67),
(88, 125, 67),
(89, 126, 67),
(90, 127, 67),
(91, 128, 67),
(92, 129, 67),
(93, 130, 68),
(94, 131, 68),
(95, 132, 68);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_quiz`
--

CREATE TABLE `quiz_quiz` (
  `id` bigint(20) NOT NULL,
  `title` varchar(60) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `category` longtext NOT NULL,
  `random_order` tinyint(1) NOT NULL,
  `answers_at_end` tinyint(1) NOT NULL,
  `exam_paper` tinyint(1) NOT NULL,
  `single_attempt` tinyint(1) NOT NULL,
  `pass_mark` smallint(6) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `description_en` longtext DEFAULT NULL,
  `description_ru` longtext DEFAULT NULL,
  `title_en` varchar(60) DEFAULT NULL,
  `title_ru` varchar(60) DEFAULT NULL,
  `description_es` longtext DEFAULT NULL,
  `description_fr` longtext DEFAULT NULL,
  `title_es` varchar(60) DEFAULT NULL,
  `title_fr` varchar(60) DEFAULT NULL,
  `subcourse_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_quiz`
--

INSERT INTO `quiz_quiz` (`id`, `title`, `slug`, `description`, `category`, `random_order`, `answers_at_end`, `exam_paper`, `single_attempt`, `pass_mark`, `draft`, `timestamp`, `course_id`, `description_en`, `description_ru`, `title_en`, `title_ru`, `description_es`, `description_fr`, `title_es`, `title_fr`, `subcourse_id`) VALUES
(53, 'askldlasl', 'askldlasl', '', '', 0, 0, 0, 0, 50, 0, '2024-10-05 11:38:15.529432', 21, NULL, NULL, 'askldlasl', NULL, NULL, NULL, NULL, NULL, 29),
(54, 'askl', 'askl', '', '', 0, 0, 0, 0, 50, 0, '2024-10-05 11:53:41.902257', 21, NULL, NULL, 'askl', NULL, NULL, NULL, NULL, NULL, 29),
(55, 'asd', 'asd', 'asldasl', '', 0, 0, 0, 0, 50, 0, '2024-10-05 11:56:34.010397', 21, 'asldasl', NULL, 'asd', NULL, NULL, NULL, NULL, NULL, 29),
(56, 'asldlasld', 'asldlasld', '', '', 0, 0, 0, 0, 50, 0, '2024-10-05 12:26:12.783813', 21, NULL, NULL, 'asldlasld', NULL, NULL, NULL, NULL, NULL, 29),
(58, 'njerbo', 'njerbo', '', '', 0, 0, 0, 0, 50, 0, '2024-10-05 21:36:03.074083', 21, NULL, NULL, 'njerbo', NULL, NULL, NULL, NULL, NULL, 30),
(59, 'exam', 'exam', '', 'exam', 0, 0, 0, 0, 50, 0, '2024-10-07 19:19:33.005719', 21, NULL, NULL, 'exam', NULL, NULL, NULL, NULL, NULL, 30),
(60, 'test', 'test', '', '', 0, 0, 0, 0, 50, 0, '2024-10-08 15:28:59.493449', 26, NULL, NULL, 'test', NULL, NULL, NULL, NULL, NULL, 41),
(61, 'asd', 'asd-gyau', '', '', 0, 0, 0, 0, 50, 0, '2024-10-08 16:05:43.741199', 30, NULL, NULL, 'asd', NULL, NULL, NULL, NULL, NULL, 43),
(62, 'odas', 'odas', '', '', 0, 0, 0, 0, 50, 0, '2024-10-08 16:06:42.431566', 31, NULL, NULL, 'odas', NULL, NULL, NULL, NULL, NULL, 45),
(63, 'as', 'as', '', '', 0, 0, 0, 0, 50, 0, '2024-10-08 16:10:01.869056', 31, NULL, NULL, 'as', NULL, NULL, NULL, NULL, NULL, 45),
(64, 'ok', 'ok', '', '', 0, 0, 0, 0, 50, 0, '2024-10-08 16:12:55.739200', 31, NULL, NULL, 'ok', NULL, NULL, NULL, NULL, NULL, 45),
(65, 'test5', 'test5', '', '', 0, 0, 0, 0, 50, 0, '2024-10-09 14:18:43.377962', 21, NULL, NULL, 'test5', NULL, NULL, NULL, NULL, NULL, 29),
(66, 'lasldas', 'lasldas-wzui', '', '', 0, 0, 0, 0, 50, 0, '2024-10-09 14:28:56.741565', 21, NULL, NULL, 'lasldas', NULL, NULL, NULL, NULL, NULL, 29),
(67, 'asdas', 'asdas', '', '', 0, 0, 0, 0, 50, 0, '2024-10-09 14:29:05.905651', 21, NULL, NULL, 'asdas', NULL, NULL, NULL, NULL, NULL, 30),
(68, 'expalnatation', 'expalnatation', 'expalnatation', '', 0, 0, 0, 0, 50, 0, '2024-10-09 16:28:41.518106', 21, 'expalnatation', NULL, 'expalnatation', NULL, NULL, NULL, NULL, NULL, 30);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_sitting`
--

CREATE TABLE `quiz_sitting` (
  `id` bigint(20) NOT NULL,
  `question_order` varchar(1024) NOT NULL,
  `question_list` varchar(1024) NOT NULL,
  `incorrect_questions` varchar(1024) NOT NULL,
  `current_score` int(11) NOT NULL,
  `complete` tinyint(1) NOT NULL,
  `user_answers` longtext NOT NULL,
  `start` datetime(6) NOT NULL,
  `end` datetime(6) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `quiz_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `correct_questions` varchar(1024) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quiz_sitting`
--

INSERT INTO `quiz_sitting` (`id`, `question_order`, `question_list`, `incorrect_questions`, `current_score`, `complete`, `user_answers`, `start`, `end`, `course_id`, `quiz_id`, `user_id`, `correct_questions`) VALUES
(187, '114,', '114,', '', 1, 1, '{\"114\": \"191\"}', '2024-10-07 20:25:42.288289', '2024-10-07 20:25:45.877790', 21, 59, 25, ''),
(188, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-07 20:26:28.460759', '2024-10-08 11:15:32.554363', 21, 59, 25, '114'),
(189, '107,', '107,', '107', 0, 1, '{\"107\": \"177\"}', '2024-10-07 20:26:36.219907', '2024-10-07 20:26:38.690761', 21, 56, 25, ''),
(190, '107,', '107,', '', 2, 1, '{\"107\": \"178\"}', '2024-10-07 20:26:54.303237', '2024-10-07 20:26:57.815419', 21, 56, 25, '107'),
(192, '101,102,103,104,', '104,102,103,104,', '103', 6, 1, '{\"101\": \"165\", \"102\": \"167\", \"103\": \"170\", \"104\": \"171\"}', '2024-10-07 20:30:20.282537', '2024-10-07 20:30:27.230269', 21, 53, 25, '101,102,104'),
(193, '101,102,103,104,', '104,102,103,104,', '102,103', 4, 1, '{\"101\": \"165\", \"102\": \"168\", \"103\": \"170\", \"104\": \"171\"}', '2024-10-08 11:04:46.210782', '2024-10-08 11:04:55.137651', 21, 53, 25, '101,104'),
(195, '105,', '105,', '', 2, 1, '{\"105\": \"173\"}', '2024-10-08 11:18:31.379888', '2024-10-08 11:18:34.529120', 21, 54, 25, '105'),
(196, '105,', '105,', '', 2, 1, '{\"105\": \"173\"}', '2024-10-08 11:18:45.790518', '2024-10-08 11:20:22.892678', 21, 54, 25, '105'),
(198, '106,', '106,', '', 2, 1, '{\"106\": \"175\"}', '2024-10-08 11:29:55.582072', '2024-10-08 11:29:58.888021', 21, 55, 25, '106'),
(199, '108,109,110,111,112,113,', '113,109,110,111,112,113,', '109,112', 8, 1, '{\"108\": \"179\", \"109\": \"182\", \"110\": \"183\", \"111\": \"185\", \"112\": \"188\", \"113\": \"189\"}', '2024-10-08 14:42:26.134424', '2024-10-08 14:42:43.792319', 21, 58, 1, '108,110,111,113'),
(200, '115,116,117,', '117,116,117,', '116', 4, 1, '{\"115\": \"193\", \"116\": \"196\", \"117\": \"197\"}', '2024-10-08 15:29:57.980301', '2024-10-08 15:30:07.862875', 26, 60, 1, '115,117'),
(201, '118,', '118,', '', 2, 1, '{\"118\": \"199\"}', '2024-10-08 16:13:20.492323', '2024-10-08 16:13:23.463284', 31, 64, 1, '118'),
(202, '108,109,110,111,112,113,', '113,109,110,111,112,113,', '109,111', 8, 1, '{\"108\": \"179\", \"109\": \"182\", \"110\": \"183\", \"111\": \"186\", \"112\": \"187\", \"113\": \"189\"}', '2024-10-08 19:16:14.060097', '2024-10-08 21:58:19.185903', 21, 58, 25, '108,110,112,113'),
(203, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-08 21:28:53.817721', '2024-10-09 00:59:41.839775', 21, 59, 1, '114'),
(205, '106,', '106,', '', 2, 1, '{\"106\": \"175\"}', '2024-10-09 00:10:50.625282', '2024-10-09 12:46:13.500245', 21, 55, 1, '106'),
(206, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 01:04:37.000073', '2024-10-09 01:04:37.113810', 21, 59, 1, '114'),
(207, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 01:04:55.306643', '2024-10-09 01:06:44.397724', 21, 59, 1, '114'),
(208, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 01:09:39.486310', '2024-10-09 01:09:39.539583', 21, 59, 1, '114'),
(209, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 01:09:50.642077', '2024-10-09 10:58:30.449748', 21, 59, 1, '114'),
(210, '101,102,103,104,', '104,102,103,104,', '102', 6, 1, '{\"101\": \"165\", \"102\": \"168\", \"103\": \"169\", \"104\": \"171\"}', '2024-10-09 01:10:10.840939', '2024-10-09 01:10:29.256557', 21, 53, 1, '101,103,104'),
(211, '101,102,103,104,', '104,102,103,104,', '102,103', 4, 1, '{\"101\": \"165\", \"102\": \"168\", \"104\": \"171\", \"103\": \"170\"}', '2024-10-09 01:13:11.732293', '2024-10-09 01:13:23.877968', 21, 53, 1, '101,104'),
(212, '101,102,103,104,', '104,102,103,104,', '102,104', 4, 1, '{\"101\": \"165\", \"102\": \"168\", \"103\": \"169\", \"104\": \"172\"}', '2024-10-09 01:14:55.352716', '2024-10-09 01:15:08.763126', 21, 53, 1, '101,103'),
(213, '114,', '114,', '114', 0, 1, '{\"114\": \"192\"}', '2024-10-09 10:59:04.009475', '2024-10-09 11:14:33.295251', 21, 59, 1, ''),
(214, '107,', '107,', '107', 0, 1, '{\"107\": \"177\"}', '2024-10-09 10:59:10.124597', '2024-10-09 11:13:34.473282', 21, 56, 1, ''),
(216, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 11:14:54.923880', '2024-10-09 11:17:03.378856', 21, 59, 1, '114'),
(217, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 11:17:15.574335', '2024-10-09 11:18:53.570185', 21, 59, 1, '114'),
(218, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 11:19:05.539752', '2024-10-09 11:20:15.921856', 21, 59, 1, '114'),
(221, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 11:20:27.638804', '2024-10-09 11:24:22.273352', 21, 59, 1, '114'),
(222, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 11:24:32.784933', '2024-10-09 11:33:53.019056', 21, 59, 1, '114'),
(223, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 11:34:03.782682', '2024-10-09 11:35:10.433946', 21, 59, 1, '114'),
(224, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 11:35:32.704319', '2024-10-09 11:37:50.024972', 21, 59, 1, '114'),
(225, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 11:38:10.125591', '2024-10-09 11:45:42.809180', 21, 59, 1, '114'),
(226, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 11:45:57.588633', '2024-10-09 11:57:49.415396', 21, 59, 1, '114'),
(227, '114,', '114,', '', 2, 1, '{\"114\": \"191\"}', '2024-10-09 11:58:01.572051', '2024-10-09 12:18:57.111785', 21, 59, 1, '114'),
(228, '114,', '114,', '114', 0, 1, '{\"114\": \"192\"}', '2024-10-09 12:19:11.443762', '2024-10-09 12:20:50.005325', 21, 59, 1, ''),
(229, '114,', '114,', '114', 0, 1, '{\"114\": \"192\"}', '2024-10-09 12:21:02.617242', '2024-10-09 12:22:20.216697', 21, 59, 1, ''),
(230, '114,', '114,', '114', 0, 1, '{\"114\": \"192\"}', '2024-10-09 12:23:20.550543', '2024-10-09 12:23:26.367374', 21, 59, 1, ''),
(231, '114,', '114,', '114', 0, 1, '{\"114\": \"192\"}', '2024-10-09 12:23:39.803125', '2024-10-09 12:23:39.837489', 21, 59, 1, ''),
(234, '119,120,', '120,120,', '120', 2, 1, '{\"119\": \"201\", \"120\": \"204\"}', '2024-10-09 14:19:39.818563', '2024-10-09 16:15:37.609982', 21, 65, 1, '119'),
(237, '119,120,', '120,120,', '119', 2, 1, '{\"119\": \"202\", \"120\": \"203\"}', '2024-10-09 16:15:38.941733', '2024-10-09 16:43:54.870054', 21, 65, 1, '120'),
(238, '122,123,124,125,126,127,128,129,', '129,123,124,125,126,127,128,129,', '123,125,127,129', 8, 1, '{\"122\": \"207\", \"123\": \"210\", \"124\": \"211\", \"125\": \"214\", \"126\": \"215\", \"127\": \"217\", \"128\": \"219\", \"129\": \"222\"}', '2024-10-09 16:20:09.152360', '2024-10-09 16:27:56.741086', 21, 67, 1, '122,124,126,128'),
(239, '101,102,103,104,', '104,102,103,104,', '', 8, 1, '{\"101\": \"165\", \"102\": \"167\", \"103\": \"169\", \"104\": \"171\"}', '2024-10-09 16:28:05.229646', '2024-10-09 17:07:42.111841', 21, 53, 1, '101,102,103,104'),
(240, '130,131,132,', '132,131,132,', '132', 4, 1, '{\"130\": \"223\", \"131\": \"225\", \"132\": \"228\"}', '2024-10-09 16:29:39.772179', '2024-10-09 16:30:39.384006', 21, 68, 1, '130,131'),
(241, '130,131,132,', '132,131,132,', '', 6, 1, '{\"130\": \"223\", \"131\": \"225\", \"132\": \"227\"}', '2024-10-09 16:30:44.855831', '2024-10-09 16:45:02.954071', 21, 68, 1, '130,131,132'),
(242, '108,109,110,111,112,113,', '113,109,110,111,112,113,', '', 12, 1, '{\"108\": \"179\", \"109\": \"181\", \"110\": \"183\", \"111\": \"185\", \"112\": \"187\", \"113\": \"189\"}', '2024-10-09 16:36:58.278387', '2024-10-09 16:48:08.602731', 21, 58, 1, '108,109,110,111,112,113'),
(243, '119,120,', '120,120,', '', 2, 0, '{\"119\": \"201\"}', '2024-10-09 16:44:09.502588', NULL, 21, 65, 1, '119'),
(244, '130,131,132,', '132,131,132,', '', 6, 1, '{\"130\": \"223\", \"131\": \"225\", \"132\": \"227\"}', '2024-10-09 16:45:14.085501', '2024-10-09 16:54:58.870776', 21, 68, 1, '130,131,132'),
(245, '108,109,110,111,112,113,', '113,109,110,111,112,113,', '', 12, 1, '{\"108\": \"179\", \"109\": \"181\", \"110\": \"183\", \"111\": \"185\", \"112\": \"187\", \"113\": \"189\"}', '2024-10-09 16:48:18.409148', '2024-10-10 01:56:15.494215', 21, 58, 1, '108,109,110,111,112,113'),
(246, '130,131,132,', '132,131,132,', '', 6, 1, '{\"130\": \"223\", \"131\": \"225\", \"132\": \"227\"}', '2024-10-09 16:55:07.590537', '2024-10-09 16:55:32.241354', 21, 68, 1, '130,131,132'),
(247, '130,131,132,', '132,131,132,', '', 6, 1, '{\"130\": \"223\", \"131\": \"225\", \"132\": \"227\"}', '2024-10-09 16:56:58.997322', '2024-10-10 01:38:33.472892', 21, 68, 1, '130,131,132'),
(248, '101,102,103,104,', '104,102,103,104,', '', 8, 1, '{\"101\": \"165\", \"103\": \"169\", \"104\": \"171\", \"102\": \"167\"}', '2024-10-09 17:07:57.774258', '2024-10-10 03:11:01.247849', 21, 53, 1, '101,103,104,102'),
(251, '108,109,110,111,112,113,', '113,109,110,111,112,113,', '', 12, 1, '{\"108\": \"179\", \"109\": \"181\", \"110\": \"183\", \"111\": \"185\", \"112\": \"187\", \"113\": \"189\"}', '2024-10-10 01:56:21.137395', '2024-10-10 02:00:06.487656', 21, 58, 1, '108,109,110,111,112,113'),
(252, '108,109,110,111,112,113,', '113,109,110,111,112,113,', '111,113', 8, 1, '{\"108\": \"179\", \"109\": \"181\", \"110\": \"183\", \"111\": \"186\", \"112\": \"187\", \"113\": \"190\"}', '2024-10-10 02:00:15.524821', '2024-10-10 02:01:54.576633', 21, 58, 1, '108,109,110,112'),
(255, '122,123,124,125,126,127,128,129,', '129,123,124,125,126,127,128,129,', '129,123,127', 10, 1, '{\"122\": \"207\", \"128\": \"219\", \"129\": \"222\", \"123\": \"210\", \"124\": \"211\", \"126\": \"215\", \"127\": \"217\", \"125\": \"213\"}', '2024-10-10 03:17:26.547707', '2024-10-10 03:46:50.859302', 21, 67, 1, '122,128,124,126,125'),
(256, '122,123,124,125,126,127,128,129,', '129,123,124,125,126,127,128,129,', '127', 14, 1, '{\"122\": \"207\", \"123\": \"209\", \"124\": \"211\", \"125\": \"213\", \"126\": \"215\", \"127\": \"217\", \"128\": \"219\", \"129\": \"221\"}', '2024-10-10 03:47:11.961074', '2024-10-10 03:55:47.063480', 21, 67, 1, '122,123,124,125,126,128,129'),
(257, '122,123,124,125,126,127,128,129,', '124,123,124,125,126,127,128,129,', '', 4, 0, '{\"122\": \"207\", \"123\": \"209\"}', '2024-10-10 12:07:09.151508', NULL, 21, 67, 1, '122,123'),
(258, '115,116,117,', '115,116,117,', '', 0, 0, '{}', '2024-10-10 15:47:41.503014', NULL, 26, 60, 25, ''),
(259, '130,131,132,', '132,131,132,', '132', 4, 1, '{\"130\": \"223\", \"132\": \"228\", \"131\": \"225\"}', '2024-10-11 17:43:13.333710', '2024-10-11 17:43:43.073019', 21, 68, 25, '130,131'),
(260, '130,131,132,', '132,131,132,', '131', 4, 1, '{\"130\": \"223\", \"132\": \"227\", \"131\": \"226\"}', '2024-10-11 17:45:32.095524', '2024-10-13 18:47:01.025274', 21, 68, 25, '130,132'),
(261, '122,123,124,125,126,127,128,129,', '129,123,124,125,126,127,128,129,', '123,129', 12, 1, '{\"122\": \"207\", \"123\": \"210\", \"124\": \"211\", \"125\": \"213\", \"126\": \"215\", \"127\": \"218\", \"128\": \"219\", \"129\": \"222\"}', '2024-10-11 18:04:16.578652', '2024-10-13 20:18:08.387878', 21, 67, 25, '122,124,125,126,127,128'),
(262, '130,131,132,', '130,131,132,', '', 0, 0, '{}', '2024-10-11 18:29:19.831461', NULL, 21, 68, 1, ''),
(263, '121,', '121,', '', 0, 0, '{}', '2024-10-11 18:42:59.618894', NULL, 21, 66, 1, ''),
(264, '108,109,110,111,112,113,', '108,109,110,111,112,113,', '', 0, 0, '{}', '2024-10-12 14:51:54.771607', NULL, 21, 58, 25, ''),
(265, '121,', '121,', '', 0, 0, '{}', '2024-10-13 15:15:07.193262', NULL, 21, 66, 25, ''),
(266, '130,131,132,', '132,131,132,', '131,132', 2, 1, '{\"130\": \"223\", \"131\": \"226\", \"132\": \"228\"}', '2024-10-13 18:47:05.307661', '2024-10-13 20:19:30.469828', 21, 68, 25, '130'),
(267, '122,123,124,125,126,127,128,129,', '129,123,124,125,126,127,128,129,', '124,125,126,127', 8, 1, '{\"122\": \"207\", \"123\": \"209\", \"124\": \"212\", \"125\": \"214\", \"126\": \"216\", \"127\": \"217\", \"128\": \"219\", \"129\": \"221\"}', '2024-10-13 20:18:28.531648', '2024-10-13 20:18:45.220758', 21, 67, 25, '122,123,128,129'),
(268, '122,123,124,125,126,127,128,129,', '122,123,124,125,126,127,128,129,', '', 0, 0, '{}', '2024-10-13 20:19:19.734156', NULL, 21, 67, 25, ''),
(269, '130,131,132,', '132,131,132,', '130,131', 2, 1, '{\"130\": \"224\", \"131\": \"226\", \"132\": \"227\"}', '2024-10-13 20:20:47.989397', '2024-10-13 20:20:58.407257', 21, 68, 25, '132'),
(270, '130,131,132,', '132,131,132,', '', 6, 1, '{\"130\": \"223\", \"131\": \"225\", \"132\": \"227\"}', '2024-10-13 20:22:01.031091', '2024-10-13 20:22:10.154747', 21, 68, 25, '130,131,132');

-- --------------------------------------------------------

--
-- Table structure for table `result_result`
--

CREATE TABLE `result_result` (
  `id` bigint(20) NOT NULL,
  `gpa` double DEFAULT NULL,
  `cgpa` double DEFAULT NULL,
  `semester` varchar(100) NOT NULL,
  `session` varchar(100) DEFAULT NULL,
  `level` varchar(25) DEFAULT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `result_takencourse`
--

CREATE TABLE `result_takencourse` (
  `id` bigint(20) NOT NULL,
  `assignment` decimal(5,2) NOT NULL,
  `mid_exam` decimal(5,2) NOT NULL,
  `quiz` decimal(5,2) NOT NULL,
  `attendance` decimal(5,2) NOT NULL,
  `final_exam` decimal(5,2) NOT NULL,
  `total` decimal(5,2) NOT NULL,
  `grade` varchar(2) NOT NULL,
  `point` decimal(5,2) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `result_takencourse`
--

INSERT INTO `result_takencourse` (`id`, `assignment`, `mid_exam`, `quiz`, `attendance`, `final_exam`, `total`, `grade`, `point`, `comment`, `course_id`, `student_id`) VALUES
(1, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 26, 21),
(2, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '', 0.00, '', 21, 21);

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_usersocialauth`
--

CREATE TABLE `social_auth_usersocialauth` (
  `id` bigint(20) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '{}' CHECK (json_valid(`extra_data`)),
  `created` datetime DEFAULT current_timestamp(),
  `modified` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `social_auth_usersocialauth`
--

INSERT INTO `social_auth_usersocialauth` (`id`, `provider`, `uid`, `extra_data`, `created`, `modified`, `user_id`) VALUES
(8, 'google-oauth2', 'moussabe.karouali1234@gmail.com', '{\"auth_time\": 1728682445, \"expires\": 3599, \"token_type\": \"Bearer\", \"access_token\": \"ya29.a0AcM612yHSjisHjclSYlO8mbxSAAp88X__s7pAhBDCUSAarKd-ZYJmKixGUi220oQ51BuG6XlfB10ssFiBMsL0lIIxWjqxqhjN_rb15IbOslNeVQM7V6yMr2QFPRFZSLQbyClVYSSQb0u0NFkZkZVfGizvQamRclXAHIAulYmaCgYKAfQSARISFQHGX2MimJ8TD8dftarqgPoJOr_Z5A0175\"}', '2024-10-11 21:34:05', '2024-10-11 21:34:05', 35),
(9, 'google-oauth2', 'businessoutlaw007@gmail.com', '{\"auth_time\": 1728821806, \"expires\": 3599, \"token_type\": \"Bearer\", \"access_token\": \"ya29.a0AcM612z8ZVvCR8B0CvzYSBTfHFg73-gJeZosAZl8jm9sAijkENUUj535UV2v7H9bNB2YDOcxwAPKDCsyzhnS2-Wd9S8RPDDIHZIaGZ8YL-AFKS3mk8JOEm9NkYMbjSU25DNnqwTJGG56ILWgtonL860emWpVcoIsbVCFWxB9aCgYKAYUSARASFQHGX2MiXMVdZv-aYyhAo4rEHwOn6w0175\"}', '2024-10-12 14:38:43', '2024-10-13 12:16:46', 38),
(10, 'google-oauth2', 'rochdi.el1234@gmail.com', '{\"auth_time\": 1728821344, \"expires\": 3599, \"token_type\": \"Bearer\", \"access_token\": \"ya29.a0AcM612zE1_QHcUCbJyiOJLQ2MBz33SJSeE5wzjpGMHVo5rNQ72Pn_kyPWW9Euy_ig2HjvrYnp6guoaqSwoj00Qa2o4lE9vwweftKiP96FY7kH5IbRKLuDaQxfpnirIFBD6bQ71KFwQNiwLUY_M6vo_TrJeeHFDe3cJdbCumxaCgYKAVgSARASFQHGX2MicEnWdNXRQRy_UOCXFoq2DA0175\"}', '2024-10-13 12:09:04', '2024-10-13 12:09:04', 41);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_departmenthead`
--
ALTER TABLE `accounts_departmenthead`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `accounts_departmenth_department_id_35df83b0_fk_course_pr` (`department_id`);

--
-- Indexes for table `accounts_parent`
--
ALTER TABLE `accounts_parent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- Indexes for table `accounts_student`
--
ALTER TABLE `accounts_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD KEY `accounts_student_program_id_cbc959aa_fk_course_program_id` (`program_id`);

--
-- Indexes for table `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  ADD KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  ADD KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`);

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
-- Indexes for table `core_activitylog`
--
ALTER TABLE `core_activitylog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_newsandevents`
--
ALTER TABLE `core_newsandevents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_semester`
--
ALTER TABLE `core_semester`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_semester_session_id_5eb6ae4a_fk_core_session_id` (`session_id`);

--
-- Indexes for table `core_session`
--
ALTER TABLE `core_session`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session` (`session`);

--
-- Indexes for table `course_course`
--
ALTER TABLE `course_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `course_course_program_id_dda9b2de_fk_course_program_id` (`program_id`);

--
-- Indexes for table `course_courseallocation`
--
ALTER TABLE `course_courseallocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_courseallocation_lecturer_id_ae68368a_fk_accounts_user_id` (`lecturer_id`),
  ADD KEY `course_courseallocation_session_id_3101be0e_fk_core_session_id` (`session_id`);

--
-- Indexes for table `course_courseallocation_courses`
--
ALTER TABLE `course_courseallocation_courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_courseallocation__courseallocation_id_cour_fc6e91fc_uniq` (`courseallocation_id`,`course_id`),
  ADD KEY `course_courseallocat_course_id_74f75d98_fk_course_co` (`course_id`);

--
-- Indexes for table `course_courseoffer`
--
ALTER TABLE `course_courseoffer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_courseoffer_dep_head_id_e54ea754_fk_accounts_` (`dep_head_id`);

--
-- Indexes for table `course_program`
--
ALTER TABLE `course_program`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `title_en` (`title_en`),
  ADD UNIQUE KEY `title_ru` (`title_ru`),
  ADD UNIQUE KEY `title_es` (`title_es`),
  ADD UNIQUE KEY `title_fr` (`title_fr`);

--
-- Indexes for table `course_subcourse`
--
ALTER TABLE `course_subcourse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `course_upload`
--
ALTER TABLE `course_upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_upload_course_id_624ff4d6_fk_course_course_id` (`course_id`);

--
-- Indexes for table `course_uploadvideo`
--
ALTER TABLE `course_uploadvideo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `course_uploadvideo_course_id_0725e558_fk_course_course_id` (`course_id`);

--
-- Indexes for table `dashboard_userdashboardmodule`
--
ALTER TABLE `dashboard_userdashboardmodule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_userdashboardmodule_user_id_97c13132` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`);

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
-- Indexes for table `jet_bookmark`
--
ALTER TABLE `jet_bookmark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jet_bookmark_user_id_8efdc332_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `jet_pinnedapplication`
--
ALTER TABLE `jet_pinnedapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jet_pinnedapplication_user_id_7765bcf9_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `payments_activeabonnement`
--
ALTER TABLE `payments_activeabonnement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_activeabonnement_user` (`user_id`),
  ADD KEY `fk_activeabonnement_program` (`program_id`);

--
-- Indexes for table `payments_facture`
--
ALTER TABLE `payments_facture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_facture_program` (`program_id`),
  ADD KEY `fk_facture_user` (`user_id`);

--
-- Indexes for table `payments_invoice`
--
ALTER TABLE `payments_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_invoice_user_id_2f564088_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `payments_pospayment`
--
ALTER TABLE `payments_pospayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pospayment_program` (`program_id`),
  ADD KEY `fk_pospayment_user` (`user_id`);

--
-- Indexes for table `payments_salespointfacture`
--
ALTER TABLE `payments_salespointfacture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_salespointfacture_program` (`program_id`),
  ADD KEY `fk_salespointfacture_user` (`user_id`);

--
-- Indexes for table `quiz_choice`
--
ALTER TABLE `quiz_choice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_choice_question_id_6297ad3f_fk_quiz_mcqu` (`question_id`);

--
-- Indexes for table `quiz_comment`
--
ALTER TABLE `quiz_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `quiz_essayquestion`
--
ALTER TABLE `quiz_essayquestion`
  ADD PRIMARY KEY (`question_ptr_id`);

--
-- Indexes for table `quiz_mcquestion`
--
ALTER TABLE `quiz_mcquestion`
  ADD PRIMARY KEY (`question_ptr_id`);

--
-- Indexes for table `quiz_note`
--
ALTER TABLE `quiz_note`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `quiz_id` (`quiz_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `quiz_progress`
--
ALTER TABLE `quiz_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `quiz_question`
--
ALTER TABLE `quiz_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_question_quiz`
--
ALTER TABLE `quiz_question_quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quiz_question_quiz_question_id_quiz_id_3414207a_uniq` (`question_id`,`quiz_id`),
  ADD KEY `quiz_question_quiz_quiz_id_eccb418d_fk_quiz_quiz_id` (`quiz_id`);

--
-- Indexes for table `quiz_quiz`
--
ALTER TABLE `quiz_quiz`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `quiz_quiz_course_id_dd25aae3_fk_course_course_id` (`course_id`),
  ADD KEY `fk_subcourse` (`subcourse_id`);

--
-- Indexes for table `quiz_sitting`
--
ALTER TABLE `quiz_sitting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quiz_sitting_course_id_72b033f6_fk_course_course_id` (`course_id`),
  ADD KEY `quiz_sitting_quiz_id_a3187627_fk_quiz_quiz_id` (`quiz_id`),
  ADD KEY `quiz_sitting_user_id_cfb694f3_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `result_result`
--
ALTER TABLE `result_result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `result_result_student_id_59df1edd_fk_accounts_student_id` (`student_id`);

--
-- Indexes for table `result_takencourse`
--
ALTER TABLE `result_takencourse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `result_takencourse_course_id_56fd5eb6_fk_course_course_id` (`course_id`),
  ADD KEY `result_takencourse_student_id_c971277a_fk_accounts_student_id` (`student_id`);

--
-- Indexes for table `social_auth_usersocialauth`
--
ALTER TABLE `social_auth_usersocialauth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_social_auth` (`user_id`,`provider`,`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_departmenthead`
--
ALTER TABLE `accounts_departmenthead`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_parent`
--
ALTER TABLE `accounts_parent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_student`
--
ALTER TABLE `accounts_student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `core_activitylog`
--
ALTER TABLE `core_activitylog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `core_newsandevents`
--
ALTER TABLE `core_newsandevents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_semester`
--
ALTER TABLE `core_semester`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `core_session`
--
ALTER TABLE `core_session`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_course`
--
ALTER TABLE `course_course`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_courseallocation`
--
ALTER TABLE `course_courseallocation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_courseallocation_courses`
--
ALTER TABLE `course_courseallocation_courses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_courseoffer`
--
ALTER TABLE `course_courseoffer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_program`
--
ALTER TABLE `course_program`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `course_subcourse`
--
ALTER TABLE `course_subcourse`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `course_upload`
--
ALTER TABLE `course_upload`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_uploadvideo`
--
ALTER TABLE `course_uploadvideo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dashboard_userdashboardmodule`
--
ALTER TABLE `dashboard_userdashboardmodule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `jet_bookmark`
--
ALTER TABLE `jet_bookmark`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jet_pinnedapplication`
--
ALTER TABLE `jet_pinnedapplication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments_activeabonnement`
--
ALTER TABLE `payments_activeabonnement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments_facture`
--
ALTER TABLE `payments_facture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payments_invoice`
--
ALTER TABLE `payments_invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments_pospayment`
--
ALTER TABLE `payments_pospayment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments_salespointfacture`
--
ALTER TABLE `payments_salespointfacture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `quiz_choice`
--
ALTER TABLE `quiz_choice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `quiz_comment`
--
ALTER TABLE `quiz_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `quiz_note`
--
ALTER TABLE `quiz_note`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `quiz_progress`
--
ALTER TABLE `quiz_progress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `quiz_question`
--
ALTER TABLE `quiz_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `quiz_question_quiz`
--
ALTER TABLE `quiz_question_quiz`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `quiz_quiz`
--
ALTER TABLE `quiz_quiz`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `quiz_sitting`
--
ALTER TABLE `quiz_sitting`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `result_result`
--
ALTER TABLE `result_result`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result_takencourse`
--
ALTER TABLE `result_takencourse`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `social_auth_usersocialauth`
--
ALTER TABLE `social_auth_usersocialauth`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_departmenthead`
--
ALTER TABLE `accounts_departmenthead`
  ADD CONSTRAINT `accounts_departmenth_department_id_35df83b0_fk_course_pr` FOREIGN KEY (`department_id`) REFERENCES `course_program` (`id`),
  ADD CONSTRAINT `accounts_departmenthead_user_id_62937520_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_parent`
--
ALTER TABLE `accounts_parent`
  ADD CONSTRAINT `accounts_parent_student_id_554fb6f9_fk_accounts_student_id` FOREIGN KEY (`student_id`) REFERENCES `accounts_student` (`id`),
  ADD CONSTRAINT `accounts_parent_user_id_23ea51f7_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_student`
--
ALTER TABLE `accounts_student`
  ADD CONSTRAINT `accounts_student_program_id_cbc959aa_fk_course_program_id` FOREIGN KEY (`program_id`) REFERENCES `course_program` (`id`),
  ADD CONSTRAINT `accounts_student_student_id_d0d56f60_fk_accounts_user_id` FOREIGN KEY (`student_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

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
-- Constraints for table `core_semester`
--
ALTER TABLE `core_semester`
  ADD CONSTRAINT `core_semester_session_id_5eb6ae4a_fk_core_session_id` FOREIGN KEY (`session_id`) REFERENCES `core_session` (`id`);

--
-- Constraints for table `course_course`
--
ALTER TABLE `course_course`
  ADD CONSTRAINT `course_course_program_id_dda9b2de_fk_course_program_id` FOREIGN KEY (`program_id`) REFERENCES `course_program` (`id`);

--
-- Constraints for table `course_courseallocation`
--
ALTER TABLE `course_courseallocation`
  ADD CONSTRAINT `course_courseallocation_lecturer_id_ae68368a_fk_accounts_user_id` FOREIGN KEY (`lecturer_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `course_courseallocation_session_id_3101be0e_fk_core_session_id` FOREIGN KEY (`session_id`) REFERENCES `core_session` (`id`);

--
-- Constraints for table `course_courseallocation_courses`
--
ALTER TABLE `course_courseallocation_courses`
  ADD CONSTRAINT `course_courseallocat_course_id_74f75d98_fk_course_co` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`),
  ADD CONSTRAINT `course_courseallocat_courseallocation_id_e203c2aa_fk_course_co` FOREIGN KEY (`courseallocation_id`) REFERENCES `course_courseallocation` (`id`);

--
-- Constraints for table `course_courseoffer`
--
ALTER TABLE `course_courseoffer`
  ADD CONSTRAINT `course_courseoffer_dep_head_id_e54ea754_fk_accounts_` FOREIGN KEY (`dep_head_id`) REFERENCES `accounts_departmenthead` (`id`);

--
-- Constraints for table `course_subcourse`
--
ALTER TABLE `course_subcourse`
  ADD CONSTRAINT `course_subcourse_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_upload`
--
ALTER TABLE `course_upload`
  ADD CONSTRAINT `course_upload_course_id_624ff4d6_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`);

--
-- Constraints for table `course_uploadvideo`
--
ALTER TABLE `course_uploadvideo`
  ADD CONSTRAINT `course_uploadvideo_course_id_0725e558_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`);

--
-- Constraints for table `dashboard_userdashboardmodule`
--
ALTER TABLE `dashboard_userdashboardmodule`
  ADD CONSTRAINT `dashboard_userdashbo_user_id_97c13132_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `jet_bookmark`
--
ALTER TABLE `jet_bookmark`
  ADD CONSTRAINT `jet_bookmark_user_id_8efdc332_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `jet_pinnedapplication`
--
ALTER TABLE `jet_pinnedapplication`
  ADD CONSTRAINT `jet_pinnedapplication_user_id_7765bcf9_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `payments_activeabonnement`
--
ALTER TABLE `payments_activeabonnement`
  ADD CONSTRAINT `fk_activeabonnement_program` FOREIGN KEY (`program_id`) REFERENCES `course_program` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_activeabonnement_user` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments_facture`
--
ALTER TABLE `payments_facture`
  ADD CONSTRAINT `fk_facture_program` FOREIGN KEY (`program_id`) REFERENCES `course_program` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_facture_user` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments_invoice`
--
ALTER TABLE `payments_invoice`
  ADD CONSTRAINT `payments_invoice_user_id_2f564088_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `payments_pospayment`
--
ALTER TABLE `payments_pospayment`
  ADD CONSTRAINT `fk_pospayment_program` FOREIGN KEY (`program_id`) REFERENCES `course_program` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pospayment_user` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments_salespointfacture`
--
ALTER TABLE `payments_salespointfacture`
  ADD CONSTRAINT `fk_salespointfacture_program` FOREIGN KEY (`program_id`) REFERENCES `course_program` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_salespointfacture_user` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_choice`
--
ALTER TABLE `quiz_choice`
  ADD CONSTRAINT `quiz_choice_question_id_6297ad3f_fk_quiz_mcqu` FOREIGN KEY (`question_id`) REFERENCES `quiz_mcquestion` (`question_ptr_id`);

--
-- Constraints for table `quiz_comment`
--
ALTER TABLE `quiz_comment`
  ADD CONSTRAINT `quiz_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_comment_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_essayquestion`
--
ALTER TABLE `quiz_essayquestion`
  ADD CONSTRAINT `quiz_essayquestion_question_ptr_id_11ba056e_fk_quiz_question_id` FOREIGN KEY (`question_ptr_id`) REFERENCES `quiz_question` (`id`);

--
-- Constraints for table `quiz_mcquestion`
--
ALTER TABLE `quiz_mcquestion`
  ADD CONSTRAINT `quiz_mcquestion_question_ptr_id_7b24b73b_fk_quiz_question_id` FOREIGN KEY (`question_ptr_id`) REFERENCES `quiz_question` (`id`);

--
-- Constraints for table `quiz_note`
--
ALTER TABLE `quiz_note`
  ADD CONSTRAINT `fk_question` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_quiz` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quiz_progress`
--
ALTER TABLE `quiz_progress`
  ADD CONSTRAINT `quiz_progress_user_id_af390dea_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `quiz_question_quiz`
--
ALTER TABLE `quiz_question_quiz`
  ADD CONSTRAINT `quiz_question_quiz_question_id_2b2637b3_fk_quiz_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_question` (`id`),
  ADD CONSTRAINT `quiz_question_quiz_quiz_id_eccb418d_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`);

--
-- Constraints for table `quiz_quiz`
--
ALTER TABLE `quiz_quiz`
  ADD CONSTRAINT `fk_subcourse` FOREIGN KEY (`subcourse_id`) REFERENCES `course_subcourse` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quiz_quiz_course_id_dd25aae3_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`);

--
-- Constraints for table `quiz_sitting`
--
ALTER TABLE `quiz_sitting`
  ADD CONSTRAINT `quiz_sitting_course_id_72b033f6_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`),
  ADD CONSTRAINT `quiz_sitting_quiz_id_a3187627_fk_quiz_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quiz_quiz` (`id`),
  ADD CONSTRAINT `quiz_sitting_user_id_cfb694f3_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `result_result`
--
ALTER TABLE `result_result`
  ADD CONSTRAINT `result_result_student_id_59df1edd_fk_accounts_student_id` FOREIGN KEY (`student_id`) REFERENCES `accounts_student` (`id`);

--
-- Constraints for table `result_takencourse`
--
ALTER TABLE `result_takencourse`
  ADD CONSTRAINT `result_takencourse_course_id_56fd5eb6_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`),
  ADD CONSTRAINT `result_takencourse_student_id_c971277a_fk_accounts_student_id` FOREIGN KEY (`student_id`) REFERENCES `accounts_student` (`id`);

--
-- Constraints for table `social_auth_usersocialauth`
--
ALTER TABLE `social_auth_usersocialauth`
  ADD CONSTRAINT `fk_user_social_auth` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
