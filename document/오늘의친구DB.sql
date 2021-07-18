DROP TABLE LOC CASCADE CONSTRAINTS;
DROP TABLE GRADE CASCADE CONSTRAINTS;
DROP TABLE AGEGRADE CASCADE CONSTRAINTS;
DROP TABLE LEV CASCADE CONSTRAINTS;
DROP TABLE MEMBER CASCADE CONSTRAINTS;
DROP TABLE HOBBY CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE BOARDRE CASCADE CONSTRAINTS;
DROP SEQUENCE SEQ_COMMENTS;
DROP TABLE ADMINBOARD CASCADE CONSTRAINTS;

-- 멤버 관련(지역, 등급, 연령대, 회원/관리자 구별 레벨) 테이블
CREATE TABLE LOC(
LOCNUM NUMBER(1) PRIMARY KEY,
LOCNAME VARCHAR2(15)
);

INSERT INTO LOC VALUES(1, '서울');
INSERT INTO LOC VALUES(2, '경기');
INSERT INTO LOC VALUES(3, '인천');
INSERT INTO LOC VALUES(4, '충청');
INSERT INTO LOC VALUES(5, '강원');
INSERT INTO LOC VALUES(6, '경상');
INSERT INTO LOC VALUES(7, '전라');
INSERT INTO LOC VALUES(8, '제주');
COMMIT;

CREATE TABLE GRADE(
GRADEID NUMBER(1) PRIMARY KEY,
GRADENAME VARCHAR2(20)
);

INSERT INTO GRADE VALUES(1, '브론즈');
INSERT INTO GRADE VALUES(2, '실버');
INSERT INTO GRADE VALUES(3, '골드');
INSERT INTO GRADE VALUES(4, '플래티넘');
INSERT INTO GRADE VALUES(5, '다이아몬드');
COMMIT;

CREATE TABLE AGEGRADE(
AGEID NUMBER(1) PRIMARY KEY,
AGENAME VARCHAR2(20)
);

INSERT INTO AGEGRADE VALUES(1, '10대');
INSERT INTO AGEGRADE VALUES(2, '20대');
INSERT INTO AGEGRADE VALUES(3, '30대');
INSERT INTO AGEGRADE VALUES(4, '40대');
INSERT INTO AGEGRADE VALUES(5, '50대');
INSERT INTO AGEGRADE VALUES(6, '60대');
COMMIT;

CREATE TABLE LEV(
LEVNUM NUMBER(1) PRIMARY KEY,
LEVNAME VARCHAR2(15)
);

INSERT INTO LEV VALUES(0, '일반 회원');
INSERT INTO LEV VALUES(1, '매니저');
INSERT INTO LEV VALUES(2, '관리자');
COMMIT;

-- 멤버 테이블--
CREATE TABLE MEMBER(
ID VARCHAR2(30) PRIMARY KEY,
PASSWD VARCHAR2(30) NOT NULL,
NAME VARCHAR2(30) NOT NULL,
EMAIL VARCHAR2(30) UNIQUE,
GENDER VARCHAR2(15),
LOCNUM NUMBER(1), 
MDATE DATE DEFAULT SYSDATE,
PHONE VARCHAR2(30),
AGE NUMBER(3),
AGEID NUMBER(1),
MPOINT NUMBER(5) DEFAULT 0,
GRADEID NUMBER(1) DEFAULT 1,
LEVNUM NUMBER(1) DEFAULT 0,
FOREIGN KEY(LOCNUM) REFERENCES LOC(LOCNUM),
FOREIGN KEY(GRADEID) REFERENCES GRADE(GRADEID),
FOREIGN KEY(AGEID) REFERENCES AGEGRADE(AGEID),
FOREIGN KEY(LEVNUM) REFERENCES LEV(LEVNUM)
);

INSERT INTO MEMBER VALUES('id1', 'pw1', 'name1', 'email1@579.com', 'm', 1, DEFAULT, '010-1234-5678', 23, 2, 200, 1, DEFAULT);
INSERT INTO MEMBER VALUES('id2', 'pw2', 'name2', 'email2@579.com', 'm', 1, DEFAULT, '010-1234-5678', 23, 2, 500, 2, DEFAULT);
INSERT INTO MEMBER VALUES('id3', 'pw3', 'name3', 'email3@579.com', 'f', 2, DEFAULT, '010-1234-5678', 23, 2, 500, 2, DEFAULT);
INSERT INTO MEMBER VALUES('id4', 'pw4', 'name4', 'email4@579.com', 'f', 2, DEFAULT, '010-1234-5678', 23, 2, 500, 2, DEFAULT);
INSERT INTO MEMBER VALUES('id5', 'pw5', 'name5', 'email5@579.com', 'm', 3, DEFAULT, '010-1234-5678', 23, 2, 50, 1, DEFAULT);
INSERT INTO MEMBER VALUES('id6', 'pw6', 'name6', 'email6@579.com', 'm', 3, DEFAULT, '010-1234-5678', 23, 2, 2000, 3, DEFAULT);
INSERT INTO MEMBER VALUES('id7', 'pw7', 'name7', 'email7@579.com', 'f', 4, DEFAULT, '010-1234-5678', 23, 2, 5000, 4, DEFAULT);
INSERT INTO MEMBER VALUES('id8', 'pw8', 'name8', 'email8@579.com', 'f', 4, DEFAULT, '010-1234-5678', 23, 2, 8000, 5, DEFAULT);
INSERT INTO MEMBER VALUES('id9', 'pw9', 'name9', 'email9@579.com', 'm', 5, DEFAULT, '010-1234-5678', 23, 2, 500, 2, DEFAULT);
INSERT INTO MEMBER VALUES('id10', 'pw10', 'name10', 'email10@579.com', 'm', 5, DEFAULT, '010-1234-5678', 23, 2, 2500, 3, DEFAULT);
INSERT INTO MEMBER VALUES('id11', 'pw11', 'name11', 'email11@579.com', 'f', 6, DEFAULT, '010-1234-5678', 33, 3, 5500, 4, DEFAULT);
INSERT INTO MEMBER VALUES('id12', 'pw12', 'name12', 'email12@579.com', 'f', 6, DEFAULT, '010-1234-5678', 33, 3, 2500, 3, DEFAULT);
INSERT INTO MEMBER VALUES('id13', 'pw13', 'name13', 'email13@579.com', 'm', 7, DEFAULT, '010-1234-5678', 23, 2, 3100, 4, DEFAULT);
INSERT INTO MEMBER VALUES('id14', 'pw14', 'name14', 'email14@579.com', 'm', 7, DEFAULT, '010-1234-5678', 23, 2, 1500, 3, DEFAULT);
INSERT INTO MEMBER VALUES('mgr', 'mgr', 'name15', 'email15@579.com', 'f', 1, DEFAULT, '010-1234-5678', 43, 4, 9999, 5, 2);
INSERT INTO MEMBER VALUES('mgr2', 'mgr2', 'name16', 'email16@579.com', 'm', 1, DEFAULT, '010-1234-5678', 23, 2, 9999, 5, 1);
COMMIT;

-- 게시판 관련 테이블 - 취미아이디, 게시판, 댓글

CREATE TABLE HOBBY(
HOBBYID NUMBER(1) PRIMARY KEY,
HOBBYNAME VARCHAR2(30)
);

INSERT INTO HOBBY VALUES(1, '운동');
INSERT INTO HOBBY VALUES(2, '영화');
INSERT INTO HOBBY VALUES(3, '게임');
INSERT INTO HOBBY VALUES(4, '음식');
INSERT INTO HOBBY VALUES(5, '주식');
INSERT INTO HOBBY VALUES(6, '자유');
COMMIT;

CREATE TABLE BOARD(
BNO NUMBER PRIMARY KEY,
BSUBJECT VARCHAR2(300) NOT NULL,
BCONTENT VARCHAR2(4000) NOT NULL,
BDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ,
ID VARCHAR2(30),
BFILEPATH VARCHAR2(1800),
LOCNUM NUMBER(1),
HOBBYID NUMBER(1),
FOREIGN KEY(HOBBYID) REFERENCES HOBBY(HOBBYID),
FOREIGN KEY(LOCNUM) REFERENCES LOC(LOCNUM),
FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE
);

INSERT INTO BOARD VALUES(1, '안녕하세요1', '내용입니다1 서울-운동친구에요', DEFAULT, 'id1', null, 1, 1);
INSERT INTO BOARD VALUES(2, '안녕하세요2', '내용입니다2 서울-운동친구에요', DEFAULT, 'id1', null, 1, 1);
INSERT INTO BOARD VALUES(3, '안녕하세요3', '내용입니다3 서울-운동친구에요', DEFAULT, 'id1', null, 1, 1);
INSERT INTO BOARD VALUES(4, '안녕하세요4', '내용입니다4 서울-운동친구에요', DEFAULT, 'id1', null, 1, 1);
INSERT INTO BOARD VALUES(5, '안녕하세요5', '내용입니다5 서울-운동친구에요', DEFAULT, 'id1', null, 1, 1);
INSERT INTO BOARD VALUES(6, '안녕하세요6', '내용입니다6 서울-운동친구에요', DEFAULT, 'id2', null, 1, 1);
INSERT INTO BOARD VALUES(7, '안녕하세요7', '내용입니다7 서울-운동친구에요', DEFAULT, 'id2', null, 1, 1);
INSERT INTO BOARD VALUES(8, '안녕하세요8', '내용입니다8 서울-운동친구에요', DEFAULT, 'id2', null, 1, 1);
INSERT INTO BOARD VALUES(9, '안녕하세요9', '내용입니다9 서울-운동친구에요', DEFAULT, 'id2', null, 1, 1);
INSERT INTO BOARD VALUES(10, '안녕하세요10', '내용입니다10 서울-운동친구에요', DEFAULT, 'id2', null, 1, 1);

INSERT INTO BOARD VALUES(11, '안녕하세요11', '내용입니다11 경기-운동친구에요', DEFAULT, 'id1', null, 2, 1);
INSERT INTO BOARD VALUES(12, '안녕하세요12', '내용입니다12 경기-운동친구에요', DEFAULT, 'id1', null, 2, 1);
INSERT INTO BOARD VALUES(13, '안녕하세요13', '내용입니다13 경기-운동친구에요', DEFAULT, 'id1', null, 2, 1);
INSERT INTO BOARD VALUES(14, '안녕하세요14', '내용입니다14 경기-운동친구에요', DEFAULT, 'id1', null, 2, 1);
INSERT INTO BOARD VALUES(15, '안녕하세요15', '내용입니다15 경기-운동친구에요', DEFAULT, 'id1', null, 2, 1);
INSERT INTO BOARD VALUES(16, '안녕하세요16', '내용입니다16 경기-운동친구에요', DEFAULT, 'id2', null, 2, 1);
INSERT INTO BOARD VALUES(17, '안녕하세요17', '내용입니다17 경기-운동친구에요', DEFAULT, 'id2', null, 2, 1);
INSERT INTO BOARD VALUES(18, '안녕하세요18', '내용입니다18 경기-운동친구에요', DEFAULT, 'id2', null, 2, 1);
INSERT INTO BOARD VALUES(19, '안녕하세요19', '내용입니다19 경기-운동친구에요', DEFAULT, 'id2', null, 2, 1);
INSERT INTO BOARD VALUES(20, '안녕하세요20', '내용입니다20 경기-운동친구에요', DEFAULT, 'id2', null, 2, 1);

INSERT INTO BOARD VALUES(21, '안녕하세요21', '내용입니다21 인천-운동친구에요', DEFAULT, 'id1', null, 3, 1);
INSERT INTO BOARD VALUES(22, '안녕하세요22', '내용입니다22 인천-운동친구에요', DEFAULT, 'id1', null, 3, 1);
INSERT INTO BOARD VALUES(23, '안녕하세요23', '내용입니다23 인천-운동친구에요', DEFAULT, 'id1', null, 3, 1);
INSERT INTO BOARD VALUES(24, '안녕하세요24', '내용입니다24 인천-운동친구에요', DEFAULT, 'id1', null, 3, 1);
INSERT INTO BOARD VALUES(25, '안녕하세요25', '내용입니다25 인천-운동친구에요', DEFAULT, 'id1', null, 3, 1);
INSERT INTO BOARD VALUES(26, '안녕하세요26', '내용입니다26 인천-운동친구에요', DEFAULT, 'id2', null, 3, 1);
INSERT INTO BOARD VALUES(27, '안녕하세요27', '내용입니다27 인천-운동친구에요', DEFAULT, 'id2', null, 3, 1);
INSERT INTO BOARD VALUES(28, '안녕하세요28', '내용입니다28 인천-운동친구에요', DEFAULT, 'id2', null, 3, 1);
INSERT INTO BOARD VALUES(29, '안녕하세요29', '내용입니다29 인천-운동친구에요', DEFAULT, 'id2', null, 3, 1);
INSERT INTO BOARD VALUES(30, '안녕하세요30', '내용입니다30 인천-운동친구에요', DEFAULT, 'id2', null, 3, 1);

INSERT INTO BOARD VALUES(31, '안녕하세요31', '내용입니다31 충청-운동친구에요', DEFAULT, 'id1', null, 4, 1);
INSERT INTO BOARD VALUES(32, '안녕하세요32', '내용입니다32 충청-운동친구에요', DEFAULT, 'id1', null, 4, 1);
INSERT INTO BOARD VALUES(33, '안녕하세요33', '내용입니다33 충청-운동친구에요', DEFAULT, 'id1', null, 4, 1);
INSERT INTO BOARD VALUES(34, '안녕하세요34', '내용입니다34 충청-운동친구에요', DEFAULT, 'id1', null, 4, 1);
INSERT INTO BOARD VALUES(35, '안녕하세요35', '내용입니다35 충청-운동친구에요', DEFAULT, 'id1', null, 4, 1);
INSERT INTO BOARD VALUES(36, '안녕하세요36', '내용입니다36 충청-운동친구에요', DEFAULT, 'id2', null, 4, 1);
INSERT INTO BOARD VALUES(37, '안녕하세요37', '내용입니다37 충청-운동친구에요', DEFAULT, 'id2', null, 4, 1);
INSERT INTO BOARD VALUES(38, '안녕하세요38', '내용입니다38 충청-운동친구에요', DEFAULT, 'id2', null, 4, 1);
INSERT INTO BOARD VALUES(39, '안녕하세요39', '내용입니다39 충청-운동친구에요', DEFAULT, 'id2', null, 4, 1);
INSERT INTO BOARD VALUES(40, '안녕하세요40', '내용입니다30 충청-운동친구에요', DEFAULT, 'id2', null, 4, 1);

INSERT INTO BOARD VALUES(41, '안녕하세요41', '내용입니다41 강원-운동친구에요', DEFAULT, 'id1', null, 5, 1);
INSERT INTO BOARD VALUES(42, '안녕하세요42', '내용입니다42 강원-운동친구에요', DEFAULT, 'id1', null, 5, 1);
INSERT INTO BOARD VALUES(43, '안녕하세요43', '내용입니다43 강원-운동친구에요', DEFAULT, 'id1', null, 5, 1);
INSERT INTO BOARD VALUES(44, '안녕하세요44', '내용입니다44 강원-운동친구에요', DEFAULT, 'id1', null, 5, 1);
INSERT INTO BOARD VALUES(45, '안녕하세요45', '내용입니다45 강원-운동친구에요', DEFAULT, 'id1', null, 5, 1);
INSERT INTO BOARD VALUES(46, '안녕하세요46', '내용입니다46 강원-운동친구에요', DEFAULT, 'id2', null, 5, 1);
INSERT INTO BOARD VALUES(47, '안녕하세요47', '내용입니다47 강원-운동친구에요', DEFAULT, 'id2', null, 5, 1);
INSERT INTO BOARD VALUES(48, '안녕하세요48', '내용입니다48 강원-운동친구에요', DEFAULT, 'id2', null, 5, 1);
INSERT INTO BOARD VALUES(49, '안녕하세요49', '내용입니다49 강원-운동친구에요', DEFAULT, 'id2', null, 5, 1);
INSERT INTO BOARD VALUES(50, '안녕하세요50', '내용입니다50 강원-운동친구에요', DEFAULT, 'id2', null, 5, 1);

INSERT INTO BOARD VALUES(51, '안녕하세요51', '내용입니다51 경상-운동친구에요', DEFAULT, 'id1', null, 6, 1);
INSERT INTO BOARD VALUES(52, '안녕하세요52', '내용입니다52 경상-운동친구에요', DEFAULT, 'id1', null, 6, 1);
INSERT INTO BOARD VALUES(53, '안녕하세요53', '내용입니다53 경상-운동친구에요', DEFAULT, 'id1', null, 6, 1);
INSERT INTO BOARD VALUES(54, '안녕하세요54', '내용입니다54 경상-운동친구에요', DEFAULT, 'id1', null, 6, 1);
INSERT INTO BOARD VALUES(55, '안녕하세요55', '내용입니다55 경상-운동친구에요', DEFAULT, 'id1', null, 6, 1);
INSERT INTO BOARD VALUES(56, '안녕하세요56', '내용입니다56 경상-운동친구에요', DEFAULT, 'id2', null, 6, 1);
INSERT INTO BOARD VALUES(57, '안녕하세요57', '내용입니다57 경상-운동친구에요', DEFAULT, 'id2', null, 6, 1);
INSERT INTO BOARD VALUES(58, '안녕하세요58', '내용입니다58 경상-운동친구에요', DEFAULT, 'id2', null, 6, 1);
INSERT INTO BOARD VALUES(59, '안녕하세요59', '내용입니다59 경상-운동친구에요', DEFAULT, 'id2', null, 6, 1);
INSERT INTO BOARD VALUES(60, '안녕하세요60', '내용입니다60 경상-운동친구에요', DEFAULT, 'id2', null, 6, 1);

INSERT INTO BOARD VALUES(61, '안녕하세요61', '내용입니다61 전라-운동친구에요', DEFAULT, 'id1', null, 7, 1);
INSERT INTO BOARD VALUES(62, '안녕하세요62', '내용입니다62 전라-운동친구에요', DEFAULT, 'id1', null, 7, 1);
INSERT INTO BOARD VALUES(63, '안녕하세요63', '내용입니다63 전라-운동친구에요', DEFAULT, 'id1', null, 7, 1);
INSERT INTO BOARD VALUES(64, '안녕하세요64', '내용입니다64 전라-운동친구에요', DEFAULT, 'id1', null, 7, 1);
INSERT INTO BOARD VALUES(65, '안녕하세요65', '내용입니다65 전라-운동친구에요', DEFAULT, 'id1', null, 7, 1);
INSERT INTO BOARD VALUES(66, '안녕하세요66', '내용입니다66 전라-운동친구에요', DEFAULT, 'id2', null, 7, 1);
INSERT INTO BOARD VALUES(67, '안녕하세요67', '내용입니다67 전라-운동친구에요', DEFAULT, 'id2', null, 7, 1);
INSERT INTO BOARD VALUES(68, '안녕하세요68', '내용입니다68 전라-운동친구에요', DEFAULT, 'id2', null, 7, 1);
INSERT INTO BOARD VALUES(69, '안녕하세요69', '내용입니다69 전라-운동친구에요', DEFAULT, 'id2', null, 7, 1);
INSERT INTO BOARD VALUES(70, '안녕하세요70', '내용입니다70 전라-운동친구에요', DEFAULT, 'id2', null, 7, 1);

INSERT INTO BOARD VALUES(71, '안녕하세요71', '내용입니다71 제주-운동친구에요', DEFAULT, 'id1', null, 8, 1);
INSERT INTO BOARD VALUES(72, '안녕하세요72', '내용입니다72 제주-운동친구에요', DEFAULT, 'id1', null, 8, 1);
INSERT INTO BOARD VALUES(73, '안녕하세요73', '내용입니다73 제주-운동친구에요', DEFAULT, 'id1', null, 8, 1);
INSERT INTO BOARD VALUES(74, '안녕하세요74', '내용입니다74 제주-운동친구에요', DEFAULT, 'id1', null, 8, 1);
INSERT INTO BOARD VALUES(75, '안녕하세요75', '내용입니다75 제주-운동친구에요', DEFAULT, 'id1', null, 8, 1);
INSERT INTO BOARD VALUES(76, '안녕하세요76', '내용입니다76 제주-운동친구에요', DEFAULT, 'id2', null, 8, 1);
INSERT INTO BOARD VALUES(77, '안녕하세요77', '내용입니다77 제주-운동친구에요', DEFAULT, 'id2', null, 8, 1);
INSERT INTO BOARD VALUES(78, '안녕하세요78', '내용입니다78 제주-운동친구에요', DEFAULT, 'id2', null, 8, 1);
INSERT INTO BOARD VALUES(79, '안녕하세요79', '내용입니다79 제주-운동친구에요', DEFAULT, 'id2', null, 8, 1);
INSERT INTO BOARD VALUES(80, '안녕하세요80', '내용입니다80 제주-운동친구에요', DEFAULT, 'id2', null, 8, 1);

INSERT INTO BOARD VALUES(81, '안녕하세요81', '내용입니다81 서울-영화친구에요', DEFAULT, 'id1', null, 1, 2);
INSERT INTO BOARD VALUES(82, '안녕하세요82', '내용입니다82 서울-영화친구에요', DEFAULT, 'id1', null, 1, 2);
INSERT INTO BOARD VALUES(83, '안녕하세요83', '내용입니다83 서울-영화친구에요', DEFAULT, 'id1', null, 1, 2);
INSERT INTO BOARD VALUES(84, '안녕하세요84', '내용입니다84 서울-영화친구에요', DEFAULT, 'id1', null, 1, 2);
INSERT INTO BOARD VALUES(85, '안녕하세요85', '내용입니다85 서울-영화친구에요', DEFAULT, 'id1', null, 1, 2);
INSERT INTO BOARD VALUES(86, '안녕하세요86', '내용입니다86 서울-영화친구에요', DEFAULT, 'id2', null, 1, 2);
INSERT INTO BOARD VALUES(87, '안녕하세요87', '내용입니다87 서울-영화친구에요', DEFAULT, 'id2', null, 1, 2);
INSERT INTO BOARD VALUES(88, '안녕하세요88', '내용입니다88 서울-영화친구에요', DEFAULT, 'id2', null, 1, 2);
INSERT INTO BOARD VALUES(89, '안녕하세요89', '내용입니다89 서울-영화친구에요', DEFAULT, 'id2', null, 1, 2);
INSERT INTO BOARD VALUES(90, '안녕하세요90', '내용입니다90 서울-영화친구에요', DEFAULT, 'id2', null, 1, 2);

INSERT INTO BOARD VALUES(91, '안녕하세요91', '내용입니다91 경기-영화친구에요', DEFAULT, 'id1', null, 2, 2);
INSERT INTO BOARD VALUES(92, '안녕하세요92', '내용입니다92 경기-영화친구에요', DEFAULT, 'id1', null, 2, 2);
INSERT INTO BOARD VALUES(93, '안녕하세요93', '내용입니다93 경기-영화친구에요', DEFAULT, 'id1', null, 2, 2);
INSERT INTO BOARD VALUES(94, '안녕하세요94', '내용입니다94 경기-영화친구에요', DEFAULT, 'id1', null, 2, 2);
INSERT INTO BOARD VALUES(95, '안녕하세요95', '내용입니다95 경기-영화친구에요', DEFAULT, 'id1', null, 2, 2);
INSERT INTO BOARD VALUES(96, '안녕하세요96', '내용입니다96 경기-영화친구에요', DEFAULT, 'id2', null, 2, 2);
INSERT INTO BOARD VALUES(97, '안녕하세요97', '내용입니다97 경기-영화친구에요', DEFAULT, 'id2', null, 2, 2);
INSERT INTO BOARD VALUES(98, '안녕하세요98', '내용입니다98 경기-영화친구에요', DEFAULT, 'id2', null, 2, 2);
INSERT INTO BOARD VALUES(99, '안녕하세요99', '내용입니다99 경기-영화친구에요', DEFAULT, 'id2', null, 2, 2);
INSERT INTO BOARD VALUES(100, '안녕하세요100', '내용입니다100 경기-영화친구에요', DEFAULT, 'id2', null, 2, 2);

INSERT INTO BOARD VALUES(101, '안녕하세요101', '내용입니다101 인천-영화친구에요', DEFAULT, 'id3', null, 3, 2);
INSERT INTO BOARD VALUES(102, '안녕하세요102', '내용입니다102 인천-영화친구에요', DEFAULT, 'id3', null, 3, 2);
INSERT INTO BOARD VALUES(103, '안녕하세요103', '내용입니다103 인천-영화친구에요', DEFAULT, 'id3', null, 3, 2);
INSERT INTO BOARD VALUES(104, '안녕하세요104', '내용입니다104 인천-영화친구에요', DEFAULT, 'id4', null, 3, 2);
INSERT INTO BOARD VALUES(105, '안녕하세요105', '내용입니다105 인천-영화친구에요', DEFAULT, 'id4', null, 3, 2);
INSERT INTO BOARD VALUES(106, '안녕하세요106', '내용입니다106 인천-영화친구에요', DEFAULT, 'id4', null, 3, 2);
INSERT INTO BOARD VALUES(107, '안녕하세요107', '내용입니다107 인천-영화친구에요', DEFAULT, 'id5', null, 3, 2);
INSERT INTO BOARD VALUES(108, '안녕하세요108', '내용입니다108 인천-영화친구에요', DEFAULT, 'id5', null, 3, 2);
INSERT INTO BOARD VALUES(109, '안녕하세요109', '내용입니다109 인천-영화친구에요', DEFAULT, 'id5', null, 3, 2);
INSERT INTO BOARD VALUES(110, '안녕하세요110', '내용입니다110 인천-영화친구에요', DEFAULT, 'id5', null, 3, 2);

INSERT INTO BOARD VALUES(111, '안녕하세요111', '내용입니다111 충청-영화친구에요', DEFAULT, 'id3', null, 4, 2);
INSERT INTO BOARD VALUES(112, '안녕하세요112', '내용입니다112 충청-영화친구에요', DEFAULT, 'id3', null, 4, 2);
INSERT INTO BOARD VALUES(113, '안녕하세요113', '내용입니다113 충청-영화친구에요', DEFAULT, 'id3', null, 4, 2);
INSERT INTO BOARD VALUES(114, '안녕하세요114', '내용입니다114 충청-영화친구에요', DEFAULT, 'id4', null, 4, 2);
INSERT INTO BOARD VALUES(115, '안녕하세요115', '내용입니다115 충청-영화친구에요', DEFAULT, 'id4', null, 4, 2);
INSERT INTO BOARD VALUES(116, '안녕하세요116', '내용입니다116 충청-영화친구에요', DEFAULT, 'id4', null, 4, 2);
INSERT INTO BOARD VALUES(117, '안녕하세요117', '내용입니다117 충청-영화친구에요', DEFAULT, 'id5', null, 4, 2);
INSERT INTO BOARD VALUES(118, '안녕하세요118', '내용입니다118 충청-영화친구에요', DEFAULT, 'id5', null, 4, 2);
INSERT INTO BOARD VALUES(119, '안녕하세요119', '내용입니다119 충청-영화친구에요', DEFAULT, 'id5', null, 4, 2);
INSERT INTO BOARD VALUES(120, '안녕하세요120', '내용입니다120 충청-영화친구에요', DEFAULT, 'id5', null, 4, 2);

INSERT INTO BOARD VALUES(121, '안녕하세요121', '내용입니다121 강원-영화친구에요', DEFAULT, 'id3', null, 5, 2);
INSERT INTO BOARD VALUES(122, '안녕하세요122', '내용입니다122 강원-영화친구에요', DEFAULT, 'id3', null, 5, 2);
INSERT INTO BOARD VALUES(123, '안녕하세요123', '내용입니다123 강원-영화친구에요', DEFAULT, 'id3', null, 5, 2);
INSERT INTO BOARD VALUES(124, '안녕하세요124', '내용입니다124 강원-영화친구에요', DEFAULT, 'id4', null, 5, 2);
INSERT INTO BOARD VALUES(125, '안녕하세요125', '내용입니다125 강원-영화친구에요', DEFAULT, 'id4', null, 5, 2);
INSERT INTO BOARD VALUES(126, '안녕하세요126', '내용입니다126 강원-영화친구에요', DEFAULT, 'id4', null, 5, 2);
INSERT INTO BOARD VALUES(127, '안녕하세요127', '내용입니다127 강원-영화친구에요', DEFAULT, 'id5', null, 5, 2);
INSERT INTO BOARD VALUES(128, '안녕하세요128', '내용입니다128 강원-영화친구에요', DEFAULT, 'id5', null, 5, 2);
INSERT INTO BOARD VALUES(129, '안녕하세요129', '내용입니다129 강원-영화친구에요', DEFAULT, 'id5', null, 5, 2);
INSERT INTO BOARD VALUES(130, '안녕하세요130', '내용입니다130 강원-영화친구에요', DEFAULT, 'id5', null, 5, 2);

INSERT INTO BOARD VALUES(131, '안녕하세요131', '내용입니다131 경상-영화친구에요', DEFAULT, 'id3', null, 6, 2);
INSERT INTO BOARD VALUES(132, '안녕하세요132', '내용입니다132 경상-영화친구에요', DEFAULT, 'id3', null, 6, 2);
INSERT INTO BOARD VALUES(133, '안녕하세요133', '내용입니다133 경상-영화친구에요', DEFAULT, 'id3', null, 6, 2);
INSERT INTO BOARD VALUES(134, '안녕하세요134', '내용입니다134 경상-영화친구에요', DEFAULT, 'id4', null, 6, 2);
INSERT INTO BOARD VALUES(135, '안녕하세요135', '내용입니다135 경상-영화친구에요', DEFAULT, 'id4', null, 6, 2);
INSERT INTO BOARD VALUES(136, '안녕하세요136', '내용입니다136 경상-영화친구에요', DEFAULT, 'id4', null, 6, 2);
INSERT INTO BOARD VALUES(137, '안녕하세요137', '내용입니다137 경상-영화친구에요', DEFAULT, 'id5', null, 6, 2);
INSERT INTO BOARD VALUES(138, '안녕하세요138', '내용입니다138 경상-영화친구에요', DEFAULT, 'id5', null, 6, 2);
INSERT INTO BOARD VALUES(139, '안녕하세요139', '내용입니다139 경상-영화친구에요', DEFAULT, 'id5', null, 6, 2);
INSERT INTO BOARD VALUES(140, '안녕하세요140', '내용입니다140 경상-영화친구에요', DEFAULT, 'id5', null, 6, 2);

INSERT INTO BOARD VALUES(141, '안녕하세요141', '내용입니다141 전라-영화친구에요', DEFAULT, 'id3', null, 7, 2);
INSERT INTO BOARD VALUES(142, '안녕하세요142', '내용입니다142 전라-영화친구에요', DEFAULT, 'id3', null, 7, 2);
INSERT INTO BOARD VALUES(143, '안녕하세요143', '내용입니다143 전라-영화친구에요', DEFAULT, 'id3', null, 7, 2);
INSERT INTO BOARD VALUES(144, '안녕하세요144', '내용입니다144 전라-영화친구에요', DEFAULT, 'id4', null, 7, 2);
INSERT INTO BOARD VALUES(145, '안녕하세요145', '내용입니다145 전라-영화친구에요', DEFAULT, 'id4', null, 7, 2);
INSERT INTO BOARD VALUES(146, '안녕하세요146', '내용입니다146 전라-영화친구에요', DEFAULT, 'id4', null, 7, 2);
INSERT INTO BOARD VALUES(147, '안녕하세요147', '내용입니다147 전라-영화친구에요', DEFAULT, 'id5', null, 7, 2);
INSERT INTO BOARD VALUES(148, '안녕하세요148', '내용입니다148 전라-영화친구에요', DEFAULT, 'id5', null, 7, 2);
INSERT INTO BOARD VALUES(149, '안녕하세요149', '내용입니다149 전라-영화친구에요', DEFAULT, 'id5', null, 7, 2);
INSERT INTO BOARD VALUES(150, '안녕하세요150', '내용입니다150 전라-영화친구에요', DEFAULT, 'id5', null, 7, 2);

INSERT INTO BOARD VALUES(151, '안녕하세요151', '내용입니다151 제주-영화친구에요', DEFAULT, 'id3', null, 8, 2);
INSERT INTO BOARD VALUES(152, '안녕하세요152', '내용입니다152 제주-영화친구에요', DEFAULT, 'id3', null, 8, 2);
INSERT INTO BOARD VALUES(153, '안녕하세요153', '내용입니다153 제주-영화친구에요', DEFAULT, 'id3', null, 8, 2);
INSERT INTO BOARD VALUES(154, '안녕하세요154', '내용입니다154 제주-영화친구에요', DEFAULT, 'id4', null, 8, 2);
INSERT INTO BOARD VALUES(155, '안녕하세요155', '내용입니다155 제주-영화친구에요', DEFAULT, 'id4', null, 8, 2);
INSERT INTO BOARD VALUES(156, '안녕하세요156', '내용입니다156 제주-영화친구에요', DEFAULT, 'id4', null, 8, 2);
INSERT INTO BOARD VALUES(157, '안녕하세요157', '내용입니다157 제주-영화친구에요', DEFAULT, 'id5', null, 8, 2);
INSERT INTO BOARD VALUES(158, '안녕하세요158', '내용입니다158 제주-영화친구에요', DEFAULT, 'id5', null, 8, 2);
INSERT INTO BOARD VALUES(159, '안녕하세요159', '내용입니다159 제주-영화친구에요', DEFAULT, 'id5', null, 8, 2);
INSERT INTO BOARD VALUES(160, '안녕하세요160', '내용입니다160 제주-영화친구에요', DEFAULT, 'id5', null, 8, 2);

INSERT INTO BOARD VALUES(161, '게임친구에요1', '게임친구에요', DEFAULT, 'id6', null, 1, 3);
INSERT INTO BOARD VALUES(162, '게임친구에요2', '게임친구에요', DEFAULT, 'id6', null, 1, 3);
INSERT INTO BOARD VALUES(163, '게임친구에요3', '게임친구에요', DEFAULT, 'id7', null, 1, 3);
INSERT INTO BOARD VALUES(164, '게임친구에요4', '게임친구에요', DEFAULT, 'id7', null, 1, 3);
INSERT INTO BOARD VALUES(165, '게임친구에요5', '게임친구에요', DEFAULT, 'id8', null, 1, 3);
INSERT INTO BOARD VALUES(166, '게임친구에요6', '게임친구에요', DEFAULT, 'id8', null, 1, 3);
INSERT INTO BOARD VALUES(167, '게임친구에요7', '게임친구에요', DEFAULT, 'id9', null, 1, 3);
INSERT INTO BOARD VALUES(168, '게임친구에요8', '게임친구에요', DEFAULT, 'id9', null, 1, 3);
INSERT INTO BOARD VALUES(169, '게임친구에요9', '게임친구에요', DEFAULT, 'id10', null, 1, 3);
INSERT INTO BOARD VALUES(170, '게임친구에요10', '게임친구에요', DEFAULT, 'id10', null, 1, 3);

INSERT INTO BOARD VALUES(171, '음식친구에요', '음식친구에요', DEFAULT, 'id11', null, 1, 4);
INSERT INTO BOARD VALUES(172, '음식친구에요', '음식친구에요', DEFAULT, 'id11', null, 1, 4);
INSERT INTO BOARD VALUES(173, '음식친구에요', '음식친구에요', DEFAULT, 'id12', null, 1, 4);
INSERT INTO BOARD VALUES(174, '음식친구에요', '음식친구에요', DEFAULT, 'id12', null, 1, 4);
INSERT INTO BOARD VALUES(175, '음식친구에요', '음식친구에요', DEFAULT, 'id13', null, 1, 4);
INSERT INTO BOARD VALUES(176, '주식친구에요', '주식친구에요', DEFAULT, 'id13', null, 1, 5);
INSERT INTO BOARD VALUES(177, '주식친구에요', '주식친구에요', DEFAULT, 'id13', null, 1, 5);
INSERT INTO BOARD VALUES(178, '주식친구에요', '주식친구에요', DEFAULT, 'id14', null, 1, 5);
INSERT INTO BOARD VALUES(179, '주식친구에요', '주식친구에요', DEFAULT, 'id14', null, 1, 5);
INSERT INTO BOARD VALUES(180, '주식친구에요', '주식친구에요', DEFAULT, 'id14', null, 1, 5);
COMMIT;

CREATE TABLE BOARDRE(
RENO NUMBER PRIMARY KEY,
RECONTENT VARCHAR2(1800) NOT NULL,
ID VARCHAR2(30),
REDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
BNO NUMBER,
FOREIGN KEY(ID) REFERENCES MEMBER(ID) ON DELETE CASCADE,
FOREIGN KEY(BNO) REFERENCES BOARD(BNO) ON DELETE CASCADE
);

CREATE SEQUENCE SEQ_COMMENTS
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE
NOCACHE;

INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글1', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글2', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글3', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글4', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글5', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글6', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글7', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글8', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글9', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글10', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글11', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글12', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '댓글13', 'id2', DEFAULT, 10);
COMMIT;

-- 공지사항 테이블
CREATE TABLE ADMINBOARD(
ADMNO NUMBER PRIMARY KEY,
ADMSUBJECT VARCHAR2(300) NOT NULL,
ADMCONTENT VARCHAR2(4000) NOT NULL,
ADMDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ID VARCHAR2(30),
ADMFILEPATH VARCHAR2(1800),
FOREIGN KEY(ID) REFERENCES MEMBER(ID)
);

INSERT INTO ADMINBOARD VALUES(1, '공지1', '공지내용1', DEFAULT, 'mgr', null);
INSERT INTO ADMINBOARD VALUES(2, '공지2', '공지내용2', DEFAULT, 'mgr', null);
INSERT INTO ADMINBOARD VALUES(3, '공지3', '공지내용3', DEFAULT, 'mgr', null);
INSERT INTO ADMINBOARD VALUES(4, '공지4', '공지내용4', DEFAULT, 'mgr', null);
INSERT INTO ADMINBOARD VALUES(5, '공지5', '공지내용5', DEFAULT, 'mgr', null);
INSERT INTO ADMINBOARD VALUES(6, '공지6', '공지내용6', DEFAULT, 'mgr2', null);
INSERT INTO ADMINBOARD VALUES(7, '공지7', '공지내용7', DEFAULT, 'mgr2', null);
INSERT INTO ADMINBOARD VALUES(8, '공지8', '공지내용8', DEFAULT, 'mgr2', null);
INSERT INTO ADMINBOARD VALUES(9, '공지9', '공지내용9', DEFAULT, 'mgr2', null);
INSERT INTO ADMINBOARD VALUES(10, '공지10', '공지내용10', DEFAULT, 'mgr2', null);
COMMIT;

SELECT * FROM LOC;
SELECT * FROM GRADE;
SELECT * FROM AGEGRADE;
SELECT * FROM LEV;
SELECT * FROM MEMBER;
SELECT * FROM HOBBY;
SELECT * FROM BOARD ;
SELECT * FROM BOARDRE;
SELECT * FROM ADMINBOARD;
COMMIT;
INSERT INTO BOARD VALUES(185, '매일 운동하실분 구해요', '응봉산에서 매일 운동할 친구 구해요', DEFAULT, 'id1', '1.jpg', 1, 1);
INSERT INTO BOARD VALUES(186, '아차산 등산하실분', '아차산에서 등산하실분 구해요 ', DEFAULT, 'id1', '2.jpg', 1, 1);
INSERT INTO BOARD VALUES(187, '도봉산 같이 가실분~~', '도봉산 등산로 입구입니다 빨리오세요 ', DEFAULT, 'id1', '3.jpg', 1, 1);
INSERT INTO BOARD VALUES(188, '낙산공원', '낙산공원에서 산책하실분들 와주세요 ', DEFAULT, 'id1', '4.jpg', 1, 1);
INSERT INTO BOARD VALUES(189, '한강에서 자전거 탈사람', '한강에서 자전거 탈 친구 구해요~~~', DEFAULT, 'id1', '5.jpg', 1, 1);

INSERT INTO BOARD VALUES(190, '매일 운동하실분 구해요', '응봉산에서 매일 운동할 친구 구해요', DEFAULT, 'id1', '1.jpg', 2, 1);
INSERT INTO BOARD VALUES(191, '아차산 등산하실분', '아차산에서 등산하실분 구해요 ', DEFAULT, 'id1', '2.jpg', 2, 1);
INSERT INTO BOARD VALUES(192, '도봉산 같이 가실분~~', '도봉산 등산로 입구입니다 빨리오세요 ', DEFAULT, 'id1', '3.jpg', 2, 1);
INSERT INTO BOARD VALUES(193, '낙산공원', '낙산공원에서 산책하실분들 와주세요 ', DEFAULT, 'id1', '4.jpg', 2, 1);
INSERT INTO BOARD VALUES(194, '한강에서 자전거 탈사람', '한강에서 자전거 탈 친구 구해요~~~', DEFAULT, 'id1', '5.jpg', 2, 1);

INSERT INTO BOARD VALUES(195, '매일 운동하실분 구해요', '응봉산에서 매일 운동할 친구 구해요', DEFAULT, 'id1', '1.jpg', 3, 1);
INSERT INTO BOARD VALUES(196, '아차산 등산하실분', '아차산에서 등산하실분 구해요 ', DEFAULT, 'id1', '2.jpg', 3, 1);
INSERT INTO BOARD VALUES(197, '도봉산 같이 가실분~~', '도봉산 등산로 입구입니다 빨리오세요 ', DEFAULT, 'id1', '3.jpg', 3, 1);
INSERT INTO BOARD VALUES(198, '낙산공원', '낙산공원에서 산책하실분들 와주세요 ', DEFAULT, 'id1', '4.jpg', 3, 1);
INSERT INTO BOARD VALUES(199, '한강에서 자전거 탈사람', '한강에서 자전거 탈 친구 구해요~~~', DEFAULT, 'id1', '5.jpg', 3, 1);

INSERT INTO BOARD VALUES(200, '매일 운동하실분 구해요', '응봉산에서 매일 운동할 친구 구해요', DEFAULT, 'id4', '1.jpg', 4, 1);
INSERT INTO BOARD VALUES(201, '아차산 등산하실분', '아차산에서 등산하실분 구해요 ', DEFAULT, 'id4', '2.jpg', 4, 1);
INSERT INTO BOARD VALUES(202, '도봉산 같이 가실분~~', '도봉산 등산로 입구입니다 빨리오세요 ', DEFAULT, 'id4', '3.jpg', 4, 1);
INSERT INTO BOARD VALUES(203, '낙산공원', '낙산공원에서 산책하실분들 와주세요 ', DEFAULT, 'id4', '4.jpg', 4, 1);
INSERT INTO BOARD VALUES(204, '한강에서 자전거 탈사람', '한강에서 자전거 탈 친구 구해요~~~', DEFAULT, 'id4', '5.jpg', 4, 1);

INSERT INTO BOARD VALUES(205, '스파이더맨 - 파 프로홈', 'CGV에서 같이 영화보러 갈분 ~', DEFAULT, 'id1', '6.png', 1, 2);
INSERT INTO BOARD VALUES(206, '걸캅스', '선착순 한명 공짜~~', DEFAULT, 'id1', '7.png', 1, 2);

INSERT INTO BOARD VALUES(207, '스파이더맨 - 파 프로홈', 'CGV에서 같이 영화보러 갈분 ~', DEFAULT, 'id1', '6.png', 2, 2);
INSERT INTO BOARD VALUES(208, '걸캅스', '선착순 한명 공짜~~', DEFAULT, 'id1', '7.png', 2, 2);

INSERT INTO BOARD VALUES(209, '스파이더맨 - 파 프로홈', 'CGV에서 같이 영화보러 갈분 ~', DEFAULT, 'id1', '6.png', 3, 2);
INSERT INTO BOARD VALUES(210, '걸캅스', '선착순 한명 공짜~~', DEFAULT, 'id1', '7.png', 3, 2);

INSERT INTO BOARD VALUES(211, '스파이더맨 - 파 프로홈', 'CGV에서 같이 영화보러 갈분 ~', DEFAULT, 'id1', '6.png', 4, 2);
INSERT INTO BOARD VALUES(212, '걸캅스', '선착순 한명 공짜~~', DEFAULT, 'id1', '7.png', 4, 2);

INSERT INTO BOARD VALUES(213, '스파이더맨 - 파 프로홈', 'CGV에서 같이 영화보러 갈분 ~', DEFAULT, 'id1', '6.png', 5, 2);
INSERT INTO BOARD VALUES(214, '걸캅스', '선착순 한명 공짜~~', DEFAULT, 'id1', '7.png', 5, 2);

INSERT INTO BOARD VALUES(215, '스파이더맨 - 파 프로홈', 'CGV에서 같이 영화보러 갈분 ~', DEFAULT, 'id1', '6.png', 6, 2);
INSERT INTO BOARD VALUES(216, '걸캅스', '선착순 한명 공짜~~', DEFAULT, 'id1', '7.png', 6, 2);

INSERT INTO BOARD VALUES(217, '스파이더맨 - 파 프로홈', 'CGV에서 같이 영화보러 갈분 ~', DEFAULT, 'id1', '6.png', 7, 2);
INSERT INTO BOARD VALUES(218, '걸캅스', '선착순 한명 공짜~~', DEFAULT, 'id1', '7.png', 7, 2);


INSERT INTO BOARD VALUES(219, '같이 롤할친구', '다아아 2 에요 ~~ 골드이상 와주세요', DEFAULT, 'id6', '8.jpg', 1, 3);
INSERT INTO BOARD VALUES(220, '메이플 크로아서버', '200랩 이상 환영 친추 부탁해요', DEFAULT, 'id6', '9.jpg', 1, 3);

INSERT INTO BOARD VALUES(221, '같이 롤할친구', '다아아 2 에요 ~~ 골드이상 와주세요', DEFAULT, 'id6', '8.jpg', 2, 3);
INSERT INTO BOARD VALUES(222, '메이플 크로아서버', '200랩 이상 환영 친추 부탁해요', DEFAULT, 'id6', '9.jpg', 2, 3);

INSERT INTO BOARD VALUES(223, '같이 롤할친구', '다아아 2 에요 ~~ 골드이상 와주세요', DEFAULT, 'id6', '8.jpg', 3, 3);
INSERT INTO BOARD VALUES(224, '메이플 크로아서버', '200랩 이상 환영 친추 부탁해요', DEFAULT, 'id6', '9.jpg', 3, 3);

INSERT INTO BOARD VALUES(225, '같이 롤할친구', '다아아 2 에요 ~~ 골드이상 와주세요', DEFAULT, 'id6', '8.jpg', 4, 3);
INSERT INTO BOARD VALUES(226, '메이플 크로아서버', '200랩 이상 환영 친추 부탁해요', DEFAULT, 'id6', '9.jpg', 4, 3);

INSERT INTO BOARD VALUES(227, '같이 롤할친구', '다아아 2 에요 ~~ 골드이상 와주세요', DEFAULT, 'id6', '8.jpg', 5, 3);
INSERT INTO BOARD VALUES(228, '메이플 크로아서버', '200랩 이상 환영 친추 부탁해요', DEFAULT, 'id6', '9.jpg', 5, 3);

INSERT INTO BOARD VALUES(229, '같이 롤할친구', '다아아 2 에요 ~~ 골드이상 와주세요', DEFAULT, 'id6', '8.jpg', 6, 3);
INSERT INTO BOARD VALUES(230, '메이플 크로아서버', '200랩 이상 환영 친추 부탁해요', DEFAULT, 'id6', '9.jpg', 6, 3);

INSERT INTO BOARD VALUES(231, '같이 롤할친구', '다아아 2 에요 ~~ 골드이상 와주세요', DEFAULT, 'id6', '8.jpg', 7, 3);
INSERT INTO BOARD VALUES(232, '메이플 크로아서버', '200랩 이상 환영 친추 부탁해요', DEFAULT, 'id6', '9.jpg', 7, 3);


INSERT INTO BOARD VALUES(233, '야구보면서 치맥할사람~', '두산팬 환영해요', DEFAULT, 'id6', '10.jpg', 1, 4);
INSERT INTO BOARD VALUES(234, '파스타 먹을사람', '안녕파스타씨로 오세요', DEFAULT, 'id6', '11.jpg', 1, 4);
INSERT INTO BOARD VALUES(235, '회는 맛있어', '나혼자 먹을거지롱', DEFAULT, 'id6', '12.jpg', 1, 4);

INSERT INTO BOARD VALUES(236, '야구보면서 치맥할사람~', '두산팬 환영해요', DEFAULT, 'id6', '10.jpg', 2, 4);
INSERT INTO BOARD VALUES(237, '파스타 먹을사람', '안녕파스타씨로 오세요', DEFAULT, 'id6', '11.jpg', 2, 4);
INSERT INTO BOARD VALUES(238, '회는 맛있어', '나혼자 먹을거지롱', DEFAULT, 'id6', '12.jpg', 2, 4);

INSERT INTO BOARD VALUES(239, '야구보면서 치맥할사람~', '두산팬 환영해요', DEFAULT, 'id6', '10.jpg', 3, 4);
INSERT INTO BOARD VALUES(240, '파스타 먹을사람', '안녕파스타씨로 오세요', DEFAULT, 'id6', '11.jpg', 3, 4);
INSERT INTO BOARD VALUES(241, '회는 맛있어', '나혼자 먹을거지롱', DEFAULT, 'id6', '12.jpg', 3, 4);

INSERT INTO BOARD VALUES(242, '야구보면서 치맥할사람~', '두산팬 환영해요', DEFAULT, 'id6', '10.jpg', 4, 4);
INSERT INTO BOARD VALUES(243, '파스타 먹을사람', '안녕파스타씨로 오세요', DEFAULT, 'id6', '11.jpg', 4, 4);
INSERT INTO BOARD VALUES(244, '회는 맛있어', '나혼자 먹을거지롱', DEFAULT, 'id6', '12.jpg', 4, 4);

INSERT INTO BOARD VALUES(245, '야구보면서 치맥할사람~', '두산팬 환영해요', DEFAULT, 'id6', '10.jpg', 5, 4);
INSERT INTO BOARD VALUES(246, '파스타 먹을사람', '안녕파스타씨로 오세요', DEFAULT, 'id6', '11.jpg', 5, 4);
INSERT INTO BOARD VALUES(247, '회는 맛있어', '나혼자 먹을거지롱', DEFAULT, 'id6', '12.jpg', 4, 4);

INSERT INTO BOARD VALUES(248, '야구보면서 치맥할사람~', '두산팬 환영해요', DEFAULT, 'id6', '10.jpg', 6, 4);
INSERT INTO BOARD VALUES(249, '파스타 먹을사람', '안녕파스타씨로 오세요', DEFAULT, 'id6', '11.jpg', 6, 4);
INSERT INTO BOARD VALUES(250, '회는 맛있어', '나혼자 먹을거지롱', DEFAULT, 'id6', '12.jpg', 6, 4);

INSERT INTO BOARD VALUES(260, '살려줘요', '진짜 살려줘요', DEFAULT, 'id6', '13.jpg', 1, 5);
INSERT INTO BOARD VALUES(251, '삼성전자 9.5층 오나요?', '사람 살고 있어요 ㅠㅠㅠㅠㅠㅠ', DEFAULT, 'id6', '14.jpg', 1, 5);

INSERT INTO BOARD VALUES(252, '살려줘요', '진짜 살려줘요', DEFAULT, 'id6', '13.jpg', 2, 5);
INSERT INTO BOARD VALUES(253, '삼성전자 9.5층 오나요?', '사람 살고 있어요 ㅠㅠㅠㅠㅠㅠ', DEFAULT, 'id6', '14.jpg', 2, 5);

INSERT INTO BOARD VALUES(254, '살려줘요', '진짜 살려줘요', DEFAULT, 'id6', '13.jpg', 3, 5);
INSERT INTO BOARD VALUES(255, '삼성전자 9.5층 오나요?', '사람 살고 있어요 ㅠㅠㅠㅠㅠㅠ', DEFAULT, 'id6', '14.jpg', 3, 5);

INSERT INTO BOARD VALUES(256, '살려줘요', '진짜 살려줘요', DEFAULT, 'id6', '13.jpg', 4, 5);
INSERT INTO BOARD VALUES(257, '삼성전자 9.5층 오나요?', '사람 살고 있어요 ㅠㅠㅠㅠㅠㅠ', DEFAULT, 'id6', '14.jpg', 4, 5);

INSERT INTO BOARD VALUES(258, '살려줘요', '진짜 살려줘요', DEFAULT, 'id6', '13.jpg', 5, 5);
INSERT INTO BOARD VALUES(259, '삼성전자 9.5층 오나요?', '사람 살고 있어요 ㅠㅠㅠㅠㅠㅠ', DEFAULT, 'id6', '14.jpg', 5, 5);

commit;