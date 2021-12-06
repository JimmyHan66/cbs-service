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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='研究品种表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_research_researchcontract`
--

/*!40000 ALTER TABLE `t_research_researchcontract` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_research_researchcontract` ENABLE KEYS */;

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
  `table_field_db` varchar(64) DEFAULT NULL COMMENT '列数据库名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='研究品种列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_research_contractfield`
--

/*!40000 ALTER TABLE `t_research_contractfield` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史基差表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_research_hisbasis`
--

/*!40000 ALTER TABLE `t_research_hisbasis` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='跨期价差表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_research_interspread`
--

/*!40000 ALTER TABLE `t_research_interspread` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_research_interspread` ENABLE KEYS */;



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

