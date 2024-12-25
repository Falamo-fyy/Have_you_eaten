/*
 Navicat Premium Data Transfer

 Source Server         : falamo
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:3306
 Source Schema         : elm

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 16/12/2024 23:28:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL,
  `complete address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Home address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '广州市', '广州市白云区');
INSERT INTO `address` VALUES (2, '深圳市', '深圳市罗湖区');

-- ----------------------------
-- Table structure for address_book
-- ----------------------------
DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book`  (
  `id` bigint NOT NULL COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `consignee` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '收货人',
  `sex` tinyint NOT NULL COMMENT '性别 0 女 1 男',
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
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '地址管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address_book
-- ----------------------------
INSERT INTO `address_book` VALUES (1417414526093082626, 1417012167126876162, '小明', 1, '13812345678', NULL, NULL, NULL, NULL, NULL, NULL, '昌平区金燕龙办公楼', '公司', 1, '2021-07-20 17:22:12', '2021-07-20 17:26:33', 1417012167126876162, 1417012167126876162, 0);
INSERT INTO `address_book` VALUES (1417414926166769666, 1417012167126876162, '小李', 1, '13512345678', NULL, NULL, NULL, NULL, NULL, NULL, '测试', '家', 0, '2021-07-20 17:23:47', '2021-07-20 17:23:47', 1417012167126876162, 1417012167126876162, 0);

-- ----------------------------
-- Table structure for bwcj
-- ----------------------------
DROP TABLE IF EXISTS `bwcj`;
CREATE TABLE `bwcj`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `sale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `haopinglv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Foreign_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bwcj
-- ----------------------------
INSERT INTO `bwcj` VALUES (1, '白雾红尘(大红袍)', 15, '688', '99', 'https://www.helloimg.com/i/2024/12/09/67565a5700dbe.png', '热销商品', '1');
INSERT INTO `bwcj` VALUES (2, '青沫观音(铁观音)', 15, '544', '98', 'https://www.helloimg.com/i/2024/12/09/67565a56f06b9.png', '特色商品', '1');
INSERT INTO `bwcj` VALUES (3, '去云南·玫瑰普洱', 22, '678', '95', 'https://www.helloimg.com/i/2024/12/09/67565a5719e7b.png', '热销商品', '1');
INSERT INTO `bwcj` VALUES (4, '任选饺子11只', 9, '211', '94', 'https://www.helloimg.com/i/2024/12/09/67565a571ce93.png', '热销商品', '5');
INSERT INTO `bwcj` VALUES (5, '任选饺子23只', 16, '311', '93', 'https://www.helloimg.com/i/2024/12/09/67565a571fc7f.png', '热销商品', '5');
INSERT INTO `bwcj` VALUES (6, '玉米鲜肉饺', 10, '234', '93', 'https://www.helloimg.com/i/2024/12/09/67565a5a32cf6.png', '特色商品', '5');
INSERT INTO `bwcj` VALUES (7, '豉汁排骨+腊肠煲仔饭', 22, '214', '96', 'https://www.helloimg.com/i/2024/12/09/67565a599e9f2.png', '热销商品', '8');
INSERT INTO `bwcj` VALUES (8, '鸡中翅+排骨煲仔饭', 23, '531', '99', 'https://www.helloimg.com/i/2024/12/09/67565a5a565c1.png', '热销商品', '8');
INSERT INTO `bwcj` VALUES (9, '腊肉+腊肠煲仔饭+开胃时蔬', 24, '235', '95', 'https://www.helloimg.com/i/2024/12/09/67565a57198a2.png', '特色商品', '8');
INSERT INTO `bwcj` VALUES (10, '桂花金萱奶冻', 12, '632', '97', 'https://www.helloimg.com/i/2024/12/09/67565a5a3b9a7.png', '热销商品', '4');
INSERT INTO `bwcj` VALUES (11, '轻畅羽衣甘蓝', 12, '124', '94', 'https://www.helloimg.com/i/2024/12/09/67565a5a50eb3.png', '热销商品', '4');
INSERT INTO `bwcj` VALUES (12, '椰椰桂花乌龙', 12, '432', '97', 'https://www.helloimg.com/i/2024/12/09/67565a5a8222a.png', '特色商品', '4');
INSERT INTO `bwcj` VALUES (13, '红气石榴草莓', 14, '333', '93', 'https://www.helloimg.com/i/2024/12/09/67565a5c5ef9c.png', '热销商品', '6');
INSERT INTO `bwcj` VALUES (14, '苦瓜柠檬茶', 14, '124', '97', 'https://www.helloimg.com/i/2024/12/09/67565a5d2211b.png', '热销商品', '6');
INSERT INTO `bwcj` VALUES (15, '青提茉莉', 14, '431', '95', 'https://www.helloimg.com/i/2024/12/09/67565a5d5c4eb.png', '特色商品', '6');
INSERT INTO `bwcj` VALUES (16, '活虾+生蚝砂锅粥+送黄金豆爆款☆+潮汕秘制豆酱', 55, '243', '97', 'https://www.helloimg.com/i/2024/12/09/67565a5d61ca8.png', '热销商品', '10');
INSERT INTO `bwcj` VALUES (17, '鲜美活虾砂锅粥心爆款+送香脆黄金豆+潮汕秘制豆酱', 56, '123', '98', 'https://www.helloimg.com/i/2024/12/09/67565a5d7871f.png', '热销商品', '10');
INSERT INTO `bwcj` VALUES (18, '营☆蚝砂锅粥◇爆款+送香脆黄金豆+潮汕秘制豆酱', 54, '532', '99', 'https://www.helloimg.com/i/2024/12/09/67565a5d7b129.png', '特色商品', '10');
INSERT INTO `bwcj` VALUES (19, '【低脂低卡】葡式黑椒虾仁滑蛋饭', 21, '61', '91', 'https://www.helloimg.com/i/2024/12/09/67565a5eeeca3.png', '热销商品', '11');
INSERT INTO `bwcj` VALUES (20, '葡式咖喱鸡排+滑蛋饭', 20, '32', '95', 'https://www.helloimg.com/i/2024/12/09/67565a6000cff.png', '热销商品', '11');
INSERT INTO `bwcj` VALUES (21, '葡式咖喱猪排+滑蛋饭', 22, '112', '92', 'https://www.helloimg.com/i/2024/12/09/67565a603c848.png', '特色商品', '11');
INSERT INTO `bwcj` VALUES (22, '红岩桃胶炖奶', 15, '351', '94', 'https://www.helloimg.com/i/2024/12/09/67565a60ca746.png', '热销商品', '12');
INSERT INTO `bwcj` VALUES (23, '红岩咸奶茶', 15, '234', '94', 'https://www.helloimg.com/i/2024/12/09/67565a610e380.png', '热销商品', '12');
INSERT INTO `bwcj` VALUES (24, '生椰抹茶麻薯', 15, '125', '94', 'https://www.helloimg.com/i/2024/12/09/67565a614e057.png', '特色商品', '12');
INSERT INTO `bwcj` VALUES (25, '黑椒鸡块', 5, '531', '97', 'https://www.helloimg.com/i/2024/12/09/67565a6171799.png', '热销商品', '13');
INSERT INTO `bwcj` VALUES (26, '香辣鸡腿堡超值套餐', 13, '231', '96', 'https://www.helloimg.com/i/2024/12/09/67565a624964d.png', '热销商品', '13');
INSERT INTO `bwcj` VALUES (27, '自选超值4件套', 20, '432', '94', 'https://www.helloimg.com/i/2024/12/09/67565a6280775.png', '特色商品', '13');
INSERT INTO `bwcj` VALUES (28, '【墙裂推荐】韩式双拼口味炸鸡套餐', 22, '135', '93', 'https://www.helloimg.com/i/2024/12/09/67565a635e792.png', '热销商品', '7');
INSERT INTO `bwcj` VALUES (29, '【特惠冲量】招牌双拼无骨炸鸡', 25, '561', '97', 'https://www.helloimg.com/i/2024/12/09/67565a644a586.png', '热销商品', '7');
INSERT INTO `bwcj` VALUES (30, '韩式双拼炸鸡可乐套餐', 30, '73', '93', 'https://www.helloimg.com/i/2024/12/09/67565a64b4515.png', '特色商品', '7');
INSERT INTO `bwcj` VALUES (31, '鸡翅桶', 10, '117', '95', 'https://www.helloimg.com/i/2024/12/09/67565a64c80cb.png', '热销商品', '3');
INSERT INTO `bwcj` VALUES (32, '香辣鸡腿中国汉堡+自选小食', 15, '357', '97', 'https://www.helloimg.com/i/2024/12/09/67565a653747d.png', '热销商品', '3');
INSERT INTO `bwcj` VALUES (33, '自选小食X2+塔塔翅根桶+', 20, '322', '94', 'https://www.helloimg.com/i/2024/12/09/67565a6594780.png', '特色商品', '3');
INSERT INTO `bwcj` VALUES (34, '番茄肥牛米线+荷包蛋(加量不加价)', 18, '742', '98', 'https://www.helloimg.com/i/2024/12/09/67565a65a4e78.png', '热销商品', '20');
INSERT INTO `bwcj` VALUES (35, '杂酱牛肉米线', 17, '215', '99', 'https://www.helloimg.com/i/2024/12/09/67565a6685025.png', '热销商品', '20');
INSERT INTO `bwcj` VALUES (36, '杂酱牛肉米线+小吃套餐', 20, '643', '93', 'https://www.helloimg.com/i/2024/12/09/67565a670ee3a.png', '特色商品', '20');
INSERT INTO `bwcj` VALUES (37, '【炸鸡拼盘盒】~超多炸鸡任选!小鸡推荐', 21, '463', '97', 'https://www.helloimg.com/i/2024/12/09/67565ae686eab.png', '热销商品', '2');
INSERT INTO `bwcj` VALUES (38, '【自选炸鸡盒】pick我爱韩式一特价', 22, '594', '94', 'https://www.helloimg.com/i/2024/12/09/67565a67aac06.png', '热销商品', '2');
INSERT INTO `bwcj` VALUES (39, '爆汁烤鸡盒子〗3块爆汁烤鸡+2个孜然烤小腿+6地瓜条', 26, '315', '97', 'https://www.helloimg.com/i/2024/12/09/67565a684132d.png', '特色商品', '2');
INSERT INTO `bwcj` VALUES (40, '番茄肥牛米线+荷包蛋(加量不加价)', 30, '753', '91', 'https://www.helloimg.com/i/2024/12/09/67565a6971674.png', '热销商品', '22');
INSERT INTO `bwcj` VALUES (41, '家常香菇鸡丁米线+荷包蛋', 25, '357', '98', 'https://www.helloimg.com/i/2024/12/09/67565a69865f0.png', '热销商品', '22');
INSERT INTO `bwcj` VALUES (42, '杂酱牛肉米线', 20, '247', '99', 'https://www.helloimg.com/i/2024/12/09/67565a69e30e0.png', '特色商品', '22');
INSERT INTO `bwcj` VALUES (43, '8英寸奥尔良拼榴莲比萨', 20, '466', '94', 'https://www.helloimg.com/i/2024/12/09/67565a6a30932.png', '热销商品', '21');
INSERT INTO `bwcj` VALUES (44, '8英寸金枕榴莲比萨', 22, '246', '96', 'https://www.helloimg.com/i/2024/12/09/67565a6ab6247.png', '热销商品', '21');
INSERT INTO `bwcj` VALUES (45, '8英寸任意两个披萨', 21, '321', '94', 'https://www.helloimg.com/i/2024/12/09/67565a6c179a5.png', '特色商品', '21');
INSERT INTO `bwcj` VALUES (46, '韩式双拼', 34, '432', '97', 'https://www.helloimg.com/i/2024/12/09/6756cdeb0b329.png', '热销商品', '17');
INSERT INTO `bwcj` VALUES (47, '双拼炸鸡畅享套餐', 54, '234', '97', 'https://www.helloimg.com/i/2024/12/09/6756cdeb05d31.png', '热销商品', '17');
INSERT INTO `bwcj` VALUES (48, '无骨炸鸡块', 23, '345', '95', 'https://www.helloimg.com/i/2024/12/09/6756cdeaee766.png', '特色商品', '17');
INSERT INTO `bwcj` VALUES (49, '翅根套餐', 43, '234', '97', 'https://www.helloimg.com/i/2024/12/09/6756cdeae9c59.png', '热销商品', '18');
INSERT INTO `bwcj` VALUES (50, '火鸡面', 35, '654', '98', 'https://www.helloimg.com/i/2024/12/09/6756cdeb0f88c.png', '热销商品', '18');
INSERT INTO `bwcj` VALUES (51, '火鸡面套餐', 31, '246', '99', 'https://www.helloimg.com/i/2024/12/09/6756cdebb0537.png', '特色商品', '18');
INSERT INTO `bwcj` VALUES (52, '【单人尊享】1+1+1+1自选套餐', 64, '865', '92', 'https://www.helloimg.com/i/2024/12/09/6756cdeda302a.png', '热销商品', '11');
INSERT INTO `bwcj` VALUES (53, 'DIY爆蛋吐司三明治+拿铁套餐', 34, '456', '98', 'https://www.helloimg.com/i/2024/12/09/6756cdedabdbd.png', '热销商品', '11');
INSERT INTO `bwcj` VALUES (54, '超人气厚切鸡扒爆蛋吐司', 21, '654', '94', 'https://www.helloimg.com/i/2024/12/09/6756cdedc73fb.png', '特色商品', '11');
INSERT INTO `bwcj` VALUES (55, '进口凤梨 100g', 54, '356', '96', 'https://www.helloimg.com/i/2024/12/09/6756cdedef4d3.png', '热销商品', '14');
INSERT INTO `bwcj` VALUES (56, '清润雪梨-100g', 31, '643', '92', 'https://www.helloimg.com/i/2024/12/09/6756cdee078df.png', '热销商品', '14');
INSERT INTO `bwcj` VALUES (57, '正宗潮汕南姜水果', 57, '253', '91', 'https://www.helloimg.com/i/2024/12/09/6756cdeede7fc.png', '特色商品', '14');
INSERT INTO `bwcj` VALUES (58, '手工鲜肉干蒸', 43, '654', '95', 'https://www.helloimg.com/i/2024/12/09/6756cdf02cec5.png', '热销商品', '19');
INSERT INTO `bwcj` VALUES (59, '虾仁烧卖皇+水晶虾饺', 24, '534', '92', 'https://www.helloimg.com/i/2024/12/09/6756cdf133587.png', '热销商品', '19');
INSERT INTO `bwcj` VALUES (60, '玉米人气蒸饺', 64, '756', '96', 'https://www.helloimg.com/i/2024/12/09/6756cdf18c28e.png', '特色商品', '19');
INSERT INTO `bwcj` VALUES (61, '欢享单人餐', 34, '345', '94', 'https://www.helloimg.com/i/2024/12/09/6756cdf141ed0.png', '热销商品', '13');
INSERT INTO `bwcj` VALUES (62, '情人单人享套餐', 56, '543', '99', 'https://www.helloimg.com/i/2024/12/09/6756cdf146c76.png', '热销商品', '13');
INSERT INTO `bwcj` VALUES (63, '情人节比翼双飞套餐', 63, '235', '98', 'https://www.helloimg.com/i/2024/12/09/6756cdf1bc855.png', '特色商品', '13');
INSERT INTO `bwcj` VALUES (64, '夫妻肺片米饭套餐', 45, '745', '95', 'https://www.helloimg.com/i/2024/12/09/6756cdf2f0a1c.png', '热销商品', '22');
INSERT INTO `bwcj` VALUES (65, '手撕鸡米饭套餐', 32, '345', '96', 'https://www.helloimg.com/i/2024/12/09/6756cdf3d3e21.png', '热销商品', '22');
INSERT INTO `bwcj` VALUES (66, '素拌菜全家桶', 54, '345', '96', 'https://www.helloimg.com/i/2024/12/09/6756cdf4173df.png', '特色商品', '22');
INSERT INTO `bwcj` VALUES (67, '窑鸡双人营养套餐', 75, '765', '92', 'https://www.helloimg.com/i/2024/12/09/6756cdf414154.png', '热销商品', '18');
INSERT INTO `bwcj` VALUES (68, '招牌窑鸡', 32, '345', '94', 'https://www.helloimg.com/i/2024/12/09/6756cdf48e012.png', '特色商品', '18');
INSERT INTO `bwcj` VALUES (69, '炒牛河', 15, '764', '95', 'https://www.helloimg.com/i/2024/12/09/6756cdf502d4f.png', '特色商品', '10');
INSERT INTO `bwcj` VALUES (70, '鸳鸯粉', 74, '657', '95', 'https://www.helloimg.com/i/2024/12/09/6756cdf5c13a9.png', '热销商品', '10');
INSERT INTO `bwcj` VALUES (71, '至尊多料肠粉皇', 34, '345', '97', 'https://www.helloimg.com/i/2024/12/09/6756cdf657ccf.png', '热销商品', '10');
INSERT INTO `bwcj` VALUES (72, '叉烧螺蛳粉', 21, '765', '98', 'https://www.helloimg.com/i/2024/12/09/6756cdf6ecf1d.png', '特色商品', '20');
INSERT INTO `bwcj` VALUES (73, '虎皮鸭脚螺蛳粉', 53, '345', '98', 'https://www.helloimg.com/i/2024/12/09/6756cdf6dbf86.png', '热销商品', '20');
INSERT INTO `bwcj` VALUES (74, '招牌螺蛳粉(叉烧腊肠卤蛋)', 64, '654', '92', 'https://www.helloimg.com/i/2024/12/09/6756cdf7734f1.png', '热销商品', '20');
INSERT INTO `bwcj` VALUES (75, '堡堡随心拼(7件任选)', 32, '234', '99', 'https://www.helloimg.com/i/2024/12/09/6756cdf7d9dbb.png', '特色商品', '21');
INSERT INTO `bwcj` VALUES (76, '堡堡随心拼(10件任选)', 35, '654', '94', 'https://www.helloimg.com/i/2024/12/09/6756cdf8685e5.png', '热销商品', '21');
INSERT INTO `bwcj` VALUES (77, '六拼小食组合', 36, '345', '98', 'https://www.helloimg.com/i/2024/12/09/6756cdf8f1107.png', '热销商品', '21');
INSERT INTO `bwcj` VALUES (78, '双12陪莉喝', 35, '754', '97', 'https://www.helloimg.com/i/2024/12/09/6756cdfa07e30.png', '特色商品', '23');
INSERT INTO `bwcj` VALUES (79, '双12珍会喝', 53, '365', '98', 'https://www.helloimg.com/i/2024/12/09/6756cdfa5b5dc.png', '热销商品', '23');
INSERT INTO `bwcj` VALUES (80, '芋泥芒芒', 13, '755', '93', 'https://www.helloimg.com/i/2024/12/09/6756cdfae22e7.png', '热销商品', '23');
INSERT INTO `bwcj` VALUES (81, '大份招牌螺蛳粉', 64, '253', '94', 'https://www.helloimg.com/i/2024/12/09/6756cdfb2f0b9.png', '特色商品', '20');
INSERT INTO `bwcj` VALUES (82, '卤蛋螺蛳粉', 34, '765', '95', 'https://www.helloimg.com/i/2024/12/09/6756cdfb869b0.png', '热销商品', '20');
INSERT INTO `bwcj` VALUES (83, '原味螺蛳粉', 64, '345', '99', 'https://www.helloimg.com/i/2024/12/09/6756cdfd23c17.png', '热销商品', '20');
INSERT INTO `bwcj` VALUES (84, '黑椒鸡扒饭+饮品', 32, '754', '94', 'https://www.helloimg.com/i/2024/12/09/6756cdfd47785.png', '特色商品', '16');
INSERT INTO `bwcj` VALUES (85, '鸿运叉烧饭+冻柠茶', 15, '345', '97', 'https://www.helloimg.com/i/2024/12/09/6756cdfd28455.png', '热销商品', '16');
INSERT INTO `bwcj` VALUES (86, '经典咖喱鸡扒饭+冻柠七', 64, '645', '95', 'https://www.helloimg.com/i/2024/12/09/6756cdfdcbe07.png', '热销商品', '16');
INSERT INTO `bwcj` VALUES (87, '【小份】人气女神套餐', 32, '345', '89', 'https://www.helloimg.com/i/2024/12/09/6756cdfdf3068.png', '特色商品', '9');
INSERT INTO `bwcj` VALUES (88, '【鱼升龙门】荤素单人豪华套餐', 15, '765', '92', 'https://www.helloimg.com/i/2024/12/09/6756cdff5f9f4.png', '热销商品', '9');
INSERT INTO `bwcj` VALUES (89, '【元气满满】锦鲤套餐', 54, '322', '95', 'https://www.helloimg.com/i/2024/12/09/6756cdffcf097.png', '热销商品', '9');
INSERT INTO `bwcj` VALUES (90, '【开学冲量】鸡腿堡+鸡肉卷+网红鸡块+中可', 32, '754', '95', 'https://www.helloimg.com/i/2024/12/09/6756ce008057a.png', '特色商品', '9');
INSERT INTO `bwcj` VALUES (91, '【新客专属】鸡腿堡+鸡肉卷+饮品', 24, '265', '91', 'https://www.helloimg.com/i/2024/12/09/6756ce0075234.png', '热销商品', '9');
INSERT INTO `bwcj` VALUES (92, '三元及第鸡腿堡 +2蟹棒+3海芹荟鸡肉圈', 42, '456', '92', 'https://www.helloimg.com/i/2024/12/09/6756ce00dcb0f.png', '热销商品', '15');
INSERT INTO `bwcj` VALUES (93, '10英寸双拼披萨双人套餐', 44, '345', '94', 'https://www.helloimg.com/i/2024/12/09/6756ce0140416.png', '特色商品', '15');
INSERT INTO `bwcj` VALUES (94, '口口榴香1人餐', 32, '643', '93', 'https://www.helloimg.com/i/2024/12/09/6756ce01ea885.png', '热销商品', '15');
INSERT INTO `bwcj` VALUES (95, '龙年小吃拼盘', 23, '234', '95', 'https://www.helloimg.com/i/2024/12/09/6756ce02c825e.png', '热销商品', '8');
INSERT INTO `bwcj` VALUES (96, '生蚝烧烤套餐', 43, '445', '93', 'https://www.helloimg.com/i/2024/12/09/6756ce0315512.png', '特色商品', '8');
INSERT INTO `bwcj` VALUES (97, '淄博小饼单人套餐', 25, '345', '97', 'https://www.helloimg.com/i/2024/12/09/6756ce03313c3.png', '热销商品', '8');
INSERT INTO `bwcj` VALUES (98, '淄博小饼双人套餐', 43, '543', '96', 'https://www.helloimg.com/i/2024/12/09/6756d0091fe17.png', '热销商品', '8');

-- ----------------------------
-- Table structure for card
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES (1, '天天特价', '美食一折起', 'https://www.helloimg.com/i/2024/11/30/674acd1607da3.png');
INSERT INTO `card` VALUES (2, '霸王餐', '领十元红包', 'https://www.helloimg.com/i/2024/11/30/674acd1620385.png');
INSERT INTO `card` VALUES (3, '营养快餐', '15元吃饱', 'https://www.helloimg.com/i/2024/11/30/674acd1617250.png');
INSERT INTO `card` VALUES (4, '5折添活力', '上班不疲惫', 'https://www.helloimg.com/i/2024/11/30/674acd1830000.png');

-- ----------------------------
-- Table structure for cart_data
-- ----------------------------
DROP TABLE IF EXISTS `cart_data`;
CREATE TABLE `cart_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cartTotal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cartItems` json NULL,
  `uploadTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_data
-- ----------------------------
INSERT INTO `cart_data` VALUES (1, '65', '[{\"id\": 31, \"name\": \"鸡翅桶\", \"image\": \"https://www.helloimg.com/i/2024/12/09/67565a64c80cb.png\", \"price\": 10, \"sales\": \"117\", \"rating\": \"95\", \"quantity\": 2}, {\"id\": 32, \"name\": \"香辣鸡腿中国汉堡+自选小食\", \"image\": \"https://www.helloimg.com/i/2024/12/09/67565a653747d.png\", \"price\": 15, \"sales\": \"357\", \"rating\": \"97\", \"quantity\": 3}]', NULL);
INSERT INTO `cart_data` VALUES (2, '48', '[{\"id\": 11, \"name\": \"轻畅羽衣甘蓝\", \"image\": \"https://www.helloimg.com/i/2024/12/09/67565a5a50eb3.png\", \"price\": 12, \"sales\": \"124\", \"rating\": \"94\", \"quantity\": 2}, {\"id\": 10, \"name\": \"桂花金萱奶冻\", \"image\": \"https://www.helloimg.com/i/2024/12/09/67565a5a3b9a7.png\", \"price\": 12, \"sales\": \"632\", \"rating\": \"97\", \"quantity\": 2}]', NULL);
INSERT INTO `cart_data` VALUES (3, '36', '[{\"id\": 11, \"name\": \"轻畅羽衣甘蓝\", \"image\": \"https://www.helloimg.com/i/2024/12/09/67565a5a50eb3.png\", \"price\": 12, \"sales\": \"124\", \"rating\": \"94\", \"quantity\": 3}]', NULL);
INSERT INTO `cart_data` VALUES (4, '48', '[{\"id\": 10, \"name\": \"桂花金萱奶冻\", \"image\": \"https://www.helloimg.com/i/2024/12/09/67565a5a3b9a7.png\", \"price\": 12, \"sales\": \"632\", \"rating\": \"97\", \"quantity\": 2}, {\"id\": 11, \"name\": \"轻畅羽衣甘蓝\", \"image\": \"https://www.helloimg.com/i/2024/12/09/67565a5a50eb3.png\", \"price\": 12, \"sales\": \"124\", \"rating\": \"94\", \"quantity\": 2}]', NULL);
INSERT INTO `cart_data` VALUES (5, '65', '[{\"id\": 32, \"name\": \"香辣鸡腿中国汉堡+自选小食\", \"image\": \"https://www.helloimg.com/i/2024/12/09/67565a653747d.png\", \"price\": 15, \"sales\": \"357\", \"rating\": \"97\", \"quantity\": 3}, {\"id\": 31, \"name\": \"鸡翅桶\", \"image\": \"https://www.helloimg.com/i/2024/12/09/67565a64c80cb.png\", \"price\": 10, \"sales\": \"117\", \"rating\": \"95\", \"quantity\": 2}]', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '类型   1 菜品分类 2 套餐分类',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品及套餐分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1397844263642378242, 1, '湘菜', 1, '2021-05-27 09:16:58', '2021-07-15 20:25:23', 1, 1);
INSERT INTO `category` VALUES (1397844303408574465, 1, '川菜', 2, '2021-05-27 09:17:07', '2021-06-02 14:27:22', 1, 1);
INSERT INTO `category` VALUES (1397844391040167938, 1, '粤菜', 3, '2021-05-27 09:17:28', '2021-07-09 14:37:13', 1, 1);
INSERT INTO `category` VALUES (1413341197421846529, 1, '饮品', 11, '2021-07-09 11:36:15', '2021-07-09 14:39:15', 1, 1);
INSERT INTO `category` VALUES (1413342269393674242, 2, '商务套餐', 5, '2021-07-09 11:40:30', '2021-07-09 14:43:45', 1, 1);
INSERT INTO `category` VALUES (1413384954989060097, 1, '主食', 12, '2021-07-09 14:30:07', '2021-07-09 14:39:19', 1, 1);
INSERT INTO `category` VALUES (1413386191767674881, 2, '儿童套餐', 6, '2021-07-09 14:35:02', '2021-07-09 14:39:05', 1, 1);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品名称',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `status` int NOT NULL DEFAULT 1 COMMENT '0 停售 1 起售',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dish_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1397849739276890114, '辣子鸡', 1397844263642378242, 7800.00, '222222222', 'f966a38e-0780-40be-bb52-5699d13cb3d9.jpg', '来自鲜嫩美味的小鸡，值得一尝', 1, 0, '2021-05-27 09:38:43', '2021-05-27 09:38:43', 1, 1, 0);
INSERT INTO `dish` VALUES (1397850140982161409, '毛氏红烧肉', 1397844263642378242, 6800.00, '123412341234', '0a3b3288-3446-4420-bbff-f263d0c02d8e.jpg', '毛氏红烧肉毛氏红烧肉，确定不来一份？', 1, 0, '2021-05-27 09:40:19', '2021-05-27 09:40:19', 1, 1, 0);
INSERT INTO `dish` VALUES (1397850392090947585, '组庵鱼翅', 1397844263642378242, 4800.00, '123412341234', '740c79ce-af29-41b8-b78d-5f49c96e38c4.jpg', '组庵鱼翅，看图足以表明好吃程度', 1, 0, '2021-05-27 09:41:19', '2021-05-27 09:41:19', 1, 1, 0);
INSERT INTO `dish` VALUES (1397850851245600769, '霸王别姬', 1397844263642378242, 12800.00, '123412341234', '057dd338-e487-4bbc-a74c-0384c44a9ca3.jpg', '还有什么比霸王别姬更美味的呢？', 1, 0, '2021-05-27 09:43:08', '2021-05-27 09:43:08', 1, 1, 0);
INSERT INTO `dish` VALUES (1397851099502260226, '全家福', 1397844263642378242, 11800.00, '23412341234', 'a53a4e6a-3b83-4044-87f9-9d49b30a8fdc.jpg', '别光吃肉啦，来份全家福吧，让你长寿又美味', 1, 0, '2021-05-27 09:44:08', '2021-05-27 09:44:08', 1, 1, 0);
INSERT INTO `dish` VALUES (1397851370462687234, '邵阳猪血丸子', 1397844263642378242, 13800.00, '1246812345678', '2a50628e-7758-4c51-9fbb-d37c61cdacad.jpg', '看，美味不？来嘛来嘛，这才是最爱吖', 1, 0, '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish` VALUES (1397851668262465537, '口味蛇', 1397844263642378242, 16800.00, '1234567812345678', '0f4bd884-dc9c-4cf9-b59e-7d5958fec3dd.jpg', '爬行界的扛把子，东兴-口味蛇，让你欲罢不能', 1, 0, '2021-05-27 09:46:23', '2021-05-27 09:46:23', 1, 1, 0);
INSERT INTO `dish` VALUES (1397852391150759938, '辣子鸡丁', 1397844303408574465, 8800.00, '2346812468', 'ef2b73f2-75d1-4d3a-beea-22da0e1421bd.jpg', '辣子鸡丁，辣子鸡丁，永远的魂', 1, 0, '2021-05-27 09:49:16', '2021-05-27 09:49:16', 1, 1, 0);
INSERT INTO `dish` VALUES (1397853183287013378, '麻辣兔头', 1397844303408574465, 19800.00, '123456787654321', '2a2e9d66-b41d-4645-87bd-95f2cfeed218.jpg', '麻辣兔头的详细制作，麻辣鲜香，色泽红润，回味悠长', 1, 0, '2021-05-27 09:52:24', '2021-05-27 09:52:24', 1, 1, 0);
INSERT INTO `dish` VALUES (1397853709101740034, '蒜泥白肉', 1397844303408574465, 9800.00, '1234321234321', 'd2f61d70-ac85-4529-9b74-6d9a2255c6d7.jpg', '多么的有食欲啊', 1, 0, '2021-05-27 09:54:30', '2021-05-27 09:54:30', 1, 1, 0);
INSERT INTO `dish` VALUES (1397853890262118402, '鱼香肉丝', 1397844303408574465, 3800.00, '1234212321234', '8dcfda14-5712-4d28-82f7-ae905b3c2308.jpg', '鱼香肉丝简直就是我们童年回忆的一道经典菜，上学的时候点个鱼香肉丝盖饭坐在宿舍床上看着肥皂剧，绝了！现在完美复刻一下上学的时候感觉', 1, 0, '2021-05-27 09:55:13', '2021-05-27 09:55:13', 1, 1, 0);
INSERT INTO `dish` VALUES (1397854652581064706, '麻辣水煮鱼', 1397844303408574465, 14800.00, '2345312·345321', '1fdbfbf3-1d86-4b29-a3fc-46345852f2f8.jpg', '鱼片是买的切好的鱼片，放几个虾，增加味道', 1, 0, '2021-05-27 09:58:15', '2021-05-27 09:58:15', 1, 1, 0);
INSERT INTO `dish` VALUES (1397854865672679425, '鱼香炒鸡蛋', 1397844303408574465, 2000.00, '23456431·23456', '0f252364-a561-4e8d-8065-9a6797a6b1d3.jpg', '鱼香菜也是川味的特色。里面没有鱼却鱼香味', 1, 0, '2021-05-27 09:59:06', '2021-05-27 09:59:06', 1, 1, 0);
INSERT INTO `dish` VALUES (1397860242057375745, '脆皮烧鹅', 1397844391040167938, 12800.00, '123456786543213456', 'e476f679-5c15-436b-87fa-8c4e9644bf33.jpeg', '“广东烤鸭美而香，却胜烧鹅说古冈（今新会），燕瘦环肥各佳妙，君休偏重便宜坊”，可见烧鹅与烧鸭在粤菜之中已早负盛名。作为广州最普遍和最受欢迎的烧烤肉食，以它的“色泽金红，皮脆肉嫩，味香可口”的特色，在省城各大街小巷的烧卤店随处可见。', 1, 0, '2021-05-27 10:20:27', '2021-05-27 10:20:27', 1, 1, 0);
INSERT INTO `dish` VALUES (1397860578738352129, '白切鸡', 1397844391040167938, 6600.00, '12345678654', '9ec6fc2d-50d2-422e-b954-de87dcd04198.jpeg', '白切鸡是一道色香味俱全的特色传统名肴，又叫白斩鸡，是粤菜系鸡肴中的一种，始于清代的民间。白切鸡通常选用细骨农家鸡与沙姜、蒜茸等食材，慢火煮浸白切鸡皮爽肉滑，清淡鲜美。著名的泮溪酒家白切鸡，曾获商业部优质产品金鼎奖。湛江白切鸡更是驰名粤港澳。粤菜厨坛中，鸡的菜式有200余款之多，而最为人常食不厌的正是白切鸡，深受食家青睐。', 1, 0, '2021-05-27 10:21:48', '2021-05-27 10:21:48', 1, 1, 0);
INSERT INTO `dish` VALUES (1397860792492666881, '烤乳猪', 1397844391040167938, 38800.00, '213456432123456', '2e96a7e3-affb-438e-b7c3-e1430df425c9.jpeg', '广式烧乳猪主料是小乳猪，辅料是蒜，调料是五香粉、芝麻酱、八角粉等，本菜品主要通过将食材放入炭火中烧烤而成。烤乳猪是广州最著名的特色菜，并且是“满汉全席”中的主打菜肴之一。烤乳猪也是许多年来广东人祭祖的祭品之一，是家家都少不了的应节之物，用乳猪祭完先人后，亲戚们再聚餐食用。', 1, 0, '2021-05-27 10:22:39', '2021-05-27 10:22:39', 1, 1, 0);
INSERT INTO `dish` VALUES (1397860963880316929, '脆皮乳鸽', 1397844391040167938, 10800.00, '1234563212345', '3fabb83a-1c09-4fd9-892b-4ef7457daafa.jpeg', '“脆皮乳鸽”是广东菜中的一道传统名菜，属于粤菜系，具有皮脆肉嫩、色泽红亮、鲜香味美的特点，常吃可使身体强健，清肺顺气。随着菜品制作工艺的不断发展，逐渐形成了熟炸法、生炸法和烤制法三种制作方法。无论那种制作方法，都是在鸽子经过一系列的加工，挂脆皮水后再加工而成，正宗的“脆皮乳鸽皮脆肉嫩、色泽红亮、鲜香味美、香气馥郁。这三种方法的制作过程都不算复杂，但想达到理想的效果并不容易。', 1, 0, '2021-05-27 10:23:19', '2021-05-27 10:23:19', 1, 1, 0);
INSERT INTO `dish` VALUES (1397861683434139649, '清蒸河鲜海鲜', 1397844391040167938, 38800.00, '1234567876543213456', '1405081e-f545-42e1-86a2-f7559ae2e276.jpeg', '新鲜的海鲜，清蒸是最好的处理方式。鲜，体会为什么叫海鲜。清蒸是广州最经典的烹饪手法，过去岭南地区由于峻山大岭阻隔，交通不便，经济发展起步慢，自家打的鱼放在锅里煮了就吃，没有太多的讲究，但却发现这清淡的煮法能使鱼的鲜甜跃然舌尖。', 1, 0, '2021-05-27 10:26:11', '2021-05-27 10:26:11', 1, 1, 0);
INSERT INTO `dish` VALUES (1397862198033297410, '老火靓汤', 1397844391040167938, 49800.00, '123456786532455', '583df4b7-a159-4cfc-9543-4f666120b25f.jpeg', '老火靓汤又称广府汤，是广府人传承数千年的食补养生秘方，慢火煲煮的中华老火靓汤，火候足，时间长，既取药补之效，又取入口之甘甜。 广府老火汤种类繁多，可以用各种汤料和烹调方法，烹制出各种不同口味、不同功效的汤来。', 1, 0, '2021-05-27 10:28:14', '2021-05-27 10:28:14', 1, 1, 0);
INSERT INTO `dish` VALUES (1397862477831122945, '上汤焗龙虾', 1397844391040167938, 108800.00, '1234567865432', '5b8d2da3-3744-4bb3-acdc-329056b8259d.jpeg', '上汤焗龙虾是一道色香味俱全的传统名菜，属于粤菜系。此菜以龙虾为主料，配以高汤制成的一道海鲜美食。本品肉质洁白细嫩，味道鲜美，蛋白质含量高，脂肪含量低，营养丰富。是色香味俱全的传统名菜。', 1, 0, '2021-05-27 10:29:20', '2021-05-27 10:29:20', 1, 1, 0);
INSERT INTO `dish` VALUES (1413342036832100354, '北冰洋', 1413341197421846529, 500.00, '', 'c99e0aab-3cb7-4eaa-80fd-f47d4ffea694.png', '', 1, 0, '2021-07-09 11:39:35', '2021-07-09 15:12:18', 1, 1, 0);
INSERT INTO `dish` VALUES (1413384757047271425, '王老吉', 1413341197421846529, 500.00, '', '00874a5e-0df2-446b-8f69-a30eb7d88ee8.png', '', 1, 0, '2021-07-09 14:29:20', '2021-07-12 09:09:16', 1, 1, 0);
INSERT INTO `dish` VALUES (1413385247889891330, '米饭', 1413384954989060097, 200.00, '', 'ee04a05a-1230-46b6-8ad5-1a95b140fff3.png', '', 1, 0, '2021-07-09 14:31:17', '2021-07-11 16:35:26', 1, 1, 0);

-- ----------------------------
-- Table structure for dish_flavor
-- ----------------------------
DROP TABLE IF EXISTS `dish_flavor`;
CREATE TABLE `dish_flavor`  (
  `id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NOT NULL COMMENT '菜品',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '口味名称',
  `value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味数据list',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '菜品口味关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish_flavor
-- ----------------------------
INSERT INTO `dish_flavor` VALUES (1397849417888346113, 1397849417854791681, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:37:27', '2021-05-27 09:37:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849739297861633, 1397849739276890114, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849739323027458, 1397849739276890114, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:38:43', '2021-05-27 09:38:43', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849936421761025, 1397849936404983809, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397849936438538241, 1397849936404983809, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:39:30', '2021-05-27 09:39:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850141015715841, 1397850140982161409, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850141040881665, 1397850140982161409, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:40:19', '2021-05-27 09:40:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850392120307713, 1397850392090947585, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850392137084929, 1397850392090947585, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:41:19', '2021-05-27 09:41:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850630734262274, 1397850630700707841, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850630755233794, 1397850630700707841, '辣度', '[\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:42:16', '2021-05-27 09:42:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850851274960898, 1397850851245600769, '忌口', '[\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397850851283349505, 1397850851245600769, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:43:08', '2021-05-27 09:43:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851099523231745, 1397851099502260226, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851099527426050, 1397851099502260226, '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2021-05-27 09:44:08', '2021-05-27 09:44:08', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851370483658754, 1397851370462687234, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851370483658755, 1397851370462687234, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851370483658756, 1397851370462687234, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:45:12', '2021-05-27 09:45:12', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397851668283437058, 1397851668262465537, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:46:23', '2021-05-27 09:46:23', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397852391180120065, 1397852391150759938, '忌口', '[\"不要葱\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397852391196897281, 1397852391150759938, '辣度', '[\"不辣\",\"微辣\",\"重辣\"]', '2021-05-27 09:49:16', '2021-05-27 09:49:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853183307984898, 1397853183287013378, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:52:24', '2021-05-27 09:52:24', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853423486414850, 1397853423461249026, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:53:22', '2021-05-27 09:53:22', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853709126905857, 1397853709101740034, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:54:30', '2021-05-27 09:54:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397853890283089922, 1397853890262118402, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:55:13', '2021-05-27 09:55:13', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854133632413697, 1397854133603053569, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-27 09:56:11', '2021-05-27 09:56:11', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854652623007745, 1397854652581064706, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854652635590658, 1397854652581064706, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:58:15', '2021-05-27 09:58:15', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397854865735593986, 1397854865672679425, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 09:59:06', '2021-05-27 09:59:06', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397855742303186946, 1397855742273826817, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:02:35', '2021-05-27 10:02:35', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397855906497605633, 1397855906468245506, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:03:14', '2021-05-27 10:03:14', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397856190573621250, 1397856190540066818, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:04:21', '2021-05-27 10:04:21', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859056709316609, 1397859056684150785, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:15:45', '2021-05-27 10:15:45', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859277837217794, 1397859277812051969, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:16:37', '2021-05-27 10:16:37', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859487502086146, 1397859487476920321, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:17:27', '2021-05-27 10:17:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397859757061615618, 1397859757036449794, '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', '2021-05-27 10:18:32', '2021-05-27 10:18:32', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397860242086735874, 1397860242057375745, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:20:27', '2021-05-27 10:20:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397860963918065665, 1397860963880316929, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:23:19', '2021-05-27 10:23:19', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861135754506242, 1397861135733534722, '甜味', '[\"无糖\",\"少糖\",\"半躺\",\"多糖\",\"全糖\"]', '2021-05-27 10:24:00', '2021-05-27 10:24:00', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861370035744769, 1397861370010578945, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-27 10:24:56', '2021-05-27 10:24:56', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861683459305474, 1397861683434139649, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:26:11', '2021-05-27 10:26:11', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397861898467717121, 1397861898438356993, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:27:02', '2021-05-27 10:27:02', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397862198054268929, 1397862198033297410, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-27 10:28:14', '2021-05-27 10:28:14', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1397862477835317250, 1397862477831122945, '辣度', '[\"不辣\",\"微辣\",\"中辣\"]', '2021-05-27 10:29:20', '2021-05-27 10:29:20', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398089545865015297, 1398089545676271617, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-28 01:31:38', '2021-05-28 01:31:38', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398089782323097601, 1398089782285348866, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:32:34', '2021-05-28 01:32:34', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090003262255106, 1398090003228700673, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:33:27', '2021-05-28 01:33:27', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090264554811394, 1398090264517062657, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:34:29', '2021-05-28 01:34:29', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090455399837698, 1398090455324340225, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:35:14', '2021-05-28 01:35:14', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090685449023490, 1398090685419663362, '温度', '[\"热饮\",\"常温\",\"去冰\",\"少冰\",\"多冰\"]', '2021-05-28 01:36:09', '2021-05-28 01:36:09', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398090825358422017, 1398090825329061889, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:36:43', '2021-05-28 01:36:43', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091007051476993, 1398091007017922561, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:37:26', '2021-05-28 01:37:26', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091296164851713, 1398091296131297281, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:38:35', '2021-05-28 01:38:35', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091546531246081, 1398091546480914433, '忌口', '[\"不要葱\",\"不要蒜\",\"不要香菜\",\"不要辣\"]', '2021-05-28 01:39:35', '2021-05-28 01:39:35', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091729809747969, 1398091729788776450, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:40:18', '2021-05-28 01:40:18', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398091889499484161, 1398091889449152513, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:40:56', '2021-05-28 01:40:56', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398092095179763713, 1398092095142014978, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:41:45', '2021-05-28 01:41:45', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398092283877306370, 1398092283847946241, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:42:30', '2021-05-28 01:42:30', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398094018939236354, 1398094018893099009, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:49:24', '2021-05-28 01:49:24', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1398094391494094850, 1398094391456346113, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-05-28 01:50:53', '2021-05-28 01:50:53', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1399574026165727233, 1399305325713600514, '辣度', '[\"不辣\",\"微辣\",\"中辣\",\"重辣\"]', '2021-06-01 03:50:25', '2021-06-01 03:50:25', 1399309715396669441, 1399309715396669441, 0);
INSERT INTO `dish_flavor` VALUES (1413389540592263169, 1413384757047271425, '温度', '[\"常温\",\"冷藏\"]', '2021-07-12 09:09:16', '2021-07-12 09:09:16', 1, 1, 0);
INSERT INTO `dish_flavor` VALUES (1413389684020682754, 1413342036832100354, '温度', '[\"常温\",\"冷藏\"]', '2021-07-09 15:12:18', '2021-07-09 15:12:18', 1, 1, 0);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `status` int NULL DEFAULT 1 COMMENT '状态 0:禁用，1:正常',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '员工信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '13812312312', '1', '110101199001010047', 1, '2021-05-06 17:20:07', '2021-05-10 02:24:09', 1, 1);
INSERT INTO `employee` VALUES (2, 'pe管理员', 'peadmin', 'admin', '12312312312', '1', '151000011002200223', 1, '2023-06-02 18:10:00', '2024-07-06 03:22:03', 1, 1);
INSERT INTO `employee` VALUES (3, '1', '1', '1', '12312312312', '1', '151000011002200223', 1, '2023-06-02 18:10:00', '2024-07-06 03:22:03', 1, 1);
INSERT INTO `employee` VALUES (4, NULL, '2', '2', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `employee` VALUES (5, NULL, '3', '3', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `employee` VALUES (6, NULL, '888', '888', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `employee` VALUES (7, NULL, 'ppp', 'ppp', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for fenlei
-- ----------------------------
DROP TABLE IF EXISTS `fenlei`;
CREATE TABLE `fenlei`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fenlei
-- ----------------------------
INSERT INTO `fenlei` VALUES (1, '美食', 'https://www.helloimg.com/i/2024/11/30/674ad4ce582d6.png');
INSERT INTO `fenlei` VALUES (2, '甜品饮品', 'https://www.helloimg.com/i/2024/11/30/674acd1617816.png');
INSERT INTO `fenlei` VALUES (3, '商品超市', 'https://www.helloimg.com/i/2024/11/30/674acd16136e8.png');
INSERT INTO `fenlei` VALUES (4, '预订早餐', 'https://www.helloimg.com/i/2024/11/30/674acd160ba7f.png');
INSERT INTO `fenlei` VALUES (5, '果蔬生鲜', 'https://www.helloimg.com/i/2024/11/30/674acd15f40bd.png');
INSERT INTO `fenlei` VALUES (6, '新店优惠', 'https://www.helloimg.com/i/2024/11/30/674acd161df9f.png');
INSERT INTO `fenlei` VALUES (7, '准时达', 'https://www.helloimg.com/i/2024/11/30/674acd160ad7c.png');
INSERT INTO `fenlei` VALUES (8, '下午茶', 'https://www.helloimg.com/i/2024/11/30/674acd161717f.png');

-- ----------------------------
-- Table structure for order details
-- ----------------------------
DROP TABLE IF EXISTS `order details`;
CREATE TABLE `order details`  (
  `id` int NOT NULL,
  `Total quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `singal quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `buy time` datetime NULL DEFAULT NULL,
  `Subtotal amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Total amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Paymenttime` datetime NULL DEFAULT NULL,
  `Orderstatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `consignee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Deliveryaddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `placetime` datetime NULL DEFAULT NULL,
  `Returnstatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `Returntime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order details
-- ----------------------------
INSERT INTO `order details` VALUES (1, '2件', '1件', '2024-12-02 11:09:24', '60', '120', '2024-12-02 11:10:04', '已发货', '陈俊杰', '广州市白云区', '2024-12-02 11:10:52', '未退货', '100', NULL);
INSERT INTO `order details` VALUES (2, '3件', '1件', '2024-12-02 11:11:50', '70', '210', '2024-12-02 11:12:02', '未发货', 'ddd', '深圳市盐田区', '2024-12-02 11:12:22', '未退货', '100', NULL);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL COMMENT '主键',
  `number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '订单号',
  `status` int NOT NULL DEFAULT 1 COMMENT '订单状态 1待付款，2待派送，3已派送，4已完成，5已取消',
  `user_id` bigint NOT NULL COMMENT '下单用户',
  `address_book_id` bigint NOT NULL COMMENT '地址id',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `checkout_time` datetime NOT NULL COMMENT '结账时间',
  `pay_method` int NOT NULL DEFAULT 1 COMMENT '支付方式 1微信,2支付宝',
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

-- ----------------------------
-- Table structure for setmeal
-- ----------------------------
DROP TABLE IF EXISTS `setmeal`;
CREATE TABLE `setmeal`  (
  `id` bigint NOT NULL COMMENT '主键',
  `category_id` bigint NOT NULL COMMENT '菜品分类id',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐名称',
  `price` decimal(10, 2) NOT NULL COMMENT '套餐价格',
  `status` int NULL DEFAULT NULL COMMENT '状态 0:停用 1:启用',
  `code` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(512) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_setmeal_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal
-- ----------------------------
INSERT INTO `setmeal` VALUES (1415580119015145474, 1413386191767674881, '儿童套餐A计划', 4000.00, 1, '', '', '61d20592-b37f-4d72-a864-07ad5bb8f3bb.jpg', '2021-07-15 15:52:55', '2021-07-15 15:52:55', 1415576781934608386, 1415576781934608386, 0);

-- ----------------------------
-- Table structure for setmeal_dish
-- ----------------------------
DROP TABLE IF EXISTS `setmeal_dish`;
CREATE TABLE `setmeal_dish`  (
  `id` bigint NOT NULL COMMENT '主键',
  `setmeal_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '套餐id ',
  `dish_id` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '菜品id',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '菜品名称 （冗余字段）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品原价（冗余字段）',
  `copies` int NOT NULL COMMENT '份数',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_user` bigint NOT NULL COMMENT '创建人',
  `update_user` bigint NOT NULL COMMENT '修改人',
  `is_deleted` int NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '套餐菜品关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setmeal_dish
-- ----------------------------
INSERT INTO `setmeal_dish` VALUES (1415580119052894209, '1415580119015145474', '1397862198033297410', '老火靓汤', 49800.00, 1, 0, '2021-07-15 15:52:55', '2021-07-15 15:52:55', 1415576781934608386, 1415576781934608386, 0);
INSERT INTO `setmeal_dish` VALUES (1415580119061282817, '1415580119015145474', '1413342036832100354', '北冰洋', 500.00, 1, 0, '2021-07-15 15:52:55', '2021-07-15 15:52:55', 1415576781934608386, 1415576781934608386, 0);
INSERT INTO `setmeal_dish` VALUES (1415580119069671426, '1415580119015145474', '1413385247889891330', '米饭', 200.00, 1, 0, '2021-07-15 15:52:55', '2021-07-15 15:52:55', 1415576781934608386, 1415576781934608386, 0);

-- ----------------------------
-- Table structure for shoplist
-- ----------------------------
DROP TABLE IF EXISTS `shoplist`;
CREATE TABLE `shoplist`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id` int NOT NULL,
  `send` int NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `sales` int NULL DEFAULT NULL,
  `rating` int NULL DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `category2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of shoplist
-- ----------------------------
INSERT INTO `shoplist` VALUES ('霸王茶姬（广商实训楼店）', 1, 20, 3, 2000, 5, '甜品饮品', '下午茶', 'https://www.helloimg.com/i/2024/11/30/674acd6c5549a.png');
INSERT INTO `shoplist` VALUES ('朝鲜炸鸡（平壤正恩金店）', 2, 15, 0, 258, 4, '商品超市', '下午茶', 'https://www.helloimg.com/i/2024/11/30/674acd6c45cae.png');
INSERT INTO `shoplist` VALUES ('SAD炸鸡（lucky店）', 3, 18, 2, 1666, 5, '新店优惠', '商品超市', 'https://www.helloimg.com/i/2024/11/30/674acd6c32daf.png');
INSERT INTO `shoplist` VALUES ('jvav咖啡吐司（第一行政楼店）', 4, 25, 5, 2333, 3, '预订早餐', '新店优惠', 'https://www.helloimg.com/i/2024/11/30/674acd6c3e0c6.png');
INSERT INTO `shoplist` VALUES ('啊痛西南饺子（东北不爽店）', 5, 30, 3, 677, 3, '果蔬生鲜', '准时达', 'https://www.helloimg.com/i/2024/11/30/674acd6c29693.png');
INSERT INTO `shoplist` VALUES ('酒千河', 6, 35, 10, 11, 1, '下午茶', '甜品饮品', 'https://www.helloimg.com/i/2024/11/30/674acd6c2cd45.png');
INSERT INTO `shoplist` VALUES ('坤坤快跑', 7, 12, 0, 5000, 5, '新店优惠', '准时达', 'https://www.helloimg.com/i/2024/11/30/674acfb875f83.png');
INSERT INTO `shoplist` VALUES ('煲仔一点都不正饭', 8, 0, 1, 1000, 4, '新店优惠', '商品超市', 'https://www.helloimg.com/i/2024/11/30/674acd6c598f2.png');
INSERT INTO `shoplist` VALUES ('咖思月球', 9, 18, 3, 2663, 3, '甜品饮品', '预订早餐', 'https://www.helloimg.com/i/2024/11/30/674acd6c4d46b.png');
INSERT INTO `shoplist` VALUES ('潮汕海鲜砂锅粥', 10, 16, 6, 2631, 4, '预订早餐', '甜品饮品', 'https://www.helloimg.com/i/2024/11/30/674acd6c44f11.png');
INSERT INTO `shoplist` VALUES ('美式滑蛋饭', 11, 15, 5, 1264, 2, '果蔬生鲜', '新店优惠', 'https://www.helloimg.com/i/2024/11/30/674acd6c56883.png');
INSERT INTO `shoplist` VALUES ('现名（厂店）', 12, 15, 2, 6666, 5, '甜品饮品', '准时达', 'https://www.helloimg.com/i/2024/11/30/674acd6e13b32.png');
INSERT INTO `shoplist` VALUES ('华菜食.半鸭汉堡', 13, 5, 5, 3333, 3, '果蔬生鲜', '下午茶', 'https://www.helloimg.com/i/2024/11/30/674acd6e6a3ad.png');
INSERT INTO `shoplist` VALUES ('家切水果，甘草水果', 14, 3, 4, 4444, 3, '果蔬生鲜', '商品超市', 'https://www.helloimg.com/i/2024/11/30/674acd6ec77cf.png');
INSERT INTO `shoplist` VALUES ('河北粥铺', 15, 0, 0, 658, 2, '预订早餐', '下午茶', 'https://www.helloimg.com/i/2024/11/30/674acd6f1eabe.png');
INSERT INTO `shoplist` VALUES ('叫了个炸坤（38栋宿舍店）', 16, 13, 5, 112, 1, '下午茶', '新店优惠', 'https://www.helloimg.com/i/2024/11/30/674acd6f3c375.png');
INSERT INTO `shoplist` VALUES ('慢慢鸭脖', 17, 10, 4, 6699, 5, '准时达', '下午茶', 'https://www.helloimg.com/i/2024/11/30/674acd6f966cc.png');
INSERT INTO `shoplist` VALUES ('预制菜之鸡大宝窑鸡', 18, 30, 5, 6621, 4, '商品超市', '果蔬生鲜', 'https://www.helloimg.com/i/2024/11/30/674acd6fa8904.png');
INSERT INTO `shoplist` VALUES ('广式非手工早茶', 19, 15, 2, 9999, 4, '预订早餐', '下午茶', 'https://www.helloimg.com/i/2024/11/30/674acd6fd03e3.png');
INSERT INTO `shoplist` VALUES ('潘小罗广州螺蛳粉', 20, 10, 3, 4444, 3, '新店优惠', '下午茶', 'https://www.helloimg.com/i/2024/11/30/674acd6fd9370.png');
INSERT INTO `shoplist` VALUES ('巴拉巴巴巴', 21, 30, 9, 6666, 5, '预订早餐', '准时达', 'https://www.helloimg.com/i/2024/11/30/674acd6fbe7e6.png');
INSERT INTO `shoplist` VALUES ('冒瘦子高档火锅', 22, 16, 0, 995, 3, '果蔬生鲜', '商品超市', 'https://www.helloimg.com/i/2024/11/30/674acd704538b.png');
INSERT INTO `shoplist` VALUES ('甜蜜蜜', 23, 15, 3, 9999, 5, '下午茶', '甜品饮品', 'https://www.helloimg.com/i/2024/11/30/674acd7005ec3.png');

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '名称',
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `user_id` bigint NOT NULL COMMENT '主键',
  `dish_id` bigint NULL DEFAULT NULL COMMENT '菜品id',
  `setmeal_id` bigint NULL DEFAULT NULL COMMENT '套餐id',
  `dish_flavor` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '口味',
  `number` int NOT NULL DEFAULT 1 COMMENT '数量',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
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
  `id` bigint NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '邮箱地址',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像',
  `status` int NULL DEFAULT 0 COMMENT '状态 0:禁用，1:正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
