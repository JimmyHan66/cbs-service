
-- ----------------------------
-- Creat dbcbs DB
-- ----------------------------
CREATE DATABASE IF NOT EXISTS `dbcbs` DEFAULT charset utf8 COLLATE utf8_general_ci;

-- 创建dbcbs用户
CREATE USER 'dbcbs'@'%' IDENTIFIED BY 'Vmcbsdb1;';
GRANT ALL privileges ON *.* TO 'dbcbs'@'%';
FLUSH PRIVILEGES;
