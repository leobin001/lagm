/*
Navicat MySQL Data Transfer

Source Server         : apache本地
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : lagm

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2019-04-28 23:33:09
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
INSERT INTO `article` VALUES ('1', '1', '0615梦开始的日子', 'Public/uploadListImg/2019428/201904282011503581905.jpg', '                                                                                                &lt;p style=&quot;text-align: center; &quot;&gt;&lt;img src=&quot;http://lagm.com/Public/uploadArticleImg/2019428/201904282012188929597.jpg&quot; alt=&quot;IMG_20140615_181928&quot; style=&quot;max-width:100%;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: left;&quot;&gt;这应该是我们的第一次合照吧，拍摄时间定格在2014年6月15日18点19分28秒。&lt;span style=&quot;color: inherit;&quot;&gt;犹记得这顿是吃辣的，当时辣得我呀。。。不过我现在已经进步不少啦。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: left;&quot;&gt;那一刻你还有点小胖哈，我发际线还没开始后移。如今你越瘦越美，我就往秃秃秃更近一步了。&lt;/p&gt;&lt;p style=&quot;text-align: left;&quot;&gt;那一天，幸好我鼓起勇气拉起你的手，这一拉，让我们的人生轨迹慢慢走向重叠。感谢我们的媒婆，感谢缘分如此奇妙~~&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;                                                                                    ', '8', '2', '1550409618', '1556455660', '0');
INSERT INTO `article` VALUES ('2', '1', '第一次去旅游', 'Public/uploadListImg/2019428/201904282321111597099.jpg', '                                                                                                                                                                                                                                                                                                                            &lt;p style=&quot;text-align: center; &quot;&gt;&lt;img src=&quot;http://lagm.com/Public/uploadArticleImg/2019428/20190428232147949.jpg&quot; alt=&quot;111&quot; style=&quot;max-width:100%;&quot; class=&quot;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: left;&quot;&gt;这是我们第一次去旅游，国企的武汉长沙之旅（江滩、武汉大学、橘子洲头），武汉大学很美，橘子洲头走路实在太累了。还吃了周黑鸭，热干面，回去广州好像还买过一个鸭脖子，但是味道感觉没那么好吃。这次旅行很值得怀念，可惜应该不会再有了。&lt;/p&gt;&lt;p style=&quot;text-align: left;&quot;&gt;最后附上一张我的随手一拍，拍得还是美美哒。不过现在我的拍摄技术还是渣渣的，是时候拿出封尘已久的相机了。&lt;/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;http://lagm.com/Public/uploadArticleImg/2019428/201904282330474562690.jpg&quot; alt=&quot;222&quot; style=&quot;max-width:100%;&quot; class=&quot;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '6', '0', '1555339287', '1556465461', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '2014', '1549445330', '1556452537', '0');
INSERT INTO `category` VALUES ('2', '0', '2015', '1550409575', '1556452546', '0');
INSERT INTO `category` VALUES ('3', '0', '2016', '1550409579', '1556452553', '0');
INSERT INTO `category` VALUES ('4', '0', '2017', '1550409604', '1556452569', '0');
INSERT INTO `category` VALUES ('5', '0', '2018', '1550409618', '1556452576', '0');
INSERT INTO `category` VALUES ('6', '0', '2019', '1555339121', '1556452583', '0');
