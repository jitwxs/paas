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

 Date: 07/07/2018 16:13:50
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
INSERT INTO `project_log` VALUES ('1c2b4481b8064e2091d7427ee5725820', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'f26f616db52531bd442661bdfa799eea60f925ecfa80726c591bec0d8a7e224d', 20, '创建容器', '2018-07-07 15:46:16');
INSERT INTO `project_log` VALUES ('1e30ef54a11e44a7b96fbb46e3450f0b', 'b2b09405f54c4cf3a9e70b4ec298b31a', '129663e302ed2c8cf8dd1ce123061213ac789553f3d5d0ef4a79524b495a51c2', 23, '开启容器失败，原因：Docker异常', '2018-07-07 11:11:33');
INSERT INTO `project_log` VALUES ('2ae0140e4ae44d7b9627ef13cf6eb922', '6860df07dd1445228ff21d53eb18be65', '0970203f46cebe7fe7a13dc1a81529a1233db0b8700bed4b69dcf55c7cf8c9c1', 20, '创建容器', '2018-07-07 14:12:28');
INSERT INTO `project_log` VALUES ('3865b6359ee8436e9fc9e3e33bdfb457', '6860df07dd1445228ff21d53eb18be65', '7e1be36e17f079dedcfe60b7bdcffb63bb77ef8ec3ce160950e0c606b49fe1e5', 22, '开启容器', '2018-07-07 11:21:44');
INSERT INTO `project_log` VALUES ('557d018172f842029259fde5c1887de0', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 25, '暂停容器失败，原因：Docker异常', '2018-07-07 11:14:21');
INSERT INTO `project_log` VALUES ('56273ada10e84bbc8ab3cd8a8348e188', '6860df07dd1445228ff21d53eb18be65', '77f54bf6efa20d68dcdf015cce513b55feacabf72960de46abc09f0ea919074b', 20, '创建容器', '2018-07-07 14:10:05');
INSERT INTO `project_log` VALUES ('59e295eb5f8149aaad8506367e6caa2b', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'f26f616db52531bd442661bdfa799eea60f925ecfa80726c591bec0d8a7e224d', 22, '开启容器', '2018-07-07 15:46:38');
INSERT INTO `project_log` VALUES ('651a56d10cb042088d669ba143cfdd18', '6860df07dd1445228ff21d53eb18be65', '5c1fdaab992dd05ea77c642f53c50d57a7006abeb58d63d3c469fd3f069e2d67', 20, '创建容器', '2018-07-07 11:35:26');
INSERT INTO `project_log` VALUES ('68c3ba1f32984c289b2b37094cdf6f69', '6860df07dd1445228ff21d53eb18be65', 'e03ef580deece022e5332f03d9ccb09ca0b51bf7c145cf65cd52dea42d34f490', 20, '创建容器', '2018-07-07 14:10:19');
INSERT INTO `project_log` VALUES ('77b94401af264a68b73fe5bbe1dfd43d', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 22, '开启容器', '2018-07-07 11:14:27');
INSERT INTO `project_log` VALUES ('7c2c0f04b9844b15bc2c7a5b0445ae20', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'f26f616db52531bd442661bdfa799eea60f925ecfa80726c591bec0d8a7e224d', 23, '开启容器失败，原因：Docker异常', '2018-07-07 15:50:26');
INSERT INTO `project_log` VALUES ('7ec5a521de134cb491db138752c0a732', 'b2b09405f54c4cf3a9e70b4ec298b31a', '8b6102bc2a5608d33037ee1474bddfce431ca0594eef2f01f059baa5ff3a3f82', 20, '创建容器', '2018-07-07 15:48:32');
INSERT INTO `project_log` VALUES ('9a3d201132d54334b326829a3044e4b3', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'eb706c93cff1cec7af9f8f0f9abbb27626e68ef7f8f42d699b3572da8e0b470c', 20, '创建容器', '2018-07-07 15:40:58');
INSERT INTO `project_log` VALUES ('a6335e43d29144349d06e1500e890507', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 22, '开启容器', '2018-07-07 11:12:32');
INSERT INTO `project_log` VALUES ('a86732e20ae34545a8c3348cd96e6d97', '6860df07dd1445228ff21d53eb18be65', 'afac8481584e19ec8bbdc430ba650198e8cbe7404062c09daa50d4d7950644fd', 20, '创建容器', '2018-07-07 14:09:27');
INSERT INTO `project_log` VALUES ('ae969f4a9c2e41a1a7fa2918472f057d', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 20, '创建容器', '2018-07-07 11:09:07');
INSERT INTO `project_log` VALUES ('b3865ce97f394f94b9ec88519d51f11a', 'b2b09405f54c4cf3a9e70b4ec298b31a', '5b226ca5d718ae3f32bf3942c85b390b88e14e7d4e8271f72ffb92ffbccec8f9', 20, '创建容器', '2018-07-07 16:10:44');
INSERT INTO `project_log` VALUES ('c01a92735b214bc38879d2fd12958909', '6860df07dd1445228ff21d53eb18be65', '7e1be36e17f079dedcfe60b7bdcffb63bb77ef8ec3ce160950e0c606b49fe1e5', 20, '创建容器', '2018-07-07 11:20:58');
INSERT INTO `project_log` VALUES ('c4e566f69fd04e23a316325de0d05a53', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'eb706c93cff1cec7af9f8f0f9abbb27626e68ef7f8f42d699b3572da8e0b470c', 22, '开启容器', '2018-07-07 15:43:32');
INSERT INTO `project_log` VALUES ('c84c3a2dae1f4ce4a70d8902da1752ca', '6860df07dd1445228ff21d53eb18be65', '47de2b147bb861a8f9bf564992f694b93ff4da82abb5dd5017b7429d8faaf73f', 20, '创建容器', '2018-07-07 11:34:29');
INSERT INTO `project_log` VALUES ('e5d15bb628774cd5972bcf6041991881', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 22, '开启容器', '2018-07-07 11:16:25');
INSERT INTO `project_log` VALUES ('e9af1a0c83bc443c85628cf47f9fdecc', '6860df07dd1445228ff21d53eb18be65', '502090d4bd983c5c8a17c2112574217ac09d38dee6d7b50755fc2b180f199748', 20, '创建容器', '2018-07-07 11:25:16');
INSERT INTO `project_log` VALUES ('eacc6ad05c7d43c28ea01c8ac5848fe8', '6860df07dd1445228ff21d53eb18be65', '1cecf69adad9b8300435883f6bc99e9ac3f637cb4095c63da5d7b0eddf03031d', 20, '创建容器', '2018-07-07 11:27:16');
INSERT INTO `project_log` VALUES ('f31e90bd07484c1fb78d08cbfcfe5b6d', '6860df07dd1445228ff21d53eb18be65', '31a0516ca7e720ee6861e755861377b7b47114ad2e6ea0e63df232353b0d64c2', 22, '开启容器', '2018-07-07 15:06:22');
INSERT INTO `project_log` VALUES ('f7d944c911f74d8aa3a98353c9086cb7', '6860df07dd1445228ff21d53eb18be65', '31a0516ca7e720ee6861e755861377b7b47114ad2e6ea0e63df232353b0d64c2', 20, '创建容器', '2018-07-07 15:05:59');
INSERT INTO `project_log` VALUES ('fbafa3af102b49e193c0ab311407498f', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 22, '开启容器', '2018-07-07 11:15:09');

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
-- Records of repository_image
-- ----------------------------
INSERT INTO `repository_image` VALUES ('bcd1b03b8bb04b889a119249bb76043b', '192.168.100.183:5000/f4f4bb152cf54fec94eb0d2b22d25f71/hello-world:latest', 'f4f4bb152cf54fec94eb0d2b22d25f71/hello-world', 'latest', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'sha256:d5c74e6f8efc7bdf42a5e22bd764400692cf82360d86b8c587a7584b03f51520', '192.168.100.183:5000', '2018-07-06 15:38:41', NULL);

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
INSERT INTO `sys_image` VALUES ('11aa8e60c5a8475fb44a332e60ff95fa', '0346349a1a640da9535acfc0f68be9d9b81e85957725ecb76f3b522f4e2f0455', 'nginx:1.10', 'nginx', '1.10', '181547062', 1, NULL, NULL, '181547062', '{}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"nginx\\\" \\\"-g\\\" \\\"daemon off;\\\"]\"]', 'library', '', '2018-07-07 15:31:52', NULL);
INSERT INTO `sys_image` VALUES ('431a73aaef4c4ed389a5d9b6523dde2e', '49f7960eb7e4cb46f1a02c1f8174c6fac07ebf1eb6d8deffbcb5c695f1c9edd5', 'centos:7', 'centos', '7', '199671138', 1, NULL, NULL, '199671138', '{\"org.label-schema.schema-version\":\"= 1.0     org.label-schema.name=CentOS Base Image     org.label-schema.vendor=CentOS     org.label-schema.license=GPLv2     org.label-schema.build-date=20180531\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/bin/bash\\\"]\"]', 'library', '', '2018-07-07 15:31:52', NULL);
INSERT INTO `sys_image` VALUES ('444b2ef8995f42ee9faa87fa5da64a11', '5195076672a7e30525705a18f7d352c920bbd07a5ae72b30e374081fe660a011', 'mysql:5.7.21', 'mysql', '5.7.21', '371405265', 1, NULL, NULL, '371405265', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"mysqld\\\"]\"]', 'library', '', '2018-07-07 15:31:52', NULL);
INSERT INTO `sys_image` VALUES ('5c0c8beaa2fb4d42bcf438ee252ead06', '8d99edb9fd40491fd5ff43c778f223d31b5604d548eb92912017ab48ac156832', 'mysql:latest', 'mysql', 'latest', '444748044', 1, NULL, NULL, '444748044', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"mysqld\\\"]\"]', 'library', '', '2018-07-07 15:31:52', NULL);
INSERT INTO `sys_image` VALUES ('77359933164a459a89485d9e32c2ac40', 'd23bdf5b1b1b1afce5f1d0fd33e7ed8afbc084b594b9ccf742a5b27080d8a4a8', 'java:8', 'java', '8', '643119603', 1, NULL, NULL, '643119603', '{}', '[\"/bin/sh\",\"-c\",\"/var/lib/dpkg/info/ca-certificates-java.postinst configure\"]', 'library', '', '2018-07-07 15:31:52', NULL);
INSERT INTO `sys_image` VALUES ('8758290ce6e34aed9f5735c0c453fc32', '5699ececb21caf07b92cbda9daa1e965407e3793a72000ecbf6b8e8595a0824a', 'nginx:latest', 'nginx', 'latest', '108951970', 1, NULL, NULL, '108951970', '{\"maintainer\":\"NGINX Docker Maintainers <docker-maint@nginx.com>\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"nginx\\\" \\\"-g\\\" \\\"daemon off;\\\"]\"]', 'library', '', '2018-07-06 10:17:13', NULL);
INSERT INTO `sys_image` VALUES ('998ceb44c9834b24912b510ed0c9565b', '795e4e5bef09ae7d80cf1e706e845f7cb96fc1dfae942e6ac3fd675968d51c8f', 'tomcat:7', 'tomcat', '7', '368101322', 1, NULL, NULL, '368101322', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"catalina.sh\\\" \\\"run\\\"]\"]', 'library', '', '2018-07-07 15:31:52', NULL);

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
INSERT INTO `sys_log` VALUES ('06d0abf121654796a51ffe6286eabfa0', NULL, 1, NULL, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-07-07 14:15:48');
INSERT INTO `sys_log` VALUES ('1161cf8756f14c879e2e5c47379f5cbf', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=11aa8e60c5a8475fb44a332e60ff95fa&containerName=aaa&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', '', '2018-07-07 15:48:32');
INSERT INTO `sys_log` VALUES ('31d3eff2b59e48d3a6997c325976c19a', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=babababba&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', '', '2018-07-07 15:46:16');
INSERT INTO `sys_log` VALUES ('3c868bba55eb498590e3c154490de816', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=qqqqqq&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 11:34:29');
INSERT INTO `sys_log` VALUES ('489fd7cda8ca4fec8d1c5aec9b498d4f', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=77359933164a459a89485d9e32c2ac40&containerName=biubiubiu&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', '', '2018-07-07 15:40:58');
INSERT INTO `sys_log` VALUES ('58657a1a715f41b7a33c0a09b1aff730', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=11aa8e60c5a8475fb44a332e60ff95fa&containerName=bbb&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', '', '2018-07-07 16:10:44');
INSERT INTO `sys_log` VALUES ('5903638c28074cc5be7ffe2929ebca01', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=3ece2db9a8cf4917a856b8161c8f9a7f&containerName=哇咔咔的容器&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 11:05:24');
INSERT INTO `sys_log` VALUES ('688b7cf9343840549e873565391bba75', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=哈哈哈gege&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 11:27:16');
INSERT INTO `sys_log` VALUES ('6ca5bf6bc0ef453283235498a771c051', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=我是哈哈哈&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 11:25:16');
INSERT INTO `sys_log` VALUES ('717f268042e64843a9ce9f4bd9ec272e', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=ppppp&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 14:12:28');
INSERT INTO `sys_log` VALUES ('7c1a908313eb461c857625dac695dff0', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', '', '2018-07-07 14:55:48');
INSERT INTO `sys_log` VALUES ('8173f98473a34c3797a3645aee42e8a8', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 14:10:05');
INSERT INTO `sys_log` VALUES ('85b83c407069406f98af85b23175d86c', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=ooooooooooooooooo&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 14:10:19');
INSERT INTO `sys_log` VALUES ('8c8b3a376566483bae405863565003b8', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=测试nginx容器&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 11:20:58');
INSERT INTO `sys_log` VALUES ('8efc3156c26548098a0d9dd3d72b5ee1', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '127.0.0.1', 'PostmanRuntime/7.1.1', '', '', '2018-07-07 15:31:51');
INSERT INTO `sys_log` VALUES ('a63606be4f3b4fd29ea0d98a40ed89ae', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', '', '2018-07-07 14:04:11');
INSERT INTO `sys_log` VALUES ('a6ffa1953b734cf5bec493acb9fd4186', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=哇咔咔的2号容器&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 11:09:07');
INSERT INTO `sys_log` VALUES ('ae63d7fe78ac48e88590924dbe03e7b0', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 14:09:27');
INSERT INTO `sys_log` VALUES ('dc990a7e70eb4b93a659b52413dc68ab', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 15:05:59');
INSERT INTO `sys_log` VALUES ('fabefd3f1c5a47d5a89c1585d05b0fb2', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=bbbbb&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 11:35:26');

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
INSERT INTO `sys_login` VALUES ('1231451941131', 'sys', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', NULL, 0, 2, '2018-06-27 16:29:56', '2018-07-07 09:06:39');
INSERT INTO `sys_login` VALUES ('1249181023313', 'user', '$2a$10$tj2Ehs75tdIil2SHoaBb6u54wKUgQwjenO3RuaWXBEOsQZ8bupe3q', 'jitwxs@foxmail.com', 0, 1, '2018-06-29 17:01:43', '2018-07-07 09:06:39');
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
INSERT INTO `user_container` VALUES ('31a0516ca7e720ee6861e755861377b7b47114ad2e6ea0e63df232353b0d64c2', '6860df07dd1445228ff21d53eb18be65', 'wwwwwwwww', NULL, '{\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"28189\"}]}', 'nginx:latest', 1, '2018-07-07 15:06:01', '2018-07-07 15:06:22', NULL);
INSERT INTO `user_container` VALUES ('5b226ca5d718ae3f32bf3942c85b390b88e14e7d4e8271f72ffb92ffbccec8f9', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'bbb', NULL, '{\"443/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"31245\"}],\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"20073\"}]}', 'nginx:1.10', 1, '2018-07-07 16:10:45', NULL, NULL);
INSERT INTO `user_container` VALUES ('8b6102bc2a5608d33037ee1474bddfce431ca0594eef2f01f059baa5ff3a3f82', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'aaa', NULL, '{\"443/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"31283\"}],\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"16409\"}]}', 'nginx:1.10', 0, '2018-07-07 15:48:33', NULL, NULL);
INSERT INTO `user_container` VALUES ('eb706c93cff1cec7af9f8f0f9abbb27626e68ef7f8f42d699b3572da8e0b470c', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'biubiubiu', NULL, NULL, 'java:8', 1, '2018-07-07 15:40:59', '2018-07-07 15:43:32', NULL);
INSERT INTO `user_container` VALUES ('f26f616db52531bd442661bdfa799eea60f925ecfa80726c591bec0d8a7e224d', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'babababba', NULL, '{\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"35076\"}]}', 'nginx:latest', 1, '2018-07-07 15:46:16', '2018-07-07 15:46:38', NULL);

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
INSERT INTO `user_project` VALUES ('6860df07dd1445228ff21d53eb18be65', 'f4f4bb152cf54fec94eb0d2b22d25f71', '哇咔咔', '哇咔咔哇咔咔', '2018-07-01 15:08:47', '2018-07-07 10:55:19');
INSERT INTO `user_project` VALUES ('6afcadce648848e49bd976301881e7c5', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'JavaWeb01', '第一个JavaWeb环境', '2018-07-05 11:02:24', NULL);
INSERT INTO `user_project` VALUES ('aabakfsvakiuw1213', 'f4f4bb152cf54fec94eb0d2b22d25f71', '项目1', '项目1的描述', '2018-06-30 10:14:07', NULL);
INSERT INTO `user_project` VALUES ('aacfe7c904214258b2f5e1fa1de00890', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'dddd', NULL, '2018-07-06 21:03:43', NULL);
INSERT INTO `user_project` VALUES ('ablaiawru1321', '4151361367131', '测试项目1', '测试项目1的描述', '2018-06-30 10:14:43', NULL);
INSERT INTO `user_project` VALUES ('afaowrwfvxz4e1', '4151361367131', '测试项目2', '测试项目2的描述', '2018-06-30 10:14:57', NULL);
INSERT INTO `user_project` VALUES ('b2b09405f54c4cf3a9e70b4ec298b31a', 'f4f4bb152cf54fec94eb0d2b22d25f71', '111', NULL, '2018-07-01 15:09:01', NULL);
INSERT INTO `user_project` VALUES ('bkjaqalfa231fa', '1231451941131', '项目2', '项目2的描述', '2018-06-30 10:14:16', NULL);

SET FOREIGN_KEY_CHECKS = 1;
