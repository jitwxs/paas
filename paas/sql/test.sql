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

 Date: 16/07/2018 15:29:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for container_network
-- ----------------------------
DROP TABLE IF EXISTS `container_network`;
CREATE TABLE `container_network`  (
  `container_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `project_log` VALUES ('048257537039478185e6c0914effe8f5', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:47:37');
INSERT INTO `project_log` VALUES ('049200e33a114b639000166f7cdf03c2', '642332c7c45f48e38626f8360df410ee', NULL, 10, '创建项目', '2018-07-15 14:27:42');
INSERT INTO `project_log` VALUES ('06fe86d103b84ef59f7e5200774be684', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:15:41');
INSERT INTO `project_log` VALUES ('074a5707eb0b4b558f04d50cde471a19', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 17:04:37');
INSERT INTO `project_log` VALUES ('07ef536f7917435588ac87e30b211c1e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 17:04:30');
INSERT INTO `project_log` VALUES ('0813353de95e4af297d974bfc9b7dbff', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 26, '恢复容器', '2018-07-13 15:24:36');
INSERT INTO `project_log` VALUES ('083a16be6d444c22a4cd0ca2b6f0badc', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:18:36');
INSERT INTO `project_log` VALUES ('08561eb96b914a17a5a3059f2035b128', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:12:57');
INSERT INTO `project_log` VALUES ('0acbdf5ab0ac44cba6156c0068232283', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 34, '重启容器', '2018-07-13 15:26:32');
INSERT INTO `project_log` VALUES ('0b8bee081c5b4245b442a17a675d6fa7', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-14 09:39:52');
INSERT INTO `project_log` VALUES ('0ca2c616703d4a00a9a3c3d65cdfc42f', 'ae73ea0aa5c64b10971a161f385bde4c', NULL, 10, '创建项目', '2018-07-14 15:10:10');
INSERT INTO `project_log` VALUES ('0cb3cc5202624b2d9ead7ca50e130af7', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 16:11:04');
INSERT INTO `project_log` VALUES ('0e75025f17f444df9d2e7a67ecdd14a2', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-14 09:44:41');
INSERT INTO `project_log` VALUES ('0e83b08ad8bd4d75a8e6d6eef3511874', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:28:34');
INSERT INTO `project_log` VALUES ('0eb7fc2ba5a04ac0aa4ea2faa7d82455', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:48:51');
INSERT INTO `project_log` VALUES ('0ee2558390c64c35b7d3c307aea04397', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 17:02:53');
INSERT INTO `project_log` VALUES ('0fa2ab22b2a444f99f144c659a34d88b', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:25:47');
INSERT INTO `project_log` VALUES ('1080aa3614fb491d86ecdeaf1b0c1549', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', 20, '创建容器', '2018-07-16 11:16:50');
INSERT INTO `project_log` VALUES ('108319823c25428aa609db5b2759e15c', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 08:59:41');
INSERT INTO `project_log` VALUES ('109cd80046db4bf19fab4723f53d1a71', '33398ea14de14d979a495a3a53051b1a', NULL, 21, '创建容器失败，原因：Docker异常', '2018-07-16 09:45:57');
INSERT INTO `project_log` VALUES ('110240651d444c17aa593b2e9e8cbb8d', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:16:06');
INSERT INTO `project_log` VALUES ('14844b130cce4682a77abc8a13e4a37e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 16:34:43');
INSERT INTO `project_log` VALUES ('15320e0dc45e47c780d3fad19dad4488', NULL, 'tx6tvjzote80f7osukx8mqu27', 36, '删除服务', '2018-07-15 09:55:47');
INSERT INTO `project_log` VALUES ('1739633bbbe945afb7f020f7aefc234b', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 08:59:59');
INSERT INTO `project_log` VALUES ('185160caddcb4fe49236ea48a9aa98c3', '33398ea14de14d979a495a3a53051b1a', NULL, 21, '创建容器失败，原因：Docker异常', '2018-07-16 09:42:10');
INSERT INTO `project_log` VALUES ('18ab98fc56444c4292e0c6e534fb5ec0', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:17:35');
INSERT INTO `project_log` VALUES ('18b0fb0935f746c5a48f0181a22f7b98', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:04:57');
INSERT INTO `project_log` VALUES ('1b650aaecbca412b868da4f092da2ac9', '9f7bb35e1eea4ccab7e0df916cb961fe', NULL, 10, '创建项目', '2018-07-14 15:09:58');
INSERT INTO `project_log` VALUES ('1c4a750743b247ad8086548b97d49d79', '6860df07dd1445228ff21d53eb18be65', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-15 12:19:31');
INSERT INTO `project_log` VALUES ('1c89b6b1f0054ce095455f91c28d97be', '642332c7c45f48e38626f8360df410ee', '04ocokp5kng7vsl5bzb6rzzo5', 38, '新建服务', '2018-07-16 14:33:37');
INSERT INTO `project_log` VALUES ('1d92b018acde47558153be78fc559b52', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 16:13:55');
INSERT INTO `project_log` VALUES ('1d962a7b08ca4175b485205f68287e3d', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:18:26');
INSERT INTO `project_log` VALUES ('1db1edd4be2c4435ad02b788720d8385', NULL, 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 32, '删除容器', '2018-07-16 08:42:04');
INSERT INTO `project_log` VALUES ('2192eca4d1d44acebe3574b568fae77e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 16:14:06');
INSERT INTO `project_log` VALUES ('23caad859e9b4d8e9c565a197ec7fca9', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 14:19:53');
INSERT INTO `project_log` VALUES ('240d435d19184feaa07b69884e1ac8ca', '6860df07dd1445228ff21d53eb18be65', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-15 12:18:36');
INSERT INTO `project_log` VALUES ('240e9f1e54ce401aab8dda96d4dc59f9', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 09:02:31');
INSERT INTO `project_log` VALUES ('24dd634287c9403cbe6185922e088af0', '6860df07dd1445228ff21d53eb18be65', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-15 11:06:13');
INSERT INTO `project_log` VALUES ('25557b642717400daca17a776f843c08', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 20, '创建容器', '2018-07-13 15:08:37');
INSERT INTO `project_log` VALUES ('2789b8ce04af4559a6b9bf33f85583c1', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:14:02');
INSERT INTO `project_log` VALUES ('2859554a65684ed3941b6770b4b3085d', '738f28a08c0146acb09e75c8ee146adb', NULL, 10, '创建项目', '2018-07-14 10:30:09');
INSERT INTO `project_log` VALUES ('293736782c044448bbdf6f7440c80ea5', '7570bbe140c34a328e6d5c08a66675cc', NULL, 10, '创建项目', '2018-07-14 14:02:49');
INSERT INTO `project_log` VALUES ('2a121cb5a3924be7ab49c819fb46a522', NULL, '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 32, '删除容器', '2018-07-16 08:43:59');
INSERT INTO `project_log` VALUES ('2a89f351bca840038ebab726f7d9859f', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 17:34:57');
INSERT INTO `project_log` VALUES ('2be0fe799b9d4bfba345182e6c97737e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:45:47');
INSERT INTO `project_log` VALUES ('2dd5cbedad2b4de39dff026d5a9759da', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 08:59:12');
INSERT INTO `project_log` VALUES ('2e8ccf06beac4f10be408e8241c8e59e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 17:03:28');
INSERT INTO `project_log` VALUES ('31feb065ca304cc398fed8945a1f03ed', '6860df07dd1445228ff21d53eb18be65', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-15 10:40:46');
INSERT INTO `project_log` VALUES ('33f49014545242968153b5a5ba550bd3', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:13:15');
INSERT INTO `project_log` VALUES ('368c342ab8924627b32ed60553ce7ae7', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 16:39:44');
INSERT INTO `project_log` VALUES ('386a186788984d17888f0e2f654c4b82', '58d227494a6c4625aa5d15495ae17156', NULL, 10, '创建项目', '2018-07-14 15:10:17');
INSERT INTO `project_log` VALUES ('3c5f275945eb401191a4d11af969e336', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-14 14:48:40');
INSERT INTO `project_log` VALUES ('3d553aff688c40cc8f1e49a00cfa3b77', 'aabakfsvakiuw1213', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 34, '重启容器', '2018-07-16 08:43:54');
INSERT INTO `project_log` VALUES ('3e560ab0c3e54c0e98a3b26d80e02c17', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:24:35');
INSERT INTO `project_log` VALUES ('3eff7686bc8044d18c02d17161ac679d', '33398ea14de14d979a495a3a53051b1a', '1271e2679a630c1b55f21e0b687db0034211757ade1e4c3483a2e6795e8a9bf8', 20, '创建容器', '2018-07-16 14:29:57');
INSERT INTO `project_log` VALUES ('3f8fb140278846a4a171f64105e63346', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-14 09:39:43');
INSERT INTO `project_log` VALUES ('410c08991be64f3b87970e3ec03fa44f', NULL, '238ddaaeee6a18006cedc6fe586a79a2dbd1d4b9c6fe9ef1288943688c536aa6', 32, '删除容器', '2018-07-13 15:28:59');
INSERT INTO `project_log` VALUES ('417fd801be614ecba63e166908f0dede', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 16:51:21');
INSERT INTO `project_log` VALUES ('42007d36c6e040f98a1247f1cf7e1ca9', '6860df07dd1445228ff21d53eb18be65', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-15 10:27:37');
INSERT INTO `project_log` VALUES ('43c627d69bda4b769db4cb72eab94ce3', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:39:55');
INSERT INTO `project_log` VALUES ('4462e7281032447b8c7260b9d022ba7e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-14 09:39:31');
INSERT INTO `project_log` VALUES ('4555eec3d9f14e3791f8ee540f6a5b9e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 08:59:26');
INSERT INTO `project_log` VALUES ('455bce0ee03749d09dbe38172f3ad8d1', 'aabakfsvakiuw1213', '71a8e5a4ded4e0c626fb2a472dc6044f06636495318f0a98f64e858c3560a1f4', 21, '创建容器失败，原因：Docker异常', '2018-07-13 15:06:42');
INSERT INTO `project_log` VALUES ('49aa35f70662444199e02793cd9f7687', '33398ea14de14d979a495a3a53051b1a', '74e75e51e2961dbbd57833fb36f9888fa3046842e9068f66339f3171124833f4', 20, '创建容器', '2018-07-16 11:26:12');
INSERT INTO `project_log` VALUES ('4dfccc5c9530438fb8ed9996d62c2bb3', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:25:13');
INSERT INTO `project_log` VALUES ('4ee4379d3b684327aee6f57a4efbdaea', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 09:00:18');
INSERT INTO `project_log` VALUES ('513207a66ae94fbdaba5f63a7a9cdc99', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:16:25');
INSERT INTO `project_log` VALUES ('52a76f82831047b7b89f80c1f6a6fe61', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 08:58:43');
INSERT INTO `project_log` VALUES ('548b66749bce4818bb8ef4d0eea8c5fc', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 16:45:21');
INSERT INTO `project_log` VALUES ('55d402643eba4b7fa658e10ad228b736', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:30:25');
INSERT INTO `project_log` VALUES ('56703b0420e940b2a0c0b9de71f07a8e', '5f7abd6bc8ed473ca268d9c0373a13a4', NULL, 10, '创建项目', '2018-07-14 14:39:43');
INSERT INTO `project_log` VALUES ('56b00118aab14f33af3918ff60c7e14d', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:17:17');
INSERT INTO `project_log` VALUES ('57d9c5cabadd467eb3c8d90416b7fceb', '758a7c9dcebd4e41b2de118356695dba', NULL, 10, '创建项目', '2018-07-14 14:41:37');
INSERT INTO `project_log` VALUES ('581d249c62a647ba9772203b0ac11594', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 16:45:27');
INSERT INTO `project_log` VALUES ('584ea202dddc452cb88f7aecc89907a5', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:27:11');
INSERT INTO `project_log` VALUES ('592cd9ba2d474b7583e9fe4abf18197d', '642332c7c45f48e38626f8360df410ee', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 23, '开启容器失败，原因：Docker异常', '2018-07-16 08:39:30');
INSERT INTO `project_log` VALUES ('596578fe45414e34b266214beeb4d00e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-14 09:39:55');
INSERT INTO `project_log` VALUES ('5a0568c34a974f34909c9f21a474cc3a', '51553ff30e644ae78926e22392bf7a98', 'thm9ngsi6otjiz8wjouw51ycn', 38, '新建服务', '2018-07-15 14:01:45');
INSERT INTO `project_log` VALUES ('5a35c08e0a2542c99b49db254f921ffe', '33398ea14de14d979a495a3a53051b1a', '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', 23, '开启容器失败，原因：Docker异常', '2018-07-16 10:26:15');
INSERT INTO `project_log` VALUES ('5b6542792c3c48348e08d6a51f01521a', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 17:04:20');
INSERT INTO `project_log` VALUES ('5c45ea8e40e14b54bbe6cbb93965aed5', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:29:17');
INSERT INTO `project_log` VALUES ('5d1c3b8c8fec4881aae4b704cd340e6e', 'aabakfsvakiuw1213', '84ee7c3055c396939ccd9c06e15e6d4050807c8fec97410738640b641454324e', 21, '创建容器失败，原因：Docker异常', '2018-07-13 14:58:41');
INSERT INTO `project_log` VALUES ('5e3fd324986944f8b4740b388138912d', '33398ea14de14d979a495a3a53051b1a', 'tkh3mdw9tcdkhojh49wcec3i2', 38, '新建服务', '2018-07-16 15:13:30');
INSERT INTO `project_log` VALUES ('5f6ab565a9e747e19f1a72295114cf2b', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 08:49:09');
INSERT INTO `project_log` VALUES ('5f9fe7b738164f3aa425acce457dc6cb', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-14 14:15:44');
INSERT INTO `project_log` VALUES ('605dc440a46a40f880ab700c9f1e2021', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:25:26');
INSERT INTO `project_log` VALUES ('6129375081a0443f914217fdcfcf239c', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-14 09:35:45');
INSERT INTO `project_log` VALUES ('628949afb6fd4e96a985d5e20fde3fa8', '33398ea14de14d979a495a3a53051b1a', '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', 20, '创建容器', '2018-07-16 09:49:31');
INSERT INTO `project_log` VALUES ('64a49ec3207e40d1bc83292dc1766cd8', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 17:04:03');
INSERT INTO `project_log` VALUES ('6847ad4353c449998213456fab692b85', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 16:10:36');
INSERT INTO `project_log` VALUES ('6a28d1f735bc49598c57c420c779c94d', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:17:32');
INSERT INTO `project_log` VALUES ('6d60aae3bab54f3abee965489a8fb4f7', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-14 09:48:22');
INSERT INTO `project_log` VALUES ('6dece9daf52047e1a8ce081e162ce627', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 30, '强制停止容器', '2018-07-13 17:04:06');
INSERT INTO `project_log` VALUES ('6e37ae5bd7cd4f18b8e9e931ef9a7661', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:31:30');
INSERT INTO `project_log` VALUES ('716afdb355a545598d5e4f58e9027ad8', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:55:06');
INSERT INTO `project_log` VALUES ('719bd2f090ae42ceaf91a44a706098be', '33398ea14de14d979a495a3a53051b1a', '532af6aece322329ab4f5011c0614655548d46496ff4fdbf8d7a00fa0f1245fc', 20, '创建容器', '2018-07-16 14:28:34');
INSERT INTO `project_log` VALUES ('7207ba0fd1c94b2a9f06b8b8826b1243', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:15:30');
INSERT INTO `project_log` VALUES ('734f1968adb44aee9a3769775f032797', 'aabakfsvakiuw1213', '4ad87cd4f9b7b56938d0aad90751ce0a1242cba1a287ad67fd42addff58081c0', 21, '创建容器失败，原因：Docker异常', '2018-07-13 15:00:40');
INSERT INTO `project_log` VALUES ('736541406df542799a0c27a33828189b', '51553ff30e644ae78926e22392bf7a98', '9h7oy6ey1f49d916u3wse4u26', 38, '新建服务', '2018-07-15 14:30:00');
INSERT INTO `project_log` VALUES ('73bb04e6816c4e54886b0818a5651511', NULL, '238ddaaeee6a18006cedc6fe586a79a2dbd1d4b9c6fe9ef1288943688c536aa6', 33, '删除容器失败，原因：Docker异常', '2018-07-13 15:28:59');
INSERT INTO `project_log` VALUES ('73f10acdb9234848b93a1c3f5d4d54f8', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 34, '重启容器', '2018-07-13 18:58:35');
INSERT INTO `project_log` VALUES ('752b79f7fa674d83bd0c372ffd3f7743', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 17:32:59');
INSERT INTO `project_log` VALUES ('7730305a48424970a9816b8fd07baacf', '33398ea14de14d979a495a3a53051b1a', '0cd7tari7e6pv38vwcb1aei22', 38, '新建服务', '2018-07-16 15:05:59');
INSERT INTO `project_log` VALUES ('7986757a44ba483a9007b7c978bae773', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:35:41');
INSERT INTO `project_log` VALUES ('79fa3c9ca86848e287de8d35d4210b7c', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:32:07');
INSERT INTO `project_log` VALUES ('7a52a362c9104dca897c58ffab5395db', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 15:56:53');
INSERT INTO `project_log` VALUES ('7ab039958a284827a670a9853219f09d', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 16:14:12');
INSERT INTO `project_log` VALUES ('7b891bb01b4c47b9b42d36a8b70a9bba', 'aabakfsvakiuw1213', '0f3fbcb67895b10f8a0089908dbbd1435fd1a7295ab2dfa5e3a619b0f0f30137', 21, '创建容器失败，原因：Docker异常', '2018-07-13 15:04:46');
INSERT INTO `project_log` VALUES ('7c68da3962444ae9a9bb3f362ff4e71e', 'a5744e8f469746cea01e03010f3ddfe9', NULL, 10, '创建项目', '2018-07-14 11:34:18');
INSERT INTO `project_log` VALUES ('7d5bc958061a42f1bed1321578b9c42d', '33398ea14de14d979a495a3a53051b1a', NULL, 21, '创建容器失败，原因：Docker异常', '2018-07-16 09:44:53');
INSERT INTO `project_log` VALUES ('7daf88d1523f48779e5dadf147291795', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:14:11');
INSERT INTO `project_log` VALUES ('7e26433308ae42d3b45c5eb33a512c66', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:16:10');
INSERT INTO `project_log` VALUES ('7ffe9a0e8a44407faefe683b0cd34917', '6b3f4099393e44ada3fc2c3d68f089e5', NULL, 10, '创建项目', '2018-07-14 15:10:04');
INSERT INTO `project_log` VALUES ('82b5d6f641094a0cb21a423425cc0518', '642332c7c45f48e38626f8360df410ee', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-16 14:32:59');
INSERT INTO `project_log` VALUES ('84ac4384de764ef494c0ee67fac016a9', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-14 14:41:03');
INSERT INTO `project_log` VALUES ('85c19a9358de474aa34d2ee20186f1b1', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-14 09:48:15');
INSERT INTO `project_log` VALUES ('85cf36246a5d4d9f9572740d98a191aa', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 30, '强制停止容器', '2018-07-13 15:25:55');
INSERT INTO `project_log` VALUES ('87f80d51937746d7a334e10db260de6e', NULL, 'ucs6z37u79vepszed3gdutn3l', 36, '删除服务', '2018-07-15 09:49:02');
INSERT INTO `project_log` VALUES ('8aaabf8456ea457189aa763321d0abdc', 'd599aa5b00994a429d5039c21cf0f559', NULL, 10, '创建项目', '2018-07-14 15:10:14');
INSERT INTO `project_log` VALUES ('8b477239f3004e7ca84cb85d57a686b9', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 14:14:39');
INSERT INTO `project_log` VALUES ('8b75ed91f2204bf89c9539ad926d7d0b', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-14 14:07:20');
INSERT INTO `project_log` VALUES ('8c125d6bb4a9460880890516cca90b6f', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:25:03');
INSERT INTO `project_log` VALUES ('8ca9a668861249e98e630db070d17549', 'aabakfsvakiuw1213', '238ddaaeee6a18006cedc6fe586a79a2dbd1d4b9c6fe9ef1288943688c536aa6', 20, '创建容器', '2018-07-13 15:22:50');
INSERT INTO `project_log` VALUES ('8caa8776ae4f4488abdbb2fe3f5f8d0d', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 14:20:06');
INSERT INTO `project_log` VALUES ('90190235963e4833935028f41d1f8ef0', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', 22, '开启容器', '2018-07-16 11:41:20');
INSERT INTO `project_log` VALUES ('912a41ac39074342899315b20685bdab', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:19:03');
INSERT INTO `project_log` VALUES ('9212b1fe3c374c309d18ae1f1edcb43f', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 08:50:10');
INSERT INTO `project_log` VALUES ('927568cc11a94ab29f67e92042766623', 'aabakfsvakiuw1213', 'a65eb55a6e5232d029fe7fc741aee2fb024145d4abe26b436ca3b408e1b4f838', 21, '创建容器失败，原因：Docker异常', '2018-07-13 15:03:12');
INSERT INTO `project_log` VALUES ('92ba161a9c574323a4421edc0402d6fe', '3ef12b32f0a04284834cc25d48fa414b', NULL, 10, '创建项目', '2018-07-14 14:35:42');
INSERT INTO `project_log` VALUES ('93a701b7a41a4baa85ce01c67fd28fbc', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 24, '暂停容器', '2018-07-13 17:04:17');
INSERT INTO `project_log` VALUES ('9403de6fa3434214a115397e1f2a2481', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-14 09:39:37');
INSERT INTO `project_log` VALUES ('94a93d4d3eb447898f72edf297430c7d', '51553ff30e644ae78926e22392bf7a98', 'yhsxjeq7fl4paobkkv40184i4', 38, '新建服务', '2018-07-15 13:44:51');
INSERT INTO `project_log` VALUES ('955716caf873412ab8db9ff89565188a', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-14 09:48:12');
INSERT INTO `project_log` VALUES ('95f58467082f44f6bc2c99f651792fa4', '6860df07dd1445228ff21d53eb18be65', '502a6d642188dc22c88ac13501d620cb95a57150ed7f4cdd65d91ec0fc1caad0', 20, '创建容器', '2018-07-13 18:50:39');
INSERT INTO `project_log` VALUES ('965463c5eea340efbf867b0fa15560ed', '51553ff30e644ae78926e22392bf7a98', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-15 13:43:28');
INSERT INTO `project_log` VALUES ('97da399462c44753bd80a7401e87d32e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:17:52');
INSERT INTO `project_log` VALUES ('9802c916e94e4b1a8953bf43749262db', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 16:38:40');
INSERT INTO `project_log` VALUES ('997def7b0315493da0c806e81e834cdc', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', 28, '停止容器', '2018-07-16 11:41:29');
INSERT INTO `project_log` VALUES ('9a7e9c7db59f4cbf853e5837b19b13e5', '33398ea14de14d979a495a3a53051b1a', '28b89f5b8dd6d08d28b71224de66cd09898cbace2eb2da8c691827d503908cd6', 20, '创建容器', '2018-07-16 14:19:48');
INSERT INTO `project_log` VALUES ('9a8f3f6a13f14fad8c44bd3e58d29302', '913f0b0ab57141e0aa1f90baac7c8d60', NULL, 10, '创建项目', '2018-07-14 15:10:21');
INSERT INTO `project_log` VALUES ('9b220f489b5a45d9b2970c919b4cbe88', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:16:28');
INSERT INTO `project_log` VALUES ('9b9c7600f7764b7ab356f79389574c2c', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 16:49:50');
INSERT INTO `project_log` VALUES ('9c4dfc369aae483ab479664461391c91', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 17:35:10');
INSERT INTO `project_log` VALUES ('9e1a10aee6e942f08144f1c455fa880b', '51553ff30e644ae78926e22392bf7a98', 'u35nanea8kax0j5tdfblk6kmm', 38, '新建服务', '2018-07-15 14:17:31');
INSERT INTO `project_log` VALUES ('a1a5b32df133452ab60ccdf158f3dcc6', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 08:46:13');
INSERT INTO `project_log` VALUES ('a7d9c207a33744819e52b50b6c033f64', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:08:56');
INSERT INTO `project_log` VALUES ('a8d65ebfa8f143df9ee7f0eacba34a11', 'aabakfsvakiuw1213', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-16 08:43:51');
INSERT INTO `project_log` VALUES ('a9a649a4338646b1a268d24dfbb6aeec', NULL, '502a6d642188dc22c88ac13501d620cb95a57150ed7f4cdd65d91ec0fc1caad0', 32, '删除容器', '2018-07-13 18:51:40');
INSERT INTO `project_log` VALUES ('aab31fea73544f28a05ed7e1e0baf09f', '33398ea14de14d979a495a3a53051b1a', '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', 23, '开启容器失败，原因：Docker异常', '2018-07-16 09:53:17');
INSERT INTO `project_log` VALUES ('ab94691192824eacbf0cb33c07f56398', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 24, '暂停容器', '2018-07-13 15:23:51');
INSERT INTO `project_log` VALUES ('adb1a396bb8d4854be3d94340c8723e7', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-14 09:46:41');
INSERT INTO `project_log` VALUES ('b17ef183941141f78a42cd2e43c21be5', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-14 09:46:48');
INSERT INTO `project_log` VALUES ('b29be86aed144ba39985637adb612478', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:17:12');
INSERT INTO `project_log` VALUES ('b2aa6740a35c4fdf8f8bbec6521c9682', '33398ea14de14d979a495a3a53051b1a', NULL, 10, '创建项目', '2018-07-14 15:09:50');
INSERT INTO `project_log` VALUES ('b3dc15b6247c462b8e4b753292cf4869', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 09:02:00');
INSERT INTO `project_log` VALUES ('b41856a1474f47a2af3e55179730208e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:27:23');
INSERT INTO `project_log` VALUES ('bb865a64c24f43459f0412d42453c42d', '642332c7c45f48e38626f8360df410ee', 'fa096rzvp3658llejj8q3v2rx', 38, '新建服务', '2018-07-16 11:23:30');
INSERT INTO `project_log` VALUES ('c04e8ba2b868423393958d03bb05a2c2', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:32:28');
INSERT INTO `project_log` VALUES ('c2f26b76bad94740b078c68403af16fa', 'f45a65eae10842b68cebeb86b10940cb', 'e95f354eff971e2727150229174e7dcc46cb439c1715c6dbccb3524a1956e2cc', 22, '开启容器', '2018-07-16 10:28:38');
INSERT INTO `project_log` VALUES ('c33ea80d35224160892daad0ed1c1a4e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-14 14:41:16');
INSERT INTO `project_log` VALUES ('c3820d8e1856437399748c0b0feab42e', 'f45a65eae10842b68cebeb86b10940cb', 'e95f354eff971e2727150229174e7dcc46cb439c1715c6dbccb3524a1956e2cc', 20, '创建容器', '2018-07-16 10:28:27');
INSERT INTO `project_log` VALUES ('c9ac6ee4d2794bd9895bfc4dafcd4d27', '642332c7c45f48e38626f8360df410ee', 'q53qoxqh9jio8od0pjrl0ptsy', 38, '新建服务', '2018-07-16 11:31:21');
INSERT INTO `project_log` VALUES ('c9b7b12fefe64b9084d4bf4ca95a0c44', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:28:13');
INSERT INTO `project_log` VALUES ('cb34448d3a604fd98dbb2014b9cc3460', '33398ea14de14d979a495a3a53051b1a', 'csjgwrye18ixze9kgrjus3lot', 38, '新建服务', '2018-07-16 15:20:31');
INSERT INTO `project_log` VALUES ('cbfe3a3164664f8fb5fa05b28b7a64cf', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 15:16:35');
INSERT INTO `project_log` VALUES ('ce58fc454f7b411ca5a5cc8d7ea0a45d', 'f45a65eae10842b68cebeb86b10940cb', NULL, 10, '创建项目', '2018-07-16 10:27:44');
INSERT INTO `project_log` VALUES ('d09f2e450d0b4774b5a71489995f4ced', '33398ea14de14d979a495a3a53051b1a', '57df8a016dad429a80e432dc5c11eb493ffa8e918678692352b7d509d41d759f', 20, '创建容器', '2018-07-16 11:23:46');
INSERT INTO `project_log` VALUES ('d2442a077eb047a386ad28d5df730be2', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 34, '重启容器', '2018-07-13 17:04:12');
INSERT INTO `project_log` VALUES ('d2b19954a4f84d0abbc322e7614fb013', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:26:50');
INSERT INTO `project_log` VALUES ('d3d63e0f42d24ed5a1d965e5a7f770ef', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 09:14:46');
INSERT INTO `project_log` VALUES ('d57a1a5134464404bb7757f70951ff71', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-14 13:46:44');
INSERT INTO `project_log` VALUES ('d7dfaeb75e2f40009c0a78c62910cfcf', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 14:14:30');
INSERT INTO `project_log` VALUES ('d7f3d2a87a3b43b09b85e667614b4b93', '642332c7c45f48e38626f8360df410ee', 'kdy3aygudnqysyrla0w3amgj6', 38, '新建服务', '2018-07-16 14:42:17');
INSERT INTO `project_log` VALUES ('db0427de60364ad0a0a4d636adac3f32', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:47:22');
INSERT INTO `project_log` VALUES ('db3fbfda2d4545369a7c2f5e7d62c729', '33398ea14de14d979a495a3a53051b1a', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-16 15:05:32');
INSERT INTO `project_log` VALUES ('dc0bcd3118e94e9b9de7faebe25e0a6f', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:44:45');
INSERT INTO `project_log` VALUES ('ddaa15cd49f84e28a4cf1be0dfd3fb07', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:29:37');
INSERT INTO `project_log` VALUES ('e181785e954c47abb9f336fd0883f74e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:45:25');
INSERT INTO `project_log` VALUES ('e227cb6678fb457db605d3c2ae1f8802', '9b84a6acd0f24e07ac5695a56986eaa7', NULL, 10, '创建项目', '2018-07-14 18:08:20');
INSERT INTO `project_log` VALUES ('e307980ee9174e668cf6c868ae87bf73', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 14:47:04');
INSERT INTO `project_log` VALUES ('e54523d274534a128ed098f4ac9fd52f', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 26, '恢复容器', '2018-07-13 17:04:35');
INSERT INTO `project_log` VALUES ('e6a8b201846a414f88186aa9961e6f55', '642332c7c45f48e38626f8360df410ee', '04b3rsh8e78i1ghuf2sl246x9', 38, '新建服务', '2018-07-16 11:34:01');
INSERT INTO `project_log` VALUES ('e6b02eb985f1474bbcd13c29f2e3196b', 'e64c5069df7a42789d8fde36e8a8b990', NULL, 10, '创建项目', '2018-07-14 14:40:15');
INSERT INTO `project_log` VALUES ('e6b76d04144b4008bd5b00df2c73cd34', '33398ea14de14d979a495a3a53051b1a', 'd47a357cb627d210d97d0517eb3d8b707f0b60f8cc38f99a17d44a0e1970d08a', 22, '开启容器', '2018-07-16 10:26:19');
INSERT INTO `project_log` VALUES ('e6f0d1a427624bf4a15cc43b36362d0a', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:26:36');
INSERT INTO `project_log` VALUES ('e778151322d44216b529c02a9c6ab19c', '33398ea14de14d979a495a3a53051b1a', '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', 23, '开启容器失败，原因：Docker异常', '2018-07-16 10:26:08');
INSERT INTO `project_log` VALUES ('e986863729494eb09a8a9ae5fa17dfcc', NULL, 'u9j6shg92ygidu0ja05ecw41x', 36, '删除服务', '2018-07-15 09:53:50');
INSERT INTO `project_log` VALUES ('ea0e1cb6ad3b426d81e02fa93469a556', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 24, '暂停容器', '2018-07-13 17:04:31');
INSERT INTO `project_log` VALUES ('ea252286931d49d6a32be86551bab45c', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 20, '创建容器', '2018-07-12 14:12:52');
INSERT INTO `project_log` VALUES ('ea49e0c6eed34b7b8ed317b6d6836a23', '33398ea14de14d979a495a3a53051b1a', '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', 23, '开启容器失败，原因：Docker异常', '2018-07-16 10:26:32');
INSERT INTO `project_log` VALUES ('ea67efd5591a40deb7b05c95682e3099', '51553ff30e644ae78926e22392bf7a98', 'llmmxfyhi54bcfre18fwgiik6', 38, '新建服务', '2018-07-15 14:27:33');
INSERT INTO `project_log` VALUES ('ebdb44c06fa2419bb34a414bb4084720', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 18:58:25');
INSERT INTO `project_log` VALUES ('eca6c021a0114088a2ca9b847d228957', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 17:36:17');
INSERT INTO `project_log` VALUES ('ecfbed5bdfc646b0ad65fac9ee55dc05', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-14 14:41:08');
INSERT INTO `project_log` VALUES ('ee94de3add7b42a79326fe8a0456721e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 16:34:33');
INSERT INTO `project_log` VALUES ('ee9874acf9e64eeb9f1762af08c8b1c2', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 17:36:58');
INSERT INTO `project_log` VALUES ('f01309f6bb7846eb8a8e42fe8fe8f390', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:27:48');
INSERT INTO `project_log` VALUES ('f27519946c9b45f0b0c787ecf5cbc357', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 16:39:22');
INSERT INTO `project_log` VALUES ('f32c7259f09f4d00b88dd31875613159', '6860df07dd1445228ff21d53eb18be65', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-15 10:35:18');
INSERT INTO `project_log` VALUES ('f33a6bbb88c04346a943c757b00c80fd', '6860df07dd1445228ff21d53eb18be65', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-15 10:49:46');
INSERT INTO `project_log` VALUES ('f4537df30ce048b68bec1becfda7a8b6', '6860df07dd1445228ff21d53eb18be65', NULL, 39, '新建服务失败，原因：Docker异常', '2018-07-15 10:32:13');
INSERT INTO `project_log` VALUES ('f475fa3f372546259d80d29a32bbc616', '642332c7c45f48e38626f8360df410ee', 'j35m8a7brnnxwcpj9ae083cht', 38, '新建服务', '2018-07-16 11:20:12');
INSERT INTO `project_log` VALUES ('f4a07a30a3414136b7719b7815467d0f', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 22, '开启容器', '2018-07-13 15:19:06');
INSERT INTO `project_log` VALUES ('f6774e240b7d44179ba9e9000f4e2a40', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:40:37');
INSERT INTO `project_log` VALUES ('f7b509efa4504d9db7e766de489a786d', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 16:39:31');
INSERT INTO `project_log` VALUES ('f7ef490659b34539934c5ea5bef58e68', '33398ea14de14d979a495a3a53051b1a', 'ia48vlpaz8aib1zhxuzygstja', 38, '新建服务', '2018-07-16 15:04:40');
INSERT INTO `project_log` VALUES ('fa24dab6edd1457381292d89e3ffdd58', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-12 17:36:22');
INSERT INTO `project_log` VALUES ('fa3ad64811b54f3e88ad19cfab40e1b1', 'aabakfsvakiuw1213', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-14 09:39:46');
INSERT INTO `project_log` VALUES ('fc4c69ef8046419db132c574bab9fe4a', '33398ea14de14d979a495a3a53051b1a', 'd47a357cb627d210d97d0517eb3d8b707f0b60f8cc38f99a17d44a0e1970d08a', 20, '创建容器', '2018-07-16 10:07:14');
INSERT INTO `project_log` VALUES ('fccbfa01d9ae42a8980f0a1c05c9c9d4', 'aabakfsvakiuw1213', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-14 13:58:21');
INSERT INTO `project_log` VALUES ('fd820cb930a049e8b366d6a0b9c3a481', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 28, '停止容器', '2018-07-13 15:17:49');
INSERT INTO `project_log` VALUES ('fdf0ab2a70d544a78db03e793368eb56', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', 22, '开启容器', '2018-07-13 08:52:00');
INSERT INTO `project_log` VALUES ('fed1850e8c8640f38b85b00bedb590b3', 'eefe3167399c45d687b6709851ecf3b8', NULL, 10, '创建项目', '2018-07-14 10:33:07');

-- ----------------------------
-- Table structure for repository_image
-- ----------------------------
DROP TABLE IF EXISTS `repository_image`;
CREATE TABLE `repository_image`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
INSERT INTO `repository_image` VALUES ('44337f2e43ad4508a6ff26a6cd20b0cb', '192.168.100.94:5000/f4f4bb152cf54fec94eb0d2b22d25f71/my-busybox:latest', 'f4f4bb152cf54fec94eb0d2b22d25f71/my-busybox', 'latest', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'sha256:cc8aa6490766f53d618c98ab214fbe01e4bbb85e3ddbc6b4044cb7f0736ec91f', '192.168.100.94:5000', '2018-07-13 20:28:36', NULL);

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
INSERT INTO `sys_image` VALUES ('079d56e585534bc69dcec2132f5f3f10', '2cb0d9787c4dd17ef9eb03e512923bc4db10add190d3f84af63b744e353a9b34', 'hello-world:latest', 'hello-world', 'latest', '1848', 1, NULL, NULL, '1848', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/hello\\\"]\"]', 'library', '', '2018-07-15 17:24:52', NULL);
INSERT INTO `sys_image` VALUES ('1b0e4f3afaab44c8ba45adc1a1bd586d', '36aed13709a9447e9e0b29b170d04789cf1b531ef99789311ca6229018fe36a0', 'local/1231451941131/test_image1:latest', 'test_image1', 'latest', '1363351', 2, '1231451941131', 0, '1363351', 'null', 'null', 'local', '', '2018-07-15 15:42:33', NULL);
INSERT INTO `sys_image` VALUES ('29952c38f59d44419f9d2cdaa8213b9f', '3c5a051232223f9ccf4a604d611696e98392648c9e567d3ecd2af881c9f93101', 'nginx:latest', 'nginx', 'latest', '108974617', 1, NULL, NULL, '108974617', '{\"maintainer\":\"NGINX Docker Maintainers <docker-maint@nginx.com>\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"nginx\\\" \\\"-g\\\" \\\"daemon off;\\\"]\"]', 'library', '', '2018-07-12 14:10:08', NULL);
INSERT INTO `sys_image` VALUES ('7b60c2929ea2495fb1192e4f835d5429', '7afb7abcfe5f2c54e9a34ddf70337aa7d207eee2bc172100dc439e97bfebfcee', 'portainer/portainer:latest', 'portainer', 'latest', '56967692', 1, NULL, NULL, '56967692', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"ENTRYPOINT [\\\"/portainer\\\"]\"]', 'portainer', '', '2018-07-13 12:00:00', NULL);
INSERT INTO `sys_image` VALUES ('a421f1e10fbe4e6e87bbe439dde3ce37', 'c8b665fafb2c4955b599425ae34e5fbf4bfcd2f485ea04b617b6f4ec9a97915d', '192.168.100.94:5000/f4f4bb152cf54fec94eb0d2b22d25f71/my-busybox:latest', 'f4f4bb152cf54fec94eb0d2b22d25f71/my-busybox', 'latest', '1363351', 1, NULL, NULL, '1363351', 'null', 'null', '192.168.100.94:5000', '', '2018-07-13 20:20:37', NULL);
INSERT INTO `sys_image` VALUES ('a77495bfdc204a30954d18b5fffc2193', 'bcb87a42a9544aca7cfa1d5fcb82699458290b005b6bb178f365f1411bb246c4', 'hello-seattle:latest', 'hello-seattle', 'latest', '1872', 1, NULL, NULL, '1872', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/hello\\\"]\"]', 'library', '', '2018-07-13 17:30:00', NULL);
INSERT INTO `sys_image` VALUES ('e2a0019cfba0418a85c1b2b1ce21e5c8', 'c8b665fafb2c4955b599425ae34e5fbf4bfcd2f485ea04b617b6f4ec9a97915d', 'local/f4f4bb152cf54fec94eb0d2b22d25f71/my-busybox:latest', 'my-busybox', 'latest', '1363351', 2, 'f4f4bb152cf54fec94eb0d2b22d25f71', 0, '1363351', 'null', 'null', 'local', '', '2018-07-13 17:28:10', NULL);

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
INSERT INTO `sys_log` VALUES ('016cf1363f6b47eca917d8ac3ab4b6ba', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:48');
INSERT INTO `sys_log` VALUES ('03788e00a26f4f0e980ed1c342b1af62', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 14:28:34');
INSERT INTO `sys_log` VALUES ('03e187dab7ea418387daa963ba038e32', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-13 18:50:39');
INSERT INTO `sys_log` VALUES ('0474c44432a64e1eb38f30221bdf75aa', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=阿芳&description=asgferhgojjhpkytkujkm', NULL, '2018-07-14 14:40:15');
INSERT INTO `sys_log` VALUES ('0650063ffc3b45c0bcc7848ef94f83ee', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:29');
INSERT INTO `sys_log` VALUES ('09f0eb75dd6a4650a191e4f239b7b931', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131', NULL, '2018-07-11 15:42:20');
INSERT INTO `sys_log` VALUES ('0a09c546c5e34305a0611d7b8e273021', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', 'ids=4151361367131', NULL, '2018-07-09 15:58:37');
INSERT INTO `sys_log` VALUES ('0a5ed2db6c16433daacf611e729fad2b', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 11:34:01');
INSERT INTO `sys_log` VALUES ('0b1401fa60e6495ea0ad3236e594fb58', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131', NULL, '2018-07-11 15:41:54');
INSERT INTO `sys_log` VALUES ('0b7e93e8d19c46568d019758bce241a1', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:44');
INSERT INTO `sys_log` VALUES ('0dc8c2f4fead49bcac2268d5be0da342', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', 'Image not found: hello-worl:latest', '2018-07-15 17:29:00');
INSERT INTO `sys_log` VALUES ('0f1598d17d4c4f10821cc0a704fbfe09', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=GR&description=AFG', NULL, '2018-07-14 15:10:17');
INSERT INTO `sys_log` VALUES ('10766e241d7c4eaba9ce3e18a27301c2', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131', NULL, '2018-07-11 15:29:55');
INSERT INTO `sys_log` VALUES ('1161cf8756f14c879e2e5c47379f5cbf', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=11aa8e60c5a8475fb44a332e60ff95fa&containerName=aaa&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', NULL, '2018-07-07 15:48:32');
INSERT INTO `sys_log` VALUES ('132585c96af047539f735c4cecf4844f', NULL, 40, '上传镜像到Hub', NULL, NULL, NULL, NULL, '', NULL, '2018-07-13 20:13:52');
INSERT INTO `sys_log` VALUES ('19404230c9da48208fa8b8f649494925', 'agfag13131', 60, '创建公共网络', '/network/public/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=aaa&driver=overlay', 'Timeout: POST http://192.168.100.42:2375/networks/create', '2018-07-14 18:11:27');
INSERT INTO `sys_log` VALUES ('194a7b870f7e406a9d538946545e684d', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 13:43:28');
INSERT INTO `sys_log` VALUES ('1bbae001f28a42b0ab23f06e9e480ee4', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:26:04');
INSERT INTO `sys_log` VALUES ('1c2ad352ff8445af98ab82466fcfa9d5', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=13,14', NULL, '2018-07-13 18:05:26');
INSERT INTO `sys_log` VALUES ('1e0cbf709a54405084fb11a09ce143d6', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:09:01');
INSERT INTO `sys_log` VALUES ('20c1b97917a64ba884e9b0525f9b8b08', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 13:44:51');
INSERT INTO `sys_log` VALUES ('229b5f88d40f4f15a132d488cf4f7c5d', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=阿芳&description=waegfrebehyr方的观点呢', NULL, '2018-07-14 14:39:43');
INSERT INTO `sys_log` VALUES ('22c92fc9615e4756b6adae38ca45f55d', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 10:27:37');
INSERT INTO `sys_log` VALUES ('2345c00cd4644ceb922ac72548ebf0e3', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:19');
INSERT INTO `sys_log` VALUES ('23c96c7d0b4d4d58b1dd459e9310a4b2', 'afafaf24131', 11, '删除项目', '/project/delete/3ef12b32f0a04284834cc25d48fa414b', 'DELETE', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', NULL, '2018-07-14 14:53:30');
INSERT INTO `sys_log` VALUES ('24de149e90754f60816463668b4488f0', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:00:48');
INSERT INTO `sys_log` VALUES ('285221d4c0d943eda9e8ee8be4ab512b', '1231451941131', 23, '删除镜像', '/image/delete/592838bf086d4f6cb6f412e0f859f337', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-13 17:26:54');
INSERT INTO `sys_log` VALUES ('297ef9baf0094ca8a78d8c5e17fbbfb5', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=yu&description=水电站发生', NULL, '2018-07-14 14:35:42');
INSERT INTO `sys_log` VALUES ('2acb5642b5ab48ec80c920e1fbb7dc11', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313', NULL, '2018-07-10 17:02:50');
INSERT INTO `sys_log` VALUES ('2ae663d461d5439b919edad9a781d982', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 14:17:31');
INSERT INTO `sys_log` VALUES ('2af6929e67fb48e289cc4f6dc02dbde8', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-07 16:16:40');
INSERT INTO `sys_log` VALUES ('2dfe8c522c6c48d8bf184da6810e1a3b', 'f4f4bb152cf54fec94eb0d2b22d25f71', 21, '删除容器', '/container/delete/168b7deb35332e3659fa61e4b9a9d7ea229a8641b44ab88263595562887382d9', 'DELETE', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-10 20:25:24');
INSERT INTO `sys_log` VALUES ('2fd0005bc24a458ca1f3c7ed36ed5f8a', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=挂号&description=双方共同', NULL, '2018-07-14 15:10:04');
INSERT INTO `sys_log` VALUES ('3031375853f64afebcf612632d48fa48', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313', NULL, '2018-07-11 15:41:59');
INSERT INTO `sys_log` VALUES ('30c538f352f14568a75850fdb1a7c99c', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', '读取容器状态异常', '2018-07-13 15:06:42');
INSERT INTO `sys_log` VALUES ('31304ba17dba4e22aa271cbbc7f702d9', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:41');
INSERT INTO `sys_log` VALUES ('31d3eff2b59e48d3a6997c325976c19a', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=babababba&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', NULL, '2018-07-07 15:46:16');
INSERT INTO `sys_log` VALUES ('32eb03ff96a340e7b68b87206b98ad66', 'f4f4bb152cf54fec94eb0d2b22d25f71', 24, '从DockerHub拉取镜像', '/image/pull/hub', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageName=nginx', NULL, '2018-07-12 14:10:08');
INSERT INTO `sys_log` VALUES ('34e12f4db4234ed483a1177136f88f77', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', NULL, '2018-07-11 16:18:17');
INSERT INTO `sys_log` VALUES ('35787bcb0ed940339225864f403fa260', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 11:31:21');
INSERT INTO `sys_log` VALUES ('36f2fca76f7e4e149d8784c5b0cb0a2c', NULL, 90, '删除服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 09:49:02');
INSERT INTO `sys_log` VALUES ('388f06f9f86c485a890c0c9988e95b96', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=昂热润滑油&description=昂如虎添翼', NULL, '2018-07-14 15:09:50');
INSERT INTO `sys_log` VALUES ('38e1410510254bfab2d896f6121d67a3', '213yuyjgdqweyyj', 62, '创建个人网络', '/network/self/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=JIT123WXS&driver=overlay', NULL, '2018-07-14 19:52:46');
INSERT INTO `sys_log` VALUES ('3acd1624f7f348e69f274b481538b9f1', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 12:19:31');
INSERT INTO `sys_log` VALUES ('3af1d99b6cba408eba8d5c100bfb8a91', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 14:30:00');
INSERT INTO `sys_log` VALUES ('3b2bb3cf4aaf4e9ca54038e936243419', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=feawafqef&description=avwfvv', NULL, '2018-07-14 14:02:49');
INSERT INTO `sys_log` VALUES ('3c868bba55eb498590e3c154490de816', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=qqqqqq&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:34:29');
INSERT INTO `sys_log` VALUES ('3d635ad7f2eb43448de240b389d3019c', '1231451941131', 23, '删除镜像', '/image/delete/55122bf050904da79f143193cb20647b', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', NULL, '2018-07-12 14:04:56');
INSERT INTO `sys_log` VALUES ('40a5053a55e74fb18a94ef2950a0f435', 'agfag13131', 60, '创建公共网络', '/network/public/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=123&driver=host', 'Request error: POST http://192.168.100.30:2375/networks/create: 403, body: {\"message\":\"only one instance of \\\"host\\\" network is allowed\"}\n', '2018-07-14 17:54:55');
INSERT INTO `sys_log` VALUES ('40be9034d91f4335947982d60ef46fc9', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', NULL, '2018-07-10 17:02:58');
INSERT INTO `sys_log` VALUES ('4152a49d315b42d5b1fc1784fc74081a', 'f4f4bb152cf54fec94eb0d2b22d25f71', 25, '上传镜像到DockerHub', '/image/push', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=fe597270fe0b4ab581427edef523fe24&username=jitwxs&password=', 'Image push failed: jitwxs/hello-world: ProgressMessage{id=null, status=null, stream=null, error=unauthorized: incorrect username or password, progress=null, progressDetail=null}', '2018-07-13 16:45:57');
INSERT INTO `sys_log` VALUES ('41c12b88ad5c4954af649b51f1009295', '1231451941131', 62, '删除网络失败', '/network/delete/642c9197063a42e6151d49f05ce45c8585665b03ee4c3ec22eb5a38a30b9137f', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', 'Request error: DELETE http://192.168.100.30:2375/networks/642c9197063a42e6151d49f05ce45c8585665b03ee4c3ec22eb5a38a30b9137f: 403, body: {\"message\":\"bridge is a pre-defined network and cannot be removed\"}\n', '2018-07-15 21:21:45');
INSERT INTO `sys_log` VALUES ('44d3c213e814464db5ecf58d26747914', NULL, 21, '删除容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 08:42:04');
INSERT INTO `sys_log` VALUES ('46cdd62151004b5a98d961ea0f2f71dd', 'afaba31231451', 50, '清理数据卷', '/volumes/clean/2', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-16 14:34:14');
INSERT INTO `sys_log` VALUES ('4767c664cb7c477bb472a1b3bd29ca2e', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131,4151361367131', NULL, '2018-07-10 17:01:31');
INSERT INTO `sys_log` VALUES ('489fd7cda8ca4fec8d1c5aec9b498d4f', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=77359933164a459a89485d9e32c2ac40&containerName=biubiubiu&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', NULL, '2018-07-07 15:40:58');
INSERT INTO `sys_log` VALUES ('49be561f14c34e34a29d0270a3c3dee9', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', 'Request error: POST http://192.168.100.42:2375/services/create: 500, body: {\"message\":\"rpc error: code = Unknown desc = name conflicts with an existing object\"}\n', '2018-07-16 14:32:59');
INSERT INTO `sys_log` VALUES ('4aeaa3e317124fa1bb7804780d5030d4', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', NULL, '2018-07-10 17:03:32');
INSERT INTO `sys_log` VALUES ('4c6b6b97ebc44c90be0330b66210e9cf', 'afaba31231451', 50, '清理数据卷', '/volumes/clean/2', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-16 14:41:59');
INSERT INTO `sys_log` VALUES ('4d2aa92c642643dd9dc2251a2f8105fe', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:34');
INSERT INTO `sys_log` VALUES ('4dcf43f479bb4610be4e7e2bf9558ee9', 'f4f4bb152cf54fec94eb0d2b22d25f71', 24, '从DockerHub拉取镜像', '/image/pull/hub', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageName=nginx', NULL, '2018-07-12 14:04:22');
INSERT INTO `sys_log` VALUES ('50c219149c50418e8bb0c94d5c545822', '213yuyjgdqweyyj', 63, '创建个人网络失败', '/network/self/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=jit-wxs&driver=overlay', 'Request error: POST http://192.168.100.42:2375/networks/create: 400, body: {\"message\":\"rpc error: code = InvalidArgument desc = name must be valid as a DNS name component\"}\n', '2018-07-14 19:40:44');
INSERT INTO `sys_log` VALUES ('517178696cdf44398012a4557d99b7c9', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 14:29:57');
INSERT INTO `sys_log` VALUES ('548ab9afa8694883ba37abca81406097', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', NULL, '2018-07-11 16:18:24');
INSERT INTO `sys_log` VALUES ('54bf27c3f4934bbf966609a85ae91477', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,4151361367131', NULL, '2018-07-11 12:30:56');
INSERT INTO `sys_log` VALUES ('54e17b54ec254572b9f740a3209f4390', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', '读取容器状态异常', '2018-07-13 15:04:46');
INSERT INTO `sys_log` VALUES ('55ced47a6f95432bb3c2ee7d84d47397', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=5预计可露露&description=阿尔冯大Vv', NULL, '2018-07-14 14:41:37');
INSERT INTO `sys_log` VALUES ('55cf2809ee684eb4abd10246a387713a', 'afaba31231451', 50, '清理数据卷', '/volumes/clean/1', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-16 14:42:03');
INSERT INTO `sys_log` VALUES ('56469c0823e6451e93a7b95f2a46e266', 'afaba31231451', 50, '清理数据卷', '/volumes/clean/2', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-16 14:16:36');
INSERT INTO `sys_log` VALUES ('57e06f36faa14484ad07753c81371776', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 15:04:40');
INSERT INTO `sys_log` VALUES ('585c2ba7a3404e4e97388581c2375813', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=fe597270fe0b4ab581427edef523fe24&containerName=Hello-World二号&projectId=aabakfsvakiuw1213', NULL, '2018-07-13 15:22:50');
INSERT INTO `sys_log` VALUES ('58657a1a715f41b7a33c0a09b1aff730', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=11aa8e60c5a8475fb44a332e60ff95fa&containerName=bbb&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', NULL, '2018-07-07 16:10:44');
INSERT INTO `sys_log` VALUES ('58bce1ce846046adbeb15246f80a5eb4', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', 'Request error: POST http://192.168.100.42:2375/services/create: 400, body: {\"message\":\"rpc error: code = InvalidArgument desc = port \'15666\' is already in use by service \'afafaf24131-serviceLC\' (ia48vlpaz8aib1zhxuzygstja) as an ingress port\"}\n', '2018-07-16 15:05:32');
INSERT INTO `sys_log` VALUES ('5903638c28074cc5be7ffe2929ebca01', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=3ece2db9a8cf4917a856b8161c8f9a7f&containerName=哇咔咔的容器&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:05:24');
INSERT INTO `sys_log` VALUES ('63b06a479c1b4e9fb07cd5efb8ac823c', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 10:40:46');
INSERT INTO `sys_log` VALUES ('6408394f797145c0b53facadc9a8f8fe', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 15:01:16');
INSERT INTO `sys_log` VALUES ('64baf2db09e3455fb0f2a5652d9c9f8a', 'f4f4bb152cf54fec94eb0d2b22d25f71', 21, '删除容器', '/container/delete/238ddaaeee6a18006cedc6fe586a79a2dbd1d4b9c6fe9ef1288943688c536aa6', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-13 15:28:59');
INSERT INTO `sys_log` VALUES ('6748a304402d455fa29cd9ec516326da', 'afafaf24131', 11, '删除项目', '/project/delete/5f7abd6bc8ed473ca268d9c0373a13a4', 'DELETE', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', NULL, '2018-07-14 14:54:03');
INSERT INTO `sys_log` VALUES ('688b7cf9343840549e873565391bba75', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=哈哈哈gege&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:27:16');
INSERT INTO `sys_log` VALUES ('6a9e1cf07f5a48139d1538e9e56fa536', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 15:13:30');
INSERT INTO `sys_log` VALUES ('6ca5bf6bc0ef453283235498a771c051', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=我是哈哈哈&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:25:16');
INSERT INTO `sys_log` VALUES ('6f6e3ce0d886412c8e8f54c2fa881a93', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=二个人体会局认可&description=热乎若拖亏咯偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶', NULL, '2018-07-14 15:09:58');
INSERT INTO `sys_log` VALUES ('714e387daade47cd934008dda7f6ef23', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:23');
INSERT INTO `sys_log` VALUES ('717f268042e64843a9ce9f4bd9ec272e', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=ppppp&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 14:12:28');
INSERT INTO `sys_log` VALUES ('73459aa1fc284c4cb67f58a9113ab2b8', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 11:26:12');
INSERT INTO `sys_log` VALUES ('73f19d5aa3bd48d7adbfde54a20ad109', NULL, 41, '拉取镜像从Hub', NULL, NULL, NULL, NULL, '', NULL, '2018-07-13 20:20:37');
INSERT INTO `sys_log` VALUES ('7511658782924dbdb7ce735e9e850c06', 'f4f4bb152cf54fec94eb0d2b22d25f71', 21, '删除容器', '/container/delete/238ddaaeee6a18006cedc6fe586a79a2dbd1d4b9c6fe9ef1288943688c536aa6', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-13 15:28:59');
INSERT INTO `sys_log` VALUES ('75beebfbb8d64855bf34a557f4b5ad73', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', '读取容器状态异常', '2018-07-13 15:00:40');
INSERT INTO `sys_log` VALUES ('7630a780e471450a9d61f07cab23ddd7', 'f4f4bb152cf54fec94eb0d2b22d25f71', 24, '从DockerHub拉取镜像', '/image/pull/hub', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageName=hello-world', NULL, '2018-07-12 14:04:35');
INSERT INTO `sys_log` VALUES ('767ff062d73348058c326af78674b327', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', NULL, '2018-07-11 16:17:26');
INSERT INTO `sys_log` VALUES ('771cf1f748c5482a96ab4e367d0832d1', '1231451941131', 23, '删除镜像', '/image/delete/fe597270fe0b4ab581427edef523fe24', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-13 17:05:01');
INSERT INTO `sys_log` VALUES ('7957d402acb443cc841d2508dd264fc2', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:24:52');
INSERT INTO `sys_log` VALUES ('7c1a908313eb461c857625dac695dff0', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-07 14:55:48');
INSERT INTO `sys_log` VALUES ('7c69dc875e0e4d179aa092ca9acbbe6e', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 12:18:36');
INSERT INTO `sys_log` VALUES ('7dda6ba9926b405d9c38ef20e261f423', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:32');
INSERT INTO `sys_log` VALUES ('7f4bd9625f5c464cabfedfcdc2865db0', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:29:39');
INSERT INTO `sys_log` VALUES ('80aefe50607c4b28a31c1b90e30b2bbf', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&projectId=6860df07dd1445228ff21d53eb18be65&containerName=测试专用', NULL, '2018-07-10 08:44:59');
INSERT INTO `sys_log` VALUES ('8173f98473a34c3797a3645aee42e8a8', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 14:10:05');
INSERT INTO `sys_log` VALUES ('81dfeb21332342eaa6f48a95501fd46a', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=AERGG&description=AFGG', NULL, '2018-07-14 15:10:21');
INSERT INTO `sys_log` VALUES ('8246f1496212478899d283c65ab7134a', NULL, 25, '上传镜像到DockerHub', NULL, NULL, NULL, NULL, '', NULL, '2018-07-13 17:02:23');
INSERT INTO `sys_log` VALUES ('8384e9890f3f4973ace61e454b5d039d', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', NULL, '2018-07-11 16:19:04');
INSERT INTO `sys_log` VALUES ('83eda9b8ea894ef58be9b9b72b012242', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', NULL, '2018-07-10 17:02:30');
INSERT INTO `sys_log` VALUES ('8476613fe42143fcb808a738d7d79d14', NULL, 90, '删除服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 09:55:47');
INSERT INTO `sys_log` VALUES ('859147fb4e854d03934e72ed53c630d0', 'agfag13131', 60, '创建公共网络', '/network/public/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=create_test&driver=overlay', NULL, '2018-07-14 19:27:12');
INSERT INTO `sys_log` VALUES ('85b83c407069406f98af85b23175d86c', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=ooooooooooooooooo&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 14:10:19');
INSERT INTO `sys_log` VALUES ('8a5cc682a94942579a2ba0f03fab7112', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 11:20:12');
INSERT INTO `sys_log` VALUES ('8a6a85f6463b47319e6ff1b4e90c9162', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,4151361367131', NULL, '2018-07-11 12:31:06');
INSERT INTO `sys_log` VALUES ('8a7a8eda1f444b6493ad8b7c119aa4a0', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 14:27:33');
INSERT INTO `sys_log` VALUES ('8bcd4ba3eac9438392d7aa940b4090eb', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:17:15');
INSERT INTO `sys_log` VALUES ('8c569629e2d5479aa4fd79d26263df68', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=大概&description=非', NULL, '2018-07-14 15:10:10');
INSERT INTO `sys_log` VALUES ('8c571507383345f0ae594aea944d0573', 'f4f4bb152cf54fec94eb0d2b22d25f71', 26, '导入镜像', '/image/import', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36', 'name=my-busybox', NULL, '2018-07-12 14:21:50');
INSERT INTO `sys_log` VALUES ('8c8b3a376566483bae405863565003b8', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=测试nginx容器&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:20:58');
INSERT INTO `sys_log` VALUES ('8d17dd65650148aca0df775ec82ce678', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, 'imageName=', 'Timeout: POST http://192.168.100.30:2375/images/create?fromImage=mysql&tag=latest', '2018-07-15 15:28:13');
INSERT INTO `sys_log` VALUES ('8ec07b9ef56e4fe8a0800643a8c2f761', '34567189513412', 10, '创建项目', '/project/create', 'POST', '192.168.100.133', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36', 'name=xxxx&description=sdsdsd', NULL, '2018-07-15 14:27:42');
INSERT INTO `sys_log` VALUES ('8efc3156c26548098a0d9dd3d72b5ee1', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '127.0.0.1', 'PostmanRuntime/7.1.1', '', NULL, '2018-07-07 15:31:51');
INSERT INTO `sys_log` VALUES ('8f6bd888374b4bb19ba0fe48276d1473', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'Apache-HttpClient/4.5.2 (Java/1.8.0_152-release)', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=xxxx&projectId=6860df07dd1445228ff21d53eb18be65&portMap={\"80\":61120,\"654\":41565}', NULL, '2018-07-07 17:40:14');
INSERT INTO `sys_log` VALUES ('8f87fd40394f4a4e8e834ad58b8061ec', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', '读取容器状态异常', '2018-07-13 15:03:12');
INSERT INTO `sys_log` VALUES ('90ef3c5625ae4f1a93a1055b72205932', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 11:23:46');
INSERT INTO `sys_log` VALUES ('9101b1828b4e4c58ab43806f82459991', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 09:49:31');
INSERT INTO `sys_log` VALUES ('9214f134360348c88102dfb411811753', 'f4f4bb152cf54fec94eb0d2b22d25f71', 25, '上传镜像到DockerHub', '/image/push', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=fe597270fe0b4ab581427edef523fe24&username=jitwxs&password=', NULL, '2018-07-13 16:48:21');
INSERT INTO `sys_log` VALUES ('93da024a99bf41fa981ed2b0c2d189ff', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', 'Request error: POST http://192.168.100.30:2375/containers/create: 400, body: {\"message\":\"invalid volume spec \\\"\\\": invalid volume specification: \'\'\"}\n', '2018-07-16 09:42:10');
INSERT INTO `sys_log` VALUES ('9788e564ecff4d67856d08fe1f3df521', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 10:07:30');
INSERT INTO `sys_log` VALUES ('980e3b6617284766abf1d3f6021fa7b9', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 14:19:48');
INSERT INTO `sys_log` VALUES ('991215b402e54fbb9e3c69a72d69750b', 'afafaf24131', 24, '从DockerHub拉取镜像', '/image/list/hub', 'GET', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=centos', NULL, '2018-07-15 17:30:14');
INSERT INTO `sys_log` VALUES ('991e1f36844c400ea978fc3becc5698a', 'afafaf24131', 91, '创建服务', '/project/self/list', 'GET', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'current=1&size=10', NULL, '2018-07-16 11:23:30');
INSERT INTO `sys_log` VALUES ('9bf1409a1a43406aa043bb099de934ae', 'afaba31231451', 50, '清理数据卷', '/volumes/clean/2', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-16 14:42:31');
INSERT INTO `sys_log` VALUES ('9c158c81fe964c3aa6418b0a4c943976', '213yuyjgdqweyyj', 60, '创建公共网络', '/network/self/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=jit-wxs&driver=overlay', 'Request error: POST http://192.168.100.42:2375/networks/create: 400, body: {\"message\":\"rpc error: code = InvalidArgument desc = name must be valid as a DNS name component\"}\n', '2018-07-14 19:38:13');
INSERT INTO `sys_log` VALUES ('9e03c22ace1049909dcfa4177133b74f', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313', NULL, '2018-07-11 16:16:51');
INSERT INTO `sys_log` VALUES ('9e41a17dadb646f1bd53ce0386b751b2', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:06:39');
INSERT INTO `sys_log` VALUES ('a14a7748ea934fc4a5ca9f94ed617fb3', NULL, 21, '删除容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-13 18:51:40');
INSERT INTO `sys_log` VALUES ('a22fdf37fe7e48d5bfb13c31081ed991', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:21:30');
INSERT INTO `sys_log` VALUES ('a267c014ed8c4c3babd51cd00705eaaf', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 14:01:45');
INSERT INTO `sys_log` VALUES ('a3c23025f40d44e39245334549d5ae2f', NULL, 26, '导入镜像', NULL, NULL, NULL, NULL, 'name=', NULL, '2018-07-13 17:28:10');
INSERT INTO `sys_log` VALUES ('a509d058c0194460a85795ceed7f1d09', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:24:28');
INSERT INTO `sys_log` VALUES ('a63606be4f3b4fd29ea0d98a40ed89ae', '1231451941131', 22, '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-07 14:04:11');
INSERT INTO `sys_log` VALUES ('a6ffa1953b734cf5bec493acb9fd4186', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=哇咔咔的2号容器&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:09:07');
INSERT INTO `sys_log` VALUES ('a88712efacff41eb9136e0f526a7386d', NULL, 25, '上传镜像到DockerHub', NULL, NULL, NULL, NULL, '', NULL, '2018-07-13 16:55:58');
INSERT INTO `sys_log` VALUES ('a94cc9f0f4ac42198439d5d703326964', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 11:06:13');
INSERT INTO `sys_log` VALUES ('a98b0a914be54a2d8bb48825a90892f5', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:26');
INSERT INTO `sys_log` VALUES ('ae63d7fe78ac48e88590924dbe03e7b0', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 14:09:27');
INSERT INTO `sys_log` VALUES ('b0d6fe58383a49e09a132ae79b4eef8b', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:26');
INSERT INTO `sys_log` VALUES ('b135a72bc33642f193fe7a04288161ad', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 16:28:59');
INSERT INTO `sys_log` VALUES ('b197ca4031c645b38fac177cbef83ac6', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313', NULL, '2018-07-10 17:01:48');
INSERT INTO `sys_log` VALUES ('b24a3fcae6264329a2e64f1c9588b39e', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', NULL, '2018-07-13 15:08:37');
INSERT INTO `sys_log` VALUES ('b3a6451b215f4cf58f4c03e89f6eac26', 'afaba31231451', 50, '清理数据卷', '/volumes/clean/1', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-16 14:16:33');
INSERT INTO `sys_log` VALUES ('b48c8598f19c4535bc5b88ae36a5c405', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 10:28:27');
INSERT INTO `sys_log` VALUES ('b4fd06d86db64251bcb731c427407131', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 10:49:46');
INSERT INTO `sys_log` VALUES ('b68da7c4924b4cdfb537460bea22e5e7', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:37');
INSERT INTO `sys_log` VALUES ('b8d63a33dde64cd3925a86332231c937', 'afaba31231451', 50, '清理数据卷', '/volumes/clean/1', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-16 14:20:24');
INSERT INTO `sys_log` VALUES ('b9ebfa24febe4cec93370b7f97da67c0', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=yu&description=hu8uj8', NULL, '2018-07-14 10:30:09');
INSERT INTO `sys_log` VALUES ('bc1975179e9641c38c5f466872c98cee', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 10:32:13');
INSERT INTO `sys_log` VALUES ('bc6e61778e78443a87b80c8463ab39e2', 'afaba31231451', 50, '清理数据卷', '/volumes/clean', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', NULL, '2018-07-16 13:38:46');
INSERT INTO `sys_log` VALUES ('bccd4d50b8ce4cba90b1ec0f6c7400a0', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&projectId=6860df07dd1445228ff21d53eb18be65&containerName=阿发发发', NULL, '2018-07-10 08:42:07');
INSERT INTO `sys_log` VALUES ('c0cd9f1b1e6349ecab27b3e9a0c3862d', 'agfag13131', 60, '创建公共网络', '/network/public/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=123&driver=host', 'Request error: POST http://192.168.100.30:2375/networks/create: 403, body: {\"message\":\"only one instance of \\\"host\\\" network is allowed\"}\n', '2018-07-14 17:53:26');
INSERT INTO `sys_log` VALUES ('c24d0d9270cc41b29472010ee6504b4c', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-13 17:06:01');
INSERT INTO `sys_log` VALUES ('c261721037704776948793e6149025be', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, 'imageName=', NULL, '2018-07-15 15:22:39');
INSERT INTO `sys_log` VALUES ('c36f956705894753a2c6079c713c5a2e', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=阿芳&description=发热该如何', NULL, '2018-07-14 10:33:07');
INSERT INTO `sys_log` VALUES ('c37f6ef48cd24307930117912f016193', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:16');
INSERT INTO `sys_log` VALUES ('c5543a9d57b44abfb9590e08c5654ade', NULL, 90, '删除服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 09:53:50');
INSERT INTO `sys_log` VALUES ('c73443b43dbc418fa4bf854c6540d876', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,4151361367131,4151361367131,f4f4bb152cf54fec94eb0d2b22d25f71,f4f...', NULL, '2018-07-11 16:21:38');
INSERT INTO `sys_log` VALUES ('c8e0a0fd1c434e5a815a8b9fed764cce', NULL, 40, '上传镜像到Hub', NULL, NULL, NULL, NULL, '', NULL, '2018-07-13 20:05:58');
INSERT INTO `sys_log` VALUES ('caacda0c1c20449db692bffd8c3f3a9a', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:01:54');
INSERT INTO `sys_log` VALUES ('cb03c288727d47a3bde5b9a992160ae4', 'agfag13131', 60, '创建公共网络', '/network/public/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=123&driver=overlay', 'Request error: POST http://192.168.100.30:2375/networks/create: 500, body: {\"message\":\"This node is not a swarm manager. Use \\\"docker swarm init\\\" or \\\"docker swarm join\\\" to connect this node to swarm and try again.\"}\n', '2018-07-14 18:04:21');
INSERT INTO `sys_log` VALUES ('cb19c5c1b88e4f4ca0d0d97b1093dcc7', 'afafaf24131', 91, '创建服务', '/project/self/list', 'GET', '192.168.100.133', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36', 'current=2&size=10', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 10:35:18');
INSERT INTO `sys_log` VALUES ('cb1d01304d31472b8ae292d1f2e2756d', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 14:42:17');
INSERT INTO `sys_log` VALUES ('cb79a6b8df1e4a898019e540f6c1491f', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f7...', NULL, '2018-07-11 15:58:54');
INSERT INTO `sys_log` VALUES ('ccd44e4ec4564c07b5167cada9037e85', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313', NULL, '2018-07-11 16:17:03');
INSERT INTO `sys_log` VALUES ('cd206ee5e2bd45bbb904d08524398986', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 11:16:50');
INSERT INTO `sys_log` VALUES ('ce573556ac0c4100ad4057c1ab7161d1', '213yuyjgdqweyyj', 63, '创建个人网络失败', '/network/self/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=hello/world&driver=overlay', 'Request error: POST http://192.168.100.42:2375/networks/create: 400, body: {\"message\":\"rpc error: code = InvalidArgument desc = name must be valid as a DNS name component\"}\n', '2018-07-14 19:44:28');
INSERT INTO `sys_log` VALUES ('d19fe7e91c604787b2eb2ada0f0ee7e8', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', '读取容器状态异常', '2018-07-13 14:58:41');
INSERT INTO `sys_log` VALUES ('d4252a83ae8d414992130b48edf95597', '1231451941131', 61, '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131', NULL, '2018-07-11 16:16:32');
INSERT INTO `sys_log` VALUES ('d5f604eb733d4e888925cb074c0dc872', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, 'imageId=&projectId=&type=&containerName=', NULL, '2018-07-16 10:07:14');
INSERT INTO `sys_log` VALUES ('d76d85b084384ac19340ca45c0f05988', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=sunyian&description=ssss', NULL, '2018-07-16 10:27:44');
INSERT INTO `sys_log` VALUES ('d78d4d16db6d4db18117e1b5ac0611da', NULL, 21, '删除容器', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 08:43:59');
INSERT INTO `sys_log` VALUES ('d9973e186c5e463096d28a1a542ed2c1', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:00:48');
INSERT INTO `sys_log` VALUES ('d9f1c5a977b1405699b5ee5275d84809', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=5预计可露露&description=仍泰和家园羊肉汤', NULL, '2018-07-14 11:34:18');
INSERT INTO `sys_log` VALUES ('dc990a7e70eb4b93a659b52413dc68ab', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 15:05:59');
INSERT INTO `sys_log` VALUES ('dd3d9b09cad649a298750db67b5883ad', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.133', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36', 'name=sdfav&description=eafwegeff', NULL, '2018-07-14 18:08:20');
INSERT INTO `sys_log` VALUES ('df51545000c541a98274c08ee02f79eb', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 15:20:31');
INSERT INTO `sys_log` VALUES ('e51f2c92266445d7944faa3105d40897', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:20');
INSERT INTO `sys_log` VALUES ('e8ac932da6b841f2bf5df51e35048ab4', 'afafaf24131', 10, '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=EFSFG&description=DSFGGG', NULL, '2018-07-14 15:10:14');
INSERT INTO `sys_log` VALUES ('eafd1798c95a43f59fc1691e690941d9', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:17:18');
INSERT INTO `sys_log` VALUES ('ecae57a3732e4287bc17b2300b9bd9c8', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', NULL, '2018-07-10 17:04:02');
INSERT INTO `sys_log` VALUES ('ef421918d17e45babab7cc0a8e2a8750', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=fe597270fe0b4ab581427edef523fe24&containerName=my-HelloWorld&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-12 14:12:52');
INSERT INTO `sys_log` VALUES ('f1a6a46dc80740c38593d5d3a540abce', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', 'Request error: POST http://192.168.100.30:2375/containers/create: 400, body: {\"message\":\"invalid volume spec \\\"ff\\\": invalid volume specification: \'ff\': invalid mount config for type \\\"volume\\\": invalid mount path: \'ff\' mount path must be absolute\"}\n', '2018-07-16 09:44:53');
INSERT INTO `sys_log` VALUES ('f6cacd4568584b9c9a660a5faf48344e', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 14:33:37');
INSERT INTO `sys_log` VALUES ('fa5352e65bb4417ab97992731d16fb58', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, 'imageName=', 'Timeout: POST http://192.168.100.30:2375/images/create?fromImage=mysql&tag=latest', '2018-07-15 15:24:47');
INSERT INTO `sys_log` VALUES ('fab35c0bbf724489a41a1db5462012e4', '1231451941131', 60, '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', NULL, '2018-07-11 16:07:06');
INSERT INTO `sys_log` VALUES ('fabefd3f1c5a47d5a89c1585d05b0fb2', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=bbbbb&projectId=6860df07dd1445228ff21d53eb18be65', NULL, '2018-07-07 11:35:26');
INSERT INTO `sys_log` VALUES ('fb1879c855b3493ab432af093745a9f1', NULL, 24, '从DockerHub拉取镜像', NULL, NULL, NULL, NULL, '', NULL, '2018-07-15 17:25:23');
INSERT INTO `sys_log` VALUES ('fba6c937d00c4bb3a1e3b77004a4f2ec', NULL, 91, '创建服务', NULL, NULL, NULL, NULL, '', NULL, '2018-07-16 15:05:59');
INSERT INTO `sys_log` VALUES ('fd14cc9435d445dda556a25fb064e7e5', NULL, 20, '创建容器', NULL, NULL, NULL, NULL, '', 'Request error: POST http://192.168.100.30:2375/containers/create: 400, body: {\"message\":\"invalid volume spec \\\"\\\": invalid volume specification: \'\'\"}\n', '2018-07-16 09:45:57');

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
INSERT INTO `sys_login` VALUES ('1249181023313', 'user', '$2a$10$tj2Ehs75tdIil2SHoaBb6u54wKUgQwjenO3RuaWXBEOsQZ8bupe3q', 'jitwxs@foxmail.com', 0, 2, '2018-06-29 17:01:43', '2018-07-11 16:19:04');
INSERT INTO `sys_login` VALUES ('213yuyjgdqweyyj', 'wxs', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', NULL, 0, 1, '2018-07-14 17:07:35', NULL);
INSERT INTO `sys_login` VALUES ('34567189513412', 'zy', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', NULL, 0, 1, '2018-07-15 13:57:00', NULL);
INSERT INTO `sys_login` VALUES ('4151361367131', '18083764688', '123456', '827622690@qq.com', 0, 1, '2018-06-30 09:43:29', '2018-07-11 16:19:04');
INSERT INTO `sys_login` VALUES ('afaba31231451', 'wxsa', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', NULL, 0, 2, '2018-07-15 15:35:49', NULL);
INSERT INTO `sys_login` VALUES ('afafaf24131', 'lc', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', NULL, 0, 1, '2018-07-14 09:21:16', NULL);
INSERT INTO `sys_login` VALUES ('agfag13131', 'sss', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', NULL, 0, 2, '2018-07-14 10:10:57', NULL);
INSERT INTO `sys_login` VALUES ('f4f4bb152cf54fec94eb0d2b22d25f71', 'sya', '$2a$10$3zdHQxZ3WkN8efEwdFZyNuVKpu14SQ3077Y2rD7HyAJpelObSpNum', '973383318@qq.com', 0, 1, '2018-06-30 11:09:18', '2018-07-11 16:21:38');

-- ----------------------------
-- Table structure for sys_network
-- ----------------------------
DROP TABLE IF EXISTS `sys_network`;
CREATE TABLE `sys_network`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网络ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网络名',
  `scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网络范围',
  `driver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网络驱动',
  `has_internal` tinyint(1) NULL DEFAULT NULL COMMENT '是否是内部网络',
  `has_ipv6` tinyint(1) NULL DEFAULT NULL COMMENT '是否开启ipv6',
  `labels` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `has_public` tinyint(1) NULL DEFAULT NULL COMMENT '是否是公开网络',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '如果不是公开网络，所属用户',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统网络表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_network
-- ----------------------------
INSERT INTO `sys_network` VALUES ('642c9197063a42e6151d49f05ce45c8585665b03ee4c3ec22eb5a38a30b9137f', 'bridge', 'local', 'bridge', 0, 0, '{}', 1, NULL, '2018-07-15 15:21:42', NULL);
INSERT INTO `sys_network` VALUES ('ae736f9a7b14dfcc8fe97bd2f57858078ec827d978eb5569863184b1a5ddcf9e', 'none', 'local', 'null', 0, 0, '{}', 1, NULL, '2018-07-15 15:21:42', NULL);
INSERT INTO `sys_network` VALUES ('c673ed7afb1c737cfc5496b73a2be9caa86a1c5a88628b6c734f8ff11a61a97b', 'host', 'local', 'host', 0, 0, '{}', 1, NULL, '2018-07-15 15:21:42', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统服务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_program
-- ----------------------------
INSERT INTO `sys_program` VALUES (1, '后端项目', 'PaaS系统后台服务', '192.168.100.142', '9999', '2018-07-12 16:02:25', NULL);
INSERT INTO `sys_program` VALUES (2, 'Nginx服务', NULL, '192.168.100.142', '8888', '2018-07-12 16:02:55', NULL);
INSERT INTO `sys_program` VALUES (3, 'MySQL', '数据库服务', '192.168.100.142', '3306', '2018-07-12 16:03:16', NULL);
INSERT INTO `sys_program` VALUES (4, 'Docker Container', '容器服务', '192.168.100.30', '2375', '2018-07-12 16:23:37', '2018-07-12 16:45:13');
INSERT INTO `sys_program` VALUES (6, 'Docker Registry', 'Docker本地Hub服务', '192.168.100.94', '5000', '2018-07-12 16:48:43', NULL);
INSERT INTO `sys_program` VALUES (7, 'Docker Manager', 'Docker Swarm Manager', '192.168.100.42', '2375', '2018-07-12 16:49:14', NULL);
INSERT INTO `sys_program` VALUES (16, 'qqgq', 'bbbb', '1.1.1.1', '2552', '2018-07-16 09:43:03', NULL);

-- ----------------------------
-- Table structure for sys_volume
-- ----------------------------
DROP TABLE IF EXISTS `sys_volume`;
CREATE TABLE `sys_volume`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `obj_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容器ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂载名称',
  `destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '容器内目录',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挂载目录',
  `type` int(10) NULL DEFAULT NULL COMMENT '类型',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_volume
-- ----------------------------
INSERT INTO `sys_volume` VALUES ('486186ce65fe4ad4a80bb65c815f86de', 'kdy3aygudnqysyrla0w3amgj6', '7a988ab3fb2087aecf2cc88e58b112a48d035fd8a30d738c19191b5ff47edc99', '/qq/bb', '/var/lib/docker/volumes/7a988ab3fb2087aecf2cc88e58b112a48d035fd8a30d738c19191b5ff47edc99/_data', 2, '2018-07-16 14:42:17', '2018-07-16 14:42:17');
INSERT INTO `sys_volume` VALUES ('63d3ab662c9b4a2dace29a53fd0f93b9', 'kdy3aygudnqysyrla0w3amgj6', '4e9a6abb5040f7a7b38a1e9d2081a57fc575ddf7eafb9d52510870d4033fbd90', '/tt/xxx', '/var/lib/docker/volumes/4e9a6abb5040f7a7b38a1e9d2081a57fc575ddf7eafb9d52510870d4033fbd90/_data', 2, '2018-07-16 14:42:17', '2018-07-16 14:42:17');
INSERT INTO `sys_volume` VALUES ('82ab54dd02db47d7bd72353fb07e2c24', '28b89f5b8dd6d08d28b71224de66cd09898cbace2eb2da8c691827d503908cd6', '8fa996e86febf0762422221e48d78f9c365ff3e77b8f51be347a7bad5ce6ceda', '/mhy', '/var/lib/docker/volumes/8fa996e86febf0762422221e48d78f9c365ff3e77b8f51be347a7bad5ce6ceda/_data', 1, '2018-07-16 14:19:48', NULL);

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
INSERT INTO `user_container` VALUES ('1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '33398ea14de14d979a495a3a53051b1a', 'websocket', NULL, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"15889\"}]}', 'nginx:latest', 0, '2018-07-16 11:16:49', '2018-07-16 11:41:29', NULL);
INSERT INTO `user_container` VALUES ('1271e2679a630c1b55f21e0b687db0034211757ade1e4c3483a2e6795e8a9bf8', '33398ea14de14d979a495a3a53051b1a', 'cccc', NULL, '{}', 'hello-world:latest', 0, '2018-07-16 14:29:57', NULL, NULL);
INSERT INTO `user_container` VALUES ('28b89f5b8dd6d08d28b71224de66cd09898cbace2eb2da8c691827d503908cd6', '33398ea14de14d979a495a3a53051b1a', 'wxstest', NULL, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"15668\"}]}', 'nginx:latest', 0, '2018-07-16 14:19:48', NULL, NULL);
INSERT INTO `user_container` VALUES ('532af6aece322329ab4f5011c0614655548d46496ff4fdbf8d7a00fa0f1245fc', '33398ea14de14d979a495a3a53051b1a', 'ew', NULL, '{}', 'hello-world:latest', 0, '2018-07-16 14:28:34', NULL, NULL);
INSERT INTO `user_container` VALUES ('57df8a016dad429a80e432dc5c11eb493ffa8e918678692352b7d509d41d759f', '33398ea14de14d979a495a3a53051b1a', 'sffff', NULL, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"15875\"}]}', 'nginx:latest', 0, '2018-07-16 11:23:46', NULL, NULL);
INSERT INTO `user_container` VALUES ('74e75e51e2961dbbd57833fb36f9888fa3046842e9068f66339f3171124833f4', '33398ea14de14d979a495a3a53051b1a', 'dsf', NULL, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"15001\"}]}', 'nginx:latest', 0, '2018-07-16 11:26:12', NULL, NULL);
INSERT INTO `user_container` VALUES ('80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', '33398ea14de14d979a495a3a53051b1a', 'testqqq', '[agfvsg]', '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"15999\"}]}', 'nginx:latest', 0, '2018-07-16 09:49:31', NULL, '[sffd]');
INSERT INTO `user_container` VALUES ('d47a357cb627d210d97d0517eb3d8b707f0b60f8cc38f99a17d44a0e1970d08a', '33398ea14de14d979a495a3a53051b1a', 'test-hello', NULL, '{}', 'hello-world:latest', 0, '2018-07-16 10:07:14', '2018-07-16 10:26:19', NULL);
INSERT INTO `user_container` VALUES ('e95f354eff971e2727150229174e7dcc46cb439c1715c6dbccb3524a1956e2cc', 'f45a65eae10842b68cebeb86b10940cb', 'test', NULL, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"15999\"}]}', 'nginx:latest', 1, '2018-07-16 10:28:27', '2018-07-16 10:28:38', NULL);

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
INSERT INTO `user_project` VALUES ('33398ea14de14d979a495a3a53051b1a', 'afafaf24131', '昂热润滑油', '昂如虎添翼', '2018-07-14 15:09:50', '2018-07-14 16:51:59');
INSERT INTO `user_project` VALUES ('51553ff30e644ae78926e22392bf7a98', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'JavaWeb01', '第一个JavaWeb环境', '2018-07-05 11:02:27', NULL);
INSERT INTO `user_project` VALUES ('58d227494a6c4625aa5d15495ae17156', 'afafaf24131', 'GR', 'AFG', '2018-07-14 15:10:17', NULL);
INSERT INTO `user_project` VALUES ('642332c7c45f48e38626f8360df410ee', '213yuyjgdqweyyj', 'xxxx', 'sdsdsd', '2018-07-15 14:27:42', NULL);
INSERT INTO `user_project` VALUES ('6860df07dd1445228ff21d53eb18be65', 'f4f4bb152cf54fec94eb0d2b22d25f71', '哇咔咔', '哇咔咔哇咔咔', '2018-07-01 15:08:47', '2018-07-07 10:55:19');
INSERT INTO `user_project` VALUES ('6b3f4099393e44ada3fc2c3d68f089e5', 'afafaf24131', '挂号', '双方共同', '2018-07-14 15:10:04', NULL);
INSERT INTO `user_project` VALUES ('738f28a08c0146acb09e75c8ee146adb', 'afafaf24131', 'yu', 'hu8uj8', '2018-07-14 10:30:09', NULL);
INSERT INTO `user_project` VALUES ('7570bbe140c34a328e6d5c08a66675cc', 'afafaf24131', 'feawafqef', 'avwfvv', '2018-07-14 14:02:49', NULL);
INSERT INTO `user_project` VALUES ('758a7c9dcebd4e41b2de118356695dba', 'afafaf24131', '5预计可露露', '我和谁摄入付款深V', '2018-07-14 14:41:37', '2018-07-14 14:47:35');
INSERT INTO `user_project` VALUES ('913f0b0ab57141e0aa1f90baac7c8d60', 'afafaf24131', 'AERGG', 'AFGG', '2018-07-14 15:10:21', NULL);
INSERT INTO `user_project` VALUES ('9b84a6acd0f24e07ac5695a56986eaa7', 'afafaf24131', 'sdfav', 'eafwegeff', '2018-07-14 18:08:20', NULL);
INSERT INTO `user_project` VALUES ('9f7bb35e1eea4ccab7e0df916cb961fe', 'afafaf24131', '二个人体会局认可', '热乎若拖亏咯偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶', '2018-07-14 15:09:58', NULL);
INSERT INTO `user_project` VALUES ('a5744e8f469746cea01e03010f3ddfe9', 'afafaf24131', '5预计可露露', '仍泰和家园羊肉汤', '2018-07-14 11:34:18', NULL);
INSERT INTO `user_project` VALUES ('aabakfsvakiuw1213', 'f4f4bb152cf54fec94eb0d2b22d25f71', '项目1', '项目1的描述', '2018-06-30 10:14:07', NULL);
INSERT INTO `user_project` VALUES ('ablaiawru1321', '4151361367131', '测试项目1', '测试项目1的描述', '2018-06-30 10:14:43', NULL);
INSERT INTO `user_project` VALUES ('ae73ea0aa5c64b10971a161f385bde4c', 'afafaf24131', '大概', '非', '2018-07-14 15:10:10', NULL);
INSERT INTO `user_project` VALUES ('afaowrwfvxz4e1', '4151361367131', '测试项目2', '测试项目2的描述', '2018-06-30 10:14:57', NULL);
INSERT INTO `user_project` VALUES ('bkjaqalfa231fa', '1231451941131', '项目2', '项目2dddd', '2018-06-30 10:14:16', '2018-07-12 15:43:01');
INSERT INTO `user_project` VALUES ('d599aa5b00994a429d5039c21cf0f559', 'afafaf24131', 'EFSFG', 'DSFGGG', '2018-07-14 15:10:14', NULL);
INSERT INTO `user_project` VALUES ('e64c5069df7a42789d8fde36e8a8b990', 'afafaf24131', '阿芳', 'asgferhgojjhpkytkujkm', '2018-07-14 14:40:15', NULL);
INSERT INTO `user_project` VALUES ('eefe3167399c45d687b6709851ecf3b8', 'afafaf24131', '阿芳', '发热该如何', '2018-07-14 10:33:07', NULL);
INSERT INTO `user_project` VALUES ('f45a65eae10842b68cebeb86b10940cb', 'afafaf24131', 'sunyian', 'ssss', '2018-07-16 10:27:44', NULL);

-- ----------------------------
-- Table structure for user_service
-- ----------------------------
DROP TABLE IF EXISTS `user_service`;
CREATE TABLE `user_service`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `project_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务名',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `replicas` int(10) NULL DEFAULT NULL COMMENT '横向扩展数量',
  `command` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '执行命令',
  `port` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '端口',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用镜像',
  `env` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '环境变量',
  `create_date` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户服务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_service
-- ----------------------------
INSERT INTO `user_service` VALUES ('04b3rsh8e78i1ghuf2sl246x9', '642332c7c45f48e38626f8360df410ee', 'wxsService', '213yuyjgdqweyyj', 1, NULL, '{}', 'hello-world:latest', NULL, '2018-07-16 11:34:01', NULL);
INSERT INTO `user_service` VALUES ('04ocokp5kng7vsl5bzb6rzzo5', '642332c7c45f48e38626f8360df410ee', 'jitwxsS1', '213yuyjgdqweyyj', 1, NULL, '{}', 'hello-world:latest', NULL, '2018-07-16 14:33:37', NULL);
INSERT INTO `user_service` VALUES ('0cd7tari7e6pv38vwcb1aei22', '33398ea14de14d979a495a3a53051b1a', 'serviceLCsss', 'afafaf24131', 2, NULL, '{\"80\":15667}', 'nginx:latest', NULL, '2018-07-16 15:05:59', NULL);
INSERT INTO `user_service` VALUES ('9h7oy6ey1f49d916u3wse4u26', '51553ff30e644ae78926e22392bf7a98', 'myNginx3', 'f4f4bb152cf54fec94eb0d2b22d25f71', 1, NULL, '{\"80\":34444}', 'nginx:latest', NULL, '2018-07-15 14:30:00', '2018-07-16 10:27:41');
INSERT INTO `user_service` VALUES ('csjgwrye18ixze9kgrjus3lot', '33398ea14de14d979a495a3a53051b1a', 'sfegss', 'afafaf24131', 1, NULL, '{}', 'hello-world:latest', NULL, '2018-07-16 15:20:31', NULL);
INSERT INTO `user_service` VALUES ('fa096rzvp3658llejj8q3v2rx', '642332c7c45f48e38626f8360df410ee', 'wxsService1', '213yuyjgdqweyyj', 1, NULL, '{}', 'hello-world:latest', NULL, '2018-07-16 11:23:30', NULL);
INSERT INTO `user_service` VALUES ('ia48vlpaz8aib1zhxuzygstja', '33398ea14de14d979a495a3a53051b1a', 'serviceLC', 'afafaf24131', 1, NULL, '{\"80\":15666}', 'nginx:latest', NULL, '2018-07-16 15:04:40', NULL);
INSERT INTO `user_service` VALUES ('kdy3aygudnqysyrla0w3amgj6', '642332c7c45f48e38626f8360df410ee', 'jitwxsS2', '213yuyjgdqweyyj', 1, NULL, '{}', 'hello-world:latest', NULL, '2018-07-16 14:42:17', NULL);
INSERT INTO `user_service` VALUES ('q53qoxqh9jio8od0pjrl0ptsy', '642332c7c45f48e38626f8360df410ee', 'wxsService2', '213yuyjgdqweyyj', 1, NULL, '{}', 'hello-world:latest', NULL, '2018-07-16 11:31:21', NULL);
INSERT INTO `user_service` VALUES ('tkh3mdw9tcdkhojh49wcec3i2', '33398ea14de14d979a495a3a53051b1a', 'testlccccc', 'afafaf24131', 1, NULL, '{}', 'hello-world:latest', NULL, '2018-07-16 15:13:30', NULL);

SET FOREIGN_KEY_CHECKS = 1;
