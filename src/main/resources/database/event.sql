/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : retrans

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-03-25 21:57:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `id` char(20) NOT NULL,
  `user_id` char(20) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `operation_time` datetime DEFAULT NULL,
  `event_operation` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('1', '1', 'admin', '2018-03-10 20:08:34', '登录', '1.1.1.1');
INSERT INTO `event` VALUES ('2', '2', 'admin1', '2018-03-08 20:08:34', '登录1', '1.1.1.2');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collect_date` date DEFAULT NULL,
  `collect_time` time DEFAULT NULL,
  `filter_pumb_1` tinyint(2) DEFAULT NULL,
  `filter_pumb_2` tinyint(2) DEFAULT NULL,
  `pac_blender` tinyint(2) DEFAULT NULL,
  `pam_blender` tinyint(2) DEFAULT NULL,
  `pac_metering_pumb_1` tinyint(2) DEFAULT NULL,
  `pac_metering_pumb_2` tinyint(2) DEFAULT NULL,
  `pam_metering_pumb_1` tinyint(2) DEFAULT NULL,
  `pam_metering_pumb_2` tinyint(2) DEFAULT NULL,
  `raw_water_pumb_1` tinyint(2) DEFAULT NULL,
  `raw_water_pumb_2` tinyint(2) DEFAULT NULL,
  `water_supply_pumb_1` tinyint(2) DEFAULT NULL,
  `water_supply_pumb_2` tinyint(2) DEFAULT NULL,
  `back_flush_pumb` tinyint(2) DEFAULT NULL,
  `blower` tinyint(2) DEFAULT NULL,
  `anti_virus_device` tinyint(2) DEFAULT NULL,
  `electric_valve` tinyint(2) DEFAULT NULL,
  `medical_kit_index` tinyint(2) DEFAULT NULL,
  `regulate_low` tinyint(2) DEFAULT NULL,
  `regulate_high` tinyint(2) DEFAULT NULL,
  `middle_low` tinyint(2) DEFAULT NULL,
  `middle_middle` tinyint(2) DEFAULT NULL,
  `middle_high` tinyint(2) DEFAULT NULL,
  `water_low` tinyint(2) DEFAULT NULL,
  `water_middle` tinyint(2) DEFAULT NULL,
  `water_high` tinyint(2) DEFAULT NULL,
  `black_flush_1` tinyint(2) DEFAULT NULL,
  `black_flush_2` tinyint(2) DEFAULT NULL,
  `black_flush_3` tinyint(2) DEFAULT NULL,
  `black_flush_4` tinyint(2) DEFAULT NULL,
  `system_run` tinyint(2) DEFAULT NULL,
  `mud_level` double DEFAULT NULL,
  `env_dimidity` double DEFAULT NULL,
  `env_temperature` double DEFAULT NULL,
  `cable_temperature` double DEFAULT NULL,
  `smoke_signal` double DEFAULT NULL,
  `water_signal` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------
INSERT INTO `report` VALUES ('10', '2018-03-25', '21:56:47', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '0', '1', '0', '0', '1', '0', '1', '1', '1', '1', '1', '2', '20', '15', '26', '1', '1');
INSERT INTO `report` VALUES ('11', '2018-03-25', '21:56:47', '0', '1', '1', '0', '-2', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '0', '1', '0', '0', '1', '0', '1', '1', '1', '1', '1', '3.5', '21.2', '20', '24.5', '1', '0');
INSERT INTO `report` VALUES ('12', '2018-03-25', '21:56:47', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '0', '1', '0', '0', '1', '0', '1', '1', '1', '1', '1', '4.7', '15.2', '16.2', '29.8', '0', '0');
INSERT INTO `report` VALUES ('13', '2018-03-25', '21:56:47', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '0', '1', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '3', '19.8', '15.2', '27.2', '0', '1');
INSERT INTO `report` VALUES ('14', '2018-03-25', '21:56:47', '0', '1', '1', '0', '-2', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '0', '1', '0', '0', '1', '0', '1', '1', '1', '1', '1', '1.5', '29.1', '18.1', '29.4', '1', '0');
INSERT INTO `report` VALUES ('15', '2018-03-25', '21:56:47', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '0', '1', '0', '0', '1', '0', '1', '1', '1', '1', '1', '4', '18.5', '19.9', '26.3', '0', '0');
INSERT INTO `report` VALUES ('16', '2018-03-25', '21:56:47', '0', '1', '1', '0', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '0', '1', '0', '0', '0', '1', '1', '1', '1', '1', '1', '2.5', '20.1', '15', '28.9', '0', '1');

-- ----------------------------
-- Table structure for report1
-- ----------------------------
DROP TABLE IF EXISTS `report1`;
CREATE TABLE `report1` (
  `id` char(20) NOT NULL,
  `collect_time` datetime DEFAULT NULL,
  `env_temperature` double DEFAULT NULL,
  `env_humidity` double DEFAULT NULL,
  `cable_temperature` double DEFAULT NULL,
  `smoke_signal` double DEFAULT NULL,
  `water_signal` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report1
-- ----------------------------
INSERT INTO `report1` VALUES ('1', '2018-03-13 18:16:31', '11', '12', '11111', null, null);
INSERT INTO `report1` VALUES ('2', '2018-03-14 18:16:44', '12', '13', '2222', null, null);
INSERT INTO `report1` VALUES ('3', '2018-03-14 18:16:44', '12', '13', '2222', null, null);
INSERT INTO `report1` VALUES ('4', '2018-03-14 18:16:44', '12', '13', '2222', null, null);
INSERT INTO `report1` VALUES ('5', '2018-03-14 18:16:44', '12', '13', '2222', null, null);
INSERT INTO `report1` VALUES ('6', '2018-03-14 18:16:44', '12', '13', '2222', null, null);
INSERT INTO `report1` VALUES ('7', '2018-03-14 18:16:44', '12', '13', '2222', null, null);
INSERT INTO `report1` VALUES ('8', '2018-03-14 18:16:44', '12', '13', '2222', null, null);

-- ----------------------------
-- Table structure for trend_data
-- ----------------------------
DROP TABLE IF EXISTS `trend_data`;
CREATE TABLE `trend_data` (
  `id` char(20) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `data` double DEFAULT NULL,
  `sum` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trend_data
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` char(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '46a642cfdef78c00240bb7adb34ba260', 'admin', '123', '1');

-- ----------------------------
-- Table structure for warning
-- ----------------------------
DROP TABLE IF EXISTS `warning`;
CREATE TABLE `warning` (
  `id` char(20) NOT NULL,
  `warning_time` datetime DEFAULT NULL,
  `warning_object` varchar(255) DEFAULT NULL,
  `warning_type` varchar(255) DEFAULT NULL,
  `warning_event` varchar(255) DEFAULT NULL,
  `current_value` double DEFAULT NULL,
  `limit_value` double DEFAULT NULL,
  `warning_desc` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warning
-- ----------------------------
INSERT INTO `warning` VALUES ('1', '2018-03-10 19:12:19', '1', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('10', '2018-03-10 19:12:21', '2', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('11', '2018-03-10 19:12:23', '3', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('12', '2018-03-10 19:12:24', '4', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('13', '2018-03-10 19:12:25', '5', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('14', '2018-03-10 19:12:26', '6', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('15', '2018-03-10 19:12:27', '7', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('16', '2018-03-10 19:12:28', '8', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('17', '2018-03-10 19:12:29', '9', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('2', '2018-03-10 19:12:32', '10', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('3', '2018-03-10 19:12:34', '11', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('4', '2018-03-10 18:15:08', '12', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('5', '2018-03-10 19:12:36', '13', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('6', '2018-03-10 19:12:38', '14', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('7', '2018-03-10 19:12:40', '15', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('8', '2018-03-10 19:12:42', '16', '23', '33', '1', '1', '111');
INSERT INTO `warning` VALUES ('9', '2018-03-10 19:12:45', '17', '23', '33', '1', '1', '111');
