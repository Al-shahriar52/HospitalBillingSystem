
USE billingsystem;

-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: billingsystem
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Dumping data for table `app_user`
--


INSERT INTO `app_user` VALUES (1,'Panthapath',30,'admin@gmail.com','MALE','Aothoi','12345678','01445678903',1),(2,'Mdpur',25,'orgAdmin@gmail.com','MALE','Paula','12345678','01745678790',2),(3,'Mirpur',32,'drUser@gmail.com','FEMALE','Avijita','12345678','01546576890',2),(4,'Bashundhara',24,'diagUser@gmail.com','FEMALE','Moushumi Khanom','12345678','01645678908',2),(5,'Old Dhaka',40,'pharmaUser@gmail.com','MALE','Shahriar','12345678','01745678986',2),(6,'Mirpur, Dhaka',29,'khatun@yahoo.com','FEMALE','Rahima Khatun','12345678','01845678676',2),(7,'Bashundhara, Dhaka',34,'belal@gmail.com','MALE','Md Belal Hossain','12345678','01645789076',3),(8,'Mohakhali, Dhaka',35,'karim@yahoo.com','MALE','Karim Mia','12345678','01756466855',3),(9,'Bashundhara, Dhaka',29,'ali@gmail.com','FEMALE','Salma Khatun','12345678','01975467847',3),(10,'Bashundhara, Dhaka',29,'salma@gmail.com','FEMALE','Salma Akhter','12345678','01967896457',2),(11,'Mirpur, Dhaka',28,'abdul@gmail.com','MALE','Abdul Kader','12345678','01376554698',3);


--
-- Dumping data for table `app_user_role`
--


INSERT INTO `app_user_role` VALUES (1,'ROLE_ADMIN'),(4,'ROLE_DIAGNOSTIC_RECEPTIONIST'),(5,'ROLE_PHARMACIST'),(6,'ROLE_DOCTOR_RECEPTIONIST'),(7,'ROLE_ORG_ADMIN'),(8,'ROLE_ORG_ADMIN'),(9,'ROLE_DIAGNOSTIC_RECEPTIONIST'),(10,'ROLE_PHARMACIST'),(3,'ROLE_DOCTOR_RECEPTIONIST'),(2,'ROLE_ORG_ADMIN'),(11,'ROLE_ORG_ADMIN');

--
-- Dumping data for table `billing_history`
--

--
-- Dumping data for table `diagnostic`
--


INSERT INTO `diagnostic` VALUES (13,'Angiocardiography'),(16,'Biopsy'),(4,'Blood Test'),(14,'Brain Scanning'),(1,'CBC'),(7,'Diabetes Test'),(18,'Enzyme Analysis'),(8,'Glucose Tolerance'),(9,'Inulin Clearance'),(10,'Lumbar Puncture'),(6,'MRI'),(17,'Rubin’s Test'),(11,'Thoracentesis'),(15,'Tomography'),(12,'Toxicology Test'),(3,'Ultrasonography'),(5,'Urine Analysis'),(2,'X-Ray');


--
-- Dumping data for table `diagnostic_bill`
--


INSERT INTO `diagnostic_bill` VALUES (1,270.75,5,'2023-04-29 22:02:28.898202',285,10,4,NULL,4),(2,465.5,5,'2023-04-29 22:13:56.818381',490,10,4,NULL,3),(3,372.4,5,'2023-04-30 12:00:06.162319',392,400,4,2,4),(4,200,0,'2023-05-02 04:50:50.119191',200,200,4,2,3);

--
-- Dumping data for table `diagnostic_bill_org_diagnostic_and_discounts`
--

INSERT INTO `diagnostic_bill_org_diagnostic_and_discounts` VALUES (1,1),(2,2),(3,3),(4,4);

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` VALUES (1,123123,'MEDICAL','a.paul@gmail.com','MALE','Avijit Paul','01645678970',1),
                            (2,123122,'DENTAL','shah@gmail.com','MALE','Al Shahriar','01845678903',1),
                            (3,34323,'MEDICAL','sadat@gmail.com','FEMALE','Sadat Aothoi','01711347300',1),
                            (4,346436,'DENTAL','rahim@gmail.com','MALE','Md Rahim Ahmed','01745678772',1),
                            (5,536546,'MEDICAL','bashar@gmail.com','MALE','Abul Bashar','01546789085',1),
                            (6,123121,'MEDICAL','shahriar@gmail.com','MALE','Fahim Shahriar','01710000005',1),
                            (7,56874,'MEDICAL','wadud@bsh.info','MALE','Wadud Chowdhury','01767884597',1),
                            (8,32584,'MEDICAL','jahangir@united.com','MALE','Jahangir Hossain','01987568745',1),
                            (9,123548,'MEDICAL','samin@dmc.com','MALE','Samin Ahsan','01865756985',1),
                            (10,235795,'DENTAL','sana@gmail.com','FEMALE','Marium Islam','01456854698',1),
                            (11,789456,'MEDICAL','wick@gmail.com','MALE','John Wick','01687558420',1),
                            (12,456545,'MEDICAL','nabila@gmail.com','FEMALE','Dr. Nabila Nahar','01864568254',1);

--
-- Dumping data for table `doctor_degrees`
--

INSERT INTO `doctor_degrees` VALUES (3,'MBBS'),(3,'FCPS'),(3,'MRCP'),(4,'MBBS'),(4,'FCPS'),(5,'MBBS'),(1,'MBBS'),(2,'MBBS'),(2,'MRCP'),(6,'MBBS'),(7,'MD'),(7,'MBBS'),(7,'FCPS'),(8,'MBBS'),(8,'FCPS'),(8,'MD'),(9,'MBBS'),(9,'FCPS'),(10,'MBBS'),(11,'MBBS'),(11,'FCPS'),(12,'MBBS'),(12,'FCPS'),(12,'MD');

--
-- Dumping data for table `doctor_specialities`
--

INSERT INTO `doctor_specialities` VALUES (3,'Opthalmology'),(4,'ENT'),(5,'Urology'),(1,'Opthalmology'),(2,'ENT'),(2,'Trauma'),(6,'Genecology'),(7,'Cardiology'),(8,'Cardiology'),(9,'Orthopedic'),(10,'Dentist'),(11,'General Surgery'),(12,'Otolaryngology');

--
-- Dumping data for table `doctor_speciality`
--


--
-- Dumping data for table `dr_appointment_bill`
--

INSERT INTO `dr_appointment_bill` VALUES (1,'2023-05-02 10:26:21.277531',10,900,270,'REPORT',3,2,2,4);


--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` VALUES (1,'Tablet','Paracetamol','Napa Extra',2,'500mg','BEXIMCO'),(2,'Tablet','Paracetamol','Ace',2,'500mg','SQUARE'),(3,'Cream','Clobestol Propionate','Aclosol',45,'0.05%','AD-DIN'),(4,'Bottle','Cephalexin','Acelex',77.5,'125mg','ACME'),(5,'Bag','Dextrose','Babysol',72.23,'5%','OPSO'),(6,'Tablet','Baclofen','Bacaid',5,'5mg','LABAID'),(7,'Tablet','Cabergoline','Cabolin',80,'0.5mg','RENATA'),(8,'Tablet','Carbamazepine','Cabretol',301.13,'100mg','RENATA'),(9,'Ointment','Sodium Fusidate','Facid',90,'2%','SK+F'),(10,'Tablet','Cefuroxime Axetil','Famicef',45.29,'500mg','ACME'),(11,'Bottle','Minoxidil','Hairgrow',600,'5%','SK+F'),(12,'Tablet','Ruxolitinib','Jakavi',3906.41,'5mg','NOVARTIS');

--
-- Dumping data for table `org_diagnostic`
--

INSERT INTO `org_diagnostic` VALUES (1,400,3,2),(2,500,2,2),(3,300,1,2),(4,200,7,2);

--
-- Dumping data for table `org_diagnostic_and_discount`
--

INSERT INTO `org_diagnostic_and_discount` VALUES (1,5,300,1),(2,2,500,2),(3,2,400,1),(4,0,200,4);


--
-- Dumping data for table `org_doctor`
--

INSERT INTO `org_doctor` VALUES (2,900,600,300,2,1,2),(3,500,300,200,2,2,2),(4,700,500,200,2,5,2),(5,800,600,400,2,4,2);

--
-- Dumping data for table `org_medicine`
--


INSERT INTO `org_medicine` VALUES (1,2,2),(2,1,2),(3,4,2);


--
-- Dumping data for table `organization`
--


INSERT INTO `organization` VALUES (1,'Panthapath, Dhaka','info@labaid.net','Labaid Hospital Ltd','+8801345678970','www.labaid.com'),(2,'Panthapath, Dhaka','info@square.com','Square Hospital Ltd.','+8801345678902','www.square.com'),(3,'Panthapath, Dhaka','info@brb.net','BRB Hospital Ltd.','+8801645678988','www.brbhospital.com'),(4,'Shahbag, Dhaka','info@dmc.net','Dhaka Medical College Hospital','+8801845678456','www.dmc.com'),(5,'111/1/A Distillery Road, Gandaria, Dhaka-1204, Bangladesh','info@ajgarali.com','Asgar Ali Hospital','01787683333','https://www.asgaralihospital.com'),(6,'House 48, Road 9/A, Dhanmondi, Dhaka-1209','info@ibnsinatrust.com','Ibn Sina Specialized Hospital','01823039800','https://www.ibnsinatrust.com'),(7,'plot 15, Road 71, Gulshan,Dhaka 1212, Bangladesh','info@uhlbd.com','UNITED HOSPITAL','01914001234','https://www.uhlbd.com'),(8,'House-12/A, Road-05, Mirpur Main Road, Dhanmondi, Dhaka-1215, Bangladesh.','haruneyehospital@gmail.com','Harun eye foundation hospital','01531210502','http://www.hefhbd.com'),(9,'Plot 81, Block-E, Bashundhara Rd, Dhaka 1229','info@evercare.com','Evercare Hospital','01755037242','https://www.evercarebd.com'),(10,'122 Kazi Nazrul Islam Ave, Dhaka 1000','info@birdem.com','BIRDEM General Hospital','01766037242','https://www.birdembd.org'),(11,'21 Shyamoli, Mirpur Road, Dhaka-1207, Bangladesh','info@bshl.com.bd','Bangladesh Specialized Hospital','01666700100','https://www.bdspecializedhospital.com'),(12,'House #16, Road # 2, Dhanmondi R/A, Dhaka-1205, Bangladesh','info@populardiagnostic.com','Popular Diagnostic Centre Ltd.','01714787801','https://www.populardiagnostic.com'),(13,'C/12, Tetuibari, Kasimpur Gazipur (Near DEPZ) , Bangladesh','info@sfmmkpjsh.com','SHEIKH FAZILATUNNESSA MUJIB MEMORIAL KPJ SPECIALIZED HOSPITAL & NURSING COLLEGE','01810008080','https://www.sfmmkpjsh.com');


--
-- Dumping data for table `patient`
--


INSERT INTO `patient` VALUES (1,34,'paul@gmail.com','MALE','Shahriar Paul','01545678966'),(2,26,'amina@gmail.com','FEMALE','Amina Begum','01545678970'),(3,55,'rahim@gmail.com','MALE','Md Rahim Mia','01845678692'),(4,57,'rashid@yahoo.com','MALE','Abdur Rashid','01645678907'),(5,36,'rahima@yahoo.com','FEMALE','Rahima Khatun','01345678965'),(8,60,'karim@gmail.com','MALE','Karim Ahmed','01456789567'),(11,27,'sadman@gmail.com','MALE','Sadman Sakib','01675468979'),(12,25,'faisal@gmail.com','MALE','Faisal Ahmed','+8801722320388'),(13,29,'sifat@gmail.com','FEMALE','Sifat E Jahan','+8801822320388'),(14,34,'abid.abrar@gmail.com','MALE','Abid Abrar','+8801662320388'),(15,16,'mehnaz@gmail.com','FEMALE','Mehnaz Seraj','+8801722331388'),(16,68,'rajib@yahoo.com','MALE','Rajibul Hasan','+8801722323988'),(17,21,'suchi.chaki@yahoo.com','FEMALE','Suchi Chaki','+8801711320388'),(18,22,'tanvir@yahoo.com','MALE','Tanvir Ahmed','+8801730320388'),(19,51,'moin.mostakim@hotmail.com','OTHER','Moin Mostakim','+8801752990388'),(20,8,'faisal@hotmail.com','MALE','Faisal Ahmed','+8801882320388'),(21,31,'shuvo@gmail.com','OTHER','Shaikot Jahan','+8801755320318'),(22,19,'noworz@gmail.com','MALE','Nowroz Ahmed','+8801702320308');


--
-- Dumping data for table `pharmacy_bill`
--

INSERT INTO `pharmacy_bill` VALUES (1,'2023-04-29 23:42:44.769099',0.06,2.94,3,5,2,1);

--
-- Dumping data for table `pharmacy_bill_med_quantities`
--


INSERT INTO `pharmacy_bill_med_quantities` VALUES (1,2);

--
-- Dumping data for table `pharmacy_bill_medicines`
--


INSERT INTO `pharmacy_bill_medicines` VALUES (1,1);

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-02 13:04:15
