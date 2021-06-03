CREATE TABLE "tblTeacher"
(
    "teacherSeq"     number       NOT NULL,
    "teacherName"    varchar2(15) NOT NULL,
    "password"       number       NOT NULL,
    "teacherTel"     number       NOT NULL,
    "openSubjectSeq" number       NOT NULL
);

CREATE TABLE "tblClassRoom"
(
    "classRoomSeq"       number       NOT NULL,
    "classRoomName"      varchar2(15) NOT NULL,
    "classRoomPersonnel" number       NOT NULL
);

CREATE TABLE "tblBook"
(
    "bookSeq"       number       NOT NULL,
    "bookName"      varchar2(50) NOT NULL,
    "publisherName" varchar2(50) NOT NULL
);

CREATE TABLE "tblSubject"
(
    "subjectSeq"  number       NOT NULL,
    "subjectName" varchar2(20) NOT NULL
);

CREATE TABLE "tblCourse"
(
    "courseSeq"  number       NOT NULL,
    "courseName" varchar2(50) NOT NULL,
    "courseTerm" number       NOT NULL
);

CREATE TABLE "tblBasicInfo"
(
    "basicInfoSeq" number NOT NULL,
    "courseSeq"    number NOT NULL,
    "subjectSeq"   number NOT NULL,
    "classRoomSeq" number NOT NULL,
    "bookSeq"      number NOT NULL
);

CREATE TABLE "tblOpenCourse"
(
    "openCourseSeq"       number       NOT NULL,
    "courseState"         varchar2(10) NOT NULL,
    "openSubjectRegister" varchar2(10) NULL,
    "studentRegister"     varchar2(10) NOT NULL,
    "courseStart"         date         NOT NULL,
    "courseEnd"           date         NOT NULL,
    "courseSeq"           number       NOT NULL,
    "classRoomSeq"        number       NOT NULL
);

CREATE TABLE "tblOpenSubject"
(
    "openSubjectSeq" number NOT NULL,
    "subjectStart"   date   NOT NULL,
    "subjectEnd"     date   NOT NULL,
    "subjectSeq"     number NOT NULL
);

CREATE TABLE "tblAvailableSubject"
(
    "availableSubjectSeq" number NOT NULL,
    "teacherSeq"          number NOT NULL,
    "subjectSeq"          number NOT NULL
);

CREATE TABLE "tblClass"
(
    "classSeq"      number NOT NULL,
    "studentSeq"    number NOT NULL,
    "openCourseSeq" number NOT NULL
);

CREATE TABLE "tblExam"
(
    "examSeq"        number        NOT NULL,
    "gradeEnter"     varchar2(10)  NULL,
    "examFile"       varchar2(100) NULL,
    "examDate"       date          NULL,
    "gradeSeq"       number        NOT NULL,
    "openSubjectSeq" number        NOT NULL
);

CREATE TABLE "tblAttend"
(
    "attendSeq"  number       NOT NULL,
    "inTime"     date         NULL,
    "outTime"    date         NULL,
    "attendance" varchar2(10) NOT NULL,
    "reason"     varchar2(10) NULL,
    "classSeq"   number       NOT NULL
);

CREATE TABLE "tblHire"
(
    "companySeq"          number       NOT NULL,
    "companyName"         varchar2(50) NOT NULL,
    "conpanyAnnualSalary" number       NULL,
    "companyScale"        varchar2(20) NOT NULL,
    "companyArea"         varchar2(30) NOT NULL,
    "workingType"         varchar2(20) NOT NULL,
    "career"              varchar2(10) NOT NULL
);

CREATE TABLE "tblEmpStat"
(
    "empMangSeq" number NOT NULL,
    "companySeq" number NOT NULL,
    "classSeq"   number NOT NULL
);

CREATE TABLE "tblClassSchedule"
(
    "classScheduleSeq" number       NOT NULL,
    "classState"       varchar2(15) NOT NULL,
    "teacherSeq"       number       NOT NULL
);

CREATE TABLE "tblRate"
(
    "rateSeq"        number NOT NULL,
    "attendRate"     number NOT NULL,
    "performRate"    number NOT NULL,
    "writeRate"      number NOT NULL,
    "openSubjectSeq" number NOT NULL
);

CREATE TABLE "tblProgress"
(
    "progressSeq"    number NOT NULL,
    "regDate"        date   NOT NULL,
    "understand"     number NOT NULL,
    "speed"          number NOT NULL,
    "openSubjectSeq" number NOT NULL,
    "classSeq"       number NOT NULL
);

CREATE TABLE "tblProject"
(
    "projectSeq"        number        NOT NULL,
    "projectRegist"     varchar2(300) NULL,
    "projectSubmitDate" date          NULL,
    "teamSeq2"          number        NOT NULL
);

CREATE TABLE "tblTeam"
(
    "teamSeq"  number NOT NULL,
    "classSeq" number NOT NULL
);

CREATE TABLE "tblTaskFeedback"
(
    "taskSeq2"            number        NOT NULL,
    "taskFeedbackContent" varchar2(200) NULL
);

CREATE TABLE "tblProjectFeedback"
(
    "projectSeq2"            number        NOT NULL,
    "projectFeedbackContent" varchar2(200) NULL
);

CREATE TABLE "tblGrade"
(
    "gradeSeq"     number NOT NULL,
    "writeGrade"   number NULL,
    "performGrade" number NULL,
    "attendGrade"  number NULL,
    "classSeq"     number NOT NULL
);

CREATE TABLE "tblStudent"
(
    "studentSeq"       number       NOT NULL,
    "name"             varchar2(15) NOT NULL,
    "password"         number       NOT NULL,
    "tel"              varchar2(50) NOT NULL,
    "retdate"          date         NULL,
    "classCount"       number       NULL,
    "completionStatus" varchar2(50) NULL,
    "completeDate"     date         NULL,
    "faildate"         date         NULL
);

CREATE TABLE "tblTask"
(
    "taskSeq"        number        NOT NULL,
    "taskRegist"     varchar2(200) NULL,
    "taskSubmitDate" date          NULL,
    "openSubjectSeq" number        NOT NULL,
    "classSeq"       number        NOT NULL
);

ALTER TABLE "tblTeacher"
    ADD CONSTRAINT "PK_TBLTEACHER" PRIMARY KEY (
                                                "teacherSeq"
        );

ALTER TABLE "tblClassRoom"
    ADD CONSTRAINT "PK_TBLCLASSROOM" PRIMARY KEY (
                                                  "classRoomSeq"
        );

ALTER TABLE "tblBook"
    ADD CONSTRAINT "PK_TBLBOOK" PRIMARY KEY (
                                             "bookSeq"
        );

ALTER TABLE "tblSubject"
    ADD CONSTRAINT "PK_TBLSUBJECT" PRIMARY KEY (
                                                "subjectSeq"
        );

ALTER TABLE "tblCourse"
    ADD CONSTRAINT "PK_TBLCOURSE" PRIMARY KEY (
                                               "courseSeq"
        );

ALTER TABLE "tblBasicInfo"
    ADD CONSTRAINT "PK_TBLBASICINFO" PRIMARY KEY (
                                                  "basicInfoSeq"
        );

ALTER TABLE "tblOpenCourse"
    ADD CONSTRAINT "PK_TBLOPENCOURSE" PRIMARY KEY (
                                                   "openCourseSeq"
        );

ALTER TABLE "tblOpenSubject"
    ADD CONSTRAINT "PK_TBLOPENSUBJECT" PRIMARY KEY (
                                                    "openSubjectSeq"
        );

ALTER TABLE "tblAvailableSubject"
    ADD CONSTRAINT "PK_TBLAVAILABLESUBJECT" PRIMARY KEY (
                                                         "availableSubjectSeq"
        );

ALTER TABLE "tblClass"
    ADD CONSTRAINT "PK_TBLCLASS" PRIMARY KEY (
                                              "classSeq"
        );

ALTER TABLE "tblExam"
    ADD CONSTRAINT "PK_TBLEXAM" PRIMARY KEY (
                                             "examSeq"
        );

ALTER TABLE "tblAttend"
    ADD CONSTRAINT "PK_TBLATTEND" PRIMARY KEY (
                                               "attendSeq"
        );

ALTER TABLE "tblHire"
    ADD CONSTRAINT "PK_TBLHIRE" PRIMARY KEY (
                                             "companySeq"
        );

ALTER TABLE "tblEmpStat"
    ADD CONSTRAINT "PK_TBLEMPSTAT" PRIMARY KEY (
                                                "empMangSeq"
        );

ALTER TABLE "tblClassSchedule"
    ADD CONSTRAINT "PK_TBLCLASSSCHEDULE" PRIMARY KEY (
                                                      "classScheduleSeq"
        );

ALTER TABLE "tblRate"
    ADD CONSTRAINT "PK_TBLRATE" PRIMARY KEY (
                                             "rateSeq"
        );

ALTER TABLE "tblProgress"
    ADD CONSTRAINT "PK_TBLPROGRESS" PRIMARY KEY (
                                                 "progressSeq"
        );

ALTER TABLE "tblProject"
    ADD CONSTRAINT "PK_TBLPROJECT" PRIMARY KEY (
                                                "projectSeq"
        );

ALTER TABLE "tblTeam"
    ADD CONSTRAINT "PK_TBLTEAM" PRIMARY KEY (
                                             "teamSeq"
        );

ALTER TABLE "tblTaskFeedback"
    ADD CONSTRAINT "PK_TBLTASKFEEDBACK" PRIMARY KEY (
                                                     "taskSeq2"
        );

ALTER TABLE "tblProjectFeedback"
    ADD CONSTRAINT "PK_TBLPROJECTFEEDBACK" PRIMARY KEY (
                                                        "projectSeq2"
        );

ALTER TABLE "tblGrade"
    ADD CONSTRAINT "PK_TBLGRADE" PRIMARY KEY (
                                              "gradeSeq"
        );

ALTER TABLE "tblStudent"
    ADD CONSTRAINT "PK_TBLSTUDENT" PRIMARY KEY (
                                                "studentSeq"
        );

ALTER TABLE "tblTask"
    ADD CONSTRAINT "PK_TBLTASK" PRIMARY KEY (
                                             "taskSeq"
        );

ALTER TABLE "tblTaskFeedback"
    ADD CONSTRAINT "FK_tblTask_TO_tblTaskFeedback_1" FOREIGN KEY (
                                                                  "taskSeq2"
        )
        REFERENCES "tblTask" (
                              "taskSeq"
            );

ALTER TABLE "tblProjectFeedback"
    ADD CONSTRAINT "FK_tblProject_TO_tblProjectFeedback_1" FOREIGN KEY (
                                                                        "projectSeq2"
        )
        REFERENCES "tblProject" (
                                 "projectSeq"
            );

