-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: ry-vue
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

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
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_rec`
--

DROP TABLE IF EXISTS `activity_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_rec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  `time` int DEFAULT NULL,
  `comm` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_rec`
--

LOCK TABLES `activity_rec` WRITE;
/*!40000 ALTER TABLE `activity_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advisors`
--

DROP TABLE IF EXISTS `advisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advisors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advisors`
--

LOCK TABLES `advisors` WRITE;
/*!40000 ALTER TABLE `advisors` DISABLE KEYS */;
/*!40000 ALTER TABLE `advisors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendancy_rec`
--

DROP TABLE IF EXISTS `attendancy_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendancy_rec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `course_name` varchar(30) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  `canceled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendancy_rec`
--

LOCK TABLES `attendancy_rec` WRITE;
/*!40000 ALTER TABLE `attendancy_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendancy_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendancy_score`
--

DROP TABLE IF EXISTS `attendancy_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendancy_score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendancy_score`
--

LOCK TABLES `attendancy_score` WRITE;
/*!40000 ALTER TABLE `attendancy_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendancy_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory_area`
--

DROP TABLE IF EXISTS `dormitory_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory_area` (
  `id` int NOT NULL AUTO_INCREMENT,
  `p_id` int DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory_area`
--

LOCK TABLES `dormitory_area` WRITE;
/*!40000 ALTER TABLE `dormitory_area` DISABLE KEYS */;
INSERT INTO `dormitory_area` VALUES (1,0,101,'和园（C 区）'),(2,1,103,'C1'),(3,2,101,'C1-204'),(4,2,103,'C1-205'),(5,2,101,'C1-206');
/*!40000 ALTER TABLE `dormitory_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory_managers`
--

DROP TABLE IF EXISTS `dormitory_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory_managers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `dormitory_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory_managers`
--

LOCK TABLES `dormitory_managers` WRITE;
/*!40000 ALTER TABLE `dormitory_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dormitory_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory_rec`
--

DROP TABLE IF EXISTS `dormitory_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory_rec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  `canceled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory_rec`
--

LOCK TABLES `dormitory_rec` WRITE;
/*!40000 ALTER TABLE `dormitory_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `dormitory_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory_score`
--

DROP TABLE IF EXISTS `dormitory_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory_score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory_score`
--

LOCK TABLES `dormitory_score` WRITE;
/*!40000 ALTER TABLE `dormitory_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `dormitory_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (4,'advisors','辅导员',NULL,NULL,'Advisors','crud','com.ruoyi.advisors','advisors','advisors','辅导员管理','ruoyi','0','/','{\"parentMenuId\":1}','admin','2022-12-27 15:09:06','','2022-12-27 15:11:23',NULL),(5,'students','学生',NULL,NULL,'Students','crud','com.ruoyi.students','students','students','学生管理','ruoyi','0','/','{\"parentMenuId\":\"1\"}','admin','2022-12-27 15:09:06','','2022-12-29 15:25:31',NULL),(6,'teachers','教师',NULL,NULL,'Teachers','crud','com.ruoyi.teachers','teachers','teachers','教师管理','ruoyi','0','/','{\"parentMenuId\":1}','admin','2022-12-27 15:09:06','','2022-12-27 15:23:06',NULL),(7,'dormitory_area','宿舍区域','','','DormitoryArea','tree','com.ruoyi.dormitory_area','dormitory_area','dormitory_area','宿舍区域管理','ruoyi','0','/','{\"treeCode\":\"id\",\"treeName\":\"name\",\"treeParentCode\":\"p_id\",\"parentMenuId\":\"1\"}','admin','2022-12-28 16:20:37','','2022-12-29 13:47:36',NULL),(8,'activity_rec','活动参与',NULL,NULL,'ActivityRec','crud','com.ruoyi.activity_rec','activity_rec','activity_rec','活动参与记录','ruoyi','0','/','{\"parentMenuId\":1}','admin','2022-12-29 12:01:05','','2022-12-29 16:20:59',NULL),(9,'attendancy_rec','考勤扣分记录',NULL,NULL,'AttendancyRec','crud','com.ruoyi.attendancy_rec','attendancy_rec','attendancy_rec','考勤扣分记录','ruoyi','0','/','{\"parentMenuId\":1}','admin','2022-12-29 12:01:05','','2022-12-29 16:29:29',NULL),(10,'attendancy_score','考勤扣分项',NULL,NULL,'AttendancyScore','crud','com.ruoyi.attendancy_score','attendancy_score','attendancy_score','考勤扣分项管理','ruoyi','0','/','{\"parentMenuId\":1}','admin','2022-12-29 12:01:05','','2022-12-29 17:52:04',NULL),(11,'dormitory_managers','宿管',NULL,NULL,'DormitoryManagers','crud','com.ruoyi.dormitory_managers','dormitory_managers','dormitory_managers','宿管管理','ruoyi','0','/','{\"parentMenuId\":1}','admin','2022-12-29 12:01:05','','2022-12-29 18:00:34',NULL),(12,'dormitory_rec','宿舍扣分记录',NULL,NULL,'DormitoryRec','crud','com.ruoyi.dormitory_rec','dormitory_rec','dormitory_rec','宿舍扣分记录','ruoyi','0','/','{\"parentMenuId\":\"1\"}','admin','2022-12-29 12:01:05','','2022-12-29 16:28:01',NULL),(13,'dormitory_score','宿舍扣分项',NULL,NULL,'DormitoryScore','crud','com.ruoyi.dormitory_score','dormitory_score','dormitory_score','宿舍扣分项管理','ruoyi','0','/','{\"parentMenuId\":1}','admin','2022-12-29 12:01:05','','2022-12-29 17:53:18',NULL),(14,'others_rec','其它扣分记录',NULL,NULL,'OthersRec','crud','com.ruoyi.others_rec','others_rec','others_rec','其它扣分记录','ruoyi','0','/','{\"parentMenuId\":1}','admin','2022-12-29 12:01:05','','2022-12-29 16:25:17',NULL),(15,'others_score','其它扣分项','','','OthersScore','tree','com.ruoyi.others_score','others_score','others_score','其它扣分项管理','ruoyi','0','/','{\"treeCode\":\"id\",\"treeName\":\"type_name\",\"treeParentCode\":\"p_id\",\"parentMenuId\":1}','admin','2022-12-29 12:01:05','','2022-12-29 16:16:17',NULL),(16,'teachers_students','授课关系',NULL,NULL,'TeachersStudents','crud','com.ruoyi.teach','teach','teach','授课考勤','ruoyi','0','/','{\"parentMenuId\":1}','admin','2022-12-29 12:01:05','','2022-12-29 18:03:10',NULL),(17,'test_temp','测试',NULL,NULL,'TestTemp','crud','com.ruoyi.test_temp','test_temp','test_temp','测试','ruoyi','0','/','{\"parentMenuId\":\"2054\"}','admin','2022-12-29 12:10:56','','2022-12-29 13:56:49',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (11,'4','id','导员编号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-27 15:09:06','','2022-12-27 15:11:23'),(12,'4','user_id','用户编号','int','Long','userId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-12-27 15:09:06','','2022-12-27 15:11:23'),(13,'5','id','学号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-27 15:09:06','','2022-12-29 15:25:31'),(14,'5','user_id','用户id','int','Long','userId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-12-27 15:09:06','','2022-12-29 15:25:31'),(15,'5','enter_date','入学时间','date','Date','enterDate','0','0',NULL,'1','1','1','1','EQ','datetime','',4,'admin','2022-12-27 15:09:06','','2022-12-29 15:25:31'),(16,'5','graduated','是否已毕业','tinyint(1)','Long','graduated','0','0',NULL,'1','1','1','1','EQ','input','yes_or_no',5,'admin','2022-12-27 15:09:06','','2022-12-29 15:25:31'),(17,'5','graduate_plan','预计毕业时间','date','Date','graduatePlan','0','0',NULL,'1','1','1','1','EQ','datetime','',6,'admin','2022-12-27 15:09:06','','2022-12-29 15:25:31'),(18,'6','id','工号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-27 15:09:06','','2022-12-27 15:23:06'),(19,'6','user_id','用户 id','int','Long','userId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-12-27 15:09:06','','2022-12-27 15:23:06'),(20,'5','dormitory_id','宿舍号','int','Long','dormitoryId','0','0',NULL,'1','1','1','1','EQ','input','',3,'','2022-12-28 15:55:36','','2022-12-29 15:25:31'),(21,'7','id','宿舍区编号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-28 16:20:37','','2022-12-29 13:47:36'),(22,'7','p_id','上级区域编号','int','Long','pId','0','0',NULL,'1','1','1','1','EQ','select','',2,'admin','2022-12-28 16:20:37','','2022-12-29 13:47:36'),(23,'7','dept_id','所属部门（校区/学院/专业等）','int','Long','deptId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-12-28 16:20:37','','2022-12-29 13:47:36'),(24,'7','name','宿舍区名','varchar(20)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',4,'admin','2022-12-28 16:20:37','','2022-12-29 13:47:36'),(25,'8','id','主键','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-29 12:01:05','','2022-12-29 16:20:59'),(26,'8','student_id','活动人','int','Long','studentId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-12-29 12:01:05','','2022-12-29 16:20:59'),(27,'8','added_by','添加者','int','Long','addedBy','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-12-29 12:01:05','','2022-12-29 16:20:59'),(28,'8','rec_date','日期','date','Date','recDate','0','0',NULL,'1','1','1','1','BETWEEN','datetime','',4,'admin','2022-12-29 12:01:05','','2022-12-29 16:20:59'),(29,'8','time','时长','int','Long','time','0','0',NULL,'1','1','1','1','BETWEEN','input','',5,'admin','2022-12-29 12:01:05','','2022-12-29 16:20:59'),(30,'8','comm','备注','varchar(30)','String','comm','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-12-29 12:01:05','','2022-12-29 16:20:59'),(31,'9','id','编号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-29 12:01:05','','2022-12-29 16:29:29'),(32,'9','student_id','扣分人','int','Long','studentId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-12-29 12:01:05','','2022-12-29 16:29:29'),(33,'9','type_id','扣分类型','int','Long','typeId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-12-29 12:01:05','','2022-12-29 16:29:29'),(34,'9','added_by','添加者','int','Long','addedBy','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-12-29 12:01:05','','2022-12-29 16:29:29'),(35,'9','course_name','课程名','varchar(30)','String','courseName','0','0',NULL,'1','1','1','1','LIKE','input','',5,'admin','2022-12-29 12:01:05','','2022-12-29 16:29:29'),(36,'9','rec_date','扣分日期','date','Date','recDate','0','0',NULL,'1','1','1','1','EQ','datetime','',6,'admin','2022-12-29 12:01:05','','2022-12-29 16:29:29'),(37,'9','canceled','是否已取消','tinyint(1)','Integer','canceled','0','0',NULL,'1','1','1','1','BETWEEN','input','',7,'admin','2022-12-29 12:01:05','','2022-12-29 16:29:29'),(38,'10','id','编号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-29 12:01:05','','2022-12-29 17:52:04'),(39,'10','type_name','扣分项名','int','Long','typeName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-12-29 12:01:05','','2022-12-29 17:52:04'),(40,'10','score','扣分','int','Long','score','0','0',NULL,'1','1','1','1','BETWEEN','input','',3,'admin','2022-12-29 12:01:05','','2022-12-29 17:52:04'),(41,'11','id','工号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-29 12:01:05','','2022-12-29 18:00:34'),(42,'11','user_id','用户id','int','Long','userId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-12-29 12:01:05','','2022-12-29 18:00:34'),(43,'11','dormitory_id','管辖区','int','Long','dormitoryId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-12-29 12:01:05','','2022-12-29 18:00:34'),(44,'12','id','bianhao','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-29 12:01:05','','2022-12-29 16:28:01'),(45,'12','student_id','扣分人','int','Long','studentId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-12-29 12:01:05','','2022-12-29 16:28:01'),(46,'12','type_id','扣分类型','int','Long','typeId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-12-29 12:01:05','','2022-12-29 16:28:01'),(47,'12','added_by','添加人','int','Long','addedBy','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-12-29 12:01:05','','2022-12-29 16:28:01'),(48,'12','rec_date','扣分日期','date','Date','recDate','0','0',NULL,'1','1','1','1','BETWEEN','datetime','',5,'admin','2022-12-29 12:01:05','','2022-12-29 16:28:01'),(49,'12','canceled','是否已取消','tinyint(1)','Integer','canceled','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2022-12-29 12:01:05','','2022-12-29 16:28:01'),(50,'13','id','编号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-29 12:01:05','','2022-12-29 17:53:18'),(51,'13','type_name','扣分项名','varchar(20)','String','typeName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2022-12-29 12:01:05','','2022-12-29 17:53:18'),(52,'13','score','扣分','int','Long','score','0','0',NULL,'1','1','1','1','BETWEEN','input','',3,'admin','2022-12-29 12:01:05','','2022-12-29 17:53:18'),(53,'14','id','编号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-29 12:01:05','','2022-12-29 16:25:17'),(54,'14','student_id','扣分学生','int','Long','studentId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-12-29 12:01:05','','2022-12-29 16:25:17'),(55,'14','type_id','类型编号','int','Long','typeId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-12-29 12:01:05','','2022-12-29 16:25:17'),(56,'14','added_by','添加者','int','Long','addedBy','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2022-12-29 12:01:05','','2022-12-29 16:25:17'),(57,'14','comm','备注','varchar(30)','String','comm','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2022-12-29 12:01:05','','2022-12-29 16:25:17'),(58,'14','rec_date','扣分日期','date','Date','recDate','0','0',NULL,'1','1','1','1','EQ','datetime','',6,'admin','2022-12-29 12:01:05','','2022-12-29 16:25:17'),(59,'14','canceled','是否已取消','tinyint(1)','Integer','canceled','0','0',NULL,'1','1','1','1','BETWEEN','input','',7,'admin','2022-12-29 12:01:05','','2022-12-29 16:25:17'),(60,'15','id','类型编号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-29 12:01:05','','2022-12-29 16:16:17'),(61,'15','p_id','上级类型','int','Long','pId','0','0',NULL,'1','1','1','1','EQ','select','',2,'admin','2022-12-29 12:01:05','','2022-12-29 16:16:17'),(62,'15','type_name','类型名','varchar(20)','String','typeName','0','0',NULL,'1','1','1','1','LIKE','input','',3,'admin','2022-12-29 12:01:05','','2022-12-29 16:16:17'),(63,'15','score','扣分','int','Long','score','0','0',NULL,'1','1','1','1','BETWEEN','input','',4,'admin','2022-12-29 12:01:05','','2022-12-29 16:16:17'),(64,'16','id','编号','int','Long','id','1','1',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-29 12:01:05','','2022-12-29 18:03:10'),(65,'16','teacher_id','教师','int','Long','teacherId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2022-12-29 12:01:05','','2022-12-29 18:03:10'),(66,'16','student_id','学生','int','Long','studentId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2022-12-29 12:01:05','','2022-12-29 18:03:10'),(67,'16','course_name','课程名','varchar(20)','String','courseName','0','0',NULL,'1','1','1','1','LIKE','input','',4,'admin','2022-12-29 12:01:05','','2022-12-29 18:03:10'),(68,'16','course_date','日期','date','Date','courseDate','0','0',NULL,'1','1','1','1','BETWEEN','datetime','',5,'admin','2022-12-29 12:01:05','','2022-12-29 18:03:10'),(69,'17','id','主键','int','Long','id','0','0',NULL,'1','1','1','1','EQ','input','',1,'admin','2022-12-29 12:10:56','','2022-12-29 13:56:49'),(70,'17','user_id','用户','int','Long','userId','0','0',NULL,'1','1','1','1','EQ','select','',2,'admin','2022-12-29 12:10:56','','2022-12-29 13:56:49');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `others_rec`
--

DROP TABLE IF EXISTS `others_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `others_rec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  `added_by` int DEFAULT NULL,
  `comm` varchar(30) DEFAULT NULL,
  `rec_date` date DEFAULT NULL,
  `canceled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `others_rec`
--

LOCK TABLES `others_rec` WRITE;
/*!40000 ALTER TABLE `others_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `others_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `others_score`
--

DROP TABLE IF EXISTS `others_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `others_score` (
  `id` int NOT NULL AUTO_INCREMENT,
  `p_id` int DEFAULT NULL,
  `type_name` varchar(20) DEFAULT NULL,
  `score` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `others_score`
--

LOCK TABLES `others_score` WRITE;
/*!40000 ALTER TABLE `others_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `others_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `dormitory_id` int DEFAULT NULL,
  `enter_date` date DEFAULT NULL,
  `graduated` int DEFAULT NULL,
  `graduate_plan` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,3,1,'2022-12-29',0,'2022-12-31');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2022-12-25 20:27:56','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2022-12-25 20:27:56','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2022-12-25 20:27:56','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2022-12-25 20:27:56','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2022-12-25 20:27:56','',NULL,'是否开启注册用户功能（true开启，false关闭）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','福建工程学院',0,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-25 20:27:55','admin','2022-12-26 18:58:39'),(101,100,'0,100','旗山北校区',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-25 20:27:55','admin','2022-12-26 19:23:05'),(102,100,'0,100','旗山南校区',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-25 20:27:55','admin','2022-12-26 19:24:35'),(103,101,'0,100,101','计算机科学与数学学院',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-25 20:27:55','admin','2022-12-26 19:23:11'),(104,101,'0,100,101','电子电气与物理学院',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-25 20:27:55','admin','2022-12-26 19:23:34'),(105,101,'0,100,101','土木学院',3,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-25 20:27:55','admin','2022-12-26 19:23:47'),(106,101,'0,100,101','建筑学院',4,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-25 20:27:55','admin','2022-12-26 19:23:53'),(107,101,'0,100,101','信息与计算科学',5,'若依','15888888888','ry@qq.com','0','2','admin','2022-12-25 20:27:55','admin','2022-12-26 19:20:06'),(108,102,'0,100,102','机械与汽车工程学院',1,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-25 20:27:55','admin','2022-12-26 19:24:49'),(109,102,'0,100,102','材料学院',2,'若依','15888888888','ry@qq.com','0','0','admin','2022-12-25 20:27:55','admin','2022-12-26 19:24:56'),(200,100,'0,100','鳝溪校区',3,NULL,'15888888888',NULL,'0','0','admin','2022-12-26 19:27:11','',NULL),(201,101,'0,100,101','数理学院',1,NULL,NULL,NULL,'1','0','admin','2022-12-27 15:35:52','',NULL),(202,100,'0,100','学校直属',0,NULL,NULL,NULL,'0','2','admin','2022-12-29 11:46:42','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2022-12-25 20:27:56','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2022-12-25 20:27:56','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2022-12-25 20:27:56','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2022-12-25 20:27:56','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2022-12-25 20:27:56','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2022-12-25 20:27:56','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2022-12-25 20:27:56','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2022-12-25 20:27:56','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2022-12-25 20:27:56','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2022-12-25 20:27:56','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2022-12-25 20:27:56','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2022-12-25 20:27:56','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2022-12-25 20:27:56','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2022-12-25 20:27:56','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2022-12-25 20:27:56','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2022-12-25 20:27:56','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2022-12-25 20:27:56','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2022-12-25 20:27:56','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2022-12-25 20:27:56','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2022-12-25 20:27:56','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2022-12-25 20:27:56','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2022-12-25 20:27:56','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2022-12-25 20:27:56','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2022-12-25 20:27:56','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2022-12-25 20:27:56','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2022-12-25 20:27:56','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2022-12-25 20:27:56','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2022-12-25 20:27:56','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2022-12-25 20:27:56','',NULL,'停用状态'),(100,0,'是','1','yes_or_no',NULL,'default','N','0','admin','2022-12-27 15:18:55','admin','2022-12-27 15:20:34',NULL),(101,1,'否','0','yes_or_no',NULL,'default','N','0','admin','2022-12-27 15:19:07','admin','2022-12-27 15:20:38',NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2022-12-25 20:27:56','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2022-12-25 20:27:56','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2022-12-25 20:27:56','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2022-12-25 20:27:56','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2022-12-25 20:27:56','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2022-12-25 20:27:56','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2022-12-25 20:27:56','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2022-12-25 20:27:56','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2022-12-25 20:27:56','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2022-12-25 20:27:56','',NULL,'登录状态列表'),(100,'是否','yes_or_no','0','admin','2022-12-27 15:13:29','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2022-12-25 20:27:56','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2022-12-25 20:27:56','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2022-12-25 20:27:56','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-25 20:30:08'),(101,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-12-25 21:24:24'),(102,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-25 21:24:27'),(103,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-12-25 21:46:20'),(104,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-26 18:28:37'),(105,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-12-26 18:57:11'),(106,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-12-26 18:57:15'),(107,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-26 18:57:18'),(108,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-26 20:48:17'),(109,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-12-26 21:01:38'),(110,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-26 21:01:46'),(111,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-27 08:51:00'),(112,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-27 09:52:28'),(113,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-27 10:57:43'),(114,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-27 13:06:01'),(115,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-27 14:15:22'),(116,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-27 15:08:55'),(117,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-28 14:15:23'),(118,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-28 15:07:46'),(119,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-28 15:55:21'),(120,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-12-29 10:04:51'),(121,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 10:04:56'),(122,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 11:45:46'),(123,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 13:43:38'),(124,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-12-29 14:41:15'),(125,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 14:41:19'),(126,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-12-29 15:07:35'),(127,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-12-29 15:07:40'),(128,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-12-29 15:07:43'),(129,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 15:07:47'),(130,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 17:50:19'),(131,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 19:04:42'),(132,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-12-29 20:30:14'),(133,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 20:30:21'),(134,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-12-29 20:30:50'),(135,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 20:30:54'),(136,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 21:50:51'),(137,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-29 23:41:59'),(138,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-12-30 00:09:39'),(139,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-30 00:09:43'),(140,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-12-30 00:11:42'),(141,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-30 00:11:46'),(142,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-30 09:44:43'),(143,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','退出成功','2022-12-30 10:02:20'),(144,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-30 10:02:24'),(145,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-30 20:39:08'),(146,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-31 01:23:00'),(147,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-31 02:12:05'),(148,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2022-12-31 19:46:24'),(149,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-31 19:46:27'),(150,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-31 20:41:45'),(151,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2022-12-31 22:13:50'),(152,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','1','验证码错误','2023-01-01 01:23:23'),(153,'admin','127.0.0.1','内网IP','Firefox 10','Windows 10','0','登录成功','2023-01-01 01:23:26');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'菜单',0,1,'system',NULL,'',1,0,'M','0','0','','list','admin','2022-12-25 20:27:55','admin','2022-12-28 16:08:37','系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2022-12-25 20:27:55','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2022-12-25 20:27:55','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2022-12-25 20:27:55','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2022-12-25 20:27:55','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2022-12-25 20:27:55','',NULL,'角色管理菜单'),(102,'菜单管理',3,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2022-12-25 20:27:55','admin','2022-12-27 13:07:02','菜单管理菜单'),(103,'学院管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2022-12-25 20:27:55','admin','2022-12-26 19:02:02','部门管理菜单'),(104,'岗位管理',3,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2022-12-25 20:27:55','admin','2022-12-27 14:29:22','岗位管理菜单'),(105,'字典管理',3,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2022-12-25 20:27:55','admin','2022-12-27 15:21:52','字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2022-12-25 20:27:55','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2022-12-25 20:27:55','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2022-12-25 20:27:55','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2022-12-25 20:27:55','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2022-12-25 20:27:55','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2022-12-25 20:27:55','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2022-12-25 20:27:55','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2022-12-25 20:27:55','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2022-12-25 20:27:55','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2022-12-25 20:27:55','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2022-12-25 20:27:55','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2022-12-25 20:27:55','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2022-12-25 20:27:55','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2022-12-25 20:27:55','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2022-12-25 20:27:55','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2022-12-25 20:27:56','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2022-12-25 20:27:56','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2022-12-25 20:27:56','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2022-12-25 20:27:56','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2022-12-25 20:27:56','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2022-12-25 20:27:56','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2022-12-25 20:27:56','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2022-12-25 20:27:56','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2022-12-25 20:27:56','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2022-12-25 20:27:56','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1016,'学院查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2022-12-25 20:27:56','admin','2022-12-26 19:02:09',''),(1017,'学院新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2022-12-25 20:27:56','admin','2022-12-26 19:02:17',''),(1018,'学院修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2022-12-25 20:27:56','admin','2022-12-26 19:02:23',''),(1019,'学院删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2022-12-25 20:27:56','admin','2022-12-26 19:02:29',''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2022-12-25 20:27:56','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2022-12-25 20:27:56','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2022-12-25 20:27:56','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2022-12-25 20:27:56','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2022-12-25 20:27:56','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2022-12-25 20:27:56','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2022-12-25 20:27:56','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2022-12-25 20:27:56','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2022-12-25 20:27:56','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2022-12-25 20:27:56','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2022-12-25 20:27:56','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2022-12-25 20:27:56','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2022-12-25 20:27:56','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2022-12-25 20:27:56','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2022-12-25 20:27:56','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2022-12-25 20:27:56','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2022-12-25 20:27:56','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2022-12-25 20:27:56','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2022-12-25 20:27:56','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2022-12-25 20:27:56','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2022-12-25 20:27:56','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2022-12-25 20:27:56','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2022-12-25 20:27:56','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2022-12-25 20:27:56','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2022-12-25 20:27:56','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2022-12-25 20:27:56','',NULL,''),(2030,'辅导员管理',1,1,'advisors','advisors/advisors/index',NULL,1,0,'C','0','0','advisors:advisors:list','people','admin','2022-12-27 15:25:07','admin','2022-12-28 16:09:57','辅导员管理菜单'),(2031,'辅导员管理查询',2030,1,'#','',NULL,1,0,'F','0','0','advisors:advisors:query','#','admin','2022-12-27 15:25:07','',NULL,''),(2032,'辅导员管理新增',2030,2,'#','',NULL,1,0,'F','0','0','advisors:advisors:add','#','admin','2022-12-27 15:25:07','',NULL,''),(2033,'辅导员管理修改',2030,3,'#','',NULL,1,0,'F','0','0','advisors:advisors:edit','#','admin','2022-12-27 15:25:07','',NULL,''),(2034,'辅导员管理删除',2030,4,'#','',NULL,1,0,'F','0','0','advisors:advisors:remove','#','admin','2022-12-27 15:25:07','',NULL,''),(2035,'辅导员管理导出',2030,5,'#','',NULL,1,0,'F','0','0','advisors:advisors:export','#','admin','2022-12-27 15:25:07','',NULL,''),(2042,'教师管理',1,1,'teachers','teachers/teachers/index',NULL,1,0,'C','0','0','teachers:teachers:list','people','admin','2022-12-27 15:25:48','admin','2022-12-28 16:10:04','教师管理菜单'),(2043,'教师管理查询',2042,1,'#','',NULL,1,0,'F','0','0','teachers:teachers:query','#','admin','2022-12-27 15:25:48','',NULL,''),(2044,'教师管理新增',2042,2,'#','',NULL,1,0,'F','0','0','teachers:teachers:add','#','admin','2022-12-27 15:25:48','',NULL,''),(2045,'教师管理修改',2042,3,'#','',NULL,1,0,'F','0','0','teachers:teachers:edit','#','admin','2022-12-27 15:25:48','',NULL,''),(2046,'教师管理删除',2042,4,'#','',NULL,1,0,'F','0','0','teachers:teachers:remove','#','admin','2022-12-27 15:25:48','',NULL,''),(2047,'教师管理导出',2042,5,'#','',NULL,1,0,'F','0','0','teachers:teachers:export','#','admin','2022-12-27 15:25:48','',NULL,''),(2054,'菜单回收站',0,8,'none',NULL,NULL,1,0,'M','0','0','','#','admin','2022-12-28 16:05:01','admin','2022-12-28 16:06:28',''),(2055,'学生管理',1,1,'students','students/students/index',NULL,1,0,'C','0','0','students:students:list','user','admin','2022-12-28 16:11:14','admin','2022-12-30 00:25:46','学生管理菜单'),(2056,'学生管理查询',2055,1,'#','',NULL,1,0,'F','0','0','students:students:query','#','admin','2022-12-28 16:11:14','',NULL,''),(2057,'学生管理新增',2055,2,'#','',NULL,1,0,'F','0','0','students:students:add','#','admin','2022-12-28 16:11:14','',NULL,''),(2058,'学生管理修改',2055,3,'#','',NULL,1,0,'F','0','0','students:students:edit','#','admin','2022-12-28 16:11:14','',NULL,''),(2059,'学生管理删除',2055,4,'#','',NULL,1,0,'F','0','0','students:students:remove','#','admin','2022-12-28 16:11:14','',NULL,''),(2060,'学生管理导出',2055,5,'#','',NULL,1,0,'F','0','0','students:students:export','#','admin','2022-12-28 16:11:14','',NULL,''),(2061,'宿舍区域管理',1,1,'dormitory_area','dormitory_area/dormitory_area/index',NULL,1,0,'C','0','0','dormitory_area:dormitory_area:list','tree','admin','2022-12-28 16:24:11','admin','2022-12-30 00:26:37','宿舍区域管理菜单'),(2062,'宿舍区域管理查询',2061,1,'#','',NULL,1,0,'F','0','0','dormitory_area:dormitory_area:query','#','admin','2022-12-28 16:24:11','',NULL,''),(2063,'宿舍区域管理新增',2061,2,'#','',NULL,1,0,'F','0','0','dormitory_area:dormitory_area:add','#','admin','2022-12-28 16:24:11','',NULL,''),(2064,'宿舍区域管理修改',2061,3,'#','',NULL,1,0,'F','0','0','dormitory_area:dormitory_area:edit','#','admin','2022-12-28 16:24:11','',NULL,''),(2065,'宿舍区域管理删除',2061,4,'#','',NULL,1,0,'F','0','0','dormitory_area:dormitory_area:remove','#','admin','2022-12-28 16:24:11','',NULL,''),(2066,'宿舍区域管理导出',2061,5,'#','',NULL,1,0,'F','0','0','dormitory_area:dormitory_area:export','#','admin','2022-12-28 16:24:11','',NULL,''),(2067,'测试',2054,1,'test_temp','test_temp/test_temp/index',NULL,1,0,'C','0','0','test_temp:test_temp:list','#','admin','2022-12-29 13:57:27','',NULL,'测试菜单'),(2068,'测试查询',2067,1,'#','',NULL,1,0,'F','0','0','test_temp:test_temp:query','#','admin','2022-12-29 13:57:27','',NULL,''),(2069,'测试新增',2067,2,'#','',NULL,1,0,'F','0','0','test_temp:test_temp:add','#','admin','2022-12-29 13:57:27','',NULL,''),(2070,'测试修改',2067,3,'#','',NULL,1,0,'F','0','0','test_temp:test_temp:edit','#','admin','2022-12-29 13:57:27','',NULL,''),(2071,'测试删除',2067,4,'#','',NULL,1,0,'F','0','0','test_temp:test_temp:remove','#','admin','2022-12-29 13:57:27','',NULL,''),(2072,'测试导出',2067,5,'#','',NULL,1,0,'F','0','0','test_temp:test_temp:export','#','admin','2022-12-29 13:57:27','',NULL,''),(2073,'其它扣分项管理',1,1,'others_score','others_score/others_score/index',NULL,1,0,'C','0','0','others_score:others_score:list','tree','admin','2022-12-29 16:17:34','admin','2022-12-30 00:26:45','其它扣分项管理菜单'),(2074,'其它扣分项管理查询',2073,1,'#','',NULL,1,0,'F','0','0','others_score:others_score:query','#','admin','2022-12-29 16:17:34','',NULL,''),(2075,'其它扣分项管理新增',2073,2,'#','',NULL,1,0,'F','0','0','others_score:others_score:add','#','admin','2022-12-29 16:17:34','',NULL,''),(2076,'其它扣分项管理修改',2073,3,'#','',NULL,1,0,'F','0','0','others_score:others_score:edit','#','admin','2022-12-29 16:17:34','',NULL,''),(2077,'其它扣分项管理删除',2073,4,'#','',NULL,1,0,'F','0','0','others_score:others_score:remove','#','admin','2022-12-29 16:17:34','',NULL,''),(2078,'其它扣分项管理导出',2073,5,'#','',NULL,1,0,'F','0','0','others_score:others_score:export','#','admin','2022-12-29 16:17:34','',NULL,''),(2079,'考勤扣分记录',1,1,'attendancy_rec','attendancy_rec/attendancy_rec/index',NULL,1,0,'C','0','0','attendancy_rec:attendancy_rec:list','list','admin','2022-12-29 16:30:36','admin','2022-12-30 00:26:55','考勤扣分记录菜单'),(2080,'考勤扣分记录查询',2079,1,'#','',NULL,1,0,'F','0','0','attendancy_rec:attendancy_rec:query','#','admin','2022-12-29 16:30:36','',NULL,''),(2081,'考勤扣分记录新增',2079,2,'#','',NULL,1,0,'F','0','0','attendancy_rec:attendancy_rec:add','#','admin','2022-12-29 16:30:36','',NULL,''),(2082,'考勤扣分记录修改',2079,3,'#','',NULL,1,0,'F','0','0','attendancy_rec:attendancy_rec:edit','#','admin','2022-12-29 16:30:36','',NULL,''),(2083,'考勤扣分记录删除',2079,4,'#','',NULL,1,0,'F','0','0','attendancy_rec:attendancy_rec:remove','#','admin','2022-12-29 16:30:36','',NULL,''),(2084,'考勤扣分记录导出',2079,5,'#','',NULL,1,0,'F','0','0','attendancy_rec:attendancy_rec:export','#','admin','2022-12-29 16:30:36','',NULL,''),(2085,'宿舍扣分记录',1,1,'dormitory_rec','dormitory_rec/dormitory_rec/index',NULL,1,0,'C','0','0','dormitory_rec:dormitory_rec:list','list','admin','2022-12-29 16:31:00','admin','2022-12-30 00:27:05','宿舍扣分记录菜单'),(2086,'宿舍扣分记录查询',2085,1,'#','',NULL,1,0,'F','0','0','dormitory_rec:dormitory_rec:query','#','admin','2022-12-29 16:31:00','',NULL,''),(2087,'宿舍扣分记录新增',2085,2,'#','',NULL,1,0,'F','0','0','dormitory_rec:dormitory_rec:add','#','admin','2022-12-29 16:31:00','',NULL,''),(2088,'宿舍扣分记录修改',2085,3,'#','',NULL,1,0,'F','0','0','dormitory_rec:dormitory_rec:edit','#','admin','2022-12-29 16:31:00','',NULL,''),(2089,'宿舍扣分记录删除',2085,4,'#','',NULL,1,0,'F','0','0','dormitory_rec:dormitory_rec:remove','#','admin','2022-12-29 16:31:00','',NULL,''),(2090,'宿舍扣分记录导出',2085,5,'#','',NULL,1,0,'F','0','0','dormitory_rec:dormitory_rec:export','#','admin','2022-12-29 16:31:00','',NULL,''),(2091,'其它扣分记录',1,1,'others_rec','others_rec/others_rec/index',NULL,1,0,'C','0','0','others_rec:others_rec:list','list','admin','2022-12-29 16:31:19','admin','2022-12-30 00:27:12','其它扣分记录菜单'),(2092,'其它扣分记录查询',2091,1,'#','',NULL,1,0,'F','0','0','others_rec:others_rec:query','#','admin','2022-12-29 16:31:19','',NULL,''),(2093,'其它扣分记录新增',2091,2,'#','',NULL,1,0,'F','0','0','others_rec:others_rec:add','#','admin','2022-12-29 16:31:19','',NULL,''),(2094,'其它扣分记录修改',2091,3,'#','',NULL,1,0,'F','0','0','others_rec:others_rec:edit','#','admin','2022-12-29 16:31:19','',NULL,''),(2095,'其它扣分记录删除',2091,4,'#','',NULL,1,0,'F','0','0','others_rec:others_rec:remove','#','admin','2022-12-29 16:31:19','',NULL,''),(2096,'其它扣分记录导出',2091,5,'#','',NULL,1,0,'F','0','0','others_rec:others_rec:export','#','admin','2022-12-29 16:31:19','',NULL,''),(2097,'宿舍扣分项管理',1,1,'dormitory_score','dormitory_score/dormitory_score/index',NULL,1,0,'C','0','0','dormitory_score:dormitory_score:list','build','admin','2022-12-29 17:55:07','admin','2022-12-30 00:27:30','宿舍扣分项管理菜单'),(2098,'宿舍扣分项管理查询',2097,1,'#','',NULL,1,0,'F','0','0','dormitory_score:dormitory_score:query','#','admin','2022-12-29 17:55:07','',NULL,''),(2099,'宿舍扣分项管理新增',2097,2,'#','',NULL,1,0,'F','0','0','dormitory_score:dormitory_score:add','#','admin','2022-12-29 17:55:07','',NULL,''),(2100,'宿舍扣分项管理修改',2097,3,'#','',NULL,1,0,'F','0','0','dormitory_score:dormitory_score:edit','#','admin','2022-12-29 17:55:07','',NULL,''),(2101,'宿舍扣分项管理删除',2097,4,'#','',NULL,1,0,'F','0','0','dormitory_score:dormitory_score:remove','#','admin','2022-12-29 17:55:07','',NULL,''),(2102,'宿舍扣分项管理导出',2097,5,'#','',NULL,1,0,'F','0','0','dormitory_score:dormitory_score:export','#','admin','2022-12-29 17:55:07','',NULL,''),(2103,'考勤扣分项管理',1,1,'attendancy_score','attendancy_score/attendancy_score/index',NULL,1,0,'C','0','0','attendancy_score:attendancy_score:list','build','admin','2022-12-29 17:55:27','admin','2022-12-30 00:27:36','考勤扣分项管理菜单'),(2104,'考勤扣分项管理查询',2103,1,'#','',NULL,1,0,'F','0','0','attendancy_score:attendancy_score:query','#','admin','2022-12-29 17:55:27','',NULL,''),(2105,'考勤扣分项管理新增',2103,2,'#','',NULL,1,0,'F','0','0','attendancy_score:attendancy_score:add','#','admin','2022-12-29 17:55:27','',NULL,''),(2106,'考勤扣分项管理修改',2103,3,'#','',NULL,1,0,'F','0','0','attendancy_score:attendancy_score:edit','#','admin','2022-12-29 17:55:27','',NULL,''),(2107,'考勤扣分项管理删除',2103,4,'#','',NULL,1,0,'F','0','0','attendancy_score:attendancy_score:remove','#','admin','2022-12-29 17:55:27','',NULL,''),(2108,'考勤扣分项管理导出',2103,5,'#','',NULL,1,0,'F','0','0','attendancy_score:attendancy_score:export','#','admin','2022-12-29 17:55:27','',NULL,''),(2109,'授课考勤',1,1,'teach','teach/teach/index',NULL,1,0,'C','0','0','teach:teach:list','education','admin','2022-12-29 18:04:41','admin','2022-12-30 00:27:46','授课考勤菜单'),(2110,'授课考勤查询',2109,1,'#','',NULL,1,0,'F','0','0','teach:teach:query','#','admin','2022-12-29 18:04:41','',NULL,''),(2111,'授课考勤新增',2109,2,'#','',NULL,1,0,'F','0','0','teach:teach:add','#','admin','2022-12-29 18:04:41','',NULL,''),(2112,'授课考勤修改',2109,3,'#','',NULL,1,0,'F','0','0','teach:teach:edit','#','admin','2022-12-29 18:04:41','',NULL,''),(2113,'授课考勤删除',2109,4,'#','',NULL,1,0,'F','0','0','teach:teach:remove','#','admin','2022-12-29 18:04:41','',NULL,''),(2114,'授课考勤导出',2109,5,'#','',NULL,1,0,'F','0','0','teach:teach:export','#','admin','2022-12-29 18:04:41','',NULL,''),(2115,'宿管管理',1,1,'dormitory_managers','dormitory_managers/dormitory_managers/index',NULL,1,0,'C','0','0','dormitory_managers:dormitory_managers:list','tree','admin','2022-12-29 18:04:59','admin','2022-12-30 00:28:08','宿管管理菜单'),(2116,'宿管管理查询',2115,1,'#','',NULL,1,0,'F','0','0','dormitory_managers:dormitory_managers:query','#','admin','2022-12-29 18:04:59','',NULL,''),(2117,'宿管管理新增',2115,2,'#','',NULL,1,0,'F','0','0','dormitory_managers:dormitory_managers:add','#','admin','2022-12-29 18:04:59','',NULL,''),(2118,'宿管管理修改',2115,3,'#','',NULL,1,0,'F','0','0','dormitory_managers:dormitory_managers:edit','#','admin','2022-12-29 18:04:59','',NULL,''),(2119,'宿管管理删除',2115,4,'#','',NULL,1,0,'F','0','0','dormitory_managers:dormitory_managers:remove','#','admin','2022-12-29 18:04:59','',NULL,''),(2120,'宿管管理导出',2115,5,'#','',NULL,1,0,'F','0','0','dormitory_managers:dormitory_managers:export','#','admin','2022-12-29 18:04:59','',NULL,''),(2121,'个人中心',1,0,'/user/profile',NULL,NULL,1,0,'M','0','0','','user','admin','2022-12-29 18:08:18','admin','2022-12-29 18:08:39',''),(2122,'总分查询',1,1,'total','total/total/index',NULL,1,0,'C','0','0','','search','admin','2022-12-29 19:06:01','admin','2022-12-29 19:33:03','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2022-12-25 20:27:56','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2022-12-25 20:27:56','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"福建工程学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 18:58:39'),(101,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"计算机科学与数学学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"福建工程学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 18:58:51'),(102,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"电子电气与物理学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"福建工程学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 18:59:06'),(103,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2022-12-25 20:27:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"学生\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 18:59:31'),(104,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 18:59:55'),(105,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2022-12-26 18:59:55\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:00:13'),(106,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2022-12-25 20:27:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:00:17'),(107,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":101,\"roleKey\":\"administration\",\"roleName\":\"行政工作人员\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:00:52'),(108,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2022-12-25 20:27:55\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"学院管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:02:02'),(109,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2022-12-25 20:27:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1016,\"menuName\":\"学院查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":103,\"path\":\"\",\"perms\":\"system:dept:query\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:02:09'),(110,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2022-12-25 20:27:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1017,\"menuName\":\"学院新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":103,\"path\":\"\",\"perms\":\"system:dept:add\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:02:17'),(111,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2022-12-25 20:27:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1018,\"menuName\":\"学院修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":103,\"path\":\"\",\"perms\":\"system:dept:edit\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:02:23'),(112,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2022-12-25 20:27:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1019,\"menuName\":\"学院删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":103,\"path\":\"\",\"perms\":\"system:dept:remove\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:02:29'),(113,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"计算机科学与技术\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"计算机科学与数学学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:19:06'),(114,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"软件工程\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"计算机科学与数学学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:19:19'),(115,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"大数据\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"计算机科学与数学学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:19:27'),(116,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"智能科学与技术\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"计算机科学与数学学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:19:44'),(117,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"信息与计算科学\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"计算机科学与数学学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:20:06'),(118,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"电气工程与自动化\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"电子电气与物理学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:20:21'),(119,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"微电子科学与技术\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"电子电气与物理学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:20:31'),(120,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"旗山北校区\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"福建工程学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:23:05'),(121,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"计算机科学与数学学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"旗山北校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:23:11'),(122,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"电子电气与物理学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"旗山北校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:23:34'),(123,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"土木学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"旗山北校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:23:47'),(124,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"建筑学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"旗山北校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:23:53'),(125,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:24:25'),(126,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"旗山南校区\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"福建工程学院\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:24:35'),(127,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"机械与汽车工程学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"旗山南校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:24:49'),(128,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"材料学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"旗山南校区\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:24:56'),(129,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"鳝溪校区\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:27:11'),(130,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-25 20:27:55\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"学生日常评分管理系统\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:34:49'),(131,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-25 20:27:55\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"菜单\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 19:35:13'),(132,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','\"scores\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-26 20:06:46'),(133,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','\"test_parent\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 09:52:38'),(134,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','\"test_child\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 09:54:09'),(135,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"child\",\"className\":\"TestChild\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PId\",\"columnId\":9,\"columnName\":\"p_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Info\",\"columnId\":10,\"columnName\":\"info\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"info\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"测试子表\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"child\",\"options\":\"{\\\"parentMenuId\\\":3}\",\"packageName\":\"com.ruoyi.child\",\"params\":{\"parentMenuId\":3},\"parentMenuId\":\"3\",\"sub\":false,\"subTableFkName\":\"\",\"subTableName\":\"\",\"tableComment\":\"测试子表\",\"tableId\":3,\"tableName\":\"test_child\",\"tplCategory\":\"crud\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 09:55:39'),(136,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"test_child\"}',NULL,0,NULL,'2022-12-27 09:55:45'),(137,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"parent\",\"className\":\"TestParent\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":6,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:52:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Info\",\"columnId\":7,\"columnName\":\"info\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:52:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"info\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":false,\"functionAuthor\":\"ruoyi\",\"functionName\":\"测试主表\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"parent\",\"options\":\"{\\\"parentMenuId\\\":3}\",\"packageName\":\"com.ruoyi.parent\",\"params\":{\"parentMenuId\":3},\"parentMenuId\":\"3\",\"sub\":true,\"subTableFkName\":\"p_id\",\"subTableName\":\"test_child\",\"tableComment\":\"测试主表\",\"tableId\":2,\"tableName\":\"test_parent\",\"tplCategory\":\"sub\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 09:56:48'),(138,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"test_parent\"}',NULL,0,NULL,'2022-12-27 09:56:58'),(139,'测试子表',1,'com.ruoyi.child.controller.TestChildController.add()','POST',1,'admin',NULL,'/child/child','127.0.0.1','内网IP','{\"info\":23,\"pId\":1,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/child/TestChildMapper.xml]\n### The error may involve com.ruoyi.child.mapper.TestChildMapper.insertTestChild-Inline\n### The error occurred while setting parameters\n### SQL: insert into test_child          ( p_id,             info )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2022-12-27 10:03:13'),(140,'测试子表',1,'com.ruoyi.child.controller.TestChildController.add()','POST',1,'admin',NULL,'/child/child','127.0.0.1','内网IP','{\"info\":23,\"pId\":1,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/child/TestChildMapper.xml]\n### The error may involve com.ruoyi.child.mapper.TestChildMapper.insertTestChild-Inline\n### The error occurred while setting parameters\n### SQL: insert into test_child          ( p_id,             info )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2022-12-27 10:03:18'),(141,'测试子表',1,'com.ruoyi.child.controller.TestChildController.add()','POST',1,'admin',NULL,'/child/child','127.0.0.1','内网IP','{\"info\":23,\"pId\":1,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/child/TestChildMapper.xml]\n### The error may involve com.ruoyi.child.mapper.TestChildMapper.insertTestChild-Inline\n### The error occurred while setting parameters\n### SQL: insert into test_child          ( p_id,             info )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2022-12-27 10:03:21'),(142,'测试子表',1,'com.ruoyi.child.controller.TestChildController.add()','POST',1,'admin',NULL,'/child/child','127.0.0.1','内网IP','{\"info\":23,\"pId\":1,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/child/TestChildMapper.xml]\n### The error may involve com.ruoyi.child.mapper.TestChildMapper.insertTestChild-Inline\n### The error occurred while setting parameters\n### SQL: insert into test_child          ( p_id,             info )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2022-12-27 10:03:25'),(143,'测试子表',1,'com.ruoyi.child.controller.TestChildController.add()','POST',1,'admin',NULL,'/child/child','127.0.0.1','内网IP','{\"info\":23,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/child/TestChildMapper.xml]\n### The error may involve com.ruoyi.child.mapper.TestChildMapper.insertTestChild-Inline\n### The error occurred while setting parameters\n### SQL: insert into test_child          ( info )           values ( ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2022-12-27 10:03:29'),(144,'测试子表',1,'com.ruoyi.child.controller.TestChildController.add()','POST',1,'admin',NULL,'/child/child','127.0.0.1','内网IP','{\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/child/TestChildMapper.xml]\n### The error may involve com.ruoyi.child.mapper.TestChildMapper.insertTestChild-Inline\n### The error occurred while setting parameters\n### SQL: insert into test_child\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\' at line 1','2022-12-27 10:04:08'),(145,'测试子表',1,'com.ruoyi.child.controller.TestChildController.add()','POST',1,'admin',NULL,'/child/child','127.0.0.1','内网IP','{\"info\":2,\"pId\":1,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/child/TestChildMapper.xml]\n### The error may involve com.ruoyi.child.mapper.TestChildMapper.insertTestChild-Inline\n### The error occurred while setting parameters\n### SQL: insert into test_child          ( p_id,             info )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2022-12-27 10:04:18'),(146,'测试子表',1,'com.ruoyi.child.controller.TestChildController.add()','POST',1,'admin',NULL,'/child/child','127.0.0.1','内网IP','{\"info\":2,\"pId\":1,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/child/TestChildMapper.xml]\n### The error may involve com.ruoyi.child.mapper.TestChildMapper.insertTestChild-Inline\n### The error occurred while setting parameters\n### SQL: insert into test_child          ( p_id,             info )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2022-12-27 10:05:34'),(147,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"child\",\"className\":\"TestChild\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 09:55:39\",\"usableColumn\":false},{\"capJavaField\":\"PId\",\"columnId\":9,\"columnName\":\"p_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 09:55:39\",\"usableColumn\":false},{\"capJavaField\":\"Info\",\"columnId\":10,\"columnName\":\"info\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"info\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 09:55:39\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"测试子表\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"child\",\"options\":\"{\\\"parentMenuId\\\":\\\"3\\\"}\",\"packageName\":\"com.ruoyi.child\",\"params\":{\"parentMenuId\":\"3\"},\"parentMenuId\":\"3\",\"sub\":false,\"subTableFkName\":\"\",\"subTableName\":\"\",\"tableComment\":\"测试子表\",\"tableId\":3,\"tableName\":\"test_child\",\"tplCategory\":\"crud\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 10:05:56'),(148,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2006','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2022-12-27 10:06:15'),(149,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2007','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 10:58:17'),(150,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2008','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 10:58:19'),(151,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2009','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 10:58:21'),(152,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2010','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 10:58:23'),(153,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2011','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 10:58:25'),(154,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2022-12-27 10:58:27'),(155,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2006','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 10:58:33'),(156,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"child\",\"className\":\"TestChild\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 10:05:56\",\"usableColumn\":false},{\"capJavaField\":\"PId\",\"columnId\":9,\"columnName\":\"p_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 10:05:56\",\"usableColumn\":false},{\"capJavaField\":\"Info\",\"columnId\":10,\"columnName\":\"info\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"info\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 10:05:56\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"测试子表\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"child\",\"options\":\"{\\\"parentMenuId\\\":\\\"3\\\"}\",\"packageName\":\"com.ruoyi.child\",\"params\":{\"parentMenuId\":\"3\"},\"parentMenuId\":\"3\",\"sub\":false,\"subTableFkName\":\"\",\"subTableName\":\"\",\"tableComment\":\"测试子表\",\"tableId\":3,\"tableName\":\"test_child\",\"tplCategory\":\"crud\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 10:58:55'),(157,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"test_child\"}',NULL,0,NULL,'2022-12-27 10:58:57'),(158,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"child\",\"className\":\"TestChild\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 10:58:55\",\"usableColumn\":false},{\"capJavaField\":\"PId\",\"columnComment\":\"主表编号\",\"columnId\":9,\"columnName\":\"p_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 10:58:55\",\"usableColumn\":false},{\"capJavaField\":\"Info\",\"columnComment\":\"信息\",\"columnId\":10,\"columnName\":\"info\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"info\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 10:58:55\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"测试子表\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"child\",\"options\":\"{\\\"parentMenuId\\\":\\\"3\\\"}\",\"packageName\":\"com.ruoyi.child\",\"params\":{\"parentMenuId\":\"3\"},\"parentMenuId\":\"3\",\"sub\":false,\"subTableFkName\":\"\",\"subTableName\":\"\",\"tableComment\":\"测试子表\",\"tableId\":3,\"tableName','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:01:38'),(159,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"test_child\"}',NULL,0,NULL,'2022-12-27 11:01:42'),(160,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"child\",\"className\":\"TestChild\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 11:01:38\",\"usableColumn\":false},{\"capJavaField\":\"PId\",\"columnComment\":\"主表编号\",\"columnId\":9,\"columnName\":\"p_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 11:01:38\",\"usableColumn\":false},{\"capJavaField\":\"Info\",\"columnComment\":\"信息\",\"columnId\":10,\"columnName\":\"info\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:54:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"info\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 11:01:38\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"测试子表\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"child\",\"options\":\"{\\\"parentMenuId\\\":\\\"3\\\"}\",\"packageName\":\"com.ruoyi.child\",\"params\":{\"parentMenuId\":\"3\"},\"parentMenuId\":\"3\",\"sub\":false,\"subTableFkName\":\"\",\"subTableName\":\"\",\"tableComment\":\"测试子表\",\"tableId\":3,\"tableName','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:03:17'),(161,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2012','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2022-12-27 11:44:55'),(162,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2012','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2022-12-27 11:45:30'),(163,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2014','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:45:33'),(164,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2013','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:45:36'),(165,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2015','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:45:38'),(166,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2016','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:45:40'),(167,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2017','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:45:42'),(168,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2012','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:45:47'),(169,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"parent\",\"className\":\"TestParent\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":6,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:52:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 09:56:48\",\"usableColumn\":false},{\"capJavaField\":\"Info\",\"columnComment\":\"信息\",\"columnId\":7,\"columnName\":\"info\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 09:52:38\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"info\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 09:56:48\",\"usableColumn\":false}],\"crud\":false,\"functionAuthor\":\"ruoyi\",\"functionName\":\"测试主表\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"parent\",\"options\":\"{\\\"parentMenuId\\\":\\\"3\\\"}\",\"packageName\":\"com.ruoyi.parent\",\"params\":{\"parentMenuId\":\"3\"},\"parentMenuId\":\"3\",\"sub\":true,\"subTableFkName\":\"p_id\",\"subTableName\":\"test_child\",\"tableComment\":\"测试主表\",\"tableId\":2,\"tableName\":\"test_parent\",\"tplCategory\":\"sub\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:47:09'),(170,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"test_parent\"}',NULL,0,NULL,'2022-12-27 11:47:12'),(171,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2001','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:47:27'),(172,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2002','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:47:28'),(173,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2003','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:47:31'),(174,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2004','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:47:32'),(175,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2022-12-27 11:47:35'),(176,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2005','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:47:36'),(177,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 11:47:40'),(178,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"test_parent\"}',NULL,0,NULL,'2022-12-27 11:47:53'),(179,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"test_child\"}',NULL,0,NULL,'2022-12-27 11:56:01'),(180,'测试子表',1,'com.ruoyi.child.controller.TestChildController.add()','POST',1,'admin',NULL,'/child/child','127.0.0.1','内网IP','{\"info\":1,\"pId\":1,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/child/TestChildMapper.xml]\n### The error may involve com.ruoyi.child.mapper.TestChildMapper.insertTestChild-Inline\n### The error occurred while setting parameters\n### SQL: insert into test_child          ( p_id,             info )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2022-12-27 12:01:50'),(181,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2022-12-25 20:27:55\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":3,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:07:02'),(182,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2025','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:07:35'),(183,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2024','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2022-12-27 13:07:37'),(184,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2026','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:07:38'),(185,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2024','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2022-12-27 13:07:40'),(186,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2029','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:07:42'),(187,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2028','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:07:44'),(188,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2027','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:07:46'),(189,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2024','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:07:51'),(190,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2023','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:07:56'),(191,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2022','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:07:57'),(192,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2021','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:07:58'),(193,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2020','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:08:00'),(194,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2019','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:08:03'),(195,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2018','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 13:08:05'),(196,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2022-12-25 20:27:55\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":3,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 14:29:22'),(197,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','\"advisors,teachers,students\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:09:06'),(198,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"advisors\",\"className\":\"Advisors\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"导员编号\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户编号\",\"columnId\":12,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"辅导员管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"advisors\",\"options\":\"{\\\"parentMenuId\\\":1}\",\"packageName\":\"com.ruoyi.advisors\",\"params\":{\"parentMenuId\":1},\"parentMenuId\":\"1\",\"sub\":false,\"tableComment\":\"辅导员\",\"tableId\":4,\"tableName\":\"advisors\",\"tplCategory\":\"crud\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:11:23'),(199,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"students\",\"className\":\"Students\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"学号\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户 id\",\"columnId\":14,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EnterDate\",\"columnComment\":\"入学时间\",\"columnId\":15,\"columnName\":\"enter_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"enterDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Graduated\",\"columnComment\":\"是否已毕业\",\"columnId\":16,\"columnName\":\"graduated\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"graduated\",\"javaType\":\"Integer\",\"list\":true,\"p','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:12:30'),(200,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"是否\",\"dictType\":\"yes_or_no\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:13:29'),(201,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"是\",\"dictSort\":0,\"dictType\":\"yes_or_no\",\"dictValue\":\"y\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:18:55'),(202,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"否\",\"dictSort\":1,\"dictType\":\"yes_or_no\",\"dictValue\":\"n\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:19:07'),(203,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:18:55\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"是\",\"dictSort\":0,\"dictType\":\"yes_or_no\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:20:34'),(204,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:19:07\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"否\",\"dictSort\":1,\"dictType\":\"yes_or_no\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:20:38'),(205,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2022-12-25 20:27:55\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":3,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:21:52'),(206,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"teachers\",\"className\":\"Teachers\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"工号\",\"columnId\":18,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户 id\",\"columnId\":19,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"教师管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"teachers\",\"options\":\"{\\\"parentMenuId\\\":1}\",\"packageName\":\"com.ruoyi.teachers\",\"params\":{\"parentMenuId\":1},\"parentMenuId\":\"1\",\"sub\":false,\"tableComment\":\"教师\",\"tableId\":6,\"tableName\":\"teachers\",\"tplCategory\":\"crud\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:23:06'),(207,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"students\",\"className\":\"Students\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"学号\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 15:12:30\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户 id\",\"columnId\":14,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 15:12:30\",\"usableColumn\":false},{\"capJavaField\":\"EnterDate\",\"columnComment\":\"入学时间\",\"columnId\":15,\"columnName\":\"enter_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"enterDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-12-27 15:12:30\",\"usableColumn\":false},{\"capJavaField\":\"Graduated\",\"columnComment\":\"是否已毕业\",\"columnId\":16,\"columnName\":\"graduated\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"yes_or_no\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:23:20'),(208,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"advisors\"}',NULL,0,NULL,'2022-12-27 15:23:58'),(209,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"students\"}',NULL,0,NULL,'2022-12-27 15:23:59'),(210,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"teachers\"}',NULL,0,NULL,'2022-12-27 15:24:00'),(211,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"数理学院\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-27 15:35:52'),(212,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/students','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 15:55:36'),(213,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"students\",\"className\":\"Students\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"学号\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-12-28 15:55:36\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":14,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-12-28 15:55:36\",\"usableColumn\":false},{\"capJavaField\":\"DormitoryId\",\"columnComment\":\"宿舍号\",\"columnId\":20,\"columnName\":\"dormitory_id\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2022-12-28 15:55:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"dormitoryId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EnterDate\",\"columnComment\":\"入学时间\",\"columnId\":15,\"columnName\":\"enter_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 15:56:16'),(214,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"菜单回收站\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"system\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:05:01'),(215,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"students/students/index\",\"createTime\":\"2022-12-27 15:25:32\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2036,\"menuName\":\"学生管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2054,\"path\":\"students\",\"perms\":\"students:students:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:05:49'),(216,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"students/students/index\",\"createTime\":\"2022-12-28 15:59:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2048,\"menuName\":\"学生管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2054,\"path\":\"students\",\"perms\":\"students:students:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"修改菜单\'学生管理\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2022-12-28 16:05:56'),(217,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"students/students/index\",\"createTime\":\"2022-12-28 15:59:08\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2048,\"menuName\":\"学生管理_\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2054,\"path\":\"students\",\"perms\":\"students:students:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:06:03'),(218,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-28 16:05:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2054,\"menuName\":\"菜单回收站\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"none\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:06:28'),(219,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-25 20:27:55\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"菜单\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:08:37'),(220,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"advisors/advisors/index\",\"createTime\":\"2022-12-27 15:25:07\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"辅导员管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"advisors\",\"perms\":\"advisors:advisors:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:08:48'),(221,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"teachers/teachers/index\",\"createTime\":\"2022-12-27 15:25:48\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"教师管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"teachers\",\"perms\":\"teachers:teachers:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:08:55'),(222,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"students\"}',NULL,0,NULL,'2022-12-28 16:09:27'),(223,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"advisors/advisors/index\",\"createTime\":\"2022-12-27 15:25:07\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"辅导员管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"advisors\",\"perms\":\"advisors:advisors:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:09:46'),(224,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"advisors/advisors/index\",\"createTime\":\"2022-12-27 15:25:07\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"辅导员管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"advisors\",\"perms\":\"advisors:advisors:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:09:57'),(225,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"teachers/teachers/index\",\"createTime\":\"2022-12-27 15:25:48\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"教师管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"teachers\",\"perms\":\"teachers:teachers:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:10:04'),(226,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','\"dormitory_area\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:20:37'),(227,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"dormitory_area\",\"className\":\"DormitoryArea\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"宿舍区编号\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-28 16:20:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PId\",\"columnComment\":\"上级区域编号\",\"columnId\":22,\"columnName\":\"p_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-28 16:20:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"所属部门（校区/学院/专业等）\",\"columnId\":23,\"columnName\":\"dept_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-28 16:20:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"宿舍区名\",\"columnId\":24,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-28 16:20:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"p','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-28 16:23:03'),(228,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"dormitory_area\"}',NULL,0,NULL,'2022-12-28 16:23:07'),(229,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2037','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 10:05:36'),(230,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"学校直属\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 11:46:42'),(231,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/202','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 11:47:00'),(232,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','\"dormitory_managers,attendancy_score,others_score,dormitory_score,dormitory_rec,teachers_students,attendancy_rec,others_rec,activity_rec\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 12:01:05'),(233,'代码生成',2,'com.ruoyi.generator.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/scores','127.0.0.1','内网IP','{}',NULL,1,'同步数据失败，原表结构不存在','2022-12-29 12:04:09'),(234,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 12:04:28'),(235,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','\"test_temp\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 12:10:56'),(236,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"test_temp\",\"className\":\"TestTemp\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":69,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:10:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户\",\"columnId\":70,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:10:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"测试\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"test_temp\",\"options\":\"{\\\"parentMenuId\\\":2054}\",\"packageName\":\"com.ruoyi.test_temp\",\"params\":{\"parentMenuId\":2054},\"parentMenuId\":\"2054\",\"sub\":false,\"tableComment\":\"测试\",\"tableId\":17,\"tableName\":\"test_temp\",\"tplCategory\":\"crud\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 12:13:34'),(237,'宿舍区域管理',1,'com.ruoyi.dormitory_area.controller.DormitoryAreaController.add()','POST',1,'admin',NULL,'/dormitory_area/dormitory_area','127.0.0.1','内网IP','{\"children\":[],\"deptId\":101,\"id\":1,\"name\":\"和园（C 区）\",\"pId\":0,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 13:45:29'),(238,'宿舍区域管理',1,'com.ruoyi.dormitory_area.controller.DormitoryAreaController.add()','POST',1,'admin',NULL,'/dormitory_area/dormitory_area','127.0.0.1','内网IP','{\"children\":[],\"deptId\":103,\"id\":2,\"name\":\"C1\",\"pId\":1,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 13:45:51'),(239,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"dormitory_area\",\"className\":\"DormitoryArea\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"宿舍区编号\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-28 16:20:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2022-12-28 16:23:03\",\"usableColumn\":false},{\"capJavaField\":\"PId\",\"columnComment\":\"上级区域编号\",\"columnId\":22,\"columnName\":\"p_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-28 16:20:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2022-12-28 16:23:03\",\"usableColumn\":false},{\"capJavaField\":\"DeptId\",\"columnComment\":\"所属部门（校区/学院/专业等）\",\"columnId\":23,\"columnName\":\"dept_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-28 16:20:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"deptId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2022-12-28 16:23:03\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"宿舍区名\",\"columnId\":24,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-28 16:20:37\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 13:47:36'),(240,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"dormitory_area\"}',NULL,0,NULL,'2022-12-29 13:47:45'),(241,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"test_temp\",\"className\":\"TestTemp\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":69,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:10:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"updateTime\":\"2022-12-29 12:13:34\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户\",\"columnId\":70,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:10:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":17,\"updateBy\":\"\",\"updateTime\":\"2022-12-29 12:13:34\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"测试\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"test_temp\",\"options\":\"{\\\"parentMenuId\\\":\\\"2054\\\"}\",\"packageName\":\"com.ruoyi.test_temp\",\"params\":{\"parentMenuId\":\"2054\"},\"parentMenuId\":\"2054\",\"sub\":false,\"tableComment\":\"测试\",\"tableId\":17,\"tableName\":\"test_temp\",\"tplCategory\":\"crud\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 13:56:49'),(242,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"test_temp\"}',NULL,0,NULL,'2022-12-29 13:56:53'),(243,'测试',2,'com.ruoyi.test_temp.controller.TestTempController.edit()','PUT',1,'admin',NULL,'/test_temp/test_temp','127.0.0.1','内网IP','{\"id\":5,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 5\' at line 3\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/test_temp/TestTempMapper.xml]\n### The error may involve com.ruoyi.test_temp.mapper.TestTempMapper.updateTestTemp-Inline\n### The error occurred while setting parameters\n### SQL: update test_temp                    where id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 5\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 5\' at line 3','2022-12-29 14:00:20'),(244,'测试',2,'com.ruoyi.test_temp.controller.TestTempController.edit()','PUT',1,'admin',NULL,'/test_temp/test_temp','127.0.0.1','内网IP','{\"id\":0,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/test_temp/TestTempMapper.xml]\n### The error may involve com.ruoyi.test_temp.mapper.TestTempMapper.updateTestTemp-Inline\n### The error occurred while setting parameters\n### SQL: update test_temp                    where id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3','2022-12-29 14:00:34'),(245,'宿舍区域管理',1,'com.ruoyi.dormitory_area.controller.DormitoryAreaController.add()','POST',1,'admin',NULL,'/dormitory_area/dormitory_area','127.0.0.1','内网IP','{\"children\":[],\"deptId\":101,\"id\":3,\"name\":\"C2-204\",\"pId\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 14:00:57'),(246,'测试',2,'com.ruoyi.test_temp.controller.TestTempController.edit()','PUT',1,'admin',NULL,'/test_temp/test_temp','127.0.0.1','内网IP','{\"id\":0,\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3\n### The error may exist in URL [jar:file:/home/felix/RuoYi-Vue/ruoyi-admin/target/ruoyi-admin.jar!/BOOT-INF/classes!/mapper/test_temp/TestTempMapper.xml]\n### The error may involve com.ruoyi.test_temp.mapper.TestTempMapper.updateTestTemp-Inline\n### The error occurred while setting parameters\n### SQL: update test_temp                    where id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 0\' at line 3','2022-12-29 14:03:17'),(247,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"teachers\"}',NULL,0,NULL,'2022-12-29 14:41:26'),(248,'教师管理',1,'com.ruoyi.teachers.controller.TeachersController.add()','POST',1,'admin',NULL,'/teachers/teachers','127.0.0.1','内网IP','{\"id\":1,\"params\":{},\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 14:42:55'),(249,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"students\"}',NULL,0,NULL,'2022-12-29 14:55:50'),(250,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"nickName\":\"Aham\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"林凯锋\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:00:03'),(251,'学生管理',1,'com.ruoyi.students.controller.StudentsController.add()','POST',1,'admin',NULL,'/students/students','127.0.0.1','内网IP','{\"dormitoryId\":3,\"enterDate\":\"2022-12-29 00:00:00\",\"graduatePlan\":\"2022-12-30 00:00:00\",\"graduated\":0,\"id\":1,\"params\":{},\"userId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:00:36'),(252,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.changeStatus()','PUT',1,'admin',NULL,'/system/user/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:02:04'),(253,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.changeStatus()','PUT',1,'admin',NULL,'/system/user/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:03:34'),(254,'学生管理',1,'com.ruoyi.students.controller.StudentsController.add()','POST',1,'admin',NULL,'/students/students','127.0.0.1','内网IP','{\"dormitoryId\":1,\"enterDate\":\"2022-12-29 00:00:00\",\"graduatePlan\":\"2023-01-07 00:00:00\",\"graduated\":1,\"id\":2,\"params\":{},\"userId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:04:47'),(255,'学生管理',5,'com.ruoyi.students.controller.StudentsController.export()','POST',1,'admin',NULL,'/students/students/export','127.0.0.1','内网IP','{\"params\":{}}',NULL,0,NULL,'2022-12-29 15:04:55'),(256,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2036','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2022-12-29 15:11:08'),(257,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2038','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:19'),(258,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2041','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:22'),(259,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2040','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:23'),(260,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2039','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:26'),(261,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2036','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:27'),(262,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2053','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:30'),(263,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2052','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:32'),(264,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2051','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:33'),(265,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2050','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:35'),(266,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2049','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:37'),(267,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2048','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:14:38'),(268,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"students\",\"className\":\"Students\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"学号\",\"columnId\":13,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-12-28 15:56:16\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":14,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-12-28 15:56:16\",\"usableColumn\":false},{\"capJavaField\":\"DormitoryId\",\"columnComment\":\"宿舍号\",\"columnId\":20,\"columnName\":\"dormitory_id\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2022-12-28 15:55:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"dormitoryId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2022-12-28 15:56:16\",\"usableColumn\":false},{\"capJavaField\":\"EnterDate\",\"columnComment\":\"入学时间\",\"columnId\":15,\"columnName\":\"enter_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2022-12-27 15:09:06\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:25:31'),(269,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"students\"}',NULL,0,NULL,'2022-12-29 15:25:38'),(270,'学生管理',1,'com.ruoyi.students.controller.StudentsController.add()','POST',1,'admin',NULL,'/students/students','127.0.0.1','内网IP','{\"dormitoryId\":1,\"enterDate\":\"2022-12-29 00:00:00\",\"graduatePlan\":\"2022-12-31 00:00:00\",\"graduated\":0,\"id\":1,\"params\":{},\"userId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 15:34:05'),(271,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 16:13:15'),(272,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 16:13:18'),(273,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"others_score\",\"className\":\"OthersScore\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"类型编号\",\"columnId\":60,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"PId\",\"columnComment\":\"上级类型\",\"columnId\":61,\"columnName\":\"p_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"pId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"类型名\",\"columnId\":62,\"columnName\":\"type_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Score\",\"columnComment\":\"扣分\",\"columnId\":63,\"columnName\":\"score\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"score\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":fal','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 16:16:17'),(274,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"others_score\"}',NULL,0,NULL,'2022-12-29 16:16:37'),(275,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"activity_rec\",\"className\":\"ActivityRec\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"活动人\",\"columnId\":26,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AddedBy\",\"columnComment\":\"添加者\",\"columnId\":27,\"columnName\":\"added_by\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"addedBy\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecDate\",\"columnComment\":\"日期\",\"columnId\":28,\"columnName\":\"rec_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"recDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 16:20:59'),(276,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"others_rec\",\"className\":\"OthersRec\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":53,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"扣分学生\",\"columnId\":54,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeId\",\"columnComment\":\"类型编号\",\"columnId\":55,\"columnName\":\"type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AddedBy\",\"columnComment\":\"添加者\",\"columnId\":56,\"columnName\":\"added_by\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"addedBy\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":f','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 16:25:17'),(277,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"dormitory_rec\",\"className\":\"DormitoryRec\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"bianhao\",\"columnId\":44,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"扣分人\",\"columnId\":45,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeId\",\"columnComment\":\"扣分类型\",\"columnId\":46,\"columnName\":\"type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AddedBy\",\"columnComment\":\"添加人\",\"columnId\":47,\"columnName\":\"added_by\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"addedBy\",\"javaType\":\"Long\",\"list\":true,\"params\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 16:27:22'),(278,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"dormitory_rec\",\"className\":\"DormitoryRec\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"bianhao\",\"columnId\":44,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2022-12-29 16:27:22\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"扣分人\",\"columnId\":45,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2022-12-29 16:27:22\",\"usableColumn\":false},{\"capJavaField\":\"TypeId\",\"columnComment\":\"扣分类型\",\"columnId\":46,\"columnName\":\"type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"updateTime\":\"2022-12-29 16:27:22\",\"usableColumn\":false},{\"capJavaField\":\"AddedBy\",\"columnComment\":\"添加人\",\"columnId\":47,\"columnName\":\"added_by\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInser','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 16:28:01'),(279,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"attendancy_rec\",\"className\":\"AttendancyRec\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":31,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"扣分人\",\"columnId\":32,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeId\",\"columnComment\":\"扣分类型\",\"columnId\":33,\"columnName\":\"type_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AddedBy\",\"columnComment\":\"添加者\",\"columnId\":34,\"columnName\":\"added_by\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"addedBy\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"p','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 16:29:29'),(280,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"attendancy_rec\"}',NULL,0,NULL,'2022-12-29 16:29:33'),(281,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"dormitory_rec\"}',NULL,0,NULL,'2022-12-29 16:29:34'),(282,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"others_rec\"}',NULL,0,NULL,'2022-12-29 16:29:36'),(283,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"attendancy_score\",\"className\":\"AttendancyScore\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":38,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"扣分项名\",\"columnId\":39,\"columnName\":\"type_name\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Score\",\"columnComment\":\"扣分\",\"columnId\":40,\"columnName\":\"score\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"score\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"考勤扣分项管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"attendancy_score\",\"options\":\"{\\\"parentMenuId\\\":1}\",\"packageName\":\"com.ruoyi.attendancy_score\",\"params\":{\"parentMenuId\":1},\"parentMenuId\":\"1\",\"sub\":false,\"tableComment\":\"考勤扣分项\",\"tableId\":10,\"tableName\":\"attendancy_score\",\"tplCategory\":\"crud\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 17:52:04'),(284,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"dormitory_score\",\"className\":\"DormitoryScore\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":50,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TypeName\",\"columnComment\":\"扣分项名\",\"columnId\":51,\"columnName\":\"type_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"typeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Score\",\"columnComment\":\"扣分\",\"columnId\":52,\"columnName\":\"score\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"score\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"宿舍扣分项管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"dormitory_score\",\"options\":\"{\\\"parentMenuId\\\":1}\",\"packageName\":\"com.ruoyi.dormitory_score\",\"params\":{\"parentMenuId\":1},\"parentMenuId\":\"1\",\"sub\":false,\"tableComment\":\"宿舍扣分项\",\"tableId\":13,\"tableName\":\"dormitory_score\",\"tplCategory\":\"crud\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 17:53:18'),(285,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"attendancy_rec\"}',NULL,0,NULL,'2022-12-29 17:53:40'),(286,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"attendancy_score\"}',NULL,0,NULL,'2022-12-29 17:53:43'),(287,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"dormitory_score\"}',NULL,0,NULL,'2022-12-29 17:53:45'),(288,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"dormitory_managers\",\"className\":\"DormitoryManagers\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"工号\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":42,\"columnName\":\"user_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DormitoryId\",\"columnComment\":\"管辖区\",\"columnId\":43,\"columnName\":\"dormitory_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"dormitoryId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"宿管管理\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"dormitory_managers\",\"options\":\"{\\\"parentMenuId\\\":1}\",\"packageName\":\"com.ruoyi.dormitory_managers\",\"params\":{\"parentMenuId\":1},\"parentMenuId\":\"1\",\"sub\":false,\"tableComment\":\"宿管\",\"tableId\":11,\"tableName\":\"dormitory_managers\",\"tplCategory\":\"crud\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 18:00:34'),(289,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"teach\",\"className\":\"TeachersStudents\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"编号\",\"columnId\":64,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TeacherId\",\"columnComment\":\"教师\",\"columnId\":65,\"columnName\":\"teacher_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"teacherId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StudentId\",\"columnComment\":\"学生\",\"columnId\":66,\"columnName\":\"student_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"studentId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CourseName\",\"columnComment\":\"课程名\",\"columnId\":67,\"columnName\":\"course_name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-29 12:01:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"courseName\",\"javaType\":\"String\",\"lis','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 18:03:10'),(290,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"teachers_students\"}',NULL,0,NULL,'2022-12-29 18:03:21'),(291,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"dormitory_managers\"}',NULL,0,NULL,'2022-12-29 18:03:40'),(292,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"个人中心\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"path\":\"/usr/profile\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 18:08:18'),(293,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2022-12-29 18:08:18\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2121,\"menuName\":\"个人中心\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"path\":\"/user/profile\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 18:08:39'),(294,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"search\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"总分查询\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"/total\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 19:06:01'),(295,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/total/total\",\"createTime\":\"2022-12-29 19:06:01\",\"icon\":\"search\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2122,\"menuName\":\"总分查询\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"total\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 19:25:43'),(296,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/total/total/index\",\"createTime\":\"2022-12-29 19:06:01\",\"icon\":\"search\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2122,\"menuName\":\"总分查询\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"total\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 19:25:58'),(297,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"total/total/index\",\"createTime\":\"2022-12-29 19:06:01\",\"icon\":\"search\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2122,\"menuName\":\"总分查询\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"total\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 19:33:03'),(298,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"deptId\":100,\"nickName\":\"Aham\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userName\":\"林凯锋\"}','{\"msg\":\"新增用户\'林凯锋\'失败，登录账号已存在\",\"code\":500}',0,NULL,'2022-12-29 21:15:11'),(299,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"Aham\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"林凯锋2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-29 21:15:20'),(300,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"attendancy_rec\"}',NULL,0,NULL,'2022-12-30 00:06:10'),(301,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"dormitory_rec\"}',NULL,0,NULL,'2022-12-30 00:06:12'),(302,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"others_rec\"}',NULL,0,NULL,'2022-12-30 00:06:44'),(303,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"dormitory_score\"}',NULL,0,NULL,'2022-12-30 00:06:54'),(304,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"attendancy_score\"}',NULL,0,NULL,'2022-12-30 00:07:00'),(305,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"teachers_students\"}',NULL,0,NULL,'2022-12-30 00:07:10'),(306,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"dormitory_managers\"}',NULL,0,NULL,'2022-12-30 00:07:16'),(307,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"advisors\"}',NULL,0,NULL,'2022-12-30 00:10:30'),(308,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"students/students/index\",\"createTime\":\"2022-12-28 16:11:14\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2055,\"menuName\":\"学生管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"students\",\"perms\":\"students:students:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:25:47'),(309,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory_area/dormitory_area/index\",\"createTime\":\"2022-12-28 16:24:11\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2061,\"menuName\":\"宿舍区域管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"dormitory_area\",\"perms\":\"dormitory_area:dormitory_area:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:25:57'),(310,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"others_score/others_score/index\",\"createTime\":\"2022-12-29 16:17:34\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2073,\"menuName\":\"其它扣分项管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"others_score\",\"perms\":\"others_score:others_score:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:26:06'),(311,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"attendancy_rec/attendancy_rec/index\",\"createTime\":\"2022-12-29 16:30:36\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2079,\"menuName\":\"考勤扣分记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"attendancy_rec\",\"perms\":\"attendancy_rec:attendancy_rec:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:26:16'),(312,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory_area/dormitory_area/index\",\"createTime\":\"2022-12-28 16:24:11\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2061,\"menuName\":\"宿舍区域管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"dormitory_area\",\"perms\":\"dormitory_area:dormitory_area:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:26:37'),(313,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"others_score/others_score/index\",\"createTime\":\"2022-12-29 16:17:34\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2073,\"menuName\":\"其它扣分项管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"others_score\",\"perms\":\"others_score:others_score:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:26:45'),(314,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"attendancy_rec/attendancy_rec/index\",\"createTime\":\"2022-12-29 16:30:36\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2079,\"menuName\":\"考勤扣分记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"attendancy_rec\",\"perms\":\"attendancy_rec:attendancy_rec:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:26:55'),(315,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory_rec/dormitory_rec/index\",\"createTime\":\"2022-12-29 16:31:00\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2085,\"menuName\":\"宿舍扣分记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"dormitory_rec\",\"perms\":\"dormitory_rec:dormitory_rec:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:27:05'),(316,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"others_rec/others_rec/index\",\"createTime\":\"2022-12-29 16:31:19\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2091,\"menuName\":\"其它扣分记录\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"others_rec\",\"perms\":\"others_rec:others_rec:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:27:12'),(317,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory_score/dormitory_score/index\",\"createTime\":\"2022-12-29 17:55:07\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2097,\"menuName\":\"宿舍扣分项管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"dormitory_score\",\"perms\":\"dormitory_score:dormitory_score:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:27:30'),(318,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"attendancy_score/attendancy_score/index\",\"createTime\":\"2022-12-29 17:55:27\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2103,\"menuName\":\"考勤扣分项管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"attendancy_score\",\"perms\":\"attendancy_score:attendancy_score:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:27:36'),(319,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"teach/teach/index\",\"createTime\":\"2022-12-29 18:04:41\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2109,\"menuName\":\"授课考勤\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"teach\",\"perms\":\"teach:teach:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:27:46'),(320,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dormitory_managers/dormitory_managers/index\",\"createTime\":\"2022-12-29 18:04:59\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2115,\"menuName\":\"宿管管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"dormitory_managers\",\"perms\":\"dormitory_managers:dormitory_managers:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 00:28:08'),(321,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2022-12-25 20:27:55\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2121,101,1007,1008,1009,1010,1011,103,1016,1017,1018,1019,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,102,1012,1013,1014,1015,117,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"学生\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-30 09:57:55'),(322,'宿舍区域管理',2,'com.ruoyi.dormitory_area.controller.DormitoryAreaController.edit()','PUT',1,'admin',NULL,'/dormitory_area/dormitory_area','127.0.0.1','内网IP','{\"children\":[],\"deptId\":101,\"id\":3,\"name\":\"C1-204\",\"pId\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-31 21:08:18'),(323,'宿舍区域管理',1,'com.ruoyi.dormitory_area.controller.DormitoryAreaController.add()','POST',1,'admin',NULL,'/dormitory_area/dormitory_area','127.0.0.1','内网IP','{\"children\":[],\"deptId\":103,\"id\":4,\"name\":\"C1-205\",\"pId\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-31 21:08:52'),(324,'宿舍区域管理',1,'com.ruoyi.dormitory_area.controller.DormitoryAreaController.add()','POST',1,'admin',NULL,'/dormitory_area/dormitory_area','127.0.0.1','内网IP','{\"children\":[],\"deptId\":101,\"id\":5,\"name\":\"C1-206\",\"pId\":2,\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2022-12-31 21:09:57');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2022-12-25 20:27:55','',NULL,''),(2,'se','项目经理',2,'0','admin','2022-12-25 20:27:55','',NULL,''),(3,'hr','人力资源',3,'0','admin','2022-12-25 20:27:55','',NULL,''),(4,'user','普通员工',4,'0','admin','2022-12-25 20:27:55','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2022-12-25 20:27:55','',NULL,'超级管理员'),(2,'学生','common',3,'2',1,1,'0','0','admin','2022-12-25 20:27:55','admin','2022-12-30 09:57:55','普通角色'),(100,'教师','teacher',2,'1',1,1,'0','0','admin','2022-12-26 18:59:55','admin','2022-12-26 19:00:13',NULL),(101,'行政工作人员','administration',4,'1',1,1,'0','0','admin','2022-12-26 19:00:52','',NULL,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,2121);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-01-01 01:23:26','admin','2022-12-25 20:27:55','','2023-01-01 01:23:26','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2022-12-25 20:27:55','admin','2022-12-25 20:27:55','',NULL,'测试员'),(100,103,'林凯锋','Aham','00','','','0','','$2a$10$dRQSVODraNPvWicIrPoX.eXfjvMShdky36DKGEjUPhXu3RCvFNhFS','0','0','',NULL,'admin','2022-12-29 15:00:02','admin','2022-12-29 15:03:34',NULL),(101,100,'林凯锋2','Aham','00','','','0','','$2a$10$8cWUinLx.d3bUsIDY65See0EZZCV8eUCp9Neoy/gMwtnyQzzAJ/Jq','0','0','',NULL,'admin','2022-12-29 21:15:20','',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,2);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers_students`
--

DROP TABLE IF EXISTS `teachers_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `course_name` varchar(20) DEFAULT NULL,
  `course_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers_students`
--

LOCK TABLES `teachers_students` WRITE;
/*!40000 ALTER TABLE `teachers_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_child`
--

DROP TABLE IF EXISTS `test_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_child` (
  `id` int NOT NULL,
  `p_id` int DEFAULT NULL,
  `info` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_child`
--

LOCK TABLES `test_child` WRITE;
/*!40000 ALTER TABLE `test_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_parent`
--

DROP TABLE IF EXISTS `test_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_parent` (
  `id` int NOT NULL,
  `info` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_parent`
--

LOCK TABLES `test_parent` WRITE;
/*!40000 ALTER TABLE `test_parent` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_temp`
--

DROP TABLE IF EXISTS `test_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_temp` (
  `id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_temp`
--

LOCK TABLES `test_temp` WRITE;
/*!40000 ALTER TABLE `test_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_temp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-02 21:23:10
