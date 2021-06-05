select *
from tbltask;
select *
from TBLOPENSUBJECT;

select *
from TBLCLASS;

select SUBJECTEND, o.OPENCOURSESEQ, c.CLASSSEQ
from tblopensubject o,
     tblclass c
where o.OPENCOURSESEQ = c.OPENCOURSESEQ;
select *
from tblopensubject o,
     tblclass c;
select SUBJECTEND, o.OPENCOURSESEQ, T.CLASSSEQ
from tblopensubject o
         inner join TBLCLASS T on o.OPENCOURSESEQ = T.OPENCOURSESEQ;


select t3.SUBJECTEND, t3.OPENSUBJECTSEQ, t.CLASSSEQ
from tblclass T
         inner join TBLOPENCOURSE T2 on t.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T2.OPENCOURSESEQ = T3.OPENCOURSESEQ;

insert into tbltask (taskseq, TASKSUBMITDATE, OPENSUBJECTSEQ, CLASSSEQ)
select rownum, SUBJECTEND, o.OPENCOURSESEQ, c.CLASSSEQ
from tblopensubject o,
     tblclass c
where o.OPENCOURSESEQ = c.OPENCOURSESEQ;

insert into tbltask(taskseq, TASKSUBMITDATE, OPENSUBJECTSEQ, classseq)
select rownum, t3.SUBJECTEND, t3.OPENSUBJECTSEQ, t.CLASSSEQ
from tblclass T
         inner join TBLOPENCOURSE T2 on t.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T2.OPENCOURSESEQ = T3.OPENCOURSESEQ;
commit;
delete
from tbltask;
update tbltask
set taskregist = '제출'
where (substr(tasksubmitdate, 1, 10) < sysdate);
select substr(tasksubmitdate, 1, 10)
from tbltask );

select *
from tbltask
where TASKREGIST = '제출';

commit;



select *
from TBLTASKFEEDBACK;
insert into TBLTASKFEEDBACK(taskseq)
select rownum, t3.SUBJECTEND, t3.OPENSUBJECTSEQ, t.CLASSSEQ
from tblclass T
         inner join TBLOPENCOURSE T2 on t.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T2.OPENCOURSESEQ = T3.OPENCOURSESEQ;

select DBMS_RANDOM.STRING('A', 10)
from dual;



lorem ipsum
https://
go.codetogether.com/
#/
VxDGbtyui1qSxOgZNW4nI4/
tz4prAknIPKpebBvlW40L9
delete
from TBLTASKFEEDBACK;
select *
from TBLTASKFEEDBACK;
commit;


select *
from tblproject;
select *
from tblteam;

select distinct T3.SUBJECTEND, t5.SUBJECTNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ;
-- inner join TBLAVAILABLESUBJECT T3 on T3.AVAILABLESUBJECTSEQ = T.AVAILABLESUBJECTSEQ
-- inner join TBLSUBJECT T4 on T4.SUBJECTSEQ = T3.SUBJECTSEQ;
-- 2021-03-10 00:00:00,오라클을 사용한 RDBMS의 SQL과 PL/SQL
-- 2021-04-04 00:00:00,Front-end 클라이언트 화면설계 및 구현
-- 2021-05-12 00:00:00,Back-end 서버프로그래밍 설계 및 구현
-- 2021-02-15 00:00:00,Java OpenJDK Programming
-- 2021-06-22 00:00:00,클라우드 시스템 개요 및 AWS 서비스 요소

select *
from tblopensubject;

select *
from tblsubject;

select *
from tblproject;
begin
    for i in 1..30
        loop
            insert into tblproject(projectseq, teamseq) values (SEQ_TBLPROJECT.nextval, SEQ_TBLPROJECT.currval);
        end loop;
end;


insert into tblproject(PROJECTREGIST, PROJECTSUBMITDATE)
select distinct t5.SUBJECTNAME || '프로젝트', T3.SUBJECTEND
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ;

delete
from tblproject;

-- 2021-03-10 00:00:00,오라클을 사용한 RDBMS의 SQL과 PL/SQL
-- 2021-04-04 00:00:00,Front-end 클라이언트 화면설계 및 구현
-- 2021-05-12 00:00:00,Back-end 서버프로그래밍 설계 및 구현
-- 2021-02-15 00:00:00,Java OpenJDK Programming
-- 2021-06-22 00:00:00,클라우드 시스템 개요 및 AWS 서비스 요소
commit;
select *
from tblproject t
-- inner join TBLTEAM T2 on T2.TEAMSEQ = t.TEAMSEQ;

commit;

select * from TBLEMPSTAT;
select *
from TBLCLASS T1
inner
;

insert into tblempstat values (1,176, '취업');
insert into tblempstat values (2,177, '취업');
insert into tblempstat values (3,178, '취업');
insert into tblempstat values (4,179, '취업');
insert into tblempstat values (5,180, '취업');
insert into tblempstat values (6,181, '취업');
insert into tblempstat values (7,182, '취업');
insert into tblempstat values (8,183, '취업');
insert into tblempstat values (9,184, '취업');
insert into tblempstat values (10,185, '취업');
insert into tblempstat values (11,186, '취업');
insert into tblempstat values (12,187, '취업');
insert into tblempstat values (13,188, '취업');
insert into tblempstat values (14,189, '취업');
insert into tblempstat values (15,190, '취업');
insert into tblempstat values (16,191, '취업');
insert into tblempstat values (17,192, '취업');
insert into tblempstat values (18,193, '취업');
insert into tblempstat values (19,194, '취업');
insert into tblempstat values (20,195, '취업');
insert into tblempstat values (21,196, '취업');
insert into tblempstat values (22,197, '취업');
insert into tblempstat values (23,198, '취업');
insert into tblempstat values (24,199, '취업');
insert into tblempstat values (25,200, '취업');
insert into tblempstat values (26,201, '취업');
insert into tblempstat values (27,202, '취업');
insert into tblempstat values (28,203, '취업');
insert into tblempstat values (29,204, '취업');
insert into tblempstat values (30,205, '취업');

select * from TBLCLASS;
ALTER TABLE tblproject DROP COLUMN teamseq;
[문법] ALTER TABLE 테이블명 ADD(컬럼명 데이타타입(사이즈));
alter table tblproject add(teamseq number);
select * from tblproject;
alter table tblproject add FOREIGN KEY(teamseq) REFERENCES tblteam(teamname);
ALTER TABLE tblteam ADD UNIQUE (teamname);
ALTER TABLE tblproject
ADD
FOREIGN KEY (teamseq)
REFERENCES tblteam (teamname);
-- tblproject 팀이름 외래키 힘듦... 팀이름이 primary, unique key가 될수 없음...
-- 새로운 컬럼이나 관계의 변화가 필요함.


insert into tblempstat values ();




select * from tblteam;
-- 답이안나와 자바로...
insert into TBLTASKFEEDBACK
values (1, '알고리즘을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (2, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (3, '알고리즘을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (4, '가독성을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (5, '알고리즘을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (6, '가독성을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (7, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (8, '코딩을 참 잘했어요.');
insert into TBLTASKFEEDBACK
values (9, '가독성을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (10, '알고리즘을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (11, '가독성을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (12, '가독성을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (13, '가독성을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (14, '코딩을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (15, '알고리즘을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (16, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (17, '가독성을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (18, '알고리즘을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (19, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (20, '알고리즘을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (21, '가독성을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (22, '알고리즘을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (23, '가독성을 참 잘했어요.');
insert into TBLTASKFEEDBACK
values (24, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (25, '가독성을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (26, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (27, '알고리즘을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (28, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (29, '알고리즘을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (30, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (31, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (32, '가독성을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (33, '코딩을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (34, '코딩을 참 잘했어요.');
insert into TBLTASKFEEDBACK
values (35, '코딩을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (36, '알고리즘을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (37, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (38, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (39, '가독성을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (40, '코딩을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (41, '가독성을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (42, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (43, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (44, '코딩을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (45, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (46, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (47, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (48, '가독성을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (49, '가독성을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (50, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (51, '알고리즘을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (52, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (53, '코딩을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (54, '알고리즘을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (55, '가독성을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (56, '알고리즘을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (57, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (58, '코딩을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (59, '가독성을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (60, '코딩을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (61, '알고리즘을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (62, '알고리즘을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (63, '가독성을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (64, '알고리즘을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (65, '알고리즘을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (66, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (67, '가독성을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (68, '코딩을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (69, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (70, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (71, '가독성을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (72, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (73, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (74, '가독성을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (75, '코딩을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (76, '가독성을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (77, '가독성을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (78, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (79, '코딩을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (80, '알고리즘을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (81, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (82, '코딩을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (83, '알고리즘을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (84, '코딩을 참 잘했어요.');
insert into TBLTASKFEEDBACK
values (85, '코딩을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (86, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (87, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (88, '가독성을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (89, '코딩을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (90, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (91, '가독성을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (92, '알고리즘을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (93, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (94, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (95, '알고리즘을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (96, '가독성을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (97, '알고리즘을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (98, '가독성을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (99, '가독성을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (100, '알고리즘을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (101, '알고리즘을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (102, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (103, '코딩을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (104, '알고리즘을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (105, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (106, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (107, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (108, '알고리즘을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (109, '코딩을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (110, '코딩을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (111, '코딩을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (112, '가독성을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (113, '알고리즘을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (114, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (115, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (116, '가독성을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (117, '코딩을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (118, '가독성을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (119, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (120, '코딩을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (151, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (152, '가독성을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (153, '코딩을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (154, '코딩을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (155, '코딩을 참 잘했어요.');
insert into TBLTASKFEEDBACK
values (156, '가독성을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (157, '가독성을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (158, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (159, '가독성을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (160, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (161, '알고리즘을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (162, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (163, '코딩을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (164, '코딩을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (165, '가독성을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (166, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (167, '알고리즘을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (168, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (169, '알고리즘을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (170, '코딩을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (171, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (172, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (173, '가독성을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (174, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (175, '알고리즘을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (176, '알고리즘을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (177, '코딩을 참 잘했어요.');
insert into TBLTASKFEEDBACK
values (178, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (179, '코딩을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (180, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (181, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (182, '알고리즘을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (183, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (184, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (185, '알고리즘을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (186, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (187, '코딩을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (188, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (189, '알고리즘을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (190, '코딩을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (191, '알고리즘을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (192, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (193, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (194, '알고리즘을 참 잘했어요.');
insert into TBLTASKFEEDBACK
values (195, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (196, '가독성을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (197, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (198, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (199, '알고리즘을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (200, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (201, '알고리즘을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (202, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (203, '가독성을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (204, '가독성을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (205, '가독성을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (206, '가독성을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (207, '알고리즘을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (208, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (209, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (210, '코딩을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (211, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (212, '가독성을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (213, '코딩을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (214, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (215, '가독성을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (216, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (217, '코딩을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (218, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (219, '코딩을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (220, '알고리즘을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (221, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (222, '가독성을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (223, '알고리즘을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (224, '코딩을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (225, '알고리즘을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (226, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (227, '가독성을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (228, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (229, '가독성을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (230, '가독성을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (231, '가독성을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (232, '코딩을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (233, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (234, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (235, '알고리즘을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (236, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (237, '코딩을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (238, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (239, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (240, '코딩을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (241, '알고리즘을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (242, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (243, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (244, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (245, '코딩을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (246, '알고리즘을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (247, '코딩을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (248, '가독성을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (249, '알고리즘을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (250, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (251, '알고리즘을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (252, '코딩을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (253, '알고리즘을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (254, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (255, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (256, '알고리즘을 참 잘했어요.');
insert into TBLTASKFEEDBACK
values (257, '알고리즘을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (258, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (259, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (260, '가독성을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (261, '코딩을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (262, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (263, '알고리즘을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (264, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (265, '코딩을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (266, '가독성을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (267, '알고리즘을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (268, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (269, '코딩을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (270, '가독성을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (271, '알고리즘을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (272, '코딩을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (273, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (274, '코딩을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (275, '가독성을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (276, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (277, '코딩을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (278, '코딩을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (279, '코딩을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (280, '코딩을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (281, '코딩을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (282, '알고리즘을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (283, '코딩을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (284, '가독성을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (285, '코딩을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (286, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (287, '코딩을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (288, '가독성을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (289, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (290, '코딩을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (291, '코딩을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (292, '알고리즘을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (293, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (294, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (295, '가독성을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (296, '코딩을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (297, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (298, '알고리즘을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (299, '가독성을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (300, '가독성을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (301, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (302, '코딩을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (303, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (304, '코딩을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (305, '코딩을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (306, '가독성을 참 잘했어요.');
insert into TBLTASKFEEDBACK
values (307, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (308, '코딩을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (309, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (310, '알고리즘을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (311, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (312, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (313, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (314, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (315, '알고리즘을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (316, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (317, '가독성을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (318, '가독성을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (319, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (320, '코딩을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (321, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (322, '알고리즘을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (323, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (324, '코딩을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (325, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (326, '알고리즘을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (327, '알고리즘을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (328, '알고리즘을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (329, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (330, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (331, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (332, '알고리즘을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (333, '알고리즘을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (334, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (335, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (336, '코딩을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (337, '알고리즘을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (338, '알고리즘을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (339, '코딩을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (340, '알고리즘을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (341, '코딩을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (342, '알고리즘을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (343, '코딩을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (344, '가독성을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (345, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (346, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (347, '코딩을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (348, '코딩을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (349, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (350, '가독성을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (351, '코딩을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (352, '코딩을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (353, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (354, '가독성을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (355, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (356, '가독성을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (357, '알고리즘을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (358, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (359, '알고리즘을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (360, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (535, '가독성을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (536, '코딩을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (537, '가독성을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (538, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (539, '알고리즘을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (540, '가독성을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (541, '코딩을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (542, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (543, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (544, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (545, '코딩을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (546, '알고리즘을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (547, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (548, '코딩을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (549, '알고리즘을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (550, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (551, '알고리즘을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (552, '코딩을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (553, '알고리즘을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (554, '알고리즘을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (555, '알고리즘을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (556, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (557, '코딩을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (558, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (559, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (560, '코딩을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (561, '코딩을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (562, '코딩을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (563, '가독성을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (564, '가독성을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (565, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (566, '코딩을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (567, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (568, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (569, '알고리즘을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (570, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (571, '알고리즘을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (572, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (573, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (574, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (575, '가독성을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (576, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (577, '알고리즘을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (578, '코딩을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (579, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (580, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (581, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (582, '알고리즘을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (583, '알고리즘을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (584, '코딩을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (585, '코딩을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (586, '알고리즘을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (587, '코딩을 매우 잘했어요.');
insert into TBLTASKFEEDBACK
values (588, '코딩을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (589, '알고리즘을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (590, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (591, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (592, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (593, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (594, '코딩을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (595, '코딩을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (596, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (597, '알고리즘을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (598, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (599, '알고리즘을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (600, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (601, '가독성을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (602, '가독성을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (603, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (604, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (605, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (606, '알고리즘을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (607, '코딩을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (608, '코딩을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (609, '코딩을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (610, '알고리즘을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (611, '가독성을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (612, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (613, '알고리즘을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (614, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (615, '알고리즘을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (616, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (617, '알고리즘을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (618, '알고리즘을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (619, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (620, '알고리즘을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (621, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (622, '가독성을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (623, '코딩을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (624, '알고리즘을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (715, '가독성을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (716, '가독성을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (717, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (718, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (719, '가독성을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (720, '코딩을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (721, '코딩을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (722, '알고리즘을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (723, '알고리즘을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (724, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (725, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (726, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (727, '코딩을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (728, '가독성을 정말 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (729, '가독성을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (730, '가독성을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (731, '가독성을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (732, '코딩을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (733, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (734, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (735, '코딩을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (736, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (737, '알고리즘을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (738, '알고리즘을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (739, '알고리즘을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (740, '알고리즘을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (741, '가독성을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (742, '알고리즘을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (743, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (744, '코딩을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (745, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (932, '알고리즘을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (933, '코딩을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (934, '코딩을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (935, '코딩을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (936, '알고리즘을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (937, '가독성을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (938, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (939, '가독성을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (940, '코딩을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (941, '알고리즘을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (942, '코딩을 매우 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (943, '가독성을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (944, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (945, '가독성을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (946, '알고리즘을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (947, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (948, '가독성을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (949, '코딩을 아주 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (950, '가독성을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (951, '코딩을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (952, '가독성을 정말 잘했어요');
insert into TBLTASKFEEDBACK
values (953, '가독성을 매우 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (954, '알고리즘을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (955, '코딩을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (956, '코딩을 정말 잘했어요.');
insert into TBLTASKFEEDBACK
values (957, '코딩을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (958, '알고리즘을 정말 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (959, '가독성을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (960, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (961, '코딩을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (962, '코딩을 정말 칭찬합니다');
insert into TBLTASKFEEDBACK
values (963, '가독성을 매우 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (964, '알고리즘을 참 잘했어요.');
insert into TBLTASKFEEDBACK
values (965, '알고리즘을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (966, '알고리즘을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (967, '코딩을 매우 칭찬합니다');
insert into TBLTASKFEEDBACK
values (968, '알고리즘을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (969, '가독성을 매우 잘했어요');
insert into TBLTASKFEEDBACK
values (970, '가독성을 아주 잘했어요.');
insert into TBLTASKFEEDBACK
values (971, '알고리즘을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (972, '가독성을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (973, '알고리즘을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (974, '알고리즘을 참 칭찬합니다');
insert into TBLTASKFEEDBACK
values (975, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (976, '알고리즘을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (977, '알고리즘을 참 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (978, '알고리즘을 정말 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (979, '가독성을 아주 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (980, '가독성을 참 잘했어요');
insert into TBLTASKFEEDBACK
values (981, '가독성을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (982, '알고리즘을 참 아쉽습니다.');
insert into TBLTASKFEEDBACK
values (983, '코딩을 아주 멋지게 했습니다.');
insert into TBLTASKFEEDBACK
values (984, '코딩을 아주 잘했어요');
insert into TBLTASKFEEDBACK
values (985, '코딩을 참 칭찬합니다.');
insert into TBLTASKFEEDBACK
values (986, '가독성을 아주 칭찬합니다');
insert into TBLTASKFEEDBACK
values (987, '가독성을 아주 칭찬합니다');