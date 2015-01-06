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
-- ORDER BY:  `Username`

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`Username`, `Password`) VALUES ('admin','admin');
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
  `Quantity` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--
-- ORDER BY:  `Id`

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (3,'CCPT6 - Bi mat cua gia dinh Manuelson',100000,'Cau chuyen phap thuat tap 6 <br/> Bi mat cua gia dinh Manuelson ','Nhat Nguyen','/resources/images/ccpt6-bmgd-nhatnguyen.jpg',90,1);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (4,'Lap trinh Android',90000,'Android','Truong Thi Ngoc Phuong','/resources/images/ltandroid-ttnphuong.jpg',39,1);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (5,'Ring',75000,'Mot trong nhung tac pham kinh di kinh dien cua nha tieu thuyet Nhat Ban <b>Suzuki Koji</b>','Suzuki Koji','/resources/images/ring-suzukikoji.jpg',70,1);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (6,'Spiral',85000,'Tap tiep theo cua Ring','Suzuki Koji','/resources/images/spiral-suzukikoji.jpg',0,1);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (7,'Twilight',90000,NULL,'Stephenie Meyer','/resources/images/twilight-smeyer.jpg',0,1);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (17,'Harry Potter and the Deathly Hallows',575000,'Harry Potter tap 7\r <br/>Tap cuoi','J.K. Rowling','/resources/images/hp7-jkrowling.jpg',80,1);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (18,'CCPT7 - Nguoi hoc viec',105000,'Cau chuyen phap thuat tap 7<br/>\r\n<b>Nguoi hoc viec</b>\r\n<br/>Cong viec moi cua <i>Nigel</i> sau khi ra truong se nhu the nao?','Nhat Nguyen','/resources/images/ccpt7-nhatnguyen.jpg',108,1);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (19,'Oan hon trong ky tuc xa',90000,'Hon ma online phan 2<br/><b>Kha hay</b>','Nhat Nguyen','/resources/images/oanhontrongkytucxa-nhatnguyen.png',90,1);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (20,'CCPT5 - Chinorius Conguelin',85000,'Cau chuyen ve Nigellus va thang nhoc hang xom','Nhat Nguyen','/resources/images/NooclrAVc2fx88k.png',100,0);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (21,'Programming Microsoft ASP.NET MVC 3',1500000,'Lap trinh ASP.NET MVC','Dino Esposito','/resources/images/aspnetmvc-desposito.jpg',150,1);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (22,'Hon ma online',75000,'Truyen ngan kinh di dau tay, ke ve 2 nguoi ban Khanh va Thong.<br/>\r\nThong bi nghi oan, tu van, sau do hien ve nho Khanh giai oan giup','Nhat Nguyen','/resources/images/honmaonline-nhatnguyen.png',88,1);
INSERT INTO `book` (`Id`, `Title`, `UnitPrice`, `Description`, `AuthorList`, `ImageUrl`, `Quantity`, `Status`) VALUES (23,'Doraemon 45',10000,'Doraemon tap 45 moi','Fujiko F. Fujio','/resources/images/xHQmFLZVtBds5hh.jpg',0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--
-- ORDER BY:  `Id`

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (5,3,4);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (6,3,8);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (7,4,1);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (8,4,3);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (9,5,4);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (10,5,7);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (11,6,4);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (12,6,7);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (13,7,4);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (14,7,8);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (15,7,9);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (47,17,4);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (48,17,8);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (55,18,4);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (56,18,9);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (57,18,8);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (58,19,4);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (59,19,8);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (60,19,7);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (65,21,3);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (66,21,1);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (67,22,8);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (68,22,4);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (69,22,7);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (76,20,8);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (77,20,4);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (78,23,8);
INSERT INTO `book_category` (`Id`, `BookId`, `CategoryId`) VALUES (79,23,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--
-- ORDER BY:  `Id`

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`Id`, `Name`, `Description`) VALUES (1,'Study','Academic book for studying');
INSERT INTO `category` (`Id`, `Name`, `Description`) VALUES (2,'Workbook','Workbook for students');
INSERT INTO `category` (`Id`, `Name`, `Description`) VALUES (3,'Reference','Reference book for student and lecturer');
INSERT INTO `category` (`Id`, `Name`, `Description`) VALUES (4,'Novel','Famous novel around the world');
INSERT INTO `category` (`Id`, `Name`, `Description`) VALUES (5,'Comic','Comic for kids and teenagers');
INSERT INTO `category` (`Id`, `Name`, `Description`) VALUES (6,'Detective','Detective Stories');
INSERT INTO `category` (`Id`, `Name`, `Description`) VALUES (7,'Horror','Horror stories');
INSERT INTO `category` (`Id`, `Name`, `Description`) VALUES (8,'Teenager','Book for teenagers');
INSERT INTO `category` (`Id`, `Name`, `Description`) VALUES (9,'Romance','Romance story');
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
-- ORDER BY:  `Username`

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`Username`, `Password`, `Fullname`, `Address`, `Email`, `Phone`) VALUES ('guest','guest','Guest',NULL,NULL,NULL);
INSERT INTO `customer` (`Username`, `Password`, `Fullname`, `Address`, `Email`, `Phone`) VALUES ('nhat1234','nhat4492','Nhat Nguyen Minh','15/5 Ng Du P7 GV','brightsunnigellus@gmail.com','01212425218');
INSERT INTO `customer` (`Username`, `Password`, `Fullname`, `Address`, `Email`, `Phone`) VALUES ('nhat4492','123456','Nhat Nguyen','15/5 Nguyen Du','brightsunnigellus@gmail.com','01212425218');
INSERT INTO `customer` (`Username`, `Password`, `Fullname`, `Address`, `Email`, `Phone`) VALUES ('nigel','nigel4492','Nguyen Minh Nhat','15/5 Nguyen Du Phuong 7 Go Vap','brightsunnigellus@gmail.com','01212425218');
INSERT INTO `customer` (`Username`, `Password`, `Fullname`, `Address`, `Email`, `Phone`) VALUES ('pascal','12345689','Pascal Jones','14 Merlin','pascal3893@yahoo.com','0161861568');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagegallery`
--
-- ORDER BY:  `Id`

LOCK TABLES `imagegallery` WRITE;
/*!40000 ALTER TABLE `imagegallery` DISABLE KEYS */;
INSERT INTO `imagegallery` (`Id`, `BookId`, `ImageUrl`) VALUES (3,18,'/resources/images/ccpt7-nhatnguyen-1.png');
INSERT INTO `imagegallery` (`Id`, `BookId`, `ImageUrl`) VALUES (4,3,'/resources/images/ccpt6-nhatnguyen-3.png');
INSERT INTO `imagegallery` (`Id`, `BookId`, `ImageUrl`) VALUES (5,20,'/resources/images/ccpt5-nhatnguyen-2.png');
INSERT INTO `imagegallery` (`Id`, `BookId`, `ImageUrl`) VALUES (6,20,'/resources/images/rbZuggRbVQ2OJjM.png');
INSERT INTO `imagegallery` (`Id`, `BookId`, `ImageUrl`) VALUES (7,17,'/resources/images/BGHUwzxkWQVCXg7.jpg');
INSERT INTO `imagegallery` (`Id`, `BookId`, `ImageUrl`) VALUES (8,22,'/resources/images/034JLSM4Ndd8Igw.png');
INSERT INTO `imagegallery` (`Id`, `BookId`, `ImageUrl`) VALUES (10,19,'/resources/images/uB7C2rp9Eej0m73.png');
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
  `PaymentMethod` varchar(20) NOT NULL,
  `ConfirmCode` varchar(15) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `PayCardId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Order_Customer_idx` (`CustomerId`),
  CONSTRAINT `FK_Order_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--
-- ORDER BY:  `Id`

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (32,'guest','2014-11-10 21:51:23',120000,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Debit Card','6M1TGG600RRMS4H','Delivered','02115119841651565');
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (33,'nhat4492','2014-10-11 10:38:09',210000,'15/5 Nguyen Du','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen','Credit Card','5OEZI34HTOL1SXS','Delivered','156419819841913');
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (34,'guest','2014-02-12 09:06:39',715000,'15/5 Nguyen Du Go Vap','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen Minh','Cash','C8LDBQ8TG9E8QKJ','Submitted',NULL);
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (36,'guest','2014-03-12 11:09:32',82500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Cash','ZUVPXRK1Z1L0FU5','Submitted',NULL);
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (38,'nigel','2014-04-04 14:14:59',1092500,'15/5 Nguyen Du Phuong 7 Go Vap','brightsunnigellus@gmail.com','01212425218','Nguyen Minh Nhat','Credit Card','E6J0LXG9DAYHKZ7','Submitted','156419819841913');
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (39,'nigel','2014-04-13 14:16:37',105000,'15/5 Nguyen Du Phuong 7 Go Vap','brightsunnigellus@gmail.com','01212425218','Nguyen Minh Nhat','Cash','Z8LEQS6VPMK1955','Submitted',NULL);
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (40,'guest','2014-05-05 14:24:35',258500,'34/6 Nguyen Van Nghi','brightsunnigellus@gmail.com','01235894893','Vu Hoang','Credit Card','0SAG1T4M2FD4EGG','Delivered','056198161899');
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (44,'guest','2014-05-14 15:11:43',1650000,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen Minh','Cash','JQO2PN64ZBTLNO3','Submitted',NULL);
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (45,'guest','2014-06-04 15:14:10',82500,'15/5 Nguyen Du','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen Minh','Credit Card','GDHFNCEZ74TCKXG','Submitted','');
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (46,'nhat4492','2014-06-14 15:15:34',110000,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Debit Card','0NGXM4HSLAVJJE8','Submitted','');
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (47,'nhat1234','2014-07-10 15:23:30',93500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01693181818','Nhat Nguyen','Debit Card','6OMDES2WACRIRAS','Submitted','');
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (48,'guest','2014-07-14 15:27:21',115500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Cash','ZZD6PK6ILX7DCCT','Submitted',NULL);
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (49,'guest','2014-08-14 15:36:42',93500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Cash','CBEHZ6RX9U5PQEA','Pending',NULL);
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (50,'pascal','2014-10-14 15:39:18',1650000,'14 Merlin','brightsun_nigellus4492@yahoo.com.vn','01212425218','Pascal Jones','Cash','UZWOSTC5L1G7I1B','Submitted',NULL);
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (51,'guest','2014-12-14 15:51:55',632500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Cash','82WKYLAUR0ROD8Y','Submitted',NULL);
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (53,'guest','2014-12-29 20:16:24',346500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Cash','IELTF30W9ILDEO4','Submitted',NULL);
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (54,'guest','2014-12-29 20:18:22',231000,'15/5 Nguyen Du','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen','Cash','WQSLHV2P4Y50GYM','Submitted',NULL);
INSERT INTO `order` (`Id`, `CustomerId`, `OrderDate`, `TotalAmount`, `Address`, `Email`, `Phone`, `Fullname`, `PaymentMethod`, `ConfirmCode`, `Status`, `PayCardId`) VALUES (55,'guest','2015-01-02 20:22:28',264000,'1 Nguyen Du GV','brightsunnigellus@gmail.com','01212425218','Ha Nguyen','Credit Card','DCXJ4XHCS47RUR6','Submitted','09489613168463');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderconfig`
--

DROP TABLE IF EXISTS `orderconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderconfig` (
  `ID` int(11) NOT NULL,
  `Min` float NOT NULL,
  `Max` float NOT NULL,
  `Active` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderconfig`
--
-- ORDER BY:  `ID`

LOCK TABLES `orderconfig` WRITE;
/*!40000 ALTER TABLE `orderconfig` DISABLE KEYS */;
INSERT INTO `orderconfig` (`ID`, `Min`, `Max`, `Active`) VALUES (1,70000,1800000,1);
/*!40000 ALTER TABLE `orderconfig` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--
-- ORDER BY:  `Id`

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (3,32,3,2);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (4,33,3,2);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (5,34,5,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (6,34,17,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (8,36,5,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (10,38,17,2);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (11,39,3,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (12,40,5,2);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (13,40,6,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (18,44,21,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (19,45,22,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (20,46,3,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (21,47,6,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (22,48,18,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (23,49,6,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (24,50,21,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (25,51,17,1);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (27,53,18,3);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (28,54,18,2);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (29,55,22,2);
INSERT INTO `orderdetails` (`Id`, `OrderId`, `BookId`, `Quantity`) VALUES (30,55,4,1);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderpromotion`
--

DROP TABLE IF EXISTS `orderpromotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderpromotion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Value` float NOT NULL,
  `Type` varchar(20) NOT NULL,
  `OrderId` int(11) NOT NULL,
  `Description` varchar(70) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Promote_Order_idx` (`OrderId`),
  CONSTRAINT `FK_Promote_Order` FOREIGN KEY (`OrderId`) REFERENCES `order` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderpromotion`
--
-- ORDER BY:  `ID`

LOCK TABLES `orderpromotion` WRITE;
/*!40000 ALTER TABLE `orderpromotion` DISABLE KEYS */;
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (6,20000,'Shipping Fee',32,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (7,100000,'Fee discount',32,'Discount Coupon');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (8,20000,'Shipping Fee',33,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (9,10000,'Member Discount',33,'Discount 5% for member');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (10,65000,'Shipping Fee',34,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (12,7500,'Shipping Fee',36,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (16,115000,'Shipping Fee',38,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (17,115000,'Percent discount',38,'Discount Coupon');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (18,57500,'Member Discount',38,'Discount 5% for member');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (19,10000,'Shipping Fee',39,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (20,5000,'Member Discount',39,'Discount 5% for member');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (21,23500,'Shipping Fee',40,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (26,150000,'Shipping Fee',44,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (27,7500,'Shipping Fee',45,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (28,10000,'Shipping Fee',46,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (29,8500,'Shipping Fee',47,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (30,10500,'Shipping Fee',48,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (31,8500,'Shipping Fee',49,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (32,150000,'Shipping Fee',50,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (33,57500,'Shipping Fee',51,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (35,31500,'Shipping Fee',53,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (36,21000,'Shipping Fee',54,'10% Shipping Fee');
INSERT INTO `orderpromotion` (`ID`, `Value`, `Type`, `OrderId`, `Description`) VALUES (37,24000,'Shipping Fee',55,'10% Shipping Fee');
/*!40000 ALTER TABLE `orderpromotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PromotionCode` varchar(25) NOT NULL,
  `DiscountType` varchar(10) NOT NULL,
  `DiscountAmount` float NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `ConditionAmount` float NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Status` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--
-- ORDER BY:  `Id`

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (1,'E5DA623SSW5JTG1ERH86KY55R','Percent',14,'Discount 14% Christmas',0,'2014-12-04 00:00:00','2014-12-17 23:50:00','Inactive');
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (2,'S5689SW18YJY35GF618VS4EG8','Fee',100000,'Discount 100000VND',150000,'2014-10-12 18:00:00','2014-12-12 18:00:00','Active');
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (3,'G898G51RUJL5U6DS866AP1E58','Percent',15,'Discount 15% for Independence Day',0,'2014-08-02 00:00:00','2014-10-02 00:00:00','Inactive');
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (4,'IE928UF982E82E45V89W355SW','Percent',15,'Discount 15% for Advent Calendar',0,'2014-12-02 12:12:00','2014-12-28 12:12:00','Inactive');
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (5,'S981OCWF4613D35WAC56W23W1','Fee',300000,'Discount 300000 for Advent Calendar',400000,'2014-12-01 00:00:00','2014-12-28 00:00:00','Active');
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (6,'AZT3VK3R9T58L5LLVNHZS56WQ','Fee',200000,'Christmas and New Year discount',450000,'2014-12-01 00:00:00','2015-01-07 00:00:00','Active');
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (7,'ZV5DWRPQP28S7GSH49D2T80OI','Percent',10,'Discount 10% for Christmas',200000,'2014-12-13 15:55:00','2014-12-31 00:00:00','Active');
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (8,'HAVNBPAZGOCWSWNBJD95JABKK','Fee',200000,'Discount 200000 for New Year',350000,'2014-12-29 00:00:00','2015-01-10 00:00:00','Active');
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (9,'7XYYFVH5HR7JETLFHF83OWRUO','Fee',250000,'Discount 250000 VND for above 350000 VND Ordered',350000,'2014-12-22 00:00:00','2015-01-14 18:00:00','Active');
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (10,'1P7ZF0VJG7W5SNJ2IQPR8CXJ6','Fee',50000,'Discount 50000 VND for order total more than 150000 VND',150000,'2014-12-25 00:00:00','2015-01-13 03:00:00','Active');
INSERT INTO `promotion` (`Id`, `PromotionCode`, `DiscountType`, `DiscountAmount`, `Description`, `ConditionAmount`, `StartDate`, `EndDate`, `Status`) VALUES (11,'BMEAKWEEDLFGK8JF8WCO31OKW','Percent',10,'Christmas and New Year discount 10%',0,'2014-12-13 16:05:00','2015-01-06 23:00:00','Active');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warehouse` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DateWarehousing` datetime NOT NULL,
  `QuantityWarehousing` int(11) NOT NULL,
  `BookId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Warehouse_Book_idx` (`BookId`),
  CONSTRAINT `FK_Warehouse_Book` FOREIGN KEY (`BookId`) REFERENCES `book` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--
-- ORDER BY:  `Id`

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (1,'2014-12-29 19:50:28',10,18);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (2,'2014-12-29 19:51:53',100,20);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (3,'2014-12-29 20:19:39',70,17);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (4,'2014-12-29 20:19:46',70,3);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (5,'2014-12-29 20:20:10',90,22);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (6,'2014-12-29 20:20:28',40,4);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (7,'2014-12-29 20:28:51',80,19);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (8,'2014-12-29 20:29:02',150,21);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (9,'2014-12-29 20:29:12',20,5);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (10,'2014-12-29 23:54:32',100,18);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (11,'2014-12-29 23:55:36',10,17);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (12,'2014-12-30 00:07:32',10,3);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (13,'2014-12-31 00:41:08',50,5);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (14,'2014-12-31 00:51:52',10,19);
INSERT INTO `warehouse` (`Id`, `DateWarehousing`, `QuantityWarehousing`, `BookId`) VALUES (15,'2015-01-02 20:00:29',10,3);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-03 18:12:02
