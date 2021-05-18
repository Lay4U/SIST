select last || first as name, weight from tblComedian
where weight >= 60 and weight <= 70;

select last || first as name, weight from tblComedian
where weight between 60 and 70;

select * from employees;

select first_name from employees where first_name between 'M' and 'O';

select ibsadate from tblInsa where ibsadate > '2010-01-01';

select ibsadate from tblInsa where ibsadate >= '2010-01-01' and ibsadate <= '2010-12-31';

select ibsadate from tblInsa where ibsadate between '2010-01-01' and '2010-12-31';

select * from tblInsa where buseo = '홍보부' or buseo = '개발부' or buseo = '총무부';

select * from tblInsa where buseo in ('홍보부', '개발부', '총무부');

select * from tblInsa where jikwi in ('부장', '과장') and city in ('서울', '인천')
    and basicpay between 2500000 and 2600000;

select * from tblInsa where name like '홍__';
select * from tblInsa where name like '__신';
select * from tblInsa where name like '_길_';
select * from tblInsa where name like '__';
select * from tblInsa where name like '____';

select first_name from employees where first_name like 'E%'; -- E로시작하는 모든~
select first_name from employees where first_name like '%e'; -- e로끝나는 모든~
select first_name from employees where first_name like '%e%'; -- e가 포함되는경우
select first_name from employees where first_name like '%ea%'; -- ea가 포함되는 경우
select first_name from employees where first_name like '%e%a%'; -- e,a가 포함되는 경우

select * from tblCountry where population is null;
select * from tblCountry where population is null;

select * from tblTodo;

select * from tblTodo where completedate is null;

select * from 도서대여;

select last || first as name,
 gender
from tblComedian;

select last || first as name,
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
--        when continent = 'AU' then '오세아니아'
--        when continent = 'SA' then '남아메리카'
        else '기타'
    end as continent
from tblCOuntry;