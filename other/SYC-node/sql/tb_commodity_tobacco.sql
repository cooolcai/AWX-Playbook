/*
 Navicat Premium Data Transfer

 Source Server         : SYC-7-10.200.120.26
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 10.200.120.26:3306
 Source Schema         : db_commodity_node22

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 13/08/2021 14:14:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_commodity_tobacco
-- ----------------------------
DROP TABLE IF EXISTS `tb_commodity_tobacco`;
CREATE TABLE `tb_commodity_tobacco`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `channel_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道商id',
  `com_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `pin_yin_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `com_code_strip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '条商品条码',
  `short_code_strip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `com_code_box` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盒商品条码',
  `short_code_box` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `strip_box_ratio` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条盒比',
  `com_cost` double NULL DEFAULT NULL COMMENT '批发价',
  `com_price` double NULL DEFAULT NULL COMMENT '销售价',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `locked_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `com_code_strip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_commodity_tobacco
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
