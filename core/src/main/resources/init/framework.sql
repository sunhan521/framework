/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost
 Source Database       : xx-beehive

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : utf-8

 Date: 02/20/2017 11:18:09 AM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `DATABASECHANGELOG`
-- ----------------------------
DROP TABLE IF EXISTS `DATABASECHANGELOG`;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_bin DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
--  Records of `DATABASECHANGELOG`
-- ----------------------------
BEGIN;
INSERT INTO `DATABASECHANGELOG` VALUES ('15862614903-001', 'SunHan', 'src/main/resources/changelog.xml', '2017-01-21 13:25:36', '1', 'EXECUTED', '7:075b093ca4848bcac48c96badb7a0e10', 'sql', '', null, '3.5.3', null, null, '4976336080'), ('15862614903-002', 'SunHan', 'src/main/resources/changelog.xml', '2017-01-21 13:25:36', '2', 'EXECUTED', '7:097fbecc73c413930f6a9b801c8c9d56', 'sql', '', null, '3.5.3', null, null, '4976336080'), ('15862614903-003', 'SunHan', 'src/main/resources/changelog.xml', '2017-01-21 13:25:36', '3', 'EXECUTED', '7:c4b753c4cec43c7de64c7c7568506f8c', 'sql', '', null, '3.5.3', null, null, '4976336080'), ('15862614903-004', 'SunHan', 'src/main/resources/changelog.xml', '2017-01-21 13:25:36', '4', 'EXECUTED', '7:822f14df02c5af576518c23e3d2857e9', 'sql', '', null, '3.5.3', null, null, '4976336080'), ('15862614903-005', 'SunHan', 'src/main/resources/changelog.xml', '2017-01-21 13:25:36', '5', 'EXECUTED', '7:c96cae7e45fc2ef84edbe34219367b39', 'sql', '', null, '3.5.3', null, null, '4976336080'), ('15862614903-006', 'SunHan', 'src/main/resources/changelog.xml', '2017-01-21 13:25:36', '6', 'EXECUTED', '7:470038c20ff0a4665903358ed863a221', 'sql', '', null, '3.5.3', null, null, '4976336080'), ('15862614903-007', 'SunHan', 'src/main/resources/changelog.xml', '2017-01-21 13:25:36', '7', 'EXECUTED', '7:88300ab8b62ea6762023e7f3b8c686ad', 'sql', '', null, '3.5.3', null, null, '4976336080'), ('15862614903-008', 'SunHan', 'src/main/resources/changelog.xml', '2017-01-21 15:10:29', '8', 'EXECUTED', '7:a1f1928a3fc0c81bb289c970e10755bb', 'sql', '', null, '3.5.3', null, null, '4982629551');
COMMIT;

-- ----------------------------
--  Table structure for `DATABASECHANGELOGLOCK`
-- ----------------------------
DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
--  Records of `DATABASECHANGELOGLOCK`
-- ----------------------------
BEGIN;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES ('1', b'0', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` int(11) NOT NULL COMMENT '数据值',
  `label` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `type` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('13', '2123', '12', '123233234·', '23', '2332', '0'), ('14', '123', '23', '23', '123', '23', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '菜单名称',
  `url` varchar(255) DEFAULT NULL COMMENT '菜单URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `order` int(11) DEFAULT NULL COMMENT '菜单顺序',
  `icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `type` int(11) DEFAULT NULL COMMENT '菜单类型 资源类型：1-分类；2-菜单',
  `description` varchar(255) DEFAULT NULL,
  `del_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('2', '系统管理', '#', '0', '1', 'icon-home', '1', '0', b'0'), ('3', '权限管理', 'right', '1', '2', '', '2', '1', b'0'), ('4', '用户管理', 'user', '1', '3', '', '2', '1', b'0'), ('5', '角色管理', 'role', '1', '4', '', '2', '1', b'0'), ('6', '数据管理', 'record', '94', '5', null, '2', '1', b'0'), ('7', '数据管理', '#', '0', '2', 'fa fa-database', '1', '1', b'0'), ('8', '数据查看', 'record/list_x', '94', '2', null, '2', '1', b'0'), ('9', '个人中心', '#', '0', '30', 'icon-user', '1', '1', b'0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL COMMENT '子菜单名称',
  `name` varchar(64) NOT NULL COMMENT '权限名称',
  `permission` varchar(255) NOT NULL COMMENT '权限标识',
  `del_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL COMMENT '角色名称',
  `type` varchar(64) NOT NULL COMMENT '角色标识',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `del_flag` int(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
--  Table structure for `sys_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `role_id` int(11) NOT NULL DEFAULT '0',
  `resource_id` int(11) NOT NULL DEFAULT '0',
  `resource_type` int(3) NOT NULL DEFAULT '0' COMMENT '资源类型：1-分类； 2-菜单；3-按钮',
  PRIMARY KEY (`role_id`,`resource_id`),
  KEY `role_id_idx` (`role_id`),
  KEY `resource_id_idx` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限和资源（菜单+按钮）';

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(64) NOT NULL COMMENT '登录名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `last_login` varchar(255) DEFAULT NULL COMMENT '上次登录时间',
  `ip` varchar(32) DEFAULT NULL COMMENT 'IP',
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` int(11) DEFAULT NULL COMMENT '创建者',
  `update_by` int(11) DEFAULT NULL COMMENT '更新者',
  `status` int(8) DEFAULT NULL COMMENT '状态',
  `del_flag` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '管理1', '2017-01-20 21:15:56', '0:0:0:0:0:0:0:1', '1', null, '管理', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '1', '1', '0', b'0'), ('2', 'sunhan', '71431ddb024987660b7faedf7880fbf35eb9f1dc', '孙汉', '2016-10-09 01:06:06', null, '-1', '', 'sunhan521@qq.com', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '123', '1', '0', b'0'), ('3', 'lingyou', 'c7462de9517c57277b9d737312cff07b2c19bcb3', '灵游', '2016-10-11 00:14:29', null, '-1', '', '123@qq.com', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '1', '0', b'0'), ('4', 'xiaoye', 'd2d0f437df4005ccaed7a4746c570fc922bb2c54', '小叶', '2017-01-20 11:16:22', null, '1', '', '123@qq.com', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '1', '0', b'0'), ('5', 'testchannel', 'a9406b83720157331fcf3dded541e47261ac9084', '测试渠道', '2016-10-13 00:23:01', null, '1', '', '1', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '1', '0', b'0'), ('6', 'testchannel2', 'ef108224b9b8c532e3c4d676f7697eb736572c21', '测试2', '2016-10-12 14:52:06', null, '-1', '', '2', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '1', '0', b'0'), ('7', 'yunying1', '0a3004a4561a74bce92124e20f063342c1c67c46', '运营1', '2016-10-24 12:15:39', null, '1', '', '1', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '1', '0', b'0'), ('8', 'yunying2', '1b8116bb2cc981a8dea1bd45687a0bc7936961ab', '运营2', '2017-01-06 17:25:36', null, '1', '', '1', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '1', '1', '0', b'0'), ('9', 'zhenqu', 'fb1afc2ea0f06a7190349a6b96e3f7be871f5860', '真趣', '2017-01-06 17:32:07', null, '1', '', '327519660@qq.com', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '0', '0', b'0'), ('10', 'suiyun', '1fb9526a32035b00cfed1f97592fac547cb13e26', '随云', '2016-11-01 16:27:24', null, '1', '', '。', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '0', '0', b'0'), ('11', 'test', 'ac8de3b5b736fd627b42c91071c5c2a6ec963a89', '1', '2016-10-14 00:14:30', null, '-1', '', '1', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '1', '1', '0', b'0'), ('12', 'test2', '69a1a4aaa190acea97fdbdd81c4f4aa8a561c9cd', '1', '2016-10-14 00:10:50', null, '-1', '', '1', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '1', '1', '0', b'0'), ('13', 'daxiong', 'f066a0b289442d7992892607e6f84065e5a74c85', '大熊', '2017-01-06 15:34:43', null, '1', '', '1', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '0', '0', b'0'), ('14', 'dianrui', 'a4c8217de4a48be48444af687cdf507d9d28db25', '点瑞', '2016-12-02 14:07:27', null, '1', '', '1', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '0', '0', b'0'), ('15', '编故事的人', 'a5aec2e76160c5698093c4f69272cc9b01cf28e1', '编故事的人', '2016-12-28 10:08:37', null, '1', '', '1', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '1', '1', '1', b'1'), ('16', 'kangkang', '77dd55c886f8ee7c3209d94c667b1b09ce4c1a50', '康康', null, null, '1', '', '1', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '2', '0', '0', b'0'), ('17', 'tqcx_1', '36cbf2b480e8504ebafe01ecacccc533e9aa3511', '张林', '2016-10-20 18:54:36', null, '-1', '', '1251231@126.com', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '1', '0', b'1'), ('18', 'mengmeng', 'fea2bd1d733a69988a24ead44a5c6014509b2582', '萌萌', '2016-12-19 14:31:43', null, '1', '', '1', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '0', '0', b'0'), ('19', '知微', 'cf900588942ef69dfc6930aeb8526ae89517cc59', '范范', '2016-12-13 14:43:49', null, '1', '', '2816663204@qq.com', '2017-01-21 17:30:11', '2017-01-21 17:30:11', '0', '2', '0', b'0'), ('20', 'postman2', '111', '111', '2016-10-31 23:57:37', null, '-1', '4728013861@qq.com', '158621614990', '2017-01-21 17:30:11', '2017-01-21 17:31:50', '0', '1', '0', b'0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色';

SET FOREIGN_KEY_CHECKS = 1;
