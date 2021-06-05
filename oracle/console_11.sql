-- 개설된 과정
insert into TBLOPENCOURSE
values (1, '강의중', '등록', 30, TO_DATE('2021-01-05', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2021-01-05', 'YYYY-MM-DD'), 6), 1,
        1);
insert into TBLOPENCOURSE
values (2, '강의중', '등록', 26, TO_DATE('2021-02-08', 'YYYY-MM-DD'),
        ADD_MONTHS(TO_DATE('2021-02-08', 'YYYY-MM-DD'), 5) + 15, 7, 4);
insert into TBLOPENCOURSE
values (3, '강의중', '등록', 30, TO_DATE('2021-03-29', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2021-03-29', 'YYYY-MM-DD'), 7), 10,
        2);
insert into TBLOPENCOURSE
values (4, '강의중', '등록', 26, TO_DATE('2021-04-12', 'YYYY-MM-DD'),
        ADD_MONTHS(TO_DATE('2021-04-12', 'YYYY-MM-DD'), 5) + 15, 8, 5);
insert into TBLOPENCOURSE
values (5, '강의중', '등록', 30, TO_DATE('2021-05-28', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2021-05-28', 'YYYY-MM-DD'), 6), 3,
        3);
insert into TBLOPENCOURSE
values (6, '강의중', '등록', 26, TO_DATE('2021-06-01', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2021-06-01', 'YYYY-MM-DD'), 6), 9,
        6);
insert into TBLOPENCOURSE
values (7, '강의예정', '미등록', 30, TO_DATE('2021-07-08', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2021-07-08', 'YYYY-MM-DD'), 6),
        2, 1);
insert into TBLOPENCOURSE
values (8, '강의예정', '미등록', 30, TO_DATE('2021-07-28', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2021-07-28', 'YYYY-MM-DD'), 7),
        4, 2);
insert into TBLOPENCOURSE
values (9, '강의예정', '미등록', 26, TO_DATE('2021-09-30', 'YYYY-MM-DD'),
        ADD_MONTHS(TO_DATE('2021-09-30', 'YYYY-MM-DD'), 5) + 15, 11, 4);
insert into TBLOPENCOURSE
values (10, '강의예정', '미등록', 30, TO_DATE('2021-11-02', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2021-11-02', 'YYYY-MM-DD'), 6),
        3, 3);
insert into TBLOPENCOURSE
values (11, '강의예정', '미등록', 26, TO_DATE('2021-12-01', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2021-12-01', 'YYYY-MM-DD'), 6),
        1, 5);
insert into TBLOPENCOURSE
values (12, '강의완료', '등록', 30, TO_DATE('2020-01-05', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2020-01-05', 'YYYY-MM-DD'), 6),
        1, 1);
insert into TBLOPENCOURSE
values (13, '강의완료', '등록', 26, TO_DATE('2020-02-08', 'YYYY-MM-DD'),
        ADD_MONTHS(TO_DATE('2020-02-08', 'YYYY-MM-DD'), 5) + 15, 7, 4);
insert into TBLOPENCOURSE
values (14, '강의완료', '등록', 30, TO_DATE('2020-03-29', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2020-03-29', 'YYYY-MM-DD'), 7),
        10, 2);
insert into TBLOPENCOURSE
values (15, '강의완료', '등록', 26, TO_DATE('2020-04-12', 'YYYY-MM-DD'),
        ADD_MONTHS(TO_DATE('2020-04-12', 'YYYY-MM-DD'), 5) + 15, 8, 5);
insert into TBLOPENCOURSE
values (16, '강의완료', '등록', 30, TO_DATE('2020-05-28', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2020-05-28', 'YYYY-MM-DD'), 6),
        3, 3);
insert into TBLOPENCOURSE
values (17, '강의완료', '등록', 26, TO_DATE('2020-06-01', 'YYYY-MM-DD'), ADD_MONTHS(TO_DATE('2020-06-01', 'YYYY-MM-DD'), 6),
        9, 6);


-- 과정
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'JAVA 기반의 스마트 웹 앱콘텐츠 양성과정', 6); --7
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Python & Java 응용SW실무개발자 양성과정', 6); --1
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Framework 기반의 빅데이터 활용 응용프로그래머 양성과정', 6); --5
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, '자바 기반 융합형 SW개발자 양성과정', 7);
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Python And Java를 활용한 AI 텍스트마이닝 개발자 양성과정', 7); --8
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, '빅데이터를 활용한 지능형 웹 콘텐츠 개발자 양성과정', 6); --10
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Java And JavaScript library를 활용한 반응형 웹 개발자 양성과정', 5.5); --9
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Java를 활용한 웹 응용SW개발자 양성과정', 5.5); --4
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, '파이썬과 자바를 연계한 머신러닝 활용 개발자 양성과정', 5.5); --2
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, '웹기반 빅데이터 분석 응용SW개발자 양성과정', 7); --3
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Java And Python 기반 응용SW개발자 양성과정', 5.5);

--과목
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Java 객체지향 프로그래밍 기초 및 활용', 22);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Java SE 기초 및 Network Programming', 28);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '클라우드 개발을 위한 자바 기초 프로그래밍', 22);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Java Network Programming', 21);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '객체지향과 Java SE', 9);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Java OpenJDK Programming', 29);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'JAVA 애플리케이션 구현', 18);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '객체지향 프로그래밍', 15);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'database Programming', 10);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '오라클을 사용한 RDBMS의 SQL과 PL/SQL', 15);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '데이터베이스 구조 설계 및 활용', 15);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '데이터베이스 설계 및 구축', 13);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '데이터베이스 구현', 15);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '데이터 분석기법 및 활용', 5);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Spring 서버기반의 지능형 웹 통합 개발 프로젝트 구축', 10);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Spring Framework 기반 백엔드 설계 및 구축', 13);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Back-End Server Programming', 26);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '반응형 웹 프로젝트', 15);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Web Publishing을 위한 Front-End 설계 및 구현', 20);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '웹 애플리케이션 프로그래밍', 18);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Front_end UI/UX 구현', 13);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Server Side 프로그래밍', 15);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '지능형 웹을 위한 애플리케이션 구축', 15);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Front-end 애플리케이션 구현', 15);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Spring Framework 기반 back-end 설계 및 구축', 38);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '프론트엔드 개발 기법', 15);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '벡엔드 개발 기법', 29);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '반응형 웹 개발기법Back-end', 15);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Back-end 웹 애플리케이션 구현', 12);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'AWS 클라우드 등록 설정 및 구축', 6);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'AWS 기반 통합 프로젝트', 7);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '임베디드 애플리케이션 구현', 5);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '공공 데이터 분석기법을 활용한 데이터 융합 프로젝트', 20);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '임베디드 애플리케이션 구현', 5);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '결함 식별을 위한 애플리케이션 테스트', 3);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '클라우드 시스템 개요 및 AWS 서비스 요소', 30);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'UML을 사용한 시스템 분석', 6);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '데스크탑 UI/UX 설계', 11);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '콘텐츠 추천 알고리즘 기법', 5);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '아두이노를 활용한 임베디드 프로그래밍', 23);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '멀티 플랫폼 기반 융합 실무 프로젝트', 7);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '임베디드 애플리케이션 구현', 9);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '풀스택 융합 프로젝트', 19);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Full-stack Framework 구현', 5);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '오픈플랫폼(Arduino)을 활용한 Embedded 융합프로젝트', 14);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '애플리케이션 배포', 5);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '융합기반 웹표준 프로젝트', 24);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, '콘텐츠 추천 알고리즘 기법', 5);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Front-end 클라이언트 화면설계 및 구현', 16);
insert into TBLSUBJECT
values (SEQ_TBLSUBJECT.nextval, 'Back-end 서버프로그래밍 설계 및 구현', 28);
-- 과목 변경 (왜래키 추가)
update tblsubject
set bookseq=4
where SUBJECTSEQ = 2;
update tblsubject
set bookseq=1
where SUBJECTSEQ = 3;
update tblsubject
set bookseq=1
where SUBJECTSEQ = 4;
update tblsubject
set bookseq=4
where SUBJECTSEQ = 5;
update tblsubject
set bookseq=1
where SUBJECTSEQ = 6;
update tblsubject
set bookseq=1
where SUBJECTSEQ = 7;
update tblsubject
set bookseq=4
where SUBJECTSEQ = 8;
update tblsubject
set bookseq=2
where SUBJECTSEQ = 9;
update tblsubject
set bookseq=2
where SUBJECTSEQ = 10;
update tblsubject
set bookseq=2
where SUBJECTSEQ = 11;
update tblsubject
set bookseq=2
where SUBJECTSEQ = 12;
update tblsubject
set bookseq=2
where SUBJECTSEQ = 13;
update tblsubject
set bookseq=2
where SUBJECTSEQ = 14;
update tblsubject
set bookseq=16
where SUBJECTSEQ = 15;
update tblsubject
set bookseq=25
where SUBJECTSEQ = 16;
update tblsubject
set bookseq=10
where SUBJECTSEQ = 17;
update tblsubject
set bookseq=17
where SUBJECTSEQ = 18;
update tblsubject
set bookseq=13
where SUBJECTSEQ = 19;
update tblsubject
set bookseq=19
where SUBJECTSEQ = 20;
update tblsubject
set bookseq=12
where SUBJECTSEQ = 21;
update tblsubject
set bookseq=14
where SUBJECTSEQ = 22;
update tblsubject
set bookseq=17
where SUBJECTSEQ = 23;
update tblsubject
set bookseq=13
where SUBJECTSEQ = 24;
update tblsubject
set bookseq=19
where SUBJECTSEQ = 25;
update tblsubject
set bookseq=18
where SUBJECTSEQ = 26;
update tblsubject
set bookseq=10
where SUBJECTSEQ = 27;
update tblsubject
set bookseq=10
where SUBJECTSEQ = 28;
update tblsubject
set bookseq=10
where SUBJECTSEQ = 29;
update tblsubject
set bookseq=7
where SUBJECTSEQ = 30;
update tblsubject
set bookseq=7
where SUBJECTSEQ = 31;
update tblsubject
set bookseq=22
where SUBJECTSEQ = 32;
update tblsubject
set bookseq=26
where SUBJECTSEQ = 33;
update tblsubject
set bookseq=22
where SUBJECTSEQ = 34;
update tblsubject
set bookseq=8
where SUBJECTSEQ = 35;
update tblsubject
set bookseq=7
where SUBJECTSEQ = 36;
update tblsubject
set bookseq=20
where SUBJECTSEQ = 37;
update tblsubject
set bookseq=13
where SUBJECTSEQ = 38;
update tblsubject
set bookseq=15
where SUBJECTSEQ = 39;
update tblsubject
set bookseq=22
where SUBJECTSEQ = 40;
update tblsubject
set bookseq=25
where SUBJECTSEQ = 41;
update tblsubject
set bookseq=22
where SUBJECTSEQ = 42;
update tblsubject
set bookseq=15
where SUBJECTSEQ = 43;
update tblsubject
set bookseq=15
where SUBJECTSEQ = 44;
update tblsubject
set bookseq=22
where SUBJECTSEQ = 45;
update tblsubject
set bookseq=9
where SUBJECTSEQ = 46;
update tblsubject
set bookseq=17
where SUBJECTSEQ = 47;
update tblsubject
set bookseq=15
where SUBJECTSEQ = 48;
update tblsubject
set bookseq=18
where SUBJECTSEQ = 49;
update tblsubject
set bookseq=10
where SUBJECTSEQ = 50;
update tblsubject
set bookseq=1
where SUBJECTSEQ = 1;

--과정
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'JAVA 기반의 스마트 웹 앱콘텐츠 양성과정', 6); --7
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Python & Java 응용SW실무개발자 양성과정', 6); --1
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Framework 기반의 빅데이터 활용 응용프로그래머 양성과정', 6); --5
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, '자바 기반 융합형 SW개발자 양성과정', 7);
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Python And Java를 활용한 AI 텍스트마이닝 개발자 양성과정', 7); --8
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, '빅데이터를 활용한 지능형 웹 콘텐츠 개발자 양성과정', 6); --10
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Java And JavaScript library를 활용한 반응형 웹 개발자 양성과정', 5.5); --9
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Java를 활용한 웹 응용SW개발자 양성과정', 5.5); --4
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, '파이썬과 자바를 연계한 머신러닝 활용 개발자 양성과정', 5.5); --2
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, '웹기반 빅데이터 분석 응용SW개발자 양성과정', 7); --3
INSERT INTO TBLCOURSE (courseseq, coursename, courseTerm)
VALUES (SEQ_TBLCOURSE.nextval, 'Java And Python 기반 응용SW개발자 양성과정', 5.5);


-- 과제 데이터 생성
insert into tbltask(taskseq, TASKSUBMITDATE, OPENSUBJECTSEQ, classseq)
select rownum, t3.SUBJECTEND, t3.OPENSUBJECTSEQ, t.CLASSSEQ
from tblclass T
         inner join TBLOPENCOURSE T2 on t.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T2.OPENCOURSESEQ = T3.OPENCOURSESEQ;


-- 과제 피드백 데이터 생성
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

select *
from tblexam;
select *
from tblexamFile;

select *
from TBLCOMPANY;





프로젝트 데이터 생성

declare
    v1 tblsubject.subjectseq%type;
    v2 tblteam.teamname%type;
    v3 tblopensubject.subjectend%type;
    v4 tblteam.teamseq%type;

    cursor vcursor is
        select distinct t5.SUBJECTSEQ, t1.TEAMNAME, rownum, t1.teamseq
        from tblteam t1
                 inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
                 inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
                 inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
                 inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
                 inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;
begin
    open vcursor;
    loop
        fetch vcursor into v1, v2, v3, v4;
        exit when vcursor%notfound;
        dbms_output.PUT_LINE('hello');
--         insert into tblproject
        select rownum, t5.SUBJECTNAME, T3.SUBJECTEND, t1.TEAMSEQ
        into v1, v2, v3, v4
        from tblteam t1
                 inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
                 inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
                 inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
                 inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
                 inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ
        where (v1, v2) in (
            select distinct t5.SUBJECTSEQ, t1.TEAMNAME
            from tblteam t1
                     inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
                     inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
                     inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
                     inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
                     inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ);
--         dbms_output.PUT_LINE(a || ',' || b|| ',' ||c|| ',' ||d);

        dbms_output.PUT_LINE(v1);
        dbms_output.PUT_LINE(v2);
        dbms_output.PUT_LINE(v3);
        dbms_output.PUT_LINE(v4);
    end loop;
end;
select * from tblproject;

insert into tblproject
    select rownum, t5.SUBJECTNAME || '프로젝트', T3.SUBJECTEND, t1.TEAMSEQ
    from tblteam t1
             inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
             inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
             inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
             inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
             inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ
    where (t5.subjectseq, t1.teamname) in (
        select distinct t5.SUBJECTSEQ, t1.TEAMNAME
        from tblteam t1
                 inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
                 inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
                 inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
                 inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
                 inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ);
end;
select *
from tblproject;
delete
from tblproject;


-- [23000][1]
-- ORA-00001: unique constraint (SIST2.SYS_C007851) violated
-- ORA-06512: at line 16 Position: 0
select rownum, t5.SUBJECTNAME || '프로젝트', T3.SUBJECTEND, t1.TEAMSEQ
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ
where (t5.subjectseq, t1.teamname) in (
    select distinct t5.SUBJECTSEQ, t1.TEAMNAME
    from tblteam t1
             inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
             inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
             inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
             inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
             inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ)
;

----------------------------------------Porject 시작--------------------------------------------------------------------
-- [23000][1]
-- ORA-00001: unique constraint (SIST2.SYS_C007851) violated
-- ORA-06512: at line 16 Position: 0
-- [23000][1]
-- ORA-00001: unique constraint (SIST2.TBLPROJECT_PK) violated
-- ORA-06512: at line 16 Position: 0
PROJECTSEQ        NUMBER not null
        constraint TBLPROJECT_PK
            primary key,
    PROJECTREGIST     VARCHAR2(300) default '미제출',
    PROJECTSUBMITDATE DATE,
declare
    v1 tblsubject.subjectseq%type;
    v2 tblteam.teamname%type;
    cursor vcursor is
        select distinct t5.SUBJECTSEQ, t1.TEAMNAME
        from tblteam t1
                 inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
                 inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
                 inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
                 inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
                 inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;
begin
    open vcursor;
    loop
        fetch vcursor into v1, v2;
        insert into tblproject (PROJECTSEQ)
        select rownum
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ
where (v1, v2) in (
    select distinct t5.SUBJECTSEQ, t1.TEAMNAME
    from tblteam t1
             inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
             inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
             inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
             inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
             inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ);
        exit when vcursor%notfound;
        dbms_output.PUT_LINE(v1);
        dbms_output.PUT_LINE(v2);
    end loop;
end;
------------------------------------------------------------------------------------------------------------
select * from tblproject;
        select rownum, t5.SUBJECTNAME || '프로젝트', T3.SUBJECTEND, t1.TEAMSEQ
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ
where (t5.subjectseq, t1.teamname) in (
    select distinct t5.SUBJECTSEQ, t1.TEAMNAME
    from tblteam t1
             inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
             inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
             inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
             inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
             inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ);



-- https://stackoverflow.com/questions/67817353/how-to-do-distinct-in-inner-join
select t5.SUBJECTSEQ, t1.TEAMNAME from tblteam t1
     inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
     inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
     inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
     inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
     CROSS APPLY(SELECT TOP 1 SUBJECTSEQ FROM TBLSUBJECT on SUBJECTSEQ = t4.SUBJECTSEQ)


    select distinct t5.SUBJECTSEQ, t1.TEAMNAME
    from tblteam t1
             inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
             inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
             inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
             inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
             inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;

select * from tblproject;

-- distinct 안쓰면 125개
-- distinct 안쓴거
-- 50,1
-- 50,1
-- 50,1
-- 50,1
-- 50,1
-- 50,1
-- 50,2
-- 50,2
-- 50,2
-- 50,2
-- 50,2
-- 50,2
-- 50,3
-- 50,3
-- 50,3
-- 50,3
-- 50,3
-- 50,3
-- 50,4
-- 50,4
-- 50,4
-- 50,4
-- 50,4
-- 50,4
-- 50,5
-- 50,5
-- 50,5
-- 50,5
-- 50,5
-- 50,5
-- 10,1
-- 10,1
-- 10,1
-- 10,1
-- 10,1
-- 10,1
-- 10,2
-- 10,2
-- 10,2
-- 10,2
-- 10,2
-- 10,2
-- 10,3
-- 10,3
-- 10,3
-- 10,3
-- 10,3
-- 10,3
-- 10,4
-- 10,4
-- 10,4
-- 10,4
-- 10,4
-- 10,4
-- 10,5
-- 10,5
-- 10,5
-- 10,5
-- 10,5
-- 10,5
-- 6,1
-- 6,1
-- 6,1
-- 6,1
-- 6,1
-- 6,1
-- 6,2
-- 6,2
-- 6,2
-- 6,2
-- 6,2
-- 6,2
-- 6,3
-- 6,3
-- 6,3
-- 6,3
-- 6,3
-- 6,3
-- 6,4
-- 6,4
-- 6,4
-- 6,4
-- 6,4
-- 6,4
-- 6,5
-- 6,5
-- 6,5
-- 6,5
-- 6,5
-- 6,5
-- 36,1
-- 36,1
-- 36,1
-- 36,1
-- 36,1
-- 36,1
-- 36,2
-- 36,2
-- 36,2
-- 36,2
-- 36,2
-- 36,2
-- 36,3
-- 36,3
-- 36,3
-- 36,3
-- 36,3
-- 36,3
-- 36,4
-- 36,4
-- 36,4
-- 36,4
-- 36,4
-- 36,4
-- 36,5
-- 36,5
-- 36,5
-- 36,5
-- 36,5
-- 36,5
-- 49,1
-- 49,1
-- 49,1
-- 49,1
-- 49,1
-- 49,1
-- 49,2
-- 49,2
-- 49,2
-- 49,2
-- 49,2
-- 49,2
-- 49,3
-- 49,3
-- 49,3
-- 49,3
-- 49,3
-- 49,3
-- 49,4
-- 49,4
-- 49,4
-- 49,4
-- 49,4
-- 49,4
-- 49,5
-- 49,5
-- 49,5
-- 49,5
-- 49,5
-- 49,5

-- 25개
-- 10,4
-- 36,2
-- 49,5
-- 50,2
-- 10,2
-- 6,3
-- 6,5
-- 36,3
-- 36,4
-- 49,2
-- 49,4
-- 50,3
-- 36,5
-- 50,1
-- 6,2
-- 36,1
-- 50,4
-- 6,4
-- 10,5
-- 6,1
-- 49,3
-- 50,5
-- 10,1
-- 10,3
-- 49,1


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
             select distinct t5.subjectseq, t1.teamname from TBLSUBJECT)as t5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;


-- http://jason-heo.github.io/mysql/2014/03/05/find-dup-record.html
SELECT person.id, person.name, job.job_name
FROM person INNER JOIN (
    -- 중복 제거를 위한 inline view
    SELECT DISTINCT person_name, job_name
    FROM job
) AS job ON person.name = job.person_name;

select * from tblproject;

insert into tblteam
SELECT  t5.SUBJECTSEQ, t3.SUBJECTEND, t1.teamseq
FROM tblteam t1
INNER JOIN TBLCLASS t2 ON t1.CLASSSEQ = t2.CLASSSEQ
INNER JOIN TBLOPENCOURSE T ON T.OPENCOURSESEQ = t2.OPENCOURSESEQ
INNER JOIN TBLOPENSUBJECT T3 ON T.OPENCOURSESEQ = T3.OPENCOURSESEQ
INNER JOIN TBLAVAILABLESUBJECT T4 ON T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
INNER JOIN TBLSUBJECT T5 ON T5.SUBJECTSEQ = t4.SUBJECTSEQ
where  (t5.SUBJECTSEQ, t1.TEAMNAME) in (
    SELECT DISTINCT t5.SUBJECTSEQ, t1.TEAMNAME
    FROM tblteam t1
             INNER JOIN TBLCLASS t2 ON t1.CLASSSEQ = t2.CLASSSEQ
             INNER JOIN TBLOPENCOURSE T ON T.OPENCOURSESEQ = t2.OPENCOURSESEQ
             INNER JOIN TBLOPENSUBJECT T3 ON T.OPENCOURSESEQ = T3.OPENCOURSESEQ
             INNER JOIN TBLAVAILABLESUBJECT T4 ON T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
             INNER JOIN TBLSUBJECT T5 ON T5.SUBJECTSEQ = t4.SUBJECTSEQ
);



select t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join (select distinct CLASSSEQ, OPENCOURSESEQ from TBLCLASS t2) t2d
                    on t1.CLASSSEQ = t2d.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2d.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;



--so question
declare
    v1 tblsubject.subjectseq%type;
    v2 tblteam.teamname%type;
    cursor vcursor is
        select distinct t5.SUBJECTSEQ, t1.TEAMNAME
        from tblteam t1
                 inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
                 inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
                 inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
                 inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
                 inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;
begin
    open vcursor;
    loop
        fetch vcursor into v1, v2;
        insert into tblproject
        select rownum, t5.SUBJECTNAME || '프로젝트', T3.SUBJECTEND, t1.TEAMSEQ
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
         inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ
where (v1, v2) in (
    select distinct t5.SUBJECTSEQ, t1.TEAMNAME
    from tblteam t1
             inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
             inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
             inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
             inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
             inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ);
        exit when vcursor%notfound;
        dbms_output.PUT_LINE(v1);
        dbms_output.PUT_LINE(v2);
    end loop;
end;
;


select t5.SUBJECTSEQ, t1.TEAMNAME
from tblteam t1
         inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
         inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
         inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
         inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
--          inner join (select distinct subjectseq, t1.teamname from tblsubject) t5 on t5.SUBJECTSEQ = t4.SUBJECTSEQ;
--          위 문장은 사용할 수 없음 ORA-00904: "T1"."TEAMNAME": invalid identifier
inner join (
             select distinct subjectseq, teamname from TBLSUBJECT, tblteam) t5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;
-- 750row가 출력됨
-- inner join에 서브쿼리를 적용하지 않으면 150row가 출력됨.
-- distinct를 하면 25개row가 출력됨
-- select distinct t5.SUBJECTSEQ, t1.teamname
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

select * from tblproject;

declare
    v1 tblsubject.subjectseq%type;
    v2 tblteam.teamname%type;
    a1 number;
    a2 tblsubject.subjectname%type;
    a3 tblopensubject.SUBJECTEND%type;
    a4 tblteam.teamseq%type;
-- seq_tblproject.nextval, t5.SUBJECTNAME, T3.SUBJECTEND, t1.TEAMSEQ
    cursor vcursor is
        select distinct t5.SUBJECTSEQ, t1.TEAMNAME
        from tblteam t1
                 inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
                 inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
                 inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
                 inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
                 inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ;
    cursor vcursor2 is
    select seq_tblproject.nextval, t5.SUBJECTNAME, T3.SUBJECTEND, t1.TEAMSEQ
        into a1, a2, a3, a4
        from tblteam t1
                 inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
                 inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
                 inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
                 inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
                 inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ
        where (v1, v2) in (
            select distinct t5.SUBJECTSEQ, t1.TEAMNAME
            from tblteam t1
                     inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
                     inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
                     inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
                     inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
                     inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = t4.SUBJECTSEQ);
begin
    open vcursor;
    loop
        fetch vcursor into v1, v2;
        fetch vcursor2 into a1,a2,a3,a4;
        exit when vcursor%notfound;
        dbms_output.PUT_LINE('hello');


        dbms_output.PUT_LINE(v1);
        dbms_output.PUT_LINE(v2);

        dbms_output.PUT_LINE(' ');
    end loop;
end;


select *
from tblteam t1
inner join TBLCLASS t2 on t1.CLASSSEQ = t2.CLASSSEQ
inner join TBLOPENCOURSE T on T.OPENCOURSESEQ = t2.OPENCOURSESEQ
inner join TBLOPENSUBJECT T3 on T.OPENCOURSESEQ = T3.OPENCOURSESEQ
inner join TBLAVAILABLESUBJECT T4 on T4.AVAILABLESUBJECTSEQ = T3.AVAILABLESUBJECTSEQ
inner join TBLSUBJECT T5 on T5.SUBJECTSEQ = T4.SUBJECTSEQ