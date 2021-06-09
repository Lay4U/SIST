*
DDL
 데이터 정의어
 데이터베이스 객체를 생성, 수정, 삭제한다.
 데이터베이스 객체 : 테이블, 뷰, 인덱스, 트리거, 프로시저, 제약사항, 계정 등
 create, alter, drop

DDL + 테이블(제약사항)

테이블 생성하기 -> 테이블을 구성하는 컬럼을 생성하기(컬럼 정의)
create table 테이블명
(
    컬럼명 자료형,
    컬럼명 자료형,
    컬럼명 자료형
    컬럼 자료형(길이) null여부 제약사항
);

제약사항, Constraint
- 해당 컬럼에 들어갈 데이터(값)에 대한 조건(규제 사항)
    -> 조건을 만족하면 데이터 통과, 조건을 만족하지 못하면 데이터 거부 -> 에러 발생 -> 유효성 검사 도구
- 6가지
1. not null
    - 해당 컬럼엔 반드시 값이 들어가야 한다.
    - 해당 컬럼에 값이 없으면 에러
    - 필수값
    - 지정한 열에 NULL을 허용하지 않는다.
2. primary key, PK
    - 해당 컬럼이 모든 레코드 중에 유일한 값을 가져야 한다.
    - 다른 레코드와 같은 값을 가질 수 없다.
    - 유일하다
    - 주로 식별자로 사용한다.
    - 테이블의 모든 행들을 유일하게 구분하는 역할의 키
    - 반드시 테이블엔 PK가 존재해야 한다.
    - 기본 키의 형태
        a. 단일 기본키 > 기본키 : 1개의 컬럼이 PK 역할
        b. 복합 기본키 > 복합키 : 2개 이상의 컬럼이 모여서 PK 역할, Composite Key
 */
-- 183.100.233.88
 --메모테이블
drop table tblMemo;

create table tblMemo(
  seq number(3) not null,              --메모 번호
  name varchar2(30) not null,         --작성자
  memo varchar2(1000) null,       --메모내용
  regdate date null               --작성날짜
);

select * from tblMemo;
insert into tblMemo (컬럼리스트) values (값리스트);

insert into tblMemo(seq, name, memo, regdate) values(1, '홍길동', '메모입니다.', sysdate);
insert into tblMemo(seq, name, memo) values(1, '홍길동', '메모입니다.'); -- 날짜 생략
insert into tblMemo(seq, name, memo, regdate) values(1,null, '메모입니다.', sysdate);
select * from tblMemo;


drop table tblMemo;

create table tblMemo(
  seq number(3) primary key,              --메모 번호
  name varchar2(30) ,         --작성자
  memo varchar2(1000) ,       --메모내용
  regdate date               --작성날짜
);

insert into tblMemo(seq, name, memo, regdate) values (1, '홍길동', '메모입니다.', sysdate);
insert into tblMemo(seq, name, memo, regdate) values (2, '아무개', '테스트~.', sysdate);
insert into tblMemo(seq, )

select seq, name, memo, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') from tblMemo where seq=2;

select seq, name, memo, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') from tblMemo;

select * from tblMemo;

create table tblMemo(
  seq number(3) PRIMARY KEY,              --메모 번호
  name varchar2(30) UNIQUE,         --작성자
  memo varchar2(1000) ,       --메모내용
  regdate date               --작성날짜
);

INSERT INTO TBLMEMO (SEQ, NAME, MEMO, REGDATE) VALUES (1, '홍길동', '메모입니다.', SYSDATE);
INSERT INTO TBLMEMO (SEQ, NAME, MEMO, REGDATE) VALUES (2, '아무게', '메모입니다.', SYSDATE);
INSERT INTO TBLMEMO (SEQ, NAME, MEMO, REGDATE) VALUES (3, '아무게', '또다른 메모입니다.', SYSDATE);
INSERT INTO TBLMEMO (SEQ, NAME, MEMO, REGDATE) VALUES (3, '하하하', '또다른 메모입니다.', SYSDATE);
INSERT INTO TBLMEMO (SEQ, NAME, MEMO, REGDATE) VALUES (4, NULL, '또다른 메모입니다.', SYSDATE);

SELECT * FROM TBLMEMO;

CREATE TABLE TBML MEMO(
    SEQ NUMBER(3) PRIMARY KEY,
    NAME VARCHAR2(30),
    MEMO VARCHAR2(1000),
    REGDATE DATE,
    LEVEL NUMBER NOT NULL
);

DROP TABLE TBLMEMO;

CREATE TABLE TBLMEMO(
    SEQ NUMBER(3) PRIMARY KEY,
    NAME VARCHAR2(30),
    MEMO VARCHAR2(1000),
    REGDATE DATE,
    LV NUMBER NOT NULL CHECK(LV >= 1 AND LV <=5),
--     COLOR VARCHAR2(30) NOT NULL CHECK(
--         COLOR = 'RED' OR COLOR = 'BLUE' OR COLOR = 'YELLOW'
--         )
    color varchar2(30) not null check(color in ('red', 'blue', 'yellow')),
    updatedate date check(to_char(updatedate, 'd') = 2)
);

INSERT INTO TBLMEMO (SEQ, NAME, MEMO, REGDATE, LV) VALUES(1, '홍길동', '메모입니다.', SYSDATE, 1);
INSERT INTO TBLMEMO (SEQ, NAME, MEMO, REGDATE, LV) VALUES(2, '홍길동', '메모입니다.', SYSDATE, 10);

/*
6. default
    - 기본값 설정
    -
 */
DROP TABLE TBLMEMO;

create table tblmemo(
    seq number(3) constraint tblmemo_seq_pk primary key,
--     name varchar2(30) constraint 제약사항명 check(length(name) between 9 and 30),
    name varchar2(30) constraint tblmemeo_ck check(length(name) between 9 and 30),
    memo varchar2(1000) constraint tblmemo_memo_ck check(length(memo) > 30),
    regdate date

);

insert into tblMemo (seq, name, memo, regdate) values (1, '홍길', '메모입니다.메모이빈다 하하하', sysdate);
insert into tblMemo (seq, regdate) values (2, sysdate);

select * from tblmemo;

drop table tblMemo;

create table tblMemo(
    seq number(3),
    name varchar2(3),
    memo varchar2(1000),
    regdate date,

    --제약 사항 추가
    constraint tblmemo_seq_pk primary key(seq),
    constraint tblmemo_name_ck check(length(name) between 9 and 30),
    constraint tblmemo_memo_ck check(length(memo) > 30)
    -- 권장함!@!
);

