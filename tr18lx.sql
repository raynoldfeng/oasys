/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : tr18lx

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 02/03/2018 14:28:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aoa_attachment_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_attachment_list`;
CREATE TABLE `aoa_attachment_list` (
  `attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attachment_name` varchar(255) DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `attachment_shuffix` varchar(255) DEFAULT NULL,
  `attachment_size` varchar(255) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_attachment_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_attends_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_attends_list`;
CREATE TABLE `aoa_attends_list` (
  `attends_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attends_ip` varchar(20) DEFAULT NULL,
  `attends_remark` varchar(20) DEFAULT NULL,
  `attends_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `attends_user_id` bigint(20) DEFAULT NULL,
  `attend_hmtime` varchar(255) DEFAULT NULL,
  `week_ofday` varchar(255) DEFAULT NULL,
  `holiday_days` double(255,0) DEFAULT '0',
  `holiday_start` date DEFAULT NULL,
  PRIMARY KEY (`attends_id`),
  KEY `FKaxgqsm98npnl1rxysh9upfjee` (`attends_user_id`),
  CONSTRAINT `FKaxgqsm98npnl1rxysh9upfjee` FOREIGN KEY (`attends_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_attends_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_bursement
-- ----------------------------
DROP TABLE IF EXISTS `aoa_bursement`;
CREATE TABLE `aoa_bursement` (
  `bursement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `all_money` double DEFAULT NULL,
  `allinvoices` int(11) DEFAULT NULL,
  `burse_time` datetime DEFAULT NULL,
  `financial_advice` varchar(255) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `operation_name` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `user_name` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bursement_id`),
  KEY `FKt3xu5y23deh0mtqkfk3ly6219` (`operation_name`),
  KEY `FK666vswh4nl3voq8qalu73v2sq` (`pro_id`),
  KEY `FKgnqp4eax31sh7mn3lt2su7olr` (`user_name`),
  CONSTRAINT `FK666vswh4nl3voq8qalu73v2sq` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`),
  CONSTRAINT `FKgnqp4eax31sh7mn3lt2su7olr` FOREIGN KEY (`user_name`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKt3xu5y23deh0mtqkfk3ly6219` FOREIGN KEY (`operation_name`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_bursement
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_catalog
-- ----------------------------
DROP TABLE IF EXISTS `aoa_catalog`;
CREATE TABLE `aoa_catalog` (
  `catalog_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `catalog_name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `cata_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`catalog_id`),
  KEY `FKbsk5nkjlqmd8j9rmkarse6j1x` (`cata_user_id`),
  CONSTRAINT `FKbsk5nkjlqmd8j9rmkarse6j1x` FOREIGN KEY (`cata_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_catalog
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_comment_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_comment_list`;
CREATE TABLE `aoa_comment_list` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `comment_user_id` bigint(20) DEFAULT NULL,
  `reply_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK2k00kkfhh93949ybod7qn56ax` (`comment_user_id`),
  KEY `FKeopff14rxco5thbwwlu7exglo` (`reply_id`),
  CONSTRAINT `FK2k00kkfhh93949ybod7qn56ax` FOREIGN KEY (`comment_user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKeopff14rxco5thbwwlu7exglo` FOREIGN KEY (`reply_id`) REFERENCES `aoa_reply_list` (`reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_comment_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_dept
-- ----------------------------
DROP TABLE IF EXISTS `aoa_dept`;
CREATE TABLE `aoa_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dept_addr` varchar(255) DEFAULT NULL,
  `dept_fax` varchar(255) DEFAULT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  `dept_tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `deptmanager` bigint(20) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_dept
-- ----------------------------
BEGIN;
INSERT INTO `aoa_dept` VALUES (1, '八楼', NULL, '总经办', '888888888', 'boss@boss.com', 1, '2017-11-15 22:50:05', '2017-11-07 22:50:11');
COMMIT;

-- ----------------------------
-- Table structure for aoa_user_login_record
-- ----------------------------
DROP TABLE IF EXISTS `aoa_user_login_record`;
CREATE TABLE `aoa_user_login_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) DEFAULT NULL,
  `ip_addr` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `FKks6qpqj3ss4e4timjt0xok1p0` (`user_id`),
  CONSTRAINT `FKks6qpqj3ss4e4timjt0xok1p0` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4;


-- ----------------------------
-- Table structure for aoa_detailsburse
-- ----------------------------
DROP TABLE IF EXISTS `aoa_detailsburse`;
CREATE TABLE `aoa_detailsburse` (
  `detailsburse_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descript` varchar(255) DEFAULT NULL,
  `detailmoney` double NOT NULL,
  `invoices` int(11) DEFAULT NULL,
  `produce_time` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `bursment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`detailsburse_id`),
  KEY `FKi02w0bghxr73fsc5sbpeyqdnn` (`bursment_id`),
  CONSTRAINT `FKi02w0bghxr73fsc5sbpeyqdnn` FOREIGN KEY (`bursment_id`) REFERENCES `aoa_bursement` (`bursement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_detailsburse
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_director
-- ----------------------------
DROP TABLE IF EXISTS `aoa_director`;
CREATE TABLE `aoa_director` (
  `director_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `company_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image_path` int(11) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`director_id`),
  KEY `FKi6pfdnqhbc6js940e2o1vape5` (`user_id`),
  CONSTRAINT `FKi6pfdnqhbc6js940e2o1vape5` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_director
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_director_users
-- ----------------------------
DROP TABLE IF EXISTS `aoa_director_users`;
CREATE TABLE `aoa_director_users` (
  `director_users_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `catelog_name` varchar(255) DEFAULT NULL,
  `is_handle` int(11) DEFAULT NULL,
  `director_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `share_user_id` bigint(20) DEFAULT NULL,
  `sharetime` datetime DEFAULT NULL,
  PRIMARY KEY (`director_users_id`),
  KEY `FK675oqfmv4kx9w6bgi9rgsb8nw` (`director_id`),
  KEY `FK7hq4xk2ja9eka4210qkqq03hi` (`user_id`),
  KEY `FKibwkjvmp9383ltkfew1kyy6ny` (`share_user_id`),
  CONSTRAINT `FK675oqfmv4kx9w6bgi9rgsb8nw` FOREIGN KEY (`director_id`) REFERENCES `aoa_director` (`director_id`),
  CONSTRAINT `FK7hq4xk2ja9eka4210qkqq03hi` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKibwkjvmp9383ltkfew1kyy6ny` FOREIGN KEY (`share_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_director_users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_discuss_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_discuss_list`;
CREATE TABLE `aoa_discuss_list` (
  `discuss_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attachment_id` int(11) DEFAULT NULL,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `visit_num` int(11) DEFAULT NULL,
  `discuss_user_id` bigint(20) DEFAULT NULL,
  `vote_id` bigint(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`discuss_id`),
  KEY `FKt8hvx0ai5fto20mmxmy2g8j4g` (`discuss_user_id`),
  KEY `FK17yi8arj4vjdr5mm5dhjov10j` (`vote_id`),
  CONSTRAINT `FK17yi8arj4vjdr5mm5dhjov10j` FOREIGN KEY (`vote_id`) REFERENCES `aoa_vote_list` (`vote_id`),
  CONSTRAINT `FKt8hvx0ai5fto20mmxmy2g8j4g` FOREIGN KEY (`discuss_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_discuss_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_evection
-- ----------------------------
DROP TABLE IF EXISTS `aoa_evection`;
CREATE TABLE `aoa_evection` (
  `evection_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `personnel_advice` varchar(255) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`evection_id`),
  KEY `FKql1c10e5u2vefisjqjbu2d5pa` (`pro_id`),
  CONSTRAINT `FKql1c10e5u2vefisjqjbu2d5pa` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_evection
-- ----------------------------
BEGIN;
INSERT INTO `aoa_evection` VALUES (1, 28, 12, NULL, '发发发');
INSERT INTO `aoa_evection` VALUES (2, 28, 21, NULL, NULL);
INSERT INTO `aoa_evection` VALUES (3, 28, 22, NULL, NULL);
INSERT INTO `aoa_evection` VALUES (4, 28, 23, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for aoa_evectionmoney
-- ----------------------------
DROP TABLE IF EXISTS `aoa_evectionmoney`;
CREATE TABLE `aoa_evectionmoney` (
  `evectionmoney_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `financial_advice` varchar(255) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `pro` int(255) DEFAULT NULL,
  PRIMARY KEY (`evectionmoney_id`),
  KEY `FKcpuubnshaf2cg47hns9m0h1dq` (`pro_id`),
  CONSTRAINT `FKcpuubnshaf2cg47hns9m0h1dq` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_evectionmoney
-- ----------------------------
BEGIN;
INSERT INTO `aoa_evectionmoney` VALUES (1, NULL, '去项目支持', 1100, '刘敏', 10, NULL);
INSERT INTO `aoa_evectionmoney` VALUES (2, '批准', '情况属实！！！！', 2800, '刘敏', 11, NULL);
INSERT INTO `aoa_evectionmoney` VALUES (3, NULL, '', 940, '得到', 24, 23);
COMMIT;

-- ----------------------------
-- Table structure for aoa_file_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_file_list`;
CREATE TABLE `aoa_file_list` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_shuffix` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `path_id` bigint(20) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `file_user_id` bigint(20) DEFAULT NULL,
  `file_istrash` bigint(1) unsigned zerofill DEFAULT '0',
  `file_isshare` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `FKfshy9n300pqxjsweo9247jgqs` (`path_id`),
  KEY `FKlj6l9qroivus28aiqluue4bew` (`file_user_id`),
  CONSTRAINT `FKfshy9n300pqxjsweo9247jgqs` FOREIGN KEY (`path_id`) REFERENCES `aoa_file_path` (`path_id`),
  CONSTRAINT `FKlj6l9qroivus28aiqluue4bew` FOREIGN KEY (`file_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for aoa_file_path
-- ----------------------------
DROP TABLE IF EXISTS `aoa_file_path`;
CREATE TABLE `aoa_file_path` (
  `path_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `path_name` varchar(255) DEFAULT NULL,
  `path_user_id` bigint(20) DEFAULT NULL,
  `path_istrash` bigint(20) DEFAULT '0',
  PRIMARY KEY (`path_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_file_path
-- ----------------------------
BEGIN;
INSERT INTO `aoa_file_path` VALUES (1, 0, '根目录', NULL, 0);
INSERT INTO `aoa_file_path` VALUES (6, 1, '罗密欧', 1, 0);
INSERT INTO `aoa_file_path` VALUES (89, 1, '无双', 10, 0);
INSERT INTO `aoa_file_path` VALUES (90, 1, '甄姬', 7, 0);
INSERT INTO `aoa_file_path` VALUES (91, 90, '新建文件夹', 7, 0);
INSERT INTO `aoa_file_path` VALUES (92, 91, '新建文件5夹', 7, 0);
INSERT INTO `aoa_file_path` VALUES (93, 1, '于彤', 13, 0);
COMMIT;

-- ----------------------------
-- Table structure for aoa_holiday
-- ----------------------------
DROP TABLE IF EXISTS `aoa_holiday`;
CREATE TABLE `aoa_holiday` (
  `holiday_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `leave_days` int(11) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  `personnel_advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`holiday_id`),
  KEY `FK1glo2wpb4kuiop1ymjxs0knxj` (`pro_id`),
  CONSTRAINT `FK1glo2wpb4kuiop1ymjxs0knxj` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_holiday
-- ----------------------------
BEGIN;
INSERT INTO `aoa_holiday` VALUES (1, 2, 38, 16, '准假', NULL);
INSERT INTO `aoa_holiday` VALUES (2, 1, 37, 25, 'as电饭锅', 'as电饭锅和');
COMMIT;

-- ----------------------------
-- Table structure for aoa_in_mail_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_in_mail_list`;
CREATE TABLE `aoa_in_mail_list` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mail_content` text,
  `mail_create_time` datetime DEFAULT NULL,
  `mail_file_id` bigint(20) DEFAULT NULL,
  `mail_title` varchar(255) NOT NULL,
  `mail_type` bigint(20) DEFAULT NULL,
  `mail_in_push_user_id` bigint(20) DEFAULT NULL,
  `in_receiver` varchar(255) DEFAULT NULL,
  `mail_status_id` bigint(20) DEFAULT NULL,
  `mail_number_id` bigint(20) DEFAULT NULL,
  `mail_del` int(11) DEFAULT NULL,
  `mail_push` int(11) DEFAULT NULL,
  `mail_star` int(11) DEFAULT NULL,
  PRIMARY KEY (`mail_id`),
  KEY `FK33o7j8f0xk8n8vrk576iktglc` (`mail_file_id`),
  KEY `FK933q7ouoddu584qg08rbvwvxi` (`mail_in_push_user_id`),
  KEY `FKghibt111d1yvc3f02x06sihjp` (`mail_number_id`),
  CONSTRAINT `FK33o7j8f0xk8n8vrk576iktglc` FOREIGN KEY (`mail_file_id`) REFERENCES `aoa_attachment_list` (`attachment_id`),
  CONSTRAINT `FK933q7ouoddu584qg08rbvwvxi` FOREIGN KEY (`mail_in_push_user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKghibt111d1yvc3f02x06sihjp` FOREIGN KEY (`mail_number_id`) REFERENCES `aoa_mailnumber` (`mail_number_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_in_mail_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_love_discuss_user
-- ----------------------------
DROP TABLE IF EXISTS `aoa_love_discuss_user`;
CREATE TABLE `aoa_love_discuss_user` (
  `discuss_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`discuss_id`,`user_id`),
  KEY `FKkl0fitgg3qixkg5gg9mmjp5e7` (`user_id`),
  CONSTRAINT `FKkl0fitgg3qixkg5gg9mmjp5e7` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKnhdtxclyun4is9ne5o99nqw1c` FOREIGN KEY (`discuss_id`) REFERENCES `aoa_discuss_list` (`discuss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_love_discuss_user
-- ----------------------------
BEGIN;
INSERT INTO `aoa_love_discuss_user` VALUES (8, 1);
INSERT INTO `aoa_love_discuss_user` VALUES (12, 1);
INSERT INTO `aoa_love_discuss_user` VALUES (15, 1);
INSERT INTO `aoa_love_discuss_user` VALUES (33, 1);
INSERT INTO `aoa_love_discuss_user` VALUES (7, 2);
INSERT INTO `aoa_love_discuss_user` VALUES (12, 2);
INSERT INTO `aoa_love_discuss_user` VALUES (13, 2);
INSERT INTO `aoa_love_discuss_user` VALUES (33, 2);
INSERT INTO `aoa_love_discuss_user` VALUES (37, 2);
INSERT INTO `aoa_love_discuss_user` VALUES (38, 2);
INSERT INTO `aoa_love_discuss_user` VALUES (39, 2);
INSERT INTO `aoa_love_discuss_user` VALUES (33, 3);
INSERT INTO `aoa_love_discuss_user` VALUES (33, 7);
INSERT INTO `aoa_love_discuss_user` VALUES (13, 8);
COMMIT;

-- ----------------------------
-- Table structure for aoa_love_user
-- ----------------------------
DROP TABLE IF EXISTS `aoa_love_user`;
CREATE TABLE `aoa_love_user` (
  `reply_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  KEY `FK7fv96y8gbqcnb44qao4ey4rmn` (`user_id`),
  KEY `FKcuptpmm0l1e0b9pjv0xksqqai` (`reply_id`),
  CONSTRAINT `FK7fv96y8gbqcnb44qao4ey4rmn` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKcuptpmm0l1e0b9pjv0xksqqai` FOREIGN KEY (`reply_id`) REFERENCES `aoa_reply_list` (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_love_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_mail_reciver
-- ----------------------------
DROP TABLE IF EXISTS `aoa_mail_reciver`;
CREATE TABLE `aoa_mail_reciver` (
  `pk_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_read` int(11) NOT NULL,
  `mail_id` bigint(20) DEFAULT NULL,
  `mail_reciver_id` bigint(20) DEFAULT NULL,
  `is_star` int(11) DEFAULT NULL,
  `is_del` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `FKj8ki52vm052q6qdal2rkh2c9q` (`mail_id`),
  KEY `FK65vdrbmq9hu4hrhvtw6slwxlc` (`mail_reciver_id`),
  CONSTRAINT `FK65vdrbmq9hu4hrhvtw6slwxlc` FOREIGN KEY (`mail_reciver_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKj8ki52vm052q6qdal2rkh2c9q` FOREIGN KEY (`mail_id`) REFERENCES `aoa_in_mail_list` (`mail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_mail_reciver
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_mailnumber
-- ----------------------------
DROP TABLE IF EXISTS `aoa_mailnumber`;
CREATE TABLE `aoa_mailnumber` (
  `mail_number_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mail_account` varchar(255) NOT NULL,
  `mail_create_time` datetime DEFAULT NULL,
  `mail_des` varchar(255) DEFAULT NULL,
  `mail_type` bigint(20) DEFAULT NULL,
  `mail_user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` bigint(20) DEFAULT NULL,
  `mail_num_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`mail_number_id`),
  KEY `FKn9qg20uba4xn2k5m62jrcyc6c` (`mail_num_user_id`),
  CONSTRAINT `FKn9qg20uba4xn2k5m62jrcyc6c` FOREIGN KEY (`mail_num_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_mailnumber
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_note_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_note_list`;
CREATE TABLE `aoa_note_list` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(15000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `catalog_id` bigint(20) DEFAULT NULL,
  `attach_id` bigint(20) DEFAULT NULL,
  `is_collected` bigint(20) DEFAULT '0',
  `createman_id` bigint(20) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`note_id`),
  KEY `FK3e1rxyyg851r231ln3ucnrg7q` (`catalog_id`),
  CONSTRAINT `FK3e1rxyyg851r231ln3ucnrg7q` FOREIGN KEY (`catalog_id`) REFERENCES `aoa_catalog` (`catalog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_note_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_notepaper
-- ----------------------------
DROP TABLE IF EXISTS `aoa_notepaper`;
CREATE TABLE `aoa_notepaper` (
  `notepaper_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `concent` text,
  `create_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `notepaper_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notepaper_id`),
  KEY `FKsavcqw29haox5bu7y90it8jb7` (`notepaper_user_id`),
  CONSTRAINT `FKsavcqw29haox5bu7y90it8jb7` FOREIGN KEY (`notepaper_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_notepaper
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_notice_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_notice_list`;
CREATE TABLE `aoa_notice_list` (
  `notice_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `is_top` int(11) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `notice_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_notice_list
-- ----------------------------
BEGIN;COMMIT;

-- ----------------------------
-- Table structure for aoa_notice_user_relation
-- ----------------------------
DROP TABLE IF EXISTS `aoa_notice_user_relation`;
CREATE TABLE `aoa_notice_user_relation` (
  `relatin_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_read` int(11) DEFAULT NULL,
  `relatin_notice_id` bigint(20) DEFAULT NULL,
  `relatin_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`relatin_id`),
  KEY `FKhxq8glkpb5qi1smn5gu142rky` (`relatin_notice_id`),
  KEY `FK52evvby6j47j24624ydi0o221` (`relatin_user_id`),
  CONSTRAINT `FK52evvby6j47j24624ydi0o221` FOREIGN KEY (`relatin_user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKhxq8glkpb5qi1smn5gu142rky` FOREIGN KEY (`relatin_notice_id`) REFERENCES `aoa_notice_list` (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_notice_user_relation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_overtime
-- ----------------------------
DROP TABLE IF EXISTS `aoa_overtime`;
CREATE TABLE `aoa_overtime` (
  `overtime_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `personnel_advice` varchar(255) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`overtime_id`),
  KEY `FK5o36fvdsrrhvr9q4dvffxkuoc` (`pro_id`),
  CONSTRAINT `FK5o36fvdsrrhvr9q4dvffxkuoc` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_overtime
-- ----------------------------
BEGIN;
INSERT INTO `aoa_overtime` VALUES (1, 33, 14, NULL, '公司没人');
COMMIT;

-- ----------------------------
-- Table structure for aoa_plan_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_plan_list`;
CREATE TABLE `aoa_plan_list` (
  `plan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `plan_comment` varchar(5000) DEFAULT '',
  `plan_content` varchar(10000) DEFAULT NULL,
  `plan_summary` varchar(800) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `plan_user_id` bigint(20) DEFAULT NULL,
  `attach_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`plan_id`,`start_time`),
  KEY `FKsqqfaj3e7rdl3jalr2sm0y4ln` (`plan_user_id`),
  CONSTRAINT `FKsqqfaj3e7rdl3jalr2sm0y4ln` FOREIGN KEY (`plan_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_plan_list
-- ----------------------------
BEGIN;COMMIT;

-- ----------------------------
-- Table structure for aoa_position
-- ----------------------------
DROP TABLE IF EXISTS `aoa_position`;
CREATE TABLE `aoa_position` (
  `position_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `describtion` varchar(255) DEFAULT NULL,
  `deptid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_position
-- ----------------------------
BEGIN;
INSERT INTO `aoa_position` VALUES (1, 1, '超级管理员', '管理系统最高权限', 1);
INSERT INTO `aoa_position` VALUES (2, 2, 'CEO', 'CEO类！~', 1);
INSERT INTO `aoa_position` VALUES (3, 3, '总经理', '总经理类！~', 1);
INSERT INTO `aoa_position` VALUES (4, 4, '研发部经理', NULL, 2);
INSERT INTO `aoa_position` VALUES (5, 5, '财务部经理', NULL, 3);
INSERT INTO `aoa_position` VALUES (6, 6, '市场部经理', NULL, 4);
INSERT INTO `aoa_position` VALUES (7, 7, '人事部经理', NULL, 5);
INSERT INTO `aoa_position` VALUES (8, 8, '人事专员', NULL, 5);
INSERT INTO `aoa_position` VALUES (9, 9, '劳资专员', NULL, 5);
INSERT INTO `aoa_position` VALUES (10, 10, '程序员', NULL, 2);
INSERT INTO `aoa_position` VALUES (11, 11, '初级工程师', NULL, 2);
INSERT INTO `aoa_position` VALUES (12, 12, '中级工程师', NULL, 2);
INSERT INTO `aoa_position` VALUES (13, 13, '高级工程师', NULL, 2);
INSERT INTO `aoa_position` VALUES (14, 14, '系统架构师', NULL, 2);
INSERT INTO `aoa_position` VALUES (15, 15, '需求分析师', NULL, 2);
INSERT INTO `aoa_position` VALUES (16, 16, '调查专员', NULL, 4);
INSERT INTO `aoa_position` VALUES (17, 17, '企业推广员', NULL, 4);
INSERT INTO `aoa_position` VALUES (18, 18, '平面设计师', NULL, 4);
INSERT INTO `aoa_position` VALUES (19, 19, '培训专员', NULL, 4);
INSERT INTO `aoa_position` VALUES (20, 20, '市场督导员', NULL, 4);
INSERT INTO `aoa_position` VALUES (21, 21, '核算会计', NULL, 3);
INSERT INTO `aoa_position` VALUES (22, 22, '税务会计', NULL, 3);
INSERT INTO `aoa_position` VALUES (23, 23, '出纳员', NULL, 3);
INSERT INTO `aoa_position` VALUES (25, 2222, '测试岗位！~', 'emmm！~~', NULL);
INSERT INTO `aoa_position` VALUES (26, 1, '测试职位1', '啊实打实的', 19);
COMMIT;

-- ----------------------------
-- Table structure for aoa_process_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_process_list`;
CREATE TABLE `aoa_process_list` (
  `process_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `apply_time` datetime DEFAULT NULL,
  `deeply_id` bigint(20) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `process_des` text,
  `process_name` varchar(255) DEFAULT NULL,
  `procsee_days` int(11) DEFAULT NULL,
  `is_checked` int(10) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `pro_file_id` bigint(20) DEFAULT NULL,
  `process_user_id` bigint(20) DEFAULT NULL,
  `shenuser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`process_id`),
  KEY `FKiltoi9iw3vjixl6u4cd60fi1p` (`pro_file_id`),
  KEY `FKhtdg4du5ryotah5v1dgyjfh2t` (`process_user_id`),
  CONSTRAINT `FKhtdg4du5ryotah5v1dgyjfh2t` FOREIGN KEY (`process_user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKiltoi9iw3vjixl6u4cd60fi1p` FOREIGN KEY (`pro_file_id`) REFERENCES `aoa_attachment_list` (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_process_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_receiver_note
-- ----------------------------
DROP TABLE IF EXISTS `aoa_receiver_note`;
CREATE TABLE `aoa_receiver_note` (
  `note_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `id` int(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK904cmor3q468pj3ft6mdrnqwk` (`user_id`),
  KEY `FKcx7spjjefkofw62v8yxmgjxao` (`note_id`),
  CONSTRAINT `FK904cmor3q468pj3ft6mdrnqwk` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FK_NOTE_LIST` FOREIGN KEY (`note_id`) REFERENCES `aoa_note_list` (`note_id`),
  CONSTRAINT `FK_USER` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKcx7spjjefkofw62v8yxmgjxao` FOREIGN KEY (`note_id`) REFERENCES `aoa_note_list` (`note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_receiver_note
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_regular
-- ----------------------------
DROP TABLE IF EXISTS `aoa_regular`;
CREATE TABLE `aoa_regular` (
  `regular_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) DEFAULT NULL,
  `deficiency` varchar(255) DEFAULT NULL,
  `dobetter` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `personnel_advice` varchar(255) DEFAULT NULL,
  `pullulate` varchar(255) DEFAULT NULL,
  `understand` varchar(255) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  PRIMARY KEY (`regular_id`),
  KEY `FK96uphskhww1otsi3fe916dfor` (`pro_id`),
  CONSTRAINT `FK96uphskhww1otsi3fe916dfor` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_regular
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_reply_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_reply_list`;
CREATE TABLE `aoa_reply_list` (
  `reply_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text,
  `replay_time` datetime DEFAULT NULL,
  `discuss_id` bigint(20) DEFAULT NULL,
  `reply_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `FK94s0c9f8hxomde6bede3d20y2` (`discuss_id`),
  KEY `FK2bn8fpyqw7mom14ks4kvrhtp9` (`reply_user_id`),
  CONSTRAINT `FK2bn8fpyqw7mom14ks4kvrhtp9` FOREIGN KEY (`reply_user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FK94s0c9f8hxomde6bede3d20y2` FOREIGN KEY (`discuss_id`) REFERENCES `aoa_discuss_list` (`discuss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_reply_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_resign
-- ----------------------------
DROP TABLE IF EXISTS `aoa_resign`;
CREATE TABLE `aoa_resign` (
  `resign_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `financial_advice` varchar(255) DEFAULT NULL,
  `is_finish` bit(1) DEFAULT NULL,
  `nofinish` varchar(255) DEFAULT NULL,
  `personnel_advice` varchar(255) DEFAULT NULL,
  `suggest` varchar(255) DEFAULT NULL,
  `hand_user` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resign_id`),
  KEY `FK3t0d1mt9o7g5q59ha10e3mwpr` (`hand_user`),
  KEY `FKam7ii5j1kdforxq8s6q3mm13n` (`pro_id`),
  CONSTRAINT `FK3t0d1mt9o7g5q59ha10e3mwpr` FOREIGN KEY (`hand_user`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKam7ii5j1kdforxq8s6q3mm13n` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_resign
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for aoa_reviewed
-- ----------------------------
DROP TABLE IF EXISTS `aoa_reviewed`;
CREATE TABLE `aoa_reviewed` (
  `reviewed_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) DEFAULT NULL,
  `reviewed_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `del` int(11) DEFAULT NULL,
  PRIMARY KEY (`reviewed_id`),
  KEY `FKevjvy6myxg1l0ibiuph3i7jw2` (`pro_id`),
  KEY `FK2iljei0wvy0cylwwyfh5dr9yk` (`user_id`),
  CONSTRAINT `FK2iljei0wvy0cylwwyfh5dr9yk` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKevjvy6myxg1l0ibiuph3i7jw2` FOREIGN KEY (`pro_id`) REFERENCES `aoa_process_list` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_reviewed
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_role_
-- ----------------------------
DROP TABLE IF EXISTS `aoa_role_`;
CREATE TABLE `aoa_role_` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_role_
-- ----------------------------
BEGIN;
INSERT INTO `aoa_role_` VALUES (1, '超级管理员', NULL);
COMMIT;

-- ----------------------------
-- Table structure for aoa_role_power_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_role_power_list`;
CREATE TABLE `aoa_role_power_list` (
  `pk_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` int(11) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `FK2f9f91f213gwtglofko5r429s` (`menu_id`),
  KEY `FK7b71lfkstl47tston4lrd8066` (`role_id`),
  CONSTRAINT `FK2f9f91f213gwtglofko5r429s` FOREIGN KEY (`menu_id`) REFERENCES `aoa_sys_menu` (`menu_id`),
  CONSTRAINT `FK7b71lfkstl47tston4lrd8066` FOREIGN KEY (`role_id`) REFERENCES `aoa_role_` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_role_power_list
-- ----------------------------
BEGIN;
INSERT INTO `aoa_role_power_list` VALUES (1, 1, 1, 1);
INSERT INTO `aoa_role_power_list` VALUES (2, 1, 2, 1);
INSERT INTO `aoa_role_power_list` VALUES (3, 1, 3, 1);
INSERT INTO `aoa_role_power_list` VALUES (4, 1, 4, 1);
INSERT INTO `aoa_role_power_list` VALUES (5, 1, 5, 1);
INSERT INTO `aoa_role_power_list` VALUES (6, 1, 6, 1);
INSERT INTO `aoa_role_power_list` VALUES (7, 1, 7, 1);
INSERT INTO `aoa_role_power_list` VALUES (8, 1, 8, 1);
INSERT INTO `aoa_role_power_list` VALUES (9, 1, 9, 1);
INSERT INTO `aoa_role_power_list` VALUES (10, 1, 10, 1);
INSERT INTO `aoa_role_power_list` VALUES (11, 1, 11, 1);
INSERT INTO `aoa_role_power_list` VALUES (12, 1, 12, 1);
INSERT INTO `aoa_role_power_list` VALUES (13, 1, 13, 1);
INSERT INTO `aoa_role_power_list` VALUES (14, 1, 14, 1);
INSERT INTO `aoa_role_power_list` VALUES (15, 1, 15, 1);
INSERT INTO `aoa_role_power_list` VALUES (16, 1, 16, 1);
INSERT INTO `aoa_role_power_list` VALUES (17, 1, 17, 1);
INSERT INTO `aoa_role_power_list` VALUES (18, 1, 18, 1);
INSERT INTO `aoa_role_power_list` VALUES (19, 1, 19, 1);
INSERT INTO `aoa_role_power_list` VALUES (20, 1, 20, 1);
INSERT INTO `aoa_role_power_list` VALUES (21, 1, 21, 1);
INSERT INTO `aoa_role_power_list` VALUES (22, 1, 22, 1);
INSERT INTO `aoa_role_power_list` VALUES (23, 1, 23, 1);
INSERT INTO `aoa_role_power_list` VALUES (24, 1, 24, 1);
INSERT INTO `aoa_role_power_list` VALUES (25, 1, 25, 1);
INSERT INTO `aoa_role_power_list` VALUES (26, 1, 26, 1);
INSERT INTO `aoa_role_power_list` VALUES (27, 1, 27, 1);
INSERT INTO `aoa_role_power_list` VALUES (28, 1, 28, 1);
INSERT INTO `aoa_role_power_list` VALUES (29, 1, 29, 1);
INSERT INTO `aoa_role_power_list` VALUES (30, 1, 30, 1);
INSERT INTO `aoa_role_power_list` VALUES (30, 1, 30, 1);
INSERT INTO `aoa_role_power_list` VALUES (31, 1, 31, 1);
INSERT INTO `aoa_role_power_list` VALUES (32, 1, 32, 1);
INSERT INTO `aoa_role_power_list` VALUES (33, 1, 33, 1);
INSERT INTO `aoa_role_power_list` VALUES (34, 1, 34, 1);
INSERT INTO `aoa_role_power_list` VALUES (35, 1, 35, 1);
INSERT INTO `aoa_role_power_list` VALUES (36, 1, 36, 1);
INSERT INTO `aoa_role_power_list` VALUES (37, 1, 37, 1);
INSERT INTO `aoa_role_power_list` VALUES (38, 1, 38, 1);
INSERT INTO `aoa_role_power_list` VALUES (39, 1, 39, 1);
INSERT INTO `aoa_role_power_list` VALUES (30, 1, 30, 1);
INSERT INTO `aoa_role_power_list` VALUES (41, 1, 41, 1);
INSERT INTO `aoa_role_power_list` VALUES (42, 1, 42, 1);
INSERT INTO `aoa_role_power_list` VALUES (43, 1, 43, 1);
INSERT INTO `aoa_role_power_list` VALUES (44, 1, 44, 1);
INSERT INTO `aoa_role_power_list` VALUES (45, 1, 45, 1);
INSERT INTO `aoa_role_power_list` VALUES (46, 1, 46, 1);
INSERT INTO `aoa_role_power_list` VALUES (47, 1, 47, 1);
INSERT INTO `aoa_role_power_list` VALUES (48, 1, 48, 1);
INSERT INTO `aoa_role_power_list` VALUES (49, 1, 49, 1);
INSERT INTO `aoa_role_power_list` VALUES (50, 1, 50, 1);

COMMIT;

-- ----------------------------
-- Table structure for aoa_schedule_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_schedule_list`;
CREATE TABLE `aoa_schedule_list` (
  `rc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `filedescribe` varchar(255) DEFAULT NULL,
  `is_remind` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `miaoshu` varchar(255) DEFAULT NULL,
  `isreminded` int(11) DEFAULT NULL,
  PRIMARY KEY (`rc_id`),
  KEY `FKgcip21xf5ihmgm2bnh5o4jv15` (`user_id`),
  CONSTRAINT `FKgcip21xf5ihmgm2bnh5o4jv15` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_schedule_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_schedule_user
-- ----------------------------
DROP TABLE IF EXISTS `aoa_schedule_user`;
CREATE TABLE `aoa_schedule_user` (
  `rcid` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  KEY `FKh6hw8vp7p2lgfovi0o7bhhlyp` (`user_id`),
  KEY `FKcmd578ftbv7i53l6mxbbva137` (`rcid`),
  CONSTRAINT `FKcmd578ftbv7i53l6mxbbva137` FOREIGN KEY (`rcid`) REFERENCES `aoa_schedule_list` (`rc_id`),
  CONSTRAINT `FKh6hw8vp7p2lgfovi0o7bhhlyp` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_schedule_user
-- ----------------------------
BEGIN;
INSERT INTO `aoa_schedule_user` VALUES (6, 2);
INSERT INTO `aoa_schedule_user` VALUES (6, 3);
INSERT INTO `aoa_schedule_user` VALUES (1, 2);
INSERT INTO `aoa_schedule_user` VALUES (1, 3);
INSERT INTO `aoa_schedule_user` VALUES (1, 4);
COMMIT;

-- ----------------------------
-- Table structure for aoa_status_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_status_list`;
CREATE TABLE `aoa_status_list` (
  `status_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_color` varchar(255) DEFAULT NULL,
  `status_model` varchar(255) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `sort_value` int(11) DEFAULT NULL,
  `sort_precent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_status_list
-- ----------------------------
BEGIN;
INSERT INTO `aoa_status_list` VALUES (1, 'label-success', 'aoa_mailnumber', '有效', 0, NULL);
INSERT INTO `aoa_status_list` VALUES (2, 'label-default', 'aoa_mailnumber', '无效', 1, NULL);
INSERT INTO `aoa_status_list` VALUES (3, 'label-warning', 'aoa_task_list', '新任务', 0, '20%');
INSERT INTO `aoa_status_list` VALUES (4, 'label-info', 'aoa_task_list', '已接收', 1, '40%');
INSERT INTO `aoa_status_list` VALUES (5, 'label-primary', 'aoa_task_list', '进行中', 2, '60%');
INSERT INTO `aoa_status_list` VALUES (6, 'label-danger', 'aoa_task_list', '已提交', 3, '80%');
INSERT INTO `aoa_status_list` VALUES (7, 'label-success', 'aoa_task_list', '已完成', 4, '100%');
INSERT INTO `aoa_status_list` VALUES (8, 'label-info', 'aoa_note_list', '一般', 0, NULL);
INSERT INTO `aoa_status_list` VALUES (9, 'label-danger', 'aoa_note_list', '重要', 1, NULL);
INSERT INTO `aoa_status_list` VALUES (10, 'label-info', 'aoa_attends_list', '正常', 0, NULL);
INSERT INTO `aoa_status_list` VALUES (11, 'label-warning', 'aoa_attends_list', '迟到', 1, NULL);
INSERT INTO `aoa_status_list` VALUES (12, 'label-danger', 'aoa_attends_list', '早退', 2, NULL);
INSERT INTO `aoa_status_list` VALUES (13, 'label-danger', 'a', '旷工', 3, NULL);
INSERT INTO `aoa_status_list` VALUES (14, 'label-primary', 'inform', '一般', 0, NULL);
INSERT INTO `aoa_status_list` VALUES (15, 'label-warning', 'inform', '重要', 1, '');
INSERT INTO `aoa_status_list` VALUES (16, 'label-danger', 'inform', '紧急', 2, NULL);
INSERT INTO `aoa_status_list` VALUES (17, 'label-warning', 'aoa_plan_list', '未完成', 0, NULL);
INSERT INTO `aoa_status_list` VALUES (18, 'label-success', 'aoa_plan_list', '已完成', 1, NULL);
INSERT INTO `aoa_status_list` VALUES (19, 'label-info', 'aoa_plan_list', '已取消', 2, NULL);
INSERT INTO `aoa_status_list` VALUES (20, 'label-primary', 'aoa_in_mail_list', '一般', 0, NULL);
INSERT INTO `aoa_status_list` VALUES (21, 'label-warning', 'aoa_in_mail_list', '重要', 1, NULL);
INSERT INTO `aoa_status_list` VALUES (22, 'label-danger', 'aoa_in_mail_list', '紧急', 2, NULL);
INSERT INTO `aoa_status_list` VALUES (23, 'label-info', 'aoa_process_list', '未处理', 0, NULL);
INSERT INTO `aoa_status_list` VALUES (24, 'label-primary', 'aoa_process_list', '处理中', 1, NULL);
INSERT INTO `aoa_status_list` VALUES (25, 'label-success', 'aoa_process_list', '已批准', 2, NULL);
INSERT INTO `aoa_status_list` VALUES (26, 'label-danger', 'aoa_process_list', '未通过', 3, NULL);
INSERT INTO `aoa_status_list` VALUES (27, 'label-primary', 'aoa_schedule_list', '一般', 0, NULL);
INSERT INTO `aoa_status_list` VALUES (28, 'label-warning', 'aoa_schedule_list', '重要', 1, NULL);
INSERT INTO `aoa_status_list` VALUES (29, 'label-danger', 'aoa_schedule_list', '紧急', 2, NULL);
COMMIT;

-- ----------------------------
-- Table structure for aoa_stay
-- ----------------------------
DROP TABLE IF EXISTS `aoa_stay`;
CREATE TABLE `aoa_stay` (
  `stay_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `day` int(11) DEFAULT NULL,
  `hotel_name` varchar(255) DEFAULT NULL,
  `leave_time` datetime DEFAULT NULL,
  `stay_city` varchar(255) DEFAULT NULL,
  `stay_money` double DEFAULT NULL,
  `stay_time` datetime DEFAULT NULL,
  `evemoney_id` bigint(20) DEFAULT NULL,
  `user_name` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`stay_id`),
  KEY `FK50vbdodv3kd8dixbmyf9ixyc` (`evemoney_id`),
  KEY `FKho0k9o03kbn6dd96l57xvcx3y` (`user_name`),
  CONSTRAINT `FK50vbdodv3kd8dixbmyf9ixyc` FOREIGN KEY (`evemoney_id`) REFERENCES `aoa_evectionmoney` (`evectionmoney_id`),
  CONSTRAINT `FKho0k9o03kbn6dd96l57xvcx3y` FOREIGN KEY (`user_name`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_stay
-- ----------------------------
BEGIN;

COMMIT;

-- ----------------------------
-- Table structure for aoa_subject
-- ----------------------------
DROP TABLE IF EXISTS `aoa_subject`;
CREATE TABLE `aoa_subject` (
  `subject_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_subject
-- ----------------------------
BEGIN;
INSERT INTO `aoa_subject` VALUES (1, '报销科目', 0);
INSERT INTO `aoa_subject` VALUES (2, '办公室费用', 1);
INSERT INTO `aoa_subject` VALUES (3, '第三方采购费', 1);
INSERT INTO `aoa_subject` VALUES (4, '管理费用', 1);
INSERT INTO `aoa_subject` VALUES (5, '投标保证金', 1);
INSERT INTO `aoa_subject` VALUES (6, '销售费用', 1);
INSERT INTO `aoa_subject` VALUES (7, '预付款', 1);
INSERT INTO `aoa_subject` VALUES (9, '差旅费', 2);
INSERT INTO `aoa_subject` VALUES (10, '采购费', 3);
INSERT INTO `aoa_subject` VALUES (11, '外包费用', 3);
INSERT INTO `aoa_subject` VALUES (12, '外包服务费', 3);
INSERT INTO `aoa_subject` VALUES (13, '房租', 4);
INSERT INTO `aoa_subject` VALUES (14, '工资', 4);
INSERT INTO `aoa_subject` VALUES (15, '公积金', 4);
INSERT INTO `aoa_subject` VALUES (16, '固定电话费', 4);
INSERT INTO `aoa_subject` VALUES (17, '社保金', 4);
INSERT INTO `aoa_subject` VALUES (18, '水费', 4);
INSERT INTO `aoa_subject` VALUES (19, '印刷费', 4);
INSERT INTO `aoa_subject` VALUES (20, '电费', 4);
INSERT INTO `aoa_subject` VALUES (21, '投标保证金', 5);
INSERT INTO `aoa_subject` VALUES (22, '车辆油费', 6);
INSERT INTO `aoa_subject` VALUES (23, '市场推广费', 6);
INSERT INTO `aoa_subject` VALUES (24, '市内交通费', 6);
INSERT INTO `aoa_subject` VALUES (25, '招待费', 6);
INSERT INTO `aoa_subject` VALUES (26, '预付款', 7);
COMMIT;

-- ----------------------------
-- Table structure for aoa_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `aoa_sys_menu`;
CREATE TABLE `aoa_sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` int(11) DEFAULT NULL,
  `menu_grade` int(11) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `aoa_sys_menu` VALUES (1, 1, NULL, 'glyphicon-cog', '系统管理', '##', 0, 0);
INSERT INTO `aoa_sys_menu` VALUES (2, 1, NULL, 'glyphicon-education', '用户管理', '#', 0, 1);
INSERT INTO `aoa_sys_menu` VALUES (3, 1, NULL, 'glyphicon-user', '角色列表', '#', 0, 2);
INSERT INTO `aoa_sys_menu` VALUES (4, 1, NULL, 'glyphicon-time', '考勤管理', '#', 0, 3);
INSERT INTO `aoa_sys_menu` VALUES (5, 1, NULL, 'glyphicon-hourglass', '流程管理', '#', 0, 4);
INSERT INTO `aoa_sys_menu` VALUES (6, 1, NULL, 'glyphicon-bell', '公告管理', '#', 0, 5);
INSERT INTO `aoa_sys_menu` VALUES (7, 1, NULL, 'glyphicon-envelope', '邮件管理', '#', 0, 6);
INSERT INTO `aoa_sys_menu` VALUES (8, 1, NULL, 'glyphicon-flag', '任务管理', '#', 0, 7);
INSERT INTO `aoa_sys_menu` VALUES (9, 1, NULL, 'glyphicon-calendar', '日程管理', '#', 0, 8);
INSERT INTO `aoa_sys_menu` VALUES (10, 1, NULL, 'glyphicon-plane', '工作计划', '#', 0, 9);
INSERT INTO `aoa_sys_menu` VALUES (11, 1, NULL, 'glyphicon-folder-open', '文件管理', '#', 0, 10);
INSERT INTO `aoa_sys_menu` VALUES (12, 1, NULL, 'glyphicon-edit', '笔记管理', '#', 0, 11);
INSERT INTO `aoa_sys_menu` VALUES (13, 1, NULL, 'glyphicon-comment', '讨论区', '#', 0, 12);
INSERT INTO `aoa_sys_menu` VALUES (14, 1, NULL, 'glyphicon-comment', '餐厅服务', '#', 0, 13);
INSERT INTO `aoa_sys_menu` VALUES (15, 1, NULL, 'glyphicon-record', '菜单管理', '/testsysmenu', 1, 2);
INSERT INTO `aoa_sys_menu` VALUES (16, 1, NULL, 'glyphicon-record', '类型管理', '/testsystype', 1, 1);
INSERT INTO `aoa_sys_menu` VALUES (17, 1, NULL, 'glyphicon-record', '状态管理', '/testsysstatus', 1, 3);
INSERT INTO `aoa_sys_menu` VALUES (18, 1, NULL, 'glyphicon-record', '部门管理', '/deptmanage', 2, 1);
INSERT INTO `aoa_sys_menu` VALUES (19, 1, NULL, 'glyphicon-record', '职位管理', '/positionmanage', 2, 3);
INSERT INTO `aoa_sys_menu` VALUES (20, 1, NULL, 'glyphicon-record', '用户管理', '/usermanage', 2, 4);
INSERT INTO `aoa_sys_menu` VALUES (21, 1, NULL, 'glyphicon-record', '在线用户', '/morelogrecord', 2, 2);
INSERT INTO `aoa_sys_menu` VALUES (22, 1, NULL, 'glyphicon-record', '角色列表', '/rolemanage', 3, 1);
INSERT INTO `aoa_sys_menu` VALUES (23, 1, NULL, 'glyphicon-record', '考勤管理', '/attendceatt', 4, 1);
INSERT INTO `aoa_sys_menu` VALUES (24, 1, NULL, 'glyphicon-record', '考勤周报表', '/attendceweek', 4, 2);
INSERT INTO `aoa_sys_menu` VALUES (25, 1, NULL, 'glyphicon-record', '考勤月报表', '/attendcemonth', 4, 3);
INSERT INTO `aoa_sys_menu` VALUES (26, 1, NULL, 'glyphicon-record', '我的申请', '/flowmanage', 5, 1);
INSERT INTO `aoa_sys_menu` VALUES (27, 1, NULL, 'glyphicon-record', '流程审核', '/audit', 5, 2);
INSERT INTO `aoa_sys_menu` VALUES (28, 1, NULL, 'glyphicon-record', '通知管理', '/infrommanage', 6, 1);
INSERT INTO `aoa_sys_menu` VALUES (29, 1, NULL, 'glyphicon-record', '通知列表', '/infromlist', 6, 2);
INSERT INTO `aoa_sys_menu` VALUES (30, 1, NULL, 'glyphicon-record', '账号管理', '/accountmanage', 7, 1);
INSERT INTO `aoa_sys_menu` VALUES (31, 1, NULL, 'glyphicon-record', '邮件管理', '/mail', 7, 2);
INSERT INTO `aoa_sys_menu` VALUES (32, 1, NULL, 'glyphicon-record', '任务管理', '/taskmanage', 8, 1);
INSERT INTO `aoa_sys_menu` VALUES (33, 1, NULL, 'glyphicon-record', '我的任务', '/mytask', 8, 2);
INSERT INTO `aoa_sys_menu` VALUES (34, 1, NULL, 'glyphicon-record', '日程管理', '/daymanage', 9, 1);
INSERT INTO `aoa_sys_menu` VALUES (35, 1, NULL, 'glyphicon-record', '我的日历', '/daycalendar', 9, 2);
INSERT INTO `aoa_sys_menu` VALUES (36, 1, NULL, 'glyphicon-record', '计划管理', '/planview', 10, 1);
INSERT INTO `aoa_sys_menu` VALUES (37, 1, NULL, 'glyphicon-record', '计划报表', '/myplan', 10, 2);
INSERT INTO `aoa_sys_menu` VALUES (38, 1, NULL, 'glyphicon-record', '文件管理', '/filemanage', 11, 1);
INSERT INTO `aoa_sys_menu` VALUES (39, 1, NULL, 'glyphicon-record', '笔记管理', '/noteview', 12, 0);
INSERT INTO `aoa_sys_menu` VALUES (40, 1, NULL, 'glyphicon-earphone', '通讯录', '#', 0, 14);
INSERT INTO `aoa_sys_menu` VALUES (41, 1, NULL, 'glyphicon-record', '通讯录', '/addrmanage', 39, 1);
INSERT INTO `aoa_sys_menu` VALUES (42, 1, NULL, 'glyphicon-record', '我的管理', '/chatmanage', 13, 1);
INSERT INTO `aoa_sys_menu` VALUES (43, 1, NULL, 'glyphicon-record', '讨论区列表', '/chatlist', 13, 2);
INSERT INTO `aoa_sys_menu` VALUES (44, 1, NULL, 'glyphicon-record', '考勤列表', '/attendcelist', 4, 4);
INSERT INTO `aoa_sys_menu` VALUES (45, 1, NULL, 'glyphicon-record', '超级管理员', '/adminmanage', 13, 0);
INSERT INTO `aoa_sys_menu` VALUES (46, 1, NULL, 'glyphicon-record', '新建流程', '/xinxeng', 5, 0);
INSERT INTO `aoa_sys_menu` VALUES (47, 1, NULL, 'glyphicon-record', '菜品管理', '/mealmanage', 14, 0);
INSERT INTO `aoa_sys_menu` VALUES (48, 1, NULL, 'glyphicon-record', '在線訂餐', '/mealorder', 14, 1);
COMMIT;

-- ----------------------------
-- Table structure for aoa_task_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_task_list`;
CREATE TABLE `aoa_task_list` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_cancel` int(11) DEFAULT '0',
  `is_top` int(11) DEFAULT '0',
  `modify_time` datetime DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  `star_time` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `task_describe` varchar(255) NOT NULL,
  `ticking` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `task_push_user_id` bigint(20) DEFAULT NULL,
  `reciverlist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FK7qch0fh6s2y73dvngy1m87aw7` (`task_push_user_id`),
  CONSTRAINT `FK7qch0fh6s2y73dvngy1m87aw7` FOREIGN KEY (`task_push_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_task_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_task_logger
-- ----------------------------
DROP TABLE IF EXISTS `aoa_task_logger`;
CREATE TABLE `aoa_task_logger` (
  `logger_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `logger_ticking` varchar(255) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `logger_statusid` int(11) DEFAULT NULL,
  PRIMARY KEY (`logger_id`),
  KEY `FK5gu0thq54i7ujc6cict009h4y` (`task_id`),
  CONSTRAINT `FK5gu0thq54i7ujc6cict009h4y` FOREIGN KEY (`task_id`) REFERENCES `aoa_task_list` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_task_logger
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_task_user
-- ----------------------------
DROP TABLE IF EXISTS `aoa_task_user`;
CREATE TABLE `aoa_task_user` (
  `pk_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_id` bigint(20) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `task_recive_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `FK2714kl5ywm5chya4dxte8c788` (`task_id`),
  KEY `FK654dfo0oouy3fk07fs7rqo4ld` (`task_recive_user_id`),
  CONSTRAINT `FK2714kl5ywm5chya4dxte8c788` FOREIGN KEY (`task_id`) REFERENCES `aoa_task_list` (`task_id`),
  CONSTRAINT `FK654dfo0oouy3fk07fs7rqo4ld` FOREIGN KEY (`task_recive_user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_task_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_traffic
-- ----------------------------
DROP TABLE IF EXISTS `aoa_traffic`;
CREATE TABLE `aoa_traffic` (
  `traffic_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) DEFAULT NULL,
  `depart_time` datetime DEFAULT NULL,
  `reach_name` varchar(255) DEFAULT NULL,
  `seat_type` varchar(255) DEFAULT NULL,
  `traffic_money` double DEFAULT NULL,
  `traffic_name` varchar(255) DEFAULT NULL,
  `evection_id` bigint(20) DEFAULT NULL,
  `user_name` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`traffic_id`),
  KEY `FKt5gk2fg5t802gnq8y03p9e7di` (`evection_id`),
  KEY `FKejkemcx58mfj2lgi2jo2rlih3` (`user_name`),
  CONSTRAINT `FKejkemcx58mfj2lgi2jo2rlih3` FOREIGN KEY (`user_name`) REFERENCES `aoa_user` (`user_id`),
  CONSTRAINT `FKt5gk2fg5t802gnq8y03p9e7di` FOREIGN KEY (`evection_id`) REFERENCES `aoa_evectionmoney` (`evectionmoney_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_traffic
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_type_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_type_list`;
CREATE TABLE `aoa_type_list` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_color` varchar(255) DEFAULT NULL,
  `type_model` varchar(255) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `sort_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_type_list
-- ----------------------------
BEGIN;
INSERT INTO `aoa_type_list` VALUES (1, 'red', 'aoa_mailnumber', '系统邮件', 0);
INSERT INTO `aoa_type_list` VALUES (2, 'red', 'aoa_mailnumber', '公司邮件', 1);
INSERT INTO `aoa_type_list` VALUES (3, 'red', 'aoa_task_list', '公事', 0);
INSERT INTO `aoa_type_list` VALUES (4, 'red', 'aoa_task_list', '私事', 1);
INSERT INTO `aoa_type_list` VALUES (5, 'red', 'aoa_note_list', '我的笔记', 0);
INSERT INTO `aoa_type_list` VALUES (6, 'red', 'aoa_note_list', '公司笔记', 1);
INSERT INTO `aoa_type_list` VALUES (7, 'red', 'aoa_note_list', '共享笔记', 2);
INSERT INTO `aoa_type_list` VALUES (8, 'red', 'aoa_attends_list', '上班', 1);
INSERT INTO `aoa_type_list` VALUES (9, 'red', 'aoa_attends_list', '下班', 2);
INSERT INTO `aoa_type_list` VALUES (10, 'red', 'inform', '公告', 0);
INSERT INTO `aoa_type_list` VALUES (11, 'red', 'inform', '通知', 1);
INSERT INTO `aoa_type_list` VALUES (12, 'red', 'inform', '投票', 2);
INSERT INTO `aoa_type_list` VALUES (13, 'red', 'aoa_plan_list', '日计划', 0);
INSERT INTO `aoa_type_list` VALUES (14, 'red', 'aoa_plan_list', '周计划', 1);
INSERT INTO `aoa_type_list` VALUES (15, 'red', 'aoa_plan_list', '月计划', 2);
INSERT INTO `aoa_type_list` VALUES (16, 'red', 'aoa_in_mail_list', '邮件', 0);
INSERT INTO `aoa_type_list` VALUES (17, 'red', 'aoa_in_mail_list', '通知', 1);
INSERT INTO `aoa_type_list` VALUES (18, 'red', 'aoa_in_mail_list', '公告', 2);
INSERT INTO `aoa_type_list` VALUES (19, 'label-danger', 'chat', '公告', 0);
INSERT INTO `aoa_type_list` VALUES (20, 'label-success', 'chat', '讨论', 1);
INSERT INTO `aoa_type_list` VALUES (21, 'label-warning', 'chat', '投票', 2);
INSERT INTO `aoa_type_list` VALUES (22, 'red', 'aoa_process_list', '正常', 0);
INSERT INTO `aoa_type_list` VALUES (23, 'red', 'aoa_process_list', '重要', 1);
INSERT INTO `aoa_type_list` VALUES (24, 'red', 'aoa_process_list', '紧急', 2);
INSERT INTO `aoa_type_list` VALUES (25, 'red', 'aoa_bursement', '银行卡', 0);
INSERT INTO `aoa_type_list` VALUES (26, 'red', 'aoa_bursement', '现金', 1);
INSERT INTO `aoa_type_list` VALUES (27, 'red', 'aoa_bursement', '其他', 2);
INSERT INTO `aoa_type_list` VALUES (28, 'red', 'aoa_evection', '销售拜访', 0);
INSERT INTO `aoa_type_list` VALUES (29, 'red', 'aoa_evection', '售前支持', 1);
INSERT INTO `aoa_type_list` VALUES (30, 'red', 'aoa_evection', '项目支持', 2);
INSERT INTO `aoa_type_list` VALUES (31, 'red', 'aoa_evection', '客服外出', 3);
INSERT INTO `aoa_type_list` VALUES (32, 'red', 'aoa_evection', '其他', 4);
INSERT INTO `aoa_type_list` VALUES (33, 'red', 'aoa_overtime', '工作日', 0);
INSERT INTO `aoa_type_list` VALUES (34, 'red', 'aoa_overtime', '休息日', 1);
INSERT INTO `aoa_type_list` VALUES (35, 'red', 'aoa_overtime', '节假日', 2);
INSERT INTO `aoa_type_list` VALUES (36, 'red', 'aoa_overtime', '其他', 3);
INSERT INTO `aoa_type_list` VALUES (37, '1、年假：工作满一年以上每年可享受带薪年假，当年的年假使用期至次年3月1日止；未经用人单位批准，员工不得自行休假。', 'aoa_holiday', '年假', 7);
INSERT INTO `aoa_type_list` VALUES (38, '2、事假：按照平均工作日扣发薪资（包含工资及各类补贴福利）；单次事假原则上不应超过3天，当年累计事假超过15天的视为主动放弃继续履行岗位职责的权利，特殊情况除外。  ', 'aoa_holiday', '事假', 4);
INSERT INTO `aoa_type_list` VALUES (39, '3、病假：两天及以上病假必须持工作地二级甲等以上医院相关病假证明单或就医记录证明，否则无法享受病假工资；单次病假超过5天，应当持有工作所在地三级甲等医院提供的病假证明单。原则上当年累计病假超过15天应视为不具备继续履行岗位职责身体条件，特殊情况除外。  ', 'aoa_holiday', '病假', NULL);
INSERT INTO `aoa_type_list` VALUES (40, '4、婚假：婚假为十天，包含休息日，请婚假必须持结婚证明，结婚证必须在泛微工作期间领取，且婚假必须在一年内使用完毕，不得分次休假，国家或地方政府有其他规定的按照当地要求执行；  ', 'aoa_holiday', '婚假', 10);
INSERT INTO `aoa_type_list` VALUES (41, '5、产假及哺乳假：按国家及地方法律法规执行，包含休息日与法定节假日；  ', 'aoa_holiday', '产假及哺乳假', 180);
INSERT INTO `aoa_type_list` VALUES (42, '6、陪产假：泛微正式男性员工在工作期间配偶生育的，可凭子女出生证明，享受十个自然日陪产假。  ', 'aoa_holiday', '陪产假', 10);
INSERT INTO `aoa_type_list` VALUES (43, '7、丧假：直系亲属：配偶、子女、父母可享受三天，岳父母、祖父母、外祖父母可享受一天', 'aoa_holiday', '丧假', NULL);
INSERT INTO `aoa_type_list` VALUES (44, '', 'aoa_schedule_list', '日程提醒', 0);
INSERT INTO `aoa_type_list` VALUES (45, '', 'aoa_schedule_list', '假日安排', 1);
INSERT INTO `aoa_type_list` VALUES (46, 'red', 'aoa_attends_list', '请假', 3);
INSERT INTO `aoa_type_list` VALUES (47, 'red', 'aoa_attends_list', '出差', 4);
COMMIT;

-- ----------------------------
-- Table structure for aoa_user
-- ----------------------------
DROP TABLE IF EXISTS `aoa_user`;
CREATE TABLE `aoa_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `eamil` varchar(255) DEFAULT NULL,
  `father_id` bigint(20) DEFAULT NULL,
  `hire_time` datetime DEFAULT NULL,
  `user_idcard` varchar(255) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `is_lock` int(11) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user_id` bigint(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `user_school` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `theme_skin` varchar(255) DEFAULT NULL,
  `user_edu` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_sign` varchar(255) DEFAULT NULL,
  `user_tel` varchar(255) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `superman` int(11) DEFAULT NULL,
  `holiday` int(11) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  `money` int(10) DEFAULT 0,
  PRIMARY KEY (`user_id`),
  KEY `FKt0vmot9xfbgq14oyij0gwh3gh` (`dept_id`),
  KEY `FKadtg9xju7q1ijcyxlkl9gwv5t` (`position_id`),
  KEY `FKl738mmblfx0uia6671rl17cj9` (`role_id`),
  CONSTRAINT `FKadtg9xju7q1ijcyxlkl9gwv5t` FOREIGN KEY (`position_id`) REFERENCES `aoa_position` (`position_id`),
  CONSTRAINT `FKl738mmblfx0uia6671rl17cj9` FOREIGN KEY (`role_id`) REFERENCES `aoa_role_` (`role_id`),
  CONSTRAINT `FKt0vmot9xfbgq14oyij0gwh3gh` FOREIGN KEY (`dept_id`) REFERENCES `aoa_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_user
-- ----------------------------
BEGIN;
INSERT INTO `aoa_user` VALUES (1, '湖南工业大学', '62175555555555444', '1986-02-03 00:00:00', '1057@qq.com', 0, '2017-09-22 19:35:40', '510322198602030429', '/22974ba8-4f7f-4166-b026-1fafa8afd923.jpg', 0, NULL, NULL, NULL, NULL, '123456', '小明', 2000, '湖南工业大学', '男', 'blue', '本科', '罗密欧', '好好', '13272143450', 1, 1, 1, 1, NULL, 'luomiou');
COMMIT;

-- ----------------------------
-- Table structure for aoa_user_log
-- ----------------------------
DROP TABLE IF EXISTS `aoa_user_log`;
CREATE TABLE `aoa_user_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_addr` varchar(255) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `FKherb88q97dxbtcge09ii875qm` (`user_id`),
  CONSTRAINT `FKherb88q97dxbtcge09ii875qm` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2492 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_user_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_vote_list
-- ----------------------------
DROP TABLE IF EXISTS `aoa_vote_list`;
CREATE TABLE `aoa_vote_list` (
  `vote_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `end_time` datetime DEFAULT NULL,
  `selectone` int(11) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_vote_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for aoa_vote_title_user
-- ----------------------------
DROP TABLE IF EXISTS `aoa_vote_title_user`;
CREATE TABLE `aoa_vote_title_user` (
  `vote_title_user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vote_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `title_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`vote_title_user_id`),
  KEY `FKb2pou179gr3wf10lx0wy6qrli` (`user_id`),
  KEY `FK79ia8m9w7faxi7wmth7or8mqg` (`title_id`),
  CONSTRAINT `FK79ia8m9w7faxi7wmth7or8mqg` FOREIGN KEY (`title_id`) REFERENCES `aoa_vote_titles` (`title_id`),
  CONSTRAINT `FKb2pou179gr3wf10lx0wy6qrli` FOREIGN KEY (`user_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_vote_title_user
-- ----------------------------
BEGIN;
INSERT INTO `aoa_vote_title_user` VALUES (1, 3, 1, 7);
INSERT INTO `aoa_vote_title_user` VALUES (2, 3, 2, 8);
INSERT INTO `aoa_vote_title_user` VALUES (3, 3, 3, 9);
INSERT INTO `aoa_vote_title_user` VALUES (4, 3, 4, 7);
INSERT INTO `aoa_vote_title_user` VALUES (5, 1, 2, 2);
INSERT INTO `aoa_vote_title_user` VALUES (6, 2, 2, 4);
INSERT INTO `aoa_vote_title_user` VALUES (7, 4, 2, 11);
INSERT INTO `aoa_vote_title_user` VALUES (8, 4, 2, 12);
INSERT INTO `aoa_vote_title_user` VALUES (9, 4, 2, 13);
INSERT INTO `aoa_vote_title_user` VALUES (13, 5, 2, 15);
INSERT INTO `aoa_vote_title_user` VALUES (17, 8, 2, 23);
INSERT INTO `aoa_vote_title_user` VALUES (18, 8, 2, 24);
INSERT INTO `aoa_vote_title_user` VALUES (19, 8, 2, 25);
INSERT INTO `aoa_vote_title_user` VALUES (20, 11, 2, 32);
INSERT INTO `aoa_vote_title_user` VALUES (21, 8, 1, 23);
INSERT INTO `aoa_vote_title_user` VALUES (22, 8, 1, 24);
INSERT INTO `aoa_vote_title_user` VALUES (23, 8, 1, 25);
COMMIT;

-- ----------------------------
-- Table structure for aoa_vote_titles
-- ----------------------------
DROP TABLE IF EXISTS `aoa_vote_titles`;
CREATE TABLE `aoa_vote_titles` (
  `title_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `vote_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`title_id`),
  KEY `FKnl21d99b8hc6gtfrrfsc9alge` (`vote_id`),
  CONSTRAINT `FKnl21d99b8hc6gtfrrfsc9alge` FOREIGN KEY (`vote_id`) REFERENCES `aoa_vote_list` (`vote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of aoa_vote_titles
-- ----------------------------
BEGIN;COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for aoa_meal_item
-- ----------------------------
DROP TABLE IF EXISTS `aoa_meal_item`;
CREATE TABLE `aoa_meal_item` (
  `meal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `meal_price` bigint(20) DEFAULT 0,
  `meal_name` varchar(255) NOT NULL,
  `meal_desc` varchar(255) DEFAULT NULL,
  `meal_image` varchar(255) NOT NULL,
  `sort_id` int(11) DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`meal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for aoa_meal_order
-- ----------------------------
DROP TABLE IF EXISTS `aoa_meal_order`;
CREATE TABLE `aoa_meal_order` (
  `meal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_price` bigint(20) DEFAULT 0,
  `order_detail` text DEFAULT '',
  `buyer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`meal_id`),
  KEY (`buyer_id`),
  CONSTRAINT FOREIGN KEY (`buyer_id`) REFERENCES `aoa_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;
