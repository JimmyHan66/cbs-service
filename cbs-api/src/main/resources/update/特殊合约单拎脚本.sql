
-- 2020.12.04
-- shibl
-- 保证金公示支持特殊合约单拎脚本


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='特殊保证金公示信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_publicity_specialmargin`
--

-- 添加菜单
INSERT INTO `t_sys_menu` VALUES (81,1,'2020-11-24 06:33:15',1,'2020-11-24 06:33:15','specialMarginAdd',NULL,0,NULL,0,NULL,3,'添加特殊合约保证金信息',4,'margin','[0],[publicity],[margin],',NULL,'/publicity/specialmargin/add');
INSERT INTO `t_sys_menu` VALUES (82,1,'2020-11-24 06:34:11',1,'2020-11-24 06:34:11','specialMarginEdit',NULL,0,NULL,0,NULL,3,'修改特殊合约保证金信息',5,'margin','[0],[publicity],[margin],',NULL,'/publicity/specialmargin/update');
INSERT INTO `t_sys_menu` VALUES (83,1,'2020-11-24 06:34:56',1,'2020-11-24 06:34:56','specialMarginDelete',NULL,0,NULL,0,NULL,3,'删除特殊合约保证金信息',6,'margin','[0],[publicity],[margin],',NULL,'/publicity/specialmargin/delete');
INSERT INTO `t_sys_menu` VALUES (84,1,'2020-12-01 03:26:35',1,'2020-12-01 03:26:35','marginExport',NULL,0,NULL,0,NULL,3,'导出保证金信息',7,'margin','[0],[publicity],[margin],',NULL,'/publicity/margin/export');


