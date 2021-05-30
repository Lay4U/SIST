--관리자 데이터 (5명)
select * from admin;
insert into admin values(seq_admin.nextval, '김정은');
insert into admin values(seq_admin.nextval, '김형래');
insert into admin values(seq_admin.nextval, '이준희');
insert into admin values(seq_admin.nextval, '문지원');
insert into admin values(seq_admin.nextval, '방수빈');
select * from admin;
-- 교사 (10명)
select * from TBLTEACHER;

SELECT CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME FROM USER_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'SYS_C007701';
SELECT * FROM TBLOPENSUBJECT;
DELETE FROM TBLOPENSUBJECT;
--tblsubject 과목
select * from TBLSUBJECT;
delete from tblsubject;

drop sequence SEQ_TBLSUBJECT;
create sequence SEQ_TBLSUBJECT;
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Java 객체지향 프로그래밍 기초 및 활용', 22);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Java SE 기초 및 Network Programming', 28);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '클라우드 개발을 위한 자바 기초 프로그래밍', 22);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Java Network Programming', 21);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '객체지향과 Java SE', 9);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Java OpenJDK Programming', 29);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'JAVA 애플리케이션 구현', 18);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '객체지향 프로그래밍', 15);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'database Programming', 10);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '오라클을 사용한 RDBMS의 SQL과 PL/SQL', 15);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '데이터베이스 구조 설계 및 활용', 15);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '데이터베이스 설계 및 구축', 13);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '데이터베이스 구현', 15);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '데이터 분석기법 및 활용', 5);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Spring 서버기반의 지능형 웹 통합 개발 프로젝트 구축', 10);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Spring Framework 기반 백엔드 설계 및 구축', 13);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Back-End Server Programming', 26);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '반응형 웹 프로젝트', 15);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Web Publishing을 위한 Front-End 설계 및 구현', 20);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '웹 애플리케이션 프로그래밍', 18);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Front_end UI/UX 구현', 13);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Server Side 프로그래밍', 15);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '지능형 웹을 위한 애플리케이션 구축', 15);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Front-end 애플리케이션 구현', 15);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Spring Framework 기반 back-end 설계 및 구축', 38);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '프론트엔드 개발 기법', 15);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '벡엔드 개발 기법', 29);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '반응형 웹 개발기법Back-end', 15);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Back-end 웹 애플리케이션 구현', 12);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'AWS 클라우드 등록 설정 및 구축', 6);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'AWS 기반 통합 프로젝트', 7);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '임베디드 애플리케이션 구현', 5);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '공공 데이터 분석기법을 활용한 데이터 융합 프로젝트', 20);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '임베디드 애플리케이션 구현', 5);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '결함 식별을 위한 애플리케이션 테스트', 3);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '클라우드 시스템 개요 및 AWS 서비스 요소', 30);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'UML을 사용한 시스템 분석', 6);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '데스크탑 UI/UX 설계', 11);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '콘텐츠 추천 알고리즘 기법', 5);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '아두이노를 활용한 임베디드 프로그래밍', 23);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '멀티 플랫폼 기반 융합 실무 프로젝트', 7);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '임베디드 애플리케이션 구현', 9);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '풀스택 융합 프로젝트', 19);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Full-stack Framework 구현', 5);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '오픈플랫폼(Arduino)을 활용한 Embedded 융합프로젝트', 14);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '애플리케이션 배포', 5);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '융합기반 웹표준 프로젝트', 24);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, '콘텐츠 추천 알고리즘 기법', 5);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Front-end 클라이언트 화면설계 및 구현', 16);
insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval, 'Back-end 서버프로그래밍 설계 및 구현', 28);

-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'관계형 데이터베이스');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'웹 개발 프로그래밍');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'Java Testing');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'요구사항 분석 및 설계');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'UI설계 및 구현');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'애플리케이션 구현');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'애플리케이션 테스트');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'애플리케이션 배포');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'Back-end 개발');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'python 프로그래밍');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'front-end 개발(HTML5, CSS3, JavaScript)');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'framework(myBATIS, Spring)');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'파이썬을 이용한 머신러닝 분석 기술');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'웹 서버 구축 실무(HTML5, CSS5)');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'Server/Client side 프로젝트');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'빅데이터 수집');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'R Fundamentals Application(hadoop)');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'웹 클라이언트 프로그래밍(HTML5, CSS)');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'반응형 웹 사이트 만들기');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'웹 클라이언트 프로그래밍 (HTML, CSS3, Java)');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'Spring 개발');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'Spring Framework 통합 구현');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'제이쿼리 모바일');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'코틀린 프로그래밍');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'코틀린 안드로이드 프로그램 구현');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'Spring 서버 기반의 지능형 웹과 앱 통합개발 및 구현');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'UML을 사용한 시스템 분석');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'시스템 사용자 교육');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'텍스트 마이닝 요구사항 분석');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'Python과 tensorflow를 사용한 데이터 분석');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'텍스트 마이닝, Open API 프로젝트');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'데스크탑 UI/UX 설계');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'웹킷 계열 브라우저 반응형 웹 UI/UX 설계');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'빅데이터 관리와 통계');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'빅데이터 분석');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'웹 서버 프로그램 구현' );
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'지능형 웹 개발');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'지능형 웹과 빅데이터 통합 프로젝트');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'융합기반 웹표준 프로젝트');
-- insert into TBLSUBJECT values(SEQ_TBLSUBJECT.nextval,'반응형 웹 개발기법');

select * from TBLSUBJECT;

alter table TBLOPENSUBJECT
	add constraint "openCourseSeq"
		foreign key (OPENSUBJECTSEQ) references TBLOPENCOURSE;
--opensubject 개설된 과목
select * from TBLOPENSUBJECT;
insert into tblopensubject values (SEQ_TBLOPENSUBJECT.nextval, to_date('2021-01-05', 'yyyy-mm-dd'),
                                   to_date('2021-01-05', 'yyyy-mm-dd')+29, 6, 1);
insert into tblopensubject values (SEQ_TBLOPENSUBJECT.nextval, to_date('2021-01-05', 'yyyy-mm-dd')+30,
                                   to_date('2021-01-05', 'yyyy-mm-dd')+46, 10, 1);
insert into tblopensubject values (SEQ_TBLOPENSUBJECT.nextval, to_date('2021-01-05', 'yyyy-mm-dd')+47,
                                   to_date('2021-01-05', 'yyyy-mm-dd')+63, 49, 1);
insert into tblopensubject values (SEQ_TBLOPENSUBJECT.nextval, to_date('2021-01-05', 'yyyy-mm-dd')+64,
                                   to_date('2021-01-05', 'yyyy-mm-dd')+91, 50, 1);
insert into tblopensubject values (SEQ_TBLOPENSUBJECT.nextval, to_date('2021-01-05', 'yyyy-mm-dd')+92,
                                   to_date('2021-01-05', 'yyyy-mm-dd')+120, 36, 1);




-- Java OpenJDK Programming, 29                             6
-- 오라클을 사용한 RDBMS의 SQL과 PL/SQL, 17                  10
-- Front-end 클라이언트 화면설계 및 구현, 16                49
-- Back-end 서버프로그래밍 설계 및 구현, 28                 50
-- [특수과목] : 30일
-- 클라우드 시스템 개요 및 AWS 서비스 요소, 30             36
select * from TBLSUBJECT;

commit;

-- 1 1     01/05   6
-- 2 2     02/08   5.5
-- 3 3     03/29   7
-- 4 4     04/12   5.5
-- 5 5     05/28   6
-- 6 6     06/17   5.5
-- 7 7     07/01   6
-- 8 8     08/23   7
-- 9 9     09/11   5.5
-- 10 10   10/20   6
-- 11 11   11/03   5.5
-- 12 12   12/20   7
-- 과정 - 과목개수

select * from TBLOPENCOURSE;

-- seq, 과정상태(강의 예정, 강의중, 강의종료), 개설과목등록여부, 교육생등록인원, 과정시작일, 과정종료일, 기간 과정번호, 강의실번호
insert into TBLOPENCOURSE(OPENCOURSESEQ, COURSESTATE, OPENSUBJECTREGISTER, STUDENTREGISTER, COURSESTART, COURSEEND, COURSESEQ, CLASSROOMSEQ)
values (SEQ_TBLOPENCOURSE.nextval, '강의중', '등록', 30, to_date('2021-01-05', 'yyyy-mm-dd'), add_months(to_date('2021-01-05', 'yyyy-mm-dd'), 6),
         1, 1);






select * from tblopencourse;

select * from TBLCOURSE;
select * from TBLCLASSROOM;
select seq_tblcourse from dual;

-- 월 /과정번호 5.5 / 6 /  7
-- 1 1     01/05   6
-- 2 2     02/08   5.5
-- 3 3     03/29   7
-- 4 4     04/12   5.5
-- 5 5     05/28   6
-- 6 6     06/17   5.5
-- 7 7     07/01   6
-- 8 8     08/23   7
-- 9 9     09/11   5.5
-- 10 10   10/20   6
-- 11 11   11/03   5.5
-- 12 12   12/20   7




select * from TBLCOURSE;
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'JAVA 기반의 스마트 웹 앱콘텐츠 양성과정',6);								--7
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'Python & Java 응용SW실무개발자 양성과정',6);							--1
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'Framework 기반의 빅데이터 활용 응용프로그래머 양성과정',6);					--5
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'자바 기반 융합형 SW개발자 양성과정',7);
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'Python And Java를 활용한 AI 텍스트마이닝 개발자 양성과정',7);				--8
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'빅데이터를 활용한 지능형 웹 콘텐츠 개발자 양성과정',6);						--10
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'Java And JavaScript library를 활용한 반응형 웹 개발자 양성과정',5.5);		--9
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'Java를 활용한 웹 응용SW개발자 양성과정',5.5);								--4
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'파이썬과 자바를 연계한 머신러닝 활용 개발자 양성과정',5.5);						--2
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'웹기반 빅데이터 분석 응용SW개발자 양성과정',7);							--3
INSERT INTO TBLCOURSE (courseseq,coursename,courseTerm) VALUES (SEQ_TBLCOURSE.nextval,'Java And Python 기반 응용SW개발자 양성과정',5.5);
select * from tblcourse;

select * from TBLCLASSROOM;
insert into tblclassroom values (SEQ_TBLCLASSROOM.nextval, '1강의실', 30);
insert into tblclassroom values (SEQ_TBLCLASSROOM.nextval, '2강의실', 30);
insert into tblclassroom values (SEQ_TBLCLASSROOM.nextval, '3강의실', 30);
insert into tblclassroom values (SEQ_TBLCLASSROOM.nextval, '4강의실', 26);
insert into tblclassroom values (SEQ_TBLCLASSROOM.nextval, '5강의실', 26);
insert into tblclassroom values (SEQ_TBLCLASSROOM.nextval, '6강의실', 26);
alter session set ddl_lock_timeout = 10;
select * from TBLCLASSROOM;

-- ] ORA-02290: check constraint (SIST2.TBLCLASSROOM_LIMIT_STUDENT) violated
-- --6								--7
-- 21년도 1,2,3,4,5,6 개의 과정이있다.
-- 월 /과정번호 5.5 / 6 /  7
-- 1 1     01/05   6
-- 2 2     02/08   5.5
-- 3 3     03/29   7
-- 4 4     04/12   5.5
-- 5 5     05/28   6
-- 6 6     06/17   5.5
-- 7 7     07/01   6
-- 8 8     08/23   7
-- 9 9     09/11   5.5
-- 10 10   10/20   6
-- 11 11   11/03   5.5
-- 12 12   12/20   7

----------------------- ver2
commit;
select * from tblbook;
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'이것이 자바다','한빛미디어');												-- 객체지향과 Java SE
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'오라클 SQL과 PL/SQL','생능출판사');											-- 관계형 데이터베이스
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'최범균의 JSP 2.3 웹 프로그래밍 : 기초부터 중급까지','가메출판사');						-- 웹 개발 프로그래밍
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'Java의 정석 3rd Edition','도우출판');										-- Java Testing
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'요구사항 확인 모듈교재','한국출판사');											-- 요구사항 분석 및 설계
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'UI구현 및 테스트 모듈교재','한국출판사');										-- UI설계 및 구현
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'애플리케이션 통합구현 모듈교재','한국출판사');										-- 애플리케이션 구현
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'애플리케이션 테스트 수행 모듈교재','한국출판사');									-- 애플리케이션 테스트
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'애플리케이션 배포 모듈교재','한국출판사');										-- 애플리케이션 배포


INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'깔끔한 파이썬 탄탄한 백엔드','비제이퍼블릭');										-- Back-end 개발
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'Do it! 점프 투 파이썬','이지스퍼블리싱');										-- python 프로그래밍
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'모던 웹을 위한 JavaScript + jQuery 입문','한빛미디어');						-- Server/Client side 프로젝트, 제이쿼리 모바일
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'Do it! HTML5+CSS3 웹 표준의 정석','이지스퍼블리싱');							-- 웹 서버 구축 실무(HTML5, CSS5), 웹 클라이언트 프로그래밍(HTML5, CSS)
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'오준석의 안드로이드 생존코딩 코틀린 편','한빛미디어');								-- 코틀린 프로그래밍, 코틀린 안드로이드 프로그램 구현
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'지능형 웹 알고리즘','워커북스');												-- 지능형 웹 개발, 지능형 웹과 빅데이터 통합 프로젝트
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'초보 웹 개발자를 위한 스프링5 프로그래밍 입문','가메출판사');							-- Spring 개발, Spring Framework 통합 구현, framework(myBATIS, Spring)
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'Do it! 반응형 웹 만들기 실무자가 꼭 알아야 할 최신 반응형 웹 기술을 한 권에!','이지스퍼블리싱');	-- 반응형 웹 사이트 만들기, 반응형 웹 개발기법
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'차세대 웹 프로그래밍 : HTML5+CSS3+JavaScript','한빛아카데미');					-- front-end 개발(HTML5, CSS3, JavaScript, JQuery), 웹 클라이언트 프로그래밍 (HTML, CSS3, JavaScript, JQuery)
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'JSP WEB PROGRAMMING MASTER','북스홀릭');								-- 웹 서버 프로그램 구현, 융합기반 웹표준 프로젝트
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'UML로 배우는 시스템 분석 설계','생능출판사');										-- UML을 사용한 시스템 분석, 데스크탑 UI/UX 설계, 웹킷 계열 브라우저 반응형 웹 UI/UX 설계
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'텐서플로를 활용한 머신러닝','한빛미디어');										-- 파이썬을 이용한 머신러닝 분석 기술
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'하둡 완벽 가이드','한빛미디어');												-- R Fundamentals Application(hadoop, Linux, R(데이터마이닝))
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'데이터 분석을 위한 파이썬 철저 입문[개정판]','워커북스');								-- 빅데이터 수집, 빅데이터 분석, 빅데이터 관리와 통계, Python과 tensorflow를 사용한 데이터 분석
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'잡아라! 텍스트 마이닝 with 파이썬','비제이퍼블릭');								-- 텍스트 마이닝 요구사항 분석, 텍스트 마이닝, Open API 프로젝트
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'스프링 5.0 마이크로서비스 2/e','에이콘출판');									-- Spring 서버 기반의 지능형 웹과 앱 통합개발 및 구현
INSERT INTO tblBook(bookseq,bookname,publishername) VALUES (seq_tblBook.nextval,'정보시스템 이행 모듈교재','한국출판사'); 										-- 시스템 사용자 교육


select * from TBLTEACHER;
-- 체제원 곽우신 이응수 이창익 박세인 이규미 김호진 김현룡 김대기 서영학 한장희 임정훈
declare
    begin

end;
insert into tblteacher(TEACHERSEQ, TEACHERNAME, PASSWORD, TEACHERTEL, OPENSUBJECTSEQ) values
(SEQ_TBLTEACHER.nextval,'체제원', 1708219, '010-3575-1687',1);

insert into tblteacher(TEACHERSEQ, TEACHERNAME, PASSWORD, TEACHERTEL, OPENSUBJECTSEQ) values
(SEQ_TBLTEACHER.nextval,'곽우신', 1708219, '010-3575-1687',1);
insert into tblteacher(TEACHERSEQ, TEACHERNAME, PASSWORD, TEACHERTEL, OPENSUBJECTSEQ) values
(SEQ_TBLTEACHER.nextval,'이응수', 1708219, '010-3575-1687',1);
insert into tblteacher(TEACHERSEQ, TEACHERNAME, PASSWORD, TEACHERTEL, OPENSUBJECTSEQ) values
(SEQ_TBLTEACHER.nextval,'이창익', 1708219, '010-3575-1687',1);
insert into tblteacher(TEACHERSEQ, TEACHERNAME, PASSWORD, TEACHERTEL, OPENSUBJECTSEQ) values
(SEQ_TBLTEACHER.nextval,'박세인', 1708219, '010-3575-1687',1);
insert into tblteacher(TEACHERSEQ, TEACHERNAME, PASSWORD, TEACHERTEL, OPENSUBJECTSEQ) values
(SEQ_TBLTEACHER.nextval,'이규미', 2708219, '010-3575-1687',1);
insert into tblteacher(TEACHERSEQ, TEACHERNAME, PASSWORD, TEACHERTEL, OPENSUBJECTSEQ) values
(SEQ_TBLTEACHER.nextval,'김호진', 1708219, '010-3575-1687',1);
insert into tblteacher(TEACHERSEQ, TEACHERNAME, PASSWORD, TEACHERTEL, OPENSUBJECTSEQ) values
(SEQ_TBLTEACHER.nextval,'김현룡', 1708219, '010-3575-1687',1);
insert into tblteacher(TEACHERSEQ, TEACHERNAME, PASSWORD, TEACHERTEL, OPENSUBJECTSEQ) values
(SEQ_TBLTEACHER.nextval,'김대기', 1708219, '010-3575-1687',1);
insert into tblteacher(TEACHERSEQ, TEACHERNAME, PASSWORD, TEACHERTEL, OPENSUBJECTSEQ) values
(SEQ_TBLTEACHER.nextval,'한장희', 1708219, '010-3575-1687',1);




select * from TBLOPENSUBJECT;


























-- 교육생 (170명)