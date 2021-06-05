/*
 3. 데이터 생성. 1/N(업무 분담)
    - 분량: 어느 정도 서비가 운영 중인 상태.. 분량
    - 더미 데이터(되도록 정확하게..)
    - 실제 데이터(아주 아주 아주 아주 아주 아주 아주 아주 아주 아주 아주 아주 아주 신중하고 정확하게!!!!!!!!!!)
    a. insert..
    b. update
    c. delete
    - 산출물: *.sql
 */
alter session set ddl_lock_timeout = 20;
drop sequence seq_bbs_no;
drop sequence seq_ADMIN;
drop table admin;

CREATE TABLE ADMIN
(
    adminSeq  number       not null primary key,
    adminName varchar2(20) not null
);
alter table ADMIN
    add constraint admin_limit check (adminSeq <= 5);

DROP TABLE tblTeacher CASCADE CONSTRAINTS;
drop sequence seq_tblTeacher;
create sequence seq_tblTeacher;
CREATE TABLE tblTeacher
(
    teacherSeq  number       NOT NULL,
    teacherName varchar2(30) NOT NULL,
    password    number       NOT NULL,
    teacherTel  varchar2(50) NOT NULL,
    status      varchar2(50) not null
--     openSubjectSeq number       NOT NULL references tblOpenCourse (openCourseSeq)
);

alter table tblTeacher
    add constraint tblTeacher_pk primary key (teacherSeq);
alter table tblTeacher
    add constraint tblTeacher_number check (teacherSeq <= 10);

DROP TABLE tblClassRoom CASCADE CONSTRAINTS;
drop sequence seq_TBLCLASSROOM;
create sequence seq_tblclassroom;
CREATE TABLE tblClassRoom
(
    classRoomSeq       number       NOT NULL,
    classRoomName      varchar2(15) NOT NULL,
    classRoomPersonnel number       NOT NULL
);
alter table tblClassRoom
    add constraint tblClassRoom_pk primary key (classRoomSeq);
alter table tblClassRoom
    add constraint tblClassRoom_limit check (classRoomSeq <= 6);
alter table tblClassRoom
    add constraint tblClassRoom_limit_student check ((classRoomName in ('1강의실', '2강의실', '3강의실') and classRoomPersonnel <= 30)
        or (classRoomName in ('4강의실', '5강의실', '6강의실') and classRoomPersonnel <= 26));
-- alter table tblClassRoom
--     add constraint tblClassRoom_limit_student2 check (classRoomName in ('4강의실', '5강의실', '6강의실') and classRoomPersonnel <= 26);
insert into tblclassroom
values (SEQ_TBLCLASSROOM.nextval, '1강의실', 30);
insert into tblclassroom
values (SEQ_TBLCLASSROOM.nextval, '2강의실', 30);
insert into tblclassroom
values (SEQ_TBLCLASSROOM.nextval, '3강의실', 30);
insert into tblclassroom
values (SEQ_TBLCLASSROOM.nextval, '4강의실', 26);
insert into tblclassroom
values (SEQ_TBLCLASSROOM.nextval, '5강의실', 26);
insert into tblclassroom
values (SEQ_TBLCLASSROOM.nextval, '6강의실', 26);
DROP TABLE tblBook CASCADE CONSTRAINTS;
drop sequence seq_tblBook;
create sequence seq_tblBook;
CREATE TABLE tblBook
(
    bookSeq       number        NOT NULL,
    bookName      varchar2(200) NOT NULL,
    publisherName varchar2(200) NOT NULL
);
alter table tblBook
    add constraint tblBook_pk primary key (bookSeq);

DROP TABLE tblSubject CASCADE CONSTRAINTS;
drop sequence seq_tblSubject;
create sequence seq_tblSubject;

CREATE TABLE tblSubject
(
    subjectSeq  number        NOT NULL,
    subjectName varchar2(100) NOT NULL,
    period      number        NOT NULL
);
alter table tblSubject
    add constraint tblSubject_pk primary key (subjectSeq);

alter table tblSubject
    add constraint tblSubject_subjectSeq_ck check ( subjectSeq <= 50 );

DROP TABLE tblCourse CASCADE CONSTRAINTS;
drop sequence seq_tblcourse;
create sequence seq_tblcourse;
CREATE TABLE tblCourse
(
    courseSeq  number        NOT NULL,
    courseName varchar2(200) NOT NULL,
    courseTerm number        NOT NULL
);

alter table tblCourse
    add constraint tblCourse_pk primary key (courseSeq);
alter table tblCourse
    add constraint tblCourse_courseTerm check (courseTerm in (5.5, 6, 7));
-- alter table tblCourse
--     add constraint tblCourse_courseSeq check (courseTerm in (5_5, 6, 7));
CREATE TABLE tblBasicInfo
(
    basicInfoSeq number NOT NULL,
    courseSeq    number NOT NULL references tblCourse (courseSeq),
    subjectSeq   number NOT NULL references tblSubject (subjectSeq),
    classRoomSeq number NOT NULL references tblClassRoom (classRoomSeq),
    bookSeq      number NOT NULL references tblBook (bookSeq)
);
alter table tblBasicInfo
    add constraint tblBasicInfo_pk primary key (basicInfoSeq);

DROP TABLE tblOpencourse CASCADE CONSTRAINTS;
drop sequence seq_tblOpencourse;
create sequence seq_tblOpencourse;

CREATE TABLE tblOpenCourse
(
    openCourseSeq       number                      NOT NULL,
    courseState         varchar2(100)               NOT NULL,
    openSubjectRegister varchar2(100) default '미등록' NULL,
    studentRegister     number                      NOT NULL,
    courseStart         date                        NOT NULL,
    courseEnd           date                        NOT NULL,
--     period              date                        not null,
    courseSeq           number                      NOT NULL references tblCourse (courseSeq),
    classRoomSeq        number                      NOT NULL references tblClassRoom (classRoomSeq)
);
alter table tblOpenCourse
    add constraint tblOpenCourse_pk primary key (openCourseSeq);
DROP TABLE tblOpenSubject CASCADE CONSTRAINTS;
drop sequence seq_tblOpenSubject;
create sequence seq_tblOpenSubject;
CREATE TABLE tblOpenSubject
(
    openSubjectSeq      number NOT NULL,
    subjectStart        date   NOT NULL,
    subjectEnd          date   NOT NULL,
    availableSubjectSeq number NOT NULL references tblAvailableSubject (availableSubjectSeq),
    openCourseSeq       number not null references tblOpenCourse (openCourseSeq)
);
alter table tblOpenSubject
    add constraint tblOpenSubject_pk primary key (openSubjectSeq);
select *
from tblOpenSubject;

DROP TABLE tblAvailableSubject CASCADE CONSTRAINTS;
drop sequence seq_tblAvailableSubject;
create sequence seq_tblAvailableSubject;

CREATE TABLE tblAvailableSubject
(
    availableSubjectSeq number NOT NULL,
    teacherSeq          number NOT NULL references tblTeacher (teacherSeq),
    subjectSeq          number NOT NULL references tblSubject (subjectSeq)
);
alter table tblAvailableSubject
    add constraint tblAvailableSubject_pk primary key (availableSubjectSeq);

CREATE TABLE tblClass
(
    classSeq      number NOT NULL,
    studentSeq    number NOT NULL references tblStudent (studentSeq),
    openCourseSeq number NOT NULL references tblOpenCourse (openCourseSeq)
);
alter table tblClass
    add constraint tblclass_pk primary key (classSeq);

CREATE TABLE tblExam
(
    examSeq        number        NOT NULL,
    gradeEnter     varchar2(10)  NULL,
    examFile       varchar2(100) NULL,
    examDate       date          NULL,
    openSubjectSeq number        NOT NULL references tblOpenSubject (openSubjectSeq)
);
alter table tblExam
    add constraint tblExam_pk primary key (examSeq);

CREATE TABLE tblAttend
(
    attendSeq  number       NOT NULL,
    inTime     date         NULL,
    outTime    date         NULL,
    attendance varchar2(10) NOT NULL,
    reason     varchar2(10) NULL,
    classSeq   number       NOT NULL references tblClass (classSeq)
);
alter table tblAttend
    add constraint tblAttend_pk primary key (attendSeq);

alter table tblAttend
    add constraint tblAttend_attendace_ck check (attendance in ('정상', '지각', '조퇴', '외출', '병가', '기타'));


CREATE TABLE tblHire
(
    companySeq          number       NOT NULL,
    companyName         varchar2(50) NOT NULL,
    conpanyAnnualSalary number       NULL,
    companyScale        varchar2(20) NOT NULL,
    companyArea         varchar2(30) NOT NULL,
    workingType         varchar2(20) NOT NULL,
    career              varchar2(10) NOT NULL
--     hireDeadTerm        DATE         NOT NULL
);
alter table tblHire
    add constraint tblHire_pk primary key (companySeq);

-- alter table tblHire
--     add constraint tblHire_pk primary key (companySeq);
CREATE TABLE tblEmpStat
(
    empMangSeq number NOT NULL,
    companySeq number NOT NULL references tblHire (companySeq),
    classSeq   number NOT NULL references tblClass (classSeq)
);
alter table tblEmpStat
    add constraint tblEmpStat_pk primary key (empMangSeq);

CREATE TABLE tblClassSchedule
(
    classScheduleSeq number       NOT NULL,
    classState       varchar2(15) NOT NULL,
    teacherSeq       number       NOT NULL references tblTeacher (teacherSeq)
);
alter table tblClassSchedule
    add constraint tblClassSchedule_pk primary key (classScheduleSeq);

alter table tblClassSchedule
    add constraint tblClassSchedule_classState_ck check (classState in ('강의예정', '강의중', '강의종료') );

CREATE TABLE tblRate
(
    rateSeq        number NOT NULL,
    attendRate     number NOT NULL,
    performRate    number NOT NULL,
    writeRate      number NOT NULL,
    openSubjectSeq number NOT NULL references tblOpenSubject (openSubjectSeq)
);
alter table tblRate
    add constraint tblRate_pk primary key (rateSeq);


CREATE TABLE tblProgress
(
    progressSeq    number               NOT NULL,
    regDate        date default sysdate NOT NULL,
    understand     number               NOT NULL,
    speed          number               NOT NULL,
    openSubjectSeq number               NOT NULL references tblOpenSubject (openSubjectSeq),
    classSeq       number               NOT NULL references tblClass (classSeq)
);
alter table tblProgress
    add constraint tblProgress_pk primary key (progressSeq);



CREATE TABLE tblProject
(
    projectSeq        number                      NOT NULL,
    projectRegist     varchar2(300) default '미제출' NULL,
    projectSubmitDate date                        NULL,
    teamSeq           number                      NOT NULL references tblteam (teamSeq)
);
alter table tblProject
    add constraint tblProject_pk primary key (projectSeq);

CREATE TABLE tblTeam
(
    teamSeq  number NOT NULL,
    classSeq number NOT NULL references tblClass (classSeq)
);
alter table tblTeam
    add constraint tblTeam_pk primary key (teamSeq);

CREATE TABLE tblTask
(
    taskSeq        number                        NOT NULL,
    taskRegist     varchar2(200) default '미제출'   NULL,
    taskSubmitDate date          default sysdate NULL,
    openSubjectSeq number                        NOT NULL references tblOpenSubject (openSubjectSeq),
    classSeq       number                        NOT NULL references tblClass (classSeq)
);
alter table tblTask
    add constraint tblTask_pk primary key (taskSeq);

CREATE TABLE tblTaskFeedback
(
    taskseq             number        NOT NULL references tblTask (taskSeq),
    taskFeedbackContent varchar2(200) NULL
);
alter table tblTaskFeedback
    add constraint tblTaskFeedback_pk primary key (taskseq);

CREATE TABLE tblProjectFeedback
(
    projectSeq             number        NOT NULL references tblProject (projectSeq),
    projectFeedbackContent varchar2(200) NULL
);
alter table tblProjectFeedback
    add constraint tblProjectFeedback_pk primary key (projectSeq);


CREATE TABLE tblGrade
(
    gradeSeq     number NOT NULL,
    writeGrade   number NULL,
    performGrade number NULL,
    attendGrade  number NULL,
    classSeq     number NOT NULL references tblClass (classSeq)
);
alter table tblGrade
    add constraint tblGrade_pk primary key (gradeSeq);

alter table tblGrade
    add constraint tblGrade_attendGrade_ch check (attendGrade >= 20);

alter table tblGrade
    add constraint tblGrade_sumGrade_ch check ( writeGrade + performGrade + attendGrade = 100 );

CREATE TABLE tblStudent
(
    studentSeq       number               NOT NULL,
    name             varchar2(15)         NOT NULL,
    password         number               NOT NULL,
    tel              varchar2(50)         NOT NULL,
    retdate          date default sysdate NULL,
    classCount       number               NULL,
    status           varchar2(20)         NOT NULL,
    completionStatus varchar2(50)         NULL,
    completeDate     date                 NULL,
    faildate         date                 NULL
);
alter table tblStudent
    add constraint tblStudent_pk primary key (studentSeq);

alter table tblStudent
    add constraint tblStudent_status_ck check ( Status in ('수강신청', '수강중', '수강완료') );



CREATE SEQUENCE seq_ADMIN;
CREATE SEQUENCE seq_TBLATTNED;
CREATE SEQUENCE seq_TBLAVAILABLESUBJECT;
CREATE SEQUENCE seq_TBLBASICINFO;
CREATE SEQUENCE seq_TBLBOOK;
CREATE SEQUENCE seq_TBLCLASS;
CREATE SEQUENCE seq_TBLCLASSROOM;
CREATE SEQUENCE seq_TBLCOURSE;
CREATE SEQUENCE seq_TBLEMPSTAT;
CREATE SEQUENCE seq_TBLEXAM;
CREATE SEQUENCE seq_TBLGRADE;
CREATE SEQUENCE seq_TBLHIRE;
CREATE SEQUENCE seq_TBLOPENCOURSE;
CREATE SEQUENCE seq_TBLOPENSUBJECT;
CREATE SEQUENCE seq_TBLPROGRESS;
CREATE SEQUENCE seq_TBLPROJECT;
CREATE SEQUENCE seq_TBLRATE;
CREATE SEQUENCE seq_TBLSTUDENT;
CREATE SEQUENCE seq_TBLSUBJECT;
CREATE SEQUENCE seq_TBLTASK;
CREATE SEQUENCE seq_TBLTEACHER;
CREATE SEQUENCE seq_TBLTEAM;
CREATE SEQUENCE seq_tblClassSchedule;


COMMIT;