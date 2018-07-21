/*
Navicat MySQL Data Transfer

Source Server         : wxs
Source Server Version : 50719
Source Host           : www.jitwxs.cn:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-07-21 19:21:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `container_network`
-- ----------------------------
DROP TABLE IF EXISTS `container_network`;
CREATE TABLE `container_network` (
  `id` varchar(255) NOT NULL,
  `container_id` varchar(255) DEFAULT NULL,
  `network_id` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of container_network
-- ----------------------------
INSERT INTO `container_network` VALUES ('2433cae2415d4fe499bd19a5af13170c', 'd2b7f9632ed02a5037a19a99db9a4e8411da66d70c8f0ef849d0567b3294173e', 'a1502826e75b8c0e8f6d27c2a9737c2f4d7f4f36b8398f1ee9bc08e6a7d43dc1', '2018-07-21 19:18:11');
INSERT INTO `container_network` VALUES ('41a16e7347b8470aae5466b4d5b84c2f', '11673d9d97d4b3f3901331e47c09dda6b59faaa63e69d8be9e9e5cb9bc345d41', 'a1502826e75b8c0e8f6d27c2a9737c2f4d7f4f36b8398f1ee9bc08e6a7d43dc1', '2018-07-21 19:18:14');
INSERT INTO `container_network` VALUES ('88a71c562ed2448487b39f17176e52de', '744df219da7231cacb0b612aeef0b07172bc30b54313a973c047355a913ca1e4', 'a1502826e75b8c0e8f6d27c2a9737c2f4d7f4f36b8398f1ee9bc08e6a7d43dc1', '2018-07-21 19:18:29');

-- ----------------------------
-- Table structure for `project_log`
-- ----------------------------
DROP TABLE IF EXISTS `project_log`;
CREATE TABLE `project_log` (
  `id` varchar(255) NOT NULL,
  `project_id` varchar(255) DEFAULT NULL,
  `obj_id` varchar(255) DEFAULT NULL,
  `type` int(10) DEFAULT NULL COMMENT '日志类型',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目日志表';

-- ----------------------------
-- Records of project_log
-- ----------------------------
INSERT INTO `project_log` VALUES ('007279443f834f6487167ee5b5010fd9', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '28', '停止容器', '2018-07-20 15:36:45');
INSERT INTO `project_log` VALUES ('026ab906f36b49e4aab97a4c6adbffde', null, '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '32', '删除容器', '2018-07-20 18:20:29');
INSERT INTO `project_log` VALUES ('048257537039478185e6c0914effe8f5', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:47:37');
INSERT INTO `project_log` VALUES ('049200e33a114b639000166f7cdf03c2', '642332c7c45f48e38626f8360df410ee', null, '10', '创建项目', '2018-07-15 14:27:42');
INSERT INTO `project_log` VALUES ('04f36a2d5204463697657fd9ba87838e', '33398ea14de14d979a495a3a53051b1a', 'a3bf25b22f9a9517288de1b042b86d00665adb02341e15f82d019cf0c3a36783', '20', '创建容器', '2018-07-16 19:44:57');
INSERT INTO `project_log` VALUES ('05526095dd564088ab6e2e7c5d0ac099', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:25:26');
INSERT INTO `project_log` VALUES ('06429543728c44ac8a02dd472a49b42c', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '34', '重启容器', '2018-07-20 15:17:59');
INSERT INTO `project_log` VALUES ('06fe86d103b84ef59f7e5200774be684', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:15:41');
INSERT INTO `project_log` VALUES ('074a5707eb0b4b558f04d50cde471a19', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 17:04:37');
INSERT INTO `project_log` VALUES ('07ef536f7917435588ac87e30b211c1e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 17:04:30');
INSERT INTO `project_log` VALUES ('0813353de95e4af297d974bfc9b7dbff', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '26', '恢复容器', '2018-07-13 15:24:36');
INSERT INTO `project_log` VALUES ('08254e9f05b84513808eb66c4b0cb11b', '6860df07dd1445228ff21d53eb18be65', '5182cdvl9vu7wbjldplb8jn7p', '38', '新建服务', '2018-07-18 20:17:29');
INSERT INTO `project_log` VALUES ('082faa2c028b4de78559c5824331b130', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '24', '暂停容器', '2018-07-18 20:42:57');
INSERT INTO `project_log` VALUES ('083a16be6d444c22a4cd0ca2b6f0badc', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:18:36');
INSERT INTO `project_log` VALUES ('08561eb96b914a17a5a3059f2035b128', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:12:57');
INSERT INTO `project_log` VALUES ('0acbdf5ab0ac44cba6156c0068232283', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '34', '重启容器', '2018-07-13 15:26:32');
INSERT INTO `project_log` VALUES ('0b8bee081c5b4245b442a17a675d6fa7', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-14 09:39:52');
INSERT INTO `project_log` VALUES ('0ca2c616703d4a00a9a3c3d65cdfc42f', 'ae73ea0aa5c64b10971a161f385bde4c', null, '10', '创建项目', '2018-07-14 15:10:10');
INSERT INTO `project_log` VALUES ('0cb3cc5202624b2d9ead7ca50e130af7', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 16:11:04');
INSERT INTO `project_log` VALUES ('0d2e523e1b304f14bb1eda2b041f5360', 'aabakfsvakiuw1213', '744df219da7231cacb0b612aeef0b07172bc30b54313a973c047355a913ca1e4', '20', '创建容器', '2018-07-21 09:50:00');
INSERT INTO `project_log` VALUES ('0e658cb21c7d4d4ab6b932e109ab1f92', 'aabakfsvakiuw1213', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '30', '强制停止容器', '2018-07-20 21:36:48');
INSERT INTO `project_log` VALUES ('0e75025f17f444df9d2e7a67ecdd14a2', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-14 09:44:41');
INSERT INTO `project_log` VALUES ('0e83b08ad8bd4d75a8e6d6eef3511874', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:28:34');
INSERT INTO `project_log` VALUES ('0eb2f6ac6f3c4a7da3aa5da6428745e4', null, '6u44woiu1ce20ixdqrgoymi7h', '36', '删除服务', '2018-07-18 14:57:54');
INSERT INTO `project_log` VALUES ('0eb7fc2ba5a04ac0aa4ea2faa7d82455', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:48:51');
INSERT INTO `project_log` VALUES ('0ee2558390c64c35b7d3c307aea04397', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 17:02:53');
INSERT INTO `project_log` VALUES ('0f31e97a5081460e89f685aa59e5cdcd', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:05:13');
INSERT INTO `project_log` VALUES ('0fa2ab22b2a444f99f144c659a34d88b', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:25:47');
INSERT INTO `project_log` VALUES ('1080aa3614fb491d86ecdeaf1b0c1549', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '20', '创建容器', '2018-07-16 11:16:50');
INSERT INTO `project_log` VALUES ('108319823c25428aa609db5b2759e15c', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 08:59:41');
INSERT INTO `project_log` VALUES ('109cd80046db4bf19fab4723f53d1a71', '33398ea14de14d979a495a3a53051b1a', null, '21', '创建容器失败，原因：Docker异常', '2018-07-16 09:45:57');
INSERT INTO `project_log` VALUES ('10dfc77a9a894aab871d11a7428c8d05', '6860df07dd1445228ff21d53eb18be65', 'fb156539431fdd9c84412775cdf6391a43d6472d63c97b61ad9b03bed03a1db1', '22', '开启容器', '2018-07-20 18:09:37');
INSERT INTO `project_log` VALUES ('110240651d444c17aa593b2e9e8cbb8d', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:16:06');
INSERT INTO `project_log` VALUES ('12f404fac1e24dc4abdd54048a2614c1', 'aabakfsvakiuw1213', 'wf2lyw298vzzuqxdoc3uvt8fv', '38', '新建服务', '2018-07-21 11:09:33');
INSERT INTO `project_log` VALUES ('14084ca484b342f0a70a7a04804f90c9', '6b3f4099393e44ada3fc2c3d68f089e5', 'c377b52674a6bbbfc2669465cc4d3616a531deeb3f01dadaa8d0b3c04c588053', '20', '创建容器', '2018-07-17 14:05:00');
INSERT INTO `project_log` VALUES ('14844b130cce4682a77abc8a13e4a37e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 16:34:43');
INSERT INTO `project_log` VALUES ('14f5257300a34101803d7fd32cc8abf3', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '24', '暂停容器', '2018-07-18 20:11:18');
INSERT INTO `project_log` VALUES ('15320e0dc45e47c780d3fad19dad4488', null, 'tx6tvjzote80f7osukx8mqu27', '36', '删除服务', '2018-07-15 09:55:47');
INSERT INTO `project_log` VALUES ('1739633bbbe945afb7f020f7aefc234b', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 08:59:59');
INSERT INTO `project_log` VALUES ('174167861b7244f88789c5a97b03689e', '9d0d51e5058b426cacff0e8b8d2d4420', null, '10', '创建项目', '2018-07-21 15:55:15');
INSERT INTO `project_log` VALUES ('185160caddcb4fe49236ea48a9aa98c3', '33398ea14de14d979a495a3a53051b1a', null, '21', '创建容器失败，原因：Docker异常', '2018-07-16 09:42:10');
INSERT INTO `project_log` VALUES ('18ab98fc56444c4292e0c6e534fb5ec0', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:17:35');
INSERT INTO `project_log` VALUES ('18af87bef4da41379d58f7b55fac3408', '6860df07dd1445228ff21d53eb18be65', 'zmwxec41kz15os4rjx2k3y60t', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:41:02');
INSERT INTO `project_log` VALUES ('18b0fb0935f746c5a48f0181a22f7b98', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:04:57');
INSERT INTO `project_log` VALUES ('18e7f038a3b24d86bff754e7ead92de8', '58d227494a6c4625aa5d15495ae17156', 'e502f2db26c211d6d5caff5bc264378e5041d774d598bda5f8e768be6340bbd9', '20', '创建容器', '2018-07-21 09:23:04');
INSERT INTO `project_log` VALUES ('1aaffe1a270b4e9092546c29410e0fa7', '33398ea14de14d979a495a3a53051b1a', '2076ac80bbdf65928df846c864c1c443a74dcd926c4bc9cb57aa237693aa4f31', '34', '重启容器', '2018-07-18 09:08:47');
INSERT INTO `project_log` VALUES ('1ab6375bc04d46b8b47932c78a5d8d19', '9d0d51e5058b426cacff0e8b8d2d4420', '28438dc6149b13ebeafdf2b6a883e3bb8f670117d52cb1c606c6654fe8d76760', '20', '创建容器', '2018-07-21 16:03:06');
INSERT INTO `project_log` VALUES ('1b37d6cce9da4eedac53bcb08be6c0ee', '6860df07dd1445228ff21d53eb18be65', 'c4d57be54498e1495a6f86d1b7d1e04895be2491a554125105af494b264552ee', '22', '开启容器', '2018-07-19 19:00:17');
INSERT INTO `project_log` VALUES ('1b650aaecbca412b868da4f092da2ac9', '9f7bb35e1eea4ccab7e0df916cb961fe', null, '10', '创建项目', '2018-07-14 15:09:58');
INSERT INTO `project_log` VALUES ('1c4a750743b247ad8086548b97d49d79', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-15 12:19:31');
INSERT INTO `project_log` VALUES ('1c89b6b1f0054ce095455f91c28d97be', '642332c7c45f48e38626f8360df410ee', '04ocokp5kng7vsl5bzb6rzzo5', '38', '新建服务', '2018-07-16 14:33:37');
INSERT INTO `project_log` VALUES ('1cde9d580cfb4006a21a4e07789762b7', '58d227494a6c4625aa5d15495ae17156', 'f1eb8959a0a8e8f1eb2c5445e4da8ce268fb0c710cef449c0a5d2e9316ed9c0c', '20', '创建容器', '2018-07-21 10:09:11');
INSERT INTO `project_log` VALUES ('1d92b018acde47558153be78fc559b52', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 16:13:55');
INSERT INTO `project_log` VALUES ('1d962a7b08ca4175b485205f68287e3d', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:18:26');
INSERT INTO `project_log` VALUES ('1db1edd4be2c4435ad02b788720d8385', null, 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '32', '删除容器', '2018-07-16 08:42:04');
INSERT INTO `project_log` VALUES ('1ec8a64e71ac4bb8b37469d46e09b95e', '58d227494a6c4625aa5d15495ae17156', '11673d9d97d4b3f3901331e47c09dda6b59faaa63e69d8be9e9e5cb9bc345d41', '22', '开启容器', '2018-07-21 17:22:40');
INSERT INTO `project_log` VALUES ('1ed16dceb70449cbb934531067cf5316', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '28', '停止容器', '2018-07-18 11:10:31');
INSERT INTO `project_log` VALUES ('2064e8fb9542481f8877529f921ee343', '758a7c9dcebd4e41b2de118356695dba', null, '21', '创建容器失败，原因：Docker异常', '2018-07-17 11:28:21');
INSERT INTO `project_log` VALUES ('21655936684e473b80fd0bfbb601a499', '58d227494a6c4625aa5d15495ae17156', '63ec66f93e85246a1e7aa5e18c01ed9de19db9ad453d83836be60de315a3c82e', '20', '创建容器', '2018-07-21 16:36:21');
INSERT INTO `project_log` VALUES ('2192eca4d1d44acebe3574b568fae77e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 16:14:06');
INSERT INTO `project_log` VALUES ('22dff757218d4b10861139cb471a24af', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '20', '创建容器', '2018-07-18 08:49:05');
INSERT INTO `project_log` VALUES ('22ed5b84e7ba4eab9d0a3f6edf72b806', 'e1eeacaff8c2413a943bfd0a63d17a32', '49fac184ae0cfaabe1f19d37cdc85c28b5e0d2e8e9eeb0cb1bca6c2e41171af8', '22', '开启容器', '2018-07-21 15:45:24');
INSERT INTO `project_log` VALUES ('23caad859e9b4d8e9c565a197ec7fca9', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 14:19:53');
INSERT INTO `project_log` VALUES ('240d435d19184feaa07b69884e1ac8ca', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-15 12:18:36');
INSERT INTO `project_log` VALUES ('240e9f1e54ce401aab8dda96d4dc59f9', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 09:02:31');
INSERT INTO `project_log` VALUES ('24dd634287c9403cbe6185922e088af0', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-15 11:06:13');
INSERT INTO `project_log` VALUES ('25310b9369a841d995a64d1c1ce0c797', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '28', '停止容器', '2018-07-18 20:42:59');
INSERT INTO `project_log` VALUES ('25557b642717400daca17a776f843c08', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '20', '创建容器', '2018-07-13 15:08:37');
INSERT INTO `project_log` VALUES ('27144d22c8ae4845bc405751b10add75', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '22', '开启容器', '2018-07-20 08:54:36');
INSERT INTO `project_log` VALUES ('2789b8ce04af4559a6b9bf33f85583c1', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:14:02');
INSERT INTO `project_log` VALUES ('2859554a65684ed3941b6770b4b3085d', '738f28a08c0146acb09e75c8ee146adb', null, '10', '创建项目', '2018-07-14 10:30:09');
INSERT INTO `project_log` VALUES ('28ff8786566d4f1b8dd3cc9fb13ebf7b', null, 'dbd90eb8df97df4801778a713de084c69fbd8d181a29caa395e346727acae6f5', '32', '删除容器', '2018-07-20 21:37:28');
INSERT INTO `project_log` VALUES ('293736782c044448bbdf6f7440c80ea5', '7570bbe140c34a328e6d5c08a66675cc', null, '10', '创建项目', '2018-07-14 14:02:49');
INSERT INTO `project_log` VALUES ('2960f9373c7f4ffab063ddb4b12829aa', '6860df07dd1445228ff21d53eb18be65', 'igybvoysr1fy284wirmyxib2z', '38', '新建服务', '2018-07-18 15:52:20');
INSERT INTO `project_log` VALUES ('299f973b223949708fb21753b0baa812', '9d0d51e5058b426cacff0e8b8d2d4420', '55460c9d9cf8594ff809da98e354325b0ed642b1aa0a3d36cd2885d8e14c760e', '20', '创建容器', '2018-07-21 16:05:41');
INSERT INTO `project_log` VALUES ('2a121cb5a3924be7ab49c819fb46a522', null, '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '32', '删除容器', '2018-07-16 08:43:59');
INSERT INTO `project_log` VALUES ('2a89f351bca840038ebab726f7d9859f', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 17:34:57');
INSERT INTO `project_log` VALUES ('2be0fe799b9d4bfba345182e6c97737e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:45:47');
INSERT INTO `project_log` VALUES ('2c1127140e2d4aeebad0e957bccaeee9', '7570bbe140c34a328e6d5c08a66675cc', 'd8a9eb0f309b24d32b43b60d8e386976fcc6220c1fc5245c9e2ccaeb3e83a101', '20', '创建容器', '2018-07-17 15:35:15');
INSERT INTO `project_log` VALUES ('2c1e99836f784dcc949b071c07622c60', '33398ea14de14d979a495a3a53051b1a', '2076ac80bbdf65928df846c864c1c443a74dcd926c4bc9cb57aa237693aa4f31', '22', '开启容器', '2018-07-17 10:02:47');
INSERT INTO `project_log` VALUES ('2c7a4d136b4f4a758ad671fbb0af9bd2', null, '28438dc6149b13ebeafdf2b6a883e3bb8f670117d52cb1c606c6654fe8d76760', '32', '删除容器', '2018-07-21 16:05:55');
INSERT INTO `project_log` VALUES ('2dd5cbedad2b4de39dff026d5a9759da', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 08:59:12');
INSERT INTO `project_log` VALUES ('2e8881047dc8452f817b5b24fa1de5d3', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '24', '暂停容器', '2018-07-19 08:58:34');
INSERT INTO `project_log` VALUES ('2e8ccf06beac4f10be408e8241c8e59e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 17:03:28');
INSERT INTO `project_log` VALUES ('2fba45f7ca4b42e5bd7d91c09299a238', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '22', '开启容器', '2018-07-19 08:47:38');
INSERT INTO `project_log` VALUES ('2ffe75454a814548b2cd8b8d6ced31f6', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '26', '恢复容器', '2018-07-18 20:38:19');
INSERT INTO `project_log` VALUES ('30ddd638e9dd4ea8a15a406ed304369f', '58d227494a6c4625aa5d15495ae17156', '7e351653ae48377f0b1e49e09e86930ffc4a297224367242dac71896bf1ad656', '20', '创建容器', '2018-07-21 16:55:37');
INSERT INTO `project_log` VALUES ('314cc065946c4a7c8e5000dceca3b7db', '33398ea14de14d979a495a3a53051b1a', '2076ac80bbdf65928df846c864c1c443a74dcd926c4bc9cb57aa237693aa4f31', '24', '暂停容器', '2018-07-18 17:48:44');
INSERT INTO `project_log` VALUES ('31acdd5118be469e8722a876aa47bf48', 'dbe538b155104a87a4c62b157b0b793e', '3bc7bdcadb6d8cbadc23a1c47275732f59294956764ac9c25b8a2f372c1e6abf', '20', '创建容器', '2018-07-20 18:21:08');
INSERT INTO `project_log` VALUES ('31feb065ca304cc398fed8945a1f03ed', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-15 10:40:46');
INSERT INTO `project_log` VALUES ('322555d9997f4feaa918d44e217040f2', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '38', '新建服务', '2018-07-18 11:03:07');
INSERT INTO `project_log` VALUES ('32594f6e696a413c9df0b169c677ac49', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '26', '恢复容器', '2018-07-20 15:36:36');
INSERT INTO `project_log` VALUES ('33f49014545242968153b5a5ba550bd3', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:13:15');
INSERT INTO `project_log` VALUES ('346b20a7fc8b444e89c3eedba8b6fbbc', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '30', '强制停止容器', '2018-07-20 21:36:37');
INSERT INTO `project_log` VALUES ('347a62ab1a254d2e90618ebd3fdae56b', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '24', '暂停容器', '2018-07-18 11:10:29');
INSERT INTO `project_log` VALUES ('352281cf300641048b25881dacbf1380', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:15:00');
INSERT INTO `project_log` VALUES ('35b7f6e2f00e4a28b69e099e8316e4cb', '58d227494a6c4625aa5d15495ae17156', '7e351653ae48377f0b1e49e09e86930ffc4a297224367242dac71896bf1ad656', '23', '开启容器失败，原因：Docker异常', '2018-07-21 16:57:44');
INSERT INTO `project_log` VALUES ('3630f17530ef4eb194e6310cfd2331d3', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '22', '开启容器', '2018-07-20 15:17:56');
INSERT INTO `project_log` VALUES ('36702926066a48b997b705cd13153337', 'aabakfsvakiuw1213', '8f403b960fe58d288a57aab08e56501df93936a729c3bf1f7e72a58845c695e2', '20', '创建容器', '2018-07-21 10:37:58');
INSERT INTO `project_log` VALUES ('368c342ab8924627b32ed60553ce7ae7', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 16:39:44');
INSERT INTO `project_log` VALUES ('3746d9ef4d59450e9d317ce06a9c0069', '58d227494a6c4625aa5d15495ae17156', 'ea77de8f8238179a5688fae94251a4010dd85cf276a6b3514be5757420f6de27', '22', '开启容器', '2018-07-21 11:02:21');
INSERT INTO `project_log` VALUES ('3789c917cbf94973b2c9e2939dd78902', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:25:18');
INSERT INTO `project_log` VALUES ('386a186788984d17888f0e2f654c4b82', '58d227494a6c4625aa5d15495ae17156', null, '10', '创建项目', '2018-07-14 15:10:17');
INSERT INTO `project_log` VALUES ('39fc24fc560f449c8be3a1b9fca022d6', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '20', '创建容器', '2018-07-18 10:32:21');
INSERT INTO `project_log` VALUES ('3a630dd947ac4887b74858ddde192f4f', null, 'e96b75531105932335acc03641a903d967584a34eb3e0b1738c1b2b313363de0', '32', '删除容器', '2018-07-20 21:37:25');
INSERT INTO `project_log` VALUES ('3b9c4c347ee34044a8b59974dac3adc8', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:13:59');
INSERT INTO `project_log` VALUES ('3c5f275945eb401191a4d11af969e336', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-14 14:48:40');
INSERT INTO `project_log` VALUES ('3d53d3ec01b3414f8b164bbdfea7fa9c', 'e1eeacaff8c2413a943bfd0a63d17a32', '49fac184ae0cfaabe1f19d37cdc85c28b5e0d2e8e9eeb0cb1bca6c2e41171af8', '20', '创建容器', '2018-07-21 15:16:23');
INSERT INTO `project_log` VALUES ('3d553aff688c40cc8f1e49a00cfa3b77', 'aabakfsvakiuw1213', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '34', '重启容器', '2018-07-16 08:43:54');
INSERT INTO `project_log` VALUES ('3dba8e644c6b40cbb048091d6190a600', '58d227494a6c4625aa5d15495ae17156', 'd2b7f9632ed02a5037a19a99db9a4e8411da66d70c8f0ef849d0567b3294173e', '20', '创建容器', '2018-07-21 11:29:54');
INSERT INTO `project_log` VALUES ('3e560ab0c3e54c0e98a3b26d80e02c17', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:24:35');
INSERT INTO `project_log` VALUES ('3efbe3281cb548f8b50c54e45e92cd46', '6860df07dd1445228ff21d53eb18be65', 'zmwxec41kz15os4rjx2k3y60t', '38', '新建服务', '2018-07-18 14:35:31');
INSERT INTO `project_log` VALUES ('3eff7686bc8044d18c02d17161ac679d', '33398ea14de14d979a495a3a53051b1a', '1271e2679a630c1b55f21e0b687db0034211757ade1e4c3483a2e6795e8a9bf8', '20', '创建容器', '2018-07-16 14:29:57');
INSERT INTO `project_log` VALUES ('3f8fb140278846a4a171f64105e63346', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-14 09:39:43');
INSERT INTO `project_log` VALUES ('404314bfb14f497cbd197bf591465d3e', '58d227494a6c4625aa5d15495ae17156', '63ec66f93e85246a1e7aa5e18c01ed9de19db9ad453d83836be60de315a3c82e', '22', '开启容器', '2018-07-21 16:38:02');
INSERT INTO `project_log` VALUES ('40b3afa8c9584d30ac7e146f8de954a8', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '28', '停止容器', '2018-07-18 20:42:48');
INSERT INTO `project_log` VALUES ('40c22025f9814092bf5ad4cc2300d936', '6860df07dd1445228ff21d53eb18be65', 'b4b2n33dtvvp737cub832qt5m', '38', '新建服务', '2018-07-18 15:57:14');
INSERT INTO `project_log` VALUES ('40c82c0992294379b11b2d7c5d51df97', null, 'c4d57be54498e1495a6f86d1b7d1e04895be2491a554125105af494b264552ee', '32', '删除容器', '2018-07-20 21:37:34');
INSERT INTO `project_log` VALUES ('410c08991be64f3b87970e3ec03fa44f', null, '238ddaaeee6a18006cedc6fe586a79a2dbd1d4b9c6fe9ef1288943688c536aa6', '32', '删除容器', '2018-07-13 15:28:59');
INSERT INTO `project_log` VALUES ('417fd801be614ecba63e166908f0dede', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 16:51:21');
INSERT INTO `project_log` VALUES ('41caf42bb88147dcbb2cd6ac1a1e40bf', '913f0b0ab57141e0aa1f90baac7c8d60', '46ern0gbyddkqnvromhuuwy58', '38', '新建服务', '2018-07-17 15:05:36');
INSERT INTO `project_log` VALUES ('41facb1210704a49b99ba2ec33715789', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '24', '暂停容器', '2018-07-20 15:36:41');
INSERT INTO `project_log` VALUES ('42007d36c6e040f98a1247f1cf7e1ca9', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-15 10:27:37');
INSERT INTO `project_log` VALUES ('42da8b4c5062464aa957c88c02c8723f', 'aabakfsvakiuw1213', '744df219da7231cacb0b612aeef0b07172bc30b54313a973c047355a913ca1e4', '22', '开启容器', '2018-07-21 10:37:14');
INSERT INTO `project_log` VALUES ('42ea9bde6b6c4327b5772a1203e95f3b', '6860df07dd1445228ff21d53eb18be65', 'um7f7sborg8g5y0dy5on4dzkn', '38', '新建服务', '2018-07-18 14:51:53');
INSERT INTO `project_log` VALUES ('43c627d69bda4b769db4cb72eab94ce3', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:39:55');
INSERT INTO `project_log` VALUES ('43fb41676ca4480f97a24d21b23be232', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-18 14:35:31');
INSERT INTO `project_log` VALUES ('4408a535b7c541f28693ea3fd205ae88', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:05:23');
INSERT INTO `project_log` VALUES ('4462e7281032447b8c7260b9d022ba7e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-14 09:39:31');
INSERT INTO `project_log` VALUES ('4555eec3d9f14e3791f8ee540f6a5b9e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 08:59:26');
INSERT INTO `project_log` VALUES ('455bce0ee03749d09dbe38172f3ad8d1', 'aabakfsvakiuw1213', '71a8e5a4ded4e0c626fb2a472dc6044f06636495318f0a98f64e858c3560a1f4', '21', '创建容器失败，原因：Docker异常', '2018-07-13 15:06:42');
INSERT INTO `project_log` VALUES ('4574ed0f6c584dbea0f970c2f85500de', '58d227494a6c4625aa5d15495ae17156', '1ac362d6ae6d85a4c829de2bdf4f041635ca0b7ca71d9795e3a3e43c46f9ca88', '22', '开启容器', '2018-07-18 17:48:50');
INSERT INTO `project_log` VALUES ('458c84a808b24a78a8e372b97050a569', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '24', '暂停容器', '2018-07-20 15:36:34');
INSERT INTO `project_log` VALUES ('45e28c3996b749a7b68abb8245df37ca', '6860df07dd1445228ff21d53eb18be65', 'fb156539431fdd9c84412775cdf6391a43d6472d63c97b61ad9b03bed03a1db1', '22', '开启容器', '2018-07-19 11:22:50');
INSERT INTO `project_log` VALUES ('469dc8c9d8194cefa9bd3c071c4e2214', '33398ea14de14d979a495a3a53051b1a', '28b89f5b8dd6d08d28b71224de66cd09898cbace2eb2da8c691827d503908cd6', '22', '开启容器', '2018-07-16 16:14:44');
INSERT INTO `project_log` VALUES ('47a4e3ef1a5e4ceea88a727ae1e27729', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:08:55');
INSERT INTO `project_log` VALUES ('495a20b005ac4ed2bd7c7aed4dcf8d48', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '28', '停止容器', '2018-07-20 15:17:53');
INSERT INTO `project_log` VALUES ('499696d5657942f0a0c25eae047da1ca', 'dbe538b155104a87a4c62b157b0b793e', 'a8755a9da9c798b5f6f584dec3202bdab8360829f09d2008c3a48bbec3c5432f', '22', '开启容器', '2018-07-20 15:19:59');
INSERT INTO `project_log` VALUES ('49aa35f70662444199e02793cd9f7687', '33398ea14de14d979a495a3a53051b1a', '74e75e51e2961dbbd57833fb36f9888fa3046842e9068f66339f3171124833f4', '20', '创建容器', '2018-07-16 11:26:12');
INSERT INTO `project_log` VALUES ('4a57e3dad22948bf864b58d98d23eb3c', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-18 14:35:31');
INSERT INTO `project_log` VALUES ('4a5eb5fa94794cafad73e07dee482598', 'dbe538b155104a87a4c62b157b0b793e', '744df219da7231cacb0b612aeef0b07172bc30b54313a973c047355a913ca1e4', '22', '开启容器', '2018-07-21 15:51:48');
INSERT INTO `project_log` VALUES ('4de658291e664ede91b1e22054e49d1d', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '24', '暂停容器', '2018-07-20 15:11:49');
INSERT INTO `project_log` VALUES ('4dfccc5c9530438fb8ed9996d62c2bb3', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:25:13');
INSERT INTO `project_log` VALUES ('4ee4379d3b684327aee6f57a4efbdaea', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 09:00:18');
INSERT INTO `project_log` VALUES ('5074d59bdd4048b6bb1ac1da46a55aec', '6860df07dd1445228ff21d53eb18be65', 'c4d57be54498e1495a6f86d1b7d1e04895be2491a554125105af494b264552ee', '20', '创建容器', '2018-07-18 14:54:39');
INSERT INTO `project_log` VALUES ('507bbadda02b45cebc7a586f7f276d4a', '6860df07dd1445228ff21d53eb18be65', '3125e33def6e5d9461589000f3c701a56529a7495ae9e6dde9e9615158af764a', '20', '创建容器', '2018-07-18 14:14:17');
INSERT INTO `project_log` VALUES ('50ddc1a21a844b4492e374d43a1c555e', '6860df07dd1445228ff21d53eb18be65', '6u44woiu1ce20ixdqrgoymi7h', '38', '新建服务', '2018-07-18 14:57:44');
INSERT INTO `project_log` VALUES ('50f5e95c31a843089b2edebc880fee89', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '24', '暂停容器', '2018-07-20 15:17:47');
INSERT INTO `project_log` VALUES ('513207a66ae94fbdaba5f63a7a9cdc99', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:16:25');
INSERT INTO `project_log` VALUES ('51c5ccc234a643d28c09dfdf24f2847e', null, '57df8a016dad429a80e432dc5c11eb493ffa8e918678692352b7d509d41d759f', '32', '删除容器', '2018-07-20 21:36:56');
INSERT INTO `project_log` VALUES ('528928acfe454bdc8ac5f3422e317361', '642332c7c45f48e38626f8360df410ee', 'b2553634d1e45b5b88b38fed6936f1ba731f1ac85af70e657aa496548332bd15', '20', '创建容器', '2018-07-21 18:18:28');
INSERT INTO `project_log` VALUES ('52a76f82831047b7b89f80c1f6a6fe61', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 08:58:43');
INSERT INTO `project_log` VALUES ('548b66749bce4818bb8ef4d0eea8c5fc', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 16:45:21');
INSERT INTO `project_log` VALUES ('55d402643eba4b7fa658e10ad228b736', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:30:25');
INSERT INTO `project_log` VALUES ('55fd9f629804485a8c9a2359849d6d2f', '9d0d51e5058b426cacff0e8b8d2d4420', 'xbtgxxe9ysnu4iky7w8q8b6km', '38', '新建服务', '2018-07-21 16:08:51');
INSERT INTO `project_log` VALUES ('564b12ecb1684392a113e5736489b4a3', '6860df07dd1445228ff21d53eb18be65', 'ia720ui7xnbues4crr2hqau0d', '38', '新建服务', '2018-07-18 20:07:41');
INSERT INTO `project_log` VALUES ('56703b0420e940b2a0c0b9de71f07a8e', '5f7abd6bc8ed473ca268d9c0373a13a4', null, '10', '创建项目', '2018-07-14 14:39:43');
INSERT INTO `project_log` VALUES ('56b00118aab14f33af3918ff60c7e14d', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:17:17');
INSERT INTO `project_log` VALUES ('57a713a1a9de4a179280ac1a1618fd08', '33398ea14de14d979a495a3a53051b1a', '5068160e26ecd8a49048bd7f67f37d3f96ca59d97f91be3ece93e415396431a0', '20', '创建容器', '2018-07-19 15:16:51');
INSERT INTO `project_log` VALUES ('57d9c5cabadd467eb3c8d90416b7fceb', '758a7c9dcebd4e41b2de118356695dba', null, '10', '创建项目', '2018-07-14 14:41:37');
INSERT INTO `project_log` VALUES ('58124f7ed232421db4c33dc4abb6de2e', '7570bbe140c34a328e6d5c08a66675cc', 'oiv0fz9pxecic281vfrdj43qu', '38', '新建服务', '2018-07-17 15:09:07');
INSERT INTO `project_log` VALUES ('581d249c62a647ba9772203b0ac11594', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 16:45:27');
INSERT INTO `project_log` VALUES ('584ea202dddc452cb88f7aecc89907a5', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:27:11');
INSERT INTO `project_log` VALUES ('58c4724743324787bb3ef8248b0736bd', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '28', '停止容器', '2018-07-18 20:39:34');
INSERT INTO `project_log` VALUES ('592cd9ba2d474b7583e9fe4abf18197d', '642332c7c45f48e38626f8360df410ee', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '23', '开启容器失败，原因：Docker异常', '2018-07-16 08:39:30');
INSERT INTO `project_log` VALUES ('596578fe45414e34b266214beeb4d00e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-14 09:39:55');
INSERT INTO `project_log` VALUES ('5a0568c34a974f34909c9f21a474cc3a', '51553ff30e644ae78926e22392bf7a98', 'thm9ngsi6otjiz8wjouw51ycn', '38', '新建服务', '2018-07-15 14:01:45');
INSERT INTO `project_log` VALUES ('5a35c08e0a2542c99b49db254f921ffe', '33398ea14de14d979a495a3a53051b1a', '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', '23', '开启容器失败，原因：Docker异常', '2018-07-16 10:26:15');
INSERT INTO `project_log` VALUES ('5a78ae55f9324f259440646cf01c42a6', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '20', '创建容器', '2018-07-20 10:16:59');
INSERT INTO `project_log` VALUES ('5ab94c2ceb7241b2b41ada2df52d472c', 'aabakfsvakiuw1213', '8f403b960fe58d288a57aab08e56501df93936a729c3bf1f7e72a58845c695e2', '22', '开启容器', '2018-07-21 10:38:01');
INSERT INTO `project_log` VALUES ('5ad1979573d44fe79172f056168bd2d4', null, 'd47a357cb627d210d97d0517eb3d8b707f0b60f8cc38f99a17d44a0e1970d08a', '32', '删除容器', '2018-07-20 21:37:29');
INSERT INTO `project_log` VALUES ('5b1b362b98704da4bd2c76ed36e6c425', null, 'b4b2n33dtvvp737cub832qt5m', '36', '删除服务', '2018-07-18 20:07:12');
INSERT INTO `project_log` VALUES ('5b6542792c3c48348e08d6a51f01521a', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 17:04:20');
INSERT INTO `project_log` VALUES ('5ba870a07fb440929a29dd47909b9c2f', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '28', '停止容器', '2018-07-20 15:18:02');
INSERT INTO `project_log` VALUES ('5c13414847a54805b9613c79264cf3d9', '33398ea14de14d979a495a3a53051b1a', '2076ac80bbdf65928df846c864c1c443a74dcd926c4bc9cb57aa237693aa4f31', '34', '重启容器', '2018-07-18 19:48:51');
INSERT INTO `project_log` VALUES ('5c45ea8e40e14b54bbe6cbb93965aed5', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:29:17');
INSERT INTO `project_log` VALUES ('5c726b9da7fb4b3282c53bf054c974eb', '6860df07dd1445228ff21d53eb18be65', 'c6f33aa3553e13c767ab88803be07c8cd222568990a7217b0182f06c49342d3d', '20', '创建容器', '2018-07-19 19:04:17');
INSERT INTO `project_log` VALUES ('5cc4c38f7cf84320a2cb8b2745502426', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:08:12');
INSERT INTO `project_log` VALUES ('5cfeb8d9831a47d7991a206d6944971e', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '24', '暂停容器', '2018-07-20 21:36:34');
INSERT INTO `project_log` VALUES ('5d1c3b8c8fec4881aae4b704cd340e6e', 'aabakfsvakiuw1213', '84ee7c3055c396939ccd9c06e15e6d4050807c8fec97410738640b641454324e', '21', '创建容器失败，原因：Docker异常', '2018-07-13 14:58:41');
INSERT INTO `project_log` VALUES ('5e3fd324986944f8b4740b388138912d', '33398ea14de14d979a495a3a53051b1a', 'tkh3mdw9tcdkhojh49wcec3i2', '38', '新建服务', '2018-07-16 15:13:30');
INSERT INTO `project_log` VALUES ('5ed5d8e77484445a9e27833e3e658077', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:09:36');
INSERT INTO `project_log` VALUES ('5f6ab565a9e747e19f1a72295114cf2b', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 08:49:09');
INSERT INTO `project_log` VALUES ('5f89288497d940cc8287a6f624416b8d', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:06:53');
INSERT INTO `project_log` VALUES ('5f9fe7b738164f3aa425acce457dc6cb', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-14 14:15:44');
INSERT INTO `project_log` VALUES ('605dc440a46a40f880ab700c9f1e2021', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:25:26');
INSERT INTO `project_log` VALUES ('61023755970a435c817e57bed61aade1', null, '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', '32', '删除容器', '2018-07-20 21:37:19');
INSERT INTO `project_log` VALUES ('6129375081a0443f914217fdcfcf239c', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-14 09:35:45');
INSERT INTO `project_log` VALUES ('617a5634db02495cb0708ea9485c7fa9', '33398ea14de14d979a495a3a53051b1a', '2076ac80bbdf65928df846c864c1c443a74dcd926c4bc9cb57aa237693aa4f31', '20', '创建容器', '2018-07-16 19:51:52');
INSERT INTO `project_log` VALUES ('628949afb6fd4e96a985d5e20fde3fa8', '33398ea14de14d979a495a3a53051b1a', '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', '20', '创建容器', '2018-07-16 09:49:31');
INSERT INTO `project_log` VALUES ('62ec872d1f8245698a2b47e9dcbba648', null, 'a65361175996868f39b36225d1d8e2cdc1520da89de4977dee9d34ea5b8902da', '32', '删除容器', '2018-07-20 21:37:40');
INSERT INTO `project_log` VALUES ('63f593543e374dce98f3fbd8dd49b897', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '26', '恢复容器', '2018-07-20 15:16:29');
INSERT INTO `project_log` VALUES ('64a49ec3207e40d1bc83292dc1766cd8', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 17:04:03');
INSERT INTO `project_log` VALUES ('660c13d241954c2ca255ae0a19493279', null, '2076ac80bbdf65928df846c864c1c443a74dcd926c4bc9cb57aa237693aa4f31', '32', '删除容器', '2018-07-19 08:48:07');
INSERT INTO `project_log` VALUES ('674fccad4b4b428886fb84cc0e5402b2', '58d227494a6c4625aa5d15495ae17156', '11673d9d97d4b3f3901331e47c09dda6b59faaa63e69d8be9e9e5cb9bc345d41', '20', '创建容器', '2018-07-21 17:22:06');
INSERT INTO `project_log` VALUES ('675fcaa4536146d98fc015fe2826523f', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-18 20:42:35');
INSERT INTO `project_log` VALUES ('6847ad4353c449998213456fab692b85', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 16:10:36');
INSERT INTO `project_log` VALUES ('69ebd173d7714314a22475cca62ba1c0', 'dbe538b155104a87a4c62b157b0b793e', null, '10', '创建项目', '2018-07-18 08:47:39');
INSERT INTO `project_log` VALUES ('6a28d1f735bc49598c57c420c779c94d', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:17:32');
INSERT INTO `project_log` VALUES ('6ad7c2b22cad4903b592589294bca468', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '24', '暂停容器', '2018-07-18 16:24:29');
INSERT INTO `project_log` VALUES ('6b05c323619744069f7325e8d010c9f3', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-18 20:06:28');
INSERT INTO `project_log` VALUES ('6bb327752b334b458dbb26c09de932c3', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '26', '恢复容器', '2018-07-19 09:00:20');
INSERT INTO `project_log` VALUES ('6d60aae3bab54f3abee965489a8fb4f7', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-14 09:48:22');
INSERT INTO `project_log` VALUES ('6dece9daf52047e1a8ce081e162ce627', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '30', '强制停止容器', '2018-07-13 17:04:06');
INSERT INTO `project_log` VALUES ('6e37ae5bd7cd4f18b8e9e931ef9a7661', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:31:30');
INSERT INTO `project_log` VALUES ('70d1475f41144a518dc3cab8d8912cbd', '6860df07dd1445228ff21d53eb18be65', 't45xkfv0eae7hkh4u10dlkejy', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:50:29');
INSERT INTO `project_log` VALUES ('70dc87cc3bbc4603b2aa9ee8bcc6de63', null, '28b89f5b8dd6d08d28b71224de66cd09898cbace2eb2da8c691827d503908cd6', '32', '删除容器', '2018-07-20 21:36:45');
INSERT INTO `project_log` VALUES ('716afdb355a545598d5e4f58e9027ad8', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:55:06');
INSERT INTO `project_log` VALUES ('719bd2f090ae42ceaf91a44a706098be', '33398ea14de14d979a495a3a53051b1a', '532af6aece322329ab4f5011c0614655548d46496ff4fdbf8d7a00fa0f1245fc', '20', '创建容器', '2018-07-16 14:28:34');
INSERT INTO `project_log` VALUES ('7207ba0fd1c94b2a9f06b8b8826b1243', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:15:30');
INSERT INTO `project_log` VALUES ('720b36b297a94bbca997c2f6953b2eac', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '24', '暂停容器', '2018-07-19 08:52:12');
INSERT INTO `project_log` VALUES ('72eb5032f2be41489677335f3cfe7493', null, 'ia720ui7xnbues4crr2hqau0d', '36', '删除服务', '2018-07-18 20:07:49');
INSERT INTO `project_log` VALUES ('734f1968adb44aee9a3769775f032797', 'aabakfsvakiuw1213', '4ad87cd4f9b7b56938d0aad90751ce0a1242cba1a287ad67fd42addff58081c0', '21', '创建容器失败，原因：Docker异常', '2018-07-13 15:00:40');
INSERT INTO `project_log` VALUES ('7364b6d9af8d4d6ab1203475729c5a13', null, '1271e2679a630c1b55f21e0b687db0034211757ade1e4c3483a2e6795e8a9bf8', '32', '删除容器', '2018-07-20 21:36:41');
INSERT INTO `project_log` VALUES ('736541406df542799a0c27a33828189b', '51553ff30e644ae78926e22392bf7a98', '9h7oy6ey1f49d916u3wse4u26', '38', '新建服务', '2018-07-15 14:30:00');
INSERT INTO `project_log` VALUES ('738e21ad0c8c4fc3ae57a6ffb7082575', null, 'igybvoysr1fy284wirmyxib2z', '36', '删除服务', '2018-07-18 15:54:40');
INSERT INTO `project_log` VALUES ('73bb04e6816c4e54886b0818a5651511', null, '238ddaaeee6a18006cedc6fe586a79a2dbd1d4b9c6fe9ef1288943688c536aa6', '33', '删除容器失败，原因：Docker异常', '2018-07-13 15:28:59');
INSERT INTO `project_log` VALUES ('73f10acdb9234848b93a1c3f5d4d54f8', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '34', '重启容器', '2018-07-13 18:58:35');
INSERT INTO `project_log` VALUES ('7476b82946e1475fa434a93424ad197b', '9d0d51e5058b426cacff0e8b8d2d4420', '2aefaef97a7a91b7f9645f5482ce7e9fbd9f461ae3e7f2426cda4a6d5e1e20b3', '20', '创建容器', '2018-07-21 15:56:09');
INSERT INTO `project_log` VALUES ('74a4874879c6487ab60aead6b4ba65d5', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '28', '停止容器', '2018-07-18 19:49:07');
INSERT INTO `project_log` VALUES ('752b79f7fa674d83bd0c372ffd3f7743', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 17:32:59');
INSERT INTO `project_log` VALUES ('754bb5f353cd4e4b825a64e378ae35b8', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-20 15:08:25');
INSERT INTO `project_log` VALUES ('76462a493ba549db8902f2421e2bbb83', '7570bbe140c34a328e6d5c08a66675cc', '32f26eb6adffe7ebfb1a4f29c36be5aaf297d424112749e451b4a7bb654032ba', '20', '创建容器', '2018-07-17 09:20:27');
INSERT INTO `project_log` VALUES ('771e015e00f9464c94d8afc381b18577', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '37', '删除服务失败，原因：Docker异常', '2018-07-18 15:54:20');
INSERT INTO `project_log` VALUES ('7730305a48424970a9816b8fd07baacf', '33398ea14de14d979a495a3a53051b1a', '0cd7tari7e6pv38vwcb1aei22', '38', '新建服务', '2018-07-16 15:05:59');
INSERT INTO `project_log` VALUES ('788caf19f3594f6f83640a49e106471d', '6860df07dd1445228ff21d53eb18be65', 'wktcwjrpepveoeo6pjqmp6k3n', '38', '新建服务', '2018-07-18 14:28:43');
INSERT INTO `project_log` VALUES ('78ad133e607f4413b9bd04b78755c516', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '24', '暂停容器', '2018-07-18 20:42:12');
INSERT INTO `project_log` VALUES ('7986757a44ba483a9007b7c978bae773', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:35:41');
INSERT INTO `project_log` VALUES ('79fa3c9ca86848e287de8d35d4210b7c', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:32:07');
INSERT INTO `project_log` VALUES ('7a52a362c9104dca897c58ffab5395db', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 15:56:53');
INSERT INTO `project_log` VALUES ('7ab039958a284827a670a9853219f09d', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 16:14:12');
INSERT INTO `project_log` VALUES ('7b891bb01b4c47b9b42d36a8b70a9bba', 'aabakfsvakiuw1213', '0f3fbcb67895b10f8a0089908dbbd1435fd1a7295ab2dfa5e3a619b0f0f30137', '21', '创建容器失败，原因：Docker异常', '2018-07-13 15:04:46');
INSERT INTO `project_log` VALUES ('7baf501c98864209a4ea2c138bfb3506', 'dbe538b155104a87a4c62b157b0b793e', '744df219da7231cacb0b612aeef0b07172bc30b54313a973c047355a913ca1e4', '22', '开启容器', '2018-07-21 14:01:51');
INSERT INTO `project_log` VALUES ('7c4d8223f56d4e048a0817c6f0f87140', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:25:34');
INSERT INTO `project_log` VALUES ('7c68da3962444ae9a9bb3f362ff4e71e', 'a5744e8f469746cea01e03010f3ddfe9', null, '10', '创建项目', '2018-07-14 11:34:18');
INSERT INTO `project_log` VALUES ('7d115c8cec8546eb8fcee56b50446da2', '33398ea14de14d979a495a3a53051b1a', 'c19226a279bc1907cbb8bbd3b3714dee17d2248f73c562f0ee1eade79194bba5', '20', '创建容器', '2018-07-19 15:22:53');
INSERT INTO `project_log` VALUES ('7d54b69d4ff94a70821bba71be16abfb', null, '2aefaef97a7a91b7f9645f5482ce7e9fbd9f461ae3e7f2426cda4a6d5e1e20b3', '32', '删除容器', '2018-07-21 16:05:57');
INSERT INTO `project_log` VALUES ('7d5bc958061a42f1bed1321578b9c42d', '33398ea14de14d979a495a3a53051b1a', null, '21', '创建容器失败，原因：Docker异常', '2018-07-16 09:44:53');
INSERT INTO `project_log` VALUES ('7daf88d1523f48779e5dadf147291795', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:14:11');
INSERT INTO `project_log` VALUES ('7e26433308ae42d3b45c5eb33a512c66', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:16:10');
INSERT INTO `project_log` VALUES ('7e45266b125249fea5659d182c7154c9', null, '74e75e51e2961dbbd57833fb36f9888fa3046842e9068f66339f3171124833f4', '32', '删除容器', '2018-07-20 21:37:03');
INSERT INTO `project_log` VALUES ('7e5ce7d7ea464777a24a9398c70181ee', null, '55460c9d9cf8594ff809da98e354325b0ed642b1aa0a3d36cd2885d8e14c760e', '32', '删除容器', '2018-07-21 16:05:59');
INSERT INTO `project_log` VALUES ('7ffe9a0e8a44407faefe683b0cd34917', '6b3f4099393e44ada3fc2c3d68f089e5', null, '10', '创建项目', '2018-07-14 15:10:04');
INSERT INTO `project_log` VALUES ('80820de8bd1a49758ced49f8ee4ae110', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '24', '暂停容器', '2018-07-20 15:13:49');
INSERT INTO `project_log` VALUES ('8225b686589b40e59164d69df1491ef9', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 09:20:50');
INSERT INTO `project_log` VALUES ('82b5d6f641094a0cb21a423425cc0518', '642332c7c45f48e38626f8360df410ee', null, '39', '新建服务失败，原因：Docker异常', '2018-07-16 14:32:59');
INSERT INTO `project_log` VALUES ('843ab468679244059286eb36036bea79', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-18 14:35:31');
INSERT INTO `project_log` VALUES ('849ab3cb158c450d899ad23d8a687655', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '22', '开启容器', '2018-07-20 10:18:28');
INSERT INTO `project_log` VALUES ('84ac4384de764ef494c0ee67fac016a9', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-14 14:41:03');
INSERT INTO `project_log` VALUES ('84dd113a2b7c4678afa0863a49f0548a', null, '532af6aece322329ab4f5011c0614655548d46496ff4fdbf8d7a00fa0f1245fc', '32', '删除容器', '2018-07-20 21:36:54');
INSERT INTO `project_log` VALUES ('8528c51809e74116b891aef53c3a4d33', '58d227494a6c4625aa5d15495ae17156', '1ac362d6ae6d85a4c829de2bdf4f041635ca0b7ca71d9795e3a3e43c46f9ca88', '20', '创建容器', '2018-07-16 19:46:31');
INSERT INTO `project_log` VALUES ('85c19a9358de474aa34d2ee20186f1b1', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-14 09:48:15');
INSERT INTO `project_log` VALUES ('85cf36246a5d4d9f9572740d98a191aa', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '30', '强制停止容器', '2018-07-13 15:25:55');
INSERT INTO `project_log` VALUES ('86faa7f290bc45a3aeed2c866ff55581', null, '9h7oy6ey1f49d916u3wse4u26', '36', '删除服务', '2018-07-18 15:56:30');
INSERT INTO `project_log` VALUES ('87f80d51937746d7a334e10db260de6e', null, 'ucs6z37u79vepszed3gdutn3l', '36', '删除服务', '2018-07-15 09:49:02');
INSERT INTO `project_log` VALUES ('880f7edda332412699448f50cf1da1da', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '26', '恢复容器', '2018-07-18 16:24:46');
INSERT INTO `project_log` VALUES ('880fdda246a84efeb0ac433309913c4d', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-18 20:39:13');
INSERT INTO `project_log` VALUES ('88d69b4106a546198aba13c16cd8697a', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 09:28:29');
INSERT INTO `project_log` VALUES ('8aaabf8456ea457189aa763321d0abdc', 'd599aa5b00994a429d5039c21cf0f559', null, '10', '创建项目', '2018-07-14 15:10:14');
INSERT INTO `project_log` VALUES ('8b477239f3004e7ca84cb85d57a686b9', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 14:14:39');
INSERT INTO `project_log` VALUES ('8b75ed91f2204bf89c9539ad926d7d0b', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-14 14:07:20');
INSERT INTO `project_log` VALUES ('8bc039534d684d9bb3402b7c9f9b7b8a', '6860df07dd1445228ff21d53eb18be65', 'fb156539431fdd9c84412775cdf6391a43d6472d63c97b61ad9b03bed03a1db1', '20', '创建容器', '2018-07-19 11:21:30');
INSERT INTO `project_log` VALUES ('8c125d6bb4a9460880890516cca90b6f', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:25:03');
INSERT INTO `project_log` VALUES ('8ca9a668861249e98e630db070d17549', 'aabakfsvakiuw1213', '238ddaaeee6a18006cedc6fe586a79a2dbd1d4b9c6fe9ef1288943688c536aa6', '20', '创建容器', '2018-07-13 15:22:50');
INSERT INTO `project_log` VALUES ('8caa8776ae4f4488abdbb2fe3f5f8d0d', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 14:20:06');
INSERT INTO `project_log` VALUES ('8cba6f0df2d741a584cf2e59de89a84a', '9d0d51e5058b426cacff0e8b8d2d4420', 'd98ea826e266ab6c83c9bedb100ca0c90fceef794e1305cbc0945ae39869033f', '20', '创建容器', '2018-07-21 16:06:53');
INSERT INTO `project_log` VALUES ('8e9f5f176b844458ac9cf2ae4a433a55', null, 'c377b52674a6bbbfc2669465cc4d3616a531deeb3f01dadaa8d0b3c04c588053', '32', '删除容器', '2018-07-20 21:37:38');
INSERT INTO `project_log` VALUES ('8f82d7a976c241539efe14c6be514cc3', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 09:31:36');
INSERT INTO `project_log` VALUES ('90190235963e4833935028f41d1f8ef0', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '22', '开启容器', '2018-07-16 11:41:20');
INSERT INTO `project_log` VALUES ('9059c850f8f049018bfd7a0274640d2c', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '28', '停止容器', '2018-07-18 16:25:15');
INSERT INTO `project_log` VALUES ('90fa1299db28432cb2f79b8bfe59bcd2', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '22', '开启容器', '2018-07-20 15:12:22');
INSERT INTO `project_log` VALUES ('90feaa0972fe49dab7019aa3ff2e5a28', '58d227494a6c4625aa5d15495ae17156', '1ac362d6ae6d85a4c829de2bdf4f041635ca0b7ca71d9795e3a3e43c46f9ca88', '22', '开启容器', '2018-07-19 08:58:40');
INSERT INTO `project_log` VALUES ('912a41ac39074342899315b20685bdab', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:19:03');
INSERT INTO `project_log` VALUES ('9212b1fe3c374c309d18ae1f1edcb43f', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 08:50:10');
INSERT INTO `project_log` VALUES ('925665b96af146c6ba49d912e1003a0f', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '37', '删除服务失败，原因：Docker异常', '2018-07-18 11:35:09');
INSERT INTO `project_log` VALUES ('927568cc11a94ab29f67e92042766623', 'aabakfsvakiuw1213', 'a65eb55a6e5232d029fe7fc741aee2fb024145d4abe26b436ca3b408e1b4f838', '21', '创建容器失败，原因：Docker异常', '2018-07-13 15:03:12');
INSERT INTO `project_log` VALUES ('928aee5197ac4f16813b62579bf2cffb', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '28', '停止容器', '2018-07-18 20:09:42');
INSERT INTO `project_log` VALUES ('92aab6a5784641daa1e38672391ab845', '58d227494a6c4625aa5d15495ae17156', 'e502f2db26c211d6d5caff5bc264378e5041d774d598bda5f8e768be6340bbd9', '22', '开启容器', '2018-07-21 09:34:20');
INSERT INTO `project_log` VALUES ('92ba161a9c574323a4421edc0402d6fe', '3ef12b32f0a04284834cc25d48fa414b', null, '10', '创建项目', '2018-07-14 14:35:42');
INSERT INTO `project_log` VALUES ('93a701b7a41a4baa85ce01c67fd28fbc', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '24', '暂停容器', '2018-07-13 17:04:17');
INSERT INTO `project_log` VALUES ('9403de6fa3434214a115397e1f2a2481', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-14 09:39:37');
INSERT INTO `project_log` VALUES ('94a93d4d3eb447898f72edf297430c7d', '51553ff30e644ae78926e22392bf7a98', 'yhsxjeq7fl4paobkkv40184i4', '38', '新建服务', '2018-07-15 13:44:51');
INSERT INTO `project_log` VALUES ('955716caf873412ab8db9ff89565188a', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-14 09:48:12');
INSERT INTO `project_log` VALUES ('959358c767764854a7a6db2bab2cb4b2', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '28', '停止容器', '2018-07-18 11:09:44');
INSERT INTO `project_log` VALUES ('95f58467082f44f6bc2c99f651792fa4', '6860df07dd1445228ff21d53eb18be65', '502a6d642188dc22c88ac13501d620cb95a57150ed7f4cdd65d91ec0fc1caad0', '20', '创建容器', '2018-07-13 18:50:39');
INSERT INTO `project_log` VALUES ('963c4b8f590e4f6f9920583b92cffadd', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '26', '恢复容器', '2018-07-18 20:42:15');
INSERT INTO `project_log` VALUES ('965463c5eea340efbf867b0fa15560ed', '51553ff30e644ae78926e22392bf7a98', null, '39', '新建服务失败，原因：Docker异常', '2018-07-15 13:43:28');
INSERT INTO `project_log` VALUES ('9727edf1d19a40b3838bf93ecfc1346d', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 09:47:32');
INSERT INTO `project_log` VALUES ('97a61a39bb6e4f9cb15f431df917a34c', '6860df07dd1445228ff21d53eb18be65', 'wktcwjrpepveoeo6pjqmp6k3n', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:29:04');
INSERT INTO `project_log` VALUES ('97da399462c44753bd80a7401e87d32e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:17:52');
INSERT INTO `project_log` VALUES ('9802c916e94e4b1a8953bf43749262db', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 16:38:40');
INSERT INTO `project_log` VALUES ('997def7b0315493da0c806e81e834cdc', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '28', '停止容器', '2018-07-16 11:41:29');
INSERT INTO `project_log` VALUES ('9a7e9c7db59f4cbf853e5837b19b13e5', '33398ea14de14d979a495a3a53051b1a', '28b89f5b8dd6d08d28b71224de66cd09898cbace2eb2da8c691827d503908cd6', '20', '创建容器', '2018-07-16 14:19:48');
INSERT INTO `project_log` VALUES ('9a8f3f6a13f14fad8c44bd3e58d29302', '913f0b0ab57141e0aa1f90baac7c8d60', null, '10', '创建项目', '2018-07-14 15:10:21');
INSERT INTO `project_log` VALUES ('9ac0350578884fb9936e03b78061e312', null, '1cfbf5f6b2108c223609d951840b054c1f53971a71642c9f0223f2f0c2995530', '32', '删除容器', '2018-07-21 16:05:51');
INSERT INTO `project_log` VALUES ('9b220f489b5a45d9b2970c919b4cbe88', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:16:28');
INSERT INTO `project_log` VALUES ('9b9c7600f7764b7ab356f79389574c2c', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 16:49:50');
INSERT INTO `project_log` VALUES ('9c4dfc369aae483ab479664461391c91', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 17:35:10');
INSERT INTO `project_log` VALUES ('9c6e50df8a4942ce93b0d9eda2fa617d', '58d227494a6c4625aa5d15495ae17156', 'ea77de8f8238179a5688fae94251a4010dd85cf276a6b3514be5757420f6de27', '20', '创建容器', '2018-07-21 11:01:13');
INSERT INTO `project_log` VALUES ('9c84732668c84ff5a0d27ae6df50c808', 'aabakfsvakiuw1213', '843edafbbd9acd05bae0ad4de25f997fd652ab18e5f2f5f2fb89aaaacac9249c', '20', '创建容器', '2018-07-21 11:15:10');
INSERT INTO `project_log` VALUES ('9e1a10aee6e942f08144f1c455fa880b', '51553ff30e644ae78926e22392bf7a98', 'u35nanea8kax0j5tdfblk6kmm', '38', '新建服务', '2018-07-15 14:17:31');
INSERT INTO `project_log` VALUES ('a078884f66b44e38a4e557f6345de4e3', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '26', '恢复容器', '2018-07-18 20:42:44');
INSERT INTO `project_log` VALUES ('a119f080bf724bfb8b61c884ba928bc3', null, 'a3bf25b22f9a9517288de1b042b86d00665adb02341e15f82d019cf0c3a36783', '32', '删除容器', '2018-07-20 21:37:42');
INSERT INTO `project_log` VALUES ('a15f03d555e844a28a0f6f2e6c209bdf', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-18 10:32:40');
INSERT INTO `project_log` VALUES ('a1a5b32df133452ab60ccdf158f3dcc6', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 08:46:13');
INSERT INTO `project_log` VALUES ('a2bc91205c3543959457dc37ed8e3cc6', null, 'd8a9eb0f309b24d32b43b60d8e386976fcc6220c1fc5245c9e2ccaeb3e83a101', '32', '删除容器', '2018-07-20 21:37:36');
INSERT INTO `project_log` VALUES ('a4c5e7c7833542bc9004faf2132cdfad', null, '3bc7bdcadb6d8cbadc23a1c47275732f59294956764ac9c25b8a2f372c1e6abf', '32', '删除容器', '2018-07-20 21:36:53');
INSERT INTO `project_log` VALUES ('a6d28ac3692447a3b5574977eb033489', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-18 20:11:09');
INSERT INTO `project_log` VALUES ('a6d7f7a961214317952e310c6e534d6e', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '28', '停止容器', '2018-07-18 20:42:32');
INSERT INTO `project_log` VALUES ('a6e71f51a963489cac71b314ce950627', '9d0d51e5058b426cacff0e8b8d2d4420', '89a0d15228fb24da367266be66beb15b073392b988fb8fe6bf3360020e25593f', '20', '创建容器', '2018-07-21 16:02:11');
INSERT INTO `project_log` VALUES ('a7d9c207a33744819e52b50b6c033f64', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:08:56');
INSERT INTO `project_log` VALUES ('a7dfb4dcea3d4844a866e4e5e2b5462d', null, '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '32', '删除容器', '2018-07-20 21:36:39');
INSERT INTO `project_log` VALUES ('a8d65ebfa8f143df9ee7f0eacba34a11', 'aabakfsvakiuw1213', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-16 08:43:51');
INSERT INTO `project_log` VALUES ('a9422fbd09314fb2b760c4ead694ea64', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '26', '恢复容器', '2018-07-20 15:15:55');
INSERT INTO `project_log` VALUES ('a9a649a4338646b1a268d24dfbb6aeec', null, '502a6d642188dc22c88ac13501d620cb95a57150ed7f4cdd65d91ec0fc1caad0', '32', '删除容器', '2018-07-13 18:51:40');
INSERT INTO `project_log` VALUES ('aab31fea73544f28a05ed7e1e0baf09f', '33398ea14de14d979a495a3a53051b1a', '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', '23', '开启容器失败，原因：Docker异常', '2018-07-16 09:53:17');
INSERT INTO `project_log` VALUES ('aadf5224e118498d9ef240458eb7946c', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '28', '停止容器', '2018-07-18 20:39:02');
INSERT INTO `project_log` VALUES ('aadfb8ce759e464b8f4cf31b9aace947', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 09:45:23');
INSERT INTO `project_log` VALUES ('ab5fc79f472c4af2836138b0f567788d', null, 'ea77de8f8238179a5688fae94251a4010dd85cf276a6b3514be5757420f6de27', '32', '删除容器', '2018-07-21 11:28:43');
INSERT INTO `project_log` VALUES ('ab94691192824eacbf0cb33c07f56398', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '24', '暂停容器', '2018-07-13 15:23:51');
INSERT INTO `project_log` VALUES ('ad59868f4a0848598c17c5010fa6856b', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:12:12');
INSERT INTO `project_log` VALUES ('adb1a396bb8d4854be3d94340c8723e7', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-14 09:46:41');
INSERT INTO `project_log` VALUES ('b17ef183941141f78a42cd2e43c21be5', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-14 09:46:48');
INSERT INTO `project_log` VALUES ('b29be86aed144ba39985637adb612478', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:17:12');
INSERT INTO `project_log` VALUES ('b2aa6740a35c4fdf8f8bbec6521c9682', '33398ea14de14d979a495a3a53051b1a', null, '10', '创建项目', '2018-07-14 15:09:50');
INSERT INTO `project_log` VALUES ('b3dc15b6247c462b8e4b753292cf4869', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 09:02:00');
INSERT INTO `project_log` VALUES ('b41856a1474f47a2af3e55179730208e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:27:23');
INSERT INTO `project_log` VALUES ('b4a52b5aac354dcf9743d0a058cd93ef', null, '3125e33def6e5d9461589000f3c701a56529a7495ae9e6dde9e9615158af764a', '32', '删除容器', '2018-07-18 14:14:39');
INSERT INTO `project_log` VALUES ('b4b11810f26c4b388ed8ff1e08eaa969', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 09:47:02');
INSERT INTO `project_log` VALUES ('b56dc3b77961461cb24e9ef48c362672', '33398ea14de14d979a495a3a53051b1a', '7e9ac5ab1069565ea9c7e6842e69eb780584c8dbce1ee92108e6477ac343386d', '20', '创建容器', '2018-07-17 10:49:11');
INSERT INTO `project_log` VALUES ('b5d76bde44084c4f9a9359ad0734dd22', '6860df07dd1445228ff21d53eb18be65', 'm3f4rieevyrfnpmnu0luiloor', '38', '新建服务', '2018-07-18 11:04:41');
INSERT INTO `project_log` VALUES ('b6d7d4f8f143483e8a902bb26e2278ad', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '34', '重启容器', '2018-07-19 08:48:50');
INSERT INTO `project_log` VALUES ('b80e780aaa6d422da11472c696921dbf', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-18 20:42:53');
INSERT INTO `project_log` VALUES ('bb0dbf3883b84d199110b5e13acfce1b', 'dbe538b155104a87a4c62b157b0b793e', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '30', '强制停止容器', '2018-07-20 18:20:26');
INSERT INTO `project_log` VALUES ('bb865a64c24f43459f0412d42453c42d', '642332c7c45f48e38626f8360df410ee', 'fa096rzvp3658llejj8q3v2rx', '38', '新建服务', '2018-07-16 11:23:30');
INSERT INTO `project_log` VALUES ('bc13f49192cc48ffacc83891e6b74cde', null, 'e95f354eff971e2727150229174e7dcc46cb439c1715c6dbccb3524a1956e2cc', '32', '删除容器', '2018-07-20 21:37:26');
INSERT INTO `project_log` VALUES ('bc7a82aabcd84a02b5ed01f5449ea12d', null, '5182cdvl9vu7wbjldplb8jn7p', '36', '删除服务', '2018-07-19 18:58:36');
INSERT INTO `project_log` VALUES ('bc7d5925fba54d2fbcf5c17f71dc739d', 'dbe538b155104a87a4c62b157b0b793e', 'a8755a9da9c798b5f6f584dec3202bdab8360829f09d2008c3a48bbec3c5432f', '22', '开启容器', '2018-07-20 15:36:39');
INSERT INTO `project_log` VALUES ('bd52c27d26514456a2ad3b7c7d56aab4', null, '0f0ccef9d2c3c65c49b2b634d1715859d8c5e5ee20cc8ac2b66823c9be20026c', '32', '删除容器', '2018-07-21 16:05:50');
INSERT INTO `project_log` VALUES ('c04e8ba2b868423393958d03bb05a2c2', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:32:28');
INSERT INTO `project_log` VALUES ('c0949a82614141099c099adee3048b29', '6860df07dd1445228ff21d53eb18be65', 'fb156539431fdd9c84412775cdf6391a43d6472d63c97b61ad9b03bed03a1db1', '26', '恢复容器', '2018-07-19 19:00:41');
INSERT INTO `project_log` VALUES ('c16831d38b504ee38cd7414694a25ce1', '9d0d51e5058b426cacff0e8b8d2d4420', '1cfbf5f6b2108c223609d951840b054c1f53971a71642c9f0223f2f0c2995530', '20', '创建容器', '2018-07-21 16:03:37');
INSERT INTO `project_log` VALUES ('c16bbb675be24415a837714bd4bf999d', '6860df07dd1445228ff21d53eb18be65', 'fb156539431fdd9c84412775cdf6391a43d6472d63c97b61ad9b03bed03a1db1', '24', '暂停容器', '2018-07-19 19:00:38');
INSERT INTO `project_log` VALUES ('c1d7a12eec7943a9960e7bf959e571b2', '9d0d51e5058b426cacff0e8b8d2d4420', 'ac9a4df3aab416525e0b550cb4d5593a74fce19b4e21a119125ebdd0c568b0ca', '20', '创建容器', '2018-07-21 15:59:21');
INSERT INTO `project_log` VALUES ('c266637b44554266909f5f037aeb568a', '33398ea14de14d979a495a3a53051b1a', '28b89f5b8dd6d08d28b71224de66cd09898cbace2eb2da8c691827d503908cd6', '22', '开启容器', '2018-07-18 09:56:26');
INSERT INTO `project_log` VALUES ('c2f26b76bad94740b078c68403af16fa', 'f45a65eae10842b68cebeb86b10940cb', 'e95f354eff971e2727150229174e7dcc46cb439c1715c6dbccb3524a1956e2cc', '22', '开启容器', '2018-07-16 10:28:38');
INSERT INTO `project_log` VALUES ('c33ea80d35224160892daad0ed1c1a4e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-14 14:41:16');
INSERT INTO `project_log` VALUES ('c3820d8e1856437399748c0b0feab42e', 'f45a65eae10842b68cebeb86b10940cb', 'e95f354eff971e2727150229174e7dcc46cb439c1715c6dbccb3524a1956e2cc', '20', '创建容器', '2018-07-16 10:28:27');
INSERT INTO `project_log` VALUES ('c4b3a9a034c54a49a714f506a8ebac87', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '24', '暂停容器', '2018-07-18 20:42:42');
INSERT INTO `project_log` VALUES ('c5afc5443e1345c8bce2726a98076c05', null, '7e9ac5ab1069565ea9c7e6842e69eb780584c8dbce1ee92108e6477ac343386d', '32', '删除容器', '2018-07-20 21:37:04');
INSERT INTO `project_log` VALUES ('c6c1aed0e64b407aa977da4124dd7d08', '758a7c9dcebd4e41b2de118356695dba', 'dbd90eb8df97df4801778a713de084c69fbd8d181a29caa395e346727acae6f5', '20', '创建容器', '2018-07-17 11:29:19');
INSERT INTO `project_log` VALUES ('c9162db0774149ee99ba512292648e88', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '22', '开启容器', '2018-07-20 15:21:34');
INSERT INTO `project_log` VALUES ('c97f3230153d46b2ab086b9532c4f1ba', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '22', '开启容器', '2018-07-17 08:42:43');
INSERT INTO `project_log` VALUES ('c9ac6ee4d2794bd9895bfc4dafcd4d27', '642332c7c45f48e38626f8360df410ee', 'q53qoxqh9jio8od0pjrl0ptsy', '38', '新建服务', '2018-07-16 11:31:21');
INSERT INTO `project_log` VALUES ('c9b7b12fefe64b9084d4bf4ca95a0c44', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:28:13');
INSERT INTO `project_log` VALUES ('c9c472a70c764b53840b395b0e90072d', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-18 20:42:05');
INSERT INTO `project_log` VALUES ('cabcc72a240f452eb0ed15c34b9f5b67', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 09:28:41');
INSERT INTO `project_log` VALUES ('cb34448d3a604fd98dbb2014b9cc3460', '33398ea14de14d979a495a3a53051b1a', 'csjgwrye18ixze9kgrjus3lot', '38', '新建服务', '2018-07-16 15:20:31');
INSERT INTO `project_log` VALUES ('cbcbdcceb3734113b95eb307bade51d6', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-18 16:49:11');
INSERT INTO `project_log` VALUES ('cbf96c75510f43a5a4433b04d505e974', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:29:47');
INSERT INTO `project_log` VALUES ('cbfe3a3164664f8fb5fa05b28b7a64cf', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 15:16:35');
INSERT INTO `project_log` VALUES ('cc85157bb63845368c8a6e206277d670', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:30:41');
INSERT INTO `project_log` VALUES ('ce13d1134b094809878cf85f89808a19', null, '1ac362d6ae6d85a4c829de2bdf4f041635ca0b7ca71d9795e3a3e43c46f9ca88', '32', '删除容器', '2018-07-20 21:36:43');
INSERT INTO `project_log` VALUES ('ce58fc454f7b411ca5a5cc8d7ea0a45d', 'f45a65eae10842b68cebeb86b10940cb', null, '10', '创建项目', '2018-07-16 10:27:44');
INSERT INTO `project_log` VALUES ('d00a576054884c938639317d43346d6e', '33398ea14de14d979a495a3a53051b1a', 'c19226a279bc1907cbb8bbd3b3714dee17d2248f73c562f0ee1eade79194bba5', '23', '开启容器失败，原因：Docker异常', '2018-07-19 15:26:05');
INSERT INTO `project_log` VALUES ('d09f2e450d0b4774b5a71489995f4ced', '33398ea14de14d979a495a3a53051b1a', '57df8a016dad429a80e432dc5c11eb493ffa8e918678692352b7d509d41d759f', '20', '创建容器', '2018-07-16 11:23:46');
INSERT INTO `project_log` VALUES ('d12fd1d86dbe4cc9bc68d24101b680dd', null, 'ac9a4df3aab416525e0b550cb4d5593a74fce19b4e21a119125ebdd0c568b0ca', '32', '删除容器', '2018-07-21 16:06:12');
INSERT INTO `project_log` VALUES ('d2442a077eb047a386ad28d5df730be2', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '34', '重启容器', '2018-07-13 17:04:12');
INSERT INTO `project_log` VALUES ('d2b19954a4f84d0abbc322e7614fb013', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:26:50');
INSERT INTO `project_log` VALUES ('d3d63e0f42d24ed5a1d965e5a7f770ef', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 09:14:46');
INSERT INTO `project_log` VALUES ('d41dfbc87e8145d0bc0e0fd122183ced', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 09:32:54');
INSERT INTO `project_log` VALUES ('d424461a566e4085a760a8af2d5abb88', '58d227494a6c4625aa5d15495ae17156', 'f1eb8959a0a8e8f1eb2c5445e4da8ce268fb0c710cef449c0a5d2e9316ed9c0c', '22', '开启容器', '2018-07-21 10:10:00');
INSERT INTO `project_log` VALUES ('d575990105ac40ab9d5d8ebfff918e5c', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '22', '开启容器', '2018-07-16 16:18:16');
INSERT INTO `project_log` VALUES ('d57a1a5134464404bb7757f70951ff71', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-14 13:46:44');
INSERT INTO `project_log` VALUES ('d6c55422345d4e0b841f90066f70e139', null, '89a0d15228fb24da367266be66beb15b073392b988fb8fe6bf3360020e25593f', '32', '删除容器', '2018-07-21 16:06:01');
INSERT INTO `project_log` VALUES ('d6f87b98fade4fcb9c787b3745c52211', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '34', '重启容器', '2018-07-18 20:42:39');
INSERT INTO `project_log` VALUES ('d7af733302744808b753cf123752f19e', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '22', '开启容器', '2018-07-20 18:12:10');
INSERT INTO `project_log` VALUES ('d7dfaeb75e2f40009c0a78c62910cfcf', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 14:14:30');
INSERT INTO `project_log` VALUES ('d7f3d2a87a3b43b09b85e667614b4b93', '642332c7c45f48e38626f8360df410ee', 'kdy3aygudnqysyrla0w3amgj6', '38', '新建服务', '2018-07-16 14:42:17');
INSERT INTO `project_log` VALUES ('d80165bf11ea4bb19f768ac052b9d609', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '26', '恢复容器', '2018-07-20 15:17:49');
INSERT INTO `project_log` VALUES ('d85cbf19a950486696be73b712cba3bf', '9d0d51e5058b426cacff0e8b8d2d4420', '0f0ccef9d2c3c65c49b2b634d1715859d8c5e5ee20cc8ac2b66823c9be20026c', '20', '创建容器', '2018-07-21 16:02:36');
INSERT INTO `project_log` VALUES ('d8af3260a0c2401999c38aead1446bbb', '58d227494a6c4625aa5d15495ae17156', 'd2b7f9632ed02a5037a19a99db9a4e8411da66d70c8f0ef849d0567b3294173e', '22', '开启容器', '2018-07-21 11:30:28');
INSERT INTO `project_log` VALUES ('d961d03eefc24db9b099cb98844f5122', null, '04b3rsh8e78i1ghuf2sl246x9', '36', '删除服务', '2018-07-18 15:16:34');
INSERT INTO `project_log` VALUES ('da898b7862374e7f81eeac74d7bce65a', '58d227494a6c4625aa5d15495ae17156', 'ea77de8f8238179a5688fae94251a4010dd85cf276a6b3514be5757420f6de27', '28', '停止容器', '2018-07-21 11:28:14');
INSERT INTO `project_log` VALUES ('db0427de60364ad0a0a4d636adac3f32', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:47:22');
INSERT INTO `project_log` VALUES ('db3fbfda2d4545369a7c2f5e7d62c729', '33398ea14de14d979a495a3a53051b1a', null, '39', '新建服务失败，原因：Docker异常', '2018-07-16 15:05:32');
INSERT INTO `project_log` VALUES ('db5e048aa8434067becf0f969a19fa07', '6860df07dd1445228ff21d53eb18be65', 'a8755a9da9c798b5f6f584dec3202bdab8360829f09d2008c3a48bbec3c5432f', '22', '开启容器', '2018-07-20 18:09:27');
INSERT INTO `project_log` VALUES ('dc0bcd3118e94e9b9de7faebe25e0a6f', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:44:45');
INSERT INTO `project_log` VALUES ('dc5d3db8919a4c8f89455eec44149120', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:05:02');
INSERT INTO `project_log` VALUES ('dcd8f6ae6bc3458ba88b652429b297cd', null, 'c6f33aa3553e13c767ab88803be07c8cd222568990a7217b0182f06c49342d3d', '32', '删除容器', '2018-07-19 19:04:35');
INSERT INTO `project_log` VALUES ('dcead0fa37304f47a0f388b46edc0cff', '33398ea14de14d979a495a3a53051b1a', '28b89f5b8dd6d08d28b71224de66cd09898cbace2eb2da8c691827d503908cd6', '22', '开启容器', '2018-07-17 10:03:03');
INSERT INTO `project_log` VALUES ('ddaa15cd49f84e28a4cf1be0dfd3fb07', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:29:37');
INSERT INTO `project_log` VALUES ('de402a176f0e42d883ad219eb586a43a', null, '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '32', '删除容器', '2018-07-20 21:36:49');
INSERT INTO `project_log` VALUES ('de5f6b12d10b4770b706e5054165a541', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-18 16:23:46');
INSERT INTO `project_log` VALUES ('e181785e954c47abb9f336fd0883f74e', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:45:25');
INSERT INTO `project_log` VALUES ('e18a732bbdb14ffa8ab248cdba61e216', '6860df07dd1445228ff21d53eb18be65', 'qmsa4gwegmaxfvrrvpn3wrqq7', '38', '新建服务', '2018-07-18 15:59:56');
INSERT INTO `project_log` VALUES ('e227cb6678fb457db605d3c2ae1f8802', '9b84a6acd0f24e07ac5695a56986eaa7', null, '10', '创建项目', '2018-07-14 18:08:20');
INSERT INTO `project_log` VALUES ('e2900d2dd6d3406b875677484b3de411', '33398ea14de14d979a495a3a53051b1a', '1227edf27a196bd92dda61dddc7f6fa00b122e8dfe21199ed7bc5ab68f551965', '22', '开启容器', '2018-07-18 09:08:10');
INSERT INTO `project_log` VALUES ('e29ef6d351844897b8cb62b14329adda', '6860df07dd1445228ff21d53eb18be65', 'zmwxec41kz15os4rjx2k3y60t', '37', '删除服务失败，原因：Docker异常', '2018-07-18 14:58:05');
INSERT INTO `project_log` VALUES ('e307980ee9174e668cf6c868ae87bf73', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 14:47:04');
INSERT INTO `project_log` VALUES ('e3e3537fe7aa4ed593604c113c719f7c', 'dbe538b155104a87a4c62b157b0b793e', 'a8755a9da9c798b5f6f584dec3202bdab8360829f09d2008c3a48bbec3c5432f', '20', '创建容器', '2018-07-20 15:19:44');
INSERT INTO `project_log` VALUES ('e54523d274534a128ed098f4ac9fd52f', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '26', '恢复容器', '2018-07-13 17:04:35');
INSERT INTO `project_log` VALUES ('e58d948fb5fa43af823ed4940f80d81c', '642332c7c45f48e38626f8360df410ee', '541f266fd81417daea6bef6a7464401d9125b28f5b1f0bc79ff893dd4a55fa2a', '20', '创建容器', '2018-07-20 21:45:38');
INSERT INTO `project_log` VALUES ('e6a8b201846a414f88186aa9961e6f55', '642332c7c45f48e38626f8360df410ee', '04b3rsh8e78i1ghuf2sl246x9', '38', '新建服务', '2018-07-16 11:34:01');
INSERT INTO `project_log` VALUES ('e6b02eb985f1474bbcd13c29f2e3196b', 'e64c5069df7a42789d8fde36e8a8b990', null, '10', '创建项目', '2018-07-14 14:40:15');
INSERT INTO `project_log` VALUES ('e6b76d04144b4008bd5b00df2c73cd34', '33398ea14de14d979a495a3a53051b1a', 'd47a357cb627d210d97d0517eb3d8b707f0b60f8cc38f99a17d44a0e1970d08a', '22', '开启容器', '2018-07-16 10:26:19');
INSERT INTO `project_log` VALUES ('e6f0d1a427624bf4a15cc43b36362d0a', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:26:36');
INSERT INTO `project_log` VALUES ('e778151322d44216b529c02a9c6ab19c', '33398ea14de14d979a495a3a53051b1a', '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', '23', '开启容器失败，原因：Docker异常', '2018-07-16 10:26:08');
INSERT INTO `project_log` VALUES ('e778540ec1de4e31ab2e56a71b576b78', '7570bbe140c34a328e6d5c08a66675cc', 'ouz5h2f9svlg7w0hejyxkgtfs', '38', '新建服务', '2018-07-17 15:12:30');
INSERT INTO `project_log` VALUES ('e94bdf05986e43c5bb63145d302bbca3', '33398ea14de14d979a495a3a53051b1a', 'e96b75531105932335acc03641a903d967584a34eb3e0b1738c1b2b313363de0', '20', '创建容器', '2018-07-16 19:32:47');
INSERT INTO `project_log` VALUES ('e986863729494eb09a8a9ae5fa17dfcc', null, 'u9j6shg92ygidu0ja05ecw41x', '36', '删除服务', '2018-07-15 09:53:50');
INSERT INTO `project_log` VALUES ('ea0e1cb6ad3b426d81e02fa93469a556', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '24', '暂停容器', '2018-07-13 17:04:31');
INSERT INTO `project_log` VALUES ('ea252286931d49d6a32be86551bab45c', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '20', '创建容器', '2018-07-12 14:12:52');
INSERT INTO `project_log` VALUES ('ea49e0c6eed34b7b8ed317b6d6836a23', '33398ea14de14d979a495a3a53051b1a', '80df811f27a99dfbbc3eb9dbd8f079be4d0963ecb4995339a3340a8957b13499', '23', '开启容器失败，原因：Docker异常', '2018-07-16 10:26:32');
INSERT INTO `project_log` VALUES ('ea67efd5591a40deb7b05c95682e3099', '51553ff30e644ae78926e22392bf7a98', 'llmmxfyhi54bcfre18fwgiik6', '38', '新建服务', '2018-07-15 14:27:33');
INSERT INTO `project_log` VALUES ('ebc4ec0bb431423289e4c8688c3cc326', '6860df07dd1445228ff21d53eb18be65', 'c4d57be54498e1495a6f86d1b7d1e04895be2491a554125105af494b264552ee', '22', '开启容器', '2018-07-19 19:00:31');
INSERT INTO `project_log` VALUES ('ebdb44c06fa2419bb34a414bb4084720', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 18:58:25');
INSERT INTO `project_log` VALUES ('eca6c021a0114088a2ca9b847d228957', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 17:36:17');
INSERT INTO `project_log` VALUES ('ecfbed5bdfc646b0ad65fac9ee55dc05', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-14 14:41:08');
INSERT INTO `project_log` VALUES ('ee94de3add7b42a79326fe8a0456721e', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 16:34:33');
INSERT INTO `project_log` VALUES ('ee9874acf9e64eeb9f1762af08c8b1c2', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 17:36:58');
INSERT INTO `project_log` VALUES ('eedae4a52c3f446590ec35595303ac34', '6860df07dd1445228ff21d53eb18be65', 't45xkfv0eae7hkh4u10dlkejy', '38', '新建服务', '2018-07-18 14:43:00');
INSERT INTO `project_log` VALUES ('ef2b8e8a30d34e9ba7ae6949304fe95a', 'aabakfsvakiuw1213', '744df219da7231cacb0b612aeef0b07172bc30b54313a973c047355a913ca1e4', '22', '开启容器', '2018-07-21 09:52:05');
INSERT INTO `project_log` VALUES ('eff7ea059fad4aa0aa9f7b11eb82f0c2', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 09:46:41');
INSERT INTO `project_log` VALUES ('f01309f6bb7846eb8a8e42fe8fe8f390', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:27:48');
INSERT INTO `project_log` VALUES ('f1e27c7c59e541719ce87369e3fb56d5', 'e1eeacaff8c2413a943bfd0a63d17a32', '843edafbbd9acd05bae0ad4de25f997fd652ab18e5f2f5f2fb89aaaacac9249c', '22', '开启容器', '2018-07-21 14:02:02');
INSERT INTO `project_log` VALUES ('f27519946c9b45f0b0c787ecf5cbc357', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 16:39:22');
INSERT INTO `project_log` VALUES ('f2fa6c204e9241068b9fb39479693229', null, '32f26eb6adffe7ebfb1a4f29c36be5aaf297d424112749e451b4a7bb654032ba', '32', '删除容器', '2018-07-20 21:36:50');
INSERT INTO `project_log` VALUES ('f32c7259f09f4d00b88dd31875613159', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-15 10:35:18');
INSERT INTO `project_log` VALUES ('f33a6bbb88c04346a943c757b00c80fd', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-15 10:49:46');
INSERT INTO `project_log` VALUES ('f3f38a060a734a6fa02897f282da901b', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:11:05');
INSERT INTO `project_log` VALUES ('f4104723fba644a5bbc47e3629e370bb', 'a5744e8f469746cea01e03010f3ddfe9', null, '21', '创建容器失败，原因：Docker异常', '2018-07-17 17:10:33');
INSERT INTO `project_log` VALUES ('f44238881a9f43d08a9131c5cb946ea9', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:22:49');
INSERT INTO `project_log` VALUES ('f4537df30ce048b68bec1becfda7a8b6', '6860df07dd1445228ff21d53eb18be65', null, '39', '新建服务失败，原因：Docker异常', '2018-07-15 10:32:13');
INSERT INTO `project_log` VALUES ('f455356bd0de433481438439567b458c', '58d227494a6c4625aa5d15495ae17156', 'a65361175996868f39b36225d1d8e2cdc1520da89de4977dee9d34ea5b8902da', '20', '创建容器', '2018-07-17 17:49:36');
INSERT INTO `project_log` VALUES ('f475fa3f372546259d80d29a32bbc616', '642332c7c45f48e38626f8360df410ee', 'j35m8a7brnnxwcpj9ae083cht', '38', '新建服务', '2018-07-16 11:20:12');
INSERT INTO `project_log` VALUES ('f4a07a30a3414136b7719b7815467d0f', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '22', '开启容器', '2018-07-13 15:19:06');
INSERT INTO `project_log` VALUES ('f5ab1f092a4148819d8f6f9f2279ad3d', '6860df07dd1445228ff21d53eb18be65', '2ffv8g2tvwqsalf8am4na6ujr', '37', '删除服务失败，原因：Docker异常', '2018-07-18 11:35:16');
INSERT INTO `project_log` VALUES ('f5f5f0e73fbd4789888978d1392a943f', '6860df07dd1445228ff21d53eb18be65', '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '22', '开启容器', '2018-07-18 10:14:57');
INSERT INTO `project_log` VALUES ('f60b8889b3c24ac38dadfcc03a33326c', 'e1eeacaff8c2413a943bfd0a63d17a32', null, '10', '创建项目', '2018-07-21 13:57:02');
INSERT INTO `project_log` VALUES ('f64bdc8a386b4b93a0918f9ccade26b6', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '24', '暂停容器', '2018-07-18 20:09:30');
INSERT INTO `project_log` VALUES ('f6774e240b7d44179ba9e9000f4e2a40', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:40:37');
INSERT INTO `project_log` VALUES ('f723f8298cca4a2895bc17a67395feaf', '6860df07dd1445228ff21d53eb18be65', 'h0wktp82f6iqqpnc0pvarp7ak', '38', '新建服务', '2018-07-18 11:02:11');
INSERT INTO `project_log` VALUES ('f7b509efa4504d9db7e766de489a786d', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 16:39:31');
INSERT INTO `project_log` VALUES ('f7ef490659b34539934c5ea5bef58e68', '33398ea14de14d979a495a3a53051b1a', 'ia48vlpaz8aib1zhxuzygstja', '38', '新建服务', '2018-07-16 15:04:40');
INSERT INTO `project_log` VALUES ('fa24dab6edd1457381292d89e3ffdd58', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-12 17:36:22');
INSERT INTO `project_log` VALUES ('fa3ad64811b54f3e88ad19cfab40e1b1', 'aabakfsvakiuw1213', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-14 09:39:46');
INSERT INTO `project_log` VALUES ('fc4c69ef8046419db132c574bab9fe4a', '33398ea14de14d979a495a3a53051b1a', 'd47a357cb627d210d97d0517eb3d8b707f0b60f8cc38f99a17d44a0e1970d08a', '20', '创建容器', '2018-07-16 10:07:14');
INSERT INTO `project_log` VALUES ('fccbfa01d9ae42a8980f0a1c05c9c9d4', 'aabakfsvakiuw1213', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-14 13:58:21');
INSERT INTO `project_log` VALUES ('fd820cb930a049e8b366d6a0b9c3a481', 'aabakfsvakiuw1213', 'fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', '28', '停止容器', '2018-07-13 15:17:49');
INSERT INTO `project_log` VALUES ('fdf0ab2a70d544a78db03e793368eb56', '6860df07dd1445228ff21d53eb18be65', '5ada0b4a5dd3dda93b56dcbb076694dc8e34fddd92841557f920bfbc98d00fbf', '22', '开启容器', '2018-07-13 08:52:00');
INSERT INTO `project_log` VALUES ('fea48026de154fd08c03cabc2320ce44', '6860df07dd1445228ff21d53eb18be65', '2d4c8fb90c1b568a09f434c3fb29ab532d35d6381600535890f163898a82a6ca', '22', '开启容器', '2018-07-20 15:36:47');
INSERT INTO `project_log` VALUES ('fed1850e8c8640f38b85b00bedb590b3', 'eefe3167399c45d687b6709851ecf3b8', null, '10', '创建项目', '2018-07-14 10:33:07');
INSERT INTO `project_log` VALUES ('ff4de3c6485b4e8d951643fffc515cdb', '6860df07dd1445228ff21d53eb18be65', '278f6f064f2b17703ac91fc92caff0f8c19e955a80410011c18ebfd3208235a4', '22', '开启容器', '2018-07-18 11:10:26');
INSERT INTO `project_log` VALUES ('ffff0606a7824cdd93cfad180d8c7d95', null, '202042808ee6c53603893531af1d8689037f2886a9d4ff0c3ba986e0932bb821', '32', '删除容器', '2018-07-18 11:09:27');

-- ----------------------------
-- Table structure for `repository_image`
-- ----------------------------
DROP TABLE IF EXISTS `repository_image`;
CREATE TABLE `repository_image` (
  `id` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL COMMENT '镜像完整名',
  `name` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `digest` varchar(255) DEFAULT NULL,
  `repo` varchar(255) DEFAULT NULL COMMENT '仓储',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='仓储镜像';

-- ----------------------------
-- Records of repository_image
-- ----------------------------
INSERT INTO `repository_image` VALUES ('44337f2e43ad4508a6ff26a6cd20b0cb', '192.168.100.94:5000/f4f4bb152cf54fec94eb0d2b22d25f71/my-busybox:latest', 'f4f4bb152cf54fec94eb0d2b22d25f71/my-busybox', 'latest', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'sha256:cc8aa6490766f53d618c98ab214fbe01e4bbb85e3ddbc6b4044cb7f0736ec91f', '192.168.100.94:5000', '2018-07-13 20:28:36', null);

-- ----------------------------
-- Table structure for `sys_image`
-- ----------------------------
DROP TABLE IF EXISTS `sys_image`;
CREATE TABLE `sys_image` (
  `id` varchar(255) NOT NULL,
  `image_id` varchar(255) DEFAULT NULL COMMENT '镜像ID',
  `full_name` varchar(255) DEFAULT NULL COMMENT '镜像完整名',
  `name` varchar(255) DEFAULT NULL COMMENT '镜像名',
  `tag` varchar(255) DEFAULT NULL COMMENT 'TAG',
  `size` mediumtext COMMENT '所占大小',
  `type` tinyint(1) DEFAULT NULL COMMENT '镜像类型【1：公共镜像；2：用户镜像】',
  `user_id` varchar(255) DEFAULT NULL COMMENT '如果是用户镜像，指明用户ID',
  `has_open` tinyint(1) DEFAULT NULL COMMENT '如果是用户镜像，是否公开',
  `virtual_size` mediumtext,
  `labels` text,
  `cmd` text,
  `repo` varchar(255) DEFAULT NULL COMMENT '仓库地址【官方：library】',
  `parent_id` varchar(225) DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_image
-- ----------------------------
INSERT INTO `sys_image` VALUES ('03f008b8f0724ffda1e9faa85f51377b', 'fbec56229bb2817c990c811ab7d8d8fefd511655db1a5c01a05cfdaf44aacda0', 'local/34567189513412/cc:latest', 'cc', 'latest', '1363351', '2', '34567189513412', '1', '1363351', 'null', 'null', 'local', '', '2018-07-19 10:27:25', '2018-07-19 14:32:42');
INSERT INTO `sys_image` VALUES ('079d56e585534bc69dcec2132f5f3f10', '2cb0d9787c4dd17ef9eb03e512923bc4db10add190d3f84af63b744e353a9b34', 'hello-world:latest', 'hello-world', 'latest', '1848', '1', '', null, '1848', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/hello\\\"]\"]', 'library', '', '2018-07-15 17:24:52', null);
INSERT INTO `sys_image` VALUES ('0fb699d8a7d64c2ba1562984299aa78c', '49f7960eb7e4cb46f1a02c1f8174c6fac07ebf1eb6d8deffbcb5c695f1c9edd5', 'centos:latest', 'centos', 'latest', '199671138', '1', null, null, '199671138', '{\"org.label-schema.schema-version\":\"= 1.0     org.label-schema.name=CentOS Base Image     org.label-schema.vendor=CentOS     org.label-schema.license=GPLv2     org.label-schema.build-date=20180531\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/bin/bash\\\"]\"]', 'library', '', '2018-07-19 16:01:01', null);
INSERT INTO `sys_image` VALUES ('11e97a806e274d2e89393a7e30c37a8a', '5e37cf2a267d1359ba23f3a5d81fe7b354e845a79d1cef800223235fafbaf68b', 'vimagick/iptables:latest', 'iptables', 'latest', '8789493', '1', '', null, '8789493', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/bin/sh\\\" \\\"-c\\\" \\\"iptables -F     && iptables -A INPUT -p tcp -m state --state NEW --dport $LIMIT_PORT -m connlimit --connlimit-above $LIMIT_CONN -j DROP     && iptables -A OUTPUT -p tcp -m state --state NEW -m multiport ! --dports $TCP_PORTS -j DROP     && iptables -A OUTPUT -p udp -m state --state NEW -m multiport ! --dports $UDP_PORTS -j DROP     && tc qdisc add dev eth0 root tbf rate $RATE burst $BURST latency $LATENCY     && watch -n $INTERVAL tc -s qdisc ls dev eth0\\\"]\"]', 'vimagick', '', '2018-07-17 11:11:27', null);
INSERT INTO `sys_image` VALUES ('14655e7533a340ea909ef0d850f2dcbe', 'c762e8b13317fd331953d9372de73867d678c4e9d979f69e54d41783307bf8f5', 'tomcat:7', 'tomcat', '7', '356628279', '1', null, null, '356628279', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"catalina.sh\\\" \\\"run\\\"]\"]', 'library', '', '2018-07-21 11:28:54', null);
INSERT INTO `sys_image` VALUES ('1b0e4f3afaab44c8ba45adc1a1bd586d', '36aed13709a9447e9e0b29b170d04789cf1b531ef99789311ca6229018fe36a0', 'local/1231451941131/test_image1:latest', 'test_image1', 'latest', '1363351', '2', '1231451941131', '0', '1363351', 'null', 'null', 'local', '', '2018-07-15 15:42:33', null);
INSERT INTO `sys_image` VALUES ('20a7a66df7d44b54a4894c9b1eaaa950', '07fbb0bc64ecd57445e51bbd198066735d6ac8c8edccd5bc422c6bdaab78972a', 'deis/helloworld:latest', 'helloworld', 'latest', '375568504', '1', null, null, '375568504', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"ENTRYPOINT [\\\"/go/bin/helloworld\\\"]\"]', 'deis', '', '2018-07-17 10:10:20', null);
INSERT INTO `sys_image` VALUES ('29952c38f59d44419f9d2cdaa8213b9f', '3c5a051232223f9ccf4a604d611696e98392648c9e567d3ecd2af881c9f93101', 'nginx:latest', 'nginx', 'latest', '108974617', '1', null, null, '108974617', '{\"maintainer\":\"NGINX Docker Maintainers <docker-maint@nginx.com>\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"nginx\\\" \\\"-g\\\" \\\"daemon off;\\\"]\"]', 'library', '', '2018-07-12 14:10:08', null);
INSERT INTO `sys_image` VALUES ('29bbd6063d834cc19687f0014ec169d1', '42e0a5695c8a95eeca3d6348f799912a87efdcc9372a9c9bbb412a49a86d9c58', '<none>:<none>', '<none>', '<none>', '1363351', '1', null, null, '1363351', 'null', null, 'library', '', '2018-07-19 10:52:20', null);
INSERT INTO `sys_image` VALUES ('3afb213e8fc84dc19543117065d28736', 'd23bdf5b1b1b1afce5f1d0fd33e7ed8afbc084b594b9ccf742a5b27080d8a4a8', 'java:latest', 'java', 'latest', '643119603', '1', null, null, '643119603', '{}', '[\"/bin/sh\",\"-c\",\"/var/lib/dpkg/info/ca-certificates-java.postinst configure\"]', 'library', '', '2018-07-21 16:30:11', null);
INSERT INTO `sys_image` VALUES ('5d5d618b663e417d8a105d6ac6111744', '22c2dd5ee85dc01136051800684b0bf30016a3082f97093c806152bf43d4e089', 'busybox:latest', 'busybox', 'latest', '1162745', '1', null, null, '1162745', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"sh\\\"]\"]', 'library', '', '2018-07-19 15:47:31', null);
INSERT INTO `sys_image` VALUES ('61c9b1620cdc4312b947c013f86d21f8', 'dea42c9ab957cc8ad6e42d0fca75ea6c9e2f68e20f1956e82f9fcd18787a7af1', 'local/34567189513412/xxxx:latest', 'xxxx', 'latest', '1363351', '2', '34567189513412', '0', '1363351', 'null', 'null', 'local', '', '2018-07-19 10:38:54', '2018-07-19 15:43:37');
INSERT INTO `sys_image` VALUES ('657954847cae49e0a5fe36f3aa3dc4bf', 'b0297e58d36344916e9fcd6b549ccef5e0a9d464a7cb45d2e0a4a04530287047', 'local/34567189513412/cccccccc:latest', 'cccccccc', 'latest', '1363351', '2', '34567189513412', '0', '1363351', 'null', 'null', 'local', '', '2018-07-19 14:32:10', null);
INSERT INTO `sys_image` VALUES ('6bbd92c012f44ff1936d990851770c81', '22d63be928b70ad9a2c82774898862fa1aa380ec80eb6a7cb18ba5fca9c78d69', 'local/f4f4bb152cf54fec94eb0d2b22d25f71/yy:uu', 'yy', 'uu', '12800', '2', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0', '12800', 'null', 'null', 'local', '', '2018-07-20 21:21:35', '2018-07-21 15:18:04');
INSERT INTO `sys_image` VALUES ('77984ad1cd8a481bb64142ddb7626258', 'f45277861b044bbd4fa0cf38f5e768b47f50fb564abfdd85e7664894fa3e97b6', 'mysql:latest', 'mysql', 'latest', '444724718', '1', null, null, '444724718', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"mysqld\\\"]\"]', 'library', '', '2018-07-21 09:22:02', null);
INSERT INTO `sys_image` VALUES ('7b60c2929ea2495fb1192e4f835d5429', '7afb7abcfe5f2c54e9a34ddf70337aa7d207eee2bc172100dc439e97bfebfcee', 'portainer/portainer:latest', 'portainer', 'latest', '56967692', '1', null, null, '56967692', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"ENTRYPOINT [\\\"/portainer\\\"]\"]', 'portainer', '', '2018-07-13 12:00:00', null);
INSERT INTO `sys_image` VALUES ('7c661e5cabbf41a9adcd37e1d2476436', 'c2833da961e76f6c05f44d064b3efe4d93a57111088d4267980b35c890637bfd', '<none>:<none>', '<none>', '<none>', '1363351', '1', null, null, '1363351', 'null', null, 'library', '', '2018-07-19 10:55:41', null);
INSERT INTO `sys_image` VALUES ('86763d9834c2496db97002f3fd14d105', '235889aef1227813c07a2803b5e65ee7761784e160d07c2e9e8bf36bec66c651', 'gramercylabs/docker-helloworld:latest', 'docker-helloworld', 'latest', '30838206', '1', null, null, '30838206', '{}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/bin/sh\\\" \\\"-c\\\" \\\"php-fpm -d variables_order=\\\\\\\"EGPCS\\\\\\\" && (tail -F /var/log/nginx/access.log &) && exec nginx -g \\\\\\\"daemon off;\\\\\\\"\\\"]\"]', 'gramercylabs', '', '2018-07-17 09:50:31', null);
INSERT INTO `sys_image` VALUES ('8770d29c48b54efcb4b28e9f500569a8', 'd3a7e330b8f74eae23e19c701e6c500f45d4f8eb728608581e7156013cc92816', 'local/f4f4bb152cf54fec94eb0d2b22d25f71/biubiubiu:tag', 'biubiubiu', 'tag', '12800', '2', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0', '12800', 'null', 'null', 'local', '', '2018-07-20 21:19:56', '2018-07-21 10:09:36');
INSERT INTO `sys_image` VALUES ('8bbd1330363045f38199beed5235f06d', '26cb02cc970aa07cf786e59db7e1a058c3c4de9d53e62c3bb839ddc483cfd2fd', 'local/34567189513412/vvvv:latest', 'vvvv', 'latest', '1363351', '2', '34567189513412', '0', '1363351', 'null', 'null', 'local', '', '2018-07-19 10:52:20', '2018-07-19 15:34:31');
INSERT INTO `sys_image` VALUES ('8f3adf0c805d4acb85792ccac58d2a38', '31e17b0746e48958b27f1d3dd4fe179fbba7e8efe14ad7a51e964181a92847a6', 'tutum/hello-world:latest', 'hello-world', 'latest', '17787050', '1', null, null, '17787050', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) CMD [\\\"/bin/sh\\\" \\\"-c\\\" \\\"php-fpm -d variables_order=\\\\\\\"EGPCS\\\\\\\" && (tail -F /var/log/nginx/access.log &) && exec nginx -g \\\\\\\"daemon off;\\\\\\\"\\\"]\"]', 'tutum', '', '2018-07-17 15:35:53', null);
INSERT INTO `sys_image` VALUES ('91fdb65dddec4e229bde8c90b35efb67', '50c619b73b7e840c51cb330b1f924852f93a0e58b010e41880fa29a6b162ce12', 'local/f4f4bb152cf54fec94eb0d2b22d25f71/io:oi', 'io', 'oi', '12800', '2', 'f4f4bb152cf54fec94eb0d2b22d25f71', '1', '12800', 'null', 'null', 'local', '', '2018-07-20 21:23:46', '2018-07-21 10:15:05');
INSERT INTO `sys_image` VALUES ('9565076f29424a1a8399e9a0521b6a71', '0bb929aa8d628ebbcdda938a2dc71183683c024d364e8aa5dc35d7add8be3afa', 'local/34567189513412/wwww:latest', 'wwww', 'latest', '1363351', '2', '34567189513412', '0', '1363351', 'null', 'null', 'local', '', '2018-07-19 13:48:11', null);
INSERT INTO `sys_image` VALUES ('9788c2ca193f4598b2e53061c3ae1916', '26cb02cc970aa07cf786e59db7e1a058c3c4de9d53e62c3bb839ddc483cfd2fd', '<none>:<none>', '<none>', '<none>', '1363351', '1', null, null, '1363351', 'null', null, 'library', '', '2018-07-19 10:55:41', null);
INSERT INTO `sys_image` VALUES ('9c9797293cd141899958792c41a8335a', '9a99c19999418e695763a7165e035a3580329648eedbad5aaa2907663d59561d', 'local/f4f4bb152cf54fec94eb0d2b22d25f71/kk:tt', 'kk', 'tt', '12800', '2', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0', '12800', 'null', 'null', 'local', '', '2018-07-20 21:23:26', '2018-07-21 10:09:38');
INSERT INTO `sys_image` VALUES ('9e5f1c88c2e74730a4854be48194762e', 'e010d7dea3d5970adc2f60d69a2a79870bfcfd4479157ebc578be5cdb7b26a04', '<none>:<none>', '<none>', '<none>', '1363351', '1', null, null, '1363351', 'null', null, 'library', '', '2018-07-19 10:55:41', null);
INSERT INTO `sys_image` VALUES ('a765a471638949218ecb738f77cb018b', '563e45ee6e1243335785f558dbb566791e5ac5bd293aafc5c75e5b0743eaa888', 'jdeathe/centos-ssh:latest', 'centos-ssh', 'latest', '218813143', '1', null, null, '218813143', '{\"build-date\":\"20170911\",\"install\":\"docker run --rm --privileged --volume /:/media/root jdeathe/centos-ssh:2.3.2 /usr/sbin/scmi install --chroot=/media/root --name=${NAME} --tag=2.3.2 --setopt=\'--volume {{NAME}}.config-ssh:/etc/ssh\'\",\"license\":\"GPLv2\",\"maintainer\":\"James Deathe <james.deathe@gmail.com>\",\"name\":\"CentOS Base Image\",\"org.deathe.description\":\"CentOS-7 7.4.1708 x86_64 - SCL, EPEL and IUS Repositories / Supervisor / OpenSSH.\",\"org.deathe.license\":\"MIT\",\"org.deathe.name\":\"centos-ssh\",\"org.deathe.release\":\"jdeathe/centos-ssh:2.3.2\",\"org.deathe.url\":\"https://github.com/jdeathe/centos-ssh\",\"org.deathe.vendor\":\"jdeathe\",\"org.deathe.version\":\"2.3.2\",\"uninstall\":\"docker run --rm --privileged --volume /:/media/root jdeathe/centos-ssh:2.3.2 /usr/sbin/scmi uninstall --chroot=/media/root --name=${NAME} --tag=2.3.2 --setopt=\'--volume {{NAME}}.config-ssh:/etc/ssh\'\",\"vendor\":\"CentOS\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/usr/bin/supervisord\\\" \\\"--configuration=/etc/supervisord.conf\\\"]\"]', 'jdeathe', '', '2018-07-16 21:17:38', null);
INSERT INTO `sys_image` VALUES ('a77495bfdc204a30954d18b5fffc2193', 'bcb87a42a9544aca7cfa1d5fcb82699458290b005b6bb178f365f1411bb246c4', 'hello-seattle:latest', 'hello-seattle', 'latest', '1872', '1', '', null, '1872', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/hello\\\"]\"]', 'library', '', '2018-07-13 17:30:00', null);
INSERT INTO `sys_image` VALUES ('aa96f0f1bab247ce99be873936e43a12', '64b7be7e29150aab9357c72716406a7f7e7e17e62dd59b85834ef985d4121045', 'local/f4f4bb152cf54fec94eb0d2b22d25f71/ii:uu', 'ii', 'uu', '12800', '2', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0', '12800', 'null', 'null', 'local', '', '2018-07-20 21:21:57', '2018-07-21 10:15:14');
INSERT INTO `sys_image` VALUES ('b64854a3fa404a5b9aab6f9407f2cdf3', '42e0a5695c8a95eeca3d6348f799912a87efdcc9372a9c9bbb412a49a86d9c58', '<none>:<none>', '<none>', '<none>', '1363351', '1', null, null, '1363351', 'null', null, 'library', '', '2018-07-19 10:55:41', null);
INSERT INTO `sys_image` VALUES ('b8503cb2260f41339fbfc1cf79c66686', 'c8b665fafb2c4955b599425ae34e5fbf4bfcd2f485ea04b617b6f4ec9a97915d', '192.168.100.94:5000/f4f4bb152cf54fec94eb0d2b22d25f71/my-busybox:latest', 'f4f4bb152cf54fec94eb0d2b22d25f71/my-busybox', 'latest', '1363351', '1', null, null, '1363351', 'null', 'null', '192.168.100.94:5000', '', '2018-07-21 17:11:46', null);
INSERT INTO `sys_image` VALUES ('bf822db667724f6fb839898c8c0a3edc', '350ab3987e640175267f58ba34a9e709e38d92443ba0b2c1b91a4d3d2e29681e', 'vimagick/mpd:latest', 'mpd', 'latest', '108880597', '1', '', null, '108880597', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"mpd\\\" \\\"--stdout\\\" \\\"--no-daemon\\\"]\"]', 'vimagick', '', '2018-07-17 14:04:20', null);
INSERT INTO `sys_image` VALUES ('d1cc2f24d7324ec791407a8e68a29554', '5195076672a7e30525705a18f7d352c920bbd07a5ae72b30e374081fe660a011', 'mysql:5.7.21', 'mysql', '5.7.21', '371405265', '1', null, null, '371405265', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"mysqld\\\"]\"]', 'library', '', '2018-07-21 10:07:08', null);
INSERT INTO `sys_image` VALUES ('e12b387cd1d742ca9265923221743832', '5ed1e3a2b745030eac8fef51524da629e73eb0e0faad9304e79d9ba827a61b1c', 'local/f4f4bb152cf54fec94eb0d2b22d25f71/po:io', 'po', 'io', '12800', '2', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0', '12800', 'null', 'null', 'local', '', '2018-07-20 21:24:09', null);
INSERT INTO `sys_image` VALUES ('ea83176c619a47abac0f8577f8b4e9ab', '2d43521f2b1a6d748ae8797eb27e5c6e052a7189133672dee61877b60e0cfb92', 'tomcat:latest', 'tomcat', 'latest', '462483479', '1', null, null, '462483479', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"catalina.sh\\\" \\\"run\\\"]\"]', 'library', '', '2018-07-21 10:53:39', null);
INSERT INTO `sys_image` VALUES ('f0b81513d0e546a9b911b74d9d61b139', 'ed6c3d9914d7008b57645a47f0bb4f33d50e067c5eb41c283438e29b81817965', '<none>:<none>', '<none>', '<none>', '1363351', '1', null, null, '1363351', 'null', null, 'library', '', '2018-07-19 10:55:41', null);
INSERT INTO `sys_image` VALUES ('f8df400ec07a4fe3b77e3e7c1cb2328a', '0706462ea9541c28a078f63b1d7f27407e824ae551b4de37d7f2461f4c115ff7', 'wouterm/helloworld:latest', 'helloworld', 'latest', '17788231', '1', '', null, '17788231', '{}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"ENV MSG=You have not entered a custom message\"]', 'wouterm', '', '2018-07-17 10:14:43', null);

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL COMMENT '操作用户ID',
  `type` int(11) DEFAULT NULL COMMENT '日志类型',
  `description` varchar(255) DEFAULT NULL COMMENT '日志描述',
  `action` varchar(255) DEFAULT NULL COMMENT '请求Url',
  `method` varchar(255) DEFAULT NULL COMMENT '请求方式',
  `ip` varchar(255) DEFAULT NULL COMMENT '访问IP',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `param` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `exception` varchar(255) DEFAULT NULL COMMENT '异常',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('00607ac7afe64940844d7e4769ea57bf', '1231451941131', '23', '删除镜像', '/image/delete/a421f1e10fbe4e6e87bbe439dde3ce37', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', null, '2018-07-16 21:21:19');
INSERT INTO `sys_log` VALUES ('016cf1363f6b47eca917d8ac3ab4b6ba', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:48');
INSERT INTO `sys_log` VALUES ('019835997d2a4b9b8b3a4940a98c37b5', null, '41', '拉取镜像从Hub', null, null, null, null, '', null, '2018-07-16 21:22:12');
INSERT INTO `sys_log` VALUES ('021126a21edf45c9b01bc8e4c2e12c0e', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:13:42');
INSERT INTO `sys_log` VALUES ('02412d501a424df89532c409b19c1dee', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:42');
INSERT INTO `sys_log` VALUES ('027c68e875ab43599e3b6f3d3c770b3f', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:34:29');
INSERT INTO `sys_log` VALUES ('03788e00a26f4f0e980ed1c342b1af62', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 14:28:34');
INSERT INTO `sys_log` VALUES ('03e187dab7ea418387daa963ba038e32', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-13 18:50:39');
INSERT INTO `sys_log` VALUES ('03e7d23211e04e8d9f5443152324af3e', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 10:53:27');
INSERT INTO `sys_log` VALUES ('03fc7284f5be403eb952e94694bb0b16', null, '90', '删除服务', '/ws/undefined', 'GET', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', 'Service not found: zmwxec41kz15os4rjx2k3y60t', '2018-07-18 14:41:02');
INSERT INTO `sys_log` VALUES ('04518778adcc41ef9faaf0a0ecaa9bff', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 20:07:41');
INSERT INTO `sys_log` VALUES ('0474c44432a64e1eb38f30221bdf75aa', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=阿芳&description=asgferhgojjhpkytkujkm', null, '2018-07-14 14:40:15');
INSERT INTO `sys_log` VALUES ('0494e16b42874319a144a93ce8fc6243', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 16:02:11');
INSERT INTO `sys_log` VALUES ('0525bffa19f947b7a54095346f63a37a', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 10:54:47');
INSERT INTO `sys_log` VALUES ('055bf69641a245fba73cc69a4972b02f', null, '24', '从DockerHub拉取镜像', '/monitor/container/actual/fba35fda5b0f274ef5132a5ace51406871d18e4111a7755cb1d78c8c9a4fd6f2', 'GET', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', null, '2018-07-17 11:05:27');
INSERT INTO `sys_log` VALUES ('05a5096d6bdf4ae292a385f803e8d9c2', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 10:46:42');
INSERT INTO `sys_log` VALUES ('0650063ffc3b45c0bcc7848ef94f83ee', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:29');
INSERT INTO `sys_log` VALUES ('0788c9b6aedb4826aceebfeae91c4fe6', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-19 16:00:59');
INSERT INTO `sys_log` VALUES ('080ad90ee2ef487c909a5d37647a9a5a', null, '20', '创建容器', null, null, null, null, '', 'Request error: POST http://192.168.100.30:2375/containers/create: 400, body: {\"message\":\"No command specified\"}\n', '2018-07-17 11:28:21');
INSERT INTO `sys_log` VALUES ('08ff1672544945c9b106ea5e4cfee175', '1241414124156', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1231451941131,213yuyjgdqweyyj,3241tfsegvsds,3241tfsegvsds', null, '2018-07-17 18:08:59');
INSERT INTO `sys_log` VALUES ('09f0eb75dd6a4650a191e4f239b7b931', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131', null, '2018-07-11 15:42:20');
INSERT INTO `sys_log` VALUES ('0a09c546c5e34305a0611d7b8e273021', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36', 'ids=4151361367131', null, '2018-07-09 15:58:37');
INSERT INTO `sys_log` VALUES ('0a0cf6cda7be4677b83e4995c99d5a68', null, '41', '拉取镜像从Hub', null, null, null, null, '', null, '2018-07-17 10:28:26');
INSERT INTO `sys_log` VALUES ('0a5724b613b04ea1abfbdad35ad81a71', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 15:35:52');
INSERT INTO `sys_log` VALUES ('0a5ed2db6c16433daacf611e729fad2b', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-16 11:34:01');
INSERT INTO `sys_log` VALUES ('0b1401fa60e6495ea0ad3236e594fb58', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131', null, '2018-07-11 15:41:54');
INSERT INTO `sys_log` VALUES ('0b3bc858b11d4c7cac37b575c4b248c0', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 15:57:14');
INSERT INTO `sys_log` VALUES ('0b7e93e8d19c46568d019758bce241a1', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:44');
INSERT INTO `sys_log` VALUES ('0cfa951efd30474eb50dd5cc63df3280', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-17 15:05:36');
INSERT INTO `sys_log` VALUES ('0dc8c2f4fead49bcac2268d5be0da342', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', 'Image not found: hello-worl:latest', '2018-07-15 17:29:00');
INSERT INTO `sys_log` VALUES ('0ddf1dd29485472396e69f097bf50ff0', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-20 21:21:35');
INSERT INTO `sys_log` VALUES ('0e29d3bed98a4f03b28ac304a26e71e6', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 09:49:51');
INSERT INTO `sys_log` VALUES ('0f1598d17d4c4f10821cc0a704fbfe09', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=GR&description=AFG', null, '2018-07-14 15:10:17');
INSERT INTO `sys_log` VALUES ('106fe0899ee6443b840a625b48e19cb9', '1231451941131', '60', '创建公共网络', '/network/public/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.5', 'name=sb&driver=bridge', null, '2018-07-18 17:25:56');
INSERT INTO `sys_log` VALUES ('10766e241d7c4eaba9ce3e18a27301c2', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131', null, '2018-07-11 15:29:55');
INSERT INTO `sys_log` VALUES ('11583e06cb324830861e191a7f0fc57d', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 10:54:15');
INSERT INTO `sys_log` VALUES ('1161cf8756f14c879e2e5c47379f5cbf', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=11aa8e60c5a8475fb44a332e60ff95fa&containerName=aaa&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', null, '2018-07-07 15:48:32');
INSERT INTO `sys_log` VALUES ('12460056dda748a7a17f0570e19ca3c2', null, '90', '删除服务', null, null, null, null, '', 'Service not found: 2ffv8g2tvwqsalf8am4na6ujr', '2018-07-18 15:54:20');
INSERT INTO `sys_log` VALUES ('12612bf5fac6414b8adac1e9aefc9f00', 'f4f4bb152cf54fec94eb0d2b22d25f71', '10', '创建项目', '/project/create', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'name=草莓干&description=好吃', null, '2018-07-21 15:55:15');
INSERT INTO `sys_log` VALUES ('132585c96af047539f735c4cecf4844f', null, '40', '上传镜像到Hub', null, null, null, null, '', null, '2018-07-13 20:13:52');
INSERT INTO `sys_log` VALUES ('13808b0a965b4fb7a45b6aeeb8a0be5e', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.2038483326818773484.9999\\work\\Tomcat\\localhost\\ROOT\\upload_c5acf589_e2a1_4362_af85_cd351b8ee81b_00000006.tmp (系统找不到指定的文件。)', '2018-07-19 10:43:42');
INSERT INTO `sys_log` VALUES ('13ef297759a94863a45dc6ef87012aee', '1241414124156', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1249181023313', null, '2018-07-17 10:28:23');
INSERT INTO `sys_log` VALUES ('141098b2b9ff48dda05dfb9434998899', null, '90', '删除服务', null, null, null, null, '', 'Service not found: 2ffv8g2tvwqsalf8am4na6ujr', '2018-07-18 11:35:09');
INSERT INTO `sys_log` VALUES ('14f8319d4dce435a81341a211ead7a3b', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/1', 'DELETE', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-21 12:09:09');
INSERT INTO `sys_log` VALUES ('157a2574585b46aca13918612ba9b397', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:04:48');
INSERT INTO `sys_log` VALUES ('170ca537dd9f44dd8b18c5ab421bd666', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:04');
INSERT INTO `sys_log` VALUES ('19404230c9da48208fa8b8f649494925', 'agfag13131', '60', '创建公共网络', '/network/public/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=aaa&driver=overlay', 'Timeout: POST http://192.168.100.42:2375/networks/create', '2018-07-14 18:11:27');
INSERT INTO `sys_log` VALUES ('194a7b870f7e406a9d538946545e684d', null, '91', '创建服务', null, null, null, null, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 13:43:28');
INSERT INTO `sys_log` VALUES ('1a2b620b5dfd47fdab585b9fc957a46f', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:41:05');
INSERT INTO `sys_log` VALUES ('1ab5eeb60e4844ef9169ff96df9dc36f', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 09:50:00');
INSERT INTO `sys_log` VALUES ('1b5b6b0665194e6fa853fcd9546353b2', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-21 16:06:01');
INSERT INTO `sys_log` VALUES ('1bbae001f28a42b0ab23f06e9e480ee4', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:26:04');
INSERT INTO `sys_log` VALUES ('1bed82bfb42b494d867c4c5685de4433', 'f4f4bb152cf54fec94eb0d2b22d25f71', '23', '删除镜像', '/image/delete/e2a0019cfba0418a85c1b2b1ce21e5c8', 'DELETE', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', null, '2018-07-20 21:04:39');
INSERT INTO `sys_log` VALUES ('1c2ad352ff8445af98ab82466fcfa9d5', '1231451941131', '61', '取消冻结用户', '/user/cancelFreeze', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=13,14', null, '2018-07-13 18:05:26');
INSERT INTO `sys_log` VALUES ('1c469d1a0fb5423e892b5c293148aae3', null, '41', '拉取镜像从Hub', null, null, null, null, '', null, '2018-07-17 11:23:29');
INSERT INTO `sys_log` VALUES ('1c5586a8ab8e41458e87adc828df726f', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.1623626776391959174.9999\\work\\Tomcat\\localhost\\ROOT\\upload_22992a0e_79ea_48cb_bbaa_75a4fc8d96e0_00000003.tmp (系统找不到指定的文件。)', '2018-07-19 10:32:04');
INSERT INTO `sys_log` VALUES ('1ceba38eec0f45f28dc21a9eba975abe', null, '90', '删除服务', null, null, null, null, '', null, '2018-07-19 18:58:36');
INSERT INTO `sys_log` VALUES ('1e0cbf709a54405084fb11a09ce143d6', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71', null, '2018-07-11 16:09:01');
INSERT INTO `sys_log` VALUES ('1e426ce01308491b99880b2af2d6a8e6', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.2038483326818773484.9999\\work\\Tomcat\\localhost\\ROOT\\upload_c5acf589_e2a1_4362_af85_cd351b8ee81b_00000000.tmp (系统找不到指定的文件。)', '2018-07-19 10:39:44');
INSERT INTO `sys_log` VALUES ('1eaec532830646aba4fc8e40c0881882', '1241414124156', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1231451941131,213yuyjgdqweyyj,3241tfsegvsds,3241tfsegvsds,213yuyjgdqweyyj,213yuyjgdqweyyj,1249181...', null, '2018-07-17 18:09:16');
INSERT INTO `sys_log` VALUES ('1fd10e071cf641b7bcd7dd194c07fe77', '1241414124156', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1231451941131,213yuyjgdqweyyj,3241tfsegvsds,3241tfsegvsds,213yuyjgdqweyyj,213yuyjgdqweyyj,1249181...', null, '2018-07-17 18:09:19');
INSERT INTO `sys_log` VALUES ('20c1b97917a64ba884e9b0525f9b8b08', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-15 13:44:51');
INSERT INTO `sys_log` VALUES ('210f382162854422912236382b3c4c42', '1241414124156', '23', '删除镜像', '/image/delete/08e8ead327c84550bf2701adbfbebf25', 'DELETE', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', null, '2018-07-16 21:16:37');
INSERT INTO `sys_log` VALUES ('212e7840538c42d89bd89c8f6d2f8708', '1231451941131', '61', '创建公共网络失败', '/network/public/create', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=1&driver=2&labels=3&hasIpv6=true', 'Plugin not found', '2018-07-17 09:35:51');
INSERT INTO `sys_log` VALUES ('21869a4ca90c4276b3c93769adef5a8f', null, '90', '删除服务', null, null, null, null, '', 'Service not found: zmwxec41kz15os4rjx2k3y60t', '2018-07-18 14:58:05');
INSERT INTO `sys_log` VALUES ('222fce39860e45b6bba9963bfd7713aa', '1231451941131', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=34567189513412,34567189513412', null, '2018-07-16 20:56:13');
INSERT INTO `sys_log` VALUES ('2249b1626c554bb2a49857db42a69a5e', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 10:25:56');
INSERT INTO `sys_log` VALUES ('228cc7d7cc41443b95efddce4010b764', null, '20', '创建容器', null, null, null, null, 'imageId=&containerName=&projectId=&envStr=&portMapStr=', null, '2018-07-21 09:23:04');
INSERT INTO `sys_log` VALUES ('229b5f88d40f4f15a132d488cf4f7c5d', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=阿芳&description=waegfrebehyr方的观点呢', null, '2018-07-14 14:39:43');
INSERT INTO `sys_log` VALUES ('22c92fc9615e4756b6adae38ca45f55d', null, '91', '创建服务', null, null, null, null, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 10:27:37');
INSERT INTO `sys_log` VALUES ('23092b4da96c469c895cfa38d4a5b785', '1241414124156', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1231451941131,213yuyjgdqweyyj,3241tfsegvsds,3241tfsegvsds,213yuyjgdqweyyj,213yuyjgdqweyyj,1249181...', null, '2018-07-17 18:09:11');
INSERT INTO `sys_log` VALUES ('2345c00cd4644ceb922ac72548ebf0e3', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:19');
INSERT INTO `sys_log` VALUES ('23c96c7d0b4d4d58b1dd459e9310a4b2', 'afafaf24131', '11', '删除项目', '/project/delete/3ef12b32f0a04284834cc25d48fa414b', 'DELETE', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', null, '2018-07-14 14:53:30');
INSERT INTO `sys_log` VALUES ('24de149e90754f60816463668b4488f0', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', null, '2018-07-11 16:00:48');
INSERT INTO `sys_log` VALUES ('2514d1bc168c42868f3e9a5287f9cee9', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 13:48:09');
INSERT INTO `sys_log` VALUES ('275e814e0a1840618aca4c1c6b36cfc0', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 16:03:06');
INSERT INTO `sys_log` VALUES ('285221d4c0d943eda9e8ee8be4ab512b', '1231451941131', '23', '删除镜像', '/image/delete/592838bf086d4f6cb6f412e0f859f337', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-13 17:26:54');
INSERT INTO `sys_log` VALUES ('28beb70289094b8f9c8931a24cf12e55', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 15:16:23');
INSERT INTO `sys_log` VALUES ('28ef65ccb2004010bcce84b0bcebafdd', '1241414124156', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=34567189513412', null, '2018-07-16 16:11:30');
INSERT INTO `sys_log` VALUES ('297ef9baf0094ca8a78d8c5e17fbbfb5', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=yu&description=水电站发生', null, '2018-07-14 14:35:42');
INSERT INTO `sys_log` VALUES ('2a0c1ccb36cc4811afebe385934d0bfb', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 10:57:30');
INSERT INTO `sys_log` VALUES ('2a4382f33c4f463c8bfb7b85ff17bb22', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:17:38');
INSERT INTO `sys_log` VALUES ('2acb5642b5ab48ec80c920e1fbb7dc11', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313', null, '2018-07-10 17:02:50');
INSERT INTO `sys_log` VALUES ('2ae663d461d5439b919edad9a781d982', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-15 14:17:31');
INSERT INTO `sys_log` VALUES ('2af6929e67fb48e289cc4f6dc02dbde8', '1231451941131', '22', '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-07 16:16:40');
INSERT INTO `sys_log` VALUES ('2dfe8c522c6c48d8bf184da6810e1a3b', 'f4f4bb152cf54fec94eb0d2b22d25f71', '21', '删除容器', '/container/delete/168b7deb35332e3659fa61e4b9a9d7ea229a8641b44ab88263595562887382d9', 'DELETE', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-10 20:25:24');
INSERT INTO `sys_log` VALUES ('2ee4456040b642ee867e0026092d5e15', 'f4f4bb152cf54fec94eb0d2b22d25f71', '26', '导入镜像', '/service/inspect/', 'GET', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.3517905718305254609.9999\\work\\Tomcat\\localhost\\ROOT\\upload_f738579e_979a_45ec_9c59_a25f405a9e0e_00000003.tmp (系统找不到指定的文件。)', '2018-07-19 10:37:55');
INSERT INTO `sys_log` VALUES ('2f319e9a99f74c8b840f9728d5800565', null, '20', '创建容器', null, null, null, null, 'imageId=&containerName=&projectId=&portMapStr=&destinationStr=', null, '2018-07-21 11:29:54');
INSERT INTO `sys_log` VALUES ('2fd0005bc24a458ca1f3c7ed36ed5f8a', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=挂号&description=双方共同', null, '2018-07-14 15:10:04');
INSERT INTO `sys_log` VALUES ('3031375853f64afebcf612632d48fa48', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313', null, '2018-07-11 15:41:59');
INSERT INTO `sys_log` VALUES ('30c538f352f14568a75850fdb1a7c99c', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', '读取容器状态异常', '2018-07-13 15:06:42');
INSERT INTO `sys_log` VALUES ('30f35c24913e4ed8a31bd060778b1b01', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 19:51:52');
INSERT INTO `sys_log` VALUES ('31304ba17dba4e22aa271cbbc7f702d9', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:41');
INSERT INTO `sys_log` VALUES ('31d3eff2b59e48d3a6997c325976c19a', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=babababba&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', null, '2018-07-07 15:46:16');
INSERT INTO `sys_log` VALUES ('329a6c0557564286886b1bfc7218f472', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:13:10');
INSERT INTO `sys_log` VALUES ('32eb03ff96a340e7b68b87206b98ad66', 'f4f4bb152cf54fec94eb0d2b22d25f71', '24', '从DockerHub拉取镜像', '/image/pull/hub', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageName=nginx', null, '2018-07-12 14:10:08');
INSERT INTO `sys_log` VALUES ('34e12f4db4234ed483a1177136f88f77', '1231451941131', '61', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', null, '2018-07-11 16:18:17');
INSERT INTO `sys_log` VALUES ('35787bcb0ed940339225864f403fa260', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-16 11:31:21');
INSERT INTO `sys_log` VALUES ('36aeea8058354f708e8a0f960c5fae6b', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:12:37');
INSERT INTO `sys_log` VALUES ('36c5da16c28d42a4ae7bfaabc5c4a890', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.2038483326818773484.9999\\work\\Tomcat\\localhost\\ROOT\\upload_c5acf589_e2a1_4362_af85_cd351b8ee81b_00000003.tmp (系统找不到指定的文件。)', '2018-07-19 10:40:25');
INSERT INTO `sys_log` VALUES ('36edabde4b0345dfaf45e2e8db49067d', 'afaba31231451', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1249181023313,1249181023313,213yuyjgdqweyyj,213yuyjgdqweyyj', null, '2018-07-18 08:47:48');
INSERT INTO `sys_log` VALUES ('36f2fca76f7e4e149d8784c5b0cb0a2c', null, '90', '删除服务', null, null, null, null, '', null, '2018-07-15 09:49:02');
INSERT INTO `sys_log` VALUES ('388f06f9f86c485a890c0c9988e95b96', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=昂热润滑油&description=昂如虎添翼', null, '2018-07-14 15:09:50');
INSERT INTO `sys_log` VALUES ('38e1410510254bfab2d896f6121d67a3', '213yuyjgdqweyyj', '62', '创建个人网络', '/network/self/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=JIT123WXS&driver=overlay', null, '2018-07-14 19:52:46');
INSERT INTO `sys_log` VALUES ('3907d4b115544b23b2724552848474d8', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-21 16:05:55');
INSERT INTO `sys_log` VALUES ('39917f8b0001437cb65196de3172be37', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 15:56:09');
INSERT INTO `sys_log` VALUES ('3a42dab955aa488a842541c7fbd4b87d', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 19:44:57');
INSERT INTO `sys_log` VALUES ('3acd1624f7f348e69f274b481538b9f1', null, '91', '创建服务', null, null, null, null, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 12:19:31');
INSERT INTO `sys_log` VALUES ('3ae70a376710427aa4c6f8b0c73f52d3', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:01:54');
INSERT INTO `sys_log` VALUES ('3af1d99b6cba408eba8d5c100bfb8a91', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-15 14:30:00');
INSERT INTO `sys_log` VALUES ('3b244834ceab47c9bdcc90261af1b2dd', null, '24', '从DockerHub拉取镜像', null, null, null, null, 'imageName=', null, '2018-07-21 10:53:37');
INSERT INTO `sys_log` VALUES ('3b2bb3cf4aaf4e9ca54038e936243419', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=feawafqef&description=avwfvv', null, '2018-07-14 14:02:49');
INSERT INTO `sys_log` VALUES ('3ba92d384b164107926de0d9aea19c79', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.2742496294047994950.9999\\work\\Tomcat\\localhost\\ROOT\\upload_39ad8238_e8d2_4746_99b4_73ea87a1954f_00000009.tmp (系统找不到指定的文件。)', '2018-07-19 10:08:16');
INSERT INTO `sys_log` VALUES ('3bf18ac1eff345b996d8aefde2703e26', '1231451941131', '23', '删除镜像', '/image/delete/9728b90629ed48beb769c6d2c3183683', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', null, '2018-07-17 08:51:10');
INSERT INTO `sys_log` VALUES ('3bf7f399bb47420ab2a5698599c616cf', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:25');
INSERT INTO `sys_log` VALUES ('3c868bba55eb498590e3c154490de816', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=qqqqqq&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 11:34:29');
INSERT INTO `sys_log` VALUES ('3c8b1f80960f457196cb2640ac291948', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 11:01:02');
INSERT INTO `sys_log` VALUES ('3d635ad7f2eb43448de240b389d3019c', '1231451941131', '23', '删除镜像', '/image/delete/55122bf050904da79f143193cb20647b', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', null, '2018-07-12 14:04:56');
INSERT INTO `sys_log` VALUES ('3f11ccf5472640818f0c4f9adc08b8ed', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'D:\\pass_test\\paas\\paas\\data\\tmp\\upload_604e6bbc_3fb7_4be8_8e29_a9a80fc43fb6_00000003.tmp (系统找不到指定的文件。)', '2018-07-19 10:26:06');
INSERT INTO `sys_log` VALUES ('3f22d71a5a6d4a35b1d39a84838e4a7f', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:28');
INSERT INTO `sys_log` VALUES ('40a02e4be20b4b369674bd42fd355eea', null, '90', '删除服务', null, null, null, null, '', 'Service not found: 2ffv8g2tvwqsalf8am4na6ujr', '2018-07-18 14:15:00');
INSERT INTO `sys_log` VALUES ('40a31f58d3614744a66abb5ac4b802c5', '1231451941131', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f7...', null, '2018-07-16 21:36:29');
INSERT INTO `sys_log` VALUES ('40a5053a55e74fb18a94ef2950a0f435', 'agfag13131', '60', '创建公共网络', '/network/public/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=123&driver=host', 'Request error: POST http://192.168.100.30:2375/networks/create: 403, body: {\"message\":\"only one instance of \\\"host\\\" network is allowed\"}\n', '2018-07-14 17:54:55');
INSERT INTO `sys_log` VALUES ('40be9034d91f4335947982d60ef46fc9', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', null, '2018-07-10 17:02:58');
INSERT INTO `sys_log` VALUES ('4152a49d315b42d5b1fc1784fc74081a', 'f4f4bb152cf54fec94eb0d2b22d25f71', '25', '上传镜像到DockerHub', '/image/push', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=fe597270fe0b4ab581427edef523fe24&username=jitwxs&password=', 'Image push failed: jitwxs/hello-world: ProgressMessage{id=null, status=null, stream=null, error=unauthorized: incorrect username or password, progress=null, progressDetail=null}', '2018-07-13 16:45:57');
INSERT INTO `sys_log` VALUES ('4175ee868e7b4f7a8f34f45f37217581', '1231451941131', '61', '创建公共网络失败', '/network/public/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.5', 'name=sb&driver=overlay', 'Request error: POST http://192.168.100.30:2375/networks/create: 500, body: {\"message\":\"This node is not a swarm manager. Use \\\"docker swarm init\\\" or \\\"docker swarm join\\\" to connect this node to swarm and try again.\"}\n', '2018-07-18 17:21:32');
INSERT INTO `sys_log` VALUES ('41c12b88ad5c4954af649b51f1009295', '1231451941131', '62', '删除网络失败', '/network/delete/642c9197063a42e6151d49f05ce45c8585665b03ee4c3ec22eb5a38a30b9137f', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', 'Request error: DELETE http://192.168.100.30:2375/networks/642c9197063a42e6151d49f05ce45c8585665b03ee4c3ec22eb5a38a30b9137f: 403, body: {\"message\":\"bridge is a pre-defined network and cannot be removed\"}\n', '2018-07-15 21:21:45');
INSERT INTO `sys_log` VALUES ('44d3c213e814464db5ecf58d26747914', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-16 08:42:04');
INSERT INTO `sys_log` VALUES ('450da1ec89df4a458a35ec862dd0b416', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 19:32:47');
INSERT INTO `sys_log` VALUES ('467adb5793f042ba83ab1e53659f4bdc', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:59:06');
INSERT INTO `sys_log` VALUES ('46af189915c64df08c015565051bd83b', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:13:55');
INSERT INTO `sys_log` VALUES ('46cdd62151004b5a98d961ea0f2f71dd', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/2', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-16 14:34:14');
INSERT INTO `sys_log` VALUES ('473de54431f042e287a79d30695caa51', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 16:02:36');
INSERT INTO `sys_log` VALUES ('4767c664cb7c477bb472a1b3bd29ca2e', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1231451941131,4151361367131', null, '2018-07-10 17:01:31');
INSERT INTO `sys_log` VALUES ('480c077affaa4c13b44213b6c817ef8c', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:59:44');
INSERT INTO `sys_log` VALUES ('489fd7cda8ca4fec8d1c5aec9b498d4f', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=77359933164a459a89485d9e32c2ac40&containerName=biubiubiu&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', null, '2018-07-07 15:40:58');
INSERT INTO `sys_log` VALUES ('49be561f14c34e34a29d0270a3c3dee9', null, '91', '创建服务', null, null, null, null, '', 'Request error: POST http://192.168.100.42:2375/services/create: 500, body: {\"message\":\"rpc error: code = Unknown desc = name conflicts with an existing object\"}\n', '2018-07-16 14:32:59');
INSERT INTO `sys_log` VALUES ('49c6a290364849a3919a2815ede7bf11', 'afaba31231451', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=213yuyjgdqweyyj', null, '2018-07-17 17:12:55');
INSERT INTO `sys_log` VALUES ('49f199d8cc0749afa05be9112c1b7ec9', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 15:59:21');
INSERT INTO `sys_log` VALUES ('4a400f4b34854e1da93a0141ad3768bd', '1241414124156', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1249181023313,213yuyjgdqweyyj', null, '2018-07-17 10:28:36');
INSERT INTO `sys_log` VALUES ('4aeaa3e317124fa1bb7804780d5030d4', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', null, '2018-07-10 17:03:32');
INSERT INTO `sys_log` VALUES ('4b0d92e45d6444a488a9f7d5387256fa', '1231451941131', '50', '清理数据卷', '/volumes/clean/2', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', null, '2018-07-16 15:46:01');
INSERT INTO `sys_log` VALUES ('4c6b6b97ebc44c90be0330b66210e9cf', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/2', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-16 14:41:59');
INSERT INTO `sys_log` VALUES ('4d2aa92c642643dd9dc2251a2f8105fe', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:34');
INSERT INTO `sys_log` VALUES ('4dcf43f479bb4610be4e7e2bf9558ee9', 'f4f4bb152cf54fec94eb0d2b22d25f71', '24', '从DockerHub拉取镜像', '/image/pull/hub', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageName=nginx', null, '2018-07-12 14:04:22');
INSERT INTO `sys_log` VALUES ('4f0444fd38e842c4b03393331be6a970', null, '90', '删除服务', null, null, null, null, '', null, '2018-07-18 14:57:54');
INSERT INTO `sys_log` VALUES ('4f3b0b522ea6482c947e9f0004b8769e', '1241414124156', '23', '删除镜像', '/image/delete/04cc56b83ec84e66be22d224859fec63', 'DELETE', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', null, '2018-07-16 21:14:39');
INSERT INTO `sys_log` VALUES ('4ffa6fdd580445f8be62df24cd7af510', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-17 11:29:19');
INSERT INTO `sys_log` VALUES ('50c219149c50418e8bb0c94d5c545822', '213yuyjgdqweyyj', '63', '创建个人网络失败', '/network/self/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=jit-wxs&driver=overlay', 'Request error: POST http://192.168.100.42:2375/networks/create: 400, body: {\"message\":\"rpc error: code = InvalidArgument desc = name must be valid as a DNS name component\"}\n', '2018-07-14 19:40:44');
INSERT INTO `sys_log` VALUES ('50c64472ce4e40a18152e8831ee255f9', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 14:43:00');
INSERT INTO `sys_log` VALUES ('517178696cdf44398012a4557d99b7c9', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 14:29:57');
INSERT INTO `sys_log` VALUES ('51a957ab27124f9a8d266a62d8a8ddca', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:12:28');
INSERT INTO `sys_log` VALUES ('51b67c445505407d89309415049d3c80', 'f4f4bb152cf54fec94eb0d2b22d25f71', '10', '创建项目', '/project/create', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'name=项目t&description=qqqq', null, '2018-07-21 13:57:02');
INSERT INTO `sys_log` VALUES ('54191b7eac33440998a39942b934b557', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-19 15:47:29');
INSERT INTO `sys_log` VALUES ('548ab9afa8694883ba37abca81406097', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', null, '2018-07-11 16:18:24');
INSERT INTO `sys_log` VALUES ('54bf27c3f4934bbf966609a85ae91477', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,4151361367131', null, '2018-07-11 12:30:56');
INSERT INTO `sys_log` VALUES ('54e17b54ec254572b9f740a3209f4390', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', '读取容器状态异常', '2018-07-13 15:04:46');
INSERT INTO `sys_log` VALUES ('5522818eef6d45ec84f3980eac2be629', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', 'Timeout: POST http://192.168.100.30:2375/images/create?fromImage=umeshw%2Fubantu&tag=latest', '2018-07-16 20:58:00');
INSERT INTO `sys_log` VALUES ('5596a1278dbe4418afd84093927b93c6', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 10:52:31');
INSERT INTO `sys_log` VALUES ('55bef953f06d424a96c53c7b5e00f99e', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-20 21:23:26');
INSERT INTO `sys_log` VALUES ('55ced47a6f95432bb3c2ee7d84d47397', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=5预计可露露&description=阿尔冯大Vv', null, '2018-07-14 14:41:37');
INSERT INTO `sys_log` VALUES ('55cf2809ee684eb4abd10246a387713a', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/1', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-16 14:42:03');
INSERT INTO `sys_log` VALUES ('55ef9ad53f6a4b539849b6941baccb83', 'afaba31231451', '23', '删除镜像', '/image/delete/f7b5b0f3d1894439b526a44978fd62f5', 'DELETE', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-21 17:11:40');
INSERT INTO `sys_log` VALUES ('56469c0823e6451e93a7b95f2a46e266', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/2', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-16 14:16:36');
INSERT INTO `sys_log` VALUES ('56b989af0bf24e4889a7778902df464e', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:07:16');
INSERT INTO `sys_log` VALUES ('577eb9e1886f44ff9893148687041218', null, '91', '创建服务', null, null, null, null, '', 'Request error: POST http://192.168.100.42:2375/services/create: 500, body: {\"message\":\"rpc error: code = Unknown desc = name conflicts with an existing object\"}\n', '2018-07-18 14:35:31');
INSERT INTO `sys_log` VALUES ('57e06f36faa14484ad07753c81371776', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-16 15:04:40');
INSERT INTO `sys_log` VALUES ('580ba7aa839b4ed9935aabdca953af4a', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:36:50');
INSERT INTO `sys_log` VALUES ('58244a7cba284550b50ab7f00ab5354c', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.1623626776391959174.9999\\work\\Tomcat\\localhost\\ROOT\\upload_22992a0e_79ea_48cb_bbaa_75a4fc8d96e0_00000006.tmp (系统找不到指定的文件。)', '2018-07-19 10:32:26');
INSERT INTO `sys_log` VALUES ('585c2ba7a3404e4e97388581c2375813', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=fe597270fe0b4ab581427edef523fe24&containerName=Hello-World二号&projectId=aabakfsvakiuw1213', null, '2018-07-13 15:22:50');
INSERT INTO `sys_log` VALUES ('58657a1a715f41b7a33c0a09b1aff730', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=11aa8e60c5a8475fb44a332e60ff95fa&containerName=bbb&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', null, '2018-07-07 16:10:44');
INSERT INTO `sys_log` VALUES ('58b9f18519364072b3486757982962f9', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:19');
INSERT INTO `sys_log` VALUES ('58bce1ce846046adbeb15246f80a5eb4', null, '91', '创建服务', null, null, null, null, '', 'Request error: POST http://192.168.100.42:2375/services/create: 400, body: {\"message\":\"rpc error: code = InvalidArgument desc = port \'15666\' is already in use by service \'afafaf24131-serviceLC\' (ia48vlpaz8aib1zhxuzygstja) as an ingress port\"}\n', '2018-07-16 15:05:32');
INSERT INTO `sys_log` VALUES ('5903638c28074cc5be7ffe2929ebca01', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=3ece2db9a8cf4917a856b8161c8f9a7f&containerName=哇咔咔的容器&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 11:05:24');
INSERT INTO `sys_log` VALUES ('591a3ca42fcd4592abe83665f125b123', null, '20', '创建容器', null, null, null, null, 'type=&imageId=&containerName=&projectId=', 'Request error: POST http://192.168.100.30:2375/containers/create: 400, body: {\"message\":\"No command specified\"}\n', '2018-07-17 17:10:33');
INSERT INTO `sys_log` VALUES ('5a66c269ac01412993bb82ef3ba0510f', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-17 15:35:15');
INSERT INTO `sys_log` VALUES ('5b6e6b04a5274f54a9faddc3f9b61914', '1241414124156', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1231451941131,213yuyjgdqweyyj,3241tfsegvsds,3241tfsegvsds,213yuyjgdqweyyj,213yuyjgdqweyyj,1249181...', null, '2018-07-17 18:09:23');
INSERT INTO `sys_log` VALUES ('5b74772052d541548c94fef657e4e9f5', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-17 10:49:11');
INSERT INTO `sys_log` VALUES ('5b909ea1928f49e2834d247ae1487cd6', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 14:32:08');
INSERT INTO `sys_log` VALUES ('5bb4c68f84bc4f8b8cf41f9bd1b265d9', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 11:04:41');
INSERT INTO `sys_log` VALUES ('5cc65d49584b48c396c2f99c13a990da', null, '41', '拉取镜像从Hub', null, null, null, null, '', null, '2018-07-21 17:11:45');
INSERT INTO `sys_log` VALUES ('5d92e312c1d944559e133c3a2680d99a', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 10:36:50');
INSERT INTO `sys_log` VALUES ('5e33087cc7be48dd99d4d389376c67a7', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 11:03:07');
INSERT INTO `sys_log` VALUES ('5f88f1716ff34e86985a915ce2173e13', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:33:50');
INSERT INTO `sys_log` VALUES ('607af60f0a154c41bffa8fdf252fd1f7', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-19 19:04:35');
INSERT INTO `sys_log` VALUES ('61c70384783640bda0e06dae4c85fa57', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'D:\\pass_test\\paas\\paas\\data\\tmp\\upload_604e6bbc_3fb7_4be8_8e29_a9a80fc43fb6_00000006.tmp (系统找不到指定的文件。)', '2018-07-19 10:26:36');
INSERT INTO `sys_log` VALUES ('63b06a479c1b4e9fb07cd5efb8ac823c', null, '91', '创建服务', null, null, null, null, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 10:40:46');
INSERT INTO `sys_log` VALUES ('63cf60083e2940419c712fd8b08b4477', 'f4f4bb152cf54fec94eb0d2b22d25f71', '11', '删除项目', '/project/delete/6860df07dd1445228ff21d53eb18be65', 'DELETE', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', null, '2018-07-20 21:25:56');
INSERT INTO `sys_log` VALUES ('6408394f797145c0b53facadc9a8f8fe', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 15:01:16');
INSERT INTO `sys_log` VALUES ('6490e7941eeb42379b80415a73b60221', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-21 16:05:59');
INSERT INTO `sys_log` VALUES ('64baf2db09e3455fb0f2a5652d9c9f8a', 'f4f4bb152cf54fec94eb0d2b22d25f71', '21', '删除容器', '/container/delete/238ddaaeee6a18006cedc6fe586a79a2dbd1d4b9c6fe9ef1288943688c536aa6', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-13 15:28:59');
INSERT INTO `sys_log` VALUES ('65a0f1fa6e95446690528f6d622288f3', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 10:52:22');
INSERT INTO `sys_log` VALUES ('666c19d6959e4c65b5e5dbe075f24526', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-18 14:14:17');
INSERT INTO `sys_log` VALUES ('6681860a5d71486e8bc8a68a58586dd7', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:36');
INSERT INTO `sys_log` VALUES ('6748a304402d455fa29cd9ec516326da', 'afafaf24131', '11', '删除项目', '/project/delete/5f7abd6bc8ed473ca268d9c0373a13a4', 'DELETE', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', null, '2018-07-14 14:54:03');
INSERT INTO `sys_log` VALUES ('675b99becf8247e68551cb1d2dbfb7bc', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-20 15:19:44');
INSERT INTO `sys_log` VALUES ('677410d57ec649c18a1bce002fd69464', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:33:56');
INSERT INTO `sys_log` VALUES ('688b7cf9343840549e873565391bba75', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=哈哈哈gege&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 11:27:16');
INSERT INTO `sys_log` VALUES ('68ccc19c3d7f41d19cc26132dfcc58a2', null, '41', '拉取镜像从Hub', null, null, null, null, '', null, '2018-07-17 11:21:11');
INSERT INTO `sys_log` VALUES ('68d657992f814f0c83f1cabdeae0ceac', '1231451941131', '23', '删除镜像', '/image/delete/e01877347bf642de9f4ba38ea241a1eb', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', null, '2018-07-17 11:18:19');
INSERT INTO `sys_log` VALUES ('6a9e1cf07f5a48139d1538e9e56fa536', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-16 15:13:30');
INSERT INTO `sys_log` VALUES ('6b2c79d3cfb049aca428f5d0712379cf', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-20 21:24:09');
INSERT INTO `sys_log` VALUES ('6c35a2c09fb2433dba2e0637159fa7bf', 'f4f4bb152cf54fec94eb0d2b22d25f71', '91', '创建服务', '/service/6860df07dd1445228ff21d53eb18be65/list', 'GET', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', 'Request error: POST http://192.168.100.42:2375/services/create: 500, body: {\"message\":\"rpc error: code = Unknown desc = name conflicts with an existing object\"}\n', '2018-07-18 14:35:31');
INSERT INTO `sys_log` VALUES ('6ca5bf6bc0ef453283235498a771c051', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=我是哈哈哈&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 11:25:16');
INSERT INTO `sys_log` VALUES ('6cf7b59a00a4483383aba5afe9e6b067', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-20 10:16:59');
INSERT INTO `sys_log` VALUES ('6d256ffeb87842068572d38dc4c62304', '1231451941131', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', null, '2018-07-16 21:25:54');
INSERT INTO `sys_log` VALUES ('6e366aabeb56401abdaf47ef0f7487c0', null, '90', '删除服务', null, null, null, null, '', 'Service not found: wktcwjrpepveoeo6pjqmp6k3n', '2018-07-18 14:29:04');
INSERT INTO `sys_log` VALUES ('6f3a00e57b714301a28fca17338fb6b8', '1241414124156', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1231451941131,213yuyjgdqweyyj,3241tfsegvsds,3241tfsegvsds,213yuyjgdqweyyj', null, '2018-07-17 18:09:04');
INSERT INTO `sys_log` VALUES ('6f6e3ce0d886412c8e8f54c2fa881a93', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=二个人体会局认可&description=热乎若拖亏咯偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶', null, '2018-07-14 15:09:58');
INSERT INTO `sys_log` VALUES ('706acd3f19f9462bb1429d2ffa71e01c', 'afaba31231451', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1231451941131,1241414124156,1249181023313,213yuyjgdqweyyj,34567189513412,34567189513412', null, '2018-07-16 15:42:18');
INSERT INTO `sys_log` VALUES ('707f7a906a034ec480d155de607340d2', '1241414124156', '23', '删除镜像', '/image/delete/29952c38f59d44419f9d2cdaa8213b9f', 'DELETE', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', null, '2018-07-16 21:14:36');
INSERT INTO `sys_log` VALUES ('70b66d87ba4c4af29efd4afba02ab56d', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-18 14:14:38');
INSERT INTO `sys_log` VALUES ('714e387daade47cd934008dda7f6ef23', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:23');
INSERT INTO `sys_log` VALUES ('717f268042e64843a9ce9f4bd9ec272e', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=ppppp&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 14:12:28');
INSERT INTO `sys_log` VALUES ('73459aa1fc284c4cb67f58a9113ab2b8', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 11:26:12');
INSERT INTO `sys_log` VALUES ('73753b4befaa479583fc6f775c6b8fa2', '1241414124156', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1231451941131,213yuyjgdqweyyj,3241tfsegvsds', null, '2018-07-17 18:08:53');
INSERT INTO `sys_log` VALUES ('738dfce71f4046ac8eb6024a41171316', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 10:37:58');
INSERT INTO `sys_log` VALUES ('73f19d5aa3bd48d7adbfde54a20ad109', null, '41', '拉取镜像从Hub', null, null, null, null, '', null, '2018-07-13 20:20:37');
INSERT INTO `sys_log` VALUES ('7431795689964934be25460daaacbeb5', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-21 11:09:33');
INSERT INTO `sys_log` VALUES ('74cd6635619c4e21b31745a00f3fd5f5', '1231451941131', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,34567189513412,34567189513412', null, '2018-07-16 21:26:36');
INSERT INTO `sys_log` VALUES ('74e62caef8b443cd860dc9ce77dd4619', 'afaba31231451', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1249181023313,1249181023313,213yuyjgdqweyyj,213yuyjgdqweyyj,3241tfsegvsds', null, '2018-07-18 08:47:51');
INSERT INTO `sys_log` VALUES ('7511658782924dbdb7ce735e9e850c06', 'f4f4bb152cf54fec94eb0d2b22d25f71', '21', '删除容器', '/container/delete/238ddaaeee6a18006cedc6fe586a79a2dbd1d4b9c6fe9ef1288943688c536aa6', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-13 15:28:59');
INSERT INTO `sys_log` VALUES ('75beebfbb8d64855bf34a557f4b5ad73', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', '读取容器状态异常', '2018-07-13 15:00:40');
INSERT INTO `sys_log` VALUES ('7630a780e471450a9d61f07cab23ddd7', 'f4f4bb152cf54fec94eb0d2b22d25f71', '24', '从DockerHub拉取镜像', '/image/pull/hub', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageName=hello-world', null, '2018-07-12 14:04:35');
INSERT INTO `sys_log` VALUES ('767ff062d73348058c326af78674b327', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', null, '2018-07-11 16:17:26');
INSERT INTO `sys_log` VALUES ('771cf1f748c5482a96ab4e367d0832d1', '1231451941131', '23', '删除镜像', '/image/delete/fe597270fe0b4ab581427edef523fe24', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-13 17:05:01');
INSERT INTO `sys_log` VALUES ('7787c70ded15443f92e263f6e0c0870b', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-20 18:21:08');
INSERT INTO `sys_log` VALUES ('77b46312a76240abb535517ff66fda07', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 19:46:31');
INSERT INTO `sys_log` VALUES ('77f90edfce01472cb89018eeaa9e0eb2', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 11:02:11');
INSERT INTO `sys_log` VALUES ('7957d402acb443cc841d2508dd264fc2', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:24:52');
INSERT INTO `sys_log` VALUES ('7b987e8d49024c44961249e056b7684d', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:36:56');
INSERT INTO `sys_log` VALUES ('7bc5fb41fa204e0ba6f46fd27c9de6ff', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:03');
INSERT INTO `sys_log` VALUES ('7bfa49354cb04c9ea15e5fffef3de0ae', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-17 15:12:30');
INSERT INTO `sys_log` VALUES ('7c1a908313eb461c857625dac695dff0', '1231451941131', '22', '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-07 14:55:48');
INSERT INTO `sys_log` VALUES ('7c4d8d6e05d04a75a91d0324416895a5', '1231451941131', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,34567189513412', null, '2018-07-16 21:26:03');
INSERT INTO `sys_log` VALUES ('7c69dc875e0e4d179aa092ca9acbbe6e', null, '91', '创建服务', null, null, null, null, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 12:18:36');
INSERT INTO `sys_log` VALUES ('7cb84b57db1f40b68ae8fe85a2e66c1c', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.8195093750637046732.9999\\work\\Tomcat\\localhost\\ROOT\\upload_bde3df61_5dce_4316_a1e0_1139b293d508_00000000.tmp (系统找不到指定的文件。)', '2018-07-19 10:39:01');
INSERT INTO `sys_log` VALUES ('7d41e9c7168d4c79a93176a26e1d369e', '1241414124156', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1231451941131,213yuyjgdqweyyj,3241tfsegvsds,3241tfsegvsds,213yuyjgdqweyyj,213yuyjgdqweyyj', null, '2018-07-17 18:09:07');
INSERT INTO `sys_log` VALUES ('7dda6ba9926b405d9c38ef20e261f423', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:32');
INSERT INTO `sys_log` VALUES ('7e0c6484d8bf46cc8de327a5eacb10c4', '1231451941131', '61', '创建公共网络失败', '/network/public/create', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=1&driver=2&labels=3&hasIpv6=true', 'Plugin not found', '2018-07-17 09:35:40');
INSERT INTO `sys_log` VALUES ('7f4bd9625f5c464cabfedfcdc2865db0', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:29:39');
INSERT INTO `sys_log` VALUES ('801d0b7c17f54a44913dcad18ffe4ae7', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 20:17:29');
INSERT INTO `sys_log` VALUES ('809fea86d387458594f22cd434fa86a6', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-19 19:04:17');
INSERT INTO `sys_log` VALUES ('80aefe50607c4b28a31c1b90e30b2bbf', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&projectId=6860df07dd1445228ff21d53eb18be65&containerName=测试专用', null, '2018-07-10 08:44:59');
INSERT INTO `sys_log` VALUES ('80c753a7d6e94e5ebc99045083cdde15', 'afaba31231451', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1231451941131,1231451941131,1231451941131,1249181023313,1231451941131,1249181023313,213yuyjgdqwey...', null, '2018-07-18 08:43:18');
INSERT INTO `sys_log` VALUES ('812631256e38499b9f0f66cb311321e7', 'afaba31231451', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=213yuyjgdqweyyj', null, '2018-07-18 08:46:06');
INSERT INTO `sys_log` VALUES ('8173f98473a34c3797a3645aee42e8a8', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 14:10:05');
INSERT INTO `sys_log` VALUES ('81dfeb21332342eaa6f48a95501fd46a', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=AERGG&description=AFGG', null, '2018-07-14 15:10:21');
INSERT INTO `sys_log` VALUES ('821c6019219546b89070214afa5af58f', null, '41', '拉取镜像从Hub', null, null, null, null, '', null, '2018-07-17 11:27:19');
INSERT INTO `sys_log` VALUES ('8246f1496212478899d283c65ab7134a', null, '25', '上传镜像到DockerHub', null, null, null, null, '', null, '2018-07-13 17:02:23');
INSERT INTO `sys_log` VALUES ('834176d528264125aff4b41c0bfc9325', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'D:\\temp\\upload_eb796e25_4f98_42ae_be5d_f1274c4337f6_00000000.tmp (系统找不到指定的文件。)', '2018-07-19 10:14:59');
INSERT INTO `sys_log` VALUES ('8384e9890f3f4973ace61e454b5d039d', '1231451941131', '61', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,124...', null, '2018-07-11 16:19:04');
INSERT INTO `sys_log` VALUES ('83eda9b8ea894ef58be9b9b72b012242', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', null, '2018-07-10 17:02:30');
INSERT INTO `sys_log` VALUES ('8476613fe42143fcb808a738d7d79d14', null, '90', '删除服务', null, null, null, null, '', null, '2018-07-15 09:55:47');
INSERT INTO `sys_log` VALUES ('847abbad81a946638c1bde769353831b', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:14:31');
INSERT INTO `sys_log` VALUES ('8526bfe414a449dc99e06ac40d73bc3d', null, '24', '从DockerHub拉取镜像', null, null, null, null, 'imageName=', null, '2018-07-21 10:07:07');
INSERT INTO `sys_log` VALUES ('859147fb4e854d03934e72ed53c630d0', 'agfag13131', '60', '创建公共网络', '/network/public/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=create_test&driver=overlay', null, '2018-07-14 19:27:12');
INSERT INTO `sys_log` VALUES ('859952c8f18249938d3af0d27ba02218', null, '90', '删除服务', null, null, null, null, '', 'Service not found: 2ffv8g2tvwqsalf8am4na6ujr', '2018-07-18 14:25:34');
INSERT INTO `sys_log` VALUES ('85b83c407069406f98af85b23175d86c', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=ooooooooooooooooo&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 14:10:19');
INSERT INTO `sys_log` VALUES ('864accf02379418aa0efa5907a2a911c', 'afaba31231451', '26', '导入镜像', '/container/top/undefined', 'GET', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=&tag=', 'D:\\pass_test\\paas\\paas\\data\\tmp\\upload_47a7a282_3351_462c_8406_e74f92ee8008_00000000.tmp (系统找不到指定的文件。)', '2018-07-19 10:17:39');
INSERT INTO `sys_log` VALUES ('868b51d5ff4646f4a4fc63c70a24faea', '1231451941131', '61', '创建公共网络失败', '/network/public/create', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=1&driver=2&labels=&hasIpv6=', 'Plugin not found', '2018-07-17 09:36:55');
INSERT INTO `sys_log` VALUES ('86cb6f16eef14f65a5cf69df06d7a502', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:36:53');
INSERT INTO `sys_log` VALUES ('879516b2264842abb7bffaa4e44d7b62', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.1623626776391959174.9999\\work\\Tomcat\\localhost\\ROOT\\upload_22992a0e_79ea_48cb_bbaa_75a4fc8d96e0_00000000.tmp (系统找不到指定的文件。)', '2018-07-19 10:27:48');
INSERT INTO `sys_log` VALUES ('8a5cc682a94942579a2ba0f03fab7112', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-16 11:20:12');
INSERT INTO `sys_log` VALUES ('8a6a85f6463b47319e6ff1b4e90c9162', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,4151361367131', null, '2018-07-11 12:31:06');
INSERT INTO `sys_log` VALUES ('8a7a8eda1f444b6493ad8b7c119aa4a0', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-15 14:27:33');
INSERT INTO `sys_log` VALUES ('8b293a765289412a9b60a0c73066a2f1', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-20 21:45:38');
INSERT INTO `sys_log` VALUES ('8b63bfc894a14e3abefc52293c85d313', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 14:35:31');
INSERT INTO `sys_log` VALUES ('8b9d57b278a54e279df8579f4ec4c6b9', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', 'Image not found: helloworld:latest', '2018-07-20 10:07:22');
INSERT INTO `sys_log` VALUES ('8bcd4ba3eac9438392d7aa940b4090eb', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71', null, '2018-07-11 16:17:15');
INSERT INTO `sys_log` VALUES ('8c05dfb1644649eda6f7207c6e5c3139', 'afaba31231451', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1249181023313', null, '2018-07-18 08:47:38');
INSERT INTO `sys_log` VALUES ('8c569629e2d5479aa4fd79d26263df68', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=大概&description=非', null, '2018-07-14 15:10:10');
INSERT INTO `sys_log` VALUES ('8c571507383345f0ae594aea944d0573', 'f4f4bb152cf54fec94eb0d2b22d25f71', '26', '导入镜像', '/image/import', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36', 'name=my-busybox', null, '2018-07-12 14:21:50');
INSERT INTO `sys_log` VALUES ('8c8b3a376566483bae405863565003b8', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=测试nginx容器&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 11:20:58');
INSERT INTO `sys_log` VALUES ('8c8beb8b900a4324872d8bddf8b39dcf', 'afaba31231451', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1231451941131,1231451941131,1231451941131,1249181023313,1231451941131,1249181023313,213yuyjgdqwey...', null, '2018-07-18 08:43:23');
INSERT INTO `sys_log` VALUES ('8d17dd65650148aca0df775ec82ce678', null, '24', '从DockerHub拉取镜像', null, null, null, null, 'imageName=', 'Timeout: POST http://192.168.100.30:2375/images/create?fromImage=mysql&tag=latest', '2018-07-15 15:28:13');
INSERT INTO `sys_log` VALUES ('8de72c397d684127b2f0230635309d20', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-19 11:21:30');
INSERT INTO `sys_log` VALUES ('8e285f92693e4bfeafeb1d389a91cf45', null, '90', '删除服务', null, null, null, null, '', 'Service not found: 2ffv8g2tvwqsalf8am4na6ujr', '2018-07-18 14:05:13');
INSERT INTO `sys_log` VALUES ('8ec07b9ef56e4fe8a0800643a8c2f761', '34567189513412', '10', '创建项目', '/project/create', 'POST', '192.168.100.133', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36', 'name=xxxx&description=sdsdsd', null, '2018-07-15 14:27:42');
INSERT INTO `sys_log` VALUES ('8efc3156c26548098a0d9dd3d72b5ee1', '1231451941131', '22', '同步镜像', '/image/sync', 'GET', '127.0.0.1', 'PostmanRuntime/7.1.1', '', null, '2018-07-07 15:31:51');
INSERT INTO `sys_log` VALUES ('8f6bd888374b4bb19ba0fe48276d1473', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '127.0.0.1', 'Apache-HttpClient/4.5.2 (Java/1.8.0_152-release)', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=xxxx&projectId=6860df07dd1445228ff21d53eb18be65&portMap={\"80\":61120,\"654\":41565}', null, '2018-07-07 17:40:14');
INSERT INTO `sys_log` VALUES ('8f87fd40394f4a4e8e834ad58b8061ec', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', '读取容器状态异常', '2018-07-13 15:03:12');
INSERT INTO `sys_log` VALUES ('8fa813a60756465899b2b00c2db6c867', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 11:09:30');
INSERT INTO `sys_log` VALUES ('901fed10d4e14f4abac66ef31ca27511', '1231451941131', '50', '清理数据卷', '/volumes/clean/1', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', null, '2018-07-16 15:46:03');
INSERT INTO `sys_log` VALUES ('90a29343488d4115a133dbcb4566c68a', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 15:59:56');
INSERT INTO `sys_log` VALUES ('90ef3c5625ae4f1a93a1055b72205932', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 11:23:46');
INSERT INTO `sys_log` VALUES ('9101b1828b4e4c58ab43806f82459991', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 09:49:31');
INSERT INTO `sys_log` VALUES ('9214f134360348c88102dfb411811753', 'f4f4bb152cf54fec94eb0d2b22d25f71', '25', '上传镜像到DockerHub', '/image/push', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=fe597270fe0b4ab581427edef523fe24&username=jitwxs&password=', null, '2018-07-13 16:48:21');
INSERT INTO `sys_log` VALUES ('934a9fada1934afbbbcd4da93357989c', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-21 16:08:51');
INSERT INTO `sys_log` VALUES ('93ce6a45ade94a829f0cb5c800cf254b', 'afaba31231451', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1231451941131,1231451941131,1231451941131,1249181023313,1231451941131,1249181023313,213yuyjgdqwey...', null, '2018-07-18 08:45:50');
INSERT INTO `sys_log` VALUES ('93da024a99bf41fa981ed2b0c2d189ff', null, '20', '创建容器', null, null, null, null, '', 'Request error: POST http://192.168.100.30:2375/containers/create: 400, body: {\"message\":\"invalid volume spec \\\"\\\": invalid volume specification: \'\'\"}\n', '2018-07-16 09:42:10');
INSERT INTO `sys_log` VALUES ('942b2bf70a404ea997e31a2608514177', 'afaba31231451', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1249181023313,1249181023313,213yuyjgdqweyyj,213yuyjgdqweyyj,3241tfsegvsds,213yuyjgdqweyyj,213yuyj...', null, '2018-07-18 08:47:55');
INSERT INTO `sys_log` VALUES ('946ebc78d46c4393b939c72b92da48d9', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 11:15:10');
INSERT INTO `sys_log` VALUES ('94aa9ea164454998a4837c236cfed32e', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 16:05:41');
INSERT INTO `sys_log` VALUES ('96fa2227006249a2b4ecbc2fdf55f182', null, '90', '删除服务', null, null, null, null, '', null, '2018-07-18 15:16:34');
INSERT INTO `sys_log` VALUES ('9745a0ad24ad4b109fc6a273c9e1ba93', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 15:52:20');
INSERT INTO `sys_log` VALUES ('9788e564ecff4d67856d08fe1f3df521', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 10:07:30');
INSERT INTO `sys_log` VALUES ('980e3b6617284766abf1d3f6021fa7b9', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 14:19:48');
INSERT INTO `sys_log` VALUES ('9823590ec0b24931ad4812d6b602489f', null, '20', '创建容器', null, null, null, null, 'imageId=&containerName=&projectId=&portMapStr=&destinationStr=&cmdStr=', null, '2018-07-21 16:36:21');
INSERT INTO `sys_log` VALUES ('9844824bd1d34692ba0a0ef36ad8a38b', null, '91', '创建服务', null, null, null, null, '', 'Request error: POST http://192.168.100.42:2375/services/create: 500, body: {\"message\":\"rpc error: code = Unknown desc = name conflicts with an existing object\"}\n', '2018-07-18 14:35:31');
INSERT INTO `sys_log` VALUES ('991215b402e54fbb9e3c69a72d69750b', 'afafaf24131', '24', '从DockerHub拉取镜像', '/image/list/hub', 'GET', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=centos', null, '2018-07-15 17:30:14');
INSERT INTO `sys_log` VALUES ('991e1f36844c400ea978fc3becc5698a', 'afafaf24131', '91', '创建服务', '/project/self/list', 'GET', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'current=1&size=10', null, '2018-07-16 11:23:30');
INSERT INTO `sys_log` VALUES ('9af1fd0e42264200b2d9a5c9b4df4cfd', null, '20', '创建容器', null, null, null, null, 'containerName=&imageId=&projectId=&envStr=&portMapStr=', null, '2018-07-19 15:22:53');
INSERT INTO `sys_log` VALUES ('9bf1409a1a43406aa043bb099de934ae', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/2', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-16 14:42:31');
INSERT INTO `sys_log` VALUES ('9c158c81fe964c3aa6418b0a4c943976', '213yuyjgdqweyyj', '60', '创建公共网络', '/network/self/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=jit-wxs&driver=overlay', 'Request error: POST http://192.168.100.42:2375/networks/create: 400, body: {\"message\":\"rpc error: code = InvalidArgument desc = name must be valid as a DNS name component\"}\n', '2018-07-14 19:38:13');
INSERT INTO `sys_log` VALUES ('9cfebb484de747ca91711e0f99e0f10f', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:34');
INSERT INTO `sys_log` VALUES ('9d548173b6d242ff8e3c356e1e0f7521', null, '20', '创建容器', null, null, null, null, 'imageId=&containerName=&projectId=&envStr=&portMapStr=', null, '2018-07-21 10:09:11');
INSERT INTO `sys_log` VALUES ('9e01d9dad0634e64977cd063e5c97e6d', 'afaba31231451', '61', '创建公共网络失败', '/network/public/create', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=xxx&driver=overlay&labelsStr={\"xxx\":\"bbb\"}&hasIpv6=false', 'Request error: POST http://192.168.100.30:2375/networks/create: 500, body: {\"message\":\"This node is not a swarm manager. Use \\\"docker swarm init\\\" or \\\"docker swarm join\\\" to connect this node to swarm and try again.\"}\n', '2018-07-18 17:12:43');
INSERT INTO `sys_log` VALUES ('9e03c22ace1049909dcfa4177133b74f', '1231451941131', '61', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313', null, '2018-07-11 16:16:51');
INSERT INTO `sys_log` VALUES ('9e41a17dadb646f1bd53ce0386b751b2', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', null, '2018-07-11 16:06:39');
INSERT INTO `sys_log` VALUES ('9fd7e6d22d7141de8a5a9054a30d17b0', '1231451941131', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f7...', null, '2018-07-16 21:36:55');
INSERT INTO `sys_log` VALUES ('a0024f727c91448b92fe343a4f69d988', '1231451941131', '61', '创建公共网络失败', '/network/public/create', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=1&driver=2&labels=&hasIpv6=', 'Plugin not found', '2018-07-17 09:37:05');
INSERT INTO `sys_log` VALUES ('a0186d8493e142f68970fc467bea3994', 'f4f4bb152cf54fec94eb0d2b22d25f71', '10', '创建项目', '/project/create', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'name=项目q&description=测试', null, '2018-07-18 08:47:39');
INSERT INTO `sys_log` VALUES ('a14a7748ea934fc4a5ca9f94ed617fb3', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-13 18:51:40');
INSERT INTO `sys_log` VALUES ('a197d1031e7b441e9455f6a470472533', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:01:37');
INSERT INTO `sys_log` VALUES ('a1c8860ca4c4447fb9e6ff67e049471a', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-20 21:15:41');
INSERT INTO `sys_log` VALUES ('a22fdf37fe7e48d5bfb13c31081ed991', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', null, '2018-07-11 16:21:30');
INSERT INTO `sys_log` VALUES ('a267c014ed8c4c3babd51cd00705eaaf', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-15 14:01:45');
INSERT INTO `sys_log` VALUES ('a27b3e8d7bb64ec9aca8b82ce37aca8b', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/1', 'DELETE', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-18 15:11:00');
INSERT INTO `sys_log` VALUES ('a2d4e6eb7d8044949b059589eed8ba42', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-17 14:05:00');
INSERT INTO `sys_log` VALUES ('a3c23025f40d44e39245334549d5ae2f', null, '26', '导入镜像', null, null, null, null, 'name=', null, '2018-07-13 17:28:10');
INSERT INTO `sys_log` VALUES ('a47ab71d14094d8c90102e169a91a875', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 20:51:06');
INSERT INTO `sys_log` VALUES ('a509d058c0194460a85795ceed7f1d09', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:24:28');
INSERT INTO `sys_log` VALUES ('a5553b673bd642ebbe2a759584a6307f', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-21 16:06:12');
INSERT INTO `sys_log` VALUES ('a63606be4f3b4fd29ea0d98a40ed89ae', '1231451941131', '22', '同步镜像', '/image/sync', 'GET', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-07 14:04:11');
INSERT INTO `sys_log` VALUES ('a69bb46476694499962f6341bc6c814e', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-21 16:05:50');
INSERT INTO `sys_log` VALUES ('a6ffa1953b734cf5bec493acb9fd4186', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=哇咔咔的2号容器&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 11:09:07');
INSERT INTO `sys_log` VALUES ('a7e45472845a477c9a3ac3ad54f7f2a3', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 18:20:29');
INSERT INTO `sys_log` VALUES ('a83ead7ff05e4645b37befb2450d139c', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-19 10:46:38');
INSERT INTO `sys_log` VALUES ('a88712efacff41eb9136e0f526a7386d', null, '25', '上传镜像到DockerHub', null, null, null, null, '', null, '2018-07-13 16:55:58');
INSERT INTO `sys_log` VALUES ('a94cc9f0f4ac42198439d5d703326964', null, '91', '创建服务', null, null, null, null, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 11:06:13');
INSERT INTO `sys_log` VALUES ('a98b0a914be54a2d8bb48825a90892f5', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:26');
INSERT INTO `sys_log` VALUES ('aa7ce1f286d94b9fb930e13f839a4ac7', null, '20', '创建容器', null, null, null, null, 'imageId=&containerName=&projectId=&portMapStr=&destinationStr=&cmdStr=', null, '2018-07-21 16:55:37');
INSERT INTO `sys_log` VALUES ('ac1f0cd91fda44d5ad4da9d104c86ca9', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:59:00');
INSERT INTO `sys_log` VALUES ('ac574780e7a24933ba3983db8b7257a4', 'f4f4bb152cf54fec94eb0d2b22d25f71', '11', '删除项目', '/project/delete/51553ff30e644ae78926e22392bf7a98', 'DELETE', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', null, '2018-07-18 21:30:49');
INSERT INTO `sys_log` VALUES ('ac68058eb65e4a0283e222d024360123', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.2742496294047994950.9999\\work\\Tomcat\\localhost\\ROOT\\upload_39ad8238_e8d2_4746_99b4_73ea87a1954f_00000012.tmp (系统找不到指定的文件。)', '2018-07-19 10:09:30');
INSERT INTO `sys_log` VALUES ('ae3a01b0d00345ae964702761be4cad9', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:59:42');
INSERT INTO `sys_log` VALUES ('ae63d7fe78ac48e88590924dbe03e7b0', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 14:09:27');
INSERT INTO `sys_log` VALUES ('aff593180ee84e46a0b0ecab02b6dc54', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:10:20');
INSERT INTO `sys_log` VALUES ('b0d6fe58383a49e09a132ae79b4eef8b', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:26');
INSERT INTO `sys_log` VALUES ('b0e113c71b2e4b59af3e949e0741afb4', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', 'Timeout: POST http://192.168.100.30:2375/images/create?fromImage=vimagick%2Fdante&tag=latest', '2018-07-17 11:13:36');
INSERT INTO `sys_log` VALUES ('b135a72bc33642f193fe7a04288161ad', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 16:28:59');
INSERT INTO `sys_log` VALUES ('b197ca4031c645b38fac177cbef83ac6', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313', null, '2018-07-10 17:01:48');
INSERT INTO `sys_log` VALUES ('b23e97b5faba407b8b3a2f7ac24771a7', null, '24', '从DockerHub拉取镜像', null, null, null, null, 'imageName=', null, '2018-07-20 08:59:03');
INSERT INTO `sys_log` VALUES ('b24a3fcae6264329a2e64f1c9588b39e', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', null, '2018-07-13 15:08:37');
INSERT INTO `sys_log` VALUES ('b2ad08508409420db49304c0ac84ac8b', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 09:50:31');
INSERT INTO `sys_log` VALUES ('b3a6451b215f4cf58f4c03e89f6eac26', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/1', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-16 14:16:33');
INSERT INTO `sys_log` VALUES ('b3c00a7c16c04b64ab5143f455123641', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-17 09:20:27');
INSERT INTO `sys_log` VALUES ('b48c8598f19c4535bc5b88ae36a5c405', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 10:28:27');
INSERT INTO `sys_log` VALUES ('b4fd06d86db64251bcb731c427407131', null, '91', '创建服务', null, null, null, null, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 10:49:46');
INSERT INTO `sys_log` VALUES ('b5e4e3585b5244b8ab30530935c4fce1', '1231451941131', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=34567189513412', null, '2018-07-16 20:56:07');
INSERT INTO `sys_log` VALUES ('b65c0e9e9f04445daf9269e4afe41cd2', null, '41', '拉取镜像从Hub', null, null, null, null, '', null, '2018-07-17 11:18:44');
INSERT INTO `sys_log` VALUES ('b68da7c4924b4cdfb537460bea22e5e7', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:37');
INSERT INTO `sys_log` VALUES ('b806dead789642a3b6bc3d11ec28e9dc', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 20:45:21');
INSERT INTO `sys_log` VALUES ('b82944ab2e3d4212a3788c53d843b44c', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 14:57:44');
INSERT INTO `sys_log` VALUES ('b84c83d774924290b5ab43a308eda4b5', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-17 17:49:36');
INSERT INTO `sys_log` VALUES ('b8ca49d92c464592a0a6fd35a7b1e426', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-18 11:09:27');
INSERT INTO `sys_log` VALUES ('b8d63a33dde64cd3925a86332231c937', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/1', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-16 14:20:24');
INSERT INTO `sys_log` VALUES ('b9ebfa24febe4cec93370b7f97da67c0', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=yu&description=hu8uj8', null, '2018-07-14 10:30:09');
INSERT INTO `sys_log` VALUES ('babc3e323d954a5b8d1d952b1fab5cc8', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 16:03:36');
INSERT INTO `sys_log` VALUES ('bc1975179e9641c38c5f466872c98cee', null, '91', '创建服务', null, null, null, null, '', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 10:32:13');
INSERT INTO `sys_log` VALUES ('bc45b0cf511046278300db57d2c3a62e', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:36:49');
INSERT INTO `sys_log` VALUES ('bc6e61778e78443a87b80c8463ab39e2', 'afaba31231451', '50', '清理数据卷', '/volumes/clean', 'DELETE', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-16 13:38:46');
INSERT INTO `sys_log` VALUES ('bccd4d50b8ce4cba90b1ec0f6c7400a0', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&projectId=6860df07dd1445228ff21d53eb18be65&containerName=阿发发发', null, '2018-07-10 08:42:07');
INSERT INTO `sys_log` VALUES ('bd295854861a4c6f9fa200f3134e3832', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.6976697516246441654.9999\\work\\Tomcat\\localhost\\ROOT\\upload_4eb4554b_ce6e_4a68_abd0_f8b7e5648987_00000000.tmp (系统找不到指定的文件。)', '2018-07-18 16:29:51');
INSERT INTO `sys_log` VALUES ('bd8ffa8f8bcf43a6a60a2b1fc93425a3', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:14:43');
INSERT INTO `sys_log` VALUES ('bed803e4ea9f48488d3e3f2d1eb51272', null, '90', '删除服务', null, null, null, null, '', null, '2018-07-18 20:07:49');
INSERT INTO `sys_log` VALUES ('bef62dad1d1a418ea959a28115071ca3', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 14:51:53');
INSERT INTO `sys_log` VALUES ('bfe5971ede0c4c748694485853046778', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-18 14:28:43');
INSERT INTO `sys_log` VALUES ('bfe75ea169934d9fa22aa3caee1c9099', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-18 08:49:05');
INSERT INTO `sys_log` VALUES ('c0638f4858a74c5bb829d798111285de', null, '90', '删除服务', null, null, null, null, '', 'Service not found: 2ffv8g2tvwqsalf8am4na6ujr', '2018-07-18 11:35:16');
INSERT INTO `sys_log` VALUES ('c07c7e9b4f634b108756cf7933aeb3e2', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:36:41');
INSERT INTO `sys_log` VALUES ('c0cd9f1b1e6349ecab27b3e9a0c3862d', 'agfag13131', '60', '创建公共网络', '/network/public/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=123&driver=host', 'Request error: POST http://192.168.100.30:2375/networks/create: 403, body: {\"message\":\"only one instance of \\\"host\\\" network is allowed\"}\n', '2018-07-14 17:53:26');
INSERT INTO `sys_log` VALUES ('c24d0d9270cc41b29472010ee6504b4c', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-13 17:06:01');
INSERT INTO `sys_log` VALUES ('c261721037704776948793e6149025be', null, '24', '从DockerHub拉取镜像', null, null, null, null, 'imageName=', null, '2018-07-15 15:22:39');
INSERT INTO `sys_log` VALUES ('c29d004bed244fde905b12cd2c85543f', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-20 21:21:57');
INSERT INTO `sys_log` VALUES ('c36f956705894753a2c6079c713c5a2e', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=阿芳&description=发热该如何', null, '2018-07-14 10:33:07');
INSERT INTO `sys_log` VALUES ('c37f6ef48cd24307930117912f016193', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:16');
INSERT INTO `sys_log` VALUES ('c5543a9d57b44abfb9590e08c5654ade', null, '90', '删除服务', null, null, null, null, '', null, '2018-07-15 09:53:50');
INSERT INTO `sys_log` VALUES ('c6418f9333194f5189be5f6aa1aca910', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-19 08:48:07');
INSERT INTO `sys_log` VALUES ('c73443b43dbc418fa4bf854c6540d876', '1231451941131', '61', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,4151361367131,4151361367131,f4f4bb152cf54fec94eb0d2b22d25f71,f4f...', null, '2018-07-11 16:21:38');
INSERT INTO `sys_log` VALUES ('c89cd4366d194488adb2530b219a5048', 'afaba31231451', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1231451941131,1241414124156,1249181023313,213yuyjgdqweyyj,34567189513412,34567189513412,345671895...', null, '2018-07-16 15:42:21');
INSERT INTO `sys_log` VALUES ('c8e0a0fd1c434e5a815a8b9fed764cce', null, '40', '上传镜像到Hub', null, null, null, null, '', null, '2018-07-13 20:05:58');
INSERT INTO `sys_log` VALUES ('caacda0c1c20449db692bffd8c3f3a9a', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', null, '2018-07-11 16:01:54');
INSERT INTO `sys_log` VALUES ('cb03c288727d47a3bde5b9a992160ae4', 'agfag13131', '60', '创建公共网络', '/network/public/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=123&driver=overlay', 'Request error: POST http://192.168.100.30:2375/networks/create: 500, body: {\"message\":\"This node is not a swarm manager. Use \\\"docker swarm init\\\" or \\\"docker swarm join\\\" to connect this node to swarm and try again.\"}\n', '2018-07-14 18:04:21');
INSERT INTO `sys_log` VALUES ('cb19c5c1b88e4f4ca0d0d97b1093dcc7', 'afafaf24131', '91', '创建服务', '/project/self/list', 'GET', '192.168.100.133', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36', 'current=2&size=10', 'java.util.concurrent.ExecutionException: javax.ws.rs.ProcessingException: org.apache.http.client.ClientProtocolException', '2018-07-15 10:35:18');
INSERT INTO `sys_log` VALUES ('cb1d01304d31472b8ae292d1f2e2756d', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-16 14:42:17');
INSERT INTO `sys_log` VALUES ('cb79a6b8df1e4a898019e540f6c1491f', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f7...', null, '2018-07-11 15:58:54');
INSERT INTO `sys_log` VALUES ('cc57d1383a354fc38ee9449789103bf1', '1231451941131', '23', '删除镜像', '/image/delete/cde5f16554c84b37a25ebf412e24bec7', 'DELETE', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', '', null, '2018-07-17 11:19:54');
INSERT INTO `sys_log` VALUES ('cc7f6155da8f482389cabe7b92c97008', null, '90', '删除服务', null, null, null, null, '', 'Service not found: t45xkfv0eae7hkh4u10dlkejy', '2018-07-18 14:50:29');
INSERT INTO `sys_log` VALUES ('ccc3acae71f74767b8565ba02aec5dc3', 'afaba31231451', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1249181023313,1249181023313,213yuyjgdqweyyj', null, '2018-07-18 08:47:45');
INSERT INTO `sys_log` VALUES ('ccd44e4ec4564c07b5167cada9037e85', '1231451941131', '61', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313', null, '2018-07-11 16:17:03');
INSERT INTO `sys_log` VALUES ('ccf3f9cdff7949d38822dedd14462a88', null, '20', '创建容器', null, null, null, null, 'imageId=&containerName=&projectId=&portMapStr=&destinationStr=&cmdStr=', null, '2018-07-21 11:01:13');
INSERT INTO `sys_log` VALUES ('cd206ee5e2bd45bbb904d08524398986', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-16 11:16:50');
INSERT INTO `sys_log` VALUES ('cddef87af06940a0b82fd0351d648fe5', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 14:04:19');
INSERT INTO `sys_log` VALUES ('ce573556ac0c4100ad4057c1ab7161d1', '213yuyjgdqweyyj', '63', '创建个人网络失败', '/network/self/create', 'POST', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'name=hello/world&driver=overlay', 'Request error: POST http://192.168.100.42:2375/networks/create: 400, body: {\"message\":\"rpc error: code = InvalidArgument desc = name must be valid as a DNS name component\"}\n', '2018-07-14 19:44:28');
INSERT INTO `sys_log` VALUES ('ce5fbcd9103a46d388b9c49b772be873', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-21 16:05:57');
INSERT INTO `sys_log` VALUES ('cf416982eb9b496492bee954337e3a19', 'afafaf24131', '26', '导入镜像', '/image/import', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.5', 'name=sb&tag=test', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.1001865123096402508.9999\\work\\Tomcat\\localhost\\ROOT\\upload_b71d6fbc_0bc2_4be7_b93c_58b66f895a9b_00000007.tmp (系统找不到指定的文件。)', '2018-07-17 14:58:33');
INSERT INTO `sys_log` VALUES ('cfb3abdb0afb465b87407351db0ad57a', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 18:18:28');
INSERT INTO `sys_log` VALUES ('d0e742d9e48145e3b7df3701b10ee04f', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/2', 'DELETE', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-21 12:09:06');
INSERT INTO `sys_log` VALUES ('d19fe7e91c604787b2eb2ada0f0ee7e8', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=29952c38f59d44419f9d2cdaa8213b9f&containerName=我的Nginx&projectId=aabakfsvakiuw1213', '读取容器状态异常', '2018-07-13 14:58:41');
INSERT INTO `sys_log` VALUES ('d227cd446d164a028c836f6f24ac5f82', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:04:32');
INSERT INTO `sys_log` VALUES ('d2d6b678a4974954a06577eee353f927', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:36:54');
INSERT INTO `sys_log` VALUES ('d4252a83ae8d414992130b48edf95597', '1231451941131', '61', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131', null, '2018-07-11 16:16:32');
INSERT INTO `sys_log` VALUES ('d4f31362594d41f3ac30cf91e3f0f451', null, '20', '创建容器', null, null, null, null, 'containerName=&imageId=&projectId=&envStr=&portMapStr=', null, '2018-07-19 15:16:51');
INSERT INTO `sys_log` VALUES ('d5f604eb733d4e888925cb074c0dc872', null, '20', '创建容器', null, null, null, null, 'imageId=&projectId=&type=&containerName=', null, '2018-07-16 10:07:14');
INSERT INTO `sys_log` VALUES ('d653c84b100b4e88a392f4b9b4aa1efc', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'D:\\pass_test\\paas\\paas\\data\\tmp\\upload_47a7a282_3351_462c_8406_e74f92ee8008_00000009.tmp (系统找不到指定的文件。)', '2018-07-19 10:23:58');
INSERT INTO `sys_log` VALUES ('d73c43d58a364229ac738642066cff45', 'f4f4bb152cf54fec94eb0d2b22d25f71', '11', '删除项目', '/project/delete/aabakfsvakiuw1213', 'DELETE', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', null, '2018-07-21 12:06:37');
INSERT INTO `sys_log` VALUES ('d76d85b084384ac19340ca45c0f05988', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=sunyian&description=ssss', null, '2018-07-16 10:27:44');
INSERT INTO `sys_log` VALUES ('d78d4d16db6d4db18117e1b5ac0611da', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-16 08:43:59');
INSERT INTO `sys_log` VALUES ('d8cdfd986ab7461aa2975e22deac7472', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:29');
INSERT INTO `sys_log` VALUES ('d94ae67c696d47e3ba26c2ea8b20824c', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:38');
INSERT INTO `sys_log` VALUES ('d9973e186c5e463096d28a1a542ed2c1', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', null, '2018-07-11 16:00:48');
INSERT INTO `sys_log` VALUES ('d9f1c5a977b1405699b5ee5275d84809', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=5预计可露露&description=仍泰和家园羊肉汤', null, '2018-07-14 11:34:18');
INSERT INTO `sys_log` VALUES ('db4330e7470a4298ba11ff70aa798ee6', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', 'Timeout: POST http://192.168.100.30:2375/images/create?fromImage=ansible%2Fcentos7-ansible', '2018-07-16 21:38:48');
INSERT INTO `sys_log` VALUES ('dc5283939e40449296e20906b7fc8b3c', 'afaba31231451', '50', '清理数据卷', '/volumes/clean/2', 'DELETE', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '', null, '2018-07-18 15:10:59');
INSERT INTO `sys_log` VALUES ('dc990a7e70eb4b93a659b52413dc68ab', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=wwwwwwwww&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 15:05:59');
INSERT INTO `sys_log` VALUES ('dcd801c282d44159bf66297b1dcc12f3', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-17 15:09:07');
INSERT INTO `sys_log` VALUES ('dd3d9b09cad649a298750db67b5883ad', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.133', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36', 'name=sdfav&description=eafwegeff', null, '2018-07-14 18:08:20');
INSERT INTO `sys_log` VALUES ('dd6bb385bc85401db1e13d8ca8db4d59', 'afaba31231451', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=213yuyjgdqweyyj,213yuyjgdqweyyj', null, '2018-07-17 17:12:59');
INSERT INTO `sys_log` VALUES ('dd6c573893644101854cac3995691b5f', '1241414124156', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=34567189513412,34567189513412', null, '2018-07-16 16:11:33');
INSERT INTO `sys_log` VALUES ('ddd832e9f12a4c5f8770e42561b923d7', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:36:45');
INSERT INTO `sys_log` VALUES ('de65a7c76dea4dbd88dc11753c4c5d81', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', 'Image not found: pivotaldata/centos:latest', '2018-07-16 20:53:40');
INSERT INTO `sys_log` VALUES ('df51545000c541a98274c08ee02f79eb', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-16 15:20:31');
INSERT INTO `sys_log` VALUES ('e43fd791d31a4d0db1c0d38a63bc6c3a', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:08:45');
INSERT INTO `sys_log` VALUES ('e4f54d9ebc364c8f8972702198336db4', '1231451941131', '26', '导入镜像', '/image/import', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.5', 'name=sb&tag=test', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.4658738438205416396.9999\\work\\Tomcat\\localhost\\ROOT\\upload_140f963a_020c_40a3_88e0_a27e50fc1059_00000014.tmp (系统找不到指定的文件。)', '2018-07-17 15:00:58');
INSERT INTO `sys_log` VALUES ('e51f2c92266445d7944faa3105d40897', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:20');
INSERT INTO `sys_log` VALUES ('e5d29219f19e47bc9dc7319576bdd7ba', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:00:54');
INSERT INTO `sys_log` VALUES ('e65bf6c807604ce199f31f490f4d0992', null, '90', '删除服务', null, null, null, null, '', 'Service not found: 2ffv8g2tvwqsalf8am4na6ujr', '2018-07-18 14:05:23');
INSERT INTO `sys_log` VALUES ('e73d02647b4945899e481f8b3af34fea', null, '90', '删除服务', null, null, null, null, '', 'Service not found: 2ffv8g2tvwqsalf8am4na6ujr', '2018-07-18 14:06:53');
INSERT INTO `sys_log` VALUES ('e7bcb7d454c1407ca037f3450bd76f4a', null, '20', '创建容器', null, null, null, null, 'imageId=&containerName=&projectId=&portMapStr=', null, '2018-07-21 17:22:06');
INSERT INTO `sys_log` VALUES ('e7d2ffc5cf6e4acc9b84633330c726f3', 'f4f4bb152cf54fec94eb0d2b22d25f71', '23', '删除镜像', '/image/delete/2d4e45145c784ce1badd1596b7d44d33', 'DELETE', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', null, '2018-07-21 14:22:07');
INSERT INTO `sys_log` VALUES ('e8ac932da6b841f2bf5df51e35048ab4', 'afafaf24131', '10', '创建项目', '/project/create', 'POST', '192.168.100.139', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'name=EFSFG&description=DSFGGG', null, '2018-07-14 15:10:14');
INSERT INTO `sys_log` VALUES ('e96cb400af224983aed6483633109597', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-18 10:32:21');
INSERT INTO `sys_log` VALUES ('eafd1798c95a43f59fc1691e690941d9', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=4151361367131,1249181023313,f4f4bb152cf54fec94eb0d2b22d25f71,f4f4bb152cf54fec94eb0d2b22d25f71', null, '2018-07-11 16:17:18');
INSERT INTO `sys_log` VALUES ('eb725e925ce5448a9e796e0bf5c37949', '1241414124156', '81', '取消冻结用户', '/user/cancelFreeze', 'POST', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', 'ids=1231451941131,213yuyjgdqweyyj,3241tfsegvsds', null, '2018-07-17 18:08:51');
INSERT INTO `sys_log` VALUES ('ec3257cdcc8149c88c0f448b444ec1fc', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', 'C:\\Users\\lenovo\\AppData\\Local\\Temp\\tomcat.4658738438205416396.9999\\work\\Tomcat\\localhost\\ROOT\\upload_140f963a_020c_40a3_88e0_a27e50fc1059_00000017.tmp (系统找不到指定的文件。)', '2018-07-17 15:01:34');
INSERT INTO `sys_log` VALUES ('ecae57a3732e4287bc17b2300b9bd9c8', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.174', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=1249181023313,4151361367131', null, '2018-07-10 17:04:02');
INSERT INTO `sys_log` VALUES ('ecce34ac55d0417b93b71a0d7aab5515', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-21 16:05:51');
INSERT INTO `sys_log` VALUES ('ed708fed94cb4df29aa0dc2dc8c1707a', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:40');
INSERT INTO `sys_log` VALUES ('ee19d70d57a34eb98ac386c2574fff47', null, '90', '删除服务', null, null, null, null, '', 'Service not found: 2ffv8g2tvwqsalf8am4na6ujr', '2018-07-18 14:05:02');
INSERT INTO `sys_log` VALUES ('eedfbf76322442c6a2b7c4be1110db21', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-20 21:19:56');
INSERT INTO `sys_log` VALUES ('eee2063a276b4b22bb52cf39e4fadb64', '34567189513412', '23', '删除镜像', '/image/delete/f0f04303ab464ee19b7436c2d8c1fe07', 'DELETE', '192.168.100.133', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.79 Safari/537.36', '', null, '2018-07-19 11:16:58');
INSERT INTO `sys_log` VALUES ('eef5af94e1934ced9808f87ed9f1836e', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:36:39');
INSERT INTO `sys_log` VALUES ('ef274f16918d477c9efc8ca272bad2e7', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-21 16:06:53');
INSERT INTO `sys_log` VALUES ('ef421918d17e45babab7cc0a8e2a8750', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=fe597270fe0b4ab581427edef523fe24&containerName=my-HelloWorld&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-12 14:12:52');
INSERT INTO `sys_log` VALUES ('ef8cd4713f904e4ebcce553f38a38f40', null, '90', '删除服务', null, null, null, null, '', 'Service not found: 2ffv8g2tvwqsalf8am4na6ujr', '2018-07-18 14:25:26');
INSERT INTO `sys_log` VALUES ('f1a6a46dc80740c38593d5d3a540abce', null, '20', '创建容器', null, null, null, null, '', 'Request error: POST http://192.168.100.30:2375/containers/create: 400, body: {\"message\":\"invalid volume spec \\\"ff\\\": invalid volume specification: \'ff\': invalid mount config for type \\\"volume\\\": invalid mount path: \'ff\' mount path must be absolute\"}\n', '2018-07-16 09:44:53');
INSERT INTO `sys_log` VALUES ('f3444ce730724311bf672d7737f5cb51', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:37:26');
INSERT INTO `sys_log` VALUES ('f38929f7014b4833a71a49353ba02ac4', '1231451941131', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71,34567189513412,34567189513412,34567189513412', null, '2018-07-16 21:26:48');
INSERT INTO `sys_log` VALUES ('f4afe9df06de438298ad0180ca152b3f', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-16 21:02:07');
INSERT INTO `sys_log` VALUES ('f4e5e1b9ce3f456ab5eb5a7f73cfd0ad', null, '20', '创建容器', null, null, null, null, '', null, '2018-07-18 14:54:39');
INSERT INTO `sys_log` VALUES ('f5489ce0fd4d4337bc6d2b12d32f3658', null, '90', '删除服务', null, null, null, null, '', null, '2018-07-18 20:07:12');
INSERT INTO `sys_log` VALUES ('f58863d2b6b24a54977fc824374364bd', null, '26', '导入镜像', null, null, null, null, 'name=&tag=', null, '2018-07-20 21:23:46');
INSERT INTO `sys_log` VALUES ('f5b43361a3c64734bde7f057f0721180', null, '90', '删除服务', null, null, null, null, '', null, '2018-07-18 15:54:40');
INSERT INTO `sys_log` VALUES ('f6cacd4568584b9c9a660a5faf48344e', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-16 14:33:37');
INSERT INTO `sys_log` VALUES ('f7170811da1342f192fce6abf1eaf852', null, '90', '删除服务', null, null, null, null, '', null, '2018-07-18 15:56:30');
INSERT INTO `sys_log` VALUES ('f7c0e0961ba04a1b9847d2d093c7a816', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-17 10:12:34');
INSERT INTO `sys_log` VALUES ('f910c09176e24ba9a1fd42011e81cbc3', '1241414124156', '23', '删除镜像', '/image/delete/99fe2d0b0f2c4d05833a3ecc0e1d66b2', 'DELETE', '192.168.100.162', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.170 Safari/537.36', '', null, '2018-07-16 21:16:15');
INSERT INTO `sys_log` VALUES ('f93270c33c2d48a581a83c0d7cc3a851', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-20 21:36:43');
INSERT INTO `sys_log` VALUES ('f9d0d7d9945841f1b5a4ad500854af06', null, '25', '上传镜像到DockerHub', null, null, null, null, '', null, '2018-07-19 14:29:34');
INSERT INTO `sys_log` VALUES ('fa5352e65bb4417ab97992731d16fb58', null, '24', '从DockerHub拉取镜像', null, null, null, null, 'imageName=', 'Timeout: POST http://192.168.100.30:2375/images/create?fromImage=mysql&tag=latest', '2018-07-15 15:24:47');
INSERT INTO `sys_log` VALUES ('fab35c0bbf724489a41a1db5462012e4', '1231451941131', '60', '冻结用户', '/user/freeze', 'POST', '192.168.100.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36', 'ids=f4f4bb152cf54fec94eb0d2b22d25f71', null, '2018-07-11 16:07:06');
INSERT INTO `sys_log` VALUES ('fabefd3f1c5a47d5a89c1585d05b0fb2', 'f4f4bb152cf54fec94eb0d2b22d25f71', '20', '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=bbbbb&projectId=6860df07dd1445228ff21d53eb18be65', null, '2018-07-07 11:35:26');
INSERT INTO `sys_log` VALUES ('fb1879c855b3493ab432af093745a9f1', null, '24', '从DockerHub拉取镜像', null, null, null, null, '', null, '2018-07-15 17:25:23');
INSERT INTO `sys_log` VALUES ('fba6c937d00c4bb3a1e3b77004a4f2ec', null, '91', '创建服务', null, null, null, null, '', null, '2018-07-16 15:05:59');
INSERT INTO `sys_log` VALUES ('fcafefcc293148788187d0af44dade77', 'afaba31231451', '80', '冻结用户', '/user/freeze', 'POST', '192.168.100.142', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'ids=1231451941131', null, '2018-07-18 08:42:46');
INSERT INTO `sys_log` VALUES ('fd14cc9435d445dda556a25fb064e7e5', null, '20', '创建容器', null, null, null, null, '', 'Request error: POST http://192.168.100.30:2375/containers/create: 400, body: {\"message\":\"invalid volume spec \\\"\\\": invalid volume specification: \'\'\"}\n', '2018-07-16 09:45:57');
INSERT INTO `sys_log` VALUES ('fda6c438bb7e4bbf9a87acb7f3b6bbcc', null, '21', '删除容器', null, null, null, null, '', null, '2018-07-21 11:28:43');

-- ----------------------------
-- Table structure for `sys_login`
-- ----------------------------
DROP TABLE IF EXISTS `sys_login`;
CREATE TABLE `sys_login` (
  `id` varchar(255) NOT NULL,
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `has_freeze` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否冻结，默认false',
  `role_id` int(11) DEFAULT NULL COMMENT '权限id',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_role_id` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登陆表';

-- ----------------------------
-- Records of sys_login
-- ----------------------------
INSERT INTO `sys_login` VALUES ('1020113852509048834', '1', '$2a$10$o4oxZk83ijCm59.M8qcIE.OKZfvpczZ8R.3UbmyaBasS9SunUcxhm', null, '1', '1', '2018-07-20 09:11:07', null);
INSERT INTO `sys_login` VALUES ('1020229631585935362', '66', '$2a$10$/9ossuACO76Y.XZqygAvkOD8.FL1pnIPXA7m0QSvmJtWMw8/JwOTS', '2212557736@qq.com', '0', '1', '2018-07-20 16:51:13', '2018-07-20 16:57:17');
INSERT INTO `sys_login` VALUES ('1020230455703756801', '66', '$2a$10$dX8DqgvHt6drNL3y8eovBOECmnj/cHpIzJftx/RESaMLrciKmvGNq', '2212557736@qq.com', '1', '1', '2018-07-20 16:54:30', null);
INSERT INTO `sys_login` VALUES ('1020230855869718529', '66', '$2a$10$KWKBhnuF3b0w6r5b9nh9Je2jRQ.4E62T2qnuNhLzcjt3wfmH8pdhm', '2212557736@qq.com', '1', '1', '2018-07-20 16:56:05', null);
INSERT INTO `sys_login` VALUES ('1020231098002694146', '66', '$2a$10$PAzbBPO9WJm9tslkHCX5tO2Knk9BFkQxbARMwzWy4vb1rGYwLldpm', '2212557736@qq.com', '1', '1', '2018-07-20 16:57:03', null);
INSERT INTO `sys_login` VALUES ('1231451941131', 'sys', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', null, '0', '2', '2018-06-27 16:29:56', '2018-07-11 15:29:55');
INSERT INTO `sys_login` VALUES ('12314519411333', 'hf', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', null, '0', '2', '2018-07-19 14:34:12', null);
INSERT INTO `sys_login` VALUES ('1241414124156', 'term', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', null, '0', '2', '2018-07-11 15:39:25', null);
INSERT INTO `sys_login` VALUES ('1249181023313', 'user', '$2a$10$tj2Ehs75tdIil2SHoaBb6u54wKUgQwjenO3RuaWXBEOsQZ8bupe3q', 'jitwxs@foxmail.com', '0', '2', '2018-06-29 17:01:43', '2018-07-11 16:19:04');
INSERT INTO `sys_login` VALUES ('213yuyjgdqweyyj', 'wxs', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', null, '0', '1', '2018-07-14 17:07:35', '2018-07-18 08:47:55');
INSERT INTO `sys_login` VALUES ('3241tfsegvsds', 'aaa', '$2a$10$3zdHQxZ3WkN8efEwdFZyNuVKpu14SQ3077Y2rD7HyAJpelObSpNum', null, '0', '1', '2018-07-17 17:15:32', '2018-07-18 08:47:55');
INSERT INTO `sys_login` VALUES ('34567189513412', 'zy', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', null, '0', '1', '2018-07-15 13:57:00', '2018-07-16 21:26:48');
INSERT INTO `sys_login` VALUES ('afaba31231451', 'wxsa', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', null, '0', '2', '2018-07-15 15:35:49', null);
INSERT INTO `sys_login` VALUES ('afafaf24131', 'lc', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', null, '0', '1', '2018-07-14 09:21:16', '2018-07-16 21:36:29');
INSERT INTO `sys_login` VALUES ('agfag13131', 'sss', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', null, '0', '2', '2018-07-14 10:10:57', null);
INSERT INTO `sys_login` VALUES ('f4f4bb152cf54fec94eb0d2b22d25f71', 'sya', '$2a$10$3zdHQxZ3WkN8efEwdFZyNuVKpu14SQ3077Y2rD7HyAJpelObSpNum', '973383318@qq.com', '0', '1', '2018-06-30 11:09:18', '2018-07-16 21:26:48');

-- ----------------------------
-- Table structure for `sys_network`
-- ----------------------------
DROP TABLE IF EXISTS `sys_network`;
CREATE TABLE `sys_network` (
  `id` varchar(255) NOT NULL COMMENT '网络ID',
  `name` varchar(255) DEFAULT NULL COMMENT '网络名',
  `scope` varchar(255) DEFAULT NULL COMMENT '网络范围',
  `driver` varchar(255) DEFAULT NULL COMMENT '网络驱动',
  `has_internal` tinyint(1) DEFAULT NULL COMMENT '是否是内部网络',
  `has_ipv6` tinyint(1) DEFAULT NULL COMMENT '是否开启ipv6',
  `labels` varchar(255) DEFAULT NULL,
  `has_public` tinyint(1) DEFAULT NULL COMMENT '是否是公开网络',
  `user_id` varchar(255) DEFAULT NULL COMMENT '如果不是公开网络，所属用户',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统网络表';

-- ----------------------------
-- Records of sys_network
-- ----------------------------
INSERT INTO `sys_network` VALUES ('270ac1e166b7f3e583adf96b73c400daa87da1831f52406458a07f9f2a3bf015', 'mynet', 'local', 'bridge', '0', '0', '{}', '0', 'f4f4bb152cf54fec94eb0d2b22d25f71', '2018-07-19 18:44:07', null);
INSERT INTO `sys_network` VALUES ('33b1b4e6592e06dab104af4da99a177661dfa22142fd32d18bf5fbf425522a82', 'sss', 'local', 'bridge', '0', '0', '{}', '0', 'f4f4bb152cf54fec94eb0d2b22d25f71', '2018-07-21 16:18:29', null);
INSERT INTO `sys_network` VALUES ('a1502826e75b8c0e8f6d27c2a9737c2f4d7f4f36b8398f1ee9bc08e6a7d43dc1', 'bridge', 'local', 'bridge', '0', '0', '{}', '1', null, '2018-07-21 19:17:01', null);
INSERT INTO `sys_network` VALUES ('ae736f9a7b14dfcc8fe97bd2f57858078ec827d978eb5569863184b1a5ddcf9e', 'none', 'local', 'null', '0', '0', '{}', '1', null, '2018-07-15 15:21:42', null);
INSERT INTO `sys_network` VALUES ('c673ed7afb1c737cfc5496b73a2be9caa86a1c5a88628b6c734f8ff11a61a97b', 'host', 'local', 'host', '0', '0', '{}', '1', null, '2018-07-15 15:21:42', null);
INSERT INTO `sys_network` VALUES ('f92c219505c26be11fe15a8e6f62b6406a60e0f2a3c7d0e698cbc6ac9416f412', 'sb', 'local', 'bridge', '0', '0', '{}', '1', null, '2018-07-18 17:25:56', null);

-- ----------------------------
-- Table structure for `sys_program`
-- ----------------------------
DROP TABLE IF EXISTS `sys_program`;
CREATE TABLE `sys_program` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '服务名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `port` varchar(16) DEFAULT NULL COMMENT '端口号',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统服务表';

-- ----------------------------
-- Records of sys_program
-- ----------------------------
INSERT INTO `sys_program` VALUES ('1', '后端项目', 'PaaS系统后台服务', '192.168.100.142', '9999', '2018-07-12 16:02:25', null);
INSERT INTO `sys_program` VALUES ('2', 'Nginx服务', null, '192.168.100.142', '8888', '2018-07-12 16:02:55', null);
INSERT INTO `sys_program` VALUES ('3', 'MySQL', '数据库服务', '192.168.100.142', '3306', '2018-07-12 16:03:16', null);
INSERT INTO `sys_program` VALUES ('4', 'Docker Container', '容器服务', '192.168.100.30', '2375', '2018-07-12 16:23:37', '2018-07-12 16:45:13');
INSERT INTO `sys_program` VALUES ('17', 'afaf', 'afaf', 'afaf', null, '2018-07-16 21:28:02', null);
INSERT INTO `sys_program` VALUES ('24', 'ewf', 'weqefwerf', '', '', '2018-07-19 16:45:06', null);

-- ----------------------------
-- Table structure for `sys_volume`
-- ----------------------------
DROP TABLE IF EXISTS `sys_volume`;
CREATE TABLE `sys_volume` (
  `id` varchar(255) NOT NULL,
  `obj_id` varchar(255) DEFAULT NULL COMMENT '容器ID',
  `name` varchar(255) DEFAULT NULL COMMENT '挂载名称',
  `destination` varchar(255) DEFAULT NULL COMMENT '容器内目录',
  `source` varchar(255) DEFAULT NULL COMMENT '挂载目录',
  `type` int(10) DEFAULT NULL COMMENT '类型',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sys_volume
-- ----------------------------
INSERT INTO `sys_volume` VALUES ('00c3120a2e7345cc8e37e53bee385355', 'd98ea826e266ab6c83c9bedb100ca0c90fceef794e1305cbc0945ae39869033f', 'ee61758442625a7df478627c7ac3fd01a6890a2049d6fbadc0fbe241e3800ffd', '/locals', '/var/lib/docker/volumes/ee61758442625a7df478627c7ac3fd01a6890a2049d6fbadc0fbe241e3800ffd/_data', '1', '2018-07-21 16:06:53', null);
INSERT INTO `sys_volume` VALUES ('022a81c3ee1d4d41adaeb062fb8becd7', '46ern0gbyddkqnvromhuuwy58', '03ded3f762551050ad21842296025e4c92b1baecbeeb4c655c8dfedf123ca7a4', '/cc', '/var/lib/docker/volumes/03ded3f762551050ad21842296025e4c92b1baecbeeb4c655c8dfedf123ca7a4/_data', '2', '2018-07-17 15:05:34', '2018-07-17 15:05:36');
INSERT INTO `sys_volume` VALUES ('1fe1579799064fb08e50f689826d50ff', '63ec66f93e85246a1e7aa5e18c01ed9de19db9ad453d83836be60de315a3c82e', '7b857db47618bc0135e658fa2fbe396854ce0f6dca1a482090af9f048b96cd19', '/var', '/var/lib/docker/volumes/7b857db47618bc0135e658fa2fbe396854ce0f6dca1a482090af9f048b96cd19/_data', '1', '2018-07-21 16:36:21', null);
INSERT INTO `sys_volume` VALUES ('3abb428034e24ae7b6b8db1d0383508a', 'd2b7f9632ed02a5037a19a99db9a4e8411da66d70c8f0ef849d0567b3294173e', '34487ffa2f1aa00eb176bf718d74ac749aa466c61e5aacb4e98460b7d92863d4', '/usr/local/tomcat/webapps', '/var/lib/docker/volumes/34487ffa2f1aa00eb176bf718d74ac749aa466c61e5aacb4e98460b7d92863d4/_data', '1', '2018-07-21 11:29:54', null);
INSERT INTO `sys_volume` VALUES ('4396e13a22014910a1a971c4221c1dc6', '7e351653ae48377f0b1e49e09e86930ffc4a297224367242dac71896bf1ad656', 'b2fbb032532a7a3679b39e7ae539de99bc5857f02e686df70d4487764e39743b', '/var', '/var/lib/docker/volumes/b2fbb032532a7a3679b39e7ae539de99bc5857f02e686df70d4487764e39743b/_data', '1', '2018-07-21 16:55:37', null);
INSERT INTO `sys_volume` VALUES ('486186ce65fe4ad4a80bb65c815f86de', 'kdy3aygudnqysyrla0w3amgj6', '7a988ab3fb2087aecf2cc88e58b112a48d035fd8a30d738c19191b5ff47edc99', '/qq/bb', '/var/lib/docker/volumes/7a988ab3fb2087aecf2cc88e58b112a48d035fd8a30d738c19191b5ff47edc99/_data', '2', '2018-07-16 14:42:17', '2018-07-16 14:42:17');
INSERT INTO `sys_volume` VALUES ('4bcf1b3022f54cf2b50e2f62738e973f', '49fac184ae0cfaabe1f19d37cdc85c28b5e0d2e8e9eeb0cb1bca6c2e41171af8', '64cbb07351505b5e2d0ff1267cbf15fedd232aff6b980a3f83996b2987ef4b04', '/usr/local', '/var/lib/docker/volumes/64cbb07351505b5e2d0ff1267cbf15fedd232aff6b980a3f83996b2987ef4b04/_data', '1', '2018-07-21 15:16:23', null);
INSERT INTO `sys_volume` VALUES ('63d3ab662c9b4a2dace29a53fd0f93b9', 'kdy3aygudnqysyrla0w3amgj6', '4e9a6abb5040f7a7b38a1e9d2081a57fc575ddf7eafb9d52510870d4033fbd90', '/tt/xxx', '/var/lib/docker/volumes/4e9a6abb5040f7a7b38a1e9d2081a57fc575ddf7eafb9d52510870d4033fbd90/_data', '2', '2018-07-16 14:42:17', '2018-07-16 14:42:17');
INSERT INTO `sys_volume` VALUES ('64e4099cb5304d628b5cc1c34a74a043', '46ern0gbyddkqnvromhuuwy58', '54154188c8ab8ba852e90fe6af991c25dfd824daec35830f62dd9cac14e3ca4d', '/lc', '/var/lib/docker/volumes/54154188c8ab8ba852e90fe6af991c25dfd824daec35830f62dd9cac14e3ca4d/_data', '2', '2018-07-17 15:05:34', '2018-07-17 15:05:36');
INSERT INTO `sys_volume` VALUES ('68e9992dfdcc468aa3d0f5a2ea829ec3', '2aefaef97a7a91b7f9645f5482ce7e9fbd9f461ae3e7f2426cda4a6d5e1e20b3', 'cec8532f3fb9b8cb1ac56a3b9dcd1205ba6bba9c926bd5d6715c46fd96aece25', '/house', '/var/lib/docker/volumes/cec8532f3fb9b8cb1ac56a3b9dcd1205ba6bba9c926bd5d6715c46fd96aece25/_data', '1', '2018-07-21 15:56:09', null);
INSERT INTO `sys_volume` VALUES ('9a498f77166048b89717f42f95be6051', 'qmsa4gwegmaxfvrrvpn3wrqq7', '92ac294836a11a61e7a8e5a14bbd45587bb54287cbf07e195d19d43ffed62b27', '/pop', '/var/lib/docker/volumes/92ac294836a11a61e7a8e5a14bbd45587bb54287cbf07e195d19d43ffed62b27/_data', '2', '2018-07-18 15:59:54', '2018-07-18 15:59:56');

-- ----------------------------
-- Table structure for `user_container`
-- ----------------------------
DROP TABLE IF EXISTS `user_container`;
CREATE TABLE `user_container` (
  `id` varchar(255) NOT NULL COMMENT '容器ID',
  `user_id` varchar(255) DEFAULT NULL,
  `project_id` varchar(255) DEFAULT NULL COMMENT '项目ID',
  `name` varchar(255) DEFAULT NULL COMMENT '容器名',
  `command` text COMMENT '执行命令',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `image` varchar(255) DEFAULT NULL COMMENT '镜像名',
  `status` int(10) DEFAULT NULL COMMENT '容器状态',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `env` varchar(255) DEFAULT NULL COMMENT '环境参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户容器表';

-- ----------------------------
-- Records of user_container
-- ----------------------------
INSERT INTO `user_container` VALUES ('11673d9d97d4b3f3901331e47c09dda6b59faaa63e69d8be9e9e5cb9bc345d41', '34567189513412', '58d227494a6c4625aa5d15495ae17156', 'nginxs', null, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"18118\"}]}', 'nginx:latest', '1', '2018-07-21 17:22:07', '2018-07-21 17:22:40', null);
INSERT INTO `user_container` VALUES ('49fac184ae0cfaabe1f19d37cdc85c28b5e0d2e8e9eeb0cb1bca6c2e41171af8', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'e1eeacaff8c2413a943bfd0a63d17a32', 'test-nginx', null, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"12345\"}]}', 'nginx:latest', '1', '2018-07-21 15:16:24', '2018-07-21 15:45:24', null);
INSERT INTO `user_container` VALUES ('541f266fd81417daea6bef6a7464401d9125b28f5b1f0bc79ff893dd4a55fa2a', '213yuyjgdqweyyj', '642332c7c45f48e38626f8360df410ee', 'test-nginx', null, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"17652\"}]}', 'nginx:latest', '0', '2018-07-20 21:45:37', null, '[/home]');
INSERT INTO `user_container` VALUES ('63ec66f93e85246a1e7aa5e18c01ed9de19db9ad453d83836be60de315a3c82e', '34567189513412', '58d227494a6c4625aa5d15495ae17156', 'demo-java', '[/bin/bash]', '{\"8080\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"18888\"}]}', 'java:latest', '1', '2018-07-21 16:36:22', '2018-07-21 16:38:02', null);
INSERT INTO `user_container` VALUES ('744df219da7231cacb0b612aeef0b07172bc30b54313a973c047355a913ca1e4', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'dbe538b155104a87a4c62b157b0b793e', 'co1', null, '{}', 'vimagick/iptables:latest', '0', '2018-07-21 09:50:01', '2018-07-21 15:55:28', null);
INSERT INTO `user_container` VALUES ('7e351653ae48377f0b1e49e09e86930ffc4a297224367242dac71896bf1ad656', '34567189513412', '58d227494a6c4625aa5d15495ae17156', 'javat', '[ sh, -c, while :,  do sleep 1,  done]', '{\"8080\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"18008\"}]}', 'java:latest', '0', '2018-07-21 16:55:38', null, null);
INSERT INTO `user_container` VALUES ('843edafbbd9acd05bae0ad4de25f997fd652ab18e5f2f5f2fb89aaaacac9249c', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'e1eeacaff8c2413a943bfd0a63d17a32', 'yyg', null, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"22562\"}]}', 'nginx:latest', '1', '2018-07-21 11:15:11', '2018-07-21 14:02:02', null);
INSERT INTO `user_container` VALUES ('8f403b960fe58d288a57aab08e56501df93936a729c3bf1f7e72a58845c695e2', 'f4f4bb152cf54fec94eb0d2b22d25f71', 'e1eeacaff8c2413a943bfd0a63d17a32', 'lemon-nginx', null, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"45623\"}]}', 'nginx:latest', '1', '2018-07-21 10:37:59', '2018-07-21 14:01:25', null);
INSERT INTO `user_container` VALUES ('b2553634d1e45b5b88b38fed6936f1ba731f1ac85af70e657aa496548332bd15', '213yuyjgdqweyyj', '642332c7c45f48e38626f8360df410ee', 'test-network', null, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"14752\"}]}', 'nginx:latest', '0', '2018-07-21 18:18:03', null, null);
INSERT INTO `user_container` VALUES ('d2b7f9632ed02a5037a19a99db9a4e8411da66d70c8f0ef849d0567b3294173e', '34567189513412', '58d227494a6c4625aa5d15495ae17156', 'demo-tomcat', null, '{\"8080\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"18081\"}]}', 'tomcat:latest', '1', '2018-07-21 11:29:55', '2018-07-21 11:30:28', null);
INSERT INTO `user_container` VALUES ('d98ea826e266ab6c83c9bedb100ca0c90fceef794e1305cbc0945ae39869033f', 'f4f4bb152cf54fec94eb0d2b22d25f71', '9d0d51e5058b426cacff0e8b8d2d4420', 'yii', null, '{\"80\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"51048\"}]}', 'nginx:latest', '0', '2018-07-21 16:06:54', null, null);
INSERT INTO `user_container` VALUES ('e502f2db26c211d6d5caff5bc264378e5041d774d598bda5f8e768be6340bbd9', '34567189513412', '58d227494a6c4625aa5d15495ae17156', 'demo', null, '{\"3306\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"10100\"}]}', 'mysql:latest', '1', '2018-07-21 09:23:04', '2018-07-21 09:34:20', '[MYSQL_ROOT_PASSWORD=123456]');
INSERT INTO `user_container` VALUES ('f1eb8959a0a8e8f1eb2c5445e4da8ce268fb0c710cef449c0a5d2e9316ed9c0c', '34567189513412', '58d227494a6c4625aa5d15495ae17156', 'demo-test', null, '{\"3306\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"10110\"}]}', 'mysql:5.7.21', '1', '2018-07-21 10:09:12', '2018-07-21 10:10:00', '[MYSQL_ROOT_PASSWORD=123456]');

-- ----------------------------
-- Table structure for `user_notice`
-- ----------------------------
DROP TABLE IF EXISTS `user_notice`;
CREATE TABLE `user_notice` (
  `id` varchar(255) NOT NULL,
  `sender` varchar(255) DEFAULT NULL COMMENT '发送用户',
  `type` int(10) DEFAULT NULL COMMENT '通知类型',
  `title` varchar(255) DEFAULT NULL COMMENT '通知标题',
  `content` text COMMENT '通知内容',
  `has_all` varchar(255) DEFAULT NULL COMMENT '是否全体接收',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户通知表';

-- ----------------------------
-- Records of user_notice
-- ----------------------------
INSERT INTO `user_notice` VALUES ('153178852863393', 'afaba31231451', '1', '安全告警', '无道云提醒您:10.105.120.243服务器发现有来自122.96.41.51的异地登录行为。服务器疑似被黑客入侵.', '1', '2018-07-17 08:48:48');
INSERT INTO `user_notice` VALUES ('153178888518721', 'afaba31231451', '1', '安全告警', '无道云提醒您:10.105.120.243服务器发现有来自122.96.41.51的异地登录行为。服务器疑似被黑客入侵.', '0', '2018-07-17 08:54:45');
INSERT INTO `user_notice` VALUES ('153181863470257', null, '2', '创建容器', '创建容器【5678】失败,Docker异常', '0', '2018-07-17 17:10:34');
INSERT INTO `user_notice` VALUES ('153182097733297', null, '2', '创建容器', '创建容器【new】成功', '0', '2018-07-17 17:49:36');
INSERT INTO `user_notice` VALUES ('153187494719490', null, '2', '创建容器', '创建容器【myhelloworld】成功', '0', '2018-07-18 08:49:05');
INSERT INTO `user_notice` VALUES ('153188114313809', null, '2', '创建容器', '创建容器【mynginx】成功', '0', '2018-07-18 10:32:21');
INSERT INTO `user_notice` VALUES ('153188293337505', null, '3', '创建服务', '创建服务【service2】成功', '0', '2018-07-18 11:02:12');
INSERT INTO `user_notice` VALUES ('153188298897585', null, '3', '创建服务', '创建服务【hellowwww】成功', '0', '2018-07-18 11:03:07');
INSERT INTO `user_notice` VALUES ('153188308289433', null, '3', '创建服务', '创建服务【testhelll】成功', '0', '2018-07-18 11:04:41');
INSERT INTO `user_notice` VALUES ('153188491113904', null, '3', '删除服务', '删除服务【hellowwww】失败,Docker异常', '0', '2018-07-18 11:35:09');
INSERT INTO `user_notice` VALUES ('153188491774337', null, '3', '删除服务', '删除服务【hellowwww】失败,Docker异常', '0', '2018-07-18 11:35:16');
INSERT INTO `user_notice` VALUES ('153189390411652', null, '3', '删除服务', '删除服务【hellowwww】失败,Docker异常', '0', '2018-07-18 14:05:02');
INSERT INTO `user_notice` VALUES ('153189391458787', null, '3', '删除服务', '删除服务【hellowwww】失败,Docker异常', '0', '2018-07-18 14:05:13');
INSERT INTO `user_notice` VALUES ('153189392468443', null, '3', '删除服务', '删除服务【hellowwww】失败,Docker异常', '0', '2018-07-18 14:05:23');
INSERT INTO `user_notice` VALUES ('153189401510889', null, '3', '删除服务', '删除服务【hellowwww】失败,Docker异常', '0', '2018-07-18 14:06:53');
INSERT INTO `user_notice` VALUES ('153189445882744', null, '2', '创建容器', '创建容器【hellowww】成功', '0', '2018-07-18 14:14:17');
INSERT INTO `user_notice` VALUES ('153189450157774', null, '3', '删除服务', '删除服务【hellowwww】失败,Docker异常', '0', '2018-07-18 14:15:00');
INSERT INTO `user_notice` VALUES ('153189512829196', null, '3', '删除服务', '删除服务【hellowwww】失败,Docker异常', '0', '2018-07-18 14:25:26');
INSERT INTO `user_notice` VALUES ('153189513556088', null, '3', '删除服务', '删除服务【hellowwww】失败,Docker异常', '0', '2018-07-18 14:25:34');
INSERT INTO `user_notice` VALUES ('153189532448254', null, '3', '创建服务', '创建服务【test】成功', '0', '2018-07-18 14:28:43');
INSERT INTO `user_notice` VALUES ('153189534624329', null, '3', '删除服务', '删除服务【test】失败,Docker异常', '0', '2018-07-18 14:29:04');
INSERT INTO `user_notice` VALUES ('153189573324107', null, '3', '创建服务', '创建服务【new】失败,Docker异常', '0', '2018-07-18 14:35:32');
INSERT INTO `user_notice` VALUES ('153189573324133', null, '3', '创建服务', '创建服务【new】失败,Docker异常', '0', '2018-07-18 14:35:32');
INSERT INTO `user_notice` VALUES ('153189573324167', null, '3', '创建服务', '创建服务【new】失败,Docker异常', '0', '2018-07-18 14:35:32');
INSERT INTO `user_notice` VALUES ('153189573324180', null, '3', '创建服务', '创建服务【new】成功', '0', '2018-07-18 14:35:31');
INSERT INTO `user_notice` VALUES ('153189606363927', null, '3', '删除服务', '删除服务【new】失败,Docker异常', '0', '2018-07-18 14:41:02');
INSERT INTO `user_notice` VALUES ('153189618201406', null, '3', '创建服务', '创建服务【new1】成功', '0', '2018-07-18 14:43:00');
INSERT INTO `user_notice` VALUES ('153189663059393', null, '3', '删除服务', '删除服务【new1】失败,Docker异常', '0', '2018-07-18 14:50:29');
INSERT INTO `user_notice` VALUES ('153189671476593', null, '3', '创建服务', '创建服务【qqq】成功', '0', '2018-07-18 14:51:53');
INSERT INTO `user_notice` VALUES ('153189688129803', null, '2', '创建容器', '创建容器【type】成功', '0', '2018-07-18 14:54:39');
INSERT INTO `user_notice` VALUES ('153189706584375', null, '3', '创建服务', '创建服务【wwww】成功', '0', '2018-07-18 14:57:44');
INSERT INTO `user_notice` VALUES ('153189707593278', null, '3', '删除服务', '删除服务【wwww】成功', '0', '2018-07-18 14:57:54');
INSERT INTO `user_notice` VALUES ('153189708731267', null, '3', '删除服务', '删除服务【new】失败,Docker异常', '0', '2018-07-18 14:58:05');
INSERT INTO `user_notice` VALUES ('153189819591488', null, '3', '删除服务', '删除服务【wxsService】成功', '0', '2018-07-18 15:16:34');
INSERT INTO `user_notice` VALUES ('153190034172841', null, '3', '创建服务', '创建服务【pop】成功', '0', '2018-07-18 15:52:20');
INSERT INTO `user_notice` VALUES ('153190046222090', null, '3', '删除服务', '删除服务【hellowwww】失败,Docker异常', '0', '2018-07-18 15:54:20');
INSERT INTO `user_notice` VALUES ('153190048229174', null, '3', '删除服务', '删除服务【pop】成功', '0', '2018-07-18 15:54:40');
INSERT INTO `user_notice` VALUES ('153190059229943', null, '3', '删除服务', '删除服务【myNginx3】成功', '0', '2018-07-18 15:56:30');
INSERT INTO `user_notice` VALUES ('153190063545653', null, '3', '创建服务', '创建服务【ser1】成功', '0', '2018-07-18 15:57:14');
INSERT INTO `user_notice` VALUES ('153190079742534', null, '3', '创建服务', '创建服务【pop】成功', '0', '2018-07-18 15:59:56');
INSERT INTO `user_notice` VALUES ('153190259292974', null, '4', '导入镜像', '导入镜像【local/34567189513412/zzz:】失败,Docker导入失败', '0', '2018-07-18 16:29:51');
INSERT INTO `user_notice` VALUES ('153191563415528', null, '3', '删除服务', '删除服务【ser1】成功', '0', '2018-07-18 20:07:12');
INSERT INTO `user_notice` VALUES ('153191566244766', null, '3', '创建服务', '创建服务【test】成功', '0', '2018-07-18 20:07:41');
INSERT INTO `user_notice` VALUES ('153191567111529', null, '3', '删除服务', '删除服务【test】成功', '0', '2018-07-18 20:07:49');
INSERT INTO `user_notice` VALUES ('153191625071892', null, '3', '创建服务', '创建服务【sagf】成功', '0', '2018-07-18 20:17:29');
INSERT INTO `user_notice` VALUES ('153196609824011', null, '4', '导入镜像', '导入镜像【local/34567189513412/xxx:】失败,Docker导入失败', '0', '2018-07-19 10:08:16');
INSERT INTO `user_notice` VALUES ('153196617159907', null, '4', '导入镜像', '导入镜像【local/34567189513412/xxx:】失败,Docker导入失败', '0', '2018-07-19 10:09:30');
INSERT INTO `user_notice` VALUES ('153196650070855', null, '4', '导入镜像', '导入镜像【local/34567189513412/mm:】失败,Docker导入失败', '0', '2018-07-19 10:14:59');
INSERT INTO `user_notice` VALUES ('153196666121545', null, '4', '导入镜像', '导入镜像【local/34567189513412/mm:】失败,Docker导入失败', '0', '2018-07-19 10:17:39');
INSERT INTO `user_notice` VALUES ('153196703949460', null, '4', '导入镜像', '导入镜像【local/34567189513412/cc:】失败,Docker导入失败', '0', '2018-07-19 10:23:58');
INSERT INTO `user_notice` VALUES ('153196715770824', null, '4', '导入镜像', '导入镜像【local/34567189513412/cc:】失败,Docker导入失败', '0', '2018-07-19 10:25:56');
INSERT INTO `user_notice` VALUES ('153196716815431', null, '4', '导入镜像', '导入镜像【local/34567189513412/ssss:】失败,Docker导入失败', '0', '2018-07-19 10:26:06');
INSERT INTO `user_notice` VALUES ('153196719819087', null, '4', '导入镜像', '导入镜像【local/34567189513412/ssss:】失败,Docker导入失败', '0', '2018-07-19 10:26:36');
INSERT INTO `user_notice` VALUES ('153196726980131', null, '4', '导入镜像', '导入镜像【local/34567189513412/mm:】失败,Docker导入失败', '0', '2018-07-19 10:27:48');
INSERT INTO `user_notice` VALUES ('153196752573447', null, '4', '导入镜像', '导入镜像【local/34567189513412/:】失败,Docker导入失败', '0', '2018-07-19 10:32:04');
INSERT INTO `user_notice` VALUES ('153196754838160', null, '4', '导入镜像', '导入镜像【local/34567189513412/xxxx:】失败,Docker导入失败', '0', '2018-07-19 10:32:26');
INSERT INTO `user_notice` VALUES ('153196781189314', null, '4', '导入镜像', '导入镜像【local/34567189513412/xxxx:】失败,Docker导入失败', '0', '2018-07-19 10:36:50');
INSERT INTO `user_notice` VALUES ('153196787664048', null, '4', '导入镜像', '导入镜像【local/34567189513412/xxxx:】失败,Docker导入失败', '0', '2018-07-19 10:37:55');
INSERT INTO `user_notice` VALUES ('153196794292650', null, '4', '导入镜像', '导入镜像【local/34567189513412/xxxx:】失败,Docker导入失败', '0', '2018-07-19 10:39:01');
INSERT INTO `user_notice` VALUES ('153196798574372', null, '4', '导入镜像', '导入镜像【local/34567189513412/xxxx:】失败,Docker导入失败', '0', '2018-07-19 10:39:44');
INSERT INTO `user_notice` VALUES ('153196802648403', null, '4', '导入镜像', '导入镜像【local/34567189513412/xxxx:】失败,Docker导入失败', '0', '2018-07-19 10:40:25');
INSERT INTO `user_notice` VALUES ('153196822401364', null, '4', '导入镜像', '导入镜像【local/34567189513412/xxxx:】失败,Docker导入失败', '0', '2018-07-19 10:43:42');
INSERT INTO `user_notice` VALUES ('153196839957678', null, '4', '导入镜像', '导入镜像【local/34567189513412/vvvv:】失败,Docker导入失败', '0', '2018-07-19 10:46:38');
INSERT INTO `user_notice` VALUES ('153196840438078', null, '4', '导入镜像', '导入镜像【local/34567189513412/vvvv:】失败,Docker导入失败', '0', '2018-07-19 10:46:42');
INSERT INTO `user_notice` VALUES ('153196874384833', null, '4', '导入镜像', '导入镜像【local/34567189513412/vvvv:】失败,Docker导入失败', '0', '2018-07-19 10:52:22');
INSERT INTO `user_notice` VALUES ('153196875262129', null, '4', '导入镜像', '导入镜像【local/34567189513412/vvvv:】失败,Docker导入失败', '0', '2018-07-19 10:52:31');
INSERT INTO `user_notice` VALUES ('153196880863297', null, '4', '导入镜像', '导入镜像【local/34567189513412/vvvv:】失败,Docker导入失败', '0', '2018-07-19 10:53:27');
INSERT INTO `user_notice` VALUES ('153196885689435', null, '4', '导入镜像', '导入镜像【local/34567189513412/vvvv:】失败,Docker导入失败', '0', '2018-07-19 10:54:15');
INSERT INTO `user_notice` VALUES ('153196888921602', null, '4', '导入镜像', '导入镜像【local/34567189513412/vvvv:】失败,Docker导入失败', '0', '2018-07-19 10:54:47');
INSERT INTO `user_notice` VALUES ('153196905260171', null, '4', '导入镜像', '导入镜像【local/34567189513412/iii:latest】成功', '0', '2018-07-19 10:57:31');
INSERT INTO `user_notice` VALUES ('153197049173721', null, '2', '创建容器', '创建容器【qunidayede】成功', '0', '2018-07-19 11:21:30');
INSERT INTO `user_notice` VALUES ('153197929176284', null, '4', '导入镜像', '导入镜像【local/34567189513412/wwww:latest】成功', '0', '2018-07-19 13:48:09');
INSERT INTO `user_notice` VALUES ('153198177661442', null, '4', '推送Docker Hub镜像', '推送镜像【jitwxs/cc】成功', '0', '2018-07-19 14:29:34');
INSERT INTO `user_notice` VALUES ('153198193079829', null, '4', '导入镜像', '导入镜像【local/34567189513412/cccccccc:latest】成功', '0', '2018-07-19 14:32:09');
INSERT INTO `user_notice` VALUES ('153198461319891', null, '2', '创建容器', '创建容器【sb-mysql】成功', '0', '2018-07-19 15:16:51');
INSERT INTO `user_notice` VALUES ('153198497542519', null, '2', '创建容器', '创建容器【sb-mysqlww】成功', '0', '2018-07-19 15:22:53');
INSERT INTO `user_notice` VALUES ('153198645110704', null, '4', '拉取Docker Hub镜像', '拉取镜像【busybox:latest】成功', '0', '2018-07-19 15:47:29');
INSERT INTO `user_notice` VALUES ('153198726176821', null, '4', '拉取Docker Hub镜像', '拉取镜像【centos:latest】成功', '0', '2018-07-19 16:01:00');
INSERT INTO `user_notice` VALUES ('153199204953785', 'afaba31231451', '2', '啊啊啊', '<p>a</p><p>啊啊啊</p>', '1', '2018-07-19 17:20:47');
INSERT INTO `user_notice` VALUES ('153199791840024', null, '3', '删除服务', '删除服务【sagf】成功', '0', '2018-07-19 18:58:36');
INSERT INTO `user_notice` VALUES ('153199825953102', null, '2', '创建容器', '创建容器【pip】成功', '0', '2018-07-19 19:04:17');
INSERT INTO `user_notice` VALUES ('153204813608339', null, '4', '拉取Docker Hub镜像', '拉取镜像【mysql:latest】失败，连接超时', '0', '2018-07-20 08:55:33');
INSERT INTO `user_notice` VALUES ('153204834652084', null, '4', '拉取Docker Hub镜像', '拉取镜像【mysql:latest】成功', '0', '2018-07-20 08:59:03');
INSERT INTO `user_notice` VALUES ('153205244504168', null, '4', '拉取Docker Hub镜像', '拉取镜像【helloworld:latest】失败，Docker拉取异常', '0', '2018-07-20 10:07:22');
INSERT INTO `user_notice` VALUES ('153205302269446', null, '2', '创建容器', '创建容器【pup】成功', '0', '2018-07-20 10:16:59');
INSERT INTO `user_notice` VALUES ('153207118514480', null, '2', '创建容器', '创建容器【power】成功', '0', '2018-07-20 15:19:44');
INSERT INTO `user_notice` VALUES ('153208206845652', null, '2', '创建容器', '创建容器【mynginx】成功', '0', '2018-07-20 18:21:08');
INSERT INTO `user_notice` VALUES ('153209254150857', null, '4', '导入镜像', '导入镜像【local/f4f4bb152cf54fec94eb0d2b22d25f71/uno:biu】成功', '0', '2018-07-20 21:15:41');
INSERT INTO `user_notice` VALUES ('153209279603250', null, '4', '导入镜像', '导入镜像【local/f4f4bb152cf54fec94eb0d2b22d25f71/biubiubiu:tag】成功', '0', '2018-07-20 21:19:56');
INSERT INTO `user_notice` VALUES ('153209289540972', null, '4', '导入镜像', '导入镜像【local/f4f4bb152cf54fec94eb0d2b22d25f71/yy:uu】成功', '0', '2018-07-20 21:21:35');
INSERT INTO `user_notice` VALUES ('153209291703707', null, '4', '导入镜像', '导入镜像【local/f4f4bb152cf54fec94eb0d2b22d25f71/ii:uu】成功', '0', '2018-07-20 21:21:57');
INSERT INTO `user_notice` VALUES ('153209300666418', null, '4', '导入镜像', '导入镜像【local/f4f4bb152cf54fec94eb0d2b22d25f71/kk:tt】成功', '0', '2018-07-20 21:23:26');
INSERT INTO `user_notice` VALUES ('153209302647701', null, '4', '导入镜像', '导入镜像【local/f4f4bb152cf54fec94eb0d2b22d25f71/io:oi】成功', '0', '2018-07-20 21:23:46');
INSERT INTO `user_notice` VALUES ('153209304955433', null, '4', '导入镜像', '导入镜像【local/f4f4bb152cf54fec94eb0d2b22d25f71/po:io】成功', '0', '2018-07-20 21:24:09');
INSERT INTO `user_notice` VALUES ('153209433791029', null, '2', '创建容器', '创建容器【test-nginx】成功', '0', '2018-07-20 21:45:38');
INSERT INTO `user_notice` VALUES ('153213618508038', null, '2', '创建容器', '创建容器【demo】成功', '0', '2018-07-21 09:23:04');
INSERT INTO `user_notice` VALUES ('153213780142932', null, '2', '创建容器', '创建容器【co1】成功', '0', '2018-07-21 09:50:00');
INSERT INTO `user_notice` VALUES ('153213882842562', null, '4', '拉取Docker Hub镜像', '拉取镜像【mysql:5.7.21】成功', '0', '2018-07-21 10:07:07');
INSERT INTO `user_notice` VALUES ('153213895231545', null, '2', '创建容器', '创建容器【demo-test】成功', '0', '2018-07-21 10:09:11');
INSERT INTO `user_notice` VALUES ('153214067950414', null, '2', '创建容器', '创建容器【lemon-nginx】成功', '0', '2018-07-21 10:37:58');
INSERT INTO `user_notice` VALUES ('153214161922251', null, '4', '拉取Docker Hub镜像', '拉取镜像【tomcat:latest】成功', '0', '2018-07-21 10:53:38');
INSERT INTO `user_notice` VALUES ('153214207457946', null, '2', '创建容器', '创建容器【demo-tomcat】成功', '0', '2018-07-21 11:01:13');
INSERT INTO `user_notice` VALUES ('153214257403225', null, '3', '创建服务', '创建服务【goodservice】成功', '0', '2018-07-21 11:09:33');
INSERT INTO `user_notice` VALUES ('153214291124429', null, '2', '创建容器', '创建容器【yyg】成功', '0', '2018-07-21 11:15:10');
INSERT INTO `user_notice` VALUES ('153214379558102', null, '2', '创建容器', '创建容器【demo-tomcat】成功', '0', '2018-07-21 11:29:54');
INSERT INTO `user_notice` VALUES ('153215738456156', null, '2', '创建容器', '创建容器【test-nginx】成功', '0', '2018-07-21 15:16:23');
INSERT INTO `user_notice` VALUES ('153215977091610', null, '2', '创建容器', '创建容器【nginx_1】成功', '0', '2018-07-21 15:56:10');
INSERT INTO `user_notice` VALUES ('153215996220455', null, '2', '创建容器', '创建容器【ttt】成功', '0', '2018-07-21 15:59:21');
INSERT INTO `user_notice` VALUES ('153216013276083', null, '2', '创建容器', '创建容器【ttt】成功', '0', '2018-07-21 16:02:11');
INSERT INTO `user_notice` VALUES ('153216015737977', null, '2', '创建容器', '创建容器【ttt】成功', '0', '2018-07-21 16:02:36');
INSERT INTO `user_notice` VALUES ('153216018724082', null, '2', '创建容器', '创建容器【ttt】成功', '0', '2018-07-21 16:03:06');
INSERT INTO `user_notice` VALUES ('153216021792555', null, '2', '创建容器', '创建容器【wqe】成功', '0', '2018-07-21 16:03:37');
INSERT INTO `user_notice` VALUES ('153216034202476', null, '2', '创建容器', '创建容器【asf】成功', '0', '2018-07-21 16:05:41');
INSERT INTO `user_notice` VALUES ('153216041450526', null, '2', '创建容器', '创建容器【yii】成功', '0', '2018-07-21 16:06:53');
INSERT INTO `user_notice` VALUES ('153216053210576', null, '3', '创建服务', '创建服务【sv1】成功', '0', '2018-07-21 16:08:51');
INSERT INTO `user_notice` VALUES ('153216218262752', null, '2', '创建容器', '创建容器【demo-java】成功', '0', '2018-07-21 16:36:21');
INSERT INTO `user_notice` VALUES ('153216333847291', null, '2', '创建容器', '创建容器【javat】成功', '0', '2018-07-21 16:55:37');
INSERT INTO `user_notice` VALUES ('153216492732287', null, '2', '创建容器', '创建容器【nginxs】成功', '0', '2018-07-21 17:22:06');
INSERT INTO `user_notice` VALUES ('153216830944895', null, '2', '创建容器', '创建容器【test-network】成功', '0', '2018-07-21 18:18:28');

-- ----------------------------
-- Table structure for `user_notice_desc`
-- ----------------------------
DROP TABLE IF EXISTS `user_notice_desc`;
CREATE TABLE `user_notice_desc` (
  `id` varchar(255) NOT NULL,
  `notice_id` varchar(255) DEFAULT NULL COMMENT '通知ID',
  `receive` varchar(255) DEFAULT NULL COMMENT '接收者',
  `has_read` tinyint(255) DEFAULT NULL COMMENT '是否已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='消息发送详情表';

-- ----------------------------
-- Records of user_notice_desc
-- ----------------------------
INSERT INTO `user_notice_desc` VALUES ('020dcec8e227458a942b511e3ca02c95', '153191567111529', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('04d400913e40427ea6d86175ec89ddbb', '153190063545653', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('0590eff102634d7eb8b752cdd910cec4', '153199825953102', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('066871fc91f74594bd516a83f69a1afb', '153199204953785', 'afafaf24131', '0');
INSERT INTO `user_notice_desc` VALUES ('066cf6f7640a439ca7d89dccc481d424', '153189450157774', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('0707d4bd8d7649b1be024e57d2252d56', '153199204953785', '3241tfsegvsds', '0');
INSERT INTO `user_notice_desc` VALUES ('07ea478ccced4cf5937c023ce18ff369', '153199204953785', 'agfag13131', '0');
INSERT INTO `user_notice_desc` VALUES ('082cad5a551c4000a0f63000a42452af', '153189391458787', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('0bd88d9acfa54650b0b8dc9614b4258d', '153199204953785', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('0e4f7c6e3a9f49869045bddfa0a689cd', '153199791840024', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('1112eea4bc4e450bbbb7d490ed44d492', '153196885689435', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('112c2e2128754d0882479781be9f2cfa', '153189706584375', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('125af627d2474bc38f04365ea514702a', '153216218262752', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('13e057ca3ff34562892d4568d2d7c46d', '153196798574372', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('1ca4fe986f2b441b94a780a9dd9db420', '153189401510889', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('1dff89955e304afbb4f76634ba4d5775', '153189618201406', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('21c5c1a4d1b7495a8ae1e59419f47479', '153178852863393', '34567189513412', '1');
INSERT INTO `user_notice_desc` VALUES ('23f3893d87214b99adfadbdea4d0eaa5', '153213882842562', '1231451941131', '0');
INSERT INTO `user_notice_desc` VALUES ('25c2a42d24da4d479e201fe4f4835b90', '153205244504168', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('27b0d84eadd042a097cbd80a1bf8d524', '153178852863393', 'agfag13131', '0');
INSERT INTO `user_notice_desc` VALUES ('2a4e548a3aa74db8a516b57e942fa38b', '153214067950414', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('2a61c8627b8f4eb3a6d0e220c07bc19c', '153178888518721', '34567189513412', '1');
INSERT INTO `user_notice_desc` VALUES ('2cd3d37df4064366835fcd90ccea5247', '153181863470257', 'afafaf24131', '0');
INSERT INTO `user_notice_desc` VALUES ('2f4a69c6409e4b07af52dc81a52a35ed', '153196787664048', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('303039f498c44d728e0394f4227d3846', '153189445882744', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('352d23f8c46d4d078c1a39c10c4c9cec', '153196905260171', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('3bb00ba3affe46708212a49d0dbfa808', '153196822401364', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('407ea6bcbf154bc6a0952378de47d885', '153191563415528', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('4130e9268ea64c4abe86bfece0d2a15c', '153209291703707', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('4674da7785764ef7ba61a32fb23843d5', '153199204953785', 'afaba31231451', '1');
INSERT INTO `user_notice_desc` VALUES ('47f587ccc78842d09ec84bcd23688e1a', '153178852863393', 'afaba31231451', '0');
INSERT INTO `user_notice_desc` VALUES ('49696b3ac1714350a9b9bf3b095192d7', '153196875262129', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('49aa70c33fc94a26ba21f06a5f4ef854', '153191566244766', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('49cca590eb2d4217b4791b11a13ab460', '153204834652084', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('4be90041fa7342e080202fe5f376c63a', '153216034202476', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('4e1a158ca7644c16adeb465d89651bb8', '153198497542519', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('4eda6ce234544204a134ee4f455834a0', '153216492732287', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('5106b0ae845c469bb934dd82d500119b', '153215977091610', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('530c643f76fa4480b786d5a1d1598ddf', '153205302269446', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('540a631a16514658a1454456996fbfad', '153178852863393', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('5582b4da23e2450b9abc4a915282681a', '153198726176821', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('5e31a99879f94242950e3af4fcbd17d0', '153209300666418', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('5fcb3211ce0c42f6b07454f49bca15fb', '153196802648403', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('600493310642418fa7f5988f0095ecf3', '153188491774337', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('6076df5b27c64b929e726cb8741c5adf', '153190046222090', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('624165aaba5342249cadae03ceaeb4d8', '153209302647701', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('64902f66b7af46d1a892acdf07f8670c', '153196839957678', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('69ad3012559b441c96c7398f82fd7f59', '153196880863297', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('6a6231f0bf644b259c3c534bdc1ddcc2', '153215738456156', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('6beb693196b74750ba45b8e493076c90', '153216041450526', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('6cc6aca8101e4dda898d234e4349f5f5', '153191625071892', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('6e0db14b092844598023be0d6d180e27', '153189392468443', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('6e1d70c304c749c49bba1a66c6e0230b', '153199204953785', '213yuyjgdqweyyj', '0');
INSERT INTO `user_notice_desc` VALUES ('6f73e002a6ed44908cb7a17ef74d05a9', '153198193079829', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('712191514b21456790aedba9ddabf911', '153196794292650', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('728de5643ebc4f20b0fd79f39f03d0b0', '153178852863393', '1241414124156', '0');
INSERT INTO `user_notice_desc` VALUES ('7406a9419074475a8c0eb37747369051', '153209433791029', '213yuyjgdqweyyj', '0');
INSERT INTO `user_notice_desc` VALUES ('7522cc7e705b491a9bc57c3e796c1131', '153209289540972', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('758026e208a145018cc8058df3ad3132', '153216018724082', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('76be2ae4a3cc4d4c8d56174bdf1ebb2f', '153215996220455', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('78b4dad5961f4bd8b9032df577b2664b', '153209304955433', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('7a3e6c93fc2148c989b5cf6d22b9b956', '153189534624329', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('7d3383bf0050459aa38290c04890d70c', '153214207457946', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('7e79e619baa94a9ca0129ddde32476b6', '153189532448254', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('7fad3d7f29584ccaa81bfd7fcfba0e0b', '153208206845652', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('8064e027d964432280cacd1105a30a6a', '153178852863393', '1231451941131', '0');
INSERT INTO `user_notice_desc` VALUES ('81ccb53849db44e7b933af143b344356', '153182097733297', 'afafaf24131', '0');
INSERT INTO `user_notice_desc` VALUES ('82fefc2ccc9547b68aa183dd92b644f9', '153209279603250', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('8337bc79debe48fcb030cdb3192bf525', '153188308289433', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('834baf6617614a22accc5d375b4d6e69', '153189573324180', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('83bb6c5069a64873b2f9cf153d70f62a', '153188491113904', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('8603c2a9e23647759df182b9f2153b0d', '153199204953785', '1231451941131', '0');
INSERT INTO `user_notice_desc` VALUES ('8615ecdc5d884b98bba959f90bc8e8e2', '153178852863393', '4151361367131', '0');
INSERT INTO `user_notice_desc` VALUES ('88d8a92dc4254742a824ec10026679b5', '153214379558102', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('894b61121fb545289ce6c913457e1ea5', '153196752573447', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('89be5aaf276b4b6e94b0dbba9b2cbc54', '153213618508038', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('8da69389ae6449339ca680191677e968', '153189708731267', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('8e992cb17a1d4d1481e8ddfb7e6b72c6', '153214161922251', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('8f28424097674b6e81744f338dd31173', '153196716815431', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('916fdabe1e2642368aba3fe9aaedf360', '153199204953785', '1249181023313', '0');
INSERT INTO `user_notice_desc` VALUES ('924d7e156aff47c3b0f4714407719c59', '153189707593278', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('92e0ae3e3d4d4d1d9429d1e9a1d6bf4b', '153189663059393', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('92e9ee7c0fab4feb8ee1f11d5a216aec', '153198645110704', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('93077519223c4fcf9df8199f7fc67b57', '153196726980131', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('948165b05f3a4e69ac542e6abad37bb4', '153196650070855', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('96bb678847fc4d0d98e06998c2cf8999', '153188293337505', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('9781daa1296e42088b5c42fae9ac5d9c', '153196609824011', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('984ea6bc7298434b9c30f37611396cd1', '153190079742534', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('9e8ea970dc6c45e0a59732c824460fab', '153196888921602', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('9f65bf74eb9a48d8aee1a5d377468704', '153189390411652', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('a1312eac9e4d4223955fc31e5a825c89', '153214291124429', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('a16d2c69eba24ff39b7b29ec6300e75c', '153188114313809', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('a37a7bd912aa4d20abf121ef7dbbe009', '153199204953785', '1241414124156', '0');
INSERT INTO `user_notice_desc` VALUES ('a3d64ee299374a56a361ac57a801a0b2', '153190259292974', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('a45e9eb776a746279315c2f01ee57490', '153213895231545', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('a5605b02893d4305a9aadd992dc03d8d', '153189512829196', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('a6bceb470a9442b2ba722784a5117cce', '153209254150857', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('a7e8ee45ecdb4291b6dc330a872cb4e0', '153196715770824', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('a8302849d6644ada8c8fc9fe167d70a9', '153189606363927', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('a91e0e1586e54ed6bf3e08f5d45baa7f', '153190034172841', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('a9f782ee19b245ac85bc9c749e3e67e1', '153197049173721', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('aba40ac81cc04f2698efea9795458da5', '153216053210576', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('ae6621b646cc47b19a9c80340979a4ae', '153188298897585', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('b0d0b58076c947bb99fc5f27f4767274', '153190048229174', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('b3688720b0bd4caea4c2d2901850b2dd', '153216013276083', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('b7648c7144fe4804a73e33e1a2c42fe3', '153196719819087', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('b7d08ce8a7e3429787bf713623fd1189', '153196781189314', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('b818e10dddcd4c01acb68fe7a3695c71', '153216015737977', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('b8afdf2b0cb04426be8b88579e557ce9', '153199204953785', '1019873002210226177', '0');
INSERT INTO `user_notice_desc` VALUES ('b9b6a19ce6594e33a9d78f77f503a42f', '153199204953785', '12314519411333', '0');
INSERT INTO `user_notice_desc` VALUES ('bafdf6323f1648c09f2c6b1d6648ecfb', '153178852863393', '1249181023313', '0');
INSERT INTO `user_notice_desc` VALUES ('bb17cb0a629d463e9825ccfa0388b452', '153189573324133', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('bd1ad17146a4438b9481f002db761252', '153197929176284', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('bf72f6a35b404114a6cb98e5874d5d26', '153187494719490', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('c6811bd73f1a4be79e5e802538479435', '153196703949460', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('c711148a0fcb4ffaa007977bdebc6abe', '153199204953785', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('d348f2b025b544adbddc0b36f30ab6dd', '153213780142932', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('d34d770747a24a75bce61b699eb0bd6a', '153216333847291', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('d39977167ed74025893437192b62bd90', '153189573324167', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('d46e4f86145b4e88872ec3ead8456fdf', '153178852863393', '213yuyjgdqweyyj', '0');
INSERT INTO `user_notice_desc` VALUES ('d734accc44644b068cf9e927766b3b3b', '153196874384833', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('d81dcd78841847dabb1aef0f7be4051e', '153198177661442', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('d9f2f02edb144e10b92ca523d262d692', '153189573324107', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('db8a9a7b9e4b491c8ca675ae3988e373', '153196666121545', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('dcdfba353183412789008c0ced151bc2', '153178852863393', 'afafaf24131', '0');
INSERT INTO `user_notice_desc` VALUES ('ddb3a71afa9b4b619ccece46661cf3f0', '153214257403225', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('df4b22c693a34ee79419d3f486584967', '153204813608339', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('e018399beb03461e8623300b052d86ea', '153216021792555', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('e628185574f74c6ea9c47fb7e4ef156c', '153189688129803', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('e6e5e2c4562d4e02922fbd5b9c6580ee', '153198461319891', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('e7355376188746049745529288713b97', '153207118514480', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('e8cbd17207824105a2852d6379fa51d5', '153196754838160', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('ef4a605e06f040df9f9b82766a0eb31c', '153189513556088', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('f4616db868574af88f62c481a8d56dea', '153196840438078', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('f8e58ebb41bb48f2a7b4458fdf6b1e10', '153189671476593', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');
INSERT INTO `user_notice_desc` VALUES ('fb89230a1df2419c92a7691bb347da3d', '153189819591488', 'afaba31231451', '0');
INSERT INTO `user_notice_desc` VALUES ('ff2a71820f6f4c89b931cab648e2d8e5', '153216830944895', '213yuyjgdqweyyj', '0');
INSERT INTO `user_notice_desc` VALUES ('ff59011d175b437797a8965a7a3e28d0', '153196617159907', '34567189513412', '0');
INSERT INTO `user_notice_desc` VALUES ('ff70ae00395d4792800dd5e0bcc30c4f', '153190059229943', 'f4f4bb152cf54fec94eb0d2b22d25f71', '0');

-- ----------------------------
-- Table structure for `user_project`
-- ----------------------------
DROP TABLE IF EXISTS `user_project`;
CREATE TABLE `user_project` (
  `id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `name` varchar(255) DEFAULT NULL COMMENT '项目名',
  `description` varchar(255) DEFAULT NULL COMMENT '项目描述',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_project
-- ----------------------------
INSERT INTO `user_project` VALUES ('33398ea14de14d979a495a3a53051b1a', 'afafaf24131', '昂热润滑油', '昂如虎添翼', '2018-07-14 15:09:50', '2018-07-14 16:51:59');
INSERT INTO `user_project` VALUES ('58d227494a6c4625aa5d15495ae17156', '34567189513412', 'GR', 'AFG', '2018-07-14 15:10:17', null);
INSERT INTO `user_project` VALUES ('642332c7c45f48e38626f8360df410ee', '213yuyjgdqweyyj', 'xxxx', 'sdsdsd', '2018-07-15 14:27:42', null);
INSERT INTO `user_project` VALUES ('6b3f4099393e44ada3fc2c3d68f089e5', 'afafaf24131', '挂号', '双方共同', '2018-07-14 15:10:04', null);
INSERT INTO `user_project` VALUES ('738f28a08c0146acb09e75c8ee146adb', 'afafaf24131', 'yu', 'hu8uj8', '2018-07-14 10:30:09', null);
INSERT INTO `user_project` VALUES ('7570bbe140c34a328e6d5c08a66675cc', 'afafaf24131', 'feawafqef', 'avwfvv', '2018-07-14 14:02:49', null);
INSERT INTO `user_project` VALUES ('758a7c9dcebd4e41b2de118356695dba', 'afafaf24131', '5预计可露露', '我和谁摄入付款深V', '2018-07-14 14:41:37', '2018-07-14 14:47:35');
INSERT INTO `user_project` VALUES ('913f0b0ab57141e0aa1f90baac7c8d60', 'afafaf24131', 'AERGG', 'AFGG', '2018-07-14 15:10:21', null);
INSERT INTO `user_project` VALUES ('9b84a6acd0f24e07ac5695a56986eaa7', 'afafaf24131', 'sdfav', 'eafwegeff', '2018-07-14 18:08:20', null);
INSERT INTO `user_project` VALUES ('9d0d51e5058b426cacff0e8b8d2d4420', 'f4f4bb152cf54fec94eb0d2b22d25f71', '草莓干', '好吃', '2018-07-21 15:55:15', null);
INSERT INTO `user_project` VALUES ('9f7bb35e1eea4ccab7e0df916cb961fe', 'afafaf24131', '二个人体会局认可', '热乎若拖亏咯偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶偶', '2018-07-14 15:09:58', null);
INSERT INTO `user_project` VALUES ('a5744e8f469746cea01e03010f3ddfe9', 'afafaf24131', '5预计可露露', '仍泰和家园羊肉汤', '2018-07-14 11:34:18', null);
INSERT INTO `user_project` VALUES ('ablaiawru1321', '4151361367131', '测试项目1', '测试项目1的描述', '2018-06-30 10:14:43', null);
INSERT INTO `user_project` VALUES ('ae73ea0aa5c64b10971a161f385bde4c', 'afafaf24131', '大概', '非', '2018-07-14 15:10:10', null);
INSERT INTO `user_project` VALUES ('afaowrwfvxz4e1', '4151361367131', '测试项目2', '测试项目2的描述', '2018-06-30 10:14:57', null);
INSERT INTO `user_project` VALUES ('bkjaqalfa231fa', '1231451941131', '项目2', '项目2dddd', '2018-06-30 10:14:16', '2018-07-12 15:43:01');
INSERT INTO `user_project` VALUES ('d599aa5b00994a429d5039c21cf0f559', 'afafaf24131', 'EFSFG', 'DSFGGG', '2018-07-14 15:10:14', null);
INSERT INTO `user_project` VALUES ('dbe538b155104a87a4c62b157b0b793e', 'f4f4bb152cf54fec94eb0d2b22d25f71', '项目p', '测试updatep', '2018-07-18 08:47:39', '2018-07-21 15:55:28');
INSERT INTO `user_project` VALUES ('e1eeacaff8c2413a943bfd0a63d17a32', 'f4f4bb152cf54fec94eb0d2b22d25f71', '项目t', 'qqqq', '2018-07-21 13:57:02', null);
INSERT INTO `user_project` VALUES ('e64c5069df7a42789d8fde36e8a8b990', 'afafaf24131', '阿芳', 'asgferhgojjhpkytkujkm', '2018-07-14 14:40:15', null);
INSERT INTO `user_project` VALUES ('eefe3167399c45d687b6709851ecf3b8', 'afafaf24131', '阿芳', '发热该如何', '2018-07-14 10:33:07', null);
INSERT INTO `user_project` VALUES ('f45a65eae10842b68cebeb86b10940cb', 'afafaf24131', 'sunyian', 'ssss', '2018-07-16 10:27:44', null);

-- ----------------------------
-- Table structure for `user_service`
-- ----------------------------
DROP TABLE IF EXISTS `user_service`;
CREATE TABLE `user_service` (
  `id` varchar(255) NOT NULL,
  `project_id` varchar(255) DEFAULT NULL COMMENT '项目ID',
  `name` varchar(255) DEFAULT NULL COMMENT '服务名',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `replicas` int(10) DEFAULT NULL COMMENT '横向扩展数量',
  `command` text COMMENT '执行命令',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `image` varchar(255) DEFAULT NULL COMMENT '使用镜像',
  `env` varchar(255) DEFAULT NULL COMMENT '环境变量',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户服务表';

-- ----------------------------
-- Records of user_service
-- ----------------------------
INSERT INTO `user_service` VALUES ('04ocokp5kng7vsl5bzb6rzzo5', '33398ea14de14d979a495a3a53051b1a', 'jitwxsS1', '213yuyjgdqweyyj', '1', null, '{}', 'hello-world:latest', null, '2018-07-16 14:33:37', null);
INSERT INTO `user_service` VALUES ('0cd7tari7e6pv38vwcb1aei22', '33398ea14de14d979a495a3a53051b1a', 'serviceLCsss', 'afafaf24131', '2', null, '{\"80\":15667}', 'nginx:latest', null, '2018-07-16 15:05:59', null);
INSERT INTO `user_service` VALUES ('46ern0gbyddkqnvromhuuwy58', '913f0b0ab57141e0aa1f90baac7c8d60', 'ARGWRTH', 'afafaf24131', '3', '[pwd, pwd]', '{\"8888\":14587}', 'hello-world:latest', '[111, 222]', '2018-07-17 15:05:36', null);
INSERT INTO `user_service` VALUES ('csjgwrye18ixze9kgrjus3lot', '33398ea14de14d979a495a3a53051b1a', 'sfegss', 'afafaf24131', '1', null, '{}', 'hello-world:latest', null, '2018-07-16 15:20:31', null);
INSERT INTO `user_service` VALUES ('fa096rzvp3658llejj8q3v2rx', '642332c7c45f48e38626f8360df410ee', 'wxsService1', '213yuyjgdqweyyj', '1', null, '{}', 'hello-world:latest', null, '2018-07-16 11:23:30', null);
INSERT INTO `user_service` VALUES ('ia48vlpaz8aib1zhxuzygstja', '33398ea14de14d979a495a3a53051b1a', 'serviceLC', 'afafaf24131', '1', null, '{\"80\":15666}', 'nginx:latest', null, '2018-07-16 15:04:40', null);
INSERT INTO `user_service` VALUES ('kdy3aygudnqysyrla0w3amgj6', '642332c7c45f48e38626f8360df410ee', 'jitwxsS2', '213yuyjgdqweyyj', '1', null, '{}', 'hello-world:latest', null, '2018-07-16 14:42:17', null);
INSERT INTO `user_service` VALUES ('ouz5h2f9svlg7w0hejyxkgtfs', '7570bbe140c34a328e6d5c08a66675cc', 'wwwwwww', 'afafaf24131', '2', null, '{\"80\":15675}', 'deis/helloworld:latest', null, '2018-07-17 15:12:30', null);
INSERT INTO `user_service` VALUES ('q53qoxqh9jio8od0pjrl0ptsy', '642332c7c45f48e38626f8360df410ee', 'wxsService2', '213yuyjgdqweyyj', '1', null, '{}', 'hello-world:latest', null, '2018-07-16 11:31:21', null);
INSERT INTO `user_service` VALUES ('qmsa4gwegmaxfvrrvpn3wrqq7', 'dbe538b155104a87a4c62b157b0b793e', 'pop', 'f4f4bb152cf54fec94eb0d2b22d25f71', '3', '[ls]', '{\"80\":15624}', 'nginx:latest', null, '2018-07-18 15:59:56', '2018-07-21 15:55:28');
INSERT INTO `user_service` VALUES ('tkh3mdw9tcdkhojh49wcec3i2', '33398ea14de14d979a495a3a53051b1a', 'testlccccc', 'afafaf24131', '1', null, '{}', 'hello-world:latest', null, '2018-07-16 15:13:30', null);
INSERT INTO `user_service` VALUES ('wf2lyw298vzzuqxdoc3uvt8fv', 'aabakfsvakiuw1213', 'goodservice', 'f4f4bb152cf54fec94eb0d2b22d25f71', '1', null, '{}', 'centos:latest', null, '2018-07-21 11:09:33', '2018-07-21 12:06:37');
INSERT INTO `user_service` VALUES ('xbtgxxe9ysnu4iky7w8q8b6km', '9d0d51e5058b426cacff0e8b8d2d4420', 'sv1', 'f4f4bb152cf54fec94eb0d2b22d25f71', '1', null, '{}', 'hello-world:latest', null, '2018-07-21 16:08:51', null);
