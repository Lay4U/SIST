-- ex14_sequence.sql

/*

시퀀스, Sequence
- 데이터베이스 객체 중 하나
- 식별자를 만드는데 주로 사용 > PK 컬럼에서 잘 사용
- 일련번호를 만들어서 제공하는 객체(중복되지 않은 번호)
- 오라클 전용

시퀀스 객체 만들기
- cerate sequence 시퀀스명;

시퀀스 객체 삭제하기
- drop sequence 시퀀스명;

시퀀스 객체 사용하기
- 시퀀스명.nextVal 함수(***)
- 시퀀스명.currVal 함수

*/

create sequence seqNum;

select seqNum.nextVal from dual; --계수기

select 'A' || seqNum.nextVal from dual; --상품번호, 주문번호
select 'A' || trim(to_char(seqNum.nextVal, '000')) from dual; -- A001, A002, A003..



--
select seqNum.currVal from dual; --39(자바 Queue.peek())






/*

시퀀스 상세 설정

- create sequence 시퀀스명;

- create sequence 시퀀스명
    increment by n -- 증감치(양수,음수)
    start with n -- 시작값(seed)
    maxvalue n --최댓값(넘어가면 에러)
    minvalue n --최솟값(넘어가면 에러)
    cycle --순환구조(PK 써먹기에 곤란함;;)
    cache n;

*/

drop sequence seqTest;

create sequence seqTest 
        increment by 1
        start with 1
        maxvalue 10
        cycle
        cache 20;

select seqTest.nextVal from dual;


create sequence seqA
    maxvalue 10
    cycle
    cache 5;

create sequence seqB
    maxvalue 5
    cycle
    cache 3;

select 'ABC' || trim(to_char(seqA.nextVal, '00')) || trim(to_char(seqB.nextVal, '00')) from dual;
--ABC0101
--ABC0202
--ABC0505
--ABC0601
--ABC0702


drop sequence seqNum;

create sequence seqNum;

select seqNum.nextVal from dual; -- 5 -> ?? -> 21

--ORA-08002: 시퀀스 SEQNUM.CURRVAL은 이 세션에서는 정의 되어 있지 않습니다
-- currVal 함수는 반드시 1번 이상의 nextVal가 호출해야만 동작이 된다.
select seqNum.currVal from dual; 


/*

오라클 서버를 중지하는 방법
1. Win+R > services.msc > OracleServiceXE 중지
2. 메뉴 > Stop Database
3. cmd > net stop OracleServiceXE

오라클 서버를 시작하는 방법
1. Win+R > services.msc > OracleServiceXE 시작
2. 메뉴 > Start Database
3. cmd > net start OracleServiceXE

*/


-- 메모 번호: seqMemo.nextVal
-- 중복이 되면 안되는 번호(*******)
-- 1, 2, 3, 4, 5... 21, 22, 23, 24..
-- 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23..

drop sequence seqNum;

create sequence seqNum start with 125;

select seqNum.nextVal from dual;

/*


들여쓰기나 대소문자에 관해 표준이 되는 coding convention이 정해져 있는지도 궁금합니다.. 그냥 일하는 회사에 맞춰서 사용하면 될까요?
- 프로젝트 단위

실제 상용화된 서비스 하는 환경에서 DB가 뻑나서 죽는 경우가 있는지 궁금합니다.
(DB 가용성..은 이론적으로는 DB서버는 절대 죽으면 안된다라고만 알고있어서요..)



*/








































