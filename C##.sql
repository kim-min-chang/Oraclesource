CREATE TABLE usertbl(
	userid varchar2(20)PRIMARY KEY,
	name varchar2(20) NOT NULL,
	password varchar2(20) NOT NULL,
	age NUMBER(3) NOT NULL,
	email varchar2(20) NOT null
);

INSERT INTO usertbl VALUES ('hong123','홍길동','hong123',25,'hong123@gmail.com'); 

ALTER TABLE USERTBL MODIFY email VARCHAR2(50);

-- userid(hong123) 와 password(hong123) 가 일치하는 회원 조회

SELECT USERID , NAME FROM USERTBL u WHERE u.USERID 'hong123' AND u.PASSWORD 'hong123';

-- 회원 전체조회

SELECT USERID,NAME,AGE,EMAIL FROM USERTBL u; 

-- 비밀번호 변경
-- 아이디와 현재 비밀번호가 일치하면 새 비밀번호로 변경
UPDATE USERTBL SET PASSWORD = 'hong456'WHERE USERID = 'hong123' AND PASSWORD = 'hong123';


-- 회원삭제
-- 아이디와 비밀번호 일치시 삭제
DELETE USERTBL WHERE USERID = 'hong123' AND PASSWORD = 'hong456';


--booktbl
-- code number(4)pk
--title 텍스트(50)
--writer 텍스트(30)
--price number(10)

-- 1000 자바의 정석 신용균 25000
-- 1001 자바의 신 강신용 29000
-- 1002 자바 1000제 남궁성 32000
-- 1003 오라클 박응용  33000
-- 1004 점프투파이썬 신기성 35000
CREATE TABLE BOOKTBL(
	CODE NUMBER(4) PRIMARY KEY,
	TITLE VARCHAR2(50) NOT NULL,
	WRITER VARCHAR2(30) NOT NULL,
	PRICE NUMBER(10) NOT NULL
);

INSERT INTO BOOKTBL VALUES (1000,'자바의 정석','신용균',25000); 
INSERT INTO BOOKTBL VALUES (1001,'자바의 신','강신용',29000); 
INSERT INTO BOOKTBL VALUES (1002,'자바 1000제','남궁성',32000); 
INSERT INTO BOOKTBL VALUES (1003,'오라클','박응용',33000); 
INSERT INTO BOOKTBL VALUES (1004,'점프투파이썬','신기성',35000); 

--전체조회
SELECT * FROM BOOKTBL;

--도서번호 1000번인 도서 조회(상세 조회)
SELECT  * FROM BOOKTBL WHERE CODE = 1000;

-- 도서번호 1001 번인 도서 가격 수정
UPDATE BOOKTBL SET PRICE = '' WHERE CODE = '1001';

-- 도서번호 1001번인 도서 가격 및 상세설명 수정
UPDATE BOOKTBL SET PRICE = '', DESCRIPTION ='' WHERE CODE = '1001'; 

-- 도서번호 1004번 도서 삭제
DELETE FROM booktbl WHERE code = '1004';

-- 도서명 '자바'키워드가 들어있는 도서 조회 
SELECT * FROM BOOKTBL WHERE TITLE LIKE '%자바%'; 

ALTER TABLE BOOKTBL ADD description varchar2(1000);















