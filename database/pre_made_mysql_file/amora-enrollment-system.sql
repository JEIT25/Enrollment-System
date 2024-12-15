-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2024 at 11:56 AM
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
-- Database: `amora-enrollment-system`
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
-- Table structure for table `class_schedules`
--

CREATE TABLE `class_schedules` (
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `instructor_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday') NOT NULL,
  `max_students` bigint(20) UNSIGNED NOT NULL,
  `semester` enum('First','Second','Summer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_schedules`
--

INSERT INTO `class_schedules` (`schedule_id`, `subject_id`, `instructor_id`, `room_id`, `start_time`, `end_time`, `day_of_week`, `max_students`, `semester`) VALUES
(67, 4, 2, 2, '11:00:00', '11:30:00', 'Monday', 50, 'First'),
(68, 7, 3, 6, '09:00:00', '16:30:00', 'Monday', 25, 'First'),
(69, 3, 1, 2, '07:00:00', '07:30:00', 'Monday', 50, 'First'),
(70, 3, 3, 2, '14:00:00', '14:30:00', 'Monday', 50, 'First'),
(74, 5, 1, 3, '07:00:00', '07:30:00', 'Monday', 25, 'First'),
(77, 80, 71, 25, '07:00:00', '09:30:00', 'Monday', 25, 'First'),
(78, 81, 4, 25, '10:00:00', '12:00:00', 'Monday', 25, 'First'),
(79, 76, 9, 25, '15:00:00', '16:00:00', 'Monday', 25, 'First');

-- --------------------------------------------------------

--
-- Table structure for table `class_schedule_logs`
--

CREATE TABLE `class_schedule_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `performed_by` varchar(255) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `instructor_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday') NOT NULL,
  `max_students` bigint(20) UNSIGNED NOT NULL,
  `semester` enum('First','Second','Summer') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_schedule_logs`
--

INSERT INTO `class_schedule_logs` (`log_id`, `performed_by`, `action`, `subject_id`, `instructor_id`, `room_id`, `start_time`, `end_time`, `day_of_week`, `max_students`, `semester`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'INSERT', 11, 1, 11, '18:25:02', '05:48:51', 'Wednesday', 50, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(2, 'Admin', 'INSERT', 12, 2, 12, '05:13:34', '03:21:47', 'Friday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(3, 'Admin', 'INSERT', 13, 3, 13, '12:48:01', '21:28:21', 'Thursday', 25, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(4, 'Admin', 'INSERT', 14, 4, 14, '02:53:56', '03:26:31', 'Monday', 25, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(5, 'Admin', 'INSERT', 15, 5, 15, '22:34:28', '09:37:00', 'Monday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(6, 'Admin', 'INSERT', 16, 6, 16, '17:29:47', '13:45:47', 'Friday', 25, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(7, 'Admin', 'INSERT', 17, 7, 17, '07:27:48', '15:52:09', 'Friday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(8, 'Admin', 'INSERT', 18, 8, 18, '14:52:01', '06:37:39', 'Monday', 25, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(9, 'Admin', 'INSERT', 19, 9, 19, '19:06:30', '13:14:32', 'Wednesday', 50, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(10, 'Admin', 'INSERT', 20, 10, 20, '18:53:24', '01:38:39', 'Tuesday', 25, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(11, 'Admin', 'INSERT', 21, 11, 21, '18:35:47', '16:13:40', 'Friday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(12, 'Admin', 'INSERT', 22, 12, 22, '20:01:00', '17:06:47', 'Friday', 50, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(13, 'Admin', 'INSERT', 23, 13, 23, '06:35:19', '15:42:49', 'Monday', 50, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(14, 'Admin', 'INSERT', 24, 14, 24, '20:02:08', '09:26:25', 'Wednesday', 25, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(15, 'Admin', 'INSERT', 25, 15, 25, '16:04:09', '22:26:22', 'Monday', 25, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(16, 'Admin', 'INSERT', 26, 16, 26, '08:58:44', '19:31:19', 'Thursday', 50, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(17, 'Admin', 'INSERT', 27, 17, 27, '07:30:38', '22:40:36', 'Monday', 50, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(18, 'Admin', 'INSERT', 28, 18, 28, '06:16:48', '06:56:03', 'Tuesday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(19, 'Admin', 'INSERT', 29, 19, 29, '08:31:20', '01:06:42', 'Wednesday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(20, 'Admin', 'INSERT', 30, 20, 30, '04:32:10', '11:52:19', 'Friday', 25, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(21, 'Admin', 'INSERT', 31, 21, 31, '12:03:18', '18:00:38', 'Monday', 25, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(22, 'Admin', 'INSERT', 32, 22, 32, '08:16:10', '03:43:16', 'Tuesday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(23, 'Admin', 'INSERT', 33, 23, 33, '00:31:40', '01:05:35', 'Tuesday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(24, 'Admin', 'INSERT', 34, 24, 34, '06:50:47', '03:34:01', 'Tuesday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(25, 'Admin', 'INSERT', 35, 25, 35, '15:19:11', '23:47:44', 'Friday', 50, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(26, 'Admin', 'INSERT', 36, 26, 36, '19:38:59', '19:25:06', 'Friday', 50, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(27, 'Admin', 'INSERT', 37, 27, 37, '03:33:04', '01:41:33', 'Tuesday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(28, 'Admin', 'INSERT', 38, 28, 38, '22:56:30', '12:16:43', 'Wednesday', 25, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(29, 'Admin', 'INSERT', 39, 29, 39, '00:47:18', '06:24:57', 'Monday', 50, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(30, 'Admin', 'INSERT', 40, 30, 40, '17:05:29', '13:54:45', 'Tuesday', 50, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(31, 'Admin', 'INSERT', 41, 31, 41, '22:41:34', '09:23:45', 'Monday', 50, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(32, 'Admin', 'INSERT', 42, 32, 42, '09:23:28', '11:01:32', 'Tuesday', 50, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(33, 'Admin', 'INSERT', 43, 33, 43, '15:39:49', '19:30:37', 'Monday', 25, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(34, 'Admin', 'INSERT', 44, 34, 44, '04:48:51', '07:37:33', 'Monday', 25, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(35, 'Admin', 'INSERT', 45, 35, 45, '07:28:11', '23:59:45', 'Wednesday', 25, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(36, 'Admin', 'INSERT', 46, 36, 46, '07:03:23', '04:40:55', 'Monday', 25, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(37, 'Admin', 'INSERT', 47, 37, 47, '23:29:40', '13:02:59', 'Wednesday', 25, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(38, 'Admin', 'INSERT', 48, 38, 48, '21:50:44', '20:57:34', 'Friday', 25, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(39, 'Admin', 'INSERT', 49, 39, 49, '02:08:33', '04:29:17', 'Friday', 25, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(40, 'Admin', 'INSERT', 50, 40, 50, '03:14:52', '08:15:29', 'Wednesday', 25, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(41, 'Admin', 'INSERT', 51, 41, 51, '10:45:34', '09:39:44', 'Friday', 25, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(42, 'Admin', 'INSERT', 52, 42, 52, '17:42:54', '03:01:47', 'Tuesday', 25, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(43, 'Admin', 'INSERT', 53, 43, 53, '10:34:40', '21:08:16', 'Monday', 25, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(44, 'Admin', 'INSERT', 54, 44, 54, '07:28:17', '08:07:32', 'Tuesday', 50, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(45, 'Admin', 'INSERT', 55, 45, 55, '06:18:01', '14:06:49', 'Friday', 50, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(46, 'Admin', 'INSERT', 56, 46, 56, '16:51:46', '14:18:14', 'Tuesday', 50, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(47, 'Admin', 'INSERT', 57, 47, 57, '23:30:03', '17:28:12', 'Wednesday', 25, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(48, 'Admin', 'INSERT', 58, 48, 58, '22:31:42', '08:43:53', 'Monday', 25, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(49, 'Admin', 'INSERT', 59, 49, 59, '05:32:40', '05:11:30', 'Wednesday', 50, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(50, 'Admin', 'INSERT', 60, 50, 60, '07:41:55', '16:45:29', 'Tuesday', 50, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(51, 'Admin', 'INSERT', 61, 51, 61, '00:30:29', '05:53:37', 'Monday', 25, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(52, 'Admin', 'INSERT', 62, 52, 62, '07:52:55', '02:32:18', 'Wednesday', 25, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(53, 'Admin', 'INSERT', 63, 53, 63, '14:31:03', '18:36:07', 'Wednesday', 25, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(54, 'Admin', 'INSERT', 64, 54, 64, '07:20:40', '19:26:03', 'Thursday', 25, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(55, 'Admin', 'INSERT', 65, 55, 65, '12:53:07', '20:00:24', 'Friday', 50, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(56, 'Admin', 'INSERT', 66, 56, 66, '04:44:43', '03:08:19', 'Monday', 50, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(57, 'Admin', 'INSERT', 67, 57, 67, '22:46:08', '19:22:50', 'Thursday', 50, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(58, 'Admin', 'INSERT', 68, 58, 68, '07:32:03', '10:55:16', 'Monday', 50, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(59, 'Admin', 'INSERT', 69, 59, 69, '01:14:39', '05:54:41', 'Wednesday', 25, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(60, 'Admin', 'INSERT', 70, 60, 70, '12:05:24', '09:05:24', 'Friday', 50, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(61, 'Admin', 'INSERT', 5, 7, 4, '08:00:00', '10:00:00', 'Monday', 50, 'Second', '2024-12-05 16:33:01', '2024-12-05 16:33:01'),
(62, 'Admin', 'INSERT', 6, 1, 1, '08:00:00', '10:00:00', 'Monday', 80, 'Second', '2024-12-05 16:34:32', '2024-12-05 16:34:32'),
(63, 'Admin', 'INSERT', 3, 3, 2, '07:30:00', '10:30:00', 'Friday', 123, 'Second', '2024-12-05 22:10:34', '2024-12-05 22:10:34'),
(64, 'Admin', 'INSERT', 2, 3, 2, '09:00:00', '09:30:00', 'Monday', 50, 'First', '2024-12-07 18:24:57', '2024-12-07 18:24:57'),
(65, 'Admin', 'INSERT', 1, 2, 2, '10:00:00', '10:30:00', 'Monday', 50, 'First', '2024-12-07 18:48:35', '2024-12-07 18:48:35'),
(66, 'Admin', 'INSERT', 4, 3, 5, '09:00:00', '09:30:00', 'Monday', 50, 'First', '2024-12-07 18:49:59', '2024-12-07 18:49:59'),
(67, 'Admin', 'INSERT', 4, 2, 2, '11:00:00', '11:30:00', 'Monday', 50, 'First', '2024-12-07 21:26:11', '2024-12-07 21:26:11'),
(68, 'Admin', 'INSERT', 7, 3, 6, '09:00:00', '16:30:00', 'Monday', 25, 'First', '2024-12-07 21:27:33', '2024-12-07 21:27:33'),
(69, 'Admin', 'INSERT', 3, 1, 2, '07:00:00', '07:30:00', 'Monday', 50, 'First', '2024-12-07 22:25:16', '2024-12-07 22:25:16'),
(70, 'Admin', 'INSERT', 3, 3, 2, '14:00:00', '14:30:00', 'Monday', 50, 'First', '2024-12-07 22:25:24', '2024-12-07 22:25:24'),
(71, 'Admin', 'INSERT', 1, 1, 2, '12:30:00', '13:00:00', 'Wednesday', 50, 'First', '2024-12-08 00:16:34', '2024-12-08 00:16:34'),
(72, 'Admin', 'INSERT', 3, 66, 1, '07:00:00', '07:30:00', 'Monday', 50, 'First', '2024-12-09 21:33:33', '2024-12-09 21:33:33'),
(73, 'Admin', 'INSERT', 2, 1, 1, '07:00:00', '12:00:00', 'Monday', 50, 'First', '2024-12-11 23:51:58', '2024-12-11 23:51:58'),
(74, 'Joseph Vistal', 'INSERT', 5, 1, 3, '07:00:00', '07:30:00', 'Monday', 25, 'First', '2024-12-14 22:03:14', '2024-12-14 22:03:14'),
(75, 'Joseph Vistal', 'INSERT', 4, 1, 1, '07:00:00', '07:30:00', 'Monday', 50, 'First', '2024-12-14 22:04:39', '2024-12-14 22:04:39'),
(76, 'Joseph Vistal', 'INSERT', 3, 1, 4, '07:00:00', '07:30:00', 'Monday', 25, 'First', '2024-12-14 22:25:32', '2024-12-14 22:25:32'),
(77, 'Joseph Vistal', 'DELETE', 4, 1, 1, '07:00:00', '07:30:00', 'Monday', 50, 'First', '2024-12-14 22:31:25', '2024-12-14 22:31:25'),
(78, 'Joseph Vistal', 'INSERT', 80, 71, 25, '07:00:00', '09:30:00', 'Monday', 25, 'First', '2024-12-15 02:24:10', '2024-12-15 02:24:10'),
(79, 'Joseph Vistal', 'INSERT', 81, 4, 25, '10:00:00', '12:00:00', 'Monday', 25, 'First', '2024-12-15 02:24:46', '2024-12-15 02:24:46'),
(80, 'Joseph Vistal', 'INSERT', 76, 9, 25, '15:00:00', '16:00:00', 'Monday', 25, 'First', '2024-12-15 02:25:21', '2024-12-15 02:25:21');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `department_name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(2, 'College Of Business And Accountancy'),
(1, 'College Of Engineering And Information Technology'),
(4, 'College Of Industrial Technology And Teacher Education'),
(3, 'College Of Tourism And Hospitality Management');

-- --------------------------------------------------------

--
-- Table structure for table `department_logs`
--

CREATE TABLE `department_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `performed_by` varchar(255) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `department_name` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `department_logs`
--

INSERT INTO `department_logs` (`log_id`, `performed_by`, `action`, `department_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'INSERT', 'College Of Engineering And Information Technology', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(2, 'Admin', 'INSERT', 'College Of Business And Accountancy', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(3, 'Admin', 'INSERT', 'College Of Tourism And Hospitality Management', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(4, 'Admin', 'INSERT', 'College Of Industrial Technology And Teacher Education', '2024-11-12 15:15:42', '2024-11-12 15:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `date_enrolled` date NOT NULL,
  `grade` decimal(4,2) DEFAULT NULL,
  `status` enum('Enrolled','Completed','Dropped','Waitlisted') NOT NULL DEFAULT 'Enrolled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `student_id`, `schedule_id`, `date_enrolled`, `grade`, `status`) VALUES
(51, 1, 66, '2024-12-08', NULL, 'Enrolled'),
(52, 8, 67, '2024-12-08', NULL, 'Enrolled'),
(53, 6, 64, '2024-12-08', NULL, 'Enrolled'),
(58, 3, 64, '2024-12-08', NULL, 'Enrolled'),
(61, 2, 68, '2024-12-08', NULL, 'Enrolled'),
(66, 2, 71, '2024-12-08', NULL, 'Enrolled'),
(69, 5, 64, '2024-12-12', NULL, 'Enrolled'),
(70, 10, 67, '2024-12-15', NULL, 'Enrolled'),
(71, 4, 67, '2024-12-15', NULL, 'Enrolled'),
(72, 4, 69, '2024-12-15', NULL, 'Enrolled'),
(73, 4, 70, '2024-12-15', NULL, 'Enrolled'),
(74, 9, 67, '2024-12-15', NULL, 'Enrolled'),
(75, 5, 67, '2024-12-15', NULL, 'Enrolled'),
(76, 6, 67, '2024-12-15', NULL, 'Enrolled'),
(77, 3, 70, '2024-12-15', NULL, 'Enrolled'),
(78, 3, 67, '2024-12-15', NULL, 'Enrolled'),
(79, 3, 74, '2024-12-15', NULL, 'Enrolled');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_logs`
--

CREATE TABLE `enrollment_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `performed_by` varchar(255) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id` bigint(20) UNSIGNED NOT NULL,
  `date_enrolled` date NOT NULL,
  `grade` decimal(4,2) DEFAULT NULL,
  `status` enum('Enrolled','Completed','Dropped','Waitlisted') NOT NULL DEFAULT 'Enrolled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `enrollment_logs`
--

INSERT INTO `enrollment_logs` (`log_id`, `performed_by`, `action`, `student_id`, `schedule_id`, `date_enrolled`, `grade`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'INSERT', 51, 11, '2024-06-06', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(2, 'Admin', 'INSERT', 52, 12, '2023-01-22', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(3, 'Admin', 'INSERT', 53, 13, '2024-01-11', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(4, 'Admin', 'INSERT', 54, 14, '2023-12-17', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(5, 'Admin', 'INSERT', 55, 15, '2023-09-12', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(6, 'Admin', 'INSERT', 56, 16, '2024-01-11', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(7, 'Admin', 'INSERT', 57, 17, '2024-01-23', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(8, 'Admin', 'INSERT', 58, 18, '2022-07-30', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(9, 'Admin', 'INSERT', 59, 19, '2024-08-10', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(10, 'Admin', 'INSERT', 60, 20, '2023-09-05', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(11, 'Admin', 'INSERT', 61, 21, '2024-10-30', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(12, 'Admin', 'INSERT', 62, 22, '2023-01-29', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(13, 'Admin', 'INSERT', 63, 23, '2022-01-26', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(14, 'Admin', 'INSERT', 64, 24, '2024-03-28', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(15, 'Admin', 'INSERT', 65, 25, '2022-12-31', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(16, 'Admin', 'INSERT', 66, 26, '2022-02-26', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(17, 'Admin', 'INSERT', 67, 27, '2022-12-05', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(18, 'Admin', 'INSERT', 68, 28, '2024-11-06', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(19, 'Admin', 'INSERT', 69, 29, '2022-04-17', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(20, 'Admin', 'INSERT', 70, 30, '2022-07-11', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(21, 'Admin', 'INSERT', 71, 31, '2023-04-16', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(22, 'Admin', 'INSERT', 72, 32, '2023-11-12', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(23, 'Admin', 'INSERT', 73, 33, '2022-08-27', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(24, 'Admin', 'INSERT', 74, 34, '2024-04-08', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(25, 'Admin', 'INSERT', 75, 35, '2023-05-25', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(26, 'Admin', 'INSERT', 76, 36, '2024-09-22', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(27, 'Admin', 'INSERT', 77, 37, '2023-06-01', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(28, 'Admin', 'INSERT', 78, 38, '2023-11-07', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(29, 'Admin', 'INSERT', 79, 39, '2022-02-15', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(30, 'Admin', 'INSERT', 80, 40, '2022-08-09', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(31, 'Admin', 'INSERT', 81, 41, '2024-02-27', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(32, 'Admin', 'INSERT', 82, 42, '2023-06-04', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(33, 'Admin', 'INSERT', 83, 43, '2022-05-12', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(34, 'Admin', 'INSERT', 84, 44, '2024-06-28', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(35, 'Admin', 'INSERT', 85, 45, '2024-02-20', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(36, 'Admin', 'INSERT', 86, 46, '2021-12-07', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(37, 'Admin', 'INSERT', 87, 47, '2024-08-17', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(38, 'Admin', 'INSERT', 88, 48, '2022-10-07', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(39, 'Admin', 'INSERT', 89, 49, '2022-07-20', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(40, 'Admin', 'INSERT', 90, 50, '2023-05-07', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(41, 'Admin', 'INSERT', 91, 51, '2022-12-07', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(42, 'Admin', 'INSERT', 92, 52, '2022-10-03', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(43, 'Admin', 'INSERT', 93, 53, '2022-07-26', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(44, 'Admin', 'INSERT', 94, 54, '2022-06-12', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(45, 'Admin', 'INSERT', 95, 55, '2024-10-25', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(46, 'Admin', 'INSERT', 96, 56, '2022-12-28', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(47, 'Admin', 'INSERT', 97, 57, '2023-02-11', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(48, 'Admin', 'INSERT', 98, 58, '2023-10-05', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(49, 'Admin', 'INSERT', 99, 59, '2022-09-29', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(50, 'Admin', 'INSERT', 100, 60, '2024-04-06', 0.00, 'Enrolled', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(51, 'Joseph Vistal', 'INSERT', 4, 70, '2024-12-15', NULL, 'Enrolled', '2024-12-14 23:38:03', '2024-12-14 23:38:03'),
(52, 'Joseph Vistal', 'INSERT', 9, 67, '2024-12-15', 0.00, 'Enrolled', '2024-12-14 23:38:43', '2024-12-14 23:38:43'),
(53, 'Joseph Vistal', 'INSERT', 5, 67, '2024-12-15', 0.00, 'Enrolled', '2024-12-14 23:39:33', '2024-12-14 23:39:33'),
(54, 'Joseph Vistal', 'INSERT', 6, 67, '2024-12-15', 0.00, 'Enrolled', '2024-12-14 23:42:07', '2024-12-14 23:42:07'),
(55, 'Joseph Vistal', 'INSERT', 3, 70, '2024-12-15', 0.00, 'Enrolled', '2024-12-14 23:42:28', '2024-12-14 23:42:28'),
(56, 'Joseph Vistal', 'INSERT', 3, 67, '2024-12-15', 0.00, 'Enrolled', '2024-12-14 23:42:28', '2024-12-14 23:42:28'),
(57, 'Joseph Vistal', 'INSERT', 3, 74, '2024-12-15', 0.00, 'Enrolled', '2024-12-14 23:43:06', '2024-12-14 23:43:06');

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
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `instructor_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `availability_hours` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`availability_hours`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructor_id`, `first_name`, `last_name`, `department_id`, `email`, `availability_hours`) VALUES
(1, 'Ronaldo', 'Rosenbaum', 3, 'ronaldo.rosenbaum@csucc.edu.ph', '{\"Monday\":[\"07:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(2, 'Ellis', 'Corkery', 1, 'ellis.corkery@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(3, 'Cassandre', 'Jaskolski', 3, 'cassandre.jaskolski@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(4, 'Robbie', 'Ullrich', 2, 'robbie.ullrich@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(5, 'Dianna', 'Muller', 1, 'dianna.muller@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(6, 'Margarett', 'Schumm', 2, 'margarett.schumm@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(7, 'Houston', 'Schuster', 3, 'houston.schuster@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(8, 'Ezequiel', 'Hagenes', 1, 'ezequiel.hagenes@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(9, 'Queen', 'Conroy', 1, 'queen.conroy@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(10, 'Kayley', 'Will', 3, 'kayley.will@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(11, 'Leopoldo', 'Denesik', 2, 'leopoldo.denesik@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(12, 'June', 'Parker', 1, 'june.parker@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(13, 'Rubye', 'Fadel', 3, 'rubye.fadel@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(14, 'Kory', 'Hamill', 3, 'kory.hamill@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(15, 'Dianna', 'Pagac', 3, 'dianna.pagac@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(16, 'Glenda', 'Hagenes', 4, 'glenda.hagenes@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(17, 'Barbara', 'Shields', 2, 'barbara.shields@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(18, 'Annetta', 'Senger', 2, 'annetta.senger@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(19, 'Madelyn', 'Hackett', 1, 'madelyn.hackett@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(20, 'Donnell', 'Harris', 3, 'donnell.harris@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(21, 'Eldora', 'Nitzsche', 3, 'eldora.nitzsche@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(22, 'Rowan', 'Mayert', 4, 'rowan.mayert@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(23, 'Myah', 'Gleichner', 3, 'myah.gleichner@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(24, 'Narciso', 'Schiller', 1, 'narciso.schiller@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(25, 'Yasmeen', 'Murphy', 4, 'yasmeen.murphy@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(26, 'Marlee', 'Kohler', 3, 'marlee.kohler@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(27, 'Myrna', 'Mante', 4, 'myrna.mante@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(28, 'Elena', 'Walsh', 2, 'elena.walsh@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(29, 'Aileen', 'Turcotte', 2, 'aileen.turcotte@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(30, 'Nikki', 'Hammes', 1, 'nikki.hammes@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(31, 'Mya', 'Rosenbaum', 4, 'mya.rosenbaum@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(32, 'Cale', 'Ebert', 2, 'cale.ebert@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(33, 'Tre', 'Brekke', 2, 'tre.brekke@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(34, 'Joy', 'Christiansen', 2, 'joy.christiansen@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(35, 'Susana', 'Oberbrunner', 2, 'susana.oberbrunner@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(36, 'Roselyn', 'Nienow', 3, 'roselyn.nienow@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(37, 'Yvette', 'Legros', 4, 'yvette.legros@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(38, 'Spencer', 'Dicki', 1, 'spencer.dicki@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(39, 'Kyla', 'Robel', 2, 'kyla.robel@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(40, 'Jaida', 'Quitzon', 3, 'jaida.quitzon@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(42, 'Joy', 'Hayes', 3, 'joy.hayes@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(43, 'Cletus', 'Champlin', 1, 'cletus.champlin@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(44, 'Katherine', 'Donnelly', 3, 'katherine.donnelly@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(45, 'Adella', 'Haley', 4, 'adella.haley@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(46, 'Amie', 'Pfannerstill', 4, 'amie.pfannerstill@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(47, 'Elton', 'Hodkiewicz', 2, 'elton.hodkiewicz@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(48, 'Clifford', 'Schroeder', 1, 'clifford.schroeder@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(49, 'Paris', 'Lindgren', 2, 'paris.lindgren@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(50, 'Kelton', 'Ebert', 4, 'kelton.ebert@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(51, 'Noemie', 'Okuneva', 1, 'noemie.okuneva@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(52, 'Lauryn', 'Swaniawski', 3, 'lauryn.swaniawski@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(53, 'Donnie', 'Hermann', 4, 'donnie.hermann@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(54, 'Gay', 'Batz', 4, 'gay.batz@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(55, 'Macie', 'Stroman', 4, 'macie.stroman@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(56, 'Keon', 'Russel', 4, 'keon.russel@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(57, 'Margarete', 'Beer', 1, 'margarete.beer@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(58, 'Hyman', 'O\'Conner', 2, 'hyman.o\'conner@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(59, 'Leo', 'Keebler', 2, 'leo.keebler@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(60, 'Nina', 'Dickens', 2, 'nina.dickens@csucc.edu.ph', '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}'),
(66, 'cxc', 'xcxc', 1, 'asd@gmail.com', '{\"Monday\":[\"07:00-09:00\"]}'),
(71, 'Ryan', 'Cuarez', 1, 'ryan.cuarez@csucc.edu.ph', '{\"Monday\":[\"07:00-19:30\"],\"Tuesday\":[\"07:00-19:30\"],\"Wednesday\":[\"07:00-19:30\"],\"Thursday\":[\"07:00-19:30\"],\"Friday\":[\"07:00-19:30\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_logs`
--

CREATE TABLE `instructor_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `performed_by` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `availability_hours` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`availability_hours`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instructor_logs`
--

INSERT INTO `instructor_logs` (`log_id`, `performed_by`, `action`, `first_name`, `last_name`, `email`, `department_id`, `availability_hours`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'INSERT', 'Ronaldo', 'Rosenbaum', 'ronaldo.rosenbaum@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(2, 'Admin', 'INSERT', 'Ellis', 'Corkery', 'ellis.corkery@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(3, 'Admin', 'INSERT', 'Cassandre', 'Jaskolski', 'cassandre.jaskolski@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(4, 'Admin', 'INSERT', 'Robbie', 'Ullrich', 'robbie.ullrich@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(5, 'Admin', 'INSERT', 'Dianna', 'Muller', 'dianna.muller@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(6, 'Admin', 'INSERT', 'Margarett', 'Schumm', 'margarett.schumm@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(7, 'Admin', 'INSERT', 'Houston', 'Schuster', 'houston.schuster@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(8, 'Admin', 'INSERT', 'Ezequiel', 'Hagenes', 'ezequiel.hagenes@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(9, 'Admin', 'INSERT', 'Queen', 'Conroy', 'queen.conroy@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(10, 'Admin', 'INSERT', 'Kayley', 'Will', 'kayley.will@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(11, 'Admin', 'INSERT', 'Leopoldo', 'Denesik', 'leopoldo.denesik@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(12, 'Admin', 'INSERT', 'June', 'Parker', 'june.parker@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(13, 'Admin', 'INSERT', 'Rubye', 'Fadel', 'rubye.fadel@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(14, 'Admin', 'INSERT', 'Kory', 'Hamill', 'kory.hamill@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(15, 'Admin', 'INSERT', 'Dianna', 'Pagac', 'dianna.pagac@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(16, 'Admin', 'INSERT', 'Glenda', 'Hagenes', 'glenda.hagenes@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(17, 'Admin', 'INSERT', 'Barbara', 'Shields', 'barbara.shields@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(18, 'Admin', 'INSERT', 'Annetta', 'Senger', 'annetta.senger@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(19, 'Admin', 'INSERT', 'Madelyn', 'Hackett', 'madelyn.hackett@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(20, 'Admin', 'INSERT', 'Donnell', 'Harris', 'donnell.harris@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(21, 'Admin', 'INSERT', 'Eldora', 'Nitzsche', 'eldora.nitzsche@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(22, 'Admin', 'INSERT', 'Rowan', 'Mayert', 'rowan.mayert@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(23, 'Admin', 'INSERT', 'Myah', 'Gleichner', 'myah.gleichner@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(24, 'Admin', 'INSERT', 'Narciso', 'Schiller', 'narciso.schiller@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(25, 'Admin', 'INSERT', 'Yasmeen', 'Murphy', 'yasmeen.murphy@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(26, 'Admin', 'INSERT', 'Marlee', 'Kohler', 'marlee.kohler@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(27, 'Admin', 'INSERT', 'Myrna', 'Mante', 'myrna.mante@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(28, 'Admin', 'INSERT', 'Elena', 'Walsh', 'elena.walsh@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(29, 'Admin', 'INSERT', 'Aileen', 'Turcotte', 'aileen.turcotte@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(30, 'Admin', 'INSERT', 'Nikki', 'Hammes', 'nikki.hammes@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(31, 'Admin', 'INSERT', 'Mya', 'Rosenbaum', 'mya.rosenbaum@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(32, 'Admin', 'INSERT', 'Cale', 'Ebert', 'cale.ebert@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(33, 'Admin', 'INSERT', 'Tre', 'Brekke', 'tre.brekke@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(34, 'Admin', 'INSERT', 'Joy', 'Christiansen', 'joy.christiansen@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(35, 'Admin', 'INSERT', 'Susana', 'Oberbrunner', 'susana.oberbrunner@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(36, 'Admin', 'INSERT', 'Roselyn', 'Nienow', 'roselyn.nienow@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(37, 'Admin', 'INSERT', 'Yvette', 'Legros', 'yvette.legros@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(38, 'Admin', 'INSERT', 'Spencer', 'Dicki', 'spencer.dicki@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(39, 'Admin', 'INSERT', 'Kyla', 'Robel', 'kyla.robel@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(40, 'Admin', 'INSERT', 'Jaida', 'Quitzon', 'jaida.quitzon@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(41, 'Admin', 'INSERT', 'Asia', 'Stark', 'asia.stark@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(42, 'Admin', 'INSERT', 'Joy', 'Hayes', 'joy.hayes@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(43, 'Admin', 'INSERT', 'Cletus', 'Champlin', 'cletus.champlin@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(44, 'Admin', 'INSERT', 'Katherine', 'Donnelly', 'katherine.donnelly@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(45, 'Admin', 'INSERT', 'Adella', 'Haley', 'adella.haley@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(46, 'Admin', 'INSERT', 'Amie', 'Pfannerstill', 'amie.pfannerstill@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(47, 'Admin', 'INSERT', 'Elton', 'Hodkiewicz', 'elton.hodkiewicz@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(48, 'Admin', 'INSERT', 'Clifford', 'Schroeder', 'clifford.schroeder@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(49, 'Admin', 'INSERT', 'Paris', 'Lindgren', 'paris.lindgren@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(50, 'Admin', 'INSERT', 'Kelton', 'Ebert', 'kelton.ebert@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(51, 'Admin', 'INSERT', 'Noemie', 'Okuneva', 'noemie.okuneva@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(52, 'Admin', 'INSERT', 'Lauryn', 'Swaniawski', 'lauryn.swaniawski@csucc.edu.ph', 3, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(53, 'Admin', 'INSERT', 'Donnie', 'Hermann', 'donnie.hermann@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(54, 'Admin', 'INSERT', 'Gay', 'Batz', 'gay.batz@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(55, 'Admin', 'INSERT', 'Macie', 'Stroman', 'macie.stroman@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(56, 'Admin', 'INSERT', 'Keon', 'Russel', 'keon.russel@csucc.edu.ph', 4, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(57, 'Admin', 'INSERT', 'Margarete', 'Beer', 'margarete.beer@csucc.edu.ph', 1, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(58, 'Admin', 'INSERT', 'Hyman', 'O\'Conner', 'hyman.o\'conner@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(59, 'Admin', 'INSERT', 'Leo', 'Keebler', 'leo.keebler@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(60, 'Admin', 'INSERT', 'Nina', 'Dickens', 'nina.dickens@csucc.edu.ph', 2, '{\"Monday\":[\"09:00-12:00\",\"14:00-17:00\"],\"Wednesday\":[\"10:00-13:00\"],\"Friday\":[\"09:00-11:00\",\"13:00-15:00\"]}', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(61, 'Admin', 'INSERT', 'Joseph', 'Vistal', 'joseph.vistal@csucc.edu.ph', 1, '\"09:00-13:00\"', '2024-12-08 19:31:12', '2024-12-08 19:31:12'),
(62, 'Admin', 'INSERT', 'cxc', 'xcxc', 'asd@gmail.com', 1, '{\"Monday\":[\"07:00-09:00\"]}', '2024-12-09 21:32:51', '2024-12-09 21:32:51'),
(63, 'Admin', 'INSERT', 'Juanasd', 'asdasd', 'jeroldash.amora@gmail.com', 1, '[]', '2024-12-09 21:34:41', '2024-12-09 21:34:41'),
(64, 'Admin', 'INSERT', 'sd', 'sd', 'asd12@gmail.com', 1, '[]', '2024-12-09 21:36:51', '2024-12-09 21:36:51'),
(65, 'Admin', 'INSERT', 'Don', 'Mac', 'donmac@csucc.edu.ph', 2, '{\"Monday\":[\"07:00-14:30\"],\"Tuesday\":[\"07:00-15:00\"],\"Wednesday\":[\"07:30-15:00\"],\"Thursday\":[\"07:00-15:30\"],\"Friday\":[\"07:00-08:30\"]}', '2024-12-14 21:01:34', '2024-12-14 21:01:34'),
(66, 'Joseph Vistal', 'INSERT', 'Create', 'test', 'testcreate@gmail.com', 1, '{\"Monday\":[\"12:00-15:30\"]}', '2024-12-14 23:45:59', '2024-12-14 23:45:59'),
(67, 'Joseph Vistal', 'DELETE', 'Create', 'test', 'testcreate@gmail.com', 1, '{\"Monday\":[\"12:00-15:30\"]}', '2024-12-14 23:47:36', '2024-12-14 23:47:36'),
(68, 'Joseph Vistal', 'INSERT', 'Ryan', 'Cuarez', 'ryan.cuarez@csucc.edu.ph', 1, '{\"Monday\":[\"07:00-19:30\"],\"Tuesday\":[\"07:00-19:30\"],\"Wednesday\":[\"07:00-19:30\"],\"Thursday\":[\"07:00-19:30\"],\"Friday\":[\"07:00-19:30\"]}', '2024-12-15 02:23:06', '2024-12-15 02:23:06');

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
(4, '2024_11_05_062423_create_students_table', 1),
(5, '2024_11_05_062429_create_rooms_table', 1),
(6, '2024_11_05_062457_create_departments_table', 1),
(7, '2024_11_05_062457_create_instructors_table', 1),
(8, '2024_11_05_062516_create_subjects_table', 1),
(9, '2024_11_05_062529_create_class_schedules_table', 1),
(10, '2024_11_05_063058_create_enrollments_table', 1),
(11, '2024_11_10_040905_create_student_logs_table', 1),
(12, '2024_11_11_130942_create_room_logs_table', 1),
(13, '2024_11_12_000651_create_department_logs_table', 1),
(14, '2024_11_12_001936_create_instructor_logs_table', 1),
(15, '2024_11_12_082152_create_subject_logs_table', 1),
(16, '2024_11_12_114918_create_class_schedule_logs_table', 1),
(17, '2024_11_12_230638_create_enrollment_logs_table', 1);

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
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `room_number` varchar(20) NOT NULL,
  `building_name` varchar(100) NOT NULL,
  `room_capacity` bigint(20) UNSIGNED NOT NULL,
  `room_type` enum('Lecture','Laboratory','Studio','Seminar') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_number`, `building_name`, `room_capacity`, `room_type`) VALUES
(1, '300', 'Acad', 50, 'Lecture'),
(2, '142', 'Acad', 50, 'Lecture'),
(3, '221', 'Comlab', 25, 'Laboratory'),
(4, '211', 'Comlab', 25, 'Laboratory'),
(5, '266', 'Acad', 50, 'Lecture'),
(6, '212', 'Comlab', 25, 'Laboratory'),
(7, '226', 'Acad', 50, 'Lecture'),
(8, '273', 'Acad', 50, 'Lecture'),
(9, '218', 'Comlab', 25, 'Laboratory'),
(10, '224', 'Comlab', 25, 'Laboratory'),
(11, '204', 'Comlab', 25, 'Laboratory'),
(12, '245', 'Comlab', 25, 'Laboratory'),
(13, '260', 'Acad', 50, 'Lecture'),
(14, '305', 'Acad', 50, 'Lecture'),
(15, '219', 'Comlab', 25, 'Laboratory'),
(16, '238', 'Acad', 50, 'Lecture'),
(17, '115', 'Acad', 50, 'Lecture'),
(18, '132', 'Acad', 50, 'Lecture'),
(19, '250', 'Acad', 50, 'Lecture'),
(20, '168', 'Comlab', 25, 'Laboratory'),
(21, '184', 'Acad', 50, 'Lecture'),
(22, '236', 'Comlab', 25, 'Laboratory'),
(23, '303', 'Comlab', 25, 'Laboratory'),
(24, '290', 'Comlab', 25, 'Laboratory'),
(25, '152', 'Comlab', 25, 'Laboratory'),
(26, '167', 'Comlab', 25, 'Laboratory'),
(27, '133', 'Acad', 50, 'Lecture'),
(28, '136', 'Acad', 50, 'Lecture'),
(29, '216', 'Acad', 50, 'Lecture'),
(30, '282', 'Acad', 50, 'Lecture'),
(31, '243', 'Acad', 50, 'Lecture'),
(32, '104', 'Acad', 50, 'Lecture'),
(33, '164', 'Acad', 50, 'Lecture'),
(34, '203', 'Acad', 50, 'Lecture'),
(35, '210', 'Acad', 50, 'Lecture'),
(36, '297', 'Comlab', 25, 'Laboratory'),
(37, '242', 'Acad', 50, 'Lecture'),
(38, '278', 'Comlab', 25, 'Laboratory'),
(39, '110', 'Acad', 50, 'Lecture'),
(40, '249', 'Comlab', 25, 'Laboratory'),
(41, '235', 'Acad', 50, 'Lecture'),
(42, '234', 'Acad', 50, 'Lecture'),
(43, '265', 'Acad', 50, 'Lecture'),
(44, '268', 'Comlab', 25, 'Laboratory'),
(45, '175', 'Comlab', 25, 'Laboratory'),
(46, '276', 'Acad', 50, 'Lecture'),
(47, '227', 'Acad', 50, 'Lecture'),
(48, '280', 'Acad', 50, 'Lecture'),
(49, '106', 'Acad', 50, 'Lecture'),
(50, '257', 'Acad', 50, 'Lecture'),
(51, '201', 'Comlab', 25, 'Laboratory'),
(52, '196', 'Comlab', 25, 'Laboratory'),
(53, '178', 'Comlab', 25, 'Laboratory'),
(54, '108', 'Acad', 50, 'Lecture'),
(55, '284', 'Acad', 50, 'Lecture'),
(56, '165', 'Acad', 50, 'Lecture'),
(57, '129', 'Acad', 50, 'Lecture'),
(58, '101', 'Comlab', 25, 'Laboratory'),
(59, '285', 'Acad', 50, 'Lecture'),
(60, '155', 'Acad', 50, 'Lecture'),
(61, '267', 'Comlab', 25, 'Laboratory'),
(62, '208', 'Acad', 50, 'Lecture'),
(63, '190', 'Comlab', 25, 'Laboratory'),
(64, '188', 'Acad', 50, 'Lecture'),
(65, '147', 'Acad', 50, 'Lecture'),
(66, '244', 'Comlab', 25, 'Laboratory'),
(67, '289', 'Acad', 50, 'Lecture'),
(68, '202', 'Acad', 50, 'Lecture'),
(69, '275', 'Comlab', 25, 'Laboratory'),
(70, '225', 'Comlab', 25, 'Laboratory'),
(71, '134', 'Comlab', 25, 'Laboratory');

-- --------------------------------------------------------

--
-- Table structure for table `room_logs`
--

CREATE TABLE `room_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `performed_by` varchar(255) NOT NULL,
  `room_number` varchar(20) NOT NULL,
  `building_name` varchar(100) NOT NULL,
  `room_capacity` bigint(20) UNSIGNED NOT NULL,
  `room_type` enum('Lecture','Laboratory','Studio','Seminar') NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_logs`
--

INSERT INTO `room_logs` (`log_id`, `performed_by`, `room_number`, `building_name`, `room_capacity`, `room_type`, `action`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '300', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(2, 'Admin', '142', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(3, 'Admin', '221', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(4, 'Admin', '211', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(5, 'Admin', '266', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(6, 'Admin', '212', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(7, 'Admin', '226', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(8, 'Admin', '273', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(9, 'Admin', '218', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(10, 'Admin', '224', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(11, 'Admin', '204', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(12, 'Admin', '245', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(13, 'Admin', '260', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(14, 'Admin', '305', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(15, 'Admin', '219', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(16, 'Admin', '238', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(17, 'Admin', '115', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(18, 'Admin', '132', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(19, 'Admin', '250', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(20, 'Admin', '168', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(21, 'Admin', '184', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(22, 'Admin', '236', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(23, 'Admin', '303', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(24, 'Admin', '290', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(25, 'Admin', '152', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(26, 'Admin', '167', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(27, 'Admin', '133', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(28, 'Admin', '136', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(29, 'Admin', '216', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(30, 'Admin', '282', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(31, 'Admin', '243', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(32, 'Admin', '104', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(33, 'Admin', '164', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(34, 'Admin', '203', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(35, 'Admin', '210', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(36, 'Admin', '297', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(37, 'Admin', '242', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(38, 'Admin', '278', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(39, 'Admin', '110', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(40, 'Admin', '249', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(41, 'Admin', '235', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(42, 'Admin', '234', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(43, 'Admin', '265', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(44, 'Admin', '268', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(45, 'Admin', '175', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(46, 'Admin', '276', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(47, 'Admin', '227', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(48, 'Admin', '280', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(49, 'Admin', '106', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(50, 'Admin', '257', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(51, 'Admin', '201', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(52, 'Admin', '196', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(53, 'Admin', '178', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(54, 'Admin', '108', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(55, 'Admin', '284', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(56, 'Admin', '165', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(57, 'Admin', '129', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(58, 'Admin', '101', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(59, 'Admin', '285', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(60, 'Admin', '155', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(61, 'Admin', '267', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(62, 'Admin', '208', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(63, 'Admin', '190', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(64, 'Admin', '188', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(65, 'Admin', '147', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(66, 'Admin', '244', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(67, 'Admin', '289', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(68, 'Admin', '202', 'Acad', 50, 'Lecture', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(69, 'Admin', '275', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(70, 'Admin', '225', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(71, 'Admin', '134', 'Comlab', 25, 'Laboratory', 'INSERT', '2024-12-14 21:35:49', '2024-12-14 21:35:49');

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
('iVbVMplXq9mb637yhBlkcJHg92fKJRb5HgyMchto', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNldYYnRPckdtbW9OQzV3UldScUdQSVg0TGtyNDFzUXd6WnlrOXVUcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1734260185),
('v1kv5UaU2xXlpjgaLgatCunNtIMXjLOkjX831NqZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUjk2dVBSOVVlcFFmOTI5bkdUOERUb1ZkNVdyOTZZR3dmRXFvMDVXdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jbGFzcy1zY2hlZHVsZXMiO319', 1734254350);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `student_number` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `year_level` bigint(20) UNSIGNED NOT NULL,
  `enrollment_status` enum('Active','Inactive','Graduated') NOT NULL,
  `date_enrolled` date NOT NULL,
  `financial_hold` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `student_number`, `first_name`, `last_name`, `email`, `date_of_birth`, `year_level`, `enrollment_status`, `date_enrolled`, `financial_hold`) VALUES
(3, '2021-5768', 'Allene', 'Rippin', 'allene.rippin@csucc.edu.ph', '2002-04-05', 1, 'Active', '2020-11-09', 0),
(4, '2023-1480', 'Tyreek', 'Purdy', 'tyreek.purdy@csucc.edu.ph', '2005-06-16', 1, 'Active', '2019-05-19', 0),
(5, '2021-1096', 'Pierce', 'West', 'pierce.west@csucc.edu.ph', '2001-03-08', 1, 'Active', '2019-11-12', 0),
(6, '2020-6613', 'Jared', 'Maggio', 'jared.maggio@csucc.edu.ph', '2001-05-28', 4, 'Active', '2024-01-09', 0),
(7, '2020-6602', 'Joaquin', 'Haley', 'joaquin.haley@csucc.edu.ph', '2001-07-31', 4, 'Active', '2024-01-17', 0),
(8, '2020-8068', 'Mason', 'Koch', 'mason.koch@csucc.edu.ph', '2000-11-30', 3, 'Active', '2024-05-27', 0),
(9, '2020-6377', 'Luciano', 'Kuvalis', 'luciano.kuvalis@csucc.edu.ph', '2005-07-14', 3, 'Active', '2022-06-09', 0),
(10, '2020-3433', 'Jaiden', 'Frami', 'jaiden.frami@csucc.edu.ph', '2000-03-12', 3, 'Active', '2019-01-22', 0),
(11, '2020-7160', 'Claire', 'Heathcote', 'claire.heathcote@csucc.edu.ph', '2003-11-26', 3, 'Active', '2024-03-26', 0),
(13, '2021-4110', 'Patience', 'Feeney', 'patience.feeney@csucc.edu.ph', '2004-11-07', 2, 'Active', '2020-06-23', 0),
(14, '2020-1240', 'Giovanna', 'Beer', 'giovanna.beer@csucc.edu.ph', '2001-08-10', 4, 'Active', '2020-04-16', 0),
(15, '2020-3460', 'Kenna', 'Lebsack', 'kenna.lebsack@csucc.edu.ph', '2002-10-20', 1, 'Active', '2024-09-01', 0),
(16, '2023-2126', 'Natalia', 'Collins', 'natalia.collins@csucc.edu.ph', '2005-11-02', 4, 'Active', '2024-09-21', 0),
(17, '2021-5492', 'Tremaine', 'Heidenreich', 'tremaine.heidenreich@csucc.edu.ph', '2004-09-24', 1, 'Active', '2019-09-10', 0),
(19, '2020-7112', 'Marcelino', 'Jacobs', 'marcelino.jacobs@csucc.edu.ph', '2005-05-25', 1, 'Active', '2020-11-04', 0),
(20, '2021-2542', 'Aisha', 'Kiehn', 'aisha.kiehn@csucc.edu.ph', '2002-01-14', 2, 'Active', '2019-12-26', 0),
(21, '2023-5064', 'Carmen', 'Turcotte', 'carmen.turcotte@csucc.edu.ph', '2000-08-27', 4, 'Active', '2019-01-25', 0),
(23, '2019-9641', 'Duncan', 'Eichmann', 'duncan.eichmann@csucc.edu.ph', '2001-02-25', 3, 'Active', '2022-02-18', 0),
(24, '2023-1840', 'Garfield', 'Hansen', 'garfield.hansen@csucc.edu.ph', '2002-06-14', 4, 'Active', '2021-11-18', 0),
(25, '2021-8367', 'Brennan', 'Batz', 'brennan.batz@csucc.edu.ph', '2004-08-19', 1, 'Active', '2023-06-25', 0),
(26, '2022-2001', 'Eric', 'Mraz', 'eric.mraz@csucc.edu.ph', '2001-12-17', 2, 'Active', '2022-12-27', 0),
(27, '2020-9696', 'Roma', 'Gottlieb', 'roma.gottlieb@csucc.edu.ph', '2002-05-13', 2, 'Active', '2023-01-15', 0),
(28, '2019-2876', 'Delphia', 'Yundt', 'delphia.yundt@csucc.edu.ph', '2001-10-04', 1, 'Active', '2022-05-09', 0),
(29, '2022-7902', 'Brianne', 'Blanda', 'brianne.blanda@csucc.edu.ph', '2000-08-16', 4, 'Active', '2022-05-19', 0),
(30, '2020-3005', 'Jermey', 'Bashirian', 'jermey.bashirian@csucc.edu.ph', '2004-11-01', 4, 'Active', '2020-11-13', 0),
(31, '2020-7454', 'Jerod', 'Lynch', 'jerod.lynch@csucc.edu.ph', '2004-02-16', 3, 'Active', '2023-04-07', 0),
(32, '2020-9593', 'Enrico', 'Moore', 'enrico.moore@csucc.edu.ph', '2005-06-07', 3, 'Active', '2019-09-15', 0),
(33, '2022-6399', 'Grant', 'Upton', 'grant.upton@csucc.edu.ph', '2005-07-14', 2, 'Active', '2020-01-27', 0),
(34, '2021-9062', 'Salma', 'Gerlach', 'salma.gerlach@csucc.edu.ph', '2005-02-17', 1, 'Active', '2022-02-24', 0),
(35, '2019-3845', 'Destinee', 'Cruickshank', 'destinee.cruickshank@csucc.edu.ph', '2004-03-26', 2, 'Active', '2023-05-06', 0),
(36, '2019-4020', 'Ernie', 'Labadie', 'ernie.labadie@csucc.edu.ph', '2002-06-28', 1, 'Active', '2023-10-19', 0),
(37, '2022-2280', 'Lilly', 'Gleichner', 'lilly.gleichner@csucc.edu.ph', '2002-09-05', 2, 'Active', '2019-09-17', 0),
(38, '2020-3053', 'Clifton', 'White', 'clifton.white@csucc.edu.ph', '2004-09-22', 2, 'Active', '2020-04-29', 0),
(39, '2020-3464', 'Gregg', 'Smith', 'gregg.smith@csucc.edu.ph', '2000-12-15', 2, 'Active', '2022-08-18', 0),
(40, '2023-6264', 'Lora', 'Nienow', 'lora.nienow@csucc.edu.ph', '2004-02-06', 4, 'Active', '2019-11-21', 0),
(41, '2020-8708', 'Wyman', 'Terry', 'wyman.terry@csucc.edu.ph', '2002-05-12', 3, 'Active', '2021-05-13', 0),
(42, '2023-8997', 'Darryl', 'Feil', 'darryl.feil@csucc.edu.ph', '2001-06-29', 4, 'Active', '2021-02-13', 0),
(43, '2020-6466', 'Kaley', 'Hoppe', 'kaley.hoppe@csucc.edu.ph', '2001-10-12', 2, 'Active', '2024-10-15', 0),
(44, '2022-3868', 'Merl', 'Homenick', 'merl.homenick@csucc.edu.ph', '2000-12-12', 3, 'Active', '2023-04-30', 0),
(45, '2021-1704', 'Pinkie', 'Block', 'pinkie.block@csucc.edu.ph', '2004-07-08', 2, 'Active', '2021-06-10', 0),
(46, '2023-1853', 'Catharine', 'Cassin', 'catharine.cassin@csucc.edu.ph', '2001-11-01', 2, 'Active', '2022-06-17', 0),
(47, '2022-6973', 'Muriel', 'Hoppe', 'muriel.hoppe@csucc.edu.ph', '2001-04-23', 1, 'Active', '2023-07-11', 0),
(48, '2022-1548', 'Xander', 'Daugherty', 'xander.daugherty@csucc.edu.ph', '2001-06-13', 2, 'Active', '2024-10-04', 0),
(49, '2021-8441', 'Vance', 'Reichel', 'vance.reichel@csucc.edu.ph', '2003-12-20', 3, 'Active', '2023-08-09', 0),
(50, '2021-8523', 'Rosa', 'Cummings', 'rosa.cummings@csucc.edu.ph', '2001-05-01', 4, 'Active', '2021-05-06', 0),
(51, '2023-2136', 'Sandrine', 'Bernier', 'sandrine.bernier@csucc.edu.ph', '2004-04-10', 1, 'Active', '2020-01-25', 0),
(52, '2021-3075', 'Abraham', 'Ferry', 'abraham.ferry@csucc.edu.ph', '2002-05-26', 2, 'Active', '2023-01-07', 0),
(53, '2023-4817', 'Tressa', 'Kunde', 'tressa.kunde@csucc.edu.ph', '2000-06-10', 1, 'Active', '2023-12-12', 0),
(54, '2023-1805', 'Arden', 'Pacocha', 'arden.pacocha@csucc.edu.ph', '2001-07-30', 1, 'Active', '2022-02-04', 0),
(55, '2021-9710', 'Kody', 'Haag', 'kody.haag@csucc.edu.ph', '2000-08-12', 2, 'Active', '2023-03-22', 0),
(56, '2019-4977', 'Clark', 'Lesch', 'clark.lesch@csucc.edu.ph', '2001-06-12', 2, 'Active', '2020-07-22', 0),
(57, '2023-1657', 'Ara', 'Rohan', 'ara.rohan@csucc.edu.ph', '2001-04-20', 2, 'Active', '2024-04-26', 0),
(58, '2020-4101', 'Cassandra', 'Metz', 'cassandra.metz@csucc.edu.ph', '2005-02-17', 3, 'Active', '2019-05-13', 0),
(59, '2023-5293', 'Juwan', 'Schowalter', 'juwan.schowalter@csucc.edu.ph', '2003-02-09', 4, 'Active', '2019-10-09', 0),
(60, '2022-4200', 'Alec', 'Ward', 'alec.ward@csucc.edu.ph', '2003-03-13', 4, 'Active', '2024-04-08', 0),
(61, '2019-4780', 'Chris', 'Hane', 'chris.hane@csucc.edu.ph', '2003-04-30', 1, 'Active', '2024-02-09', 0),
(62, '2021-8600', 'Chesley', 'Dietrich', 'chesley.dietrich@csucc.edu.ph', '2000-04-30', 2, 'Active', '2020-02-26', 0),
(63, '2023-5802', 'Eriberto', 'Halvorson', 'eriberto.halvorson@csucc.edu.ph', '2005-04-02', 4, 'Active', '2023-09-15', 0),
(64, '2023-6174', 'Maximilian', 'Windler', 'maximilian.windler@csucc.edu.ph', '2001-01-17', 1, 'Active', '2023-11-15', 0),
(65, '2019-9074', 'Zachary', 'Feil', 'zachary.feil@csucc.edu.ph', '2004-03-05', 4, 'Active', '2021-10-07', 0),
(66, '2020-1499', 'Adell', 'Mills', 'adell.mills@csucc.edu.ph', '2004-04-16', 4, 'Active', '2024-03-06', 0),
(67, '2020-1938', 'Grady', 'Olson', 'grady.olson@csucc.edu.ph', '2000-12-13', 2, 'Active', '2020-04-20', 0),
(68, '2022-3399', 'Charlie', 'Kunze', 'charlie.kunze@csucc.edu.ph', '2003-02-13', 4, 'Active', '2022-06-17', 0),
(69, '2023-1717', 'Jesus', 'Rolfson', 'jesus.rolfson@csucc.edu.ph', '2001-06-05', 3, 'Active', '2022-07-01', 0),
(70, '2020-1286', 'Myrtle', 'Boyer', 'myrtle.boyer@csucc.edu.ph', '2005-04-17', 1, 'Active', '2024-05-04', 0),
(71, '2020-3698', 'Pearl', 'Sanford', 'pearl.sanford@csucc.edu.ph', '2004-04-24', 2, 'Active', '2024-02-01', 0),
(72, '2023-3752', 'Mireya', 'Koelpin', 'mireya.koelpin@csucc.edu.ph', '2001-12-20', 3, 'Active', '2020-11-30', 0),
(73, '2023-3983', 'Einar', 'Jakubowski', 'einar.jakubowski@csucc.edu.ph', '2001-05-02', 2, 'Active', '2023-12-17', 0),
(74, '2019-8915', 'Destin', 'Paucek', 'destin.paucek@csucc.edu.ph', '2001-05-18', 3, 'Active', '2024-02-28', 0),
(75, '2022-5389', 'Mayra', 'Paucek', 'mayra.paucek@csucc.edu.ph', '2003-11-06', 1, 'Active', '2023-05-29', 0),
(76, '2020-5778', 'Layne', 'Auer', 'layne.auer@csucc.edu.ph', '2004-12-18', 2, 'Active', '2020-12-15', 0),
(77, '2020-3990', 'Unique', 'Herzog', 'unique.herzog@csucc.edu.ph', '2002-11-30', 2, 'Active', '2021-01-12', 0),
(78, '2021-4743', 'Jason', 'Pouros', 'jason.pouros@csucc.edu.ph', '2005-05-30', 1, 'Active', '2024-03-11', 0),
(79, '2019-7865', 'Dewitt', 'Murazik', 'dewitt.murazik@csucc.edu.ph', '2000-05-24', 3, 'Active', '2021-11-26', 0),
(80, '2019-6869', 'Callie', 'Herman', 'callie.herman@csucc.edu.ph', '2004-05-16', 2, 'Active', '2024-07-07', 0),
(81, '2023-1577', 'Garfield', 'Leffler', 'garfield.leffler@csucc.edu.ph', '2001-10-09', 3, 'Active', '2022-12-09', 0),
(82, '2023-5495', 'Wilford', 'Wuckert', 'wilford.wuckert@csucc.edu.ph', '2002-07-20', 3, 'Active', '2023-05-13', 0),
(83, '2020-4949', 'Katherine', 'Barrows', 'katherine.barrows@csucc.edu.ph', '2002-01-02', 4, 'Active', '2024-06-06', 0),
(84, '2019-9911', 'Destany', 'Mertz', 'destany.mertz@csucc.edu.ph', '2003-05-23', 1, 'Active', '2022-08-24', 0),
(85, '2022-4891', 'Jada', 'Adams', 'jada.adams@csucc.edu.ph', '2000-05-04', 1, 'Active', '2024-10-12', 0),
(86, '2021-2053', 'Kade', 'Runolfsson', 'kade.runolfsson@csucc.edu.ph', '2005-01-01', 3, 'Active', '2022-06-08', 0),
(87, '2019-6160', 'Erna', 'Jones', 'erna.jones@csucc.edu.ph', '2005-10-20', 1, 'Active', '2024-02-06', 0),
(88, '2023-3013', 'Rowena', 'Wolff', 'rowena.wolff@csucc.edu.ph', '2004-08-09', 3, 'Active', '2021-01-02', 0),
(89, '2019-4534', 'Marc', 'Kuhlman', 'marc.kuhlman@csucc.edu.ph', '2000-07-30', 3, 'Active', '2021-06-20', 0),
(90, '2021-9402', 'Seth', 'Block', 'seth.block@csucc.edu.ph', '2005-01-25', 4, 'Active', '2019-01-03', 0),
(91, '2020-5400', 'Henri', 'Romaguera', 'henri.romaguera@csucc.edu.ph', '2005-07-22', 1, 'Active', '2019-10-11', 0),
(92, '2019-5623', 'Deshaun', 'Brown', 'deshaun.brown@csucc.edu.ph', '2003-11-26', 3, 'Active', '2024-05-25', 0),
(93, '2019-8672', 'Myrl', 'Beatty', 'myrl.beatty@csucc.edu.ph', '2005-04-14', 2, 'Active', '2024-11-12', 0),
(94, '2021-2225', 'Rebeka', 'Hills', 'rebeka.hills@csucc.edu.ph', '2000-02-03', 1, 'Active', '2023-03-13', 0),
(95, '2023-3744', 'Ramon', 'Koss', 'ramon.koss@csucc.edu.ph', '2005-10-20', 3, 'Active', '2023-08-28', 0),
(96, '2021-1473', 'Lynn', 'Conn', 'lynn.conn@csucc.edu.ph', '2001-08-18', 4, 'Active', '2024-05-03', 0),
(97, '2019-6132', 'Anderson', 'Turner', 'anderson.turner@csucc.edu.ph', '2005-02-14', 1, 'Active', '2022-03-03', 0),
(98, '2021-9388', 'Esmeralda', 'Rodriguez', 'esmeralda.rodriguez@csucc.edu.ph', '2004-05-29', 2, 'Active', '2019-06-19', 0),
(99, '2023-2377', 'Alanis', 'Kertzmann', 'alanis.kertzmann@csucc.edu.ph', '2005-07-25', 3, 'Active', '2021-08-11', 0),
(100, '2019-3445', 'Britney', 'Maggio', 'britney.maggio@csucc.edu.ph', '2003-02-28', 2, 'Active', '2021-03-02', 0),
(103, '2021-8483', 'Idella', 'Gislason', 'idella.gislason@csucc.edu.ph', '2001-09-28', 4, 'Active', '2020-03-22', 0),
(104, '2020-7306', 'Jaydon', 'Waelchi', 'jaydon.waelchi@csucc.edu.ph', '2004-05-02', 4, 'Active', '2021-06-24', 0),
(105, '2019-7989', 'Anabel', 'Upton', 'anabel.upton@csucc.edu.ph', '2001-03-17', 1, 'Active', '2021-03-03', 0),
(106, '2019-2915', 'Cortez', 'Glover', 'cortez.glover@csucc.edu.ph', '2004-03-10', 3, 'Active', '2021-07-29', 0),
(107, '2022-8476', 'Kyla', 'Wilkinson', 'kyla.wilkinson@csucc.edu.ph', '2002-01-04', 2, 'Active', '2021-10-06', 0),
(108, '2023-1487', 'Emery', 'Klein', 'emery.klein@csucc.edu.ph', '2004-11-04', 1, 'Active', '2020-08-01', 0),
(109, '2022-6004', 'Gay', 'Strosin', 'gay.strosin@csucc.edu.ph', '2001-09-02', 2, 'Active', '2024-09-15', 0),
(110, '2023-4959', 'Leonora', 'Kulas', 'leonora.kulas@csucc.edu.ph', '2001-03-26', 2, 'Active', '2024-05-01', 0),
(111, '2021-3023', 'Justyn', 'Donnelly', 'justyn.donnelly@csucc.edu.ph', '2002-12-10', 3, 'Active', '2023-03-12', 0),
(112, '2019-6384', 'Newton', 'Treutel', 'newton.treutel@csucc.edu.ph', '2005-10-14', 4, 'Active', '2023-02-03', 0),
(113, '2021-5649', 'Francisca', 'Olson', 'francisca.olson@csucc.edu.ph', '2004-11-13', 1, 'Active', '2019-08-21', 0),
(114, '2020-4895', 'Jackie', 'Reichel', 'jackie.reichel@csucc.edu.ph', '2001-03-03', 3, 'Active', '2024-08-21', 0),
(115, '2021-4327', 'Harvey', 'Bradtke', 'harvey.bradtke@csucc.edu.ph', '2003-12-21', 1, 'Active', '2023-09-27', 0),
(116, '2021-8991', 'Herta', 'Ullrich', 'herta.ullrich@csucc.edu.ph', '2000-08-19', 3, 'Active', '2023-06-18', 0),
(117, '2019-5876', 'Lea', 'Lueilwitz', 'lea.lueilwitz@csucc.edu.ph', '2004-03-17', 4, 'Active', '2019-10-21', 0),
(118, '2019-4838', 'Pearline', 'Willms', 'pearline.willms@csucc.edu.ph', '2001-01-18', 3, 'Active', '2020-02-26', 0),
(119, '2019-6915', 'Tia', 'Tremblay', 'tia.tremblay@csucc.edu.ph', '2001-12-18', 1, 'Active', '2021-01-18', 0),
(120, '2019-9100', 'Hermina', 'Shields', 'hermina.shields@csucc.edu.ph', '2000-01-27', 4, 'Active', '2019-04-09', 0),
(121, '2019-1206', 'Precious', 'Stokes', 'precious.stokes@csucc.edu.ph', '2005-10-29', 2, 'Active', '2024-11-19', 0),
(122, '2022-8898', 'Cheyenne', 'Keeling', 'cheyenne.keeling@csucc.edu.ph', '2002-03-22', 2, 'Active', '2019-01-11', 0),
(123, '2021-1437', 'Chanel', 'Moen', 'chanel.moen@csucc.edu.ph', '2001-01-23', 3, 'Active', '2022-06-03', 0),
(124, '2022-2961', 'Keon', 'Purdy', 'keon.purdy@csucc.edu.ph', '2003-10-26', 3, 'Active', '2023-06-24', 0),
(125, '2020-2889', 'Francis', 'Osinski', 'francis.osinski@csucc.edu.ph', '2004-09-12', 3, 'Active', '2022-09-30', 0),
(126, '2020-4383', 'Owen', 'Harber', 'owen.harber@csucc.edu.ph', '2002-07-05', 3, 'Active', '2019-04-16', 0),
(127, '2022-6495', 'Esperanza', 'Fahey', 'esperanza.fahey@csucc.edu.ph', '2004-01-21', 1, 'Active', '2022-12-23', 0),
(128, '2020-3824', 'Eve', 'Kunde', 'eve.kunde@csucc.edu.ph', '2003-09-14', 1, 'Active', '2024-11-16', 0),
(129, '2022-6395', 'Derek', 'Schaefer', 'derek.schaefer@csucc.edu.ph', '2005-02-03', 1, 'Active', '2024-07-06', 0),
(130, '2021-9226', 'Joaquin', 'Nitzsche', 'joaquin.nitzsche@csucc.edu.ph', '2004-05-23', 4, 'Active', '2023-03-18', 0),
(131, '2023-6428', 'Al', 'Hackett', 'al.hackett@csucc.edu.ph', '2005-03-10', 1, 'Active', '2021-11-24', 0),
(132, '2020-4042', 'Summer', 'Conroy', 'summer.conroy@csucc.edu.ph', '2004-10-16', 2, 'Active', '2021-05-12', 0),
(133, '2021-4969', 'Letha', 'Morar', 'letha.morar@csucc.edu.ph', '2005-02-23', 4, 'Active', '2023-08-29', 0),
(134, '2019-1663', 'Dixie', 'Cummerata', 'dixie.cummerata@csucc.edu.ph', '2002-11-18', 1, 'Active', '2021-04-30', 0),
(135, '2021-2939', 'Katelynn', 'Rowe', 'katelynn.rowe@csucc.edu.ph', '2002-08-23', 3, 'Active', '2023-01-25', 0),
(136, '2022-8299', 'Darby', 'Cronin', 'darby.cronin@csucc.edu.ph', '2003-09-20', 2, 'Active', '2023-03-16', 0),
(137, '2020-2070', 'Valerie', 'Jacobs', 'valerie.jacobs@csucc.edu.ph', '2005-09-15', 3, 'Active', '2023-02-19', 0),
(138, '2020-4260', 'Jamey', 'Gerlach', 'jamey.gerlach@csucc.edu.ph', '2004-12-31', 2, 'Active', '2024-09-30', 0),
(139, '2020-4132', 'Darrin', 'Bartoletti', 'darrin.bartoletti@csucc.edu.ph', '2003-05-17', 4, 'Active', '2024-10-28', 0),
(140, '2019-1732', 'Maude', 'Krajcik', 'maude.krajcik@csucc.edu.ph', '2004-12-31', 4, 'Active', '2021-10-04', 0),
(141, '2023-6235', 'Ken', 'Boyer', 'ken.boyer@csucc.edu.ph', '1999-12-29', 3, 'Active', '2023-08-14', 0),
(142, '2023-4109', 'Loy', 'Gleason', 'loy.gleason@csucc.edu.ph', '2005-03-20', 1, 'Active', '2022-06-24', 0),
(143, '2020-8850', 'Destiny', 'Treutel', 'destiny.treutel@csucc.edu.ph', '2004-04-19', 3, 'Active', '2020-09-06', 0),
(144, '2022-1429', 'Felicity', 'Rippin', 'felicity.rippin@csucc.edu.ph', '2005-03-29', 3, 'Active', '2019-11-23', 0),
(145, '2019-6625', 'Moshe', 'Hintz', 'moshe.hintz@csucc.edu.ph', '2003-03-22', 4, 'Active', '2020-11-10', 0),
(146, '2022-1755', 'Kylee', 'Walker', 'kylee.walker@csucc.edu.ph', '2000-08-07', 4, 'Active', '2024-03-29', 0),
(147, '2019-1800', 'Anika', 'Miller', 'anika.miller@csucc.edu.ph', '2004-01-30', 1, 'Active', '2024-09-22', 0),
(148, '2021-9825', 'Shanel', 'Gutmann', 'shanel.gutmann@csucc.edu.ph', '2003-04-26', 1, 'Active', '2021-04-22', 0),
(149, '2023-6318', 'Remington', 'Feil', 'remington.feil@csucc.edu.ph', '2003-03-19', 4, 'Active', '2019-11-28', 0),
(150, '2020-3456', 'Afton', 'Haley', 'afton.haley@csucc.edu.ph', '2004-11-01', 4, 'Active', '2023-03-30', 0),
(151, '2020-8192', 'Roman', 'McDermott', 'roman.mcdermott@csucc.edu.ph', '2005-06-06', 3, 'Active', '2024-09-21', 0),
(152, '2023-2029', 'Karolann', 'Schinner', 'karolann.schinner@csucc.edu.ph', '2005-11-15', 1, 'Active', '2019-08-22', 0),
(153, 'test', 'test', 'test', 'test@asjdhgmail.com', '2003-02-24', 4, 'Active', '2024-12-15', 0),
(154, 'sdf', 'sdf', 'sdf', 'tessdft2@example.com', '2024-12-15', 4, 'Active', '2024-12-15', 0),
(155, 'test23', 'asd', 'asd', 'jeroldas2h.amora@gmail.com', '2024-12-15', 4, 'Active', '2025-01-03', 1),
(157, '2022-0530', 'Jerold', 'Amora', 'jerold.amora@csucc.edu.ph', '2003-04-25', 3, 'Active', '2024-12-15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_logs`
--

CREATE TABLE `student_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `performed_by` varchar(255) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `student_number` varchar(20) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `year_level` bigint(20) UNSIGNED DEFAULT NULL,
  `enrollment_status` enum('Active','Inactive','Graduated') DEFAULT NULL,
  `date_enrolled` date DEFAULT NULL,
  `financial_hold` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_logs`
--

INSERT INTO `student_logs` (`log_id`, `performed_by`, `action`, `student_number`, `first_name`, `last_name`, `email`, `date_of_birth`, `year_level`, `enrollment_status`, `date_enrolled`, `financial_hold`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'INSERT', '2020-1253', 'Herta', 'Walter', 'herta.walter@csucc.edu.ph', '2004-10-14', 2, 'Active', '2022-03-02', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(2, 'Admin', 'INSERT', '2021-5175', 'Bradford', 'Abbott', 'bradford.abbott@csucc.edu.ph', '2001-03-10', 4, 'Active', '2022-09-22', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(3, 'Admin', 'INSERT', '2021-5768', 'Allene', 'Rippin', 'allene.rippin@csucc.edu.ph', '2002-04-05', 1, 'Active', '2020-11-09', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(4, 'Admin', 'INSERT', '2023-1480', 'Tyreek', 'Purdy', 'tyreek.purdy@csucc.edu.ph', '2005-06-16', 1, 'Active', '2019-05-19', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(5, 'Admin', 'INSERT', '2021-1096', 'Pierce', 'West', 'pierce.west@csucc.edu.ph', '2001-03-08', 1, 'Active', '2019-11-12', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(6, 'Admin', 'INSERT', '2020-6613', 'Jared', 'Maggio', 'jared.maggio@csucc.edu.ph', '2001-05-28', 4, 'Active', '2024-01-09', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(7, 'Admin', 'INSERT', '2020-6602', 'Joaquin', 'Haley', 'joaquin.haley@csucc.edu.ph', '2001-07-31', 4, 'Active', '2024-01-17', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(8, 'Admin', 'INSERT', '2020-8068', 'Mason', 'Koch', 'mason.koch@csucc.edu.ph', '2000-11-30', 3, 'Active', '2024-05-27', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(9, 'Admin', 'INSERT', '2020-6377', 'Luciano', 'Kuvalis', 'luciano.kuvalis@csucc.edu.ph', '2005-07-14', 3, 'Active', '2022-06-09', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(10, 'Admin', 'INSERT', '2020-3433', 'Jaiden', 'Frami', 'jaiden.frami@csucc.edu.ph', '2000-03-12', 3, 'Active', '2019-01-22', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(11, 'Admin', 'INSERT', '2020-7160', 'Claire', 'Heathcote', 'claire.heathcote@csucc.edu.ph', '2003-11-26', 3, 'Active', '2024-03-26', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(12, 'Admin', 'INSERT', '2021-9334', 'Dillan', 'Beier', 'dillan.beier@csucc.edu.ph', '2005-04-10', 3, 'Active', '2023-07-10', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(13, 'Admin', 'INSERT', '2021-4110', 'Patience', 'Feeney', 'patience.feeney@csucc.edu.ph', '2004-11-07', 2, 'Active', '2020-06-23', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(14, 'Admin', 'INSERT', '2020-1240', 'Giovanna', 'Beer', 'giovanna.beer@csucc.edu.ph', '2001-08-10', 4, 'Active', '2020-04-16', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(15, 'Admin', 'INSERT', '2020-3460', 'Kenna', 'Lebsack', 'kenna.lebsack@csucc.edu.ph', '2002-10-20', 1, 'Active', '2024-09-01', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(16, 'Admin', 'INSERT', '2023-2126', 'Natalia', 'Collins', 'natalia.collins@csucc.edu.ph', '2005-11-02', 4, 'Active', '2024-09-21', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(17, 'Admin', 'INSERT', '2021-5492', 'Tremaine', 'Heidenreich', 'tremaine.heidenreich@csucc.edu.ph', '2004-09-24', 1, 'Active', '2019-09-10', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(18, 'Admin', 'INSERT', '2019-6635', 'Kaden', 'Gerlach', 'kaden.gerlach@csucc.edu.ph', '2003-05-09', 3, 'Active', '2022-03-22', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(19, 'Admin', 'INSERT', '2020-7112', 'Marcelino', 'Jacobs', 'marcelino.jacobs@csucc.edu.ph', '2005-05-25', 1, 'Active', '2020-11-04', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(20, 'Admin', 'INSERT', '2021-2542', 'Aisha', 'Kiehn', 'aisha.kiehn@csucc.edu.ph', '2002-01-14', 2, 'Active', '2019-12-26', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(21, 'Admin', 'INSERT', '2023-5064', 'Carmen', 'Turcotte', 'carmen.turcotte@csucc.edu.ph', '2000-08-27', 4, 'Active', '2019-01-25', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(22, 'Admin', 'INSERT', '2020-5139', 'Abe', 'Fay', 'abe.fay@csucc.edu.ph', '2005-06-25', 2, 'Active', '2019-01-15', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(23, 'Admin', 'INSERT', '2019-9641', 'Duncan', 'Eichmann', 'duncan.eichmann@csucc.edu.ph', '2001-02-25', 3, 'Active', '2022-02-18', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(24, 'Admin', 'INSERT', '2023-1840', 'Garfield', 'Hansen', 'garfield.hansen@csucc.edu.ph', '2002-06-14', 4, 'Active', '2021-11-18', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(25, 'Admin', 'INSERT', '2021-8367', 'Brennan', 'Batz', 'brennan.batz@csucc.edu.ph', '2004-08-19', 1, 'Active', '2023-06-25', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(26, 'Admin', 'INSERT', '2022-2001', 'Eric', 'Mraz', 'eric.mraz@csucc.edu.ph', '2001-12-17', 2, 'Active', '2022-12-27', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(27, 'Admin', 'INSERT', '2020-9696', 'Roma', 'Gottlieb', 'roma.gottlieb@csucc.edu.ph', '2002-05-13', 2, 'Active', '2023-01-15', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(28, 'Admin', 'INSERT', '2019-2876', 'Delphia', 'Yundt', 'delphia.yundt@csucc.edu.ph', '2001-10-04', 1, 'Active', '2022-05-09', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(29, 'Admin', 'INSERT', '2022-7902', 'Brianne', 'Blanda', 'brianne.blanda@csucc.edu.ph', '2000-08-16', 4, 'Active', '2022-05-19', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(30, 'Admin', 'INSERT', '2020-3005', 'Jermey', 'Bashirian', 'jermey.bashirian@csucc.edu.ph', '2004-11-01', 4, 'Active', '2020-11-13', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(31, 'Admin', 'INSERT', '2020-7454', 'Jerod', 'Lynch', 'jerod.lynch@csucc.edu.ph', '2004-02-16', 3, 'Active', '2023-04-07', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(32, 'Admin', 'INSERT', '2020-9593', 'Enrico', 'Moore', 'enrico.moore@csucc.edu.ph', '2005-06-07', 3, 'Active', '2019-09-15', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(33, 'Admin', 'INSERT', '2022-6399', 'Grant', 'Upton', 'grant.upton@csucc.edu.ph', '2005-07-14', 2, 'Active', '2020-01-27', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(34, 'Admin', 'INSERT', '2021-9062', 'Salma', 'Gerlach', 'salma.gerlach@csucc.edu.ph', '2005-02-17', 1, 'Active', '2022-02-24', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(35, 'Admin', 'INSERT', '2019-3845', 'Destinee', 'Cruickshank', 'destinee.cruickshank@csucc.edu.ph', '2004-03-26', 2, 'Active', '2023-05-06', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(36, 'Admin', 'INSERT', '2019-4020', 'Ernie', 'Labadie', 'ernie.labadie@csucc.edu.ph', '2002-06-28', 1, 'Active', '2023-10-19', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(37, 'Admin', 'INSERT', '2022-2280', 'Lilly', 'Gleichner', 'lilly.gleichner@csucc.edu.ph', '2002-09-05', 2, 'Active', '2019-09-17', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(38, 'Admin', 'INSERT', '2020-3053', 'Clifton', 'White', 'clifton.white@csucc.edu.ph', '2004-09-22', 2, 'Active', '2020-04-29', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(39, 'Admin', 'INSERT', '2020-3464', 'Gregg', 'Smith', 'gregg.smith@csucc.edu.ph', '2000-12-15', 2, 'Active', '2022-08-18', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(40, 'Admin', 'INSERT', '2023-6264', 'Lora', 'Nienow', 'lora.nienow@csucc.edu.ph', '2004-02-06', 4, 'Active', '2019-11-21', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(41, 'Admin', 'INSERT', '2020-8708', 'Wyman', 'Terry', 'wyman.terry@csucc.edu.ph', '2002-05-12', 3, 'Active', '2021-05-13', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(42, 'Admin', 'INSERT', '2023-8997', 'Darryl', 'Feil', 'darryl.feil@csucc.edu.ph', '2001-06-29', 4, 'Active', '2021-02-13', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(43, 'Admin', 'INSERT', '2020-6466', 'Kaley', 'Hoppe', 'kaley.hoppe@csucc.edu.ph', '2001-10-12', 2, 'Active', '2024-10-15', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(44, 'Admin', 'INSERT', '2022-3868', 'Merl', 'Homenick', 'merl.homenick@csucc.edu.ph', '2000-12-12', 3, 'Active', '2023-04-30', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(45, 'Admin', 'INSERT', '2021-1704', 'Pinkie', 'Block', 'pinkie.block@csucc.edu.ph', '2004-07-08', 2, 'Active', '2021-06-10', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(46, 'Admin', 'INSERT', '2023-1853', 'Catharine', 'Cassin', 'catharine.cassin@csucc.edu.ph', '2001-11-01', 2, 'Active', '2022-06-17', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(47, 'Admin', 'INSERT', '2022-6973', 'Muriel', 'Hoppe', 'muriel.hoppe@csucc.edu.ph', '2001-04-23', 1, 'Active', '2023-07-11', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(48, 'Admin', 'INSERT', '2022-1548', 'Xander', 'Daugherty', 'xander.daugherty@csucc.edu.ph', '2001-06-13', 2, 'Active', '2024-10-04', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(49, 'Admin', 'INSERT', '2021-8441', 'Vance', 'Reichel', 'vance.reichel@csucc.edu.ph', '2003-12-20', 3, 'Active', '2023-08-09', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(50, 'Admin', 'INSERT', '2021-8523', 'Rosa', 'Cummings', 'rosa.cummings@csucc.edu.ph', '2001-05-01', 4, 'Active', '2021-05-06', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(51, 'Admin', 'INSERT', '2023-2136', 'Sandrine', 'Bernier', 'sandrine.bernier@csucc.edu.ph', '2004-04-10', 1, 'Active', '2020-01-25', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(52, 'Admin', 'INSERT', '2021-3075', 'Abraham', 'Ferry', 'abraham.ferry@csucc.edu.ph', '2002-05-26', 2, 'Active', '2023-01-07', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(53, 'Admin', 'INSERT', '2023-4817', 'Tressa', 'Kunde', 'tressa.kunde@csucc.edu.ph', '2000-06-10', 1, 'Active', '2023-12-12', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(54, 'Admin', 'INSERT', '2023-1805', 'Arden', 'Pacocha', 'arden.pacocha@csucc.edu.ph', '2001-07-30', 1, 'Active', '2022-02-04', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(55, 'Admin', 'INSERT', '2021-9710', 'Kody', 'Haag', 'kody.haag@csucc.edu.ph', '2000-08-12', 2, 'Active', '2023-03-22', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(56, 'Admin', 'INSERT', '2019-4977', 'Clark', 'Lesch', 'clark.lesch@csucc.edu.ph', '2001-06-12', 2, 'Active', '2020-07-22', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(57, 'Admin', 'INSERT', '2023-1657', 'Ara', 'Rohan', 'ara.rohan@csucc.edu.ph', '2001-04-20', 2, 'Active', '2024-04-26', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(58, 'Admin', 'INSERT', '2020-4101', 'Cassandra', 'Metz', 'cassandra.metz@csucc.edu.ph', '2005-02-17', 3, 'Active', '2019-05-13', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(59, 'Admin', 'INSERT', '2023-5293', 'Juwan', 'Schowalter', 'juwan.schowalter@csucc.edu.ph', '2003-02-09', 4, 'Active', '2019-10-09', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(60, 'Admin', 'INSERT', '2022-4200', 'Alec', 'Ward', 'alec.ward@csucc.edu.ph', '2003-03-13', 4, 'Active', '2024-04-08', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(61, 'Admin', 'INSERT', '2019-4780', 'Chris', 'Hane', 'chris.hane@csucc.edu.ph', '2003-04-30', 1, 'Active', '2024-02-09', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(62, 'Admin', 'INSERT', '2021-8600', 'Chesley', 'Dietrich', 'chesley.dietrich@csucc.edu.ph', '2000-04-30', 2, 'Active', '2020-02-26', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(63, 'Admin', 'INSERT', '2023-5802', 'Eriberto', 'Halvorson', 'eriberto.halvorson@csucc.edu.ph', '2005-04-02', 4, 'Active', '2023-09-15', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(64, 'Admin', 'INSERT', '2023-6174', 'Maximilian', 'Windler', 'maximilian.windler@csucc.edu.ph', '2001-01-17', 1, 'Active', '2023-11-15', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(65, 'Admin', 'INSERT', '2019-9074', 'Zachary', 'Feil', 'zachary.feil@csucc.edu.ph', '2004-03-05', 4, 'Active', '2021-10-07', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(66, 'Admin', 'INSERT', '2020-1499', 'Adell', 'Mills', 'adell.mills@csucc.edu.ph', '2004-04-16', 4, 'Active', '2024-03-06', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(67, 'Admin', 'INSERT', '2020-1938', 'Grady', 'Olson', 'grady.olson@csucc.edu.ph', '2000-12-13', 2, 'Active', '2020-04-20', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(68, 'Admin', 'INSERT', '2022-3399', 'Charlie', 'Kunze', 'charlie.kunze@csucc.edu.ph', '2003-02-13', 4, 'Active', '2022-06-17', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(69, 'Admin', 'INSERT', '2023-1717', 'Jesus', 'Rolfson', 'jesus.rolfson@csucc.edu.ph', '2001-06-05', 3, 'Active', '2022-07-01', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(70, 'Admin', 'INSERT', '2020-1286', 'Myrtle', 'Boyer', 'myrtle.boyer@csucc.edu.ph', '2005-04-17', 1, 'Active', '2024-05-04', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(71, 'Admin', 'INSERT', '2020-3698', 'Pearl', 'Sanford', 'pearl.sanford@csucc.edu.ph', '2004-04-24', 2, 'Active', '2024-02-01', 0, '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(72, 'Admin', 'INSERT', '2023-3752', 'Mireya', 'Koelpin', 'mireya.koelpin@csucc.edu.ph', '2001-12-20', 3, 'Active', '2020-11-30', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(73, 'Admin', 'INSERT', '2023-3983', 'Einar', 'Jakubowski', 'einar.jakubowski@csucc.edu.ph', '2001-05-02', 2, 'Active', '2023-12-17', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(74, 'Admin', 'INSERT', '2019-8915', 'Destin', 'Paucek', 'destin.paucek@csucc.edu.ph', '2001-05-18', 3, 'Active', '2024-02-28', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(75, 'Admin', 'INSERT', '2022-5389', 'Mayra', 'Paucek', 'mayra.paucek@csucc.edu.ph', '2003-11-06', 1, 'Active', '2023-05-29', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(76, 'Admin', 'INSERT', '2020-5778', 'Layne', 'Auer', 'layne.auer@csucc.edu.ph', '2004-12-18', 2, 'Active', '2020-12-15', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(77, 'Admin', 'INSERT', '2020-3990', 'Unique', 'Herzog', 'unique.herzog@csucc.edu.ph', '2002-11-30', 2, 'Active', '2021-01-12', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(78, 'Admin', 'INSERT', '2021-4743', 'Jason', 'Pouros', 'jason.pouros@csucc.edu.ph', '2005-05-30', 1, 'Active', '2024-03-11', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(79, 'Admin', 'INSERT', '2019-7865', 'Dewitt', 'Murazik', 'dewitt.murazik@csucc.edu.ph', '2000-05-24', 3, 'Active', '2021-11-26', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(80, 'Admin', 'INSERT', '2019-6869', 'Callie', 'Herman', 'callie.herman@csucc.edu.ph', '2004-05-16', 2, 'Active', '2024-07-07', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(81, 'Admin', 'INSERT', '2023-1577', 'Garfield', 'Leffler', 'garfield.leffler@csucc.edu.ph', '2001-10-09', 3, 'Active', '2022-12-09', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(82, 'Admin', 'INSERT', '2023-5495', 'Wilford', 'Wuckert', 'wilford.wuckert@csucc.edu.ph', '2002-07-20', 3, 'Active', '2023-05-13', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(83, 'Admin', 'INSERT', '2020-4949', 'Katherine', 'Barrows', 'katherine.barrows@csucc.edu.ph', '2002-01-02', 4, 'Active', '2024-06-06', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(84, 'Admin', 'INSERT', '2019-9911', 'Destany', 'Mertz', 'destany.mertz@csucc.edu.ph', '2003-05-23', 1, 'Active', '2022-08-24', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(85, 'Admin', 'INSERT', '2022-4891', 'Jada', 'Adams', 'jada.adams@csucc.edu.ph', '2000-05-04', 1, 'Active', '2024-10-12', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(86, 'Admin', 'INSERT', '2021-2053', 'Kade', 'Runolfsson', 'kade.runolfsson@csucc.edu.ph', '2005-01-01', 3, 'Active', '2022-06-08', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(87, 'Admin', 'INSERT', '2019-6160', 'Erna', 'Jones', 'erna.jones@csucc.edu.ph', '2005-10-20', 1, 'Active', '2024-02-06', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(88, 'Admin', 'INSERT', '2023-3013', 'Rowena', 'Wolff', 'rowena.wolff@csucc.edu.ph', '2004-08-09', 3, 'Active', '2021-01-02', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(89, 'Admin', 'INSERT', '2019-4534', 'Marc', 'Kuhlman', 'marc.kuhlman@csucc.edu.ph', '2000-07-30', 3, 'Active', '2021-06-20', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(90, 'Admin', 'INSERT', '2021-9402', 'Seth', 'Block', 'seth.block@csucc.edu.ph', '2005-01-25', 4, 'Active', '2019-01-03', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(91, 'Admin', 'INSERT', '2020-5400', 'Henri', 'Romaguera', 'henri.romaguera@csucc.edu.ph', '2005-07-22', 1, 'Active', '2019-10-11', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(92, 'Admin', 'INSERT', '2019-5623', 'Deshaun', 'Brown', 'deshaun.brown@csucc.edu.ph', '2003-11-26', 3, 'Active', '2024-05-25', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(93, 'Admin', 'INSERT', '2019-8672', 'Myrl', 'Beatty', 'myrl.beatty@csucc.edu.ph', '2005-04-14', 2, 'Active', '2024-11-12', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(94, 'Admin', 'INSERT', '2021-2225', 'Rebeka', 'Hills', 'rebeka.hills@csucc.edu.ph', '2000-02-03', 1, 'Active', '2023-03-13', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(95, 'Admin', 'INSERT', '2023-3744', 'Ramon', 'Koss', 'ramon.koss@csucc.edu.ph', '2005-10-20', 3, 'Active', '2023-08-28', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(96, 'Admin', 'INSERT', '2021-1473', 'Lynn', 'Conn', 'lynn.conn@csucc.edu.ph', '2001-08-18', 4, 'Active', '2024-05-03', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(97, 'Admin', 'INSERT', '2019-6132', 'Anderson', 'Turner', 'anderson.turner@csucc.edu.ph', '2005-02-14', 1, 'Active', '2022-03-03', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(98, 'Admin', 'INSERT', '2021-9388', 'Esmeralda', 'Rodriguez', 'esmeralda.rodriguez@csucc.edu.ph', '2004-05-29', 2, 'Active', '2019-06-19', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(99, 'Admin', 'INSERT', '2023-2377', 'Alanis', 'Kertzmann', 'alanis.kertzmann@csucc.edu.ph', '2005-07-25', 3, 'Active', '2021-08-11', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(100, 'Admin', 'INSERT', '2019-3445', 'Britney', 'Maggio', 'britney.maggio@csucc.edu.ph', '2003-02-28', 2, 'Active', '2021-03-02', 0, '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(101, 'Admin', 'INSERT', '2021-8483', 'Idella', 'Gislason', 'idella.gislason@csucc.edu.ph', '2001-09-28', 4, 'Active', '2020-03-22', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(102, 'Admin', 'INSERT', '2020-7306', 'Jaydon', 'Waelchi', 'jaydon.waelchi@csucc.edu.ph', '2004-05-02', 4, 'Active', '2021-06-24', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(103, 'Admin', 'INSERT', '2019-7989', 'Anabel', 'Upton', 'anabel.upton@csucc.edu.ph', '2001-03-17', 1, 'Active', '2021-03-03', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(104, 'Admin', 'INSERT', '2019-2915', 'Cortez', 'Glover', 'cortez.glover@csucc.edu.ph', '2004-03-10', 3, 'Active', '2021-07-29', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(105, 'Admin', 'INSERT', '2022-8476', 'Kyla', 'Wilkinson', 'kyla.wilkinson@csucc.edu.ph', '2002-01-04', 2, 'Active', '2021-10-06', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(106, 'Admin', 'INSERT', '2023-1487', 'Emery', 'Klein', 'emery.klein@csucc.edu.ph', '2004-11-04', 1, 'Active', '2020-08-01', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(107, 'Admin', 'INSERT', '2022-6004', 'Gay', 'Strosin', 'gay.strosin@csucc.edu.ph', '2001-09-02', 2, 'Active', '2024-09-15', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(108, 'Admin', 'INSERT', '2023-4959', 'Leonora', 'Kulas', 'leonora.kulas@csucc.edu.ph', '2001-03-26', 2, 'Active', '2024-05-01', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(109, 'Admin', 'INSERT', '2021-3023', 'Justyn', 'Donnelly', 'justyn.donnelly@csucc.edu.ph', '2002-12-10', 3, 'Active', '2023-03-12', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(110, 'Admin', 'INSERT', '2019-6384', 'Newton', 'Treutel', 'newton.treutel@csucc.edu.ph', '2005-10-14', 4, 'Active', '2023-02-03', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(111, 'Admin', 'INSERT', '2021-5649', 'Francisca', 'Olson', 'francisca.olson@csucc.edu.ph', '2004-11-13', 1, 'Active', '2019-08-21', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(112, 'Admin', 'INSERT', '2020-4895', 'Jackie', 'Reichel', 'jackie.reichel@csucc.edu.ph', '2001-03-03', 3, 'Active', '2024-08-21', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(113, 'Admin', 'INSERT', '2021-4327', 'Harvey', 'Bradtke', 'harvey.bradtke@csucc.edu.ph', '2003-12-21', 1, 'Active', '2023-09-27', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(114, 'Admin', 'INSERT', '2021-8991', 'Herta', 'Ullrich', 'herta.ullrich@csucc.edu.ph', '2000-08-19', 3, 'Active', '2023-06-18', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(115, 'Admin', 'INSERT', '2019-5876', 'Lea', 'Lueilwitz', 'lea.lueilwitz@csucc.edu.ph', '2004-03-17', 4, 'Active', '2019-10-21', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(116, 'Admin', 'INSERT', '2019-4838', 'Pearline', 'Willms', 'pearline.willms@csucc.edu.ph', '2001-01-18', 3, 'Active', '2020-02-26', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(117, 'Admin', 'INSERT', '2019-6915', 'Tia', 'Tremblay', 'tia.tremblay@csucc.edu.ph', '2001-12-18', 1, 'Active', '2021-01-18', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(118, 'Admin', 'INSERT', '2019-9100', 'Hermina', 'Shields', 'hermina.shields@csucc.edu.ph', '2000-01-27', 4, 'Active', '2019-04-09', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(119, 'Admin', 'INSERT', '2019-1206', 'Precious', 'Stokes', 'precious.stokes@csucc.edu.ph', '2005-10-29', 2, 'Active', '2024-11-19', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(120, 'Admin', 'INSERT', '2022-8898', 'Cheyenne', 'Keeling', 'cheyenne.keeling@csucc.edu.ph', '2002-03-22', 2, 'Active', '2019-01-11', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(121, 'Admin', 'INSERT', '2021-1437', 'Chanel', 'Moen', 'chanel.moen@csucc.edu.ph', '2001-01-23', 3, 'Active', '2022-06-03', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(122, 'Admin', 'INSERT', '2022-2961', 'Keon', 'Purdy', 'keon.purdy@csucc.edu.ph', '2003-10-26', 3, 'Active', '2023-06-24', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(123, 'Admin', 'INSERT', '2020-2889', 'Francis', 'Osinski', 'francis.osinski@csucc.edu.ph', '2004-09-12', 3, 'Active', '2022-09-30', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(124, 'Admin', 'INSERT', '2020-4383', 'Owen', 'Harber', 'owen.harber@csucc.edu.ph', '2002-07-05', 3, 'Active', '2019-04-16', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(125, 'Admin', 'INSERT', '2022-6495', 'Esperanza', 'Fahey', 'esperanza.fahey@csucc.edu.ph', '2004-01-21', 1, 'Active', '2022-12-23', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(126, 'Admin', 'INSERT', '2020-3824', 'Eve', 'Kunde', 'eve.kunde@csucc.edu.ph', '2003-09-14', 1, 'Active', '2024-11-16', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(127, 'Admin', 'INSERT', '2022-6395', 'Derek', 'Schaefer', 'derek.schaefer@csucc.edu.ph', '2005-02-03', 1, 'Active', '2024-07-06', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(128, 'Admin', 'INSERT', '2021-9226', 'Joaquin', 'Nitzsche', 'joaquin.nitzsche@csucc.edu.ph', '2004-05-23', 4, 'Active', '2023-03-18', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(129, 'Admin', 'INSERT', '2023-6428', 'Al', 'Hackett', 'al.hackett@csucc.edu.ph', '2005-03-10', 1, 'Active', '2021-11-24', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(130, 'Admin', 'INSERT', '2020-4042', 'Summer', 'Conroy', 'summer.conroy@csucc.edu.ph', '2004-10-16', 2, 'Active', '2021-05-12', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(131, 'Admin', 'INSERT', '2021-4969', 'Letha', 'Morar', 'letha.morar@csucc.edu.ph', '2005-02-23', 4, 'Active', '2023-08-29', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(132, 'Admin', 'INSERT', '2019-1663', 'Dixie', 'Cummerata', 'dixie.cummerata@csucc.edu.ph', '2002-11-18', 1, 'Active', '2021-04-30', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(133, 'Admin', 'INSERT', '2021-2939', 'Katelynn', 'Rowe', 'katelynn.rowe@csucc.edu.ph', '2002-08-23', 3, 'Active', '2023-01-25', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(134, 'Admin', 'INSERT', '2022-8299', 'Darby', 'Cronin', 'darby.cronin@csucc.edu.ph', '2003-09-20', 2, 'Active', '2023-03-16', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(135, 'Admin', 'INSERT', '2020-2070', 'Valerie', 'Jacobs', 'valerie.jacobs@csucc.edu.ph', '2005-09-15', 3, 'Active', '2023-02-19', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(136, 'Admin', 'INSERT', '2020-4260', 'Jamey', 'Gerlach', 'jamey.gerlach@csucc.edu.ph', '2004-12-31', 2, 'Active', '2024-09-30', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(137, 'Admin', 'INSERT', '2020-4132', 'Darrin', 'Bartoletti', 'darrin.bartoletti@csucc.edu.ph', '2003-05-17', 4, 'Active', '2024-10-28', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(138, 'Admin', 'INSERT', '2019-1732', 'Maude', 'Krajcik', 'maude.krajcik@csucc.edu.ph', '2004-12-31', 4, 'Active', '2021-10-04', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(139, 'Admin', 'INSERT', '2023-6235', 'Ken', 'Boyer', 'ken.boyer@csucc.edu.ph', '1999-12-29', 3, 'Active', '2023-08-14', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(140, 'Admin', 'INSERT', '2023-4109', 'Loy', 'Gleason', 'loy.gleason@csucc.edu.ph', '2005-03-20', 1, 'Active', '2022-06-24', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(141, 'Admin', 'INSERT', '2020-8850', 'Destiny', 'Treutel', 'destiny.treutel@csucc.edu.ph', '2004-04-19', 3, 'Active', '2020-09-06', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(142, 'Admin', 'INSERT', '2022-1429', 'Felicity', 'Rippin', 'felicity.rippin@csucc.edu.ph', '2005-03-29', 3, 'Active', '2019-11-23', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(143, 'Admin', 'INSERT', '2019-6625', 'Moshe', 'Hintz', 'moshe.hintz@csucc.edu.ph', '2003-03-22', 4, 'Active', '2020-11-10', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(144, 'Admin', 'INSERT', '2022-1755', 'Kylee', 'Walker', 'kylee.walker@csucc.edu.ph', '2000-08-07', 4, 'Active', '2024-03-29', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(145, 'Admin', 'INSERT', '2019-1800', 'Anika', 'Miller', 'anika.miller@csucc.edu.ph', '2004-01-30', 1, 'Active', '2024-09-22', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(146, 'Admin', 'INSERT', '2021-9825', 'Shanel', 'Gutmann', 'shanel.gutmann@csucc.edu.ph', '2003-04-26', 1, 'Active', '2021-04-22', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(147, 'Admin', 'INSERT', '2023-6318', 'Remington', 'Feil', 'remington.feil@csucc.edu.ph', '2003-03-19', 4, 'Active', '2019-11-28', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(148, 'Admin', 'INSERT', '2020-3456', 'Afton', 'Haley', 'afton.haley@csucc.edu.ph', '2004-11-01', 4, 'Active', '2023-03-30', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(149, 'Admin', 'INSERT', '2020-8192', 'Roman', 'McDermott', 'roman.mcdermott@csucc.edu.ph', '2005-06-06', 3, 'Active', '2024-09-21', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(150, 'Admin', 'INSERT', '2023-2029', 'Karolann', 'Schinner', 'karolann.schinner@csucc.edu.ph', '2005-11-15', 1, 'Active', '2019-08-22', 0, '2024-12-14 21:35:49', '2024-12-14 21:35:49'),
(151, 'Joseph Vistal', 'INSERT', 'fdsfg', 'dfgdfg', 'dfgdfgdfg', 'dfgdfgdfgdf@mail.com', '2024-12-15', 4, 'Active', '2024-12-15', 0, '2024-12-14 23:59:20', '2024-12-14 23:59:20'),
(152, 'Joseph Vistal', 'DELETE', 'fdsfg', 'dfgdfg', 'dfgdfgdfg', 'dfgdfgdfgdf@mail.com', '2024-12-15', 4, 'Active', '2024-12-15', 0, '2024-12-15 00:02:36', '2024-12-15 00:02:36'),
(153, 'Joseph Vistal', 'INSERT', '2022-0530', 'Jerold', 'Amora', 'jerold.amora@csucc.edu.ph', '2003-04-25', 3, 'Active', '2024-12-15', 0, '2024-12-15 00:08:11', '2024-12-15 00:08:11');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `credits` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `pre_requisite_subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `co_requisite_subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `weekly_hours` bigint(20) UNSIGNED NOT NULL,
  `semester` enum('First','Second','Summer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_code`, `subject_name`, `credits`, `department_id`, `pre_requisite_subject_id`, `co_requisite_subject_id`, `weekly_hours`, `semester`) VALUES
(3, 'IX801', 'molestiae qui ratione', 3, 4, NULL, NULL, 5, 'Summer'),
(4, 'JR882', 'fugit dignissimos eius', 2, 2, NULL, NULL, 2, 'Second'),
(5, 'PN097', 'est numquam blanditiis', 3, 4, NULL, NULL, 5, 'Summer'),
(7, 'NY192', 'deserunt consequatur unde', 2, 1, NULL, NULL, 2, 'Summer'),
(8, 'IP883', 'earum voluptatem optio', 2, 4, NULL, NULL, 5, 'Summer'),
(9, 'KO066', 'quasi dolor aliquid', 2, 1, NULL, NULL, 5, 'Second'),
(10, 'GT515', 'autem incidunt eius', 2, 4, NULL, NULL, 2, 'Second'),
(11, 'CK751', 'maxime exercitationem officiis', 2, 3, NULL, NULL, 2, 'First'),
(12, 'OU227', 'error laboriosam voluptate', 3, 3, NULL, NULL, 2, 'Second'),
(13, 'FU261', 'et inventore incidunt', 2, 1, NULL, NULL, 2, 'Second'),
(14, 'CC392', 'ut velit voluptates', 2, 2, NULL, NULL, 5, 'Second'),
(15, 'KU214', 'et voluptatem qui', 3, 4, NULL, NULL, 5, 'First'),
(16, 'AS587', 'eos expedita eos', 2, 1, NULL, NULL, 5, 'Summer'),
(17, 'SE117', 'eos molestiae debitis', 3, 1, NULL, NULL, 2, 'Second'),
(18, 'SB538', 'quia soluta consequuntur', 3, 1, NULL, NULL, 2, 'First'),
(19, 'PT376', 'eos sunt quibusdam', 3, 2, NULL, NULL, 5, 'First'),
(20, 'BC339', 'et voluptatem repudiandae', 3, 2, NULL, NULL, 2, 'Second'),
(21, 'VP579', 'sequi necessitatibus blanditiis', 2, 1, NULL, NULL, 5, 'First'),
(22, 'XT452', 'dolor velit voluptas', 2, 1, NULL, NULL, 2, 'Summer'),
(23, 'FV424', 'temporibus facere non', 3, 2, NULL, NULL, 2, 'Summer'),
(24, 'FJ675', 'dolorum nostrum sit', 2, 1, NULL, NULL, 5, 'Second'),
(25, 'TM067', 'quia illo occaecati', 2, 3, NULL, NULL, 5, 'Summer'),
(26, 'MP577', 'tempora modi vero', 2, 4, NULL, NULL, 2, 'Summer'),
(27, 'EC775', 'sit aut blanditiis', 3, 1, NULL, NULL, 5, 'First'),
(28, 'IO822', 'sed nobis perferendis', 3, 4, NULL, NULL, 2, 'Summer'),
(29, 'MU489', 'voluptates et cupiditate', 2, 4, NULL, NULL, 2, 'Summer'),
(30, 'GX657', 'quia sunt deserunt', 3, 1, NULL, NULL, 2, 'Second'),
(31, 'OT673', 'non veniam sint', 2, 4, NULL, NULL, 5, 'Second'),
(32, 'QJ814', 'porro tempore voluptas', 2, 3, NULL, NULL, 5, 'First'),
(33, 'FN718', 'voluptatibus et ut', 3, 3, NULL, NULL, 2, 'First'),
(34, 'NB504', 'tenetur non molestiae', 3, 2, NULL, NULL, 5, 'Summer'),
(35, 'OL928', 'amet fugit vel', 2, 1, NULL, NULL, 5, 'Second'),
(36, 'EV312', 'est fugit illo', 3, 4, NULL, NULL, 2, 'Summer'),
(37, 'ZF149', 'quo asperiores consequatur', 2, 2, NULL, NULL, 2, 'Summer'),
(38, 'HT552', 'voluptas ut voluptas', 2, 4, NULL, NULL, 5, 'Second'),
(39, 'UR498', 'earum tempora nesciunt', 2, 2, NULL, NULL, 5, 'Second'),
(40, 'BS208', 'dolor qui quae', 3, 3, NULL, NULL, 2, 'Second'),
(41, 'SP881', 'ut debitis est', 3, 2, NULL, NULL, 5, 'First'),
(42, 'SG427', 'nisi omnis suscipit', 3, 3, NULL, NULL, 2, 'Summer'),
(43, 'LL113', 'quis est atque', 3, 4, NULL, NULL, 2, 'Second'),
(44, 'PO374', 'consectetur eum sunt', 2, 2, NULL, NULL, 5, 'First'),
(45, 'IC900', 'necessitatibus voluptas sed', 3, 1, NULL, NULL, 2, 'Summer'),
(46, 'IH382', 'nesciunt dicta illum', 3, 1, NULL, NULL, 2, 'Second'),
(47, 'WX117', 'est unde magni', 3, 1, NULL, NULL, 2, 'Summer'),
(48, 'ET533', 'qui ducimus beatae', 3, 4, NULL, NULL, 5, 'Summer'),
(50, 'FO985', 'voluptas eius modi', 3, 3, NULL, NULL, 2, 'Summer'),
(51, 'JY753', 'qui cupiditate perferendis', 3, 2, NULL, NULL, 5, 'Summer'),
(52, 'SQ105', 'praesentium aut ratione', 3, 4, NULL, NULL, 5, 'Second'),
(53, 'QH927', 'maxime explicabo voluptatum', 3, 3, NULL, NULL, 2, 'Summer'),
(54, 'VF725', 'ipsum rerum ullam', 3, 3, NULL, NULL, 2, 'Summer'),
(55, 'MC562', 'velit modi quo', 3, 1, NULL, NULL, 5, 'Second'),
(56, 'TL749', 'vero quo odit', 3, 4, NULL, NULL, 2, 'First'),
(57, 'TR747', 'quia vitae est', 3, 1, NULL, NULL, 5, 'Second'),
(58, 'FS941', 'consequatur iure doloremque', 3, 1, NULL, NULL, 5, 'Second'),
(59, 'OL508', 'nisi quia odit', 3, 2, NULL, NULL, 5, 'Second'),
(60, 'DH506', 'exercitationem sit soluta', 2, 2, NULL, NULL, 5, 'First'),
(61, 'YV564', 'aut id in', 2, 2, NULL, NULL, 5, 'Summer'),
(62, 'HY644', 'quod iusto laudantium', 2, 3, NULL, NULL, 2, 'Second'),
(63, 'WF842', 'sit dolorum ratione', 3, 3, NULL, NULL, 2, 'First'),
(64, 'YF804', 'quidem voluptatem deserunt', 3, 1, NULL, NULL, 5, 'Second'),
(65, 'TL488', 'in excepturi et', 3, 4, NULL, NULL, 5, 'First'),
(66, 'FO063', 'aut vitae repudiandae', 2, 2, NULL, NULL, 5, 'First'),
(67, 'AJ008', 'neque quisquam qui', 3, 1, NULL, NULL, 5, 'Summer'),
(68, 'BH029', 'illo natus rerum', 2, 1, NULL, NULL, 5, 'Second'),
(69, 'GV916', 'quibusdam est consectetur', 2, 2, NULL, NULL, 2, 'Second'),
(70, 'QE677', 'iure recusandae vel', 2, 3, NULL, NULL, 5, 'First'),
(71, 'asd', 'as', 2, 1, NULL, NULL, 2, 'First'),
(73, 'dasd', 'asd', 99, 1, NULL, NULL, 5, 'First'),
(76, 'EFMN1', 'IT108', 3, 1, NULL, NULL, 5, 'First'),
(77, 'ABST1', 'IT107', 3, 1, NULL, NULL, 5, 'First'),
(79, 'AG1', 'ART APP', 3, 1, NULL, NULL, 3, 'First'),
(80, 'EFVW1', 'IT109', 3, 1, NULL, NULL, 5, 'First'),
(81, 'JKTU1', 'IT110', 3, 1, NULL, NULL, 5, 'First'),
(82, 'IN01', 'PC', 3, 1, NULL, NULL, 5, 'First'),
(83, 'R1', 'SE 105', 1, 1, NULL, NULL, 3, 'First');

-- --------------------------------------------------------

--
-- Table structure for table `subject_logs`
--

CREATE TABLE `subject_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `performed_by` varchar(255) NOT NULL,
  `action` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `credits` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `pre_requisite_subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `co_requisite_subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `weekly_hours` bigint(20) UNSIGNED NOT NULL,
  `semester` enum('First','Second','Summer') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_logs`
--

INSERT INTO `subject_logs` (`log_id`, `performed_by`, `action`, `subject_code`, `subject_name`, `credits`, `department_id`, `pre_requisite_subject_id`, `co_requisite_subject_id`, `weekly_hours`, `semester`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'INSERT', 'LC153', 'odit esse sit', 2, 2, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(2, 'Admin', 'INSERT', 'IX866', 'architecto reiciendis hic', 3, 2, NULL, NULL, 2, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(3, 'Admin', 'INSERT', 'IX801', 'molestiae qui ratione', 3, 4, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(4, 'Admin', 'INSERT', 'JR882', 'fugit dignissimos eius', 2, 2, NULL, NULL, 2, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(5, 'Admin', 'INSERT', 'PN097', 'est numquam blanditiis', 3, 4, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(6, 'Admin', 'INSERT', 'AP017', 'exercitationem ex velit', 3, 4, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(7, 'Admin', 'INSERT', 'NY192', 'deserunt consequatur unde', 2, 1, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(8, 'Admin', 'INSERT', 'IP883', 'earum voluptatem optio', 2, 4, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(9, 'Admin', 'INSERT', 'KO066', 'quasi dolor aliquid', 2, 1, NULL, NULL, 5, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(10, 'Admin', 'INSERT', 'GT515', 'autem incidunt eius', 2, 4, NULL, NULL, 2, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(11, 'Admin', 'INSERT', 'CK751', 'maxime exercitationem officiis', 2, 3, NULL, NULL, 2, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(12, 'Admin', 'INSERT', 'OU227', 'error laboriosam voluptate', 3, 3, NULL, NULL, 2, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(13, 'Admin', 'INSERT', 'FU261', 'et inventore incidunt', 2, 1, NULL, NULL, 2, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(14, 'Admin', 'INSERT', 'CC392', 'ut velit voluptates', 2, 2, NULL, NULL, 5, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(15, 'Admin', 'INSERT', 'KU214', 'et voluptatem qui', 3, 4, NULL, NULL, 5, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(16, 'Admin', 'INSERT', 'AS587', 'eos expedita eos', 2, 1, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(17, 'Admin', 'INSERT', 'SE117', 'eos molestiae debitis', 3, 1, NULL, NULL, 2, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(18, 'Admin', 'INSERT', 'SB538', 'quia soluta consequuntur', 3, 1, NULL, NULL, 2, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(19, 'Admin', 'INSERT', 'PT376', 'eos sunt quibusdam', 3, 2, NULL, NULL, 5, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(20, 'Admin', 'INSERT', 'BC339', 'et voluptatem repudiandae', 3, 2, NULL, NULL, 2, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(21, 'Admin', 'INSERT', 'VP579', 'sequi necessitatibus blanditiis', 2, 1, NULL, NULL, 5, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(22, 'Admin', 'INSERT', 'XT452', 'dolor velit voluptas', 2, 1, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(23, 'Admin', 'INSERT', 'FV424', 'temporibus facere non', 3, 2, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(24, 'Admin', 'INSERT', 'FJ675', 'dolorum nostrum sit', 2, 1, NULL, NULL, 5, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(25, 'Admin', 'INSERT', 'TM067', 'quia illo occaecati', 2, 3, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(26, 'Admin', 'INSERT', 'MP577', 'tempora modi vero', 2, 4, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(27, 'Admin', 'INSERT', 'EC775', 'sit aut blanditiis', 3, 1, NULL, NULL, 5, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(28, 'Admin', 'INSERT', 'IO822', 'sed nobis perferendis', 3, 4, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(29, 'Admin', 'INSERT', 'MU489', 'voluptates et cupiditate', 2, 4, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(30, 'Admin', 'INSERT', 'GX657', 'quia sunt deserunt', 3, 1, NULL, NULL, 2, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(31, 'Admin', 'INSERT', 'OT673', 'non veniam sint', 2, 4, NULL, NULL, 5, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(32, 'Admin', 'INSERT', 'QJ814', 'porro tempore voluptas', 2, 3, NULL, NULL, 5, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(33, 'Admin', 'INSERT', 'FN718', 'voluptatibus et ut', 3, 3, NULL, NULL, 2, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(34, 'Admin', 'INSERT', 'NB504', 'tenetur non molestiae', 3, 2, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(35, 'Admin', 'INSERT', 'OL928', 'amet fugit vel', 2, 1, NULL, NULL, 5, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(36, 'Admin', 'INSERT', 'EV312', 'est fugit illo', 3, 4, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(37, 'Admin', 'INSERT', 'ZF149', 'quo asperiores consequatur', 2, 2, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(38, 'Admin', 'INSERT', 'HT552', 'voluptas ut voluptas', 2, 4, NULL, NULL, 5, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(39, 'Admin', 'INSERT', 'UR498', 'earum tempora nesciunt', 2, 2, NULL, NULL, 5, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(40, 'Admin', 'INSERT', 'BS208', 'dolor qui quae', 3, 3, NULL, NULL, 2, 'Second', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(41, 'Admin', 'INSERT', 'SP881', 'ut debitis est', 3, 2, NULL, NULL, 5, 'First', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(42, 'Admin', 'INSERT', 'SG427', 'nisi omnis suscipit', 3, 3, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(43, 'Admin', 'INSERT', 'LL113', 'quis est atque', 3, 4, NULL, NULL, 2, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(44, 'Admin', 'INSERT', 'PO374', 'consectetur eum sunt', 2, 2, NULL, NULL, 5, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(45, 'Admin', 'INSERT', 'IC900', 'necessitatibus voluptas sed', 3, 1, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(46, 'Admin', 'INSERT', 'IH382', 'nesciunt dicta illum', 3, 1, NULL, NULL, 2, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(47, 'Admin', 'INSERT', 'WX117', 'est unde magni', 3, 1, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(48, 'Admin', 'INSERT', 'ET533', 'qui ducimus beatae', 3, 4, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(49, 'Admin', 'INSERT', 'ZM687', 'dolorem et consequuntur', 3, 2, NULL, NULL, 2, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(50, 'Admin', 'INSERT', 'FO985', 'voluptas eius modi', 3, 3, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(51, 'Admin', 'INSERT', 'JY753', 'qui cupiditate perferendis', 3, 2, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(52, 'Admin', 'INSERT', 'SQ105', 'praesentium aut ratione', 3, 4, NULL, NULL, 5, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(53, 'Admin', 'INSERT', 'QH927', 'maxime explicabo voluptatum', 3, 3, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(54, 'Admin', 'INSERT', 'VF725', 'ipsum rerum ullam', 3, 3, NULL, NULL, 2, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(55, 'Admin', 'INSERT', 'MC562', 'velit modi quo', 3, 1, NULL, NULL, 5, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(56, 'Admin', 'INSERT', 'TL749', 'vero quo odit', 3, 4, NULL, NULL, 2, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(57, 'Admin', 'INSERT', 'TR747', 'quia vitae est', 3, 1, NULL, NULL, 5, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(58, 'Admin', 'INSERT', 'FS941', 'consequatur iure doloremque', 3, 1, NULL, NULL, 5, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(59, 'Admin', 'INSERT', 'OL508', 'nisi quia odit', 3, 2, NULL, NULL, 5, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(60, 'Admin', 'INSERT', 'DH506', 'exercitationem sit soluta', 2, 2, NULL, NULL, 5, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(61, 'Admin', 'INSERT', 'YV564', 'aut id in', 2, 2, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(62, 'Admin', 'INSERT', 'HY644', 'quod iusto laudantium', 2, 3, NULL, NULL, 2, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(63, 'Admin', 'INSERT', 'WF842', 'sit dolorum ratione', 3, 3, NULL, NULL, 2, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(64, 'Admin', 'INSERT', 'YF804', 'quidem voluptatem deserunt', 3, 1, NULL, NULL, 5, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(65, 'Admin', 'INSERT', 'TL488', 'in excepturi et', 3, 4, NULL, NULL, 5, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(66, 'Admin', 'INSERT', 'FO063', 'aut vitae repudiandae', 2, 2, NULL, NULL, 5, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(67, 'Admin', 'INSERT', 'AJ008', 'neque quisquam qui', 3, 1, NULL, NULL, 5, 'Summer', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(68, 'Admin', 'INSERT', 'BH029', 'illo natus rerum', 2, 1, NULL, NULL, 5, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(69, 'Admin', 'INSERT', 'GV916', 'quibusdam est consectetur', 2, 2, NULL, NULL, 2, 'Second', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(70, 'Admin', 'INSERT', 'QE677', 'iure recusandae vel', 2, 3, NULL, NULL, 5, 'First', '2024-11-12 15:15:43', '2024-11-12 15:15:43'),
(71, 'Joseph Vistal', 'INSERT', 'test', 'creaet', 6, 2, NULL, NULL, 5, 'First', '2024-12-14 23:53:18', '2024-12-14 23:53:18'),
(72, 'Joseph Vistal', 'DELETE', 'ZM687', 'dolorem et consequuntur', 3, 2, NULL, NULL, 2, 'Second', '2024-12-14 23:57:13', '2024-12-14 23:57:13'),
(73, 'Joseph Vistal', 'INSERT', 'EFMN1', 'IT108', 3, 1, NULL, NULL, 5, 'First', '2024-12-15 02:15:54', '2024-12-15 02:15:54'),
(74, 'Joseph Vistal', 'INSERT', 'ABST1', 'IT107', 3, 1, NULL, NULL, 5, 'First', '2024-12-15 02:16:32', '2024-12-15 02:16:32'),
(75, 'Joseph Vistal', 'INSERT', 'AG1', 'ART APP', 3, 1, NULL, NULL, 3, 'First', '2024-12-15 02:17:01', '2024-12-15 02:17:01'),
(76, 'Joseph Vistal', 'DELETE', 'AG1', 'ART APP', 3, 1, NULL, NULL, 3, 'First', '2024-12-15 02:17:12', '2024-12-15 02:17:12'),
(77, 'Joseph Vistal', 'INSERT', 'AG1', 'ART APP', 3, 1, NULL, NULL, 3, 'First', '2024-12-15 02:18:01', '2024-12-15 02:18:01'),
(78, 'Joseph Vistal', 'INSERT', 'EFVW1', 'IT109', 3, 1, NULL, NULL, 5, 'First', '2024-12-15 02:18:32', '2024-12-15 02:18:32'),
(79, 'Joseph Vistal', 'INSERT', 'JKTU1', 'IT110', 3, 1, NULL, NULL, 5, 'First', '2024-12-15 02:19:24', '2024-12-15 02:19:24'),
(80, 'Joseph Vistal', 'INSERT', 'IN01', 'PC', 3, 1, NULL, NULL, 5, 'First', '2024-12-15 02:19:43', '2024-12-15 02:19:43'),
(81, 'Joseph Vistal', 'INSERT', 'R1', 'SE 105', 1, 1, NULL, NULL, 3, 'First', '2024-12-15 02:20:14', '2024-12-15 02:20:14');

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'test@example.com', '2024-11-12 15:15:41', '$2y$12$oZh3HcFyfR2XQ1MKmCz52uhQVz4hoU4TNttR9W.NTE331sHzBeAw2', 'NsRNIVDWpZsrkFWlvp1ljbzcAfPjc9gOZCEtl0nd7Q4lcAeVeAcEOVmwDTIL', '2024-11-12 15:15:42', '2024-11-12 15:15:42'),
(2, 'Joseph Vistal', 'test1@example.com', '2024-12-14 21:35:49', '$2y$12$JeZS9GcgvvJ47MKAp2SaSeTe6HZoqN6rQrCJPzYpIWxtinS3FnepC', 'mSfz3PDTFMg3TtzGUH18qyEuUm3k4ExHharXehi9foxnnnIpHtcXY1dxdMJZ', '2024-12-14 21:35:49', '2024-12-14 21:35:49');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `class_schedules_subject_id_foreign` (`subject_id`),
  ADD KEY `class_schedules_instructor_id_foreign` (`instructor_id`),
  ADD KEY `class_schedules_room_id_foreign` (`room_id`);

--
-- Indexes for table `class_schedule_logs`
--
ALTER TABLE `class_schedule_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD UNIQUE KEY `departments_department_name_unique` (`department_name`);

--
-- Indexes for table `department_logs`
--
ALTER TABLE `department_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `idx_student_id` (`student_id`);

--
-- Indexes for table `enrollment_logs`
--
ALTER TABLE `enrollment_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`instructor_id`),
  ADD UNIQUE KEY `instructors_email_unique` (`email`),
  ADD KEY `instructors_department_id_foreign` (`department_id`);

--
-- Indexes for table `instructor_logs`
--
ALTER TABLE `instructor_logs`
  ADD PRIMARY KEY (`log_id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `rooms_room_number_unique` (`room_number`);

--
-- Indexes for table `room_logs`
--
ALTER TABLE `room_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `student_logs`
--
ALTER TABLE `student_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `subjects_department_id_foreign` (`department_id`);

--
-- Indexes for table `subject_logs`
--
ALTER TABLE `subject_logs`
  ADD PRIMARY KEY (`log_id`);

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
-- AUTO_INCREMENT for table `class_schedules`
--
ALTER TABLE `class_schedules`
  MODIFY `schedule_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `class_schedule_logs`
--
ALTER TABLE `class_schedule_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `department_logs`
--
ALTER TABLE `department_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `enrollment_logs`
--
ALTER TABLE `enrollment_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `instructor_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `instructor_logs`
--
ALTER TABLE `instructor_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `room_logs`
--
ALTER TABLE `room_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `student_logs`
--
ALTER TABLE `student_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `subject_logs`
--
ALTER TABLE `subject_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD CONSTRAINT `class_schedules_instructor_id_foreign` FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`instructor_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_schedules_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `class_schedules_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE CASCADE;

--
-- Constraints for table `instructors`
--
ALTER TABLE `instructors`
  ADD CONSTRAINT `instructors_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
