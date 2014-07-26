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
VALUES( 1 ,'임현수', 'aaa001@gmail.com' , '010-1223-6434' , 'pw1234'  ,'n' , 0 , '프로필 사진 경로명');

INSERT INTO member (MEMBERID, membername, email, tel, pw, inform, alertcount, profile)
VALUES( 2 ,'김현덕', 'aaa002@gmail.com' , '010-4123-1938' , 'pw1234'  ,'n' , 0 , '프로필 사진 경로명');

INSERT INTO member (MEMBERID, membername, email, tel, pw, inform, alertcount, profile)
VALUES( 3 ,'임수희', 'aaa003@gmail.com' , '010-0233-2916' , 'pw1234'  ,'y' , 0 , '프로필 사진 경로명');

INSERT INTO member (MEMBERID, membername, email, tel, pw, inform, alertcount, profile)
VALUES( 4 ,'김성현', 'aaa004@gmail.com' , '010-8613-7131' , 'pw1234'  ,'n' , 0 , '프로필 사진 경로명');

INSERT INTO member (MEMBERID, membername, email, tel, pw, inform, alertcount, profile)
VALUES( 5 ,'안지후', 'aaa005@gmail.com' , '010-9813-8249' , 'pw1234'  , 'n' , 0 , '프로필 사진 경로명');

insert into member(memberID, memberName, email, tel, pw, inform, alertCount, profile)
  values(6, '권상우', 'kwon6@naver.com', '010-1111-1111', 'pw1234', 'n', 0, '프로필 사진 경로명');

insert into member(memberID, memberName, email, tel, pw, inform, alertCount, profile)
  values(7, '오지호', 'oh7@naver.com', '010-2222-2222', 'pw1234', 'n', 0, '프로필 사진 경로명');

insert into member(memberID, memberName, email, tel, pw, inform, alertCount, profile)
  values(8, '김갑수', 'kim8@naver.com', '010-3333-3333', 'pw1234', 'y', 0, '프로필 사진 경로명');
  
insert into member(memberID, memberName, email, tel, pw, inform, alertCount, profile)
  values(9, '이정재', 'lee9@naver.com', '010-4444-4444', 'pw1234', 'n', 0, '프로필 사진 경로명');
  
insert into member(memberID, memberName, email, tel, pw, inform, alertCount, profile)
  values(10, '차태현', 'cha10@naver.com', '010-5555-5555', 'pw1234', 'y', 0, '프로필 사진 경로명');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (11, '홍길동', 'test@test.com', '010-3434-4545', 'pw1234', 'y', 1, '홍길동의 프로필사진 경로');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (12, '아무개', 'now@test.com', '010-1232-4124', 'pw1234', 'n', 2, '아무개의 프로필사진 경로');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (13, '하하하', 'today@test.com', '010-6324-2564', 'pw1234', 'n', 0, '하하하의 프로필사진 경로');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (14, '이순신', 'milk@test.com', '010-2342-2343', 'pw1234', 'y', 0, '이순신의 프로필사진 경로');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (15, '효도르', 'ok@test.com', '010-7575-1112', 'pw1234', 'n', 1, '효도르의 프로필사진 경로');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (16, '손오공', 'son@test.com', '010-987-4545', 'pw1234', 'y', 1, '손오공의 프로필사진 경로');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (17, '손오반', 'son1@test.com', '010-9032-2024', 'pw1234', 'y', 2, '손오반의 프로필사진 경로');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (18, '손오천', 'son2@test.com', '010-2222-9513', 'pw1234', 'n', 0, '손오천의 프로필사진 경로');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (19, '호날두', 'honal@test.com', '010-1025-1235', 'pw1234', 'n', 2, '호날두의 프로필사진 경로');

insert into member (MEMBERID,MEMBERNAME,EMAIL,TEL,PW,INFORM,ALERTCOUNT,PROFILE) 
values (20, '즐라탄', 'KIN@test.com', '010-1265-1784', 'pw1234', 'n', 0, '즐라탄의 프로필사진 경로');

CREATE TABLE notification (
	NotificationId NUMBER PRIMARY KEY,
	memseq NUMBER REFERENCES member(memberId) NOT NULL,
	content NVARCHAR2(1000) NOT NULL,
	confirm NVARCHAR2(10) NOT NULL
);

INSERT INTO Notification (NotificationId, memSeq, content, confirm) VALUES (1, 3,'팀원이 탈퇴했습니다.' , 'n');
INSERT INTO Notification (NotificationId, memSeq, content, confirm) VALUES (2, 1,'업무가 변동되었습니다. ' , 'n');
INSERT INTO Notification (NotificationId, memSeq, content, confirm) VALUES (3, 2,'업무가 완료되었습니다. ' , 'n');
insert into Notification (NotificationId, memSeq, content, confirm) values (4, 6,'팀원이 탈퇴했습니다.' , 'n');
insert into Notification (NotificationId, memSeq, content, confirm) values (5, 7,'업무가 변동되었습니다. ' , 'n');
insert into Notification (NotificationId, memSeq, content, confirm) values (6, 8,'업무가 완료되었습니다. ' , 'n');
insert into Notification (NotificationId, memSeq,content,confirm) values (7,11,'신규 프로젝트 팀원이 있습니다.','n');
insert into Notification (NotificationId, memSeq,content,confirm) values (8,12,'신규 프로젝트 팀원이 있습니다.','y');
insert into Notification (NotificationId,memSeq,content,confirm) values (9,13,'신규 프로젝트 팀원이 있습니다.','y');
insert into Notification (NotificationId,memSeq,content,confirm) values (10,14,'신규 프로젝트 팀원이 있습니다.','n');
insert into Notification (NotificationId,memSeq,content,confirm) values (11,11,'신규 프로젝트 팀원이 있습니다.','y');

-----------------------------------------------------------------------------------------------------------
CREATE TABLE question (
	questionid NUMBER PRIMARY KEY,
	content NVARCHAR2(50) NULL
);

INSERT INTO Question (QUESTIONID,CONTENT) VALUES (1, '나의 보물 1호는?');
INSERT INTO Question (QUESTIONID,CONTENT) VALUES (2, '초등학교 때 가장 친한 친구 이름은?');
INSERT INTO Question (QUESTIONID,CONTENT) VALUES (3, '아버지의 성함은?');
INSERT INTO Question (QUESTIONID,CONTENT) VALUES (4, '출신 고등학교 이름은?');
INSERT INTO Question (QUESTIONID,CONTENT) VALUES (5, '나의 추억의 장소는?');

------------------------------------------------------------------------------------------

CREATE TABLE memquestion (
	memquestionId NUMBER PRIMARY KEY,
	memseq NUMBER REFERENCES member(memberId) NOT NULL,
	questionSeq NUMBER REFERENCES question(questionid) NOT NULL,
	quereply NVARCHAR2(50) NULL
);

INSERT INTO memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) VALUES (1, 1, 1, '자전거');
INSERT INTO memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) VALUES (2, 2, 1, '시계');
INSERT INTO memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) VALUES (3, 3, 4, '배명고등학교');
INSERT INTO memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) VALUES (4, 4, 2, '서경창');
INSERT INTO memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) VALUES (5, 5, 5, '광안리');
insert into memQuestion(memQuestionId, memSeq, questionSeq, queReply) values(6, 6, 1, '코코');
insert into memQuestion(memQuestionId, memSeq, questionSeq, queReply) values(7, 7, 1, '고양이');
insert into memQuestion(memQuestionId, memSeq, questionSeq, queReply) values(8, 8, 4, '금호고등학교');
insert into memQuestion(memQuestionId, memSeq, questionSeq, queReply) values(9, 9, 5, '동림동');
insert into memQuestion(memQuestionId, memSeq, questionSeq, queReply) values(10, 10, 5, '산동교');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (11, 11, 1, '컴퓨터');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (12, 12, 1, '노트북');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (13, 13, 4, '용산고등학교');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (14, 14, 2, '류성룡');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (15, 14, 2, '최홍만');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (16, 16, 1, '드래곤볼');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (17, 17, 1, '근두운');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (18, 18, 3, '손오공');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (19, 19, 5, '맨체스터');
insert into memQuestion (MEMQUESTIONID,MEMSEQ,QUESTIONSEQ,QUEREPLY) values (20, 20, 1, '자서전');

------------------------------------------------------------------------------------------

CREATE TABLE memo (
	memoid NUMBER PRIMARY KEY,
	memseq NUMBER REFERENCES member(memberid) NOT NULL,
	content NVARCHAR2(100) NULL
);

INSERT INTO Memo (memoId,memSeq,content) VALUES (1,1,'다음주 화요일에 새로운 프로젝트 진행할 예정');
INSERT INTO Memo (memoId,memSeq,content) VALUES (2,1,'다음주 수요일에 새로운 프로젝트를 위한 팀원 모집');
INSERT INTO Memo (memoId,memSeq,content) VALUES (3,1,'프로젝트 생성 이후에 bp등록');
INSERT INTO Memo (memoId,memSeq,content) VALUES (4,1,'새로운 프로젝트는 2014년 말에 완료할 것');
INSERT INTO Memo (memoId,memSeq,content) VALUES (5,2,'프로젝트를 위한 에산 확보 중요!!');
INSERT INTO Memo (memoId,memSeq,content) VALUES (6,2,'다음주에 만들어지는 프로젝트에 합류할 예정');
INSERT INTO Memo (memoId,memSeq,content) VALUES (7,2,'프로젝트 기간동안 술을 자제 한다. ');
insert into Memo (memoId,memSeq,content) values (8,2,'다음주 화요일에 새로운 프로젝트 진행할 예정');
insert into Memo (memoId,memSeq,content) values (9,3,'다음주 수요일에 새로운 프로젝트를 위한 팀원 모집');
insert into Memo (memoId,memSeq,content) values (10,3,'프로젝트 생성 이후에 bp등록');
insert into Memo (memoId,memSeq,content) values (11,3,'새로운 프로젝트는 2014년 말에 완료할 것');
insert into Memo (memoId,memSeq,content) values (12,3,'프로젝트를 위한 에산 확보 중요!!');
insert into Memo (memoId,memSeq,content) values (13,3,'다음주에 만들어지는 프로젝트에 합류할 예정');
insert into Memo (memoId,memSeq,content) values (14,4,'프로젝트 기간동안 술을 자제 한다. ');
insert into Memo (memoId,memSeq,content) values (15,4,'내일 4시에 아무개와 회의가 있음!!');
insert into Memo (memoId,memSeq,content) values (16,4,'수요일 아침 7시 한국 vs 러시아');

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

INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (1,'현덕아 너의 업무 좀 변경해도 될까?',to_date('2014-06-09-17-42-10','YYYY-MM-DD-HH24-MI-SS'), 1, 2, 1);
INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (2,'어.. 머 상관 없는데 어떤 업무로 바뀌어?',to_date('2014-06-10-13-42-10','YYYY-MM-DD-HH24-MI-SS'), 2, 1, 1);
INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (3,'마케팅 쪽을 맡아주었으면 해 팀원 한명이 탈퇴를 해서 ',to_date('2014-06-10-16-22-10','YYYY-MM-DD-HH24-MI-SS'), 1, 2, 1);
INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (4,'알았어 맡아 볼께 ',to_date('2014-06-11-17-23-10','YYYY-MM-DD-HH24-MI-SS'), 2, 1, 1);
INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (5,'그래 고맙다 자세한 일정은 내일 알려줄께 ',to_date('2014-06-11-18-03-10','YYYY-MM-DD-HH24-MI-SS'), 1, 2, 1);
INSERT INTO Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) VALUES (6,'안지후님 저희 프로젝트에 들어오실래요? ',to_date('2014-06-12-18-03-10','YYYY-MM-DD-HH24-MI-SS'), 1, 5, 2);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (7,'권상우는 꽃미남',to_date('2014-06-09-17-42-10','YYYY-MM-DD-HH24-MI-SS'), 6, 7, 1);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (8,'좋은 프로젝트 주제입니다.',to_date('2014-06-10-13-42-10','YYYY-MM-DD-HH24-MI-SS'), 6, 8, 1);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (9,'친구하고 싶습니다.',to_date('2014-06-10-16-22-10','YYYY-MM-DD-HH24-MI-SS'), 6, 9, 3);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (10,'고맙습니다.. 그리고 사랑합니다..',to_date('2014-06-11-17-23-10','YYYY-MM-DD-HH24-MI-SS'), 7, 8, 1);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (11,'프로젝트 일정표 등록했습니다.',to_date('2014-06-11-18-03-10','YYYY-MM-DD-HH24-MI-SS'), 7, 9, 1);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (12,'업무에 관하여 연락드리고 싶습니다.',to_date('2014-06-12-18-03-10','YYYY-MM-DD-HH24-MI-SS'), 10, 7, 1);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (13,'저희 프로젝트에 당신을 초대합니다.',to_date('2014-06-12-22-47-18','YYYY-MM-DD-HH24-MI-SS'),11,15, 2);
insert into Paper (PaperId,content,regDate,sendMemSeq,receiveMemSeq, kind) values (14,'저와 친구가 되어주세요. 사랑합니다.',to_date('2014-06-12-22-47-18','YYYY-MM-DD-HH24-MI-SS'),16,17,3);

---------------------------------------------------------------------------------------
CREATE TABLE acceotance (
	acceptanceid NUMBER PRIMARY KEY,
	paperseq NUMBER REFERENCES paper(paperid) NOT NULL,
	accept NUMBER NULL
);
-- acceptance 테이블  
-- 1. 확인전 2. 수락. 3. 거부
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
VALUES (1,'자유',1,'안녕하세요','이번에 8월말에 새로 프로젝트를 시작하려고 하는데 경력 2년차 이상 같이 모십니다. ',1,to_date('2014-06-10-12-12-15','YYYY-MM-DD-HH24-MI-SS'),3,5,null,null,1000,1);
INSERT INTO Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
VALUES (2,'자유',2,'이번 프로젝트에 대해...','사정이 있어 프로젝트 시작일짜를 변경할까 합니다.  ',1,to_date('2014-05-20-16-12-15','YYYY-MM-DD-HH24-MI-SS'),2,4,null,null,2000,1);
INSERT INTO Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
VALUES (3,'질문',3,'가입했는데요','여기 쓸만하나요 ㅎㅎ 다른 곳 쓰다가 마음에 안들어서 여기 왔어요',1,to_date('2014-05-28-13-34-19','YYYY-MM-DD-HH24-MI-SS'),12,0, null,null,3000,1);
INSERT INTO Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
VALUES (4,'질문',4,'이 xxx넘아','이성현 이넘아 프로젝트 중도 포기하냐 나쁜넘아',1,to_date('2014-05-29-14-34-19','YYYY-MM-DD-HH24-MI-SS'),103,0, null,null,4000,1);
insert into Board(boardId, post_type, memSeq, subject, content, fontNum, regDate, readCount, readCom, imgFileName, imgOrgFileName, thread, depth)
values(5, '자유', 6, '네덜란드 vs 스페인 프젝 모집 공고', '네덜란드 vs 스페인 - 5:1 무적함대 박살났는데.. 같이 프젝할사람?', 1, to_date('2014-06-14', 'YYYY-MM-DD-HH24-MI-SS'), 1, 0, null, null, 1000, 1);
insert into Board(boardId, post_type, memSeq, subject, content, fontNum, regDate, readCount, readCom, imgFileName, imgOrgFileName, thread, depth)
values(6, '자유', 7, '니 똥이다.', '프젝할사람 하고 말라면 말고 ㅡㅡ;', 1, to_date('2014-06-14', 'YYYY-MM-DD-HH24-MI-SS'), 1, 0, null, null, 2000, 1);
insert into Board(boardId, post_type, memSeq, subject, content, fontNum, regDate, readCount, readCom, imgFileName, imgOrgFileName, thread, depth)
values(7, '자유', 8, '똥이나싸라', '똥좀 그만싸고 케리하라고!!', 1, to_date('2014-06-14', 'YYYY-MM-DD-HH24-MI-SS'), 1, 0, null, null, 3000, 1);
insert into Board(boardId, post_type, memSeq, subject, content, fontNum, regDate, readCount, readCom, imgFileName, imgOrgFileName, thread, depth)
values(8, '자유', 9, '재밌냐?', '프젝할사람?? 있냐?? ㅡㅡ;', 1, to_date('2014-06-14', 'YYYY-MM-DD-HH24-MI-SS'), 1, 0, null, null, 4000, 1);
insert into Board(boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (9,'자유',11,'홍길동입니다','새로 가입한 홍길동입니다. 만나서 반갑습니다.',1,to_date('2014-06-12-11-12-15','YYYY-MM-DD-HH24-MI-SS'),3,5,null,null,41000,1);
insert into Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (10,'자유',12,'가입인사 드립니다.~~','홈페이지 엄청 좋아보이네요. 자주 올께요.',1,to_date('2014-06-12-14-54-51','YYYY-MM-DD-HH24-MI-SS'),6,1,null,null,42000,1);
insert into Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (11,'자유',13,'새로 가입한 하하하입니다.','잘지내요.',1,to_date('2014-06-12-17-16-53','YYYY-MM-DD-HH24-MI-SS'),15,7,null,null,43000,1);
insert into Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (12,'자유',14,'애니팡2 좋아하시는 분들 있나요?','애니팡 같이 해요!! 카톡 아이디는 xxxx입니다. 친추하시고 카톡주세요!!',1,to_date('2014-06-12-20-11-17','YYYY-MM-DD-HH24-MI-SS'),7,1,null,null,44000,1);
insert into Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (13,'자유',15,'당산 주변에 사시는분?? 당산에서 Spring스터디 조원 구합니다.','당산 주변에 사시는 분 있나요?? Spring 처음 시작하시는 분들 모여서, 스터디 합니다. 관심있으신 분들은 연락주세요. ',1,to_date('2014-06-12-21-51-26','YYYY-MM-DD-HH24-MI-SS'),2,2,null,null,4500,1);
insert into Board (boardId,post_type,memSeq,subject,content,fontNum,regdate,readCount,readCom,imgFileName,imgOrgFileName,thread,depth) 
values (14,'자유',16,'나는 즐라탄이다','내가 안나가는 월드컵따위 즐',1,to_date('2014-06-13-15-12-15','YYYY-MM-DD-HH24-MI-SS'),7,12,null,null,1000,1);

CREATE TABLE boardcomment (
	commentid NUMBER PRIMARY KEY,
	boardseq NUMBER REFERENCES board(boardid) NOT NULL,
	memseq NUMBER REFERENCES member(memberid) NOT NULL,
	regdate DATE NOT NULL,
	content NVARCHAR2(100) NULL
);

INSERT INTO BoardComment (commentId,boardSeq,memSeq,regdate,content)
VALUES (1,2 , 4 , to_date('2014-05-20-16-45-42','YYYY-MM-DD-HH24-MI-SS'),'정확한 날짜가 언제인가요 ? ' );
INSERT INTO BoardComment (commentId,boardSeq,memSeq,regdate,content)
VALUES (2,2 , 5 , to_date('2014-05-20-16-48-50','YYYY-MM-DD-HH24-MI-SS'),'왜 멋대로 바꾸냐 죽을래? ' );
insert into BoardComment (commentId,boardSeq,memSeq,regDate,content)
values (3,5, 6, to_date('2014-06-14-15-51-42', 'YYYY-MM-DD-HH24-MI-SS'), '스페인의 몰락을 맛볼수 있네요.. 쩝');
insert into BoardComment (commentId,boardSeq,memSeq,regDate,content)
values (4,5, 7, to_date('2014-06-14-15-52-32', 'YYYY-MM-DD-HH24-MI-SS'), '축구와 프젝이 관련이 있나요ㅋ'); 
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (5,10,11,to_date('2014-06-12-16-45-42','YYYY-MM-DD-HH24-MI-SS'),'반가워요. 우리 한번 잘 해봐요!!');
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (6,13,12,to_date('2014-06-13-09-12-12','YYYY-MM-DD-HH24-MI-SS'),'그런가요? 자주 놀러오세요');
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (7,10,13,to_date('2014-06-13-12-54-52','YYYY-MM-DD-HH24-MI-SS'),'네엣~ 잘지내요');
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (8,13,14,to_date('2014-06-13-14-18-22','YYYY-MM-DD-HH24-MI-SS'),'친추 보냈습니다.');
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (9,13,15,to_date('2014-06-13-18-42-19','YYYY-MM-DD-HH24-MI-SS'),'혹시 연락처가? 저는 염창동삽니다. 스터디 참여하고 싶습니다.');
insert into BoardComment (commentId,boardSeq,memSeq,regdate,content)
values (10,14,19,to_date('2014-06-13-22-40-42','YYYY-MM-DD-HH24-MI-SS'),'내가 너를 떨어트렸다.');

--------------------------------------------------------------------------------------

CREATE TABLE commentlabor (
	commentlaborid NUMBER PRIMARY KEY,
	commentseq NUMBER REFERENCES boardcomment(commentid) NOT NULL,
	content NVARCHAR2(200) NOT NULL,
	reporter NUMBER REFERENCES member(memberid) NULL
);

INSERT INTO CommentLabor (commentLaborId,commentSeq,content,reporter) VALUES (1, 2,'초면인데 막말하시나요 신고 들어갑니다.', 2);
insert into CommentLabor(commentLaborId, commentSeq, content, reporter) values(2, 3, '프로젝트와 관련없는 내용이므로 신고하겠습니다.', 8);
insert into CommentLabor (commentLaborId,commentSeq,content,reporter) values (3,10,'말 하는게 겁나 싸가기 없음',12);
insert into CommentLabor (commentLaborId,commentSeq,content,reporter) values (4,10,'약올리고 있음',17);

CREATE TABLE labor (
	laborid NUMBER PRIMARY KEY,
	boardseq NUMBER REFERENCES board(boardid) NOT NULL,
	laborcontent NVARCHAR2(300) NULL,
	reporter NUMBER REFERENCES member(memberid) NULL
);

INSERT INTO Labor (laborId,boardSeq,laborContent,reporter) VALUES (1, 4 ,'욕은  자제 합시다 ',5);
insert into Labor(laborId, boardSeq, laborContent, reporter) values(2, 3, '팀 프로젝트와 관련없는 내용입니다.', 6);
insert into Labor (laborId,boardSeq,laborContent,reporter) values (3,9,'가입인사가 너무 성의 없음',13);
insert into Labor (laborId,boardSeq,laborContent,reporter) values (4,14,'자기가 왕인줄 알고있음',1);


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
VALUES (1,2,'게시물분류','여기 라이센스 비용은 어떻게 되나요? ','결제를 안하나요? 공짜로 쓰면 제약 있나요?','y','y',to_date('2014-04-11-10-16-58','YYYY-MM-DD-HH24-MI-SS'),'게시물종류');
INSERT INTO QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
VALUES (2,5,'게시물분류','프로젝트 트리 구조에 대하여... ','저희가 업무가 많아서요 하나의 프로젝트에 최대 몇개의 bp를 등록할수 있나요 그리고 하나의 bp안에 최대 몇개의 업무가 등록 가능한가요?','n','n',to_date('2014-05-03-10-16-58','YYYY-MM-DD-HH24-MI-SS'),'게시물종류');
insert into QandA(QnAId, memSeq, classification, subject, content, open, replyState, regDate, Qkind)
values(3, 6, '게시물분류', '팀 프로젝트와 관련없는 내용은 어떻게 신고하나요?', '신고를 하고싶은데 방법을 모르겠습니다.', 'y', 'y', to_date('2014-06-14-16-25-11', 'YYYY-MM-DD-HH24-MI-SS'), '게시물종류');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (4,11,'게시물분류','프로젝트 등록 어떻게 해요..','등록하는 방법 좀 알려주세요.','y','y',to_date('2014-06-12-10-16-58','YYYY-MM-DD-HH24-MI-SS'),'게시물종류');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (5,12,'게시물분류','너무 쓸말이 없네요..','백데이터로 쓸 샘플데이터 없나요?... 백데이터 채우기 너무 빡셔요..','y','n',to_date('2014-06-13-10-16-23','YYYY-MM-DD-HH24-MI-SS'),'게시물종류');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (6,13,'게시물분류','기업 단체 구매 상담관련 문의입니다..','저희 회사에서 이번에 팀플프로그램을 단체로 구입하려고 합니다. 홈페이지에 연락처가 따로 없어서 여기에 글 남깁니다. 답변주세요 ','n','n',to_date('2014-06-13-13-12-11','YYYY-MM-DD-HH24-MI-SS'),'게시물종류');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (7,14,'게시물분류','업무 삭제 관련 문제 문의입니다.','업무를 새로 만들자 마자 필요없어져 만들고 얼마 안되서 바로 삭제 눌렀는데 프로그램 오류가 납니다. 확인부탁드립니다.','y','n',to_date('2014-06-13-16-41-19','YYYY-MM-DD-HH24-MI-SS'),'게시물종류');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (8,15,'게시물분류','새로운 기능 제안 입니다.','핸드폰하고 연동은 안되나요?','y','n',to_date('2014-06-13-17-19-58','YYYY-MM-DD-HH24-MI-SS'),'게시물종류');
insert into QandA (QnAId,memSeq,classification,subject,content,open,replystate,regdate,Qkind) 
values (9,17,'게시물분류','등록이 안되요','등록이 안되요 고객번호라도 쓰던가','y','y',to_date('2014-06-14-10-16-58','YYYY-MM-DD-HH24-MI-SS'),'게시물종류');



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
VALUES (1,1,' 게시판에서 욕은 자제해주세요 3번이상 신고접수시 한달 간 저희 사이트에 접속이 제한될 수 있습니다. ', 4 );
insert into alertMessage (alertMessageId,managerSeq,content,memberSeq) 
values (2,1,'해당 사용자의 게시물이 신고되었습니다. 게시판에서 팀프로젝트와 관련된 내용의 글을 작성해주시기 바랍니다. 감사합니다.', 6 );
insert into alertMessage (alertMessageId,managerSeq,content,memberSeq) 
values (3,1,'불법광고물 등록을 자제해 주시기 바랍니다.',13);
insert into alertMessage (alertMessageId,managerSeq,content,memberSeq) 
values (4,1,'선전성 게시물은 경고 대상입니다.',20);

CREATE TABLE qndareply (
	qnareplyid NUMBER PRIMARY KEY,
	qandaSeq NUMBER REFERENCES qanda(qnaid) NOT NULL,
	regdate DATE DEFAULT(SYSDATE) NOT NULL,
	subject NVARCHAR2(200) NOT NULL,
	content NVARCHAR2(2000) NOT NULL,
	managerseq NUMBER REFERENCES manager(managerid) NOT NULL
);

INSERT INTO qndareply (QnAReplyId,QandASeq,regdate,subject,content,managerSeq) 
VALUES (1,1,to_date('2014-06-12-14-17-38','YYYY-MM-DD-HH24-MI-SS'),'re:여기 라이센스 비용은 어떻게 되나요?','저희 프로그램은 무료버전과 유료버전이 있고 무료버전은 프로젝트 갯수 생성에 제한이 있습니다. 최대 3개까지 생성할 수 있습니다. ',1);
insert into qndareply (QnAReplyId,QandASeq,regdate,subject,content,managerSeq) 
values (2,3,to_date('2014-06-14-16-45-38','YYYY-MM-DD-HH24-MI-SS'),'re:신고처리 관련 문의글 답변내용','신고는 신고버튼을 누르시면 즉시 신고처리됩니다. 감사합니다.',1);
insert into qndareply (QnAReplyId,QandASeq,regdate,subject,content,managerSeq) 
values (3,4,to_date('2014-06-12-14-17-38','YYYY-MM-DD-HH24-MI-SS'),'re:프로젝트 등록 어떻게 해요...','프로젝트를 등록하는 방법은 우리 프로그램을 소개하는 소개 PDF에 소개되어 있습니다. 해당 문서를 참고해 주세요.',1);
insert into qndareply (QnAReplyId,QandASeq,regdate,subject,content,managerSeq) 
values (4,9,to_date('2014-06-12-15-00-00','YYYY-MM-DD-HH24-MI-SS'),'re:등록이 안되요.','궁굼하면 500원',1);

CREATE TABLE notice (
	noticeid NUMBER PRIMARY KEY,
	managerseq NUMBER REFERENCES manager(managerid) NOT NULL,
	subject NVARCHAR2(100) NOT NULL,
	content NVARCHAR2(2000) NOT NULL,
	regdate DATE NOT NULL
);

INSERT INTO notice(NOTICEID, managerSeq, subject , content, regdate) 
VALUES( 1, 1, '사이트가 다음달에 개편됩니다.', '안녕하십니까 저희 사이트를 방문해주시는 모든 분들께 감사드리며 여러분들의 성원에 힘입어 저희 사이트가 보다 좋은 서비스로 보답하기 위해 3일 동안 접속을 제한합니다. 감사합니다. ', to_date('2014-06-14-14-17-38', 'YYYY-MM-DD-HH24-MI-SS') );
insert into notice(noticeId, managerSeq, subject, content, regDate)
values(2, 1, '사이트 회원정보 관리 규정이 변경됩니다.', '안녕하세요. 사이트 관리자입니다. 다음달부터 사이트 회원정보 관리 규정이 변경됩니다. 자세한 사항은 직접 문의해주시기 바랍니다. 감사합니다.', to_date('2014-06-14-16-40-00', 'YYYY-MM-DD-HH24-MI-SS'));
insert into Notice (noticeId,managerSeq,subject,content,regDate) 
values (3,1,'공지사항 입니다','처음오신 분들은 소개 PDF를 확인해주세요',to_date('2014-06-10-12-47-18','YYYY-MM-DD-HH24-MI-SS'));
insert into Notice (noticeId,managerSeq,subject,content,regDate) 
values (4,1,'팀플은 여러분의 방문을 언제나 환영합니다~~','안녕하세요 팀플 운영진입니다. 팀플을 사용해주셔서 감사합니다. 항상 최선을 다하는 자세로 여러분의 성원에 보답하겠습니다.',to_date('2014-06-10-12-47-18','YYYY-MM-DD-HH24-MI-SS'));
insert into Notice (noticeId,managerSeq,subject,content,regDate) 
values (5,1,'공지사항 입니다','처음오신 분들은 소개 PDF를 확인해주세요',to_date('2014-06-10-12-47-18','YYYY-MM-DD-HH24-MI-SS'));

CREATE TABLE onecategory (
	onecategoryid NUMBER PRIMARY KEY,
	onename NVARCHAR2(40) NOT NULL
);

INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (1,'Marketing');
INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (2,'It/Internet');
INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (3,'R&D');
INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (4,'생산제조');
INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (5,'전문');
INSERT INTO oneCategory (oneCategoryId,oneName) VALUES (6,'Design');


CREATE TABLE twocategory (
	twocategoryid NUMBER PRIMARY KEY,
	twoname NVARCHAR2(40) NOT NULL,
	onecategoryseq NUMBER REFERENCES onecategory(onecategoryid) NOT NULL
);

INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (1,'광고',1);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (2,'상품기획',1);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (3,'웹기획',2);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (4,'디자인',2);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (5,'프로그래머',2);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (6,'응용프로그래머',2);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (7,'화학',3);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (8,'기계',3);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (9,'건설',3);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (10,'전기',3);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (11,'시공',4);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (12,'설치',4);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (13,'조립',4);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (14,'경영분석',5);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (15,'리서치',5);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (16,'그래픽',6);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (17,'출판',6);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (18,'편집',6);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (19,'의류',6);
INSERT INTO twoCategory (twoCategoryId,twoName,oneCategorySeq) VALUES (20,'제품',6);

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
VALUES (1,'은행 윈코스 전산 프로그램',to_date('2014-07-13-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2016-07-13-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'은행에서 이루어 지는 모든 예금 및 적금과 대출을 위한 통합 전산 프로그램 개발 ','y','프로젝트의 썸네일 경로명',6);
INSERT INTO Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
VALUES (2,'000회사 회계 솔루션',to_date('2014-08-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-08-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),'회사의 모든 매출목록 및 돈의 사용내역을 기록한 장부를 프로그램으로 구현 ','y','프로젝트의 썸네일 경로명',6);
INSERT INTO Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
VALUES (3,'000학교 학생관리 프로그램',to_date('2014-09-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-09-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),'총 1000명의 학생들의 데이터베이스를 활용한 모든 활동을 관리하는 통합 솔루션 ','y','프로젝트의 썸네일 경로명',6);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (4,'토목 전산 프로그램',to_date('2014-05-13-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2016-05-13-23-00-00','YYYY-MM-DD-HH24-MI-SS'),'토목 건설자제 및 인적자원 관리 프로그램','y','프로젝트의 썸네일 경로명',9);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (5,'전기공학 학생 포트폴리오 관리 프로그램',to_date('2014-03-03-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2020-03-01-00-00-00','YYYY-MM-DD-HH24-MI-SS'),'조선대학교 전기공학과 전자 포트폴리오 전용 관리 프로그램','y','프로젝트의 썸네일 경로명',10);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (6,'KH 청년인턴 관리 프로그램',to_date('2014-09-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-09-03-01-00-00','YYYY-MM-DD-HH24-MI-SS'),'KH 캐피탈 청년 인턴제 및 인턴 관리 전자 프로그램','y','프로젝트의 썸네일 경로명',6);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (7,'Final 프로젝트',to_date('2014-06-13-01-14-54','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-04-28-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'KH교육원, 폴리텍1정수대학에서 이루어지는 자바프로그래밍반의 Final Project','y','프로젝트의 썸네일 경로명',5);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (8,'자바 프로그래밍 따라하기 책 출판',to_date('2014-06-13-07-19-50','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-01-21-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'누구나 자바를 쉽고 재미있게 배울 있도록 섬세하고 친절한 설명으로 다가가는 KH출판사의 신 서적','y','프로젝트의 썸네일 경로명',17);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (9,'롯데칠송 신상품 기획',to_date('2014-06-14-01-53-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-03-02-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'롯데 삼송에서 새롭게 출시하는 신제품 음료에 대한 기획안 입니다.','y','프로젝트의 썸네일 경로명',2);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (10,'LA 자루 용산 2차 개발기획',to_date('2014-06-13-01-14-54','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-08-20-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'기존 용산 지역 역세권 개발을 위한 오피스텔 기획안','n','프로젝트의 썸네일 경로명',9);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (11,'마셔마셔',to_date('2014-06-13-01-14-54','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-04-28-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'누가누가 더 많이 마시나','y','프로젝트의 썸네일 경로명',15);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (12,'수능정복하기',to_date('2014-06-13-07-19-50','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-01-21-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'수능 500점 만점 도전기','y','프로젝트의 썸네일 경로명',17);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (13,'안드로이드 정복기',to_date('2014-06-14-01-53-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-03-02-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'같이 어플을 만들어 봅시다','y','프로젝트의 썸네일 경로명',6);
insert into Project (projectId,name,startDay,endDay,content,open,thumnail,twoSeq) 
values (14,'인천상륙작전',to_date('2014-06-13-01-14-54','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-08-20-23-59-59','YYYY-MM-DD-HH24-MI-SS'),'수도 서울 탈환 작전','n','프로젝트의 썸네일 경로명',14);
--프로젝트는 8번까지만 만들었음

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



INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (1,1,1,2,'참여',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (2,1,2,1,'참여',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (3,1,3,1,'참여',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (4,1,4,1,'참여',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (5,1,5,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (6,2,6,2,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (7,2,7,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (8,2,8,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (9,2,9,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (10,2,10,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (11,3,11,2,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (12,3,12,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (13,3,13,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (14,3,14,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (15,4,16,2,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (16,4,17,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (17,4,18,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (18,4,19,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (19,4,20,1,'참여',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (20,5,1,2,'참여',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (21,5,2,1,'참여',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (22,5,3,2,'참여',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (23,5,4,2,'참여',1);
INSERT INTO Team(teamId,projectSeq,memSeq,grade,participation,skinid) VALUES (24,5,5,2,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (25,6,6,2,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (26,6,7,2,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (27,6,8,2,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (28,6,9,1,'참여',1);
insert into Team(teamId,projectSeq,memSeq,grade,participation,skinid) values (29,6,10,2,'참여',1);



CREATE TABLE data (
	dataid NUMBER PRIMARY KEY,
	filename VARCHAR2(100) NOT NULL,
	orgfilename VARCHAR2(100) NOT NULL,
	fileexplanation NVARCHAR2(100) NULL,
	projectseq NUMBER REFERENCES project(projectid) NOT NULL
);

INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (1,'프로젝트 요구사항1.pdf','프로젝트 요구사항.pdf','프로젝트 요구사항을 정리한 문서',1);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (2,'프로젝트 요구사항2.pdf','프로젝트 요구사항.','프로젝트 요구사항을 정리한 문서',1);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (3,'프로젝트 요구사항3.pdf','프로젝트 요구사항.pdf','프로젝트 요구사항을 정리한 문서',1);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (4,'팀원역할분담1.pdf','팀원역할분담.pdf','각 팀원들의 해야할일과 범위 ',2);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (5,'프로그램 유지/관리 주의사항1.pdf','프로그램 유지/관리 주의사항.pdf','프로젝트의 주의사항을 정리한 문서',2);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (6,'프로그램 유지/관리 주의사항2.pdf','프로그램 유지/관리 주의사항.pdf','프로젝트의 주의사항을 정리한 문서',2);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (7,'프로그램 유지/관리 주의사항3.pdf','프로그램 유지/관리 주의사항.pdf','프로젝트의 주의사항을 정리한 문서',3);
INSERT INTO Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
VALUES (8,'팀원역할분담1.pdf','팀원역할분담.pdf','각 팀원들의 해야할일과 범위 ',3);
insert into Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
values (9,'프로젝트 요구사항1.pdf','프로젝트 요구사항.pdf','프로젝트 요구사항을 정리한 문서',3);
insert into Data (dataId,fileName,orgFileName,fileExplanation,projectSeq) 
values (10,'칵테일 종류 메뉴.pdf','칵테일 종류 메뉴.pdf','칵테일 메뉴판',5);


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
VALUES (1, 1, '팀원 특성', '각 팀원들의 성격의 장단점 파악하여 적절한 곳의 업무를 분배한다. ', default, null);
INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme )
VALUES (2, 2, '업무 파악', '프로젝트에 어떠한 업무들이 있는지 파악한다. ', default, null);
INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme ) 
VALUES (3, 3, '재고 파악', '현장에 필요한 제고를 파악한다.', default, null);
INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme ) 
VALUES (4, 1, '팀 회식', '프로젝트에 참여한 팀원들의 회식 일정 조정 필요 ', default, null);
INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme ) 
VALUES (5, 4, '팀 공지 확인 하세요', '팀 공지에 조만간 예정되어 있는 전체회의에 대한 세부적인 사항들을 올렸습니다. 해당자는 반드시 참석하세요. ', to_date('2014-06-14-10-16-34','YYYY-MM-DD-HH24-MI-SS'), null);
INSERT INTO teammemo( teammemoid, teamseq, subject, content, regdate, theme ) 
VALUES (6, 5, '이번주까지 마감', '이번주까지 이번 업무 마감해야 합니다.', default, null);


CREATE TABLE teamboardsort (
	teamboardsortid NUMBER PRIMARY KEY,
	projectseq NUMBER REFERENCES project(projectid) NOT NULL,
	subject NVARCHAR2(20) NOT NULL,
	sort NUMBER NOT NULL
);

INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(1, 1, '윈코스', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(2, 1, '더존', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(3, 2, '더스쿨', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(4, 2, '윈코스', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(5, 2, '이클립스', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(6, 3, '더존', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(7, 3, '더스쿨', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(8, 4, '업무관련 게시판', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(9, 4, '친목 게시판', 1);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(10, 5, '사진 게시판', 2);
INSERT INTO TEAMBOARDSORT (TEAMBOARDSORTID,PROJECTSEQ,SUBJECT,SORT) VALUES(11, 5, '소주', 1);



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
VALUES(1, '팀원추가 모집에 관하여...', '기존의 팀원으로는 현재 업무를 감당하기가 많이 힘들 것 같습니다. 그래서 2명정도 추가로 팀원을 받을까 하는데 다들 어떻게 생각하세요?', 1, '2014-06-17', 2, null, null, 1 ,1, 2 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(2, '이번에 새로 들어온 팀원입니다.', '인사 차 글옵립니다. 팀장이랑 예전부터 알고 지낸 사이라서 소개로 들어오게 됐네요 앞으로 잘 부탁드립니다. ', 2, '2014-06-18', 0, null, null, 1 ,1, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(3, '저도 인사드립니다. ', '저는 아는 사람이 없지만 이번 일을 계기로 친해졌으면 해요', 3, '2014-06-18', 1, null, null, 1 ,2, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(4, '월드컵 특수로 피곤합니다', '하지만, 월드컵은 꼭 시청해야죠 ㅎㅎ 월드컵 시청하면서 맥주한잔 어떠신가요??', 6, '2014-06-17', 1, null, null, 1 ,3, 2 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(5, '이번에 새로 들어온 팀원입니다.', '인사 차 글옵립니다. 팀장님의 강력한 권유로 참여하게 되었습니다. 잘부탁드립니다. ', 7, '2014-06-18', 1, null, null, 1 ,4, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(6, '저도 인사드립니다. ', '저는 아는 사람이 없지만 이번 일을 계기로 친해졌으면 해요', 8, '2014-06-18', 1, null, null, 1 ,5, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(7, '다음주 회식!!','다음주 금요일에 회식을 진행할려 합니다. 의견 남겨주세요 - 팀장- ',11, to_date('2014-06-15-13-42-12','YYYY-MM-DD-HH24-MI-SS'), 2, null, null, 1 ,6, 2 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(8, '마셔라 마셔라', '월드컵은 역시나 치맥으로~', 12, '2014-06-15', 20, null, null, 1 ,6, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(9, '수능따위', '루저들 나 수시 붙었다', 13, '2014-06-14', 43, null, null, 1 ,7, 1 );
INSERT INTO teamboard(TEAMBOARDID, SUBJECT, content, teamseq, regdate, readcount, filename, orgfilename, theme, teamboardsortseq, teamboardgrade)
VALUES(10, '안녕하세요.', '잘해봅시다.', 14, '2014-06-18', 10, null, null, 1 ,7, 1 );




CREATE TABLE teamcomment (
	teamcommentid NUMBER PRIMARY KEY,
	teamcomment NVARCHAR2(1000) NOT NULL,
	regdate DATE DEFAULT(SYSDATE) NOT NULL,
	teamboardseq NUMBER REFERENCES teamboard(teamboardid) NOT NULL,
	teamseq NUMBER REFERENCES team(teamid) NOT NULL
);

INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(1, '반가워요 우리 열심히 해봐요', default, 2, 1);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(2, '저도 잘 부탁드립니다. ', default, 2, 3);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(3, '반가워요 우리 열심히 해봐요', default, 4, 7);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(4, '저도 잘 부탁드립니다. 술한잔 같이 합시다. 이차선 다리 같이 듀엣해보죠 ㅋ ', default, 4, 6);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(5, '금요일 좋아요! 저는 찬성',to_date('2014-06-15-21-45-10','YYYY-MM-DD-HH24-MI-SS'), 9, 11);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(6, '소주마실건데~', sysdate, 10, 12);
INSERT INTO teamcomment (TEAMCOMMENTID,TEAMCOMMENT,REGDATE,TEAMBOARDSEQ,TEAMSEQ) VALUES(7, '이런 너 말고 니 친구래', sysdate, 9, 14);



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



INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (1,'내일 12시에 만남','서로 인사하는 시간을 가지기 위한 모임이 송파구 잠실 롯데월드 6층 000레스토랑에서 진행될 예정입니다.',to_date('2014-06-13-18-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-22-00-00','YYYY-MM-DD-HH24-MI-SS'),'blue');
INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (2,'다음주에 회의가 9시에 진행','은행 담당자들과의 만남을 통해 업무를 파악하는 시간입니다.',to_date('2014-06-15-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-15-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'red');
INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (3,'다음주 수요일은 쉼','공휴일이라 재충전하는 시간을 가질 예정입니다.',to_date('2014-06-17-06-00-00','YYYY-MM-DD-HH24-MI-SS'), to_date('2014-06-17-23-00-00','YYYY-MM-DD-HH24-MI-SS'),'black');
INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (4,'토목/건축 자제 불출','토목/건축 작업시 필요한 자제를 작업현장에 배분하는 업무를 할 예정입니다.',to_date('2014-06-19-10-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-19-16-00-00','YYYY-MM-DD-HH24-MI-SS'),'blue');
INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (5,'회의 오전 9시 진행','프로젝트 참여 직원들과 회의를 갖을 예정입니다.',to_date('2014-06-25-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-25-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'red');
INSERT INTO Calendar (calendarId,subject,content,startDay,endDay,color) VALUES (6,'본사 재고관리 담당자와 회의','본사에서 재고관리 담당 실장이 직접 현장으로 방문할 예정입니다.',to_date('2014-06-29-13-00-00','YYYY-MM-DD-HH24-MI-SS'), to_date('2014-06-29-15-00-00','YYYY-MM-DD-HH24-MI-SS'),'black');
insert into Calendar (calendarId,subject,content,startDay,endDay,color) values (7,'내일 4시 회의','아무게와 회의가 있습니다.',to_date('2014-06-13-16-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-18-00-00','YYYY-MM-DD-HH24-MI-SS'),'red');
insert into Calendar (calendarId,subject,content,startDay,endDay,color) values (8,'수요일 러시아 한국전 보기','지겠지 뭐~',to_date('2014-06-18-07-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-18-09-30-00','YYYY-MM-DD-HH24-MI-SS'),'red');



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
--팀원번호 1-5 사람들이 다음주에 회의가 9시에 진행을 하기로 예정
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(6, 1, 2);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(7, 2, 2);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(8, 3, 2);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(9, 4, 2);
INSERT INTO TEAmCALENDAR (TEAMCALENDARID, TEAMSEQ, calendarseq) VALUES(10, 5, 2);
--팀원번호 1-5 사람들이 다음주 수요일은 쉬기로 예정
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



--은행 프로젝트에 관한 3개의 bp


INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(1, 1, '예금 및 입출금 프로세스', to_date('2014-07-13-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-01-20-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'은행의 기본적인 업무인 입금과 출금, 거기서 파생되는 예금과 적금시스템을 구현','진행중');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(2, 1, '대출 및 결제 시스템', to_date('2014-09-13-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-04-20-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'대출금액과 대출금리, 기간을 활용한 각종 대출상품과 그에 대한 시스템을 구축','진행중');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(3, 1, '인사관리 및 프로그램 관리', to_date('2014-10-23-01-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-10-22-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'프로그램에 상품을 추가 혹은 삭제하거나 금액이나 기간 , 이율을 조정하거나 그에 대한 권한을 정할 때 어떠한 직원들이 쓸 수 있는지에 대한 시스템','진행중');
insert into BP (BPId,projectSeq,name,startDay,endDay,explanation,state) 
values (4,1,'요구분석 작업',to_date('2014-06-13-07-00-00','YYYY-MM-DD-HH24-MI-SS'),
to_date('2014-06-20-13-00-00','YYYY-MM-DD-HH24-MI-SS'),'요구분석 작업을 위한  BP입니다.','완료');
insert into BP (BPId,projectSeq,name,startDay,endDay,explanation,state) 
values (5,1,'DB 작업',to_date('2014-06-21-13-24-53','YYYY-MM-DD-HH24-MI-SS'),
to_date('2014-07-18-13-00-00','YYYY-MM-DD-HH24-MI-SS'),'DB 구축을 작업 BP입니다.','진행중');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(6, 2, '제고/장비 수주 관리', to_date('2014-06-16-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-01-20-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'총 건설/토목 공사 진행시 제고/장비 관리를 위한 수주와 관련된 업무를 전담하는 BP','진행중');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(7, 2, '건설현장 제고/장비 현황관리', to_date('2014-06-20-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-04-20-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'건설 현장에서 실제로 필요한 자제관리로서 각 건설현장마다 업무가 존재한다','진행중');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(8, 2, '인사관리 및 프로그램 관리', to_date('2014-06-20-10-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-10-22-12-00-00','YYYY-MM-DD-HH24-MI-SS'),'프로그램에 상품을 추가 혹은 삭제하거나 금액이나 기간 , 이율을 조정하거나 그에 대한 권한을 정할 때 어떠한 직원들이 쓸 수 있는지에 대한 시스템','진행중');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(9, 2, '고진감래주를 위한 완벽한 비율', to_date('2014-06-09-00-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-10-20-00-00-00','YYYY-MM-DD-HH24-MI-SS'),'완벽한 고진감래주를 위하여 계속해서 제작하고 마시는 연구','진행중');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(10, 3, '100일 국사정리하기', to_date('2014-06-20-00-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-10-30-23-00-00','YYYY-MM-DD-HH24-MI-SS'),'수능전까지 국사를 마스터하여 서울대를 가기위한 스터디모임','진행중');
INSERT INTO bp (BPID,PROJECTSEQ,NAME,STARTDAY,ENDDAY,EXPLANATION,STATE) 
VALUES(11, 3, 'ERD제작', to_date('2014-06-10-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2015-10-15-17-00-00','YYYY-MM-DD-HH24-MI-SS'),'ERD제작 완벽한 테이블을 만들어 봅시다.','진행중');


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
VALUES(1, 1, 'input과 output 기능 업무', null, null, '돈이 들어올때 총 잔액이 더해지고 나갈 때 마이너스되게 하는 기능', '대기', 2, to_date('2014-06-12-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-16-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(2, 1, '트렌잭션과 금리계산', null, null, '돈이 동시에 입금되거나 출금될시 순서가 어긋나는 것을 방지하기 위한 기능과 예금 만기시 돌려주어야할 금액 계산하는 기능', '대기', 3, to_date('2014-06-12-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-08-19-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(3, 2, '상황방식에 따른 금리 적용', null, null, '만기에 돈을 일시로 갚는 만기일시상환과 이자와 원금을 균등하게 나누어 갚는 균등분할상환 방식을 구현하는 기능', '대기', 3, to_date('2014-06-12-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-01-17-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-01-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(4, 3, '직급에 다른 접근권한', null, null, '회사의 직원들의 직급에 따라 프로그램을 수정할 수 있는 권한의 범위를 결정 할 것 ', '대기', 3, to_date('2014-06-12-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-12-17-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-01-27-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(5, 6, '효율적인 제고관리를 위한 물품 이동경로 및 회사 관계도 설계', null, null, '본사의 효율적인 제고관리를 위한 수주 경로나 물품 수량 및 원가에 대한 설계분석과 회사 관계도 형성', '대기', 2, to_date('2014-06-17-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-16-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(6, 6, '제고를 효율적으로 건설현장에 전달하고 수량관리를 위한 세부항목 설계', null, null, '돈이 동시에 입금되거나 출금될시 순서가 어긋나는 것을 방지하기 위한 기능과 예금 만기시 돌려주어야할 금액 계산하는 기능', '대기', 3, to_date('2014-06-18-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-17-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(7, 7, '건설현장에서 직접 작업반장이 제고의 수량을 파악하고 분배하기 위한 업무 원리철칙을 구상', null, null, '만기에 돈을 일시로 갚는 만기일시상환과 이자와 원금을 균등하게 나누어 갚는 균등분할상환 방식을 구현하는 기능', '대기', 3, to_date('2014-06-19-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-06-18-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-01-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(8, 7, '인사관리를 위한 인적자원 네트워크 설계', null, null, '회사의 직원들의 직급에 따라 프로그램을 수정할 수 있는 권한의 범위를 결정 할 것 ', '대기', 3, to_date('2014-06-12-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-26-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-24-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (9, 11, '고객과의 미팅(1차)',null,null,'고객의 요구사항 취합','완료',2,
to_date('2014-06-12-23-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-11-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-15-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (10, 11, '1차 요구사항 정리',null,null,'취합된 요구사항을 정리합니다. 2차미팅을 위한 설명자료를 추가로 준비합니다.','완료',2,
to_date('2014-06-13-15-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-15-30-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-13-18-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (11, 11, '고객과의 미팅(2차)',null,null,'고객의 요구사항 취합','완료',3,
to_date('2014-06-14-07-00-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-14-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-14-15-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (12, 11, '2차 요구사항 정리',null,null,'취합된 요구사항을 정리합니다.','완료',2,
to_date('2014-06-12-23-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-14-16-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-14-19-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (13, 1, 'ERD 작성작업',null,null,'2차 요구사항 정리르 바탕으로 ERD를 구축합니다.','완료',2,
to_date('2014-06-22-09-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-22-10-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-22-20-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (14, 2, 'ERD 검토작업',null,null,'초기 ERD를 검토하고, 스키마 구조를 정리합니다','완료',3,
to_date('2014-06-12-23-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-23-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-23-17-10-00','YYYY-MM-DD-HH24-MI-SS'));
insert into Business (businessId,bpSeq,subject,fileName,orgFileName,content,state,importance, editdate,startDay,endDay) 
values (15, 3, '데이터 조작어 작성',null,null,'ERD를 바탕으로 데이터베이스 명령문을 작성합니다.','완료',1,
to_date('2014-06-12-23-23-15','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-24-09-00-00','YYYY-MM-DD-HH24-MI-SS'),to_date('2014-06-24-17-10-00','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(16, 4, '맛있는 술 제작', null, null, '고객이 원하는 맛있는 술 만들자', '대기', 1, to_date('2014-06-05-09-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-25-00-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(17, 5, '수능을 위한 후반기 완벽 스터디', null, null, 'sky는 가바야지', '진행중', 2, to_date('2014-01-01-09-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-09-10-00-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(18, 6, '백데이터를 만들자', null, null, '업무를 위한 완벽한 ERD 기능', '진행중', 3, to_date('2014-06-10-00-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-07-01-00-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2015-01-29-13-30-00','YYYY-MM-DD-HH24-MI-SS') );
INSERT INTO business (businessid, bpseq, subject, filename, orgfilename, content , state, importance, editdate, startday, endday) 
VALUES(19, 7, '하반기 신입공채 진행 일정', null, null, '새로운 신입선발을 위한 객관적인 심사기준을 정한다.', '진행중', 3, to_date('2014-06-10-14-00-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-26-13-30-00','YYYY-MM-DD-HH24-MI-SS'),  to_date('2014-06-30-00-00-00','YYYY-MM-DD-HH24-MI-SS') );


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

INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (1,2,2 ,'기능이 좀 겹치는 것 같은데 같이 공유해요' );  
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (2,2,4 ,'저도요' );  
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (3,5,8 ,'업무에 대한 자세한 문서가 필요합니다.' );  
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (4,5,10 ,'수주관리를 위한 관계도는 저희 담당이 아닌듯 합니다.' );
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (5,7,10 ,'ERD에 수정해야할 부분이 발견됩니다. 구체적인 내용은 쪽지를 확인해 주세요' ); 
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (6,7,9,'요구분석이 중요하다고 생각합니다.' );  
INSERT INTO businesscomment( businesscommentid , businessseq, teamseq, content) VALUES (7,8,10 ,'테이블수 44개에서 더 늘어나야 할것 같습니다.' ); 



CREATE TABLE businesslog (
	businesslogid NUMBER PRIMARY KEY,
	businessseq NUMBER REFERENCES business(businessid) NOT NULL,
	beforestate NVARCHAR2(200) NOT NULL,
	afterstate NVARCHAR2(200) NOT NULL,
	editdate DATE default sysdate NOT NULL
);


INSERT INTO businesslog(businesslogid, businessseq, beforestate , afterstate, editdate) VALUES(1, 1, 'input과 output 둘다 구현', 'input만 구현, output은 나중에 구현', default);
INSERT INTO businesslog(businesslogid, businessseq, beforestate , afterstate, editdate) VALUES(2, 6, '제고관리 기본 구성 구현', '수주관리 기본 구성 구현, 제고관리 상태 변경', default);
INSERT INTO businesslog(businesslogid, businessseq, beforestate , afterstate, editdate) VALUES(3, 10, '고객과 미팅 약속이 9시에 잡힘', '약속시간이 11시로 바뀜.', to_date('2014-06-12-23-23-15','YYYY-MM-DD-HH24-MI-SS'));


CREATE TABLE repeatday (
	repeatdayid NUMBER PRIMARY KEY,
	day NVARCHAR2(10) NOT NULL
);

INSERT INTO repeatday (repeatdayid , day) VALUES (1, '월');
INSERT INTO repeatday (repeatdayid , day) VALUES (2, '화');
INSERT INTO repeatday (repeatdayid , day) VALUES (3, '수');
INSERT INTO repeatday (repeatdayid , day) VALUES (4, '목');
INSERT INTO repeatday (repeatdayid , day) VALUES (5, '금');
INSERT INTO repeatday (repeatdayid , day) VALUES (6, '토');
INSERT INTO repeatday (repeatdayid , day) VALUES (7, '일');
INSERT INTO repeatday (repeatdayid , day) VALUES (8, '평일');
INSERT INTO repeatday (repeatdayid , day) VALUES (9, '주말');

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
values (1, '사이트소개.pdf', '사이트소개.pdf');

CREATE TABLE budget (
	budgetid NUMBER PRIMARY KEY,
	projectid NUMBER REFERENCES project(projectid) NOT NULL,
	usage NVARCHAR2(100) NOT NULL,
	input NUMBER DEFAULT(0) NULL,
	output NUMBER DEFAULT(0) NULL,
	btime DATE DEFAULT(SYSDATE) NOT NULL
);


INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (1,1,'팀 회비 수거',100000,default,to_date('2014-06-13-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (2,1,'각종 사무용품 구입',default,15000,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (3,1,'회식비',default,55000,to_date('2014-06-12-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (4,1,'팀회비 충원',100000 , default ,to_date('2014-06-12-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (5,2,'팀 회비 수거',100000,default,to_date('2014-06-13-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (6,2,'각종 사무용품 구입',default,15000,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (7,2,'회식비',default,55000,to_date('2014-06-12-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
INSERT INTO Budget(budgetId,projectId,usage,input,output,bTime) VALUES (8,2,'팀회비 충원',100000 , default ,to_date('2014-06-12-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
insert into Budget(budgetId,projectId,usage,input,output,bTime) values (9,3,'팀 운영비 입금',100000,default,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
insert into Budget(budgetId,projectId,usage,input,output,bTime) values (10,3,'복사용지 구입',default,15000,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
insert into Budget(budgetId,projectId,usage,input,output,bTime) values (11,3,'팀 회식',default,60000,to_date('2014-06-15-12-53-10','YYYY-MM-DD-HH24-MI-SS'));
insert into Budget(budgetId,projectId,usage,input,output,bTime) values (12,3,'회식',default,60000,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));
insert into Budget(budgetId,projectId,usage,input,output,bTime) values (13,3,'책구입',default,75000,to_date('2014-06-14-10-14-23','YYYY-MM-DD-HH24-MI-SS'));

commit;



