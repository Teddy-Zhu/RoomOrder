/*
Navicat MySQL Data Transfer

Source Server         : z
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : roomorder

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2014-07-17 19:46:49
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `classtimetype`
-- ----------------------------
DROP TABLE IF EXISTS `classtimetype`;
CREATE TABLE `classtimetype` (
  `lendtime` int(11) NOT NULL,
  `realtime` varchar(40) NOT NULL,
  PRIMARY KEY (`lendtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classtimetype
-- ----------------------------
INSERT INTO `classtimetype` VALUES ('1', '8:40-9:25*8:30-9:30');
INSERT INTO `classtimetype` VALUES ('2', '9:35-10:20*9:30-10:30');
INSERT INTO `classtimetype` VALUES ('3', '10:40-11:25*10:30-11:30');
INSERT INTO `classtimetype` VALUES ('4', '11:35-12:20*11:30-12:30');
INSERT INTO `classtimetype` VALUES ('5', '14:00-14:45*13:30-14:30');
INSERT INTO `classtimetype` VALUES ('6', '14:50-15:35*14:30-15:30');
INSERT INTO `classtimetype` VALUES ('7', '15:55-16:40*15:40-16:40');
INSERT INTO `classtimetype` VALUES ('8', '16:45-17:30*16:40-17:40');
INSERT INTO `classtimetype` VALUES ('9', '18:50-19:35*18:30-19:30');
INSERT INTO `classtimetype` VALUES ('10', '19:45-20:30*19:30-20:30');

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `sqltext` varchar(300) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sqlid` (`userid`),
  CONSTRAINT `sqlid` FOREIGN KEY (`userid`) REFERENCES `userbasic` (`userid`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('1', '1', '添加了教室A2S525', '2014-07-04 17:37:40');
INSERT INTO `logs` VALUES ('2', '1', '查询了可借教室信息0,50', '2014-07-04 17:50:44');
INSERT INTO `logs` VALUES ('3', '1', '查询了可借教室信息0,50', '2014-07-04 17:52:11');
INSERT INTO `logs` VALUES ('4', '1', '查询了可借教室信息0,50', '2014-07-04 17:52:50');
INSERT INTO `logs` VALUES ('5', '1', '查询了可借教室信息0,50', '2014-07-04 18:09:01');
INSERT INTO `logs` VALUES ('6', '1', '查询了可借教室信息0,50', '2014-07-04 18:09:59');
INSERT INTO `logs` VALUES ('7', '1', '查询了可借教室信息0,50', '2014-07-04 18:10:12');
INSERT INTO `logs` VALUES ('8', '1', '查询了可借教室信息0,50', '2014-07-04 18:10:21');
INSERT INTO `logs` VALUES ('9', '1', '取消了ID为8的预约', '2014-07-04 18:12:57');
INSERT INTO `logs` VALUES ('10', '1', '取消了ID为9的预约', '2014-07-04 18:13:07');
INSERT INTO `logs` VALUES ('11', '1', '取消了ID为12的预约', '2014-07-04 18:13:43');
INSERT INTO `logs` VALUES ('12', '1', '取消了ID为14的预约', '2014-07-04 18:17:49');
INSERT INTO `logs` VALUES ('13', '1', '取消了ID为22的预约', '2014-07-04 18:17:57');
INSERT INTO `logs` VALUES ('14', '1', '取消了ID为13的预约', '2014-07-04 18:18:18');
INSERT INTO `logs` VALUES ('15', '1', '取消了ID为17的预约', '2014-07-04 18:18:37');
INSERT INTO `logs` VALUES ('16', '1', '取消了ID为16的预约', '2014-07-04 18:18:50');
INSERT INTO `logs` VALUES ('17', '1', '取消了ID为18的预约', '2014-07-04 18:18:52');
INSERT INTO `logs` VALUES ('18', '2', '查询了可借教室信息0,50', '2014-07-06 09:27:56');
INSERT INTO `logs` VALUES ('19', '2', '查询了可借教室信息50,50', '2014-07-06 09:27:58');
INSERT INTO `logs` VALUES ('20', '2', '查询了可借教室信息100,50', '2014-07-06 09:27:59');
INSERT INTO `logs` VALUES ('21', '2', '查询了可借教室信息150,20', '2014-07-06 09:27:59');
INSERT INTO `logs` VALUES ('22', '1', '添加了类型名为:test的类型', '2014-07-07 06:26:00');
INSERT INTO `logs` VALUES ('23', '1', '添加了类型名为:测试名称的类型', '2014-07-07 06:26:09');
INSERT INTO `logs` VALUES ('24', '1', '删除了类型名为:6的类型', '2014-07-07 06:26:23');
INSERT INTO `logs` VALUES ('25', '1', '删除了类型名为:7的类型', '2014-07-07 06:26:26');
INSERT INTO `logs` VALUES ('26', '1', '修改了A1N101的基本数据.', '2014-07-07 06:31:23');
INSERT INTO `logs` VALUES ('27', '13', '注册了用户名为test的用户', '2014-07-07 00:00:00');
INSERT INTO `logs` VALUES ('28', '1', '取消了ID为19的预约', '2014-07-07 06:44:53');
INSERT INTO `logs` VALUES ('29', '1', '取消了ID为15的预约', '2014-07-07 06:44:55');
INSERT INTO `logs` VALUES ('30', '1', '取消了ID为21的预约', '2014-07-07 06:44:58');
INSERT INTO `logs` VALUES ('31', '1', '更新了教室A1N101的基本数据.', '2014-07-08 08:13:13');
INSERT INTO `logs` VALUES ('32', '1', '更新了教室A1N101的基本数据.', '2014-07-08 08:15:16');
INSERT INTO `logs` VALUES ('33', '2', '取消了ID为30的预约', '2014-07-08 08:19:14');
INSERT INTO `logs` VALUES ('34', '2', '查询了可借教室信息0,50', '2014-07-08 08:19:26');
INSERT INTO `logs` VALUES ('35', '2', '查询了可借教室信息50,50', '2014-07-08 08:19:29');
INSERT INTO `logs` VALUES ('36', '2', '查询了可借教室信息0,50', '2014-07-08 08:20:35');
INSERT INTO `logs` VALUES ('37', '2', '查询了可借教室信息0,50', '2014-07-08 08:22:11');
INSERT INTO `logs` VALUES ('38', '2', '查询了可借教室信息0,50', '2014-07-08 08:22:12');
INSERT INTO `logs` VALUES ('39', '2', '查询了可借教室信息50,50', '2014-07-08 08:22:25');
INSERT INTO `logs` VALUES ('40', '2', '查询了可借教室信息100,50', '2014-07-08 08:22:26');
INSERT INTO `logs` VALUES ('41', '2', '查询了可借教室信息150,20', '2014-07-08 08:22:27');
INSERT INTO `logs` VALUES ('42', '2', '查询了可借教室信息100,50', '2014-07-08 08:22:28');
INSERT INTO `logs` VALUES ('43', '2', '查询了可借教室信息150,20', '2014-07-08 08:22:32');
INSERT INTO `logs` VALUES ('44', '2', '查询了可借教室信息0,5', '2014-07-08 08:22:34');
INSERT INTO `logs` VALUES ('45', '2', '查询了可借教室信息0,50', '2014-07-08 08:22:37');
INSERT INTO `logs` VALUES ('46', '1', '查询了可借教室信息0,50', '2014-07-16 07:57:21');
INSERT INTO `logs` VALUES ('47', '1', '添加了教室A1N332的教室预约申请.', '2014-07-16 07:57:30');
INSERT INTO `logs` VALUES ('48', '1', '更新了教室A3N313的基本数据.', '2014-07-16 07:58:36');
INSERT INTO `logs` VALUES ('49', '1', '更新了预约ID3的预约状态为2', '2014-07-16 07:58:55');

-- ----------------------------
-- Table structure for `roombasicinfo`
-- ----------------------------
DROP TABLE IF EXISTS `roombasicinfo`;
CREATE TABLE `roombasicinfo` (
  `roomlocal` varchar(20) NOT NULL DEFAULT '',
  `roomcount` int(11) NOT NULL COMMENT '总计座位数',
  `examecount` int(11) NOT NULL COMMENT '考试人数',
  `roomtype` int(11) NOT NULL COMMENT '教室种类',
  PRIMARY KEY (`roomlocal`),
  KEY `roomtype` (`roomtype`),
  CONSTRAINT `roomtype` FOREIGN KEY (`roomtype`) REFERENCES `roomtype` (`roomtype`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roombasicinfo
-- ----------------------------
INSERT INTO `roombasicinfo` VALUES ('A1N101', '22', '1211', '2');
INSERT INTO `roombasicinfo` VALUES ('A1N332', '12', '123', '3');
INSERT INTO `roombasicinfo` VALUES ('A1S305', '11', '55', '1');
INSERT INTO `roombasicinfo` VALUES ('A2N335', '525', '23', '2');
INSERT INTO `roombasicinfo` VALUES ('A2N362', '25', '1', '5');
INSERT INTO `roombasicinfo` VALUES ('A2S111', '22', '425', '2');
INSERT INTO `roombasicinfo` VALUES ('A2S525', '23', '23', '1');
INSERT INTO `roombasicinfo` VALUES ('A3N313', '12', '12', '3');
INSERT INTO `roombasicinfo` VALUES ('A3N319', '12', '12', '1');
INSERT INTO `roombasicinfo` VALUES ('A3N415', '123', '123', '1');
INSERT INTO `roombasicinfo` VALUES ('A3S120', '33', '12', '3');
INSERT INTO `roombasicinfo` VALUES ('A3S555', '6555', '236', '5');
INSERT INTO `roombasicinfo` VALUES ('A4N125', '23', '1', '1');
INSERT INTO `roombasicinfo` VALUES ('A4N363', '22', '22', '2');
INSERT INTO `roombasicinfo` VALUES ('A4N554', '20', '3432', '2');
INSERT INTO `roombasicinfo` VALUES ('A4S315', '22', '32', '1');
INSERT INTO `roombasicinfo` VALUES ('A4S666', '254', '65', '1');

-- ----------------------------
-- Table structure for `roomorderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `roomorderinfo`;
CREATE TABLE `roomorderinfo` (
  `roomid` int(11) NOT NULL AUTO_INCREMENT,
  `roomlocal` varchar(20) DEFAULT NULL COMMENT '用户位置 a1102',
  `userid` int(11) NOT NULL COMMENT '预约者的id',
  `orderfor` varchar(100) DEFAULT NULL COMMENT '租借原因',
  `lenddate` date NOT NULL,
  `lendtime` int(11) NOT NULL DEFAULT '1',
  `sqdate` date NOT NULL,
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '1  审核中\r\n2 通过审核使用中有效\r\n 3审核失败4过期',
  `mark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`roomid`),
  KEY `roomlocal` (`roomlocal`),
  KEY `userid` (`userid`),
  KEY `lendtime` (`lendtime`),
  KEY `status` (`status`),
  CONSTRAINT `lendtime` FOREIGN KEY (`lendtime`) REFERENCES `classtimetype` (`lendtime`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roomlocal` FOREIGN KEY (`roomlocal`) REFERENCES `roombasicinfo` (`roomlocal`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `status` FOREIGN KEY (`status`) REFERENCES `statustype` (`status`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `userbasic` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomorderinfo
-- ----------------------------
INSERT INTO `roomorderinfo` VALUES ('1', 'A1N101', '2', '2312', '2014-04-01', '1', '2014-05-13', '4', null);
INSERT INTO `roomorderinfo` VALUES ('2', 'A2N335', '3', '454dgdfgdfg', '2014-05-06', '3', '2014-05-04', '3', null);
INSERT INTO `roomorderinfo` VALUES ('3', 'A3S555', '4', 'awe123', '2014-05-04', '5', '2014-05-13', '2', null);
INSERT INTO `roomorderinfo` VALUES ('4', 'A1N101', '5', 'Q2XDSE', '2014-04-01', '3', '2014-05-07', '1', null);
INSERT INTO `roomorderinfo` VALUES ('5', 'A1N101', '1', 'c实打实', '2014-05-01', '1', '2014-05-19', '2', null);
INSERT INTO `roomorderinfo` VALUES ('6', 'A1N101', '3', 'ASSDEE', '2014-04-01', '3', '2014-05-06', '1', null);
INSERT INTO `roomorderinfo` VALUES ('7', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-05-22', '1', '2014-05-15', '4', null);
INSERT INTO `roomorderinfo` VALUES ('8', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '1', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('9', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '2', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('10', 'A1N101', '2', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-22', '1', '2014-06-08', '2', null);
INSERT INTO `roomorderinfo` VALUES ('11', 'A1N101', '2', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-22', '7', '2014-06-08', '1', null);
INSERT INTO `roomorderinfo` VALUES ('12', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-27', '5', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('13', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '3', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('14', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-26', '1', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('15', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '8', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('16', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '4', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('17', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '5', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('18', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '6', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('19', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '7', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('20', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '9', '2014-06-08', '1', null);
INSERT INTO `roomorderinfo` VALUES ('21', 'A1N101', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '10', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('22', 'A1N332', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '1', '2014-06-08', '4', null);
INSERT INTO `roomorderinfo` VALUES ('23', 'A1N101', '12', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-04', '6', '2014-06-09', '1', null);
INSERT INTO `roomorderinfo` VALUES ('24', 'A1N101', '12', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-04', '5', '2014-06-09', '1', null);
INSERT INTO `roomorderinfo` VALUES ('25', 'A1N101', '12', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-25', '1', '2014-06-09', '1', null);
INSERT INTO `roomorderinfo` VALUES ('26', 'A1N332', '12', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-13', '6', '2014-06-11', '1', null);
INSERT INTO `roomorderinfo` VALUES ('27', 'A1N332', '6', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-12', '2', '2014-06-11', '1', null);
INSERT INTO `roomorderinfo` VALUES ('28', 'A2N335', '12', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-06-11', '3', '2014-06-11', '1', null);
INSERT INTO `roomorderinfo` VALUES ('29', 'A2N335', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-07-10', '3', '2014-06-28', '3', null);
INSERT INTO `roomorderinfo` VALUES ('30', 'A1N101', '2', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-07-16', '1', '2014-07-04', '4', null);
INSERT INTO `roomorderinfo` VALUES ('31', 'A1N332', '1', '请输入您预约的原因,请最好不要留空增加审核通过概率', '2014-07-03', '4', '2014-07-16', '1', null);

-- ----------------------------
-- Table structure for `roomtype`
-- ----------------------------
DROP TABLE IF EXISTS `roomtype`;
CREATE TABLE `roomtype` (
  `roomtype` int(11) NOT NULL AUTO_INCREMENT,
  `roomtypename` varchar(20) NOT NULL,
  PRIMARY KEY (`roomtype`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomtype
-- ----------------------------
INSERT INTO `roomtype` VALUES ('1', '普通教室');
INSERT INTO `roomtype` VALUES ('2', '机房');
INSERT INTO `roomtype` VALUES ('3', '多媒体教室');
INSERT INTO `roomtype` VALUES ('4', '会议室');
INSERT INTO `roomtype` VALUES ('5', '其他教室');

-- ----------------------------
-- Table structure for `statustype`
-- ----------------------------
DROP TABLE IF EXISTS `statustype`;
CREATE TABLE `statustype` (
  `status` int(11) NOT NULL AUTO_INCREMENT,
  `statusname` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of statustype
-- ----------------------------
INSERT INTO `statustype` VALUES ('1', '审核中');
INSERT INTO `statustype` VALUES ('2', '生效中');
INSERT INTO `statustype` VALUES ('3', '不通过');
INSERT INTO `statustype` VALUES ('4', '已失效');

-- ----------------------------
-- Table structure for `userbasic`
-- ----------------------------
DROP TABLE IF EXISTS `userbasic`;
CREATE TABLE `userbasic` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID自增',
  `username` varchar(20) NOT NULL COMMENT '用户账号',
  `password` varchar(20) NOT NULL COMMENT '用户密码',
  `usertype` int(10) NOT NULL COMMENT '用户类型',
  `email` varchar(30) NOT NULL COMMENT '邮箱',
  `selfinfo` text COMMENT '个人信息',
  `regdate` date NOT NULL COMMENT '注册时间',
  `cookies` varchar(60) DEFAULT NULL,
  `verify` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许登陆',
  `ordernum` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`),
  KEY `type` (`usertype`),
  CONSTRAINT `type` FOREIGN KEY (`usertype`) REFERENCES `usertype` (`usertypeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userbasic
-- ----------------------------
INSERT INTO `userbasic` VALUES ('1', '1', '1', '1', 'admin12@163.com', '我的个人简介', '0000-00-00', '166458358396003', '1', '8');
INSERT INTO `userbasic` VALUES ('2', '222', '222', '2', 'admin12@163.com', '/', '2014-02-22', '624621952177269', '1', '1');
INSERT INTO `userbasic` VALUES ('3', '20110232', '20110232', '3', 'admin12@163.com', 'null', '2014-02-22', '390418262473636', '1', '1');
INSERT INTO `userbasic` VALUES ('4', '12123', '12123', '2', 'admin12@163.com', 'null', '2014-02-28', '111525634144954', '1', '1');
INSERT INTO `userbasic` VALUES ('5', '500000', '500000', '2', 'admin12@163.com', 'null', '2014-02-28', null, '0', '1');
INSERT INTO `userbasic` VALUES ('6', '1212', '1212', '3', 'admin12@163.com', '', '2014-05-06', '655014191529781', '1', '0');
INSERT INTO `userbasic` VALUES ('7', 'admin12', '1', '2', 'aw12312@qq.com', 'null', '2014-05-06', '869828029033235', '1', '1');
INSERT INTO `userbasic` VALUES ('8', 'qwqweqw', 'qwqweqw', '3', 'admin12@163.com', 'asdadasd', '2014-05-07', '119561821794715', '0', '1');
INSERT INTO `userbasic` VALUES ('11', '95175312', '95175312', '2', '95175312@gmail.com', 'null', '2014-06-08', null, '1', '1');
INSERT INTO `userbasic` VALUES ('12', 'admin', 'admin', '1', 'admin@qq.com', 'dasfsa', '2014-06-09', '883676324908673', '1', '0');
INSERT INTO `userbasic` VALUES ('13', 'test', 'testtest', '2', 'test@qq.com', 'null', '2014-07-07', null, '1', '1');

-- ----------------------------
-- Table structure for `usertype`
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype` (
  `usertypeid` int(10) NOT NULL AUTO_INCREMENT,
  `usertypename` varchar(30) NOT NULL,
  `power` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usertypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usertype
-- ----------------------------
INSERT INTO `usertype` VALUES ('1', '管理员', '1');
INSERT INTO `usertype` VALUES ('2', '学生', '0');
INSERT INTO `usertype` VALUES ('3', '教师', '0');
INSERT INTO `usertype` VALUES ('4', '其他学生组织', '0');
INSERT INTO `usertype` VALUES ('6', '审核员', '1');
