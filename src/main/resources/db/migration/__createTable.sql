-- host: 127.0.0.1    database: billingsystem
-- ------------------------------------------------------
-- server version	8.0.32


/*!40014 set @old_unique_checks=@@unique_checks, unique_checks=0 */;
/*!40014 set @old_foreign_key_checks=@@foreign_key_checks, foreign_key_checks=0 */;
/*!40101 set @old_sql_mode=@@sql_mode, sql_mode=`no_auto_value_on_zero` */;
/*!40111 set @old_sql_notes=@@sql_notes, sql_notes=0 */;


--
-- table structure for table `app_user`
--
create table `app_user` (
                `id` bigint not null auto_increment,
                `address` varchar(255) not null,
                `age` int not null,
                `email` varchar(255) default null,
                `gender` varchar(255) default null,
                `name` varchar(255) default null,
                `password` varchar(255) default null,
                `phone` varchar(255) default null,
                `organization_id` bigint default null,
                primary key (`id`),
                unique key `app_user_email` (`email`),
                unique key `app_user_phone` (`phone`),
                key `app_user_organization_id` (`organization_id`),
                constraint `app_user_organization_id` foreign key (`organization_id`) references `organization` (`id`)
);


--
-- table structure for table `app_user_role`
--
create table `app_user_role` (
                         `app_user_id` bigint not null,
                         `role` varchar(255) default null,
                         key `app_user_role_app_user_id` (`app_user_id`),
                         constraint `app_user_role_app_user_id` foreign key (`app_user_id`) references `app_user` (`id`)
);


--
-- table structure for table `billing_history`
--
create table `billing_history` (
                                   `id` bigint not null auto_increment,
                                   `invoice_id` bigint default null,
                                   `service_type` int default null,
                                   `time` datetime(6) default null,
                                   `total_amount` double not null,
                                   primary key (`id`)
);


--
-- table structure for table `diagnostic`
--
create table `diagnostic` (
                              `id` bigint not null auto_increment,
                              `service_name` varchar(255) default null,
                              primary key (`id`),
                              unique key `diagnostic_service_name` (`service_name`)
);


--
-- table structure for table `diagnostic_bill_org_diagnostic_and_discounts`
--
create table `diagnostic_bill` (
           `id` bigint not null auto_increment,
           `final_fee_after_all_discount` double not null,
           `overall_discount` tinyint not null,
           `timestamp` datetime(6) default null,
           `total_fee_after_individual_discount` double not null,
           `total_fee_without_any_discount` double not null,
           `app_user_id` bigint default null,
           `organization_id` bigint default null,
           `patient_id` bigint default null,
           primary key (`id`),
           key `diagnostic_bill_app_user_id` (`app_user_id`),
           key `diagnostic_bill_organization_id` (`organization_id`),
           key `diagnostic_bill_patient_id` (`patient_id`),
           constraint `diagnostic_bill_organization_id` foreign key (`organization_id`) references `organization` (`id`),
           constraint `diagnostic_bill_app_user_id` foreign key (`app_user_id`) references `app_user` (`id`),
           constraint `diagnostic_bill_patient_id` foreign key (`patient_id`) references `patient` (`id`)
);


--
-- table structure for table `diagnostic_bill_org_diagnostic_and_discounts`
--
create table `diagnostic_bill_org_diagnostic_and_discounts` (
        `diagnostic_bill_id` bigint not null,
        `org_diagnostic_and_discounts_id` bigint not null,
        unique key `dbodad_odad_discount_id` (`org_diagnostic_and_discounts_id`),
        key `dbodad_diagnostic_bill_id` (`diagnostic_bill_id`),
        constraint `dbodad_odad_discount_id` foreign key (`org_diagnostic_and_discounts_id`)
            references `org_diagnostic_and_discount` (`id`),
        constraint `dbodad_diagnostic_bill_id` foreign key (`diagnostic_bill_id`) references `diagnostic_bill` (`id`)
);


--
-- table structure for table `doctor`
--
create table `doctor` (
                          `id` bigint not null auto_increment,
                          `bmdc` bigint not null,
                          `doctor_type`varchar(255) default null,
                          `email` varchar(255) default null,
                          `gender` varchar(255) default null,
                          `name` varchar(255) default null,
                          `phone` varchar(255) default null,
                          `app_user_id` bigint default null,
                          primary key (`id`),
                          unique key `doctor_bmdc` (`bmdc`),
                          unique key `doctor_email` (`email`),
                          unique key `doctor_phone` (`phone`),
                          key `doctor_app_user_id` (`app_user_id`),
                          constraint `doctor_app_user_id` foreign key (`app_user_id`) references `app_user` (`id`)
);


--
-- table structure for table `doctor_degrees`
--
create table `doctor_degrees` (
                              `doctor_id` bigint not null,
                              `degrees` varchar(255) default null,
                              key `doctor_degrees_doctor_id` (`doctor_id`),
                              constraint `doctor_degrees_doctor_id` foreign key (`doctor_id`) references `doctor` (`id`)
) ;


--
-- table structure for table `doctor_specialities`
--
create table `doctor_specialities` (
                        `doctor_id` bigint not null,
                        `specialities` varchar(255) default null,
                        key `doctor_specialities_doctor_id` (`doctor_id`),
                        constraint `doctor_specialities_doctor_id` foreign key (`doctor_id`) references `doctor` (`id`)
) ;


--
-- table structure for table `dr_appointment_bill`
--
create table `dr_appointment_bill` (
            `id` bigint not null auto_increment,
            `created_at` datetime(6) default null,
            `discount` double not null,
            `dr_time` time not null,
            `fee` double not null,
            `final_fee` double not null,
            `type` varchar(255) not null,
            `created_by_id` bigint default null,
            `org_dr_id` bigint default null,
            `org_id` bigint default null,
            `patient_id` bigint default null,
            primary key (`id`),
            key `dr_appointment_bill_created_by_id` (`created_by_id`),
            key `dr_appointment_bill_org_dr_id` (`org_dr_id`),
            key `dr_appointment_bill_org_id` (`org_id`),
            key `dr_appointment_bill_patient_id` (`patient_id`),
            constraint `dr_appointment_bill_org_dr_id` foreign key (`org_dr_id`) references `org_doctor` (`id`),
            constraint `dr_appointment_bill_patient_id` foreign key (`patient_id`) references `patient` (`id`),
            constraint `dr_appointment_bill_org_id` foreign key (`org_id`) references `organization` (`id`),
            constraint `dr_appointment_bill_created_by_id` foreign key (`created_by_id`) references `app_user` (`id`)
) ;


--
-- table structure for table `medicine`
--
create table `medicine` (
                            `id` bigint not null auto_increment,
                            `formulation` varchar(255) default null,
                            `generic_name` varchar(255) default null,
                            `name` varchar(255) default null,
                            `price` double not null,
                            `strength` varchar(255) default null,
                            `vendor` varchar(255) default null,
                            primary key (`id`)
) ;


--
-- table structure for table `org_diagnostic`
--
create table `org_diagnostic` (
           `id` bigint not null auto_increment,
           `price` double not null,
           `diagnostic_id` bigint default null,
           `organization_id` bigint default null,
           primary key (`id`),
           key `org_diagnostic_diagnostic_id` (`diagnostic_id`),
           key `org_diagnostic_organization_id` (`organization_id`),
           constraint `org_diagnostic_diagnostic_id` foreign key (`diagnostic_id`) references `diagnostic` (`id`),
           constraint `org_diagnostic_organization_id` foreign key (`organization_id`) references `organization` (`id`)
);


--
-- table structure for table `org_diagnostic_and_discount`
--
create table `org_diagnostic_and_discount` (
               `id` bigint not null auto_increment,
               `discount` tinyint not null,
               `invoice_price` double default null,
               `org_diagnostic_id` bigint default null,
               primary key (`id`),
               key `odad_org_diagnostic_id` (`org_diagnostic_id`),
               constraint `odad_org_diagnostic_id` foreign key (`org_diagnostic_id`) references `org_diagnostic` (`id`)
);


--
-- table structure for table `org_doctor`
--
create table `org_doctor` (
                           `id` bigint not null auto_increment,
                           `consultation_fee` double not null,
                           `followup_fee` double not null,
                           `report_fee` double not null,
                           `app_user_id` bigint default null,
                           `doctor_id` bigint default null,
                           `org_id` bigint default null,
                           primary key (`id`),
                           key `org_doctor_app_user_id` (`app_user_id`),
                           key `org_doctor_doctor_id` (`doctor_id`),
                           key `org_doctor_org_id` (`org_id`),
                           constraint `org_doctor_doctor_id` foreign key (`doctor_id`) references `doctor` (`id`),
                           constraint `org_doctor_org_id` foreign key (`org_id`) references `organization` (`id`),
                           constraint `org_doctor_app_user_id` foreign key (`app_user_id`) references `app_user` (`id`)
);


--
-- table structure for table `org_doctor_available_times`
--
create table `org_doctor_available_times` (
                          `org_doctor_id` bigint not null,
                          `available_times` varchar(255) default null,
                          key `odat_org_doctor_id` (`org_doctor_id`),
                          constraint `odat_org_doctor_id` foreign key (`org_doctor_id`) references `org_doctor` (`id`)
);


--
-- table structure for table `org_medicine`
--
create table `org_medicine` (
             `id` bigint not null auto_increment,
             `medicine_id` bigint default null,
             `organization_id` bigint default null,
             primary key (`id`),
             key `org_medicine_medicine_id` (`medicine_id`),
             key `org_medicine_organization_id` (`organization_id`),
             constraint `org_medicine_organization_id` foreign key (`organization_id`) references `organization` (`id`),
             constraint `org_medicine_medicine_id` foreign key (`medicine_id`) references `medicine` (`id`)
);


--
-- table structure for table `organization`
--
create table `organization` (
                                 `id` bigint not null auto_increment,
                                 `address` varchar(255) default null,
                                 `email` varchar(255) default null,
                                 `name` varchar(255) default null,
                                 `phone` varchar(255) default null,
                                 `website` varchar(255) default null,
                                 primary key (`id`),
                                 unique key `organization_email` (`email`),
                                 unique key `organization_name` (`name`),
                                 unique key `organization_phone` (`phone`),
                                 unique key `organization_website` (`website`)
) ;


--
-- table structure for table `patient`
--
create table `patient` (
                           `id` bigint not null auto_increment,
                           `age` tinyint not null,
                           `email` varchar(255) default null,
                           `gender` varchar(255) default null,
                           `name` varchar(255) default null,
                           `phone` varchar(255) default null,
                           primary key (`id`),
                           unique key `patient_email` (`email`),
                           unique key `patient_phone` (`phone`)
) ;


--
-- table structure for table `pharmacy_bill`
--
create table `pharmacy_bill` (
          `id` bigint not null auto_increment,
          `created_at` datetime(6) default null,
          `discount` double not null,
          `final_bill` double not null,
          `total_bill` double not null,
          `created_by_id` bigint default null,
          `organization_id` bigint not null,
          `patient_id` bigint not null,
          primary key (`id`),
          key `pharmacy_bill_created_by_id` (`created_by_id`),
          key `pharmacy_bill_organization_id` (`organization_id`),
          key `pharmacy_bill_patient_id` (`patient_id`),
          constraint `pharmacy_bill_organization_id` foreign key (`organization_id`) references `organization` (`id`),
          constraint `pharmacy_bill_created_by_id` foreign key (`created_by_id`) references `app_user` (`id`),
          constraint `pharmacy_bill_patient_id` foreign key (`patient_id`) references `patient` (`id`)
);


--
-- table structure for table `pharmacy_bill_med_quantities`
--
create table `pharmacy_bill_med_quantities` (
                `pharmacy_bill_id` bigint not null,
                `med_quantities` int default null,
                key `pbmq_pharmacy_bill_id` (`pharmacy_bill_id`),
                constraint `pbmq_pharmacy_bill_id` foreign key (`pharmacy_bill_id`) references `pharmacy_bill` (`id`)
) ;


--
-- table structure for table `pharmacy_bill_medicines`
--
create table `pharmacy_bill_medicines`
(
    `pharmacy_bill_id` bigint not null,
    `medicines_id`     bigint not null,
    key `pharmacy_bill_medicines_medicines_id` (`medicines_id`),
    key `pharmacy_bill_medicines_pharmacy_bill_id` (`pharmacy_bill_id`),
    constraint `pharmacy_bill_medicines_pharmacy_bill_id` foreign key (`pharmacy_bill_id`) references `pharmacy_bill` (`id`),
    constraint `pharmacy_bill_medicines_medicines_id` foreign key (`medicines_id`) references `medicine` (`id`)
);



/*!40101 set sql_mode=@old_sql_mode */;
/*!40014 set foreign_key_checks=@old_foreign_key_checks */;
/*!40014 set unique_checks=@old_unique_checks */;
/*!40111 set sql_notes=@old_sql_notes */;

