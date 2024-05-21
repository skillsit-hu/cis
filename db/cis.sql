-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Apr 21, 2024 at 10:07 AM
-- Server version: 11.2.2-MariaDB-1:11.2.2+maria~ubu2204
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cis`
--

-- --------------------------------------------------------

--
-- Table structure for table `aspect`
--

CREATE TABLE `aspect` (
  `type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL,
  `max_mark` decimal(10,2) NOT NULL,
  `number` int(11) NOT NULL,
  `requirements` varchar(255) DEFAULT NULL,
  `name_id` int(11) NOT NULL,
  `sub_criterion_id` int(11) NOT NULL,
  `wsss_id` int(11) DEFAULT NULL,
  `calculation_id` int(11) DEFAULT NULL,
  `requirements_num` decimal(19,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aspect_description_line`
--

CREATE TABLE `aspect_description_line` (
  `aspect_id` int(11) NOT NULL,
  `description_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_photo`
--

CREATE TABLE `assessment_photo` (
  `id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `image_type` varchar(10) NOT NULL,
  `sub_criterion_id` int(11) NOT NULL,
  `competitor_id` int(11) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `photographer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_event`
--

CREATE TABLE `audit_event` (
  `id` bigint(20) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `aspect_id` int(11) DEFAULT NULL,
  `category` varchar(50) NOT NULL,
  `competitor_id` int(11) DEFAULT NULL,
  `criterion_id` int(11) DEFAULT NULL,
  `object_id` bigint(20) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL,
  `sub_criterion_id` int(11) DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `user_person_id` int(11) DEFAULT NULL,
  `source` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_event_data`
--

CREATE TABLE `audit_event_data` (
  `id` bigint(20) NOT NULL,
  `name` varchar(60) NOT NULL,
  `num_value` decimal(19,2) DEFAULT NULL,
  `string_value` varchar(255) DEFAULT NULL,
  `audit_event_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `best_of_nation`
--

CREATE TABLE `best_of_nation` (
  `id` int(11) NOT NULL,
  `competitor_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calculation`
--

CREATE TABLE `calculation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `skill_id` int(11) NOT NULL,
  `reusable` char(1) NOT NULL,
  `type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calculation_param_value`
--

CREATE TABLE `calculation_param_value` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `num_value` decimal(19,8) DEFAULT NULL,
  `string_value` varchar(255) DEFAULT NULL,
  `calculation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competition_day`
--

CREATE TABLE `competition_day` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `day` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competitor_marking_group`
--

CREATE TABLE `competitor_marking_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `competitor_marking_grp_prtcpnt`
--

CREATE TABLE `competitor_marking_grp_prtcpnt` (
  `competitor_group_id` int(11) NOT NULL,
  `competitor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `config_key` varchar(50) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`config_key`, `value`) VALUES
('AUDIT_MARKING', 'true'),
('AUDIT_MARK_LOCKING', 'true'),
('BRONZE_MEDAL_POINTS', '2'),
('BUILD_NUM', '877'),
('BUILD_VERSION', '5.0.5'),
('COMPETITION_NAME', 'Competition Information System (CIS)'),
('COMPETITOR_SORT', 'org.worldskills.cis.model.person.ParticipantNameComparator'),
('CONTENT_PATH', '/app/content/cis/'),
('DEFAULT_LANGUAGE', 'en'),
('EX_AEQUO', '2'),
('GOLD_MEDAL_POINTS', '4'),
('JUDGEMENT_BENCHMARKS_MANDATORY', 'true'),
('MAX_ASPECT_MARK', '2'),
('MAX_ASSESSMENT_PHOTOS', '4'),
('MEDALLION_MEDAL_POINTS', '1'),
('RESULT_CALC', 'org.worldskills.cis.service.results.calculator.WorldSkillsScaleCalculator'),
('SAME_DAYS_FOR_ALL_SKILLS', 'true'),
('SILVER_MEDAL_POINTS', '3');

-- --------------------------------------------------------

--
-- Table structure for table `criterion`
--

CREATE TABLE `criterion` (
  `id` int(11) NOT NULL,
  `max_mark` decimal(10,2) NOT NULL,
  `identifier_id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `criterion_identifier`
--

CREATE TABLE `criterion_identifier` (
  `id` int(11) NOT NULL,
  `label` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criterion_identifier`
--

INSERT INTO `criterion_identifier` (`id`, `label`) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E'),
(6, 'F'),
(7, 'G'),
(8, 'H'),
(9, 'I');

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOG`
--

CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DATABASECHANGELOG`
--

INSERT INTO `DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
('1490793109903-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 1, 'EXECUTED', '8:1b7fb96ac99f856548933f410c71fac3', 'createTable tableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 2, 'EXECUTED', '8:3873dc4a2521ee03519d1871ec490c57', 'createTable tableName=aspect_description_line', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 3, 'EXECUTED', '8:1ce664ee650991e0acb5abe67cf779b5', 'createTable tableName=competition_day', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-4', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 4, 'EXECUTED', '8:243f77563d97071a8c462805ff52720a', 'createTable tableName=competitor_marking_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-5', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 5, 'EXECUTED', '8:91833ef33bb527a3958b0e8827d5b5cd', 'createTable tableName=competitor_marking_grp_prtcpnt', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-6', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 6, 'EXECUTED', '8:040dfe042f83cee90f955244ec22498a', 'createTable tableName=config', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-7', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 7, 'EXECUTED', '8:c758cd38370af33cb2f9c977ac5522b4', 'createTable tableName=criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-8', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 8, 'EXECUTED', '8:b03c7e307f278a985fe22358575c1c35', 'createTable tableName=criterion_identifier', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-9', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 9, 'EXECUTED', '8:21eefcf5d68b8db976452f369e442766', 'createTable tableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-10', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 10, 'EXECUTED', '8:9960dceb9da472787153a9c89d38cd21', 'createTable tableName=i18n_value', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-11', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 11, 'EXECUTED', '8:1c09f73acbcf5bb0a0500ba8c7bc63c0', 'createTable tableName=judgement_benchmark', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-12', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 12, 'EXECUTED', '8:7536cb25af6bb70506f4937986dddda4', 'createTable tableName=marking_day', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-13', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 13, 'EXECUTED', '8:d72f90316fc70acf7b5dd659efd532fd', 'createTable tableName=marking_day_competitor', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-14', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 14, 'EXECUTED', '8:fd905119c6d5449bbd8e674aa3ca7695', 'createTable tableName=marking_day_competitor_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-15', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 15, 'EXECUTED', '8:75eacc2915d30aa578e46aebb3fbcb6b', 'createTable tableName=marking_team', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-16', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:10', 16, 'EXECUTED', '8:479941b72feefb3ad5c2b21bd257fba5', 'createTable tableName=member', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-17', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 17, 'EXECUTED', '8:e1bfab29776566c93757731daa2d8fd4', 'createTable tableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-18', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 18, 'EXECUTED', '8:f9bcf5d5a19f118b4cb3a7b6b0fea30f', 'createTable tableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-19', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 19, 'EXECUTED', '8:4346c116f78650fbc0e09fb07423b674', 'createTable tableName=person_position', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-20', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 20, 'EXECUTED', '8:29dcb5a653ac5d411b06e358666b7883', 'createTable tableName=person_team', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-21', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 21, 'EXECUTED', '8:def436658fb632284692247de02b125d', 'createTable tableName=position', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-22', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 22, 'EXECUTED', '8:60b725b89c31807e8997b1d37f9c1102', 'createTable tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-23', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 23, 'EXECUTED', '8:c37309a623b2dad089bde4abcd6a7cb7', 'createTable tableName=sub_criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-24', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 24, 'EXECUTED', '8:76a7a4a5c2552ff252dc560e59e46039', 'createTable tableName=team', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-25', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 25, 'EXECUTED', '8:a067dd9ac20b417cbfb35abbaef0facc', 'createTable tableName=user', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-26', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 26, 'EXECUTED', '8:a0619a619fd6434607f51cbf6cd12acd', 'createTable tableName=user_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-27', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 27, 'EXECUTED', '8:9d32ace58d1dccc086f3d313baf31268', 'createTable tableName=user_group_permission', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-29', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 28, 'EXECUTED', '8:3f2c90bf23644cb2afb13fa4b47d66a6', 'createTable tableName=ws_standards_spec', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-30', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 29, 'EXECUTED', '8:10f0d8d79fde3de35af5cab210e0b6e8', 'addPrimaryKey constraintName=PRIMARY_MKG_DY_PRTCPNT, tableName=competitor_marking_grp_prtcpnt', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-32', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 30, 'EXECUTED', '8:c7d3a9b908117a937ec4b158a8f4e4e5', 'addPrimaryKey constraintName=PRIMARY_MKG_DY_PR_CMPTTR, tableName=marking_day_competitor', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-33', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 31, 'EXECUTED', '8:c78883bc8d0d2f090019251638924c7b', 'addPrimaryKey constraintName=PRIMARY_MKG_DY_PR_CMPTTR_GROUP, tableName=marking_day_competitor_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-34', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 32, 'EXECUTED', '8:58dc2257279244bf08b4c4ff1369ae28', 'addPrimaryKey constraintName=PRIMARY_MKG_TEAM, tableName=marking_team', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-35', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 33, 'EXECUTED', '8:fc6122c816be9a0930a0d8fbdad8bbdf', 'addPrimaryKey constraintName=PRIMARY_PERSON, tableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-36', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 34, 'EXECUTED', '8:b8cef6d06f9531142cd55305f9460f18', 'addPrimaryKey constraintName=PRIMARY_TEAM, tableName=team', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-38', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 35, 'EXECUTED', '8:e71ecdc8bcf0a9f11a6c2625ee5e0ae3', 'addUniqueConstraint constraintName=UK_2uqie8uyb5omtohxlvyvf083l, tableName=aspect_description_line', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-39', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 36, 'EXECUTED', '8:ac150f3dbea8adb629c5c7185068a69f', 'addUniqueConstraint constraintName=UK_4khba0d7ikbnm1uilh1po0u0c, tableName=member', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-40', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 37, 'EXECUTED', '8:09de673c8406d032f6aac6ce428a0c22', 'addUniqueConstraint constraintName=UK_jblki35ho9s833vqbk41071wx, tableName=competitor_marking_grp_prtcpnt', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-41', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 38, 'EXECUTED', '8:a373724da3ae45499c20c5ddaa4ee72e', 'addUniqueConstraint constraintName=UK_k0t32vjx93gttjmn2e7tkiih5, tableName=person_team', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-42', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:11', 39, 'EXECUTED', '8:0975b06411f1219d69f7472b365e1430', 'addUniqueConstraint constraintName=UK_soixu6c84j0y1prr6mudyd1i7, tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-43', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 40, 'EXECUTED', '8:032e7378d739273202e8ed6b7cdbddd3', 'addUniqueConstraint constraintName=unique_crit, tableName=criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-44', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 41, 'EXECUTED', '8:7e4cc7e99e8d9991b656f68a56275435', 'addUniqueConstraint constraintName=unique_sub_crit, tableName=sub_criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-45', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 42, 'EXECUTED', '8:2a1458969186d098080096fc50d9c253', 'createIndex indexName=FK10i2g9xah3t03t5v1hw51qxei, tableName=marking_day_competitor', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-47', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 43, 'EXECUTED', '8:7e6f88b3d81c569548666fa8d45feabf', 'createIndex indexName=FK2fxw850svhvu9sn960y806g10, tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-48', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 44, 'EXECUTED', '8:2ebfe362fbb91c3f33a41ea6cd6b59a2', 'createIndex indexName=FK2iou7wnyynxp5vn9wsf7g1uma, tableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-49', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 45, 'EXECUTED', '8:28bd20e6b12725440dc4987c668e4850', 'createIndex indexName=FK2ni00q8ss18u74od04nxmme5b, tableName=aspect_description_line', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-50', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 46, 'EXECUTED', '8:c676eab2f9d55a9b88ff65d03246e345', 'createIndex indexName=FK3pe7pt2hjb0cwvj7owtjx37rs, tableName=marking_day', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-51', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 47, 'EXECUTED', '8:e951983ffa7f3e6d1c245cc942139865', 'createIndex indexName=FK4299ch3ts73vy5xhxnbh95chl, tableName=person_position', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-52', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 48, 'EXECUTED', '8:de191377d63d20601c1f5e05d014e460', 'createIndex indexName=FK5ixd8ou7x5sln7b00u8qpf7il, tableName=user', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-53', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 49, 'EXECUTED', '8:7d02df00a6480f4d7b2c1728ecceeb92', 'createIndex indexName=FK5lk1pv04dox17jon7ecbvtrhf, tableName=team', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-54', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 50, 'EXECUTED', '8:4ee2ca93c0e37496c9d0c3b3aa5832ab', 'createIndex indexName=FK5nm4b09lhr8moaj39v27icmn5, tableName=person_team', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-55', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 51, 'EXECUTED', '8:3eff254bdec512efb33bcb0c7f56f188', 'createIndex indexName=FK5y0une17prgaxg9bl0rmyn8ex, tableName=person_position', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-56', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 52, 'EXECUTED', '8:7cb1330563816ab41b52e8a334c91b19', 'createIndex indexName=FK7yqv4a643014ckw2rhy8o09pd, tableName=marking_day_competitor', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-57', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 53, 'EXECUTED', '8:bf793d8a6fbefe0a7e0963266fe10b78', 'createIndex indexName=FK9g55jvjikumoweek1r0tbyug8, tableName=ws_standards_spec', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-58', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 54, 'EXECUTED', '8:4353611643a833d442911d201a5f3972', 'createIndex indexName=FK9knyhj7va7v2v68r7ux2h17j2, tableName=ws_standards_spec', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-59', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 55, 'EXECUTED', '8:fac36296c0cd9b6f3ac6548ed665b4be', 'createIndex indexName=FKajw2nx6nf0hg97bnx6hudcnc2, tableName=sub_criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-60', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 56, 'EXECUTED', '8:fe8f1999257ed12b7daddc80fba7bcae', 'createIndex indexName=FKb6un9rge8tdk8gd8g72boxran, tableName=criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-61', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 57, 'EXECUTED', '8:019ca430740c0f7b3948d6948b4a0f67', 'createIndex indexName=FKbxx22k21kypsusuln400velnd, tableName=member', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-62', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 58, 'EXECUTED', '8:e333f13350f0e071cf1b6bb2d948555d', 'createIndex indexName=FKcblkw67ea4gic20mqvl4xws6j, tableName=marking_team', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-63', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 59, 'EXECUTED', '8:54c696637d121a8e5e329efa3a03b0a6', 'createIndex indexName=FKccuvm8tti18uolgu6dk9pyole, tableName=competitor_marking_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-64', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:12', 60, 'EXECUTED', '8:d30027a32a8ff33dcb5b07ddc5661839', 'createIndex indexName=FKecxityxpbiwqo3q5vaudn65r0, tableName=i18n_value', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-65', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 61, 'EXECUTED', '8:97c6a978eeca61e345076c8763aa83a6', 'createIndex indexName=FKed1155tlwpeoafxw7pnpflxew, tableName=marking_day_competitor_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-66', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 62, 'EXECUTED', '8:cc4d1c7b19e06c0a239e0a8f96c3a15d', 'createIndex indexName=FKfgkrex0l1myaiqahk9c5c583b, tableName=person_position', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-67', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 63, 'EXECUTED', '8:2db98c049fd4f4191dbcb3406d4d29d8', 'createIndex indexName=FKifgs3616jk0p80k4udg4x0004, tableName=criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-68', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 64, 'EXECUTED', '8:08a7dfb48a685b9c8e5c0678510d0a34', 'createIndex indexName=FKir5g7yucydevmmc84i788jp79, tableName=user', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-69', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 65, 'EXECUTED', '8:443e740bdc103790fad7f79ad140eca1', 'createIndex indexName=FKj3v9n6oldeiqq7m6eo7b6urkb, tableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-70', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 66, 'EXECUTED', '8:cf3d6cda6d368ca3910fbc0cfe2e13d8', 'createIndex indexName=FKjoyd6ggs7omhd9dlbxjy94t7y, tableName=judgement_benchmark', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-72', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 67, 'EXECUTED', '8:0ffab11dca2bc9aa2882f54cf5920a46', 'createIndex indexName=FKl9cndlh233d9s05rdv573uhxb, tableName=position', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-73', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 68, 'EXECUTED', '8:4131ae35efa9e388d87d3b4504e290c0', 'createIndex indexName=FKlskpjwxwwoex7awg7bdvfuewl, tableName=judgement_benchmark', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-74', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 69, 'EXECUTED', '8:147a4f2bed2867cfcda0370b2c9c2beb', 'createIndex indexName=FKltl2dk33cemkl32l5fo3jmh85, tableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-75', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 70, 'EXECUTED', '8:bd15632482d43ad388d80f69b200bca2', 'createIndex indexName=FKmfqmig30nlsl1k619y63d4sd9, tableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-76', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 71, 'EXECUTED', '8:646447353287890e651afe7696074e62', 'createIndex indexName=FKpfqtuqg16qnynb1iju05ytu2k, tableName=marking_day_competitor_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-77', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 72, 'EXECUTED', '8:4653b79bea1c9b83ea2d3dc088ddbf30', 'createIndex indexName=FKptqyda8eyieonxvrpe5wk0qhh, tableName=marking_day', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-78', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 73, 'EXECUTED', '8:07e2ce0237404612409513835639c70d', 'createIndex indexName=FKpvewqags2qqto6e9afvwadde, tableName=user_group_permission', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-79', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 74, 'EXECUTED', '8:1f9364f51e2671fdfe12480eb91fc920', 'createIndex indexName=FKrhgi5skjx3fkywbfa27fs32nl, tableName=sub_criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-80', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 75, 'EXECUTED', '8:8f82edfb8747342b953efe2d192f5978', 'addForeignKeyConstraint baseTableName=marking_day_competitor, constraintName=FK10i2g9xah3t03t5v1hw51qxei, referencedTableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-82', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 76, 'EXECUTED', '8:d1227f89a033d540a153a97aa56fedd1', 'addForeignKeyConstraint baseTableName=marking_day_competitor, constraintName=FK1t7qcwdixqjon49yl6bbg9l39, referencedTableName=marking_day', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-83', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 77, 'EXECUTED', '8:61c1f6ee8642606204e61abf2414404f', 'addForeignKeyConstraint baseTableName=skill, constraintName=FK2fxw850svhvu9sn960y806g10, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-84', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 78, 'EXECUTED', '8:74216dc03df6cab64deada589aae2fa1', 'addForeignKeyConstraint baseTableName=aspect, constraintName=FK2iou7wnyynxp5vn9wsf7g1uma, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-85', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 79, 'EXECUTED', '8:81976ab0eac4ea00bc6c7e689318c192', 'addForeignKeyConstraint baseTableName=aspect_description_line, constraintName=FK2ni00q8ss18u74od04nxmme5b, referencedTableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-86', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:13', 80, 'EXECUTED', '8:1b4e955f64427cf732a526adafe1f3c9', 'addForeignKeyConstraint baseTableName=marking_day, constraintName=FK3pe7pt2hjb0cwvj7owtjx37rs, referencedTableName=competition_day', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-87', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 81, 'EXECUTED', '8:9882f02204037178a36420f8bee281e7', 'addForeignKeyConstraint baseTableName=aspect_description_line, constraintName=FK3qev8hy07prmrbyt57p8w9d3d, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-88', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 82, 'EXECUTED', '8:6f84a6659a3da508746b24ac7a94fd5c', 'addForeignKeyConstraint baseTableName=person_position, constraintName=FK4299ch3ts73vy5xhxnbh95chl, referencedTableName=position', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-89', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 83, 'EXECUTED', '8:177fdb04f9ddaff8dc2dfda026fbf1f3', 'addForeignKeyConstraint baseTableName=person_team, constraintName=FK4n0ts32m2ffsjoyp98isswvdx, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-90', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 84, 'EXECUTED', '8:679396bb4452d0eedea79853af8988a5', 'addForeignKeyConstraint baseTableName=user, constraintName=FK5ixd8ou7x5sln7b00u8qpf7il, referencedTableName=user_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-91', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 85, 'EXECUTED', '8:cca2acb574bdebb8ca7ad8603f9be8b0', 'addForeignKeyConstraint baseTableName=team, constraintName=FK5lk1pv04dox17jon7ecbvtrhf, referencedTableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-92', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 86, 'EXECUTED', '8:be8ff7025cde0a0a2b71918fed3e1608', 'addForeignKeyConstraint baseTableName=person_team, constraintName=FK5nm4b09lhr8moaj39v27icmn5, referencedTableName=team', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-93', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 87, 'EXECUTED', '8:bbe43a67572c40f5bdafd04fbd0a9947', 'addForeignKeyConstraint baseTableName=person_position, constraintName=FK5y0une17prgaxg9bl0rmyn8ex, referencedTableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-94', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 88, 'EXECUTED', '8:e8935bde9e49f42b499046815a6093cb', 'addForeignKeyConstraint baseTableName=criterion, constraintName=FK60gp1wq1u80n4rpk60y39fy8a, referencedTableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-95', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 89, 'EXECUTED', '8:39935c827af4afc7b68394fa521c6e75', 'addForeignKeyConstraint baseTableName=marking_day_competitor, constraintName=FK7yqv4a643014ckw2rhy8o09pd, referencedTableName=competition_day', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-96', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 90, 'EXECUTED', '8:37055d707c448c7d8eba4ce5f27d397e', 'addForeignKeyConstraint baseTableName=competitor_marking_grp_prtcpnt, constraintName=FK8jbji31h4elkoovscdm021sy4, referencedTableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-97', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 91, 'EXECUTED', '8:72b35b8d5f7e5fa2f105dcd1c566663f', 'addForeignKeyConstraint baseTableName=person, constraintName=FK99fhoaemh8dht5bk13m3snhw2, referencedTableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-98', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 92, 'EXECUTED', '8:e9f0e01155231376a637c0a7ca262121', 'addForeignKeyConstraint baseTableName=ws_standards_spec, constraintName=FK9g55jvjikumoweek1r0tbyug8, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-99', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 93, 'EXECUTED', '8:947f3644f6bccd9bad39270025671e4b', 'addForeignKeyConstraint baseTableName=ws_standards_spec, constraintName=FK9knyhj7va7v2v68r7ux2h17j2, referencedTableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-100', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 94, 'EXECUTED', '8:c60408551f2d1d94786851938d0cc0d5', 'addForeignKeyConstraint baseTableName=sub_criterion, constraintName=FKa9l63ovehm9fx8c0h2kmmsh3r, referencedTableName=criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-101', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 95, 'EXECUTED', '8:15f57f70fb1a60722e304ade0a05a153', 'addForeignKeyConstraint baseTableName=team, constraintName=FKaa8qsbvh4jltjbk4jdce41851, referencedTableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-102', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 96, 'EXECUTED', '8:a1910efd6aef26341c145603c8d635b5', 'addForeignKeyConstraint baseTableName=sub_criterion, constraintName=FKajw2nx6nf0hg97bnx6hudcnc2, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-103', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:14', 97, 'EXECUTED', '8:9cda398eca6f420fd687b40db2f1766e', 'addForeignKeyConstraint baseTableName=criterion, constraintName=FKb6un9rge8tdk8gd8g72boxran, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-104', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 98, 'EXECUTED', '8:b8ed75f95ed52b4986b24d619ac5337f', 'addForeignKeyConstraint baseTableName=member, constraintName=FKbxx22k21kypsusuln400velnd, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-105', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 99, 'EXECUTED', '8:7fef06bb6b0b5debe98febd27f4188a2', 'addForeignKeyConstraint baseTableName=marking_team, constraintName=FKcblkw67ea4gic20mqvl4xws6j, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-106', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 100, 'EXECUTED', '8:2bc7ca449d1275615db8d3d0ef50c37f', 'addForeignKeyConstraint baseTableName=competitor_marking_group, constraintName=FKccuvm8tti18uolgu6dk9pyole, referencedTableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-107', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 101, 'EXECUTED', '8:257b4778b2b3cf2a3b1eacdbce7d37bc', 'addForeignKeyConstraint baseTableName=i18n_value, constraintName=FKecxityxpbiwqo3q5vaudn65r0, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-108', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 102, 'EXECUTED', '8:64d2926b7542f323b571fc6d5d0c79ae', 'addForeignKeyConstraint baseTableName=marking_day_competitor_group, constraintName=FKed1155tlwpeoafxw7pnpflxew, referencedTableName=competition_day', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-109', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 103, 'EXECUTED', '8:4067663e003a3245e925cd76e580eafb', 'addForeignKeyConstraint baseTableName=person_position, constraintName=FKfgkrex0l1myaiqahk9c5c583b, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-110', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 104, 'EXECUTED', '8:77f01ac7d9dbb857e9002b3513a30445', 'addForeignKeyConstraint baseTableName=criterion, constraintName=FKifgs3616jk0p80k4udg4x0004, referencedTableName=criterion_identifier', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-111', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 105, 'EXECUTED', '8:8bfac60266a4e894d700d90a43d1b61b', 'addForeignKeyConstraint baseTableName=user, constraintName=FKir5g7yucydevmmc84i788jp79, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-112', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 106, 'EXECUTED', '8:c0a16dc288d43b288791001cadf49d01', 'addForeignKeyConstraint baseTableName=aspect, constraintName=FKj3v9n6oldeiqq7m6eo7b6urkb, referencedTableName=ws_standards_spec', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-113', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 107, 'EXECUTED', '8:2c868a9923e121dce128e420aea683b5', 'addForeignKeyConstraint baseTableName=judgement_benchmark, constraintName=FKjoyd6ggs7omhd9dlbxjy94t7y, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-115', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 108, 'EXECUTED', '8:47bda445fb14d94b3a385dae47a5d95f', 'addForeignKeyConstraint baseTableName=position, constraintName=FKl9cndlh233d9s05rdv573uhxb, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-116', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 109, 'EXECUTED', '8:653580ac5117f7ef11ed0e4b7efb32fc', 'addForeignKeyConstraint baseTableName=judgement_benchmark, constraintName=FKlskpjwxwwoex7awg7bdvfuewl, referencedTableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-117', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 110, 'EXECUTED', '8:c4dd277e4ba10c2264fc310784bdf648', 'addForeignKeyConstraint baseTableName=participant, constraintName=FKltl2dk33cemkl32l5fo3jmh85, referencedTableName=member', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-118', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 111, 'EXECUTED', '8:c041d87b5a34d5b8ae8e56f50b58a821', 'addForeignKeyConstraint baseTableName=aspect, constraintName=FKmfqmig30nlsl1k619y63d4sd9, referencedTableName=sub_criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-119', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 112, 'EXECUTED', '8:00164490f5a48d4f4e4024cf6d450e0f', 'addForeignKeyConstraint baseTableName=marking_day_competitor_group, constraintName=FKpfqtuqg16qnynb1iju05ytu2k, referencedTableName=competitor_marking_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-120', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:15', 113, 'EXECUTED', '8:5a082355fbe79b4f25e589752c0db0e4', 'addForeignKeyConstraint baseTableName=marking_day, constraintName=FKptqyda8eyieonxvrpe5wk0qhh, referencedTableName=sub_criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-121', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:16', 114, 'EXECUTED', '8:9bcb856c569c00cc931275148bb1a802', 'addForeignKeyConstraint baseTableName=user_group_permission, constraintName=FKpvewqags2qqto6e9afvwadde, referencedTableName=user_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-122', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:16', 115, 'EXECUTED', '8:91a58efc6a3589e0d0e76368972bb752', 'addForeignKeyConstraint baseTableName=marking_team, constraintName=FKqgcf3o39xdrny1vphop3crk9w, referencedTableName=sub_criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-123', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:16', 116, 'EXECUTED', '8:c22ac0c0ee268f1b995a54d58bec2193', 'addForeignKeyConstraint baseTableName=competitor_marking_grp_prtcpnt, constraintName=FKrchov8kg5eeao5eyjhpbwau0, referencedTableName=competitor_marking_group', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-124', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:16', 117, 'EXECUTED', '8:8c1a2cc17d7e9107691290ef49b55a8f', 'addForeignKeyConstraint baseTableName=sub_criterion, constraintName=FKrhgi5skjx3fkywbfa27fs32nl, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109903-125', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0000-4.0.0.xml', '2024-04-21 08:32:16', 118, 'EXECUTED', '8:aefaefd35ce13f095a27f98c982dbc81', 'addForeignKeyConstraint baseTableName=marking_day_competitor_group, constraintName=FKtqj9raglxaf9709r24uqug7wb, referencedTableName=marking_day', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 119, 'EXECUTED', '8:36b2d3adf76a6ffc063c4c208df13e0f', 'createTable tableName=calculation', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 120, 'EXECUTED', '8:66d492dfc1305031fec430c76713670f', 'createTable tableName=calculation_param_value', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 121, 'EXECUTED', '8:b62d2338569389da79f3583a9c26e0c0', 'createTable tableName=mark', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-4', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 122, 'EXECUTED', '8:6aaa8743187fe5ef3d1f87d63fd227dc', 'createTable tableName=mark_edit_lock', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-5', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 123, 'EXECUTED', '8:fe630b171b23d9dd66d4305f452203f7', 'createTable tableName=mark_judgement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-6', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 124, 'EXECUTED', '8:9732f05b51cf64e84a91d808c8f10032', 'createTable tableName=mark_judgement_entry', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-7', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 125, 'EXECUTED', '8:e7a631b76e9bbb286d54fadab5a3d744', 'createTable tableName=mark_measurement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-8', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 126, 'EXECUTED', '8:e2de7e6fb6cbf683cab71a9f31c9ba0d', 'createTable tableName=ws_entity', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-9', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 127, 'EXECUTED', '8:abddeaba3b2f82d99f3b6592a530cf5c', 'addColumn tableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-10', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 128, 'EXECUTED', '8:c12349256219b67226caf8b6248fe51d', 'addPrimaryKey constraintName=PRIMARY_MRK_JDGMNT, tableName=mark_judgement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-11', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 129, 'EXECUTED', '8:34ad893ca647221384cebc865b06398a', 'addPrimaryKey constraintName=PRIMARY_MRK_MSRMNT, tableName=mark_measurement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-12', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 130, 'EXECUTED', '8:9efa8210a3ffd8cc430f730718825836', 'addPrimaryKey constraintName=PRIMARY_WSE, tableName=ws_entity', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-13', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 131, 'EXECUTED', '8:3cae79566e33a085240e2c9648b8e095', 'addUniqueConstraint constraintName=unique_mark, tableName=mark', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-14', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 132, 'EXECUTED', '8:a39e3b152093292736025f8d15803a87', 'createIndex indexName=FK16i91amxxoq7m431frui7uf7s, tableName=ws_entity', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-15', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 133, 'EXECUTED', '8:5819fdadd1332cea0c5037dae8d0142b', 'createIndex indexName=FK2rgeo9fsdnhqixgbqorrx71py, tableName=mark_judgement_entry', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-16', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 134, 'EXECUTED', '8:179c1519b3cb310a9d5aeb46b864e8c6', 'createIndex indexName=FK444t51encv5gob9ma9inr8mmw, tableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-17', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:16', 135, 'EXECUTED', '8:13f5d7eea636a8c281001249c082d2c4', 'createIndex indexName=FK5qega95ox9o2d7lmaxk5tsxl2, tableName=mark_judgement_entry', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-18', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 136, 'EXECUTED', '8:986960c0c83e1da18e8edd722a93ec91', 'createIndex indexName=FKc4pv1v7rfvf4nvdp13c5mqlnv, tableName=mark', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-19', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 137, 'EXECUTED', '8:e038e44abc8b2670fdee23fdd4f62ef0', 'createIndex indexName=FKcjw0gy9dm2r9su346oislfl44, tableName=calculation', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-20', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 138, 'EXECUTED', '8:4217baca676289c7f791e6619d6474a8', 'createIndex indexName=FKd581r9pwpjad909t84hdwbuse, tableName=mark_edit_lock', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-21', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 139, 'EXECUTED', '8:486b46c3fff8a2631aa70de43f1172ac', 'createIndex indexName=FKdln3v7haeiif4xrepohcq7wrx, tableName=calculation_param_value', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-22', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 140, 'EXECUTED', '8:d0bb14e1bb94e9fd40a27bb6fa3c78a4', 'createIndex indexName=FKin89iob87gbkc7kn5s4g7qqqx, tableName=mark_edit_lock', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-23', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 141, 'EXECUTED', '8:3b2b0a26e93c6e448c4f0be28c008db4', 'createIndex indexName=FKk536ffxi1tx3ogjyb24gguk6o, tableName=ws_entity', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-24', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 142, 'EXECUTED', '8:e8d532453727c4fb38d9caf97f8e60b9', 'createIndex indexName=FKoiowfjdp5qyv7advscb5ihfl6, tableName=mark_measurement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-25', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 143, 'EXECUTED', '8:87ca587396dabd9c90b0eaad897138c8', 'createIndex indexName=FKos72houa2ky2c9scaqftesiw7, tableName=mark_edit_lock', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-26', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 144, 'EXECUTED', '8:049e177f4fce99bb3e3413f44a72e605', 'createIndex indexName=FKpl282ady4ocx77wff2goy3a2, tableName=mark_judgement_entry', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-27', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 145, 'EXECUTED', '8:01d032e1188e4cf5d87084e2fd948f28', 'addForeignKeyConstraint baseTableName=ws_entity, constraintName=FK16i91amxxoq7m431frui7uf7s, referencedTableName=i18n', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-28', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 146, 'EXECUTED', '8:1a26b5a751154a2ca7623ea5088784d5', 'addForeignKeyConstraint baseTableName=mark_judgement_entry, constraintName=FK2rgeo9fsdnhqixgbqorrx71py, referencedTableName=mark_judgement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-29', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 147, 'EXECUTED', '8:d20ce2795dbba96305f7fe475471b31c', 'addForeignKeyConstraint baseTableName=aspect, constraintName=FK444t51encv5gob9ma9inr8mmw, referencedTableName=calculation', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-30', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 148, 'EXECUTED', '8:2ad9b60179e13613bd16cbd3f4e84899', 'addForeignKeyConstraint baseTableName=mark, constraintName=FK5ggkdda226n8mac1kl7865fuv, referencedTableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-31', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 149, 'EXECUTED', '8:537728c1b4ff7ef06d0201e6f734edd8', 'addForeignKeyConstraint baseTableName=mark_judgement_entry, constraintName=FK5qega95ox9o2d7lmaxk5tsxl2, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-32', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 150, 'EXECUTED', '8:001f44faeb7b382906e8218b0bb9dbfb', 'addForeignKeyConstraint baseTableName=mark_judgement, constraintName=FK9fy6jk2fjlihm3ajikin5n5g8, referencedTableName=mark', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-33', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 151, 'EXECUTED', '8:f620da4bb58e8988b5e928f4a81cec79', 'addForeignKeyConstraint baseTableName=mark, constraintName=FKc4pv1v7rfvf4nvdp13c5mqlnv, referencedTableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-34', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 152, 'EXECUTED', '8:26a270c3f5be511c543f0fc4ccadf4fb', 'addForeignKeyConstraint baseTableName=calculation, constraintName=FKcjw0gy9dm2r9su346oislfl44, referencedTableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-35', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 153, 'EXECUTED', '8:a8bed7c8d51f8f52eff65d19b805bc3d', 'addForeignKeyConstraint baseTableName=mark_edit_lock, constraintName=FKd581r9pwpjad909t84hdwbuse, referencedTableName=sub_criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-36', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:17', 154, 'EXECUTED', '8:ba4e5133b4422787242f4ca8dce1115c', 'addForeignKeyConstraint baseTableName=calculation_param_value, constraintName=FKdln3v7haeiif4xrepohcq7wrx, referencedTableName=calculation', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-37', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:18', 155, 'EXECUTED', '8:ce7286af37c79c250e36fd02b76f60bc', 'addForeignKeyConstraint baseTableName=mark_edit_lock, constraintName=FKin89iob87gbkc7kn5s4g7qqqx, referencedTableName=user', '', NULL, '4.6.2', NULL, NULL, '3688329776');
INSERT INTO `DATABASECHANGELOG` (`ID`, `AUTHOR`, `FILENAME`, `DATEEXECUTED`, `ORDEREXECUTED`, `EXECTYPE`, `MD5SUM`, `DESCRIPTION`, `COMMENTS`, `TAG`, `LIQUIBASE`, `CONTEXTS`, `LABELS`, `DEPLOYMENT_ID`) VALUES
('1494681739674-38', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:18', 156, 'EXECUTED', '8:f9af697c2b910cf7565b6376e3bbd0eb', 'addForeignKeyConstraint baseTableName=ws_entity, constraintName=FKk536ffxi1tx3ogjyb24gguk6o, referencedTableName=ws_entity', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-39', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:18', 157, 'EXECUTED', '8:f2afc638a325ea7e5f263505eaab85fa', 'addForeignKeyConstraint baseTableName=mark_measurement, constraintName=FKoiowfjdp5qyv7advscb5ihfl6, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-40', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:18', 158, 'EXECUTED', '8:f2e3391bae2b9769353a627ea3ae36b1', 'addForeignKeyConstraint baseTableName=mark_measurement, constraintName=FKoosvk1f2djnyxjhxc2mbo9w7k, referencedTableName=mark', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-41', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:18', 159, 'EXECUTED', '8:ff06300f17823ecab59f1df1fd5ba17d', 'addForeignKeyConstraint baseTableName=mark_edit_lock, constraintName=FKos72houa2ky2c9scaqftesiw7, referencedTableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494681739674-42', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0001-4.0.0.xml', '2024-04-21 08:32:18', 160, 'EXECUTED', '8:be5f8b84a5cc5485b79d6f97c9e0169e', 'addForeignKeyConstraint baseTableName=mark_judgement_entry, constraintName=FKpl282ady4ocx77wff2goy3a2, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494825655717-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0002-4.0.0.xml', '2024-04-21 08:32:18', 161, 'EXECUTED', '8:3e2c37493bc6391b7a2e596f64484a82', 'dropForeignKeyConstraint baseTableName=ws_entity, constraintName=FK16i91amxxoq7m431frui7uf7s', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494825655717-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0002-4.0.0.xml', '2024-04-21 08:32:18', 162, 'EXECUTED', '8:a581b68b31feec344879a346b768f4b6', 'dropForeignKeyConstraint baseTableName=ws_entity, constraintName=FKk536ffxi1tx3ogjyb24gguk6o', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1494825655717-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0002-4.0.0.xml', '2024-04-21 08:32:18', 163, 'EXECUTED', '8:53252877063524755e2c5bc8483a8f1a', 'dropTable tableName=ws_entity', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1496765369156-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0003-4.0.0.xml', '2024-04-21 08:32:18', 164, 'EXECUTED', '8:8c55e8fe73a1d9d68fa49798acf7898a', 'createTable tableName=mark_lock', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1496765369156-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0003-4.0.0.xml', '2024-04-21 08:32:18', 165, 'EXECUTED', '8:57bf5bde5bc20f30d62d1a386423c3f7', 'addUniqueConstraint constraintName=unique_mark_lock, tableName=mark_lock', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1496765369156-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0003-4.0.0.xml', '2024-04-21 08:32:18', 166, 'EXECUTED', '8:01f83e27f2f1f8e5a184ff40356705d3', 'createIndex indexName=FKhoioh11f2ty2c4pad1y3cxxlv, tableName=mark_lock', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1496765369156-4', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0003-4.0.0.xml', '2024-04-21 08:32:18', 167, 'EXECUTED', '8:3a90305438eaa21ed3dfa3e5e126c640', 'addForeignKeyConstraint baseTableName=mark_lock, constraintName=FKe3bj1c3kxcypd0ic8omo3rsb3, referencedTableName=sub_criterion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1496765369156-5', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0003-4.0.0.xml', '2024-04-21 08:32:18', 168, 'EXECUTED', '8:6197566a150c88e446d0acdfefa7b165', 'addForeignKeyConstraint baseTableName=mark_lock, constraintName=FKhoioh11f2ty2c4pad1y3cxxlv, referencedTableName=competition_day', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1497538876349-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0004-4.0.0.xml', '2024-04-21 08:32:18', 169, 'EXECUTED', '8:bb4ffb00db3b36c593487bc07d78f826', 'createTable tableName=scaled_score', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1497538876349-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0004-4.0.0.xml', '2024-04-21 08:32:18', 170, 'EXECUTED', '8:54b6ecea8fa00398bd83ee950c130f6d', 'createTable tableName=scaled_score_adjustment', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1497538876349-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0004-4.0.0.xml', '2024-04-21 08:32:18', 171, 'EXECUTED', '8:35eb587e1725310288fc7ee1feaf9f80', 'addUniqueConstraint constraintName=unique_scaled_score, tableName=scaled_score', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1497538876349-4', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0004-4.0.0.xml', '2024-04-21 08:32:18', 172, 'EXECUTED', '8:3a10322e0677b6d3cc077529fe996d55', 'createIndex indexName=FK2l76u1qkqanvwjjs8hdru4m49, tableName=scaled_score_adjustment', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1497538876349-5', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0004-4.0.0.xml', '2024-04-21 08:32:18', 173, 'EXECUTED', '8:704678c58394f84899bbc60f9e17ff6c', 'createIndex indexName=FKbf6kbxroesai8oobftfcrjp92, tableName=scaled_score_adjustment', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1497538876349-6', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0004-4.0.0.xml', '2024-04-21 08:32:18', 174, 'EXECUTED', '8:91c71a5946bb6ef65377e3bae450f8c7', 'createIndex indexName=FKtlnsrtho5xbcdue9gaymo1kqi, tableName=scaled_score', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1497538876349-7', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0004-4.0.0.xml', '2024-04-21 08:32:19', 175, 'EXECUTED', '8:6de78f2fded4f38b0ae62ab8ebb349b8', 'addForeignKeyConstraint baseTableName=scaled_score_adjustment, constraintName=FK2l76u1qkqanvwjjs8hdru4m49, referencedTableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1497538876349-8', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0004-4.0.0.xml', '2024-04-21 08:32:19', 176, 'EXECUTED', '8:4d99ff5572e000ff39262c55ab4e975f', 'addForeignKeyConstraint baseTableName=scaled_score, constraintName=FKb6obfwvashwhi1j9r4wn3d41m, referencedTableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1497538876349-9', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0004-4.0.0.xml', '2024-04-21 08:32:19', 177, 'EXECUTED', '8:38de2e3d995c49760fe834b24c579a4f', 'addForeignKeyConstraint baseTableName=scaled_score_adjustment, constraintName=FKbf6kbxroesai8oobftfcrjp92, referencedTableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1497538876349-10', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0004-4.0.0.xml', '2024-04-21 08:32:19', 178, 'EXECUTED', '8:e0b466c0c9476e3f5ba2f7c909f8e7fc', 'addForeignKeyConstraint baseTableName=scaled_score, constraintName=FKtlnsrtho5xbcdue9gaymo1kqi, referencedTableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501120862211-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0005-4.0.0.xml', '2024-04-21 08:32:19', 179, 'EXECUTED', '8:72e714b268ab9fb053d05578784e4e70', 'createTable tableName=mark_pending_judgement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501120862211-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0005-4.0.0.xml', '2024-04-21 08:32:19', 180, 'EXECUTED', '8:5dc54c81311f981c1a21b53c0eba8815', 'createTable tableName=mark_pending_judgement_score', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501120862211-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0005-4.0.0.xml', '2024-04-21 08:32:19', 181, 'EXECUTED', '8:6c8348ce9bf8fc67aaef4afc1f6e283a', 'addUniqueConstraint constraintName=unique_pending_mark, tableName=mark_pending_judgement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501120862211-4', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0005-4.0.0.xml', '2024-04-21 08:32:19', 182, 'EXECUTED', '8:b6cbd1b1f41b1f3e20a23b6800d48d16', 'addUniqueConstraint constraintName=unique_pending_score, tableName=mark_pending_judgement_score', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501120862211-5', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0005-4.0.0.xml', '2024-04-21 08:32:19', 183, 'EXECUTED', '8:073d6a14fa8ccf474e3387d4bd65aeee', 'createIndex indexName=FKgdf11c7kk73o7cy8jtuorb84p, tableName=mark_pending_judgement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501120862211-6', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0005-4.0.0.xml', '2024-04-21 08:32:19', 184, 'EXECUTED', '8:d8f2af6d8da92e28869abfb907dbdf6b', 'createIndex indexName=FKnxqb55vb3gbwcoiwclhxp5mk7, tableName=mark_pending_judgement_score', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501120862211-7', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0005-4.0.0.xml', '2024-04-21 08:32:19', 185, 'EXECUTED', '8:532fa0f669a46c66ccc8ae36c826769e', 'addForeignKeyConstraint baseTableName=mark_pending_judgement_score, constraintName=FKdx4qw3cvm4i71fyf50abdanea, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501120862211-8', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0005-4.0.0.xml', '2024-04-21 08:32:19', 186, 'EXECUTED', '8:301eb037a27d9e774359fa549fa1dc80', 'addForeignKeyConstraint baseTableName=mark_pending_judgement, constraintName=FKgdf11c7kk73o7cy8jtuorb84p, referencedTableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501120862211-9', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0005-4.0.0.xml', '2024-04-21 08:32:19', 187, 'EXECUTED', '8:7d15ebc9cef6bf927a9435495208bc31', 'addForeignKeyConstraint baseTableName=mark_pending_judgement, constraintName=FKjpdexlq2d5vpn67q05yv5mc84, referencedTableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501120862211-10', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0005-4.0.0.xml', '2024-04-21 08:32:19', 188, 'EXECUTED', '8:b9928d9f399f162f23244613cbba5be7', 'addForeignKeyConstraint baseTableName=mark_pending_judgement_score, constraintName=FKnxqb55vb3gbwcoiwclhxp5mk7, referencedTableName=mark_pending_judgement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20170803-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0006-4.0.0.xml', '2024-04-21 08:32:19', 189, 'EXECUTED', '8:99635585b2aa5071393774a3f7ef2924', 'delete tableName=user_group_permission', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501947685992-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0007-4.0.0.xml', '2024-04-21 08:32:19', 190, 'EXECUTED', '8:635f917f01d05edebf2784b44b9d62df', 'addColumn tableName=calculation', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501947685992-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0007-4.0.0.xml', '2024-04-21 08:32:19', 191, 'EXECUTED', '8:93de03c213cc92bd338f177026441b56', 'addColumn tableName=calculation', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501947685992-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0007-4.0.0.xml', '2024-04-21 08:32:19', 192, 'EXECUTED', '8:b3f326e38c8ddf6ed2a612bb5dce08c0', 'dropColumn columnName=calc_strategy_name, tableName=calculation', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501947685992-4', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0007-4.0.0.xml', '2024-04-21 08:32:19', 193, 'EXECUTED', '8:51667504e68ddcd21d007bc9707fa523', 'modifyDataType columnName=calc_value, tableName=mark_measurement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1501947685992-5', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0007-4.0.0.xml', '2024-04-21 08:32:20', 194, 'EXECUTED', '8:725ccd08a4968ec597f03f3559e2354f', 'modifyDataType columnName=num_value, tableName=calculation_param_value', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1503587578380-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0008-4.0.0.xml', '2024-04-21 08:32:20', 195, 'EXECUTED', '8:e5adcf43d5c25815387ccf7feed1663e', 'createTable tableName=person_exclusion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1503587578380-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0008-4.0.0.xml', '2024-04-21 08:32:20', 196, 'EXECUTED', '8:7dc2f7bda20081721173fd62df42e36b', 'addUniqueConstraint constraintName=unique_exclusion, tableName=person_exclusion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1503587578380-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0008-4.0.0.xml', '2024-04-21 08:32:20', 197, 'EXECUTED', '8:c42899a81aeb3293d0c33fc604208c44', 'createIndex indexName=FKe8o3ur605qx0ggipamv5dq094, tableName=person_exclusion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1503587578380-4', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0008-4.0.0.xml', '2024-04-21 08:32:20', 198, 'EXECUTED', '8:ff8ae3ad88aa34ce10aed097ea7ce402', 'createIndex indexName=FKjeqwt4oioc8ypdobwox8ief1c, tableName=person_exclusion', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1503587578380-5', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0008-4.0.0.xml', '2024-04-21 08:32:20', 199, 'EXECUTED', '8:09ad8216e0771682965d57dcdc004ab1', 'addForeignKeyConstraint baseTableName=person_exclusion, constraintName=FK9pe64vod3xc5i376cclgqftu9, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1503587578380-6', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0008-4.0.0.xml', '2024-04-21 08:32:20', 200, 'EXECUTED', '8:36108b267588519598ba84b7a4d03b84', 'addForeignKeyConstraint baseTableName=person_exclusion, constraintName=FKe8o3ur605qx0ggipamv5dq094, referencedTableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1503587578380-7', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0008-4.0.0.xml', '2024-04-21 08:32:20', 201, 'EXECUTED', '8:06dda43f7e3bb9aec59e28dec6770e48', 'addForeignKeyConstraint baseTableName=person_exclusion, constraintName=FKjeqwt4oioc8ypdobwox8ief1c, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1504098740879-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0009-4.0.0.xml', '2024-04-21 08:32:20', 202, 'EXECUTED', '8:f3fef5dbea89e651891488feed98dea5', 'createTable tableName=audit_event', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1504098740879-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0009-4.0.0.xml', '2024-04-21 08:32:20', 203, 'EXECUTED', '8:39f8d482ae5114aa04121e18100bf36c', 'createTable tableName=audit_event_data', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1504098740879-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0009-4.0.0.xml', '2024-04-21 08:32:20', 204, 'EXECUTED', '8:c133ef3616c74f4b675ff555bf6e0441', 'createIndex indexName=FKrqodmr3f8wv85pi4g85i6s9tt, tableName=audit_event_data', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1504098740879-4', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0009-4.0.0.xml', '2024-04-21 08:32:20', 205, 'EXECUTED', '8:567aecdbb797ae40911ff1e2ca2d65b3', 'addForeignKeyConstraint baseTableName=audit_event_data, constraintName=FKrqodmr3f8wv85pi4g85i6s9tt, referencedTableName=audit_event', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1504171700923-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0010-4.0.0.xml', '2024-04-21 08:32:20', 206, 'EXECUTED', '8:813deff703d13022c3a214b31316dd0c', 'dropNotNullConstraint columnName=value, tableName=scaled_score_adjustment', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1504243293408-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0011-4.0.0.xml', '2024-04-21 08:32:20', 207, 'EXECUTED', '8:c3a86ac2454f7c8cea3c013e5931fd3c', 'addColumn tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1504243293408-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0011-4.0.0.xml', '2024-04-21 08:32:20', 208, 'EXECUTED', '8:5092fffc0179bb092d8fa6b7cd5a0902', 'update tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1505144867742-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0012-4.0.0.xml', '2024-04-21 08:32:20', 209, 'EXECUTED', '8:f4dcf35f9dbb63a46cb56d467663b3a0', 'createTable tableName=best_of_nation', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1505144867742-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0012-4.0.0.xml', '2024-04-21 08:32:20', 210, 'EXECUTED', '8:438a2a0a1f4aa3594d3a7b87a02c8485', 'addUniqueConstraint constraintName=unique_bon, tableName=best_of_nation', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1505144867742-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0012-4.0.0.xml', '2024-04-21 08:32:20', 211, 'EXECUTED', '8:643b570693d451c05d1710975050ec4b', 'createIndex indexName=FK1dv9kvg4rc3gppcm3103nrmwi, tableName=best_of_nation', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1505144867742-4', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0012-4.0.0.xml', '2024-04-21 08:32:20', 212, 'EXECUTED', '8:4a2007ab3eebbc3d870949d6b957ad77', 'addForeignKeyConstraint baseTableName=best_of_nation, constraintName=FK1dv9kvg4rc3gppcm3103nrmwi, referencedTableName=participant', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1505144867742-5', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0012-4.0.0.xml', '2024-04-21 08:32:20', 213, 'EXECUTED', '8:fe3f7ef819bb29f31831021a3c7d3ac4', 'addForeignKeyConstraint baseTableName=best_of_nation, constraintName=FKlagnpd961oovgqds3bwaksr9d, referencedTableName=member', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1490793109999-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0013-4.0.0.xml', '2024-04-21 08:32:21', 214, 'EXECUTED', '8:ad2b65cd3bf11341b540ec313cc7fc38', 'addUniqueConstraint constraintName=unique_judgement_score, tableName=mark_judgement_entry', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20180322-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0014-4.0.1.xml', '2024-04-21 08:32:21', 215, 'EXECUTED', '8:499c8255d9529136428d918f2932b03b', 'customChange; addUniqueConstraint constraintName=unique_username, tableName=user', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20180510-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0015-4.0.1.xml', '2024-04-21 08:32:21', 216, 'EXECUTED', '8:7a9f6c48eb14e1328a25962243d46027', 'customChange', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20180512-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0016-4.0.1.xml', '2024-04-21 08:32:21', 217, 'EXECUTED', '8:a9e6649807b06e3a9e932de45f9dd480', 'customChange', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1533647543800-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0017-4.0.3.xml', '2024-04-21 08:32:21', 218, 'EXECUTED', '8:ad668b79c6771ecad49b837944a5e597', 'addColumn tableName=mark_measurement', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1544671473426-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0018-4.1.0.xml', '2024-04-21 08:32:21', 219, 'EXECUTED', '8:f91321e97e6e983bda3618420a17d68b', 'createTable tableName=marking_scheme_edit_lock', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1544671473426-3', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0018-4.1.0.xml', '2024-04-21 08:32:21', 220, 'EXECUTED', '8:4bb0aab8d8252cf096df9413bd5d43c0', 'createIndex indexName=FK1rwqopf7r2uc7u70m8jox11bu, tableName=marking_scheme_edit_lock', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1544671473426-4', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0018-4.1.0.xml', '2024-04-21 08:32:21', 221, 'EXECUTED', '8:497b8795257258669dde566890a880a3', 'createIndex indexName=FKgx9gm3kp7cqtgdcstcaym7xty, tableName=marking_scheme_edit_lock', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1544671473426-5', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0018-4.1.0.xml', '2024-04-21 08:32:21', 222, 'EXECUTED', '8:8a882c5669b2b920ceae30b3a661dbf7', 'addForeignKeyConstraint baseTableName=marking_scheme_edit_lock, constraintName=FK1rwqopf7r2uc7u70m8jox11bu, referencedTableName=user', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1544671473426-6', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0018-4.1.0.xml', '2024-04-21 08:32:21', 223, 'EXECUTED', '8:8568005058b2ed0dc4bc034c4bbea67e', 'addForeignKeyConstraint baseTableName=marking_scheme_edit_lock, constraintName=FKgx9gm3kp7cqtgdcstcaym7xty, referencedTableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1544671473426-7', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0018-4.1.0.xml', '2024-04-21 08:32:21', 224, 'EXECUTED', '8:9b95a110feda241ff65c70aa60591d04', 'customChange', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1555472280229-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0019-4.1.0.xml', '2024-04-21 08:32:21', 225, 'EXECUTED', '8:56dbf7a67f5a8b2ac9acd2f6f5a0769f', 'addColumn tableName=aspect', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('1555472280229-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0019-4.1.0.xml', '2024-04-21 08:32:21', 226, 'EXECUTED', '8:b775f692eac746466617be1087d02dfb', 'customChange', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('201905031408-1', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0020-4.1.0.xml', '2024-04-21 08:32:21', 227, 'EXECUTED', '8:abeaa6ec63d55ac705776d88ac3f07dd', 'customChange', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('201906010048-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0021-4.1.0.xml', '2024-04-21 08:32:21', 228, 'EXECUTED', '8:92ccd5324aa0a29251385eae560b1619', 'customChange', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('201907061242-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0022-4.1.0.xml', '2024-04-21 08:32:21', 229, 'EXECUTED', '8:30f88b37e9699fd9803201ce90f97e1a', 'customChange', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('201907121143-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0023-4.1.0.xml', '2024-04-21 08:32:21', 230, 'EXECUTED', '8:7b044d5f52bbe10f50c5ec3fc747c1cd', 'customChange', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('201909111229-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0025-4.1.0.xml', '2024-04-21 08:32:21', 231, 'EXECUTED', '8:a20bdb782ff99dbb456fa12e5ab6fc57', 'customChange', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220325015300-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0026-5.0.0.xml', '2024-04-21 08:32:21', 232, 'EXECUTED', '8:49ca74dadf3bce3952207c3ccc8547a7', 'customChange', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220401003600-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0027-5.0.0.xml', '2024-04-21 08:32:21', 233, 'EXECUTED', '8:3b9badd9f8dbb490045d10e30f87666b', 'modifyDataType columnName=skill_number, tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220423011000-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0028-5.0.0.xml', '2024-04-21 08:32:21', 234, 'EXECUTED', '8:db590eb70341f2534995d4261ba0d4e9', 'update tableName=user_group_permission', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220504001800-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0029-5.0.0.xml', '2024-04-21 08:32:21', 235, 'EXECUTED', '8:69e0df625cf33ec3ee49147926c76088', 'addColumn tableName=audit_event', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220511142200-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0030-5.0.0.xml', '2024-04-21 08:32:21', 236, 'EXECUTED', '8:22a2249712dcbff5017b0b9594c1faf1', 'createTable tableName=mark_comment', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220511142200-2', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0030-5.0.0.xml', '2024-04-21 08:32:21', 237, 'EXECUTED', '8:60259fdbe5273fdc3adf798a97907542', 'addForeignKeyConstraint baseTableName=mark_comment, constraintName=FK_comment_aspect, referencedTableName=aspect; addForeignKeyConstraint baseTableName=mark_comment, constraintName=FK_comment_competitor_participant, referencedTableName=participant...', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220518141300-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0031-5.0.0.xml', '2024-04-21 08:32:21', 238, 'EXECUTED', '8:120a3f8ff1c364d53f516a09886cd11d', 'addColumn tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220520120500-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0032-5.0.0.xml', '2024-04-21 08:32:22', 239, 'EXECUTED', '8:1c2b05d637c4b53d6df5442236bffcfb', 'addColumn tableName=mark_comment; addForeignKeyConstraint baseTableName=mark_comment, constraintName=FK_comment_inserter_person, referencedTableName=person; dropNotNullConstraint columnName=commenter_id, tableName=mark_comment', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220527123500-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0033-5.0.0.xml', '2024-04-21 08:32:22', 240, 'EXECUTED', '8:f7b73c41983b27c8d51e4f6b2c373df2', 'addColumn tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220618010500-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0034-5.0.0.xml', '2024-04-21 08:32:22', 241, 'EXECUTED', '8:65f7af2de2e669ca659319a356779825', 'createTable tableName=assessment_photo', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220618010500-2', 'adam (generated)', 'org/worldskills/cis/database/changelog/db.changelog-0034-5.0.0.xml', '2024-04-21 08:32:22', 242, 'EXECUTED', '8:08587d3b985f33a50099156c18154706', 'createIndex indexName=FK_assessment_photo_sub_criterion_index, tableName=assessment_photo; addForeignKeyConstraint baseTableName=assessment_photo, constraintName=FK_assessment_photo_sub_criterion, referencedTableName=sub_criterion; createIndex ind...', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220804164900-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0035-5.0.0.xml', '2024-04-21 08:32:22', 243, 'EXECUTED', '8:ec38067dd8a3abd2056dbd87240ed590', 'insert tableName=config', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220808122400-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0036-5.0.0.xml', '2024-04-21 08:32:22', 244, 'EXECUTED', '8:79d9d230ed7879f03d8fb4480dba93e3', 'addAutoIncrement columnName=id, tableName=assessment_photo', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220809230500-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0037-5.0.0.xml', '2024-04-21 08:32:22', 245, 'EXECUTED', '8:4aa452677c7bb3cb8d53d53be5da8d72', 'addColumn tableName=assessment_photo', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220809230500-2', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0037-5.0.0.xml', '2024-04-21 08:32:22', 246, 'EXECUTED', '8:26c87027575504fd9e70d9d35e928cb7', 'update tableName=assessment_photo', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220809230500-3', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0037-5.0.0.xml', '2024-04-21 08:32:22', 247, 'EXECUTED', '8:60f34c1b7c9144c2919ba898f44635c7', 'createIndex indexName=FK_assessment_photo_photographer_index, tableName=assessment_photo; addForeignKeyConstraint baseTableName=assessment_photo, constraintName=FK_assessment_photo_photographer, referencedTableName=person', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220813002500-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0038-5.0.0.xml', '2024-04-21 08:32:22', 248, 'EXECUTED', '8:cb8366b21503ca9435351ec59f356bf8', 'addColumn tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220825134700-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0039-5.0.0.xml', '2024-04-21 08:32:22', 249, 'EXECUTED', '8:0dd12a37ec76e0762f1249f666965508', 'addColumn tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220909120800-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0040-5.0.0.xml', '2024-04-21 08:32:22', 250, 'EXECUTED', '8:858fc8a101c6ad322444dc301d94f2e8', 'addColumn tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776'),
('20220909120800-1', 'adam', 'org/worldskills/cis/database/changelog/db.changelog-0041-5.0.0.xml', '2024-04-21 08:32:22', 251, 'EXECUTED', '8:a2397c7c2c99930c65f79364c8d223a7', 'addColumn tableName=skill', '', NULL, '4.6.2', NULL, NULL, '3688329776');

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

INSERT INTO `DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`) VALUES
(1, b'0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `i18n`
--

CREATE TABLE `i18n` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `i18n`
--

INSERT INTO `i18n` (`id`) VALUES
(1),
(2),
(3),
(4);

-- --------------------------------------------------------

--
-- Table structure for table `i18n_value`
--

CREATE TABLE `i18n_value` (
  `id` int(11) NOT NULL,
  `lang_code` varchar(10) NOT NULL,
  `text` longtext NOT NULL,
  `i18n_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `i18n_value`
--

INSERT INTO `i18n_value` (`id`, `lang_code`, `text`, `i18n_id`) VALUES
(1, 'en', 'Competitor', 1),
(2, 'en', 'Expert', 2),
(3, 'en', 'Chief Expert', 3),
(4, 'en', 'Hungary', 4);

-- --------------------------------------------------------

--
-- Table structure for table `judgement_benchmark`
--

CREATE TABLE `judgement_benchmark` (
  `id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `aspect_id` int(11) NOT NULL,
  `description_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark`
--

CREATE TABLE `mark` (
  `id` int(11) NOT NULL,
  `calculated_mark` decimal(19,2) DEFAULT NULL,
  `version` int(11) NOT NULL,
  `aspect_id` int(11) NOT NULL,
  `competitor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marking_day`
--

CREATE TABLE `marking_day` (
  `type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL,
  `sub_criterion_id` int(11) NOT NULL,
  `competition_day_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marking_day_competitor`
--

CREATE TABLE `marking_day_competitor` (
  `marking_day_id` int(11) NOT NULL,
  `competition_day_id` int(11) NOT NULL,
  `competitor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marking_day_competitor_group`
--

CREATE TABLE `marking_day_competitor_group` (
  `marking_day_id` int(11) NOT NULL,
  `competition_day_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marking_scheme_edit_lock`
--

CREATE TABLE `marking_scheme_edit_lock` (
  `id` bigint(20) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `skill_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marking_team`
--

CREATE TABLE `marking_team` (
  `sub_criterion_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_comment`
--

CREATE TABLE `mark_comment` (
  `id` int(11) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `aspect_id` int(11) NOT NULL,
  `competitor_id` int(11) NOT NULL,
  `commenter_id` int(11) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `inserter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_edit_lock`
--

CREATE TABLE `mark_edit_lock` (
  `id` bigint(20) NOT NULL,
  `mark_type` varchar(25) NOT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `competitor_id` int(11) NOT NULL,
  `sub_criterion_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_judgement`
--

CREATE TABLE `mark_judgement` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_judgement_entry`
--

CREATE TABLE `mark_judgement_entry` (
  `id` int(11) NOT NULL,
  `entry_timestamp` datetime(6) DEFAULT NULL,
  `value` int(11) NOT NULL,
  `entered_by_person_id` int(11) NOT NULL,
  `expert_id` int(11) DEFAULT NULL,
  `mark_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_lock`
--

CREATE TABLE `mark_lock` (
  `id` int(11) NOT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `competition_day_id` int(11) NOT NULL,
  `sub_criterion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_measurement`
--

CREATE TABLE `mark_measurement` (
  `calc_value` decimal(19,8) DEFAULT NULL,
  `entry_timestamp` datetime(6) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `entered_by_person_id` int(11) NOT NULL,
  `non_attempt` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_pending_judgement`
--

CREATE TABLE `mark_pending_judgement` (
  `id` int(11) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL,
  `aspect_id` int(11) NOT NULL,
  `competitor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_pending_judgement_score`
--

CREATE TABLE `mark_pending_judgement_score` (
  `id` int(11) NOT NULL,
  `entry_timestamp` datetime(6) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `marker_id` int(11) NOT NULL,
  `pending_judgement_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `flag_image` varchar(255) DEFAULT NULL,
  `membership_status` varchar(25) DEFAULT NULL,
  `name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`id`, `member_id`) VALUES
(1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `wsi_people_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`first_name`, `gender`, `last_name`, `wsi_people_id`, `id`, `image_path`) VALUES
('Admin', NULL, 'User', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `person_exclusion`
--

CREATE TABLE `person_exclusion` (
  `id` int(11) NOT NULL,
  `reason` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `excluded_by_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `skill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person_position`
--

CREATE TABLE `person_position` (
  `id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `skill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person_team`
--

CREATE TABLE `person_team` (
  `team_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `base_position_id` int(11) DEFAULT NULL,
  `position_type` varchar(25) NOT NULL,
  `name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `base_position_id`, `position_type`, `name_id`) VALUES
(1, NULL, 'COMPETITOR', 1),
(2, NULL, 'EXPERT', 2),
(3, NULL, 'EXPERT', 3);

-- --------------------------------------------------------

--
-- Table structure for table `scaled_score`
--

CREATE TABLE `scaled_score` (
  `id` int(11) NOT NULL,
  `calculated_score` decimal(19,2) NOT NULL,
  `final_score` decimal(19,2) NOT NULL,
  `medal` varchar(50) DEFAULT NULL,
  `ranking` int(11) NOT NULL,
  `competitor_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scaled_score_adjustment`
--

CREATE TABLE `scaled_score_adjustment` (
  `type` varchar(31) NOT NULL,
  `id` int(11) NOT NULL,
  `reason` longtext NOT NULL,
  `value` decimal(19,2) DEFAULT NULL,
  `competitor_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `id` int(11) NOT NULL,
  `compatriot_marking` char(1) DEFAULT NULL,
  `competitor_teams` char(1) DEFAULT NULL,
  `exclude_from_results` char(1) DEFAULT NULL,
  `final_results` char(1) DEFAULT NULL,
  `landscape_marking_form` char(1) DEFAULT NULL,
  `marking_scheme_locked` datetime(6) DEFAULT NULL,
  `skill_number` varchar(10) DEFAULT NULL,
  `type` varchar(40) NOT NULL,
  `wsi_skill_id` int(11) DEFAULT NULL,
  `name_id` int(11) NOT NULL,
  `num_judges` int(11) NOT NULL,
  `results_locked` char(1) DEFAULT NULL,
  `exclude_from_a_v` char(1) DEFAULT 'N',
  `hide_max_mark` char(1) DEFAULT 'N',
  `c1_date` date DEFAULT NULL,
  `marking_suspended` char(1) DEFAULT 'N',
  `marking_scheme_update_open` char(1) DEFAULT 'N',
  `allow_supervisor_mark_measurement` char(1) DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_criterion`
--

CREATE TABLE `sub_criterion` (
  `id` int(11) NOT NULL,
  `max_mark` decimal(10,2) NOT NULL,
  `number` int(11) NOT NULL,
  `criterion_id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  `marking_supervisor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  `salt` varchar(60) NOT NULL,
  `username` varchar(100) NOT NULL,
  `group_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `locale`, `password`, `salt`, `username`, `group_id`, `person_id`) VALUES
(1, NULL, '$2a$10$3Ma2OowWRl0XorlnAlj.cOUrjOc80HgnclrRVPhAaT7V/hu3mfIcK', '$2a$10$3Ma2OowWRl0XorlnAlj.cO', 'admin', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`id`, `name`) VALUES
(1, 'Admin'),
(2, 'Skill Management Team'),
(3, 'Expert');

-- --------------------------------------------------------

--
-- Table structure for table `user_group_permission`
--

CREATE TABLE `user_group_permission` (
  `user_group_id` int(11) NOT NULL,
  `permission` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_group_permission`
--

INSERT INTO `user_group_permission` (`user_group_id`, `permission`) VALUES
(1, 'EDIT_PEOPLE'),
(1, 'IMPORT_MEMBERS'),
(1, 'EDIT_ALL_SKILLS_INFO'),
(1, 'VIEW_OWN_SKILL_REPORTS'),
(1, 'VIEW_ALL_MARKING_FORMS'),
(1, 'EDIT_ALL_MARKING_SCHEDULES'),
(1, 'EDIT_RESULTS'),
(1, 'VIEW_RESULTS'),
(1, 'ASSESS_USING_TABLET'),
(1, 'VIEW_ACTIVE_USERS'),
(1, 'VIEW_REPORTS'),
(1, 'VIEW_AUDIT_EVENTS'),
(1, 'EDIT_ALL_MARKING_SCHEMES'),
(1, 'EDIT_TEAMS'),
(1, 'ALL_BEST_OF_NATION'),
(1, 'ASSIGN_USER_GROUP'),
(1, 'EDIT_CONFIG'),
(1, 'UNLOCK_MARKS'),
(1, 'ENTER_OWN_MARKS'),
(1, 'IMPORT_MARKING_SCHEME'),
(1, 'SUSPEND_ALL_SKILLS_MARKING'),
(1, 'EDIT_CRIT_IDENTIFIERS'),
(1, 'ALLOW_PC_UI_ON_TABLET'),
(1, 'VIEW_OWN_MARKS'),
(1, 'EDIT_GROUPS'),
(1, 'EXPORT_MEMBERS'),
(1, 'SEARCH_PEOPLE'),
(1, 'EDIT_OWN_SKILL_INFO'),
(1, 'VIEW_OWN_MARKS_AFTER_LOCK'),
(1, 'CREATE_CERTIFICATES'),
(1, 'EXCLUDE_COMPETITOR'),
(1, 'EXPORT_RESULTS'),
(1, 'VIEW_OWN_MARKING_FORMS'),
(1, 'EXPORT_PEOPLE'),
(1, 'MANAGE_APPLICATION'),
(1, 'LOCK_ALL_MARKS'),
(1, 'LOCK_MARKING_SCHEME'),
(1, 'OWN_BEST_OF_NATION'),
(1, 'ASSESS_USING_PC'),
(1, 'VIEW_INVALID_JUDGEMENT_MARKS'),
(1, 'EDIT_POSITIONS'),
(1, 'LOCK_OWN_MARKS'),
(1, 'DELETE_ALL_MARKS'),
(1, 'EXPORT_MARKING_SCHEME'),
(1, 'ENTER_ALL_MARKS'),
(1, 'EDIT_COMP_DATES'),
(1, 'EDIT_OWN_MARKING_SCHEME'),
(1, 'EDIT_OWN_MARKING_SCHEDULE'),
(1, 'SUSPEND_OWN_SKILL_MARKING'),
(1, 'VIEW_ALL_MARKS'),
(1, 'EDIT_MEMBERS'),
(1, 'UPDATE_LOCKED_MARKING_SCHEME'),
(1, 'IMPORT_PEOPLE'),
(2, 'EDIT_OWN_MARKING_SCHEME'),
(2, 'ASSESS_USING_TABLET'),
(2, 'EXPORT_MARKING_SCHEME'),
(2, 'ENTER_OWN_MARKS'),
(2, 'IMPORT_MARKING_SCHEME'),
(2, 'VIEW_OWN_SKILL_REPORTS'),
(2, 'VIEW_INVALID_JUDGEMENT_MARKS'),
(3, 'ASSESS_USING_TABLET');

-- --------------------------------------------------------

--
-- Table structure for table `ws_standards_spec`
--

CREATE TABLE `ws_standards_spec` (
  `id` int(11) NOT NULL,
  `percent` decimal(19,2) NOT NULL,
  `section` int(11) NOT NULL,
  `name_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aspect`
--
ALTER TABLE `aspect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2iou7wnyynxp5vn9wsf7g1uma` (`name_id`),
  ADD KEY `FKj3v9n6oldeiqq7m6eo7b6urkb` (`wsss_id`),
  ADD KEY `FKmfqmig30nlsl1k619y63d4sd9` (`sub_criterion_id`),
  ADD KEY `FK444t51encv5gob9ma9inr8mmw` (`calculation_id`);

--
-- Indexes for table `aspect_description_line`
--
ALTER TABLE `aspect_description_line`
  ADD UNIQUE KEY `UK_2uqie8uyb5omtohxlvyvf083l` (`description_id`),
  ADD KEY `FK2ni00q8ss18u74od04nxmme5b` (`aspect_id`);

--
-- Indexes for table `assessment_photo`
--
ALTER TABLE `assessment_photo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `FK_assessment_photo_sub_criterion_index` (`sub_criterion_id`),
  ADD KEY `FK_assessment_photo_competitor_index` (`competitor_id`),
  ADD KEY `FK_assessment_photo_photographer_index` (`photographer_id`);

--
-- Indexes for table `audit_event`
--
ALTER TABLE `audit_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_event_data`
--
ALTER TABLE `audit_event_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrqodmr3f8wv85pi4g85i6s9tt` (`audit_event_id`);

--
-- Indexes for table `best_of_nation`
--
ALTER TABLE `best_of_nation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_bon` (`member_id`,`competitor_id`),
  ADD KEY `FK1dv9kvg4rc3gppcm3103nrmwi` (`competitor_id`);

--
-- Indexes for table `calculation`
--
ALTER TABLE `calculation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcjw0gy9dm2r9su346oislfl44` (`skill_id`);

--
-- Indexes for table `calculation_param_value`
--
ALTER TABLE `calculation_param_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdln3v7haeiif4xrepohcq7wrx` (`calculation_id`);

--
-- Indexes for table `competition_day`
--
ALTER TABLE `competition_day`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competitor_marking_group`
--
ALTER TABLE `competitor_marking_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKccuvm8tti18uolgu6dk9pyole` (`skill_id`);

--
-- Indexes for table `competitor_marking_grp_prtcpnt`
--
ALTER TABLE `competitor_marking_grp_prtcpnt`
  ADD PRIMARY KEY (`competitor_group_id`,`competitor_id`),
  ADD UNIQUE KEY `UK_jblki35ho9s833vqbk41071wx` (`competitor_id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`config_key`);

--
-- Indexes for table `criterion`
--
ALTER TABLE `criterion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_crit` (`skill_id`,`identifier_id`),
  ADD KEY `FKb6un9rge8tdk8gd8g72boxran` (`name_id`),
  ADD KEY `FKifgs3616jk0p80k4udg4x0004` (`identifier_id`);

--
-- Indexes for table `criterion_identifier`
--
ALTER TABLE `criterion_identifier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `DATABASECHANGELOGLOCK`
--
ALTER TABLE `DATABASECHANGELOGLOCK`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `i18n`
--
ALTER TABLE `i18n`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `i18n_value`
--
ALTER TABLE `i18n_value`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKecxityxpbiwqo3q5vaudn65r0` (`i18n_id`);

--
-- Indexes for table `judgement_benchmark`
--
ALTER TABLE `judgement_benchmark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjoyd6ggs7omhd9dlbxjy94t7y` (`description_id`),
  ADD KEY `FKlskpjwxwwoex7awg7bdvfuewl` (`aspect_id`);

--
-- Indexes for table `mark`
--
ALTER TABLE `mark`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_mark` (`aspect_id`,`competitor_id`),
  ADD KEY `FKc4pv1v7rfvf4nvdp13c5mqlnv` (`competitor_id`);

--
-- Indexes for table `marking_day`
--
ALTER TABLE `marking_day`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3pe7pt2hjb0cwvj7owtjx37rs` (`competition_day_id`),
  ADD KEY `FKptqyda8eyieonxvrpe5wk0qhh` (`sub_criterion_id`);

--
-- Indexes for table `marking_day_competitor`
--
ALTER TABLE `marking_day_competitor`
  ADD PRIMARY KEY (`marking_day_id`,`competitor_id`),
  ADD KEY `FK10i2g9xah3t03t5v1hw51qxei` (`competitor_id`),
  ADD KEY `FK7yqv4a643014ckw2rhy8o09pd` (`competition_day_id`);

--
-- Indexes for table `marking_day_competitor_group`
--
ALTER TABLE `marking_day_competitor_group`
  ADD PRIMARY KEY (`marking_day_id`,`group_id`),
  ADD KEY `FKed1155tlwpeoafxw7pnpflxew` (`competition_day_id`),
  ADD KEY `FKpfqtuqg16qnynb1iju05ytu2k` (`group_id`);

--
-- Indexes for table `marking_scheme_edit_lock`
--
ALTER TABLE `marking_scheme_edit_lock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1rwqopf7r2uc7u70m8jox11bu` (`user_id`),
  ADD KEY `FKgx9gm3kp7cqtgdcstcaym7xty` (`skill_id`);

--
-- Indexes for table `marking_team`
--
ALTER TABLE `marking_team`
  ADD PRIMARY KEY (`sub_criterion_id`,`person_id`),
  ADD KEY `FKcblkw67ea4gic20mqvl4xws6j` (`person_id`);

--
-- Indexes for table `mark_comment`
--
ALTER TABLE `mark_comment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_mark_comment` (`aspect_id`,`competitor_id`,`commenter_id`),
  ADD KEY `FK_comment_competitor_participant` (`competitor_id`),
  ADD KEY `FK_comment_commenter_person` (`commenter_id`),
  ADD KEY `FK_comment_inserter_person` (`inserter_id`);

--
-- Indexes for table `mark_edit_lock`
--
ALTER TABLE `mark_edit_lock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKd581r9pwpjad909t84hdwbuse` (`sub_criterion_id`),
  ADD KEY `FKin89iob87gbkc7kn5s4g7qqqx` (`user_id`),
  ADD KEY `FKos72houa2ky2c9scaqftesiw7` (`competitor_id`);

--
-- Indexes for table `mark_judgement`
--
ALTER TABLE `mark_judgement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mark_judgement_entry`
--
ALTER TABLE `mark_judgement_entry`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_judgement_score` (`expert_id`,`mark_id`),
  ADD KEY `FK2rgeo9fsdnhqixgbqorrx71py` (`mark_id`),
  ADD KEY `FK5qega95ox9o2d7lmaxk5tsxl2` (`entered_by_person_id`),
  ADD KEY `FKpl282ady4ocx77wff2goy3a2` (`expert_id`);

--
-- Indexes for table `mark_lock`
--
ALTER TABLE `mark_lock`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_mark_lock` (`sub_criterion_id`,`competition_day_id`),
  ADD KEY `FKhoioh11f2ty2c4pad1y3cxxlv` (`competition_day_id`);

--
-- Indexes for table `mark_measurement`
--
ALTER TABLE `mark_measurement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKoiowfjdp5qyv7advscb5ihfl6` (`entered_by_person_id`);

--
-- Indexes for table `mark_pending_judgement`
--
ALTER TABLE `mark_pending_judgement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_pending_mark` (`aspect_id`,`competitor_id`),
  ADD KEY `FKgdf11c7kk73o7cy8jtuorb84p` (`competitor_id`);

--
-- Indexes for table `mark_pending_judgement_score`
--
ALTER TABLE `mark_pending_judgement_score`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_pending_score` (`marker_id`,`pending_judgement_id`),
  ADD KEY `FKnxqb55vb3gbwcoiwclhxp5mk7` (`pending_judgement_id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_4khba0d7ikbnm1uilh1po0u0c` (`code`),
  ADD KEY `FKbxx22k21kypsusuln400velnd` (`name_id`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKltl2dk33cemkl32l5fo3jmh85` (`member_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person_exclusion`
--
ALTER TABLE `person_exclusion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_exclusion` (`person_id`,`skill_id`),
  ADD KEY `FKe8o3ur605qx0ggipamv5dq094` (`skill_id`),
  ADD KEY `FKjeqwt4oioc8ypdobwox8ief1c` (`excluded_by_id`);

--
-- Indexes for table `person_position`
--
ALTER TABLE `person_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4299ch3ts73vy5xhxnbh95chl` (`position_id`),
  ADD KEY `FK5y0une17prgaxg9bl0rmyn8ex` (`skill_id`),
  ADD KEY `FKfgkrex0l1myaiqahk9c5c583b` (`person_id`);

--
-- Indexes for table `person_team`
--
ALTER TABLE `person_team`
  ADD UNIQUE KEY `UK_k0t32vjx93gttjmn2e7tkiih5` (`person_id`),
  ADD KEY `FK5nm4b09lhr8moaj39v27icmn5` (`team_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl9cndlh233d9s05rdv573uhxb` (`name_id`);

--
-- Indexes for table `scaled_score`
--
ALTER TABLE `scaled_score`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_scaled_score` (`skill_id`,`competitor_id`),
  ADD KEY `FKtlnsrtho5xbcdue9gaymo1kqi` (`competitor_id`);

--
-- Indexes for table `scaled_score_adjustment`
--
ALTER TABLE `scaled_score_adjustment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2l76u1qkqanvwjjs8hdru4m49` (`skill_id`),
  ADD KEY `FKbf6kbxroesai8oobftfcrjp92` (`competitor_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_soixu6c84j0y1prr6mudyd1i7` (`skill_number`),
  ADD KEY `FK2fxw850svhvu9sn960y806g10` (`name_id`);

--
-- Indexes for table `sub_criterion`
--
ALTER TABLE `sub_criterion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_sub_crit` (`criterion_id`,`number`),
  ADD KEY `FKajw2nx6nf0hg97bnx6hudcnc2` (`marking_supervisor_id`),
  ADD KEY `FKrhgi5skjx3fkywbfa27fs32nl` (`name_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5lk1pv04dox17jon7ecbvtrhf` (`skill_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD KEY `FK5ixd8ou7x5sln7b00u8qpf7il` (`group_id`),
  ADD KEY `FKir5g7yucydevmmc84i788jp79` (`person_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_group_permission`
--
ALTER TABLE `user_group_permission`
  ADD KEY `FKpvewqags2qqto6e9afvwadde` (`user_group_id`);

--
-- Indexes for table `ws_standards_spec`
--
ALTER TABLE `ws_standards_spec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9g55jvjikumoweek1r0tbyug8` (`name_id`),
  ADD KEY `FK9knyhj7va7v2v68r7ux2h17j2` (`skill_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aspect`
--
ALTER TABLE `aspect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_photo`
--
ALTER TABLE `assessment_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_event`
--
ALTER TABLE `audit_event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_event_data`
--
ALTER TABLE `audit_event_data`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `best_of_nation`
--
ALTER TABLE `best_of_nation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calculation`
--
ALTER TABLE `calculation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calculation_param_value`
--
ALTER TABLE `calculation_param_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `competition_day`
--
ALTER TABLE `competition_day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `competitor_marking_group`
--
ALTER TABLE `competitor_marking_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `criterion`
--
ALTER TABLE `criterion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `criterion_identifier`
--
ALTER TABLE `criterion_identifier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `i18n`
--
ALTER TABLE `i18n`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `i18n_value`
--
ALTER TABLE `i18n_value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `judgement_benchmark`
--
ALTER TABLE `judgement_benchmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark`
--
ALTER TABLE `mark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marking_day`
--
ALTER TABLE `marking_day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marking_scheme_edit_lock`
--
ALTER TABLE `marking_scheme_edit_lock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_comment`
--
ALTER TABLE `mark_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_edit_lock`
--
ALTER TABLE `mark_edit_lock`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_judgement_entry`
--
ALTER TABLE `mark_judgement_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_lock`
--
ALTER TABLE `mark_lock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_pending_judgement`
--
ALTER TABLE `mark_pending_judgement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_pending_judgement_score`
--
ALTER TABLE `mark_pending_judgement_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `person_exclusion`
--
ALTER TABLE `person_exclusion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `person_position`
--
ALTER TABLE `person_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `scaled_score`
--
ALTER TABLE `scaled_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `scaled_score_adjustment`
--
ALTER TABLE `scaled_score_adjustment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_criterion`
--
ALTER TABLE `sub_criterion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ws_standards_spec`
--
ALTER TABLE `ws_standards_spec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aspect`
--
ALTER TABLE `aspect`
  ADD CONSTRAINT `FK2iou7wnyynxp5vn9wsf7g1uma` FOREIGN KEY (`name_id`) REFERENCES `i18n` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK444t51encv5gob9ma9inr8mmw` FOREIGN KEY (`calculation_id`) REFERENCES `calculation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKj3v9n6oldeiqq7m6eo7b6urkb` FOREIGN KEY (`wsss_id`) REFERENCES `ws_standards_spec` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKmfqmig30nlsl1k619y63d4sd9` FOREIGN KEY (`sub_criterion_id`) REFERENCES `sub_criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `aspect_description_line`
--
ALTER TABLE `aspect_description_line`
  ADD CONSTRAINT `FK2ni00q8ss18u74od04nxmme5b` FOREIGN KEY (`aspect_id`) REFERENCES `aspect` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK3qev8hy07prmrbyt57p8w9d3d` FOREIGN KEY (`description_id`) REFERENCES `i18n` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `assessment_photo`
--
ALTER TABLE `assessment_photo`
  ADD CONSTRAINT `FK_assessment_photo_competitor` FOREIGN KEY (`competitor_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_assessment_photo_photographer` FOREIGN KEY (`photographer_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_assessment_photo_sub_criterion` FOREIGN KEY (`sub_criterion_id`) REFERENCES `sub_criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `audit_event_data`
--
ALTER TABLE `audit_event_data`
  ADD CONSTRAINT `FKrqodmr3f8wv85pi4g85i6s9tt` FOREIGN KEY (`audit_event_id`) REFERENCES `audit_event` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `best_of_nation`
--
ALTER TABLE `best_of_nation`
  ADD CONSTRAINT `FK1dv9kvg4rc3gppcm3103nrmwi` FOREIGN KEY (`competitor_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKlagnpd961oovgqds3bwaksr9d` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `calculation`
--
ALTER TABLE `calculation`
  ADD CONSTRAINT `FKcjw0gy9dm2r9su346oislfl44` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `calculation_param_value`
--
ALTER TABLE `calculation_param_value`
  ADD CONSTRAINT `FKdln3v7haeiif4xrepohcq7wrx` FOREIGN KEY (`calculation_id`) REFERENCES `calculation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `competitor_marking_group`
--
ALTER TABLE `competitor_marking_group`
  ADD CONSTRAINT `FKccuvm8tti18uolgu6dk9pyole` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `competitor_marking_grp_prtcpnt`
--
ALTER TABLE `competitor_marking_grp_prtcpnt`
  ADD CONSTRAINT `FK8jbji31h4elkoovscdm021sy4` FOREIGN KEY (`competitor_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKrchov8kg5eeao5eyjhpbwau0` FOREIGN KEY (`competitor_group_id`) REFERENCES `competitor_marking_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `criterion`
--
ALTER TABLE `criterion`
  ADD CONSTRAINT `FK60gp1wq1u80n4rpk60y39fy8a` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKb6un9rge8tdk8gd8g72boxran` FOREIGN KEY (`name_id`) REFERENCES `i18n` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKifgs3616jk0p80k4udg4x0004` FOREIGN KEY (`identifier_id`) REFERENCES `criterion_identifier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `i18n_value`
--
ALTER TABLE `i18n_value`
  ADD CONSTRAINT `FKecxityxpbiwqo3q5vaudn65r0` FOREIGN KEY (`i18n_id`) REFERENCES `i18n` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `judgement_benchmark`
--
ALTER TABLE `judgement_benchmark`
  ADD CONSTRAINT `FKjoyd6ggs7omhd9dlbxjy94t7y` FOREIGN KEY (`description_id`) REFERENCES `i18n` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKlskpjwxwwoex7awg7bdvfuewl` FOREIGN KEY (`aspect_id`) REFERENCES `aspect` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mark`
--
ALTER TABLE `mark`
  ADD CONSTRAINT `FK5ggkdda226n8mac1kl7865fuv` FOREIGN KEY (`aspect_id`) REFERENCES `aspect` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKc4pv1v7rfvf4nvdp13c5mqlnv` FOREIGN KEY (`competitor_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `marking_day`
--
ALTER TABLE `marking_day`
  ADD CONSTRAINT `FK3pe7pt2hjb0cwvj7owtjx37rs` FOREIGN KEY (`competition_day_id`) REFERENCES `competition_day` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKptqyda8eyieonxvrpe5wk0qhh` FOREIGN KEY (`sub_criterion_id`) REFERENCES `sub_criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `marking_day_competitor`
--
ALTER TABLE `marking_day_competitor`
  ADD CONSTRAINT `FK10i2g9xah3t03t5v1hw51qxei` FOREIGN KEY (`competitor_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK1t7qcwdixqjon49yl6bbg9l39` FOREIGN KEY (`marking_day_id`) REFERENCES `marking_day` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK7yqv4a643014ckw2rhy8o09pd` FOREIGN KEY (`competition_day_id`) REFERENCES `competition_day` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `marking_day_competitor_group`
--
ALTER TABLE `marking_day_competitor_group`
  ADD CONSTRAINT `FKed1155tlwpeoafxw7pnpflxew` FOREIGN KEY (`competition_day_id`) REFERENCES `competition_day` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKpfqtuqg16qnynb1iju05ytu2k` FOREIGN KEY (`group_id`) REFERENCES `competitor_marking_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKtqj9raglxaf9709r24uqug7wb` FOREIGN KEY (`marking_day_id`) REFERENCES `marking_day` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `marking_scheme_edit_lock`
--
ALTER TABLE `marking_scheme_edit_lock`
  ADD CONSTRAINT `FK1rwqopf7r2uc7u70m8jox11bu` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKgx9gm3kp7cqtgdcstcaym7xty` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `marking_team`
--
ALTER TABLE `marking_team`
  ADD CONSTRAINT `FKcblkw67ea4gic20mqvl4xws6j` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKqgcf3o39xdrny1vphop3crk9w` FOREIGN KEY (`sub_criterion_id`) REFERENCES `sub_criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mark_comment`
--
ALTER TABLE `mark_comment`
  ADD CONSTRAINT `FK_comment_aspect` FOREIGN KEY (`aspect_id`) REFERENCES `aspect` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_comment_commenter_person` FOREIGN KEY (`commenter_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_comment_competitor_participant` FOREIGN KEY (`competitor_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_comment_inserter_person` FOREIGN KEY (`inserter_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mark_edit_lock`
--
ALTER TABLE `mark_edit_lock`
  ADD CONSTRAINT `FKd581r9pwpjad909t84hdwbuse` FOREIGN KEY (`sub_criterion_id`) REFERENCES `sub_criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKin89iob87gbkc7kn5s4g7qqqx` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKos72houa2ky2c9scaqftesiw7` FOREIGN KEY (`competitor_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mark_judgement`
--
ALTER TABLE `mark_judgement`
  ADD CONSTRAINT `FK9fy6jk2fjlihm3ajikin5n5g8` FOREIGN KEY (`id`) REFERENCES `mark` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mark_judgement_entry`
--
ALTER TABLE `mark_judgement_entry`
  ADD CONSTRAINT `FK2rgeo9fsdnhqixgbqorrx71py` FOREIGN KEY (`mark_id`) REFERENCES `mark_judgement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK5qega95ox9o2d7lmaxk5tsxl2` FOREIGN KEY (`entered_by_person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKpl282ady4ocx77wff2goy3a2` FOREIGN KEY (`expert_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mark_lock`
--
ALTER TABLE `mark_lock`
  ADD CONSTRAINT `FKe3bj1c3kxcypd0ic8omo3rsb3` FOREIGN KEY (`sub_criterion_id`) REFERENCES `sub_criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKhoioh11f2ty2c4pad1y3cxxlv` FOREIGN KEY (`competition_day_id`) REFERENCES `competition_day` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mark_measurement`
--
ALTER TABLE `mark_measurement`
  ADD CONSTRAINT `FKoiowfjdp5qyv7advscb5ihfl6` FOREIGN KEY (`entered_by_person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKoosvk1f2djnyxjhxc2mbo9w7k` FOREIGN KEY (`id`) REFERENCES `mark` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mark_pending_judgement`
--
ALTER TABLE `mark_pending_judgement`
  ADD CONSTRAINT `FKgdf11c7kk73o7cy8jtuorb84p` FOREIGN KEY (`competitor_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKjpdexlq2d5vpn67q05yv5mc84` FOREIGN KEY (`aspect_id`) REFERENCES `aspect` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `mark_pending_judgement_score`
--
ALTER TABLE `mark_pending_judgement_score`
  ADD CONSTRAINT `FKdx4qw3cvm4i71fyf50abdanea` FOREIGN KEY (`marker_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKnxqb55vb3gbwcoiwclhxp5mk7` FOREIGN KEY (`pending_judgement_id`) REFERENCES `mark_pending_judgement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `FKbxx22k21kypsusuln400velnd` FOREIGN KEY (`name_id`) REFERENCES `i18n` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FKltl2dk33cemkl32l5fo3jmh85` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `FK99fhoaemh8dht5bk13m3snhw2` FOREIGN KEY (`id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `person_exclusion`
--
ALTER TABLE `person_exclusion`
  ADD CONSTRAINT `FK9pe64vod3xc5i376cclgqftu9` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKe8o3ur605qx0ggipamv5dq094` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKjeqwt4oioc8ypdobwox8ief1c` FOREIGN KEY (`excluded_by_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `person_position`
--
ALTER TABLE `person_position`
  ADD CONSTRAINT `FK4299ch3ts73vy5xhxnbh95chl` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK5y0une17prgaxg9bl0rmyn8ex` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKfgkrex0l1myaiqahk9c5c583b` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `person_team`
--
ALTER TABLE `person_team`
  ADD CONSTRAINT `FK4n0ts32m2ffsjoyp98isswvdx` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK5nm4b09lhr8moaj39v27icmn5` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `position`
--
ALTER TABLE `position`
  ADD CONSTRAINT `FKl9cndlh233d9s05rdv573uhxb` FOREIGN KEY (`name_id`) REFERENCES `i18n` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `scaled_score`
--
ALTER TABLE `scaled_score`
  ADD CONSTRAINT `FKb6obfwvashwhi1j9r4wn3d41m` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKtlnsrtho5xbcdue9gaymo1kqi` FOREIGN KEY (`competitor_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `scaled_score_adjustment`
--
ALTER TABLE `scaled_score_adjustment`
  ADD CONSTRAINT `FK2l76u1qkqanvwjjs8hdru4m49` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKbf6kbxroesai8oobftfcrjp92` FOREIGN KEY (`competitor_id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `FK2fxw850svhvu9sn960y806g10` FOREIGN KEY (`name_id`) REFERENCES `i18n` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sub_criterion`
--
ALTER TABLE `sub_criterion`
  ADD CONSTRAINT `FKa9l63ovehm9fx8c0h2kmmsh3r` FOREIGN KEY (`criterion_id`) REFERENCES `criterion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKajw2nx6nf0hg97bnx6hudcnc2` FOREIGN KEY (`marking_supervisor_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKrhgi5skjx3fkywbfa27fs32nl` FOREIGN KEY (`name_id`) REFERENCES `i18n` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `FK5lk1pv04dox17jon7ecbvtrhf` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKaa8qsbvh4jltjbk4jdce41851` FOREIGN KEY (`id`) REFERENCES `participant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK5ixd8ou7x5sln7b00u8qpf7il` FOREIGN KEY (`group_id`) REFERENCES `user_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FKir5g7yucydevmmc84i788jp79` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_group_permission`
--
ALTER TABLE `user_group_permission`
  ADD CONSTRAINT `FKpvewqags2qqto6e9afvwadde` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ws_standards_spec`
--
ALTER TABLE `ws_standards_spec`
  ADD CONSTRAINT `FK9g55jvjikumoweek1r0tbyug8` FOREIGN KEY (`name_id`) REFERENCES `i18n` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK9knyhj7va7v2v68r7ux2h17j2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
