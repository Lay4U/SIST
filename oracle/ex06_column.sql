-- ex06_column.sql

/*

distinct
- 컬럼 리스트에 사용
- 중복값을 제거한다.
- distinct 컬럼명

*/

select * from tblCountry;

-- tblCountry에는 어떤 대륙이 있나요? -> 분류 질문
select continent from tblCountry;
select distinct continent from tblCountry;

select * from tblInsa;

-- tblInsa. 어떤 부서가 있나요?
select buseo from tblInsa;
select distinct buseo from tblInsa;

--중복값이 단 1개도 없어도 동작된다. > 중복값이 없는 컬럼에 distinct를 적용하는건 의미가 없다.
select distinct name from tblInsa; 


--개발부	황진이
--개발부	채정희
select buseo, name from tblInsa;
select distinct buseo, name from tblInsa; -- 60명

-- 총무부	사원
-- 총무부	사원
-- 총무부	사원
select buseo, jikwi from tblInsa; -- 60명
select distinct buseo, jikwi from tblInsa; --23



-- 표
-- 1. 데이터 저장하는 표 > 오라클 
-- 2. 화면에 데이터를 출력하는 표 > 보여주기 위한 표 > 셀병합 지원








-- 요구사항.001
-- 모든 행과 모든 컬럼을 가져오시오.
select * from tblCountry;

-- 요구사항.002
-- 국가명과 수도명을 가져오시오.
select name, capital from tblCountry;

-- 요구사항.003
-- 아래와 같이 가져오시오
select 
    name as "[국가명]",
    capital as "[수도명]",
    population as "[인구수]",
    area as "[면적]",
    continent as "[대륙]"
from tblCountry;

--요구사항.004
--아래와 같이 가져오시오
select
    '국가명:' || name || ',' ||
    '수도명:' || capital || ',' ||
    '인구수:' || population as "[국가정보]"
from tblCountry;

--요구사항.005
--아래와 같이 가져오시오
select
    first_name || ' ' || last_name as "[이름]",
    email || '@gmail.com' as "[이메일]",
    phone_number as "[연락처]",
    '$' || salary as "[급여]"
from hr.employees;


--요구사항.006
--면적(area)이 100이하인 국가의 이름과 면적을 가져오시오.
select name, area
    from tblCountry
        where area < 100;

--요구사항.007
--아시아와 유럽 대륙에 속한 나라를 가져오시오.
select * from tblCountry
    where continent in ('AS', 'EU');


--요구사항.008
--직업(job_id)이 프로그래머(it_prog)인 직원의 이름(풀네임)과 연락처 가져오시오.
select 
    first_name || ' ' || last_name,
    phone_number
from hr.employees
where job_id = 'IT_PROG';


--요구사항.009
--last_name이 'Grant'인 직원의 이름, 연락처, 고용날짜를 가져오시오.
select 
    first_name || ' ' || last_name,
    phone_number,
    hire_date
from hr.employees
where last_name = 'Grant';



--요구사항.010
--특정 매니저(120)이 관리하는 직원의 이름, 급여, 연락처를 가져오시오.
select 
    first_name || ' ' || last_name,
    salary,
    phone_number
from hr.employees
where manager_id = 120;


--요구사항.011
--특정 부서(60, 80, 100)에 속한 직원들의 이름, 연락처, 이메일, 부서ID 가져오시오.
select 
    first_name || ' ' || last_name,
    phone_number,
    email || '@gmail.com',
    department_id
from hr.employees
where department_id in (60, 80, 100);


--요구사항.012
--기획부 직원들 가져오시오.
select * from tblInsa where buseo = '기획부';


--요구사항.013
--서울에 있는 직원들 중 직위가 부장인 사람의 이름, 직위, 전화번호 가져오시오.
select
    name, jikwi, tel
from tblInsa
where city = '서울' and jikwi = '부장';


--요구사항.014
--기본급여 + 수당 합쳐서 150만원 이상인 직원 중 서울에 직원만 가져오시오.
select * from tblInsa
    where basicpay + sudang >= 1500000;


--요구사항.015
--수당이 15만원 이하인 직원 중 직위가 사원, 대리만 가져오시오.
select * from tblInsa
    where sudang <= 150000
        and jikwi in ('사원', '대리');



--요구사항.016
--수당을 제외한 기본 연봉이 2천만원 이상, 서울, 직위 과장(부장)만 가져오시오.
select * from tblInsa
    where basicpay * 12 >= 20000000
        and city = '서울'
        and jikwi in ('과장', '부장');


--요구사항.017
--국가명 'O국'인 나라를 가져오시오.
select * from tblCountry
    where name like '_국';
    --where name like '%국';


--요구사항.018
--연락처가 515로 시작하는 직원들 가져오시오.
select * from hr.employees
    where phone_number like '515%';
    

--요구사항.019
--직업 ID가 SA로 시작하는 직원들 가져오시오.
select * from hr.employees
    where job_id like 'SA%';
    

--요구사항.020
--first_name에 'de'가 들어간 직원들 가져오시오.
select * from hr.employees
    where first_name like '%DE%'
        or first_name like '%De%'
        or first_name like '%dE%'
        or first_name like '%de%';

--요구사항.021
--남자 직원만 가져오시오.
select * from tblInsa
    where ssn like '%-1%';

-- 요구사항.022
--여자 직원만 가져오시오.   
select * from tblInsa
    where ssn like '%-2%';


--요구사항.023
--여름에 태어난 직원들 가져오시오.
select * from tblInsa
    where ssn like '___7%-%'
    or  ssn like '___8%-%'
    or  ssn like '___9%-%';


--요구사항.024
--서울, 인천에 사는 김씨만 가져오시오.    
select * from tblInsa
    where city in ('서울', '인천')
        and name like '김%';


--요구사항.025
--영업부/총무부/개발부 직원 중 사원급(사원/대리) 중에 010을 사용하는 직원들을 가져오시오.
select * from tblInsa
    where buseo in ('영업부', '총무부', '개발부')
        and jikwi in ('사원', '대리')
        and tel like '010%';



--요구사항.026
--서울/인천/경기에 살고 입사일이 2008~2010년 사이인 직원들을 가져오시오.
select * from tblInsa
    where city in ('서울', '인천', '경기')
        and ibsadate between '2008-01-01' and '2010-12-31';


--요구사항.027
--부서가 아직 배정 안된 직원들을 가져오시오.
select * from hr.employees
    where department_id is null;



--요구사항.028
--직업이 어떤것들이 있는지 가져오시오.
select distinct job_id from hr.employees;



--요구사항.029
--고용일이 2002~2004년 사이인 직원들은 어느 부서에 근무합니까?
select distinct department_id from hr.employees
    where hire_date between '2002-01-01' and '2004-12-31';


--요구사항.030
--급여가 5000불 이상인 직원들은 담당 매니저가 누구?
select distinct manager_id from hr.employees
    where salary >= 5000;



--요구사항.031
--남자 직원 + 80년대생들의 직급은 뭡니까?
select distinct jikwi from tblInsa
    where ssn like '8%-1%';


--요구사항.032
--수당 20만원 넘는 직원들은 어디 삽니까?
select distinct city from tblInsa
    where sudang >= 200000;


--요구사항.033
--연락처가 아직 없는 직원은 어느 부서입니까?
select distinct buseo from tblInsa
    where tel is null;


/*

1. 자료형
    - number, varchar2, char, date

2. select
    a. from 절
    b. select 컬럼 리스트 -> 별칭(Alias), 연산자(산술), distinct
    c. where 절 -> 연산자(산술, 비교, 논리), between, in, like, is null
    





case
- 모든 곳에서 사용이 가능
    - 컬럼 리스트에서 사용
    - 조건절에서 사용
    - 정렬에서 사용
- 자바의 if/switch과 비슷한 행동
- 문장의 단위의 제어(X) -> 값을 제어(O)
- 조건을 만족하지 못하는 컬럼은 null을 반환(***)

*/

select
    last || first as name,
    gender
from tblComedian;

select
    last || first as name,
    case
        when gender = 'm' then '남자'
        when gender = 'f' then '여자'
    end as gender
from tblComedian;



select 
    name,
    case
        when continent = 'AS' then '아시아'
        when continent = 'EU' then '유럽'
        when continent = 'AF' then '아프리카'
        --when continent = 'AU' then '오세아니아'
        --when continent = 'SA' then '남아메리카'
        --else '기타'
        --when continent = 'AU' then continent --조건의 반환값이 반드시 상수일 필요가 없다.
        --else continent
        --else capital --의미는 다른 항목들과 동일
        --else population --자료형이 다른 항목들과 동일
        else '기타'
    end as continent
from tblCountry;


select
    last || first as name,
    weight,
    case
        when weight > 100 then '과체중'
        when weight > 50 then '정상체중'
        when weight > 0 then '저체중'
    end as state,
    case
        when weight between 50 and 100 then '정상체중'
        else '비정상체중'
    end as state2
from tblComedian;

select
    title,
    case
        when completedate is null then '완료'
        when completedate is not null then '미완료'
    end as state
from tblTodo;


select
    name,
    jikwi,
    case
        when jikwi in ('과장', '부장') then '세단'
        when jikwi in ('대리', '사원') then '경차'
    end as car
from tblInsa;


select
    name,
    buseo,
    jikwi,
    -- 3년 미만: 주니어
    -- 3년 ~ 7년 미만 : 시니어
    -- 7년 이상 : 익스퍼트
    case
        when ibsadate > '2018-05-14' then '주니어'
        when ibsadate <= '2018-05-14' and ibsadate > '2014-05-14' then '시니어'
        when ibsadate <= '2014-05-14' then '익스퍼트'
    end as state
from tblInsa;

















