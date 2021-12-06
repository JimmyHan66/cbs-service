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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微官网中原好声音';
/*!40101 SET character_set_client = @saved_cs_client */;


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
