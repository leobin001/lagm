/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : lagm

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2019-04-24 13:44:00
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
  `list_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '列表图片',
  `content` text NOT NULL COMMENT '文章内容，富文本',
  `read_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读数',
  `like_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0是启用，1是删除',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '2', 'first time1', 'Public/uploadListImg/2019422/201904221057326655514.jpg', '                                                                                                                                                                                                                                                                                                                            &lt;p&gt;Trainers,&lt;/p&gt;&lt;p&gt;We are excited to announce that Shiny Meltan is back for a limited time! Meltan, a mysterious and rare Pokémon, only appears when the Mystery Box is opened in Pokémon GO. If you’re lucky, you may encounter Shiny Meltan when you open the Mystery Box from Wednesday, April 24, at 1:00 p.m. PDT until Sunday, May 5, at 1:00 p.m. PDT!&lt;/p&gt;&lt;p&gt;The key to catching Meltan is the Mystery Box, which can be obtained by sending a Pokémon from Pokémon GO to the Nintendo Switch titles Pokémon: Let’s Go, Pikachu! or Pokémon: Let’s Go, Eevee!&lt;/p&gt;&lt;p&gt;Until now, Trainers had to wait seven days after opening the Mystery Box before opening it again. Starting Wednesday, April 24, at 1:00 p.m. PDT, you’ll be able to open the Mystery Box once every three days, making it easier to get Meltan! Don’t miss your chance to evolve Shiny Meltan into Shiny Melmetal! Start collecting those Meltan Candies, Trainer!&lt;/p&gt;&lt;p&gt;Date + Time&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Wednesday, Apr. 24, at 1:00 p.m. PDT (GMT −7) until Sunday, May 5, at 1:00 p.m. PDT (GMT −7)&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;Features&lt;/p&gt;&lt;ul&gt;&lt;li&gt;When you open the Mystery Box, you may encounter the Shiny version of the Mythical Pokémon Meltan!&lt;/li&gt;&lt;li&gt;Trainers will now be able to open the Mystery Box every three days, even after the event ends.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;—The Pokémon GO team&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; &quot;&gt;&lt;img src=&quot;http://lagm.com/Public/uploadArticleImg/2019419/201904191345059454841.jpg&quot; alt=&quot;default&quot; style=&quot;max-width:100%;&quot; class=&quot;&quot;&gt;&lt;br&gt;&lt;/p&gt;                            &lt;p&gt;&lt;br&gt;&lt;/p&gt;                                                                                                                                                                        ', '50', '2', '1550409618', '1556068538', '0');
INSERT INTO `article` VALUES ('2', '2', '666', 'Public/uploadListImg/2019422/201904221057411350277.jpg', '                                                                                                                                                                                                                                                                                            &lt;p&gt;呃呃呃&lt;/p&gt;                                                                                                                                                                                                    ', '0', '0', '1555339287', '1555901863', '0');
INSERT INTO `article` VALUES ('3', '2', 'test', 'Public/uploadListImg/2019422/201904221057496826120.jpg', '                                                                                                                                                            &lt;p&gt;&lt;b&gt;hello world&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;                                                                                    ', '0', '0', '1555893314', '1555901871', '0');
INSERT INTO `article` VALUES ('4', '2', 'good luck', 'Public/uploadListImg/2019422/20190422105757362649.jpg', '                                                                                                                                                                                                                            &lt;p&gt;&lt;b&gt;&lt;i style=&quot;&quot;&gt;发士大夫士大夫士大夫&lt;/i&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;                                                                                                                                            ', '0', '0', '1555893353', '1555901879', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '雷系', '1549445330', '1549445330', '0');
INSERT INTO `category` VALUES ('2', '0', '火系', '1550409575', '1550409575', '0');
INSERT INTO `category` VALUES ('3', '0', '水系', '1550409579', '1550409579', '0');
INSERT INTO `category` VALUES ('4', '0', '草系', '1550409604', '1550409604', '0');
INSERT INTO `category` VALUES ('5', '0', '2018年', '1550409618', '1550409618', '0');
INSERT INTO `category` VALUES ('6', '0', 'first time', '1555339121', '1555339121', '0');
