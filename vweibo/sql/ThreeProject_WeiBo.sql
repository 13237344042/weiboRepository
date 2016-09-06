create table Admin(
	Aname varchar2(20),
	Apwd varchar2(30)
);
drop table Admin;
select * from Admin;
insert into Admin values('admin','sa');

--΢����ǩ��
create table WeiBoTag(
       WTid int primary key,          --΢����ǩid
       WTname varchar2(10)           --΢����ǩ�����ֶΣ�
                          --��Ƶ ���� ��� ���� �Ƽ� ���� ���� �ƾ� ���� ���� ���� ���Ӿ� 
                          --��Ӱ ���� ���� ���� �˶����� ���� ���� ���� ���� ��ʷ ��Ůģ�� 
                          --��ͼ ��� ��Ц ��ҥ ������ ���� ʱ�� ��ױ ���� �ڽ� �ȳ� ����
                          --���� ��Ϸ ���� ���� ���� ��ʳ ���� �Ҿ� ���� ���� ��ũ ���
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

insert into WeiBoTag values(1,'��Ƶ');
insert into WeiBoTag values(2,'����');
insert into WeiBoTag values(3,'���');
insert into WeiBoTag values(4,'����');
insert into WeiBoTag values(5,'�Ƽ�');
insert into WeiBoTag values(6,'����');
insert into WeiBoTag values(7,'����');
insert into WeiBoTag values(8,'�ƾ�');
insert into WeiBoTag values(9,'����');
insert into WeiBoTag values(10,'����');
insert into WeiBoTag values(11,'����');
insert into WeiBoTag values(12,'���Ӿ�');
insert into WeiBoTag values(13,'��Ӱ');
insert into WeiBoTag values(14,'����');
insert into WeiBoTag values(15,'����');
insert into WeiBoTag values(16,'����');
insert into WeiBoTag values(17,'�˹�����');
insert into WeiBoTag values(18,'����');
insert into WeiBoTag values(19,'����');
insert into WeiBoTag values(20,'����');
insert into WeiBoTag values(21,'����');
insert into WeiBoTag values(22,'��ʷ');
insert into WeiBoTag values(23,'��Ůģ��');
insert into WeiBoTag values(24,'��ͼ');
insert into WeiBoTag values(25,'���');
insert into WeiBoTag values(26,'��Ц');
insert into WeiBoTag values(27,'��ҥ');
insert into WeiBoTag values(28,'������');
insert into WeiBoTag values(29,'����');
insert into WeiBoTag values(30,'ʱ��');
insert into WeiBoTag values(31,'��ױ');
insert into WeiBoTag values(32,'����');
insert into WeiBoTag values(33,'�ڽ�');
insert into WeiBoTag values(34,'�ȳ�');
insert into WeiBoTag values(35,'����');
insert into WeiBoTag values(36,'����');
insert into WeiBoTag values(37,'��Ϸ');
insert into WeiBoTag values(38,'����');
insert into WeiBoTag values(39,'����');
insert into WeiBoTag values(40,'����');
insert into WeiBoTag values(41,'��ʳ');
insert into WeiBoTag values(42,'����');
insert into WeiBoTag values(43,'�Ҿ�');
insert into WeiBoTag values(44,'����');
insert into WeiBoTag values(45,'����');
insert into WeiBoTag values(46,'��ũ');
insert into WeiBoTag values(47,'���');
delete from WeiBoTag where WTname in ('����','�Ƽ�');
create table UserTagFather(
	UTFid int primary key,    --�û���ǩ�����
	UTFname varchar2(20)
);
insert into UserTagFather values(1,'����');
insert into UserTagFather values(2,'ר��');
insert into UserTagFather values(3,'����');

--�û���ǩ��
create table UserTag(
       UTid int primary key,          --�û���ǩid
       UTname varchar2(20),          --�û���ǩ�� 
       UTFid int references UserTagFather(UTFid)              
       					   --   ����:���� �̽� ���� ������Ա..
                           --   ר��:ҽ�� ���� IT������ ��̨ �ƾ� ����.. 
                           --   ������..
);
create sequence seq_ut_utid start with 1 increment by 1;

insert into UserTag values(1,'����',1);
insert into UserTag values(2,'����',1);
insert into UserTag values(3,'������Ա',1);
insert into UserTag values(4,'�̽�',1);

insert into UserTag values(5,'ҽ��',2);
insert into UserTag values(6,'����',2);
insert into UserTag values(7,'IT������',2);
insert into UserTag values(8,'��̨',2);
insert into UserTag values(9,'�ƾ�',2);
insert into UserTag values(10,'����',2);

insert into UserTag values(11,'��ķ',3);

--insert into UserTag values(seq_ut_utid.nextval,'����');
--insert into UserTag values(seq_ut_utid.nextval,'����');
--insert into UserTag values(seq_ut_utid.nextval,'������Ա');

select * from UserTag;
select seq_ut_utid.nextval from dual;

delete from UserTag where UTid in(4,5,6);
----΢���û���
select * from WeiBoUser;
create table WeiBoUser(
       WBUid int,                       --�û�Id  ��
       Uname varchar2(20),            --�û���   ��
       Upassword varchar2(20),        --�û�����  ��
       Uphone varchar2(11),           --�û��ֻ�����  ��
       Uemail varchar2(40),           --�û�ע������  ��
       Usex char(2) default 'm',   --�û��Ա�    ��
       Uage int,                      --�û�����    ��
       UimgPath varchar2(100),        --�û�ͼ��·��  ��
       UregisterDate Date,            --ע������    ��
       
       Uxxxx  varchar2(100),   --Ԥ���ֶ�
       Uzzzz  varchar2(100),   --Ԥ���ֶ�
       
       											--//�������һ�ο������û���¼���޸ĸ�����Ϣ��ģ��棩
       Uintroduce varchar2(100),      --���ҽ��ܣ���飩 						��
       Utag varchar2(100),            --�û���ǩ�����������˶����ˣ����εȵȣ�  �Լ���    	 ��
       Uscore number(8),              --�û����֣���������vip�ȼ���				��
       UspecialTag varchar2(40)       --��Ȩ��ǩ��ʵ����֤����Ա��������			�����Ǿ�Ūһ������
);
alter table WeiBoUser add constraint pk_wbu_wbuid primary key (WBUid);
select * from WeiBOUser;
insert into WeiBoUser values(1001,'������','sa','15675471040','1373930633@qq.com',default,22,null,sysdate,null,null,'�����Ĵ������','java����ʦ,ѧ��',10000,'CN');
insert into WeiBoUser values(1002,'�����','sa','15675471040','15675471040@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');
insert into WeiBoUser values(1003,'������','sa','15675471040','1373930633@qq.com',default,22,null,sysdate,null,null,'�����Ĵ������','java����ʦ,ѧ��',10000,'CN');
insert into WeiBoUser values(1004,'�����','sa','15675471040','15675471040@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');
insert into WeiBoUser values(1005,'admin','sa','15675471040','15675471040@163.com','f',22,null,sysdate,null,null,'Ů����','java����ʦ,ѧ��,����',10000,'CN');
delete from WeiBoUser where WBUid in (1003,1004);

update WeiBoUser set UimgPath='11.jpg' where WUid=1001;

update WeiBoUser set Uemail='15675470000@qq.com' where WBUid=1002;
update WeiBoUser set Uemail='15675471111@qq.com' where WBUid=1005;

--�û�֮����ϵ�м��n ~ n��
create table Relationship(
       Rid int primary key,           --�û���ϵid'
       Rname varchar2(20),            --�û�֮���ϵ����ע������ע����˿�������ѣ�δ���飬��������Ⱥ��..��
       RidF int,                      --�û�idF
       RidE int,                      --�û�idE
       Rdate Date                     --ʱ��
       
       --Ԥ���ֶ� 
);

--Ⱥ
create table Group(
	Gid int primary key,				--Ⱥid
	Gname varchar2(40),					--Ⱥ��
	Uid int references WeiBoUser(Uid), 	--Ⱥ����û�id
	Gdate Date							--��Ⱥʱ��
);
--������
create table BlackList(
	Bid int primary key,				--������id
	Uid int references WeiBoUser(Uid),  --�ĸ��û��µĺ�����
	BUid int							--�������û�id
);
--���뱻�ۣ���ע�뱻��ע��
create table FanAndFaned(
	FUid int,							--��˿�� �����ǲ��� ������������ȷ�һ��
	FUedid int,							--������
	Fstatus varchar2(16)				--���뱻��֮���py״̬(����Ȧ,ͬѧ,ͬ��,δ����,��������,���Ĺ�ע,�ر��ע,�����Լ���ӵġ���)
);
alter table FanAndFaned drop constraint pk_faf_fff;
alter table FanAndFaned add constraint pk_faf_fff primary key(FUid,FUedid,Fstatus);
drop table FanAndFaned;
select * from FanAndFaned;
select count(*) from FanAndFaned where Fstatus = 'ͬѧ' and Fuid = 1001;
delete from FanAndFaned where FUid=1001 and FUedid=1007 and Fstatus='ͬѧ';
delete from FanAndFaned where FUid=1001 and FUedid=1008 and Fstatus='ͬѧ';
delete from FanAndFaned where FUid=1001 and FUedid=1009 and Fstatus='ͬѧ';
delete from FanAndFaned where FUid=1001 and FUedid=1010 and Fstatus='ͬѧ';
--��ע������
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus != 'δ����';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = 'δ����';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = 'ͬѧ';
select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '����Ȧ';

select (select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = 'δ����') δ����,
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001 and Fstatus = '����Ȧ') ����Ȧ,
		(select count(distinct(FUedid)) from FanAndFaned where FUid = 1001) ��ע,
		(select count(distinct(FUid)) from FanAndFaned where FUedid = 1001) ��˿,
		(select count(WBid) from WeiBo where WBUId = 1001) ΢��
from dual;
		
insert into FanAndFaned values(1001,1002,'����Ȧ');
insert into FanAndFaned values(1001,1003,'����Ȧ');
insert into FanAndFaned values(1001,1003,'����Ȧ');
insert into FanAndFaned values(1001,1004,'����Ȧ');
insert into FanAndFaned values(1001,1005,'����Ȧ');
insert into FanAndFaned values(1001,1006,'����Ȧ');

insert into FanAndFaned values(1002,1001,'����Ȧ');
insert into FanAndFaned values(1002,1003,'����Ȧ');
insert into FanAndFaned values(1002,1004,'����Ȧ');
insert into FanAndFaned values(1002,1005,'����Ȧ');

insert into FanAndFaned values(1001,1002,'ͬѧ');
insert into FanAndFaned values(1001,1003,'ͬѧ');
insert into FanAndFaned values(1001,1004,'ͬѧ');
insert into FanAndFaned values(1001,1005,'ͬѧ');
insert into FanAndFaned values(1001,1006,'ͬѧ');
insert into FanAndFaned values(1001,1007,'ͬѧ');
insert into FanAndFaned values(1001,1008,'ͬѧ');
insert into FanAndFaned values(1001,1009,'ͬѧ');
insert into FanAndFaned values(1001,1010,'ͬѧ');

insert into FanAndFaned values(1001,1007,'δ����');
insert into FanAndFaned values(1001,1008,'δ����');
insert into FanAndFaned values(1001,1009,'δ����');
insert into FanAndFaned values(1001,1010,'δ����');

--���Ȼ����ǿ��Է���΢���﷢���
--����˵���������΢����һ������
--�����
create table Theme(
	Tid int primary key,					--����id
	Tname varchar2(40),						--�������
	TUid int, 								--���ⷢ����
	Tdate Date,								--���ⷢ��ʱ��
	Ttxt clob,								--������ı�����
	Tpics varchar2(540),					--����ͼƬ·��
	Tdeliver int,							--���ⱻ����Ĵ���
	Tview int								--������ʴ���
);
select tname from 
(select n.*,rownum rn from (select * from Theme) n 
where 5 * 1 >= rownum) 
where rn > 5 * (1 - 1);
insert into Theme values(1,'#ǰ������Լ��Լ#',1001,to_date('2016-8-30','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1000,20000);
insert into Theme values(2,'#��̰�籩2�ᵵ914#',1002,to_date('2016-8-30','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1100,21000);
insert into Theme values(3,'#���Ƶ����ؾ����ֽ���#',1002,to_date('2016-8-31','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1200,22000);
insert into Theme values(4,'#񼾸ͯ�����밲��#',1003,to_date('2016-8-31','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1300,23000);
insert into Theme values(5,'#һͼ����#',1003,to_date('2016-8-31','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1400,24000);
insert into Theme values(6,'#��ҽÿ��#',1003,to_date('2016-9-1','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1500,25000);
insert into Theme values(7,'#�������ּ�¼#',1004,to_date('2016-9-1','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1600,26000);
insert into Theme values(8,'#����Ԥ��#',1004,to_date('2016-9-1','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1700,27000);
insert into Theme values(9,'#��Ƿ��黰����#',1004,to_date('2016-9-1','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1800,28000);
insert into Theme values(10,'#��Ů�ھ���Բ#',1004,to_date('2016-9-2','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1400,24000);
insert into Theme values(11,'#��ѧ�ڶ�����������#',1005,to_date('2016-9-2','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1500,25000);
insert into Theme values(12,'#�����Ȱ������#',1005,to_date('2016-9-2','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1600,26000);
insert into Theme values(13,'#��������Ӱ����#',1005,to_date('2016-9-2','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1700,27000);
insert into Theme values(14,'#������ľ�ʱ��#',1005,to_date('2016-9-2','yyyy-MM-dd'),'����΢����ӭ����ʹ��,ף��������',null,1800,28000);



--΢��
create table WeiBo(
       WBid int primary key,          --΢��id
       WBtag varchar2(50),            --΢����ǩ����
       WBtitle varchar2(100),         --΢�����⣨����д��Ҳ���Բ�д���������У�
       WBUId int
           constraint RK_WeiBo_Uid references WeiBoUser(WBUId),--�û�Id( �ļ��ֱ�ǩ���û��������ļ������͵�΢��)
       WBdate Date,                   --΢����������
      -- WBlocation varchar2(100),
       WBtxt  clob,                   --΢����������
       WBpic  varchar2(500),          --΢��ͼƬ·��
       WBvideo varchar2(500),         --΢������·��(���߸�������·�����汾�أ������ݿ⣿���������)
       WBmusic varchar2(500),		  --΢������·��
       yesOrno char(2)				  --�Ƿ��ǻ��������weibo						
       --Ԥ���ֶ�      
);
create sequence seq_wb_wbid start with 10001;

alter table WeiBo add WBlocation varchar2(100);
select * from WeiBo;
select count(WBid) from WeiBo where WBUId = 1001;

insert into WeiBo values(101,'��Ƶ','СѼ��',1001,sysdate,'aaaaaaaaaaaaaaaaaaaaaaaaaaaa',null,null,null,'N');
insert into WeiBo values(102,'��Ƶ','��Ѽ��',1001,sysdate,'bbbbbbbbbbbbbbbbbbbbbbbbbbbb',null,null,null,'N');
insert into WeiBo values(103,'����','����',1001,sysdate,'ccccccccccccccccccccccccccccccccccc',null,null,null,'N');
insert into WeiBo values(104,'����','����ս��',1001,sysdate,'ddddddddddddddddddddddddddddd',null,null,null,'N');

insert into WeiBo values(105,'��Ƶ','��Ѽ��',1002,sysdate,'bbbbbbbbbbbbbbbbbbbbbbbbbbbb',null,null,null,'N');
insert into WeiBo values(106,'����','����',1002,sysdate,'ccccccccccccccccccccccccccccccccccc',null,null,null,'N');
insert into WeiBo values(107,'ʱ��','���´���',1002,sysdate,'ddddddddddddddddddddddddddddd',null,null,null,'Y');

--΢�����ӱ�
create table WeiBoHelp(
       WHid int primary key,          --΢��׷�ӱ�id'            
       WBid int references WeiBo(WBid),--΢��id
       WHviewAccount int,              --΢���������
       WHreprintAccount int,           --΢��ת�ش���
       WHfavoriteAccount int,          --΢���ղش���
       WHcommentAccount int,           --΢�����۴���
       WHgreateAccount int	           --΢�����޴���
       
       --Ԥ���ֶ�  
);
--΢��������
create table Operate(
       Oid int primary key,           --΢������id
       UId int
           constraint RK_Operate_Uid references WeiBoUser(Uid),--�û�Id( �ļ��ֱ�ǩ���û��������ļ������͵�΢��)
       WBid int
           constraint RK_Operate_WBid references WeiBo(WBid),--΢��Id( �ļ��ֱ�ǩ���û��������ļ������͵�΢��)
       Ostate varchar2(20),           --��������ת�أ��ղأ����ۣ�����..��
       
       --Ԥ���ֶ�  
);
--���ۣ��ظ���΢����  --�Ұְ�
create table Comments(
       Cid int primary key,           --���ۣ��ظ���id
       CUidF int,                     --���ۣ��ظ�����id
       CUidN int,                     --��һ�����ۣ��ظ�����id
       WBid int
           constraint RK_Operate_WBid references WeiBo(WBid),--΢��Id( �ļ��ֱ�ǩ���û��������ļ������͵�΢��)
       ContentTxt blob                --���ۣ��ظ����ı�����
       ContentPics varchar2(500)      --���ۣ��ظ���ͼƬ·��
       Cdate Date,                    --��������
       CgreateAccount int,            --���۵��޴���
       
       --Ԥ���ֶ�
);

--˽��
create table PrivateMessage(
       PMid int primary key,          --˽��id
       PM1user int,                   --������
       PM2user int,                   --������
       PMcontent varchar2(500),       --��Ϣ����(  [���֣�ͼƬ��������url���ļ�������]  ��ʱ�������)
       PMdate Date,                   --��Ϣ����
       
       --Ԥ���ֶ�
);


--΢������Ȩ������
create table PersonalPermission(
       PPid int primary key,          --Ȩ��id
       UId int
           constraint RK_PP_Uid references WeiBoUser(Uid),--�û�Id
       PPid int,                      --�û�id
       PPstate char(2),               --Ȩ���Ƿ񿪷�{ F(����) or T(�ر�) }
);
