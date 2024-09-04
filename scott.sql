--SQL 쿼리문은 대소문자를 구별하지 않음
-- 단, 비밀번호는 구별함
--DML : 데이터 조작어(CURD - CREAT/READ/UPDATE/DELETE)

-- 1) 조회


-- SELECT 컬럼명			<- 5
-- FROM 테이블명			<- 1
-- WHERE 조건절			<- 2
-- GROUP BY 컬럼명		<- 3
-- HAVING 집계함수 조건절	<- 4
-- ORDER BY 컬럼명		<- 6


-- EMP(employee - 사원테이블)
-- DEPT(department - 부서테이블)
-- SALGRADE(급여 테이블)

-- 전체 조회 SELECT *FROM EMP;
SELECT *FROM EMP;

-- 선택 조회


-- 1) 컬럼 지정 SELECT A, B, C FROM EMP E;
SELECT
	EMPNO,
	ENAME,
	MGR
FROM
	EMP E;
-- 중복 조회 : distinct
SELECT
	DISTINCT DEPTNO
FROM
	EMP e ;
	
-- 별칭 부여
SELECT EMPNO AS "사원번호"
FROM EMP e ;

SELECT EMPNO "사원번호"
FROM EMP e ;

SELECT EMPNO AS "사원 번호"
FROM EMP e ;

SELECT EMPNO "사원 번호"
FROM EMP e ;

-- 연봉 구하기
SELECT
	EMPNO,
	ENAME,
	SAL ,
	COMM ,
	sal * 12 + COMM AS "연봉"
FROM
	EMP e ;
	
-- 조회 후 정렬(오름차순- asc, 내림차순-desc)
-- sal 내림차순
SELECT ENAME ,SAL 
FROM EMP e 
ORDER BY SAL DESC ;

--sal 오름차순(asc 생략가능)
SELECT ENAME ,SAL 
FROM EMP e 
ORDER BY SAL;

-- empno 내림차순
SELECT *
FROM EMP ORDER BY EMPNO DESC ;

-- deptno 오름차순, sal 내림차순
SELECT  *
FROM EMP e 
ORDER BY DEPTNO ASC, sal DESC ;



SELECT
	EMPNO AS "EMPLOYEE_NO",
	ENAME AS "EMPLOYEE_NAME",
	MGR AS "MANAGER",
	SAL AS "SALARY",
	COMM AS "COMMISSION",
	DEPTNO AS "DEPARTMENT_NO"
FROM
	EMP e
ORDER BY
	DEPTNO DESC,
	ENAME ASC ;
	
-- 선택 조회
-- 2)조건 지정
-- = : 동일하다
-- 부서 번호가 30 번인 사원 전체 조회
SELECT *
FROM EMP e
WHERE DEPTNO = 30;

-- 사원 번호가 7839인 사원 조회
-- 사원 번호가 중복되지 않음
-- where 
SELECT *
FROM EMP e 
WHERE EMPNO =7839;


-- 사원 번호가 7698이면서 부서번호가 30번인 사원 조회
SELECT *
FROM EMP e 
WHERE EMPNO =7698 AND DEPTNO = 30;

--부서 번호가 30이거나 or 직책이 clerk 인 사원 조회
SELECT  * 
FROM EMP e 
WHERE  DEPTNO =30 OR JOB = 'clerk';

-- 연봉이 36000 인 사원 조회
-- sal(월급)*12 = 36000
SELECT  *
FROM EMP e 
WHERE e.SAL *12 = 36000;

--급여가 3000보다 큰 사원 조회
SELECT  *
FROM EMP e 
WHERE e.SAL  > 3000;
-- 급여가 3000이상인 사원 조회
SELECT  *
FROM EMP e 
WHERE e.SAL  >= 3000;

-- ename 이 f 이후의 문자열로 시작하는 사원 조회
SELECT  *
FROM EMP e 
WHERE e.ENAME >= 'F';

-- 급여가 2500이상이고 직업이 analyst 인 사원 조회
SELECT  *
FROM EMP e 
WHERE e.SAL >= 2500 AND e.JOB = 'ANALYST';
-- job이 manager, salesman, clerk 인 사원 조회
SELECT  *
FROM EMP e 
WHERE E.JOB = 'MANAGER'OR E.JOB = 'SALESMAN'or e.JOB = 'CLERK';

-- SAL 이 3000 이 아닌 사원 조회
-- != , <>, ^=
SELECT  *
FROM EMP e 
WHERE E.SAL != 3000;

SELECT  *
FROM EMP e 
WHERE E.SAL <> 3000;

SELECT  *
FROM EMP e 
WHERE E.SAL ^= 3000;

-- IN
SELECT  *
FROM EMP e 
WHERE E.JOB IN ('MANAGER','SALESMAN','CLERK');

-- NOT IN
-- job이 manager, salesman, clerk 가 아닌 사원 조회
SELECT  *
FROM EMP e 
WHERE E.JOB != 'MANAGER'AND E.JOB <> 'SALESMAN'AND e.JOB ^= 'CLERK';

SELECT  *
FROM EMP e 
WHERE E.JOB NOT IN ('MANAGER','SALESMAN','CLERK');

-- 부서 번호가 10번 이거나 20번인 사원 조회
SELECT  *
FROM EMP e 
--WHERE E.DEPTNO = 10 OR E.DEPTNO = 20;
WHERE E.DEPTNO IN(10,20);

--BETWEEN A AND B : 일정 범위 내의 데이터 조회 시 사용

--급여가 2000이상 이고 3000이하인 조회 
SELECT  *
FROM EMP e 
--WHERE E.SAL >= 2000 AND E.SAL <=3000;
WHERE E.SAL BETWEEN 2000 AND 3000;

--NOTBETWEEN A AND B : 일정 범위 아닌 데이터 조회시 사용
--급여가 2000이상 3000이하가 아닌 직원 조회
SELECT  *
FROM EMP e 
WHERE E.SAL NOT BETWEEN 2000 AND 3000;

-- LIKE 연산자와 와일드 카드

-- ENAME = 'JONES' : 전체 일치
--　ENAME이　J로　시작하는　OR　A　가　들어간 : 부분일치
-- J% : J로 시작하면서 그뒤에 어떤 문자가 몇 개가 오던지 상관없음
SELECT  *
FROM EMP e 
WHERE ENAME LIKE 'J%';
-- _L% : 어떤 문자로 시작해도 상관없으나 개수는 하나 / 두번째 문자는 무조건 L / 그뒤에 어떤 문자가 몇개가 오던지 상관없음
SELECT  *
FROM EMP e 
WHERE ENAME LIKE '_L%';

-- 사원 명에 AM 문자가 포함된 사원 조회
SELECT  *
FROM EMP e 
WHERE ENAME LIKE '%AM%';

-- 사원 명에 AM 문자가 포함되지 않는 사원 조회
SELECT  *
FROM EMP e 
WHERE ENAME NOT LIKE '%AM%';

-- IS NULL

--SELECT * 
--FROM EMP E 
--WHERE E.COMM = 'NULL';

SELECT * FROM EMP e WHERE COMM IS NULL ;
SELECT * FROM EMP e WHERE COMM IS NOT NULL ;

--집합연산자
--UNION : 합집합(결과 값의 중복 제거)
--UNION ALL : 합집합(중복)
--MINUS : 차집합
--INTERSECT : 교집합

--UNION
--부서번호가 10번인 사원 조회(사번,이름,급여,부서번호)
--부서번호가 20번인 사원 조회(사번,이름,급여) => 컬럼이 동일해야 함 / 타입도 동일해야 됨

SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e 
WHERE E.DEPTNO = 10
UNION 
SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e 
WHERE E.DEPTNO = 20;

--UNION ALL
SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e 
WHERE E.DEPTNO = 10
UNION ALL 
SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e 
WHERE E.DEPTNO = 20;

-- MINUS
SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e 
MINUS 
SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e 
WHERE E.DEPTNO = 10;


-- INTERSECT
SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e 
INTERSECT
SELECT E.EMPNO ,E.ENAME ,E.SAL ,E.DEPTNO 
FROM EMP e 
WHERE E.DEPTNO = 10;