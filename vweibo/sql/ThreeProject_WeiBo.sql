create table Admin(
	Aname varchar2(20),
	Apwd varchar2(30)
);
drop table Admin;
select * from Admin;
insert into Admin values('admin','sa');

--微博标签表
create table WeiBoTag(
       WTid int primary key,          --微博标签id
       WTname varchar2(10)           --微博标签名（字段）
                          --视频 衡阳 社会 国际 科技 科普 数码 财经 股市 明星 综艺 电视剧 
                          --电影 音乐 汽车 体育 运动健身 健康 瘦身 养生 军事 历史 美女模特 
                          --美图 情感 搞笑 辟谣 正能量 艺术 时尚 美妆 动漫 宗教 萌宠 法律
                          --政务 游戏 旅游 育儿 教育 美食 房产 家居 星座 读书 三农 设计
);
select * from WeiboTag;
select seq_wbt_wtid.nextval from dual;
select wt.*
from
select wt.*,rownum rn from WeiboTag wt
where rn > #{pageSize}*(#{pageNum}-1) and rn <= #{pageSize}*#{pageNum};

select wt.*
from
select wt.*,rownum rn from WeiboTag wt
where rn > 10*(1-1) and rn <= 10*1;

delete sequence seq_wbt_wtid from dual;
create sequence seq_wbt_wtid start with 50;
delete from WeiboTag where WTid in (1,2);

insert into WeiBoTag values(1,'视频');
insert into WeiBoTag values(2,'衡阳');
insert into WeiBoTag values(3,'社会');
insert into WeiBoTag values(4,'国际');
insert into WeiBoTag values(5,'科技');
insert into WeiBoTag values(6,'科普');
insert into WeiBoTag values(7,'数码');
insert into WeiBoTag values(8,'财经');
insert into WeiBoTag values(9,'股市');
insert into WeiBoTag values(10,'明星');
insert into WeiBoTag values(11,'综艺');
insert into WeiBoTag values(12,'电视剧');
insert into WeiBoTag values(13,'电影');
insert into WeiBoTag values(14,'音乐');
insert into WeiBoTag values(15,'汽车');
insert into WeiBoTag values(16,'体育');
insert into WeiBoTag values(17,'运功健身');
insert into WeiBoTag values(18,'健康');
insert into WeiBoTag values(19,'瘦身');
insert into WeiBoTag values(20,'养生');
insert into WeiBoTag values(21,'军事');
insert into WeiBoTag values(22,'历史');
insert into WeiBoTag values(23,'美女模特');
insert into WeiBoTag values(24,'美图');
insert into WeiBoTag values(25,'情感');
insert into WeiBoTag values(26,'搞笑');
insert into WeiBoTag values(27,'辟谣');
insert into WeiBoTag values(28,'正能量');
insert into WeiBoTag values(29,'艺术');
insert into WeiBoTag values(30,'时尚');
insert into WeiBoTag values(31,'美妆');
insert into WeiBoTag values(32,'动漫');
insert into WeiBoTag values(33,'宗教');
insert into WeiBoTag values(34,'萌宠');
insert into WeiBoTag values(35,'法律');
insert into WeiBoTag values(36,'政务');
insert into WeiBoTag values(37,'游戏');
insert into WeiBoTag values(38,'旅游');
insert into WeiBoTag values(39,'育儿');
insert into WeiBoTag values(40,'教育');
insert into WeiBoTag values(41,'美食');
insert into WeiBoTag values(42,'房产');
insert into WeiBoTag values(43,'家居');
insert into WeiBoTag values(44,'星座');
insert into WeiBoTag values(45,'读书');
insert into WeiBoTag values(46,'三农');
insert into WeiBoTag values(47,'设计');
delete from WeiBoTag where WTname in ('国际','科技');
create table UserTagFather(
	UTFid int primary key,    --用户标签父类表
	UTFname varchar2(20)
);
insert into UserTagFather values(1,'名人');
insert into UserTagFather values(2,'专家');
insert into UserTagFather values(3,'其他');

--用户标签表
create table UserTag(
       UTid int primary key,          --用户标签id
       UTname varchar2(20),          --用户标签名 
       UTFid int references UserTagFather(UTFid)              
       					   --   名人:明星 商界 作家 政府官员..
                           --   专家:医疗 育儿 IT互联网 电台 财经 教育.. 
                           --   其他：..
);
create or replace sequence seq_ut_utid start with 1 increment by 1;

insert into UserTag values(1,'明星',1);
insert into UserTag values(2,'作家',1);
insert into UserTag values(3,'政府官员',1);
insert into UserTag values(4,'商界',1);

insert into UserTag values(5,'医疗',2);
insert into UserTag values(6,'育儿',2);
insert into UserTag values(7,'IT互联网',2);
insert into UserTag values(8,'电台',2);
insert into UserTag values(9,'财经',2);
insert into UserTag values(10,'教育',2);

insert into UserTag values(11,'保姆',3);

--insert into UserTag values(seq_ut_utid.nextval,'明星');
--insert into UserTag values(seq_ut_utid.nextval,'作家');
--insert into UserTag values(seq_ut_utid.nextval,'政府官员');

select * from UserTag;
select seq_ut_utid.nextval from dual;

delete from UserTag where UTid in(4,5,6);
----微博用户表
select * from WeiBoUser;
create table WeiBoUser(
       WBUid int,                       --用户Id  √
       Uname varchar2(20),            --用户名   √
       Upassword varchar2(20),        --用户密码  √
       Uphone varchar2(11),           --用户手机号码  √
       Uemail varchar2(40),           --用户注册邮箱  √
       Usex char(2) default 'm',   --用户性别    √
       Uage int,                      --用户年龄    √
       UimgPath varchar2(100),        --用户图像路径  √
       UregisterDate Date,            --注册日期    √
       
       Uxxxx  varchar2(100),   --预留字段
       Uzzzz  varchar2(100),   --预留字段
       
       											--//下面的这一段可以在用户登录后修改个人信息里改（存）
       Uintroduce varchar2(100),      --自我介绍（简介） 						√
       Utag varchar2(100),            --用户标签（如体育，运动达人，手游等等）  自己加    	 √
       Uscore number(8),              --用户积分（用来计算vip等级）				√
       UspecialTag varchar2(40)       --特权标签（实名认证，会员，国籍）			√我们就弄一个国籍
);
alter table WeiBoUser add constraint pk_wbu_wbuid primary key (WBUid);
select * from WeiBOUser;
insert into WeiBoUser values(1001,'巴拉拉','sa','15675471040','1373930633@qq.com',default,22,null,sysdate,null,null,'爱国的大好青年','java工程师,学生',10000,'CN');
insert into WeiBoUser values(1002,'啊大大','sa','15675471040','15675471040@163.com','f',22,null,sysdate,null,null,'女汉子','java工程师,学生,美容',10000,'CN');
insert into WeiBoUser values(1003,'巴拉拉','sa','15675471040','1373930633@qq.com',default,22,null,sysdate,null,null,'爱国的大好青年','java工程师,学生',10000,'CN');
insert into WeiBoUser values(1004,'啊大大','sa','15675471040','15675471040@163.com','f',22,null,sysdate,null,null,'女汉子','java工程师,学生,美容',10000,'CN');
insert into WeiBoUser values(1005,'admin','sa','15675471040','15675471040@163.com','f',22,null,sysdate,null,null,'女汉子','java工程师,学生,美容',10000,'CN');
delete from WeiBoUser where WBUid in (1003,1004);

update WeiBoUser set UimgPath='11.jpg' where WUid=1001;

update WeiBoUser set Uemail='15675470000@qq.com' where WBUid=1002;
update WeiBoUser set Uemail='15675471111@qq.com' where WBUid=1005;

--用户之间联系中间表（n ~ n）
create table Relationship(
       Rid int primary key,           --用户联系id'
       Rname varchar2(20),            --用户之间关系（关注（被关注，粉丝），好友，未分组，黑名单，群？..）
       RidF int,                      --用户idF
       RidE int,                      --用户idE
       Rdate Date                     --时间
       
       --预留字段 
);

--群
create table Group(
	Gid int primary key,				--群id
	Gname varchar2(40),					--群名
	Uid int references WeiBoUser(Uid), 	--群里的用户id
	Gdate Date							--进群时间
);
--黑名单
create table BlackList(
	Bid int primary key,				--黑名单id
	Uid int references WeiBoUser(Uid),  --哪个用户下的黑名单
	BUid int							--黑名单用户id
);
--粉与被粉（关注与被关注）
create table FanAndFaned(
	FUid int,							--粉丝者 现在是测试 主外键的问题先放一边
	FUedid int,							--被粉者
	Fstatus varchar2(16)				--粉与被粉之间的py状态(好友圈,同学,同事,未分组,名人明星,悄悄关注,特别关注,其他自己添加的。。)
);
alter table FanAndFaned drop constraint pk_faf_fff;
alter table FanAndFaned add constraint pk_faf_fff primary key(FUid,FUedid,Fstatus);
drop table FanAndFaned;
select * from FanAndFaned;
select count(*) from FanAndFaned where Fstatus = '同学' and Fuid = 1001;
delete from FanAndFaned where FUid=1001 and FUedid=1007 and Fstatus='同学';
delete from FanAndFaned where FUid=1001 and FUedid=1008 and Fstatus='同学';
delete from FanAndFaned where FUid=1001 and FUedid=1009 and Fstatus='同学';
delete from FanAndFaned where FUid=1001 and FUedid=1010 and Fstatus='同学';
--关注的人数
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus != '未分组';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '未分组';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '同学';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '好友圈';

select (select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '未分组') 未分组,
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '好友圈') 好友圈,
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001) 关注,
		(select count(distinct(FUid)) from FanAndFaned where FUedid = 1001) 粉丝,
		(select count(WBid) from WeiBo where WBUId = 1001) 微博
from dual;
		
insert into FanAndFaned values(1001,1002,'好友圈');
insert into FanAndFaned values(1001,1003,'好友圈');
insert into FanAndFaned values(1001,1003,'好友圈');
insert into FanAndFaned values(1001,1004,'好友圈');
insert into FanAndFaned values(1001,1005,'好友圈');
insert into FanAndFaned values(1001,1006,'好友圈');

insert into FanAndFaned values(1002,1001,'好友圈');
insert into FanAndFaned values(1002,1003,'好友圈');
insert into FanAndFaned values(1002,1004,'好友圈');
insert into FanAndFaned values(1002,1005,'好友圈');

insert into FanAndFaned values(1001,1002,'同学');
insert into FanAndFaned values(1001,1003,'同学');
insert into FanAndFaned values(1001,1004,'同学');
insert into FanAndFaned values(1001,1005,'同学');
insert into FanAndFaned values(1001,1006,'同学');
insert into FanAndFaned values(1001,1007,'同学');
insert into FanAndFaned values(1001,1008,'同学');
insert into FanAndFaned values(1001,1009,'同学');
insert into FanAndFaned values(1001,1010,'同学');

insert into FanAndFaned values(1001,1007,'未分组');
insert into FanAndFaned values(1001,1008,'未分组');
insert into FanAndFaned values(1001,1009,'未分组');
insert into FanAndFaned values(1001,1010,'未分组');

--首先话题是可以放在微博里发表的
--所以说话题可以是微博的一个附属
--话题表
create table Theme(
	Tid int primary key,					--话题id
	Tname varchar2(40),						--话题标题
	TUid int, 								--话题发起人
	Tdate Date,								--话题发起时间
	Ttxt clob,								--话题的文本内容
	Tpics varchar2(540),					--话题图片路径
	Tdeliver int,							--话题被发表的次数
	Tview int								--话题访问次数
);
select tname from 
(select n.*,rownum rn from (select * from Theme) n 
where 5 * 1 >= rownum) 
where rn > 5 * (1 - 1);
insert into Theme values(1,'#前任来撩约不约#',1001,to_date('2016-8-30','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1000,20000);
insert into Theme values(2,'#反贪风暴2提档914#',1002,to_date('2016-8-30','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1100,21000);
insert into Theme values(3,'#李云迪西藏捐音乐教室#',1002,to_date('2016-8-31','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1200,22000);
insert into Theme values(4,'#窦靖童七月与安生#',1003,to_date('2016-8-31','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1300,23000);
insert into Theme values(5,'#一图读懂#',1003,to_date('2016-8-31','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1400,24000);
insert into Theme values(6,'#法医每天#',1003,to_date('2016-9-1','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1500,25000);
insert into Theme values(7,'#三叠物种记录#',1004,to_date('2016-9-1','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1600,26000);
insert into Theme values(8,'#天象预报#',1004,to_date('2016-9-1','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1700,27000);
insert into Theme values(9,'#倾城夫妇情话满级#',1004,to_date('2016-9-1','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1800,28000);
insert into Theme values(10,'#超女冠军方圆#',1004,to_date('2016-9-2','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1400,24000);
insert into Theme values(11,'#开学第二天吓死人了#',1005,to_date('2016-9-2','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1500,25000);
insert into Theme values(12,'#杨美娜百万身价#',1005,to_date('2016-9-2','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1600,26000);
insert into Theme values(13,'#郭俊辰北影报到#',1005,to_date('2016-9-2','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1700,27000);
insert into Theme values(14,'#故事里的旧时光#',1005,to_date('2016-9-2','yyyy-MM-dd'),'享悦微博欢迎您的使用,祝您浏览愉快',null,1800,28000);



--微博
create table WeiBo(
       WBid int primary key,          --微博id
       WBtag varchar2(50),            --微博标签（）
       WBtitle varchar2(100),         --微博标题（可以写，也可以不写，但必须有）
       WBUId int
           constraint RK_WeiBo_Uid references WeiBoUser(WBUId),--用户Id( 哪几种标签的用户发表了哪几种类型的微博)
       WBdate Date,                   --微博发表日期
      -- WBlocation varchar2(100),
       WBtxt  clob,                   --微博文字内容
       WBpic  varchar2(500),          --微博图片路径
       WBvideo varchar2(500),         --微博视屏路径(或者给个视屏路径，存本地，存数据库？存服务器？)
       WBmusic varchar2(500),		  --微博音乐路径
       yesOrno char(2)				  --是否是话题产生的weibo						
       --预留字段      
);
create sequence seq_wb_wbid start with 10001;

alter table WeiBo add WBlocation varchar2(100);
select * from WeiBo;
select count(WBid) from WeiBo where WBUId = 1001;

insert into WeiBo values(101,'视频','小鸭子',1001,sysdate,'aaaaaaaaaaaaaaaaaaaaaaaaaaaa',null,null,null,'N');
insert into WeiBo values(102,'视频','大鸭子',1001,sysdate,'bbbbbbbbbbbbbbbbbbbbbbbbbbbb',null,null,null,'N');
insert into WeiBo values(103,'衡阳','湖工',1001,sysdate,'ccccccccccccccccccccccccccccccccccc',null,null,null,'N');
insert into WeiBo values(104,'军事','中日战争',1001,sysdate,'ddddddddddddddddddddddddddddd',null,null,null,'N');

insert into WeiBo values(105,'视频','大鸭子',1002,sysdate,'bbbbbbbbbbbbbbbbbbbbbbbbbbbb',null,null,null,'N');
insert into WeiBo values(106,'衡阳','湖工',1002,sysdate,'ccccccccccccccccccccccccccccccccccc',null,null,null,'N');
insert into WeiBo values(107,'时尚','麻衣寸衫',1002,sysdate,'ddddddddddddddddddddddddddddd',null,null,null,'Y');

--微博附加表
create table WeiBoHelp(
       WHid int primary key,          --微博追加表id'            
       WBid int references WeiBo(WBid),--微博id
       WHviewAccount int,              --微博浏览次数
       WHreprintAccount int,           --微博转载次数
       WHfavoriteAccount int,          --微博收藏次数
       WHcommentAccount int,           --微博评论次数
       WHgreateAccount int	           --微博点赞次数
       
       --预留字段  
);
--微博操作表
create table Operate(
       Oid int primary key,           --微博操作id
       UId int
           constraint RK_Operate_Uid references WeiBoUser(Uid),--用户Id( 哪几种标签的用户操作了哪几种类型的微博)
       WBid int
           constraint RK_Operate_WBid references WeiBo(WBid),--微博Id( 哪几种标签的用户操作了哪几种类型的微博)
       Ostate varchar2(20),           --操作名（转载，收藏，评论，点赞..）
       
       --预留字段  
);
--评论（回复）微博表  --找爸爸
create table Comments(
       Cid int primary key,           --评论（回复）id
       CUidF int,                     --评论（回复）人id
       CUidN int,                     --下一个评论（回复）人id
       WBid int
           constraint RK_Operate_WBid references WeiBo(WBid),--微博Id( 哪几种标签的用户操作了哪几种类型的微博)
       ContentTxt blob                --评论（回复）文本内容
       ContentPics varchar2(500)      --评论（回复）图片路径
       Cdate Date,                    --评论日期
       CgreateAccount int,            --评论点赞次数
       
       --预留字段
);

--私信
create table PrivateMessage(
       PMid int primary key,          --私信id
       PM1user int,                   --发信人
       PM2user int,                   --收信人
       PMcontent varchar2(500),       --信息内容(  [文字，图片，视屏，url，文件，语音]  到时候再想吧)
       PMdate Date,                   --信息日期
       
       --预留字段
);


--微博访问权限设置
create table PersonalPermission(
       PPid int primary key,          --权限id
       UId int
           constraint RK_PP_Uid references WeiBoUser(Uid),--用户Id
       PPid int,                      --用户id
       PPstate char(2),               --权限是否开放{ F(开放) or T(关闭) }
);
