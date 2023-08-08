/*
 Navicat Premium Data Transfer

 Source Server         : 124
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 124.222.66.151:3306
 Source Schema         : like

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 08/08/2023 16:11:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '类目ID',
  `aid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `uid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 10 COMMENT '文件类型: [10=图片, 20=视频]',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名称',
  `uri` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件路径',
  `ext` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件扩展',
  `size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `is_delete` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cid`(`cid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of album
-- ----------------------------

-- ----------------------------
-- Table structure for album_cate
-- ----------------------------
DROP TABLE IF EXISTS `album_cate`;
CREATE TABLE `album_cate`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '父级ID',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 10 COMMENT '类型: [10=图片, 20=视频]',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: [0=否, 1=是]',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '相册分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of album_cate
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cid` int UNSIGNED NOT NULL COMMENT '分类',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `intro` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `summary` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '摘要',
  `image` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `author` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `visit` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览',
  `sort` int UNSIGNED NOT NULL DEFAULT 50 COMMENT '排序',
  `is_show` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否显示: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid_idx`(`cid` ASC) USING BTREE COMMENT '分类索引'
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章资讯表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, '让生活更精致！五款居家好物推荐，实用性超高', '##好物推荐🔥', '随着当代生活节奏的忙碌，很多人在闲暇之余都想好好的享受生活。随着科技的发展，也出现了越来越多可以帮助我们提升幸福感，让生活变得更精致的产品，下面周周就给大家盘点五款居家必备的好物，都是实用性很高的产品，周周可以保证大家买了肯定会喜欢。', '/api/static/article01.png', '<p><img src=\"https://likeadmin-java.yixiangonline.com/api/uploads/image/20220916/46d29489-4260-4917-8eca-d0f6cba6af23.png\" alt=\"\" data-href=\"\" style=\"\"/></p><p>拥有一台投影仪，闲暇时可以在家里直接看影院级别的大片，光是想想都觉得超级爽。市面上很多投影仪大几千，其实周周觉得没必要，选泰捷这款一千多的足够了，性价比非常高。</p><p>泰捷的专业度很高，在电视TV领域研发已经十年，有诸多专利和技术创新，荣获国内外多项技术奖项，拿下了腾讯创新工场投资，打造的泰捷视频TV端和泰捷电视盒子都获得了极高评价。</p><p>这款投影仪的分辨率在3000元内无敌，做到了真1080P高分辨率，也就是跟市场售价三千DLP投影仪一样的分辨率，真正做到了分毫毕现，像桌布的花纹、天空的云彩等，这些细节都清晰可见。</p><p>亮度方面，泰捷达到了850ANSI流明，同价位一般是200ANSI。这是因为泰捷为了提升亮度和LCD技术透射率低的问题，首创高功率LED灯源，让其亮度做到同价位最好。专业媒体也进行了多次对比，效果与3000元价位投影仪相当。</p><p>操作系统周周也很喜欢，完全不卡。泰捷作为资深音视频品牌，在系统优化方面有十年的研发经验，打造出的“零极”系统是业内公认效率最高、速度最快的系统，用户也评价它流畅度能一台顶三台，而且为了解决行业广告多这一痛点，系统内不植入任何广告。</p>', '红花', 9, 0, 1, 0, 1663317759, 1663322726, 0);
INSERT INTO `article` VALUES (2, 1, '埋葬UI设计师的坟墓不是内卷，而是免费模式', '', '本文从另外一个角度，聊聊作者对UI设计师职业发展前景的担忧，欢迎从事UI设计的同学来参与讨论，会有赠书哦', '/api/static/article02.jpeg', '<p><br></p><p style=\"text-align: justify;\">一个职业，卷，根本就没什么大不了的，尤其是成熟且收入高的职业，不卷才不符合事物发展的规律。何况 UI 设计师的人力市场到今天也和 5 年前一样，还是停留在大型菜鸡互啄的场面。远不能和医疗、证券、教师或者演艺练习生相提并论。</p><p style=\"text-align: justify;\">真正会让我对 <a href=\"https://www.uisdc.com/tag/ui\" target=\"_blank\">UI</a> 设计师发展前景觉得悲观的事情就只有一件 —— 国内的互联网产品免费机制。这也是一个我一直以来想讨论的话题，就在这次写一写。</p><p style=\"text-align: justify;\">国内互联网市场的发展，是一部浩瀚的 “免费经济” 发展史。虽然今天免费已经是深入国内民众骨髓的认知，但最早的中文互联网也是需要付费的，网游也都是要花钱的。</p><p style=\"text-align: justify;\">只是自有国情在此，付费确实阻碍了互联网行业的扩张和普及，一批创业家就开始通过免费的模式为用户提供服务，从而扩大了自己的产品覆盖面和普及程度。</p><p style=\"text-align: justify;\">印象最深的就是免费急先锋周鸿祎，和现在鲜少出现在公众视野不同，一零年前他是当之无愧的互联网教主，因为他开发出了符合中国国情的互联网产品 “打法”，让 360 的发展如日中天。</p><p style=\"text-align: justify;\">就是他在自传中提到：</p><p style=\"text-align: justify;\">只要是在互联网上每个人都需要的服务，我们就认为它是基础服务，基础服务一定是免费的，这样的话不会形成价值歧视。就是说，只要这种服务是每个人都一定要用的，我一定免费提供，而且是无条件免费。增值服务不是所有人都需要的，这个比例可能会相当低，它只是百分之几甚至更少比例的人需要，所以这种服务一定要收费……</p><p style=\"text-align: justify;\">这就是互联网的游戏规则，它决定了要想建立一个有效的商业模式，就一定要有海量的用户基数……</p>', '一一', 23, 0, 1, 0, 1663320938, 1663322854, 0);
INSERT INTO `article` VALUES (3, 2, '金山电池公布“沪广深市民绿色生活方式”调查结果', '', '60%以上受访者认为高质量的10分钟足以完成“自我充电”', '/api/static/article03.png', '<p style=\"text-align: left;\"><strong>深圳，2021年10月22日）</strong>生活在一线城市的沪广深市民一向以效率见称，工作繁忙和快节奏的生活容易缺乏充足的休息。近日，一项针对沪广深市民绿色生活方式而展开的网络问卷调查引起了大家的注意。问卷的问题设定集中于市民对休息时间的看法，以及从对循环充电电池的使用方面了解其对绿色生活方式的态度。该调查采用随机抽样的模式，并对最终收集的1,500份有效问卷进行专业分析后发现，超过60%的受访者表示，在每天的工作时段能拥有10分钟高质量的休息时间，就可以高效“自我充电”。该调查结果反映出，在快节奏时代下，人们需要高质量的休息时间，也要学会利用高效率的休息方式和工具来应对快节奏的生活，以时刻保持“满电”状态。</p><p style=\"text-align: left;\">　　<strong>60%以上受访者认为高质量的10分钟足以完成“自我充电”</strong></p><p style=\"text-align: left;\">　　这次调查超过1,500人，主要聚焦18至85岁的沪广深市民，了解他们对于休息时间的观念及使用充电电池的习惯，结果发现：</p><p style=\"text-align: left;\">　　· 90%以上有工作受访者每天工作时间在7小时以上，平均工作时间为8小时，其中43%以上的受访者工作时间超过9小时</p><p style=\"text-align: left;\">　　· 70%受访者认为在工作期间拥有10分钟“自我充电”时间不是一件困难的事情</p><p style=\"text-align: left;\">　　· 60%受访者认为在工作期间有10分钟休息时间足以为自己快速充电</p><p style=\"text-align: left;\">　　临床心理学家黄咏诗女士在发布会上分享为自己快速充电的实用技巧，她表示：“事实上，只要选择正确的休息方法，10分钟也足以为自己充电。以喝咖啡为例，我们可以使用心灵休息法 ── 静观呼吸，慢慢感受咖啡的温度和气味，如果能配合着聆听流水或海洋的声音，能够有效放松大脑及心灵。”</p><p style=\"text-align: left;\">　　这次调查结果反映出沪广深市民的希望在繁忙的工作中适时停下来，抽出10分钟喝杯咖啡、聆听音乐或小睡片刻，为自己充电。金山电池全新推出的“绿再十分充”超快速充电器仅需10分钟就能充好电，喝一杯咖啡的时间既能完成“自我充电”，也满足设备使用的用电需求，为提升工作效率和放松身心注入新能量。</p><p style=\"text-align: left;\">　　<strong>金山电池推出10分钟超快电池充电器*绿再十分充，以创新科技为市场带来革新体验</strong></p><p style=\"text-align: left;\">　　该问卷同时从沪广深市民对循环充电电池的使用方面进行了调查，以了解其对绿色生活方式的态度：</p><p style=\"text-align: left;\">　　· 87%受访者目前没有使用充电电池，其中61%表示会考虑使用充电电池</p><p style=\"text-align: left;\">　　· 58%受访者过往曾使用过充电电池，却只有20%左右市民仍在使用</p><p style=\"text-align: left;\">　　· 60%左右受访者认为充电电池尚未被广泛使用，主要障碍来自于充电时间过长、缺乏相关教育</p><p style=\"text-align: left;\">　　· 90%以上受访者认为充电电池充满电需要1小时或更长的时间</p><p style=\"text-align: left;\">　　金山电池一直致力于为大众提供安全可靠的充电电池，并与消费者的需求和生活方式一起演变及进步。今天，金山电池宣布推出10分钟超快电池充电器*绿再十分充，只需10分钟*即可将4粒绿再十分充充电电池充好电，充电速度比其他品牌提升3倍**。充电器的LED灯可以显示每粒电池的充电状态和模式，并提示用户是否错误插入已损坏电池或一次性电池。尽管其体型小巧，却具备多项创新科技 ，如拥有独特的充电算法以优化充电电流，并能根据各个电池类型、状况和温度用最短的时间为充电电池充好电;绿再十分充内置横流扇，有效防止电池温度过热和提供低噪音的充电环境等。<br></p>', '中网资讯科技', 3, 0, 1, 0, 1663322665, 1663322665, 0);

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 50 COMMENT '排序',
  `is_show` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_category
-- ----------------------------
INSERT INTO `article_category` VALUES (1, '文章资讯', 0, 1, 0, 1663317280, 1663317282, 0);
INSERT INTO `article_category` VALUES (2, '社会热点', 0, 1, 0, 1663321464, 1663321494, 0);

-- ----------------------------
-- Table structure for article_collect
-- ----------------------------
DROP TABLE IF EXISTS `article_collect`;
CREATE TABLE `article_collect`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `article_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章ID',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章收藏表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_collect
-- ----------------------------

-- ----------------------------
-- Table structure for crontab
-- ----------------------------
DROP TABLE IF EXISTS `crontab`;
CREATE TABLE `crontab`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `types` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务分组',
  `command` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务命令',
  `rules` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务贵州',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 2 COMMENT '执行状态: 1=正在运行, 2=任务停止, 3=发生错误',
  `strategy` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行策略: 1=立即执行, 2=执行一次, 3=放弃执行',
  `concurrent` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '并发执行: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `start_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `task_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务耗时',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '计划任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of crontab
-- ----------------------------
INSERT INTO `crontab` VALUES (1, '有参数任务', 'default', 'myJob.handle(\"参数\")', '* * * * * ?', '', '', 2, 1, 0, 0, 1670377612, 1670377612, 0, 1669970830, 1670289651, 0);

-- ----------------------------
-- Table structure for decorate_page
-- ----------------------------
DROP TABLE IF EXISTS `decorate_page`;
CREATE TABLE `decorate_page`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `page_type` tinyint UNSIGNED NOT NULL DEFAULT 10 COMMENT '页面类型',
  `page_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '页面名称',
  `page_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '页面数据',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '页面装修表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of decorate_page
-- ----------------------------
INSERT INTO `decorate_page` VALUES (1, 1, '商城首页', '[{\"title\":\"搜索\",\"name\":\"search\",\"disabled\":1,\"content\":{},\"styles\":{}},{\"title\":\"首页轮播图\",\"name\":\"banner\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/api/static/banner01.png\",\"name\":\"\",\"link\":{\"path\":\"/pages/index/index\",\"name\":\"商城首页\",\"type\":\"shop\"}},{\"image\":\"/api/static/banner02.png\",\"name\":\"\",\"link\":{}}]},\"styles\":{}},{\"title\":\"导航菜单\",\"name\":\"nav\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/api/static/nav01.png\",\"name\":\"资讯中心\",\"link\":{\"path\":\"/pages/news/news\",\"name\":\"文章资讯\",\"type\":\"shop\"}},{\"image\":\"/api/static/nav02.png\",\"name\":\"我的收藏\",\"link\":{\"path\":\"/pages/collection/collection\",\"name\":\"我的收藏\",\"type\":\"shop\"}},{\"image\":\"/api/static/nav03.png\",\"name\":\"个人设置\",\"link\":{\"path\":\"/pages/user_set/user_set\",\"name\":\"个人设置\",\"type\":\"shop\"}},{\"image\":\"/api/static/nav04.png\",\"name\":\"联系客服\",\"link\":{\"path\":\"/pages/customer_service/customer_service\",\"name\":\"联系客服\",\"type\":\"shop\"}},{\"image\":\"/api/static/nav05.png\",\"name\":\"关于我们\",\"link\":{\"path\":\"/pages/as_us/as_us\",\"name\":\"关于我们\",\"type\":\"shop\"}}]},\"styles\":{}},{\"id\":\"l84almsk2uhyf\",\"title\":\"资讯\",\"name\":\"news\",\"disabled\":1,\"content\":{},\"styles\":{}}]', 1661757188, 1663321380);
INSERT INTO `decorate_page` VALUES (2, 2, '个人中心', '[{\"title\":\"用户信息\",\"name\":\"user-info\",\"disabled\":1,\"content\":{},\"styles\":{}},{\"title\":\"我的服务\",\"name\":\"my-service\",\"content\":{\"style\":2,\"title\":\"服务中心\",\"data\":[{\"image\":\"/api/static/user_collect.png\",\"name\":\"我的收藏\",\"link\":{\"path\":\"/pages/collection/collection\",\"name\":\"我的收藏\",\"type\":\"shop\"}},{\"image\":\"/api/static/user_setting.png\",\"name\":\"个人设置\",\"link\":{\"path\":\"/pages/user_set/user_set\",\"name\":\"个人设置\",\"type\":\"shop\"}},{\"image\":\"/api/static/user_kefu.png\",\"name\":\"联系客服\",\"link\":{\"path\":\"/pages/customer_service/customer_service\",\"name\":\"联系客服\",\"type\":\"shop\"}},{\"image\":\"/api/static/user_money.png\",\"name\":\"我的钱包\",\"link\":{\"path\":\"/packages/pages/user_wallet/user_wallet\",\"name\":\"我的钱包\",\"type\":\"shop\"}}]},\"styles\":{}},{\"title\":\"个人中心广告图\",\"name\":\"user-banner\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/api/static/ad01.jpg\",\"name\":\"\",\"link\":{}}]},\"styles\":{}}]', 1661757188, 1680513327);
INSERT INTO `decorate_page` VALUES (3, 3, '客服设置', '[{\"title\":\"客服设置\",\"name\":\"customer-service\",\"content\":{\"title\":\"添加客服二维码\",\"time\":\"早上 9:00 - 22:00\",\"mobile\":\"13800138000\",\"qrcode\":\"\"},\"styles\":{}}]', 1661757188, 1662689155);
INSERT INTO `decorate_page` VALUES (4, 4, 'PC首页装修', '[{\"id\":\"lajcn8d0hzhed\",\"title\":\"首页轮播图\",\"name\":\"banner\",\"content\":{\"enabled\":1,\"data\":[{\"image\":\"/api/static/banner01.png\",\"name\":\"\",\"link\":{}}]},\"styles\":{\"position\":\"absolute\",\"left\":\"42px\",\"top\":\"27px\",\"width\":\"234px\",\"height\":\"114px\"}}]', 1662689155, 1673251983);

-- ----------------------------
-- Table structure for decorate_tabbar
-- ----------------------------
DROP TABLE IF EXISTS `decorate_tabbar`;
CREATE TABLE `decorate_tabbar`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '导航名称',
  `selected` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '未选图标',
  `unselected` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '已选图标',
  `link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接地址',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '底部装修表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of decorate_tabbar
-- ----------------------------
INSERT INTO `decorate_tabbar` VALUES (13, '首页', '/api/static/tabbar_home_sel.png', '/api/static/tabbar_home.png', '{\"path\":\"/pages/index/index\",\"name\":\"商城首页\",\"type\":\"shop\"}', 1662688157, 1662688157);
INSERT INTO `decorate_tabbar` VALUES (14, '资讯', '/api/static/tabbar_text_sel.png', '/api/static/tabbar_text.png', '{\"path\":\"/pages/news/news\",\"name\":\"文章资讯\",\"type\":\"shop\"}', 1662688157, 1662688157);
INSERT INTO `decorate_tabbar` VALUES (15, '我的', '/api/static/tabbar_me_sel.png', '/api/static/tabbar_me.png', '{\"path\":\"/pages/user/user\",\"name\":\"个人中心\",\"type\":\"shop\"}', 1662688157, 1662688157);

-- ----------------------------
-- Table structure for dev_pay_config
-- ----------------------------
DROP TABLE IF EXISTS `dev_pay_config`;
CREATE TABLE `dev_pay_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模版名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '渠道图标',
  `way` tinyint(1) NOT NULL COMMENT '支付方式: [1=余额支付, 2=微信支付, 3=支付宝支付]',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序编号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '配置参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dev_pay_config
-- ----------------------------
INSERT INTO `dev_pay_config` VALUES (1, '余额支付', '/api/static/balance_pay.png', 1, 0, '余额支付', '{}');
INSERT INTO `dev_pay_config` VALUES (2, '微信支付', '/api/static/wechat_pay.png', 2, 0, '微信支付', '{}');

-- ----------------------------
-- Table structure for dev_pay_way
-- ----------------------------
DROP TABLE IF EXISTS `dev_pay_way`;
CREATE TABLE `dev_pay_way`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `pay_config_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付配置ID',
  `scene` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '场景编码: [1=微信小程序, 2=微信公众号, 3=H5, 4=PC, 5=APP]',
  `is_default` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '默认支付: [0=否的, 1=是的]',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '方式状态: [0=关闭, 1=开启]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付方式表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dev_pay_way
-- ----------------------------
INSERT INTO `dev_pay_way` VALUES (1, 1, 1, 0, 1);
INSERT INTO `dev_pay_way` VALUES (2, 2, 1, 1, 1);
INSERT INTO `dev_pay_way` VALUES (3, 1, 2, 0, 1);
INSERT INTO `dev_pay_way` VALUES (4, 2, 2, 1, 1);
INSERT INTO `dev_pay_way` VALUES (5, 1, 3, 0, 1);
INSERT INTO `dev_pay_way` VALUES (6, 2, 3, 1, 1);

-- ----------------------------
-- Table structure for dict_data
-- ----------------------------
DROP TABLE IF EXISTS `dict_data`;
CREATE TABLE `dict_data`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键名',
  `value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数值',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL COMMENT '状态: 0=停用, 1=正常',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict_data
-- ----------------------------

-- ----------------------------
-- Table structure for dict_type
-- ----------------------------
DROP TABLE IF EXISTS `dict_type`;
CREATE TABLE `dict_type`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `dict_remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典备注',
  `dict_status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '字典状态: 0=停用, 1=正常',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict_type
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联表名称',
  `sub_table_fk` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联表外键',
  `sub_table_fr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联表主键',
  `author_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者的名称',
  `entity_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '实体的名称',
  `module_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '生成模块名',
  `function_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '生成功能名',
  `tree_primary` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '树主键字段',
  `tree_parent` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '树父级字段',
  `tree_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '树显示字段',
  `gen_tpl` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'crud' COMMENT '生成模板方式: [crud=单表, tree=树表]',
  `gen_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '生成代码方式: [0=zip压缩包, 1=自定义路径]',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/' COMMENT '生成代码路径: [不填默认项目路径]',
  `menu_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单状态: [1=自动构建, 2=手动添加]',
  `menu_pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单父级',
  `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '列主键',
  `table_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '表外键',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '列名称',
  `column_comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '列描述',
  `column_length` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '列长度',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '列类型 ',
  `java_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'JAVA类型',
  `java_field` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'JAVA字段',
  `is_pk` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否主键: [1=是, 0=否]',
  `is_increment` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否自增: [1=是, 0=否]',
  `is_required` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否必填: [1=是, 0=否]',
  `is_insert` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否插入字段: [1=是, 0=否]',
  `is_edit` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否编辑字段: [1=是, 0=否]',
  `is_list` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否列表字段: [1=是, 0=否]',
  `is_query` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否查询字段: [1=是, 0=否]',
  `query_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'EQ' COMMENT '查询方式: [等于、不等于、大于、小于、范围]',
  `html_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '显示类型: [文本框、文本域、下拉框、复选框、单选框、日期控件]',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '字典类型',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序编号',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成字段表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for hot_search
-- ----------------------------
DROP TABLE IF EXISTS `hot_search`;
CREATE TABLE `hot_search`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '热门搜索配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hot_search
-- ----------------------------

-- ----------------------------
-- Table structure for log_money
-- ----------------------------
DROP TABLE IF EXISTS `log_money`;
CREATE TABLE `log_money`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '流水号',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `source_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联ID',
  `source_sn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关联单号',
  `change_type` smallint UNSIGNED NOT NULL COMMENT '变动类型',
  `change_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '变动的数量',
  `left_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变动后数量',
  `action` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '变动的动作: 1=增加, 2=减少',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '预留字段',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账户变动日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log_money
-- ----------------------------

-- ----------------------------
-- Table structure for notice_record
-- ----------------------------
DROP TABLE IF EXISTS `notice_record`;
CREATE TABLE `notice_record`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `scene` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '通知场景',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '接收用户',
  `account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '接收账号',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '通知标题',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '验证编码',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '通知内容',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '失败原因',
  `sender` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '发送类型: [1=系统, 2=短信, 3=公众号, 4=小程序]',
  `receiver` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '接收对象: [1=用户, 2=平台]',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '通知状态: [0=等待, 1=成功, 2=失败]',
  `is_read` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '已读状态: [0=未读, 1=已读]',
  `is_captcha` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是验证码: [0=否的, 1=是的]',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: [0=否的, 1=是的]',
  `expire_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '失效时间',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息通知记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice_record
-- ----------------------------

-- ----------------------------
-- Table structure for notice_setting
-- ----------------------------
DROP TABLE IF EXISTS `notice_setting`;
CREATE TABLE `notice_setting`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `scene` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '场景编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '场景名称',
  `remarks` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '场景描述',
  `recipient` tinyint(1) NOT NULL DEFAULT 1 COMMENT '接收人员: [1=用户, 2=平台]',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '通知类型: [1=业务, 2=验证]',
  `system_notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '系统的通知设置',
  `sms_notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '短信的通知设置',
  `oa_notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公众号通知设置',
  `mnp_notice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '小程序通知设置',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息通知设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice_setting
-- ----------------------------
INSERT INTO `notice_setting` VALUES (1, 101, '登录验证码', '用户手机号码登录时发送', 1, 2, '{}', '{\"type\":\"sms\",\"templateId\":\"SMS_222458159\",\"content\":\"您正在登录，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"tips\":[\"可选变量 验证码:code\",\"示例：您正在登录，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"生效条件：1、管理后台完成短信设置。2、第三方短信平台申请模板。\"],\"status\":\"1\"}', '{}', '{}', 0, 1648696695, 1648696695, 0);
INSERT INTO `notice_setting` VALUES (2, 102, '绑定手机验证码', '用户绑定手机号码时发送', 1, 2, '{}', '{\"type\":\"sms\",\"templateId\":\"SMS_175615069\",\"content\":\"您正在绑定手机号，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"tips\":[\"可选变量 验证码:code\",\"示例：您正在绑定手机号，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"生效条件：1、管理后台完成短信设置。2、第三方短信平台申请模板。\"],\"status\":\"1\"}', '{}', '{}', 0, 1648696695, 1648696695, 0);
INSERT INTO `notice_setting` VALUES (3, 103, '变更手机验证码', '用户变更手机号码时发送', 1, 2, '{}', '{\"type\":\"sms\",\"templateId\":\"SMS_207952628\",\"content\":\"您正在变更手机号，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"tips\":[\"可选变量 验证码:code\",\"示例：您正在变更手机号，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"生效条件：1、管理后台完成短信设置。2、第三方短信平台申请模板。\"],\"status\":\"1\"}', '{}', '{}', 0, 1648696695, 1648696695, 0);
INSERT INTO `notice_setting` VALUES (4, 104, '找回登录密码验证码', '用户找回登录密码号码时发送', 1, 2, '{}', '{\"type\":\"sms\",\"templateId\":\"SMS_175615069\",\"content\":\"您正在找回登录密码，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"tips\":[\"可选变量 验证码:code\",\"示例：您正在找回登录密码，验证码${code}，切勿将验证码泄露于他人，本条验证码有效期5分钟。\",\"条验证码有效期5分钟。\"],\"status\":\"1\"}', '{}', '{}', 0, 1648696695, 1648696695, 0);

-- ----------------------------
-- Table structure for official_reply
-- ----------------------------
DROP TABLE IF EXISTS `official_reply`;
CREATE TABLE `official_reply`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名',
  `keyword` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键词',
  `reply_type` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复类型: [1=关注回复 2=关键字回复, 3=默认回复]',
  `matching_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '匹配方式: [1=全匹配, 2=模糊匹配]',
  `content_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '内容类型: [1=文本]',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '启动状态: [1=启动, 0=关闭]',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复内容',
  `sort` int UNSIGNED NOT NULL DEFAULT 50 COMMENT '排序编号',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` int UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公众号的回复表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of official_reply
-- ----------------------------

-- ----------------------------
-- Table structure for recharge_order
-- ----------------------------
DROP TABLE IF EXISTS `recharge_order`;
CREATE TABLE `recharge_order`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `pay_sn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '支付编号',
  `pay_way` tinyint UNSIGNED NOT NULL DEFAULT 2 COMMENT '支付方式: [2=微信支付, 3=支付宝支付]',
  `pay_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付状态: [0=待支付, 1=已支付]',
  `pay_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付时间',
  `order_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '充值金额',
  `order_terminal` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '下单终端',
  `transaction_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '交易流水',
  `refund_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '退款状态: [0=未退款 , 1=已退款]',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '充值余额订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of recharge_order
-- ----------------------------

-- ----------------------------
-- Table structure for refund_log
-- ----------------------------
DROP TABLE IF EXISTS `refund_log`;
CREATE TABLE `refund_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号',
  `record_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '退款记录ID',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联用户ID',
  `handle_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '处理管理ID',
  `order_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总应付的金额',
  `refund_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '本次退款金额',
  `refund_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '退款状态: [0=退款中, 1=退款成功, 2=退款失败]',
  `refund_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '退款信息',
  `create_time` int UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退款日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of refund_log
-- ----------------------------

-- ----------------------------
-- Table structure for refund_record
-- ----------------------------
DROP TABLE IF EXISTS `refund_record`;
CREATE TABLE `refund_record`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '退款编号',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联用户ID',
  `order_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '来源订单ID',
  `order_sn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '来源单号SN',
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'order' COMMENT '订单类型: [order=商品订单, recharge=充值订单]',
  `order_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '总应付款金额',
  `refund_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '本次退款金额',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '平台交易流水号',
  `refund_way` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '退款方式: 1=线上退款, 2=线下退款',
  `refund_type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '退款类型: 1=后台退款',
  `refund_status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '退款状态: 0=退款中, 1=退款成功, 2=退款失败',
  `create_time` int UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退款记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of refund_record
-- ----------------------------

-- ----------------------------
-- Table structure for system_auth_admin
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_admin`;
CREATE TABLE `system_auth_admin`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色主键',
  `dept_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门ID',
  `post_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '岗位ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '加密盐巴',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序编号',
  `is_multipoint` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '多端登录: 0=否, 1=是',
  `is_disable` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否禁用: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `last_login_ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最后登录',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统管理成员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_auth_admin
-- ----------------------------
INSERT INTO `system_auth_admin` VALUES (1, '0', '1', '', 'zss98', '张大帅', '3073600c494a1cdc6e2bb747ff17beb7', '/api/static/backend_avatar.png', 'lCeYf', 0, 1, 0, 0, '127.0.0.1', 1691481043, 1642321599, 1691481037, 0);

-- ----------------------------
-- Table structure for system_auth_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_dept`;
CREATE TABLE `system_auth_dept`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `duty` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '负责人名',
  `mobile` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序编号',
  `is_stop` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否禁用: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统部门管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_auth_dept
-- ----------------------------
INSERT INTO `system_auth_dept` VALUES (1, 0, '默认部门', 'LikeAdmin', '18327647788', 10, 0, 0, 1649841995, 1660190949, 0);

-- ----------------------------
-- Table structure for system_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_menu`;
CREATE TABLE `system_auth_menu`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级菜单',
  `menu_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限类型: M=目录，C=菜单，A=按钮',
  `menu_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `menu_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `menu_sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单排序',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '权限标识',
  `paths` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '前端组件',
  `selected` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '选中路径',
  `params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由参数',
  `is_cache` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否缓存: 0=否, 1=是',
  `is_show` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否显示: 0=否, 1=是',
  `is_disable` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否禁用: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 804 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_auth_menu
-- ----------------------------
INSERT INTO `system_auth_menu` VALUES (1, 0, 'C', '工作台', 'el-icon-Monitor', 50, 'index:console', 'workbench', 'workbench/index', '', '', 1, 1, 0, 1650341765, 1668672757);
INSERT INTO `system_auth_menu` VALUES (100, 0, 'M', '权限管理', 'el-icon-Lock', 44, '', 'permission', '', '', '', 0, 1, 0, 1650341765, 1662626201);
INSERT INTO `system_auth_menu` VALUES (101, 100, 'C', '管理员', 'local-icon-wode', 0, 'system:admin:list', 'admin', 'permission/admin/index', '', '', 1, 1, 0, 1650341765, 1663301404);
INSERT INTO `system_auth_menu` VALUES (102, 101, 'A', '管理员详情', '', 0, 'system:admin:detail', '', '', '', '', 0, 1, 0, 1650341765, 1660201785);
INSERT INTO `system_auth_menu` VALUES (103, 101, 'A', '管理员新增', '', 0, 'system:admin:add', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (104, 101, 'A', '管理员编辑', '', 0, 'system:admin:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (105, 101, 'A', '管理员删除', '', 0, 'system:admin:del', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (106, 101, 'A', '管理员状态', '', 0, 'system:admin:disable', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (110, 100, 'C', '角色管理', 'el-icon-Female', 0, 'system:role:list', 'role', 'permission/role/index', '', '', 1, 1, 0, 1650341765, 1663301451);
INSERT INTO `system_auth_menu` VALUES (111, 110, 'A', '角色详情', '', 0, 'system:role:detail', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (112, 110, 'A', '角色新增', '', 0, 'system:role:add', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (113, 110, 'A', '角色编辑', '', 0, 'system:role:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (114, 110, 'A', '角色删除', '', 0, 'system:role:del', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (120, 100, 'C', '菜单管理', 'el-icon-Operation', 0, 'system:menu:list', 'menu', 'permission/menu/index', '', '', 1, 1, 0, 1650341765, 1680340798);
INSERT INTO `system_auth_menu` VALUES (121, 120, 'A', '菜单详情', '', 0, 'system:menu:detail', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (122, 120, 'A', '菜单新增', '', 0, 'system:menu:add', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (123, 120, 'A', '菜单编辑', '', 0, 'system:menu:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (124, 120, 'A', '菜单删除', '', 0, 'system:menu:del', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (130, 0, 'M', '组织管理', 'el-icon-OfficeBuilding', 45, '', 'organization', '', '', '', 0, 1, 0, 1650341765, 1664416715);
INSERT INTO `system_auth_menu` VALUES (131, 130, 'C', '部门管理', 'el-icon-Coordinate', 0, 'system:dept:list', 'department', 'organization/department/index', '', '', 1, 1, 0, 1650341765, 1660201994);
INSERT INTO `system_auth_menu` VALUES (132, 131, 'A', '部门详情', '', 0, 'system:dept:detail', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (133, 131, 'A', '部门新增', '', 0, 'system:dept:add', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (134, 131, 'A', '部门编辑', '', 0, 'system:dept:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (135, 131, 'A', '部门删除', '', 0, 'system:dept:del', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (140, 130, 'C', '岗位管理', 'el-icon-PriceTag', 0, 'system:post:list', 'post', 'organization/post/index', '', '', 1, 1, 0, 1650341765, 1660202057);
INSERT INTO `system_auth_menu` VALUES (141, 140, 'A', '岗位详情', '', 0, 'system:post:detail', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (142, 140, 'A', '岗位新增', '', 0, 'system:post:add', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (143, 140, 'A', '岗位编辑', '', 0, 'system:post:edit', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (144, 140, 'A', '岗位删除', '', 0, 'system:post:del', '', '', '', '', 0, 1, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (200, 0, 'M', '其它管理', '', 0, '', '', '', '', '', 0, 0, 0, 1650341765, 1660636870);
INSERT INTO `system_auth_menu` VALUES (201, 200, 'M', '图库管理', '', 0, '', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (202, 201, 'A', '文件列表', '', 0, 'albums:albumList', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (203, 201, 'A', '文件命名', '', 0, 'albums:albumRename', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (204, 201, 'A', '文件移动', '', 0, 'albums:albumMove', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (205, 201, 'A', '文件删除', '', 0, 'albums:albumDel', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (206, 201, 'A', '分类列表', '', 0, 'albums:cateList', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (207, 201, 'A', '分类新增', '', 0, 'albums:cateAdd', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (208, 201, 'A', '分类命名', '', 0, 'albums:cateRename', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (209, 201, 'A', '分类删除', '', 0, 'albums:cateDel', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (215, 200, 'M', '上传管理', '', 0, '', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (216, 215, 'A', '上传图片', '', 0, 'upload:image', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (217, 215, 'A', '上传视频', '', 0, 'upload:video', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (501, 0, 'M', '网站设置', 'el-icon-Basketball', 10, '', 'website', '', '', '', 0, 1, 0, 1650341765, 1691482253);
INSERT INTO `system_auth_menu` VALUES (502, 501, 'C', '网站信息', '', 0, 'setting:website:detail', 'information', 'setting/website/information', '', '', 0, 1, 0, 1650341765, 1660202218);
INSERT INTO `system_auth_menu` VALUES (503, 502, 'A', '保存配置', '', 0, 'setting:website:save', '', '', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (505, 501, 'C', '网站备案', '', 0, 'setting:copyright:detail', 'filing', 'setting/website/filing', '', '', 0, 1, 0, 1650341765, 1660202294);
INSERT INTO `system_auth_menu` VALUES (506, 505, 'A', '备案保存', '', 0, 'setting:copyright:save', '', 'setting/website/protocol', '', '', 0, 0, 0, 1650341765, 1650341765);
INSERT INTO `system_auth_menu` VALUES (510, 501, 'C', '政策协议', '', 0, 'setting:protocol:detail', 'protocol', 'setting/website/protocol', '', '', 0, 1, 0, 1660027606, 1660202312);
INSERT INTO `system_auth_menu` VALUES (511, 510, 'A', '协议保存', '', 0, 'setting:protocol:save', '', '', '', '', 0, 0, 0, 1660027606, 1663670865);
INSERT INTO `system_auth_menu` VALUES (515, 600, 'C', '字典管理', 'el-icon-Box', 0, 'setting:dict:type:list', 'dict', 'setting/dict/type/index', '', '', 0, 1, 0, 1660035436, 1663226087);
INSERT INTO `system_auth_menu` VALUES (516, 515, 'A', '字典类型新增', '', 0, 'setting:dict:type:add', '', '', '', '', 0, 1, 0, 1660202761, 1660202761);
INSERT INTO `system_auth_menu` VALUES (517, 515, 'A', '字典类型编辑', '', 0, 'setting:dict:type:edit', '', '', '', '', 0, 1, 0, 1660202842, 1660202842);
INSERT INTO `system_auth_menu` VALUES (518, 515, 'A', '字典类型删除', '', 0, 'setting:dict:type:del', '', '', '', '', 0, 1, 0, 1660202903, 1660202903);
INSERT INTO `system_auth_menu` VALUES (519, 600, 'C', '字典数据管理', '', 0, 'setting:dict:data:list', 'dict/data', 'setting/dict/data/index', '/dev_tools/dict', '', 0, 0, 0, 1660202948, 1663309252);
INSERT INTO `system_auth_menu` VALUES (520, 515, 'A', '字典数据新增', '', 0, 'setting:dict:data:add', '', '', '', '', 0, 1, 0, 1660203117, 1660203117);
INSERT INTO `system_auth_menu` VALUES (521, 515, 'A', '字典数据编辑', '', 0, 'setting:dict:data:edit', '', '', '', '', 0, 1, 0, 1660203142, 1660203142);
INSERT INTO `system_auth_menu` VALUES (522, 515, 'A', '字典数据删除', '', 0, 'setting:dict:data:del', '', '', '', '', 0, 1, 0, 1660203159, 1660203159);
INSERT INTO `system_auth_menu` VALUES (600, 0, 'M', '开发工具', 'el-icon-EditPen', 0, '', 'dev_tools', '', '', '', 0, 1, 0, 1660027606, 1664335701);
INSERT INTO `system_auth_menu` VALUES (610, 600, 'C', '代码生成器', 'el-icon-DocumentAdd', 0, 'gen:list', 'code', 'dev_tools/code/index', '', '', 0, 1, 0, 1660028954, 1660532510);
INSERT INTO `system_auth_menu` VALUES (611, 610, 'A', '导入数据表', '', 0, 'gen:importTable', '', '', '', '', 0, 1, 0, 1660532389, 1660532389);
INSERT INTO `system_auth_menu` VALUES (612, 610, 'A', '生成代码', '', 0, 'gen:genCode', '', '', '', '', 0, 1, 0, 1660532421, 1660532421);
INSERT INTO `system_auth_menu` VALUES (613, 610, 'A', '下载代码', '', 0, 'gen:downloadCode', '', '', '', '', 0, 1, 0, 1660532437, 1660532437);
INSERT INTO `system_auth_menu` VALUES (614, 610, 'A', '预览代码', '', 0, 'gen:previewCode', '', '', '', '', 0, 1, 0, 1660532549, 1660532549);
INSERT INTO `system_auth_menu` VALUES (616, 610, 'A', '同步表结构', '', 0, 'gen:syncTable', '', '', '', '', 0, 1, 0, 1660532781, 1660532781);
INSERT INTO `system_auth_menu` VALUES (617, 610, 'A', '删除数据表', '', 0, 'gen:delTable', '', '', '', '', 0, 1, 0, 1660532800, 1660532800);
INSERT INTO `system_auth_menu` VALUES (618, 610, 'A', '数据表详情', '', 0, 'gen:detail', '', '', '', '', 0, 1, 0, 1660532964, 1660532977);
INSERT INTO `system_auth_menu` VALUES (700, 0, 'M', '素材管理', 'el-icon-Picture', 43, '', 'material', '', '', '', 0, 1, 0, 1660203293, 1663300847);
INSERT INTO `system_auth_menu` VALUES (701, 700, 'C', '素材中心', 'el-icon-PictureRounded', 0, '', 'index', 'material/index', '', '', 0, 1, 0, 1660203402, 1663301493);
INSERT INTO `system_auth_menu` VALUES (714, 714, 'A', '用户编辑', '', 0, 'user:edit', 'detail', 'consumer/lists/detail', '/consumer/lists', '', 0, 0, 0, 1661840502, 1662627718);
INSERT INTO `system_auth_menu` VALUES (715, 600, 'C', '编辑数据表', '', 0, 'gen:editTable', 'code/edit', 'dev_tools/code/edit', '/dev_tools/code', '', 0, 0, 0, 1661843525, 1661843615);
INSERT INTO `system_auth_menu` VALUES (774, 610, 'A', '导入数据表列表', '', 0, 'gen:db', '', '', '', '', 1, 1, 0, 1665646316, 1665646316);

-- ----------------------------
-- Table structure for system_auth_perm
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_perm`;
CREATE TABLE `system_auth_perm`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '主键',
  `role_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色ID',
  `menu_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_auth_perm
-- ----------------------------

-- ----------------------------
-- Table structure for system_auth_post
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_post`;
CREATE TABLE `system_auth_post`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '岗位编码',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '岗位名称',
  `remarks` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '岗位备注',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '岗位排序',
  `is_stop` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否停用: 0=否, 1=是',
  `is_delete` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `delete_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统岗位管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_auth_post
-- ----------------------------

-- ----------------------------
-- Table structure for system_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_role`;
CREATE TABLE `system_auth_role`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色排序',
  `is_disable` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否禁用: 0=否, 1=是',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_auth_role
-- ----------------------------
INSERT INTO `system_auth_role` VALUES (1, '审核员', '审核数据', 0, 0, 1668679451, 1668679468);

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类型',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '键',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '值',
  `create_time` int UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int UNSIGNED NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统全局配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, 'storage', 'default', 'local', 1660620367, 1662620927);
INSERT INTO `system_config` VALUES (2, 'storage', 'local', '{\"name\":\"本地存储\"}', 1660620367, 1662620927);
INSERT INTO `system_config` VALUES (3, 'storage', 'qiniu', '{\"name\":\"七牛云存储\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\"}', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (4, 'storage', 'aliyun', '{\"name\":\"阿里云OSS\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\"}', 1660620367, 1662620071);
INSERT INTO `system_config` VALUES (5, 'storage', 'qcloud', '{\"name\":\"腾讯云COS\",\"bucket\":\"\",\"secretKey\":\"\",\"accessKey\":\"\",\"domain\":\"\",\"region\":\"\"}', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (6, 'sms', 'default', 'aliyun', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (7, 'sms', 'aliyun', '{\"name\":\"阿里云短信\",\"alias\":\"aliyun\",\"sign\":\"\",\"appKey\":\"\",\"secretKey\":\"\"}', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (8, 'sms', 'tencent', '{\"name\":\"腾讯云短信\",\"alias\":\"tencent\",\"sign\":\"\",\"appId\":\"\",\"secretId\":\"\",\"secretKey\":\"\"}', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (9, 'sms', 'huawei', '{\"name\":\"华为云短信\",\"alias\":\"huawei\"}', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (10, 'website', 'name', 'LikeAdmin开源后台', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (11, 'website', 'logo', '/api/static/backend_logo.png', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (12, 'website', 'favicon', '/api/static/backend_favicon.ico', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (13, 'website', 'backdrop', '/api/static/backend_backdrop.png', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (14, 'website', 'copyright', '[{\"name\":\"LikeAdmin开源系统\",\"link\":\"http://www.beian.gov.cn\"}]', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (15, 'website', 'shopName', 'LikeAdmin开源系统', 1631255140, 1631255140);
INSERT INTO `system_config` VALUES (16, 'website', 'shopLogo', '/api/static/shop_logo.png', 1631255140, 1631255140);
INSERT INTO `system_config` VALUES (20, 'website', 'pcLogo', '/api/static/pc_logo.png', 1678963763, 1678963817);
INSERT INTO `system_config` VALUES (21, 'website', 'pcIco', '/api/static/pc_favicon.ico', 1678963763, 1678963817);
INSERT INTO `system_config` VALUES (22, 'website', 'pcTitle', 'LikeAdmin开源系统', 1678963763, 1678963817);
INSERT INTO `system_config` VALUES (23, 'website', 'pcDesc', '', 1678963763, 1678963817);
INSERT INTO `system_config` VALUES (24, 'website', 'pcKeywords', '', 1678963763, 1678963817);
INSERT INTO `system_config` VALUES (25, 'protocol', 'service', '{\"name\":\"服务协议\",\"content\":\"\"}', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (26, 'protocol', 'privacy', '{\"name\":\"隐私协议\",\"content\":\"\"}', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (27, 'tabbar', 'style', '{\"defaultColor\":\"#999999\",\"selectedColor\":\"#4173ff\"}', 1660620367, 1662544900);
INSERT INTO `system_config` VALUES (28, 'search', 'isHotSearch', '0', 1660620367, 1662546997);
INSERT INTO `system_config` VALUES (30, 'h5_channel', 'status', '1', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (31, 'h5_channel', 'close', '0', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (32, 'h5_channel', 'url', '', 1660620367, 1660620367);
INSERT INTO `system_config` VALUES (40, 'mp_channel', 'name', '', 1660620367, 1662551403);
INSERT INTO `system_config` VALUES (41, 'mp_channel', 'primaryId', '', 1660620367, 1662551403);
INSERT INTO `system_config` VALUES (42, 'mp_channel', 'appId', '', 1660620367, 1662551403);
INSERT INTO `system_config` VALUES (43, 'mp_channel', 'appSecret', '', 1660620367, 1662551403);
INSERT INTO `system_config` VALUES (44, 'mp_channel', 'qrCode', '', 1660620367, 1662551403);
INSERT INTO `system_config` VALUES (55, 'oa_channel', 'name', '', 1660620367, 1662551337);
INSERT INTO `system_config` VALUES (56, 'oa_channel', 'primaryId', ' ', 1660620367, 1662551337);
INSERT INTO `system_config` VALUES (57, 'oa_channel', 'qrCode', '', 1662551337, 1662551337);
INSERT INTO `system_config` VALUES (58, 'oa_channel', 'appId', '', 1660620367, 1662551337);
INSERT INTO `system_config` VALUES (59, 'oa_channel', 'appSecret', '', 1660620367, 1662551337);
INSERT INTO `system_config` VALUES (60, 'oa_channel', 'url', '', 1660620367, 1662551337);
INSERT INTO `system_config` VALUES (61, 'oa_channel', 'token', '', 1660620367, 1662551337);
INSERT INTO `system_config` VALUES (62, 'oa_channel', 'encodingAesKey', '', 1660620367, 1662551337);
INSERT INTO `system_config` VALUES (63, 'oa_channel', 'encryptionType', '1', 1660620367, 1662551337);
INSERT INTO `system_config` VALUES (64, 'oa_channel', 'menus', '[]', 1631255140, 1663118712);
INSERT INTO `system_config` VALUES (68, 'op_channel', 'appId', '', 0, 0);
INSERT INTO `system_config` VALUES (69, 'op_channel', 'appSecret', '', 0, 0);
INSERT INTO `system_config` VALUES (70, 'login', 'loginWay', '1,2', 1660620367, 1662538771);
INSERT INTO `system_config` VALUES (71, 'login', 'forceBindMobile', '0', 1660620367, 1662538771);
INSERT INTO `system_config` VALUES (72, 'login', 'openAgreement', '1', 1660620367, 1662538771);
INSERT INTO `system_config` VALUES (73, 'login', 'openOtherAuth', '1', 1660620367, 1662538771);
INSERT INTO `system_config` VALUES (74, 'login', 'autoLoginAuth', '1,2', 1660620367, 1662538771);
INSERT INTO `system_config` VALUES (80, 'user', 'defaultAvatar', '/api/static/default_avatar.png', 1660620367, 1662535156);
INSERT INTO `system_config` VALUES (200, 'recharge', 'openRecharge', '1', 1680160044, 1680166680);
INSERT INTO `system_config` VALUES (201, 'recharge', 'minRechargeMoney', '0.01', 1680160044, 1680166680);

-- ----------------------------
-- Table structure for system_log_login
-- ----------------------------
DROP TABLE IF EXISTS `system_log_login`;
CREATE TABLE `system_log_login`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '注解',
  `admin_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录账号',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录地址',
  `os` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '操作状态: 1=成功, 2=失败',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_log_login
-- ----------------------------
INSERT INTO `system_log_login` VALUES (1, 1, 'zss98', '127.0.0.1', 'Windows', 'Chrome', 1, 1691480678);
INSERT INTO `system_log_login` VALUES (2, 1, 'zss98', '127.0.0.1', 'Windows', 'Chrome', 1, 1691480688);
INSERT INTO `system_log_login` VALUES (3, 1, 'zss98', '127.0.0.1', 'Windows', 'Chrome', 0, 1691480986);
INSERT INTO `system_log_login` VALUES (4, 1, 'zss98', '127.0.0.1', 'Windows', 'Chrome', 1, 1691480993);
INSERT INTO `system_log_login` VALUES (5, 1, 'zss98', '127.0.0.1', 'Windows', 'Chrome', 0, 1691481006);
INSERT INTO `system_log_login` VALUES (6, 1, 'zss98', '127.0.0.1', 'Windows', 'Chrome', 1, 1691481043);

-- ----------------------------
-- Table structure for system_log_operate
-- ----------------------------
DROP TABLE IF EXISTS `system_log_operate`;
CREATE TABLE `system_log_operate`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '操作人ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求类型: GET/POST/PUT',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作标题',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求IP',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求接口',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求方法',
  `args` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数',
  `error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '执行状态: 1=成功, 2=失败',
  `start_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `task_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行耗时',
  `create_time` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_log_operate
-- ----------------------------
INSERT INTO `system_log_operate` VALUES (1, 1, 'POST', '管理员更新', '127.0.0.1', '/api/system/admin/upInfo', 'com.zss98.manger.module.controller.system.SystemAuthAdminController.upInfo()', '[{\"avatar\":\"http://localhost:8082/api/static/backend_avatar.png\",\"currPassword\":\"123456\",\"nickname\":\"张大帅\",\"password\":\"zss980909\"}]', '', 1, 1691481037, 1691481038, 1012, 1691481038);
INSERT INTO `system_log_operate` VALUES (2, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":779}]', '', 1, 1691481362, 1691481363, 429, 1691481363);
INSERT INTO `system_log_operate` VALUES (3, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":754}]', '', 1, 1691481367, 1691481367, 372, 1691481367);
INSERT INTO `system_log_operate` VALUES (4, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":719}]', '', 1, 1691481370, 1691481371, 343, 1691481371);
INSERT INTO `system_log_operate` VALUES (5, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":753}]', '', 1, 1691481375, 1691481375, 334, 1691481375);
INSERT INTO `system_log_operate` VALUES (6, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":718}]', '', 1, 1691481381, 1691481381, 420, 1691481381);
INSERT INTO `system_log_operate` VALUES (7, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":717}]', '', 1, 1691481386, 1691481386, 326, 1691481386);
INSERT INTO `system_log_operate` VALUES (8, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":746}]', '', 1, 1691481395, 1691481395, 437, 1691481395);
INSERT INTO `system_log_operate` VALUES (9, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":711}]', '', 1, 1691481399, 1691481399, 385, 1691481399);
INSERT INTO `system_log_operate` VALUES (10, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":745}]', '', 1, 1691481405, 1691481405, 409, 1691481405);
INSERT INTO `system_log_operate` VALUES (11, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":710}]', '', 1, 1691481408, 1691481409, 358, 1691481409);
INSERT INTO `system_log_operate` VALUES (12, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":744}]', '', 1, 1691481419, 1691481419, 338, 1691481419);
INSERT INTO `system_log_operate` VALUES (13, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":707}]', '', 1, 1691481422, 1691481422, 320, 1691481422);
INSERT INTO `system_log_operate` VALUES (14, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":775}]', '', 1, 1691481426, 1691481427, 364, 1691481427);
INSERT INTO `system_log_operate` VALUES (15, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":737}]', '', 1, 1691481430, 1691481431, 377, 1691481431);
INSERT INTO `system_log_operate` VALUES (16, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":736}]', '', 1, 1691481433, 1691481433, 331, 1691481433);
INSERT INTO `system_log_operate` VALUES (17, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":735}]', '', 1, 1691481435, 1691481436, 351, 1691481436);
INSERT INTO `system_log_operate` VALUES (18, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":734}]', '', 1, 1691481438, 1691481438, 332, 1691481438);
INSERT INTO `system_log_operate` VALUES (19, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":716}]', '', 1, 1691481441, 1691481441, 407, 1691481441);
INSERT INTO `system_log_operate` VALUES (20, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":705}]', '', 1, 1691481454, 1691481454, 323, 1691481454);
INSERT INTO `system_log_operate` VALUES (21, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":755}]', '', 1, 1691481459, 1691481459, 374, 1691481459);
INSERT INTO `system_log_operate` VALUES (22, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":738}]', '', 1, 1691481462, 1691481463, 335, 1691481463);
INSERT INTO `system_log_operate` VALUES (23, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":733}]', '', 1, 1691481465, 1691481465, 329, 1691481465);
INSERT INTO `system_log_operate` VALUES (24, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":732}]', '', 1, 1691481467, 1691481467, 342, 1691481467);
INSERT INTO `system_log_operate` VALUES (25, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":730}]', '', 1, 1691481470, 1691481470, 353, 1691481470);
INSERT INTO `system_log_operate` VALUES (26, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":704}]', '', 1, 1691481473, 1691481473, 371, 1691481473);
INSERT INTO `system_log_operate` VALUES (27, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":703}]', '', 1, 1691481476, 1691481476, 339, 1691481476);
INSERT INTO `system_log_operate` VALUES (28, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":803}]', '', 1, 1691481483, 1691481483, 475, 1691481483);
INSERT INTO `system_log_operate` VALUES (29, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":802}]', '', 1, 1691481486, 1691481486, 354, 1691481486);
INSERT INTO `system_log_operate` VALUES (30, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":800}]', '', 1, 1691481488, 1691481489, 321, 1691481489);
INSERT INTO `system_log_operate` VALUES (31, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":799}]', '', 1, 1691481492, 1691481492, 372, 1691481492);
INSERT INTO `system_log_operate` VALUES (32, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":801}]', '', 1, 1691481496, 1691481496, 435, 1691481496);
INSERT INTO `system_log_operate` VALUES (33, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":798}]', '', 1, 1691481499, 1691481499, 367, 1691481499);
INSERT INTO `system_log_operate` VALUES (34, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":797}]', '', 1, 1691481501, 1691481502, 353, 1691481502);
INSERT INTO `system_log_operate` VALUES (35, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":796}]', '', 1, 1691481513, 1691481514, 340, 1691481514);
INSERT INTO `system_log_operate` VALUES (36, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":795}]', '', 1, 1691481516, 1691481516, 345, 1691481516);
INSERT INTO `system_log_operate` VALUES (37, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":722}]', '', 1, 1691481518, 1691481519, 354, 1691481519);
INSERT INTO `system_log_operate` VALUES (38, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":743}]', '', 1, 1691481522, 1691481522, 377, 1691481522);
INSERT INTO `system_log_operate` VALUES (39, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":742}]', '', 1, 1691481524, 1691481524, 398, 1691481524);
INSERT INTO `system_log_operate` VALUES (40, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":723}]', '', 1, 1691481527, 1691481527, 331, 1691481527);
INSERT INTO `system_log_operate` VALUES (41, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":741}]', '', 1, 1691481530, 1691481530, 338, 1691481530);
INSERT INTO `system_log_operate` VALUES (42, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":721}]', '', 1, 1691481532, 1691481533, 350, 1691481533);
INSERT INTO `system_log_operate` VALUES (43, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":720}]', '', 1, 1691481535, 1691481535, 323, 1691481535);
INSERT INTO `system_log_operate` VALUES (44, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":794}]', '', 1, 1691481538, 1691481538, 366, 1691481538);
INSERT INTO `system_log_operate` VALUES (45, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":740}]', '', 1, 1691481879, 1691481879, 492, 1691481879);
INSERT INTO `system_log_operate` VALUES (46, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":739}]', '', 1, 1691481882, 1691481882, 364, 1691481882);
INSERT INTO `system_log_operate` VALUES (47, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":713}]', '', 1, 1691481885, 1691481886, 464, 1691481886);
INSERT INTO `system_log_operate` VALUES (48, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":712}]', '', 1, 1691481889, 1691481890, 524, 1691481890);
INSERT INTO `system_log_operate` VALUES (49, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":780}]', '请先删除子菜单再操作!', 2, 1691482012, 1691482012, 245, 1691482012);
INSERT INTO `system_log_operate` VALUES (50, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":757}]', '', 1, 1691482112, 1691482113, 487, 1691482113);
INSERT INTO `system_log_operate` VALUES (51, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":756}]', '', 1, 1691482116, 1691482116, 432, 1691482116);
INSERT INTO `system_log_operate` VALUES (52, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":747}]', '', 1, 1691482118, 1691482118, 340, 1691482118);
INSERT INTO `system_log_operate` VALUES (53, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":556}]', '', 1, 1691482183, 1691482184, 405, 1691482184);
INSERT INTO `system_log_operate` VALUES (54, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":555}]', '', 1, 1691482185, 1691482186, 440, 1691482186);
INSERT INTO `system_log_operate` VALUES (55, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":760}]', '', 1, 1691482189, 1691482190, 706, 1691482190);
INSERT INTO `system_log_operate` VALUES (56, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":728}]', '', 1, 1691482192, 1691482192, 382, 1691482192);
INSERT INTO `system_log_operate` VALUES (57, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":759}]', '', 1, 1691482197, 1691482198, 515, 1691482198);
INSERT INTO `system_log_operate` VALUES (58, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":726}]', '', 1, 1691482200, 1691482200, 538, 1691482200);
INSERT INTO `system_log_operate` VALUES (59, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":758}]', '', 1, 1691482203, 1691482203, 418, 1691482203);
INSERT INTO `system_log_operate` VALUES (60, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":725}]', '', 1, 1691482205, 1691482206, 321, 1691482206);
INSERT INTO `system_log_operate` VALUES (61, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":724}]', '', 1, 1691482209, 1691482209, 337, 1691482209);
INSERT INTO `system_log_operate` VALUES (62, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":777}]', '', 1, 1691482215, 1691482215, 409, 1691482215);
INSERT INTO `system_log_operate` VALUES (63, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":776}]', '', 1, 1691482217, 1691482217, 305, 1691482217);
INSERT INTO `system_log_operate` VALUES (64, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":554}]', '', 1, 1691482219, 1691482219, 329, 1691482219);
INSERT INTO `system_log_operate` VALUES (65, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":553}]', '', 1, 1691482221, 1691482222, 333, 1691482222);
INSERT INTO `system_log_operate` VALUES (66, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":552}]', '', 1, 1691482224, 1691482224, 353, 1691482224);
INSERT INTO `system_log_operate` VALUES (67, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":551}]', '', 1, 1691482226, 1691482226, 307, 1691482226);
INSERT INTO `system_log_operate` VALUES (68, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":550}]', '', 1, 1691482228, 1691482228, 366, 1691482228);
INSERT INTO `system_log_operate` VALUES (69, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":793}]', '', 1, 1691482233, 1691482234, 358, 1691482234);
INSERT INTO `system_log_operate` VALUES (70, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":792}]', '', 1, 1691482235, 1691482235, 399, 1691482235);
INSERT INTO `system_log_operate` VALUES (71, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":791}]', '', 1, 1691482238, 1691482238, 340, 1691482238);
INSERT INTO `system_log_operate` VALUES (72, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":790}]', '', 1, 1691482240, 1691482240, 353, 1691482240);
INSERT INTO `system_log_operate` VALUES (73, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":789}]', '', 1, 1691482242, 1691482242, 369, 1691482242);
INSERT INTO `system_log_operate` VALUES (74, 1, 'POST', '菜单编辑', '127.0.0.1', '/api/system/menu/edit', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.edit()', '[{\"component\":\"\",\"id\":501,\"isCache\":0,\"isDisable\":0,\"isShow\":1,\"menuIcon\":\"el-icon-Basketball\",\"menuName\":\"网站设置\",\"menuSort\":10,\"menuType\":\"M\",\"params\":\"\",\"paths\":\"website\",\"perms\":\"\",\"pid\":0,\"selected\":\"\"}]', '', 1, 1691482253, 1691482253, 180, 1691482253);
INSERT INTO `system_log_operate` VALUES (75, 1, 'POST', '菜单删除', '127.0.0.1', '/api/system/menu/del', 'com.zss98.manger.module.controller.system.SystemAuthMenuController.del()', '[{\"id\":500}]', '', 1, 1691482256, 1691482256, 327, 1691482256);

SET FOREIGN_KEY_CHECKS = 1;
