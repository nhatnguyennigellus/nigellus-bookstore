CREATE DATABASE  IF NOT EXISTS `bookonline` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bookonline`;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `Username` varchar(10) NOT NULL,
  `Password` varchar(30) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `admin` VALUES ('admin','admin');

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `category` VALUES (1,'Study','Study'),(2,'Workbook','Workbook'),(3,'Reference','Reference'),(4,'Novel','Novel'),(5,'Comic','For Children'),(6,'Detective','Detective Stories'),(7,'Horror','Horror stories'),(8,'Teenager','Teenager'),(9,'Romance','Romance');

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `book` VALUES (3,'CCPT6 - Bi mat cua gia dinh Manuelson',100000,NULL,'Nhat Nguyen','/resources/images/ccpt6-bmgd-nhatnguyen.jpg',1),(4,'Lap trinh Android',90000,'Android','Truong Thi Ngoc Phuong','/resources/images/ltandroid-ttnphuong.jpg',0),(5,'Ring',75000,NULL,'Suzuki Koji','/resources/images/ring-suzukikoji.jpg',1),(6,'Spiral',85000,NULL,'Suzuki Koji','/resources/images/spiral-suzukikoji.jpg',1),(7,'Twilight',90000,NULL,'Stephenie Meyer','/resources/images/twilight-smeyer.jpg',1),(17,'Harry Potter and the Deathly Hallows',575000,'Harry Potter tap 7\r <br/>Tap cuoi','J.K. Rowling','/resources/images/hp7-jkrowling.jpg',1),(18,'CCPT7 - Nguoi hoc viec',105000,'Cau chuyen phap thuat tap 7<br/>\r\n<b>Nguoi hoc viec</b>\r\n<br/>Cong viec moi cua <i>Nigel</i> sau khi ra truong se nhu the nao?','Nhat Nguyen','/resources/images/ccpt7-nhatnguyen.jpg',1),(19,'Oan hon trong ky tuc xa',90000,'Hon ma online phan 2<br/><b>Kha hay</b>','Nhat Nguyen','/resources/images/oanhontrongkytucxa-nhatnguyen.png',1),(20,'CCPT5 - Chinorius Conguelin',85000,'Cau chuyen ve Nigellus va thang nhoc hang xom','Nhat Nguyen','/resources/images/NooclrAVc2fx88k.png',1),(21,'Programming Microsoft ASP.NET MVC 3',1500000,'Lap trinh ASP.NET MVC','Dino Esposito','/resources/images/aspnetmvc-desposito.jpg',1),(22,'Hon ma online',75000,'Truyen ngan kinh di dau tay, ke ve 2 nguoi ban Khanh va Thong.<br/>\r\nThong bi nghi oan, tu van, sau do hien ve nho Khanh giai oan giup','Nhat Nguyen','/resources/images/honmaonline-nhatnguyen.png',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `book_category` VALUES (5,3,4),(6,3,8),(7,4,1),(8,4,3),(9,5,4),(10,5,7),(11,6,4),(12,6,7),(13,7,4),(14,7,8),(15,7,9),(47,17,4),(48,17,8),(55,18,4),(56,18,9),(57,18,8),(58,19,4),(59,19,8),(60,19,7),(65,21,3),(66,21,1),(67,22,8),(68,22,4),(69,22,7),(70,20,4),(71,20,8);

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
INSERT INTO `customer` VALUES ('guest','guest','Guest',NULL,NULL,NULL),('nhat1234','nhat4492','Nhat Nguyen Minh','15/5 Ng Du P7 GV','brightsunnigellus@gmail.com','01212425218'),('nhat4492','123456','Nhat Nguyen','15/5 Nguyen Du','brightsunnigellus@gmail.com','01212425218'),('nigel','nigel4492','Nguyen Minh Nhat','15/5 Nguyen Du Phuong 7 Go Vap','brightsunnigellus@gmail.com','01212425218'),('pascal','12345689','Pascal Jones','14 Merlin','pascal3893@yahoo.com','0161861568');

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

INSERT INTO `imagegallery` VALUES (3,18,'/resources/images/ccpt7-nhatnguyen-1.png'),(4,3,'/resources/images/ccpt6-nhatnguyen-3.png'),(5,20,'/resources/images/ccpt5-nhatnguyen-2.png'),(6,20,'/resources/images/rbZuggRbVQ2OJjM.png'),(7,17,'/resources/images/BGHUwzxkWQVCXg7.jpg'),(8,22,'/resources/images/034JLSM4Ndd8Igw.png'),(10,19,'/resources/images/uB7C2rp9Eej0m73.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `order` VALUES (32,'guest','2014-12-10 21:51:23',120000,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Debit Card','6M1TGG600RRMS4H','Delivered','02115119841651565'),(33,'nhat4492','2014-12-11 10:38:09',210000,'15/5 Nguyen Du','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen','Credit Card','5OEZI34HTOL1SXS','Delivered','156419819841913'),(34,'guest','2014-12-12 09:06:39',715000,'15/5 Nguyen Du Go Vap','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen Minh','Cash','C8LDBQ8TG9E8QKJ','Submitted',NULL),(36,'guest','2014-12-12 11:09:32',82500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Cash','ZUVPXRK1Z1L0FU5','Submitted',NULL),(38,'nigel','2014-12-13 14:14:59',1092500,'15/5 Nguyen Du Phuong 7 Go Vap','brightsunnigellus@gmail.com','01212425218','Nguyen Minh Nhat','Credit Card','E6J0LXG9DAYHKZ7','Submitted','156419819841913'),(39,'nigel','2014-12-13 14:16:37',105000,'15/5 Nguyen Du Phuong 7 Go Vap','brightsunnigellus@gmail.com','01212425218','Nguyen Minh Nhat','Cash','Z8LEQS6VPMK1955','Submitted',NULL),(40,'guest','2014-12-13 14:24:35',258500,'34/6 Nguyen Van Nghi','brightsunnigellus@gmail.com','01235894893','Vu Hoang','Credit Card','0SAG1T4M2FD4EGG','Delivered','056198161899'),(44,'guest','2014-12-14 15:11:43',1650000,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen Minh','Cash','JQO2PN64ZBTLNO3','Submitted',NULL),(45,'guest','2014-12-14 15:14:10',82500,'15/5 Nguyen Du','brightsunnigellus@gmail.com','01212425218','Nhat Nguyen Minh','Credit Card','GDHFNCEZ74TCKXG','Submitted',''),(46,'nhat4492','2014-12-14 15:15:34',110000,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Debit Card','0NGXM4HSLAVJJE8','Submitted',''),(47,'nhat1234','2014-12-14 15:23:30',93500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01693181818','Nhat Nguyen','Debit Card','6OMDES2WACRIRAS','Submitted',''),(48,'guest','2014-12-14 15:27:21',115500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Cash','ZZD6PK6ILX7DCCT','Submitted',NULL),(49,'guest','2014-12-14 15:36:42',93500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Cash','CBEHZ6RX9U5PQEA','Pending',NULL),(50,'pascal','2014-12-14 15:39:18',1650000,'14 Merlin','brightsun_nigellus4492@yahoo.com.vn','01212425218','Pascal Jones','Cash','UZWOSTC5L1G7I1B','Submitted',NULL),(51,'guest','2014-12-14 15:51:55',632500,'15/5 Nguyen Du','brightsun_nigellus4492@yahoo.com.vn','01212425218','Nhat Nguyen','Cash','82WKYLAUR0ROD8Y','Submitted',NULL);
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

INSERT INTO `orderdetails` VALUES (3,32,3,2),(4,33,3,2),(5,34,5,1),(6,34,17,1),(8,36,5,1),(10,38,17,2),(11,39,3,1),(12,40,5,2),(13,40,6,1),(18,44,21,1),(19,45,22,1),(20,46,3,1),(21,47,6,1),(22,48,18,1),(23,49,6,1),(24,50,21,1),(25,51,17,1);

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

INSERT INTO `promotion` VALUES (1,'E5DA623SSW5JTG1ERH86KY55R','Percent',14,'Discount 14% Christmas',0,'2014-12-04 00:00:00','2015-01-06 12:01:00','Inactive'),(2,'S5689SW18YJY35GF618VS4EG8','Fee',100000,'Discount 100000VND',150000,'2014-10-12 18:00:00','2014-12-12 18:00:00','Active'),(3,'G898G51RUJL5U6DS866AP1E58','Percent',15,'Discount 15% for Independence Day',0,'2014-08-02 00:00:00','2014-10-02 00:00:00','Inactive'),(4,'IE928UF982E82E45V89W355SW','Percent',15,'',0,'2014-12-02 12:12:00','2014-12-28 12:12:00','Inactive'),(5,'S981OCWF4613D35WAC56W23W1','Fee',300000,NULL,400000,'2014-12-01 00:00:00','2014-12-28 00:00:00','Active'),(6,'AZT3VK3R9T58L5LLVNHZS56WQ','Fee',200000,'Christmas and New Year discount',450000,'2014-12-01 00:00:00','2015-01-07 00:00:00','Active'),(7,'ZV5DWRPQP28S7GSH49D2T80OI','Percent',10,'',200000,'2014-12-13 15:55:00','2014-12-31 00:00:00','Active'),(8,'HAVNBPAZGOCWSWNBJD95JABKK','Fee',200000,NULL,350000,'2014-12-01 00:00:00','2014-12-31 00:00:00','Active'),(9,'7XYYFVH5HR7JETLFHF83OWRUO','Fee',250000,'Discount 250000 VND for above 350000 VND Ordered',350000,'2014-12-01 00:00:00','2014-12-14 18:00:00','Active'),(10,'1P7ZF0VJG7W5SNJ2IQPR8CXJ6','Fee',50000,'Discount 50000 VND for order total more than 150000 VND',150000,'2014-12-04 00:00:00','2014-12-31 03:00:00','Active'),(11,'BMEAKWEEDLFGK8JF8WCO31OKW','Percent',10,'',0,'2014-12-13 16:05:00','2014-12-31 23:00:00','Active');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `orderpromotion` VALUES (6,20000,'Shipping Fee',32,'10% Shipping Fee'),(7,100000,'Fee discount',32,'Discount Coupon'),(8,20000,'Shipping Fee',33,'10% Shipping Fee'),(9,10000,'Member Discount',33,'Discount 5% for member'),(10,65000,'Shipping Fee',34,'10% Shipping Fee'),(12,7500,'Shipping Fee',36,'10% Shipping Fee'),(16,115000,'Shipping Fee',38,'10% Shipping Fee'),(17,115000,'Percent discount',38,'Discount Coupon'),(18,57500,'Member Discount',38,'Discount 5% for member'),(19,10000,'Shipping Fee',39,'10% Shipping Fee'),(20,5000,'Member Discount',39,'Discount 5% for member'),(21,23500,'Shipping Fee',40,'10% Shipping Fee'),(26,150000,'Shipping Fee',44,'10% Shipping Fee'),(27,7500,'Shipping Fee',45,'10% Shipping Fee'),(28,10000,'Shipping Fee',46,'10% Shipping Fee'),(29,8500,'Shipping Fee',47,'10% Shipping Fee'),(30,10500,'Shipping Fee',48,'10% Shipping Fee'),(31,8500,'Shipping Fee',49,'10% Shipping Fee'),(32,150000,'Shipping Fee',50,'10% Shipping Fee'),(33,57500,'Shipping Fee',51,'10% Shipping Fee');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

