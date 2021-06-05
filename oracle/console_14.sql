--관리자
--A001-------------------------------------------------------------------------------------------

--A002 교사 계정 관리-------------------------------------------------------------------------------------------

--A002-1 [전체 교사 조회]
--    - 교사 고유 번호를 출력한다.
--    - 교사 이름을 출력한다.
--    - 교사 주민번호 뒷자리를 출력한다.
--    - 교사 전화번호를 출력한다.
--    - 교사 강의 가능 과목을 출력한다.


-- 교사 조회
select
    t.teacherseq as "교사번호",
    t.teachername as "이름",
    t.password as "주민번호 뒷자리",
    t.teachertel as "전화번호"
from tblTeacher t;

-- 강의 가능 과목 조회
select
    t.teacherseq as "교사번호",
    t.teachername as "교사명",
    s.subjectseq as "과목번호",
    s.subjectname as "과목명"
from tblTeacher t
    inner join tblavailablesubject a
        on t.teacherseq = a.teacherseq
            inner join tblSubject s
                on a.subjectseq = s.subjectseq
                    order by t.teachername asc, s.subjectseq asc;



-- A002-2 [교사 등록]
--    - 교사 이름을 입력한다.
--    - 교사 주민번호 뒷자리를 입력한다.
--    - 교사 전화번호를 입력한다.
--    - 교사 강의 가능 과목을 입력한다.
select * from tblTeacher;

alter table tblTeacher
    add constraints (status varchar2(50) default '대기'); -- not null이라 default 대기 걸어줌

alter table tblTeacher
    drop constraint TBLTEACHER_NUMBER;

commit;

-- 교사 등록하기
create or replace procedure procRegTeacher(
    pname tblteacher.teachername%type,
    ppassword tblTeacher.password%type,
    ptel tblTeacher.teachertel%type
)
is
begin
    insert into tblTeacher (teacherSeq, teacherName, password, teacherTel) values (seq_tblTeacher.nextVal,pname, ppassword,ptel);
end procRegTeacher;

begin
    procRegTeacher('테스트',1234567,'010-1234-1234');
end;

select * from tblTeacher;

---- 교사의 강의 가능 과목 등록하기 1번에 1개
create or replace procedure procRegTeacherSubject(
    pteacherseq tblTeacher.teacherseq%type,
    psubjectSeq tblAvailableSubject.subjectseq%type
)
is
begin
    insert into tblAvailableSubject (availablesubjectSeq, teacherSeq, subjectSeq) values (seq_tblAvailableSubject.nextVal, pteacherSeq, psubjectSeq);
end procRegTeacherSubject;

begin
    procregteachersubject(23,13);
end;

select * from tblTeacher;
select * from tblSubject;
select * from tblavailablesubject;



-- A002-3 [교사 정보 수정]
--    - 교사 이름을 수정한다.
--    - 교사 주민번호 뒷자리를 수정한다.
--    - 교사 전화번호를 수정한다.
--    - 교사 강의 가능 과목을 수정한다.

-- 교사 정보 수정
create or replace procedure procUpdateTeacher(
    ptseq number,
    pname tblteacher.teachername%type,
    ppassword tblTeacher.password%type,
    ptel tblTeacher.teachertel%type
)
is
begin
    update tblTeacher set teacherName = pname, password = ppassword, teacherTel = ptel where teacherseq = ptseq;
end procUpdateTeacher;


begin
    procUpdateTeacher(23, '수정',7654321,'010-4321-4321');
end;

--강의 가능 과목 수정
update tblAvailableSubject set teacherSeq = 교사번호 , subjectSeq = psSeq where availablesubjectseq = 강의가능과목번호;

update tblAvailableSubject set teacherSeq = 23 , subjectSeq = 13 where availablesubjectseq = 125;




-- A002-4 [교사 삭제]
--   - 교사 목록을 출력한다.
--- 삭제할 교사 번호를 선택한다.
--- 삭제 또는 취소한다.

-- 트리거로 만들자 -> 교사를 삭제하면 before로 강의 가능 목록, 강의 스케쥴에 있는거 대기 교사에게 인수인계하고, 교사 삭제 하도록

create or replace trigger trgDeleteTeacher
    before
    delete on tblTeacher
    for each row
begin
    update tblAvailableSubject set teacherSeq = (select min(teacherSeq) from tblTeacher where status = '대기')  where teacherSeq = :old.teacherSeq;
    update tblclassschedule set teacherSeq = (select min(teacherSeq) from tblTeacher where status = '대기') where teacherSeq = :old.teacherSeq;
end;

-- 교사 삭제
 delete tblTeacher where teacherseq = 교사번호;




-- A002- 5[특정 교사 조회]
--   - 배정된 개설 과정 번호를 출력한다.
--- 과정명을 출력한다.
--- 과정 기간(시작날짜)을 출력한다.
--- 과정 기간(종료날짜)을 출력한다.
--- 배정된 개설 과목 번호를 출력한다.
--- 과목명을 출력한다.
--- 과목 기간(시작날짜)을 출력한다.
--- 과목 기간(종료날짜)을 출력한다.
--- 교재명을 출력한다.
--- 강의실을 출력한다.
--- 강의 진행 여부를 출력한다. --[강의진행여부]는 현재 날짜를 기준으로 확인한다.

select
    o.opencourseseq as "개설 과정 번호",
    c.coursename as "과정명",
    o.coursestart as "과정시작일",
    o.courseend as "과정종료일",
    j.subjectname as "과목명",
    s.subjectstart as "과목시작일",
    s.subjectend as "과목종료일",
    b.bookname as "교재",
    o.classroomseq as "강의실",
    fnsubjectprogress(s.subjectStart, s.subjectEnd) as "강의진행여부"
from tblCourse c
    inner join tblOpenCourse o
        on c.courseSeq = o.courseSeq
            inner join tblOpenSubject s
                on o.opencourseseq = s.opencourseseq
                    inner join tblavailablesubject a
                        on s.availablesubjectseq = a.availablesubjectseq
                            inner join tblSubject j
                                on a.subjectseq = j.subjectseq
                                    inner join tblBook b
                                        on b.bookseq = j.bookseq
where a.teacherSeq = 교사번호
    order by o.coursestart asc, s.subjectstart asc;




create or replace function fnSubjectProgress(
    sStart date,
    sEnd date
) return varchar2
is
begin
      return case
            when sysdate > sEnd then '강의완료'
            when sysdate between sStart and sEnd then '강의중'
            when sysdate < sStart then '강의예정'
     end;
end fnSubjectProgress;


--A003-------------------------------------------------------------------------------------------
-- - 개설 과정 정보의 [조회], [등록], [수정], [삭제]가 가능해야 한다.
--
-- [메인] > [관리자] > [개설 과정 관리] > [전체 개설 과정 조회]
--  -  [개설 과정 등록], [개설 과정 수정], [개설 과정 삭제], [특정 개설 과정 조회] 메뉴를 선택할 수 있어야 한다.

-- 1. [전체 개설 과정 조회]
-- - 개설 과정 번호를 출력한다. ㅇ
-- - 개설 과정 명을 출력한다. ㅇ
-- - 개설 과정기간(시작날짜)을 출력한다. ㅇ
-- - 개설 과정기간(종료날짜)을 출력한다. ㅇ
-- - 강의실명을 출력한다. ㅇ
-- - 교육생 등록 인원을 출력한다. ㅇ
-- - 개설 과목 등록 여부를 출력한다. ㅇ
-- - 과정 상태를 출력한다. (강의 예정, 강의중, 강의종료) ㅇ


select OPENCOURSESEQ                      as 개설과정번호,
       COURSESTATE                        as 과정상태,
       OPENSUBJECTREGISTER                as 개설과목등록여부,
       STUDENTREGISTER                    as 교육생등록인원,
       to_char(COURSESTART, 'yyyy-mm-dd') as 개설과정시작일,
       to_char(COURSEEND, 'yyyy-mm-dd')   as 개설과정종료일,
       COURSENAME                         as 과정명,
       CLASSROOMNAME                      as 강의실명
from TBLOPENCOURSE t1
         inner join TBLCOURSE T on T.COURSESEQ = t1.COURSESEQ
         inner join TBLCLASSROOM T2 on T2.CLASSROOMSEQ = t1.CLASSROOMSEQ;

-- 2. [개설 과정 등록]
--    - 과정 번호를 입력한다.tblopencourse ㅇ
--    - 과정 명을 입력한다. tblcourse
--    - 과정기간(시작날짜)을 입력한다. tblopencourse ㅇ
--    - 과정기간(종료날짜)을 입력한다. tblopencourse ㅇ
--    - 강의실 번호를 입력한다. tblopencourse ㅇ

--    - 교사 번호를 입력한다. *tblteacher 지워주세요....
-- 과정 OK, 과목 OK, 강의가능과목 OK, 교사 OK

insert into TBLOPENCOURSE
values (18, '강의예정', '미등록', 30, '2021-12-15', '2022-06-01', 12, 3);
insert into tblcourse
values (12, 'Java & JavaScript library을 활용한 반응형 웹 개발자 양성과정', 6);
insert into tblopensubject
values (106, '2021-12-15', '2022-06-01', 7, 18);
insert into tblopensubject
values (107, '2021-12-15', '2022-06-01', 18, 18);
insert into tblopensubject
values (108, '2021-12-15', '2022-06-01', 26, 18);
insert into tblopensubject
values (109, '2021-12-15', '2022-06-01', 53, 18);
insert into tblopensubject
values (110, '2021-12-15', '2022-06-01', 46, 18);
insert into tblopensubject
values (111, '2021-12-15', '2022-06-01', 48, 18);

declare
    idx       number := 0;
    initdate  date   := to_date('2021-01-05', 'yyyy-mm-dd');
    startdate date   := to_date('2021-01-05', 'yyyy-mm-dd');
    a         number := 111;
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
    set subjectstart = (select subjectend + 1
                        from tblopensubject
                        where opensubjectseq = a - 1),

        subjectend   = startdate
--         subjectstart = initdate
    where opensubjectseq = a;
--     dbms_output.PUT_LINE(startdate);
end;


-- 7, 18. 26, 53
select *
from tblopensubject
where OPENCOURSESEQ = 18;
rollback;
commit;

select *
from tblopensubject
where OPENCOURSESEQ = 17;
SELECT *
FROM TBLOPENCOURSE;

select *
from TBLAVAILABLESUBJECT;

insert into TBLAVAILABLESUBJECT
values (111, 4, 6);
insert into TBLAVAILABLESUBJECT
values (112, 4, 10);
insert into TBLAVAILABLESUBJECT
values (113, 4, 49);
insert into TBLAVAILABLESUBJECT
values (114, 4, 50);
insert into TBLAVAILABLESUBJECT
values (115, 4, 24);
insert into TBLAVAILABLESUBJECT
values (116, 4, 38);
-- 4번 교사가 18번 과정을 가르친다.


update tblopencourse
set coursestart = ? where ?

select *
from TBLCLASSSCHEDULE;
alter table TBLCLASSSCHEDULE
    add FOREIGN KEY (opensubjectseq) REFERENCES TBLOPENSUBJECT (OPENSUBJECTSEQ);

commit;
-- 3. [개설 과정 수정]
-- - 과정기간(시작날짜)을 수정한다.
-- - 과정기간(종료날짜)을 수정한다.
-- - 과정 명을 수정한다.
-- - 강의실 번호를 수정한다.
-- - 교사 번호를 수정한다.
-- - 현 개설 과정에 등록된 교육생 전체의 수료 날짜도 수정한다.
-- - 개설 과정의 수료 여부를 수정한다.
select *
from tblopencourse
where OPENCOURSESEQ = 18;
update TBLOPENCOURSE
set COURSESTART = '2021-12-16'
where OPENCOURSESEQ = 18;
update TBLOPENCOURSE
set COURSEEND = '2022-12-16'
where OPENCOURSESEQ = 18;
update tblcourse
set coursename = 'Java & JavaScript Language을 활용한 반응형 웹 개발자 양성과정'
where courseseq = 12;
update tblopencourse
set CLASSROOMSEQ = 2
where OPENCOURSESEQ = 18;
update TBLAVAILABLESUBJECT
set TEACHERSEQ = 5,
    SUBJECTSEQ=6
where AVAILABLESUBJECTSEQ = 111;
update TBLAVAILABLESUBJECT
set TEACHERSEQ = 5,
    SUBJECTSEQ=10
where AVAILABLESUBJECTSEQ = 112;
update TBLAVAILABLESUBJECT
set TEACHERSEQ = 5,
    SUBJECTSEQ=49
where AVAILABLESUBJECTSEQ = 113;
update TBLAVAILABLESUBJECT
set TEACHERSEQ = 5,
    SUBJECTSEQ=50
where AVAILABLESUBJECTSEQ = 114;
update TBLAVAILABLESUBJECT
set TEACHERSEQ = 5,
    SUBJECTSEQ=24
where AVAILABLESUBJECTSEQ = 115;
update TBLAVAILABLESUBJECT
set TEACHERSEQ = 5,
    SUBJECTSEQ=38
where AVAILABLESUBJECTSEQ = 116;
select *
from tblopencourse;


update tblstudent
set completionstatus = ? where ?
--  4. [개설 과정 삭제]
--   - 개설 과정 목록을 출력한다.
--   - 삭제할 개설 과정 번호를 선택한다.
--   - 삭제 또는 취소한다.
select *
from TBLOPENCOURSE;
delete
from tblopencourse
where opencourseseq = ?
rollback;

-- [특정 개설 과정 조회]
-- - 개설 과정 번호로 특정 개설과정을 선택하면, 선택한 개설과정의 정보 (과목 또는 교육생)를 조회할 수 있다.

--     5-1. [특정 개설 과정의 과목 조회]
--      - 개설 과목 번호를 출력한다.
--      - 개설 과목 명을 출력한다.
--      - 개설 과목기간(시작날짜)을 출력한다.
--      - 개설 과목기간(종료날짜)을 출력한다.
--      - 교재를 출력한다.
--      - 교사명을 출력한다.
select t.OPENSUBJECTSEQ as 개설과목번호,
       t3.SUBJECTNAME   as 과목명,
       t.SUBJECTSTART   as 과목시작날짜,
       t.SUBJECTEND     as 과목종료날짜,
       t4.BOOKNAME      as 교재,
       t5.TEACHERNAME   as 교사명
from tblopencourse t1
         inner join TBLOPENSUBJECT T on t1.OPENCOURSESEQ = T.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T2 on T2.AVAILABLESUBJECTSEQ = T.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T3 on T3.SUBJECTSEQ = T2.SUBJECTSEQ
         inner join TBLBOOK T4 on T4.BOOKSEQ = T3.BOOKSEQ
         inner join TBLTEACHER T5 on T5.TEACHERSEQ = T2.TEACHERSEQ;



--     5-2. [특정 개설 과정의 전체 교육생 조회]
--    - 수강 번호를 출력한다.
--    - 교육생 번호를 출력한다.
--    - 교육생 이름을 출력한다
--    - 교육생 주민번호 뒷자리를 출력한다.
--    - 교육생 전화번호를 출력한다.
--    - 교육생 등록 날짜를 출력한다.
--    - 교육생 수료 및 중도탈락 여부를 출력한다.
select t2.classseq         as 수강번호,
       t2.CLASSSEQ         as 교육생번호,
       t3.name             as 교육생이름,
       t3.PASSWORD         as 교육생주민번호뒷자리,
       t3.tel              as 전화번호,
       t3.RETDATE          as 교육생등록날짜,
       t3.COMPLETIONSTATUS as 수료여부
from TBLOPENCOURSE t
         inner join TBLCLASS T2 on t.OPENCOURSESEQ = T2.OPENCOURSESEQ
         inner join TBLSTUDENT T3 on T3.STUDENTSEQ = T2.STUDENTSEQ;



--A004 -------------------------------------------------------------------------------------------
-- 개설과목 관리

-- 1. [전체 개설과목 조회]
-- 개설 과정 번호를 출력한다.
-- 개설 과정명을 출력한다.
-- 개설 과정기간(시작날짜)을 출력한다.
-- 개설 과정기간(종료날짜)을 출력한다.
-- 개설 과정 강의실을 출력한다.

-- 개설 과목 번호를 출력한다.
-- 과목명을 출력한다.
-- 교재명를 출력한다.
-- 교사명을 출력한다.
-- 과목기간(시작날짜)을 출력한다.
-- 과목기간(종료날짜)을 출력한다.

-- 1) SELECT문 사용
SELECT DISTINCT
    oc.opencourseseq as 개설과정번호,
    c.courseName as 개설과정명,
    oc.coursestart as 개설과정시작일,
    oc.courseend as 개설과정종료일,
    r.classroomname as 개설과정강의실
FROM tblopensubject OS
    INNER JOIN tblopencourse OC
        ON os.opencourseseq = oc.opencourseseq
            INNER JOIN tblCourse C
                on oc.courseSeq = c.courseSeq
                    INNER JOIN tblClassRoom R
                        on oc.classroomseq = r.classroomseq;

-- 2) VIEW 사용
CREATE OR REPLACE VIEW vwOpenCourseSubject
AS
SELECT DISTINCT
     oc.opencourseseq as 개설과정번호,
    c.courseName as 개설과정명,
    oc.coursestart as 개설과정시작일,
    oc.courseend as 개설과정종료일,
    r.classroomname as 개설과정강의실
FROM tblopensubject OS
    INNER JOIN tblopencourse OC
        ON os.opencourseseq = oc.opencourseseq
            INNER JOIN tblCourse C
                on oc.courseSeq = c.courseSeq
                    INNER JOIN tblClassRoom R
                        on oc.classroomseq = r.classroomseq;


SELECT * FROM vwOpenCourseSubject;


-- 개설과목번호 / 과목명 / 교재명 / 교사명 / 과목시작일 / 과목종료일 을 출력한다.
-- 1) SELECT문 사용
SELECT
    os.availablesubjectseq as 개설과목번호,
    s.subjectname as 과목명,
    b.bookname as 교재명,
    t.teachername as 교사명,
    os.subjectstart as 과목시작일,
    os.subjectend as 과목종료일
FROM tblopensubject OS
    INNER JOIN tblavailablesubject A
        ON os.availablesubjectseq = a.availablesubjectseq
            INNER JOIN tblsubject S
                ON a.subjectseq = s.subjectseq
                    INNER JOIN tblbook B
                        ON s.bookseq = b.bookseq
                            INNER JOIN tblteacher T
                                ON a.teacherseq = t.teacherseq;

-------------------------------------------
-- 2. [개설과목 등록]
-- 과목명을 입력한다.
-- 과목기간(시작날짜)을 입력한다.
-- 과목기간(종료날짜)을 입력한다.
-- 교재명를 입력한다.
-- 교사명을 입력한다.
-- 등록 또는 취소한다.



-- 1) INSERT / DELETE 사용
INSERT INTO tblopensubject
    VALUES (SEQ_TBLOPENSUBJECT.nextVal, 과목시작일, 과목종료일, 강의가능과목번호, 개설된과정번호);

DELETE FROM tblsubject where subjectseq = 과목명 ;
DELETE FROM tblopensubject where subjectstart = 과목시작일 ;
DELETE FROM tblopensubject where subjectend = 과목종료일 ;
DELETE FROM tblbook where bookseq = 교재명 ;
DELETE FROM tblteacher where teacherseq = 교사명 ;


--2) PROCEDURE 사용
CREATE OR REPLACE PROCEDURE procAddOpenSubject
(
	psubjectStart IN date,
    psubjectEnd IN date,
    pavailableSubjectSeq IN number,
    popenCourseSeq IN number
)
IS
BEGIN
    INSERT INTO tblopensubject
    values (SEQ_TBLOPENSUBJECT.nextval, psubjectStart, psubjectEnd, pavailableSubjectSeq, popenCourseSeq);
	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
END;

---------------------------------------------
-- 3. [개설과목 수정]
-- 개설 과목 번호를 선택하여 개설 과목 정보를 수정한다.

-- 과목기간(시작날짜)을 수정한다.
-- 과목기간(종료날짜)을 수정한다.
-- 교재명을 수정한다.
-- 교사명을 수정한다.


-- 1) UPDATE 사용
UPDATE tblopensubject SET subjectstart = 과목시작일 , subjectend = 과목종료일
    WHERE opensubjectseq = 수정할개설과목번호 ;

UPDATE tblbook SET bookname = 교재명
    WHERE bookseq = 수정할교재번호 ;

UPDATE tblteacher SET teachername = 교사명
    WHERE teacherseq = 수정할교사번호;


-- 2) PROCEDURE 사용
CREATE OR REPLACE PROCEDURE procUpdateOpenSubject
(
    pseq IN number,
    psday IN date,
    peday IN date
)
IS
BEGIN
    UPDATE tblopensubject SET subjectstart = psday, subjectend = peday WHERE opensubjectseq = pseq;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
END;

------------------------------------------------------
-- 4. [개설과목 삭제]
-- 삭제할 개설 과목 번호를 선택한다.
-- 삭제 또는 취소한다.

-- 1) DELETE 사용
DELETE FROM tblopensubject
    where opensubjectseq = 삭제할개설과목번호;

-- 2) PROCEDURE 사용
CREATE OR REPLACE PROCEDURE procDeleteopensubject (
	pseq IN NUMBER
)
IS
BEGIN
	DELETE FROM tblopensubject WHERE opensubjectseq = pseq;
	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
END;



--A005 -------------------------------------------------------------------------------------------
-- A-005 교육생 관리


-- 1. [전체 교육생 조회]
--  교육생 번호를 출력한다.
--  교육생 이름을 출력한다.
--  교육생 주민번호 뒷자리를 출력한다.
--  교육생 전화번호를 출력한다.
--  교육생 등록날짜를 출력한다.
--  교육생 수강 횟수를 출력한다.
SELECT studentseq, name, password, tel, retdate, classcount FROM tblStudent;


-- 2. [교육생 등록]
-- 교육생 이름을 입력한다.
-- 교육생 주민번호 뒷자리를 입력한다.
-- 교육생 전화번호를 입력한다.
INSERT INTO tblStudent (name, password, tel) VALUES ('교육생이름', '교육생주민번호뒷자리', '교육생전화번호');


--3. [교육생 정보 수정]
--교육생 이름을 수정한다.
--교육생 주민번호 뒷자리를 수정한다.
--교육생 전화번호를 수정한다.
--교육생 등록날짜를 수정한다.
UPDATE tblstudent SET name = '이름', password = '주민번호뒷자리', tel = '전화번호', retdate = '등록날짜'
where studentSeq = ?;


-- 4. [교육생 삭제]

--교육생 목록을 출력한다.
SELECT * FROM tblStudent;

--삭제할 교육생 번호를 선택한다.
--삭제 또는 취소한다
CREATE OR REPLACE PROCEDURE procStudentDelete (
    pseq IN NUMBER
)
IS
BEGIN
    DELETE FROM tblStudent WHERE studentseq = pseq;
    commit;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END;

-- 5. [특정 교육생 조회]
-- 수강 번호를 출력한다.
-- (수강 신청/수강중/수강 완료) 과정 명을 출력한다.
-- (수강 신청/수강중/수강 완료) 과정 기간 (시작날짜)을 출력한다.
-- (수강 신청/수강중/수강 완료) 과정 기간 (종료날짜)을 출력한다.
-- (수강 신청/수강중/수강 완료) 과정 강의실을 출력한다.
-- 수료 및 중도탈락 여부를 출력한다.
-- 수료 및 중도탈락 날짜를 출력한다.
-- 수강 상태를 출력한다.

SELECT
    cl.classseq AS 수강번호,
    c.coursename AS 과정명,
    o.coursestart AS "과정 기간(시작날짜)",
    o.courseend AS "과정 기간(종료날짜)",
    r.classroomname AS 강의실,
    s.completionStatus AS 수료여부,
    s.completeDate AS 수료날짜,
    s.faildate AS 중도탈락날짜,
    s.status AS 수강상태
FROM tblStudent s
    INNER JOIN tblClass cl
        ON s.studentseq = cl.studentseq
            INNER JOIN tblOpenCourse o
                ON o.opencourseseq = cl.opencourseseq
                    INNER JOIN tblcourse c
                        ON c.courseseq = o.courseseq
                            INNER JOIN tblClassRoom r
                                ON r.classRoomseq = o.classRoomseq
                                    WHERE s.studentseq = ?;


-- 6. [특정 교육생 조회] > [수료 및 중도탈락 정보 수정]

--특정 교육생의 수료 및 중도탈락 여부를 수정한다.
UPDATE tblStudent SET completionStatus = ' ' WHERE studentseq = ' ';

--특정 교육생의 수료 및 중도탈락 날짜를 수정한다.
UPDATE tblStudent SET completedate = ' ' WHERE studentseq = ' ';
UPDATE tblStudent SET faildate = ' ' WHERE studentseq = ' ';


--A006----------------------------------------------------------
-- A-006 특정 개설 과정의 과목 및 교육생 정보 관리

-- 1. [특정 개설 과정의 개설 과목 조회]
-- 개설 과목 번호를 출력한다.
-- 과목 명을 출력한다.
-- 과목기간(시작날짜)을 출력한다.
-- 과목기간(종료날짜)을 출력한다.
-- 교재를 출력한다.

SELECT
    o.opensubjectseq AS 개설과목번호,
    s.subjectname AS 과목명,
    o.subjectstart AS "과목 기간(시작날짜)",
    o.subjectend AS "과목 기간(종료날짜)",
    b.bookname AS 교재명
FROM tblopencourse oc
    INNER JOIN tblopensubject o
        ON oc.opencourseseq = o.opencourseseq
            INNER JOIN tblavailablesubject a
                ON a.availableSubjectSeq = o.availablesubjectseq
                    INNER JOIN tblsubject s
                        ON s.subjectseq = a.subjectseq
                            INNER JOIN tblBook b
                                ON b.bookseq = s.bookseq
                                    WHERE oc.opencourseseq = ?;



-- 2. [특정 개설 과정에 개설 과목 등록]

-- 개설 과정이 지정되지 않은 개설 과목 목록을 출력한다.
SELECT * FROM tblopencourse WHERE opensubjectregister = '미등록';

-- 개설 과목 번호를 여러 개 선택하여 개설 과정에 등록한다.
INSERT INTO tblOpenSubject VALUES (openSubjectSeq, ?, ?, ?, ?);
INSERT INTO tblOpenSubject VALUES (openSubjectSeq, ?, ?, ?, ?);


-- 개설 과목을 등록 또는 취소한다.
INSERT INTO tblopensubject(openSubjectSeq, subjectStart, subjectEnd, availableSubjectSeq, openCourseSeq)
    VALUES (SEQ_TBLOPENSUBJECT.nextval, ' ? ', ' ? ', ' ? ', ' ? ');



-- 3. [특정 개설 과정의 개설 과목 삭제]
-- 삭제할 개설 과목 번호를 선택한다.
-- 삭제 또는 취소한다.
CREATE OR REPLACE PROCEDURE procOpensubjectDelete(
    pseq IN NUMBER
)
IS
BEGIN
    DELETE FROM tblOpensubject WHERE opensubjectseq = pseq;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END;


-- 4. [특정 개설 과정의 교육생 조회]
-- 수강 번호를 출력한다.
-- 교육생 이름을 출력한다.
-- 교육생 주민번호 뒷자리를 출력한다.
-- 교육생 전화번호를 출력한다.
-- 교육생 등록날짜를 출력한다.
-- 교육생 수료 및 중도탈락 여부를 출력한다.

SELECT
    c.classseq AS 수강번호,
    s.name AS 이름,
    s.password AS 주민번호뒷자리,
    s.tel AS 전화번호,
    s.retdate AS 등록날짜,
    s.completionstatus AS 수료여부
FROM tblStudent s
    INNER JOIN tblclass c
        ON s.studentseq = c.studentseq
            INNER JOIN tblopencourse o
                ON o.opencourseseq = c.opencourseseq
                    WHERE o.opencourseseq = ?;



-- 5. [특정 개설 과정에 교육생 등록]

-- 현재 수강 중이지 않은 교육생 목록을 출력한다. //수강신청 수강중 수강완료
SELECT * FROM tblstudent WHERE status = '수강신청';

-- 교육생 번호를 여러 개 선택하여 개설 과정에 등록한다.
-- 등록 또는 취소한다.
INSERT INTO tblclass VALUES ( SEQ_TBLCLASS.nextval, ?, ?);
INSERT INTO tblclass VALUES ( SEQ_TBLCLASS.nextval, ?, ?);


-- 6. [특정 개설 과정의 교육생 삭제]
-- 삭제할 수강 번호를 선택한다.
-- 삭제 또는 취소한다.
DELETE FROM tblclass WHERE classseq = ?;




--A007-------------------------------------------------------------------------------------------
-- 시험 및 성적 관리
-- 시험 및 성적 관리할 개설 과목 목록 조회
-- 시험관리에 관한 모든 기능을 포함한다.
-- [메인]  >  [관리자]  > [시험 및 성적 관리] >  [전체 과정 조회]
--
-- - 개설 과정 번호를 출력한다.
-- - 과정 명을 출력한다.
-- - 과정 시작 날짜를 출력한다.
-- - 과정 종료 날짜를 출력한다.
-- - 강의실명을 출력한다.
-- - 등록 인원을 출력한다.
-- - 개설 과목 등록 여부를 출력한다.
-- - 개설 상태를 출력한다.
create or replace view vwListAllOpenCourse
as
select
   c.OPENCOURSESEQ as 개설과정번호,
   t.COURSENAME as 과정명,
   to_char(c.COURSESTART, 'yyyy-mm-dd') as 과정시작날짜,
   to_char(c.COURSEEND, 'yyyy-mm-dd') as 과정종료날짜,
   cr.CLASSROOMNAME as 강의실명,
   c.STUDENTREGISTER as 등록인원,
   c.OPENSUBJECTREGISTER as 개설과목등록여부,
   c.COURSESTATE as 개설상태
from TBLOPENCOURSE c
    inner join TBLCLASSROOM cr
        on c.OPENCOURSESEQ = cr.CLASSROOMSEQ
            inner join TBLCOURSE T on c.COURSESEQ = T.COURSESEQ
                order by c.opencourseseq;


-- 1. [특정 개설 과정의 과목 조회]
-- - 개설 과목 번호를 출력한다.
-- - 과목 명을 출력한다.
-- - 과목 시작 날짜를 출력한다.
-- - 과목 종료 날짜를 출력한다.
-- - 교재를 출력한다.
-- - 성적 등록 여부를 출력한다.
-- - 시험 문제 파일 등록 여부를 출력한다.
create or replace procedure procListOpenCourseSubject(
    pseq in number,
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
    select
    os.OPENSUBJECTSEQ as 개설과목번호,
    s.SUBJECTNAME as 과목명,
    TO_char(os.SUBJECTSTART,'yyyy-mm-dd') as 과목시작날짜,
    to_char(os.SUBJECTEND, 'yyyy-mm-dd') as 과목종료날짜,
    b.BOOKNAME as 교재명,
    e.GRADEENTER as 성적등록여부,
    e.EXAMFILE as 시험문제파일등록여부
from TBLOPENSUBJECT os
    inner join TBLAVAILABLESUBJECT avs on os.AVAILABLESUBJECTSEQ = avs.AVAILABLESUBJECTSEQ
            inner join TBLSUBJECT s on s.SUBJECTSEQ = avs.SUBJECTSEQ
                inner join TBLEXAM e on e.OPENSUBJECTSEQ = os.AVAILABLESUBJECTSEQ
                    inner join tblbook b on s.BOOKSEQ = b.BOOKSEQ
                        inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = os.OPENCOURSESEQ
                        where t.OPENCOURSESEQ = pseq
                        order by os.OPENSUBJECTSEQ;
end;


--
-- 2. [성적정보 출력]
-- 1) 개설 과목별 출력
-- 개설 과정명을 출력한다.
-- 개설 과정기간을 출력한다.
-- 강의실명을 출력한다.
-- 개설 과목명을 출력한다.
-- 교사명을 출력한다.
-- 교재명을 출력한다.

create or replace procedure procList(
    pseq in number,
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
select
    s.SUBJECTNAME as 개설과목명,
    c.COURSENAME as 개설과정명,
    c.COURSETERM as 개설과정기간,
    cr.CLASSROOMNAME as 강의실명,
    t.TEACHERNAME as 교사명,
    b.BOOKNAME as 교재명
from TBLOPENSUBJECT os
    inner join TBLAVAILABLESUBJECT avs on os.AVAILABLESUBJECTSEQ = avs.AVAILABLESUBJECTSEQ
    inner join TBLSUBJECT s on avs.SUBJECTSEQ = s.SUBJECTSEQ
    inner join TBLBOOK b on s.BOOKSEQ = b.BOOKSEQ
    inner join TBLTEACHER t on avs.TEACHERSEQ = t.TEACHERSEQ
    inner join TBLOPENCOURSE oc on os.OPENCOURSESEQ = oc.OPENCOURSESEQ
    inner join TBLCOURSE c on oc.COURSESEQ = c.COURSESEQ
    inner join TBLCLASSROOM cr on oc.CLASSROOMSEQ = cr.CLASSROOMSEQ
        where os.OPENSUBJECTSEQ = pseq
order by s.SUBJECTNAME;

end;




-- ‘성적관리’테이블에서
-- 교육생 이름을 출력한다.
-- 주민번호 뒷자리를 출력한다.
-- 필기 점수를 출력한다.
-- 실기 점수를 출력한다.
create or replace view vwGradeManage
as
select
    st.NAME as 교육생이름,
    st.PASSWORD as 주민번호뒷자리,
    g.WRITEGRADE as 필기점수,
    g.PERFORMGRADE as 실기점수
from TBLGRADE g
    inner join TBLCLASS c on g.CLASSSEQ = c.CLASSSEQ
    inner join TBLSTUDENT st on c.STUDENTSEQ = st.STUDENTSEQ;






--2) 교육생 개인별 출력
-- 교육생 이름을 출력한다.
-- 주민번호 뒷자리를 출력한다.
-- 개설 과정명을 출력한다.
-- 개설 과정기간을 출력한다.
-- 강의실명을 출력한다.

create or replace procedure procOneStudentList(
    pseq number,
    pcursor out sys_refcursor
)
is
    begin
        open pcursor for
select
    st.NAME as 교육생이름,
    st.PASSWORD as 주민번호뒷자리,
    c.COURSENAME as 개설과정명,
    c.COURSETERM as 개설과정기간,
    cr.CLASSROOMNAME as 강의실명
from TBLCLASS c
    inner join TBLOPENCOURSE oc on c.OPENCOURSESEQ = oc.OPENCOURSESEQ
    inner join TBLSTUDENT st on c.STUDENTSEQ = st.STUDENTSEQ
    inner join TBLCLASSROOM cr on oc.CLASSROOMSEQ = cr.CLASSROOMSEQ
    inner join TBLCOURSE c on oc.COURSESEQ = c.COURSESEQ
        where st.STUDENTSEQ = pseq;
end procOneStudentList;




-- 교육생 개인이 수강한 모든 개설 과목에 대한 성적 정보를 출력한다. -> ‘교육생 테이블’
-- 개설 과목명을 출력한다
-- 개설 과목 기간을 출력한다
-- 교사명을 출력한다
-- 출결 점수를 출력한다.
-- 필기 점수를 출력한다
-- 실기 점수를 출력한다.
create or replace procedure procStudentOpenSubjectGrade(
    pseq number,
    pcursor sys_refcursor
)
is
begin
    open pcursor for
select
    s.SUBJECTNAME as 개설과목명,
    s.PERIOD as 개설과목기간,
    t.TEACHERNAME as 교사명,
    g.ATTENDGRADE as 출결점수,
    g.WRITEGRADE as 필기점수,
    g.PERFORMGRADE as 실기점수
from TBLOPENSUBJECT os
    inner join TBLAVAILABLESUBJECT avs on os.AVAILABLESUBJECTSEQ = avs.AVAILABLESUBJECTSEQ
    inner join TBLTEACHER t on avs.TEACHERSEQ = t.TEACHERSEQ
    inner join TBLEXAM e on e.OPENSUBJECTSEQ = os.OPENSUBJECTSEQ
    inner join TBLGRADE g on g.EXAMSEQ = e.EXAMSEQ
    inner join TBLSUBJECT s on avs.SUBJECTSEQ = s.SUBJECTSEQ
    inner join TBLCLASS T2 on g.CLASSSEQ = T2.CLASSSEQ
        where t2.STUDENTSEQ = pseq; -- 특정 교육생 번호 입력
end;









--A008
-------------------------------------------------------------------------------------------
-- 1-1. [특정 개설 과정의 교육생 출결 조회]
-- 교육생 번호를 출력한다.
-- 교육생 이름을 출력한다.
-- 출결번호를 출력한다.
-- 입실 시간을 출력한다.
-- 퇴실 시간을 출력한다.
-- 출결 상황을 출력한다.

--1) SELECT 사용
SELECT
    s.studentseq as 교육생번호,
    s.name as 교육생이름,
    a.attendseq as 출결번호,
    a.intime as 입실시간,
    a.outtime as 퇴실시간,
    a.attendance as 출결상황
FROM tblclass C
    INNER JOIN tblstudent S
        ON c.studentseq = s.studentseq
            INNER JOIN tblattend A
                ON c.classseq = a.classseq
                    INNER JOIN tblopencourse oc
                        ON c.opencourseseq = oc.opencourseseq
                            WHERE oc.opencourseseq = 특정개설과정번호 ;


-- 2) VIEW 사용
CREATE OR REPLACE VIEW vwAttend
AS
SELECT DISTINCT
    s.studentseq as 교육생번호,
    s.name as 교육생이름,
    a.attendseq as 출결번호,
    a.intime as 입실시간,
    a.outtime as 퇴실시간,
    a.attendance as 출결상황
FROM tblclass C
    INNER JOIN tblstudent S
        ON c.studentseq = s.studentseq
            INNER JOIN tblattend A
                ON c.classseq = a.classseq
                    INNER JOIN tblopencourse oc
                        ON c.opencourseseq = oc.opencourseseq
                            WHERE oc.opencourseseq = 특정개설과정번호 ;


SELECT * FROM vwAttend;

-------------------------------------------------------------------------------------------
-- 1-2. [특정 교육생 선택] > [기간 검색] > [출결 관리]
-- 출결번호를 출력한다.
-- 교육생 번호를 출력한다.
-- 출결 날짜 및 시각을 출력한다.
-- 출결 번호를 선택한다.
-- 입실 시간, 퇴실 시간, 출결 상황을 수정/삭제한다.

-- 1) SELECT / UPDATE / DELETE 사용
SELECT
    a.attendseq as 출결번호,
    c.studentseq as 교육생번호,
    to_char(a.intime,'yyyy-mm-dd hh24:mi:ss') as 출결날짜및시각,
    a.attendance as 출결상황
FROM tblclass C
    INNER JOIN tblattend A
        ON c.classSeq = a.classSeq
            WHERE c.studentseq = 특정교육생번호  AND a.intime BETWEEN 원하는기간 AND 원하는기간 ;


UPDATE tblattend SET intime = 입실시간, outtime = 퇴실시간, attendance= 출결상황 WHERE attendseq = 출결번호 ;


DELETE FROM tblattend where attendseq = 출결번호;


-- 2) PROCEDURE 사용
CREATE OR REPLACE PROCEDURE procUpdateAttend(
    pSeq IN number,
    pInTime IN date,
    pOutTime IN date,
    pAttendance IN varchar2
)
IS
BEGIN
    UPDATE tblAttend SET inTime = pInTime, outTime = pOutTime, attendance = pAttendance WHERE attendSeq = pseq;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
END;


CREATE OR REPLACE PROCEDURE procDeleteAttend(
	pseq IN NUMBER
)
IS
BEGIN
	DELETE FROM tblAttend WHERE attendseq = pseq;
	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
END;

--A009
-- 취업관리
-------------------------------------------------------------------------------------------
-- 1 [취업 현황 관리]
-- 1-1 [취업 현황 조회]
-- 교육생이름을 출력한다.
-- 수료날짜를 출력한다.
-- 교육생번호을 출력한다.
-- 과정번호를 출력한다.
-- 취업관리번호를 출력한다.
-- 회사번호을 출력한다.
-- 취업여부를 출력한다.

-- 1) SELECT 사용
SELECT
    s.name AS 교육생이름,
    s.completedate AS 수료날짜,
    c.opencourseseq AS 과정번호,
    e.empmangseq AS 취업관리번호,
    e.companyseq AS 회사번호,
    e.state AS 취업여부
FROM tblstudent S
    INNER JOIN tblclass C
        ON s.studentseq = c.studentseq
            INNER JOIN tblempstat E
                ON c.classseq = e.classseq;

-------------------------------------------------------------------------------------------
-- 1-2 [취업 현황 등록]
-- 수강번호를 입력한다.
-- 취업관리번호를 입력한다.
-- 회사번호을 입력한다.
-- 취업여부를 입력한다.

-- 1) INSERT 사용
INSERT INTO tblempstat
    VALUES (seq_tblempstat.nextVal, 수강번호, 회사번호, 취업여부);


--2) PROCEDURE 사용
CREATE OR REPLACE PROCEDURE procAddEmpStat(
	pClassSeq IN number,
    pState IN varchar2,
    pCompanySeq number
)
IS
BEGIN
    INSERT INTO tblempstat
    VALUES (seq_empstat.nextVal, pClassSeq, pCompanySeq, pState);
	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
END;

-------------------------------------------------------------------------------------------
-- 1-3 [취업 현황 수정]
-- 수강번호를 수정한다.
-- 취업관리번호를 수정한다.
-- 회사번호을 수정한다.
-- 취업여부를 수정한다.

-- 1) UPDATE 사용
UPDATE tblempstat SET classseq = 수강번호 , empmangseq = 취업관리번호, companyseq = 회사번호, state = 취업여부
    WHERE empmangseq = 수정할취업관리번호 ;

-- 2) PEOCEDURE 사용
CREATE OR REPLACE PROCEDURE procUpdateEmpstat(
    pEmpMangSeq IN number,
    pclassSeq IN number,
    pstate IN varchar2,
    pcompanySeq IN number
)
IS
BEGIN
    UPDATE tblempstat SET classseq = pclassSeq , empmangseq = pEmpMangSeq, companyseq = pcompanySeq, state = pstate
    WHERE empmangseq =  pEmpMangSeq;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
    ROLLBACK;
END;

-------------------------------------------------------------------------------------------
-- 1-4 [취업 현황 삭제]
-- 수강번호를 삭제한다.
-- 취업관리번호를 삭제한다.
-- 회사번호을 삭제한다.
-- 취업여부를 삭제한다.

-- 1) DELETE 사용
DELETE FROM tblempstat
    where empmangseq = 삭제할취업관리번호;

-- 2) PROCEDURE 사용
CREATE OR REPLACE PROCEDURE procDeleteEmpStat(
	pseq IN NUMBER
)
IS
BEGIN
	DELETE FROM tblempstat WHERE empmangseq = pseq;
	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
END;

-- A - 009 -2 [취업처 관리]
--   A - 009 2-1 [취업처 조회]
--회사번호을 출력한다.
--회사명을 출력한다.
--연봉을 출력한다.
--규모를 출력한다.
--근무지역을 출력한다.
--근무형태를 출력한다.

select
    companyseq as "회사번호",
    companyname as "회사명",
    companyAnnualSalary as "연봉",
    companyscale as "규모",
    companyarea as "근무지역",
    workingtype as "근무형태"
from tblCompany;

alter table tblCompany
    rename column conpanyAnnualSalary to companyAnnualSalary;
commit;

select * from tblCompany;




--  A - 009  2-2 [취업처 등록]
--회사번호을 입력한다.
--회사명을 입력한다.
--연봉을 입력한다.
--규모를 입력한다.
--근무지역을 입력한다.
--근무형태를 입력한다.
insert into tblCompany (companyseq, companyname, companyAnnualSalary, companyscale, companyarea, workingtype ) values ( seq_tblCompany.nextVal, ?, ?, ?, ?, ? );




--  A - 009  2-3 [취업처 수정]
--수정할 회사번호를 지정한다.
--회사명을 수정한다.
--연봉을 수정한다.
--규모를 수정한다.
--근무지역을 수정한다.
--근무형태를 수정한다.
update tblCompany set companyname = ?, companyAnnualSalary = ?, companyScale = ? , companyarea = ?, workingtype = ? where companySeq = ?;




--  A - 009  2-4 [취업처 삭제]
--회사번호를 지정해서 삭제한다.

delete tblCompany where companySeq = ?;

------------------------------------------------------------------------

