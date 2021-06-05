--교육생
-----------------------------------------------------------------------------------------------C001

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
select t4.WRITERATE AS 필기배점,
       t4.PERFORMRATE AS 실기배점,
       t4.ATTENDRATE AS 출결배점,
       t2.WRITEGRADE AS 필기점수,
       t2.PERFORMGRADE AS 실기점수,
       t2.ATTENDGRADE AS 출결점수,
       t3.EXAMDATE AS 시험날짜
from TBLOPENSUBJECT t1
         inner join TBLCLASS T on t1.OPENCOURSESEQ = T.OPENCOURSESEQ
         inner join TBLGRADE T2 on T.CLASSSEQ = T2.CLASSSEQ
         inner join TBLEXAM T3 on T3.EXAMSEQ = T2.EXAMSEQ
         inner join TBLRATE T4 on t1.OPENSUBJECTSEQ = T4.OPENSUBJECTSEQ;




-----------------------------------------------------------------------------------------------C002

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


select * from tblattend;




-----------------------------------------------------------------------------------------------C003
-- C-003 취업관리

-- 1. [채용 일정 조회]
--회사 번호를  출력한다.
--회사명을  출력한다.
--연봉을  출력한다.
--규모을  출력한다.
--근무지역을  출력한다.
--근무형태(정규/비정규직)을  출력한다.

SELECT * FROM tblCompany;


-- 2. [취업 현황 조회]
--취업관리번호를 출력한다.
--회사번호을 출력한다.
--수료일자를 출력한다.
--회사명을 출력한다.
--과정번호를 출력한다.
--학생명을 출력한다. (ex) 홍OO)
CREATE OR REPLACE VIEW vwEmpStat
AS
SELECT
    e.empmangseq AS 취업관리번호,
    c.companyseq AS 회사번호,
    s.completedate AS 수료일자,
    c.companyname AS 회사명,
    cl.opencourseseq AS 과정번호,
    substr(s.name, 1, 1) || 'OO'  AS 학생명
FROM tblCompany c
    INNER JOIN tblempstat e
        ON c.companyseq = e.companyseq
            INNER JOIN tblclass cl
                ON e.classseq = cl.classseq
                    INNER JOIN tblstudent s
                        ON cl.studentseq = s.studentseq;


SELECT * FROM vwEmpStat;

-----------------------------------------------------------------------------------------------C004
-- 과제 및 프로젝트

-- 요구사항
-- 과제 및 프로젝트 관리
-- 수업 관리에 관한 모든 기능을 포함한다.
-- [메인] > [교육생] > [수업 관리] > [과목 조회]

-- 개설 과목 번호를 출력한다.
-- 개설 과목명을 출력한다.
-- 과목 시작 날짜를 출력한다.
-- 과목 종료 날짜를 출력한다.
-- 과제 제출 여부를 출력한다.
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

insert into tblTask --EDIT select 에서 sequence 사용 불가 -c
select t1.TASKSEQ,'제출',t2.SUBJECTEND, t2.OPENSUBJECTSEQ, t.CLASSSEQ
from tbltask t1
inner join TBLCLASS T on T.CLASSSEQ = t1.CLASSSEQ
inner join TBLOPENSUBJECT T2 on T2.OPENSUBJECTSEQ = t1.OPENSUBJECTSEQ
where t.CLASSSEQ = ?;

select * from tbltask;
commit;


create or replace procedure procTaskSubject(
    pseq number,
    pcursor out sys_refcursor
)
is
begin
    open pcursor for
select
    distinct t2.SUBJECTNAME as 개설과목명,
    os.OPENSUBJECTSEQ as 개설과목번호,
    to_char(os.SUBJECTSTART) as 과목시작날짜,
    to_char(os.SUBJECTEND) as 과목종료날짜,
    t3.TASKREGIST as 과제제출여부
from TBLOPENSUBJECT os
    inner join TBLAVAILABLESUBJECT T on T.AVAILABLESUBJECTSEQ = os.AVAILABLESUBJECTSEQ
    inner join TBLSUBJECT T2 on T2.SUBJECTSEQ = T.SUBJECTSEQ
    inner join TBLTASK T3 on os.OPENSUBJECTSEQ = T3.OPENSUBJECTSEQ
    inner join TBLCLASS T4 on T4.CLASSSEQ = T3.CLASSSEQ
        where t4.STUDENTSEQ = pseq
            order by os.OPENSUBJECTSEQ;

end;
--
--

-- 2. [특정 과목 선택] > [특정 과목 과제 등록]
-- 과목 번호를 입력한다.
-- 과제 번호를 입력한다.
-- 과제를 등록한다.
-- 교육생 번호를 입력한다.


-- 과목 신규 등록 프로시저
create or replace procedure procAddTask
is
    vosseq number;
    vcseq number;
begin

    select os.OPENSUBJECTSEQ,t2.CLASSSEQ into vosseq, vcseq from TBLOPENSUBJECT os
        inner join TBLTASK T on os.OPENSUBJECTSEQ = T.OPENSUBJECTSEQ
        inner join TBLCLASS T2 on T2.CLASSSEQ = T.CLASSSEQ
        inner join TBLSTUDENT T3 on T3.STUDENTSEQ = T2.STUDENTSEQ;

insert into TBLTASK (TASKSEQ, TASKREGIST, TASKSUBMITDATE, OPENSUBJECTSEQ, CLASSSEQ)
    values (SEQ_TBLTASK.nextval,'제출',sysdate,vosseq,vcseq);
    commit;
exception
    when others then
        rollback ;
end;


-- 과목 수정 프로시저
create or replace procedure procUpdateTask( --EDIT: 띄어쓰기.. -c
    ptseq number,
    ptr varchar2,
    ptsd date,
    posseq number,
    pcseq number
)
is
begin
    update TBLTASK
        set
            TASKSEQ = ptseq,
            TASKREGIST = ptr,
            TASKSUBMITDATE= ptsd,
            CLASSSEQ = pcseq
            where OPENSUBJECTSEQ = posseq;
    commit;
end;



--과제 등록시 제출 여부 변경 트리거 > 미제출 -> 제출

create or replace trigger trgTaskRegist
    after
    update on TBLTASK
declare
    vmessage varchar2(100);
begin
    if updating then
        vmessage := '과제 제출 완료';
end if;
    update TBLTASK set TASKREGIST = '제출' where TASKSEQ = ?;
end trgTaskRegist;




select *
from TBLTASK order by TASKSEQ;
-- 2-1. [특정 과목 선택] > [과제 피드백 조회]
-- 과제 피드백 관리 번호를 출력한다.
-- -    과목 번호를 출력한다.
-- -    과제 번호를 출력한다.
-- -    학생 번호를 출력한다.
-- -    과제 피드백을 출력한다.
create or replace procedure procTaskFeedback(
    pseq number,
    pcursor out sys_refcursor
)
is
    begin open pcursor for
        SELECT T3.OPENSUBJECTSEQ AS 과목번호,
               T1.TASKSEQ AS 과제번호,
               T2.CLASSSEQ AS 학생번호,
               T.TASKFEEDBACKCONTENT AS 피드백내용
        FROM TBLTASK T1
        INNER JOIN TBLTASKFEEDBACK T on T1.TASKSEQ = T.TASKSEQ
        INNER JOIN TBLCLASS T2 on T2.CLASSSEQ = T1.CLASSSEQ
        INNER JOIN TBLOPENSUBJECT T3 on T3.OPENSUBJECTSEQ = T1.OPENSUBJECTSEQ
            where t3.OPENSUBJECTSEQ = pseq;

    end;


