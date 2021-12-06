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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='实盘大赛参赛者信息';
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `t_sys_menu` VALUES (90,1,'2021-02-22 14:13:05',1,'2021-02-22 14:13:05','game','layout',0,'monitor',1,NULL,1,'实盘大赛管理',7,'0','[0],',NULL,'/game');
INSERT INTO `t_sys_menu` VALUES (91,1,'2021-02-22 14:17:42',1,'2021-02-22 14:17:42','contestant','views/game/contestant/index',0,'user0',1,NULL,2,'报名管理',1,'game','[0],[game],',NULL,'/contestant');
INSERT INTO `t_sys_menu` VALUES (92,1,'2021-02-22 14:19:43',1,'2021-02-22 14:19:43','contestantAdd',NULL,0,NULL,0,NULL,3,'报名添加',1,'contestant','[0],[game],[contestant],',NULL,'/game/contestant/add');
INSERT INTO `t_sys_menu` VALUES (93,1,'2021-02-22 14:20:54',1,'2021-02-22 14:20:54','contestantUpdate',NULL,0,NULL,0,NULL,3,'报名修改',2,'contestant','[0],[game],[contestant],',NULL,'/game/contestant/update');
INSERT INTO `t_sys_menu` VALUES (94,1,'2021-02-22 14:21:43',1,'2021-02-22 14:21:43','contestantDelete',NULL,0,NULL,0,NULL,3,'报名删除',3,'contestant','[0],[game],[contestant],',NULL,'/game/contestant/delete');
INSERT INTO `t_sys_menu` VALUES (95,1,'2021-02-22 14:35:32',1,'2021-02-22 14:35:32','contestantExport',NULL,0,NULL,0,NULL,3,'报名导出',4,'contestant','[0],[game],[contestant],',NULL,'/game/contestant/export');
