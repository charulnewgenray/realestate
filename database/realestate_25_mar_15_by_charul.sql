-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 25, 2015 at 03:56 AM
-- Server version: 5.1.61-community
-- PHP Version: 5.6.3

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `realestate`
--

-- --------------------------------------------------------

--
-- Table structure for table `application_pdfs`
--

CREATE TABLE IF NOT EXISTS `application_pdfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `application_no` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `assigned_roles`
--

CREATE TABLE IF NOT EXISTS `assigned_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assigned_roles_user_id_foreign` (`user_id`),
  KEY `assigned_roles_role_id_foreign` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=21 ;

--
-- Dumping data for table `assigned_roles`
--

INSERT INTO `assigned_roles` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 6, 3),
(9, 12, 4),
(14, 17, 3),
(15, 18, 4),
(20, 24, 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer_application_log`
--

CREATE TABLE IF NOT EXISTS `customer_application_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_application_status`
--

CREATE TABLE IF NOT EXISTS `customer_application_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `customer_application_status`
--

INSERT INTO `customer_application_status` (`id`, `status`) VALUES
(1, 'Submitted'),
(2, 'Reviewing'),
(3, 'Processing'),
(4, 'Found Defects'),
(5, 'On Hold'),
(6, 'Approved'),
(7, 'Draft'),
(8, 'Completed'),
(9, 'Canceled');

-- --------------------------------------------------------

--
-- Table structure for table `customer_application_table`
--

CREATE TABLE IF NOT EXISTS `customer_application_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) NOT NULL,
  `table_heading` varchar(255) NOT NULL,
  `section` int(11) NOT NULL DEFAULT '1',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `customer_application_table`
--

INSERT INTO `customer_application_table` (`id`, `table_name`, `table_heading`, `section`, `updated_at`, `created_at`) VALUES
(1, 'customer_personal_information', 'Personal Information', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'customer_occupants_information', 'Occupants Information', 1, '2015-03-23 01:03:10', '0000-00-00 00:00:00'),
(7, 'customer_current_residence_history', 'Current Residence History', 1, '2015-03-23 01:03:24', '2015-03-22 15:05:05'),
(8, 'customer_previous_residence_history', 'Previous Residence History', 1, '2015-03-22 15:07:07', '2015-03-22 14:05:06'),
(9, 'customer_prior_residence_history', 'Prior Residence History', 1, '2015-03-22 13:00:00', '2015-03-22 13:00:00'),
(10, 'customer_current_employment_history', 'Current Employment History', 2, '2015-03-23 01:03:31', '0000-00-00 00:00:00'),
(11, 'customer_previous_employment_history', 'Previous Employment History', 2, '2015-03-23 01:03:35', '0000-00-00 00:00:00'),
(12, 'customer_prior_employment_history', 'Prior Employment History', 2, '2015-03-23 01:13:15', '0000-00-00 00:00:00'),
(13, 'customer_saving_credit_history', 'Saving Credit History', 2, '2015-03-23 01:03:48', '0000-00-00 00:00:00'),
(14, 'customer_checking_credit_history', 'Checking Credit History', 2, '2015-03-23 01:03:51', '0000-00-00 00:00:00'),
(15, 'customer_credit_credit_history', 'Credit Credit History', 2, '2015-03-23 01:03:54', '0000-00-00 00:00:00'),
(16, 'customer_auto_credit_history', 'Auto Credit History', 2, '2015-03-23 01:03:57', '0000-00-00 00:00:00'),
(17, 'customer_vehicles', 'Vehicles', 3, '2015-03-23 01:04:00', '0000-00-00 00:00:00'),
(18, 'customer_doctor_references', 'Doctor Refernces', 3, '2015-03-23 01:04:11', '0000-00-00 00:00:00'),
(19, 'customer_lawyer_references', 'Lawyer Refernces', 3, '2015-03-23 01:04:14', '0000-00-00 00:00:00'),
(20, 'customer_native_references', 'Native Refernces', 3, '2015-03-23 01:04:18', '0000-00-00 00:00:00'),
(21, 'customer_general_information', 'General Information', 4, '2015-03-23 01:04:29', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_auto_credit_history`
--

CREATE TABLE IF NOT EXISTS `customer_auto_credit_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `aut_bank_name` varchar(255) DEFAULT NULL,
  `aut_balance` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_auto_credit_history`
--

INSERT INTO `customer_auto_credit_history` (`id`, `application_no`, `aut_bank_name`, `aut_balance`) VALUES
(1, 5, '', ''),
(2, 1, '', ''),
(3, 4, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_auto_credit_history_map`
--

CREATE TABLE IF NOT EXISTS `customer_auto_credit_history_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_auto_credit_history_map`
--

INSERT INTO `customer_auto_credit_history_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'aut_bank_name', 'text', 'Bank Name', 1, 1),
(3, 'aut_balance', 'text', 'Balance', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_auto_credit_history_meta`
--

CREATE TABLE IF NOT EXISTS `customer_auto_credit_history_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_checking_credit_history`
--

CREATE TABLE IF NOT EXISTS `customer_checking_credit_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `che_bank_name` varchar(255) DEFAULT NULL,
  `che_balance` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_checking_credit_history`
--

INSERT INTO `customer_checking_credit_history` (`id`, `application_no`, `che_bank_name`, `che_balance`) VALUES
(1, 5, '', ''),
(2, 1, '', ''),
(3, 4, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_checking_credit_history_map`
--

CREATE TABLE IF NOT EXISTS `customer_checking_credit_history_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_checking_credit_history_map`
--

INSERT INTO `customer_checking_credit_history_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'che_bank_name', 'text', 'Bank Name', 1, 1),
(3, 'che_balance', 'text', 'Balance', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_checking_credit_history_meta`
--

CREATE TABLE IF NOT EXISTS `customer_checking_credit_history_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_credit_credit_history`
--

CREATE TABLE IF NOT EXISTS `customer_credit_credit_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `cre_bank_name` varchar(255) DEFAULT NULL,
  `cre_balance` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_credit_credit_history`
--

INSERT INTO `customer_credit_credit_history` (`id`, `application_no`, `cre_bank_name`, `cre_balance`) VALUES
(1, 5, '', ''),
(2, 1, '', ''),
(3, 4, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_credit_credit_history_map`
--

CREATE TABLE IF NOT EXISTS `customer_credit_credit_history_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_credit_credit_history_map`
--

INSERT INTO `customer_credit_credit_history_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'cre_bank_name', 'text', 'Bank Name', 1, 1),
(3, 'cre_balance', 'text', 'Balance', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_credit_credit_history_meta`
--

CREATE TABLE IF NOT EXISTS `customer_credit_credit_history_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_current_employment_history`
--

CREATE TABLE IF NOT EXISTS `customer_current_employment_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `cur_emp_company` varchar(255) DEFAULT NULL,
  `cur_emp_address` varchar(255) DEFAULT NULL,
  `cur_emp_phone_no` varchar(255) DEFAULT NULL,
  `cur_emp_occupation` varchar(255) DEFAULT NULL,
  `cur_emp_supervisor` varchar(255) DEFAULT NULL,
  `cur_emp_gross_pay` varchar(255) DEFAULT NULL,
  `cur_emp_employment_from` varchar(255) DEFAULT NULL,
  `cur_emp_employment_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_current_employment_history`
--

INSERT INTO `customer_current_employment_history` (`id`, `application_no`, `cur_emp_company`, `cur_emp_address`, `cur_emp_phone_no`, `cur_emp_occupation`, `cur_emp_supervisor`, `cur_emp_gross_pay`, `cur_emp_employment_from`, `cur_emp_employment_to`) VALUES
(1, 5, 'newgen', '', '', '', '', '', '', ''),
(2, 5, 'newgen', '', '', '', '', '', '', ''),
(3, 1, '', '', '', '', '', '', '', ''),
(4, 4, 'newgen', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_current_employment_history_map`
--

CREATE TABLE IF NOT EXISTS `customer_current_employment_history_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `customer_current_employment_history_map`
--

INSERT INTO `customer_current_employment_history_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'cur_emp_company', 'text', 'Company', 1, 1),
(3, 'cur_emp_address', 'text', 'Address', 1, 1),
(4, 'cur_emp_phone_no', 'text', 'Phone No', 1, 1),
(5, 'cur_emp_occupation', 'text', 'Occupation', 1, 1),
(6, 'cur_emp_supervisor', 'text', 'Supervisor', 1, 1),
(7, 'cur_emp_gross_pay', 'text', 'Gross Pay', 1, 1),
(8, 'cur_emp_employment_from', 'text', 'Employment From', 1, 1),
(9, 'cur_emp_employment_to', 'text', 'Employment To', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_current_employment_history_meta`
--

CREATE TABLE IF NOT EXISTS `customer_current_employment_history_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_current_residence_history`
--

CREATE TABLE IF NOT EXISTS `customer_current_residence_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `cur_address` varchar(255) DEFAULT NULL,
  `cur_state` varchar(255) DEFAULT NULL,
  `cur_city` varchar(255) DEFAULT NULL,
  `cur_last_amount_paid` varchar(255) DEFAULT NULL,
  `cur_owner` varchar(255) DEFAULT NULL,
  `cur_phone_no` varchar(255) DEFAULT NULL,
  `cur_reason_for_leaving` varchar(255) DEFAULT NULL,
  `cur_rent_paid_full` varchar(10) DEFAULT NULL,
  `cur_give_notice` varchar(10) DEFAULT NULL,
  `cur_asked_to_move` varchar(255) DEFAULT NULL,
  `cur_utilities` varchar(255) DEFAULT NULL,
  `cur_residence_from` varchar(255) DEFAULT NULL,
  `cur_residence_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_current_residence_history`
--

INSERT INTO `customer_current_residence_history` (`id`, `application_no`, `cur_address`, `cur_state`, `cur_city`, `cur_last_amount_paid`, `cur_owner`, `cur_phone_no`, `cur_reason_for_leaving`, `cur_rent_paid_full`, `cur_give_notice`, `cur_asked_to_move`, `cur_utilities`, `cur_residence_from`, `cur_residence_to`) VALUES
(1, 5, '', 'up ciur', '', '', '', '', '', '', '', '', '', '', ''),
(2, 5, '', 'up ciur', '', '', '', '', '', '', '', '', '', '', ''),
(3, 1, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 4, '', 'up ciur', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_current_residence_history_map`
--

CREATE TABLE IF NOT EXISTS `customer_current_residence_history_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `customer_current_residence_history_map`
--

INSERT INTO `customer_current_residence_history_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'cur_address', 'text', 'Address', 1, 1),
(3, 'cur_state', 'text', 'State', 1, 1),
(4, 'cur_city', 'text', 'City', 1, 1),
(5, 'cur_last_amount_paid', 'text', 'Last Amount Paid', 1, 1),
(6, 'cur_owner', 'text', 'Owner', 1, 1),
(7, 'cur_phone_no', 'text', 'Phone No', 1, 1),
(8, 'cur_reason_for_leaving', 'text', 'Reason For Leaving', 1, 1),
(9, 'cur_rent_paid_full', 'text', 'Rent Paid Full', 1, 1),
(10, 'cur_give_notice', 'text', 'Give Notice', 1, 1),
(11, 'cur_asked_to_move', 'text', 'Asked To Move', 1, 1),
(12, 'cur_utilities', 'text', 'Utilities', 1, 1),
(13, 'cur_residence_from', 'text', 'Residence From', 1, 1),
(14, 'cur_residence_to', 'text', 'Residence To', 1, 1),
(15, 'location', 'text', 'Location', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_current_residence_history_meta`
--

CREATE TABLE IF NOT EXISTS `customer_current_residence_history_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `customer_current_residence_history_meta`
--

INSERT INTO `customer_current_residence_history_meta` (`id`, `application_no`, `field_name`, `field_value`) VALUES
(4, 4, 'location', ''),
(9, 5, 'location', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_doctor_references`
--

CREATE TABLE IF NOT EXISTS `customer_doctor_references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `doc_name` varchar(255) DEFAULT NULL,
  `doc_address` varchar(255) DEFAULT NULL,
  `doc_city` varchar(255) DEFAULT NULL,
  `doc_state` varchar(255) DEFAULT NULL,
  `doc_zip_code` varchar(255) DEFAULT NULL,
  `doc_contact_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_doctor_references`
--

INSERT INTO `customer_doctor_references` (`id`, `application_no`, `doc_name`, `doc_address`, `doc_city`, `doc_state`, `doc_zip_code`, `doc_contact_no`) VALUES
(1, 5, '', '', '', '', '', ''),
(2, 1, '', '', '', '', '', ''),
(3, 4, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_doctor_references_map`
--

CREATE TABLE IF NOT EXISTS `customer_doctor_references_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `customer_doctor_references_map`
--

INSERT INTO `customer_doctor_references_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'doc_name', 'text', 'Name', 1, 1),
(3, 'doc_address', 'text', 'Address', 1, 1),
(4, 'doc_city', 'text', 'City', 1, 1),
(5, 'doc_state', 'text', 'State', 1, 1),
(6, 'doc_zip_code', 'text', 'Zip Code', 1, 1),
(7, 'doc_contact_no', 'text', 'Contact No', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_doctor_references_meta`
--

CREATE TABLE IF NOT EXISTS `customer_doctor_references_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_general_information`
--

CREATE TABLE IF NOT EXISTS `customer_general_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `question_1` varchar(255) DEFAULT NULL,
  `question_2` varchar(255) DEFAULT NULL,
  `question_3` varchar(255) DEFAULT NULL,
  `question_4` varchar(255) DEFAULT NULL,
  `question_5` varchar(255) DEFAULT NULL,
  `question_6` varchar(255) DEFAULT NULL,
  `question_7` varchar(255) DEFAULT NULL,
  `question_8` varchar(255) DEFAULT NULL,
  `question_9` varchar(255) DEFAULT NULL,
  `question_10` varchar(255) DEFAULT NULL,
  `question_11` varchar(255) DEFAULT NULL,
  `question_12` varchar(255) DEFAULT NULL,
  `question_13` varchar(255) DEFAULT NULL,
  `question_14` varchar(255) DEFAULT NULL,
  `question_15` varchar(255) DEFAULT NULL,
  `question_16` varchar(255) DEFAULT NULL,
  `question_17` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_general_information`
--

INSERT INTO `customer_general_information` (`id`, `application_no`, `question_1`, `question_2`, `question_3`, `question_4`, `question_5`, `question_6`, `question_7`, `question_8`, `question_9`, `question_10`, `question_11`, `question_12`, `question_13`, `question_14`, `question_15`, `question_16`, `question_17`) VALUES
(1, 5, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 1, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 4, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_general_information_map`
--

CREATE TABLE IF NOT EXISTS `customer_general_information_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` text NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `customer_general_information_map`
--

INSERT INTO `customer_general_information_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'question_1', 'text', 'Have you ever served a late rent notice?', 1, 1),
(3, 'question_2', 'text', 'Do any of the people who would be living in the apartment smoke?', 1, 1),
(4, 'question_3', 'text', 'How long do you think you would be txt from us ?', 1, 1),
(5, 'question_4', 'text', 'Have you ever filed for bankruptcy if so when?', 1, 1),
(6, 'question_5', 'text', 'When you would be able to move in ?', 1, 1),
(7, 'question_6', 'text', 'Have you ever been convicted txt ?', 1, 1),
(8, 'question_7', 'text', 'Have you ever been served txt notice if so when ?', 1, 1),
(9, 'question_8', 'text', 'How many pets do you have(list, type,breed, approx weight& age) ?', 1, 1),
(10, 'question_9', 'text', 'Have you had any recurring problem with your current apartment or landlord if yes please explain:', 1, 1),
(11, 'question_10', 'text', 'Why are you moving fom current address?', 1, 1),
(12, 'question_11', 'text', 'List any verifiable source and amount of income you txt to have considered.', 1, 1),
(13, 'question_12', 'text', 'If you were late financial difficulties in the future and coud''t come up with the messy to pay rent, do you know someone would loan you the money? If so provide the person''s name address and phone # so that we can use them as a reference for you.', 1, 1),
(14, 'question_13', 'text', 'Have you been a party to lawsuits in the past ? if you please explain Why ??', 1, 1),
(15, 'question_14', 'text', 'We may run a credit check and criminal background check , is there anything negative we will find that you want comment on ? ?', 1, 1),
(16, 'question_15', 'text', 'How did you hear about this apartment ?', 1, 1),
(17, 'question_16', 'text', 'Do you have email address we can reach you at?', 1, 1),
(18, 'question_17', 'text', 'Do you know anybody is looking for an apartment? please provide us their name and number,if you refer a friend and you each end up renting seperate apartment from us then we will pay you referral award.', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_general_information_meta`
--

CREATE TABLE IF NOT EXISTS `customer_general_information_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_lawyer_references`
--

CREATE TABLE IF NOT EXISTS `customer_lawyer_references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `law_name` varchar(255) DEFAULT NULL,
  `law_address` varchar(255) DEFAULT NULL,
  `law_city` varchar(255) DEFAULT NULL,
  `law_state` varchar(255) DEFAULT NULL,
  `law_zip_code` varchar(255) DEFAULT NULL,
  `law_contact_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_lawyer_references`
--

INSERT INTO `customer_lawyer_references` (`id`, `application_no`, `law_name`, `law_address`, `law_city`, `law_state`, `law_zip_code`, `law_contact_no`) VALUES
(1, 5, '', '', '', '', '', ''),
(2, 1, '', '', '', '', '', ''),
(3, 4, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_lawyer_references_map`
--

CREATE TABLE IF NOT EXISTS `customer_lawyer_references_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `customer_lawyer_references_map`
--

INSERT INTO `customer_lawyer_references_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'law_name', 'text', 'Name', 1, 1),
(3, 'law_address', 'text', 'Address', 1, 1),
(4, 'law_city', 'text', 'City', 1, 1),
(5, 'law_state', 'text', 'State', 1, 1),
(6, 'law_zip_code', 'text', 'Zip Code', 1, 1),
(7, 'law_contact_no', 'text', 'Contact No', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_lawyer_references_meta`
--

CREATE TABLE IF NOT EXISTS `customer_lawyer_references_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_native_references`
--

CREATE TABLE IF NOT EXISTS `customer_native_references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `nat_name` varchar(255) DEFAULT NULL,
  `nat_address` varchar(255) DEFAULT NULL,
  `nat_city` varchar(255) DEFAULT NULL,
  `nat_state` varchar(255) DEFAULT NULL,
  `nat_zip_code` varchar(255) DEFAULT NULL,
  `nat_contact_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_native_references`
--

INSERT INTO `customer_native_references` (`id`, `application_no`, `nat_name`, `nat_address`, `nat_city`, `nat_state`, `nat_zip_code`, `nat_contact_no`) VALUES
(1, 5, '', '', '', '', '', ''),
(2, 1, '', '', '', '', '', ''),
(3, 4, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_native_references_map`
--

CREATE TABLE IF NOT EXISTS `customer_native_references_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `customer_native_references_map`
--

INSERT INTO `customer_native_references_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'nat_name', 'text', 'Name', 1, 1),
(3, 'nat_address', 'text', 'Address', 1, 1),
(4, 'nat_city', 'text', 'City', 1, 1),
(5, 'nat_state', 'text', 'State', 1, 1),
(6, 'nat_zip_code', 'text', 'Zip Code', 1, 1),
(7, 'nat_contact_no', 'text', 'Contact No', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_native_references_meta`
--

CREATE TABLE IF NOT EXISTS `customer_native_references_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_occupants_information`
--

CREATE TABLE IF NOT EXISTS `customer_occupants_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) DEFAULT NULL,
  `occupant_name` varchar(255) DEFAULT NULL,
  `occupant_dob` varchar(255) DEFAULT NULL,
  `occupant_relationship` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_occupants_information`
--

INSERT INTO `customer_occupants_information` (`id`, `application_no`, `occupant_name`, `occupant_dob`, `occupant_relationship`) VALUES
(1, 5, 'occ', '', ''),
(2, 5, 'occ', '', ''),
(3, 1, '', '', ''),
(4, 4, 'occ', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_occupants_information_map`
--

CREATE TABLE IF NOT EXISTS `customer_occupants_information_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `customer_occupants_information_map`
--

INSERT INTO `customer_occupants_information_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'occupant_name', 'text', 'Occupant Name', 1, 1),
(3, 'occupant_dob', 'text', 'Occupant Dob', 1, 1),
(4, 'occupant_relationship', 'text', 'Occupant Relationship', 1, 1),
(5, 'new_occupant', 'text', 'New occupant', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_occupants_information_meta`
--

CREATE TABLE IF NOT EXISTS `customer_occupants_information_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `customer_occupants_information_meta`
--

INSERT INTO `customer_occupants_information_meta` (`id`, `application_no`, `field_name`, `field_value`) VALUES
(88, 1, 'new_occupant', ''),
(96, 4, 'new_occupant', ''),
(101, 5, 'new_occupant', 'fgghh');

-- --------------------------------------------------------

--
-- Table structure for table `customer_personal_information`
--

CREATE TABLE IF NOT EXISTS `customer_personal_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `social_security` varchar(255) DEFAULT NULL,
  `driver_licence` varchar(255) DEFAULT NULL,
  `past_name` varchar(255) DEFAULT NULL,
  `home_phone` varchar(255) DEFAULT NULL,
  `cell_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `customer_personal_information`
--

INSERT INTO `customer_personal_information` (`id`, `application_no`, `first_name`, `middle_name`, `last_name`, `email`, `dob`, `social_security`, `driver_licence`, `past_name`, `home_phone`, `cell_phone`) VALUES
(1, 5, 'charul', 'tyagi', '', '', '', '', '', '', '', ''),
(2, 5, 'charul', 'tyagi', '', '', '', '', '', '', '', ''),
(3, 1, '', '', '', '', '', '', '', '', '', ''),
(8, 4, 'charul', 'tyagi', '', 'gmail', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_personal_information_map`
--

CREATE TABLE IF NOT EXISTS `customer_personal_information_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `customer_personal_information_map`
--

INSERT INTO `customer_personal_information_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'first_name', 'text', 'First Name', 1, 1),
(3, 'middle_name', 'text', 'Middle Name', 1, 1),
(4, 'last_name', 'text', 'Last Name', 1, 1),
(5, 'email', 'text', 'Email', 1, 1),
(6, 'dob', 'text', 'DOB', 1, 1),
(7, 'social_security', 'text', 'Social Security', 1, 1),
(8, 'driver_licence', 'text', 'Driver Licence', 1, 1),
(9, 'past_name', 'text', 'Past Name', 1, 1),
(10, 'home_phone', 'text', 'Home Phone', 1, 1),
(11, 'cell_phone', 'text', 'Cell Phone', 1, 1),
(24, 'message', 'textarea', 'Message', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer_personal_information_meta`
--

CREATE TABLE IF NOT EXISTS `customer_personal_information_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=134 ;

--
-- Dumping data for table `customer_personal_information_meta`
--

INSERT INTO `customer_personal_information_meta` (`id`, `application_no`, `field_name`, `field_value`) VALUES
(112, 1, 'Email3', ''),
(128, 4, 'message', ''),
(133, 5, 'message', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_previous_employment_history`
--

CREATE TABLE IF NOT EXISTS `customer_previous_employment_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `pre_emp_company` varchar(255) DEFAULT NULL,
  `pre_emp_address` varchar(255) DEFAULT NULL,
  `pre_emp_phone_no` varchar(255) DEFAULT NULL,
  `pre_emp_occupation` varchar(255) DEFAULT NULL,
  `pre_emp_supervisor` varchar(255) DEFAULT NULL,
  `pre_emp_gross_pay` varchar(255) DEFAULT NULL,
  `pre_emp_employment_from` varchar(255) DEFAULT NULL,
  `pre_emp_employment_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_previous_employment_history`
--

INSERT INTO `customer_previous_employment_history` (`id`, `application_no`, `pre_emp_company`, `pre_emp_address`, `pre_emp_phone_no`, `pre_emp_occupation`, `pre_emp_supervisor`, `pre_emp_gross_pay`, `pre_emp_employment_from`, `pre_emp_employment_to`) VALUES
(1, 5, '', '', '', '', '', '', '', ''),
(2, 1, '', '', '', '', '', '', '', ''),
(3, 4, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_previous_employment_history_map`
--

CREATE TABLE IF NOT EXISTS `customer_previous_employment_history_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `customer_previous_employment_history_map`
--

INSERT INTO `customer_previous_employment_history_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'pre_emp_company', 'text', 'Company', 1, 1),
(3, 'pre_emp_address', 'text', 'Address', 1, 1),
(4, 'pre_emp_phone_no', 'text', 'Phone No', 1, 1),
(5, 'pre_emp_occupation', 'text', 'Occupation', 1, 1),
(6, 'pre_emp_supervisor', 'text', 'Supervisor', 1, 1),
(7, 'pre_emp_gross_pay', 'text', 'Gross Pay', 1, 1),
(8, 'pre_emp_employment_from', 'text', 'Employment From', 1, 1),
(9, 'pre_emp_employment_to', 'text', 'Employment To', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_previous_employment_history_meta`
--

CREATE TABLE IF NOT EXISTS `customer_previous_employment_history_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_previous_residence_history`
--

CREATE TABLE IF NOT EXISTS `customer_previous_residence_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `pre_address` varchar(255) DEFAULT NULL,
  `pre_state` varchar(255) DEFAULT NULL,
  `pre_city` varchar(255) DEFAULT NULL,
  `pre_last_amount_paid` varchar(255) DEFAULT NULL,
  `pre_owner` varchar(255) DEFAULT NULL,
  `pre_phone_no` varchar(255) DEFAULT NULL,
  `pre_reason_for_leaving` varchar(255) DEFAULT NULL,
  `pre_rent_paid_full` varchar(10) DEFAULT NULL,
  `pre_give_notice` varchar(10) DEFAULT NULL,
  `pre_asked_to_move` varchar(255) DEFAULT NULL,
  `pre_utilities` varchar(255) DEFAULT NULL,
  `pre_residence_from` varchar(255) DEFAULT NULL,
  `pre_residence_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_previous_residence_history`
--

INSERT INTO `customer_previous_residence_history` (`id`, `application_no`, `pre_address`, `pre_state`, `pre_city`, `pre_last_amount_paid`, `pre_owner`, `pre_phone_no`, `pre_reason_for_leaving`, `pre_rent_paid_full`, `pre_give_notice`, `pre_asked_to_move`, `pre_utilities`, `pre_residence_from`, `pre_residence_to`) VALUES
(1, 5, '', 'up pre', '', '', '', '', '', '', '', '', '', '', ''),
(2, 5, '', 'up pre', '', '', '', '', '', '', '', '', '', '', ''),
(3, 1, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 4, '', 'up pre', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_previous_residence_history_map`
--

CREATE TABLE IF NOT EXISTS `customer_previous_residence_history_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `customer_previous_residence_history_map`
--

INSERT INTO `customer_previous_residence_history_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'pre_address', 'text', 'Address', 1, 1),
(3, 'pre_state', 'text', 'State', 1, 1),
(4, 'pre_city', 'text', 'City', 1, 1),
(5, 'pre_last_amount_paid', 'text', 'Last Amount Paid', 1, 1),
(6, 'pre_owner', 'text', 'Owner', 1, 1),
(7, 'pre_phone_no', 'text', 'Phone No', 1, 1),
(8, 'pre_reason_for_leaving', 'text', 'Reason For Leaving', 1, 1),
(9, 'pre_rent_paid_full', 'text', 'Rent Paid Full', 1, 1),
(10, 'pre_give_notice', 'text', 'Give Notice', 1, 1),
(11, 'pre_asked_to_move', 'text', 'Asked To Move', 1, 1),
(12, 'pre_utilities', 'text', 'Utilities', 1, 1),
(13, 'pre_residence_from', 'text', 'Residence From', 1, 1),
(14, 'pre_residence_to', 'text', 'Residence To', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_previous_residence_history_meta`
--

CREATE TABLE IF NOT EXISTS `customer_previous_residence_history_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_prior_employment_history`
--

CREATE TABLE IF NOT EXISTS `customer_prior_employment_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `pri_emp_company` varchar(255) DEFAULT NULL,
  `pri_emp_address` varchar(255) DEFAULT NULL,
  `pri_emp_phone_no` varchar(255) DEFAULT NULL,
  `pri_emp_occupation` varchar(255) DEFAULT NULL,
  `pri_emp_supervisor` varchar(255) DEFAULT NULL,
  `pri_emp_gross_pay` varchar(255) DEFAULT NULL,
  `pri_emp_employment_from` varchar(255) DEFAULT NULL,
  `pri_emp_employment_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_prior_employment_history`
--

INSERT INTO `customer_prior_employment_history` (`id`, `application_no`, `pri_emp_company`, `pri_emp_address`, `pri_emp_phone_no`, `pri_emp_occupation`, `pri_emp_supervisor`, `pri_emp_gross_pay`, `pri_emp_employment_from`, `pri_emp_employment_to`) VALUES
(1, 5, '', '', '', '', '', '', '', ''),
(2, 1, '', '', '', '', '', '', '', ''),
(3, 4, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_prior_employment_history_map`
--

CREATE TABLE IF NOT EXISTS `customer_prior_employment_history_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `customer_prior_employment_history_map`
--

INSERT INTO `customer_prior_employment_history_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'pri_emp_company', 'text', 'Company', 1, 1),
(3, 'pri_emp_address', 'text', 'Address', 1, 1),
(4, 'pri_emp_phone_no', 'text', 'Phone No', 1, 1),
(5, 'pri_emp_occupation', 'text', 'Occupation', 1, 1),
(6, 'pri_emp_supervisor', 'text', 'Supervisor', 1, 1),
(7, 'pri_emp_gross_pay', 'text', 'Gross Pay', 1, 1),
(8, 'pri_emp_employment_from', 'text', 'Employment From', 1, 1),
(9, 'pri_emp_employment_to', 'text', 'Employment To', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_prior_employment_history_meta`
--

CREATE TABLE IF NOT EXISTS `customer_prior_employment_history_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_prior_residence_history`
--

CREATE TABLE IF NOT EXISTS `customer_prior_residence_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `pri_address` varchar(255) DEFAULT NULL,
  `pri_state` varchar(255) DEFAULT NULL,
  `pri_city` varchar(255) DEFAULT NULL,
  `pri_last_amount_paid` varchar(255) DEFAULT NULL,
  `pri_owner` varchar(255) DEFAULT NULL,
  `pri_phone_no` varchar(255) DEFAULT NULL,
  `pri_reason_for_leaving` varchar(255) DEFAULT NULL,
  `pri_rent_paid_full` varchar(10) DEFAULT NULL,
  `pri_give_notice` varchar(10) DEFAULT NULL,
  `pri_asked_to_move` varchar(255) DEFAULT NULL,
  `pri_utilities` varchar(255) DEFAULT NULL,
  `pri_residence_from` varchar(255) DEFAULT NULL,
  `pri_residence_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_prior_residence_history`
--

INSERT INTO `customer_prior_residence_history` (`id`, `application_no`, `pri_address`, `pri_state`, `pri_city`, `pri_last_amount_paid`, `pri_owner`, `pri_phone_no`, `pri_reason_for_leaving`, `pri_rent_paid_full`, `pri_give_notice`, `pri_asked_to_move`, `pri_utilities`, `pri_residence_from`, `pri_residence_to`) VALUES
(1, 5, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 1, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 4, '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_prior_residence_history_map`
--

CREATE TABLE IF NOT EXISTS `customer_prior_residence_history_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `customer_prior_residence_history_map`
--

INSERT INTO `customer_prior_residence_history_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'pri_address', 'text', 'Address', 1, 1),
(3, 'pri_state', 'text', 'State', 1, 1),
(4, 'pri_city', 'text', 'City', 1, 1),
(5, 'pri_last_amount_paid', 'text', 'Last Amount Paid', 1, 1),
(6, 'pri_owner', 'text', 'Owner', 1, 1),
(7, 'pri_phone_no', 'text', 'Phone No', 1, 1),
(8, 'pri_reason_for_leaving', 'text', 'Reason For Leaving', 1, 1),
(9, 'pri_rent_paid_full', 'text', 'Rent Paid Full', 1, 1),
(10, 'pri_give_notice', 'text', 'Give Notice', 1, 1),
(11, 'pri_asked_to_move', 'text', 'Asked To Move', 1, 1),
(12, 'pri_utilities', 'text', 'Utilities', 1, 1),
(13, 'pri_residence_from', 'text', 'Residence From', 1, 1),
(14, 'pri_residence_to', 'text', 'Residence To', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_prior_residence_history_meta`
--

CREATE TABLE IF NOT EXISTS `customer_prior_residence_history_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_property_application`
--

CREATE TABLE IF NOT EXISTS `customer_property_application` (
  `application_no` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_email` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`application_no`),
  KEY `application_no` (`application_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `customer_property_application`
--

INSERT INTO `customer_property_application` (`application_no`, `applicant_email`, `user_id`, `property_id`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 17, 1, 'Draft', '2015-03-18 05:44:36', '2015-03-18 05:44:36'),
(2, NULL, 17, 1, 'Draft', '2015-03-23 05:17:26', '2015-03-23 05:17:26'),
(3, NULL, 17, 1, 'Draft', '2015-03-23 05:47:59', '2015-03-23 05:47:59'),
(4, NULL, 18, 1, 'Completed', '2015-03-23 06:07:27', '2015-03-23 06:07:27'),
(5, NULL, 12, 1, 'Submitted', '2015-03-23 07:43:33', '2015-03-23 07:43:33'),
(6, 'vikas@gmail.com', 24, 1, 'Completed', '2015-03-23 11:27:47', '2015-03-23 11:27:47'),
(7, NULL, 17, 1, 'Draft', '2015-03-23 13:12:04', '2015-03-23 13:12:04'),
(8, NULL, 17, 1, 'Draft', '2015-03-24 10:30:45', '2015-03-24 10:30:45');

-- --------------------------------------------------------

--
-- Table structure for table `customer_saving_credit_history`
--

CREATE TABLE IF NOT EXISTS `customer_saving_credit_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `sav_bank_name` varchar(255) DEFAULT NULL,
  `sav_balance` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_saving_credit_history`
--

INSERT INTO `customer_saving_credit_history` (`id`, `application_no`, `sav_bank_name`, `sav_balance`) VALUES
(1, 5, '', ''),
(2, 1, '', ''),
(3, 4, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_saving_credit_history_map`
--

CREATE TABLE IF NOT EXISTS `customer_saving_credit_history_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_saving_credit_history_map`
--

INSERT INTO `customer_saving_credit_history_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'sav_bank_name', 'text', 'Bank Name', 1, 1),
(3, 'sav_balance', 'text', 'Balance', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_saving_credit_history_meta`
--

CREATE TABLE IF NOT EXISTS `customer_saving_credit_history_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_vehicles`
--

CREATE TABLE IF NOT EXISTS `customer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `make` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `licence` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customer_vehicles`
--

INSERT INTO `customer_vehicles` (`id`, `application_no`, `make`, `model`, `color`, `year`, `licence`) VALUES
(1, 5, '', '', '', '', ''),
(2, 1, '', '', '', '', ''),
(3, 4, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_vehicles_map`
--

CREATE TABLE IF NOT EXISTS `customer_vehicles_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `meta` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `customer_vehicles_map`
--

INSERT INTO `customer_vehicles_map` (`id`, `field`, `type`, `label`, `required`, `meta`) VALUES
(2, 'make', 'text', 'Make', 1, 1),
(3, 'model', 'text', 'Model', 1, 1),
(4, 'color', 'text', 'Color', 1, 1),
(5, 'year', 'text', 'Year', 1, 1),
(6, 'licence', 'text', 'Licence', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_vehicles_meta`
--

CREATE TABLE IF NOT EXISTS `customer_vehicles_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_no` int(11) NOT NULL,
  `field_name` varchar(50) NOT NULL,
  `field_value` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lease_documents_pdfs`
--

CREATE TABLE IF NOT EXISTS `lease_documents_pdfs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `application_no` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lease_documents_pdfs`
--

INSERT INTO `lease_documents_pdfs` (`id`, `user_id`, `application_no`, `path`, `start_date`, `end_date`) VALUES
(2, 24, 6, 'leasedocuments/1158_task.txt', '2005-02-01 00:00:00', '2005-02-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_03_02_101219_vault_setup_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `system`, `created_at`, `updated_at`) VALUES
(1, 'view_admin_link', 'View Administrator Link', 1, '2015-03-02 04:50:13', '2015-03-02 04:50:13'),
(2, 'user_only_permission', 'Test User Only Permission', 0, '2015-03-02 04:50:13', '2015-03-02 04:50:13');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE IF NOT EXISTS `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_foreign` (`permission_id`),
  KEY `permission_user_user_id_foreign` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `permission_user`
--

INSERT INTO `permission_user` (`id`, `permission_id`, `user_id`) VALUES
(1, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2015-03-02 04:50:12', '2015-03-02 04:50:12'),
(2, 'User', '2015-03-02 04:50:12', '2015-03-02 04:50:12'),
(3, 'Customer', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Tenant', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Admin Istrator', 'admin@admin.com', '$2y$10$bDRccGozLZmsGLe291oqLuoF7chmWxvyVKEsvylRJyJLMth/TBANW', 'p1jasX5yTzhBxT1QIqvkQzHfkRf5MBBGEz6sKltc5rd0Bhz8U29X5cUQ8Qp1', '2015-03-02 04:50:10', '2015-03-24 05:00:25', 1),
(2, 'Default User', 'user@user.com', '$2y$10$gLXfPOQS6M9A.TG8c1Ql2.mK1NTbnm4k0FMnSlmsxrfmbFlUzno4.', 'qZwfRzcf4kkZyHaGkSAZ457xpL6Fyz6dAq0nMAg90UBinT0eZe0004e8MvQ2', '2015-03-02 04:50:10', '2015-03-24 05:10:05', 1),
(6, 'charul', 'charuli@newgenray.com', '$2y$10$rj.kxifbLZtxZDPjasAFauNjc8mSpIgJMGHB42WzzQokmMhlO2VjG', 'W62qOX3y8Yyb4OsDJIbhSSN1zUr2X1xLMaroSW5n6rgw60YhDuaLSJi3Rtx3', '2015-03-12 00:04:19', '2015-03-22 23:47:07', 1),
(12, 'tenant', 'tenant4@gmail.com', '$2y$10$dgPdsAbKK3cEosKTVqGJNOmXAJ/DH0TjuFLM0qysoRoqlIyNBaBiK', 'ryInOdba3Pia6BeutFxLfzSq6xcgr2NBW4JIQ6T13OPjGjrV4e4Y2PX8l6oc', '2015-03-13 07:55:18', '2015-03-23 00:26:13', 1),
(17, 'charul', 'charultyagi@newgenray.com', '$2y$10$hQ/LmTDBvmDqlrP/3MuepOa208iSuaDXGrzDznForo2gf7orQJNXe', 'JpF9NDsp84SD18FqO87Q9HmMoTeygWSZT7r8X1O4qEGRXW785BL3QH7zt823', '2015-03-18 00:14:35', '2015-03-24 05:23:56', 1),
(18, 'charul', 'tyagi@gmail.com', '$2y$10$cPBp1BioqYlSN7StdQuKIOqHFQ8TnK5vSnUEysVCu3Jv260mvX502', 'NdVpimD98E62Y7r7FICEF0LhUwsbf3V2j4EgNNKjESBgfnhckUDrFnMXZ4ki', '2015-03-23 00:37:26', '2015-03-23 00:42:07', 1),
(24, '', 'vikas@gmail.com', '$2y$10$HpDkEDUU4tiz4785/v89dOjiH8PYL3EmQTgqcG53Q1JBeNDFA7E7C', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `work_order`
--

CREATE TABLE IF NOT EXISTS `work_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_id` int(11) NOT NULL,
  `request_category` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `visit_hours` varchar(50) NOT NULL,
  `work_description` text NOT NULL,
  `file_links` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `work_order`
--

INSERT INTO `work_order` (`id`, `property_id`, `request_category`, `phone`, `visit_hours`, `work_description`, `file_links`, `status`, `created_at`, `updated_at`) VALUES
(17, 2, 'Kitchen', '1234567890', '11 - 12', 'working well', 'a:1:{i:0;s:54:"/uploads/tenants/workorders/20150315200733_arrow_2.png";}', 'Pending', '2015-03-17 07:40:07', '2015-03-15 14:37:34'),
(18, 2, 'Electricity', '+919540203938', '11 - 12', 'asasasas', 'N;', 'Waiting for Material', '2015-03-16 07:38:54', '2015-03-15 14:38:10');

-- --------------------------------------------------------

--
-- Table structure for table `work_order_category`
--

CREATE TABLE IF NOT EXISTS `work_order_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `work_order_category`
--

INSERT INTO `work_order_category` (`id`, `category`) VALUES
(1, 'Electricity'),
(2, 'Plumbing'),
(3, 'Kitchen'),
(4, 'Electricity'),
(5, 'Garage');

-- --------------------------------------------------------

--
-- Table structure for table `work_order_log`
--

CREATE TABLE IF NOT EXISTS `work_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `work_order_log`
--

INSERT INTO `work_order_log` (`id`, `workorder_id`, `comment`, `status`, `updated_at`, `created_at`) VALUES
(1, 1, 'mens are waiting for material', 'Waiting for Material', '2015-03-15 12:59:39', '2015-03-15 12:59:39'),
(2, 1, 'mens are waiting for material', 'Completed', '2015-03-15 13:03:41', '2015-03-15 13:03:41'),
(3, 1, 'waiting', 'Waiting for Material', '2015-03-15 13:18:10', '2015-03-15 13:18:10'),
(4, 1, 'pending work', 'Pending', '2015-03-15 13:44:10', '2015-03-15 13:44:10'),
(5, 1, 'New order submitted', 'New', '2015-03-15 13:59:18', '2015-03-15 13:59:18'),
(6, 18, 'pending request', 'Pending', '2015-03-15 14:59:54', '2015-03-15 14:59:54'),
(7, 18, 'test', 'Waiting for Material', '2015-03-16 02:08:54', '2015-03-16 02:08:54'),
(8, 17, 'this is done', 'Pending', '2015-03-17 02:10:07', '2015-03-17 02:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `work_order_status`
--

CREATE TABLE IF NOT EXISTS `work_order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `work_order_status`
--

INSERT INTO `work_order_status` (`id`, `status`) VALUES
(1, 'Pending'),
(2, 'Hold'),
(3, 'Processing'),
(4, 'Completed'),
(5, 'New');

-- --------------------------------------------------------

--
-- Table structure for table `wp_available_schedule_tour`
--

CREATE TABLE IF NOT EXISTS `wp_available_schedule_tour` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `property_id` bigint(11) NOT NULL,
  `datetimevalue` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wp_available_schedule_tour`
--

INSERT INTO `wp_available_schedule_tour` (`id`, `property_id`, `datetimevalue`) VALUES
(1, 95, 'a:3:{i:0;s:16:"2015-01-28 16:26";i:1;s:17:"2015-01-31 16:26 ";i:2;s:17:"2015-01-30 16:26 ";}'),
(2, 768, 'N;'),
(3, 769, 'N;'),
(4, 73, 'a:2:{i:0;s:16:"2015-03-11 10:36";i:1;s:17:"2015-03-13 10:55 ";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-01-05 05:54:16', '2015-01-05 05:54:16', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0),
(2, 107, 'admin', 'janedoe@yourcompany.com', '', '::1', '2014-07-19 11:42:35', '2014-07-19 11:42:35', 'For one day longer the despatches continued to come from New York.  Then they, too, ceased. The man who had sent them, perched in his lofty  building, had either died of the plague or been consumed in the great  conflagrations he had described as raging around him.', 0, '1', '', '', 0, 1),
(3, 107, 'admin', 'janedoe@yourcompany.com', '', '::1', '2014-07-19 11:42:54', '2014-07-19 11:42:54', 'And this is how a nested comment looks like.', 0, '1', '', '', 2, 1),
(4, 107, 'admin', 'janedoe@yourcompany.com', '', '::1', '2014-07-19 11:43:27', '2014-07-19 11:43:27', 'Last, but hopefully not least ;-)', 0, '1', '', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1865 ;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://realestate.local', 'yes'),
(2, 'home', 'http://realestate.local/', 'yes'),
(3, 'blogname', 'Realestate2015', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '1', 'yes'),
(6, 'admin_email', 'akankshagupta@newgneray.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:7:{i:0;s:30:"advanced-custom-fields/acf.php";i:1;s:47:"bootstrap-3-shortcodes/bootstrap-shortcodes.php";i:2;s:36:"contact-form-7/wp-contact-form-7.php";i:3;s:27:"slimjetpack/slimjetpack.php";i:4;s:37:"tenantManagement/tenantManagement.php";i:5;s:53:"velvet-blues-update-urls/velvet-blues-update-urls.php";i:6;s:41:"wordpress-importer/wordpress-importer.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '0', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'realty', 'yes'),
(42, 'stylesheet', 'realty', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '30133', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'page', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', '', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:0:{}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '105', 'yes'),
(85, 'page_on_front', '93', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '30133', 'yes'),
(89, 'wp_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:69:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:5:"agent";a:2:{s:4:"name";s:5:"Agent";s:12:"capabilities";a:0:{}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:1:{s:7:"level_0";b:1;}}s:7:"tenants";a:2:{s:4:"name";s:7:"Tenants";s:12:"capabilities";a:3:{s:4:"read";b:1;s:17:"tenant_management";b:1;s:17:"edit_others_posts";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:11:{s:19:"wp_inactive_widgets";a:0:{}s:12:"sidebar_blog";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:16:"sidebar_property";N;s:13:"sidebar_agent";N;s:12:"sidebar_page";N;s:15:"sidebar_contact";N;s:11:"sidebar_idx";N;s:16:"sidebar_footer_1";N;s:16:"sidebar_footer_2";N;s:16:"sidebar_footer_3";N;s:13:"array_version";i:3;}', 'yes'),
(96, 'cron', 'a:10:{i:1425290317;a:1:{s:20:"jetpack_clean_nonces";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1425295679;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"ec927a154b893d40861838b3b6e46a5e";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:771;}}}}i:1425295704;a:1:{s:26:"upgrader_scheduled_cleanup";a:1:{s:32:"afc9bb8268f90bf287f4a7f6c570e3bd";a:2:{s:8:"schedule";b:0;s:4:"args";a:1:{i:0;i:772;}}}}i:1425318859;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1425323340;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1425362092;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1425362150;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1425363310;a:1:{s:14:"redux_tracking";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1425880717;a:1:{s:17:"jetpack_heartbeat";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:14:"jetpack_weekly";s:4:"args";a:0:{}s:8:"interval";i:604800;}}}s:7:"version";i:2;}', 'yes'),
(110, 'can_compress_scripts', '0', 'yes'),
(1827, '_site_transient_browser_f4146a70cbbacb460a0479387a0fe28d', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"36.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(106, '_transient_random_seed', '1e1ca89afbec0b625f896cba4e98923c', 'yes'),
(1862, '_site_transient_timeout_theme_roots', '1425290278', 'yes'),
(1863, '_site_transient_theme_roots', 'a:5:{s:12:"realty-child";s:7:"/themes";s:6:"realty";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes'),
(600, '_site_transient_timeout_browser_fcf8cc3594f4801f9ee0936c74c111ac', '1421665291', 'yes'),
(601, '_site_transient_browser_fcf8cc3594f4801f9ee0936c74c111ac', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"39.0.2171.95";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1828, '_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1425317122', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1829, '_transient_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:3:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:26:"https://wordpress.org/news";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:14:"WordPress News";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Feb 2015 23:40:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:39:"http://wordpress.org/?v=4.2-alpha-31594";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"WordPress 4.1.1 Maintenance Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2015/02/wordpress-4-1-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2015/02/wordpress-4-1-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Feb 2015 23:40:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3436";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:345:"WordPress 4.1.1 is now available. This maintenance release fixes 21 bugs in version 4.1. Some of you may have been waiting to update to the latest version until now, but there just wasn&#8217;t much to address. WordPress 4.1 was a smooth-sailing release and has seen more than 14 million downloads in the last two months. For a full [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3086:"<p>WordPress 4.1.1 is now available. This maintenance release fixes 21 bugs in version 4.1.</p>\n<p>Some of you may have been waiting to update to the latest version until now, but there just wasn&#8217;t much to address. WordPress 4.1 was a smooth-sailing release and has seen more than 14 million downloads in the last two months.</p>\n<p class="p1"><span class="s1">For a full list of changes, consult the <a href="https://core.trac.wordpress.org/query?milestone=4.1.1&amp;group=severity&amp;order=component">list of tickets</a> and the <a href="https://core.trac.wordpress.org/log/branches/4.1?stop_rev=30974&amp;rev=31474">changelog</a>. We fixed one annoying issue where a tag and a category with the same name could get muddled and prevent each other from being updated.</span></p>\n<p>If you are one of the millions already running WordPress 4.1 and your site, we’ve started rolling out automatic background updates for 4.1.1 for sites <a href="https://wordpress.org/plugins/background-update-tester/">that support them</a>. Otherwise, <a href="https://wordpress.org/download/">download WordPress 4.1.1</a> or visit <strong>Dashboard → Updates</strong> and simply click “Update Now.”</p>\n<p>Thanks to everyone who contributed to 4.1.1: <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/hissy">Takuro Hishikawa</a>, <a href="https://profiles.wordpress.org/ipm-frommen">Thorsten Frommen</a>, <a href="https://profiles.wordpress.org/iseulde">Iseulde</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/sippis">sippis</a>, <a href="https://profiles.wordpress.org/tmatsuur">tmatsuur</a>, <a href="https://profiles.wordpress.org/tyxla">Marin Atanasov</a>, <a href="https://profiles.wordpress.org/valendesigns">Derek Herman</a>, and <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>.</p>\n<p>It is with both great honor and sadness we also recognize Kim Parsell as a contributor to this release and a <a href="https://make.wordpress.org/docs/2015/01/05/rip-kim-parsell/">truly beloved member of the community</a> until her untimely passing in December. The project is working to establish a conference travel <a href="https://make.wordpress.org/community/2015/01/15/remembering-kim-parsell/">scholarship</a> in her memory. We miss you, Kim.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2015/02/wordpress-4-1-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"WordPress 4.1 “Dinah”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"https://wordpress.org/news/2014/12/dinah/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:50:"https://wordpress.org/news/2014/12/dinah/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Dec 2014 18:35:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3386";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:360:"Version 4.1 of WordPress, named &#8220;Dinah&#8221; in honor of jazz singer Dinah Washington, is available for download or update in your WordPress dashboard. New features in WordPress 4.1 help you focus on your writing, and the new default theme lets you show it off in style. Introducing Twenty Fifteen Our newest default theme, Twenty Fifteen, is [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:24563:"<p>Version 4.1 of WordPress, named &#8220;Dinah&#8221; in honor of jazz singer <a href="http://wikipedia.org/wiki/Dinah_Washington">Dinah Washington</a>, is available for download or update in your WordPress dashboard. New features in WordPress 4.1 help you focus on your writing, and the new default theme lets you show it off in style.</p>\n<hr />\n<h2 style="text-align: center">Introducing Twenty Fifteen</h2>\n<p><img class="aligncenter size-large wp-image-3389" src="https://wordpress.org/news/files/2014/12/2015-laptop-1024x533.png" alt="2015-laptop" width="692" height="360" /></p>\n<h3>Our newest default theme, Twenty Fifteen, is a blog-focused theme designed for clarity.</h3>\n<p><img class="alignright wp-image-3426 size-medium" src="https://wordpress.org/news/files/2014/12/2015-phones-languages-small-300x250.png" alt="" width="300" height="250" />Twenty Fifteen has flawless language support, with help from <a href="https://www.google.com/get/noto/">Google’s Noto font family</a>.</p>\n<p>The straightforward typography is readable on any screen size.</p>\n<p>Your content always takes center stage, whether viewed on a phone, tablet, laptop, or desktop computer.</p>\n<hr />\n<h2 style="text-align: center">Distraction-free writing</h2>\n<p><img class="aligncenter size-large wp-image-3392" src="https://wordpress.org/news/files/2014/12/dfw-screen-1024x614.png" alt="dfw-screen" width="692" height="415" /></p>\n<h3 style="text-align: center"><em>Just write.</em></h3>\n<p>Sometimes, you just need to concentrate on putting your thoughts into words. Try turning on <strong>distraction-free writing mode</strong>. When you start typing, all the distractions will fade away, letting you focus solely on your writing. All your editing tools instantly return when you need them.</p>\n<hr />\n<h2 style="text-align: center">The Finer Points</h2>\n<h5><strong><img class="alignleft wp-image-3405" src="https://wordpress.org/news/files/2014/12/icon-language2.png" alt="" width="80" height="80" /></strong>Choose a language</h5>\n<p>Right now, WordPress 4.1 is already translated into over forty languages, with more always in progress. You can switch to any translation on the General Settings screen.</p>\n<h5><strong><img class="alignleft wp-image-3406" src="https://wordpress.org/news/files/2014/12/icon-logout1.png" alt="" width="80" height="80" /></strong>Log out everywhere</h5>\n<p>If you’ve ever worried you forgot to sign out from a shared computer, you can now go to your profile and log out everywhere.</p>\n<h5><strong><img class="alignleft wp-image-3407" src="https://wordpress.org/news/files/2014/12/icon-vine1.png" alt="" width="80" height="80" /></strong>Vine embeds</h5>\n<p>Embedding videos from Vine is as simple as pasting a URL onto its own line in a post. See the <a href="https://codex.wordpress.org/Embeds">full list</a> of supported embeds.</p>\n<h5><strong><img class="alignleft wp-image-3408" src="https://wordpress.org/news/files/2014/12/icon-recommended1.png" alt="" width="80" height="80" /></strong>Plugin recommendations</h5>\n<p>The plugin installer suggests plugins for you to try. Recommendations are based on the plugins you and other users have installed.</p>\n<hr />\n<h2 style="text-align: center">Under the Hood</h2>\n<h5>Complex Queries</h5>\n<p>Metadata, date, and term queries now support advanced conditional logic, like nested clauses and multiple operators — <code>A AND ( B OR C )</code>.</p>\n<h5>Customizer API</h5>\n<p>The customizer now supports conditionally showing panels and sections based on the page being previewed.</p>\n<h5><code>&lt;title&gt;</code> tags in themes</h5>\n<p><code>add_theme_support( ''title-tag'' )</code> tells WordPress to handle the complexities of document titles.</p>\n<h5>Developer Reference</h5>\n<p>Continued improvements to inline code documentation have made the <a href="https://developer.wordpress.org/reference/">developer reference</a> more complete than ever.</p>\n<hr />\n<h2 style="text-align: center">The Choir</h2>\n<p>This release was led by <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, with the help of these awesome folks. Check out some of their profiles while listening to Dinah Washington on the music service of your choice:</p>\n<a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/akumria">akumria</a>, <a href="https://profiles.wordpress.org/xknown">Alex Concha</a>, <a href="https://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="https://profiles.wordpress.org/tellyworth">Alex Shiels</a>, <a href="https://profiles.wordpress.org/collinsinternet">Allan Collins</a>, <a href="https://profiles.wordpress.org/momo360modena">Amaury Balmer</a>, <a href="https://profiles.wordpress.org/amruta123b">Amruta Bhosale</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/andg">Andrea Gandino</a>, <a href="https://profiles.wordpress.org/sumobi">Andrew Munro (sumobi)</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/andrewryno">Andrew Ryno</a>, <a href="https://profiles.wordpress.org/rarst">Andrey "Rarst" Savchenko</a>, <a href="https://profiles.wordpress.org/ankitgadertcampcom">Ankit Gade</a>, <a href="https://profiles.wordpress.org/ankit-k-gupta">Ankit K Gupta</a>, <a href="https://profiles.wordpress.org/antpb">Anthony Burchell</a>, <a href="https://profiles.wordpress.org/arippberger">arippberger</a>, <a href="https://profiles.wordpress.org/filosofo">Austin Matzko</a>, <a href="https://profiles.wordpress.org/bainternet">Bainternet</a>, <a href="https://profiles.wordpress.org/barrykooij">Barry Kooij</a>, <a href="https://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="https://profiles.wordpress.org/benjmay">Ben May</a>, <a href="https://profiles.wordpress.org/neoxx">Bernhard Riedl</a>, <a href="https://profiles.wordpress.org/birgire">Birgir Erlendsson (birgire)</a>, <a href="https://profiles.wordpress.org/bobbingwide">bobbingwide</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone B. Gorges</a>, <a href="https://profiles.wordpress.org/bradyvercher">Brady Vercher</a>, <a href="https://profiles.wordpress.org/bramd">Bram Duvigneau</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/briandichiara">Brian DiChiara</a>, <a href="https://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="https://profiles.wordpress.org/bswatson">Brian Watson</a>, <a href="https://profiles.wordpress.org/camdensegal">Camden Segal</a>, <a href="https://profiles.wordpress.org/captaintheme">Captain Theme</a>, <a href="https://profiles.wordpress.org/hiwhatsup">Carlos</a>, <a href="https://profiles.wordpress.org/caspie">Caspie</a>, <a href="https://profiles.wordpress.org/ccprice">ccprice</a>, <a href="https://profiles.wordpress.org/mackensen">Charles Fulton</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/aprea">Chris Aprea</a>, <a href="https://profiles.wordpress.org/chrisbliss18">Chris Jean</a>, <a href="https://profiles.wordpress.org/cmmarslender">Chris Marslender</a>, <a href="https://profiles.wordpress.org/jazzs3quence">Chris Reynolds</a>, <a href="https://profiles.wordpress.org/chriscct7">chriscct7</a>, <a href="https://profiles.wordpress.org/chrisl27">chrisl27</a>, <a href="https://profiles.wordpress.org/cfoellmann">Christian Foellmann</a>, <a href="https://profiles.wordpress.org/cfinke">Christopher Finke</a>, <a href="https://profiles.wordpress.org/cyclometh">Corey Snow</a>, <a href="https://profiles.wordpress.org/corphi">Corphi</a>, <a href="https://profiles.wordpress.org/curtjen">curtjen</a>, <a href="https://profiles.wordpress.org/colorful-tones">Damon Cook</a>, <a href="https://profiles.wordpress.org/dancameron">Dan Cameron</a>, <a href="https://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="https://profiles.wordpress.org/convissor">Daniel Convissor</a>, <a href="https://profiles.wordpress.org/nerrad">Darren Ethier (nerrad)</a>, <a href="https://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="https://profiles.wordpress.org/dmchale">Dave McHale</a>, <a href="https://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/davidjlaietta">David Laietta</a>, <a href="https://profiles.wordpress.org/technical_mastermind">David Wood</a>, <a href="https://profiles.wordpress.org/davidthemachine">DavidTheMachine</a>, <a href="https://profiles.wordpress.org/dcavins">dcavins</a>, <a href="https://profiles.wordpress.org/realloc">Dennis Ploetner</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/wedi">Dirk Weise</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/dominikschwind-1">Dominik Schwind</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/dustyf">Dustin Filippini</a>, <a href="https://profiles.wordpress.org/dustinhartzler">Dustin Hartzler</a>, <a href="https://profiles.wordpress.org/eliorivero">Elio Rivero</a>, <a href="https://profiles.wordpress.org/ebinnion">Eric Binnion</a>, <a href="https://profiles.wordpress.org/ew_holmes">Eric Holmes</a>, <a href="https://profiles.wordpress.org/ericlewis">Eric Lewis</a>, <a href="https://profiles.wordpress.org/fab1en">Fabien Quatravaux</a>, <a href="https://profiles.wordpress.org/florianziegler">Florian Ziegler</a>, <a href="https://profiles.wordpress.org/hereswhatidid">Gabe Shackle</a>, <a href="https://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/soulseekah">Gennady Kovshenin</a>, <a href="https://profiles.wordpress.org/babbardel">George Olaru</a>, <a href="https://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="https://profiles.wordpress.org/gregrickaby">Greg Rickaby</a>, <a href="https://profiles.wordpress.org/gcorne">Gregory Cornelius</a>, <a href="https://profiles.wordpress.org/tivnet">Gregory Karpinsky (@tivnet)</a>, <a href="https://profiles.wordpress.org/bordoni">Gustavo Bordoni</a>, <a href="https://profiles.wordpress.org/hardy101">hardy101</a>, <a href="https://profiles.wordpress.org/hauvong">hauvong</a>, <a href="https://profiles.wordpress.org/helen">Helen Hou-Sandí</a>, <a href="https://profiles.wordpress.org/heshiming">heshiming</a>, <a href="https://profiles.wordpress.org/honeysilvas">honeysilvas</a>, <a href="https://profiles.wordpress.org/hugodelgado">hugodelgado</a>, <a href="https://profiles.wordpress.org/iandstewart">Ian Stewart</a>, <a href="https://profiles.wordpress.org/ianmjones">ianmjones</a>, <a href="https://profiles.wordpress.org/igmoweb">Ignacio Cruz Moreno</a>, <a href="https://profiles.wordpress.org/imath">imath</a>, <a href="https://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="https://profiles.wordpress.org/ivankristianto">Ivan Kristianto</a>, <a href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="https://profiles.wordpress.org/jaimieolmstead">jaimieolmstead</a>, <a href="https://profiles.wordpress.org/jakubtyrcha">jakub.tyrcha</a>, <a href="https://profiles.wordpress.org/janhenckens">janhenckens</a>, <a href="https://profiles.wordpress.org/avryl">Janneke Van Dorpe</a>, <a href="https://profiles.wordpress.org/japh">Japh</a>, <a href="https://profiles.wordpress.org/jwenerd">Jared Wenerd</a>, <a href="https://profiles.wordpress.org/jarednova">jarednova</a>, <a href="https://profiles.wordpress.org/jeanyoungkim">jeanyoungkim</a>, <a href="https://profiles.wordpress.org/jfarthing84">Jeff Farthing</a>, <a href="https://profiles.wordpress.org/jeffstieler">Jeff Stieler</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jeherve">Jeremy Herve</a>, <a href="https://profiles.wordpress.org/jesin">Jesin A</a>, <a href="https://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="https://profiles.wordpress.org/engelen">Jesper van Engelen</a>, <a href="https://profiles.wordpress.org/jessepollak">Jesse Pollak</a>, <a href="https://profiles.wordpress.org/jipmoors">jipmoors</a>, <a href="https://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="https://profiles.wordpress.org/joemcgill">Joe McGill</a>, <a href="https://profiles.wordpress.org/johneckman">John Eckman</a>, <a href="https://profiles.wordpress.org/johnrom">johnrom</a>, <a href="https://profiles.wordpress.org/johnstonphilip">johnstonphilip</a>, <a href="https://profiles.wordpress.org/jb510">Jon Brown</a>, <a href="https://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="https://profiles.wordpress.org/jbrinley">Jonathan Brinley</a>, <a href="https://profiles.wordpress.org/desrosj">Jonathan Desrosiers</a>, <a href="https://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="https://profiles.wordpress.org/softmodeling">Jordi Cabot</a>, <a href="https://profiles.wordpress.org/joshuaabenazer">Joshua Abenazer</a>, <a href="https://profiles.wordpress.org/tai">JOTAKI Taisuke</a>, <a href="https://profiles.wordpress.org/jrf">jrf</a>, <a href="https://profiles.wordpress.org/julien731">Julien Liabeuf</a>, <a href="https://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="https://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="https://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="https://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="https://profiles.wordpress.org/kamelkev">kamelkev</a>, <a href="https://profiles.wordpress.org/karpstrucking">karpstrucking</a>, <a href="https://profiles.wordpress.org/keesiemeijer">keesiemeijer</a>, <a href="https://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/kevinlangleyjr">Kevin Langley</a>, <a href="https://profiles.wordpress.org/kdoran">Kiko Doran</a>, <a href="https://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="https://profiles.wordpress.org/kwight">Kirk Wight</a>, <a href="https://profiles.wordpress.org/kitchin">kitchin</a>, <a href="https://profiles.wordpress.org/ixkaito">Kite</a>, <a href="https://profiles.wordpress.org/knutsp">Knut Sparhell</a>, <a href="https://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/kosvrouvas">Kostas Vrouvas</a>, <a href="https://profiles.wordpress.org/kraftner">kraftner</a>, <a href="https://profiles.wordpress.org/kristastevens">kristastevens</a>, <a href="https://profiles.wordpress.org/kurtpayne">Kurt Payne</a>, <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/offereins">Laurens Offereins</a>, <a href="https://profiles.wordpress.org/linuxologos">linuxologos</a>, <a href="https://profiles.wordpress.org/ideag">Liuiza Arunas</a>, <a href="https://profiles.wordpress.org/loushou">loushou</a>, <a href="https://profiles.wordpress.org/latz">Lutz Schroer</a>, <a href="https://profiles.wordpress.org/manoz69">Manoz69</a>, <a href="https://profiles.wordpress.org/mantismamita">mantismamita</a>, <a href="https://profiles.wordpress.org/marcosf">Marco Schmoecker</a>, <a href="https://profiles.wordpress.org/nofearinc">Mario Peshev</a>, <a href="https://profiles.wordpress.org/clorith">Marius (Clorith)</a>, <a href="https://profiles.wordpress.org/landakram">Mark Hudnall</a>, <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/senff">Mark Senff</a>, <a href="https://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="https://profiles.wordpress.org/marsjaninzmarsa">marsjaninzmarsa</a>, <a href="https://profiles.wordpress.org/matveb">Matias Ventura</a>, <a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="https://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="https://profiles.wordpress.org/mboynes">Matthew Boynes</a>, <a href="https://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="https://profiles.wordpress.org/mattkeys">mattkeys</a>, <a href="https://profiles.wordpress.org/mlteal">Maura Teal</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/merty">Mert Yazicioglu</a>, <a href="https://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="https://profiles.wordpress.org/michael-arestad">Michael Arestad</a>, <a href="https://profiles.wordpress.org/tw2113">Michael Beckwith</a>, <a href="https://profiles.wordpress.org/cainm">Michael Cain</a>, <a href="https://profiles.wordpress.org/smashcut">Michael Pick</a>, <a href="https://profiles.wordpress.org/michalzuber">michalzuber</a>, <a href="https://profiles.wordpress.org/chellycat">Michelle Langston</a>, <a href="https://profiles.wordpress.org/mcsf">Miguel Fonseca</a>, <a href="https://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="https://profiles.wordpress.org/mikejolley">Mike Jolley</a>, <a href="https://profiles.wordpress.org/mnelson4">Mike Nelson</a>, <a href="https://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="https://profiles.wordpress.org/mikeyarce">Mikey Arce</a>, <a href="https://profiles.wordpress.org/studionashvegas">Mitch Canter (studionashvegas)</a>, <a href="https://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="https://profiles.wordpress.org/mor10">Morten Rand-Hendriksen</a>, <a href="https://profiles.wordpress.org/mvd7793">mvd7793</a>, <a href="https://profiles.wordpress.org/alex-ye">Nashwan Doaqan</a>, <a href="https://profiles.wordpress.org/niallkennedy">Niall Kennedy</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nikv">Nikhil Vimal (NikV)</a>, <a href="https://profiles.wordpress.org/nikolovtmw">Nikola Nikolov</a>, <a href="https://profiles.wordpress.org/nobleclem">nobleclem</a>, <a href="https://profiles.wordpress.org/noplanman">noplanman</a>, <a href="https://profiles.wordpress.org/nvwd">Nowell VanHoesen</a>, <a href="https://profiles.wordpress.org/originalexe">OriginalEXE</a>, <a href="https://profiles.wordpress.org/p_enrique">p_enrique</a>, <a href="https://profiles.wordpress.org/pushplaybang">Paul</a>, <a href="https://profiles.wordpress.org/pauldewouters">Paul de Wouters</a>, <a href="https://profiles.wordpress.org/paulschreiber">Paul Schreiber</a>, <a href="https://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/peterchester">Peter Chester</a>, <a href="https://profiles.wordpress.org/donutz">Peter J. Herrel</a>, <a href="https://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="https://profiles.wordpress.org/peterwilsoncc">Peter Wilson</a>, <a href="https://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="https://profiles.wordpress.org/phpmypython">phpmypython</a>, <a href="https://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="https://profiles.wordpress.org/nprasath002">Prasath Nadarajah</a>, <a href="https://profiles.wordpress.org/psycleuk">psycleuk</a>, <a href="https://profiles.wordpress.org/ptahdunbar">Ptah Dunbar</a>, <a href="https://profiles.wordpress.org/quietnic">quietnic</a>, <a href="https://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="https://profiles.wordpress.org/ramiy">Rami Yushuvaev</a>, <a href="https://profiles.wordpress.org/ramiabraham">ramiabraham</a>, <a href="https://profiles.wordpress.org/greuben">Reuben Gunday</a>, <a href="https://profiles.wordpress.org/rianrietveld">Rian Rietveld</a>, <a href="https://profiles.wordpress.org/richardmtl">Richard Archambault</a>, <a href="https://profiles.wordpress.org/rickalee">Ricky Lee Whittemore</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/rodrigosprimo">Rodrigo Primo</a>, <a href="https://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="https://profiles.wordpress.org/ryankienstra">Ryan Kienstra</a>, <a href="https://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="https://profiles.wordpress.org/sakinshrestha">Sakin Shrestha</a>, <a href="https://profiles.wordpress.org/samhotchkiss">Sam Hotchkiss</a>, <a href="https://profiles.wordpress.org/otto42">Samuel Wood (Otto)</a>, <a href="https://profiles.wordpress.org/sc0ttkclark">Scott Kingsley Clark</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/shooper">Shawn Hooper</a>, <a href="https://profiles.wordpress.org/simonp303">Simon Pollard</a>, <a href="https://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="https://profiles.wordpress.org/skaeser">skaeser</a>, <a href="https://profiles.wordpress.org/slobodanmanic">Slobodan Manic</a>, <a href="https://profiles.wordpress.org/socki03">socki03</a>, <a href="https://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="https://profiles.wordpress.org/stephdau">Stephane Daury</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stephenharris">Stephen Harris</a>, <a href="https://profiles.wordpress.org/stevegrunwell">Steve Grunwell</a>, <a href="https://profiles.wordpress.org/5um17">Sumit Singh</a>, <a href="https://profiles.wordpress.org/tacoverdo">TacoVerdo</a>, <a href="https://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="https://profiles.wordpress.org/miyauchi">Takayuki Miyauchi</a>, <a href="https://profiles.wordpress.org/karmatosed">Tammie</a>, <a href="https://profiles.wordpress.org/tareq1988">Tareq Hasan</a>, <a href="https://profiles.wordpress.org/tlovett1">Taylor Lovett</a>, <a href="https://profiles.wordpress.org/ipm-frommen">Thorsten Frommen</a>, <a href="https://profiles.wordpress.org/tillkruess">Till Kruss</a>, <a href="https://profiles.wordpress.org/tschutter">Tobias Schutter</a>, <a href="https://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="https://profiles.wordpress.org/tmtrademark">Toby McKes</a>, <a href="https://profiles.wordpress.org/tjnowell">Tom J Nowell</a>, <a href="https://profiles.wordpress.org/tomasm">Tomas Mackevicius</a>, <a href="https://profiles.wordpress.org/tomharrigan">TomHarrigan</a>, <a href="https://profiles.wordpress.org/topher1kenobe">Topher</a>, <a href="https://profiles.wordpress.org/zodiac1978">Torsten Landsiedel</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy Levesque</a>, <a href="https://profiles.wordpress.org/transom">transom</a>, <a href="https://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="https://profiles.wordpress.org/tywayne">Ty Carlson</a>, <a href="https://profiles.wordpress.org/desaiuditd">Udit Desai</a>, <a href="https://profiles.wordpress.org/umeshsingla">Umesh Kumar</a>, <a href="https://profiles.wordpress.org/vinod-dalvi">Vinod Dalvi</a>, <a href="https://profiles.wordpress.org/vlajos">vlajos</a>, <a href="https://profiles.wordpress.org/voldemortensen">voldemortensen</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="https://profiles.wordpress.org/nobinobi">Yuta Sekine</a>, <a href="https://profiles.wordpress.org/zrothauser">Zack Rothauser</a>, and <a href="https://profiles.wordpress.org/tollmanz">Zack Tollman</a>.\n<p>There were 283 contributors to this release, again a new high.</p>\n<p>If you want to help out or follow along, check out <a href="https://make.wordpress.org/">Make WordPress</a> and our <a href="https://make.wordpress.org/core/">core development blog</a>.</p>\n<p>Thanks for choosing WordPress. Happy holidays and see you next year for version 4.2!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/news/2014/12/dinah/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WordPress 4.1 Release Candidate 3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate-3/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:78:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate-3/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 18 Dec 2014 02:22:15 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3411";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:429:"The next release candidate for WordPress 4.1 is now available for testing. Seventy changes have gone in since the first release candidate. With no known issues left, we plan to release 4.1 tomorrow, December 18. To test, try the WordPress Beta Tester plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can download the release candidate here (zip). If you&#8217;d like to learn more about [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1465:"<p>The next release candidate for WordPress 4.1 is now available for testing.</p>\n<p><a href="https://core.trac.wordpress.org/log/trunk?rev=30961&amp;stop_rev=30827">Seventy changes</a> have gone in since the <a href="https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/">first release candidate</a>. With no known issues left, we plan to release 4.1 tomorrow, December 18.</p>\n<p>To test, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="https://wordpress.org/wordpress-4.1-RC3.zip">download the release candidate here</a> (zip). If you&#8217;d like to learn more about what&#8217;s new in WordPress 4.1, visit the updated About screen in your dashboard (<strong><img src="https://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png" alt="" width="16" height="16" /> → About</strong> in the toolbar) and also check out <a href="https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/">the Beta 1 post</a>.</p>\n<p><strong>Plugin authors:</strong> Remember to test your plugins against 4.1, and if they&#8217;re compatible, make sure they are marked as tested up to 4.1. Be sure to follow along the core development blog; we&#8217;ve been posting <a href="https://make.wordpress.org/core/tag/4-1-dev-notes/">notes for developers for 4.1</a> as always.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:74:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate-3/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.1 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 11 Dec 2014 11:52:16 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:3:"4.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3375";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:341:"The release candidate for WordPress 4.1 is now available. We&#8217;ve made a lot of refinements over the last few weeks. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.1 on Tuesday, December 16, but we need your [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2301:"<p>The release candidate for WordPress 4.1 is now available.</p>\n<p>We&#8217;ve made a lot of refinements over the last few weeks. RC means we think we’re done, but with millions of users and thousands of plugins and themes, it’s possible we’ve missed something. We hope to ship WordPress 4.1 on Tuesday, December 16, but we need your help to get there. If you haven’t tested 4.1 yet, now is the time! (Please though, not on your live site unless you’re adventurous.)</p>\n<p><strong>Think you&#8217;ve found a bug?</strong> Please post to the <a href="https://wordpress.org/support/forum/alphabeta/">Alpha/Beta support forum</a>. If any known issues come up, you&#8217;ll be able to <a href="https://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>To test WordPress 4.1 RC1, you can use the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin or you can <a href="https://wordpress.org/wordpress-4.1-RC1.zip">download the release candidate here</a> (zip). If you&#8217;d like to learn more about what&#8217;s new in WordPress 4.1, visit the About screen in your dashboard (<strong><img src="https://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png" alt="" width="16" height="16" /> → About</strong> in the toolbar) or check out the <a href="https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/">beta announcement</a>.</p>\n<p><strong>Developers</strong>, please test your plugins and themes against WordPress 4.1 and update your plugin&#8217;s <em>Tested up to</em> version in the readme to 4.1 before next week. If you find compatibility problems, we never want to break things, so please be sure to post to the support forums so we can figure those out before the final release.</p>\n<p>Be sure to <a href="https://make.wordpress.org/core/">follow along the core development blog</a>, where we&#8217;ll continue to post <a href="https://make.wordpress.org/core/tag/4-1-dev-notes/">notes for developers</a> for 4.1. (For example: if you&#8217;ve written a child theme for Twenty Fifteen, some of the new pagination functions have been renamed for clarity.)</p>\n<p><em>Testing four point one</em><br />\n<em>Why are we up at this hour?</em><br />\n<em>Code is poetry</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://wordpress.org/news/2014/12/wordpress-4-1-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:32:"WordPress 4.0.1 Security Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2014/11/wordpress-4-0-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2014/11/wordpress-4-0-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Nov 2014 18:55:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Security";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3363";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:345:"WordPress 4.0.1 is now available. This is a critical security release for all previous versions and we strongly encourage you to update your sites immediately. Sites that support automatic background updates will be updated to WordPress 4.0.1 within the next few hours. If you are still on WordPress 3.9.2, 3.8.4, or 3.7.4, you will be [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:12:"Andrew Nacin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3395:"<p>WordPress 4.0.1 is now available. This is a <strong>critical security release</strong> for all previous versions and we strongly encourage you to update your sites immediately.</p>\n<p>Sites that support automatic background updates will be updated to WordPress 4.0.1 within the next few hours. If you are still on WordPress 3.9.2, 3.8.4, or 3.7.4, you will be updated to 3.9.3, 3.8.5, or 3.7.5 to keep everything secure. (We don’t support older versions, so please update to 4.0.1 for the latest and greatest.)</p>\n<p>WordPress versions 3.9.2 and earlier are affected by a critical cross-site scripting vulnerability, which could enable anonymous users to compromise a site. This was reported by <a href="http://klikki.fi/">Jouko Pynnonen</a>. This issue does not affect version 4.0, but version 4.0.1 does address these eight security issues:</p>\n<ul>\n<li>Three cross-site scripting issues that a contributor or author could use to compromise a site. Discovered by <a href="http://joncave.co.uk/">Jon Cave</a>, <a href="http://www.miqrogroove.com/">Robert Chapin</a>, and <a href="https://johnblackbourn.com/">John Blackbourn</a> of the WordPress security team.</li>\n<li>A cross-site request forgery that could be used to trick a user into changing their password.</li>\n<li>An issue that could lead to a denial of service when passwords are checked. Reported by <a href="http://www.behindthefirewalls.com/">Javier Nieto Arevalo</a> and <a href="http://www.devconsole.info/">Andres Rojas Guerrero</a>.</li>\n<li>Additional protections for server-side request forgery attacks when WordPress makes HTTP requests. Reported by Ben Bidner (vortfu).</li>\n<li>An extremely unlikely hash collision could allow a user&#8217;s account to be compromised, that also required that they haven&#8217;t logged in since 2008 (I wish I were kidding). Reported by <a href="http://david.dw-perspective.org.uk">David Anderson</a>.</li>\n<li>WordPress now invalidates the links in a password reset email if the user remembers their password, logs in, and changes their email address. Reported separately by <a href="https://twitter.com/MomenBassel">Momen Bassel</a>, <a href="http://c0dehouse.blogspot.in/">Tanoy Bose</a>, and <a href="https://managewp.com/">Bojan Slavković of ManageWP</a>.</li>\n</ul>\n<p>Version 4.0.1 also fixes 23 bugs with 4.0, and we&#8217;ve made two hardening changes, including better validation of EXIF data we are extracting from uploaded photos. Reported by <a href="http://www.securesolutions.no/">Chris Andrè Dale</a>.</p>\n<p>We appreciated the <a href="https://codex.wordpress.org/FAQ_Security">responsible disclosure</a> of these issues directly to our security team. For more information, see the <a href="https://codex.wordpress.org/Version_4.0.1">release notes</a> or consult the <a href="https://core.trac.wordpress.org/log/branches/4.0?rev=30475&amp;stop_rev=29710">list of changes</a>.</p>\n<p><a href="https://wordpress.org/download/">Download WordPress 4.0.1</a> or venture over to <strong>Dashboard → Updates</strong> and simply click “Update Now”.</p>\n<p><em>Already testing WordPress 4.1? The second beta is now available (<a href="https://wordpress.org/wordpress-4.1-beta2.zip">zip</a>) and it contains these security fixes. For more on 4.1, see <a href="https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/">the beta 1 announcement post</a>.</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2014/11/wordpress-4-0-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:48:"\n		\n		\n		\n		\n		\n				\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.1 Beta 1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Nov 2014 22:35:34 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:3:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:4:"beta";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3352";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:346:"Welcome, everyone, to WordPress 4.1 Beta 1! This software is still in development, so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.1, try the WordPress Beta Tester plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"John Blackbourn";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3409:"<p>Welcome, everyone, to WordPress 4.1 Beta 1!</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.1, try the <a href="https://wordpress.org/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you&#8217;ll want &#8220;bleeding edge nightlies&#8221;). Or you can <a href="//wordpress.org/wordpress-4.1-beta1.zip">download the beta here</a> (zip).</p>\n<p>WordPress 4.1 is due for release next month, so we need your help with testing. Here are some highlights of what to test:</p>\n<ul>\n<li>Our beautiful new default theme, <a href="https://make.wordpress.org/core/2014/09/09/twenty-fifteen/">Twenty Fifteen</a>. It&#8217;s a clean, mobile-first, blog-focused theme designed through simplicity.</li>\n<li>A new <a href="https://make.wordpress.org/core/2014/11/11/focus-v2-demo-video/">distraction-free writing mode for the editor</a>. It&#8217;s enabled by default for beta, and we&#8217;d love feedback on it.</li>\n<li>The ability to automatically install new language packs right from the General Settings screen (available as long as your site&#8217;s filesystem is writable).</li>\n<li>A new inline formatting toolbar for images embedded into posts.</li>\n</ul>\n<p>There have been a lot of changes for developers to test as well:</p>\n<ul>\n<li><a href="https://make.wordpress.org/core/2014/10/20/update-on-query-improvements-in-4-1/">Improvements to meta, date, comment, and taxonomy queries</a>, including complex (nested, multiple relation) queries; and querying comment types (<a href="https://core.trac.wordpress.org/ticket/12668">#12668</a>).</li>\n<li>A single term shared across multiple taxonomies is now split into two when updated. For more, <a href="https://make.wordpress.org/core/2014/11/12/an-update-on-the-taxonomy-roadmap/">see this post</a>, <a href="https://core.trac.wordpress.org/ticket/5809">#5809</a>, and <a href="https://core.trac.wordpress.org/ticket/30335">#30335</a>.</li>\n<li>A new and better way for <a href="https://make.wordpress.org/core/2014/10/29/title-tags-in-4-1/">themes to handle title tags</a>.</li>\n<li>Several <a href="https://make.wordpress.org/core/2014/10/27/toward-a-complete-javascript-api-for-the-customizer/">improvements to the Customizer API</a>, including contextual panels and sections, and JavaScript templates for controls.</li>\n</ul>\n<p>If you want a more in-depth view of what changes have made it into 4.1, <a href="https://make.wordpress.org/core/tag/week-in-core/">check out the weekly review posts</a> on the main development blog.</p>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums. We’d love to hear from you! If you’re comfortable writing a reproducible bug report, <a href="https://make.wordpress.org/core/reports/">file one on the WordPress Trac</a>. There, you can also find <a href="https://core.trac.wordpress.org/tickets/major">a list of known bugs</a> and <a href="https://core.trac.wordpress.org/query?status=closed&amp;group=component&amp;milestone=4.1">everything we’ve fixed</a> so far.</p>\n<p>Happy testing!</p>\n<p><em>Twenty Fifteen theme</em><br />\n<em> The beautiful face which hides</em><br />\n<em> Many improvements</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/news/2014/11/wordpress-4-1-beta-1/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"Watch WordCamp San Francisco Livestream";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"https://wordpress.org/news/2014/10/wcsf-livestream/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/news/2014/10/wcsf-livestream/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 24 Oct 2014 20:18:43 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:9:"Community";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"WordCamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3341";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:381:"WordCamp San Francisco is the official annual WordPress conference, gathering the community every year since 2006. This is the time when Matt Mullenweg addresses the community in his annual State of the Word presentation – a recap of  the year in WordPress and giving us a glimpse into its future. This year the speaker lineup is stellar. There will be talks by [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"Nikolay Bachiyski";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:1975:"<p><a title="2014 edition" href="http://2014.sf.wordcamp.org">WordCamp San Francisco</a> is the official annual WordPress conference, gathering the community every year <a title="An old website for a WordPress long time ago" href="http://2006.sf.wordcamp.org">since 2006</a>. This is the time when Matt Mullenweg addresses the community in his annual <a href="http://wordpress.tv/?s=state+of+the+word">State of the Word</a> presentation – a recap of  the year in WordPress and giving us a glimpse into its future.</p>\n<p>This year the speaker lineup is stellar. There will be talks by three of the lead WordPress developers: <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-andrew-nacin">Andrew Nacin</a>, <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-helen-hou-sandi">Helen Hou-Sandí</a>, and <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-mark-jaquith">Mark Jaquith</a>. We’re also looking forward to speakers like <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-jenny-lawson">Jenny Lawson</a>, also known as The Bloggess, and <a href="http://2014.sf.wordcamp.org/speaker/chris-lema/">Chris Lema</a>. If you’re at all interested in the web, you will appreciate the appearance of <a href="http://2014.sf.wordcamp.org/speakers/#wcorg-speaker-jeff-veen">Jeff Veen</a> – one of the creators of Google Analytics and co-founder of Typekit.</p>\n<p>Even though San Francisco is far far away for most of you, you can still be part of the fun and watch all presentations in real-time via livestream:</p>\n<p><a href="http://2014.sf.wordcamp.org/tickets/">Get a livestream ticket and watch all talks from WordCamp San Francisco live</a></p>\n<p>If you hurry, you can get one of the special livestream tickets, including a WordCamp San Francisco 2104 t-shirt. You can find all the technical details and start times <a href="http://2014.sf.wordcamp.org/live-stream/">at the WordCamp San Francisco website</a>.</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2014/10/wcsf-livestream/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:42:"\n		\n		\n		\n		\n		\n				\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"WordPress 4.0 “Benny”";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"https://wordpress.org/news/2014/09/benny/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:50:"https://wordpress.org/news/2014/09/benny/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 04 Sep 2014 17:05:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:1:{i:0;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3296";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:370:"Version 4.0 of WordPress, named “Benny” in honor of jazz clarinetist and bandleader Benny Goodman, is available for download or update in your WordPress dashboard. While 4.0 is just another number for us after 3.9 and before 4.1, we feel we&#8217;ve put a little extra polish into it. This release brings you a smoother writing and management experience [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:23571:"<p>Version 4.0 of WordPress, named “Benny” in honor of jazz clarinetist and bandleader <a href="http://en.wikipedia.org/wiki/Benny_Goodman">Benny Goodman</a>, is available <a href="https://wordpress.org/download/">for download</a> or update in your WordPress dashboard. While 4.0 is just another number for us after 3.9 and before 4.1, we feel we&#8217;ve put a little extra polish into it. This release brings you a smoother writing and management experience we think you&#8217;ll enjoy.</p>\n<div id="v-bUdzKMro-1" class="video-player"><embed id="v-bUdzKMro-1-video" src="https://v0.wordpress.com/player.swf?v=1.04&amp;guid=bUdzKMro&amp;isDynamicSeeking=true" type="application/x-shockwave-flash" width="692" height="388" title="Introducing WordPress 4.0 &quot;Benny&quot;" wmode="direct" seamlesstabbing="true" allowfullscreen="true" allowscriptaccess="always" overstretch="true"></embed></div>\n<hr />\n<h2 style="text-align: center">Manage your media with style</h2>\n<p><img class="alignnone size-full wp-image-3316" src="https://wordpress.org/news/files/2014/09/media.jpg" alt="Media Library" width="1000" height="586" />Explore your uploads in a beautiful, endless grid. A new details preview makes viewing and editing any amount of media in sequence a snap.</p>\n<hr />\n<h2 style="text-align: center">Working with embeds has never been easier</h2>\n<div style="width: 632px; " class="wp-video"><!--[if lt IE 9]><script>document.createElement(''video'');</script><![endif]-->\n<video class="wp-video-shortcode" id="video-3296-1" width="632" height="445" autoplay="1" preload="metadata" controls="controls"><source type="video/mp4" src="//s.w.org/images/core/4.0/embed.mp4?_=1" /><source type="video/webm" src="//s.w.org/images/core/4.0/embed.webm?_=1" /><source type="video/ogg" src="//s.w.org/images/core/4.0/embed.ogv?_=1" /><a href="//s.w.org/images/core/4.0/embed.mp4">//s.w.org/images/core/4.0/embed.mp4</a></video></div>\n<p>Paste in a YouTube URL on a new line, and watch it magically become an embedded video. Now try it with a tweet. Oh yeah — embedding has become a visual experience. The editor shows a true preview of your embedded content, saving you time and giving you confidence.</p>\n<p>We’ve expanded the services supported by default, too — you can embed videos from CollegeHumor, playlists from YouTube, and talks from TED. <a href="https://codex.wordpress.org/Embeds">Check out all of the embeds</a> that WordPress supports.</p>\n<hr />\n<h2 style="text-align: center">Focus on your content</h2>\n<div style="width: 632px; " class="wp-video"><video class="wp-video-shortcode" id="video-3296-2" width="632" height="356" autoplay="1" preload="metadata" controls="controls"><source type="video/mp4" src="//s.w.org/images/core/4.0/focus.mp4?_=2" /><source type="video/webm" src="//s.w.org/images/core/4.0/focus.webm?_=2" /><source type="video/ogg" src="//s.w.org/images/core/4.0/focus.ogv?_=2" /><a href="//s.w.org/images/core/4.0/focus.mp4">//s.w.org/images/core/4.0/focus.mp4</a></video></div>\n<p>Writing and editing is smoother and more immersive with an editor that expands to fit your content as you write, and keeps the formatting tools available at all times.</p>\n<hr />\n<h2 style="text-align: center">Finding the right plugin</h2>\n<p><img class="aligncenter size-large wp-image-3309" src="https://wordpress.org/news/files/2014/09/add-plugin1-1024x600.png" alt="Add plugins" width="692" height="405" /></p>\n<p>There are more than 30,000 free and open source plugins in the WordPress plugin directory. WordPress 4.0 makes it easier to find the right one for your needs, with new metrics, improved search, and a more visual browsing experience.</p>\n<hr />\n<h2 style="text-align: center">The Ensemble</h2>\n<p>This release was led by <a href="http://helenhousandi.com">Helen Hou-Sandí</a>, with the help of these fine individuals. There are 275 contributors with props in this release, a new high. Pull up some Benny Goodman on your music service of choice, as a bandleader or in one of his turns as a classical clarinetist, and check out some of their profiles:</p>\n<p><a href="https://profiles.wordpress.org/aaroncampbell">Aaron D. Campbell</a>, <a href="https://profiles.wordpress.org/jorbin">Aaron Jorbin</a>, <a href="https://profiles.wordpress.org/adamsilverstein">Adam Silverstein</a>, <a href="https://profiles.wordpress.org/viper007bond">Alex Mills (Viper007Bond)</a>, <a href="https://profiles.wordpress.org/tellyworth">Alex Shiels</a>, <a href="https://profiles.wordpress.org/alexanderrohmann">Alexander Rohmann</a>, <a href="https://profiles.wordpress.org/aliso">Alison Barrett</a>, <a href="https://profiles.wordpress.org/collinsinternet">Allan Collins</a>, <a href="https://profiles.wordpress.org/amit">Amit Gupta</a>, <a href="https://profiles.wordpress.org/sabreuse">Amy Hendrix (sabreuse)</a>, <a href="https://profiles.wordpress.org/afercia">Andrea Fercia</a>, <a href="https://profiles.wordpress.org/andrezrv">Andres Villarreal</a>, <a href="https://profiles.wordpress.org/zamfeer">Andrew Mowe</a>, <a href="https://profiles.wordpress.org/sumobi">Andrew Munro (sumobi)</a>, <a href="https://profiles.wordpress.org/nacin">Andrew Nacin</a>, <a href="https://profiles.wordpress.org/azaozz">Andrew Ozz</a>, <a href="https://profiles.wordpress.org/andy">Andy Skelton</a>, <a href="https://profiles.wordpress.org/ankit-k-gupta">Ankit K Gupta</a>, <a href="https://profiles.wordpress.org/atimmer">Anton Timmermans</a>, <a href="https://profiles.wordpress.org/arnee">Arne Brachhold</a>, <a href="https://profiles.wordpress.org/aubreypwd">aubreypwd</a>, <a href="https://profiles.wordpress.org/filosofo">Austin Matzko</a>, <a href="https://profiles.wordpress.org/empireoflight">Ben Dunkle</a>, <a href="https://profiles.wordpress.org/kau-boy">Bernhard Kau</a>, <a href="https://profiles.wordpress.org/boonebgorges">Boone Gorges</a>, <a href="https://profiles.wordpress.org/bradyvercher">Brady Vercher</a>, <a href="https://profiles.wordpress.org/bramd">Bram Duvigneau</a>, <a href="https://profiles.wordpress.org/kraftbj">Brandon Kraft</a>, <a href="https://profiles.wordpress.org/krogsgard">Brian Krogsgard</a>, <a href="https://profiles.wordpress.org/brianlayman">Brian Layman</a>, <a href="https://profiles.wordpress.org/rzen">Brian Richards</a>, <a href="https://profiles.wordpress.org/camdensegal">Camden Segal</a>, <a href="https://profiles.wordpress.org/sixhours">Caroline Moore</a>, <a href="https://profiles.wordpress.org/mackensen">Charles Fulton</a>, <a href="https://profiles.wordpress.org/chouby">Chouby</a>, <a href="https://profiles.wordpress.org/chrico">ChriCo</a>, <a href="https://profiles.wordpress.org/c3mdigital">Chris Olbekson</a>, <a href="https://profiles.wordpress.org/chrisl27">chrisl27</a>, <a href="https://profiles.wordpress.org/caxelsson">Christian Axelsson</a>, <a href="https://profiles.wordpress.org/cfinke">Christopher Finke</a>, <a href="https://profiles.wordpress.org/boda1982">Christopher Spires</a>, <a href="https://profiles.wordpress.org/clifgriffin">Clifton Griffin</a>, <a href="https://profiles.wordpress.org/jupiterwise">Corey McKrill</a>, <a href="https://profiles.wordpress.org/corphi">Corphi</a>, <a href="https://profiles.wordpress.org/extendwings">Daisuke Takahashi</a>, <a href="https://profiles.wordpress.org/ghost1227">Dan Griffiths</a>, <a href="https://profiles.wordpress.org/danielbachhuber">Daniel Bachhuber</a>, <a href="https://profiles.wordpress.org/danielhuesken">Daniel Husken</a>, <a href="https://profiles.wordpress.org/redsweater">Daniel Jalkut (Red Sweater)</a>, <a href="https://profiles.wordpress.org/dannydehaan">Danny de Haan</a>, <a href="https://profiles.wordpress.org/dkotter">Darin Kotter</a>, <a href="https://profiles.wordpress.org/koop">Daryl Koopersmith</a>, <a href="https://profiles.wordpress.org/dllh">Daryl L. L. Houston (dllh)</a>, <a href="https://profiles.wordpress.org/davidakennedy">David A. Kennedy</a>, <a href="https://profiles.wordpress.org/dlh">David Herrera</a>, <a href="https://profiles.wordpress.org/dnaber-de">David Naber</a>, <a href="https://profiles.wordpress.org/davidthemachine">DavidTheMachine</a>, <a href="https://profiles.wordpress.org/debaat">DeBAAT</a>, <a href="https://profiles.wordpress.org/dd32">Dion Hulse</a>, <a href="https://profiles.wordpress.org/ocean90">Dominik Schilling</a>, <a href="https://profiles.wordpress.org/donncha">Donncha O Caoimh</a>, <a href="https://profiles.wordpress.org/drewapicture">Drew Jaynes</a>, <a href="https://profiles.wordpress.org/dustyn">Dustyn Doyle</a>, <a href="https://profiles.wordpress.org/eddiemoya">Eddie Moya</a>, <a href="https://profiles.wordpress.org/oso96_2000">Eduardo Reveles</a>, <a href="https://profiles.wordpress.org/edwin-at-studiojoyocom">Edwin Siebel</a>, <a href="https://profiles.wordpress.org/ehg">ehg</a>, <a href="https://profiles.wordpress.org/erayalakese">erayalakese</a>, <a href="https://profiles.wordpress.org/ericlewis">Eric Andrew Lewis</a>, <a href="https://profiles.wordpress.org/ebinnion">Eric Binnion</a>, <a href="https://profiles.wordpress.org/ericmann">Eric Mann</a>, <a href="https://profiles.wordpress.org/ejdanderson">Evan Anderson</a>, <a href="https://profiles.wordpress.org/eherman24">Evan Herman</a>, <a href="https://profiles.wordpress.org/fab1en">Fabien Quatravaux</a>, <a href="https://profiles.wordpress.org/fahmiadib">Fahmi Adib</a>, <a href="https://profiles.wordpress.org/feedmeastraycat">feedmeastraycat</a>, <a href="https://profiles.wordpress.org/frank-klein">Frank Klein</a>, <a href="https://profiles.wordpress.org/garhdez">garhdez</a>, <a href="https://profiles.wordpress.org/garyc40">Gary Cao</a>, <a href="https://profiles.wordpress.org/garyj">Gary Jones</a>, <a href="https://profiles.wordpress.org/pento">Gary Pendergast</a>, <a href="https://profiles.wordpress.org/garza">garza</a>, <a href="https://profiles.wordpress.org/gauravmittal1995">gauravmittal1995</a>, <a href="https://profiles.wordpress.org/gavra">Gavrisimo</a>, <a href="https://profiles.wordpress.org/georgestephanis">George Stephanis</a>, <a href="https://profiles.wordpress.org/grahamarmfield">Graham Armfield</a>, <a href="https://profiles.wordpress.org/vancoder">Grant Mangham</a>, <a href="https://profiles.wordpress.org/gcorne">Gregory Cornelius</a>, <a href="https://profiles.wordpress.org/bordoni">Gustavo Bordoni</a>, <a href="https://profiles.wordpress.org/harrym">harrym</a>, <a href="https://profiles.wordpress.org/hebbet">hebbet</a>, <a href="https://profiles.wordpress.org/hinnerk">Hinnerk Altenburg</a>, <a href="https://profiles.wordpress.org/hlashbrooke">Hugh Lashbrooke</a>, <a href="https://profiles.wordpress.org/iljoja">iljoja</a>, <a href="https://profiles.wordpress.org/imath">imath</a>, <a href="https://profiles.wordpress.org/ipstenu">Ipstenu (Mika Epstein)</a>, <a href="https://profiles.wordpress.org/issuu">issuu</a>, <a href="https://profiles.wordpress.org/jdgrimes">J.D. Grimes</a>, <a href="https://profiles.wordpress.org/jacklenox">Jack Lenox</a>, <a href="https://profiles.wordpress.org/jackreichert">Jack Reichert</a>, <a href="https://profiles.wordpress.org/jacobdubail">Jacob Dubail</a>, <a href="https://profiles.wordpress.org/janhenkg">JanHenkG</a>, <a href="https://profiles.wordpress.org/avryl">Janneke Van Dorpe</a>, <a href="https://profiles.wordpress.org/jwenerd">Jared Wenerd</a>, <a href="https://profiles.wordpress.org/jaza613">Jaza613</a>, <a href="https://profiles.wordpress.org/jeffstieler">Jeff Stieler</a>, <a href="https://profiles.wordpress.org/jeremyfelt">Jeremy Felt</a>, <a href="https://profiles.wordpress.org/jpry">Jeremy Pry</a>, <a href="https://profiles.wordpress.org/slimndap">Jeroen Schmit</a>, <a href="https://profiles.wordpress.org/jerrysarcastic">Jerry Bates (jerrysarcastic)</a>, <a href="https://profiles.wordpress.org/jesin">Jesin A</a>, <a href="https://profiles.wordpress.org/jayjdk">Jesper Johansen (jayjdk)</a>, <a href="https://profiles.wordpress.org/jesper800">Jesper van Engelen</a>, <a href="https://profiles.wordpress.org/engelen">Jesper van Engelen</a>, <a href="https://profiles.wordpress.org/jessepollak">Jesse Pollak</a>, <a href="https://profiles.wordpress.org/jgadbois">jgadbois</a>, <a href="https://profiles.wordpress.org/jartes">Joan Artes</a>, <a href="https://profiles.wordpress.org/joedolson">Joe Dolson</a>, <a href="https://profiles.wordpress.org/joehoyle">Joe Hoyle</a>, <a href="https://profiles.wordpress.org/jkudish">Joey Kudish</a>, <a href="https://profiles.wordpress.org/johnbillion">John Blackbourn</a>, <a href="https://profiles.wordpress.org/johnjamesjacoby">John James Jacoby</a>, <a href="https://profiles.wordpress.org/johnzanussi">John Zanussi</a>, <a href="https://profiles.wordpress.org/duck_">Jon Cave</a>, <a href="https://profiles.wordpress.org/jonnyauk">jonnyauk</a>, <a href="https://profiles.wordpress.org/joostdevalk">Joost de Valk</a>, <a href="https://profiles.wordpress.org/softmodeling">Jordi Cabot</a>, <a href="https://profiles.wordpress.org/jjeaton">Josh Eaton</a>, <a href="https://profiles.wordpress.org/tai">JOTAKI Taisuke</a>, <a href="https://profiles.wordpress.org/juliobox">Julio Potier</a>, <a href="https://profiles.wordpress.org/justinsainton">Justin Sainton</a>, <a href="https://profiles.wordpress.org/jtsternberg">Justin Sternberg</a>, <a href="https://profiles.wordpress.org/greenshady">Justin Tadlock</a>, <a href="https://profiles.wordpress.org/kadamwhite">K.Adam White</a>, <a href="https://profiles.wordpress.org/trepmal">Kailey (trepmal)</a>, <a href="https://profiles.wordpress.org/kapeels">kapeels</a>, <a href="https://profiles.wordpress.org/ryelle">Kelly Dwan</a>, <a href="https://profiles.wordpress.org/kevinlangleyjr">Kevin Langley</a>, <a href="https://profiles.wordpress.org/kworthington">Kevin Worthington</a>, <a href="https://profiles.wordpress.org/kpdesign">Kim Parsell</a>, <a href="https://profiles.wordpress.org/kwight">Kirk Wight</a>, <a href="https://profiles.wordpress.org/kitchin">kitchin</a>, <a href="https://profiles.wordpress.org/ixkaito">Kite</a>, <a href="https://profiles.wordpress.org/knutsp">Knut Sparhell</a>, <a href="https://profiles.wordpress.org/kovshenin">Konstantin Kovshenin</a>, <a href="https://profiles.wordpress.org/obenland">Konstantin Obenland</a>, <a href="https://profiles.wordpress.org/kurtpayne">Kurt Payne</a>, <a href="https://profiles.wordpress.org/lancewillett">Lance Willett</a>, <a href="https://profiles.wordpress.org/leewillis77">Lee Willis</a>, <a href="https://profiles.wordpress.org/lessbloat">lessbloat</a>, <a href="https://profiles.wordpress.org/layotte">Lew Ayotte</a>, <a href="https://profiles.wordpress.org/lritter">lritter</a>, <a href="https://profiles.wordpress.org/lukecarbis">Luke Carbis</a>, <a href="https://profiles.wordpress.org/lgedeon">Luke Gedeon</a>, <a href="https://profiles.wordpress.org/m_i_n">m_i_n</a>, <a href="https://profiles.wordpress.org/funkatronic">Manny Fleurmond</a>, <a href="https://profiles.wordpress.org/targz-1">Manuel Schmalstieg</a>, <a href="https://profiles.wordpress.org/clorith">Marius (Clorith)</a>, <a href="https://profiles.wordpress.org/markjaquith">Mark Jaquith</a>, <a href="https://profiles.wordpress.org/markoheijnen">Marko Heijnen</a>, <a href="https://profiles.wordpress.org/mjbanks">Matt Banks</a>, <a href="https://profiles.wordpress.org/sivel">Matt Martz</a>, <a href="https://profiles.wordpress.org/matt">Matt Mullenweg</a>, <a href="https://profiles.wordpress.org/mattwiebe">Matt Wiebe</a>, <a href="https://profiles.wordpress.org/mboynes">Matthew Boynes</a>, <a href="https://profiles.wordpress.org/mdbitz">Matthew Denton</a>, <a href="https://profiles.wordpress.org/mattheweppelsheimer">Matthew Eppelsheimer</a>, <a href="https://profiles.wordpress.org/mattheu">Matthew Haines-Young</a>, <a href="https://profiles.wordpress.org/mattyrob">mattyrob</a>, <a href="https://profiles.wordpress.org/meekyhwang">meekyhwang</a>, <a href="https://profiles.wordpress.org/melchoyce">Mel Choyce</a>, <a href="https://profiles.wordpress.org/mdawaffe">Michael Adams (mdawaffe)</a>, <a href="https://profiles.wordpress.org/michalzuber">michalzuber</a>, <a href="https://profiles.wordpress.org/midxcat">midxcat</a>, <a href="https://profiles.wordpress.org/mauteri">Mike Auteri</a>, <a href="https://profiles.wordpress.org/mikehansenme">Mike Hansen</a>, <a href="https://profiles.wordpress.org/mikejolley">Mike Jolley</a>, <a href="https://profiles.wordpress.org/mikelittle">Mike Little</a>, <a href="https://profiles.wordpress.org/mikemanger">Mike Manger</a>, <a href="https://profiles.wordpress.org/mnelson4">Mike Nelson</a>, <a href="https://profiles.wordpress.org/dh-shredder">Mike Schroder</a>, <a href="https://profiles.wordpress.org/mikeyarce">Mikey Arce</a>, <a href="https://profiles.wordpress.org/dimadin">Milan Dinic</a>, <a href="https://profiles.wordpress.org/morganestes">Morgan Estes</a>, <a href="https://profiles.wordpress.org/usermrpapa">Mr Papa</a>, <a href="https://profiles.wordpress.org/mrmist">mrmist</a>, <a href="https://profiles.wordpress.org/m_uysl">Mustafa Uysal</a>, <a href="https://profiles.wordpress.org/muvimotv">MuViMoTV</a>, <a href="https://profiles.wordpress.org/nabil_kadimi">nabil_kadimi</a>, <a href="https://profiles.wordpress.org/namibia">Namibia</a>, <a href="https://profiles.wordpress.org/alex-ye">Nashwan Doaqan</a>, <a href="https://profiles.wordpress.org/nd987">nd987</a>, <a href="https://profiles.wordpress.org/neil_pie">Neil Pie</a>, <a href="https://profiles.wordpress.org/niallkennedy">Niall Kennedy</a>, <a href="https://profiles.wordpress.org/celloexpressions">Nick Halsey</a>, <a href="https://profiles.wordpress.org/nbachiyski">Nikolay Bachiyski</a>, <a href="https://profiles.wordpress.org/schoenwaldnils">Nils Schonwald</a>, <a href="https://profiles.wordpress.org/ninos-ego">Ninos</a>, <a href="https://profiles.wordpress.org/nvwd">Nowell VanHoesen</a>, <a href="https://profiles.wordpress.org/compute">Patrick Hesselberg</a>, <a href="https://profiles.wordpress.org/pbearne">Paul Bearne</a>, <a href="https://profiles.wordpress.org/pdclark">Paul Clark</a>, <a href="https://profiles.wordpress.org/paulschreiber">Paul Schreiber</a>, <a href="https://profiles.wordpress.org/paulwilde">Paul Wilde</a>, <a href="https://profiles.wordpress.org/pavelevap">pavelevap</a>, <a href="https://profiles.wordpress.org/westi">Peter Westwood</a>, <a href="https://profiles.wordpress.org/philiparthurmoore">Philip Arthur Moore</a>, <a href="https://profiles.wordpress.org/philipjohn">Philip John</a>, <a href="https://profiles.wordpress.org/senlin">Piet Bos</a>, <a href="https://profiles.wordpress.org/psoluch">Piotr Soluch</a>, <a href="https://profiles.wordpress.org/mordauk">Pippin Williamson</a>, <a href="https://profiles.wordpress.org/purzlbaum">purzlbaum</a>, <a href="https://profiles.wordpress.org/rachelbaker">Rachel Baker</a>, <a href="https://profiles.wordpress.org/rclations">RC Lations</a>, <a href="https://profiles.wordpress.org/iamfriendly">Richard Tape</a>, <a href="https://profiles.wordpress.org/rickalee">Ricky Lee Whittemore</a>, <a href="https://profiles.wordpress.org/rob1n">rob1n</a>, <a href="https://profiles.wordpress.org/miqrogroove">Robert Chapin</a>, <a href="https://profiles.wordpress.org/rdall">Robert Dall</a>, <a href="https://profiles.wordpress.org/harmr">RobertHarm</a>, <a href="https://profiles.wordpress.org/rohan013">Rohan Rawat</a>, <a href="https://profiles.wordpress.org/rhurling">Rouven Hurling</a>, <a href="https://profiles.wordpress.org/ruudjoyo">Ruud Laan</a>, <a href="https://profiles.wordpress.org/ryan">Ryan Boren</a>, <a href="https://profiles.wordpress.org/rmccue">Ryan McCue</a>, <a href="https://profiles.wordpress.org/sammybeats">Sam Brodie</a>, <a href="https://profiles.wordpress.org/otto42">Samuel Wood (Otto)</a>, <a href="https://profiles.wordpress.org/sathishn">Sathish Nagarajan</a>, <a href="https://profiles.wordpress.org/coffee2code">Scott Reilly</a>, <a href="https://profiles.wordpress.org/wonderboymusic">Scott Taylor</a>, <a href="https://profiles.wordpress.org/greglone">ScreenfeedFr</a>, <a href="https://profiles.wordpress.org/scribu">scribu</a>, <a href="https://profiles.wordpress.org/seanchayes">Sean Hayes</a>, <a href="https://profiles.wordpress.org/nessworthy">Sean Nessworthy</a>, <a href="https://profiles.wordpress.org/sergejmueller">Sergej Muller</a>, <a href="https://profiles.wordpress.org/sergeybiryukov">Sergey Biryukov</a>, <a href="https://profiles.wordpress.org/shanebp">shanebp</a>, <a href="https://profiles.wordpress.org/sharonaustin">Sharon Austin</a>, <a href="https://profiles.wordpress.org/shaunandrews">Shaun Andrews</a>, <a href="https://profiles.wordpress.org/simonp303">Simon Pollard</a>, <a href="https://profiles.wordpress.org/simonwheatley">Simon Wheatley</a>, <a href="https://profiles.wordpress.org/slobodanmanic">Slobodan Manic</a>, <a href="https://profiles.wordpress.org/solarissmoke">solarissmoke</a>, <a href="https://profiles.wordpress.org/sphoid">sphoid</a>, <a href="https://profiles.wordpress.org/stephdau">Stephane Daury</a>, <a href="https://profiles.wordpress.org/netweb">Stephen Edgar</a>, <a href="https://profiles.wordpress.org/stompweb">Steven Jones</a>, <a href="https://profiles.wordpress.org/strangerstudios">strangerstudios</a>, <a href="https://profiles.wordpress.org/5um17">Sumit Singh</a>, <a href="https://profiles.wordpress.org/t4k1s">t4k1s</a>, <a href="https://profiles.wordpress.org/iamtakashi">Takashi Irie</a>, <a href="https://profiles.wordpress.org/taylorde">Taylor Dewey</a>, <a href="https://profiles.wordpress.org/thomasvanderbeek">Thomas van der Beek</a>, <a href="https://profiles.wordpress.org/tillkruess">Till Kruss</a>, <a href="https://profiles.wordpress.org/codenameeli">Tim &#039;Eli&#039; Dalbey</a>, <a href="https://profiles.wordpress.org/tmeister">tmeister</a>, <a href="https://profiles.wordpress.org/tobiasbg">TobiasBg</a>, <a href="https://profiles.wordpress.org/tjnowell">Tom J Nowell</a>, <a href="https://profiles.wordpress.org/willmot">Tom Willmot</a>, <a href="https://profiles.wordpress.org/topher1kenobe">Topher</a>, <a href="https://profiles.wordpress.org/torresga">torresga</a>, <a href="https://profiles.wordpress.org/liljimmi">Tracy Levesque</a>, <a href="https://profiles.wordpress.org/wpsmith">Travis Smith</a>, <a href="https://profiles.wordpress.org/treyhunner">treyhunner</a>, <a href="https://profiles.wordpress.org/umeshsingla">Umesh Kumar</a>, <a href="https://profiles.wordpress.org/vinod-dalvi">Vinod Dalvi</a>, <a href="https://profiles.wordpress.org/vlajos">vlajos</a>, <a href="https://profiles.wordpress.org/voldemortensen">voldemortensen</a>, <a href="https://profiles.wordpress.org/westonruter">Weston Ruter</a>, <a href="https://profiles.wordpress.org/winterdev">winterDev</a>, <a href="https://profiles.wordpress.org/wojtekszkutnik">Wojtek Szkutnik</a>, <a href="https://profiles.wordpress.org/yoavf">Yoav Farhi</a>, <a href="https://profiles.wordpress.org/katzwebdesign">Zack Katz</a>, <a href="https://profiles.wordpress.org/tollmanz">Zack Tollman</a>, and <a href="https://profiles.wordpress.org/zoerooney">Zoe Rooney</a>. Also thanks to <a href="http://michaelpick.wordpress.com/">Michael Pick</a> for producing the release video, and Helen with <a href="http://adriansandi.com">Adrián Sandí</a> for the music.</p>\n<p>If you want to follow along or help out, check out <a href="https://make.wordpress.org/">Make WordPress</a> and our <a href="https://make.wordpress.org/core/">core development blog</a>. Thanks for choosing WordPress. See you soon for version 4.1!</p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/news/2014/09/benny/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:31:"WordPress 4.0 Release Candidate";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"https://wordpress.org/news/2014/08/wordpress-4-0-release-candidate/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:76:"https://wordpress.org/news/2014/08/wordpress-4-0-release-candidate/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 27 Aug 2014 12:20:37 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3287";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:321:"The first release candidate for WordPress 4.0 is now available! In RC 1, we’ve made refinements to what we&#8217;ve been working on for this release. Check out the Beta 1 announcement post for more details on those features. We hope to ship WordPress 4.0 next week, but we need your help to get there. If you [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Helen Hou-Sandi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2134:"<p>The first release candidate for WordPress 4.0 is now available!</p>\n<p>In RC 1, we’ve made refinements to what we&#8217;ve been working on for this release. Check out the <a href="https://wordpress.org/news/2014/07/wordpress-4-0-beta-1/">Beta 1 announcement post</a> for more details on those features. We hope to ship WordPress 4.0 <em>next week</em>, but we need your help to get there. If you haven’t tested 4.0 yet, there’s no time like the present. (Please, not on a production site, unless you’re adventurous.)</p>\n<p><strong>Think you’ve found a bug? </strong>Please post to the <a href="https://wordpress.org/support/forum/alphabeta/">Alpha/Beta area in the support forums</a>. If any known issues come up, you’ll be able to <a href="https://core.trac.wordpress.org/report/5">find them here</a>.</p>\n<p>To test WordPress 4.0 RC1, try the <a href="https://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.0-RC1.zip">download the release candidate here</a> (zip). If you’d like to learn more about what’s new in WordPress 4.0, visit the awesome About screen in your dashboard (<strong><img src="https://i0.wp.com/core.svn.wordpress.org/branches/3.6/wp-content/themes/twentyten/images/wordpress.png?w=692" alt="" width="16" height="16" /> → About</strong> in the toolbar).</p>\n<p><strong>Developers,</strong> please test your plugins and themes against WordPress 4.0 and update your plugin&#8217;s <em>Tested up to</em> version in the readme to 4.0 before next week. If you find compatibility problems, please be sure to post any issues to the support forums so we can figure those out before the final release. You also may want to <a href="https://make.wordpress.org/core/2014/08/21/introducing-plugin-icons-in-the-plugin-installer/">give your plugin an icon</a>, which we launched last week and will appear in the dashboard along with banners.</p>\n<p><em>It is almost time</em><br />\n<em> For the 4.0 release</em><br />\n<em> And its awesomeness</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:72:"https://wordpress.org/news/2014/08/wordpress-4-0-release-candidate/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:20:"WordPress 4.0 Beta 4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/news/2014/08/wordpress-4-0-beta-4/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:65:"https://wordpress.org/news/2014/08/wordpress-4-0-beta-4/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 15 Aug 2014 05:06:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Development";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:8:"Releases";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"http://wordpress.org/news/?p=3280";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:353:"The fourth and likely final beta for WordPress 4.0 is now available. We&#8217;ve made more than 250 changes in the past month, including: Further improvements to the editor scrolling experience, especially when it comes to the second column of boxes. Better handling of small screens in the media library modals. A separate bulk selection mode [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Helen Hou-Sandi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:2003:"<p>The fourth and likely final beta for WordPress 4.0 is now available. We&#8217;ve made <a href="https://core.trac.wordpress.org/log?rev=29496&amp;stop_rev=29229&amp;limit=300">more than 250 changes</a> in the past month, including:</p>\n<ul>\n<li>Further improvements to the editor scrolling experience, especially when it comes to the second column of boxes.</li>\n<li>Better handling of small screens in the media library modals.</li>\n<li>A separate bulk selection mode for the media library grid view.</li>\n<li>Improvements to the installation language selector.</li>\n<li>Visual tweaks to plugin details and customizer panels.</li>\n</ul>\n<p><strong>We need your help</strong>. We’re still aiming for a release this month, which means the next week will be critical for identifying and squashing bugs. If you’re just joining us, please see <a href="https://wordpress.org/news/2014/07/wordpress-4-0-beta-1/">the Beta 1 announcement post</a> for what to look out for.</p>\n<p><strong>If you think you’ve found a bug</strong>, you can post to the <a href="https://wordpress.org/support/forum/alphabeta">Alpha/Beta area</a> in the support forums, where friendly moderators are standing by. <b>Plugin developers</b><strong>,</strong> if you haven’t tested WordPress 4.0 yet, now is the time — and be sure to update the “tested up to” version for your plugins so they’re listed as compatible with 4.0.</p>\n<p><strong>This software is still in development,</strong> so we don’t recommend you run it on a production site. Consider setting up a test site just to play with the new version. To test WordPress 4.0, try the <a href="https://wordpress.org/extend/plugins/wordpress-beta-tester/">WordPress Beta Tester</a> plugin (you’ll want “bleeding edge nightlies”). Or you can <a href="https://wordpress.org/wordpress-4.0-beta4.zip">download the beta here</a> (zip).</p>\n<p><em>We are working hard</em><br />\n<em>To finish up 4.0<br />\n</em><em>Will you help us too?</em></p>\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:61:"https://wordpress.org/news/2014/08/wordpress-4-0-beta-4/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"0";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:32:"https://wordpress.org/news/feed/";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:44:"http://purl.org/rss/1.0/modules/syndication/";a:2:{s:12:"updatePeriod";a:1:{i:0;a:5:{s:4:"data";s:6:"hourly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:15:"updateFrequency";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:9:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 02 Mar 2015 05:25:21 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:10:"x-pingback";s:37:"https://wordpress.org/news/xmlrpc.php";s:13:"last-modified";s:29:"Wed, 18 Feb 2015 23:40:39 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20150105054306";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1199, '_site_transient_timeout_browser_0989a11068659af908006b24c93e7062', '1422968518', 'yes'),
(1200, '_site_transient_browser_0989a11068659af908006b24c93e7062', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"40.0.2214.93";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(711, 'tenant_plugin__db_version', '1.0', 'yes'),
(1161, '_site_transient_timeout_browser_7e1c20f194bba71e59c31fedd8ce12d9', '1422949300', 'yes'),
(1162, '_site_transient_browser_7e1c20f194bba71e59c31fedd8ce12d9', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"40.0.2214.91";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1860, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1425299252', 'yes'),
(1861, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"4916";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3078";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3022";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2529";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2346";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1892";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1729";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1680";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1678";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1676";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1612";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1609";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1505";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1322";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1276";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1175";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1171";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1083";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1079";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:3:"918";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"905";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"874";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"843";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"837";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"794";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"758";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"748";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"709";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:3:"700";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"692";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"682";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"657";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"649";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"642";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"642";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"623";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"620";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"605";}s:5:"share";a:3:{s:4:"name";s:5:"Share";s:4:"slug";s:5:"share";s:5:"count";s:3:"600";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"593";}}', 'yes'),
(657, '_site_transient_ure_caps_readable', '0', 'yes'),
(1810, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:27:"akankshagupta@newgneray.com";s:7:"version";s:5:"4.1.1";s:9:"timestamp";i:1424720629;}', 'yes'),
(832, '_site_transient_timeout_browser_e58d36045af0cf39b9d5d8503bd7eedb', '1421986148', 'yes'),
(833, '_site_transient_browser_e58d36045af0cf39b9d5d8503bd7eedb', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"39.0.2171.99";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1582, '_site_transient_timeout_browser_dbe228e36cad75be403270fab5fb837a', '1423652161', 'yes'),
(1583, '_site_transient_browser_dbe228e36cad75be403270fab5fb837a', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"35.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1834, '_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1425317124', 'no'),
(1835, '_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9', '1425273924', 'no'),
(1813, '_transient_timeout_redux_tracking_cache', '1425325436', 'no'),
(1814, '_transient_redux_tracking_cache', '1', 'no'),
(1635, '_site_transient_timeout_browser_5d89405158710f07ecd3570e7243c32a', '1423824791', 'yes'),
(1636, '_site_transient_browser_5d89405158710f07ecd3570e7243c32a', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"40.0.2214.94";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1838, '_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109', '1425317125', 'no'),
(1839, '_transient_feed_mod_b9388c83948825c1edaef0d856b7b109', '1425273925', 'no'),
(1842, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1425317125', 'no'),
(1843, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''https://wordpress.org/news/2015/02/wordpress-4-1-1/''>WordPress 4.1.1 Maintenance Release</a> <span class="rss-date">February 18, 2015</span><div class="rssSummary">WordPress 4.1.1 is now available. This maintenance release fixes 21 bugs in version 4.1. Some of you may have been waiting to update to the latest version until now, but there just wasn’t much to address. WordPress 4.1 was a smooth-sailing release and has seen more than 14 million downloads in the last two months. For a full [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://ma.tt/2015/03/text-as-interface/''>Matt: Text as Interface</a></li><li><a class=''rsswidget'' href=''http://ma.tt/2015/02/watching-television/''>Matt: Watching Television</a></li><li><a class=''rsswidget'' href=''http://ma.tt/2015/02/code-cube/''>Matt: Writing code is like solving a Rubik’s cube</a></li></ul></div><div class="rss-widget"><ul><li class=''dashboard-news-plugin''><span>Popular Plugin:</span> <a href=''https://wordpress.org/plugins/google-analytics-dashboard-for-wp/'' class=''dashboard-news-plugin-link''>Google Analytics Dashboard for WP</a>&nbsp;<span>(<a href=''plugin-install.php?tab=plugin-information&amp;plugin=google-analytics-dashboard-for-wp&amp;_wpnonce=d0334e4fb7&amp;TB_iframe=true&amp;width=600&amp;height=800'' class=''thickbox'' title=''Google Analytics Dashboard for WP''>Install</a>)</span></li></ul></div>', 'no'),
(1832, '_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9', '1425317124', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1833, '_transient_feed_d117b5738fbd35bd8c0391cda1f2b5d9', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:61:"\n	\n	\n	\n	\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:16:"WordPress Planet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:28:"http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:2:"en";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:47:"WordPress Planet - http://planet.wordpress.org/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:50:{i:0;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:23:"Matt: Text as Interface";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44737";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:39:"http://ma.tt/2015/03/text-as-interface/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:212:"<p><a href="http://whoo.ps/2015/02/23/futures-of-text">Great piece by Jonathan Libov on text-based messaging interfaces for everything in the future</a>, it&#8217;s like the command line has come alive again.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 01 Mar 2015 17:11:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Matt: Watching Television";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44735";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"http://ma.tt/2015/02/watching-television/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1403:"<p>It wasn&#8217;t that long ago, in the grand scheme of things, that I didn&#8217;t have any TV shows I was actively watching. Life has been busier than ever, but I&#8217;ve started catching up with shows instead of movies when flying. I&#8217;ve been blown away by the high quality of storytelling  in the medium of television right now.</p>\n<p>So I find myself actively watching a few different shows:</p>\n<ol>\n<li>House of Cards (new season out today!).</li>\n<li>True Detective.</li>\n<li>Scandal.</li>\n<li>Blacklist.</li>\n<li>Empire.</li>\n<li>West Wing.</li>\n</ol>\n<p>There are some guilty pleasures in there, and there are probably a dozen shows that friends have recommended to me as amazing that I&#8217;ve never even started. (Hence West Wing, I&#8217;m watching it for the first time, somewhere in Season 4.)</p>\n<p>This is the first time I&#8217;m watching things that are still &#8220;on&#8221; versus something like Firefly or Sopranos which are complete already. There&#8217;s definitely something fun about discussing the latest developments with other people who are also caught up, in the zeitgeist, and the anticipation of new episodes coming out, like what I imagine it must have been like with <a title="Some of my favorite sci-fi was actually originally published serialized." href="http://en.wikipedia.org/wiki/Serial_%28literature%29">serialized novels back in the day</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 01 Mar 2015 03:43:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:51:"Matt: Writing code is like solving a Rubik’s cube";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44731";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:31:"http://ma.tt/2015/02/code-cube/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:171:"<p>Ben Dwyer on why <a href="https://scruffian.wordpress.com/2013/10/18/writing-code-is-like-solving-a-rubiks-cube/">writing code is like solving a Rubik’s cube</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 28 Feb 2015 04:55:19 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:47:"Post Status: The most popular WordPress plugins";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"https://poststatus.com/?p=8913";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://poststatus.com/popular-wordpress-plugins/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:15391:"<p>WordPress has long had download counts for core WordPress, plugins, and themes.</p>\n<p>But downloads counts are deceiving. They count downloads, but are not representative of actual active installs.</p>\n<p>Recently &#8212; in <a href="https://poststatus.com/notes/time-ditch-download-counts-wordpress-org-get-real-stats/">my Club member newsletter</a> &#8212; I noted that it is past time to get data for actual installs, versus download counts. There is a private beta program on WordPress.org that offers just that, and at least some of the new stats are launching <em>very, very</em> soon (<em><strong>edit</strong>: the initial changes are now live</em>).</p>\n<p>The new plugin stats pages will show four new charts, visible to plugin authors:</p>\n<ul>\n<li>New installs per day</li>\n<li>Updates per day</li>\n<li>Active installs per day</li>\n<li>Active versions</li>\n</ul>\n<p>Most importantly, the &#8220;active installs per day&#8221; chart shows us &#8212; with much greater precision than we previously had &#8212; how many actual websites are running any plugin available on WordPress.org.</p>\n<p>For the beta period, utilizing a non-public query string parameter, I was able to see these stats publicly for any plugin on the repo. That query string parameter has now changed, so the data is no longer publicly visible.</p>\n<p>These stats are partially launching very shortly, to highlight the active installs for plugins as well as the breakdown of active versions. Active install counts will replace the download count in the right column.</p>\n<p>You can see an example of what the new <a href="https://wordpress.org/plugins/wordpress-importer/stats/">public stats from the WordPress Importer plugin</a> look like, which will be visible to users. Plugin authors will see a slightly different view that contains the additional stats:</p>\n<div id="attachment_8952" class="wp-caption aligncenter"><a href="https://poststatus.com/wp-content/uploads/2015/02/wordpress-importer.png"><img class="wp-image-8952 size-large" src="https://poststatus.com/wp-content/uploads/2015/02/wordpress-importer-752x892.png" alt="wordpress-importer" width="752" height="892" /></a><p class="wp-caption-text">Click to view full size</p></div>\n<p>&nbsp;</p>\n<h3>The most popular WordPress plugins</h3>\n<p>I took some time to look through the most popular WordPress plugins I could think of, as well as other notable plugins. What follows are some of the numbers I recorded, which were noted in the charts as being recorded February 24th.</p>\n<p>Once this data goes live, the counts will be revised to round with less detail, and for installs over 1 million, will simply say &#8220;1 Million+&#8221;.</p>\n<table>\n<tbody>\n<tr>\n<th>Plugin</th>\n<th>Downloads</th>\n<th>Active Installs</th>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/contact-form-7/">Contact Form 7</a></td>\n<td>24.304 million</td>\n<td>6.3+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/akismet/">Akismet</a></td>\n<td>28.128 million</td>\n<td>6.2+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/wordpress-seo/">WordPress SEO</a></td>\n<td>15.928 million</td>\n<td>3.7+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/jetpack/">Jetpack</a></td>\n<td>14.587 million</td>\n<td>3.7+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/wordpress-importer/">WordPress Importer</a></td>\n<td>9.635 million</td>\n<td>3.4+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/google-sitemap-generator/">Google Sitemap Generator</a></td>\n<td>16.477 million</td>\n<td>3.4+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/all-in-one-seo-pack/">All In One SEO</a></td>\n<td>21.853 million</td>\n<td>3.1+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/wp-super-cache/">WP Super Cache</a></td>\n<td>6.869 million</td>\n<td>1.7+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/tinymce-advanced/">Tiny MCE Advanced</a></td>\n<td> 4.788 million</td>\n<td>1.4+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/nextgen-gallery/">NextGen Gallery</a></td>\n<td>11.991 million</td>\n<td>1.3+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/google-analytics-for-wordpress/">Google Analytics for WordPress</a></td>\n<td>8.159 million</td>\n<td>1.2+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/woocommerce/">WooCommerce</a></td>\n<td>6.445 million</td>\n<td>1.2+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/hello-dolly/">Hello Dolly</a></td>\n<td>510,136</td>\n<td>1.1+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/wp-pagenavi/">WP Page Navi</a></td>\n<td>5.432 million</td>\n<td>1.1+ million</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/w3-total-cache/">W3 Total Cache</a></td>\n<td>4.491 million</td>\n<td>970,000+</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/wordfence/">WordFence</a></td>\n<td>4.828 million</td>\n<td>710,000+</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/better-wp-security/">Better WP Security</a></td>\n<td>4.259 million</td>\n<td>600,000+</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/wptouch/">WPTouch</a></td>\n<td>6.743 million</td>\n<td>410,000+</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/bbpress/">bbPress</a></td>\n<td>1.741 million</td>\n<td>250,000+</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/wysija-newsletters/">MailPoet</a></td>\n<td>3.447 million</td>\n<td>230,000+</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/the-events-calendar/">The Events Calendar</a></td>\n<td>1.438 million</td>\n<td>230,000+</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/buddypress/">BuddyPress</a></td>\n<td>2.647 million</td>\n<td>150,000+</td>\n</tr>\n<tr>\n<td><a href="https://wordpress.org/plugins/wp-e-commerce/">WP eCommerce</a></td>\n<td>3.009 million</td>\n<td>80,000+</td>\n</tr>\n</tbody>\n</table>\n<p>As you can see, the data is incredibly insightful, especially compared to the public download stats. However, beware that <em>there is not a guarantee of accuracy here</em>, and in fact you should know that in some instances, the team knows the data isn&#8217;t reporting properly, especially for plugins with more installs.</p>\n<p><span class="pullquote alignright">Contact Form 7 and Akismet are by far the most popular WordPress plugins, with over six million active installs each.</span> I included most of the plugins from the <a href="https://wordpress.org/plugins/browse/popular/">Popular page on the repo</a>, plus some additional notable plugins.</p>\n<p>There are also a number of outliers, where the discrepancy between downloads and active installs is huge. I believe this is largely due to plugins with long histories that were once immensely popular but have since faded in popularity.</p>\n<p>The download count keeps old plugins relevant far longer than if active installs were the prominent number.</p>\n<h3>Compared to BuiltWith data</h3>\n<p>How accurate is this data? Well, one smell-test we can give it is to compare it to other potentially inaccurate data. From my research, BuiltWith is doing one of the best jobs around of accurately checking site data. Go ahead and input your domain to BuiltWith and see how accurate it is for you.</p>\n<p>So, if we compare this same plugin list to BuiltWith data for &#8220;the entire Internet&#8221; &#8212; as they segment based on site rankings &#8212; then we can get a feel for how well the WordPress.org number and theBuiltWith number get along.</p>\n<p>In this table, I link to the BuiltWith page so you can get more information if you like. Do note that some plugins aren&#8217;t available on BuiltWith, so are in the list but don&#8217;t have information.</p>\n<table>\n<tbody>\n<tr>\n<th>Plugin</th>\n<th>BuiltWith</th>\n<th>Active Installs</th>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/Contact-Form-7">Contact Form 7</a></td>\n<td>594,677</td>\n<td>6.3+ million</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/Akismet">Akismet</a></td>\n<td>166,791</td>\n<td>6.2+ million</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/Yoast-WordPress-SEO-Plugin">WordPress SEO</a></td>\n<td>2.602 million</td>\n<td>3.7+ million</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/JetPack">Jetpack</a></td>\n<td>1.629 million</td>\n<td>3.7+ million</td>\n</tr>\n<tr>\n<td>WordPress Importer</td>\n<td>n/a</td>\n<td>3.4+ million</td>\n</tr>\n<tr>\n<td>Google Sitemap Generator</td>\n<td>n/a</td>\n<td>3.4+ million</td>\n</tr>\n<tr>\n<td>All In One SEO</td>\n<td>n/a</td>\n<td>3.1+ million</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/WP-Super-Cache">WP Super Cache</a></td>\n<td>991,729</td>\n<td>1.7+ million</td>\n</tr>\n<tr>\n<td>Tiny MCE Advanced</td>\n<td>n/a</td>\n<td>1.4+ million</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/NextGEN-Gallery">NextGen Gallery</a></td>\n<td>977,343</td>\n<td>1.3+ million</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/Yoast-Google-Analytics-for-WordPress">Google Analytics for WordPress</a></td>\n<td>871,144</td>\n<td>1.2+ million</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/shop/WooCommerce">WooCommerce</a></td>\n<td>685,937</td>\n<td>1.2+ million</td>\n</tr>\n<tr>\n<td>Hello Dolly</td>\n<td>n/a</td>\n<td>1.1+ million</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/WP-PageNavi">WP Page Navi</a></td>\n<td>585,809</td>\n<td>1.1+ million</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/W3-Total-Cache">W3 Total Cache</a></td>\n<td>571,864</td>\n<td>970,000+</td>\n</tr>\n<tr>\n<td>WordFence</td>\n<td>n/a</td>\n<td>710,000+</td>\n</tr>\n<tr>\n<td>Better WP Security</td>\n<td>n/a</td>\n<td>600,000+</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/cms/WPTouch-Pro">WPTouch (Pro Data only)</a></td>\n<td>15,696</td>\n<td>410,000+</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/bbPress">bbPress</a></td>\n<td>126,081</td>\n<td>250,000+</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/MailPoet">MailPoet</a></td>\n<td>149,018</td>\n<td>230,000+</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/widgets/The-Events-Calendar">The Events Calendar</a></td>\n<td>56,095</td>\n<td>230,000+</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/cms/BuddyPress">BuddyPress</a></td>\n<td>76,853</td>\n<td>150,000+</td>\n</tr>\n<tr>\n<td><a href="http://trends.builtwith.com/shop/WP-eCommerce">WP eCommerce</a></td>\n<td>58,115</td>\n<td>80,000+</td>\n</tr>\n</tbody>\n</table>\n<h3>Data Accuracy</h3>\n<p>There are zero instances from this list where BuiltWith shows more sites than WordPress.org using a plugin. That is a confidence enhancing note, as WordPress.org should be much more fully comprehensive.</p>\n<p>There are some instances, especially with plugins that are on the backend, or have limited front-end visibility, where the numbers don&#8217;t line up too well.</p>\n<p>However, for the highly visible plugins, the WordPress.org data <em>feels</em> good to me, in comparison to BuiltWith.</p>\n<p>The team working on the new stats has less confidence in the numbers as the numbers get higher. So for plugins with well beyond a million installs, they have reason to believe adoption may be different than what is reflected in the stats.</p>\n<h3>How stats are collected</h3>\n<p>WordPress.org collects this data via the update checks that a WordPress install performs.</p>\n<p>There are a couple of caveats to consider for the WordPress.org data:</p>\n<ul>\n<li>The numbers could include (and therefore inflate numbers) non-public (dev and staging environments) domains. According to Andrew Nacin, the team does exclude sites with &#8220;localhost&#8221;, &#8220;.dev&#8221;, &#8220;.local&#8221; and &#8220;other telltale signs of local development and staging sites, like IP addresses.&#8221;</li>\n<li>The numbers don&#8217;t include websites that have, via code, turned off update checks.</li>\n<li>Some data is making more sense as it is collected. Now that it&#8217;s a few months old, they are able to make better determinations about what is accurate and what is not.</li>\n</ul>\n<p>Keep in mind the percentage of installs that wouldn&#8217;t be included in these checks is minimal. Also, unfortunately, a large percentage of folks just don&#8217;t keep dev or local installs of their websites, so those numbers probably do not inflate the totals as much as you may think either &#8212; though I&#8217;m guessing on that front.</p>\n<p>For the accuracy of the numbers, the team has seen some discrepancies, where one graph shows data that should also impact another, but it does not. They&#8217;re working to resolve these issues still.</p>\n<h3>This data is important</h3>\n<p>The team working on this project has been deciding on which stats pages to showcase for the general public, and which to show to plugin authors.</p>\n<p>The active install data is important, and it needs to be public for users, in addition to plugin authors. <span class="pullquote alignright">If we can ensure that the data is even remotely accurate, it is far superior to using download counts alone.</span></p>\n<p>Download counts give legacy plugins too much clout in the repo, and also make misinformation all the more likely.</p>\n<p>A prime example is that of Slimstats, which had the recent security breach. That plugin has over 1.3 million downloads. But when I looked at the stats, there were only 100,000 or so active installs.</p>\n<p>Yet, when tech blogs covered the security breach of the plugin, they largely cited &#8220;over a million&#8221; installs at risk. This is bad for WordPress and it&#8217;s unnecessary. We can fix it. <em>We have the data</em>.</p>\n<p>Lead developer Dion Hulse also had this to say about the progress of the stats pages, when I notified him that I had access to these numbers:</p>\n<blockquote>\n<p class="p1"><span class="s1">The current beta stats page was put together as a trial to find what data plugin authors wanted (We&#8217;ve been in touch with a few who have provided great feedback in the past on the stats).</span></p>\n</blockquote>\n<p>Based on what they have learned, they are launching the active install numbers and active version chart, and will follow up with a future launch for the plugin author only stats. The plugin author stats are going to go live with the notice that they may not be totally accurate, and they may change over time as the team continues to analyze the data.</p>\n<p>WordPress is open source, and has absolutely massive adoption across the web, as we all know. It is therefore a source for what&#8217;s become a multi-billion dollar industry. WordPress.org and those that hold the keys to the website have great power.</p>\n<p>Changes to the website and how themes, plugins, and any other potentially business-centric data make a difference to real businesses.</p>\n<p>All those businesses have signed up for this (being involved with the WordPress project), and therefore any risks associated, but in my mind this data &#8212; especially of active installs &#8212; brings welcome sunlight to a murky plugin landscape.</p>\n<p>I&#8217;m glad I was able to see this data. I&#8217;m very pleased that the active install numbers are replacing the download counts. WordPress itself will be better for it.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 28 Feb 2015 02:38:12 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:64:"WPTavern: Time To Abolish Metaboxes in The WordPress Post Editor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39792";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:74:"http://wptavern.com/time-to-abolish-metaboxes-in-the-wordpress-post-editor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3615:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/WPMetaBoxesFeaturedImage.png" rel="prettyphoto[39792]"><img class="size-full wp-image-39793" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/WPMetaBoxesFeaturedImage.png?resize=640%2C300" alt="WP Metabox Featured Image" /></a>photo credit: <a href="http://www.flickr.com/photos/66992990@N00/6532917427">packing up</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>I&#8217;ve used WordPress to write about WordPress for more than seven years, it&#8217;s how I make a living. Recently though, writing in WordPress feels more like being a data entry specialist. I guess in some ways, it&#8217;s not surprising considering that&#8217;s exactly what I&#8217;m doing.</p>\n<p>The post editor is more or less a pretty user interface that enables me to add data to a database. I think the feeling is stronger if you write in WordPress every day as it&#8217;s an endless cycle of filling in text areas, fields, uploading media, and clicking the publish button. Many of these tasks take place within their own metabox which is something that detracts from a seamless experience. I don&#8217;t know about you, but I&#8217;m ready to try something different.</p>\n<p>Many of the posts I write post consists of content blocks such as: blockquotes, media, etc. Thinking about how I create content in WordPress, the conceptual post editor <a title="https://make.wordpress.org/design/2013/08/08/proposal-improving-the-content-editing-experience/" href="https://make.wordpress.org/design/2013/08/08/proposal-improving-the-content-editing-experience/">proposed in 2013</a> makes complete sense. Instead of a full-blown TinyMCE editor, I could select from a set of established content blocks. In addition to the content block idea, some of the metaboxes are integrated into the editor.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2013/08/ContentEditingProposal.png" rel="prettyphoto[39792]"><img class="size-full wp-image-8380" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2013/08/ContentEditingProposal.png?resize=1025%2C825" alt="ContentEditingProposal" /></a>Proposal To Revamp The Post Writing/Editing Interface\n<p>The publish, categories, and tags metaboxes are integrated into the editor. It probably wouldn&#8217;t take too much effort to add a way to feature an image. I don&#8217;t know how usable this interface is, but I&#8217;d love to give it a try for a few months. The more metaboxes that disappear, the less I feel like I&#8217;m hitting switches and turning knobs before clicking the publish button. By having some of these tasks integrated into the editor, I think it&#8217;ll provide a better publishing experience.</p>\n<p>I probably wouldn&#8217;t be able to get rid of all the metaboxes because of the plugins I use. However, I&#8217;m most interested in an interface that consists of less scrolling, searching, etc., that gets me to the publishing stage quicker without feeling like a data entry specialist.</p>\n<p>Despite a large amount of discussion surrounding the proposal, the <a title="https://make.wordpress.org/design/2013/08/08/proposal-improving-the-content-editing-experience/" href="https://make.wordpress.org/design/2013/08/08/proposal-improving-the-content-editing-experience/">concept lost steam</a>. Although I&#8217;ve never used it, I feel like I&#8217;d prefer it over the current editor. It&#8217;s anyone&#8217;s guess if we&#8217;ll ever see the post editor undergo a major change, but if it did, this is the direction I&#8217;d like to see it go.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 28 Feb 2015 02:28:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:94:"WPTavern: SIDEKICK Adds Support For WordPress Multisite, Launches Partnership With MediaTemple";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39720";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:103:"http://wptavern.com/sidekick-adds-support-for-wordpress-multisite-launches-partnership-with-mediatemple";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6344:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/01/SIDEKICKFeaturedImage.png" rel="prettyphoto[39720]"><img class="aligncenter size-full wp-image-37436" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/01/SIDEKICKFeaturedImage.png?resize=769%2C227" alt="SIDEKICKFeaturedImage" /></a></p>\n<p>SIDEKICK has <a title="http://www.sidekick.pro/blog/multisite-genesis-media-temple-oh-my/" href="http://www.sidekick.pro/blog/multisite-genesis-media-temple-oh-my/">announced</a> that its voice-guided <a title="https://wordpress.org/plugins/sidekick/" href="https://wordpress.org/plugins/sidekick/">WordPress </a><a title="https://wordpress.org/plugins/sidekick/" href="https://wordpress.org/plugins/sidekick/">training</a><a title="https://wordpress.org/plugins/sidekick/" href="https://wordpress.org/plugins/sidekick/"> video plugin</a> now supports WordPress Multisite. According to SIDEKICK Co-founder, Ben Fox, WordPress Multisite has been one of the most requested features from users. Users can now:</p>\n<ol>\n<li>Easily auto activate your SIDEKICK license across all sites on your network</li>\n<li>Set a Walkthrough to auto-start the first time a new user logs into any site on your network</li>\n<li>Enable and disable walkthroughs and walkthrough categories network wide from one screen</li>\n</ol>\n<p>SIDEKICK has a <a title="http://support.sidekick.pro/article/101-sidekick-for-wordpress-multisite" href="http://support.sidekick.pro/article/101-sidekick-for-wordpress-multisite">support article</a> that goes into more detail on how to activate Multisite.</p>\n<h2>Challenges Encountered</h2>\n<p>SIDEKICK&#8217;s Chief of Technology and Product Development, Bart Dabek, describes the most challenging aspect they encountered adding Multisite support, &#8220;The biggest challenge was incorporating our API and building out the relationship between the super admin setup page and individual sites. Once that relationship was established, it was easy to pull in settings from the network settings and assign them to individual sites.&#8221;</p>\n<p>&#8220;Some things to keep in mind with our particular situation is, keeping authentication details within the super admin account so that if our sessions expire, the system can automatically log back into our API and continue to auto activate SIDEKICK on new sites without the need for the super admin to do anything. It&#8217;s something developers will have to consider if they&#8217;re dealing with an API on this level,&#8221; Dabek said.</p>\n<h2>Free Genesis Walkthroughs</h2>\n<p>If you use SIDEKICK with the Genesis Framework by <a title="http://www.studiopress.com/" href="http://www.studiopress.com/">StudioPress</a>, you&#8217;ll see 30 free Genesis walkthroughs. As long as you&#8217;re using a Genesis powered theme, you&#8217;ll see the videos appear in the SIDEKICK drawer. The walkthroughs were <a title="http://www.web-savvy-marketing.com/2015/02/genesis-walkthroughs/" href="http://www.web-savvy-marketing.com/2015/02/genesis-walkthroughs/">created by Web Savvy Marketing</a>, a WordPress development agency that specializes in Genesis themes.</p>\n<h2>MediaTemple Learns From GoDaddy&#8217;s Mistake</h2>\n<p>The <a title="http://www.sidekick.pro/plans/wordpress-basics/" href="http://www.sidekick.pro/plans/wordpress-basics/">basic student plan</a> offered by SIDEKICK priced at $5 per month, is available for free to MediaTemple customers. In addition to 30 Genesis walkthroughs,  customers gain access to 160+ WordPress walkthroughs. We&#8217;ve received a few reports from readers that SIDEKICK has been activated on every site on MediaTemple without an opt-in notice, similar to what happened to <a title="http://wptavern.com/without-notifying-customers-godaddy-and-mediatemple-auto-activate-sidekick" href="http://wptavern.com/without-notifying-customers-godaddy-and-mediatemple-auto-activate-sidekick">GoDaddy customers late in 2014</a>. However, this isn&#8217;t the case.</p>\n<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/MTSidekickEmail.png" rel="prettyphoto[39720]"><img class="size-full wp-image-39772" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/MTSidekickEmail.png?resize=853%2C752" alt="Email send to MediaTemple Customers about SIDEKICK" /></a>Email send to MediaTemple Customers about SIDEKICK\n<p>MediaTemple emailed customers on February 23rd announcing the partnership and included directions on how to activate the plugin. It appears as though the company learned from <a title="http://wptavern.com/without-notifying-customers-godaddy-and-mediatemple-auto-activate-sidekick" href="http://wptavern.com/without-notifying-customers-godaddy-and-mediatemple-auto-activate-sidekick">GoDaddy&#8217;s mistake</a>.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/MTTurnOnSidekick.png" rel="prettyphoto[39720]"><img class="size-full wp-image-39773" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/MTTurnOnSidekick.png?resize=624%2C308" alt="How to turn on SIDEKICK" /></a>How to turn on SIDEKICK\n<p>Around the same time the email went out to customers, the company sent out a press release to the media with the same information.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/MediaTempleSidekickPressRelease.png" rel="prettyphoto[39720]"><img class="size-full wp-image-39782" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/MediaTempleSidekickPressRelease.png?resize=945%2C473" alt="MediaTemple SIDEKICK press release" /></a>MediaTemple SIDEKICK press release\n<p>Multisite support gives network administrators the ability to easily provide access to an educational tool. Through strategic partnerships with SIDEKICK, MediaTemple, and GoDaddy, customers have an easy way to learn the ins and outs of WordPress.</p>\n<p>While some <a title="http://wptavern.com/without-notifying-customers-godaddy-and-mediatemple-auto-activate-sidekick#comment-62200" href="http://wptavern.com/without-notifying-customers-godaddy-and-mediatemple-auto-activate-sidekick#comment-62200">don&#8217;t like the approach</a> taken by SIDEKICK, it&#8217;s another option to those who find it difficult to use the <a title="http://codex.wordpress.org/Main_Page" href="http://codex.wordpress.org/Main_Page">WordPress Codex</a> or other educational resources.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 28 Feb 2015 00:42:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:57:"WPTavern: Clean Up WordPress with the New WP-Sweep Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://wptavern.com/clean-up-wordpress-with-the-new-wp-sweep-plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4395:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/clean-up.jpg" rel="prettyphoto[39753]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/clean-up.jpg?resize=1024%2C513" alt="clean-up" class="aligncenter size-full wp-image-39755" /></a></p>\n<p>After years of creating new content, changing themes, and adding and removing plugins, a WordPress installation can become littered with unused, orphaned, and duplicated data. Not every plugin properly extricates itself and its data from your site when you uninstall.</p>\n<p><a href="https://profiles.wordpress.org/gamerz/" target="_blank">Lester Chan</a>&#8216;s new <a href="https://wordpress.org/plugins/wp-sweep/" target="_blank">WP Sweep</a> plugin was designed to perform housekeeping on WordPress installations. Chan is a prolific plugin developer, who created his first plugin in 2003 shortly after WordPress was forked from b2. He now has 24+ plugins listed in directory.</p>\n<p>WP-Sweep&#8217;s distinguishing characteristic is that it uses proper WordPress delete functions as much as possible instead of running direct delete MySQL queries. This method is in direct contrast to similarly purposed plugins such as <a href="https://wordpress.org/plugins/wp-optimize/" target="_blank">WP-Optimize</a>, which has been downloaded more than 1.5 million times.</p>\n<blockquote class="twitter-tweet" width="550"><p>Looking through WP-Optimize and they are using SQL query to delete post revisions which means there will be orphaned data left behind.</p>\n<p>&mdash; Lester Chan (@gamerz) <a href="https://twitter.com/gamerz/status/569742401398386688">February 23, 2015</a></p></blockquote>\n<p></p>\n<h3>What can WP-Sweep clean?</h3>\n<p>WP-Sweep uses WordPress delete functions, such as <code>wp_delete_post_revision()</code>, <code>delete_post_meta()</code>, <code>wp_delete_comment()</code>, etc. to clean up the database. It can perform sweeps of all of the following:</p>\n<ul>\n<li>Revisions</li>\n<li>Auto drafts</li>\n<li>Deleted comments</li>\n<li>Unapproved comments</li>\n<li>Spammed comments</li>\n<li>Deleted comments</li>\n<li>Orphaned post meta</li>\n<li>Orphaned comment meta</li>\n<li>Orphaned user meta</li>\n<li>Orphan term relationships</li>\n<li>Unused terms</li>\n<li>Duplicated post meta</li>\n<li>Duplicated comment meta</li>\n<li>Duplicated user meta</li>\n<li>Transient options</li>\n</ul>\n<p>WP-Sweep can be found under the tools menu after you install it. It will give you a full overview of items that can be cleaned up.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/wp-sweep.jpg" rel="prettyphoto[39753]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/wp-sweep.jpg?resize=884%2C494" alt="wp-sweep" class="aligncenter size-full wp-image-39771" /></a></p>\n<p>Scroll further down and you&#8217;ll see reports for comments, users, terms, and options. Certain sweeps have extra instructions to consider before using, i.e unused terms: <em>&#8220;Note that some unused terms might belong to draft posts that have not been published yet. Only sweep this when you do not have any draft posts.&#8221;</em></p>\n<p>One user tested the plugin and <a href="https://twitter.com/slaFFik/status/570536799333961728" target="_blank">reported</a> a savings of 23.5% on database size. He also reported a bug, which Chan promptly <a href="https://github.com/lesterchan/wp-sweep/issues/1" target="_blank">fixed</a>.</p>\n<blockquote class="twitter-tweet" width="550"><p><a href="https://twitter.com/gamerz">@gamerz</a> plugin saved me 23,5% of a database size. But not everything works as expected: <a href="https://t.co/UeiDedH7Yd">https://t.co/UeiDedH7Yd</a></p>\n<p>&mdash; Slava UA (@slaFFik) <a href="https://twitter.com/slaFFik/status/570536799333961728">February 25, 2015</a></p></blockquote>\n<p></p>\n<p>Chan plans to continue to develop the plugin and is <a href="https://twitter.com/gamerz/status/570902672636645376" target="_blank">considering adding unused options</a> to the sweeps in a future version. If you want to use the plugin to clean up your website, you are strongly advised to make a backup of your database first, as the actions it performs are irreversible. Check out <a href="https://wordpress.org/plugins/wp-sweep/changelog/" target="_blank">WP-Sweep on WordPress.org</a> and favorite it for the next time you need to do some database housekeeping.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 Feb 2015 22:03:08 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:83:"WPTavern: WordPress Theme Review Handbook Updated to Include Design Recommendations";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39716";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:93:"http://wptavern.com/wordpress-theme-review-handbook-updated-to-include-design-recommendations";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4690:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/design-studio.jpg" rel="prettyphoto[39716]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/design-studio.jpg?resize=760%2C374" alt="photo credit: Artist''s Room - (license)" class="size-full wp-image-39730" /></a>photo credit: <a href="http://www.flickr.com/photos/63191453@N00/2650862549">Artist&#8217;s Room</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>The <a href="http://wptavern.com/wordpress-theme-directory-launches-new-design" target="_blank">new design of the WordPress Theme Directory</a> is a welcome change on WordPress.org. Faster browsing and filtering means users can more easily sort through the thousands of available options. While the directory includes many beautiful, high quality themes, it often requires sifting through hundreds to find that diamond in the rough.</p>\n<p>One of the reasons for the glut of lackluster and uninspired new theme submissions is a lack of design feedback from the Theme Review team. Reviews have traditionally focused primarily on the code quality of themes and often neglect major design issues with new submissions.</p>\n<p>During the team&#8217;s <a href="https://make.wordpress.org/themes/2015/02/27/this-weeks-a-little-late-meeting-notes-we/" target="_blank">meeting</a> this week, contributors discussed ways to encourage more design feedback on submissions to the directory. WordPress.org theme author <a href="https://twitter.com/ryelle" target="_blank">Kelly Dwan</a> broached the topic in a recent <a href="https://redradar.net/2015/02/23/1612/" target="_blank">post</a> about ways to get designers involved during the review process:</p>\n<blockquote><p>If we tell people that they don’t need to be expert developers to review themes, and that this is a good way to learn better coding practices, why don’t we do the same with design? Good design is just as subjective as code standards (in that the basics aren&#8217;t, but people like to argue about it anyway).</p>\n<p>The quality of code in the theme repo is improved by the review process, so we should encourage design reviews to increase the quality of design, too.</p></blockquote>\n<p>Her post included practical suggestions for updating the theme review handbook to provide better guidance on how to offer design feedback. This is one way that designers can contribute on WordPress.org, even if they&#8217;re not comfortable helping with the code review aspect of the process.</p>\n<h3>New Design Recommendation Added to the Handbook</h3>\n<p><a href="https://twitter.com/melchoyce" target="_blank">Mel Choyce</a>, Design Engineer at Automattic, volunteered to start filling out the <a href="https://make.wordpress.org/themes/handbook/review/recommended/design/" target="_blank">design section of the Theme Review Handbook</a> with recommendations. &#8220;Theme authors are never exposed to design guidelines before uploading their themes, unlike code guidelines,&#8221; she said. This is something the team is currently working to change.</p>\n<p>The design recommendations so far are formatted to help the theme author think more critically about design decisions. Instead of taking a hard line about subjective aspects of design, the recommendations invite the designer to consider the theme from a user&#8217;s perspective. A few examples include:</p>\n<ul>\n<li>Can you tell if the theme has an ideal audience in mind?</li>\n<li>Is the type large enough to comfortably read?</li>\n<li>Body text should generally be 14px or larger on desktop, unless using a font with a generous x-height.</li>\n<li>Are the header and body fonts easy to read?</li>\n<li>Is there enough difference between headers and paragraphs to distinguish them from each other?</li>\n<li>Do paragraphs have enough line-height? If you squint your eyes, can you still see some space between lines?</li>\n<li>A good rule of thumb is 1.3-1.4 on headers, and 1.4-1.6 on body text.</li>\n<li>Is the color contrast high enough? Is the type readable against its background?</li>\n<li>Do the details (drop shadows, gradients, etc.) distract at all from the content?</li>\n</ul>\n<p>Encouraging more design feedback is difficult without offering reviewers the tools to so with confidence. The art of offering design feedback is tricky and it requires diplomacy to do it in a way that doesn&#8217;t crush the spirit of a fledgling theme author.</p>\n<p>A basic set of guidelines is a valuable resource that team members can refer to during the review process. If theme authors are open to the recommendations, the quality of their designs can be significantly improved for future submissions.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 Feb 2015 20:52:35 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:55:"WPTavern: WordPress Theme Directory Launches New Design";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39691";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:65:"http://wptavern.com/wordpress-theme-directory-launches-new-design";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2719:"<p>The new design for the official <a href="https://wordpress.org/themes/" target="_blank">WordPress Theme Directory</a> is live today. Contributors on the <a href="https://make.wordpress.org/meta/" target="_blank">WordPress Meta team</a> released a <a href="http://wptavern.com/preview-the-new-design-for-the-wordpress-themes-directory" target="_blank">preview of the design</a> in early January and worked quickly over the past month to resolve any outstanding issues related to the new plugin that powers the directory.</p>\n<p>In addition to an updated design, the theme repository has been moved away from bbPress and into a new plugin, which includes a custom post type for the repository package and a theme uploader.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/wordpress-theme-directory.png" rel="prettyphoto[39691]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/wordpress-theme-directory.png?resize=1025%2C750" alt="wordpress-theme-directory" class="aligncenter size-full wp-image-39692" /></a></p>\n<p>The design is likely already familiar to most users, as it was matched to the UI to the admin themes browser. Now, whether you&#8217;re behind the wheel of your WordPress site in the admin, or browsing on the official directory, the experience of searching and sorting themes is more consistent.</p>\n<p>Konstantin Obenland, in cooperation with Samuel &#8220;Otto&#8221; Wood, spearheaded the migration to the new plugin and design, with help and feedback from other members of the meta team. The work is not yet complete, but the new directory provides a vastly improved experience for users on the hunt for a new theme. Searching and filtering are both faster and users can quickly browse through thumbnails of all the queried results via infinite scroll.</p>\n<p>Future internationalization improvements to the directory should make it an even better resource for WordPress&#8217; growing global audience.</p>\n<p>&#8220;There is still a lot more work to be done, but everything that’s remaining can be added, changed, or improved with the new directory active,&#8221; Obenland said in an update earlier this week. <strong>&#8220;Most importantly we want to make it available to language sites, so that we have an internationalized theme directory, and there will be more to be done around that.&#8221;</strong></p>\n<p>The improved browsing experience does a much better job of showcasing the work of theme authors, many of whom spend countless hours updating and supporting their free themes as a contribution to the WordPress community. Overall, the new design is a better representation of the high quality themes available in the official directory.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 27 Feb 2015 01:58:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:52:"WPTavern: Add Infinite Scroll to the WordPress Admin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39320";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://wptavern.com/add-infinite-scroll-to-the-wordpress-admin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3059:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/infinite.jpg" rel="prettyphoto[39320]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/infinite.jpg?resize=1024%2C508" alt="photo credit: தேவையில்லை காரணங்கள், நீ எங்கே? - (license)" class="size-full wp-image-39685" /></a>photo credit: <a href="http://www.flickr.com/photos/25066200@N02/8659691170">தேவையில்லை காரணங்கள், நீ எங்கே?</a> &#8211; <a href="https://creativecommons.org/licenses/by/2.0/">(license)</a>\n<p>The WordPress admin list tables can get quite lengthy to browse if you&#8217;re relying on regular pagination, especially when you need to perform bulk actions.</p>\n<p>As of WordPress 4.0, the grid view of the media library has beautiful support for infinite scrolling, but list tables for posts and users still rely on old-fashioned pagination. Setting the screen options to include more listings can help, but this, too, can become cumbersome.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/screen-options.jpg" rel="prettyphoto[39320]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/screen-options.jpg?resize=782%2C277" alt="screen-options" class="aligncenter size-full wp-image-39669" /></a></p>\n<p><a href="https://github.com/cedaro/infinite-wp-list-tables" target="_blank">Infinite WP List Tables</a> is a new plugin created by WordPress developer <a href="https://twitter.com/bradyvercher" target="_blank">Brady Vercher</a>. It&#8217;s a simple extension that adds infinite scroll to several pages within the admin, i.e. posts and users. Infinite WP List Tables has no settings to configure &#8211; simply activate it and it&#8217;s working.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/infinitewp-list-tables.jpg" rel="prettyphoto[39320]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/infinitewp-list-tables.jpg?resize=731%2C562" alt="infinitewp-list-tables" class="aligncenter size-full wp-image-39677" /></a></p>\n<p>I tested the plugin both on a single site and on a multisite installation with thousands of sites and users. In both scenarios the plugin performed nicely to infinitely scroll admin list tables for sites, posts, and users.</p>\n<p>It does not seem to work with comments, nor does it work with third party plugin tables such as the BuddyPress activity and groups admin listings. Integrations for plugins that display products, portfolio items, quotes, or other listings in the admin would make it even more useful, but I can see why Vercher might want to limit the plugin to core admin list tables.</p>\n<p>Do you think something like this should be added to core, given that the media library works nicely with infinite scroll? As far as I&#8217;ve seen, no tickets currently exist on trac to propose infinite scroll for other areas of the admin. Do you prefer traditional pagination for sites, posts, users, and comment list tables?</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Feb 2015 23:05:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Matt: Net Neutrality Win";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44728";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://ma.tt/2015/02/net-neutrality-win/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:355:"<p>A lot of the tech news I&#8217;ve linked here has been a bit of a downer, but today we can celebrate: <a href="http://arstechnica.com/business/2015/02/fcc-votes-for-net-neutrality-a-ban-on-paid-fast-lanes-and-title-ii/">FCC votes for net neutrality, a ban on paid fast lanes, and Title II</a>. This is not an outcome I would have bet on a year ago.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Feb 2015 21:17:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:77:"WPTavern: Twitter’s New Official WordPress Plugin Prioritizes Extensibility";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39608";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:84:"http://wptavern.com/twitters-new-official-wordpress-plugin-prioritizes-extensibility";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6064:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/twitter.jpg" rel="prettyphoto[39608]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/twitter.jpg?resize=772%2C350" alt="twitter" class="aligncenter size-full wp-image-39647" /></a></p>\n<p>It&#8217;s easy to get overwhelmed when visiting the WordPress.org plugin directory in search of a Twitter plugin, as you&#8217;ll turn up <a href="https://wordpress.org/plugins/search.php?q=twitter" target="_blank">more than 3,000 Twitter-related extensions</a>. Unless you&#8217;re running on recommendations or personal experience, it may not be easy to narrow down a quality plugin that keeps pace with changes to the Twitter API.</p>\n<p>This week Twitter finally decided to <a href="https://dev.twitter.com/web/wordpress" target="_blank">release an official WordPress plugin</a> to assist users in optimizing their sites for a Twitter audience. I spoke with <a href="https://twitter.com/niall" target="_blank">Niall Kennedy</a>, Developer Advocate at Twitter and contributor on its official WordPress plugin, about Twitter&#8217;s plans for the plugin. Kennedy is also listed as a contributor on both the official <a href="https://wordpress.org/plugins/facebook/" target="_blank">Facebook</a> and <a href="https://wordpress.org/plugins/vine/" target="_blank">Vine</a> plugins for WordPress.</p>\n<p>&#8220;Twitter regularly works with partners to implement Twitter features on their site,&#8221; Kennedy said. <strong>&#8220;Shipping an official plugin allows us to directly support publishers powered by WordPress and provide an example implementation of Twitter best practices for publishers on any platform.&#8221;</strong></p>\n<p>The plugin requires PHP 5.4 or later and offers many features that you many have already seen available via other extensions, including customization of embedded tweets, embedded Twitter videos, Tweet button for sharing content, Twitter Cards, integration with Twitter Analytics, a Follow button, and ads conversion tracking.</p>\n<p>Many are wondering why anyone needs an official Twitter plugin, given that WordPress already has excellent oEmbed support for tweets.  Kennedy confirmed that the new plugin plays nicely with the built-in oEmbed support, while building on top of it:</p>\n<blockquote><p>The Twitter plugin for WordPress enhances the oEmbed support built-in to WordPress with additional customization and functionality. We enhance the typical oEmbed response with additional integrations with WordPress APIs.</p>\n<p>Our plugin loads Twitter&#8217;s widgets JavaScript asynchronously through <code>wp_enqueue_script</code>, omitting the script element typically inserted onto the page markup through the default oEmbed response.</p>\n<p>Each embedded Tweet, added through a URL or shortcode, passes through the shortcode&#8217;s filter (<code>shortcode_atts_tweet</code>) for customization of embedded Tweet features across the site. The plugin handles fetching the correct oEmbed markup from Twitter&#8217;s servers and caching the unique result for the customization.</p>\n<p>The plugin does not change MCE oEmbed handling in the admin view.</p></blockquote>\n<p>Kennedy declined to comment on why it took Twitter so long to release an official plugin, but hopes that WordPress developers will use it as a building block. Those who previously created Twitter plugins now have a solid example for how best to extend WordPress to customize Twitter&#8217;s latest features.</p>\n<h3>Designed to be Extensibile</h3>\n<p>The development team behind the plugin plans to add new features to it as they become available from Twitter. They recognize that it will not be realistic to offer every imaginable feature, but instead are prioritizing extensibility to make sure developers can easily create their own customizations.</p>\n<p>&#8220;The plugin includes <a href="https://dev.twitter.com/web/embedded-video" target="_blank">support for displaying Twitter-hosted video embeds</a>, a new feature available to Twitter developers just in the past few weeks,&#8221; Kennedy said. &#8220;An official Twitter plugin makes it easy to roll out new features to publishers.</p>\n<p>&#8220;<span class="pullquote alignleft">We&#8217;re working with other plugin developers to integrate features through filters where any overlap may occur</span>,&#8221; he said. Kennedy has a few ideas for the kinds of integrations that developers might want to build for the plugin using the WordPress APIs.</p>\n<p>&#8220;Our plugin automatically generates Twitter Card markup to represent a post, making some best guesses for post formats built-in to Core,&#8221; he said. &#8220;We expect plugin developers creating more specific display experiences will be able to build on top of our base features to select the best Twitter Cards template for their content.&#8221;</p>\n<p>Kennedy also believes the plugin can be further extended by SEO plugins to optimize content. &#8220;Some of the most popular WordPress plugins involve SEO,&#8221; he said. &#8220;We would like to integrate with SEO plugins to highlight the best titles, descriptions, and other detailed data provided by publishers to help their content stand out on Twitter.&#8221;</p>\n<p>Additionally, he sees an opportunity for theme developers to make tweets a seamless part of a theme&#8217;s overall design. &#8220;Our embedded Tweet theming can be customized by theme authors to match the visual theme of their site,&#8221; Kennedy said. &#8220;Automatically adjusting Twitter theming components to a WordPress theme context would be pretty cool.&#8221;</p>\n<p>If you&#8217;re looking to add the most common Twitter features to your WordPress site, you&#8217;ll be hard pressed to find a better plugin than the <a href="https://wordpress.org/plugins/twitter/" target="_blank">official one on WordPress.org</a>. Kennedy confirmed that Twitter plans to support the plugin through its official support forums on WordPress.org and will also have an escalated support channel for managed hosting providers.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Feb 2015 20:10:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:64:"WPTavern: WPWeekly Episode 181 – Sticky Posts and Legal Issues";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=39625&preview_id=39625";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:70:"http://wptavern.com/wpweekly-episode-181-sticky-posts-and-legal-issues";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3804:"<p>In this episode of WordPress Weekly, <a title="http://marcuscouch.com/" href="http://marcuscouch.com/">Marcus Couch</a> and I take the opportunity to catch up on the latest news in the WordPress community. I share the results of our poll asking readers if they use sticky posts in WordPress. We discuss the pros and cons of content protection plugins, in which there are no pros. Marcus and I agree that the visual editor added to the latest version of the WordPress for iOS app is a nice addition. Last but not least, we run down a list of upcoming WordCamps.</p>\n<h2>Stories Discussed:</h2>\n<p><a title="http://wptavern.com/do-you-use-the-sticky-posts-feature-in-wordpress" href="http://wptavern.com/do-you-use-the-sticky-posts-feature-in-wordpress">Do You Use The Sticky Posts Feature in WordPress?</a><br />\n<a title="http://wptavern.com/content-protection-plugins-for-wordpress-do-more-harm-than-good" href="http://wptavern.com/content-protection-plugins-for-wordpress-do-more-harm-than-good">Content Protection Plugins for WordPress Do More Harm Than Good</a><br />\n<a title="http://wptavern.com/press-this-bookmarklet-generates-concerns-of-copyright-infringement" href="http://wptavern.com/press-this-bookmarklet-generates-concerns-of-copyright-infringement">Press This Bookmarklet Generates Concerns of Copyright Infringement</a><br />\n<a title="http://wptavern.com/wordpress-for-ios-4-8-released-adds-visual-editor" href="http://wptavern.com/wordpress-for-ios-4-8-released-adds-visual-editor">WordPress for iOS 4.8 Released, Adds Visual Editor</a><br />\n<a title="http://wptavern.com/high-risk-security-vulnerability-discovered-in-wp-slimstat-update-immediately" href="http://wptavern.com/high-risk-security-vulnerability-discovered-in-wp-slimstat-update-immediately">High Risk Security Vulnerability Discovered in WP Slimstat, Update Immediately</a><br />\n<a title="https://poststatus.com/twitter-official-plugin-for-wordpress/" href="https://poststatus.com/twitter-official-plugin-for-wordpress/">Twitter Releases Official WordPress Plugin</a><br />\n<a title="https://story.am/" href="https://story.am/">Story.am Launches to Founders</a><br />\n<a title="http://central.wordcamp.org/schedule/" href="http://central.wordcamp.org/schedule/">Upcoming WordCamps Schedule</a></p>\n<h2>Plugins Picked By Marcus:</h2>\n<p><a title="https://wordpress.org/plugins/woocommerce-role-based-price/" href="https://wordpress.org/plugins/woocommerce-role-based-price/">Woo Commerce Role Based Price</a> extends the popular eCommerce plugin Woo Commerce, so that products can be offered at different prices for different customer groups.</p>\n<p><a title="https://wordpress.org/plugins/better-code-editor/" href="https://wordpress.org/plugins/better-code-editor/">Better Code Editor</a> adds line numbers, error detection, and a choice of 28 different themes to use in the Plugin and Theme editors.</p>\n<p><a title="https://wordpress.org/plugins/wprecovery/" href="https://wordpress.org/plugins/wprecovery/">WPRecovery</a> is a WordPress recovery manager, that will get your WordPress Site back up and running if it stops working correctly.</p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, March 4th 9:30 P.M. Eastern</p>\n<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>\n<p><strong>Listen To Episode #181:</strong><br />\n</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Feb 2015 08:41:55 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Matt: Matt Report Podcast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44723";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"http://ma.tt/2015/02/matt-report-podcast/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:254:"<p>As a good follow-up to the <a href="http://fourhourworkweek.com/2015/02/09/matt-mullenweg/">podcast with Tim the other week</a>, I did a <a href="https://mattreport.com/interview-matt-mullenweg/">podcast with Matt Medeiros of the Matt Report</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Feb 2015 07:48:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:70:"WPTavern: Plugins on WordPress.org Now Show More Accurate Ratings Data";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39605";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"http://wptavern.com/plugins-on-wordpress-org-now-show-more-accurate-ratings-data";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3951:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/RatingsFeaturedImage.png" rel="prettyphoto[39605]"><img class="size-full wp-image-39611" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/RatingsFeaturedImage.png?resize=641%2C331" alt="Ratings Featured Image" /></a>photo credit: <a href="http://www.flickr.com/photos/9555503@N07/5096020716">Rating</a> &#8211; <a href="https://creativecommons.org/licenses/by-sa/2.0/">(license)</a>\n<p>Those who host plugins in the <a title="https://wordpress.org/plugins/" href="https://wordpress.org/plugins/">WordPress plugin directory</a> may have noticed a change to their plugin&#8217;s ratings. That&#8217;s because the ratings system has been reset and rebuilt by Samuel &#8220;Otto&#8221; Wood. The ratings now correspond exactly with reviews. According to Wood, the change has been two and a half years in the making:</p>\n<blockquote><p>Back when we launched the review system 2.5 years ago, we tied ratings to reviews. However, up until that point, we had existing ratings in the system. At the time, some argued that the ratings should be wiped out and everybody start fresh. I argued for the opposite, that we should leave the existing ratings in place until such time as we had enough reviews in the system to build up a good body of ratings.</p></blockquote>\n<p>A few weeks ago, Wood was checking out the ratings for the new WordPress theme directory when he noticed there were over 150K reviews. &#8220;Out of those 150K reviews, less than 10K are for themes&#8221; Wood said. This was enough to initiate the change and remove ratings not attached to a review. Since the system was rebuilt, some plugins have experienced 1 and 5 star <a title="https://wordpress.org/support/topic/star-rating-of-our-plugin-has-changed-overnight-1-star-and-5-star-look-switched?replies=2&view=all#post-6614288" href="https://wordpress.org/support/topic/star-rating-of-our-plugin-has-changed-overnight-1-star-and-5-star-look-switched?replies=2&view=all#post-6614288">rating swings,</a> while plugins like <a title="https://wordpress.org/plugins/wp-e-commerce/" href="https://wordpress.org/plugins/wp-e-commerce/">WP eCommerce</a> have seen its average rating rise from 2.9 to 3.4 stars.</p>\n<blockquote class="twitter-tweet" width="550"><p>That means <a href="https://twitter.com/wpecommerce">@wpecommerce</a>, which had been at a rating of 2.8 for years, and more recently 2.9 &#8211; is now 3.4 stars.&#10;&#10;That feels good :)</p>\n<p>&mdash; Justin Sainton (@JS_Zao) <a href="https://twitter.com/JS_Zao/status/570739795405750272">February 26, 2015</a></p></blockquote>\n<p></p>\n<p>In addition to displaying more accurate data, review spam has been neutralized. Review spam has been a serious problem for the past several years. According to Otto, this is no longer the case:</p>\n<blockquote><p>Ask any of the moderation team how many duplicate accounts they&#8217;ve seen to vote up their plugin and down those of competitors. Even though the reviews were removed, until yesterday, the ratings made by those accounts remained. This is no longer the case, and the ratings made by those spam accounts has now been effectively neutralized.</p></blockquote>\n<p>In summary, ratings and averages now reflect the most accurate data from the point in time reviews were introduced. Spam and fraudulent data hasn&#8217;t been lost or deleted but rather ignored from influencing the data set. Ratings that were added before mandatory reviews are also ignored.</p>\n<p>By waiting two and a half years, Wood has avoided resetting the entire system which would have caused everyone to start from zero. This way, authors are able to maintain their ratings and reviews without starting from scratch. If you host a plugin on the <a title="https://wordpress.org/plugins/" href="https://wordpress.org/plugins/">WordPress plugin directory</a>, let us know if your ratings changed, especially the average.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Feb 2015 06:39:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:15;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:76:"WPTavern: WordPress.com’s REST API Driven Post Editor Proves Speed Matters";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39560";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:83:"http://wptavern.com/wordpress-coms-rest-api-driven-post-editor-proves-speed-matters";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5647:"<p>In the last year or so, WordPress.com has been experimenting with <a title="https://en.forums.wordpress.com/topic/new-post-editor-improvements?replies=12" href="https://en.forums.wordpress.com/topic/new-post-editor-improvements?replies=12">a new post editor</a>. As a user of WordPress.com, I clicked the add new post button and was shocked to discover an entirely different interface than what I&#8217;m used to. Continuously pushing improvements across the platform with little to no announcement and measuring feedback is WordPress.com&#8217;s signature development strategy.</p>\n<p>Shortly after its release, users <a title="https://en.forums.wordpress.com/tags/beep-beep-boop" href="https://en.forums.wordpress.com/tags/beep-beep-boop">created support requests</a> to offer feedback. Dealing with change is hard, but it&#8217;s even more difficult when it goes unannounced. After receiving a ton of feedback, the team eventually added the option for users to switch back to the classic editor. Since its launch, I&#8217;ve found myself getting used to the new editor, but there are a couple of quirks that need to be addressed.</p>\n<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/WPdotComNewPostEditor.png" rel="prettyphoto[39560]"><img class="wp-image-39562 size-full" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/WPdotComNewPostEditor-e1424904139346.png?resize=1025%2C434" alt="New WordPress.com Editor" /></a>New WordPress.com Editor\n<h2>Speed</h2>\n<p>Depending on when I create a new post, I&#8217;ll see a &#8220;beep beep, boop&#8221; loading message for a few seconds. The longest I&#8217;ve seen the message is around 10 seconds. The post editor is built on top of the WordPress.com REST API and depending on traffic, server resources, etc., the API calls take longer than normal to process.</p>\n<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/WPDotComBeepBeepBoop.png" rel="prettyphoto[39560]"><img class="size-full wp-image-39594" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/WPDotComBeepBeepBoop.png?resize=445%2C347" alt="Beep Beep Boop" /></a>Beep Beep Boop\n<p>If it takes more than a few seconds to load the editor, that&#8217;s too long. With all of the server resources that make up the WordPress.com infrastructure, I expect things to load quickly. In reality, I shouldn&#8217;t see a loading screen.</p>\n<h2>Creating Content</h2>\n<p>Since the visual editor inherits most of the features found in the self-hosted version of WordPress, writing content is generally the same experience. However, one thing I&#8217;ve noticed is that, more often than not, the text area doesn&#8217;t expand to the bottom of the page. As I fill the text area with content, it doesn&#8217;t automatically expand. A quick fix is to reload the entire page by clicking the save draft button. Once I do this, the text area expands to take up the full-height of the browser window.</p>\n<p>Instead of having separate meta boxes for each task, some of them have been combined like categories and tags. The design of the publish meta box is a major improvement compared to the self-hosted version. It has a cleaner look and seems easier to use.</p>\n<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/WPdotComNewEditorMetaBoxes.png" rel="prettyphoto[39560]"><img class="size-full wp-image-39563" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/WPdotComNewEditorMetaBoxes.png?resize=1025%2C495" alt="New Post Editor Meta Boxes" /></a>New Post Editor Meta Boxes\n<p>One of the things I like most about the new editor is that it&#8217;s distraction-free by default. The surrounding admin elements in the classic editor are gone, allowing me to concentrate on writing. Meta boxes are shown but I don&#8217;t see them as distractions. The new editor also doesn&#8217;t waste valuable screen real estate showing admin notices, that I still haven&#8217;t figured out how to dismiss.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/WPdotComClassicEditorAdminNotices.png" rel="prettyphoto[39560]"><img class="size-full wp-image-39566" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/WPdotComClassicEditorAdminNotices.png?resize=1025%2C498" alt="Admin Notices That Never Go Away!" /></a>Admin Notices That Never Go Away!\n<h2>API Driven Interfaces Need to be Fast</h2>\n<p>The new editor is a real world example of an alternative publishing interface built using the <a title="https://developer.wordpress.com/docs/api/" href="https://developer.wordpress.com/docs/api/">WordPress.com REST API</a>. The biggest take away for me from using the new editor is how important speed is. As work continues on the <a title="http://wptavern.com/excellent-primer-on-the-wordpress-rest-api-project" href="http://wptavern.com/excellent-primer-on-the-wordpress-rest-api-project">REST API project for the self-hosted version</a> of WordPress, which will likely lead to an explosion of alternative publishing interfaces, I think it&#8217;s important for developers to consider how to make things as fast as possible. It doesn&#8217;t matter how nice the interface is if the API isn&#8217;t fast enough and ruins the user experience.</p>\n<p>After forcing myself to use the new editor for a few months, I rarely use the classic editor. It&#8217;s definitely not the ideal interface for everyone which is why I&#8217;m glad the team decided not to make it the only interface available. It has a few quirks, but for the most part, I don&#8217;t mind using it. If you use WordPress.com, let us know what you think of the new editor in the comments.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 26 Feb 2015 00:26:24 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:16;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WPTavern: Roots WordPress Starter Theme Rebrands as Sage with 8.0 Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39524";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:83:"http://wptavern.com/roots-wordpress-starter-theme-rebrands-as-sage-with-8-0-release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2628:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/sage.jpg" rel="prettyphoto[39524]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/sage.jpg?resize=729%2C336" alt="sage" class="aligncenter size-full wp-image-39578" /></a></p>\n<p>The Roots starter theme for WordPress has rebranded as &#8220;Sage&#8221; with its <a href="https://roots.io/new-website-sage-and-the-future/" target="_blank">8.0.0 release</a> today. Roots project creator Ben Word <a href="http://wptavern.com/roots-starter-theme-for-wordpress-will-become-framework-agnostic-in-2015" target="_blank">announced</a> last year that he planned to change the theme to be framework agnostic in 2015. This release is the first step towards that goal.</p>\n<p>Fans of the starter theme appreciate its cleaner HTML, cleaner script output, and its unique theme wrapper method for handling template markup. Version 8.0 introduces a new frontend workflow that uses <a href="http://gulpjs.com/" target="_blank">Gulp</a> instead of Grunt:</p>\n<ul>\n<li>Write stylesheets with Sass or Less</li>\n<li>Assets from Bower packages (CSS, JS, fonts) are automatically added to your theme assets</li>\n<li>JSON file based asset pipeline that allows you to customize your compiled CSS and JS files</li>\n<li>Replaced LiveReload with BrowserSync, making your workflow faster by synchronizing interactions across multiple devices</li>\n</ul>\n<p>Version 8.0 also drops IE8 support and raises the minimum PHP version requirement of PHP 5.4+. &#8220;We&#8217;re not going to let the WordPress minimum requirement of 5.2 hold us back from using short array syntax, short echo syntax, and namespaces,&#8221; Word said.</p>\n<p>Now that Sage 8.0 is available, Word is concentrating his efforts on developing a Yeoman generator for the starter theme, which will allow users to integrate their desired frontend framework.</p>\n<p>&#8220;Right now you can fairly easily use Bootstrap Sass instead of Less, swap out Bootstrap for another framework, or use no framework at all,&#8221; he said. &#8220;With a Yeoman generator you&#8217;ll be able to select from options to have your starter theme built how you like it from the beginning.&#8221;</p>\n<p>Going framework agnostic will open up the Roots user base to more developers who may have previously been turned off by using Bootstrap with their projects. The rebranding to Sage allows Word and contributors to use the <a href="https://roots.io/" target="_blank">Roots</a> organization to further expand the product lineup that will eventually subsidize the continual development of the open source starter theme.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Feb 2015 23:06:49 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:17;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:64:"Post Status: Twitter introduces an official plugin for WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"https://poststatus.com/?p=8875";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"https://poststatus.com/twitter-official-plugin-for-wordpress/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3993:"<p>&#8220;About time&#8221; is probably what comes to mind. Twitter <a href="https://blog.twitter.com/2015/twitter-plugin-wordpress">has announced an official WordPress plugin to support their platform</a>. It&#8217;s available now <a href="https://wordpress.org/plugins/twitter/">on the WordPress plugin repo</a>.</p>\n<p>They just released the plugin a couple of hours ago. It&#8217;s actually taking the place of an existing plugin, which was wiped from the plugin repo <a href="https://plugins.trac.wordpress.org/browser/twitter/trunk/readme.txt?rev=1086703">two weeks ago by Otto Wood</a>. That&#8217;s what will account for the 150,000+ downloads upon initial release. Otto has now reset the count in the database, so the numbers are more realistic.</p>\n<p>I reached out to Otto to see how these decisions are made. Otto is one of the managers of the repo.</p>\n<blockquote>\n<p class="p1"><span class="s1">A twitter representative emailed us, sent us the plugin, and asked to have the &#8220;twitter&#8221; name in the directory. We reviewed the plugin as per normal, found no issues with it, and decided to give them the name because, after all, they are indeed &#8220;Twitter&#8221; and have the rights to their own name.</span></p>\n<p class="p1"><span class="s1">The previous plugin occupying that space had been inactive for a long period of time and had no real existing installations to speak of anymore. Additionally, the plugin had been closed for quite some time previous to that.</span></p>\n<p class="p1"><span class="s1">So giving them their own name is pretty much a no-brainer. <img src="https://poststatus.com/wp-includes/images/smilies/icon_smile.gif" alt=":)" class="wp-smiley" /></span></p>\n</blockquote>\n<p class="p1">Techcrunch, and likely others, are misreporting the plugin&#8217;s immediate popularity, as those numbers were largely from the previous iteration of the plugin.</p>\n<p class="p1">Twitter&#8217;s new plugin has a number of features, many of which have been implemented over the years by unofficial sources like Jetpack and Yoast.</p>\n<p class="p1">For one, they have released &#8220;official&#8221; Tweet and follow buttons, along with a settings page for basic configuration.</p>\n<p class="p1"><img class="aligncenter size-large wp-image-8876" src="https://poststatus.com/wp-content/uploads/2015/02/twitter-share-752x400.png" alt="twitter-share" width="752" height="400" /></p>\n<p class="p1"><img class="aligncenter size-large wp-image-8877" src="https://poststatus.com/wp-content/uploads/2015/02/twitter-settings-752x728.png" alt="twitter-settings" width="752" height="728" /></p>\n<p class="p1">Also, there&#8217;s a metabox on post edit that allows you to customize the predefined Tweet and Twitter cards, which is quite nice.</p>\n<p class="p1"><img class="aligncenter size-large wp-image-8878" src="https://poststatus.com/wp-content/uploads/2015/02/twitter-sharing-752x365.png" alt="twitter-sharing" width="752" height="365" /></p>\n<p class="p1">They also have the ability to customize the colors for embedded tweets inside WordPress content.</p>\n<p class="p1">According to the Twitter blog announcement, there is also integration for Twitter ads and analytics tracking, which are both nice features for publishers.</p>\n<p class="p1">The one thing I notice is not in this plugin is any authentication feature. Perhaps it&#8217;ll come in the future, but right now you wouldn&#8217;t be able to auto-tweet new posts or perform other actions that would require Twitter Apps and authentication on a per-site basis. This is the type of functionality that Jetpack has long performed, using the WordPress.com authentication.</p>\n<p class="p1">I&#8217;m pretty happy to finally see an official Twitter plugin. The source <a href="https://github.com/twitter/wordpress">code is on Github</a>, and the plugin is released with the MIT license. At a very quick glance, it seems quite well done and I&#8217;m looking forward to playing with it some  more.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Feb 2015 21:27:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:18;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:107:"WPTavern: Envato Continues to Rake in the Cash from WordPress Themes Packaged as Complete Website Solutions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39519";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:117:"http://wptavern.com/envato-continues-to-rake-in-the-cash-from-wordpress-themes-packaged-as-complete-website-solutions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:7849:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/09/envato.jpg" rel="prettyphoto[39519]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/09/envato.jpg?resize=697%2C314" alt="envato" class="aligncenter size-full wp-image-29973" /></a></p>\n<p>This week Envato <a href="http://inside.envato.com/pressnomics/" target="_blank">published</a> stats on how WordPress product sellers are doing within its economy. Theme authors make up the bulk of WordPress-based earnings on its marketplace and continue to dominate sales.</p>\n<p>Inspired by his interaction with the WordPress business community at Pressnomics, Ben Chan, director of Growth and Revenue at Envato, penned an insider brief about the WordPress segment of Envato&#8217;s economy. The post makes it abundantly clear why theme authors continue to sell their products on Themeforest, despite the marketplace&#8217;s poor reputation among WordPress consultants.</p>\n<p>Envato&#8217;s steady pipeline of traffic is the deciding factor for many commercial theme authors. <strong>&#8220;In September 2014, ThemeForest was the 88th most trafficked website in the world (according to Alexa.com), at the time ahead of Netflix,&#8221;</strong> Chan said. &#8220;The traffic it receives is more than just eyeballs; these are buyers looking to purchase a theme and many are introduced to WordPress for the first time.&#8221;</p>\n<p>This volume has made it possible for 31 authors to sell more than $1 million dollars worth of products through Envato. <strong>&#8220;We have authors earning tens of thousands of dollars from our various product types, but it’s WordPress authors who currently dominate our Power Elite wall of fame by holding 30 of the 31 Power Elite spots.&#8221;</strong></p>\n<p>Competition is fierce among WordPress themes, yet even moderately competitive themes can make a decent chunk of change. Envato&#8217;s heavy traffic virtually guarantees sales for new theme authors. Chan reported average earning data for a single theme during a single month:</p>\n<ul>\n<li>50% of all WordPress themes on ThemeForest have made at least $1,000 in a month.</li>\n<li>25% of all WordPress themes on ThemeForest have made at least $2,500 in a month.</li>\n<li>15% of WordPress themes have made at least $5,000 in a month.</li>\n<li>7% have made at least $7,500 in a month.</li>\n<li>5% have made at least $10,000 in a month.</li>\n</ul>\n<p>Theme authors who make their products responsive and compatible with WooCommerce and WPML tend to have much higher earnings, which indicates that people are building WordPress sites that will be optimized for mobile traffic and global commerce.</p>\n<h3>Poor Standards Lead to Security Vulnerabilities and Loss of Data Portability</h3>\n<p>Envato remains the dominant marketplace for commercial WordPress themes, despite rampant security concerns surrounding its products on a regular basis. Last September, <a href="http://wptavern.com/1000-wordpress-themes-on-envato-market-potentially-affected-by-revolution-slider-security-vulnerability" target="_blank">1,000+ Envato products were affected by the Slider Revolution security vulnerability</a>. This particular debacle was fueled by theme authors who were lax in patching their products, as well as Envato&#8217;s poor standards, which continue to allow authors to bundle plugins with themes.</p>\n<p>If Envato required theme authors to adhere to industry best practices by clearly separating their theme and plugin products, the company would have had no need to publish a list of 1,000+ themes potentially affected by a vulnerability that was being <a href="http://wptavern.com/100000-wordpress-sites-compromised-using-the-slider-revolution-security-vulnerability" target="_blank">actively exploited since its disclosure</a>.</p>\n<p>Obviously, the data presented in Chan&#8217;s insider brief was designed to convince more authors to sell on Themeforest. Several of the theme product examples he showcases are packed full of <a href="http://wptavern.com/why-wordpress-theme-developers-are-moving-functionality-into-plugins" target="_blank">functionality that belongs in plugins</a>, i.e. automotive listings, filterable inventory, custom categories and taxonomies, etc. The products do not clearly differentiate what functionality is included in a plugin vs. the theme itself.</p>\n<p>Additionally, many of these top-selling themes offer accompanying plugins that are only compatible with that specific theme, a desperately myopic development practice rampant among Themeforest products that locks users into that theme/plugin package.</p>\n<p>What would be even more fascinating to know are the stats on WordPress theme products that do not bundle any plugins whatsoever. How well are the products doing that are pure themes with a clear separation from the plugins they support? Where are the stats for themes that absolutely guarantee unobstructed <a href="http://wptavern.com/wordpress-theme-shops-move-towards-preserving-data-portability" target="_blank">data portability</a> for customers?</p>\n<p>Envato theme authors are making large sums of cash by selling themes that are packaged as complete solutions for online businesses, because that&#8217;s what consumers have been trained to expect &#8211; the bigger the package, the more appealing the product. This can cause serious problems with data portability for customers down the road and remains a continual source of frustration for consultants who are hired to support poorly built Envato products.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/avada.jpg" rel="prettyphoto[39519]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/avada.jpg?resize=599%2C269" alt="Source: Avada theme on Themeforest" class="size-full wp-image-39557" /></a>Source: <a href="http://themeforest.net/item/avada-responsive-multipurpose-theme/2833226">Avada theme on Themeforest</a>\n<p>The marketplace&#8217;s loose product standards allow theme product authors to thrive on selling full website solutions, as Justin Tadlock discovered in his <a href="http://justintadlock.com/archives/2013/09/11/the-themeforest-experiment-one-year-later" target="_blank">Themeforest experiment</a>. Envato continues to rake in the cash from products that undermine best practices designed to protect users:</p>\n<blockquote><p>ThemeForest is in the business of selling WordPress themes. Selling anything else is underhanded at best and false advertising at worst.</p>\n<p>If you want to sell a “Web site solution” or whatever you want to call it, you’re selling on the wrong marketplace. Go create your own site and sell these applications for WordPress.</p></blockquote>\n<p>If the marketplace were to change its standards and encourage theme authors to build themes that respect WordPress&#8217; plugin system, it would most certainly result in a loss of profit. Envato currently has little incentive to move in this direction. As with the case of <a href="http://notes.envato.com/general/100-gpl-option-now-available-plus-woothemes-arrives" target="_blank">GPL licensing options</a>, the company historically drags its feet until forced to comply with most basic requirements.</p>\n<p>The WordPress community continues to pressure Envato to hold theme and plugin authors to standards that would better ensure the security and performance of users websites, but Envato isn&#8217;t likely to enforce stricter standards anytime soon.</p>\n<p>The company continues to parade its top sellers as incentive for new authors to bring their products into the marketplace. Changing theme product standards would require the restructuring of virtually all of its top-selling products. Envato&#8217;s bottom line will continue to drive its standards until either the market or the community force the company to change.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Feb 2015 19:25:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:19;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:88:"WPTavern: High Risk Security Vulnerability Discovered in WP Slimstat, Update Immediately";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39512";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/high-risk-security-vulnerability-discovered-in-wp-slimstat-update-immediately";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2205:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/WPSlimStatFeaturedImage.png" rel="prettyphoto[39512]"><img class="aligncenter size-full wp-image-39513" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/WPSlimStatFeaturedImage.png?resize=835%2C265" alt="WP Slim Stat Featured Image" /></a></p>\n<p>If you use <a title="https://wordpress.org/plugins/wp-slimstat/" href="https://wordpress.org/plugins/wp-slimstat/">WP Slimstat</a>, you&#8217;ll want to make sure you&#8217;re using version 3.9.6 or later as Sucuri has <a title="http://blog.sucuri.net/2015/02/security-advisory-wp-slimstat-3-9-5-and-lower.html" href="http://blog.sucuri.net/2015/02/security-advisory-wp-slimstat-3-9-5-and-lower.html">discovered a severe SQL injection vulnerability</a> in versions 3.9.5 and lower. WP Slimstat is an analytics plugin for WordPress that provides real-time monitoring, heatmaps, and other features to monitor website data. According to Sucuri, the vulnerability can be used by any visitor browsing a vulnerable website:</p>\n<blockquote><p>This bug can be used by any visitor browsing the vulnerable website. If your website uses a vulnerable version of the plugin, you’re at risk. Successful exploitation of this bug could lead to Blind SQL Injection attacks, which means an attacker could grab sensitive information from your database, including username, (hashed) passwords and, in certain configurations, WordPress Secret Keys (which could result in a total site takeover).</p></blockquote>\n<p>Although the author has <a title="https://wordpress.org/plugins/wp-slimstat/changelog/" href="https://wordpress.org/plugins/wp-slimstat/changelog/">patched the security vulnerability</a>, he offers some additional advice.</p>\n<blockquote><p>If you are using a caching plugin, please flush its cache so that the tracking code can be regenerated with the new key. Also, if you are using Slimstat to track external websites, please make sure to replace the tracking code with the new one available under Settings &gt; Advanced.</p></blockquote>\n<p>Spread the news and to be protected from the vulnerability, make sure any site using WP Slimstat is updated to the latest version.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Feb 2015 08:22:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:20;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"Matt: On WordPress.com and Bitcoin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44713";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:50:"http://ma.tt/2015/02/on-wordpress-com-and-bitcoin/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3656:"<p>There&#8217;s been some controversy and discussion about the fact <a href="http://www.coindesk.com/wordpress-removes-bitcoin-payment-option/">that WordPress.com no longer support Bitcoin in our new checkout flow on signup</a>. (It&#8217;s still there in some other flows.)</p>\n<p>Since there has been a lot of discussion about it, I wanted to share directly some of the answers I had to Grace&#8217;s follow-up questions, since I&#8217;m not sure if they&#8217;ll be published and if they are it probably won&#8217;t be in their entirety.</p>\n<blockquote><p>In regards to your future plans for the currency, is bitcoin support definitely returning or is that just a possibility at this point?</p></blockquote>\n<p>We’re big fans of Bitcoin and hope to support it again in the future, for all of the reasons that we originally supported it in 2012, which you can read about here:</p>\n<p><a href="http://en.blog.wordpress.com/2012/11/15/pay-another-way-bitcoin/" rel="nofollow">http://en.blog.wordpress.com/2012/11/15/pay-another-way-bitcoin/</a></p>\n<blockquote><p>Is there anything that will influence the outcome of this decision?</p></blockquote>\n<p>No, it is simply a matter of development resources, which are especially scarce for us right now as we’re trying to keep up with growth.</p>\n<blockquote><p>You mention that bitcoin has low volume compared to other payment methods, has this always been the case? Has its volume share changed over time?</p></blockquote>\n<p>The volume has been dropping since launch, in 2014 it was only used about twice a week, which is vanishingly small compared to other methods of payment we offer. We supported Bitcoin for philosophical reasons, not commercial ones.</p>\n<blockquote><p>What are the key aims of your checkout process changes?</p></blockquote>\n<p>Our goals are twofold: to refactor the code behind it which has parts that are over five years old and has grown very complex, and to make it faster and easier for people to buy our services.</p>\n<blockquote><p>When you first launched bitcoin payments WordPress’ blog post praised it as an inclusive payment method for those who cannot use PayPal. Do you worry that these people will now be excluded from the platform?</p></blockquote>\n<p>Of course, but either that number of people turned out to be smaller than we expected or they found other ways to pay. Since it’s so few people overall I’m happy to extend people’s subscription for a year, as <a href="http://www.coindesk.com/wordpress-removes-bitcoin-payment-option/#comment-1872904302">I offered in your comments section</a>.</p>\n<blockquote><p>What does being a ‘big believer’ in bitcoin mean to you?</p></blockquote>\n<p>I believe Bitcoin or some other blockchain-like system will be the basis of the majority of financial transactions in the future, from small remittances to multi-billion dollar corporate acquisitions. I think transaction costs should follow Moore’s law, and I don’t think we’re going to get there with the centralized gateways that currently account for the overwhelming majority of transactions. I also personally hold Bitcoin, I’m an advisor to <a href="https://www.stellar.org/">Stellar.org</a>, and my friends make fun of me for bringing up Bitcoin and the blockchain in unrelated conversations.</p>\n<blockquote><p>The bitcoin option still appears on the ‘WP Admin’ screen but not on ‘My Upgrades’. Is this part of the phase out, or likely to stay this way?</p></blockquote>\n<p>That’s on the old code base, and will be available for a short while if any current Bitcoin subscribers want to renew while the option is still available.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 25 Feb 2015 05:20:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:21;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:60:"WPTavern: WordPress for iOS 4.8 Released, Adds Visual Editor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39488";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:69:"http://wptavern.com/wordpress-for-ios-4-8-released-adds-visual-editor";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2274:"<p>WordPress for iOS 4.8 is <a title="https://itunes.apple.com/us/app/wordpress/id335703880?mt=8" href="https://itunes.apple.com/us/app/wordpress/id335703880?mt=8">available on the app store</a> and includes a few notable features. The app now sports a visual editor providing a <em>what you see is what you get </em>experience. Prior to 4.8, the editor was stuck in HTML mode making it hard to read and write content.</p>\n<p>The editor contains the most commonly used formatting tools and just like the desktop version of WordPress, includes a toggle to switch between HTML and Visual editing mode. There&#8217;s also an image size selector where you can choose between Thumbnail, Medium, Large, or Full-size.</p>\n\n<a href="http://i0.wp.com/wptavern.com/wordpress-for-ios-4-8-released-adds-visual-editor/img_5831.png" rel="prettyphoto[39488]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/IMG_5831.png?fit=500%2C500" class="attachment-large" alt="WordPress For iOS 4.8 HTML Editor" /></a>\n<a href="http://i0.wp.com/wptavern.com/wordpress-for-ios-4-8-released-adds-visual-editor/img_5830.png" rel="prettyphoto[39488]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/IMG_5830.png?fit=500%2C500" class="attachment-large" alt="WordPress For iOS 4.8 Visual Editor" /></a>\n<a href="http://i2.wp.com/wptavern.com/wordpress-for-ios-4-8-released-adds-visual-editor/img_5833.png" rel="prettyphoto[39488]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/IMG_5833.png?fit=500%2C500" class="attachment-large" alt="WordPress For iOS 4.8 Post Preview Screen" /></a>\n<a href="http://i0.wp.com/wptavern.com/wordpress-for-ios-4-8-released-adds-visual-editor/img_5832.png" rel="prettyphoto[39488]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/IMG_5832.png?fit=500%2C500" class="attachment-large" alt="WordPress For iOS Image Size Selector" /></a>\n\n<p>Although I struggled with adding block quotes, the visual editor is a nice departure from HTML mode. I find it convenient to format content as I&#8217;m writing versus when the post is completed. Overall, 4.8 is a nice release and I think users are going to enjoy the new visual editor. After you upgrade to 4.8, let us know what you think in the comments.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Feb 2015 20:27:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:22;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:50:"Post Status: The problem of link rot and data loss";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"https://poststatus.com/?p=8859";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:32:"https://poststatus.com/link-rot/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:8505:"<p>Websites come and go. With them, typically goes their data. This is often called &#8220;link rot&#8221;, when the content in question was also linked to from another source. Sometimes I don&#8217;t mind too much, because I&#8217;m not terribly invested in that content. However, there are times where content has a relevance in news matters, or as a significant historical timeline.</p>\n<p>Sometimes, a website where I contributed content goes away or atrophies&#8211; in some form or another &#8212; and it makes me sad to see my content go down with the ship.</p>\n<p>Three places where I contributed much of my early WordPress content have either lost data, had data corrupted, or disappeared entirely. Each makes me sad.</p>\n<p>Some of my earliest WordPress related words were typed out on <a href="http://wptavern.com">WP Tavern</a>&#8216;s forums, <a href="http://themehybrid.com">Theme Hybrid</a>&#8216;s (private) forums, or <a href="http://wpcandy.com">WPCandy</a>. Each situation is different. WP Tavern&#8217;s forums are totally gone, though I&#8217;m told there is an offline backup, meaning they could be brought back alive. <del>Theme Hybrid recently deleted all old forum data, though this forum was private and the most excusable of the three in my opinion.</del> <em>(<strong>edit</strong>: as Sami notes in the comments, the archive was kept. I just didn&#8217;t see it.)</em> And WPCandy, while not gone, seems it could disappear any day &#8212; and I wrote something like 130-140 blog posts over there. I&#8217;d be incredibly sad to see WPCandy disappear forever.</p>\n<p>Stories like these aren&#8217;t unique to me. All of us that write or comment or participate in online communities have similar stories. It appears that data loss is just a thing we have to live with in the modern age. I know a friend of mine, Siobhan McKeown, has many times struggled with finding old content for the History of WordPress book she is finishing writing.</p>\n<h3>Fighting link rot</h3>\n<p>Why is this important and what can we do about it? Well, there are a number of resources that can be helpful.</p>\n<p>The first and obvious method for fighting link rot is <a href="https://archive.org/">archive.org</a>, the project that is archiving as much of the web as possible to preserve it for future generations. Archive.org is outstanding, and it is a huge project on a grand scale. The team there makes great efforts to document important websites, and automatically attempts the rest.</p>\n<p>The problem is, with many smaller websites it may or may not be successful, or snapshots of the website may be dated or not include everything. Furthermore, if the website isn&#8217;t structured in a certain way or is password protected, there&#8217;s not much they can do.</p>\n<p>So, without relying on archive.org to do it for us, there are two other methods worth noting.</p>\n<h4>Manual backups</h4>\n<p>In individual communities, we can manually make the effort to backup sites that we believe are at risk. We should also contact these site owners and requests backups, even if that comes off as an affront.</p>\n<p>When Siobhan was writing the History of WordPress book, she was worried that WPCandy could go offline &#8212; as it &#8220;was becoming particularly degraded&#8221; while she was writing &#8212; so she personally scraped a backup of the site with a tool called <a href="http://www.sitesucker.us/home.html">SiteSucker</a>.</p>\n<p>SiteSucker finds URLs, logs them, and backs up the source HTML. Similar work can be done with <a href="https://www.gnu.org/software/wget/">wget</a>, for those that know how to utilize it. It&#8217;s my understanding that various individuals have done this with a number of other WordPress websites as well.</p>\n<p>For WordPress sites, I know WP Tavern&#8217;s forums still exist offline, and Siobhan tells me she even has a backup of the old b2 forums (the software which WordPress was forked from). I&#8217;d also guess Justin Tadlock still has a backup somewhere of his forums. I&#8217;d love to see these, and other &#8220;lost&#8221; sites have a public place where the archives can be maintained.</p>\n<h4>Self-hosted backups</h4>\n<p>Another method to fight link rot is to backup linked sources as we create new content. Harvard&#8217;s Berkman Center is currently beta testing what will be <a href="http://www.niemanlab.org/2015/02/amber-a-new-tool-to-prevent-linkrot-on-websites-is-out-in-beta/">a commercial tool, called Amber, to fight link rot</a>. In the news industry specifically, the source URLs for linked content can contain significant context for a post, making link rot on old posts particularly damaging to the piece that links them, assuming additional context will be available to the reader.</p>\n<p><img class="aligncenter size-large wp-image-8861" src="https://poststatus.com/wp-content/uploads/2015/02/amber-link-rot-saver-752x396.png" alt="amber-link-rot-saver" width="752" height="396" /></p>\n<p>Amber stores the source HTML, much like Archive.org, wget, or SiteSucker, but stores it on the host site&#8217;s servers. Meaning, if I were using it here right now, each link in this post would have an associated HTML document on my server to preserve the link and the content therein. The tool then detects 404s if the link rots in the future, and offers up a cached version from my own server.</p>\n<p>Obviously a tool like Amber is not a small investment. It would require news organizations to have more server resources at the least, but it would be an important investment to protect the integrity of source content.</p>\n<p>The <a href="http://amberlink.org/">Amber website</a> cites that 49% of links in United States Supreme Court decisions are dead, and that over 135,000 Wikipedia source links are dead. These numbers alone are staggering, and prove a very good point. I can&#8217;t imagine what the ratios of dead links are for longstanding newspapers like The New York Times, and others.</p>\n<p>Amber will be available for WordPress and Drupal, or most platforms that support Apache or Nginx. I&#8217;m really, really excited about this tool. I know it will cost money (in resources at least, as I&#8217;m not sure if it&#8217;ll be a commercial product), but if enough people adopt it, it could really help save a lot of future data. I&#8217;m very interested in it for Post Status, as a number of blogs and companies I cover go away if they are not successful upon launch (when I often cover them).</p>\n<h3>Why fighting link rot is important</h3>\n<p><span class="pullquote alignright">We don&#8217;t know what items being published today will be important tomorrow. </span> What we do know is that future politicians, world leaders, and to-be significant individuals and organizations are publishing online today. And when these people or organizations are in significant positions, we will want to know their pasts and opinions.</p>\n<p>Perhaps more importantly, cultures, subcultures, and events being documented online may not have any offline version. The web has a beautiful advantage over other mediums like television and newspapers, in that storage of historical data is much simpler, and easier to search. The web enables our timeframe of life on earth to be the most documented in all of human existence.</p>\n<p>It is our responsibility as publishers to protect our own content, but also the content of others. I&#8217;m reminded how easy it is now because of how hard such efforts are on other mediums. I once read a <a href="http://www.fastcompany.com/3022022/the-incredible-story-of-marion-stokes-who-single-handedly-taped-35-years-of-tv-news">story about Marion Stokes</a> (also, <a href="http://www.onthemedia.org/story/tldr-9-second-life-marion-stokes/">NPR version</a>), who recorded 35 years of TV news on her own &#8212; news that would have been lost without her monumental and perhaps compulsive efforts.</p>\n<p>We also have a responsibility as site owners to keep our content up even past when we may hang up our hats. Within our various niche communities, we should be making efforts to document and keep the past.</p>\n<p>In the case of WordPress, we&#8217;re cataloguing software that powers nearly 25% of the web, and growing. There are important stories being told today that may be educational to future publishers, documentarians, or simply interested individuals. You never know when our content will matter again, but it might, and therefore we should take strides to keep it.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Feb 2015 18:41:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:23;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:77:"WPTavern: Press This Bookmarklet Generates Concerns of Copyright Infringement";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39473";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:87:"http://wptavern.com/press-this-bookmarklet-generates-concerns-of-copyright-infringement";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5102:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/PressThisFeaturedImage.png" rel="prettyphoto[39473]"><img class="aligncenter size-full wp-image-39478" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/PressThisFeaturedImage.png?resize=836%2C266" alt="Pres This Featured Image" /></a></p>\n<p><a title="http://codex.wordpress.org/Press_This" href="http://codex.wordpress.org/Press_This">Press This</a> is a bookmarklet tool that was <a title="https://wordpress.org/news/2008/07/wordpress-26-tyner/" href="https://wordpress.org/news/2008/07/wordpress-26-tyner/">added to WordPress 2.6</a> in 2008. You can access the tool by browsing to the WordPress backend and select the Tools menu. It acts as a small app that runs in the browser to quickly share content on the web. Press This is in the process of <a title="https://make.wordpress.org/core/2015/02/18/press-this-revamp-merge-proposal/" href="https://make.wordpress.org/core/2015/02/18/press-this-revamp-merge-proposal/">being revamped</a> in preparation for WordPress 4.2.</p>\n<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/PressThisLocation.png" rel="prettyphoto[39473]"><img class="size-full wp-image-39477" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/PressThisLocation.png?resize=1010%2C227" alt="Press This Location" /></a>Press This Location\n<p>Because the bookmarklet uses content from the site being shared, it&#8217;s easy to infringe on a website&#8217;s copyrighted material. Daniel Bachhuber brought up the issue <a title="https://github.com/MichaelArestad/Press-This/issues/42" href="https://github.com/MichaelArestad/Press-This/issues/42">in Github</a> where active development is taking place.</p>\n<blockquote><p>I&#8217;m not the best person to comment on this, but it seems like building a tool that automatically scrapes copyrighted materials should have an upfront discussion about said legal implications, and whether this is something we should promote.</p></blockquote>\n<p>To my knowledge, this is the first time the issue has been brought up since its inclusion into core. Stephane Daury, who is one of the project&#8217;s primary contributors explains that, the tool goes through great efforts to use values clearly defined by websites.</p>\n<blockquote><p>We also (now) make a greater effort to use values the sites have clearly defined and specified as being what they want their articles and content to be represented as when shared elsewhere, by detecting Open Graph and Twitter Cards tags, etc. This includes representations for thumbnails, embeds, etc.</p></blockquote>\n<p>Although it&#8217;s not documented in the conversation on Github, <a title="https://github.com/MichaelArestad/Press-This/issues/42#issuecomment-74895220" href="https://github.com/MichaelArestad/Press-This/issues/42#issuecomment-74895220">Michael Arestad reached out to Paul Sieminski</a>, Automattic&#8217;s general legal counsel, and received word that, from a legal standpoint, Press This is fine. Richard Best of WP and Legal Stuff <a title="http://wpandlegalstuff.com/press-this-and-copyright-infringement/" href="http://wpandlegalstuff.com/press-this-and-copyright-infringement/">published a post on the issue</a> and takes a similar stance:</p>\n<blockquote><p>It seems that a person in-the-know in Automattic has commented internally (no doubt in more detail than we see in the public online discussion) that Press This is fine. I agree. I thought it might be of interest to those following this issue to explain why.</p>\n<p>The discussion revolves around the notion of ‘authorising’ an action that amounts to copyright infringement or ‘contributing’ to infringement (similar concepts which, in different jurisdictions, are called different things). It explains why there is no such authorisation or contribution here and why, therefore, Press This is fine.</p></blockquote>\n<p>The Press this bookmarklet is a convenient way to share content on the web, but it doesn&#8217;t prevent copyright infringement from occurring. Best makes an excellent point when he says that, it&#8217;s the end user&#8217;s responsibility to make sure they&#8217;re not infringing on anyone&#8217;s copyright:</p>\n<blockquote><p>It can, of course, also be used to infringe copyright, by copying a full article without permission or copying a full size copyright image without permission but, ultimately, Press This is simply a (pretty handy) tool of convenience. It’s the user’s responsibility to use Press This within the confines of copyright law (or run the risk of being accused of copyright infringement).</p></blockquote>\n<p>While Press This is a tool that makes it easy to share snippets of content on the web, it should not be used to re purpose entire articles or share full-size copyrighted images. As <a title="http://www.goodreads.com/quotes/709747-with-great-power-comes-great-responsibility" href="http://www.goodreads.com/quotes/709747-with-great-power-comes-great-responsibility">Voltaire once said</a>, &#8220;great power comes with great responsibility.&#8221;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 24 Feb 2015 03:37:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:24;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WPTavern: Content Protection Plugins for WordPress Do More Harm Than Good";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39450";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:83:"http://wptavern.com/content-protection-plugins-for-wordpress-do-more-harm-than-good";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5429:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/ContentProtectionFeaturedImage.png" rel="prettyphoto[39450]"><img class="size-full wp-image-39466" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/ContentProtectionFeaturedImage.png?resize=711%2C297" alt="Content Protection Featured Image" /></a>photo credit: <a href="http://www.flickr.com/photos/10583321@N06/5897893452">Cologne &#8211; Locks</a> &#8211; <a href="https://creativecommons.org/licenses/by-nc-nd/2.0/">(license)</a>\n<p>Mika Epstein, who <a title="http://wptavern.com/behind-the-scenes-in-the-wordpress-plugin-directory-with-mika-epstein" href="http://wptavern.com/behind-the-scenes-in-the-wordpress-plugin-directory-with-mika-epstein">helps oversee the WordPress plugin directory</a>, has published <a title="http://halfelf.org/2015/stop-using-copy-protection/" href="http://halfelf.org/2015/stop-using-copy-protection/">a simple request</a> to stop using copy protection. Epstein explains how copy protection degrades the user experience, makes it difficult to provide tech support, and perhaps most importantly, how they don&#8217;t work.</p>\n<p>She suggests that photographers use a watermark and not put full-size images on the web. They should also host images on cloud based services like Amazon as PHP and large image sizes don&#8217;t get along. As a last resort, she suggests DRM as an option similar to how <a title="http://company.gettyimages.com/license-compliance/" href="http://company.gettyimages.com/license-compliance/">Getty protects their images</a>.</p>\n<blockquote><p>As much as it pains me to say it, DRM is also a solution. So is watermarking your images. The way people like Getty protect their images is to lock it down to purchased users only. You can (fairly easily) download the smaller, sample images, but the awesome big ones are locked down.</p></blockquote>\n<p>She finishes the post by saying there&#8217;s only one way to combat content theft: don&#8217;t publish it online.</p>\n<h2>Getting Around a Copy Protection Plugin</h2>\n<p>A search for <a title="https://wordpress.org/plugins/search.php?q=copy+protection&sort=" href="https://wordpress.org/plugins/search.php?q=copy+protection&sort=">copy protection</a> on the WordPress plugin directory generates 271 results. I installed <a title="https://wordpress.org/plugins/wp-content-copy-protection/" href="https://wordpress.org/plugins/wp-content-copy-protection/">WP Content Copy Protection</a> as it&#8217;s one of the more popular options and it has a ton of features, including:</p>\n<ul>\n<li>Disables context menu (right click)</li>\n<li>Context menu is only clickable on HREFs</li>\n<li>Disables text selection and browser copy functions</li>\n<li>Disables text and image drag/drop/saving function on PC and mobile devices</li>\n<li>Javascript validation (displays error message when Javascript is disabled)</li>\n<li>Disables keyboard copy (CTRL A, C, X, U, P and S) &#8211; Windows OS</li>\n<li>Disables f-key command for accessing developer tools</li>\n<li>Uses compressed Javascript (increases load speed and reduces http requests)</li>\n<li>The image link URL is automatically removed and defaulted to the &#8216;none&#8217; setting (basic image protection)</li>\n<li>No configuration, customization or coding needed.</li>\n</ul>\n<p>As you can see, this plugin does a lot and should prevent me from easily stealing content. After installing and activating the plugin, I visited the front page of the testing site and discovered all of the usual suspects were disabled. I couldn&#8217;t right-click to view the page source or directly download an image. I opened up the <a title="http://getfirebug.com/" href="http://getfirebug.com/">Firebug</a> extension in FireFox and inspected the image element.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/FireBugInspectedImageElement.png" rel="prettyphoto[39450]"><img class="size-full wp-image-39465" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/FireBugInspectedImageElement.png?resize=1025%2C499" alt="Image Inspected With Firebug" /></a>Image Inspected With Firebug\n<p>After inspecting the image within the post, I gained access to the direct URL in Firebug&#8217;s console. I copied and pasted the URL into a new browser window which allowed me to download the full-size image. I&#8217;m also able to inspect paragraph elements and copy those as well. If the site is using the free version of WP Content Copy Protection, I can use its RSS feed to scrape content as only the pro version removes RSS feeds.</p>\n<p>The pro version adds several features that make it much more aggressive at content protection. For instance, it has a print screen deterrent agent to prevent the use of screenshot tools to steal images. I&#8217;ve contacted the plugin author and have asked for a free trial to see if I can easily get access to protected content with the pro version. If he gives me a copy, results of the experiment will be published in a future post on the Tavern.</p>\n<p>Although copy protection plugins or copy protection in general prevents the average website visitor from being able to steal content, they come with a lot of unnecessary baggage. In essence, they do more harm than good, especially from an accessibility stand point, as common keyboard shortcuts are disabled. If you don&#8217;t want to have your content stolen online, don&#8217;t publish it.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Feb 2015 23:26:42 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:25;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:84:"WPTavern: WordCamp Miami Gears Up for 6th Year with New Tracks and Workshops Planned";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39433";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:94:"http://wptavern.com/wordcamp-miami-gears-up-for-6th-year-with-new-tracks-and-workshops-planned";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:5649:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/wcmia-2015.jpg" rel="prettyphoto[39433]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/wcmia-2015.jpg?resize=750%2C349" alt="wcmia-2015" class="aligncenter size-full wp-image-39447" /></a></p>\n<p><a href="http://davidbisset.com/wordcamp-miami-2015-sessions-tracks/" target="_blank">WordCamp Miami</a> is one of the largest and longest-running annual WordPress events, thanks to its dedicated organizers and volunteers. Last year, <a href="http://wptavern.com/recap-of-wordcamp-miami-2014" target="_blank">the event attracted 770 WordPress enthusiasts</a> from around the world. Co-organizer David Bisset expects that attendees will be in the range of 800 this year for its 6th edition.</p>\n<p>The event has sold out every year, with 250 attendees on its first run in 2010 and attendance steadily increasing every year. Organizing a successful WordCamp for more than half a decade requires organizers to go with what works and always be open to introducing new formats.</p>\n<h4>Expanded Kid&#8217;s Workshop Planned</h4>\n<p>Last year&#8217;s fifth anniversary event included an experiment with hosting a <a href="http://wptavern.com/wordcamp-miami-kids-workshop-launches-the-next-generation-of-bloggers" target="_blank">kid&#8217;s workshop</a> for ages 8-12. Organizers guided the children through the process of setting up a new blog and publishing to the internet for the first time. Bisset said the 2015 event plans to expand on kid&#8217;s workshop.</p>\n<blockquote><p>Expect it back this year based on demand, but we are also bringing something else for young ones to WordCamp Miami 2015. One of our biggest goals at WCMIA is diversity – and diversity includes young ones. They are the next generation of bloggers, developers, and coders.</p></blockquote>\n<p>Volunteering to help with the kid&#8217;s workshop is a fun way to reignite your excitement about WordPress and publishing in general. The event will likely offer more opportunities this year with an expanded workshop planned.</p>\n<h4>BuddyCamp Miami to Return for 3rd Edition</h4>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/05/buddycamp.jpg" rel="prettyphoto[39433]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2014/05/buddycamp.jpg?resize=1025%2C459" alt="buddycamp" class="aligncenter size-full wp-image-22680" /></a></p>\n<p><a href="http://miami.wordcamp.org/2015/announcing-buddycamp-miami-2015/" target="_blank">BuddyCamp Miami will return for a third year</a> on May 29th to kick off the main event. This year the topics will be more developer-focused than previous years.</p>\n<p>&#8220;We really don’t want people just to come and listen to talks, but actually CHAT with developers and contributors one-on-one to learn and improve their development and design skills with BuddyPress and bbPress,&#8221; Bisset said. Attending a BuddyCamp is a good way to connect with those who are involved in making BuddyPress and find out more about extending and contributing to the plugin.  Attendee maximum numbers for the 2015 event will be more limited than previous years to facilitate a stronger environment for developer-focused learning.</p>\n<h4>New &#8220;How To&#8221; Track</h4>\n<p>WordCamp Miami is already a veritable smorgasbord of WordPress knowledge, but organizers plan to add several new formats this year for variety. In addition to the traditional abstract/motivational track, a practical “How To” track is in the works.</p>\n<p>&#8220;This track will be focused on users walking into the room and walking out in that same hour with actionable insights and knowledge,&#8221; Bisset said. Sessions will take the form of mini-workshops where attendees can quickly learn new techniques and technologies.</p>\n<p>Bisset&#8217;s <a href="http://davidbisset.com/wordcamp-miami-2015-sessions-tracks/" target="_blank">announcement</a> also hints at &#8220;Hallway Tracks,&#8221; which will unofficially welcome and recognize hallway networking. Business talks will be welcome again this year but will be refocused to provide a more practical and organized series of talks with resources for attendees.</p>\n<p>WordCamp Miami will remain committed to furthering developer education based on feedback from the local community. Organizers plan to encourage more deeper-level developer talks at the 2015 event. &#8220;We think Miami is ready for more serious developer talks and conferences,&#8221; Bisset said. &#8220;According to feedback from local meetups and other sources, more and more advanced topics are being desired (and less of the very early or beginning level topics).&#8221;</p>\n<h4>A Call for Speakers and Volunteers</h4>\n<p>Speaker applications for WordCamp Miami opened up today, and organizers welcome first-time WordCamp speakers to join the event. Topic suggestions are available on the <a href="http://miami.wordcamp.org/2015/speaker-submissions/" target="_blank">speaker submissions</a> page of the event website.</p>\n<p>An event of this magnitude requires a large crew of local volunteers. Last year the eight person coordinating team managed a crew of 30 volunteers, a few of which were even from out of town. &#8220;Volunteers literally made 2014 possible,&#8221; Bisset said. The team currently has almost a dozen coordinators in its Slack group and will be adding more in the coming weeks. If you want to <a href="http://miami.wordcamp.org/2015/volunteers/" target="_blank">get involved</a>, there are lots of opportunities to share your knowledge and skills to help make WordCamp Miami 2015 another successful event.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Feb 2015 21:32:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:26;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Matt: Find Three Hobbies";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44705";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:40:"http://ma.tt/2015/02/find-three-hobbies/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:289:"<blockquote><p>Find three hobbies you love: one to make you money, one to keep you in shape, and one to be creative.</p></blockquote>\n<p>I&#8217;m not sure the provenance of this quote, but I read it and it really resonated with me, and I&#8217;ve found myself repeating it frequently.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Feb 2015 19:30:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:27;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:88:"WPTavern: Aventurine: A Free WordPress Theme Featuring Bold Typography and Bright Colors";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39396";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:97:"http://wptavern.com/aventurine-a-free-wordpress-theme-featuring-bold-typography-and-bright-colors";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3764:"<p>Last year, WordPress saw a <a href="http://wptavern.com/top-15-free-wordpress-themes-released-in-2014" target="_blank">renaissance in personal blogging themes</a>. The official WordPress.org directory received a deluge of high quality themes that served to raise the bar for commercial developers when it comes to design and simplicity.</p>\n<p>In particular, the trend of flat, minimalist blogging themes is still running strong. Last month, theme design and development duo Mel Choyce and Kelly Dwan released <a href="https://wordpress.org/themes/aventurine" target="_blank">Aventurine</a>, a bold new theme for writers.</p>\n<p>The name Aventurine was inspired by the Italian phrase <em>a ventura</em>, meaning by chance, but the theme&#8217;s elegant and deliberate typography choices indicate that nothing has been left to chance. Aventurine posseses a design wholeness where every element has a clear purpose, and the theme is free of cluttersome widgets and extraneous meta.</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/aventurine.png" rel="prettyphoto[39396]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/aventurine.png?resize=880%2C660" alt="aventurine" class="aligncenter size-full wp-image-39398" /></a></p>\n<p>The theme&#8217;s colors are reminiscent of Choyce and Dwan&#8217;s popular <a href="https://wordpress.org/themes/flounder" target="_blank">Flounder</a> theme, which has been downloaded more than 33,000 times. Aventurine&#8217;s text and headers feature Josefin Sans and Varela Round from Google Fonts.</p>\n<p>The theme includes customizer options for setting the background and header colors. You can also upload a background image. Aventurine&#8217;s creators recommend using a repeating pattern, such as the ones offered at <a href="http://subtlepatterns.com/" target="_blank">subtlepatterns.com</a>.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/aventurine-customizer.png" rel="prettyphoto[39396]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/aventurine-customizer.png?resize=1025%2C586" alt="aventurine-customizer" class="aligncenter size-full wp-image-39419" /></a></p>\n<p>Featured images are displayed as headers on top of posts at 900px wide for impact. The footer widget areas the only additional customizable feature. They are displayed neatly beneath posts and do not detract from the main content of the page.</p>\n<p>Dwan and Choyce built Aventurine with accessibility in mind, particularly as it relates to best practices for interacting with keyboard and screen readers. While the theme&#8217;s default color palette does not pass accessibility guidelines, the authors made it easy for you to change some of the theme&#8217;s main colors in the customizer. Further customizations can be added to a child theme.</p>\n<p>Aventurine has built-in support for a range of Jetpack features, including  galleries, carousels, infinite scroll, and Photon. Over the past year, the Jetpack development team has been refining the plugin&#8217;s features to be more friendly to theme developers. Many newly released themes are taking advantage of this by supporting Jetpack features out of the box.</p>\n<p>After sorting through dozens of free themes added to WordPress.org in early 2015, Aventurine is one of the few that stand out as truly original and inspiring. It&#8217;s one of the best-designed personal blogging themes of 2015 thus far. Check out the <a href="https://themes.redradar.net/aventurine/" target="_blank">live demo</a> on the theme&#8217;s homepage. You can download <a href="https://wordpress.org/themes/aventurine" target="_blank">Aventurine</a> for free from WordPress.org or install it via your admin themes browser.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Feb 2015 17:18:04 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:28;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Matt: Elon Musk AMA";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44678";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:35:"http://ma.tt/2015/02/elon-musk-ama/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:193:"<p><a href="https://www.reddit.com/r/IAmA/comments/2rgsan/i_am_elon_musk_ceocto_of_a_rocket_company_ama/">I am Elon Musk, CEO/CTO of a rocket company, AMA!</a>. This guy continues to amaze.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Feb 2015 00:48:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:29;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:35:"Matt: Actually Good Youtube Comment";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44695";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:51:"http://ma.tt/2015/02/actually-good-youtube-comment/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1125:"<p>Hey guys! I found a good comment on Youtube. Documenting here for posterity, from <a href="https://www.youtube.com/user/vTxTobi">vTxTobi</a>:</p>\n<blockquote><p>Top 5 rappers:<br />\n1. <a href="http://en.wikipedia.org/wiki/Kendrick_Lamar">Kendrick Lamar</a><br />\n2. K.dot<br />\n3. Guy in <a href="http://genius.com/Big-sean-control-lyrics">second verse of Control</a><br />\n4. Short dude in <a href="http://txdxe.com/">TDE</a><br />\n5. The <a href="http://en.wikipedia.org/wiki/Good_Kid,_M.A.A.D_City">good kid in a mad city</a></p></blockquote>\n<p>(I added the links.) The joke is all of those refer to Kendrick Lamar, so was laugh-out-loud funny. It was on Kendrick&#8217;s <a href="http://www.theatlantic.com/entertainment/archive/2015/02/kendrick-lamar-is-not-a-hypocrite/385384/">powerful and controversial</a> new <a href="https://www.youtube.com/watch?v=6AhXSoKa8xw">Blacker the Berry track</a>. So congrats to vTxTobi for writing the only decent comment I&#8217;ve read on Youtube in years. <img src="http://i1.wp.com/s.ma.tt/blog/wp-includes/images/smilies/icon_smile.gif?w=604" alt=":)" class="wp-smiley" /></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 21 Feb 2015 21:10:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:30;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Matt: Future of WP and Jetpack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44699";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"http://ma.tt/2015/02/future-of-wp-and-jetpack/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:251:"<p>There&#8217;s been some interesting threads going around on Jetpack and the future of WordPress, here&#8217;s Chris Lema&#8217;s take: <a href="http://chrislema.com/success-of-wordpress/">Is the Future Success of WordPress tied to Jetpack?</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sat, 21 Feb 2015 05:15:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:31;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:63:"WPTavern: WPGlobus Plugin Adds a Language Switcher to WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=27334";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:73:"http://wptavern.com/wpglobus-plugin-adds-a-language-switcher-to-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4703:"<p>Last week <a href="http://wordpress.org/plugins/wpglobus/" target="_blank">WPGlobus</a> 1.0 beta was released on WordPress.org. The plugin offers an interesting new attempt at providing multi-language support for WordPress sites. WPGlobus allows you to configure a set of available languages and adds a dropdown language switcher to the frontend via a custom menu.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/wpglobulus-language-switcher.png" rel="prettyphoto[27334]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/wpglobulus-language-switcher.png?resize=1025%2C437" alt="wpglobulus-language-switcher" class="aligncenter size-full wp-image-39369" /></a></p>\n<p>The development team behind <a href="http://www.wpglobus.com/" target="_blank">WPGlobus</a> is led by WordPress developer Gregory Karpinsky. He designed the tool to be used on bilingual/multilingual WordPress sites. To be clear, the plugin does not provide translations, but rather allows you to create your own translations for pages and posts in the admin.</p>\n<p>Karpinsky quotes the venerable Capt. O.B.Vious in his reasoning behind creating the plugin: <strong>&#8220;People are a lot more likely to interact with your website if it is available in their own language.&#8221;</strong> WPGlobus was designed to make it easy for anyone to add a language switcher to their site without too much hassle.</p>\n<p>The current version of the plugin offers the following feature highlights:</p>\n<ul>\n<li>Add multiple languages and countries to your site.</li>\n<li>Translate posts, pages, categories, tags and menus using a clean and simple interface.</li>\n<li>Switch languages at the front end using a dropdown menu with language names and country flags.</li>\n<li>Supports the WP-SEO titles and descriptions in multiple languages</li>\n</ul>\n<p>The first step in using the plugin is to select the languages you want to be available in the frontend dropdown. WPGlobus offers different ways to customize the way the languages appear in the menu and comes with flag images pre-installed for each language. The images are also customizable, should you wish to add your own or define custom combinations of country flags and language abbreviations.</p>\n<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/wpglobulus-admin-settings.png" rel="prettyphoto[27334]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/wpglobulus-admin-settings.png?resize=1025%2C685" alt="wpglobulus-admin-settings" class="aligncenter size-full wp-image-39366" /></a></p>\n<p>If you have a relatively small website that is quick to translate, you can paste translations for other languages directly into WPGlobus&#8217; tabbed interface in the post editor.</p>\n<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/wpglobulus-editor.png" rel="prettyphoto[27334]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/wpglobulus-editor.png?resize=1025%2C586" alt="wpglobulus-editor" class="aligncenter size-full wp-image-39367" /></a></p>\n<p>The frontend dropdown menu allows visitors to switch between languages and displays them by changing the URL (/{language}/page/).</p>\n<p>In its current state, WPGlobus was designed for simple, static sites. For example, it could be useful for an event where attendees speak a handful of different languages. In this instance, the event staff can easily translate event details on the various pages to provide information for attendees in their own languages.</p>\n<p>For large sites and blogs, an expanded version of WPGlobus is in the works, which would integrate with multilingual plugins, such as WPML, qTranslate, or Polylang. Further down the road, Karpinsky hopes to integrate functionality that will assist e-commerce vendors:</p>\n<blockquote><p>When it comes to e-Commerce, additional challenges may arise. The Buyer, the Seller and the Site Administrator may all speak different languages. A user may have a non-trivial combination of residence, language and currency. Some countries are multilingual, so clicking on a country flag is not always enough. WPGlobus attempts to solve those problems. It’s a long way down the road but we are full of energy and optimism.</p></blockquote>\n<p>At the moment, the plugin is suitable for WordPress administrators who want to make their sites more global and are willing to provide their own translations. <a href="http://wordpress.org/plugins/wpglobus/" target="_blank">WPGlobus</a> is available from WordPress.org. I tested the plugin, and, although it&#8217;s still technically in beta, it works as advertised for providing your own translations on a small website.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Feb 2015 23:12:53 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:32;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:94:"WPTavern: New Plugin Detects Shared Terms in WordPress Ahead of Taxonomy Term Splitting in 4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39295";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:104:"http://wptavern.com/new-plugin-detects-shared-terms-in-wordpress-ahead-of-taxonomy-term-splitting-in-4-2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4866:"<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/split.jpg" rel="prettyphoto[39295]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/split.jpg?resize=1024%2C498" alt="photo credit: Utičnice - (license)" class="size-full wp-image-39352" /></a>photo credit: <a href="http://www.flickr.com/photos/11932978@N00/3560243700">Utičnice</a> &#8211; <a href="https://creativecommons.org/licenses/by-sa/2.0/">(license)</a>\n<p><a href="https://make.wordpress.org/core/2015/02/16/taxonomy-term-splitting-in-4-2-a-developer-guide/" target="_blank">Taxonomy term splitting</a> in WordPress 4.2 addresses <a href="https://core.trac.wordpress.org/ticket/5809" target="_blank">a seven-year-old bug</a> that occasionally posed a nuisance to developers. In the past, WordPress allowed terms to be shared between multiple taxonomies. This caused a problem where updating a shared term would change the others unintentionally.</p>\n<p>Boone Gorges&#8217; progress on this ticket marks a major milestone on the <a href="https://make.wordpress.org/core/2013/07/28/potential-roadmap-for-taxonomy-meta-and-post-relationships/" target="_blank">taxonomy component roadmap</a> that Andrew Nacin outlined in 2013. Splitting shared terms paves the way for more exciting improvements to taxonomy meta and post relationships in the future.</p>\n<p>Gorges explained how taxonomy term splitting will work in 4.2:</p>\n<blockquote><p>WordPress will detect whether the term is shared between multiple taxonomies, and if so, will create a new row in wp_terms for the updated term and change all necessary term_taxonomy associations. term_taxonomy_id will stay the same, but term_id will change. This is a case of a shared term being split into separate terms.</p>\n<p>In most cases, term splitting will go unnoticed. However, there are some plugins and themes that store term IDs as static data. In these cases, a changed term ID has the potential to cause various sorts of problems.</p></blockquote>\n<p>He identified 11 out of the top 100 plugins on WordPress.org that will be affected by this change in 4.2, due to the fact that they store term IDs independently in the database. Plugin authors are advised to update their extensions to facilitate split term ID migration, and Gorges offers an example in his <a href="https://make.wordpress.org/core/2015/02/16/taxonomy-term-splitting-in-4-2-a-developer-guide/" target="_blank">post on the Make/Core blog</a>.</p>\n<h3>Find out if your WordPress site is using any shared terms.</h3>\n<p>Shared terms are extremely uncommon. However, if you&#8217;re curious to find out if your site has any, the new <a href="https://github.com/jjeaton/wp-find-shared-terms" target="_blank">WP Find Shared Terms</a> plugin makes it easy to detect shared terms and will list them along with their associated taxonomies.</p>\n<p>After installing it, you can visit Tools > Find Shared Terms to see a list. I tested it and found that it works as advertised to detect shared terms, their IDs, taxonomies, and associated posts:</p>\n<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/shared-terms.jpg" rel="prettyphoto[39295]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/shared-terms.jpg?resize=934%2C402" alt="shared-terms" class="aligncenter size-full wp-image-39344" /></a></p>\n<p>The plugin was created by <a href="http://www.josheaton.org/" target="_blank">Josh Eaton</a>, Partner at <a href="http://reaktivstudios.com/" target="_blank">Reaktiv Studios</a>. Eaton developed it to help users plan ahead for upcoming taxonomy changes.</p>\n<p>&#8220;This may be helpful in determining whether you need to refactor any custom code that stores term IDs or upgrade any of your plugins prior to the 4.2 upgrade,&#8221; he <a href="http://www.josheaton.org/find-shared-taxonomy-terms-in-wordpress/" target="_blank">said</a>. &#8220;If your site doesn’t have any shared terms, and you’ve already upgraded to 4.1 then you’re in the clear!&#8221;</p>\n<p>Eaton said even if you detect that your site has shared terms, it doesn&#8217;t necessarily mean that you&#8217;ll have a problem updating. Detecting shared terms should prompt you to check that the plugins you&#8217;re using are properly updated for 4.2.</p>\n<p>It&#8217;s important to note that shared terms in WordPress 4.2 will not be retroactively split, but will only be split if the terms are updated in the dashboard, i.e. renamed, etc. Gorges advises that there are plans to force all shared terms to be split in a future release. It&#8217;s prudent to plan ahead now. If you suspect that you might have an issue with shared terms, install the <a href="https://github.com/jjeaton/wp-find-shared-terms" target="_blank">WP Find Shared Terms</a> plugin as a first step and monitor your WordPress plugins for updates ahead of the 4.2 release.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Feb 2015 19:28:07 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:33;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:59:"WPTavern: Do You Use The Sticky Posts Feature in WordPress?";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39326";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:68:"http://wptavern.com/do-you-use-the-sticky-posts-feature-in-wordpress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1191:"<p><a title="http://codex.wordpress.org/Sticky_Posts" href="http://codex.wordpress.org/Sticky_Posts">Sticky posts, </a>introduced in <a title="https://wordpress.org/news/2008/12/coltrane/" href="https://wordpress.org/news/2008/12/coltrane/">WordPress 2.7</a>, gives authors the ability to stick or feature posts to the front page. You&#8217;ll find the option in the publish meta box under the visibility section.</p>\n<a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/StickyPostsMetabox.png" rel="prettyphoto[39326]"><img class="size-full wp-image-39327" src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/StickyPostsMetabox.png?resize=277%2C384" alt="Where to find the Sticky Post option" /></a>Where to find the Sticky Post option\n<p>I&#8217;ve rarely found a use for sticky posts on my personal site and WP Tavern. However, I realize that in some WordPress themes, they&#8217;re an easy way to feature content. How many of you actively use sticky posts and if you do, tell us how in the comments. Creative uses may be featured in an upcoming article.</p>\nNote: There is a poll embedded within this post, please visit the site to participate in this post''s poll.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 20 Feb 2015 18:50:14 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:34;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:45:"WPTavern: GravityView is Now Public on GitHub";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39249";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"http://wptavern.com/gravityview-is-now-public-on-github";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3653:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/gravity-view.jpg" rel="prettyphoto[39249]"><img src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/07/gravity-view.jpg?resize=681%2C282" alt="gravity-view" class="aligncenter size-full wp-image-27113" /></a></p>\n<p>Six months ago, <a href="https://katz.co/" target="_blank">Zack Katz</a> and <a href="http://tinygod.pt/" target="_blank">Luis Godinho</a> launched <a href="http://wptavern.com/gravityview-launches-an-app-based-on-gravity-forms" target="_blank">GravityView</a>, an app based on the popular Gravity Forms plugin. It uses the <a href="http://wptavern.com/gravityforms-1-8-beta-released-introduces-api" target="_blank">Gravity Forms API</a> to display unique views of form data and entries on the frontend of WordPress.</p>\n<p>The main <a href="https://github.com/katzwebservices/GravityView" target="_blank">GravityView plugin</a> is now public on GitHub for anyone to access for free. The plugin&#8217;s repository was previously private and the code accessible only to GravityView&#8217;s paid customers, but co-founder Zack Katz recently decided to go another direction with the project.</p>\n<p>Katz told the Tavern that he was inspired by a <a href="https://mattreport.com/interview-matt-mullenweg/" target="_blank">discussion between Matt Medeiros and Matt Mullenweg</a> on ubiquity vs. scarcity in WordPress product businesses. Medeiros asked Mullenweg if he could offer any advice to WordPress startups that are looking to create a new product in this crowded space. Mullenweg replied:</p>\n<blockquote><p>The one pattern I see most right now that I think is not sustainable is, and it&#8217;s because it&#8217;s the easiest thing to do, is businesses that are built on a scarcity &#8211; the thing not being widely available. If you think about some of the coolest successes so far in WordPress, the Gravity Forms, some of the theme businesses, they are inherently predicated on the fact that you have to pay to access them. </p>\n<p>I&#8217;ve always been a fan of businesses that grow with ubiquity, that become more powerful the more ubiquitous they are, more valuable. WordPress itself is one of these. Akismet is one of these. Jetpack is certainly one of those. </p>\n<p>So if you think about turning that on its head, I think that&#8217;s what will create the sort of multi-generational businesses in the WordPress ecosystem. Even with themes, we&#8217;ve seen that themes are very cyclical. People who used to make the majority of their money from themes, like WooThemes, are now finding it&#8217;s an ever-decreasing percentage. You hear this across almost all the theme shops.</p></blockquote>\n<p>This advice runs counter to the way many WordPress product businesses have structured their revenue models. Rare exceptions like <a href="http://wptavern.com/pippin-williamson-on-building-a-community-around-your-open-source-project" target="_blank">Easy Digital Downloads</a>, <a href="http://wptavern.com/wooconf-the-first-ever-conference-dedicated-to-woocommerce-deemed-a-success" target="_blank">WooCommerce</a>, and other plugins where the base software is free, are shining examples where pushing for ubiquity instead of scarcity has truly paid off.</p>\n<p>The founders behind <a href="https://gravityview.co/" target="_blank">GravityView</a> are looking to find the same success within the Gravity Forms micro-ecosystem. With the base <a href="https://github.com/katzwebservices/GravityView" target="_blank">GravityView plugin</a> now available for free on GitHub, the company&#8217;s pricing is now only applicable to support and extensions.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Feb 2015 21:47:59 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:35;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:28:"Matt: USB History and Type C";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44672";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:44:"http://ma.tt/2015/02/usb-history-and-type-c/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:611:"<p>I enjoyed this Ars Technica look at <a href="http://arstechnica.com/gadgets/2015/01/usb-3-1-and-type-c-the-only-stuff-at-ces-that-everyone-is-going-to-use/">USB 3.1 and Type-C</a>, which is probably the cable/connection change people will notice the most over the next few years. (As I look with despair on my dozens of USB devices and cables.) I also dug their retrospective, <a href="http://arstechnica.com/gadgets/2014/08/a-brief-history-of-usb-what-it-replaced-and-what-has-failed-to-replace-it/">A brief history of USB, what it replaced, and what has failed to replace it</a>. Remember serial ports?</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Feb 2015 21:34:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:36;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"WPTavern: WPWeekly Episode 180 – Interview With Wade Foster, CEO and Co-founder of Zapier";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:44:"http://wptavern.com?p=39274&preview_id=39274";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:96:"http://wptavern.com/wpweekly-episode-180-interview-with-wade-foster-ceo-and-co-founder-of-zapier";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3217:"<p>In this week&#8217;s episode of WordPress Weekly, <a title="http://marcuscouch.com/" href="http://marcuscouch.com/">Marcus Couch</a> and I are joined by <a title="http://wadefoster.net/" href="http://wadefoster.net/">Wade Foster</a>, CEO and Co-founder of <a title="https://zapier.com/" href="https://zapier.com/">Zapier</a>. Zapier is a service that acts as an integration point for more than 300 applications. During the interview, Foster tells us how the company was founded, how Zapier works, and why it&#8217;s different from <a title="https://ifttt.com/" href="https://ifttt.com/">IFTTT</a> (If This Then That).</p>\n<p>We learn how Zaps are created and the importance of APIs. We also discuss the community surrounding Zapier and how important the community manager&#8217;s position is. Last but not least, Foster explains why the company is 100% distributed and tells us <a title="https://zapier.com/jobs/" href="https://zapier.com/jobs/">they&#8217;re hiring</a>.</p>\n<h2>Stories Discussed:</h2>\n<p><a title="http://wptavern.com/a-look-back-at-16-automattic-acquisitions-since-2007" href="http://wptavern.com/a-look-back-at-16-automattic-acquisitions-since-2007">A Look Back at 16 Automattic Acquisitions Since 2007</a><br />\n<a title="http://wptavern.com/tickets-on-sale-for-wordcamp-north-canton-oh-2015" href="http://wptavern.com/tickets-on-sale-for-wordcamp-north-canton-oh-2015">Tickets On Sale For WordCamp North Canton, OH, 2015</a><br />\n<a title="http://wptavern.com/wordpress-4-2-on-track-to-expand-core-support-for-emoji" href="http://wptavern.com/wordpress-4-2-on-track-to-expand-core-support-for-emoji">WordPress 4.2 on Track to Expand Core Support for Emoji</a></p>\n<h2>Plugins Picked By Marcus:</h2>\n<p><a title="https://wordpress.org/plugins/wp-image-shrinker/" href="https://wordpress.org/plugins/wp-image-shrinker/">WordPress Image Shrinker</a> lets users reduce image file sizes drastically while improving performance and Pagespeed score using the TinyPNG API within WordPress. Works for both PNGs and JPGs.</p>\n<p><a title="https://wordpress.org/plugins/there-can-be-only-one/" href="https://wordpress.org/plugins/there-can-be-only-one/">There Can Be Only One</a> ensures that there is only one published sticky post on the site at any given time.</p>\n<p><a title="https://wordpress.org/plugins/the-dude/" href="https://wordpress.org/plugins/the-dude/">The Dude</a> &#8211; When activated, you will randomly see a quote from &#8220;The Big Lebowski&#8221; in the upper right of your admin screen on every page.</p>\n<h2>WPWeekly Meta:</h2>\n<p><strong>Next Episode:</strong> Wednesday, February 25th 9:30 P.M. Eastern</p>\n<p><strong>Subscribe To WPWeekly Via Itunes: </strong><a href="https://itunes.apple.com/us/podcast/wordpress-weekly/id694849738" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via RSS: </strong><a href="http://www.wptavern.com/feed/podcast" target="_blank">Click here to subscribe</a></p>\n<p><strong>Subscribe To WPWeekly Via Stitcher Radio: </strong><a href="http://www.stitcher.com/podcast/wordpress-weekly-podcast?refid=stpr" target="_blank">Click here to subscribe</a></p>\n<p><strong>Listen To Episode #180:</strong><br />\n</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Feb 2015 21:31:48 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:37;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:76:"Post Status: Layers, by Obox, introduces a beautiful page building interface";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:30:"https://poststatus.com/?p=8814";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:41:"https://poststatus.com/layers-theme-obox/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:8510:"<p><a href="http://www.layerswp.com/">Layers</a> is a product <a href="http://blog.oboxthemes.com/from-today-the-way-you-build-wordpress-sites-will-change-say-hello-to-layers/">released by Obox</a> today that aims to integrate page building into the WordPress experience.</p>\n<p>Layers has the absolute best onboarding process I&#8217;ve seen in any tool like this. Also, the experience for creating new pages is very nice. While I have many disagreements with certain choices they made from a design perspective, overall I am very impressed with what they have done for the page building user experience.</p>\n<h3>Layers user experience sets a high bar</h3>\n<p>Layers has some very &#8220;wow&#8221; worthy features.</p>\n<p>I am very impressed with Obox&#8217;s onboarding. Upon theme activation, it takes you straight to a progressive walk-through that helps you learn about and setup Layers. It includes videos that operate like playable GIFs that show you what it&#8217;s referencing in each stage.</p>\n<p><img class="aligncenter size-large wp-image-8810" src="https://poststatus.com/wp-content/uploads/2015/02/layers-onboarding-752x364.png" alt="layers-onboarding" width="752" height="364" /></p>\n<p>The editor itself is also impressive. Layers are managed totally through the customizer. There is a single customizer tab that opens up panels for Layer widgets, which is very in tune with default WordPress.</p>\n<p><img class="aligncenter size-large wp-image-8809" src="https://poststatus.com/wp-content/uploads/2015/02/layers-edit-widget-752x351.png" alt="layers-edit-widget" width="752" height="351" /></p>\n<p>I call this method &#8220;going all in on the customizer&#8221;, which some people love and some people hate. I haven&#8217;t yet made up my mind, but I definitely like this better than many other methods I&#8217;ve seen &#8212; such as completely going outside of the WordPress UI.</p>\n<p>Within the WordPress page itself, it calls you to go to the Layers customizer to edit the content, but also has options for duplicating, importing, or exporting Layers templates.</p>\n<p><img class="aligncenter size-large wp-image-8813" src="https://poststatus.com/wp-content/uploads/2015/02/layers-page-752x475.png" alt="layers-page" width="752" height="475" /></p>\n<p>I like the way Layers makes getting started pretty easy. And I&#8217;m sure they will offer more templates going forward to help users quickly build pages that would otherwise require custom code.</p>\n<p>Obox is really stretching their legs on UX, and they are unabashedly prioritizing UX over everything else.</p>\n<p>David Perel &#8212; co-founder of Obox &#8212; tells me, &#8220;We believe in UX more than anything. Code is solveable; it just takes time. But user experience isn&#8217;t black and white.&#8221; I encouraged him to get more involved with core WordPress&#8217; various UX projects, as I completely agree with his sentiment.</p>\n<h3>Behind the curtains of Layers code</h3>\n<p>When I first looked under the hood of Layers, I was completely baffled by some of the code decisions. Saving a page in Layers does not save anything to the actual <code>post_content</code> in WordPress, nor even in meta. No, content is essentially grouped &#8212; across any page ID &#8212; and stored in the options table, depending on the type of module in use.</p>\n<p><img class="aligncenter size-large wp-image-8811" src="https://poststatus.com/wp-content/uploads/2015/02/layers-options.png" alt="layers-options" width="657" height="199" /></p>\n<p>So, if you view the options field of <code>widget_layers-widget-column</code>, you see this:</p>\n<p><img class="aligncenter size-large wp-image-8812" src="https://poststatus.com/wp-content/uploads/2015/02/layers-option-752x369.png" alt="layers-option" width="752" height="369" /></p>\n<p>The above image is content for any column module in the Layers theme. Meanwhile, the <code>post_content</code> for the page you create is completely empty.</p>\n<p>I was baffled by this architecture decision, as it means that I can never recover that content or use it again unless I&#8217;m using Layers. While the UX may fit well into the WordPress experience, the code seemed far, far from it; and it was a complete blocker for me. Then I talked to David Perel.</p>\n<p>Thank goodness he showed me their backup tool. Before that, this post looked <em>much, much</em> different.</p>\n<p><img class="aligncenter size-large wp-image-8820" src="https://poststatus.com/wp-content/uploads/2015/02/layers-backup-752x386.png" alt="layers-backup" width="752" height="386" /></p>\n<p>They are working to automatically port content to the proper field in the database, but for now you can manually do it, so that your markup at least is preserved for if you change themes. This methodology is in line with other responsible page building tools like The Theme Foundry&#8217;s <a title="Make and Make Plus, a drag and drop framework from The Theme Foundry" href="https://poststatus.com/make-drag-and-drop-theme-foundry/">Make theme</a>.</p>\n<p>I also talked to David about disappointing front-end performance. The theme loads 16 styles and scripts on every page, no matter what. Scripts like Masonry are loading &#8212; and more than one Masonry related script &#8212; whether the page uses Masonry or not. Those are just the scripts that are not conditional at all. On page inspection of some of their common templates, I was seeing well over 20 HTTP requests for styles and scripts. This simply should not be acceptable. This, at least, is fixable.</p>\n<p>After discussing this with David, they are already working to implement a fix that will combine many of these files, and conditionally load others. Layers is 1.0, so while I wish this wasn&#8217;t an afterthought, I&#8217;m glad they&#8217;re moving fast to improve.</p>\n<p>Overall, Obox is trying really hard on Layers; and they&#8217;ve shipped an impressive 1.0. They are doing active reviews still with some highly qualified WordPress developers whose names we all would know, and we can expect further improvements on performance down the line.</p>\n<h3>Where to get Layers, and notes on the monetization model</h3>\n<p><a href="http://www.layerswp.com/">Layers</a> is free, and on <a href="https://github.com/Obox/layerswp">Github</a>. They also have <a href="http://www.layerswp.com/developers/">developer</a> notes and general <a href="http://docs.layerswp.com/">docs</a> available. The Obox team is also working to get the product on WordPress.org, but there are some things they have to work out before they can.</p>\n<p>For monetization, they intend to charge for pre-built child themes and commercial extensions. For now, they want to get mass adoption for Layers &#8212; a tactic that has worked really well for others in the space.</p>\n<h3>Thoughts on page builders</h3>\n<p>I am definitely not on the bandwagon for page builders, though it seems the WordPress product world is. Where traditional options heavy theme sales have died away, page builders have risen from their ashes.</p>\n<p>I think anyone building a tool like this needs someone at their side forcing them to justify every feature &#8212; as it seems to me that most of these are giving way too many options in their products.</p>\n<p>I may have a follow-up post in my mind that I&#8217;ll probably publish sometime soon describing why I think it is a bad thing for page builders (in the context of theming) to be the future of the web.</p>\n<p>I&#8217;m afraid, however, that end user &#8220;demand&#8221; may make it so whether I like it or not; but it won&#8217;t be for their own good. I think there is a better way. I think &#8220;page building&#8221;, as it seems we&#8217;ve standardized the term, is broken when too many granular design elements are allowed. Instead, I&#8217;d like to see <em>content building</em>, where structured content can be created with a tool, but theming and styles are still left to, well, themes.</p>\n<p>Tools like <a href="http://aesopstoryengine.com/">Aesop</a> story engine, <a href="https://thethemefoundry.com/wordpress-themes/make/">Make</a>, and <a href="http://www.layerswp.com/">Layers</a> are all making what I consider valiant efforts at evolving complex content creation for WordPress. I don&#8217;t think anyone is quite nailing it, but I like where at least these three projects are going for the most part. I&#8217;m happy to see Obox release their vision of what content creation should be in WordPress, with Layers.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Feb 2015 20:46:29 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:15:"Brian Krogsgard";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:38;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:70:"WPTavern: BuddyPress Breaks One-Day Download Record with 2.2.1 Release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39240";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:80:"http://wptavern.com/buddypress-breaks-one-day-download-record-with-2-2-1-release";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3420:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/09/buddypress-logo-blue.png" rel="prettyphoto[39240]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2014/09/buddypress-logo-blue.png?resize=839%2C398" alt="buddypress-logo-blue" class="aligncenter size-full wp-image-30655" /></a></p>\n<p>The <a href="https://buddypress.org/2015/02/2015-buddypress-survey/" target="_blank">2015 BuddyPress Survey</a> is out on the heels of the <a href="https://buddypress.org/2015/02/buddypress-2-2-1/" target="_blank">2.2.1 maintenance release</a>. Yesterday, the plugin broke its one-day download record with more than 10,000 downloads in 24 hours.</p>\n<blockquote class="twitter-tweet" width="550"><p>The <a href="https://twitter.com/hashtag/BuddyPress?src=hash">#BuddyPress</a> 2.2.1 release (just) set our record one-day download record of ~10,107.</p>\n<p>&mdash; Paul Gibbs (@pgibbs) <a href="https://twitter.com/pgibbs/status/568309497879535616">February 19, 2015</a></p></blockquote>\n<p></p>\n<p>Over the past seven years, <a href="https://wordpress.org/plugins/buddypress/" target="_blank">BuddyPress</a> has been downloaded more than 2.6 million times. Major performance improvements during the past two releases <a href="http://wptavern.com/buddypress-2-0-ramps-up-performance-reduces-footprint-by-up-to-75" target="_blank">reduced the plugin’s footprint by up to 75%</a>. Contributors added new administration tools and improved translation fetching.</p>\n<p>If you want to help shape BuddyPress development in 2015, participating in the survey is one of the best ways to provide feedback to contributors. Last year&#8217;s survey demonstrated that the community is growing and users are eager to stay on top of updates. The <a href="https://buddypress.org/2014/03/2014-buddypress-survey-results/" target="_blank">2014 survey results</a> indicated that more than 50% of BuddyPress sites are on the latest versions of WordPress and BuddyPress.</p>\n<p>When asked to choose categories for feature improvements, respondents selected group enhancements, a new media component, activity stream, membership add-ons, performance, and a few others. Many of these requests were addressed during 2014 development on the plugin. <a href="http://wptavern.com/buddypress-2-2-to-add-custom-post-type-support-to-the-activity-stream" target="_blank">Custom post types were added to the activity stream</a>, performance was enhanced beyond user expectations, and a new<a href="http://wptavern.com/buddypress-2-2-on-track-to-provide-a-basic-member-type-api" target="_blank"> member type API</a> was introduced earlier this year. Contributors also began working on a <a href="http://wptavern.com/buddypress-to-adopt-features-as-plugins-model-to-develop-new-media-component" target="_blank">media component as a feature plugin</a>.</p>\n<p>Last year, the survey captured feedback from 338 developers in 52 countries, and it would be helpful to get an even wider range of results this time around. The <a href="https://buddypress.org/2015/02/2015-buddypress-survey/" target="_blank">survey</a> takes approximately 20 minute of your time, but, as you can see from last year&#8217;s development, contributors are eager to act on user feedback. Your participation will give the BP core team an idea of the kinds of BuddyPress sites that developers are building and the features that you want to see prioritized in 2015.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Feb 2015 19:41:10 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:39;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:49:"WPTavern: WordPress 4.1.1 Released, Fixes 21 Bugs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39243";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"http://wptavern.com/wordpress-4-1-1-released-fixes-21-bugs";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2517:"<p>WordPress 4.1.1 <a title="https://wordpress.org/news/2015/02/wordpress-4-1-1/" href="https://wordpress.org/news/2015/02/wordpress-4-1-1/">is available</a> and fixes 21 bugs. According to Andrew Nacin who published the announcement, 4.1 was a smooth-sailing release and has been downloaded over 14 million times within the last two months. One of the bugs fixed<span class="s1"> is an issue where a tag and a category with the same name could get muddled and prevent each other from being updated. </span></p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/WP41DownloadCount.png" rel="prettyphoto[39243]"><img class="size-full wp-image-39245" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/WP41DownloadCount.png?resize=956%2C371" alt="WordPress 4.1 Download Count" /></a>WordPress 4.1 Download Count\n<p>Updates are slowly rolling out and if your site is configured to receive automatic updates, it should update within the next 72 hours. If not, visit <strong>Dashboard → Updates</strong> and click <strong>Update Now</strong> to manually trigger the update routine.</p>\n<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/01/KimParsell.png" rel="prettyphoto[39243]"><img class="size-full wp-image-36619" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/01/KimParsell.png?resize=655%2C418" alt="WordCamp San Francisco 2014 By Sheri Bigelow" /></a>WordCamp San Francisco 2014 By Sheri Bigelow\n<p>There are a handful of contributors to this release, but the one that sticks out is Kim Parsell. She <a title="https://core.trac.wordpress.org/ticket/30791" href="https://core.trac.wordpress.org/ticket/30791">helped fix an issue</a> where an old image file needed to be removed from core. Reading the release notes and coming across Kim&#8217;s name generates a rush of emotions as I remember the events surrounding New Years day. For those who don&#8217;t know, <a title="http://wptavern.com/kim-parsell-affectionately-known-as-wpmom-passes-away" href="http://wptavern.com/kim-parsell-affectionately-known-as-wpmom-passes-away">Kim passed away</a> earlier this year. In memory of Kim, The WordPress Foundation has <a title="http://wptavern.com/the-wordpress-foundation-creates-a-traveling-scholarship-in-memory-of-kim-parsell" href="http://wptavern.com/the-wordpress-foundation-creates-a-traveling-scholarship-in-memory-of-kim-parsell">created a traveling scholarship</a>.</p>\n<p>I think Nacin speaks for many when he says, &#8220;We miss you, Kim.&#8221;</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Feb 2015 01:04:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:40;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:43:"Matt: 7 Principles of Rich Web Applications";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44680";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"http://ma.tt/2015/02/7-principles-of-rich-web-applications/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:165:"<p>Automattician Guillermo Rauch writes on the <a href="http://rauchg.com/2014/7-principles-of-rich-web-applications/">7 Principles of Rich Web Applications</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 19 Feb 2015 00:50:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:41;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:73:"WPTavern: Customizer Theme Switcher Approved for Merge Into WordPress 4.2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39224";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:83:"http://wptavern.com/customizer-theme-switcher-approved-for-merge-into-wordpress-4-2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3367:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/customizer-theme-switcher.jpg" rel="prettyphoto[39224]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/customizer-theme-switcher.jpg?resize=1025%2C473" alt="customizer-theme-switcher" class="aligncenter size-full wp-image-38931" /></a></p>\n<p>The <a href="http://wptavern.com/customizer-theme-switcher-officially-proposed-for-wordpress-4-2" target="_blank">Customizer Theme Switcher</a> feature plugin was approved for merge today during the regularly scheduled WordPress core development meeting. Lead developers and contributors in attendance agreed that there are no major blocking issues.</p>\n<p>The Customizer Theme Switcher in WordPress 4.2 will make it possible for users to browse through themes that have already been installed and activate a new one on the frontend via the customizer. The idea is to unify the UI designated for customizing a site to create a more consistent experience for users on the frontend. In the future, the theme installation process will also be added to the customizer.</p>\n<p>Many users initially had concerns about adding this feature to the narrow customizer UI. &#8220;I would like to see a full-screen iteration so it doesn&#8217;t feel like I am looking through a port hole,&#8221; Andrew Nacin said during the development meeting. His comment echoes the concerns of others who have doubts about browsing themes through the small customizer window.</p>\n<p>In response to WP Tavern <a href="http://wptavern.com/customizer-theme-switcher-officially-proposed-for-wordpress-4-2#comment-64073" target="_blank">commenters who oppose the new feature</a>, project leader Nick Halsey encouraged users to examine how the customizer will force developers to simplify their UIs:</p>\n<blockquote><p>I’ll also point out for everyone that while the Customizer controls window is fairly small, this is a balance with providing a reasonably sized preview of the front-end, and the narrow controls UI window is mobile-first out-of-the-box. Being forced to work with less real estate in the customizer controls forces developers to simplify their UIs and make things easier to use. If you’re shoving hundreds of options into the Customizer, you’re creating something that’s just as bad of an experience to use as if you’d done that in a custom admin screen.</p></blockquote>\n<p>In response to those concerned about the next step of adding the theme installation process to the customizer, Halsey <a href="http://wptavern.com/customizer-theme-switcher-officially-proposed-for-wordpress-4-2#comment-64035" target="_blank">assured</a> users that they are planning on making the customizer controls area almost full-width. This will ensure a more pleasant experience while selecting a theme from a large collection. The theme switcher feature added to WordPress 4.2 will happen in the more narrow customizer pane, since it is most often limited to a small collection of already installed themes.</p>\n<p>The <a href="https://wordpress.org/plugins/press-this/" target="_blank">Press This Revamp project</a> is also currently under consideration for merge into WordPress 4.2 and contributors will be testing it over the next week. The merge window runs through next Wednesday, followed by two weeks of iteration before the first beta is expected.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Feb 2015 22:09:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:42;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:78:"WPTavern: CMS Commander’s WordPress Site Creation Tool is Available for Free";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39187";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:85:"http://wptavern.com/cms-commanders-wordpress-site-creation-tool-is-available-for-free";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2784:"<p>CMS Commander <a title="http://cmscommander.com/create-pre-configured-wp-blogs-free/" href="http://cmscommander.com/create-pre-configured-wp-blogs-free/">has announced</a> that their new WordPress site creation tool will be <a title="https://cmscommander.com/members/signup/index/c/trial" href="https://cmscommander.com/members/signup/index/c/trial">free of charge</a>. CMS Commander specializes in helping users manage WordPress sites. The tool gives users the ability to deploy new WordPress sites to any host via FTP with pre-configured settings and pre-installed plugins.</p>\n<p>WordPress is famous for its five-minute install, but users generally need to configure a few settings before they can publish their first post. CMS Commander has several settings you can pre-configure including: permalinks, deleting default content, and disabling the theme and plugin file editors.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/CMSCommanderPreconfigureSettings.jpg" rel="prettyphoto[39187]"><img class="size-full wp-image-39218" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/CMSCommanderPreconfigureSettings.jpg?resize=700%2C196" alt="CMS Commander Pre-configured Settings" /></a>CMS Commander Pre-configured Settings\n<p>You can also add plugins from the <a title="https://wordpress.org/plugins/" href="https://wordpress.org/plugins/">WordPress plugin directory</a> that will be installed and activated as part of the installation process.</p>\n<p>During the beta testing period, premium users created more than 200 websites allowing the team to fix numerous bugs. As a result of the beta testing period, CMS Commander added several other <a title="http://cmscommander.com/improved-site-creation-backup-features/" href="http://cmscommander.com/improved-site-creation-backup-features/">pre-configured settings</a>. The only feature not available to free users is the ability to add commercial plugins.</p>\n<h2>Removing Friction</h2>\n<p>The typical way to install WordPress on a webhost is to visit WordPress.org, download a zip file, extract the contents, and upload it to a webserver. This is a process that some find difficult, especially if FTP is as an unfamiliar concept or they&#8217;re not familiar with MySQL databases.</p>\n<p>CMS Commander and other tools like it are helping to bridge the gap between the install and set up process. This allows users to more quickly get to the publishing parts of WordPress. However, if WordPress is <a title="http://wptavern.com/how-important-is-jetpack-on-wordpress-road-to-50-market-share" href="http://wptavern.com/how-important-is-jetpack-on-wordpress-road-to-50-market-share">to reach 50% marketshare</a>, it needs to find a way to remove this friction instead of relying on third-parties.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Feb 2015 21:36:26 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:43;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:79:"WPTavern: Join the Discussion on Defining Network Types for WordPress Multisite";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39193";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"http://wptavern.com/join-the-discussion-on-defining-network-types-for-wordpress-multisite";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:3760:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/mailboxes.jpg" rel="prettyphoto[39193]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/mailboxes.jpg?resize=1024%2C496" alt="mailboxes" class="aligncenter size-full wp-image-39214" /></a></p>\n<p>Towards the end of 2013, WordPress lead developer Andrew Nacin outlined a <a href="https://make.wordpress.org/core/2013/10/06/potential-roadmap-for-multisite/" target="_blank">potential roadmap for multisite</a> that would address a number of long-standing questions regarding network setup and organization.</p>\n<p>When multisite, formerly known as WPMU, was first introduced, building large blogging networks was the primary use case. Over the years, the uses for multisite have evolved to encompass those who use it to facilitate the management of multiple, and sometimes unrelated, sites. In the future, contributors want to add the option for super admins to select from a list of pre-configured network types when installing a new network.</p>\n<p>The <a href="https://wordpress.slack.com/archives/core-multisite/p1424209234000834" target="_blank">discussion</a> in the #core-multisite room on Slack this week centered around identifying and defining different network types.  The terms Open/Closed and Trusted/Untrusted were identified as possibilities, but nothing has been set in stone, as both options are ambiguous and confusing.</p>\n<p>Jeremy Felt <a href="https://make.wordpress.org/core/2015/02/18/multisite-objective-defining-network-types/" target="_blank">summarized</a> the questions that need to be answered before multisite development can move forward:</p>\n<ul>\n<li>What network types are there?</li>\n<li>Which of these should be pre-configured in core?</li>\n<li>What are possible ways of managing these network types?</li>\n<li>What kind of experience can we introduce during network installation that makes this simple.</li>\n</ul>\n<p>Multisite is used in a wide variety of ways, i.e. networks where super admins control everything, blogging networks where site admins have limited capabilities, private networks with closed registration and a set of trusted admins, and many more. It&#8217;s difficult to accurately nail down a small set of pre-configured network types that will be suitable for any new installation.</p>\n<p>One interesting idea, <a href="https://make.wordpress.org/core/2015/02/18/multisite-objective-defining-network-types/#comment-25248" target="_blank">proposed by Mike Schinkel</a>, is to allow developers to register a custom network type in order to better fit unique cases:</p>\n<blockquote><p>It would seem the first step, then, would be to identify and document all these potential configuration options at an atomic level. From there we could then “map” Network Types to their associated configuration settings.</p>\n<p>Even better, Network Types could then be registered just like how Post Types, Post Statuses, and Taxonomies are registered which would make missing out on an important use-case in core much less problematic.</p></blockquote>\n<p>Even with the option to register custom network types, WordPress core will still need to identify the most common ones to include in its set of pre-configured options. Contributors have been discussing this issue over the span of several months in order to find the best way forward.</p>\n<p>If you want to join in the conversation regarding the future of multisite, particularly as it relates to defining network types, make sure to leave your feedback on the recent Make/Core post: <a href="https://make.wordpress.org/core/tag/multisite/" target="_blank">Multisite Objective: Defining Network Types</a>. This will be the main topic of next week’s multisite office hours.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Feb 2015 18:47:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:44;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:79:"WPTavern: Create Interactive Images in WordPress with the Draw Attention Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39165";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:89:"http://wptavern.com/create-interactive-images-in-wordpress-with-the-draw-attention-plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:6844:"<p><a title="https://wordpress.org/plugins/draw-attention/" href="https://wordpress.org/plugins/draw-attention/">Draw Attention</a> is a new plugin created by <a title="http://tylerdigital.com/" href="http://tylerdigital.com/">Tyler Digital,</a> that makes it easy to create interactive images in WordPress. Some common use cases include: floor plans for trade shows, real estate properties, and seating charts. Nathan Tyler explains the inspiration behind the plugin:</p>\n<blockquote><p>Natalie and I have built custom solutions for clients for trade shows, real estate, floor plans, etc. and we&#8217;re always frustrated by the process. We wanted to build an elegant solution in WordPress that would display well on all devices and would be easy for clients and end-users to maintain themselves.</p></blockquote>\n<h2>How it Works</h2>\n<p>After installation, a new item labeled Draw Attention is added to the admin menu. Similar to a post, the edit image screen has an area to give images a title. There&#8217;s also a series of options to configure the highlight and info box styling. Users can add an image via upload or through the WordPress media library.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/DrawAttentionEditImageScreen.png" rel="prettyphoto[39165]"><img class="size-full wp-image-39177" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/DrawAttentionEditImageScreen.png?resize=1025%2C405" alt="Edit Image Screen" /></a>Edit image screen for Draw Attention\n<p>Once an image is added, you&#8217;ll see it near the bottom of the page within the Hotspot Areas section. From here, users can draw interactive hot spots on an image simply by clicking on the portion you want to highlight. It took a bit of practice, but I was able to make the entire logo a hotspot by clicking the edges of the circle. Hot spots can be manipulated by clicking and dragging on the square markers.</p>\n<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/DrawAttentionHotSpots.png" rel="prettyphoto[39165]"><img class="size-full wp-image-39178" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/DrawAttentionHotSpots.png?resize=1025%2C701" alt="Draw Attention Hot Spots" /></a>Draw Attention hot spots\n<p>One of the biggest drawbacks I discovered during testing, is that there&#8217;s no undo button. If you make a mistake, you need to select the clear button and start over. Depending on the size of the hot spot, it&#8217;s a frustrating user experience. Hot spots are able to have titles of their own as well as a description. You can also add a detailed image which will display above the more info box. Last but not least, you can remove the hot spot area from the image.</p>\n<a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/DrawAttentionHotSpotsConfig.png" rel="prettyphoto[39165]"><img class="size-full wp-image-39179" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2015/02/DrawAttentionHotSpotsConfig.png?resize=1002%2C493" alt="DrawAttentionHotSpotConfiguration" /></a>Draw Attention hot spot configuration\n<p>Here&#8217;s an example of what an interactive image looks like on the WordPress frontend. What you can&#8217;t see from the screenshot, is that clicking on a hot spot displays the image title and description above the image using <a title="http://en.wikipedia.org/wiki/Ajax_%28programming%29" href="http://en.wikipedia.org/wiki/Ajax_%28programming%29">Ajax</a>. In order to display interactive images, the <strong>[drawattention]</strong> short code needs to be inserted into a post or page. The styling options as seen in the first screenshot control how the title and description display on the frontend. It&#8217;s also worth noting that interactive images are responsive, so they&#8217;ll look good on mobile devices.</p>\n<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/DrawAttentionHotSpotsWordPressFrontend.png" rel="prettyphoto[39165]"><img class="size-full wp-image-39180" src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/DrawAttentionHotSpotsWordPressFrontend.png?resize=1025%2C810" alt="Draw Attention Hot Spots WordPress Frontend" /></a>How hot spots look on the WordPress frontend\n<h2>Needs Improvements</h2>\n<p>Draw Attention is a neat plugin that makes it easy to create hot spots on images. However, it&#8217;s the first version and it shows. In future versions, I&#8217;d like to see a number of things addressed.</p>\n<ol>\n<li>I&#8217;m confused as to the order of options displayed in the backend as styling options are displayed above image editing. I think these option panels should be reversed.</li>\n<li>The default highlight and info box styles didn&#8217;t display well on the testing environment. I&#8217;d like to see these options inherit colors that already exist within the theme.</li>\n<li>As mentioned previously, there needs to be an undo button as starting over is a frustrating experience.</li>\n<li>Setting the opacity to 55% displays a value of 55.00000000000001%</li>\n<li>Speaking of styling colors, it&#8217;s frustrating to edit display settings, click update, then refresh the post or page to see if the changes are ok. I&#8217;d like to see some sort of visual preview or something like the customizer so that I can configure the colors and see the changes live before I apply them.</li>\n<li>Instead of displaying the short code I need to use in a small, somewhat hidden meta box, I&#8217;d like to see a button in the visual post editor to make it easier to add to a post or page.</li>\n</ol>\n<p>One of the last remaining issues I have with Draw Attention is that users are limited to adding and editing <strong>one image</strong>. That&#8217;s because there&#8217;s a <a title="http://tylerdigital.com/products/draw-attention/" href="http://tylerdigital.com/products/draw-attention/">pro version</a> of the plugin available for $49 that contains the following additional features:</p>\n<ul>\n<li>Ability to create more than one interactive image</li>\n<li>Unlimited number of hot spot areas for each image</li>\n<li>20 different preset color schemes</li>\n<li>Custom layout options</li>\n</ul>\n<p>Limiting the plugin to one image gives users an idea on how it works, but I&#8217;d bump the limit to three or five. Users would then have more of an opportunity to discover cool uses cases and it might lead to more sales.</p>\n<p>With that said, it performed without any issues on WordPress 4.2 alpha. Tyler says they have plenty of items on their to-do list, &#8220;We have a bunch of items still on our to-do list, and we will be releasing regular updates for the next couple months based on community feedback.&#8221; If some of the issues are addressed and the image limits are raised, I think Draw Attention will be a nice solution for creating interactive images in WordPress.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 18 Feb 2015 05:48:25 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:45;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:85:"WPTavern: WordCamp Prague 2015 Aims to Bring Central European Tech Community Together";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39157";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:95:"http://wptavern.com/wordcamp-prague-2015-aims-to-bring-central-european-tech-community-together";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2983:"<p><a href="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/prague.jpg" rel="prettyphoto[39157]"><img src="http://i2.wp.com/wptavern.com/wp-content/uploads/2015/02/prague.jpg?resize=1025%2C498" alt="prague" class="aligncenter size-full wp-image-39158" /></a></p>\n<p><a href="http://prague.wordcamp.org/2015/" target="_blank">WordCamp Prague</a> is gearing up for its second edition on February 28, 2015. The event will be held at the <a href="http://ozs.vse.cz/english/" target="_blank">University of Economics</a>. Organizers are planning two tracks of presentations: one for end users and bloggers and the other for WordPress developers and programmers.</p>\n<p>Co-organizer <a href="https://twitter.com/vladamusilek" target="_blank">Vladislav Musílek</a> said that the team is expecting 300-350 attendees. &#8220;The Czech WordPress community is young and we started meeting in the summer of 2013,&#8221; he said. &#8220;There were three small meetups with a maximum of 30 attendees, but our first WordCamp Prague in 2014 had 230 attendees.&#8221;</p>\n<p>Musílek is one of three local organizers who decided to hold a larger meetup every three months, with smaller ones taking place monthly. The three meetups held in 2014 attracted 130-150 attendees each, and sessions are published on <a href="https://www.youtube.com/channel/UCUj8Epquc13YwVvnAzyI9Vg" target="_blank">YouTube</a>.</p>\n<p>Although the Czech WordPress community is relatively small, it is situated in central Europe with easy access for attendees from other countries. &#8220;We invited developers from other countries, because modern WordPress trends are what is missing in the Czech community,&#8221; Musílek said.</p>\n<p>&#8220;But what is unique is Prague, a beautiful city in the center, with 23 European capital cities not more than 1000 km away, i.e. Vienna, Berlin, Brussels, Copenhagen, Paris, Rome, Warsaw and more.&#8221;</p>\n<p>Musílek said the organizers&#8217; goal was to create a WordCamp not only for the Czech community but for the greater central European development community. Many of the sessions cater to developers, and Musílek said this is intentional. &#8220;I am a developer and I wanted to invite speakers who are working with modern and trending technologies that we&#8217;ll be using for development in the near future,&#8221; he said.</p>\n<p>WordCamp Prague&#8217;s schedule will host 16 sessions, including nine in English and seven in Czech. There will also be two workshops held in English and two in Czech. The variety of languages helps to make the event more accessible to international attendees. View the event&#8217;s <a href="http://prague.wordcamp.org/2015/program/" target="_blank">schedule</a> for more details. Tickets are still available for any attendees who decide to join at the last minute. If you&#8217;re still on the fence, check out the promotion video the organizers created for the upcoming event:</p>\n<p><span class="embed-youtube"></span></p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Feb 2015 22:24:51 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:46;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:30:"Matt: Developer Employment Act";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:21:"http://ma.tt/?p=44697";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"http://ma.tt/2015/02/developer-employment-act/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:689:"<blockquote><p>One theory I have is that there&#8217;s some secret &#8220;developer full-time employment act&#8221; that means these programmers have to do something even if it&#8217;s just replicating work that&#8217;s already been done. Kind of like New Jersey where every gas station is full serve (that had to be some full employment gambit back in the day).</p></blockquote>\n<p>Sounds like something that could be written today about Vox, Buzzfeed, Gawker, or any of the quixotic CMS projects at Washington Post, NY Times, Conde Nast, et al, but it was <a href="http://www.zdnet.com/article/wordpress-vs-an-army-of-clunky-content-management-systems/">actually written in 2007</a>.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Feb 2015 21:50:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:4:"Matt";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:47;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:65:"WPTavern: WordPress 4.2 on Track to Expand Core Support for Emoji";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39129";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"http://wptavern.com/wordpress-4-2-on-track-to-expand-core-support-for-emoji";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:4194:"<a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/Twemoji.jpg" rel="prettyphoto[39129]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/Twemoji.jpg?resize=700%2C320" alt="photo credit: Twitter.com" class="size-full wp-image-39143" /></a>photo credit: <a href="https://blog.twitter.com/2014/open-sourcing-twitter-emoji-for-everyone">Twitter.com</a>\n<p>Emoji characters were born in Japan in the late 90&#8217;s but took nearly a decade to break into global usage. They entered popular culture full force when select emoji character sets were incorporated into Unicode in 2010. Since that time, emoji popularity has grown, and there&#8217;s no denying that they are mainstream and here to stay.</p>\n<p>The good news is that better support for emoji will soon find its way into WordPress core. Last week, core contributor Gary Pendergast, unveiled <a href="https://make.wordpress.org/core/2015/02/13/emoji-chat-meeting-notes-february-12-2015/" target="_blank">a roadmap for better emoji support</a> and detailed the current state of the <a href="https://github.com/pento/x1f4a9" target="_blank">feature plugin</a>.</p>\n<p>Pendergast has spent quite a bit of time immersing himself in the history of emoji and the requirements for their support. Pendergast filled contributors in on the status of WordPress core support for emoji:</p>\n<blockquote><p>As of <a href="https://core.trac.wordpress.org/changeset/31349" target="_blank">r31349</a>, WordPress partially supports emoji. ~60% of WordPress sites are running MySQL 5.5 or later (so can be upgraded to store emoji), and ~40% of browsers natively support emoji. Emoji are a wildly popular method of communication, so we can expect them to be heavily used as soon as they’re available. The problem is, 60%/40% means a really bad experience for a huge number of our users, who’ll try to use emoji, and fail.</p></blockquote>\n<p>Getting more WordPress sites to run on  MySQL 5.5+ would be no small task, so the emoji feature plugin is working around this by adding a wp_encode_emoji() function to turn emoji characters into HTML entities for sites using the utf8 character set. This gets the remaining ~40% of sites nearly all the way there.</p>\n<h3>Twemoji Fallback</h3>\n<p>The feature plugin proposes that WordPress adopt the <a href="https://github.com/twitter/twemoji" target="_blank">Twemoji</a> image set as a fallback for browsers that don&#8217;t display emoji natively, which reduces the extra load, especially for mobile browsers. Twitter open sourced its Twemoji 872 character image set last November, simultaneously partnering with Automattic to <a href="http://wptavern.com/wordpress-com-adds-emoji-support-coming-soon-to-jetpack" target="_blank">bring emoji to WordPress.com users</a>.</p>\n<p>Pendergast reports that the plugin is close to being finished, with only a handful of remaining <a href="https://github.com/pento/x1f4a9/issues" target="_blank">bugs to discuss</a>. The plugin has already been briefly reviewed by the accessibility team and requires only a few minor changes. The issue of where to host the images is still under discussion, and Pendergast and contributors are considering different options:</p>\n<blockquote><p>They’re currently hosted on WP.com’s CDN, but we’re investigating other options for where to host them, probably the W.org CDN. Given that the wp-admin Dashboard also loads things from Google, I have no problem with hosting them on an external CDN. There will naturally be a filter on the URL, to allow local hosting for sites that don’t want to use the CDN.</p></blockquote>\n<p>WordPress is on track to provide more comprehensive support for emoji in the near future. Pendergast says the project is on target for the upcoming 4.2 release.</p>\n<p>In the meantime, if you&#8217;d like to add emoji support to your self-hosted WordPress site, <a href="http://wptavern.com/new-plugin-adds-open-source-emoji-one-support-to-wordpress" target="_blank">WP Emoji One</a> is a good option. The plugin was the first to bring support for the open source <a href="http://emojione.com/" target="_blank">Emoji One</a> character set to WordPress posts and pages.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Feb 2015 21:29:00 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:48;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:74:"WPTavern: This Week On WPWeekly: Wade Foster, Co-founder and CEO of Zapier";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39096";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:82:"http://wptavern.com/this-week-on-wpweekly-wade-foster-co-founder-and-ceo-of-zapier";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:1501:"<p><a href="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/06/ZapierFeaturedImage.png" rel="prettyphoto[39096]"><img class="aligncenter size-full wp-image-24443" src="http://i1.wp.com/wptavern.com/wp-content/uploads/2014/06/ZapierFeaturedImage.png?resize=650%2C200" alt="Zapier Featured Image" /></a></p>\n<p>This Wednesday at 9:30 PM Eastern on <a title="http://wptavern.com/wordpress-weekly" href="http://wptavern.com/wordpress-weekly">WordPress Weekly</a>, Marcus Couch and I will be joined by Wade Foster, Co-founder and CEO of <a title="https://zapier.com/" href="https://zapier.com/">Zapier</a>. Zapier is a service that acts as an integration point for more than 300 applications. <a title="https://zapier.com/zapbook/gravity-forms/" href="https://zapier.com/zapbook/gravity-forms/">GravityForms</a>, <a title="http://wptavern.com/wp-remote-now-supports-zapier" href="http://wptavern.com/wp-remote-now-supports-zapier">WP Remote</a>, and <a title="http://www.woothemes.com/products/woocommerce-zapier/" href="http://www.woothemes.com/products/woocommerce-zapier/">WooCommerce</a> are just a few examples of popular WordPress plugins and services that support Zapier. The following video explains how it works.</p>\n<p><span class="embed-youtube"></span></p>\n<p>We&#8217;re going to discuss the company&#8217;s history, how the service works, and interesting integrations people are creating with it. If you have questions you&#8217;d like us to ask Foster, submit them in the comments.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Feb 2015 02:30:01 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Jeff Chandler";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:49;a:6:{s:4:"data";s:13:"\n	\n	\n	\n	\n	\n	\n";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:52:"WPTavern: The Dude: A Fun Alternative to Hello Dolly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:28:"http://wptavern.com/?p=39104";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:61:"http://wptavern.com/the-dude-a-fun-alternative-to-hello-dolly";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:2280:"<p><a href="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/the-dude.jpg" rel="prettyphoto[39104]"><img src="http://i0.wp.com/wptavern.com/wp-content/uploads/2015/02/the-dude.jpg?resize=670%2C290" alt="the-dude" class="aligncenter size-full wp-image-39110" /></a></p>\n<p>This isn&#8217;t just a plugin, man. It&#8217;s <a href="https://wordpress.org/plugins/the-dude/" target="_blank">The Dude</a>, so that&#8217;s what you call it. That, or His Dudeness… Duder… or El Duderino, if, you know, you&#8217;re not into the whole brevity thing.</p>\n<p>It symbolizes the realization of an entire modern lazy hippie bowling amateur private investigator generation summed up in two words spoken most famously by Jeff Bridges.</p>\n<p>The Dude was created by WordPress developer <a href="http://kosvrouvas.com/" target="_blank">Kostas Vrouvas</a>, who seemed to have a bit of free time on his hands. It takes inspiration (and some code) from Matt Mullenweg&#8217;s <a href="https://wordpress.org/plugins/hello-dolly/" target="_blank">Hello Dolly</a> plugin, replacing the musical&#8217;s lyrics at the top of admin screens with quotes from <a href="http://www.imdb.com/title/tt0118715/">The Big Lebowski</a>.</p>\n<p>We tested the plugin and found that it works flawlessly. <a href="https://www.youtube.com/watch?v=VLR_TDO0FTg" target="_blank">The royal &#8220;we&#8221;</a>. You know, the editorial&#8230;</p>\n<p>Some of the random Lebowski quotes so far include:</p>\n<ul>\n<li>Walter, he peed on my rug!</li>\n<li>And, you know, he’s got emotional problems, man.</li>\n<li>Well, that&#8217;s like, your opinion, man.</li>\n<li>Also, my rug was stolen.</li>\n<li>You&#8217;re Mr. Lebowski. I&#8217;m the Dude.</li>\n<li>Oh, the usual. I bowl. Drive around. The occasional acid flashback.</li>\n<li>Mr. Treehorn treats objects like women, man.</li>\n<li>Hey, careful, man, there&#8217;s a beverage here!</li>\n</ul>\n<p>Amusing, yes? So if you prefer <a href="http://wptavern.com/ https://www.youtube.com/watch?v=sft3VHxru2s" target="_blank">Creedence</a> to Louis Armstrong, then you may want to mix yourself a white russian and activate <a href="https://wordpress.org/plugins/the-dude/" target="_blank">The Dude</a> on your WordPress blog.</p>\n<p>It really ties the site together.</p>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 17 Feb 2015 00:53:52 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Sarah Gooding";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:10:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 02 Mar 2015 05:25:23 GMT";s:12:"content-type";s:8:"text/xml";s:14:"content-length";s:6:"219831";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:13:"last-modified";s:29:"Mon, 02 Mar 2015 05:00:13 GMT";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";s:13:"accept-ranges";s:5:"bytes";}s:5:"build";s:14:"20150105054306";}', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1826, '_site_transient_timeout_browser_f4146a70cbbacb460a0479387a0fe28d', '1425878718', 'yes'),
(1808, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:1:{i:0;O:8:"stdClass":10:{s:8:"response";s:6:"latest";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.1.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.1.1.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.1.1-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.1.1-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.1.1";s:7:"version";s:5:"4.1.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1425288505;s:15:"version_checked";s:5:"4.1.1";s:12:"translations";a:0:{}}', 'yes'),
(1559, '_site_transient_timeout_browser_cd94554e3128d66afcbaab0c67c94302', '1423631786', 'yes'),
(1560, '_site_transient_browser_cd94554e3128d66afcbaab0c67c94302', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"35.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1746, '_site_transient_timeout_browser_3b86681b3946b1b0a162a2ab8347102e', '1424667670', 'yes'),
(1747, '_site_transient_browser_3b86681b3946b1b0a162a2ab8347102e', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"40.0.2214.111";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1836, '_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109', '1425317125', 'no'),
(1837, '_transient_feed_b9388c83948825c1edaef0d856b7b109', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n	\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:72:"\n		\n		\n		\n		\n		\n		\n				\n\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n		\n\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:45:"https://wordpress.org/plugins/browse/popular/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:39:"WordPress Plugins » View: Most Popular";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"en-US";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 02 Mar 2015 05:08:20 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:25:"http://bbpress.org/?v=1.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:15:{i:0;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:22:"WordPress SEO by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:54:"https://wordpress.org/plugins/wordpress-seo/#post-8321";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 Jan 2009 20:34:44 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"8321@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:131:"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using Yoast&#039;s WordPress SEO plugin.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:24:"Jetpack by WordPress.com";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:49:"https://wordpress.org/plugins/jetpack/#post-23862";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 Jan 2011 02:21:38 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"23862@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:28:"Your WordPress, Streamlined.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Tim Moore";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:14:"Contact Form 7";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:55:"https://wordpress.org/plugins/contact-form-7/#post-2141";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 02 Aug 2007 12:45:03 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2141@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:54:"Just another contact form plugin. Simple but flexible.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:16:"Takayuki Miyoshi";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:3;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"WooCommerce - excelling eCommerce";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/woocommerce/#post-29860";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 05 Sep 2011 08:13:36 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"29860@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:97:"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"WooThemes";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:4;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:7:"Akismet";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:46:"https://wordpress.org/plugins/akismet/#post-15";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:11:30 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:33:"15@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:98:"Akismet checks your comments against the Akismet Web service to see if they look like spam or not.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Matt Mullenweg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:5;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:15:"NextGEN Gallery";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:56:"https://wordpress.org/plugins/nextgen-gallery/#post-1169";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 23 Apr 2007 20:08:06 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"1169@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:121:"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 12 million downloads.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:9:"Alex Rabe";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:6;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:25:"Google Analytics by Yoast";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:71:"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 14 Sep 2007 12:15:27 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"2316@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:124:"Track your WordPress site easily with the latest tracking codes and lots added data for search result pages and error pages.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Joost de Valk";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:7;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:33:"Google Analytics Dashboard for WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:75:"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Sun, 10 Mar 2013 17:07:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"50539@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Displays Google Analytics reports and real-time statistics in your WordPress Dashboard. Inserts the latest tracking code in every page of your site.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:10:"Alin Marcu";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:8;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:18:"WordPress Importer";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/wordpress-importer/#post-18101";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 20 May 2010 17:42:45 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"18101@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:101:"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Brian Colinger";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:9;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"All in One SEO Pack";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:59:"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 30 Mar 2007 20:08:18 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"753@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:126:"All in One SEO Pack is a WordPress SEO plugin to automatically optimize your WordPress blog for Search Engines such as Google.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:8:"uberdose";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:10;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:34:"UpdraftPlus Backup and Restoration";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:53:"https://wordpress.org/plugins/updraftplus/#post-38058";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Mon, 21 May 2012 15:14:11 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"38058@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:148:"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"David Anderson";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:11;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:46:"iThemes Security (formerly Better WP Security)";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:60:"https://wordpress.org/plugins/better-wp-security/#post-21738";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 22 Oct 2010 22:06:05 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"21738@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:63:"The easiest, most effective way to secure WordPress in seconds.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:13:"Chris Wiegman";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:12;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:91:"NextGEN Facebook - Advanced Social SEO for Facebook, Google+, Pinterest, Twitter &amp; More";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:58:"https://wordpress.org/plugins/nextgen-facebook/#post-40409";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Wed, 11 Jul 2012 20:13:22 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:36:"40409@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:132:"Display your content in the best possible way on Facebook, Google+, Twitter, Pinterest, etc. - no matter how your webpage is shared!";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:11:"JS Morisset";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:13;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:19:"Google XML Sitemaps";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:64:"https://wordpress.org/plugins/google-sitemap-generator/#post-132";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 09 Mar 2007 22:31:32 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:34:"132@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:105:"This plugin will generate a special XML sitemap which will help search engines to better index your blog.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:14:"Arne Brachhold";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:14;a:6:{s:4:"data";s:30:"\n			\n			\n			\n			\n			\n			\n					";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:2:{s:0:"";a:5:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WPtouch Mobile Plugin";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:48:"https://wordpress.org/plugins/wptouch/#post-5468";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Thu, 01 May 2008 04:58:09 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"5468@https://wordpress.org/plugins/";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:63:"Create a slick mobile WordPress website with just a few clicks.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:17:"BraveNewCode Inc.";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}s:27:"http://www.w3.org/2005/Atom";a:1:{s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:0:"";s:7:"attribs";a:1:{s:0:"";a:3:{s:4:"href";s:46:"https://wordpress.org/plugins/rss/view/popular";s:3:"rel";s:4:"self";s:4:"type";s:19:"application/rss+xml";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}}}}}}}}s:4:"type";i:128;s:7:"headers";a:11:{s:6:"server";s:5:"nginx";s:4:"date";s:29:"Mon, 02 Mar 2015 05:25:25 GMT";s:12:"content-type";s:23:"text/xml; charset=UTF-8";s:10:"connection";s:5:"close";s:4:"vary";s:15:"Accept-Encoding";s:7:"expires";s:29:"Mon, 02 Mar 2015 05:43:20 GMT";s:13:"cache-control";s:0:"";s:6:"pragma";s:0:"";s:13:"last-modified";s:31:"Mon, 02 Mar 2015 05:08:20 +0000";s:15:"x-frame-options";s:10:"SAMEORIGIN";s:4:"x-nc";s:11:"HIT lax 250";}s:5:"build";s:14:"20150105054306";}', 'no'),
(1830, '_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1425317122', 'no'),
(1831, '_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca', '1425273922', 'no'),
(1840, '_transient_timeout_plugin_slugs', '1425374912', 'no'),
(1841, '_transient_plugin_slugs', 'a:12:{i:0;s:30:"advanced-custom-fields/acf.php";i:1;s:19:"akismet/akismet.php";i:2;s:27:"angularjs-for-wp/plugin.php";i:3;s:47:"bootstrap-3-shortcodes/bootstrap-shortcodes.php";i:4;s:36:"contact-form-7/wp-contact-form-7.php";i:5;s:9:"hello.php";i:6;s:24:"json-rest-api/plugin.php";i:7;s:27:"slimjetpack/slimjetpack.php";i:8;s:37:"tenantManagement/tenantManagement.php";i:9;s:37:"user-role-editor/user-role-editor.php";i:10;s:53:"velvet-blues-update-urls/velvet-blues-update-urls.php";i:11;s:41:"wordpress-importer/wordpress-importer.php";}', 'no'),
(129, '_site_transient_timeout_wporg_theme_feature_list', '1420448323', 'yes'),
(130, '_site_transient_wporg_theme_feature_list', 'a:4:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:6:"Layout";a:9:{i:0;s:12:"fixed-layout";i:1;s:12:"fluid-layout";i:2;s:17:"responsive-layout";i:3;s:10:"one-column";i:4;s:11:"two-columns";i:5;s:13:"three-columns";i:6;s:12:"four-columns";i:7;s:12:"left-sidebar";i:8;s:13:"right-sidebar";}s:8:"Features";a:20:{i:0;s:19:"accessibility-ready";i:1;s:8:"blavatar";i:2;s:10:"buddypress";i:3;s:17:"custom-background";i:4;s:13:"custom-colors";i:5;s:13:"custom-header";i:6;s:11:"custom-menu";i:7;s:12:"editor-style";i:8;s:21:"featured-image-header";i:9;s:15:"featured-images";i:10;s:15:"flexible-header";i:11;s:20:"front-page-post-form";i:12;s:19:"full-width-template";i:13;s:12:"microformats";i:14;s:12:"post-formats";i:15;s:20:"rtl-language-support";i:16;s:11:"sticky-post";i:17;s:13:"theme-options";i:18;s:17:"threaded-comments";i:19;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes'),
(133, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1420437420;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(134, 'current_theme', 'Realty', 'yes'),
(135, 'theme_mods_realty', 'a:2:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:36;}}', 'yes'),
(136, 'theme_switched', '', 'yes'),
(137, 'redux-framework-tracking', 'a:3:{s:8:"dev_mode";b:0;s:4:"hash";s:32:"498bc73d43001d7722ba66a19bb41ff8";s:14:"allow_tracking";s:3:"yes";}', 'yes'),
(138, 'realty_theme_option', 'a:147:{s:8:"last_tab";s:0:"";s:21:"color-body-background";a:1:{s:16:"background-color";s:7:"#f8f8f8";}s:12:"color-accent";s:7:"#f55a4e";s:7:"favicon";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:9:"logo-menu";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"logo-login";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:16:"background-login";s:7:"#f8f8f8";s:8:"404-page";s:0:"";s:13:"custom-styles";s:44:"                                            ";s:14:"custom-scripts";s:44:"                                            ";s:18:"enable-rtl-support";s:1:"0";s:28:"user-registration-terms-page";s:0:"";s:13:"header-layout";s:7:"default";s:23:"color-header-background";a:1:{s:16:"background-color";s:7:"#333333";}s:12:"color-header";s:7:"#ffffff";s:17:"site-header-phone";s:17:"+1 555 22 66 8890";s:17:"site-header-email";s:20:"info@yourcompany.com";s:33:"disable-header-login-register-bar";s:1:"0";s:37:"site-header-hide-property-submit-link";s:1:"0";s:26:"site-header-position-fixed";s:1:"0";s:14:"header-tagline";s:1:"0";s:26:"home-slideshow-height-type";s:10:"fullscreen";s:28:"home-slideshow-custom-height";s:3:"400";s:19:"home-slideshow-type";s:20:"slideshow-properties";s:30:"home-slideshow-properties-mode";s:32:"slideshow-properties-show-latest";s:11:"home-slides";a:1:{i:0;a:9:{s:5:"title";s:0:"";s:11:"description";s:0:"";s:3:"url";s:0:"";s:4:"sort";s:1:"0";s:13:"attachment_id";s:0:"";s:5:"thumb";s:0:"";s:5:"image";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";}}s:21:"home-slideshow-search";s:4:"none";s:27:"map-height-type-home-search";s:6:"custom";s:29:"map-height-custom-home-search";s:3:"400";s:27:"map-marker-property-default";s:119:"http://www.newgenray.com/wordpress/wp_realstate/wp-content/themes/realty/lib/images/map-marker/map-marker-green-fat.png";s:19:"map-marker-property";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:26:"map-marker-cluster-default";s:119:"http://www.newgenray.com/wordpress/wp_realstate/wp-content/themes/realty/lib/images/map-marker/map-marker-red-round.png";s:18:"map-marker-cluster";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:22:"map-default-zoom-level";s:2:"14";s:23:"map-properties-quantity";s:2:"-1";s:23:"disable-google-maps-api";s:1:"0";s:24:"property-listing-field-1";s:0:"";s:23:"property-listing-icon-1";s:0:"";s:24:"property-listing-label-1";s:0:"";s:24:"property-listing-field-2";s:0:"";s:23:"property-listing-icon-2";s:0:"";s:24:"property-listing-label-2";s:0:"";s:24:"property-listing-field-3";s:0:"";s:23:"property-listing-icon-3";s:0:"";s:24:"property-listing-label-3";s:0:"";s:24:"property-listing-field-4";s:0:"";s:23:"property-listing-icon-4";s:0:"";s:24:"property-listing-label-4";s:0:"";s:21:"property-listing-type";s:7:"default";s:24:"property-listing-columns";s:17:"col-lg-4 col-md-6";s:23:"search-results-per-page";s:2:"10";s:18:"property-new-badge";s:1:"7";s:27:"property-favorites-disabled";s:1:"0";s:28:"property-favorites-temporary";s:1:"0";s:15:"property-layout";s:12:"layout-boxed";s:17:"property-lightbox";s:14:"magnific-popup";s:21:"property-image-height";s:6:"custom";s:28:"property-image-custom-height";s:3:"500";s:32:"property-image-height-fit-or-cut";s:3:"cut";s:38:"property-additional-details-hide-empty";s:1:"0";s:37:"property-features-hide-non-applicable";s:1:"0";s:22:"property-title-details";s:0:"";s:33:"property-title-additional-details";s:18:"Additional details";s:23:"property-title-features";s:8:"Features";s:18:"property-title-map";s:8:"Location";s:20:"property-title-agent";s:5:"Agent";s:23:"property-social-sharing";s:1:"1";s:26:"property-agent-information";s:1:"1";s:21:"property-contact-form";s:1:"1";s:35:"property-contact-form-cf7-shortcode";s:0:"";s:35:"property-contact-form-default-email";s:0:"";s:36:"property-similar-properties-criteria";a:6:{s:8:"location";s:1:"1";s:6:"status";s:0:"";s:4:"type";s:0:"";s:9:"min_rooms";s:0:"";s:9:"max_price";s:0:"";s:14:"available_from";s:0:"";}s:35:"property-similar-properties-columns";s:1:"2";s:23:"property-search-field-1";s:0:"";s:25:"property-search-compare-1";s:0:"";s:23:"property-search-label-1";s:0:"";s:23:"property-search-field-2";s:0:"";s:25:"property-search-compare-2";s:0:"";s:23:"property-search-label-2";s:0:"";s:23:"property-search-field-3";s:0:"";s:25:"property-search-compare-3";s:0:"";s:23:"property-search-label-3";s:0:"";s:23:"property-search-field-4";s:0:"";s:25:"property-search-compare-4";s:0:"";s:23:"property-search-label-4";s:0:"";s:23:"property-search-field-5";s:0:"";s:25:"property-search-compare-5";s:0:"";s:23:"property-search-label-5";s:0:"";s:23:"property-search-field-6";s:0:"";s:25:"property-search-compare-6";s:0:"";s:23:"property-search-label-6";s:0:"";s:23:"property-search-field-7";s:0:"";s:25:"property-search-compare-7";s:0:"";s:23:"property-search-label-7";s:0:"";s:23:"property-search-field-8";s:0:"";s:25:"property-search-compare-8";s:0:"";s:23:"property-search-label-8";s:0:"";s:31:"property-search-price-range-min";s:1:"0";s:31:"property-search-price-range-max";s:6:"100000";s:32:"property-search-price-range-step";s:5:"10000";s:19:"datepicker-language";s:2:"en";s:44:"property-submit-notification-email-recipient";s:27:"akankshagupta@newgenray.com";s:28:"property-submit-price-suffix";a:3:{i:0;s:4:"/day";i:1;s:5:"/week";i:2;s:6:"/month";}s:25:"property-submit-size-unit";a:2:{i:0;s:5:"sq ft";i:1;s:2:"m2";}s:39:"property-submit-disabled-for-subscriber";s:1:"1";s:13:"paypal-enable";s:1:"0";s:18:"paypal-alerts-hide";s:1:"0";s:26:"paypal-enable-subscription";s:1:"0";s:30:"paypal-subscription-recurrence";s:2:"12";s:26:"paypal-subscription-period";s:1:"D";s:18:"paypal-merchant-id";s:26:"vikaschauhan@newgenray.com";s:24:"paypal-ipn-email-address";s:26:"vikaschauhan@newgenray.com";s:13:"paypal-amount";s:5:"25.00";s:22:"paypal-featured-amount";s:5:"10.00";s:20:"paypal-currency-code";s:3:"USD";s:14:"paypal-sandbox";s:1:"0";s:10:"paypal-ssl";s:1:"1";s:19:"paypal-auto-publish";s:1:"1";s:17:"typography-header";a:5:{s:11:"font-family";s:4:"Lato";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:7:"subsets";s:0:"";s:9:"font-size";s:0:"";}s:19:"typography-headings";a:8:{s:11:"font-family";s:4:"Lato";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"400";s:7:"subsets";s:0:"";s:9:"font-size";s:0:"";s:5:"color";s:4:"#666";}s:15:"typography-body";a:8:{s:11:"font-family";s:9:"Open Sans";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"400";s:7:"subsets";s:0:"";s:9:"font-size";s:0:"";s:5:"color";s:4:"#666";}s:12:"price-prefix";s:0:"";s:12:"price-suffix";s:0:"";s:13:"currency-sign";s:1:"$";s:22:"currency-sign-position";s:4:"left";s:25:"price-thousands-separator";s:1:",";s:14:"price-decimals";s:1:"0";s:23:"color-footer-background";a:1:{s:16:"background-color";s:0:"";}s:30:"color-footer-bottom-background";a:1:{s:16:"background-color";s:0:"";}s:12:"color-footer";s:7:"#999999";s:9:"copyright";s:7:"© 2015";s:21:"footer-show-up-button";s:1:"1";s:29:"footer-property-search-button";s:1:"1";s:15:"social-facebook";s:1:"#";s:14:"social-twitter";s:1:"#";s:13:"social-google";s:1:"#";s:15:"social-linkedin";s:0:"";s:16:"social-pinterest";s:0:"";s:16:"social-instagram";s:0:"";s:14:"social-youtube";s:0:"";s:12:"social-skype";s:0:"";s:18:"contact-google-map";s:1:"1";s:12:"contact-logo";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:15:"contact-address";s:22:"Main St, New York, USA";s:13:"contact-phone";s:17:"+1 555 22 66 8890";s:14:"contact-mobile";s:17:"+1 555 22 66 8891";s:13:"contact-email";s:20:"info@yourcompany.com";}', 'yes'),
(139, 'realty_theme_option-transients', 'a:4:{s:14:"changed_values";a:1:{s:9:"copyright";s:56:"© 2014 - <a href="http://themetrail.com">ThemeTrail</a>";}s:9:"last_save";i:1422714010;s:13:"last_compiler";i:1420608151;s:14:"last_save_mode";s:6:"remove";}', 'yes'),
(148, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1425288508;s:7:"checked";a:5:{s:12:"realty-child";s:3:"1.0";s:6:"realty";s:5:"1.5.2";s:13:"twentyfifteen";s:3:"1.0";s:14:"twentyfourteen";s:3:"1.3";s:14:"twentythirteen";s:3:"1.4";}s:8:"response";a:0:{}s:12:"translations";a:0:{}}', 'yes'),
(140, 'recently_activated', 'a:0:{}', 'yes'),
(141, 'wpcf7', 'a:1:{s:7:"version";s:5:"4.0.3";}', 'yes'),
(142, 'jetpack_activated', '1', 'yes'),
(143, 'jetpack_options', 'a:5:{s:7:"version";s:14:"2.7:1420437512";s:11:"old_version";s:14:"2.7:1420437512";s:28:"fallback_no_verify_ssl_certs";i:0;s:9:"time_diff";i:0;s:14:"last_heartbeat";i:1425275994;}', 'yes'),
(144, 'acf_version', '4.3.9', 'yes'),
(1851, '_transient_timeout_jetpack_https_test', '1425362394', 'no'),
(1852, '_transient_jetpack_https_test', '1', 'no'),
(1588, '_site_transient_timeout_available_translations', '1423058167', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1589, '_site_transient_available_translations', 'a:46:{s:2:"ar";a:8:{s:8:"language";s:2:"ar";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 19:01:24";s:12:"english_name";s:6:"Arabic";s:11:"native_name";s:14:"العربية";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/ar.zip";s:3:"iso";a:2:{i:1;s:2:"ar";i:2;s:3:"ara";}s:7:"strings";a:1:{s:8:"continue";s:16:"المتابعة";}}s:2:"az";a:8:{s:8:"language";s:2:"az";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-27 15:23:28";s:12:"english_name";s:11:"Azerbaijani";s:11:"native_name";s:16:"Azərbaycan dili";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/az.zip";s:3:"iso";a:2:{i:1;s:2:"az";i:2;s:3:"aze";}s:7:"strings";a:1:{s:8:"continue";s:5:"Davam";}}s:5:"bg_BG";a:8:{s:8:"language";s:5:"bg_BG";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 19:05:14";s:12:"english_name";s:9:"Bulgarian";s:11:"native_name";s:18:"Български";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/bg_BG.zip";s:3:"iso";a:2:{i:1;s:2:"bg";i:2;s:3:"bul";}s:7:"strings";a:1:{s:8:"continue";s:22:"Продължение";}}s:5:"bs_BA";a:8:{s:8:"language";s:5:"bs_BA";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-08 17:39:56";s:12:"english_name";s:7:"Bosnian";s:11:"native_name";s:8:"Bosanski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/bs_BA.zip";s:3:"iso";a:2:{i:1;s:2:"bs";i:2;s:3:"bos";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:2:"ca";a:8:{s:8:"language";s:2:"ca";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-19 03:45:15";s:12:"english_name";s:7:"Catalan";s:11:"native_name";s:7:"Català";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/ca.zip";s:3:"iso";a:2:{i:1;s:2:"ca";i:2;s:3:"cat";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"cy";a:8:{s:8:"language";s:2:"cy";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-09 11:12:57";s:12:"english_name";s:5:"Welsh";s:11:"native_name";s:7:"Cymraeg";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/cy.zip";s:3:"iso";a:2:{i:1;s:2:"cy";i:2;s:3:"cym";}s:7:"strings";a:1:{s:8:"continue";s:6:"Parhau";}}s:5:"da_DK";a:8:{s:8:"language";s:5:"da_DK";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 08:44:51";s:12:"english_name";s:6:"Danish";s:11:"native_name";s:5:"Dansk";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/da_DK.zip";s:3:"iso";a:2:{i:1;s:2:"da";i:2;s:3:"dan";}s:7:"strings";a:1:{s:8:"continue";s:12:"Forts&#230;t";}}s:5:"de_DE";a:8:{s:8:"language";s:5:"de_DE";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 17:55:09";s:12:"english_name";s:6:"German";s:11:"native_name";s:7:"Deutsch";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/de_DE.zip";s:3:"iso";a:1:{i:1;s:2:"de";}s:7:"strings";a:1:{s:8:"continue";s:10:"Fortfahren";}}s:2:"el";a:8:{s:8:"language";s:2:"el";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 22:16:49";s:12:"english_name";s:5:"Greek";s:11:"native_name";s:16:"Ελληνικά";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/el.zip";s:3:"iso";a:2:{i:1;s:2:"el";i:2;s:3:"ell";}s:7:"strings";a:1:{s:8:"continue";s:16:"Συνέχεια";}}s:5:"en_GB";a:8:{s:8:"language";s:5:"en_GB";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 20:53:36";s:12:"english_name";s:12:"English (UK)";s:11:"native_name";s:12:"English (UK)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/en_GB.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_AU";a:8:{s:8:"language";s:5:"en_AU";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-19 07:48:52";s:12:"english_name";s:19:"English (Australia)";s:11:"native_name";s:19:"English (Australia)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/en_AU.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:5:"en_CA";a:8:{s:8:"language";s:5:"en_CA";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-28 01:01:02";s:12:"english_name";s:16:"English (Canada)";s:11:"native_name";s:16:"English (Canada)";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/en_CA.zip";s:3:"iso";a:3:{i:1;s:2:"en";i:2;s:3:"eng";i:3;s:3:"eng";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continue";}}s:2:"eo";a:8:{s:8:"language";s:2:"eo";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-08 22:46:58";s:12:"english_name";s:9:"Esperanto";s:11:"native_name";s:9:"Esperanto";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/eo.zip";s:3:"iso";a:2:{i:1;s:2:"eo";i:2;s:3:"epo";}s:7:"strings";a:1:{s:8:"continue";s:8:"Daŭrigi";}}s:5:"es_PE";a:8:{s:8:"language";s:5:"es_PE";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-19 08:14:32";s:12:"english_name";s:14:"Spanish (Peru)";s:11:"native_name";s:17:"Español de Perú";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/es_PE.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_MX";a:8:{s:8:"language";s:5:"es_MX";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-08 23:41:34";s:12:"english_name";s:16:"Spanish (Mexico)";s:11:"native_name";s:19:"Español de México";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/es_MX.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_ES";a:8:{s:8:"language";s:5:"es_ES";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 21:05:39";s:12:"english_name";s:15:"Spanish (Spain)";s:11:"native_name";s:8:"Español";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/es_ES.zip";s:3:"iso";a:1:{i:1;s:2:"es";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"es_CL";a:8:{s:8:"language";s:5:"es_CL";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-04 19:47:01";s:12:"english_name";s:15:"Spanish (Chile)";s:11:"native_name";s:17:"Español de Chile";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.0/es_CL.zip";s:3:"iso";a:2:{i:1;s:2:"es";i:2;s:3:"spa";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:2:"eu";a:8:{s:8:"language";s:2:"eu";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-09 12:20:08";s:12:"english_name";s:6:"Basque";s:11:"native_name";s:7:"Euskara";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/eu.zip";s:3:"iso";a:2:{i:1;s:2:"eu";i:2;s:3:"eus";}s:7:"strings";a:1:{s:8:"continue";s:8:"Jarraitu";}}s:5:"fa_IR";a:8:{s:8:"language";s:5:"fa_IR";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-23 14:29:09";s:12:"english_name";s:7:"Persian";s:11:"native_name";s:10:"فارسی";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/fa_IR.zip";s:3:"iso";a:2:{i:1;s:2:"fa";i:2;s:3:"fas";}s:7:"strings";a:1:{s:8:"continue";s:10:"ادامه";}}s:2:"fi";a:8:{s:8:"language";s:2:"fi";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-17 07:01:16";s:12:"english_name";s:7:"Finnish";s:11:"native_name";s:5:"Suomi";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/fi.zip";s:3:"iso";a:2:{i:1;s:2:"fi";i:2;s:3:"fin";}s:7:"strings";a:1:{s:8:"continue";s:5:"Jatka";}}s:5:"fr_FR";a:8:{s:8:"language";s:5:"fr_FR";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 19:01:48";s:12:"english_name";s:15:"French (France)";s:11:"native_name";s:9:"Français";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/fr_FR.zip";s:3:"iso";a:1:{i:1;s:2:"fr";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuer";}}s:2:"gd";a:8:{s:8:"language";s:2:"gd";s:7:"version";s:3:"4.0";s:7:"updated";s:19:"2014-09-05 17:37:43";s:12:"english_name";s:15:"Scottish Gaelic";s:11:"native_name";s:9:"Gàidhlig";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.0/gd.zip";s:3:"iso";a:3:{i:1;s:2:"gd";i:2;s:3:"gla";i:3;s:3:"gla";}s:7:"strings";a:1:{s:8:"continue";s:15:"Lean air adhart";}}s:5:"gl_ES";a:8:{s:8:"language";s:5:"gl_ES";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 18:37:43";s:12:"english_name";s:8:"Galician";s:11:"native_name";s:6:"Galego";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/gl_ES.zip";s:3:"iso";a:2:{i:1;s:2:"gl";i:2;s:3:"glg";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"he_IL";a:8:{s:8:"language";s:5:"he_IL";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 14:11:31";s:12:"english_name";s:6:"Hebrew";s:11:"native_name";s:16:"עִבְרִית";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/he_IL.zip";s:3:"iso";a:1:{i:1;s:2:"he";}s:7:"strings";a:1:{s:8:"continue";s:12:"להמשיך";}}s:2:"hr";a:8:{s:8:"language";s:2:"hr";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-19 14:39:57";s:12:"english_name";s:8:"Croatian";s:11:"native_name";s:8:"Hrvatski";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/hr.zip";s:3:"iso";a:2:{i:1;s:2:"hr";i:2;s:3:"hrv";}s:7:"strings";a:1:{s:8:"continue";s:7:"Nastavi";}}s:5:"hu_HU";a:8:{s:8:"language";s:5:"hu_HU";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-07 11:10:15";s:12:"english_name";s:9:"Hungarian";s:11:"native_name";s:6:"Magyar";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/hu_HU.zip";s:3:"iso";a:2:{i:1;s:2:"hu";i:2;s:3:"hun";}s:7:"strings";a:1:{s:8:"continue";s:7:"Tovább";}}s:5:"id_ID";a:8:{s:8:"language";s:5:"id_ID";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-31 07:30:24";s:12:"english_name";s:10:"Indonesian";s:11:"native_name";s:16:"Bahasa Indonesia";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/id_ID.zip";s:3:"iso";a:2:{i:1;s:2:"id";i:2;s:3:"ind";}s:7:"strings";a:1:{s:8:"continue";s:9:"Lanjutkan";}}s:5:"it_IT";a:8:{s:8:"language";s:5:"it_IT";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-31 10:31:17";s:12:"english_name";s:7:"Italian";s:11:"native_name";s:8:"Italiano";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/it_IT.zip";s:3:"iso";a:2:{i:1;s:2:"it";i:2;s:3:"ita";}s:7:"strings";a:1:{s:8:"continue";s:8:"Continua";}}s:2:"ja";a:8:{s:8:"language";s:2:"ja";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 10:53:40";s:12:"english_name";s:8:"Japanese";s:11:"native_name";s:9:"日本語";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/ja.zip";s:3:"iso";a:1:{i:1;s:2:"ja";}s:7:"strings";a:1:{s:8:"continue";s:9:"続ける";}}s:5:"ko_KR";a:8:{s:8:"language";s:5:"ko_KR";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-21 03:05:42";s:12:"english_name";s:6:"Korean";s:11:"native_name";s:9:"한국어";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/ko_KR.zip";s:3:"iso";a:2:{i:1;s:2:"ko";i:2;s:3:"kor";}s:7:"strings";a:1:{s:8:"continue";s:6:"계속";}}s:5:"my_MM";a:8:{s:8:"language";s:5:"my_MM";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-21 19:07:31";s:12:"english_name";s:7:"Burmese";s:11:"native_name";s:15:"ဗမာစာ";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/my_MM.zip";s:3:"iso";a:2:{i:1;s:2:"my";i:2;s:3:"mya";}s:7:"strings";a:1:{s:8:"continue";s:54:"ဆက်လက်လုပ်ေဆာင်ပါ။";}}s:5:"nb_NO";a:8:{s:8:"language";s:5:"nb_NO";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-10 16:35:13";s:12:"english_name";s:19:"Norwegian (Bokmål)";s:11:"native_name";s:13:"Norsk bokmål";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/nb_NO.zip";s:3:"iso";a:2:{i:1;s:2:"nb";i:2;s:3:"nob";}s:7:"strings";a:1:{s:8:"continue";s:8:"Fortsett";}}s:5:"nl_NL";a:8:{s:8:"language";s:5:"nl_NL";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-23 08:38:00";s:12:"english_name";s:5:"Dutch";s:11:"native_name";s:10:"Nederlands";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/nl_NL.zip";s:3:"iso";a:2:{i:1;s:2:"nl";i:2;s:3:"nld";}s:7:"strings";a:1:{s:8:"continue";s:8:"Doorgaan";}}s:5:"pl_PL";a:8:{s:8:"language";s:5:"pl_PL";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-01 05:11:03";s:12:"english_name";s:6:"Polish";s:11:"native_name";s:6:"Polski";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/pl_PL.zip";s:3:"iso";a:2:{i:1;s:2:"pl";i:2;s:3:"pol";}s:7:"strings";a:1:{s:8:"continue";s:9:"Kontynuuj";}}s:5:"pt_PT";a:8:{s:8:"language";s:5:"pt_PT";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-02-02 11:59:53";s:12:"english_name";s:21:"Portuguese (Portugal)";s:11:"native_name";s:10:"Português";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/pt_PT.zip";s:3:"iso";a:1:{i:1;s:2:"pt";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"pt_BR";a:8:{s:8:"language";s:5:"pt_BR";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-21 11:05:23";s:12:"english_name";s:19:"Portuguese (Brazil)";s:11:"native_name";s:20:"Português do Brasil";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/pt_BR.zip";s:3:"iso";a:2:{i:1;s:2:"pt";i:2;s:3:"por";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuar";}}s:5:"ro_RO";a:8:{s:8:"language";s:5:"ro_RO";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-16 10:34:32";s:12:"english_name";s:8:"Romanian";s:11:"native_name";s:8:"Română";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/ro_RO.zip";s:3:"iso";a:2:{i:1;s:2:"ro";i:2;s:3:"ron";}s:7:"strings";a:1:{s:8:"continue";s:9:"Continuă";}}s:5:"ru_RU";a:8:{s:8:"language";s:5:"ru_RU";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-17 18:16:58";s:12:"english_name";s:7:"Russian";s:11:"native_name";s:14:"Русский";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/ru_RU.zip";s:3:"iso";a:2:{i:1;s:2:"ru";i:2;s:3:"rus";}s:7:"strings";a:1:{s:8:"continue";s:20:"Продолжить";}}s:5:"sk_SK";a:8:{s:8:"language";s:5:"sk_SK";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-12 19:18:28";s:12:"english_name";s:6:"Slovak";s:11:"native_name";s:11:"Slovenčina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/sk_SK.zip";s:3:"iso";a:2:{i:1;s:2:"sk";i:2;s:3:"slk";}s:7:"strings";a:1:{s:8:"continue";s:12:"Pokračovať";}}s:5:"sl_SI";a:8:{s:8:"language";s:5:"sl_SI";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-13 22:38:48";s:12:"english_name";s:9:"Slovenian";s:11:"native_name";s:13:"Slovenščina";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/sl_SI.zip";s:3:"iso";a:2:{i:1;s:2:"sl";i:2;s:3:"slv";}s:7:"strings";a:1:{s:8:"continue";s:10:"Nadaljujte";}}s:5:"sr_RS";a:8:{s:8:"language";s:5:"sr_RS";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-18 19:08:01";s:12:"english_name";s:7:"Serbian";s:11:"native_name";s:23:"Српски језик";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/sr_RS.zip";s:3:"iso";a:2:{i:1;s:2:"sr";i:2;s:3:"srp";}s:7:"strings";a:1:{s:8:"continue";s:14:"Настави";}}s:5:"sv_SE";a:8:{s:8:"language";s:5:"sv_SE";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 09:41:07";s:12:"english_name";s:7:"Swedish";s:11:"native_name";s:7:"Svenska";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/sv_SE.zip";s:3:"iso";a:2:{i:1;s:2:"sv";i:2;s:3:"swe";}s:7:"strings";a:1:{s:8:"continue";s:9:"Fortsätt";}}s:2:"th";a:8:{s:8:"language";s:2:"th";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-29 06:35:28";s:12:"english_name";s:4:"Thai";s:11:"native_name";s:9:"ไทย";s:7:"package";s:59:"https://downloads.wordpress.org/translation/core/4.1/th.zip";s:3:"iso";a:2:{i:1;s:2:"th";i:2;s:3:"tha";}s:7:"strings";a:1:{s:8:"continue";s:15:"ต่อไป";}}s:5:"tr_TR";a:8:{s:8:"language";s:5:"tr_TR";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-19 08:42:08";s:12:"english_name";s:7:"Turkish";s:11:"native_name";s:8:"Türkçe";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/tr_TR.zip";s:3:"iso";a:2:{i:1;s:2:"tr";i:2;s:3:"tur";}s:7:"strings";a:1:{s:8:"continue";s:5:"Devam";}}s:5:"zh_TW";a:8:{s:8:"language";s:5:"zh_TW";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2015-01-08 03:46:32";s:12:"english_name";s:16:"Chinese (Taiwan)";s:11:"native_name";s:12:"繁體中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/zh_TW.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"繼續";}}s:5:"zh_CN";a:8:{s:8:"language";s:5:"zh_CN";s:7:"version";s:3:"4.1";s:7:"updated";s:19:"2014-12-26 02:21:02";s:12:"english_name";s:15:"Chinese (China)";s:11:"native_name";s:12:"简体中文";s:7:"package";s:62:"https://downloads.wordpress.org/translation/core/4.1/zh_CN.zip";s:3:"iso";a:2:{i:1;s:2:"zh";i:2;s:3:"zho";}s:7:"strings";a:1:{s:8:"continue";s:6:"继续";}}}', 'yes'),
(157, 'jetpack_log', 'a:2:{i:0;a:5:{s:4:"time";i:1420439592;s:7:"user_id";i:1;s:7:"blog_id";b:0;s:4:"code";s:8:"activate";s:4:"data";s:13:"tiled-gallery";}i:1;a:5:{s:4:"time";i:1420439595;s:7:"user_id";i:1;s:7:"blog_id";b:0;s:4:"code";s:8:"activate";s:4:"data";s:8:"carousel";}}', 'no'),
(158, 'jetpack_active_modules', 'a:3:{i:0;s:10:"vaultpress";i:1;s:13:"tiled-gallery";i:3;s:8:"carousel";}', 'yes'),
(159, 'carousel_background_color', 'white', 'yes'),
(160, 'carousel_display_exif', '0', 'yes'),
(161, 'tiled_galleries', '1', 'yes'),
(164, '_site_transient_timeout_popular_importers_en_US', '1420612451', 'yes'),
(165, '_site_transient_popular_importers_en_US', 'a:2:{s:9:"importers";a:8:{s:7:"blogger";a:4:{s:4:"name";s:7:"Blogger";s:11:"description";s:86:"Install the Blogger importer to import posts, comments, and users from a Blogger blog.";s:11:"plugin-slug";s:16:"blogger-importer";s:11:"importer-id";s:7:"blogger";}s:9:"wpcat2tag";a:4:{s:4:"name";s:29:"Categories and Tags Converter";s:11:"description";s:109:"Install the category/tag converter to convert existing categories to tags or tags to categories, selectively.";s:11:"plugin-slug";s:18:"wpcat2tag-importer";s:11:"importer-id";s:9:"wpcat2tag";}s:11:"livejournal";a:4:{s:4:"name";s:11:"LiveJournal";s:11:"description";s:82:"Install the LiveJournal importer to import posts from LiveJournal using their API.";s:11:"plugin-slug";s:20:"livejournal-importer";s:11:"importer-id";s:11:"livejournal";}s:11:"movabletype";a:4:{s:4:"name";s:24:"Movable Type and TypePad";s:11:"description";s:99:"Install the Movable Type importer to import posts and comments from a Movable Type or TypePad blog.";s:11:"plugin-slug";s:20:"movabletype-importer";s:11:"importer-id";s:2:"mt";}s:4:"opml";a:4:{s:4:"name";s:8:"Blogroll";s:11:"description";s:61:"Install the blogroll importer to import links in OPML format.";s:11:"plugin-slug";s:13:"opml-importer";s:11:"importer-id";s:4:"opml";}s:3:"rss";a:4:{s:4:"name";s:3:"RSS";s:11:"description";s:58:"Install the RSS importer to import posts from an RSS feed.";s:11:"plugin-slug";s:12:"rss-importer";s:11:"importer-id";s:3:"rss";}s:6:"tumblr";a:4:{s:4:"name";s:6:"Tumblr";s:11:"description";s:84:"Install the Tumblr importer to import posts &amp; media from Tumblr using their API.";s:11:"plugin-slug";s:15:"tumblr-importer";s:11:"importer-id";s:6:"tumblr";}s:9:"wordpress";a:4:{s:4:"name";s:9:"WordPress";s:11:"description";s:130:"Install the WordPress importer to import posts, pages, comments, custom fields, categories, and tags from a WordPress export file.";s:11:"plugin-slug";s:18:"wordpress-importer";s:11:"importer-id";s:9:"wordpress";}}s:10:"translated";b:0;}', 'yes'),
(656, '_site_transient_timeout_ure_caps_readable', '1421131671', 'yes'),
(199, 'category_children', 'a:0:{}', 'yes'),
(1661, 'property-features_children', 'a:0:{}', 'yes'),
(202, 'property-type_children', 'a:0:{}', 'yes'),
(801, 'property-status_children', 'a:0:{}', 'yes'),
(813, 'property-location_children', 'a:2:{i:19;a:7:{i:0;i:23;i:1;i:24;i:2;i:28;i:3;i:31;i:4;i:32;i:5;i:33;i:6;i:34;}i:21;a:2:{i:0;i:30;i:1;i:35;}}', 'yes'),
(205, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(1824, '_transient_timeout_vimeo_thumbnail_large_100449943', '1427903551', 'no'),
(1825, '_transient_vimeo_thumbnail_large_100449943', 'http://i.vimeocdn.com/video/481942353_640.jpg', 'no'),
(214, '_transient_timeout_vimeo_thumbnail_large_89938769', '1423073450', 'no'),
(215, '_transient_vimeo_thumbnail_large_89938769', 'http://i.vimeocdn.com/video/468878318_640.jpg', 'no'),
(227, 'WPLANG', '', 'yes'),
(246, 'secret_key', 'SJ4_yl[*74TBW8`v-ndR-iV6+w=?1&X)ar||>nO6Yb4I0J(8n?q3PWL@,Ymsr{[f', 'yes'),
(607, '_site_transient_timeout_browser_88ba867e2d1a27b7294cf09fb6a5d0cb', '1421670703', 'yes'),
(608, '_site_transient_browser_88ba867e2d1a27b7294cf09fb6a5d0cb', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"34.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(669, 'available_schedule_tour_db_version', '1.0', 'yes'),
(637, 'user_role_editor', 'a:4:{s:11:"ure_version";s:6:"4.18.1";s:17:"ure_caps_readable";i:0;s:24:"ure_show_deprecated_caps";i:0;s:19:"ure_hide_pro_banner";i:0;}', 'yes'),
(638, 'wp_backup_user_roles', 'a:7:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:69:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:14:"ure_edit_roles";b:1;s:16:"ure_create_roles";b:1;s:16:"ure_delete_roles";b:1;s:23:"ure_create_capabilities";b:1;s:23:"ure_delete_capabilities";b:1;s:18:"ure_manage_options";b:1;s:15:"ure_reset_roles";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:1:{s:7:"level_0";b:1;}}s:5:"agent";a:2:{s:4:"name";s:5:"Agent";s:12:"capabilities";a:0:{}}s:6:"tenant";a:2:{s:4:"name";s:6:"Tenant";s:12:"capabilities";a:2:{s:4:"read";b:0;s:17:"tenant_management";b:1;}}}', 'no'),
(359, 'theme_mods_realty-child', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1420615312;s:4:"data";a:10:{s:19:"wp_inactive_widgets";a:0:{}s:12:"sidebar_blog";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:16:"sidebar_property";N;s:13:"sidebar_agent";N;s:12:"sidebar_page";N;s:15:"sidebar_contact";N;s:11:"sidebar_idx";N;s:16:"sidebar_footer_1";N;s:16:"sidebar_footer_2";N;s:16:"sidebar_footer_3";N;}}}', 'yes'),
(1590, 'rewrite_rules', 'a:102:{s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:58:"property-location/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?property-location=$matches[1]&feed=$matches[2]";s:53:"property-location/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?property-location=$matches[1]&feed=$matches[2]";s:46:"property-location/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?property-location=$matches[1]&paged=$matches[2]";s:28:"property-location/([^/]+)/?$";s:39:"index.php?property-location=$matches[1]";s:56:"property-status/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:54:"index.php?property-status=$matches[1]&feed=$matches[2]";s:51:"property-status/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:54:"index.php?property-status=$matches[1]&feed=$matches[2]";s:44:"property-status/([^/]+)/page/?([0-9]{1,})/?$";s:55:"index.php?property-status=$matches[1]&paged=$matches[2]";s:26:"property-status/([^/]+)/?$";s:37:"index.php?property-status=$matches[1]";s:54:"property-type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?property-type=$matches[1]&feed=$matches[2]";s:49:"property-type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?property-type=$matches[1]&feed=$matches[2]";s:42:"property-type/([^/]+)/page/?([0-9]{1,})/?$";s:53:"index.php?property-type=$matches[1]&paged=$matches[2]";s:24:"property-type/([^/]+)/?$";s:35:"index.php?property-type=$matches[1]";s:57:"property-feature/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?property-features=$matches[1]&feed=$matches[2]";s:52:"property-feature/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:56:"index.php?property-features=$matches[1]&feed=$matches[2]";s:45:"property-feature/([^/]+)/page/?([0-9]{1,})/?$";s:57:"index.php?property-features=$matches[1]&paged=$matches[2]";s:27:"property-feature/([^/]+)/?$";s:39:"index.php?property-features=$matches[1]";s:34:"property/.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"property/.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"property/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"property/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"property/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:27:"property/(.+?)/trackback/?$";s:35:"index.php?property=$matches[1]&tb=1";s:35:"property/(.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?property=$matches[1]&paged=$matches[2]";s:42:"property/(.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?property=$matches[1]&cpage=$matches[2]";s:27:"property/(.+?)(/[0-9]+)?/?$";s:47:"index.php?property=$matches[1]&page=$matches[2]";s:37:"testimonial/.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"testimonial/.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"testimonial/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"testimonial/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"testimonial/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"testimonial/(.+?)/trackback/?$";s:38:"index.php?testimonial=$matches[1]&tb=1";s:38:"testimonial/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?testimonial=$matches[1]&paged=$matches[2]";s:45:"testimonial/(.+?)/comment-page-([0-9]{1,})/?$";s:51:"index.php?testimonial=$matches[1]&cpage=$matches[2]";s:30:"testimonial/(.+?)(/[0-9]+)?/?$";s:50:"index.php?testimonial=$matches[1]&page=$matches[2]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:39:"index.php?&page_id=93&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:46:"agent/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:41:"agent/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:34:"agent/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:16:"agent/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(1413, '_site_transient_timeout_browser_14787df35df2180fc53995160162b4c5', '1423379409', 'yes'),
(1414, '_site_transient_browser_14787df35df2180fc53995160162b4c5', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"40.0.2214.93";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(1864, '_site_transient_update_plugins', 'O:8:"stdClass":5:{s:12:"last_checked";i:1425288511;s:7:"checked";a:12:{s:30:"advanced-custom-fields/acf.php";s:5:"4.3.9";s:19:"akismet/akismet.php";s:5:"3.0.4";s:27:"angularjs-for-wp/plugin.php";s:3:"1.0";s:47:"bootstrap-3-shortcodes/bootstrap-shortcodes.php";s:5:"3.3.5";s:36:"contact-form-7/wp-contact-form-7.php";s:5:"4.0.3";s:9:"hello.php";s:3:"1.6";s:24:"json-rest-api/plugin.php";s:5:"1.1.1";s:27:"slimjetpack/slimjetpack.php";s:7:"2.7.0.1";s:37:"tenantManagement/tenantManagement.php";s:3:"1.0";s:37:"user-role-editor/user-role-editor.php";s:6:"4.18.1";s:53:"velvet-blues-update-urls/velvet-blues-update-urls.php";s:5:"3.2.3";s:41:"wordpress-importer/wordpress-importer.php";s:5:"0.6.1";}s:8:"response";a:4:{s:30:"advanced-custom-fields/acf.php";O:8:"stdClass":6:{s:2:"id";s:5:"21367";s:4:"slug";s:22:"advanced-custom-fields";s:6:"plugin";s:30:"advanced-custom-fields/acf.php";s:11:"new_version";s:5:"4.4.0";s:3:"url";s:53:"https://wordpress.org/plugins/advanced-custom-fields/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/advanced-custom-fields.zip";}s:27:"angularjs-for-wp/plugin.php";O:8:"stdClass":6:{s:2:"id";s:5:"51251";s:4:"slug";s:16:"angularjs-for-wp";s:6:"plugin";s:27:"angularjs-for-wp/plugin.php";s:11:"new_version";s:5:"1.1.1";s:3:"url";s:47:"https://wordpress.org/plugins/angularjs-for-wp/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/angularjs-for-wp.zip";}s:36:"contact-form-7/wp-contact-form-7.php";O:8:"stdClass":6:{s:2:"id";s:3:"790";s:4:"slug";s:14:"contact-form-7";s:6:"plugin";s:36:"contact-form-7/wp-contact-form-7.php";s:11:"new_version";s:3:"4.1";s:3:"url";s:45:"https://wordpress.org/plugins/contact-form-7/";s:7:"package";s:61:"https://downloads.wordpress.org/plugin/contact-form-7.4.1.zip";}s:37:"user-role-editor/user-role-editor.php";O:8:"stdClass":6:{s:2:"id";s:5:"13697";s:4:"slug";s:16:"user-role-editor";s:6:"plugin";s:37:"user-role-editor/user-role-editor.php";s:11:"new_version";s:6:"4.18.3";s:3:"url";s:47:"https://wordpress.org/plugins/user-role-editor/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/user-role-editor.zip";}}s:12:"translations";a:0:{}s:9:"no_update";a:7:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.0.4";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.0.4.zip";}s:47:"bootstrap-3-shortcodes/bootstrap-shortcodes.php";O:8:"stdClass":6:{s:2:"id";s:5:"47122";s:4:"slug";s:22:"bootstrap-3-shortcodes";s:6:"plugin";s:47:"bootstrap-3-shortcodes/bootstrap-shortcodes.php";s:11:"new_version";s:5:"3.3.5";s:3:"url";s:53:"https://wordpress.org/plugins/bootstrap-3-shortcodes/";s:7:"package";s:71:"https://downloads.wordpress.org/plugin/bootstrap-3-shortcodes.3.3.5.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:24:"json-rest-api/plugin.php";O:8:"stdClass":6:{s:2:"id";s:5:"42054";s:4:"slug";s:13:"json-rest-api";s:6:"plugin";s:24:"json-rest-api/plugin.php";s:11:"new_version";s:5:"1.1.1";s:3:"url";s:44:"https://wordpress.org/plugins/json-rest-api/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/json-rest-api.1.1.1.zip";}s:27:"slimjetpack/slimjetpack.php";O:8:"stdClass":6:{s:2:"id";s:5:"37593";s:4:"slug";s:11:"slimjetpack";s:6:"plugin";s:27:"slimjetpack/slimjetpack.php";s:11:"new_version";s:7:"2.7.0.1";s:3:"url";s:42:"https://wordpress.org/plugins/slimjetpack/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/slimjetpack.2.7.0.1.zip";}s:53:"velvet-blues-update-urls/velvet-blues-update-urls.php";O:8:"stdClass":6:{s:2:"id";s:4:"4884";s:4:"slug";s:24:"velvet-blues-update-urls";s:6:"plugin";s:53:"velvet-blues-update-urls/velvet-blues-update-urls.php";s:11:"new_version";s:5:"3.2.3";s:3:"url";s:55:"https://wordpress.org/plugins/velvet-blues-update-urls/";s:7:"package";s:73:"https://downloads.wordpress.org/plugin/velvet-blues-update-urls.3.2.3.zip";}s:41:"wordpress-importer/wordpress-importer.php";O:8:"stdClass":6:{s:2:"id";s:5:"14975";s:4:"slug";s:18:"wordpress-importer";s:6:"plugin";s:41:"wordpress-importer/wordpress-importer.php";s:11:"new_version";s:5:"0.6.1";s:3:"url";s:49:"https://wordpress.org/plugins/wordpress-importer/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/wordpress-importer.0.6.1.zip";}}}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1193 ;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(4, 6, '_form', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>'),
(5, 6, '_mail', 'a:8:{s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:37:"[your-name] <wordpress@newgenray.com>";s:4:"body";s:175:"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Realestate2015 (http://realestate.local)";s:9:"recipient";s:27:"akankshagupta@newgneray.com";s:18:"additional_headers";s:22:"Reply-To: [your-email]";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(6, 6, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:40:"Realestate2015 <wordpress@newgenray.com>";s:4:"body";s:117:"Message Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Realestate2015 (http://realestate.local)";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:37:"Reply-To: akankshagupta@newgneray.com";s:11:"attachments";s:0:"";s:8:"use_html";i:0;s:13:"exclude_blank";i:0;}'),
(7, 6, '_messages', 'a:6:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:16:"invalid_required";s:31:"Please fill the required field.";}'),
(8, 6, '_additional_settings', ''),
(9, 6, '_locale', 'en_US'),
(13, 10, 'field_54aa2e3b561dc', 'a:14:{s:3:"key";s:19:"field_54aa2e3b561dc";s:5:"label";s:7:"wp test";s:4:"name";s:7:"wp_test";s:4:"type";s:4:"text";s:12:"instructions";s:17:"test Instructions";s:8:"required";s:1:"0";s:13:"default_value";s:10:"test value";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(12, 10, '_edit_last', '1'),
(14, 10, 'field_54aa2e66561dd', 'a:14:{s:3:"key";s:19:"field_54aa2e66561dd";s:5:"label";s:0:"";s:4:"name";s:0:"";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(15, 10, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:8:"property";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(16, 10, 'position', 'normal'),
(17, 10, 'layout', 'no_box'),
(18, 10, 'hide_on_screen', ''),
(19, 10, '_edit_lock', '1420693139:1'),
(20, 1, '_edit_lock', '1422872731:1'),
(697, 397, '_edit_lock', '1420448594:1'),
(696, 395, '_edit_lock', '1420448019:1'),
(23, 438, '_wp_attached_file', '2014/10/agent-750-750.jpg'),
(24, 438, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:750;s:6:"height";i:750;s:4:"file";s:25:"2014/10/agent-750-750.jpg";s:5:"sizes";a:7:{s:9:"thumbnail";a:4:{s:4:"file";s:25:"agent-750-750-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:25:"agent-750-750-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:25:"agent-750-750-750x675.jpg";s:5:"width";i:750;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:25:"agent-750-750-750x400.jpg";s:5:"width";i:750;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:25:"agent-750-750-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:25:"agent-750-750-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:25:"agent-750-750-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(25, 439, '_wp_attached_file', '2014/07/picjumbo_house_front.jpg'),
(26, 439, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1280;s:4:"file";s:32:"2014/07/picjumbo_house_front.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:32:"picjumbo_house_front-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:32:"picjumbo_house_front-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:33:"picjumbo_house_front-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:33:"picjumbo_house_front-1200x800.jpg";s:5:"width";i:1200;s:6:"height";i:800;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:33:"picjumbo_house_front-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:33:"picjumbo_house_front-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:32:"picjumbo_house_front-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:32:"picjumbo_house_front-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:32:"picjumbo_house_front-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(27, 440, '_wp_attached_file', '2014/07/picjumbo_house_street.jpg'),
(28, 440, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1280;s:4:"file";s:33:"2014/07/picjumbo_house_street.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:33:"picjumbo_house_street-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:33:"picjumbo_house_street-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:34:"picjumbo_house_street-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:34:"picjumbo_house_street-1200x800.jpg";s:5:"width";i:1200;s:6:"height";i:800;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:34:"picjumbo_house_street-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:34:"picjumbo_house_street-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:33:"picjumbo_house_street-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:33:"picjumbo_house_street-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:33:"picjumbo_house_street-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(29, 441, '_wp_attached_file', '2014/07/picjumbo_office1.jpg'),
(30, 441, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1285;s:4:"file";s:28:"2014/07/picjumbo_office1.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"picjumbo_office1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:28:"picjumbo_office1-300x201.jpg";s:5:"width";i:300;s:6:"height";i:201;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:29:"picjumbo_office1-1024x685.jpg";s:5:"width";i:1024;s:6:"height";i:685;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:29:"picjumbo_office1-1200x803.jpg";s:5:"width";i:1200;s:6:"height";i:803;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:29:"picjumbo_office1-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:29:"picjumbo_office1-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:28:"picjumbo_office1-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:28:"picjumbo_office1-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:28:"picjumbo_office1-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(31, 442, '_wp_attached_file', '2014/07/picjumbo_office2.jpg'),
(32, 442, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1440;s:4:"file";s:28:"2014/07/picjumbo_office2.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"picjumbo_office2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:28:"picjumbo_office2-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:29:"picjumbo_office2-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:29:"picjumbo_office2-1200x900.jpg";s:5:"width";i:1200;s:6:"height";i:900;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:29:"picjumbo_office2-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:29:"picjumbo_office2-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:28:"picjumbo_office2-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:28:"picjumbo_office2-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:28:"picjumbo_office2-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(33, 443, '_wp_attached_file', '2014/07/picjumbo_vranov_czech_republic.jpg'),
(34, 443, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1440;s:4:"file";s:42:"2014/07/picjumbo_vranov_czech_republic.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:42:"picjumbo_vranov_czech_republic-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:42:"picjumbo_vranov_czech_republic-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:43:"picjumbo_vranov_czech_republic-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:43:"picjumbo_vranov_czech_republic-1200x900.jpg";s:5:"width";i:1200;s:6:"height";i:900;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:43:"picjumbo_vranov_czech_republic-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:43:"picjumbo_vranov_czech_republic-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:42:"picjumbo_vranov_czech_republic-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:42:"picjumbo_vranov_czech_republic-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:42:"picjumbo_vranov_czech_republic-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(35, 444, '_wp_attached_file', '2014/07/unsplash_castle.jpg'),
(36, 444, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1280;s:4:"file";s:27:"2014/07/unsplash_castle.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"unsplash_castle-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:27:"unsplash_castle-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:28:"unsplash_castle-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:28:"unsplash_castle-1200x800.jpg";s:5:"width";i:1200;s:6:"height";i:800;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:28:"unsplash_castle-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:28:"unsplash_castle-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:27:"unsplash_castle-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:27:"unsplash_castle-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:27:"unsplash_castle-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(37, 445, '_wp_attached_file', '2014/07/unsplash_house_field.jpg'),
(38, 445, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1200;s:4:"file";s:32:"2014/07/unsplash_house_field.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:32:"unsplash_house_field-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:32:"unsplash_house_field-300x188.jpg";s:5:"width";i:300;s:6:"height";i:188;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:33:"unsplash_house_field-1024x640.jpg";s:5:"width";i:1024;s:6:"height";i:640;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:33:"unsplash_house_field-1200x750.jpg";s:5:"width";i:1200;s:6:"height";i:750;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:33:"unsplash_house_field-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:33:"unsplash_house_field-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:32:"unsplash_house_field-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:32:"unsplash_house_field-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:32:"unsplash_house_field-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(39, 446, '_wp_attached_file', '2014/07/unsplash_house_rocks.jpg'),
(40, 446, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1440;s:4:"file";s:32:"2014/07/unsplash_house_rocks.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:32:"unsplash_house_rocks-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:32:"unsplash_house_rocks-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:33:"unsplash_house_rocks-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:33:"unsplash_house_rocks-1200x900.jpg";s:5:"width";i:1200;s:6:"height";i:900;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:33:"unsplash_house_rocks-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:33:"unsplash_house_rocks-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:32:"unsplash_house_rocks-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:32:"unsplash_house_rocks-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:32:"unsplash_house_rocks-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(41, 447, '_wp_attached_file', '2014/07/unsplash_house_top.jpg'),
(42, 447, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1280;s:4:"file";s:30:"2014/07/unsplash_house_top.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:30:"unsplash_house_top-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:30:"unsplash_house_top-300x200.jpg";s:5:"width";i:300;s:6:"height";i:200;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:31:"unsplash_house_top-1024x683.jpg";s:5:"width";i:1024;s:6:"height";i:683;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:31:"unsplash_house_top-1200x800.jpg";s:5:"width";i:1200;s:6:"height";i:800;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:31:"unsplash_house_top-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:31:"unsplash_house_top-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:30:"unsplash_house_top-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:30:"unsplash_house_top-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:30:"unsplash_house_top-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(43, 448, '_wp_attached_file', '2014/07/unsplash_house_trees.jpg'),
(44, 448, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1034;s:4:"file";s:32:"2014/07/unsplash_house_trees.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:32:"unsplash_house_trees-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:32:"unsplash_house_trees-300x162.jpg";s:5:"width";i:300;s:6:"height";i:162;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:33:"unsplash_house_trees-1024x551.jpg";s:5:"width";i:1024;s:6:"height";i:551;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:33:"unsplash_house_trees-1200x646.jpg";s:5:"width";i:1200;s:6:"height";i:646;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:33:"unsplash_house_trees-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:33:"unsplash_house_trees-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:32:"unsplash_house_trees-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:32:"unsplash_house_trees-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:32:"unsplash_house_trees-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(45, 449, '_wp_attached_file', '2014/07/unsplash_houses_narrow.jpg'),
(46, 449, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1172;s:4:"file";s:34:"2014/07/unsplash_houses_narrow.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:34:"unsplash_houses_narrow-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:34:"unsplash_houses_narrow-300x183.jpg";s:5:"width";i:300;s:6:"height";i:183;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:35:"unsplash_houses_narrow-1024x625.jpg";s:5:"width";i:1024;s:6:"height";i:625;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:35:"unsplash_houses_narrow-1200x733.jpg";s:5:"width";i:1200;s:6:"height";i:733;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:35:"unsplash_houses_narrow-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:35:"unsplash_houses_narrow-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:34:"unsplash_houses_narrow-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:34:"unsplash_houses_narrow-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:34:"unsplash_houses_narrow-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(47, 450, '_wp_attached_file', '2014/07/unsplash_looking_at_the_arch.jpg'),
(48, 450, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1276;s:4:"file";s:40:"2014/07/unsplash_looking_at_the_arch.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:40:"unsplash_looking_at_the_arch-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:40:"unsplash_looking_at_the_arch-300x199.jpg";s:5:"width";i:300;s:6:"height";i:199;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:41:"unsplash_looking_at_the_arch-1024x681.jpg";s:5:"width";i:1024;s:6:"height";i:681;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:41:"unsplash_looking_at_the_arch-1200x798.jpg";s:5:"width";i:1200;s:6:"height";i:798;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:41:"unsplash_looking_at_the_arch-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:41:"unsplash_looking_at_the_arch-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:40:"unsplash_looking_at_the_arch-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:40:"unsplash_looking_at_the_arch-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:40:"unsplash_looking_at_the_arch-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(49, 451, '_wp_attached_file', '2014/07/unsplash_mansion.jpg'),
(50, 451, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1315;s:4:"file";s:28:"2014/07/unsplash_mansion.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:28:"unsplash_mansion-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:28:"unsplash_mansion-300x205.jpg";s:5:"width";i:300;s:6:"height";i:205;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:29:"unsplash_mansion-1024x701.jpg";s:5:"width";i:1024;s:6:"height";i:701;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:29:"unsplash_mansion-1200x822.jpg";s:5:"width";i:1200;s:6:"height";i:822;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:29:"unsplash_mansion-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:29:"unsplash_mansion-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:28:"unsplash_mansion-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:28:"unsplash_mansion-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:28:"unsplash_mansion-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(51, 452, '_wp_attached_file', '2014/07/unsplash_new_york_city_above.jpg'),
(52, 452, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1275;s:4:"file";s:40:"2014/07/unsplash_new_york_city_above.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:40:"unsplash_new_york_city_above-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:40:"unsplash_new_york_city_above-300x199.jpg";s:5:"width";i:300;s:6:"height";i:199;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:41:"unsplash_new_york_city_above-1024x680.jpg";s:5:"width";i:1024;s:6:"height";i:680;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:41:"unsplash_new_york_city_above-1200x797.jpg";s:5:"width";i:1200;s:6:"height";i:797;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:41:"unsplash_new_york_city_above-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:41:"unsplash_new_york_city_above-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:40:"unsplash_new_york_city_above-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:40:"unsplash_new_york_city_above-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:40:"unsplash_new_york_city_above-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(53, 453, '_wp_attached_file', '2014/07/unsplash_new_york.jpg'),
(54, 453, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:905;s:4:"file";s:29:"2014/07/unsplash_new_york.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:29:"unsplash_new_york-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:29:"unsplash_new_york-300x141.jpg";s:5:"width";i:300;s:6:"height";i:141;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:30:"unsplash_new_york-1024x483.jpg";s:5:"width";i:1024;s:6:"height";i:483;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:30:"unsplash_new_york-1200x566.jpg";s:5:"width";i:1200;s:6:"height";i:566;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:30:"unsplash_new_york-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:30:"unsplash_new_york-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:29:"unsplash_new_york-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:29:"unsplash_new_york-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:29:"unsplash_new_york-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(55, 454, '_wp_attached_file', '2014/07/unsplash_new-york_empire_state_building.jpg'),
(56, 454, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1080;s:4:"file";s:51:"2014/07/unsplash_new-york_empire_state_building.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:51:"unsplash_new-york_empire_state_building-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:51:"unsplash_new-york_empire_state_building-300x169.jpg";s:5:"width";i:300;s:6:"height";i:169;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:52:"unsplash_new-york_empire_state_building-1024x576.jpg";s:5:"width";i:1024;s:6:"height";i:576;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:52:"unsplash_new-york_empire_state_building-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:52:"unsplash_new-york_empire_state_building-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:52:"unsplash_new-york_empire_state_building-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:51:"unsplash_new-york_empire_state_building-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:51:"unsplash_new-york_empire_state_building-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:51:"unsplash_new-york_empire_state_building-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(57, 455, '_wp_attached_file', '2014/07/unsplash_paris_house_front.jpg'),
(58, 455, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1920;s:4:"file";s:38:"2014/07/unsplash_paris_house_front.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:38:"unsplash_paris_house_front-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:38:"unsplash_paris_house_front-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:40:"unsplash_paris_house_front-1024x1024.jpg";s:5:"width";i:1024;s:6:"height";i:1024;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:40:"unsplash_paris_house_front-1200x1200.jpg";s:5:"width";i:1200;s:6:"height";i:1200;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:39:"unsplash_paris_house_front-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:39:"unsplash_paris_house_front-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:38:"unsplash_paris_house_front-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:38:"unsplash_paris_house_front-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:38:"unsplash_paris_house_front-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(59, 456, '_wp_attached_file', '2014/07/unsplash_rooftops.jpg'),
(60, 456, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1268;s:4:"file";s:29:"2014/07/unsplash_rooftops.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:29:"unsplash_rooftops-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:29:"unsplash_rooftops-300x198.jpg";s:5:"width";i:300;s:6:"height";i:198;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:30:"unsplash_rooftops-1024x676.jpg";s:5:"width";i:1024;s:6:"height";i:676;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:30:"unsplash_rooftops-1200x793.jpg";s:5:"width";i:1200;s:6:"height";i:793;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:30:"unsplash_rooftops-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:30:"unsplash_rooftops-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:29:"unsplash_rooftops-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:29:"unsplash_rooftops-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:29:"unsplash_rooftops-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(61, 460, '_wp_attached_file', '2013/07/picjumbo_dubai_skyscraper.jpg'),
(62, 460, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1440;s:4:"file";s:37:"2013/07/picjumbo_dubai_skyscraper.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:37:"picjumbo_dubai_skyscraper-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:37:"picjumbo_dubai_skyscraper-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper-1024x768.jpg";s:5:"width";i:1024;s:6:"height";i:768;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper-1200x900.jpg";s:5:"width";i:1200;s:6:"height";i:900;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:37:"picjumbo_dubai_skyscraper-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:37:"picjumbo_dubai_skyscraper-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:37:"picjumbo_dubai_skyscraper-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(63, 461, '_menu_item_type', 'custom'),
(64, 461, '_menu_item_menu_item_parent', '0'),
(65, 461, '_menu_item_object_id', '461'),
(66, 461, '_menu_item_object', 'custom'),
(67, 461, '_menu_item_target', ''),
(68, 461, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(69, 461, '_menu_item_xfn', ''),
(70, 461, '_menu_item_url', '#'),
(79, 463, '_menu_item_type', 'custom'),
(80, 463, '_menu_item_menu_item_parent', '0'),
(81, 463, '_menu_item_object_id', '463'),
(82, 463, '_menu_item_object', 'custom'),
(83, 463, '_menu_item_target', ''),
(84, 463, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(85, 463, '_menu_item_xfn', ''),
(86, 463, '_menu_item_url', '#'),
(191, 477, '_wp_attached_file', '2013/07/picjumbo_dubai_skyscraper2.jpg'),
(192, 477, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1359;s:4:"file";s:38:"2013/07/picjumbo_dubai_skyscraper2.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper2-300x212.jpg";s:5:"width";i:300;s:6:"height";i:212;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:39:"picjumbo_dubai_skyscraper2-1024x725.jpg";s:5:"width";i:1024;s:6:"height";i:725;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:39:"picjumbo_dubai_skyscraper2-1200x849.jpg";s:5:"width";i:1200;s:6:"height";i:849;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:39:"picjumbo_dubai_skyscraper2-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:39:"picjumbo_dubai_skyscraper2-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper2-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper2-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper2-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(193, 478, '_wp_attached_file', '2013/07/picjumbo_dubai_skyscraper3.jpg'),
(194, 478, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:1920;s:6:"height";i:1125;s:4:"file";s:38:"2013/07/picjumbo_dubai_skyscraper3.jpg";s:5:"sizes";a:9:{s:9:"thumbnail";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper3-300x176.jpg";s:5:"width";i:300;s:6:"height";i:176;s:9:"mime-type";s:10:"image/jpeg";}s:5:"large";a:4:{s:4:"file";s:39:"picjumbo_dubai_skyscraper3-1024x600.jpg";s:5:"width";i:1024;s:6:"height";i:600;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-1200";a:4:{s:4:"file";s:39:"picjumbo_dubai_skyscraper3-1200x703.jpg";s:5:"width";i:1200;s:6:"height";i:703;s:9:"mime-type";s:10:"image/jpeg";}s:14:"thumbnail-16-9";a:4:{s:4:"file";s:39:"picjumbo_dubai_skyscraper3-1200x675.jpg";s:5:"width";i:1200;s:6:"height";i:675;s:9:"mime-type";s:10:"image/jpeg";}s:18:"thumbnail-1200-400";a:4:{s:4:"file";s:39:"picjumbo_dubai_skyscraper3-1200x400.jpg";s:5:"width";i:1200;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}s:17:"thumbnail-400-300";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper3-400x300.jpg";s:5:"width";i:400;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:14:"property-thumb";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper3-600x300.jpg";s:5:"width";i:600;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}s:10:"square-400";a:4:{s:4:"file";s:38:"picjumbo_dubai_skyscraper3-400x400.jpg";s:5:"width";i:400;s:6:"height";i:400;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(195, 479, '_wp_attached_file', '2014/10/favicon-realty.png'),
(196, 479, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:64;s:6:"height";i:64;s:4:"file";s:26:"2014/10/favicon-realty.png";s:5:"sizes";a:0:{}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(197, 480, '_wp_attached_file', '2014/10/logo-realty.png'),
(198, 480, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:60;s:4:"file";s:23:"2014/10/logo-realty.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"logo-realty-150x60.png";s:5:"width";i:150;s:6:"height";i:60;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:22:"logo-realty-300x60.png";s:5:"width";i:300;s:6:"height";i:60;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(199, 21, '_edit_last', '1'),
(200, 21, '_wp_page_template', 'template-property-search.php'),
(201, 21, 'estate_page_hide_sidebar', '0'),
(202, 33, '_edit_last', '1'),
(203, 33, '_wp_page_template', 'template-home-slideshow.php'),
(204, 33, 'estate_page_hide_sidebar', '0'),
(205, 40, '_edit_last', '1'),
(206, 40, '_wp_page_template', 'default'),
(207, 40, 'estate_page_hide_sidebar', '0'),
(208, 93, '_edit_last', '1'),
(209, 93, '_wp_page_template', 'template-intro.php'),
(210, 93, 'estate_page_hide_sidebar', '0'),
(211, 93, '_thumbnail_id', '452'),
(212, 93, 'estate_property_slideshow_type', 'featured'),
(213, 93, 'estate_property_slideshow_mini_search', '0'),
(214, 93, 'estate_property_slideshow_fullscreen', '0'),
(215, 105, '_edit_last', '1'),
(216, 105, '_wp_page_template', 'default'),
(217, 105, 'estate_page_hide_sidebar', '0'),
(218, 110, '_edit_last', '1'),
(219, 110, '_wp_page_template', 'template-contact.php'),
(220, 110, 'estate_page_hide_sidebar', '0'),
(221, 122, '_edit_last', '1'),
(222, 122, '_wp_page_template', 'template-home-properties-map.php'),
(223, 122, 'estate_page_hide_sidebar', '0'),
(224, 137, '_edit_last', '1'),
(225, 137, '_wp_page_template', 'default'),
(226, 137, 'estate_page_hide_sidebar', '0'),
(227, 137, 'estate_property_slideshow_type', 'featured'),
(228, 137, 'estate_property_slideshow_mini_search', '0'),
(229, 137, 'estate_property_slideshow_fullscreen', '0'),
(230, 265, '_edit_last', '1'),
(231, 265, '_wp_page_template', 'default'),
(232, 265, 'estate_page_hide_sidebar', '0'),
(241, 482, '_menu_item_type', 'post_type'),
(242, 482, '_menu_item_menu_item_parent', '461'),
(243, 482, '_menu_item_object_id', '93'),
(244, 482, '_menu_item_object', 'page'),
(245, 482, '_menu_item_target', ''),
(246, 482, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(247, 482, '_menu_item_xfn', ''),
(248, 482, '_menu_item_url', ''),
(249, 483, '_menu_item_type', 'post_type'),
(250, 483, '_menu_item_menu_item_parent', '461'),
(251, 483, '_menu_item_object_id', '33'),
(252, 483, '_menu_item_object', 'page'),
(253, 483, '_menu_item_target', ''),
(254, 483, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(255, 483, '_menu_item_xfn', ''),
(256, 483, '_menu_item_url', ''),
(265, 485, '_menu_item_type', 'post_type'),
(266, 485, '_menu_item_menu_item_parent', '463'),
(267, 485, '_menu_item_object_id', '21'),
(268, 485, '_menu_item_object', 'page'),
(269, 485, '_menu_item_target', ''),
(270, 485, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(271, 485, '_menu_item_xfn', ''),
(272, 485, '_menu_item_url', ''),
(273, 486, '_menu_item_type', 'post_type'),
(274, 486, '_menu_item_menu_item_parent', '0'),
(275, 486, '_menu_item_object_id', '105'),
(276, 486, '_menu_item_object', 'page'),
(277, 486, '_menu_item_target', ''),
(278, 486, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(279, 486, '_menu_item_xfn', ''),
(280, 486, '_menu_item_url', ''),
(281, 487, '_menu_item_type', 'post_type'),
(282, 487, '_menu_item_menu_item_parent', '0'),
(283, 487, '_menu_item_object_id', '110'),
(284, 487, '_menu_item_object', 'page'),
(285, 487, '_menu_item_target', ''),
(286, 487, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(287, 487, '_menu_item_xfn', ''),
(288, 487, '_menu_item_url', ''),
(289, 488, '_menu_item_type', 'post_type'),
(290, 488, '_menu_item_menu_item_parent', '461'),
(291, 488, '_menu_item_object_id', '122'),
(292, 488, '_menu_item_object', 'page'),
(293, 488, '_menu_item_target', ''),
(294, 488, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(295, 488, '_menu_item_xfn', ''),
(296, 488, '_menu_item_url', ''),
(1186, 768, '_edit_last', '1'),
(1185, 768, '_edit_lock', '1423803737:1'),
(1183, 93, '_edit_lock', '1423048017:1'),
(313, 45, '_edit_last', '1'),
(314, 45, 'estate_property_sold', '0'),
(315, 45, 'estate_property_featured', '1'),
(316, 45, 'estate_property_address', 'Birdcage Walk, Westminster, London, UK'),
(317, 45, 'estate_property_location', '51.5007153,-0.13608049999993455'),
(318, 45, 'estate_property_available_from', '20140101'),
(319, 45, 'estate_property_price', '4500000'),
(320, 45, 'estate_property_size', '600'),
(321, 45, 'estate_property_size_unit', 'sq ft'),
(322, 45, 'estate_property_rooms', '6'),
(323, 45, 'estate_property_bedrooms', '2'),
(324, 45, 'estate_property_bathrooms', '2'),
(325, 45, 'estate_property_garages', '1'),
(326, 45, 'estate_property_agent', '51'),
(327, 45, 'estate_page_hide_sidebar', '0'),
(328, 45, 'estate_property_layout_boxed', '0'),
(329, 45, 'estate_property_id', 'APT-LND-001'),
(330, 45, 'estate_property_layout', 'boxed'),
(331, 45, '_thumbnail_id', '440'),
(332, 45, 'estate_property_contact_information', 'all'),
(333, 45, 'estate_property_slideshow_type', 'featured'),
(334, 45, 'estate_property_slideshow_mini_search', '0'),
(335, 45, 'estate_property_slideshow_fullscreen', '0');
INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(359, 65, '_edit_last', '1'),
(360, 65, 'estate_property_sold', '0'),
(361, 65, 'estate_property_layout_boxed', '0'),
(362, 65, 'estate_property_featured', '0'),
(363, 65, 'estate_property_id', 'HS-LND-002'),
(364, 65, 'estate_property_address', 'Smith Square, Westminster, London, UK'),
(365, 65, 'estate_property_location', '51.4956918,-0.12703690000000734'),
(366, 65, 'estate_property_available_from', '20140701'),
(367, 65, 'estate_property_price', '2400000'),
(368, 65, 'estate_property_size', '480'),
(369, 65, 'estate_property_size_unit', 'sq ft'),
(370, 65, 'estate_property_rooms', '5'),
(371, 65, 'estate_property_bedrooms', '1'),
(372, 65, 'estate_property_bathrooms', '1'),
(373, 65, 'estate_property_garages', '1'),
(374, 65, 'estate_property_agent', '51'),
(375, 65, 'estate_page_hide_sidebar', '0'),
(376, 65, 'estate_property_layout', 'boxed'),
(377, 65, '_thumbnail_id', '448'),
(378, 65, 'estate_property_contact_information', 'all'),
(379, 65, 'estate_property_slideshow_type', 'featured'),
(380, 65, 'estate_property_slideshow_mini_search', '0'),
(381, 65, 'estate_property_slideshow_fullscreen', '0'),
(382, 65, 'estate_property_video_provider', 'vimeo'),
(383, 65, 'estate_property_video_id', '100449943'),
(384, 73, '_edit_last', '1'),
(385, 73, 'estate_property_sold', '1'),
(386, 73, 'estate_property_layout_boxed', '0'),
(387, 73, 'estate_property_featured', '0'),
(388, 73, 'estate_property_id', 'OFFC-LND-001'),
(389, 73, 'estate_property_address', '5 Walbrook, London, UK'),
(390, 73, 'estate_property_location', '51.5126397,-0.09013279999999213'),
(391, 73, 'estate_property_available_from', '20140701'),
(392, 73, 'estate_property_price', '4500'),
(393, 73, 'estate_property_price_text', '/month'),
(394, 73, 'estate_property_size', '120'),
(395, 73, 'estate_property_size_unit', 'sq ft'),
(396, 73, 'estate_property_rooms', '1'),
(397, 73, 'estate_property_bedrooms', '0'),
(398, 73, 'estate_property_bathrooms', '0'),
(399, 73, 'estate_property_garages', '0'),
(400, 73, 'estate_property_agent', '62'),
(401, 73, 'estate_page_hide_sidebar', '0'),
(402, 73, 'estate_property_layout', 'theme_option_setting'),
(403, 73, '_thumbnail_id', '442'),
(404, 73, 'estate_property_contact_information', 'all'),
(405, 73, 'estate_property_slideshow_type', 'featured'),
(406, 73, 'estate_property_slideshow_mini_search', '0'),
(407, 73, 'estate_property_slideshow_fullscreen', '0'),
(432, 77, '_edit_last', '1'),
(433, 77, 'estate_property_sold', '1'),
(434, 77, 'estate_property_layout_boxed', '0'),
(435, 77, 'estate_property_featured', '0'),
(436, 77, 'estate_property_id', 'OFF-PRS-001'),
(437, 77, 'estate_property_address', '51 Boulevard Suchet, Paris, France'),
(438, 77, 'estate_property_location', '48.8526377,2.2619350999999597'),
(439, 77, 'estate_property_available_from', '20140701'),
(440, 77, 'estate_property_price', '850000'),
(441, 77, 'estate_property_size', '500'),
(442, 77, 'estate_property_size_unit', 'sq ft'),
(443, 77, 'estate_property_rooms', '4'),
(444, 77, 'estate_property_bedrooms', '0'),
(445, 77, 'estate_property_bathrooms', '0'),
(446, 77, 'estate_property_garages', '0'),
(447, 77, 'estate_property_agent', '79'),
(448, 77, 'estate_page_hide_sidebar', '0'),
(449, 77, 'estate_property_layout', 'theme_option_setting'),
(450, 77, '_thumbnail_id', '441'),
(451, 77, 'estate_property_contact_information', 'all'),
(452, 77, 'estate_property_slideshow_type', 'featured'),
(453, 77, 'estate_property_slideshow_mini_search', '0'),
(454, 77, 'estate_property_slideshow_fullscreen', '0'),
(1140, 758, 'estate_property_price', '26'),
(1141, 758, 'estate_property_price_text', '/week'),
(1142, 758, 'estate_property_size', '36'),
(1143, 758, 'estate_property_size_unit', 'sq ft'),
(1144, 758, 'estate_property_rooms', '7'),
(1145, 758, 'estate_property_bedrooms', '3'),
(1146, 758, 'estate_property_bathrooms', '3'),
(1147, 758, 'estate_property_garages', '3'),
(1122, 198, '_edit_lock', '1422012464:1'),
(479, 107, '_edit_last', '1'),
(480, 107, 'estate_page_hide_sidebar', '0'),
(481, 107, '_wp_old_slug', 'standard-post-with-featured-image'),
(482, 107, '_oembed_ec35f85dad7cec1f9c80e4d9ed6ca994', '<iframe src="//player.vimeo.com/video/78472610" width="1170" height="658" frameborder="0" title="All The Way - a Charles Bukowski poem" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'),
(483, 107, '_thumbnail_id', '439'),
(484, 107, '_oembed_time_ec35f85dad7cec1f9c80e4d9ed6ca994', '1418380094'),
(485, 118, '_edit_last', '1'),
(486, 118, 'estate_page_hide_sidebar', '0'),
(487, 118, '_oembed_ec35f85dad7cec1f9c80e4d9ed6ca994', '<iframe src="//player.vimeo.com/video/78472610" width="1170" height="658" frameborder="0" title="All The Way - a Charles Bukowski poem" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'),
(488, 118, 'estate_post_gallery', '453'),
(489, 118, 'estate_post_gallery', '456'),
(490, 118, '_oembed_time_ec35f85dad7cec1f9c80e4d9ed6ca994', '1418380121'),
(491, 120, '_edit_last', '1'),
(492, 120, 'estate_post_video_url', 'http://vimeo.com/99370876'),
(493, 120, 'estate_page_hide_sidebar', '0'),
(494, 120, '_oembed_ec35f85dad7cec1f9c80e4d9ed6ca994', '<iframe src="//player.vimeo.com/video/78472610" width="1170" height="658" frameborder="0" title="All The Way - a Charles Bukowski poem" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'),
(495, 120, '_oembed_time_ec35f85dad7cec1f9c80e4d9ed6ca994', '1418380132'),
(496, 262, '_edit_last', '1'),
(497, 262, 'estate_page_hide_sidebar', '0'),
(498, 262, '_oembed_ec35f85dad7cec1f9c80e4d9ed6ca994', '<iframe src="//player.vimeo.com/video/78472610" width="1170" height="658" frameborder="0" title="All The Way - a Charles Bukowski poem" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'),
(499, 262, '_oembed_time_ec35f85dad7cec1f9c80e4d9ed6ca994', '1418380017'),
(500, 292, '_edit_last', '1'),
(501, 292, '_wp_page_template', 'default'),
(502, 292, 'estate_page_hide_sidebar', '0'),
(503, 292, 'estate_property_slideshow_type', 'featured'),
(504, 292, 'estate_property_slideshow_mini_search', '0'),
(505, 292, 'estate_property_slideshow_fullscreen', '0'),
(506, 297, '_edit_last', '1'),
(507, 297, 'estate_property_sold', '0'),
(508, 297, 'estate_property_layout_boxed', '0'),
(509, 297, 'estate_property_featured', '1'),
(510, 297, 'estate_property_id', 'HS-LND-003'),
(511, 297, 'estate_property_location', '51.5069927,-0.13605989999996382'),
(512, 297, 'estate_property_available_from', '20140101'),
(513, 297, 'estate_property_price', '7500'),
(514, 297, 'estate_property_size', '1500'),
(515, 297, 'estate_property_size_unit', 'sq ft'),
(516, 297, 'estate_property_rooms', '7'),
(517, 297, 'estate_property_bedrooms', '2'),
(518, 297, 'estate_property_bathrooms', '2'),
(519, 297, 'estate_property_garages', '1'),
(520, 297, 'estate_property_agent', '79'),
(521, 297, 'estate_page_hide_sidebar', '0'),
(522, 297, 'estate_property_address', 'St. James, London, UK'),
(523, 297, 'estate_property_price_text', '/week'),
(524, 297, 'estate_property_layout', 'theme_option_setting'),
(525, 297, '_thumbnail_id', '460'),
(526, 297, 'estate_property_images', '460'),
(527, 297, 'estate_property_images', '461'),
(528, 297, 'estate_property_images', '462'),
(529, 297, 'estate_property_contact_information', 'all'),
(530, 297, 'estate_property_slideshow_type', 'featured'),
(531, 297, 'estate_property_slideshow_mini_search', '0'),
(532, 297, 'estate_property_slideshow_fullscreen', '0'),
(533, 395, '_edit_last', '1'),
(534, 395, '_wp_page_template', 'template-user-profile.php'),
(535, 395, 'estate_page_hide_sidebar', '0'),
(536, 397, '_edit_last', '1'),
(537, 397, '_wp_page_template', 'template-user-favorites.php'),
(538, 397, 'estate_page_hide_sidebar', '0'),
(539, 409, '_edit_last', '1'),
(540, 409, '_wp_page_template', 'template-property-submit-listing.php'),
(541, 409, 'estate_page_hide_sidebar', '0'),
(542, 410, '_edit_last', '1'),
(543, 410, 'estate_property_sold', '0'),
(544, 410, 'estate_property_layout_boxed', '1'),
(545, 410, 'estate_property_featured', '0'),
(546, 410, 'estate_property_id', 'VLA-LND-002'),
(547, 410, 'estate_property_address', '3 Wilton Crescent, London, UK'),
(548, 410, 'estate_property_location', '51.5000211,-0.15626220000001467'),
(549, 410, 'estate_property_available_from', '20140101'),
(550, 410, 'estate_property_price', '12000000'),
(551, 410, 'estate_property_size', '18000'),
(552, 410, 'estate_property_size_unit', 'sq ft'),
(553, 410, 'estate_property_rooms', '8'),
(554, 410, 'estate_property_bedrooms', '3'),
(555, 410, 'estate_property_bathrooms', '3'),
(556, 410, 'estate_property_garages', '2'),
(557, 410, 'estate_property_agent', '81'),
(558, 410, 'estate_page_hide_sidebar', '1'),
(559, 410, 'estate_property_layout', 'boxed'),
(560, 410, '_thumbnail_id', '444'),
(561, 410, 'estate_property_images', '444'),
(562, 410, 'estate_property_images', '451'),
(563, 410, 'estate_property_images', '443'),
(564, 410, 'estate_property_contact_information', 'all'),
(565, 410, 'estate_property_slideshow_type', 'featured'),
(566, 410, 'estate_property_slideshow_mini_search', '0'),
(567, 410, 'estate_property_slideshow_fullscreen', '0'),
(568, 410, 'estate_property_video_provider', 'vimeo'),
(569, 410, 'estate_property_video_id', '89938769'),
(570, 421, '_edit_last', '1'),
(571, 421, '_wp_page_template', 'template-property-submit.php'),
(572, 421, 'estate_page_hide_sidebar', '0'),
(573, 491, '_edit_last', '1'),
(574, 491, '_wp_page_template', 'template-property-slideshow.php'),
(575, 491, 'estate_page_hide_sidebar', '0'),
(576, 491, 'estate_property_slideshow_type', 'selected'),
(577, 491, 'estate_property_slideshow_mini_search', '1'),
(578, 491, 'estate_property_slideshow_fullscreen', '1'),
(579, 491, 'estate_property_slideshow_selected_properties', '68'),
(580, 491, 'estate_property_slideshow_selected_properties', '410'),
(581, 491, 'estate_property_slideshow_search', 'mini'),
(582, 494, '_edit_last', '1'),
(583, 494, '_wp_page_template', 'default'),
(584, 494, 'estate_page_hide_sidebar', '0'),
(585, 494, 'estate_property_slideshow_type', 'latest'),
(586, 68, '_edit_last', '1'),
(587, 68, 'estate_property_sold', '0'),
(588, 68, 'estate_property_layout_boxed', '0'),
(589, 68, 'estate_property_featured', '1'),
(590, 68, 'estate_property_id', 'VLL-LND-001'),
(591, 68, 'estate_property_address', '125 Oakley St, London, UK'),
(592, 68, 'estate_property_location', '51.48623550000001,-0.16945559999999205'),
(593, 68, 'estate_property_available_from', '20140701'),
(594, 68, 'estate_property_price', '12000'),
(595, 68, 'estate_property_price_text', '/month'),
(596, 68, 'estate_property_size', '1200'),
(597, 68, 'estate_property_size_unit', 'sq ft'),
(598, 68, 'estate_property_rooms', '10'),
(599, 68, 'estate_property_bedrooms', '3'),
(600, 68, 'estate_property_bathrooms', '3'),
(601, 68, 'estate_property_garages', '2'),
(602, 68, 'estate_page_hide_sidebar', '1'),
(603, 68, 'estate_property_layout', 'theme_option_setting'),
(604, 68, 'estate_property_status_update', 'Rented Out'),
(605, 68, 'estate_property_contact_information', 'all'),
(606, 68, '_thumbnail_id', '451'),
(607, 68, 'estate_property_images', '451'),
(608, 68, 'estate_property_images', '444'),
(609, 68, 'estate_property_images', '443'),
(610, 68, 'estate_property_slideshow_type', 'featured'),
(611, 68, 'estate_property_slideshow_mini_search', '0'),
(612, 68, 'estate_property_slideshow_fullscreen', '0'),
(613, 68, 'estate_property_video_provider', 'youtube'),
(614, 68, 'estate_property_video_id', 'cgS01tX9Qrk'),
(615, 95, '_edit_last', '1'),
(616, 95, 'estate_property_sold', '1'),
(617, 95, 'estate_property_layout_boxed', '0'),
(618, 95, 'estate_property_featured', '0'),
(619, 95, 'estate_property_id', 'APT-LND-003'),
(620, 95, 'estate_property_location', '51.5153445,-0.141115500000069'),
(621, 95, 'estate_property_available_from', '20140101'),
(622, 95, 'estate_property_price', '290000'),
(623, 95, 'estate_property_size', '250'),
(624, 95, 'estate_property_size_unit', 'sq ft'),
(625, 95, 'estate_property_rooms', '2'),
(626, 95, 'estate_property_bedrooms', '1'),
(627, 95, 'estate_property_bathrooms', '1'),
(628, 95, 'estate_property_garages', '0'),
(629, 95, 'estate_page_hide_sidebar', '0'),
(630, 95, 'estate_property_address', 'Oxford St, Lonodon, UK'),
(631, 95, 'estate_property_layout', 'theme_option_setting'),
(632, 95, 'estate_property_status_update', 'Sold'),
(633, 95, 'estate_property_contact_information', 'all'),
(634, 95, '_thumbnail_id', '439'),
(635, 95, 'estate_property_slideshow_type', 'featured'),
(636, 95, 'estate_property_slideshow_mini_search', '0'),
(637, 95, 'estate_property_slideshow_fullscreen', '0'),
(638, 95, 'estate_property_video_provider', 'youtube'),
(639, 95, 'estate_property_video_id', 'Uv_SNg4bhtE'),
(640, 97, '_edit_last', '1'),
(641, 97, 'estate_property_sold', '0'),
(642, 97, 'estate_property_layout_boxed', '0'),
(643, 97, 'estate_property_featured', '1'),
(644, 97, 'estate_property_id', 'APT-LND-004'),
(645, 97, 'estate_property_available_from', '20140101'),
(646, 97, 'estate_property_price', '2400'),
(647, 97, 'estate_property_price_text', '/week'),
(648, 97, 'estate_property_size', '450'),
(649, 97, 'estate_property_size_unit', 'sq ft'),
(650, 97, 'estate_property_rooms', '2'),
(651, 97, 'estate_property_bedrooms', '1'),
(652, 97, 'estate_property_bathrooms', '1'),
(653, 97, 'estate_property_garages', '1'),
(654, 97, 'estate_property_agent', '62'),
(655, 97, 'estate_page_hide_sidebar', '0'),
(656, 97, 'estate_property_location', '51.5018318,-0.11682380000002013'),
(657, 97, 'estate_property_address', '180 York Road, London, UK'),
(658, 97, 'estate_property_layout', 'theme_option_setting'),
(659, 97, '_thumbnail_id', '449'),
(660, 97, 'estate_property_contact_information', 'all'),
(661, 97, 'estate_property_slideshow_type', 'featured'),
(662, 97, 'estate_property_slideshow_mini_search', '0'),
(663, 97, 'estate_property_slideshow_fullscreen', '0'),
(664, 113, '_form', '<div class="row">\n<div class="form-group col-sm-6">\n[text* your-name class:form-control id:name placeholder "Name"]\n[email* your-email class:form-control id:email placeholder "Email"]\n[text your-subject class:form-control id:subject placeholder "Subject"]\n</div>\n<div class="form-group col-sm-6">\n[textarea your-message class:form-control id:message placeholder "Message"]\n</div>\n<div class="form-group col-sm-12">\n[quiz captcha "7even + 5ive = |12"]\n[submit class:btn class:btn-primary "Send the message"]\n</div>\n</div>'),
(665, 113, '_mail', ''),
(666, 113, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:26:"[your-name] <[your-email]>";s:4:"body";s:28:"Message Body:\n[your-message]";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:0:"";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(667, 113, '_messages', 'a:21:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:16:"invalid_required";s:31:"Please fill the required field.";s:17:"captcha_not_match";s:31:"Your entered code is incorrect.";s:14:"invalid_number";s:28:"Number format seems invalid.";s:16:"number_too_small";s:25:"This number is too small.";s:16:"number_too_large";s:25:"This number is too large.";s:13:"invalid_email";s:28:"Email address seems invalid.";s:11:"invalid_url";s:18:"URL seems invalid.";s:11:"invalid_tel";s:31:"Telephone number seems invalid.";s:23:"quiz_answer_not_correct";s:27:"Your answer is not correct.";s:12:"invalid_date";s:26:"Date format seems invalid.";s:14:"date_too_early";s:23:"This date is too early.";s:13:"date_too_late";s:22:"This date is too late.";s:13:"upload_failed";s:22:"Failed to upload file.";s:24:"upload_file_type_invalid";s:30:"This file type is not allowed.";s:21:"upload_file_too_large";s:23:"This file is too large.";s:23:"upload_failed_php_error";s:38:"Failed to upload file. Error occurred.";}'),
(668, 113, '_additional_settings', ''),
(669, 113, '_locale', 'en_US'),
(670, 114, '_form', '[text* your-name placeholder "Name"]\n[email* your-email placeholder "Email"]\n[text your-subject placeholder "Subject"]\n[textarea your-message placeholder "Message"]\n[quiz captcha "7even + 5ive =|12"]\n[submit "Send"]'),
(671, 114, '_mail', ''),
(672, 114, '_mail_2', 'a:9:{s:6:"active";b:0;s:7:"subject";s:14:"[your-subject]";s:6:"sender";s:26:"[your-name] <[your-email]>";s:4:"body";s:28:"Message Body:\n[your-message]";s:9:"recipient";s:12:"[your-email]";s:18:"additional_headers";s:0:"";s:11:"attachments";s:0:"";s:8:"use_html";b:0;s:13:"exclude_blank";b:0;}'),
(673, 114, '_messages', 'a:21:{s:12:"mail_sent_ok";s:43:"Your message was sent successfully. Thanks.";s:12:"mail_sent_ng";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:16:"validation_error";s:74:"Validation errors occurred. Please confirm the fields and submit it again.";s:4:"spam";s:93:"Failed to send your message. Please try later or contact the administrator by another method.";s:12:"accept_terms";s:35:"Please accept the terms to proceed.";s:16:"invalid_required";s:31:"Please fill the required field.";s:17:"captcha_not_match";s:31:"Your entered code is incorrect.";s:14:"invalid_number";s:28:"Number format seems invalid.";s:16:"number_too_small";s:25:"This number is too small.";s:16:"number_too_large";s:25:"This number is too large.";s:13:"invalid_email";s:28:"Email address seems invalid.";s:11:"invalid_url";s:18:"URL seems invalid.";s:11:"invalid_tel";s:31:"Telephone number seems invalid.";s:23:"quiz_answer_not_correct";s:27:"Your answer is not correct.";s:12:"invalid_date";s:26:"Date format seems invalid.";s:14:"date_too_early";s:23:"This date is too early.";s:13:"date_too_late";s:22:"This date is too late.";s:13:"upload_failed";s:22:"Failed to upload file.";s:24:"upload_file_type_invalid";s:30:"This file type is not allowed.";s:21:"upload_file_too_large";s:23:"This file is too large.";s:23:"upload_failed_php_error";s:38:"Failed to upload file. Error occurred.";}'),
(674, 114, '_additional_settings', ''),
(675, 114, '_locale', 'en_US'),
(676, 181, '_edit_last', '1'),
(677, 181, 'estate_testimonial_text', 'I can''t speak high enough of the quality service I received from this real estate company. Everything went smoothly, and I would even say we discovered a real gem for me and my husband.'),
(678, 181, '_thumbnail_id', '438'),
(679, 193, '_edit_last', '1'),
(680, 193, 'estate_testimonial_text', 'What an amazing team. I am more than please with the help I got from everyone of you. I will hire you next time for sure. '),
(681, 193, '_thumbnail_id', '438'),
(682, 198, '_edit_last', '1'),
(683, 198, 'estate_testimonial_text', 'These are real estate professionals, trust me, they are worth every cent. I will keep recommending you over and over. Thank you so much.'),
(684, 198, '_thumbnail_id', '438'),
(685, 199, '_edit_last', '1'),
(686, 199, 'estate_testimonial_text', 'Well, I didn''t expect much when first contacting you. To say I am pleased with the results would be a huge understatement. These people have real estate in their blood.'),
(687, 199, '_thumbnail_id', '438'),
(1182, 95, 'estate_property_tour_date_time_1', '2015-02-03 09:39'),
(1181, 95, 'estate_property_images', '479'),
(1180, 95, 'estate_property_images', '478'),
(1179, 95, 'estate_property_images', '477'),
(1178, 95, 'estate_property_images', '480'),
(698, 105, '_edit_lock', '1420448705:1'),
(699, 105, 'estate_property_slideshow_type', 'latest'),
(1082, 739, '_edit_last', '1'),
(1083, 739, '_wp_page_template', 'default'),
(1084, 739, 'estate_page_hide_sidebar', '0'),
(1085, 739, 'estate_property_slideshow_type', 'latest'),
(1086, 739, '_edit_lock', '1421127376:1'),
(1088, 107, '_edit_lock', '1421399778:1'),
(1087, 73, 'estate_property_tour_date_time', 's:63:"a:2:{i:0;s:16:"2015-03-11 10:36";i:1;s:17:"2015-03-13 10:55 ";}";'),
(771, 33, '_edit_lock', '1422714297:1'),
(772, 33, 'estate_property_slideshow_type', 'latest'),
(802, 518, '_edit_lock', '1420546060:1'),
(803, 518, '_edit_last', '1'),
(805, 97, '_edit_lock', '1420717173:1'),
(806, 95, '_edit_lock', '1422940093:1'),
(840, 65, '_edit_lock', '1422946355:1'),
(895, 609, 'estate_page_hide_sidebar', '0'),
(894, 609, '_wp_page_template', 'application-form.php'),
(893, 609, '_edit_last', '1'),
(892, 609, '_edit_lock', '1422714500:1'),
(870, 95, 'wp_test', 'test value '),
(871, 95, '_wp_test', 'field_54aa2e3b561dc'),
(872, 95, '_', 'field_54aa2e66561dd'),
(896, 609, 'estate_property_slideshow_type', 'latest'),
(1184, 768, 'estate_property_tour_date_time', 's:2:"N;";'),
(1125, 45, '_edit_lock', '1422433538:1'),
(1173, 95, 'estate_property_tour_date_time', 's:92:"a:3:{i:0;s:16:"2015-01-28 16:26";i:1;s:17:"2015-01-31 16:26 ";i:2;s:17:"2015-01-30 16:26 ";}";'),
(1172, 759, '_edit_lock', '1422437484:1'),
(1170, 759, 'estate_property_contact_information', 'all'),
(1171, 759, '_edit_last', '1'),
(1168, 759, 'wp_test', ''),
(1169, 759, 'estate_property_featured', '0'),
(931, 97, 'wp_test', 'test value'),
(932, 97, '_wp_test', 'field_54aa2e3b561dc'),
(933, 97, '_', 'field_54aa2e66561dd'),
(934, 97, 'estate_property_tour_date_time', '01/08/2015 18:09 '),
(935, 297, '_edit_lock', '1422947169:1'),
(936, 297, 'wp_test', 'test value'),
(937, 297, '_wp_test', 'field_54aa2e3b561dc'),
(938, 297, '_', 'field_54aa2e66561dd'),
(939, 297, 'estate_property_tour_date_time', '01/15/2015 00:08 '),
(955, 73, '_edit_lock', '1425273865:1'),
(956, 73, 'wp_test', 'test value'),
(957, 73, '_wp_test', 'field_54aa2e3b561dc'),
(958, 73, '_', 'field_54aa2e66561dd'),
(1139, 758, 'estate_property_tour_date_time', 's:2:"N;";'),
(1138, 410, '_edit_lock', '1422436922:1'),
(1167, 759, 'estate_property_location', '20.593684, 78.96288000000004'),
(1166, 759, 'estate_property_address', 'India'),
(1165, 759, 'estate_property_garages', '2'),
(1164, 759, 'estate_property_bathrooms', '2'),
(1163, 759, 'estate_property_bedrooms', '2'),
(1162, 759, 'estate_property_rooms', '2'),
(1161, 759, 'estate_property_size_unit', 'sq ft'),
(1160, 759, 'estate_property_size', '522'),
(1159, 759, 'estate_property_price_text', '/day'),
(1158, 759, 'estate_property_price', '21001'),
(1157, 759, 'estate_property_id', '12'),
(1156, 759, 'estate_property_available_from', '20150113'),
(1155, 759, 'estate_property_tour_date_time', 's:2:"N;";'),
(1154, 758, '_edit_lock', '1422437081:1'),
(1153, 758, '_edit_last', '1'),
(1152, 758, 'estate_property_custom_agent', ''),
(1148, 758, 'estate_property_address', 'India'),
(1149, 758, 'wp_test', ''),
(1150, 758, 'estate_property_featured', '0'),
(1151, 758, 'estate_property_contact_information', 'all'),
(1117, 460, '_edit_lock', '1421393830:1'),
(1116, 65, 'estate_property_images', '460'),
(1115, 65, 'estate_property_images', '477'),
(1114, 65, 'estate_property_images', '478'),
(1113, 110, '_edit_lock', '1421327214:1'),
(1070, 65, 'wp_test', 'test value'),
(1071, 65, '_wp_test', 'field_54aa2e3b561dc'),
(1072, 65, '_', 'field_54aa2e66561dd'),
(1074, 65, 'estate_property_tour_date_time', 's:34:"a:1:{i:0;s:16:"2015-01-12 13:27";}";'),
(1075, 68, '_edit_lock', '1423226218:1'),
(1076, 68, 'wp_test', 'test value'),
(1077, 68, '_wp_test', 'field_54aa2e3b561dc'),
(1078, 68, '_', 'field_54aa2e66561dd'),
(1079, 68, 'estate_property_tour_date_time', 's:63:"a:2:{i:0;s:16:"2015-01-12 14:02";i:1;s:17:"2015-01-31 00:00 ";}";'),
(1189, 771, '_wp_attached_file', '2015/03/realestate.sql'),
(1190, 771, '_wp_attachment_context', 'upgrader');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=773 ;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-01-05 05:54:16', '2015-01-05 05:54:16', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-01-06 11:17:34', '2015-01-06 11:17:34', '', 0, 'http://realestate.local/?p=1', 0, 'post', '', 1),
(2, 1, '2015-01-05 05:54:16', '2015-01-05 05:54:16', 'This is an example page. It''s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I''m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin'' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href="http://realestate.local/wp-admin/">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2015-01-05 05:54:16', '2015-01-05 05:54:16', '', 0, 'http://realestate.local/?page_id=2', 0, 'page', '', 0),
(6, 1, '2015-01-05 05:58:32', '2015-01-05 05:58:32', '<p>Your Name (required)<br />\n    [text* your-name] </p>\n\n<p>Your Email (required)<br />\n    [email* your-email] </p>\n\n<p>Subject<br />\n    [text your-subject] </p>\n\n<p>Your Message<br />\n    [textarea your-message] </p>\n\n<p>[submit "Send"]</p>\n[your-subject]\n[your-name] <wordpress@newgenray.com>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Realestate2015 (http://realestate.local)\nakankshagupta@newgneray.com\nReply-To: [your-email]\n\n0\n0\n\n[your-subject]\nRealestate2015 <wordpress@newgenray.com>\nMessage Body:\n[your-message]\n\n--\nThis e-mail was sent from a contact form on Realestate2015 (http://realestate.local)\n[your-email]\nReply-To: akankshagupta@newgneray.com\n\n0\n0\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill the required field.', 'Contact form 1', '', 'publish', 'open', 'open', '', 'contact-form-1', '', '', '2015-01-05 05:58:32', '2015-01-05 05:58:32', '', 0, 'http://realestate.local/?post_type=wpcf7_contact_form&p=6', 0, 'wpcf7_contact_form', '', 0),
(10, 1, '2015-01-05 06:26:04', '2015-01-05 06:26:04', '', 'Wp Test Group', '', 'publish', 'closed', 'closed', '', 'acf_wp-test-group', '', '', '2015-01-05 06:26:04', '2015-01-05 06:26:04', '', 0, 'http://realestate.local/?post_type=acf&#038;p=10', 0, 'acf', '', 0),
(496, 1, '2015-01-05 09:06:52', '2015-01-05 09:06:52', '[alert type="success" dismissable="true"]Set Featured Image Like The One Above To Add A Top Banner To Any Page[/alert]', 'Blog', '', 'inherit', 'open', 'open', '', '105-revision-v1', '', '', '2015-01-05 09:06:52', '2015-01-05 09:06:52', '', 105, 'http://realestate.local/105-revision-v1/', 0, 'revision', '', 0),
(438, 1, '2014-10-08 07:39:52', '2014-10-08 07:39:52', '', 'agent-750-750', '', 'inherit', 'open', 'open', '', 'agent-750-750', '', '', '2014-10-08 07:39:52', '2014-10-08 07:39:52', '', 0, 'http://realestate.local/wp-content/uploads/2014/10/agent-750-750.jpg', 0, 'attachment', 'image/jpeg', 0),
(439, 1, '2014-10-08 07:42:38', '2014-10-08 07:42:38', '', 'picjumbo_house_front', '', 'inherit', 'open', 'open', '', 'picjumbo_house_front', '', '', '2014-10-08 07:42:38', '2014-10-08 07:42:38', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/picjumbo_house_front.jpg', 0, 'attachment', 'image/jpeg', 0),
(440, 1, '2014-10-08 07:42:45', '2014-10-08 07:42:45', '', 'picjumbo_house_street', '', 'inherit', 'open', 'open', '', 'picjumbo_house_street', '', '', '2014-10-08 07:42:45', '2014-10-08 07:42:45', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/picjumbo_house_street.jpg', 0, 'attachment', 'image/jpeg', 0),
(441, 1, '2014-10-08 07:42:52', '2014-10-08 07:42:52', '', 'picjumbo_office1', '', 'inherit', 'open', 'open', '', 'picjumbo_office1', '', '', '2014-10-08 07:42:52', '2014-10-08 07:42:52', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/picjumbo_office1.jpg', 0, 'attachment', 'image/jpeg', 0),
(442, 1, '2014-10-08 07:42:59', '2014-10-08 07:42:59', '', 'picjumbo_office2', '', 'inherit', 'open', 'open', '', 'picjumbo_office2', '', '', '2014-10-08 07:42:59', '2014-10-08 07:42:59', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/picjumbo_office2.jpg', 0, 'attachment', 'image/jpeg', 0),
(443, 1, '2014-10-08 07:43:07', '2014-10-08 07:43:07', '', 'picjumbo_vranov_czech_republic', '', 'inherit', 'open', 'open', '', 'picjumbo_vranov_czech_republic', '', '', '2014-10-08 07:43:07', '2014-10-08 07:43:07', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/picjumbo_vranov_czech_republic.jpg', 0, 'attachment', 'image/jpeg', 0),
(444, 1, '2014-10-08 07:43:12', '2014-10-08 07:43:12', '', 'unsplash_castle', '', 'inherit', 'open', 'open', '', 'unsplash_castle', '', '', '2014-10-08 07:43:12', '2014-10-08 07:43:12', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_castle.jpg', 0, 'attachment', 'image/jpeg', 0),
(445, 1, '2014-10-08 07:43:20', '2014-10-08 07:43:20', '', 'unsplash_house_field', '', 'inherit', 'open', 'open', '', 'unsplash_house_field', '', '', '2014-10-08 07:43:20', '2014-10-08 07:43:20', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_house_field.jpg', 0, 'attachment', 'image/jpeg', 0),
(446, 1, '2014-10-08 07:43:28', '2014-10-08 07:43:28', '', 'unsplash_house_rocks', '', 'inherit', 'open', 'open', '', 'unsplash_house_rocks', '', '', '2014-10-08 07:43:28', '2014-10-08 07:43:28', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_house_rocks.jpg', 0, 'attachment', 'image/jpeg', 0),
(447, 1, '2014-10-08 07:43:33', '2014-10-08 07:43:33', '', 'unsplash_house_top', '', 'inherit', 'open', 'open', '', 'unsplash_house_top', '', '', '2014-10-08 07:43:33', '2014-10-08 07:43:33', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_house_top.jpg', 0, 'attachment', 'image/jpeg', 0),
(448, 1, '2014-10-08 07:43:40', '2014-10-08 07:43:40', '', 'unsplash_house_trees', '', 'inherit', 'open', 'open', '', 'unsplash_house_trees', '', '', '2014-10-08 07:43:40', '2014-10-08 07:43:40', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_house_trees.jpg', 0, 'attachment', 'image/jpeg', 0),
(449, 1, '2014-10-08 07:43:47', '2014-10-08 07:43:47', '', 'unsplash_houses_narrow', '', 'inherit', 'open', 'open', '', 'unsplash_houses_narrow', '', '', '2014-10-08 07:43:47', '2014-10-08 07:43:47', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_houses_narrow.jpg', 0, 'attachment', 'image/jpeg', 0),
(450, 1, '2014-10-08 07:43:51', '2014-10-08 07:43:51', '', 'unsplash_looking_at_the_arch', '', 'inherit', 'open', 'open', '', 'unsplash_looking_at_the_arch', '', '', '2014-10-08 07:43:51', '2014-10-08 07:43:51', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_looking_at_the_arch.jpg', 0, 'attachment', 'image/jpeg', 0),
(451, 1, '2014-10-08 07:43:58', '2014-10-08 07:43:58', '', 'unsplash_mansion', '', 'inherit', 'open', 'open', '', 'unsplash_mansion', '', '', '2014-10-08 07:43:58', '2014-10-08 07:43:58', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_mansion.jpg', 0, 'attachment', 'image/jpeg', 0),
(452, 1, '2014-10-08 07:44:06', '2014-10-08 07:44:06', '', 'unsplash_new_york_city_above', '', 'inherit', 'open', 'open', '', 'unsplash_new_york_city_above', '', '', '2014-10-08 07:44:06', '2014-10-08 07:44:06', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_new_york_city_above.jpg', 0, 'attachment', 'image/jpeg', 0),
(453, 1, '2014-10-08 07:44:11', '2014-10-08 07:44:11', '', 'unsplash_new_york', '', 'inherit', 'open', 'open', '', 'unsplash_new_york', '', '', '2014-10-08 07:44:11', '2014-10-08 07:44:11', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_new_york.jpg', 0, 'attachment', 'image/jpeg', 0),
(454, 1, '2014-10-08 07:44:18', '2014-10-08 07:44:18', '', 'unsplash_new-york_empire_state_building', '', 'inherit', 'open', 'open', '', 'unsplash_new-york_empire_state_building', '', '', '2014-10-08 07:44:18', '2014-10-08 07:44:18', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_new-york_empire_state_building.jpg', 0, 'attachment', 'image/jpeg', 0),
(455, 1, '2014-10-08 07:44:27', '2014-10-08 07:44:27', '', 'unsplash_paris_house_front', '', 'inherit', 'open', 'open', '', 'unsplash_paris_house_front', '', '', '2014-10-08 07:44:27', '2014-10-08 07:44:27', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_paris_house_front.jpg', 0, 'attachment', 'image/jpeg', 0),
(456, 1, '2014-10-08 07:44:32', '2014-10-08 07:44:32', '', 'unsplash_rooftops', '', 'inherit', 'open', 'open', '', 'unsplash_rooftops', '', '', '2014-10-08 07:44:32', '2014-10-08 07:44:32', '', 107, 'http://realestate.local/wp-content/uploads/2014/07/unsplash_rooftops.jpg', 0, 'attachment', 'image/jpeg', 0),
(460, 1, '2014-10-08 07:56:28', '2014-10-08 07:56:28', '', 'picjumbo_dubai_skyscraper', '', 'inherit', 'open', 'open', '', 'picjumbo_dubai_skyscraper', '', '', '2014-10-08 07:56:28', '2014-10-08 07:56:28', '', 297, 'http://realestate.local/wp-content/uploads/2013/07/picjumbo_dubai_skyscraper.jpg', 0, 'attachment', 'image/jpeg', 0),
(461, 1, '2015-01-05 06:49:21', '2015-01-05 06:49:21', '', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2015-01-31 14:19:10', '2015-01-31 14:19:10', '', 0, 'http://realestate.local/home/', 1, 'nav_menu_item', '', 0),
(463, 1, '2015-01-05 06:49:21', '2015-01-05 06:49:21', '', 'Property', '', 'publish', 'open', 'open', '', 'property', '', '', '2015-01-31 14:19:10', '2015-01-31 14:19:10', '', 0, 'http://realestate.local/property/', 5, 'nav_menu_item', '', 0),
(766, 1, '2015-02-04 11:06:38', '2015-02-04 11:06:38', '<img src="http://demo.themetrail.com/realty/wp-content/uploads/2014/07/logo-realty.png" alt="Logo" width="150" height="30" class="alignnone size-full wp-image-342" />\r\n\r\nWelcome to Realty, A Premium Real Estate Theme for WordPress. \r\n\r\nThis intro page is optional. Show a fullscreen background slideshow or single image.\r\n\r\n<a href="../custom-property-search/">Advanced property search</a> on the right-hand side is fully customizable. Add, remove and order it the way you want. Also available as a <a href="../shortcodes/">shortcode</a> and <a href="../real-estate-widgets/">widget</a>. \r\n\r\n<a class="btn" href="../wp_realstate/home-slideshow/">Enter the site »</a>', 'Intro', '', 'inherit', 'open', 'open', '', '93-revision-v1', '', '', '2015-02-04 11:06:38', '2015-02-04 11:06:38', '', 93, 'http://realestate.local/93-revision-v1/', 0, 'revision', '', 0),
(765, 1, '2015-02-04 11:05:42', '2015-02-04 11:05:42', '<img src="http://demo.themetrail.com/realty/wp-content/uploads/2014/07/logo-realty.png" alt="Logo" width="150" height="30" class="alignnone size-full wp-image-342" />\r\n\r\nWelcome to Realty, A Premium Real Estate Theme for WordPress. \r\n\r\nThis intro page is optional. Show a fullscreen background slideshow or single image.\r\n\r\n<a href="../custom-property-search/">Advanced property search</a> on the right-hand side is fully customizable. Add, remove and order it the way you want. Also available as a <a href="../shortcodes/wp_realstate/home-slideshow/">shortcode</a> and <a href="../real-estate-widgets/">widget</a>. \r\n\r\n<a class="btn" href="../">Enter the site »</a>', 'Intro', '', 'inherit', 'open', 'open', '', '93-revision-v1', '', '', '2015-02-04 11:05:42', '2015-02-04 11:05:42', '', 93, 'http://realestate.local/93-revision-v1/', 0, 'revision', '', 0),
(477, 1, '2014-10-08 07:56:31', '2014-10-08 07:56:31', '', 'picjumbo_dubai_skyscraper2', '', 'inherit', 'open', 'open', '', 'picjumbo_dubai_skyscraper2', '', '', '2014-10-08 07:56:31', '2014-10-08 07:56:31', '', 297, 'http://realestate.local/wp-content/uploads/2013/07/picjumbo_dubai_skyscraper2.jpg', 0, 'attachment', 'image/jpeg', 0),
(478, 1, '2014-10-08 07:56:35', '2014-10-08 07:56:35', '', 'picjumbo_dubai_skyscraper3', '', 'inherit', 'open', 'open', '', 'picjumbo_dubai_skyscraper3', '', '', '2014-10-08 07:56:35', '2014-10-08 07:56:35', '', 297, 'http://realestate.local/wp-content/uploads/2013/07/picjumbo_dubai_skyscraper3.jpg', 0, 'attachment', 'image/jpeg', 0),
(479, 1, '2014-10-23 08:08:18', '2014-10-23 08:08:18', '', 'favicon-realty', '', 'inherit', 'open', 'open', '', 'favicon-realty', '', '', '2014-10-23 08:08:18', '2014-10-23 08:08:18', '', 0, 'http://realestate.local/wp-content/uploads/2014/10/favicon-realty.png', 0, 'attachment', 'image/png', 0),
(480, 1, '2014-10-23 08:08:19', '2014-10-23 08:08:19', '', 'logo-realty', '', 'inherit', 'open', 'open', '', 'logo-realty', '', '', '2014-10-23 08:08:19', '2014-10-23 08:08:19', '', 0, 'http://realestate.local/wp-content/uploads/2014/10/logo-realty.png', 0, 'attachment', 'image/png', 0),
(21, 1, '2014-07-16 15:31:10', '2014-07-16 15:31:10', '', 'Property Search', '', 'publish', 'open', 'open', '', 'property-search', '', '', '2014-07-16 15:31:10', '2014-07-16 15:31:10', '', 0, 'http://localhost/wp/estate/?page_id=10', 0, 'page', '', 0),
(33, 1, '2014-07-16 16:18:11', '2014-07-16 16:18:11', '[property_search_form]\r\n<p class="lead text-center" style="margin-bottom: 50px;">Property List</a>.</p>\r\n[property_listing per_page="6"]\r\n\r\n&nbsp;\r\n\r\n&nbsp;', 'Home  - Slideshow', '', 'publish', 'open', 'open', '', 'home-slideshow', '', '', '2015-01-31 14:22:51', '2015-01-31 14:22:51', '', 0, 'http://localhost/wp/estate/?page_id=33', 0, 'page', '', 0),
(763, 1, '2015-01-31 14:22:51', '2015-01-31 14:22:51', '[property_search_form]\r\n<p class="lead text-center" style="margin-bottom: 50px;">Property List</a>.</p>\r\n[property_listing per_page="6"]\r\n\r\n&nbsp;\r\n\r\n&nbsp;', 'Home  - Slideshow', '', 'inherit', 'open', 'open', '', '33-revision-v1', '', '', '2015-01-31 14:22:51', '2015-01-31 14:22:51', '', 33, 'http://realestate.local/?p=763', 0, 'revision', '', 0),
(40, 1, '2014-07-17 06:07:22', '2014-07-17 06:07:22', '<div class="text-center">\n<h1>Example Of A Custom 404 Error Page</h1>\n<p class="lead">With Property Map Of London &amp; Property Search Form Shortcode</p>\n</div>\n\n[map address="London, UK" zoomlevel="14" height="500px"]\n\n[property_search_form]', 'Custom 404 Error Page', '', 'publish', 'open', 'open', '', 'custom-404-error-page', '', '', '2014-07-17 06:07:22', '2014-07-17 06:07:22', '', 0, 'http://localhost/wp/estate/?page_id=40', 0, 'page', '', 0),
(93, 1, '2014-07-16 15:12:00', '2014-07-16 15:12:00', '<img src="http://demo.themetrail.com/realty/wp-content/uploads/2014/07/logo-realty.png" alt="Logo" width="150" height="30" class="alignnone size-full wp-image-342" />\r\n\r\nWelcome to Realty, A Premium Real Estate Theme for WordPress. \r\n\r\nThis intro page is optional. Show a fullscreen background slideshow or single image.\r\n\r\n<a href="../custom-property-search/">Advanced property search</a> on the right-hand side is fully customizable. Add, remove and order it the way you want. Also available as a <a href="../shortcodes/">shortcode</a> and <a href="../real-estate-widgets/">widget</a>. \r\n\r\n<a class="btn" href="../wp_realstate/home-slideshow/">Enter the site »</a>', 'Intro', '', 'publish', 'open', 'open', '', 'intro', '', '', '2015-02-04 11:06:38', '2015-02-04 11:06:38', '', 0, 'http://localhost/wp/estate/?page_id=5', 0, 'page', '', 0),
(105, 1, '2014-07-19 11:32:39', '2014-07-19 11:32:39', '[alert type="success" dismissable="true"]Set Featured Image Like The One Above To Add A Top Banner To Any Page[/alert]', 'Blog', '', 'publish', 'open', 'open', '', 'blog', '', '', '2015-01-05 09:06:52', '2015-01-05 09:06:52', '', 0, 'http://localhost/wp/estate/?page_id=105', 0, 'page', '', 0),
(110, 1, '2014-07-19 11:36:28', '2014-07-19 11:36:28', '[section_title heading="h2"]Get In Touch[/section_title]\n\nThis theme is using the popular and free <strong>Contact Form 7 plugin</strong>. Set required fields, add simple math captcha for spam protection. Create and insert as many contact forms as you need and add them anywhere on your site. Like we did in the footer widget.\n\nThe contact template also has its own customizable sidebar.\n\nContact map above is optional and can be customized straight from the Theme Option Panel.\n\n[contact-form-7 id="113" title="Contact - 2 Columns"]', 'Contact', '', 'publish', 'open', 'open', '', 'contact', '', '', '2014-07-19 11:36:28', '2014-07-19 11:36:28', '', 0, 'http://localhost/wp/estate/?page_id=110', 0, 'page', '', 0),
(122, 1, '2014-07-19 12:26:24', '2014-07-19 12:26:24', '[property_search_form]\n\n<p class="lead text-center" style="margin-bottom: 50px;">Home Property Map Lists All Properties. Click On Property Marker Will Zoom In And Open Single Property Info Box.\nProperty Search & Property Listing On This Page Is The Simple Result Of Two <a href="shortcodes/">Shortcodes</a>.</p>\n\n[property_listing per_page="6"]', 'Home - Property Map', '', 'publish', 'open', 'open', '', 'home-property-map', '', '', '2014-07-19 12:26:24', '2014-07-19 12:26:24', '', 0, 'http://localhost/wp/estate/?page_id=122', 0, 'page', '', 0),
(137, 1, '2014-07-19 12:36:24', '2014-07-19 12:36:24', '<h1>Shortcodes</h1>\n[row]\n[column md="6"]\nAll major real estate elements can easily be added to any page or post as a shortcode with a single click, straight from the text editor menu. As you can see on the screenshot to the right-hand side:\n[/column]\n[column md="6"]\n\n[caption id="" align="alignnone" width="838"]<img class="" src="http://themetrail.com/cms/wp-content/uploads/2014/08/docs_realty_real_estate_shortcodes.jpg" alt="Real Estate Shortcodes" width="838" height="444" /> Real Estate Shortcodes[/caption]\n\n[/column]\n[/row]\n<p class="lead" style="margin-top: 2em;">Below are all custom real estate shortcodes with example code and shortcode output.</p>\n[section_title heading="h3"]Shortcode: Property Listing[/section_title]\n\nThe property listing shortcode comes with plenty of filters. The example below show all apartments (type) in london (location) that are for rent (status) with air conditioning (features), available from Sept 01 2014 (available_from), with a max price of 5000 (max_price) in a three column-layout (columns) with three properties per page (per_page).\n<pre>[[property_listing colums="3" per_page="3" location="london" status="rent" type="apartment" features="air-conditioning" max_price="5000" min_rooms="2" available_from="20140901"]]</pre>\n[property_listing colums="3" per_page="3" location="london" status="rent" type="apartment" features="air-conditioning" max_price="5000" min_rooms="2" available_from="20140901"]\n\n<p>Make sure to use the slug for "location", "status", "type" and "features". Format of "available_from" is: YYYYMMDD</p>\n\n[section_title heading="h3"]Shortcode: Featured Properties[/section_title]\n\nProperties can be set "Featured" with a single click from the property detail page.\n<pre>[[featured_properties columns="2"]]</pre>\n[featured_properties columns="2"]\n\n[section_title heading="h3"]Shortcode: Single Property[/section_title]\n\nInsert any single property anywhere on your site by referencing its post ID.\n\n[row]\n[column md="6"]\n<pre>[[single_property id="297"]]</pre>\n[single_property id="297"]\n[/column]\n[column md="6"]\n<pre>[[single_property id="95"]]</pre>\n[single_property id="95"]\n[/column]\n[/row]\n\n[section_title heading="h3"]Shortcode: Agents[/section_title]\n\nUse the following shortcode to display your entire team of agents on your "About" page or within a blog post.\n<pre>[[agents columns="3"]]</pre>\n[agents columns="3"]\n\n[section_title heading="h3"]Shortcode: Testimonials[/section_title]\n\nTestimonials are created like a normal blog post.\n<pre>[[testimonials columns="2"]]</pre>\n[testimonials columns="2"]\n\n[section_title heading="h3"]Shortcode: Property Search Form[/section_title]\n\nFully customizable property search. Enable/disable any search field.\n<pre>[[property_search_form]]</pre>\n[property_search_form]\n\n[section_title heading="h3"]Shortcode: Map[/section_title]\n\nInsert custom property maps anywhere on your site. Set location, zoom level, and map height.\n<pre>[[map address="London, UK" zoomlevel="13" height="400px"]]</pre>\n[map address="London, UK" zoomlevel="13" height="400px"]\n\n[section_title heading="h3"]Shortcode: Latest Posts[/section_title]\n\nShow a preview of your latest blog posts anywhere on your site. Set number of posts and columns.\n<pre>[[latest_posts posts="3" columns="2"]]</pre>\n[latest_posts posts="3" columns="2"]', 'Shortcodes', '', 'publish', 'open', 'open', '', 'shortcodes', '', '', '2014-07-19 12:36:24', '2014-07-19 12:36:24', '', 0, 'http://localhost/wp/estate/?page_id=137', 0, 'page', '', 0),
(265, 1, '2014-07-21 08:07:38', '2014-07-21 08:07:38', '[section_title heading="h1"]Custom Real Estate Widgets[/section_title]\n\nBesides professionally styling for all standard WordPress widgets, we have added some important real estate widgets for you:\n<ul>\n	<li>Property Search (also available as a shortcode)</li>\n	<li>Featured Properties (also available as a shortcode)</li>\n	<li>Latest Posts</li>\n	<li>Testimonials (also available as a shortcode)</li>\n	<li>Featured Agent (also available as a shortcode To Showcase All Agents)</li>\n</ul>\n\nYou can see them implemented on the right-hand side of this page.\n\nAll widgets an be used in any widget area:\n<ul>\n	<li>Blog Sidebar</li>\n	<li>Property Sidebar</li>\n	<li>Agent Sidebar</li>\n	<li>Page Sidebar</li>\n	<li>Contact Sidebar</li>\n	<li>IDX Sidebar (for dsIDXpress plugin)</li>\n	<li>Footer Column 1</li>\n	<li>Footer Column 2</li>\n	<li>Footer Column 3</li>\n</ul>\nAny other widgets that would be helpful for your real estate business? Don''t hesitate and <a href="http://themetrail.com/contact/" target="_blank">let us know</a>, what additional widgets you could benefit from.', 'Real Estate Widgets', '', 'publish', 'open', 'open', '', 'real-estate-widgets', '', '', '2014-07-21 08:07:38', '2014-07-21 08:07:38', '', 0, 'http://localhost/wp/estate/?page_id=265', 0, 'page', '', 0),
(482, 1, '2015-01-05 06:49:31', '2015-01-05 06:49:31', '', 'Intro Page', '', 'publish', 'open', 'open', '', 'intro-page', '', '', '2015-01-31 14:19:10', '2015-01-31 14:19:10', '', 0, 'http://realestate.local/intro-page/', 2, 'nav_menu_item', '', 0),
(483, 1, '2015-01-05 06:49:31', '2015-01-05 06:49:31', ' ', '', '', 'publish', 'open', 'open', '', '483', '', '', '2015-01-31 14:19:10', '2015-01-31 14:19:10', '', 0, 'http://realestate.local/483/', 3, 'nav_menu_item', '', 0),
(485, 1, '2015-01-05 06:49:31', '2015-01-05 06:49:31', ' ', '', '', 'publish', 'open', 'open', '', '485', '', '', '2015-01-31 14:19:10', '2015-01-31 14:19:10', '', 0, 'http://realestate.local/485/', 6, 'nav_menu_item', '', 0),
(486, 1, '2015-01-05 06:49:31', '2015-01-05 06:49:31', ' ', '', '', 'publish', 'open', 'open', '', '486', '', '', '2015-01-31 14:19:10', '2015-01-31 14:19:10', '', 0, 'http://realestate.local/486/', 7, 'nav_menu_item', '', 0),
(487, 1, '2015-01-05 06:49:31', '2015-01-05 06:49:31', ' ', '', '', 'publish', 'open', 'open', '', '487', '', '', '2015-01-31 14:19:10', '2015-01-31 14:19:10', '', 0, 'http://realestate.local/487/', 8, 'nav_menu_item', '', 0),
(488, 1, '2015-01-05 06:49:31', '2015-01-05 06:49:31', ' ', '', '', 'publish', 'open', 'open', '', '488', '', '', '2015-01-31 14:19:10', '2015-01-31 14:19:10', '', 0, 'http://realestate.local/488/', 4, 'nav_menu_item', '', 0),
(764, 1, '2015-02-04 11:05:33', '2015-02-04 11:05:33', '<img src="http://demo.themetrail.com/realty/wp-content/uploads/2014/07/logo-realty.png" alt="Logo" width="150" height="30" class="alignnone size-full wp-image-342" />\n\nWelcome to Realty, A Premium Real Estate Theme for WordPress. \n\nThis intro page is optional. Show a fullscreen background slideshow or single image.\n\n<a href="../custom-property-search/">Advanced property search</a> on the right-hand side is fully customizable. Add, remove and order it the way you want. Also available as a <a href="../shortcodes/wp_realstate/home-slideshow/">shortcode</a> and <a href="../real-estate-widgets/">widget</a>. \n\n<a class="btn" href="../">Enter the site »</a>', 'Intro', '', 'inherit', 'open', 'open', '', '93-autosave-v1', '', '', '2015-02-04 11:05:33', '2015-02-04 11:05:33', '', 93, 'http://realestate.local/93-autosave-v1/', 0, 'revision', '', 0),
(45, 1, '2013-07-01 08:00:03', '2013-07-01 08:00:03', 'This is an example of a single property using a boxed layout with a property image slideshow.\n\nFrom the Theme Option Panel you can set the default property layout to full width or boxed. Which can be overwritten on a property basis. A click on the active property photo will open it in full screen mode.\n<h4>Single Property Layouts</h4>\n<ul>\n	<li><a href="../lush-villa/">"Full Width" Slideshow (No Sidebar)</a></li>\n	<li><a href="../spacious-bright-mansion/">"Boxed" Slideshow (No Sidebar)</a></li>\n	<li><a href="../for-the-minimalist/">"Full Width" Single Image</a></li>\n	<li><a href="../central-with-garden/">"Boxed" Single Image</a></li>\n</ul>\nCustom property sidebar allows you to add widgets, that only appear on the single property page.\n\nSocial sharing buttons, agent information and agent contact form can be switch on/off as well.', 'Westminster Beauty', '', 'publish', 'closed', 'closed', '', 'westminster-beauty', '', '', '2013-07-01 08:00:03', '2013-07-01 08:00:03', '', 0, 'http://localhost/wp/estate/?post_type=property&amp;p=45', 0, 'property', '', 0),
(65, 1, '2013-07-07 08:00:21', '2013-07-07 08:00:21', 'This is an example of a single property using a boxed layout with a single property image.\r\n\r\nFrom the Theme Option Panel you can set the default property layout to full width or boxed. Which can be overwritten on a property basis. A click on the active property photo will open it in full screen mode.\r\n<h4>Single Property Layouts</h4>\r\n<ul>\r\n	<li><a href="../lush-villa/">"Full Width" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../spacious-bright-mansion/">"Boxed" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../for-the-minimalist/">"Full Width" Single Image</a></li>\r\n	<li><a href="../central-with-garden/">"Boxed" Single Image</a></li>\r\n</ul>\r\nCustom property sidebar allows you to add widgets, that only appear on the single property page.\r\n\r\nSocial sharing buttons, agent information and agent contact form can be switch on/off as well.', 'Central With Garden', '', 'publish', 'closed', 'closed', '', 'central-with-garden', '', '', '2015-01-12 08:04:28', '2015-01-12 08:04:28', '', 0, 'http://localhost/wp/estate/?post_type=property&#038;p=65', 0, 'property', '', 0),
(73, 1, '2013-07-03 08:00:34', '2013-07-03 08:00:34', 'This is an example of a single property using a full width layout with a single property image.\r\n\r\nFrom the Theme Option Panel you can set the default property layout to full width or boxed. Which can be overwritten on a property basis. A click on the active property photo will open it in full screen mode.\r\n<h4>Single Property Layouts</h4>\r\n<ul>\r\n	<li><a href="../lush-villa/">"Full Width" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../spacious-bright-mansion/">"Boxed" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../for-the-minimalist/">"Full Width" Single Image</a></li>\r\n	<li><a href="../central-with-garden/">"Boxed" Single Image</a></li>\r\n</ul>\r\nCustom property sidebar allows you to add widgets, that only appear on the single property page.\r\n\r\nSocial sharing buttons, agent information and agent contact form can be switch on/off as well.', 'City Of London Office', '', 'publish', 'closed', 'closed', '', 'city-of-london-office', '', '', '2015-03-02 05:26:09', '2015-03-02 05:26:09', '', 0, 'http://localhost/wp/estate/?post_type=property&#038;p=73', 0, 'property', '', 0),
(77, 1, '2013-07-08 08:00:46', '2013-07-08 08:00:46', 'This is an example of a single property using a full width layout with a single property image.\n\nFrom the Theme Option Panel you can set the default property layout to full width or boxed. Which can be overwritten on a property basis. A click on the active property photo will open it in full screen mode.\n<h4>Single Property Layouts</h4>\n<ul>\n	<li><a href="../lush-villa/">"Full Width" Slideshow (No Sidebar)</a></li>\n	<li><a href="../spacious-bright-mansion/">"Boxed" Slideshow (No Sidebar)</a></li>\n	<li><a href="../for-the-minimalist/">"Full Width" Single Image</a></li>\n	<li><a href="../central-with-garden/">"Boxed" Single Image</a></li>\n</ul>\nCustom property sidebar allows you to add widgets, that only appear on the single property page.\n\nSocial sharing buttons, agent information and agent contact form can be switch on/off as well.', 'Modern Office', '', 'publish', 'closed', 'closed', '', 'modern-office', '', '', '2013-07-08 08:00:46', '2013-07-08 08:00:46', '', 0, 'http://localhost/wp/estate/?post_type=property&amp;p=77', 0, 'property', '', 0),
(107, 1, '2014-07-19 11:35:40', '2014-07-19 11:35:40', 'This post contains a few examples of how easy it is to add pretty much any content you can think of to your real estate site.\n<h4>Tiled Mosaic Gallery &amp; Fullscreen Lightbox</h4>\n[gallery type="rectangular" link="none" ids="456,455,453"]\n<p class="text-muted">Click one of  the images above to open the browsable fullscreen lightbox.</p>\n\n<!--more-->\n\n<h4>Grid System</h4>\nThis theme is build on the very popular Bootstrap 3 framework. Create any 12 column layout you can imagine via shortcodes.\n<h5>2 Columns</h5>\n[row]\n[column md="6"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\nWhile the two headsmen were engaged in making fast cords to his flukes, and in other ways getting the mass in readiness for towing, some conversation ensued between them.\n\n[/column]\n[column md="6"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\nWhile the two headsmen were engaged in making fast cords to his flukes, and in other ways getting the mass in readiness for towing, some conversation ensued between them.\n\n[/column]\n[/row]\n<h5>3 Columns</h5>\n[row]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[/row]\n<h5>1/3 + 2/3 Column</h5>\n[row]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[column md="8"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[/row]\n<h4>Responsive Video Embed (Fitvids)</h4>\nhttp://vimeo.com/78472610\n<h4>Quote</h4>\n<blockquote>People don''t realize that now is all there ever is; there is no past or future except as memory or anticipation in your mind.<cite>Eckhart Tolle</cite></blockquote>', 'Featured Image', '', 'publish', 'open', 'open', '', 'featured-image', '', '', '2014-07-19 11:35:40', '2014-07-19 11:35:40', '', 0, 'http://localhost/wp/estate/?p=107', 0, 'post', '', 3),
(118, 1, '2014-07-10 12:07:51', '2014-07-10 12:07:51', 'This post contains a few examples of how easy it is to add pretty much any content you can think of to your real estate site.\n<h4>Tiled Mosaic Gallery &amp; Fullscreen Lightbox</h4>\n[gallery type="rectangular" link="none" ids="456,455,453"]\n<p class="text-muted">Click one of  the images above to open the browsable fullscreen lightbox.</p>\n\n<!--more-->\n\n<h4>Grid System</h4>\nThis theme is build on the very popular Bootstrap 3 framework. Create any 12 column layout you can imagine via shortcodes.\n<h5>2 Columns</h5>\n[row]\n[column md="6"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\nWhile the two headsmen were engaged in making fast cords to his flukes, and in other ways getting the mass in readiness for towing, some conversation ensued between them.\n\n[/column]\n[column md="6"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\nWhile the two headsmen were engaged in making fast cords to his flukes, and in other ways getting the mass in readiness for towing, some conversation ensued between them.\n\n[/column]\n[/row]\n<h5>3 Columns</h5>\n[row]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[/row]\n<h5>1/3 + 2/3 Column</h5>\n[row]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[column md="8"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[/row]\n<h4>Responsive Video Embed (Fitvids)</h4>\nhttp://vimeo.com/78472610\n<h4>Quote</h4>\n<blockquote>People don''t realize that now is all there ever is; there is no past or future except as memory or anticipation in your mind.<cite>Eckhart Tolle</cite></blockquote>', 'Gallery Post', '', 'publish', 'open', 'open', '', 'gallery-post', '', '', '2014-07-10 12:07:51', '2014-07-10 12:07:51', '', 0, 'http://localhost/wp/estate/?p=118', 0, 'post', '', 0),
(120, 1, '2014-06-30 12:08:59', '2014-06-30 12:08:59', 'This post contains a few examples of how easy it is to add pretty much any content you can think of to your real estate site.\n\n<h4>Tiled Mosaic Gallery &amp; Fullscreen Lightbox</h4>\n[gallery type="rectangular" link="none" ids="456,455,453"]\n\n<p class="text-muted">Click one of  the images above to open the browsable fullscreen lightbox.</p>\n\n<!--more-->\n\n<h4>Grid System</h4>\n\nThis theme is build on the very popular Bootstrap 3 framework. Create any 12 column layout you can imagine via shortcodes.\n\n<h5>2 Columns</h5>\n[row]\n[column md="6"]\n<p>At last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.</p>\n<p>While the two headsmen were engaged in making fast cords to his flukes, and in other ways getting the mass in readiness for towing, some conversation ensued between them.</p>\n[/column]\n[column md="6"]\n<p>At last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.</p>\n<p>While the two headsmen were engaged in making fast cords to his flukes, and in other ways getting the mass in readiness for towing, some conversation ensued between them.</p>\n[/column]\n[/row]\n\n<h5>3 Columns</h5>\n[row]\n[column md="4"]\n<p>At last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.</p>\n[/column]\n[column md="4"]\n<p>At last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.</p>\n[/column]\n[column md="4"]\n<p>At last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.</p>\n[/column]\n[/row]\n\n<h5>1/3 + 2/3 Column</h5>\n[row]\n[column md="4"]\n<p>At last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.</p>\n[/column]\n[column md="8"]\n<p>At last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.</p>\n[/column]\n[/row]\n\n<h4>Responsive Video Embed (Fitvids)</h4>\n\nhttp://vimeo.com/78472610\n\n<h4>Quote</h4>\n<blockquote>People don''t realize that now is all there ever is; there is no past or future except as memory or anticipation in your mind.<cite>Eckhart Tolle</cite></blockquote>', 'Video Post', '', 'publish', 'open', 'open', '', 'video-post', '', '', '2014-06-30 12:08:59', '2014-06-30 12:08:59', '', 0, 'http://localhost/wp/estate/?p=120', 0, 'post', '', 0),
(262, 1, '2014-06-20 07:39:35', '2014-06-20 07:39:35', 'This post contains a few examples of how easy it is to add pretty much any content you can think of to your real estate site.\n<h4>Tiled Mosaic Gallery &amp; Fullscreen Lightbox</h4>\n[gallery type="rectangular" link="none" ids="456,455,453"]\n<p class="text-muted">Click one of  the images above to open the browsable fullscreen lightbox.</p>\n\n<!--more-->\n\n<h4>Grid System</h4>\nThis theme is build on the very popular Bootstrap 3 framework. Create any 12 column layout you can imagine via shortcodes.\n<h5>2 Columns</h5>\n[row]\n[column md="6"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\nWhile the two headsmen were engaged in making fast cords to his flukes, and in other ways getting the mass in readiness for towing, some conversation ensued between them.\n\n[/column]\n[column md="6"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\nWhile the two headsmen were engaged in making fast cords to his flukes, and in other ways getting the mass in readiness for towing, some conversation ensued between them.\n\n[/column]\n[/row]\n<h5>3 Columns</h5>\n[row]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[/row]\n<h5>1/3 + 2/3 Column</h5>\n[row]\n[column md="4"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[column md="8"]\n\nAt last his spout grew thick, and with a frightful roll and vomit, he turned upon his back a corpse.\n\n[/column]\n[/row]\n<h4>Responsive Video Embed (Fitvids)</h4>\nhttp://vimeo.com/78472610\n<h4>Quote</h4>\n<blockquote>People don''t realize that now is all there ever is; there is no past or future except as memory or anticipation in your mind.<cite>Eckhart Tolle</cite></blockquote>', 'Standard Post', '', 'publish', 'open', 'open', '', 'standard-post', '', '', '2014-06-20 07:39:35', '2014-06-20 07:39:35', '', 0, 'http://localhost/wp/estate/?p=262', 0, 'post', '', 0),
(292, 1, '2014-07-21 09:38:38', '2014-07-21 09:38:38', '[section_title heading="h1"]Custom Property Search[/section_title]\n\n[row]\n[column md="8"]\n\n<img class="alignnone size-full wp-image-594" src="http://demo.themetrail.com/realty/wp-content/uploads/2014/07/docs_realty_custom_property_seach_v_1_5-1024x687.jpg" alt="Custom Property Search" width="1024" height="687" />\n\n[/column]\n[column md="4"]\n\nSet up to eight unique search fields. Either using default or custom property fields. Learn more about: <a href="http://themetrail.com/docs/realty/#acf" target="_blank">Custom Fields</a>\n\nProperty search is also available as a shortcode and widget.\n\nSearch results can be order by date (ascending &amp; descending), price (ascending &amp; descending), or randomly.\n\nViewable as a grid or list.\n\n[/column]\n[/row]', 'Custom Property Search', '', 'publish', 'open', 'open', '', 'custom-property-search', '', '', '2014-07-21 09:38:38', '2014-07-21 09:38:38', '', 0, 'http://localhost/wp/estate/?page_id=292', 0, 'page', '', 0),
(297, 1, '2013-07-04 08:00:29', '2013-07-04 08:00:29', 'This is an example of a single property using a full width layout with a property image slideshow.\r\n\r\nFrom the Theme Option Panel you can set the default property layout to full width or boxed. Which can be overwritten on a property basis. A click on the active property photo will open it in full screen mode.\r\n<h4>Single Property Layouts</h4>\r\n<ul>\r\n	<li><a href="../lush-villa/">"Full Width" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../spacious-bright-mansion/">"Boxed" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../for-the-minimalist/">"Full Width" Single Image</a></li>\r\n	<li><a href="../central-with-garden/">"Boxed" Single Image</a></li>\r\n</ul>\r\nCustom property sidebar allows you to add widgets, that only appear on the single property page.\r\n\r\nSocial sharing buttons, agent information and agent contact form can be switch on/off as well.', 'Living The Dream', '', 'publish', 'closed', 'closed', '', 'living-the-dream', '', '', '2015-01-08 12:45:01', '2015-01-08 12:45:01', '', 0, 'http://localhost/wp/estate/?post_type=property&#038;p=91', 0, 'property', '', 0),
(395, 1, '2014-09-08 13:25:52', '2014-09-08 13:25:52', '[section_title heading="h2"]Profile[/section_title]\n\n[alert type="info" dismissable="true"]Demo Note: Saving Profile Information Changes In The Online Demo Is Disabled.[/alert]', 'Profile', '', 'publish', 'open', 'open', '', 'profile', '', '', '2014-09-08 13:25:52', '2014-09-08 13:25:52', '', 0, 'http://demo.themetrail.com/realty/?page_id=395', 0, 'page', '', 0),
(397, 1, '2014-09-08 13:26:04', '2014-09-08 13:26:04', '[section_title heading="h2"]My Favorites[/section_title]', 'Favorites', '', 'publish', 'open', 'open', '', 'favorites', '', '', '2014-09-08 13:26:04', '2014-09-08 13:26:04', '', 0, 'http://demo.themetrail.com/realty/?page_id=397', 0, 'page', '', 0),
(409, 1, '2014-09-16 06:31:52', '2014-09-16 06:31:52', '[section_title heading="h2"]My Properties[/section_title]', 'My Properties', '', 'publish', 'open', 'open', '', 'my-properties', '', '', '2014-09-16 06:31:52', '2014-09-16 06:31:52', '', 0, 'http://demo.themetrail.com/realty/?page_id=409', 0, 'page', '', 0),
(410, 1, '2013-07-05 08:00:24', '2013-07-05 08:00:24', 'This is an example of a single property using a boxed layout with a property image slideshow.\n\nFrom the Theme Option Panel you can set the default property layout to full width or boxed. Which can be overwritten on a property basis. A click on the active property photo will open it in full screen mode.\n<h4>Single Property Layouts</h4>\n<ul>\n	<li><a href="../lush-villa/">"Full Width" Slideshow (No Sidebar)</a></li>\n	<li><a href="../spacious-bright-mansion/">"Boxed" Slideshow (No Sidebar)</a></li>\n	<li><a href="../for-the-minimalist/">"Full Width" Single Image</a></li>\n	<li><a href="../central-with-garden/">"Boxed" Single Image</a></li>\n</ul>\nCustom property sidebar allows you to add widgets, that only appear on the single property page.\n\nSocial sharing buttons, agent information and agent contact form can be switch on/off as well.', 'Spacious & Bright Mansion', '', 'publish', 'closed', 'closed', '', 'spacious-bright-mansion', '', '', '2013-07-05 08:00:24', '2013-07-05 08:00:24', '', 0, 'http://localhost/wp/estate/?post_type=property&amp;p=83', 0, 'property', '', 0),
(421, 1, '2014-09-20 10:20:06', '2014-09-20 10:20:06', '', 'Property Submit', '', 'publish', 'open', 'open', '', 'property-submit', '', '', '2014-09-20 10:20:06', '2014-09-20 10:20:06', '', 0, 'http://demo.themetrail.com/beta/realty/?page_id=421', 0, 'page', '', 0),
(491, 1, '2014-10-20 12:07:47', '2014-10-20 12:07:47', '<p class="lead text-center" style="margin-bottom: 50px;">Unique Property Slideshows Can Be Created For Each Page. Show Your Latest Properties, All Featured Properties, Or A Custom Selection Of Handpicked Properties. Optional: Mini Search & Fullscreen Slideshow View.</p>\n[property_listing colums="3" per_page="9"]', 'Property Slideshow', '', 'publish', 'open', 'open', '', 'property-slideshow', '', '', '2014-10-20 12:07:47', '2014-10-20 12:07:47', '', 0, 'http://demo.themetrail.com/beta/realty/?page_id=466', 0, 'page', '', 0),
(494, 1, '2014-12-12 10:19:58', '2014-12-12 10:19:58', '[section_title heading="h2"]Terms &amp; Conditions[/section_title]\n\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet nibh nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut justo. Suspendisse potenti.\n\nSed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et, dapibus sed, urna.\n\nMorbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus arcu pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut lectus. Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia eu, vulputate vel, nisl.\n\nSuspendisse mauris. Fusce accumsan mollis eros. Pellentesque a diam sit amet mi ullamcorper vehicula. Integer adipiscing risus a sem. Nullam quis massa sit amet nibh viverra malesuada. Nunc sem lacus, accumsan quis, faucibus non, congue vel, arcu. Ut scelerisque hendrerit tellus. Integer sagittis. Vivamus a mauris eget arcu gravida tristique. Nunc iaculis mi in ante. Vivamus imperdiet nibh feugiat est.\n\nUt convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc. Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur gravida.', 'Terms & Conditions', '', 'publish', 'open', 'open', '', 'terms-conditions', '', '', '2014-12-12 10:19:58', '2014-12-12 10:19:58', '', 0, 'http://demo.themetrail.com/beta/realty/?page_id=494', 0, 'page', '', 0),
(68, 1, '2014-07-12 08:00:09', '2014-07-12 08:00:09', 'This is an example of a single property using a full width layout with a property image slideshow.\r\n\r\nFrom the Theme Option Panel you can set the default property layout to full width or boxed. Which can be overwritten on a property basis. A click on the active property photo will open it in full screen mode.\r\n<h4>Single Property Layouts</h4>\r\n<ul>\r\n	<li><a href="../lush-villa/">"Full Width" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../spacious-bright-mansion/">"Boxed" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../for-the-minimalist/">"Full Width" Single Image</a></li>\r\n	<li><a href="../central-with-garden/">"Boxed" Single Image</a></li>\r\n</ul>\r\nCustom property sidebar allows you to add widgets, that only appear on the single property page.\r\n\r\nSocial sharing buttons, agent information and agent contact form can be switch on/off as well.', 'Lush Villa', '', 'publish', 'closed', 'closed', '', 'lush-villa', '', '', '2015-01-12 08:33:05', '2015-01-12 08:33:05', '', 0, 'http://localhost/wp/estate/?post_type=property&#038;p=68', 0, 'property', '', 0),
(95, 1, '2014-07-11 08:00:26', '2014-07-11 08:00:26', 'This is an example of a single property using a full width layout with a single property image.\r\n\r\nFrom the Theme Option Panel you can set the default property layout to full width or boxed. Which can be overwritten on a property basis. A click on the active property photo will open it in full screen mode.\r\n<h4>Single Property Layouts</h4>\r\n<ul>\r\n	<li><a href="../lush-villa/">"Full Width" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../spacious-bright-mansion/">"Boxed" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../for-the-minimalist/">"Full Width" Single Image</a></li>\r\n	<li><a href="../central-with-garden/">"Boxed" Single Image</a></li>\r\n</ul>\r\nCustom property sidebar allows you to add widgets, that only appear on the single property page.\r\n\r\nSocial sharing buttons, agent information and agent contact form can be switch on/off as well.', 'For The Minimalist', '', 'publish', 'closed', 'closed', '', 'for-the-minimalist', '', '', '2015-02-02 10:21:11', '2015-02-02 10:21:11', '', 0, 'http://localhost/wp/estate/?post_type=property&#038;p=95', 0, 'property', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(96, 1, '2014-07-10 08:00:14', '2014-07-10 08:00:14', 'This is an example of a single property using a full width layout with a single property image.\r\n\r\nFrom the Theme Option Panel you can set the default property layout to full width or boxed. Which can be overwritten on a property basis. A click on the active property photo will open it in full screen mode.\r\n<h4>Single Property Layouts</h4>\r\n<ul>\r\n	<li><a href="../lush-villa/">"Full Width" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../spacious-bright-mansion/">"Boxed" Slideshow (No Sidebar)</a></li>\r\n	<li><a href="../for-the-minimalist/">"Full Width" Single Image</a></li>\r\n	<li><a href="../central-with-garden/">"Boxed" Single Image</a></li>\r\n</ul>\r\nCustom property sidebar allows you to add widgets, that only appear on the single property page.\r\n\r\nSocial sharing buttons, agent information and agent contact form can be switch on/off as well.', 'Loft Above The City', '', 'publish', 'closed', 'closed', '', 'loft-above-the-city', '', '', '2015-01-08 11:39:47', '2015-01-08 11:39:47', '', 0, 'http://localhost/wp/estate/?post_type=property&#038;p=97', 0, 'property', '', 0),
(113, 1, '2014-07-19 11:40:16', '2014-07-19 11:40:16', '<div class="row">\n<div class="form-group col-sm-6">\n[text* your-name class:form-control id:name placeholder "Name"]\n[email* your-email class:form-control id:email placeholder "Email"]\n[text your-subject class:form-control id:subject placeholder "Subject"]\n</div>\n<div class="form-group col-sm-6">\n[textarea your-message class:form-control id:message placeholder "Message"]\n</div>\n<div class="form-group col-sm-12">\n[quiz captcha "7even + 5ive = |12"]\n[submit class:btn class:btn-primary "Send the message"]\n</div>\n</div>\n[your-subject]\n[your-name] <[your-email]>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\nyou@yourcompany.com\n\n\n\n\n\n[your-subject]\n[your-name] <[your-email]>\nMessage Body:\n[your-message]\n[your-email]\n\n\n\n\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill the required field.\nYour entered code is incorrect.\nNumber format seems invalid.\nThis number is too small.\nThis number is too large.\nEmail address seems invalid.\nURL seems invalid.\nTelephone number seems invalid.\nYour answer is not correct.\nDate format seems invalid.\nThis date is too early.\nThis date is too late.\nFailed to upload file.\nThis file type is not allowed.\nThis file is too large.\nFailed to upload file. Error occurred.', 'Contact - 2 Columns', '', 'publish', 'open', 'open', '', 'contact-2-columns', '', '', '2014-07-19 11:40:16', '2014-07-19 11:40:16', '', 0, 'http://localhost/wp/estate/?post_type=wpcf7_contact_form&amp;p=113', 0, 'wpcf7_contact_form', '', 0),
(114, 1, '2014-07-19 11:40:50', '2014-07-19 11:40:50', '[text* your-name placeholder "Name"]\n[email* your-email placeholder "Email"]\n[text your-subject placeholder "Subject"]\n[textarea your-message placeholder "Message"]\n[quiz captcha "7even + 5ive =|12"]\n[submit "Send"]\n[your-subject]\n[your-name] <[your-email]>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\nyou@yourcompany.com\n\n\n\n\n\n[your-subject]\n[your-name] <[your-email]>\nMessage Body:\n[your-message]\n[your-email]\n\n\n\n\nYour message was sent successfully. Thanks.\nFailed to send your message. Please try later or contact the administrator by another method.\nValidation errors occurred. Please confirm the fields and submit it again.\nFailed to send your message. Please try later or contact the administrator by another method.\nPlease accept the terms to proceed.\nPlease fill the required field.\nYour entered code is incorrect.\nNumber format seems invalid.\nThis number is too small.\nThis number is too large.\nEmail address seems invalid.\nURL seems invalid.\nTelephone number seems invalid.\nYour answer is not correct.\nDate format seems invalid.\nThis date is too early.\nThis date is too late.\nFailed to upload file.\nThis file type is not allowed.\nThis file is too large.\nFailed to upload file. Error occurred.', 'Contact - 1 Column', '', 'publish', 'open', 'open', '', 'contact-1-column', '', '', '2014-07-19 11:40:50', '2014-07-19 11:40:50', '', 0, 'http://localhost/wp/estate/?post_type=wpcf7_contact_form&amp;p=114', 0, 'wpcf7_contact_form', '', 0),
(181, 1, '2014-07-20 12:21:11', '2014-07-20 12:21:11', '', 'Larissa Smith', '', 'publish', 'closed', 'closed', '', 'larissa-smith', '', '', '2014-07-20 12:21:11', '2014-07-20 12:21:11', '', 0, 'http://localhost/wp/estate/?post_type=testimonial&amp;p=181', 0, 'testimonial', '', 0),
(193, 1, '2014-07-20 12:45:43', '2014-07-20 12:45:43', '', 'Martin Sosa', '', 'publish', 'closed', 'closed', '', 'martin-sosa', '', '', '2014-07-20 12:45:43', '2014-07-20 12:45:43', '', 0, 'http://localhost/wp/estate/?post_type=testimonial&amp;p=193', 0, 'testimonial', '', 0),
(198, 1, '2014-07-20 12:51:13', '2014-07-20 12:51:13', '', 'Jonas Jepson', '', 'publish', 'closed', 'closed', '', 'jonas-jepson', '', '', '2014-07-20 12:51:13', '2014-07-20 12:51:13', '', 0, 'http://localhost/wp/estate/?post_type=testimonial&amp;p=198', 0, 'testimonial', '', 0),
(199, 1, '2014-07-20 12:52:43', '2014-07-20 12:52:43', '', 'Sabrina Monti', '', 'publish', 'closed', 'closed', '', 'sabrina-monti', '', '', '2014-07-20 12:52:43', '2014-07-20 12:52:43', '', 0, 'http://localhost/wp/estate/?post_type=testimonial&amp;p=199', 0, 'testimonial', '', 0),
(742, 1, '2015-01-13 05:34:59', '2015-01-13 05:34:59', '[show_data]content[/show_data]', 'a', '', 'inherit', 'open', 'open', '', '739-revision-v1', '', '', '2015-01-13 05:34:59', '2015-01-13 05:34:59', '', 739, 'http://realestate.local/739-revision-v1/', 0, 'revision', '', 0),
(739, 1, '2015-01-13 05:28:20', '2015-01-13 05:28:20', '[show_data]content[/show_data]', 'a', '', 'publish', 'open', 'open', '', 'a', '', '', '2015-01-13 05:34:59', '2015-01-13 05:34:59', '', 0, 'http://realestate.local/?page_id=739', 0, 'page', '', 0),
(740, 1, '2015-01-13 05:28:20', '2015-01-13 05:28:20', '', 'a', '', 'inherit', 'open', 'open', '', '739-revision-v1', '', '', '2015-01-13 05:28:20', '2015-01-13 05:28:20', '', 739, 'http://realestate.local/739-revision-v1/', 0, 'revision', '', 0),
(511, 1, '2015-01-06 07:08:56', '2015-01-06 07:08:56', '[property_search_form]\r\n<p class="lead text-center" style="margin-bottom: 50px;">Home Slideshow Can Contain Custom Content, Your Latest Properties, Or All Featured Properties.\r\nProperty Search &amp; Property Listing On This Page Is The Simple Result Of Two <a href="shortcodes/">Shortcodes</a>.</p>\r\n[property_listing per_page="6"]\r\n\r\n&nbsp;\r\n\r\n<code>[sitepoint_contact_form]</code>.', 'Home  - Slideshow', '', 'inherit', 'open', 'open', '', '33-revision-v1', '', '', '2015-01-06 07:08:56', '2015-01-06 07:08:56', '', 33, 'http://realestate.local/33-revision-v1/', 0, 'revision', '', 0),
(770, 1, '2015-03-02 05:25:19', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-03-02 05:25:19', '0000-00-00 00:00:00', '', 0, 'http://realestate.local/?p=770', 0, 'post', '', 0),
(513, 1, '2015-01-06 11:17:27', '2015-01-06 11:17:27', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'inherit', 'open', 'open', '', '1-revision-v1', '', '', '2015-01-06 11:17:27', '2015-01-06 11:17:27', '', 1, 'http://realestate.local/1-revision-v1/', 0, 'revision', '', 0),
(518, 1, '2015-01-06 12:05:27', '2015-01-06 12:05:27', 'sfsf', 'test', '', 'publish', 'closed', 'closed', '', 'test', '', '', '2015-01-06 12:05:27', '2015-01-06 12:05:27', '', 0, 'http://realestate.local/?post_type=tenants&#038;p=518', 0, 'tenants', '', 0),
(520, 1, '2015-01-07 05:16:48', '2015-01-07 05:16:48', '[property_search_form]\r\n<p class="lead text-center" style="margin-bottom: 50px;">Home Slideshow Can Contain Custom Content, Your Latest Properties, Or All Featured Properties.\r\nProperty Search &amp; Property Listing On This Page Is The Simple Result Of Two <a href="shortcodes/">Shortcodes</a>.</p>\r\n[property_listing per_page="6"]\r\n\r\n&nbsp;\r\n\r\n&nbsp;', 'Home  - Slideshow', '', 'inherit', 'open', 'open', '', '33-revision-v1', '', '', '2015-01-07 05:16:48', '2015-01-07 05:16:48', '', 33, 'http://realestate.local/33-revision-v1/', 0, 'revision', '', 0),
(609, 1, '2015-01-08 06:17:43', '2015-01-08 06:17:43', '', 'Application Form', '', 'publish', 'open', 'open', '', 'application-form', '', '', '2015-01-08 06:17:43', '2015-01-08 06:17:43', '', 0, 'http://realestate.local/?page_id=609', 0, 'page', '', 0),
(610, 1, '2015-01-08 06:17:43', '2015-01-08 06:17:43', '', 'Application Form', '', 'inherit', 'open', 'open', '', '609-revision-v1', '', '', '2015-01-08 06:17:43', '2015-01-08 06:17:43', '', 609, 'http://realestate.local/609-revision-v1/', 0, 'revision', '', 0),
(768, 1, '2015-02-13 05:01:46', '0000-00-00 00:00:00', '', '', '', 'draft', 'closed', 'closed', '', '', '', '', '2015-02-13 05:01:46', '2015-02-13 05:01:46', '', 0, 'http://realestate.local/?post_type=property&#038;p=768', 0, 'property', '', 0),
(758, 1, '2015-01-28 09:23:51', '2015-01-28 09:23:51', 'test', 'Property Submit', '', 'publish', 'closed', 'closed', '', 'property-submit', '', '', '2015-01-28 09:24:41', '2015-01-28 09:24:41', '', 0, 'http://realestate.local/?post_type=property&#038;p=758', 0, 'property', '', 0),
(759, 25, '2015-01-28 09:26:10', '2015-01-28 09:26:10', 'test', 'Property Submit123', '', 'publish', 'closed', 'closed', '', 'property-submit123', '', '', '2015-01-28 09:26:25', '2015-01-28 09:26:25', '', 0, 'http://realestate.local/?post_type=property&#038;p=759', 0, 'property', '', 0),
(771, 1, '2015-03-02 09:27:59', '2015-03-02 09:27:59', 'http://realestate.local/wp-content/uploads/2015/03/realestate.sql', 'realestate.sql', '', 'private', 'open', 'open', '', 'realestate-sql', '', '', '2015-03-02 09:27:59', '2015-03-02 09:27:59', '', 0, 'http://realestate.local/wp-content/uploads/2015/03/realestate.sql', 0, 'attachment', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_request`
--

CREATE TABLE IF NOT EXISTS `wp_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `tenant_property_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `wp_request`
--

INSERT INTO `wp_request` (`id`, `tenant_id`, `status`, `user_id`, `tenant_property_id`) VALUES
(1, 1, '2', 25, 45),
(2, 2, '1', 26, 45),
(3, 1, '1', 25, 45),
(4, 1, '1', 25, 45),
(5, 3, '1', 27, 65),
(6, 3, '1', 27, 65),
(7, 3, '1', 27, 65),
(8, 1, '1', 25, 45),
(9, 1, '2', 25, 45),
(10, 1, '1', 25, 45),
(11, 1, '2', 25, 45),
(12, 1, '1', 25, 45),
(13, 1, '1', 25, 45),
(14, 1, '1', 25, 45);

-- --------------------------------------------------------

--
-- Table structure for table `wp_request_meta`
--

CREATE TABLE IF NOT EXISTS `wp_request_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `request_id` bigint(20) NOT NULL,
  `request_meta_key` varchar(255) NOT NULL,
  `request_meta_value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=113 ;

--
-- Dumping data for table `wp_request_meta`
--

INSERT INTO `wp_request_meta` (`id`, `request_id`, `request_meta_key`, `request_meta_value`) VALUES
(1, 1, 'request_job_type', '13'),
(2, 1, 'request_visit_date', '2018-05-03'),
(3, 1, 'request_visit_time', '10:00 to 12:00'),
(4, 1, 'request_uploded_file', 'a:1:{i:0;s:19:"double_currency.PNG";}'),
(5, 1, 'request_job_description', 'test bwork requesthttp://www.newgenray.com/wordpress/wp_realstate/saveFiles/double_currency.PNG'),
(6, 1, 'request_uploded_file', 'a:4:{i:0;s:9:"Black.jpg";i:1;s:8:"Blue.jpg";i:2;s:13:"dashboard.png";i:3;s:57:"HushBabies-coupons-Sprockets-and-YD-T-Shirts-Set-of-3.jpg";}'),
(7, 1, 'created_date', '2015-01-27 10:15:58'),
(8, 1, 'updated_date', '2015-01-27 10:15:58'),
(9, 2, 'request_job_type', '10'),
(10, 2, 'request_visit_date', '2016-04-22'),
(11, 2, 'request_visit_time', '22:00 to 24:00'),
(12, 2, 'request_phone_no', '9650310043'),
(13, 2, 'request_job_description', 'test by admin'),
(14, 2, 'request_uploded_file', 'a:5:{i:0;s:17:"logo-client-2.jpg";i:1;s:17:"logo-client-3.jpg";i:2;s:17:"logo-client-4.jpg";i:3;s:17:"logo-client-5.jpg";i:4;s:17:"logo-client-6.jpg";}'),
(15, 2, 'created_date', '2015-01-27 10:36:36'),
(16, 2, 'updated_date', '2015-01-27 10:36:36'),
(17, 3, 'request_job_type', '11'),
(18, 3, 'request_visit_date', '2020-06-04'),
(19, 3, 'request_visit_time', '11:00 to 12:00'),
(20, 3, 'request_phone_no', '9650310043'),
(21, 3, 'request_job_description', 'test admin 3 '),
(22, 3, 'request_uploded_file', 'a:3:{i:0;s:33:"men-s-sports-t-shirts-500x500.jpg";i:1;s:79:"Nike-Men-Red-T-shirt_4038869c81c38bb2aaa988b4a4c15f8e_images_1080_1440_mini.jpg";i:2;s:7:"Red.jpg";}'),
(23, 3, 'created_date', '2015-01-27 10:48:59'),
(24, 3, 'updated_date', '2015-01-27 10:48:59'),
(25, 4, 'request_job_type', '11'),
(26, 4, 'request_visit_date', '2020-06-04'),
(27, 4, 'request_visit_time', '11:00 to 12:00'),
(28, 4, 'request_phone_no', '9650310043'),
(29, 4, 'request_job_description', 'test admin 3 test'),
(30, 4, 'request_uploded_file', 'a:3:{i:0;s:17:"logo-client-3.jpg";i:1;s:17:"logo-client-4.jpg";i:2;s:17:"logo-client-5.jpg";}'),
(31, 4, 'created_date', '2015-01-27 10:49:48'),
(32, 4, 'updated_date', '2015-01-27 10:49:48'),
(33, 5, 'request_job_type', '10'),
(34, 5, 'request_visit_date', '2019-04-02'),
(35, 5, 'request_visit_time', '11:00'),
(36, 5, 'request_phone_no', '9650310043'),
(37, 5, 'request_job_description', 'tets admin 4'),
(38, 5, 'request_uploded_file', 'a:1:{i:0;s:9:"table.png";}'),
(39, 5, 'created_date', '2015-01-27 10:50:35'),
(40, 5, 'updated_date', '2015-01-27 10:50:35'),
(41, 6, 'request_job_type', '10'),
(42, 6, 'request_visit_date', '2019-04-02'),
(43, 6, 'request_visit_time', '11:00'),
(44, 6, 'request_phone_no', '9650310043'),
(45, 6, 'request_job_description', 'tets admin 4'),
(46, 6, 'request_uploded_file', 'a:1:{i:0;s:9:"table.png";}'),
(47, 6, 'created_date', '2015-01-27 10:54:55'),
(48, 6, 'updated_date', '2015-01-27 10:54:55'),
(49, 7, 'request_job_type', '10'),
(50, 7, 'request_visit_date', '2019-04-02'),
(51, 7, 'request_visit_time', '11:00'),
(52, 7, 'request_phone_no', '9650310043'),
(53, 7, 'request_job_description', 'tets admin 4'),
(54, 7, 'request_uploded_file', 'a:1:{i:0;s:9:"table.png";}'),
(55, 7, 'created_date', '2015-01-27 11:08:30'),
(56, 7, 'updated_date', '2015-01-27 11:08:30'),
(57, 8, 'request_job_type', '13'),
(58, 8, 'request_visit_date', '12'),
(59, 8, 'request_visit_time', '323'),
(60, 8, 'request_phone_no', '9650310043'),
(61, 8, 'request_job_description', 'tetstssss'),
(62, 8, 'request_uploded_file', 'a:3:{i:0;s:9:"Black.jpg";i:1;s:8:"Blue.jpg";i:2;s:57:"HushBabies-coupons-Sprockets-and-YD-T-Shirts-Set-of-3.jpg";}'),
(63, 8, 'created_date', '2015-02-06 10:58:15'),
(64, 8, 'updated_date', '2015-02-06 10:58:15'),
(65, 9, 'request_job_type', '13'),
(66, 9, 'request_visit_date', '12'),
(67, 9, 'request_visit_time', '323'),
(68, 9, 'request_phone_no', '9650310043'),
(69, 9, 'request_job_description', 'tetstssss'),
(70, 9, 'request_uploded_file', 'a:3:{i:0;s:9:"Black.jpg";i:1;s:8:"Blue.jpg";i:2;s:57:"HushBabies-coupons-Sprockets-and-YD-T-Shirts-Set-of-3.jpg";}'),
(71, 9, 'created_date', '2015-02-06 11:03:25'),
(72, 9, 'updated_date', '2015-02-06 11:03:25'),
(73, 10, 'request_job_type', '13'),
(74, 10, 'request_visit_date', '12'),
(75, 10, 'request_visit_time', '323'),
(76, 10, 'request_phone_no', '9650310043'),
(77, 10, 'request_job_description', 'tetstssss'),
(78, 10, 'request_uploded_file', 'a:3:{i:0;s:9:"Black.jpg";i:1;s:8:"Blue.jpg";i:2;s:57:"HushBabies-coupons-Sprockets-and-YD-T-Shirts-Set-of-3.jpg";}'),
(79, 10, 'created_date', '2015-02-06 11:04:54'),
(80, 10, 'updated_date', '2015-02-06 11:04:54'),
(81, 11, 'request_job_type', '13'),
(82, 11, 'request_visit_date', '12'),
(83, 11, 'request_visit_time', '323'),
(84, 11, 'request_phone_no', '9650310043'),
(85, 11, 'request_job_description', 'tetstssss'),
(86, 11, 'request_uploded_file', 'a:3:{i:0;s:9:"Black.jpg";i:1;s:8:"Blue.jpg";i:2;s:57:"HushBabies-coupons-Sprockets-and-YD-T-Shirts-Set-of-3.jpg";}'),
(87, 11, 'created_date', '2015-02-06 11:05:56'),
(88, 11, 'updated_date', '2015-02-06 11:05:56'),
(89, 12, 'request_job_type', '13'),
(90, 12, 'request_visit_date', '12'),
(91, 12, 'request_visit_time', '323'),
(92, 12, 'request_phone_no', '9650310043'),
(93, 12, 'request_job_description', 'tetstssss'),
(94, 12, 'request_uploded_file', 'a:3:{i:0;s:9:"Black.jpg";i:1;s:8:"Blue.jpg";i:2;s:57:"HushBabies-coupons-Sprockets-and-YD-T-Shirts-Set-of-3.jpg";}'),
(95, 12, 'created_date', '2015-02-06 11:06:36'),
(96, 12, 'updated_date', '2015-02-06 11:06:36'),
(97, 13, 'request_job_type', '11'),
(98, 13, 'request_visit_date', '12'),
(99, 13, 'request_visit_time', '323'),
(100, 13, 'request_phone_no', '9650310043'),
(101, 13, 'request_job_description', 'tetstssss'),
(102, 13, 'request_uploded_file', 'a:3:{i:0;s:9:"Black.jpg";i:1;s:8:"Blue.jpg";i:2;s:57:"HushBabies-coupons-Sprockets-and-YD-T-Shirts-Set-of-3.jpg";}'),
(103, 13, 'created_date', '2015-02-06 11:16:31'),
(104, 13, 'updated_date', '2015-02-06 11:16:31'),
(105, 14, 'request_job_type', '11'),
(106, 14, 'request_visit_date', '12'),
(107, 14, 'request_visit_time', '323'),
(108, 14, 'request_phone_no', '9650310043'),
(109, 14, 'request_job_description', 'egrvdrtgb'),
(110, 14, 'request_uploded_file', 'a:1:{i:0;s:17:"logo-client-3.jpg";}'),
(111, 14, 'created_date', '2015-02-06 11:19:04'),
(112, 14, 'updated_date', '2015-02-06 11:19:04');

-- --------------------------------------------------------

--
-- Table structure for table `wp_tenant`
--

CREATE TABLE IF NOT EXISTS `wp_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `wp_tenant`
--

INSERT INTO `wp_tenant` (`id`, `email`, `status`, `user_id`) VALUES
(1, 'vikaschauhan@newgenray.com', 'active', 42);

-- --------------------------------------------------------

--
-- Table structure for table `wp_tenant_meta`
--

CREATE TABLE IF NOT EXISTS `wp_tenant_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint(20) NOT NULL,
  `property_id` int(11) NOT NULL,
  `tenant_meta_key` varchar(255) NOT NULL,
  `tenant_meta_value` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `wp_tenant_meta`
--

INSERT INTO `wp_tenant_meta` (`id`, `tenant_id`, `property_id`, `tenant_meta_key`, `tenant_meta_value`) VALUES
(1, 1, 96, 'tenant_property_id', ''),
(2, 1, 96, 'tenant_application_status_96', 'Submit'),
(3, 1, 96, 'personal-info', 'a:9:{s:4:"name";s:5:"vikas";s:11:"middle_name";s:7:"chauhan";s:9:"last_name";s:7:"chauhan";s:3:"dob";s:10:"02/24/1992";s:15:"social_security";s:4:"1223";s:15:"driving_licence";s:5:"78999";s:10:"other_name";s:2:"jj";s:10:"home_phone";s:10:"9650310043";s:12:"mobile_phone";s:10:"9650310043";}'),
(11, 1, 96, 'tenant_name', ''),
(4, 1, 96, 'occupant-info', 'a:2:{i:0;a:3:{s:4:"name";s:11:"Occupants 1";s:3:"dob";s:15:"Occupants dob 1";s:12:"relationship";s:20:"Occupants relation 1";}i:1;a:3:{s:4:"name";s:11:"Occupants 2";s:3:"dob";s:15:"Occupants dob 2";s:12:"relationship";s:20:"Occupants relation 2";}}'),
(5, 1, 96, 'residential-info', 'a:3:{s:17:"current-residence";a:13:{s:14:"street_address";s:4:"test";s:4:"city";s:0:"";s:5:"state";s:0:"";s:11:"amount_paid";s:3:"200";s:5:"owner";s:5:"vikas";s:8:"phone_no";s:3:"sdc";s:18:"reason_for_leaving";s:2:"ff";s:9:"rent_paid";s:2:"no";s:12:"given-notice";s:2:"no";s:13:"asked_to_move";s:3:"xzz";s:9:"utilities";s:3:"sdc";s:14:"residence_from";s:4:"sdc ";s:12:"residence_to";s:4:"sdc ";}s:18:"previous-residence";a:13:{s:14:"street_address";s:3:"dsx";s:4:"city";s:0:"";s:5:"state";s:0:"";s:11:"amount_paid";s:2:"zx";s:5:"owner";s:2:"zx";s:8:"phone_no";s:5:"dscsc";s:18:"reason_for_leaving";s:2:"xz";s:9:"rent_paid";s:2:"no";s:12:"given-notice";s:2:"no";s:13:"asked_to_move";s:6:"dsdsds";s:9:"utilities";s:5:"dsdsd";s:14:"residence_from";s:6:"dsdsds";s:12:"residence_to";s:5:"dsdsd";}s:15:"prior-residence";a:13:{s:14:"street_address";s:3:"123";s:4:"city";s:0:"";s:5:"state";s:0:"";s:11:"amount_paid";s:3:"dsc";s:5:"owner";s:4:"csza";s:8:"phone_no";s:8:"sdcsdcds";s:18:"reason_for_leaving";s:7:"asdxsax";s:9:"rent_paid";s:2:"no";s:12:"given-notice";s:2:"no";s:13:"asked_to_move";s:7:"sadxasx";s:9:"utilities";s:4:"asxx";s:14:"residence_from";s:5:"asxax";s:12:"residence_to";s:6:"dsxsad";}}'),
(6, 1, 96, 'employment-info', 'a:3:{s:18:"current-employment";a:8:{s:7:"company";s:5:"dfcsd";s:7:"address";s:4:"sdcs";s:8:"phone_no";s:3:"sdc";s:10:"occupation";s:4:"sdcs";s:10:"supervisor";s:3:"dsc";s:17:"current_gross_pay";s:4:"dsfc";s:8:"emp_from";s:4:"dscs";s:6:"emp_to";s:3:"dsc";}s:19:"previous-employment";a:8:{s:7:"company";s:4:"dscs";s:7:"address";s:4:"dscs";s:8:"phone_no";s:5:"dscsc";s:10:"occupation";s:5:"sdcss";s:10:"supervisor";s:6:"dssdss";s:18:"previous_gross_pay";s:4:"dscs";s:8:"emp_from";s:4:"csdc";s:6:"emp_to";s:5:"scsdc";}s:16:"prior-employment";a:8:{s:7:"company";s:7:"sdcdfvc";s:7:"address";s:7:"sdcsdcc";s:8:"phone_no";s:8:"sdcsdcds";s:10:"occupation";s:5:"dscds";s:10:"supervisor";s:8:"dsdcdsds";s:15:"prior_gross_pay";s:5:"saads";s:8:"emp_from";s:7:"dsfsfff";s:6:"emp_to";s:5:"sdsdf";}}'),
(7, 1, 96, 'credit-info', 'a:4:{s:6:"saving";a:2:{s:4:"name";s:4:"dfvd";s:7:"balance";s:4:"dfvd";}s:8:"checking";a:2:{s:4:"name";s:5:"vdfdv";s:7:"balance";s:6:"dfvdfv";}s:6:"credit";a:2:{s:4:"name";s:6:"dffddf";s:7:"balance";s:8:"dffdfddf";}s:4:"loan";a:2:{s:4:"name";s:6:"dfvdvf";s:7:"balance";s:7:"dfvfdbg";}}'),
(8, 1, 96, 'vehicle-info', 'a:1:{i:0;a:5:{s:4:"make";s:6:"323232";s:5:"model";s:3:"321";s:5:"color";s:3:"321";s:4:"year";s:6:"312321";s:7:"licence";s:5:"32302";}}'),
(9, 1, 96, 'referral-info', 'a:3:{s:6:"doctor";a:6:{s:4:"name";s:3:"fvd";s:7:"address";s:4:"dfvd";s:4:"city";s:0:"";s:5:"state";s:0:"";s:3:"zip";s:5:"dfvdv";s:7:"contact";N;}s:6:"lawyer";a:6:{s:4:"name";s:6:"dfvbfg";s:7:"address";s:9:"fvg bfg b";s:4:"city";s:0:"";s:5:"state";s:0:"";s:3:"zip";s:6:"fgbvfg";s:7:"contact";N;}s:6:"native";a:6:{s:4:"name";s:6:"dfvdfv";s:7:"address";s:7:"dvdfvvd";s:4:"city";s:0:"";s:5:"state";s:0:"";s:3:"zip";s:5:"dfvdf";s:7:"contact";N;}}'),
(10, 1, 96, 'general-info', 'a:17:{s:9:"question1";s:4:"hjng";s:9:"question2";s:4:"ghng";s:9:"question3";s:3:"fhf";s:9:"question4";s:0:"";s:9:"question5";s:4:"fggf";s:9:"question6";s:4:"fggg";s:9:"question7";s:4:"fgfg";s:9:"question8";s:2:"xa";s:9:"question9";s:4:"hjng";s:10:"question10";s:7:"dfdfddf";s:10:"question11";s:5:"dfvdv";s:10:"question12";s:6:"dfvdfv";s:10:"question13";s:6:"fvddfv";s:10:"question14";s:7:"dfvdfvd";s:10:"question15";s:5:"vdfvd";s:10:"question16";s:6:"dfvvdf";s:10:"question17";N;}'),
(12, 1, 96, 'tenant_property_id', '96'),
(13, 1, 95, 'tenant_application_status', 'Submit'),
(14, 1, 95, 'personal-info', 'a:9:{s:4:"name";s:0:"";s:11:"middle_name";s:0:"";s:9:"last_name";s:0:"";s:3:"dob";s:0:"";s:15:"social_security";s:0:"";s:15:"driving_licence";s:0:"";s:10:"other_name";s:0:"";s:10:"home_phone";s:0:"";s:12:"mobile_phone";s:0:"";}'),
(15, 1, 95, 'vehicle-info', 'a:1:{i:0;a:5:{s:4:"make";s:0:"";s:5:"model";s:0:"";s:5:"color";s:0:"";s:4:"year";s:0:"";s:7:"licence";s:0:"";}}'),
(16, 1, 95, 'occupant-info', 'a:2:{i:0;a:3:{s:4:"name";s:0:"";s:3:"dob";s:0:"";s:12:"relationship";s:0:"";}i:1;a:3:{s:4:"name";s:0:"";s:3:"dob";s:0:"";s:12:"relationship";s:0:"";}}'),
(17, 1, 95, 'residential-info', 'a:3:{s:17:"current-residence";a:13:{s:14:"street_address";s:0:"";s:4:"city";s:0:"";s:5:"state";s:0:"";s:11:"amount_paid";s:0:"";s:5:"owner";s:0:"";s:8:"phone_no";s:0:"";s:18:"reason_for_leaving";s:0:"";s:9:"rent_paid";N;s:12:"given-notice";N;s:13:"asked_to_move";s:0:"";s:9:"utilities";s:0:"";s:14:"residence_from";s:0:"";s:12:"residence_to";s:0:"";}s:18:"previous-residence";a:13:{s:14:"street_address";s:0:"";s:4:"city";s:0:"";s:5:"state";s:0:"";s:11:"amount_paid";s:0:"";s:5:"owner";s:0:"";s:8:"phone_no";s:0:"";s:18:"reason_for_leaving";s:0:"";s:9:"rent_paid";N;s:12:"given-notice";N;s:13:"asked_to_move";s:0:"";s:9:"utilities";s:0:"";s:14:"residence_from";s:0:"";s:12:"residence_to";s:0:"";}s:15:"prior-residence";a:13:{s:14:"street_address";s:0:"";s:4:"city";s:0:"";s:5:"state";s:0:"";s:11:"amount_paid";s:0:"";s:5:"owner";s:0:"";s:8:"phone_no";s:0:"";s:18:"reason_for_leaving";s:0:"";s:9:"rent_paid";N;s:12:"given-notice";N;s:13:"asked_to_move";s:0:"";s:9:"utilities";s:0:"";s:14:"residence_from";s:0:"";s:12:"residence_to";s:0:"";}}'),
(18, 1, 95, 'employment-info', 'a:3:{s:18:"current-employment";a:8:{s:7:"company";s:0:"";s:7:"address";s:0:"";s:8:"phone_no";s:0:"";s:10:"occupation";s:0:"";s:10:"supervisor";s:0:"";s:17:"current_gross_pay";s:0:"";s:8:"emp_from";s:0:"";s:6:"emp_to";s:0:"";}s:19:"previous-employment";a:8:{s:7:"company";s:0:"";s:7:"address";s:0:"";s:8:"phone_no";s:0:"";s:10:"occupation";s:0:"";s:10:"supervisor";s:0:"";s:18:"previous_gross_pay";s:0:"";s:8:"emp_from";s:0:"";s:6:"emp_to";s:0:"";}s:16:"prior-employment";a:8:{s:7:"company";s:0:"";s:7:"address";s:0:"";s:8:"phone_no";s:0:"";s:10:"occupation";s:0:"";s:10:"supervisor";s:0:"";s:15:"prior_gross_pay";s:0:"";s:8:"emp_from";s:0:"";s:6:"emp_to";s:0:"";}}'),
(19, 1, 95, 'credit-info', 'a:4:{s:6:"saving";a:2:{s:4:"name";s:0:"";s:7:"balance";s:0:"";}s:8:"checking";a:2:{s:4:"name";s:0:"";s:7:"balance";s:0:"";}s:6:"credit";a:2:{s:4:"name";s:0:"";s:7:"balance";s:0:"";}s:4:"loan";a:2:{s:4:"name";s:0:"";s:7:"balance";s:0:"";}}'),
(20, 1, 95, 'referral-info', 'a:3:{s:6:"doctor";a:6:{s:4:"name";s:0:"";s:7:"address";s:0:"";s:4:"city";s:0:"";s:5:"state";s:0:"";s:3:"zip";s:0:"";s:7:"contact";N;}s:6:"lawyer";a:6:{s:4:"name";s:0:"";s:7:"address";s:0:"";s:4:"city";s:0:"";s:5:"state";s:0:"";s:3:"zip";s:0:"";s:7:"contact";N;}s:6:"native";a:6:{s:4:"name";s:0:"";s:7:"address";s:0:"";s:4:"city";s:0:"";s:5:"state";s:0:"";s:3:"zip";s:0:"";s:7:"contact";N;}}'),
(21, 1, 95, 'general-info', 'a:17:{s:9:"question1";s:0:"";s:9:"question2";s:0:"";s:9:"question3";s:0:"";s:9:"question4";s:0:"";s:9:"question5";s:0:"";s:9:"question6";s:0:"";s:9:"question7";s:0:"";s:9:"question8";s:0:"";s:9:"question9";s:0:"";s:10:"question10";s:0:"";s:10:"question11";s:0:"";s:10:"question12";s:0:"";s:10:"question13";s:0:"";s:10:"question14";s:0:"";s:10:"question15";s:0:"";s:10:"question16";s:0:"";s:10:"question17";N;}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Real Estate', 'real-estate', 0),
(3, 'gallery', 'gallery', 0),
(4, 'image', 'image', 0),
(5, 'standard', 'standard', 0),
(6, 'video', 'video', 0),
(7, 'Air Conditioning', 'air-conditioning', 0),
(8, 'Apartment', 'apartment', 0),
(9, 'Balcony', 'balcony', 0),
(10, 'Built-In Kitchen', 'built-in-kitchen', 0),
(11, 'Dryer', 'dryer', 0),
(12, 'Fireplace', 'fireplace', 0),
(13, 'For Rent', 'rent', 0),
(14, 'For Sale', 'sale', 0),
(15, 'Fully Furnished', 'fully-furnished', 0),
(16, 'Gym', 'gym', 0),
(17, 'Heating', 'heating', 0),
(18, 'House', 'house', 0),
(19, 'London', 'london', 0),
(20, 'Office', 'office', 0),
(21, 'Paris', 'paris', 0),
(22, 'Pool', 'pool', 0),
(23, 'Soho', 'soho', 0),
(24, 'St. James', 'st-james', 0),
(25, 'Storage', 'storage', 0),
(26, 'Villa', 'villa', 0),
(27, 'Washer', 'washer', 0),
(28, 'Westminster', 'westminster', 0),
(29, 'Yard', 'yard', 0),
(30, 'Auteuil', 'auteuil', 0),
(31, 'Belgravia', 'belgravia', 0),
(32, 'Chelsea', 'chelsea', 0),
(33, 'City of London', 'city-of-london', 0),
(34, 'Lambeth', 'lambeth', 0),
(35, 'Muette', 'muette', 0),
(36, 'Main Menu', 'main-menu', 0),
(37, 'Image', 'post-format-image', 0),
(38, 'Gallery', 'post-format-gallery', 0),
(39, 'Video', 'post-format-video', 0),
(40, 'India', 'india', 0),
(42, 'ghg', 'ghg', 0),
(43, 'car parking', 'car-parking', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(461, 36, 0),
(463, 36, 0),
(482, 36, 0),
(483, 36, 0),
(485, 36, 0),
(486, 36, 0),
(487, 36, 0),
(488, 36, 0),
(45, 7, 0),
(45, 10, 0),
(45, 11, 0),
(45, 15, 0),
(45, 17, 0),
(45, 25, 0),
(45, 27, 0),
(45, 8, 0),
(45, 14, 0),
(45, 19, 0),
(45, 28, 0),
(65, 7, 0),
(65, 9, 0),
(65, 22, 0),
(65, 25, 0),
(65, 29, 0),
(65, 14, 0),
(65, 18, 0),
(65, 19, 0),
(65, 28, 0),
(73, 7, 0),
(73, 15, 0),
(73, 17, 0),
(73, 25, 0),
(73, 33, 0),
(73, 19, 0),
(73, 13, 0),
(73, 20, 0),
(77, 7, 0),
(77, 16, 0),
(77, 17, 0),
(77, 22, 0),
(77, 25, 0),
(77, 30, 0),
(77, 21, 0),
(77, 14, 0),
(77, 20, 0),
(759, 18, 0),
(759, 14, 0),
(759, 19, 0),
(758, 18, 0),
(758, 13, 0),
(758, 19, 0),
(120, 6, 0),
(107, 4, 0),
(107, 37, 0),
(107, 2, 0),
(118, 3, 0),
(118, 4, 0),
(118, 38, 0),
(118, 2, 0),
(120, 2, 0),
(120, 39, 0),
(262, 5, 0),
(262, 2, 0),
(297, 7, 0),
(297, 9, 0),
(297, 10, 0),
(297, 11, 0),
(297, 12, 0),
(297, 15, 0),
(297, 17, 0),
(297, 22, 0),
(297, 25, 0),
(297, 27, 0),
(297, 29, 0),
(297, 13, 0),
(297, 18, 0),
(297, 19, 0),
(297, 24, 0),
(410, 7, 0),
(410, 9, 0),
(410, 10, 0),
(410, 11, 0),
(410, 12, 0),
(410, 15, 0),
(410, 16, 0),
(410, 17, 0),
(410, 22, 0),
(410, 25, 0),
(410, 27, 0),
(410, 29, 0),
(410, 31, 0),
(410, 19, 0),
(410, 14, 0),
(410, 26, 0),
(68, 7, 0),
(68, 9, 0),
(68, 10, 0),
(68, 11, 0),
(68, 12, 0),
(68, 15, 0),
(68, 16, 0),
(68, 17, 0),
(68, 22, 0),
(68, 25, 0),
(68, 27, 0),
(68, 29, 0),
(68, 32, 0),
(68, 19, 0),
(68, 13, 0),
(68, 26, 0),
(95, 7, 0),
(95, 17, 0),
(95, 25, 0),
(95, 8, 0),
(95, 14, 0),
(95, 19, 0),
(95, 23, 0),
(97, 7, 0),
(97, 10, 0),
(97, 15, 0),
(97, 17, 0),
(97, 25, 0),
(97, 8, 0),
(97, 13, 0),
(97, 34, 0),
(97, 19, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', '', 0, 4),
(3, 3, 'post_tag', '', 0, 1),
(4, 4, 'post_tag', '', 0, 2),
(5, 5, 'post_tag', '', 0, 1),
(6, 6, 'post_tag', '', 0, 1),
(7, 7, 'property-features', 'Add a custom description to enhance your property details. It''ll also give you some extra SEO juice ;-)\n\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem.\n', 0, 9),
(8, 8, 'property-type', '', 0, 3),
(9, 9, 'property-features', '', 0, 4),
(10, 10, 'property-features', '', 0, 5),
(11, 11, 'property-features', '', 0, 4),
(12, 12, 'property-features', '', 0, 3),
(13, 13, 'property-status', '', 0, 5),
(14, 14, 'property-status', '', 0, 6),
(15, 15, 'property-features', '', 0, 6),
(16, 16, 'property-features', '', 0, 3),
(17, 17, 'property-features', '', 0, 8),
(18, 18, 'property-type', '', 0, 4),
(19, 19, 'property-location', 'The capital city of England and the United Kingdom. It is the most populous city in the United Kingdom, with a metropolitan area of over 13 million inhabitants. Standing on the River Thames, London has been a major settlement for two millennia, its history going back to its founding by the Romans, who named it Londinium. London''s ancient core, the City of London, largely retains its 1.12-square-mile (2.9 km2) mediaeval boundaries and in 2011 had a resident population of 7,375, making it the smallest city in England.', 0, 10),
(20, 20, 'property-type', '', 0, 2),
(21, 21, 'property-location', 'The most populous city of France. Situated on the Seine River, in the north of the country, it is at the heart of the Île-de-France region. The city''s municipality (the 20 arrondissements) had a population of 2,243,833 in 2010, while its urban agglomeration, the most populous in the European Union, had more than 10 million inhabitants.', 0, 1),
(22, 22, 'property-features', '', 0, 5),
(23, 23, 'property-location', '', 19, 1),
(24, 24, 'property-location', '', 19, 1),
(25, 25, 'property-features', '', 0, 9),
(26, 26, 'property-type', '', 0, 2),
(27, 27, 'property-features', '', 0, 4),
(28, 28, 'property-location', '', 19, 2),
(29, 29, 'property-features', '', 0, 4),
(30, 30, 'property-location', '', 21, 1),
(31, 31, 'property-location', '', 19, 1),
(32, 32, 'property-location', '', 19, 1),
(33, 33, 'property-location', '', 19, 1),
(34, 34, 'property-location', '', 19, 1),
(35, 35, 'property-location', '', 21, 0),
(36, 36, 'nav_menu', '', 0, 8),
(37, 37, 'post_format', '', 0, 1),
(38, 38, 'post_format', '', 0, 1),
(39, 39, 'post_format', '', 0, 1),
(40, 40, 'property-location', '', 0, 0),
(42, 42, 'property-location', '', 0, 0),
(43, 43, 'property-features', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=802 ;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'vikaskimt'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw'),
(13, 1, 'show_welcome_panel', '1'),
(461, 25, 'nickname', 'tanu'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '770'),
(59, 1, 'closedpostboxes_property', 'a:4:{i:0;s:17:"property_settings";i:1;s:14:"pages_settings";i:2;s:9:"authordiv";i:3;s:8:"meta-box";}'),
(60, 1, 'metaboxhidden_property', 'a:1:{i:0;s:7:"slugdiv";}'),
(62, 1, 'meta-box-order_property', 'a:4:{s:15:"acf_after_title";s:0:"";s:4:"side";s:114:"submitdiv,property-locationdiv,property-typediv,property-statusdiv,property-featuresdiv,pageparentdiv,postimagediv";s:6:"normal";s:89:"property_settings,schedule_tour_settings,pages_settings,acf_10,slugdiv,authordiv,meta-box";s:8:"advanced";s:0:"";}'),
(16, 1, 'closedpostboxes_acf', 'a:0:{}'),
(17, 1, 'metaboxhidden_acf', 'a:1:{i:0;s:7:"slugdiv";}'),
(30, 1, 'nav_menu_recently_edited', '36'),
(31, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(32, 1, 'metaboxhidden_nav-menus', 'a:9:{i:0;s:8:"add-post";i:1;s:12:"add-property";i:2;s:15:"add-testimonial";i:3;s:12:"add-post_tag";i:4;s:15:"add-post_format";i:5;s:21:"add-property-location";i:6;s:19:"add-property-status";i:7;s:17:"add-property-type";i:8;s:21:"add-property-features";}'),
(33, 1, 'meta-box-order_dashboard', 'a:4:{s:6:"normal";s:38:"dashboard_right_now,dashboard_activity";s:4:"side";s:39:"dashboard_quick_press,dashboard_primary";s:7:"column3";s:0:"";s:7:"column4";s:0:"";}'),
(34, 1, 'wp_user-settings', 'editor=html&libraryContent=browse&hidetb=1&imgsize=full&advImgDetails=show&mfold=o&dfw_width=691&align=center&wplink=1&posts_list_mode=list'),
(35, 1, 'wp_user-settings-time', '1423226213'),
(129, 1, 'metaboxhidden_dashboard', 'a:0:{}'),
(128, 1, 'closedpostboxes_dashboard', 'a:3:{i:0;s:19:"dashboard_right_now";i:1;s:18:"dashboard_activity";i:2;s:21:"dashboard_quick_press";}'),
(63, 1, 'screen_layout_property', '2'),
(64, 1, 'closedpostboxes_post', 'a:2:{i:0;s:22:"schedule_tour_settings";i:1;s:14:"pages_settings";}'),
(65, 1, 'metaboxhidden_post', 'a:9:{i:0;s:17:"post_type_gallery";i:1;s:15:"post_type_video";i:2;s:6:"acf_10";i:3;s:11:"postexcerpt";i:4;s:13:"trackbacksdiv";i:5;s:10:"postcustom";i:6;s:16:"commentstatusdiv";i:7;s:7:"slugdiv";i:8;s:9:"authordiv";}'),
(66, 1, 'meta-box-order_post', 'a:4:{s:15:"acf_after_title";s:0:"";s:4:"side";s:61:"submitdiv,formatdiv,categorydiv,tagsdiv-post_tag,postimagediv";s:6:"normal";s:139:"post_type_gallery,post_type_video,pages_settings,acf_10,postexcerpt,trackbacksdiv,postcustom,commentstatusdiv,commentsdiv,slugdiv,authordiv";s:8:"advanced";s:0:"";}'),
(67, 1, 'screen_layout_post', '2'),
(201, 1, 'company_name', ''),
(202, 1, 'office_phone_number', ''),
(800, 1, 'user_image', ''),
(799, 42, 'custom_linkedin', ''),
(798, 42, 'custom_google', ''),
(797, 42, 'custom_twitter', ''),
(796, 42, 'custom_facebook', ''),
(795, 42, 'fax_number', ''),
(794, 42, 'mobile_phone_number', ''),
(793, 42, 'office_phone_number', ''),
(792, 42, 'company_name', ''),
(790, 42, 'wp_capabilities', 'a:1:{s:7:"tenants";b:1;}'),
(203, 1, 'mobile_phone_number', ''),
(204, 1, 'fax_number', ''),
(205, 1, 'custom_facebook', ''),
(206, 1, 'custom_twitter', ''),
(207, 1, 'custom_google', ''),
(208, 1, 'custom_linkedin', ''),
(791, 42, 'wp_user_level', '0'),
(789, 42, 'show_admin_bar_front', 'true'),
(787, 42, 'admin_color', 'fresh'),
(788, 42, 'use_ssl', '0'),
(786, 42, 'comment_shortcuts', 'false'),
(785, 42, 'rich_editing', 'true'),
(784, 42, 'description', ''),
(783, 42, 'last_name', ''),
(782, 42, 'first_name', ''),
(781, 42, 'nickname', 'vikaschauhan'),
(462, 25, 'first_name', 'Tanu'),
(463, 25, 'last_name', 'Gupta'),
(464, 25, 'description', ''),
(465, 25, 'rich_editing', 'true'),
(466, 25, 'comment_shortcuts', 'false'),
(467, 25, 'admin_color', 'sunrise'),
(468, 25, 'use_ssl', '0'),
(469, 25, 'show_admin_bar_front', 'true'),
(470, 25, 'wp_capabilities', 'a:1:{s:7:"tenants";b:1;}'),
(471, 25, 'wp_user_level', '0'),
(472, 25, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets'),
(801, 1, 'session_tokens', 'a:2:{s:64:"946b7930bb89910ab3e993a2ba47c5106c60cfe996f2deb3004d5be38772f3cd";a:4:{s:10:"expiration";i:1425448548;s:2:"ip";s:15:"122.177.102.215";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.3; WOW64; rv:36.0) Gecko/20100101 Firefox/36.0";s:5:"login";i:1425275748;}s:64:"e98c8f948dd172cf9f77cd9de50a0374c26168de45543ce8335c3e975ad07449";a:4:{s:10:"expiration";i:1425461228;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:72:"Mozilla/5.0 (Windows NT 6.3; WOW64; rv:36.0) Gecko/20100101 Firefox/36.0";s:5:"login";i:1425288428;}}'),
(547, 30, 'nickname', 'a'),
(548, 30, 'first_name', ''),
(549, 30, 'last_name', ''),
(550, 30, 'description', ''),
(551, 30, 'rich_editing', 'true'),
(552, 30, 'comment_shortcuts', 'false'),
(553, 30, 'admin_color', 'fresh'),
(554, 30, 'use_ssl', '0'),
(555, 30, 'show_admin_bar_front', 'true'),
(556, 30, 'wp_capabilities', 'a:1:{s:7:"tenants";b:1;}'),
(557, 30, 'wp_user_level', '0'),
(558, 30, 'company_name', ''),
(559, 30, 'office_phone_number', ''),
(560, 30, 'mobile_phone_number', ''),
(561, 30, 'fax_number', ''),
(562, 30, 'custom_facebook', ''),
(563, 30, 'custom_twitter', ''),
(564, 30, 'custom_google', ''),
(565, 30, 'custom_linkedin', ''),
(566, 31, 'nickname', 'ab'),
(567, 31, 'first_name', ''),
(568, 31, 'last_name', ''),
(569, 31, 'description', ''),
(570, 31, 'rich_editing', 'true'),
(571, 31, 'comment_shortcuts', 'false'),
(572, 31, 'admin_color', 'fresh'),
(573, 31, 'use_ssl', '0'),
(574, 31, 'show_admin_bar_front', 'true'),
(575, 31, 'wp_capabilities', 'a:1:{s:7:"tenants";b:1;}'),
(576, 31, 'wp_user_level', '0'),
(577, 31, 'company_name', ''),
(578, 31, 'office_phone_number', ''),
(579, 31, 'mobile_phone_number', ''),
(580, 31, 'fax_number', ''),
(581, 31, 'custom_facebook', ''),
(582, 31, 'custom_twitter', ''),
(583, 31, 'custom_google', ''),
(584, 31, 'custom_linkedin', ''),
(585, 25, 'session_tokens', 'a:3:{s:64:"3997b5d1690fd210aadf590c2d4156fb692f81d11b23dde3e12a2b4514c56765";a:4:{s:10:"expiration";i:1423311836;s:2:"ip";s:15:"122.177.189.112";s:2:"ua";s:65:"Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0";s:5:"login";i:1423139036;}s:64:"15bd71dae8e4c18a0204e098e0bdf367cace7e05c11de5b5d861b73365783db6";a:4:{s:10:"expiration";i:1423399362;s:2:"ip";s:14:"122.177.185.58";s:2:"ua";s:65:"Mozilla/5.0 (Windows NT 6.1; rv:35.0) Gecko/20100101 Firefox/35.0";s:5:"login";i:1423226562;}s:64:"09afff0cdb91478004fb41656b168ccb051dc698491435ad1563ad71e126bf4f";a:4:{s:10:"expiration";i:1423399382;s:2:"ip";s:14:"122.177.185.58";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36";s:5:"login";i:1423226582;}}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$B2ld277qvv6H4IFJBSfp6OJtvLXW380', 'admin', 'pankaj@newgneray.com', '', '2015-01-05 05:54:16', '', 0, 'admin'),
(25, 'tanu', '$P$ByUvYDxrniV3B46fLDDfOuF/l4O.71/', 'tanu', 'tanugupta39@gmail.com', 'http://newgenray.com', '2015-01-27 07:55:20', '', 0, 'Tanu Gupta'),
(42, 'vikaschauhan', '$P$BhZM9/M41Udb06rSc29vop0lLqUJ501', 'vikaschauhan', 'vikaschauhan@newgenray.com', '', '2015-02-16 07:52:02', '', 0, 'vikaschauhan'),
(30, 'a', '$P$BoDUJABJcFfHQVO6bfaDI0ZRUONzZF.', 'a', 'a@gmail.com', '', '2015-01-30 13:42:04', '', 0, 'a'),
(31, 'ab', '$P$ByR3LiXNuI24Hy5hjPJbi7OYreSJXH.', 'ab', 'ab@gmail.com', '', '2015-01-30 13:42:22', '', 0, 'ab');

-- --------------------------------------------------------

--
-- Table structure for table `wp_work_status`
--

CREATE TABLE IF NOT EXISTS `wp_work_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `wp_work_status`
--

INSERT INTO `wp_work_status` (`id`, `status`) VALUES
(1, 'pending'),
(2, 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `wp_work_type`
--

CREATE TABLE IF NOT EXISTS `wp_work_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `wp_work_type`
--

INSERT INTO `wp_work_type` (`id`, `type`) VALUES
(13, 'test'),
(10, 'plumbing'),
(11, 'blacksmith');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigned_roles`
--
ALTER TABLE `assigned_roles`
  ADD CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `assigned_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
