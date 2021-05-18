-- ex18_groupby

/*
 group by 절
 - 레코드들을 특정 컬럼값(1개, N개)에 맞춰서 그룹을 나누는 역할
 - 그룹을 왜 나누는지?
    -> 각각의 나눠진 그룹을 대상으로 > 집계 함수를 적용하기 위해서****
    -> count, sum, avg, max, min
 - GROUP BY 컬럼명 [,컬럼명] x N

 SELECT 컬럼리스트
 FROM 테이블명
 WHERE 조건
 GROUP BY 그룹기준
 HAVING 조건
 ORDER BY 정렬

 실행순서
 1. FROM
 2. WHERE
 3. GROUP BY
 4  SELECT
 5. ORDER BY


 GROUP BY
 1. 집계함수
 2. GROUP BY 한 컬럼
 */

-- TBLINSA


-- 부서별로 직원수가 몇명?
SELECT COUNT(*)
FROM TBLINSA;

SELECT DISTINCT BUSEO
FROM TBLINSA;
SELECT COUNT(BUSEO)
FROM TBLINSA;

SELECT COUNT(*)
FROM TBLINSA
WHERE BUSEO = '총무부'; -- 7
SELECT COUNT(*)
FROM TBLINSA
WHERE BUSEO = '개발부'; -- 14
SELECT COUNT(*)
FROM TBLINSA
WHERE BUSEO = '영업부'; -- 16
SELECT COUNT(*)
FROM TBLINSA
WHERE BUSEO = '자재부'; -- 6
SELECT COUNT(*)
FROM TBLINSA
WHERE BUSEO = '기획부'; -- 7
SELECT COUNT(*)
FROM TBLINSA
WHERE BUSEO = '홍보부'; -- 6
SELECT COUNT(*)
FROM TBLINSA
WHERE BUSEO = '인사부'; -- 4
SELECT 7 + 14 + 16 + 6 + 7 + 6 + 4
FROM DUAL;
-- 60

-- GROUP BY 적용
SELECT BUSEO                AS 부서명,
       COUNT(*)             AS 부서인원수,
       ROUND(AVG(BASICPAY)) AS 부서평균급여,
       ROUND(SUM(BASICPAY)) AS 부서급여총액
FROM TBLINSA
GROUP BY BUSEO
ORDER BY 부서급여총액;

--직위
SELECT JIKWI,   -- 집합 데이터(그룹 기준)
--        NAME, [42000][979] ORA-00979: not a GROUP BY expression
--        GROUP BY가 있는데 그룹의 구성요소인 개인데이터가 나왔다.
--        GROUP BY에서는 개인 데이터 표현 불가능
       COUNT(*) -- 집합 데이터 (그룹 기준)
FROM TBLINSA
GROUP BY JIKWI; -- 그룹을 대상으로 하는 행위

SELECT *
FROM TBLINSA
GROUP BY CUBE (JIKWI, );

-- 남자 직원수? 여자 직원수 ? -> 성별 그룹
SELECT
-- SSN,
SUBSTR(SSN, 8, 1),
COUNT(*)
FROM TBLINSA
GROUP BY SUBSTR(SSN, 8, 1);


SELECT *
FROM TBLCOUNTRY;

SELECT CONTINENT,
       COUNT(*),
       MAX(POPULATION)
FROM TBLCOUNTRY
GROUP BY CONTINENT;

SELECT NAME,
       COUNT(*)
FROM TBLCOUNTRY
GROUP BY NAME;

SELECT GENDER,
       ROUND(AVG(HEIGHT), 1),
       ROUND(AVG(WEIGHT), 1)
FROM TBLCOMEDIAN
GROUP BY GENDER;
SELECT *
FROM TBLCOMEDIAN;

SELECT JOB,
       COUNT(*)
FROM TBLADDRESSBOOK
GROUP BY JOB
ORDER BY COUNT(*) DESC;

--시도 구군 동 번지
SELECT
--     SUBSTR(ADDRESS, 1, 5)
--     INSTR(ADDRESS, ' '),
SUBSTR(ADDRESS, 1, INSTR(ADDRESS, ' ') - 1),
COUNT(*)
FROM TBLADDRESSBOOK
GROUP BY SUBSTR(ADDRESS, 1, INSTR(ADDRESS, ' ') - 1)
ORDER BY COUNT(*) DESC;
-- 총무부,7
-- 개발부,14
-- 영업부,16
-- 기획부,7
-- 인사부,4
-- 자재부,6
-- 홍보부,6

SELECT BUSEO,
       COUNT(*),
       ROUND(AVG(BASICPAY))
FROM TBLINSA
WHERE BASICPAY > 2000000
GROUP BY BUSEO
HAVING AVG(BASICPAY) > 2300000;

-- tblCountry. 대륙별로 최대 인구수, 최소 인구수, 평균 인구수 가져오시오.
SELECT *
FROM TBLCOUNTRY;
SELECT MAX(POPULATION), MIN(POPULATION), AVG(POPULATION)
FROM TBLCOUNTRY
GROUP BY CONTINENT;
-- hr.employees. 직업별(job_id) 직원수를 가져오시오.
SELECT *
FROM EMPLOYEES;
SELECT JOB_ID,
       COUNT(*)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- tblinsa. 부서별로 직원들의 급여 총합, 부서인원수, 최고급여액, 최저급여액 가져오시오.
SELECT *
FROM TBLINSA;
SELECT SUM(BASICPAY + SUDANG),
       COUNT(*),
       MAX(BASICPAY + SUDANG),
       MIN(BASICPAY + SUDANG)
FROM TBLINSA
GROUP BY BUSEO;
-- tblAddressbook. 고향별(hometown) 인원수를 가져오시오. 정렬(인원수 내림차순)
SELECT *
FROM TBLADDRESSBOOK;

SELECT HOMETOWN,
       COUNT(*)
FROM TBLADDRESSBOOK
GROUP BY HOMETOWN
ORDER BY COUNT(*) DESC;

-- tblinsa. 부서별 직급의 인원수 가져오시오.
SELECT *
FROM TBLINSA;
SELECT BUSEO,
       JIKWI,
       COUNT(*)
FROM TBLINSA
GROUP BY BUSEO, JIKWI
order by buseo;

SELECT BUSEO                         AS 부서,
       COUNT(*)                      AS 인원,
       COUNT(DECODE(JIKWI, '부장', 1)) AS 부장,
       COUNT(DECODE(JIKWI, '과장', 1)) AS 과장,
       COUNT(DECODE(JIKWI, '대리', 1)) AS 대리,
       COUNT(DECODE(JIKWI, '사원', 1)) AS 사원
FROM TBLINSA
GROUP BY BUSEO;

-- 부서별 남녀 인원수?
SELECT BUSEO,
       SUBSTR(SSN, 8, 1),
       COUNT(*)
FROM TBLINSA
GROUP BY BUSEO, SUBSTR(SSN, 8, 1)
ORDER BY BUSEO, SUBSTR(SSN, 8, 1);

/*
 ROLLUP()
 GROUP BY에서 사용
 GROUP BY의 내용을 좀더 자세하게
 */

SELECT BUSEO,
       COUNT(*),
       SUM(BASICPAY),
       ROUND(AVG(BASICPAY))
FROM TBLINSA
GROUP BY ROLLUP(BUSEO);

SELECT BUSEO,
       JIKWI,
       COUNT(*),
       SUM(BASICPAY),
       ROUND(AVG(BASICPAY)),
       GROUPING_ID(BUSEO, JIKWI)
FROM TBLINSA
GROUP BY ROLLUP(BUSEO, JIKWI);

SELECT BUSEO,
       JIKWI,
       COUNT(*),
       SUM(BASICPAY),
       ROUND(AVG(BASICPAY)),
       GROUPING_ID(BUSEO, JIKWI)
FROM TBLINSA
WHERE JIKWI IN ('부장', '과장')
GROUP BY CUBE(BUSEO, JIKWI);

SELECT BUSEO,
       JIKWI,
       COUNT(*),
       SUM(BASICPAY),
       ROUND(AVG(BASICPAY)),
       GROUPING_ID(BUSEO, JIKWI)
FROM TBLINSA
WHERE JIKWI IN ('부장', '과장')
GROUP BY BUSEO, ROLLUP(JIKWI);
/*

 HAVING 절
 - 조건절
 - GROUP BY에 대한 조건절 > 집계 대상으로 조건을 질문

 WHERE 절
 - 조건절
 - FROM에 대한 조건절 > 레코드 하나 하나를 대상 조건으로 질문
 group by 절
 - 레코드들을 특정 컬럼값(1개, N개)에 맞춰서 그룹을 나누는 역할
 - 그룹을 왜 나누는지?
    -> 각각의 나눠진 그룹을 대상으로 > 집계 함수를 적용하기 위해서****
    -> count, sum, avg, max, min
 - GROUP BY 컬럼명 [,컬럼명] x N

 SELECT 컬럼리스트
 FROM 테이블명
 WHERE 조건
 GROUP BY 그룹기준
 HAVING 조건
 ORDER BY 정렬

 실행순서
 1. FROM
 2. WHERE
 3. GROUP BY
 4. HAVING
 5. SELECT
 6. ORDER BY

 FROM절 -> WHERE절 : 개인(레코드 한개)에 대한 조건
 GROUP BY절 -> HAVING절 : 그룹에(집계함수 결과) 대한 조건



 GROUP BY
 1. 집계함수
 2. GROUP BY 한 컬럼
 */


/*
 오라클 프로젝트
 주제 : 쌍용 교육센터 운영 관리 시스템
 과정, 커리큘럼, 모집, 학생정보 취합 (학사관리 시스템)
 - 요구사항(준비)
 - 요구분석서 만들기부터 ~ 필요한 데이터베이스 만들고 스키마 만들고 데이터 넣고 쿼리짜고 하는거

 1. 모델링
 2. ERD
 3. 스크립트
 4. DB Object

 1. ANSI_SQL
 -------> 프로젝트 오전수업 오후프로젝트
 3. 모델링
 2. PL/SQL
 ANSI_SQL 이번주~ 차주 월요일 프로젝트시작
 */

--1. traffic_accident. 각 교통 수단 별(지하철, 철도, 항공기, 선박, 자동차) 발생한 총 교통 사고 발생 수, 총 사망자 수, 사건 당 평균 사망자 수를 가져오시오.
SELECT TRANS_TYPE,
       SUM(TOTAL_ACCT_NUM) AS 교통사고발생수,
       SUM(DEATH_PERSON_NUM) AS 총사망자수,
       ROUND(AVG(DEATH_PERSON_NUM)) AS 평균사망자수
FROM TRAFFIC_ACCIDENT
GROUP BY TRANS_TYPE;
SELECT * FROM TRAFFIC_ACCIDENT;
--2. tblZoo. 종류(family)별 평균 다리의 갯수를 가져오시오.
SELECT FAMILY,
       AVG(LEG) AS 평균다리개수
FROM TBLZOO
GROUP BY FAMILY;
select * from tblzoo;

--3. tblZoo. 체온이 변온인 종류 중 아가미 호흡과 폐 호흡을 하는 종들의 갯수를 가져오시오.
SELECT * FROM TBLZOO;
SELECT FAMILY,
       COUNT(FAMILY)
FROM TBLZOO
WHERE THERMO = 'variable'
GROUP BY FAMILY;
--4. tblZoo. 사이즈와 종류별로 그룹을 나누고 각 그룹의 갯수를 가져오시오.
SELECT * FROM TBLZOO;

SELECT FAMILY,
       SIZEOF,
       COUNT(*)
FROM TBLZOO
GROUP BY FAMILY, SIZEOF;
--6. tblTodo. 완료한 일의 갯수와 완료하지 않은 일의 갯수를 가져오시오.
SELECT * FROM TBLTODO;

SELECT
count(completedate),
count(*) - count(completedate)
FROM TBLTODO;



--7. tblAddressBook. 서울에 사는 10대, 20대, 30대, 40대 인원수를 가져오시오.
select
trunc(age, -1)
from tbladdressbook;

--8. tblAddressBook. 현재 주소(address)와 고향(hometown)이 같은 지역인 사람들을 가져오시오.


--9. tblAddressBook. 역삼로에 사는 사람 중 gmail을 사용하는 사람들을 가져오시오.


--11. tblAddressBook. 전화번호에 '123'이 들어간 사람 중 여학생만을 가져오시오.


--12. tblAddressBook. 관리자의 실수로 몇몇 사람들의 이메일 주소가 중복되었다. 중복된 이메일 주소만 가져오시오.


--15. tblAddressBook. 성씨별 인원수가 100명 이상 되는 성씨들을 가져오시오.


--17. tblAddressBook. 이메일이 스네이크 명명법으로 만들어진 사람들 중에서 여자이며, 20대이며, 키가 150~160cm 사이며, 고향이 서울 또는 인천인 사람들만 가져오시오.


--18. tblAddressBook. gmail.com을 사용하는 사람들의 성별 > 세대별(10,20,30,40대) 인원수를 가져오시오.


--53. employees. 총 사원 수 및 2003, 2004, 2005, 2006 년도 별 고용된 사원들의 총 수를 가져오시오.


--55. employees. 직업이 'AD_PRESS' 인 사람은 A 등급을, 'ST_MAN' 인 사람은 B 등급을, 'IT_PROG' 인 사람은 C 등급을, 'SA_REP' 인 사람은 D 등급을, 'ST_CLERK' 인 사람은 E 등급을 기타는 0 을 부여하여 가져오시오.




--1. traffic_accident. 각 교통 수단 별(지하철, 철도, 항공기, 선박, 자동차) 발생한 총 교통 사고 발생 수, 총 사망자 수, 사건 당 평균 사망자 수를 가져오시오.
SELECT
	trans_type AS "교통 수단",
	sum(total_acct_num) AS "총 교통 사고 발생 수",
	sum(death_person_num) AS "총 사망자 수",
	sum(death_person_num)/sum(total_acct_num) AS "사건 당 사망자 수"
FROM
	traffic_accident
GROUP BY
	trans_type;

--2. tblZoo. 종류(family)별 평균 다리의 갯수를 가져오시오.
SELECT
	family,
	avg(leg) AS "평균 다리의 갯수"
FROM
	tblzoo
GROUP BY
	family;


--3. tblZoo. 체온이 변온인 종류 중 아가미 호흡과 폐 호흡을 하는 종들의 갯수를 가져오시오.
SELECT
	count(decode(breath, 'gill', 1)) AS 아가미,
	count(decode(breath, 'lung', 1)) AS 폐
FROM
	tblzoo
WHERE
	thermo = 'variable';


--4. tblZoo. 사이즈와 종류별로 그룹을 나누고 각 그룹의 갯수를 가져오시오.
SELECT
	sizeof,
	family,
	count(*)
FROM
	tblzoo
GROUP BY
	sizeof, family;


--6. tblTodo. 완료한 일의 갯수와 완료하지 않은 일의 갯수를 가져오시오.
SELECT
	count(completedate) AS "완료한 일",
	count(*) - count(completedate) AS "완료하지 않은 일"
FROM
	tbltodo;


--7. tblAddressBook. 서울에 사는 10대, 20대, 30대, 40대 인원수를 가져오시오.
SELECT
	trunc(age, -1)||'대',
	count(*)
FROM
	tbladdressbook
GROUP BY
	trunc(age, -1);


--8. tblAddressBook. 현재 주소(address)와 고향(hometown)이 같은 지역인 사람들을 가져오시오.
SELECT
	*
FROM
	tbladdressbook
WHERE
	instr(address, hometown) <> 0;


--9. tblAddressBook. 역삼로에 사는 사람 중 gmail을 사용하는 사람들을 가져오시오.
SELECT
	*
FROM
	tbladdressbook
WHERE
	substr(email, instr(email, '@') + 1, instr(email, '.') - instr(email, '@') - 1) = 'gmail' AND instr(address, '역삼로') <> 0;

--11. tblAddressBook. 전화번호에 '123'이 들어간 사람 중 여학생만을 가져오시오.
SELECT
	*
FROM
	tbladdressbook
WHERE
	instr(tel, 123) <> 0 AND gender = 'f';


--12. tblAddressBook. 관리자의 실수로 몇몇 사람들의 이메일 주소가 중복되었다. 중복된 이메일 주소만 가져오시오.
SELECT
	email
FROM
	tbladdressbook a
GROUP BY
	email
HAVING
	count(*) > 1;


--15. tblAddressBook. 성씨별 인원수가 100명 이상 되는 성씨들을 가져오시오.
SELECT
	substr(name, 1, 1)
FROM
	tbladdressbook
GROUP BY
	substr(name, 1, 1)
HAVING
	count(*) >= 100;


--17. tblAddressBook. 이메일이 스네이크 명명법으로 만들어진 사람들 중에서 여자이며, 20대이며, 키가 150~160cm 사이며, 고향이 서울 또는 인천인 사람들만 가져오시오.
SELECT
	*
FROM
	tbladdressbook
WHERE
	instr(email, '_') <> 0
	AND gender = 'f'
	AND (age BETWEEN 20 AND 29)
	AND (height BETWEEN 150 AND 160)
	AND hometown IN ('서울', '인천');

--18. tblAddressBook. gmail.com을 사용하는 사람들의 성별 > 세대별(10,20,30,40대) 인원수를 가져오시오.
SELECT
	trunc(age, -1) AS "세대",
	count(*) AS "세대별 인원수",
	count(CASE
		WHEN gender = 'f' THEN 1
	END) AS 여자,
	count(CASE
		WHEN gender = 'm' THEN 1
	END) AS 남자
FROM
	tbladdressbook
WHERE
	instr(email, '@gmail.com') != 0
GROUP BY
	trunc(age, -1);

--53. employees. 총 사원 수 및 2003, 2004, 2005, 2006 년도 별 고용된 사원들의 총 수를 가져오시오.
SELECT
	to_char(hire_date, 'yyyy')||'년',
	count(*) || '명'
FROM
	hr.employees
GROUP BY
	to_char(hire_date, 'yyyy')
ORDER BY
	1;

--55. employees. 직업이 'AD_PRESS' 인 사람은 A 등급을, 'ST_MAN' 인 사람은 B 등급을, 'IT_PROG' 인 사람은 C 등급을, 'SA_REP' 인 사람은 D 등급을, 'ST_CLERK' 인 사람은 E 등급을 기타는 0 을 부여하여 가져오시오.
SELECT
	hr.employees.*,
	CASE
		WHEN job_id = 'AD_PRES' THEN 'A'
		WHEN job_id = 'ST_MAN' THEN 'B'
		WHEN job_id = 'IT_PROG' THEN 'C'
		WHEN job_id = 'SA_REP' THEN 'D'
		WHEN job_id = 'ST_CLERK' THEN 'E'
		ELSE '0'
	END
FROM
	hr.employees;


---------------------------
-- CREATE TABLE DEPT_TEMP
-- AS
-- SELECT *
-- FROM DEPT;
--
-- select *
-- from dept_temp;
--
-- INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
-- VALUES (50, 'DATABASE', 'SEOUL');
--
-- SELECT *
-- FROM DEPT_TEMP;
--
-- INSERT INTO DEPT_TEMP
-- VALUES (60, 'NETWORK', 'BUSAN');
--
-- INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
-- VALUES (70, 'WEB', NULL);
--
-- INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC)
-- VALUES (80, 'MOBILE', '');
--
-- INSERT INTO DEPT_TEMP(DEPTNO, LOC)
-- VALUES (90, 'INCHEON');
--
-- SELECT DEPTNO,
--        LISTAGG(ENAME, ', ')
--                WITHIN GROUP (ORDER BY SAL DESC) AS ENAMES
-- FROM EMP
-- GROUP BY DEPTNO;
