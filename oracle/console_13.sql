--------------------------------------------형래-------------------------------------------------------------
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


CREATE OR REPLACE PROCEDURE procDelete(
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


--------------------------------------------형래-------------------------------------------------------------


select t5.SUBJECTNAME, t3.SUBJECTEND, t1.TEAMSEQ
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ
where (t5.SUBJECTSEQ, t1.teamname) in (select distinct t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ);



select t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ
where (t5.SUBJECTSEQ, t1.teamname) in (select distinct t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ)
group by t5.SUBJECTSEQ, t1.teamname;


select t5.SUBJECTNAME, t3.SUBJECTEND, t1.TEAMSEQ, t3.SUBJECTEND, t1.TEAMSEQ
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ
where (t5.SUBJECTSEQ, t1.teamname) in (select distinct t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ)
group by t5.SUBJECTSEQ, t1.teamname, t5.SUBJECTNAME, t3.SUBJECTEND, t1.TEAMSEQ;





select t3.SUBJECTEND, t1.TEAMSEQ
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ
where (t5.SUBJECTSEQ, t1.teamname) in (select distinct t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ)
group by  t3.SUBJECTEND, t1.TEAMSEQ;