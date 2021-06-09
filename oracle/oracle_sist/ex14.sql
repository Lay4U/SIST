-- ex14_sequence.sql

/*
 시퀀스, Sequence
 - 데이터베이스 객체 중 하나
 - 식별자를 만드는데 주로 사용 > PK 컬럼에서 잘 사용
 - 일련번호를 만들어서 제공하는 객체
 - 오라클 전용

 시퀀스 객체 만들기
 - create sequence 시퀀스명;

 시퀀스 객체 삭제하기
 - drop sequence 시퀀스명;

1 시퀀스 객체 사용하기
 - 시퀀스명.nextVal 함수
 - 시퀀스명.currVal 함수

 */

create sequence seqNum;

select seqNum.nextval
from dual;
--counter 역할 호출하는 횟수만큼 증가된 값을 리턴

-- seqNum같은 경우 글번호 같은곳에 쓰는것이 좋다.

select *
from tblMemo;

drop table tblMemo;

create table tblmemo
(
    seq     number(3) primary key,
    name    varchar2(30)   default '익명',
    memo    varchar2(1000) default '메모없음',
    regdate date
);

insert into tblMemo (seq, name, memo, regdate)
values (1, '홍길동', '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate)
values (2, '홍길동', '메모입니다.', sysdate);
insert into tblMemo (seq, name, memo, regdate)
values (3, '홍길동', '메모입니다.', sysdate);


insert into tblMemo (seq, name, memo, regdate)
values (seqNum.nextVal, '홍길동', '메모입니다.', sysdate);

select seqNum.currVal
from dual;
--peek, seek과 같음

/*
 - create sequnece 시퀀스명
 increment by n -- 증감치 (양수, 음수)
 start with n -- 시작값(seed)

 */


drop sequence seqTest;

create sequence seqTest
    increment by 1
    start with 1
    maxvalue 10
    cycle
    cache 2;

select seqTest.nextVal
from dual;

drop sequence seqA;
drop sequence seqB;
create sequence seqA
    maxvalue 10
    cycle cache 5;

create sequence seqB
    maxvalue 5
    cycle
    cache 3;


select 'ABC' || trim(to_char(seqA.nextVal, '00')) || trim(to_char(seqB.nextVal, '00'))
from dual;


drop sequence seqNum;

create sequence seqNum;

select seqNum.nextVal
from dual;

select seqNum.currVal
from dual;

--

drop table tblMemo;

create table tblMemo
(
    seq     number primary key,
    name    varchar2(30) default '익명'    not null,
    memo    varchar2(1000)               not null,
    regdate date         default sysdate null
);

create sequence seqMemo;
--tblMemo.seq 대입
--1. 표준 : 원본 테이블에 정의된 컬럼 순서대로 컬럼리스트와 값리스트를 구성하는 방식
insert into tblMemo (seq, name, memo, regdate)
values (seqMemo.nextVal, '홍길동', '메모입니다.', sysdate);

--2. 칼럼리스트의 순서와 값리스트의 순서는 반드시 일치해야 한다.
insert into tblMemo (name, memo, regdate, seq)
values (seqMemo.nextVal, '홍길동', '메모입니다.', sysdate);

--3. 원본 테이블의 컬럼 순서와 insert 컬럼순서는 무관하다.
insert into tblMemo (name, memo, regdate, seq)
values ('홍길동', '메모입니다.', sysdate, seqMemo.nextVal);

--4 [42000][947] ORA-00947: not enough values 컬럼에 맞지 않은 value 개수
insert into tblMemo (seq, name, memo, regdate)
values (seqMemo.nextVal, '홍길동', sysdate);

--5 [42000][913] ORA-00913: too many values 컬럼보다 value가 많다.
insert into tblMemo (seq, name, regdate)
values (seqMemo.nextVal, '홍길동', '메모입니다.', sysdate);
-- column하고 value의 개수는 반드시 일치시켜야 한다.

--6 null 허용 컬럼 조작
insert into tblMemo (seq, name, memo)
values (seqMemo.nextVal, '홍길동', '메모입니다.');
insert into tblMemo (seq, name, memo, regdate)
values (seqMemo.nextVal, '홍길동', '메모입니다.', null);

--7 default값 조작
insert into tblmemo (seq, memo)
values (seqMemo.nextVal, '메모입니다.');
insert into tblMemo (seq, name, memo, regdate)
values (seqMemo.nextVal, '메모입니다.', null);
insert into tblMemo (seq, memo, regdate)
values (seqMemo.nextVal, '메모입니다.', null);
--defalut 상수
insert into tblMemo (seq, name, memo, regdate)
values (seqMemo.nextVal, default, '메모입니다.', default);

--8 컬럼리스트 생략 표현 // 가독성에 있어 불편함. 어떤열에 어떤 값이 들어가야 되는데??
insert into tblMemo
values (seqMemo.nextVal, '홍길동', '메모입니다.', sysdate)
insert into tblMemo
values (seqMemo.nextVal, '홍길동', '메모입니다.'); --생략 표현은 테이블에 정의된 모든 속성
insert into tblMemo
values ('홍길동', '메모입니다.', sysdate, seqMemo.nextval);
--순서 변경 불가

--9. 서브 쿼리
create table tblMemoCopy
(
    seq     number primary key,
    name    varchar2(30) default '익명'    not null,
    memo    varchar2(1000)               not null,
    regdate date         default sysdate null
);

insert into tblMemoCopy
select *
from tblMemo;

select *
from tblMemoCopy;

CREATE TABLE tblComedianMale
(
    first  varchar2(20)                             not null,
    last   varchar2(20)                             not null,
    gender varchar2(1) check (gender in ('m', 'f')) not null,
    height number                                   not null,
    weight number                                   not null,
    nick   varchar2(50)                             not null
);

-- tblComedian 테이블에서 남자만 추출해서 따로 테이블을 만들어라
insert into tblComedianMale
select *
from tblComedian
where gender = 'm';
select *
from tblComedianMale;

-- 테이블 만들기 + 데이터 추가하기
-- 테이블 생성 시 제약 사항이 복사가 안된다.*************************
-- 유효치 않은 데이터 삽입을 방지 못함 -> 테이블로서의 가치가 떨어짐
-- 실제 사용하는 용도의 테이블이 아닌 개발자 테스트 위한 0임시 테이블 사용 (더미용)
--

create table tblComedianFemale
as
select *
from tblComedian
where gender = 'f';

select *
from tblComedianFemale;

-- 절대 하면 안되는 행동 -> PK는 절대로 수정해서는 안된다.
-- 주민등록번호를 마음대로 수정하는것과 같은 행동
SELECT * FROM TBLINSA;
UPDATE TBLINSA SET
NUM = 2000
WHERE NUM = 1001;


























