/*
Navicat MySQL Data Transfer

Source Server         : GLF
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : fruits

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-07-12 21:51:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressid` int(11) NOT NULL AUTO_INCREMENT,
  `addressrecName` varchar(10) NOT NULL,
  `addressareas` varchar(50) NOT NULL,
  `addressareashi` varchar(50) NOT NULL,
  `addressareaqu` varchar(50) NOT NULL,
  `addresscity` varchar(100) NOT NULL,
  `addressemail` int(11) NOT NULL,
  `addresstel` char(11) NOT NULL,
  `addressphone` char(11) DEFAULT NULL,
  `custid` int(11) NOT NULL,
  PRIMARY KEY (`addressid`),
  KEY `cust_id` (`custid`),
  CONSTRAINT `fk_add_c` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1012', '高小飞', '江西省', '上饶市', '鄱阳县', '田畈街镇15号', '666666', '18405822512', '18405822512', '20201005');
INSERT INTO `address` VALUES ('1013', '高小飞', '湖北省', '黄冈市', '黄州区', '东坡大道62号', '666666', '18405822512', '18405822512', '20201005');
INSERT INTO `address` VALUES ('1014', '高小飞', '江西省', '上饶市', '鄱阳县', '田畈街镇15号', '666666', '18402158512', '18402158512', '20201008');
INSERT INTO `address` VALUES ('1015', '高小飞', '江西省', '上饶市', '鄱阳县', '田畈街镇16号', '666666', '18402158512', '18402158512', '20201008');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(10) NOT NULL,
  `adminpwd` varchar(10) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '小雨', '262520');

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `carid` int(11) NOT NULL AUTO_INCREMENT,
  `goodsnum` int(11) NOT NULL,
  `totalprice` double(10,2) NOT NULL,
  `custid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  PRIMARY KEY (`carid`),
  KEY `cust_id` (`custid`),
  KEY `goods_id` (`goodsid`),
  CONSTRAINT `fk_car_c` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`),
  CONSTRAINT `fk_car_goods` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('26', '4', '83.20', '20201005', '1014');
INSERT INTO `car` VALUES ('29', '4', '40.00', '20201005', '1018');
INSERT INTO `car` VALUES ('30', '5', '345.00', '20201007', '1002');
INSERT INTO `car` VALUES ('31', '1', '68.00', '20201007', '1003');
INSERT INTO `car` VALUES ('33', '2', '49.60', '20201007', '1012');
INSERT INTO `car` VALUES ('36', '3', '204.00', '20201005', '1003');
INSERT INTO `car` VALUES ('38', '1', '33.00', '20201005', '1015');
INSERT INTO `car` VALUES ('40', '1', '69.00', '20201005', '1002');
INSERT INTO `car` VALUES ('45', '1', '20.80', '20201008', '1014');
INSERT INTO `car` VALUES ('46', '1', '33.00', '20201008', '1015');

-- ----------------------------
-- Table structure for `collectionn`
-- ----------------------------
DROP TABLE IF EXISTS `collectionn`;
CREATE TABLE `collectionn` (
  `collectionid` int(11) NOT NULL AUTO_INCREMENT,
  `goodsid` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  PRIMARY KEY (`collectionid`),
  KEY `cust_id` (`custid`),
  KEY `goods_id` (`goodsid`),
  CONSTRAINT `fk_co_cu` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`),
  CONSTRAINT `fk_co_goods` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collectionn
-- ----------------------------
INSERT INTO `collectionn` VALUES ('1', '1001', '20201001');
INSERT INTO `collectionn` VALUES ('2', '1003', '20201001');
INSERT INTO `collectionn` VALUES ('3', '1008', '20201001');
INSERT INTO `collectionn` VALUES ('4', '1006', '20201001');
INSERT INTO `collectionn` VALUES ('5', '1014', '20201001');
INSERT INTO `collectionn` VALUES ('6', '1015', '20201001');
INSERT INTO `collectionn` VALUES ('7', '1027', '20201001');
INSERT INTO `collectionn` VALUES ('8', '1016', '20201001');
INSERT INTO `collectionn` VALUES ('10', '1025', '20201001');
INSERT INTO `collectionn` VALUES ('11', '1012', '20201004');
INSERT INTO `collectionn` VALUES ('12', '1013', '20201004');
INSERT INTO `collectionn` VALUES ('14', '1035', '20201001');
INSERT INTO `collectionn` VALUES ('15', '1001', '20201001');
INSERT INTO `collectionn` VALUES ('16', '1003', '20201001');
INSERT INTO `collectionn` VALUES ('17', '1007', '20201001');
INSERT INTO `collectionn` VALUES ('18', '1001', '20201005');
INSERT INTO `collectionn` VALUES ('19', '1004', '20201005');
INSERT INTO `collectionn` VALUES ('20', '1021', '20201005');
INSERT INTO `collectionn` VALUES ('21', '1002', '20201005');
INSERT INTO `collectionn` VALUES ('22', '1015', '20201005');
INSERT INTO `collectionn` VALUES ('23', '1013', '20201005');
INSERT INTO `collectionn` VALUES ('24', '1006', '20201005');
INSERT INTO `collectionn` VALUES ('25', '1019', '20201005');
INSERT INTO `collectionn` VALUES ('26', '1017', '20201005');
INSERT INTO `collectionn` VALUES ('27', '1006', '20201007');
INSERT INTO `collectionn` VALUES ('28', '1003', '20201008');
INSERT INTO `collectionn` VALUES ('29', '1001', '20201008');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commetid` int(11) NOT NULL AUTO_INCREMENT,
  `commentcontext` varchar(600) NOT NULL,
  `commenttime` datetime NOT NULL,
  `goodsid` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  PRIMARY KEY (`commetid`),
  KEY `goods_id` (`goodsid`),
  KEY `cust_id` (`custid`),
  CONSTRAINT `fk_comm_cust` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`),
  CONSTRAINT `fk_comm_goods` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '好吃呀，很甜哟！发的广东省地方鬼地方个大锅饭的感动', '2020-06-06 00:00:00', '1001', '20201001');
INSERT INTO `comment` VALUES ('2', '特别好，回购了', '2020-06-06 00:00:00', '1001', '20201001');
INSERT INTO `comment` VALUES ('3', '萨达', '2020-06-07 00:00:00', '1001', '20201004');
INSERT INTO `comment` VALUES ('4', '水电费是', '2020-06-07 00:00:00', '1001', '20201001');
INSERT INTO `comment` VALUES ('5', '多个电动蝶阀', '2020-06-07 00:00:00', '1001', '20201004');
INSERT INTO `comment` VALUES ('6', '撒大安市大', '2020-06-07 00:00:00', '1001', '20201001');
INSERT INTO `comment` VALUES ('7', '好吃呀', '2020-07-07 17:55:57', '1001', '20201005');
INSERT INTO `comment` VALUES ('8', '好吃呀', '2020-07-10 22:55:55', '1001', '20201005');
INSERT INTO `comment` VALUES ('9', '好吃呀', '2020-07-10 22:55:55', '1001', '20201005');
INSERT INTO `comment` VALUES ('10', '好吃呀', '2020-07-10 22:55:55', '1001', '20201005');
INSERT INTO `comment` VALUES ('11', '好吃呀', '2020-07-10 22:55:55', '1001', '20201005');
INSERT INTO `comment` VALUES ('12', '好吃呀', '2020-07-10 22:55:55', '1001', '20201005');
INSERT INTO `comment` VALUES ('13', '好吃呀', '2020-07-10 22:55:55', '1001', '20201005');
INSERT INTO `comment` VALUES ('14', '好吃呀', '2020-07-10 22:55:55', '1001', '20201005');
INSERT INTO `comment` VALUES ('15', '真心不错期待下次购买', '2020-07-11 10:51:27', '1001', '20201005');
INSERT INTO `comment` VALUES ('16', '真心不错期待下次购买', '2020-07-11 10:51:27', '1003', '20201005');
INSERT INTO `comment` VALUES ('17', '好吃', '2020-07-11 20:44:22', '1004', '20201005');
INSERT INTO `comment` VALUES ('18', '好吃', '2020-07-11 20:44:22', '1008', '20201005');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `custid` int(11) NOT NULL AUTO_INCREMENT,
  `custname` varchar(10) NOT NULL,
  `custpwd` varchar(16) NOT NULL,
  `custtel` char(11) NOT NULL,
  `ye` double(20,2) NOT NULL,
  PRIMARY KEY (`custid`),
  UNIQUE KEY `cust_tel` (`custtel`)
) ENGINE=InnoDB AUTO_INCREMENT=20201009 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('20201001', '小小', '123456', '17671348540', '0.00');
INSERT INTO `customer` VALUES ('20201004', '云儿呀嘿', '123456', '15785296322', '0.00');
INSERT INTO `customer` VALUES ('20201005', '小飞', '262520', '15785296323', '278.10');
INSERT INTO `customer` VALUES ('20201007', '小雨', '262520', '18407835615', '0.00');
INSERT INTO `customer` VALUES ('20201008', '小小飞飞', '123456', '15785296328', '500.00');

-- ----------------------------
-- Table structure for `customerinfo`
-- ----------------------------
DROP TABLE IF EXISTS `customerinfo`;
CREATE TABLE `customerinfo` (
  `custInfoid` int(11) NOT NULL AUTO_INCREMENT,
  `custpic` varchar(50) DEFAULT NULL,
  `custtname` varchar(10) DEFAULT NULL,
  `custsex` char(1) DEFAULT NULL,
  `custemail` varchar(30) DEFAULT NULL,
  `custid` int(11) NOT NULL,
  PRIMARY KEY (`custInfoid`),
  KEY `cust_id` (`custid`),
  CONSTRAINT `fk_cinfo_c` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`)
) ENGINE=InnoDB AUTO_INCREMENT=2020100104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customerinfo
-- ----------------------------
INSERT INTO `customerinfo` VALUES ('2020100101', '/customerimg/2019-04-27-074445.jpg', '付乐豪', '男', 'kao@kao.com', '20201001');
INSERT INTO `customerinfo` VALUES ('2020100102', 'QQ图片20200505082953.jpg', '云莫儿', '女', 'jao@jao.com', '20201004');
INSERT INTO `customerinfo` VALUES ('2020100103', '/customerimg/3049749f049c2456.jpg', '高小飞', '男', 'gao@gao.com', '20201005');

-- ----------------------------
-- Table structure for `custpoint`
-- ----------------------------
DROP TABLE IF EXISTS `custpoint`;
CREATE TABLE `custpoint` (
  `pointid` int(11) NOT NULL AUTO_INCREMENT,
  `pointnum` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  PRIMARY KEY (`pointid`),
  KEY `cust_id` (`custid`),
  CONSTRAINT `fk_cu_cu` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custpoint
-- ----------------------------
INSERT INTO `custpoint` VALUES ('3', '0', '20201001');
INSERT INTO `custpoint` VALUES ('4', '6179', '20201005');
INSERT INTO `custpoint` VALUES ('5', '3140', '20201008');

-- ----------------------------
-- Table structure for `express`
-- ----------------------------
DROP TABLE IF EXISTS `express`;
CREATE TABLE `express` (
  `expressid` int(11) NOT NULL AUTO_INCREMENT,
  `expressname` varchar(10) NOT NULL,
  PRIMARY KEY (`expressid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of express
-- ----------------------------
INSERT INTO `express` VALUES ('1', '圆通快递');
INSERT INTO `express` VALUES ('2', '中通快递');
INSERT INTO `express` VALUES ('3', '申通快递');
INSERT INTO `express` VALUES ('4', '邮政EMS');
INSERT INTO `express` VALUES ('5', '城际快递');
INSERT INTO `express` VALUES ('6', '韵达快递');
INSERT INTO `express` VALUES ('7', '国通快递');
INSERT INTO `express` VALUES ('8', '顺丰快递');
INSERT INTO `express` VALUES ('9', '邮政小包');
INSERT INTO `express` VALUES ('10', '天天快递');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsid` int(11) NOT NULL AUTO_INCREMENT,
  `goodscreateTime` datetime NOT NULL,
  `goodsname` varchar(50) NOT NULL,
  `goodsprice` double(10,2) NOT NULL,
  `goodsinfo` varchar(100) NOT NULL,
  `goodspic` varchar(50) NOT NULL,
  `teamBuy` int(11) DEFAULT NULL,
  `teamBuyprice` double(20,2) DEFAULT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `pointBuy` int(11) NOT NULL,
  `pointBuyprice` int(11) NOT NULL,
  `goodssales` int(11) DEFAULT NULL,
  `goodsinventory` int(11) DEFAULT NULL,
  `goodsTypeid` int(11) NOT NULL,
  `place` varchar(50) NOT NULL,
  PRIMARY KEY (`goodsid`),
  KEY `goodsType_id` (`goodsTypeid`),
  CONSTRAINT `fk_goods_goodstype` FOREIGN KEY (`goodsTypeid`) REFERENCES `goodstype` (`goodsTypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=1039 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1001', '2020-06-04 16:48:46', '万州血橙', '16.00', '重庆万州血橙5斤装 约130g、个', 'fruit/111.jpg', '1', '10.00', '2020-07-10 08:00:00', '2020-07-15 20:00:00', '1', '2000', '8', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1002', '2020-06-04 17:06:15', '四川丑柑', '69.00', '四川不知火丑柑 粑粑柑5斤约220g/个 当季新鲜柑橘', 'fruit/222.jpg', '0', null, null, null, '0', '0', '8', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1003', '2020-06-04 17:28:48', '小青柠檬', '68.00', '海南小青柠2斤', 'fruit/333.jpg', '0', null, null, null, '1', '6800', '5', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1004', '2020-06-04 17:32:33', '泊头皇冠梨', '46.00', '河北泊头特产皇冠梨5斤装', 'fruit/444.jpg', '1', '40.00', '2020-07-11 17:36:15', '2020-07-14 17:36:20', '0', '0', '1', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1005', '2020-06-04 17:39:21', '库尔勒香梨', '60.00', '优选新疆库尔勒香梨2kg', 'fruit/555.jpg', '1', '55.00', '2020-07-06 17:40:29', '2020-07-16 17:43:46', '1', '5500', '0', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1006', '2020-06-04 17:56:03', '丰水梨', '59.80', '丰水梨12个（约300g/个）', 'fruit/666.jpg', '0', null, null, null, '1', '5980', '0', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1007', '2020-06-04 17:59:12', '阿克苏苹果', '99.00', '新疆阿克苏冰糖心苹果 8斤装', 'fruit/777.jpg', '0', '89.00', '2020-06-01 17:57:40', '2020-08-06 17:57:28', '0', '0', '1', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1008', '2020-06-04 18:00:03', '红富士苹果', '68.00', '陕西经典红富士苹果 2.5kg果径80-85mm', 'fruit/999.jpg', '0', null, null, null, '0', '0', '2', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1009', '2020-06-04 18:03:01', '泰国榴莲', '198.00', '泰国金枕头榴莲 1个装（5斤装）', 'fruit/000.jpg', '1', '188.00', '2020-07-06 18:04:12', '2020-07-18 18:04:16', '0', '0', '0', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1010', '2020-06-04 18:06:45', '台湾芒果', '108.00', '台湾正宗水仙芒礼盒装5-10个', 'fruit/0001.jpg', '0', null, null, null, '1', '10800', '0', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1011', '2020-06-04 18:12:54', '佳沛绿奇异果', '139.00', '新西兰佳沛绿奇异果16粒（单个约105g左右）', 'fruit/0002.jpg', '0', '119.00', '2020-06-12 18:08:00', '2020-06-21 18:07:56', '0', '0', '0', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1012', '2020-06-05 08:10:09', '普罗斯旺西红柿', '69.80', '普罗旺斯西红柿生吃水果沙瓤大番茄5斤', 'vegtables/101.jpg', '1', '24.80', '2020-06-01 08:12:29', '2020-07-18 08:12:36', '0', '0', '0', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1013', '2020-06-05 08:16:07', '水果小黄瓜', '49.90', '小黄瓜水果黄瓜新鲜五斤山东农家蔬菜', 'vegtables/102.jpg', '0', null, null, null, '1', '4990', '1', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1014', '2020-06-05 08:33:53', '紫皮洋葱', '58.00', '新鲜现挖小洋葱带箱子10斤 红皮紫皮洋葱头圆葱农家自种蔬菜', 'vegtables/103.jpg', '1', '20.80', '2020-06-01 08:36:22', '2020-07-18 08:36:26', '0', '0', '0', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1015', '2020-06-05 08:37:16', '新鲜小土豆', '33.00', '土豆新鲜小土豆10斤农家自种蔬菜云南红皮黄心土豆批发马铃薯洋芋 ', 'vegtables/104.jpg', '0', null, null, null, '1', '3300', '3', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1016', '2020-06-05 08:42:44', '绿参山药', '71.80', '绿参新鲜山药原产地直发小白嘴山药新鲜蔬菜怀山药铁棍山药5斤装 ', 'vegtables/105.jpg', '0', '29.80', '2020-06-01 08:41:33', '2020-06-18 08:41:29', '0', '0', '0', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1017', '2020-06-05 08:43:05', '球生菜', '49.00', '球生菜5斤 新鲜蔬菜汉堡用圆生菜球型西生菜沙拉色拉食材 ', 'vegtables/106.jpg', '0', null, null, null, '1', '4900', '0', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1018', '2020-06-05 08:46:22', '羽衣甘蓝', '13.90', '羽衣甘蓝500g 新鲜蔬菜嫩叶kale甘兰健身榨汁叶牡丹', 'vegtables/107.jpg', '1', '9.90', '2020-07-01 08:44:46', '2020-07-18 08:44:42', '0', '0', '0', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1019', '2020-06-05 08:47:04', '东北油豆角', '59.90', '油豆角 正宗东北油豆角 一点红新鲜蔬菜 九月青 5斤包邮 东北豆角', 'vegtables/108.jpg', '0', null, null, null, '1', '5990', '0', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1020', '2020-06-05 08:50:38', '小板栗南瓜', '49.90', '贝贝南瓜小板栗南瓜正品栗子栗味绿粉日本10蔬菜新鲜5斤', 'vegtables/109.jpg', '0', '39.90', '2020-06-01 08:49:30', '2020-06-18 08:49:22', '0', '0', '0', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1021', '2020-06-05 08:51:00', '四川毛豆', '50.00', '四川毛豆新鲜青豆毛豆角带壳毛豆荚新鲜农家当季豆子卤煮5斤', 'vegtables/111.jpg', '1', '25.80', '2020-06-01 08:52:23', '2020-07-18 08:52:27', '0', '0', '0', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1022', '2020-06-05 08:53:10', '紫薯', '74.50', '紫薯新鲜10斤农家自种沙地板栗红薯蜜薯小番薯山芋地瓜蔬菜整箱批 ', 'vegtables/110.jpg', '0', null, null, null, '1', '7450', '0', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1023', '2020-06-05 08:55:51', '紫甘蓝', '6.99', '紫甘蓝650g 紫包菜球紫色红椰菜西餐蔬菜生菜轻食沙拉食材 ', 'vegtables/112.jpg', '0', null, null, null, '1', '699', '0', '9999', '102', '江西省');
INSERT INTO `goods` VALUES ('1024', '2020-06-05 08:58:31', '白心火龙果', '148.90', '越南进口火龙果白心热带水果新鲜当季现摘树上熟白肉整箱10斤', 'fruit/1112.jpg', '0', '96.80', '2020-06-01 09:00:38', '2020-06-18 09:00:42', '0', '0', '0', '9999', '101', '江西省');
INSERT INTO `goods` VALUES ('1025', '2020-06-05 09:15:48', '黄桃桃仁', '58.90', '韩国进口汤姆农场蜂蜜黄油扁桃仁腰果杏仁混合坚果仁零食小吃袋装', 'vegtables/112.jpg', '0', '32.50', '2020-06-01 09:20:12', '2020-06-18 09:20:16', '0', '0', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1026', '2020-06-05 09:21:20', '炭烧腰果', '88.00', '腰果仁500g新货坚果原味越南炭烧腰果大颗粒整箱5斤散装干果零食', 'Nuts/101.jpg', '0', null, null, null, '1', '8800', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1027', '2020-06-05 09:23:42', '巴西松子', '268.00', '松灵5月新货手剥巴西松子500g小包袋装特级大颗粒1斤散装进口坚果', 'Nuts/102.jpg', '0', '213.00', '2020-06-01 09:22:37', '2020-06-18 09:22:34', '0', '0', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1028', '2020-06-05 09:23:58', '临安山核桃仁', '88.00', '新货临安山核桃仁小核桃仁肉连罐500g分3罐装孕妇零食坚果炒货仁 ', 'Nuts/103.jpg', '0', null, null, null, '1', '8800', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1029', '2020-06-05 09:26:16', '原味开心果', '118.00', '新货大颗粒无漂白原味开心果500g净含量坚果散装干果零食品年货礼', 'Nuts/104.jpg', '0', '69.70', '2020-06-01 09:27:12', '2020-07-01 09:27:16', '1', '11800', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1030', '2020-06-05 09:31:20', '碧根果', '68.80', '碧根果合礼盒1000g大罐装混合装干果零食整箱5斤', 'Nuts/105.jpg', '0', '58.00', '2020-06-01 09:29:16', '2020-06-18 09:29:11', '0', '0', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1031', '2020-06-05 09:32:02', '原味巴旦木', '60.00', '原味巴旦木仁盐焗大杏仁500g扁桃仁坚果干果零食整箱5斤散装', 'Nuts/106.jpg', '0', '46.00', '2020-06-05 09:33:38', '2020-06-25 09:33:41', '0', '0', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1032', '2020-06-05 09:34:24', '甘源青豆', '48.00', '甘源青豆原味蒜香青豆豌豆小包装零食休闲芥末青豆炒货', 'Nuts/107.jpg', '0', null, null, null, '1', '4880', '2', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1033', '2020-06-05 09:41:34', '新疆脱皮核桃', '149.90', '新疆去皮核桃仁散装500g新鲜熟脱皮核桃肉烘焙孕妇专用坚果 ', 'Nuts/108.jpg', '0', '89.90', '2020-06-01 09:39:14', '2020-06-18 09:39:09', '0', '0', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1034', '2020-06-05 09:43:49', '大杏仁', '69.00', '大杏仁500g生熟甜南原味无糖新鲜坚果干果片散装零食无添加', 'Nuts/109.jpg', '0', null, null, null, '1', '6900', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1035', '2020-06-05 09:48:09', '夏威夷果', '58.80', '新货坚果干果原味夏威夷果1斤装孕妇零食500g奶油味整箱5斤散装 ', 'Nuts/110.jpg', '0', '48.80', '2020-06-03 09:45:22', '2020-06-20 09:45:17', '0', '0', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1036', '2020-06-05 09:49:21', '澳洲奶油夏威夷果', '100.00', '澳洲奶油味夏威夷果仁500g大罐装坚果原味干果休闲零食小吃年货 ', 'Nuts/111.jpg', '0', null, null, null, '1', '10000', '0', '9999', '103', '江西省');
INSERT INTO `goods` VALUES ('1038', '2020-07-08 19:37:22', '白菜', '5.50', '新鲜好吃', 'vegtables/13140082_200149691195_2.jpg', null, null, null, null, '0', '0', '0', '9999', '102', '江西省');

-- ----------------------------
-- Table structure for `goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `goodstype`;
CREATE TABLE `goodstype` (
  `goodsTypeid` int(11) NOT NULL,
  `typename` varchar(30) NOT NULL,
  PRIMARY KEY (`goodsTypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodstype
-- ----------------------------
INSERT INTO `goodstype` VALUES ('101', '水果');
INSERT INTO `goodstype` VALUES ('102', '蔬菜');
INSERT INTO `goodstype` VALUES ('103', '干果');
INSERT INTO `goodstype` VALUES ('104', '其他');

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `orderdetailid` int(11) NOT NULL AUTO_INCREMENT,
  `orderFruitnum` int(11) NOT NULL,
  `orderFruitmoney` double(10,0) NOT NULL,
  `ordersid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  PRIMARY KEY (`orderdetailid`),
  KEY `goods_id` (`goodsid`),
  KEY `orders_id` (`ordersid`),
  CONSTRAINT `fk_orderitem_goods` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`goodsid`),
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`ordersid`) REFERENCES `orders` (`ordersid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('1', '5', '45', '1', '1001');
INSERT INTO `orderdetail` VALUES ('2', '1', '63', '1', '1003');
INSERT INTO `orderdetail` VALUES ('3', '1', '35', '2', '1004');
INSERT INTO `orderdetail` VALUES ('4', '2', '131', '2', '1008');
INSERT INTO `orderdetail` VALUES ('8', '1', '0', '5', '1001');
INSERT INTO `orderdetail` VALUES ('10', '3', '207', '7', '1002');
INSERT INTO `orderdetail` VALUES ('11', '3', '207', '8', '1002');
INSERT INTO `orderdetail` VALUES ('12', '1', '10', '9', '1001');
INSERT INTO `orderdetail` VALUES ('13', '1', '50', '10', '1013');
INSERT INTO `orderdetail` VALUES ('17', '2', '15', '13', '1001');
INSERT INTO `orderdetail` VALUES ('18', '1', '94', '13', '1007');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `ordersid` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(200) NOT NULL,
  `orderstotalPage` double(20,0) NOT NULL,
  `orderscreateTime` datetime NOT NULL,
  `invoice` int(11) DEFAULT NULL,
  `ordersmessage` char(50) DEFAULT NULL,
  `pointget` int(11) NOT NULL,
  `custid` int(11) NOT NULL,
  `payTypeid` int(11) NOT NULL,
  `orderStateTypeid` int(11) NOT NULL,
  `expressid` int(11) NOT NULL,
  PRIMARY KEY (`ordersid`),
  KEY `cust_id` (`custid`),
  KEY `payType_id` (`payTypeid`),
  KEY `address_id` (`address`),
  KEY `orderStateType_id` (`orderStateTypeid`),
  KEY `fk_order_ex` (`expressid`),
  CONSTRAINT `fk_order_c` FOREIGN KEY (`custid`) REFERENCES `customer` (`custid`),
  CONSTRAINT `fk_order_ex` FOREIGN KEY (`expressid`) REFERENCES `express` (`expressid`),
  CONSTRAINT `fk_order_os` FOREIGN KEY (`orderStateTypeid`) REFERENCES `orderstatetype` (`orderStateTypeid`),
  CONSTRAINT `fk_order_p` FOREIGN KEY (`payTypeid`) REFERENCES `paytype` (`payTypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '江西省上饶市鄱阳县田畈街镇12号', '108', '2020-07-07 23:19:41', '0', '', '1080', '20201005', '5', '4', '1');
INSERT INTO `orders` VALUES ('2', '湖北省黄冈市黄州区东坡大道62号', '166', '2020-07-08 10:33:12', '0', '哈哈哈', '1660', '20201005', '5', '4', '1');
INSERT INTO `orders` VALUES ('5', '江西省上饶市鄱阳县田畈街镇15号', '0', '2020-07-12 10:02:52', '1', '', '-2000', '20201005', '5', '3', '1');
INSERT INTO `orders` VALUES ('7', '江西省上饶市鄱阳县田畈街镇15号', '207', '2020-07-12 10:24:08', '0', '', '2070', '20201005', '5', '2', '1');
INSERT INTO `orders` VALUES ('8', '江西省上饶市鄱阳县田畈街镇15号', '207', '2020-07-12 10:25:14', '0', '', '2070', '20201005', '5', '2', '1');
INSERT INTO `orders` VALUES ('9', '江西省上饶市鄱阳县田畈街镇15号', '10', '2020-07-12 10:30:55', '0', '', '100', '20201005', '5', '1', '1');
INSERT INTO `orders` VALUES ('10', '江西省上饶市鄱阳县田畈街镇15号', '50', '2020-07-12 10:32:32', '0', '', '499', '20201005', '5', '1', '1');
INSERT INTO `orders` VALUES ('13', '江西省上饶市鄱阳县田畈街镇15号', '109', '2020-07-12 11:13:10', '1', '', '1090', '20201008', '1', '1', '1');

-- ----------------------------
-- Table structure for `orderstatetype`
-- ----------------------------
DROP TABLE IF EXISTS `orderstatetype`;
CREATE TABLE `orderstatetype` (
  `orderStateTypeid` int(10) NOT NULL,
  `orderStateTypename` char(10) NOT NULL,
  PRIMARY KEY (`orderStateTypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderstatetype
-- ----------------------------
INSERT INTO `orderstatetype` VALUES ('1', '已付款，待发货');
INSERT INTO `orderstatetype` VALUES ('2', '已发货，待收货');
INSERT INTO `orderstatetype` VALUES ('3', '已收货，未评论');
INSERT INTO `orderstatetype` VALUES ('4', '已评论');

-- ----------------------------
-- Table structure for `paytype`
-- ----------------------------
DROP TABLE IF EXISTS `paytype`;
CREATE TABLE `paytype` (
  `payTypeid` int(11) NOT NULL,
  `payTypename` varchar(30) NOT NULL,
  PRIMARY KEY (`payTypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of paytype
-- ----------------------------
INSERT INTO `paytype` VALUES ('1', '支付宝');
INSERT INTO `paytype` VALUES ('2', '货到付款');
INSERT INTO `paytype` VALUES ('3', '财付通');
INSERT INTO `paytype` VALUES ('4', '银联支付');
INSERT INTO `paytype` VALUES ('5', '余额支付');
