/*
Navicat MySQL Data Transfer

Source Server         : apache本地
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : lagm

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2019-02-17 21:21:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` varchar(30) NOT NULL DEFAULT '' COMMENT '账号',
  `pwd` varchar(80) NOT NULL DEFAULT '' COMMENT '密码',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '登陆时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', '0', '0');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '文章标题',
  `content` text NOT NULL COMMENT '文章内容，富文本',
  `read` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数',
  `like` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0是启用，1是删除',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `category_name` varchar(30) NOT NULL DEFAULT '' COMMENT '目录名',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0是启用，1是删除',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '2014年', '1549445330', '1549445330', '0');
INSERT INTO `category` VALUES ('2', '0', '2015年', '1550409575', '1550409575', '0');
INSERT INTO `category` VALUES ('3', '0', '2016年', '1550409579', '1550409579', '0');
INSERT INTO `category` VALUES ('4', '0', '2017年', '1550409604', '1550409604', '0');
INSERT INTO `category` VALUES ('5', '0', '2018年', '1550409618', '1550409618', '0');
