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
29, 46, 62, 90,
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
7, 18. 26, 53
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

select *
from tblsubject;
6, Java OpenJDK Programming, 29
10,오라클을 사용한 RDBMS의 SQL과 PL/
SQL, 17
49,Front-end 클라이언트 화면설계 및 구현, 16
50,Back-end 서버프로그래밍 설계 및 구현, 28


select *
from TBLOPENCOURSE;

update tblopencourse
set coursestart

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
set completedate = ?
where (
          select opencourseSeq
          from TBLSTUDENT
          where tblsutdent.opencourseSeq = tblstudent.opencourseSeq)
update tblstudent
set completionstatus = ?
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

--4번 교사를 5번 교사로 변경
-- update TBLAVAILABLESUBJECT set AVAILABLESUBJECTSEQ = 111, TEACHERSEQ = 4, SUBJECTSEQ=6 where AVAILABLESUBJECTSEQ = 111;
-- update TBLAVAILABLESUBJECT set AVAILABLESUBJECTSEQ = 112, TEACHERSEQ = 4, SUBJECTSEQ=10 where AVAILABLESUBJECTSEQ = 112;
-- update TBLAVAILABLESUBJECT set AVAILABLESUBJECTSEQ = 113, TEACHERSEQ = 4, SUBJECTSEQ=49 where AVAILABLESUBJECTSEQ = 113;
-- update TBLAVAILABLESUBJECT set AVAILABLESUBJECTSEQ = 114, TEACHERSEQ = 4, SUBJECTSEQ=50 where AVAILABLESUBJECTSEQ = 114;
-- update TBLAVAILABLESUBJECT set AVAILABLESUBJECTSEQ = 115, TEACHERSEQ = 4, SUBJECTSEQ=24 where AVAILABLESUBJECTSEQ = 115;
-- update TBLAVAILABLESUBJECT set AVAILABLESUBJECTSEQ = 116, TEACHERSEQ = 4, SUBJECTSEQ=38 where AVAILABLESUBJECTSEQ = 116;
-- update TBLAVAILABLESUBJECT set (AVAILABLESUBJECTSEQ, TEACHERSEQ, SUBJECTSEQ) = (111, 4, 6) where AVAILABLESUBJECTSEQ = 111;
-- update TBLAVAILABLESUBJECT set (AVAILABLESUBJECTSEQ, TEACHERSEQ, SUBJECTSEQ) = (112, 4, 49);
-- update TBLAVAILABLESUBJECT set (AVAILABLESUBJECTSEQ, TEACHERSEQ, SUBJECTSEQ) = (113, 4, 50);
-- update TBLAVAILABLESUBJECT set (AVAILABLESUBJECTSEQ, TEACHERSEQ, SUBJECTSEQ) = (114, 4, 24);
-- update TBLAVAILABLESUBJECT set (AVAILABLESUBJECTSEQ, TEACHERSEQ, SUBJECTSEQ) = (115, 4, 38);
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

commit;

-- - 성적을 조회 할 수 있다.
--
-- [메인] > [교육생] > [성적 조회]
-- [수강 과정 조회], [수강 과정 성적 정보 조회] 메뉴를 선택 할 수 있어야 한다.
--
-- [수강 과정 성적 정보 조회]
-- - 개설 과정 번호를 입력한다.
-- - 개설 과목 번호를 출력한다.
-- - 과목 명을 출력한다
-- - 개설 과목 시작 날짜를 출력한다.
-- - 개설 과목 종료 날짜를 출력한다.
-- - 교재명을 출력한다.
-- - 교사명을 출력한다.
select t.OPENSUBJECTSEQ as 개설과정번호,
       t1.OPENCOURSESEQ as 개설과목번호,
       t3.SUBJECTNAME   as 과목명,
       t.SUBJECTSTART   as 개설과목시작날짜,
       t.SUBJECTEND     as 개설과목종료날짜,
       t4.BOOKNAME      as 교재명,
       t5.TEACHERNAME   as 교사명
from TBLOPENCOURSE t1
         inner join TBLOPENSUBJECT T on t1.OPENCOURSESEQ = T.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T2 on T2.AVAILABLESUBJECTSEQ = T.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T3 on T3.SUBJECTSEQ = T2.SUBJECTSEQ
         inner join TBLBOOK T4 on T4.BOOKSEQ = T3.BOOKSEQ
         inner join TBLTEACHER T5 on T5.TEACHERSEQ = T2.TEACHERSEQ;
-- - 필기 배점을 출력한다.   tblrate
-- - 실기 배점을 출력한다.
-- - 출결 배점을 출력한다.
-- - 필기 점수를 출력한다.   tblgrade
-- - 실기 점수를 출력한다.
-- - 출결 점수를 출력한다.
-- - 시험 날짜를 출력한다.   tblexam
-- - 시험 문제를 출력한다. *삭제*
select t4.WRITERATE    AS 필기배점,
       t4.PERFORMRATE  AS 실기배점,
       t4.ATTENDRATE   AS 출결배점,
       t2.WRITEGRADE   AS 필기점수,
       t2.PERFORMGRADE AS 실기점수,
       t2.ATTENDGRADE  AS 출결점수,
       t3.EXAMDATE     AS 시험날짜
from TBLOPENSUBJECT t1
         inner join TBLCLASS T on t1.OPENCOURSESEQ = T.OPENCOURSESEQ
         inner join TBLGRADE T2 on T.CLASSSEQ = T2.CLASSSEQ
         inner join TBLEXAM T3 on T3.EXAMSEQ = T2.EXAMSEQ
         inner join TBLRATE T4 on t1.OPENSUBJECTSEQ = T4.OPENSUBJECTSEQ;

-- - 출결 현황 및 출결 체크를 할 수 있다.
--
-- [메인] > [교육생] > [출결현황 및 출결 체크] > [출결 조회]
--
-- [기간(전체,월,일)선택] > [선택한 기간의 본인 출결 현황조회]
-- - 과정번호를 출력한다.
-- - 과정이름을 출력한다.
-- - 과정기간(시작일)을 출력한다.
-- - 과정기간(종료일)을 출력한다.
--   - 출결일을 출력한다.
--   - 출결 상태를 출력한다.
select t1.OPENCOURSESEQ                 AS 과정번호,
       t3.COURSENAME                    AS 과정이름,
       t1.COURSESTART                   AS 과정시작일자,
       t1.COURSEEND                     AS 과정종료일자,
       to_char(t2.INTIME, 'yyyy-mm-dd') AS 출결일,
       t2.ATTENDANCE                    AS 출결상태
from TBLOPENCOURSE t1
         inner join TBLCLASS T on t1.OPENCOURSESEQ = T.OPENCOURSESEQ
         inner join TBLATTEND T2 on T.CLASSSEQ = T2.CLASSSEQ
         inner join TBLCOURSE T3 on T3.COURSESEQ = t1.COURSESEQ


--  [출결 체크 입력]
--  - 당일 입실 시간을 입력한다.
--  - 당일 외출 시간을 입력한다.
--  - 당일 퇴실 시간을 입력한다.
--  - 병가 사유를 입력한다.

create or replace procedure attendenceCheckInsert(
    pinTime date,
    poutTime date,
    pattendace varchar2,
    pclassSeq number
)
    is
begin
    insert into tblattend
    values (SEQ_TBLATTNED.nextval, pinTIme, poutTime, pattendace, pclassSeq);
end;

CREATE OR REPLACE FUNCTION attendenceCheck(
    pnum in number
)
    RETURN VARCHAR
    IS
    result VARCHAR2(100);
BEGIN
    select ATTENDSEQ, INTIME, OUTTIME, ATTENDANCE, CLASSSEQ into result from tblattend where classseq = pnum;
    RETURN result;
END;

CREATE OR REPLACE VIEW specificCourse
AS
select *
from tblattend t1
         inner join TBLCLASS T on T.CLASSSEQ = t1.CLASSSEQ
         inner join TBLSTUDENT T2 on T2.STUDENTSEQ = T.STUDENTSEQ;
-- 2-1. [특정 과목 선택] > [과제 피드백 조회]
-- -    과목 번호를 출력한다.
-- -    과제 번호를 출력한다.
-- -    학생 번호를 출력한다.
-- -    과제 피드백내용을 출력한다.
SELECT T3.OPENSUBJECTSEQ     AS 과목번호,
       T1.TASKSEQ            AS 과제번호,
       T2.CLASSSEQ           AS 학생번호,
       T.TASKFEEDBACKCONTENT AS 피드백내용
FROM TBLTASK T1
         INNER JOIN TBLTASKFEEDBACK T on T1.TASKSEQ = T.TASKSEQ
         INNER JOIN TBLCLASS T2 on T2.CLASSSEQ = T1.CLASSSEQ
         INNER JOIN TBLOPENSUBJECT T3 on T3.OPENSUBJECTSEQ = T1.OPENSUBJECTSEQ;


-- 개설 과목 번호를 출력한다.
-- 개설 과목명을 출력한다.
-- 과목 시작 날짜를 출력한다.
-- 과목 종료 날짜를 출력한다.
-- 과제 제출 여부를 출력한다.

-- 과목 번호를 입력한다.
-- 과제 번호를 입력한다.
-- 과제를 등록한다.
-- 수강생 번호를 입력한다.

insert into tblTask
select seq_tbltask, '제출', t2.SUBJECTEND, t2.OPENSUBJECTSEQ, t.CLASSSEQ
from tbltask t1
         inner join TBLCLASS T on T.CLASSSEQ = t1.CLASSSEQ
         inner join TBLOPENSUBJECT T2 on T2.OPENSUBJECTSEQ = t1.OPENSUBJECTSEQ
where t.CLASSSEQ = ?;

select *
from tbltask;
commit;

create or replace procedure specificStudentTaskProc(
    pnum in number
)
    is
begin
    select t1.TASKSEQ, '제출', t2.SUBJECTEND, t2.OPENSUBJECTSEQ, t.CLASSSEQ
    from tbltask t1
             inner join TBLCLASS T on T.CLASSSEQ = t1.CLASSSEQ
             inner join TBLOPENSUBJECT T2 on T2.OPENSUBJECTSEQ = t1.OPENSUBJECTSEQ
    where t.CLASSSEQ = pnum;
end;

CREATE OR REPLACE FUNCTION specificStudentTaskFunc(
    pnum in number,
    result in varchar2
)
    return number
    is
begin
    select t1.TASKSEQ, '제출', t2.SUBJECTEND, t2.OPENSUBJECTSEQ, t.CLASSSEQ
    into result
    from tbltask t1
             inner join TBLCLASS T on T.CLASSSEQ = t1.CLASSSEQ
             inner join TBLOPENSUBJECT T2 on T2.OPENSUBJECTSEQ = t1.OPENSUBJECTSEQ
    where t.CLASSSEQ = pnum;
    return result;
end;

CREATE OR REPLACE VIEW specificStudentTaskView
AS
select t1.TASKSEQ, '제출', t2.SUBJECTEND, t2.OPENSUBJECTSEQ, t.CLASSSEQ
from tbltask t1
         inner join TBLCLASS T on T.CLASSSEQ = t1.CLASSSEQ
         inner join TBLOPENSUBJECT T2 on T2.OPENSUBJECTSEQ = t1.OPENSUBJECTSEQ
---------------------------------
-- A-006 특정 개설 과정의 과목 및 교육생 정보 관리
-- 1. [특정 개설 과정의 개설 과목 조회]
-- 개설 과목 번호를 출력한다.
-- 과목 명을 출력한다.
-- 과목기간(시작날짜)을 출력한다.
-- 과목기간(종료날짜)을 출력한다.
-- 교재를 출력한다.

CREATE OR REPLACE PROCEDURE specificCourseProc(
    pnum in number
)
    IS
BEGIN
    SELECT o.opensubjectseq AS 개설과목번호,
           s.subjectname    AS 과목명,
           o.subjectstart   AS "과목 기간(시작날짜)",
           o.subjectend     AS "과목 기간(종료날짜)",
           b.bookname       AS 교재명
    FROM tblopencourse oc
             INNER JOIN tblopensubject o
                        ON oc.opencourseseq = o.opencourseseq
             INNER JOIN tblavailablesubject a
                        ON a.availableSubjectSeq = o.availablesubjectseq
             INNER JOIN tblsubject s
                        ON s.subjectseq = a.subjectseq
             INNER JOIN tblBook b
                        ON b.bookseq = s.bookseq
    WHERE oc.opencourseseq = pnum;
END;

CREATE OR REPLACE FUNCTION returnBookNameFunc(
    pnum in number
)
    RETURN VARCHAR
    IS
    result VARCHAR2(100);
BEGIN
    SELECT o.opensubjectseq AS 개설과목번호,
           s.subjectname    AS 과목명,
           o.subjectstart   AS "과목 기간(시작날짜)",
           o.subjectend     AS "과목 기간(종료날짜)",
           b.bookname       AS 교재명
    FROM tblopencourse oc
             INNER JOIN tblopensubject o
                        ON oc.opencourseseq = o.opencourseseq
             INNER JOIN tblavailablesubject a
                        ON a.availableSubjectSeq = o.availablesubjectseq
             INNER JOIN tblsubject s
                        ON s.subjectseq = a.subjectseq
             INNER JOIN tblBook b
                        ON b.bookseq = s.bookseq
    WHERE oc.opencourseseq = pnum;
    result := 'testFunction';
    RETURN result;
END;

CREATE OR REPLACE VIEW specificCourse
AS
SELECT o.opensubjectseq AS 개설과목번호,
       s.subjectname    AS 과목명,
       o.subjectstart   AS "과목 기간(시작날짜)",
       o.subjectend     AS "과목 기간(종료날짜)",
       b.bookname       AS 교재명
FROM tblopencourse oc
         INNER JOIN tblopensubject o
                    ON oc.opencourseseq = o.opencourseseq
         INNER JOIN tblavailablesubject a
                    ON a.availableSubjectSeq = o.availablesubjectseq
         INNER JOIN tblsubject s
                    ON s.subjectseq = a.subjectseq
         INNER JOIN tblBook b
                    ON b.bookseq = s.bookseq;
-- 2. [특정 개설 과정에 개설 과목 등록]
-- 개설 과정이 지정되지 않은 개설 과목 목록을 출력한다.
SELECT *
FROM tblopencourse
WHERE opensubjectregister = '미등록';
-- 개설 과목 번호를 여러 개 선택하여 개설 과정에 등록한다. (************************)
INSERT INTO TBLOPENCOURSE(19, '강의예정', '미등록', 30, '2022-02-23', '2022-08-23',)
INSERT INTO TBLOPENCOURSE()
INSERT INTO TBLOPENCOURSE()
INSERT INTO TBLOPENCOURSE()


select *
from tblopencourse;
select *
from TBLOPENSUBJECT;
select *
from
-- 개설 과목을 등록 또는 취소한다.
INSERT INTO tblopensubject(openSubjectSeq, subjectStart, subjectEnd, availableSubjectSeq, openCourseSeq)
VALUES (SEQ_TBLOPENSUBJECT.nextval, ' ? ', ' ? ', ' ? ', ' ? ');
-- 3. [특정 개설 과정의 개설 과목 삭제]
-- 삭제할 개설 과목 번호를 선택한다.
-- 삭제 또는 취소한다.
DELETE
FROM tblOpensubject
WHERE opensubjectseq = ?;
-- 4. [특정 개설 과정의 교육생 조회]
-- 수강 번호를 출력한다.
-- 교육생 이름을 출력한다.
-- 교육생 주민번호 뒷자리를 출력한다.
-- 교육생 전화번호를 출력한다.
-- 교육생 등록날짜를 출력한다.
-- 교육생 수료 및 중도탈락 여부를 출력한다.
SELECT c.classseq         AS 수강번호,
       s.name             AS 이름,
       s.password         AS 주민번호뒷자리,
       s.tel              AS 전화번호,
       s.retdate          AS 등록날짜,
       s.completionstatus AS 수료여부
FROM tblStudent s
         INNER JOIN tblclass c
                    ON s.studentseq = c.studentseq
         INNER JOIN tblopencourse o
                    ON o.opencourseseq = c.opencourseseq
WHERE o.opencourseseq = ?;
-- 5. [특정 개설 과정에 교육생 등록]
-- 현재 수강 중이지 않은 교육생 목록을 출력한다. //수강신청 수강중 수강완료
SELECT *
FROM tblstudent
WHERE status = '수강신청';
-- 교육생 번호를 여러 개 선택하여 개설 과정에 등록한다. (******************************)
-- 등록 또는 취소한다.
INSERT INTO tblopencourse
-- 6. [특정 개설 과정의 교육생 삭제]
-- 삭제할 수강 번호를 선택한다.
-- 삭제 또는 취소한다.
DELETE
FROM tblclass
WHERE classseq = ?;

