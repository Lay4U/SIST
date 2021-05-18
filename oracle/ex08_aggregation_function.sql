-- ex08_aggregation_function.sql

/*

집계 함수, Aggregation Function
1. count()
2. sum()
3. avg()
4. max()
5. min()


1. count()
- 결과셋의 레코드 갯수를 반환
- number count(컬럼명)
- null은 카운트에서 제외한다.(*******)

*/

select name from tblCountry;
select count(name) from tblCountry; --14


select count(name) --3. 33
from tblInsa --1. 60
where city in ('서울', '경기'); --2. 33


select area from tblCountry;
select count(area) from tblCountry;


select population from tblCountry;
select count(population) from tblCountry; --13


-- ORA-00937: not a single-group group function
-- 컬럼 리스트에 집계 함수와 단일 컴럼은 동시에 사용할 수 없다.
select count(name), name from tblCountry;

select count(name) from tblCountry;
select name from tblCountry;



select count(name), count(area) from tblCountry;

select count(name, area) from tblCountry;

-- 살짝 고민?
-- tblCountry의 나라 갯수?
select count(name) from tblCountry;
select count(capital) from tblCountry;
select count(area) from tblCountry;
select count(population) from tblCountry;

select count(*) from tblCountry; --무조건 모든 레코드 갯수가 반환된다.


select * from tblCountry;



select * from tblTodo;

-- 아직 안한 일의 갯수? 8개
select count(*) from tblTodo where completedate is null;

-- 한 일의 갯수? 12개
select count(*) from tblTodo where completedate is not null;

-- 안한 일의 갯수, 한 일의 갯수 -> 하나의 결과셋으로 
select 
    count(*) as "전체 할일 갯수",
    count(completedate) as "한 일의 갯수",
    count(*) - count(completedate) as "아직 안한 일의 갯수"
from tblTodo;


select
    count(*) as "총 직원수", --60
    count(tel) as "연락처가 있는 직원수", --57
    count(*) - count(tel) as "연락처가 없는 직원수"--3
from tblInsa;



-- tblInsa -> buseo컬럼 -> 어떤 부서들이 있나요?
-- tblInsa -> buseo컬럼 -> 부서가 몇개인가요?

select count(distinct buseo) from tblInsa;


--tblComedian 남자 몇명?, 여자 몇명?
select * from tblComedian;

select count(*) from tblComedian where gender = 'm';
select count(*) from tblComedian where gender = 'f';

-- 전체 인원수, 남자 인원수, 여자 인원수 -> 결과 셋
-- count() + case end + null 존재

select
    count(case
        when gender = 'm' then '남자'
    end),
    count(case
        when gender = 'f' then '남자'
    end)
from tblComedian; 


select
    count(*) as "전체 인원수",
    count(case
        when gender = 'm' then 1
    end) as "남자 인원수",
    count(case
        when gender = 'f' then 1
    end) as "여자 인원수"
from tblComedian; 



select avg(basicpay) from tblInsa; --1556526

-- 평균 급여보다 많이 받는 직원들 명단을 가져오시오.
-- ORA-00934: group function is not allowed here ******
-- where절에는 집계 함수를 사용할 수 없다. > where절은 개인에 대한 조건절(집합 정보를 가져올 수 없다.)
select * from tblInsa where basicpay > avg(basicpay); --27


-- tblCountry. 
-- 아시아(AS)와 유럽(EU)에 속한 나라의 개수?? -> 7개
select count(*) from tblCountry where continent in ('AS', 'EU');

-- 인구수가 7000 ~ 20000 사이인 나라의 개수?? -> 2개
select count(*) from tblCountry where population between 7000 and 20000;

-- hr.employees
-- job_id > 'IT_PROG' 중에서 급여가 5000불이 넘는 직원이 몇명? -> 2명
select count(*) from hr.employees where job_id = 'IT_PROG' and salary >= 5000;

-- tblInsa
-- tel. 010을 안쓰는 사람은 몇명?(연락처가 없는 사람은 제외) -> 42명
select count(*) from tblinsa where not tel like '010%' and tel is not null;

-- city. 서울, 경기, 인천 -> 그 외의 지역 인원수? -> 18명
select count(*) from tblinsa where city not in ('서울', '경기', '인천');
    
-- 80년대생 + 여자 직원 총 몇명? -> 9명
select count(*) from tblinsa where ssn like '8%-2%';



/*

2. sum()
- number sum(컬럼명)
- 해당 컬럼값들의 합을 구한다.
- 숫자형만 대상(문자형X, 날짜형X)

*/
select weight from tblComedian;
select sum(weight) from tblComedian;

select sum(first) from tblComedian; --ORA-01722: invalid number


select
    sum(basicpay), sum(sudang),
    sum(basicpay) + sum(sudang),
    sum(basicpay + sudang)
from tblInsa;


/*
3. avg()
- number avg(컬럼명)
- 해당 컬럼값들의 평균값을 반환한다.
- 숫자형만 가능하다.
- 해당 컬럼이 null을 가진 항목은 제외한다.
*/

select
    sum(basicpay), count(*), 
    sum(basicpay) / count(*), --평균
    avg(basicpay) --평균
from tblInsa;

-- 평균 인구수? 14475, 15588
-- 
select
    sum(population) / count(*),
    sum(population) / count(population),
    avg(population),
    count(*), --14
    count(population) --13
from tblCountry;



-- 회사 성과급 지급
-- : 10명 팀원 -> 7명 참여 프로젝트 수익 발생, 3명 관련 없음
-- 1. 균등 지급 -> 수익 / 모든 팀원수 = sum() / count(*)
-- 2. 차등 지급 -> 수익 / 참여 팀원수 = sum() / count(참여팀원) = avg()


/*
4. max()
- object max(컬럼명) : 최댓값 반환
- 숫자형, 문자형, 날짜형

5. min()
- object min(컬럼명) : 최솟값 반환
- 숫자형, 문자형, 날짜형

*/

select max(basicpay), min(basicpay) from tblInsa;
select max(name), min(name) from tblInsa;
select max(ibsadate), min(ibsadate) from tblInsa;


/*

sum()
1. 유럽과 아프리카에 속한 나라의 인구 수 합? tblCountry > 14,198
2. 매니저(108)이 관리하고 있는 직원들의 급여 총합? hr.employees > 39,600
3. 직업(ST_CLERK, SH_CLERK)을 가지는 직원들의 급여 합? hr.employees > 120,000
4. 서울에 있는 직원들의 급여 합(급여 + 수당)? tblInsa > 33,812,400
5. 장급(부장+과장)들의 급여 합? tblInsa > 36,289,000

avg()
1. 아시아에 속한 국가의 평균 인구수? tblCountry > 39,165
2. 이름(first_name)에 'AN'이 포함된 직원들의 평균 급여?(대소문자 구분없이) hr.employees > 6,270.4
3. 장급(부장+과장)의 평균 급여? tblInsa > 2,419,266.66
4. 사원급(대리+사원)의 평균 급여? tblInsa > 1,268,946.66
5. 장급(부장,과장)의 평균 급여와 사원급(대리,사원)의 평균 급여의 차액? tblInsa > 1,150,320

max(),min()
1. 면적이 가장 넓은 나라의 면적은? tblCountry > 959
2. 급여(급여+수당)가 가장 적은 직원은 총 얼마를 받고 있는가? tblInsa > 988,000

*/



--1. 유럽과 아프리카에 속한 나라의 인구 수 합? tblCountry
select sum(population)
from tblcountry
where continent in ('EU', 'AF');

--2. 매니저(108)이 관리하고 있는 직원들의 급여 총합? hr.employees
select sum(salary) from hr.employees
where manager_id = 108;

--3. 직업(ST_CLERK, SH_CLERK)을 가지는 직원들의 급여 합? hr.employees
select sum(salary) from hr.employees
where job_id in ('ST_CLERK', 'SH_CLERK');

--4. 서울에 있는 직원들의 급여 합(급여 + 수당)? tblInsa
select sum(basicpay + sudang) from tblinsa
where city = '서울';

-- 5. 장급(부장+과장)들의 급여 합? tblInsa
select sum(basicpay) from tblinsa
where jikwi in ('부장', '과장');


-- 1. 아시아에 속한 국가의 평균 인구수? tblCountry
select avg(population) from tblcountry
where continent = 'AS';


--2. 이름(first_name)에 'AN'이 포함된 직원들의 평균 급여?(대소문자 구분없이) hr.employees
select avg(salary) from hr.employees
where first_name like '%AN%' or first_name like '%An%' or first_name like '%aN%' or first_name like '%an%';

-- 3. 장급(부장+과장)의 평균 급여? tblInsa
select avg(basicpay) from tblinsa
where jikwi in ('부장', '과장');

-- 4. 사원급(대리+사원)의 평균 급여? tblInsa
select avg(basicpay) from tblinsa
where jikwi in ('대리', '사원');

-- 5. 장급(부장,과장)의 평균 급여와 사원급(대리,사원)의 평균 급여의 차액? tblInsa
select
	avg(case
		when jikwi in ('부장', '과장') then basicpay
	end)
	-
	avg(case
		when jikwi in ('대리', '사원') then basicpay
	end)
from tblinsa


--1. 면적이 가장 넓은 나라의 면적은? tblCountry
select max(area) from tblcountry;

--2. 급여(급여+수당)가 가장 적은 직원은 총 얼마를 받고 있는가? tblInsa
select min(basicpay + sudang) from tblinsa;















