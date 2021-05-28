-- ex19_subquery.sql

/*

메인쿼리, Main Query
- 하나의 select(insert, update, delete)로만 구성된 쿼리

서브쿼리, Sub Query
- 하나의 문장에 2개 이상의 select를 추가해서 구성된 쿼리
- 하나의 쿼리안에 또다른 쿼리가 들어있는 형태
- 삽입 위치: select절, from절, where절, order by절 등..

- select + select x N
- insert + select x N
- update + select x N
- delete + select x N

*/


-- tblCountry. 인구수가 가장 많은 나라의 인구수는? -> 그 나라?
select max(population) from tblCountry;
select name from tblCountry where population = 120660;

select name from tblCountry where population = max(population); --ORA-00934: 그룹 함수는 허가되지 않습니다

select name from tblCountry where population = (select max(population) from tblCountry);



-- tblInsa. 급여가 가장 많은 사람의 이름?
select max(basicpay) from tblInsa; --2650000
select name from tblInsa where basicpay = 2650000; --허경운

select name from tblInsa where basicpay = (select max(basicpay) from tblInsa);


-- tblInsa. 평균 급여보다 많이 받는 직원들?
select avg(basicpay) from tblInsa; --1556526
select * from tblInsa where basicpay > 1556526;
select * from tblInsa where basicpay > (select avg(basicpay) from tblInsa);


-- tblInsa. '홍길동'과 같은 부서에 근무하는 사람들?
select buseo from tblInsa where name = '홍길동';
select * from tblInsa where buseo = (select buseo from tblInsa where name = '홍길동') and name <> '홍길동';


-- 서브쿼리의 용도
-- 1. 조건절 비교값으로 사용
--  a. 반환값이 1행 1열 > 단일값, 값 1개 > 스칼라 쿼리(1행 1열) > 연산자 사용
--  b. 반환값이 N행 1열 > 다중값, 값 N개 > in 사용(열거형 비교)
--  c. 반환값이 1행 N열 > 복합값, 값 N개 > 연산자 사용(N:N)
--  d. 반환값이 N행 N열 > b + c > b와 c의 방식을 혼합해서 사용

-- 1.a
select
    *
from tblInsa
    where basicpay = (select max(basicpay) from tblInsa);


-- 1.b
-- 급여가 260만원 이상 받는 사람들이 근무하는 부서의 명단?
select
    *
from tblInsa
    where buseo in (select buseo from tblInsa where basicpay >= 2600000);
  --where buseo in ('기획부','총무부')



-- 기획부 대리와 같은 지역에 사는 사람들?
select city from tblInsa where buseo = '기획부' and jikwi = '대리';
select * from tblInsa where city in ('서울', '인천', '전남');

select * from tblInsa where city in (select city from tblInsa where buseo = '기획부' and jikwi = '대리');



-- 1.c
-- '홍길동'가 사는 지역과 같은 지역에 살고, 같은 직위를 가지는 직원?
select city, jikwi from tblInsa where name = '홍길동'; --서울, 부장

select * from tblInsa where city = '서울' and jikwi = '부장';

-- 2:2 -> N:N 비교
select * from tblInsa where (city, jikwi) = (select city, jikwi from tblInsa where name = '홍길동');



-- 1.d
-- 급여를 2600000원 이상 받는 직원의 부서와 사는곳이 동일한 직원들?
select buseo, city from tblInsa where basicpay >= 2600000;

select * from tblInsa
    where (buseo, city) in (select buseo, city from tblInsa where basicpay >= 2600000);






-- 서브쿼리의 용도
-- 1. 조건절 비교값으로 사용
--  a. 반환값이 1행 1열 > 단일값, 값 1개 > 스칼라 쿼리(1행 1열) > 연산자 사용
--  b. 반환값이 N행 1열 > 다중값, 값 N개 > in 사용(열거형 비교)
--  c. 반환값이 1행 N열 > 복합값, 값 N개 > 연산자 사용(N:N)
--  d. 반환값이 N행 N열 > b + c > b와 c의 방식을 혼합해서 사용

-- 2. 컬럼리스트에서 사용
--  a. 반환값이 1행 1열 > 스칼라 쿼리
--      1. 정적 쿼리(모든 행에 동일한 값을 반환)
--      2. 상관 서브 쿼리(서브 쿼리의 값과 바깥쪽 메인 쿼리의 값을 연계시켜 값을 반환) ***********************

select 
    name,
    basicpay,
    avg(basicpay)
from tblInsa;

select 
    name,
    basicpay,
    --(select 100 from dual),
    --100,
    (select round(avg(basicpay)) from tblInsa)
from tblInsa;


select
    name,
    buseo,
    (select round(avg(basicpay)) from tblInsa) as 평균급여,
    (select jikwi from tblInsa where name = '홍길동') -- 나머지 컬럼과 관계있는 서브쿼리만 사용
from tblInsa;



select * from tblMen;
select * from tblWomen;

-- 남자이름, 남자키, 여자이름, 여자키 -> 홍길동(X), 모든 커플
select
    name as 남자이름,
    height as 남자키,
    couple as 여자이름,
    (select height from tblWomen where name = tblMen.couple) as 여자키
from tblMen
    --where name = '홍길동';
    where couple is not null; --커플




select * from employees; -- 직원
select * from departments; --부서


-- 직원의 이름과 부서명을 가져오시오.
select
    first_name || ' ' || last_name as name,
    --department_id,
    (select department_name from departments where department_id = employees.department_id) as department
from employees;




-- 서브쿼리

--10. tblAddressBook. 가장 많은 사람들이 가지고 있는 직업은 주로 어느 지역 태생(hometown)인가?
select 
    distinct hometown
from tblAddressBook
    where job = (select job from tblAddressBook group by job having count(*) = (select max(count(*)) from tblAddressBook group by job))
        order by hometown asc;



--13. tblAddressBook. 이메일 도메인들 중 평균 아이디 길이가 가장 긴 이메일 사이트의 도메인은 무엇인가?

select 
    substr(email,instr(email,'@')+1), 
    avg(length(substr(email,1,instr(email,'@')-1)))
from tbladdressbook
    group by substr(email,instr(email,'@')+1)
        having avg(length(substr(email,1,instr(email,'@')-1))) 
            = (select max(avg(length(substr(email,1,instr(email,'@')-1)))) from tbladdressbook group by substr(email,instr(email,'@')+1));

--14. tblAddressBook. 평균 나이가 가장 많은 출신(hometown)들이 가지고 있는 직업 중 가장 많은 직업은?
select 
    job
from tblAddressBook
    where hometown = (select hometown from tblAddressBook group by hometown having avg(age) = (select max(avg(age)) from tblAddressBook group by hometown))
        group by job
            having count(*) = (select max(count(*)) from tblAddressBook where hometown = (select hometown from tblAddressBook group by hometown having avg(age) = (select max(avg(age)) from tblAddressBook group by hometown)) group by job); 

--16. tblAddressBook. 남자 평균 나이보다 나이가 많은 서울 태생 + 직업을 가지고 있는 사람들을 가져오시오.
select 
    *
from tblAddressBook
    where age > (select avg(age) from tblAddressBook where gender='m')
            and hometown='서울' and job not in ('취업준비생','백수');


--19. tblAddressBook. 가장 나이가 많으면서 가장 몸무게가 많이 나가는 사람과 같은 직업을 가지는 사람들을 가져오시오.
select 
    *
from tblAddressBook
    where job =(select job from tblAddressBook where age = (select max(age) from tblAddressBook) and weight = (select max(weight) from tblAddressBook));

--20. tblAddressBook. '건물주'와 '건물주자제분'들의 거주지가 서울과 지방의 비율이 어떻게 되느냐?
select 
    round((count(case
        when substr(address,1,2)='서울' then 1
    end)/count(*) *100 ),1) as "서울 비율",
    round((count(case
        when substr(address,1,2) <> '서울' then 1
    end)/count(*)*100),1) as "지방 비율"
from tblAddressBook
    where job in ('건물주', '건물주자제분');

--21. tblAddressBook.  동명이인이 여러명 있습니다. 이 중 가장 인원수가 많은 동명이인(모든 이도윤)의 명단을 가져오시오.
select 
    *
from tblAddressBook
    where name = (select name from tblAddressBook group by name having count(*) = (select max(count(*)) from tblAddressBook group by name));

--22. tblAddressBook. 가장 사람이 많은 직업의(332명) 세대별 비율을 구하시오.
--    [10대]       [20대]       [30대]       [40대]
--    8.7%        30.7%        28.3%        32.2%
select 
    substr(age,1,1) || '0대', 
    round(count(*)/(select count(*) from tblAddressBook where job = (select job from tblAddressBook group by job having count(*) = (select max(count(*)) from tblAddressBook group by job)))*100,1 ) as "비율"
from tblAddressBook
    where job = (select job from tblAddressBook group by job having count(*) = (select max(count(*)) from tblAddressBook group by job))
        group by substr(age,1,1)
            order by substr(age,1,1);

SELECT
	round(count(CASE
		WHEN age BETWEEN 10 AND 19 THEN 1
	END) / count(*) * 100) || '%' AS "10대",
	round(count(CASE
		WHEN age BETWEEN 20 AND 29 THEN 1
	END) / count(*) * 100) || '%' AS "20대",
	round(count(CASE
		WHEN age BETWEEN 30 AND 39 THEN 1
	END) / count(*) * 100) || '%' AS "30대",
	round(count(CASE
		WHEN age BETWEEN 40 AND 49 THEN 1
	END) / count(*) * 100) || '%' AS "40대"
FROM
	tbladdressbook
WHERE
	job = (SELECT job FROM tbladdressbook GROUP BY job HAVING count(*) = (SELECT max(count(*)) FROM tbladdressbook GROUP BY job));

--38. employees. 급여를 12000 이상 받는 사원과 같은 부서에서 근무하는 사원들의 이름, 급여, 부서번호를 가져오시오.
select 
    first_name||' '||last_name, salary, department_id
from hr.employees
    where department_id in (select department_id from hr.employees where salary>12000);

--40. employees, departments. first_name이 'Jonathon'인 직원과 같은 부서에 근무하는 직원들 정보를 가져오시오.
select 
    *
from hr.employees
    where department_id= (select department_id from hr.employees where first_name = 'Jonathon');

--61. employees. 2001~2003년사이에 입사한 사원의 이름(first_name), 입사일(hire_date), 관리자사번 (employee_id), 관리자 이름(fist_name)을 가져오시오. 단, 관리자가 없는 사원정보도 결과에 포함시켜 가져오시오.
SELECT
	first_name,
	hire_date,
	employee_id,
	(SELECT first_name FROM hr.employees e2 WHERE e.manager_id = e2.employee_id)
FROM hr.employees e
    WHERE to_char(hire_date, 'yyyy') BETWEEN 2001 AND 2003;

--63. employees. last_name 에 'u' 가 포함되는 사원들과 동일 부서에 근무하는 사원들의 사번 및 last_name을 가져오시오.
SELECT 
    employee_id, last_name
FROM hr.employees
    WHERE department_id IN (SELECT department_id
							FROM hr.employees
								WHERE instr(upper(last_name), 'U') > 0
									GROUP BY department_id);

                                






