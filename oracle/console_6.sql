declare
    idx       number := 0;
    initdate  date   := to_date('2020-05-28', 'yyyy-mm-dd');
    startdate date   := to_date('2020-05-28', 'yyyy-mm-dd');
begin
    while idx <= 120
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (1, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    --     update TBLOPENSUBJECT set subjectstart = (select subjectend +1 from tblopensubject where opensubjectseq =4 ), subjectend = startdate
--     where opensubjectseq=5;
    update tblopencourse set coursestart = initdate, courseend = startdate where OPENCOURSESEQ = 16;
    dbms_output.PUT_LINE(startdate);
end;

declare
    idx       number := 0;
    initdate  date   := to_date('2021-07-08', 'yyyy-mm-dd');
    startdate date   := to_date('2021-07-08', 'yyyy-mm-dd');
begin
    while idx <= 120
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (1, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    --     update TBLOPENSUBJECT set subjectstart = (select subjectend +1 from tblopensubject where opensubjectseq =4 ), subjectend = startdate
--     where opensubjectseq=5;
    update tblopencourse set coursestart = initdate, courseend = startdate where OPENCOURSESEQ = 7;
    dbms_output.PUT_LINE(startdate);
end;

declare
    idx       number := 0;
    initdate  date   := to_date('2021-01-05', 'yyyy-mm-dd');
    startdate date   := to_date('2021-01-05', 'yyyy-mm-dd');
begin
    while idx <= 120
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (1, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    --     update TBLOPENSUBJECT set subjectstart = (select subjectend +1 from tblopensubject where opensubjectseq =4 ), subjectend = startdate
--     where opensubjectseq=5;
--     update tblopencourse set coursestart = initdate, courseend = startdate where OPENCOURSESEQ = 1;
    dbms_output.PUT_LINE(startdate);
end;



declare
    idx       number := 0;
    initdate  date   := to_date('2021-01-05', 'yyyy-mm-dd');
    startdate date   := to_date('2021-01-05', 'yyyy-mm-dd');
begin
    while idx <= 120
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (6, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    update TBLOPENSUBJECT
    set subjectstart = (select subjectend + 1 from tblopensubject where opensubjectseq = 4),
        subjectend   = startdate
    where opensubjectseq = 5;
    dbms_output.PUT_LINE(startdate);
end;

select *
from TBLOPENCOURSE;


declare
    idx       number := 0;
    initdate  date   := to_date('2020-05-08', 'yyyy-mm-dd');
    startdate date   := to_date('2020-05-08', 'yyyy-mm-dd');
begin
    while idx <= 120
        loop
            dbms_output.PUT_LINE(mod(to_char(startdate, 'd'), 7) + 1);
            if mod(to_char(startdate, 'd'), 7) + 1 in (1, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;

        end loop;
    startdate := startdate - 1;
    dbms_output.PUT_LINE(startdate);
end;

20/09/05
20/10/25

select to_date('2020-05-08', 'yyyy-mm-dd') + 120
from dual;
select *
from TBLOPENCOURSE;

select *
from TBLOPENSUBJECT;


-- 16번
insert into TBLOPENSUBJECT
values (6, '2020-05-28', to_date('2020-05-28', 'yyyy-mm-dd') + 29, 26, 16);
insert into TBLOPENSUBJECT
values (7, to_date('2020-05-28', 'yyyy-mm-dd') + 30, to_date('2020-05-28', 'yyyy-mm-dd') + 46, 18, 16);
insert into TBLOPENSUBJECT
values (8, to_date('2020-05-28', 'yyyy-mm-dd') + 47, to_date('2020-05-28', 'yyyy-mm-dd') + 62, 53, 16);
insert into TBLOPENSUBJECT
values (9, to_date('2020-05-28', 'yyyy-mm-dd') + 63, to_date('2020-05-28', 'yyyy-mm-dd') + 90, 7, 16);
insert into TBLOPENSUBJECT
values (10, to_date('2020-05-28', 'yyyy-mm-dd') + 91, to_date('2020-05-28', 'yyyy-mm-dd') + 110, 13, 16);
insert into TBLOPENSUBJECT
values (11, to_date('2020-05-28', 'yyyy-mm-dd') + 111, to_date('2020-05-28', 'yyyy-mm-dd') + 115, 16, 16);
insert into TBLOPENSUBJECT
values (12, to_date('2020-05-28', 'yyyy-mm-dd') + 116, to_date('2020-05-28', 'yyyy-mm-dd') + 120, 35, 16);

declare
    idx       number := 0;
    initdate  date   := to_date('2020-05-28', 'yyyy-mm-dd');
    startdate date   := to_date('2020-05-28', 'yyyy-mm-dd');
begin
    while idx <= 29
        loop
            if mod(to_char(startdate, 'd'), 7) + 1 in (1, 7) then --주말
                startdate := startdate + 1;
                continue;
            end if;
            startdate := startdate + 1;
            idx := idx + 1;
        end loop;
    startdate := startdate - 1;
    update TBLOPENSUBJECT
    set subjectstart = initdate,
        subjectend   = startdate
    where opensubjectseq = 6;
end;


set subjectstart = (select subjectend + 1 from tblopensubject where opensubjectseq = 1),



commit;


select *
from tblattend;


declare
    venter        date ;
    vexit         date ;
    vseq          number := 1;
    vclassSeq     number := 1;
    vopencouseseq number;
begin
    while vclassSeq <= 146
        loop
            select OPENCOURSESEQ into vopencouseseq from tblclass where classseq = vclassSeq;
            if vopencouseseq = 1 then
                venter := to_date('2021-01-05:08:35:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-01-05:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif
                vopencouseseq = 2 then
                venter := to_date('2021-02-08:08:35:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-02-08:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif
                vopencouseseq = 3 then
                venter := to_date('2021-03-29:08:35:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-03-29:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif vopencouseseq = 4 then
                venter := to_date('2021-04-12:08:35:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-04-12:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif vopencouseseq = 5 then
                venter := to_date('2021-05-28:08:35:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-05-28:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            end if;


            while venter < sysdate
                loop
                    venter := venter + 1;
                    vexit := vexit + 1;
                    if mod(to_char(venter, 'd'), 7) + 1 in (1, 2) then --주말
                        continue;
                    end if;
                    insert into tblattend values (vseq, venter, vexit, '정상', null, vclassSeq);
                    vseq := vseq + 1;
                    --                     dbms_output.PUT_LINE(venter);
--                     dbms_output.PUT_LINE(vseq);
                end loop;
            vclassSeq := vclassSeq + 1;
        end loop;
end;


-- 날짜 + 일(이걸 분,초로 환산해서)
select '2021-01-05:08:35:00'
from dual;

select todate() + interval '1' minute
from dual;
select current_timestamp + dbms_random.value(40, 59) minute
from dual;

declare
    venter        date ;
    vexit         date ;
    vseq          number := 1;
    vclassSeq     number := 1;
    vopencouseseq number;
begin
    while vclassSeq <= 146
        loop
            select OPENCOURSESEQ into vopencouseseq from tblclass where classseq = vclassSeq;
            if vopencouseseq = 1 then
                venter := to_date('2021-01-05:08:35:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-01-05:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif
                vopencouseseq = 2 then
                venter := to_date('2021-02-08:08:35:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-02-08:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif
                vopencouseseq = 3 then
                venter := to_date('2021-03-29:08:35:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-03-29:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif vopencouseseq = 4 then
                venter := to_date('2021-04-12:08:35:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-04-12:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif vopencouseseq = 5 then
                venter := to_date('2021-05-28:08:35:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-05-28:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            end if;


            while venter < sysdate
                loop
                    venter := venter + 1;
                    vexit := vexit + 1;
--                     dbms_output.PUT_LINE(mod(to_char(venter, 'd'),7)+1);
                    if mod(to_char(venter, 'd'), 7) + 1 in (1, 2) then --주말
                        continue;
                    end if;
                    insert into tblattend values (vseq, venter, vexit, '정상', null, vclassSeq);
                    vseq := vseq + 1;
                    --                     dbms_output.PUT_LINE(venter);
--                     dbms_output.PUT_LINE(vseq);
                end loop;
            vclassSeq := vclassSeq + 1;
        end loop;
end;
-- where rownum <= 6
--   4     and to_char(to_date('01/17/2003', 'mm/dd/yyyy') - rnum, 'dy') not in ('sat','sun')
[2021-06-01 16:40:58] 5 2021-01-05
[2021-06-01 16:40:58] 6
[2021-06-01 16:40:58] 7
[2021-06-01 16:40:58] 1
[2021-06-01 16:40:58] 2
[2021-06-01 16:40:58] 3
[2021-06-01 16:40:58] 4
[2021-06-01 16:40:58] 5
[2021-06-01 16:40:58] 6
select *
from tblattend;
delete
from TBLATTEND;
commit;

drop sequence


declare
    venter        date ;
    vexit         date ;
    vseq          number := 8361;
    vclassSeq     number := 176;
    vopencouseseq number;
begin
    while vclassSeq <= 205
        loop
            select OPENCOURSESEQ into vopencouseseq from tblclass where classseq = vclassSeq;
            if vopencouseseq = 16 then
                venter := to_date('2020-05-27:08:30:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2020-05-27:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            end if;
            while venter < to_date('2020-11-12:08:30:00', 'yyyy-mm-dd:hh24:mi:ss')
                loop
                    venter := venter + 1;
                    vexit := vexit + 1;
                    if mod(to_char(venter, 'd'), 7) + 1 in (1, 2) then --주말
                        continue;
                    end if;
                    insert into tblattend values (vseq, venter, vexit, '정상', null, vclassSeq);

                    vseq := vseq + 1;
                    dbms_output.PUT_LINE(vseq);
                    dbms_output.PUT_LINE(venter);
                end loop;
            vclassSeq := vclassSeq + 1;
        end loop;
end;

-- 2020-05-28 00:00:00,2020-11-12 00:00:00
select *
from tblattend
where CLASSSEQ between 176 and 205;
commit;

select *
from tblclass;

dbms_random.value(40, 59) * INTERVAL '1' MINUTE
-- https://stackoverflow.com/questions/67784622/how-do-i-add-random-times-to-to-date-datatype





-- 1~5번 랜덤
declare
    venter        date ;
    vexit         date ;
    vseq          number := 1;
    vclassSeq     number := 1;
    vopencouseseq number;
    v1            number;
    v2            number;
begin
    while vclassSeq <= 146
        loop
            select OPENCOURSESEQ into vopencouseseq from tblclass where classseq = vclassSeq;
            if vopencouseseq = 1 then
                venter := to_date('2021-01-04:08:46:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-01-04:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif
                vopencouseseq = 2 then
                venter := to_date('2021-02-07:08:46:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-02-07:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif
                vopencouseseq = 3 then
                venter := to_date('2021-03-28:08:46:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-03-28:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif vopencouseseq = 4 then
                venter := to_date('2021-04-11:08:46:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-04-11:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            elsif vopencouseseq = 5 then
                venter := to_date('2021-05-27:08:46:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2021-05-27:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            end if;
            while venter < sysdate
                loop
                    venter := venter + 1;
                    --                     venter := venter - v1;
--                     v1 := dbms_random.value(0, 30) / (24 * 60);
--                     venter := venter + v1;

                    vexit := vexit + 1;
                    --                     vexit := vexit - v2;
--                     v2 := dbms_random.value(0, 20) / (24 * 60);
--                     vexit := vexit + v2;
                    if mod(to_char(venter, 'd'), 7) + 1 in (1, 2) then --주말
                        continue;
                    end if;
                    insert into testattend
                    values (vseq, venter + dbms_random.value(0, 20) / (24 * 60),
                            vexit + dbms_random.value(0, 20) / (24 * 60), '정상', null, vclassSeq);

                    vseq := vseq + 1;
                    --                     dbms_output.PUT_LINE(vseq);
--                     dbms_output.PUT_LINE(venter);
                end loop;
            vclassSeq := vclassSeq + 1;
        end loop;
end;


-- 6번랜덤
declare
    venter        date ;
    vexit         date ;
    vseq          number := 8361;
    vclassSeq     number := 176;
    vopencouseseq number;
begin
    while vclassSeq <= 205
        loop
            select OPENCOURSESEQ into vopencouseseq from tblclass where classseq = vclassSeq;
            if vopencouseseq = 16 then
                venter := to_date('2020-05-27:08:46:00', 'yyyy-mm-dd:hh24:mi:ss');
                vexit := to_date('2020-05-27:17:55:00', 'yyyy-mm-dd:hh24:mi:ss');
            end if;
            while venter < to_date('2020-11-12:08:45:00', 'yyyy-mm-dd:hh24:mi:ss')
                loop
                    venter := venter + 1;
                    vexit := vexit + 1;
                    if mod(to_char(venter, 'd'), 7) + 1 in (1, 2) then --주말
                        continue;
                    end if;
                    insert into testattend
                    values (vseq, venter + dbms_random.value(0, 20) / (24 * 60),
                            vexit + dbms_random.value(0, 20) / (24 * 60), '정상', null, vclassSeq);

                    vseq := vseq + 1;
                    dbms_output.PUT_LINE(vseq);
                    dbms_output.PUT_LINE(venter);
                end loop;
            vclassSeq := vclassSeq + 1;
        end loop;
end;

CREATE TABLE testattend AS
SELECT *
FROM tblattend;
select *
from testattend;
commit;
delete
from testattend;



commit;
select *
from testattend
where substr(to_char(intime), 11, 20);

select substr(to_char(intime, 'yyyy-mm-dd:hh24:mi:ss'), 9, 18)
from testattend
where substr(to_char(intime, 'yyyy-mm-dd:hh24:mi:ss'), 9, 10) > 09;

select *
from TESTATTEND
where to_char(INTIME, 'hh24') = 09
  and to_char(INTIME, 'mi') >= 5;
;
update testattend
set ATTENDANCE = '지각'
where attendSeq in (select ATTENDSEQ from TESTATTEND where to_char(INTIME, 'hh24') = 09 and to_char(INTIME, 'mi') >= 5);

select * from TESTATTEND where to_char(INTIME, 'hh24') = 09 and to_char(INTIME, 'mi') >= 5;

select * from testattend where ATTENDANCE='지각';
commit;

select * from TESTATTEND where to_char(outtime, 'hh24') <= 17 and to_char(outtime, 'mi') <= 55;
select to_char(outtime,'hh24') from testattend;
update testattend
set ATTENDANCE = '정상'
where attendSeq in (select attendSeq from TESTATTEND where to_char(outtime, 'hh24') <= 17 and to_char(outtime, 'mi') <= 55);

commit;






-- declare
--     venter        date ;
--     vexit         date ;
--     vseq          number := 1;
--     vclassSeq     number := 1;
--     vopencouseseq number;
--     v1  number;
--     v2 number;
-- begin
--     while 200번
--     (attenseq = rbms_random(200) sadfas
--            fsdasfasd
--            asdfasdf
--         )
--     -> 지각
--     fdafasdfasf

-- ==사용법
-- FOR 증감변수 IN 초기값..최종값
-- LOOP
-- 처리문;
-- END LOOP;
begin
    for i in 1..50 loop
        update testattend
        set --outtime = outtime -  dbms_random.value(120, 180) / (24 * 60),
            attendance = '기타',
            intime = null,
            outtime = null

        where attendseq = round(dbms_random.value(0,11000) + i);
        dbms_output.PUT_LINE(dbms_random.value(0,11000) + i);
        end loop;
end;
delete from tblattend;
INSERT INTO tblattend SELECT ATTENDSEQ, INTIME, OUTTIME, ATTENDANCE, CLASSSEQ FROM testattend;
INSERT INTO tblattend SELECT CLASSSEQ FROM testattend;
select * from tblattend;
ALTER TABLE tblattend DROP COLUMN CLASSSEQ;
ALTER TABLE tblattend ADD(classseq number);
select * from testattend where CLASSSEQ = null;
alter table tblattend add FOREIGN KEY(classseq) REFERENCES TBLCLASS(CLASSSEQ);
commit;


commit;
rollback;
select * from testattend;


commit;

select * from tblattend where ATTENDANCE='지각';

select * from testattend where ATTENDANCE = '기타';
commit;
select * from TBLGRADE;
declare
    seq number := 100;
begin
    loop
    otubdfds~~~
    end loop;
    seq = seq + 100;
end;



begin
	for i in 1..10 loop
		dbms_output.put_line(i);
	end loop;

