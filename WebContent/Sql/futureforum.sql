/*
Navicat MySQL Data Transfer

Source Server         : Elective
Source Server Version : 50548
Source Host           : localhost:3306
Source Database       : futureforum

Target Server Type    : MYSQL
Target Server Version : 50548
File Encoding         : 65001

Date: 2016-11-30 19:03:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `articleId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(20000) DEFAULT NULL,
  `emitTime` datetime DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `articleTypeName` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('5', '区块链开发（五）区块链ICO：互联网进化的驱动力', '    由于区块链不可篡改的特性，在众多区块链组织和公司的共同努力下，互联网将逐步从中心化的信任进化到由算法、数据为核心的去中心化信任。随着中心化的信任中介被逐渐削弱和替代，互联网的运作方式将被以区块链为代表的系统所改变。因此，区块链不仅是一种技术，更是一个关于互联网进化的故事，尽管这个故事还有些遥远，但它已经有了萌芽和初步的发展。\r\n							', '2016-11-02 18:17:47', '2016-11-08 13:30:12', '互联网', '1', 'jiaoxiangyu');
INSERT INTO `article` VALUES ('7', ' 一个小框架，基于rx_retrofit2_mvp', '<p>说一下我理解的mvp，在我的看法中，mvp，m是要做一些耗时操作的，像读取网络数据，数据库数据，sp数据啊...这些脏活苦活全部都丢给它去做，我们在contract中给它定义好了interface，model类在自己本身去实现它，然后按着上层的要求去做那些苦活累活；而View呢？我觉得一般是指我们的activity或者fragment巴，他们就负责一些比较轻松的东西了，像显示个toast啊，show一下dialog啊，拿一下editext的数据啊，最苦力也就是设置个适配器啊，监听一。</p>', '2016-11-04 17:42:17', '2016-11-27 10:00:48', '互联网', '1', 'jiaoxiangyu');
INSERT INTO `article` VALUES ('9', 'Animation-list，帧动画+属性动画，做出Flash般的效果', '我们会用到PS，即使不会也不要怂，只需要几步傻瓜式操作即可。首先你需要找一张你喜欢的GIF图，然后一张背景图片，以及一些小组件图片（为了这个页面不卡，我就直接发我处理后的图片资源了）。点击图层旁边的复选框(选中显示一个眼睛的图案)，选中表示图层可见，每次选择一个图层，然后保存文件即可，然后一张GIF就被拆分成以下几个图片(我对图层进行了简单处理，如果会PS可以自行扩展', '2016-11-04 20:11:33', '2016-11-04 20:11:33', '互联网', '2', 's71267');
INSERT INTO `article` VALUES ('10', '打造流畅九宫格抽奖活动', '    因为company项目中需要做九宫格抽奖活动，以前都没有做过类似的功能，虽然之前在浏览大神们的博客中，无意中也看到了好多关于抽奖的项目，但因为项目中没有需要，一直都没有点击进去看。这次不去看估计不行。直到公司计划要做抽奖功能，才迫不得已上网查找demo。\r\n    网上找了大半天，好不容易找到了几个demo，下载下来，解压缩包发现竟然里面空空如也，只有几张九宫格的图片，害我白白浪费了几个CSDN积分。后面在eoe网站那发现了一个demo，于是好开心，下载下来后马上导入到工程中，运行看了效果，九宫格是出来了，但效果真不敢恭维，主要是运行不流畅。但我还是进去稍微看了一下demo，基本思路是这样的：定义好九宫格界面，然后开启子线程不断循环修改状态，再通过handler发送消息到主线程中修改界面（子线程不能直接修改界面）。\r\n\r\n', '2016-11-06 10:06:51', '2016-11-06 10:06:51', '互联网', '2', 's71267');
INSERT INTO `article` VALUES ('11', '李明远的“错”与“罚”，灰色地带', '<p>　 &nbsp;自古以来，太早被立的太子都没有特别好的结局。原因在于，做太子本身就会为那些觊觎东宫之位的人提供一个活标靶，同时由于做太子时间过长，也会给人留出足够多的时间行事。\r\n\r\n　　所以，很多时候，即便皇帝再宠幸太子，但也无法真的“保护”太子，要么是在别人的撺掇之下自生疑窦，要么就是太子被人抓住把柄自己有心无力。\r\n\r\n　　这样的事放在前百度公司副总裁李明远身上应该是再恰当不过了。\r\n\r\n　　11 月 4 日，百度发了一封“意味深长”的内部邮件，通告李明远引咎辞职的事情。之所以称这封内部邮件是意味深长，原因在于：\r\n\r\n　　第一，李明远的“错”与“罚”并不匹配；\r\n\r\n　　按照纰漏的邮件显示，李明远被百度查出有不小的经济问题——与被收购公司、自己管理业务的合作伙伴有巨额经济往来，个人参股公司也与百度有业务关联未按公司制度报备。如此的“大罪”，但百度处理时却只是让李明远引咎辞职，没有要追回经济损失、没有移交司法机关，甚至在邮件里仍以“明远”相称。\r\n\r\n　　第二，既然要“放过”为何又要内部邮件公示。\r\n\r\n　　从邮件上来看，百度似乎是有心放李明远一马，让其辞职了事。但是百度作为一家如此成熟的公司，不会不知道发出这个内部邮件之后，会有多快的速度传到媒体端，面对如此大的地震媒体怎会轻易放过，以及最重要的是，如此的处理方式媒体，媒体怎会不生疑窦。</p>', '2016-11-06 16:52:39', '2016-11-27 19:36:40', '互联网', '1', 'jiaoxiangyu');
INSERT INTO `article` VALUES ('12', '1.2万的裁员计划后，Intel为何大举进军体育产业？', '    不久前，在大洋彼岸的体育界，又发生了一件大新闻。\r\n\r\n　　说到英特尔这家公司，大家脑海里一定浮现的是他们家的处理器，和“灯，等灯等灯”的魔性旋律。而就是这样一家在科技领域呼风唤雨的大拿，也正式宣布进军体育产业了！\r\n\r\n　　上月，英特尔在美国圣地亚哥举行的全球首脑峰会上宣布，旗下的英特尔资本（Intel Capital）组建了全新的体育集团（Intel Sports Group），对体育垂直项目进行投资。\r\n\r\n　　而在当天峰会，Intel Group 一口气宣布对 12 家科技初创公司进行合计 3800 万美元的投资，其中大部分都与体育有着联系。\r\n\r\n　　在英特尔的 CEO Brian Krzanich 看来， “数字化是几十年来体育运动中最大的变化”，而作为科技届的巨擘的英特尔，究竟看准了哪些体育科技的细分产业呢？这会是未来一片又一片的蓝海吗？\r\n\r\n　　科技体育联姻，Intel 早有涉猎\r\n\r\n　　早在设立体育集团之前，Intel 的各项科技产品就与体育有着千丝万缕的联系。\r\n\r\n　　在体育转播方面，英特尔在上赛季的 NBA 全明星周末上应用了旗下科技公司 Replay Technologies 的 FreeD 转播技术。', '2016-11-06 16:55:59', '2016-11-06 16:59:37', '互联网', '1', 'jiaoxiangyu');
INSERT INTO `article` VALUES ('13', '李明远的“错”与“罚”，灰色地带', '<p>　 &nbsp;自古以来，太早被立的太子都没有特别好的结局。原因在于，做太子本身就会为那些觊觎东宫之位的人提供一个活标靶，同时由于做太子时间过长，也会给人留出足够多的时间行事。\r\n\r\n　　所以，很多时候，即便皇帝再宠幸太子，但也无法真的“保护”太子，要么是在别人的撺掇之下自生疑窦，要么就是太子被人抓住把柄自己有心无力。\r\n\r\n　　这样的事放在前百度公司副总裁李明远身上应该是再恰当不过了。\r\n\r\n　　11 月 4 日，百度发了一封“意味深长”的内部邮件，通告李明远引咎辞职的事情。之所以称这封内部邮件是意味深长，原因在于：\r\n\r\n　　第一，李明远的“错”与“罚”并不匹配；\r\n\r\n　　按照纰漏的邮件显示，李明远被百度查出有不小的经济问题——与被收购公司、自己管理业务的合作伙伴有巨额经济往来，个人参股公司也与百度有业务关联未按公司制度报备。如此的“大罪”，但百度处理时却只是让李明远引咎辞职，没有要追回经济损失、没有移交司法机关，甚至在邮件里仍以“明远”相称。\r\n\r\n　　第二，既然要“放过”为何又要内部邮件公示。\r\n\r\n　　从邮件上来看，百度似乎是有心放李明远一马，让其辞职了事。但是百度作为一家如此成熟的公司，不会不知道发出这个内部邮件之后，会有多快的速度传到媒体端，面对如此大的地震媒体怎会轻易放过，以及最重要的是，如此的处理方式媒体，媒体怎会不生疑窦。jknd</p>', '2016-11-06 16:57:10', '2016-11-27 19:36:23', '互联网', '1', 'jiaoxiangyu');
INSERT INTO `article` VALUES ('21', '晨飞雁通讯 乐视移动的新牺牲品？', '<p style=\"line-height: 1.5em;\">乐视移动正把晨飞雁拖入一场透支信用的危险游戏。</p><p style=\"line-height: 1.5em;\">　　今年 9 月，乐视公布了超级手机的累计销量：1700 万台。随着乐视手机数字不断增长，加之电子消费品的良品率和易消耗性，随之而来的返修和售后服务，也成为乐视手机发布一年半以来的新工作内容。近期 PingWest 品玩从资深供应链人士处获知，一家名为“晨飞雁通讯”的移动产品售后维修工厂与乐视移动达成了合作关系。</p><p style=\"line-height: 1.5em;\">　　PingWest 品玩向乐视移动公关求证此事，但对方表示不知情，并对我们希望转接渠道部门的请求也无回应。但上述供应链人士告诉品玩，乐视移动与晨飞雁的合作，从今年 9 月开始，至今两个多月了，但开始取道顺丰展开邮寄维修工作，则是 11 月（也就是近两周）的事情。</p><p style=\"line-height: 1.5em;\">　　“晨飞雁”是什么来路？</p><p style=\"line-height: 1.5em;\">　　有关晨飞雁的公开资料并不多，PingWest 品玩经查询得知，北京晨飞雁通讯技术有限公司成立于本世纪初，目前注册地址位于北京亦庄经济开发区的中航技北京工业园，法人代表为执行董事王志红，其官网 http://www.cfy.com.cn 现已无法打开。工商管理信息显示，这家公司从事业务范围包括：卫星通讯技术开发、电子技术开发、咨询、转让、培训、服务等。通俗点儿说，这是一家高度专业化的智能手机维修服务公司。</p><p style=\"line-height: 1.5em;\">　　但晨飞雁在业内并非籍籍无名。在国内，有技术能力且敢于接大厂翻修单的售后维修公司并不多，晨飞雁即是其中一家。除此之外，金宏景、泓福瑞、高维通讯，连同我们熟知的富士康等几家公司是国内通讯产品的售后维修主力。</p><p style=\"line-height: 1.5em;\">　　虽然一些未明来源的信息黄页显示，晨飞雁服务的客户包括诺基亚、联想、三星、OPPO、摩托罗拉、索爱、酷派、黑莓等手机品牌，但事实上，索尼早在 2011 年即整体收购了“索爱”，次年成立了“索尼移动”。因此这些黄页显示的晨飞雁的经营业务存疑。PingWest 品玩从手机维修业务人员处得知，在与乐视移动达成合作之前，晨飞雁服务的客户是小米和华为。</p><p style=\"line-height: 1.5em;\">　　华为不担心乐视拖垮晨飞雁？</p><p style=\"line-height: 1.5em;\">　　在本月 6 日贾跃亭发出反思公司发展节奏的公开信之后，有关乐视系资金链紧张的传闻不断，乐视也频繁出面否认，但后来华为内部曝出的“邮件门”表明，对乐视不放心的不仅是市场和供应商，连华为也因“出于对自身的预警和防范”而发函质问供应商了。</p><p style=\"line-height: 1.5em;\">　　</p><p><br/></p>', '2016-11-26 22:16:44', '2016-11-26 22:23:57', '移动开发', '3', 'qwert');
INSERT INTO `article` VALUES ('22', 'dsfdsfdsf', '<p>dsmfsndkj<br/></p>', '2016-11-27 15:03:31', '2016-11-27 15:03:31', '移动开发', '3', 'qwert');

-- ----------------------------
-- Table structure for articletype
-- ----------------------------
DROP TABLE IF EXISTS `articletype`;
CREATE TABLE `articletype` (
  `articleTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `articleTypeName` varchar(255) DEFAULT NULL,
  `articleTypeDescrip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`articleTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articletype
-- ----------------------------
INSERT INTO `articletype` VALUES ('1', '移动开发', '1');
INSERT INTO `articletype` VALUES ('2', 'Web前端', '2');
INSERT INTO `articletype` VALUES ('3', '构建设计', '3');
INSERT INTO `articletype` VALUES ('4', '编程语言', '4');
INSERT INTO `articletype` VALUES ('5', '互联网', '5');
INSERT INTO `articletype` VALUES ('6', '数据库', '6');
INSERT INTO `articletype` VALUES ('7', '系统运维', '7');
INSERT INTO `articletype` VALUES ('8', '云计算', '8');
INSERT INTO `articletype` VALUES ('9', '研发管理', '9');
INSERT INTO `articletype` VALUES ('10', '综合', '10');

-- ----------------------------
-- Table structure for consumer
-- ----------------------------
DROP TABLE IF EXISTS `consumer`;
CREATE TABLE `consumer` (
  `userId` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `headImg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consumer
-- ----------------------------
INSERT INTO `consumer` VALUES ('1', 'jiaoxiangyu', 'IAgg4yJ4Fe0XVqa1Mefg0g==', '男', '21', '2016-10-21 20:28:59', '454212354542@qq.com', '1434854535', '焦祥宇', 'user/default.png');
INSERT INTO `consumer` VALUES ('2', 's71267', 'IAgg4yJ4Fe0XVqa1Mefg0g==', '女', '1', '2016-11-04 17:27:07', '71236752@21.com', '18239778968', 'sad', 'user/default.png');
INSERT INTO `consumer` VALUES ('3', 'qwert', 'IAgg4yJ4Fe0XVqa1Mefg0g==', '女', '24', '2016-11-26 17:13:01', '3512121@qq.com', '18238748787', '程序猿', 'user/default.png');
INSERT INTO `consumer` VALUES ('4', 'awtetrr', 'IAgg4yJ4Fe0XVqa1Mefg0g==', '男', '3', '2016-11-27 15:56:37', '3512121@qq.com', '18238748787', '很高的', 'user/default.png');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `userId` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `registerTime` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '1', '1', '1', '1', '2016-10-21 20:29:26', 'ewawf', '213231', '11');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `replayId` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `replyTime` datetime DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `articleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`replayId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('6', '2', 's71267', '2016-11-06 10:07:59', '    这个demo虽然功能上实现了，但不是我想要的效果，因为我这一关都不能通过，到了产品那边更加不用说了。那怎么办呢？', '10');
INSERT INTO `reply` VALUES ('7', '2', 's71267', '2016-11-06 10:12:42', '    于是我想到了一个控件，叫做SurfaceView,做游戏开发的同志们，应该对这个控件不陌生吧？首先介绍一下这个控件： \r\n1.SurfaceView继承于View，多用于游戏开发中 \r\n2.可以直接在子线程中运行（其他UI控件都必须在主线程中运行的）。 \r\n3.一般的UI控件自定义时都是重写onDraw方法，但在SurfaceView中是通过SurfaceHolder获取Canvas来绘制图形的', '10');
INSERT INTO `reply` VALUES ('8', '1', 'jiaoxiangyu', '2016-11-06 17:06:08', '   从邮件上来看，百度似乎是有心放李明远一马，让其辞职了事', '13');
INSERT INTO `reply` VALUES ('9', '1', 'jiaoxiangyu', '2016-11-08 13:31:14', '送到非洲 ？不到一星期就吃了把', '12');
INSERT INTO `reply` VALUES ('10', '1', 'jiaoxiangyu', '2016-11-08 22:25:48', '好好睡觉按规定和', '13');
INSERT INTO `reply` VALUES ('15', '1', 'jiaoxiangyu', '2016-11-10 20:26:22', '所以，很多时候，即便皇帝再宠幸太子，但也无法真的“保护”太子，要么是在别人的撺掇之下自生疑窦，要么就是太子被人抓住把柄自己有心无力。 　　这样的事放在前百度公司副总裁李明远身上应该是再恰当不过了。 　　11 月 4 日，百度发了一封“意味深长”的内部邮件，通告李明远引咎辞职的事情。之所以称这封内部邮件是意味深长，原因在于： 　　第一，李明远的“错”与“罚”并不匹配；　按照纰漏的邮件显示，李明远被 ', '13');
INSERT INTO `reply` VALUES ('17', '1', 'jiaoxiangyu', '2016-11-10 22:23:18', ' 　　从邮件上来看，百度似乎是有心放李明远一马，让其辞职了事。但是百度作为一家如此成熟的公司，不会不知道发出这个内部邮件之后，会有多快的速度传到媒体端，面对如此大的地震媒体怎会轻易放过，以及最重要的是，如此的处理方式媒体，媒体怎会不生疑窦。', '13');
INSERT INTO `reply` VALUES ('18', '1', 'jiaoxiangyu', '2016-11-10 22:23:51', '按照纰漏的邮件显示，李明远被百度查出有不小的经济问题——与被收购公司、自己管理业务的合作伙伴有巨额经济往来，个人参股公司也与百度有业务关联未按公司制度报备。如此的“大罪”，但百度处理时却只是让李明远引咎辞职，没有要追回经济损失、没有移交司法机关，甚至在邮件里仍以“明远”相称。', '13');
INSERT INTO `reply` VALUES ('20', '1', 'jiaoxiangyu', '2016-11-11 15:15:43', '有虚拟现实界“奥斯卡”盛典之称的 VRCORE 开发者大赛颁奖典礼于 10 月 18 日在北京举行。来自四川大学华西基础医学与法医学院的《人卫 3D 系统解剖学》VR 版，荣获最佳应用奖以及最佳跨界奖提名。该技术可以全方位立体式展示人体结构，弥补了人体标本不足而无法给学生提供足够学习机会的遗憾。 耗时 5 年 VR“解剖课”投入教学', '11');
INSERT INTO `reply` VALUES ('21', '1', 'jiaoxiangyu', '2016-11-11 15:16:00', '一名穿着白大褂，戴着 VR 的学生正站在屏幕前，老师在一旁进行讲解。这是四川大学华西基础医学与法医学院的师生正在上“模拟解剖课”，学生可以凭借 VR 全方位立体地观察屏幕中人体的各个器官和结构，连血管都一目了然。学生甚至可以把器官“拿到”自己面前近距离观察，学习结束后通过一键复原让器官回到原位，学生置身在一个真实的场景中，所有的器官，就连皮肤都是真真切切的。', '11');
INSERT INTO `reply` VALUES ('24', '1', 'jiaoxiangyu', '2016-11-11 15:26:33', ' 　　四川大学华西基础医学与法医学院人体解剖教研室教授、《人卫 3D 系统解剖学》主编王凡举了一个例子，比如医生需要对一患者做颅脑手术，脑的血管有哪些?它们供应哪些部位?哪些结构是重要的?老师讲起来很难，学生学起来也很难。而 VR 技术可以帮助使用者在虚拟场景下，观察脑部重要结构和血管的分布情况。', '11');
INSERT INTO `reply` VALUES ('25', '1', 'jiaoxiangyu', '2016-11-11 15:56:12', '从邮件上来看，百度似乎是有心放李明远一马，让其辞职了事。但是百度作为一家如此成熟的公司，不会不知道发出这个内部邮件之后，会有多快的速度传到媒体端，面对如此大的地震媒体怎会轻易放过，以及最重要的是，如此的处理方式媒体，媒体怎会不生疑窦。', '13');
INSERT INTO `reply` VALUES ('26', '1', 'jiaoxiangyu', '2016-11-27 09:21:16', 'vcxlvm\r\n', '12');
INSERT INTO `reply` VALUES ('27', '1', 'jiaoxiangyu', '2016-11-27 09:24:02', '在本月 6 日贾跃亭发出反思公司发展节奏的公开信之后，有关乐视系资金链紧张的传闻不断，乐视也频繁出面否认，但后来华为内部曝出的“邮件门”表明，对乐视不放心的不仅是市场和供应商，连华为也因“出于对自身的预警和防范”而发函质问供应商了。\r\n', '21');
INSERT INTO `reply` VALUES ('28', '1', 'jiaoxiangyu', '2016-11-27 09:24:11', 'PingWest 品玩向乐视移动公关求证此事，但对方表示不知情，并对我们希望转接渠道部门的请求也无回应。但上述供应链人士告诉品玩，乐视移动与晨飞雁的合作，从今年 9 月开始，至今两个多月了，但开始取道顺丰展开邮寄维修工作，则是 11 月（也就是近两周）的事情。', '21');
INSERT INTO `reply` VALUES ('29', '1', 'jiaoxiangyu', '2016-11-27 09:30:28', 'PingWest 品玩向乐视移动公关求证此事，但对方表示不知情，并对我们希望转接渠道部门的请求也无回应。但上述供应链人士告诉品玩，乐视移动与晨飞雁的合作，从今年 9 月开始，至今两个多月了，但开始取道顺丰展开邮寄维修工作，则是 11 月（也就是近两周）的事情。', '21');
INSERT INTO `reply` VALUES ('30', '1', 'jiaoxiangyu', '2016-11-27 09:31:37', '　华为不担心乐视拖垮晨飞雁？\r\n　　在本月 6 日贾跃亭发出反思公司发展节奏的公开信之后，有关乐视系资金链紧张的传闻不断，乐视也频繁出面否认，但后来华为内部曝出的“邮件门”表明，对乐视不放心的不仅是市场和供应商，连华为也因“出于对自身的预警和防范”而发函质问供应商了。', '21');
INSERT INTO `reply` VALUES ('31', '1', 'jiaoxiangyu', '2016-11-27 09:52:29', '在本月 6 日贾跃亭发出反思公司发展节奏的公开信之后，有关乐视系资金链紧张的传闻不断，乐视也频繁出面否认，但后来华为内部曝出的“邮件门”表明，对乐视不放心的不仅是市场和供应商，连华为也因“出于对自身的预警和防范”而发函质问供应商了。', '21');
INSERT INTO `reply` VALUES ('32', '1', 'jiaoxiangyu', '2016-11-27 09:53:13', '下自生疑窦，要么就是太子被人抓住把柄自己有心无力,这样的事放在前百度公司副总裁李明远身上应该是再恰当不过了。', '13');
INSERT INTO `reply` VALUES ('33', '1', 'jiaoxiangyu', '2016-11-27 15:44:28', '我确认了可以如愿\r\n', '21');
INSERT INTO `reply` VALUES ('34', '4', 'awtetrr', '2016-11-27 15:57:34', '交话费国际化个', '13');

-- ----------------------------
-- Table structure for scan
-- ----------------------------
DROP TABLE IF EXISTS `scan`;
CREATE TABLE `scan` (
  `scanId` int(11) NOT NULL,
  `scanTime` datetime DEFAULT NULL,
  `articleId` int(11) DEFAULT NULL,
  `viewerId` int(11) DEFAULT NULL,
  `viewer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scanId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scan
-- ----------------------------
INSERT INTO `scan` VALUES ('140', '2016-11-06 10:01:22', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('141', '2016-11-06 10:03:13', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('142', '2016-11-06 10:06:59', '10', '2', 's71267');
INSERT INTO `scan` VALUES ('143', '2016-11-06 10:07:27', '10', '2', 's71267');
INSERT INTO `scan` VALUES ('144', '2016-11-06 10:08:02', '10', '2', 's71267');
INSERT INTO `scan` VALUES ('145', '2016-11-06 10:08:48', '10', '2', 's71267');
INSERT INTO `scan` VALUES ('146', '2016-11-06 10:10:43', '10', '2', 's71267');
INSERT INTO `scan` VALUES ('147', '2016-11-06 10:11:38', '10', '2', 's71267');
INSERT INTO `scan` VALUES ('148', '2016-11-06 10:12:13', '10', '2', 's71267');
INSERT INTO `scan` VALUES ('149', '2016-11-06 10:12:48', '10', '2', 's71267');
INSERT INTO `scan` VALUES ('150', '2016-11-06 11:37:39', '10', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('151', '2016-11-06 11:43:08', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('152', '2016-11-06 11:43:16', '7', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('153', '2016-11-06 15:06:55', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('154', '2016-11-06 15:10:35', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('155', '2016-11-06 15:13:50', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('156', '2016-11-06 16:26:11', '10', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('157', '2016-11-06 16:26:17', '10', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('158', '2016-11-06 16:27:27', '10', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('159', '2016-11-06 16:27:34', '10', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('160', '2016-11-06 16:41:53', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('161', '2016-11-06 16:48:29', '10', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('162', '2016-11-06 16:50:23', '7', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('163', '2016-11-06 16:51:35', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('164', '2016-11-06 16:52:44', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('165', '2016-11-06 16:58:15', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('166', '2016-11-06 16:58:28', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('167', '2016-11-06 16:58:36', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('168', '2016-11-06 16:58:53', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('169', '2016-11-06 17:02:52', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('170', '2016-11-06 17:03:30', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('171', '2016-11-06 17:03:35', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('172', '2016-11-06 17:03:56', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('173', '2016-11-06 17:05:41', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('174', '2016-11-06 17:06:18', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('175', '2016-11-07 21:42:10', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('176', '2016-11-07 21:42:41', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('177', '2016-11-07 21:42:48', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('178', '2016-11-07 21:49:04', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('179', '2016-11-07 21:56:24', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('180', '2016-11-07 21:59:14', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('181', '2016-11-07 21:59:15', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('182', '2016-11-07 21:59:17', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('183', '2016-11-07 21:59:58', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('184', '2016-11-07 22:00:30', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('185', '2016-11-07 22:01:11', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('186', '2016-11-08 10:42:28', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('187', '2016-11-08 13:30:35', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('188', '2016-11-08 13:31:40', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('189', '2016-11-08 13:32:43', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('190', '2016-11-08 13:34:57', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('191', '2016-11-08 13:39:29', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('192', '2016-11-08 21:43:39', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('193', '2016-11-08 22:22:19', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('194', '2016-11-08 22:26:16', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('231', '2016-11-09 21:58:44', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('232', '2016-11-10 16:46:58', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('233', '2016-11-10 16:48:49', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('234', '2016-11-10 16:52:58', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('235', '2016-11-10 16:56:19', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('236', '2016-11-10 17:13:13', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('237', '2016-11-10 17:14:47', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('238', '2016-11-10 17:14:49', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('239', '2016-11-10 17:14:50', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('240', '2016-11-10 17:15:26', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('241', '2016-11-10 17:15:46', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('242', '2016-11-10 17:16:03', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('243', '2016-11-10 17:16:26', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('244', '2016-11-10 17:16:47', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('245', '2016-11-10 17:18:22', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('246', '2016-11-10 17:22:54', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('247', '2016-11-10 17:23:28', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('251', '2016-11-10 17:27:27', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('253', '2016-11-10 20:03:35', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('276', '2016-11-10 20:25:42', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('277', '2016-11-10 20:26:26', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('278', '2016-11-10 20:37:58', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('279', '2016-11-10 20:40:27', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('292', '2016-11-10 22:16:51', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('293', '2016-11-10 22:18:11', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('294', '2016-11-10 22:19:25', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('295', '2016-11-10 22:19:38', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('296', '2016-11-10 22:19:56', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('297', '2016-11-10 22:22:53', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('298', '2016-11-10 22:23:08', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('300', '2016-11-10 22:23:26', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('301', '2016-11-10 22:23:56', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('302', '2016-11-10 22:25:01', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('303', '2016-11-10 22:25:41', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('304', '2016-11-10 22:26:07', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('305', '2016-11-10 22:26:43', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('306', '2016-11-10 22:26:57', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('307', '2016-11-10 22:27:31', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('308', '2016-11-10 22:27:46', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('309', '2016-11-10 22:28:53', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('310', '2016-11-10 22:28:57', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('311', '2016-11-10 22:29:12', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('312', '2016-11-10 22:29:40', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('313', '2016-11-10 22:29:41', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('314', '2016-11-10 22:30:00', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('315', '2016-11-10 22:30:01', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('317', '2016-11-11 15:10:50', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('318', '2016-11-11 15:11:09', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('319', '2016-11-11 15:11:16', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('320', '2016-11-11 15:12:36', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('322', '2016-11-11 15:13:21', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('324', '2016-11-11 15:13:52', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('326', '2016-11-11 15:15:13', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('327', '2016-11-11 15:15:26', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('328', '2016-11-11 15:15:31', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('329', '2016-11-11 15:15:47', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('331', '2016-11-11 15:26:20', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('332', '2016-11-11 15:37:03', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('334', '2016-11-11 15:40:11', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('335', '2016-11-11 15:48:57', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('338', '2016-11-11 15:49:57', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('342', '2016-11-11 15:51:15', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('346', '2016-11-11 15:53:22', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('347', '2016-11-11 15:53:27', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('348', '2016-11-11 15:53:42', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('352', '2016-11-11 15:55:54', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('354', '2016-11-11 16:04:06', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('361', '2016-11-12 09:23:01', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('362', '2016-11-22 22:23:18', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('363', '2016-11-22 22:25:01', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('364', '2016-11-24 19:48:11', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('365', '2016-11-24 20:31:20', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('366', '2016-11-26 15:29:51', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('367', '2016-11-26 16:17:08', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('368', '2016-11-26 16:30:55', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('369', '2016-11-26 16:31:05', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('370', '2016-11-26 16:32:12', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('371', '2016-11-26 16:54:29', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('372', '2016-11-26 17:00:11', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('373', '2016-11-26 17:04:22', '5', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('374', '2016-11-26 17:10:16', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('375', '2016-11-26 17:17:43', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('376', '2016-11-26 17:22:26', '13', '3', 'qwert');
INSERT INTO `scan` VALUES ('377', '2016-11-26 21:16:19', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('379', '2016-11-26 21:38:56', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('380', '2016-11-26 21:40:40', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('387', '2016-11-26 22:22:34', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('388', '2016-11-26 22:22:53', '13', '3', 'qwert');
INSERT INTO `scan` VALUES ('389', '2016-11-26 22:23:01', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('390', '2016-11-26 22:24:02', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('391', '2016-11-26 22:25:13', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('392', '2016-11-26 22:25:31', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('393', '2016-11-26 22:26:34', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('394', '2016-11-26 22:28:32', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('395', '2016-11-26 22:28:34', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('396', '2016-11-26 22:28:53', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('397', '2016-11-26 22:29:05', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('398', '2016-11-26 22:29:14', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('399', '2016-11-26 22:29:41', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('400', '2016-11-26 22:30:46', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('401', '2016-11-26 22:30:48', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('402', '2016-11-26 22:30:49', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('403', '2016-11-26 22:30:49', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('404', '2016-11-26 22:30:59', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('405', '2016-11-26 22:31:13', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('406', '2016-11-26 22:31:15', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('407', '2016-11-26 22:31:19', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('408', '2016-11-26 22:31:20', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('409', '2016-11-26 22:31:20', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('410', '2016-11-26 22:31:21', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('411', '2016-11-26 22:31:22', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('412', '2016-11-26 22:31:22', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('413', '2016-11-26 22:31:26', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('414', '2016-11-26 22:31:27', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('415', '2016-11-26 22:31:35', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('416', '2016-11-26 22:31:48', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('417', '2016-11-26 22:31:58', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('418', '2016-11-26 22:32:13', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('419', '2016-11-26 22:32:14', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('420', '2016-11-26 22:32:53', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('421', '2016-11-26 22:33:26', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('422', '2016-11-26 22:33:29', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('423', '2016-11-26 22:33:47', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('424', '2016-11-26 22:34:27', '13', '3', 'qwert');
INSERT INTO `scan` VALUES ('425', '2016-11-26 22:34:35', '12', '3', 'qwert');
INSERT INTO `scan` VALUES ('426', '2016-11-26 22:35:29', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('427', '2016-11-26 22:35:46', '12', '3', 'qwert');
INSERT INTO `scan` VALUES ('428', '2016-11-26 22:36:37', '12', '3', 'qwert');
INSERT INTO `scan` VALUES ('429', '2016-11-26 22:36:51', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('430', '2016-11-26 22:37:02', '13', '3', 'qwert');
INSERT INTO `scan` VALUES ('431', '2016-11-26 22:37:10', '12', '3', 'qwert');
INSERT INTO `scan` VALUES ('432', '2016-11-26 22:37:24', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('433', '2016-11-26 22:38:01', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('434', '2016-11-26 22:38:06', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('435', '2016-11-26 22:38:44', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('436', '2016-11-26 22:38:46', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('437', '2016-11-26 22:38:59', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('438', '2016-11-26 22:39:22', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('439', '2016-11-26 22:39:23', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('440', '2016-11-26 22:39:32', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('441', '2016-11-26 22:39:35', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('442', '2016-11-26 22:40:50', '13', '3', 'qwert');
INSERT INTO `scan` VALUES ('443', '2016-11-27 08:25:15', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('444', '2016-11-27 08:45:48', '11', '3', 'qwert');
INSERT INTO `scan` VALUES ('445', '2016-11-27 09:14:51', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('446', '2016-11-27 09:16:55', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('447', '2016-11-27 09:16:57', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('448', '2016-11-27 09:16:58', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('449', '2016-11-27 09:16:59', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('450', '2016-11-27 09:16:59', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('451', '2016-11-27 09:17:34', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('452', '2016-11-27 09:17:37', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('453', '2016-11-27 09:17:41', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('454', '2016-11-27 09:18:46', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('455', '2016-11-27 09:20:12', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('456', '2016-11-27 09:20:49', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('457', '2016-11-27 09:20:56', '11', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('458', '2016-11-27 09:21:00', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('459', '2016-11-27 09:22:02', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('460', '2016-11-27 09:22:29', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('461', '2016-11-27 09:22:35', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('462', '2016-11-27 09:22:44', '12', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('463', '2016-11-27 09:23:48', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('464', '2016-11-27 09:30:35', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('465', '2016-11-27 09:31:47', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('466', '2016-11-27 09:32:53', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('467', '2016-11-27 09:33:06', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('468', '2016-11-27 09:34:46', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('469', '2016-11-27 09:40:27', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('470', '2016-11-27 09:43:26', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('471', '2016-11-27 09:52:12', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('472', '2016-11-27 09:52:46', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('473', '2016-11-27 09:54:47', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('474', '2016-11-27 09:56:09', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('475', '2016-11-27 10:00:19', '9', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('476', '2016-11-27 10:00:31', '7', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('477', '2016-11-27 10:00:56', '7', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('478', '2016-11-27 10:53:41', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('479', '2016-11-27 11:28:28', '21', '3', 'qwert');
INSERT INTO `scan` VALUES ('480', '2016-11-27 15:03:42', '22', '3', 'qwert');
INSERT INTO `scan` VALUES ('482', '2016-11-27 15:43:27', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('483', '2016-11-27 15:49:59', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('484', '2016-11-27 15:57:27', '13', '4', 'awtetrr');
INSERT INTO `scan` VALUES ('485', '2016-11-27 19:38:44', '22', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('486', '2016-11-28 09:12:32', '22', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('487', '2016-11-28 09:12:36', '22', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('488', '2016-11-28 09:14:57', '21', '4', 'awtetrr');
INSERT INTO `scan` VALUES ('489', '2016-11-28 09:29:28', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('490', '2016-11-28 09:29:35', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('491', '2016-11-28 09:36:19', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('492', '2016-11-28 21:46:38', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('493', '2016-11-28 21:47:05', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('494', '2016-11-28 21:55:41', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('495', '2016-11-29 10:11:32', '21', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('496', '2016-11-29 10:20:24', '22', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('497', '2016-11-30 17:01:51', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('498', '2016-11-30 17:03:57', '13', '1', 'jiaoxiangyu');
INSERT INTO `scan` VALUES ('499', '2016-11-30 17:06:13', '13', '1', 'jiaoxiangyu');
