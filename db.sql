/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - publiccomplaintsorting
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`publiccomplaintsorting` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `publiccomplaintsorting`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add department_table',7,'add_department_table'),
(26,'Can change department_table',7,'change_department_table'),
(27,'Can delete department_table',7,'delete_department_table'),
(28,'Can view department_table',7,'view_department_table'),
(29,'Can add emg_table',8,'add_emg_table'),
(30,'Can change emg_table',8,'change_emg_table'),
(31,'Can delete emg_table',8,'delete_emg_table'),
(32,'Can view emg_table',8,'view_emg_table'),
(33,'Can add ert_table',9,'add_ert_table'),
(34,'Can change ert_table',9,'change_ert_table'),
(35,'Can delete ert_table',9,'delete_ert_table'),
(36,'Can view ert_table',9,'view_ert_table'),
(37,'Can add login_table',10,'add_login_table'),
(38,'Can change login_table',10,'change_login_table'),
(39,'Can delete login_table',10,'delete_login_table'),
(40,'Can view login_table',10,'view_login_table'),
(41,'Can add user_table',11,'add_user_table'),
(42,'Can change user_table',11,'change_user_table'),
(43,'Can delete user_table',11,'delete_user_table'),
(44,'Can view user_table',11,'view_user_table'),
(45,'Can add request_table',12,'add_request_table'),
(46,'Can change request_table',12,'change_request_table'),
(47,'Can delete request_table',12,'delete_request_table'),
(48,'Can view request_table',12,'view_request_table'),
(49,'Can add officer_table',13,'add_officer_table'),
(50,'Can change officer_table',13,'change_officer_table'),
(51,'Can delete officer_table',13,'delete_officer_table'),
(52,'Can view officer_table',13,'view_officer_table'),
(53,'Can add notification_table',14,'add_notification_table'),
(54,'Can change notification_table',14,'change_notification_table'),
(55,'Can delete notification_table',14,'delete_notification_table'),
(56,'Can view notification_table',14,'view_notification_table'),
(57,'Can add location_table',15,'add_location_table'),
(58,'Can change location_table',15,'change_location_table'),
(59,'Can delete location_table',15,'delete_location_table'),
(60,'Can view location_table',15,'view_location_table'),
(61,'Can add feedback_table',16,'add_feedback_table'),
(62,'Can change feedback_table',16,'change_feedback_table'),
(63,'Can delete feedback_table',16,'delete_feedback_table'),
(64,'Can view feedback_table',16,'view_feedback_table'),
(65,'Can add complaint_table',17,'add_complaint_table'),
(66,'Can change complaint_table',17,'change_complaint_table'),
(67,'Can delete complaint_table',17,'delete_complaint_table'),
(68,'Can view complaint_table',17,'view_complaint_table'),
(69,'Can add chat_table',18,'add_chat_table'),
(70,'Can change chat_table',18,'change_chat_table'),
(71,'Can delete chat_table',18,'delete_chat_table'),
(72,'Can view chat_table',18,'view_chat_table'),
(73,'Can add action_table',19,'add_action_table'),
(74,'Can change action_table',19,'change_action_table'),
(75,'Can delete action_table',19,'delete_action_table'),
(76,'Can view action_table',19,'view_action_table');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$eqfMIBFPeCYczGAVG1Giep$kS82UozYYjiBPTHfeGFHsRqSsU7Ofo9CJXpht3Dnl5I=','2024-02-24 11:55:10.317741',1,'admin','','','admin@gmail.com',1,1,'2024-01-30 10:25:56.720854');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(19,'pcs1app','action_table'),
(18,'pcs1app','chat_table'),
(17,'pcs1app','complaint_table'),
(7,'pcs1app','department_table'),
(8,'pcs1app','emg_table'),
(9,'pcs1app','ert_table'),
(16,'pcs1app','feedback_table'),
(15,'pcs1app','location_table'),
(10,'pcs1app','login_table'),
(14,'pcs1app','notification_table'),
(13,'pcs1app','officer_table'),
(12,'pcs1app','request_table'),
(11,'pcs1app','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-01-18 10:03:53.813602'),
(2,'auth','0001_initial','2024-01-18 10:03:54.445314'),
(3,'admin','0001_initial','2024-01-18 10:03:54.586402'),
(4,'admin','0002_logentry_remove_auto_add','2024-01-18 10:03:54.595413'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-01-18 10:03:54.608411'),
(6,'contenttypes','0002_remove_content_type_name','2024-01-18 10:03:54.697119'),
(7,'auth','0002_alter_permission_name_max_length','2024-01-18 10:03:54.751658'),
(8,'auth','0003_alter_user_email_max_length','2024-01-18 10:03:54.779174'),
(9,'auth','0004_alter_user_username_opts','2024-01-18 10:03:54.791388'),
(10,'auth','0005_alter_user_last_login_null','2024-01-18 10:03:54.851295'),
(11,'auth','0006_require_contenttypes_0002','2024-01-18 10:03:54.857365'),
(12,'auth','0007_alter_validators_add_error_messages','2024-01-18 10:03:54.866187'),
(13,'auth','0008_alter_user_username_max_length','2024-01-18 10:03:54.932735'),
(14,'auth','0009_alter_user_last_name_max_length','2024-01-18 10:03:55.000299'),
(15,'auth','0010_alter_group_name_max_length','2024-01-18 10:03:55.020230'),
(16,'auth','0011_update_proxy_permissions','2024-01-18 10:03:55.035266'),
(17,'auth','0012_alter_user_first_name_max_length','2024-01-18 10:03:55.093861'),
(18,'pcs1app','0001_initial','2024-01-18 10:03:56.276980'),
(19,'sessions','0001_initial','2024-01-18 10:03:56.324985'),
(20,'pcs1app','0002_user_table_phone','2024-01-19 05:28:35.065850'),
(21,'pcs1app','0003_user_table_photo','2024-01-30 09:46:57.780256'),
(22,'pcs1app','0004_alter_notification_table_emg_no','2024-02-10 04:25:32.966317'),
(23,'pcs1app','0005_alter_complaint_table_complaint','2024-02-10 06:46:57.700864'),
(24,'pcs1app','0006_auto_20240223_1110','2024-02-23 05:40:37.826037');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('0ebtgn8yhurgk0sf0no8gfymihyn6lwi','.eJxVjjsOwyAQRO9CHSGDwQsp0-cM1u4CwYkFkj9VlLvHSC6Sdt7M07zFiPuWx32NyzgFcRVKXH4zQn7F0kB4YnlUybVsy0SyVeRJV3mvIc63s_snyLjmYz1o9JyAOmPt4CFSQuUcg45974MDtBa1S4k6NIwamFUgIGcBjAbiQzq3f_7zBbSQOlw:1rcjkz:k_GWta9VnV2izzkcv7uJMFLqRpUlLWVouVHNxGsD7U8','2024-03-06 10:23:17.425949'),
('4dh2cnt8ypxucjrbhy9w1emxvnhn7gby','.eJxVjrEOgzAQQ_8lM4rIQXKhY_d-A7q7JIUWgRRgqvrvJRVDu1n2s-WX6mnfhn5fY-7HoC7KqOrXY5JnnEsQHjTfFy3LvOWRdUH0ma76toQ4XU_2b2CgdTjaDqiThFy31roOIycy3gtCbJoueCRrCXxKXFMrBChiAiN7i9gCshyjU_lnKiXfo85WKuaiAN4fd5c_qg:1rdqcY:_johKztHvfwhxLQFFHjh64_6xFQYSQlxzqQhgrxFl9s','2024-03-09 11:55:10.322865'),
('db37hgd84ikfct454yzkal6ztsvenjp1','.eJxVjsEOgjAQRP-lZ9PQpWWLR-9-A9ndtoKSNqFwMv67kHDQ67yZl3mrgbZ1HLYal2EK6qqMuvxmTPKK-QDhSflRtJS8LhPro6JPWvW9hDjfzu6fYKQ67usOqJeE3Fjnuh4jJzLeC0Js2z54JOcIfErckBUCFDGBkb1DtIAsu3Q-_gF8vu6-Ooc:1rbch3:d3C-RiOoXPlWxMQfEGzIcC4cg-zJMh0k1WWul40wmEY','2024-03-03 08:38:37.520481'),
('ue90en6v6l9alt19b27fbb9tzw62qfld','.eJxVjjsOwyAQRO9CHSGDwQsp0-cM1u4CwYkFkj9VlLvHSC6Sdt7M07zFiPuWx32NyzgFcRVKXH4zQn7F0kB4YnlUybVsy0SyVeRJV3mvIc63s_snyLjmYz1o9JyAOmPt4CFSQuUcg45974MDtBa1S4k6NIwamFUgIGcBjAbiQzq3f8p-vu7BOok:1rceIy:gky09VU1gY-UrDC7BcpznIq-3YIEXRjPi8GP9ZmGYlg','2024-03-06 04:34:00.574867');

/*Table structure for table `pcs1app_action_table` */

DROP TABLE IF EXISTS `pcs1app_action_table`;

CREATE TABLE `pcs1app_action_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Status` varchar(100) NOT NULL,
  `COMPLAINT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_action_table_COMPLAINT_id_c1d41df4_fk_pcs1app_c` (`COMPLAINT_id`),
  CONSTRAINT `pcs1app_action_table_COMPLAINT_id_c1d41df4_fk_pcs1app_c` FOREIGN KEY (`COMPLAINT_id`) REFERENCES `pcs1app_complaint_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_action_table` */

/*Table structure for table `pcs1app_chat_table` */

DROP TABLE IF EXISTS `pcs1app_chat_table`;

CREATE TABLE `pcs1app_chat_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Message` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `From_id_id` bigint NOT NULL,
  `To_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_chat_table_From_id_id_4de83ea6_fk_pcs1app_login_table_id` (`From_id_id`),
  KEY `pcs1app_chat_table_To_id_id_c35ef974_fk_pcs1app_login_table_id` (`To_id_id`),
  CONSTRAINT `pcs1app_chat_table_From_id_id_4de83ea6_fk_pcs1app_login_table_id` FOREIGN KEY (`From_id_id`) REFERENCES `pcs1app_login_table` (`id`),
  CONSTRAINT `pcs1app_chat_table_To_id_id_c35ef974_fk_pcs1app_login_table_id` FOREIGN KEY (`To_id_id`) REFERENCES `pcs1app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_chat_table` */

insert  into `pcs1app_chat_table`(`id`,`Message`,`Date`,`From_id_id`,`To_id_id`) values 
(23,'hello','2024-02-18',41,40),
(24,'hii','2024-02-18',40,41),
(25,'hello','2024-02-18',41,40),
(29,'GTA5','2024-02-18',41,40),
(30,'kalikka?','2024-02-18',41,40),
(39,'pes kalikka','2024-02-18',40,41),
(40,'how do do','2024-02-18',41,40),
(41,'hi','2024-02-21',22,35),
(42,'hi','2024-02-21',35,22),
(43,'helloooooooooooo','2024-02-21',22,35),
(44,'how are u','2024-02-21',22,35),
(45,'hloooooooooooooooooooooo','2024-02-21',35,22),
(46,'du hj l\nvjjk\n','2024-02-21',35,22),
(47,'rtyuijol','2024-02-21',22,35),
(48,'ertyuil;','2024-02-21',22,35),
(49,'tfyguj;o[l','2024-02-21',22,35),
(50,'ahshndnf','2024-02-23',35,22),
(51,'kzxcgh','2024-02-23',22,35),
(52,'chaya kudicjo','2024-02-23',35,22),
(54,'oo','2024-02-23',22,35),
(67,'po naye','2024-02-23',35,22),
(68,'hi','2024-02-23',22,35),
(69,'vannu\n','2024-02-23',35,22),
(70,' a d aaa vannu','2024-02-23',35,22),
(71,'vvfihdhx','2024-02-23',35,22),
(72,'','2024-02-23',35,22),
(73,'','2024-02-23',35,22),
(74,'','2024-02-23',35,22),
(75,'','2024-02-23',35,22),
(76,'','2024-02-23',35,22),
(77,'hi','2024-02-23',48,22),
(78,'mattanm\n','2024-02-23',48,22),
(79,'haaa','2024-02-23',48,22),
(80,'','2024-02-23',48,22),
(81,'tj','2024-02-24',22,48);

/*Table structure for table `pcs1app_complaint_table` */

DROP TABLE IF EXISTS `pcs1app_complaint_table`;

CREATE TABLE `pcs1app_complaint_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Complaint` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `Latitude` varchar(100) NOT NULL,
  `Longitude` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `ID_id` bigint NOT NULL,
  `User_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_complaint_ta_ID_id_f7fbffc8_fk_pcs1app_d` (`ID_id`),
  KEY `pcs1app_complaint_ta_User_id_d3680298_fk_pcs1app_u` (`User_id`),
  CONSTRAINT `pcs1app_complaint_ta_ID_id_f7fbffc8_fk_pcs1app_d` FOREIGN KEY (`ID_id`) REFERENCES `pcs1app_department_table` (`id`),
  CONSTRAINT `pcs1app_complaint_ta_User_id_d3680298_fk_pcs1app_u` FOREIGN KEY (`User_id`) REFERENCES `pcs1app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_complaint_table` */

insert  into `pcs1app_complaint_table`(`id`,`Complaint`,`Date`,`Latitude`,`Longitude`,`Status`,`ID_id`,`User_id`) values 
(50,'medical_waste_MP8aJ2F.jpg','2024-02-24','11.4540408','75.7949235','pending',9,10),
(51,'images (69)_AqUBhHy.jpeg','2024-02-24','11.45416263','75.79492498','pending',4,4),
(52,'sample_pt4Lgia.png','2024-02-24','','','pending',4,4),
(53,'sample_9Oca8HP.png','2024-02-24','','','pending',4,4),
(54,'sample_r3db7ax.png','2024-02-24','','','pending',8,4),
(55,'sample_5r3qvHa.png','2024-02-24','','','pending',4,4),
(56,'sample_xQwLioM.png','2024-02-24','','','pending',4,4),
(57,'sample_SHRE5m4.png','2024-02-24','11.25773312','75.78453437','pending',9,10),
(58,'sample_hb5Z4g6.png','2024-02-24','11.2577576','75.7845289','pending',8,4),
(59,'sample_fn6hV2H.png','2024-02-24','11.25769197','75.78454664','pending',4,10),
(60,'medical_waste_b3TKoDD.jpg','2024-02-24','11.25769286','75.78454402','pending',9,10),
(61,'sample_hDW1y3m.png','2024-02-24','11.25767504','75.78454901','pending',7,10),
(62,'sample_WHEgJSd.png','2024-02-24','11.2577353','75.7845478','pending',7,10),
(63,'sample_8jJPUDi.png','2024-02-24','11.25770482','75.7845477','pending',10,10),
(64,'sample_DnGCnjP.png','2024-02-24','11.25770405','75.78454824','pending',4,10),
(65,'sample_s1SRwIe.png','2024-02-24','11.25775673','75.78450638','vbnm,./',4,11);

/*Table structure for table `pcs1app_department_table` */

DROP TABLE IF EXISTS `pcs1app_department_table`;

CREATE TABLE `pcs1app_department_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Detaile` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_department_table` */

insert  into `pcs1app_department_table`(`id`,`Name`,`Detaile`) values 
(4,'WATER AUTHORITY',' nothing'),
(7,'KSEB','Nothing'),
(8,'PWD','Nothing'),
(9,'MUNICIPALITY','no'),
(10,'EMERGENCY UNIT','nothing');

/*Table structure for table `pcs1app_emg_table` */

DROP TABLE IF EXISTS `pcs1app_emg_table`;

CREATE TABLE `pcs1app_emg_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `No` bigint NOT NULL,
  `Date` date NOT NULL,
  `Officer_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_emg_table_Officer_id_605c8967_fk_pcs1app_o` (`Officer_id`),
  CONSTRAINT `pcs1app_emg_table_Officer_id_605c8967_fk_pcs1app_o` FOREIGN KEY (`Officer_id`) REFERENCES `pcs1app_officer_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_emg_table` */

/*Table structure for table `pcs1app_ert_table` */

DROP TABLE IF EXISTS `pcs1app_ert_table`;

CREATE TABLE `pcs1app_ert_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Place` varchar(20) NOT NULL,
  `Post` varchar(20) NOT NULL,
  `Pin` int NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Phone1` bigint NOT NULL,
  `Phone2` bigint NOT NULL,
  `type` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_ert_table_LOGIN_id_4022e880_fk_pcs1app_login_table_id` (`LOGIN_id`),
  CONSTRAINT `pcs1app_ert_table_LOGIN_id_4022e880_fk_pcs1app_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `pcs1app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_ert_table` */

insert  into `pcs1app_ert_table`(`id`,`Name`,`Place`,`Post`,`Pin`,`Email`,`Phone1`,`Phone2`,`type`,`LOGIN_id`) values 
(8,'b','','asf',324,'adfs',2354,235234,'AMBULANCE',22),
(9,'admi',' qwee','qww',2233,'arjuljdt@gmail.com',919072097394,987654320,'FIRE',23),
(10,'sivajith','kochi','kochi',673328,'sivajith@gmail.com',9895972156,8714537830,'POLICE',40);

/*Table structure for table `pcs1app_feedback_table` */

DROP TABLE IF EXISTS `pcs1app_feedback_table`;

CREATE TABLE `pcs1app_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Feedback` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `User_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_feedback_table_User_id_187501ab_fk_pcs1app_user_table_id` (`User_id`),
  CONSTRAINT `pcs1app_feedback_table_User_id_187501ab_fk_pcs1app_user_table_id` FOREIGN KEY (`User_id`) REFERENCES `pcs1app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_feedback_table` */

insert  into `pcs1app_feedback_table`(`id`,`Feedback`,`Date`,`User_id`) values 
(1,'aeaesee','2024-01-18',1),
(2,'er','2024-01-09',2),
(3,'gghbnnb','2024-02-09',4),
(4,'v','2024-02-09',4),
(5,'bdbfbfbg','2024-02-10',4),
(6,'ghhbb','2024-02-10',4),
(7,'ggg','2024-02-10',4),
(8,'bfbf','2024-02-10',4),
(9,'ah g','2024-02-10',4),
(10,'ah g','2024-02-10',4),
(11,'hdhdbff','2024-02-10',4),
(12,'ndndjd','2024-02-10',4),
(17,'ndn','2024-02-10',4),
(18,'wtyu','2024-02-10',4),
(19,'wtyu','2024-02-10',4),
(20,'wtyuhrhbr','2024-02-10',4),
(21,'hdhdd','2024-02-10',4),
(22,'gdgdg','2024-02-16',4),
(23,'hii','2024-02-18',4),
(24,'fun','2024-02-24',11);

/*Table structure for table `pcs1app_location_table` */

DROP TABLE IF EXISTS `pcs1app_location_table`;

CREATE TABLE `pcs1app_location_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Latitude` varchar(100) NOT NULL,
  `Longitude` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_location_tab_LOGIN_id_0365470f_fk_pcs1app_l` (`LOGIN_id`),
  CONSTRAINT `pcs1app_location_tab_LOGIN_id_0365470f_fk_pcs1app_l` FOREIGN KEY (`LOGIN_id`) REFERENCES `pcs1app_login_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_location_table` */

/*Table structure for table `pcs1app_login_table` */

DROP TABLE IF EXISTS `pcs1app_login_table`;

CREATE TABLE `pcs1app_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_login_table` */

insert  into `pcs1app_login_table`(`id`,`Username`,`Password`,`Type`) values 
(1,'admin','8','Admin'),
(8,'pcs','123','officer'),
(9,'officer','officer','officer'),
(15,'arjul','1','officer'),
(21,'a','66','officer'),
(22,'b','2','ert'),
(23,'admi','99','ert'),
(24,'ad','99','officer'),
(28,'adm','77','officer'),
(29,'adm','77','officer'),
(34,'user','user','user'),
(35,'abhishek','1234','user'),
(38,'saud','Saud@123','officer'),
(40,'sivajith','Sivajith@123','ert'),
(41,'sayooj','1234','user'),
(43,'ajal','Ajal@123','officer'),
(45,'fuad','12','officer'),
(46,'r','Rafid@123','user'),
(47,'rafid','Rafid@123','user'),
(48,'arjul','12345','user'),
(49,'sayooj','4321','user'),
(50,'a','1234','officer');

/*Table structure for table `pcs1app_notification_table` */

DROP TABLE IF EXISTS `pcs1app_notification_table`;

CREATE TABLE `pcs1app_notification_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Notification` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `EMG_no_id` bigint NOT NULL,
  `ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_notification_EMG_no_id_75e1fb94_fk_pcs1app_e` (`EMG_no_id`),
  KEY `pcs1app_notification_ID_id_d89e0f9a_fk_pcs1app_u` (`ID_id`),
  CONSTRAINT `pcs1app_notification_ID_id_d89e0f9a_fk_pcs1app_u` FOREIGN KEY (`ID_id`) REFERENCES `pcs1app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_notification_table` */

insert  into `pcs1app_notification_table`(`id`,`Notification`,`Date`,`EMG_no_id`,`ID_id`) values 
(7,'ggg','2024-02-10',8,4),
(8,'ggg','2024-02-10',8,4),
(13,'aha','2024-02-10',8,4),
(14,'aha','2024-02-10',8,4),
(15,'dgb','2024-02-10',8,4),
(16,'hdhd','2024-02-10',8,4),
(17,'bdhd','2024-02-13',8,4),
(18,'ggv','2024-02-13',8,4),
(19,'test','2024-02-18',8,4),
(20,'fyh','2024-02-18',8,4);

/*Table structure for table `pcs1app_officer_table` */

DROP TABLE IF EXISTS `pcs1app_officer_table`;

CREATE TABLE `pcs1app_officer_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Place` varchar(20) NOT NULL,
  `Post` varchar(20) NOT NULL,
  `Pin` int NOT NULL,
  `Phone` bigint NOT NULL,
  `Email` varchar(20) NOT NULL,
  `DEPARTMENT_id` bigint NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_officer_tabl_DEPARTMENT_id_e8d018f1_fk_pcs1app_d` (`DEPARTMENT_id`),
  KEY `pcs1app_officer_tabl_LOGIN_id_323e8bae_fk_pcs1app_l` (`LOGIN_id`),
  CONSTRAINT `pcs1app_officer_tabl_DEPARTMENT_id_e8d018f1_fk_pcs1app_d` FOREIGN KEY (`DEPARTMENT_id`) REFERENCES `pcs1app_department_table` (`id`),
  CONSTRAINT `pcs1app_officer_tabl_LOGIN_id_323e8bae_fk_pcs1app_l` FOREIGN KEY (`LOGIN_id`) REFERENCES `pcs1app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_officer_table` */

insert  into `pcs1app_officer_table`(`id`,`Name`,`Place`,`Post`,`Pin`,`Phone`,`Email`,`DEPARTMENT_id`,`LOGIN_id`) values 
(9,'serty','qwee','dhj',122345,8589833761,'m@gmail.com',4,38),
(10,'arjul arjul','kozhikode','kozhikode',112233,9072097394,'arju@gmail.com',4,43),
(11,'fuad','kozhikode','kozhikode',123456,8959721563,'Niha00@gmail.com',7,45),
(12,'ajal','calicut','calicut',673312,8589833761,'asm@gmail.com',4,50);

/*Table structure for table `pcs1app_request_table` */

DROP TABLE IF EXISTS `pcs1app_request_table`;

CREATE TABLE `pcs1app_request_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Time` time(6) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Request` varchar(20) NOT NULL,
  `ERT_id` bigint NOT NULL,
  `ID_id` bigint NOT NULL,
  `Latitude` varchar(100) NOT NULL,
  `Longitude` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_request_table_ERT_id_0d274441_fk_pcs1app_ert_table_id` (`ERT_id`),
  KEY `pcs1app_request_table_ID_id_6778a800_fk_pcs1app_user_table_id` (`ID_id`),
  CONSTRAINT `pcs1app_request_table_ERT_id_0d274441_fk_pcs1app_ert_table_id` FOREIGN KEY (`ERT_id`) REFERENCES `pcs1app_ert_table` (`id`),
  CONSTRAINT `pcs1app_request_table_ID_id_6778a800_fk_pcs1app_user_table_id` FOREIGN KEY (`ID_id`) REFERENCES `pcs1app_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_request_table` */

insert  into `pcs1app_request_table`(`id`,`Date`,`Time`,`Status`,`Request`,`ERT_id`,`ID_id`,`Latitude`,`Longitude`) values 
(1,'2024-02-18','12:51:21.188302','ok','no',8,1,'-8968','-8968'),
(2,'2024-01-30','14:43:07.758458','fghj','p',8,1,'-8968','-8968'),
(3,'2024-02-18','12:51:57.809351','ok','gdgry',8,4,'-8968','-8968'),
(4,'2024-02-18','12:45:15.430628','o','hello',9,4,'-8968','-8968'),
(5,'2024-02-18','12:45:27.524134','o','hi',8,4,'-8968','-8968'),
(6,'2024-02-23','10:54:39.489769','o','vh',9,4,'-8968','-8968'),
(7,'2024-02-23','10:55:05.703866','o','help',8,4,'-8968','-8968'),
(8,'2024-02-23','11:05:04.646360','o','help',8,4,'-8968','-8968'),
(9,'2024-02-23','11:15:23.690513','o','duh hfhf',8,4,'',''),
(10,'2024-02-23','11:15:41.018602','o','duh hfhfduhdhf',8,4,'',''),
(11,'2024-02-23','11:16:23.257495','o','duh hfhfduhdhf',8,4,'',''),
(12,'2024-02-23','11:16:27.728700','o','duh hfhfduhdhf',8,4,'',''),
(13,'2024-02-23','11:23:51.476146','o','vvh',8,4,'11.25761554','75.78466675'),
(14,'2024-02-23','15:27:20.301033','o','',10,4,'',''),
(15,'2024-02-23','15:27:21.656495','o','',10,4,'',''),
(16,'2024-02-23','15:27:21.664507','o','',10,4,'',''),
(17,'2024-02-23','15:27:22.280282','o','',10,4,'',''),
(18,'2024-02-24','17:04:39.608976','o','help',8,10,'11.25775673','75.78450638'),
(19,'2024-02-24','17:08:07.150934','hgfhgcf','help',8,10,'11.25775673','75.78450638'),
(20,'2024-02-24','17:10:51.111813','ascbkjds','help',8,10,'11.25775673','75.78450638'),
(21,'2024-02-24','17:11:08.780774','hjgvhjg','gjj',8,10,'11.25775673','75.78450638'),
(22,'2024-02-24','17:24:32.100585','sdfgb','hhhh',8,11,'11.2577164','75.78456716');

/*Table structure for table `pcs1app_user_table` */

DROP TABLE IF EXISTS `pcs1app_user_table`;

CREATE TABLE `pcs1app_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Place` varchar(20) NOT NULL,
  `Post` varchar(20) NOT NULL,
  `Pin` int NOT NULL,
  `Email` varchar(20) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `Phone` bigint NOT NULL,
  `Photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pcs1app_user_table_LOGIN_id_1ddf3f79_fk_pcs1app_login_table_id` (`LOGIN_id`),
  CONSTRAINT `pcs1app_user_table_LOGIN_id_1ddf3f79_fk_pcs1app_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `pcs1app_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pcs1app_user_table` */

insert  into `pcs1app_user_table`(`id`,`Name`,`Place`,`Post`,`Pin`,`Email`,`LOGIN_id`,`Phone`,`Photo`) values 
(1,'fdfh','fs','fs',32,'dsgv',1,234,'WIN_20240127_14_45_47_Pro.jpg'),
(2,'qw','we','er',23,'dfg',8,234,'WIN_20240127_14_45_47_Pro.jpg'),
(3,'er','er','tyu',345,'rtyu',34,34567,'WIN_20240127_14_45_47_Pro.jpg'),
(4,'abhishek','Kozhikode','Kozhikode ',123456,'arjuljdt@gmail.com',35,8590377624,'WIN_20240127_14_45_47_Pro.jpg'),
(6,'sayooj','Kozhikode','Kozhikode',673323,'jithck83@gmail.com',41,8589833761,'IMG_202310284_072622865_McN3Qwr.png'),
(8,'rafid','Kozhikode','Kozhikode',123456,'shiv@gmail.com',46,9526043049,'IMG-20240222-WA0120.jpg'),
(9,'rafid','Kozhikode','Kozhikode',123456,'shiv@gmail.com',47,9526043049,'IMG-20240222-WA0120_JGKNhdE.jpg'),
(10,'arjul','kozhikode','kozhikode',673322,'arjul3@gmail.com',48,9046743420,'IMG-20240221-WA0064.jpg'),
(11,'sayooj ','Kozhikode ','ulliyeri',673323,'sayoojsd4@gmail. com',49,7306756598,'images (39)_j5TaR7f.jpeg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
