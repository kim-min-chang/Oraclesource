-- 사용자 생성 시 특정 문자열로 시작하는 user 생성을 안하겠음
-- hr(C##hr)
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;


--SCOTT에게 뷰 권한 부여
GRANT CREATE VIEW TO SCOTT;

--SCOTT에게 SYNONYM 권한 부여
GRANT CREATE SYNONYM TO SCOTT;

--사용자 생성
--CREATE USER 사용자 이름 IDENTIFIED BY 비밀번호
--DEFAULT TABLESPACE 테이블 스페이스명
--TEMPORARY TABLESPACE 테이블스페이스 그룹명
--QUOTA 테이블 스페이스 크기 ON 테이블스페이스명;

--공통 사용자 또는 롤 이름이 부적합합니다.
--오라클 버전의 변화로 사용자를 생성 시 C## 붙이는걸로 변경됨
CREATE USER C##TEST1 IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA 10M ON USERS;