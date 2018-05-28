/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : takeaway

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 28/05/2018 21:24:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` int(10) UNSIGNED NOT NULL,
  `update_time` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '热菜', 1527487748, 1527487748);

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `new_price` int(11) NOT NULL,
  `old_price` int(10) UNSIGNED NOT NULL,
  `dish_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `dish_count` int(11) NOT NULL,
  `dish_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` int(10) UNSIGNED NOT NULL,
  `update_time` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1, 1, 999, 666, '/uploads/20180528/a01bab434f76b97954cfeeb889eaad9e.jpg', 555, '小鸡顿蘑菇', 1527488057, 1527488057);

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores`  (
  `id` int(10) UNSIGNED NOT NULL,
  `start_price` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `add_price` int(10) UNSIGNED NOT NULL,
  `start_time` int(10) UNSIGNED NOT NULL,
  `end_time` int(10) UNSIGNED NOT NULL,
  `start_distance` int(11) UNSIGNED NOT NULL,
  `end_distance` int(10) UNSIGNED NOT NULL,
  `add_distance` int(10) UNSIGNED NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `range_info` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `create_time` int(11) UNSIGNED NOT NULL,
  `update_time` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO `stores` VALUES (1, 5, 10, 0, 235959, 500, 800000, 100, '山东省济南市历下区盛景广场', '36.69528', '117.11216', '[{\"lng\":-102.981407,\"lat\":83.12389474942977},{\"lng\":-58.088388168330766,\"lat\":80.83365246653096},{\"lng\":-35.57341235350077,\"lat\":76.08064178722127},{\"lng\":-23.215073474191584,\"lat\":70.6361009388758},{\"lng\":-14.765541607803694,\"lat\":64.99749819503029},{\"lng\":-8.066272141420946,\"lat\":59.33034589699529},{\"lng\":-2.24188671201807,\"lat\":53.71354346266773},{\"lng\":3.1268174342636925,\"lat\":48.19838981039452},{\"lng\":8.269551080940614,\"lat\":42.826625917484},{\"lng\":13.32674170954152,\"lat\":37.637250759073744},{\"lng\":18.392096472877256,\"lat\":32.669555192182266},{\"lng\":23.532248488804154,\"lat\":27.96460692105594},{\"lng\":28.796134588160992,\"lat\":23.56592565073497},{\"lng\":34.21925085743166,\"lat\":19.51957714344591},{\"lng\":39.825119850680295,\"lat\":15.873715849572646},{\"lng\":45.62520333789516,\"lat\":12.67753205569959},{\"lng\":51.61809384608796,\"lat\":9.979561209012708},{\"lng\":57.788712440722506,\"lat\":7.825380599569956},{\"lng\":64.10821426275783,\"lat\":6.2548449903009145},{\"lng\":70.53520413531378,\"lat\":5.2991717816250965},{\"lng\":77.018593,\"lat\":4.978322749429696},{\"lng\":83.50198186468623,\"lat\":5.299171781625093},{\"lng\":89.92897173724218,\"lat\":6.254844990300911},{\"lng\":96.2484735592775,\"lat\":7.825380599569956},{\"lng\":102.41909215391199,\"lat\":9.979561209012703},{\"lng\":108.41198266210485,\"lat\":12.677532055699585},{\"lng\":114.21206614931971,\"lat\":15.873715849572642},{\"lng\":119.81793514256832,\"lat\":19.519577143445904},{\"lng\":125.24105141183904,\"lat\":23.56592565073496},{\"lng\":130.50493751119583,\"lat\":27.964606921055932},{\"lng\":135.64508952712274,\"lat\":32.66955519218226},{\"lng\":140.7104442904585,\"lat\":37.63725075907373},{\"lng\":145.7676349190594,\"lat\":42.82662591748399},{\"lng\":150.91036856573632,\"lat\":48.19838981039452},{\"lng\":156.27907271201803,\"lat\":53.713543462667715},{\"lng\":162.10345814142093,\"lat\":59.330345896995276},{\"lng\":168.8027276078037,\"lat\":64.99749819503029},{\"lng\":177.25225947419162,\"lat\":70.6361009388758},{\"lng\":-170.3894016464992,\"lat\":76.08064178722127},{\"lng\":-147.87442583166933,\"lat\":80.83365246653092},{\"lng\":-102.981407,\"lat\":83.12389474942977}]', 0, 1527488757);

SET FOREIGN_KEY_CHECKS = 1;
