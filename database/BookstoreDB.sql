CREATE DATABASE  IF NOT EXISTS `bookonline` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bookonline`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: bookonline
-- ------------------------------------------------------
-- Server version	5.6.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `Username` varchar(10) NOT NULL,
  `Password` varchar(30) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(45) NOT NULL,
  `UnitPrice` float NOT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `AuthorList` varchar(50) NOT NULL,
  `ImageUrl` varchar(70) NOT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (2,'CCPT7: Nguoi hoc viec',120000,'Truyen','Nhat M Nguyen','/resources/images/ccpt7-nhatnguyen.jpg',1),(3,'CCPT6 - Bi mat cua gia dinh Manuelson',100000,NULL,'Nhat Nguyen','/resources/images/ccpt6-nhatnguyen.jpg',1),(4,'Lap trinh Android',90000,'Android','Truong Thi Ngoc Phuong','/resources/images/ltandroid-ttnphuong.jpg',0),(5,'Ring',75000,NULL,'Suzuki Koji','/resources/images/ring-suzukikoji.jpg',1),(6,'Spiral',85000,NULL,'Suzuki Koji','/resources/images/spiral-suzukikoji.jpg',1),(7,'Twilight',90000,NULL,'Stephenie Meyer','/resources/images/twilight-smeyer.jpg',1),(15,'Hon ma online',65000,'Truyen ma dau tay','Nhat Nguyen','/resources/images/honmaonline-nhatnguyen.jpg',0),(17,'Harry Potter and the Deathly Hallows',575000,'Harry Potter tap 7\r <br/>Tap cuoi','J.K. Rowling','/resources/images/hp7-jkrowling.jpg',1),(26,'Oan hon trong ky tuc xa',90000,'Hon ma online phan 2<br/><b>Kha hay</b>','Nhat Nguyen','/resources/images/noimage.png',1);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BookId` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Category_idx` (`CategoryId`),
  KEY `FK_Book_idx` (`BookId`),
  CONSTRAINT `FK_Book` FOREIGN KEY (`BookId`) REFERENCES `book` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Category` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (5,3,4),(6,3,8),(7,4,1),(8,4,3),(9,5,4),(10,5,7),(11,6,4),(12,6,7),(13,7,4),(14,7,8),(15,7,9),(42,2,8),(43,2,4),(44,2,1),(45,15,7),(46,15,8),(47,17,4),(48,17,8),(54,26,4),(55,26,8),(56,26,7);
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Study','Study'),(2,'Workbook','Workbook'),(3,'Reference','Reference'),(4,'Novel','Novel'),(5,'Comic','For Children'),(6,'Detective','Detective Stories'),(7,'Horror','Horror stories'),(8,'Teenager','Teenager'),(9,'Romance','Romance'),(12,'Toan','Toan');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `Address` varchar(70) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('guest','guest','Guest',NULL,NULL,NULL),('nhat1234','nigel4492','Nhat Nguyen Minh','15/5 Ng Du P7 GV','brightsunnigellus@gmail.com','01212425218'),('nhat4492','123456','Nhat Nguyen','15/5 Nguyen Du','brightsunnigellus@gmail.com','01212425218'),('pascal','12345689','Pascal Jones','14 Merlin','pascal3893@yahoo.com','0161861568');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagegallery`
--

DROP TABLE IF EXISTS `imagegallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagegallery` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BookId` int(11) NOT NULL,
  `ImageUrl` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Images_Book_idx` (`BookId`),
  CONSTRAINT `FK_Images_Book` FOREIGN KEY (`BookId`) REFERENCES `book` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagegallery`
--

LOCK TABLES `imagegallery` WRITE;
/*!40000 ALTER TABLE `imagegallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagegallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerId` varchar(30) NOT NULL,
  `OrderDate` datetime NOT NULL,
  `TotalAmount` float NOT NULL,
  `Address` varchar(70) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Fullname` varchar(50) NOT NULL,
  `ConfirmCode` varchar(15) NOT NULL,
  `Status` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Order_Customer_idx` (`CustomerId`),
  CONSTRAINT `FK_Order_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (3,'nhat1234','2014-11-02 00:24:15',330000,'15/5 Ng Du P7 GV','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen Minh','A1562FDDF2VVD68','Submitted'),(4,'nhat1234','2014-12-02 00:30:56',330000,'15/5 Ng Du P7 GV','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen Minh','SV565FWF61WFW55','Delivered'),(5,'nhat1234','2014-12-02 00:36:14',575000,'15/5 Ng Du P7 GV','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen Minh','UYKYRBJ565EEWF4','Submitted'),(6,'guest','2014-12-02 15:29:59',180000,'1 ND GV','abc@gmail.com','0124281648','Guest','TRT526581EF668G','Delivered'),(7,'guest','2014-12-02 15:32:26',575000,'3 ND F7 GV','thoni@gmail.com','01212425218','Thong Le','EWF59GEBTR53589','Submitted'),(8,'nhat1234','2014-12-02 17:26:13',1725000,'15/5 Ng Du P7 GV','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen Minh','BEBE1WQ68FGEW58','Delivered'),(9,'guest','2014-12-03 16:44:18',75000,'26/2 NTS P7 GV','xanh.buonvui@yahoo.com.vn','01693181818','Thanh Vo','BTR5TJY58NYHT66','Pending'),(10,'guest','2014-12-04 10:41:16',385000,'24/232 Nguyen Du GV','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen Minh','REGR563R38TTJ5Y','Pending'),(11,'nhat4492','2014-12-04 11:05:22',726275,'15/5 Nguyen Du','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen','3545R8GE6884GG2','Pending'),(18,'guest','2014-12-04 14:03:20',93500,'15/5 Ng Du P7 GV','brightsunnigellus@gmail.com','01212425218','Guest','0XW87B04UB03S42','Pending'),(19,'guest','2014-12-04 14:14:45',132000,'15/5 ND GV','brightsunnigellus@gmail.com','01212425218','Guest','4HSMD5M2B7MJQ7H','Pending'),(20,'guest','2014-12-04 14:22:23',132000,'15/5 ND','brightsunnigellus@gmail.com','01212425218','Guest','EAC4QE0YP7DT9WM','Pending'),(21,'guest','2014-12-04 14:31:59',82500,'15/5 ND','brightsunnigellus@gmail.com','01212425218','Guest','SAIWMNJAH2GSZ57','Submitted');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderdetails` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrderId` int(11) NOT NULL,
  `BookId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Order_Details_idx` (`OrderId`),
  KEY `FK_Book_Details_idx` (`BookId`),
  CONSTRAINT `FK_Book_Details` FOREIGN KEY (`BookId`) REFERENCES `book` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Order_Details` FOREIGN KEY (`OrderId`) REFERENCES `order` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,3,4,1),(2,3,2,2),(3,4,4,1),(4,4,2,2),(6,6,4,2),(9,9,5,1),(10,10,3,2),(11,10,5,2),(12,11,2,1),(13,11,17,1),(22,18,6,1),(23,19,2,1),(24,20,2,1),(25,21,5,1);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-05  0:23:53
