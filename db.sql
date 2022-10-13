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
  `shop_liscence` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `barber_shop` */

insert  into `barber_shop`(`shop_id`,`shop_lid`,`shop_name`,`shop_image`,`shop_place`,`shop_post`,`shop_pin`,`shop_district`,`shop_latitude`,`shop_longitude`,`shop_phone`,`shop_email`,`shop_status`,`shop_type`,`shop_liscence`) values 
(1,2,'Sarika Barbershop','/static/photo/20221008222546.jpg','Kizhakkummuri','Kakkodi',673611,'Kozhikode',11,75,7845124578,'sarika@gmail.com','approved','Gents','2147483647'),
(2,4,'Sarala Barbershop','/static/photo/20221008222906.jpg','Kizhakkummuri','Kakkodi',673611,'Kozhikode',11,75,7845124578,'sarala@gmail.com','approved','Gents','2147483647'),
(3,5,'Nikki barbershop','/static/photo/20221009133117.jpg','Kakkodi','Kizhakkummuti',785478,'Kozhikode',44,78,7854785421,'nikk@gmail.com','approved','Gents','4554544'),
(4,9,'abin','/static/photo/20221009134335.jpg','kunnamangalam','kunnamangalam',673571,'kozhikode',77,87,8157099673,'abinppsc1999@gmail.com','approved','Gents','7777'),
(5,11,'azad','/static/photo/20221009134738.jpg','kunnamangalam','kunnamangalam',673571,'kozhikode',74,55,11111,'azad123@gmail.com','approved','Gents','99'),
(6,12,'','/static/photo/20221009143008.jpg','','',0,'',0,0,0,'','pending','Gents','');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `booking main` */

insert  into `booking main`(`Book_id`,`user_lid`,`shop_lid`,`amount`,`status`,`date`,`time`) values 
(1,7,0,0,'pending','2022-10-09',NULL),
(2,7,0,0,'pending','2022-10-09',NULL),
(3,7,0,0,'pending','2022-10-09',NULL),
(4,7,0,0,'pending','2022-10-09',NULL),
(5,7,4,0,'pending','2022-10-09',NULL),
(6,7,4,0,'pending','2022-10-09',NULL),
(7,7,4,0,'pending','2022-10-09',NULL),
(8,7,4,0,'pending','2022-10-11','01:47:00'),
(9,10,11,0,'pending','2022-10-11','09:55:00'),
(10,8,11,0,'pending','1999-05-05','20:06:00'),
(11,10,9,0,'pending','2022-11-11','15:40:00');

/*Table structure for table `booking_sub` */

DROP TABLE IF EXISTS `booking_sub`;

CREATE TABLE `booking_sub` (
  `Booking_subid` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`Booking_subid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

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
(20,11,9);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `login_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`login_id`,`username`,`password`,`type`) values 
(0,'admin@gmail.com','ad1','admin'),
(2,'Sarika Barbershop','123','shop'),
(3,'sarala@gmail.com','123','shop'),
(4,'sarala@gmail.com','123','shop'),
(5,'nikk@gmail.com','nikki','shop'),
(6,'Likhil','455689','user'),
(7,'tlikhil@gmail.com','2','user'),
(8,'mamtha@gmail.com','pass','user'),
(9,'abinppsc1999@gmail.com','123','shop'),
(10,'abinppsc19999@gmail.com','1','user'),
(11,'azad123@gmail.com','11','shop');

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `rating_id` int(11) NOT NULL,
  `user_lid` int(11) DEFAULT NULL,
  `rating` varchar(50) DEFAULT NULL,
  `review` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `review` */

/*Table structure for table `services` */

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_lid` int(11) DEFAULT NULL,
  `service_name` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `services` */

insert  into `services`(`service_id`,`service_lid`,`service_name`,`Description`,`rate`) values 
(1,4,'dgfdfggdfgd','wsfdsf','78'),
(3,4,'fdgdkhk','hjkhkjhk','45'),
(4,4,'ABcd','Abcd descriptipon','35'),
(5,11,'Cutting,shaving','Cutting,shaving all services are provided','70'),
(6,11,'cutting','cutting','80'),
(7,11,'shaving','shaving','80'),
(8,3,'form cutting','form cutting','90'),
(9,9,'cutting,shaving,form cutting','cutting,shaving,form cutting','90');

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
  `email` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `post` varchar(50) DEFAULT NULL,
  `pin` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`user_lid`,`username`,`age`,`gender`,`phone`,`email`,`photo`,`place`,`post`,`pin`) values 
(1,6,'Likhil',25,'Male',9747360170,'tlikhil@gmail.com','/static/photo/20221008223909.jpg','Kizhakkummuri','Kakkodi',456789),
(2,7,'Linil',25,'Male',9747360170,'tlikhil@gmail.com','/static/photo/20221008224006.jpg','Kizhakkummuri','Kakkodi',456789),
(3,8,'Mamtha',31,'None',9874561231,'mamtha@gmail.com','/static/photo/20221009103837.jpg','place','Kizhakkummuri',684545),
(4,10,'binand',22,'None',9961154392,'abinppsc19999@gmail.com','/static/photo/20221009134448.jpg','kkd','knglm',673571),
(5,13,'dsfsdf',12,'None',8778777,'gg','/static/photo/20221009143049.jpg','jjj','jjj',455454);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
