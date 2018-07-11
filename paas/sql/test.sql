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

 Date: 11/07/2018 15:59:57
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
INSERT INTO `project_log` VALUES ('03436165fcd04572b84422afbeb4d946', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:19:38');
INSERT INTO `project_log` VALUES ('05289faaa44d4531863a736cd8d7d99a', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-08 18:19:30');
INSERT INTO `project_log` VALUES ('06313557f77545ab9cad7e723b26f8fd', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-10 09:18:17');
INSERT INTO `project_log` VALUES ('06b14e50671b4ddd92fc8b89539718fe', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:00:25');
INSERT INTO `project_log` VALUES ('06e8f15354e44115a8ba021d15b2640c', '1', '6adb4862435c', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:28:30');
INSERT INTO `project_log` VALUES ('08cc4b40ad0c45f4a2276802a00e654e', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-10 09:51:21');
INSERT INTO `project_log` VALUES ('0e224476a2cf4ff8923b4a6f4ec5460a', 'b2b09405f54c4cf3a9e70b4ec298b31a', '611c9ca8cbdbbf96ab9fc277d312c1d80a339f864d21cddc11d8383873b662ef', 20, '创建容器', '2018-07-07 16:15:54');
INSERT INTO `project_log` VALUES ('0f2d0002940f40d1a9b5cde3aa84d4ba', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 14:52:16');
INSERT INTO `project_log` VALUES ('0fc7c8a1a0e8497c963517dcbcf0ede2', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:00:04');
INSERT INTO `project_log` VALUES ('1199efd16fa4404393f2660a2c94cea2', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:07:23');
INSERT INTO `project_log` VALUES ('141602787bb64af28c2631409ac5b008', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:23:08');
INSERT INTO `project_log` VALUES ('1c2b4481b8064e2091d7427ee5725820', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'f26f616db52531bd442661bdfa799eea60f925ecfa80726c591bec0d8a7e224d', 20, '创建容器', '2018-07-07 15:46:16');
INSERT INTO `project_log` VALUES ('1e30ef54a11e44a7b96fbb46e3450f0b', 'b2b09405f54c4cf3a9e70b4ec298b31a', '129663e302ed2c8cf8dd1ce123061213ac789553f3d5d0ef4a79524b495a51c2', 23, '开启容器失败，原因：Docker异常', '2018-07-07 11:11:33');
INSERT INTO `project_log` VALUES ('1e71f7100ee54e89977c72dff99fbf6e', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:16:58');
INSERT INTO `project_log` VALUES ('23109746e9434a4bb500dc723be59317', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:18:02');
INSERT INTO `project_log` VALUES ('26da3974ef234cdca383e3ec19bb1b37', 'b2b09405f54c4cf3a9e70b4ec298b31a', '611c9ca8cbdbbf96ab9fc277d312c1d80a339f864d21cddc11d8383873b662ef', 22, '开启容器', '2018-07-07 16:17:06');
INSERT INTO `project_log` VALUES ('2ae0140e4ae44d7b9627ef13cf6eb922', '6860df07dd1445228ff21d53eb18be65', '0970203f46cebe7fe7a13dc1a81529a1233db0b8700bed4b69dcf55c7cf8c9c1', 20, '创建容器', '2018-07-07 14:12:28');
INSERT INTO `project_log` VALUES ('2c11127ac6e44139851760e1f238dac7', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-10 09:15:58');
INSERT INTO `project_log` VALUES ('2ca018d20c874471a662908cd6c6233c', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:43:45');
INSERT INTO `project_log` VALUES ('2fa7189773204e648d8907a7ab96cc51', NULL, NULL, 23, '开启容器失败，原因：Docker异常', '2018-07-08 15:56:53');
INSERT INTO `project_log` VALUES ('357d75e0e60f4402bf3f8ac4e234d8aa', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-09 13:14:14');
INSERT INTO `project_log` VALUES ('36187ca397754ee4a96576ab29097b99', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 14:55:03');
INSERT INTO `project_log` VALUES ('3865b6359ee8436e9fc9e3e33bdfb457', '6860df07dd1445228ff21d53eb18be65', '7e1be36e17f079dedcfe60b7bdcffb63bb77ef8ec3ce160950e0c606b49fe1e5', 22, '开启容器', '2018-07-07 11:21:44');
INSERT INTO `project_log` VALUES ('399622c6b36e4dc09a4b0d4dcc088ef8', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-08 17:09:39');
INSERT INTO `project_log` VALUES ('40e264916c654f6b92bda439e89a91c7', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:22:23');
INSERT INTO `project_log` VALUES ('41f7fe2e7622436295de556938011539', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-08 16:34:52');
INSERT INTO `project_log` VALUES ('4add41e12ba249768e4a0b18b9183e85', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:37:40');
INSERT INTO `project_log` VALUES ('4b285b7ea9bb4595ae7389a09aad2009', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:40:26');
INSERT INTO `project_log` VALUES ('4c86f4ece699483ba49322af005bf744', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:24:19');
INSERT INTO `project_log` VALUES ('4e4047174a494d878b4288de5f657d28', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 14:00:32');
INSERT INTO `project_log` VALUES ('500612b5509c458db1cd2c66ead1ee8f', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 13:01:51');
INSERT INTO `project_log` VALUES ('5007a83695a0420786b635dd6566bfcc', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 13:15:04');
INSERT INTO `project_log` VALUES ('5478ad0266c24f25a11e56cef6a08d0c', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-08 17:14:17');
INSERT INTO `project_log` VALUES ('557d018172f842029259fde5c1887de0', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 25, '暂停容器失败，原因：Docker异常', '2018-07-07 11:14:21');
INSERT INTO `project_log` VALUES ('56273ada10e84bbc8ab3cd8a8348e188', '6860df07dd1445228ff21d53eb18be65', '77f54bf6efa20d68dcdf015cce513b55feacabf72960de46abc09f0ea919074b', 20, '创建容器', '2018-07-07 14:10:05');
INSERT INTO `project_log` VALUES ('56cba1e8a201435186e88c2e5a417b7a', '1', '6adb4862435c', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:31:50');
INSERT INTO `project_log` VALUES ('58a88ab801f54d9096f896cbf2aed11c', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 15:58:58');
INSERT INTO `project_log` VALUES ('59881c127f89402e934df32211e331ef', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:46:04');
INSERT INTO `project_log` VALUES ('59e295eb5f8149aaad8506367e6caa2b', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'f26f616db52531bd442661bdfa799eea60f925ecfa80726c591bec0d8a7e224d', 22, '开启容器', '2018-07-07 15:46:38');
INSERT INTO `project_log` VALUES ('5a9c8a32bd464673adf14b4aaffc2e6e', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:16:56');
INSERT INTO `project_log` VALUES ('5f58d40c87404e8c8996c8e26c8f5518', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-10 09:14:37');
INSERT INTO `project_log` VALUES ('6399d25abe9446d6b042714283fc35f3', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-08 17:12:28');
INSERT INTO `project_log` VALUES ('651a56d10cb042088d669ba143cfdd18', '6860df07dd1445228ff21d53eb18be65', '5c1fdaab992dd05ea77c642f53c50d57a7006abeb58d63d3c469fd3f069e2d67', 20, '创建容器', '2018-07-07 11:35:26');
INSERT INTO `project_log` VALUES ('67d1e3a1a6814f569b9eeaa4de51585a', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:38:45');
INSERT INTO `project_log` VALUES ('68c3ba1f32984c289b2b37094cdf6f69', '6860df07dd1445228ff21d53eb18be65', 'e03ef580deece022e5332f03d9ccb09ca0b51bf7c145cf65cd52dea42d34f490', 20, '创建容器', '2018-07-07 14:10:19');
INSERT INTO `project_log` VALUES ('69c059fc30f94198ba93059049081832', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:09:39');
INSERT INTO `project_log` VALUES ('6bb7170a3e4449c69bcda542d0d18010', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:10:18');
INSERT INTO `project_log` VALUES ('6bbaed8634a34a6a9ea1a01d57b8cb19', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:24:48');
INSERT INTO `project_log` VALUES ('6fa5bc2f4b7546c388ff5d859c8b21a1', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:22:57');
INSERT INTO `project_log` VALUES ('707bec8e75544238be47a96ae7096d03', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 17:12:42');
INSERT INTO `project_log` VALUES ('729a67d33b7246f5bc9cf7c2b699c29d', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 17:22:17');
INSERT INTO `project_log` VALUES ('77b94401af264a68b73fe5bbe1dfd43d', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 22, '开启容器', '2018-07-07 11:14:27');
INSERT INTO `project_log` VALUES ('78de2f7cebbe49588ce5978a500c584d', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:20:25');
INSERT INTO `project_log` VALUES ('7ac4406ab7d7417daecd246be7f28207', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 17:09:58');
INSERT INTO `project_log` VALUES ('7c2c0f04b9844b15bc2c7a5b0445ae20', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'f26f616db52531bd442661bdfa799eea60f925ecfa80726c591bec0d8a7e224d', 23, '开启容器失败，原因：Docker异常', '2018-07-07 15:50:26');
INSERT INTO `project_log` VALUES ('7ec5a521de134cb491db138752c0a732', 'b2b09405f54c4cf3a9e70b4ec298b31a', '8b6102bc2a5608d33037ee1474bddfce431ca0594eef2f01f059baa5ff3a3f82', 20, '创建容器', '2018-07-07 15:48:32');
INSERT INTO `project_log` VALUES ('813d155027b941b99c6c42e293e516e3', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 17:00:00');
INSERT INTO `project_log` VALUES ('81b39fccaed84caf8bfca9bbdfd6ccc0', '1', '6adb4862435c', 22, '开启容器', '2018-07-08 16:28:29');
INSERT INTO `project_log` VALUES ('84bd71fcb4944034b3fa331b9a1c3f22', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:24:23');
INSERT INTO `project_log` VALUES ('86524aaec4a546b1b33842d2fd9c3a76', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 14:48:48');
INSERT INTO `project_log` VALUES ('8b442b27974f480eadf68a636ec78753', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 17:00:44');
INSERT INTO `project_log` VALUES ('8dfc1d57adb64b77ad928f1f75654ea3', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-09 13:00:35');
INSERT INTO `project_log` VALUES ('9051de8411b844528c0c5da903f0fd21', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:21:28');
INSERT INTO `project_log` VALUES ('9a3d201132d54334b326829a3044e4b3', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'eb706c93cff1cec7af9f8f0f9abbb27626e68ef7f8f42d699b3572da8e0b470c', 20, '创建容器', '2018-07-07 15:40:58');
INSERT INTO `project_log` VALUES ('9cb3ade1e5e6421b853ada4b5c277c11', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:37:45');
INSERT INTO `project_log` VALUES ('9d2594151e1f42788533143a2ece61ef', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 14:53:26');
INSERT INTO `project_log` VALUES ('9d3102c294ba47c8b2a5f4795e61e04a', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 16:57:27');
INSERT INTO `project_log` VALUES ('a139e81ad28746a083298a4f27c6eb08', NULL, NULL, 23, '开启容器失败，原因：Docker异常', '2018-07-08 15:50:24');
INSERT INTO `project_log` VALUES ('a3c401bd787e405cb3b2df5c2b2492b2', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 13:57:29');
INSERT INTO `project_log` VALUES ('a6335e43d29144349d06e1500e890507', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 22, '开启容器', '2018-07-07 11:12:32');
INSERT INTO `project_log` VALUES ('a86732e20ae34545a8c3348cd96e6d97', '6860df07dd1445228ff21d53eb18be65', 'afac8481584e19ec8bbdc430ba650198e8cbe7404062c09daa50d4d7950644fd', 20, '创建容器', '2018-07-07 14:09:27');
INSERT INTO `project_log` VALUES ('ab3e2bd921fd4dedb1cd92a11e877f58', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:33:19');
INSERT INTO `project_log` VALUES ('ab414f8f37694f20a55243ec0e82d453', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-09 13:06:31');
INSERT INTO `project_log` VALUES ('ab5b09aa61494209afc1b2fe255b0c66', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:33:36');
INSERT INTO `project_log` VALUES ('adaf764527954503bd679f2693b45d1c', '1', '6adb4862435c', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:29:42');
INSERT INTO `project_log` VALUES ('ae969f4a9c2e41a1a7fa2918472f057d', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 20, '创建容器', '2018-07-07 11:09:07');
INSERT INTO `project_log` VALUES ('b3865ce97f394f94b9ec88519d51f11a', 'b2b09405f54c4cf3a9e70b4ec298b31a', '5b226ca5d718ae3f32bf3942c85b390b88e14e7d4e8271f72ffb92ffbccec8f9', 20, '创建容器', '2018-07-07 16:10:44');
INSERT INTO `project_log` VALUES ('b423f9290bbb44ef8c6f10a9a19f03fb', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-10 09:15:19');
INSERT INTO `project_log` VALUES ('bc158ba6fdde40cba77ccb48bac2b554', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:26:41');
INSERT INTO `project_log` VALUES ('bcb51a73c6ab4126a09e86ef5ff09766', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 13:17:00');
INSERT INTO `project_log` VALUES ('bd72197b900a421aa4d6349a9385c877', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-08 18:20:05');
INSERT INTO `project_log` VALUES ('bd8e96faeda54d28a4cfdbf0a1d07c36', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:13:04');
INSERT INTO `project_log` VALUES ('bfed1da02dde4c428104a6136707e9dd', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 17:22:09');
INSERT INTO `project_log` VALUES ('c01a92735b214bc38879d2fd12958909', '6860df07dd1445228ff21d53eb18be65', '7e1be36e17f079dedcfe60b7bdcffb63bb77ef8ec3ce160950e0c606b49fe1e5', 20, '创建容器', '2018-07-07 11:20:58');
INSERT INTO `project_log` VALUES ('c4e566f69fd04e23a316325de0d05a53', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'eb706c93cff1cec7af9f8f0f9abbb27626e68ef7f8f42d699b3572da8e0b470c', 22, '开启容器', '2018-07-07 15:43:32');
INSERT INTO `project_log` VALUES ('c7f154589ba94c6da96d1918713477f7', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-08 16:51:39');
INSERT INTO `project_log` VALUES ('c84c3a2dae1f4ce4a70d8902da1752ca', '6860df07dd1445228ff21d53eb18be65', '47de2b147bb861a8f9bf564992f694b93ff4da82abb5dd5017b7429d8faaf73f', 20, '创建容器', '2018-07-07 11:34:29');
INSERT INTO `project_log` VALUES ('caca3c0d6ced4d08ac7edbe1d5b0d7b6', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:21:26');
INSERT INTO `project_log` VALUES ('ce6ecab880b94a0faefa290251ec1d9f', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-10 09:48:18');
INSERT INTO `project_log` VALUES ('cfe38dadecf4450fa6bf25911a6fa956', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:12:58');
INSERT INTO `project_log` VALUES ('d2a8fedeafde4cac8661571ab0c7f2c4', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-08 16:40:54');
INSERT INTO `project_log` VALUES ('d62a8bbfd42b4a63af4fa6c971d8efa5', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-08 17:11:48');
INSERT INTO `project_log` VALUES ('d66065abf8114186abe8183e2e038340', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:25:02');
INSERT INTO `project_log` VALUES ('d726bfa1ea2a47cabe7435ac4cab2af7', NULL, NULL, 23, '开启容器失败，原因：Docker异常', '2018-07-08 15:50:45');
INSERT INTO `project_log` VALUES ('d7d2b6f161534dc18d159e67127f658c', NULL, NULL, 23, '开启容器失败，原因：Docker异常', '2018-07-08 15:53:33');
INSERT INTO `project_log` VALUES ('db6346590b6f41fc81ac8ee64c8407b5', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 17:22:35');
INSERT INTO `project_log` VALUES ('dc717376cd5a443a85e30fb84109eae3', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:47:59');
INSERT INTO `project_log` VALUES ('dc736d63665d4f8c858f1cf4e1d5f90c', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 14:58:38');
INSERT INTO `project_log` VALUES ('e10dd619c46249b0971d41b1390363a6', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 15:58:56');
INSERT INTO `project_log` VALUES ('e35a6868c80e4ca7888deb5cf13ef3a2', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:12:55');
INSERT INTO `project_log` VALUES ('e5d15bb628774cd5972bcf6041991881', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 22, '开启容器', '2018-07-07 11:16:25');
INSERT INTO `project_log` VALUES ('e92317a2b13d4199895aa5920b81d1b3', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 16:57:09');
INSERT INTO `project_log` VALUES ('e9af1a0c83bc443c85628cf47f9fdecc', '6860df07dd1445228ff21d53eb18be65', '502090d4bd983c5c8a17c2112574217ac09d38dee6d7b50755fc2b180f199748', 20, '创建容器', '2018-07-07 11:25:16');
INSERT INTO `project_log` VALUES ('ea3d532436c9454ba14caee774fe1b56', NULL, NULL, 23, '开启容器失败，原因：Docker异常', '2018-07-08 15:55:49');
INSERT INTO `project_log` VALUES ('eacc6ad05c7d43c28ea01c8ac5848fe8', '6860df07dd1445228ff21d53eb18be65', '1cecf69adad9b8300435883f6bc99e9ac3f637cb4095c63da5d7b0eddf03031d', 20, '创建容器', '2018-07-07 11:27:16');
INSERT INTO `project_log` VALUES ('ee190539804f46c1be81a213adc8ff27', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 15:58:54');
INSERT INTO `project_log` VALUES ('eeb5971b535d4c5b9ede9b2dc6495606', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-08 17:06:15');
INSERT INTO `project_log` VALUES ('f080aecdf57244b48c3328b71284d4ef', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:02:16');
INSERT INTO `project_log` VALUES ('f207a1afd6eb4d92b9c1f8d68040be51', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 15:17:46');
INSERT INTO `project_log` VALUES ('f31e90bd07484c1fb78d08cbfcfe5b6d', '6860df07dd1445228ff21d53eb18be65', '31a0516ca7e720ee6861e755861377b7b47114ad2e6ea0e63df232353b0d64c2', 22, '开启容器', '2018-07-07 15:06:22');
INSERT INTO `project_log` VALUES ('f6afcefd523b4597b8d16eb7778d54f5', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:19:48');
INSERT INTO `project_log` VALUES ('f7d944c911f74d8aa3a98353c9086cb7', '6860df07dd1445228ff21d53eb18be65', '31a0516ca7e720ee6861e755861377b7b47114ad2e6ea0e63df232353b0d64c2', 20, '创建容器', '2018-07-07 15:05:59');
INSERT INTO `project_log` VALUES ('f8b6fb9698a94f1bba176c80939e93d6', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 22, '开启容器', '2018-07-09 14:11:54');
INSERT INTO `project_log` VALUES ('f8cd27ae01a4431390639fa2e9c93679', '1', '6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', 23, '开启容器失败，原因：Docker异常', '2018-07-09 17:22:34');
INSERT INTO `project_log` VALUES ('fbafa3af102b49e193c0ab311407498f', '6860df07dd1445228ff21d53eb18be65', '753e34bcae19bdf7e3a3da282598e9e69922fa60223cf7352af82018c58a9ab0', 22, '开启容器', '2018-07-07 11:15:09');
INSERT INTO `project_log` VALUES ('fe986a2393c14eb8846d881e0a618fa3', '1', '1feb68cadc13307b9c6fe03951142ede75a2c3fbfd3cb31fef952e72d9532e3e', 23, '开启容器失败，原因：Docker异常', '2018-07-08 16:19:06');

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
INSERT INTO `sys_image` VALUES ('113ebc41549a421ab9ecfa907f64e0ab', '649dcb69b782d4e281c92ed2918a21fa63322a6605017e295ea75907c84f4d1e', 'test:233', 'test', '233', '108974617', 1, NULL, NULL, '108974617', '{\"maintainer\":\"NGINX Docker Maintainers <docker-maint@nginx.com>\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"nginx\\\" \\\"-g\\\" \\\"daemon off;\\\"]\"]', 'library', '', '2018-07-10 04:09:11', NULL);
INSERT INTO `sys_image` VALUES ('431a73aaef4c4ed389a5d9b6523dde2e', '49f7960eb7e4cb46f1a02c1f8174c6fac07ebf1eb6d8deffbcb5c695f1c9edd5', 'centos:7', 'centos', '7', '199671138', 1, NULL, NULL, '199671138', '{\"org.label-schema.schema-version\":\"= 1.0     org.label-schema.name=CentOS Base Image     org.label-schema.vendor=CentOS     org.label-schema.license=GPLv2     org.label-schema.build-date=20180531\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/bin/bash\\\"]\"]', 'library', '', '2018-07-07 15:31:52', NULL);
INSERT INTO `sys_image` VALUES ('4df3e2dfb24340c2ba43536d5bd8aa3e', '5262886a4d4c7cb537b0c40778177a29ef016bd031c899ddb08eb2f935cad5f2', 'dockersamples/visualizer:latest', 'visualizer', 'latest', '153939581', 1, NULL, NULL, '153939581', '{}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"npm\\\" \\\"start\\\"]\"]', 'dockersamples', '', '2018-07-10 04:09:11', NULL);
INSERT INTO `sys_image` VALUES ('8758290ce6e34aed9f5735c0c453fc32', '5699ececb21caf07b92cbda9daa1e965407e3793a72000ecbf6b8e8595a0824a', 'nginx:latest', 'nginx', 'latest', '108951970', 1, NULL, NULL, '108951970', '{\"maintainer\":\"NGINX Docker Maintainers <docker-maint@nginx.com>\"}', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"nginx\\\" \\\"-g\\\" \\\"daemon off;\\\"]\"]', 'library', '', '2018-07-06 10:17:13', NULL);
INSERT INTO `sys_image` VALUES ('8ce5cdb347a4412c96756cf322739af9', '40c6c282d58faef1dbd407793e9b5a92d6d6472aa1e38c716960f7ad2b40f477', 'docker:latest', 'docker', 'latest', '133205044', 1, NULL, NULL, '133205044', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"sh\\\"]\"]', 'library', '', '2018-07-10 04:09:11', NULL);
INSERT INTO `sys_image` VALUES ('c2b497e69fe44c7c93720d35c5a75ac8', '2d084b11164d1d05bfe0a28afc966153e43efa6760dd2b4707b5764395def4f7', 'tomcat:8', 'tomcat', '8', '462618984', 1, NULL, NULL, '462618984', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"catalina.sh\\\" \\\"run\\\"]\"]', 'library', '', '2018-07-10 04:09:11', NULL);
INSERT INTO `sys_image` VALUES ('dce8c670f6cf491c954de8d70ae19d81', 'd23bdf5b1b1b1afce5f1d0fd33e7ed8afbc084b594b9ccf742a5b27080d8a4a8', 'java:latest', 'java', 'latest', '643119603', 1, NULL, NULL, '643119603', '{}', '[\"/bin/sh\",\"-c\",\"/var/lib/dpkg/info/ca-certificates-java.postinst configure\"]', 'library', '', '2018-07-10 04:09:11', NULL);
INSERT INTO `sys_image` VALUES ('ff57b057b3824703aa44b7d375ba46b5', 'b10ba8bfc3d52a508970c7abeed790db144420d619cddc93b97cb6ee8974ebe9', 'hello:latest', 'hello', 'latest', '276913668', 1, NULL, NULL, '276913668', 'null', '[\"/bin/sh\",\"-c\",\"#(nop) \",\"CMD [\\\"/bin/sh\\\" \\\"-c\\\" \\\"/bin/bash\\\"]\"]', 'library', 'sha256:06f07c907e14c7fcf666a8310c7b52fd59b42b4dd61551074330d77c79696db1', '2018-07-10 04:09:11', NULL);

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
INSERT INTO `sys_log` VALUES ('3812784bd85d4af1ac28bbe3df538977', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.1', 'imageId=11aa8e60c5a8475fb44a332e60ff95fa&containerName=ccc&projectId=b2b09405f54c4cf3a9e70b4ec298b31a', '', '2018-07-07 16:15:54');
INSERT INTO `sys_log` VALUES ('3c868bba55eb498590e3c154490de816', 'f4f4bb152cf54fec94eb0d2b22d25f71', 20, '创建容器', '/container/create', 'POST', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'imageId=8758290ce6e34aed9f5735c0c453fc32&containerName=qqqqqq&projectId=6860df07dd1445228ff21d53eb18be65', '', '2018-07-07 11:34:29');
INSERT INTO `sys_log` VALUES ('43f1839f5acd439fb2b03911c0749808', NULL, 1, NULL, '/login', 'POST', '127.0.0.1', 'PostmanRuntime/7.1.5', 'username=sys&password=', '', '2018-07-08 09:27:13');
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
INSERT INTO `sys_login` VALUES ('34567678', 'tem', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', NULL, 0, 2, '2018-07-11 15:35:00', NULL);
INSERT INTO `sys_login` VALUES ('4151361367131', '18083764688', '123456', '827622690@qq.com', 1, 1, '2018-06-30 09:43:29', '2018-06-30 16:42:40');
INSERT INTO `sys_login` VALUES ('f4f4bb152cf54fec94eb0d2b22d25f71', 'sya', '$2a$10$ip/m/nYFDXM70j2Ky4wWZu9FdmT6RPy1cg7IO/h4rkOSqV7JFYmUa', '973383318@qq.com', 0, 1, '2018-06-30 11:09:18', '2018-06-30 11:09:39');

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
INSERT INTO `user_container` VALUES ('611c9ca8cbdbbf96ab9fc277d312c1d80a339f864d21cddc11d8383873b662ef', 'b2b09405f54c4cf3a9e70b4ec298b31a', 'ccc', NULL, '{\"443/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"59311\"}],\"80/tcp\":[{\"HostIp\":\"0.0.0.0\",\"HostPort\":\"13464\"}]}', 'nginx:1.10', 1, '2018-07-07 16:15:54', '2018-07-07 16:17:06', NULL);
INSERT INTO `user_container` VALUES ('6adb4862435c2efdf841799c00bc08e52aa159a436df964a61dd225229188fa2', '1', 'def', NULL, NULL, NULL, 1, '2018-07-08 15:48:28', '2018-07-08 17:14:17', NULL);
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
