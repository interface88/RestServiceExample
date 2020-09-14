-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 14, 2020 at 07:00 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cricket`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `AUTHOR` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `ID` int(11) NOT NULL,
  `CITY_NAME` varchar(45) DEFAULT NULL,
  `STATE_ID` int(11) DEFAULT NULL,
  `STATUS` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `csc_batting_style`
--

CREATE TABLE `csc_batting_style` (
  `uuid` tinyint(4) UNSIGNED NOT NULL,
  `batting_style_name` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `csc_batting_style`
--

INSERT INTO `csc_batting_style` (`uuid`, `batting_style_name`, `is_deleted`) VALUES
(1, 'Right-handed', 0),
(2, 'Left-handed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `csc_bowling_style`
--

CREATE TABLE `csc_bowling_style` (
  `uuid` tinyint(4) UNSIGNED NOT NULL,
  `bowling_style_name` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `csc_bowling_style`
--

INSERT INTO `csc_bowling_style` (`uuid`, `bowling_style_name`, `is_deleted`) VALUES
(1, 'Right-arm fast-medium', 0),
(2, 'Right-arm medium-fast', 0),
(3, 'Right-arm medium', 0),
(4, 'Right-arm medium-slow', 0),
(5, 'Right-arm slow-medium', 0),
(6, 'Right-arm slow', 0),
(7, 'Left-arm fast-medium', 0),
(8, 'Left-arm medium-fast', 0),
(9, 'Left-arm medium', 0),
(10, 'Left-arm medium-slow', 0),
(11, 'Left-arm slow-medium', 0),
(12, 'Left-arm slow', 0),
(13, 'Right-arm Off break', 0),
(14, 'Right-arm leg break', 0),
(15, 'Slow left-arm orthodox', 0),
(16, 'Slow left-arm wrist spin', 0);

-- --------------------------------------------------------

--
-- Table structure for table `csc_player_role`
--

CREATE TABLE `csc_player_role` (
  `uuid` tinyint(4) UNSIGNED NOT NULL,
  `player_role_name` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `csc_player_role`
--

INSERT INTO `csc_player_role` (`uuid`, `player_role_name`, `is_deleted`) VALUES
(1, 'Batsman', 0),
(2, 'Bowler', 0),
(3, 'WK-Batsman', 0),
(4, 'Batting Allrounder', 0),
(5, 'Bowling Allrounder', 0);

-- --------------------------------------------------------

--
-- Table structure for table `csn_match`
--

CREATE TABLE `csn_match` (
  `uuid` int(10) UNSIGNED NOT NULL,
  `tournament_uuid` int(10) UNSIGNED DEFAULT NULL,
  `team1_uuid` int(10) UNSIGNED DEFAULT NULL,
  `team2_uuid` int(10) UNSIGNED DEFAULT NULL,
  `group_uuid` int(10) UNSIGNED DEFAULT NULL,
  `match_no` int(10) DEFAULT NULL,
  `toss_decision` varchar(20) DEFAULT NULL,
  `toss_winner_uuid` int(10) UNSIGNED DEFAULT NULL,
  `match_winner_uuid` int(10) UNSIGNED DEFAULT NULL,
  `umpires_1` varchar(45) DEFAULT NULL,
  `umpires_2` varchar(45) DEFAULT NULL,
  `umpires_3` varchar(45) DEFAULT NULL,
  `est_start_datetime` datetime DEFAULT NULL,
  `est_end_datetime` datetime DEFAULT NULL,
  `act_start_datetime` datetime DEFAULT NULL,
  `act_end_datetime` datetime DEFAULT NULL,
  `match_title` varchar(45) DEFAULT NULL,
  `scorer_uuid` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `csn_player`
--

CREATE TABLE `csn_player` (
  `uuid` int(10) UNSIGNED NOT NULL,
  `player_id` varchar(50) DEFAULT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `adhaar_number` varchar(50) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `place` varchar(500) DEFAULT NULL,
  `player_role` varchar(50) DEFAULT NULL,
  `batting_style` varchar(50) DEFAULT NULL,
  `bowling_style` varchar(50) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 1,
  `creation_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `csn_player`
--

INSERT INTO `csn_player` (`uuid`, `player_id`, `player_name`, `adhaar_number`, `mobile`, `dob`, `place`, `player_role`, `batting_style`, `bowling_style`, `is_deleted`, `creation_date`) VALUES
(1, NULL, 'Otis Kilback IV', '8011-0964-1662', '(853)498-6112x1505', '1971-09-23', 'NewJersey', 'Batsman', 'Right-handed', NULL, 1, '1989-04-06 22:13:36'),
(2, NULL, 'Philip Metz', '8950-7983-9485', '921.948.7055', '1983-08-29', 'Kentucky', 'WK-Batsman', 'Left-handed', NULL, 0, '1995-04-12 21:06:14'),
(3, NULL, 'Reinhold Schulist', '9545-7505-4405', '634.747.0523x267', '1978-12-12', 'Minnesota', 'WK-Batsman', 'Right-handed', NULL, 1, '1972-09-29 11:43:33'),
(4, NULL, 'Connie Doyle II', '9737-4626-7904', '(384)502-0902x842', '2014-09-09', 'Indiana', 'Bowler', 'Left-handed', NULL, 1, '2002-07-09 00:31:32'),
(5, NULL, 'Mr. Jordan Stamm III', '6907-8683-4978', '(091)038-0463x147', '1991-10-14', 'Hawaii', 'Batsman', 'Left-handed', NULL, 0, '1989-08-15 12:27:53'),
(6, NULL, 'Kayli Konopelski', '7118-2592-4507', '+84(8)8638532725', '1989-03-02', 'RhodeIsland', 'Batsman', 'Right-handed', NULL, 1, '1984-12-31 05:59:42'),
(7, NULL, 'Josefa Price', '3725-4847-7516', '103.245.5189x219', '1999-11-08', 'Michigan', 'WK-Batsman', 'Left-handed', NULL, 1, '2011-11-08 23:56:24'),
(8, NULL, 'Baron Thiel', '9401-0426-5079', '423-368-8207x4413', '1996-03-20', 'NewHampshire', 'Bowler', 'Left-handed', NULL, 0, '2004-05-21 14:05:33'),
(9, NULL, 'Dr. Sigurd Christiansen DDS', '4837-5274-9459', '909.866.5610x7746', '1995-01-15', 'Virginia', 'WK-Batsman', 'Right-handed', NULL, 0, '2012-07-16 11:07:48'),
(10, NULL, 'Dr. Zelda Medhurst IV', '9058-8141-5559', '1-028-894-7231x50261', '2002-05-25', 'Massachusetts', 'Batsman', 'Left-handed', NULL, 0, '1984-01-02 20:42:32'),
(11, NULL, 'Dana Hodkiewicz', '7601-0295-5010', '09144691082', '1981-09-16', 'NewYork', 'Batsman', 'Right-handed', NULL, 1, '1977-12-16 01:45:36'),
(12, NULL, 'Mr. Colby Batz IV', '5349-9144-6115', '(414)201-5382x31059', '2008-03-30', 'Michigan', 'Bowler', 'Left-handed', NULL, 1, '1988-11-15 06:35:43'),
(13, NULL, 'Jasen Kulas DDS', '3724-9653-4284', '721.607.0809x1627', '1987-05-16', 'Texas', 'WK-Batsman', 'Left-handed', NULL, 0, '1985-04-04 17:19:57'),
(14, NULL, 'Dr. Nayeli Reynolds DVM', '2585-5713-3311', '1-571-381-4961', '1978-09-29', 'Oregon', 'Batsman', 'Left-handed', NULL, 1, '1990-08-05 04:33:26'),
(15, NULL, 'Vaughn Wolff', '3517-4292-8453', '+02(8)4188285937', '2012-09-08', 'Arkansas', 'WK-Batsman', 'Right-handed', NULL, 0, '2009-12-15 00:58:59'),
(16, NULL, 'Jordon Hyatt', '8873-2287-3929', '1-024-925-5281x39502', '2003-07-11', 'SouthCarolina', 'WK-Batsman', 'Right-handed', NULL, 1, '2012-07-12 18:22:43'),
(17, NULL, 'Dr. Jannie Schaefer Sr.', '9265-1563-1706', '578.437.4825', '1980-03-12', 'Montana', 'Bowler', 'Right-handed', NULL, 1, '2009-10-02 02:01:19'),
(18, NULL, 'Jazmyn Kuhic', '7671-9056-0882', '655.507.2008x2668', '1992-01-03', 'Arkansas', 'WK-Batsman', 'Right-handed', NULL, 1, '1973-02-06 23:22:15'),
(19, NULL, 'Kavon Nader', '4020-3770-2065', '409.750.7262x535', '2017-12-28', 'Minnesota', 'WK-Batsman', 'Right-handed', NULL, 0, '2014-10-02 18:27:46'),
(20, NULL, 'Sydnie Mayert', '1385-5044-3849', '388.533.0158x9949', '2014-08-23', 'Illinois', 'Batsman', 'Left-handed', NULL, 0, '1976-07-26 16:49:39'),
(21, NULL, 'Clementine Gleason', '0471-4920-1088', '816-543-0318', '2005-01-05', 'Missouri', 'WK-Batsman', 'Left-handed', NULL, 1, '2017-08-06 21:07:56'),
(22, NULL, 'Dr. Alejandrin Abshire', '8586-2162-6868', '1-738-171-7084x50874', '2004-06-27', 'Georgia', 'Batsman', 'Left-handed', NULL, 1, '2016-04-08 05:28:20'),
(23, NULL, 'Vilma Heller MD', '1087-0907-2580', '1-259-902-6880', '1986-04-21', 'SouthDakota', 'WK-Batsman', 'Right-handed', NULL, 0, '2002-01-19 17:00:27'),
(24, NULL, 'Brett Koss', '2965-5997-4102', '(326)765-9438', '1979-03-06', 'NorthDakota', 'Batsman', 'Left-handed', NULL, 0, '2019-06-27 17:54:15'),
(25, NULL, 'Dr. Gage Pollich MD', '5170-4791-1144', '961.284.3893x717', '1991-06-21', 'Texas', 'Bowler', 'Left-handed', NULL, 0, '2001-07-10 06:10:50');

-- --------------------------------------------------------

--
-- Table structure for table `csn_team`
--

CREATE TABLE `csn_team` (
  `uuid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL,
  `creationdate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `csn_team`
--

INSERT INTO `csn_team` (`uuid`, `name`, `place`, `creationdate`) VALUES
(1, 'Team 1', 'mumbai', '2020-09-13 22:21:35'),
(2, 'TEAM3', 'andheri', '2020-09-13 22:43:05'),
(3, '', '', '2020-09-13 23:09:36');

-- --------------------------------------------------------

--
-- Table structure for table `csn_team_group`
--

CREATE TABLE `csn_team_group` (
  `uuid` int(10) UNSIGNED NOT NULL,
  `tournament_uuid` int(10) UNSIGNED DEFAULT NULL,
  `team_uuid` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `csn_team_players`
--

CREATE TABLE `csn_team_players` (
  `uuid` int(10) NOT NULL,
  `team_uuid` int(10) UNSIGNED DEFAULT NULL,
  `player_uuid` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `csn_team_players`
--

INSERT INTO `csn_team_players` (`uuid`, `team_uuid`, `player_uuid`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `csn_tournament`
--

CREATE TABLE `csn_tournament` (
  `uuid` int(10) UNSIGNED NOT NULL,
  `tournament_name` varchar(200) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `place` varchar(45) DEFAULT NULL,
  `creationdate` datetime DEFAULT current_timestamp(),
  `organiser` varchar(200) DEFAULT NULL,
  `tournament_type` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `CUSTOMER_NAME` varchar(45) DEFAULT NULL,
  `EMAIL` varchar(105) DEFAULT NULL,
  `PHONE` varchar(45) DEFAULT NULL,
  `ZIPFILE` varchar(300) DEFAULT NULL,
  `CITY_ID` int(11) DEFAULT NULL,
  `CREATED_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_product`
--

CREATE TABLE `customer_product` (
  `ZIP_FILE` varchar(100) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_scenario`
--

CREATE TABLE `customer_scenario` (
  `CUSTOMER_ID` int(11) NOT NULL,
  `SCENARIO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_token`
--

CREATE TABLE `password_reset_token` (
  `ID` int(11) NOT NULL,
  `TOKEN` varchar(200) NOT NULL,
  `USER_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(45) DEFAULT NULL,
  `PRODUCT_NO` varchar(45) DEFAULT NULL,
  `PRODUCT_TYPE` varchar(45) DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(200) DEFAULT NULL,
  `STATUS` int(1) NOT NULL,
  `PRODUCT_CODE` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_city`
--

CREATE TABLE `product_city` (
  `PRODUCT_ID` int(11) NOT NULL,
  `CITY_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_scenario`
--

CREATE TABLE `product_scenario` (
  `PRODUCT_ID` int(11) NOT NULL,
  `SCENARIO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_state`
--

CREATE TABLE `product_state` (
  `PRODUCT_ID` int(11) NOT NULL,
  `STATE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scenario`
--

CREATE TABLE `scenario` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `ID` int(11) NOT NULL,
  `STATE_NAME` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(45) DEFAULT NULL,
  `PHONE` varchar(20) NOT NULL,
  `EMPLOYEE_ID` varchar(45) DEFAULT NULL,
  `ROLE` varchar(50) DEFAULT NULL,
  `CITY_ID` int(11) DEFAULT NULL,
  `STATUS` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `NAME`, `PASSWORD`, `EMAIL`, `PHONE`, `EMPLOYEE_ID`, `ROLE`, `CITY_ID`, `STATUS`) VALUES
(1, 'admin', '$2a$10$U2VwCltcmcaDCuKMG64etOEwyNR81KcUOZrirHt0VUalM87iWsTBu', 'vcrona@example.org', '9928522816', '5', 'ADMIN', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_1_idx` (`STATE_ID`);

--
-- Indexes for table `csc_batting_style`
--
ALTER TABLE `csc_batting_style`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `csc_bowling_style`
--
ALTER TABLE `csc_bowling_style`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `csc_player_role`
--
ALTER TABLE `csc_player_role`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `csn_match`
--
ALTER TABLE `csn_match`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `fk1_csn_match_idx` (`team1_uuid`),
  ADD KEY `fk2_csn_match_idx` (`team2_uuid`),
  ADD KEY `fk3_csn_match_idx` (`group_uuid`),
  ADD KEY `fk4_csn_match_idx` (`toss_winner_uuid`),
  ADD KEY `fk5_csn_match_idx` (`match_winner_uuid`),
  ADD KEY `fk6_csn_match_idx` (`tournament_uuid`);

--
-- Indexes for table `csn_player`
--
ALTER TABLE `csn_player`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `adhaar_number_UNIQUE` (`adhaar_number`),
  ADD KEY `fk1_csn_player_idx` (`player_role`),
  ADD KEY `fk2_csn_player_idx` (`batting_style`),
  ADD KEY `fk3_csn_player_idx` (`bowling_style`);

--
-- Indexes for table `csn_team`
--
ALTER TABLE `csn_team`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `csn_team_group`
--
ALTER TABLE `csn_team_group`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `fk1_csn_team_group_idx` (`team_uuid`),
  ADD KEY `fk2_csn_team_group_idx` (`tournament_uuid`);

--
-- Indexes for table `csn_team_players`
--
ALTER TABLE `csn_team_players`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `fk1_csn_team_players_idx` (`team_uuid`),
  ADD KEY `csn_team_players_idx` (`player_uuid`);

--
-- Indexes for table `csn_tournament`
--
ALTER TABLE `csn_tournament`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_5_idx` (`CITY_ID`);

--
-- Indexes for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product_city`
--
ALTER TABLE `product_city`
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`),
  ADD KEY `CITY_ID` (`CITY_ID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scenario`
--
ALTER TABLE `scenario`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_4_idx` (`CITY_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `csn_player`
--
ALTER TABLE `csn_player`
  MODIFY `uuid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `csn_team`
--
ALTER TABLE `csn_team`
  MODIFY `uuid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `csn_team_group`
--
ALTER TABLE `csn_team_group`
  MODIFY `uuid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `csn_team_players`
--
ALTER TABLE `csn_team_players`
  MODIFY `uuid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scenario`
--
ALTER TABLE `scenario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `FK_1` FOREIGN KEY (`STATE_ID`) REFERENCES `state` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `csn_team_group`
--
ALTER TABLE `csn_team_group`
  ADD CONSTRAINT `fk2_csn_team_group` FOREIGN KEY (`tournament_uuid`) REFERENCES `csn_tournament` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_5` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_city`
--
ALTER TABLE `product_city`
  ADD CONSTRAINT `product_city_city_FK` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`ID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_4` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
