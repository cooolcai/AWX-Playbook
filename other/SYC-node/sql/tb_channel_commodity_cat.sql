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

 Date: 13/08/2021 14:14:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_channel_commodity_cat
-- ----------------------------
DROP TABLE IF EXISTS `tb_channel_commodity_cat`;
CREATE TABLE `tb_channel_commodity_cat`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目ID',
  `parent_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父分类ID=0时代表一级根分类',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1启用 0禁用',
  `sort_order` int(4) NULL DEFAULT NULL COMMENT '排列序号',
  `is_parent` tinyint(1) NULL DEFAULT 1 COMMENT '是否为父分类 1为true 0为false',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `channel_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'channelId',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`, `status`) USING BTREE,
  INDEX `sort_order`(`sort_order`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_channel_commodity_cat
-- ----------------------------
INSERT INTO `tb_channel_commodity_cat` VALUES ('ch98526848421463672', '0', '分类', 1, 0, NULL, NULL, NULL, '2020-01-02 10:40:16', '2020-05-19 10:03:35', 'ch1589519965456');
INSERT INTO `tb_channel_commodity_cat` VALUES ('ch98526848421464059', 'ch98526848421463672', '烟', 1, 0, NULL, NULL, NULL, '2020-01-02 10:43:53', '2020-05-19 10:03:35', 'ch1589519965456');
INSERT INTO `tb_channel_commodity_cat` VALUES ('ch98526848421464062', 'ch98526848421464059', '包烟', 1, 0, NULL, NULL, NULL, '2020-01-02 10:44:25', '2020-05-19 10:03:35', 'ch1589519965456');
INSERT INTO `tb_channel_commodity_cat` VALUES ('ch98526848421464063', 'ch98526848421464059', '条烟', 1, 0, NULL, NULL, NULL, '2020-01-02 10:44:30', '2020-05-19 10:03:35', 'ch1589519965456');

SET FOREIGN_KEY_CHECKS = 1;
