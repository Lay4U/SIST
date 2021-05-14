--1
select * from tblCountry;

--2
select name, capital from tblCountry;

--3

select name as "[국가명]"
from tblCountry;

select * from tblCountry;

select name as "[국가명]", capital as "[수도명]", population as "[인구수]"
, area as "[면적]", continent as "[대륙]"
from tblCountry;

--4
select * from tblCountry;

select '국가명:' || name as "[국가정보]"
from tblCountry;

select '국가명:' || name ||','|| '수도명:' || capital ||','|| '인구수:' || population as "[국가정보]"
from tblCountry;

--5
select * from employees;

select 
First_name ||' '|| Last_name as "[이름]",
email as "[이메일]",
phone_number as "[연락처]",
salary as "[급여]"
from employees;

--6
select * from tblCountry;

select name, area
from tblCountry
where area <=100;

--7
select * from tblCountry;

select name, continent
from tblCountry
where continent in ('AS', 'EU');

--8
select * from employees;

select first_name ||' '|| last_name as "이름", phone_number as "핸드폰번호"
from employees
where job_id='IT_PROG';

--9
select * from employees;

select first_name ||' '|| last_name as "이름", phone_number as "핸드폰번호", hire_date as "고용날짜"
from employees
where last_name='Grant';

--10
select * from employees;


select
first_name ||' '|| last_name as "이름",salary as "급여", phone_number as "핸드폰번호"
from employees
where manager_id='120';

--11
select * from employees;

select first_name ||' '|| last_name as "이름", phone_number as "연락처", email as "이메일", department_id as "부서ID"
from employees
where department_id in (60, 80, 100);


