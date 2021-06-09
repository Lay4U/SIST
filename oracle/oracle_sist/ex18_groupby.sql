-- ex18_groupby.sql

/*

[WITH <Sub Query>]
SELECT column_list
FROM table_name
[WHERE search_condition]
[GROUP BY group_by_expression]
[HAVING serach_condition]
[ORDER BY order_expression [ASC|DESC]];




group by 절
- 레코드들을 특정 컬럼값(1개 or N개)에 맞춰서 그룹을 나누는 역할
- 그룹을 왜 나누는지?
    -> 각각의 나눠진 그룹 대상 > 집계 함수를 적용하기 위해서(******) -> count, sum, avg, max, min

- group by 컬럼명 [,컬럼명] x N


SELECT 컬럼리스트
FROM 테이블명
WHERE 조건
GROUP BY 그룹기준
ORDER BY 정렬;


***** select를 구성하는 모든 절들은 실행 순서가 있다.(불변) -> 무조건 암기(이해)
1. FROM절
2. WHERE절
3. GROUP BY절
4. SELECT절
5. ORDER BY절


group by를 사용한 select절에서 사용할 수 있는 표현
1. 집계함수
2. group by 한 컬럼




*/

-- tblInsa. 부서별로 직원수가 몇명?

select count(*) from tblInsa; -- 총직원수

select distinct buseo from tblInsa; --부서

select count(*) from tblInsa where buseo = '총무부'; -- 7
select count(*) from tblInsa where buseo = '개발부'; -- 14
select count(*) from tblInsa where buseo = '영업부'; -- 16
select count(*) from tblInsa where buseo = '자재부'; -- 6
select count(*) from tblInsa where buseo = '기획부'; -- 7
select count(*) from tblInsa where buseo = '홍보부'; -- 6
select count(*) from tblInsa where buseo = '인사부'; -- 4

-- group by 적용
select 
    buseo as 부서명, 
    count(*) as 부서인원수, 
    round(avg(basicpay)) as 부서평균급여,
    round(sum(basicpay)) as 부서급여총액
from tblInsa 
    group by buseo;
    


-- ORA-00979: GROUP BY 표현식이 아닙니다.

-- 직위
select
    jikwi, -- 집합 데이터(그룹 기준)
    --name, -- 개인 데이터(개별 레코드 기준)
    count(*) -- 집합 데이터(그룹 기준)
from tblInsa
    group by jikwi;



-- 남자 직원수? 여자 직원수? -> 성별 그룹
select
    --ssn,
    substr(ssn, 8, 1),
    case
        when substr(ssn, 8, 1) = '1' then '남자'
        when substr(ssn, 8, 1) = '2' then '여자'
    end as gender,
    count(*)
from tblInsa
    group by substr(ssn, 8, 1);



-- tblCountry;
select * from tblCountry;

select
    continent,
    count(*),
    max(population)
from tblCountry
    group by continent;

select 
    name,
    count(*)
from tblCountry
    group by name;


select 
    gender,
    round(avg(height), 1),
    round(avg(weight), 1)
from tblComedian
    group by gender;
    

select 
    job,
    count(*)
from tblAddressBook
    group by job
        order by count(*) desc;


-- 시도 구군 동 번지
-- 서울특별시 종로구 수표로20길 34
-- 경기도 화성시 봉담읍 매송고색로394번길 3-14
-- 광주광역시 남구 압촌3길 3 ~ 10
-- 강원도 평창군 봉평면 금당계곡로 1258 ~ 1883
-- 부산광역시 연제구 마곡천로 2 ~ 70
select
    --substr(address, 1, 5)
    --instr(address, ' ')
    substr(address, 1, instr(address, ' ') - 1),
    count(*)
from tblAddressBook
    group by substr(address, 1, instr(address, ' ') - 1)
        order by count(*) desc;








/*


having 절
- 조건절
- group by에 대한 조건절 > 집계 결과를 대상으로 조건을 질문

where 절
- 조건절
- from에 대한 조건절 > 레코드 하나 하나를 대상으로 조건을 질문


SELECT 컬럼리스트
FROM 테이블명
WHERE 조건
GROUP BY 그룹기준
HAVING 조건
ORDER BY 정렬;


***** select를 구성하는 모든 절들은 실행 순서가 있다.(불변) -> 무조건 암기(이해)
1. FROM절
2. WHERE절
3. GROUP BY절
4. HAVING절
5. SELECT절
6. ORDER BY절


A. from절 -> where절 : 개인(레코드 1개씩)에 대한 조건
B. group by절 -> having절 : 그룹에(집계 함수) 대한 조건

*/


--BUSEO             COUNT(*)
----------------- ----------
--총무부                   7
--개발부                  14
--영업부                  16
--자재부                   6
--기획부                   7
--홍보부                   6
--인사부                   4


--BUSEO             COUNT(*)
----------------- ----------
--총무부                   3
--개발부                   4
--영업부                   5
--자재부                   2
--기획부                   2
--인사부                   2
--홍보부                   1


--BUSEO             COUNT(*)
----------------- ----------
--총무부                   7
--영업부                  16
--기획부                   7
--인사부                   4

select
    buseo,
    count(*)
from tblInsa
    where basicpay > 2000000
        group by buseo
            having avg(basicpay) > 2500000;




-- tblCountry. 대륙별로 최대 인구수, 최소 인구수, 평균 인구수 가져오시오.
select
    max(population) as 최대인구수,
    min(population) as 최소인구수,
    avg(population) as 평균인구수
from tblCountry
    group by continent;

-- hr.employees. 직업별(job_id) 직원수를 가져오시오.
select
    job_id,
    count(*)
from employees
    group by job_id;

-- tblinsa. 부서별로 직원들의 급여 총합, 부서인원수, 최고급여액, 최저급여액 가져오시오.
select
    buseo,
    sum(basicpay),
    count(*),
    max(basicpay),
    min(basicpay)
from tblInsa
    group by buseo;

-- tblAddressbook. 고향별(hometown) 인원수를 가져오시오. 정렬(인원수 내림차순)
select
    hometown,
    count(*)
from tblAddressbook
    group by hometown;

-- tblinsa. 부서별 직급의 인원수 가져오시오. group by + decode
select
    buseo as 부서,
    count(*) as 인원,
    count(decode(jikwi, '부장', 1)) as 부장,
    count(decode(jikwi, '과장', 1)) as 과장,
    count(decode(jikwi, '대리', 1)) as 대리,
    count(decode(jikwi, '사원', 1)) as 사원
from tblInsa
    group by buseo;


select
    buseo,
    jikwi,
    count(*)
from tblInsa
    group by buseo, jikwi
        order by buseo, jikwi;



-- 부서별 남녀 인원수?
select
    buseo,
    substr(ssn, 8, 1),
    count(*)
from tblInsa
    group by buseo, substr(ssn, 8, 1)
        order by buseo, substr(ssn, 8, 1);
    





/*

rollup()
- group by에서 사용
- group by의 결과에서 집계 결과를 더 자세하게 반환한다.

*/

select
    buseo,
    count(*),
    sum(basicpay),
    round(avg(basicpay))
from tblInsa
    group by rollup(buseo);



select
    buseo,
    jikwi,
    count(*),
    sum(basicpay),
    round(avg(basicpay)),
    grouping_id(buseo, jikwi) -- 0(일반행), 1(소계행), 3(총계행)
from tblInsa
    group by rollup(buseo, jikwi);





select
    buseo,
    jikwi,
    count(*),
    sum(basicpay),
    round(avg(basicpay)),
    grouping_id(buseo, jikwi) 
from tblInsa
    where jikwi in ('부장','과장')
        group by cube(buseo, jikwi);












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












--7. tblAddressBook. 서울에 사는(where) 10대, 20대, 30대, 40대(group by) 인원수(count)를 가져오시오.
select
    floor(age / 10) * 10 || '대' as 연령,
    count(*) as 인원수
from tblAddressBook
    where instr(address, '서울') = 1
        group by floor(age / 10)
            order by floor(age / 10);





--17. tblAddressBook. 
-- 이메일이 스네이크 명명법으로 만들어진 사람들 중에서(where) 
-- 여자이며(where)
-- , 20대이며(where)
-- , 키가 150~160cm 사이며(where), 
-- 고향이 서울 또는 인천인 사람들만 가져오시오.

select
    *
from tblAddressBook
    where instr(email, '_') > 0
        and gender = 'f'
        and floor(age / 10) = 2
        and height between 150 and 160
        and hometown in ('서울', '인천');






























