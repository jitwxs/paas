/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 12/07/2018 16:54:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for project_log
-- ----------------------------
DROP TABLE IF EXISTS `project_log`;
CREATE TABLE `project_log`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `container_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int(10) NULL DEFAULT NULL COMMENT '日志类型',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_log
-- ----------------------------
INSERT INTO `project_log` VALUES ('1d92b018acde47558153be78fc559b52', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 16:13:55');
INSERT INTO `project_log` VALUES ('2192eca4d1d44acebe3574b568fae77e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 16:14:06');
INSERT INTO `project_log` VALUES ('23caad859e9b4d8e9c565a197ec7fca9', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 14:19:53');
INSERT INTO `project_log` VALUES ('368c342ab8924627b32ed60553ce7ae7', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 16:39:44');
INSERT INTO `project_log` VALUES ('7a52a362c9104dca897c58ffab5395db', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 15:56:53');
INSERT INTO `project_log` VALUES ('7ab039958a284827a670a9853219f09d', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 16:14:12');
INSERT INTO `project_log` VALUES ('8b477239f3004e7ca84cb85d57a686b9', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 14:14:39');
INSERT INTO `project_log` VALUES ('8caa8776ae4f4488abdbb2fe3f5f8d0d', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 14:20:06');
INSERT INTO `project_log` VALUES ('cbfe3a3164664f8fb5fa05b28b7a64cf', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 15:16:35');
INSERT INTO `project_log` VALUES ('d7dfaeb75e2f40009c0a78c62910cfcf', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 14:14:30');
INSERT INTO `project_log` VALUES ('ea252286931d49d6a32be86551bab45c', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 20, '创建容器', '2018-07-12 14:12:52');

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
INSERT INTO `sys_image` VALUES ('29952c38f59d44419f9d2cdaa8213b9f', '3c5a051232223f9ccf4a604d611696e98392648c9e567d3ecd2af881c9f93101', 'nginx:latest', 'nginx', 'latest', '108974617', 1, NULL, NULL, '108974617', '{\"maintainer\":\"NGINX Docker Maintainers <docker-maint@nginx.com>\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"nginx\\\" \\\"-g\\\" \\\"daemon off;\\\"]\"]', 'library', '', '2018-07-12 14:10:08', NULL);
INSERT INTO `sys_image` VALUES ('592838bf086d4f6cb6f412e0f859f337', '3065a4fb90cdd94f30ff575df3cd1f4d6f47261dd06128a5b6d6699d7fc1322d', 'local/f4f4bb152cf54fec94eb0d2b22d25f71/my-busybox:latest', 'my-busybox', 'latest', '1363351', 2, 'f4f4bb152cf54fec94eb0d2b22d25f71', 0, '1363351', 'null', 'null', 'local', '', '2018-07-12 14:21:50', NULL);
INSERT INTO `sys_image` VALUES ('fe597270fe0b4ab581427edef523fe24', '2cb0d9787c4dd17ef9eb03e512923bc4db10add190d3f84af63b744e353a9b34', 'hello-world:latest', 'hello-world', 'latest', '1848', 1, NULL, NULL, '1848', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/hello\\\"]\"]', 'library', '', '2018-07-12 14:04:35', NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户ID',
  `type` int(11) NULL DEFAULT NULL COMMENT '日志类型',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志描述',
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
INSERT INTO `sys_log` VALUES ('09f0eb75dd6a4650a191e4f239b7b931', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131', NULL, '2018-07-11 15:42:20');
INSERT INTO `sys_log` VALUES ('0a09c546c5e34305a0611d7b8e273021', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', 'ids=4151361367131', NULL, '2018-07-09 15:58:37');
INSERT INTO `sys_log` VALUES ('0b1401fa60e6495ea0ad3236e594fb58', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131', NULL, '2018-07-11 15:41:54');
INSERT INTO `sys_log` VALUES ('10766e241d7c4eaba9ce3e18a27301c2', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131', NULL, '2018-07-11 15:29:55');
INSERT INTO `sys_log` VALUES ('1161cf8756f14c879e2e5c47379f5cbf', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=11aa8e60c5a8475fb44a332e60ff95fa&containerName=aaa&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', NULL, '2018-07-07 15:48:32');
INSERT INTO `sys_log` VALUES ('1e0cbf709a54405084fb11a09ce143d6', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:09:01');
INSERT INTO `sys_log` VALUES ('24de149e90754f60816463668b4488f0', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:00:48');
INSERT INTO `sys_log` VALUES ('2acb5642b5ab48ec80c920e1fbb7dc11', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313', NULL, '2018-07-10 17:02:50');
INSERT INTO `sys_log` VALUES ('2af6929e67fb48e289cc4f6dc02dbde8', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-07 16:16:40');
INSERT INTO `sys_log` VALUES ('2dfe8c522c6c48d8bf184da6810e1a3b', 'f4f4bb152cf54fec94eb0d2b22d25f71', 21, '删除容器', '/container/delete/168b7deb35332e3659fa61e4b9a9d7ea229a8641b44ab88263595562887382d9', 'DELETE', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-10 20:25:24');
INSERT INTO `sys_log` VALUES ('3031375853f64afebcf612632d48fa48', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313', NULL, '2018-07-11 15:41:59');
INSERT INTO `sys_log` VALUES ('31d3eff2b59e48d3a6997c325976c19a', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=babababba&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', NULL, '2018-07-07 15:46:16');
INSERT INTO `sys_log` VALUES ('32eb03ff96a340e7b68b87206b98ad66', 'f4f4bb152cf54fec94eb0d2b22d25f71', 24, '从DockerHub拉取镜像', '/image/pull/hub', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageName=nginx', NULL, '2018-07-12 14:10:08');
INSERT INTO `sys_log` VALUES ('34e12f4db4234ed483a1177136f88f77', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', NULL, '2018-07-11 16:18:17');
INSERT INTO `sys_log` VALUES ('3c868bba55eb498590e3c154490de816', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=qqqqqq&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:34:29');
INSERT INTO `sys_log` VALUES ('3d635ad7f2eb43448de240b389d3019c', '1231451941131', 23, '删除镜像', '/image/delete/55122bf050904da79f143193cb20647b', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', NULL, '2018-07-12 14:04:56');
INSERT INTO `sys_log` VALUES ('40be9034d91f4335947982d60ef46fc9', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', NULL, '2018-07-10 17:02:58');
INSERT INTO `sys_log` VALUES ('4767c664cb7c477bb472a1b3bd29ca2e', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131,4151361367131', NULL, '2018-07-10 17:01:31');
INSERT INTO `sys_log` VALUES ('489fd7cda8ca4fec8d1c5aec9b498d4f', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=77359933164a459a89485d9e32c2ac40&containerName=biubiubiu&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', NULL, '2018-07-07 15:40:58');
INSERT INTO `sys_log` VALUES ('4aeaa3e317124fa1bb7804780d5030d4', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', NULL, '2018-07-10 17:03:32');
INSERT INTO `sys_log` VALUES ('4dcf43f479bb4610be4e7e2bf9558ee9', 'f4f4bb152cf54fec94eb0d2b22d25f71', 24, '从DockerHub拉取镜像', '/image/pull/hub', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageName=nginx', NULL, '2018-07-12 14:04:22');
INSERT INTO `sys_log` VALUES ('548ab9afa8694883ba37abca81406097', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', NULL, '2018-07-11 16:18:24');
INSERT INTO `sys_log` VALUES ('54bf27c3f4934bbf966609a85ae91477', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,4151361367131', NULL, '2018-07-11 12:30:56');
INSERT INTO `sys_log` VALUES ('58657a1a715f41b7a33c0a09b1aff730', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=11aa8e60c5a8475fb44a332e60ff95fa&containerName=bbb&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', NULL, '2018-07-07 16:10:44');
INSERT INTO `sys_log` VALUES ('5903638c28074cc5be7ffe2929ebca01', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=3ece2db9a8cf4917a856b8161c8f9a7f&containerName=哇咔咔的容器&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:05:24');
INSERT INTO `sys_log` VALUES ('688b7cf9343840549e873565391bba75', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=哈哈哈gege&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:27:16');
INSERT INTO `sys_log` VALUES ('6ca5bf6bc0ef453283235498a771c051', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=我是哈哈哈&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:25:16');
INSERT INTO `sys_log` VALUES ('717f268042e64843a9ce9f4bd9ec272e', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=ppppp&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 14:12:28');
INSERT INTO `sys_log` VALUES ('7630a780e471450a9d61f07cab23ddd7', 'f4f4bb152cf54fec94eb0d2b22d25f71', 24, '从DockerHub拉取镜像', '/image/pull/hub', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageName=hello-world', NULL, '2018-07-12 14:04:35');
INSERT INTO `sys_log` VALUES ('767ff062d73348058c326af78674b327', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', NULL, '2018-07-11 16:17:26');
INSERT INTO `sys_log` VALUES ('7c1a908313eb461c857625dac695dff0', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-07 14:55:48');
INSERT INTO `sys_log` VALUES ('80aefe50607c4b28a31c1b90e30b2bbf', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&projectId=6860df07dd1445228ff21d53eb18be65&containerName=测试专用', NULL, '2018-07-10 08:44:59');
INSERT INTO `sys_log` VALUES ('8173f98473a34c3797a3645aee42e8a8', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 14:10:05');
INSERT INTO `sys_log` VALUES ('8384e9890f3f4973ace61e454b5d039d', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', NULL, '2018-07-11 16:19:04');
INSERT INTO `sys_log` VALUES ('83eda9b8ea894ef58be9b9b72b012242', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', NULL, '2018-07-10 17:02:30');
INSERT INTO `sys_log` VALUES ('85b83c407069406f98af85b23175d86c', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=ooooooooooooooooo&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 14:10:19');
INSERT INTO `sys_log` VALUES ('8a6a85f6463b47319e6ff1b4e90c9162', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,4151361367131', NULL, '2018-07-11 12:31:06');
INSERT INTO `sys_log` VALUES ('8bcd4ba3eac9438392d7aa940b4090eb', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:17:15');
INSERT INTO `sys_log` VALUES ('8c571507383345f0ae594aea944d0573', 'f4f4bb152cf54fec94eb0d2b22d25f71', 26, '导入镜像', '/image/import', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36', 'name=my-busybox', NULL, '2018-07-12 14:21:50');
INSERT INTO `sys_log` VALUES ('8c8b3a376566483bae405863565003b8', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=测试nginx容器&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:20:58');
INSERT INTO `sys_log` VALUES ('8efc3156c26548098a0d9dd3d72b5ee1', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '127.0.0.1', 'PostmanRuntime/7.1.1', '', NULL, '2018-07-07 15:31:51');
INSERT INTO `sys_log` VALUES ('8f6bd888374b4bb19ba0fe48276d1473', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'Apache-HttpClient/4.5.2 (Java/1.8.0_152-release)', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=xxxx&projectId=6860df07dd1445228ff21d53eb18be65&portMap={\"80\":61120,\"654\":41565}', NULL, '2018-07-07 17:40:14');
INSERT INTO `sys_log` VALUES ('9e03c22ace1049909dcfa4177133b74f', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313', NULL, '2018-07-11 16:16:51');
INSERT INTO `sys_log` VALUES ('9e41a17dadb646f1bd53ce0386b751b2', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:06:39');
INSERT INTO `sys_log` VALUES ('a22fdf37fe7e48d5bfb13c31081ed991', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:21:30');
INSERT INTO `sys_log` VALUES ('a63606be4f3b4fd29ea0d98a40ed89ae', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-07 14:04:11');
INSERT INTO `sys_log` VALUES ('a6ffa1953b734cf5bec493acb9fd4186', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=哇咔咔的2号容器&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:09:07');
INSERT INTO `sys_log` VALUES ('ae63d7fe78ac48e88590924dbe03e7b0', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 14:09:27');
INSERT INTO `sys_log` VALUES ('b135a72bc33642f193fe7a04288161ad', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 16:28:59');
INSERT INTO `sys_log` VALUES ('b197ca4031c645b38fac177cbef83ac6', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313', NULL, '2018-07-10 17:01:48');
INSERT INTO `sys_log` VALUES ('bccd4d50b8ce4cba90b1ec0f6c7400a0', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&projectId=6860df07dd1445228ff21d53eb18be65&containerName=阿发发发', NULL, '2018-07-10 08:42:07');
INSERT INTO `sys_log` VALUES ('c73443b43dbc418fa4bf854c6540d876', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,4151361367131,4151361367131,f4f4bb152cf54fec94eb0d2b22d25f71,f4f...', NULL, '2018-07-11 16:21:38');
INSERT INTO `sys_log` VALUES ('caacda0c1c20449db692bffd8c3f3a9a', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:01:54');
INSERT INTO `sys_log` VALUES ('cb79a6b8df1e4a898019e540f6c1491f', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f7...', NULL, '2018-07-11 15:58:54');
INSERT INTO `sys_log` VALUES ('ccd44e4ec4564c07b5167cada9037e85', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313', NULL, '2018-07-11 16:17:03');
INSERT INTO `sys_log` VALUES ('d4252a83ae8d414992130b48edf95597', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131', NULL, '2018-07-11 16:16:32');
INSERT INTO `sys_log` VALUES ('d9973e186c5e463096d28a1a542ed2c1', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:00:48');
INSERT INTO `sys_log` VALUES ('dc990a7e70eb4b93a659b52413dc68ab', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 15:05:59');
INSERT INTO `sys_log` VALUES ('eafd1798c95a43f59fc1691e690941d9', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:17:18');
INSERT INTO `sys_log` VALUES ('ecae57a3732e4287bc17b2300b9bd9c8', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', NULL, '2018-07-10 17:04:02');
INSERT INTO `sys_log` VALUES ('ef421918d17e45babab7cc0a8e2a8750', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=fe597270fe0b4ab581427edef523fe24&containerName=my-HelloWorld&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-12 14:12:52');
INSERT INTO `sys_log` VALUES ('fab35c0bbf724489a41a1db5462012e4', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:07:06');
INSERT INTO `sys_log` VALUES ('fabefd3f1c5a47d5a89c1585d05b0fb2', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=bbbbb&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:35:26');

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
INSERT INTO `sys_login` VALUES ('1231451941131', 'sys', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', NULL, 0, 2, '2018-06-27 16:29:56', '2018-07-11 15:29:55');
INSERT INTO `sys_login` VALUES ('1241414124156', 'term', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', NULL, 0, 2, '2018-07-11 15:39:25', NULL);
INSERT INTO `sys_login` VALUES ('1249181023313', 'user', '$2a$10$tj2Ehs75tdIil2SHoaBb6u54wKUgQwjenO3RuaWXBEOsQZ8bupe3q', 'jitwxs@foxmail.com', 0, 1, '2018-06-29 17:01:43', '2018-07-11 16:19:04');
INSERT INTO `sys_login` VALUES ('4151361367131', '18083764688', '123456', '827622690@qq.com', 0, 1, '2018-06-30 09:43:29', '2018-07-11 16:19:04');
INSERT INTO `sys_login` VALUES ('f4f4bb152cf54fec94eb0d2b22d25f71', 'sya', '$2a$10$3zdHQxZ3WkN8efEwdFZyNuVKpu14SQ3077Y2rD7HyAJpelObSpNum', '973383318@qq.com', 0, 1, '2018-06-30 11:09:18', '2018-07-11 16:21:38');

-- ----------------------------
-- Table structure for sys_program
-- ----------------------------
DROP TABLE IF EXISTS `sys_program`;
CREATE TABLE `sys_program`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `port` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口号',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统服务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_program
-- ----------------------------
INSERT INTO `sys_program` VALUES (1, '后端项目', 'PaaS系统后台服务', '192.168.100.142', '9999', '2018-07-12 16:02:25', NULL);
INSERT INTO `sys_program` VALUES (2, 'Nginx服务', NULL, '192.168.100.142', '8888', '2018-07-12 16:02:55', NULL);
INSERT INTO `sys_program` VALUES (3, 'MySQL', '数据库服务', '192.168.100.142', '3306', '2018-07-12 16:03:16', NULL);
INSERT INTO `sys_program` VALUES (4, 'Docker Container', '容器服务', '192.168.100.30', '2375', '2018-07-12 16:23:37', '2018-07-12 16:45:13');
INSERT INTO `sys_program` VALUES (5, 'ActiveMQ', '消息队列服务', '192.168.100.94', '61616', '2018-07-12 16:47:29', NULL);
INSERT INTO `sys_program` VALUES (6, 'Docker Registry', 'Docker本地Hub服务', '192.168.100.94', '5000', '2018-07-12 16:48:43', NULL);
INSERT INTO `sys_program` VALUES (7, 'Docker Manager', 'Docker Swarm Manager', '192.168.100.42', '2375', '2018-07-12 16:49:14', NULL);
INSERT INTO `sys_program` VALUES (8, 'Docker Worker', 'Docker Swarm Worker1', '192.168.100.104', '2375', '2018-07-12 16:49:21', NULL);
INSERT INTO `sys_program` VALUES (9, 'Docker Worker', 'Docker Swarm Worker2', '192.168.100.238', '2375', '2018-07-12 16:49:41', NULL);
INSERT INTO `sys_program` VALUES (10, 'Redis', 'Redis服务', '192.168.100.30', '6379', '2018-07-12 16:49:59', NULL);

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
INSERT INTO `user_container` VALUES ('5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '6860df07dd1445228ff21d53eb18be65', 'my-HelloWorld', NULL, '{}', 'hello-world:latest', 0, '2018-07-12 14:12:51', '2018-07-12 16:39:44', NULL);

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
INSERT INTO `user_project` VALUES ('6860df07dd1445228ff21d53eb18be65', 'f4f4bb152cf54fec94eb0d2b22d25f71', '哇咔咔', '哇咔咔哇咔咔', '2018-07-01 15:08:47', '2018-07-07 10:55:19');
INSERT INTO `user_project` VALUES ('aabakfsvakiuw1213', 'f4f4bb152cf54fec94eb0d2b22d25f71', '项目1', '项目1的描述', '2018-06-30 10:14:07', NULL);
INSERT INTO `user_project` VALUES ('ablaiawru1321', '4151361367131', '测试项目1', '测试项目1的描述', '2018-06-30 10:14:43', NULL);
INSERT INTO `user_project` VALUES ('afaowrwfvxz4e1', '4151361367131', '测试项目2', '测试项目2的描述', '2018-06-30 10:14:57', NULL);
INSERT INTO `user_project` VALUES ('bkjaqalfa231fa', '1231451941131', '项目2', '项目2dddd', '2018-06-30 10:14:16', '2018-07-12 15:43:01');

-- ----------------------------
-- Table structure for user_service
-- ----------------------------
DROP TABLE IF EXISTS `user_service`;
CREATE TABLE `user_service`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务名',
  `replicas` int(10) NULL DEFAULT NULL COMMENT '横向扩展数量',
  `command` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行命令',
  `port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '端口',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用镜像',
  `status` int(10) NULL DEFAULT NULL COMMENT '服务状态',
  `env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环境变量',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户服务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_service
-- ----------------------------
INSERT INTO `user_service` VALUES ('qjm4luj57mnto57rmm9hkpu2e', '1', 'my-nginx', 3, NULL, '8080', 'nginx', 1, NULL, '2018-07-07 15:06:01', '2018-07-07 15:06:01');

SET FOREIGN_KEY_CHECKS = 1;
