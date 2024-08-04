USE billingsystem;

-- Table structure for `app_user`

DROP TABLE IF EXISTS `app_user`;

CREATE TABLE `app_user` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `address` varchar(255) NOT NULL,
                            `age` int NOT NULL,
                            `email` varchar(255) DEFAULT NULL UNIQUE,
                            `gender` varchar(255) DEFAULT NULL,
                            `name` varchar(255) DEFAULT NULL,
                            `password` varchar(255) DEFAULT NULL,
                            `phone` varchar(255) DEFAULT NULL UNIQUE,
                            `organization_id` bigint DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            KEY `FK_appUser_Organization` (`organization_id`),
                            CONSTRAINT `FK_appUser_Organization` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
);

-- Table structure for table `app_user_role`

DROP TABLE IF EXISTS `app_user_role`;

CREATE TABLE `app_user_role` (
                                 `app_user_id` bigint NOT NULL,
                                 `role` varchar(255) DEFAULT NULL,
                                 KEY `FK_appUser_appUserRole` (`app_user_id`),
                                 CONSTRAINT `FK_appUser_appUserRole` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`)
);

-- Table structure for table `billing_history`

DROP TABLE IF EXISTS `billing_history`;

CREATE TABLE `billing_history` (
                                   `id` bigint NOT NULL AUTO_INCREMENT,
                                   `invoice_id` bigint DEFAULT NULL,
                                   `service_type` int DEFAULT NULL,
                                   `time` datetime(6) DEFAULT NULL,
                                   `total_amount` double NOT NULL,
                                   PRIMARY KEY (`id`)
);

-- Table structure for table `diagnostic`

DROP TABLE IF EXISTS `diagnostic`;

CREATE TABLE `diagnostic` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `service_name` varchar(255) DEFAULT NULL,
                              PRIMARY KEY (`id`)
);

-- Table structure for table `diagnostic_bill`

DROP TABLE IF EXISTS `diagnostic_bill`;

CREATE TABLE `diagnostic_bill` (
                                   `id` bigint NOT NULL AUTO_INCREMENT,
                                   `final_fee_after_all_discount` double NOT NULL,
                                   `overall_discount` tinyint NOT NULL,
                                   `timestamp` datetime(6) DEFAULT NULL,
                                   `total_fee_after_individual_discount` double NOT NULL,
                                   `total_fee_without_any_discount` double NOT NULL,
                                   `app_user_id` bigint DEFAULT NULL,
                                   `organization_id` bigint DEFAULT NULL,
                                   `patient_id` bigint DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `FK_diagnostic_appUser` (`app_user_id`),
                                   KEY `FK_diagnostic_organization` (`organization_id`),
                                   KEY `FK_diagnostic_patient` (`patient_id`),
                                   CONSTRAINT `FK_diagnostic_organization` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
                                   CONSTRAINT `FK_diagnostic_appUser` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`),
                                   CONSTRAINT `FK_diagnostic_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
);

-- Table structure for table `diagnostic_bill_org_diagnostic_and_discounts`

DROP TABLE IF EXISTS `diagnostic_bill_org_diagnostic_and_discounts`;

CREATE TABLE `diagnostic_bill_org_diagnostic_and_discounts` (
                                                                `diagnostic_bill_id` bigint NOT NULL,
                                                                `org_diagnostic_and_discounts_id` bigint NOT NULL,
                                                                UNIQUE KEY `UK_orgDiagnosticAndDiscount` (`org_diagnostic_and_discounts_id`),
                                                                KEY `FK_diagnosticBill` (`diagnostic_bill_id`),
                                                                CONSTRAINT `FK_orgDiagnosticAndDiscount` FOREIGN KEY (`org_diagnostic_and_discounts_id`) REFERENCES `org_diagnostic_and_discount` (`id`),
                                                                CONSTRAINT `FK_diagnosticBill` FOREIGN KEY (`diagnostic_bill_id`) REFERENCES `diagnostic_bill` (`id`)
);

-- Table structure for table `doctor`

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `bmdc` bigint NOT NULL,
                          `email` varchar(255) DEFAULT NULL,
                          `gender` varchar(255) DEFAULT NULL,
                          `name` varchar(255) DEFAULT NULL,
                          `phone` varchar(255) DEFAULT NULL,
                          `app_user_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `UK_bmdc` (`bmdc`),
                          UNIQUE KEY `UK_email` (`email`),
                          UNIQUE KEY `UK_phone` (`phone`),
                          KEY `FK_doctor_appUser` (`app_user_id`),
                          CONSTRAINT `FK_doctor_appUser` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`)
);

-- Table structure for table `doctor_degrees`

DROP TABLE IF EXISTS `doctor_degrees`;

CREATE TABLE `doctor_degrees` (
                                  `doctor_id` bigint NOT NULL,
                                  `degrees` varchar(255) DEFAULT NULL,
                                  KEY `FK_doctorDegree_Doctor` (`doctor_id`),
                                  CONSTRAINT `FK_doctorDegree_Doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
);

-- Table structure for table `doctor_specialities`

DROP TABLE IF EXISTS `doctor_specialities`;

CREATE TABLE `doctor_specialities` (
                                       `doctor_id` bigint NOT NULL,
                                       `specialities` varchar(255) DEFAULT NULL,
                                       KEY `FK_doctorSpeciality_doctor` (`doctor_id`),
                                       CONSTRAINT `FK_doctorSpeciality_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
);

-- Table structure for table `dr_appointment_bill`

DROP TABLE IF EXISTS `dr_appointment_bill`;

CREATE TABLE `dr_appointment_bill` (
                                       `id` bigint NOT NULL AUTO_INCREMENT,
                                       `created_at` datetime(6) DEFAULT NULL,
                                       `discount` double NOT NULL,
                                       `dr_time` time NOT NULL,
                                       `fee` double NOT NULL,
                                       `final_fee` double NOT NULL,
                                       `type` varchar(255) NOT NULL,
                                       `created_by_id` bigint DEFAULT NULL,
                                       `org_dr_id` bigint DEFAULT NULL,
                                       `org_id` bigint DEFAULT NULL,
                                       `patient_id` bigint DEFAULT NULL,
                                       PRIMARY KEY (`id`),
                                       KEY `FK_appointmentBill_appUser` (`created_by_id`),
                                       KEY `FK_appointmentBill_orgDoctor` (`org_dr_id`),
                                       KEY `FK_appointmentBill_organization` (`org_id`),
                                       KEY `FK_appointmentBill_patient` (`patient_id`),
                                       CONSTRAINT `FK_appointmentBill_orgDoctor` FOREIGN KEY (`org_dr_id`) REFERENCES `org_doctor` (`id`),
                                       CONSTRAINT `FK_appointmentBill_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
                                       CONSTRAINT `FK_appointmentBill_organization` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`),
                                       CONSTRAINT `FK_appointmentBill_appUser` FOREIGN KEY (`created_by_id`) REFERENCES `app_user` (`id`)
);

-- Table structure for table `medicine`

DROP TABLE IF EXISTS `medicine`;

CREATE TABLE `medicine` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `generic_name` varchar(255) DEFAULT NULL,
                            `name` varchar(255) DEFAULT NULL,
                            `price` double NOT NULL,
                            `strength` varchar(255) DEFAULT NULL,
                            `vendor` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`)
);

-- Table structure for table `org_diagnostic`

DROP TABLE IF EXISTS `org_diagnostic`;

CREATE TABLE `org_diagnostic` (
                                  `id` bigint NOT NULL AUTO_INCREMENT,
                                  `price` double NOT NULL,
                                  `diagnostic_id` bigint DEFAULT NULL,
                                  `organization_id` bigint DEFAULT NULL,
                                  PRIMARY KEY (`id`),
                                  KEY `FK_orgDianostic_diagnostic` (`diagnostic_id`),
                                  KEY `FK_orgDianostic_organization` (`organization_id`),
                                  CONSTRAINT `FK_orgDianostic_diagnostic` FOREIGN KEY (`diagnostic_id`) REFERENCES `diagnostic` (`id`),
                                  CONSTRAINT `FK_orgDianostic_organization` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
);

-- Table structure for table `org_diagnostic_and_discount`

DROP TABLE IF EXISTS `org_diagnostic_and_discount`;

CREATE TABLE `org_diagnostic_and_discount` (
                                               `id` bigint NOT NULL AUTO_INCREMENT,
                                               `discount` tinyint NOT NULL,
                                               `invoice_price` double DEFAULT NULL,
                                               `org_diagnostic_id` bigint DEFAULT NULL,
                                               PRIMARY KEY (`id`),
                                               KEY `FK_orgDiagnosticAndDiscount_orgDiagnostic` (`org_diagnostic_id`),
                                               CONSTRAINT `FK_orgDiagnosticAndDiscount_orgDiagnostic` FOREIGN KEY (`org_diagnostic_id`) REFERENCES `org_diagnostic` (`id`)
);

-- Table structure for table `org_doctor`

DROP TABLE IF EXISTS `org_doctor`;

CREATE TABLE `org_doctor` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `consultation_fee` double NOT NULL,
                              `followup_fee` double NOT NULL,
                              `report_fee` double NOT NULL,
                              `app_user_id` bigint DEFAULT NULL,
                              `doctor_id` bigint DEFAULT NULL,
                              `org_id` bigint DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              KEY `FK_orgDoctor_appUser` (`app_user_id`),
                              KEY `FK_orgDoctor_doctor` (`doctor_id`),
                              KEY `FK_orgDoctor_organization` (`org_id`),
                              CONSTRAINT `FK_orgDoctor_doctor` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
                              CONSTRAINT `FK_orgDoctor_organization` FOREIGN KEY (`org_id`) REFERENCES `organization` (`id`),
                              CONSTRAINT `FK_orgDoctor_appUser` FOREIGN KEY (`app_user_id`) REFERENCES `app_user` (`id`)
);

-- Table structure for table `org_doctor_available_times`

DROP TABLE IF EXISTS `org_doctor_available_times`;

CREATE TABLE `org_doctor_available_times` (
                                              `org_doctor_id` bigint NOT NULL,
                                              `available_times` varchar(255) DEFAULT NULL,
                                              KEY `FK_orgDoctorAvailableTimes_orgDoctor` (`org_doctor_id`),
                                              CONSTRAINT `FK_orgDoctorAvailableTimes_orgDoctor` FOREIGN KEY (`org_doctor_id`) REFERENCES `org_doctor` (`id`)
);

-- Table structure for table `org_medicine`

DROP TABLE IF EXISTS `org_medicine`;

CREATE TABLE `org_medicine` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `medicine_id` bigint DEFAULT NULL,
                                `organization_id` bigint DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `FK_orgMedicine_medicine` (`medicine_id`),
                                KEY `FK_orgMedicine_organization` (`organization_id`),
                                CONSTRAINT `FK_orgMedicine_organization` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
                                CONSTRAINT `FK_orgMedicine_medicine` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`)
);

-- Table structure for table `organization`

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `address` varchar(255) DEFAULT NULL,
                                `email` varchar(255) DEFAULT NULL,
                                `name` varchar(255) DEFAULT NULL,
                                `phone` varchar(255) DEFAULT NULL,
                                `website` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`id`)
);

-- Table structure for table `patient`

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `age` tinyint NOT NULL,
                           `email` varchar(255) DEFAULT NULL,
                           `gender` varchar(255) DEFAULT NULL,
                           `name` varchar(255) DEFAULT NULL,
                           `phone` varchar(255) DEFAULT NULL,
                           PRIMARY KEY (`id`)
);

-- Table structure for table `pharmacy_bill`

DROP TABLE IF EXISTS `pharmacy_bill`;

CREATE TABLE `pharmacy_bill` (
                                 `id` bigint NOT NULL AUTO_INCREMENT,
                                 `created_at` datetime(6) DEFAULT NULL,
                                 `discount` double NOT NULL,
                                 `final_bill` double NOT NULL,
                                 `total_bill` double NOT NULL,
                                 `created_by_id` bigint DEFAULT NULL,
                                 `organization_id` bigint NOT NULL,
                                 `patient_id` bigint NOT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `FK_pharmacyBill_appUser` (`created_by_id`),
                                 KEY `FK_pharmacyBill_organization` (`organization_id`),
                                 KEY `FK_pharmacyBill_patient` (`patient_id`),
                                 CONSTRAINT `FK_pharmacyBill_organization` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`),
                                 CONSTRAINT `FK_pharmacyBill_appUser` FOREIGN KEY (`created_by_id`) REFERENCES `app_user` (`id`),
                                 CONSTRAINT `FK_pharmacyBill_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
);

-- Table structure for table `pharmacy_bill_med_quantities`

DROP TABLE IF EXISTS `pharmacy_bill_med_quantities`;

CREATE TABLE `pharmacy_bill_med_quantities` (
                                                `pharmacy_bill_id` bigint NOT NULL,
                                                `med_quantities` int DEFAULT NULL,
                                                KEY `FK_pharmacyBillAndMedicineQuantity_pharmacyBill` (`pharmacy_bill_id`),
                                                CONSTRAINT `FK_pharmacyBillAndMedicineQuantity_pharmacyBill` FOREIGN KEY (`pharmacy_bill_id`) REFERENCES `pharmacy_bill` (`id`)
);

-- Table structure for table `pharmacy_bill_medicines`

DROP TABLE IF EXISTS `pharmacy_bill_medicines`;

CREATE TABLE `pharmacy_bill_medicines` (
                                           `pharmacy_bill_id` bigint NOT NULL,
                                           `medicines_id` bigint NOT NULL,
                                           KEY `FK_pharmacyBillAndMedicine_medicines` (`medicines_id`),
                                           KEY `FK_pharmacyBillAndMedicine_pharmacyBill` (`pharmacy_bill_id`),
                                           CONSTRAINT `FK_pharmacyBillAndMedicine_pharmacyBill` FOREIGN KEY (`pharmacy_bill_id`) REFERENCES `pharmacy_bill` (`id`),
                                           CONSTRAINT `FK_pharmacyBillAndMedicine_medicines` FOREIGN KEY (`medicines_id`) REFERENCES `medicine` (`id`)
)

