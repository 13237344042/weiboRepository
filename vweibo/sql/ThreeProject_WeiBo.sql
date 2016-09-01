create table Admin(
	Aid int primary key,
	Aname varchar2(20),
	Apwd varchar2(30)
);
select * from Admin;
insert into Admin values(1,'admin','sa');

--΢����ǩ��
create table WeiBoTag(
       WTid int primary key,          --΢����ǩid
       WTname varchar2(10),           --΢����ǩ�����ֶΣ�
                          --��Ƶ ���� ��� ���� �Ƽ� ���� ���� �ƾ� ���� ���� ���� ���Ӿ� 
                          --��Ӱ ���� ���� ���� �˶����� ���� ���� ���� ���� ��ʷ ��Ůģ�� 
                          --��ͼ ��� ��Ц ��ҥ ������ ���� ʱ�� ��ױ ���� �ڽ� �ȳ� ����
                          --���� ��Ϸ ���� ���� ���� ��ʳ ���� �Ҿ� ���� ���� ��ũ ���
);

--�û���ǩ��
create table UserTag(
       UTid int primary key,          --�û���ǩid
       UTname varchar2(10)          --�û���ǩ�� 
                           --   ����:���� �̽� ���� ������Ա..
                           --   ר��:ҽ�� ���� IT������ ��̨ �ƾ� ����.. 
                           --   ������..
);
create or replace sequence seq_ut_utid start with 1 increment by 1;

insert into UserTag values(1,'����');
insert into UserTag values(2,'����');
insert into UserTag values(3,'������Ա');

insert into UserTag values(seq_ut_utid.nextval,'����');
insert into UserTag values(seq_ut_utid.nextval,'����');
insert into UserTag values(seq_ut_utid.nextval,'������Ա');

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
