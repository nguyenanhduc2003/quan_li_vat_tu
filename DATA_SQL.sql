USE quanlivattu;

-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jp24002_data
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `tblaccount`
--
DROP TABLE IF EXISTS `tblaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblaccount` (
	`account_id` int unsigned NOT NULL AUTO_INCREMENT,
    `account_name` varchar(50) NOT NULL COMMENT 'Ten nguoi dung',
    `account_email` varchar(50) NOT NULL UNIQUE COMMENT 'Dia chi email',
    `account_pass` varchar(50) NOT NULL COMMENT 'Mat khau',
    `account_phone` varchar(50) DEFAULT NULL COMMENT 'So dien thoai',
    `account_address` varchar(255) DEFAULT NULL COMMENT 'Dia chi',
    `account_birthday` varchar(50) DEFAULT NULL COMMENT 'Ngay sinh',
    `account_created_date` varchar(50) NOT NULL COMMENT 'Ngay tao tai khoan',
    `account_role` ENUM('user', 'admin') DEFAULT 'user' COMMENT 'Vai tro',
    PRIMARY KEY(`account_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaccount`
--

LOCK TABLES `tblaccount` WRITE;
/*!40000 ALTER TABLE `tblaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaccount` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `tblmaterial`
--
DROP TABLE IF EXISTS `tblmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmaterial` (
	`material_id` int unsigned NOT NULL AUTO_INCREMENT,
    `material_name` varchar(255) NOT NULL COMMENT 'Tên vật tư',
    `material_describe` text COMMENT 'Mo ta',
    `material_unit` varchar(50) DEFAULT NULL COMMENT 'Don vi tinh',
    `material_date` varchar(50) NOT NULL COMMENT 'Ngay san xuat',
    `material_expiry` varchar(50) NOT NULL COMMENT 'Han su dung',
    `material_use` text COMMENT 'Cach su dung',
    `material_supplier` varchar(255) NOT NULL COMMENT 'Nha cung cap',
    `material_country` varchar(100) NOT NULL COMMENT 'Quoc gia san xuat',
    `material_value` decimal(10, 2) NOT NULL COMMENT 'Gia tien',
    `material_image` varchar(255) DEFAULT NULL COMMENT 'Hinh anh',   
    PRIMARY KEY(`material_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmaterial`
--

LOCK TABLES `tblmaterial` WRITE;
/*!40000 ALTER TABLE `tblmaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblmaterial` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `tblwarehouse`
--
DROP TABLE IF EXISTS `tblwarehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblwarehouse` (
	  `warehouse_id` int unsigned NOT NULL AUTO_INCREMENT,
      `material_id` int unsigned NOT NULL,
      `warehouse_name` varchar(50) NOT NULL COMMENT 'Ten vat tu',
      `warehouse_supplier` varchar(255) NOT NULL COMMENT 'Nha cung cap',
      `warehouse_quantity` int unsigned NOT NULL COMMENT 'So luong',
		PRIMARY KEY(`warehouse_id`),
		CONSTRAINT `fk_material`
		FOREIGN KEY (`material_id`)
		REFERENCES `tblmaterial`(`material_id`)
		ON DELETE CASCADE 
		ON UPDATE CASCADE 
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwarehouse`
--

LOCK TABLES `tblwarehouse` WRITE;
/*!40000 ALTER TABLE `tblwarehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwarehouse` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `tblrequest`
--
DROP TABLE IF EXISTS `tblrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblrequest` (
	`request_id` int unsigned NOT NULL AUTO_INCREMENT,
    `request_name` varchar(50) NOT NULL COMMENT 'Ho va ten',
    `request_email` varchar(50) NOT NULL COMMENT 'Email',
    `request_phone` varchar(50) NOT NULL COMMENT 'So dien thoai',
    `request_date` varchar(50) NOT NULL COMMENT 'Ngay yeu cau',
    `request_materialname` varchar(50) NOT NULL COMMENT 'Ten vat tu',
    `request_quantity` int unsigned NOT NULL COMMENT 'So luong',
    `request_reason` text COMMENT 'Ly do',
    `request_note` text COMMENT 'Ghi chu',
    `request_status` varchar(50) NOT NULL COMMENT 'Trang thai',
    PRIMARY KEY (`request_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrequest`
--

LOCK TABLES `tblrequest` WRITE;
/*!40000 ALTER TABLE `tblrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblrequest` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `tblsupplier`
--
DROP TABLE IF EXISTS `tblsupplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsupplier` (
	`supplier_id` int unsigned NOT NULL AUTO_INCREMENT,
    `supplier_name` varchar(255) NOT NULL COMMENT 'Ten nha cung cap',
    `supplier_email` varchar(50) NOT NULL COMMENT 'Dia chi email',
    `supplier_phone` varchar(50) NOT NULL COMMENT 'So dien thoai',
    `supplier_address` varchar(255) NOT NULL COMMENT 'Dia chi',
    `supplier_website` varchar(255) DEFAULT NULL COMMENT 'Dia chi website',
    `supplier_describe` text COMMENT 'Mo ta',
    `supplier_date_created` varchar(50) NOT NULL COMMENT 'Ngay tao',
    PRIMARY KEY (`supplier_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsupplier`
--

LOCK TABLES `tblsupplier` WRITE;
/*!40000 ALTER TABLE `tblsupplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsupplier` ENABLE KEYS */;
UNLOCK TABLES;