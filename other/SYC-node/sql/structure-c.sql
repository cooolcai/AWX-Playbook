SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `db_commodity_node22`.`tb_assemble_split_rule`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `big_com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '大件商品编码',
  `number` decimal(11, 0) NOT NULL COMMENT '数量',
  `small_com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '小件商品编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_account_id_big_com_code`(`account_id`, `big_com_code`) USING BTREE,
  INDEX `idx_rule_com_code_b`(`big_com_code`) USING BTREE,
  INDEX `idx_rule_com_code_s`(`small_com_code`) USING BTREE,
  INDEX `idx_account_id`(`account_id`) USING BTREE,
  INDEX `idx_rule_com_code_sa`(`account_id`, `small_com_code`) USING BTREE,
  INDEX `idx_rule_com_code_big`(`account_id`, `big_com_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_break_reason`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `reason_describe` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报损原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_channel_assemble_split_rule`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `channel_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `big_com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '大件商品编码',
  `number` decimal(11, 0) NOT NULL COMMENT '数量',
  `small_com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '小件商品编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_unique`(`channel_id`, `big_com_code`) USING BTREE,
  INDEX `index`(`big_com_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `db_commodity_node22`.`tb_channel_assemble_split_rule_batch_detail`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `batch_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次ID',
  `channel_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `big_com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '大件商品编码',
  `number` decimal(11, 0) NOT NULL COMMENT '数量',
  `small_com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '小件商品编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index`(`big_com_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_channel_assemble_split_rule_batch_record`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `total_count` int(11) NULL DEFAULT NULL COMMENT '变动数量',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态，0待确认，1正在更新，2执行完毕',
  `success` int(11) NULL DEFAULT NULL COMMENT '成功数量',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_modified_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标准商品信息更新记录表' ROW_FORMAT = DYNAMIC;

CREATE TABLE `db_commodity_node22`.`tb_channel_com_info_change_detail`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `batch_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次id',
  `channel_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道商id',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条码',
  `short_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短编码',
  `com_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `pin_yin_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `com_cost` decimal(18, 6) NULL DEFAULT NULL COMMENT '商品成本',
  `com_price` decimal(18, 6) NULL DEFAULT NULL COMMENT '商品价格',
  `is_rule` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有组装拆分规则,0或者null表示没有，1表示有',
  `com_unit` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主单位',
  `cid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属分类',
  `channel_locked` int(11) NULL DEFAULT NULL COMMENT '被渠道商锁定的字段',
  `brand_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌系列编码',
  `brand` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `package_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装类型',
  `packing` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装类型描述（条/包）',
  `cigarette_class` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卷烟价类',
  `made_in` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省内省外标识',
  `thb` decimal(18, 2) NULL DEFAULT NULL COMMENT '条盒比',
  `status` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '0为待处理，1为成功，-1为失败',
  `result` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建结果文本',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_modified_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标准商品信息变更详情表' ROW_FORMAT = DYNAMIC;

CREATE TABLE `db_commodity_node22`.`tb_channel_com_info_change_record`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `change_count` int(11) NULL DEFAULT NULL COMMENT '变动数量',
  `change_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变动类型，0新增，1删除，2修改',
  `status` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态，0待确认，1正在更新，2成功，3失败',
  `success` int(11) NULL DEFAULT NULL COMMENT '成功数量',
  `fail` int(11) NULL DEFAULT NULL COMMENT '失败数量',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_modified_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `data_upt_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据变更日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标准商品信息更新记录表' ROW_FORMAT = DYNAMIC;

CREATE TABLE `db_commodity_node22`.`tb_channel_commodity`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `channel_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '渠道商id',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '条码',
  `short_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短编码',
  `com_name` varchar(350) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品名称',
  `pin_yin_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '拼音码',
  `com_cost` double NULL DEFAULT NULL COMMENT '商品成本',
  `com_price` double NULL DEFAULT NULL COMMENT '商品价格',
  `com_quality` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '保质期',
  `com_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品描述',
  `com_pic_addr` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片地址',
  `last_edit_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后修改者',
  `is_rule` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否有组装拆分规则,0或者null表示没有，1表示有',
  `com_size` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品规格',
  `com_unit` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '主单位',
  `com_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品产地区域',
  `update_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `cid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属分类',
  `channel_locked` int(11) NULL DEFAULT NULL COMMENT '被渠道商锁定的字段',
  `frequency` int(11) NULL DEFAULT NULL COMMENT '使用频率',
  `brand_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌编码',
  `brand` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `package_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装类型',
  `packing` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装（条/包）',
  `manufacturer` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制造商',
  `tag` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `cigarette_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卷烟价类',
  `made_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省内省外标识',
  `thb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条盒比',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `version_no` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `channelComCode`(`channel_id`, `com_code`) USING BTREE,
  INDEX `comCodeIndex`(`com_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `db_commodity_node22`.`tb_channel_commodity_cat`  (
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

CREATE TABLE `db_commodity_node22`.`tb_commodity`  (
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '条码',
  `short_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短编码',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商户id',
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `com_name` varchar(350) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品名称',
  `pin_yin_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `com_cost` double NOT NULL COMMENT '商品成本',
  `com_price` double NOT NULL COMMENT '商品价格',
  `com_mem_price` double NULL DEFAULT NULL COMMENT '会员价',
  `com_type` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '不用了',
  `com_number` double NOT NULL COMMENT '库存',
  `com_upper_limit` decimal(11, 0) NULL DEFAULT NULL COMMENT '库存上限',
  `com_lower_limit` decimal(11, 0) NULL DEFAULT NULL COMMENT '库存下限',
  `com_auto_upper_limit` decimal(11, 0) NULL DEFAULT NULL COMMENT '库存自动预警上限',
  `com_auto_lower_limit` decimal(11, 0) NULL DEFAULT NULL COMMENT '库存自动预警下限',
  `stock_auto_warning_status` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自动预警开启状态，1开启，0关闭',
  `com_quality` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '保质期',
  `com_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品描述',
  `com_pic_addr` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图片地址',
  `last_edit_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后修改者',
  `is_rule` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否有组装拆分规则,0或者null表示没有，1表示有',
  `com_size` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品规格',
  `com_unit` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '主单位',
  `com_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商品产地区域',
  `last_edit_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `shop_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '不用了',
  `cid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属分类',
  `channel_locked` int(16) NULL DEFAULT NULL COMMENT '被渠道商锁定的字段',
  `chain_locked` int(16) NULL DEFAULT NULL COMMENT '被连锁店锁定的字段',
  `frequency` int(11) NULL DEFAULT NULL COMMENT '使用频率',
  `brand` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `packing` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装（条/包）',
  `manufacturer` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制造商',
  `tag` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `version_no` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account_id_com_code`(`com_code`, `account_id`) USING BTREE,
  INDEX `idx_account_id`(`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `db_commodity_node22`.`tb_commodity_break`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `create_time` datetime NOT NULL COMMENT '报损时间',
  `com_cost_total` decimal(11, 2) NOT NULL COMMENT '报损金额',
  `create_user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '报损人',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_commodity_cat`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类目ID',
  `parent_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父分类ID=0时代表一级根分类',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态 1启用 0禁用',
  `sort_order` int(4) NULL DEFAULT NULL COMMENT '排列序号',
  `is_parent` tinyint(1) NULL DEFAULT 1 COMMENT '是否为父分类 1为true 0为false',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `frequency` int(11) NULL DEFAULT NULL COMMENT '使用频率',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `account_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'accountId',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`, `status`) USING BTREE,
  INDEX `sort_order`(`sort_order`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品类目' ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_commodity_cat_frequency`  (
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户id',
  `cid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类id',
  `frequency` int(11) NULL DEFAULT NULL COMMENT '频率',
  UNIQUE INDEX `cid_unique`(`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE DEFINER = `root`@`%` TRIGGER `cat_before_insert` BEFORE INSERT ON `tb_commodity_cat_frequency` FOR EACH ROW begin
update tb_commodity_cat set frequency=new.frequency where account_id=new.account_id and id=new.cid;
end;

CREATE DEFINER = `root`@`%` TRIGGER `cat_before_update` BEFORE UPDATE ON `tb_commodity_cat_frequency` FOR EACH ROW begin
update tb_commodity_cat set frequency=new.frequency where account_id=new.account_id and id=new.cid;
end;

CREATE TABLE `db_commodity_node22`.`tb_commodity_change_record`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `batch_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tb_channel_com_info_change_record里面的id',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态，0待确认，1正在更新，2执行完毕',
  `change_count` int(11) NULL DEFAULT NULL COMMENT '变动数量',
  `update` int(11) NULL DEFAULT NULL COMMENT '成功数量',
  `insert` int(11) NULL DEFAULT NULL COMMENT '失败数量',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标准商品信息更新记录表' ROW_FORMAT = DYNAMIC;

CREATE TABLE `db_commodity_node22`.`tb_commodity_check`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `create_time` datetime NOT NULL COMMENT '盘点时间',
  `com_cat_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '盘点商品类别',
  `create_user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '盘点人',
  `mode` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '盘点方式',
  `miss_num` decimal(11, 0) NOT NULL COMMENT '漏盘商品',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_commodity_check_excel`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `short_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品短编码',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `com_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `com_cost` decimal(11, 2) NOT NULL COMMENT '商品进货价',
  `old_stock_num` decimal(11, 0) NOT NULL COMMENT '盘前库存',
  `new_stock_num` decimal(11, 0) NOT NULL COMMENT '盘后库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_commodity_excel`  (
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `short_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `com_name` varchar(350) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `pin_yin_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `com_cost` double NULL DEFAULT NULL,
  `com_price` double NULL DEFAULT NULL,
  `com_mem_price` double NULL DEFAULT NULL,
  `com_number` double NULL DEFAULT NULL,
  `com_quality` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `com_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `com_size` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `com_unit` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `com_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `version_no` int(11) NULL DEFAULT 0,
  `wholesale_price` double NULL DEFAULT NULL,
  `membership_discount` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `integral_goods` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `com_upper_limit` double NULL DEFAULT NULL,
  `com_lower_limit` double NULL DEFAULT NULL,
  `max_stock` double NULL DEFAULT NULL,
  `min_stock` double NULL DEFAULT NULL,
  `brand` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manufacture_data` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_commodity_frequency`  (
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户id',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '条码',
  `frequency` int(11) NULL DEFAULT NULL COMMENT '频率',
  UNIQUE INDEX `com_code_unique`(`com_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE DEFINER = `root`@`%` TRIGGER `com_before_insert` BEFORE INSERT ON `tb_commodity_frequency` FOR EACH ROW begin
update tb_commodity set frequency=new.frequency where account_id=new.account_id and com_code=new.com_code;
end;

CREATE DEFINER = `root`@`%` TRIGGER `com_before_update` BEFORE UPDATE ON `tb_commodity_frequency` FOR EACH ROW begin
update tb_commodity set frequency=new.frequency where account_id=new.account_id and com_code=new.com_code;
end;

CREATE TABLE `db_commodity_node22`.`tb_commodity_mengmeng`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `com_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '条码',
  `com_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称（必填）',
  `short_code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '货号',
  `com_cost` double NULL DEFAULT NULL COMMENT '进价',
  `com_price` double NULL DEFAULT NULL COMMENT '售价',
  `com_number` double NULL DEFAULT NULL COMMENT '库存',
  `com_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `pin_yin_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `classify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auxiliary_unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `purchase_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available_sales` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estimated_gross_profit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_commodity_tobacco`  (
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

CREATE TABLE `db_commodity_node22`.`tb_commodity_yunpos`  (
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '条码',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商户id',
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `com_name` varchar(350) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品名称',
  `pin_yin_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼音码',
  `com_cost` double NOT NULL COMMENT '商品成本',
  `com_price` double NOT NULL COMMENT '商品价格',
  `com_number` double NULL DEFAULT NULL COMMENT '库存',
  `com_unit` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '主单位',
  `frequency` int(11) NULL DEFAULT NULL COMMENT '使用频率',
  `belong_big` tinyint(2) NULL DEFAULT NULL COMMENT '是否为大包装商品:0否;1是的',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `version_no` int(11) NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account_id_com_code`(`com_code`, `account_id`) USING BTREE,
  INDEX `idx_account_id`(`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `db_commodity_node22`.`tb_common_used`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用分类id',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用商品条码',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '类型:1分类;2商品',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户id',
  `order` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `accountid_comcode_unique`(`account_id`, `com_code`) USING BTREE,
  UNIQUE INDEX `accountid_cid_unique`(`account_id`, `cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '常用分类、商品' ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_config`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置key',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置value',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户id',
  `is_global` tinyint(1) NULL DEFAULT NULL COMMENT '是否是全局配置',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `accounid_key_unique`(`account_id`, `key`) USING BTREE,
  UNIQUE INDEX `global_key_unique`(`is_global`, `key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户配置' ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_logistics_purchase`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `create_time` datetime NOT NULL COMMENT '进货时间',
  `com_cost_total` decimal(11, 2) NOT NULL COMMENT '进货金额',
  `total_number` double(11, 2) NULL DEFAULT NULL COMMENT '总进货数量',
  `com_price_total` decimal(11, 2) NULL DEFAULT NULL COMMENT '总进货售价',
  `create_user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '进货人',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_logistics_return`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `create_time` datetime NOT NULL COMMENT '退货时间',
  `com_cost_total` decimal(11, 2) NOT NULL COMMENT '退货金额',
  `create_user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '退货人',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_member_commodity`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品条码',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户id',
  `com_name` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `com_unit` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品单位',
  `com_cat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类',
  `discount_percentage1` double NULL DEFAULT NULL COMMENT '折扣百分比1，对应普通会员',
  `discount_percentage2` double NULL DEFAULT NULL COMMENT '折扣百分比2，对应白银会员',
  `discount_percentage3` double NULL DEFAULT NULL COMMENT '折扣百分比3，对应黄金会员',
  `discount_percentage4` double NULL DEFAULT NULL COMMENT '折扣百分比4，对应铂金会员',
  `discount_percentage5` double NULL DEFAULT NULL COMMENT '折扣百分比5，对应钻石会员',
  `discount_price1` double NULL DEFAULT NULL COMMENT '折扣现金1，即原价要减去的价格，对应普通会员',
  `discount_price2` double NULL DEFAULT NULL COMMENT '折扣现金2，对应白银会员',
  `discount_price3` double NULL DEFAULT NULL COMMENT '折扣现金3，对应黄金会员',
  `discount_price4` double NULL DEFAULT NULL COMMENT '折扣现金4，对应铂金会员',
  `discount_price5` double NULL DEFAULT NULL COMMENT '折扣现金5，对应钻石会员',
  `version_no` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `creator` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `last_modified_by` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后修改人',
  `last_modified_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `comment` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_merchant_cache`  (
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE `db_commodity_node22`.`tb_smokes`  (
  `piece_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `piece_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stripe_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stripe_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pack_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pack_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stripe_association_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `packaging_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `association_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stripe_EAN13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pack_EAN13` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `db_commodity_node22`.`tb_stock_change`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `change_type_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '变动类型code,00,盘点,01,报损,02,进货,03,退货,04,销售,05,退款,06,组装增加,07,组装减少,08,拆分增加,09,拆分减少',
  `change_num` decimal(11, 0) NULL DEFAULT NULL COMMENT '库存变动数量,盘点不用',
  `correct_num` decimal(11, 0) NULL DEFAULT NULL COMMENT '库存校正数量,盘点专用',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  `create_user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '操作人',
  `third_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '第三方主表id',
  `third_sub_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '第三方子表id',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_stock_change_detail`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `change_main_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变动主表id',
  `source_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变动源id',
  `version_no` int(32) NULL DEFAULT 0 COMMENT '版本号',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `change_num` decimal(11, 2) NULL DEFAULT NULL COMMENT '库存变动数量',
  `create_time` datetime NOT NULL COMMENT '变动时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `other_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他信息',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号id',
  `change_type` int(12) NULL DEFAULT NULL COMMENT '变动类型',
  `source_number` decimal(11, 2) NULL DEFAULT NULL COMMENT '原始数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存变动子表' ROW_FORMAT = DYNAMIC;

CREATE TABLE `db_commodity_node22`.`tb_stock_change_main`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `source_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息源',
  `type` int(12) NULL DEFAULT NULL COMMENT '消息类型',
  `buz_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '业务数据',
  `oper_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `version_no` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `other_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属账号',
  `parent_source` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父源id',
  `buz_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存变动主表' ROW_FORMAT = DYNAMIC;

CREATE TABLE `db_commodity_node22`.`tb_stock_change_oper`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `change_type_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '操作类型code,0,交易,1,盘点,2,报损,3,烟草物流,4,组装,5,拆分,6,编辑商品,7,初始化商品,8,其他,9,商品增删改，10，进货',
  `change_type_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '变动类型名称',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_stock_change_type`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `change_type_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '变动类型code,00,盘点,01,报损,02,进货,03,退货,04,销售,05,退款,06,组装增加,07,组装减少,08,拆分增加,09,拆分减少',
  `change_type_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '变动类型名称',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_sub_commodity_assemble`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `rule_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组装拆分规则id',
  `big_com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '大件商品编码',
  `big_com_number` decimal(11, 0) NOT NULL COMMENT '大件商品增加数量',
  `small_com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '小件商品编码',
  `small_com_number` decimal(11, 0) NOT NULL COMMENT '小件商品消耗数量',
  `create_time` datetime NOT NULL COMMENT '组装时间',
  `create_user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组装人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_sub_commodity_break`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `par_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '主表id',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `come_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `break_num` decimal(11, 2) NOT NULL COMMENT '报损数量',
  `com_cost` decimal(11, 2) NOT NULL COMMENT '报损时商品单价',
  `com_cost_total` decimal(11, 2) NOT NULL COMMENT '报损金额',
  `break_reason_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '报损原因id',
  `break_reason_describe` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '报损原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_sub_commodity_check`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `par_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '主表id',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `com_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `com_cost` decimal(11, 2) NOT NULL COMMENT '盘点时商品单价',
  `old_stock_num` decimal(11, 2) NOT NULL COMMENT '盘前库存',
  `new_stock_num` decimal(11, 2) NOT NULL COMMENT '盘后库存',
  `different_stock_num` decimal(11, 2) NOT NULL COMMENT '差异库存',
  `old_cost_total` decimal(11, 2) NULL DEFAULT NULL COMMENT '盘前价值',
  `new_cost_total` decimal(11, 2) NULL DEFAULT NULL COMMENT '盘后价值',
  `different_cost_total` decimal(11, 2) NOT NULL COMMENT '盈亏金额',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `last_edit_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_sub_commodity_split`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `rule_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '组装拆分规则id',
  `big_com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '大件商品编码',
  `big_com_number` decimal(11, 0) NOT NULL COMMENT '大件商品消耗数量',
  `small_com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '小件商品编码',
  `small_com_number` decimal(11, 0) NOT NULL COMMENT '小件商品增加数量',
  `create_time` datetime NOT NULL COMMENT '拆分时间',
  `create_user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '拆分人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_sub_logistics_purchase`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `par_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '主表id',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `com_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `purchase_num` decimal(11, 2) NOT NULL COMMENT '进货数量',
  `purchase_cost` decimal(11, 2) NOT NULL COMMENT '进货单价成本',
  `purchase_cost_total` decimal(11, 2) NOT NULL COMMENT '进货成本',
  `supplier_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '供货商id',
  `purchase_price` decimal(11, 2) NULL DEFAULT NULL COMMENT '进货售价',
  `purchase_price_total` decimal(11, 2) NULL DEFAULT NULL COMMENT '进货总售价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_sub_logistics_return`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `par_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '主表id',
  `com_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '商品编码',
  `com_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `return_num` decimal(11, 2) NOT NULL COMMENT '退货数量',
  `return_cost` decimal(11, 2) NOT NULL COMMENT '退货单价金额',
  `return_cost_total` decimal(11, 2) NOT NULL COMMENT '退货金额',
  `supplier_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '供货商id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

CREATE TABLE `db_commodity_node22`.`tb_supplier`  (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键',
  `account_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账户id',
  `supplier_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '供货商名称',
  `supplier_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '联系电话',
  `supplier_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `is_use` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否使用,0,未使用,1,使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

SET FOREIGN_KEY_CHECKS=1;