-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 29, 2023 at 04:24 AM
-- Server version: 11.1.2-MariaDB
-- PHP Version: 8.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guvi`
--
CREATE DATABASE IF NOT EXISTS `guvi` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `guvi`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `dob` date DEFAULT NULL,
  `phone` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `dob`, `phone`) VALUES
(1, 'Admin', 'admin@admin.com', 'qwerty123', '2023-08-01', '8883528885'),
(7, 'thanos', 'thanos@titan.com', 'madtitan', NULL, NULL),
(8, 'Gowtham G', 'gowtham2003g@gmail.com', 'qwerty', NULL, NULL),
(9, 'Alpha', 'john@gmail.com', 'qwerty', NULL, NULL),
(10, 'Admin', 'user1@email.com', 'qwerty123', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`) USING HASH;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `mm`
--
CREATE DATABASE IF NOT EXISTS `mm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mm`;

-- --------------------------------------------------------

--
-- Table structure for table `academic`
--

CREATE TABLE `academic` (
  `uid` int(100) NOT NULL,
  `id` varchar(50) NOT NULL,
  `course` varchar(50) NOT NULL,
  `Degree` varchar(50) NOT NULL,
  `branch` varchar(60) NOT NULL,
  `iname` varchar(100) NOT NULL,
  `univ` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `mos` varchar(30) NOT NULL,
  `mes` varchar(30) NOT NULL,
  `yc` varchar(30) NOT NULL,
  `cs` varchar(30) NOT NULL,
  `score` varchar(30) NOT NULL,
  `cnum` varchar(50) NOT NULL,
  `cert` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `basic`
--

CREATE TABLE `basic` (
  `id` varchar(50) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `religion` varchar(50) NOT NULL,
  `social` varchar(50) NOT NULL,
  `caste` varchar(50) NOT NULL,
  `ms` varchar(50) NOT NULL,
  `pmc` varchar(50) NOT NULL,
  `pim1` varchar(50) NOT NULL,
  `pim2` varchar(50) NOT NULL,
  `paddress` text NOT NULL,
  `taddress` text NOT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `blood` varchar(50) NOT NULL,
  `aadhar` varchar(200) NOT NULL,
  `pan` varchar(200) NOT NULL,
  `surgery` varchar(200) NOT NULL,
  `insurance` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `course_code` varchar(12) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `semester` int(1) NOT NULL,
  `mse1` int(3) DEFAULT NULL,
  `mse2` int(3) DEFAULT NULL,
  `prep` int(3) DEFAULT NULL,
  `ese` int(3) DEFAULT NULL,
  `remarks` varchar(100) NOT NULL,
  `student_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp`
--

CREATE TABLE `exp` (
  `uid` int(200) NOT NULL,
  `id` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `iname` varchar(100) NOT NULL,
  `design` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `fromd` date NOT NULL,
  `tod` date NOT NULL,
  `exp` varchar(200) NOT NULL,
  `cert` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `uid` int(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `design` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `doj` date NOT NULL,
  `pass` varchar(50) NOT NULL,
  `cert` varchar(100) NOT NULL,
  `bc` int(200) NOT NULL,
  `ac` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`uid`, `id`, `name`, `dept`, `design`, `role`, `doj`, `pass`, `cert`, `bc`, `ac`) VALUES
(582, 'admin', '', '', '', '', '0000-00-00', 'admin', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `family`
--

CREATE TABLE `family` (
  `uid` int(200) NOT NULL,
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `relationship` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal`
--

CREATE TABLE `journal` (
  `uid` int(200) NOT NULL,
  `id` varchar(100) NOT NULL,
  `pt` varchar(100) NOT NULL,
  `jn` varchar(100) NOT NULL,
  `pn` varchar(100) NOT NULL,
  `vol` varchar(100) NOT NULL,
  `issue` varchar(100) NOT NULL,
  `pages` varchar(100) NOT NULL,
  `pissn` varchar(100) NOT NULL,
  `eissn` varchar(100) NOT NULL,
  `scope` varchar(30) NOT NULL,
  `mon` varchar(100) NOT NULL,
  `paper` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `uid` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`uid`, `pass`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `nominee`
--

CREATE TABLE `nominee` (
  `id` int(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(100) NOT NULL,
  `share` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patent`
--

CREATE TABLE `patent` (
  `uid` int(200) NOT NULL,
  `id` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `fd` date NOT NULL,
  `anum` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `noa` varchar(30) NOT NULL,
  `cert` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posting`
--

CREATE TABLE `posting` (
  `uid` int(30) NOT NULL,
  `id` varchar(30) NOT NULL,
  `level` varchar(30) NOT NULL,
  `pname` varchar(40) NOT NULL,
  `fromd` date NOT NULL,
  `tod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `punish`
--

CREATE TABLE `punish` (
  `uid` int(20) NOT NULL,
  `id` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `reason` varchar(200) NOT NULL,
  `fromd` date NOT NULL,
  `tod` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `research`
--

CREATE TABLE `research` (
  `id` varchar(30) NOT NULL,
  `oid` varchar(30) NOT NULL DEFAULT '0000-0000',
  `sid` varchar(30) NOT NULL,
  `rid` varchar(30) NOT NULL,
  `gsid` varchar(30) NOT NULL,
  `hid` varchar(30) NOT NULL,
  `iid` varchar(30) NOT NULL,
  `gi` varchar(30) NOT NULL,
  `cs` varchar(30) NOT NULL,
  `cgs` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `uid` int(30) NOT NULL,
  `id` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `no` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `fromd` date NOT NULL,
  `tod` date NOT NULL,
  `cert` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic`
--
ALTER TABLE `academic`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`course_code`);

--
-- Indexes for table `exp`
--
ALTER TABLE `exp`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `family`
--
ALTER TABLE `family`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `patent`
--
ALTER TABLE `patent`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `posting`
--
ALTER TABLE `posting`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `punish`
--
ALTER TABLE `punish`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic`
--
ALTER TABLE `academic`
  MODIFY `uid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=782;

--
-- AUTO_INCREMENT for table `exp`
--
ALTER TABLE `exp`
  MODIFY `uid` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=537;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `uid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=583;

--
-- AUTO_INCREMENT for table `family`
--
ALTER TABLE `family`
  MODIFY `uid` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=532;

--
-- AUTO_INCREMENT for table `journal`
--
ALTER TABLE `journal`
  MODIFY `uid` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patent`
--
ALTER TABLE `patent`
  MODIFY `uid` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posting`
--
ALTER TABLE `posting`
  MODIFY `uid` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;

--
-- AUTO_INCREMENT for table `punish`
--
ALTER TABLE `punish`
  MODIFY `uid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `uid` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=716;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `tih`
--
CREATE DATABASE IF NOT EXISTS `tih` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `tih`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(30) NOT NULL,
  `pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `pass`) VALUES
('admin@email.com', 'qwerty123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
