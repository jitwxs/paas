/*
 Navicat Premium Data Transfer

 Source Server         : jitwxs
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : www.jitwxs.cn:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 06/07/2018 13:12:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for repository_image
-- ----------------------------
DROP TABLE IF EXISTS `repository_image`;
CREATE TABLE `repository_image`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '镜像ID',
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镜像完整名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `digest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `repo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓储',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓储镜像' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_image
-- ----------------------------
DROP TABLE IF EXISTS `sys_image`;
CREATE TABLE `sys_image`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镜像ID',
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镜像完整名',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镜像名',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'TAG',
  `size` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '所占大小',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '镜像类型【1：公共镜像；2：用户镜像】',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '如果是用户镜像，指明用户ID',
  `has_open` tinyint(1) NULL DEFAULT NULL COMMENT '如果是用户镜像，是否公开',
  `virtual_size` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `labels` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cmd` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `repo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库地址【官方：library】',
  `parent_id` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_image
-- ----------------------------
INSERT INTO `sys_image` VALUES ('2250625c3f20460fb3cb2f9bbf610c90', '7afb7abcfe5f2c54e9a34ddf70337aa7d207eee2bc172100dc439e97bfebfcee', 'portainer/portainer:latest', 'portainer', 'latest', '56967692', 1, NULL, NULL, '56967692', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"ENTRYPOINT [\\\"/portainer\\\"]\"]', 'portainer', '', '2018-07-06 10:17:13', NULL);
INSERT INTO `sys_image` VALUES ('5384795e50564e519ba31a7d50f8986d', '6023e1a77132e3fc3aa27ea88aa2b7e4d51d13e39c5eb257f044a7d7ce36d9aa', 'rancher/agent:v1.2.10', 'agent', 'v1.2.10', '237099249', 1, NULL, NULL, '237099249', '{\"io.rancher.container.system\":\"rancher-agent\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"ENV RANCHER_AGENT_IMAGE=rancher/agent:v1.2.10\"]', 'rancher', '', '2018-07-06 10:17:13', NULL);
INSERT INTO `sys_image` VALUES ('806904891725465999472a9cfb153301', 'e38bc07ac18ee64e6d59cf2eafcdddf9cec2364dfe129fe0af75f1b0194e0c96', 'hello-world:latest', 'hello-world', 'latest', '1848', 1, NULL, NULL, '1848', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/hello\\\"]\"]', 'library', '', '2018-07-06 10:40:58', NULL);
INSERT INTO `sys_image` VALUES ('8758290ce6e34aed9f5735c0c453fc32', '5699ececb21caf07b92cbda9daa1e965407e3793a72000ecbf6b8e8595a0824a', 'nginx:latest', 'nginx', 'latest', '108951970', 1, NULL, NULL, '108951970', '{\"maintainer\":\"NGINX Docker Maintainers <docker-maint@nginx.com>\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"nginx\\\" \\\"-g\\\" \\\"daemon off;\\\"]\"]', 'library', '', '2018-07-06 10:17:13', NULL);
INSERT INTO `sys_image` VALUES ('c58530d71eea4dee9691bf1aff5e755c', '85b3b338d0be0fb970893e03e97b1fffaa2e0fb20a953eb2f49f162bae99ed80', 'rancher/server:stable', 'server', 'stable', '1084241459', 1, NULL, NULL, '1084241459', '{}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/usr/bin/s6-svscan\\\" \\\"/service\\\"]\"]', 'rancher', '', '2018-07-06 10:17:13', NULL);
INSERT INTO `sys_image` VALUES ('f3ad206803a545659e48c0deb9059e2b', 'e38bc07ac18ee64e6d59cf2eafcdddf9cec2364dfe129fe0af75f1b0194e0c96', '192.168.100.183:5000/hello-world-f4f4bb152cf54fec94eb0d2b22d25f71:latest', 'hello-world', 'latest', '1848', 1, NULL, NULL, '1848', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/hello\\\"]\"]', '192.168.100.183:5000', '', '2018-07-06 11:07:12', NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户ID',
  `type` int(11) NULL DEFAULT NULL COMMENT '日志类型',
  `action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求Url',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问IP',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `exception` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_login`;
CREATE TABLE `sys_login`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `has_freeze` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否冻结，默认false',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '权限id',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登陆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login
-- ----------------------------
INSERT INTO `sys_login` VALUES ('1013583885005561858', 'li', '$2a$10$53MyY0lVZH..tV9L4H405enP6nbgHq/CXtZ7aQjJWbZxB1u6lf6Py', '3123357056@qq.com', 1, 1, '2018-07-02 08:43:24', NULL);
INSERT INTO `sys_login` VALUES ('1231451941131', 'sys', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', NULL, 0, 2, '2018-06-27 16:29:56', NULL);
INSERT INTO `sys_login` VALUES ('1249181023313', 'user', '$2a$10$tj2Ehs75tdIil2SHoaBb6u54wKUgQwjenO3RuaWXBEOsQZ8bupe3q', 'jitwxs@foxmail.com', 0, 1, '2018-06-29 17:01:43', '2018-06-29 17:06:33');
INSERT INTO `sys_login` VALUES ('3241513613121', '666', '$2a$10$dIvHWSbeUqUiQDyNoSpOAes.Zl9zCLXSJbYejXkPTbUVlLxlgsNFa', '2212557736@qq.com', 1, 2, '2018-06-30 01:25:11', '2018-06-30 16:42:40');
INSERT INTO `sys_login` VALUES ('4151361367131', '18083764688', '123456', '827622690@qq.com', 1, 1, '2018-06-30 09:43:29', '2018-06-30 16:42:40');
INSERT INTO `sys_login` VALUES ('f4f4bb152cf54fec94eb0d2b22d25f71', 'sya', '$2a$10$3zdHQxZ3WkN8efEwdFZyNuVKpu14SQ3077Y2rD7HyAJpelObSpNum', '973383318@qq.com', 0, 1, '2018-06-30 11:09:18', '2018-06-30 11:09:39');

-- ----------------------------
-- Table structure for sys_repository
-- ----------------------------
DROP TABLE IF EXISTS `sys_repository`;
CREATE TABLE `sys_repository`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NULL DEFAULT NULL COMMENT '仓储类型【1：Docker容器；2：Docker Hub】',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓储地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_repository
-- ----------------------------
INSERT INTO `sys_repository` VALUES (1, 1, '192.168.30.175');
INSERT INTO `sys_repository` VALUES (2, 2, '192.168.100.183:5000');
INSERT INTO `sys_repository` VALUES (4, 2, '123.562.33.3');
INSERT INTO `sys_repository` VALUES (5, 2, '123.22.2.3');
INSERT INTO `sys_repository` VALUES (6, 1, '123.22.2.3');
INSERT INTO `sys_repository` VALUES (7, 1, '123.22.2.66');
INSERT INTO `sys_repository` VALUES (8, 1, '123.1.2.3');
INSERT INTO `sys_repository` VALUES (9, 1, '12.2.5.8.2');
INSERT INTO `sys_repository` VALUES (10, 1, '1.2.3.4');

-- ----------------------------
-- Table structure for sys_volume
-- ----------------------------
DROP TABLE IF EXISTS `sys_volume`;
CREATE TABLE `sys_volume`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `container_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '容器ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂载名称',
  `destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容器内目录',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂载目录',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_volume
-- ----------------------------
INSERT INTO `sys_volume` VALUES ('22710dba2e16487795655e68e56be8e9', 'e2ae80b9d4cf4f09433e9957b5f62b40ee562d1b62837165502c4d5f7996d3c5', '5707b93721f8913e39315d3eec3e77f8096949fe80c1a61a78b5213fae8add42', '/usr/local/hello', '/var/lib/docker/volumes/5707b93721f8913e39315d3eec3e77f8096949fe80c1a61a78b5213fae8add42/_data', '2018-07-05 11:06:55', NULL);
INSERT INTO `sys_volume` VALUES ('f6658faa690441189cdf3f34c5546167', 'e2ae80b9d4cf4f09433e9957b5f62b40ee562d1b62837165502c4d5f7996d3c5', '7cdf905d9f1f90d9a1166b34fdde554c3fc6edaa30b1fe936180478f1ad999f7', '/usr/local/world', '/var/lib/docker/volumes/7cdf905d9f1f90d9a1166b34fdde554c3fc6edaa30b1fe936180478f1ad999f7/_data', '2018-07-05 11:06:55', NULL);

-- ----------------------------
-- Table structure for user_container
-- ----------------------------
DROP TABLE IF EXISTS `user_container`;
CREATE TABLE `user_container`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '容器ID',
  `project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容器名',
  `command` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行命令',
  `port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '端口',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '镜像名',
  `status` int(10) NULL DEFAULT NULL COMMENT '容器状态',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环境参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户容器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_container
-- ----------------------------
INSERT INTO `user_container` VALUES ('129663e302ed2c8cf8dd1ce123061213ac789553f3d5d0ef4a79524b495a51c2', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'ppp', '[]', '{\"3306/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"24279\"}]}', 'mysql:latest', 0, '2018-07-04 15:01:08', NULL, 'MYSQL_ROOT_PASSWORD=123456');
INSERT INTO `user_container` VALUES ('3eccb7d3111b7eebd45a2d944f3c8625026a2b84a463e66e340bc9dbdf6970d4', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'ttt', 'null', '{\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"13034\"}]}', 'nginx:latest', 0, '2018-07-02 14:26:50', NULL, NULL);
INSERT INTO `user_container` VALUES ('54c4af1b16370796dc5d442beac3ea86c83a603e09acb29dfe830310faa9c6a3', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'testContainer', 'null', '{\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"13479\"}]}', 'nginx:latest', 0, '2018-07-02 11:20:34', '2018-07-02 11:33:51', NULL);
INSERT INTO `user_container` VALUES ('55f82959af43bf2e7ff638aa9d1e34aefcc5d3fd0a9f9def9d607a6f8ea4f550', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'ttt', '[/bin/sh, -c, #(nop) , CMD [\"nginx\" \"-g\" \"daemon off;\"]]', '{\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"65004\"}]}', 'nginx:latest', 0, '2018-07-04 16:58:57', NULL, NULL);
INSERT INTO `user_container` VALUES ('e2ae80b9d4cf4f09433e9957b5f62b40ee562d1b62837165502c4d5f7996d3c5', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'my-hello-world', '[/bin/sh, -c, #(nop) , CMD [\"/hello\"]]', NULL, 'hello-world:latest', 0, '2018-07-05 11:06:56', NULL, 'NAME=JITWXS');
INSERT INTO `user_container` VALUES ('f0d99bf2945cf1021040a045405b61c2d6fc37e467bb56d61a29416184fedd4b', 'b2b09405f54c4cf3a9e70b4ec298b31a', '666', 'null', '{\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"61139\"}]}', 'nginx:latest', 1, '2018-07-02 11:10:49', '2018-07-02 11:16:11', NULL);

-- ----------------------------
-- Table structure for user_project
-- ----------------------------
DROP TABLE IF EXISTS `user_project`;
CREATE TABLE `user_project`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_project
-- ----------------------------
INSERT INTO `user_project` VALUES ('51553ff30e644ae78926e22392bf7a98', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'JavaWeb01', '第一个JavaWeb环境', '2018-07-05 11:02:27', NULL);
INSERT INTO `user_project` VALUES ('5297b6f4dc1941bda5303f6b862c98a5', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'ssdsd', 'xfxxc', '2018-07-05 11:06:55', NULL);
INSERT INTO `user_project` VALUES ('6860df07dd1445228ff21d53eb18be65', 'f4f4bb152cf54fec94eb0d2b22d25f71', '\"111\"', NULL, '2018-07-01 15:08:47', NULL);
INSERT INTO `user_project` VALUES ('6afcadce648848e49bd976301881e7c5', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'JavaWeb01', '第一个JavaWeb环境', '2018-07-05 11:02:24', NULL);
INSERT INTO `user_project` VALUES ('aabakfsvakiuw1213', 'f4f4bb152cf54fec94eb0d2b22d25f71', '项目1', '项目1的描述', '2018-06-30 10:14:07', NULL);
INSERT INTO `user_project` VALUES ('ablaiawru1321', '4151361367131', '测试项目1', '测试项目1的描述', '2018-06-30 10:14:43', NULL);
INSERT INTO `user_project` VALUES ('afaowrwfvxz4e1', '4151361367131', '测试项目2', '测试项目2的描述', '2018-06-30 10:14:57', NULL);
INSERT INTO `user_project` VALUES ('b2b09405f54c4cf3a9e70b4ec298b31a', 'f4f4bb152cf54fec94eb0d2b22d25f71', '111', NULL, '2018-07-01 15:09:01', NULL);
INSERT INTO `user_project` VALUES ('bkjaqalfa231fa', '1231451941131', '项目2', '项目2的描述', '2018-06-30 10:14:16', NULL);

SET FOREIGN_KEY_CHECKS = 1;
