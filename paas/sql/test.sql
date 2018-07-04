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

 Date: 03/07/2018 14:13:20
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
  `image_id` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cmd` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_image
-- ----------------------------
INSERT INTO `sys_image` VALUES ('11', '111', '1', NULL, 2, '1', 1, '2018-06-28 16:36:53', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES ('12', '12', '2', NULL, 2, '1', 0, '2018-06-28 16:37:04', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES ('123', 'new', 'null', '1369600', 1, '123', 0, '2018-06-30 15:14:41', '2018-06-30 15:14:41', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES ('3344', 'test666:latest', '[test666:latest]', '199671138', 1, '3241513613121', 1, '1970-01-19 00:29:10', '2018-07-01 19:43:45', NULL, '{org.label-schema.schema-version== 1.0     org.label-schema.name=CentOS Base Image     org.label-schema.vendor=CentOS     org.label-schema.license=GPLv2     org.label-schema.build-date=20180531}', '', NULL, NULL);
INSERT INTO `sys_image` VALUES ('459ab1da972546249c7594e2d42f6da0', 'test222:latest', '[test222:latest]', '199671138', 2, '3241513613121', 0, '1970-01-19 00:29:10', '2018-07-01 12:46:25', '199671138', '{org.label-schema.schema-version== 1.0     org.label-schema.name=CentOS Base Image     org.label-schema.vendor=CentOS     org.label-schema.license=GPLv2     org.label-schema.build-date=20180531}', '', 'sha256:49f7960eb7e4cb46f1a02c1f8174c6fac07ebf1eb6d8deffbcb5c695f1c9edd5', NULL);
INSERT INTO `sys_image` VALUES ('473da68e6b69415bb49d1cfcc9a5fb66', 'hf123/centos:5', '[hf123/centos:5]', '284668937', 2, '3241513613121', 0, '1970-01-18 09:03:01', '2018-07-02 04:48:35', '284668937', '{build-date=2016-03-31, license=GPLv2, name=CentOS Base Image, vendor=CentOS}', '', 'sha256:1ae98b2c895d1ceeba8913ff79f422f005b7f967a311da520a88ac89180b4c39', NULL);
INSERT INTO `sys_image` VALUES ('6f8804ad9d1042849521d724914598fc', 'busybox.tar.gz90837378576536:latest', '[busybox.tar.gz90837378576536:latest]', '1363351', 2, '3241513613121', 0, '1970-01-19 01:08:15', '2018-07-02 01:42:00', '1363351', NULL, '', 'sha256:623352a0a810afbec264b81019c642772b40e08e01928673ab955b53a7d04ea6', NULL);
INSERT INTO `sys_image` VALUES ('9305f44e0dd04f5c83f6d87c330a1da5', 'busybox.tar91809800625424:latest', '[busybox.tar91809800625424:latest]', '1363351', 2, '3241513613121', 0, '1970-01-19 01:08:16', '2018-07-02 01:58:12', '1363351', NULL, '', 'sha256:bd7ff8bcc056fd7210ef3298c40d0a4d55c4ee03ee04fc2536953ca010fd7163', NULL);
INSERT INTO `sys_image` VALUES ('9edf71135f1a4de0960b895dfd7037ff', 'hf123/tomcat:7', '[hf123/tomcat:7]', '368101322', 2, '3241513613121', 0, '1970-01-19 00:45:42', '2018-07-02 04:45:11', '368101322', NULL, '', 'sha256:795e4e5bef09ae7d80cf1e706e845f7cb96fc1dfae942e6ac3fd675968d51c8f', NULL);
INSERT INTO `sys_image` VALUES ('a57eb96d00d941cc91ca989d1665d62d', 'busybox91954337741963:latest', '[busybox91954337741963:latest]', '1363351', 2, '3241513613121', 0, '1970-01-19 01:08:16', '2018-07-02 02:00:37', '1363351', NULL, '', 'sha256:f0556e29220ac752be0e1b53bc5cc460307d9860ce5eb9cf982ccc4b51777124', NULL);
INSERT INTO `sys_image` VALUES ('sha256:1ae98b2c895d1ceeba8913ff79f422f005b7f967a311da520a88ac89180b4c39', 'centos:5', '[centos:5]', '284668937', 1, '0', 1, '1970-01-18 09:03:01', '2018-07-01 12:41:34', '284668937', '{build-date=2016-03-31, license=GPLv2, name=CentOS Base Image, vendor=CentOS}', '', NULL, NULL);

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
INSERT INTO `sys_log` VALUES ('04b4633a1c524180ad2b5867451d08b9', NULL, 1, '/login', 'POST', '192.168.100.141', 'PostmanRuntime/7.1.1', 'username=sya&password=', '', '2018-07-03 08:47:44');
INSERT INTO `sys_log` VALUES ('07d89ef1935f4800ba03541aed6fc0d9', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-06-30 18:37:38');
INSERT INTO `sys_log` VALUES ('092c89fc05fe4d2ca7c3fbc7ff1b883d', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 20:33:04');
INSERT INTO `sys_log` VALUES ('0ab883daaa9041f8bafea9a667c54ab1', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-02 10:07:26');
INSERT INTO `sys_log` VALUES ('0b5fde70d4c449e09b9c935f7124be3c', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-07-01 09:40:25');
INSERT INTO `sys_log` VALUES ('15ca1188529141aba651bf11bea35335', NULL, 1, '/login', 'POST', '192.168.100.139', 'PostmanRuntime/7.1.5', 'username=sys&password=', '', '2018-07-01 11:06:52');
INSERT INTO `sys_log` VALUES ('290f5455a1ca464ca6d4ad73e7370dd5', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 16:24:49');
INSERT INTO `sys_log` VALUES ('3731692147f04350939cee96c0437a79', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-02 14:19:14');
INSERT INTO `sys_log` VALUES ('3aee32b4e9114a2fad32a3a025b53303', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 14:58:45');
INSERT INTO `sys_log` VALUES ('444cdfd8fc1e4ab1a56d03c061332a9c', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sys&password=', '', '2018-07-01 14:40:00');
INSERT INTO `sys_log` VALUES ('45d7ce5b5f314d659666d2e32e3d3798', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-02 08:39:07');
INSERT INTO `sys_log` VALUES ('4c30f65a7c8345b0bcb1043bed5484da', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-02 13:30:31');
INSERT INTO `sys_log` VALUES ('4da14685124b4f8facb1b8dcaa948b3e', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-02 10:07:23');
INSERT INTO `sys_log` VALUES ('4eb7924c14a34423bd8f48956ba933bd', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-02 15:09:12');
INSERT INTO `sys_log` VALUES ('519125575b5c432f8a57d98884387b69', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 20:33:02');
INSERT INTO `sys_log` VALUES ('5814daa9f6fa4e9785e13a318df6641e', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-06-30 21:14:09');
INSERT INTO `sys_log` VALUES ('5a459e8b380e44908bbfe851575af7ad', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sys&password=', '', '2018-06-30 17:03:26');
INSERT INTO `sys_log` VALUES ('692f90690e874bbf9ffba6774da6386b', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 19:23:24');
INSERT INTO `sys_log` VALUES ('69d4b916eb8a45099b6ebb8aca93de02', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-06-30 20:10:01');
INSERT INTO `sys_log` VALUES ('6e1d1a4630784fc597df3776c81e2e4f', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-06-30 16:35:22');
INSERT INTO `sys_log` VALUES ('70b8e13eb7094d82ae84abd40ebfd590', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-01 17:14:47');
INSERT INTO `sys_log` VALUES ('7b7316bf24274473828abde51de0282b', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-02 09:03:37');
INSERT INTO `sys_log` VALUES ('81de3e8f9cbb4a0b830a3462c41cc10e', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-03 08:50:48');
INSERT INTO `sys_log` VALUES ('844151d796b14a4aac4739d73da6b138', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-02 11:33:03');
INSERT INTO `sys_log` VALUES ('8920e1a26cff46c7b2eca56abff4106b', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 16:24:47');
INSERT INTO `sys_log` VALUES ('8d868cff1baa4000836cb36ec64ccdb8', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-03 08:47:54');
INSERT INTO `sys_log` VALUES ('93c5303e999546789a9472c7711cc63a', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-02 20:51:56');
INSERT INTO `sys_log` VALUES ('9b754e2bae094f279444ad2c7d85f725', NULL, 1, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=sys&password=', '', '2018-07-01 09:24:39');
INSERT INTO `sys_log` VALUES ('9c66e31b906046918f4c5d4321ed4bbb', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-02 11:39:59');
INSERT INTO `sys_log` VALUES ('ae6ca5359ce74855ad0f22a6c585a518', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 08:39:35');
INSERT INTO `sys_log` VALUES ('aeba625a18b34bda94a14eb167b46928', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sys&password=', '', '2018-06-30 15:53:50');
INSERT INTO `sys_log` VALUES ('af4fab37b4db46f08d90b9cb112b5aa8', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-03 09:45:30');
INSERT INTO `sys_log` VALUES ('b31f0017cd234ff3addd79ef7040d61c', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-01 15:06:21');
INSERT INTO `sys_log` VALUES ('b362cd9acb57470bb048dc67de661f67', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 14:47:15');
INSERT INTO `sys_log` VALUES ('b5befadab7fc4382b80255167ed03805', NULL, 1, '/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-02 16:41:38');
INSERT INTO `sys_log` VALUES ('b708a99fbd754b3a83d01b073d668c22', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sys&password=', '', '2018-06-30 15:08:21');
INSERT INTO `sys_log` VALUES ('b896e93769344e598420125b0d9818e7', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-02 11:33:05');
INSERT INTO `sys_log` VALUES ('c1ba60c2a48c4d168442b47fe46c051c', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-02 08:56:35');
INSERT INTO `sys_log` VALUES ('c6614f33a63245d2abb38985b6c58ca7', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-02 08:39:10');
INSERT INTO `sys_log` VALUES ('c72df75050cb4907b347406dc13fbefc', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 14:58:40');
INSERT INTO `sys_log` VALUES ('c9900eea452044b19306bf1a3108eaa9', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-03 08:47:52');
INSERT INTO `sys_log` VALUES ('d0fa0fcd81ae4227b0f3d841032b517d', '1231451941131', 3, '/admin/modifyTheUserInfo', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'username=18083764688&password=&uid=4151361367131&email=827622690@qq.com', '', '2018-06-30 16:35:51');
INSERT INTO `sys_log` VALUES ('d23f42de703c4ba9ba57ac2080b6cc06', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-02 15:09:10');
INSERT INTO `sys_log` VALUES ('d2c891b157ae43e0b23550b7c0bc5399', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 14:47:12');
INSERT INTO `sys_log` VALUES ('d42d90b6196c42029cbf7087a0162fbd', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 08:39:31');
INSERT INTO `sys_log` VALUES ('db2a1cf1ef5a4e4d9e3d0a114aff4dde', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-02 08:55:43');
INSERT INTO `sys_log` VALUES ('dcbad441a41443fca6bb6195d6a0a9e1', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-03 08:47:39');
INSERT INTO `sys_log` VALUES ('e269f5a9869f4449ad4b19c7edefb674', NULL, 1, '/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-02 16:23:53');
INSERT INTO `sys_log` VALUES ('eb1e6f4e39464052a0d462c54f5f1267', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-02 10:38:30');
INSERT INTO `sys_log` VALUES ('ed52ca77a92946bd9537aded0a029599', NULL, 1, '/login', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-02 16:40:48');
INSERT INTO `sys_log` VALUES ('f44b58cd6b084c3a9dcfae640ddaeb5f', NULL, 1, '/login', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'username=sys&password=', '', '2018-07-01 19:23:28');
INSERT INTO `sys_log` VALUES ('f4888699c32b414086eecc9df17071b6', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-02 10:16:10');
INSERT INTO `sys_log` VALUES ('fb395da858ae4c6297702502888ab40b', NULL, 1, '/login', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'username=sya&password=', '', '2018-07-03 08:55:16');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_repository
-- ----------------------------
INSERT INTO `sys_repository` VALUES (1, 1, '192.168.30.171');
INSERT INTO `sys_repository` VALUES (2, 2, '192.168.30.169');

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
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '宿主机文件夹位置',
  `destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容器内文件夹位置',
  `bindType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂载类型',
  `volumeRW` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂载是否可读写',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户容器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_container
-- ----------------------------
INSERT INTO `user_container` VALUES ('3eccb7d3111b7eebd45a2d944f3c8625026a2b84a463e66e340bc9dbdf6970d4', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'ttt', 'null', '{\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"13034\"}]}', 'nginx:latest', 0, '2018-07-02 14:26:50', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_container` VALUES ('54c4af1b16370796dc5d442beac3ea86c83a603e09acb29dfe830310faa9c6a3', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'testContainer', 'null', '{\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"13479\"}]}', 'nginx:latest', 0, '2018-07-02 11:20:34', '2018-07-02 11:33:51', NULL, NULL, NULL, NULL);
INSERT INTO `user_container` VALUES ('f0d99bf2945cf1021040a045405b61c2d6fc37e467bb56d61a29416184fedd4b', 'b2b09405f54c4cf3a9e70b4ec298b31a', '666', 'null', '{\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"61139\"}]}', 'nginx:latest', 1, '2018-07-02 11:10:49', '2018-07-02 11:16:11', NULL, NULL, NULL, NULL);

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
INSERT INTO `user_project` VALUES ('aabakfsvakiuw1213', 'f4f4bb152cf54fec94eb0d2b22d25f71', '项目1', '项目1的描述', '2018-06-30 10:14:07', NULL);
INSERT INTO `user_project` VALUES ('ablaiawru1321', '4151361367131', '测试项目1', '测试项目1的描述', '2018-06-30 10:14:43', NULL);
INSERT INTO `user_project` VALUES ('afaowrwfvxz4e1', '4151361367131', '测试项目2', '测试项目2的描述', '2018-06-30 10:14:57', NULL);
INSERT INTO `user_project` VALUES ('b2b09405f54c4cf3a9e70b4ec298b31a', 'f4f4bb152cf54fec94eb0d2b22d25f71', '111', NULL, '2018-07-01 15:09:01', NULL);
INSERT INTO `user_project` VALUES ('bkjaqalfa231fa', '1231451941131', '项目2', '项目2的描述', '2018-06-30 10:14:16', NULL);

SET FOREIGN_KEY_CHECKS = 1;
