/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : retrans

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-03-10 20:54:41
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
  `operation_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `event_operation` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('1', '1', 'admin', '2018-03-10 20:08:34', '登录', '1.1.1.1');

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
  `warning_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
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
