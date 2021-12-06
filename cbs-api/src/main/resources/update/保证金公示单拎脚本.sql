
-- 2020.11.17
-- shibl
-- 保证金公示功能升级单拎脚本

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='保证金公示信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_publicity_margin`
--

-- 添加交易所数据字典
INSERT INTO `t_sys_dict` VALUES (77,1,'2020-11-10 02:19:29',1,'2020-11-10 02:19:29','期货交易所编号','0',0,NULL);
INSERT INTO `t_sys_dict` VALUES (78,1,'2020-11-10 02:19:29',1,'2020-11-10 02:19:29','上海期货交易所','1',77,NULL);
INSERT INTO `t_sys_dict` VALUES (79,1,'2020-11-10 02:19:29',1,'2020-11-10 02:19:29','大连商品交易所','2',77,NULL);
INSERT INTO `t_sys_dict` VALUES (80,1,'2020-11-10 02:19:29',1,'2020-11-10 02:19:29','郑州商品交易所','3',77,NULL);
INSERT INTO `t_sys_dict` VALUES (81,1,'2020-11-10 02:19:29',1,'2020-11-10 02:19:29','中国金融期货交易所','4',77,NULL);
INSERT INTO `t_sys_dict` VALUES (82,1,'2020-11-10 02:33:10',1,'2020-11-10 02:33:10','上海国际能源交易中心','5',77,NULL);

-- 添加菜单
INSERT INTO `t_sys_menu` VALUES (76,1,'2020-11-09 08:39:37',1,'2020-11-09 08:39:37','publicity','layout',0,'education',1,NULL,1,'公示管理',6,'0','[0],',NULL,'/publicity');
INSERT INTO `t_sys_menu` VALUES (77,1,'2020-11-09 08:40:50',1,'2020-11-09 08:40:50','margin','views/publicity/margin/index',0,'table0',1,NULL,2,'保证金公示',1,'publicity','[0],[publicity],',NULL,'/margin');
INSERT INTO `t_sys_menu` VALUES (78,1,'2020-11-09 09:22:58',1,'2020-11-09 09:22:58','marginAdd',NULL,0,NULL,0,NULL,3,'添加保证金信息',1,'margin','[0],[publicity],[margin],',NULL,'/publicity/margin/add');
INSERT INTO `t_sys_menu` VALUES (79,1,'2020-11-09 09:23:37',1,'2020-11-09 09:23:37','marginEdit',NULL,0,NULL,0,NULL,3,'修改保证金信息',2,'margin','[0],[publicity],[margin],',NULL,'/publicity/margin/update');
INSERT INTO `t_sys_menu` VALUES (80,1,'2020-11-09 09:24:05',1,'2020-11-09 09:24:05','marginDelete',NULL,0,NULL,0,NULL,3,'删除保证金信息',3,'margin','[0],[publicity],[margin],',NULL,'/publicity/margin/delete');