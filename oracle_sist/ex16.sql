-- ex15_update.sql

/*
 update문
 - DML(select, insert, update, delet)
 - 원하는 행의 원하는 컬럼값을 수정하는 명령어
 - update 테이블명 set 컬렴명 = 수정할값 [, 컬럼명 = 수정할값] X N [where 절]
 - WHERE절************************ 잘못쓰면 데이터 다날라감.


 */

-- select * from TBLCOUNTRY;
-- UPDATE TBLCOUNTRY SET
--                       CAPITAL = '세종시';
-- WHERE

update tblCountry
set capital = '세종시'
where name = '대한민국';

update TBLCOUNTRY
set population = population * 1.1;

update TBLCOUNTRY
set population = population * 1.1
WHERE CONTINENT = 'AS';

UPDATE TBLCOUNTRY
SET CAPITAL    = '제주시',
    AREA       = AREA + 10,
    POPULATION = POPULATION * 1.2
WHERE NAME = '대한민국';


SELECT *
FROM TBLCOUNTRY;
commit;

rollback;