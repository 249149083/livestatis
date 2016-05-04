-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: 60.28.204.157    Database: livestatis
-- ------------------------------------------------------
-- Server version	5.5.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Module_Channel`
--

DROP TABLE IF EXISTS `Module_Channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Module_Channel` (
  `dtime` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '日期',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `version` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '版本',
  `platform` char(5) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `channel_list` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '渠道列表',
  UNIQUE KEY `dtime_c_p` (`dtime`,`channel`,`platform`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Module_Channel`
--

LOCK TABLES `Module_Channel` WRITE;
/*!40000 ALTER TABLE `Module_Channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `Module_Channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Module_Recharge`
--

DROP TABLE IF EXISTS `Module_Recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Module_Recharge` (
  `dtime` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '日期',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `platform` char(5) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `activation_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '激活设备数',
  `active_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活跃设备数',
  `register_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册用户数',
  `login_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录用户数',
  `device_recharge_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值设备数',
  `device_recharge_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '设备充值金额',
  `user_recharge_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值用户数',
  `user_recharge_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户充值金额',
  `per_recharge_money` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '人均充值金额',
  UNIQUE KEY `dtime_c_p` (`dtime`,`channel`,`platform`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Module_Recharge`
--

LOCK TABLES `Module_Recharge` WRITE;
/*!40000 ALTER TABLE `Module_Recharge` DISABLE KEYS */;
INSERT INTO `Module_Recharge` VALUES ('2016-01-01','1','ip',123,34,5435,4545,4545,565,766,7878,654654),('2016-01-02','1','ip',123,34,5435,4545,4545,565,766,7878,654654),('2016-01-03','1','ip',123,34,5435,4545,4545,565,766,7878,654654),('2016-01-02','1','ar',1213,374,54135,4545,4545,565,766,7878,654654),('2016-01-03','2','ar',1233,354,543235,4545,4545,565,766,7878,654654),('2016-01-03','1','ar',123,34,5435,4545,4545,565,766,7878,654654),('2016-01-05','1','ip',123,34,5435,4545,4545,565,766,7878,654654),('2016-01-04','2','ip',12123,324,54355,4545,4545,565,766,7878,654654),('2016-01-06','1','ar',123,34,5435,4545,4545,565,766,7878,654654),('2016-01-08','1','ar',123,34,5435,4545,4545,565123,7661,7878,654654),('2016-01-02','3','ar',1213,374,54135,4545,4545,565,766,7878,654654),('2016-01-09','4','ip',123,34,5435,4545,4545,565,766,7878,654654),('2016-01-08','2','ar',123,34,5435,4545,4545,565,766,7878,654654);
/*!40000 ALTER TABLE `Module_Recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Module_Retention`
--

DROP TABLE IF EXISTS `Module_Retention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Module_Retention` (
  `dtime` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '日期',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `version` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '版本',
  `platform` char(5) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `retentionuser_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '留存用户',
  `newuser_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增用户',
  `retentionuser_rate` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '留存用户率',
  UNIQUE KEY `dtime_c_p` (`dtime`,`channel`,`platform`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Module_Retention`
--

LOCK TABLES `Module_Retention` WRITE;
/*!40000 ALTER TABLE `Module_Retention` DISABLE KEYS */;
/*!40000 ALTER TABLE `Module_Retention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Module_Terminal`
--

DROP TABLE IF EXISTS `Module_Terminal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Module_Terminal` (
  `dtime` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '日期',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `version` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '版本',
  `platform` char(5) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `device_terminal` int(50) unsigned NOT NULL DEFAULT '0' COMMENT '设备终端',
  `network_operation` int(50) unsigned NOT NULL DEFAULT '0' COMMENT '网络及运营商',
  `region` int(50) unsigned NOT NULL DEFAULT '0' COMMENT '地域',
  UNIQUE KEY `dtime_c_p` (`dtime`,`channel`,`platform`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Module_Terminal`
--

LOCK TABLES `Module_Terminal` WRITE;
/*!40000 ALTER TABLE `Module_Terminal` DISABLE KEYS */;
/*!40000 ALTER TABLE `Module_Terminal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Module_User`
--

DROP TABLE IF EXISTS `Module_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Module_User` (
  `dtime` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '日期',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `version` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '版本',
  `platform` char(5) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `newuser_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '新增用户',
  `active_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活跃用户',
  UNIQUE KEY `dtime_c_p` (`dtime`,`channel`,`platform`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Module_User`
--

LOCK TABLES `Module_User` WRITE;
/*!40000 ALTER TABLE `Module_User` DISABLE KEYS */;
/*!40000 ALTER TABLE `Module_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_groups`
--

DROP TABLE IF EXISTS `admin_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) NOT NULL DEFAULT '' COMMENT '组名',
  `node_type` int(11) NOT NULL DEFAULT '3',
  `operator` varchar(256) NOT NULL DEFAULT '' COMMENT '操作人',
  `description` text NOT NULL COMMENT '备注',
  `old_id` int(11) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx` (`groupname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_groups`
--

LOCK TABLES `admin_groups` WRITE;
/*!40000 ALTER TABLE `admin_groups` DISABLE KEYS */;
INSERT INTO `admin_groups` VALUES (1,'后台开发组',3,'','后台开发组',0,'2016-02-25 06:41:11','0000-00-00 00:00:00'),(2,'商务组',3,'','商务组',0,'2016-02-25 06:19:57','0000-00-00 00:00:00'),(4,'产品',3,'','',0,'2016-02-27 11:14:26','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `admin_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_modules`
--

DROP TABLE IF EXISTS `admin_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT '模块名称',
  `module_cn` varchar(64) NOT NULL DEFAULT '' COMMENT '模块中文名称',
  `action` varchar(64) NOT NULL DEFAULT '' COMMENT '模块子项',
  `action_cn` varchar(64) NOT NULL DEFAULT '' COMMENT '模块子项中文名称',
  `module_type` int(1) NOT NULL DEFAULT '0' COMMENT '模块类型,0:不绑定资产;1:绑定资产',
  `description` text NOT NULL COMMENT '模块描述',
  `order_by` int(11) NOT NULL DEFAULT '0',
  `gname` varchar(64) NOT NULL DEFAULT '' COMMENT '模块子项组名',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入时间',
  `column_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx` (`module`,`action`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_modules`
--

LOCK TABLES `admin_modules` WRITE;
/*!40000 ALTER TABLE `admin_modules` DISABLE KEYS */;
INSERT INTO `admin_modules` VALUES (1,'personal','个人中心','profile','个人中心',0,'',101,'','2016-02-18 05:14:35','0000-00-00 00:00:00',1),(2,'personal','个人中心','changepw','修改密码',0,'',102,'','2016-02-18 05:15:30','0000-00-00 00:00:00',1),(3,'user','用户管理','account','用户列表',0,'',1101,'','2016-02-18 05:21:31','0000-00-00 00:00:00',2),(4,'user','用户管理','group','组管理',0,'',1102,'','2016-02-18 05:22:11','0000-00-00 00:00:00',2),(5,'privilege','权限管理','role','角色列表',0,'',1201,'','2016-02-20 07:36:43','0000-00-00 00:00:00',2),(6,'privilege','权限管理','grant','赋予/回收角色',0,'',1202,'','2016-02-20 07:37:39','0000-00-00 00:00:00',2),(7,'privilege','权限管理','view','查看权限',0,'',1203,'','2016-02-20 07:38:12','0000-00-00 00:00:00',2),(8,'module','后台设置','modulelist','模块列表',0,'',1301,'','2016-02-27 06:23:05','0000-00-00 00:00:00',2),(12,'channel','渠道数据','recharge','渠道充值',0,'',2101,'','2016-03-26 04:16:50','0000-00-00 00:00:00',3),(13,'channel','渠道数据','user','用户分析',0,'',2102,'','2016-03-26 04:24:02','0000-00-00 00:00:00',3),(14,'channel','渠道数据','retention','留存分析',0,'',2103,'','2016-03-26 04:25:16','0000-00-00 00:00:00',3),(15,'channel','渠道数据','channel','渠道分析',0,'',2104,'','2016-03-26 04:26:02','0000-00-00 00:00:00',3),(16,'channel','渠道数据','terminal','终端',0,'',2105,'','2016-03-26 04:26:40','0000-00-00 00:00:00',3),(27,'operation','运营数据','user','用户',0,'',3001,'','2016-03-30 04:26:59','0000-00-00 00:00:00',4);
/*!40000 ALTER TABLE `admin_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission` varchar(64) NOT NULL DEFAULT '' COMMENT '权限名称',
  `module_id` int(11) NOT NULL DEFAULT '0' COMMENT '模块ID',
  `node_id` int(11) NOT NULL DEFAULT '0' COMMENT '资产ID(box_id or service_id)',
  `node_type` int(1) NOT NULL DEFAULT '0' COMMENT '资产类型,0:非资产ID,1:box,2:service',
  `description` text NOT NULL COMMENT '权限描述',
  `operator` varchar(256) NOT NULL DEFAULT '' COMMENT '操作人/创建人',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,1,'',1,0,0,'','','2016-02-20 04:35:18','0000-00-00 00:00:00'),(2,1,'',2,0,0,'','','2016-02-20 04:35:25','0000-00-00 00:00:00'),(3,1,'',3,0,0,'','','2016-02-20 04:35:26','0000-00-00 00:00:00'),(4,1,'',4,0,0,'','','2016-02-20 04:35:30','0000-00-00 00:00:00'),(5,2,'',1,0,0,'','','2016-02-20 04:35:46','0000-00-00 00:00:00'),(6,2,'',2,0,0,'','','2016-02-26 09:41:20','0000-00-00 00:00:00'),(7,1,'',5,0,0,'','','2016-02-20 07:46:52','0000-00-00 00:00:00'),(8,1,'',6,0,0,'','','2016-02-20 07:46:56','0000-00-00 00:00:00'),(9,1,'',7,0,0,'','','2016-02-20 07:47:05','0000-00-00 00:00:00'),(10,1,'',8,0,0,'','','2016-02-20 07:47:19','0000-00-00 00:00:00'),(17,1,'',12,0,0,'','','2016-03-05 07:15:37','0000-00-00 00:00:00'),(20,1,'',13,0,0,'','','2016-03-05 07:33:41','0000-00-00 00:00:00'),(21,1,'',14,0,0,'','','2016-03-05 07:33:41','0000-00-00 00:00:00'),(22,1,'',15,0,0,'','','2016-03-05 07:33:42','0000-00-00 00:00:00'),(23,1,'',16,0,0,'','','2016-03-05 07:33:42','0000-00-00 00:00:00'),(34,1,'',27,0,0,'','','2016-03-30 04:26:41','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(64) NOT NULL DEFAULT '' COMMENT '角色名称',
  `owner` varchar(64) NOT NULL DEFAULT '' COMMENT '角色属主',
  `description` text NOT NULL COMMENT '角色描述',
  `operator` varchar(256) NOT NULL DEFAULT '' COMMENT '操作人/创建人',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'admin','admin','系统管理员','','2013-12-23 05:37:33','0000-00-00 00:00:00'),(2,'default','admin','普通用户','','2014-04-11 11:01:41','0000-00-00 00:00:00'),(3,'权限管理','runqin.yuan','权限管理','','2016-02-26 06:52:02','0000-00-00 00:00:00'),(6,'test','runqin.yuan','','','2016-03-16 11:36:29','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_top_column`
--

DROP TABLE IF EXISTS `admin_top_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_top_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `order_by` tinyint(1) NOT NULL,
  `sub` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `uri` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_top_column`
--

LOCK TABLES `admin_top_column` WRITE;
/*!40000 ALTER TABLE `admin_top_column` DISABLE KEYS */;
INSERT INTO `admin_top_column` VALUES (1,'个人中心',1,0,'personal'),(2,'后台管理',2,1,''),(3,'渠道数据',3,0,'channel'),(4,'运营数据',4,0,'operation');
/*!40000 ALTER TABLE `admin_top_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_group`
--

DROP TABLE IF EXISTS `admin_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT 'User ID',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Group ID',
  `is_leader` int(1) NOT NULL DEFAULT '0' COMMENT '是否组长;0:不是,1:是',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx` (`user_id`,`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_group`
--

LOCK TABLES `admin_user_group` WRITE;
/*!40000 ALTER TABLE `admin_user_group` DISABLE KEYS */;
INSERT INTO `admin_user_group` VALUES (1,1,1,0,'2016-02-25 12:16:52','0000-00-00 00:00:00'),(2,2,1,0,'2016-02-23 05:44:27','0000-00-00 00:00:00'),(6,9,1,0,'2016-02-25 10:10:05','0000-00-00 00:00:00'),(7,10,1,0,'2016-04-12 09:12:45','0000-00-00 00:00:00'),(8,11,4,0,'2016-02-27 11:14:37','0000-00-00 00:00:00'),(9,12,1,1,'2016-04-12 09:13:17','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `admin_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_role`
--

DROP TABLE IF EXISTS `admin_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `operator` varchar(256) NOT NULL DEFAULT '' COMMENT '操作人/创建人',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx` (`role_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_role`
--

LOCK TABLES `admin_user_role` WRITE;
/*!40000 ALTER TABLE `admin_user_role` DISABLE KEYS */;
INSERT INTO `admin_user_role` VALUES (1,1,1,'','2016-02-19 23:46:20','0000-00-00 00:00:00'),(2,2,1,'','2016-02-19 23:46:32','0000-00-00 00:00:00'),(3,2,9,'','2016-02-24 03:50:11','0000-00-00 00:00:00'),(4,2,10,'','2016-02-25 07:53:06','0000-00-00 00:00:00'),(5,2,2,'','2016-02-26 12:35:14','0000-00-00 00:00:00'),(9,2,11,'','2016-02-27 11:13:17','0000-00-00 00:00:00'),(10,1,11,'','2016-02-27 11:14:54','0000-00-00 00:00:00'),(11,1,2,'','2016-03-12 08:06:46','0000-00-00 00:00:00'),(12,1,9,'','2016-03-12 08:06:52','0000-00-00 00:00:00'),(13,1,10,'','2016-03-12 08:06:55','0000-00-00 00:00:00'),(14,2,12,'','2016-03-15 10:48:38','0000-00-00 00:00:00'),(15,1,12,'','2016-03-15 10:49:06','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `admin_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(64) NOT NULL DEFAULT '' COMMENT '昵称或显示名',
  `password` varchar(256) NOT NULL DEFAULT '' COMMENT '密码',
  `pwdmd5` varchar(256) NOT NULL DEFAULT '' COMMENT '密码MD5',
  `mobile` varchar(64) NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(256) NOT NULL DEFAULT '' COMMENT '电邮',
  `last` datetime NOT NULL DEFAULT '1970-01-01 00:00:01' COMMENT '上次登录时间',
  `last_ip` varchar(256) NOT NULL DEFAULT '' COMMENT '上次登录ip',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '用户状态(0,无效;1:有效)',
  `operator` varchar(256) NOT NULL DEFAULT '' COMMENT '操作人',
  `start_page` varchar(256) NOT NULL DEFAULT '',
  `remember_token` varchar(100) NOT NULL DEFAULT '',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加入时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uidx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'runqin.yuan','苑润琴','$2y$10$.93QF3AitTSlhszaTJ.20.S5Zeez3tntr/q7US5wY6Z8tntADaycS','','18611510488','runqin.yuan@kuwo.cn','1970-01-01 00:00:01','111.207.202.9',1,'','','kn4ZZf0jTloThFw1WJhz9kma6Iayx523j5q7lmCxaoYhEsM2Sgk7uZtYiDXP','2016-04-11 06:36:50','0000-00-00 00:00:00'),(2,'kang.wang','王抗','$2y$10$ihsukqZ3t2NPEIcgbMieD.46SDCGmXdltkq/jQPVmEjHa8hWTTK.6','','123456789','kang.wang@kuwo.cn','1970-01-01 00:00:01','111.207.202.3',1,'','channel#recharge','szq8MSRekKatpaiRHLi49SreTj86aIf77T7kbHTeehyX5Ify3iepP358w84a','2016-03-30 10:09:43','0000-00-00 00:00:00'),(9,'cheng.tao','陶成','$2y$10$zcoYmbPZZLnbPYw58MiY7OqHI58tkyiIoCn0heVtzS8nE0H2vPb5W','','2312313','cheng.tao@kuwo.cn','1970-01-01 00:00:01','111.207.202.9',0,'','','g0HjcqAbxKKImgI0AyfVvFAKlorN8LiQE4CYzKmcQNHDAzU8icjtWlgWWewU','2016-02-29 03:04:46','2016-02-24 03:50:11'),(10,'fan.zhang','张帆','$2y$10$ywO4YMjP3sFdDtFGFICs6u7CwxJ0C/130gceMVhPxBy.LhHGBsR4q','','9999999','fan.zhang@kuwo.cn','1970-01-01 00:00:01','111.207.202.9',1,'','','QiB1h3BjFqbSllUdUTSogiE2NIR4liYzc5n5DyiS9uythKMs2liWWTbrcfPI','2016-02-29 03:05:02','0000-00-00 00:00:00'),(11,'bing.shen','沈冰','$2y$10$e9rdq0BvDl8w8g4P2JdpkeIWq1aPJ.FIjRk2eGC7d9DCitPA8SScS','','','bing.shen@kuwo.cn','1970-01-01 00:00:01','111.207.202.9',1,'','','FA6M8Xt5q2FUBcgGSKSsKJbfk6jAf1FisdLsYsqP8gAEsIxkb92wy8xFU3qa','2016-03-03 02:46:00','0000-00-00 00:00:00'),(12,'kai.cui','崔凯','$2y$10$YV7poijNDaO9Or5ARMShbuT1pwy1GXnw2/niRKWaHOZ6HqFIbh46a','','18801122456','kai.cui@kuwo.cn','1970-01-01 00:00:01','111.207.202.4',1,'','channel#recharge','P0upLC3Rl8pbHU3x36xzoHrvpoQfXEdzSbPJVwgX4xWzufb7rH3XR9cYbLRv','2016-04-12 09:29:06','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_genter`
--

DROP TABLE IF EXISTS `id_genter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `id_genter` (
  `iid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `obj` varchar(100) NOT NULL DEFAULT '' COMMENT '表名',
  `id` bigint(11) unsigned NOT NULL DEFAULT '1' COMMENT '表最大ID',
  `step` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '增长值 默认1',
  `ctime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`iid`),
  UNIQUE KEY `obj` (`obj`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_genter`
--

LOCK TABLES `id_genter` WRITE;
/*!40000 ALTER TABLE `id_genter` DISABLE KEYS */;
INSERT INTO `id_genter` VALUES (1,'user_info',0,1,'2016-01-28 08:20:54'),(2,'user_play',6979,1,'2016-03-19 08:32:20'),(3,'user_focus',551,1,'2016-03-04 02:18:15'),(4,'present',0,1,'2016-02-03 07:01:25'),(5,'present_lv',0,1,'2016-02-01 10:04:13'),(6,'user_outpresent',14546,1,'2016-03-03 12:40:22'),(7,'user_presentdays',676,1,'2016-03-19 08:30:19'),(8,'user_scorelist',8568,1,'2016-03-19 08:28:39'),(9,'user_level',0,1,'2016-02-01 10:05:08'),(10,'user_consume',379,1,'2016-03-04 11:54:28'),(11,'user_report',51,1,'2016-03-19 03:45:04'),(12,'user_banned',156,1,'2016-03-19 03:45:40'),(13,'user_shielding',390,1,'2016-03-19 08:28:27'),(14,'user_feedback',50,1,'2016-03-19 03:40:57'),(15,'user_picture',373,1,'2016-03-18 15:12:49'),(16,'user_play_file',2438,1,'2016-03-19 08:29:23'),(17,'user_contract',40,1,'2016-03-18 07:16:43'),(18,'user_goods',176,1,'2016-03-19 06:51:18'),(19,'shoplist',0,1,'2016-03-18 07:20:42');
/*!40000 ALTER TABLE `id_genter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `notice_obj` tinyint(1) NOT NULL DEFAULT '0' COMMENT '通知对象 用户表中的identity',
  `timing` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '定时时间',
  `created_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '创建用户ID',
  `updated_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '修改用户ID',
  `ctime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `utime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0 正常 1 删除',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='发布通知';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'a','a',0,'0000-00-00 00:00:00',1,1,'2016-03-14 08:20:02','2016-03-14 10:13:05',1),(2,'a','a',1,'0000-00-00 00:00:00',1,1,'2016-03-14 08:20:45','2016-03-14 08:20:45',0),(3,'b','b',2,'2016-03-15 08:20:00',1,1,'2016-03-14 08:21:49','2016-03-14 10:15:15',1),(4,'b','b',2,'2016-03-15 08:20:00',1,1,'2016-03-14 08:21:59','2016-03-14 08:21:59',0);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_conf`
--

DROP TABLE IF EXISTS `static_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `host_id` varchar(20) NOT NULL,
  `extra` varchar(255) DEFAULT '',
  `tablename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_conf`
--

LOCK TABLES `static_conf` WRITE;
/*!40000 ALTER TABLE `static_conf` DISABLE KEYS */;
INSERT INTO `static_conf` VALUES (1,'渠道充值统计','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','渠道统计:文档4-9',NULL),(2,'渠道充值统计（注册渠道部分）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','渠道统计:文档10-12 , 这里的渠道指的是注册渠道',NULL),(3,'1，2，3，4，5，6，7，14，30日留存统计（渠道）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','留存分析：文档19',NULL),(4,'1，2，3，4，5，6，7，14，30日留存统计（版本）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','留存分析：文档19',NULL),(5,'终端类型统计（版本）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档25',NULL),(6,'终端类型统计(渠道）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档25',NULL),(7,'终端网络设备，运营商统计(渠道）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档26',NULL),(8,'终端网络设备，运营商统计（版本）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档26',NULL),(9,'终端登录地域统计（版本）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档27',NULL),(10,'终端登录地域统计(渠道）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档27',NULL);
/*!40000 ALTER TABLE `static_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_conf.bak20160414`
--

DROP TABLE IF EXISTS `static_conf.bak20160414`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_conf.bak20160414` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `host_id` varchar(20) NOT NULL,
  `extra` varchar(255) DEFAULT '',
  `tablename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_conf.bak20160414`
--

LOCK TABLES `static_conf.bak20160414` WRITE;
/*!40000 ALTER TABLE `static_conf.bak20160414` DISABLE KEYS */;
INSERT INTO `static_conf.bak20160414` VALUES (1,'渠道充值统计','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','渠道统计:文档4-9',NULL),(2,'渠道充值统计（注册渠道部分）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','渠道统计:文档10-12 , 这里的渠道指的是注册渠道',NULL),(3,'1，2，3，4，5，6，7，14，30日留存统计（渠道）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','留存分析：文档19',NULL),(4,'1，2，3，4，5，6，7，14，30日留存统计（版本）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','留存分析：文档19',NULL),(5,'终端类型统计（版本）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档25',NULL),(6,'终端类型统计(渠道）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档25',NULL),(7,'终端网络设备，运营商统计(渠道）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档26',NULL),(8,'终端网络设备，运营商统计（版本）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档26',NULL),(9,'终端登录地域统计（版本）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档27',NULL),(10,'终端登录地域统计(渠道）','/home/logstat/livestatis/etl2hive/count.py','103.252.204.181','终端:统计：文档27',NULL);
/*!40000 ALTER TABLE `static_conf.bak20160414` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statis_1`
--

DROP TABLE IF EXISTS `statis_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statis_1` (
  `dtime` datetime NOT NULL COMMENT '日期',
  `platform` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `activation_num` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '激活设备数',
  `active_num` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '活跃设备数',
  `device_recharge_num` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '充值设备数',
  `device_recharge_money` double(11,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '设备充值金额',
  `register_num` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册用户数',
  `login_num` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '登录用户数',
  UNIQUE KEY `dtime_c_p` (`dtime`,`platform`,`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statis_1`
--

LOCK TABLES `statis_1` WRITE;
/*!40000 ALTER TABLE `statis_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `statis_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statis_10`
--

DROP TABLE IF EXISTS `statis_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statis_10` (
  `dtime` datetime NOT NULL COMMENT '日期',
  `platform` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '版本',
  `province` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '城市',
  `event_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '个数',
  `user_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  `event_cnt_per_user` double(11,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '人均',
  PRIMARY KEY (`dtime`,`platform`,`channel`,`province`,`city`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statis_10`
--

LOCK TABLES `statis_10` WRITE;
/*!40000 ALTER TABLE `statis_10` DISABLE KEYS */;
/*!40000 ALTER TABLE `statis_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statis_2`
--

DROP TABLE IF EXISTS `statis_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statis_2` (
  `dtime` datetime NOT NULL COMMENT '日期',
  `platform` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道(这个渠道特别注意， 这个是用户注册渠道）',
  `user_recharge_money` double(11,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '注册渠道充值钱数',
  `user_recharge_num` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '注册渠道充值人数',
  `per_recharge_money` double(11,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '注册渠道人均充值数',
  PRIMARY KEY (`dtime`,`platform`,`channel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statis_2`
--

LOCK TABLES `statis_2` WRITE;
/*!40000 ALTER TABLE `statis_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `statis_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statis_3`
--

DROP TABLE IF EXISTS `statis_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statis_3` (
  `dtime` datetime NOT NULL COMMENT '日期',
  `delta` int(11) NOT NULL,
  `platform` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `retention_users` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  `new_install_users` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '个数',
  `retention_rate` double(11,6) unsigned NOT NULL DEFAULT '0.000000',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`dtime`,`platform`,`channel`,`delta`),
  KEY `crteate_time_idx` (`create_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statis_3`
--

LOCK TABLES `statis_3` WRITE;
/*!40000 ALTER TABLE `statis_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `statis_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statis_4`
--

DROP TABLE IF EXISTS `statis_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statis_4` (
  `dtime` datetime NOT NULL COMMENT '日期',
  `delta` int(11) NOT NULL,
  `platform` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `version` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '版本',
  `retention_users` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  `new_install_users` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '个数',
  `retention_rate` double(11,6) unsigned NOT NULL DEFAULT '0.000000',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`dtime`,`platform`,`version`,`delta`),
  KEY `create_time_idx` (`create_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statis_4`
--

LOCK TABLES `statis_4` WRITE;
/*!40000 ALTER TABLE `statis_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `statis_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statis_5`
--

DROP TABLE IF EXISTS `statis_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statis_5` (
  `dtime` datetime NOT NULL COMMENT '日期',
  `platform` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `version` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `dev` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '终端类型',
  `event_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '个数',
  `user_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  `event_cnt_per_user` double(11,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '人均',
  PRIMARY KEY (`dtime`,`platform`,`version`,`dev`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statis_5`
--

LOCK TABLES `statis_5` WRITE;
/*!40000 ALTER TABLE `statis_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `statis_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statis_6`
--

DROP TABLE IF EXISTS `statis_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statis_6` (
  `dtime` datetime NOT NULL COMMENT '日期',
  `platform` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `dev` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '终端类型',
  `event_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '个数',
  `user_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  `event_cnt_per_user` double(11,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '人均',
  PRIMARY KEY (`dtime`,`platform`,`channel`,`dev`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statis_6`
--

LOCK TABLES `statis_6` WRITE;
/*!40000 ALTER TABLE `statis_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `statis_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statis_7`
--

DROP TABLE IF EXISTS `statis_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statis_7` (
  `dtime` datetime NOT NULL COMMENT '日期',
  `platform` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `channel` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `isp` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '运营商',
  `net` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '网络类型',
  `event_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '个数',
  `user_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  `event_cnt_per_user` double(11,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '人均',
  PRIMARY KEY (`dtime`,`platform`,`channel`,`isp`,`net`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statis_7`
--

LOCK TABLES `statis_7` WRITE;
/*!40000 ALTER TABLE `statis_7` DISABLE KEYS */;
/*!40000 ALTER TABLE `statis_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statis_8`
--

DROP TABLE IF EXISTS `statis_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statis_8` (
  `dtime` datetime NOT NULL COMMENT '日期',
  `platform` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `version` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `isp` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '运营商',
  `net` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '网络类型',
  `event_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '个数',
  `user_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  `event_cnt_per_user` double(11,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '人均',
  PRIMARY KEY (`dtime`,`platform`,`version`,`isp`,`net`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statis_8`
--

LOCK TABLES `statis_8` WRITE;
/*!40000 ALTER TABLE `statis_8` DISABLE KEYS */;
/*!40000 ALTER TABLE `statis_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statis_9`
--

DROP TABLE IF EXISTS `statis_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statis_9` (
  `dtime` datetime NOT NULL COMMENT '日期',
  `platform` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '平台',
  `version` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '渠道',
  `province` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '城市',
  `event_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '个数',
  `user_cnt` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '人数',
  `event_cnt_per_user` double(11,6) unsigned NOT NULL DEFAULT '0.000000' COMMENT '人均',
  PRIMARY KEY (`dtime`,`platform`,`version`,`province`,`city`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statis_9`
--

LOCK TABLES `statis_9` WRITE;
/*!40000 ALTER TABLE `statis_9` DISABLE KEYS */;
/*!40000 ALTER TABLE `statis_9` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-18 15:27:38
