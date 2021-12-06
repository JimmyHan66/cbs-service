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
  `risk_date` date DEFAULT NULL COMMENT '风险提示日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='风控日历';
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `t_sys_menu` VALUES (85,1,'2021-01-27 10:09:40',1,'2021-01-27 10:09:40','riskCalendar','views/publicity/riskCalendar/index',0,'date',1,NULL,2,'风控日历',2,'publicity','[0],[publicity],',NULL,'/riskCalendar');
INSERT INTO `t_sys_menu` VALUES (86,1,'2021-01-27 10:12:13',1,'2021-01-27 10:12:13','riskcalendarAdd',NULL,0,NULL,0,NULL,3,'添加风控日历信息',1,'riskCalendar','[0],[publicity],[riskCalendar],',NULL,'/publicity/riskcalendar/add');
INSERT INTO `t_sys_menu` VALUES (87,1,'2021-01-27 10:12:58',1,'2021-01-27 10:12:58','riskcalendarUpdate',NULL,0,NULL,0,NULL,3,'修改风控日历信息',2,'riskCalendar','[0],[publicity],[riskCalendar],',NULL,'/publicity/riskcalendar/update');
INSERT INTO `t_sys_menu` VALUES (88,1,'2021-01-27 10:13:22',1,'2021-01-27 10:13:22','riskcalendarDelete',NULL,0,NULL,0,NULL,3,'删除风控日历信息',3,'riskCalendar','[0],[publicity],[riskCalendar],',NULL,'/publicity/riskcalendar/delete');

/* 预约开户信息导出功能按钮 */
INSERT INTO `t_sys_menu` VALUES (89, 1, '2021-02-04 12:03:51', 1, '2021-02-04 12:03:51', 'openExport', null, 0, null, 0, null, 3, '导出预约信息', 4, 'reserveOpenClient', '[0],[client],[reserveOpenClient],', null, '/client/reserveopenclient/export');