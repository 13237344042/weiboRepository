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
select wt.*
from
select wt.*,rownum rn from WeiboTag wt
where rn > #{pageSize}*(#{pageNum}-1) and rn <= #{pageSize}*#{pageNum};

select wt.*
from
select wt.*,rownum rn from WeiboTag wt
where rn > 10*(1-1) and rn <= 10*1;

create sequence seq_wbt_wtid start with 11;
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
create or replace sequence seq_ut_utid start with 1 increment by 1;

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
       Uid int,                       --�û�Id
       Uname varchar2(20),            --�û���
       Upassword varchar2(20),        --�û�����
       Uphone varchar2(11),           --�û��ֻ�����
       Uemail varchar2(40),           --�û�ע������
       Usex char(2) default 'male',   --�û��Ա�
       Uage int,                      --�û�����
       UimgPath varchar2(100),        --�û�ͼ��·��
       UregisterDate Data,            --ע������
       
       Uxxxx  varchar2(100),   --Ԥ���ֶ�
       Uzzzz  varchar2(100),   --Ԥ���ֶ�
       
       
       Uintroduce varchar2(100),      --���ҽ��ܣ���飩
       Utag varchar2(100),            --�û���ǩ�����������˶����ˣ����εȵȣ�  �Լ���
       Uscore number(8),              --�û����֣���������vip�ȼ���
       UspecialTag varchar2(40),      --��Ȩ��ǩ��ʵ����֤����Ա��������
);
--�û�֮����ϵ�м��n ~ n��
create table Relationship(
       Rid int primary key,           --�û���ϵid'
       Rname varchar2(20),            --�û�֮���ϵ����ע������ע����˿�������ѣ�δ���飬��������Ⱥ��..��
       RidF int,                      --�û�idF
       RidE int,                      --�û�idE
       Rdate Date,                    --ʱ��
       
       --Ԥ���ֶ� 
);






--΢��
create table WeiBo(
       WBid int primary key,          --΢��id
       WBtag varchar2(50),            --΢����ǩ����
       WBtitle varchar2(100),         --΢�����⣨����д��Ҳ���Բ�д���������У�
       UId int
           constraint RK_WeiBo_Uid references WeiBoUser(Uid),--�û�Id( �ļ��ֱ�ǩ���û��������ļ������͵�΢��)
       WBdate Date,                   --΢����������
       WBtxt  clob,                   --΢����������
       WBpic  varchar2(500)           --΢��ͼƬ·��
       WBvideo blob,                  --΢������(���߸�������·�����汾�أ������ݿ⣿���������)
       
       --Ԥ���ֶ�      
);
--΢�����ӱ�
create table WeiBoHelp(
       WHid int primary key,          --΢��׷�ӱ�id'            
       WBid int references WeiBo(WBid),--΢��id
       WHviewAccount int,              --΢���������
       WHreprintAccount int,           --΢��ת�ش���
       WHfavoriteAccount int,          --΢���ղش���
       WHcommentAccount int,           --΢�����۴���
       WHgreateAccount int,            --΢�����޴���
       
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
--���ۣ��ظ���΢����
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
