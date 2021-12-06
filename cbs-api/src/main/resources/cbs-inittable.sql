-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbcbs
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_client_reserveopenclient`
--

DROP TABLE IF EXISTS `t_client_reserveopenclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_client_reserveopenclient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `business_date` datetime DEFAULT NULL COMMENT '业务日期',
  `channel` varchar(32) DEFAULT NULL COMMENT '来源渠道',
  `client_address` varchar(128) DEFAULT NULL COMMENT '客户地址',
  `client_name` varchar(32) DEFAULT NULL COMMENT '客户姓名',
  `client_phone_no` varchar(32) DEFAULT NULL COMMENT '客户电话号码',
  `client_type` int DEFAULT NULL COMMENT '客户类型',
  `dept_id` int NOT NULL COMMENT '部门序号',
  `fund_account` varchar(32) DEFAULT NULL COMMENT '资金账号',
  `id_number` varchar(32) DEFAULT NULL COMMENT '身份证号码',
  `is_history` tinyint DEFAULT NULL COMMENT '是否归历史',
  `is_open_in_here` tinyint DEFAULT NULL COMMENT '是否在本公司开户',
  `is_open_in_others` tinyint DEFAULT NULL COMMENT '是否在其它期货公司开户',
  `is_open_success` tinyint DEFAULT NULL COMMENT '是否开户成功',
  `open_branch` varchar(128) DEFAULT NULL COMMENT '开户网点',
  `open_date` date DEFAULT NULL COMMENT '开户日期',
  `open_type` int DEFAULT NULL COMMENT '开户类型',
  `referrer` varchar(32) DEFAULT NULL COMMENT '推荐人',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `serial_no` mediumtext COMMENT '流水号',
  `sex` int DEFAULT NULL COMMENT '性别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='预约开户客户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_client_reserveopenclient`
--

/*!40000 ALTER TABLE `t_client_reserveopenclient` DISABLE KEYS */;
INSERT INTO `t_client_reserveopenclient` VALUES (1,-1,'2021-01-27 15:31:01',1,'2021-02-04 13:43:00','2021-01-27 15:31:01','微信公众号','','失是','13728293893',1,29,'123123123','',0,0,0,0,'郑州总部','2021-02-04',1,'','测试备注内容','20210127153100630',1);
INSERT INTO `t_client_reserveopenclient` VALUES (2,-1,'2021-02-04 13:49:53',1,'2021-02-04 13:50:21','2021-02-04 13:49:53','微信公众号','','张三','17899862237',1,20,'998776554','',0,0,0,0,'上海分公司','2021-02-05',1,'','很不错','20210204134952548',1);
INSERT INTO `t_client_reserveopenclient` VALUES (13,-1,'2020-10-20 09:48:49',8,'2020-10-27 01:20:37','2020-10-20 05:48:48','微信公众号','','王柯','17737728928',1,21,NULL,'',1,0,0,0,'洛阳营业部',NULL,1,'','多次联系,都无法联系到客户。','20201020054848616',1);
INSERT INTO `t_client_reserveopenclient` VALUES (14,-1,'2020-10-22 06:02:03',6,'2020-12-07 06:16:28','2020-10-22 02:02:03','微信公众号','','孙加强','15237845603',1,29,NULL,'',1,1,1,1,'郑州总部',NULL,1,'','已跟客户联系。20201105开户成功。','20201022020203096',1);
INSERT INTO `t_client_reserveopenclient` VALUES (15,-1,'2020-10-24 02:11:12',13,'2020-11-16 01:16:00','2020-10-23 22:11:11','微信公众号','河南省南阳市宛城区小西关北夹后11号','邬君朝','15238167263',1,26,NULL,'412901196306121018',1,1,0,1,'南阳营业部',NULL,1,'王建','','20201023221111864',1);
/*!40000 ALTER TABLE `t_client_reserveopenclient` ENABLE KEYS */;

--
-- Table structure for table `t_cms_article`
--

DROP TABLE IF EXISTS `t_cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cms_article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `content` text COMMENT '内容',
  `id_channel` bigint NOT NULL COMMENT '栏目id',
  `img` varchar(64) DEFAULT NULL COMMENT '文章题图ID',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_article`
--

/*!40000 ALTER TABLE `t_cms_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cms_article` ENABLE KEYS */;

--
-- Table structure for table `t_cms_banner`
--

DROP TABLE IF EXISTS `t_cms_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cms_banner` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `id_file` bigint DEFAULT NULL COMMENT 'banner图id',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `url` varchar(512) DEFAULT NULL COMMENT '点击banner跳转到url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Banner';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_banner`
--

/*!40000 ALTER TABLE `t_cms_banner` DISABLE KEYS */;
INSERT INTO `t_cms_banner` VALUES (1,1,'2019-03-09 16:29:03',NULL,NULL,1,'不打开链接','index','javascript:');
INSERT INTO `t_cms_banner` VALUES (2,1,'2019-03-09 16:29:03',NULL,NULL,2,'打打开站内链接','index','/contact');
INSERT INTO `t_cms_banner` VALUES (3,1,'2019-03-09 16:29:03',NULL,NULL,6,'打开外部链接','index','http://www.baidu.com');
/*!40000 ALTER TABLE `t_cms_banner` ENABLE KEYS */;

--
-- Table structure for table `t_cms_channel`
--

DROP TABLE IF EXISTS `t_cms_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cms_channel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `code` varchar(64) DEFAULT NULL COMMENT '编码',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章栏目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_channel`
--

/*!40000 ALTER TABLE `t_cms_channel` DISABLE KEYS */;
INSERT INTO `t_cms_channel` VALUES (1,NULL,NULL,1,'2019-03-13 22:52:46','news','动态资讯');
INSERT INTO `t_cms_channel` VALUES (2,NULL,NULL,1,'2019-03-13 22:53:11','product','产品服务');
INSERT INTO `t_cms_channel` VALUES (3,NULL,NULL,1,'2019-03-13 22:53:37','solution','解决方案');
INSERT INTO `t_cms_channel` VALUES (4,NULL,NULL,1,'2019-03-13 22:53:41','case','精选案例');
/*!40000 ALTER TABLE `t_cms_channel` ENABLE KEYS */;

--
-- Table structure for table `t_cms_contacts`
--

DROP TABLE IF EXISTS `t_cms_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cms_contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `email` varchar(32) DEFAULT NULL COMMENT '电子邮箱',
  `mobile` varchar(64) DEFAULT NULL COMMENT '联系电话',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `user_name` varchar(64) DEFAULT NULL COMMENT '邀约人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='邀约信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_contacts`
--

/*!40000 ALTER TABLE `t_cms_contacts` DISABLE KEYS */;
INSERT INTO `t_cms_contacts` VALUES (1,NULL,'2019-07-31 17:44:27',NULL,'2019-07-31 17:44:27','test@qq.com','15011111111','测试联系，哈哈哈','张三');
/*!40000 ALTER TABLE `t_cms_contacts` ENABLE KEYS */;

--
-- Table structure for table `t_cms_wxarticle`
--

DROP TABLE IF EXISTS `t_cms_wxarticle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cms_wxarticle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `author` varchar(64) DEFAULT NULL COMMENT '作者',
  `id_file` bigint DEFAULT NULL COMMENT '文章图id',
  `is_display` tinyint DEFAULT NULL COMMENT '是否显示',
  `origin` varchar(64) DEFAULT NULL COMMENT '来源',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `url` varchar(512) DEFAULT NULL COMMENT '点击图标跳转到url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微官网文章';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_wxarticle`
--

/*!40000 ALTER TABLE `t_cms_wxarticle` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cms_wxarticle` ENABLE KEYS */;

--
-- Table structure for table `t_cms_wxchannel`
--

DROP TABLE IF EXISTS `t_cms_wxchannel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cms_wxchannel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `id_file` bigint DEFAULT NULL COMMENT '九宫格图id',
  `is_display` tinyint DEFAULT NULL COMMENT '是否显示',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `url` varchar(512) DEFAULT NULL COMMENT '点击图标跳转到url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微官网九宫格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_wxchannel`
--

/*!40000 ALTER TABLE `t_cms_wxchannel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cms_wxchannel` ENABLE KEYS */;

--
-- Table structure for table `t_cms_wxgoodvoice`
--

DROP TABLE IF EXISTS `t_cms_wxgoodvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cms_wxgoodvoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `id_file` bigint DEFAULT NULL COMMENT '好声音图id',
  `is_display` tinyint DEFAULT NULL COMMENT '是否显示',
  `title` varchar(128) DEFAULT NULL COMMENT '标题',
  `url` varchar(512) DEFAULT NULL COMMENT '点击图标跳转到url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微官网中原好声音';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cms_wxgoodvoice`
--

/*!40000 ALTER TABLE `t_cms_wxgoodvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cms_wxgoodvoice` ENABLE KEYS */;

--
-- Table structure for table `t_game_contestant`
--

DROP TABLE IF EXISTS `t_game_contestant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_game_contestant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `agency_no` varchar(32) DEFAULT NULL COMMENT '机构产品备案号',
  `channel` varchar(32) DEFAULT NULL COMMENT '来源渠道',
  `contestant_address` varchar(128) DEFAULT NULL COMMENT '地址',
  `contestant_name` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `contestant_nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `contestant_phone_no` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `fund_account` varchar(32) DEFAULT NULL COMMENT '资金账号',
  `is_agency` tinyint DEFAULT NULL COMMENT '是否机构',
  `is_hedge_arbitrage` tinyint DEFAULT NULL COMMENT '是否对冲套利',
  `is_quantify` tinyint DEFAULT NULL COMMENT '是否量化',
  `is_valid` tinyint DEFAULT NULL COMMENT '是否有效',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `teacher` varchar(32) DEFAULT NULL COMMENT '指导老师',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实盘大赛参赛者信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_game_contestant`
--

/*!40000 ALTER TABLE `t_game_contestant` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_game_contestant` ENABLE KEYS */;

--
-- Table structure for table `t_game_cusfund`
--

DROP TABLE IF EXISTS `t_game_cusfund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_game_cusfund` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `actual_monetary_funds` decimal(20,3) DEFAULT NULL COMMENT '实有货币资金',
  `currency` varchar(3) DEFAULT NULL COMMENT '币种',
  `date` date DEFAULT NULL COMMENT '日期',
  `enable_balance` decimal(20,3) DEFAULT NULL COMMENT '可用资金',
  `equity_total` decimal(20,3) DEFAULT NULL COMMENT '资金权益总额',
  `float_profit_zbdc` decimal(20,3) DEFAULT NULL COMMENT '浮动盈亏(逐笔对冲)',
  `frozen_balance` decimal(20,3) DEFAULT NULL COMMENT '冻结金额',
  `fund_account` varchar(32) DEFAULT NULL COMMENT '资金账号',
  `is_trading_member` char(1) DEFAULT NULL COMMENT '是否为交易会员',
  `lastday_balance_zbdc` decimal(20,3) DEFAULT NULL COMMENT '上日结存(逐笔对冲)',
  `lastday_balance_zrds` decimal(20,3) DEFAULT NULL COMMENT '上日结存(逐日盯市)',
  `monetary_pledge_margin` decimal(20,3) DEFAULT NULL COMMENT '货币质押保证金占用',
  `need_margin` decimal(20,3) DEFAULT NULL COMMENT '需追加保证金',
  `non_monetary_offset` decimal(20,3) DEFAULT NULL COMMENT '非货币充抵金额',
  `other_pledeg_balance` decimal(20,3) DEFAULT NULL COMMENT '其它货币质出金额',
  `risk_rate` decimal(20,3) DEFAULT NULL COMMENT '风险度',
  `today_balance_zbdc` decimal(20,3) DEFAULT NULL COMMENT '当日结存(逐笔对冲)',
  `today_balance_zrds` decimal(20,3) DEFAULT NULL COMMENT '当日结存(逐日盯市)',
  `today_profit_zbdc` decimal(20,3) DEFAULT NULL COMMENT '当日总盈亏(逐笔对冲)',
  `today_profit_zrds` decimal(20,3) DEFAULT NULL COMMENT '当日总盈亏(逐日盯市)',
  `today_right_balance` decimal(20,3) DEFAULT NULL COMMENT '当日总权利金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户期货期权账户基本资金表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_game_cusfund`
--

/*!40000 ALTER TABLE `t_game_cusfund` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_game_cusfund` ENABLE KEYS */;

--
-- Table structure for table `t_game_fundchg`
--

DROP TABLE IF EXISTS `t_game_fundchg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_game_fundchg` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `company_margin_account` varchar(32) DEFAULT NULL COMMENT '公司保证金专用账户',
  `company_margin_account_flag` varchar(2) DEFAULT NULL COMMENT '公司保证金专用账户标识',
  `currency` varchar(3) DEFAULT NULL COMMENT '币种',
  `date` date DEFAULT NULL COMMENT '日期',
  `fund_account` varchar(32) DEFAULT NULL COMMENT '资金账号',
  `inout_balance` decimal(20,3) DEFAULT NULL COMMENT '出入金额',
  `inout_date` date DEFAULT NULL COMMENT '出入金发生日期',
  `inout_type` char(1) DEFAULT NULL COMMENT '出入金类型',
  `is_trading_member` char(1) DEFAULT NULL COMMENT '是否为交易会员',
  `remark` varchar(258) DEFAULT NULL COMMENT '备注',
  `settle_account` varchar(32) DEFAULT NULL COMMENT '客户结算账户',
  `settle_account_flag` varchar(2) DEFAULT NULL COMMENT '客户结算账户标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户出入金记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_game_fundchg`
--

/*!40000 ALTER TABLE `t_game_fundchg` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_game_fundchg` ENABLE KEYS */;

--
-- Table structure for table `t_game_importinfo`
--

DROP TABLE IF EXISTS `t_game_importinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_game_importinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `file_name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `file_status` varchar(16) DEFAULT NULL COMMENT '文件状态',
  `real_file_name` varchar(128) DEFAULT NULL COMMENT '真实文件名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算数据导入信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_game_importinfo`
--

/*!40000 ALTER TABLE `t_game_importinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_game_importinfo` ENABLE KEYS */;

--
-- Table structure for table `t_game_rankday`
--

DROP TABLE IF EXISTS `t_game_rankday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_game_rankday` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `contestant_nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `date` date DEFAULT NULL COMMENT '日期',
  `equity_avg` decimal(20,3) DEFAULT NULL COMMENT '日均权益',
  `equity_total` decimal(20,3) DEFAULT NULL COMMENT '资金权益总额',
  `fund_account` varchar(32) DEFAULT NULL COMMENT '资金账号',
  `group_type` int DEFAULT NULL COMMENT '组别',
  `max_principal_rate` decimal(20,3) DEFAULT NULL COMMENT '最大本金收益率',
  `max_principal_rate_grade` decimal(20,3) DEFAULT NULL COMMENT '最大本金收益率得分',
  `max_put_balance` decimal(20,3) DEFAULT NULL COMMENT '最大投入本金',
  `rank_day` int DEFAULT NULL COMMENT '排名',
  `teacher` varchar(32) DEFAULT NULL COMMENT '指导老师',
  `today_cumulative_profit` decimal(20,3) DEFAULT NULL COMMENT '当日累计利润',
  `today_fee_total` decimal(20,3) DEFAULT NULL COMMENT '当日手续费总额',
  `today_inout_balance` decimal(20,3) DEFAULT NULL COMMENT '当日累计出入金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实盘大赛排名日榜';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_game_rankday`
--

/*!40000 ALTER TABLE `t_game_rankday` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_game_rankday` ENABLE KEYS */;

--
-- Table structure for table `t_game_trddata`
--

DROP TABLE IF EXISTS `t_game_trddata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_game_trddata` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `contract` varchar(30) DEFAULT NULL COMMENT '品种合约',
  `currency` varchar(3) DEFAULT NULL COMMENT '币种',
  `date` date DEFAULT NULL COMMENT '日期',
  `deal_amount` decimal(10,0) DEFAULT NULL COMMENT '成交量',
  `deal_balance` decimal(20,3) DEFAULT NULL COMMENT '成交额',
  `deal_date` date DEFAULT NULL COMMENT '成交日期',
  `deal_no` varchar(16) DEFAULT NULL COMMENT '成交流水号',
  `deal_price` decimal(20,3) DEFAULT NULL COMMENT '成交价',
  `deal_time` varchar(30) DEFAULT NULL COMMENT '成交时间',
  `fee` decimal(20,3) DEFAULT NULL COMMENT '手续费',
  `fund_account` varchar(32) DEFAULT NULL COMMENT '资金账号',
  `is_trading_member` char(1) DEFAULT NULL COMMENT '是否为交易会员',
  `liquid_profit_zbdc` decimal(20,3) DEFAULT NULL COMMENT '平仓盈亏(逐笔对冲)',
  `liquid_profit_zrds` decimal(20,3) DEFAULT NULL COMMENT '平仓盈亏(逐日盯市)',
  `market_flag` char(1) DEFAULT NULL COMMENT '交易所统一标识',
  `position_flag` char(1) DEFAULT NULL COMMENT '开平仓标志',
  `report_code` varchar(12) DEFAULT NULL COMMENT '报单号',
  `seat_code` varchar(15) DEFAULT NULL COMMENT '席位号',
  `speculate_flag` char(1) DEFAULT NULL COMMENT '投机套保标志',
  `trade_code` varchar(13) DEFAULT NULL COMMENT '交易编码',
  `trade_flag` char(1) DEFAULT NULL COMMENT '买卖标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='期货成交明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_game_trddata`
--

/*!40000 ALTER TABLE `t_game_trddata` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_game_trddata` ENABLE KEYS */;

--
-- Table structure for table `t_message`
--

DROP TABLE IF EXISTS `t_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `content` text COMMENT '消息内容',
  `receiver` varchar(64) DEFAULT NULL COMMENT '接收者',
  `state` varchar(32) DEFAULT NULL COMMENT '消息类型,0:初始,1:成功,2:失败',
  `tpl_code` varchar(32) DEFAULT NULL COMMENT '模板编码',
  `type` varchar(32) DEFAULT NULL COMMENT '消息类型,0:短信,1:邮件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='历史消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_message`
--

/*!40000 ALTER TABLE `t_message` DISABLE KEYS */;
INSERT INTO `t_message` VALUES (1,NULL,'2021-02-04 13:49:53',NULL,'2021-02-04 13:49:53','<meta charset=\"utf-8\"><table width=\"100%\"><tr><td style=\"width: 100%;\"><center><table class=\"content-wrap\" style=\"margin: 0px auto; width: 600px;\"><tr><td style=\"margin: 0px auto; overflow: hidden; padding: 0px; border: 0px dotted rgb(238, 238, 238);\"><!----><div tindex=\"1\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: rgb(255, 255, 255); background-image: url(&quot;http://cbs.zyfutures.com:8081/;); background-repeat: no-repeat; background-size: 300px; background-position: 50% 50%;\"><tbody><tr><td style=\"direction: ltr; font-size: 0px; text-align: center; vertical-align: top; width: 600px;\"><table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align: top;\"><tbody><tr><td class=\"oneColumn column1\" style=\"width: 100%; max-width: 100%; min-height: 1px; font-size: 13px; text-align: left; direction: ltr; vertical-align: top; padding: 0px;\"><!----></td></tr></tbody></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"2\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 32px 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 30px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 30px; margin: 0px;\"><span class=\"ql-cursor\">预约开户通知</span></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"3\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 17px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 17px; margin: 0px;\"><span style=\"color: #222222;\">恭喜，有一位潜在客户预约了您的营业部开户，赶紧联系他吧！</span></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"4\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 27px 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 22px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 22px; margin: 0px;\"><strong style=\"color: #444444;\">张**&nbsp;&nbsp;</strong><strong style=\"color: #444444;\">男</strong></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"5\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 27px 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 22px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 22px; margin: 0px;\"><strong style=\"color: #444444;\">178****2237</strong></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"6\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td align=\"center\" vertical-align=\"middle\" style=\"font-size: 0px; word-break: break-word; width: 600px; padding: 50px 30px; background-image: url(&quot;&quot;); background-size: 100px; background-position: 1% 50%; background-repeat: no-repeat;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; line-height: 1;\"><tr><td align=\"center\" valign=\"middle\" style=\"line-height: 1; background-color: rgb(215, 1, 1); padding: 9px 71px;\"><a target=\"_blank\" href=\"http://cbs.zyfutures.com:8081/\" style=\"font-size: 0px; text-decoration: none;\"><p style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; margin: 0px; color: rgb(255, 255, 255); line-height: 1; font-size: 16px; font-weight: normal; text-decoration: none; text-transform: none;\"><span>前往CBS查看客户详情</span></p></a></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"7\" style=\"margin: 0px auto; line-height: 0px; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td align=\"center\" class=\"fullTd\" style=\"direction: ltr; font-size: 0px; padding: 18px 0px; text-align: center; vertical-align: top; word-break: break-word; width: 600px; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; border-spacing: 0px;\"><tbody><tr><td style=\"width: 600px; border-top: 1px solid rgb(204, 204, 204); padding-bottom: 1px;\"></td></tr></tbody></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"8\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 12px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 12px; margin: 0px;\"><a style=\"color: rgb(136, 136, 136); text-decoration: underline; font-weight: normal;\" href=\"http://cbs.zyfutures.com:8081/\" target=\"_blank\" rel=\"noopener noreferrer\">中原期货 — CBS客户业务管理系统&nbsp;</a></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"9\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 2px 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 12px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 12px; margin: 0px;\"><span style=\"color: #bbbbbb;\">系统使用相关问题请联系金融科技部</span></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"10\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 2px 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 12px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 12px; margin: 0px;\"><span style=\"color: #bbbbbb;\">建议在电脑端打开连接</span></p></div></div></td></tr></table></td></tr></tbody></table></div></td></tr></table></center></td></tr></table>','shibaoliang521@outlook.com','1','EMAIL_HTML_TEMPLATE_RESERVEOPEN','1');
/*!40000 ALTER TABLE `t_message` ENABLE KEYS */;

--
-- Table structure for table `t_message_sender`
--

DROP TABLE IF EXISTS `t_message_sender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_message_sender` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `class_name` varchar(64) DEFAULT NULL COMMENT '发送类',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `tpl_code` varchar(64) DEFAULT NULL COMMENT '短信运营商模板编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='消息发送者';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_message_sender`
--

/*!40000 ALTER TABLE `t_message_sender` DISABLE KEYS */;
INSERT INTO `t_message_sender` VALUES (1,NULL,NULL,NULL,NULL,'tencentSmsSender','腾讯短信服务',NULL);
INSERT INTO `t_message_sender` VALUES (2,NULL,NULL,NULL,NULL,'defaultEmailSender','默认邮件发送器',NULL);
/*!40000 ALTER TABLE `t_message_sender` ENABLE KEYS */;

--
-- Table structure for table `t_message_template`
--

DROP TABLE IF EXISTS `t_message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_message_template` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `code` varchar(32) DEFAULT NULL COMMENT '编号',
  `cond` varchar(32) DEFAULT NULL COMMENT '发送条件',
  `content` text COMMENT '内容',
  `id_message_sender` bigint NOT NULL COMMENT '发送者id',
  `title` varchar(64) DEFAULT NULL COMMENT '标题',
  `type` varchar(32) DEFAULT NULL COMMENT '消息类型,0:短信,1:邮件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='消息模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_message_template`
--

/*!40000 ALTER TABLE `t_message_template` DISABLE KEYS */;
INSERT INTO `t_message_template` VALUES (1,NULL,NULL,NULL,NULL,'REGISTER_CODE','注册页面，点击获取验证码','【腾讯云】校验码{1}，请于5分钟内完成验证，如非本人操作请忽略本短信。',1,'注册验证码','0');
INSERT INTO `t_message_template` VALUES (2,NULL,NULL,NULL,NULL,'EMAIL_TEST','测试发送','你好:{1},欢迎使用{2}',2,'测试邮件','1');
INSERT INTO `t_message_template` VALUES (3,NULL,NULL,NULL,NULL,'EMAIL_HTML_TEMPLATE_TEST','测试发送模板邮件','你好<strong>${userName}</strong>欢迎使用<font color=\"red\">${appName}</font>,这是html模板邮件',2,'测试发送模板邮件','1');
INSERT INTO `t_message_template` VALUES (4,NULL,'2020-12-21 05:56:07',NULL,'2020-12-21 05:56:07','EMAIL_HTML_TEMPLATE_RESERVEOPEN','','<meta charset=\"utf-8\"><table width=\"100%\"><tr><td style=\"width: 100%;\"><center><table class=\"content-wrap\" style=\"margin: 0px auto; width: 600px;\"><tr><td style=\"margin: 0px auto; overflow: hidden; padding: 0px; border: 0px dotted rgb(238, 238, 238);\"><!----><div tindex=\"1\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: rgb(255, 255, 255); background-image: url(&quot;http://cbs.zyfutures.com:8081/;); background-repeat: no-repeat; background-size: 300px; background-position: 50% 50%;\"><tbody><tr><td style=\"direction: ltr; font-size: 0px; text-align: center; vertical-align: top; width: 600px;\"><table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"vertical-align: top;\"><tbody><tr><td class=\"oneColumn column1\" style=\"width: 100%; max-width: 100%; min-height: 1px; font-size: 13px; text-align: left; direction: ltr; vertical-align: top; padding: 0px;\"><!----></td></tr></tbody></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"2\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 32px 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 30px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 30px; margin: 0px;\"><span class=\"ql-cursor\">预约开户通知</span></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"3\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 17px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 17px; margin: 0px;\"><span style=\"color: #222222;\">恭喜，有一位潜在客户预约了您的营业部开户，赶紧联系他吧！</span></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"4\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 27px 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 22px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 22px; margin: 0px;\"><strong style=\"color: #444444;\">${clientName}&nbsp;&nbsp;</strong><strong style=\"color: #444444;\">${sex}</strong></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"5\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 27px 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 22px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 22px; margin: 0px;\"><strong style=\"color: #444444;\">${clientPhoneNo}</strong></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"6\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td align=\"center\" vertical-align=\"middle\" style=\"font-size: 0px; word-break: break-word; width: 600px; padding: 50px 30px; background-image: url(&quot;&quot;); background-size: 100px; background-position: 1% 50%; background-repeat: no-repeat;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; line-height: 1;\"><tr><td align=\"center\" valign=\"middle\" style=\"line-height: 1; background-color: rgb(215, 1, 1); padding: 9px 71px;\"><a target=\"_blank\" href=\"http://cbs.zyfutures.com:8081/\" style=\"font-size: 0px; text-decoration: none;\"><p style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; margin: 0px; color: rgb(255, 255, 255); line-height: 1; font-size: 16px; font-weight: normal; text-decoration: none; text-transform: none;\"><span>前往CBS查看客户详情</span></p></a></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"7\" style=\"margin: 0px auto; line-height: 0px; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td align=\"center\" class=\"fullTd\" style=\"direction: ltr; font-size: 0px; padding: 18px 0px; text-align: center; vertical-align: top; word-break: break-word; width: 600px; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; border-spacing: 0px;\"><tbody><tr><td style=\"width: 600px; border-top: 1px solid rgb(204, 204, 204); padding-bottom: 1px;\"></td></tr></tbody></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"8\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 12px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 12px; margin: 0px;\"><a style=\"color: rgb(136, 136, 136); text-decoration: underline; font-weight: normal;\" href=\"http://cbs.zyfutures.com:8081/\" target=\"_blank\" rel=\"noopener noreferrer\">中原期货 — CBS客户业务管理系统&nbsp;</a></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"9\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 2px 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 12px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 12px; margin: 0px;\"><span style=\"color: #bbbbbb;\">系统使用相关问题请联系金融科技部</span></p></div></div></td></tr></table></td></tr></tbody></table></div><div class=\"full\" tindex=\"10\" style=\"margin: 0px auto; max-width: 600px;\"><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"fullTable\" style=\"width: 600px;\"><tbody><tr><td class=\"fullTd\" style=\"direction: ltr; width: 600px; font-size: 0px; padding-bottom: 0px; text-align: center; vertical-align: top; background-image: url(&quot;&quot;); background-repeat: no-repeat; background-size: 100px; background-position: 1% 50%;\"><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"vertical-align: top;\"><tr><td align=\"left\" style=\"font-size: 0px; padding: 2px 10px;\"><div class=\"text\" style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; overflow-wrap: break-word; margin: 0px; text-align: center; line-height: 20px; color: rgb(102, 102, 102); font-size: 12px; font-weight: normal;\"><div><p style=\"text-size-adjust: none; word-break: break-word; line-height: 20px; font-size: 12px; margin: 0px;\"><span style=\"color: #bbbbbb;\">建议在电脑端打开连接</span></p></div></div></td></tr></table></td></tr></tbody></table></div></td></tr></table></center></td></tr></table>',2,'预约开户通知HTML邮件模板','1');
/*!40000 ALTER TABLE `t_message_template` ENABLE KEYS */;

--
-- Table structure for table `t_publicity_margin`
--

DROP TABLE IF EXISTS `t_publicity_margin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_publicity_margin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `company_margin` decimal(10,4) DEFAULT NULL COMMENT '公司保证金比例',
  `contract_code` varchar(16) DEFAULT NULL COMMENT '合约代码',
  `contract_name` varchar(16) DEFAULT NULL COMMENT '合约名称',
  `exchange_margin` decimal(10,4) DEFAULT NULL COMMENT '交易所保证金比例',
  `last_price` decimal(10,4) DEFAULT NULL COMMENT '最新价',
  `market_no` int DEFAULT NULL COMMENT '交易所',
  `min_change_price` decimal(10,4) DEFAULT NULL COMMENT '最小变动价位',
  `multiplier` decimal(10,4) DEFAULT NULL COMMENT '合约乘数',
  `multiplier_unit` varchar(16) DEFAULT NULL COMMENT '合约乘数单位',
  `price_unit` varchar(16) DEFAULT NULL COMMENT '价格单位',
  `quote_change` decimal(10,4) DEFAULT NULL COMMENT '涨跌幅比例',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='保证金公示信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_publicity_margin`
--

/*!40000 ALTER TABLE `t_publicity_margin` DISABLE KEYS */;
INSERT INTO `t_publicity_margin` VALUES (5,16,'2020-11-18 07:44:55',16,'2020-11-18 07:47:28',12.0000,'CU','铜',8.0000,NULL,1,NULL,5.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (6,16,'2020-11-18 07:46:04',16,'2020-11-18 07:46:04',12.0000,'AL','铝',8.0000,NULL,1,NULL,5.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (7,16,'2020-11-18 07:47:12',16,'2020-11-18 07:47:12',12.0000,'ZN','锌',8.0000,NULL,1,NULL,5.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (8,16,'2020-11-18 07:48:42',16,'2020-11-18 07:48:42',12.0000,'PB','铅',8.0000,NULL,1,NULL,5.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (9,16,'2020-11-18 07:49:59',16,'2020-11-19 02:25:37',12.0000,'NI','镍',8.0000,NULL,1,NULL,1.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (10,16,'2020-11-18 07:50:49',16,'2020-11-18 07:50:49',12.0000,'SN','锡',8.0000,NULL,1,NULL,1.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (11,16,'2020-11-18 07:51:28',16,'2020-11-19 08:51:27',15.0000,'RU','天然橡胶',10.0000,NULL,1,NULL,10.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (12,16,'2020-11-18 07:52:17',16,'2020-11-18 07:52:17',11.0000,'RB','螺纹钢',7.0000,NULL,1,NULL,10.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (13,16,'2020-11-18 07:53:11',16,'2020-11-18 07:53:11',11.0000,'WR','线材',7.0000,NULL,1,NULL,10.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (14,16,'2020-11-18 07:53:51',16,'2020-11-18 07:53:51',13.0000,'AU','黄金',8.0000,NULL,1,NULL,1000.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (15,16,'2020-11-18 07:54:49',16,'2020-11-18 07:54:49',17.0000,'AG','白银',12.0000,NULL,1,NULL,15.0000,'','',10.0000,'');
INSERT INTO `t_publicity_margin` VALUES (16,16,'2020-11-18 07:58:58',16,'2020-11-18 07:58:58',14.0000,'FU','燃料油',10.0000,NULL,1,NULL,10.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (17,16,'2020-11-18 07:59:53',16,'2020-11-18 07:59:53',14.0000,'BU','石油沥青',10.0000,NULL,1,NULL,10.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (18,16,'2020-11-18 08:00:46',16,'2020-11-18 08:00:46',11.0000,'HC','热轧卷板',7.0000,NULL,1,NULL,10.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (19,16,'2020-11-18 08:02:13',16,'2020-11-19 08:53:53',11.0000,'SP','纸浆',7.0000,NULL,1,NULL,10.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (20,16,'2020-11-18 08:03:06',16,'2020-11-18 08:03:06',11.0000,'SS','不锈钢',7.0000,NULL,1,NULL,5.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (21,16,'2020-11-19 01:50:29',16,'2020-11-19 01:50:29',13.0000,'A','黄大豆1',10.0000,NULL,2,NULL,10.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (22,16,'2020-11-19 01:51:19',16,'2020-11-19 01:51:19',12.0000,'B','黄大豆2',9.0000,NULL,2,NULL,10.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (23,16,'2020-11-19 01:51:57',16,'2020-11-19 01:51:57',11.0000,'C','玉米',8.0000,NULL,2,NULL,10.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (24,16,'2020-11-19 01:52:30',16,'2020-11-19 01:52:30',11.0000,'M','豆粕',8.0000,NULL,2,NULL,10.0000,'','',7.0000,'');
INSERT INTO `t_publicity_margin` VALUES (25,16,'2020-11-19 01:53:07',16,'2020-11-19 01:53:07',12.0000,'Y','豆油',8.0000,NULL,2,NULL,10.0000,'','',7.0000,'');
INSERT INTO `t_publicity_margin` VALUES (26,16,'2020-11-19 01:53:54',16,'2020-11-19 01:53:54',13.0000,'P','棕榈油',9.0000,NULL,2,NULL,10.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (27,16,'2020-11-19 01:54:55',16,'2020-11-19 08:55:02',15.0000,'L','聚乙烯',11.0000,NULL,2,NULL,5.0000,'','',9.0000,'');
INSERT INTO `t_publicity_margin` VALUES (28,16,'2020-11-19 01:55:58',16,'2020-11-19 01:55:58',13.0000,'V','聚氯乙烯',9.0000,NULL,2,NULL,5.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (29,16,'2020-11-19 01:57:14',16,'2020-11-19 01:57:14',13.0000,'J','焦炭',9.0000,NULL,2,NULL,100.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (30,16,'2020-11-19 01:57:52',16,'2020-11-19 01:57:52',13.0000,'JM','焦煤',9.0000,NULL,2,NULL,60.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (31,16,'2020-11-19 01:59:05',16,'2020-11-19 01:59:05',15.0000,'I','铁矿',11.0000,NULL,2,NULL,100.0000,'','',10.0000,'');
INSERT INTO `t_publicity_margin` VALUES (32,16,'2020-11-19 02:04:08',16,'2020-11-19 02:04:08',10.0000,'JD','鸡蛋',7.0000,NULL,2,NULL,10.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (33,16,'2020-11-19 02:07:09',16,'2020-11-19 02:07:09',14.0000,'FB','纤维板',10.0000,NULL,2,NULL,10.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (34,16,'2020-11-19 02:08:26',16,'2020-11-19 02:08:26',43.0000,'BB','胶合板',40.0000,NULL,2,NULL,500.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (35,16,'2020-11-19 02:09:11',16,'2020-11-19 02:09:11',15.0000,'PP','聚丙烯',11.0000,NULL,2,NULL,5.0000,'','',9.0000,'');
INSERT INTO `t_publicity_margin` VALUES (36,16,'2020-11-19 02:09:57',16,'2020-11-19 02:09:57',10.0000,'CS','玉米淀粉',7.0000,NULL,2,NULL,10.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (37,16,'2020-11-19 02:10:45',16,'2020-11-19 02:10:45',15.0000,'EG','乙二醇',11.0000,NULL,2,NULL,10.0000,'','',9.0000,'');
INSERT INTO `t_publicity_margin` VALUES (38,16,'2020-11-19 02:11:24',16,'2020-11-19 02:11:24',9.0000,'RR','粳米',6.0000,NULL,2,NULL,10.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (39,16,'2020-11-19 02:11:57',16,'2020-11-19 02:11:57',16.0000,'EB','苯乙烯',12.0000,NULL,2,NULL,5.0000,'','',11.0000,'');
INSERT INTO `t_publicity_margin` VALUES (40,16,'2020-11-19 02:13:46',16,'2020-11-19 02:13:46',17.0000,'PG','液化石油气',11.0000,NULL,2,NULL,20.0000,'','',10.0000,'');
INSERT INTO `t_publicity_margin` VALUES (41,16,'2020-11-19 02:18:10',16,'2020-11-19 02:18:10',11.0000,'SR','白糖',7.0000,NULL,3,NULL,10.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (42,16,'2020-11-19 02:18:57',16,'2020-11-19 02:18:57',11.0000,'CF','棉花',7.0000,NULL,3,NULL,5.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (43,16,'2020-11-19 02:19:31',16,'2020-11-19 02:19:31',11.0000,'CY','棉纱',7.0000,NULL,3,NULL,5.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (44,16,'2020-11-19 02:20:59',16,'2020-11-19 02:20:59',10.0000,'WH','强麦',7.0000,NULL,3,NULL,20.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (45,16,'2020-11-19 02:21:53',16,'2020-11-19 02:21:53',9.0000,'PM','普麦',6.0000,NULL,3,NULL,50.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (46,16,'2020-11-19 02:23:23',16,'2020-11-19 08:51:32',24.0000,'RS','油菜籽',20.0000,NULL,3,NULL,10.0000,'','',10.0000,'');
INSERT INTO `t_publicity_margin` VALUES (47,16,'2020-11-19 02:24:13',16,'2020-11-19 08:56:23',10.0000,'RM','菜籽粕',6.0000,NULL,3,NULL,10.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (48,16,'2020-11-19 02:25:48',16,'2020-11-19 02:25:48',10.0000,'OI','菜籽油',6.0000,NULL,3,NULL,10.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (49,16,'2020-11-19 02:26:28',16,'2020-11-19 02:26:28',10.0000,'RI','早籼稻',6.0000,NULL,3,NULL,20.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (50,16,'2020-11-19 02:26:58',16,'2020-11-19 02:26:58',10.0000,'LR','晚籼稻',6.0000,NULL,3,NULL,20.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (51,16,'2020-11-19 02:28:01',16,'2020-11-25 01:21:46',10.0000,'TA','精对苯二甲酸(PTA)',6.0000,NULL,3,NULL,5.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (52,16,'2020-11-19 02:28:41',16,'2020-11-19 03:06:56',11.0000,'MA','甲醇',7.0000,NULL,3,NULL,10.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (53,16,'2020-11-19 02:34:36',16,'2020-11-19 08:53:10',10.0000,'FG','玻璃',6.0000,NULL,3,NULL,20.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (54,16,'2020-11-19 02:35:19',16,'2020-11-19 02:35:19',9.0000,'ZC','动力煤',5.0000,NULL,3,NULL,100.0000,'','',4.0000,'');
INSERT INTO `t_publicity_margin` VALUES (55,16,'2020-11-19 02:35:51',16,'2020-11-19 02:35:51',9.0000,'JR','粳稻',6.0000,NULL,3,NULL,20.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (56,16,'2020-11-19 02:36:24',16,'2020-11-19 02:36:24',11.0000,'SF','硅铁',7.0000,NULL,3,NULL,5.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (57,16,'2020-11-19 02:37:03',16,'2020-11-19 02:37:03',11.0000,'SM','锰硅',7.0000,NULL,3,NULL,5.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (58,16,'2020-11-19 02:37:56',16,'2020-11-19 02:37:56',12.0000,'AP','苹果',8.0000,NULL,3,NULL,10.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (59,16,'2020-11-19 02:38:31',16,'2020-11-19 02:38:31',11.0000,'CJ','红枣',7.0000,NULL,3,NULL,5.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (60,16,'2020-11-19 02:38:58',16,'2020-11-19 02:59:48',9.0000,'UR','尿素',5.0000,NULL,3,NULL,20.0000,'','',4.0000,'');
INSERT INTO `t_publicity_margin` VALUES (61,16,'2020-11-19 02:39:27',16,'2020-11-19 02:39:27',10.0000,'SA','纯碱',6.0000,NULL,3,NULL,20.0000,'','',5.0000,'');
INSERT INTO `t_publicity_margin` VALUES (62,16,'2020-11-19 02:40:01',16,'2020-11-19 02:51:38',11.0000,'PF','短纤',7.0000,NULL,3,NULL,5.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (63,16,'2020-11-19 02:54:58',16,'2020-11-19 02:54:58',1.0000,'TS','2年期国债',0.5000,NULL,4,NULL,20000.0000,'','',0.5000,'');
INSERT INTO `t_publicity_margin` VALUES (64,16,'2020-11-19 02:56:04',16,'2020-11-19 02:56:04',1.7000,'TF','5年期国债',1.2000,NULL,4,NULL,10000.0000,'','',1.2000,'');
INSERT INTO `t_publicity_margin` VALUES (65,16,'2020-11-19 02:56:30',16,'2020-11-19 02:56:30',2.5000,'T','10年期国债',2.0000,NULL,4,NULL,10000.0000,'','',2.0000,'');
INSERT INTO `t_publicity_margin` VALUES (66,16,'2020-11-19 02:57:05',16,'2020-11-19 02:57:05',14.0000,'IF','沪深300指数',11.0000,NULL,4,NULL,300.0000,'','',10.0000,'');
INSERT INTO `t_publicity_margin` VALUES (67,16,'2020-11-19 02:57:42',16,'2020-11-19 02:57:42',14.0000,'IH','上证50指数',11.0000,NULL,4,NULL,300.0000,'','',10.0000,'');
INSERT INTO `t_publicity_margin` VALUES (68,16,'2020-11-19 02:58:22',16,'2020-11-19 02:58:22',16.0000,'IC','中证500指数',13.0000,NULL,4,NULL,200.0000,'','',10.0000,'');
INSERT INTO `t_publicity_margin` VALUES (69,16,'2020-11-19 06:24:44',16,'2020-11-19 06:24:44',15.0000,'SC','原油',10.0000,NULL,5,NULL,1000.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (70,16,'2020-11-19 06:25:50',16,'2020-11-19 06:25:50',15.0000,'LU','低硫燃料油',10.0000,NULL,5,NULL,10.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (71,16,'2020-11-19 06:27:15',16,'2020-11-19 06:27:15',15.0000,'NR','20号胶',10.0000,NULL,5,NULL,10.0000,'','',8.0000,'');
INSERT INTO `t_publicity_margin` VALUES (72,16,'2020-11-19 06:28:20',16,'2020-11-19 06:28:20',13.0000,'BC','国际铜',8.0000,NULL,5,NULL,5.0000,'','',6.0000,'');
INSERT INTO `t_publicity_margin` VALUES (73,16,'2020-12-02 01:44:11',1,'2020-12-02 01:44:11',12.0000,'AA','测试合约',10.0000,NULL,1,NULL,5.0000,'','',10.0000,'测试');
/*!40000 ALTER TABLE `t_publicity_margin` ENABLE KEYS */;

--
-- Table structure for table `t_publicity_riskcalendar`
--

DROP TABLE IF EXISTS `t_publicity_riskcalendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_publicity_riskcalendar` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_closed` tinyint DEFAULT NULL COMMENT '是否表示休假',
  `is_content` tinyint DEFAULT NULL COMMENT '是否有风控提示内容',
  `is_no_night` tinyint DEFAULT NULL COMMENT '是否表示今日无夜盘',
  `month` int DEFAULT NULL COMMENT '月份',
  `risk_content` varchar(2048) DEFAULT NULL COMMENT '风险提示内容',
  `risk_date` date NOT NULL COMMENT '风险提示日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='风控日历';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_publicity_riskcalendar`
--

/*!40000 ALTER TABLE `t_publicity_riskcalendar` DISABLE KEYS */;
INSERT INTO `t_publicity_riskcalendar` VALUES (6,1,'2021-02-01 10:44:28',1,'2021-02-01 10:44:28',0,1,0,202102,'上/能：除FU/SC/LU/NR,2102个人持仓0\n上：除FU以外的所有2102保证金调整至20%\n能：NR2102保证金调整至20%','2021-02-02');
INSERT INTO `t_publicity_riskcalendar` VALUES (7,1,'2021-02-01 10:44:38',1,'2021-02-01 10:44:38',0,1,0,202102,'郑：2103期权最后交易日','2021-02-03');
INSERT INTO `t_publicity_riskcalendar` VALUES (8,1,'2021-02-01 10:44:48',1,'2021-02-01 10:44:48',0,1,0,202102,'上/能：除FU/SC/LU,2102最后交易日 \n郑：ZC2102最后交易日\n大：2103期权最后交易日','2021-02-05');
INSERT INTO `t_publicity_riskcalendar` VALUES (9,1,'2021-02-01 10:45:03',1,'2021-02-01 10:45:03',0,1,0,202102,'能：SC/LU2103个人持仓0','2021-02-09');
INSERT INTO `t_publicity_riskcalendar` VALUES (10,1,'2021-02-01 10:45:17',4,'2021-02-02 10:19:34',0,1,1,202102,'当日结算后：\n郑：除红枣外所有2103保证金调整至10%（高于此标准的取高）\n红枣2103保证金调整至15%','2021-02-10');
INSERT INTO `t_publicity_riskcalendar` VALUES (11,1,'2021-02-01 10:45:29',1,'2021-02-01 10:45:29',1,0,0,202102,'','2021-02-11');
INSERT INTO `t_publicity_riskcalendar` VALUES (12,1,'2021-02-01 10:45:35',1,'2021-02-01 10:45:35',1,0,0,202102,'','2021-02-12');
INSERT INTO `t_publicity_riskcalendar` VALUES (13,1,'2021-02-01 10:46:10',1,'2021-02-01 10:46:10',0,1,0,202101,'上/能：FU/SC/LU2102最后交易日\n大/郑：2102个人持仓0\n当日结算后：\n上：除FU以外所有2102保证金调整至15%\n除FU以外所有2103保证金调整至10%\n大/郑：所有2102保证金调整至20%\n红枣2103保证金调整至10%','2021-01-29');
INSERT INTO `t_publicity_riskcalendar` VALUES (14,1,'2021-02-01 10:49:15',1,'2021-02-01 10:49:15',1,0,0,202102,'','2021-02-13');
INSERT INTO `t_publicity_riskcalendar` VALUES (15,1,'2021-02-01 10:49:25',1,'2021-02-01 10:49:25',1,0,0,202102,'','2021-02-14');
INSERT INTO `t_publicity_riskcalendar` VALUES (16,1,'2021-02-01 10:49:30',1,'2021-02-01 10:49:30',1,0,0,202102,'','2021-02-15');
INSERT INTO `t_publicity_riskcalendar` VALUES (17,1,'2021-02-01 10:49:35',1,'2021-02-01 10:49:35',1,0,0,202102,'','2021-02-16');
INSERT INTO `t_publicity_riskcalendar` VALUES (18,1,'2021-02-01 10:49:43',1,'2021-02-01 10:49:43',1,0,0,202102,'','2021-02-17');
INSERT INTO `t_publicity_riskcalendar` VALUES (19,1,'2021-02-01 10:50:01',1,'2021-02-01 10:50:01',0,1,0,202102,'当日结算后：\n上：FU2103保证金调整至15%','2021-02-18');
INSERT INTO `t_publicity_riskcalendar` VALUES (20,1,'2021-02-01 10:50:11',1,'2021-02-01 10:50:11',0,1,0,202102,'大：除JD/EG/EB/PG,2102最后交易日\n郑：除ZC,2102最后交易日\n中：2102股指期货与期权最后交易日','2021-02-19');
INSERT INTO `t_publicity_riskcalendar` VALUES (21,1,'2021-02-01 10:50:23',1,'2021-02-01 10:50:23',0,1,0,202102,'上：2103期权最后交易日','2021-02-22');
INSERT INTO `t_publicity_riskcalendar` VALUES (22,1,'2021-02-01 10:50:41',1,'2021-02-01 10:50:41',0,1,0,202102,'大：JD/EG/EB/PG2102最后交易日\n上：FU2103个人持仓0\n当日结算后：\n上：FU2103保证金调整至20%\n能：SC、LU2103保证金调整至20%','2021-02-23');
INSERT INTO `t_publicity_riskcalendar` VALUES (23,1,'2021-02-01 10:50:52',1,'2021-02-01 10:50:52',0,1,0,202102,'中：国债未过审持仓0\n当日结算后：\n大：所有2103保证金调整至10%（高于此标准的取高）','2021-02-25');
INSERT INTO `t_publicity_riskcalendar` VALUES (24,1,'2021-02-01 10:51:02',1,'2021-02-01 10:51:02',0,1,0,202102,'上/能：FU/SC/LU2103最后交易日\n大/郑：2103个人持仓0\n当日结算后：\n上：除FU以外所有2103保证金调整至15%\n除FU以外所有2104保证金调整至10%\n大/郑：所有2103保证金调整至20%\n红枣2104保证金调整至10%','2021-02-26');
INSERT INTO `t_publicity_riskcalendar` VALUES (25,1,'2021-02-01 15:09:31',1,'2021-02-01 15:09:31',0,1,0,202102,'测试内容','2021-02-01');
INSERT INTO `t_publicity_riskcalendar` VALUES (26,1,'2021-02-03 15:09:06',1,'2021-02-03 15:09:06',1,1,0,202101,'测试','2021-01-31');
INSERT INTO `t_publicity_riskcalendar` VALUES (27,1,'2021-02-19 16:49:35',1,'2021-02-19 17:08:20',0,1,0,202103,'测试再再再','2021-03-01');
/*!40000 ALTER TABLE `t_publicity_riskcalendar` ENABLE KEYS */;

--
-- Table structure for table `t_publicity_specialmargin`
--

DROP TABLE IF EXISTS `t_publicity_specialmargin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_publicity_specialmargin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `company_margin` decimal(10,4) DEFAULT NULL COMMENT '特殊合约公司保证金比例',
  `contract_code` varchar(16) DEFAULT NULL COMMENT '标准合约代码',
  `exchange_margin` decimal(10,4) DEFAULT NULL COMMENT '特殊合约交易所保证金比例',
  `quote_change` decimal(10,4) DEFAULT NULL COMMENT '特殊合约涨跌幅比例',
  `remark` varchar(1024) DEFAULT NULL COMMENT '特殊合约备注',
  `special_contract_code` varchar(256) DEFAULT NULL COMMENT '特殊合约代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='特殊保证金公示信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_publicity_specialmargin`
--

/*!40000 ALTER TABLE `t_publicity_specialmargin` DISABLE KEYS */;
INSERT INTO `t_publicity_specialmargin` VALUES (1,1,'2020-12-02 01:05:17',1,'2020-12-02 01:05:17',15.0000,'BC',12.0000,10.0000,'交割月前一个月第一个交易日起','BC2101');
INSERT INTO `t_publicity_specialmargin` VALUES (2,1,'2020-12-02 01:05:54',1,'2020-12-02 01:05:54',20.0000,'CU',15.0000,6.0000,'交割月第一个交易日起','CU2012');
INSERT INTO `t_publicity_specialmargin` VALUES (3,1,'2020-12-02 01:06:09',1,'2020-12-02 01:06:09',15.0000,'CU',10.0000,6.0000,'交割月前一个月第一个交易日起','CU2101');
INSERT INTO `t_publicity_specialmargin` VALUES (4,1,'2020-12-02 02:31:19',1,'2020-12-02 02:31:19',15.0000,'AL',12.0000,10.0000,'交割月前一个月第一个交易日起','AL2101-AL2103');
INSERT INTO `t_publicity_specialmargin` VALUES (5,1,'2020-12-02 02:32:15',1,'2020-12-02 02:32:15',10.0000,'AL',8.0000,5.0000,'交割月前一个月第一个交易日起','AL2105 AL2106 AL2109 AL2110 AL2112');
/*!40000 ALTER TABLE `t_publicity_specialmargin` ENABLE KEYS */;

--
-- Table structure for table `t_research_contractfield`
--

DROP TABLE IF EXISTS `t_research_contractfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_research_contractfield` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `field_order` int DEFAULT NULL COMMENT '列顺序',
  `is_show` tinyint DEFAULT NULL COMMENT '是否显示',
  `table_field` varchar(64) DEFAULT NULL COMMENT '列英文名',
  `table_field_name` varchar(64) DEFAULT NULL COMMENT '列中文名',
  `table_name_en` varchar(64) DEFAULT NULL COMMENT '表英文名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='研究品种列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_research_contractfield`
--

/*!40000 ALTER TABLE `t_research_contractfield` DISABLE KEYS */;
INSERT INTO `t_research_contractfield` VALUES (1,1,'2021-11-30 14:46:13',1,'2021-11-30 14:46:13',1,1,'businessDate','业务日期','t_research_hisbasis');
INSERT INTO `t_research_contractfield` VALUES (2,1,'2021-11-30 14:46:43',1,'2021-11-30 14:46:43',2,1,'y2016','2016年','t_research_hisbasis');
INSERT INTO `t_research_contractfield` VALUES (3,1,'2021-11-30 14:46:52',1,'2021-11-30 14:46:52',3,1,'y2017','2017年','t_research_hisbasis');
INSERT INTO `t_research_contractfield` VALUES (4,1,'2021-11-30 14:47:02',1,'2021-11-30 14:47:02',4,1,'y2018','2018年','t_research_hisbasis');
INSERT INTO `t_research_contractfield` VALUES (5,1,'2021-11-30 14:47:16',1,'2021-11-30 14:47:16',5,1,'y2019','2019年','t_research_hisbasis');
INSERT INTO `t_research_contractfield` VALUES (6,1,'2021-11-30 14:47:27',1,'2021-11-30 14:47:27',6,1,'y2020','2020年','t_research_hisbasis');
INSERT INTO `t_research_contractfield` VALUES (7,1,'2021-11-30 14:47:36',1,'2021-11-30 14:47:36',7,1,'y2021','2021年','t_research_hisbasis');
INSERT INTO `t_research_contractfield` VALUES (8,1,'2021-11-30 16:47:17',1,'2021-11-30 16:47:17',1,1,'businessDate','业务日期','t_research_interspread');
INSERT INTO `t_research_contractfield` VALUES (9,1,'2021-11-30 16:47:51',1,'2021-11-30 16:47:51',2,1,'m17011705','1701-1705','t_research_interspread');
INSERT INTO `t_research_contractfield` VALUES (10,1,'2021-11-30 16:48:16',1,'2021-11-30 16:49:00',3,1,'m18011805','1801-1805','t_research_interspread');
INSERT INTO `t_research_contractfield` VALUES (11,1,'2021-11-30 16:48:34',1,'2021-11-30 16:51:17',4,1,'m19011905','1901-1905','t_research_interspread');
INSERT INTO `t_research_contractfield` VALUES (12,1,'2021-11-30 16:51:41',1,'2021-11-30 16:51:41',5,1,'m20012005','2001-2005','t_research_interspread');
INSERT INTO `t_research_contractfield` VALUES (13,1,'2021-11-30 16:51:57',1,'2021-11-30 16:51:57',6,1,'m21012105','2101-2105','t_research_interspread');
INSERT INTO `t_research_contractfield` VALUES (14,1,'2021-11-30 16:52:11',1,'2021-11-30 16:52:11',7,1,'m22012205','2201-2205','t_research_interspread');
/*!40000 ALTER TABLE `t_research_contractfield` ENABLE KEYS */;

--
-- Table structure for table `t_research_hisbasis`
--

DROP TABLE IF EXISTS `t_research_hisbasis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_research_hisbasis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `business_date` varchar(16) DEFAULT NULL COMMENT '业务日期',
  `contract_code` varchar(16) DEFAULT NULL COMMENT '合约代码',
  `contract_name` varchar(16) DEFAULT NULL COMMENT '合约名称',
  `y_2016` decimal(10,2) DEFAULT NULL COMMENT '2016年',
  `y_2017` decimal(10,2) DEFAULT NULL COMMENT '2017年',
  `y_2018` decimal(10,2) DEFAULT NULL COMMENT '2018年',
  `y_2019` decimal(10,2) DEFAULT NULL COMMENT '2019年',
  `y_2020` decimal(10,2) DEFAULT NULL COMMENT '2020年',
  `y_2021` decimal(10,2) DEFAULT NULL COMMENT '2021年',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2300 DEFAULT CHARSET=utf8 COMMENT='历史基差表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_research_hisbasis`
--

/*!40000 ALTER TABLE `t_research_hisbasis` DISABLE KEYS */;
INSERT INTO `t_research_hisbasis` VALUES (1,NULL,NULL,NULL,NULL,'2021-01-04','MA','甲醇',18.00,373.00,477.00,-112.00,-30.00,68.00);
INSERT INTO `t_research_hisbasis` VALUES (2,NULL,NULL,NULL,NULL,'2021-01-05','MA','甲醇',12.00,363.00,491.00,-104.00,-44.00,71.00);
INSERT INTO `t_research_hisbasis` VALUES (3,NULL,NULL,NULL,NULL,'2021-01-06','MA','甲醇',7.00,372.00,474.00,-120.00,30.00,56.00);
INSERT INTO `t_research_hisbasis` VALUES (4,NULL,NULL,NULL,NULL,'2021-01-07','MA','甲醇',46.00,359.00,625.00,-96.00,11.00,69.00);
INSERT INTO `t_research_hisbasis` VALUES (5,NULL,NULL,NULL,NULL,'2021-01-08','MA','甲醇',60.00,346.00,614.00,-102.00,21.00,67.00);
INSERT INTO `t_research_hisbasis` VALUES (6,NULL,NULL,NULL,NULL,'2021-01-11','MA','甲醇',18.00,254.00,712.00,-91.00,-16.00,115.00);
INSERT INTO `t_research_hisbasis` VALUES (7,NULL,NULL,NULL,NULL,'2021-01-12','MA','甲醇',28.00,234.00,697.00,-114.00,20.00,153.00);
INSERT INTO `t_research_hisbasis` VALUES (8,NULL,NULL,NULL,NULL,'2021-01-13','MA','甲醇',23.00,177.00,731.00,-101.00,35.00,138.00);
INSERT INTO `t_research_hisbasis` VALUES (9,NULL,NULL,NULL,NULL,'2021-01-14','MA','甲醇',42.00,230.00,722.00,-108.00,94.00,133.00);
INSERT INTO `t_research_hisbasis` VALUES (10,NULL,NULL,NULL,NULL,'2021-01-15','MA','甲醇',32.00,110.00,534.00,-103.00,89.00,144.00);
INSERT INTO `t_research_hisbasis` VALUES (11,NULL,NULL,NULL,NULL,'2021-01-18','MA','甲醇',40.00,166.00,401.00,-109.00,61.00,178.00);
INSERT INTO `t_research_hisbasis` VALUES (12,NULL,NULL,NULL,NULL,'2021-01-19','MA','甲醇',28.00,164.00,467.00,-113.00,59.00,146.00);
INSERT INTO `t_research_hisbasis` VALUES (13,NULL,NULL,NULL,NULL,'2021-01-20','MA','甲醇',-12.00,211.00,626.00,-99.00,95.00,177.00);
INSERT INTO `t_research_hisbasis` VALUES (14,NULL,NULL,NULL,NULL,'2021-01-21','MA','甲醇',-12.00,139.00,660.00,-93.00,78.00,185.00);
INSERT INTO `t_research_hisbasis` VALUES (15,NULL,NULL,NULL,NULL,'2021-01-22','MA','甲醇',-13.00,169.00,566.00,-130.00,75.00,169.00);
INSERT INTO `t_research_hisbasis` VALUES (16,NULL,NULL,NULL,NULL,'2021-01-25','MA','甲醇',-2.00,117.00,554.00,-87.00,83.00,162.00);
INSERT INTO `t_research_hisbasis` VALUES (17,NULL,NULL,NULL,NULL,'2021-01-26','MA','甲醇',23.00,129.00,566.00,-91.00,-6.00,102.00);
INSERT INTO `t_research_hisbasis` VALUES (18,NULL,NULL,NULL,NULL,'2021-01-27','MA','甲醇',15.00,130.00,534.00,-93.00,41.00,117.00);
INSERT INTO `t_research_hisbasis` VALUES (19,NULL,NULL,NULL,NULL,'2021-01-28','MA','甲醇',9.00,129.00,496.00,-98.00,18.00,76.00);
INSERT INTO `t_research_hisbasis` VALUES (20,NULL,NULL,NULL,NULL,'2021-01-29','MA','甲醇',15.00,97.00,508.00,-70.00,9.00,95.00);
INSERT INTO `t_research_hisbasis` VALUES (21,NULL,NULL,NULL,NULL,'2021-02-01','MA','甲醇',5.00,68.00,523.00,-56.00,7.00,42.00);
INSERT INTO `t_research_hisbasis` VALUES (22,NULL,NULL,NULL,NULL,'2021-02-02','MA','甲醇',16.00,93.00,504.00,-79.00,-18.00,36.00);
INSERT INTO `t_research_hisbasis` VALUES (23,NULL,NULL,NULL,NULL,'2021-02-03','MA','甲醇',3.00,74.00,491.00,-78.00,-32.00,27.00);
INSERT INTO `t_research_hisbasis` VALUES (24,NULL,NULL,NULL,NULL,'2021-02-04','MA','甲醇',-23.00,107.00,485.00,-85.00,-35.00,56.00);
INSERT INTO `t_research_hisbasis` VALUES (25,NULL,NULL,NULL,NULL,'2021-02-05','MA','甲醇',-30.00,-9.00,418.00,-92.00,-74.00,56.00);
INSERT INTO `t_research_hisbasis` VALUES (26,NULL,NULL,NULL,NULL,'2021-02-08','MA','甲醇',-18.00,17.00,366.00,-83.00,-77.00,67.00);
INSERT INTO `t_research_hisbasis` VALUES (27,NULL,NULL,NULL,NULL,'2021-02-09','MA','甲醇',-26.00,7.00,286.00,-66.00,-84.00,70.00);
INSERT INTO `t_research_hisbasis` VALUES (28,NULL,NULL,NULL,NULL,'2021-02-10','MA','甲醇',-17.00,45.00,282.00,-88.00,-92.00,111.00);
INSERT INTO `t_research_hisbasis` VALUES (29,NULL,NULL,NULL,NULL,'2021-02-18','MA','甲醇',-18.00,25.00,274.00,-82.00,-75.00,52.00);
INSERT INTO `t_research_hisbasis` VALUES (30,NULL,NULL,NULL,NULL,'2021-02-19','MA','甲醇',-19.00,25.00,258.00,-60.00,-92.00,-31.00);
INSERT INTO `t_research_hisbasis` VALUES (31,NULL,NULL,NULL,NULL,'2021-02-22','MA','甲醇',-8.00,15.00,286.00,-65.00,-95.00,-34.00);
INSERT INTO `t_research_hisbasis` VALUES (32,NULL,NULL,NULL,NULL,'2021-02-23','MA','甲醇',-2.00,74.00,284.00,-75.00,-74.00,-47.00);
INSERT INTO `t_research_hisbasis` VALUES (33,NULL,NULL,NULL,NULL,'2021-02-24','MA','甲醇',1.00,93.00,320.00,-77.00,-91.00,-40.00);
INSERT INTO `t_research_hisbasis` VALUES (34,NULL,NULL,NULL,NULL,'2021-02-25','MA','甲醇',-6.00,112.00,306.00,-80.00,-102.00,-32.00);
INSERT INTO `t_research_hisbasis` VALUES (35,NULL,NULL,NULL,NULL,'2021-02-26','MA','甲醇',10.00,100.00,166.00,-57.00,-81.00,-54.00);
INSERT INTO `t_research_hisbasis` VALUES (36,NULL,NULL,NULL,NULL,'2021-03-01','MA','甲醇',34.00,90.00,52.00,-86.00,-93.00,-41.00);
INSERT INTO `t_research_hisbasis` VALUES (37,NULL,NULL,NULL,NULL,'2021-03-02','MA','甲醇',35.00,132.00,48.00,-72.00,-74.00,-49.00);
INSERT INTO `t_research_hisbasis` VALUES (38,NULL,NULL,NULL,NULL,'2021-03-03','MA','甲醇',-10.00,114.00,41.00,-98.00,-96.00,-58.00);
INSERT INTO `t_research_hisbasis` VALUES (39,NULL,NULL,NULL,NULL,'2021-03-04','MA','甲醇',-3.00,147.00,50.00,-65.00,-86.00,-59.00);
INSERT INTO `t_research_hisbasis` VALUES (40,NULL,NULL,NULL,NULL,'2021-03-05','MA','甲醇',10.00,146.00,55.00,-81.00,-100.00,-48.00);
INSERT INTO `t_research_hisbasis` VALUES (41,NULL,NULL,NULL,NULL,'2021-03-08','MA','甲醇',4.00,155.00,26.00,-65.00,-94.00,-76.00);
INSERT INTO `t_research_hisbasis` VALUES (42,NULL,NULL,NULL,NULL,'2021-03-09','MA','甲醇',-31.00,195.00,17.00,-69.00,-188.00,-71.00);
INSERT INTO `t_research_hisbasis` VALUES (43,NULL,NULL,NULL,NULL,'2021-03-10','MA','甲醇',-32.00,183.00,-21.00,-39.00,-99.00,-72.00);
INSERT INTO `t_research_hisbasis` VALUES (44,NULL,NULL,NULL,NULL,'2021-03-11','MA','甲醇',-56.00,119.00,13.00,-30.00,-101.00,-52.00);
INSERT INTO `t_research_hisbasis` VALUES (45,NULL,NULL,NULL,NULL,'2021-03-12','MA','甲醇',-30.00,180.00,56.00,-13.00,-98.00,-54.00);
INSERT INTO `t_research_hisbasis` VALUES (46,NULL,NULL,NULL,NULL,'2021-03-15','MA','甲醇',-36.00,105.00,76.00,-28.00,-75.00,-50.00);
INSERT INTO `t_research_hisbasis` VALUES (47,NULL,NULL,NULL,NULL,'2021-03-16','MA','甲醇',-30.00,102.00,158.00,-33.00,-70.00,-27.00);
INSERT INTO `t_research_hisbasis` VALUES (48,NULL,NULL,NULL,NULL,'2021-03-17','MA','甲醇',-14.00,126.00,111.00,-20.00,-50.00,-34.00);
INSERT INTO `t_research_hisbasis` VALUES (49,NULL,NULL,NULL,NULL,'2021-03-18','MA','甲醇',-21.00,122.00,78.00,-14.00,-46.00,-59.00);
INSERT INTO `t_research_hisbasis` VALUES (50,NULL,NULL,NULL,NULL,'2021-03-19','MA','甲醇',-26.00,132.00,105.00,-6.00,-45.00,-49.00);
INSERT INTO `t_research_hisbasis` VALUES (51,NULL,NULL,NULL,NULL,'2021-03-22','MA','甲醇',-30.00,144.00,91.00,12.00,-28.00,-8.00);
INSERT INTO `t_research_hisbasis` VALUES (52,NULL,NULL,NULL,NULL,'2021-03-23','MA','甲醇',-64.00,112.00,118.00,18.00,-15.00,-19.00);
INSERT INTO `t_research_hisbasis` VALUES (53,NULL,NULL,NULL,NULL,'2021-03-24','MA','甲醇',-58.00,54.00,145.00,9.00,-45.00,-11.00);
INSERT INTO `t_research_hisbasis` VALUES (54,NULL,NULL,NULL,NULL,'2021-03-25','MA','甲醇',-43.00,60.00,138.00,18.00,-48.00,-11.00);
INSERT INTO `t_research_hisbasis` VALUES (55,NULL,NULL,NULL,NULL,'2021-03-26','MA','甲醇',-45.00,98.00,154.00,16.00,-30.00,-9.00);
INSERT INTO `t_research_hisbasis` VALUES (56,NULL,NULL,NULL,NULL,'2021-03-29','MA','甲醇',-24.00,55.00,196.00,7.00,-54.00,-1.00);
INSERT INTO `t_research_hisbasis` VALUES (57,NULL,NULL,NULL,NULL,'2021-03-30','MA','甲醇',-5.00,70.00,202.00,-17.00,-32.00,-10.00);
INSERT INTO `t_research_hisbasis` VALUES (58,NULL,NULL,NULL,NULL,'2021-03-31','MA','甲醇',4.00,74.00,214.00,-10.00,-30.00,-31.00);
INSERT INTO `t_research_hisbasis` VALUES (59,NULL,NULL,NULL,NULL,'2021-04-01','MA','甲醇',-19.00,46.00,187.00,-12.00,-20.00,-7.00);
INSERT INTO `t_research_hisbasis` VALUES (60,NULL,NULL,NULL,NULL,'2021-04-02','MA','甲醇',-9.00,45.00,169.00,-31.00,-28.00,-14.00);
INSERT INTO `t_research_hisbasis` VALUES (61,NULL,NULL,NULL,NULL,'2021-04-06','MA','甲醇',1.00,50.00,176.00,-40.00,-29.00,-24.00);
INSERT INTO `t_research_hisbasis` VALUES (62,NULL,NULL,NULL,NULL,'2021-04-07','MA','甲醇',7.00,120.00,179.00,-35.00,-18.00,-32.00);
INSERT INTO `t_research_hisbasis` VALUES (63,NULL,NULL,NULL,NULL,'2021-04-08','MA','甲醇',0.00,148.00,147.00,-33.00,-12.00,-12.00);
INSERT INTO `t_research_hisbasis` VALUES (64,NULL,NULL,NULL,NULL,'2021-04-09','MA','甲醇',-43.00,169.00,146.00,-47.00,-45.00,-30.00);
INSERT INTO `t_research_hisbasis` VALUES (65,NULL,NULL,NULL,NULL,'2021-04-12','MA','甲醇',-62.00,200.00,130.00,-34.00,-18.00,-24.00);
INSERT INTO `t_research_hisbasis` VALUES (66,NULL,NULL,NULL,NULL,'2021-04-13','MA','甲醇',-38.00,171.00,255.00,-34.00,-112.00,3.00);
INSERT INTO `t_research_hisbasis` VALUES (67,NULL,NULL,NULL,NULL,'2021-04-14','MA','甲醇',-49.00,121.00,279.00,-107.00,-81.00,10.00);
INSERT INTO `t_research_hisbasis` VALUES (68,NULL,NULL,NULL,NULL,'2021-04-15','MA','甲醇',-50.00,147.00,388.00,-103.00,-105.00,-5.00);
INSERT INTO `t_research_hisbasis` VALUES (69,NULL,NULL,NULL,NULL,'2021-04-16','MA','甲醇',-75.00,187.00,411.00,-110.00,-119.00,28.00);
INSERT INTO `t_research_hisbasis` VALUES (70,NULL,NULL,NULL,NULL,'2021-04-19','MA','甲醇',-65.00,174.00,471.00,-108.00,-109.00,23.00);
INSERT INTO `t_research_hisbasis` VALUES (71,NULL,NULL,NULL,NULL,'2021-04-20','MA','甲醇',-71.00,182.00,451.00,-106.00,-93.00,24.00);
INSERT INTO `t_research_hisbasis` VALUES (72,NULL,NULL,NULL,NULL,'2021-04-21','MA','甲醇',-84.00,161.00,327.00,-95.00,-129.00,26.00);
INSERT INTO `t_research_hisbasis` VALUES (73,NULL,NULL,NULL,NULL,'2021-04-22','MA','甲醇',-112.00,165.00,418.00,-108.00,-96.00,54.00);
INSERT INTO `t_research_hisbasis` VALUES (74,NULL,NULL,NULL,NULL,'2021-04-23','MA','甲醇',-100.00,166.00,394.00,-105.00,-107.00,35.00);
INSERT INTO `t_research_hisbasis` VALUES (75,NULL,NULL,NULL,NULL,'2021-04-26','MA','甲醇',-121.00,152.00,450.00,-104.00,-90.00,70.00);
INSERT INTO `t_research_hisbasis` VALUES (76,NULL,NULL,NULL,NULL,'2021-04-27','MA','甲醇',-127.00,121.00,476.00,-123.00,-71.00,47.00);
INSERT INTO `t_research_hisbasis` VALUES (77,NULL,NULL,NULL,NULL,'2021-04-28','MA','甲醇',-134.00,99.00,486.00,-143.00,-83.00,27.00);
INSERT INTO `t_research_hisbasis` VALUES (78,NULL,NULL,NULL,NULL,'2021-04-29','MA','甲醇',-132.00,97.00,452.00,-123.00,-106.00,37.00);
INSERT INTO `t_research_hisbasis` VALUES (79,NULL,NULL,NULL,NULL,'2021-04-30','MA','甲醇',-127.00,63.00,426.00,-137.00,-124.00,12.00);
INSERT INTO `t_research_hisbasis` VALUES (80,NULL,NULL,NULL,NULL,'2021-05-06','MA','甲醇',-113.00,73.00,392.00,-116.00,-104.00,-5.00);
INSERT INTO `t_research_hisbasis` VALUES (81,NULL,NULL,NULL,NULL,'2021-05-07','MA','甲醇',-100.00,133.00,341.00,-110.00,-107.00,-24.00);
INSERT INTO `t_research_hisbasis` VALUES (82,NULL,NULL,NULL,NULL,'2021-05-10','MA','甲醇',-101.00,30.00,342.00,-123.00,-102.00,55.00);
INSERT INTO `t_research_hisbasis` VALUES (83,NULL,NULL,NULL,NULL,'2021-05-11','MA','甲醇',-72.00,52.00,331.00,-123.00,-99.00,77.00);
INSERT INTO `t_research_hisbasis` VALUES (84,NULL,NULL,NULL,NULL,'2021-05-12','MA','甲醇',-57.00,58.00,400.00,-120.00,-120.00,84.00);
INSERT INTO `t_research_hisbasis` VALUES (85,NULL,NULL,NULL,NULL,'2021-05-13','MA','甲醇',-56.00,61.00,408.00,-118.00,-115.00,63.00);
INSERT INTO `t_research_hisbasis` VALUES (86,NULL,NULL,NULL,NULL,'2021-05-14','MA','甲醇',-60.00,48.00,405.00,-128.00,-107.00,49.00);
INSERT INTO `t_research_hisbasis` VALUES (87,NULL,NULL,NULL,NULL,'2021-05-17','MA','甲醇',-54.00,15.00,456.00,-91.00,-109.00,85.00);
INSERT INTO `t_research_hisbasis` VALUES (88,NULL,NULL,NULL,NULL,'2021-05-18','MA','甲醇',-47.00,8.00,454.00,-108.00,-85.00,64.00);
INSERT INTO `t_research_hisbasis` VALUES (89,NULL,NULL,NULL,NULL,'2021-05-19','MA','甲醇',-18.00,-26.00,534.00,-105.00,-122.00,55.00);
INSERT INTO `t_research_hisbasis` VALUES (90,NULL,NULL,NULL,NULL,'2021-05-20','MA','甲醇',-20.00,33.00,464.00,-107.00,-116.00,54.00);
INSERT INTO `t_research_hisbasis` VALUES (91,NULL,NULL,NULL,NULL,'2021-05-21','MA','甲醇',-38.00,-37.00,383.00,-102.00,-136.00,91.00);
INSERT INTO `t_research_hisbasis` VALUES (92,NULL,NULL,NULL,NULL,'2021-05-24','MA','甲醇',-8.00,-44.00,363.00,-110.00,-147.00,111.00);
INSERT INTO `t_research_hisbasis` VALUES (93,NULL,NULL,NULL,NULL,'2021-05-25','MA','甲醇',10.00,0.00,350.00,-110.00,-115.00,113.00);
INSERT INTO `t_research_hisbasis` VALUES (94,NULL,NULL,NULL,NULL,'2021-05-26','MA','甲醇',18.00,0.00,368.00,-97.00,-135.00,101.00);
INSERT INTO `t_research_hisbasis` VALUES (95,NULL,NULL,NULL,NULL,'2021-05-27','MA','甲醇',22.00,-59.00,350.00,-83.00,-147.00,134.00);
INSERT INTO `t_research_hisbasis` VALUES (96,NULL,NULL,NULL,NULL,'2021-05-28','MA','甲醇',28.00,10.00,385.00,-96.00,-189.00,157.00);
INSERT INTO `t_research_hisbasis` VALUES (97,NULL,NULL,NULL,NULL,'2021-05-31','MA','甲醇',13.00,60.00,362.00,-109.00,-219.00,166.00);
INSERT INTO `t_research_hisbasis` VALUES (98,NULL,NULL,NULL,NULL,'2021-06-01','MA','甲醇',-5.00,60.00,352.00,-121.00,-237.00,115.00);
INSERT INTO `t_research_hisbasis` VALUES (99,NULL,NULL,NULL,NULL,'2021-06-02','MA','甲醇',3.00,44.00,307.00,-98.00,-248.00,86.00);
INSERT INTO `t_research_hisbasis` VALUES (100,NULL,NULL,NULL,NULL,'2021-06-03','MA','甲醇',-20.00,66.00,297.00,-107.00,-276.00,140.00);
INSERT INTO `t_research_hisbasis` VALUES (101,NULL,NULL,NULL,NULL,'2021-06-04','MA','甲醇',-11.00,22.00,229.00,-64.00,-267.00,114.00);
INSERT INTO `t_research_hisbasis` VALUES (102,NULL,NULL,NULL,NULL,'2021-06-07','MA','甲醇',-15.00,8.00,232.00,-76.00,-254.00,114.00);
INSERT INTO `t_research_hisbasis` VALUES (103,NULL,NULL,NULL,NULL,'2021-06-08','MA','甲醇',-30.00,9.00,207.00,-75.00,-256.00,134.00);
INSERT INTO `t_research_hisbasis` VALUES (104,NULL,NULL,NULL,NULL,'2021-06-09','MA','甲醇',-29.00,-3.00,164.00,-68.00,-266.00,134.00);
INSERT INTO `t_research_hisbasis` VALUES (105,NULL,NULL,NULL,NULL,'2021-06-10','MA','甲醇',-32.00,-5.00,144.00,-68.00,-266.00,106.00);
INSERT INTO `t_research_hisbasis` VALUES (106,NULL,NULL,NULL,NULL,'2021-06-11','MA','甲醇',-29.00,19.00,161.00,-52.00,-278.00,79.00);
INSERT INTO `t_research_hisbasis` VALUES (107,NULL,NULL,NULL,NULL,'2021-06-14','MA','甲醇',-10.00,36.00,208.00,-49.00,-255.00,58.00);
INSERT INTO `t_research_hisbasis` VALUES (108,NULL,NULL,NULL,NULL,'2021-06-15','MA','甲醇',-10.00,17.00,228.00,-45.00,-233.00,66.00);
INSERT INTO `t_research_hisbasis` VALUES (109,NULL,NULL,NULL,NULL,'2021-06-16','MA','甲醇',-5.00,24.00,210.00,-34.00,-231.00,80.00);
INSERT INTO `t_research_hisbasis` VALUES (110,NULL,NULL,NULL,NULL,'2021-06-17','MA','甲醇',-10.00,-23.00,202.00,-52.00,-231.00,17.00);
INSERT INTO `t_research_hisbasis` VALUES (111,NULL,NULL,NULL,NULL,'2021-06-18','MA','甲醇',-6.00,54.00,235.00,-64.00,-208.00,34.00);
INSERT INTO `t_research_hisbasis` VALUES (112,NULL,NULL,NULL,NULL,'2021-06-21','MA','甲醇',-21.00,55.00,219.00,-51.00,-193.00,38.00);
INSERT INTO `t_research_hisbasis` VALUES (113,NULL,NULL,NULL,NULL,'2021-06-22','MA','甲醇',-32.00,57.00,157.00,-79.00,-178.00,31.00);
INSERT INTO `t_research_hisbasis` VALUES (114,NULL,NULL,NULL,NULL,'2021-06-23','MA','甲醇',-31.00,64.00,165.00,-50.00,-174.00,-9.00);
INSERT INTO `t_research_hisbasis` VALUES (115,NULL,NULL,NULL,NULL,'2021-06-24','MA','甲醇',-43.00,69.00,149.00,-70.00,-163.00,-2.00);
INSERT INTO `t_research_hisbasis` VALUES (116,NULL,NULL,NULL,NULL,'2021-06-25','MA','甲醇',-25.00,77.00,164.00,-47.00,-172.00,-9.00);
INSERT INTO `t_research_hisbasis` VALUES (117,NULL,NULL,NULL,NULL,'2021-06-28','MA','甲醇',-24.00,26.00,134.00,-83.00,-193.00,-14.00);
INSERT INTO `t_research_hisbasis` VALUES (118,NULL,NULL,NULL,NULL,'2021-06-29','MA','甲醇',-68.00,-2.00,94.00,-73.00,-194.00,-33.00);
INSERT INTO `t_research_hisbasis` VALUES (119,NULL,NULL,NULL,NULL,'2021-06-30','MA','甲醇',-89.00,-28.00,76.00,-50.00,-204.00,-25.00);
INSERT INTO `t_research_hisbasis` VALUES (120,NULL,NULL,NULL,NULL,'2021-07-01','MA','甲醇',-93.00,-35.00,100.00,-57.00,-231.00,-33.00);
INSERT INTO `t_research_hisbasis` VALUES (121,NULL,NULL,NULL,NULL,'2021-07-02','MA','甲醇',-93.00,-1.00,141.00,-65.00,-244.00,-43.00);
INSERT INTO `t_research_hisbasis` VALUES (122,NULL,NULL,NULL,NULL,'2021-07-05','MA','甲醇',-76.00,-31.00,147.00,-76.00,-219.00,-44.00);
INSERT INTO `t_research_hisbasis` VALUES (123,NULL,NULL,NULL,NULL,'2021-07-06','MA','甲醇',-79.00,-57.00,122.00,-66.00,-207.00,-33.00);
INSERT INTO `t_research_hisbasis` VALUES (124,NULL,NULL,NULL,NULL,'2021-07-07','MA','甲醇',-55.00,-64.00,171.00,-72.00,-212.00,-19.00);
INSERT INTO `t_research_hisbasis` VALUES (125,NULL,NULL,NULL,NULL,'2021-07-08','MA','甲醇',-62.00,-14.00,158.00,-73.00,-196.00,-15.00);
INSERT INTO `t_research_hisbasis` VALUES (126,NULL,NULL,NULL,NULL,'2021-07-09','MA','甲醇',-43.00,-38.00,136.00,-46.00,-199.00,-39.00);
INSERT INTO `t_research_hisbasis` VALUES (127,NULL,NULL,NULL,NULL,'2021-07-12','MA','甲醇',-27.00,-46.00,92.00,-47.00,-197.00,-44.00);
INSERT INTO `t_research_hisbasis` VALUES (128,NULL,NULL,NULL,NULL,'2021-07-13','MA','甲醇',-37.00,-12.00,88.00,-46.00,-182.00,-49.00);
INSERT INTO `t_research_hisbasis` VALUES (129,NULL,NULL,NULL,NULL,'2021-07-14','MA','甲醇',-68.00,-43.00,79.00,-43.00,-178.00,-50.00);
INSERT INTO `t_research_hisbasis` VALUES (130,NULL,NULL,NULL,NULL,'2021-07-15','MA','甲醇',-65.00,-49.00,56.00,-55.00,-176.00,-43.00);
INSERT INTO `t_research_hisbasis` VALUES (131,NULL,NULL,NULL,NULL,'2021-07-16','MA','甲醇',-54.00,-78.00,72.00,-41.00,-162.00,-46.00);
INSERT INTO `t_research_hisbasis` VALUES (132,NULL,NULL,NULL,NULL,'2021-07-19','MA','甲醇',-44.00,-43.00,78.00,-48.00,-150.00,-38.00);
INSERT INTO `t_research_hisbasis` VALUES (133,NULL,NULL,NULL,NULL,'2021-07-20','MA','甲醇',-21.00,-90.00,72.00,-53.00,-141.00,-52.00);
INSERT INTO `t_research_hisbasis` VALUES (134,NULL,NULL,NULL,NULL,'2021-07-21','MA','甲醇',-27.00,-14.00,62.00,-67.00,-139.00,-36.00);
INSERT INTO `t_research_hisbasis` VALUES (135,NULL,NULL,NULL,NULL,'2021-07-22','MA','甲醇',-29.00,-12.00,57.00,-73.00,-149.00,-52.00);
INSERT INTO `t_research_hisbasis` VALUES (136,NULL,NULL,NULL,NULL,'2021-07-23','MA','甲醇',-31.00,-47.00,42.00,-51.00,-125.00,-50.00);
INSERT INTO `t_research_hisbasis` VALUES (137,NULL,NULL,NULL,NULL,'2021-07-26','MA','甲醇',-8.00,-8.00,13.00,-58.00,-128.00,-48.00);
INSERT INTO `t_research_hisbasis` VALUES (138,NULL,NULL,NULL,NULL,'2021-07-27','MA','甲醇',-9.00,-31.00,32.00,-64.00,-133.00,-47.00);
INSERT INTO `t_research_hisbasis` VALUES (139,NULL,NULL,NULL,NULL,'2021-07-28','MA','甲醇',-19.00,-16.00,21.00,-52.00,-139.00,-41.00);
INSERT INTO `t_research_hisbasis` VALUES (140,NULL,NULL,NULL,NULL,'2021-07-29','MA','甲醇',-14.00,-27.00,-9.00,-53.00,-121.00,-62.00);
INSERT INTO `t_research_hisbasis` VALUES (141,NULL,NULL,NULL,NULL,'2021-07-30','MA','甲醇',-22.00,-61.00,-9.00,-50.00,-112.00,-77.00);
INSERT INTO `t_research_hisbasis` VALUES (142,NULL,NULL,NULL,NULL,'2021-08-02','MA','甲醇',-41.00,-41.00,-8.00,-57.00,-100.00,-73.00);
INSERT INTO `t_research_hisbasis` VALUES (143,NULL,NULL,NULL,NULL,'2021-08-03','MA','甲醇',-53.00,-27.00,-2.00,-59.00,-92.00,-30.00);
INSERT INTO `t_research_hisbasis` VALUES (144,NULL,NULL,NULL,NULL,'2021-08-04','MA','甲醇',-52.00,-46.00,17.00,-80.00,-90.00,-28.00);
INSERT INTO `t_research_hisbasis` VALUES (145,NULL,NULL,NULL,NULL,'2021-08-05','MA','甲醇',-46.00,-138.00,15.00,-41.00,-88.00,-20.00);
INSERT INTO `t_research_hisbasis` VALUES (146,NULL,NULL,NULL,NULL,'2021-08-06','MA','甲醇',-50.00,-184.00,28.00,-45.00,-77.00,-25.00);
INSERT INTO `t_research_hisbasis` VALUES (147,NULL,NULL,NULL,NULL,'2021-08-09','MA','甲醇',-55.00,-193.00,28.00,-33.00,-68.00,-16.00);
INSERT INTO `t_research_hisbasis` VALUES (148,NULL,NULL,NULL,NULL,'2021-08-10','MA','甲醇',-165.00,-167.00,-91.00,-56.00,-47.00,-5.00);
INSERT INTO `t_research_hisbasis` VALUES (149,NULL,NULL,NULL,NULL,'2021-08-11','MA','甲醇',-176.00,-134.00,-153.00,-53.00,-58.00,-10.00);
INSERT INTO `t_research_hisbasis` VALUES (150,NULL,NULL,NULL,NULL,'2021-08-12','MA','甲醇',-172.00,-141.00,-148.00,-47.00,-64.00,-30.00);
INSERT INTO `t_research_hisbasis` VALUES (151,NULL,NULL,NULL,NULL,'2021-08-13','MA','甲醇',-181.00,-107.00,-144.00,-57.00,-59.00,-183.00);
INSERT INTO `t_research_hisbasis` VALUES (152,NULL,NULL,NULL,NULL,'2021-08-16','MA','甲醇',-187.00,-125.00,-166.00,-50.00,-229.00,-171.00);
INSERT INTO `t_research_hisbasis` VALUES (153,NULL,NULL,NULL,NULL,'2021-08-17','MA','甲醇',-185.00,-190.00,-168.00,-140.00,-239.00,-174.00);
INSERT INTO `t_research_hisbasis` VALUES (154,NULL,NULL,NULL,NULL,'2021-08-18','MA','甲醇',-177.00,-158.00,-136.00,-144.00,-250.00,-154.00);
INSERT INTO `t_research_hisbasis` VALUES (155,NULL,NULL,NULL,NULL,'2021-08-19','MA','甲醇',-168.00,-165.00,-160.00,-145.00,-234.00,-137.00);
INSERT INTO `t_research_hisbasis` VALUES (156,NULL,NULL,NULL,NULL,'2021-08-20','MA','甲醇',-166.00,-131.00,-175.00,-138.00,-236.00,-161.00);
INSERT INTO `t_research_hisbasis` VALUES (157,NULL,NULL,NULL,NULL,'2021-08-23','MA','甲醇',-128.00,-153.00,-207.00,-124.00,-236.00,-195.00);
INSERT INTO `t_research_hisbasis` VALUES (158,NULL,NULL,NULL,NULL,'2021-08-24','MA','甲醇',-108.00,-136.00,-214.00,-124.00,-237.00,-155.00);
INSERT INTO `t_research_hisbasis` VALUES (159,NULL,NULL,NULL,NULL,'2021-08-25','MA','甲醇',-106.00,-137.00,-121.00,-132.00,-237.00,-174.00);
INSERT INTO `t_research_hisbasis` VALUES (160,NULL,NULL,NULL,NULL,'2021-08-26','MA','甲醇',-111.00,-142.00,-101.00,-141.00,-234.00,-129.00);
INSERT INTO `t_research_hisbasis` VALUES (161,NULL,NULL,NULL,NULL,'2021-08-27','MA','甲醇',-108.00,-92.00,-112.00,-123.00,-232.00,-136.00);
INSERT INTO `t_research_hisbasis` VALUES (162,NULL,NULL,NULL,NULL,'2021-08-30','MA','甲醇',-94.00,-102.00,-85.00,-150.00,-193.00,-124.00);
INSERT INTO `t_research_hisbasis` VALUES (163,NULL,NULL,NULL,NULL,'2021-08-31','MA','甲醇',-86.00,-87.00,-63.00,-150.00,-190.00,-134.00);
INSERT INTO `t_research_hisbasis` VALUES (164,NULL,NULL,NULL,NULL,'2021-09-01','MA','甲醇',-102.00,-123.00,-86.00,-137.00,-180.00,-133.00);
INSERT INTO `t_research_hisbasis` VALUES (165,NULL,NULL,NULL,NULL,'2021-09-02','MA','甲醇',-100.00,-150.00,-43.00,-152.00,-175.00,-117.00);
INSERT INTO `t_research_hisbasis` VALUES (166,NULL,NULL,NULL,NULL,'2021-09-03','MA','甲醇',-113.00,-20.00,-4.00,-145.00,-150.00,-125.00);
INSERT INTO `t_research_hisbasis` VALUES (167,NULL,NULL,NULL,NULL,'2021-09-06','MA','甲醇',-129.00,-95.00,5.00,-165.00,-160.00,-73.00);
INSERT INTO `t_research_hisbasis` VALUES (168,NULL,NULL,NULL,NULL,'2021-09-07','MA','甲醇',-154.00,-39.00,12.00,-139.00,-144.00,-119.00);
INSERT INTO `t_research_hisbasis` VALUES (169,NULL,NULL,NULL,NULL,'2021-09-08','MA','甲醇',-141.00,-33.00,4.00,-159.00,-154.00,-112.00);
INSERT INTO `t_research_hisbasis` VALUES (170,NULL,NULL,NULL,NULL,'2021-09-09','MA','甲醇',-146.00,3.00,4.00,-151.00,-154.00,-141.00);
INSERT INTO `t_research_hisbasis` VALUES (171,NULL,NULL,NULL,NULL,'2021-09-10','MA','甲醇',-148.00,-80.00,-10.00,-148.00,-128.00,-138.00);
INSERT INTO `t_research_hisbasis` VALUES (172,NULL,NULL,NULL,NULL,'2021-09-13','MA','甲醇',-140.00,-37.00,-14.00,-144.00,-132.00,-131.00);
INSERT INTO `t_research_hisbasis` VALUES (173,NULL,NULL,NULL,NULL,'2021-09-14','MA','甲醇',-130.00,-22.00,9.00,-161.00,-143.00,-35.00);
INSERT INTO `t_research_hisbasis` VALUES (174,NULL,NULL,NULL,NULL,'2021-09-15','MA','甲醇',-126.00,3.00,39.00,-162.00,-150.00,-125.00);
INSERT INTO `t_research_hisbasis` VALUES (175,NULL,NULL,NULL,NULL,'2021-09-16','MA','甲醇',-130.00,-1.00,42.00,-175.00,-144.00,-138.00);
INSERT INTO `t_research_hisbasis` VALUES (176,NULL,NULL,NULL,NULL,'2021-09-17','MA','甲醇',-134.00,-30.00,26.00,-146.00,-145.00,-110.00);
INSERT INTO `t_research_hisbasis` VALUES (177,NULL,NULL,NULL,NULL,'2021-09-20','MA','甲醇',-131.00,-29.00,35.00,-150.00,-139.00,-51.00);
INSERT INTO `t_research_hisbasis` VALUES (178,NULL,NULL,NULL,NULL,'2021-09-21','MA','甲醇',-125.00,59.00,30.00,-132.00,-142.00,-125.00);
INSERT INTO `t_research_hisbasis` VALUES (179,NULL,NULL,NULL,NULL,'2021-09-22','MA','甲醇',-122.00,42.00,39.00,-139.00,-152.00,-56.00);
INSERT INTO `t_research_hisbasis` VALUES (180,NULL,NULL,NULL,NULL,'2021-09-23','MA','甲醇',-114.00,43.00,38.00,-147.00,-122.00,-14.00);
INSERT INTO `t_research_hisbasis` VALUES (181,NULL,NULL,NULL,NULL,'2021-09-24','MA','甲醇',-106.00,-37.00,18.00,-154.00,-153.00,-110.00);
INSERT INTO `t_research_hisbasis` VALUES (182,NULL,NULL,NULL,NULL,'2021-09-27','MA','甲醇',-108.00,23.00,35.00,-140.00,-161.00,16.00);
INSERT INTO `t_research_hisbasis` VALUES (183,NULL,NULL,NULL,NULL,'2021-09-28','MA','甲醇',-101.00,57.00,56.00,-97.00,-138.00,-110.00);
INSERT INTO `t_research_hisbasis` VALUES (184,NULL,NULL,NULL,NULL,'2021-09-29','MA','甲醇',-99.00,-26.00,91.00,-99.00,-127.00,-110.00);
INSERT INTO `t_research_hisbasis` VALUES (185,NULL,NULL,NULL,NULL,'2021-09-30','MA','甲醇',-71.00,50.00,79.00,-103.00,-119.00,-110.00);
INSERT INTO `t_research_hisbasis` VALUES (186,NULL,NULL,NULL,NULL,'2021-10-08','MA','甲醇',-132.00,70.00,67.00,-114.00,-116.00,-65.00);
INSERT INTO `t_research_hisbasis` VALUES (187,NULL,NULL,NULL,NULL,'2021-10-11','MA','甲醇',-55.00,103.00,88.00,-113.00,-127.00,184.00);
INSERT INTO `t_research_hisbasis` VALUES (188,NULL,NULL,NULL,NULL,'2021-10-12','MA','甲醇',-74.00,118.00,48.00,-100.00,-118.00,7.00);
INSERT INTO `t_research_hisbasis` VALUES (189,NULL,NULL,NULL,NULL,'2021-10-13','MA','甲醇',-70.00,43.00,43.00,-117.00,-130.00,-81.00);
INSERT INTO `t_research_hisbasis` VALUES (190,NULL,NULL,NULL,NULL,'2021-10-14','MA','甲醇',-70.00,103.00,16.00,-131.00,-145.00,45.00);
INSERT INTO `t_research_hisbasis` VALUES (191,NULL,NULL,NULL,NULL,'2021-10-15','MA','甲醇',-67.00,76.00,60.00,-113.00,-118.00,32.00);
INSERT INTO `t_research_hisbasis` VALUES (192,NULL,NULL,NULL,NULL,'2021-10-18','MA','甲醇',-50.00,59.00,67.00,-111.00,-134.00,84.00);
INSERT INTO `t_research_hisbasis` VALUES (193,NULL,NULL,NULL,NULL,'2021-10-19','MA','甲醇',-58.00,119.00,56.00,-114.00,-131.00,-29.00);
INSERT INTO `t_research_hisbasis` VALUES (194,NULL,NULL,NULL,NULL,'2021-10-20','MA','甲醇',-52.00,57.00,100.00,-91.00,-131.00,-213.00);
INSERT INTO `t_research_hisbasis` VALUES (195,NULL,NULL,NULL,NULL,'2021-10-21','MA','甲醇',-49.00,44.00,89.00,-105.00,-123.00,-129.00);
INSERT INTO `t_research_hisbasis` VALUES (196,NULL,NULL,NULL,NULL,'2021-10-22','MA','甲醇',-110.00,58.00,86.00,-89.00,-110.00,-66.00);
INSERT INTO `t_research_hisbasis` VALUES (197,NULL,NULL,NULL,NULL,'2021-10-25','MA','甲醇',-86.00,99.00,59.00,-108.00,-110.00,-52.00);
INSERT INTO `t_research_hisbasis` VALUES (198,NULL,NULL,NULL,NULL,'2021-10-26','MA','甲醇',-73.00,79.00,96.00,-90.00,-114.00,-7.00);
INSERT INTO `t_research_hisbasis` VALUES (199,NULL,NULL,NULL,NULL,'2021-10-27','MA','甲醇',-64.00,92.00,-6.00,-85.00,-107.00,-215.00);
INSERT INTO `t_research_hisbasis` VALUES (200,NULL,NULL,NULL,NULL,'2021-10-28','MA','甲醇',-38.00,121.00,97.00,-98.00,-102.00,38.00);
INSERT INTO `t_research_hisbasis` VALUES (201,NULL,NULL,NULL,NULL,'2021-10-29','MA','甲醇',-62.00,115.00,138.00,-91.00,-106.00,25.00);
INSERT INTO `t_research_hisbasis` VALUES (202,NULL,NULL,NULL,NULL,'2021-11-01','MA','甲醇',-74.00,83.00,79.00,-92.00,-103.00,-28.00);
INSERT INTO `t_research_hisbasis` VALUES (203,NULL,NULL,NULL,NULL,'2021-11-02','MA','甲醇',-44.00,82.00,134.00,-77.00,-99.00,0.00);
INSERT INTO `t_research_hisbasis` VALUES (204,NULL,NULL,NULL,NULL,'2021-11-03','MA','甲醇',-88.00,65.00,160.00,-68.00,-87.00,104.00);
INSERT INTO `t_research_hisbasis` VALUES (205,NULL,NULL,NULL,NULL,'2021-11-04','MA','甲醇',-70.00,29.00,109.00,-89.00,-84.00,53.00);
INSERT INTO `t_research_hisbasis` VALUES (206,NULL,NULL,NULL,NULL,'2021-11-05','MA','甲醇',-39.00,76.00,87.00,-83.00,-68.00,1.00);
INSERT INTO `t_research_hisbasis` VALUES (207,NULL,NULL,NULL,NULL,'2021-11-08','MA','甲醇',-93.00,68.00,90.00,-84.00,-73.00,58.00);
INSERT INTO `t_research_hisbasis` VALUES (208,NULL,NULL,NULL,NULL,'2021-11-09','MA','甲醇',-32.00,59.00,86.00,-86.00,-68.00,66.00);
INSERT INTO `t_research_hisbasis` VALUES (209,NULL,NULL,NULL,NULL,'2021-11-10','MA','甲醇',-109.00,117.00,84.00,-64.00,-81.00,153.00);
INSERT INTO `t_research_hisbasis` VALUES (210,NULL,NULL,NULL,NULL,'2021-11-11','MA','甲醇',33.00,90.00,74.00,-63.00,-101.00,163.00);
INSERT INTO `t_research_hisbasis` VALUES (211,NULL,NULL,NULL,NULL,'2021-11-12','MA','甲醇',6.00,88.00,5.00,-57.00,-77.00,60.00);
INSERT INTO `t_research_hisbasis` VALUES (212,NULL,NULL,NULL,NULL,'2021-11-15','MA','甲醇',-34.00,69.00,-13.00,-51.00,-72.00,106.00);
INSERT INTO `t_research_hisbasis` VALUES (213,NULL,NULL,NULL,NULL,'2021-11-16','MA','甲醇',-65.00,108.00,-22.00,-56.00,-74.00,123.00);
INSERT INTO `t_research_hisbasis` VALUES (214,NULL,NULL,NULL,NULL,'2021-11-17','MA','甲醇',-34.00,97.00,8.00,-57.00,-69.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (215,NULL,NULL,NULL,NULL,'2021-11-18','MA','甲醇',-101.00,72.00,24.00,-32.00,-82.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (216,NULL,NULL,NULL,NULL,'2021-11-19','MA','甲醇',-94.00,73.00,2.00,-24.00,-67.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (217,NULL,NULL,NULL,NULL,'2021-11-22','MA','甲醇',-30.00,89.00,38.00,-47.00,-69.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (218,NULL,NULL,NULL,NULL,'2021-11-23','MA','甲醇',12.00,195.00,-21.00,-46.00,-92.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (219,NULL,NULL,NULL,NULL,'2021-11-24','MA','甲醇',11.00,203.00,-32.00,-56.00,-61.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (220,NULL,NULL,NULL,NULL,'2021-11-25','MA','甲醇',-6.00,208.00,-14.00,-41.00,-64.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (221,NULL,NULL,NULL,NULL,'2021-11-26','MA','甲醇',10.00,246.00,8.00,-46.00,-48.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (222,NULL,NULL,NULL,NULL,'2021-11-29','MA','甲醇',55.00,222.00,30.00,-40.00,-55.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (223,NULL,NULL,NULL,NULL,'2021-11-30','MA','甲醇',-10.00,222.00,-30.00,-36.00,-60.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (224,NULL,NULL,NULL,NULL,'2021-12-01','MA','甲醇',-13.00,260.00,-30.00,-28.00,-41.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (225,NULL,NULL,NULL,NULL,'2021-12-02','MA','甲醇',-92.00,272.00,-14.00,-48.00,-22.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (226,NULL,NULL,NULL,NULL,'2021-12-03','MA','甲醇',-82.00,322.00,-24.00,-21.00,-15.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (227,NULL,NULL,NULL,NULL,'2021-12-06','MA','甲醇',-101.00,344.00,-11.00,-30.00,3.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (228,NULL,NULL,NULL,NULL,'2021-12-07','MA','甲醇',21.00,381.00,-11.00,-36.00,-21.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (229,NULL,NULL,NULL,NULL,'2021-12-08','MA','甲醇',87.00,325.00,-34.00,-30.00,-11.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (230,NULL,NULL,NULL,NULL,'2021-12-09','MA','甲醇',37.00,545.00,-74.00,-36.00,-104.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (231,NULL,NULL,NULL,NULL,'2021-12-10','MA','甲醇',111.00,564.00,-73.00,-38.00,-106.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (232,NULL,NULL,NULL,NULL,'2021-12-13','MA','甲醇',25.00,556.00,-51.00,-119.00,-73.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (233,NULL,NULL,NULL,NULL,'2021-12-14','MA','甲醇',59.00,721.00,-61.00,-126.00,-42.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (234,NULL,NULL,NULL,NULL,'2021-12-15','MA','甲醇',129.00,790.00,-59.00,-124.00,-35.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (235,NULL,NULL,NULL,NULL,'2021-12-16','MA','甲醇',292.00,704.00,-92.00,-136.00,-12.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (236,NULL,NULL,NULL,NULL,'2021-12-17','MA','甲醇',362.00,692.00,-76.00,-121.00,-8.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (237,NULL,NULL,NULL,NULL,'2021-12-20','MA','甲醇',167.00,657.00,-81.00,-118.00,11.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (238,NULL,NULL,NULL,NULL,'2021-12-21','MA','甲醇',290.00,731.00,-108.00,-125.00,42.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (239,NULL,NULL,NULL,NULL,'2021-12-22','MA','甲醇',417.00,678.00,-87.00,-118.00,-15.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (240,NULL,NULL,NULL,NULL,'2021-12-23','MA','甲醇',390.00,722.00,-83.00,-107.00,-29.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (241,NULL,NULL,NULL,NULL,'2021-12-24','MA','甲醇',347.00,657.00,-76.00,-77.00,5.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (242,NULL,NULL,NULL,NULL,'2021-12-27','MA','甲醇',257.00,568.00,-62.00,-67.00,28.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (243,NULL,NULL,NULL,NULL,'2021-12-28','MA','甲醇',254.00,435.00,-114.00,-45.00,30.00,NULL);
INSERT INTO `t_research_hisbasis` VALUES (244,NULL,NULL,NULL,NULL,'2021-12-29','MA','甲醇',333.00,373.00,NULL,-48.00,NULL,NULL);
INSERT INTO `t_research_hisbasis` VALUES (245,NULL,NULL,NULL,NULL,'2021-12-30','MA','甲醇',NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `t_research_hisbasis` VALUES (246,NULL,NULL,NULL,NULL,'2021-12-31','MA','甲醇',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `t_research_hisbasis` ENABLE KEYS */;

--
-- Table structure for table `t_research_interspread`
--

DROP TABLE IF EXISTS `t_research_interspread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_research_interspread` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `business_date` varchar(16) DEFAULT NULL COMMENT '业务日期',
  `contract_code` varchar(16) DEFAULT NULL COMMENT '合约代码',
  `contract_name` varchar(16) DEFAULT NULL COMMENT '合约名称',
  `m_1701_1705` decimal(10,2) DEFAULT NULL COMMENT '1701-1705',
  `m_1801_1805` decimal(10,2) DEFAULT NULL COMMENT '1801-1805',
  `m_1901_1905` decimal(10,2) DEFAULT NULL COMMENT '1901-1905',
  `m_2001_2005` decimal(10,2) DEFAULT NULL COMMENT '2001-2005',
  `m_2101_2105` decimal(10,2) DEFAULT NULL COMMENT '2101-2105',
  `m_2201_2205` decimal(10,2) DEFAULT NULL COMMENT '2201-2205',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2348 DEFAULT CHARSET=utf8 COMMENT='跨期价差表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_research_interspread`
--

/*!40000 ALTER TABLE `t_research_interspread` DISABLE KEYS */;
INSERT INTO `t_research_interspread` VALUES (1,NULL,NULL,NULL,NULL,'2021-06-01','MA','甲醇',-14.00,1.00,143.00,60.00,-56.00,33.00);
INSERT INTO `t_research_interspread` VALUES (2,NULL,NULL,NULL,NULL,'2021-06-02','MA','甲醇',-16.00,-12.00,152.00,48.00,-56.00,33.00);
INSERT INTO `t_research_interspread` VALUES (3,NULL,NULL,NULL,NULL,'2021-06-03','MA','甲醇',-17.00,0.00,148.00,44.00,-63.00,22.00);
INSERT INTO `t_research_interspread` VALUES (4,NULL,NULL,NULL,NULL,'2021-06-04','MA','甲醇',-12.00,1.00,144.00,39.00,-56.00,15.00);
INSERT INTO `t_research_interspread` VALUES (5,NULL,NULL,NULL,NULL,'2021-06-07','MA','甲醇',-13.00,-3.00,153.00,41.00,-62.00,23.00);
INSERT INTO `t_research_interspread` VALUES (6,NULL,NULL,NULL,NULL,'2021-06-08','MA','甲醇',-16.00,-5.00,161.00,41.00,-61.00,28.00);
INSERT INTO `t_research_interspread` VALUES (7,NULL,NULL,NULL,NULL,'2021-06-09','MA','甲醇',-17.00,1.00,159.00,49.00,-62.00,21.00);
INSERT INTO `t_research_interspread` VALUES (8,NULL,NULL,NULL,NULL,'2021-06-10','MA','甲醇',-20.00,4.00,163.00,58.00,-64.00,19.00);
INSERT INTO `t_research_interspread` VALUES (9,NULL,NULL,NULL,NULL,'2021-06-11','MA','甲醇',-19.00,2.00,163.00,52.00,-60.00,22.00);
INSERT INTO `t_research_interspread` VALUES (10,NULL,NULL,NULL,NULL,'2021-06-15','MA','甲醇',-17.00,-5.00,163.00,55.00,-65.00,18.00);
INSERT INTO `t_research_interspread` VALUES (11,NULL,NULL,NULL,NULL,'2021-06-16','MA','甲醇',-18.00,1.00,169.00,55.00,-67.00,34.00);
INSERT INTO `t_research_interspread` VALUES (12,NULL,NULL,NULL,NULL,'2021-06-17','MA','甲醇',-21.00,-1.00,168.00,54.00,-69.00,27.00);
INSERT INTO `t_research_interspread` VALUES (13,NULL,NULL,NULL,NULL,'2021-06-18','MA','甲醇',-28.00,-1.00,165.00,47.00,-68.00,27.00);
INSERT INTO `t_research_interspread` VALUES (14,NULL,NULL,NULL,NULL,'2021-06-21','MA','甲醇',-23.00,0.00,163.00,60.00,-67.00,29.00);
INSERT INTO `t_research_interspread` VALUES (15,NULL,NULL,NULL,NULL,'2021-06-22','MA','甲醇',-22.00,3.00,153.00,58.00,-65.00,19.00);
INSERT INTO `t_research_interspread` VALUES (16,NULL,NULL,NULL,NULL,'2021-06-23','MA','甲醇',-26.00,12.00,154.00,64.00,-59.00,32.00);
INSERT INTO `t_research_interspread` VALUES (17,NULL,NULL,NULL,NULL,'2021-06-24','MA','甲醇',-23.00,4.00,145.00,55.00,-53.00,32.00);
INSERT INTO `t_research_interspread` VALUES (18,NULL,NULL,NULL,NULL,'2021-06-25','MA','甲醇',-24.00,2.00,153.00,61.00,-53.00,28.00);
INSERT INTO `t_research_interspread` VALUES (19,NULL,NULL,NULL,NULL,'2021-06-28','MA','甲醇',-19.00,0.00,155.00,61.00,-48.00,27.00);
INSERT INTO `t_research_interspread` VALUES (20,NULL,NULL,NULL,NULL,'2021-06-29','MA','甲醇',5.00,-4.00,161.00,69.00,-43.00,17.00);
INSERT INTO `t_research_interspread` VALUES (21,NULL,NULL,NULL,NULL,'2021-06-30','MA','甲醇',-23.00,-3.00,164.00,76.00,-44.00,20.00);
INSERT INTO `t_research_interspread` VALUES (22,NULL,NULL,NULL,NULL,'2021-07-01','MA','甲醇',-14.00,-1.00,169.00,79.00,-44.00,19.00);
INSERT INTO `t_research_interspread` VALUES (23,NULL,NULL,NULL,NULL,'2021-07-02','MA','甲醇',-27.00,-3.00,168.00,87.00,-41.00,21.00);
INSERT INTO `t_research_interspread` VALUES (24,NULL,NULL,NULL,NULL,'2021-07-05','MA','甲醇',-26.00,-7.00,175.00,86.00,-43.00,25.00);
INSERT INTO `t_research_interspread` VALUES (25,NULL,NULL,NULL,NULL,'2021-07-06','MA','甲醇',-26.00,-3.00,185.00,88.00,-47.00,29.00);
INSERT INTO `t_research_interspread` VALUES (26,NULL,NULL,NULL,NULL,'2021-07-07','MA','甲醇',-21.00,2.00,181.00,92.00,-39.00,15.00);
INSERT INTO `t_research_interspread` VALUES (27,NULL,NULL,NULL,NULL,'2021-07-08','MA','甲醇',-38.00,1.00,179.00,82.00,-39.00,19.00);
INSERT INTO `t_research_interspread` VALUES (28,NULL,NULL,NULL,NULL,'2021-07-09','MA','甲醇',-40.00,4.00,182.00,85.00,-40.00,21.00);
INSERT INTO `t_research_interspread` VALUES (29,NULL,NULL,NULL,NULL,'2021-07-12','MA','甲醇',-40.00,-1.00,185.00,83.00,-42.00,23.00);
INSERT INTO `t_research_interspread` VALUES (30,NULL,NULL,NULL,NULL,'2021-07-13','MA','甲醇',-37.00,4.00,187.00,89.00,-45.00,21.00);
INSERT INTO `t_research_interspread` VALUES (31,NULL,NULL,NULL,NULL,'2021-07-14','MA','甲醇',-35.00,4.00,183.00,79.00,-42.00,30.00);
INSERT INTO `t_research_interspread` VALUES (32,NULL,NULL,NULL,NULL,'2021-07-15','MA','甲醇',-39.00,7.00,183.00,72.00,-41.00,25.00);
INSERT INTO `t_research_interspread` VALUES (33,NULL,NULL,NULL,NULL,'2021-07-16','MA','甲醇',-37.00,8.00,183.00,67.00,-45.00,49.00);
INSERT INTO `t_research_interspread` VALUES (34,NULL,NULL,NULL,NULL,'2021-07-19','MA','甲醇',-43.00,15.00,191.00,63.00,-51.00,73.00);
INSERT INTO `t_research_interspread` VALUES (35,NULL,NULL,NULL,NULL,'2021-07-20','MA','甲醇',-46.00,21.00,192.00,70.00,-55.00,68.00);
INSERT INTO `t_research_interspread` VALUES (36,NULL,NULL,NULL,NULL,'2021-07-21','MA','甲醇',-40.00,24.00,198.00,54.00,-55.00,69.00);
INSERT INTO `t_research_interspread` VALUES (37,NULL,NULL,NULL,NULL,'2021-07-22','MA','甲醇',-47.00,11.00,198.00,46.00,-70.00,72.00);
INSERT INTO `t_research_interspread` VALUES (38,NULL,NULL,NULL,NULL,'2021-07-23','MA','甲醇',-45.00,13.00,196.00,33.00,-74.00,65.00);
INSERT INTO `t_research_interspread` VALUES (39,NULL,NULL,NULL,NULL,'2021-07-26','MA','甲醇',-37.00,12.00,185.00,-10.00,-70.00,68.00);
INSERT INTO `t_research_interspread` VALUES (40,NULL,NULL,NULL,NULL,'2021-07-27','MA','甲醇',-38.00,8.00,176.00,-13.00,-71.00,69.00);
INSERT INTO `t_research_interspread` VALUES (41,NULL,NULL,NULL,NULL,'2021-07-28','MA','甲醇',-39.00,5.00,185.00,-7.00,-71.00,64.00);
INSERT INTO `t_research_interspread` VALUES (42,NULL,NULL,NULL,NULL,'2021-07-29','MA','甲醇',-48.00,1.00,179.00,9.00,-68.00,67.00);
INSERT INTO `t_research_interspread` VALUES (43,NULL,NULL,NULL,NULL,'2021-07-30','MA','甲醇',-45.00,0.00,179.00,13.00,-74.00,75.00);
INSERT INTO `t_research_interspread` VALUES (44,NULL,NULL,NULL,NULL,'2021-08-02','MA','甲醇',-47.00,6.00,178.00,21.00,-79.00,86.00);
INSERT INTO `t_research_interspread` VALUES (45,NULL,NULL,NULL,NULL,'2021-08-03','MA','甲醇',-53.00,2.00,174.00,11.00,-84.00,83.00);
INSERT INTO `t_research_interspread` VALUES (46,NULL,NULL,NULL,NULL,'2021-08-04','MA','甲醇',-50.00,7.00,255.00,6.00,-84.00,83.00);
INSERT INTO `t_research_interspread` VALUES (47,NULL,NULL,NULL,NULL,'2021-08-05','MA','甲醇',-47.00,9.00,246.00,11.00,-86.00,80.00);
INSERT INTO `t_research_interspread` VALUES (48,NULL,NULL,NULL,NULL,'2021-08-06','MA','甲醇',-60.00,-13.00,263.00,22.00,-86.00,83.00);
INSERT INTO `t_research_interspread` VALUES (49,NULL,NULL,NULL,NULL,'2021-08-09','MA','甲醇',-61.00,-7.00,247.00,24.00,-77.00,88.00);
INSERT INTO `t_research_interspread` VALUES (50,NULL,NULL,NULL,NULL,'2021-08-10','MA','甲醇',-55.00,-6.00,238.00,19.00,-73.00,80.00);
INSERT INTO `t_research_interspread` VALUES (51,NULL,NULL,NULL,NULL,'2021-08-11','MA','甲醇',-51.00,-22.00,232.00,14.00,-69.00,99.00);
INSERT INTO `t_research_interspread` VALUES (52,NULL,NULL,NULL,NULL,'2021-08-12','MA','甲醇',-48.00,-8.00,250.00,7.00,-64.00,112.00);
INSERT INTO `t_research_interspread` VALUES (53,NULL,NULL,NULL,NULL,'2021-08-13','MA','甲醇',-53.00,-9.00,252.00,5.00,-73.00,103.00);
INSERT INTO `t_research_interspread` VALUES (54,NULL,NULL,NULL,NULL,'2021-08-16','MA','甲醇',-47.00,-12.00,245.00,-4.00,-77.00,106.00);
INSERT INTO `t_research_interspread` VALUES (55,NULL,NULL,NULL,NULL,'2021-08-17','MA','甲醇',-53.00,-11.00,212.00,-5.00,-80.00,118.00);
INSERT INTO `t_research_interspread` VALUES (56,NULL,NULL,NULL,NULL,'2021-08-18','MA','甲醇',-53.00,5.00,247.00,-7.00,-85.00,141.00);
INSERT INTO `t_research_interspread` VALUES (57,NULL,NULL,NULL,NULL,'2021-08-19','MA','甲醇',-42.00,-16.00,265.00,-14.00,-90.00,130.00);
INSERT INTO `t_research_interspread` VALUES (58,NULL,NULL,NULL,NULL,'2021-08-20','MA','甲醇',-45.00,-24.00,262.00,-16.00,-91.00,133.00);
INSERT INTO `t_research_interspread` VALUES (59,NULL,NULL,NULL,NULL,'2021-08-23','MA','甲醇',-44.00,-33.00,253.00,-15.00,-78.00,147.00);
INSERT INTO `t_research_interspread` VALUES (60,NULL,NULL,NULL,NULL,'2021-08-24','MA','甲醇',-35.00,-27.00,235.00,-9.00,-78.00,176.00);
INSERT INTO `t_research_interspread` VALUES (61,NULL,NULL,NULL,NULL,'2021-08-25','MA','甲醇',-38.00,-32.00,239.00,-9.00,-76.00,177.00);
INSERT INTO `t_research_interspread` VALUES (62,NULL,NULL,NULL,NULL,'2021-08-26','MA','甲醇',-39.00,-29.00,251.00,-6.00,-79.00,170.00);
INSERT INTO `t_research_interspread` VALUES (63,NULL,NULL,NULL,NULL,'2021-08-27','MA','甲醇',-37.00,-16.00,260.00,-9.00,-81.00,155.00);
INSERT INTO `t_research_interspread` VALUES (64,NULL,NULL,NULL,NULL,'2021-08-30','MA','甲醇',-35.00,26.00,266.00,-11.00,-73.00,163.00);
INSERT INTO `t_research_interspread` VALUES (65,NULL,NULL,NULL,NULL,'2021-08-31','MA','甲醇',-32.00,34.00,288.00,1.00,-57.00,157.00);
INSERT INTO `t_research_interspread` VALUES (66,NULL,NULL,NULL,NULL,'2021-09-01','MA','甲醇',-33.00,42.00,270.00,16.00,-52.00,162.00);
INSERT INTO `t_research_interspread` VALUES (67,NULL,NULL,NULL,NULL,'2021-09-02','MA','甲醇',-33.00,52.00,273.00,13.00,-56.00,181.00);
INSERT INTO `t_research_interspread` VALUES (68,NULL,NULL,NULL,NULL,'2021-09-03','MA','甲醇',-36.00,82.00,283.00,6.00,-45.00,181.00);
INSERT INTO `t_research_interspread` VALUES (69,NULL,NULL,NULL,NULL,'2021-09-06','MA','甲醇',-41.00,50.00,285.00,1.00,-26.00,186.00);
INSERT INTO `t_research_interspread` VALUES (70,NULL,NULL,NULL,NULL,'2021-09-07','MA','甲醇',-40.00,64.00,288.00,9.00,-39.00,200.00);
INSERT INTO `t_research_interspread` VALUES (71,NULL,NULL,NULL,NULL,'2021-09-08','MA','甲醇',-38.00,64.00,300.00,10.00,-55.00,204.00);
INSERT INTO `t_research_interspread` VALUES (72,NULL,NULL,NULL,NULL,'2021-09-09','MA','甲醇',-31.00,66.00,303.00,13.00,-40.00,195.00);
INSERT INTO `t_research_interspread` VALUES (73,NULL,NULL,NULL,NULL,'2021-09-10','MA','甲醇',-33.00,81.00,292.00,17.00,-44.00,177.00);
INSERT INTO `t_research_interspread` VALUES (74,NULL,NULL,NULL,NULL,'2021-09-13','MA','甲醇',-32.00,84.00,286.00,27.00,-35.00,160.00);
INSERT INTO `t_research_interspread` VALUES (75,NULL,NULL,NULL,NULL,'2021-09-14','MA','甲醇',-23.00,86.00,295.00,39.00,-16.00,161.00);
INSERT INTO `t_research_interspread` VALUES (76,NULL,NULL,NULL,NULL,'2021-09-15','MA','甲醇',-15.00,84.00,289.00,34.00,-27.00,160.00);
INSERT INTO `t_research_interspread` VALUES (77,NULL,NULL,NULL,NULL,'2021-09-16','MA','甲醇',-13.00,84.00,295.00,32.00,-23.00,154.00);
INSERT INTO `t_research_interspread` VALUES (78,NULL,NULL,NULL,NULL,'2021-09-17','MA','甲醇',-20.00,81.00,284.00,46.00,-31.00,166.00);
INSERT INTO `t_research_interspread` VALUES (79,NULL,NULL,NULL,NULL,'2021-09-22','MA','甲醇',-22.00,78.00,282.00,64.00,-36.00,175.00);
INSERT INTO `t_research_interspread` VALUES (80,NULL,NULL,NULL,NULL,'2021-09-23','MA','甲醇',-22.00,88.00,260.00,59.00,-38.00,190.00);
INSERT INTO `t_research_interspread` VALUES (81,NULL,NULL,NULL,NULL,'2021-09-24','MA','甲醇',-24.00,98.00,248.00,47.00,-43.00,183.00);
INSERT INTO `t_research_interspread` VALUES (82,NULL,NULL,NULL,NULL,'2021-09-27','MA','甲醇',-21.00,91.00,227.00,61.00,-46.00,178.00);
INSERT INTO `t_research_interspread` VALUES (83,NULL,NULL,NULL,NULL,'2021-09-28','MA','甲醇',-25.00,80.00,237.00,53.00,-42.00,330.00);
INSERT INTO `t_research_interspread` VALUES (84,NULL,NULL,NULL,NULL,'2021-09-29','MA','甲醇',-18.00,85.00,239.00,51.00,-50.00,403.00);
INSERT INTO `t_research_interspread` VALUES (85,NULL,NULL,NULL,NULL,'2021-09-30','MA','甲醇',0.00,81.00,254.00,69.00,-46.00,370.00);
INSERT INTO `t_research_interspread` VALUES (86,NULL,NULL,NULL,NULL,'2021-10-08','MA','甲醇',41.00,95.00,272.00,73.00,-45.00,394.00);
INSERT INTO `t_research_interspread` VALUES (87,NULL,NULL,NULL,NULL,'2021-10-11','MA','甲醇',41.00,96.00,275.00,82.00,-39.00,457.00);
INSERT INTO `t_research_interspread` VALUES (88,NULL,NULL,NULL,NULL,'2021-10-12','MA','甲醇',42.00,102.00,280.00,66.00,-34.00,555.00);
INSERT INTO `t_research_interspread` VALUES (89,NULL,NULL,NULL,NULL,'2021-10-13','MA','甲醇',45.00,95.00,291.00,45.00,-28.00,497.00);
INSERT INTO `t_research_interspread` VALUES (90,NULL,NULL,NULL,NULL,'2021-10-14','MA','甲醇',35.00,108.00,297.00,18.00,-33.00,450.00);
INSERT INTO `t_research_interspread` VALUES (91,NULL,NULL,NULL,NULL,'2021-10-15','MA','甲醇',35.00,109.00,288.00,8.00,-30.00,400.00);
INSERT INTO `t_research_interspread` VALUES (92,NULL,NULL,NULL,NULL,'2021-10-18','MA','甲醇',36.00,108.00,274.00,-3.00,-33.00,412.00);
INSERT INTO `t_research_interspread` VALUES (93,NULL,NULL,NULL,NULL,'2021-10-19','MA','甲醇',28.00,128.00,268.00,2.00,-34.00,416.00);
INSERT INTO `t_research_interspread` VALUES (94,NULL,NULL,NULL,NULL,'2021-10-20','MA','甲醇',26.00,127.00,294.00,-6.00,-41.00,366.00);
INSERT INTO `t_research_interspread` VALUES (95,NULL,NULL,NULL,NULL,'2021-10-21','MA','甲醇',4.00,126.00,304.00,-22.00,-34.00,315.00);
INSERT INTO `t_research_interspread` VALUES (96,NULL,NULL,NULL,NULL,'2021-10-22','MA','甲醇',3.00,118.00,330.00,-43.00,-27.00,278.00);
INSERT INTO `t_research_interspread` VALUES (97,NULL,NULL,NULL,NULL,'2021-10-25','MA','甲醇',23.00,119.00,342.00,-49.00,-33.00,207.00);
INSERT INTO `t_research_interspread` VALUES (98,NULL,NULL,NULL,NULL,'2021-10-26','MA','甲醇',41.00,122.00,355.00,-61.00,-53.00,209.00);
INSERT INTO `t_research_interspread` VALUES (99,NULL,NULL,NULL,NULL,'2021-10-27','MA','甲醇',43.00,133.00,304.00,-74.00,-68.00,250.00);
INSERT INTO `t_research_interspread` VALUES (100,NULL,NULL,NULL,NULL,'2021-10-28','MA','甲醇',26.00,137.00,295.00,-58.00,-55.00,200.00);
INSERT INTO `t_research_interspread` VALUES (101,NULL,NULL,NULL,NULL,'2021-10-29','MA','甲醇',49.00,125.00,225.00,-66.00,-53.00,221.00);
INSERT INTO `t_research_interspread` VALUES (102,NULL,NULL,NULL,NULL,'2021-11-01','MA','甲醇',44.00,121.00,193.00,-63.00,-64.00,281.00);
INSERT INTO `t_research_interspread` VALUES (103,NULL,NULL,NULL,NULL,'2021-11-02','MA','甲醇',25.00,119.00,186.00,-65.00,-76.00,234.00);
INSERT INTO `t_research_interspread` VALUES (104,NULL,NULL,NULL,NULL,'2021-11-03','MA','甲醇',26.00,105.00,160.00,-63.00,-73.00,230.00);
INSERT INTO `t_research_interspread` VALUES (105,NULL,NULL,NULL,NULL,'2021-11-04','MA','甲醇',23.00,106.00,175.00,-63.00,-64.00,238.00);
INSERT INTO `t_research_interspread` VALUES (106,NULL,NULL,NULL,NULL,'2021-11-05','MA','甲醇',14.00,106.00,165.00,-68.00,-61.00,265.00);
INSERT INTO `t_research_interspread` VALUES (107,NULL,NULL,NULL,NULL,'2021-11-08','MA','甲醇',11.00,119.00,135.00,-77.00,-46.00,272.00);
INSERT INTO `t_research_interspread` VALUES (108,NULL,NULL,NULL,NULL,'2021-11-09','MA','甲醇',-31.00,135.00,137.00,-84.00,-50.00,255.00);
INSERT INTO `t_research_interspread` VALUES (109,NULL,NULL,NULL,NULL,'2021-11-10','MA','甲醇',-25.00,129.00,134.00,-93.00,-48.00,200.00);
INSERT INTO `t_research_interspread` VALUES (110,NULL,NULL,NULL,NULL,'2021-11-11','MA','甲醇',-27.00,125.00,144.00,-107.00,-42.00,198.00);
INSERT INTO `t_research_interspread` VALUES (111,NULL,NULL,NULL,NULL,'2021-11-12','MA','甲醇',-28.00,136.00,124.00,-109.00,-39.00,142.00);
INSERT INTO `t_research_interspread` VALUES (112,NULL,NULL,NULL,NULL,'2021-11-15','MA','甲醇',-16.00,116.00,111.00,-112.00,-3.00,101.00);
INSERT INTO `t_research_interspread` VALUES (113,NULL,NULL,NULL,NULL,'2021-11-16','MA','甲醇',22.00,129.00,94.00,-119.00,25.00,114.00);
INSERT INTO `t_research_interspread` VALUES (114,NULL,NULL,NULL,NULL,'2021-11-17','MA','甲醇',50.00,142.00,65.00,-117.00,-6.00,90.00);
INSERT INTO `t_research_interspread` VALUES (115,NULL,NULL,NULL,NULL,'2021-11-18','MA','甲醇',56.00,153.00,39.00,-120.00,4.00,75.00);
INSERT INTO `t_research_interspread` VALUES (116,NULL,NULL,NULL,NULL,'2021-11-19','MA','甲醇',80.00,155.00,13.00,-127.00,26.00,106.00);
INSERT INTO `t_research_interspread` VALUES (117,NULL,NULL,NULL,NULL,'2021-11-22','MA','甲醇',61.00,172.00,6.00,-117.00,35.00,NULL);
INSERT INTO `t_research_interspread` VALUES (118,NULL,NULL,NULL,NULL,'2021-11-23','MA','甲醇',-10.00,187.00,-39.00,-106.00,43.00,NULL);
INSERT INTO `t_research_interspread` VALUES (119,NULL,NULL,NULL,NULL,'2021-11-24','MA','甲醇',-13.00,192.00,-18.00,-97.00,43.00,NULL);
INSERT INTO `t_research_interspread` VALUES (120,NULL,NULL,NULL,NULL,'2021-11-25','MA','甲醇',-21.00,185.00,-19.00,-92.00,49.00,NULL);
INSERT INTO `t_research_interspread` VALUES (121,NULL,NULL,NULL,NULL,'2021-11-26','MA','甲醇',-28.00,166.00,-34.00,-103.00,14.00,NULL);
INSERT INTO `t_research_interspread` VALUES (122,NULL,NULL,NULL,NULL,'2021-11-29','MA','甲醇',-7.00,176.00,-28.00,-109.00,1.00,NULL);
INSERT INTO `t_research_interspread` VALUES (123,NULL,NULL,NULL,NULL,'2021-11-30','MA','甲醇',-15.00,192.00,-36.00,-107.00,4.00,NULL);
INSERT INTO `t_research_interspread` VALUES (124,NULL,NULL,NULL,NULL,'2021-12-01','MA','甲醇',-1.00,190.00,-46.00,-96.00,-2.00,NULL);
INSERT INTO `t_research_interspread` VALUES (125,NULL,NULL,NULL,NULL,'2021-12-02','MA','甲醇',-5.00,188.00,-64.00,-86.00,-16.00,NULL);
INSERT INTO `t_research_interspread` VALUES (126,NULL,NULL,NULL,NULL,'2021-12-03','MA','甲醇',-15.00,211.00,-74.00,-78.00,-28.00,NULL);
INSERT INTO `t_research_interspread` VALUES (127,NULL,NULL,NULL,NULL,'2021-12-06','MA','甲醇',-19.00,209.00,-65.00,-69.00,-21.00,NULL);
INSERT INTO `t_research_interspread` VALUES (128,NULL,NULL,NULL,NULL,'2021-12-07','MA','甲醇',28.00,211.00,-77.00,-87.00,-40.00,NULL);
INSERT INTO `t_research_interspread` VALUES (129,NULL,NULL,NULL,NULL,'2021-12-08','MA','甲醇',6.00,298.00,-47.00,-101.00,-54.00,NULL);
INSERT INTO `t_research_interspread` VALUES (130,NULL,NULL,NULL,NULL,'2021-12-09','MA','甲醇',-8.00,364.00,-32.00,-107.00,-65.00,NULL);
INSERT INTO `t_research_interspread` VALUES (131,NULL,NULL,NULL,NULL,'2021-12-10','MA','甲醇',-7.00,354.00,-17.00,-105.00,-72.00,NULL);
INSERT INTO `t_research_interspread` VALUES (132,NULL,NULL,NULL,NULL,'2021-12-13','MA','甲醇',3.00,322.00,-50.00,-96.00,-73.00,NULL);
INSERT INTO `t_research_interspread` VALUES (133,NULL,NULL,NULL,NULL,'2021-12-14','MA','甲醇',35.00,254.00,-28.00,-98.00,-77.00,NULL);
INSERT INTO `t_research_interspread` VALUES (134,NULL,NULL,NULL,NULL,'2021-12-15','MA','甲醇',93.00,241.00,-48.00,-108.00,-87.00,NULL);
INSERT INTO `t_research_interspread` VALUES (135,NULL,NULL,NULL,NULL,'2021-12-16','MA','甲醇',89.00,274.00,-51.00,-119.00,-76.00,NULL);
INSERT INTO `t_research_interspread` VALUES (136,NULL,NULL,NULL,NULL,'2021-12-17','MA','甲醇',73.00,358.00,-51.00,-119.00,-33.00,NULL);
INSERT INTO `t_research_interspread` VALUES (137,NULL,NULL,NULL,NULL,'2021-12-20','MA','甲醇',102.00,345.00,-55.00,-102.00,-3.00,NULL);
INSERT INTO `t_research_interspread` VALUES (138,NULL,NULL,NULL,NULL,'2021-12-21','MA','甲醇',133.00,315.00,-64.00,-106.00,31.00,NULL);
INSERT INTO `t_research_interspread` VALUES (139,NULL,NULL,NULL,NULL,'2021-12-22','MA','甲醇',204.00,340.00,-61.00,-110.00,19.00,NULL);
INSERT INTO `t_research_interspread` VALUES (140,NULL,NULL,NULL,NULL,'2021-12-23','MA','甲醇',211.00,365.00,-50.00,-99.00,50.00,NULL);
INSERT INTO `t_research_interspread` VALUES (141,NULL,NULL,NULL,NULL,'2021-12-24','MA','甲醇',170.00,348.00,-53.00,-83.00,71.00,NULL);
INSERT INTO `t_research_interspread` VALUES (142,NULL,NULL,NULL,NULL,'2021-12-27','MA','甲醇',90.00,369.00,-49.00,-75.00,50.00,NULL);
INSERT INTO `t_research_interspread` VALUES (143,NULL,NULL,NULL,NULL,'2021-12-28','MA','甲醇',106.00,364.00,-63.00,-68.00,52.00,NULL);
INSERT INTO `t_research_interspread` VALUES (144,NULL,NULL,NULL,NULL,'2021-12-29','MA','甲醇',129.00,340.00,-97.00,-64.00,36.00,NULL);
INSERT INTO `t_research_interspread` VALUES (145,NULL,NULL,NULL,NULL,'2021-12-30','MA','甲醇',NULL,308.00,NULL,-66.00,48.00,NULL);
INSERT INTO `t_research_interspread` VALUES (146,NULL,NULL,NULL,NULL,'2021-12-31','MA','甲醇',NULL,265.00,NULL,NULL,41.00,NULL);
/*!40000 ALTER TABLE `t_research_interspread` ENABLE KEYS */;

--
-- Table structure for table `t_research_researchcontract`
--

DROP TABLE IF EXISTS `t_research_researchcontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_research_researchcontract` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `contract_code` varchar(16) DEFAULT NULL COMMENT '合约代码',
  `contract_name` varchar(16) DEFAULT NULL COMMENT '合约名称',
  `is_show` tinyint DEFAULT NULL COMMENT '是否显示',
  `market_no` int DEFAULT NULL COMMENT '交易所',
  `table_display` varchar(64) DEFAULT NULL COMMENT '图表化方式',
  `table_name_ch` varchar(64) DEFAULT NULL COMMENT '表中文名',
  `table_name_en` varchar(64) DEFAULT NULL COMMENT '表英文名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='研究品种表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_research_researchcontract`
--

/*!40000 ALTER TABLE `t_research_researchcontract` DISABLE KEYS */;
INSERT INTO `t_research_researchcontract` VALUES (1,1,'2021-11-30 14:43:37',1,'2021-11-30 14:43:37','MA','甲醇',1,3,'','历史基差表','t_research_hisbasis');
INSERT INTO `t_research_researchcontract` VALUES (2,1,'2021-11-30 14:44:15',1,'2021-11-30 14:44:15','MA','甲醇',1,3,'','跨期价差表','t_research_interspread');
/*!40000 ALTER TABLE `t_research_researchcontract` ENABLE KEYS */;

--
-- Table structure for table `t_sys_cfg`
--

DROP TABLE IF EXISTS `t_sys_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_cfg` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `cfg_desc` text COMMENT '备注',
  `cfg_name` varchar(256) DEFAULT NULL COMMENT '参数名',
  `cfg_value` varchar(512) DEFAULT NULL COMMENT '参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统参数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_cfg`
--

/*!40000 ALTER TABLE `t_sys_cfg` DISABLE KEYS */;
INSERT INTO `t_sys_cfg` VALUES (1,NULL,NULL,-1,'2021-11-30 16:30:00','update by 2021-11-30 16:30:00','system.app.name','web-flash');
INSERT INTO `t_sys_cfg` VALUES (2,NULL,NULL,1,'2019-04-15 21:36:17','系统默认上传文件路径','system.file.upload.path','/data/web-flash/runtime/upload');
INSERT INTO `t_sys_cfg` VALUES (3,NULL,NULL,1,'2019-04-15 21:36:17','腾讯sms接口appid','api.tencent.sms.appid','1400219425');
INSERT INTO `t_sys_cfg` VALUES (4,NULL,NULL,1,'2019-04-15 21:36:17','腾讯sms接口appkey','api.tencent.sms.appkey','5f71ed5325f3b292946530a1773e997a');
INSERT INTO `t_sys_cfg` VALUES (5,NULL,NULL,1,'2019-04-15 21:36:17','腾讯sms接口签名参数','api.tencent.sms.sign','需要去申请咯');
INSERT INTO `t_sys_cfg` VALUES (6,1,'2020-07-21 10:24:37',1,'2020-07-21 10:24:37','分支机构父菜单ID','system.dept.branch','19');
INSERT INTO `t_sys_cfg` VALUES (7,1,'2020-07-30 11:00:37',1,'2020-07-30 11:00:37','新浪期货行情接口','api.sina.hq','http://hq.sinajs.cn/');
INSERT INTO `t_sys_cfg` VALUES (8,1,'2020-09-10 05:39:38',1,'2020-09-10 05:39:38','开户岗管理角色ID','system.role.openadmin','03');
INSERT INTO `t_sys_cfg` VALUES (9,1,'2020-12-21 09:40:48',1,'2020-12-21 09:40:48','开户岗角色ID','system.role.openpost','02');
/*!40000 ALTER TABLE `t_sys_cfg` ENABLE KEYS */;

--
-- Table structure for table `t_sys_dept`
--

DROP TABLE IF EXISTS `t_sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `fullname` varchar(255) DEFAULT NULL,
  `num` int DEFAULT NULL,
  `pid` bigint DEFAULT NULL,
  `pids` varchar(255) DEFAULT NULL,
  `simplename` varchar(255) DEFAULT NULL,
  `tips` varchar(255) DEFAULT NULL,
  `version` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_dept`
--

/*!40000 ALTER TABLE `t_sys_dept` DISABLE KEYS */;
INSERT INTO `t_sys_dept` VALUES (5,1,'2020-07-09 16:48:17',1,'2020-07-09 16:48:17','中原期货股份有限公司领导部门',1,0,'[0],','高管部门',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (6,1,'2020-07-09 16:49:53',1,'2020-07-09 16:49:53','行政管理部',2,0,'[0],','行政管理部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (7,1,'2020-07-09 16:50:22',1,'2020-07-09 16:50:22','计划财务部',3,0,'[0],','计划财务部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (8,1,'2020-07-09 16:50:46',1,'2020-07-09 16:50:46','合规稽核部',4,0,'[0],','合规稽核部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (9,1,'2020-07-09 16:51:42',1,'2020-07-09 16:51:42','信息技术部',5,0,'[0],','信息技术部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (10,1,'2020-07-09 16:52:06',1,'2020-07-09 16:52:06','结算风控部',6,0,'[0],','结算风控部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (11,1,'2020-07-09 16:52:23',1,'2020-07-09 16:52:23','交易部',7,0,'[0],','交易部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (12,1,'2020-07-09 16:52:51',1,'2020-07-09 16:52:51','资产管理部',8,0,'[0],','资产管理部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (13,1,'2020-07-09 16:53:16',1,'2020-07-09 16:53:16','研究所',9,0,'[0],','研究所',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (14,1,'2020-07-09 16:53:34',1,'2020-07-09 16:53:34','投资咨询部',10,0,'[0],','投资咨询部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (15,1,'2020-07-09 16:53:56',1,'2020-07-09 16:53:56','金融科技部',11,0,'[0],','金融科技部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (16,1,'2020-07-09 16:54:12',1,'2020-07-09 16:54:12','客服中心',12,0,'[0],','客服中心',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (17,1,'2020-07-09 16:54:35',1,'2020-07-09 16:54:35','战略客户部',13,0,'[0],','战略客户部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (18,1,'2020-07-09 16:54:54',1,'2020-07-09 16:54:54','营销中心',14,0,'[0],','营销中心',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (19,1,'2020-07-09 16:55:16',1,'2020-07-09 16:55:16','分支机构',15,0,'[0],','分支机构',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (20,1,'2020-07-09 17:02:03',1,'2020-07-09 17:02:03','上海分公司',1,19,'[0],[19],','上海分公司',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (21,1,'2020-07-09 17:02:27',1,'2020-07-09 17:02:27','洛阳营业部',2,19,'[0],[19],','洛阳营业部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (22,1,'2020-07-09 17:03:05',1,'2020-07-09 17:03:05','大连营业部',3,19,'[0],[19],','大连营业部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (23,1,'2020-07-09 17:03:36',1,'2020-07-09 17:03:46','西安营业部',4,19,'[0],[19],','西安营业部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (24,1,'2020-07-09 17:04:38',1,'2020-07-09 17:04:38','灵宝营业部',5,19,'[0],[19],','灵宝营业部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (25,1,'2020-07-09 17:05:00',1,'2020-07-09 17:05:00','新乡营业部',6,19,'[0],[19],','新乡营业部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (26,1,'2020-07-09 17:05:20',1,'2020-07-09 17:05:20','南阳营业部',7,19,'[0],[19],','南阳营业部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (27,1,'2020-07-09 17:05:47',1,'2020-07-09 17:05:47','武义营业部',8,19,'[0],[19],','武义营业部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (28,1,'2020-07-09 17:06:07',1,'2020-07-09 17:06:07','杭州营业部',9,19,'[0],[19],','杭州营业部',NULL,NULL);
INSERT INTO `t_sys_dept` VALUES (29,1,'2020-07-15 15:24:42',1,'2020-07-15 15:24:42','交易部下郑州总部营业厅',0,19,'[0],[19],','郑州总部',NULL,NULL);
/*!40000 ALTER TABLE `t_sys_dept` ENABLE KEYS */;

--
-- Table structure for table `t_sys_dict`
--

DROP TABLE IF EXISTS `t_sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_dict` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `name` varchar(32) DEFAULT NULL COMMENT '字典显示值',
  `num` varchar(32) DEFAULT NULL COMMENT '字典值',
  `pid` bigint DEFAULT NULL COMMENT '字典记录所属组id',
  `tips` varchar(32) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_dict`
--

/*!40000 ALTER TABLE `t_sys_dict` DISABLE KEYS */;
INSERT INTO `t_sys_dict` VALUES (16,NULL,NULL,NULL,NULL,'状态','0',0,NULL);
INSERT INTO `t_sys_dict` VALUES (17,NULL,NULL,NULL,NULL,'启用','1',16,NULL);
INSERT INTO `t_sys_dict` VALUES (18,NULL,NULL,NULL,NULL,'禁用','2',16,NULL);
INSERT INTO `t_sys_dict` VALUES (29,NULL,NULL,NULL,NULL,'性别','0',0,NULL);
INSERT INTO `t_sys_dict` VALUES (30,NULL,NULL,NULL,NULL,'男','1',29,NULL);
INSERT INTO `t_sys_dict` VALUES (31,NULL,NULL,NULL,NULL,'女','2',29,NULL);
INSERT INTO `t_sys_dict` VALUES (35,NULL,NULL,NULL,NULL,'账号状态','0',0,NULL);
INSERT INTO `t_sys_dict` VALUES (36,NULL,NULL,NULL,NULL,'启用','1',35,NULL);
INSERT INTO `t_sys_dict` VALUES (37,NULL,NULL,NULL,NULL,'冻结','2',35,NULL);
INSERT INTO `t_sys_dict` VALUES (38,NULL,NULL,NULL,NULL,'已删除','3',35,NULL);
INSERT INTO `t_sys_dict` VALUES (53,NULL,NULL,NULL,NULL,'证件类型','0',0,NULL);
INSERT INTO `t_sys_dict` VALUES (54,NULL,NULL,NULL,NULL,'身份证','1',53,NULL);
INSERT INTO `t_sys_dict` VALUES (55,NULL,NULL,NULL,NULL,'护照','2',53,NULL);
INSERT INTO `t_sys_dict` VALUES (68,1,'2019-01-13 14:18:21',1,'2019-01-13 14:18:21','是否','0',0,NULL);
INSERT INTO `t_sys_dict` VALUES (69,1,'2019-01-13 14:18:21',1,'2019-01-13 14:18:21','是','1',68,NULL);
INSERT INTO `t_sys_dict` VALUES (70,1,'2019-01-13 14:18:21',1,'2019-01-13 14:18:21','否','0',68,NULL);
INSERT INTO `t_sys_dict` VALUES (71,1,'2020-07-09 17:08:41',1,'2020-07-09 17:08:41','开户类型','0',0,NULL);
INSERT INTO `t_sys_dict` VALUES (72,1,'2020-07-09 17:08:41',1,'2020-07-09 17:08:41','期货','1',71,NULL);
INSERT INTO `t_sys_dict` VALUES (73,1,'2020-07-09 17:08:41',1,'2020-07-09 17:08:41','期权','2',71,NULL);
INSERT INTO `t_sys_dict` VALUES (74,1,'2020-07-09 17:09:26',1,'2020-07-09 17:09:26','客户类型','0',0,NULL);
INSERT INTO `t_sys_dict` VALUES (75,1,'2020-07-09 17:09:26',1,'2020-07-09 17:09:26','自然人','1',74,NULL);
INSERT INTO `t_sys_dict` VALUES (76,1,'2020-07-09 17:09:26',1,'2020-07-09 17:09:26','法人','2',74,NULL);
INSERT INTO `t_sys_dict` VALUES (77,1,'2020-11-10 02:19:29',1,'2020-11-10 02:19:29','期货交易所编号','0',0,NULL);
INSERT INTO `t_sys_dict` VALUES (78,1,'2020-11-10 02:19:29',1,'2020-11-10 02:19:29','上海期货交易所','1',77,NULL);
INSERT INTO `t_sys_dict` VALUES (79,1,'2020-11-10 02:19:29',1,'2020-11-10 02:19:29','大连商品交易所','2',77,NULL);
INSERT INTO `t_sys_dict` VALUES (80,1,'2020-11-10 02:19:29',1,'2020-11-10 02:19:29','郑州商品交易所','3',77,NULL);
INSERT INTO `t_sys_dict` VALUES (81,1,'2020-11-10 02:19:29',1,'2020-11-10 02:19:29','中国金融期货交易所','4',77,NULL);
INSERT INTO `t_sys_dict` VALUES (82,1,'2020-11-19 02:33:10',1,'2020-11-19 02:33:10','上海国际能源交易中心','5',77,NULL);
/*!40000 ALTER TABLE `t_sys_dict` ENABLE KEYS */;

--
-- Table structure for table `t_sys_file_info`
--

DROP TABLE IF EXISTS `t_sys_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_file_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `original_file_name` varchar(255) DEFAULT NULL,
  `real_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_file_info`
--

/*!40000 ALTER TABLE `t_sys_file_info` DISABLE KEYS */;
INSERT INTO `t_sys_file_info` VALUES (1,1,'2019-03-18 10:34:34',1,'2019-03-18 10:34:34','banner1.png','7e9ebc08-b194-4f85-8997-d97ccb0d2c2d.png');
INSERT INTO `t_sys_file_info` VALUES (2,1,'2019-03-18 10:54:04',1,'2019-03-18 10:54:04','banner2.png','756b9ca8-562f-4bf5-a577-190dcdd25c29.png');
INSERT INTO `t_sys_file_info` VALUES (3,1,'2019-03-18 20:09:59',1,'2019-03-18 20:09:59','offcial_site.png','b0304e2b-0ee3-4966-ac9f-a075b13d4af6.png');
INSERT INTO `t_sys_file_info` VALUES (4,1,'2019-03-18 20:10:18',1,'2019-03-18 20:10:18','bbs.png','67486aa5-500c-4993-87ad-7e1fbc90ac1a.png');
INSERT INTO `t_sys_file_info` VALUES (5,1,'2019-03-18 20:20:14',1,'2019-03-18 20:20:14','product.png','1f2b05e0-403a-41e0-94a2-465f0c986b78.png');
INSERT INTO `t_sys_file_info` VALUES (6,1,'2019-03-18 20:22:09',1,'2019-03-18 20:22:09','profile.jpg','40ead888-14d1-4e9f-abb3-5bfb056a966a.jpg');
INSERT INTO `t_sys_file_info` VALUES (7,1,'2019-03-20 09:05:54',1,'2019-03-20 09:05:54','2303938_1453211.png','87b037da-b517-4007-a66e-ba7cc8cfd6ea.png');
INSERT INTO `t_sys_file_info` VALUES (8,NULL,NULL,NULL,NULL,'login.png','26835cc4-059e-4900-aff5-a41f2ea6a61d.png');
INSERT INTO `t_sys_file_info` VALUES (9,NULL,NULL,NULL,NULL,'login.png','7ec7553b-7c9e-44d9-b9c2-3d89b11cf842.png');
INSERT INTO `t_sys_file_info` VALUES (10,NULL,NULL,NULL,NULL,'login.png','357c4aad-19fd-4600-9fb6-e62aafa3df25.png');
INSERT INTO `t_sys_file_info` VALUES (11,NULL,NULL,NULL,NULL,'index.png','55dd582b-033e-440d-8e8d-c8d39d01f1bb.png');
INSERT INTO `t_sys_file_info` VALUES (12,NULL,NULL,NULL,NULL,'login.png','70507c07-e8bc-492f-9f0a-00bf1c23e329.png');
INSERT INTO `t_sys_file_info` VALUES (13,NULL,NULL,NULL,NULL,'index.png','cd539518-d15a-4cda-a19f-251169f5d1a4.png');
INSERT INTO `t_sys_file_info` VALUES (14,NULL,NULL,NULL,NULL,'login.png','194c8a38-be94-483c-8875-3c62a857ead7.png');
INSERT INTO `t_sys_file_info` VALUES (15,NULL,NULL,NULL,NULL,'index.png','6a6cb215-d0a7-4574-a45e-5fa04dcfdf90.png');
INSERT INTO `t_sys_file_info` VALUES (16,1,'2019-03-21 19:37:50',NULL,NULL,'测试文档.doc','d9d77815-496f-475b-a0f8-1d6dcb86e6ab.doc');
INSERT INTO `t_sys_file_info` VALUES (17,1,'2019-04-28 00:34:09',NULL,NULL,'首页.png','d5aba978-f8af-45c5-b079-673decfbdf26.png');
INSERT INTO `t_sys_file_info` VALUES (18,1,'2019-04-28 00:34:34',NULL,NULL,'资讯.png','7e07520d-5b73-4712-800b-16f88d133db2.png');
INSERT INTO `t_sys_file_info` VALUES (19,1,'2019-04-28 00:38:32',NULL,NULL,'产品服务.png','99214651-8cb8-4488-b572-12c6aa21f30a.png');
INSERT INTO `t_sys_file_info` VALUES (20,1,'2019-04-28 00:39:09',NULL,NULL,'67486aa5-500c-4993-87ad-7e1fbc90ac1a.png','31fdc83e-7688-41f5-b153-b6816d5dfb06.png');
INSERT INTO `t_sys_file_info` VALUES (21,1,'2019-04-28 00:39:22',NULL,NULL,'67486aa5-500c-4993-87ad-7e1fbc90ac1a.png','ffaf0563-3115-477b-b31d-47a4e80a75eb.png');
INSERT INTO `t_sys_file_info` VALUES (22,1,'2019-04-28 00:39:47',NULL,NULL,'7e07520d-5b73-4712-800b-16f88d133db2.png','8928e5d4-933a-4953-9507-f60b78e3ccee.png');
INSERT INTO `t_sys_file_info` VALUES (23,NULL,'2019-04-28 17:34:31',NULL,NULL,'756b9ca8-562f-4bf5-a577-190dcdd25c29.png','7d64ba36-adc4-4982-9ec2-8c68db68861b.png');
INSERT INTO `t_sys_file_info` VALUES (24,NULL,'2019-04-28 17:39:43',NULL,NULL,'timg.jpg','6483eb26-775c-4fe2-81bf-8dd49ac9b6b1.jpg');
INSERT INTO `t_sys_file_info` VALUES (25,1,'2019-05-05 15:36:54',NULL,NULL,'timg.jpg','7fe918a2-c59a-4d17-ad77-f65dd4e163bf.jpg');
INSERT INTO `t_sys_file_info` VALUES (34,1,'2021-02-22 09:06:35',1,'2021-02-22 09:06:35','预约客户信息.xlsx','1692b0a9-9a5c-400e-9b39-2f57d60c6c87.xlsx');
/*!40000 ALTER TABLE `t_sys_file_info` ENABLE KEYS */;

--
-- Table structure for table `t_sys_login_log`
--

DROP TABLE IF EXISTS `t_sys_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(255) DEFAULT NULL,
  `logname` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `succeed` varchar(255) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='登录日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_login_log`
--

/*!40000 ALTER TABLE `t_sys_login_log` DISABLE KEYS */;
INSERT INTO `t_sys_login_log` VALUES (1,'2020-07-15 09:01:10','127.0.0.1','登录日志',NULL,'成功',1);
INSERT INTO `t_sys_login_log` VALUES (2,'2020-07-15 10:05:47','127.0.0.1','登录日志',NULL,'成功',1);
INSERT INTO `t_sys_login_log` VALUES (3,'2021-11-30 14:39:54','192.168.18.108','登录日志',NULL,'成功',1);
INSERT INTO `t_sys_login_log` VALUES (4,'2021-11-30 16:57:04','192.168.18.108','登录日志',NULL,'成功',1);
/*!40000 ALTER TABLE `t_sys_login_log` ENABLE KEYS */;

--
-- Table structure for table `t_sys_menu`
--

DROP TABLE IF EXISTS `t_sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `component` varchar(64) DEFAULT NULL COMMENT '页面组件',
  `hidden` tinyint DEFAULT NULL COMMENT '是否隐藏',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `ismenu` int NOT NULL COMMENT '是否是菜单1:菜单,0:按钮',
  `isopen` int DEFAULT NULL COMMENT '是否默认打开1:是,0:否',
  `levels` int NOT NULL COMMENT '级别',
  `name` varchar(64) NOT NULL COMMENT '名称',
  `num` int NOT NULL COMMENT '顺序',
  `pcode` varchar(64) NOT NULL COMMENT '父菜单编号',
  `pcodes` varchar(128) DEFAULT NULL COMMENT '递归父级菜单编号',
  `tips` varchar(32) DEFAULT NULL COMMENT '鼠标悬停提示信息',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资源/权限标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_s37unj3gh67ujhk83lqva8i1t` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_menu`
--

/*!40000 ALTER TABLE `t_sys_menu` DISABLE KEYS */;
INSERT INTO `t_sys_menu` VALUES (1,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','system','layout',0,'system',1,1,1,'系统管理',1,'0','[0],',NULL,'/system');
INSERT INTO `t_sys_menu` VALUES (2,1,'2019-07-31 22:04:30',1,'2019-03-11 22:25:38','cms','layout',0,'documentation',1,NULL,1,'CMS管理',3,'0','[0],',NULL,'/cms');
INSERT INTO `t_sys_menu` VALUES (3,1,'2019-07-31 22:04:30',1,'2019-06-02 10:09:09','operationMgr','layout',0,'operation',1,NULL,1,'运维管理',2,'0','[0],',NULL,'/optionMgr');
INSERT INTO `t_sys_menu` VALUES (4,1,'2019-07-31 22:04:30',1,'2019-04-16 18:59:15','mgr','views/system/user/index',0,'user',1,NULL,2,'用户管理',1,'system','[0],[system],',NULL,'/mgr');
INSERT INTO `t_sys_menu` VALUES (5,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrAdd',NULL,0,NULL,0,NULL,3,'添加用户',1,'mgr','[0],[system],[mgr],',NULL,'/mgr/add');
INSERT INTO `t_sys_menu` VALUES (6,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrEdit',NULL,0,NULL,0,NULL,3,'修改用户',2,'mgr','[0],[system],[mgr],',NULL,'/mgr/edit');
INSERT INTO `t_sys_menu` VALUES (7,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrDelete',NULL,0,NULL,0,0,3,'删除用户',3,'mgr','[0],[system],[mgr],',NULL,'/mgr/delete');
INSERT INTO `t_sys_menu` VALUES (8,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrReset',NULL,0,NULL,0,0,3,'重置密码',4,'mgr','[0],[system],[mgr],',NULL,'/mgr/reset');
INSERT INTO `t_sys_menu` VALUES (9,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','setRole',NULL,0,NULL,0,0,3,'分配角色',5,'mgr','[0],[system],[mgr],',NULL,'/mgr/setRole');
INSERT INTO `t_sys_menu` VALUES (10,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrUnfreeze',NULL,0,NULL,0,0,3,'解除冻结用户',6,'mgr','[0],[system],[mgr],',NULL,'/mgr/unfreeze');
INSERT INTO `t_sys_menu` VALUES (11,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','mgrSetRole',NULL,0,NULL,0,0,3,'分配角色',7,'mgr','[0],[system],[mgr],',NULL,'/mgr/setRole');
INSERT INTO `t_sys_menu` VALUES (12,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','role','views/system/role/index',0,'peoples',1,0,2,'角色管理',2,'system','[0],[system],',NULL,'/role');
INSERT INTO `t_sys_menu` VALUES (13,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','roleAdd',NULL,0,NULL,0,0,3,'添加角色',1,'role','[0],[system],[role],',NULL,'/role/add');
INSERT INTO `t_sys_menu` VALUES (14,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','roleEdit',NULL,0,NULL,0,0,3,'修改角色',2,'role','[0],[system],[role],',NULL,'/role/edit');
INSERT INTO `t_sys_menu` VALUES (15,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','roleDelete',NULL,0,NULL,0,0,3,'删除角色',3,'role','[0],[system],[role],',NULL,'/role/remove');
INSERT INTO `t_sys_menu` VALUES (16,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','roleSetAuthority',NULL,0,NULL,0,0,3,'配置权限',4,'role','[0],[system],[role],',NULL,'/role/setAuthority');
INSERT INTO `t_sys_menu` VALUES (17,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','menu','views/system/menu/index',0,'menu',1,0,2,'菜单管理',4,'system','[0],[system],',NULL,'/menu');
INSERT INTO `t_sys_menu` VALUES (18,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','menuAdd',NULL,0,NULL,0,0,3,'添加菜单',1,'menu','[0],[system],[menu],',NULL,'/menu/add');
INSERT INTO `t_sys_menu` VALUES (19,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','menuEdit',NULL,0,NULL,0,0,3,'修改菜单',2,'menu','[0],[system],[menu],',NULL,'/menu/edit');
INSERT INTO `t_sys_menu` VALUES (20,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','menuDelete',NULL,0,NULL,0,0,3,'删除菜单',3,'menu','[0],[system],[menu],',NULL,'/menu/remove');
INSERT INTO `t_sys_menu` VALUES (21,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dept','views/system/dept/index',0,'dept',1,NULL,2,'部门管理',3,'system','[0],[system],',NULL,'/dept');
INSERT INTO `t_sys_menu` VALUES (22,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dict','views/system/dict/index',0,'dict',1,NULL,2,'字典管理',4,'system','[0],[system],',NULL,'/dict');
INSERT INTO `t_sys_menu` VALUES (23,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deptEdit',NULL,0,NULL,0,NULL,3,'修改部门',1,'dept','[0],[system],[dept],',NULL,'/dept/update');
INSERT INTO `t_sys_menu` VALUES (24,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deptDelete',NULL,0,NULL,0,NULL,3,'删除部门',1,'dept','[0],[system],[dept],',NULL,'/dept/delete');
INSERT INTO `t_sys_menu` VALUES (25,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dictAdd',NULL,0,NULL,0,NULL,3,'添加字典',1,'dict','[0],[system],[dict],',NULL,'/dict/add');
INSERT INTO `t_sys_menu` VALUES (26,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dictEdit',NULL,0,NULL,0,NULL,3,'修改字典',1,'dict','[0],[system],[dict],',NULL,'/dict/update');
INSERT INTO `t_sys_menu` VALUES (27,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dictDelete',NULL,0,NULL,0,NULL,3,'删除字典',1,'dict','[0],[system],[dict],',NULL,'/dict/delete');
INSERT INTO `t_sys_menu` VALUES (28,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deptList',NULL,0,NULL,0,NULL,3,'部门列表',5,'dept','[0],[system],[dept],',NULL,'/dept/list');
INSERT INTO `t_sys_menu` VALUES (29,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deptDetail',NULL,0,NULL,0,NULL,3,'部门详情',6,'dept','[0],[system],[dept],',NULL,'/dept/detail');
INSERT INTO `t_sys_menu` VALUES (30,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dictList',NULL,0,NULL,0,NULL,3,'字典列表',5,'dict','[0],[system],[dict],',NULL,'/dict/list');
INSERT INTO `t_sys_menu` VALUES (31,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','dictDetail',NULL,0,NULL,0,NULL,3,'字典详情',6,'dict','[0],[system],[dict],',NULL,'/dict/detail');
INSERT INTO `t_sys_menu` VALUES (32,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deptAdd',NULL,0,NULL,0,NULL,3,'添加部门',1,'dept','[0],[system],[dept],',NULL,'/dept/add');
INSERT INTO `t_sys_menu` VALUES (33,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','cfg','views/system/cfg/index',0,'cfg',1,NULL,2,'参数管理',10,'system','[0],[system],',NULL,'/cfg');
INSERT INTO `t_sys_menu` VALUES (34,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','cfgAdd',NULL,0,NULL,0,NULL,3,'添加参数',1,'cfg','[0],[system],[cfg],',NULL,'/cfg/add');
INSERT INTO `t_sys_menu` VALUES (35,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','cfgEdit',NULL,0,NULL,0,NULL,3,'修改参数',2,'cfg','[0],[system],[cfg],',NULL,'/cfg/update');
INSERT INTO `t_sys_menu` VALUES (36,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','cfgDelete',NULL,0,NULL,0,NULL,3,'删除参数',3,'cfg','[0],[system],[cfg],',NULL,'/cfg/delete');
INSERT INTO `t_sys_menu` VALUES (37,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','task','views/system/task/index',0,'task',1,NULL,2,'任务管理',11,'system','[0],[system],',NULL,'/task');
INSERT INTO `t_sys_menu` VALUES (38,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','taskAdd',NULL,0,NULL,0,NULL,3,'添加任务',1,'task','[0],[system],[task],',NULL,'/task/add');
INSERT INTO `t_sys_menu` VALUES (39,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','taskEdit',NULL,0,NULL,0,NULL,3,'修改任务',2,'task','[0],[system],[task],',NULL,'/task/update');
INSERT INTO `t_sys_menu` VALUES (40,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','taskDelete',NULL,0,NULL,0,NULL,3,'删除任务',3,'task','[0],[system],[task],',NULL,'/task/delete');
INSERT INTO `t_sys_menu` VALUES (41,1,'2019-03-11 22:29:54',1,'2019-03-11 22:29:54','channel','views/cms/channel/index',0,'channel',1,NULL,2,'栏目管理',1,'cms','[0],[cms],',NULL,'/channel');
INSERT INTO `t_sys_menu` VALUES (42,1,'2019-03-11 22:30:17',1,'2019-03-11 22:30:17','article','views/cms/article/index',0,'documentation',1,NULL,2,'文章管理',2,'cms','[0],[cms],',NULL,'/article');
INSERT INTO `t_sys_menu` VALUES (43,1,'2019-03-11 22:30:52',1,'2019-03-11 22:30:52','banner','views/cms/banner/index',0,'banner',1,NULL,2,'banner管理',3,'cms','[0],[cms],',NULL,'/banner');
INSERT INTO `t_sys_menu` VALUES (44,1,'2019-03-18 19:45:37',1,'2019-03-18 19:45:37','contacts','views/cms/contacts/index',0,'contacts',1,NULL,2,'邀约管理',4,'cms','[0],[cms],',NULL,'/contacts');
INSERT INTO `t_sys_menu` VALUES (45,1,'2019-03-19 10:25:05',1,'2019-03-19 10:25:05','file','views/cms/file/index',0,'file',1,NULL,2,'文件管理',5,'cms','[0],[cms],',NULL,'/fileMgr');
INSERT INTO `t_sys_menu` VALUES (46,1,'2019-03-11 22:30:17',1,'2019-03-11 22:30:17','editArticle','views/cms/article/edit.vue',0,'articleEdit',1,NULL,2,'新建文章',1,'cms','[0],[cms],',NULL,'/cms/articleEdit');
INSERT INTO `t_sys_menu` VALUES (47,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','taskLog','views/system/task/taskLog',1,'task',1,NULL,2,'任务日志',4,'system','[0],[system],',NULL,'/taskLog');
INSERT INTO `t_sys_menu` VALUES (48,1,'2019-07-31 22:04:30',1,'2019-06-02 10:25:31','log','views/operation/log/index',0,'log',1,NULL,2,'业务日志',6,'operationMgr','[0],[operationMgr],',NULL,'/log');
INSERT INTO `t_sys_menu` VALUES (49,1,'2019-07-31 22:04:30',1,'2019-06-02 10:25:36','loginLog','views/operation/loginLog/index',0,'logininfor',1,NULL,2,'登录日志',6,'operationMgr','[0],[operationMgr],',NULL,'/loginLog');
INSERT INTO `t_sys_menu` VALUES (50,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','logClear',NULL,0,NULL,0,NULL,3,'清空日志',3,'log','[0],[system],[log],',NULL,'/log/delLog');
INSERT INTO `t_sys_menu` VALUES (51,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','logDetail',NULL,0,NULL,0,NULL,3,'日志详情',3,'log','[0],[system],[log],',NULL,'/log/detail');
INSERT INTO `t_sys_menu` VALUES (52,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','loginLogClear',NULL,0,NULL,0,NULL,3,'清空登录日志',1,'loginLog','[0],[system],[loginLog],',NULL,'/loginLog/delLoginLog');
INSERT INTO `t_sys_menu` VALUES (53,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','loginLogList',NULL,0,NULL,0,NULL,3,'登录日志列表',2,'loginLog','[0],[system],[loginLog],',NULL,'/loginLog/list');
INSERT INTO `t_sys_menu` VALUES (54,1,'2019-06-02 10:10:20',1,'2019-06-02 10:10:20','druid','views/operation/druid/index',0,'monitor',1,NULL,2,'数据库管理',1,'operationMgr','[0],[operationMgr],',NULL,'/druid');
INSERT INTO `t_sys_menu` VALUES (55,1,'2019-06-02 10:10:20',1,'2019-06-02 10:10:20','swagger','views/operation/api/index',0,'swagger',1,NULL,2,'接口文档',2,'operationMgr','[0],[operationMgr],',NULL,'/swagger');
INSERT INTO `t_sys_menu` VALUES (56,1,'2019-06-10 21:26:52',1,'2019-06-10 21:26:52','messageMgr','layout',0,'message',1,NULL,1,'消息管理',4,'0','[0],',NULL,'/message');
INSERT INTO `t_sys_menu` VALUES (57,1,'2019-06-10 21:27:34',1,'2019-06-10 21:27:34','msg','views/message/message/index',0,'message',1,NULL,2,'历史消息',1,'messageMgr','[0],[messageMgr],',NULL,'/history');
INSERT INTO `t_sys_menu` VALUES (58,1,'2019-06-10 21:27:56',1,'2019-06-10 21:27:56','msgTpl','views/message/template/index',0,'template',1,NULL,2,'消息模板',2,'messageMgr','[0],[messageMgr],',NULL,'/template');
INSERT INTO `t_sys_menu` VALUES (59,1,'2019-06-10 21:28:21',1,'2019-06-10 21:28:21','msgSender','views/message/sender/index',0,'sender',1,NULL,2,'消息发送者',3,'messageMgr','[0],[messageMgr],',NULL,'/sender');
INSERT INTO `t_sys_menu` VALUES (60,1,'2019-06-10 21:28:21',1,'2019-06-10 21:28:21','msgClear',NULL,0,NULL,1,NULL,2,'清空历史消息',3,'messageMgr','[0],[messageMgr],',NULL,'/message/clear');
INSERT INTO `t_sys_menu` VALUES (61,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','msgTplEdit',NULL,0,NULL,0,NULL,3,'编辑模板',1,'msgTpl','[0],[messageMgr],[msgTpl]',NULL,'/template/edit');
INSERT INTO `t_sys_menu` VALUES (62,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','msgTplDelete',NULL,0,NULL,0,NULL,3,'删除模板',2,'msgTpl','[0],[messageMgr],[msgTpl]',NULL,'/template/remove');
INSERT INTO `t_sys_menu` VALUES (63,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','msgSenderEdit',NULL,0,NULL,0,NULL,3,'编辑发送器',1,'msgSender','[0],[messageMgr],[msgSender]',NULL,'/sender/edit');
INSERT INTO `t_sys_menu` VALUES (64,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','msgSenderDelete',NULL,0,NULL,0,NULL,3,'删除发送器',2,'msgSender','[0],[messageMgr],[msgSender]',NULL,'/sender/remove');
INSERT INTO `t_sys_menu` VALUES (65,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','fileUpload',NULL,0,NULL,0,NULL,3,'上传文件',1,'file','[0],[cms],[file],',NULL,'/file/upload');
INSERT INTO `t_sys_menu` VALUES (66,1,'2019-07-31 21:51:33',1,'2019-07-31 21:51:33','bannerEdit',NULL,0,NULL,0,NULL,3,'编辑banner',1,'banner','[0],[cms],[banner],',NULL,'/banner/edit');
INSERT INTO `t_sys_menu` VALUES (67,1,'2019-07-31 21:51:33',1,'2019-07-31 21:51:33','bannerDelete',NULL,0,NULL,0,NULL,3,'删除banner',2,'banner','[0],[cms],[banner],',NULL,'/banner/remove');
INSERT INTO `t_sys_menu` VALUES (68,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','channelEdit',NULL,0,NULL,0,NULL,3,'编辑栏目',1,'channel','[0],[cms],[channel],',NULL,'/channel/edit');
INSERT INTO `t_sys_menu` VALUES (69,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','channelDelete',NULL,0,NULL,0,NULL,3,'删除栏目',2,'channel','[0],[cms],[channel],',NULL,'/channel/remove');
INSERT INTO `t_sys_menu` VALUES (70,1,'2019-07-31 22:04:30',1,'2019-07-31 22:04:30','deleteArticle',NULL,0,NULL,0,NULL,3,'删除文章',2,'article','[0],[cms],[article]',NULL,'/article/remove');
INSERT INTO `t_sys_menu` VALUES (71,1,'2020-07-09 15:09:51',1,'2020-07-09 15:09:51','client','layout',0,'peoples',1,NULL,1,'客户管理',5,'0','[0],',NULL,'/client');
INSERT INTO `t_sys_menu` VALUES (72,1,'2020-07-09 15:11:18',1,'2020-07-09 15:11:18','reserveOpenClient','views/client/reserveOpenClient/index',0,'contacts',1,NULL,2,'预约开户',1,'client','[0],[client],',NULL,'/reserveOpenClient');
INSERT INTO `t_sys_menu` VALUES (73,1,'2020-07-15 10:21:04',1,'2020-07-15 10:25:58','openAdd',NULL,0,'null',0,NULL,3,'添加预约信息',1,'reserveOpenClient','[0],[client],[reserveOpenClient],',NULL,'/reserveOpenClient/add');
INSERT INTO `t_sys_menu` VALUES (74,1,'2020-07-15 10:25:38',1,'2020-07-15 10:25:38','openEdit',NULL,0,NULL,0,NULL,3,'修改预约信息',2,'reserveOpenClient','[0],[client],[reserveOpenClient],',NULL,'/reserveOpenClient/edit');
INSERT INTO `t_sys_menu` VALUES (75,1,'2020-07-15 10:27:40',1,'2020-07-15 10:27:40','openDelete',NULL,0,NULL,0,NULL,3,'删除预约信息',3,'reserveOpenClient','[0],[client],[reserveOpenClient],',NULL,'/reserveOpenClient/delete');
INSERT INTO `t_sys_menu` VALUES (76,1,'2020-11-09 08:39:37',1,'2020-11-09 08:39:37','publicity','layout',0,'education',1,NULL,1,'公示管理',6,'0','[0],',NULL,'/publicity');
INSERT INTO `t_sys_menu` VALUES (77,1,'2020-11-09 08:40:50',1,'2020-11-09 08:40:50','margin','views/publicity/margin/index',0,'table0',1,NULL,2,'保证金公示',1,'publicity','[0],[publicity],',NULL,'/margin');
INSERT INTO `t_sys_menu` VALUES (78,1,'2020-11-09 09:22:58',1,'2020-11-09 09:22:58','marginAdd',NULL,0,NULL,0,NULL,3,'添加保证金信息',1,'margin','[0],[publicity],[margin],',NULL,'/publicity/margin/add');
INSERT INTO `t_sys_menu` VALUES (79,1,'2020-11-09 09:23:37',1,'2020-11-09 09:23:37','marginEdit',NULL,0,NULL,0,NULL,3,'修改保证金信息',2,'margin','[0],[publicity],[margin],',NULL,'/publicity/margin/update');
INSERT INTO `t_sys_menu` VALUES (80,1,'2020-11-09 09:24:05',1,'2020-11-09 09:24:05','marginDelete',NULL,0,NULL,0,NULL,3,'删除保证金信息',3,'margin','[0],[publicity],[margin],',NULL,'/publicity/margin/delete');
INSERT INTO `t_sys_menu` VALUES (81,1,'2020-11-24 06:33:15',1,'2020-11-24 06:33:15','specialMarginAdd',NULL,0,NULL,0,NULL,3,'添加特殊合约保证金信息',4,'margin','[0],[publicity],[margin],',NULL,'/publicity/specialmargin/add');
INSERT INTO `t_sys_menu` VALUES (82,1,'2020-11-24 06:34:11',1,'2020-11-24 06:34:11','specialMarginEdit',NULL,0,NULL,0,NULL,3,'修改特殊合约保证金信息',5,'margin','[0],[publicity],[margin],',NULL,'/publicity/specialmargin/update');
INSERT INTO `t_sys_menu` VALUES (83,1,'2020-11-24 06:34:56',1,'2020-11-24 06:34:56','specialMarginDelete',NULL,0,NULL,0,NULL,3,'删除特殊合约保证金信息',6,'margin','[0],[publicity],[margin],',NULL,'/publicity/specialmargin/delete');
INSERT INTO `t_sys_menu` VALUES (84,1,'2020-12-01 03:26:35',1,'2020-12-01 03:26:35','marginExport',NULL,0,NULL,0,NULL,3,'导出保证金信息',7,'margin','[0],[publicity],[margin],',NULL,'/publicity/margin/export');
INSERT INTO `t_sys_menu` VALUES (85,1,'2021-01-27 10:09:40',1,'2021-01-27 10:09:40','riskCalendar','views/publicity/riskCalendar/index',0,'date',1,NULL,2,'风控日历',2,'publicity','[0],[publicity],',NULL,'/riskCalendar');
INSERT INTO `t_sys_menu` VALUES (86,1,'2021-01-27 10:12:13',1,'2021-01-27 10:12:13','riskcalendarAdd',NULL,0,NULL,0,NULL,3,'添加风控日历信息',1,'riskCalendar','[0],[publicity],[riskCalendar],',NULL,'/publicity/riskcalendar/add');
INSERT INTO `t_sys_menu` VALUES (87,1,'2021-01-27 10:12:58',1,'2021-01-27 10:12:58','riskcalendarUpdate',NULL,0,NULL,0,NULL,3,'修改风控日历信息',2,'riskCalendar','[0],[publicity],[riskCalendar],',NULL,'/publicity/riskcalendar/update');
INSERT INTO `t_sys_menu` VALUES (88,1,'2021-01-27 10:13:22',1,'2021-01-27 10:13:22','riskcalendarDelete',NULL,0,NULL,0,NULL,3,'删除风控日历信息',3,'riskCalendar','[0],[publicity],[riskCalendar],',NULL,'/publicity/riskcalendar/delete');
INSERT INTO `t_sys_menu` VALUES (89,1,'2021-02-04 12:03:51',1,'2021-02-04 12:03:51','openExport',NULL,0,NULL,0,NULL,3,'导出预约信息',4,'reserveOpenClient','[0],[client],[reserveOpenClient],',NULL,'/client/reserveopenclient/export');
INSERT INTO `t_sys_menu` VALUES (90,1,'2021-02-22 14:13:05',1,'2021-02-22 14:13:05','game','layout',0,'monitor',1,NULL,1,'实盘大赛管理',7,'0','[0],',NULL,'/game');
INSERT INTO `t_sys_menu` VALUES (91,1,'2021-02-22 14:17:42',1,'2021-02-22 14:17:42','contestant','views/game/contestant/index',0,'user0',1,NULL,2,'报名管理',1,'game','[0],[game],',NULL,'/contestant');
INSERT INTO `t_sys_menu` VALUES (92,1,'2021-02-22 14:19:43',1,'2021-02-22 14:19:43','contestantAdd',NULL,0,NULL,0,NULL,3,'报名添加',1,'contestant','[0],[game],[contestant],',NULL,'/game/contestant/add');
INSERT INTO `t_sys_menu` VALUES (93,1,'2021-02-22 14:20:54',1,'2021-02-22 14:20:54','contestantUpdate',NULL,0,NULL,0,NULL,3,'报名修改',2,'contestant','[0],[game],[contestant],',NULL,'/game/contestant/update');
INSERT INTO `t_sys_menu` VALUES (94,1,'2021-02-22 14:21:43',1,'2021-02-22 14:21:43','contestantDelete',NULL,0,NULL,0,NULL,3,'报名删除',3,'contestant','[0],[game],[contestant],',NULL,'/game/contestant/delete');
INSERT INTO `t_sys_menu` VALUES (95,1,'2021-02-22 14:35:32',1,'2021-02-22 14:35:32','contestantExport',NULL,0,NULL,0,NULL,3,'报名导出',4,'contestant','[0],[game],[contestant],',NULL,'/game/contestant/export');
INSERT INTO `t_sys_menu` VALUES (96,1,'2021-03-25 15:56:26',1,'2021-03-25 15:56:26','importInfo','views/game/importInfo/index',0,'link',1,NULL,2,'结算数据导入',2,'game','[0],[game],',NULL,'/importInfo');
INSERT INTO `t_sys_menu` VALUES (97,1,'2021-03-25 16:09:18',1,'2021-03-25 16:09:47','importInfoUpload',NULL,0,'',0,NULL,3,'结算数据上传',1,'importInfo','[0],[game],[importInfo],',NULL,'/game/importinfo/import');
INSERT INTO `t_sys_menu` VALUES (98,1,'2021-03-25 16:10:26',1,'2021-03-25 16:10:26','importInfoDelete',NULL,0,NULL,0,NULL,3,'结算数据删除',2,'importInfo','[0],[game],[importInfo],',NULL,'/game/importinfo/delete');
INSERT INTO `t_sys_menu` VALUES (99,1,'2021-08-31 15:47:39',1,'2021-08-31 15:48:19','wxChannel','views/cms/wxChannel/index',0,'channel',1,NULL,2,'九宫格管理',6,'cms','[0],[cms],',NULL,'/wxChannel');
INSERT INTO `t_sys_menu` VALUES (100,1,'2021-08-31 15:50:19',1,'2021-08-31 15:50:19','wxChannelAdd',NULL,0,NULL,0,NULL,3,'九宫格增加',1,'wxChannel','[0],[cms],[wxChannel],',NULL,'/cms/wxchannel/add');
INSERT INTO `t_sys_menu` VALUES (101,1,'2021-08-31 15:52:41',1,'2021-08-31 15:52:41','wxChannelUpdate',NULL,0,NULL,0,NULL,3,'九宫格修改',2,'wxChannel','[0],[cms],[wxChannel],',NULL,'/cms/wxchannel/update');
INSERT INTO `t_sys_menu` VALUES (102,1,'2021-08-31 16:01:00',1,'2021-08-31 16:01:00','wxChannelDelete',NULL,0,NULL,0,NULL,3,'九宫格删除',3,'wxChannel','[0],[cms],[wxChannel],',NULL,'/cms/wxchannel/delete');
INSERT INTO `t_sys_menu` VALUES (104,1,'2021-08-31 16:42:29',1,'2021-08-31 16:42:56','wxGoodVoice','views/cms/wxGoodVoice/index',0,'table',1,NULL,2,'中原好声音管理',7,'cms','[0],[cms],',NULL,'/wxGoodVoice');
INSERT INTO `t_sys_menu` VALUES (105,1,'2021-08-31 16:46:28',1,'2021-08-31 16:46:28','wxGoodVoiceAdd',NULL,0,NULL,0,NULL,3,'好声音增加',1,'wxGoodVoice','[0],[cms],[wxGoodVoice],',NULL,'/cms/wxgoodvoice/add');
INSERT INTO `t_sys_menu` VALUES (106,1,'2021-08-31 16:47:39',1,'2021-08-31 16:49:08','wxGoodVoiceUpdate',NULL,0,'',0,NULL,3,'好声音修改',2,'wxGoodVoice','[0],[cms],[wxGoodVoice],',NULL,'/cms/wxgoodvoice/update');
INSERT INTO `t_sys_menu` VALUES (107,1,'2021-08-31 16:48:21',1,'2021-08-31 16:49:14','wxGoodVoiceDelete',NULL,0,'',0,NULL,3,'好声音删除',3,'wxGoodVoice','[0],[cms],[wxGoodVoice],',NULL,'/cms/wxgoodvoice/delete');
INSERT INTO `t_sys_menu` VALUES (108,1,'2021-08-31 16:51:14',1,'2021-09-01 11:25:24','wxArticle','views/cms/wxArticle/index',0,'job',1,NULL,2,'头条文章管理',8,'cms','[0],[cms],',NULL,'/wxArticle');
INSERT INTO `t_sys_menu` VALUES (109,1,'2021-08-31 16:52:39',1,'2021-08-31 16:53:52','wxArticleAdd',NULL,0,'',0,NULL,3,'文章增加',1,'wxArticle','[0],[cms],[wxArticle],',NULL,'/cms/wxarticle/add');
INSERT INTO `t_sys_menu` VALUES (110,1,'2021-08-31 16:54:57',1,'2021-08-31 16:54:57','wxArticleUpdate',NULL,0,NULL,0,NULL,3,'文章修改',2,'wxArticle','[0],[cms],[wxArticle],',NULL,'/cms/wxarticle/update');
INSERT INTO `t_sys_menu` VALUES (111,1,'2021-08-31 16:55:30',1,'2021-08-31 16:55:30','wxarticleDelete',NULL,0,NULL,0,NULL,3,'文章删除',3,'wxArticle','[0],[cms],[wxArticle],',NULL,'/cms/wxarticle/delete');
INSERT INTO `t_sys_menu` VALUES (112,1,'2021-11-29 15:19:16',1,'2021-11-29 15:24:34','research','layout',0,'component',1,NULL,1,'研究中心',8,'0','[0],',NULL,'/research');
INSERT INTO `t_sys_menu` VALUES (113,1,'2021-11-29 15:28:17',1,'2021-11-29 15:28:17','researchContract','views/research/researchContract/index',0,'code',1,NULL,2,'研究品种维护',1,'research','[0],[research],',NULL,'/researchContract');
INSERT INTO `t_sys_menu` VALUES (114,1,'2021-11-29 15:31:36',1,'2021-11-29 15:31:36','researchcontractAdd',NULL,0,NULL,0,NULL,3,'研究品种增加',1,'researchContract','[0],[research],[researchContract],',NULL,'/research/researchcontract/add');
INSERT INTO `t_sys_menu` VALUES (115,1,'2021-11-29 15:40:24',1,'2021-11-29 15:40:24','researchcontractEdit',NULL,0,NULL,0,NULL,3,'研究品种更新',2,'researchContract','[0],[research],[researchContract],',NULL,'/research/researchcontract/update');
INSERT INTO `t_sys_menu` VALUES (116,1,'2021-11-29 15:44:27',1,'2021-11-29 15:44:27','researchcontractDel',NULL,0,NULL,0,NULL,3,'研究品种删除',3,'researchContract','[0],[research],[researchContract],',NULL,'/research/researchcontract/delete');
INSERT INTO `t_sys_menu` VALUES (117,1,'2021-11-29 15:46:43',1,'2021-11-29 15:46:43','reContractField','views/research/reContractField/index',0,'list',1,NULL,2,'品种表列维护',2,'research','[0],[research],',NULL,'/reContractField');
INSERT INTO `t_sys_menu` VALUES (118,1,'2021-11-29 15:47:54',1,'2021-11-29 15:47:54','contractfieldAdd',NULL,0,NULL,0,NULL,3,'品种表列增加',1,'reContractField','[0],[research],[reContractField],',NULL,'/research/contractfield/add');
INSERT INTO `t_sys_menu` VALUES (119,1,'2021-11-29 15:48:27',1,'2021-11-29 15:48:27','contractfieldUpdate',NULL,0,NULL,0,NULL,3,'品种表列更新',2,'reContractField','[0],[research],[reContractField],',NULL,'/research/contractfield/update');
INSERT INTO `t_sys_menu` VALUES (120,1,'2021-11-29 15:48:54',1,'2021-11-29 15:48:54','contractfieldDelete',NULL,0,NULL,0,NULL,3,'品种表列删除',3,'reContractField','[0],[research],[reContractField],',NULL,'/research/contractfield/delete');
INSERT INTO `t_sys_menu` VALUES (121,1,'2021-11-29 15:50:30',1,'2021-11-29 15:50:30','dataDeal','views/research/dataDeal/index',0,'build',1,NULL,2,'品种数据维护',3,'research','[0],[research],',NULL,'/dataDeal');
INSERT INTO `t_sys_menu` VALUES (122,1,'2021-11-30 16:55:46',1,'2021-11-30 16:55:46','dataDealAdd',NULL,0,NULL,0,NULL,3,'品种数据增加',1,'dataDeal','[0],[research],[dataDeal],',NULL,'/research/dataDeal/add');
INSERT INTO `t_sys_menu` VALUES (123,1,'2021-11-30 16:56:15',1,'2021-11-30 16:56:15','dataDealUpdate',NULL,0,NULL,0,NULL,3,'品种数据更新',2,'dataDeal','[0],[research],[dataDeal],',NULL,'/research/dataDeal/update');
INSERT INTO `t_sys_menu` VALUES (124,1,'2021-11-30 16:56:40',1,'2021-11-30 16:56:40','dataDealDelete',NULL,0,NULL,0,NULL,3,'品种数据删除',3,'dataDeal','[0],[research],[dataDeal],',NULL,'/research/dataDeal/delete');
/*!40000 ALTER TABLE `t_sys_menu` ENABLE KEYS */;

--
-- Table structure for table `t_sys_notice`
--

DROP TABLE IF EXISTS `t_sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_notice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `content` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_notice`
--

/*!40000 ALTER TABLE `t_sys_notice` DISABLE KEYS */;
INSERT INTO `t_sys_notice` VALUES (1,1,'2017-01-11 08:53:20',1,'2019-01-08 23:30:58','欢迎使用CBS客户业务后台管理系统','欢迎光临',10);
/*!40000 ALTER TABLE `t_sys_notice` ENABLE KEYS */;

--
-- Table structure for table `t_sys_operation_log`
--

DROP TABLE IF EXISTS `t_sys_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `classname` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `logname` varchar(255) DEFAULT NULL,
  `logtype` varchar(255) DEFAULT NULL,
  `message` text COMMENT '详细信息',
  `method` varchar(255) DEFAULT NULL,
  `succeed` varchar(255) DEFAULT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_operation_log`
--

/*!40000 ALTER TABLE `t_sys_operation_log` DISABLE KEYS */;
INSERT INTO `t_sys_operation_log` VALUES (96,'com.ccfc.cbs.api.controller.system.LogController','2020-09-10 05:40:56','清空业务日志','业务日志','','delLog','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (97,'com.ccfc.cbs.api.controller.system.RoleController','2021-11-29 16:53:04','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,2,41,68,69,42,70,43,66,67,44,45,65,46,99,100,101,102,104,105,106,107,108,109,110,111,3,48,50,51,49,52,53,54,55,56,57,58,61,62,59,63,64,60,71,72,73,74,75,89,76,77,78,79,80,81,82,83,84,85,86,87,88,90,91,92,93,94,95,96,97,98,112,113,114,115,116,117,118,119,120,121,;','setAuthority','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (98,'com.ccfc.cbs.api.controller.research.ResearchContractController','2021-11-30 14:43:37','新增研究品种表','业务日志','tableNameCh=历史基差表;tableDisplay=;marketNo=3;isShow=1;contractName=甲醇;id=;contractCode=MA;tableNameEn=t_research_hisbasis;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (99,'com.ccfc.cbs.api.controller.research.ResearchContractController','2021-11-30 14:44:15','新增研究品种表','业务日志','tableNameCh=跨期价差表;tableDisplay=;marketNo=3;isShow=1;contractName=甲醇;id=;contractCode=MA;tableNameEn=t_research_interspread;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (100,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 14:46:13','新增研究品种列表','业务日志','tableField=businessDate;tableFieldName=业务日期;fieldOrder=1;isShow=1;id=;tableNameEn=t_research_hisbasis;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (101,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 14:46:43','新增研究品种列表','业务日志','tableField=y2016;tableFieldName=2016年;fieldOrder=2;isShow=1;id=;tableNameEn=t_research_hisbasis;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (102,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 14:46:52','新增研究品种列表','业务日志','tableField=y2017;tableFieldName=2017年;fieldOrder=3;isShow=1;id=;tableNameEn=t_research_hisbasis;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (103,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 14:47:02','新增研究品种列表','业务日志','tableField=y2018;tableFieldName=2018年;fieldOrder=4;isShow=1;id=;tableNameEn=t_research_hisbasis;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (104,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 14:47:16','新增研究品种列表','业务日志','tableField=y2019;tableFieldName=2019年;fieldOrder=5;isShow=1;id=;tableNameEn=t_research_hisbasis;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (105,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 14:47:27','新增研究品种列表','业务日志','tableField=y2020;tableFieldName=2020年;fieldOrder=6;isShow=1;id=;tableNameEn=t_research_hisbasis;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (106,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 14:47:36','新增研究品种列表','业务日志','tableField=y2021;tableFieldName=2021年;fieldOrder=7;isShow=1;id=;tableNameEn=t_research_hisbasis;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (107,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:47:17','新增研究品种列表','业务日志','tableField=businessDate;tableFieldName=业务日期;fieldOrder=1;isShow=1;id=;tableNameEn=t_research_interspread;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (108,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:47:51','新增研究品种列表','业务日志','tableField=m17011705;tableFieldName=1701-1705;fieldOrder=2;isShow=1;id=;tableNameEn=t_research_interspread;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (109,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:48:16','新增研究品种列表','业务日志','tableField=m_1801_1805;tableFieldName=1801-1805;fieldOrder=3;isShow=1;id=;tableNameEn=t_research_interspread;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (110,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:48:34','新增研究品种列表','业务日志','tableField=m_1901_1905;tableFieldName=1901-1905;fieldOrder=4;isShow=1;id=;tableNameEn=t_research_interspread;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (111,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:49:00','更新研究品种列表','业务日志','tableField=m18011805;tableFieldName=1801-1805;fieldOrder=3;isShow=true;id=10;tableNameEn=t_research_interspread;','update','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (112,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:49:08','更新研究品种列表','业务日志','tableField=m19011905;tableFieldName=1901-1905;fieldOrder=4;isShow=true;id=11;tableNameEn=t_research_interspread;','update','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (113,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:49:33','更新研究品种列表','业务日志','tableField=m20012005;tableFieldName=2001-2005;fieldOrder=5;isShow=1;id=11;tableNameEn=t_research_interspread;','update','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (114,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:50:05','更新研究品种列表','业务日志','tableField=m19011905;tableFieldName=1901-1905;fieldOrder=4;isShow=true;id=11;tableNameEn=t_research_interspread;','update','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (115,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:50:31','更新研究品种列表','业务日志','tableField=m20012005;tableFieldName=2001-2005;fieldOrder=5;isShow=true;id=11;tableNameEn=t_research_interspread;','update','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (116,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:51:17','更新研究品种列表','业务日志','tableField=m19011905;tableFieldName=1901-1905;fieldOrder=4;isShow=true;id=11;tableNameEn=t_research_interspread;','update','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (117,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:51:41','新增研究品种列表','业务日志','tableField=m20012005;tableFieldName=2001-2005;fieldOrder=5;isShow=1;id=;tableNameEn=t_research_interspread;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (118,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:51:57','新增研究品种列表','业务日志','tableField=m21012105;tableFieldName=2101-2105;fieldOrder=6;isShow=1;id=;tableNameEn=t_research_interspread;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (119,'com.ccfc.cbs.api.controller.research.ReContractFieldController','2021-11-30 16:52:11','新增研究品种列表','业务日志','tableField=m22012205;tableFieldName=2201-2205;fieldOrder=7;isShow=1;id=;tableNameEn=t_research_interspread;','add','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (120,'com.ccfc.cbs.api.controller.system.MenuController','2021-11-30 16:55:46','编辑菜单','业务日志','name=品种数据增加;;;','save','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (121,'com.ccfc.cbs.api.controller.system.MenuController','2021-11-30 16:56:15','编辑菜单','业务日志','name=品种数据更新;;;','save','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (122,'com.ccfc.cbs.api.controller.system.MenuController','2021-11-30 16:56:40','编辑菜单','业务日志','name=品种数据删除;;;','save','成功',1);
INSERT INTO `t_sys_operation_log` VALUES (123,'com.ccfc.cbs.api.controller.system.RoleController','2021-11-30 16:56:49','配置角色权限','业务日志','roleId=1;permissions=1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,28,29,32,22,25,26,27,30,31,33,34,35,36,37,38,39,40,47,2,41,68,69,42,70,43,66,67,44,45,65,46,99,100,101,102,104,105,106,107,108,109,110,111,3,48,50,51,49,52,53,54,55,56,57,58,61,62,59,63,64,60,71,72,73,74,75,89,76,77,78,79,80,81,82,83,84,85,86,87,88,90,91,92,93,94,95,96,97,98,112,113,114,115,116,117,118,119,120,121,122,123,124,;','setAuthority','成功',1);
/*!40000 ALTER TABLE `t_sys_operation_log` ENABLE KEYS */;

--
-- Table structure for table `t_sys_relation`
--

DROP TABLE IF EXISTS `t_sys_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menuid` bigint DEFAULT NULL,
  `roleid` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1507 DEFAULT CHARSET=utf8 COMMENT='菜单角色关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_relation`
--

/*!40000 ALTER TABLE `t_sys_relation` DISABLE KEYS */;
INSERT INTO `t_sys_relation` VALUES (216,71,2);
INSERT INTO `t_sys_relation` VALUES (217,72,2);
INSERT INTO `t_sys_relation` VALUES (218,74,2);
INSERT INTO `t_sys_relation` VALUES (294,71,3);
INSERT INTO `t_sys_relation` VALUES (295,72,3);
INSERT INTO `t_sys_relation` VALUES (296,74,3);
INSERT INTO `t_sys_relation` VALUES (546,76,4);
INSERT INTO `t_sys_relation` VALUES (547,77,4);
INSERT INTO `t_sys_relation` VALUES (548,78,4);
INSERT INTO `t_sys_relation` VALUES (549,79,4);
INSERT INTO `t_sys_relation` VALUES (550,80,4);
INSERT INTO `t_sys_relation` VALUES (551,81,4);
INSERT INTO `t_sys_relation` VALUES (552,82,4);
INSERT INTO `t_sys_relation` VALUES (553,83,4);
INSERT INTO `t_sys_relation` VALUES (554,84,4);
INSERT INTO `t_sys_relation` VALUES (555,85,4);
INSERT INTO `t_sys_relation` VALUES (556,86,4);
INSERT INTO `t_sys_relation` VALUES (557,87,4);
INSERT INTO `t_sys_relation` VALUES (558,88,4);
INSERT INTO `t_sys_relation` VALUES (1384,1,1);
INSERT INTO `t_sys_relation` VALUES (1385,4,1);
INSERT INTO `t_sys_relation` VALUES (1386,5,1);
INSERT INTO `t_sys_relation` VALUES (1387,6,1);
INSERT INTO `t_sys_relation` VALUES (1388,7,1);
INSERT INTO `t_sys_relation` VALUES (1389,8,1);
INSERT INTO `t_sys_relation` VALUES (1390,9,1);
INSERT INTO `t_sys_relation` VALUES (1391,10,1);
INSERT INTO `t_sys_relation` VALUES (1392,11,1);
INSERT INTO `t_sys_relation` VALUES (1393,12,1);
INSERT INTO `t_sys_relation` VALUES (1394,13,1);
INSERT INTO `t_sys_relation` VALUES (1395,14,1);
INSERT INTO `t_sys_relation` VALUES (1396,15,1);
INSERT INTO `t_sys_relation` VALUES (1397,16,1);
INSERT INTO `t_sys_relation` VALUES (1398,17,1);
INSERT INTO `t_sys_relation` VALUES (1399,18,1);
INSERT INTO `t_sys_relation` VALUES (1400,19,1);
INSERT INTO `t_sys_relation` VALUES (1401,20,1);
INSERT INTO `t_sys_relation` VALUES (1402,21,1);
INSERT INTO `t_sys_relation` VALUES (1403,23,1);
INSERT INTO `t_sys_relation` VALUES (1404,24,1);
INSERT INTO `t_sys_relation` VALUES (1405,28,1);
INSERT INTO `t_sys_relation` VALUES (1406,29,1);
INSERT INTO `t_sys_relation` VALUES (1407,32,1);
INSERT INTO `t_sys_relation` VALUES (1408,22,1);
INSERT INTO `t_sys_relation` VALUES (1409,25,1);
INSERT INTO `t_sys_relation` VALUES (1410,26,1);
INSERT INTO `t_sys_relation` VALUES (1411,27,1);
INSERT INTO `t_sys_relation` VALUES (1412,30,1);
INSERT INTO `t_sys_relation` VALUES (1413,31,1);
INSERT INTO `t_sys_relation` VALUES (1414,33,1);
INSERT INTO `t_sys_relation` VALUES (1415,34,1);
INSERT INTO `t_sys_relation` VALUES (1416,35,1);
INSERT INTO `t_sys_relation` VALUES (1417,36,1);
INSERT INTO `t_sys_relation` VALUES (1418,37,1);
INSERT INTO `t_sys_relation` VALUES (1419,38,1);
INSERT INTO `t_sys_relation` VALUES (1420,39,1);
INSERT INTO `t_sys_relation` VALUES (1421,40,1);
INSERT INTO `t_sys_relation` VALUES (1422,47,1);
INSERT INTO `t_sys_relation` VALUES (1423,2,1);
INSERT INTO `t_sys_relation` VALUES (1424,41,1);
INSERT INTO `t_sys_relation` VALUES (1425,68,1);
INSERT INTO `t_sys_relation` VALUES (1426,69,1);
INSERT INTO `t_sys_relation` VALUES (1427,42,1);
INSERT INTO `t_sys_relation` VALUES (1428,70,1);
INSERT INTO `t_sys_relation` VALUES (1429,43,1);
INSERT INTO `t_sys_relation` VALUES (1430,66,1);
INSERT INTO `t_sys_relation` VALUES (1431,67,1);
INSERT INTO `t_sys_relation` VALUES (1432,44,1);
INSERT INTO `t_sys_relation` VALUES (1433,45,1);
INSERT INTO `t_sys_relation` VALUES (1434,65,1);
INSERT INTO `t_sys_relation` VALUES (1435,46,1);
INSERT INTO `t_sys_relation` VALUES (1436,99,1);
INSERT INTO `t_sys_relation` VALUES (1437,100,1);
INSERT INTO `t_sys_relation` VALUES (1438,101,1);
INSERT INTO `t_sys_relation` VALUES (1439,102,1);
INSERT INTO `t_sys_relation` VALUES (1440,104,1);
INSERT INTO `t_sys_relation` VALUES (1441,105,1);
INSERT INTO `t_sys_relation` VALUES (1442,106,1);
INSERT INTO `t_sys_relation` VALUES (1443,107,1);
INSERT INTO `t_sys_relation` VALUES (1444,108,1);
INSERT INTO `t_sys_relation` VALUES (1445,109,1);
INSERT INTO `t_sys_relation` VALUES (1446,110,1);
INSERT INTO `t_sys_relation` VALUES (1447,111,1);
INSERT INTO `t_sys_relation` VALUES (1448,3,1);
INSERT INTO `t_sys_relation` VALUES (1449,48,1);
INSERT INTO `t_sys_relation` VALUES (1450,50,1);
INSERT INTO `t_sys_relation` VALUES (1451,51,1);
INSERT INTO `t_sys_relation` VALUES (1452,49,1);
INSERT INTO `t_sys_relation` VALUES (1453,52,1);
INSERT INTO `t_sys_relation` VALUES (1454,53,1);
INSERT INTO `t_sys_relation` VALUES (1455,54,1);
INSERT INTO `t_sys_relation` VALUES (1456,55,1);
INSERT INTO `t_sys_relation` VALUES (1457,56,1);
INSERT INTO `t_sys_relation` VALUES (1458,57,1);
INSERT INTO `t_sys_relation` VALUES (1459,58,1);
INSERT INTO `t_sys_relation` VALUES (1460,61,1);
INSERT INTO `t_sys_relation` VALUES (1461,62,1);
INSERT INTO `t_sys_relation` VALUES (1462,59,1);
INSERT INTO `t_sys_relation` VALUES (1463,63,1);
INSERT INTO `t_sys_relation` VALUES (1464,64,1);
INSERT INTO `t_sys_relation` VALUES (1465,60,1);
INSERT INTO `t_sys_relation` VALUES (1466,71,1);
INSERT INTO `t_sys_relation` VALUES (1467,72,1);
INSERT INTO `t_sys_relation` VALUES (1468,73,1);
INSERT INTO `t_sys_relation` VALUES (1469,74,1);
INSERT INTO `t_sys_relation` VALUES (1470,75,1);
INSERT INTO `t_sys_relation` VALUES (1471,89,1);
INSERT INTO `t_sys_relation` VALUES (1472,76,1);
INSERT INTO `t_sys_relation` VALUES (1473,77,1);
INSERT INTO `t_sys_relation` VALUES (1474,78,1);
INSERT INTO `t_sys_relation` VALUES (1475,79,1);
INSERT INTO `t_sys_relation` VALUES (1476,80,1);
INSERT INTO `t_sys_relation` VALUES (1477,81,1);
INSERT INTO `t_sys_relation` VALUES (1478,82,1);
INSERT INTO `t_sys_relation` VALUES (1479,83,1);
INSERT INTO `t_sys_relation` VALUES (1480,84,1);
INSERT INTO `t_sys_relation` VALUES (1481,85,1);
INSERT INTO `t_sys_relation` VALUES (1482,86,1);
INSERT INTO `t_sys_relation` VALUES (1483,87,1);
INSERT INTO `t_sys_relation` VALUES (1484,88,1);
INSERT INTO `t_sys_relation` VALUES (1485,90,1);
INSERT INTO `t_sys_relation` VALUES (1486,91,1);
INSERT INTO `t_sys_relation` VALUES (1487,92,1);
INSERT INTO `t_sys_relation` VALUES (1488,93,1);
INSERT INTO `t_sys_relation` VALUES (1489,94,1);
INSERT INTO `t_sys_relation` VALUES (1490,95,1);
INSERT INTO `t_sys_relation` VALUES (1491,96,1);
INSERT INTO `t_sys_relation` VALUES (1492,97,1);
INSERT INTO `t_sys_relation` VALUES (1493,98,1);
INSERT INTO `t_sys_relation` VALUES (1494,112,1);
INSERT INTO `t_sys_relation` VALUES (1495,113,1);
INSERT INTO `t_sys_relation` VALUES (1496,114,1);
INSERT INTO `t_sys_relation` VALUES (1497,115,1);
INSERT INTO `t_sys_relation` VALUES (1498,116,1);
INSERT INTO `t_sys_relation` VALUES (1499,117,1);
INSERT INTO `t_sys_relation` VALUES (1500,118,1);
INSERT INTO `t_sys_relation` VALUES (1501,119,1);
INSERT INTO `t_sys_relation` VALUES (1502,120,1);
INSERT INTO `t_sys_relation` VALUES (1503,121,1);
INSERT INTO `t_sys_relation` VALUES (1504,122,1);
INSERT INTO `t_sys_relation` VALUES (1505,123,1);
INSERT INTO `t_sys_relation` VALUES (1506,124,1);
/*!40000 ALTER TABLE `t_sys_relation` ENABLE KEYS */;

--
-- Table structure for table `t_sys_role`
--

DROP TABLE IF EXISTS `t_sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `deptid` bigint DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `num` int DEFAULT NULL,
  `pid` bigint DEFAULT NULL,
  `tips` varchar(64) DEFAULT NULL COMMENT '角色编码',
  `version` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_role`
--

/*!40000 ALTER TABLE `t_sys_role` DISABLE KEYS */;
INSERT INTO `t_sys_role` VALUES (1,NULL,NULL,1,'2020-07-09 17:14:51',15,'超级管理员',1,0,'administrator',NULL);
INSERT INTO `t_sys_role` VALUES (2,1,'2020-07-15 10:16:43',1,'2020-07-15 10:16:43',NULL,'开户岗',2,0,'open_post',NULL);
INSERT INTO `t_sys_role` VALUES (3,1,'2020-09-10 05:39:04',1,'2020-09-10 05:39:04',29,'开户管理岗',1,0,'open_admin',NULL);
INSERT INTO `t_sys_role` VALUES (4,1,'2021-02-02 09:57:00',1,'2021-02-02 09:57:00',NULL,'风控测试角色',1,0,'risk_test',NULL);
/*!40000 ALTER TABLE `t_sys_role` ENABLE KEYS */;

--
-- Table structure for table `t_sys_task`
--

DROP TABLE IF EXISTS `t_sys_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `concurrent` tinyint DEFAULT NULL COMMENT '是否允许并发',
  `cron` varchar(50) DEFAULT NULL COMMENT '定时规则',
  `data` text COMMENT '执行参数',
  `disabled` tinyint DEFAULT NULL COMMENT '是否禁用',
  `exec_at` datetime DEFAULT NULL COMMENT '执行时间',
  `exec_result` text COMMENT '执行结果',
  `job_class` varchar(255) DEFAULT NULL COMMENT '执行类',
  `job_group` varchar(50) DEFAULT NULL COMMENT '任务组名',
  `name` varchar(50) DEFAULT NULL COMMENT '任务名',
  `note` varchar(255) DEFAULT NULL COMMENT '任务说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_task`
--

/*!40000 ALTER TABLE `t_sys_task` DISABLE KEYS */;
INSERT INTO `t_sys_task` VALUES (1,1,'2018-12-28 09:54:00',-1,'2021-11-30 16:30:00',0,'0 0/30 * * * ?','{\n\"appname\": \"cbs\",\n\"version\":1\n}\n            \n            \n            \n            \n            \n            \n            \n            \n            \n            \n            \n            ',0,'2021-11-30 16:30:00','执行成功','com.ccfc.cbs.service.task.job.HelloJob','default','测试任务','测试任务,每30分钟执行一次');
INSERT INTO `t_sys_task` VALUES (2,1,'2021-04-01 13:54:32',1,'2021-04-06 15:29:26',0,'0 0 22 * * ?','{\n\"appname\": \"cbs\",\n\"version\":1,\n\"importDate\": \"\"\n}',1,'2021-03-31 17:05:00','执行成功','com.ccfc.cbs.service.task.job.GameCalJob',NULL,'实盘大赛结算数据导入和计算','每天晚上22点进行计算');
INSERT INTO `t_sys_task` VALUES (3,1,'2021-04-06 14:58:52',1,'2021-04-06 15:27:46',0,'0 0/5 * * * ?','{\n\"appname\": \"cbs\",\n\"version\":1,\n\"importDate\": \"20210331\"\n}',1,'2021-04-06 15:25:00','执行成功','com.ccfc.cbs.service.task.job.GameCalJob',NULL,'实盘大赛结算数据补录','默认关闭，开启后每五分执行；\n开启前请修改上传要补录的结算文件夹日期和执行参数中指定的导入日期；');
/*!40000 ALTER TABLE `t_sys_task` ENABLE KEYS */;

--
-- Table structure for table `t_sys_task_log`
--

DROP TABLE IF EXISTS `t_sys_task_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_task_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `exec_at` datetime DEFAULT NULL COMMENT '执行时间',
  `exec_success` int DEFAULT NULL COMMENT '执行结果（成功:1、失败:0)',
  `id_task` bigint DEFAULT NULL,
  `job_exception` varchar(500) DEFAULT NULL COMMENT '抛出异常',
  `name` varchar(50) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='定时任务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_task_log`
--

/*!40000 ALTER TABLE `t_sys_task_log` DISABLE KEYS */;
INSERT INTO `t_sys_task_log` VALUES (1,'2021-01-27 16:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (2,'2021-11-29 17:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (3,'2021-11-29 17:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (4,'2021-11-29 18:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (5,'2021-11-29 18:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (6,'2021-11-29 19:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (7,'2021-11-29 19:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (8,'2021-11-29 20:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (9,'2021-11-29 20:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (10,'2021-11-29 21:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (11,'2021-11-29 21:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (12,'2021-11-29 22:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (13,'2021-11-29 22:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (14,'2021-11-29 23:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (15,'2021-11-29 23:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (16,'2021-11-30 00:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (17,'2021-11-30 00:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (18,'2021-11-30 01:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (19,'2021-11-30 01:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (20,'2021-11-30 02:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (21,'2021-11-30 02:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (22,'2021-11-30 03:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (23,'2021-11-30 03:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (24,'2021-11-30 04:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (25,'2021-11-30 04:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (26,'2021-11-30 05:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (27,'2021-11-30 05:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (28,'2021-11-30 06:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (29,'2021-11-30 06:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (30,'2021-11-30 07:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (31,'2021-11-30 07:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (32,'2021-11-30 08:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (33,'2021-11-30 08:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (34,'2021-11-30 09:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (35,'2021-11-30 09:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (36,'2021-11-30 10:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (37,'2021-11-30 10:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (38,'2021-11-30 11:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (39,'2021-11-30 11:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (40,'2021-11-30 12:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (41,'2021-11-30 12:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (42,'2021-11-30 13:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (43,'2021-11-30 13:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (44,'2021-11-30 14:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (45,'2021-11-30 14:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (46,'2021-11-30 15:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (47,'2021-11-30 15:30:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (48,'2021-11-30 16:00:00',1,1,NULL,'测试任务');
INSERT INTO `t_sys_task_log` VALUES (49,'2021-11-30 16:30:00',1,1,NULL,'测试任务');
/*!40000 ALTER TABLE `t_sys_task_log` ENABLE KEYS */;

--
-- Table structure for table `t_sys_user`
--

DROP TABLE IF EXISTS `t_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `account` varchar(32) DEFAULT NULL COMMENT '账户',
  `avatar` varchar(64) DEFAULT NULL COMMENT '头像',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `deptid` bigint DEFAULT NULL COMMENT '部门id',
  `email` varchar(64) DEFAULT NULL COMMENT 'email',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `phone` varchar(16) DEFAULT NULL COMMENT '手机号',
  `roleid` varchar(128) DEFAULT NULL COMMENT '角色id列表，以逗号分隔',
  `salt` varchar(16) DEFAULT NULL COMMENT '密码盐',
  `sex` int DEFAULT NULL COMMENT '性别:1:男,2:女',
  `status` int DEFAULT NULL COMMENT '状态1:启用,2:禁用',
  `version` int DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='账号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_sys_user`
--

/*!40000 ALTER TABLE `t_sys_user` DISABLE KEYS */;
INSERT INTO `t_sys_user` VALUES (-1,NULL,'2016-01-29 08:49:53',1,'2019-03-20 23:45:24','system',NULL,NULL,NULL,NULL,'应用系统',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `t_sys_user` VALUES (1,NULL,'2016-01-29 08:49:53',1,'2020-07-09 16:58:06','admin',NULL,'2020-06-14',15,'shibaoliang521@qq.com','超级管理员','b5a51391f271f062867e5984e2fcffee','13720246582','1','8pgby',1,1,2);
INSERT INTO `t_sys_user` VALUES (2,NULL,'2018-09-13 17:21:02',1,'2020-07-09 16:58:54','developer',NULL,'2020-06-14',15,'shibaoliang521@qq.com','网站管理员','fac36d5616fe9ebd460691264b28ee27','','1,','vscp9',1,2,NULL);
INSERT INTO `t_sys_user` VALUES (3,1,'2020-07-15 10:44:35',1,'2020-09-10 05:40:38','opentest',NULL,'2020-07-15',20,'shibaoliang521@outlook.com','开户岗测试用户','4cc0bcb74320cd9e0cf60a49c4a004ee','13711112222','2,','zphph',1,2,NULL);
INSERT INTO `t_sys_user` VALUES (4,1,'2021-02-02 09:57:47',1,'2021-02-02 09:57:51','risk_test',NULL,NULL,10,'risk_test@qq.com','风控测试','b796d5de0269a3e395ae7380d1d2f9bc',NULL,'4,','yupnf',1,1,NULL);
/*!40000 ALTER TABLE `t_sys_user` ENABLE KEYS */;

--
-- Table structure for table `t_test_boy`
--

DROP TABLE IF EXISTS `t_test_boy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_test_boy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `age` int DEFAULT NULL COMMENT '年龄',
  `birthday` varchar(12) DEFAULT NULL COMMENT '生日',
  `has_girl_friend` tinyint DEFAULT NULL COMMENT '是否有女朋友',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='男孩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_test_boy`
--

/*!40000 ALTER TABLE `t_test_boy` DISABLE KEYS */;
INSERT INTO `t_test_boy` VALUES (1,NULL,NULL,NULL,NULL,18,'2000-01-01',1,'张三');
/*!40000 ALTER TABLE `t_test_boy` ENABLE KEYS */;

--
-- Table structure for table `t_test_girl`
--

DROP TABLE IF EXISTS `t_test_girl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_test_girl` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间/注册时间',
  `modify_by` bigint DEFAULT NULL COMMENT '最后更新人',
  `modify_time` datetime DEFAULT NULL COMMENT '最后更新时间',
  `age` int DEFAULT NULL COMMENT '年龄',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `has_boy_friend` tinyint DEFAULT NULL COMMENT '是否有男朋友',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='女孩';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_test_girl`
--

/*!40000 ALTER TABLE `t_test_girl` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_test_girl` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-30 16:59:37
