CREATE DATABASE  IF NOT EXISTS `students_affairs_sys` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `students_affairs_sys`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: students_affairs_sys
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement` (
  `id_advertisement` int NOT NULL,
  `advertisement_name` varchar(45) NOT NULL,
  `id_management` int NOT NULL,
  PRIMARY KEY (`id_advertisement`),
  KEY `id_management` (`id_management`),
  CONSTRAINT `advertisement_ibfk_1` FOREIGN KEY (`id_management`) REFERENCES `management` (`id_management`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
INSERT INTO `advertisement` VALUES (1,'ppppp',1);
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_grades`
--

DROP TABLE IF EXISTS `course_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_grades` (
  `course_grades_id` int NOT NULL,
  `total_grade` int DEFAULT NULL,
  `grade_rating` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`course_grades_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_grades`
--

LOCK TABLES `course_grades` WRITE;
/*!40000 ALTER TABLE `course_grades` DISABLE KEYS */;
INSERT INTO `course_grades` VALUES (11,55,'good');
/*!40000 ALTER TABLE `course_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_total_grade`
--

DROP TABLE IF EXISTS `course_total_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_total_grade` (
  `midterm` int NOT NULL,
  `oral` int NOT NULL,
  `practical` int NOT NULL,
  `final` int NOT NULL,
  `total_grade_id` int NOT NULL,
  PRIMARY KEY (`total_grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_total_grade`
--

LOCK TABLES `course_total_grade` WRITE;
/*!40000 ALTER TABLE `course_total_grade` DISABLE KEYS */;
INSERT INTO `course_total_grade` VALUES (20,10,20,50,100);
/*!40000 ALTER TABLE `course_total_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id-courses` int NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `total_grade_id` int NOT NULL,
  `id_surveys` int DEFAULT NULL,
  `id_staff` int DEFAULT NULL,
  `id_student` int DEFAULT NULL,
  `id_desires` int DEFAULT NULL,
  PRIMARY KEY (`id-courses`),
  KEY `total_grade_id` (`total_grade_id`),
  KEY `id_student` (`id_student`),
  KEY `id_staff` (`id_staff`),
  KEY `id_surveys` (`id_surveys`),
  KEY `id_desires` (`id_desires`),
  CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`total_grade_id`) REFERENCES `course_total_grade` (`total_grade_id`),
  CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`),
  CONSTRAINT `courses_ibfk_3` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`),
  CONSTRAINT `courses_ibfk_4` FOREIGN KEY (`id_surveys`) REFERENCES `surveys` (`id_surveys`),
  CONSTRAINT `courses_ibfk_5` FOREIGN KEY (`id_desires`) REFERENCES `desires` (`id_desires`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'hhh',100,1,1,1,1);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desires`
--

DROP TABLE IF EXISTS `desires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `desires` (
  `id_desires` int NOT NULL,
  `dept_name` varchar(45) DEFAULT NULL,
  `id_course` int DEFAULT NULL,
  `id_student` int DEFAULT NULL,
  PRIMARY KEY (`id_desires`),
  KEY `id_staff` (`id_course`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `desires_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `staff` (`id_staff`),
  CONSTRAINT `desires_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desires`
--

LOCK TABLES `desires` WRITE;
/*!40000 ALTER TABLE `desires` DISABLE KEYS */;
INSERT INTO `desires` VALUES (1,'ddd',1,1);
/*!40000 ALTER TABLE `desires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `id_exams` int NOT NULL,
  `date` date NOT NULL,
  `exam` varchar(45) NOT NULL,
  `seating_number` int NOT NULL,
  `id_staff` int NOT NULL,
  `id_result` int NOT NULL,
  PRIMARY KEY (`id_exams`),
  KEY `id_staff` (`id_staff`),
  KEY `id_result` (`id_result`),
  CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`),
  CONSTRAINT `exams_ibfk_2` FOREIGN KEY (`id_result`) REFERENCES `result` (`id_result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (1,'2022-05-05','dsv',5,1,1);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `id_management` int NOT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `SSN` int DEFAULT NULL,
  `password` int DEFAULT NULL,
  `name_id` int DEFAULT NULL,
  PRIMARY KEY (`id_management`),
  KEY `name_id` (`name_id`),
  CONSTRAINT `management_ibfk_1` FOREIGN KEY (`name_id`) REFERENCES `management_name` (`name_id`),
  CONSTRAINT `management_ibfk_2` FOREIGN KEY (`name_id`) REFERENCES `management_name` (`name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES (1,'male','ak',123456,789,100);
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_address`
--

DROP TABLE IF EXISTS `management_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_address` (
  `address` varchar(100) NOT NULL,
  `id_management` int NOT NULL,
  PRIMARY KEY (`address`,`id_management`),
  KEY `id_management` (`id_management`),
  CONSTRAINT `management_address_ibfk_1` FOREIGN KEY (`id_management`) REFERENCES `management` (`id_management`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_address`
--

LOCK TABLES `management_address` WRITE;
/*!40000 ALTER TABLE `management_address` DISABLE KEYS */;
INSERT INTO `management_address` VALUES ('domyat',1),('sananya',1);
/*!40000 ALTER TABLE `management_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `management_name`
--

DROP TABLE IF EXISTS `management_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management_name` (
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `name_id` int NOT NULL,
  PRIMARY KEY (`name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management_name`
--

LOCK TABLES `management_name` WRITE;
/*!40000 ALTER TABLE `management_name` DISABLE KEYS */;
INSERT INTO `management_name` VALUES ('ahmed','khaled','abdo',100);
/*!40000 ALTER TABLE `management_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id_permissions` int NOT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `id_student` int NOT NULL,
  `id_staff` int NOT NULL,
  `id_management` int NOT NULL,
  PRIMARY KEY (`id_permissions`),
  KEY `id_student` (`id_student`),
  KEY `id_staff` (`id_staff`),
  KEY `id_management` (`id_management`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`),
  CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`),
  CONSTRAINT `permissions_ibfk_3` FOREIGN KEY (`id_management`) REFERENCES `management` (`id_management`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'hh',1,1,1);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `phone` int NOT NULL,
  `id_management` int NOT NULL,
  PRIMARY KEY (`id_management`,`phone`),
  CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`id_management`) REFERENCES `management` (`id_management`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (10,1),(11,1),(12,1);
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `id_result` int NOT NULL,
  `course_grades_id` int DEFAULT NULL,
  `id_student` int DEFAULT NULL,
  `id_staff` int DEFAULT NULL,
  PRIMARY KEY (`id_result`),
  KEY `course_grades_id` (`course_grades_id`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`course_grades_id`) REFERENCES `course_grades` (`course_grades_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,11,1,1);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id_staff` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` int NOT NULL,
  `position` varchar(45) NOT NULL,
  `degree` varchar(45) NOT NULL,
  `SSN` int NOT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `name_id` int NOT NULL,
  PRIMARY KEY (`id_staff`),
  KEY `name_id` (`name_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`name_id`) REFERENCES `staff_name` (`name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'rrr',123,'ppp','good',3010,'male',50);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_address`
--

DROP TABLE IF EXISTS `staff_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_address` (
  `address` varchar(100) NOT NULL,
  `id_staff` int NOT NULL,
  PRIMARY KEY (`id_staff`,`address`),
  CONSTRAINT `staff_address_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_address`
--

LOCK TABLES `staff_address` WRITE;
/*!40000 ALTER TABLE `staff_address` DISABLE KEYS */;
INSERT INTO `staff_address` VALUES ('oooo',1),('pppp',1);
/*!40000 ALTER TABLE `staff_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_complaints`
--

DROP TABLE IF EXISTS `staff_complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_complaints` (
  `id_staff_complaints` int NOT NULL,
  `complaint` varchar(45) NOT NULL,
  `id_management` int NOT NULL,
  `id_staff` int NOT NULL,
  PRIMARY KEY (`id_staff_complaints`),
  KEY `id_management` (`id_management`),
  KEY `id_staff` (`id_staff`),
  CONSTRAINT `staff_complaints_ibfk_1` FOREIGN KEY (`id_management`) REFERENCES `management` (`id_management`),
  CONSTRAINT `staff_complaints_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_complaints`
--

LOCK TABLES `staff_complaints` WRITE;
/*!40000 ALTER TABLE `staff_complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_name`
--

DROP TABLE IF EXISTS `staff_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_name` (
  `fname` varchar(50) DEFAULT NULL,
  `mname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `name_id` int NOT NULL,
  PRIMARY KEY (`name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_name`
--

LOCK TABLES `staff_name` WRITE;
/*!40000 ALTER TABLE `staff_name` DISABLE KEYS */;
INSERT INTO `staff_name` VALUES ('aa','bb','cc',50);
/*!40000 ALTER TABLE `staff_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_phone`
--

DROP TABLE IF EXISTS `staff_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_phone` (
  `phone` int NOT NULL,
  `id_staff` int NOT NULL,
  PRIMARY KEY (`phone`,`id_staff`),
  KEY `id_staff` (`id_staff`),
  CONSTRAINT `staff_phone_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_phone`
--

LOCK TABLES `staff_phone` WRITE;
/*!40000 ALTER TABLE `staff_phone` DISABLE KEYS */;
INSERT INTO `staff_phone` VALUES (12,1),(100,1);
/*!40000 ALTER TABLE `staff_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id_student` int NOT NULL,
  `level` int NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` int NOT NULL,
  `SSN` int NOT NULL,
  `qualification_id` int NOT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `name_id` int NOT NULL,
  PRIMARY KEY (`id_student`),
  KEY `name_id` (`name_id`),
  KEY `qualification_id` (`qualification_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`name_id`) REFERENCES `student_name` (`name_id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`qualification_id`) REFERENCES `student_qualification` (`qualification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,3,'mn',785,3011,11,'male',60);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_address`
--

DROP TABLE IF EXISTS `student_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_address` (
  `address` varchar(100) NOT NULL,
  `id_student` int NOT NULL,
  PRIMARY KEY (`address`,`id_student`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `student_address_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_address`
--

LOCK TABLES `student_address` WRITE;
/*!40000 ALTER TABLE `student_address` DISABLE KEYS */;
INSERT INTO `student_address` VALUES ('qqqq',1),('rrrr',1);
/*!40000 ALTER TABLE `student_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_complaints`
--

DROP TABLE IF EXISTS `student_complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_complaints` (
  `id_student_complaints` int NOT NULL,
  `complaint` varchar(45) DEFAULT NULL,
  `id_student` int DEFAULT NULL,
  `id_staff` int DEFAULT NULL,
  PRIMARY KEY (`id_student_complaints`),
  KEY `id_student` (`id_student`),
  KEY `id_staff` (`id_staff`),
  CONSTRAINT `student_complaints_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`),
  CONSTRAINT `student_complaints_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_complaints`
--

LOCK TABLES `student_complaints` WRITE;
/*!40000 ALTER TABLE `student_complaints` DISABLE KEYS */;
INSERT INTO `student_complaints` VALUES (1,'ggg',1,1);
/*!40000 ALTER TABLE `student_complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_name`
--

DROP TABLE IF EXISTS `student_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_name` (
  `fname` varchar(45) NOT NULL,
  `mname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `name_id` int NOT NULL,
  PRIMARY KEY (`name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_name`
--

LOCK TABLES `student_name` WRITE;
/*!40000 ALTER TABLE `student_name` DISABLE KEYS */;
INSERT INTO `student_name` VALUES ('mo','salah','mm',60);
/*!40000 ALTER TABLE `student_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_phone`
--

DROP TABLE IF EXISTS `student_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_phone` (
  `phone` int NOT NULL,
  `id_student` int NOT NULL,
  PRIMARY KEY (`phone`,`id_student`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `student_phone_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_phone`
--

LOCK TABLES `student_phone` WRITE;
/*!40000 ALTER TABLE `student_phone` DISABLE KEYS */;
INSERT INTO `student_phone` VALUES (10,1),(12,1);
/*!40000 ALTER TABLE `student_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_qualification`
--

DROP TABLE IF EXISTS `student_qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_qualification` (
  `school` varchar(45) NOT NULL,
  `GPA` int NOT NULL,
  `qualification_id` int NOT NULL,
  PRIMARY KEY (`qualification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_qualification`
--

LOCK TABLES `student_qualification` WRITE;
/*!40000 ALTER TABLE `student_qualification` DISABLE KEYS */;
INSERT INTO `student_qualification` VALUES ('mmm',3,11);
/*!40000 ALTER TABLE `student_qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveys`
--

DROP TABLE IF EXISTS `surveys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surveys` (
  `id_surveys` int NOT NULL,
  `survey_name` varchar(45) NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  `questions` varchar(45) DEFAULT NULL,
  `id_student` int DEFAULT NULL,
  `id_staff` int DEFAULT NULL,
  PRIMARY KEY (`id_surveys`),
  KEY `id_staff` (`id_staff`),
  KEY `id_student` (`id_student`),
  CONSTRAINT `surveys_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`id_staff`),
  CONSTRAINT `surveys_ibfk_2` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveys`
--

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;
INSERT INTO `surveys` VALUES (1,'ssss','sssssss','aaaaa',1,1);
/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-04  9:15:48
