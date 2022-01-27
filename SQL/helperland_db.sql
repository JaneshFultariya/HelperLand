-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: helperland
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` int NOT NULL,
  `CityName` varchar(50) NOT NULL,
  `StateId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_stateid_idx` (`StateId`),
  CONSTRAINT `city_stateid` FOREIGN KEY (`StateId`) REFERENCES `state` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactus` (
  `ContactUsId` int NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SubjectType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Subject` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PhoneNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Message` varchar(45) NOT NULL,
  `UploadFileName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `CreatedBy` int DEFAULT NULL,
  `Status` int DEFAULT NULL,
  `Priority` int DEFAULT NULL,
  `AssignedToUser` int DEFAULT NULL,
  `IsDeleted` bit(1) NOT NULL,
  PRIMARY KEY (`ContactUsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactus`
--

LOCK TABLES `contactus` WRITE;
/*!40000 ALTER TABLE `contactus` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactusattachment`
--

DROP TABLE IF EXISTS `contactusattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactusattachment` (
  `ContactUsAttachmentId` int NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FileName` varbinary(500) NOT NULL,
  PRIMARY KEY (`ContactUsAttachmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactusattachment`
--

LOCK TABLES `contactusattachment` WRITE;
/*!40000 ALTER TABLE `contactusattachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactusattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favoriteandblocked`
--

DROP TABLE IF EXISTS `favoriteandblocked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favoriteandblocked` (
  `Id` int NOT NULL,
  `UserId` int NOT NULL,
  `TargetUserId` int NOT NULL,
  `IsFavorite` bit(1) NOT NULL,
  `IsBlocked` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `favblock_userid_idx` (`UserId`),
  KEY `favblock_targetuserid_idx` (`TargetUserId`),
  CONSTRAINT `favblock_targetuserid` FOREIGN KEY (`TargetUserId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `favblock_userid` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favoriteandblocked`
--

LOCK TABLES `favoriteandblocked` WRITE;
/*!40000 ALTER TABLE `favoriteandblocked` DISABLE KEYS */;
/*!40000 ALTER TABLE `favoriteandblocked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `RatingId` int NOT NULL,
  `ServiceRequestId` int NOT NULL,
  `RatingFrom` int NOT NULL,
  `RatingTo` int NOT NULL,
  `Ratings` decimal(5,0) NOT NULL,
  `Comments` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RatingDate` datetime NOT NULL,
  `IsApproved` bit(1) DEFAULT NULL,
  `VisibleOnHomeScreen` bit(1) NOT NULL,
  `OnTimeArrival` decimal(5,0) NOT NULL,
  `Friendly` decimal(5,0) NOT NULL,
  `QualityOfService` decimal(5,0) NOT NULL,
  PRIMARY KEY (`RatingId`),
  KEY `rating_srid_idx` (`ServiceRequestId`),
  KEY `rating_from_idx` (`RatingFrom`),
  KEY `rating_to_idx` (`RatingTo`),
  CONSTRAINT `rating_from` FOREIGN KEY (`RatingFrom`) REFERENCES `user` (`UserId`),
  CONSTRAINT `rating_srid` FOREIGN KEY (`ServiceRequestId`) REFERENCES `servicerequest` (`ServiceRequestId`),
  CONSTRAINT `rating_to` FOREIGN KEY (`RatingTo`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicerequest`
--

DROP TABLE IF EXISTS `servicerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicerequest` (
  `ServiceRequestId` int NOT NULL,
  `UserId` int NOT NULL,
  `ServiceId` int NOT NULL,
  `ServiceStartDate` datetime NOT NULL,
  `ZipCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ServiceFrequency` tinyint DEFAULT NULL,
  `ServiceHourlyRate` decimal(5,0) DEFAULT NULL,
  `ServiceHours` float NOT NULL,
  `ExtraHours` float DEFAULT NULL,
  `SubTotal` decimal(5,0) NOT NULL,
  `Discount` decimal(5,0) DEFAULT NULL,
  `TotalCost` decimal(5,0) NOT NULL,
  `Comments` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PaymentTransactionRefNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PaymentDue` bit(1) NOT NULL,
  `JobStatus` tinyint DEFAULT NULL,
  `ServiceProviderId` int DEFAULT NULL,
  `SPAcceptedDate` datetime DEFAULT NULL,
  `HasPets` bit(1) NOT NULL,
  `Status` int DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `ModifiedDate` datetime NOT NULL,
  `ModifiedBy` int DEFAULT NULL,
  `RefundedAmount` decimal(5,0) DEFAULT NULL,
  `Distance` decimal(9,0) NOT NULL,
  `HasIssue` bit(1) DEFAULT NULL,
  `PaymentDone` bit(1) DEFAULT NULL,
  `RecordVersion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ServiceRequestId`),
  KEY `sr_userid_idx` (`UserId`),
  KEY `sr_serviceproviderid_idx` (`ServiceProviderId`),
  CONSTRAINT `sr_serviceproviderid` FOREIGN KEY (`ServiceProviderId`) REFERENCES `user` (`UserId`),
  CONSTRAINT `sr_userid` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicerequest`
--

LOCK TABLES `servicerequest` WRITE;
/*!40000 ALTER TABLE `servicerequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicerequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicerequestaddress`
--

DROP TABLE IF EXISTS `servicerequestaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicerequestaddress` (
  `Id` int NOT NULL,
  `ServiceRequestId` int DEFAULT NULL,
  `AddressLine1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `AddressLine2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `State` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PostalCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Type` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `sra_srid_idx` (`ServiceRequestId`),
  CONSTRAINT `sra_srid` FOREIGN KEY (`ServiceRequestId`) REFERENCES `servicerequest` (`ServiceRequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicerequestaddress`
--

LOCK TABLES `servicerequestaddress` WRITE;
/*!40000 ALTER TABLE `servicerequestaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicerequestaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicerequestextra`
--

DROP TABLE IF EXISTS `servicerequestextra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicerequestextra` (
  `ServiceRequestExtraId` int NOT NULL,
  `ServiceRequestId` int NOT NULL,
  `ServiceExtraId` int NOT NULL,
  PRIMARY KEY (`ServiceRequestExtraId`),
  KEY `sre_srid_idx` (`ServiceRequestId`),
  CONSTRAINT `sre_srid` FOREIGN KEY (`ServiceRequestId`) REFERENCES `servicerequest` (`ServiceRequestId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicerequestextra`
--

LOCK TABLES `servicerequestextra` WRITE;
/*!40000 ALTER TABLE `servicerequestextra` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicerequestextra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicesetting`
--

DROP TABLE IF EXISTS `servicesetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicesetting` (
  `Id` int NOT NULL,
  `ActionType` int NOT NULL,
  `Interval` int NOT NULL,
  `ScheduleTime` time NOT NULL,
  `LastPoll` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicesetting`
--

LOCK TABLES `servicesetting` WRITE;
/*!40000 ALTER TABLE `servicesetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicesetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `Id` int NOT NULL,
  `StateName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sysdiagrams`
--

DROP TABLE IF EXISTS `sysdiagrams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sysdiagrams` (
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `principal_id` int NOT NULL,
  `diagram_id` int NOT NULL,
  `version` int DEFAULT NULL,
  `definition` varbinary(50) DEFAULT NULL,
  PRIMARY KEY (`diagram_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sysdiagrams`
--

LOCK TABLES `sysdiagrams` WRITE;
/*!40000 ALTER TABLE `sysdiagrams` DISABLE KEYS */;
/*!40000 ALTER TABLE `sysdiagrams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserId` int NOT NULL,
  `FirstName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LastName` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserTypeId` int NOT NULL,
  `RoleId` int DEFAULT NULL,
  `Gender` int DEFAULT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `WebSite` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UserProfilePicture` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IsRegisteredUser` bit(1) NOT NULL,
  `PaymentGatewayUserRef` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ZipCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WorksWithPets` bit(1) NOT NULL,
  `LanguageId` int DEFAULT NULL,
  `NationalityId` int DEFAULT NULL,
  `ResetKey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `ModifiedDate` datetime NOT NULL,
  `ModifiedBy` int NOT NULL,
  `IsApproved` bit(1) NOT NULL,
  `IsActive` bit(1) NOT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Status` int DEFAULT NULL,
  `IsOnline` bit(1) NOT NULL,
  `BankTokenId` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `TaxNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraddress`
--

DROP TABLE IF EXISTS `useraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useraddress` (
  `AddressId` int NOT NULL,
  `UserId` int NOT NULL,
  `AddressLine1` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AddressLine2` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `State` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PostalCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IsDefault` bit(1) NOT NULL,
  `IsDeleted` bit(1) NOT NULL,
  `Mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Type` int DEFAULT NULL,
  PRIMARY KEY (`AddressId`),
  KEY `ua_userid_idx` (`UserId`),
  CONSTRAINT `ua_userid` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraddress`
--

LOCK TABLES `useraddress` WRITE;
/*!40000 ALTER TABLE `useraddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `useraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zipcode`
--

DROP TABLE IF EXISTS `zipcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zipcode` (
  `Id` int NOT NULL,
  `ZipcodeValue` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CityId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `zc_cityid_idx` (`CityId`),
  CONSTRAINT `zc_cityid` FOREIGN KEY (`CityId`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zipcode`
--

LOCK TABLES `zipcode` WRITE;
/*!40000 ALTER TABLE `zipcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `zipcode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-27 16:18:02
