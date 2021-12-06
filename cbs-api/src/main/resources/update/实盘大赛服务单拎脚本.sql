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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='结算数据导入信息表';
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


INSERT INTO `t_sys_menu` VALUES (96,1,'2021-03-25 15:56:26',1,'2021-03-25 15:56:26','importInfo','views/game/importInfo/index',0,'link',1,NULL,2,'结算数据导入',2,'game','[0],[game],',NULL,'/importInfo');
INSERT INTO `t_sys_menu` VALUES (97,1,'2021-03-25 16:09:18',1,'2021-03-25 16:09:47','importInfoUpload',NULL,0,'',0,NULL,3,'结算数据上传',1,'importInfo','[0],[game],[importInfo],',NULL,'/game/importinfo/import');
INSERT INTO `t_sys_menu` VALUES (98,1,'2021-03-25 16:10:26',1,'2021-03-25 16:10:26','importInfoDelete',NULL,0,NULL,0,NULL,3,'结算数据删除',2,'importInfo','[0],[game],[importInfo],',NULL,'/game/importinfo/delete');
INSERT INTO `t_sys_menu` VALUES (99,1,'2021-06-01 10:05:31',1,'2021-06-01 10:05:31','importInfoCal',NULL,0,NULL,0,NULL,3,'结算数据计算',3,'importInfo','[0],[game],[importInfo],',NULL,'/game/importinfo/cal');

INSERT INTO `t_sys_menu` VALUES (100, 1, '2021-06-03 15:00:49', 1, '2021-06-03 15:00:49', 'batchAdd', null, 0, null, 0, null, 3, '批量增删特殊合约', 8, 'margin', '[0],[publicity],[margin],', null, '/publicity/margin/batch');

INSERT INTO `t_sys_task` VALUES (2, 1, '2021-04-01 13:54:32', 1, '2021-04-06 15:29:26', 0, '0 0 22 * * ?', '{\n\"appname\": \"cbs\",\n\"version\":1,\n\"importDate\": \"\"\n}', 1, '2021-03-31 17:05:00', '执行成功', 'com.ccfc.cbs.service.task.job.GameCalJob', NULL, '实盘大赛结算数据导入和计算', '每天晚上22点进行计算');
INSERT INTO `t_sys_task` VALUES (3, 1, '2021-04-06 14:58:52', 1, '2021-04-06 15:27:46', 0, '0 0/5 * * * ?', '{\n\"appname\": \"cbs\",\n\"version\":1,\n\"importDate\": \"20210331\"\n}', 1, '2021-04-06 15:25:00', '执行成功', 'com.ccfc.cbs.service.task.job.GameCalJob', NULL, '实盘大赛结算数据补录', '默认关闭，开启后每五分执行；\n开启前请修改上传要补录的结算文件夹日期和执行参数中指定的导入日期；');