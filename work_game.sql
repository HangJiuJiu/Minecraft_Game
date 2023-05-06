/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : work_game

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 16/11/2022 11:53:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gameid` int(11) NULL DEFAULT NULL COMMENT '模组id',
  `userid` int(11) NULL DEFAULT NULL COMMENT '收藏人',
  `time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收藏时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gamename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (43, 1, 7, '2022-06-22 20:31', 'https://www.curseforge.com/minecraft/mc-mods/mekanism', '通用机械');
INSERT INTO `collect` VALUES (51, 4, 4, '2022-06-24 19:49', 'https://sildurs-shaders.github.io/downloads/', 'Sildurs');

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模组名称',
  `edition` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模组版本',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模组类型',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下载链接',
  `createtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间',
  `createid` int(11) NULL DEFAULT NULL COMMENT '开发者',
  `createname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开发者',
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态：0-未审核；1-通过；2-驳回',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES (1, '通用机械', '1.16.5', '科技', 'https://www.curseforge.com/minecraft/mc-mods/mekanism', '2022-06-20 20:01', 11, 'admin', '1');
INSERT INTO `game` VALUES (2, '机械动力', '1.16.5', '科技', 'https://www.curseforge.com/minecraft/mc-mods/create', '2022-06-20 20:02', 11, 'admin', '1');
INSERT INTO `game` VALUES (3, '沉浸工程', '1.16.5', '科技', 'https://www.curseforge.com/minecraft/mc-mods/immersive-engineering', '2022-06-20 20:03', 11, 'admin', '1');
INSERT INTO `game` VALUES (4, '史诗之剑', '1.16.5', '冒险', 'https://www.planetminecraft.com/mod/epic-sword-5578469/', '2022-06-20 20:04', 11, 'admin', '1');
INSERT INTO `game` VALUES (5, '突变生物', '1.12.2', '冒险', 'https://www.mcbbs.net/thread-971866-1-1.html', '2022-06-20 20:06', 11, 'admin', '1');
INSERT INTO `game` VALUES (6, '恐怖生物', '1.12.2', '冒险', 'https://www.mcmod.cn/class/909.html', '2022-06-20 20:07', 11, 'admin', '1');
INSERT INTO `game` VALUES (7, '古石器', '1.16.5', '冒险', 'https://www.planetminecraft.com/mod/paleolitical/', '2022-06-20 20:09', 11, 'admin', '1');
INSERT INTO `game` VALUES (8, '交错次元', '1.12.2', '冒险', 'https://www.mcbbs.net/thread-804242-1-1.html', '2022-06-20 20:09', 11, 'admin', '1');
INSERT INTO `game` VALUES (9, '残影', '1.12.2', '冒险', 'https://www.mcmod.cn/class/1946.html', '2022-06-20 20:10', 11, 'admin', '1');
INSERT INTO `game` VALUES (10, '路石', '1.15.2', '冒险', 'https://www.curseforge.com/minecraft/mc-mods/waystones', '2022-06-20 20:11', 11, 'admin', '1');
INSERT INTO `game` VALUES (11, '苹果皮', '1.15.2', '魔法', 'https://www.curseforge.com/minecraft/mc-mods/appleskin', '2022-06-20 20:11', 11, 'admin', '1');
INSERT INTO `game` VALUES (12, '崩坏', '1.12.2', '冒险', 'https://www.mcbbs.net/thread-1094472-1-2.html', '2022-06-20 20:14', 11, 'admin', '1');
INSERT INTO `game` VALUES (13, '机械方块', '1.12.2', '科技', 'https://w.atwiki.jp/minecraft/sp/pages/1436.html', '2022-06-20 20:14', 11, 'admin', '1');
INSERT INTO `game` VALUES (14, '虚拟电脑', '1.15.2', '科技', 'https://github.com/Delta2Force/MCVmComputers', '2022-06-20 20:16', 11, 'admin', '1');
INSERT INTO `game` VALUES (15, '新生魔艺', '1.15.2', '魔法', 'https://github.com/baileyholl/Ars-Nouveau', '2022-06-20 20:17', 11, 'admin', '1');
INSERT INTO `game` VALUES (16, '植物魔法', '1.12.2', '魔法', 'https://botaniamod.net/index.html', '2022-06-20 20:18', 11, 'admin', '1');
INSERT INTO `game` VALUES (17, '千年村庄', '1.12.2', '冒险', 'https://gitlab.com/Millenaire/Public', '2022-06-20 20:19', 11, 'admin', '1');
INSERT INTO `game` VALUES (18, '蔚蓝浩空', '1.16.5', '冒险', 'https://www.mcbbs.net/thread-1240276-1-1.html', '2022-06-20 20:20', 11, 'admin', '1');
INSERT INTO `game` VALUES (19, '原神12', '1.12.2', '魔法', 'https://www.curseforge.com/minecraft/mc-mods/genshin-12', '2022-06-20 20:21', 11, 'admin', '1');
INSERT INTO `game` VALUES (20, '寄生虫', '1.12.2', '冒险', 'https://scape-and-run-parasites.fandom.com/wiki/Scape_and_Run:_Parasites_Wiki', '2022-06-20 20:22', 11, 'admin', '1');
INSERT INTO `game` VALUES (21, '拔刀剑', '1.12.2', '冒险', 'https://github.com/flammpfeil/SlashBlade', '2022-06-20 20:24', 11, 'admin', '1');
INSERT INTO `game` VALUES (22, 'Psi', '1.15.2', '魔法', 'https://psi.vazkii.net/index.php', '2022-06-20 20:25', 11, 'admin', '1');
INSERT INTO `game` VALUES (23, '镕金术', '1.16.5', '冒险', 'https://www.curseforge.com/minecraft/mc-mods/allomancy', '2022-06-20 20:26', 11, 'admin', '1');
INSERT INTO `game` VALUES (24, '狼人', '1.16.5', '冒险', 'https://www.curseforge.com/minecraft/mc-mods/werewolves-become-a-beast', '2022-06-20 20:27', 11, 'admin', '1');
INSERT INTO `game` VALUES (25, '自由之翼', '1.16.5', '冒险', 'https://link.mcmod.cn/target/aHR0cHM6Ly9kaXNjb3JkLmdnL1V2WHVXRW0=', '2022-06-20 20:31', 11, 'admin', '1');
INSERT INTO `game` VALUES (26, '天境', '1.12.2', '冒险', 'https://www.curseforge.com/minecraft/mc-mods/aether', '2022-06-20 20:32', 11, 'admin', '1');
INSERT INTO `game` VALUES (27, '世界树', '1.16.5', '冒险', 'https://www.curseforge.com/minecraft/mc-mods/yggdrasil', '2022-06-20 20:33', 11, 'admin', '1');
INSERT INTO `game` VALUES (45, '污秽魔法', '1.7.10', '魔法', 'https://www.mcbbs.net/thread-807351-1-1.html', '2022-06-24 14:57', 11, 'super', '1');
INSERT INTO `game` VALUES (46, '神秘土豆', '1.8.9', '魔法', 'https://www.curseforge.com/minecraft/mc-mods/thaumic-potatoes', '2022-06-24 14:58', 11, 'super', '1');
INSERT INTO `game` VALUES (47, '根源魔法', '1.9.4', '魔法', 'https://github.com/MysticMods/Roots', '2022-06-24 15:00', 11, 'super', '1');
INSERT INTO `game` VALUES (48, '图腾', '1.10.2', '魔法', 'https://www.curseforge.com/minecraft/mc-mods/totemic', '2022-06-24 15:01', 11, 'super', '1');
INSERT INTO `game` VALUES (49, '秘契占星术', '1.11.2', '魔法', 'https://www.curseforge.com/minecraft/mc-mods/mystic-divination', '2022-06-24 15:02', 11, 'super', '1');
INSERT INTO `game` VALUES (50, '禁忌与奥秘', '1.13.2', '魔法', 'https://github.com/stal111/Forbidden-Arcanus/wiki', '2022-06-24 15:03', 11, 'super', '1');
INSERT INTO `game` VALUES (51, '奥法工艺', '1.14.4', '魔法', 'https://www.curseforge.com/minecraft/mc-mods/arcanecraft', '2022-06-24 15:04', 11, 'super', '1');
INSERT INTO `game` VALUES (52, '奥法艺术', '1.15.2', '魔法', 'https://github.com/USTC-tuixue/Arcane-Art', '2022-06-24 15:04', 11, 'super', '1');
INSERT INTO `game` VALUES (53, '元素工艺', '1.17.1', '魔法', 'https://www.curseforge.com/minecraft/mc-mods/elemental-craft', '2022-06-24 15:05', 11, 'super', '1');
INSERT INTO `game` VALUES (54, '力量工艺', '1.18.2', '魔法', 'https://www.mcmod.cn/class/5005.html', '2022-06-24 15:05', 11, 'super', '1');
INSERT INTO `game` VALUES (55, '魔女的扫帚', '1.18.1', '魔法', 'https://www.mcbbs.net/thread-1182237-1-1.html', '2022-06-24 15:06', 11, 'super', '1');
INSERT INTO `game` VALUES (56, '魔法使', '1.19', '魔法', 'https://modrinth.com/mod/mahou-tsukai', '2022-06-24 15:07', 11, 'super', '1');
INSERT INTO `game` VALUES (57, '灵灾', '1.16.5', '魔法', 'https://discord.com/invite/x2GQ3Ew', '2022-06-24 15:08', 11, 'super', '1');
INSERT INTO `game` VALUES (58, '背包', '1.7.10', '实用', 'https://www.mcbbs.net/thread-423986-1-1.html', '2022-06-24 15:10', 11, 'super', '1');
INSERT INTO `game` VALUES (59, '村庄名字', '1.8.9', '实用', 'https://github.com/OverlordsIII/VillagerNames', '2022-06-24 15:11', 11, 'super', '1');
INSERT INTO `game` VALUES (60, '更多首饰', '1.9.4', '实用', 'https://www.curseforge.com/minecraft/mc-mods/baubles-stuff', '2022-06-24 15:12', 11, 'super', '1');

-- ----------------------------
-- Table structure for light
-- ----------------------------
DROP TABLE IF EXISTS `light`;
CREATE TABLE `light`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edition` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createid` int(11) NULL DEFAULT NULL,
  `createname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of light
-- ----------------------------
INSERT INTO `light` VALUES (4, 'Sildurs', '1.18.2', '中', 'https://sildurs-shaders.github.io/downloads/', '2022-06-20 20:40', 11, 'admin', '1');
INSERT INTO `light` VALUES (5, 'BSL', '版本通用', '低', 'https://www.curseforge.com/minecraft/customization/bsl-shaders/files', '2022-06-20 20:44', 11, 'admin', '1');
INSERT INTO `light` VALUES (6, 'Seus', '版本通用', '高', 'https://www.sonicether.com/seus/', '2022-06-20 21:09', 11, 'admin', '1');
INSERT INTO `light` VALUES (7, 'Graphics', '1.12.2', '中', 'https://umsoea.com/releases', '2022-06-20 21:13', 11, 'admin', '1');
INSERT INTO `light` VALUES (8, 'Complementary', '版本通用', '中', 'https://www.curseforge.com/minecraft/customization/complementary-shaders', '2022-06-24 15:59', 4, 'admin', '1');
INSERT INTO `light` VALUES (9, 'iterationT Next', '版本通用', '高', 'https://www.mcutc.com/resources/iterationt-2-0-0.163/', '2022-06-24 16:04', 4, 'admin', '1');
INSERT INTO `light` VALUES (10, 'SEUS Renewed', '版本通用', '高', 'https://www.sonicether.com/', '2022-06-24 16:06', 4, 'admin', '1');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createid` int(11) NULL DEFAULT NULL,
  `createname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (3, '反射材质包', '1.12.2', '32x', 'https://github.com/Poudingue/Vanilla-Normals-Renewed-1.12', '2022-06-20 20:36', 11, 'admin', '1');
INSERT INTO `material` VALUES (4, '星空材质包', '1.16.5', '32x', 'https://fireeaglefegaming.wixsite.com/myresourcepacks/realisticsky', '2022-06-20 20:37', 11, 'admin', '1');
INSERT INTO `material` VALUES (5, '高清材质包', '1.16.5', '128x', 'http://www.matteorizzo.com/', '2022-06-20 20:37', 11, 'admin', '1');
INSERT INTO `material` VALUES (6, 'Surreal 3D', '1.12.2', '128x', 'https://pan.baidu.com/s/1htA-uQ17NQPdQ2gDsuD7yg ', '2022-06-20 20:39', 11, 'admin', '1');
INSERT INTO `material` VALUES (7, '幻想重构', '1.16.5', '32x', 'https://www.curseforge.com/minecraft/texture-packs/minecraft-reimagined', '2022-06-20 20:41', 11, 'admin', '1');
INSERT INTO `material` VALUES (8, '秦', '1.12.2', '128x', 'https://www.mcbbs.net/thread-1139771-1-1.html', '2022-06-20 20:42', 11, 'admin', '1');
INSERT INTO `material` VALUES (9, 'Realism Mats', '1.15.2', '32x', 'https://www.patreon.com/RealismMats', '2022-06-20 20:48', 11, 'admin', '1');
INSERT INTO `material` VALUES (10, 'Milkyway Galaxy', '1.15.2', '64x', 'https://www.planetminecraft.com/texture-pack/milkyway-galaxy-night-sky/', '2022-06-20 20:56', 11, 'admin', '1');
INSERT INTO `material` VALUES (11, 'Dramatic Skys', '1.16.5', '16x', 'https://www.curseforge.com/minecraft/texture-packs/dramatic-skys/files', '2022-06-20 20:56', 11, 'admin', '1');
INSERT INTO `material` VALUES (12, 'Philza', '1.15.2', '32x', 'http://www.mediafire.com/file/tuxjgzhsz062adw/Ph1lzas_Netherite.zip/file', '2022-06-20 21:00', 11, 'admin', '1');
INSERT INTO `material` VALUES (13, '烦村', '1.15.2', '16x', 'https://former.lanzoul.com/iIcSo03kto4b', '2022-06-20 21:05', 11, 'admin', '1');
INSERT INTO `material` VALUES (14, 'CottonCandy', '1.15.2', '16x', 'https://wws.lanzoui.com/iej5Gv9go5a', '2022-06-20 21:16', 11, 'admin', '1');
INSERT INTO `material` VALUES (15, 'Scenical', '1.15.2', '128x', 'https://wwc.lanzouo.com/b02oq1nbi ', '2022-06-20 21:19', 11, 'admin', '1');
INSERT INTO `material` VALUES (16, 'PBR Tests', '1.14.4', '128x', 'https://drive.google.com/open?id=1d-qUUdMMzcMKShtMaeDoGqrH0jyhv2QR', '2022-06-24 15:30', 4, 'admin', '1');
INSERT INTO `material` VALUES (17, 'Default3D', '1.16.5', '16x', 'https://www.curseforge.com/minecraft/texture-packs/default-3d-16x', '2022-06-24 15:31', 4, 'admin', '1');
INSERT INTO `material` VALUES (18, 'Faithful32', '1.16.5', '32x', 'https://www.curseforge.com/minecraft/texture-packs/faithful-32x', '2022-06-24 15:32', 4, 'admin', '1');
INSERT INTO `material` VALUES (19, 'Realistico', '1.12.2', '32x', 'https://matteorizzo.com/realistico/', '2022-06-24 15:32', 4, 'admin', '1');
INSERT INTO `material` VALUES (20, 'Mes\'easons', '1.16.5', '32x', 'https://www.meseasonstexturepack.com/downloads', '2022-06-24 15:32', 4, 'admin', '1');
INSERT INTO `material` VALUES (21, 'BitBetter', '1.17.1', '64x', 'https://www.curseforge.com/minecraft/texture-packs/bitbetterx64', '2022-06-24 15:34', 4, 'admin', '1');
INSERT INTO `material` VALUES (22, 'Patrix', '1.17.1', '32x', 'https://minecrafthub.com/texture/patrix-resource-pack-1-17-1-1-17-lo-lag', '2022-06-24 15:36', 4, 'admin', '1');
INSERT INTO `material` VALUES (23, 'Napp', '1.16.5', '32x', 'https://minecrafthub.com/texture/napp-dell-cieno-pack-1-16-5', '2022-06-24 15:37', 4, 'admin', '1');
INSERT INTO `material` VALUES (24, 'URBAN', '1.17.1', '32x', 'https://minecrafthub.com/texture/urban-texture-pack-1-17-1-16-5', '2022-06-24 15:37', 4, 'admin', '1');
INSERT INTO `material` VALUES (25, 'Hodilton', '1.17.1', '64x', 'https://minecrafthub.com/texture/hodilton-texture-pack-1-16-5-download', '2022-06-24 15:37', 4, 'admin', '1');
INSERT INTO `material` VALUES (26, 'AVPBR', '1.17.1', '32x', 'https://minecrafthub.com/texture/avpbr-resource-pack-1-17-1-1-16-5-no-lag', '2022-06-24 15:38', 4, 'admin', '1');
INSERT INTO `material` VALUES (27, 'F8thful', '1.18.1', '16x', 'https://texture-packs.com/shader-minecraft/', '2022-06-24 15:43', 4, 'admin', '1');
INSERT INTO `material` VALUES (28, 'Clarity', '1.16.5', '32x', 'https://www.curseforge.com/minecraft/texture-packs/clarity', '2022-06-24 15:46', 4, 'admin', '1');
INSERT INTO `material` VALUES (29, 'lithos', '1.18.1', '16x', 'https://www.curseforge.com/minecraft/texture-packs/lithos-core-32x-1-6-1-11-complete', '2022-06-24 15:46', 4, 'admin', '1');
INSERT INTO `material` VALUES (30, 'Kornelic', '1.8.9', '16x', 'https://www.youtube.com/watch?v=MWurhmg9e_A', '2022-06-24 15:47', 4, 'admin', '1');
INSERT INTO `material` VALUES (31, 'Groovy', '1.16.5', '16x', 'https://www.mcbbs.net/thread-1133350-1-1.html', '2022-06-24 15:49', 4, 'admin', '1');
INSERT INTO `material` VALUES (32, 'ChordMagic', '1.12.2', '128x', 'https://www.mcbbs.net/thread-699695-1-1.html', '2022-06-24 15:50', 4, 'admin', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '账号',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电话',
  `auth` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户类型;0管理员；1普通用户',
  `password` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'admin', '18812341234', '0', '123456');
INSERT INTO `user` VALUES (7, 'xch', '13780195651', '1', '123456');
INSERT INTO `user` VALUES (8, 'zhangsan', '13055671034', '1', '123456');
INSERT INTO `user` VALUES (9, 'lisi', '18067435258', '1', '123456');
INSERT INTO `user` VALUES (10, 'wangwu', '13706485664', '1', '123456');
INSERT INTO `user` VALUES (11, 'super', '13052727852', '0', '123456');
INSERT INTO `user` VALUES (17, '356356', '356356', '1', '3563563');

SET FOREIGN_KEY_CHECKS = 1;
