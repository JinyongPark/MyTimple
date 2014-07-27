CREATE TABLE member (
	memberId NUMBER PRIMARY KEY,
	memberName NVARCHAR2(10) NOT NULL,
	email NVARCHAR2(50) NOT NULL,
	tel NVARCHAR2(20) NOT NULL,
	pw NVARCHAR2(20) NOT NULL,
	inform nvarchar2(20) NOT NULL,
	alertCount NUMBER NULL,
	profile NVARCHAR2(50) NULL
);

INSERT INTO member (MEMBERID, membername, email, tel, pw, inform, alertcount, profile)
VALUES( 1 ,'������', 'aaa001@gmail.com' , '010-1223-6434' , 'pw1234'  ,'n' , 0 , '������ ���� ��θ�');

INSERT INTO member (MEMBERID, membername, email, tel, pw, inform, alertcount, profile)
VALUES( 2 ,'������', 'aaa002@gmail.com' , '010-4123-1938' , 'pw1234'  ,'n' , 0 , '������ ���� ��θ�');

INSERT INTO member (MEMBERID, membername, email, tel, pw, inform, alertcount, profile)
VALUES( 3 ,'�Ӽ���', 'aaa003@gmail.com' , '010-0233-2916' , 'pw1234'  ,'y' , 0 , '������ ���� ��θ�');

INSERT INTO member (MEMBERID, membername, email, tel, pw, inform, alertcount, profile)
VALUES( 4 ,'�輺��', 'aaa004@gmail.com' , '010-8613-7131' , 'pw1234'  ,'n' , 0 , '������ ���� ��θ�');

INSERT INTO member (MEMBERID, membername, email, tel, pw, inform, alertcount, profile)
VALUES( 5 ,'������', 'aaa005@gmail.com' , '010-9813-8249' , 'pw1234'  , 'n' , 0 , '������ ���� ��θ�');

insert into member(memberID, memberName, email, tel, pw, inform, alertCount, profile)
  values(6, '�ǻ��', 'kwon6@naver.com', '010-1111-1111', 'pw1234', 'n', 0, '������ ���� ��θ�');

insert into member(memberID, memberName, email, tel, pw, inform, alertCount, profile)
  values(7, '����ȣ', 'oh7@naver.com', '010-2222-2222', 'pw1234', 'n', 0, '������ ���� ��θ�');

insert into member(memberID, memberName, email, tel, pw, inform, alertCount, profile)
  values(8, '�谩��', 'kim8@naver.com', '010-3333-3333', 'pw1234', 'y', 0, '������ ���� ��θ�');
  
insert into member(memberID, memberName, email, tel, pw, inform, alertCount, profile)
  values(9, '������', 'lee9@naver.com', '010-4444-4444', 'pw1234', 'n', 0, '������ ���� ��θ�');
  
insert into member(memberID, memberName, email, tel, pw, inform, alertCount, profile)
  values(10, '������', 'cha10@naver.com', '010-5555-5555', 'pw1234', 'y', 0, '������ ���� ��θ�');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (11, 'ȫ�浿', 'test@test.com', '010-3434-4545', 'pw1234', 'y', 1, 'ȫ�浿�� �����ʻ��� ���');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (12, '�ƹ���', 'now@test.com', '010-1232-4124', 'pw1234', 'n', 2, '�ƹ����� �����ʻ��� ���');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (13, '������', 'today@test.com', '010-6324-2564', 'pw1234', 'n', 0, '�������� �����ʻ��� ���');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (14, '�̼���', 'milk@test.com', '010-2342-2343', 'pw1234', 'y', 0, '�̼����� �����ʻ��� ���');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (15, 'ȿ����', 'ok@test.com', '010-7575-1112', 'pw1234', 'n', 1, 'ȿ������ �����ʻ��� ���');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (16, '�տ���', 'son@test.com', '010-987-4545', 'pw1234', 'y', 1, '�տ����� �����ʻ��� ���');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (17, '�տ���', 'son1@test.com', '010-9032-2024', 'pw1234', 'y', 2, '�տ����� �����ʻ��� ���');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (18, '�տ�õ', 'son2@test.com', '010-2222-9513', 'pw1234', 'n', 0, '�տ�õ�� �����ʻ��� ���');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (19, 'ȣ����', 'honal@test.com', '010-1025-1235', 'pw1234', 'n', 2, 'ȣ������ �����ʻ��� ���');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (20, '���ź', 'KIN@test.com', '010-1265-1784', 'pw1234', 'n', 0, '���ź�� �����ʻ��� ���');

CREATE TABLE notification (
	NotificationId NUMBER PRIMARY KEY,
	memseq NUMBER REFERENCES member(memberId) NOT NULL,
	content NVARCHAR2(1000) NOT NULL,
	confirm NVARCHAR2(10) NOT NULL
);

INSERT INTO Notification (NotificationId, memSeq, content, confirm) VALUES (1, 3,'������ Ż���߽��ϴ�.' , 'n');
INSERT INTO Notification (NotificationId, memSeq, content, confirm) VALUES (2, 1,'������ �����Ǿ����ϴ�. ' , 'n');
INSERT INTO Notification (NotificationId, memSeq, content, confirm) VALUES (3, 2,'������ �Ϸ�Ǿ����ϴ�. ' , 'n');
insert into Notification (NotificationId, memSeq, content, confirm) values (4, 6,'������ Ż���߽��ϴ�.' , 'n');
insert into Notification (NotificationId, memSeq, content, confirm) values (5, 7,'������ �����Ǿ����ϴ�. ' , 'n');
insert into Notification (NotificationId, memSeq, content, confirm) values (6, 8,'������ �Ϸ�Ǿ����ϴ�. ' , 'n');
insert into Notification (NotificationId, memSeq,content,confirm) values (7,11,'�ű� ������Ʈ ������ �ֽ��ϴ�.','n');
insert into Notification (NotificationId, memSeq,content,confirm) values (8,12,'�ű� ������Ʈ ������ �ֽ��ϴ�.','y');
insert into Notification (NotificationId,memSeq,content,confirm) values (9,13,'�ű� ������Ʈ ������ �ֽ��ϴ�.','y');
insert into Notification (NotificationId,memSeq,content,confirm) values (10,14,'�ű� ������Ʈ ������ �ֽ��ϴ�.','n');
insert into Notification (NotificationId,memSeq,content,confirm) values (11,11,'�ű� ������Ʈ ������ �ֽ��ϴ�.','y');

-----------------------------------------------------------------------------------------------------------
CREATE TABLE question (
	questionid NUMBER PRIMARY KEY,
	content NVARCHAR2(50) NULL
);

INSERT INTO Question (QUESTIONID,CONTENT) VALUES (1, '���� ���� 1ȣ��?');
INSERT INTO Question (QUESTIONID,CONTENT) VALUES (2, '�ʵ��б� �� ���� ģ�� ģ�� �̸���?');
INSERT INTO Question (QUESTIONID,CONTENT) VALUES (3, '�ƹ����� ������?');
INSERT INTO Question (QUESTIONID,CONTENT) VALUES (4, '��� ����б� �̸���?');
INSERT INTO Question (QUESTIONID,CONTENT) VALUES (5, '���� �߾��� ��Ҵ�?');

------------------------------------------------------------------------------------------

CREATE TABLE memquestion (
	memquestionId NUMBER PRIMARY KEY,
	memseq NUMBER REFERENCES member(memberId) NOT NULL,
	questionSeq NUMBER REFERENCES question(questionid) NOT NULL,
	quereply NVARCHAR2(50) NULL
);

INSERT INTO memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) VALUES (1, 1, 1, '������');
INSERT INTO memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) VALUES (2, 2, 1, '�ð�');
INSERT INTO memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) VALUES (3, 3, 4, '������б�');
INSERT INTO memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) VALUES (4, 4, 2, '����â');
INSERT INTO memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) VALUES (5, 5, 5, '���ȸ�');
insert into memQuestion(memQuestionId, memSeq, questionSeq, queReply) values(6, 6, 1, '����');
insert into memQuestion(memQuestionId, memSeq, questionSeq, queReply) values(7, 7, 1, '�����');
insert into memQuestion(memQuestionId, memSeq, questionSeq, queReply) values(8, 8, 4, '��ȣ����б�');
insert into memQuestion(memQuestionId, memSeq, questionSeq, queReply) values(9, 9, 5, '������');
insert into memQuestion(memQuestionId, memSeq, questionSeq, queReply) values(10, 10, 5, '�굿��');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (11, 11, 1, '��ǻ��');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (12, 12, 1, '��Ʈ��');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (13, 13, 4, '������б�');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (14, 14, 2, '������');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (15, 14, 2, '��ȫ��');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (16, 16, 1, '�巡�ﺼ');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (17, 17, 1, '�ٵο�');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (18, 18, 3, '�տ���');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (19, 19, 5, '��ü����');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (20, 20, 1, '�ڼ���');

------------------------------------------------------------------------------------------

CREATE TABLE memo (
	memoid NUMBER PRIMARY KEY,
	memseq NUMBER REFERENCES member(memberid) NOT NULL,
	content NVARCHAR2(100) NULL
);

INSERT INTO Memo (memoId,memSeq,content) VALUES (1,1,'������ ȭ���Ͽ� ���ο� ������Ʈ ������ ����');
INSERT INTO Memo (memoId,memSeq,content) VALUES (2,1,'������ �����Ͽ� ���ο� ������Ʈ�� ���� ���� ����');
INSERT INTO Memo (memoId,memSeq,content) VALUES (3,1,'������Ʈ ���� ���Ŀ� bp���');
INSERT INTO Memo (memoId,memSeq,content) VALUES (4,1,'���ο� ������Ʈ�� 2014�� ���� �Ϸ��� ��');
INSERT INTO Memo (memoId,memSeq,content) VALUES (5,2,'������Ʈ�� ���� ���� Ȯ�� �߿�!!');
INSERT INTO Memo (memoId,memSeq,content) VALUES (6,2,'�����ֿ� ��������� ������Ʈ�� �շ��� ����');
INSERT INTO Memo (memoId,memSeq,content) VALUES (7,2,'������Ʈ �Ⱓ���� ���� ���� �Ѵ�. ');
insert into Memo (memoId,memSeq,content) values (8,2,'������ ȭ���Ͽ� ���ο� ������Ʈ ������ ����');
insert into Memo (memoId,memSeq,content) values (9,3,'������ �����Ͽ� ���ο� ������Ʈ�� ���� ���� ����');
insert into Memo (memoId,memSeq,content) values (10,3,'������Ʈ ���� ���Ŀ� bp���');
insert into Memo (memoId,memSeq,content) values (11,3,'���ο� ������Ʈ�� 2014�� ���� �Ϸ��� ��');
insert into Memo (memoId,memSeq,content) values (12,3,'������Ʈ�� ���� ���� Ȯ�� �߿�!!');
insert into Memo (memoId,memSeq,content) values (13,3,'�����ֿ� ��������� ������Ʈ�� �շ��� ����');
insert into Memo (memoId,memSeq,content) values (14,4,'������Ʈ �Ⱓ���� ���� ���� �Ѵ�. ');
insert into Memo (memoId,memSeq,content) values (15,4,'���� 4�ÿ� �ƹ����� ȸ�ǰ� ����!!');
insert into Memo (memoId,memSeq,content) values (16,4,'������ ��ħ 7�� �ѱ� vs ���þ�');

-----------------------------------------------------------------
CREATE TABLE friend (
	friendid NUMBER PRIMARY KEY,
	memseq NUMBER REFERENCES member(memberid) NOT NULL,
	friendseq NUMBER REFERENCES member(memberid) NOT NULL
);

INSERT INTO Friend (friendId, memSeq,friendSeq) VALUES (1,1,2); 
INSERT INTO Friend (friendId, memSeq,friendSeq) VALUES (2,1,5);
INSERT INTO Friend (friendId, memSeq,friendSeq) VALUES (3,1,16);
INSERT INTO Friend (friendId, memSeq,friendSeq) VALUES (4,2,1);
INSERT INTO Friend (friendId, memSeq,friendSeq) VALUES (5,2,11);
INSERT INTO Friend (friendId, memSeq,friendSeq) VALUES (6,2,18);
INSERT INTO Friend (friendId, memSeq,friendSeq) VALUES (7,3,1);
insert into Friend (friendId, memSeq,friendSeq) values (8,3,7); 
insert into Friend (friendId, memSeq,friendSeq) values (9,3,8);
insert into Friend (friendId, memSeq,friendSeq) values (10,3,8);
insert into Friend (friendId, memSeq,friendSeq) values (11,4,5);
insert into Friend (friendId, memSeq,friendSeq) values (12,4,9);
insert into Friend (friendId, memSeq,friendSeq) values (13,4,10);
insert into Friend (friendId, memSeq,friendSeq) values (14,5,1); 
insert into Friend (friendId, memSeq,friendSeq) values (15,5,4); 

------------------------------------------------------------------------------
CREATE TABLE paper (
	paperid NUMBER PRIMARY KEY,
	content NVARCHAR2(50) NOT NULL,
	regdate DATE NOT NULL,
	sendmemseq NUMBER REFERENCES member(memberid) NOT NULL,
	receivememseq REFERENCES member(memberid) NOT NULL,
  kind number not null
);

INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (1,'������ ���� ���� �� �����ص� �ɱ�?',to_date('2014-06-09-17-42-10','YYYY-MM-DD-HH24-MI-SS'), 1, 2, 1);
INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (2,'��.. �� ��� ���µ� � ������ �ٲ��?',to_date('2014-06-10-13-42-10','YYYY-MM-DD-HH24-MI-SS'), 2, 1, 1);
INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (3,'������ ���� �þ��־����� �� ���� �Ѹ��� Ż�� �ؼ� ',to_date('2014-06-10-16-22-10','YYYY-MM-DD-HH24-MI-SS'), 1, 2, 1);
INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (4,'�˾Ҿ� �þ� ���� ',to_date('2014-06-11-17-23-10','YYYY-MM-DD-HH24-MI-SS'), 2, 1, 1);
INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (5,'�׷� ���� �ڼ��� ������ ���� �˷��ٲ� ',to_date('2014-06-11-18-03-10','YYYY-MM-DD-HH24-MI-SS'), 1, 2, 1);
INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (6,'�����Ĵ� ���� ������Ʈ�� �����Ƿ���? ',to_date('2014-06-12-18-03-10','YYYY-MM-DD-HH24-MI-SS'), 1, 5, 2);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (7,'�ǻ��� �ɹ̳�',to_date('2014-06-09-17-42-10','YYYY-MM-DD-HH24-MI-SS'), 6, 7, 1);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (8,'���� ������Ʈ �����Դϴ�.',to_date('2014-06-10-13-42-10','YYYY-MM-DD-HH24-MI-SS'), 6, 8, 1);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (9,'ģ���ϰ� �ͽ��ϴ�.',to_date('2014-06-10-16-22-10','YYYY-MM-DD-HH24-MI-SS'), 6, 9, 3);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (10,'�����ϴ�.. �׸��� ����մϴ�..',to_date('2014-06-11-17-23-10','YYYY-MM-DD-HH24-MI-SS'), 7, 8, 1);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (11,'������Ʈ ����ǥ ����߽��ϴ�.',to_date('2014-06-11-18-03-10','YYYY-MM-DD-HH24-MI-SS'), 7, 9, 1);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (12,'������ ���Ͽ� �����帮�� �ͽ��ϴ�.',to_date('2014-06-12-18-03-10','YYYY-MM-DD-HH24-MI-SS'), 10, 7, 1);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (13,'���� ������Ʈ�� ����� �ʴ��մϴ�.',to_date('2014-06-12-22-47-18','YYYY-MM-DD-HH24-MI-SS'),11,15, 2);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (14,'���� ģ���� �Ǿ��ּ���. ����մϴ�.',to_date('2014-06-12-22-47-18','YYYY-MM-DD-HH24-MI-SS'),16,17,3);

---------------------------------------------------------------------------------------
CREATE TABLE acceotance (
	acceptanceid NUMBER PRIMARY KEY,
	paperseq NUMBER REFERENCES paper(paperid) NOT NULL,
	accept NUMBER NULL
);
-- acceptance ���̺�  
-- 1. Ȯ���� 2. ����. 3. �ź�
INSERT INTO acceotance (acceptanceId,paperSeq,accept) VALUES (1,6,1);
INSERT INTO acceotance (acceptanceId,paperSeq,accept) VALUES (2,9,2);
INSERT INTO acceotance (acceptanceId,paperSeq,accept) VALUES (3,13,3);
INSERT INTO acceotance (acceptanceId,paperSeq,accept) VALUES (4,14,1);

---------------------------------------------------------------------------------
CREATE TABLE board (
	boardid NUMBER PRIMARY KEY,
	post_type NVARCHAR2(10) NOT NULL,
	memseq NUMBER REFERENCES member(memberid) NOT NULL,
	subject NVARCHAR2(200) NOT NULL,
	content NVARCHAR2(1000) NOT NULL,
	fontnum NUMBER NOT NULL,
	regdate DATE DEFAULT(SYSDATE) NOT NULL,
	readcount NUMBER NOT NULL,
	readcom NUMBER NOT NULL,
	imgfilename VARCHAR2(100) NULL,
	imgorgfilename VARCHAR2(100) NULL,
	thread NUMBER NOT NULL,
	depth NUMBER NOT NULL
);

INSERT INTO Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
VALUES (1,'����',1,'�ȳ��ϼ���','�̹��� 8������ ���� ������Ʈ�� �����Ϸ��� �ϴµ� ��� 2���� �̻� ���� ��ʴϴ�. ',1,to_date('2014-06-10-12-12-15','YYYY-MM-DD-HH24-MI-SS'),3,5,null,null,1000,1);
INSERT INTO Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
VALUES (2,'����',2,'�̹� ������Ʈ�� ����...','������ �־� ������Ʈ ������¥�� �����ұ� �մϴ�.  ',1,to_date('2014-05-20-16-12-15','YYYY-MM-DD-HH24-MI-SS'),2,4,null,null,2000,1);
INSERT INTO Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
VALUES (3,'����',3,'�����ߴµ���','���� �����ϳ��� ���� �ٸ� �� ���ٰ� ������ �ȵ� ���� �Ծ��',1,to_date('2014-05-28-13-34-19','YYYY-MM-DD-HH24-MI-SS'),12,0, null,null,3000,1);
INSERT INTO Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
VALUES (4,'����',4,'�� xxx�Ѿ�','�̼��� �̳Ѿ� ������Ʈ �ߵ� �����ϳ� ���۳Ѿ�',1,to_date('2014-05-29-14-34-19','YYYY-MM-DD-HH24-MI-SS'),103,0, null,null,4000,1);
insert into Board(boardId, post_type, memSeq, subject, content, fontNum, regDate, readCount, readCom, imgFileName, imgOrgFileName, thread, depth)
values(5, '����', 6, '�״����� vs ������ ���� ���� ����', '�״����� vs ������ - 5:1 �����Դ� �ڻ쳵�µ�.. ���� �����һ��?', 1, to_date('2014-06-14', 'YYYY-MM-DD-HH24-MI-SS'), 1, 0, null, null, 1000, 1);
insert into Board(boardId, post_type, memSeq, subject, content, fontNum, regDate, readCount, readCom, imgFileName, imgOrgFileName, thread, depth)
values(6, '����', 7, '�� ���̴�.', '�����һ�� �ϰ� ����� ���� �Ѥ�;', 1, to_date('2014-06-14', 'YYYY-MM-DD-HH24-MI-SS'), 1, 0, null, null, 2000, 1);
insert into Board(boardId, post_type, memSeq, subject, content, fontNum, regDate, readCount, readCom, imgFileName, imgOrgFileName, thread, depth)
values(7, '����', 8, '���̳��ζ�', '���� �׸��ΰ� �ɸ��϶��!!', 1, to_date('2014-06-14', 'YYYY-MM-DD-HH24-MI-SS'), 1, 0, null, null, 3000, 1);
insert into Board(boardId, post_type, memSeq, subject, content, fontNum, regDate, readCount, readCom, imgFileName, imgOrgFileName, thread, depth)
values(8, '����', 9, '��ճ�?', '�����һ��?? �ֳ�?? �Ѥ�;', 1, to_date('2014-06-14', 'YYYY-MM-DD-HH24-MI-SS'), 1, 0, null, null, 4000, 1);
insert into Board(boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (9,'����',11,'ȫ�浿�Դϴ�','���� ������ ȫ�浿�Դϴ�. ������ �ݰ����ϴ�.',1,to_date('2014-06-12-11-12-15','YYYY-MM-DD-HH24-MI-SS'),3,5,null,null,41000,1);
insert into Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (10,'����',12,'�����λ� �帳�ϴ�.~~','Ȩ������ ��û ���ƺ��̳׿�. ���� �ò���.',1,to_date('2014-06-12-14-54-51','YYYY-MM-DD-HH24-MI-SS'),6,1,null,null,42000,1);
insert into Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (11,'����',13,'���� ������ �������Դϴ�.','��������.',1,to_date('2014-06-12-17-16-53','YYYY-MM-DD-HH24-MI-SS'),15,7,null,null,43000,1);
insert into Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (12,'����',14,'�ִ���2 �����Ͻô� �е� �ֳ���?','�ִ��� ���� �ؿ�!! ī�� ���̵�� xxxx�Դϴ�. ģ���Ͻð� ī���ּ���!!',1,to_date('2014-06-12-20-11-17','YYYY-MM-DD-HH24-MI-SS'),7,1,null,null,44000,1);
insert into Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (13,'����',15,'��� �ֺ��� ��ôº�?? ��꿡�� Spring���͵� ���� ���մϴ�.','��� �ֺ��� ��ô� �� �ֳ���?? Spring ó�� �����Ͻô� �е� �𿩼�, ���͵� �մϴ�. ���������� �е��� �����ּ���. ',1,to_date('2014-06-12-21-51-26','YYYY-MM-DD-HH24-MI-SS'),2,2,null,null,4500,1);
insert into Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (14,'����',16,'���� ���ź�̴�','���� �ȳ����� �����ŵ��� ��',1,to_date('2014-06-13-15-12-15','YYYY-MM-DD-HH24-MI-SS'),7,12,null,null,1000,1);

CREATE TABLE boardcomment (
	commentid NUMBER PRIMARY KEY,
	boardseq NUMBER REFERENCES board(boardid) NOT NULL,
	memseq NUMBER REFERENCES member(memberid) NOT NULL,
	regdate DATE NOT NULL,
	content NVARCHAR2(100) NULL
);

INSERT INTO BoardComment (commentId,boardSeq,memSeq,regdate,content)
VALUES (1,2 , 4 , to_date('2014-05-20-16-45-42','YYYY-MM-DD-HH24-MI-SS'),'��Ȯ�� ��¥�� �����ΰ��� ? ' );
INSERT INTO BoardComment (commentId,boardSeq,memSeq,regdate,content)
VALUES (2,2 , 5 , to_date('2014-05-20-16-48-50','YYYY-MM-DD-HH24-MI-SS'),'�� �ڴ�� �ٲٳ� ������? ' );
insert into BoardComment (commentId,boardSeq,memSeq,regDate,content)
values (3,5, 6, to_date('2014-06-14-15-51-42', 'YYYY-MM-DD-HH24-MI-SS'), '�������� ������ ������ �ֳ׿�.. ��');
insert into BoardComment (commentId,boardSeq,memSeq,regDate,content)
values (4,5, 7, to_date('2014-06-14-15-52-32', 'YYYY-MM-DD-HH24-MI-SS'), '�౸�� ������ ������ �ֳ��䤻'); 
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (5,10,11,to_date('2014-06-12-16-45-42','YYYY-MM-DD-HH24-MI-SS'),'�ݰ�����. �츮 �ѹ� �� �غ���!!');
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (6,13,12,to_date('2014-06-13-09-12-12','YYYY-MM-DD-HH24-MI-SS'),'�׷�����? ���� �������');
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (7,10,13,to_date('2014-06-13-12-54-52','YYYY-MM-DD-HH24-MI-SS'),'�׿�~ ��������');
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (8,13,14,to_date('2014-06-13-14-18-22','YYYY-MM-DD-HH24-MI-SS'),'ģ�� ���½��ϴ�.');
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (9,13,15,to_date('2014-06-13-18-42-19','YYYY-MM-DD-HH24-MI-SS'),'Ȥ�� ����ó��? ���� ��â����ϴ�. ���͵� �����ϰ� �ͽ��ϴ�.');
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (10,14,19,to_date('2014-06-13-22-40-42','YYYY-MM-DD-HH24-MI-SS'),'���� �ʸ� ����Ʈ�ȴ�.');

--------------------------------------------------------------------------------------

CREATE TABLE commentlabor (
	commentlaborid NUMBER PRIMARY KEY,
	commentseq NUMBER REFERENCES boardcomment(commentid) NOT NULL,
	content NVARCHAR2(200) NOT NULL,
	reporter NUMBER REFERENCES member(memberid) NULL
);

INSERT INTO CommentLabor (commentLaborId,commentSeq,content,reporter) VALUES (1, 2,'�ʸ��ε� �����Ͻó��� �Ű� ���ϴ�.', 2);
insert into CommentLabor(commentLaborId, commentSeq, content, reporter) values(2, 3, '������Ʈ�� ���þ��� �����̹Ƿ� �Ű��ϰڽ��ϴ�.', 8);
insert into CommentLabor (commentLaborId,commentSeq,content,reporter) values (3,10,'�� �ϴ°� �̳� �ΰ��� ����',12);
insert into CommentLabor (commentLaborId,commentSeq,content,reporter) values (4,10,'��ø��� ����',17);

CREATE TABLE labor (
	laborid NUMBER PRIMARY KEY,
	boardseq NUMBER REFERENCES board(boardid) NOT NULL,
	laborcontent NVARCHAR2(300) NULL,
	reporter NUMBER REFERENCES member(memberid) NULL
);

INSERT INTO Labor (laborId,boardSeq,laborContent,reporter) VALUES (1, 4 ,'����  ���� �սô� ',5);
insert into Labor(laborId, boardSeq, laborContent, reporter) values(2, 3, '�� ������Ʈ�� ���þ��� �����Դϴ�.', 6);
insert into Labor (laborId,boardSeq,laborContent,reporter) values (3,9,'�����λ簡 �ʹ� ���� ����',13);
insert into Labor (laborId,boardSeq,laborContent,reporter) values (4,14,'�ڱⰡ ������ �˰�����',1);


CREATE TABLE qanda (
	qnaid NUMBER PRIMARY KEY,
	memseq NUMBER REFERENCES member(memberid) NOT NULL,
	Classification NVARCHAR2(100) NOT NULL,
	subject NVARCHAR2(100) NOT NULL,
	content NVARCHAR2(1000) NOT NULL,
	open NVARCHAR2(9) NOT NULL,
	replystate NVARCHAR2(9) NULL,
	regdate DATE DEFAULT(SYSDATE) NOT NULL,
	qkind NVARCHAR2(10) NULL
);

INSERT INTO QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
VALUES (1,2,'�Խù��з�','���� ���̼��� ����� ��� �ǳ���? ','������ ���ϳ���? ��¥�� ���� ���� �ֳ���?','y','y',to_date('2014-04-11-10-16-58','YYYY-MM-DD-HH24-MI-SS'),'�Խù�����');
INSERT INTO QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
VALUES (2,5,'�Խù��з�','������Ʈ Ʈ�� ������ ���Ͽ�... ','���� ������ ���Ƽ��� �ϳ��� ������Ʈ�� �ִ� ��� bp�� ����Ҽ� �ֳ��� �׸��� �ϳ��� bp�ȿ� �ִ� ��� ������ ��� �����Ѱ���?','n','n',to_date('2014-05-03-10-16-58','YYYY-MM-DD-HH24-MI-SS'),'�Խù�����');
insert into QandA(QnAId, memSeq, classification, subject, content, open, replyState, regDate, Qkind)
values(3, 6, '�Խù��з�', '�� ������Ʈ�� ���þ��� ������ ��� �Ű��ϳ���?', '�Ű� �ϰ������ ����� �𸣰ڽ��ϴ�.', 'y', 'y', to_date('2014-06-14-16-25-11', 'YYYY-MM-DD-HH24-MI-SS'), '�Խù�����');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (4,11,'�Խù��з�','������Ʈ ��� ��� �ؿ�..','����ϴ� ��� �� �˷��ּ���.','y','y',to_date('2014-06-12-10-16-58','YYYY-MM-DD-HH24-MI-SS'),'�Խù�����');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (5,12,'�Խù��з�','�ʹ� ������ ���׿�..','�鵥���ͷ� �� ���õ����� ������?... �鵥���� ä��� �ʹ� ���ſ�..','y','n',to_date('2014-06-13-10-16-23','YYYY-MM-DD-HH24-MI-SS'),'�Խù�����');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (6,13,'�Խù��з�','��� ��ü ���� ������ �����Դϴ�..','���� ȸ�翡�� �̹��� �������α׷��� ��ü�� �����Ϸ��� �մϴ�. Ȩ�������� ����ó�� ���� ��� ���⿡ �� ����ϴ�. �亯�ּ��� ','n','n',to_date('2014-06-13-13-12-11','YYYY-MM-DD-HH24-MI-SS'),'�Խù�����');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (7,14,'�Խù��з�','���� ���� ���� ���� �����Դϴ�.','������ ���� ������ ���� �ʿ������ ����� �� �ȵǼ� �ٷ� ���� �����µ� ���α׷� ������ ���ϴ�. Ȯ�κ�Ź�帳�ϴ�.','y','n',to_date('2014-06-13-16-41-19','YYYY-MM-DD-HH24-MI-SS'),'�Խù�����');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (8,15,'�Խù��з�','���ο� ��� ���� �Դϴ�.','�ڵ����ϰ� ������ �ȵǳ���?','y','n',to_date('2014-06-13-17-19-58','YYYY-MM-DD-HH24-MI-SS'),'�Խù�����');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (9,17,'�Խù��з�','����� �ȵǿ�','����� �ȵǿ� ����ȣ�� ������','y','y',to_date('2014-06-14-10-16-58','YYYY-MM-DD-HH24-MI-SS'),'�Խù�����');



CREATE TABLE manager (
	managerid NUMBER PRIMARY KEY,
	id NVARCHAR2(20) NOT NULL,
	pw NVARCHAR2(30) NOT NULL
);

INSERT INTO manager (managerId, id, pw) VALUES (1,'admin','pw1234');

CREATE TABLE alertmessage (
	alertmessageid NUMBER PRIMARY KEY,
	managerseq NUMBER REFERENCES manager(managerid) NOT NULL,
	content NVARCHAR2(1000) NULL,
	memberseq NUMBER REFERENCES member(memberid) NOT NULL
);

INSERT INTO alertMessage (alertMessageId,managerSeq,content,memberSeq) 
VALUES (1,1,' �Խ��ǿ��� ���� �������ּ��� 3���̻� �Ű������� �Ѵ� �� ���� ����Ʈ�� ������ ���ѵ� �� �ֽ��ϴ�. ', 4 );
insert into alertMessage (alertMessageId,managerSeq,content,memberSeq) 
values (2,1,'�ش� ������� �Խù��� �Ű�Ǿ����ϴ�. �Խ��ǿ��� ��������Ʈ�� ���õ� ������ ���� �ۼ����ֽñ� �ٶ��ϴ�. �����մϴ�.', 6 );
insert into alertMessage (alertMessageId,managerSeq,content,memberSeq) 
values (3,1,'�ҹ����� ����� ������ �ֽñ� �ٶ��ϴ�.',13);
insert into alertMessage (alertMessageId,managerSeq,content,memberSeq) 
values (4,1,'������ �Խù��� ��� ����Դϴ�.',20);

CREATE TABLE qndareply (
	qnareplyid NUMBER PRIMARY KEY,
	qandaSeq NUMBER REFERENCES qanda(qnaid) NOT NULL,
	regdate DATE DEFAULT(SYSDATE) NOT NULL,
	subject NVARCHAR2(200) NOT NULL,
	content NVARCHAR2(2000) NOT NULL,
	managerseq NUMBER REFERENCES manager(managerid) NOT NULL
);

INSERT INTO qndareply (QnAReplyId,QandASeq,regdate,subject,content,managerSeq) 
VALUES (1,1,to_date('2014-06-12-14-17-38','YYYY-MM-DD-HH24-MI-SS'),'re:���� ���̼��� ����� ��� �ǳ���?','���� ���α׷��� ��������� ��������� �ְ� ��������� ������Ʈ ���� ������ ������ �ֽ��ϴ�. �ִ� 3������ ������ �� �ֽ��ϴ�. ',1);
insert into qndareply (QnAReplyId,QandASeq,regdate,subject,content,managerSeq) 
values (2,3,to_date('2014-06-14-16-45-38','YYYY-MM-DD-HH24-MI-SS'),'re:�Ű�ó�� ���� ���Ǳ� �亯����','�Ű�� �Ű��ư�� �����ø� ��� �Ű�ó���˴ϴ�. �����մϴ�.',1);
insert into qndareply (QnAReplyId,QandASeq,regdate,subject,content,managerSeq) 
values (3,4,to_date('2014-06-12-14-17-38','YYYY-MM-DD-HH24-MI-SS'),'re:������Ʈ ��� ��� �ؿ�...','������Ʈ�� ����ϴ� ����� �츮 ���α׷��� �Ұ��ϴ� �Ұ� PDF�� �Ұ��Ǿ� �ֽ��ϴ�. �ش� ������ ������ �ּ���.',1);
insert into qndareply (QnAReplyId,QandASeq,regdate,subject,content,managerSeq) 
values (4,9,to_date('2014-06-12-15-00-00','YYYY-MM-DD-HH24-MI-SS'),'re:����� �ȵǿ�.','�ñ��ϸ� 500��',1);

CREATE TABLE notice (
	noticeid NUMBER PRIMARY KEY,
	managerseq NUMBER REFERENCES manager(managerid) NOT NULL,
	subject NVARCHAR2(100) NOT NULL,
	content NVARCHAR2(2000) NOT NULL,
	regdate DATE NOT NULL
);

INSERT INTO notice(NOTICEID, managerSeq, subject , content, regdate) 
VALUES( 1, 1, '����Ʈ�� �����޿� ����˴ϴ�.', '�ȳ��Ͻʴϱ� ���� ����Ʈ�� �湮���ֽô� ��� �е鲲 ����帮�� �����е��� ������ ���Ծ� ���� ����Ʈ�� ���� ���� ���񽺷� �����ϱ� ���� 3�� ���� ������ �����մϴ�. �����մϴ�. ', to_date('2014-06-14-14-17-38', 'YYYY-MM-DD-HH24-MI-SS') );
insert into notice(noticeId, managerSeq, subject, content, regDate)
values(2, 1, '����Ʈ ȸ������ ���� ������ ����˴ϴ�.', '�ȳ��ϼ���. ����Ʈ �������Դϴ�. �����޺��� ����Ʈ ȸ������ ���� ������ ����˴ϴ�. �ڼ��� ������ ���� �������ֽñ� �ٶ��ϴ�. �����մϴ�.', to_date('2014-06-14-16-40-00', 'YYYY-MM-DD-HH24-MI-SS'));
insert into Notice (noticeId,managerSeq,subject,content,regDate) 
values (3,1,'�������� �Դϴ�','ó������ �е��� �Ұ� PDF�� Ȯ�����ּ���',to_date('2014-06-10-12-47-18','YYYY-MM-DD-HH24-MI-SS'));
insert into Notice (noticeId,managerSeq,subject,content,regDate) 
values (4,1,'������ �������� �湮�� ������ ȯ���մϴ�~~','�ȳ��ϼ��� ���� ����Դϴ�. ������ ������ּż� �����մϴ�. �׻� �ּ��� ���ϴ� �ڼ��� �������� ������ �����ϰڽ��ϴ�.',to_date('2014-06-10-12-47-18','YYYY-MM-DD-HH24-MI-SS'));
insert into Notice (noticeId,managerSeq,subject,content,regDate) 
values (5,1,'�������� �Դϴ�','ó������ �е��� �Ұ� PDF�� Ȯ�����ּ���',to_date('2014-06-10-12-47-18','YYYY-MM-DD-HH24-MI-SS'));

CREATE TABLE onecategory (
	onecategoryid NUMBER PRIMARY KEY,
	onename NVARCHAR2(40) NOT NULL
);

INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (1,'Marketing');
INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (2,'It/Internet');
INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (3,'R&D');
INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (4,'��������');
INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (5,'����');
INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (6,'Design');


CREATE TABLE twocategory (
	twocategoryid NUMBER PRIMARY KEY,
	twoname NVARCHAR2(40) NOT NULL,
	onecategoryseq NUMBER REFERENCES onecategory(onecategoryid) NOT NULL
);

INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (1,'����',1);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (2,'��ǰ��ȹ',1);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (3,'����ȹ',2);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (4,'������',2);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (5,'���α׷���',2);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (6,'�������α׷���',2);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (7,'ȭ��',3);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (8,'���',3);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (9,'�Ǽ�',3);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (10,'����',3);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (11,'�ð�',4);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (12,'��ġ',4);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (13,'����',4);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (14,'�濵�м�',5);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (15,'����ġ',5);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (16,'�׷���',6);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (17,'����',6);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (18,'����',6);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (19,'�Ƿ�',6);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (20,'��ǰ',6);

CREATE TABLE occupation (
	occupationid NUMBER PRIMARY KEY,
	memseq NUMBER REFERENCES member(memberid) NOT NULL,
	twocategoryseq REFERENCES twocategory(twocategoryId) NOT NULL,
	career NUMBER NOT NULL
);


INSERT INTO Occupation (occupationId,memSeq,twocategorySeq,career) VALUES (1,1,4,1);
INSERT INTO Occupation (occupationId,memSeq,twocategorySeq,career) VALUES (2,2,5,1);
INSERT INTO Occupation (occupationId,memSeq,twocategorySeq,career) VALUES (3,3,6,3);
INSERT INTO Occupation (occupationId,memSeq,twocategorySeq,career) VALUES (4,4,6,5);
INSERT INTO Occupation (occupationId,memSeq,twocategorySeq,career) VALUES (5,5,6,2);
insert into Occupation(occupationId, memSeq, twoCategorySeq, career) values(6,6,9,5);
insert into Occupation(occupationId, memSeq, twoCategorySeq, career) values(7,7,9,1);
insert into Occupation(occupationId, memSeq, twoCategorySeq, career) values(8,8,8,3);
insert into Occupation(occupationId, memSeq, twoCategorySeq, career) values(9,9,8,4);
insert into Occupation(occupationId, memSeq, twoCategorySeq, career) values(10,10,11,2);
insert into Occupation (occupationId,memSeq,twocategorySeq,career) values (11,11,2,3);
insert into Occupation (occupationId,memSeq,twocategorySeq,career) values (12,12,2,2);
insert into Occupation (occupationId,memSeq,twocategorySeq,career) values (13,13,2,3);
insert into Occupation (occupationId,memSeq,twocategorySeq,career) values (14,14,2,3);
insert into Occupation (occupationId,memSeq,twocategorySeq,career) values (15,15,2,1);
insert into Occupation (occupationId,memSeq,twocategorySeq,career) values (16,16,6,1);
insert into Occupation (occupationId,memSeq,twocategorySeq,career) values (17,17,11,2);
insert into Occupation (occupationId,memSeq,twocategorySeq,career) values (18,18,14,3);
insert into Occupation (occupationId,memSeq,twocategorySeq,career) values (19,19,19,4);
insert into Occupation (occupationId,memSeq,twocategorySeq,career) values (20,20,20,5);

CREATE TABLE project (
	projectid NUMBER PRIMARY KEY,
	name NVARCHAR2(100) NOT NULL,
	startday DATE NOT NULL,
	endday DATE NOT NULL,
	content NVARCHAR2(1000) NOT NULL,
	open NVARCHAR2(9) NOT NULL,
	thumnail NVARCHAR2(100) NULL,
	twoseq NUMBER REFERENCES twocategory(twocategoryid) NOT NULL
);

INSERT INTO Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
VALUES (1,'���� ���ڽ� ���� ���α׷�',to_date('2014-07-13-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2016-07-13-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'���࿡�� �̷�� ���� ��� ���� �� ���ݰ� ������ ���� ���� ���� ���α׷� ���� ','y','������Ʈ�� ����� ��θ�',6);
INSERT INTO Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
VALUES (2,'000ȸ�� ȸ�� �ַ��',to_date('2014-08-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-08-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),'ȸ���� ��� ������ �� ���� ��볻���� ����� ��θ� ���α׷����� ���� ','y','������Ʈ�� ����� ��θ�',6);
INSERT INTO Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
VALUES (3,'000�б� �л����� ���α׷�',to_date('2014-09-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-09-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),'�� 1000���� �л����� �����ͺ��̽��� Ȱ���� ��� Ȱ���� �����ϴ� ���� �ַ�� ','y','������Ʈ�� ����� ��θ�',6);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (4,'��� ���� ���α׷�',to_date('2014-05-13-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2016-05-13-23-00-00','YYYY-MM-DD-HH24-MI-SS'),'��� �Ǽ����� �� �����ڿ� ���� ���α׷�','y','������Ʈ�� ����� ��θ�',9);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (5,'������� �л� ��Ʈ������ ���� ���α׷�',to_date('2014-03-03-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2020-03-01-00-00-00','YYYY-MM-DD-HH24-MI-SS'),'�������б� ������а� ���� ��Ʈ������ ���� ���� ���α׷�','y','������Ʈ�� ����� ��θ�',10);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (6,'KH û������ ���� ���α׷�',to_date('2014-09-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-09-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),'KH ĳ��Ż û�� ������ �� ���� ���� ���� ���α׷�','y','������Ʈ�� ����� ��θ�',6);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (7,'Final ������Ʈ',to_date('2014-06-13-01-14-54','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-04-28-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'KH������, ������1�������п��� �̷������ �ڹ����α׷��ֹ��� Final Project','y','������Ʈ�� ����� ��θ�',5);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (8,'�ڹ� ���α׷��� �����ϱ� å ����',to_date('2014-06-13-07-19-50','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-01-21-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'������ �ڹٸ� ���� ����ְ� ��� �ֵ��� �����ϰ� ģ���� �������� �ٰ����� KH���ǻ��� �� ����','y','������Ʈ�� ����� ��θ�',17);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (9,'�Ե�ĥ�� �Ż�ǰ ��ȹ',to_date('2014-06-14-01-53-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-03-02-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'�Ե� ��ۿ��� ���Ӱ� ����ϴ� ����ǰ ���ῡ ���� ��ȹ�� �Դϴ�.','y','������Ʈ�� ����� ��θ�',2);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (10,'LA �ڷ� ��� 2�� ���߱�ȹ',to_date('2014-06-13-01-14-54','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-08-20-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'���� ��� ���� ������ ������ ���� ���ǽ��� ��ȹ��','n','������Ʈ�� ����� ��θ�',9);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (11,'���Ÿ���',to_date('2014-06-13-01-14-54','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-04-28-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'�������� �� ���� ���ó�','y','������Ʈ�� ����� ��θ�',15);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (12,'���������ϱ�',to_date('2014-06-13-07-19-50','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-01-21-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'���� 500�� ���� ������','y','������Ʈ�� ����� ��θ�',17);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (13,'�ȵ���̵� ������',to_date('2014-06-14-01-53-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-03-02-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'���� ������ ����� ���ô�','y','������Ʈ�� ����� ��θ�',6);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (14,'��õ�������',to_date('2014-06-13-01-14-54','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-08-20-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'���� ���� Żȯ ����','n','������Ʈ�� ����� ��θ�',14);
--������Ʈ�� 8�������� �������

Create Table Skin (
  skinid number primary key,
  skinname nvarchar2(50) not null
);

insert into Skin(skinid, skinname) values (1, 'basic');


CREATE TABLE team (
	teamid NUMBER PRIMARY KEY,
	projectseq NUMBER REFERENCES project(projectid) NOT NULL,
	memseq NUMBER REFERENCES member(memberid) NOT NULL,
	grade NUMBER NOT NULL,
	participation nvarchar2(10) NOT NULL,
  skinid number default(1) references Skin(skinid) 
);



INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (1,1,1,2,'����',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (2,1,2,1,'����',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (3,1,3,1,'����',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (4,1,4,1,'����',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (5,1,5,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (6,2,6,2,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (7,2,7,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (8,2,8,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (9,2,9,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (10,2,10,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (11,3,11,2,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (12,3,12,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (13,3,13,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (14,3,14,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (15,4,16,2,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (16,4,17,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (17,4,18,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (18,4,19,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (19,4,20,1,'����',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (20,5,1,2,'����',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (21,5,2,1,'����',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (22,5,3,2,'����',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (23,5,4,2,'����',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (24,5,5,2,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (25,6,6,2,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (26,6,7,2,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (27,6,8,2,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (28,6,9,1,'����',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (29,6,10,2,'����',1);



CREATE TABLE data (
	dataid NUMBER PRIMARY KEY,
	filename VARCHAR2(100) NOT NULL,
	orgfilename VARCHAR2(100) NOT NULL,
	fileexplanation NVARCHAR2(100) NULL,
	projectseq NUMBER REFERENCES project(projectid) NOT NULL
);

INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (1,'������Ʈ �䱸����1.pdf','������Ʈ �䱸����.pdf','������Ʈ �䱸������ ������ ����',1);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (2,'������Ʈ �䱸����2.pdf','������Ʈ �䱸����.','������Ʈ �䱸������ ������ ����',1);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (3,'������Ʈ �䱸����3.pdf','������Ʈ �䱸����.pdf','������Ʈ �䱸������ ������ ����',1);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (4,'�������Һд�1.pdf','�������Һд�.pdf','�� �������� �ؾ����ϰ� ���� ',2);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (5,'���α׷� ����/���� ���ǻ���1.pdf','���α׷� ����/���� ���ǻ���.pdf','������Ʈ�� ���ǻ����� ������ ����',2);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (6,'���α׷� ����/���� ���ǻ���2.pdf','���α׷� ����/���� ���ǻ���.pdf','������Ʈ�� ���ǻ����� ������ ����',2);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (7,'���α׷� ����/���� ���ǻ���3.pdf','���α׷� ����/���� ���ǻ���.pdf','������Ʈ�� ���ǻ����� ������ ����',3);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (8,'�������Һд�1.pdf','�������Һд�.pdf','�� �������� �ؾ����ϰ� ���� ',3);
insert into Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
values (9,'������Ʈ �䱸����1.pdf','������Ʈ �䱸����.pdf','������Ʈ �䱸������ ������ ����',3);
insert into Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
values (10,'Ĭ���� ���� �޴�.pdf','Ĭ���� ���� �޴�.pdf','Ĭ���� �޴���',5);


CREATE TABLE filelog (
	logid NUMBER PRIMARY KEY,
	dataseq NUMBER REFERENCES data(dataid) NOT NULL,
	state nvarchar2(20) NOT NULL,
	editDate DATE NOT NULL,
	teamseq NUMBER REFERENCES team(teamid) NOT NULL
);

INSERT INTO FileLog (logId,dataSeq,state,editDate,teamSeq) VALUES (1,1,'upload',to_date('2014-06-13-11-23-44','YYYY-MM-DD-HH24-MI-SS'),1);
INSERT INTO FileLog (logId,dataSeq,state,editDate,teamSeq) VALUES (2,1,'download',to_date('2014-06-14-11-45-13','YYYY-MM-DD-HH24-MI-SS'),2);
INSERT INTO FileLog (logId,dataSeq,state,editDate,teamSeq) VALUES (3,1,'download',to_date('2014-06-15-12-49-13','YYYY-MM-DD-HH24-MI-SS'),3);
INSERT INTO FileLog (logId,dataSeq,state,editDate,teamSeq) VALUES (4,1,'download',to_date('2014-06-15-13-43-13','YYYY-MM-DD-HH24-MI-SS'),4);
INSERT INTO FileLog (logId,dataSeq,state,editDate,teamSeq) VALUES (5,1,'download',to_date('2014-06-16-10-41-13','YYYY-MM-DD-HH24-MI-SS'),5);
INSERT INTO FileLog (logId,dataSeq,state,editDate,teamSeq) VALUES (6,4,'upload',to_date('2014-06-10-11-23-44','YYYY-MM-DD-HH24-MI-SS'),6);
INSERT INTO FileLog (logId,dataSeq,state,editDate,teamSeq) VALUES (7,4,'download',to_date('2014-06-11-11-45-13','YYYY-MM-DD-HH24-MI-SS'),7);
INSERT INTO FileLog (logId,dataSeq,state,editDate,teamSeq) VALUES (8,4,'download',to_date('2014-06-11-12-49-13','YYYY-MM-DD-HH24-MI-SS'),8);
INSERT INTO FileLog (logId,dataSeq,state,editDate,teamSeq) VALUES (9,4,'download',to_date('2014-06-12-13-43-13','YYYY-MM-DD-HH24-MI-SS'),9);
INSERT INTO FileLog (logId,dataSeq,state,editDate,teamSeq) VALUES (10,4,'download',to_date('2014-06-13-10-41-13','YYYY-MM-DD-HH24-MI-SS'),10);
insert into FileLog (logId,dataSeq,state,editDate,teamSeq) values (11,7,'upload',to_date('2014-06-13-11-23-44','YYYY-MM-DD-HH24-MI-SS'),11);
insert into FileLog (logId,dataSeq,state,editDate,teamSeq) values (12,7,'download',to_date('2014-06-13-11-45-13','YYYY-MM-DD-HH24-MI-SS'),12);
insert into FileLog (logId,dataSeq,state,editDate,teamSeq) values (13,7,'download',to_date('2014-06-13-11-45-13','YYYY-MM-DD-HH24-MI-SS'),13);
insert into FileLog (logId,dataSeq,state,editDate,teamSeq) values (14,10,'upload',to_date('2014-06-13-11-23-44','YYYY-MM-DD-HH24-MI-SS'),14);
insert into FileLog (logId,dataSeq,state,editDate,teamSeq) values (15,10,'download',to_date('2014-06-13-11-45-13','YYYY-MM-DD-HH24-MI-SS'),15);



CREATE TABLE teammemo (
	teammemoid NUMBER PRIMARY KEY,
	teamseq NUMBER REFERENCES team(teamid) NOT NULL,
	subject NVARCHAR2(100) NOT NULL,
	content NVARCHAR2(1000) NOT NULL,
	regdate DATE DEFAULT(SYSDATE) NOT NULL,
	theme NUMBER NULL
);

INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme ) 
VALUES (1, 1, '���� Ư��', '�� �������� ������ ����� �ľ��Ͽ� ������ ���� ������ �й��Ѵ�. ', default, null);
INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme )
VALUES (2, 2, '���� �ľ�', '������Ʈ�� ��� �������� �ִ��� �ľ��Ѵ�. ', default, null);
INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme ) 
VALUES (3, 3, '��� �ľ�', '���忡 �ʿ��� ���� �ľ��Ѵ�.', default, null);
INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme ) 
VALUES (4, 1, '�� ȸ��', '������Ʈ�� ������ �������� ȸ�� ���� ���� �ʿ� ', default, null);
INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme ) 
VALUES (5, 4, '�� ���� Ȯ�� �ϼ���', '�� ������ ������ �����Ǿ� �ִ� ��üȸ�ǿ� ���� �������� ���׵��� �÷Ƚ��ϴ�. �ش��ڴ� �ݵ�� �����ϼ���. ', to_date('2014-06-14-10-16-34','YYYY-MM-DD-HH24-MI-SS'), null);
INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme ) 
VALUES (6, 5, '�̹��ֱ��� ����', '�̹��ֱ��� �̹� ���� �����ؾ� �մϴ�.', default, null);


CREATE TABLE teamboardsort (
	teamboardsortid NUMBER PRIMARY KEY,
	projectseq NUMBER REFERENCES project(projectid) NOT NULL,
	subject NVARCHAR2(20) NOT NULL,
	sort NUMBER NOT NULL
);

INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(1, 1, '���ڽ�', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(2, 1, '����', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(3, 2, '������', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(4, 2, '���ڽ�', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(5, 2, '��Ŭ����', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(6, 3, '����', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(7, 3, '������', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(8, 4, '�������� �Խ���', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(9, 4, 'ģ�� �Խ���', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(10, 5, '���� �Խ���', 2);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(11, 5, '����', 1);



CREATE TABLE teamboard (
	teamboardid NUMBER PRIMARY KEY,
	subject NVARCHAR2(100) NOT NULL,
	content NVARCHAR2(1000) NOT NULL,
	teamseq NUMBER REFERENCES team(teamid) NOT NULL,
	regdate DATE NOT NULL,
	readcount NUMBER NOT NULL,
	filename VARCHAR2(100) NULL,
	orgfilename VARCHAR2(100) NULL,
	theme NUMBER NOT NULL,
	teamboardsortseq NUMBER REFERENCES teamboardsort(teamboardsortid) NOT NULL,
	teamboardgrade NUMBER NOT NULL
);



INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(1, '�����߰� ������ ���Ͽ�...', '������ �������δ� ���� ������ �����ϱⰡ ���� ���� �� �����ϴ�. �׷��� 2������ �߰��� ������ ������ �ϴµ� �ٵ� ��� �����ϼ���?', 1, '2014-06-17', 2, null, null, 1 ,1, 2 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(2, '�̹��� ���� ���� �����Դϴ�.', '�λ� �� �ۿɸ��ϴ�. �����̶� �������� �˰� ���� ���̶� �Ұ��� ������ �Ƴ׿� ������ �� ��Ź�帳�ϴ�. ', 2, '2014-06-18', 0, null, null, 1 ,1, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(3, '���� �λ�帳�ϴ�. ', '���� �ƴ� ����� ������ �̹� ���� ���� ģ�������� �ؿ�', 3, '2014-06-18', 1, null, null, 1 ,2, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(4, '������ Ư���� �ǰ��մϴ�', '������, �������� �� ��û�ؾ��� ���� ������ ��û�ϸ鼭 �������� ��Ű���??', 6, '2014-06-17', 1, null, null, 1 ,3, 2 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(5, '�̹��� ���� ���� �����Դϴ�.', '�λ� �� �ۿɸ��ϴ�. ������� ������ ������ �����ϰ� �Ǿ����ϴ�. �ߺ�Ź�帳�ϴ�. ', 7, '2014-06-18', 1, null, null, 1 ,4, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(6, '���� �λ�帳�ϴ�. ', '���� �ƴ� ����� ������ �̹� ���� ���� ģ�������� �ؿ�', 8, '2014-06-18', 1, null, null, 1 ,5, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(7, '������ ȸ��!!','������ �ݿ��Ͽ� ȸ���� �����ҷ� �մϴ�. �ǰ� �����ּ��� - ����- ',11, to_date('2014-06-15-13-42-12','YYYY-MM-DD-HH24-MI-SS'), 2, null, null, 1 ,6, 2 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(8, '���Ŷ� ���Ŷ�', '�������� ���ó� ġ������~', 12, '2014-06-15', 20, null, null, 1 ,6, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(9, '���ɵ���', '������ �� ���� �پ���', 13, '2014-06-14', 43, null, null, 1 ,7, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(10, '�ȳ��ϼ���.', '���غ��ô�.', 14, '2014-06-18', 10, null, null, 1 ,7, 1 );




CREATE TABLE teamcomment (
	teamcommentid NUMBER PRIMARY KEY,
	teamcomment NVARCHAR2(1000) NOT NULL,
	regdate DATE DEFAULT(SYSDATE) NOT NULL,
	teamboardseq NUMBER REFERENCES teamboard(teamboardid) NOT NULL,
	teamseq NUMBER REFERENCES team(teamid) NOT NULL
);

INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(1, '�ݰ����� �츮 ������ �غ���', default, 2, 1);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(2, '���� �� ��Ź�帳�ϴ�. ', default, 2, 3);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(3, '�ݰ����� �츮 ������ �غ���', default, 4, 7);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(4, '���� �� ��Ź�帳�ϴ�. ������ ���� �սô�. ������ �ٸ� ���� �࿧�غ��� �� ', default, 4, 6);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(5, '�ݿ��� ���ƿ�! ���� ����',to_date('2014-06-15-21-45-10','YYYY-MM-DD-HH24-MI-SS'), 9, 11);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(6, '���ָ��ǰǵ�~', sysdate, 10, 12);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(7, '�̷� �� ���� �� ģ����', sysdate, 9, 14);



CREATE TABLE permission (
	permissionid NUMBER PRIMARY KEY,
	teamboardseq NUMBER REFERENCES teamboard(teamboardid) NULL,
	teamseq NUMBER REFERENCES team(teamid) NULL
);

INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(1, 1, 1);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(2, 1, 2);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(3, 1, 3);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(4, 1, 4);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(5, 1, 5);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(6, 4, 6);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(7, 4, 7);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(8, 4, 8);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(9, 4, 9);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(10, 4, 10);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(11, 4, 9);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(12, 9, 11);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(13, 9, 13);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(14, 9, 12);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(15, 9, 14);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(16, 10, 11);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(17, 10, 12);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(18, 10, 13);
INSERT INTO PERMISSION (PERMISSIONID,TEAMBOARDSEQ,TEAMSEQ) VALUES(19, 10, 14);


CREATE TABLE calendar (
	calendarid NUMBER PRIMARY KEY,
	subject NVARCHAR2(100) NOT NULL,
	content NVARCHAR2(1000) NOT NULL,
	startday DATE NOT NULL,
	endday DATE NOT NULL,
	color NVARCHAR2(10) NULL
);



INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (1,'���� 12�ÿ� ����','���� �λ��ϴ� �ð��� ������ ���� ������ ���ı� ��� �Ե����� 6�� 000����������� ����� �����Դϴ�.',to_date('2014-06-13-18-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-22-00-00','YYYY-MM-DD-HH24-MI-SS'),'blue');
INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (2,'�����ֿ� ȸ�ǰ� 9�ÿ� ����','���� ����ڵ���� ������ ���� ������ �ľ��ϴ� �ð��Դϴ�.',to_date('2014-06-15-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-15-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'red');
INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (3,'������ �������� ��','�������̶� �������ϴ� �ð��� ���� �����Դϴ�.',to_date('2014-06-17-06-00-00','YYYY-MM-DD-HH24-MI-SS'), to_date('2014-06-17-23-00-00','YYYY-MM-DD-HH24-MI-SS'),'black');
INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (4,'���/���� ���� ����','���/���� �۾��� �ʿ��� ������ �۾����忡 ����ϴ� ������ �� �����Դϴ�.',to_date('2014-06-19-10-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-19-16-00-00','YYYY-MM-DD-HH24-MI-SS'),'blue');
INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (5,'ȸ�� ���� 9�� ����','������Ʈ ���� ������� ȸ�Ǹ� ���� �����Դϴ�.',to_date('2014-06-25-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-25-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'red');
INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (6,'���� ������ ����ڿ� ȸ��','���翡�� ������ ��� ������ ���� �������� �湮�� �����Դϴ�.',to_date('2014-06-29-13-00-00','YYYY-MM-DD-HH24-MI-SS'), to_date('2014-06-29-15-00-00','YYYY-MM-DD-HH24-MI-SS'),'black');
insert into Calendar (calendarId,subject,content,startDay,endDay,color) values (7,'���� 4�� ȸ��','�ƹ��Կ� ȸ�ǰ� �ֽ��ϴ�.',to_date('2014-06-13-16-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-18-00-00','YYYY-MM-DD-HH24-MI-SS'),'red');
insert into Calendar (calendarId,subject,content,startDay,endDay,color) values (8,'������ ���þ� �ѱ��� ����','������ ��~',to_date('2014-06-18-07-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-18-09-30-00','YYYY-MM-DD-HH24-MI-SS'),'red');



CREATE TABLE teamcalendar (
	teamcalendarid NUMBER PRIMARY KEY,
	teamseq NUMBER REFERENCES team(teamid) NOT NULL,
	calendarseq NUMBER REFERENCES calendar(calendarid) NOT NULL
);


INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(1, 1, 1);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(2, 2, 1);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(3, 3, 1);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(4, 4, 1);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(5, 5, 1);
--������ȣ 1-5 ������� �����ֿ� ȸ�ǰ� 9�ÿ� ������ �ϱ�� ����
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(6, 1, 2);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(7, 2, 2);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(8, 3, 2);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(9, 4, 2);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(10, 5, 2);
--������ȣ 1-5 ������� ������ �������� ����� ����
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(11, 1, 3);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(12, 2, 3);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(13, 3, 3);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(14, 4, 3);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(15, 5, 3);

INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(16, 6, 4);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(17, 7, 4);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(18, 8, 4);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(19, 9, 4);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(20, 10, 4);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(21, 6, 5);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(22, 7, 5);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(23, 8, 5);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(24, 9, 5);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(25, 10, 5);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(26, 6, 6);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(27, 7, 6);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(28, 8, 6);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(29, 9, 6);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(30, 10, 6);
insert into TeamCalendar (teamCalendarId,teamSeq,calendarSeq) values (31,11,7);
insert into TeamCalendar (teamCalendarId,teamSeq,calendarSeq) values (32,12,7);
insert into TeamCalendar (teamCalendarId,teamSeq,calendarSeq) values (33,13,7);
insert into TeamCalendar (teamCalendarId,teamSeq,calendarSeq) values (34,14,8);
insert into TeamCalendar (teamCalendarId,teamSeq,calendarSeq) values (35,11,8);


CREATE TABLE BP (
	bpid NUMBER PRIMARY KEY,
	projectseq NUMBER REFERENCES project(projectid) NOT NULL,
	name NVARCHAR2(100) NOT NULL,
	startday DATE NOT NULL,
	endday DATE NOT NULL,
	explanation NVARCHAR2(1000) NULL,
	state NVARCHAR2(10) NOT NULL
);



--���� ������Ʈ�� ���� 3���� bp


INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(1, 1, '���� �� ����� ���μ���', to_date('2014-07-13-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-01-20-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'������ �⺻���� ������ �Աݰ� ���, �ű⼭ �Ļ��Ǵ� ���ݰ� ���ݽý����� ����','������');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(2, 1, '���� �� ���� �ý���', to_date('2014-09-13-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-04-20-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'����ݾװ� ����ݸ�, �Ⱓ�� Ȱ���� ���� �����ǰ�� �׿� ���� �ý����� ����','������');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(3, 1, '�λ���� �� ���α׷� ����', to_date('2014-10-23-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-10-22-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'���α׷��� ��ǰ�� �߰� Ȥ�� �����ϰų� �ݾ��̳� �Ⱓ , ������ �����ϰų� �׿� ���� ������ ���� �� ��� �������� �� �� �ִ����� ���� �ý���','������');
insert into BP (BPId,projectSeq,name,startDay,endDay,explanation,state) 
values (4,1,'�䱸�м� �۾�',to_date('2014-06-13-07-00-00','YYYY-MM-DD-HH24-MI-SS'),
to_date('2014-06-20-13-00-00','YYYY-MM-DD-HH24-MI-SS'),'�䱸�м� �۾��� ����  BP�Դϴ�.','�Ϸ�');
insert into BP (BPId,projectSeq,name,startDay,endDay,explanation,state) 
values (5,1,'DB �۾�',to_date('2014-06-21-13-24-53','YYYY-MM-DD-HH24-MI-SS'),
to_date('2014-07-18-13-00-00','YYYY-MM-DD-HH24-MI-SS'),'DB ������ �۾� BP�Դϴ�.','������');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(6, 2, '����/��� ���� ����', to_date('2014-06-16-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-01-20-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'�� �Ǽ�/��� ���� ����� ����/��� ������ ���� ���ֿ� ���õ� ������ �����ϴ� BP','������');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(7, 2, '�Ǽ����� ����/��� ��Ȳ����', to_date('2014-06-20-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-04-20-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'�Ǽ� ���忡�� ������ �ʿ��� ���������μ� �� �Ǽ����帶�� ������ �����Ѵ�','������');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(8, 2, '�λ���� �� ���α׷� ����', to_date('2014-06-20-10-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-10-22-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'���α׷��� ��ǰ�� �߰� Ȥ�� �����ϰų� �ݾ��̳� �Ⱓ , ������ �����ϰų� �׿� ���� ������ ���� �� ��� �������� �� �� �ִ����� ���� �ý���','������');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(9, 2, '���������ָ� ���� �Ϻ��� ����', to_date('2014-06-09-00-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-10-20-00-00-00','YYYY-MM-DD-HH24-MI-SS'),'�Ϻ��� ���������ָ� ���Ͽ� ����ؼ� �����ϰ� ���ô� ����','������');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(10, 3, '100�� ���������ϱ�', to_date('2014-06-20-00-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-10-30-23-00-00','YYYY-MM-DD-HH24-MI-SS'),'���������� ���縦 �������Ͽ� ����븦 �������� ���͵����','������');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(11, 3, 'ERD����', to_date('2014-06-10-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-10-15-17-00-00','YYYY-MM-DD-HH24-MI-SS'),'ERD���� �Ϻ��� ���̺��� ����� ���ô�.','������');


CREATE TABLE teambp (
	teambpid NUMBER PRIMARY KEY,
	bpseq NUMBER REFERENCES bp(bpid) NOT NULL,
	teamseq NUMBER REFERENCES team(teamid) NOT NULL,
	grade NUMBER NULL
);

INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(1, 1, 2, 2);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(2, 2, 3, 2);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(3, 3, 5, 2);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(4, 1, 1, 1);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(5, 2, 4, 1);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(6, 6, 6, 2);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(7, 7, 7, 2);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(8, 8, 8, 2);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(9, 9, 9, 1);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(10, 6, 10, 1);
insert into TeamBP (teamBpId,BPSeq,teamSeq,grade) values (11,11,11,1);
insert into TeamBP (teamBpId,BPSeq,teamSeq,grade) values (12,11,12,2);
insert into TeamBP (teamBpId,BPSeq,teamSeq,grade) values (13,10,11,2);
insert into TeamBP (teamBpId,BPSeq,teamSeq,grade) values (14,10,13,1);
insert into TeamBP (teamBpId,BPSeq,teamSeq,grade) values (15,11,14,2);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(16, 1, 1, 1);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(17, 1, 2, 1);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(18, 6, 6, 2);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(19, 6, 7, 2);
INSERT INTO teambp (teambpid, bpseq, teamseq, grade) VALUES(20, 11,11, 1);


CREATE TABLE business (
	businessid NUMBER PRIMARY KEY,
	bpseq NUMBER REFERENCES bp(bpid) NOT NULL,
	subject NVARCHAR2(100) NOT NULL,
	filename NVARCHAR2(100) NULL,
	orgfilename NVARCHAR2(100) NULL,
	content NVARCHAR2(2000) NOT NULL,
	state NVARCHAR2(3) NOT NULL,
	importance NUMBER NOT NULL,
	editdate DATE NOT NULL,
	startday DATE NOT NULL,
	endday DATE NOT NULL
);




INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(1, 1, 'input�� output ��� ����', null, null, '���� ���ö� �� �ܾ��� �������� ���� �� ���̳ʽ��ǰ� �ϴ� ���', '���', 2, to_date('2014-06-12-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-16-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(2, 1, 'Ʈ����ǰ� �ݸ����', null, null, '���� ���ÿ� �Աݵǰų� ��ݵɽ� ������ ��߳��� ���� �����ϱ� ���� ��ɰ� ���� ����� �����־���� �ݾ� ����ϴ� ���', '���', 3, to_date('2014-06-12-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-08-19-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(3, 2, '��Ȳ��Ŀ� ���� �ݸ� ����', null, null, '���⿡ ���� �Ͻ÷� ���� �����Ͻû�ȯ�� ���ڿ� ������ �յ��ϰ� ������ ���� �յ���һ�ȯ ����� �����ϴ� ���', '���', 3, to_date('2014-06-12-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-01-17-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-01-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(4, 3, '���޿� �ٸ� ���ٱ���', null, null, 'ȸ���� �������� ���޿� ���� ���α׷��� ������ �� �ִ� ������ ������ ���� �� �� ', '���', 3, to_date('2014-06-12-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-12-17-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-01-27-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(5, 6, 'ȿ������ ��������� ���� ��ǰ �̵���� �� ȸ�� ���赵 ����', null, null, '������ ȿ������ ��������� ���� ���� ��γ� ��ǰ ���� �� ������ ���� ����м��� ȸ�� ���赵 ����', '���', 2, to_date('2014-06-17-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-16-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(6, 6, '���� ȿ�������� �Ǽ����忡 �����ϰ� ���������� ���� �����׸� ����', null, null, '���� ���ÿ� �Աݵǰų� ��ݵɽ� ������ ��߳��� ���� �����ϱ� ���� ��ɰ� ���� ����� �����־���� �ݾ� ����ϴ� ���', '���', 3, to_date('2014-06-18-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-17-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(7, 7, '�Ǽ����忡�� ���� �۾������� ������ ������ �ľ��ϰ� �й��ϱ� ���� ���� ����öĢ�� ����', null, null, '���⿡ ���� �Ͻ÷� ���� �����Ͻû�ȯ�� ���ڿ� ������ �յ��ϰ� ������ ���� �յ���һ�ȯ ����� �����ϴ� ���', '���', 3, to_date('2014-06-19-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-06-18-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-01-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(8, 7, '�λ������ ���� �����ڿ� ��Ʈ��ũ ����', null, null, 'ȸ���� �������� ���޿� ���� ���α׷��� ������ �� �ִ� ������ ������ ���� �� �� ', '���', 3, to_date('2014-06-12-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-26-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-24-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (9, 11, '������ ����(1��)',null,null,'���� �䱸���� ����','�Ϸ�',2,
to_date('2014-06-12-23-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-11-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-15-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (10, 11, '1�� �䱸���� ����',null,null,'���յ� �䱸������ �����մϴ�. 2�������� ���� �����ڷḦ �߰��� �غ��մϴ�.','�Ϸ�',2,
to_date('2014-06-13-15-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-15-30-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-18-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (11, 11, '������ ����(2��)',null,null,'���� �䱸���� ����','�Ϸ�',3,
to_date('2014-06-14-07-00-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-14-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-14-15-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (12, 11, '2�� �䱸���� ����',null,null,'���յ� �䱸������ �����մϴ�.','�Ϸ�',2,
to_date('2014-06-12-23-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-14-16-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-14-19-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (13, 1, 'ERD �ۼ��۾�',null,null,'2�� �䱸���� ������ �������� ERD�� �����մϴ�.','�Ϸ�',2,
to_date('2014-06-22-09-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-22-10-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-22-20-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (14, 2, 'ERD �����۾�',null,null,'�ʱ� ERD�� �����ϰ�, ��Ű�� ������ �����մϴ�','�Ϸ�',3,
to_date('2014-06-12-23-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-23-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-23-17-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (15, 3, '������ ���۾� �ۼ�',null,null,'ERD�� �������� �����ͺ��̽� ��ɹ��� �ۼ��մϴ�.','�Ϸ�',1,
to_date('2014-06-12-23-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-24-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-24-17-10-00','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(16, 4, '���ִ� �� ����', null, null, '���� ���ϴ� ���ִ� �� ������', '���', 1, to_date('2014-06-05-09-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-25-00-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(17, 5, '������ ���� �Ĺݱ� �Ϻ� ���͵�', null, null, 'sky�� ���پ���', '������', 2, to_date('2014-01-01-09-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-09-10-00-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(18, 6, '�鵥���͸� ������', null, null, '������ ���� �Ϻ��� ERD ���', '������', 3, to_date('2014-06-10-00-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-01-00-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-01-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(19, 7, '�Ϲݱ� ���԰�ä ���� ����', null, null, '���ο� ���Լ����� ���� �������� �ɻ������ ���Ѵ�.', '������', 3, to_date('2014-06-10-14-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-26-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-30-00-00-00','YYYY-MM-DD-HH24-MI-SS') );


CREATE TABLE teambusiess (
	teambusinessid NUMBER PRIMARY KEY,
	businessseq REFERENCES business(businessid) NOT NULL,
	teambpseq REFERENCES teambp(teambpid) NOT NULL
);



INSERT INTO teambusiess(teambusinessid, businessseq, teambpseq) VALUES(1, 1, 1);
INSERT INTO teambusiess(teambusinessid, businessseq, teambpseq) VALUES(2, 2, 4);
INSERT INTO teambusiess(teambusinessid, businessseq, teambpseq) VALUES(3, 3, 2);
INSERT INTO teambusiess(teambusinessid, businessseq, teambpseq) VALUES(4, 4, 3);
INSERT INTO teambusiess(teambusinessid, businessseq, teambpseq) VALUES(5, 6, 6);
INSERT INTO teambusiess(teambusinessid, businessseq, teambpseq) VALUES(6, 7, 8);
INSERT INTO teambusiess(teambusinessid, businessseq, teambpseq) VALUES(7, 8, 9);
INSERT INTO teambusiess(teambusinessid, businessseq, teambpseq) VALUES(8, 8, 10);


CREATE TABLE businesscomment (
	businesscommentid NUMBER PRIMARY KEY,
	businessseq NUMBER REFERENCES business(businessid) NOT NULL,
	teamseq NUMBER REFERENCES team(teamid) NOT NULL,
	content NVARCHAR2(300) NULL
);

INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (1,2,2 ,'����� �� ��ġ�� �� ������ ���� �����ؿ�' );  
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (2,2,4 ,'������' );  
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (3,5,8 ,'������ ���� �ڼ��� ������ �ʿ��մϴ�.' );  
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (4,5,10 ,'���ְ����� ���� ���赵�� ���� ����� �ƴѵ� �մϴ�.' );
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (5,7,10 ,'ERD�� �����ؾ��� �κ��� �߰ߵ˴ϴ�. ��ü���� ������ ������ Ȯ���� �ּ���' ); 
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (6,7,9,'�䱸�м��� �߿��ϴٰ� �����մϴ�.' );  
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (7,8,10 ,'���̺�� 44������ �� �þ�� �Ұ� �����ϴ�.' ); 



CREATE TABLE businesslog (
	businesslogid NUMBER PRIMARY KEY,
	businessseq NUMBER REFERENCES business(businessid) NOT NULL,
	beforestate NVARCHAR2(200) NOT NULL,
	afterstate NVARCHAR2(200) NOT NULL,
	editdate DATE default sysdate NOT NULL
);


INSERT INTO businesslog(businesslogid, businessseq, beforestate , afterstate, editdate) VALUES(1, 1, 'input�� output �Ѵ� ����', 'input�� ����, output�� ���߿� ����', default);
INSERT INTO businesslog(businesslogid, businessseq, beforestate , afterstate, editdate) VALUES(2, 6, '������� �⺻ ���� ����', '���ְ��� �⺻ ���� ����, ������� ���� ����', default);
INSERT INTO businesslog(businesslogid, businessseq, beforestate , afterstate, editdate) VALUES(3, 10, '���� ���� ����� 9�ÿ� ����', '��ӽð��� 11�÷� �ٲ�.', to_date('2014-06-12-23-23-15','YYYY-MM-DD-HH24-MI-SS'));


CREATE TABLE repeatday (
	repeatdayid NUMBER PRIMARY KEY,
	day NVARCHAR2(10) NOT NULL
);

INSERT INTO repeatday (repeatdayid , day) VALUES (1, '��');
INSERT INTO repeatday (repeatdayid , day) VALUES (2, 'ȭ');
INSERT INTO repeatday (repeatdayid , day) VALUES (3, '��');
INSERT INTO repeatday (repeatdayid , day) VALUES (4, '��');
INSERT INTO repeatday (repeatdayid , day) VALUES (5, '��');
INSERT INTO repeatday (repeatdayid , day) VALUES (6, '��');
INSERT INTO repeatday (repeatdayid , day) VALUES (7, '��');
INSERT INTO repeatday (repeatdayid , day) VALUES (8, '����');
INSERT INTO repeatday (repeatdayid , day) VALUES (9, '�ָ�');

CREATE TABLE repeat (
	repeatid NUMBER PRIMARY KEY,
	businessseq REFERENCES business(businessid) NOT NULL,
	repeatdayseq REFERENCES repeatday(repeatdayid) NULL
);

INSERT INTO repeat (repeatid , businessseq, repeatdayseq) VALUES (1, 2, 1);  
INSERT INTO repeat (repeatid , businessseq, repeatdayseq) VALUES (2, 2, 3);  
INSERT INTO repeat (repeatid , businessseq, repeatdayseq) VALUES (3, 6, 1);
INSERT INTO repeat (repeatid , businessseq, repeatdayseq) VALUES (4, 6, 2);
INSERT INTO repeat (repeatid , businessseq, repeatdayseq) VALUES (5, 6, 4); 


CREATE TABLE introducepdf (
	introducepdfid NUMBER PRIMARY KEY,
	filename VARCHAR2(100) NULL,
	orgfilename VARCHAR2(100) NULL
);

insert into introducepdf (introducepdfid, filename, orgfilename)
values (1, '����Ʈ�Ұ�.pdf', '����Ʈ�Ұ�.pdf');

CREATE TABLE budget (
	budgetid NUMBER PRIMARY KEY,
	projectid NUMBER REFERENCES project(projectid) NOT NULL,
	usage NVARCHAR2(100) NOT NULL,
	input NUMBER DEFAULT(0) NULL,
	output NUMBER DEFAULT(0) NULL,
	btime DATE DEFAULT(SYSDATE) NOT NULL
);


INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (1,1,'�� ȸ�� ����',100000,default,to_date('2014-06-13-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (2,1,'���� �繫��ǰ ����',default,15000,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (3,1,'ȸ�ĺ�',default,55000,to_date('2014-06-12-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (4,1,'��ȸ�� ���',100000 , default ,to_date('2014-06-12-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (5,2,'�� ȸ�� ����',100000,default,to_date('2014-06-13-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (6,2,'���� �繫��ǰ ����',default,15000,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (7,2,'ȸ�ĺ�',default,55000,to_date('2014-06-12-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (8,2,'��ȸ�� ���',100000 , default ,to_date('2014-06-12-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
insert into Budget(budgetId,projectId,usage,input,output,bTime) values (9,3,'�� ��� �Ա�',100000,default,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
insert into Budget(budgetId,projectId,usage,input,output,bTime) values (10,3,'������� ����',default,15000,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
insert into Budget(budgetId,projectId,usage,input,output,bTime) values (11,3,'�� ȸ��',default,60000,to_date('2014-06-15-12-53-10','YYYY-MM-DD-HH24-MI-SS'));
insert into Budget(budgetId,projectId,usage,input,output,bTime) values (12,3,'ȸ��',default,60000,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
insert into Budget(budgetId,projectId,usage,input,output,bTime) values (13,3,'å����',default,75000,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));

commit;



