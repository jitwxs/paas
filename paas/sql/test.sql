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

 Date: 01/07/2018 16:33:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_image
-- ----------------------------
DROP TABLE IF EXISTS `sys_image`;
CREATE TABLE `sys_image`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '镜像ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '镜像名',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'TAG',
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所占大小',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '镜像类型【1：公共镜像；2：用户镜像】',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '如果是用户镜像，指明用户ID',
  `has_open` tinyint(1) NULL DEFAULT NULL COMMENT '如果是用户镜像，是否公开',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `virtual_size` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `labels` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_image
-- ----------------------------
INSERT INTO `sys_image` VALUES ('11', '111', '1', NULL, 2, '1', 1, '2018-06-28 16:36:53', NULL, NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES ('12', '12', '2', NULL, 2, '1', 0, '2018-06-28 16:37:04', NULL, NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES ('123', 'new', 'null', '1369600', 1, '123', 0, '2018-06-30 15:14:41', '2018-06-30 15:14:41', NULL, NULL, NULL);

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
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('02cda8ef63b84653a250a5ce8fdeba64', NULL, 1, '/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=666&password=', '', '2018-06-30 17:21:20');
INSERT INTO `sys_log` VALUES ('07d89ef1935f4800ba03541aed6fc0d9', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-06-30 18:37:38');
INSERT INTO `sys_log` VALUES ('0b5fde70d4c449e09b9c935f7124be3c', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-07-01 09:40:25');
INSERT INTO `sys_log` VALUES ('15ca1188529141aba651bf11bea35335', NULL, 1, '/login', 'POST', '192.168.100.139', 'PostmanRuntime/7.1.5', 'username=sys&password=', '', '2018-07-01 11:06:52');
INSERT INTO `sys_log` VALUES ('290f5455a1ca464ca6d4ad73e7370dd5', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 16:24:49');
INSERT INTO `sys_log` VALUES ('3aee32b4e9114a2fad32a3a025b53303', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 14:58:45');
INSERT INTO `sys_log` VALUES ('444cdfd8fc1e4ab1a56d03c061332a9c', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sys&password=', '', '2018-07-01 14:40:00');
INSERT INTO `sys_log` VALUES ('5814daa9f6fa4e9785e13a318df6641e', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-06-30 21:14:09');
INSERT INTO `sys_log` VALUES ('5a459e8b380e44908bbfe851575af7ad', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sys&password=', '', '2018-06-30 17:03:26');
INSERT INTO `sys_log` VALUES ('69d4b916eb8a45099b6ebb8aca93de02', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-06-30 20:10:01');
INSERT INTO `sys_log` VALUES ('6e1d1a4630784fc597df3776c81e2e4f', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-06-30 16:35:22');
INSERT INTO `sys_log` VALUES ('8920e1a26cff46c7b2eca56abff4106b', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 16:24:47');
INSERT INTO `sys_log` VALUES ('9b754e2bae094f279444ad2c7d85f725', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-07-01 09:24:39');
INSERT INTO `sys_log` VALUES ('ae6ca5359ce74855ad0f22a6c585a518', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 08:39:35');
INSERT INTO `sys_log` VALUES ('aeba625a18b34bda94a14eb167b46928', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sys&password=', '', '2018-06-30 15:53:50');
INSERT INTO `sys_log` VALUES ('b31f0017cd234ff3addd79ef7040d61c', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-01 15:06:21');
INSERT INTO `sys_log` VALUES ('b362cd9acb57470bb048dc67de661f67', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 14:47:15');
INSERT INTO `sys_log` VALUES ('b708a99fbd754b3a83d01b073d668c22', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sys&password=', '', '2018-06-30 15:08:21');
INSERT INTO `sys_log` VALUES ('c72df75050cb4907b347406dc13fbefc', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 14:58:40');
INSERT INTO `sys_log` VALUES ('d0fa0fcd81ae4227b0f3d841032b517d', '1231451941131', 3, '/admin/modifyTheUserInfo', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=18083764688&password=&uid=4151361367131&email=827622690@qq.com', '', '2018-06-30 16:35:51');
INSERT INTO `sys_log` VALUES ('d2c891b157ae43e0b23550b7c0bc5399', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 14:47:12');
INSERT INTO `sys_log` VALUES ('d42d90b6196c42029cbf7087a0162fbd', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 08:39:31');

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
  INDEX `fk_role_id`(`role_id`) USING BTREE,
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登陆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login
-- ----------------------------
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_repository
-- ----------------------------
INSERT INTO `sys_repository` VALUES (1, 1, '192.168.30.171');
INSERT INTO `sys_repository` VALUES (2, 2, '192.168.30.169');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'ROLE_USER');
INSERT INTO `sys_role` VALUES (2, 'ROLE_SYSTEM');

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
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容器状态',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户容器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_container
-- ----------------------------
INSERT INTO `user_container` VALUES ('9bdfd7e51f22d20080498750629329f98d64b6e461f55a7d27aa9fe855c53689', 'ablaiawru1321', 'syacontainer', '[Ljava.lang.String;@37806be6', '[Ljava.lang.String;@7bce9ce4', NULL, '0', '2018-07-01 12:59:43', '2018-07-01 13:07:44');
INSERT INTO `user_container` VALUES ('a6c963cab58f4d795dfbe93f6f587c7c58bb258e1fac8bbc1d69c1f80268abc2', '1234', 'syacontainer', '[Ljava.lang.String;@7573c7b5', '[Ljava.lang.String;@73da7f08', NULL, '0', '2018-07-01 14:34:42', NULL);
INSERT INTO `user_container` VALUES ('b44c0b7f849a237b0f825230aacaed9be347e904d299ad1753dc2a712c9da227', '1234', 'syacontainer', '[Ljava.lang.String;@3caf5c96', '[Ljava.lang.String;@5b3755f4', NULL, '0', '2018-07-01 13:58:56', NULL);

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
INSERT INTO `user_project` VALUES ('6860df07dd1445228ff21d53eb18be65', 'f4f4bb152cf54fec94eb0d2b22d25f71', '\"111\"', NULL, '2018-07-01 15:08:47', NULL);
INSERT INTO `user_project` VALUES ('aabakfsvakiuw1213', '1231451941131', '项目1', '项目1的描述', '2018-06-30 10:14:07', NULL);
INSERT INTO `user_project` VALUES ('ablaiawru1321', '4151361367131', '测试项目1', '测试项目1的描述', '2018-06-30 10:14:43', NULL);
INSERT INTO `user_project` VALUES ('afaowrwfvxz4e1', '4151361367131', '测试项目2', '测试项目2的描述', '2018-06-30 10:14:57', NULL);
INSERT INTO `user_project` VALUES ('b2b09405f54c4cf3a9e70b4ec298b31a', 'f4f4bb152cf54fec94eb0d2b22d25f71', '111', NULL, '2018-07-01 15:09:01', NULL);
INSERT INTO `user_project` VALUES ('bkjaqalfa231fa', '1231451941131', '项目2', '项目2的描述', '2018-06-30 10:14:16', NULL);

SET FOREIGN_KEY_CHECKS = 1;
