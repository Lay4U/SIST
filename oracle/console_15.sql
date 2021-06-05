--교사
---------------------------------------------------------------------------------------------B001
-- 강의스케줄 조회
-- 요구사항
-- 강의스케줄 조회하기
-- 강의스케줄 조회에 관한 모든 기능을 포함한다.
-- [메인] > [교사]
--
-- 1. [강의 스케줄 조회]
--    - 스케줄 번호를 출력한다.
--    - 과목 번호를 출력한다.
--     - 과정 명을 출력한다.
--     - 개설 과정 시작 날짜를 출력한다.
--     - 개설 과정 종료 날짜를 출력한다.
--     - 강의실명을 출력한다.
--     - 과목명을 출력한다.
--     - 과목기간 시작 날짜를 출력한다.
--     - 과목기간 종료 날짜를 출력한다.
--     - 교재명을 출력한다.
--     - 교육생 등록 인원을 출력한다.

create or replace view vwListSchedule --EDIT : 여기도 띄어쓰기 문제
as
select t2.CLASSSCHEDULESEQ      as 스케줄번호,
       t3.SUBJECTSEQ            as 과목번호,
       t6.COURSENAME            as 과정명,
       to_char(t5.COURSESTART, 'yyyy-mm-dd')  as 과정시작날짜, -- EDIT : 'yyyy-mm-dd' -c
       to_char(t5.COURSEEND, 'yyyy-mm-dd')    as 과정종료날짜, -- EDIT : 'yyyy-mm-dd' -c 
       t7.CLASSROOMNAME         as 강의실명,
       t3.SUBJECTNAME           as 과목명,
       to_char(os.SUBJECTSTART, 'yyyy-mm-dd') as 과목시작날짜, -- EDIT : 'yyyy-mm-dd' -c
       to_char(os.SUBJECTEND, 'yyyy-mm-dd')   as 과목종료날짜, -- EDIT : 'yyyy-mm-dd' -c
       t4.BOOKNAME              as 교재명,
       t5.OPENSUBJECTREGISTER
from TBLOPENSUBJECT os
    inner join TBLAVAILABLESUBJECT T on T.AVAILABLESUBJECTSEQ = os.AVAILABLESUBJECTSEQ
    inner join TBLCLASSSCHEDULE T2 on T.TEACHERSEQ = T2.TEACHERSEQ
    inner join TBLSUBJECT T3 on T3.SUBJECTSEQ = T.SUBJECTSEQ
    inner join TBLBOOK T4 on T4.BOOKSEQ = T3.BOOKSEQ
    inner join TBLOPENCOURSE T5 on T5.OPENCOURSESEQ = os.OPENCOURSESEQ
    inner join TBLCOURSE T6 on T6.COURSESEQ = T5.COURSESEQ
    inner join TBLCLASSROOM T7 on T7.CLASSROOMSEQ = T5.CLASSROOMSEQ
        order by 과목시작날짜;


--  1-2. [특정 과목 교육생 조회]
--    - 교육생 이름을 출력한다.
--    - 교육생 전화번호를 출력한다.
--    - 교육생 등록일을 출력한다.
--    - 교육생 수료여부을 출력한다.

create or replace procedure procOneStudentList(
    pseq number,
    pcursor out sys_refcursor
)
    is
begin
    open pcursor for
        select NAME             as 교육생이름,
               tel              as 전화번호,
               RETDATE          as 등록일,
               COMPLETIONSTATUS as 수료여부
        from TBLSTUDENT
        where TBLSTUDENT.STUDENTSEQ = pseq
        order by NAME;
end;



----------------------------------------------------------------------------------------------- B002 배점 및 시험 관리


--B002 -[강의 완료된 담당 개설 과목 조회]

--- 강의 완료된 개설 과목 번호를 출력한다.
--- 과정 명을 출력한다.
--- 개설 과정 시작 날짜를 출력한다.
--- 개설 과정 종료 날짜를 출력한다.
--- 강의실명을 출력한다.
--- 과목 명을 출력한다.
--- 과목 시작 날짜를 출력한다.
--- 과목 종료 날짜를 출력한다.
--- 교재명을 출력한다.
--- 출결 배점을 출력한다.
--- 필기 배점을 출력한다.
--- 실기 배점을 출력한다.

-- where에 로그인한 사람의 teacherseq를 넣으면 그 사람의 강의 완료 과목의 시험/배점 정보 조회 가능

select os.opensubjectseq                      as "개설과목번호",
       c.coursename                           as "과정명",
       to_char(oc.coursestart, 'yyyy-mm-dd')  as "과정시작일",
       to_char(oc.courseEnd, 'yyyy-mm-dd')    as "과정종료일",
       oc.classroomseq                        as "강의실명",
       j.subjectname                          as "과목명",
       to_char(os.subjectStart, 'yyyy-mm-dd') as "과목시작일",
       to_char(os.subjectEnd, 'yyyy-mm-dd')   as "과목종료일",
       b.bookname                             as "교재명",
       r.attendrate                           as "출결배점",
       r.writerate                            as "필기배점",
       r.performrate                          as "실기배점"
from tblBook b
         inner join tblSubject j
                    on b.bookseq = j.bookseq
         inner join tblavailablesubject a
                    on j.subjectseq = a.subjectseq
         inner join tblOpenSubject os
                    on a.availablesubjectseq = os.availablesubjectseq
         inner join tblRate r
                    on os.opensubjectseq = r.opensubjectseq
         inner join tblOpenCourse oc
                    on os.opencourseseq = oc.opencourseseq
         inner join tblCourse c
                    on c.courseSeq = oc.courseSeq
where os.subjectend < sysdate
  and a.teacherseq = 교사번호
order by oc.coursestart asc, os.subjectStart asc;



-- B002 - 1 [특정 과목번호 선택] > [배점 및 시험 정보 등록]
--- 출결 배점을 등록한다.
--- 필기 배점을 등록한다.
--- 실기 배점을 등록한다.
--- 시험 날짜를 등록한다.
--- 시험 문제를 등록한다.
--- 등록 또는 취소한다.


insert into tblRate(rateseq, attendrate, performrate, writerate, opensubjectseq)
values (seq_tblRate, ?, ?, ?, ?);

insert into tblExam(seq_tblExam, gradeenter, examfile, examdate, opensubjectseq)
values (seq_tblExam, ?, ?, ?, ?);



-- B002 - 2 [특정 과목번호 선택] > [배점 및 시험 정보 수정]
--- 출결 배점을 수정한다.
--- 필기 배점을 수정한다.
--- 실기 배점을 수정한다.
--- 시험 날짜를 수정한다.
--- 시험 문제를 수정한다.
--- 수정 또는 취소한다.

update tblRate
set attendrate  = ?,
    performrate = ?,
    writerate   = ?
where opensubjectseq = ?;

update tblExam
set examdate = ?,
    examfile = ?
where opensubjectseq = ?;



-- B002 - 3 [특정 과목번호 선택] >[배점 및 시험 정보 삭제]
--- 출결 배점을 삭제한다.
--- 필기 배점을 삭제한다.
--- 실기 배점을 삭제한다.

--- 시험 날짜를 삭제한다.
--- 시험 문제를 삭제한다.
--- 삭제 또는 취소한다.

-- 모든 과목은 배점과 시험날짜, 문제에 대한 정보가 있어야되니까 삭제 안하고 null로 바꾼것

update tblRate
set attendRate  = null,
    performRate = null,
    writeRate   = null
where opensubjectSeq = ?;

update tblExam
set examdate = null,
    examFile = null
where opensubjectSeq = ?;



-----------------------------------------------------------------------------------------------B003
-- B-003 성적 정보 관리


-- 강의 종료된 개설 과목 번호를 출력한다.
-- 과정 명을 출력한다.
-- 개설 과정 시작 날짜를 출력한다.
-- 개설 과정 종료 날짜를 출력한다.
-- 강의실명을 출력한다.
-- 과목 명을 출력한다.
-- 과목 시작 날짜를 출력한다.
-- 과목 종료 날짜를 출력한다.
-- 교재명을 출력한다.
-- 출결 배점을 출력한다.
-- 필기 배점을 출력한다.
-- 실기 배점을 출력한다.
CREATE OR REPLACE VIEW vwGrade
AS
SELECT cs.opensubjectseq AS 과목번호,
       c.coursename      AS 과정명,
       oc.coursestart    AS 과정시작날짜,
       oc.courseend      AS 과정종료날짜,
       cr.classroomname  AS 강의실명,
       s.subjectname     AS 과목명,
       os.subjectstart   AS 과목시작날짜,
       os.subjectend     AS 과목종료날짜,
       b.bookname        AS 교재명,
       r.attendrate      AS 출결배점,
       r.writerate       AS 필기배점,
       r.performrate     AS 실기배점
FROM tblClassSchedule cs
         INNER JOIN tblopensubject os
                    ON cs.opensubjectseq = os.opensubjectseq
         INNER JOIN tblopencourse oc
                    ON oc.opencourseseq = os.opencourseseq
         INNER JOIN tblcourse c
                    ON c.courseseq = oc.courseseq
         INNER JOIN tblclassroom cr
                    ON cr.classroomseq = oc.classroomseq
         INNER JOIN tblAvailableSubject a
                    ON a.availableSubjectSeq = os.availableSubjectSeq
         INNER JOIN tblsubject s
                    ON s.subjectseq = a.subjectseq
         INNER JOIN tblbook b
                    ON b.bookseq = s.bookseq
         INNER JOIN tblrate r
                    ON os.opensubjectseq = r.opensubjectseq
WHERE cs.classstate = '강의종료';


SELECT *
FROM vwgrade;

-- 1. [특정 과목번호 선택] > [특정 과목의 전체 교육생 조회]
--교육생 번호를 출력한다.
--이름을 출력한다.
--전화번호를 출력한다.
--수료여부를 출력한다.
--출결 점수를 출력한다.
--필기 점수를 출력한다.
--실기 점수를 출력한다.
--성적 등록 여부를 출력한다.
--중도 탈락 여부를 출력한다.
--중도 탈락 날짜를 출력한다.

SELECT s.studentseq       AS 교육생번호,
       s.name             AS 이름,
       s.tel              AS 전화번호,
       s.completionstatus AS 수료여부,
       g.attendgrade      AS 출결점수,
       g.writegrade       AS 필기점수,
       g.performgrade     AS 실기점수,
       e.gradeenter       AS 성적등록여부,
       s.faildate         AS 중도탈락날짜
FROM tblstudent s
         INNER JOIN tblclass c
                    ON s.studentseq = c.studentseq
         INNER JOIN tblgrade g
                    ON c.classseq = g.classseq
         INNER JOIN tblexam e
                    ON e.examseq = g.examseq
         INNER JOIN tblopensubject os
                    ON os.opensubjectseq = e.opensubjectseq
WHERE os.opensubjectseq = ?;



--1-1. [특정 교육생 정보 선택 ] > [시험 점수 입력]
--출결 점수를 입력한다.
--필기 점수를 입력한다.
--실기 점수를 입력한다.
INSERT INTO tblgrade (gradeseq, writegrade, performgrade, attendgrade, classseq, examseq)
SELECT SEQ_TBLGRADE.nextval, ?, ?, ?, c.classseq, e.examseq
FROM tblclass c
         INNER JOIN tblgrade g
                    ON c.classseq = g.classseq
         INNER JOIN tblstudent s
                    ON s.studentseq = c.studentseq
         INNER JOIN tblexam e
                    ON e.examseq = g.examseq
WHERE s.studentseq = ?;



--1-2. [특정 교육생 정보 선택 ] > [시험 점수 수정]
--출결 점수를 수정한다.
--필기 점수를 수정한다.
--실기 점수를 수정한다.

UPDATE tblgrade
SET attendgrade  = 20,
    writegrade   = 70,
    performgrade = 60
WHERE (classseq, examseq) IN (SELECT c.classseq, e.examseq
                              FROM tblclass c
                                       INNER JOIN tblgrade g
                                                  ON c.classseq = g.classseq
                                       INNER JOIN tblstudent s
                                                  ON s.studentseq = c.studentseq
                                       INNER JOIN tblexam e
                                                  ON e.examseq = g.examseq
                              WHERE s.studentseq = 1);


--1-3. [특정 교육생 정보 선택 ] > [시험 점수 삭제]
--출결 점수를 삭제한다.
--필기 점수를 삭제한다.
--실기 점수를 삭제한다.

UPDATE tblgrade
SET attendgrade  = null,
    writegrade   = null,
    performgrade = null
WHERE (classseq, examseq) IN (SELECT c.classseq, e.examseq
                              FROM tblclass c
                                       INNER JOIN tblgrade g
                                                  ON c.classseq = g.classseq
                                       INNER JOIN tblstudent s
                                                  ON s.studentseq = c.studentseq
                                       INNER JOIN tblexam e
                                                  ON e.examseq = g.examseq
                              WHERE s.studentseq = 1);



-----------------------------------------------------------------------------------------------B004
-- 출결조회
-------------------------------------------------------------------------------------------
-- 1. [강의한 과정 조회]
-- 개설 과정 번호를 출력한다.
-- 과정 명을 출력한다.
-- 과정 시작 날짜를 출력한다.
-- 과정 종료 날짜를 출력한다.


-- 1) SELECT 사용
SELECT oc.courseseq   as 개설과정번호,
       c.coursename   as 과정명,
       oc.coursestart as 과정시작일,
       oc.courseend   as 과정종료일
FROM tblcourse C
         INNER JOIN tblopencourse OC
                    ON c.courseseq = oc.courseseq
         INNER JOIN tblopensubject OS
                    ON oc.opencourseseq = os.opencourseseq
         INNER JOIN tblavailablesubject A
                    ON os.availablesubjectseq = a.availablesubjectseq
         INNER JOIN tblteacher T
                    ON a.teacherseq = t.teacherseq
WHERE t.teacherseq = 확인할교사번호;

-------------------------------------------------------------------------------------------
-- 1-1. [특정 개설 과정의 교육생 출결 조회]
-- 교육생 번호를 출력한다.
-- 교육생 이름을 출력한다.
-- 출결번호를 출력한다.
-- 날짜를 출력한다.
-- 입실 시간을 출력한다.
-- 퇴실 시간을 출력한다.
-- 출결 상황을 출력한다.

-- 1) SELECT 사용
SELECT s.studentseq as 교육생번호,
       s.name       as 교육생이름,
       a.attendseq  as 출결번호,
       a.intime     as 입실시간,
       a.outtime    as 퇴실시간,
       a.attendance as 출결상황
FROM tblclass C
         INNER JOIN tblstudent S
                    ON c.studentseq = s.studentseq
         INNER JOIN tblattend A
                    ON c.classseq = a.classseq
         INNER JOIN tblopencourse oc
                    ON c.opencourseseq = oc.opencourseseq
WHERE oc.opencourseseq = 특정개설과정번호;

-------------------------------------------------------------------------------------------
-- 1-2. [특정 교육생 선택] > [기간 검색] > [출결 관리]
-- 선택된 기간(년/월/일)을 출력한다.
-- 출결번호를 출력한다.
-- 교육생 번호를 출력한다.
-- 출결 날짜 및 시각을 출력한다.
-- 출결 상황을 출력한다.

-- 1) SELECT 사용
SELECT a.attendseq                                as 출결번호,
       c.studentseq                               as 교육생번호,
       to_char(a.intime, 'yyyy-mm-dd hh24:mi:ss') as 출결날짜및시각,
       a.attendance                               as 출결상황
FROM tblclass C
         INNER JOIN tblattend A
                    ON c.classSeq = a.classSeq
WHERE c.studentseq = 특정교육생번호
  AND a.intime BETWEEN 원하는기간 AND 원하는기간;



-----------------------------------------------------------------------------------------------B005

-- B - 005 [특정 과목 선택] > [특정 과목 과제관리]
-- 과목 번호
-- 과목 명
-- 과제 번호
-- 과제 명
-- 교육생 번호
-- 교육생 명
select t3.OPENSUBJECTSEQ as 과목번호,
       t5.SUBJECTNAME as 과목명,
       t1.TASKSEQ as 과제번호,
       t5.SUBJECTNAME || '과제'  as 과제이름,
       t2.STUDENTSEQ as 교육생번호,
       t2.NAME as 교육생이름
from tbltask t1
         inner join TBLCLASS T on T.CLASSSEQ = t1.CLASSSEQ
         inner join TBLSTUDENT T2 on T2.STUDENTSEQ = T.STUDENTSEQ
         inner join TBLOPENSUBJECT T3 on T3.OPENSUBJECTSEQ = t1.OPENSUBJECTSEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ;

-- 2-1. [전체 교육생 조회]
-- 교육생 번호
-- 교육생 명
-- 과제 수행 여부

SELECT
    s.studentseq AS 교육생번호,
    s.name AS "교육생 명",
    t.taskregist AS 과제수행여부
FROM tblstudent s
         INNER JOIN tblclass c
                    ON s.studentseq = c.studentseq
         INNER JOIN tbltask t
                    ON c.classseq = t.classseq;

-- 2-2-1. [특정 교육생 선택] > [특정 교육생별 피드백 관리]
-- 과제 피드백 관리 번호를 입력한다.
-- -    과목 번호를 입력한다.
--    과제 번호를 입력한다.
---   학생 번호를 입력한다.
--    피드백을 입력한다.

insert into tblTaskFeedback
values (taskseq, '피드백내용');




-- 2-2-2. [특정 교육생별 피드백 수정]
-- -    과제 피드백 관리 번호를 수정한다.
-- -    과목 번호를 수정한다.
-- -    피드백을 수정한다.

update tblTaskFeedback
set taskseq             = ?,
    taskFeedbackContent = ?
where ?;


-- 2-2-3.[특정 교육생별 피드백 삭제]
--  -   과제 피드백 관리 번호를 삭제한다.
-- -    피드백을 삭제한다.
delete from tblTaskFeedback where taskSeq = ?; -- cascade

