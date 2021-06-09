/*



 직원 정보 테이블
 직원번호, 직원명, 급여, 거주지, 담당프로젝트
 */
DROP TABLE TBLSTAFF;

CREATE TABLE TBLSTAFF
(

    SEQ     NUMBER PRIMARY KEY,     --직원번호(PK)
    NAME    VARCHAR2(30)  NOT NULL, --직원명
    SALARY  NUMBER        NOT NULL, --급여
    ADDRESS VARCHAR2(300) NOT NULL, --거주지
    PROJECT VARCHAR2(300) NULL      --담당프로젝트
);

INSERT INTO TBLSTAFF(SEQ, NAME, SALARY, ADDRESS, PROJECT)
VALUES (1, '홍길동', 300, '서울시', '홍콩수출');
INSERT INTO TBLSTAFF(SEQ, NAME, SALARY, ADDRESS, PROJECT)
VALUES (2, '아무개', 250, '부산시', 'TV광고');
INSERT INTO TBLSTAFF(SEQ, NAME, SALARY, ADDRESS, PROJECT)
VALUES (3, '하하하', 280, '대전시', '매출분석');

-- 홍길동 + 프로젝트 1건 추가 (고객관리)
INSERT INTO TBLSTAFF(SEQ, NAME, SALARY, ADDRESS, PROJECT)
VALUES (4, '홍길동', 300, '서울시', '고객관리');


-- 호호호 + 2개 프로젝트 담당
INSERT INTO TBLSTAFF(SEQ, NAME, SALARY, ADDRESS)
VALUES (5, '후후후', 250, '서울시');

select *
from tblstaff;
/*
 1명의 직원이 2개 이상의 프로젝트를 담당했을때
 CASE A 홍길동
    - 프로젝트 1개당 레코드 1개
    - 직원 정보가 계속 반복
 CASE B 호호호
    - 프로젝트 전부를 1개의 컬럼에 누적
    - 직원 정보가 유일
 */

UPDATE TBLSTAFF
SET SALARY = 310
WHERE SEQ = 1;

-- 홍길동 프로젝트 추가
INSERT INTO TBLSTAFF (SEQ, NAME, SALARY, ADDRESS, PROJECT)
VALUES (6, '홍길동', 300, '서울시', '반품처리');

-- 호호호 프로젝트 추가
UPDATE TBLSTAFF
SET PROJECT = PROJECT || ',반품처리'
WHERE SEQ = 5;

-- 홍길동 고객관리 -> 담당 해제
DELETE
FROM TBLSTAFF
WHERE SEQ = 4;

-- 호호호 고객관리 -> 담당 해제
UPDATE TBLSTAFF
SET PROJECT = REPLACE(PROJECT, '고객관리,', '')
WHERE SEQ = 5;


SELECT *
FROM TBLSTAFF;

DROP TABLE TBLSTAFF;
DROP TABLE TBLPROJECT;

CREATE TABLE TBLSTAFF
(

    SEQ     NUMBER PRIMARY KEY,     --직원번호(PK)
    NAME    VARCHAR2(30)  NOT NULL, --직원명
    SALARY  NUMBER        NOT NULL, --급여
    ADDRESS VARCHAR2(300) NOT NULL  --거주지

);

CREATE TABLE TBLPROJECT
(
    SEQ       NUMBER PRIMARY KEY,                              --프로젝트번호(PK)
    PROJECT   VARCHAR2(300) NULL,                              --담당프로젝트
    STAFF_SEQ NUMBER        NOT NULL REFERENCES TBLSTAFF (SEQ) --직원번호(FK, FOREIGN KEY, 외래키, 참조키)
);


-- TBLSTAFF        - TBMLPROJECT
-- PK(부모키)      - FK(자식키)
-- 부모            - 자식
-- 부모테이블      - 자식테이블
INSERT INTO TBLSTAFF(SEQ, NAME, SALARY, ADDRESS)
VALUES (1, '홍길동', 300, '서울시');
INSERT INTO TBLSTAFF(SEQ, NAME, SALARY, ADDRESS)
VALUES (2, '아무개', 250, '부산시');
INSERT INTO TBLSTAFF(SEQ, NAME, SALARY, ADDRESS)
VALUES (3, '하하하', 280, '대전시');

INSERT INTO TBLPROJECT(SEQ, PROJECT, STAFF_SEQ)
VALUES (1, '홍콩수출', 1);
INSERT INTO TBLPROJECT(SEQ, PROJECT, STAFF_SEQ)
VALUES (2, 'TV광고', 2);
INSERT INTO TBLPROJECT(SEQ, PROJECT, STAFF_SEQ)
VALUES (3, '매출분석', 3);

-- 홍길동 + 프로젝트 1개 추가
INSERT INTO TBLPROJECT(SEQ, PROJECT, STAFF_SEQ)
VALUES (4, '노조협상', 1);

-- 홍길동 + 프로젝트 1개 해제
DELETE
FROM TBLPROJECT
WHERE SEQ = 1;

SELECT *
FROM TBLSTAFF; --3명


SELECT *
FROM TBLPROJECT;
--3건

-- 위의 2개의 테이블의 문제점
-- A. 신입 사원 입사 > 신규 프로젝트 담당
-- A.1 신입 사원 추가
INSERT INTO TBLSTAFF (SEQ, NAME, SALARY, ADDRESS)
VALUES (4, '호호호', 200, '서울시');

-- A.2 신규 프로젝트 추가
INSERT INTO TBLPROJECT(SEQ, PROJECT, STAFF_SEQ)
VALUES (5, '자재매입', 4);

-- A.3 신규 프로젝트 추가
-- ORA-02291: INTEGRITY CONSTRAINT (HR.SYS_C007138) VIOLATED - PARENT KEY NOT FOUND
-- FK가 SEQ를 참조하기에 없는 사원은 추가 못함.
INSERT INTO TBLPROJECT(SEQ, PROJECT, STAFF_SEQ)
VALUES (6, '고객유치', 5);
-- 5번이라는 사원이 없음..


-- B. '홍길동' 퇴사
-- B.1 '홍길동' 삭제
-- ORA-02292: INTEGRITY CONSTRAINT (HR.SYS_C007138) VIOLATED - CHILD RECORD FOUND
-- 길동이를 삭제하면 PROECT에서 참조하는 데이터가 있기때문에 에러 발생
DELETE
FROM TBLSTAFF
WHERE SEQ = 1;
-- 홍길동이 맡은 PROJECT가 문제가됨

-- B.2 '홍길동'의 모든 업무 > 위임
UPDATE TBLPROJECT
SET STAFF_SEQ = 2
WHERE STAFF_SEQ = 1;

DELETE
FROM TBLPROJECT
WHERE SEQ = 1;

/*
 관계를 맺고 있는 2개의 테이블을 조작하면 발생하는 일
 - 이 규칙이 깨지면 데이터 무결성(유효성)이 깨진다. > 데이터 가치 상실
 - 반드시 지켜야 하는 상황

 1. 부모 테이블 조작 (STAFF)
    A. 행추가(INSERT) : 아무 영향 없음
    B. 행수정(UPDATE) : 아무 영향 없음
    C. 행삭제(DELETE) : 자식 테이블에 자신을 참조하는 행이 존재하는지 반드시 사전 체크 > FK 존재 유무 체크 > CHILD RECORD NOT FOUND

 2. 자식 테이블 조작 (PROJECT)
    A. 행추가(INSERT) : 자신이 참조하는 대상이 실제로 부모테이블에 존재하는 값인지 사전 체크 > PARENT RECORD NOT FOUND

    B. 행수정(UPDATE) : 수정할 컬럼이 FK 컬럼 > 부모 테이블에 존재하는 값인지 사전 체크 > PARENT RECORD NOT FOUND
    C. 행삭제(DELETE)
 */

-- 관계를 맺고 있는 테이블 생성하기
-- 2개의 테이블 중 누가 부모 테이블이 되고, 누가 자식 테이블이 되어야 하는가?
-- 2개의 테이블의 데이터 중 시간 흐름 순서상 먼저 생기는 테이블이 부모, 나중에 생성되는 테이블이 자식


-- 고객 <-> 판매

--  1. 고객이 회원가입 > SSEQ를 비워둔채 가입
--  2. 구매 > TBLSALES에 INSERT, TBLCUSTOMER에 UPDATE
--  3. 구매 > TBLSALES에 INSERT, TBLCUSTOMER에 UPDATE를 해야 하는데
--                               2번에서 값이 존재, 내역 관리 불가

-- 1. 고객이 회원가입
-- 2. 구매 > INSERT(TBLSALES)
-- 3. 구매 > INSERT(TBLSALES)

-- 고객 테이블
CREATE TABLE TBLCUSTOMER
(
    SEQ     NUMBER PRIMARY KEY,
    NAME    VARCHAR2(30)  NOT NULL,
    TEL     VARCHAR2(15)  NOT NULL,
    ADDRESS VARCHAR2(100) NOT NULL
--     SSEQ NUMBER NULL REFERENCES TBLSALES(SEQ)
);

-- 판매내역 테이블
CREATE TABLE TBLSALES
(
    SEQ     NUMBER PRIMARY KEY,
    ITEM    VARCHAR2(50)         NOT NULL,
    QTY     NUMBER               NOT NULL,
    REGDATE DATE DEFAULT SYSDATE NOT NULL,
    CSEQ    NUMBER               NOT NULL REFERENCES TBLCUSTOMER (SEQ)
);

-- 고객 데이터
insert into tblcustomer (seq, name, tel, address)
values (1, '홍길동', '010-1234-5678', '서울시');
insert into tblcustomer (seq, name, tel, address)
values (2, '아무게', '010-3333-4444', '인천시');
insert into tblcustomer (seq, name, tel, address)
values (3, '하하하', '010-5555-6666', '부산시');


-- 판매 데이터
insert into tblsales (seq, item, qty, cseq)
values (1, '전화기', 1, 1);
insert into tblsales (seq, item, qty, cseq)
values (2, '다이어리', 3, 2);
insert into tblsales (seq, item, qty, cseq)
values (3, '노트', 10, 2);
insert into tblsales (seq, item, qty, cseq)
values (4, '볼펜', 20, 3);
insert into tblsales (seq, item, qty, cseq)
values (5, '지우개', 15, 3);
insert into tblsales (seq, item, qty, cseq)
values (6, '마우스', 5, 1);
insert into tblsales (seq, item, qty, cseq)
values (7, '키보드', 2, 3);
insert into tblsales (seq, item, qty, cseq)
values (8, '모니터', 1, 2);
insert into tblsales (seq, item, qty, cseq)
values (9, '선풍기', 2, 1);

commit;

SELECT *
FROM TBLCUSTOMER;
SELECT *
FROM TBLSALES;


-- 비디오 대여점
DROP TABLE TBLGENRE;
DROP TABLE TBLVIDEO;
DROP TABLE TBLMEMBER;
DROP TABLE TBLRENT;

DROP SEQUENCE GENRESEQ;
DROP SEQUENCE VIDEOSEQ;
DROP SEQUENCE MEMBERSEQ;
DROP SEQUENCE RENTSEQ;


-- 장르 테이블
CREATE TABLE TBLGENRE
(
    SEQ    NUMBER PRIMARY KEY,
    NAME   VARCHAR2(30) NOT NULL,
    PRICE  NUMBER       NOT NULL,
    PERIOD NUMBER       NOT NULL
);

-- 비디오 테이블
-- *** BASIC OF BASIC 관계를 맺고 있는 테이블의 생성과 삭제
-- 1. 생성: 부모 테이블 생성 -> 자식 테이블 생성
-- 2. 삭제 : 자식 테이블 삭제 -> 부모 테이블 삭제
CREATE TABLE TBLVIDEO
(
    SEQ      NUMBER PRIMARY KEY,
    NAME     VARCHAR2(100) NOT NULL,
    QTY      NUMBER        NOT NULL,
    COMPANY  VARCHAR2(50)  NULL,
    DIRECTOR VARCHAR2(50)  NULL,
    MAJOR    VARCHAR2(50)  NULL,
    GENRE    NUMBER        NOT NULL REFERENCES TBLGENRE (SEQ)
);

-- 고객 테이블
CREATE TABLE TBLMEMBER
(
    SEQ     NUMBER PRIMARY KEY,
    NAME    VARCHAR2(30)  NOT NULL,
    GRADE   NUMBER(1)     NOT NULL,
    BYEAR   NUMBER(4)     NOT NULL,
    TEL     VARCHAR2(15)  NOT NULL,
    ADDRESS VARCHAR2(300) NULL,
    MONEY   NUMBER        NOT NULL
);


-- 대여 테이블
CREATE TABLE TBLRENT
(
    SEQ      NUMBER PRIMARY KEY,
    MEMBER   NUMBER               NOT NULL REFERENCES TBLMEMBER (SEQ),
    VIDEO    NUMBER               NOT NULL REFERENCES TBLVIDEO (SEQ),
    RENTDATE DATE DEFAULT SYSDATE NOT NULL,
    RET      DATE                 NULL,
    REMARK   VARCHAR2(500)        NULL
);

create table tblRent
(
    seq      number primary key,                                       --대여번호(PK)
    member   number               not null references tblMember (seq), --회원번호(FK)
    video    number               not null references tblVideo (seq),  --비디오번호(FK)
    rentdate date default sysdate not null,                            --대여시각
    retdate  date                 null,                                --반납시각
    remark   varchar2(500)        null                                 --비고
);


CREATE SEQUENCE GENRESEQ;
CREATE SEQUENCE VIDEOSEQ;
CREATE SEQUENCE MEMBERSEQ;
CREATE SEQUENCE RENTSEQ;


-- 장르 데이터
INSERT INTO tblGenre
VALUES (genreSeq.NEXTVAL, '액션', 1500, 2);
INSERT INTO tblGenre
VALUES (genreSeq.NEXTVAL, '에로', 1000, 1);
INSERT INTO tblGenre
VALUES (genreSeq.NEXTVAL, '어린이', 1000, 3);
INSERT INTO tblGenre
VALUES (genreSeq.NEXTVAL, '코미디', 2000, 2);
INSERT INTO tblGenre
VALUES (genreSeq.NEXTVAL, '멜로', 2000, 1);
INSERT INTO tblGenre
VALUES (genreSeq.NEXTVAL, '기타', 1800, 2);


-- 비디오 데이터
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '영구와 땡칠이', 5, '영구필름', '심영래', '땡칠이', 3);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '어쭈구리', 5, '에로 프로덕션', '김감독', '박에로', 2);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '털미네이터', 3, '파라마운트', 'James', 'John', 1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '육복성', 3, '대만영화사', '홍군보', '생룡', 4);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '뽀뽀할까요', 6, '뽀뽀사', '박감독', '최지후', 5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '우정과 영혼', 2, '파라마운트', 'James', 'Mike', 5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '주라기 유원지', 1, NULL, NULL, NULL, 1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '타이거 킹', 4, 'Walt', 'Kebin', 'Tiger', 3);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '텔미 에브리 딩', 10, '영구필름', '강감독', '심으나', 5);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '동무', 7, '부산필름', '박감독', '장동근', 1);
INSERT INTO tblVideo (seq, Name, qty, Company, Director, Major, Genre)
VALUES (videoSeq.NEXTVAL, '공동경쟁구역', 2, '뽀뽀사', '박감독', '이병흔', 1);


-- 회원 데이터
INSERT INTO tblMember (seq, Name, Grade, Byear, Tel, address, Money)
VALUES (memberSeq.NEXTVAL, '김유신', 1, 1970, '123-4567', '12-3번지 301호', 10000);
INSERT INTO tblMember (seq, Name, Grade, Byear, Tel, address, Money)
VALUES (memberSeq.NEXTVAL, '강감찬', 1, 1978, '111-1111', '777-2번지 101호', 0);
INSERT INTO tblMember (seq, Name, Grade, Byear, Tel, address, Money)
VALUES (memberSeq.NEXTVAL, '유관순', 1, 1978, '222-2222', '86-9번지', 20000);
INSERT INTO tblMember (seq, Name, Grade, Byear, Tel, address, Money)
VALUES (memberSeq.NEXTVAL, '이율곡', 1, 1982, '333-3333', NULL, 15000);
INSERT INTO tblMember (seq, Name, Grade, Byear, Tel, address, Money)
VALUES (memberSeq.NEXTVAL, '신숙주', 1, 1988, '444-4444', '조선 APT 1012호', 0);
INSERT INTO tblMember (seq, Name, Grade, Byear, Tel, address, Money)
VALUES (memberSeq.NEXTVAL, '안중근', 1, 1981, '555-5555', '대한빌라 102호', 1000);
INSERT INTO tblMember (seq, Name, Grade, Byear, Tel, address, Money)
VALUES (memberSeq.NEXTVAL, '윤봉길', 1, 1981, '666-6666', '12-1번지', 0);
INSERT INTO tblMember (seq, Name, Grade, Byear, Tel, address, Money)
VALUES (memberSeq.NEXTVAL, '이순신', 1, 1981, '777-7777', NULL, 1500);
INSERT INTO tblMember (seq, Name, Grade, Byear, Tel, address, Money)
VALUES (memberSeq.NEXTVAL, '김부식', 1, 1981, '888-8888', '73-6번지', -1000);
INSERT INTO tblMember (seq, Name, Grade, Byear, Tel, address, Money)
VALUES (memberSeq.NEXTVAL, '박지원', 1, 1981, '999-9999', '조선 APT 902호', 1200);


-- 대여 데이터

INSERT INTO tblRent (seq, member, video, Rentdate, RETDATE)
VALUES (rentSeq.NEXTVAL, 1, 1, '2007-01-01', NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, RETDATE)
VALUES (rentSeq.NEXTVAL, 2, 2, '2007-02-02', '2001-02-03');
INSERT INTO tblRent (seq, member, video, Rentdate, RETDATE)
VALUES (rentSeq.NEXTVAL, 3, 3, '2007-02-03', NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, RETDATE)
VALUES (rentSeq.NEXTVAL, 4, 3, '2007-02-04', '2001-02-08');
INSERT INTO tblRent (seq, member, video, Rentdate, RETDATE)
VALUES (rentSeq.NEXTVAL, 5, 5, '2007-02-05', NULL);
INSERT INTO tblRent (seq, member, video, Rentdate, RETDATE)
VALUES (rentSeq.NEXTVAL, 1, 2, '2007-02-10', NULL);

SELECT *
FROM TBLRENT;
SELECT *
FROM TBLGENRE;


SELECT *
FROM TBLVIDEO;
SELECT *
FROM TBLMEMBER;

SELECT *
FROM TBLRENT;


COMMIT;

/*
 조인, Join
 - (서로 관계를 맺고 있는) 2개(1개) 이상이ㅡ 테이블의 내용을 동시에 가져와서 1개의 결과셋을 만드는 작업
 - 조인에서 컬럼은 반드시 테이블명(소유주)를 적는게 좋다. else 충돌 에러 발생

 조인의 종류(ANSI-SQL)
 1. 단순 조인, cross join ******
    - 사용을 거의 안함 > 결과셋에 유효한 레코드와 유효하지 않ㅇ느 레코드가 뒤섞여 있기 때문에
    - 가끔씩 개발자가 테스트 용도의 큰 데이터가 필요한 경우에 사용(더미 데이터 - 유효성과는 무관)
    - select * from tblA cross join tableB;
    - select * from tableA, tableB;


 2. 내부 조인, inner join ******
    - 단순 조인의 결과에서 유효한 레코드만 추출한 조인
    - 두 테이블의 교집합같은 성질 두 테이블에 모두 존재하는 조건 아래 택한다.
    - select * from tableA inner join tableB on tableA.PK = tableB.FK;

 3. 외부 조인, outer join ******
    - 내부 조인 + 부모 테이블
    - 내부 조인 + 차집합(부모 테이블)
    - 내부 조인의 결과셋에 참조되지 않은 부모 레코드를 더한 결과 셋
    - SELECT * FROM TABLEA LEFT OUTER JOIN TABLEB ON TABLEA.PK = TABLEB.FK;
    - 일반적으로 부모 테이블을 가리킨다. (LEFT OR RIGHT)
    - SUMMARY

 */


SELECT *
FROM TBLCUSTOMER;
SELECT *
FROM TBLSALES;



SELECT *
FROM TBLCUSTOMER
         CROSS JOIN TBLSALES;
SELECT *
FROM TBLCUSTOMER,
     TBLSALES;


-- SELECT * FROM TBLCUSTOMER WHERE TBLCUSTOMER.SEQ = TBLSALES.CSEQ;
--  3 * 9 = 27

SELECT *
FROM TBLADDRESSBOOK
         CROSS JOIN tblsales; -- ANSI-SQL
SELECT *
from tblCustomer,
     tblSales;
-- Oracle


--  내부 조인, inner join (*****)

-- 고객정보와 판매내역을 동시에 가져오기

SELECT *
FROM TBLCUSTOMER
         INNER JOIN TBLSALES
                    ON TBLCUSTOMER.SEQ = TBLSALES.CSEQ; -- 어떤 레코드만 남기지에 대한 조건(부모테이블.PK = 자식테이블.FK)


SELECT *
FROM TBLCUSTOMER
         CROSS JOIN TBLSALES
WHERE TBLCUSTOMER.SEQ = TBLSALES.CSEQ;

-- 조인을 할 때 자주 발생하는 현상
--
SELECT a.seq, b.seq
FROM TBLCUSTOMER a
         INNER JOIN TBLSALES b
                    ON a.SEQ = b.CSEQ; -- 어떤 레코드만 남기지에 대한 조건(부모테이블.PK = 자식테이블.FK)

SELECT TBLCUSTOMER.NAME,
       TBLCUSTOMER.ADDRESS,
       TBLSALES.ITEM,
       TBLSALES.QTY
FROM TBLCUSTOMER
         CROSS JOIN TBLSALES
WHERE TBLCUSTOMER.SEQ = TBLSALES.CSEQ;

SELECT C.NAME,
       C.ADDRESS,
       S.ITEM,
       S.QTY
FROM TBLCUSTOMER C
         INNER JOIN TBLSALES S
                    ON C.SEQ = S.CSEQ;


SELECT *
FROM TBLCUSTOMER; -- 고객명, 연락처

SELECT *
FROM TBLSALES;
--제품명, 수량

-- SUB QUERY VS JOIN

-- JOIN
SELECT C.NAME,
       C.TEL,
       S.ITEM,
       S.QTY
FROM TBLCUSTOMER C
         INNER JOIN TBLSALES S
                    ON C.SEQ = S.CSEQ;

-- SUB QUERY(상관 서브 쿼리)
SELECT ITEM,
       QTY,
       CSEQ,
       (SELECT NAME
        FROM TBLCUSTOMER
        WHERE SEQ = TBLSALES.CSEQ) AS NAME,
       (SELECT TEL
        FROM TBLCUSTOMER
        WHERE SEQ = TBLSALES.CSEQ) AS TEL
FROM TBLSALES;


SELECT S.NAME    AS 직원명,
       S.SALARY  AS 급여,
       P.PROJECT AS 프로젝트명
FROM TBLSTAFF S
         INNER JOIN TBLPROJECT P
                    ON S.SEQ = P.STAFF_SEQ;

SELECT *
FROM TBLMEN;

SELECT *
FROM TBLWOMEN;

SELECT M.NAME AS 남자,
       F.NAME AS 여자
FROM TBLMEN M
         INNER JOIN TBLWOMEN F
                    ON M.COUPLE = F.NAME;

SELECT *
FROM TBLADDRESSBOOK;

SELECT *
FROM TBLCOMEDIAN;

SELECT *
FROM TBLADDRESSBOOK A
         INNER JOIN TBLCOMEDIAN C
                    ON A.HEIGHT = C.HEIGHT;

SELECT FIRST_NAME,
       DEPARTMENT_ID
FROM EMPLOYEES;

SELECT *
FROM DEPARTMENTS;


SELECT E.FIRST_NAME || ' ' || E.LAST_NAME,
       D.DEPARTMENT_NAME
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D
                    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;


SELECT E.FIRST_NAME || ' ' || E.LAST_NAME AS NAME,
       D.DEPARTMENT_NAME,
       L.CITY || ' ' || L.STREET_ADDRESS  AS LOCATION
FROM EMPLOYEES E
         INNER JOIN DEPARTMENTS D
                    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
         INNER JOIN LOCATIONS L
                    on D.LOCATION_ID = L.LOCATION_ID;


SELECT *
FROM LOCATIONS;

SELECT *
FROM TBLGENRE;

SELECT *
FROM TBLVIDEO;

-- TBLGENRE랑 TBLVIDEO 쪼인
SELECT *
FROM TBLGENRE G
         INNER JOIN TBLVIDEO V
                    ON G.SEQ = V.GENRE;


SELECT *
FROM TBLRENT;


SELECT *
FROM TBLGENRE G
         INNER JOIN TBLVIDEO V
                    ON G.SEQ = V.GENRE
         INNER JOIN TBLRENT R
                    ON V.SEQ = R.VIDEO;


SELECT G.PRICE               AS 대여가격,
       G.PERIOD              AS 대여기간,
       V.NAME                AS 비디오제목,
       M.NAME                AS 회원명,
       R.RENTDATE            AS 대여날짜,
       R.RENTDATE + G.PERIOD AS 반납마감
FROM TBLGENRE G
         INNER JOIN TBLVIDEO V
                    ON G.SEQ = V.GENRE
         INNER JOIN TBLRENT R
                    ON V.SEQ = R.VIDEO
         INNER JOIN TBLMEMBER M
                    ON M.SEQ = R.MEMBER;


SELECT *
FROM TBLSTAFF;


SELECT *
FROM TBLPROJECT;

-- 내부 조인(INNER JOIN)
-- : 2개 테이블에 ON 조건을 만족하는 레코드만 반환
-- : 내부 조인의 결과는 대부분 자식 레코드 수만큼 나온다.
-- : 관계에 따라 레코드 수는 바뀔 수 있지만 일반적으로는 자식 레코드 수만큼.

SELECT *
FROM TBLSTAFF S
         INNER JOIN TBLPROJECT P
                    ON S.SEQ = P.STAFF_SEQ;

-- 비디오 가게 사장
-- : 출근 > 어떤 회원이 뭘 빌려가서 반납 유무
SELECT M.NAME    AS 이름,
       V.NAME    AS 타이틀,
       R.RETDATE AS 반납여부
FROM TBLMEMBER M
         INNER JOIN TBLRENT R
                    ON M.SEQ = R.MEMBER
         INNER JOIN TBLVIDEO V
                    ON V.SEQ = R.VIDEO;



SELECT *
FROM TBLCUSTOMER;

SELECT *
FROM TBLSALES;

INSERT INTO TBLCUSTOMER
VALUES (4, '호호호', '010-1234-4321', '서울시');
-- 신규 가입 회원은 구매 이력이 없다.

-- 구매 이력과 구매 이력이 있는 회원 정보를 가져오세요.
SELECT *
FROM TBLCUSTOMER C
         INNER JOIN TBLSALES S
                    ON C.SEQ = S.CSEQ;

-- 3. 외부 조인, OUTER JOIN ( ***** )
-- 구매 이력과 상관없이 모든 회원 정보를 가져오되, 구매 이력이 있으면 구매이력도 같이 가져오세요

SELECT *
FROM TBLCUSTOMER C
         LEFT OUTER JOIN TBLSALES S ON C.SEQ = S.CSEQ;

-- 대여 유무 이력과 상관없이 모든 회원 정보 + 대여 기록
SELECT M.NAME    AS 이름,
       R.RETDATE AS 반납여부
FROM TBLMEMBER M
         LEFT OUTER JOIN TBLRENT R
                         ON M.SEQ = R.MEMBER;


SELECT DISTINCT M.NAME AS 이름,
                case
                    when R.rentdate is no null then '우량 회원' when R.rentdate is null then '불량 회원' end as 종류
FROM TBLMEMBER M
    LEFT OUTER JOIN TBLRENT R
ON M.SEQ = R.MEMBER;

-- 어떤 비디오를 몇번 빌려갔나?

SELECT V.NAME,
       COUNT(R.RENTDATE) AS 대여횟수
FROM TBLVIDEO V
         LEFT OUTER JOIN TBLRENT R
                         ON V.SEQ = R.VIDEO
GROUP BY V.NAME
ORDER BY COUNT(RENTDATE) DESC, V.NAME ASC;


SELECT *
FROM TBLMEN;

SELECT *
FROM TBLWOMEN;

-- 커플인 남자와 여자
SELECT M.NAME AS 남자,
       W.NAME AS 여자
FROM TBLMEN M
         INNER JOIN TBLWOMEN W
                    ON M.COUPLE = W.NAME;

-- 모든 남자 + 여자친구 있으면 여자친구 이름도 같이

SELECT M.NAME AS 남자,
       W.NAME AS 여자
FROM TBLMEN M
         LEFT OUTER JOIN TBLWOMEN W
                         ON M.COUPLE = W.NAME;

-- 모든 여자 + 남자친구 있으면 남자친구 이름도 같이
SELECT M.NAME AS 남자,
       W.NAME AS 여자
FROM TBLMEN M
         RIGHT OUTER JOIN TBLWOMEN W
                          ON M.COUPLE = W.NAME;

-- 모든 남자 + 모든 여자 + 커플이 있으면 커플이름 같이
-- INNER JOIN + LEFT OUTER JOIN + RIGHT OUTER JOIN
SELECT M.NAME AS 남자,
       W.NAME AS 여자
FROM TBLMEN M
         FULL OUTER JOIN TBLWOMEN W
                         ON M.COUPLE = W.NAME;

-- 셀프 조인
--  - 1개의 테이블을 사용해서 조인
--  - 셀프조인 + 단순 조인
--  - 셀프조인 + 내부 조인
--  - 셀프조인 + 외부 조인

-- 직원 테이블
CREATE TABLE TBLSELF(
    SEQ NUMBER PRIMARY KEY,
    NAME VARCHAR2(30) NOT NULL,
    DEPARTMENT VARCHAR2(50) NULL,
    SUPER NUMBER NULL REFERENCES TBLSELF(SEQ)
);

INSERT INTO TBLSELF VALUES (1, '홍사장', '영업부', 1);
INSERT INTO TBLSELF VALUES (2, '김부장', '영업부', 2);
INSERT INTO TBLSELF VALUES (3, '이과장', '영업부', 3);
INSERT INTO TBLSELF VALUES (4, '정대리', '영업부', 4);
INSERT INTO TBLSELF VALUES (5, '최사원', '영업부', 5);
INSERT INTO TBLSELF VALUES (6, '박부장', '개발부', 1);
INSERT INTO TBLSELF VALUES (7, '하과장', '개발부', 6);

SELECT * FROM TBLSELF;


-- 직원명, 소속명, 상사명을 가져오시오
-- 재귀 형태
SELECT S1.NAME AS 직원명,
       S1.DEPARTMENT AS 부서,
       S2.SUPER AS 상사
FROM TBLSELF S1 --직원(부하)
INNER JOIN TBLSELF S2 --상사
ON S1.SUPER = S2.SEQ;
SELECT S1.NAME AS 직원명,
       S1.DEPARTMENT AS 부서,
       S2.SUPER AS 상사
FROM TBLSELF S1 --직원(부하)
LEFT OUTER JOIN TBLSELF S2 --상사
ON S1.SUPER = S2.SEQ;





