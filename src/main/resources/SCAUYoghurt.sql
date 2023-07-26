/*
 Navicat Premium Data Transfer

 Source Server         : 0 localhost(127.0.0.1)
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 127.0.0.1:3306
 Source Schema         : scauyoghurt

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 09/05/2023 16:53:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '收货人',
  `sex` tinyint(0) NOT NULL COMMENT '性别 0 女 1 男',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `province_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级区划编号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '省级名称',
  `city_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级区划编号',
  `city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '市级名称',
  `district_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级区划编号',
  `district_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '区级名称',
  `detail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '详细地址',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '默认 0 否 1是',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '地址管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (1417414526093082626, 1417012167126876162, '小明', 1, '13812345678', NULL, NULL, NULL, NULL, NULL, NULL, '昌平区金燕龙办公楼', '公司', 1, '2021-07-20 17:22:12', '2021-07-20 17:26:33', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1417414926166769666, 1417012167126876162, '小李', 1, '13512345678', NULL, NULL, NULL, NULL, NULL, NULL, '测试', '家', 0, '2021-07-20 17:23:47', '2021-07-20 17:23:47', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1623903917274324994, 1623858008658280450, '王之涣', 1, '18620345985', NULL, NULL, NULL, NULL, NULL, NULL, '1111', '学校', 1, '2023-02-10 12:37:19', '2023-03-14 13:12:37', 1623858008658280450, 1623858008658280450, 0);
INSERT INTO `address_book` VALUES (1635260106981519361, 1, '1', 1, '18620345985', NULL, NULL, NULL, NULL, NULL, NULL, '1', '公司', 0, '2023-03-13 20:42:46', '2023-03-13 20:42:46', 1, 1, 0);
INSERT INTO `address_book` VALUES (1635260162702848001, 1, '1', 1, '18620345985', NULL, NULL, NULL, NULL, NULL, NULL, '1', '公司', 1, '2023-03-13 20:42:59', '2023-03-14 21:23:27', 1, 1, 0);
INSERT INTO `address_book` VALUES (1635507385164390402, 1635507328411262978, '1', 1, '18620345985', NULL, NULL, NULL, NULL, NULL, NULL, '1', '公司', 0, '2023-03-14 13:05:22', '2023-03-14 13:05:50', 1635507328411262978, 1635507328411262978, 0);
INSERT INTO `address_book` VALUES (1635507449995747329, 1635507328411262978, '1', 1, '18620345981', NULL, NULL, NULL, NULL, NULL, NULL, '1', '公司', 0, '2023-03-14 13:05:37', '2023-03-14 13:08:07', 1635507328411262978, 1635507328411262978, 0);
INSERT INTO `address_book` VALUES (1635508046710988802, 1635507328411262978, '王之涣986', 1, '18620345986', NULL, NULL, NULL, NULL, NULL, NULL, '地址986', '学校', 1, '2023-03-14 13:07:59', '2023-03-14 13:08:15', 1635507328411262978, 1635507328411262978, 0);
INSERT INTO `address_book` VALUES (1635508453772386306, 1635508376517500930, '王之涣986', 1, '18620345986', NULL, NULL, NULL, NULL, NULL, NULL, '地址986', '家', 1, '2023-03-14 13:09:36', '2023-03-14 13:09:38', 1635508376517500930, 1635508376517500930, 0);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `type` int(0) NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1397844263642378242, 1, '华农经典酸奶', 1, '2021-05-27 09:16:58', '2023-05-09 15:43:05', 1, 1);
INSERT INTO `category` VALUES (1397844303408574465, 1, '新品酸奶', 2, '2021-05-27 09:17:07', '2023-05-09 15:43:54', 1, 1);
INSERT INTO `category` VALUES (1397844391040167938, 1, '健康·无添加酸奶', 3, '2021-05-27 09:17:28', '2023-05-09 15:44:12', 1, 1);
INSERT INTO `category` VALUES (1413341197421846529, 1, '(其它)勺子吸管补充', 8, '2021-07-09 11:36:15', '2023-05-09 15:47:11', 1, 1);
INSERT INTO `category` VALUES (1413342269393674242, 2, '礼品好物推荐组合装', 6, '2021-07-09 11:40:30', '2023-05-09 15:46:36', 1, 1);
INSERT INTO `category` VALUES (1413386191767674881, 2, '长者推荐组合装', 7, '2021-07-09 14:35:02', '2023-05-09 15:46:11', 1, 1);
INSERT INTO `category` VALUES (1623872884457922561, 1, '华农鲜牛奶', 4, '2023-02-10 10:34:00', '2023-05-09 15:44:25', 1, 1);
INSERT INTO `category` VALUES (1635258438328004610, 1, '礼盒', 5, '2023-03-13 20:36:08', '2023-05-09 15:45:48', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint(0) NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1655843475259670530, '原味酸牛奶', 1397844263642378242, 300.00, '', '09670e1a-3d9b-40a3-a478-2473b19d6d18.png', '11', 1, 0, '2023-05-09 15:53:43', '2023-05-09 15:55:10', 1, 1, 0);
INSERT INTO `dish` VALUES (1655844104392687618, '经·典酸牛奶', 1397844263642378242, 400.00, '', '606f5c7f-0ec5-4799-926f-00d89f6aa889.png', '', 1, 0, '2023-05-09 15:56:13', '2023-05-09 15:56:13', 1, 1, 0);
INSERT INTO `dish` VALUES (1655844213432008706, '纯白酸牛奶', 1397844263642378242, 250.00, '', '630b7509-856c-49a6-bf0d-5728f8e1cd2b.png', '', 1, 0, '2023-05-09 15:56:39', '2023-05-09 15:56:39', 1, 1, 0);
INSERT INTO `dish` VALUES (1655844355186900993, '蓝莓风味酸牛奶', 1397844303408574465, 400.00, '', 'ef0284a4-9b37-4b2e-ab59-a0896afc939a.png', '', 1, 0, '2023-05-09 15:57:13', '2023-05-09 15:57:13', 1, 1, 0);
INSERT INTO `dish` VALUES (1655844495553478657, '无糖·无添加糖酸牛奶', 1397844391040167938, 400.00, '', 'd2602ef6-2b11-45af-9cc3-18d9f46492c4.png', '', 1, 0, '2023-05-09 15:57:47', '2023-05-09 15:57:47', 1, 1, 0);
INSERT INTO `dish` VALUES (1655844603695218690, '华农学士酸牛奶', 1397844263642378242, 400.00, '', 'eebfafb3-ed32-4f56-8afe-889fd22a4ec4.png', '', 1, 0, '2023-05-09 15:58:12', '2023-05-09 15:58:12', 1, 1, 0);
INSERT INTO `dish` VALUES (1655844786621399041, '华农鲜牛奶(巴氏杀菌)', 1623872884457922561, 400.00, '', '087e3288-0a61-4d3e-9a6e-db0842379f07.png', '', 1, 0, '2023-05-09 15:58:56', '2023-05-09 15:58:56', 1, 1, 0);
INSERT INTO `dish` VALUES (1655844998094012418, '华农酸奶专属定制礼盒', 1635258438328004610, 680.00, '', '0e2b1184-a70e-4145-b7fa-57c18d5aaf7e.png', '', 1, 0, '2023-05-09 15:59:46', '2023-05-09 15:59:46', 1, 1, 0);
INSERT INTO `dish` VALUES (1655845205716254721, '吸管·华农酸奶专属吸管', 1413341197421846529, 10.00, '', '4603843f-3ac5-471b-976b-8f1a2aa2c61b.png', '', 1, 0, '2023-05-09 16:00:36', '2023-05-09 16:00:36', 1, 1, 0);
INSERT INTO `dish` VALUES (1655845342752555010, '勺子·华农酸奶专属勺', 1413341197421846529, 30.00, '', '2a9e210f-748e-4505-9f35-a58d66aa77e8.png', '', 1, 0, '2023-05-09 16:01:08', '2023-05-09 16:01:24', 1, 1, 0);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `dish_id` bigint(0) NOT NULL COMMENT '菜品',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '口味名称',
  `value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味数据list',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (1635567148497657857, 1635567148459909122, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-03-14 17:02:50', '2023-03-14 17:02:50', 1623858008658280450, 1623858008658280450, 0);
INSERT INTO `dish_flavor` VALUES (1635567341792157698, 1635567341792157697, '甜味', '[\"无糖\",\"少糖\",\"半糖\",\"多糖\",\"全糖\"]', '2023-03-14 17:03:36', '2023-03-14 17:03:36', 1623858008658280450, 1623858008658280450, 0);
INSERT INTO `dish_flavor` VALUES (1655843838998102018, 1655843475259670530, '', '[]', '2023-05-09 15:55:10', '2023-05-09 15:55:10', 1, 1, 0);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '身份证号',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2021-05-06 17:20:07', '2021-05-10 02:24:09', 1, 1);
INSERT INTO `employee` VALUES (1635240938861355010, '王之涣', '202025510227', 'e10adc3949ba59abbe56e057f20f883e', '18620345985', '1', '410303200211151510', 1, '2023-03-13 19:26:36', '2023-03-13 19:26:36', 1, 1);
INSERT INTO `employee` VALUES (1655839384760500225, '张三', 'zhangsan', 'e10adc3949ba59abbe56e057f20f883e', '18888888888', '0', '440888888888888888', 1, '2023-05-09 15:37:28', '2023-05-09 15:37:28', 1, 1);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint(0) NOT NULL COMMENT '订单id',
  `dish_id` bigint(0) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(0) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(0) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1655858204824850435, '经典·长者校友组合装', '', 1655858204824850434, NULL, 1635259053766619138, NULL, 1, 54.00);
INSERT INTO `order_detail` VALUES (1655858204824850436, '无糖·健康长者组合装', '', 1655858204824850434, NULL, 1635258860111409153, NULL, 1, 65.00);
INSERT INTO `order_detail` VALUES (1655858204824850437, '华农学士酸牛奶', 'eebfafb3-ed32-4f56-8afe-889fd22a4ec4.png', 1655858204824850434, 1655844603695218690, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (1655858204824850438, '纯白酸牛奶', '630b7509-856c-49a6-bf0d-5728f8e1cd2b.png', 1655858204824850434, 1655844213432008706, NULL, NULL, 1, 2.50);
INSERT INTO `order_detail` VALUES (1655858204824850439, '经·典酸牛奶', '606f5c7f-0ec5-4799-926f-00d89f6aa889.png', 1655858204824850434, 1655844104392687618, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (1655858204824850440, '华农鲜牛奶(巴氏杀菌)', '087e3288-0a61-4d3e-9a6e-db0842379f07.png', 1655858204824850434, 1655844786621399041, NULL, NULL, 1, 4.00);
INSERT INTO `order_detail` VALUES (1655858204824850441, '蓝莓风味酸牛奶', 'ef0284a4-9b37-4b2e-ab59-a0896afc939a.png', 1655858204824850434, 1655844355186900993, NULL, NULL, 1, 4.00);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int(0) NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint(0) NOT NULL COMMENT '下单用户',
  `address_book_id` bigint(0) NOT NULL COMMENT '地址id',
  `order_time` datetime(0) NOT NULL COMMENT '下单时间',
  `checkout_time` datetime(0) NOT NULL COMMENT '结账时间',
  `pay_method` int(0) NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
  `amount` decimal(10, 2) NOT NULL COMMENT '实收金额',
  `remark` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1623904212750458881, '1623904212750458881', 2, 1623858008658280450, 1623903917274324994, '2023-02-10 12:38:30', '2023-02-10 12:38:30', 1, 1388.00, '', '18620345985', '1111', NULL, '王之涣');
INSERT INTO `orders` VALUES (1635507528156602370, '1635507528156602370', 2, 1635507328411262978, 1635507449995747329, '2023-03-14 13:05:56', '2023-03-14 13:05:56', 1, 20.00, '', '18620345981', '1', NULL, '1');
INSERT INTO `orders` VALUES (1635508152965292033, '1635508152965292033', 2, 1635507328411262978, 1635508046710988802, '2023-03-14 13:08:25', '2023-03-14 13:08:25', 1, 231.00, '备注：2023年3月14日13:08:22', '18620345986', '地址986', NULL, '王之涣986');
INSERT INTO `orders` VALUES (1635508239804162049, '1635508239804162049', 2, 1635507328411262978, 1635508046710988802, '2023-03-14 13:08:45', '2023-03-14 13:08:45', 1, 78.00, '', '18620345986', '地址986', NULL, '王之涣986');
INSERT INTO `orders` VALUES (1635508513432166401, '1635508513432166401', 2, 1635508376517500930, 1635508453772386306, '2023-03-14 13:09:51', '2023-03-14 13:09:51', 1, 156.00, '备注：2023年3月14日13:09:49', '18620345986', '地址986', NULL, '王之涣986');
INSERT INTO `orders` VALUES (1635509230943363074, '1635509230943363074', 2, 1623858008658280450, 1623903917274324994, '2023-03-14 13:12:42', '2023-03-14 13:12:42', 1, 226.00, '', '18620345985', '1111', '1', '王之涣');
INSERT INTO `orders` VALUES (1655858204824850434, '1655858204824850434', 2, 1623858008658280450, 1623903917274324994, '2023-05-09 16:52:15', '2023-05-09 16:52:15', 1, 137.00, '', '18620345985', '1111', '客户A~', '王之涣');

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `category_id` bigint(0) NOT NULL COMMENT '菜品分类id',
  `name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (1635258860111409153, 1413386191767674881, '无糖·健康长者组合装', 6500.00, 1, '', '', '', '2023-03-13 20:37:49', '2023-03-13 20:37:49', 1, 1, 0);
INSERT INTO `setmeal` VALUES (1635259053766619138, 1413386191767674881, '经典·长者校友组合装', 5400.00, 1, '', '', '', '2023-03-13 20:38:35', '2023-03-13 20:38:35', 1, 1, 0);
INSERT INTO `setmeal` VALUES (1635259276807122945, 1413342269393674242, '送学子·学子礼品推荐装', 4900.00, 1, '', '', '', '2023-03-13 20:39:28', '2023-03-13 20:39:28', 1, 1, 0);
INSERT INTO `setmeal` VALUES (1635259460282757122, 1413342269393674242, '送亲友·全套华农酸奶礼品装', 5900.00, 1, '', '', '', '2023-03-13 20:40:12', '2023-03-13 20:40:12', 1, 1, 0);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `setmeal_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品原价（冗余字段）',
  `copies` int(0) NOT NULL COMMENT '份数',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `create_user` bigint(0) NOT NULL COMMENT '创建人',
  `update_user` bigint(0) NOT NULL COMMENT '修改人',
  `is_deleted` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint(0) NOT NULL COMMENT '主键',
  `dish_id` bigint(0) NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint(0) NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int(0) NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像',
  `status` int(0) NULL DEFAULT 0 COMMENT '状态 0:禁用，1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1623858008658280450, '客户A~', '18620345985', '1', '1', '1', 1);
INSERT INTO `user` VALUES (1623858008658280451, '客户B~', '18620345986', '2', '2', '2', 2);
INSERT INTO `user` VALUES (1635507328411262978, NULL, '18620345986', NULL, NULL, NULL, 1);
INSERT INTO `user` VALUES (1635508376517500930, NULL, '18620345987', NULL, NULL, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
