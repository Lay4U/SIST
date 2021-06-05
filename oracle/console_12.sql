Here is my code.

select t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;

select t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join (
    select distinct subjectseq, teamname
    from TBLSUBJECT,
         tblteam) t5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;
-- <flashback query clause>, AS, CROSS, FULL, INNER, JOIN, LEFT, MATCH_RECOGNIZE, NATURAL,
-- ON, OUTER, PARTITION, PIVOT, RIGHT, UNPIVOT, USING 또는 VERSIONS이(가) 필요하지만 'as'을(를) 얻었습니다

select t4.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join (select distinct t4.subjectseq, t1.teamname
                     from tblteam t1
                              inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
                              inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
                              inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
                              inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ) T5
                    on t5.subjectseq = t4.SUBJECTSEQ
;

select *
from tblteam t1
   , (select distinct t4.subjectseq, t1.teamname
      from tblteam t1
               inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
               inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
               inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
               inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ)

-- http://jason-heo.github.io/mysql/2014/03/05/find-dup-record.html
SELECT person.id, person.name, job.job_name
FROM person
         INNER JOIN (
    -- 중복 제거를 위한 inline view
    SELECT DISTINCT person_name, job_name
    FROM job
) AS job
ON person.name = job.person_name;

select *
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;


select t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;


select t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join (select distinct CLASSSEQ, OPENCOURSESEQ from TBLCLASS t2) t2d
                    on t1.CLASSSEQ = t2d.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2d.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ
;

select *
from tblteam t
         inner join TBLCLASS T2 on T2.CLASSSEQ = t.CLASSSEQ
         inner join TBLOPENSUBJECT T3 on T2.OPENCOURSESEQ = T3.OPENCOURSESEQ
    inner

alter table TBLTEAM
    add constraint TBLTEAM_TBLSUBJECT_SUBJECTSEQ_FK
        foreign key (TEAMSEQ) references TBLSUBJECT
ALTER TABLE TBLTEAM
    ADD CONSTRAINTS subjectseq FOREIGN KEY (tblsubject)
REFERENCES 참조 테이블명(참조컬럼)

ALTER TABLE 테이블명
    ADD CONSTRAINTS 외래키 이름 FOREIGN KEY (참조컬럼)
REFERENCES 참조 테이블명(참조컬럼)

ALTER TABLE 테이블명
    ADD CONSTRAINT 제약조건명
        FOREIGN KEY (컬럼명)
            REFERENCES 참조할테이블명 (컬럼명);

alter table tblteam
    add constraint subject_fk
        foreign key (subjectseq)
            references tblsubject (SUBJECTSEQ);

alter table TBLTEAM
    add subjectseq int;

select *
from tblteam;
alter table TBLTEAM
    drop column SUBJECTSEQ



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


-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ


CREATE OR REPLACE PROCEDURE procSpecificCourse(
    pnum in number
)
    IS
BEGIN
    SELECT o.opensubjectseq,
           s.subjectname,
           o.subjectstart,
           o.subjectend,
           b.bookname
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


create index idx_tblOpenCourse_openCourseSeq on TBLOPENCOURSE(OPENCOURSESEQ);


CREATE OR REPLACE FUNCTION fnReturnBookName(
    pnum in number
)
    RETURN VARCHAR
    IS
    result VARCHAR2(100);
BEGIN
    SELECT o.opensubjectseq,
           s.subjectname,
           o.subjectstart,
           o.subjectend,
           b.bookname
    into result
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

    RETURN result;
END;



CREATE OR REPLACE VIEW vwSpecificCourse
AS
SELECT o.opensubjectseq,
       s.subjectname,
       o.subjectstart,
       o.subjectend,
       b.bookname
FROM tblopencourse oc
         INNER JOIN tblopensubject o
                    ON oc.opencourseseq = o.opencourseseq
         INNER JOIN tblavailablesubject a
                    ON a.availableSubjectSeq = o.availablesubjectseq
         INNER JOIN tblsubject s
                    ON s.subjectseq = a.subjectseq
         INNER JOIN tblBook b
                    ON b.bookseq = s.bookseq;
-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

create or replace procedure procAttendanceCheckInsert(
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


CREATE OR REPLACE TRIGGER trgCheckMessage
    AFTER
        INSERT
    ON tblattend
    FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('확인용 메세지 - 교육생 번호 : ' || ATTENDSEQ);
    DBMS_OUTPUT.PUT_LINE('확인용 메세지 - 변경 전 입실시간 : ' || :old.intime);
    DBMS_OUTPUT.PUT_LINE('확인용 메세지 - 변경 후 퇴실시간: ' || :new.intime);
    DBMS_OUTPUT.PUT_LINE('확인용 메세지 - 변경 전 상태 : ' || :old.attendance);
    DBMS_OUTPUT.PUT_LINE('확인용 메세지 - 변경 후 상태: ' || :new.attendance);
END;


CREATE OR REPLACE FUNCTION fnAttendanceCheck(
    pnum in number
)
    RETURN VARCHAR
    IS
    result VARCHAR2(100);
BEGIN
    select ATTENDSEQ, INTIME, OUTTIME, ATTENDANCE, CLASSSEQ
    into result
    from tblattend
    where classseq = pnum;
    RETURN result;
END;

CREATE OR REPLACE VIEW vwSpecificCourse
AS
select t1.ATTENDSEQ, t1.INTIME, t1.OUTTIME, t2.NAME, t2.STATUS, t2.TEL
from tblattend t1
         inner join TBLCLASS T on T.CLASSSEQ = t1.CLASSSEQ
         inner join TBLSTUDENT T2 on T2.STUDENTSEQ = T.STUDENTSEQ;