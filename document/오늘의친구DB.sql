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

-- ��� ����(����, ���, ���ɴ�, ȸ��/������ ���� ����) ���̺�
CREATE TABLE LOC(
LOCNUM NUMBER(1) PRIMARY KEY,
LOCNAME VARCHAR2(15)
);

INSERT INTO LOC VALUES(1, '����');
INSERT INTO LOC VALUES(2, '���');
INSERT INTO LOC VALUES(3, '��õ');
INSERT INTO LOC VALUES(4, '��û');
INSERT INTO LOC VALUES(5, '����');
INSERT INTO LOC VALUES(6, '���');
INSERT INTO LOC VALUES(7, '����');
INSERT INTO LOC VALUES(8, '����');
COMMIT;

CREATE TABLE GRADE(
GRADEID NUMBER(1) PRIMARY KEY,
GRADENAME VARCHAR2(20)
);

INSERT INTO GRADE VALUES(1, '�����');
INSERT INTO GRADE VALUES(2, '�ǹ�');
INSERT INTO GRADE VALUES(3, '���');
INSERT INTO GRADE VALUES(4, '�÷�Ƽ��');
INSERT INTO GRADE VALUES(5, '���̾Ƹ��');
COMMIT;

CREATE TABLE AGEGRADE(
AGEID NUMBER(1) PRIMARY KEY,
AGENAME VARCHAR2(20)
);

INSERT INTO AGEGRADE VALUES(1, '10��');
INSERT INTO AGEGRADE VALUES(2, '20��');
INSERT INTO AGEGRADE VALUES(3, '30��');
INSERT INTO AGEGRADE VALUES(4, '40��');
INSERT INTO AGEGRADE VALUES(5, '50��');
INSERT INTO AGEGRADE VALUES(6, '60��');
COMMIT;

CREATE TABLE LEV(
LEVNUM NUMBER(1) PRIMARY KEY,
LEVNAME VARCHAR2(15)
);

INSERT INTO LEV VALUES(0, '�Ϲ� ȸ��');
INSERT INTO LEV VALUES(1, '�Ŵ���');
INSERT INTO LEV VALUES(2, '������');
COMMIT;

-- ��� ���̺�--
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

-- �Խ��� ���� ���̺� - ��̾��̵�, �Խ���, ���

CREATE TABLE HOBBY(
HOBBYID NUMBER(1) PRIMARY KEY,
HOBBYNAME VARCHAR2(30)
);

INSERT INTO HOBBY VALUES(1, '�');
INSERT INTO HOBBY VALUES(2, '��ȭ');
INSERT INTO HOBBY VALUES(3, '����');
INSERT INTO HOBBY VALUES(4, '����');
INSERT INTO HOBBY VALUES(5, '�ֽ�');
INSERT INTO HOBBY VALUES(6, '����');
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

INSERT INTO BOARD VALUES(1, '�ȳ��ϼ���1', '�����Դϴ�1 ����-�ģ������', DEFAULT, 'id1', null, 1, 1);
INSERT INTO BOARD VALUES(2, '�ȳ��ϼ���2', '�����Դϴ�2 ����-�ģ������', DEFAULT, 'id1', null, 1, 1);
INSERT INTO BOARD VALUES(3, '�ȳ��ϼ���3', '�����Դϴ�3 ����-�ģ������', DEFAULT, 'id1', null, 1, 1);
INSERT INTO BOARD VALUES(4, '�ȳ��ϼ���4', '�����Դϴ�4 ����-�ģ������', DEFAULT, 'id1', null, 1, 1);
INSERT INTO BOARD VALUES(5, '�ȳ��ϼ���5', '�����Դϴ�5 ����-�ģ������', DEFAULT, 'id1', null, 1, 1);
INSERT INTO BOARD VALUES(6, '�ȳ��ϼ���6', '�����Դϴ�6 ����-�ģ������', DEFAULT, 'id2', null, 1, 1);
INSERT INTO BOARD VALUES(7, '�ȳ��ϼ���7', '�����Դϴ�7 ����-�ģ������', DEFAULT, 'id2', null, 1, 1);
INSERT INTO BOARD VALUES(8, '�ȳ��ϼ���8', '�����Դϴ�8 ����-�ģ������', DEFAULT, 'id2', null, 1, 1);
INSERT INTO BOARD VALUES(9, '�ȳ��ϼ���9', '�����Դϴ�9 ����-�ģ������', DEFAULT, 'id2', null, 1, 1);
INSERT INTO BOARD VALUES(10, '�ȳ��ϼ���10', '�����Դϴ�10 ����-�ģ������', DEFAULT, 'id2', null, 1, 1);

INSERT INTO BOARD VALUES(11, '�ȳ��ϼ���11', '�����Դϴ�11 ���-�ģ������', DEFAULT, 'id1', null, 2, 1);
INSERT INTO BOARD VALUES(12, '�ȳ��ϼ���12', '�����Դϴ�12 ���-�ģ������', DEFAULT, 'id1', null, 2, 1);
INSERT INTO BOARD VALUES(13, '�ȳ��ϼ���13', '�����Դϴ�13 ���-�ģ������', DEFAULT, 'id1', null, 2, 1);
INSERT INTO BOARD VALUES(14, '�ȳ��ϼ���14', '�����Դϴ�14 ���-�ģ������', DEFAULT, 'id1', null, 2, 1);
INSERT INTO BOARD VALUES(15, '�ȳ��ϼ���15', '�����Դϴ�15 ���-�ģ������', DEFAULT, 'id1', null, 2, 1);
INSERT INTO BOARD VALUES(16, '�ȳ��ϼ���16', '�����Դϴ�16 ���-�ģ������', DEFAULT, 'id2', null, 2, 1);
INSERT INTO BOARD VALUES(17, '�ȳ��ϼ���17', '�����Դϴ�17 ���-�ģ������', DEFAULT, 'id2', null, 2, 1);
INSERT INTO BOARD VALUES(18, '�ȳ��ϼ���18', '�����Դϴ�18 ���-�ģ������', DEFAULT, 'id2', null, 2, 1);
INSERT INTO BOARD VALUES(19, '�ȳ��ϼ���19', '�����Դϴ�19 ���-�ģ������', DEFAULT, 'id2', null, 2, 1);
INSERT INTO BOARD VALUES(20, '�ȳ��ϼ���20', '�����Դϴ�20 ���-�ģ������', DEFAULT, 'id2', null, 2, 1);

INSERT INTO BOARD VALUES(21, '�ȳ��ϼ���21', '�����Դϴ�21 ��õ-�ģ������', DEFAULT, 'id1', null, 3, 1);
INSERT INTO BOARD VALUES(22, '�ȳ��ϼ���22', '�����Դϴ�22 ��õ-�ģ������', DEFAULT, 'id1', null, 3, 1);
INSERT INTO BOARD VALUES(23, '�ȳ��ϼ���23', '�����Դϴ�23 ��õ-�ģ������', DEFAULT, 'id1', null, 3, 1);
INSERT INTO BOARD VALUES(24, '�ȳ��ϼ���24', '�����Դϴ�24 ��õ-�ģ������', DEFAULT, 'id1', null, 3, 1);
INSERT INTO BOARD VALUES(25, '�ȳ��ϼ���25', '�����Դϴ�25 ��õ-�ģ������', DEFAULT, 'id1', null, 3, 1);
INSERT INTO BOARD VALUES(26, '�ȳ��ϼ���26', '�����Դϴ�26 ��õ-�ģ������', DEFAULT, 'id2', null, 3, 1);
INSERT INTO BOARD VALUES(27, '�ȳ��ϼ���27', '�����Դϴ�27 ��õ-�ģ������', DEFAULT, 'id2', null, 3, 1);
INSERT INTO BOARD VALUES(28, '�ȳ��ϼ���28', '�����Դϴ�28 ��õ-�ģ������', DEFAULT, 'id2', null, 3, 1);
INSERT INTO BOARD VALUES(29, '�ȳ��ϼ���29', '�����Դϴ�29 ��õ-�ģ������', DEFAULT, 'id2', null, 3, 1);
INSERT INTO BOARD VALUES(30, '�ȳ��ϼ���30', '�����Դϴ�30 ��õ-�ģ������', DEFAULT, 'id2', null, 3, 1);

INSERT INTO BOARD VALUES(31, '�ȳ��ϼ���31', '�����Դϴ�31 ��û-�ģ������', DEFAULT, 'id1', null, 4, 1);
INSERT INTO BOARD VALUES(32, '�ȳ��ϼ���32', '�����Դϴ�32 ��û-�ģ������', DEFAULT, 'id1', null, 4, 1);
INSERT INTO BOARD VALUES(33, '�ȳ��ϼ���33', '�����Դϴ�33 ��û-�ģ������', DEFAULT, 'id1', null, 4, 1);
INSERT INTO BOARD VALUES(34, '�ȳ��ϼ���34', '�����Դϴ�34 ��û-�ģ������', DEFAULT, 'id1', null, 4, 1);
INSERT INTO BOARD VALUES(35, '�ȳ��ϼ���35', '�����Դϴ�35 ��û-�ģ������', DEFAULT, 'id1', null, 4, 1);
INSERT INTO BOARD VALUES(36, '�ȳ��ϼ���36', '�����Դϴ�36 ��û-�ģ������', DEFAULT, 'id2', null, 4, 1);
INSERT INTO BOARD VALUES(37, '�ȳ��ϼ���37', '�����Դϴ�37 ��û-�ģ������', DEFAULT, 'id2', null, 4, 1);
INSERT INTO BOARD VALUES(38, '�ȳ��ϼ���38', '�����Դϴ�38 ��û-�ģ������', DEFAULT, 'id2', null, 4, 1);
INSERT INTO BOARD VALUES(39, '�ȳ��ϼ���39', '�����Դϴ�39 ��û-�ģ������', DEFAULT, 'id2', null, 4, 1);
INSERT INTO BOARD VALUES(40, '�ȳ��ϼ���40', '�����Դϴ�30 ��û-�ģ������', DEFAULT, 'id2', null, 4, 1);

INSERT INTO BOARD VALUES(41, '�ȳ��ϼ���41', '�����Դϴ�41 ����-�ģ������', DEFAULT, 'id1', null, 5, 1);
INSERT INTO BOARD VALUES(42, '�ȳ��ϼ���42', '�����Դϴ�42 ����-�ģ������', DEFAULT, 'id1', null, 5, 1);
INSERT INTO BOARD VALUES(43, '�ȳ��ϼ���43', '�����Դϴ�43 ����-�ģ������', DEFAULT, 'id1', null, 5, 1);
INSERT INTO BOARD VALUES(44, '�ȳ��ϼ���44', '�����Դϴ�44 ����-�ģ������', DEFAULT, 'id1', null, 5, 1);
INSERT INTO BOARD VALUES(45, '�ȳ��ϼ���45', '�����Դϴ�45 ����-�ģ������', DEFAULT, 'id1', null, 5, 1);
INSERT INTO BOARD VALUES(46, '�ȳ��ϼ���46', '�����Դϴ�46 ����-�ģ������', DEFAULT, 'id2', null, 5, 1);
INSERT INTO BOARD VALUES(47, '�ȳ��ϼ���47', '�����Դϴ�47 ����-�ģ������', DEFAULT, 'id2', null, 5, 1);
INSERT INTO BOARD VALUES(48, '�ȳ��ϼ���48', '�����Դϴ�48 ����-�ģ������', DEFAULT, 'id2', null, 5, 1);
INSERT INTO BOARD VALUES(49, '�ȳ��ϼ���49', '�����Դϴ�49 ����-�ģ������', DEFAULT, 'id2', null, 5, 1);
INSERT INTO BOARD VALUES(50, '�ȳ��ϼ���50', '�����Դϴ�50 ����-�ģ������', DEFAULT, 'id2', null, 5, 1);

INSERT INTO BOARD VALUES(51, '�ȳ��ϼ���51', '�����Դϴ�51 ���-�ģ������', DEFAULT, 'id1', null, 6, 1);
INSERT INTO BOARD VALUES(52, '�ȳ��ϼ���52', '�����Դϴ�52 ���-�ģ������', DEFAULT, 'id1', null, 6, 1);
INSERT INTO BOARD VALUES(53, '�ȳ��ϼ���53', '�����Դϴ�53 ���-�ģ������', DEFAULT, 'id1', null, 6, 1);
INSERT INTO BOARD VALUES(54, '�ȳ��ϼ���54', '�����Դϴ�54 ���-�ģ������', DEFAULT, 'id1', null, 6, 1);
INSERT INTO BOARD VALUES(55, '�ȳ��ϼ���55', '�����Դϴ�55 ���-�ģ������', DEFAULT, 'id1', null, 6, 1);
INSERT INTO BOARD VALUES(56, '�ȳ��ϼ���56', '�����Դϴ�56 ���-�ģ������', DEFAULT, 'id2', null, 6, 1);
INSERT INTO BOARD VALUES(57, '�ȳ��ϼ���57', '�����Դϴ�57 ���-�ģ������', DEFAULT, 'id2', null, 6, 1);
INSERT INTO BOARD VALUES(58, '�ȳ��ϼ���58', '�����Դϴ�58 ���-�ģ������', DEFAULT, 'id2', null, 6, 1);
INSERT INTO BOARD VALUES(59, '�ȳ��ϼ���59', '�����Դϴ�59 ���-�ģ������', DEFAULT, 'id2', null, 6, 1);
INSERT INTO BOARD VALUES(60, '�ȳ��ϼ���60', '�����Դϴ�60 ���-�ģ������', DEFAULT, 'id2', null, 6, 1);

INSERT INTO BOARD VALUES(61, '�ȳ��ϼ���61', '�����Դϴ�61 ����-�ģ������', DEFAULT, 'id1', null, 7, 1);
INSERT INTO BOARD VALUES(62, '�ȳ��ϼ���62', '�����Դϴ�62 ����-�ģ������', DEFAULT, 'id1', null, 7, 1);
INSERT INTO BOARD VALUES(63, '�ȳ��ϼ���63', '�����Դϴ�63 ����-�ģ������', DEFAULT, 'id1', null, 7, 1);
INSERT INTO BOARD VALUES(64, '�ȳ��ϼ���64', '�����Դϴ�64 ����-�ģ������', DEFAULT, 'id1', null, 7, 1);
INSERT INTO BOARD VALUES(65, '�ȳ��ϼ���65', '�����Դϴ�65 ����-�ģ������', DEFAULT, 'id1', null, 7, 1);
INSERT INTO BOARD VALUES(66, '�ȳ��ϼ���66', '�����Դϴ�66 ����-�ģ������', DEFAULT, 'id2', null, 7, 1);
INSERT INTO BOARD VALUES(67, '�ȳ��ϼ���67', '�����Դϴ�67 ����-�ģ������', DEFAULT, 'id2', null, 7, 1);
INSERT INTO BOARD VALUES(68, '�ȳ��ϼ���68', '�����Դϴ�68 ����-�ģ������', DEFAULT, 'id2', null, 7, 1);
INSERT INTO BOARD VALUES(69, '�ȳ��ϼ���69', '�����Դϴ�69 ����-�ģ������', DEFAULT, 'id2', null, 7, 1);
INSERT INTO BOARD VALUES(70, '�ȳ��ϼ���70', '�����Դϴ�70 ����-�ģ������', DEFAULT, 'id2', null, 7, 1);

INSERT INTO BOARD VALUES(71, '�ȳ��ϼ���71', '�����Դϴ�71 ����-�ģ������', DEFAULT, 'id1', null, 8, 1);
INSERT INTO BOARD VALUES(72, '�ȳ��ϼ���72', '�����Դϴ�72 ����-�ģ������', DEFAULT, 'id1', null, 8, 1);
INSERT INTO BOARD VALUES(73, '�ȳ��ϼ���73', '�����Դϴ�73 ����-�ģ������', DEFAULT, 'id1', null, 8, 1);
INSERT INTO BOARD VALUES(74, '�ȳ��ϼ���74', '�����Դϴ�74 ����-�ģ������', DEFAULT, 'id1', null, 8, 1);
INSERT INTO BOARD VALUES(75, '�ȳ��ϼ���75', '�����Դϴ�75 ����-�ģ������', DEFAULT, 'id1', null, 8, 1);
INSERT INTO BOARD VALUES(76, '�ȳ��ϼ���76', '�����Դϴ�76 ����-�ģ������', DEFAULT, 'id2', null, 8, 1);
INSERT INTO BOARD VALUES(77, '�ȳ��ϼ���77', '�����Դϴ�77 ����-�ģ������', DEFAULT, 'id2', null, 8, 1);
INSERT INTO BOARD VALUES(78, '�ȳ��ϼ���78', '�����Դϴ�78 ����-�ģ������', DEFAULT, 'id2', null, 8, 1);
INSERT INTO BOARD VALUES(79, '�ȳ��ϼ���79', '�����Դϴ�79 ����-�ģ������', DEFAULT, 'id2', null, 8, 1);
INSERT INTO BOARD VALUES(80, '�ȳ��ϼ���80', '�����Դϴ�80 ����-�ģ������', DEFAULT, 'id2', null, 8, 1);

INSERT INTO BOARD VALUES(81, '�ȳ��ϼ���81', '�����Դϴ�81 ����-��ȭģ������', DEFAULT, 'id1', null, 1, 2);
INSERT INTO BOARD VALUES(82, '�ȳ��ϼ���82', '�����Դϴ�82 ����-��ȭģ������', DEFAULT, 'id1', null, 1, 2);
INSERT INTO BOARD VALUES(83, '�ȳ��ϼ���83', '�����Դϴ�83 ����-��ȭģ������', DEFAULT, 'id1', null, 1, 2);
INSERT INTO BOARD VALUES(84, '�ȳ��ϼ���84', '�����Դϴ�84 ����-��ȭģ������', DEFAULT, 'id1', null, 1, 2);
INSERT INTO BOARD VALUES(85, '�ȳ��ϼ���85', '�����Դϴ�85 ����-��ȭģ������', DEFAULT, 'id1', null, 1, 2);
INSERT INTO BOARD VALUES(86, '�ȳ��ϼ���86', '�����Դϴ�86 ����-��ȭģ������', DEFAULT, 'id2', null, 1, 2);
INSERT INTO BOARD VALUES(87, '�ȳ��ϼ���87', '�����Դϴ�87 ����-��ȭģ������', DEFAULT, 'id2', null, 1, 2);
INSERT INTO BOARD VALUES(88, '�ȳ��ϼ���88', '�����Դϴ�88 ����-��ȭģ������', DEFAULT, 'id2', null, 1, 2);
INSERT INTO BOARD VALUES(89, '�ȳ��ϼ���89', '�����Դϴ�89 ����-��ȭģ������', DEFAULT, 'id2', null, 1, 2);
INSERT INTO BOARD VALUES(90, '�ȳ��ϼ���90', '�����Դϴ�90 ����-��ȭģ������', DEFAULT, 'id2', null, 1, 2);

INSERT INTO BOARD VALUES(91, '�ȳ��ϼ���91', '�����Դϴ�91 ���-��ȭģ������', DEFAULT, 'id1', null, 2, 2);
INSERT INTO BOARD VALUES(92, '�ȳ��ϼ���92', '�����Դϴ�92 ���-��ȭģ������', DEFAULT, 'id1', null, 2, 2);
INSERT INTO BOARD VALUES(93, '�ȳ��ϼ���93', '�����Դϴ�93 ���-��ȭģ������', DEFAULT, 'id1', null, 2, 2);
INSERT INTO BOARD VALUES(94, '�ȳ��ϼ���94', '�����Դϴ�94 ���-��ȭģ������', DEFAULT, 'id1', null, 2, 2);
INSERT INTO BOARD VALUES(95, '�ȳ��ϼ���95', '�����Դϴ�95 ���-��ȭģ������', DEFAULT, 'id1', null, 2, 2);
INSERT INTO BOARD VALUES(96, '�ȳ��ϼ���96', '�����Դϴ�96 ���-��ȭģ������', DEFAULT, 'id2', null, 2, 2);
INSERT INTO BOARD VALUES(97, '�ȳ��ϼ���97', '�����Դϴ�97 ���-��ȭģ������', DEFAULT, 'id2', null, 2, 2);
INSERT INTO BOARD VALUES(98, '�ȳ��ϼ���98', '�����Դϴ�98 ���-��ȭģ������', DEFAULT, 'id2', null, 2, 2);
INSERT INTO BOARD VALUES(99, '�ȳ��ϼ���99', '�����Դϴ�99 ���-��ȭģ������', DEFAULT, 'id2', null, 2, 2);
INSERT INTO BOARD VALUES(100, '�ȳ��ϼ���100', '�����Դϴ�100 ���-��ȭģ������', DEFAULT, 'id2', null, 2, 2);

INSERT INTO BOARD VALUES(101, '�ȳ��ϼ���101', '�����Դϴ�101 ��õ-��ȭģ������', DEFAULT, 'id3', null, 3, 2);
INSERT INTO BOARD VALUES(102, '�ȳ��ϼ���102', '�����Դϴ�102 ��õ-��ȭģ������', DEFAULT, 'id3', null, 3, 2);
INSERT INTO BOARD VALUES(103, '�ȳ��ϼ���103', '�����Դϴ�103 ��õ-��ȭģ������', DEFAULT, 'id3', null, 3, 2);
INSERT INTO BOARD VALUES(104, '�ȳ��ϼ���104', '�����Դϴ�104 ��õ-��ȭģ������', DEFAULT, 'id4', null, 3, 2);
INSERT INTO BOARD VALUES(105, '�ȳ��ϼ���105', '�����Դϴ�105 ��õ-��ȭģ������', DEFAULT, 'id4', null, 3, 2);
INSERT INTO BOARD VALUES(106, '�ȳ��ϼ���106', '�����Դϴ�106 ��õ-��ȭģ������', DEFAULT, 'id4', null, 3, 2);
INSERT INTO BOARD VALUES(107, '�ȳ��ϼ���107', '�����Դϴ�107 ��õ-��ȭģ������', DEFAULT, 'id5', null, 3, 2);
INSERT INTO BOARD VALUES(108, '�ȳ��ϼ���108', '�����Դϴ�108 ��õ-��ȭģ������', DEFAULT, 'id5', null, 3, 2);
INSERT INTO BOARD VALUES(109, '�ȳ��ϼ���109', '�����Դϴ�109 ��õ-��ȭģ������', DEFAULT, 'id5', null, 3, 2);
INSERT INTO BOARD VALUES(110, '�ȳ��ϼ���110', '�����Դϴ�110 ��õ-��ȭģ������', DEFAULT, 'id5', null, 3, 2);

INSERT INTO BOARD VALUES(111, '�ȳ��ϼ���111', '�����Դϴ�111 ��û-��ȭģ������', DEFAULT, 'id3', null, 4, 2);
INSERT INTO BOARD VALUES(112, '�ȳ��ϼ���112', '�����Դϴ�112 ��û-��ȭģ������', DEFAULT, 'id3', null, 4, 2);
INSERT INTO BOARD VALUES(113, '�ȳ��ϼ���113', '�����Դϴ�113 ��û-��ȭģ������', DEFAULT, 'id3', null, 4, 2);
INSERT INTO BOARD VALUES(114, '�ȳ��ϼ���114', '�����Դϴ�114 ��û-��ȭģ������', DEFAULT, 'id4', null, 4, 2);
INSERT INTO BOARD VALUES(115, '�ȳ��ϼ���115', '�����Դϴ�115 ��û-��ȭģ������', DEFAULT, 'id4', null, 4, 2);
INSERT INTO BOARD VALUES(116, '�ȳ��ϼ���116', '�����Դϴ�116 ��û-��ȭģ������', DEFAULT, 'id4', null, 4, 2);
INSERT INTO BOARD VALUES(117, '�ȳ��ϼ���117', '�����Դϴ�117 ��û-��ȭģ������', DEFAULT, 'id5', null, 4, 2);
INSERT INTO BOARD VALUES(118, '�ȳ��ϼ���118', '�����Դϴ�118 ��û-��ȭģ������', DEFAULT, 'id5', null, 4, 2);
INSERT INTO BOARD VALUES(119, '�ȳ��ϼ���119', '�����Դϴ�119 ��û-��ȭģ������', DEFAULT, 'id5', null, 4, 2);
INSERT INTO BOARD VALUES(120, '�ȳ��ϼ���120', '�����Դϴ�120 ��û-��ȭģ������', DEFAULT, 'id5', null, 4, 2);

INSERT INTO BOARD VALUES(121, '�ȳ��ϼ���121', '�����Դϴ�121 ����-��ȭģ������', DEFAULT, 'id3', null, 5, 2);
INSERT INTO BOARD VALUES(122, '�ȳ��ϼ���122', '�����Դϴ�122 ����-��ȭģ������', DEFAULT, 'id3', null, 5, 2);
INSERT INTO BOARD VALUES(123, '�ȳ��ϼ���123', '�����Դϴ�123 ����-��ȭģ������', DEFAULT, 'id3', null, 5, 2);
INSERT INTO BOARD VALUES(124, '�ȳ��ϼ���124', '�����Դϴ�124 ����-��ȭģ������', DEFAULT, 'id4', null, 5, 2);
INSERT INTO BOARD VALUES(125, '�ȳ��ϼ���125', '�����Դϴ�125 ����-��ȭģ������', DEFAULT, 'id4', null, 5, 2);
INSERT INTO BOARD VALUES(126, '�ȳ��ϼ���126', '�����Դϴ�126 ����-��ȭģ������', DEFAULT, 'id4', null, 5, 2);
INSERT INTO BOARD VALUES(127, '�ȳ��ϼ���127', '�����Դϴ�127 ����-��ȭģ������', DEFAULT, 'id5', null, 5, 2);
INSERT INTO BOARD VALUES(128, '�ȳ��ϼ���128', '�����Դϴ�128 ����-��ȭģ������', DEFAULT, 'id5', null, 5, 2);
INSERT INTO BOARD VALUES(129, '�ȳ��ϼ���129', '�����Դϴ�129 ����-��ȭģ������', DEFAULT, 'id5', null, 5, 2);
INSERT INTO BOARD VALUES(130, '�ȳ��ϼ���130', '�����Դϴ�130 ����-��ȭģ������', DEFAULT, 'id5', null, 5, 2);

INSERT INTO BOARD VALUES(131, '�ȳ��ϼ���131', '�����Դϴ�131 ���-��ȭģ������', DEFAULT, 'id3', null, 6, 2);
INSERT INTO BOARD VALUES(132, '�ȳ��ϼ���132', '�����Դϴ�132 ���-��ȭģ������', DEFAULT, 'id3', null, 6, 2);
INSERT INTO BOARD VALUES(133, '�ȳ��ϼ���133', '�����Դϴ�133 ���-��ȭģ������', DEFAULT, 'id3', null, 6, 2);
INSERT INTO BOARD VALUES(134, '�ȳ��ϼ���134', '�����Դϴ�134 ���-��ȭģ������', DEFAULT, 'id4', null, 6, 2);
INSERT INTO BOARD VALUES(135, '�ȳ��ϼ���135', '�����Դϴ�135 ���-��ȭģ������', DEFAULT, 'id4', null, 6, 2);
INSERT INTO BOARD VALUES(136, '�ȳ��ϼ���136', '�����Դϴ�136 ���-��ȭģ������', DEFAULT, 'id4', null, 6, 2);
INSERT INTO BOARD VALUES(137, '�ȳ��ϼ���137', '�����Դϴ�137 ���-��ȭģ������', DEFAULT, 'id5', null, 6, 2);
INSERT INTO BOARD VALUES(138, '�ȳ��ϼ���138', '�����Դϴ�138 ���-��ȭģ������', DEFAULT, 'id5', null, 6, 2);
INSERT INTO BOARD VALUES(139, '�ȳ��ϼ���139', '�����Դϴ�139 ���-��ȭģ������', DEFAULT, 'id5', null, 6, 2);
INSERT INTO BOARD VALUES(140, '�ȳ��ϼ���140', '�����Դϴ�140 ���-��ȭģ������', DEFAULT, 'id5', null, 6, 2);

INSERT INTO BOARD VALUES(141, '�ȳ��ϼ���141', '�����Դϴ�141 ����-��ȭģ������', DEFAULT, 'id3', null, 7, 2);
INSERT INTO BOARD VALUES(142, '�ȳ��ϼ���142', '�����Դϴ�142 ����-��ȭģ������', DEFAULT, 'id3', null, 7, 2);
INSERT INTO BOARD VALUES(143, '�ȳ��ϼ���143', '�����Դϴ�143 ����-��ȭģ������', DEFAULT, 'id3', null, 7, 2);
INSERT INTO BOARD VALUES(144, '�ȳ��ϼ���144', '�����Դϴ�144 ����-��ȭģ������', DEFAULT, 'id4', null, 7, 2);
INSERT INTO BOARD VALUES(145, '�ȳ��ϼ���145', '�����Դϴ�145 ����-��ȭģ������', DEFAULT, 'id4', null, 7, 2);
INSERT INTO BOARD VALUES(146, '�ȳ��ϼ���146', '�����Դϴ�146 ����-��ȭģ������', DEFAULT, 'id4', null, 7, 2);
INSERT INTO BOARD VALUES(147, '�ȳ��ϼ���147', '�����Դϴ�147 ����-��ȭģ������', DEFAULT, 'id5', null, 7, 2);
INSERT INTO BOARD VALUES(148, '�ȳ��ϼ���148', '�����Դϴ�148 ����-��ȭģ������', DEFAULT, 'id5', null, 7, 2);
INSERT INTO BOARD VALUES(149, '�ȳ��ϼ���149', '�����Դϴ�149 ����-��ȭģ������', DEFAULT, 'id5', null, 7, 2);
INSERT INTO BOARD VALUES(150, '�ȳ��ϼ���150', '�����Դϴ�150 ����-��ȭģ������', DEFAULT, 'id5', null, 7, 2);

INSERT INTO BOARD VALUES(151, '�ȳ��ϼ���151', '�����Դϴ�151 ����-��ȭģ������', DEFAULT, 'id3', null, 8, 2);
INSERT INTO BOARD VALUES(152, '�ȳ��ϼ���152', '�����Դϴ�152 ����-��ȭģ������', DEFAULT, 'id3', null, 8, 2);
INSERT INTO BOARD VALUES(153, '�ȳ��ϼ���153', '�����Դϴ�153 ����-��ȭģ������', DEFAULT, 'id3', null, 8, 2);
INSERT INTO BOARD VALUES(154, '�ȳ��ϼ���154', '�����Դϴ�154 ����-��ȭģ������', DEFAULT, 'id4', null, 8, 2);
INSERT INTO BOARD VALUES(155, '�ȳ��ϼ���155', '�����Դϴ�155 ����-��ȭģ������', DEFAULT, 'id4', null, 8, 2);
INSERT INTO BOARD VALUES(156, '�ȳ��ϼ���156', '�����Դϴ�156 ����-��ȭģ������', DEFAULT, 'id4', null, 8, 2);
INSERT INTO BOARD VALUES(157, '�ȳ��ϼ���157', '�����Դϴ�157 ����-��ȭģ������', DEFAULT, 'id5', null, 8, 2);
INSERT INTO BOARD VALUES(158, '�ȳ��ϼ���158', '�����Դϴ�158 ����-��ȭģ������', DEFAULT, 'id5', null, 8, 2);
INSERT INTO BOARD VALUES(159, '�ȳ��ϼ���159', '�����Դϴ�159 ����-��ȭģ������', DEFAULT, 'id5', null, 8, 2);
INSERT INTO BOARD VALUES(160, '�ȳ��ϼ���160', '�����Դϴ�160 ����-��ȭģ������', DEFAULT, 'id5', null, 8, 2);

INSERT INTO BOARD VALUES(161, '����ģ������1', '����ģ������', DEFAULT, 'id6', null, 1, 3);
INSERT INTO BOARD VALUES(162, '����ģ������2', '����ģ������', DEFAULT, 'id6', null, 1, 3);
INSERT INTO BOARD VALUES(163, '����ģ������3', '����ģ������', DEFAULT, 'id7', null, 1, 3);
INSERT INTO BOARD VALUES(164, '����ģ������4', '����ģ������', DEFAULT, 'id7', null, 1, 3);
INSERT INTO BOARD VALUES(165, '����ģ������5', '����ģ������', DEFAULT, 'id8', null, 1, 3);
INSERT INTO BOARD VALUES(166, '����ģ������6', '����ģ������', DEFAULT, 'id8', null, 1, 3);
INSERT INTO BOARD VALUES(167, '����ģ������7', '����ģ������', DEFAULT, 'id9', null, 1, 3);
INSERT INTO BOARD VALUES(168, '����ģ������8', '����ģ������', DEFAULT, 'id9', null, 1, 3);
INSERT INTO BOARD VALUES(169, '����ģ������9', '����ģ������', DEFAULT, 'id10', null, 1, 3);
INSERT INTO BOARD VALUES(170, '����ģ������10', '����ģ������', DEFAULT, 'id10', null, 1, 3);

INSERT INTO BOARD VALUES(171, '����ģ������', '����ģ������', DEFAULT, 'id11', null, 1, 4);
INSERT INTO BOARD VALUES(172, '����ģ������', '����ģ������', DEFAULT, 'id11', null, 1, 4);
INSERT INTO BOARD VALUES(173, '����ģ������', '����ģ������', DEFAULT, 'id12', null, 1, 4);
INSERT INTO BOARD VALUES(174, '����ģ������', '����ģ������', DEFAULT, 'id12', null, 1, 4);
INSERT INTO BOARD VALUES(175, '����ģ������', '����ģ������', DEFAULT, 'id13', null, 1, 4);
INSERT INTO BOARD VALUES(176, '�ֽ�ģ������', '�ֽ�ģ������', DEFAULT, 'id13', null, 1, 5);
INSERT INTO BOARD VALUES(177, '�ֽ�ģ������', '�ֽ�ģ������', DEFAULT, 'id13', null, 1, 5);
INSERT INTO BOARD VALUES(178, '�ֽ�ģ������', '�ֽ�ģ������', DEFAULT, 'id14', null, 1, 5);
INSERT INTO BOARD VALUES(179, '�ֽ�ģ������', '�ֽ�ģ������', DEFAULT, 'id14', null, 1, 5);
INSERT INTO BOARD VALUES(180, '�ֽ�ģ������', '�ֽ�ģ������', DEFAULT, 'id14', null, 1, 5);
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

INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���1', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���2', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���3', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���4', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���5', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���6', 'id1', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���7', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���8', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���9', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���10', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���11', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���12', 'id2', DEFAULT, 10);
INSERT INTO BOARDRE VALUES(SEQ_COMMENTS.NEXTVAL, '���13', 'id2', DEFAULT, 10);
COMMIT;

-- �������� ���̺�
CREATE TABLE ADMINBOARD(
ADMNO NUMBER PRIMARY KEY,
ADMSUBJECT VARCHAR2(300) NOT NULL,
ADMCONTENT VARCHAR2(4000) NOT NULL,
ADMDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ID VARCHAR2(30),
ADMFILEPATH VARCHAR2(1800),
FOREIGN KEY(ID) REFERENCES MEMBER(ID)
);

INSERT INTO ADMINBOARD VALUES(1, '����1', '��������1', DEFAULT, 'mgr', null);
INSERT INTO ADMINBOARD VALUES(2, '����2', '��������2', DEFAULT, 'mgr', null);
INSERT INTO ADMINBOARD VALUES(3, '����3', '��������3', DEFAULT, 'mgr', null);
INSERT INTO ADMINBOARD VALUES(4, '����4', '��������4', DEFAULT, 'mgr', null);
INSERT INTO ADMINBOARD VALUES(5, '����5', '��������5', DEFAULT, 'mgr', null);
INSERT INTO ADMINBOARD VALUES(6, '����6', '��������6', DEFAULT, 'mgr2', null);
INSERT INTO ADMINBOARD VALUES(7, '����7', '��������7', DEFAULT, 'mgr2', null);
INSERT INTO ADMINBOARD VALUES(8, '����8', '��������8', DEFAULT, 'mgr2', null);
INSERT INTO ADMINBOARD VALUES(9, '����9', '��������9', DEFAULT, 'mgr2', null);
INSERT INTO ADMINBOARD VALUES(10, '����10', '��������10', DEFAULT, 'mgr2', null);
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
INSERT INTO BOARD VALUES(185, '���� ��ϽǺ� ���ؿ�', '�����꿡�� ���� ��� ģ�� ���ؿ�', DEFAULT, 'id1', '1.jpg', 1, 1);
INSERT INTO BOARD VALUES(186, '������ ����ϽǺ�', '�����꿡�� ����ϽǺ� ���ؿ� ', DEFAULT, 'id1', '2.jpg', 1, 1);
INSERT INTO BOARD VALUES(187, '������ ���� ���Ǻ�~~', '������ ���� �Ա��Դϴ� ���������� ', DEFAULT, 'id1', '3.jpg', 1, 1);
INSERT INTO BOARD VALUES(188, '�������', '����������� ��å�ϽǺе� ���ּ��� ', DEFAULT, 'id1', '4.jpg', 1, 1);
INSERT INTO BOARD VALUES(189, '�Ѱ����� ������ Ż���', '�Ѱ����� ������ Ż ģ�� ���ؿ�~~~', DEFAULT, 'id1', '5.jpg', 1, 1);

INSERT INTO BOARD VALUES(190, '���� ��ϽǺ� ���ؿ�', '�����꿡�� ���� ��� ģ�� ���ؿ�', DEFAULT, 'id1', '1.jpg', 2, 1);
INSERT INTO BOARD VALUES(191, '������ ����ϽǺ�', '�����꿡�� ����ϽǺ� ���ؿ� ', DEFAULT, 'id1', '2.jpg', 2, 1);
INSERT INTO BOARD VALUES(192, '������ ���� ���Ǻ�~~', '������ ���� �Ա��Դϴ� ���������� ', DEFAULT, 'id1', '3.jpg', 2, 1);
INSERT INTO BOARD VALUES(193, '�������', '����������� ��å�ϽǺе� ���ּ��� ', DEFAULT, 'id1', '4.jpg', 2, 1);
INSERT INTO BOARD VALUES(194, '�Ѱ����� ������ Ż���', '�Ѱ����� ������ Ż ģ�� ���ؿ�~~~', DEFAULT, 'id1', '5.jpg', 2, 1);

INSERT INTO BOARD VALUES(195, '���� ��ϽǺ� ���ؿ�', '�����꿡�� ���� ��� ģ�� ���ؿ�', DEFAULT, 'id1', '1.jpg', 3, 1);
INSERT INTO BOARD VALUES(196, '������ ����ϽǺ�', '�����꿡�� ����ϽǺ� ���ؿ� ', DEFAULT, 'id1', '2.jpg', 3, 1);
INSERT INTO BOARD VALUES(197, '������ ���� ���Ǻ�~~', '������ ���� �Ա��Դϴ� ���������� ', DEFAULT, 'id1', '3.jpg', 3, 1);
INSERT INTO BOARD VALUES(198, '�������', '����������� ��å�ϽǺе� ���ּ��� ', DEFAULT, 'id1', '4.jpg', 3, 1);
INSERT INTO BOARD VALUES(199, '�Ѱ����� ������ Ż���', '�Ѱ����� ������ Ż ģ�� ���ؿ�~~~', DEFAULT, 'id1', '5.jpg', 3, 1);

INSERT INTO BOARD VALUES(200, '���� ��ϽǺ� ���ؿ�', '�����꿡�� ���� ��� ģ�� ���ؿ�', DEFAULT, 'id4', '1.jpg', 4, 1);
INSERT INTO BOARD VALUES(201, '������ ����ϽǺ�', '�����꿡�� ����ϽǺ� ���ؿ� ', DEFAULT, 'id4', '2.jpg', 4, 1);
INSERT INTO BOARD VALUES(202, '������ ���� ���Ǻ�~~', '������ ���� �Ա��Դϴ� ���������� ', DEFAULT, 'id4', '3.jpg', 4, 1);
INSERT INTO BOARD VALUES(203, '�������', '����������� ��å�ϽǺе� ���ּ��� ', DEFAULT, 'id4', '4.jpg', 4, 1);
INSERT INTO BOARD VALUES(204, '�Ѱ����� ������ Ż���', '�Ѱ����� ������ Ż ģ�� ���ؿ�~~~', DEFAULT, 'id4', '5.jpg', 4, 1);

INSERT INTO BOARD VALUES(205, '�����̴��� - �� ����Ȩ', 'CGV���� ���� ��ȭ���� ���� ~', DEFAULT, 'id1', '6.png', 1, 2);
INSERT INTO BOARD VALUES(206, '��İ��', '������ �Ѹ� ��¥~~', DEFAULT, 'id1', '7.png', 1, 2);

INSERT INTO BOARD VALUES(207, '�����̴��� - �� ����Ȩ', 'CGV���� ���� ��ȭ���� ���� ~', DEFAULT, 'id1', '6.png', 2, 2);
INSERT INTO BOARD VALUES(208, '��İ��', '������ �Ѹ� ��¥~~', DEFAULT, 'id1', '7.png', 2, 2);

INSERT INTO BOARD VALUES(209, '�����̴��� - �� ����Ȩ', 'CGV���� ���� ��ȭ���� ���� ~', DEFAULT, 'id1', '6.png', 3, 2);
INSERT INTO BOARD VALUES(210, '��İ��', '������ �Ѹ� ��¥~~', DEFAULT, 'id1', '7.png', 3, 2);

INSERT INTO BOARD VALUES(211, '�����̴��� - �� ����Ȩ', 'CGV���� ���� ��ȭ���� ���� ~', DEFAULT, 'id1', '6.png', 4, 2);
INSERT INTO BOARD VALUES(212, '��İ��', '������ �Ѹ� ��¥~~', DEFAULT, 'id1', '7.png', 4, 2);

INSERT INTO BOARD VALUES(213, '�����̴��� - �� ����Ȩ', 'CGV���� ���� ��ȭ���� ���� ~', DEFAULT, 'id1', '6.png', 5, 2);
INSERT INTO BOARD VALUES(214, '��İ��', '������ �Ѹ� ��¥~~', DEFAULT, 'id1', '7.png', 5, 2);

INSERT INTO BOARD VALUES(215, '�����̴��� - �� ����Ȩ', 'CGV���� ���� ��ȭ���� ���� ~', DEFAULT, 'id1', '6.png', 6, 2);
INSERT INTO BOARD VALUES(216, '��İ��', '������ �Ѹ� ��¥~~', DEFAULT, 'id1', '7.png', 6, 2);

INSERT INTO BOARD VALUES(217, '�����̴��� - �� ����Ȩ', 'CGV���� ���� ��ȭ���� ���� ~', DEFAULT, 'id1', '6.png', 7, 2);
INSERT INTO BOARD VALUES(218, '��İ��', '������ �Ѹ� ��¥~~', DEFAULT, 'id1', '7.png', 7, 2);


INSERT INTO BOARD VALUES(219, '���� ����ģ��', '�پƾ� 2 ���� ~~ ����̻� ���ּ���', DEFAULT, 'id6', '8.jpg', 1, 3);
INSERT INTO BOARD VALUES(220, '������ ũ�ξƼ���', '200�� �̻� ȯ�� ģ�� ��Ź�ؿ�', DEFAULT, 'id6', '9.jpg', 1, 3);

INSERT INTO BOARD VALUES(221, '���� ����ģ��', '�پƾ� 2 ���� ~~ ����̻� ���ּ���', DEFAULT, 'id6', '8.jpg', 2, 3);
INSERT INTO BOARD VALUES(222, '������ ũ�ξƼ���', '200�� �̻� ȯ�� ģ�� ��Ź�ؿ�', DEFAULT, 'id6', '9.jpg', 2, 3);

INSERT INTO BOARD VALUES(223, '���� ����ģ��', '�پƾ� 2 ���� ~~ ����̻� ���ּ���', DEFAULT, 'id6', '8.jpg', 3, 3);
INSERT INTO BOARD VALUES(224, '������ ũ�ξƼ���', '200�� �̻� ȯ�� ģ�� ��Ź�ؿ�', DEFAULT, 'id6', '9.jpg', 3, 3);

INSERT INTO BOARD VALUES(225, '���� ����ģ��', '�پƾ� 2 ���� ~~ ����̻� ���ּ���', DEFAULT, 'id6', '8.jpg', 4, 3);
INSERT INTO BOARD VALUES(226, '������ ũ�ξƼ���', '200�� �̻� ȯ�� ģ�� ��Ź�ؿ�', DEFAULT, 'id6', '9.jpg', 4, 3);

INSERT INTO BOARD VALUES(227, '���� ����ģ��', '�پƾ� 2 ���� ~~ ����̻� ���ּ���', DEFAULT, 'id6', '8.jpg', 5, 3);
INSERT INTO BOARD VALUES(228, '������ ũ�ξƼ���', '200�� �̻� ȯ�� ģ�� ��Ź�ؿ�', DEFAULT, 'id6', '9.jpg', 5, 3);

INSERT INTO BOARD VALUES(229, '���� ����ģ��', '�پƾ� 2 ���� ~~ ����̻� ���ּ���', DEFAULT, 'id6', '8.jpg', 6, 3);
INSERT INTO BOARD VALUES(230, '������ ũ�ξƼ���', '200�� �̻� ȯ�� ģ�� ��Ź�ؿ�', DEFAULT, 'id6', '9.jpg', 6, 3);

INSERT INTO BOARD VALUES(231, '���� ����ģ��', '�پƾ� 2 ���� ~~ ����̻� ���ּ���', DEFAULT, 'id6', '8.jpg', 7, 3);
INSERT INTO BOARD VALUES(232, '������ ũ�ξƼ���', '200�� �̻� ȯ�� ģ�� ��Ź�ؿ�', DEFAULT, 'id6', '9.jpg', 7, 3);


INSERT INTO BOARD VALUES(233, '�߱����鼭 ġ���һ��~', '�λ��� ȯ���ؿ�', DEFAULT, 'id6', '10.jpg', 1, 4);
INSERT INTO BOARD VALUES(234, '�Ľ�Ÿ �������', '�ȳ��Ľ�Ÿ���� ������', DEFAULT, 'id6', '11.jpg', 1, 4);
INSERT INTO BOARD VALUES(235, 'ȸ�� ���־�', '��ȥ�� ����������', DEFAULT, 'id6', '12.jpg', 1, 4);

INSERT INTO BOARD VALUES(236, '�߱����鼭 ġ���һ��~', '�λ��� ȯ���ؿ�', DEFAULT, 'id6', '10.jpg', 2, 4);
INSERT INTO BOARD VALUES(237, '�Ľ�Ÿ �������', '�ȳ��Ľ�Ÿ���� ������', DEFAULT, 'id6', '11.jpg', 2, 4);
INSERT INTO BOARD VALUES(238, 'ȸ�� ���־�', '��ȥ�� ����������', DEFAULT, 'id6', '12.jpg', 2, 4);

INSERT INTO BOARD VALUES(239, '�߱����鼭 ġ���һ��~', '�λ��� ȯ���ؿ�', DEFAULT, 'id6', '10.jpg', 3, 4);
INSERT INTO BOARD VALUES(240, '�Ľ�Ÿ �������', '�ȳ��Ľ�Ÿ���� ������', DEFAULT, 'id6', '11.jpg', 3, 4);
INSERT INTO BOARD VALUES(241, 'ȸ�� ���־�', '��ȥ�� ����������', DEFAULT, 'id6', '12.jpg', 3, 4);

INSERT INTO BOARD VALUES(242, '�߱����鼭 ġ���һ��~', '�λ��� ȯ���ؿ�', DEFAULT, 'id6', '10.jpg', 4, 4);
INSERT INTO BOARD VALUES(243, '�Ľ�Ÿ �������', '�ȳ��Ľ�Ÿ���� ������', DEFAULT, 'id6', '11.jpg', 4, 4);
INSERT INTO BOARD VALUES(244, 'ȸ�� ���־�', '��ȥ�� ����������', DEFAULT, 'id6', '12.jpg', 4, 4);

INSERT INTO BOARD VALUES(245, '�߱����鼭 ġ���һ��~', '�λ��� ȯ���ؿ�', DEFAULT, 'id6', '10.jpg', 5, 4);
INSERT INTO BOARD VALUES(246, '�Ľ�Ÿ �������', '�ȳ��Ľ�Ÿ���� ������', DEFAULT, 'id6', '11.jpg', 5, 4);
INSERT INTO BOARD VALUES(247, 'ȸ�� ���־�', '��ȥ�� ����������', DEFAULT, 'id6', '12.jpg', 4, 4);

INSERT INTO BOARD VALUES(248, '�߱����鼭 ġ���һ��~', '�λ��� ȯ���ؿ�', DEFAULT, 'id6', '10.jpg', 6, 4);
INSERT INTO BOARD VALUES(249, '�Ľ�Ÿ �������', '�ȳ��Ľ�Ÿ���� ������', DEFAULT, 'id6', '11.jpg', 6, 4);
INSERT INTO BOARD VALUES(250, 'ȸ�� ���־�', '��ȥ�� ����������', DEFAULT, 'id6', '12.jpg', 6, 4);

INSERT INTO BOARD VALUES(260, '������', '��¥ ������', DEFAULT, 'id6', '13.jpg', 1, 5);
INSERT INTO BOARD VALUES(251, '�Ｚ���� 9.5�� ������?', '��� ��� �־�� �ФФФФФ�', DEFAULT, 'id6', '14.jpg', 1, 5);

INSERT INTO BOARD VALUES(252, '������', '��¥ ������', DEFAULT, 'id6', '13.jpg', 2, 5);
INSERT INTO BOARD VALUES(253, '�Ｚ���� 9.5�� ������?', '��� ��� �־�� �ФФФФФ�', DEFAULT, 'id6', '14.jpg', 2, 5);

INSERT INTO BOARD VALUES(254, '������', '��¥ ������', DEFAULT, 'id6', '13.jpg', 3, 5);
INSERT INTO BOARD VALUES(255, '�Ｚ���� 9.5�� ������?', '��� ��� �־�� �ФФФФФ�', DEFAULT, 'id6', '14.jpg', 3, 5);

INSERT INTO BOARD VALUES(256, '������', '��¥ ������', DEFAULT, 'id6', '13.jpg', 4, 5);
INSERT INTO BOARD VALUES(257, '�Ｚ���� 9.5�� ������?', '��� ��� �־�� �ФФФФФ�', DEFAULT, 'id6', '14.jpg', 4, 5);

INSERT INTO BOARD VALUES(258, '������', '��¥ ������', DEFAULT, 'id6', '13.jpg', 5, 5);
INSERT INTO BOARD VALUES(259, '�Ｚ���� 9.5�� ������?', '��� ��� �־�� �ФФФФФ�', DEFAULT, 'id6', '14.jpg', 5, 5);

commit;