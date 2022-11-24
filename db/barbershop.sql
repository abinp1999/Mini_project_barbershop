/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.5.20-log : Database - barbershop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`barbershop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `barbershop`;

/*Table structure for table `admin_notification` */

DROP TABLE IF EXISTS `admin_notification`;

CREATE TABLE `admin_notification` (
  `nid` int(11) NOT NULL,
  `notification` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin_notification` */

insert  into `admin_notification`(`nid`,`notification`,`date`) values 
(0,'lkjlkj jkljkljlk jljljkjkjljk kjkljlkjlkjlk lkjlkjlkj ','2022-10-09');

/*Table structure for table `bank` */

DROP TABLE IF EXISTS `bank`;

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_no` bigint(20) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `bank` */

insert  into `bank`(`bank_id`,`account_no`,`amount`,`pin`) values 
(2,123456,'49750.0',1234);

/*Table structure for table `barber_shop` */

DROP TABLE IF EXISTS `barber_shop`;

CREATE TABLE `barber_shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_lid` int(11) DEFAULT NULL,
  `shop_name` varchar(50) DEFAULT NULL,
  `shop_image` varchar(50) DEFAULT NULL,
  `shop_place` varchar(50) DEFAULT NULL,
  `shop_post` varchar(50) DEFAULT NULL,
  `shop_pin` int(11) DEFAULT NULL,
  `shop_district` varchar(50) DEFAULT NULL,
  `shop_latitude` int(11) DEFAULT NULL,
  `shop_longitude` int(11) DEFAULT NULL,
  `shop_phone` bigint(20) DEFAULT NULL,
  `shop_email` varchar(60) DEFAULT NULL,
  `shop_status` varchar(50) DEFAULT NULL,
  `shop_type` varchar(50) DEFAULT NULL,
  `shop_liscence` bigint(25) DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `barber_shop` */

insert  into `barber_shop`(`shop_id`,`shop_lid`,`shop_name`,`shop_image`,`shop_place`,`shop_post`,`shop_pin`,`shop_district`,`shop_latitude`,`shop_longitude`,`shop_phone`,`shop_email`,`shop_status`,`shop_type`,`shop_liscence`) values 
(24,34,'Sarath1','/static/photo/20221031141512.jpg','kunnamangalam','Calicut',673571,'calicut',12345,67890,8157099677,'sarath11@gmail.com','approved','Gents',123456789),
(25,36,'Akhil','/static/photo/20221031143558.jpg','Calicut','Calicut',673571,'kozhikode',12345,67890,7711223344,'akhil12@gmail.com','approved','Gents',123123),
(26,37,'Tom','/static/photo/20221031145932.jpg','Calicut','calicut',673571,'kozhikode',12345,67890,7654123411,'tom12@gmail.com','approved','Gents',123456789),
(27,40,'Jerry','/static/photo/20221110155050.jpg','calicut','calicut',673571,'kozhikode',12345,67890,9847430748,'jerry12@gmail.com','pending','Gents',9876543),
(28,41,'hasanu','/static/photo/20221110155258.jpg','calicut','calicut',673570,'kozhikode',12345,67890,8756123498,'hasanu1@gmail.com','pending','Gents',1234456),
(29,42,'Anand','/static/photo/20221110155517.jpg','calicut','calicut',673570,'calicut',12345,67890,7867564534,'anand12@gmail.com','approved','Gents',12345678);

/*Table structure for table `booking main` */

DROP TABLE IF EXISTS `booking main`;

CREATE TABLE `booking main` (
  `Book_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_lid` int(11) DEFAULT NULL,
  `shop_lid` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`Book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `booking main` */

insert  into `booking main`(`Book_id`,`user_lid`,`shop_lid`,`amount`,`status`,`date`,`time`) values 
(13,38,34,0,'approved','2022-10-11','18:15:00'),
(14,38,34,0,'pending','2022-11-15','16:10:00'),
(15,35,37,0,'approved','2022-11-30','16:30:00'),
(16,35,36,0,'pending','2022-12-10','00:00:00'),
(17,35,34,0,'pending','2022-11-15','17:23:00');

/*Table structure for table `booking_sub` */

DROP TABLE IF EXISTS `booking_sub`;

CREATE TABLE `booking_sub` (
  `Booking_subid` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Booking_subid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

/*Data for the table `booking_sub` */

insert  into `booking_sub`(`Booking_subid`,`book_id`,`service_id`) values 
(1,0,1),
(2,2,1),
(3,2,3),
(4,3,1),
(5,3,3),
(6,3,4),
(7,4,1),
(8,4,3),
(9,5,1),
(10,5,3),
(11,6,1),
(12,6,3),
(13,6,4),
(14,7,1),
(15,7,3),
(16,8,1),
(17,8,3),
(18,9,6),
(19,10,7),
(20,11,9),
(21,12,9),
(22,13,20),
(23,14,20),
(24,14,21),
(25,15,24),
(26,16,22),
(27,16,23),
(28,17,20),
(29,17,21);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(70) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(70) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`type`) values 
(1,'admin@gmail.com','ad1','admin'),
(34,'sarath11@gmail.com','abc12','shop'),
(35,'akshith12@gmail.com','abcd12','user'),
(36,'akhil12@gmail.com','Abc123','shop'),
(37,'tom12@gmail.com','C123','shop'),
(38,'shamil12@gmail.com','abcd','user'),
(39,'reema12@gmail.com','','user'),
(40,'jerry12@gmail.com','As123','shop'),
(41,'hasanu1@gmail.com','Ad1234','shop'),
(42,'anand12@gmail.com','Ad12','shop'),
(43,'admin@gmail.com','admin','admin'),
(44,'safe@safe.com','saf','user'),
(45,'textfield8@fgmail.com','123','user'),
(46,'textfield8@fgmail.com','textfield','user');

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` varchar(50) DEFAULT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `order_main_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`payment_id`,`amount`,`filename`,`order_main_id`,`status`,`date`) values 
(1,'150.0','123456',16,'paid','2022-11-17'),
(2,'150.0','123456',16,'paid','2022-11-17'),
(3,'150.0','123456',16,'paid','2022-11-17'),
(4,'150.0','123456',16,'paid','2022-11-17'),
(5,'150.0','123456',16,'paid','2022-11-17'),
(6,'150.0','123456',16,'paid','2022-11-17'),
(7,'150.0','123456',16,'paid','2022-11-17'),
(8,'150.0','123456',16,'paid','2022-11-17'),
(10,'60.0','123456',13,'paid','2022-11-20'),
(11,'130.0','123456',14,'paid','2022-11-21'),
(12,'130.0','/static/files/20221121173132.jpg',17,'paid','2022-11-21'),
(13,'80.0','/static/files/20221121173215.jpg',15,'paid','2022-11-21');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_lid` int(11) DEFAULT NULL,
  `review` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `review` */

insert  into `review`(`rating_id`,`user_lid`,`review`,`date`,`shop_id`,`rating`) values 
(1,35,'fdghgh','2022-11-17',34,NULL),
(2,35,'erteht','2022-11-17',0,NULL),
(3,35,'oiihfsjgf','2022-11-17',0,NULL),
(4,35,'hhretyh','2022-11-17',0,NULL),
(5,35,'thrtyhthy h','2022-11-17',24,NULL),
(9,38,'Good','2022-11-19',34,5),
(13,35,'GOOD services','2022-11-21',36,3.5),
(14,35,'average services','2022-11-21',42,2.5),
(15,35,'GOOD services','2022-11-21',34,4),
(16,38,'Bad services','2022-11-21',37,2.5),
(17,35,'average services','2022-11-21',36,2.5),
(18,35,'GOOD services','2022-11-21',42,5),
(19,44,'safe service','2022-11-21',37,2.5),
(20,35,'bad services','2022-11-21',36,2.5);

/*Table structure for table `services` */

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_lid` int(11) DEFAULT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `services` */

insert  into `services`(`service_id`,`service_lid`,`service_name`,`Description`,`rate`,`date`) values 
(20,34,'Cutting','form cutting','60','2022-10-31'),
(21,34,'shaving','form shaving','70','2022-10-31'),
(22,36,'form','shaving','90','2022-10-31'),
(23,36,'face','wash','60','2022-10-31'),
(24,37,'hair','coloring','80','2022-10-31');

/*Table structure for table `shop_notification` */

DROP TABLE IF EXISTS `shop_notification`;

CREATE TABLE `shop_notification` (
  `nid` int(11) DEFAULT NULL,
  `notification` varchar(100) DEFAULT NULL,
  `shopid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shop_notification` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_lid` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(70) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `pin` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_lid`,`username`,`age`,`gender`,`phone`,`email`,`photo`,`place`,`post`,`pin`) values 
(8,35,'Akshith',30,'male',9922448866,'akshith12@gmail.com','/static/photo/20221031142039.jpg','kakkanad','calicut',673571),
(9,38,'shamil',23,'male',8751096733,'shamil12@gmail.com','/static/photo/20221031150559.jpg','calicut','calicut',673567),
(10,39,'reema',23,'female',8756564422,'reema12@gmail.com','/static/photo/20221031150719.jpg','calicut','calicut',673571),
(11,44,'Safe',29,'male',8908908900,'safe@safe.com','/static/photo/20221120092419.jpg','SafeHouse','safePost',741852),
(12,45,'textfield',89,'male',9456789000,'textfield8@fgmail.com','/static/photo/20221120092927.jpg','textfield8','textfield8',0),
(13,46,'textfield',89,'male',9456789000,'textfield8@fgmail.com','/static/photo/20221120092940.jpg','textfield8','textfield8',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
