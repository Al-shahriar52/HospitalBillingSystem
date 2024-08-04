-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: billingsystem
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user`
(
    `id`              bigint       NOT NULL AUTO_INCREMENT,
    `address`         varchar(255) NOT NULL,
    `age`             int          NOT NULL,
    `email`           varchar(255) DEFAULT NULL,
    `gender`          varchar(255) DEFAULT NULL,
    `name`            varchar(255) DEFAULT NULL,
    `password`        varchar(255) DEFAULT NULL,
    `phone`           varchar(255) DEFAULT NULL,
    `organization_id` bigint       DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_1j9d9a06i600gd43uu3km82jw` (`email`),
    UNIQUE KEY `UK_exslcon9jmfy0xhclbtpf26vo` (`phone`),
    KEY `FKfl8n74ioc02b9cpjqdlpi0m9f` (`organization_id`),
    CONSTRAINT `FKfl8n74ioc02b9cpjqdlpi0m9f` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user`
    DISABLE KEYS */;
INSERT INTO `app_user`
VALUES (1, 'Panthapath', 30, 'admin@gmail.com', 'MALE', 'Aothoi', '12345678', '01445678903', 1),
       (2, 'Mdpur', 25, 'orgAdmin@gmail.com', 'MALE', 'Paula', '12345678', '01745678790', 2),
       (3, 'Mirpur', 35, 'drUser@gmail.com', 'FEMALE', 'Avijita', 'Dr12345678$', '01546576890', 2),
       (4, 'Bashundhara', 24, 'diagUser@gmail.com', 'FEMALE', 'Moushumi Khanom', '12345678', '01645678908', 2),
       (5, 'Old Dhaka', 40, 'pharmaUser@gmail.com', 'MALE', 'Shahriar', '12345678', '01745678986', 2),
       (6, 'Mirpur, Dhaka', 29, 'khatun@yahoo.com', 'FEMALE', 'Rahima Khatun', '12345678', '01845678676', 2),
       (7, 'Bashundhara, Dhaka', 34, 'belal@gmail.com', 'MALE', 'Md Belal Hossain', '12345678', '01645789076', 3),
       (8, 'Mohakhali, Dhaka', 36, 'karim@yahoo.com', 'MALE', 'Karim Mia', 'Or123456$', '01756466855', 3),
       (9, 'Bashundhara, Dhaka', 29, 'ali@gmail.com', 'FEMALE', 'Salma Khatun', '12345678', '01975467847', 3),
       (10, 'Bashundhara, Dhaka', 29, 'salma@gmail.com', 'FEMALE', 'Salma Akhter', '12345678', '01967896457', 2),
       (11, 'Mirpur, Dhaka', 28, 'abdul@gmail.com', 'MALE', 'Abdul Kader', '12345678', '01376554698', 3),
       (12, 'Mirpur, Dhaka', 27, 'diagUser3@gmail.com', 'MALE', 'Kamal Hossain', '12345678', '01898755857', 3),
       (13, 'Dhaka', 23, 'multiRole@hotmail.com', 'MALE', 'Abdul Hamid', '12345678', '01897648953', 2),
       (14, '50 Mohakali', 35, 'abc@gmail.com', 'MALE', 'Md Hasan', '123456789', '01825711945', 2),
       (15, 'Mohakhali, Dhaka', 35, 'jaman@gmail.com', 'MALE', 'Nurul Jaman', 'Diag123$', '01567548395', 2),
       (16, 'Agargaon, Dhaka', 25, 'hamidur@gmail.com', 'MALE', 'Hamidur Rahman', 'Or12345$', '01875548975', 8);
/*!40000 ALTER TABLE `app_user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_role`
--

DROP TABLE IF EXISTS `app_user_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user_role`
(
    `app_user_id` bigint NOT NULL,
    `role`        varchar(255) DEFAULT NULL,
    KEY `FK11mbw51w6otlim6pw3jl44sjr` (`app_user_id`),
    CONSTRAINT `FK11mbw51w6otlim6pw3jl44sjr` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_role`
--

LOCK TABLES `app_user_role` WRITE;
/*!40000 ALTER TABLE `app_user_role`
    DISABLE KEYS */;
INSERT INTO `app_user_role`
VALUES (1, 'ROLE_ADMIN'),
       (4, 'ROLE_DIAGNOSTIC_RECEPTIONIST'),
       (5, 'ROLE_PHARMACIST'),
       (6, 'ROLE_DOCTOR_RECEPTIONIST'),
       (7, 'ROLE_ORG_ADMIN'),
       (9, 'ROLE_DIAGNOSTIC_RECEPTIONIST'),
       (10, 'ROLE_PHARMACIST'),
       (2, 'ROLE_ORG_ADMIN'),
       (11, 'ROLE_ORG_ADMIN'),
       (12, 'ROLE_DIAGNOSTIC_RECEPTIONIST'),
       (13, 'ROLE_DOCTOR_RECEPTIONIST'),
       (14, 'ROLE_ORG_ADMIN'),
       (16, 'ROLE_ORG_ADMIN'),
       (3, 'ROLE_DOCTOR_RECEPTIONIST'),
       (15, 'ROLE_PHARMACIST'),
       (8, 'ROLE_ORG_ADMIN');
/*!40000 ALTER TABLE `app_user_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_history`
--

DROP TABLE IF EXISTS `billing_history`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_history`
(
    `id`           bigint NOT NULL AUTO_INCREMENT,
    `invoice_id`   bigint      DEFAULT NULL,
    `service_type` int         DEFAULT NULL,
    `time`         datetime(6) DEFAULT NULL,
    `total_amount` double NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_history`
--

LOCK TABLES `billing_history` WRITE;
/*!40000 ALTER TABLE `billing_history`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_history`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostic`
--

DROP TABLE IF EXISTS `diagnostic`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic`
(
    `id`           bigint NOT NULL AUTO_INCREMENT,
    `service_name` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK80aq0g7qmfl1qrglegym6bfdt` (`service_name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostic`
--

LOCK TABLES `diagnostic` WRITE;
/*!40000 ALTER TABLE `diagnostic`
    DISABLE KEYS */;
INSERT INTO `diagnostic`
VALUES (13, 'Angiocardiography'),
       (16, 'Biopsy'),
       (4, 'Blood Test'),
       (14, 'Brain Scanning'),
       (1, 'CBC'),
       (7, 'Diabetes Test'),
       (18, 'Enzyme Analysis'),
       (19, 'Glucose '),
       (8, 'Glucose Tolerance'),
       (9, 'Inulin Clearance'),
       (10, 'Lumbar Puncture'),
       (6, 'MRI'),
       (17, 'Rubin’s Test'),
       (11, 'Thoracentesis'),
       (15, 'Tomography'),
       (12, 'Toxicology Test'),
       (3, 'Ultrasonography'),
       (5, 'Urine Analysis'),
       (2, 'X-Ray');
/*!40000 ALTER TABLE `diagnostic`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostic_bill`
--

DROP TABLE IF EXISTS `diagnostic_bill`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic_bill`
(
    `id`                                  bigint  NOT NULL AUTO_INCREMENT,
    `final_fee_after_all_discount`        double  NOT NULL,
    `overall_discount`                    tinyint NOT NULL,
    `timestamp`                           datetime(6) DEFAULT NULL,
    `total_fee_after_individual_discount` double  NOT NULL,
    `total_fee_without_any_discount`      double  NOT NULL,
    `app_user_id`                         bigint      DEFAULT NULL,
    `organization_id`                     bigint      DEFAULT NULL,
    `patient_id`                          bigint      DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FKb4f4peohe2pdoadnr717d78gm` (`app_user_id`),
    KEY `FK5ux5yofjhb44r49mtikk5evy0` (`organization_id`),
    KEY `FKpt863rimbvkjopgvdpwjle12f` (`patient_id`),
    CONSTRAINT `FK5ux5yofjhb44r49mtikk5evy0` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
    CONSTRAINT `FKb4f4peohe2pdoadnr717d78gm` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`),
    CONSTRAINT `FKpt863rimbvkjopgvdpwjle12f` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostic_bill`
--

LOCK TABLES `diagnostic_bill` WRITE;
/*!40000 ALTER TABLE `diagnostic_bill`
    DISABLE KEYS */;
INSERT INTO `diagnostic_bill`
VALUES (1, 270.75, 5, '2023-04-29 22:02:28.898202', 285, 10, 4, 2, 4),
       (2, 465.5, 5, '2023-04-29 22:13:56.818381', 490, 10, 4, 2, 3),
       (3, 372.4, 5, '2023-04-30 12:00:06.162319', 392, 400, 4, 2, 4),
       (4, 200, 0, '2023-05-02 04:50:50.119191', 200, 200, 4, 2, 3),
       (5, 199.5, 5, '2023-05-02 13:35:10.581888', 200, 200, 12, 3, 14),
       (6, 789.3375, 3, '2023-05-03 11:17:32.464480', 775, 800, 4, 2, 23),
       (7, 472.5, 10, '2023-05-03 17:12:39.222367', 500, 500, 4, 2, 3),
       (8, 548.1, 10, '2023-05-03 17:14:16.704825', 580, 600, 4, 2, 14);
/*!40000 ALTER TABLE `diagnostic_bill`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostic_bill_org_diagnostic_and_discounts`
--

DROP TABLE IF EXISTS `diagnostic_bill_org_diagnostic_and_discounts`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnostic_bill_org_diagnostic_and_discounts`
(
    `diagnostic_bill_id`              bigint NOT NULL,
    `org_diagnostic_and_discounts_id` bigint NOT NULL,
    UNIQUE KEY `UK_3a935lrhv77end05rfdbisx2v` (`org_diagnostic_and_discounts_id`),
    KEY `FKna5qkfeca432k157mo8xuas4s` (`diagnostic_bill_id`),
    CONSTRAINT `FK2tpjp69yvrooecwe7b979yk8q` FOREIGN KEY (`org_diagnostic_and_discounts_id`) REFERENCES `org_diagnostic_and_discount` (`id`),
    CONSTRAINT `FKna5qkfeca432k157mo8xuas4s` FOREIGN KEY (`diagnostic_bill_id`) REFERENCES `diagnostic_bill` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostic_bill_org_diagnostic_and_discounts`
--

LOCK TABLES `diagnostic_bill_org_diagnostic_and_discounts` WRITE;
/*!40000 ALTER TABLE `diagnostic_bill_org_diagnostic_and_discounts`
    DISABLE KEYS */;
INSERT INTO `diagnostic_bill_org_diagnostic_and_discounts`
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (6, 7),
       (7, 8),
       (7, 9),
       (8, 10),
       (8, 11);
/*!40000 ALTER TABLE `diagnostic_bill_org_diagnostic_and_discounts`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor`
(
    `id`          bigint NOT NULL AUTO_INCREMENT,
    `bmdc`        bigint NOT NULL,
    `doctor_type` varchar(255) DEFAULT NULL,
    `email`       varchar(255) DEFAULT NULL,
    `gender`      varchar(255) DEFAULT NULL,
    `name`        varchar(255) DEFAULT NULL,
    `phone`       varchar(255) DEFAULT NULL,
    `app_user_id` bigint       DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_jdtgexk368pq6d2yb3neec59d` (`email`),
    UNIQUE KEY `UK_2ow2k8dbvtnp7wfc8ywo8fg2e` (`phone`),
    KEY `FK3ukq25v8pkoatpy6a47lucuk4` (`app_user_id`),
    CONSTRAINT `FK3ukq25v8pkoatpy6a47lucuk4` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor`
    DISABLE KEYS */;
INSERT INTO `doctor`
VALUES (1, 123122, 'MEDICAL', 'a.paul@gmail.com', 'MALE', 'Avijit Paul', '01645678970', 1),
       (2, 123122, 'DENTAL', 'shah@gmail.com', 'MALE', 'Al Shahriar', '01845678903', 1),
       (3, 123122, 'MEDICAL', 'sadat@gmail.com', 'FEMALE', 'Sadat Aothoi', '01711347300', 1),
       (4, 346436, 'DENTAL', 'rahim@gmail.com', 'MALE', 'Md Rahim Ahmed', '01745678772', 1),
       (5, 536546, 'MEDICAL', 'bashar@gmail.com', 'MALE', 'Abul Bashar', '01546789085', 1),
       (6, 123121, 'MEDICAL', 'shahriar@gmail.com', 'MALE', 'Fahim Shahriar', '01710000005', 1),
       (7, 56874, 'MEDICAL', 'wadud@bsh.info', 'MALE', 'Wadud Chowdhury', '01767884597', 1),
       (8, 32584, 'MEDICAL', 'jahangir@united.com', 'MALE', 'Jahangir Hossain', '01987568745', 1),
       (9, 123548, 'MEDICAL', 'samin@dmc.com', 'MALE', 'Samin Ahsan', '01865756985', 1),
       (10, 235795, 'DENTAL', 'sana@gmail.com', 'FEMALE', 'Marium Islam', '01456854698', 1),
       (11, 789456, 'MEDICAL', 'wick@gmail.com', 'MALE', 'John Wick', '01687558420', 1),
       (12, 456545, 'MEDICAL', 'nabila@gmail.com', 'FEMALE', 'Nabila Nahar', '01864568254', 1),
       (13, 1010, 'MEDICAL', 'ashik@gmail.com', 'MALE', 'Md Ashik.', '01825711956', 1),
       (14, 678564, 'MEDICAL', 'mannan@yahoo.com', 'MALE', 'Manna Rahman', '01654327191', 1);
/*!40000 ALTER TABLE `doctor`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_degrees`
--

DROP TABLE IF EXISTS `doctor_degrees`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_degrees`
(
    `doctor_id` bigint NOT NULL,
    `degrees`   varchar(255) DEFAULT NULL,
    KEY `FKsqbj0s6n7sxktag3h5jvpoiwm` (`doctor_id`),
    CONSTRAINT `FKsqbj0s6n7sxktag3h5jvpoiwm` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_degrees`
--

LOCK TABLES `doctor_degrees` WRITE;
/*!40000 ALTER TABLE `doctor_degrees`
    DISABLE KEYS */;
INSERT INTO `doctor_degrees`
VALUES (4, 'MBBS'),
       (4, 'FCPS'),
       (5, 'MBBS'),
       (2, 'MBBS'),
       (2, 'MRCP'),
       (6, 'MBBS'),
       (7, 'MD'),
       (7, 'MBBS'),
       (7, 'FCPS'),
       (8, 'MBBS'),
       (8, 'FCPS'),
       (8, 'MD'),
       (9, 'MBBS'),
       (9, 'FCPS'),
       (10, 'MBBS'),
       (11, 'MBBS'),
       (11, 'FCPS'),
       (13, 'MBBS'),
       (3, 'MBBS'),
       (3, 'FCPS'),
       (3, 'MRCP'),
       (1, 'MBBS'),
       (12, 'MBBS'),
       (12, 'FCPS'),
       (12, 'MD'),
       (14, 'MBBS');
/*!40000 ALTER TABLE `doctor_degrees`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_specialities`
--

DROP TABLE IF EXISTS `doctor_specialities`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_specialities`
(
    `doctor_id`    bigint NOT NULL,
    `specialities` varchar(255) DEFAULT NULL,
    KEY `FK29o6fk8lj7ttiwrc3abpltb20` (`doctor_id`),
    CONSTRAINT `FK29o6fk8lj7ttiwrc3abpltb20` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_specialities`
--

LOCK TABLES `doctor_specialities` WRITE;
/*!40000 ALTER TABLE `doctor_specialities`
    DISABLE KEYS */;
INSERT INTO `doctor_specialities`
VALUES (4, 'ENT'),
       (5, 'Urology'),
       (2, 'ENT'),
       (2, 'Trauma'),
       (6, 'Genecology'),
       (7, 'Cardiology'),
       (8, 'Cardiology'),
       (9, 'Orthopedic'),
       (10, 'DENTAL'),
       (11, 'General Surgery'),
       (13, 'FCPS'),
       (3, 'Opthalmology'),
       (1, 'Opthalmology'),
       (12, 'Otolaryngology'),
       (14, 'Cardiovascular');
/*!40000 ALTER TABLE `doctor_specialities`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dr_appointment_bill`
--

DROP TABLE IF EXISTS `dr_appointment_bill`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_appointment_bill`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT,
    `created_at`    datetime(6) DEFAULT NULL,
    `appointment_time` varchar(255) DEFAULT NULL,
    `discount`      double       NOT NULL,
    `fee`           double       NOT NULL,
    `final_fee`     double       NOT NULL,
    `type`          varchar(255) NOT NULL,
    `created_by_id` bigint      DEFAULT NULL,
    `org_dr_id`     bigint      DEFAULT NULL,
    `org_id`        bigint      DEFAULT NULL,
    `patient_id`    bigint      DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FKq2xge7yfn00nw3yprl7k1n394` (`created_by_id`),
    KEY `FK6glarjruehftfqr252i6unyae` (`org_dr_id`),
    KEY `FKpvumobbm95yhs0uq3m5re32sq` (`org_id`),
    KEY `FKiehwr9lsp69xtk42gfhjdlsy` (`patient_id`),
    CONSTRAINT `FK6glarjruehftfqr252i6unyae` FOREIGN KEY (`org_dr_id`) REFERENCES `org_doctor` (`id`),
    CONSTRAINT `FKiehwr9lsp69xtk42gfhjdlsy` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
    CONSTRAINT `FKpvumobbm95yhs0uq3m5re32sq` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`),
    CONSTRAINT `FKq2xge7yfn00nw3yprl7k1n394` FOREIGN KEY (`created_by_id`) REFERENCES `app_user` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_appointment_bill`
--

# LOCK TABLES `dr_appointment_bill` WRITE;
# /*!40000 ALTER TABLE `dr_appointment_bill`
#     DISABLE KEYS */;
# INSERT INTO `dr_appointment_bill`
# VALUES (1, '2023-05-02 10:26:21.277531', 10, 300, 283.5, 'REPORT', 3, 2, 2, 4),
#        (2, '2023-05-02 14:50:22.655088', 12, 500, 462, 'FOLLOWUP', 3, 4, 2, 19),
#        (3, '2023-05-07 17:29:23.379000', 10, 500, 472.5, 'FOLLOWUP', 3, 4, 2, 26),
#        (4, '2023-05-08 01:30:34.677000', 10, 600, 567, 'FOLLOWUP', 3, 2, 2, 4),
#        (5, '2023-05-08 11:15:25.070000', 0, 500, 525, 'CONSULTANT', 3, 3, 2, 4);
# /*!40000 ALTER TABLE `dr_appointment_bill`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Table structure for table `dr_available_times`
--

DROP TABLE IF EXISTS `dr_available_times`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dr_available_times`
(
    `id`         bigint       NOT NULL AUTO_INCREMENT,
    `day`        varchar(255) NOT NULL,
    `end_time`   time         NOT NULL,
    `start_time` time         NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dr_available_times`
--

LOCK TABLES `dr_available_times` WRITE;
/*!40000 ALTER TABLE `dr_available_times`
    DISABLE KEYS */;
INSERT INTO `dr_available_times`
VALUES (1, 'Sunday', '10:50:00', '06:50:00'),
       (2, 'Sunday', '02:00:00', '00:00:00'),
       (3, 'Sunday', '01:00:00', '23:00:00'),
       (4, 'Monday', '18:00:00', '16:00:00'),
       (5, 'Monday', '20:00:00', '18:00:00'),
       (6, 'Wednesday', '20:00:00', '18:00:00'),
       (7, 'Thursday', '22:00:00', '20:00:00'),
       (8, 'Friday', '18:00:00', '16:00:00'),
       (9, 'Sunday', '01:00:00', '23:00:00'),
       (10, 'Monday', '20:00:00', '16:00:00'),
       (11, 'Tuesday', '02:00:00', '00:00:00'),
       (12, 'Thursday', '18:00:00', '15:00:00'),
       (13, 'Thursday', '00:00:00', '22:00:00'),
       (14, 'Saturday', '17:00:00', '15:00:00'),
       (15, 'Wednesday', '00:00:00', '22:00:00'),
       (16, 'Saturday', '17:00:00', '15:00:00');
/*!40000 ALTER TABLE `dr_available_times`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history`
(
    `installed_rank` int           NOT NULL,
    `version`        varchar(50)            DEFAULT NULL,
    `description`    varchar(200)  NOT NULL,
    `type`           varchar(20)   NOT NULL,
    `script`         varchar(1000) NOT NULL,
    `checksum`       int                    DEFAULT NULL,
    `installed_by`   varchar(100)  NOT NULL,
    `installed_on`   timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `execution_time` int           NOT NULL,
    `success`        tinyint(1)    NOT NULL,
    PRIMARY KEY (`installed_rank`),
    KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history`
    DISABLE KEYS */;
INSERT INTO `flyway_schema_history`
VALUES (1, '1', 'FullStructureWithDemoData', 'SQL', 'V1__FullStructureWithDemoData.sql', 1336875824, 'root',
        '2023-05-07 11:28:34', 1190, 1);
/*!40000 ALTER TABLE `flyway_schema_history`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine`
(
    `id`           bigint NOT NULL AUTO_INCREMENT,
    `formulation`  varchar(255) DEFAULT NULL,
    `generic_name` varchar(255) DEFAULT NULL,
    `name`         varchar(255) DEFAULT NULL,
    `price`        double NOT NULL,
    `strength`     varchar(255) DEFAULT NULL,
    `vendor`       varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine`
    DISABLE KEYS */;
INSERT INTO `medicine`
VALUES (1, 'Tablet', 'Paracetamol', 'Napa Extra', 2, '500mg', 'BEXIMCO'),
       (2, 'Tablet', 'Paracetamol', 'Ace', 1.2, '500mg', 'SQUARE'),
       (3, 'Cream', 'Clobestol Propionate', 'Aclosol', 45, '0.05%', 'AD-DIN'),
       (4, 'Bottle', 'Cephalexin', 'Acelex', 77.5, '125mg', 'ACME'),
       (5, 'Bag', 'Dextrose', 'Babysol', 72.23, '5%', 'OPSO'),
       (6, 'Tablet', 'Baclofen', 'Bacaid', 5, '5mg', 'LABAID'),
       (7, 'Tablet', 'Cabergoline', 'Cabolin', 80, '0.5mg', 'RENATA'),
       (8, 'Tablet', 'Carbamazepine', 'Cabretol', 301.13, '100mg', 'RENATA'),
       (9, 'Ointment', 'Sodium Fusidate', 'Facid', 90, '2%', 'SK+F'),
       (10, 'Tablet', 'Cefuroxime Axetil', 'Famicef', 45.29, '500mg', 'ACME'),
       (11, 'Bottle', 'Minoxidil', 'Hairgrow', 600, '5%', 'SK+F'),
       (12, 'Tablet', 'Ruxolitinib', 'Jakavi', 3906.41, '5mg', 'NOVARTIS');
/*!40000 ALTER TABLE `medicine`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_diagnostic`
--

DROP TABLE IF EXISTS `org_diagnostic`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_diagnostic`
(
    `id`              bigint NOT NULL AUTO_INCREMENT,
    `price`           double NOT NULL,
    `diagnostic_id`   bigint DEFAULT NULL,
    `organization_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK2bqj75i96j5xqxqnx8qy64toa` (`diagnostic_id`),
    KEY `FKmg4mi5umrxjdky0ilkilrisqh` (`organization_id`),
    CONSTRAINT `FK2bqj75i96j5xqxqnx8qy64toa` FOREIGN KEY (`diagnostic_id`) REFERENCES `diagnostic` (`id`),
    CONSTRAINT `FKmg4mi5umrxjdky0ilkilrisqh` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_diagnostic`
--

LOCK TABLES `org_diagnostic` WRITE;
/*!40000 ALTER TABLE `org_diagnostic`
    DISABLE KEYS */;
INSERT INTO `org_diagnostic`
VALUES (1, 400, 3, 2),
       (2, 500, 2, 2),
       (3, 300, 1, 2),
       (4, 200, 7, 2),
       (5, 200, 4, 3),
       (6, 1000, 13, 3);
/*!40000 ALTER TABLE `org_diagnostic`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_diagnostic_and_discount`
--

DROP TABLE IF EXISTS `org_diagnostic_and_discount`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_diagnostic_and_discount`
(
    `id`                bigint  NOT NULL AUTO_INCREMENT,
    `discount`          tinyint NOT NULL,
    `invoice_price`     double DEFAULT NULL,
    `org_diagnostic_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK3ere44r519igyhx5rqnry8rao` (`org_diagnostic_id`),
    CONSTRAINT `FK3ere44r519igyhx5rqnry8rao` FOREIGN KEY (`org_diagnostic_id`) REFERENCES `org_diagnostic` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_diagnostic_and_discount`
--

LOCK TABLES `org_diagnostic_and_discount` WRITE;
/*!40000 ALTER TABLE `org_diagnostic_and_discount`
    DISABLE KEYS */;
INSERT INTO `org_diagnostic_and_discount`
VALUES (1, 5, 300, 1),
       (2, 2, 500, 2),
       (3, 2, 400, 1),
       (4, 0, 200, 4),
       (5, 0, 200, 5),
       (6, 5, 300, 3),
       (7, 2, 500, 2),
       (8, 0, 300, 3),
       (9, 0, 200, 4),
       (10, 5, 400, 1),
       (11, 0, 200, 4);
/*!40000 ALTER TABLE `org_diagnostic_and_discount`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_doctor`
--

DROP TABLE IF EXISTS `org_doctor`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_doctor`
(
    `id`               bigint NOT NULL AUTO_INCREMENT,
    `consultation_fee` double NOT NULL,
    `followup_fee`     double NOT NULL,
    `report_fee`       double NOT NULL,
    `app_user_id`      bigint DEFAULT NULL,
    `doctor_id`        bigint DEFAULT NULL,
    `organization_id`  bigint DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FKifhjqdvqyaob77wffds000tm0` (`app_user_id`),
    KEY `FK3pivmgqheyxmgn28uot305cfd` (`doctor_id`),
    KEY `FK13ror99uee0ddaxar4pq7eap8` (`organization_id`),
    CONSTRAINT `FK13ror99uee0ddaxar4pq7eap8` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
    CONSTRAINT `FK3pivmgqheyxmgn28uot305cfd` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
    CONSTRAINT `FKifhjqdvqyaob77wffds000tm0` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_doctor`
--

LOCK TABLES `org_doctor` WRITE;
/*!40000 ALTER TABLE `org_doctor`
    DISABLE KEYS */;
INSERT INTO `org_doctor`
VALUES (2, 900, 600, 300, 2, 1, 2),
       (3, 500, 300, 200, 2, 2, 2),
       (4, 700, 500, 200, 2, 5, 2),
       (5, 800, 600, 400, 2, 4, 2),
       (6, 1200, 800, 600, 7, 8, 3),
       (7, 800, 500, 400, 7, 11, 3),
       (8, 1000, 200, 100, 2, 13, 2),
       (9, 1500, 1000, 800, 2, 8, 2);
/*!40000 ALTER TABLE `org_doctor`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_doctor_available_day_times`
--

DROP TABLE IF EXISTS `org_doctor_available_day_times`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_doctor_available_day_times`
(
    `org_doctor_id`          bigint NOT NULL,
    `available_day_times_id` bigint NOT NULL,
    UNIQUE KEY `UK_nd99hcenpfpotppw8c1jxaoao` (`available_day_times_id`),
    KEY `FKhtv9ympgl8x65njvoyexfpg0c` (`org_doctor_id`),
    CONSTRAINT `FK6pws5ase5altcw5rni5npmiww` FOREIGN KEY (`available_day_times_id`) REFERENCES `dr_available_times` (`id`),
    CONSTRAINT `FKhtv9ympgl8x65njvoyexfpg0c` FOREIGN KEY (`org_doctor_id`) REFERENCES `org_doctor` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_doctor_available_day_times`
--

LOCK TABLES `org_doctor_available_day_times` WRITE;
/*!40000 ALTER TABLE `org_doctor_available_day_times`
    DISABLE KEYS */;
INSERT INTO `org_doctor_available_day_times`
VALUES (2, 2),
       (3, 5),
       (3, 6),
       (4, 7),
       (4, 8),
       (5, 9),
       (5, 10),
       (8, 11),
       (8, 12),
       (9, 15),
       (9, 16);
/*!40000 ALTER TABLE `org_doctor_available_day_times`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_medicine`
--

DROP TABLE IF EXISTS `org_medicine`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_medicine`
(
    `id`              bigint NOT NULL AUTO_INCREMENT,
    `medicine_id`     bigint DEFAULT NULL,
    `organization_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FKeiojy5luuyitbvasr157pckpa` (`medicine_id`),
    KEY `FK25nk4gyhbrxgmcuhal0g80wys` (`organization_id`),
    CONSTRAINT `FK25nk4gyhbrxgmcuhal0g80wys` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
    CONSTRAINT `FKeiojy5luuyitbvasr157pckpa` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_medicine`
--

LOCK TABLES `org_medicine` WRITE;
/*!40000 ALTER TABLE `org_medicine`
    DISABLE KEYS */;
INSERT INTO `org_medicine`
VALUES (1, 2, 2),
       (2, 1, 2),
       (3, 4, 2),
       (4, 4, 3),
       (5, 12, 3),
       (6, 12, 2),
       (7, 11, 2),
       (8, 7, 2);
/*!40000 ALTER TABLE `org_medicine`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization`
(
    `id`      bigint NOT NULL AUTO_INCREMENT,
    `address` varchar(255) DEFAULT NULL,
    `email`   varchar(255) DEFAULT NULL,
    `name`    varchar(255) DEFAULT NULL,
    `phone`   varchar(255) DEFAULT NULL,
    `website` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_t4bamosb7eleheafmlcalbhjf` (`email`),
    UNIQUE KEY `UK_8j5y8ipk73yx2joy9yr653c9t` (`name`),
    UNIQUE KEY `UK_mgl1jbaxc5t7n7myesgpy4ank` (`phone`),
    UNIQUE KEY `UK_sl7ympcbfaywvbihde7s1p4oj` (`website`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization`
    DISABLE KEYS */;
INSERT INTO `organization`
VALUES (1, 'Panthapath, Dhaka', 'info@labaid.net', 'Labaid Hospital Ltd.', '+8801345678909', 'www.labaid.com'),
       (2, 'Panthapath, Dhaka', 'info@square.com', 'Square Hospital Ltd.', '+8801345678902', 'www.square.com'),
       (3, 'Panthapath, Dhaka', 'info@brb.net', 'BRB Hospital Ltd.', '+8801645678988', 'www.brbhospital.com'),
       (4, 'Shahbag, Dhaka', 'info@dmc.net', 'Dhaka Medical College Hospital', '+8801845678456', 'www.dmc.com'),
       (5, '111/1/A Distillery Road, Gandaria, Dhaka-1204, Bangladesh', 'info@ajgarali.com', 'Asgar Ali Hospital',
        '01787683333', 'https://www.asgaralihospital.com'),
       (6, 'House 48, Road 9/A, Dhanmondi, Dhaka-1209', 'info@ibnsinatrust.com', 'Ibn Sina Specialized Hospital',
        '01823039800', 'https://www.ibnsinatrust.com'),
       (7, 'plot 15, Road 71, Gulshan,Dhaka 1212, Bangladesh', 'info@uhlbd.com', 'UNITED HOSPITAL', '01914001234',
        'https://www.uhlbd.com'),
       (8, 'House-12/A, Road-05, Mirpur Main Road, Dhanmondi, Dhaka-1215, Bangladesh.', 'haruneyehospital@gmail.com',
        'Harun eye foundation hospital', '01531210502', 'http://www.hefhbd.com'),
       (9, 'Plot 81, Block-E, Bashundhara Rd, Dhaka 1229', 'info@evercare.com', 'Evercare Hospital', '01755037242',
        'https://www.evercarebd.com'),
       (10, '122 Kazi Nazrul Islam Ave, Dhaka 1000', 'info@birdem.com', 'BIRDEM General Hospital', '01766037242',
        'https://www.birdembd.org'),
       (11, '21 Shyamoli, Mirpur Road, Dhaka-1207, Bangladesh', 'info@bshl.com.bd', 'Bangladesh Specialized Hospital',
        '01666700100', 'https://www.bdspecializedhospital.com'),
       (12, 'House #16, Road # 2, Dhanmondi R/a, Dhaka-1205, Bangladesh', 'info@populardiagnostic.com',
        'Popular Diagnostic Centre Ltd', '01714787801', 'https://www.populardiagnostic.com'),
       (13, 'C/12, Tetuibari, Kasimpur Gazipur (Near Depz) , Bangladesh', 'info@sfmmkpjsh.com',
        'SHEIKH FAZILATUNNESSA MUJIB COLLEGE', '01810008080', 'https://www.sfmmkpjsh.com');
/*!40000 ALTER TABLE `organization`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient`
(
    `id`     bigint  NOT NULL AUTO_INCREMENT,
    `age`    tinyint NOT NULL,
    `email`  varchar(255) DEFAULT NULL,
    `gender` varchar(255) DEFAULT NULL,
    `name`   varchar(255) DEFAULT NULL,
    `phone`  varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_bawli8xm92f30ei6x9p3h8eju` (`email`),
    UNIQUE KEY `UK_9gxe97j2ngjjvtkig6b6jvy91` (`phone`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 28
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient`
    DISABLE KEYS */;
INSERT INTO `patient`
VALUES (1, 34, 'paul@gmail.com', 'MALE', 'Shahriar Paul', '01545678966'),
       (2, 26, 'amina@gmail.com', 'FEMALE', 'Amina Begum', '01545678970'),
       (3, 55, 'rahim@gmail.com', 'MALE', 'Md Rahim Mia', '01845678692'),
       (4, 57, 'rashid@yahoo.com', 'MALE', 'Abdur Rashid', '01645678907'),
       (5, 36, 'rahima@yahoo.com', 'FEMALE', 'Rahima Khatun', '01345678965'),
       (8, 60, 'karim@gmail.com', 'MALE', 'Karim Ahmed', '01456789567'),
       (11, 27, 'sadman@gmail.com', 'MALE', 'Sadman Sakib', '01675468979'),
       (12, 25, 'faisal@gmail.com', 'MALE', 'Faisal Ahmed', '+8801722320388'),
       (13, 29, 'sifat@gmail.com', 'FEMALE', 'Sifat E Jahan', '+8801822320388'),
       (14, 34, 'abid.abrar@gmail.com', 'MALE', 'Abid Abrar', '+8801662320388'),
       (15, 16, 'mehnaz@gmail.com', 'FEMALE', 'Mehnaz Seraj', '+8801722331388'),
       (16, 68, 'rajib@yahoo.com', 'MALE', 'Rajibul Hasan', '+8801722323988'),
       (17, 21, 'suchi.chaki@yahoo.com', 'FEMALE', 'Suchi Chaki', '+8801711320388'),
       (18, 22, 'tanvir@yahoo.com', 'MALE', 'Tanvir Ahmed', '+8801730320388'),
       (19, 51, 'moin.mostakim@hotmail.com', 'OTHER', 'Moin Mostakim', '+8801752990388'),
       (20, 8, 'faisal@hotmail.com', 'MALE', 'Faisal Ahmed', '+8801882320388'),
       (21, 31, 'shuvo@gmail.com', 'OTHER', 'Shaikot Jahan', '+8801755320318'),
       (22, 19, 'noworz@gmail.com', 'MALE', 'Nowroz Ahmed', '+8801702320308'),
       (23, 30, 'abc@gmail.com', 'MALE', 'Abdur Rashid', '01825711956'),
       (26, 25, 'ab1@gmail.com', 'MALE', 'Md ashik', '01825711958'),
       (27, 43, 'hazera@yahoo.com', 'FEMALE', 'Hazera Begum', '01468087579');
/*!40000 ALTER TABLE `patient`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_bill`
--

DROP TABLE IF EXISTS `pharmacy_bill`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_bill`
(
    `id`              bigint NOT NULL AUTO_INCREMENT,
    `created_at`      datetime(6) DEFAULT NULL,
    `discount`        double NOT NULL,
    `final_bill`      double NOT NULL,
    `total_bill`      double NOT NULL,
    `created_by_id`   bigint      DEFAULT NULL,
    `organization_id` bigint NOT NULL,
    `patient_id`      bigint NOT NULL,
    PRIMARY KEY (`id`),
    KEY `FKic4rwjmma6nhs71gyhqbh8v58` (`created_by_id`),
    KEY `FK6qjp4dahfo196daa7ydodb9y1` (`organization_id`),
    KEY `FKp0nwvxu1utr8a86611nbtte2y` (`patient_id`),
    CONSTRAINT `FK6qjp4dahfo196daa7ydodb9y1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
    CONSTRAINT `FKic4rwjmma6nhs71gyhqbh8v58` FOREIGN KEY (`created_by_id`) REFERENCES `app_user` (`id`),
    CONSTRAINT `FKp0nwvxu1utr8a86611nbtte2y` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_bill`
--

LOCK TABLES `pharmacy_bill` WRITE;
/*!40000 ALTER TABLE `pharmacy_bill`
    DISABLE KEYS */;
INSERT INTO `pharmacy_bill`
VALUES (1, '2023-04-29 23:42:44.769099', 0.06, 2.94, 3, 5, 2, 1),
       (2, '2023-05-03 11:22:13.759595', 17, 339.15, 340, 5, 2, 23);
/*!40000 ALTER TABLE `pharmacy_bill`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_bill_med_quantities`
--

DROP TABLE IF EXISTS `pharmacy_bill_med_quantities`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_bill_med_quantities`
(
    `pharmacy_bill_id` bigint NOT NULL,
    `med_quantities`   int DEFAULT NULL,
    KEY `FKs9j8k71j1jjfq1t85thvk2q85` (`pharmacy_bill_id`),
    CONSTRAINT `FKs9j8k71j1jjfq1t85thvk2q85` FOREIGN KEY (`pharmacy_bill_id`) REFERENCES `pharmacy_bill` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_bill_med_quantities`
--

LOCK TABLES `pharmacy_bill_med_quantities` WRITE;
/*!40000 ALTER TABLE `pharmacy_bill_med_quantities`
    DISABLE KEYS */;
INSERT INTO `pharmacy_bill_med_quantities`
VALUES (1, 2),
       (2, 8),
       (2, 10),
       (2, 4);
/*!40000 ALTER TABLE `pharmacy_bill_med_quantities`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_bill_medicines`
--

DROP TABLE IF EXISTS `pharmacy_bill_medicines`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacy_bill_medicines`
(
    `pharmacy_bill_id` bigint NOT NULL,
    `medicines_id`     bigint NOT NULL,
    KEY `FKrc6owhyjsb0edh58vfhs1yjs2` (`medicines_id`),
    KEY `FK3q9xvdhu5ogfmynl86cmnfibg` (`pharmacy_bill_id`),
    CONSTRAINT `FK3q9xvdhu5ogfmynl86cmnfibg` FOREIGN KEY (`pharmacy_bill_id`) REFERENCES `pharmacy_bill` (`id`),
    CONSTRAINT `FKrc6owhyjsb0edh58vfhs1yjs2` FOREIGN KEY (`medicines_id`) REFERENCES `medicine` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_bill_medicines`
--

LOCK TABLES `pharmacy_bill_medicines` WRITE;
/*!40000 ALTER TABLE `pharmacy_bill_medicines`
    DISABLE KEYS */;
INSERT INTO `pharmacy_bill_medicines`
VALUES (1, 1),
       (2, 1),
       (2, 2),
       (2, 3);
/*!40000 ALTER TABLE `pharmacy_bill_medicines`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 11:25:55
