/** 玩去网数据库2.0**/
SET NAMES UTF8;
DROP DATABASE IF EXISTS wanqu;
CREATE DATABASE wanqu CHARSET=UTF8;
USE wanqu;
/**用户表**/
CREATE TABLE user(
	uid INT PRIMARY KEY AUTO_INCREMENT,		#用户id（自增）
	uname VARCHAR(16),				#用户名
	password VARCHAR(32),				#用户密码
	gender BOOL,						#用户性别(1-->男 0-->女)
	email VARCHAR(16),				#用户邮箱
	phone CHAR(11),					#联系电话
	user_name VARCHAR(50)	,			#用户真实姓名
	avatar VARCHAR(50),				#用户头像
	level BOOL						#用户级别  1->管理员   0->普通用户  
);
INSERT INTO user VALUES
(1,'admin',md5('123456'),1,'','15057489986','admin','',1),
(2,'jarvis',md5('456789'),1,'','13077845611','jarvis','',0),
(3,'tom',md5('456789'),1,'','13515763248','tom','',0),
(4,'jerry',md5('456789'),0,'','15845672233','jerry','',0),
(5,'kaier',md5('456789'),1,'','15845457433','kaier','',0),
(6,'ricton',md5('456789'),1,'','17785672233','ricton','',0),
(7,'blook',md5('456789'),1,'','18345236723','blook','',0),
(8,'lucy',md5('456789'),0,'','13767582233','lucy','',0);
/**用户订单**/
CREATE TABLE wanqu_order(
	aid INT PRIMARY KEY AUTO_INCREMENT,	#订单编号
	status INT,						#订单状态  1-完成订单  2-未使用  3-已使用
	jingdian_time DATETIME,				#出游时间
	order_time DATETIME,				#下单时间
	jingdian_id INT,					#景点id
	jingdian_title VARCHAR(128),			#主标题
	count INT,						#购买数量
	client_name1 VARCHAR(10),			#客户姓名
	client_name2 VARCHAR(10),			#客户姓名
	client_name3 VARCHAR(10),			#客户姓名
	client_name4 VARCHAR(10),			#客户姓名
	client_name5 VARCHAR(10),			#客户姓名
	client_name6 VARCHAR(10),			#客户姓名
	client_name7 VARCHAR(10),			#客户姓名
	client_name8 VARCHAR(10),			#客户姓名
	client_name9 VARCHAR(10),			#客户姓名
	uid INT							#购买该订单的用户id
);
INSERT INTO wanqu_order VALUES
(null,1,now(),now(),211,'西塘古镇 5A景区',6,'tom','jerry','jax','fuizt','garen','lucy','','','',2),
(null,1,now(),now(),212,'杭州宋城 4A景区',6,'文化','东东','然然','亮亮','涛涛','琪琪','','','',3),
(null,1,now(),now(),213,'南浔古镇 5A景区',6,'诸葛孔明','王司徒','燕人张飞','锦马超','既生瑜','袁本初','','','',4),
(null,1,now(),now(),214,'横店影视城 5A景区',6,'盖伦','艾希','奎因','瑞文','贾克斯','雷克顿','','','',5),
(null,1,now(),now(),215,'普陀山 5A景区',6,'宋公明','智多星','小李广','黑旋风','高太尉','母夜叉','','','',4),
(null,1,now(),now(),216,'乌镇 5A景区',6,'贾宝玉','薛宝钗','王熙凤','林黛玉','刘姥姥','贾政经','','','',4),
(null,1,now(),now(),217,'西溪国家湿地公园 5A景区',6,'万圣龙王','金公木母','黎山老母','卯日星君','太白金星','天蓬元帅','','','',4),
(null,1,now(),now(),218,'临安湍口众安氡温泉',6,'宋公明','智多星','小李广','黑旋风','高太尉','母夜叉','','','',6);

/**景点表**/
CREATE TABLE jingdian(
	jingdian_id INT PRIMARY KEY AUTO_INCREMENT, 
	id INT,						#景点id
	title VARCHAR(128),				#主标题
	subtitle VARCHAR(128),			#副标题
	price DECIMAL(10,2),			#价格
	pic VARCHAR(100)					#展示图片
);
/** 当季热玩  **/
INSERT INTO jingdian VALUES
("null",211,'西塘古镇 5A景区','水墨西塘让你感受古镇千年的诗情画意',55,'images/djrw/xitang/djrwxtgzpic1.jpg'),
("null",212,'杭州宋城 4A景区','一生必看的演出',50,'images/djrw/songcheng/djrwscpic1.jpg'),
("null",213,'南浔古镇 5A景区','水乡古镇九十九，不如南浔走一走',40,'images/djrw/nanxun/djrwnxgzpic1.jpg'),
("null",214,'横店影视城 5A景区','被誉为“中国好莱坞”',80,'images/djrw/hengdian/djrwhdpic1.jpg'),
("null",215,'普陀山 5A景区','海天佛国 观音道场 ——普陀山',120,'images/djrw/putuoshan/djrwptspic1.jpg'),
("null",216,'乌镇 5A景区','鱼米之乡，丝绸之府',70,'images/djrw/wuzhen/djrwwzpic1.jpg'),
("null",217,'西溪国家湿地公园 5A景区','游《非诚勿扰》拍摄地，感受湿地水乡浪漫',85,'images/djrw/xixi/djrwxxsdpic1.jpg'),
("null",218,'临安湍口众安氡温泉','夏凉冬温，隆冬暖薰蒸，垒垒上浮',208,'images/djrw/linan/djrwlatkpic1.jpg');
/*
("null",219,'曼谷大皇宫','泰国的地标,是曼谷王朝的象征',360,''),
("null",220,'日本北海道4或5日游','情迷札幌 烂漫小樽 雪漫漫天 大棕熊 小企鹅 滑雪场 A线粉雪北国4日 B线粉雪北国5日 C线亲子滑雪双温泉',5360,'');
*/

/** 轮播图 **/
INSERT INTO jingdian VALUES
("null",151,'<丽江-大理-香格里拉双飞6日游>春节预售/洱海海景房/2晚希尔顿花园/1晚供氧藏式酒店/全程蜜月大床/玉龙雪山冰川大索/两大表演/云南邂逅海鸥','',5200,'images/lunbo/lbtgn/lbtgn.png'),
("null",152,'<日本东京-富士山-京都-大阪6日游>97超高满意度半自助标杆 东京大阪各一天自由 市区酒店位置极佳方便出游 GH高端酒店纯玩 DE东京一天自由 1元换wifi','',6300,'images/lunbo/lbtgt/lbtgt.png'),
("null",153,'<迪拜4-9晚自由行>全程酒店自选，五星万豪/六星亚特/七星帆船/八星皇宫等，总有一款适合您，接送玩乐均可定制，行程DIY，玩转沙漠绿洲','',6800,'images/lunbo/lbtgw/lbtgw.png'),
("null",154,'<千岛湖中心湖区梅峰岛1日游>纯玩5个精华岛 门船票已含 登梅峰岛之巅 主城区酒店可免费接','',2300,'images/lunbo/lbtzb/lbtzb.png');
/**景点图片表**/
CREATE TABLE jingdian_pic(
	jingdian_pic_id INT PRIMARY KEY AUTO_INCREMENT, 
	id INT,				#景点id
	pic VARCHAR(100),		#景点图片
	content TEXT			#介绍 
);
/** 杨见阳当季热玩图片 **/
/** 西塘古镇图片 **/
INSERT INTO jingdian_pic VALUES
("null",211,'images/djrw/xitang/djrwxtgzpic1.jpg',''),
("null",211,'images/djrw/xitang/djrwxtgzpic2.jpg',''),
("null",211,'images/djrw/xitang/djrwxtgzpic3.jpg',''),
("null",211,'images/djrw/xitang/djrwxtgzpic4.jpg',''),
("null",211,'images/djrw/xitang/djrwxtgzpic5.jpg',''),
("null",211,'images/djrw/xitang/djrwxtgzpic6.jpg',''),
("null",211,'images/djrw/xitang/djrwxtgzpic7.jpg',''),
("null",211,'images/djrw/xitang/djrwxtgzpic8.jpg',''),
("null",211,'images/djrw/xitang/djrwxtgzpic9.jpg',''),
("null",211,'images/djrw/xitang/djrwxtgzpic10.jpg',''),
("null",211,'images/djrw/xitang/djrwxtgzpicqt01.jpg','西塘风景秀丽，人才辈出，文化底蕴深厚。据统计，西塘历史上这里曾出过进士十九人，举人三十一人。周鼎在《萍川十景诗》中描绘了西塘许多的景致，如西塘晓市、北翠春耕、南泓夜泛、环秀断虹、雁塔湾头等，揭示了古镇西塘当时的生活场景，展示了西塘一幅幅美丽的画卷。'),
("null",211,'images/djrw/xitang/djrwxtgzpicqt02.jpg','西塘素以桥多、弄多、廊棚多而闻名。西塘民风淳厚，橹声悠扬，到处洋溢着中国古代传统文化特有的人文积淀。西塘古镇是专家们研究“江南水乡民俗文化”的圣地；艺术家们描绘“江南水乡民俗文化”的基地；游客们品味“江南水乡民俗文化”的净地。'),
("null",211,'images/djrw/xitang/djrwxtgzpicqt03.jpg','西塘人有闲情意志，喜欢养鸟种花，有“杜鹃之乡”的美誉。从清代中期已有人开始种养，杜鹃花生性娇嫩，要细心栽培，种养杜鹃也是修身养性的行为。'),
("null",211,'images/djrw/xitang/djrwxtgzpicqt04.jpg','西街：西塘东西走向的主要街道，分上下两段，东为上，西为下，所以有上西街和下西街之分。西街有着水乡极为典型的街道格局，即一根扁担的宽度。'),
("null",211,'images/djrw/xitang/djrwxtgzpicqt05.jpg','塘东街：塘东街上有许多酒楼，以前有“借问酒家何处有，胥塘河边处处楼”的说法。说起这条商业街不得不说说西塘的商人。有位来西塘的作者说：西塘是儒商文化与平民文化的交会点。'),
("null",211,'images/djrw/xitang/djrwxtgzpicqt06.jpg','烧香港：烧香港不是要把香港烧了的意思，而是以前河道两岸庙宇众多，善男信女们乘着小船来此烧香，故名烧香港。西塘烧香港的景点有倪天增祖居纪念馆、五福桥、圣堂、明清木雕馆等。'),
("null",211,'images/djrw/xitang/djrwxtgzpicqt07.jpg','塔湾街：塔湾街因西面原有一寺庙名雁塔禅院，又地处市河转弯处而得名。这一带在明时酒店云集，明代有一诗人周鼎写了一首《西塘晓市》来描写这里的繁华：旭日满晴川，翩翩贾客船。'),
("null",211,'images/djrw/xitang/djrwxtgzpicqt08.jpg','这里的街道临河而建，商铺的生意就在河边做成。往昔，水乡农家的出行以河为道，以舟代步，许多交易只能在船上岸边进行，为此，一种连接河道与店铺又可遮阳避雨的特殊建筑———廊棚便应运而生，并代代传承，相沿成习。'),
("null",211,'images/djrw/xitang/djrwxtgzpicqt09.jpg','西塘是个平民化的小镇，所有一切都如此朴素，没有周庄的繁华，没有南浔的富甲之态，没有浓厚的商业氛围，但是西塘的独特魅力令留宿旅者陶醉。西塘是古典的，也是现代的。');
/** 杭州宋城图片  **/
INSERT INTO jingdian_pic VALUES
("null",212,'images/djrw/songcheng/djrwscpic1.jpg',''),
("null",212,'images/djrw/songcheng/djrwscpic2.jpg',''),
("null",212,'images/djrw/songcheng/djrwscpic3.jpg',''),
("null",212,'images/djrw/songcheng/djrwscpic4.jpg',''),
("null",212,'images/djrw/songcheng/djrwscpic5.jpg',''),
("null",212,'images/djrw/songcheng/djrwscpic6.jpg',''),
("null",212,'images/djrw/songcheng/djrwscpic7.jpg',''),
("null",212,'images/djrw/songcheng/djrwscpic8.jpg',''),
("null",212,'images/djrw/songcheng/djrwscpic9.jpg',''),
("null",212,'images/djrw/songcheng/djrwscpic10.jpg',''),
("null",212,'images/djrw/songcheng/djrwscpicqt01.jpg','民俗表演，走进宋城，春节逛庙会、春天锅庄狂欢节、夏季泼水节、秋季火把节，既可观看大型的室外民俗表演，你也可以尽情地参与到宋城精心设置的跳锅庄舞、泼水狂欢等体验环节中来。'),
("null",212,'images/djrw/songcheng/djrwscpicqt02.jpg','惊悚挑战，在宋城，你还可以体验到“江南怪街”各种稀奇古怪的事情，兰若寺和惊悚鬼屋，给人身临其境的惊悚体验，恐惧蔓延全身。'),
("null",212,'images/djrw/songcheng/djrwscpicqt03.jpg','失落古城，宋城内另有一座神秘的“城中城”：失落古城。这是一处链接过去、现代与未来的神秘空间。它以前卫的高科技手段表现传统文化主题，可以现代娱乐精神穿越体验古老文明。'),
("null",212,'images/djrw/songcheng/djrwscpicqt04.jpg','佛文化，宋城再现了东南佛国的奇观，四大佛窟、佛窟探秘、十八罗汉台、五佛堂、月老祠、还有巨大的释迦牟尼造像……让你感受浓重佛文化氛围。'),
("null",212,'images/djrw/songcheng/djrwscpicqt05.jpg','美味小吃，漫步千年古街，琳琅满目的各式小吃，会刺激到你的视觉，让你的味蕾得到尽情的享受。');
/** 南浔古镇图片 **/
INSERT INTO jingdian_pic VALUES
("null",213,'images/djrw/nanxun/djrwnxgzpic1.jpg',''),
("null",213,'images/djrw/nanxun/djrwnxgzpic2.jpg',''),
("null",213,'images/djrw/nanxun/djrwnxgzpic3.jpg',''),
("null",213,'images/djrw/nanxun/djrwnxgzpic4.jpg',''),
("null",213,'images/djrw/nanxun/djrwnxgzpic5.jpg',''),
("null",213,'images/djrw/nanxun/djrwnxgzpic6.jpg',''),
("null",213,'images/djrw/nanxun/djrwnxgzpic7.jpg',''),
("null",213,'images/djrw/nanxun/djrwnxgzpic8.jpg',''),
("null",213,'images/djrw/nanxun/djrwnxgzpic9.jpg',''),
("null",213,'images/djrw/nanxun/djrwnxgzpic10.jpg',''),
("null",213,'images/djrw/nanxun/djrwnxgzpicqt01.jpg','百间楼'),
("null",213,'images/djrw/nanxun/djrwnxgzpicqt02.jpg','绣球定终身'),
("null",213,'images/djrw/nanxun/djrwnxgzpicqt03.jpg','桃花游船'),
("null",213,'images/djrw/nanxun/djrwnxgzpicqt04.jpg','淳朴静谧'),
("null",213,'images/djrw/nanxun/djrwnxgzpicqt05.jpg','小莲庄'),
("null",213,'images/djrw/nanxun/djrwnxgzpicqt06.jpg','CCTV颁发-大门招牌');
/** 横店影视城图片 **/
INSERT INTO jingdian_pic VALUES
("null",214,'images/djrw/hengdian/djrwhdpic1.jpg',''),
("null",214,'images/djrw/hengdian/djrwhdpic2.jpg',''),
("null",214,'images/djrw/hengdian/djrwhdpic3.jpg',''),
("null",214,'images/djrw/hengdian/djrwhdpic4.jpg',''),
("null",214,'images/djrw/hengdian/djrwhdpic5.jpg',''),
("null",214,'images/djrw/hengdian/djrwhdpic6.jpg',''),
("null",214,'images/djrw/hengdian/djrwhdpic7.jpg',''),
("null",214,'images/djrw/hengdian/djrwhdpic8.jpg',''),
("null",214,'images/djrw/hengdian/djrwhdpic9.jpg',''),
("null",214,'images/djrw/hengdian/djrwhdpic10.jpg',''),
("null",214,'images/djrw/hengdian/djrwhdpicqt01.jpg','横店梦幻谷给你一个梦想乐园，夏日戏水乐园。'),
("null",214,'images/djrw/hengdian/djrwhdpicqt02.jpg','“明清宫苑”是按照北京紫禁城一比一的比例修建的，占地1500亩,汇聚了京城宫殿、皇家园林、王府衙门、胡同民宅等四大建筑系列，真实地再现了北京故宫原貌及老北京民居。'),
("null",214,'images/djrw/hengdian/djrwhdpicqt03.jpg','秦王宫，四海归一殿（正殿）分前殿、中殿、后殿，纵深长达120多米。宫殿气宇之轩昂，仅此便可略见一斑。'),
("null",214,'images/djrw/hengdian/djrwhdpicqt04.jpg','清明上河图，踏上“汴河”上最雄伟的桥“虹桥”两岸风光 尽收眼底，《清明上河图》是以虹桥为中心，沿汴河展开描绘的精彩画面。汴河蜿蜒，河水清澈，波光粼粼，再现了千年前北宋东京汴河漕运景象。'),
("null",214,'images/djrw/hengdian/djrwhdpicqt05.jpg','万盛街，横店影视城的美食，因为世界各地明星和游客的络绎不绝而愈发丰富多彩，几乎所有的风味都能在横店影视城口尝到。南北小吃加上地方名点，横店影视城之旅也完全可以是一次饕餮之旅。');
/** 普陀山图片 **/
INSERT INTO jingdian_pic VALUES
("null",215,'images/djrw/putuoshan/djrwptspic1.jpg',''),
("null",215,'images/djrw/putuoshan/djrwptspic2.jpg',''),
("null",215,'images/djrw/putuoshan/djrwptspic3.jpg',''),
("null",215,'images/djrw/putuoshan/djrwptspic4.jpg',''),
("null",215,'images/djrw/putuoshan/djrwptspic5.jpg',''),
("null",215,'images/djrw/putuoshan/djrwptspic6.jpg',''),
("null",215,'images/djrw/putuoshan/djrwptspic7.jpg',''),
("null",215,'images/djrw/putuoshan/djrwptspic8.jpg',''),
("null",215,'images/djrw/putuoshan/djrwptspicqt01.jpg','磐陀石，在普陀山梅岭峰梅福庵西行不远处，一片开阔的山顶平台上，有一对看似摇摇欲坠，实则稳如磐石的巨石——磐陀石，相传这里就是观音大士的说法处。'),
("null",215,'images/djrw/putuoshan/djrwptspicqt02.jpg','千步沙，沙色如金，纯净松软，宽坦软美，犹如锦茵设席，人行其上，不濡不陷。'),
("null",215,'images/djrw/putuoshan/djrwptspicqt03.jpg','潮音洞半浸海中，洞口朝大海，日夜被海浪击拍着，潮水奔腾入洞口，声若雷鸣，洞内怪石交错，层层叠叠，颇有看点。');
/** 乌镇图片 **/
INSERT INTO jingdian_pic VALUES
("null",216,'images/djrw/wuzhen/djrwwzpic1.jpg',''),
("null",216,'images/djrw/wuzhen/djrwwzpic2.jpg',''),
("null",216,'images/djrw/wuzhen/djrwwzpic3.jpg',''),
("null",216,'images/djrw/wuzhen/djrwwzpic4.jpg',''),
("null",216,'images/djrw/wuzhen/djrwwzpic5.jpg',''),
("null",216,'images/djrw/wuzhen/djrwwzpic6.jpg',''),
("null",216,'images/djrw/wuzhen/djrwwzpic7.jpg',''),
("null",216,'images/djrw/wuzhen/djrwwzpic8.jpg',''),
("null",216,'images/djrw/wuzhen/djrwwzpic9.jpg',''),
("null",216,'images/djrw/wuzhen/djrwwzpic10.jpg',''),
("null",216,'images/djrw/wuzhen/djrwwzpicqt01.jpg','江南百床馆，展出江南古床的博物馆，面积约1200多平方米，内收数十张明、清、近代的江南古床精品。'),
("null",216,'images/djrw/wuzhen/djrwwzpicqt02.jpg','宏源泰染坊始创于宋元年间，原址在南栅，清光绪迁址于此，系蓝印花布制作基地，也是蓝印花布制品集散中心。在宏源泰染坊，可以欣赏到祖祖辈辈留下的手艺。'),
("null",216,'images/djrw/wuzhen/djrwwzpicqt03.jpg','桥是江南水乡古镇不可或缺的，大多始建或重建于明清，有些桥还题有桥联。');
/** 西溪国家湿地公园图片 **/
INSERT INTO jingdian_pic VALUES
("null",217,'images/djrw/xixi/djrwxxsdpic1.jpg',''),
("null",217,'images/djrw/xixi/djrwxxsdpic2.jpg',''),
("null",217,'images/djrw/xixi/djrwxxsdpic3.jpg',''),
("null",217,'images/djrw/xixi/djrwxxsdpic4.jpg',''),
("null",217,'images/djrw/xixi/djrwxxsdpic5.jpg',''),
("null",217,'images/djrw/xixi/djrwxxsdpic6.jpg',''),
("null",217,'images/djrw/xixi/djrwxxsdpic7.jpg',''),
("null",217,'images/djrw/xixi/djrwxxsdpic8.jpg',''),
("null",217,'images/djrw/xixi/djrwxxsdpicqt01.jpg','渔庄烟雨的“烟雨”，有“柳烟、云烟、炊烟”三烟之妙，人、烟、水共处，犹如身临仙境。'),
("null",217,'images/djrw/xixi/djrwxxsdpicqt02.jpg','秋芦飞雪所处地理位置在蒹葭深处，金秋时节，游人可以泛舟徐徐融入芦苇的世界，也可以登秋雪庵弹指楼，观秋芦遍野，赏芦花胜雪，乃西溪一绝。'),
("null",217,'images/djrw/xixi/djrwxxsdpicqt03.jpg','“河渚听曲”以河渚街为中心，辐射古荡蒋村集市及周边区域，着重体现当地作为北派越剧发源地的特殊地位，以及延绵至今，依旧生生不息、绚丽多彩的民俗文化。'),
("null",217,'images/djrw/xixi/djrwxxsdpicqt04.jpg','西溪梅墅一带沿岸有许多梅树，水域曲折，河道迂回，便如梅树的枝条一样虬曲。而西溪的梅枝亦苍劲嶙峋、风韵洒落，多变而有规律，呈现出一种很强的力度和线的韵律感。'),
("null",217,'images/djrw/xixi/djrwxxsdpicqt05.jpg','莲花滩生态保护区位于西溪腹地，是西溪主要的观鸟区，植被丰茂，绿水环绕，鹭鸟飞翔天际，鸣禽宛转丛林，生意盎然，野趣纷呈。');
/** 临安湍口众安氡温泉图片 **/
INSERT INTO jingdian_pic VALUES
("null",218,'images/djrw/linan/djrwlatkpic1.jpg',''),
("null",218,'images/djrw/linan/djrwlatkpic2.jpg',''),
("null",218,'images/djrw/linan/djrwlatkpic3.jpg',''),
("null",218,'images/djrw/linan/djrwlatkpic4.jpg',''),
("null",218,'images/djrw/linan/djrwlatkpic5.jpg',''),
("null",218,'images/djrw/linan/djrwlatkpic6.jpg',''),
("null",218,'images/djrw/linan/djrwlatkpic7.jpg',''),
("null",218,'images/djrw/linan/djrwlatkpic8.jpg',''),
("null",218,'images/djrw/linan/djrwlatkpicqt01.jpg','室内温泉区，不仅能促进血液循环，加速新陈代谢，且温泉本身的矿物质透过表皮渗入身体皮肤时，其美容、美肤效果更为突显。'),
("null",218,'images/djrw/linan/djrwlatkpicqt02.jpg','户外温泉区，消除疲劳，促进新陈代谢，与日光浴相结合。'),
("null",218,'images/djrw/linan/djrwlatkpicqt03.jpg','蒸房，用于驱风、袪寒、暖体活血、温肤靓颜，给您宫廷版的享受。'),
("null",218,'images/djrw/linan/djrwlatkpicqt04.jpg','儿童戏水区，小朋友的乐园，在这里，可以尽情嬉戏玩耍。');
/** 大皇宫 **/
INSERT INTO jingdian_pic VALUES
("null",219,'images/djrw/dahaunggong/djrwdhgpic1.jpg','');
/** 大皇宫 **/
INSERT INTO jingdian_pic VALUES
("null",220,'images/djrw/beihaidao/djrwbhdpic1.jpg','');

/**史前风**/
/** 轮播图景点主页图片 **/
/** 轮播图图一 **/
INSERT INTO jingdian_pic VALUES
("null",151,'images/lunbo/lbtgn/lbtgn.png',''),
("null",151,'images/lunbo/lbtgn/lbtgn1.jpg',''),
("null",151,'images/lunbo/lbtgn/lbtgn2.jpg',''),
("null",151,'images/lunbo/lbtgn/lbtgn3.jpg',''),
("null",151,'images/lunbo/lbtgn/lbtgn4.jpg',''),
("null",151,'images/lunbo/lbtgn/lbtgn5.jpg',''),
("null",151,'images/lunbo/lbtgn/lbtgnjd1.jpg','丽江束河古镇好玩吗？如果说丽江的大研古镇是一位看一眼就让人闪光的大家闺秀，那么，十里之外的束河古镇则是一位清新脱俗，让人回味无穷的小家碧玉。束河的魅力在于它本身散发出来的一种静，不同于丽江古城的喧嚣，束河是适合发呆的地方，静静的享受。'),
("null",151,'images/lunbo/lbtgn/lbtgnjd2.jpg','马帮荣归·长桌宴，寻觅茶马古道，宴遇马帮荣归一千四百多年前，一支支全副武装的马帮，穿行在滇西横断山脉的高山密林中，足迹踏遍大理，西双版纳，普洱，香格里拉，直到印度，尼泊尔等地，长途跋涉，历经千险。今天，您有幸遇到来自大研花巷的马帮队伍，满载返乡，荣归故里。和阿伯为马帮兄弟们接风洗尘，商议阿西达出嫁事宜，马帮兄弟们与家人们相见会发生怎样的故事？'),
("null",151,'images/lunbo/lbtgn/lbtgnjd3.jpg','在丽江丰盛的宴席当属浓缩了丽江饮食文化及民俗精髓的八大碗。因此，长桌宴也用纳西八大碗来款待归来的马帮和四方宾朋，纳西八大碗以八个地道的大土碗为容器，所用原料均是绿色生态，方法原生古朴，味道香醇。'),
("null",151,'images/lunbo/lbtgn/lbtgnjd4.jpg','丽江古城又名大研古城，是一座风景秀丽，历史悠久和文化灿烂的名城，也是中国罕见的保存相当完好的少数民族古镇，世界文化遗产，丽江古城是中国历史文化名城中唯一两个没有城墙的古城之一。当夜幕降临，灯光乍起的时候，那星星点点的灯光，是夜幕中的一群群萤火虫，实在好看。'),
("null",151,'images/lunbo/lbtgn/lbtgnjd5.jpg','乘车前往玉龙雪山风景区， 游览4506米的【冰川公园】（含大索道）【蓝月谷景区】（不含蓝月谷电瓶车50元/人），游览时间约为1.5小时，不含排队上山和上索道时间。中餐安排雪厨自助餐（儿童超过1.2米需要补足24元/人餐差）。'),
("null",151,'images/lunbo/lbtgn/lbtgnjd6.jpg','大型歌舞《丽江千古情》是丽江文化的魂，用IMAX3D的大片视觉，重现《纳西创世纪》、《泸沽女儿国》、《马帮传奇》、《古道今风》、《玉龙第三国》等丽江长达千年的历史与传说，引领观众穿越雪山， 在旷远原始的洪荒之域、在泸沽湖畔的摩梭花楼、在挟风裹雨的茶马古道、在曼舞欢歌的古道重镇、在浪漫凄情的玉龙第三国、在世外桃源般的香巴拉相约一场风花雪月的邂逅，感受一个美丽的时刻。'),
("null",151,'images/lunbo/lbtgn/lbtgnjd7.jpg','寻觅茶马古道，宴遇马帮荣归，一千四百多年前，一支支全副武装的马帮，穿行在滇西横断山脉的高山密林中，足迹踏遍大理，西双版纳，普洱，香格里拉，直到印度，尼泊尔等地，长途跋涉，历经千险。今天，您有幸遇到来自大研花巷的马帮队伍，满载返乡，荣归故里。'),
("null",151,'images/lunbo/lbtgn/lbtgnjd8.jpg','以藏王为核心主题，邀您共享“王的盛宴”。 醉美香格里拉民族歌舞晚会，融入了本地藏族特色舞蹈《锅庄》、《弦子》、《热巴》等民族特色的一场歌舞表演，让游客欣赏藏族正宗传统民族民俗文化。晚餐为您安排补充高原能量的当地特色【牦牛小火锅】，让您享受视觉上的盛宴。');
/** 轮播图图二 **/
INSERT INTO jingdian_pic VALUES
("null",152,'images/lunbo/lbtgt/lbtgt.png',''),
("null",152,'images/lunbo/lbtgt/lbtgt1.jpg',''),
("null",152,'images/lunbo/lbtgt/lbtgt2.jpg',''),
("null",152,'images/lunbo/lbtgt/lbtgt3.jpg',''),
("null",152,'images/lunbo/lbtgt/lbtgt4.jpg',''),
("null",152,'images/lunbo/lbtgt/lbtgtjd1.jpg','写在前面，旅行不仅仅是美景和目的地，还在于感受沿途的那些人那些事，和那些曾经发生在这片土地上的点点滴滴。
行程亦不仅仅是我们通常所说的吃住行游购娱，更在于那些无形的感观和服务， 一声问候、一个微笑、一份如家人般的体贴和关心...
没有本职之外的不管不顾，没有黄婆卖瓜的自卖自夸， 取而代之的是从心底发散而来的真诚和热情，消融了阻隔在游客和导游之间的雪墙。我不仅是你的向导，我还是你的朋友。
我们的领队团队是一群平均年龄35岁的爱和暖意的传播者，拥有平均10年以上的带队经验，其中不乏出境旅游规模成行以来的第一批领队。专业、贴心、热忱是我们的标签和宗旨， 以下截取了部分参团归来的游客对我们领队导游的评价。'),
("null",152,'images/lunbo/lbtgt/lbtgtjd2.jpg','一句话看懂各线路
【默认行程】：大阪起东京止，大阪东京两天自由活动，市区精品酒店，方便自由活动。
【东阪两天自由】：与默认行程起止点相反，东京起大阪或名古屋止，其他内容一样
【名名两天自由】：名古屋起止，大阪-京都-中部-富士山-东京-名古屋，其他内容与默认行程一样。
【东名一天自由】：此行程东京起名古屋或大阪止，东京一天自由活动，升级一晚市区高品质酒店，2晚连住东京市内及1晚和风温泉酒店。
【名东一天自由】：与东名一天自由起止点相反，名古屋或大阪起东京止。
【阪东纯玩升级】：大阪起东京止，纯玩，升级酒店住宿，升级餐食，1-2天自由活动可切换
【东阪纯玩升级】：东京起大阪止，纯玩，升级酒店住宿，升级餐食，1-2天自由活动可切换
【东阪两天自由2】：与【东阪两天自由】类似，航班和景点作微调
东/阪/名，指的是东京、大阪、名古屋等进出口岸，进出口岸的不同可能会影响总体行车时间以及舒适度，请您在订购前确认相应团期的进出口岸和航班信息。');
/** 轮播图图三 **/
INSERT INTO jingdian_pic VALUES
("null",153,'images/lunbo/lbtgw/lbtgw.png',''),
("null",153,'images/lunbo/lbtgw/lbtgw1.jpg',''),
("null",153,'images/lunbo/lbtgw/lbtgw2.jpg',''),
("null",153,'images/lunbo/lbtgw/lbtgw3.jpg',''),
("null",153,'images/lunbo/lbtgw/lbtgw4.jpg',''),
("null",153,'images/lunbo/lbtgw/lbtgw5.jpg',''),
("null",153,'images/lunbo/lbtgw/lbtgwjd1.jpg','迪拜 中东最富裕的城市
迪拜是一座国际化大都市，也是阿拉伯联合酋长国最大和人口最多的城市，中东最富裕的城市。境内旅游资源丰富，有被称为世界第八大奇迹的群岛，也有浓郁的沙漠风情。除此之外，还有诸多国际之最的建筑，同时也是超于香港的购物天堂。
风景名胜
迪拜著名景点有：哈利法塔：又称迪拜大厦或比斯迪拜塔，是位于阿联酋迪拜的一栋已经建成的摩天大楼，有162层，比台北101足足高出320米。地球群岛：又名世界群岛，被称为世界第八大奇迹。阿拉伯塔酒店：全世界最豪华的酒店，世界上唯一的7星级酒店。沙漠风情：在黄金沙漠冲沙可切身感受阿拉伯文化的魅力。购物中心：是世界上最大的购物中心，内有世界上最大的水族馆以及一条到达迪拜塔的官方通道。朱美拉清真寺：是迪拜最大最美的清真寺之一，也是迪拜地标之一，同时也是摄影师喜欢拍摄的地点。国家博物馆：迪拜少数几个提供当地历史文物的景点之一，是迪拜最古老的建筑物。迪拜河：也称为迪拜海沟，是感受迪拜脉搏的地方。
最佳旅游时间
11月至次年3月为佳，这时是冬季，平均气温9-25℃。此外，炎炎夏日也因为缤纷多彩的狂欢变得不再那么漫长无聊。在阿联酋旅游最大的威胁就是被日光晒伤和脱水。夏季的阳光非常强烈，在户外活动时要穿长袖衣服，戴帽子，暴露部位要抹防晒霜，多饮水。');
/** 轮播图图四 **/
INSERT INTO jingdian_pic VALUES
("null",154,'images/lunbo/lbtzb/lbtzb.png',''),
("null",154,'images/lunbo/lbtzb/lbtzb1.jpg',''),
("null",154,'images/lunbo/lbtzb/lbtzb2.jpg',''),
("null",154,'images/lunbo/lbtzb/lbtzb3.jpg',''),
("null",154,'images/lunbo/lbtzb/lbtzb4.jpg',''),
("null",154,'images/lunbo/lbtzb/lbtzbjd1.jpg','千岛湖，位于浙江省杭州西郊的淳安县境内，以“山青、水秀、洞奇、石怪、人美”著称。著名诗人郭沫若 也有留下过“西子三千个，群山已失高，峰峦成岛屿，平地卷波涛”的绝美诗句。本行程主要游览千岛湖中心湖区--月光岛、梅峰岛，具体参考以下行程！'),
("null",154,'images/lunbo/lbtzb/lbtzbjd2.jpg','月光岛，是千岛湖具浪漫气息和人气人文底蕴的景区。它以“爱情”为主线，缀有“情、系、心、梦”四园以及接纳游人摆渡上岛，“当一天岛主”的逸园，间以“连心、幸运、状元”三桥联系。'),
("null",154,'images/lunbo/lbtzb/lbtzbjd3.jpg','状元桥（25元，费用自理），惊险刺激，有惊无险。是为纪念“三元宰相”商辂及方逢晨、詹睽等三状元而建。人称“状元桥上走一走，高中状元就是我”；手划船（25元，费用自理），千岛湖水比较深，能与谁亲密接触的地方不多。'),
("null",154,'images/lunbo/lbtzb/lbtzbjd4.jpg',''),
("null",154,'images/lunbo/lbtzb/lbtzbjd5.jpg','梅峰岛位于皖浙交界处的千岛湖景区内，群岛星罗棋布、港湾纵横交错、生态环境绝佳。岛上现有人工栽种的各种梅树五千多株，红梅、绿梅、白梅、腊梅等居多。梅花盛开时，此处随成为千岛湖绝佳的赏梅胜地。登上梅峰观景台，天气晴好时，可以纵览湖区300余座大小岛屿，是目前千岛湖登高揽胜处。上山需要小爬十几分钟的山路，山路不多，台阶很缓，闲逛下来也别有一番山间妙趣。'),
("null",154,'images/lunbo/lbtzb/lbtzbjd6.jpg','');

/** 高勇 **/
/*景点表*/
INSERT INTO jingdian VALUES
("null",1,'<杭州临安-十门峡大酒店-自驾2日游>宿景区旁十门峡大酒店 含十门峡景区门票','览电影拍摄地 观生态风景区 尝试徒手攀岩 送酒店早餐',242,"images/zhoubian/lina/hzla01.jpg"),
("null",2,'<杭州-苏州-周庄-南京4日游>纯玩 游杭州西湖 赏苏式园林 漫步水墨周庄 逛六朝帝都南京 0购物哦','杭州出发 | 杭州成团 | 六朝古都 假山园林 水乡古镇',883,'images/zhoubian/zhouz/zhouzhuang01.jpg'),
("null",3,'<桐庐-温州港酒店-自驾2日游>大奇山国家森林公园/富春江小三峡严子陵钓台/瑶琳仙境/垂云通天河/琴溪香谷/红灯笼乡村家园/富春桃源/天子地生态旅游区/等多个景点，门票自选','天下佳山水 古今推富春 溶洞奇观 自然生态 风景秀丽 休闲度假',424,'images/zhoubian/wenz/wenzhou01.jpg'),
("null",4,'<浙江临安-华悦松泉度假酒店-自驾2日游>浙西大龙湾-龙井峡闯关/大明山/浙西大峡谷/河桥古镇/浙西十门峡/太湖源/氡温泉/西天目山等多个景点门票自选',' 山水如画 清新自然 浙西名山 风景秀丽 水上乐园 温馨度假',591,"images/zhoubian/huay/huayue01.jpg"),
("null",5,'<杭州-绍兴巴士2日游>游魅力西湖，文豪故里',' 杭州成团 | 文豪故里',232,"images/zhoubian/shaox/shaoxing01.jpg"),
("null",6,'<杭州-横店影视城-乌镇-西栅4日游>确保夜宿西栅内，2晚五星酒店，玩足西栅24h，东方好莱坞秦王宫，1车1导，杭州进出',' 杭州成团 | 爸妈游 亲子休闲 横店影视城 乌镇西栅 杭州西湖',1406,"images/zhoubian/wuz/wuzhen01.jpg"),
("null",7,'<杭州-无锡-上海3日游>纯玩 游杭州西湖 宋城 无锡三国水浒城 登东方明珠 叹繁华都市 可升级宋城千古情 另含双游船 无购物景点','杭州成团 | 湖光山色 烟雨江南 水乡古镇',709,"images/zhoubian/shangh/shanghai01.jpg"),
("null",8,'<杭州-无锡-南京3日游>纯玩 游杭州西湖 登雷峰塔 观三国水浒城 逛古都南京 赏烟雨中的江南 无购物景点','杭州成团 | 湖光山色 烟雨江南 六朝古都',763,"images/zhoubian/nanj/wuxi01.jpg");
/*景点介绍*/
INSERT INTO jingdian_pic VALUES 
("null",1,'images/zhoubian/lina/jsla01.jpg','十门峡大酒店.临安十门峡大酒店位于清凉峰国家自然保护区北簏海拔680米的徽杭古道东端十门峡龙门景区龙门景点入口处，地理位置十分优越。临安十门峡大酒店总建筑面积13000平方米，'),
("null",1,'images/zhoubian/lina/jsla02.jpg','主楼为白墙黑瓦和特色窗栅马头墙的徽派建筑，副楼为端庄大气大面积挑檐和庑殿屋顶的江南传统轻灵婉约仿苏式古建筑，寓示着酒店位于淅、皖两省的接壤处，并拥有着徽文化及吴越文化的文化底蕴。酒店拥有各式精致客房，提供地热取暧，其中20间还为日本榻榻米式风格，满足不同顾客的需求。酒店有从20人至160人不同规格的大小会议室八个，餐厅有单包厢、二联包、四联包等不同风格的豪华包间和宴会大厅，可容纳500余人同时用餐。此外酒店室外游泳池、健身房、卡拉OK、棋牌室等休闲康乐设施齐全，是您旅游度假、商务会议、休闲健身的好去处。'),
("null",1,'images/zhoubian/lina/jsla03.jpg','十门峡
十门峡景区位于浙皖交界处，清凉峰自然保护区内，地处临安西部，景区分别由十大门景点组成，目前剑门、龙门景区已开发完善对外营业，虎门、象门景区正在开发建设度假酒店与漂流项目，综合旅游资源之丰富，“十门千峰擎日月，剑门千丈锁天地”，层峦叠嶂， 周边地貌 飞瀑流泉，奇景成群，百里峡谷沟壑纵横，奇峰林立，峰插云天，雄奇险峻，美轮美奂。'),
("null",1,'images/zhoubian/lina/jsla04.jpg','剑门乃经典古装剧新《倩女幽魂》、《剑蝶》外景拍摄地。高达百米，拔地入云，斧劈刀削，险峻无比，神仙难攀，绝壁奇松仪态万千。虎门景区千峰直插云霄，苍山如画，群峰之势蔚为壮观；海拔之高，俯视浙西群峰。站在峰顶，绵延群山尽收眼底，可谓气象万千。 三万亩原始森林，株高冠大，景区有古树名木千余棵，树龄一般都在200年以上，甚至有树龄长达800年。其中景区的地质地貌景观，华东地区徒手攀岩基地之一，并拥有国际标准攀岩赛道6条。龙门景区为华东大瀑布群，18条大瀑布从千丈悬崖飞泻而下，潭瀑相连，溪涧遍布，古木成林'),
("null",1,'images/zhoubian/lina/jsla05.jpg','重要提醒黄金周、特殊节日等旅游旺季，均为担保订房，一经确认不接受退改，敬请见谅。★取票方式：凭有效身份证件至酒店迎宾楼前台或剑门景区售票处取票。'),
("null",2,'images/zhoubian/zhouz/jsshaoxing01.jpg','产品特色★【周庄】：虽历经900多年沧桑，仍完整地保存着原有的水乡古镇的风貌和格局，典型的“小桥、流水、人家”；★【宋城】：大宋皇城区（这里还原1000年前的杭州，景区人员穿着古装穿梭，皮影戏、杂耍、员外招亲等民间活动）、游乐区（儿童游乐场、成人游乐场）、大型歌舞秀表演区（世界三大秀之一的宋城千古情，震撼演出）；'),
("null",2,'images/zhoubian/zhouz/jsshaoxing02.jpg','重要提示1.本产品为旅行社折 扣后价格，任何证件、老人均无效无差价退还，请游客知晓~2.由于节假日例如:国庆节，春节大型节日，堵车等情况，造成行程中标注时间差距较大，等车时间较长，请知晓~3.此行程不含返程车票，南京当地散团，不返始发地，请知晓'),
("null",3,'images/zhoubian/wenz/jswenzhou01.jpg','桐庐温州港酒店地处乔林路与瑶琳路交叉口处，靠近桐庐市中心长途汽车站，步行只需10分钟。附近旅游景点环绕，离大奇山国家森林公园开车只需10分钟路程，离严子陵钓台，瑶琳仙境，红灯笼外婆家等一些景点开车只需20-30分钟的路程。酒店全新装修，按星级酒店配置标准，有线，无线网络全网覆盖，20兆的光纤速度。每个房间标配2瓶矿泉水，地下广阔停车场供您使用。温州港酒店是您出差，旅游住宿的理想选择，欢迎您的光临。'),
("null",3,'images/zhoubian/wenz/jswenzhou02.jpg','温馨提示：桐庐乔林路239号 ，近白云源路 。'),
("null",3,'images/zhoubian/wenz/jswenzhou03.jpg','大奇山国家森林公园是一处以森林资源为主体的自然景观，境内既有山峦叠翠、怪石嶙峋、峡谷溪瀑、鸟语花香之景，又有茂林修竹、平湖芳草、果园飘香的田园风光。大奇山形若莲花宝座，海拔600余米，面积40平方公里，内有木本植物和各类灌木近千种，属国家保护的植物有13种，兽类39种，禽类81种。公园的开发一直本着“林茂才能景秀”的原则，以“寓旅于林，以旅兴林”为方针，森林公园向游人开放后，山水依然朴实无华，蓝天、碧水、茂林、修竹，楚楚动人，公园景色青翠、空气纯净、山泉甘洌。'),
("null",3,'images/zhoubian/wenz/jswenzhou4.jpg','景区地址：富春江南岸5公里处(近大奇山)。'),
("null",3,'images/zhoubian/wenz/jswenzhou5.jpg','富春江小三峡位于富春江上游桐庐七里泷至建德梅城一段，全长24公里，是富春江上风光优美的一段。富春江小三峡，分为龙门峡、子陵峡和子胥峡。从七里泷口到严子陵钓台为富春江小三峡“龙门峡”，长约4公里，峡内山高谷深，群峰对峙，江面舒展，水势平缓。峡内有下湾渔唱、富春江钓鱼岛、唐松迎客、盘山石壁等景观。从严子陵钓台至子胥渡口称“子陵峡”，长12公里，是富春江小三峡中环境最幽深、风景最秀丽，峡中两山拔水而起，两岸峭壁嵯峨，河道蜿蜒曲折，清代诗人刘嗣绾有诗云：“一折青山一扇屏，一湾碧水一条琴。无声诗与有声画，须在桐庐江上寻。”这里的河道幽深曲折，山上古树挺拔，翠竹萧萧，山为水铸情，水因山溢美'),
("null",3,'images/zhoubian/wenz/jswenzhou6.jpg','景点地址：浙江省杭州市桐庐县富春江镇云源路2号。'),
("null",3,'images/zhoubian/wenz/jswenzhou7.jpg','瑶琳仙境位于中国浙江省桐庐县境内，距杭州80公里，离县城23公里，是华东沿海中部亚热带湿润区喀斯特洞穴的典型代表，属国家风景名胜区。瑶琳仙境，又名瑶琳洞，纵深1公里，总面积达28000平方米，是“中国旅游胜地四十佳”、“浙江省十大旅游胜地”之一。2002年跻入国家AAAA极风景旅游景区行列。它以曲折有致的洞势地貌，瑰丽多姿的群石景观，被誉为“全国诸洞之冠”。画家叶浅予夸它“中国少有，世界见”。'),
("null",3,'images/zhoubian/wenz/jswenzhou8.jpg','景区地址：桐庐县瑶琳镇洞前村。'),
("null",3,'images/zhoubian/wenz/jswenzhou9.jpg','垂云通天河全长4.5公里，河道内岩溶地貌发育良好。地下水源丰沛，水质清澄，河道曲折幽深，或成潭、或成泊、或成瀑，变幻无穷。据史料记载，垂云通天河早在三国吴越时代就是一处有游人涉足的地下胜景。留有唐人摩崖石刻“垂云古迹”，明代诗人杨宏赞道：“夏日炎忘暑，冬游却似春，源流虽一派，清白只垂云”。垂云通天河荡舟寻奇，分二级河道，第 一级700米，游人乘船至此，由特别设计的升船装置将游客连人带船升至8米高度差的二级河道，惊险刺激。在岩溶地下河装备特制船机，作为游乐和运载工具，不仅国内首创，东南亚地区也属罕见。'),
("null",3,'images/zhoubian/wenz/jswenzhou10.jpg','景点地址：桐庐县瑶琳东琳村垂云通天河。'),
("null",3,'images/zhoubian/wenz/jswenzhou11.jpg',""),
("null",3,'images/zhoubian/wenz/jswenzhou12.jpg',""),
("null",4,"images/zhoubian/huay/jshuayue01.jpg","华悦松泉度假酒店地处临安市美丽秀气的昌化古镇上，建筑面积3800余平方米，由国际著名设计师按巴厘岛风情创作，提供了一个自然温馨而奇妙的环境。这里以海滨自然风光、独特浪漫巴厘岛风情元素与现代空间概念相结合，散发着美妙的音符、建筑的语言、景观中的精华。酒店还设有用餐大厅、包厢、自助早餐厅、多功能会议室、棋牌室及专用停车场等配套设施和服务。酒店采用most advanced的电脑网络管理系统、极速的独立wifi网络和监控系统、话务系统、消防安全系统和数字电视系统。"),
("null",4,"images/zhoubian/huay/jshuayue02.png","酒店地址：临安昌化镇永丰路丰乐街33号 ，近唐昌街。"),
("null",4,"images/zhoubian/huay/jshuayue03.png","浙西大龙湾景区(就是原来的浙西天滩）景区绿树成荫，瀑布成群，溪水清澈见底。横空出世的摩天巨石，深渊莫测的神秘龙潭，胜于天界瑶池的天然浴场，美妙无比的千米天滩等天然胜境，将神话美、原始美、山水美、民俗美融为一体。由天滩食街、鳌鱼巨石、三女飞瀑、龙潭繁花、天河浴场、天滩胜景等二十八个景点及其它人文景观组成，是杭徽古道上的一颗生态明珠。【龙井峡闯关】在峡谷中穿越玩惊险刺激的户外拓展。从美食街吊脚楼前开始，沿峡谷建造了大型拓展项目，其中有浮桥、天使之手——跷跷板、网墙、梅花桩、玻璃桥、吊桥、缅甸桥、独木桥、穿越行走、天梯、A字桥、滑道。穿梭在巨石横空的峡谷河道上空，你，敢来挑战吗？"),
("null",4,"images/zhoubian/huay/jshuayue04.png","景区地址：浙江省杭州市临安区龙岗镇龙岗镇龙井村"),
("null",4,"images/zhoubian/huay/jshuayue05.jpg","又称天目山温泉，古亦名“芦荻泉”，早在1300多年有之。地热区面积约0.2平方公里，地下储热温度40—50度，溢出表面的水温30——32.5度，属低温热水。大气降水是温泉的主要补给来源，日出水量3000立方米。该温泉为无色、无臭、微涩、透明的低矿化度重碳酸型泉水。温泉除含有常规成分外，还富含氡、氟、锶、钡、铳等特殊成分，有很高的保健价值，对心血管、内分泌、肠胃、关节、神经、皮肤等均有辅助治疗功效。　“水阁冬温客更多，石池春暖人宜浴”，秋冬季跳到温泉池里泡上半天，既防病治病、消除疲劳、保养皮肤，又能“入浴突感气身暖，出门顿生满面春”，体验“温泉文化”，让身心更为洁净。"),
("null",4,"images/zhoubian/huay/jshuayue06.jpg","地址：浙江省杭州市临安区湍口镇湍泉街188号"),
("null",4,"images/zhoubian/huay/jshuayue07.jpg",'【大明山风景区】是镶嵌在杭州至黄山黄金旅游线上一颗璀璨明珠。大明山景区面积29平方公里，高峰大明顶海拔1489.9米，拥有32奇峰、13幽涧、8条飞瀑、3个千亩以上的高山草甸, 横贯六座山体的万米岩洞，共有大小景点96个，以朱元璋屯兵千亩田、起兵反元建立大明王朝是浙西临安唯一的省级风景名胜区，国家AAAA级风景旅游区，是镶嵌在杭州至黄山黄金旅游线上一颗璀璨明珠。大明山景区面积29平方公里，顶峰大明顶海拔1489.9米，拥有32奇峰，13幽涧，8条飞瀑，3个千亩以上的高山草甸, 横贯六座山体的万米岩洞，共有大小景点96个，原始，神奇，险峻，古幽， 被誉为“浙江黄山”。'),
("null",4,"images/zhoubian/huay/jshuayue08.jpg","景区地址：杭州市临安清凉峰镇白果村"),
("null",4,"images/zhoubian/huay/jshuayue09.jpg","【浙西大峡谷】被誉为“华东旅游峡谷”之一。峡内奇峰秀瀑，危岩多峭，有“白马岩中出，黄牛壁上耕”之誉。整个峡谷是线型环带状，全长80公里，共分龙井峡、上溪峡、浙门峡三个景段。峡内地貌典型，山景、树景、石景、水景形态各异，品位不俗。景区内植被丰富、林木参天、石成陡壁、水多急流，森林覆盖面达90%以上，是享受天然森林浴的人间天堂。大峡谷主要景点有：柘林瀑、剑门关、嬉水滩、老碓溪、白马崖等小游览区，山水俱佳，风景怡人。"),
("null",4,"images/zhoubian/huay/jshuayue10.jpg","景区地址：杭州市临安大峡谷镇一八省道旁"),
("null",5,"images/zhoubian/shaox/jsxihu01.jpg","赏西湖风光，品江南水乡，走进鲁迅故里，赏兰亭集序。"),
("null",5,"images/zhoubian/shaox/jsxihu02.jpg","绍兴古城，绿水晶莹，石桥飞架，乌篷穿梭，一派典型的江南水乡景色。"),
("null",6,"images/zhoubian/wuz/jswuzhen01.jpg","日、夜、晨游西栅、赏西湖全景、畅游横店秦王宫，深度体会水乡晨昏之美"),
("null",7,"images/zhoubian/shangh/jsshanghai01.JPG","漫步在堤上，新柳如烟，春风骀荡，好鸟和鸣，意境动人；"),
("null",7,"images/zhoubian/shangh/jsshanghai02.jpg","感受中国第-大城市的时尚，登东方明珠，览高楼大厦，叹繁华都市；"),
("null",8,"images/zhoubian/nanj/jsnanjing01.jpg","太湖风光,融淡雅清秀与雄奇壮阔于一体，碧水辽阔，烟波浩淼，峰峦隐现，气象万千；"),
("null",8,"images/zhoubian/nanj/jsnanjing02.jpg","西湖的标志性景点，旧时雷峰塔与北山的保俶塔，一南一北，隔湖相对，有“雷峰如老衲，保俶如美人”之誉，西湖上亦呈现出“一湖映双塔，南北相对峙”的美景； ");
/*轮播图*/
INSERT INTO jingdian_pic VALUES 
("null",1,"images/zhoubian/lina/hzla01.jpg",""),
("null",1,"images/zhoubian/lina/hzla02.jpg",""),
("null",1,"images/zhoubian/lina/hzla03.jpg",""),
("null",2,"images/zhoubian/zhouz/zhouzhuang01.jpg",""),
("null",2,"images/zhoubian/zhouz/zhouzhuang02.jpg",""),
("null",2,"images/zhoubian/zhouz/zhouzhuang03.jpg",""),
("null",2,"images/zhoubian/zhouz/zhouzhuang04.jpg",""),
("null",2,"images/zhoubian/zhouz/zhouzhuang05.jpg",""),
("null",3,"images/zhoubian/wenz/wenzhou01.jpg",""),
("null",3,"images/zhoubian/wenz/wenzhou02.jpg",""),
("null",3,"images/zhoubian/wenz/wenzhou03.jpg",""),
("null",3,"images/zhoubian/wenz/wenzhou04.jpg",""),
("null",3,"images/zhoubian/wenz/wenzhou05.jpg",""),
("null",4,"images/zhoubian/huay/huayue01.jpg",""),
("null",4,"images/zhoubian/huay/huayue02.jpg",""),
("null",4,"images/zhoubian/huay/huayue03.jpg",""),
("null",4,"images/zhoubian/huay/huayue04.jpg",""),
("null",4,"images/zhoubian/huay/huayue05.jpg",""),
("null",5,"images/zhoubian/shaox/shaoxing01.jpg",""),
("null",5,"images/zhoubian/shaox/shaoxing02.jpg",""),
("null",5,"images/zhoubian/shaox/shaoxing03.jpg",""),
("null",5,"images/zhoubian/shaox/shaoxing04.jpg",""),
("null",6,"images/zhoubian/wuz/wuzhen01.jpg",""),
("null",6,"images/zhoubian/wuz/wuzhen02.jpg",""),
("null",6,"images/zhoubian/wuz/wuzhen03.jpg",""),
("null",6,"images/zhoubian/wuz/wuzhen04.jpg",""),
("null",6,"images/zhoubian/wuz/wuzhen05.jpg",""),
("null",7,"images/zhoubian/shangh/shanghai01.jpg",""),
("null",7,"images/zhoubian/shangh/shanghai02.jpg",""),
("null",7,"images/zhoubian/shangh/shanghai03.jpg",""),
("null",7,"images/zhoubian/shangh/shanghai04.jpg",""),
("null",7,"images/zhoubian/shangh/shanghai05.jpg",""),
("null",8,"images/zhoubian/nanj/wuxi01.jpg",""),
("null",8,"images/zhoubian/nanj/wuxi02.jpg",""),
("null",8,"images/zhoubian/nanj/wuxi03.jpg",""),
("null",8,"images/zhoubian/nanj/wuxi04.jpg",""),
("null",8,"images/zhoubian/nanj/wuxi05.jpg","");

/** 胡迅 **/
/**国内旅游**/
INSERT INTO jingdian VALUES
("null",31,"大足石刻 5A级景区",'欣赏真正的“千手”观音',25,"images/gnlv/lbdzsk/lbdzsk01.jpg"),
("null",32,"五台山 5A级景区","兼有汉地和藏传佛教的佛教道场",118,"images/gnlv/lbwts/lbwts01.jpg"),
("null",33,"庐山 5A级景区","匡庐奇秀甲天下",65,"images/gnlv/lbls/lbls01.jpg"),
("null",34,"泰山 5A级景区","会当凌绝顶，一览众山小",27.8,"images/gnlv/lbts/lbts01.jpg"),
("null",35,"布达拉宫 5A级景区","朝圣者的天堂",21,"images/gnlv/lbbdlg/lbbdlg01.jpg"),
("null",36,"武当山 5A级景区","一座历史悠久的仙山，武当拳的发源地",100,"images/gnlv/lbwds/lbwds01.jpg"),
("null",37,"净月潭 5A级景区","禅，净，修，净月潭，北普陀寺",26.8,"images/gnlv/lbjyt/lbjyt01.jpg"),
("null",38,"明十三陵 5A级景区","气势磅礴的陵寝建筑群",50,"images/gnlv/lbmssl/lbmssl01.jpg");

/**国内旅游图片**/
/**大足石刻景点介绍图片**/
INSERT INTO jingdian_pic VALUES 
("null",31,"images/gnlv/dazushike/dzskpicqt01.jpg",'石窟艺术的丰碑大足石刻素有“东方明珠”之称。唐末、宋初时期的宗教摩崖石刻，以佛教题材为主，是中国著名的古代石刻艺术'),
("null",31,"images/gnlv/dazushike/dzskpicqt02.jpg",'精美的石刻公元13世纪末和17世纪中叶，大足曾两度遭受兵燹。"五山"摩崖造像中，除宝顶山圣寿寺两次焚毁、两度重修外，摩崖造像一直保存完好。'),
("null",31,"images/gnlv/dazushike/dzskpicqt03.jpg",'宝顶石刻宝顶山位于大足区龙岗街道东北15公里处，海拔527.83米。巨型雕刻360余幅，以六道轮回，广大宝楼阁、华严三圣像。'),
("null",31,"images/gnlv/dazushike/dzskpicqt04.jpg",'险峻山崖时间跨度从公元9世纪到13世纪，以其艺术品质极高、题材丰富多变而闻名遐迩！'),
("null",31,"images/gnlv/dazushike/dzskpicqt05.jpg",'晚唐造像自公元892—1252年的360年间（晚唐景福至南宋淳佑年间），大足先后建成佛教、道教和"三教"造像区34处，造像数量占大足石刻总数的80%左右。其中除北山摩崖造像始凿于公元892年晚唐景福元年外，其余均为公元1082—1252年北宋元丰至南宋淳佑的170余年间建成。');
/**大足石刻轮播**/
INSERT INTO jingdian_pic VALUES
("null",31,"images/gnlv/lbdzsk/lbdzsk01.jpg",""),
("null",31,"images/gnlv/lbdzsk/lbdzsk02.jpg",""),
("null",31,"images/gnlv/lbdzsk/lbdzsk03.jpg",""),
("null",31,"images/gnlv/lbdzsk/lbdzsk04.jpg",""),
("null",31,"images/gnlv/lbdzsk/lbdzsk05.jpg","");

/**五台山景点介绍图片**/
INSERT INTO jingdian_pic VALUES
("null",32,"images/gnlv/wutaishan/wtspicqt01.jpg",'五台山名字由来五台山方圆约320公里，因五峰如五根擎天巨柱拔地而起、 巍然矗立，峰顶平坦如台，故名五台。'),
("null",32,"images/gnlv/wutaishan/wtspicqt02.jpg",'奇峰灵崖五台山奇峰灵崖随处皆是，著名者达五十余处。其中写字崖，用水洒湿以后，拿手帕仔细拭擦，崖面会显示出类似篆隶体字迹，水干字隐。'),
("null",32,"images/gnlv/wutaishan/wtspicqt03.jpg",'观日出黎明时分，登临五台山东台望海峰，即东台顶，注视云海红日，心如天地宽阔。'),
("null",32,"images/gnlv/wutaishan/wtspicqt04.jpg",'独特五爷庙坐北向南这座建筑便是大名鼎鼎的五龙王殿，人们通称五爷庙。因为一般的佛教寺院是不供龙王的，一直香火不断。'),
("null",32,"images/gnlv/wutaishan/wtspicqt05.jpg",'跳布扎跳布扎起源于西藏,是五台山黄教每年农历六月十五前后举行的重大佛教活动。活动为期三天,分“镇鬼”、“跳神”和“斩鬼”，以此驱邪。');
/**五台山轮播**/
INSERT INTO jingdian_pic VALUES
("null",32,"images/gnlv/lbwts/lbwts01.jpg",""),
("null",32,"images/gnlv/lbwts/lbwts02.jpg",""),
("null",32,"images/gnlv/lbwts/lbwts03.jpg",""),
("null",32,"images/gnlv/lbwts/lbwts04.jpg",""),
("null",32,"images/gnlv/lbwts/lbwts05.jpg","");

/**庐山景点介绍图片**/
INSERT INTO jingdian_pic VALUES
("null",33,"images/gnlv/lushan/lspicqt01.jpg",'含鄱口北面为第二高峰“大月山”，南面为庐山第三高峰 “五老峰”，湖光山色，相互比美。'),
("null",33,"images/gnlv/lushan/lspicqt02.jpg",'老别墅老别墅的故事景区，荟萃了庐山别墅中的精华。在其周边，还有“朱德别墅”、“ 邓小平别墅”、“林彪别墅”等可供游人外部参观。'),
("null",33,"images/gnlv/lushan/lspicqt03.jpg",'花径花径公园位于牯岭街西南2公里处，相传是唐代诗人白居易咏诗《大林寺桃花》的地方。园中繁花似锦，亭台碑碣，曲径通幽，湖光山色，风景如画。'),
("null",33,"images/gnlv/lushan/lspicqt04.jpg",'如琴湖如琴湖座落西谷，峰岭围抱，森林蓊蔚，环境幽雅。湖心立岛，岛内有许多人工饲养的孔雀，所以名为 孔雀岛，曲桥连接，上缀水榭，形成绿水青山，相映成趣。'),
("null",33,"images/gnlv/lushan/lspicqt05.jpg",'三叠泉三叠泉位于五老峰下部，飞瀑流经的峭壁有三级，溪水分三叠泉飞泻而下，落差共155米，极为壮观，撼人魂魄。');
/**庐山轮播**/
INSERT INTO jingdian_pic VALUES
("null",33,"images/gnlv/lbls/lbls01.jpg",""),
("null",33,"images/gnlv/lbls/lbls02.jpg",""),
("null",33,"images/gnlv/lbls/lbls03.jpg",""),
("null",33,"images/gnlv/lbls/lbls04.jpg",""),
("null",33,"images/gnlv/lbls/lbls05.jpg","");

/**泰山景点介绍图片**/
INSERT INTO jingdian_pic VALUES
("null",34,"images/gnlv/taishan/lspicqt01.jpg",'五岳独尊 古人形容“泰山吞西华，压南衡，驾中嵩，轶北恒，为五岳之长”。中国古代神话传说中，盘古死后，头部化为泰山。古代传统文化认为，东方为万物交替、初春发生之地，故泰山有“五岳之长”、“五岳独尊”的称誉。'),
("null",34,"images/gnlv/taishan/lspicqt02.jpg",'会当凌绝顶，一览众山小 泰山风景以壮丽著称。重叠的山势，厚重的形体，苍松巨石的烘托，云烟的变化，使它在雄浑中兼有明丽，静穆中透着神奇。'),
("null",34,"images/gnlv/taishan/lspicqt03.jpg",'十八盘 共有石阶1633级。泰山之雄伟，尽在十八盘，泰山之壮美，尽在攀登中。'),
("null",34,"images/gnlv/taishan/lspicqt04.jpg",'南天门 这里是泰山十八盘的顶峰，更是登上泰山的标志。站在这里，你就能体验一览众山小的成就感。'),
("null",34,"images/gnlv/taishan/lspicqt04.jpg",'天街 天街位于南天门以东，街上人来人往，热闹非凡，街道两旁布满了宾馆、饭店、商铺还有各色小店，是一条天上街市。');
/**泰山轮播**/
INSERT INTO jingdian_pic VALUES
("null",34,"images/gnlv/lbts/lbts01.jpg",""),
("null",34,"images/gnlv/lbts/lbts02.jpg",""),
("null",34,"images/gnlv/lbts/lbts03.jpg",""),
("null",34,"images/gnlv/lbts/lbts04.jpg",""),
("null",34,"images/gnlv/lbts/lbts05.jpg","");

/**布达拉宫景点介绍图片**/
INSERT INTO jingdian_pic VALUES
("null",35,"images/gnlv/budalagong/bdlgpicqt01.jpg",'帕巴拉康—圣观音殿帕巴拉康—圣观音殿是布达拉宫的主供佛殿，殿堂内主供布达拉宫的镇宫之宝级文物——圣观音像。'),
("null",35,"images/gnlv/budalagong/bdlgpicqt02.jpg",'白宫德央厦—东欢乐广场白宫德央厦—东欢乐广场位于白宫东侧，面积达1300余平方米，是旧西藏政府在布达拉宫内举行演出等大型活动的场所。'),
("null",35,"images/gnlv/budalagong/bdlgpicqt03.jpg",'措钦司西平措努—西大殿措钦司西平措努一西大殿，位于红宫四层中央，大殿面积达776.2平方米，是五世达赖喇嘛的享堂，四周墙壁绘2215组壁画，记录了五世达赖喇嘛的家族史及本人传记。'),
("null",35,"images/gnlv/budalagong/bdlgpicqt04.jpg",'伍孜加毗——金顶群金顶群是布达拉宫一处独特景观，位于海拔3750余米的布达拉宫主楼红宫之巅，这里共有7座金顶，均为铜鎏金制成。'),
("null",35,"images/gnlv/budalagong/bdlgpicqt05.jpg",'堆廓拉康—时轮殿时轮殿位于红宫六层回廓东侧，殿内中央供奉一座铜鎏金时轮立体坛城，周围佛龛内供奉有印度、中国的著名历算传承者168位的塑像等珍贵造像。');
/**布达拉宫轮播**/
INSERT INTO jingdian_pic VALUES
("null",35,"images/gnlv/lbbdlg/lbbdlg01.jpg",""),
("null",35,"images/gnlv/lbbdlg/lbbdlg02.jpg",""),
("null",35,"images/gnlv/lbbdlg/lbbdlg03.jpg",""),
("null",35,"images/gnlv/lbbdlg/lbbdlg04.jpg",""),
("null",35,"images/gnlv/lbbdlg/lbbdlg05.jpg","");

/**武当山景点介绍图片**/
INSERT INTO jingdian_pic VALUES
("null",36,"images/gnlv/wudangs/wdspicqt01.jpg",'金顶景区 武当山主峰天柱峰顶上的金顶，是武当山的精华和象征，也是武当道教在皇室扶持下走向鼎盛高峰的标志。'),
("null",36,"images/gnlv/wudangs/wdspicqt02.jpg",'亘古无双胜境 武当山以其绚丽多姿的自然景观、规模宏大的古建筑群、源远流长的道教文化、博大精深的武当武术成为中外游客关注的焦点。'),
("null",36,"images/gnlv/wudangs/wdspicqt02.jpg",'道教圣地 位于湖北省西北部的十堰市丹江口市境内， 属大巴山东段。武当山又名太和山、谢罗山、参上山、仙室山，古有“太岳”、“玄岳”、“大岳”之称。');
/**武当山轮播**/
INSERT INTO jingdian_pic VALUES
("null",36,"images/gnlv/lbwds/lbwds01.jpg",""),
("null",36,"images/gnlv/lbwds/lbwds02.jpg",""),
("null",36,"images/gnlv/lbwds/lbwds03.jpg",""),
("null",36,"images/gnlv/lbwds/lbwds04.jpg",""),
("null",36,"images/gnlv/lbwds/lbwds05.jpg","");


/**净月潭景点介绍图片**/
INSERT INTO jingdian_pic VALUES
("null",37,"images/gnlv/jingyuetan/jytpicqt01.jpg",'山水林相依 长春净月潭国家风景名胜区座落在吉林省长春市的东南部，风景区内潭水碧透，林海莽莽，大岭纵横、水、林相依的生态景象构成了净月潭四季变幻的风情长卷。'),
("null",37,"images/gnlv/jingyuetan/jytpicqt02.jpg",'森林浴场 净月潭公园内的生态型景点“森林浴场”素以人间“天然氧吧”著称，这里含氧丰富，负氧离子高于市区400倍，在这里活动对身体很有好处。'),
("null",37,"images/gnlv/jingyuetan/jytpicqt03.jpg",'鹿苑 鹿苑”是净月潭森林公园内主要景观之一，苑内饲养有长白山梅花鹿、天山马鹿、大兴安岭驯鹿、麋鹿等鹿科动物500多只，更有热带风情的非洲鸵鸟供人观赏。'),
("null",37,"images/gnlv/jingyuetan/jytpicqt04.jpg",'东北虎园 东北虎园放养有东北虎、非洲狮、熊、梅花鹿、丹顶鹤等珍稀野生动物60多个品种，2000多只动物，还有丰富的动物技艺表演，其中更有“动物大巡游”人兽同欢项目。'),
("null",37,"images/gnlv/jingyuetan/jytpicqt05.jpg",'沙滩浴场 游客可在乘船戏水之后小憩于韩式帐篷，品尝净月鱼宴。还可以选择体验“飞渡锁链桥”活动。');
/**净月潭轮播**/
INSERT INTO jingdian_pic VALUES
("null",37,"images/gnlv/lbjyt/lbjyt01.jpg",""),
("null",37,"images/gnlv/lbjyt/lbjyt02.jpg",""),
("null",37,"images/gnlv/lbjyt/lbjyt03.jpg",""),
("null",37,"images/gnlv/lbjyt/lbjyt04.jpg",""),
("null",37,"images/gnlv/lbjyt/lbjyt05.jpg","");


/**明十三陵景点介绍图片**/
INSERT INTO jingdian_pic VALUES
("null",38,"images/gnlv/mingshisanling/msslpicqt01.jpg",'十三陵 沐浴在一片纯净中，景区一片宁静。眼前景物的颜色合为一体，惊为天作。'),
("null",38,"images/gnlv/mingshisanling/msslpicqt02.jpg",'春 春天，穿行在明十三陵景区，看桃花盛开，樱桃和杏压满枝头。'),
("null",38,"images/gnlv/mingshisanling/msslpicqt03.jpg",'夏 夏天了，去哪避暑呢？ 十三陵周围群山环抱，中部为平原，陵前有小河曲折蜿蜒，山明水秀，约上你的小伙伴一起来吧！'),
("null",38,"images/gnlv/mingshisanling/msslpicqt04.jpg",'秋 色彩丰富的秋天，安静祥和的明十三陵。'),
("null",38,"images/gnlv/mingshisanling/msslpicqt05.jpg",'冬 冬日——风雪定陵。'),
("null",38,"images/gnlv/mingshisanling/msslpicqt06.jpg",'昭陵 现存有完整的祾恩门、祾恩殿及其东西配殿，和方城、明楼、宝顶等。这里埋葬有明朝第十二帝穆宗朱载垕和他的三位皇后。');
/**明十三陵轮播**/
INSERT INTO jingdian_pic VALUES
("null",38,"images/gnlv/lbmssl/lbmssl01.jpg",""),
("null",38,"images/gnlv/lbmssl/lbmssl02.jpg",""),
("null",38,"images/gnlv/lbmssl/lbmssl03.jpg",""),
("null",38,"images/gnlv/lbmssl/lbmssl04.jpg",""),
("null",38,"images/gnlv/lbmssl/lbmssl05.jpg","");



/**莫玲红**/
/**攻略**/
CREATE TABLE IF NOT EXISTS `strategy` (
`sid` int(11) NOT NULL,
  `s_title` varchar(20) DEFAULT NULL,
  `s_content` text,
  `s_pic_url` varchar(50) DEFAULT NULL,
  `s_city` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `strategy` (`sid`, `s_title`, `s_content`, `s_pic_url`, `s_city`) VALUES
(1, '西湖一日游', '这座自古就被人称作“人间天堂”的杭城，山、泉、湖、桥、塔、寺样样俱全，风景中的色彩也随着时间逐渐多样化起来。近期我们就为大家推荐一些杭州的经典的旅游路线为给一些想来杭州游玩的朋友可以作为参考一下。\r\n\r\n假如您是刚来杭州玩的，那么我们建议第一天可以去一下我们为您推荐的几个经典的地方关键他们还相差不远可以让您在一天的时间内游玩更多好玩的地方。路线为：断桥残雪(20分钟) → 白堤(20分钟) → 孤山(1-2小时) → 曲院风荷(1小时) → 苏堤春晓(30分钟) → 花港观鱼(1小时) → 吴山广场(1小时) → 西湖音乐喷泉(10分钟)，所以今天我们就为您介绍这条杭州一日游旅游路线，好了就话不多了，请您往下看吧：\r\n\r\n第一天的行程较紧，要环西湖一周，推荐骑自行车游玩。上午以断桥为起点，经过白堤、孤山、曲院风荷，一路骑行至苏堤。午饭后去花港观鱼，之后到吴山广场赏景寻找美食。晚饭后，还要赶在九点前去看绚丽夺目的音乐喷泉。需要注意的是西湖很多景点不允许自行车进入，例如：孤山、花港观鱼。\r\n\r\n断桥残雪\r\n是《白蛇传》中许仙、白娘子的相会之地，也给这座长桥平添许多浪漫色彩。可以作为游玩西湖的起点。从断桥上白堤去孤山，依次游玩西湖周边的各个景点。冬雪初下，桥的阳面冰雪消融，但阴面仍被残雪覆盖，从高处看桥似断非断，形成著名的“断桥残雪”。\r\n\r\n断桥残雪小资讯\r\n门票：免费\r\n开放时间：全天\r\n建议游玩时长：10－20分钟\r\n适宜游玩季节：冬季\r\n著名景点：宝石山高祥云纷、玛瑙寺深钟声纯\r\n景点位置：杭州市西湖区北山街\r\n交通：断桥站——途径线路：7路；51路；52路。下车后西行30米左右即可抵达。\r\n\r\n白堤\r\n原名白沙堤，一端连着断桥，一端接着平湖秋月和孤山，中间是平坦的柏油路。白居易的名句“最爱湖东行不足，绿杨荫里白沙堤”说的就是这里。道路两边种着整齐的杨柳和桃树，抬眼便是西湖美景，很适合悠闲漫步。白堤全长约1公里，步行即可游览，错开游客高峰期，早晚来此最为合适了。游览白堤四季皆宜，若要欣赏白堤经典的“一株杨柳一株桃”的景色，则须在春天三四月前往，而且最好选择在对面的北山路上观看桃红柳绿的白堤全景，拍出的照片也是最美的。\r\n\r\n白堤小资讯\r\n门票：免费\r\n开放时间：全天\r\n建议游玩时长：1小时\r\n适宜游玩季节：春季最佳\r\n景点位置：杭州市西湖区孤山后山路1号\r\n交通：在杭州西湖景区内，从断桥残雪步行12分钟左右即可到达白堤\r\n\r\n孤山\r\n孤山是西湖北面的天然岛屿，岛虽不大，但拥有众多历史古迹，有20余处雕塑、博物馆和纪念馆，堪称西湖人文景观最集中的地方。在岛上不仅能感受到深厚的文化底蕴，还能赏西湖美景，几乎每天都有新人在这里拍婚纱照。南面沿湖的孤山路上集中了一些展览馆，浙江省博物馆（孤山馆区）和它周边的几间艺术馆大多以字画等艺术品为主。北宋诗人林逋曾在这里的放鹤亭隐居，他终身以梅为妻，以鹤为子，每年冬春之交仍能看到一小片盛开的梅花。\r\n\r\n孤山小资讯\r\n门票：免费\r\n开放时间：全天\r\n建议游玩时长：2小时\r\n适宜游玩季节：3-5月、9-10月\r\n著名景点：西泠印社\r\n景点位置：杭州市西湖区西湖北面（近平湖秋月）\r\n交通：从白堤步行12分钟左右即可到达孤山\r\n\r\n曲院风荷\r\n西湖十景之一，其所在的风荷公园内栽培了上百个品种的荷花，夏季显出分外迷人的吸引力。南宋时，此地有一座官家酿酒作坊，取金沙涧的溪水造曲酒。附近种有菱荷，每当夏日风起，酒香荷香沁人心脾，故称“曲院风荷”。莲叶田田，菡萏妖娆。水面上架设了造型各异的小桥，人从桥上过，如在荷中行。\r\n\r\n曲院风荷小资讯\r\n门票：免费\r\n开放时间：全天\r\n建议游玩时长：1小时\r\n适宜游玩季节：6月-8月最佳\r\n景点位置：杭州市西湖区北山街89号\r\n交通：从孤山步行10分钟左右即到曲院风荷\r\n\r\n苏堤春晓\r\n苏堤贯穿西湖南北，是苏东坡在杭州做官时所建，也叫“苏公堤”。因春景迷人，被称为“苏堤春晓”，是西湖十景之首。全长近3公里，由南向北有映波、锁澜、望山、压堤、东浦、跨虹六座石桥。压堤桥适合观赏西湖全景，桥南的御碑亭立有康熙皇帝题写的“苏堤春晓”碑刻。苏堤两端景点较集中，南端有苏东坡纪念馆可免费参观，北端有岳王庙、曲院风荷等景点，还有《印象西湖》的演出地。\r\n\r\n苏堤春晓小资讯\r\n门票：免费\r\n开放时间：全天\r\n建议游玩时长：1小时\r\n适宜游玩季节：四季皆宜\r\n著名景点：苏堤六桥、苏东坡纪念馆\r\n景点位置：杭州市西湖区西湖风景区内\r\n交通：从曲院风荷步行15分钟左右即到苏堤春晓\r\n\r\n花港观鱼\r\n花港观鱼位于西湖南面，曾是南宋官员的私家花园，如今位列“西湖十景”之一。全园分为红鱼池、牡丹园、花港、大草坪、密林地五个景区。其中前三个景区是游客必去之处。园中最出名的就数红鱼池中成群结队的红鲤鱼，总有大人小孩拿饲料、面包屑给鱼儿喂食，不亦乐乎。公园共有三个主要入口，南门在南山路上，西门位于杨公堤，往北也可以走到苏堤上。\r\n\r\n花港观鱼小资讯\r\n门票：免费\r\n开放时间：全天\r\n建议游玩时长：建议1－2小时\r\n适宜游玩季节：四季皆宜\r\n著名景点：马一浮纪念馆\r\n景点位置：杭州市西湖区西山路5-1号\r\n交通：从苏堤春晓步行25分钟左右即到花港观鱼\r\n\r\n吴山广场\r\n吴山广场占地8万平方米，位于吴山天风前，周围有河坊街，是集吃喝玩乐于一体的休闲广场。按观瞻、功能划分为几个参差起伏的区块：主广场区块、绿茵区块、下沉区块、公益区块。广场上常举办大型集会、演出，地下辟有大型停车库。\r\n\r\n吴山广场小资讯\r\n门票：免费\r\n开放时间：全天\r\n建议游玩时长：2小时\r\n适宜游玩季节：春季最佳\r\n著名景点：吴山天风、河坊街、南宋御街、杭州博物馆\r\n景点位置：杭州市上城区延安路1号西湖东南\r\n交通：从花港观鱼到吴山广场需要乘坐公交大约30分钟左右。位于上城区南山路，可乘坐公交车到达 可乘游6线/Y6路到高银街站下车，或乘坐公交25路、31路、35路、52路、206路、208路、212路、216路、514支线等到吴山广场站下车即可。\r\n\r\n西湖音乐喷泉\r\n位于湖滨三公园附近的湖面上，是一座可以通过水形变化来表现乐曲的音乐喷泉。喷泉形状呈弧形，有6大喷嘴类别，灯光全采用LED水灯。在长达126米的喷头设置区域，喷嘴可以360度旋转，配上音乐，喷出多种形状的水柱，吸引众多游客。喷泉通过千变万化的造型，结合彩光照明，来反映音乐的内涵及主题，所用乐曲以中国古典乐和进行曲为多。\r\n\r\n西湖音乐喷泉小资讯\r\n门票：免费\r\n开放时间：每天19:00、20:00各一场，每场播放三曲。\r\n建议游玩时长：1小时\r\n适宜游玩季节：四季皆宜\r\n著名景点：湖滨晴雨\r\n景点位置：杭州市西湖湖滨三公园\r\n交通：从吴山广场需要乘坐公交到西湖音乐喷泉大约30分钟左右。乘坐Y2路公交车在清波门站下车然后步行即可到达。\r\n\r\n好了，以上就是今天给大家推荐的杭州的一条经典的游玩路线就到此为止，剩下的景点还有很多就等你有空再去身临其境慢慢体验吧，一座城市，总是需要留下点历史的遗迹，让我们去欣赏和惊叹，而关于旧时光，旅行者会用脚步去记忆。\r\n\r\n后期我们会推荐更多杭州经典的路线或特色景点让想来的杭州旅行的你们或在杭州周末想游玩的朋友可作为参考，不知不觉看到这里了结束，希望各位小姐姐小哥哥看完觉得行的话就关注订阅我们一下或者点个赞分享一下哟。因部分图片来源于网络，若涉及版权问题请联系我们自当删除道歉。最后想说的是与其透过别人的镜头看世界，何不自己身临其境，与我们相约一场说走就走的小旅程！今天，就到此为止啦~下期再见，不见不散~\r\n\r\n', 'strategy/hz/hzxihu.jpg', '西湖'),
(2, '日本旅游攻略', '送给还没去过日本的你一份最全日本旅行攻略\r\n\r\n现在节假日去日本旅行的人越来越多，在国内一般的假期并不长，除春节期间可以享受很多天假期，其他节日通常只有3天假期，在这种时间不太多的情况下，又想出国玩怎么办，很多人会选择路上耗时短的旅游地，比如：日本呀，韩国呀，泰国呀等等这些周边国家。\r\n\r\n那么日本有哪些地方好玩的呢？其实看你怎么玩了，可以去的地方很多，有的人喜欢去景点，有的人是为了美食去的，有的人喜欢泡温泉，还有的单纯为了买买买。\r\n下面就给没有去过日本的朋友们来一些日本旅行干货：\r\n签证：某宝上可以办极简套餐，900元只需要护照和照片。\r\n机票：建议买同一个地方往返，这样更便宜。航空公司的选择，建议全日空，是日本本土的航空公司，准点率很高。基本不会delay。而且飞机餐是日式餐，还送哈根达斯。价格和国内航空差不多的。在淘宝买很多东西送的优惠券都是关西机场的，所以可以大阪往返。\r\n日本市内交通：买一张jrpass很有必要。东京市内基本用jrpass都可以乘坐，还可以乘坐新干线往返多个城市，在淘宝上买7天的jrpass是1700左右。非常合算。\r\n\r\n\r\n\r\n信用卡：刷卡只支持visa信用卡。\r\n网络：一定要买wifi卡，wifi在淘宝上租，芝麻信用够的话不需要押金。\r\n门票：东京有很多展馆比如三鹰（宫崎骏），需要提前很早订票，还有哆啦A梦和HelloKitty的展馆，适合对这些有情节的人去。我选择的是大阪的环球影城，淘宝买票470，需要指定具体哪一天入园。\r\n\r\n住宿：在Airbnb和booking上定。Airbnb定东京和大阪的民宿。booking上定京都的星级酒店。区别是Airbnb需要先付钱，booking可以用信用卡做担保，到店付，机票酒店都是提前半个月定。\r\n衣物：日本有些冷，带好衣服，东京跟上海温度差不多，比上海更冷一点。\r\n日本一般玩的就是本州，就是关东+关西，而且大部分的景点也是集中在这块。如果你是第一次去日本，而且希望把经典的地方都玩到。那你可以大概这样玩：\r\n1. 东京：浅草寺、皇居、银座、秋叶原、东京塔\r\n2. 富士山：河口湖、忍野八海、富士山五合目，可以选择参加一日游\r\n3. 京都：岚山、花见小路\r\n4. 京都：清水寺、千鸟居、伏见稻荷大社、三年阪二年坂\r\n5. 大阪：大阪城公园、日本桥电器街、法善寺小巷\r\n6. 奈良：奈良公园、东大寺\r\n\r\n这样的行程走下来，日本的精华都在这了。日本的话，可去的地方是真的比较多，上面我说的地方真的都值得一看。另外首次去日本，并且英语和日语都很烂的朋友们，建议可以在黄包车上找个华人的司导，他们在路线规划上，也能给你点建议。\r\n\r\n在这里我想着重说说游览京都后的感觉，京都适合呆个3-4天左右，作为最具有日本传统气息的城市，京都的建筑、寺院宫社等都是非常值得一逛一赏的，另外京都作为日本怀石料理的发源地，这里有很多米其林星级餐厅，比如吉泉 、吉兆 嵐山本店 三星米其林店，二星的就更多了。自然风光的话主要集中在岚山地区，神宫寺庙有名的就是清水寺、天龙寺、平安神宫等。特色风情街道二年坂三年坂、祇园附近等。日式特色文化茶道、花道、艺伎等体验也是在祇园附近。大阪游玩时间2天足够了，比较有名的有大阪的环球影城、大阪城等。吃喝玩的有道顿崛美食、心斋桥玩乐购物等，特色美食大阪烧一定不要错过。奈良的话一天时间足够了，主要是奈良公园、东大寺等地方。也有很多人到了这里会去特意体验一下性价比最高的米其林三星餐厅和山村，总之我强推京都之旅！\r\n\r\nTips：\r\n第一，一定要买wifi卡，没有网络一个陌生国度很麻烦。\r\n第二，一定要记住米住的酒店附近的地铁站的英文拼写，不然地铁买票超级麻烦。\r\n第三，地铁买游客套票才划算。日本坐一站要7块人民币而且这一站走路才十五分钟左右，太贵！外国游客优惠票指定地点才有，建议机场买！\r\n第四，人民币兑换在国内银行都需要预约，大家记得这个问题。不要换太多，因为刷卡更划算。\r\n第五，日本有百分之8点税，买东西都要交税，外国人买够一定数额可以退税，但是有的还收手续费。\r\n\r\n', 'strategy/japan/6.jpg', 'japan'),
(3, '法国旅游攻略', '法国的旅游资源多种多样，喜欢大城市、精美建筑和一流美术馆的朋友一定会在巴黎流连忘返，而卢瓦尔河谷中的城堡会让你惊喜不断。南法灿烂的阳光、秀丽的海岸线与成片的薰衣草造就了欧洲最美的夏日度假胜地。阿尔卑斯与比利牛斯山脚下的山村风光美不胜收，诺曼底的圣米歇尔山则是全世界独一无二的瑰宝。\r\n1卢浮宫2903 条点评\r\n这里不只有世界上最神秘的微笑，快来了解一下？\r\n\r\n\r\n\r\n\r\n\r\n2凡尔赛宫1323 条点评\r\n那些年，法国国王路易十四不能说的秘密~\r\n这里还包含景点： 大特里亚农宫\r\n\r\n\r\n\r\n\r\n\r\n\r\n3埃菲尔铁塔2423 条点评\r\n巴黎的标志、首都的瞭望台，登上铁塔可以俯瞰巴黎全景\r\n\r\n\r\n\r\n\r\n4巴黎圣母院1746 条点评\r\n因雨果的同名小说而声名大噪，巴黎最古老、最宏伟的天主教堂\r\n\r\n\r\n\r\n\r\n\r\n5香榭丽舍大街1020 条点评\r\n巴黎最美丽的街道，世界著名的名品街\r\n\r\n\r\n\r\n\r\n\r\n热门景点\r\n\r\n蒙马特高地\r\n蒙马特高地\r\n危险又迷人，遇见巴黎的另类文艺\r\n\r\n\r\n巴黎凯旋门\r\n巴黎凯旋门\r\n拿破仑时期的胜利象征，欧洲100多座凯旋门中最宏伟的一座\r\n\r\n\r\n塞纳河\r\n塞纳河\r\n巴黎的母亲河，承载了巴黎这座浪漫之都的兴起与繁荣\r\n\r\n\r\n奥赛博物馆\r\n奥赛博物馆\r\n火车站到博物馆的华丽变身，印象派的迷弟迷妹们不要错过~\r\n\r\n\r\n协和广场\r\n协和广场\r\n这里承载着人们的共同心愿，爱与和平。\r\n\r\n\r\n\r\n', 'strategy/french/5.jpg', '法国'),
(4, '台湾旅游攻略', '景点概况\r\n台湾的观光资源十分丰富，从海底世界到高山森林都可以在岛上找到，每个月都有各式各样的展览、音乐节和传统节庆，而台湾最美丽的风景是人，富有人文风情、浓厚历史的古城台南、鹿港、大溪等地都聚集了很高的人气；热闹繁华应有尽有的台北、台中、高雄是台湾的城市风貌，充满度假风情、闲度时光的台东、垦丁则是台湾的浅浅微笑。不同地方、不同玩法，丰富的自然资源，魅力十足\r\n必游景点TOP5\r\n1台北故宫博物院6505 条点评\r\n中国三大博物馆之一，中华历史文化的精粹所在，浩瀚藏品让人叹为观止\r\n这里还包含景点： 张大千纪念馆 故宫晶华 富春居 至善园\r\n\r\n\r\n\r\n\r\n\r\n2101大楼4484 条点评\r\n台北的迷人地标，世界第三高楼，鸟瞰城市夜景的最佳地点\r\n这里还包含景点： 顶鲜101美食美景餐厅 台北101景观台 鼎泰丰(101店) 欣叶101食艺轩(信义路店) 随意鸟地方101意大利菜\r\n\r\n\r\n\r\n\r\n\r\n3中正纪念堂2841 条点评\r\n台北最宏伟的纪念展览馆，整点的卫兵换岗仪式酷炫指数爆棚\r\n这里还包含景点： 自由广场 国家戏剧院 国家音乐厅 国立中正文化中心表演艺术图书馆\r\n\r\n\r\n\r\n\r\n\r\n4太鲁阁公园2412 条点评\r\n以奇险的峡谷断崖著称，是台湾著名的国家森林公园\r\n这里还包含景点： 砂卡当步道 燕子口 长春祠 白杨步道 布洛湾游憩区\r\n\r\n\r\n\r\n\r\n\r\n5垦丁大街/垦丁大街夜市3187 条点评\r\n来垦丁游玩的游客傍晚必逛的景点\r\n\r\n\r\n\r\n\r\n\r\n', 'strategy/twn/7.jpg', '台湾');

/**留言板**/
CREATE TABLE message(
	mid INT PRIMARY KEY AUTO_INCREMENT,	#留言id(自增)
	level INT,								#评价等级1-5	
	time DATETIME,						#留言时间
	content VARCHAR(10000),				#留言内容
	aid INT,								#订单编号
	img1 VARCHAR(255),					#留言图片 
	img2 VARCHAR(255),					#留言图片 
	img3 VARCHAR(255),					#留言图片 
	img4 VARCHAR(255),					#留言图片 
	img5 VARCHAR(255),					#留言图片 
	img6 VARCHAR(255),					#留言图片 
	img7 VARCHAR(255),					#留言图片 
	img8 VARCHAR(255)					#留言图片 
);
INSERT INTO message VALUES
(null,5,now(),'十几年没报过团出行了，这次带着妈妈一起出来耍，就想着试试看报了个团，很方便，很实惠。而且还在挤门口出发，妈妈说一天下来一点都不累，行程安排也很好。一到早集合，差不多90分钟不到就到西塘了，在车上导游小姐姐龙导也很nice，简单介绍了西塘以及出来玩的注意事项，很温柔，很有耐心。到了西塘，先带我们去了几个主要的景点，再自由活动，安排合理，可以带长辈休息下，也可以年轻人拍照。中途确实没购物，没推销，很自由。下次看看还有哪些其他路线，和家里人一起去溜达。',1,'','','','','','','',''),
(null,4,now(),'2018-10-7玩的很开心，景色古色古香的，景色宜人。行程安排的很合理，时间利用很充分。来之前有问过朋友跟团还是自己去，还是跟团的好，省时又省钱。小张导游很漂亮，景点介绍的很详细，很有用，景区里面注意什么也提前通知到了，还给介绍了好多好吃的～',1,'','','','','','','',''),
(null,5,now(),'只要去杭州，必须看“宋城千古情”！完全推荐。感觉非常震撼！网上买了千古情的票，到了之后，可以自助换票，换票后还能免费换古装，进景区后，各处都是身穿古装的游客，好像穿越回前年前，连卖东西的人都是一样的。再说千古情，不时的就会在你身边出来美人、飞人，还会下雨，像4d电影的感觉，但更震撼。有种梦回前年的感觉。话说不尽，就是赞！',2,'','','','','','','',''),
(null,4,now(),'看前面演出感觉还好，但是越后面越好看~特效，灯光，加上精湛的演出~真的直回票价! 只是有一点~因为座位蛮近的，就是前排后排几乎是没高太多，所以常常会被前面挡到，而且很多人看演出太兴奋，想录影就把手举得很高，根本就忘了后面还有很多人再观看，',2,'','','','','','','',''),
(null,5,now(),'南浔古镇，若是慢慢逛，仔细参观并做一些图文记录的话，一天时间是不够用的。除了那些地图上和路牌标识的景区景点，如百间楼、藏书楼、张静江故居张石铭旧宅等等，我还去考察了尚处于荒芜状态的东园和宜园。在宜园的那个园林小岛上还偶遇了一位当地的沈先生，交谈中，他向我介绍了他儿时所见的宜园残貌，一些细节比我此前查阅的有关庞元济的资料还要详细，这是我此次南浔之旅的最大收获。旅行目的，各有不同，常人来此，是寻诗意江南的，而我寻的不是诗意，而是史迹，重点在通过南浔的历史人物故居展陈文献，增加对这些历史人物的认知，同时也以南浔古镇及周边为观察范围，做一些简单的观察和访谈，兼顾社会学、人类学和历史研习的方法。不做浮光掠影走马观花的旅游，意在游学，日知其所无。',3,'','','','','','','',''),
(null,4,now(),'比景点门票优惠些，两张152，我们是在第一天下午一点后取票的，第二天也好用。但取票点只一处，好在就在我们订的酒店原舍附近。希望取票点多些，期限统一宽至两天，我们原本听说下午三点后取的票才可玩两天，可第一天紧赶慢赶都来不及，第二天忐忑地问了下检票口，只说走走可以，景点不行。但景点工作人员给我们试刷成功了，才算舒了口气。如果景区欢迎入住，就该放宽使用期限，就像庐山，一周有效，玩完了客人自会离开。',3,'','','','','','','',''),
(null,5,now(),'选择了三个景点，觉得广州街香港街没什么意思，比较小，不值得去。欢乐谷很好玩，秦王宫和明清宫苑很大，走路比较累的，遇上拍戏的不给进，没看见最想看的储秀宫和养心殿，比较失望！不过所有的演出都是很精彩的，演员非常敬业，很专业！',4,'','','','','','','',''),
(null,5,now(),'跟着一帮延禧迷去了一趟，仿北京故宫而建，真是为了拍戏造出来的宫殿，很多地方都能找出戏里的场景，殿里都是空的，要拍戏了才进道具，这次去就碰到很多剧组在拍戏，还会招揽临演，总体感觉还不错！',4,'','','','','','','','');



/*用户注册*/
-- CREATE TABLE xm_login(
--   id INT PRIMARY KEY AUTO_INCREMENT,
--   name VARCHAR(25),
--   pwd  VARCHAR(32)
-- );
-- INSERT INTO xm_login VALUES(null,'tom',md5('123'));
-- INSERT INTO xm_login VALUES(null,'jerry',md5('123'));