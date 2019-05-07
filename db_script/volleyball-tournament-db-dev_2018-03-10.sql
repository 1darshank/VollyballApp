# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.21)
# Database: volleyball-tournament-db-dev
# Generation Time: 2018-03-10 06:29:31 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table division
# ------------------------------------------------------------

DROP TABLE IF EXISTS `division`;

CREATE TABLE `division` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;

INSERT INTO `division` (`id`, `name`, `status`)
VALUES
	(1,'Ghanshyam','A'),
	(2,'Nilkanth','A');

/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table game
# ------------------------------------------------------------

DROP TABLE IF EXISTS `game`;

CREATE TABLE `game` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `game_no` char(5) DEFAULT NULL,
  `schedule_id` int(11) unsigned DEFAULT NULL,
  `home_team_id` int(10) unsigned DEFAULT NULL,
  `home_team_score` int(2) NOT NULL,
  `visitor_team_id` int(10) unsigned DEFAULT NULL,
  `visitor_team_score` int(2) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT '',
  `begine_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date_time` timestamp NULL DEFAULT NULL,
  `court_no` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_game_schedule_id` (`schedule_id`),
  KEY `FK_schedule_id_game_schedule_id` (`schedule_id`),
  KEY `FK_team_id_game_home_team_id` (`home_team_id`),
  KEY `FK_team_id_game_visitor_team_id` (`visitor_team_id`),
  CONSTRAINT `FK_Schedule_id_game_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`),
  CONSTRAINT `FK_team_id_game_home_team_id` FOREIGN KEY (`home_team_id`) REFERENCES `team` (`id`),
  CONSTRAINT `FK_team_id_game_visitor_team_id` FOREIGN KEY (`visitor_team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table schedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `game_no` char(5) NOT NULL DEFAULT '',
  `home_team_id` int(11) unsigned NOT NULL,
  `visitor_team_id` int(11) unsigned NOT NULL,
  `schedule_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `schedule_group_id` int(11) unsigned NOT NULL,
  `court_no` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_team_id_schedule_home_team_id` (`home_team_id`),
  KEY `FK_team_id_schedule_visitor_team_id` (`visitor_team_id`),
  KEY `FK_schedule_group_id_schedule_schdule_group_id` (`schedule_group_id`),
  CONSTRAINT `FK_schedule_group_id_schedule_schdule_group_id` FOREIGN KEY (`schedule_group_id`) REFERENCES `schedule_group` (`id`),
  CONSTRAINT `FK_team_id_schedule_home_team_id` FOREIGN KEY (`home_team_id`) REFERENCES `team` (`id`),
  CONSTRAINT `FK_team_id_schedule_visitor_team_id` FOREIGN KEY (`visitor_team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;

INSERT INTO `schedule` (`id`, `game_no`, `home_team_id`, `visitor_team_id`, `schedule_date`, `schedule_group_id`, `court_no`)
VALUES
	(1,'01',14,15,'2018-03-11 10:00:00',1,1),
	(2,'02',19,23,'2018-03-11 10:20:00',1,1),
	(3,'03',16,26,'2018-03-11 10:40:00',1,1),
	(4,'04',20,22,'2018-03-11 11:00:00',1,1),
	(5,'05',17,25,'2018-03-11 11:20:00',1,1),
	(6,'06',18,24,'2018-03-11 11:40:00',1,1),
	(7,'07',21,22,'2018-03-11 12:00:00',1,1),
	(8,'08',14,16,'2018-03-11 12:20:00',1,1),
	(9,'09',20,23,'2018-03-11 12:40:00',1,1),
	(10,'10',17,26,'2018-03-11 13:00:00',1,1),
	(11,'11',19,24,'2018-03-11 13:20:00',1,1),
	(12,'12',18,25,'2018-03-11 13:40:00',1,1),
	(13,'13',15,16,'2018-03-11 14:00:00',1,1),
	(14,'14',21,23,'2018-03-11 14:20:00',1,1),
	(15,'15',20,23,'2018-03-11 10:00:00',1,2),
	(16,'16',21,24,'2018-03-11 10:20:00',1,2),
	(17,'17',14,17,'2018-03-11 10:40:00',1,2),
	(18,'18',19,25,'2018-03-11 11:00:00',1,2),
	(19,'19',22,23,'2018-03-11 11:20:00',1,2),
	(20,'20',15,17,'2018-03-11 11:40:00',1,2),
	(21,'21',18,26,'2018-03-11 12:00:00',1,2),
	(22,'22',21,25,'2018-03-11 12:20:00',1,2),
	(23,'23',19,26,'2018-03-11 12:40:00',1,2),
	(24,'24',14,18,'2018-03-11 13:00:00',1,2),
	(25,'25',16,17,'2018-03-11 13:20:00',1,2),
	(26,'26',22,24,'2018-03-11 13:40:00',1,2),
	(27,'27',20,25,'2018-03-11 14:00:00',1,2),
	(28,'28',15,18,'2018-03-11 14:20:00',1,2),
	(29,'29',16,22,'2018-03-11 10:00:00',1,3),
	(30,'30',20,26,'2018-03-11 10:20:00',1,3),
	(31,'31',15,21,'2018-03-11 10:40:00',1,3),
	(32,'32',24,3,'2018-03-11 11:00:00',1,3),
	(33,'33',14,19,'2018-03-11 11:20:00',1,3),
	(34,'34',3,9,'2018-03-11 11:40:00',1,3),
	(35,'35',7,13,'2018-03-11 12:00:00',1,3),
	(36,'36',2,8,'2018-03-11 12:20:00',1,3),
	(37,'37',1,6,'2018-03-11 12:40:00',1,3),
	(38,'38',1,2,'2018-03-11 10:00:00',1,4),
	(39,'39',6,10,'2018-03-11 10:20:00',1,4),
	(40,'40',3,13,'2018-03-11 10:40:00',1,4),
	(41,'41',7,9,'2018-03-11 11:00:00',1,4),
	(42,'42',4,12,'2018-03-11 11:20:00',1,4),
	(43,'43',5,11,'2018-03-11 11:40:00',1,4),
	(44,'44',8,9,'2018-03-11 12:00:00',1,4),
	(45,'45',1,10,'2018-03-11 12:20:00',1,4),
	(46,'46',7,10,'2018-03-11 12:40:00',1,4),
	(47,'47',4,13,'2018-03-11 13:00:00',1,4),
	(48,'48',6,11,'2018-03-11 13:20:00',1,4),
	(49,'49',5,12,'2018-03-11 13:40:00',1,4),
	(50,'50',2,3,'2018-03-11 14:00:00',1,4),
	(51,'51',8,10,'2018-03-11 14:20:00',1,4),
	(52,'52',7,11,'2018-03-11 10:00:00',1,5),
	(53,'53',8,11,'2018-03-11 10:20:00',1,5),
	(54,'54',1,4,'2018-03-11 10:40:00',1,5),
	(55,'55',6,12,'2018-03-11 11:00:00',1,5),
	(56,'56',9,10,'2018-03-11 11:20:00',1,5),
	(57,'57',2,4,'2018-03-11 11:40:00',1,5),
	(58,'58',7,12,'2018-03-11 12:00:00',1,5),
	(59,'59',5,13,'2018-03-11 12:20:00',1,5),
	(60,'60',2,5,'2018-03-11 12:40:00',1,5),
	(61,'61',1,5,'2018-03-11 13:00:00',1,5),
	(62,'62',3,4,'2018-03-11 13:20:00',1,5),
	(63,'63',9,11,'2018-03-11 13:40:00',1,5),
	(64,'64',8,12,'2018-03-11 14:00:00',1,5),
	(65,'65',6,13,'2018-03-11 14:20:00',1,5);

/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schedule_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schedule_group`;

CREATE TABLE `schedule_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `status` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `schedule_group` WRITE;
/*!40000 ALTER TABLE `schedule_group` DISABLE KEYS */;

INSERT INTO `schedule_group` (`id`, `name`, `status`)
VALUES
	(1,'League Games','A');

/*!40000 ALTER TABLE `schedule_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table team
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team`;

CREATE TABLE `team` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_no` char(5) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL,
  `division_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_team_division_id_division_id` (`division_id`),
  CONSTRAINT `FK_team_division_id_division_id` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;

INSERT INTO `team` (`id`, `team_no`, `name`, `division_id`)
VALUES
	(1,'G1','Nbergen N',1),
	(2,'G2','Hl/KlmrRd',1),
	(3,'G3','Piscatway 3',1),
	(4,'G4','Menlo Prk',1),
	(5,'G5','Piscatway 2',1),
	(6,'G6','Edison HS',1),
	(7,'G7','N Bruns 2',1),
	(8,'G8','Isln S/ Isln N',1),
	(9,'G9','Avenel-2',1),
	(10,'G10','Piscatway 1',1),
	(11,'G11','N Bruns 1',1),
	(12,'G12','Inman Ave',1),
	(13,'G13','MCC',1),
	(14,'N1','Avenel - 1',2),
	(15,'N2','JC-07 East',2),
	(16,'N3','N Bruns 130',2),
	(17,'N4','E Bruns',2),
	(18,'N5','Gurley Rd',2),
	(19,'N6','Staten Ind/Bsking Rdg',2),
	(20,'N7','Carlton Avn',2),
	(21,'N8','Somerset - 2',2),
	(22,'N9','JC 07 - West ',2),
	(23,'N10','N Bergern Sth',2),
	(24,'N11','BrdgWater',2),
	(25,'N12','Somerset - 1',2),
	(26,'N13','Old Bridge',2);

/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table team_player
# ------------------------------------------------------------

DROP TABLE IF EXISTS `team_player`;

CREATE TABLE `team_player` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) unsigned NOT NULL,
  `first_name` varchar(120) NOT NULL DEFAULT '',
  `last_name` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_team_player_team_id_team_id` (`team_id`),
  CONSTRAINT `FK_team_player_team_id_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `team_player` WRITE;
/*!40000 ALTER TABLE `team_player` DISABLE KEYS */;

INSERT INTO `team_player` (`id`, `team_id`, `first_name`, `last_name`)
VALUES
	(1,1,'Bhargav Vyas',''),
	(2,1,'Vishal Sanghvi',''),
	(3,1,'Vasant Patel',''),
	(4,1,'Yash Hirpara',''),
	(5,1,'Meet Patel',''),
	(6,1,'Shailesh kaklotar',''),
	(7,1,'Jaymin Girishkumar Modi',''),
	(8,1,'Bhaveshbhai',''),
	(9,1,'Keyur Dodiya (VC)',''),
	(10,1,'Harsh Patel (C)',''),
	(11,2,'Nikunj Patel (C)',''),
	(12,2,'Jiagr Patel',''),
	(13,2,'Umang Patel',''),
	(14,2,'Keyur Patel',''),
	(15,2,'Nimesh Patel',''),
	(16,2,'Darshak Patel ',''),
	(17,2,'Gaurav','Vadil'),
	(18,2,'Sandip Patel','Vadil'),
	(19,3,'Dharmeshbhai Patel','Vadil'),
	(20,3,'Shivangbhai Patel','Yuvak'),
	(21,3,'Mitulbhai Patel ( C )','Vadil'),
	(22,3,'Mukundbhai Patel','Yuvak'),
	(23,3,'Pratikbhai Patel','Vadil'),
	(24,3,'Sagar Patel','Kishore'),
	(25,3,'Kamal Patel','Kishore'),
	(26,4,'Bharat Patel','Vadil'),
	(27,4,'Hitesh Nayee (C)','Vadil'),
	(28,4,'Ansh Patel','Vadil'),
	(29,4,'Tapas Patel','Vadil'),
	(30,4,'Piyush Babariya','Vadil'),
	(31,4,'Vishal Jadadiawala','Vadil'),
	(32,4,'Rishi Nayee','Kishor'),
	(33,4,'Sukhdev Dhummad','Kishor'),
	(34,4,'Eshan Patel','Vadil'),
	(35,4,'Sarah Patel','Kishor'),
	(36,5,'Pankilbhai Patel','Vadil'),
	(37,5,'Dhruv Patel','Vadil'),
	(38,5,'Ghanshyambhai Patel','Vadil'),
	(39,5,'Sanjaybhai Patel','Vadil'),
	(40,5,'Nimeshbhai Patel (C)','Vadil'),
	(41,5,'Smith patel','Vadil'),
	(42,5,'Nehulbhai','Kishore'),
	(43,5,'Riken Patel','Vadil'),
	(44,6,'Roshan Patel (C)','Vadil Mandal'),
	(45,6,'Chetan Patel','Vadil Mandal'),
	(46,6,'Maulik Patel','Yuvak mandal'),
	(47,6,'Purvang Patel','Vadil Mandal'),
	(48,6,'Vishal ',''),
	(49,6,'Ronak ',''),
	(50,6,'Darshan',''),
	(51,6,'Dhruv Patel','Kishor'),
	(52,6,'Hareshbhai Patel','Vadil'),
	(53,7,'Nilkanth Patel','Yuvak'),
	(54,7,'Yash Patel','Yuvak'),
	(55,7,'Prarak Patel','Yuvak'),
	(56,7,'Tejas Patel ( C)','Vadil'),
	(57,7,'Birju Patel','Vadil'),
	(58,7,'Jay Patel','Kishor'),
	(59,7,'Vijay Patel','Vadil'),
	(60,7,'Mihir Patel','Vadil'),
	(61,8,'Ashok (ACP) Patel (C)','Vadil'),
	(62,8,'Kaushal Parikh','Vadil'),
	(63,8,'Arvindbhai Patel','Vadil'),
	(64,8,'Nilay Patel','Vadil'),
	(65,8,'Roshan Patel','Kishore'),
	(66,8,'Nirav Mistry','Vadil'),
	(67,8,'Manish Patel','Vadil'),
	(68,8,'Mayur Patel','Kishore'),
	(69,8,'Sagar Jaymin Patel','kishore'),
	(70,8,'Ankur Patel','Vadil'),
	(71,9,'Kaushik Shah ( C)','Vadil'),
	(72,9,'Pankaj','Kishor'),
	(73,9,'Anan','Kishor'),
	(74,9,'Ruchit ','Vadil'),
	(75,9,'Yash','Vadil'),
	(76,9,'Nirav Parmar','Vadil'),
	(77,9,'Masoom Patel','Kishore'),
	(78,10,'Vishalbhai Patel (C)','Vadil'),
	(79,10,'DK','Vadil'),
	(80,10,'Jitendrabhai Desai','Vadil'),
	(81,10,'Jigar Patel','Yuvak'),
	(82,10,'Amit Patel','Vadil'),
	(83,10,'Kinjal Patel','Vadil'),
	(84,10,'Gaurangbhai Patel','Vadil'),
	(85,10,'Umesh','Vadil'),
	(86,10,'Bhaven Barot',''),
	(87,11,'Priyak Patel','Yuvak'),
	(88,11,'Vishnubhai Patel (C)','Vadil'),
	(89,11,'Divyangbhai Shah','Vadil'),
	(90,11,'Jignesh Patel','Vadil'),
	(91,11,'Nikit Patel','Yuvak'),
	(92,11,'Pankajbhai Patel','Vadil'),
	(93,11,'Pratik Patel','Yuvak'),
	(94,11,'Utsav Patel','Yuvak'),
	(95,12,'Sandip Dhummad (C)','Vadil'),
	(96,12,'Kaushik Gohil','Vadil'),
	(97,12,'Nileshbhai Jani','Vadil'),
	(98,12,'Alpesh Bhalala','Vadil'),
	(99,12,'Ashish Riyani','Vadil'),
	(100,12,'Vishal Patel','Vadil'),
	(101,12,'Pruthviraj Vachchani','Vadil'),
	(102,12,'Shree','Vadil'),
	(103,12,'Sathish','Vadil'),
	(104,12,'Piyush Patel','Vadil'),
	(105,13,'Karan Sharma','Yuvak '),
	(106,13,'Mitul Patel','Vadil'),
	(107,13,'Vishal Chauhan (VC)','Vadil'),
	(108,13,'Yogesh Patel','Kishore'),
	(109,13,'Ketu Patel','Yuvak '),
	(110,13,'Jigar Barot','Kishore '),
	(111,13,'Vasav Dave(C)','Yuvak '),
	(112,13,'Setu','Kishore '),
	(113,13,'Viren Patel','Kishore '),
	(114,13,'Amit Patel','Vadil'),
	(115,14,'Janak Kaila','Vadil'),
	(116,14,'Bankim Patel (C)','Vadil'),
	(117,14,'Chirag Patel','Vadil'),
	(118,14,'Akash Patel','Vadil'),
	(119,14,'Rupeshbhai Shah','Vadil'),
	(120,14,'Akshar Patel','Kishor'),
	(121,14,'Atul Patel','Vadil'),
	(122,15,'Deep patel ',''),
	(123,15,'Ankur patel',''),
	(124,15,'Dharmeshbhai patel',''),
	(125,15,'Jay Patel',''),
	(126,15,'Chaitanya Dani ( C) ',''),
	(127,15,'Devang Patel',''),
	(128,15,'Dhaval Patel',''),
	(129,15,'Akash Patel (VC)',''),
	(130,15,'Dhawal Patel',''),
	(131,15,'Haresh Chudgar',''),
	(132,16,'Vipul Patel','Vadil'),
	(133,16,'Ruchir Patel','Yuvak'),
	(134,16,'Nimeshbhai Modi','Vadil'),
	(135,16,'Bharatbhai Patel(DD)','Vadil'),
	(136,16,'Jigneshbhai Patel (C)','Vadil'),
	(137,16,'Vishal Patel','Yuvak'),
	(138,16,'Nilambhai Patel','Vadil'),
	(139,16,'Subhash Patel','Vadil'),
	(140,16,'Yagnesh Patel','Vadil'),
	(141,17,'Ajay Patel ( C)','Vadil'),
	(142,17,'Munnesh Patel','Vadil'),
	(143,17,'Saumil Patel','Vadil'),
	(144,17,'Viral Zinzuvadia','Vadil'),
	(145,17,'Khagesh Pathak','Vadil'),
	(146,17,'Kaushal Shah','Vadil'),
	(147,17,'Ohm Patel','Vadil'),
	(148,17,'Ashish Thaker','Vadil'),
	(149,18,'Harshad Patel',''),
	(150,18,'Mayur Patel',''),
	(151,18,'Malav Patel',''),
	(152,18,'Nalin Patel  ( C)',''),
	(153,18,'Jeet Patel',''),
	(154,18,'Ghamshyam (Sevak)',''),
	(155,18,'Dinesh Prajapati',''),
	(156,18,'Raj Patel',''),
	(157,18,'Vivek Patel',''),
	(158,18,'Rakesh A.',''),
	(159,19,'Vishal  Shah ( C)',''),
	(160,19,'Kalpesh Patel',''),
	(161,19,'Mittalbhai Patel',''),
	(162,19,'Bhavin Barot',''),
	(163,19,'Samirbhai Patel',''),
	(164,19,'Sanjiv Bhatt',''),
	(165,19,'Aditya Amin',''),
	(166,19,'Hiren Solanki',''),
	(167,19,'Dipan Solanki',''),
	(168,20,'Sanket Patel',''),
	(169,20,'Harsh Viradiya ( C) ',''),
	(170,20,'Akshar Patel ',''),
	(171,20,'Hitul Patel',''),
	(172,20,'Manan Patel',''),
	(173,20,'Akash Dadhania',''),
	(174,20,'Vasudev Patel',''),
	(175,20,'Vikesh Patel',''),
	(176,20,'Piyush Patel',''),
	(177,20,'Sanjay Patel',''),
	(178,21,'Mounesh Shukla ( C)','Vadil'),
	(179,21,'Karan Patel','Vadil'),
	(180,21,'Dhaval Patel','Vadil'),
	(181,21,'Rohan Patel','Kishore'),
	(182,21,'Dhayal Patel','Yuvak'),
	(183,21,'Samahit Patel','Kishore'),
	(184,21,'Jimmy Desai','Yuvak'),
	(185,22,'Kartik savaliya ',''),
	(186,22,'Chetan Patel ( C)',''),
	(187,22,'Rut Patel',''),
	(188,22,'Jagdish Patel',''),
	(189,22,'Dhaval V Rao',''),
	(190,22,'Tejaskumar Patel',''),
	(191,22,'Dhruv Parmar',''),
	(192,22,'Hemal',''),
	(193,22,'Divyesh',''),
	(194,22,'Sanjay Patel',''),
	(195,23,'Akshar Patel',''),
	(196,23,'Akash Patel',''),
	(197,23,'Rajiv Mehta ( C)',''),
	(198,23,'Ashwin  lakhani',''),
	(199,23,'Milan Patel',''),
	(200,23,'Vandan Patel',''),
	(201,23,'Sanjay panchani ',''),
	(202,23,'Smit',''),
	(203,23,'Chirag Mahendrabhai Patel',''),
	(204,23,'Sneh Gabani',''),
	(205,24,'Kamlesh Patel ( C)','Vadil'),
	(206,24,'Shishir ','Vadil'),
	(207,24,'Ankit','Vadil'),
	(208,24,'Hardik ','Vadil'),
	(209,24,'Ketul','Vadil'),
	(210,24,'Nikunj','Vadil'),
	(211,24,'Naitam','Kishor'),
	(212,24,'Vasant','Vadil '),
	(213,24,'Dhiren','Vadil'),
	(214,24,'Shril','Kishor'),
	(215,25,'Tejas Patel (C)','Vadil'),
	(216,25,'Umesh Patel','Vadil'),
	(217,25,'Avnesh Jadav','kishore'),
	(218,25,'Rikesh Patel','Vadil'),
	(219,25,'Ishan Patel','Yuvak'),
	(220,25,'Pritesh Patel','Vadil'),
	(221,25,'Mayur Patel','kishore'),
	(222,26,'Rakesh Patel ( C)','Vadil'),
	(223,26,'Nikee Patel','Yuvak'),
	(224,26,'Shyam Patel','Yuvak'),
	(225,26,'Micky Patel','Vadil'),
	(226,26,'Himanshu Gandhi','Vadil'),
	(227,26,'Kamlesh Donga','Vadil'),
	(228,26,'Ankit Patel','Vadil');

/*!40000 ALTER TABLE `team_player` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(80) NOT NULL DEFAULT '',
  `password` varchar(25) NOT NULL DEFAULT '',
  `role` varchar(10) NOT NULL DEFAULT '',
  `token` varchar(120) DEFAULT NULL,
  `status` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQ_user_login_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `login_name`, `password`, `role`, `token`, `status`)
VALUES
	(1,'swami@akshardham.com','shreeji','admin','a7d005bd885c4cdab7b7d9017e85657c','A'),
	(2,'court1@amrutcup.org','samp','scorer',NULL,'A'),
	(3,'court2@amrutcup.org','samp','scorer',NULL,'A'),
	(4,'court3@amrutcup.org','samp','scorer',NULL,'A'),
	(5,'court4@amrutcup.org','samp','scorer',NULL,'A'),
	(6,'court5@amrutcup.org','samp','scorer',NULL,'A');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
