/**SPA数据库2.0**/
SET NAMES UTF8;
DROP DATABASE IF EXISTS spa;
CREATE DATABASE spa CHARSET=UTF8;
USE spa;
/**会员表member**/
CREATE TABLE member(
	mid INT PRIMARY KEY AUTO_INCREMENT,		#会员id（自增）
	mname VARCHAR(16),				#会员名
	gender BOOL,					#会员性别 1-->男 0-->女
	phone CHAR(11),					#联系电话
	level BOOL,						#级别  1->高级员   0->普通会员
	money DECIMAL(10,2),			#余额
	core  SMALLINT,                  #积分
	count  SMALLINT                 #消费次数
);
INSERT INTO member VALUES
(1001,'lucy',1,'15057489986',0,'1500','30','3'),
(1002,'tom',0,'13257489986',0,'2500','66','2'),
(1003,'jerry',1,'17757489986',0,'1320','30','4'),
(1004,'kaier',0,'17754569986',1,'3212','57','7'),
(1005,'blook',0,'13223489986',1,'2300','60','9'),
(1006,'jerry',1,'15057489986',0,'1500','88','4'),
(1007,'wang',0,'15057489986',1,'2312','33','5'),
(1008,'zhao',0,'15057489986',0,'1500','34','3'),
(1009,'qian',0,'15057489986',0,'1211','23','2'),
(10010,'shun',1,'17700489986',0,'121','45','6'),
(10011,'han',1,'13257476986',1,'1532','78','8'),
(10012,'fhan',0,'13257476986',0,'1532','78','2'),
(10013,'gan',0,'13257476986',0,'1222','78','4'),
(10014,'jan',0,'13257646986',0,'1532','78','1'),
(10015,'ad',0,'15237476986',1,'100','78','5'),
(10016,'dag',0,'13257476986',0,'236','78','2'),
(10017,'adg',0,'17757476986',0,'1532','78','1'),
(10018,'jhk',0,'13257476986',0,'532','78','3'),
(10019,'wty',1,'17757476986',0,'132','78','2'),
(10020,'fgh',0,'13257476986',0,'153','78','1');

-- 创建商品表
CREATE TABLE `goods` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pic` MEDIUMTEXT NULL COMMENT '图片',
  `title` VARCHAR(200) NOT NULL COMMENT '商品名称',
  `desc` VARCHAR(500) NULL COMMENT '商品的描述',
  `price` DECIMAL(10) NOT NULL,
  `number` INT NOT NULL COMMENT '库存',
  PRIMARY KEY (`id`));

insert into goods (`number`, pic,`desc`, price, title)
 values(
  2000, 'pic','描述',20,'商品AAAA'
),
(
  2000, 'pic','描述',20,'商品BBBB'
),
(
  2000, 'pic','描述',20,'商品CCCC'
)

