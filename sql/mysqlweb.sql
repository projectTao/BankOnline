/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.58 : Database - bankonline
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP DATABASE IF EXISTS `bankonline`;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bankonline` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `bankonline`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '使用自增赋值',
  `cardNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '16 位数字构成的卡号',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '6 位数字的密码',
  `balance` double(10,2) NOT NULL COMMENT '2 位小数',
  `status` int(10) NOT NULL DEFAULT '1' COMMENT '1 为正常，0 为冻结',
  UNIQUE KEY `cardNo` (`cardNo`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `account` */

insert  into `account`(`id`,`cardNo`,`password`,`balance`,`status`) values (1,'4856963256235691','123123',1010.70,1),(6,'4856963256235692','123123',883.99,1),(7,'4856963256235693','123123',1106.01,1);

/*Table structure for table `transactionrecord` */

DROP TABLE IF EXISTS `transactionrecord`;

CREATE TABLE `transactionrecord` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '使用自增赋值',
  `cardNo` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '对应account 表cardNo',
  `transactionDate` date NOT NULL COMMENT '取系统时间',
  `transactionAmount` double(10,2) NOT NULL COMMENT '2 位小数',
  `balance` double(10,2) NOT NULL COMMENT '2 位小数',
  `transactionType` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '存款、取款',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交易的备注',
  PRIMARY KEY (`id`),
  KEY `cardNo` (`cardNo`),
  CONSTRAINT `transactionrecord_ibfk_1` FOREIGN KEY (`cardNo`) REFERENCES `account` (`cardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `transactionrecord` */

insert  into `transactionrecord`(`id`,`cardNo`,`transactionDate`,`transactionAmount`,`balance`,`transactionType`,`remark`) values (1,'4856963256235691','2018-05-07',100.01,1100.01,'存款','无'),(2,'4856963256235692','2018-05-07',100.00,900.13,'取款','无'),(3,'4856963256235693','2018-05-07',100.56,1100.56,'存款','无'),(4,'4856963256235691','2018-05-07',100.00,1200.01,'存款','无'),(5,'4856963256235692','2018-05-07',100.00,800.13,'取款','无'),(8,'4856963256235693','2018-05-07',100.00,1000.56,'取款','无'),(31,'4856963256235691','2018-05-11',55.55,1144.46,'转账',NULL),(32,'4856963256235692','2018-05-11',55.55,855.68,'转账',NULL),(33,'4856963256235691','2018-05-11',66.66,1077.80,'转账',NULL),(34,'4856963256235693','2018-05-11',66.66,1067.22,'转账',NULL),(35,'4856963256235691','2018-05-11',11.11,1066.69,'转账',NULL),(36,'4856963256235691','2018-05-11',11.11,1077.80,'转账',NULL),(37,'4856963256235691','2018-05-11',12.12,1065.68,'转账',NULL),(38,'4856963256235692','2018-05-11',12.12,867.80,'转账',NULL),(39,'4856963256235691','2018-05-11',19.19,1046.49,'转账',NULL),(40,'4856963256235693','2018-05-11',19.19,1086.41,'转账',NULL),(41,'4856963256235691','2018-05-11',16.19,1030.30,'转账',NULL),(42,'4856963256235692','2018-05-11',16.19,883.99,'转账',NULL),(43,'4856963256235691','2018-05-14',19.60,1010.70,'转账',NULL),(44,'4856963256235693','2018-05-14',19.60,1106.01,'转账',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
